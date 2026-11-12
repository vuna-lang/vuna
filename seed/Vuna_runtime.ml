let () =
  let c = Gc.get () in
  Gc.set { c with minor_heap_size = 16 * 1024 * 1024; space_overhead = 200 }
let () =
  if (try Sys.getenv "VN_PERF_STATS" with Not_found -> "") <> "" then
    at_exit (fun () ->
      let s = Gc.quick_stat () in
      Printf.eprintf "VN_PERF minor_words=%.0f major_words=%.0f minor_collections=%d major_collections=%d top_heap_words=%d\n"
        s.Gc.minor_words s.Gc.major_words s.Gc.minor_collections s.Gc.major_collections s.Gc.top_heap_words)
let bi_add a b = a + b
let bi_sub a b = a - b
let bi_mul a b = a * b
let bi_div a b = if b = 0 then failwith "division by zero" else a / b
let bi_eq_int (a : int) (b : int) = a = b
let bi_neq_int (a : int) (b : int) = a <> b
let bi_eq_str (a : string) (b : string) = a = b
let bi_neq_str (a : string) (b : string) = a <> b
let bi_strFromInt (n : int) = string_of_int n
let bi_strLength (s : string) = String.length s
let bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])
let bi_strPack (cs : int list) =
  let a = Array.of_list cs in
  String.init (Array.length a) (fun i -> Char.chr a.(i))
let bi_lt_int (a : int) (b : int) = a < b
let bi_le_int (a : int) (b : int) = a <= b
let bi_gt_int (a : int) (b : int) = a > b
let bi_ge_int (a : int) (b : int) = a >= b
let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0
let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0
let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0
let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0
let bi_concat a b = a ^ b
let bi_and a b = a && b
let bi_or a b = a || b
let bi_bitAnd (a : int) (b : int) = a land b
let bi_bitOr (a : int) (b : int) = a lor b
let bi_bitXor (a : int) (b : int) = a lxor b
let bi_bitNot (a : int) = lnot a
let bi_bitShl (a : int) (n : int) = if n < 0 || n >= 63 then 0 else a lsl n
let bi_bitShr (a : int) (n : int) = if n < 0 || n >= 63 then 0 else a lsr n
let bi_natSucc (n : int) = if n >= max_int then max_int else n + 1
let bi_natAdd (a : int) (b : int) = if a > max_int - b then max_int else a + b
let bi_natSub (a : int) (b : int) = if a <= b then 0 else a - b
let bi_natMul (a : int) (b : int) =
  if a <= 0 || b <= 0 then 0 else if a > max_int / b then max_int else a * b
let bi_natDiv (a : int) (b : int) = if b = 0 then failwith "division by zero" else a / b
let bi_natToInt (n : int) = n
let bi_natFromInt (n : int) = if n <= 0 then 0 else n
let dt_show_bool b = if b then "True" else "False"
let dt_show_string s =
  let buf = Buffer.create 16 in
  Buffer.add_char buf (Char.chr 34);
  String.iter (fun c ->
    let n = Char.code c in
    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))
    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))
    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ "n")
    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ "t")
    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ "r")
    else Buffer.add_char buf c) s;
  Buffer.add_char buf (Char.chr 34);
  Buffer.contents buf
type _ Effect.t += Perform : string * string * Obj.t -> Obj.t Effect.t

(* W7：bracket 的 abort cleanup 登记表（每纤程一份，LIFO）。
   `prim_effectHandle` 在安装 handler 时记下当前深度 mark；handler 正常返回 /
   抛异常 / 丢弃续延（abort）时，把 mark 之上仍未弹出的 cleanup 逐个执行——这些
   正是被丢弃的续延里打开的 bracket。纤程用 `dtp_cleanup_fiber` 区分（调度器在
   运行某个任务时设置它）；非调度器上下文（-1）有一份独立栈。
   注意：cleanup 在 handler 退出点执行，只能访问**外层** handler（当前 handler
   的效应在该点不可用）；执行期异常被吞掉，避免污染 abort 结果。 *)
let dtp_cleanup_fiber = ref (-1)
let dtp_cleanup_stacks : (int, (unit -> unit) list ref) Hashtbl.t = Hashtbl.create 8
let dtp_cleanup_stack_of (fid : int) =
  match Hashtbl.find_opt dtp_cleanup_stacks fid with
  | Some r -> r
  | None ->
    let r = ref [] in
    Hashtbl.replace dtp_cleanup_stacks fid r;
    r
let dtp_cleanup_current () = dtp_cleanup_stack_of !dtp_cleanup_fiber
let dtp_cleanup_mark () = List.length !(dtp_cleanup_current ())
let dtp_cleanup_push (f : int -> int) : int =
  let r = dtp_cleanup_current () in
  r := (fun () -> ignore (f 0)) :: !r;
  0
let dtp_cleanup_pop (_ : int) : int =
  let r = dtp_cleanup_current () in
  (match !r with _ :: rest -> r := rest | [] -> ());
  0
let dtp_cleanup_run_to (mark : int) =
  let r = dtp_cleanup_current () in
  let rec go fuel =
    if fuel <= 0 then ()
    else if List.length !r <= mark then ()
    else match !r with
      | [] -> ()
      | f :: rest -> r := rest; (try f () with _ -> ()); go (fuel - 1)
  in
  go 256
let dtp_cleanup_run_all_for (fid : int) =
  let r = dtp_cleanup_stack_of fid in
  let rec go fuel =
    if fuel <= 0 then ()
    else match !r with
      | [] -> ()
      | f :: rest -> r := rest; (try f () with _ -> ()); go (fuel - 1)
  in
  go 256
let dtp_cleanup_forget (fid : int) = Hashtbl.remove dtp_cleanup_stacks fid
let dtp_cleanup_reset () =
  Hashtbl.reset dtp_cleanup_stacks;
  dtp_cleanup_fiber := -1

(* handler 的运行时壳：与旧内联实现等价，但 handler 退出时清掉其 extent 内残留的
   bracket cleanup（abort = 续延被丢弃，库层 finally 不会再跑）。 *)
let dtp_effect_handle key name ret h th =
  fun u ->
    let mark = dtp_cleanup_mark () in
    let run_cleanups () = dtp_cleanup_run_to mark in
    (* 外层 Obj.magic 与旧内联实现一致：effc 的 continue 返回 Obj.t，去掉它会让
       handler 的 answer 类型被钉成 Obj.t。 *)
    Obj.magic
      (match Effect.Deep.match_with (fun () -> (Obj.magic th) u) ()
        { retc = (fun x -> (Obj.magic ret) x);
          exnc = (fun e -> raise e);
          effc = (fun (type a) (eff : a Effect.t) -> match eff with
            | Perform (k, n, payload) when k = key && n = name ->
              Some (fun (cont : (a, Obj.t) Effect.Deep.continuation) ->
                (Obj.magic h) payload (fun v -> Effect.Deep.continue cont (Obj.repr v)))
            | _ -> None) }
      with
      | r -> run_cleanups (); r
      | exception e -> run_cleanups (); raise e)
let dtp_print s = print_string s; flush stdout; String.length s
let dtp_async_tbl : (int, unit -> Obj.t) Hashtbl.t = Hashtbl.create 16
let dtp_async_next = ref 0
let dtp_async_fork th =
  let id = !dtp_async_next in
  incr dtp_async_next;
  let d = Domain.spawn (fun () -> th 0) in
  Hashtbl.replace dtp_async_tbl id (fun () -> Obj.repr (Domain.join d));
  id
let dtp_async_await (h : int) : Obj.t =
  match Hashtbl.find_opt dtp_async_tbl h with
  | Some join -> join ()
  | None -> failwith "async: invalid task handle"
let dtp_readFile path =
  try
    let ch = open_in_bin path in
    Fun.protect ~finally:(fun () -> close_in_noerr ch)
      (fun () -> really_input_string ch (in_channel_length ch))
  with Sys_error msg -> failwith ("readFile: " ^ msg)
let dtp_writeFile path contents =
  try
    let ch = open_out_bin path in
    Fun.protect ~finally:(fun () -> close_out_noerr ch)
      (fun () -> output_string ch contents);
    String.length contents
  with Sys_error msg -> failwith ("writeFile: " ^ msg)
let dtp_writeFileAtomic path contents =
  let tmp = path ^ "." ^ string_of_int (Unix.getpid ()) ^ ".tmp" in
  let write () =
    let ch = open_out_bin tmp in
    Fun.protect ~finally:(fun () -> close_out_noerr ch) (fun () -> output_string ch contents) in
  (try write (); Sys.rename tmp path; String.length contents
   with e -> (try Sys.remove tmp with _ -> ()); raise e)
let dtp_getArgs () =
  let argv = Sys.argv in
  let n = Array.length argv in
  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))
let dtp_readLine () = try input_line stdin with End_of_file -> ""
let dtp_readBytes n =
  if n <= 0 then ""
  else
    let b = Bytes.create n in
    let k = try input stdin b 0 n with _ -> 0 in
    if k <= 0 then "" else Bytes.sub_string b 0 k
let dtp_readDir path =
  try List.sort compare (Array.to_list (Sys.readdir path))
  with Sys_error msg -> failwith ("readDir: " ^ msg)
let dtp_isDirectory path =
  try Sys.is_directory path with Sys_error msg -> failwith ("isDirectory: " ^ msg)
let dtp_makeDir path =
  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))
  with Sys_error msg -> failwith ("makeDir: " ^ msg)
let dtp_removeFile path =
  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)
  with Sys_error msg -> failwith ("removeFile: " ^ msg)
let dtp_fileExists path = Sys.file_exists path
let dtp_fileMtime path =
  try int_of_float (Unix.stat path).Unix.st_mtime with _ -> 0
let dtp_fileSize path =
  try (Unix.stat path).Unix.st_size with _ -> 0
let dtp_timeUs () = int_of_float (Unix.gettimeofday () *. 1000000.0)
let dtp_sleep us =
  (if us > 0 then Unix.sleepf (float_of_int us /. 1000000.0));
  0
let dtp_getenv k = try Sys.getenv k with Not_found -> ""
let dtp_getcwd () = try Sys.getcwd () with _ -> "."
let dtp_execPath () = try Unix.readlink "/proc/self/exe" with _ -> Sys.executable_name
let dtp_arraySet (a : 'a array) (i : int) (v : 'a) =
  let b = Array.copy a in
  Array.set b i v; b
let dtp_strHash (s : string) =
  let h = ref 0 in
  String.iter (fun c -> h := ((!h * 33) + Char.code c) land 1023) s;
  !h
let dtp_strAt (s : string) (i : int) = if i < 0 || i >= String.length s then -1 else Char.code s.[i]
let dtp_substring start len s =
  let n = String.length s in
  let st = if start < 0 then 0 else if start > n then n else start in
  let ln = if len < 0 then 0 else if st + len > n then n - st else len in
  String.sub s st ln
let dtp_exit n = exit n
let dtp_runIn dir args =
  let quote s = Filename.quote s in
  let cmd = String.concat " " (List.map quote args) in
  let old = Sys.getcwd () in
  Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)
let dtp_spawn (args : string list) : int =
  let prog = Sys.executable_name in
  Unix.create_process prog (Array.of_list (prog :: args)) Unix.stdin Unix.stdout Unix.stderr
let dtp_wait (pid : int) : int =
  let (_, st) = Unix.waitpid [] pid in
  match st with Unix.WEXITED c -> c | _ -> 1
let dtp_net_tbl : (int, Unix.file_descr) Hashtbl.t = Hashtbl.create 16
let dtp_net_next = ref 1
let dtp_net_put (fd : Unix.file_descr) : int =
  let k = !dtp_net_next in
  dtp_net_next := k + 1;
  Hashtbl.replace dtp_net_tbl k fd;
  k
let dtp_net_get (h : int) : Unix.file_descr =
  match Hashtbl.find_opt dtp_net_tbl h with
  | Some fd -> fd
  | None -> failwith "net: invalid handle"
let dtp_net_drop (h : int) = (try Hashtbl.remove dtp_net_tbl h with _ -> ())
let dtp_net_error (what : string) (e : exn) : 'a =
  match e with
  | Unix.Unix_error (ue, fn, arg) ->
    failwith ("net: " ^ what ^ ": " ^ Unix.error_message ue ^ (if arg = "" then "" else " (" ^ arg ^ ")"))
  | _ -> failwith ("net: " ^ what ^ ": " ^ Printexc.to_string e)
let dtp_net_parse (addr : string) =
  let n = String.length addr in
  if n > 5 && String.sub addr 0 5 = "unix:" then `Unix (String.sub addr 5 (n - 5))
  else if n > 4 && String.sub addr 0 4 = "tcp:" then
    let rest = String.sub addr 4 (n - 4) in
    (match (try Some (String.rindex rest ':') with Not_found -> None) with
     | None -> failwith ("net: invalid address (want tcp:HOST:PORT or unix:PATH): " ^ addr)
     | Some i ->
       let host = String.sub rest 0 i in
       let portstr = String.sub rest (i + 1) (String.length rest - i - 1) in
       let port = try int_of_string portstr with _ -> failwith ("net: invalid port: " ^ portstr) in
       `Tcp (host, port))
  else failwith ("net: invalid address (want tcp:HOST:PORT or unix:PATH): " ^ addr)
let dtp_net_listen (addr : string) : int =
  match dtp_net_parse addr with
  | `Unix path ->
    (try if Sys.file_exists path then Sys.remove path with _ -> ());
    let s = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in
    (try Unix.bind s (Unix.ADDR_UNIX path); Unix.listen s 8; dtp_net_put s
     with e -> (try Unix.close s with _ -> ()); dtp_net_error "listen" e)
  | `Tcp (host, port) ->
    let s = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0 in
    (try
       Unix.setsockopt s Unix.SO_REUSEADDR true;
       Unix.bind s (Unix.ADDR_INET (Unix.inet_addr_of_string host, port));
       Unix.listen s 8;
       dtp_net_put s
     with e -> (try Unix.close s with _ -> ()); dtp_net_error "listen" e)
let dtp_net_port (h : int) : int =
  match Unix.getsockname (dtp_net_get h) with
  | Unix.ADDR_INET (_, p) -> p
  | Unix.ADDR_UNIX _ -> 0
let dtp_net_accept (h : int) : int =
  (try let (fd, _) = Unix.accept (dtp_net_get h) in dtp_net_put fd
   with e -> dtp_net_error "accept" e)
let dtp_net_recv (h : int) (n : int) : string =
  if n <= 0 then ""
  else
    let b = Bytes.create n in
    (try
       let k = Unix.read (dtp_net_get h) b 0 n in
       if k <= 0 then "" else Bytes.sub_string b 0 k
     with e -> dtp_net_error "recv" e)
let dtp_net_send (h : int) (s : string) : int =
  let fd = dtp_net_get h in
  let n = String.length s in
  let rec go off =
    if off >= n then ()
    else
      let k = (try Unix.write_substring fd s off (n - off) with e -> dtp_net_error "send" e) in
      if k <= 0 then failwith "net: send: connection closed" else go (off + k)
  in
  go 0; n
let dtp_net_close (h : int) : int =
  (try Unix.close (dtp_net_get h) with _ -> ());
  dtp_net_drop h; 0
let dtp_net_connect (addr : string) : int =
  match dtp_net_parse addr with
  | `Unix path ->
    let s = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in
    (try Unix.connect s (Unix.ADDR_UNIX path); dtp_net_put s
     with e -> (try Unix.close s with _ -> ()); dtp_net_error "connect" e)
  | `Tcp (host, port) ->
    let s = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0 in
    (try Unix.connect s (Unix.ADDR_INET (Unix.inet_addr_of_string host, port)); dtp_net_put s
     with e -> (try Unix.close s with _ -> ()); dtp_net_error "connect" e)
(* ------------------------------------------------------------------ *)
(* W9: single-threaded cooperative fiber scheduler (Layer 3).          *)
(*                                                                     *)
(* Fibers are one-shot OCaml 5 continuations captured by the root      *)
(* Effect.Deep handler installed for every fiber. The scheduler loop   *)
(* outside the fibers decides what runs next; suspension is requested  *)
(* through private runtime effects (SchedYield/SchedAwait/WaitScope).  *)
(* Tasks are `Eff Nil a` thunks: their user effects are handled       *)
(* inside the fiber, and only the scheduler primitives cross fibers.   *)
(* ------------------------------------------------------------------ *)

type _ Effect.t +=
  | SchedYield : int Effect.t
  | SchedAwait : int -> int Effect.t
  | SchedWaitScope : int -> int Effect.t
  | SchedWaitScopeTimeout : int * int -> int Effect.t

type dtp_sched_step =
  | SchedStepYield of Obj.t
  | SchedStepAwait of int * Obj.t
  | SchedStepScope of int * Obj.t
  | SchedStepScopeTimeout of int * int * Obj.t
  | SchedStepDone of Obj.t
  | SchedStepFailed of exn * Printexc.raw_backtrace

type dtp_sched_wait = SchedWaitNone | SchedWaitTask of int | SchedWaitScope of int | SchedWaitTimed

type dtp_sched_state =
  | SchedQueued of Obj.t
  | SchedRunning
  | SchedSuspended
  | SchedDone of Obj.t
  | SchedFailed of exn * Printexc.raw_backtrace
  | SchedCancelled

type dtp_sched_task = {
  sched_tid : int;
  mutable sched_state : dtp_sched_state;
  mutable sched_start : (unit -> Obj.t) option;
  mutable sched_cont : Obj.t option;
  sched_scope : int;
  mutable sched_wait : dtp_sched_wait;
  mutable sched_waiters : int list;
  mutable sched_cancel : bool;
  mutable sched_grace : int;
}

type dtp_sched_scope = {
  sched_sid : int;
  mutable sched_tasks : int list;
  mutable sched_failed : string option;
  mutable sched_waiters : int list;
  mutable sched_timeout : bool;
  mutable sched_completed : int;
}

let dtp_sched_tasks : (int, dtp_sched_task) Hashtbl.t = Hashtbl.create 64
let dtp_sched_scopes : (int, dtp_sched_scope) Hashtbl.t = Hashtbl.create 16
let dtp_sched_ready : int Queue.t = Queue.create ()
let dtp_sched_next_task = ref 0
let dtp_sched_next_scope = ref 0
let dtp_sched_timeouts : (int * int * int) list ref = ref []
let dtp_sched_main_tid = ref 0
let dtp_sched_current = ref (-1)
let dtp_sched_main_result : Obj.t option ref = ref None
let dtp_sched_main_exn : (exn * Printexc.raw_backtrace) option ref = ref None
let dtp_sched_grace_steps = 64

let dtp_sched_reset () =
  Hashtbl.reset dtp_sched_tasks;
  Hashtbl.reset dtp_sched_scopes;
  dtp_cleanup_reset ();
  Queue.clear dtp_sched_ready;
  dtp_sched_next_task := 0;
  dtp_sched_next_scope := 0;
  dtp_sched_timeouts := [];
  dtp_sched_main_tid := 0;
  dtp_sched_current := -1;
  dtp_sched_main_result := None;
  dtp_sched_main_exn := None

let dtp_sched_task id =
  match Hashtbl.find_opt dtp_sched_tasks id with
  | Some t -> t
  | None -> failwith "scheduler: invalid task handle"

let dtp_sched_scope id =
  match Hashtbl.find_opt dtp_sched_scopes id with
  | Some s -> s
  | None -> failwith "scheduler: invalid scope handle"

let dtp_sched_exn_msg e =
  match e with
  | Effect.Unhandled (Perform (key, name, _)) ->
    Printf.sprintf "unhandled effect %s (instance %s)" key name
  | Failure m -> m
  | _ -> Printexc.to_string e

let dtp_sched_task_status t =
  if t.sched_cancel then 1
  else match t.sched_state with
    | SchedDone _ -> 0
    | SchedFailed _ -> 2
    | SchedCancelled -> 1
    | _ -> 0

let dtp_sched_enqueue t v =
  t.sched_state <- SchedQueued v;
  Queue.push t.sched_tid dtp_sched_ready

let dtp_sched_wake_scope s =
  if s.sched_tasks = [] && s.sched_waiters <> [] then begin
    let status =
      if s.sched_timeout then 2
      else if s.sched_failed <> None then 1
      else 0
    in
    let ws = s.sched_waiters in
    s.sched_waiters <- [];
    dtp_sched_timeouts := List.filter (fun (w, _, _) -> not (List.mem w ws)) !dtp_sched_timeouts;
    List.iter (fun wid ->
      let w = dtp_sched_task wid in
      w.sched_wait <- SchedWaitNone;
      dtp_sched_enqueue w (Obj.repr status)) ws
  end

let dtp_sched_finish t st =
  t.sched_state <- st;
  t.sched_wait <- SchedWaitNone;
  let ws = t.sched_waiters in
  t.sched_waiters <- [];
  let status = dtp_sched_task_status t in
  List.iter (fun wid ->
    let w = dtp_sched_task wid in
    w.sched_wait <- SchedWaitNone;
    dtp_sched_enqueue w (Obj.repr status)) ws;
  if t.sched_tid = !dtp_sched_main_tid then begin
    match st with
    | SchedDone v -> dtp_sched_main_result := Some v
    | SchedFailed (e, bt) -> dtp_sched_main_exn := Some (e, bt)
    | _ -> ()
  end;
  match Hashtbl.find_opt dtp_sched_scopes t.sched_scope with
  | Some s ->
    s.sched_tasks <- List.filter (fun x -> x <> t.sched_tid) s.sched_tasks;
    s.sched_completed <- s.sched_completed + 1;
    dtp_sched_wake_scope s
  | None -> ()

let dtp_sched_remove_waiter t =
  match t.sched_wait with
  | SchedWaitTask id ->
    let tg = dtp_sched_task id in
    tg.sched_waiters <- List.filter (fun x -> x <> t.sched_tid) tg.sched_waiters
  | SchedWaitScope id ->
    let s = dtp_sched_scope id in
    s.sched_waiters <- List.filter (fun x -> x <> t.sched_tid) s.sched_waiters
  | SchedWaitTimed | SchedWaitNone -> ()

let dtp_sched_cancel_task t =
  let terminal = match t.sched_state with
    | SchedDone _ | SchedFailed _ | SchedCancelled -> true
    | _ -> false
  in
  if t.sched_cancel || terminal then ()
  else begin
    t.sched_cancel <- true;
    match t.sched_state with
    | SchedQueued _ -> if t.sched_start <> None then dtp_sched_finish t SchedCancelled
      else t.sched_state <- SchedQueued (Obj.repr 1)
    | SchedSuspended ->
      let code = match t.sched_wait with
        | SchedWaitTask _ -> 1
        | SchedWaitScope _ | SchedWaitTimed -> 3
        | SchedWaitNone -> 1
      in
      dtp_sched_remove_waiter t;
      dtp_sched_timeouts := List.filter (fun (w, _, _) -> w <> t.sched_tid) !dtp_sched_timeouts;
      dtp_sched_enqueue t (Obj.repr code)
    | _ -> ()
  end

let dtp_sched_cancel_scope_tasks sid =
  let s = dtp_sched_scope sid in
  List.iter (fun id -> dtp_sched_cancel_task (dtp_sched_task id)) s.sched_tasks

let dtp_sched_effc (type a) (eff : a Effect.t)
  : ((a, Obj.t) Effect.Deep.continuation -> Obj.t) option =
  match eff with
  | SchedYield -> Some (fun k -> Obj.repr (SchedStepYield (Obj.repr k)))
  | SchedAwait id -> Some (fun k -> Obj.repr (SchedStepAwait (id, Obj.repr k)))
  | SchedWaitScope id -> Some (fun k -> Obj.repr (SchedStepScope (id, Obj.repr k)))
  | SchedWaitScopeTimeout (n, id) ->
    Some (fun k -> Obj.repr (SchedStepScopeTimeout (n, id, Obj.repr k)))
  | _ -> None

let dtp_sched_run_fresh t =
  let start = match t.sched_start with
    | Some f -> f
    | None -> failwith "scheduler: no start thunk" in
  t.sched_start <- None;
  let r = Effect.Deep.match_with
      (fun () -> start ())
      ()
      { retc = (fun x -> Obj.repr (SchedStepDone x));
        exnc = (fun e -> Obj.repr (SchedStepFailed (e, Printexc.get_raw_backtrace ())));
        effc = dtp_sched_effc } in
  (Obj.obj r : dtp_sched_step)

let dtp_sched_run_resume t v =
  let k = match t.sched_cont with
    | Some rep -> (Obj.magic rep : (Obj.t, Obj.t) Effect.Deep.continuation)
    | None -> failwith "scheduler: no continuation" in
  let r = Effect.Deep.continue k v in
  (Obj.obj r : dtp_sched_step)

let dtp_sched_new_task scope start =
  let id = !dtp_sched_next_task in
  dtp_sched_next_task := id + 1;
  let t = {
    sched_tid = id;
    sched_state = SchedQueued (Obj.repr 0);
    sched_start = Some start;
    sched_cont = None;
    sched_scope = scope;
    sched_wait = SchedWaitNone;
    sched_waiters = [];
    sched_cancel = false;
    sched_grace = dtp_sched_grace_steps;
  } in
  Hashtbl.replace dtp_sched_tasks id t;
  (match Hashtbl.find_opt dtp_sched_scopes scope with
   | Some s -> s.sched_tasks <- id :: s.sched_tasks
   | None -> ());
  Queue.push id dtp_sched_ready;
  t

let dtp_sched_new_scope () =
  let id = !dtp_sched_next_scope in
  dtp_sched_next_scope := id + 1;
  Hashtbl.replace dtp_sched_scopes id {
    sched_sid = id;
    sched_tasks = [];
    sched_failed = None;
    sched_waiters = [];
    sched_timeout = false;
    sched_completed = 0;
  };
  id

let dtp_sched_step t =
  if t.sched_cancel then t.sched_grace <- t.sched_grace - 1;
  if t.sched_cancel && t.sched_grace <= 0 then begin
    (* 硬中止：续延被丢弃，bracket 的库层 finally 不会跑；尽力执行未弹出的
       cleanup（它们只能做无效应/自包含的清理：挂起点之外没有 handler 栈）。 *)
    dtp_cleanup_run_all_for t.sched_tid;
    dtp_cleanup_forget t.sched_tid;
    dtp_sched_finish t SchedCancelled;
    None
  end
  else Some (match t.sched_start with
    | Some _ -> dtp_sched_run_fresh t
    | None -> match t.sched_state with
      | SchedQueued v -> t.sched_state <- SchedRunning; dtp_sched_run_resume t v
      | _ -> failwith "scheduler: bad task state")

let dtp_sched_apply t (st : dtp_sched_step) =
  match st with
  | SchedStepYield krep ->
    t.sched_cont <- Some krep;
    t.sched_wait <- SchedWaitNone;
    dtp_sched_enqueue t (Obj.repr (if t.sched_cancel then 1 else 0))
  | SchedStepAwait (id, krep) ->
    t.sched_cont <- Some krep;
    t.sched_wait <- SchedWaitTask id;
    t.sched_state <- SchedSuspended;
    let tg = dtp_sched_task id in
    tg.sched_waiters <- t.sched_tid :: tg.sched_waiters
  | SchedStepScope (id, krep) ->
    t.sched_cont <- Some krep;
    t.sched_wait <- SchedWaitScope id;
    t.sched_state <- SchedSuspended;
    let s = dtp_sched_scope id in
    s.sched_waiters <- t.sched_tid :: s.sched_waiters
  | SchedStepScopeTimeout (n, id, krep) ->
    t.sched_cont <- Some krep;
    t.sched_wait <- SchedWaitTimed;
    t.sched_state <- SchedSuspended;
    let s = dtp_sched_scope id in
    s.sched_waiters <- t.sched_tid :: s.sched_waiters;
    (* n 是「开始等待之后」的调度步预算：武装这次等待的那一步不算。 *)
    dtp_sched_timeouts := (t.sched_tid, id, n + 1) :: !dtp_sched_timeouts
  | SchedStepDone v ->
    (* 正常结束：bracket 已自行弹出；残留（异常边角）也一并清掉。 *)
    dtp_cleanup_run_all_for t.sched_tid;
    dtp_cleanup_forget t.sched_tid;
    dtp_sched_finish t (if t.sched_cancel then SchedCancelled else SchedDone v)
  | SchedStepFailed (e, bt) ->
    (* 异常穿过纤程根 handler：被丢弃的续延里的 bracket cleanup 在这里兜底。 *)
    dtp_cleanup_run_all_for t.sched_tid;
    dtp_cleanup_forget t.sched_tid;
    if t.sched_tid = !dtp_sched_main_tid then dtp_sched_finish t (SchedFailed (e, bt))
    else begin
      let s = dtp_sched_scope t.sched_scope in
      if s.sched_failed = None then s.sched_failed <- Some (dtp_sched_exn_msg e);
      dtp_sched_finish t (SchedFailed (e, bt));
      dtp_sched_cancel_scope_tasks t.sched_scope
    end

let dtp_sched_tick () =
  let expired = ref [] in
  dtp_sched_timeouts := List.map (fun (w, sc, n) -> (w, sc, n - 1)) !dtp_sched_timeouts;
  dtp_sched_timeouts := List.filter (fun (w, sc, n) ->
    if n > 0 then true else (expired := (w, sc) :: !expired; false)) !dtp_sched_timeouts;
  List.iter (fun (_, sc) ->
    let s = dtp_sched_scope sc in
    if not s.sched_timeout then begin
      s.sched_timeout <- true;
      dtp_sched_cancel_scope_tasks sc
    end) !expired

let dtp_sched_runnable t =
  match t.sched_state with SchedQueued _ -> true | _ -> false

let dtp_sched_run_one t =
  if dtp_sched_runnable t then begin
    dtp_sched_current := t.sched_tid;
    dtp_cleanup_fiber := t.sched_tid;
    (match dtp_sched_step t with
     | Some st -> dtp_sched_apply t st
     | None -> ());
    dtp_cleanup_fiber := -1;
    dtp_sched_current := -1
  end

let dtp_sched_deadlock () = failwith "scheduler: deadlock (no runnable task)"

let dtp_sched_loop () =
  let rec loop () =
    if !dtp_sched_main_result <> None || !dtp_sched_main_exn <> None then ()
    else if Queue.is_empty dtp_sched_ready then dtp_sched_deadlock ()
    else begin
      let tid = Queue.pop dtp_sched_ready in
      dtp_sched_run_one (dtp_sched_task tid);
      dtp_sched_tick ();
      loop ()
    end
  in loop ()

let dtp_sched_drain () =
  let rec loop () =
    if Queue.is_empty dtp_sched_ready then ()
    else begin
      let tid = Queue.pop dtp_sched_ready in
      dtp_sched_run_one (dtp_sched_task tid);
      loop ()
    end
  in loop ()

let dtp_sched_cancel_leftovers () =
  Hashtbl.iter (fun _ t -> match t.sched_state with
    | SchedDone _ | SchedFailed _ | SchedCancelled -> ()
    | _ -> dtp_sched_cancel_task t) dtp_sched_tasks

let dtp_sched_main (th : unit -> 'a) : 'a =
  dtp_sched_reset ();
  ignore (dtp_sched_new_scope ());
  let main = dtp_sched_new_task 0 (fun () -> Obj.repr (th ())) in
  dtp_sched_main_tid := main.sched_tid;
  (try dtp_sched_loop ()
   with e -> dtp_sched_cancel_leftovers (); dtp_sched_drain (); raise e);
  dtp_sched_cancel_leftovers ();
  dtp_sched_drain ();
  match !dtp_sched_main_exn with
  | Some (e, bt) -> Printexc.raise_with_backtrace e bt
  | None -> match !dtp_sched_main_result with
    | Some v -> (Obj.obj v : 'a)
    | None -> failwith "scheduler: main did not finish"

(* scheduler primitives exposed to Base.EffSched through hidden intrinsics *)

let dtp_sched_fork (scope : int) (f : int -> 'a) : int =
  (dtp_sched_new_task scope (fun () -> Obj.repr (f 0))).sched_tid

let dtp_sched_current_task () =
  if !dtp_sched_current < 0 then failwith "scheduler: no current fiber"
  else dtp_sched_task !dtp_sched_current

let dtp_sched_yield () : int = Effect.perform SchedYield

let dtp_sched_is_cancelled () : int =
  match Hashtbl.find_opt dtp_sched_tasks !dtp_sched_current with
  | Some t -> if t.sched_cancel then 1 else 0
  | None -> 0

let dtp_sched_await (id : int) : int =
  let self = dtp_sched_current_task () in
  if self.sched_cancel then begin ignore (Effect.perform SchedYield); 1 end
  else begin
    let target = dtp_sched_task id in
    match target.sched_state with
    | SchedDone _ | SchedFailed _ | SchedCancelled -> dtp_sched_task_status target
    | _ -> Effect.perform (SchedAwait id)
  end

let dtp_sched_task_result (id : int) : 'a =
  match (dtp_sched_task id).sched_state with
  | SchedDone v -> Obj.obj v
  | _ -> failwith "scheduler: task has no result"

let dtp_sched_task_error (id : int) : string =
  match (dtp_sched_task id).sched_state with
  | SchedFailed (e, _) -> dtp_sched_exn_msg e
  | _ -> ""

let dtp_sched_cancel_task_prim (id : int) : int =
  dtp_sched_cancel_task (dtp_sched_task id);
  0

let dtp_sched_cancel_scope (id : int) : int =
  dtp_sched_cancel_scope_tasks id;
  0

let dtp_sched_scope_status (s : dtp_sched_scope) : int =
  if s.sched_timeout then 2
  else if s.sched_failed <> None then 1
  else 0

let dtp_sched_scope_wait (id : int) : int =
  let s = dtp_sched_scope id in
  let self = dtp_sched_current_task () in
  if self.sched_cancel then begin ignore (Effect.perform SchedYield); 3 end
  else if s.sched_tasks = [] then dtp_sched_scope_status s
  else Effect.perform (SchedWaitScope id)

let dtp_sched_scope_wait_timeout (steps : int) (id : int) : int =
  let s = dtp_sched_scope id in
  let self = dtp_sched_current_task () in
  if self.sched_cancel then begin ignore (Effect.perform SchedYield); 3 end
  else if s.sched_tasks = [] then dtp_sched_scope_status s
  else if steps <= 0 then begin
    s.sched_timeout <- true;
    dtp_sched_cancel_scope_tasks id;
    Effect.perform (SchedWaitScope id)
  end else
    Effect.perform (SchedWaitScopeTimeout (steps, id))

let dtp_sched_scope_error (id : int) : string =
  let s = dtp_sched_scope id in
  match s.sched_failed with
  | Some msg -> msg
  | None -> ""

let dtp_sched_scope_count (id : int) : int =
  (dtp_sched_scope id).sched_completed
let bi_add_float (a : float) (b : float) = a +. b
let bi_sub_float (a : float) (b : float) = a -. b
let bi_mul_float (a : float) (b : float) = a *. b
let bi_div_float (a : float) (b : float) = a /. b
let bi_eq_float (a : float) (b : float) = a = b
let bi_neq_float (a : float) (b : float) = a <> b
let bi_lt_float (a : float) (b : float) = a < b
let bi_le_float (a : float) (b : float) = a <= b
let bi_gt_float (a : float) (b : float) = a > b
let bi_ge_float (a : float) (b : float) = a >= b
let dt_def_locs = [
  ("v_Show_uString", ("Show_String", "Base/Show.vuna:22"));
  ("v_DebugShow_ua", ("DebugShow_a", "Base/Show.vuna:31"));
  ("v_Show_uBase_uBool_uBool", ("Show_Base_Bool_Bool", "Base/Bool.vuna:48"));
  ("v_Hashable_uBase_uBool_uBool", ("Hashable_Base_Bool_Bool", "Base/Bool.vuna:52"));
  ("v_Eq_uBase_uBool_uBool", ("Eq_Base_Bool_Bool", "Base/Eq.vuna:25"));
  ("v_Ord_uBase_uBool_uBool", ("Ord_Base_Bool_Bool", "Base/Ord.vuna:35"));
  ("v_Eq_uBase_uOrd_uOrdering", ("Eq_Base_Ord_Ordering", "Base/Ord.vuna:54"));
  ("v_Ord_uBase_uOrd_uOrdering", ("Ord_Base_Ord_Ordering", "Base/Ord.vuna:61"));
  ("v_Show_uBase_uOrd_uOrdering", ("Show_Base_Ord_Ordering", "Base/Ord.vuna:76"));
  ("v_Hashable_uBase_uOrd_uOrdering", ("Hashable_Base_Ord_Ordering", "Base/Ord.vuna:94"));
  ("v_Show_uBase_uPair_uPair_ua_ub", ("Show_Base_Pair_Pair_a_b", "Base/Pair.vuna:30"));
  ("v_Eq_uBase_uPair_uPair_ua_ub", ("Eq_Base_Pair_Pair_a_b", "Base/Pair.vuna:35"));
  ("v_Ord_uBase_uPair_uPair_ua_ub", ("Ord_Base_Pair_Pair_a_b", "Base/Pair.vuna:39"));
  ("v_Hashable_uBase_uPair_uPair_ua_ub", ("Hashable_Base_Pair_Pair_a_b", "Base/Pair.vuna:45"));
  ("v_Functor_uBase_uMaybe_uMaybe", ("Functor_Base_Maybe_Maybe", "Base/Maybe.vuna:47"));
  ("v_Monad_uBase_uMaybe_uMaybe", ("Monad_Base_Maybe_Maybe", "Base/Maybe.vuna:52"));
  ("v_Applicative_uBase_uMaybe_uMaybe", ("Applicative_Base_Maybe_Maybe", "Base/Maybe.vuna:57"));
  ("v_Show_uBase_uMaybe_uMaybe_ua", ("Show_Base_Maybe_Maybe_a", "Base/Maybe.vuna:74"));
  ("v_Eq_uBase_uMaybe_uMaybe_ua", ("Eq_Base_Maybe_Maybe_a", "Base/Maybe.vuna:80"));
  ("v_Ord_uBase_uMaybe_uMaybe_ua", ("Ord_Base_Maybe_Maybe_a", "Base/Maybe.vuna:87"));
  ("v_Hashable_uBase_uMaybe_uMaybe_ua", ("Hashable_Base_Maybe_Maybe_a", "Base/Maybe.vuna:96"));
  ("v_Semigroup_uBase_uMaybe_uMaybe_ua", ("Semigroup_Base_Maybe_Maybe_a", "Base/Maybe.vuna:101"));
  ("v_Monoid_uBase_uMaybe_uMaybe_ua", ("Monoid_Base_Maybe_Maybe_a", "Base/Maybe.vuna:108"));
  ("v_Foldable_uBase_uMaybe_uMaybe", ("Foldable_Base_Maybe_Maybe", "Base/Maybe.vuna:111"));
  ("v_Traversable_uBase_uMaybe_uMaybe_uf", ("Traversable_Base_Maybe_Maybe_f", "Base/Maybe.vuna:116"));
  ("v_Eq_uInt", ("Eq_Int", "Base/Int.vuna:22"));
  ("v_Ord_uInt", ("Ord_Int", "Base/Int.vuna:26"));
  ("v_Num_uInt", ("Num_Int", "Base/Int.vuna:34"));
  ("v_Show_uInt", ("Show_Int", "Base/Int.vuna:41"));
  ("v_Hashable_uInt", ("Hashable_Int", "Base/Int.vuna:45"));
  ("v_Eq_uBase_uNat_uNat", ("Eq_Base_Nat_Nat", "Base/Nat.vuna:62"));
  ("v_Ord_uBase_uNat_uNat", ("Ord_Base_Nat_Nat", "Base/Nat.vuna:66"));
  ("v_Num_uBase_uNat_uNat", ("Num_Base_Nat_Nat", "Base/Nat.vuna:75"));
  ("v_Show_uBase_uNat_uNat", ("Show_Base_Nat_Nat", "Base/Nat.vuna:81"));
  ("v_Hashable_uBase_uNat_uNat", ("Hashable_Base_Nat_Nat", "Base/Nat.vuna:84"));
  ("v_Semigroup_uBase_uNat_uNat", ("Semigroup_Base_Nat_Nat", "Base/Nat.vuna:87"));
  ("v_Monoid_uBase_uNat_uNat", ("Monoid_Base_Nat_Nat", "Base/Nat.vuna:90"));
  ("v_Functor_uBase_uList_uList", ("Functor_Base_List_List", "Base/List.vuna:160"));
  ("v_Monad_uBase_uList_uList", ("Monad_Base_List_List", "Base/List.vuna:163"));
  ("v_Applicative_uBase_uList_uList", ("Applicative_Base_List_List", "Base/List.vuna:166"));
  ("v_Show_uBase_uList_uList_ua", ("Show_Base_List_List_a", "Base/List.vuna:185"));
  ("v_Eq_uBase_uList_uList_ua", ("Eq_Base_List_List_a", "Base/List.vuna:189"));
  ("v_Ord_uBase_uList_uList_ua", ("Ord_Base_List_List_a", "Base/List.vuna:196"));
  ("v_Hashable_uBase_uList_uList_ua", ("Hashable_Base_List_List_a", "Base/List.vuna:206"));
  ("v_Semigroup_uBase_uList_uList_ua", ("Semigroup_Base_List_List_a", "Base/List.vuna:212"));
  ("v_Monoid_uBase_uList_uList_ua", ("Monoid_Base_List_List_a", "Base/List.vuna:215"));
  ("v_Foldable_uBase_uList_uList", ("Foldable_Base_List_List", "Base/List.vuna:219"));
  ("v_Traversable_uBase_uList_uList_uf", ("Traversable_Base_List_List_f", "Base/List.vuna:222"));
  ("v_Interp_ua", ("Interp_a", "Base/Interp.vuna:26"));
  ("v_Interp_uString", ("Interp_String", "Base/Interp.vuna:30"));
  ("v_Eq_uString", ("Eq_String", "Base/String.vuna:160"));
  ("v_Ord_uString", ("Ord_String", "Base/String.vuna:164"));
  ("v_Hashable_uString", ("Hashable_String", "Base/String.vuna:171"));
  ("v_Semigroup_uString", ("Semigroup_String", "Base/String.vuna:174"));
  ("v_Monoid_uString", ("Monoid_String", "Base/String.vuna:177"));
  ("v_FromFloat_uFloat", ("FromFloat_Float", "Base/Float.vuna:24"));
  ("v_Eq_uFloat", ("Eq_Float", "Base/Float.vuna:27"));
  ("v_Ord_uFloat", ("Ord_Float", "Base/Float.vuna:31"));
  ("v_Num_uFloat", ("Num_Float", "Base/Float.vuna:39"));
  ("v_Show_uFloat", ("Show_Float", "Base/Float.vuna:46"));
  ("v_FromInt_uInt", ("FromInt_Int", "Base/FromInt.vuna:16"));
  ("v_FromString_uString", ("FromString_String", "Base/FromString.vuna:15"));
  ("v_Functor_uBase_uResult_uResult", ("Functor_Base_Result_Result", "Base/Result.vuna:30"));
  ("v_Monad_uBase_uResult_uResult", ("Monad_Base_Result_Result", "Base/Result.vuna:34"));
  ("v_Applicative_uBase_uResult_uResult", ("Applicative_Base_Result_Result", "Base/Result.vuna:38"));
  ("v_Show_uBase_uResult_uResult_ua", ("Show_Base_Result_Result_a", "Base/Result.vuna:76"));
  ("v_Eq_uBase_uResult_uResult_ua", ("Eq_Base_Result_Result_a", "Base/Result.vuna:83"));
  ("v_Hashable_uBase_uResult_uResult_ua", ("Hashable_Base_Result_Result_a", "Base/Result.vuna:89"));
  ("v_Foldable_uBase_uResult_uResult", ("Foldable_Base_Result_Result", "Base/Result.vuna:94"));
  ("v_Traversable_uBase_uResult_uResult_uf", ("Traversable_Base_Result_Result_f", "Base/Result.vuna:99"));
  ("v_Functor_uBase_uEff_uEff_ur", ("Functor_Base_Eff_Eff_r", "Base/Eff.vuna:82"));
  ("v_Monad_uBase_uEff_uEff_ur", ("Monad_Base_Eff_Eff_r", "Base/Eff.vuna:87"));
  ("v_Applicative_uBase_uEff_uEff_ur", ("Applicative_Base_Eff_Eff_r", "Base/Eff.vuna:93"));
  ("v_Eq_uBase_uUnit_uUnit", ("Eq_Base_Unit_Unit", "Base/Unit.vuna:19"));
  ("v_Ord_uBase_uUnit_uUnit", ("Ord_Base_Unit_Unit", "Base/Unit.vuna:23"));
  ("v_Show_uBase_uUnit_uUnit", ("Show_Base_Unit_Unit", "Base/Unit.vuna:29"));
  ("v_Hashable_uBase_uUnit_uUnit", ("Hashable_Base_Unit_Unit", "Base/Unit.vuna:32"));
  ("v_Semigroup_uBase_uUnit_uUnit", ("Semigroup_Base_Unit_Unit", "Base/Unit.vuna:35"));
  ("v_Monoid_uBase_uUnit_uUnit", ("Monoid_Base_Unit_Unit", "Base/Unit.vuna:38"));
  ("v_Functor_uVuna_uCompiler_uDiag_uCheck", ("Functor_Vuna_Compiler_Diag_Check", "Vuna/Compiler/Diag.vuna:334"));
  ("v_Monad_uVuna_uCompiler_uDiag_uCheck", ("Monad_Vuna_Compiler_Diag_Check", "Vuna/Compiler/Diag.vuna:338"));
  ("v_Applicative_uVuna_uCompiler_uDiag_uCheck", ("Applicative_Vuna_Compiler_Diag_Check", "Vuna/Compiler/Diag.vuna:342"));
  ("v_Functor_uVuna_uCompiler_uCommon_uEffCheck", ("Functor_Vuna_Compiler_Common_EffCheck", "Vuna/Compiler/Common.vuna:47"));
  ("v_Applicative_uVuna_uCompiler_uCommon_uEffCheck", ("Applicative_Vuna_Compiler_Common_EffCheck", "Vuna/Compiler/Common.vuna:50"));
  ("v_Monad_uVuna_uCompiler_uCommon_uEffCheck", ("Monad_Vuna_Compiler_Common_EffCheck", "Vuna/Compiler/Common.vuna:55"));
  ("v_Eq_uArray_ua", ("Eq_Array_a", "Base/Array.vuna:45"));
  ("v_Show_uArray_ua", ("Show_Array_a", "Base/Array.vuna:50"));
  ("v_Show_uBase_uHashMap_uHashMap_uk_uv", ("Show_Base_HashMap_HashMap_k_v", "Base/HashMap.vuna:133"));
  ("v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry", ("Eq_Vuna_Compiler_Loader_Modules_ExportEntry", "Vuna/Compiler/Loader/Modules.vuna:130"));
  ("v_Base_dNum_dadd", ("Base.Num.add", "Base/Num.vuna:24"));
  ("v_Base_dNum_dsub", ("Base.Num.sub", "Base/Num.vuna:26"));
  ("v_Base_dNum_dmul", ("Base.Num.mul", "Base/Num.vuna:28"));
  ("v_Base_dNum_ddiv", ("Base.Num.div", "Base/Num.vuna:30"));
  ("v_Base_dHashable_dhash", ("Base.Hashable.hash", "Base/Hashable.vuna:21"));
  ("v_Base_dShow_dshow", ("Base.Show.show", "Base/Show.vuna:19"));
  ("v_Base_dShow_ddebugShow", ("Base.Show.debugShow", "Base/Show.vuna:28"));
  ("v_Base_dEq_deq", ("Base.Eq.eq", "Base/Eq.vuna:21"));
  ("v_Base_dEq_dneq", ("Base.Eq.neq", "Base/Eq.vuna:22"));
  ("v_Base_dOrd_dlt", ("Base.Ord.lt", "Base/Ord.vuna:29"));
  ("v_Base_dOrd_dle", ("Base.Ord.le", "Base/Ord.vuna:30"));
  ("v_Base_dOrd_dgt", ("Base.Ord.gt", "Base/Ord.vuna:31"));
  ("v_Base_dOrd_dge", ("Base.Ord.ge", "Base/Ord.vuna:32"));
  ("v_Base_dMonoid_dmappend", ("Base.Monoid.mappend", "Base/Monoid.vuna:14"));
  ("v_Base_dMonoid_dmempty", ("Base.Monoid.mempty", "Base/Monoid.vuna:19"));
  ("v_Base_dFoldable_dfold", ("Base.Foldable.fold", "Base/Foldable.vuna:14"));
  ("v_Base_dApplicative_dpure", ("Base.Applicative.pure", "Base/Applicative.vuna:29"));
  ("v_Base_dApplicative_dap", ("Base.Applicative.ap", "Base/Applicative.vuna:31"));
  ("v_Base_dApplicative_dliftA2", ("Base.Applicative.liftA2", "Base/Applicative.vuna:33"));
  ("v_Base_dMonad_dfmap", ("Base.Monad.fmap", "Base/Monad.vuna:23"));
  ("v_Base_dMonad_dbind", ("Base.Monad.bind", "Base/Monad.vuna:27"));
  ("v_Base_dTraversable_dmapM", ("Base.Traversable.mapM", "Base/Traversable.vuna:20"));
  ("v_Base_dInterp_dinterp", ("Base.Interp.interp", "Base/Interp.vuna:23"));
  ("v_Base_dFloat_dfromFloat", ("Base.Float.fromFloat", "Base/Float.vuna:21"));
  ("v_Base_dFromInt_dfromInt", ("Base.FromInt.fromInt", "Base/FromInt.vuna:13"));
  ("v_Base_dFromString_dfromString", ("Base.FromString.fromString", "Base/FromString.vuna:12"));
  ("v_Base_dHashable_dhashStr", ("Base.Hashable.hashStr", "Base/Hashable.vuna:25"));
  ("v_Base_dHashable_dhashCombine", ("Base.Hashable.hashCombine", "Base/Hashable.vuna:29"));
  ("v_Base_dShow_ddbgShow", ("Base.Show.dbgShow", "Base/Show.vuna:38"));
  ("v_Base_dBool_dnot", ("Base.Bool.not", "Base/Bool.vuna:23"));
  ("v_Base_dBool_dand", ("Base.Bool.and", "Base/Bool.vuna:28"));
  ("v_Base_dBool_dor", ("Base.Bool.or", "Base/Bool.vuna:33"));
  ("v_Base_dBool_dxor", ("Base.Bool.xor", "Base/Bool.vuna:38"));
  ("v_Base_dBool_dbool", ("Base.Bool.bool", "Base/Bool.vuna:43"));
  ("v_Base_dOrd_dcompare", ("Base.Ord.compare", "Base/Ord.vuna:84"));
  ("v_Base_dOrd_dmin", ("Base.Ord.min", "Base/Ord.vuna:88"));
  ("v_Base_dOrd_dmax", ("Base.Ord.max", "Base/Ord.vuna:92"));
  ("v_Base_dPair_dfirstOf", ("Base.Pair.firstOf", "Base/Pair.vuna:20"));
  ("v_Base_dPair_dsecondOf", ("Base.Pair.secondOf", "Base/Pair.vuna:24"));
  ("v_Base_dFoldable_dfoldMap", ("Base.Foldable.foldMap", "Base/Foldable.vuna:18"));
  ("v_Base_dMaybe_dfromMaybe", ("Base.Maybe.fromMaybe", "Base/Maybe.vuna:27"));
  ("v_Base_dMaybe_disJust", ("Base.Maybe.isJust", "Base/Maybe.vuna:32"));
  ("v_Base_dMaybe_disNothing", ("Base.Maybe.isNothing", "Base/Maybe.vuna:37"));
  ("v_Base_dMaybe_dmaybe", ("Base.Maybe.maybe", "Base/Maybe.vuna:42"));
  ("v_Base_dNat_dplus", ("Base.Nat.plus", "Base/Nat.vuna:32"));
  ("v_Base_dNat_dminus", ("Base.Nat.minus", "Base/Nat.vuna:36"));
  ("v_Base_dNat_dmult", ("Base.Nat.mult", "Base/Nat.vuna:40"));
  ("v_Base_dNat_dtoInt", ("Base.Nat.toInt", "Base/Nat.vuna:44"));
  ("v_Base_dNat_dfromInt", ("Base.Nat.fromInt", "Base/Nat.vuna:48"));
  ("v_Base_dNat_dfromIntMaybe", ("Base.Nat.fromIntMaybe", "Base/Nat.vuna:52"));
  ("v_Base_dNat_dpred", ("Base.Nat.pred", "Base/Nat.vuna:56"));
  ("v_Base_dNat_disZero", ("Base.Nat.isZero", "Base/Nat.vuna:60"));
  ("v_Base_dList_dappend", ("Base.List.append", "Base/List.vuna:57"));
  ("v_Base_dList_dreverseOnto", ("Base.List.reverseOnto", "Base/List.vuna:62"));
  ("v_Base_dList_dreverse", ("Base.List.reverse", "Base/List.vuna:67"));
  ("v_Base_dList_dlength", ("Base.List.length", "Base/List.vuna:72"));
  ("v_Base_dList_dlengthInt", ("Base.List.lengthInt", "Base/List.vuna:76"));
  ("v_Base_dList_dmap", ("Base.List.map", "Base/List.vuna:81"));
  ("v_Base_dList_dfilter", ("Base.List.filter", "Base/List.vuna:86"));
  ("v_Base_dList_dfoldl", ("Base.List.foldl", "Base/List.vuna:91"));
  ("v_Base_dList_dfoldr", ("Base.List.foldr", "Base/List.vuna:96"));
  ("v_Base_dList_dconcatMap", ("Base.List.concatMap", "Base/List.vuna:104"));
  ("v_Base_dList_dconcatMapGo", ("Base.List.concatMapGo", "Base/List.vuna:108"));
  ("v_Base_dList_dmem", ("Base.List.mem", "Base/List.vuna:113"));
  ("v_Base_dList_dmemName", ("Base.List.memName", "Base/List.vuna:118"));
  ("v_Base_dList_dlookupPair", ("Base.List.lookupPair", "Base/List.vuna:123"));
  ("v_Base_dList_dzip", ("Base.List.zip", "Base/List.vuna:128"));
  ("v_Base_dList_dtake", ("Base.List.take", "Base/List.vuna:133"));
  ("v_Base_dList_ddrop", ("Base.List.drop", "Base/List.vuna:138"));
  ("v_Base_dList_drange", ("Base.List.range", "Base/List.vuna:146"));
  ("v_Base_dList_drangeFrom", ("Base.List.rangeFrom", "Base/List.vuna:150"));
  ("v_Base_dList_dmapMaybe", ("Base.List.mapMaybe", "Base/List.vuna:154"));
  ("v_Base_dList_dshowElems", ("Base.List.showElems", "Base/List.vuna:177"));
  ("v_Base_dList_dshowElemsTail", ("Base.List.showElemsTail", "Base/List.vuna:182"));
  ("v_Base_dString_dbyteLength", ("Base.String.byteLength", "Base/String.vuna:55"));
  ("v_Base_dString_dsplit", ("Base.String.split", "Base/String.vuna:59"));
  ("v_Base_dString_dsplitAcc", ("Base.String.splitAcc", "Base/String.vuna:65"));
  ("v_Base_dString_dskipSep", ("Base.String.skipSep", "Base/String.vuna:73"));
  ("v_Base_dString_djoin", ("Base.String.join", "Base/String.vuna:81"));
  ("v_Base_dString_d_uinterleave", ("Base.String._interleave", "Base/String.vuna:86"));
  ("v_Base_dString_dlines", ("Base.String.lines", "Base/String.vuna:92"));
  ("v_Base_dString_dunlines", ("Base.String.unlines", "Base/String.vuna:96"));
  ("v_Base_dString_dtrimLeft", ("Base.String.trimLeft", "Base/String.vuna:101"));
  ("v_Base_dString_dtrimRight", ("Base.String.trimRight", "Base/String.vuna:105"));
  ("v_Base_dString_dtrim", ("Base.String.trim", "Base/String.vuna:109"));
  ("v_Base_dString_dcontains", ("Base.String.contains", "Base/String.vuna:113"));
  ("v_Base_dString_dstartsWith", ("Base.String.startsWith", "Base/String.vuna:117"));
  ("v_Base_dString_dendsWith", ("Base.String.endsWith", "Base/String.vuna:121"));
  ("v_Base_dString_drepeat", ("Base.String.repeat", "Base/String.vuna:131"));
  ("v_Base_dString_dsubstring", ("Base.String.substring", "Base/String.vuna:137"));
  ("v_Base_dString_d_uisSpace", ("Base.String._isSpace", "Base/String.vuna:140"));
  ("v_Base_dString_d_udropSpace", ("Base.String._dropSpace", "Base/String.vuna:143"));
  ("v_Base_dString_d_ustartsWithChars", ("Base.String._startsWithChars", "Base/String.vuna:147"));
  ("v_Base_dString_d_ucontainsChars", ("Base.String._containsChars", "Base/String.vuna:153"));
  ("v_Base_dFloat_dabs", ("Base.Float.abs", "Base/Float.vuna:51"));
  ("v_Base_dFloat_dsqrt", ("Base.Float.sqrt", "Base/Float.vuna:55"));
  ("v_Base_dFloat_dintToFloat", ("Base.Float.intToFloat", "Base/Float.vuna:59"));
  ("v_Base_dFloat_dfloatToInt", ("Base.Float.floatToInt", "Base/Float.vuna:63"));
  ("v_Base_dResult_dtraverse", ("Base.Result.traverse", "Base/Result.vuna:51"));
  ("v_Base_dResult_dstep", ("Base.Result.step", "Base/Result.vuna:60"));
  ("v_Base_dResult_dmapError", ("Base.Result.mapError", "Base/Result.vuna:65"));
  ("v_Base_dResult_dwithDefault", ("Base.Result.withDefault", "Base/Result.vuna:70"));
  ("v_Base_dEff_drowRem", ("Base.Eff.rowRem", "Base/Eff.vuna:64"));
  ("v_Base_dEff_ddefaultInstance", ("Base.Eff.defaultInstance", "Base/Eff.vuna:69"));
  ("v_Base_dEff_deffPrim", ("Base.Eff.effPrim", "Base/Eff.vuna:109"));
  ("v_Base_dEff_dweaken", ("Base.Eff.weaken", "Base/Eff.vuna:117"));
  ("v_Base_dEff_drunThunk", ("Base.Eff.runThunk", "Base/Eff.vuna:122"));
  ("v_Base_dEff_drunPure", ("Base.Eff.runPure", "Base/Eff.vuna:130"));
  ("v_Base_dEff_drunEff", ("Base.Eff.runEff", "Base/Eff.vuna:136"));
  ("v_Base_dEff_djoinEff", ("Base.Eff.joinEff", "Base/Eff.vuna:141"));
  ("v_Base_dEff_draise", ("Base.Eff.raise", "Base/Eff.vuna:146"));
  ("v_Base_dEff_dsendCore", ("Base.Eff.sendCore", "Base/Eff.vuna:152"));
  ("v_Base_dEff_dperformCore", ("Base.Eff.performCore", "Base/Eff.vuna:161"));
  ("v_Base_dEff_dhandleCore", ("Base.Eff.handleCore", "Base/Eff.vuna:166"));
  ("v_Base_dEff_dresumeCont", ("Base.Eff.resumeCont", "Base/Eff.vuna:174"));
  ("v_Base_dEff_dcontAdapter", ("Base.Eff.contAdapter", "Base/Eff.vuna:179"));
  ("v_Base_dEff_dhandleCoreLin", ("Base.Eff.handleCoreLin", "Base/Eff.vuna:183"));
  ("v_Base_dEff_dresFn", ("Base.Eff.resFn", "Base/Eff.vuna:199"));
  ("v_Base_dEff_dresOf", ("Base.Eff.resOf", "Base/Eff.vuna:203"));
  ("v_Base_dEff_dhandleWith", ("Base.Eff.handleWith", "Base/Eff.vuna:215"));
  ("v_Base_dEff_dhandleWithAt", ("Base.Eff.handleWithAt", "Base/Eff.vuna:226"));
  ("v_Base_dEff_dmkCont", ("Base.Eff.mkCont", "Base/Eff.vuna:237"));
  ("v_Base_dEff_dbracket", ("Base.Eff.bracket", "Base/Eff.vuna:248"));
  ("v_Base_dEff_dfinally", ("Base.Eff.finally", "Base/Eff.vuna:259"));
  ("v_Vuna_dCompiler_dSource_dposLine", ("Vuna.Compiler.Source.posLine", "Vuna/Compiler/Source.vuna:67"));
  ("v_Vuna_dCompiler_dSource_dposCol", ("Vuna.Compiler.Source.posCol", "Vuna/Compiler/Source.vuna:71"));
  ("v_Vuna_dCompiler_dSource_dspanStartLine", ("Vuna.Compiler.Source.spanStartLine", "Vuna/Compiler/Source.vuna:75"));
  ("v_Vuna_dCompiler_dSource_dspanStartCol", ("Vuna.Compiler.Source.spanStartCol", "Vuna/Compiler/Source.vuna:79"));
  ("v_Vuna_dCompiler_dSource_dspanEndLine", ("Vuna.Compiler.Source.spanEndLine", "Vuna/Compiler/Source.vuna:83"));
  ("v_Vuna_dCompiler_dSource_dspanEndCol", ("Vuna.Compiler.Source.spanEndCol", "Vuna/Compiler/Source.vuna:87"));
  ("v_Vuna_dCompiler_dSource_dspanFile", ("Vuna.Compiler.Source.spanFile", "Vuna/Compiler/Source.vuna:91"));
  ("v_Vuna_dCompiler_dSource_dshowSpanLoc", ("Vuna.Compiler.Source.showSpanLoc", "Vuna/Compiler/Source.vuna:95"));
  ("v_Vuna_dCompiler_dSource_dmemChar", ("Vuna.Compiler.Source.memChar", "Vuna/Compiler/Source.vuna:99"));
  ("v_Vuna_dCompiler_dSource_dcontainsDot", ("Vuna.Compiler.Source.containsDot", "Vuna/Compiler/Source.vuna:104"));
  ("v_Vuna_dCompiler_dSource_dsplitOnDot", ("Vuna.Compiler.Source.splitOnDot", "Vuna/Compiler/Source.vuna:108"));
  ("v_Vuna_dCompiler_dSource_dsplitOnChar", ("Vuna.Compiler.Source.splitOnChar", "Vuna/Compiler/Source.vuna:112"));
  ("v_Vuna_dCompiler_dSource_dsplitCharsOn", ("Vuna.Compiler.Source.splitCharsOn", "Vuna/Compiler/Source.vuna:116"));
  ("v_Vuna_dCompiler_dSource_dsplitCharsOnDot", ("Vuna.Compiler.Source.splitCharsOnDot", "Vuna/Compiler/Source.vuna:123"));
  ("v_Vuna_dCompiler_dSource_dsplitLastDot", ("Vuna.Compiler.Source.splitLastDot", "Vuna/Compiler/Source.vuna:131"));
  ("v_Vuna_dCompiler_dSource_djoinDots", ("Vuna.Compiler.Source.joinDots", "Vuna/Compiler/Source.vuna:137"));
  ("v_Vuna_dCompiler_dSource_djoinSlashes", ("Vuna.Compiler.Source.joinSlashes", "Vuna/Compiler/Source.vuna:143"));
  ("v_Vuna_dCompiler_dSource_djoinArrows", ("Vuna.Compiler.Source.joinArrows", "Vuna/Compiler/Source.vuna:149"));
  ("v_Vuna_dCompiler_dSource_dsplitPath", ("Vuna.Compiler.Source.splitPath", "Vuna/Compiler/Source.vuna:156"));
  ("v_Vuna_dCompiler_dSource_dsplitPathChars", ("Vuna.Compiler.Source.splitPathChars", "Vuna/Compiler/Source.vuna:160"));
  ("v_Vuna_dCompiler_dSource_dbaseName", ("Vuna.Compiler.Source.baseName", "Vuna/Compiler/Source.vuna:169"));
  ("v_Vuna_dCompiler_dSource_dsuggest", ("Vuna.Compiler.Source.suggest", "Vuna/Compiler/Source.vuna:173"));
  ("v_Vuna_dCompiler_dSource_d_usimilarName", ("Vuna.Compiler.Source._similarName", "Vuna/Compiler/Source.vuna:180"));
  ("v_Vuna_dCompiler_dSource_dprefixLen2", ("Vuna.Compiler.Source.prefixLen2", "Vuna/Compiler/Source.vuna:192"));
  ("v_Vuna_dCompiler_dSource_dlengthDiffLE", ("Vuna.Compiler.Source.lengthDiffLE", "Vuna/Compiler/Source.vuna:198"));
  ("v_Vuna_dCompiler_dDiag_ddiagNoLoc", ("Vuna.Compiler.Diag.diagNoLoc", "Vuna/Compiler/Diag.vuna:213"));
  ("v_Vuna_dCompiler_dDiag_ddiagAt", ("Vuna.Compiler.Diag.diagAt", "Vuna/Compiler/Diag.vuna:218"));
  ("v_Vuna_dCompiler_dDiag_derr", ("Vuna.Compiler.Diag.err", "Vuna/Compiler/Diag.vuna:224"));
  ("v_Vuna_dCompiler_dDiag_drawAt", ("Vuna.Compiler.Diag.rawAt", "Vuna/Compiler/Diag.vuna:229"));
  ("v_Vuna_dCompiler_dDiag_drawNoLoc", ("Vuna.Compiler.Diag.rawNoLoc", "Vuna/Compiler/Diag.vuna:235"));
  ("v_Vuna_dCompiler_dDiag_dwithLabel", ("Vuna.Compiler.Diag.withLabel", "Vuna/Compiler/Diag.vuna:243"));
  ("v_Vuna_dCompiler_dDiag_dwithField", ("Vuna.Compiler.Diag.withField", "Vuna/Compiler/Diag.vuna:250"));
  ("v_Vuna_dCompiler_dDiag_dwithNote", ("Vuna.Compiler.Diag.withNote", "Vuna/Compiler/Diag.vuna:257"));
  ("v_Vuna_dCompiler_dDiag_dwithHelp", ("Vuna.Compiler.Diag.withHelp", "Vuna/Compiler/Diag.vuna:264"));
  ("v_Vuna_dCompiler_dDiag_dwithSuggestion", ("Vuna.Compiler.Diag.withSuggestion", "Vuna/Compiler/Diag.vuna:268"));
  ("v_Vuna_dCompiler_dDiag_dwithTrace", ("Vuna.Compiler.Diag.withTrace", "Vuna/Compiler/Diag.vuna:275"));
  ("v_Vuna_dCompiler_dDiag_dwithOrigin", ("Vuna.Compiler.Diag.withOrigin", "Vuna/Compiler/Diag.vuna:282"));
  ("v_Vuna_dCompiler_dDiag_dwithContext", ("Vuna.Compiler.Diag.withContext", "Vuna/Compiler/Diag.vuna:289"));
  ("v_Vuna_dCompiler_dDiag_dprimarySpanOf", ("Vuna.Compiler.Diag.primarySpanOf", "Vuna/Compiler/Diag.vuna:301"));
  ("v_Vuna_dCompiler_dDiag_dcontextPrefixOf", ("Vuna.Compiler.Diag.contextPrefixOf", "Vuna/Compiler/Diag.vuna:307"));
  ("v_Vuna_dCompiler_dDiag_dlocPrefixOf", ("Vuna.Compiler.Diag.locPrefixOf", "Vuna/Compiler/Diag.vuna:313"));
  ("v_Vuna_dCompiler_dDiag_ddiagText", ("Vuna.Compiler.Diag.diagText", "Vuna/Compiler/Diag.vuna:319"));
  ("v_Vuna_dCompiler_dDiag_dappendMessage", ("Vuna.Compiler.Diag.appendMessage", "Vuna/Compiler/Diag.vuna:326"));
  ("v_Vuna_dCompiler_dDiag_dwithChildren", ("Vuna.Compiler.Diag.withChildren", "Vuna/Compiler/Diag.vuna:356"));
  ("v_Vuna_dCompiler_dDiag_dwithFallbackSpan", ("Vuna.Compiler.Diag.withFallbackSpan", "Vuna/Compiler/Diag.vuna:363"));
  ("v_Vuna_dCompiler_dDiag_dhasPrimaryLabel", ("Vuna.Compiler.Diag.hasPrimaryLabel", "Vuna/Compiler/Diag.vuna:367"));
  ("v_Vuna_dCompiler_dDiag_dmarkInternal", ("Vuna.Compiler.Diag.markInternal", "Vuna/Compiler/Diag.vuna:376"));
  ("v_Vuna_dCompiler_dDiag_dicFuel", ("Vuna.Compiler.Diag.icFuel", "Vuna/Compiler/Diag.vuna:384"));
  ("v_Vuna_dCompiler_dDiag_dicInternal", ("Vuna.Compiler.Diag.icInternal", "Vuna/Compiler/Diag.vuna:390"));
  ("v_Vuna_dCompiler_dDiag_donErrDiag", ("Vuna.Compiler.Diag.onErrDiag", "Vuna/Compiler/Diag.vuna:396"));
  ("v_Vuna_dCompiler_dDiag_ddiagFileOf", ("Vuna.Compiler.Diag.diagFileOf", "Vuna/Compiler/Diag.vuna:401"));
  ("v_Vuna_dCompiler_dDiag_dprimaryLabelOf", ("Vuna.Compiler.Diag.primaryLabelOf", "Vuna/Compiler/Diag.vuna:407"));
  ("v_Vuna_dCompiler_dDiag_dsameSeverity", ("Vuna.Compiler.Diag.sameSeverity", "Vuna/Compiler/Diag.vuna:413"));
  ("v_Vuna_dCompiler_dDiag_dsameDiag", ("Vuna.Compiler.Diag.sameDiag", "Vuna/Compiler/Diag.vuna:421"));
  ("v_Vuna_dCompiler_dDiag_dlabelSpanOf", ("Vuna.Compiler.Diag.labelSpanOf", "Vuna/Compiler/Diag.vuna:428"));
  ("v_Vuna_dCompiler_dCommon_dbind", ("Vuna.Compiler.Common.bind", "Vuna/Compiler/Common.vuna:35"));
  ("v_Vuna_dCompiler_dCommon_drunEffCheck", ("Vuna.Compiler.Common.runEffCheck", "Vuna/Compiler/Common.vuna:45"));
  ("v_Vuna_dCompiler_dCommon_dstep", ("Vuna.Compiler.Common.step", "Vuna/Compiler/Common.vuna:60"));
  ("v_Vuna_dCompiler_dCommon_dtraverse", ("Vuna.Compiler.Common.traverse", "Vuna/Compiler/Common.vuna:65"));
  ("v_Vuna_dCompiler_dDiagnostics_dSink_dcontainsDiag", ("Vuna.Compiler.Diagnostics.Sink.containsDiag", "Vuna/Compiler/Diagnostics/Sink.vuna:16"));
  ("v_Vuna_dCompiler_dDiagnostics_dSink_ddedupeWarnings", ("Vuna.Compiler.Diagnostics.Sink.dedupeWarnings", "Vuna/Compiler/Diagnostics/Sink.vuna:21"));
  ("v_Base_dVec_dvhead", ("Base.Vec.vhead", "Base/Vec.vuna:28"));
  ("v_Base_dVec_dvtail", ("Base.Vec.vtail", "Base/Vec.vuna:34"));
  ("v_Base_dVec_dvlen", ("Base.Vec.vlen", "Base/Vec.vuna:40"));
  ("v_Base_dVec_dsubstTemplate", ("Base.Vec.substTemplate", "Base/Vec.vuna:58"));
  ("v_Base_dVec_dvecToList", ("Base.Vec.vecToList", "Base/Vec.vuna:62"));
  ("v_Vuna_dCompiler_dDiagnostics_dCommon_ddiagBody", ("Vuna.Compiler.Diagnostics.Common.diagBody", "Vuna/Compiler/Diagnostics/Common.vuna:24"));
  ("v_Vuna_dCompiler_dDiagnostics_dCommon_dmkDiag", ("Vuna.Compiler.Diagnostics.Common.mkDiag", "Vuna/Compiler/Diagnostics/Common.vuna:28"));
  ("v_Vuna_dCompiler_dDiagnostics_dCommon_dwithDiagSpan", ("Vuna.Compiler.Diagnostics.Common.withDiagSpan", "Vuna/Compiler/Diagnostics/Common.vuna:32"));
  ("v_Vuna_dCompiler_dDiagnostics_dCommon_dwithDiagDef", ("Vuna.Compiler.Diagnostics.Common.withDiagDef", "Vuna/Compiler/Diagnostics/Common.vuna:36"));
  ("v_Vuna_dCompiler_dDiagnostics_dCommon_dconcatLists", ("Vuna.Compiler.Diagnostics.Common.concatLists", "Vuna/Compiler/Diagnostics/Common.vuna:41"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgCode", ("Vuna.Compiler.Diagnostics.Pkg.pkgCode", "Vuna/Compiler/Diagnostics/Pkg.vuna:62"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgTemplate", ("Vuna.Compiler.Diagnostics.Pkg.pkgTemplate", "Vuna/Compiler/Diagnostics/Pkg.vuna:90"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgMsg", ("Vuna.Compiler.Diagnostics.Pkg.pkgMsg", "Vuna/Compiler/Diagnostics/Pkg.vuna:124"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgSpan", ("Vuna.Compiler.Diagnostics.Pkg.pkgSpan", "Vuna/Compiler/Diagnostics/Pkg.vuna:128"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_datSpan", ("Vuna.Compiler.Diagnostics.Pkg.atSpan", "Vuna/Compiler/Diagnostics/Pkg.vuna:132"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt", ("Vuna.Compiler.Diagnostics.Pkg.pkgAt", "Vuna/Compiler/Diagnostics/Pkg.vuna:137"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath", ("Vuna.Compiler.Diagnostics.Pkg.pkgPath", "Vuna/Compiler/Diagnostics/Pkg.vuna:141"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgNoLoc", ("Vuna.Compiler.Diagnostics.Pkg.pkgNoLoc", "Vuna/Compiler/Diagnostics/Pkg.vuna:145"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgNoLoc1", ("Vuna.Compiler.Diagnostics.Pkg.pkgNoLoc1", "Vuna/Compiler/Diagnostics/Pkg.vuna:149"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt0", ("Vuna.Compiler.Diagnostics.Pkg.pkgAt0", "Vuna/Compiler/Diagnostics/Pkg.vuna:153"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt1", ("Vuna.Compiler.Diagnostics.Pkg.pkgAt1", "Vuna/Compiler/Diagnostics/Pkg.vuna:157"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAt2", ("Vuna.Compiler.Diagnostics.Pkg.pkgAt2", "Vuna/Compiler/Diagnostics/Pkg.vuna:161"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath0", ("Vuna.Compiler.Diagnostics.Pkg.pkgPath0", "Vuna/Compiler/Diagnostics/Pkg.vuna:165"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath1", ("Vuna.Compiler.Diagnostics.Pkg.pkgPath1", "Vuna/Compiler/Diagnostics/Pkg.vuna:169"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgPath2", ("Vuna.Compiler.Diagnostics.Pkg.pkgPath2", "Vuna/Compiler/Diagnostics/Pkg.vuna:173"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgInvalid", ("Vuna.Compiler.Diagnostics.Pkg.pkgInvalid", "Vuna/Compiler/Diagnostics/Pkg.vuna:177"));
  ("v_Vuna_dCompiler_dDiagnostics_dPkg_dpkgAll", ("Vuna.Compiler.Diagnostics.Pkg.pkgAll", "Vuna/Compiler/Diagnostics/Pkg.vuna:187"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel", ("Vuna.Compiler.Frontend.Toml.cursorFuel", "Vuna/Compiler/Frontend/Toml.vuna:55"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dlineFuel", ("Vuna.Compiler.Frontend.Toml.lineFuel", "Vuna/Compiler/Frontend/Toml.vuna:59"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dcountLines", ("Vuna.Compiler.Frontend.Toml.countLines", "Vuna/Compiler/Frontend/Toml.vuna:62"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor", ("Vuna.Compiler.Frontend.Toml.advanceCursor", "Vuna/Compiler/Frontend/Toml.vuna:66"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disDigitChar", ("Vuna.Compiler.Frontend.Toml.isDigitChar", "Vuna/Compiler/Frontend/Toml.vuna:72"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disUpperAlphaChar", ("Vuna.Compiler.Frontend.Toml.isUpperAlphaChar", "Vuna/Compiler/Frontend/Toml.vuna:75"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disLowerAlphaChar", ("Vuna.Compiler.Frontend.Toml.isLowerAlphaChar", "Vuna/Compiler/Frontend/Toml.vuna:78"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disAlphaChar", ("Vuna.Compiler.Frontend.Toml.isAlphaChar", "Vuna/Compiler/Frontend/Toml.vuna:81"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar", ("Vuna.Compiler.Frontend.Toml.isBareKeyChar", "Vuna/Compiler/Frontend/Toml.vuna:84"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disBlankChar", ("Vuna.Compiler.Frontend.Toml.isBlankChar", "Vuna/Compiler/Frontend/Toml.vuna:87"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dstripCR", ("Vuna.Compiler.Frontend.Toml.stripCR", "Vuna/Compiler/Frontend/Toml.vuna:91"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dlocPrefix", ("Vuna.Compiler.Frontend.Toml.locPrefix", "Vuna/Compiler/Frontend/Toml.vuna:95"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dfailAt", ("Vuna.Compiler.Frontend.Toml.failAt", "Vuna/Compiler/Frontend/Toml.vuna:98"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dskipBlank", ("Vuna.Compiler.Frontend.Toml.skipBlank", "Vuna/Compiler/Frontend/Toml.vuna:103"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dskipComment", ("Vuna.Compiler.Frontend.Toml.skipComment", "Vuna/Compiler/Frontend/Toml.vuna:110"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dskipGap", ("Vuna.Compiler.Frontend.Toml.skipGap", "Vuna/Compiler/Frontend/Toml.vuna:118"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo", ("Vuna.Compiler.Frontend.Toml.skipGapGo", "Vuna/Compiler/Frontend/Toml.vuna:121"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey", ("Vuna.Compiler.Frontend.Toml.collectBareKey", "Vuna/Compiler/Frontend/Toml.vuna:131"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey", ("Vuna.Compiler.Frontend.Toml.parseBareKey", "Vuna/Compiler/Frontend/Toml.vuna:137"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseStringValue", ("Vuna.Compiler.Frontend.Toml.parseStringValue", "Vuna/Compiler/Frontend/Toml.vuna:145"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseStringChars", ("Vuna.Compiler.Frontend.Toml.parseStringChars", "Vuna/Compiler/Frontend/Toml.vuna:153"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseStringEscape", ("Vuna.Compiler.Frontend.Toml.parseStringEscape", "Vuna/Compiler/Frontend/Toml.vuna:163"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseInteger", ("Vuna.Compiler.Frontend.Toml.parseInteger", "Vuna/Compiler/Frontend/Toml.vuna:178"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits", ("Vuna.Compiler.Frontend.Toml.parseIntegerDigits", "Vuna/Compiler/Frontend/Toml.vuna:186"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger", ("Vuna.Compiler.Frontend.Toml.finishInteger", "Vuna/Compiler/Frontend/Toml.vuna:195"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger", ("Vuna.Compiler.Frontend.Toml.makeInteger", "Vuna/Compiler/Frontend/Toml.vuna:204"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue", ("Vuna.Compiler.Frontend.Toml.parseIntValue", "Vuna/Compiler/Frontend/Toml.vuna:208"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dmatchChars", ("Vuna.Compiler.Frontend.Toml.matchChars", "Vuna/Compiler/Frontend/Toml.vuna:214"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dmatchWord", ("Vuna.Compiler.Frontend.Toml.matchWord", "Vuna/Compiler/Frontend/Toml.vuna:220"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseStringArray", ("Vuna.Compiler.Frontend.Toml.parseStringArray", "Vuna/Compiler/Frontend/Toml.vuna:228"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems", ("Vuna.Compiler.Frontend.Toml.parseArrayItems", "Vuna/Compiler/Frontend/Toml.vuna:236"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseArrayString", ("Vuna.Compiler.Frontend.Toml.parseArrayString", "Vuna/Compiler/Frontend/Toml.vuna:246"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseValue", ("Vuna.Compiler.Frontend.Toml.parseValue", "Vuna/Compiler/Frontend/Toml.vuna:258"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseSectionPath", ("Vuna.Compiler.Frontend.Toml.parseSectionPath", "Vuna/Compiler/Frontend/Toml.vuna:274"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseSectionSegments", ("Vuna.Compiler.Frontend.Toml.parseSectionSegments", "Vuna/Compiler/Frontend/Toml.vuna:277"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dexpectEol", ("Vuna.Compiler.Frontend.Toml.expectEol", "Vuna/Compiler/Frontend/Toml.vuna:289"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment", ("Vuna.Compiler.Frontend.Toml.expectEolAfterComment", "Vuna/Compiler/Frontend/Toml.vuna:298"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dsamePath", ("Vuna.Compiler.Frontend.Toml.samePath", "Vuna/Compiler/Frontend/Toml.vuna:306"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dmemSectionPath", ("Vuna.Compiler.Frontend.Toml.memSectionPath", "Vuna/Compiler/Frontend/Toml.vuna:311"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dsectionSuffix", ("Vuna.Compiler.Frontend.Toml.sectionSuffix", "Vuna/Compiler/Frontend/Toml.vuna:315"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dhasEntry", ("Vuna.Compiler.Frontend.Toml.hasEntry", "Vuna/Compiler/Frontend/Toml.vuna:319"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue", ("Vuna.Compiler.Frontend.Toml.parseEntryValue", "Vuna/Compiler/Frontend/Toml.vuna:324"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine", ("Vuna.Compiler.Frontend.Toml.parseKeyLine", "Vuna/Compiler/Frontend/Toml.vuna:335"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine", ("Vuna.Compiler.Frontend.Toml.parseSectionLine", "Vuna/Compiler/Frontend/Toml.vuna:347"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop", ("Vuna.Compiler.Frontend.Toml.parseTomlLoop", "Vuna/Compiler/Frontend/Toml.vuna:356"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt", ("Vuna.Compiler.Frontend.Toml.parseTomlLoopAt", "Vuna/Compiler/Frontend/Toml.vuna:361"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseToml", ("Vuna.Compiler.Frontend.Toml.parseToml", "Vuna/Compiler/Frontend/Toml.vuna:369"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt", ("Vuna.Compiler.Frontend.Toml.parseTomlAt", "Vuna/Compiler/Frontend/Toml.vuna:372"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry", ("Vuna.Compiler.Frontend.Toml.lookupEntry", "Vuna/Compiler/Frontend/Toml.vuna:378"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine", ("Vuna.Compiler.Frontend.Toml.lookupEntryLine", "Vuna/Compiler/Frontend/Toml.vuna:383"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar", ("Vuna.Compiler.Frontend.Manifest.isDigitChar", "Vuna/Compiler/Frontend/Manifest.vuna:36"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar", ("Vuna.Compiler.Frontend.Manifest.isUpperAlphaChar", "Vuna/Compiler/Frontend/Manifest.vuna:39"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar", ("Vuna.Compiler.Frontend.Manifest.isLowerAlphaChar", "Vuna/Compiler/Frontend/Manifest.vuna:42"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_datLine", ("Vuna.Compiler.Frontend.Manifest.atLine", "Vuna/Compiler/Frontend/Manifest.vuna:46"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr", ("Vuna.Compiler.Frontend.Manifest.manifestErr", "Vuna/Compiler/Frontend/Manifest.vuna:49"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dsameSection", ("Vuna.Compiler.Frontend.Manifest.sameSection", "Vuna/Compiler/Frontend/Manifest.vuna:52"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine", ("Vuna.Compiler.Frontend.Manifest.fieldLine", "Vuna/Compiler/Frontend/Manifest.vuna:57"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc", ("Vuna.Compiler.Frontend.Manifest.fieldLoc", "Vuna/Compiler/Frontend/Manifest.vuna:62"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dstringField", ("Vuna.Compiler.Frontend.Manifest.stringField", "Vuna/Compiler/Frontend/Manifest.vuna:67"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dstringListField", ("Vuna.Compiler.Frontend.Manifest.stringListField", "Vuna/Compiler/Frontend/Manifest.vuna:73"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dintField", ("Vuna.Compiler.Frontend.Manifest.intField", "Vuna/Compiler/Frontend/Manifest.vuna:80"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dboolField", ("Vuna.Compiler.Frontend.Manifest.boolField", "Vuna/Compiler/Frontend/Manifest.vuna:86"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList", ("Vuna.Compiler.Frontend.Manifest.orEmptyList", "Vuna/Compiler/Frontend/Manifest.vuna:92"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dorFalse", ("Vuna.Compiler.Frontend.Manifest.orFalse", "Vuna/Compiler/Frontend/Manifest.vuna:97"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry", ("Vuna.Compiler.Frontend.Manifest.checkOneEntry", "Vuna/Compiler/Frontend/Manifest.vuna:102"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries", ("Vuna.Compiler.Frontend.Manifest.checkEntries", "Vuna/Compiler/Frontend/Manifest.vuna:113"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies", ("Vuna.Compiler.Frontend.Manifest.collectDependencies", "Vuna/Compiler/Frontend/Manifest.vuna:119"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependenciesAcc", ("Vuna.Compiler.Frontend.Manifest.collectDependenciesAcc", "Vuna/Compiler/Frontend/Manifest.vuna:122"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagFormat", ("Vuna.Compiler.Frontend.Manifest.validateDiagFormat", "Vuna/Compiler/Frontend/Manifest.vuna:129"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagMax", ("Vuna.Compiler.Frontend.Manifest.validateDiagMax", "Vuna/Compiler/Frontend/Manifest.vuna:135"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest", ("Vuna.Compiler.Frontend.Manifest.buildManifest", "Vuna/Compiler/Frontend/Manifest.vuna:140"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest", ("Vuna.Compiler.Frontend.Manifest.parseManifest", "Vuna/Compiler/Frontend/Manifest.vuna:145"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName", ("Vuna.Compiler.Frontend.Manifest.validPackageName", "Vuna/Compiler/Frontend/Manifest.vuna:150"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars", ("Vuna.Compiler.Frontend.Manifest.validPackageChars", "Vuna/Compiler/Frontend/Manifest.vuna:153"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName", ("Vuna.Compiler.Frontend.Manifest.validModuleName", "Vuna/Compiler/Frontend/Manifest.vuna:158"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments", ("Vuna.Compiler.Frontend.Manifest.validModuleSegments", "Vuna/Compiler/Frontend/Manifest.vuna:161"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment", ("Vuna.Compiler.Frontend.Manifest.validModuleSegment", "Vuna/Compiler/Frontend/Manifest.vuna:165"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars", ("Vuna.Compiler.Frontend.Manifest.validModuleSegmentChars", "Vuna/Compiler/Frontend/Manifest.vuna:168"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail", ("Vuna.Compiler.Frontend.Manifest.validModuleTail", "Vuna/Compiler/Frontend/Manifest.vuna:172"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName", ("Vuna.Compiler.Frontend.Manifest.validateName", "Vuna/Compiler/Frontend/Manifest.vuna:178"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers", ("Vuna.Compiler.Frontend.Manifest.validateMembers", "Vuna/Compiler/Frontend/Manifest.vuna:184"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules", ("Vuna.Compiler.Frontend.Manifest.validateModules", "Vuna/Compiler/Frontend/Manifest.vuna:189"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports", ("Vuna.Compiler.Frontend.Manifest.validateExports", "Vuna/Compiler/Frontend/Manifest.vuna:194"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies", ("Vuna.Compiler.Frontend.Manifest.validateDependencies", "Vuna/Compiler/Frontend/Manifest.vuna:198"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen", ("Vuna.Compiler.Frontend.Manifest.validateDepsSeen", "Vuna/Compiler/Frontend/Manifest.vuna:201"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest", ("Vuna.Compiler.Frontend.Manifest.validateManifest", "Vuna/Compiler/Frontend/Manifest.vuna:209"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir", ("Vuna.Compiler.Frontend.Manifest.manifestDir", "Vuna/Compiler/Frontend/Manifest.vuna:215"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev", ("Vuna.Compiler.Frontend.Manifest.dirFromRev", "Vuna/Compiler/Frontend/Manifest.vuna:218"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_ddirResult", ("Vuna.Compiler.Frontend.Manifest.dirResult", "Vuna/Compiler/Frontend/Manifest.vuna:222"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dresolveManifestPath", ("Vuna.Compiler.Frontend.Manifest.resolveManifestPath", "Vuna/Compiler/Frontend/Manifest.vuna:226"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagLang", ("Vuna.Compiler.Frontend.Manifest.validateDiagLang", "Vuna/Compiler/Frontend/Manifest.vuna:233"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dpackageDependencies", ("Vuna.Compiler.Packages.Pkg.packageDependencies", "Vuna/Compiler/Packages/Pkg.vuna:69"));
  ("v_Vuna_dCompiler_dPackages_dPkg_drootDir", ("Vuna.Compiler.Packages.Pkg.rootDir", "Vuna/Compiler/Packages/Pkg.vuna:87"));
  ("v_Vuna_dCompiler_dPackages_dPkg_drootName", ("Vuna.Compiler.Packages.Pkg.rootName", "Vuna/Compiler/Packages/Pkg.vuna:90"));
  ("v_Vuna_dCompiler_dPackages_dPkg_drootPackage", ("Vuna.Compiler.Packages.Pkg.rootPackage", "Vuna/Compiler/Packages/Pkg.vuna:94"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcontextDir", ("Vuna.Compiler.Packages.Pkg.contextDir", "Vuna/Compiler/Packages/Pkg.vuna:97"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcontextRoots", ("Vuna.Compiler.Packages.Pkg.contextRoots", "Vuna/Compiler/Packages/Pkg.vuna:100"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageOf", ("Vuna.Compiler.Packages.Pkg.contextPackageOf", "Vuna/Compiler/Packages/Pkg.vuna:104"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcontextPackageName", ("Vuna.Compiler.Packages.Pkg.contextPackageName", "Vuna/Compiler/Packages/Pkg.vuna:107"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcontextRelease", ("Vuna.Compiler.Packages.Pkg.contextRelease", "Vuna/Compiler/Packages/Pkg.vuna:111"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcontextWithRelease", ("Vuna.Compiler.Packages.Pkg.contextWithRelease", "Vuna/Compiler/Packages/Pkg.vuna:115"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dpackageDir", ("Vuna.Compiler.Packages.Pkg.packageDir", "Vuna/Compiler/Packages/Pkg.vuna:118"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dpackageName", ("Vuna.Compiler.Packages.Pkg.packageName", "Vuna/Compiler/Packages/Pkg.vuna:121"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dpackageExports", ("Vuna.Compiler.Packages.Pkg.packageExports", "Vuna/Compiler/Packages/Pkg.vuna:126"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dsplitSlashChars", ("Vuna.Compiler.Packages.Pkg.splitSlashChars", "Vuna/Compiler/Packages/Pkg.vuna:130"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dsplitOnSlash", ("Vuna.Compiler.Packages.Pkg.splitOnSlash", "Vuna/Compiler/Packages/Pkg.vuna:136"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dnormalizeAcc", ("Vuna.Compiler.Packages.Pkg.normalizeAcc", "Vuna/Compiler/Packages/Pkg.vuna:142"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dnormalizeDir", ("Vuna.Compiler.Packages.Pkg.normalizeDir", "Vuna/Compiler/Packages/Pkg.vuna:156"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dabsolutePath", ("Vuna.Compiler.Packages.Pkg.absolutePath", "Vuna/Compiler/Packages/Pkg.vuna:166"));
  ("v_Vuna_dCompiler_dPackages_dPkg_djoinPath", ("Vuna.Compiler.Packages.Pkg.joinPath", "Vuna/Compiler/Packages/Pkg.vuna:173"));
  ("v_Vuna_dCompiler_dPackages_dPkg_djoinPathsText", ("Vuna.Compiler.Packages.Pkg.joinPathsText", "Vuna/Compiler/Packages/Pkg.vuna:176"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dloadManifestAt", ("Vuna.Compiler.Packages.Pkg.loadManifestAt", "Vuna/Compiler/Packages/Pkg.vuna:183"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dmanifestNameString", ("Vuna.Compiler.Packages.Pkg.manifestNameString", "Vuna/Compiler/Packages/Pkg.vuna:197"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dmemStackDir", ("Vuna.Compiler.Packages.Pkg.memStackDir", "Vuna/Compiler/Packages/Pkg.vuna:204"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcyclePrefix", ("Vuna.Compiler.Packages.Pkg.cyclePrefix", "Vuna/Compiler/Packages/Pkg.vuna:208"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcycleMessage", ("Vuna.Compiler.Packages.Pkg.cycleMessage", "Vuna/Compiler/Packages/Pkg.vuna:215"));
  ("v_Vuna_dCompiler_dPackages_dPkg_ddependencyNameOk", ("Vuna.Compiler.Packages.Pkg.dependencyNameOk", "Vuna/Compiler/Packages/Pkg.vuna:222"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dmismatchMessage", ("Vuna.Compiler.Packages.Pkg.mismatchMessage", "Vuna/Compiler/Packages/Pkg.vuna:226"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dloadDependencyList", ("Vuna.Compiler.Packages.Pkg.loadDependencyList", "Vuna/Compiler/Packages/Pkg.vuna:231"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dloadPackageWalk", ("Vuna.Compiler.Packages.Pkg.loadPackageWalk", "Vuna/Compiler/Packages/Pkg.vuna:246"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcollectPackageIds", ("Vuna.Compiler.Packages.Pkg.collectPackageIds", "Vuna/Compiler/Packages/Pkg.vuna:276"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcollectDependencyIds", ("Vuna.Compiler.Packages.Pkg.collectDependencyIds", "Vuna/Compiler/Packages/Pkg.vuna:281"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dlookupPackageDir", ("Vuna.Compiler.Packages.Pkg.lookupPackageDir", "Vuna/Compiler/Packages/Pkg.vuna:286"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcheckUniqueNamesGo", ("Vuna.Compiler.Packages.Pkg.checkUniqueNamesGo", "Vuna/Compiler/Packages/Pkg.vuna:291"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcheckUniquePackageNames", ("Vuna.Compiler.Packages.Pkg.checkUniquePackageNames", "Vuna/Compiler/Packages/Pkg.vuna:300"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dpkgFuelBound", ("Vuna.Compiler.Packages.Pkg.pkgFuelBound", "Vuna/Compiler/Packages/Pkg.vuna:311"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dloadPackage", ("Vuna.Compiler.Packages.Pkg.loadPackage", "Vuna/Compiler/Packages/Pkg.vuna:315"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dloadMembers", ("Vuna.Compiler.Packages.Pkg.loadMembers", "Vuna/Compiler/Packages/Pkg.vuna:326"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dworkspacePackages", ("Vuna.Compiler.Packages.Pkg.workspacePackages", "Vuna/Compiler/Packages/Pkg.vuna:342"));
  ("v_Vuna_dCompiler_dPackages_dPkg_ddependencyRootOf", ("Vuna.Compiler.Packages.Pkg.dependencyRootOf", "Vuna/Compiler/Packages/Pkg.vuna:360"));
  ("v_Vuna_dCompiler_dPackages_dPkg_ddependencyRoots", ("Vuna.Compiler.Packages.Pkg.dependencyRoots", "Vuna/Compiler/Packages/Pkg.vuna:368"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dpackageRoots", ("Vuna.Compiler.Packages.Pkg.packageRoots", "Vuna/Compiler/Packages/Pkg.vuna:377"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dpackageEntry", ("Vuna.Compiler.Packages.Pkg.packageEntry", "Vuna/Compiler/Packages/Pkg.vuna:386"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dpackageContext", ("Vuna.Compiler.Packages.Pkg.packageContext", "Vuna/Compiler/Packages/Pkg.vuna:390"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybe", ("Vuna.Compiler.Packages.Pkg.findManifestUpMaybe", "Vuna/Compiler/Packages/Pkg.vuna:396"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dfindManifestUpMaybeStep", ("Vuna.Compiler.Packages.Pkg.findManifestUpMaybeStep", "Vuna/Compiler/Packages/Pkg.vuna:402"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDirMaybe", ("Vuna.Compiler.Packages.Pkg.findManifestDirMaybe", "Vuna/Compiler/Packages/Pkg.vuna:412"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dfindManifestDir", ("Vuna.Compiler.Packages.Pkg.findManifestDir", "Vuna/Compiler/Packages/Pkg.vuna:420"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dhasManifest", ("Vuna.Compiler.Packages.Pkg.hasManifest", "Vuna/Compiler/Packages/Pkg.vuna:432"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dbaseCandidates", ("Vuna.Compiler.Packages.Pkg.baseCandidates", "Vuna/Compiler/Packages/Pkg.vuna:435"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dbaseNotFound", ("Vuna.Compiler.Packages.Pkg.baseNotFound", "Vuna/Compiler/Packages/Pkg.vuna:443"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dfirstExistingBase", ("Vuna.Compiler.Packages.Pkg.firstExistingBase", "Vuna/Compiler/Packages/Pkg.vuna:446"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dlocateBase", ("Vuna.Compiler.Packages.Pkg.locateBase", "Vuna/Compiler/Packages/Pkg.vuna:454"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dbaseOnlyContext", ("Vuna.Compiler.Packages.Pkg.baseOnlyContext", "Vuna/Compiler/Packages/Pkg.vuna:472"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcontextAt", ("Vuna.Compiler.Packages.Pkg.contextAt", "Vuna/Compiler/Packages/Pkg.vuna:482"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcontextForFile", ("Vuna.Compiler.Packages.Pkg.contextForFile", "Vuna/Compiler/Packages/Pkg.vuna:499"));
  ("v_Vuna_dCompiler_dPackages_dPkg_dcontextForDir", ("Vuna.Compiler.Packages.Pkg.contextForDir", "Vuna/Compiler/Packages/Pkg.vuna:507"));
  ("v_Base_dBits_dband", ("Base.Bits.band", "Base/Bits.vuna:31"));
  ("v_Base_dBits_dbor", ("Base.Bits.bor", "Base/Bits.vuna:35"));
  ("v_Base_dBits_dbxor", ("Base.Bits.bxor", "Base/Bits.vuna:39"));
  ("v_Base_dBits_dbnot", ("Base.Bits.bnot", "Base/Bits.vuna:43"));
  ("v_Base_dBits_dshl", ("Base.Bits.shl", "Base/Bits.vuna:47"));
  ("v_Base_dBits_dshr", ("Base.Bits.shr", "Base/Bits.vuna:51"));
  ("v_Base_dBits_dmask32", ("Base.Bits.mask32", "Base/Bits.vuna:55"));
  ("v_Base_dBits_dmask8", ("Base.Bits.mask8", "Base/Bits.vuna:59"));
  ("v_Base_dBits_dshl32", ("Base.Bits.shl32", "Base/Bits.vuna:63"));
  ("v_Base_dBits_dshr32", ("Base.Bits.shr32", "Base/Bits.vuna:67"));
  ("v_Base_dBits_dadd32", ("Base.Bits.add32", "Base/Bits.vuna:71"));
  ("v_Base_dBits_drotr32", ("Base.Bits.rotr32", "Base/Bits.vuna:75"));
  ("v_Base_dBits_drol32", ("Base.Bits.rol32", "Base/Bits.vuna:83"));
  ("v_Vuna_dCompiler_dHash_ddigestLanes", ("Vuna.Compiler.Hash.digestLanes", "Vuna/Compiler/Hash.vuna:36"));
  ("v_Vuna_dCompiler_dHash_ddigestOfBytes", ("Vuna.Compiler.Hash.digestOfBytes", "Vuna/Compiler/Hash.vuna:40"));
  ("v_Vuna_dCompiler_dHash_ddigestOfString", ("Vuna.Compiler.Hash.digestOfString", "Vuna/Compiler/Hash.vuna:48"));
  ("v_Vuna_dCompiler_dHash_ddigestHex", ("Vuna.Compiler.Hash.digestHex", "Vuna/Compiler/Hash.vuna:52"));
  ("v_Vuna_dCompiler_dHash_ddigestInt", ("Vuna.Compiler.Hash.digestInt", "Vuna/Compiler/Hash.vuna:60"));
  ("v_Vuna_dCompiler_dHash_ddigestIntOf", ("Vuna.Compiler.Hash.digestIntOf", "Vuna/Compiler/Hash.vuna:64"));
  ("v_Vuna_dCompiler_dHash_dcontentKey", ("Vuna.Compiler.Hash.contentKey", "Vuna/Compiler/Hash.vuna:73"));
  ("v_Vuna_dCompiler_dHash_dcontentAddress", ("Vuna.Compiler.Hash.contentAddress", "Vuna/Compiler/Hash.vuna:78"));
  ("v_Vuna_dCompiler_dHash_dshaInit", ("Vuna.Compiler.Hash.shaInit", "Vuna/Compiler/Hash.vuna:85"));
  ("v_Vuna_dCompiler_dHash_dshaK", ("Vuna.Compiler.Hash.shaK", "Vuna/Compiler/Hash.vuna:90"));
  ("v_Vuna_dCompiler_dHash_dlenInt", ("Vuna.Compiler.Hash.lenInt", "Vuna/Compiler/Hash.vuna:159"));
  ("v_Vuna_dCompiler_dHash_datIdx", ("Vuna.Compiler.Hash.atIdx", "Vuna/Compiler/Hash.vuna:164"));
  ("v_Vuna_dCompiler_dHash_dzeros", ("Vuna.Compiler.Hash.zeros", "Vuna/Compiler/Hash.vuna:169"));
  ("v_Vuna_dCompiler_dHash_dlenBytes", ("Vuna.Compiler.Hash.lenBytes", "Vuna/Compiler/Hash.vuna:173"));
  ("v_Vuna_dCompiler_dHash_dpadMessage", ("Vuna.Compiler.Hash.padMessage", "Vuna/Compiler/Hash.vuna:186"));
  ("v_Vuna_dCompiler_dHash_dchunk64", ("Vuna.Compiler.Hash.chunk64", "Vuna/Compiler/Hash.vuna:195"));
  ("v_Vuna_dCompiler_dHash_dchunks", ("Vuna.Compiler.Hash.chunks", "Vuna/Compiler/Hash.vuna:199"));
  ("v_Vuna_dCompiler_dHash_dwordAt", ("Vuna.Compiler.Hash.wordAt", "Vuna/Compiler/Hash.vuna:203"));
  ("v_Vuna_dCompiler_dHash_dchunkWords", ("Vuna.Compiler.Hash.chunkWords", "Vuna/Compiler/Hash.vuna:213"));
  ("v_Vuna_dCompiler_dHash_dsigma0Small", ("Vuna.Compiler.Hash.sigma0Small", "Vuna/Compiler/Hash.vuna:217"));
  ("v_Vuna_dCompiler_dHash_dsigma1Small", ("Vuna.Compiler.Hash.sigma1Small", "Vuna/Compiler/Hash.vuna:221"));
  ("v_Vuna_dCompiler_dHash_dbigSigma0", ("Vuna.Compiler.Hash.bigSigma0", "Vuna/Compiler/Hash.vuna:225"));
  ("v_Vuna_dCompiler_dHash_dbigSigma1", ("Vuna.Compiler.Hash.bigSigma1", "Vuna/Compiler/Hash.vuna:229"));
  ("v_Vuna_dCompiler_dHash_datWindow", ("Vuna.Compiler.Hash.atWindow", "Vuna/Compiler/Hash.vuna:235"));
  ("v_Vuna_dCompiler_dHash_dschedule", ("Vuna.Compiler.Hash.schedule", "Vuna/Compiler/Hash.vuna:240"));
  ("v_Vuna_dCompiler_dHash_dscheduleGo", ("Vuna.Compiler.Hash.scheduleGo", "Vuna/Compiler/Hash.vuna:244"));
  ("v_Vuna_dCompiler_dHash_dch32", ("Vuna.Compiler.Hash.ch32", "Vuna/Compiler/Hash.vuna:256"));
  ("v_Vuna_dCompiler_dHash_dmaj32", ("Vuna.Compiler.Hash.maj32", "Vuna/Compiler/Hash.vuna:260"));
  ("v_Vuna_dCompiler_dHash_droundsGo", ("Vuna.Compiler.Hash.roundsGo", "Vuna/Compiler/Hash.vuna:264"));
  ("v_Vuna_dCompiler_dHash_dcompress", ("Vuna.Compiler.Hash.compress", "Vuna/Compiler/Hash.vuna:273"));
  ("v_Vuna_dCompiler_dHash_dzipAdd", ("Vuna.Compiler.Hash.zipAdd", "Vuna/Compiler/Hash.vuna:279"));
  ("v_Vuna_dCompiler_dHash_dcompressBlock", ("Vuna.Compiler.Hash.compressBlock", "Vuna/Compiler/Hash.vuna:283"));
  ("v_Vuna_dCompiler_dHash_dsha256Bytes", ("Vuna.Compiler.Hash.sha256Bytes", "Vuna/Compiler/Hash.vuna:287"));
  ("v_Vuna_dCompiler_dHash_dpaddedLen", ("Vuna.Compiler.Hash.paddedLen", "Vuna/Compiler/Hash.vuna:294"));
  ("v_Vuna_dCompiler_dHash_dpaddedByte", ("Vuna.Compiler.Hash.paddedByte", "Vuna/Compiler/Hash.vuna:302"));
  ("v_Vuna_dCompiler_dHash_dwordAtString", ("Vuna.Compiler.Hash.wordAtString", "Vuna/Compiler/Hash.vuna:309"));
  ("v_Vuna_dCompiler_dHash_dchunkWordsString", ("Vuna.Compiler.Hash.chunkWordsString", "Vuna/Compiler/Hash.vuna:320"));
  ("v_Vuna_dCompiler_dHash_dblocksGo", ("Vuna.Compiler.Hash.blocksGo", "Vuna/Compiler/Hash.vuna:324"));
  ("v_Vuna_dCompiler_dHash_dsha256OfString", ("Vuna.Compiler.Hash.sha256OfString", "Vuna/Compiler/Hash.vuna:331"));
  ("v_Vuna_dCompiler_dHash_dprehashOfString", ("Vuna.Compiler.Hash.prehashOfString", "Vuna/Compiler/Hash.vuna:351"));
  ("v_Vuna_dCompiler_dHash_dprehashGo", ("Vuna.Compiler.Hash.prehashGo", "Vuna/Compiler/Hash.vuna:355"));
  ("v_Vuna_dCompiler_dHash_dhex8", ("Vuna.Compiler.Hash.hex8", "Vuna/Compiler/Hash.vuna:366"));
  ("v_Vuna_dCompiler_dHash_ddigitAt", ("Vuna.Compiler.Hash.digitAt", "Vuna/Compiler/Hash.vuna:372"));
  ("v_Vuna_dCompiler_dHash_dhexDigit", ("Vuna.Compiler.Hash.hexDigit", "Vuna/Compiler/Hash.vuna:376"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dcurOf", ("Vuna.Compiler.Canonical.Bytes.curOf", "Vuna/Compiler/Canonical/Bytes.vuna:73"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dcurAtEnd", ("Vuna.Compiler.Canonical.Bytes.curAtEnd", "Vuna/Compiler/Canonical/Bytes.vuna:77"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dcurChar", ("Vuna.Compiler.Canonical.Bytes.curChar", "Vuna/Compiler/Canonical/Bytes.vuna:81"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dcurSkip", ("Vuna.Compiler.Canonical.Bytes.curSkip", "Vuna/Compiler/Canonical/Bytes.vuna:85"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dcurSlice", ("Vuna.Compiler.Canonical.Bytes.curSlice", "Vuna/Compiler/Canonical/Bytes.vuna:89"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dlenOf", ("Vuna.Compiler.Canonical.Bytes.lenOf", "Vuna/Compiler/Canonical/Bytes.vuna:93"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dencConcat", ("Vuna.Compiler.Canonical.Bytes.encConcat", "Vuna/Compiler/Canonical/Bytes.vuna:98"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dencTop", ("Vuna.Compiler.Canonical.Bytes.encTop", "Vuna/Compiler/Canonical/Bytes.vuna:102"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dencTag", ("Vuna.Compiler.Canonical.Bytes.encTag", "Vuna/Compiler/Canonical/Bytes.vuna:106"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dencInt", ("Vuna.Compiler.Canonical.Bytes.encInt", "Vuna/Compiler/Canonical/Bytes.vuna:110"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dencStr", ("Vuna.Compiler.Canonical.Bytes.encStr", "Vuna/Compiler/Canonical/Bytes.vuna:114"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dencBool", ("Vuna.Compiler.Canonical.Bytes.encBool", "Vuna/Compiler/Canonical/Bytes.vuna:118"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dencList", ("Vuna.Compiler.Canonical.Bytes.encList", "Vuna/Compiler/Canonical/Bytes.vuna:123"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dencListGo", ("Vuna.Compiler.Canonical.Bytes.encListGo", "Vuna/Compiler/Canonical/Bytes.vuna:127"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dencMaybe", ("Vuna.Compiler.Canonical.Bytes.encMaybe", "Vuna/Compiler/Canonical/Bytes.vuna:132"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dencPair", ("Vuna.Compiler.Canonical.Bytes.encPair", "Vuna/Compiler/Canonical/Bytes.vuna:137"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_dthenPair", ("Vuna.Compiler.Canonical.Bytes.thenPair", "Vuna/Compiler/Canonical/Bytes.vuna:141"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_disDigit", ("Vuna.Compiler.Canonical.Bytes.isDigit", "Vuna/Compiler/Canonical/Bytes.vuna:146"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_ddecNumStop", ("Vuna.Compiler.Canonical.Bytes.decNumStop", "Vuna/Compiler/Canonical/Bytes.vuna:151"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_ddecTag", ("Vuna.Compiler.Canonical.Bytes.decTag", "Vuna/Compiler/Canonical/Bytes.vuna:160"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_ddecInt", ("Vuna.Compiler.Canonical.Bytes.decInt", "Vuna/Compiler/Canonical/Bytes.vuna:167"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_ddecBool", ("Vuna.Compiler.Canonical.Bytes.decBool", "Vuna/Compiler/Canonical/Bytes.vuna:177"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_ddecStr", ("Vuna.Compiler.Canonical.Bytes.decStr", "Vuna/Compiler/Canonical/Bytes.vuna:187"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_ddecList", ("Vuna.Compiler.Canonical.Bytes.decList", "Vuna/Compiler/Canonical/Bytes.vuna:196"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_ddecItems", ("Vuna.Compiler.Canonical.Bytes.decItems", "Vuna/Compiler/Canonical/Bytes.vuna:204"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_ddecMaybe", ("Vuna.Compiler.Canonical.Bytes.decMaybe", "Vuna/Compiler/Canonical/Bytes.vuna:211"));
  ("v_Vuna_dCompiler_dCanonical_dBytes_ddecPair", ("Vuna.Compiler.Canonical.Bytes.decPair", "Vuna/Compiler/Canonical/Bytes.vuna:219"));
  ("v_Vuna_dCompiler_dVersion_dvunaVersion", ("Vuna.Compiler.Version.vunaVersion", "Vuna/Compiler/Version.vuna:12"));
  ("v_Vuna_dCompiler_dFingerprint_dfingerprintOfStat", ("Vuna.Compiler.Fingerprint.fingerprintOfStat", "Vuna/Compiler/Fingerprint.vuna:29"));
  ("v_Vuna_dCompiler_dFingerprint_dtextHashOf", ("Vuna.Compiler.Fingerprint.textHashOf", "Vuna/Compiler/Fingerprint.vuna:32"));
  ("v_Vuna_dCompiler_dFingerprint_dcompilerFingerprintEff", ("Vuna.Compiler.Fingerprint.compilerFingerprintEff", "Vuna/Compiler/Fingerprint.vuna:36"));
  ("v_Vuna_dCompiler_dFingerprint_dcompilerTagEff", ("Vuna.Compiler.Fingerprint.compilerTagEff", "Vuna/Compiler/Fingerprint.vuna:44"));
  ("v_Vuna_dCompiler_dStore_dstoreMagic", ("Vuna.Compiler.Store.storeMagic", "Vuna/Compiler/Store.vuna:64"));
  ("v_Vuna_dCompiler_dStore_dfTagOf", ("Vuna.Compiler.Store.fTagOf", "Vuna/Compiler/Store.vuna:73"));
  ("v_Vuna_dCompiler_dStore_dfCodecOf", ("Vuna.Compiler.Store.fCodecOf", "Vuna/Compiler/Store.vuna:76"));
  ("v_Vuna_dCompiler_dStore_dfPayloadOf", ("Vuna.Compiler.Store.fPayloadOf", "Vuna/Compiler/Store.vuna:79"));
  ("v_Vuna_dCompiler_dStore_dframeHeader", ("Vuna.Compiler.Store.frameHeader", "Vuna/Compiler/Store.vuna:83"));
  ("v_Vuna_dCompiler_dStore_dstoreEncode", ("Vuna.Compiler.Store.storeEncode", "Vuna/Compiler/Store.vuna:87"));
  ("v_Vuna_dCompiler_dStore_dstoreEncodeAs", ("Vuna.Compiler.Store.storeEncodeAs", "Vuna/Compiler/Store.vuna:94"));
  ("v_Vuna_dCompiler_dStore_dheaderFields", ("Vuna.Compiler.Store.headerFields", "Vuna/Compiler/Store.vuna:98"));
  ("v_Vuna_dCompiler_dStore_dbreakFirstNewline", ("Vuna.Compiler.Store.breakFirstNewline", "Vuna/Compiler/Store.vuna:103"));
  ("v_Vuna_dCompiler_dStore_dframeSplit", ("Vuna.Compiler.Store.frameSplit", "Vuna/Compiler/Store.vuna:112"));
  ("v_Vuna_dCompiler_dStore_dheaderOk", ("Vuna.Compiler.Store.headerOk", "Vuna/Compiler/Store.vuna:126"));
  ("v_Vuna_dCompiler_dStore_dheaderDigestOf", ("Vuna.Compiler.Store.headerDigestOf", "Vuna/Compiler/Store.vuna:144"));
  ("v_Vuna_dCompiler_dStore_dstoreDecode", ("Vuna.Compiler.Store.storeDecode", "Vuna/Compiler/Store.vuna:150"));
  ("v_Vuna_dCompiler_dStore_dstoreDecodeAs", ("Vuna.Compiler.Store.storeDecodeAs", "Vuna/Compiler/Store.vuna:164"));
  ("v_Vuna_dCompiler_dStore_dstoreDecodeFast", ("Vuna.Compiler.Store.storeDecodeFast", "Vuna/Compiler/Store.vuna:176"));
  ("v_Vuna_dCompiler_dStore_dstoreCacheBaseEff", ("Vuna.Compiler.Store.storeCacheBaseEff", "Vuna/Compiler/Store.vuna:183"));
  ("v_Vuna_dCompiler_dStore_dstoreReadEff", ("Vuna.Compiler.Store.storeReadEff", "Vuna/Compiler/Store.vuna:190"));
  ("v_Vuna_dCompiler_dStore_dstoreReadFastEff", ("Vuna.Compiler.Store.storeReadFastEff", "Vuna/Compiler/Store.vuna:199"));
  ("v_Vuna_dCompiler_dStore_dstoreReadAsEff", ("Vuna.Compiler.Store.storeReadAsEff", "Vuna/Compiler/Store.vuna:208"));
  ("v_Vuna_dCompiler_dStore_dstoreWriteEff", ("Vuna.Compiler.Store.storeWriteEff", "Vuna/Compiler/Store.vuna:217"));
  ("v_Vuna_dCompiler_dStore_dstoreWriteAsEff", ("Vuna.Compiler.Store.storeWriteAsEff", "Vuna/Compiler/Store.vuna:221"));
  ("v_Vuna_dCompiler_dStore_dstoreWriteIfChangedEff", ("Vuna.Compiler.Store.storeWriteIfChangedEff", "Vuna/Compiler/Store.vuna:226"));
  ("v_Vuna_dCompiler_dStore_dstoreWriteIfChangedAsEff", ("Vuna.Compiler.Store.storeWriteIfChangedAsEff", "Vuna/Compiler/Store.vuna:238"));
  ("v_Vuna_dCompiler_dStore_dstoreFileExistsEff", ("Vuna.Compiler.Store.storeFileExistsEff", "Vuna/Compiler/Store.vuna:249"));
  ("v_Vuna_dCompiler_dStore_dstoreRemoveEff", ("Vuna.Compiler.Store.storeRemoveEff", "Vuna/Compiler/Store.vuna:252"));
  ("v_Vuna_dCompiler_dStore_dstoreEnsureDirEff", ("Vuna.Compiler.Store.storeEnsureDirEff", "Vuna/Compiler/Store.vuna:256"));
  ("v_Vuna_dCompiler_dStore_dstoreEnsureDirFuel", ("Vuna.Compiler.Store.storeEnsureDirFuel", "Vuna/Compiler/Store.vuna:265"));
  ("v_Vuna_dCompiler_dStore_dstoreParentOf", ("Vuna.Compiler.Store.storeParentOf", "Vuna/Compiler/Store.vuna:272"));
  ("v_Vuna_dCompiler_dStore_dstoreParentPathOf", ("Vuna.Compiler.Store.storeParentPathOf", "Vuna/Compiler/Store.vuna:285"));
  ("v_Vuna_dCompiler_dStore_dstoreDropPastSlash", ("Vuna.Compiler.Store.storeDropPastSlash", "Vuna/Compiler/Store.vuna:288"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dqtyIsZero", ("Vuna.Compiler.Frontend.Ast.qtyIsZero", "Vuna/Compiler/Frontend/Ast.vuna:164"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dreprPrefix", ("Vuna.Compiler.Frontend.Ast.reprPrefix", "Vuna/Compiler/Frontend/Ast.vuna:178"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dfixitySpan", ("Vuna.Compiler.Frontend.Ast.fixitySpan", "Vuna/Compiler/Frontend/Ast.vuna:238"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dpatSpan", ("Vuna.Compiler.Frontend.Ast.patSpan", "Vuna/Compiler/Frontend/Ast.vuna:297"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dexprSpan", ("Vuna.Compiler.Frontend.Ast.exprSpan", "Vuna/Compiler/Frontend/Ast.vuna:306"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoStmtSpan", ("Vuna.Compiler.Frontend.Ast.doStmtSpan", "Vuna/Compiler/Frontend/Ast.vuna:331"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoStmtExpr", ("Vuna.Compiler.Frontend.Ast.doStmtExpr", "Vuna/Compiler/Frontend/Ast.vuna:335"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan", ("Vuna.Compiler.Frontend.Ast.declSpan", "Vuna/Compiler/Frontend/Ast.vuna:339"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorSpan", ("Vuna.Compiler.Frontend.Ast.ctorSpan", "Vuna/Compiler/Frontend/Ast.vuna:349"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dfieldSpan", ("Vuna.Compiler.Frontend.Ast.fieldSpan", "Vuna/Compiler/Frontend/Ast.vuna:352"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dfieldName", ("Vuna.Compiler.Frontend.Ast.fieldName", "Vuna/Compiler/Frontend/Ast.vuna:355"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dfieldType", ("Vuna.Compiler.Frontend.Ast.fieldType", "Vuna/Compiler/Frontend/Ast.vuna:358"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName", ("Vuna.Compiler.Frontend.Ast.traitMethodName", "Vuna/Compiler/Frontend/Ast.vuna:361"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan", ("Vuna.Compiler.Frontend.Ast.traitMethodSpan", "Vuna/Compiler/Frontend/Ast.vuna:364"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dexportItemSpan", ("Vuna.Compiler.Frontend.Ast.exportItemSpan", "Vuna/Compiler/Frontend/Ast.vuna:373"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses", ("Vuna.Compiler.Frontend.Ast.collectClauses", "Vuna/Compiler/Frontend/Ast.vuna:378"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dclausesFor", ("Vuna.Compiler.Frontend.Ast.clausesFor", "Vuna/Compiler/Frontend/Ast.vuna:385"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dfunArity", ("Vuna.Compiler.Frontend.Ast.funArity", "Vuna/Compiler/Frontend/Ast.vuna:388"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorName", ("Vuna.Compiler.Frontend.Ast.ctorName", "Vuna/Compiler/Frontend/Ast.vuna:393"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorShortName", ("Vuna.Compiler.Frontend.Ast.ctorShortName", "Vuna/Compiler/Frontend/Ast.vuna:399"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName", ("Vuna.Compiler.Frontend.Ast.ctorDisplayName", "Vuna/Compiler/Frontend/Ast.vuna:405"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorType", ("Vuna.Compiler.Frontend.Ast.ctorType", "Vuna/Compiler/Frontend/Ast.vuna:412"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dtypeArity", ("Vuna.Compiler.Frontend.Ast.typeArity", "Vuna/Compiler/Frontend/Ast.vuna:415"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity", ("Vuna.Compiler.Frontend.Ast.lookupCtorArity", "Vuna/Compiler/Frontend/Ast.vuna:419"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorArity", ("Vuna.Compiler.Frontend.Ast.ctorArity", "Vuna/Compiler/Frontend/Ast.vuna:424"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddeclNames", ("Vuna.Compiler.Frontend.Ast.declNames", "Vuna/Compiler/Frontend/Ast.vuna:434"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dtopNames", ("Vuna.Compiler.Frontend.Ast.topNames", "Vuna/Compiler/Frontend/Ast.vuna:447"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddeclAllNames", ("Vuna.Compiler.Frontend.Ast.declAllNames", "Vuna/Compiler/Frontend/Ast.vuna:450"));
  ("v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors", ("Vuna.Compiler.Frontend.Ast._declCtors", "Vuna/Compiler/Frontend/Ast.vuna:457"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorsOf", ("Vuna.Compiler.Frontend.Ast.ctorsOf", "Vuna/Compiler/Frontend/Ast.vuna:463"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames", ("Vuna.Compiler.Frontend.Ast.declTypeNames", "Vuna/Compiler/Frontend/Ast.vuna:466"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf", ("Vuna.Compiler.Frontend.Ast.typeNamesOf", "Vuna/Compiler/Frontend/Ast.vuna:472"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddeclDerivings", ("Vuna.Compiler.Frontend.Ast.declDerivings", "Vuna/Compiler/Frontend/Ast.vuna:475"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disHoleName", ("Vuna.Compiler.Frontend.Ast.isHoleName", "Vuna/Compiler/Frontend/Ast.vuna:486"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dholeNamed", ("Vuna.Compiler.Frontend.Ast.holeNamed", "Vuna/Compiler/Frontend/Ast.vuna:489"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dholeNameOf", ("Vuna.Compiler.Frontend.Ast.holeNameOf", "Vuna/Compiler/Frontend/Ast.vuna:495"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dinternalNamePrefix", ("Vuna.Compiler.Frontend.Ast.internalNamePrefix", "Vuna/Compiler/Frontend/Ast.vuna:505"));
  ("v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix", ("Vuna.Compiler.Frontend.Ast.overCtorPrefix", "Vuna/Compiler/Frontend/Ast.vuna:509"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName", ("Vuna.Compiler.Frontend.Ast.isInternalSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:513"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddropNChars", ("Vuna.Compiler.Frontend.Ast.dropNChars", "Vuna/Compiler/Frontend/Ast.vuna:517"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix", ("Vuna.Compiler.Frontend.Ast.dropNamePrefix", "Vuna/Compiler/Frontend/Ast.vuna:524"));
  ("v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt", ("Vuna.Compiler.Frontend.Ast.joinWithAt", "Vuna/Compiler/Frontend/Ast.vuna:529"));
  ("v_Vuna_dCompiler_dFrontend_dAst_doverCtorName", ("Vuna.Compiler.Frontend.Ast.overCtorName", "Vuna/Compiler/Frontend/Ast.vuna:535"));
  ("v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort", ("Vuna.Compiler.Frontend.Ast.overCtorShort", "Vuna/Compiler/Frontend/Ast.vuna:539"));
  ("v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets", ("Vuna.Compiler.Frontend.Ast.overCtorTargets", "Vuna/Compiler/Frontend/Ast.vuna:545"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName", ("Vuna.Compiler.Frontend.Ast.isOverCtorName", "Vuna/Compiler/Frontend/Ast.vuna:551"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax", ("Vuna.Compiler.Frontend.Ast.listNilSyntax", "Vuna/Compiler/Frontend/Ast.vuna:557"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax", ("Vuna.Compiler.Frontend.Ast.listConsSyntax", "Vuna/Compiler/Frontend/Ast.vuna:561"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax", ("Vuna.Compiler.Frontend.Ast.isListNilSyntax", "Vuna/Compiler/Frontend/Ast.vuna:565"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax", ("Vuna.Compiler.Frontend.Ast.isListConsSyntax", "Vuna/Compiler/Frontend/Ast.vuna:569"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax", ("Vuna.Compiler.Frontend.Ast.performSyntax", "Vuna/Compiler/Frontend/Ast.vuna:591"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disPerformSyntax", ("Vuna.Compiler.Frontend.Ast.isPerformSyntax", "Vuna/Compiler/Frontend/Ast.vuna:595"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dhandleSyntax", ("Vuna.Compiler.Frontend.Ast.handleSyntax", "Vuna/Compiler/Frontend/Ast.vuna:607"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disHandleSyntax", ("Vuna.Compiler.Frontend.Ast.isHandleSyntax", "Vuna/Compiler/Frontend/Ast.vuna:611"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dhandleNoRetSyntax", ("Vuna.Compiler.Frontend.Ast.handleNoRetSyntax", "Vuna/Compiler/Frontend/Ast.vuna:615"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disHandleNoRetSyntax", ("Vuna.Compiler.Frontend.Ast.isHandleNoRetSyntax", "Vuna/Compiler/Frontend/Ast.vuna:619"));
  ("v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax", ("Vuna.Compiler.Frontend.Ast.rowAtSyntax", "Vuna/Compiler/Frontend/Ast.vuna:625"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disRowAtSyntax", ("Vuna.Compiler.Frontend.Ast.isRowAtSyntax", "Vuna/Compiler/Frontend/Ast.vuna:629"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix", ("Vuna.Compiler.Frontend.Ast.macroSyntaxPrefix", "Vuna/Compiler/Frontend/Ast.vuna:641"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxName", ("Vuna.Compiler.Frontend.Ast.macroSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:645"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName", ("Vuna.Compiler.Frontend.Ast.isMacroSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:649"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dmacroNameOf", ("Vuna.Compiler.Frontend.Ast.macroNameOf", "Vuna/Compiler/Frontend/Ast.vuna:653"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix", ("Vuna.Compiler.Frontend.Ast.doBindSyntaxPrefix", "Vuna/Compiler/Frontend/Ast.vuna:658"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix", ("Vuna.Compiler.Frontend.Ast.doIgnoreSyntaxPrefix", "Vuna/Compiler/Frontend/Ast.vuna:662"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxName", ("Vuna.Compiler.Frontend.Ast.doBindSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:666"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName", ("Vuna.Compiler.Frontend.Ast.doIgnoreSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:670"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disDoBindSyntaxName", ("Vuna.Compiler.Frontend.Ast.isDoBindSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:674"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disDoIgnoreSyntaxName", ("Vuna.Compiler.Frontend.Ast.isDoIgnoreSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:678"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical", ("Vuna.Compiler.Frontend.Ast.doSyntaxCanonical", "Vuna/Compiler/Frontend/Ast.vuna:683"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dnoSpan", ("Vuna.Compiler.Canonical.Ast.noSpan", "Vuna/Compiler/Canonical/Ast.vuna:81"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencQty", ("Vuna.Compiler.Canonical.Ast.encQty", "Vuna/Compiler/Canonical/Ast.vuna:88"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencReprTier", ("Vuna.Compiler.Canonical.Ast.encReprTier", "Vuna/Compiler/Canonical/Ast.vuna:93"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencMaybeQty", ("Vuna.Compiler.Canonical.Ast.encMaybeQty", "Vuna/Compiler/Canonical/Ast.vuna:99"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencMaybeExpr", ("Vuna.Compiler.Canonical.Ast.encMaybeExpr", "Vuna/Compiler/Canonical/Ast.vuna:104"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencStrList", ("Vuna.Compiler.Canonical.Ast.encStrList", "Vuna/Compiler/Canonical/Ast.vuna:114"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencStrListGo", ("Vuna.Compiler.Canonical.Ast.encStrListGo", "Vuna/Compiler/Canonical/Ast.vuna:118"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencExprList", ("Vuna.Compiler.Canonical.Ast.encExprList", "Vuna/Compiler/Canonical/Ast.vuna:123"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencExprListGo", ("Vuna.Compiler.Canonical.Ast.encExprListGo", "Vuna/Compiler/Canonical/Ast.vuna:127"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencPatList", ("Vuna.Compiler.Canonical.Ast.encPatList", "Vuna/Compiler/Canonical/Ast.vuna:132"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencPatListGo", ("Vuna.Compiler.Canonical.Ast.encPatListGo", "Vuna/Compiler/Canonical/Ast.vuna:136"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencPatExprList", ("Vuna.Compiler.Canonical.Ast.encPatExprList", "Vuna/Compiler/Canonical/Ast.vuna:141"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencPatExprListGo", ("Vuna.Compiler.Canonical.Ast.encPatExprListGo", "Vuna/Compiler/Canonical/Ast.vuna:145"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencClauses", ("Vuna.Compiler.Canonical.Ast.encClauses", "Vuna/Compiler/Canonical/Ast.vuna:150"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencClausesGo", ("Vuna.Compiler.Canonical.Ast.encClausesGo", "Vuna/Compiler/Canonical/Ast.vuna:154"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencStmtList", ("Vuna.Compiler.Canonical.Ast.encStmtList", "Vuna/Compiler/Canonical/Ast.vuna:159"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencStmtListGo", ("Vuna.Compiler.Canonical.Ast.encStmtListGo", "Vuna/Compiler/Canonical/Ast.vuna:163"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencPartList", ("Vuna.Compiler.Canonical.Ast.encPartList", "Vuna/Compiler/Canonical/Ast.vuna:168"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencPartListGo", ("Vuna.Compiler.Canonical.Ast.encPartListGo", "Vuna/Compiler/Canonical/Ast.vuna:172"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencStrExprList", ("Vuna.Compiler.Canonical.Ast.encStrExprList", "Vuna/Compiler/Canonical/Ast.vuna:177"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencStrExprListGo", ("Vuna.Compiler.Canonical.Ast.encStrExprListGo", "Vuna/Compiler/Canonical/Ast.vuna:181"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencStrPatList", ("Vuna.Compiler.Canonical.Ast.encStrPatList", "Vuna/Compiler/Canonical/Ast.vuna:186"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencStrPatListGo", ("Vuna.Compiler.Canonical.Ast.encStrPatListGo", "Vuna/Compiler/Canonical/Ast.vuna:190"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencCtorList", ("Vuna.Compiler.Canonical.Ast.encCtorList", "Vuna/Compiler/Canonical/Ast.vuna:195"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencCtorListGo", ("Vuna.Compiler.Canonical.Ast.encCtorListGo", "Vuna/Compiler/Canonical/Ast.vuna:199"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencFieldList", ("Vuna.Compiler.Canonical.Ast.encFieldList", "Vuna/Compiler/Canonical/Ast.vuna:204"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencFieldListGo", ("Vuna.Compiler.Canonical.Ast.encFieldListGo", "Vuna/Compiler/Canonical/Ast.vuna:208"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencTraitParamList", ("Vuna.Compiler.Canonical.Ast.encTraitParamList", "Vuna/Compiler/Canonical/Ast.vuna:213"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencTraitParamListGo", ("Vuna.Compiler.Canonical.Ast.encTraitParamListGo", "Vuna/Compiler/Canonical/Ast.vuna:217"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencTraitMethodList", ("Vuna.Compiler.Canonical.Ast.encTraitMethodList", "Vuna/Compiler/Canonical/Ast.vuna:222"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencTraitMethodListGo", ("Vuna.Compiler.Canonical.Ast.encTraitMethodListGo", "Vuna/Compiler/Canonical/Ast.vuna:226"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencDecls", ("Vuna.Compiler.Canonical.Ast.encDecls", "Vuna/Compiler/Canonical/Ast.vuna:231"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencDeclsGo", ("Vuna.Compiler.Canonical.Ast.encDeclsGo", "Vuna/Compiler/Canonical/Ast.vuna:235"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencInterpPart", ("Vuna.Compiler.Canonical.Ast.encInterpPart", "Vuna/Compiler/Canonical/Ast.vuna:240"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencPat", ("Vuna.Compiler.Canonical.Ast.encPat", "Vuna/Compiler/Canonical/Ast.vuna:245"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencDoStmt", ("Vuna.Compiler.Canonical.Ast.encDoStmt", "Vuna/Compiler/Canonical/Ast.vuna:255"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencExpr", ("Vuna.Compiler.Canonical.Ast.encExpr", "Vuna/Compiler/Canonical/Ast.vuna:260"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencCtor", ("Vuna.Compiler.Canonical.Ast.encCtor", "Vuna/Compiler/Canonical/Ast.vuna:288"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencField", ("Vuna.Compiler.Canonical.Ast.encField", "Vuna/Compiler/Canonical/Ast.vuna:292"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencTraitParam", ("Vuna.Compiler.Canonical.Ast.encTraitParam", "Vuna/Compiler/Canonical/Ast.vuna:296"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencTraitMethod", ("Vuna.Compiler.Canonical.Ast.encTraitMethod", "Vuna/Compiler/Canonical/Ast.vuna:300"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencDecl", ("Vuna.Compiler.Canonical.Ast.encDecl", "Vuna/Compiler/Canonical/Ast.vuna:304"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecQty", ("Vuna.Compiler.Canonical.Ast.decQty", "Vuna/Compiler/Canonical/Ast.vuna:324"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecReprTier", ("Vuna.Compiler.Canonical.Ast.decReprTier", "Vuna/Compiler/Canonical/Ast.vuna:334"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecMaybeQty", ("Vuna.Compiler.Canonical.Ast.decMaybeQty", "Vuna/Compiler/Canonical/Ast.vuna:345"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecMaybeExpr", ("Vuna.Compiler.Canonical.Ast.decMaybeExpr", "Vuna/Compiler/Canonical/Ast.vuna:349"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecInterpPart", ("Vuna.Compiler.Canonical.Ast.decInterpPart", "Vuna/Compiler/Canonical/Ast.vuna:353"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecPat", ("Vuna.Compiler.Canonical.Ast.decPat", "Vuna/Compiler/Canonical/Ast.vuna:367"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecDoStmt", ("Vuna.Compiler.Canonical.Ast.decDoStmt", "Vuna/Compiler/Canonical/Ast.vuna:400"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecExpr", ("Vuna.Compiler.Canonical.Ast.decExpr", "Vuna/Compiler/Canonical/Ast.vuna:416"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecCtor", ("Vuna.Compiler.Canonical.Ast.decCtor", "Vuna/Compiler/Canonical/Ast.vuna:537"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecField", ("Vuna.Compiler.Canonical.Ast.decField", "Vuna/Compiler/Canonical/Ast.vuna:552"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecTraitParam", ("Vuna.Compiler.Canonical.Ast.decTraitParam", "Vuna/Compiler/Canonical/Ast.vuna:565"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecTraitMethod", ("Vuna.Compiler.Canonical.Ast.decTraitMethod", "Vuna/Compiler/Canonical/Ast.vuna:578"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecDecl", ("Vuna.Compiler.Canonical.Ast.decDecl", "Vuna/Compiler/Canonical/Ast.vuna:591"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecPatExpr", ("Vuna.Compiler.Canonical.Ast.decPatExpr", "Vuna/Compiler/Canonical/Ast.vuna:671"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecClause", ("Vuna.Compiler.Canonical.Ast.decClause", "Vuna/Compiler/Canonical/Ast.vuna:680"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecStrExpr", ("Vuna.Compiler.Canonical.Ast.decStrExpr", "Vuna/Compiler/Canonical/Ast.vuna:689"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecStrPat", ("Vuna.Compiler.Canonical.Ast.decStrPat", "Vuna/Compiler/Canonical/Ast.vuna:698"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecListHead", ("Vuna.Compiler.Canonical.Ast.decListHead", "Vuna/Compiler/Canonical/Ast.vuna:708"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecListDigits", ("Vuna.Compiler.Canonical.Ast.decListDigits", "Vuna/Compiler/Canonical/Ast.vuna:715"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecExprList", ("Vuna.Compiler.Canonical.Ast.decExprList", "Vuna/Compiler/Canonical/Ast.vuna:730"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecExprListItems", ("Vuna.Compiler.Canonical.Ast.decExprListItems", "Vuna/Compiler/Canonical/Ast.vuna:737"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecPatList", ("Vuna.Compiler.Canonical.Ast.decPatList", "Vuna/Compiler/Canonical/Ast.vuna:745"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecPatListItems", ("Vuna.Compiler.Canonical.Ast.decPatListItems", "Vuna/Compiler/Canonical/Ast.vuna:752"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecDecls", ("Vuna.Compiler.Canonical.Ast.decDecls", "Vuna/Compiler/Canonical/Ast.vuna:760"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecDeclsItems", ("Vuna.Compiler.Canonical.Ast.decDeclsItems", "Vuna/Compiler/Canonical/Ast.vuna:767"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecPatComplete", ("Vuna.Compiler.Canonical.Ast.decPatComplete", "Vuna/Compiler/Canonical/Ast.vuna:775"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecExprComplete", ("Vuna.Compiler.Canonical.Ast.decExprComplete", "Vuna/Compiler/Canonical/Ast.vuna:781"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecDeclComplete", ("Vuna.Compiler.Canonical.Ast.decDeclComplete", "Vuna/Compiler/Canonical/Ast.vuna:787"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecQtyComplete", ("Vuna.Compiler.Canonical.Ast.decQtyComplete", "Vuna/Compiler/Canonical/Ast.vuna:793"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecReprTierComplete", ("Vuna.Compiler.Canonical.Ast.decReprTierComplete", "Vuna/Compiler/Canonical/Ast.vuna:799"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecInterpPartComplete", ("Vuna.Compiler.Canonical.Ast.decInterpPartComplete", "Vuna/Compiler/Canonical/Ast.vuna:805"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecDoStmtComplete", ("Vuna.Compiler.Canonical.Ast.decDoStmtComplete", "Vuna/Compiler/Canonical/Ast.vuna:811"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecCtorComplete", ("Vuna.Compiler.Canonical.Ast.decCtorComplete", "Vuna/Compiler/Canonical/Ast.vuna:817"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecFieldComplete", ("Vuna.Compiler.Canonical.Ast.decFieldComplete", "Vuna/Compiler/Canonical/Ast.vuna:823"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecTraitParamComplete", ("Vuna.Compiler.Canonical.Ast.decTraitParamComplete", "Vuna/Compiler/Canonical/Ast.vuna:829"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecTraitMethodComplete", ("Vuna.Compiler.Canonical.Ast.decTraitMethodComplete", "Vuna/Compiler/Canonical/Ast.vuna:835"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecDeclsComplete", ("Vuna.Compiler.Canonical.Ast.decDeclsComplete", "Vuna/Compiler/Canonical/Ast.vuna:841"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencExportItem", ("Vuna.Compiler.Canonical.Ast.encExportItem", "Vuna/Compiler/Canonical/Ast.vuna:856"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencModDecl", ("Vuna.Compiler.Canonical.Ast.encModDecl", "Vuna/Compiler/Canonical/Ast.vuna:862"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencSourceFile", ("Vuna.Compiler.Canonical.Ast.encSourceFile", "Vuna/Compiler/Canonical/Ast.vuna:868"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencImportLike", ("Vuna.Compiler.Canonical.Ast.encImportLike", "Vuna/Compiler/Canonical/Ast.vuna:876"));
  ("v_Vuna_dCompiler_dCanonical_dAst_dencFixityLike", ("Vuna.Compiler.Canonical.Ast.encFixityLike", "Vuna/Compiler/Canonical/Ast.vuna:880"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecExportItem", ("Vuna.Compiler.Canonical.Ast.decExportItem", "Vuna/Compiler/Canonical/Ast.vuna:886"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecModDecl", ("Vuna.Compiler.Canonical.Ast.decModDecl", "Vuna/Compiler/Canonical/Ast.vuna:896"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecImportLike", ("Vuna.Compiler.Canonical.Ast.decImportLike", "Vuna/Compiler/Canonical/Ast.vuna:901"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecFixityLike", ("Vuna.Compiler.Canonical.Ast.decFixityLike", "Vuna/Compiler/Canonical/Ast.vuna:906"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecSourceFileComplete", ("Vuna.Compiler.Canonical.Ast.decSourceFileComplete", "Vuna/Compiler/Canonical/Ast.vuna:912"));
  ("v_Vuna_dCompiler_dCanonical_dAst_ddecSourceFileGo", ("Vuna.Compiler.Canonical.Ast.decSourceFileGo", "Vuna/Compiler/Canonical/Ast.vuna:917"));
  ("v_Base_dArray_dfromList", ("Base.Array.fromList", "Base/Array.vuna:22"));
  ("v_Base_dArray_dtoList", ("Base.Array.toList", "Base/Array.vuna:26"));
  ("v_Base_dArray_dlength", ("Base.Array.length", "Base/Array.vuna:30"));
  ("v_Base_dArray_dget", ("Base.Array.get", "Base/Array.vuna:34"));
  ("v_Base_dArray_dset", ("Base.Array.set", "Base/Array.vuna:38"));
  ("v_Base_dArray_dmake", ("Base.Array.make", "Base/Array.vuna:42"));
  ("v_Base_dHashMap_d_ubucketOf", ("Base.HashMap._bucketOf", "Base/HashMap.vuna:48"));
  ("v_Base_dHashMap_d_ulookupAssoc", ("Base.HashMap._lookupAssoc", "Base/HashMap.vuna:54"));
  ("v_Base_dHashMap_d_uhasKeyIn", ("Base.HashMap._hasKeyIn", "Base/HashMap.vuna:60"));
  ("v_Base_dHashMap_d_udedupGo", ("Base.HashMap._dedupGo", "Base/HashMap.vuna:64"));
  ("v_Base_dHashMap_d_udedupBucket", ("Base.HashMap._dedupBucket", "Base/HashMap.vuna:69"));
  ("v_Base_dHashMap_dinsert", ("Base.HashMap.insert", "Base/HashMap.vuna:76"));
  ("v_Base_dHashMap_dlookup", ("Base.HashMap.lookup", "Base/HashMap.vuna:90"));
  ("v_Base_dHashMap_dmember", ("Base.HashMap.member", "Base/HashMap.vuna:101"));
  ("v_Base_dHashMap_dinsertAll", ("Base.HashMap.insertAll", "Base/HashMap.vuna:107"));
  ("v_Base_dHashMap_dfromList", ("Base.HashMap.fromList", "Base/HashMap.vuna:114"));
  ("v_Base_dHashMap_dofNames", ("Base.HashMap.ofNames", "Base/HashMap.vuna:120"));
  ("v_Base_dHashMap_dtoList", ("Base.HashMap.toList", "Base/HashMap.vuna:124"));
  ("v_Base_dHashMap_dsize", ("Base.HashMap.size", "Base/HashMap.vuna:130"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnCode", ("Vuna.Compiler.Diagnostics.Rn.rnCode", "Vuna/Compiler/Diagnostics/Rn.vuna:67"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnTemplate", ("Vuna.Compiler.Diagnostics.Rn.rnTemplate", "Vuna/Compiler/Diagnostics/Rn.vuna:96"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnMsg", ("Vuna.Compiler.Diagnostics.Rn.rnMsg", "Vuna/Compiler/Diagnostics/Rn.vuna:128"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnErr", ("Vuna.Compiler.Diagnostics.Rn.rnErr", "Vuna/Compiler/Diagnostics/Rn.vuna:132"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc", ("Vuna.Compiler.Diagnostics.Rn.rnNoLoc", "Vuna/Compiler/Diagnostics/Rn.vuna:136"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnAt0", ("Vuna.Compiler.Diagnostics.Rn.rnAt0", "Vuna/Compiler/Diagnostics/Rn.vuna:140"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnAt1", ("Vuna.Compiler.Diagnostics.Rn.rnAt1", "Vuna/Compiler/Diagnostics/Rn.vuna:144"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnAt2", ("Vuna.Compiler.Diagnostics.Rn.rnAt2", "Vuna/Compiler/Diagnostics/Rn.vuna:148"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnAt3", ("Vuna.Compiler.Diagnostics.Rn.rnAt3", "Vuna/Compiler/Diagnostics/Rn.vuna:152"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc0", ("Vuna.Compiler.Diagnostics.Rn.rnNoLoc0", "Vuna/Compiler/Diagnostics/Rn.vuna:156"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc1", ("Vuna.Compiler.Diagnostics.Rn.rnNoLoc1", "Vuna/Compiler/Diagnostics/Rn.vuna:160"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnNoLoc2", ("Vuna.Compiler.Diagnostics.Rn.rnNoLoc2", "Vuna/Compiler/Diagnostics/Rn.vuna:164"));
  ("v_Vuna_dCompiler_dDiagnostics_dRn_drnAll", ("Vuna.Compiler.Diagnostics.Rn.rnAll", "Vuna/Compiler/Diagnostics/Rn.vuna:174"));
  ("v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnCode", ("Vuna.Compiler.Diagnostics.Warning.warnCode", "Vuna/Compiler/Diagnostics/Warning.vuna:39"));
  ("v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnTemplate", ("Vuna.Compiler.Diagnostics.Warning.warnTemplate", "Vuna/Compiler/Diagnostics/Warning.vuna:49"));
  ("v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnMsg", ("Vuna.Compiler.Diagnostics.Warning.warnMsg", "Vuna/Compiler/Diagnostics/Warning.vuna:61"));
  ("v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnDiagAt", ("Vuna.Compiler.Diagnostics.Warning.warnDiagAt", "Vuna/Compiler/Diagnostics/Warning.vuna:66"));
  ("v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnDiagAtMod", ("Vuna.Compiler.Diagnostics.Warning.warnDiagAtMod", "Vuna/Compiler/Diagnostics/Warning.vuna:70"));
  ("v_Vuna_dCompiler_dDiagnostics_dWarning_dwarnAll", ("Vuna.Compiler.Diagnostics.Warning.warnAll", "Vuna/Compiler/Diagnostics/Warning.vuna:80"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexCode", ("Vuna.Compiler.Frontend.Diagnostics.lexCode", "Vuna/Compiler/Frontend/Diagnostics.vuna:51"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexTemplate", ("Vuna.Compiler.Frontend.Diagnostics.lexTemplate", "Vuna/Compiler/Frontend/Diagnostics.vuna:59"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsCode", ("Vuna.Compiler.Frontend.Diagnostics.psCode", "Vuna/Compiler/Frontend/Diagnostics.vuna:129"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsTemplate", ("Vuna.Compiler.Frontend.Diagnostics.psTemplate", "Vuna/Compiler/Frontend/Diagnostics.vuna:176"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexAll", ("Vuna.Compiler.Frontend.Diagnostics.lexAll", "Vuna/Compiler/Frontend/Diagnostics.vuna:242"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsAll", ("Vuna.Compiler.Frontend.Diagnostics.psAll", "Vuna/Compiler/Frontend/Diagnostics.vuna:252"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexMsg", ("Vuna.Compiler.Frontend.Diagnostics.lexMsg", "Vuna/Compiler/Frontend/Diagnostics.vuna:304"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsMsg", ("Vuna.Compiler.Frontend.Diagnostics.psMsg", "Vuna/Compiler/Frontend/Diagnostics.vuna:307"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr", ("Vuna.Compiler.Frontend.Diagnostics.lexErr", "Vuna/Compiler/Frontend/Diagnostics.vuna:310"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr", ("Vuna.Compiler.Frontend.Diagnostics.psErr", "Vuna/Compiler/Frontend/Diagnostics.vuna:313"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dlexErr0", ("Vuna.Compiler.Frontend.Diagnostics.lexErr0", "Vuna/Compiler/Frontend/Diagnostics.vuna:319"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr0", ("Vuna.Compiler.Frontend.Diagnostics.psErr0", "Vuna/Compiler/Frontend/Diagnostics.vuna:323"));
  ("v_Vuna_dCompiler_dFrontend_dDiagnostics_dpsErr1", ("Vuna.Compiler.Frontend.Diagnostics.psErr1", "Vuna/Compiler/Frontend/Diagnostics.vuna:327"));
  ("v_Vuna_dCompiler_dLoader_dDiagnostics_dldCode", ("Vuna.Compiler.Loader.Diagnostics.ldCode", "Vuna/Compiler/Loader/Diagnostics.vuna:39"));
  ("v_Vuna_dCompiler_dLoader_dDiagnostics_dldTemplate", ("Vuna.Compiler.Loader.Diagnostics.ldTemplate", "Vuna/Compiler/Loader/Diagnostics.vuna:48"));
  ("v_Vuna_dCompiler_dLoader_dDiagnostics_dldAll", ("Vuna.Compiler.Loader.Diagnostics.ldAll", "Vuna/Compiler/Loader/Diagnostics.vuna:62"));
  ("v_Vuna_dCompiler_dLoader_dDiagnostics_dldMsg", ("Vuna.Compiler.Loader.Diagnostics.ldMsg", "Vuna/Compiler/Loader/Diagnostics.vuna:73"));
  ("v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr", ("Vuna.Compiler.Loader.Diagnostics.ldErr", "Vuna/Compiler/Loader/Diagnostics.vuna:76"));
  ("v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr0", ("Vuna.Compiler.Loader.Diagnostics.ldErr0", "Vuna/Compiler/Loader/Diagnostics.vuna:80"));
  ("v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr1", ("Vuna.Compiler.Loader.Diagnostics.ldErr1", "Vuna/Compiler/Loader/Diagnostics.vuna:84"));
  ("v_Vuna_dCompiler_dLoader_dDiagnostics_dldErr2", ("Vuna.Compiler.Loader.Diagnostics.ldErr2", "Vuna/Compiler/Loader/Diagnostics.vuna:88"));
  ("v_Vuna_dCompiler_dDiagnostics_dCg_dcgCode", ("Vuna.Compiler.Diagnostics.Cg.cgCode", "Vuna/Compiler/Diagnostics/Cg.vuna:43"));
  ("v_Vuna_dCompiler_dDiagnostics_dCg_dcgTemplate", ("Vuna.Compiler.Diagnostics.Cg.cgTemplate", "Vuna/Compiler/Diagnostics/Cg.vuna:56"));
  ("v_Vuna_dCompiler_dDiagnostics_dCg_dcgAll", ("Vuna.Compiler.Diagnostics.Cg.cgAll", "Vuna/Compiler/Diagnostics/Cg.vuna:78"));
  ("v_Vuna_dCompiler_dDiagnostics_dCg_dcgChunk0", ("Vuna.Compiler.Diagnostics.Cg.cgChunk0", "Vuna/Compiler/Diagnostics/Cg.vuna:81"));
  ("v_Vuna_dCompiler_dDiagnostics_dCg_dcgChunk1", ("Vuna.Compiler.Diagnostics.Cg.cgChunk1", "Vuna/Compiler/Diagnostics/Cg.vuna:92"));
  ("v_Vuna_dCompiler_dDiagnostics_dCg_dcgMsg", ("Vuna.Compiler.Diagnostics.Cg.cgMsg", "Vuna/Compiler/Diagnostics/Cg.vuna:103"));
  ("v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr", ("Vuna.Compiler.Diagnostics.Cg.cgErr", "Vuna/Compiler/Diagnostics/Cg.vuna:106"));
  ("v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0", ("Vuna.Compiler.Diagnostics.Cg.cgErr0", "Vuna/Compiler/Diagnostics/Cg.vuna:110"));
  ("v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1", ("Vuna.Compiler.Diagnostics.Cg.cgErr1", "Vuna/Compiler/Diagnostics/Cg.vuna:114"));
  ("v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt", ("Vuna.Compiler.Diagnostics.Cg.cgErrDefAt", "Vuna/Compiler/Diagnostics/Cg.vuna:120"));
  ("v_Vuna_dCompiler_dDiagnostics_dIc_dicCode", ("Vuna.Compiler.Diagnostics.Ic.icCode", "Vuna/Compiler/Diagnostics/Ic.vuna:16"));
  ("v_Vuna_dCompiler_dDiagnostics_dIc_dicTemplate", ("Vuna.Compiler.Diagnostics.Ic.icTemplate", "Vuna/Compiler/Diagnostics/Ic.vuna:20"));
  ("v_Vuna_dCompiler_dDiagnostics_dIc_dicAll", ("Vuna.Compiler.Diagnostics.Ic.icAll", "Vuna/Compiler/Diagnostics/Ic.vuna:30"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcCode", ("Vuna.Compiler.Diagnostics.Tc.tcCode", "Vuna/Compiler/Diagnostics/Tc.vuna:163"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcTemplate", ("Vuna.Compiler.Diagnostics.Tc.tcTemplate", "Vuna/Compiler/Diagnostics/Tc.vuna:270"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk0", ("Vuna.Compiler.Diagnostics.Tc.tcChunk0", "Vuna/Compiler/Diagnostics/Tc.vuna:414"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk1", ("Vuna.Compiler.Diagnostics.Tc.tcChunk1", "Vuna/Compiler/Diagnostics/Tc.vuna:424"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk2", ("Vuna.Compiler.Diagnostics.Tc.tcChunk2", "Vuna/Compiler/Diagnostics/Tc.vuna:435"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk3", ("Vuna.Compiler.Diagnostics.Tc.tcChunk3", "Vuna/Compiler/Diagnostics/Tc.vuna:447"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk4", ("Vuna.Compiler.Diagnostics.Tc.tcChunk4", "Vuna/Compiler/Diagnostics/Tc.vuna:459"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk5", ("Vuna.Compiler.Diagnostics.Tc.tcChunk5", "Vuna/Compiler/Diagnostics/Tc.vuna:469"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk6", ("Vuna.Compiler.Diagnostics.Tc.tcChunk6", "Vuna/Compiler/Diagnostics/Tc.vuna:481"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk7", ("Vuna.Compiler.Diagnostics.Tc.tcChunk7", "Vuna/Compiler/Diagnostics/Tc.vuna:493"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk8", ("Vuna.Compiler.Diagnostics.Tc.tcChunk8", "Vuna/Compiler/Diagnostics/Tc.vuna:504"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk9", ("Vuna.Compiler.Diagnostics.Tc.tcChunk9", "Vuna/Compiler/Diagnostics/Tc.vuna:519"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk10", ("Vuna.Compiler.Diagnostics.Tc.tcChunk10", "Vuna/Compiler/Diagnostics/Tc.vuna:531"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk11", ("Vuna.Compiler.Diagnostics.Tc.tcChunk11", "Vuna/Compiler/Diagnostics/Tc.vuna:547"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcChunk12", ("Vuna.Compiler.Diagnostics.Tc.tcChunk12", "Vuna/Compiler/Diagnostics/Tc.vuna:561"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcAll", ("Vuna.Compiler.Diagnostics.Tc.tcAll", "Vuna/Compiler/Diagnostics/Tc.vuna:568"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcMsg", ("Vuna.Compiler.Diagnostics.Tc.tcMsg", "Vuna/Compiler/Diagnostics/Tc.vuna:577"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr", ("Vuna.Compiler.Diagnostics.Tc.tcErr", "Vuna/Compiler/Diagnostics/Tc.vuna:581"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0", ("Vuna.Compiler.Diagnostics.Tc.tcErr0", "Vuna/Compiler/Diagnostics/Tc.vuna:588"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1", ("Vuna.Compiler.Diagnostics.Tc.tcErr1", "Vuna/Compiler/Diagnostics/Tc.vuna:592"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2", ("Vuna.Compiler.Diagnostics.Tc.tcErr2", "Vuna/Compiler/Diagnostics/Tc.vuna:596"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr0NoLoc", ("Vuna.Compiler.Diagnostics.Tc.tcErr0NoLoc", "Vuna/Compiler/Diagnostics/Tc.vuna:604"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr1NoLoc", ("Vuna.Compiler.Diagnostics.Tc.tcErr1NoLoc", "Vuna/Compiler/Diagnostics/Tc.vuna:608"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr2NoLoc", ("Vuna.Compiler.Diagnostics.Tc.tcErr2NoLoc", "Vuna/Compiler/Diagnostics/Tc.vuna:612"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcTypeMismatch", ("Vuna.Compiler.Diagnostics.Tc.tcTypeMismatch", "Vuna/Compiler/Diagnostics/Tc.vuna:619"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcTypeMismatchNoLoc", ("Vuna.Compiler.Diagnostics.Tc.tcTypeMismatchNoLoc", "Vuna/Compiler/Diagnostics/Tc.vuna:625"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcErr3", ("Vuna.Compiler.Diagnostics.Tc.tcErr3", "Vuna/Compiler/Diagnostics/Tc.vuna:631"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dtcCoverageMissing", ("Vuna.Compiler.Diagnostics.Tc.tcCoverageMissing", "Vuna/Compiler/Diagnostics/Tc.vuna:636"));
  ("v_Vuna_dCompiler_dDiagnostics_dTc_dcoverageCandidate", ("Vuna.Compiler.Diagnostics.Tc.coverageCandidate", "Vuna/Compiler/Diagnostics/Tc.vuna:644"));
  ("v_Vuna_dCompiler_dDiagnostics_dcodeDomain", ("Vuna.Compiler.Diagnostics.codeDomain", "Vuna/Compiler/Diagnostics.vuna:62"));
  ("v_Vuna_dCompiler_dDiagnostics_ddiagPhaseOf", ("Vuna.Compiler.Diagnostics.diagPhaseOf", "Vuna/Compiler/Diagnostics.vuna:68"));
  ("v_Vuna_dCompiler_dDiagnostics_ddiagCategoryOf", ("Vuna.Compiler.Diagnostics.diagCategoryOf", "Vuna/Compiler/Diagnostics.vuna:83"));
  ("v_Vuna_dCompiler_dDiagnostics_ddiagSeverityOf", ("Vuna.Compiler.Diagnostics.diagSeverityOf", "Vuna/Compiler/Diagnostics.vuna:98"));
  ("v_Vuna_dCompiler_dDiagnostics_ddiagDescOf", ("Vuna.Compiler.Diagnostics.diagDescOf", "Vuna/Compiler/Diagnostics.vuna:105"));
  ("v_Vuna_dCompiler_dDiagnostics_dtcDescPairs", ("Vuna.Compiler.Diagnostics.tcDescPairs", "Vuna/Compiler/Diagnostics.vuna:109"));
  ("v_Vuna_dCompiler_dDiagnostics_dcgDescPairs", ("Vuna.Compiler.Diagnostics.cgDescPairs", "Vuna/Compiler/Diagnostics.vuna:114"));
  ("v_Vuna_dCompiler_dDiagnostics_dicDescPairs", ("Vuna.Compiler.Diagnostics.icDescPairs", "Vuna/Compiler/Diagnostics.vuna:119"));
  ("v_Vuna_dCompiler_dDiagnostics_dlexDescPairs", ("Vuna.Compiler.Diagnostics.lexDescPairs", "Vuna/Compiler/Diagnostics.vuna:124"));
  ("v_Vuna_dCompiler_dDiagnostics_dpsDescPairs", ("Vuna.Compiler.Diagnostics.psDescPairs", "Vuna/Compiler/Diagnostics.vuna:129"));
  ("v_Vuna_dCompiler_dDiagnostics_drnDescPairs", ("Vuna.Compiler.Diagnostics.rnDescPairs", "Vuna/Compiler/Diagnostics.vuna:134"));
  ("v_Vuna_dCompiler_dDiagnostics_dpkgDescPairs", ("Vuna.Compiler.Diagnostics.pkgDescPairs", "Vuna/Compiler/Diagnostics.vuna:139"));
  ("v_Vuna_dCompiler_dDiagnostics_dwarnDescPairs", ("Vuna.Compiler.Diagnostics.warnDescPairs", "Vuna/Compiler/Diagnostics.vuna:144"));
  ("v_Vuna_dCompiler_dDiagnostics_dldDescPairs", ("Vuna.Compiler.Diagnostics.ldDescPairs", "Vuna/Compiler/Diagnostics.vuna:149"));
  ("v_Vuna_dCompiler_dDiagnostics_dallDescPairs", ("Vuna.Compiler.Diagnostics.allDescPairs", "Vuna/Compiler/Diagnostics.vuna:154"));
  ("v_Vuna_dCompiler_dDiagnostics_dlookupDesc", ("Vuna.Compiler.Diagnostics.lookupDesc", "Vuna/Compiler/Diagnostics.vuna:160"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar", ("Vuna.Compiler.Frontend.Lexer.advanceChar", "Vuna/Compiler/Frontend/Lexer.vuna:66"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar", ("Vuna.Compiler.Frontend.Lexer.isUpperChar", "Vuna/Compiler/Frontend/Lexer.vuna:69"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar", ("Vuna.Compiler.Frontend.Lexer.isLowerChar", "Vuna/Compiler/Frontend/Lexer.vuna:72"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart", ("Vuna.Compiler.Frontend.Lexer.isIdentStart", "Vuna/Compiler/Frontend/Lexer.vuna:75"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar", ("Vuna.Compiler.Frontend.Lexer.isIdentChar", "Vuna/Compiler/Frontend/Lexer.vuna:78"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disDigit", ("Vuna.Compiler.Frontend.Lexer.isDigit", "Vuna/Compiler/Frontend/Lexer.vuna:81"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disSpace", ("Vuna.Compiler.Frontend.Lexer.isSpace", "Vuna/Compiler/Frontend/Lexer.vuna:84"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disOpChar", ("Vuna.Compiler.Frontend.Lexer.isOpChar", "Vuna/Compiler/Frontend/Lexer.vuna:87"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disKeyword", ("Vuna.Compiler.Frontend.Lexer.isKeyword", "Vuna/Compiler/Frontend/Lexer.vuna:112"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent", ("Vuna.Compiler.Frontend.Lexer.classifyIdent", "Vuna/Compiler/Frontend/Lexer.vuna:144"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment", ("Vuna.Compiler.Frontend.Lexer.skipLineComment", "Vuna/Compiler/Frontend/Lexer.vuna:147"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment", ("Vuna.Compiler.Frontend.Lexer.skipBlockComment", "Vuna/Compiler/Frontend/Lexer.vuna:152"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia", ("Vuna.Compiler.Frontend.Lexer.skipTrivia", "Vuna/Compiler/Frontend/Lexer.vuna:164"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent", ("Vuna.Compiler.Frontend.Lexer.collectIdent", "Vuna/Compiler/Frontend/Lexer.vuna:177"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral", ("Vuna.Compiler.Frontend.Lexer.maxIntLiteral", "Vuna/Compiler/Frontend/Lexer.vuna:189"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt", ("Vuna.Compiler.Frontend.Lexer.collectInt", "Vuna/Compiler/Frontend/Lexer.vuna:194"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat", ("Vuna.Compiler.Frontend.Lexer.digitRunIsFloat", "Vuna/Compiler/Frontend/Lexer.vuna:209"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat", ("Vuna.Compiler.Frontend.Lexer.collectFloat", "Vuna/Compiler/Frontend/Lexer.vuna:219"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac", ("Vuna.Compiler.Frontend.Lexer.collectFrac", "Vuna/Compiler/Frontend/Lexer.vuna:227"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp", ("Vuna.Compiler.Frontend.Lexer.collectOp", "Vuna/Compiler/Frontend/Lexer.vuna:233"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape", ("Vuna.Compiler.Frontend.Lexer.decodeEscape", "Vuna/Compiler/Frontend/Lexer.vuna:251"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline", ("Vuna.Compiler.Frontend.Lexer.dropOpeningNewline", "Vuna/Compiler/Frontend/Lexer.vuna:261"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dflushText", ("Vuna.Compiler.Frontend.Lexer.flushText", "Vuna/Compiler/Frontend/Lexer.vuna:265"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText", ("Vuna.Compiler.Frontend.Lexer.scanTemplateText", "Vuna/Compiler/Frontend/Lexer.vuna:272"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens", ("Vuna.Compiler.Frontend.Lexer.lexHoleTokens", "Vuna/Compiler/Frontend/Lexer.vuna:315"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter", ("Vuna.Compiler.Frontend.Lexer.depthAfter", "Vuna/Compiler/Frontend/Lexer.vuna:327"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken", ("Vuna.Compiler.Frontend.Lexer.lexOneToken", "Vuna/Compiler/Frontend/Lexer.vuna:333"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken", ("Vuna.Compiler.Frontend.Lexer.lexStringToken", "Vuna/Compiler/Frontend/Lexer.vuna:357"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken", ("Vuna.Compiler.Frontend.Lexer.lexSingleStringToken", "Vuna/Compiler/Frontend/Lexer.vuna:371"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexChars", ("Vuna.Compiler.Frontend.Lexer.lexChars", "Vuna/Compiler/Frontend/Lexer.vuna:381"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexSource", ("Vuna.Compiler.Frontend.Lexer.lexSource", "Vuna/Compiler/Frontend/Lexer.vuna:393"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel", ("Vuna.Compiler.Frontend.Lexer.sourceFuel", "Vuna/Compiler/Frontend/Lexer.vuna:402"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpan", ("Vuna.Compiler.Frontend.Lexer.commentSpan", "Vuna/Compiler/Frontend/Lexer.vuna:419"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace", ("Vuna.Compiler.Frontend.Lexer.trimTrailingSpace", "Vuna/Compiler/Frontend/Lexer.vuna:422"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace", ("Vuna.Compiler.Frontend.Lexer.dropTrailingSpace", "Vuna/Compiler/Frontend/Lexer.vuna:425"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody", ("Vuna.Compiler.Frontend.Lexer.collectLineBody", "Vuna/Compiler/Frontend/Lexer.vuna:431"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody", ("Vuna.Compiler.Frontend.Lexer.collectBlockBody", "Vuna/Compiler/Frontend/Lexer.vuna:438"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf", ("Vuna.Compiler.Frontend.Lexer.commentSpanOf", "Vuna/Compiler/Frontend/Lexer.vuna:451"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dskipStringLiteral", ("Vuna.Compiler.Frontend.Lexer.skipStringLiteral", "Vuna/Compiler/Frontend/Lexer.vuna:455"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dskipSingleStringLiteral", ("Vuna.Compiler.Frontend.Lexer.skipSingleStringLiteral", "Vuna/Compiler/Frontend/Lexer.vuna:467"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dscanComments", ("Vuna.Compiler.Frontend.Lexer.scanComments", "Vuna/Compiler/Frontend/Lexer.vuna:472"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexComments", ("Vuna.Compiler.Frontend.Lexer.lexComments", "Vuna/Compiler/Frontend/Lexer.vuna:491"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf", ("Vuna.Compiler.Frontend.Parser.Support.fileOf", "Vuna/Compiler/Frontend/Parser/Support.vuna:56"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dspanOf", ("Vuna.Compiler.Frontend.Parser.Support.spanOf", "Vuna/Compiler/Frontend/Parser/Support.vuna:60"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok", ("Vuna.Compiler.Frontend.Parser.Support.peekTok", "Vuna/Compiler/Frontend/Parser/Support.vuna:65"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos", ("Vuna.Compiler.Frontend.Parser.Support.peekPos", "Vuna/Compiler/Frontend/Parser/Support.vuna:69"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos", ("Vuna.Compiler.Frontend.Parser.Support.lastPos", "Vuna/Compiler/Frontend/Parser/Support.vuna:72"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance", ("Vuna.Compiler.Frontend.Parser.Support.advance", "Vuna/Compiler/Frontend/Parser/Support.vuna:75"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof", ("Vuna.Compiler.Frontend.Parser.Support.isEof", "Vuna/Compiler/Frontend/Parser/Support.vuna:81"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstateFuel", ("Vuna.Compiler.Frontend.Parser.Support.stateFuel", "Vuna/Compiler/Frontend/Parser/Support.vuna:109"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsameLineState", ("Vuna.Compiler.Frontend.Parser.Support.sameLineState", "Vuna/Compiler/Frontend/Parser/Support.vuna:112"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_datSym", ("Vuna.Compiler.Frontend.Parser.Support.atSym", "Vuna/Compiler/Frontend/Parser/Support.vuna:116"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok", ("Vuna.Compiler.Frontend.Parser.Support.nthTok", "Vuna/Compiler/Frontend/Parser/Support.vuna:122"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt", ("Vuna.Compiler.Frontend.Parser.Support.peekTokAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:126"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderHead", ("Vuna.Compiler.Frontend.Parser.Support.binderHead", "Vuna/Compiler/Frontend/Parser/Support.vuna:132"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail", ("Vuna.Compiler.Frontend.Parser.Support.binderNameTail", "Vuna/Compiler/Frontend/Parser/Support.vuna:143"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead", ("Vuna.Compiler.Frontend.Parser.Support.quantifiedHead", "Vuna/Compiler/Frontend/Parser/Support.vuna:150"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_datKw", ("Vuna.Compiler.Frontend.Parser.Support.atKw", "Vuna/Compiler/Frontend/Parser/Support.vuna:157"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcanContinue", ("Vuna.Compiler.Frontend.Parser.Support.canContinue", "Vuna/Compiler/Frontend/Parser/Support.vuna:162"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectSym", ("Vuna.Compiler.Frontend.Parser.Support.expectSym", "Vuna/Compiler/Frontend/Parser/Support.vuna:167"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectKw", ("Vuna.Compiler.Frontend.Parser.Support.expectKw", "Vuna/Compiler/Frontend/Parser/Support.vuna:172"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectIdent", ("Vuna.Compiler.Frontend.Parser.Support.expectIdent", "Vuna/Compiler/Frontend/Parser/Support.vuna:177"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectValueName", ("Vuna.Compiler.Frontend.Parser.Support.expectValueName", "Vuna/Compiler/Frontend/Parser/Support.vuna:184"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst", ("Vuna.Compiler.Frontend.Parser.Support.upperFirst", "Vuna/Compiler/Frontend/Parser/Support.vuna:194"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName", ("Vuna.Compiler.Frontend.Parser.Support.underscoreCtorName", "Vuna/Compiler/Frontend/Parser/Support.vuna:201"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dctorPatternStart", ("Vuna.Compiler.Frontend.Parser.Support.ctorPatternStart", "Vuna/Compiler/Frontend/Parser/Support.vuna:209"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsAtom", ("Vuna.Compiler.Frontend.Parser.Support.startsAtom", "Vuna/Compiler/Frontend/Parser/Support.vuna:212"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt", ("Vuna.Compiler.Frontend.Parser.Support.holeAtomAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:230"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsPatternAtom", ("Vuna.Compiler.Frontend.Parser.Support.startsPatternAtom", "Vuna/Compiler/Frontend/Parser/Support.vuna:240"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym", ("Vuna.Compiler.Frontend.Parser.Support.isSyntaxSym", "Vuna/Compiler/Frontend/Parser/Support.vuna:252"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName", ("Vuna.Compiler.Frontend.Parser.Support.isReservedValueName", "Vuna/Compiler/Frontend/Parser/Support.vuna:278"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcloseParenNext", ("Vuna.Compiler.Frontend.Parser.Support.closeParenNext", "Vuna/Compiler/Frontend/Parser/Support.vuna:283"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsectionOpAt", ("Vuna.Compiler.Frontend.Parser.Support.sectionOpAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:291"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows", ("Vuna.Compiler.Frontend.Parser.Support.countArrows", "Vuna/Compiler/Frontend/Parser/Support.vuna:300"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression", ("Vuna.Compiler.Frontend.Parser.Support.terminatesExpression", "Vuna/Compiler/Frontend/Parser/Support.vuna:305"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbadCaseIndent", ("Vuna.Compiler.Frontend.Parser.Support.badCaseIndent", "Vuna/Compiler/Frontend/Parser/Support.vuna:314"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSource", ("Vuna.Compiler.Frontend.Parser.parseSource", "Vuna/Compiler/Frontend/Parser.vuna:17"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExpressionSource", ("Vuna.Compiler.Frontend.Parser.parseExpressionSource", "Vuna/Compiler/Frontend/Parser.vuna:23"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSourceFile", ("Vuna.Compiler.Frontend.Parser.parseSourceFile", "Vuna/Compiler/Frontend/Parser.vuna:29"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseModDecl", ("Vuna.Compiler.Frontend.Parser.parseModDecl", "Vuna/Compiler/Frontend/Parser.vuna:41"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExportItems", ("Vuna.Compiler.Frontend.Parser.parseExportItems", "Vuna/Compiler/Frontend/Parser.vuna:47"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExportItemsFrom", ("Vuna.Compiler.Frontend.Parser.parseExportItemsFrom", "Vuna/Compiler/Frontend/Parser.vuna:52"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExportItem", ("Vuna.Compiler.Frontend.Parser.parseExportItem", "Vuna/Compiler/Frontend/Parser.vuna:58"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseImportSpec", ("Vuna.Compiler.Frontend.Parser.parseImportSpec", "Vuna/Compiler/Frontend/Parser.vuna:75"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseImportAlias", ("Vuna.Compiler.Frontend.Parser.parseImportAlias", "Vuna/Compiler/Frontend/Parser.vuna:80"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseImports", ("Vuna.Compiler.Frontend.Parser.parseImports", "Vuna/Compiler/Frontend/Parser.vuna:85"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDecls", ("Vuna.Compiler.Frontend.Parser.parseDecls", "Vuna/Compiler/Frontend/Parser.vuna:94"));
  ("v_Vuna_dCompiler_dFrontend_dParser_drecoverDecl", ("Vuna.Compiler.Frontend.Parser.recoverDecl", "Vuna/Compiler/Frontend/Parser.vuna:120"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dskipToDeclLine", ("Vuna.Compiler.Frontend.Parser.skipToDeclLine", "Vuna/Compiler/Frontend/Parser.vuna:126"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dskipFrom", ("Vuna.Compiler.Frontend.Parser.skipFrom", "Vuna/Compiler/Frontend/Parser.vuna:130"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseFixityOrDecl", ("Vuna.Compiler.Frontend.Parser.parseFixityOrDecl", "Vuna/Compiler/Frontend/Parser.vuna:136"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseFixityDecl", ("Vuna.Compiler.Frontend.Parser.parseFixityDecl", "Vuna/Compiler/Frontend/Parser.vuna:152"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dexpectFixityLevel", ("Vuna.Compiler.Frontend.Parser.expectFixityLevel", "Vuna/Compiler/Frontend/Parser.vuna:157"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dexpectOpName", ("Vuna.Compiler.Frontend.Parser.expectOpName", "Vuna/Compiler/Frontend/Parser.vuna:164"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDecl", ("Vuna.Compiler.Frontend.Parser.parseDecl", "Vuna/Compiler/Frontend/Parser.vuna:174"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseAxiom", ("Vuna.Compiler.Frontend.Parser.parseAxiom", "Vuna/Compiler/Frontend/Parser.vuna:202"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExtern", ("Vuna.Compiler.Frontend.Parser.parseExtern", "Vuna/Compiler/Frontend/Parser.vuna:209"));
  ("v_Vuna_dCompiler_dFrontend_dParser_drejectCtxSuffix", ("Vuna.Compiler.Frontend.Parser.rejectCtxSuffix", "Vuna/Compiler/Frontend/Parser.vuna:221"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSignature", ("Vuna.Compiler.Frontend.Parser.parseSignature", "Vuna/Compiler/Frontend/Parser.vuna:226"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseClause", ("Vuna.Compiler.Frontend.Parser.parseClause", "Vuna/Compiler/Frontend/Parser.vuna:239"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseWhere", ("Vuna.Compiler.Frontend.Parser.parseWhere", "Vuna/Compiler/Frontend/Parser.vuna:262"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseWhereBindings", ("Vuna.Compiler.Frontend.Parser.parseWhereBindings", "Vuna/Compiler/Frontend/Parser.vuna:270"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseBindingItemsAt", ("Vuna.Compiler.Frontend.Parser.parseBindingItemsAt", "Vuna/Compiler/Frontend/Parser.vuna:283"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseBindingItem", ("Vuna.Compiler.Frontend.Parser.parseBindingItem", "Vuna/Compiler/Frontend/Parser.vuna:293"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseBindingDef", ("Vuna.Compiler.Frontend.Parser.parseBindingDef", "Vuna/Compiler/Frontend/Parser.vuna:304"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseBindingValue", ("Vuna.Compiler.Frontend.Parser.parseBindingValue", "Vuna/Compiler/Frontend/Parser.vuna:316"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dbindingItemsToBinds", ("Vuna.Compiler.Frontend.Parser.bindingItemsToBinds", "Vuna/Compiler/Frontend/Parser.vuna:324"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dbindingBindsGo", ("Vuna.Compiler.Frontend.Parser.bindingBindsGo", "Vuna/Compiler/Frontend/Parser.vuna:327"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dlocalFunMerge", ("Vuna.Compiler.Frontend.Parser.localFunMerge", "Vuna/Compiler/Frontend/Parser.vuna:351"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dpatBoundName", ("Vuna.Compiler.Frontend.Parser.patBoundName", "Vuna/Compiler/Frontend/Parser.vuna:365"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dbindingSigOf", ("Vuna.Compiler.Frontend.Parser.bindingSigOf", "Vuna/Compiler/Frontend/Parser.vuna:369"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhasBindingSig", ("Vuna.Compiler.Frontend.Parser.hasBindingSig", "Vuna/Compiler/Frontend/Parser.vuna:373"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfirstDanglingSig", ("Vuna.Compiler.Frontend.Parser.firstDanglingSig", "Vuna/Compiler/Frontend/Parser.vuna:378"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseClausePatterns", ("Vuna.Compiler.Frontend.Parser.parseClausePatterns", "Vuna/Compiler/Frontend/Parser.vuna:384"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLinearDecl", ("Vuna.Compiler.Frontend.Parser.parseLinearDecl", "Vuna/Compiler/Frontend/Parser.vuna:392"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTieredDecl", ("Vuna.Compiler.Frontend.Parser.parseTieredDecl", "Vuna/Compiler/Frontend/Parser.vuna:401"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseData", ("Vuna.Compiler.Frontend.Parser.parseData", "Vuna/Compiler/Frontend/Parser.vuna:412"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecord", ("Vuna.Compiler.Frontend.Parser.parseRecord", "Vuna/Compiler/Frontend/Parser.vuna:428"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseFields", ("Vuna.Compiler.Frontend.Parser.parseFields", "Vuna/Compiler/Frontend/Parser.vuna:440"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseFieldList", ("Vuna.Compiler.Frontend.Parser.parseFieldList", "Vuna/Compiler/Frontend/Parser.vuna:445"));
  ("v_Vuna_dCompiler_dFrontend_dParser_datIdentName", ("Vuna.Compiler.Frontend.Parser.atIdentName", "Vuna/Compiler/Frontend/Parser.vuna:456"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDeriving", ("Vuna.Compiler.Frontend.Parser.parseDeriving", "Vuna/Compiler/Frontend/Parser.vuna:463"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDerivingParens", ("Vuna.Compiler.Frontend.Parser.parseDerivingParens", "Vuna/Compiler/Frontend/Parser.vuna:470"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDerivingNames", ("Vuna.Compiler.Frontend.Parser.parseDerivingNames", "Vuna/Compiler/Frontend/Parser.vuna:475"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTrait", ("Vuna.Compiler.Frontend.Parser.parseTrait", "Vuna/Compiler/Frontend/Parser.vuna:483"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTraitParams", ("Vuna.Compiler.Frontend.Parser.parseTraitParams", "Vuna/Compiler/Frontend/Parser.vuna:489"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseMethodSigs", ("Vuna.Compiler.Frontend.Parser.parseMethodSigs", "Vuna/Compiler/Frontend/Parser.vuna:500"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseMethodSigList", ("Vuna.Compiler.Frontend.Parser.parseMethodSigList", "Vuna/Compiler/Frontend/Parser.vuna:506"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseInstance", ("Vuna.Compiler.Frontend.Parser.parseInstance", "Vuna/Compiler/Frontend/Parser.vuna:519"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseInstanceTail", ("Vuna.Compiler.Frontend.Parser.parseInstanceTail", "Vuna/Compiler/Frontend/Parser.vuna:525"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseCtxThenExpr", ("Vuna.Compiler.Frontend.Parser.parseCtxThenExpr", "Vuna/Compiler/Frontend/Parser.vuna:530"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dctxThenSplit", ("Vuna.Compiler.Frontend.Parser.ctxThenSplit", "Vuna/Compiler/Frontend/Parser.vuna:539"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dinnermostPiCod", ("Vuna.Compiler.Frontend.Parser.innermostPiCod", "Vuna/Compiler/Frontend/Parser.vuna:544"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dreplacePiCod", ("Vuna.Compiler.Frontend.Parser.replacePiCod", "Vuna/Compiler/Frontend/Parser.vuna:548"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseCtxRest", ("Vuna.Compiler.Frontend.Parser.parseCtxRest", "Vuna/Compiler/Frontend/Parser.vuna:553"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseInstanceBody", ("Vuna.Compiler.Frontend.Parser.parseInstanceBody", "Vuna/Compiler/Frontend/Parser.vuna:561"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseInstanceDeclList", ("Vuna.Compiler.Frontend.Parser.parseInstanceDeclList", "Vuna/Compiler/Frontend/Parser.vuna:567"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseInstanceDecl", ("Vuna.Compiler.Frontend.Parser.parseInstanceDecl", "Vuna/Compiler/Frontend/Parser.vuna:576"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseParams", ("Vuna.Compiler.Frontend.Parser.parseParams", "Vuna/Compiler/Frontend/Parser.vuna:585"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseCtors", ("Vuna.Compiler.Frontend.Parser.parseCtors", "Vuna/Compiler/Frontend/Parser.vuna:593"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseCtorList", ("Vuna.Compiler.Frontend.Parser.parseCtorList", "Vuna/Compiler/Frontend/Parser.vuna:598"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExpr", ("Vuna.Compiler.Frontend.Parser.parseExpr", "Vuna/Compiler/Frontend/Parser.vuna:607"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseInfix", ("Vuna.Compiler.Frontend.Parser.parseInfix", "Vuna/Compiler/Frontend/Parser.vuna:617"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLhs", ("Vuna.Compiler.Frontend.Parser.parseLhs", "Vuna/Compiler/Frontend/Parser.vuna:634"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseApplication", ("Vuna.Compiler.Frontend.Parser.parseApplication", "Vuna/Compiler/Frontend/Parser.vuna:646"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dspanFromExpr", ("Vuna.Compiler.Frontend.Parser.spanFromExpr", "Vuna/Compiler/Frontend/Parser.vuna:654"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseArgs", ("Vuna.Compiler.Frontend.Parser.parseArgs", "Vuna/Compiler/Frontend/Parser.vuna:661"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseAtom", ("Vuna.Compiler.Frontend.Parser.parseAtom", "Vuna/Compiler/Frontend/Parser.vuna:668"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseFieldSuffix", ("Vuna.Compiler.Frontend.Parser.parseFieldSuffix", "Vuna/Compiler/Frontend/Parser.vuna:675"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dmacroBangAt", ("Vuna.Compiler.Frontend.Parser.macroBangAt", "Vuna/Compiler/Frontend/Parser.vuna:685"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dmacroAtom", ("Vuna.Compiler.Frontend.Parser.macroAtom", "Vuna/Compiler/Frontend/Parser.vuna:691"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseAtomBase", ("Vuna.Compiler.Frontend.Parser.parseAtomBase", "Vuna/Compiler/Frontend/Parser.vuna:695"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTemplateAtom", ("Vuna.Compiler.Frontend.Parser.parseTemplateAtom", "Vuna/Compiler/Frontend/Parser.vuna:735"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTemplateParts", ("Vuna.Compiler.Frontend.Parser.parseTemplateParts", "Vuna/Compiler/Frontend/Parser.vuna:743"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTemplateHole", ("Vuna.Compiler.Frontend.Parser.parseTemplateHole", "Vuna/Compiler/Frontend/Parser.vuna:756"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dholeSpan", ("Vuna.Compiler.Frontend.Parser.holeSpan", "Vuna/Compiler/Frontend/Parser.vuna:772"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dtoksFuel", ("Vuna.Compiler.Frontend.Parser.toksFuel", "Vuna/Compiler/Frontend/Parser.vuna:776"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dtextPartsOf", ("Vuna.Compiler.Frontend.Parser.textPartsOf", "Vuna/Compiler/Frontend/Parser.vuna:780"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSectionAtom", ("Vuna.Compiler.Frontend.Parser.parseSectionAtom", "Vuna/Compiler/Frontend/Parser.vuna:789"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePiBinder", ("Vuna.Compiler.Frontend.Parser.parsePiBinder", "Vuna/Compiler/Frontend/Parser.vuna:798"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePiNames", ("Vuna.Compiler.Frontend.Parser.parsePiNames", "Vuna/Compiler/Frontend/Parser.vuna:806"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePiNamesRest", ("Vuna.Compiler.Frontend.Parser.parsePiNamesRest", "Vuna/Compiler/Frontend/Parser.vuna:811"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfoldPiNames", ("Vuna.Compiler.Frontend.Parser.foldPiNames", "Vuna/Compiler/Frontend/Parser.vuna:818"));
  ("v_Vuna_dCompiler_dFrontend_dParser_danyDottedName", ("Vuna.Compiler.Frontend.Parser.anyDottedName", "Vuna/Compiler/Frontend/Parser.vuna:823"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dconsumeQty", ("Vuna.Compiler.Frontend.Parser.consumeQty", "Vuna/Compiler/Frontend/Parser.vuna:828"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecordAssignments", ("Vuna.Compiler.Frontend.Parser.parseRecordAssignments", "Vuna/Compiler/Frontend/Parser.vuna:836"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecordAssignList", ("Vuna.Compiler.Frontend.Parser.parseRecordAssignList", "Vuna/Compiler/Frontend/Parser.vuna:843"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseListExpr", ("Vuna.Compiler.Frontend.Parser.parseListExpr", "Vuna/Compiler/Frontend/Parser.vuna:849"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseListExprElems", ("Vuna.Compiler.Frontend.Parser.parseListExprElems", "Vuna/Compiler/Frontend/Parser.vuna:855"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseListElemAt", ("Vuna.Compiler.Frontend.Parser.parseListElemAt", "Vuna/Compiler/Frontend/Parser.vuna:863"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfoldCons", ("Vuna.Compiler.Frontend.Parser.foldCons", "Vuna/Compiler/Frontend/Parser.vuna:871"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLambda", ("Vuna.Compiler.Frontend.Parser.parseLambda", "Vuna/Compiler/Frontend/Parser.vuna:875"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLambdaParams", ("Vuna.Compiler.Frontend.Parser.parseLambdaParams", "Vuna/Compiler/Frontend/Parser.vuna:881"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLet", ("Vuna.Compiler.Frontend.Parser.parseLet", "Vuna/Compiler/Frontend/Parser.vuna:888"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLetBindings", ("Vuna.Compiler.Frontend.Parser.parseLetBindings", "Vuna/Compiler/Frontend/Parser.vuna:896"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseCase", ("Vuna.Compiler.Frontend.Parser.parseCase", "Vuna/Compiler/Frontend/Parser.vuna:906"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseCaseAlts", ("Vuna.Compiler.Frontend.Parser.parseCaseAlts", "Vuna/Compiler/Frontend/Parser.vuna:912"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseAltList", ("Vuna.Compiler.Frontend.Parser.parseAltList", "Vuna/Compiler/Frontend/Parser.vuna:923"));
  ("v_Vuna_dCompiler_dFrontend_dParser_drowAtNameExpr", ("Vuna.Compiler.Frontend.Parser.rowAtNameExpr", "Vuna/Compiler/Frontend/Parser.vuna:933"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePerform", ("Vuna.Compiler.Frontend.Parser.parsePerform", "Vuna/Compiler/Frontend/Parser.vuna:939"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleOpBinder", ("Vuna.Compiler.Frontend.Parser.handleOpBinder", "Vuna/Compiler/Frontend/Parser.vuna:965"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseHandle", ("Vuna.Compiler.Frontend.Parser.parseHandle", "Vuna/Compiler/Frontend/Parser.vuna:969"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseHandleComp", ("Vuna.Compiler.Frontend.Parser.parseHandleComp", "Vuna/Compiler/Frontend/Parser.vuna:980"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseHandleBody", ("Vuna.Compiler.Frontend.Parser.parseHandleBody", "Vuna/Compiler/Frontend/Parser.vuna:989"));
  ("v_Vuna_dCompiler_dFrontend_dParser_disReturnClauseHead", ("Vuna.Compiler.Frontend.Parser.isReturnClauseHead", "Vuna/Compiler/Frontend/Parser.vuna:1001"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseHandleClauses", ("Vuna.Compiler.Frontend.Parser.parseHandleClauses", "Vuna/Compiler/Frontend/Parser.vuna:1007"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseHandleRetClause", ("Vuna.Compiler.Frontend.Parser.parseHandleRetClause", "Vuna/Compiler/Frontend/Parser.vuna:1025"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseHandleOpClause", ("Vuna.Compiler.Frontend.Parser.parseHandleOpClause", "Vuna/Compiler/Frontend/Parser.vuna:1032"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleOpTail", ("Vuna.Compiler.Frontend.Parser.handleOpTail", "Vuna/Compiler/Frontend/Parser.vuna:1046"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleOpKName", ("Vuna.Compiler.Frontend.Parser.handleOpKName", "Vuna/Compiler/Frontend/Parser.vuna:1053"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfirstOtherKName", ("Vuna.Compiler.Frontend.Parser.firstOtherKName", "Vuna/Compiler/Frontend/Parser.vuna:1057"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleAlt", ("Vuna.Compiler.Frontend.Parser.handleAlt", "Vuna/Compiler/Frontend/Parser.vuna:1065"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleRetExpr", ("Vuna.Compiler.Frontend.Parser.handleRetExpr", "Vuna/Compiler/Frontend/Parser.vuna:1069"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleOpLam", ("Vuna.Compiler.Frontend.Parser.handleOpLam", "Vuna/Compiler/Frontend/Parser.vuna:1074"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleExpr", ("Vuna.Compiler.Frontend.Parser.handleExpr", "Vuna/Compiler/Frontend/Parser.vuna:1079"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseIf", ("Vuna.Compiler.Frontend.Parser.parseIf", "Vuna/Compiler/Frontend/Parser.vuna:1088"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDo", ("Vuna.Compiler.Frontend.Parser.parseDo", "Vuna/Compiler/Frontend/Parser.vuna:1096"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDoStmts", ("Vuna.Compiler.Frontend.Parser.parseDoStmts", "Vuna/Compiler/Frontend/Parser.vuna:1107"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDoStmt", ("Vuna.Compiler.Frontend.Parser.parseDoStmt", "Vuna/Compiler/Frontend/Parser.vuna:1121"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDoExprStmt", ("Vuna.Compiler.Frontend.Parser.parseDoExprStmt", "Vuna/Compiler/Frontend/Parser.vuna:1130"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dpatBinderBindings", ("Vuna.Compiler.Frontend.Parser.patBinderBindings", "Vuna/Compiler/Frontend/Parser.vuna:1146"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfirstRepeatedBinding", ("Vuna.Compiler.Frontend.Parser.firstRepeatedBinding", "Vuna/Compiler/Frontend/Parser.vuna:1157"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfirstRepeatedBindingGo", ("Vuna.Compiler.Frontend.Parser.firstRepeatedBindingGo", "Vuna/Compiler/Frontend/Parser.vuna:1161"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dcheckNoRepeatedBinders", ("Vuna.Compiler.Frontend.Parser.checkNoRepeatedBinders", "Vuna/Compiler/Frontend/Parser.vuna:1169"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePatternSingle", ("Vuna.Compiler.Frontend.Parser.parsePatternSingle", "Vuna/Compiler/Frontend/Parser.vuna:1176"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePatternCons", ("Vuna.Compiler.Frontend.Parser.parsePatternCons", "Vuna/Compiler/Frontend/Parser.vuna:1182"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePatternHead", ("Vuna.Compiler.Frontend.Parser.parsePatternHead", "Vuna/Compiler/Frontend/Parser.vuna:1188"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecordPatternFields", ("Vuna.Compiler.Frontend.Parser.parseRecordPatternFields", "Vuna/Compiler/Frontend/Parser.vuna:1201"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecordPatternList", ("Vuna.Compiler.Frontend.Parser.parseRecordPatternList", "Vuna/Compiler/Frontend/Parser.vuna:1207"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecordPatternField", ("Vuna.Compiler.Frontend.Parser.parseRecordPatternField", "Vuna/Compiler/Frontend/Parser.vuna:1214"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePatternAtoms", ("Vuna.Compiler.Frontend.Parser.parsePatternAtoms", "Vuna/Compiler/Frontend/Parser.vuna:1226"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePatternAtom", ("Vuna.Compiler.Frontend.Parser.parsePatternAtom", "Vuna/Compiler/Frontend/Parser.vuna:1233"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfinishAsPattern", ("Vuna.Compiler.Frontend.Parser.finishAsPattern", "Vuna/Compiler/Frontend/Parser.vuna:1240"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseAsName", ("Vuna.Compiler.Frontend.Parser.parseAsName", "Vuna/Compiler/Frontend/Parser.vuna:1254"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePatternAtomBase", ("Vuna.Compiler.Frontend.Parser.parsePatternAtomBase", "Vuna/Compiler/Frontend/Parser.vuna:1261"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseListPattern", ("Vuna.Compiler.Frontend.Parser.parseListPattern", "Vuna/Compiler/Frontend/Parser.vuna:1284"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseListPatternElems", ("Vuna.Compiler.Frontend.Parser.parseListPatternElems", "Vuna/Compiler/Frontend/Parser.vuna:1290"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfoldPCon", ("Vuna.Compiler.Frontend.Parser.foldPCon", "Vuna/Compiler/Frontend/Parser.vuna:1297"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSourceRecovering", ("Vuna.Compiler.Frontend.Parser.parseSourceRecovering", "Vuna/Compiler/Frontend/Parser.vuna:1304"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSourceRecoveringTokens", ("Vuna.Compiler.Frontend.Parser.parseSourceRecoveringTokens", "Vuna/Compiler/Frontend/Parser.vuna:1310"));
  ("v_Vuna_dCompiler_dCanonical_dLex_dencPos", ("Vuna.Compiler.Canonical.Lex.encPos", "Vuna/Compiler/Canonical/Lex.vuna:50"));
  ("v_Vuna_dCompiler_dCanonical_dLex_dencTmplPart", ("Vuna.Compiler.Canonical.Lex.encTmplPart", "Vuna/Compiler/Canonical/Lex.vuna:54"));
  ("v_Vuna_dCompiler_dCanonical_dLex_dencTok", ("Vuna.Compiler.Canonical.Lex.encTok", "Vuna/Compiler/Canonical/Lex.vuna:59"));
  ("v_Vuna_dCompiler_dCanonical_dLex_dencTmplPartList", ("Vuna.Compiler.Canonical.Lex.encTmplPartList", "Vuna/Compiler/Canonical/Lex.vuna:71"));
  ("v_Vuna_dCompiler_dCanonical_dLex_dencTmplPartListGo", ("Vuna.Compiler.Canonical.Lex.encTmplPartListGo", "Vuna/Compiler/Canonical/Lex.vuna:74"));
  ("v_Vuna_dCompiler_dCanonical_dLex_dencPTok", ("Vuna.Compiler.Canonical.Lex.encPTok", "Vuna/Compiler/Canonical/Lex.vuna:81"));
  ("v_Vuna_dCompiler_dCanonical_dLex_dencPTokList", ("Vuna.Compiler.Canonical.Lex.encPTokList", "Vuna/Compiler/Canonical/Lex.vuna:85"));
  ("v_Vuna_dCompiler_dCanonical_dLex_dencPTokListGo", ("Vuna.Compiler.Canonical.Lex.encPTokListGo", "Vuna/Compiler/Canonical/Lex.vuna:88"));
  ("v_Vuna_dCompiler_dCanonical_dLex_ddecPos", ("Vuna.Compiler.Canonical.Lex.decPos", "Vuna/Compiler/Canonical/Lex.vuna:96"));
  ("v_Vuna_dCompiler_dCanonical_dLex_ddecListHead", ("Vuna.Compiler.Canonical.Lex.decListHead", "Vuna/Compiler/Canonical/Lex.vuna:102"));
  ("v_Vuna_dCompiler_dCanonical_dLex_ddecListDigits", ("Vuna.Compiler.Canonical.Lex.decListDigits", "Vuna/Compiler/Canonical/Lex.vuna:108"));
  ("v_Vuna_dCompiler_dCanonical_dLex_ddecTmplPart", ("Vuna.Compiler.Canonical.Lex.decTmplPart", "Vuna/Compiler/Canonical/Lex.vuna:118"));
  ("v_Vuna_dCompiler_dCanonical_dLex_ddecTok", ("Vuna.Compiler.Canonical.Lex.decTok", "Vuna/Compiler/Canonical/Lex.vuna:132"));
  ("v_Vuna_dCompiler_dCanonical_dLex_ddecPTok", ("Vuna.Compiler.Canonical.Lex.decPTok", "Vuna/Compiler/Canonical/Lex.vuna:166"));
  ("v_Vuna_dCompiler_dCanonical_dLex_ddecTmplPartList", ("Vuna.Compiler.Canonical.Lex.decTmplPartList", "Vuna/Compiler/Canonical/Lex.vuna:175"));
  ("v_Vuna_dCompiler_dCanonical_dLex_ddecTmplPartItems", ("Vuna.Compiler.Canonical.Lex.decTmplPartItems", "Vuna/Compiler/Canonical/Lex.vuna:181"));
  ("v_Vuna_dCompiler_dCanonical_dLex_ddecPTokList", ("Vuna.Compiler.Canonical.Lex.decPTokList", "Vuna/Compiler/Canonical/Lex.vuna:189"));
  ("v_Vuna_dCompiler_dCanonical_dLex_ddecPTokItems", ("Vuna.Compiler.Canonical.Lex.decPTokItems", "Vuna/Compiler/Canonical/Lex.vuna:195"));
  ("v_Vuna_dCompiler_dCanonical_dLex_ddecPTokListComplete", ("Vuna.Compiler.Canonical.Lex.decPTokListComplete", "Vuna/Compiler/Canonical/Lex.vuna:203"));
  ("v_Vuna_dCompiler_dIntrinsics_darityOfType", ("Vuna.Compiler.Intrinsics.arityOfType", "Vuna/Compiler/Intrinsics.vuna:123"));
  ("v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicCtorName", ("Vuna.Compiler.Intrinsics.typeIntrinsicCtorName", "Vuna/Compiler/Intrinsics.vuna:143"));
  ("v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicCtorArity", ("Vuna.Compiler.Intrinsics.typeIntrinsicCtorArity", "Vuna/Compiler/Intrinsics.vuna:147"));
  ("v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicArities", ("Vuna.Compiler.Intrinsics.typeIntrinsicArities", "Vuna/Compiler/Intrinsics.vuna:151"));
  ("v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicArityOf", ("Vuna.Compiler.Intrinsics.typeIntrinsicArityOf", "Vuna/Compiler/Intrinsics.vuna:155"));
  ("v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicArityOfRest", ("Vuna.Compiler.Intrinsics.typeIntrinsicArityOfRest", "Vuna/Compiler/Intrinsics.vuna:159"));
  ("v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicCtorNames", ("Vuna.Compiler.Intrinsics.typeIntrinsicCtorNames", "Vuna/Compiler/Intrinsics.vuna:166"));
  ("v_Vuna_dCompiler_dIntrinsics_disTypeConstructorName", ("Vuna.Compiler.Intrinsics.isTypeConstructorName", "Vuna/Compiler/Intrinsics.vuna:171"));
  ("v_Vuna_dCompiler_dIntrinsics_dprimEffBind1Name", ("Vuna.Compiler.Intrinsics.primEffBind1Name", "Vuna/Compiler/Intrinsics.vuna:180"));
  ("v_Vuna_dCompiler_dIntrinsics_dprimEraseName", ("Vuna.Compiler.Intrinsics.primEraseName", "Vuna/Compiler/Intrinsics.vuna:186"));
  ("v_Vuna_dCompiler_dIntrinsics_dmainShowDefName", ("Vuna.Compiler.Intrinsics.mainShowDefName", "Vuna/Compiler/Intrinsics.vuna:192"));
  ("v_Vuna_dCompiler_dIntrinsics_deffRunName", ("Vuna.Compiler.Intrinsics.effRunName", "Vuna/Compiler/Intrinsics.vuna:196"));
  ("v_Vuna_dCompiler_dIntrinsics_ddebugOnIntrinsicName", ("Vuna.Compiler.Intrinsics.debugOnIntrinsicName", "Vuna/Compiler/Intrinsics.vuna:216"));
  ("v_Vuna_dCompiler_dIntrinsics_ddebugLineIntrinsicName", ("Vuna.Compiler.Intrinsics.debugLineIntrinsicName", "Vuna/Compiler/Intrinsics.vuna:220"));
  ("v_Vuna_dCompiler_dIntrinsics_dassertIntrinsicName", ("Vuna.Compiler.Intrinsics.assertIntrinsicName", "Vuna/Compiler/Intrinsics.vuna:224"));
  ("v_Vuna_dCompiler_dIntrinsics_dtodoIntrinsicName", ("Vuna.Compiler.Intrinsics.todoIntrinsicName", "Vuna/Compiler/Intrinsics.vuna:228"));
  ("v_Vuna_dCompiler_dIntrinsics_disDebugOnlyName", ("Vuna.Compiler.Intrinsics.isDebugOnlyName", "Vuna/Compiler/Intrinsics.vuna:232"));
  ("v_Vuna_dCompiler_dIntrinsics_deffRowFamilyName", ("Vuna.Compiler.Intrinsics.effRowFamilyName", "Vuna/Compiler/Intrinsics.vuna:244"));
  ("v_Vuna_dCompiler_dIntrinsics_deffRowNilCtor", ("Vuna.Compiler.Intrinsics.effRowNilCtor", "Vuna/Compiler/Intrinsics.vuna:248"));
  ("v_Vuna_dCompiler_dIntrinsics_deffRowConsCtor", ("Vuna.Compiler.Intrinsics.effRowConsCtor", "Vuna/Compiler/Intrinsics.vuna:252"));
  ("v_Vuna_dCompiler_dIntrinsics_deffRowRemName", ("Vuna.Compiler.Intrinsics.effRowRemName", "Vuna/Compiler/Intrinsics.vuna:256"));
  ("v_Vuna_dCompiler_dIntrinsics_deffMemberFamilyName", ("Vuna.Compiler.Intrinsics.effMemberFamilyName", "Vuna/Compiler/Intrinsics.vuna:260"));
  ("v_Vuna_dCompiler_dIntrinsics_deffMemberHereCtor", ("Vuna.Compiler.Intrinsics.effMemberHereCtor", "Vuna/Compiler/Intrinsics.vuna:264"));
  ("v_Vuna_dCompiler_dIntrinsics_deffMemberThereCtor", ("Vuna.Compiler.Intrinsics.effMemberThereCtor", "Vuna/Compiler/Intrinsics.vuna:268"));
  ("v_Vuna_dCompiler_dIntrinsics_deffTypeName", ("Vuna.Compiler.Intrinsics.effTypeName", "Vuna/Compiler/Intrinsics.vuna:272"));
  ("v_Vuna_dCompiler_dIntrinsics_deffUnitTypeName", ("Vuna.Compiler.Intrinsics.effUnitTypeName", "Vuna/Compiler/Intrinsics.vuna:277"));
  ("v_Vuna_dCompiler_dIntrinsics_deffMkCtor", ("Vuna.Compiler.Intrinsics.effMkCtor", "Vuna/Compiler/Intrinsics.vuna:281"));
  ("v_Vuna_dCompiler_dIntrinsics_deffDefaultInstance", ("Vuna.Compiler.Intrinsics.effDefaultInstance", "Vuna/Compiler/Intrinsics.vuna:286"));
  ("v_Vuna_dCompiler_dIntrinsics_dpreludeTypeNames", ("Vuna.Compiler.Intrinsics.preludeTypeNames", "Vuna/Compiler/Intrinsics.vuna:290"));
  ("v_Vuna_dCompiler_dIntrinsics_dintrinsicName", ("Vuna.Compiler.Intrinsics.intrinsicName", "Vuna/Compiler/Intrinsics.vuna:384"));
  ("v_Vuna_dCompiler_dIntrinsics_dintrinsicSignature", ("Vuna.Compiler.Intrinsics.intrinsicSignature", "Vuna/Compiler/Intrinsics.vuna:388"));
  ("v_Vuna_dCompiler_dIntrinsics_dintrinsicVisible", ("Vuna.Compiler.Intrinsics.intrinsicVisible", "Vuna/Compiler/Intrinsics.vuna:392"));
  ("v_Vuna_dCompiler_dIntrinsics_dneedsListBridge", ("Vuna.Compiler.Intrinsics.needsListBridge", "Vuna/Compiler/Intrinsics.vuna:397"));
  ("v_Vuna_dCompiler_dIntrinsics_dcanonicalCtorsFor", ("Vuna.Compiler.Intrinsics.canonicalCtorsFor", "Vuna/Compiler/Intrinsics.vuna:413"));
  ("v_Vuna_dCompiler_dIntrinsics_dintrinsicArity", ("Vuna.Compiler.Intrinsics.intrinsicArity", "Vuna/Compiler/Intrinsics.vuna:420"));
  ("v_Vuna_dCompiler_dIntrinsics_dintrinsicReturnsEff", ("Vuna.Compiler.Intrinsics.intrinsicReturnsEff", "Vuna/Compiler/Intrinsics.vuna:426"));
  ("v_Vuna_dCompiler_dIntrinsics_dtypeReturnsEff", ("Vuna.Compiler.Intrinsics.typeReturnsEff", "Vuna/Compiler/Intrinsics.vuna:430"));
  ("v_Vuna_dCompiler_dIntrinsics_dtypeIntrinsicNames", ("Vuna.Compiler.Intrinsics.typeIntrinsicNames", "Vuna/Compiler/Intrinsics.vuna:438"));
  ("v_Vuna_dCompiler_dIntrinsics_dintTypeName", ("Vuna.Compiler.Intrinsics.intTypeName", "Vuna/Compiler/Intrinsics.vuna:442"));
  ("v_Vuna_dCompiler_dIntrinsics_dstrTypeName", ("Vuna.Compiler.Intrinsics.strTypeName", "Vuna/Compiler/Intrinsics.vuna:446"));
  ("v_Vuna_dCompiler_dIntrinsics_dfloatTypeName", ("Vuna.Compiler.Intrinsics.floatTypeName", "Vuna/Compiler/Intrinsics.vuna:450"));
  ("v_Vuna_dCompiler_dIntrinsics_dboolTypeName", ("Vuna.Compiler.Intrinsics.boolTypeName", "Vuna/Compiler/Intrinsics.vuna:454"));
  ("v_Vuna_dCompiler_dIntrinsics_dboolTrueCtor", ("Vuna.Compiler.Intrinsics.boolTrueCtor", "Vuna/Compiler/Intrinsics.vuna:458"));
  ("v_Vuna_dCompiler_dIntrinsics_dboolFalseCtor", ("Vuna.Compiler.Intrinsics.boolFalseCtor", "Vuna/Compiler/Intrinsics.vuna:462"));
  ("v_Vuna_dCompiler_dIntrinsics_dnatTypeName", ("Vuna.Compiler.Intrinsics.natTypeName", "Vuna/Compiler/Intrinsics.vuna:467"));
  ("v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor", ("Vuna.Compiler.Intrinsics.natZeroCtor", "Vuna/Compiler/Intrinsics.vuna:471"));
  ("v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor", ("Vuna.Compiler.Intrinsics.natSuccCtor", "Vuna/Compiler/Intrinsics.vuna:475"));
  ("v_Vuna_dCompiler_dIntrinsics_disIntrinsicTypeName", ("Vuna.Compiler.Intrinsics.isIntrinsicTypeName", "Vuna/Compiler/Intrinsics.vuna:479"));
  ("v_Vuna_dCompiler_dIntrinsics_dlistFamilyName", ("Vuna.Compiler.Intrinsics.listFamilyName", "Vuna/Compiler/Intrinsics.vuna:483"));
  ("v_Vuna_dCompiler_dIntrinsics_dlistNilCtor", ("Vuna.Compiler.Intrinsics.listNilCtor", "Vuna/Compiler/Intrinsics.vuna:487"));
  ("v_Vuna_dCompiler_dIntrinsics_dlistConsCtor", ("Vuna.Compiler.Intrinsics.listConsCtor", "Vuna/Compiler/Intrinsics.vuna:491"));
  ("v_Vuna_dCompiler_dIntrinsics_dinterpTypeName", ("Vuna.Compiler.Intrinsics.interpTypeName", "Vuna/Compiler/Intrinsics.vuna:496"));
  ("v_Vuna_dCompiler_dIntrinsics_dinterpMethodName", ("Vuna.Compiler.Intrinsics.interpMethodName", "Vuna/Compiler/Intrinsics.vuna:500"));
  ("v_Vuna_dCompiler_dIntrinsics_dfromStringTypeName", ("Vuna.Compiler.Intrinsics.fromStringTypeName", "Vuna/Compiler/Intrinsics.vuna:505"));
  ("v_Vuna_dCompiler_dIntrinsics_dfromStringMethodName", ("Vuna.Compiler.Intrinsics.fromStringMethodName", "Vuna/Compiler/Intrinsics.vuna:509"));
  ("v_Vuna_dCompiler_dIntrinsics_dfromIntTypeName", ("Vuna.Compiler.Intrinsics.fromIntTypeName", "Vuna/Compiler/Intrinsics.vuna:513"));
  ("v_Vuna_dCompiler_dIntrinsics_dfromIntMethodName", ("Vuna.Compiler.Intrinsics.fromIntMethodName", "Vuna/Compiler/Intrinsics.vuna:517"));
  ("v_Vuna_dCompiler_dIntrinsics_dfromFloatTypeName", ("Vuna.Compiler.Intrinsics.fromFloatTypeName", "Vuna/Compiler/Intrinsics.vuna:521"));
  ("v_Vuna_dCompiler_dIntrinsics_dfromFloatMethodName", ("Vuna.Compiler.Intrinsics.fromFloatMethodName", "Vuna/Compiler/Intrinsics.vuna:525"));
  ("v_Vuna_dCompiler_dIntrinsics_dbaseIntrinsics", ("Vuna.Compiler.Intrinsics.baseIntrinsics", "Vuna/Compiler/Intrinsics.vuna:558"));
  ("v_Vuna_dCompiler_dIntrinsics_dfloatIntrinsics", ("Vuna.Compiler.Intrinsics.floatIntrinsics", "Vuna/Compiler/Intrinsics.vuna:633"));
  ("v_Vuna_dCompiler_dIntrinsics_deffIntrinsics", ("Vuna.Compiler.Intrinsics.effIntrinsics", "Vuna/Compiler/Intrinsics.vuna:655"));
  ("v_Vuna_dCompiler_dIntrinsics_dinternalIntrinsics", ("Vuna.Compiler.Intrinsics.internalIntrinsics", "Vuna/Compiler/Intrinsics.vuna:697"));
  ("v_Vuna_dCompiler_dIntrinsics_dtraceIntrinsicNames", ("Vuna.Compiler.Intrinsics.traceIntrinsicNames", "Vuna/Compiler/Intrinsics.vuna:704"));
  ("v_Vuna_dCompiler_dIntrinsics_dinternalIntrinsicNames", ("Vuna.Compiler.Intrinsics.internalIntrinsicNames", "Vuna/Compiler/Intrinsics.vuna:708"));
  ("v_Vuna_dCompiler_dIntrinsics_dallIntrinsics", ("Vuna.Compiler.Intrinsics.allIntrinsics", "Vuna/Compiler/Intrinsics.vuna:712"));
  ("v_Vuna_dCompiler_dIntrinsics_dfloatIntrinsicNames", ("Vuna.Compiler.Intrinsics.floatIntrinsicNames", "Vuna/Compiler/Intrinsics.vuna:718"));
  ("v_Vuna_dCompiler_dIntrinsics_dintrinsicTbl", ("Vuna.Compiler.Intrinsics.intrinsicTbl", "Vuna/Compiler/Intrinsics.vuna:738"));
  ("v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic", ("Vuna.Compiler.Intrinsics.findIntrinsic", "Vuna/Compiler/Intrinsics.vuna:744"));
  ("v_Vuna_dCompiler_dIntrinsics_disIntrinsicName", ("Vuna.Compiler.Intrinsics.isIntrinsicName", "Vuna/Compiler/Intrinsics.vuna:748"));
  ("v_Vuna_dCompiler_dIntrinsics_duserIntrinsics", ("Vuna.Compiler.Intrinsics.userIntrinsics", "Vuna/Compiler/Intrinsics.vuna:754"));
  ("v_Vuna_dCompiler_dIntrinsics_dpreludeValueNames", ("Vuna.Compiler.Intrinsics.preludeValueNames", "Vuna/Compiler/Intrinsics.vuna:758"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandFuelBound", ("Vuna.Compiler.Loader.Expand.expandFuelBound", "Vuna/Compiler/Loader/Expand.vuna:28"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandDecls", ("Vuna.Compiler.Loader.Expand.expandDecls", "Vuna/Compiler/Loader/Expand.vuna:32"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandDeclsGo", ("Vuna.Compiler.Loader.Expand.expandDeclsGo", "Vuna/Compiler/Loader/Expand.vuna:35"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandDecl", ("Vuna.Compiler.Loader.Expand.expandDecl", "Vuna/Compiler/Loader/Expand.vuna:43"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandCtors", ("Vuna.Compiler.Loader.Expand.expandCtors", "Vuna/Compiler/Loader/Expand.vuna:68"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandCtor", ("Vuna.Compiler.Loader.Expand.expandCtor", "Vuna/Compiler/Loader/Expand.vuna:76"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandFields", ("Vuna.Compiler.Loader.Expand.expandFields", "Vuna/Compiler/Loader/Expand.vuna:80"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandField", ("Vuna.Compiler.Loader.Expand.expandField", "Vuna/Compiler/Loader/Expand.vuna:88"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandTraitMethods", ("Vuna.Compiler.Loader.Expand.expandTraitMethods", "Vuna/Compiler/Loader/Expand.vuna:92"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandTraitMethod", ("Vuna.Compiler.Loader.Expand.expandTraitMethod", "Vuna/Compiler/Loader/Expand.vuna:100"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandExprs", ("Vuna.Compiler.Loader.Expand.expandExprs", "Vuna/Compiler/Loader/Expand.vuna:104"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandExpr", ("Vuna.Compiler.Loader.Expand.expandExpr", "Vuna/Compiler/Loader/Expand.vuna:112"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandPatExprs", ("Vuna.Compiler.Loader.Expand.expandPatExprs", "Vuna/Compiler/Loader/Expand.vuna:179"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandClauses", ("Vuna.Compiler.Loader.Expand.expandClauses", "Vuna/Compiler/Loader/Expand.vuna:187"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandFieldExprs", ("Vuna.Compiler.Loader.Expand.expandFieldExprs", "Vuna/Compiler/Loader/Expand.vuna:195"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandDoStmts", ("Vuna.Compiler.Loader.Expand.expandDoStmts", "Vuna/Compiler/Loader/Expand.vuna:203"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandInterpParts", ("Vuna.Compiler.Loader.Expand.expandInterpParts", "Vuna/Compiler/Loader/Expand.vuna:215"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dinternalRef", ("Vuna.Compiler.Loader.Expand.internalRef", "Vuna/Compiler/Loader/Expand.vuna:235"));
  ("v_Vuna_dCompiler_dLoader_dExpand_ddebugOnRef", ("Vuna.Compiler.Loader.Expand.debugOnRef", "Vuna/Compiler/Loader/Expand.vuna:239"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dmacroArityMismatch", ("Vuna.Compiler.Loader.Expand.macroArityMismatch", "Vuna/Compiler/Loader/Expand.vuna:242"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandMacro", ("Vuna.Compiler.Loader.Expand.expandMacro", "Vuna/Compiler/Loader/Expand.vuna:250"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dtableOf", ("Vuna.Compiler.Loader.Fixity.tableOf", "Vuna/Compiler/Loader/Fixity.vuna:38"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dtableOfKeepOps", ("Vuna.Compiler.Loader.Fixity.tableOfKeepOps", "Vuna/Compiler/Loader/Fixity.vuna:42"));
  ("v_Vuna_dCompiler_dLoader_dFixity_drenameMode", ("Vuna.Compiler.Loader.Fixity.renameMode", "Vuna/Compiler/Loader/Fixity.vuna:45"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dsyntaxFixityDecls", ("Vuna.Compiler.Loader.Fixity.syntaxFixityDecls", "Vuna/Compiler/Loader/Fixity.vuna:49"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dfindTarget", ("Vuna.Compiler.Loader.Fixity.findTarget", "Vuna/Compiler/Loader/Fixity.vuna:53"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dsymbolOfTargetIn", ("Vuna.Compiler.Loader.Fixity.symbolOfTargetIn", "Vuna/Compiler/Loader/Fixity.vuna:60"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl", ("Vuna.Compiler.Loader.Fixity.lookupDecl", "Vuna/Compiler/Loader/Fixity.vuna:64"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dlookupFixityDecl", ("Vuna.Compiler.Loader.Fixity.lookupFixityDecl", "Vuna/Compiler/Loader/Fixity.vuna:69"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dlookupFixity", ("Vuna.Compiler.Loader.Fixity.lookupFixity", "Vuna/Compiler/Loader/Fixity.vuna:74"));
  ("v_Vuna_dCompiler_dLoader_dFixity_daliasOf", ("Vuna.Compiler.Loader.Fixity.aliasOf", "Vuna/Compiler/Loader/Fixity.vuna:79"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dunknownFixityMsg", ("Vuna.Compiler.Loader.Fixity.unknownFixityMsg", "Vuna/Compiler/Loader/Fixity.vuna:93"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dfixityOf", ("Vuna.Compiler.Loader.Fixity.fixityOf", "Vuna/Compiler/Loader/Fixity.vuna:99"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dinfixTerm", ("Vuna.Compiler.Loader.Fixity.infixTerm", "Vuna/Compiler/Loader/Fixity.vuna:106"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dcollectChain", ("Vuna.Compiler.Loader.Fixity.collectChain", "Vuna/Compiler/Loader/Fixity.vuna:115"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dclimb", ("Vuna.Compiler.Loader.Fixity.climb", "Vuna/Compiler/Loader/Fixity.vuna:129"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderChain", ("Vuna.Compiler.Loader.Fixity.reorderChain", "Vuna/Compiler/Loader/Fixity.vuna:147"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr", ("Vuna.Compiler.Loader.Fixity.reorderExpr", "Vuna/Compiler/Loader/Fixity.vuna:155"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderInterpParts", ("Vuna.Compiler.Loader.Fixity.reorderInterpParts", "Vuna/Compiler/Loader/Fixity.vuna:212"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderBinds", ("Vuna.Compiler.Loader.Fixity.reorderBinds", "Vuna/Compiler/Loader/Fixity.vuna:220"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderBind", ("Vuna.Compiler.Loader.Fixity.reorderBind", "Vuna/Compiler/Loader/Fixity.vuna:223"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderFields", ("Vuna.Compiler.Loader.Fixity.reorderFields", "Vuna/Compiler/Loader/Fixity.vuna:228"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderField", ("Vuna.Compiler.Loader.Fixity.reorderField", "Vuna/Compiler/Loader/Fixity.vuna:231"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderClauses", ("Vuna.Compiler.Loader.Fixity.reorderClauses", "Vuna/Compiler/Loader/Fixity.vuna:235"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderAlts", ("Vuna.Compiler.Loader.Fixity.reorderAlts", "Vuna/Compiler/Loader/Fixity.vuna:239"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderAlt", ("Vuna.Compiler.Loader.Fixity.reorderAlt", "Vuna/Compiler/Loader/Fixity.vuna:242"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderClause", ("Vuna.Compiler.Loader.Fixity.reorderClause", "Vuna/Compiler/Loader/Fixity.vuna:247"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderDoStmt", ("Vuna.Compiler.Loader.Fixity.reorderDoStmt", "Vuna/Compiler/Loader/Fixity.vuna:252"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern", ("Vuna.Compiler.Loader.Fixity.reorderPattern", "Vuna/Compiler/Loader/Fixity.vuna:259"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderRecPatField", ("Vuna.Compiler.Loader.Fixity.reorderRecPatField", "Vuna/Compiler/Loader/Fixity.vuna:278"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderDecl", ("Vuna.Compiler.Loader.Fixity.reorderDecl", "Vuna/Compiler/Loader/Fixity.vuna:283"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderTraitParam", ("Vuna.Compiler.Loader.Fixity.reorderTraitParam", "Vuna/Compiler/Loader/Fixity.vuna:308"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderCtor", ("Vuna.Compiler.Loader.Fixity.reorderCtor", "Vuna/Compiler/Loader/Fixity.vuna:314"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderRecordField", ("Vuna.Compiler.Loader.Fixity.reorderRecordField", "Vuna/Compiler/Loader/Fixity.vuna:318"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderTraitMethod", ("Vuna.Compiler.Loader.Fixity.reorderTraitMethod", "Vuna/Compiler/Loader/Fixity.vuna:322"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderInstanceMethodDecl", ("Vuna.Compiler.Loader.Fixity.reorderInstanceMethodDecl", "Vuna/Compiler/Loader/Fixity.vuna:326"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram", ("Vuna.Compiler.Loader.Fixity.reorderProgram", "Vuna/Compiler/Loader/Fixity.vuna:335"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf", ("Vuna.Compiler.Loader.Modules.moduleNameOf", "Vuna/Compiler/Loader/Modules.vuna:84"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf", ("Vuna.Compiler.Loader.Modules.modulePackageOf", "Vuna/Compiler/Loader/Modules.vuna:87"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleAllImportsOf", ("Vuna.Compiler.Loader.Modules.moduleAllImportsOf", "Vuna/Compiler/Loader/Modules.vuna:90"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf", ("Vuna.Compiler.Loader.Modules.moduleDeclsOf", "Vuna/Compiler/Loader/Modules.vuna:93"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf", ("Vuna.Compiler.Loader.Modules.moduleFixitiesOf", "Vuna/Compiler/Loader/Modules.vuna:96"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleReexportsOf", ("Vuna.Compiler.Loader.Modules.moduleReexportsOf", "Vuna/Compiler/Loader/Modules.vuna:100"));
  ("v_Vuna_dCompiler_dLoader_dModules_dprojectEntryAllImports", ("Vuna.Compiler.Loader.Modules.projectEntryAllImports", "Vuna/Compiler/Loader/Modules.vuna:103"));
  ("v_Vuna_dCompiler_dLoader_dModules_dallIdentChars", ("Vuna.Compiler.Loader.Modules.allIdentChars", "Vuna/Compiler/Loader/Modules.vuna:143"));
  ("v_Vuna_dCompiler_dLoader_dModules_dvalidSegment", ("Vuna.Compiler.Loader.Modules.validSegment", "Vuna/Compiler/Loader/Modules.vuna:147"));
  ("v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid", ("Vuna.Compiler.Loader.Modules.allSegmentsValid", "Vuna/Compiler/Loader/Modules.vuna:152"));
  ("v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName", ("Vuna.Compiler.Loader.Modules.validModuleName", "Vuna/Compiler/Loader/Modules.vuna:159"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmangle", ("Vuna.Compiler.Loader.Modules.mangle", "Vuna/Compiler/Loader/Modules.vuna:164"));
  ("v_Vuna_dCompiler_dLoader_dModules_dctorCanonical", ("Vuna.Compiler.Loader.Modules.ctorCanonical", "Vuna/Compiler/Loader/Modules.vuna:170"));
  ("v_Vuna_dCompiler_dLoader_dModules_dimportName", ("Vuna.Compiler.Loader.Modules.importName", "Vuna/Compiler/Loader/Modules.vuna:173"));
  ("v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames", ("Vuna.Compiler.Loader.Modules.importModuleNames", "Vuna/Compiler/Loader/Modules.vuna:176"));
  ("v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName", ("Vuna.Compiler.Loader.Modules.hasDuplicateName", "Vuna/Compiler/Loader/Modules.vuna:179"));
  ("v_Vuna_dCompiler_dLoader_dModules_dimportAliases", ("Vuna.Compiler.Loader.Modules.importAliases", "Vuna/Compiler/Loader/Modules.vuna:183"));
  ("v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases", ("Vuna.Compiler.Loader.Modules.checkImportAliases", "Vuna/Compiler/Loader/Modules.vuna:189"));
  ("v_Vuna_dCompiler_dLoader_dModules_dvalidateImports", ("Vuna.Compiler.Loader.Modules.validateImports", "Vuna/Compiler/Loader/Modules.vuna:198"));
  ("v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames", ("Vuna.Compiler.Loader.Modules.openModuleNames", "Vuna/Compiler/Loader/Modules.vuna:203"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindImportModule", ("Vuna.Compiler.Loader.Modules.findImportModule", "Vuna/Compiler/Loader/Modules.vuna:210"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix", ("Vuna.Compiler.Loader.Modules.findImportPrefix", "Vuna/Compiler/Loader/Modules.vuna:217"));
  ("v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames", ("Vuna.Compiler.Loader.Modules.reexportedImportNames", "Vuna/Compiler/Loader/Modules.vuna:222"));
  ("v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo", ("Vuna.Compiler.Loader.Modules.reexportedImportNamesGo", "Vuna/Compiler/Loader/Modules.vuna:225"));
  ("v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesOfHeader", ("Vuna.Compiler.Loader.Modules.reexportedImportNamesOfHeader", "Vuna/Compiler/Loader/Modules.vuna:235"));
  ("v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames", ("Vuna.Compiler.Loader.Modules._joinNames", "Vuna/Compiler/Loader/Modules.vuna:240"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmissingModule", ("Vuna.Compiler.Loader.Modules.missingModule", "Vuna/Compiler/Loader/Modules.vuna:249"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls", ("Vuna.Compiler.Loader.Modules.moduleDecls", "Vuna/Compiler/Loader/Modules.vuna:253"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleCtors", ("Vuna.Compiler.Loader.Modules.moduleCtors", "Vuna/Compiler/Loader/Modules.vuna:258"));
  ("v_Vuna_dCompiler_dLoader_dModules_dexportsOf", ("Vuna.Compiler.Loader.Modules.exportsOf", "Vuna/Compiler/Loader/Modules.vuna:262"));
  ("v_Vuna_dCompiler_dLoader_dModules_dlookupExport", ("Vuna.Compiler.Loader.Modules.lookupExport", "Vuna/Compiler/Loader/Modules.vuna:268"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindExportValue", ("Vuna.Compiler.Loader.Modules.findExportValue", "Vuna/Compiler/Loader/Modules.vuna:273"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor", ("Vuna.Compiler.Loader.Modules.findExportCtor", "Vuna/Compiler/Loader/Modules.vuna:276"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors", ("Vuna.Compiler.Loader.Modules.findExportCtors", "Vuna/Compiler/Loader/Modules.vuna:281"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfilterCtors", ("Vuna.Compiler.Loader.Modules.filterCtors", "Vuna/Compiler/Loader/Modules.vuna:285"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindExportType", ("Vuna.Compiler.Loader.Modules.findExportType", "Vuna/Compiler/Loader/Modules.vuna:291"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom", ("Vuna.Compiler.Loader.Modules.modulesExportingValueFrom", "Vuna/Compiler/Loader/Modules.vuna:294"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue", ("Vuna.Compiler.Loader.Modules.modulesExportingValue", "Vuna/Compiler/Loader/Modules.vuna:303"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom", ("Vuna.Compiler.Loader.Modules.modulesExportingCtorFrom", "Vuna/Compiler/Loader/Modules.vuna:308"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor", ("Vuna.Compiler.Loader.Modules.modulesExportingCtor", "Vuna/Compiler/Loader/Modules.vuna:316"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom", ("Vuna.Compiler.Loader.Modules.modulesExportingTypeFrom", "Vuna/Compiler/Loader/Modules.vuna:320"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType", ("Vuna.Compiler.Loader.Modules.modulesExportingType", "Vuna/Compiler/Loader/Modules.vuna:329"));
  ("v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest", ("Vuna.Compiler.Loader.Modules.sameTargetRest", "Vuna/Compiler/Loader/Modules.vuna:334"));
  ("v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs", ("Vuna.Compiler.Loader.Modules.unifyEntryPairs", "Vuna/Compiler/Loader/Modules.vuna:338"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulePath", ("Vuna.Compiler.Loader.Modules.modulePath", "Vuna/Compiler/Loader/Modules.vuna:345"));
  ("v_Vuna_dCompiler_dLoader_dModules_drootAllows", ("Vuna.Compiler.Loader.Modules.rootAllows", "Vuna/Compiler/Loader/Modules.vuna:349"));
  ("v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles", ("Vuna.Compiler.Loader.Modules.collectModuleFiles", "Vuna/Compiler/Loader/Modules.vuna:356"));
  ("v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs", ("Vuna.Compiler.Loader.Modules._joinRootDirs", "Vuna/Compiler/Loader/Modules.vuna:368"));
  ("v_Vuna_dCompiler_dLoader_dModules_dcandidateDir", ("Vuna.Compiler.Loader.Modules.candidateDir", "Vuna/Compiler/Loader/Modules.vuna:371"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile", ("Vuna.Compiler.Loader.Modules.findModuleFile", "Vuna/Compiler/Loader/Modules.vuna:374"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindModule", ("Vuna.Compiler.Loader.Modules.findModule", "Vuna/Compiler/Loader/Modules.vuna:390"));
  ("v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget", ("Vuna.Compiler.Loader.Modules.isDataOrRecordCtorTarget", "Vuna/Compiler/Loader/Modules.vuna:399"));
  ("v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls", ("Vuna.Compiler.Loader.Modules.isCtorTargetInDecls", "Vuna/Compiler/Loader/Modules.vuna:406"));
  ("v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget", ("Vuna.Compiler.Loader.Modules.anyCtorTarget", "Vuna/Compiler/Loader/Modules.vuna:416"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound", ("Vuna.Compiler.Loader.Resolve.resolveFuelBound", "Vuna/Compiler/Loader/Resolve.vuna:44"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity", ("Vuna.Compiler.Loader.Resolve.builtinArity", "Vuna/Compiler/Loader/Resolve.vuna:48"));
  ("v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName", ("Vuna.Compiler.Loader.Resolve.isBuiltinName", "Vuna/Compiler/Loader/Resolve.vuna:53"));
  ("v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName", ("Vuna.Compiler.Loader.Resolve.isDtPreludeName", "Vuna/Compiler/Loader/Resolve.vuna:66"));
  ("v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames", ("Vuna.Compiler.Loader.Resolve.dtPreludeNames", "Vuna/Compiler/Loader/Resolve.vuna:69"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint", ("Vuna.Compiler.Loader.Resolve.traitImportHint", "Vuna/Compiler/Loader/Resolve.vuna:76"));
  ("v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames", ("Vuna.Compiler.Loader.Resolve.declValueNames", "Vuna/Compiler/Loader/Resolve.vuna:99"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf", ("Vuna.Compiler.Loader.Resolve.valueNamesOf", "Vuna/Compiler/Loader/Resolve.vuna:110"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf", ("Vuna.Compiler.Loader.Resolve.ctorCandsOf", "Vuna/Compiler/Loader/Resolve.vuna:118"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith", ("Vuna.Compiler.Loader.Resolve.namespacesOfWith", "Vuna/Compiler/Loader/Resolve.vuna:127"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf", ("Vuna.Compiler.Loader.Resolve.namespacesOf", "Vuna/Compiler/Loader/Resolve.vuna:137"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets", ("Vuna.Compiler.Loader.Resolve.localCtorTargets", "Vuna/Compiler/Loader/Resolve.vuna:142"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTarget", ("Vuna.Compiler.Loader.Resolve.localCtorTarget", "Vuna/Compiler/Loader/Resolve.vuna:147"));
  ("v_Vuna_dCompiler_dLoader_dResolve_ddedupeTargets", ("Vuna.Compiler.Loader.Resolve.dedupeTargets", "Vuna/Compiler/Loader/Resolve.vuna:155"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget", ("Vuna.Compiler.Loader.Resolve.pairExportTarget", "Vuna/Compiler/Loader/Resolve.vuna:162"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dpairIsDataCtor", ("Vuna.Compiler.Loader.Resolve.pairIsDataCtor", "Vuna/Compiler/Loader/Resolve.vuna:166"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dimportedCtorTargets", ("Vuna.Compiler.Loader.Resolve.importedCtorTargets", "Vuna/Compiler/Loader/Resolve.vuna:170"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates", ("Vuna.Compiler.Loader.Resolve.ctorCandidates", "Vuna/Compiler/Loader/Resolve.vuna:178"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList", ("Vuna.Compiler.Loader.Resolve.notEmptyList", "Vuna/Compiler/Loader/Resolve.vuna:186"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified", ("Vuna.Compiler.Loader.Resolve.resolveQualified", "Vuna/Compiler/Loader/Resolve.vuna:190"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls", ("Vuna.Compiler.Loader.Resolve.ctorTargetInDecls", "Vuna/Compiler/Loader/Resolve.vuna:211"));
  ("v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed", ("Vuna.Compiler.Loader.Resolve.anyCtorNamed", "Vuna/Compiler/Loader/Resolve.vuna:223"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules", ("Vuna.Compiler.Loader.Resolve.findFamilyCtorInModules", "Vuna/Compiler/Loader/Resolve.vuna:228"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dctorRelFamily", ("Vuna.Compiler.Loader.Resolve.ctorRelFamily", "Vuna/Compiler/Loader/Resolve.vuna:235"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInFamily", ("Vuna.Compiler.Loader.Resolve.ctorTargetInFamily", "Vuna/Compiler/Loader/Resolve.vuna:240"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTarget", ("Vuna.Compiler.Loader.Resolve.resolveTypeTarget", "Vuna/Compiler/Loader/Resolve.vuna:248"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeTargetOnly", ("Vuna.Compiler.Loader.Resolve.resolveDottedTypeTargetOnly", "Vuna/Compiler/Loader/Resolve.vuna:261"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor", ("Vuna.Compiler.Loader.Resolve.resolveFamilyQualifiedCtor", "Vuna/Compiler/Loader/Resolve.vuna:276"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dexportTarget", ("Vuna.Compiler.Loader.Resolve.exportTarget", "Vuna/Compiler/Loader/Resolve.vuna:288"));
  ("v_Vuna_dCompiler_dLoader_dResolve_duniqueCtorTarget", ("Vuna.Compiler.Loader.Resolve.uniqueCtorTarget", "Vuna/Compiler/Loader/Resolve.vuna:292"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dallSameTarget", ("Vuna.Compiler.Loader.Resolve.allSameTarget", "Vuna/Compiler/Loader/Resolve.vuna:299"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dallEq", ("Vuna.Compiler.Loader.Resolve.allEq", "Vuna/Compiler/Loader/Resolve.vuna:304"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted", ("Vuna.Compiler.Loader.Resolve.resolveCtorDotted", "Vuna/Compiler/Loader/Resolve.vuna:310"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr", ("Vuna.Compiler.Loader.Resolve.resolveDottedExpr", "Vuna/Compiler/Loader/Resolve.vuna:324"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain", ("Vuna.Compiler.Loader.Resolve.foldFieldChain", "Vuna/Compiler/Loader/Resolve.vuna:339"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs", ("Vuna.Compiler.Loader.Resolve.takeSegs", "Vuna/Compiler/Loader/Resolve.vuna:343"));
  ("v_Vuna_dCompiler_dLoader_dResolve_ddropSegs", ("Vuna.Compiler.Loader.Resolve.dropSegs", "Vuna/Compiler/Loader/Resolve.vuna:347"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath", ("Vuna.Compiler.Loader.Resolve.resolveQualifiedPath", "Vuna/Compiler/Loader/Resolve.vuna:351"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal", ("Vuna.Compiler.Loader.Resolve.resolveGlobal", "Vuna/Compiler/Loader/Resolve.vuna:374"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver", ("Vuna.Compiler.Loader.Resolve.pickCtorOrOver", "Vuna/Compiler/Loader/Resolve.vuna:410"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor", ("Vuna.Compiler.Loader.Resolve.resolveCtor", "Vuna/Compiler/Loader/Resolve.vuna:418"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder", ("Vuna.Compiler.Loader.Resolve.checkBinder", "Vuna/Compiler/Loader/Resolve.vuna:431"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName", ("Vuna.Compiler.Loader.Resolve.checkTopName", "Vuna/Compiler/Loader/Resolve.vuna:435"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName", ("Vuna.Compiler.Loader.Resolve.resolveTopName", "Vuna/Compiler/Loader/Resolve.vuna:440"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern", ("Vuna.Compiler.Loader.Resolve.resolvePattern", "Vuna/Compiler/Loader/Resolve.vuna:444"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField", ("Vuna.Compiler.Loader.Resolve.resolveRecordPatternField", "Vuna/Compiler/Loader/Resolve.vuna:465"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt", ("Vuna.Compiler.Loader.Resolve.resolveAlt", "Vuna/Compiler/Loader/Resolve.vuna:471"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause", ("Vuna.Compiler.Loader.Resolve.resolveLocalClause", "Vuna/Compiler/Loader/Resolve.vuna:481"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats", ("Vuna.Compiler.Loader.Resolve.resolveLocalPats", "Vuna/Compiler/Loader/Resolve.vuna:490"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveLet", ("Vuna.Compiler.Loader.Resolve.resolveLet", "Vuna/Compiler/Loader/Resolve.vuna:500"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq", ("Vuna.Compiler.Loader.Resolve.resolveLetSeq", "Vuna/Compiler/Loader/Resolve.vuna:506"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet", ("Vuna.Compiler.Loader.Resolve.resolveRecLet", "Vuna/Compiler/Loader/Resolve.vuna:520"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds", ("Vuna.Compiler.Loader.Resolve.collectRecBinds", "Vuna/Compiler/Loader/Resolve.vuna:531"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues", ("Vuna.Compiler.Loader.Resolve.resolveRecValues", "Vuna/Compiler/Loader/Resolve.vuna:539"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate", ("Vuna.Compiler.Loader.Resolve.lowerTemplate", "Vuna/Compiler/Loader/Resolve.vuna:557"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks", ("Vuna.Compiler.Loader.Resolve.templateChunks", "Vuna/Compiler/Loader/Resolve.vuna:562"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft", ("Vuna.Compiler.Loader.Resolve.concatLeft", "Vuna/Compiler/Loader/Resolve.vuna:570"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dcheckDebugConstruct", ("Vuna.Compiler.Loader.Resolve.checkDebugConstruct", "Vuna/Compiler/Loader/Resolve.vuna:578"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr", ("Vuna.Compiler.Loader.Resolve.resolveExpr", "Vuna/Compiler/Loader/Resolve.vuna:585"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts", ("Vuna.Compiler.Loader.Resolve.resolveInterpParts", "Vuna/Compiler/Loader/Resolve.vuna:661"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDo", ("Vuna.Compiler.Loader.Resolve.resolveDo", "Vuna/Compiler/Loader/Resolve.vuna:682"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind", ("Vuna.Compiler.Loader.Resolve.resolveDoBind", "Vuna/Compiler/Loader/Resolve.vuna:694"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain", ("Vuna.Compiler.Loader.Resolve.resolveDoChain", "Vuna/Compiler/Loader/Resolve.vuna:708"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue", ("Vuna.Compiler.Loader.Resolve.resolveFieldValue", "Vuna/Compiler/Loader/Resolve.vuna:724"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl", ("Vuna.Compiler.Loader.Resolve.resolveCtorDecl", "Vuna/Compiler/Loader/Resolve.vuna:731"));
  ("v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName", ("Vuna.Compiler.Loader.Resolve.isLowerTypeName", "Vuna/Compiler/Loader/Resolve.vuna:735"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName", ("Vuna.Compiler.Loader.Resolve.startsUpperName", "Vuna/Compiler/Loader/Resolve.vuna:740"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName", ("Vuna.Compiler.Loader.Resolve.resolveTypeName", "Vuna/Compiler/Loader/Resolve.vuna:758"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult", ("Vuna.Compiler.Loader.Resolve.localCtorResult", "Vuna/Compiler/Loader/Resolve.vuna:768"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveLowerTypeName", ("Vuna.Compiler.Loader.Resolve.resolveLowerTypeName", "Vuna/Compiler/Loader/Resolve.vuna:775"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveNonLowerTypeName", ("Vuna.Compiler.Loader.Resolve.resolveNonLowerTypeName", "Vuna/Compiler/Loader/Resolve.vuna:798"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeName", ("Vuna.Compiler.Loader.Resolve.resolveDottedTypeName", "Vuna/Compiler/Loader/Resolve.vuna:816"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr", ("Vuna.Compiler.Loader.Resolve.resolveConstraintExpr", "Vuna/Compiler/Loader/Resolve.vuna:836"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf", ("Vuna.Compiler.Loader.Resolve.constraintHeadOf", "Vuna/Compiler/Loader/Resolve.vuna:843"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr", ("Vuna.Compiler.Loader.Resolve.resolveTypeExpr", "Vuna/Compiler/Loader/Resolve.vuna:848"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped", ("Vuna.Compiler.Loader.Resolve.resolveTypeExprScoped", "Vuna/Compiler/Loader/Resolve.vuna:854"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName", ("Vuna.Compiler.Loader.Resolve.resolveTypeTopName", "Vuna/Compiler/Loader/Resolve.vuna:880"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec", ("Vuna.Compiler.Loader.Resolve.resolveCtorSpec", "Vuna/Compiler/Loader/Resolve.vuna:885"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl", ("Vuna.Compiler.Loader.Resolve.resolveDecl", "Vuna/Compiler/Loader/Resolve.vuna:890"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField", ("Vuna.Compiler.Loader.Resolve.resolveRecordField", "Vuna/Compiler/Loader/Resolve.vuna:919"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod", ("Vuna.Compiler.Loader.Resolve.resolveTraitMethod", "Vuna/Compiler/Loader/Resolve.vuna:924"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod", ("Vuna.Compiler.Loader.Resolve.resolveInstanceMethod", "Vuna/Compiler/Loader/Resolve.vuna:929"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram", ("Vuna.Compiler.Loader.Resolve.resolveProgram", "Vuna/Compiler/Loader/Resolve.vuna:939"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry", ("Vuna.Compiler.Loader.Resolve.resolveEntry", "Vuna/Compiler/Loader/Resolve.vuna:945"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveModules", ("Vuna.Compiler.Loader.Resolve.resolveModules", "Vuna/Compiler/Loader/Resolve.vuna:949"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dtyShape", ("Vuna.Compiler.Loader.Resolve.tyShape", "Vuna/Compiler/Loader/Resolve.vuna:956"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets", ("Vuna.Compiler.Loader.Resolve.ctorPairTargets", "Vuna/Compiler/Loader/Resolve.vuna:972"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dlexCacheSchema", ("Vuna.Compiler.Loader.Flatten.lexCacheSchema", "Vuna/Compiler/Loader/Flatten.vuna:64"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dlexCacheCodec", ("Vuna.Compiler.Loader.Flatten.lexCacheCodec", "Vuna/Compiler/Loader/Flatten.vuna:68"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dlexCacheDir", ("Vuna.Compiler.Loader.Flatten.lexCacheDir", "Vuna/Compiler/Loader/Flatten.vuna:73"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dlexKeyOf", ("Vuna.Compiler.Loader.Flatten.lexKeyOf", "Vuna/Compiler/Loader/Flatten.vuna:79"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dreadLexCache", ("Vuna.Compiler.Loader.Flatten.readLexCache", "Vuna/Compiler/Loader/Flatten.vuna:84"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dstoreLexCache", ("Vuna.Compiler.Loader.Flatten.storeLexCache", "Vuna/Compiler/Loader/Flatten.vuna:93"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath", ("Vuna.Compiler.Loader.Flatten.parseFileWithPath", "Vuna/Compiler/Loader/Flatten.vuna:100"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dlexAndStore", ("Vuna.Compiler.Loader.Flatten.lexAndStore", "Vuna/Compiler/Loader/Flatten.vuna:114"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dparseWith", ("Vuna.Compiler.Loader.Flatten.parseWith", "Vuna/Compiler/Loader/Flatten.vuna:125"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dattachParsePath", ("Vuna.Compiler.Loader.Flatten.attachParsePath", "Vuna/Compiler/Loader/Flatten.vuna:139"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf", ("Vuna.Compiler.Loader.Flatten.visibleFixitiesOf", "Vuna/Compiler/Loader/Flatten.vuna:144"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities", ("Vuna.Compiler.Loader.Flatten.dedupeFixities", "Vuna/Compiler/Loader/Flatten.vuna:155"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo", ("Vuna.Compiler.Loader.Flatten.dedupeFixitiesGo", "Vuna/Compiler/Loader/Flatten.vuna:158"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName", ("Vuna.Compiler.Loader.Flatten.isPrivateName", "Vuna/Compiler/Loader/Flatten.vuna:170"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg", ("Vuna.Compiler.Loader.Flatten.privateExportMsg", "Vuna/Compiler/Loader/Flatten.vuna:173"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData", ("Vuna.Compiler.Loader.Flatten.findOwnData", "Vuna/Compiler/Loader/Flatten.vuna:180"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn", ("Vuna.Compiler.Loader.Flatten.findOwnFn", "Vuna/Compiler/Loader/Flatten.vuna:191"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed", ("Vuna.Compiler.Loader.Flatten.findCtorNamed", "Vuna/Compiler/Loader/Flatten.vuna:200"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed", ("Vuna.Compiler.Loader.Flatten.findMethodNamed", "Vuna/Compiler/Loader/Flatten.vuna:206"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames", ("Vuna.Compiler.Loader.Flatten.findOwnCtorNames", "Vuna/Compiler/Loader/Flatten.vuna:213"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries", ("Vuna.Compiler.Loader.Flatten.ownCtorEntries", "Vuna/Compiler/Loader/Flatten.vuna:229"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries", ("Vuna.Compiler.Loader.Flatten.ownDataCtorEntries", "Vuna/Compiler/Loader/Flatten.vuna:239"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries", ("Vuna.Compiler.Loader.Flatten.ownTypeEntries", "Vuna/Compiler/Loader/Flatten.vuna:249"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType", ("Vuna.Compiler.Loader.Flatten.ctorEntriesOfType", "Vuna/Compiler/Loader/Flatten.vuna:268"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddeclImplicitExports", ("Vuna.Compiler.Loader.Flatten.declImplicitExports", "Vuna/Compiler/Loader/Flatten.vuna:274"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dimplicitExports", ("Vuna.Compiler.Loader.Flatten.implicitExports", "Vuna/Compiler/Loader/Flatten.vuna:307"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddedupeImplicitExports", ("Vuna.Compiler.Loader.Flatten.dedupeImplicitExports", "Vuna/Compiler/Loader/Flatten.vuna:312"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByPublic", ("Vuna.Compiler.Loader.Flatten.dedupeByPublic", "Vuna/Compiler/Loader/Flatten.vuna:317"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates", ("Vuna.Compiler.Loader.Flatten.typeRefDominates", "Vuna/Compiler/Loader/Flatten.vuna:329"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget", ("Vuna.Compiler.Loader.Flatten.isRecordTarget", "Vuna/Compiler/Loader/Flatten.vuna:337"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl", ("Vuna.Compiler.Loader.Flatten.isRecordDecl", "Vuna/Compiler/Loader/Flatten.vuna:347"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList", ("Vuna.Compiler.Loader.Flatten.refEntryList", "Vuna/Compiler/Loader/Flatten.vuna:353"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef", ("Vuna.Compiler.Loader.Flatten.ownOrImportedTypeRef", "Vuna/Compiler/Loader/Flatten.vuna:358"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef", ("Vuna.Compiler.Loader.Flatten.ownOrImportedValueRef", "Vuna/Compiler/Loader/Flatten.vuna:368"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2", ("Vuna.Compiler.Loader.Flatten.ownOrImportedValueRef2", "Vuna/Compiler/Loader/Flatten.vuna:374"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed", ("Vuna.Compiler.Loader.Flatten.ownCtorEntriesNamed", "Vuna/Compiler/Loader/Flatten.vuna:388"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportBare", ("Vuna.Compiler.Loader.Flatten.exportBare", "Vuna/Compiler/Loader/Flatten.vuna:404"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective", ("Vuna.Compiler.Loader.Flatten.exportSelective", "Vuna/Compiler/Loader/Flatten.vuna:427"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll", ("Vuna.Compiler.Loader.Flatten.exportTypeAll", "Vuna/Compiler/Loader/Flatten.vuna:441"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries", ("Vuna.Compiler.Loader.Flatten.exportItemEntries", "Vuna/Compiler/Loader/Flatten.vuna:469"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind", ("Vuna.Compiler.Loader.Flatten.hasSamePublicKind", "Vuna/Compiler/Loader/Flatten.vuna:478"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport", ("Vuna.Compiler.Loader.Flatten.hasConflictingExport", "Vuna/Compiler/Loader/Flatten.vuna:487"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dsameExportEntry", ("Vuna.Compiler.Loader.Flatten.sameExportEntry", "Vuna/Compiler/Loader/Flatten.vuna:493"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries", ("Vuna.Compiler.Loader.Flatten.dedupeExportEntries", "Vuna/Compiler/Loader/Flatten.vuna:497"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey", ("Vuna.Compiler.Loader.Flatten.exportEntryKey", "Vuna/Compiler/Loader/Flatten.vuna:500"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey", ("Vuna.Compiler.Loader.Flatten.dedupeByFullKey", "Vuna/Compiler/Loader/Flatten.vuna:503"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates", ("Vuna.Compiler.Loader.Flatten.checkExportDuplicates", "Vuna/Compiler/Loader/Flatten.vuna:512"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey", ("Vuna.Compiler.Loader.Flatten.exportItemKey", "Vuna/Compiler/Loader/Flatten.vuna:520"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem", ("Vuna.Compiler.Loader.Flatten.duplicateExportItem", "Vuna/Compiler/Loader/Flatten.vuna:525"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys", ("Vuna.Compiler.Loader.Flatten.dupItemKeys", "Vuna/Compiler/Loader/Flatten.vuna:530"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf", ("Vuna.Compiler.Loader.Flatten.memFirstOf", "Vuna/Compiler/Loader/Flatten.vuna:534"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName", ("Vuna.Compiler.Loader.Flatten.exportItemName", "Vuna/Compiler/Loader/Flatten.vuna:538"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems", ("Vuna.Compiler.Loader.Flatten.checkExportItems", "Vuna/Compiler/Loader/Flatten.vuna:543"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports", ("Vuna.Compiler.Loader.Flatten.explicitExports", "Vuna/Compiler/Loader/Flatten.vuna:548"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll", ("Vuna.Compiler.Loader.Flatten.exportItemsAll", "Vuna/Compiler/Loader/Flatten.vuna:556"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader", ("Vuna.Compiler.Loader.Flatten.validateModuleHeader", "Vuna/Compiler/Loader/Flatten.vuna:562"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports", ("Vuna.Compiler.Loader.Flatten.computeExports", "Vuna/Compiler/Loader/Flatten.vuna:567"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle", ("Vuna.Compiler.Loader.Flatten.showCycle", "Vuna/Compiler/Loader/Flatten.vuna:574"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude", ("Vuna.Compiler.Loader.Flatten.implicitPrelude", "Vuna/Compiler/Loader/Flatten.vuna:582"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom", ("Vuna.Compiler.Loader.Flatten.implicitPreludeFrom", "Vuna/Compiler/Loader/Flatten.vuna:588"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps", ("Vuna.Compiler.Loader.Flatten.implicitPreludeDeps", "Vuna/Compiler/Loader/Flatten.vuna:596"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadAll", ("Vuna.Compiler.Loader.Flatten.loadAll", "Vuna/Compiler/Loader/Flatten.vuna:603"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadModule", ("Vuna.Compiler.Loader.Flatten.loadModule", "Vuna/Compiler/Loader/Flatten.vuna:613"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadProject", ("Vuna.Compiler.Loader.Flatten.loadProject", "Vuna/Compiler/Loader/Flatten.vuna:661"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadProjectWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:668"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules", ("Vuna.Compiler.Loader.Flatten.loadProjectModules", "Vuna/Compiler/Loader/Flatten.vuna:696"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadProjectModulesWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:699"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource", ("Vuna.Compiler.Loader.Flatten.loadProjectSource", "Vuna/Compiler/Loader/Flatten.vuna:713"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadProjectSourceWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:717"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource", ("Vuna.Compiler.Loader.Flatten.loadModuleSource", "Vuna/Compiler/Loader/Flatten.vuna:745"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadModuleSourceWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:749"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn", ("Vuna.Compiler.Loader.Flatten.fixitiesForSourceIn", "Vuna/Compiler/Loader/Flatten.vuna:787"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSource", ("Vuna.Compiler.Loader.Flatten.fixitiesForSource", "Vuna/Compiler/Loader/Flatten.vuna:827"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject", ("Vuna.Compiler.Loader.Flatten.resolveProject", "Vuna/Compiler/Loader/Flatten.vuna:837"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith", ("Vuna.Compiler.Loader.Flatten.resolveProjectWith", "Vuna/Compiler/Loader/Flatten.vuna:841"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping", ("Vuna.Compiler.Loader.Flatten.resolveProjectKeeping", "Vuna/Compiler/Loader/Flatten.vuna:845"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep", ("Vuna.Compiler.Loader.Flatten.resolveModulesKeep", "Vuna/Compiler/Loader/Flatten.vuna:854"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarnings", ("Vuna.Compiler.Loader.Flatten.unusedImportWarnings", "Vuna/Compiler/Loader/Flatten.vuna:866"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dinterpReferencedInSource", ("Vuna.Compiler.Loader.Flatten.interpReferencedInSource", "Vuna/Compiler/Loader/Flatten.vuna:880"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarningsGo", ("Vuna.Compiler.Loader.Flatten.unusedImportWarningsGo", "Vuna/Compiler/Loader/Flatten.vuna:886"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dimportRemovalSpan", ("Vuna.Compiler.Loader.Flatten.importRemovalSpan", "Vuna/Compiler/Loader/Flatten.vuna:895"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddeclGlobalNames", ("Vuna.Compiler.Loader.Flatten.declGlobalNames", "Vuna/Compiler/Loader/Flatten.vuna:900"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexpandGlobalName", ("Vuna.Compiler.Loader.Flatten.expandGlobalName", "Vuna/Compiler/Loader/Flatten.vuna:907"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportTargetOf", ("Vuna.Compiler.Loader.Flatten.exportTargetOf", "Vuna/Compiler/Loader/Flatten.vuna:914"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_danyTargetIn", ("Vuna.Compiler.Loader.Flatten.anyTargetIn", "Vuna/Compiler/Loader/Flatten.vuna:918"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames", ("Vuna.Compiler.Loader.Flatten.declRefNames", "Vuna/Compiler/Loader/Flatten.vuna:924"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dctorRefNames", ("Vuna.Compiler.Loader.Flatten.ctorRefNames", "Vuna/Compiler/Loader/Flatten.vuna:938"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfieldRefNames", ("Vuna.Compiler.Loader.Flatten.fieldRefNames", "Vuna/Compiler/Loader/Flatten.vuna:942"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dtraitMethodRefNames", ("Vuna.Compiler.Loader.Flatten.traitMethodRefNames", "Vuna/Compiler/Loader/Flatten.vuna:946"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames", ("Vuna.Compiler.Loader.Flatten.patRefNames", "Vuna/Compiler/Loader/Flatten.vuna:950"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames", ("Vuna.Compiler.Loader.Flatten.exprRefNames", "Vuna/Compiler/Loader/Flatten.vuna:961"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dbindRefNames", ("Vuna.Compiler.Loader.Flatten.bindRefNames", "Vuna/Compiler/Loader/Flatten.vuna:991"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dclauseRefNames", ("Vuna.Compiler.Loader.Flatten.clauseRefNames", "Vuna/Compiler/Loader/Flatten.vuna:995"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddoStmtRefNames", ("Vuna.Compiler.Loader.Flatten.doStmtRefNames", "Vuna/Compiler/Loader/Flatten.vuna:999"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dinterpPartRefNames", ("Vuna.Compiler.Loader.Flatten.interpPartRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1004"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigIsErased", ("Vuna.Compiler.Core.Term.rigIsErased", "Vuna/Compiler/Core/Term.vuna:126"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigIsLinear", ("Vuna.Compiler.Core.Term.rigIsLinear", "Vuna/Compiler/Core/Term.vuna:131"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigIsOmega", ("Vuna.Compiler.Core.Term.rigIsOmega", "Vuna/Compiler/Core/Term.vuna:135"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigOfBinder", ("Vuna.Compiler.Core.Term.rigOfBinder", "Vuna/Compiler/Core/Term.vuna:142"));
  ("v_Vuna_dCompiler_dCore_dTerm_ddefaultExplicitRig", ("Vuna.Compiler.Core.Term.defaultExplicitRig", "Vuna/Compiler/Core/Term.vuna:147"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigAdd", ("Vuna.Compiler.Core.Term.rigAdd", "Vuna/Compiler/Core/Term.vuna:154"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigScale", ("Vuna.Compiler.Core.Term.rigScale", "Vuna/Compiler/Core/Term.vuna:160"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigJoin", ("Vuna.Compiler.Core.Term.rigJoin", "Vuna/Compiler/Core/Term.vuna:166"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigExact", ("Vuna.Compiler.Core.Term.rigExact", "Vuna/Compiler/Core/Term.vuna:174"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowRig", ("Vuna.Compiler.Core.Term.showRig", "Vuna/Compiler/Core/Term.vuna:181"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelZero", ("Vuna.Compiler.Core.Term.levelZero", "Vuna/Compiler/Core/Term.vuna:192"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelSucc", ("Vuna.Compiler.Core.Term.levelSucc", "Vuna/Compiler/Core/Term.vuna:195"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelMax", ("Vuna.Compiler.Core.Term.levelMax", "Vuna/Compiler/Core/Term.vuna:198"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelToInt", ("Vuna.Compiler.Core.Term.levelToInt", "Vuna/Compiler/Core/Term.vuna:201"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt", ("Vuna.Compiler.Core.Term.levelOfInt", "Vuna/Compiler/Core/Term.vuna:205"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelEq", ("Vuna.Compiler.Core.Term.levelEq", "Vuna/Compiler/Core/Term.vuna:208"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelLt", ("Vuna.Compiler.Core.Term.levelLt", "Vuna/Compiler/Core/Term.vuna:211"));
  ("v_Vuna_dCompiler_dCore_dTerm_dcaseAltName", ("Vuna.Compiler.Core.Term.caseAltName", "Vuna/Compiler/Core/Term.vuna:252"));
  ("v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders", ("Vuna.Compiler.Core.Term.caseAltBinders", "Vuna/Compiler/Core/Term.vuna:255"));
  ("v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody", ("Vuna.Compiler.Core.Term.caseAltBody", "Vuna/Compiler/Core/Term.vuna:258"));
  ("v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel", ("Vuna.Compiler.Core.Term.defaultFuel", "Vuna/Compiler/Core/Term.vuna:296"));
  ("v_Vuna_dCompiler_dCore_dTerm_dnatChainMax", ("Vuna.Compiler.Core.Term.natChainMax", "Vuna/Compiler/Core/Term.vuna:310"));
  ("v_Vuna_dCompiler_dCore_dTerm_dnatChainValue", ("Vuna.Compiler.Core.Term.natChainValue", "Vuna/Compiler/Core/Term.vuna:317"));
  ("v_Vuna_dCompiler_dCore_dTerm_dnatChainGo", ("Vuna.Compiler.Core.Term.natChainGo", "Vuna/Compiler/Core/Term.vuna:320"));
  ("v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs", ("Vuna.Compiler.Core.Term.natChainArgs", "Vuna/Compiler/Core/Term.vuna:328"));
  ("v_Vuna_dCompiler_dCore_dTerm_dnatChainNext", ("Vuna.Compiler.Core.Term.natChainNext", "Vuna/Compiler/Core/Term.vuna:340"));
  ("v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp", ("Vuna.Compiler.Core.Term.flattenTermApp", "Vuna/Compiler/Core/Term.vuna:344"));
  ("v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo", ("Vuna.Compiler.Core.Term.flattenTermAppGo", "Vuna/Compiler/Core/Term.vuna:347"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermSize", ("Vuna.Compiler.Core.Term.termSize", "Vuna/Compiler/Core/Term.vuna:355"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs", ("Vuna.Compiler.Core.Term.termSizeArgs", "Vuna/Compiler/Core/Term.vuna:375"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts", ("Vuna.Compiler.Core.Term.termSizeAlts", "Vuna/Compiler/Core/Term.vuna:379"));
  ("v_Vuna_dCompiler_dCore_dTerm_dmetaLookup", ("Vuna.Compiler.Core.Term.metaLookup", "Vuna/Compiler/Core/Term.vuna:387"));
  ("v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList", ("Vuna.Compiler.Core.Term.metaLookupList", "Vuna/Compiler/Core/Term.vuna:391"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty", ("Vuna.Compiler.Core.Term.solsEmpty", "Vuna/Compiler/Core/Term.vuna:416"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsFromList", ("Vuna.Compiler.Core.Term.solsFromList", "Vuna/Compiler/Core/Term.vuna:419"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsOf", ("Vuna.Compiler.Core.Term.solsOf", "Vuna/Compiler/Core/Term.vuna:425"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsList", ("Vuna.Compiler.Core.Term.solsList", "Vuna/Compiler/Core/Term.vuna:428"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsPutDefVals", ("Vuna.Compiler.Core.Term.solsPutDefVals", "Vuna/Compiler/Core/Term.vuna:432"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsDepth", ("Vuna.Compiler.Core.Term.solsDepth", "Vuna/Compiler/Core/Term.vuna:436"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsLookup", ("Vuna.Compiler.Core.Term.solsLookup", "Vuna/Compiler/Core/Term.vuna:441"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsCons", ("Vuna.Compiler.Core.Term.solsCons", "Vuna/Compiler/Core/Term.vuna:444"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta", ("Vuna.Compiler.Core.Term.termHasUnsolvedMeta", "Vuna/Compiler/Core/Term.vuna:449"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs", ("Vuna.Compiler.Core.Term.termHasUnsolvedMetaArgs", "Vuna/Compiler/Core/Term.vuna:475"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts", ("Vuna.Compiler.Core.Term.termHasUnsolvedMetaAlts", "Vuna/Compiler/Core/Term.vuna:480"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat", ("Vuna.Compiler.Core.Term.termUsesFloat", "Vuna/Compiler/Core/Term.vuna:487"));
  ("v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat", ("Vuna.Compiler.Core.Term.anyArgUsesFloat", "Vuna/Compiler/Core/Term.vuna:510"));
  ("v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat", ("Vuna.Compiler.Core.Term.anyAltUsesFloat", "Vuna/Compiler/Core/Term.vuna:515"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames", ("Vuna.Compiler.Core.Term.termGlobalNames", "Vuna/Compiler/Core/Term.vuna:521"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermReachesFloat", ("Vuna.Compiler.Core.Term.termReachesFloat", "Vuna/Compiler/Core/Term.vuna:548"));
  ("v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel", ("Vuna.Compiler.Core.Term.reachesTermsFuel", "Vuna/Compiler/Core/Term.vuna:553"));
  ("v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf", ("Vuna.Compiler.Core.Term.bodyTermsOf", "Vuna/Compiler/Core/Term.vuna:562"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlookupPair", ("Vuna.Compiler.Core.Term.lookupPair", "Vuna/Compiler/Core/Term.vuna:569"));
  ("v_Vuna_dCompiler_dCore_dTerm_ddefLookup", ("Vuna.Compiler.Core.Term.defLookup", "Vuna/Compiler/Core/Term.vuna:573"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar", ("Vuna.Compiler.Core.Term.hasFreeVar", "Vuna/Compiler/Core/Term.vuna:577"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs", ("Vuna.Compiler.Core.Term.hasFreeVarArgs", "Vuna/Compiler/Core/Term.vuna:599"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts", ("Vuna.Compiler.Core.Term.hasFreeVarAlts", "Vuna/Compiler/Core/Term.vuna:603"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasMeta", ("Vuna.Compiler.Core.Term.hasMeta", "Vuna/Compiler/Core/Term.vuna:608"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs", ("Vuna.Compiler.Core.Term.hasMetaArgs", "Vuna/Compiler/Core/Term.vuna:629"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts", ("Vuna.Compiler.Core.Term.hasMetaAlts", "Vuna/Compiler/Core/Term.vuna:633"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshift", ("Vuna.Compiler.Core.Term.shift", "Vuna/Compiler/Core/Term.vuna:642"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshiftArgs", ("Vuna.Compiler.Core.Term.shiftArgs", "Vuna/Compiler/Core/Term.vuna:666"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshiftAlts", ("Vuna.Compiler.Core.Term.shiftAlts", "Vuna/Compiler/Core/Term.vuna:671"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshiftAlt", ("Vuna.Compiler.Core.Term.shiftAlt", "Vuna/Compiler/Core/Term.vuna:675"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt", ("Vuna.Compiler.Core.Term.substVarAt", "Vuna/Compiler/Core/Term.vuna:680"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt", ("Vuna.Compiler.Core.Term.substAltAt", "Vuna/Compiler/Core/Term.vuna:707"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar", ("Vuna.Compiler.Core.Term.substMetaVar", "Vuna/Compiler/Core/Term.vuna:712"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo", ("Vuna.Compiler.Core.Term.substMetaVarGo", "Vuna/Compiler/Core/Term.vuna:715"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt", ("Vuna.Compiler.Core.Term.substMetaVarAlt", "Vuna/Compiler/Core/Term.vuna:738"));
  ("v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder", ("Vuna.Compiler.Core.Term.insertDictBinder", "Vuna/Compiler/Core/Term.vuna:744"));
  ("v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo", ("Vuna.Compiler.Core.Term.insertDictBinderGo", "Vuna/Compiler/Core/Term.vuna:750"));
  ("v_Vuna_dCompiler_dCore_dTerm_dcutoffOf", ("Vuna.Compiler.Core.Term.cutoffOf", "Vuna/Compiler/Core/Term.vuna:757"));
  ("v_Vuna_dCompiler_dCore_dTerm_dcountPis", ("Vuna.Compiler.Core.Term.countPis", "Vuna/Compiler/Core/Term.vuna:760"));
  ("v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder", ("Vuna.Compiler.Core.Term.insertLamBinder", "Vuna/Compiler/Core/Term.vuna:769"));
  ("v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo", ("Vuna.Compiler.Core.Term.insertLamBinderGo", "Vuna/Compiler/Core/Term.vuna:772"));
  ("v_Vuna_dCompiler_dCore_dTerm_dcountLams", ("Vuna.Compiler.Core.Term.countLams", "Vuna/Compiler/Core/Term.vuna:778"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar", ("Vuna.Compiler.Core.Term.hasFreeTermVar", "Vuna/Compiler/Core/Term.vuna:783"));
  ("v_Vuna_dCompiler_dCore_dTerm_danyPairFree", ("Vuna.Compiler.Core.Term.anyPairFree", "Vuna/Compiler/Core/Term.vuna:797"));
  ("v_Vuna_dCompiler_dCore_dTerm_danyAltFree", ("Vuna.Compiler.Core.Term.anyAltFree", "Vuna/Compiler/Core/Term.vuna:801"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar", ("Vuna.Compiler.Core.Term.hasNegativeVar", "Vuna/Compiler/Core/Term.vuna:808"));
  ("v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs", ("Vuna.Compiler.Core.Term.anyNegativeVarArgs", "Vuna/Compiler/Core/Term.vuna:822"));
  ("v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts", ("Vuna.Compiler.Core.Term.anyNegativeVarAlts", "Vuna/Compiler/Core/Term.vuna:826"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaValue", "Vuna/Compiler/Core/Term.vuna:831"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaValueFuel", "Vuna/Compiler/Core/Term.vuna:834"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaList", "Vuna/Compiler/Core/Term.vuna:857"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaListFuel", "Vuna/Compiler/Core/Term.vuna:860"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaClo", "Vuna/Compiler/Core/Term.vuna:867"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaCloFuel", "Vuna/Compiler/Core/Term.vuna:870"));
  ("v_Vuna_dCompiler_dCore_dTerm_disTypeValue", ("Vuna.Compiler.Core.Term.isTypeValue", "Vuna/Compiler/Core/Term.vuna:878"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf", ("Vuna.Compiler.Core.Term.typeLevelOf", "Vuna/Compiler/Core/Term.vuna:882"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes", ("Vuna.Compiler.Core.Term.levelEscapes", "Vuna/Compiler/Core/Term.vuna:890"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList", ("Vuna.Compiler.Core.Term.levelEscapesList", "Vuna/Compiler/Core/Term.vuna:910"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo", ("Vuna.Compiler.Core.Term.levelEscapesClo", "Vuna/Compiler/Core/Term.vuna:914"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowTerm", ("Vuna.Compiler.Core.Term.showTerm", "Vuna/Compiler/Core/Term.vuna:917"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig", ("Vuna.Compiler.Core.Term.showTypeSig", "Vuna/Compiler/Core/Term.vuna:944"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi", ("Vuna.Compiler.Core.Term.showSigParenIfPi", "Vuna/Compiler/Core/Term.vuna:955"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs", ("Vuna.Compiler.Core.Term.showSigArgs", "Vuna/Compiler/Core/Term.vuna:959"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms", ("Vuna.Compiler.Core.Term.showArgTerms", "Vuna/Compiler/Core/Term.vuna:963"));
  ("v_Vuna_dCompiler_dCore_dTerm_drecordAppShow", ("Vuna.Compiler.Core.Term.recordAppShow", "Vuna/Compiler/Core/Term.vuna:968"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText", ("Vuna.Compiler.Core.Term.showSigAppText", "Vuna/Compiler/Core/Term.vuna:973"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts", ("Vuna.Compiler.Core.Term.showCoreAlts", "Vuna/Compiler/Core/Term.vuna:978"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowBinders", ("Vuna.Compiler.Core.Term.showBinders", "Vuna/Compiler/Core/Term.vuna:983"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowCoreString", ("Vuna.Compiler.Core.Term.showCoreString", "Vuna/Compiler/Core/Term.vuna:987"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars", ("Vuna.Compiler.Core.Term.showCoreChars", "Vuna/Compiler/Core/Term.vuna:990"));
  ("v_Vuna_dCompiler_dCore_dEval_dlookupEnv", ("Vuna.Compiler.Core.Eval.lookupEnv", "Vuna/Compiler/Core/Eval.vuna:76"));
  ("v_Vuna_dCompiler_dCore_dEval_deval", ("Vuna.Compiler.Core.Eval.eval", "Vuna/Compiler/Core/Eval.vuna:80"));
  ("v_Vuna_dCompiler_dCore_dEval_devalFuelFor", ("Vuna.Compiler.Core.Eval.evalFuelFor", "Vuna/Compiler/Core/Eval.vuna:88"));
  ("v_Vuna_dCompiler_dCore_dEval_devalFuelMax", ("Vuna.Compiler.Core.Eval.evalFuelMax", "Vuna/Compiler/Core/Eval.vuna:94"));
  ("v_Vuna_dCompiler_dCore_dEval_devalFuel", ("Vuna.Compiler.Core.Eval.evalFuel", "Vuna/Compiler/Core/Eval.vuna:97"));
  ("v_Vuna_dCompiler_dCore_dEval_devalAlt", ("Vuna.Compiler.Core.Eval.evalAlt", "Vuna/Compiler/Core/Eval.vuna:127"));
  ("v_Vuna_dCompiler_dCore_dEval_devalAlts", ("Vuna.Compiler.Core.Eval.evalAlts", "Vuna/Compiler/Core/Eval.vuna:130"));
  ("v_Vuna_dCompiler_dCore_dEval_devalArgTerms", ("Vuna.Compiler.Core.Eval.evalArgTerms", "Vuna/Compiler/Core/Eval.vuna:134"));
  ("v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel", ("Vuna.Compiler.Core.Eval.evalArgTermsFuel", "Vuna/Compiler/Core/Eval.vuna:137"));
  ("v_Vuna_dCompiler_dCore_dEval_devalCase", ("Vuna.Compiler.Core.Eval.evalCase", "Vuna/Compiler/Core/Eval.vuna:145"));
  ("v_Vuna_dCompiler_dCore_dEval_devalCaseFuel", ("Vuna.Compiler.Core.Eval.evalCaseFuel", "Vuna/Compiler/Core/Eval.vuna:148"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt", ("Vuna.Compiler.Core.Eval.applyCaseAlt", "Vuna/Compiler/Core/Eval.vuna:154"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel", ("Vuna.Compiler.Core.Eval.applyCaseAltFuel", "Vuna/Compiler/Core/Eval.vuna:157"));
  ("v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv", ("Vuna.Compiler.Core.Eval.catchAllEnv", "Vuna/Compiler/Core/Eval.vuna:169"));
  ("v_Vuna_dCompiler_dCore_dEval_devalIf", ("Vuna.Compiler.Core.Eval.evalIf", "Vuna/Compiler/Core/Eval.vuna:174"));
  ("v_Vuna_dCompiler_dCore_dEval_dspineAppend", ("Vuna.Compiler.Core.Eval.spineAppend", "Vuna/Compiler/Core/Eval.vuna:178"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyValue", ("Vuna.Compiler.Core.Eval.applyValue", "Vuna/Compiler/Core/Eval.vuna:182"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel", ("Vuna.Compiler.Core.Eval.applyValueFuel", "Vuna/Compiler/Core/Eval.vuna:185"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyClosure", ("Vuna.Compiler.Core.Eval.applyClosure", "Vuna/Compiler/Core/Eval.vuna:200"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplySpine", ("Vuna.Compiler.Core.Eval.applySpine", "Vuna/Compiler/Core/Eval.vuna:203"));
  ("v_Vuna_dCompiler_dCore_dEval_dforce", ("Vuna.Compiler.Core.Eval.force", "Vuna/Compiler/Core/Eval.vuna:221"));
  ("v_Vuna_dCompiler_dCore_dEval_dasInt", ("Vuna.Compiler.Core.Eval.asInt", "Vuna/Compiler/Core/Eval.vuna:263"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatMax", ("Vuna.Compiler.Core.Eval.natMax", "Vuna/Compiler/Core/Eval.vuna:269"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatClamp", ("Vuna.Compiler.Core.Eval.natClamp", "Vuna/Compiler/Core/Eval.vuna:272"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatSatAdd", ("Vuna.Compiler.Core.Eval.natSatAdd", "Vuna/Compiler/Core/Eval.vuna:275"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatSatMul", ("Vuna.Compiler.Core.Eval.natSatMul", "Vuna/Compiler/Core/Eval.vuna:278"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatTruncSub", ("Vuna.Compiler.Core.Eval.natTruncSub", "Vuna/Compiler/Core/Eval.vuna:281"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatValueGo", ("Vuna.Compiler.Core.Eval.natValueGo", "Vuna/Compiler/Core/Eval.vuna:284"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatValue", ("Vuna.Compiler.Core.Eval.natValue", "Vuna/Compiler/Core/Eval.vuna:287"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatValueToInt", ("Vuna.Compiler.Core.Eval.natValueToInt", "Vuna/Compiler/Core/Eval.vuna:290"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatCtorInt", ("Vuna.Compiler.Core.Eval.natCtorInt", "Vuna/Compiler/Core/Eval.vuna:295"));
  ("v_Vuna_dCompiler_dCore_dEval_dasNat", ("Vuna.Compiler.Core.Eval.asNat", "Vuna/Compiler/Core/Eval.vuna:306"));
  ("v_Vuna_dCompiler_dCore_dEval_dfloatOfRaw", ("Vuna.Compiler.Core.Eval.floatOfRaw", "Vuna/Compiler/Core/Eval.vuna:318"));
  ("v_Vuna_dCompiler_dCore_dEval_ddigitsOf", ("Vuna.Compiler.Core.Eval.digitsOf", "Vuna/Compiler/Core/Eval.vuna:324"));
  ("v_Vuna_dCompiler_dCore_dEval_ddigitsOfChars", ("Vuna.Compiler.Core.Eval.digitsOfChars", "Vuna/Compiler/Core/Eval.vuna:327"));
  ("v_Vuna_dCompiler_dCore_dEval_dpow10Of", ("Vuna.Compiler.Core.Eval.pow10Of", "Vuna/Compiler/Core/Eval.vuna:334"));
  ("v_Vuna_dCompiler_dCore_dEval_dshowFloatOf", ("Vuna.Compiler.Core.Eval.showFloatOf", "Vuna/Compiler/Core/Eval.vuna:338"));
  ("v_Vuna_dCompiler_dCore_dEval_dshowFloatRaw", ("Vuna.Compiler.Core.Eval.showFloatRaw", "Vuna/Compiler/Core/Eval.vuna:342"));
  ("v_Vuna_dCompiler_dCore_dEval_dasFloat", ("Vuna.Compiler.Core.Eval.asFloat", "Vuna/Compiler/Core/Eval.vuna:345"));
  ("v_Vuna_dCompiler_dCore_dEval_dfloatPrim1", ("Vuna.Compiler.Core.Eval.floatPrim1", "Vuna/Compiler/Core/Eval.vuna:349"));
  ("v_Vuna_dCompiler_dCore_dEval_dfloatPrim2", ("Vuna.Compiler.Core.Eval.floatPrim2", "Vuna/Compiler/Core/Eval.vuna:355"));
  ("v_Vuna_dCompiler_dCore_dEval_dfloatBool2", ("Vuna.Compiler.Core.Eval.floatBool2", "Vuna/Compiler/Core/Eval.vuna:363"));
  ("v_Vuna_dCompiler_dCore_dEval_dasStr", ("Vuna.Compiler.Core.Eval.asStr", "Vuna/Compiler/Core/Eval.vuna:371"));
  ("v_Vuna_dCompiler_dCore_dEval_dasBool", ("Vuna.Compiler.Core.Eval.asBool", "Vuna/Compiler/Core/Eval.vuna:375"));
  ("v_Vuna_dCompiler_dCore_dEval_dintPrim2", ("Vuna.Compiler.Core.Eval.intPrim2", "Vuna/Compiler/Core/Eval.vuna:379"));
  ("v_Vuna_dCompiler_dCore_dEval_dintPrim2Div", ("Vuna.Compiler.Core.Eval.intPrim2Div", "Vuna/Compiler/Core/Eval.vuna:390"));
  ("v_Vuna_dCompiler_dCore_dEval_dboolPrim2", ("Vuna.Compiler.Core.Eval.boolPrim2", "Vuna/Compiler/Core/Eval.vuna:398"));
  ("v_Vuna_dCompiler_dCore_dEval_dprimConst", ("Vuna.Compiler.Core.Eval.primConst", "Vuna/Compiler/Core/Eval.vuna:407"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrPrim2", ("Vuna.Compiler.Core.Eval.strPrim2", "Vuna/Compiler/Core/Eval.vuna:411"));
  ("v_Vuna_dCompiler_dCore_dEval_dintPrim1", ("Vuna.Compiler.Core.Eval.intPrim1", "Vuna/Compiler/Core/Eval.vuna:419"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatPrim1", ("Vuna.Compiler.Core.Eval.natPrim1", "Vuna/Compiler/Core/Eval.vuna:425"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatPrim2", ("Vuna.Compiler.Core.Eval.natPrim2", "Vuna/Compiler/Core/Eval.vuna:431"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatPrim2Div", ("Vuna.Compiler.Core.Eval.natPrim2Div", "Vuna/Compiler/Core/Eval.vuna:439"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrPrim1", ("Vuna.Compiler.Core.Eval.strPrim1", "Vuna/Compiler/Core/Eval.vuna:447"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrEq", ("Vuna.Compiler.Core.Eval.strEq", "Vuna/Compiler/Core/Eval.vuna:454"));
  ("v_Vuna_dCompiler_dCore_dEval_dgenericCmp", ("Vuna.Compiler.Core.Eval.genericCmp", "Vuna/Compiler/Core/Eval.vuna:457"));
  ("v_Vuna_dCompiler_dCore_dEval_dcmpInt", ("Vuna.Compiler.Core.Eval.cmpInt", "Vuna/Compiler/Core/Eval.vuna:469"));
  ("v_Vuna_dCompiler_dCore_dEval_dgenericPrim2", ("Vuna.Compiler.Core.Eval.genericPrim2", "Vuna/Compiler/Core/Eval.vuna:472"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrPrim3", ("Vuna.Compiler.Core.Eval.strPrim3", "Vuna/Compiler/Core/Eval.vuna:478"));
  ("v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel", ("Vuna.Compiler.Core.Eval.valueEqFuel", "Vuna/Compiler/Core/Eval.vuna:492"));
  ("v_Vuna_dCompiler_dCore_dEval_dneutralEqFuel", ("Vuna.Compiler.Core.Eval.neutralEqFuel", "Vuna/Compiler/Core/Eval.vuna:518"));
  ("v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel", ("Vuna.Compiler.Core.Eval.valueListEqFuel", "Vuna/Compiler/Core/Eval.vuna:527"));
  ("v_Vuna_dCompiler_dCore_dEval_dforceLabelArgs", ("Vuna.Compiler.Core.Eval.forceLabelArgs", "Vuna/Compiler/Core/Eval.vuna:541"));
  ("v_Vuna_dCompiler_dCore_dEval_drowRemReduce", ("Vuna.Compiler.Core.Eval.rowRemReduce", "Vuna/Compiler/Core/Eval.vuna:550"));
  ("v_Vuna_dCompiler_dCore_dEval_dprimReduce", ("Vuna.Compiler.Core.Eval.primReduce", "Vuna/Compiler/Core/Eval.vuna:580"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrHashOf", ("Vuna.Compiler.Core.Eval.strHashOf", "Vuna/Compiler/Core/Eval.vuna:665"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrHashChars", ("Vuna.Compiler.Core.Eval.strHashChars", "Vuna/Compiler/Core/Eval.vuna:668"));
  ("v_Vuna_dCompiler_dCore_dEval_datPrim", ("Vuna.Compiler.Core.Eval.atPrim", "Vuna/Compiler/Core/Eval.vuna:673"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrAtBytes", ("Vuna.Compiler.Core.Eval.strAtBytes", "Vuna/Compiler/Core/Eval.vuna:681"));
  ("v_Vuna_dCompiler_dCore_dEval_dnthByte", ("Vuna.Compiler.Core.Eval.nthByte", "Vuna/Compiler/Core/Eval.vuna:684"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstringPrim", ("Vuna.Compiler.Core.Eval.substringPrim", "Vuna/Compiler/Core/Eval.vuna:690"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstringBytes", ("Vuna.Compiler.Core.Eval.substringBytes", "Vuna/Compiler/Core/Eval.vuna:700"));
  ("v_Vuna_dCompiler_dCore_dEval_dtakeBytes", ("Vuna.Compiler.Core.Eval.takeBytes", "Vuna/Compiler/Core/Eval.vuna:708"));
  ("v_Vuna_dCompiler_dCore_dEval_ddropBytes", ("Vuna.Compiler.Core.Eval.dropBytes", "Vuna/Compiler/Core/Eval.vuna:714"));
  ("v_Vuna_dCompiler_dCore_dEval_dargAt", ("Vuna.Compiler.Core.Eval.argAt", "Vuna/Compiler/Core/Eval.vuna:728"));
  ("v_Vuna_dCompiler_dCore_dEval_devalProjFuel", ("Vuna.Compiler.Core.Eval.evalProjFuel", "Vuna/Compiler/Core/Eval.vuna:733"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel", ("Vuna.Compiler.Core.Eval.normalizeFuel", "Vuna/Compiler/Core/Eval.vuna:741"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel", ("Vuna.Compiler.Core.Eval.normalizeCaseFuel", "Vuna/Compiler/Core/Eval.vuna:753"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeProjFuel", ("Vuna.Compiler.Core.Eval.normalizeProjFuel", "Vuna/Compiler/Core/Eval.vuna:761"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel", ("Vuna.Compiler.Core.Eval.normalizeNeutralFuel", "Vuna/Compiler/Core/Eval.vuna:770"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel", ("Vuna.Compiler.Core.Eval.normalizeIfFuel", "Vuna/Compiler/Core/Eval.vuna:785"));
  ("v_Vuna_dCompiler_dCore_dEval_dquote", ("Vuna.Compiler.Core.Eval.quote", "Vuna/Compiler/Core/Eval.vuna:800"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteFuel", ("Vuna.Compiler.Core.Eval.quoteFuel", "Vuna/Compiler/Core/Eval.vuna:803"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteCaseAlt", ("Vuna.Compiler.Core.Eval.quoteCaseAlt", "Vuna/Compiler/Core/Eval.vuna:829"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel", ("Vuna.Compiler.Core.Eval.quoteCaseAltFuel", "Vuna/Compiler/Core/Eval.vuna:832"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteArgValues", ("Vuna.Compiler.Core.Eval.quoteArgValues", "Vuna/Compiler/Core/Eval.vuna:842"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel", ("Vuna.Compiler.Core.Eval.quoteArgValuesFuel", "Vuna/Compiler/Core/Eval.vuna:845"));
  ("v_Vuna_dCompiler_dCore_dEval_dargValsAt", ("Vuna.Compiler.Core.Eval.argValsAt", "Vuna/Compiler/Core/Eval.vuna:852"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder", ("Vuna.Compiler.Core.Eval.applyClosureBinder", "Vuna/Compiler/Core/Eval.vuna:858"));
  ("v_Vuna_dCompiler_dCore_dEval_dfreshVar", ("Vuna.Compiler.Core.Eval.freshVar", "Vuna/Compiler/Core/Eval.vuna:863"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteNeutral", ("Vuna.Compiler.Core.Eval.quoteNeutral", "Vuna/Compiler/Core/Eval.vuna:866"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel", ("Vuna.Compiler.Core.Eval.quoteNeutralFuel", "Vuna/Compiler/Core/Eval.vuna:869"));
  ("v_Vuna_dCompiler_dCore_dEval_dvarIndex", ("Vuna.Compiler.Core.Eval.varIndex", "Vuna/Compiler/Core/Eval.vuna:881"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine", ("Vuna.Compiler.Core.Eval.applyTermSpine", "Vuna/Compiler/Core/Eval.vuna:884"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas", ("Vuna.Compiler.Core.Eval.substSolvedMetas", "Vuna/Compiler/Core/Eval.vuna:892"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt", ("Vuna.Compiler.Core.Eval.substSolvedAlt", "Vuna/Compiler/Core/Eval.vuna:918"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAt", ("Vuna.Compiler.Core.Eval.substSolvedMetasAt", "Vuna/Compiler/Core/Eval.vuna:927"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo", ("Vuna.Compiler.Core.Eval.substSolvedMetasAtGo", "Vuna/Compiler/Core/Eval.vuna:931"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt", ("Vuna.Compiler.Core.Eval.substSolvedAltAt", "Vuna/Compiler/Core/Eval.vuna:957"));
  ("v_Vuna_dCompiler_dCore_dEval_disNilList", ("Vuna.Compiler.Core.Eval.isNilList", "Vuna/Compiler/Core/Eval.vuna:960"));
  ("v_Vuna_dCompiler_dCore_dEval_dshowValueAt", ("Vuna.Compiler.Core.Eval.showValueAt", "Vuna/Compiler/Core/Eval.vuna:966"));
  ("v_Vuna_dCompiler_dCore_dEval_dshowValue", ("Vuna.Compiler.Core.Eval.showValue", "Vuna/Compiler/Core/Eval.vuna:981"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalize", ("Vuna.Compiler.Core.Eval.normalize", "Vuna/Compiler/Core/Eval.vuna:984"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeCase", ("Vuna.Compiler.Core.Eval.normalizeCase", "Vuna/Compiler/Core/Eval.vuna:987"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutral", ("Vuna.Compiler.Core.Eval.normalizeNeutral", "Vuna/Compiler/Core/Eval.vuna:990"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeIf", ("Vuna.Compiler.Core.Eval.normalizeIf", "Vuna/Compiler/Core/Eval.vuna:993"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl", ("Vuna.Compiler.Core.Eval.substSolvedMetasAtTbl", "Vuna/Compiler/Core/Eval.vuna:1003"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel", ("Vuna.Compiler.Core.Eval.substSolvedMetasAtTblFuel", "Vuna/Compiler/Core/Eval.vuna:1006"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAtTbl", ("Vuna.Compiler.Core.Eval.substSolvedAltAtTbl", "Vuna/Compiler/Core/Eval.vuna:1035"));
  ("v_Vuna_dCompiler_dCore_dConv_dfastSame", ("Vuna.Compiler.Core.Conv.fastSame", "Vuna/Compiler/Core/Conv.vuna:38"));
  ("v_Vuna_dCompiler_dCore_dConv_disNatCtorName", ("Vuna.Compiler.Core.Conv.isNatCtorName", "Vuna/Compiler/Core/Conv.vuna:81"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatChainMaxValue", ("Vuna.Compiler.Core.Conv.natChainMaxValue", "Vuna/Compiler/Core/Conv.vuna:85"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatChainNextValue", ("Vuna.Compiler.Core.Conv.natChainNextValue", "Vuna/Compiler/Core/Conv.vuna:88"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatFoldValue", ("Vuna.Compiler.Core.Conv.natFoldValue", "Vuna/Compiler/Core/Conv.vuna:93"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatFoldGo", ("Vuna.Compiler.Core.Conv.natFoldGo", "Vuna/Compiler/Core/Conv.vuna:96"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatFoldArgs", ("Vuna.Compiler.Core.Conv.natFoldArgs", "Vuna/Compiler/Core/Conv.vuna:106"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatFoldApplied", ("Vuna.Compiler.Core.Conv.natFoldApplied", "Vuna/Compiler/Core/Conv.vuna:115"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatFoldSucc", ("Vuna.Compiler.Core.Conv.natFoldSucc", "Vuna/Compiler/Core/Conv.vuna:122"));
  ("v_Vuna_dCompiler_dCore_dConv_dsameNatValue", ("Vuna.Compiler.Core.Conv.sameNatValue", "Vuna/Compiler/Core/Conv.vuna:127"));
  ("v_Vuna_dCompiler_dCore_dConv_disNatLikeValue", ("Vuna.Compiler.Core.Conv.isNatLikeValue", "Vuna/Compiler/Core/Conv.vuna:135"));
  ("v_Vuna_dCompiler_dCore_dConv_disNatLikeHead", ("Vuna.Compiler.Core.Conv.isNatLikeHead", "Vuna/Compiler/Core/Conv.vuna:143"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatPrefixDepth", ("Vuna.Compiler.Core.Conv.natPrefixDepth", "Vuna/Compiler/Core/Conv.vuna:151"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatPrefixGo", ("Vuna.Compiler.Core.Conv.natPrefixGo", "Vuna/Compiler/Core/Conv.vuna:154"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNatNear", ("Vuna.Compiler.Core.Conv.convNatNear", "Vuna/Compiler/Core/Conv.vuna:180"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatPrefixMax", ("Vuna.Compiler.Core.Conv.natPrefixMax", "Vuna/Compiler/Core/Conv.vuna:190"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvFuelFor", ("Vuna.Compiler.Core.Conv.convFuelFor", "Vuna/Compiler/Core/Conv.vuna:198"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvFuelMax", ("Vuna.Compiler.Core.Conv.convFuelMax", "Vuna/Compiler/Core/Conv.vuna:205"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNatFuel", ("Vuna.Compiler.Core.Conv.convNatFuel", "Vuna/Compiler/Core/Conv.vuna:208"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNatChains", ("Vuna.Compiler.Core.Conv.convNatChains", "Vuna/Compiler/Core/Conv.vuna:213"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNatNeutral", ("Vuna.Compiler.Core.Conv.convNatNeutral", "Vuna/Compiler/Core/Conv.vuna:221"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNatApplied", ("Vuna.Compiler.Core.Conv.convNatApplied", "Vuna/Compiler/Core/Conv.vuna:229"));
  ("v_Vuna_dCompiler_dCore_dConv_disNilList", ("Vuna.Compiler.Core.Conv.isNilList", "Vuna/Compiler/Core/Conv.vuna:240"));
  ("v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom", ("Vuna.Compiler.Core.Conv.sameNeutralAtom", "Vuna/Compiler/Core/Conv.vuna:244"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvFuel", ("Vuna.Compiler.Core.Conv.convFuel", "Vuna/Compiler/Core/Conv.vuna:252"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvBothFuel", ("Vuna.Compiler.Core.Conv.convBothFuel", "Vuna/Compiler/Core/Conv.vuna:265"));
  ("v_Vuna_dCompiler_dCore_dConv_detaLeftFuel", ("Vuna.Compiler.Core.Conv.etaLeftFuel", "Vuna/Compiler/Core/Conv.vuna:334"));
  ("v_Vuna_dCompiler_dCore_dConv_detaRightFuel", ("Vuna.Compiler.Core.Conv.etaRightFuel", "Vuna/Compiler/Core/Conv.vuna:341"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel", ("Vuna.Compiler.Core.Conv.convNeutralFuel", "Vuna/Compiler/Core/Conv.vuna:348"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel", ("Vuna.Compiler.Core.Conv.convSpinesFuel", "Vuna/Compiler/Core/Conv.vuna:362"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel", ("Vuna.Compiler.Core.Conv.convValueListsFuel", "Vuna/Compiler/Core/Conv.vuna:371"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel", ("Vuna.Compiler.Core.Conv.convCaseAltsFuel", "Vuna/Compiler/Core/Conv.vuna:381"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel", ("Vuna.Compiler.Core.Conv.convOneAltFuel", "Vuna/Compiler/Core/Conv.vuna:392"));
  ("v_Vuna_dCompiler_dCore_dConv_dmismatchAt", ("Vuna.Compiler.Core.Conv.mismatchAt", "Vuna/Compiler/Core/Conv.vuna:402"));
  ("v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth", ("Vuna.Compiler.Core.Conv.metaCreatedDepth", "Vuna/Compiler/Core/Conv.vuna:423"));
  ("v_Vuna_dCompiler_dCore_dConv_dtermScopedTo", ("Vuna.Compiler.Core.Conv.termScopedTo", "Vuna/Compiler/Core/Conv.vuna:430"));
  ("v_Vuna_dCompiler_dCore_dConv_dargsScopedTo", ("Vuna.Compiler.Core.Conv.argsScopedTo", "Vuna/Compiler/Core/Conv.vuna:465"));
  ("v_Vuna_dCompiler_dCore_dConv_daltsScopedTo", ("Vuna.Compiler.Core.Conv.altsScopedTo", "Vuna/Compiler/Core/Conv.vuna:470"));
  ("v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf", ("Vuna.Compiler.Core.Conv.patternSpineOf", "Vuna/Compiler/Core/Conv.vuna:477"));
  ("v_Vuna_dCompiler_dCore_dConv_disNilSpine", ("Vuna.Compiler.Core.Conv.isNilSpine", "Vuna/Compiler/Core/Conv.vuna:489"));
  ("v_Vuna_dCompiler_dCore_dConv_dmemLevel", ("Vuna.Compiler.Core.Conv.memLevel", "Vuna/Compiler/Core/Conv.vuna:493"));
  ("v_Vuna_dCompiler_dCore_dConv_dlevelPos", ("Vuna.Compiler.Core.Conv.levelPos", "Vuna/Compiler/Core/Conv.vuna:497"));
  ("v_Vuna_dCompiler_dCore_dConv_dlevelPosGo", ("Vuna.Compiler.Core.Conv.levelPosGo", "Vuna/Compiler/Core/Conv.vuna:500"));
  ("v_Vuna_dCompiler_dCore_dConv_dspineLevels", ("Vuna.Compiler.Core.Conv.spineLevels", "Vuna/Compiler/Core/Conv.vuna:504"));
  ("v_Vuna_dCompiler_dCore_dConv_dabsPatternBody", ("Vuna.Compiler.Core.Conv.absPatternBody", "Vuna/Compiler/Core/Conv.vuna:512"));
  ("v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams", ("Vuna.Compiler.Core.Conv.wrapPatternLams", "Vuna/Compiler/Core/Conv.vuna:541"));
  ("v_Vuna_dCompiler_dCore_dConv_dpatternEnv", ("Vuna.Compiler.Core.Conv.patternEnv", "Vuna/Compiler/Core/Conv.vuna:548"));
  ("v_Vuna_dCompiler_dCore_dConv_dpatternSolution", ("Vuna.Compiler.Core.Conv.patternSolution", "Vuna/Compiler/Core/Conv.vuna:556"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty", ("Vuna.Compiler.Core.Conv.solveMetaEmpty", "Vuna/Compiler/Core/Conv.vuna:563"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore", ("Vuna.Compiler.Core.Conv.solveMetaEmptyStore", "Vuna/Compiler/Core/Conv.vuna:568"));
  ("v_Vuna_dCompiler_dCore_dConv_dsplitAtVals", ("Vuna.Compiler.Core.Conv.splitAtVals", "Vuna/Compiler/Core/Conv.vuna:581"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoLegacyFuel", ("Vuna.Compiler.Core.Conv.solveMetaHoLegacyFuel", "Vuna/Compiler/Core/Conv.vuna:587"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel", ("Vuna.Compiler.Core.Conv.solveMetaHeadLegacyFuel", "Vuna/Compiler/Core/Conv.vuna:606"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaPattern", ("Vuna.Compiler.Core.Conv.solveMetaPattern", "Vuna/Compiler/Core/Conv.vuna:618"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel", ("Vuna.Compiler.Core.Conv.solveMetaFuel", "Vuna/Compiler/Core/Conv.vuna:633"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew", ("Vuna.Compiler.Core.Conv.solveMetaNew", "Vuna/Compiler/Core/Conv.vuna:649"));
  ("v_Vuna_dCompiler_dCore_dConv_dconv", ("Vuna.Compiler.Core.Conv.conv", "Vuna/Compiler/Core/Conv.vuna:652"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvBoth", ("Vuna.Compiler.Core.Conv.convBoth", "Vuna/Compiler/Core/Conv.vuna:660"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvCaseAlts", ("Vuna.Compiler.Core.Conv.convCaseAlts", "Vuna/Compiler/Core/Conv.vuna:663"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvOneAlt", ("Vuna.Compiler.Core.Conv.convOneAlt", "Vuna/Compiler/Core/Conv.vuna:666"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvValueLists", ("Vuna.Compiler.Core.Conv.convValueLists", "Vuna/Compiler/Core/Conv.vuna:669"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNeutral", ("Vuna.Compiler.Core.Conv.convNeutral", "Vuna/Compiler/Core/Conv.vuna:672"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvSpines", ("Vuna.Compiler.Core.Conv.convSpines", "Vuna/Compiler/Core/Conv.vuna:675"));
  ("v_Vuna_dCompiler_dCore_dConv_detaLeft", ("Vuna.Compiler.Core.Conv.etaLeft", "Vuna/Compiler/Core/Conv.vuna:678"));
  ("v_Vuna_dCompiler_dCore_dConv_detaRight", ("Vuna.Compiler.Core.Conv.etaRight", "Vuna/Compiler/Core/Conv.vuna:681"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMeta", ("Vuna.Compiler.Core.Conv.solveMeta", "Vuna/Compiler/Core/Conv.vuna:684"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDefName", ("Vuna.Compiler.Elab.Types.dtDefName", "Vuna/Compiler/Elab/Types.vuna:139"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDefType", ("Vuna.Compiler.Elab.Types.dtDefType", "Vuna/Compiler/Elab/Types.vuna:144"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDefBody", ("Vuna.Compiler.Elab.Types.dtDefBody", "Vuna/Compiler/Elab/Types.vuna:149"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody", ("Vuna.Compiler.Elab.Types.dtDefHasBody", "Vuna/Compiler/Elab/Types.vuna:155"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern", ("Vuna.Compiler.Elab.Types.dtDefExtern", "Vuna/Compiler/Elab/Types.vuna:161"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan", ("Vuna.Compiler.Elab.Types.dtDefSpan", "Vuna/Compiler/Elab/Types.vuna:166"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtCtorName", ("Vuna.Compiler.Elab.Types.dtCtorName", "Vuna/Compiler/Elab/Types.vuna:180"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily", ("Vuna.Compiler.Elab.Types.dtCtorFamily", "Vuna/Compiler/Elab/Types.vuna:183"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope", ("Vuna.Compiler.Elab.Types.dtCtorTelescope", "Vuna/Compiler/Elab/Types.vuna:186"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtCtorType", ("Vuna.Compiler.Elab.Types.dtCtorType", "Vuna/Compiler/Elab/Types.vuna:189"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataName", ("Vuna.Compiler.Elab.Types.dtDataName", "Vuna/Compiler/Elab/Types.vuna:219"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors", ("Vuna.Compiler.Elab.Types.dtDataCtors", "Vuna/Compiler/Elab/Types.vuna:222"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataKind", ("Vuna.Compiler.Elab.Types.dtDataKind", "Vuna/Compiler/Elab/Types.vuna:225"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataViaClasses", ("Vuna.Compiler.Elab.Types.dtDataViaClasses", "Vuna/Compiler/Elab/Types.vuna:229"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataRepr", ("Vuna.Compiler.Elab.Types.dtDataRepr", "Vuna/Compiler/Elab/Types.vuna:235"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataFields", ("Vuna.Compiler.Elab.Types.dtDataFields", "Vuna/Compiler/Elab/Types.vuna:239"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord", ("Vuna.Compiler.Elab.Types.dtDataIsRecord", "Vuna/Compiler/Elab/Types.vuna:243"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear", ("Vuna.Compiler.Elab.Types.dtDataLinear", "Vuna/Compiler/Elab/Types.vuna:245"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtClassName", ("Vuna.Compiler.Elab.Types.dtClassName", "Vuna/Compiler/Elab/Types.vuna:264"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtInstName", ("Vuna.Compiler.Elab.Types.dtInstName", "Vuna/Compiler/Elab/Types.vuna:277"));
  ("v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp", ("Vuna.Compiler.Elab.Types.flattenTaggedApp", "Vuna/Compiler/Elab/Types.vuna:283"));
  ("v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf", ("Vuna.Compiler.Elab.Types.instFamilyOf", "Vuna/Compiler/Elab/Types.vuna:304"));
  ("v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty", ("Vuna.Compiler.Elab.Types.instStoreEmpty", "Vuna/Compiler/Elab/Types.vuna:310"));
  ("v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf", ("Vuna.Compiler.Elab.Types.instStoreOf", "Vuna/Compiler/Elab/Types.vuna:315"));
  ("v_Vuna_dCompiler_dElab_dTypes_dinstStorePush", ("Vuna.Compiler.Elab.Types.instStorePush", "Vuna/Compiler/Elab/Types.vuna:320"));
  ("v_Vuna_dCompiler_dElab_dTypes_dinstStoreFamily", ("Vuna.Compiler.Elab.Types.instStoreFamily", "Vuna/Compiler/Elab/Types.vuna:332"));
  ("v_Vuna_dCompiler_dElab_dTypes_dcsEmpty", ("Vuna.Compiler.Elab.Types.csEmpty", "Vuna/Compiler/Elab/Types.vuna:366"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutNext", ("Vuna.Compiler.Elab.Types.ecPutNext", "Vuna/Compiler/Elab/Types.vuna:406"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl", ("Vuna.Compiler.Elab.Types.ecPutClausesTbl", "Vuna/Compiler/Elab/Types.vuna:411"));
  ("v_Vuna_dCompiler_dElab_dTypes_decNext", ("Vuna.Compiler.Elab.Types.ecNext", "Vuna/Compiler/Elab/Types.vuna:415"));
  ("v_Vuna_dCompiler_dElab_dTypes_decSols", ("Vuna.Compiler.Elab.Types.ecSols", "Vuna/Compiler/Elab/Types.vuna:419"));
  ("v_Vuna_dCompiler_dElab_dTypes_decDefs", ("Vuna.Compiler.Elab.Types.ecDefs", "Vuna/Compiler/Elab/Types.vuna:424"));
  ("v_Vuna_dCompiler_dElab_dTypes_decDefTbl", ("Vuna.Compiler.Elab.Types.ecDefTbl", "Vuna/Compiler/Elab/Types.vuna:429"));
  ("v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl", ("Vuna.Compiler.Elab.Types.ecGlobalsTbl", "Vuna/Compiler/Elab/Types.vuna:435"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl", ("Vuna.Compiler.Elab.Types.ecPutGlobalsTbl", "Vuna/Compiler/Elab/Types.vuna:439"));
  ("v_Vuna_dCompiler_dElab_dTypes_decDatas", ("Vuna.Compiler.Elab.Types.ecDatas", "Vuna/Compiler/Elab/Types.vuna:444"));
  ("v_Vuna_dCompiler_dElab_dTypes_decDepthTbl", ("Vuna.Compiler.Elab.Types.ecDepthTbl", "Vuna/Compiler/Elab/Types.vuna:448"));
  ("v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete", ("Vuna.Compiler.Elab.Types.ecSetGlobalsComplete", "Vuna/Compiler/Elab/Types.vuna:455"));
  ("v_Vuna_dCompiler_dElab_dTypes_decGoals", ("Vuna.Compiler.Elab.Types.ecGoals", "Vuna/Compiler/Elab/Types.vuna:460"));
  ("v_Vuna_dCompiler_dElab_dTypes_decInsts", ("Vuna.Compiler.Elab.Types.ecInsts", "Vuna/Compiler/Elab/Types.vuna:464"));
  ("v_Vuna_dCompiler_dElab_dTypes_decInstsFamily", ("Vuna.Compiler.Elab.Types.ecInstsFamily", "Vuna/Compiler/Elab/Types.vuna:470"));
  ("v_Vuna_dCompiler_dElab_dTypes_decInstsAudit", ("Vuna.Compiler.Elab.Types.ecInstsAudit", "Vuna/Compiler/Elab/Types.vuna:480"));
  ("v_Vuna_dCompiler_dElab_dTypes_dbucketCount", ("Vuna.Compiler.Elab.Types.bucketCount", "Vuna/Compiler/Elab/Types.vuna:488"));
  ("v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch", ("Vuna.Compiler.Elab.Types.allBucketsMatch", "Vuna/Compiler/Elab/Types.vuna:493"));
  ("v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq", ("Vuna.Compiler.Elab.Types.instNamesEq", "Vuna/Compiler/Elab/Types.vuna:500"));
  ("v_Vuna_dCompiler_dElab_dTypes_decClasses", ("Vuna.Compiler.Elab.Types.ecClasses", "Vuna/Compiler/Elab/Types.vuna:506"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddGoal", ("Vuna.Compiler.Elab.Types.ecAddGoal", "Vuna/Compiler/Elab/Types.vuna:510"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddInst", ("Vuna.Compiler.Elab.Types.ecAddInst", "Vuna/Compiler/Elab/Types.vuna:515"));
  ("v_Vuna_dCompiler_dElab_dTypes_dhasInstName", ("Vuna.Compiler.Elab.Types.hasInstName", "Vuna/Compiler/Elab/Types.vuna:518"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw", ("Vuna.Compiler.Elab.Types.ecAddInstRaw", "Vuna/Compiler/Elab/Types.vuna:522"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddClass", ("Vuna.Compiler.Elab.Types.ecAddClass", "Vuna/Compiler/Elab/Types.vuna:527"));
  ("v_Vuna_dCompiler_dElab_dTypes_decConstraints", ("Vuna.Compiler.Elab.Types.ecConstraints", "Vuna/Compiler/Elab/Types.vuna:534"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutConstraints", ("Vuna.Compiler.Elab.Types.ecPutConstraints", "Vuna/Compiler/Elab/Types.vuna:539"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPending", ("Vuna.Compiler.Elab.Types.ecPending", "Vuna/Compiler/Elab/Types.vuna:545"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutPending", ("Vuna.Compiler.Elab.Types.ecPutPending", "Vuna/Compiler/Elab/Types.vuna:550"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddConstraint", ("Vuna.Compiler.Elab.Types.ecAddConstraint", "Vuna/Compiler/Elab/Types.vuna:555"));
  ("v_Vuna_dCompiler_dElab_dTypes_decTriedAt", ("Vuna.Compiler.Elab.Types.ecTriedAt", "Vuna/Compiler/Elab/Types.vuna:563"));
  ("v_Vuna_dCompiler_dElab_dTypes_decRecordTried", ("Vuna.Compiler.Elab.Types.ecRecordTried", "Vuna/Compiler/Elab/Types.vuna:568"));
  ("v_Vuna_dCompiler_dElab_dTypes_dassocIntLookup", ("Vuna.Compiler.Elab.Types.assocIntLookup", "Vuna/Compiler/Elab/Types.vuna:574"));
  ("v_Vuna_dCompiler_dElab_dTypes_dassocIntSet", ("Vuna.Compiler.Elab.Types.assocIntSet", "Vuna/Compiler/Elab/Types.vuna:579"));
  ("v_Vuna_dCompiler_dElab_dTypes_decEmpty", ("Vuna.Compiler.Elab.Types.ecEmpty", "Vuna/Compiler/Elab/Types.vuna:584"));
  ("v_Vuna_dCompiler_dElab_dTypes_decSolTbl", ("Vuna.Compiler.Elab.Types.ecSolTbl", "Vuna/Compiler/Elab/Types.vuna:592"));
  ("v_Vuna_dCompiler_dElab_dTypes_decSolsP", ("Vuna.Compiler.Elab.Types.ecSolsP", "Vuna/Compiler/Elab/Types.vuna:600"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutSols", ("Vuna.Compiler.Elab.Types.ecPutSols", "Vuna/Compiler/Elab/Types.vuna:602"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw", ("Vuna.Compiler.Elab.Types.ecPutSolsRaw", "Vuna/Compiler/Elab/Types.vuna:609"));
  ("v_Vuna_dCompiler_dElab_dTypes_dsolsDelta", ("Vuna.Compiler.Elab.Types.solsDelta", "Vuna/Compiler/Elab/Types.vuna:615"));
  ("v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId", ("Vuna.Compiler.Elab.Types.prefixUntilId", "Vuna/Compiler/Elab/Types.vuna:619"));
  ("v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn", ("Vuna.Compiler.Elab.Types.memDataNameIn", "Vuna/Compiler/Elab/Types.vuna:625"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddDef", ("Vuna.Compiler.Elab.Types.ecAddDef", "Vuna/Compiler/Elab/Types.vuna:632"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddData", ("Vuna.Compiler.Elab.Types.ecAddData", "Vuna/Compiler/Elab/Types.vuna:641"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas", ("Vuna.Compiler.Elab.Types.ctorTblOfDatas", "Vuna/Compiler/Elab/Types.vuna:648"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs", ("Vuna.Compiler.Elab.Types.dataCtorPairs", "Vuna/Compiler/Elab/Types.vuna:652"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl", ("Vuna.Compiler.Elab.Types.ecPutCtorTbl", "Vuna/Compiler/Elab/Types.vuna:655"));
  ("v_Vuna_dCompiler_dElab_dTypes_decDefVals", ("Vuna.Compiler.Elab.Types.ecDefVals", "Vuna/Compiler/Elab/Types.vuna:661"));
  ("v_Vuna_dCompiler_dElab_dTypes_decHasLinear", ("Vuna.Compiler.Elab.Types.ecHasLinear", "Vuna/Compiler/Elab/Types.vuna:665"));
  ("v_Vuna_dCompiler_dElab_dTypes_decMetaSpans", ("Vuna.Compiler.Elab.Types.ecMetaSpans", "Vuna/Compiler/Elab/Types.vuna:671"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutMetaSpans", ("Vuna.Compiler.Elab.Types.ecPutMetaSpans", "Vuna/Compiler/Elab/Types.vuna:676"));
  ("v_Vuna_dCompiler_dElab_dTypes_decUseSpans", ("Vuna.Compiler.Elab.Types.ecUseSpans", "Vuna/Compiler/Elab/Types.vuna:682"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutUseSpans", ("Vuna.Compiler.Elab.Types.ecPutUseSpans", "Vuna/Compiler/Elab/Types.vuna:687"));
  ("v_Vuna_dCompiler_dElab_dTypes_decWarnings", ("Vuna.Compiler.Elab.Types.ecWarnings", "Vuna/Compiler/Elab/Types.vuna:694"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutWarnings", ("Vuna.Compiler.Elab.Types.ecPutWarnings", "Vuna/Compiler/Elab/Types.vuna:699"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddWarning", ("Vuna.Compiler.Elab.Types.ecAddWarning", "Vuna/Compiler/Elab/Types.vuna:705"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear", ("Vuna.Compiler.Elab.Types.datasHaveLinear", "Vuna/Compiler/Elab/Types.vuna:708"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutDefVals", ("Vuna.Compiler.Elab.Types.ecPutDefVals", "Vuna/Compiler/Elab/Types.vuna:712"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxDepth", ("Vuna.Compiler.Elab.Types.ctxDepth", "Vuna/Compiler/Elab/Types.vuna:724"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxBind", ("Vuna.Compiler.Elab.Types.ctxBind", "Vuna/Compiler/Elab/Types.vuna:727"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxBindValue", ("Vuna.Compiler.Elab.Types.ctxBindValue", "Vuna/Compiler/Elab/Types.vuna:731"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxRefine", ("Vuna.Compiler.Elab.Types.ctxRefine", "Vuna/Compiler/Elab/Types.vuna:735"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt", ("Vuna.Compiler.Elab.Types.ctxLookupAt", "Vuna/Compiler/Elab/Types.vuna:738"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxLookup", ("Vuna.Compiler.Elab.Types.ctxLookup", "Vuna/Compiler/Elab/Types.vuna:743"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt", ("Vuna.Compiler.Elab.Types.ctxEnvAt", "Vuna/Compiler/Elab/Types.vuna:747"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxEnv", ("Vuna.Compiler.Elab.Types.ctxEnv", "Vuna/Compiler/Elab/Types.vuna:752"));
  ("v_Vuna_dCompiler_dElab_dTypes_drefineValue", ("Vuna.Compiler.Elab.Types.refineValue", "Vuna/Compiler/Elab/Types.vuna:757"));
  ("v_Vuna_dCompiler_dElab_dTypes_drefineLookup", ("Vuna.Compiler.Elab.Types.refineLookup", "Vuna/Compiler/Elab/Types.vuna:777"));
  ("v_Vuna_dCompiler_dElab_dTypes_devalCtx", ("Vuna.Compiler.Elab.Types.evalCtx", "Vuna/Compiler/Elab/Types.vuna:782"));
  ("v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue", ("Vuna.Compiler.Elab.Types.varTypeValue", "Vuna/Compiler/Elab/Types.vuna:787"));
  ("v_Vuna_dCompiler_dElab_dTypes_demptyCtx", ("Vuna.Compiler.Elab.Types.emptyCtx", "Vuna/Compiler/Elab/Types.vuna:791"));
  ("v_Vuna_dCompiler_dElab_dTypes_derrAt", ("Vuna.Compiler.Elab.Types.errAt", "Vuna/Compiler/Elab/Types.vuna:797"));
  ("v_Vuna_dCompiler_dElab_dTypes_dnewMeta", ("Vuna.Compiler.Elab.Types.newMeta", "Vuna/Compiler/Elab/Types.vuna:801"));
  ("v_Vuna_dCompiler_dElab_dTypes_dforceVal", ("Vuna.Compiler.Elab.Types.forceVal", "Vuna/Compiler/Elab/Types.vuna:806"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas", ("Vuna.Compiler.Elab.Types.dtProgDatas", "Vuna/Compiler/Elab/Types.vuna:827"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs", ("Vuna.Compiler.Elab.Types.dtProgDefs", "Vuna/Compiler/Elab/Types.vuna:831"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals", ("Vuna.Compiler.Elab.Types.dtProgGoals", "Vuna/Compiler/Elab/Types.vuna:836"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgSols", ("Vuna.Compiler.Elab.Types.dtProgSols", "Vuna/Compiler/Elab/Types.vuna:840"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals", ("Vuna.Compiler.Elab.Types.dtProgGlobals", "Vuna/Compiler/Elab/Types.vuna:844"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts", ("Vuna.Compiler.Elab.Types.dtProgInsts", "Vuna/Compiler/Elab/Types.vuna:848"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses", ("Vuna.Compiler.Elab.Types.dtProgClasses", "Vuna/Compiler/Elab/Types.vuna:852"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings", ("Vuna.Compiler.Elab.Types.dtProgWarnings", "Vuna/Compiler/Elab/Types.vuna:857"));
  ("v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl", ("Vuna.Compiler.Elab.Types.solsToTbl", "Vuna/Compiler/Elab/Types.vuna:862"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutDefTbl", ("Vuna.Compiler.Elab.Types.ecPutDefTbl", "Vuna/Compiler/Elab/Types.vuna:865"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dintTy", ("Vuna.Compiler.Elab.Prelude.intTy", "Vuna/Compiler/Elab/Prelude.vuna:34"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dstrTy", ("Vuna.Compiler.Elab.Prelude.strTy", "Vuna/Compiler/Elab/Prelude.vuna:37"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dfloatTy", ("Vuna.Compiler.Elab.Prelude.floatTy", "Vuna/Compiler/Elab/Prelude.vuna:41"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dboolTy", ("Vuna.Compiler.Elab.Prelude.boolTy", "Vuna/Compiler/Elab/Prelude.vuna:44"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dfun2", ("Vuna.Compiler.Elab.Prelude.fun2", "Vuna/Compiler/Elab/Prelude.vuna:48"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName", ("Vuna.Compiler.Elab.Prelude.builtinTyName", "Vuna/Compiler/Elab/Prelude.vuna:57"));
  ("v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName", ("Vuna.Compiler.Elab.Prelude.eqRuntimeName", "Vuna/Compiler/Elab/Prelude.vuna:67"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dindexOfNameGo", ("Vuna.Compiler.Elab.Prelude.indexOfNameGo", "Vuna/Compiler/Elab/Prelude.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dindexOfName", ("Vuna.Compiler.Elab.Prelude.indexOfName", "Vuna/Compiler/Elab/Prelude.vuna:82"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dityToTerm", ("Vuna.Compiler.Elab.Prelude.ityToTerm", "Vuna/Compiler/Elab/Prelude.vuna:85"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv", ("Vuna.Compiler.Elab.Prelude.ityToTermEnv", "Vuna/Compiler/Elab/Prelude.vuna:88"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dtypeCtorKindTerm", ("Vuna.Compiler.Elab.Prelude.typeCtorKindTerm", "Vuna/Compiler/Elab/Prelude.vuna:115"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dpreludeTypeGlobals", ("Vuna.Compiler.Elab.Prelude.preludeTypeGlobals", "Vuna/Compiler/Elab/Prelude.vuna:121"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dpreludeValueGlobals", ("Vuna.Compiler.Elab.Prelude.preludeValueGlobals", "Vuna/Compiler/Elab/Prelude.vuna:126"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dinternalValueGlobals", ("Vuna.Compiler.Elab.Prelude.internalValueGlobals", "Vuna/Compiler/Elab/Prelude.vuna:132"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals", ("Vuna.Compiler.Elab.Prelude.preludeGlobals", "Vuna/Compiler/Elab/Prelude.vuna:136"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames", ("Vuna.Compiler.Elab.Prelude.preludeNames", "Vuna/Compiler/Elab/Prelude.vuna:141"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName", ("Vuna.Compiler.Elab.Prelude.builtinEqTyName", "Vuna/Compiler/Elab/Prelude.vuna:145"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName", ("Vuna.Compiler.Elab.Prelude.cmpBuiltinTyName", "Vuna/Compiler/Elab/Prelude.vuna:155"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dprependParams", ("Vuna.Compiler.Elab.Prelude.prependParams", "Vuna/Compiler/Elab/Prelude.vuna:166"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf", ("Vuna.Compiler.Elab.Prelude.baseNameOf", "Vuna/Compiler/Elab/Prelude.vuna:174"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection", ("Vuna.Compiler.Elab.Prelude.classMethodProjection", "Vuna/Compiler/Elab/Prelude.vuna:179"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo", ("Vuna.Compiler.Elab.Prelude.classMethodProjectionGo", "Vuna/Compiler/Elab/Prelude.vuna:182"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName", ("Vuna.Compiler.Elab.Representation.unboxedCandName", "Vuna/Compiler/Elab/Representation.vuna:37"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandCtor", ("Vuna.Compiler.Elab.Representation.unboxedCandCtor", "Vuna/Compiler/Elab/Representation.vuna:41"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandIndex", ("Vuna.Compiler.Elab.Representation.unboxedCandIndex", "Vuna/Compiler/Elab/Representation.vuna:45"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags", ("Vuna.Compiler.Elab.Representation.ctorKeepFlags", "Vuna/Compiler/Elab/Representation.vuna:50"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndices", ("Vuna.Compiler.Elab.Representation.keptIndices", "Vuna/Compiler/Elab/Representation.vuna:54"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndicesGo", ("Vuna.Compiler.Elab.Representation.keptIndicesGo", "Vuna/Compiler/Elab/Representation.vuna:58"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_disSpecialUnboxFamily", ("Vuna.Compiler.Elab.Representation.isSpecialUnboxFamily", "Vuna/Compiler/Elab/Representation.vuna:64"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData", ("Vuna.Compiler.Elab.Representation.findDtData", "Vuna/Compiler/Elab/Representation.vuna:70"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dknownTypeHead", ("Vuna.Compiler.Elab.Representation.knownTypeHead", "Vuna/Compiler/Elab/Representation.vuna:75"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dtermRepresentable", ("Vuna.Compiler.Elab.Representation.termRepresentable", "Vuna/Compiler/Elab/Representation.vuna:83"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dtermAppHeadRepresentable", ("Vuna.Compiler.Elab.Representation.termAppHeadRepresentable", "Vuna/Compiler/Elab/Representation.vuna:94"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTerm", ("Vuna.Compiler.Elab.Representation.ctorFieldDomainTerm", "Vuna/Compiler/Elab/Representation.vuna:101"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTermGo", ("Vuna.Compiler.Elab.Representation.ctorFieldDomainTermGo", "Vuna/Compiler/Elab/Representation.vuna:105"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dtermIsFunction", ("Vuna.Compiler.Elab.Representation.termIsFunction", "Vuna/Compiler/Elab/Representation.vuna:114"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dreprIsOpaque", ("Vuna.Compiler.Elab.Representation.reprIsOpaque", "Vuna/Compiler/Elab/Representation.vuna:124"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandidateOfData", ("Vuna.Compiler.Elab.Representation.unboxedCandidateOfData", "Vuna/Compiler/Elab/Representation.vuna:132"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandidates", ("Vuna.Compiler.Elab.Representation.unboxedCandidates", "Vuna/Compiler/Elab/Representation.vuna:152"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dcandidateNames", ("Vuna.Compiler.Elab.Representation.candidateNames", "Vuna/Compiler/Elab/Representation.vuna:156"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dcandidateEdges", ("Vuna.Compiler.Elab.Representation.candidateEdges", "Vuna/Compiler/Elab/Representation.vuna:160"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dcandidateRefs", ("Vuna.Compiler.Elab.Representation.candidateRefs", "Vuna/Compiler/Elab/Representation.vuna:165"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dlookupNeighbors", ("Vuna.Compiler.Elab.Representation.lookupNeighbors", "Vuna/Compiler/Elab/Representation.vuna:171"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dreachesBackTo", ("Vuna.Compiler.Elab.Representation.reachesBackTo", "Vuna/Compiler/Elab/Representation.vuna:177"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_danyReachBack", ("Vuna.Compiler.Elab.Representation.anyReachBack", "Vuna/Compiler/Elab/Representation.vuna:183"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf", ("Vuna.Compiler.Elab.Representation.unboxedInfoOf", "Vuna/Compiler/Elab/Representation.vuna:193"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet", ("Vuna.Compiler.Elab.Representation.unboxedFamilySet", "Vuna/Compiler/Elab/Representation.vuna:204"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo", ("Vuna.Compiler.Elab.Representation.lookupUnboxedInfo", "Vuna/Compiler/Elab/Representation.vuna:208"));
  ("v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf", ("Vuna.Compiler.Elab.Sig.classParamKindOf", "Vuna/Compiler/Elab/Sig.vuna:32"));
  ("v_Vuna_dCompiler_dElab_dSig_dclassParamKind", ("Vuna.Compiler.Elab.Sig.classParamKind", "Vuna/Compiler/Elab/Sig.vuna:35"));
  ("v_Vuna_dCompiler_dElab_dSig_darityFun", ("Vuna.Compiler.Elab.Sig.arityFun", "Vuna/Compiler/Elab/Sig.vuna:38"));
  ("v_Vuna_dCompiler_dElab_dSig_dmethodMaxAppArity", ("Vuna.Compiler.Elab.Sig.methodMaxAppArity", "Vuna/Compiler/Elab/Sig.vuna:41"));
  ("v_Vuna_dCompiler_dElab_dSig_dmaxIntList", ("Vuna.Compiler.Elab.Sig.maxIntList", "Vuna/Compiler/Elab/Sig.vuna:45"));
  ("v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity", ("Vuna.Compiler.Elab.Sig.exprMaxAppArity", "Vuna/Compiler/Elab/Sig.vuna:49"));
  ("v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf", ("Vuna.Compiler.Elab.Sig.methodArgRigsOf", "Vuna/Compiler/Elab/Sig.vuna:72"));
  ("v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo", ("Vuna.Compiler.Elab.Sig.methodArgRigsOfGo", "Vuna/Compiler/Elab/Sig.vuna:75"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig", ("Vuna.Compiler.Elab.Sig.quantifyTraitSig", "Vuna/Compiler/Elab/Sig.vuna:89"));
  ("v_Vuna_dCompiler_dElab_dSig_dfreeNames", ("Vuna.Compiler.Elab.Sig.freeNames", "Vuna/Compiler/Elab/Sig.vuna:92"));
  ("v_Vuna_dCompiler_dElab_dSig_dkeepOut", ("Vuna.Compiler.Elab.Sig.keepOut", "Vuna/Compiler/Elab/Sig.vuna:95"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantify", ("Vuna.Compiler.Elab.Sig.quantify", "Vuna/Compiler/Elab/Sig.vuna:99"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds", ("Vuna.Compiler.Elab.Sig.quantifyTopKinds", "Vuna/Compiler/Elab/Sig.vuna:107"));
  ("v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr", ("Vuna.Compiler.Elab.Sig.kindArrowExpr", "Vuna/Compiler/Elab/Sig.vuna:113"));
  ("v_Vuna_dCompiler_dElab_dSig_dpiBoundNames", ("Vuna.Compiler.Elab.Sig.piBoundNames", "Vuna/Compiler/Elab/Sig.vuna:118"));
  ("v_Vuna_dCompiler_dElab_dSig_dlowerVarNames", ("Vuna.Compiler.Elab.Sig.lowerVarNames", "Vuna/Compiler/Elab/Sig.vuna:122"));
  ("v_Vuna_dCompiler_dElab_dSig_dexprLowerVars", ("Vuna.Compiler.Elab.Sig.exprLowerVars", "Vuna/Compiler/Elab/Sig.vuna:125"));
  ("v_Vuna_dCompiler_dElab_dSig_disLowerIdent", ("Vuna.Compiler.Elab.Sig.isLowerIdent", "Vuna/Compiler/Elab/Sig.vuna:140"));
  ("v_Vuna_dCompiler_dElab_dSig_ddedupNames", ("Vuna.Compiler.Elab.Sig.dedupNames", "Vuna/Compiler/Elab/Sig.vuna:145"));
  ("v_Vuna_dCompiler_dElab_dSig_ddropPiBound", ("Vuna.Compiler.Elab.Sig.dropPiBound", "Vuna/Compiler/Elab/Sig.vuna:149"));
  ("v_Vuna_dCompiler_dElab_dSig_ddropName", ("Vuna.Compiler.Elab.Sig.dropName", "Vuna/Compiler/Elab/Sig.vuna:153"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantifyTopSig", ("Vuna.Compiler.Elab.Sig.quantifyTopSig", "Vuna/Compiler/Elab/Sig.vuna:159"));
  ("v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned", ("Vuna.Compiler.Elab.Sig.topQuantBanned", "Vuna/Compiler/Elab/Sig.vuna:164"));
  ("v_Vuna_dCompiler_dElab_dSig_dbannedForModule", ("Vuna.Compiler.Elab.Sig.bannedForModule", "Vuna/Compiler/Elab/Sig.vuna:170"));
  ("v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule", ("Vuna.Compiler.Elab.Sig.filterNamesInModule", "Vuna/Compiler/Elab/Sig.vuna:173"));
  ("v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf", ("Vuna.Compiler.Elab.Sig.modulePrefixOf", "Vuna/Compiler/Elab/Sig.vuna:180"));
  ("v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl", ("Vuna.Compiler.Elab.Sig.qualifiedBannedTbl", "Vuna/Compiler/Elab/Sig.vuna:195"));
  ("v_Vuna_dCompiler_dElab_dSig_dqualifiedKey", ("Vuna.Compiler.Elab.Sig.qualifiedKey", "Vuna/Compiler/Elab/Sig.vuna:200"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCached", ("Vuna.Compiler.Elab.Sig.quantifyTopSigCached", "Vuna/Compiler/Elab/Sig.vuna:204"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCached", ("Vuna.Compiler.Elab.Sig.quantifyTopSigCtxCached", "Vuna/Compiler/Elab/Sig.vuna:212"));
  ("v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified", ("Vuna.Compiler.Elab.Sig.keepOutQualified", "Vuna/Compiler/Elab/Sig.vuna:224"));
  ("v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl", ("Vuna.Compiler.Elab.Sig.keepOutTbl", "Vuna/Compiler/Elab/Sig.vuna:231"));
  ("v_Vuna_dCompiler_dElab_dSig_dtopPreludeNames", ("Vuna.Compiler.Elab.Sig.topPreludeNames", "Vuna/Compiler/Elab/Sig.vuna:236"));
  ("v_Vuna_dCompiler_dElab_dSig_ddefinedNames", ("Vuna.Compiler.Elab.Sig.definedNames", "Vuna/Compiler/Elab/Sig.vuna:240"));
  ("v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi", ("Vuna.Compiler.Elab.Meta.hasNoExplicitPi", "Vuna/Compiler/Elab/Meta.vuna:125"));
  ("v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel", ("Vuna.Compiler.Elab.Meta.hasNoExplicitPiFuel", "Vuna/Compiler/Elab/Meta.vuna:128"));
  ("v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor", ("Vuna.Compiler.Elab.Meta.instantiateNullaryCtor", "Vuna/Compiler/Elab/Meta.vuna:139"));
  ("v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel", ("Vuna.Compiler.Elab.Meta.instantiateNullaryCtorFuel", "Vuna/Compiler/Elab/Meta.vuna:142"));
  ("v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm", ("Vuna.Compiler.Elab.Meta.nullaryCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:154"));
  ("v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs", ("Vuna.Compiler.Elab.Meta.zipTeleRigs", "Vuna/Compiler/Elab/Meta.vuna:159"));
  ("v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue", ("Vuna.Compiler.Elab.Meta.boolCtorValue", "Vuna/Compiler/Elab/Meta.vuna:166"));
  ("v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm", ("Vuna.Compiler.Elab.Meta.boolCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:170"));
  ("v_Vuna_dCompiler_dElab_dMeta_disBoolFamilyName", ("Vuna.Compiler.Elab.Meta.isBoolFamilyName", "Vuna/Compiler/Elab/Meta.vuna:176"));
  ("v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef", ("Vuna.Compiler.Elab.Meta.inferCtorRef", "Vuna/Compiler/Elab/Meta.vuna:181"));
  ("v_Vuna_dCompiler_dElab_dMeta_dconvEc", ("Vuna.Compiler.Elab.Meta.convEc", "Vuna/Compiler/Elab/Meta.vuna:197"));
  ("v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom", ("Vuna.Compiler.Elab.Meta.unsolvedFrom", "Vuna/Compiler/Elab/Meta.vuna:203"));
  ("v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo", ("Vuna.Compiler.Elab.Meta.unsolvedFromGo", "Vuna/Compiler/Elab/Meta.vuna:206"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmemMetaId", ("Vuna.Compiler.Elab.Meta.memMetaId", "Vuna/Compiler/Elab/Meta.vuna:215"));
  ("v_Vuna_dCompiler_dElab_dMeta_drelevantMetas", ("Vuna.Compiler.Elab.Meta.relevantMetas", "Vuna/Compiler/Elab/Meta.vuna:219"));
  ("v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime", ("Vuna.Compiler.Elab.Meta.termMetasRuntime", "Vuna/Compiler/Elab/Meta.vuna:225"));
  ("v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll", ("Vuna.Compiler.Elab.Meta.termMetasAll", "Vuna/Compiler/Elab/Meta.vuna:253"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmaxInt", ("Vuna.Compiler.Elab.Meta.maxInt", "Vuna/Compiler/Elab/Meta.vuna:274"));
  ("v_Vuna_dCompiler_dElab_dMeta_dglobalLookup", ("Vuna.Compiler.Elab.Meta.globalLookup", "Vuna/Compiler/Elab/Meta.vuna:277"));
  ("v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup", ("Vuna.Compiler.Elab.Meta.globalsLookup", "Vuna/Compiler/Elab/Meta.vuna:284"));
  ("v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf", ("Vuna.Compiler.Elab.Meta.globalsTableOf", "Vuna/Compiler/Elab/Meta.vuna:295"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmemSig", ("Vuna.Compiler.Elab.Meta.memSig", "Vuna/Compiler/Elab/Meta.vuna:299"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmemDefName", ("Vuna.Compiler.Elab.Meta.memDefName", "Vuna/Compiler/Elab/Meta.vuna:303"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcollectSigs", ("Vuna.Compiler.Elab.Meta.collectSigs", "Vuna/Compiler/Elab/Meta.vuna:307"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto", ("Vuna.Compiler.Elab.Meta.collectSigsInto", "Vuna/Compiler/Elab/Meta.vuna:321"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne", ("Vuna.Compiler.Elab.Meta.collectSigOne", "Vuna/Compiler/Elab/Meta.vuna:336"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls", ("Vuna.Compiler.Elab.Meta.collectDataDecls", "Vuna/Compiler/Elab/Meta.vuna:346"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf", ("Vuna.Compiler.Elab.Meta.dataNamesOf", "Vuna/Compiler/Elab/Meta.vuna:357"));
  ("v_Vuna_dCompiler_dElab_dMeta_dnonEmpty", ("Vuna.Compiler.Elab.Meta.nonEmpty", "Vuna/Compiler/Elab/Meta.vuna:364"));
  ("v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed", ("Vuna.Compiler.Elab.Meta.kindWellFormed", "Vuna/Compiler/Elab/Meta.vuna:375"));
  ("v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed", ("Vuna.Compiler.Elab.Meta.kindDomainWellFormed", "Vuna/Compiler/Elab/Meta.vuna:382"));
  ("v_Vuna_dCompiler_dElab_dMeta_dsplitKind", ("Vuna.Compiler.Elab.Meta.splitKind", "Vuna/Compiler/Elab/Meta.vuna:388"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup", ("Vuna.Compiler.Elab.Meta.dtDataLookup", "Vuna/Compiler/Elab/Meta.vuna:392"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn", ("Vuna.Compiler.Elab.Meta.findCtorIn", "Vuna/Compiler/Elab/Meta.vuna:396"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup", ("Vuna.Compiler.Elab.Meta.dtCtorLookup", "Vuna/Compiler/Elab/Meta.vuna:400"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc", ("Vuna.Compiler.Elab.Meta.dtCtorLookupEc", "Vuna/Compiler/Elab/Meta.vuna:409"));
  ("v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName", ("Vuna.Compiler.Elab.Meta.isDataFamilyName", "Vuna/Compiler/Elab/Meta.vuna:426"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal", ("Vuna.Compiler.Elab.Meta.isTypeLevelGlobal", "Vuna/Compiler/Elab/Meta.vuna:432"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeName", ("Vuna.Compiler.Elab.Meta.isTypeName", "Vuna/Compiler/Elab/Meta.vuna:437"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf", ("Vuna.Compiler.Elab.Meta.dataShortNameOf", "Vuna/Compiler/Elab/Meta.vuna:444"));
  ("v_Vuna_dCompiler_dElab_dMeta_dtypeNameOfDualCtor", ("Vuna.Compiler.Elab.Meta.typeNameOfDualCtor", "Vuna/Compiler/Elab/Meta.vuna:448"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf", ("Vuna.Compiler.Elab.Meta.ctorFamilyNameOf", "Vuna/Compiler/Elab/Meta.vuna:460"));
  ("v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf", ("Vuna.Compiler.Elab.Meta.expectedFamilyOf", "Vuna/Compiler/Elab/Meta.vuna:466"));
  ("v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel", ("Vuna.Compiler.Elab.Meta.expectedFamilyOfFuel", "Vuna/Compiler/Elab/Meta.vuna:470"));
  ("v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText", ("Vuna.Compiler.Elab.Meta.overCandidatesText", "Vuna/Compiler/Elab/Meta.vuna:479"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf", ("Vuna.Compiler.Elab.Meta.dualFamilyOf", "Vuna/Compiler/Elab/Meta.vuna:483"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorFamilyIs", ("Vuna.Compiler.Elab.Meta.ctorFamilyIs", "Vuna/Compiler/Elab/Meta.vuna:492"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcandidatesInFamily", ("Vuna.Compiler.Elab.Meta.candidatesInFamily", "Vuna/Compiler/Elab/Meta.vuna:498"));
  ("v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor", ("Vuna.Compiler.Elab.Meta.resolveOverCtor", "Vuna/Compiler/Elab/Meta.vuna:503"));
  ("v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo", ("Vuna.Compiler.Elab.Meta.resolveOverCtorGo", "Vuna/Compiler/Elab/Meta.vuna:511"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver", ("Vuna.Compiler.Elab.Meta.defaultOrOver", "Vuna/Compiler/Elab/Meta.vuna:522"));
  ("v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup", ("Vuna.Compiler.Elab.Meta.typeHeadLookup", "Vuna/Compiler/Elab/Meta.vuna:531"));
  ("v_Vuna_dCompiler_dElab_dMeta_dtypeLookup", ("Vuna.Compiler.Elab.Meta.typeLookup", "Vuna/Compiler/Elab/Meta.vuna:537"));
  ("v_Vuna_dCompiler_dElab_dMeta_dvalueLookup", ("Vuna.Compiler.Elab.Meta.valueLookup", "Vuna/Compiler/Elab/Meta.vuna:547"));
  ("v_Vuna_dCompiler_dElab_dMeta_dteleOfType", ("Vuna.Compiler.Elab.Meta.teleOfType", "Vuna/Compiler/Elab/Meta.vuna:556"));
  ("v_Vuna_dCompiler_dElab_dMeta_dteleOf", ("Vuna.Compiler.Elab.Meta.teleOf", "Vuna/Compiler/Elab/Meta.vuna:559"));
  ("v_Vuna_dCompiler_dElab_dMeta_dspineOfType", ("Vuna.Compiler.Elab.Meta.spineOfType", "Vuna/Compiler/Elab/Meta.vuna:567"));
  ("v_Vuna_dCompiler_dElab_dMeta_dresultSpine", ("Vuna.Compiler.Elab.Meta.resultSpine", "Vuna/Compiler/Elab/Meta.vuna:574"));
  ("v_Vuna_dCompiler_dElab_dMeta_dzonkTerm", ("Vuna.Compiler.Elab.Meta.zonkTerm", "Vuna/Compiler/Elab/Meta.vuna:591"));
  ("v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel", ("Vuna.Compiler.Elab.Meta.zonkTermFuel", "Vuna/Compiler/Elab/Meta.vuna:594"));
  ("v_Vuna_dCompiler_dElab_dMeta_dzonkAlt", ("Vuna.Compiler.Elab.Meta.zonkAlt", "Vuna/Compiler/Elab/Meta.vuna:619"));
  ("v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel", ("Vuna.Compiler.Elab.Meta.zonkAltFuel", "Vuna/Compiler/Elab/Meta.vuna:622"));
  ("v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar", ("Vuna.Compiler.Elab.Meta.hasOutOfScopeVar", "Vuna/Compiler/Elab/Meta.vuna:628"));
  ("v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs", ("Vuna.Compiler.Elab.Meta.hasOutOfScopeVarArgs", "Vuna/Compiler/Elab/Meta.vuna:639"));
  ("v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts", ("Vuna.Compiler.Elab.Meta.hasOutOfScopeVarAlts", "Vuna/Compiler/Elab/Meta.vuna:643"));
  ("v_Vuna_dCompiler_dElab_dMeta_dprependFamParams", ("Vuna.Compiler.Elab.Meta.prependFamParams", "Vuna/Compiler/Elab/Meta.vuna:652"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddropParams", ("Vuna.Compiler.Elab.Meta.dropParams", "Vuna/Compiler/Elab/Meta.vuna:659"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorGlobals", ("Vuna.Compiler.Elab.Meta.ctorGlobals", "Vuna/Compiler/Elab/Meta.vuna:663"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead", ("Vuna.Compiler.Elab.Meta.lookupDataHead", "Vuna/Compiler/Elab/Meta.vuna:673"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddictTypeName", ("Vuna.Compiler.Elab.Meta.dictTypeName", "Vuna/Compiler/Elab/Meta.vuna:687"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddictCtorName", ("Vuna.Compiler.Elab.Meta.dictCtorName", "Vuna/Compiler/Elab/Meta.vuna:690"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls", ("Vuna.Compiler.Elab.Meta.collectTraitDecls", "Vuna/Compiler/Elab/Meta.vuna:694"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls", ("Vuna.Compiler.Elab.Meta.collectInstDecls", "Vuna/Compiler/Elab/Meta.vuna:700"));
  ("v_Vuna_dCompiler_dElab_dMeta_dparamNameOf", ("Vuna.Compiler.Elab.Meta.paramNameOf", "Vuna/Compiler/Elab/Meta.vuna:707"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms", ("Vuna.Compiler.Elab.Meta.methodArgTerms", "Vuna/Compiler/Elab/Meta.vuna:712"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo", ("Vuna.Compiler.Elab.Meta.methodArgTermsGo", "Vuna/Compiler/Elab/Meta.vuna:715"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams", ("Vuna.Compiler.Elab.Meta.methodArgLams", "Vuna/Compiler/Elab/Meta.vuna:722"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfieldVarName", ("Vuna.Compiler.Elab.Meta.fieldVarName", "Vuna/Compiler/Elab/Meta.vuna:729"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames", ("Vuna.Compiler.Elab.Meta.fieldBinderNames", "Vuna/Compiler/Elab/Meta.vuna:732"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo", ("Vuna.Compiler.Elab.Meta.fieldBinderGo", "Vuna/Compiler/Elab/Meta.vuna:735"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo", ("Vuna.Compiler.Elab.Meta.fieldBinderGoGo", "Vuna/Compiler/Elab/Meta.vuna:738"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName", ("Vuna.Compiler.Elab.Meta.findClassByShortName", "Vuna/Compiler/Elab/Meta.vuna:745"));
  ("v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead", ("Vuna.Compiler.Elab.Meta.isBlanketInstHead", "Vuna/Compiler/Elab/Meta.vuna:757"));
  ("v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs", ("Vuna.Compiler.Elab.Meta.allTeleArgs", "Vuna/Compiler/Elab/Meta.vuna:763"));
  ("v_Vuna_dCompiler_dElab_dMeta_disBlanketInst", ("Vuna.Compiler.Elab.Meta.isBlanketInst", "Vuna/Compiler/Elab/Meta.vuna:769"));
  ("v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam", ("Vuna.Compiler.Elab.Meta.substClassParam", "Vuna/Compiler/Elab/Meta.vuna:775"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark", ("Vuna.Compiler.Elab.Meta.linClosureMark", "Vuna/Compiler/Elab/Meta.vuna:788"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlinClosureName", ("Vuna.Compiler.Elab.Meta.linClosureName", "Vuna/Compiler/Elab/Meta.vuna:791"));
  ("v_Vuna_dCompiler_dElab_dMeta_disLinClosureName", ("Vuna.Compiler.Elab.Meta.isLinClosureName", "Vuna/Compiler/Elab/Meta.vuna:795"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName", ("Vuna.Compiler.Elab.Meta.linClosureOrigName", "Vuna/Compiler/Elab/Meta.vuna:798"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo", ("Vuna.Compiler.Elab.Meta.linClosureOrigGo", "Vuna/Compiler/Elab/Meta.vuna:801"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlitEqName", ("Vuna.Compiler.Elab.Meta.litEqName", "Vuna/Compiler/Elab/Meta.vuna:806"));
  ("v_Vuna_dCompiler_dElab_dMeta_disIndexDomain", ("Vuna.Compiler.Elab.Meta.isIndexDomain", "Vuna/Compiler/Elab/Meta.vuna:812"));
  ("v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain", ("Vuna.Compiler.Elab.Meta.isImplicitDomain", "Vuna/Compiler/Elab/Meta.vuna:827"));
  ("v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain", ("Vuna.Compiler.Elab.Meta.neutralBinderIndexDomain", "Vuna/Compiler/Elab/Meta.vuna:841"));
  ("v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType", ("Vuna.Compiler.Elab.Meta.neutralBinderType", "Vuna/Compiler/Elab/Meta.vuna:847"));
  ("v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx", ("Vuna.Compiler.Elab.Meta.isKindWithCtx", "Vuna/Compiler/Elab/Meta.vuna:860"));
  ("v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel", ("Vuna.Compiler.Elab.Meta.isKindWithCtxFuel", "Vuna/Compiler/Elab/Meta.vuna:863"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx", ("Vuna.Compiler.Elab.Meta.isTypeLikeWithCtx", "Vuna/Compiler/Elab/Meta.vuna:875"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctxItemAt", ("Vuna.Compiler.Elab.Meta.ctxItemAt", "Vuna/Compiler/Elab/Meta.vuna:890"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeDomain", ("Vuna.Compiler.Elab.Meta.isTypeDomain", "Vuna/Compiler/Elab/Meta.vuna:909"));
  ("v_Vuna_dCompiler_dElab_dMeta_dbinderRig", ("Vuna.Compiler.Elab.Meta.binderRig", "Vuna/Compiler/Elab/Meta.vuna:912"));
  ("v_Vuna_dCompiler_dElab_dMeta_drigOfQty", ("Vuna.Compiler.Elab.Meta.rigOfQty", "Vuna/Compiler/Elab/Meta.vuna:916"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeHeadOpaqueEc", ("Vuna.Compiler.Elab.Meta.isTypeHeadOpaqueEc", "Vuna/Compiler/Elab/Meta.vuna:936"));
  ("v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue", ("Vuna.Compiler.Elab.Meta.isFamilyKindValue", "Vuna/Compiler/Elab/Meta.vuna:940"));
  ("v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel", ("Vuna.Compiler.Elab.Meta.isFamilyKindFuel", "Vuna/Compiler/Elab/Meta.vuna:943"));
  ("v_Vuna_dCompiler_dElab_dMeta_disUniverseValue", ("Vuna.Compiler.Elab.Meta.isUniverseValue", "Vuna/Compiler/Elab/Meta.vuna:951"));
  ("v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped", ("Vuna.Compiler.Elab.Meta.valueOpaqueScoped", "Vuna/Compiler/Elab/Meta.vuna:959"));
  ("v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo", ("Vuna.Compiler.Elab.Meta.valueOpaqueGo", "Vuna/Compiler/Elab/Meta.vuna:963"));
  ("v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine", ("Vuna.Compiler.Elab.Meta.valueOpaqueTypeSpine", "Vuna/Compiler/Elab/Meta.vuna:984"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeishValue", ("Vuna.Compiler.Elab.Meta.isTypeishValue", "Vuna/Compiler/Elab/Meta.vuna:994"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmemLevel", ("Vuna.Compiler.Elab.Meta.memLevel", "Vuna/Compiler/Elab/Meta.vuna:1001"));
  ("v_Vuna_dCompiler_dElab_dMeta_dnvarOpaqueCtx", ("Vuna.Compiler.Elab.Meta.nvarOpaqueCtx", "Vuna/Compiler/Elab/Meta.vuna:1006"));
  ("v_Vuna_dCompiler_dElab_dMeta_dzonkValueOnly", ("Vuna.Compiler.Elab.Meta.zonkValueOnly", "Vuna/Compiler/Elab/Meta.vuna:1017"));
  ("v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn", ("Vuna.Compiler.Elab.Meta.isOpaqueRuntimeTyIn", "Vuna/Compiler/Elab/Meta.vuna:1020"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcastErased", ("Vuna.Compiler.Elab.Meta.castErased", "Vuna/Compiler/Elab/Meta.vuna:1025"));
  ("v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses", ("Vuna.Compiler.Elab.Meta.wrapOpaqueUses", "Vuna/Compiler/Elab/Meta.vuna:1031"));
  ("v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel", ("Vuna.Compiler.Elab.Meta.wrapOpaqueUsesFuel", "Vuna/Compiler/Elab/Meta.vuna:1034"));
  ("v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueVar", ("Vuna.Compiler.Elab.Meta.wrapOpaqueVar", "Vuna/Compiler/Elab/Meta.vuna:1072"));
  ("v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueAltFuel", ("Vuna.Compiler.Elab.Meta.wrapOpaqueAltFuel", "Vuna/Compiler/Elab/Meta.vuna:1078"));
  ("v_Vuna_dCompiler_dElab_dMeta_disLinearType", ("Vuna.Compiler.Elab.Meta.isLinearType", "Vuna/Compiler/Elab/Meta.vuna:1083"));
  ("v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel", ("Vuna.Compiler.Elab.Meta.isLinearTypeFuel", "Vuna/Compiler/Elab/Meta.vuna:1086"));
  ("v_Vuna_dCompiler_dElab_dMeta_danyLinearVals", ("Vuna.Compiler.Elab.Meta.anyLinearVals", "Vuna/Compiler/Elab/Meta.vuna:1095"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddataLinearName", ("Vuna.Compiler.Elab.Meta.dataLinearName", "Vuna/Compiler/Elab/Meta.vuna:1099"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorLinearName", ("Vuna.Compiler.Elab.Meta.ctorLinearName", "Vuna/Compiler/Elab/Meta.vuna:1104"));
  ("v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain", ("Vuna.Compiler.Elab.Meta.rigForLinearDomain", "Vuna/Compiler/Elab/Meta.vuna:1110"));
  ("v_Vuna_dCompiler_dElab_dMeta_drigCaseField", ("Vuna.Compiler.Elab.Meta.rigCaseField", "Vuna/Compiler/Elab/Meta.vuna:1117"));
  ("v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue", ("Vuna.Compiler.Elab.Meta.rigOfLinearValue", "Vuna/Compiler/Elab/Meta.vuna:1121"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear", ("Vuna.Compiler.Elab.Meta.ctxHasLinear", "Vuna/Compiler/Elab/Meta.vuna:1125"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems", ("Vuna.Compiler.Elab.Meta.ctxHasLinearItems", "Vuna/Compiler/Elab/Meta.vuna:1128"));
  ("v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear", ("Vuna.Compiler.Elab.Meta.termHasOuterLinear", "Vuna/Compiler/Elab/Meta.vuna:1135"));
  ("v_Vuna_dCompiler_dElab_dMeta_douterScan", ("Vuna.Compiler.Elab.Meta.outerScan", "Vuna/Compiler/Elab/Meta.vuna:1138"));
  ("v_Vuna_dCompiler_dElab_dMeta_douterScanArgs", ("Vuna.Compiler.Elab.Meta.outerScanArgs", "Vuna/Compiler/Elab/Meta.vuna:1153"));
  ("v_Vuna_dCompiler_dElab_dMeta_douterScanAlts", ("Vuna.Compiler.Elab.Meta.outerScanAlts", "Vuna/Compiler/Elab/Meta.vuna:1158"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue", ("Vuna.Compiler.Elab.Meta.isTypeLayerValue", "Vuna/Compiler/Elab/Meta.vuna:1163"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel", ("Vuna.Compiler.Elab.Meta.isTypeLayerValueFuel", "Vuna/Compiler/Elab/Meta.vuna:1166"));
  ("v_Vuna_dCompiler_dElab_dMeta_disDataHead", ("Vuna.Compiler.Elab.Meta.isDataHead", "Vuna/Compiler/Elab/Meta.vuna:1175"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue", ("Vuna.Compiler.Elab.Meta.freshVarValue", "Vuna/Compiler/Elab/Meta.vuna:1183"));
  ("v_Vuna_dCompiler_dElab_dMeta_disBoolType", ("Vuna.Compiler.Elab.Meta.isBoolType", "Vuna/Compiler/Elab/Meta.vuna:1190"));
  ("v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName", ("Vuna.Compiler.Elab.Meta.neutralHeadName", "Vuna/Compiler/Elab/Meta.vuna:1194"));
  ("v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal", ("Vuna.Compiler.Elab.Meta.isBoolGlobal", "Vuna/Compiler/Elab/Meta.vuna:1198"));
  ("v_Vuna_dCompiler_dElab_dMeta_disSortVal", ("Vuna.Compiler.Elab.Meta.isSortVal", "Vuna/Compiler/Elab/Meta.vuna:1203"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm", ("Vuna.Compiler.Elab.Meta.ctorRefTerm", "Vuna/Compiler/Elab/Meta.vuna:1214"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm", ("Vuna.Compiler.Elab.Meta.ctorAppTerm", "Vuna/Compiler/Elab/Meta.vuna:1225"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmkCtorTerm", ("Vuna.Compiler.Elab.Meta.mkCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:1237"));
  ("v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm", ("Vuna.Compiler.Elab.Meta.etaCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:1251"));
  ("v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs", ("Vuna.Compiler.Elab.Meta.shiftCtorArgs", "Vuna/Compiler/Elab/Meta.vuna:1259"));
  ("v_Vuna_dCompiler_dElab_dMeta_detaCtorLa", ("Vuna.Compiler.Elab.Meta.etaCtorLa", "Vuna/Compiler/Elab/Meta.vuna:1268"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddropCount", ("Vuna.Compiler.Elab.Meta.dropCount", "Vuna/Compiler/Elab/Meta.vuna:1277"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms", ("Vuna.Compiler.Elab.Meta.foldAppTerms", "Vuna/Compiler/Elab/Meta.vuna:1283"));
  ("v_Vuna_dCompiler_dElab_dMeta_dhasFamParams", ("Vuna.Compiler.Elab.Meta.hasFamParams", "Vuna/Compiler/Elab/Meta.vuna:1294"));
  ("v_Vuna_dCompiler_dElab_dMeta_disSortExpr", ("Vuna.Compiler.Elab.Meta.isSortExpr", "Vuna/Compiler/Elab/Meta.vuna:1299"));
  ("v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf", ("Vuna.Compiler.Elab.Meta.baseNameOf", "Vuna/Compiler/Elab/Meta.vuna:1305"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable", ("Vuna.Compiler.Elab.Meta.ctorFamilyTable", "Vuna/Compiler/Elab/Meta.vuna:1311"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody", ("Vuna.Compiler.Elab.Meta.findCatchAllBody", "Vuna/Compiler/Elab/Meta.vuna:1315"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordFieldPairs", ("Vuna.Compiler.Elab.Records.recordFieldPairs", "Vuna/Compiler/Elab/Records.vuna:60"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordFieldNames", ("Vuna.Compiler.Elab.Records.recordFieldNames", "Vuna/Compiler/Elab/Records.vuna:65"));
  ("v_Vuna_dCompiler_dElab_dRecords_dlookupRecord", ("Vuna.Compiler.Elab.Records.lookupRecord", "Vuna/Compiler/Elab/Records.vuna:70"));
  ("v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf", ("Vuna.Compiler.Elab.Records.fieldNamesOf", "Vuna/Compiler/Elab/Records.vuna:74"));
  ("v_Vuna_dCompiler_dElab_dRecords_dlookupProvided", ("Vuna.Compiler.Elab.Records.lookupProvided", "Vuna/Compiler/Elab/Records.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames", ("Vuna.Compiler.Elab.Records.hasDuplicateFieldNames", "Vuna/Compiler/Elab/Records.vuna:82"));
  ("v_Vuna_dCompiler_dElab_dRecords_dmissingFieldMsg", ("Vuna.Compiler.Elab.Records.missingFieldMsg", "Vuna/Compiler/Elab/Records.vuna:88"));
  ("v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg", ("Vuna.Compiler.Elab.Records.unknownFieldMsg", "Vuna/Compiler/Elab/Records.vuna:91"));
  ("v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg", ("Vuna.Compiler.Elab.Records.duplicateFieldMsg", "Vuna/Compiler/Elab/Records.vuna:94"));
  ("v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields", ("Vuna.Compiler.Elab.Records.hasUnknownFields", "Vuna/Compiler/Elab/Records.vuna:97"));
  ("v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg", ("Vuna.Compiler.Elab.Records.firstUnknownFieldMsg", "Vuna/Compiler/Elab/Records.vuna:102"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls", ("Vuna.Compiler.Elab.Records.recordsOfDecls", "Vuna/Compiler/Elab/Records.vuna:108"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordFieldsOf", ("Vuna.Compiler.Elab.Records.recordFieldsOf", "Vuna/Compiler/Elab/Records.vuna:117"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordParamVarExprs", ("Vuna.Compiler.Elab.Records.recordParamVarExprs", "Vuna/Compiler/Elab/Records.vuna:124"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordRetType", ("Vuna.Compiler.Elab.Records.recordRetType", "Vuna/Compiler/Elab/Records.vuna:127"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordArrowType", ("Vuna.Compiler.Elab.Records.recordArrowType", "Vuna/Compiler/Elab/Records.vuna:134"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordArrowTypeGo", ("Vuna.Compiler.Elab.Records.recordArrowTypeGo", "Vuna/Compiler/Elab/Records.vuna:137"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordParamPis", ("Vuna.Compiler.Elab.Records.recordParamPis", "Vuna/Compiler/Elab/Records.vuna:144"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordCtorType", ("Vuna.Compiler.Elab.Records.recordCtorType", "Vuna/Compiler/Elab/Records.vuna:150"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarRecords", ("Vuna.Compiler.Elab.Records.desugarRecords", "Vuna/Compiler/Elab/Records.vuna:154"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl", ("Vuna.Compiler.Elab.Records.desugarRecordDecl", "Vuna/Compiler/Elab/Records.vuna:157"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarPattern", ("Vuna.Compiler.Elab.Records.desugarPattern", "Vuna/Compiler/Elab/Records.vuna:174"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel", ("Vuna.Compiler.Elab.Records.desugarPatternFuel", "Vuna/Compiler/Elab/Records.vuna:177"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel", ("Vuna.Compiler.Elab.Records.desugarRecordPatternFieldsFuel", "Vuna/Compiler/Elab/Records.vuna:199"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel", ("Vuna.Compiler.Elab.Records.desugarExprFuel", "Vuna/Compiler/Elab/Records.vuna:211"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel", ("Vuna.Compiler.Elab.Records.desugarDoStmtFuel", "Vuna/Compiler/Elab/Records.vuna:267"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel", ("Vuna.Compiler.Elab.Records.desugarRecordValuesFuel", "Vuna/Compiler/Elab/Records.vuna:276"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel", ("Vuna.Compiler.Elab.Records.desugarFieldValueFuel", "Vuna/Compiler/Elab/Records.vuna:286"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel", ("Vuna.Compiler.Elab.Records.desugarBindFuel", "Vuna/Compiler/Elab/Records.vuna:291"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarLocalClauseFuel", ("Vuna.Compiler.Elab.Records.desugarLocalClauseFuel", "Vuna/Compiler/Elab/Records.vuna:298"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel", ("Vuna.Compiler.Elab.Records.desugarAltFuel", "Vuna/Compiler/Elab/Records.vuna:305"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstances", ("Vuna.Compiler.Elab.Records.recordHasFieldInstances", "Vuna/Compiler/Elab/Records.vuna:313"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstancesOf", ("Vuna.Compiler.Elab.Records.recordHasFieldInstancesOf", "Vuna/Compiler/Elab/Records.vuna:319"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstancesGo", ("Vuna.Compiler.Elab.Records.recordHasFieldInstancesGo", "Vuna/Compiler/Elab/Records.vuna:325"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordInstanceVar", ("Vuna.Compiler.Elab.Records.recordInstanceVar", "Vuna/Compiler/Elab/Records.vuna:332"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordInstancePats", ("Vuna.Compiler.Elab.Records.recordInstancePats", "Vuna/Compiler/Elab/Records.vuna:336"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordInstancePatsFrom", ("Vuna.Compiler.Elab.Records.recordInstancePatsFrom", "Vuna/Compiler/Elab/Records.vuna:340"));
  ("v_Vuna_dCompiler_dElab_dRecords_dhasFieldInstanceDecl", ("Vuna.Compiler.Elab.Records.hasFieldInstanceDecl", "Vuna/Compiler/Elab/Records.vuna:346"));
  ("v_Vuna_dCompiler_dElab_dRecords_dprepareDecls", ("Vuna.Compiler.Elab.Records.prepareDecls", "Vuna/Compiler/Elab/Records.vuna:364"));
  ("v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith", ("Vuna.Compiler.Elab.Records.prepareDeclsWith", "Vuna/Compiler/Elab/Records.vuna:369"));
  ("v_Vuna_dCompiler_dElab_dRecords_dctorName", ("Vuna.Compiler.Elab.Records.ctorName", "Vuna/Compiler/Elab/Records.vuna:380"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarExpr", ("Vuna.Compiler.Elab.Records.desugarExpr", "Vuna/Compiler/Elab/Records.vuna:383"));
  ("v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAs", ("Vuna.Compiler.Elab.Records.expandCaseAs", "Vuna/Compiler/Elab/Records.vuna:388"));
  ("v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo", ("Vuna.Compiler.Elab.Records.expandCaseAsGo", "Vuna/Compiler/Elab/Records.vuna:391"));
  ("v_Vuna_dCompiler_dElab_dUsage_disTypeForming", ("Vuna.Compiler.Elab.Usage.isTypeForming", "Vuna/Compiler/Elab/Usage.vuna:34"));
  ("v_Vuna_dCompiler_dElab_dUsage_disTypeFormingFuel", ("Vuna.Compiler.Elab.Usage.isTypeFormingFuel", "Vuna/Compiler/Elab/Usage.vuna:37"));
  ("v_Vuna_dCompiler_dElab_dUsage_duZeroOf", ("Vuna.Compiler.Elab.Usage.uZeroOf", "Vuna/Compiler/Elab/Usage.vuna:49"));
  ("v_Vuna_dCompiler_dElab_dUsage_duVarAt", ("Vuna.Compiler.Elab.Usage.uVarAt", "Vuna/Compiler/Elab/Usage.vuna:52"));
  ("v_Vuna_dCompiler_dElab_dUsage_duVarAtGo", ("Vuna.Compiler.Elab.Usage.uVarAtGo", "Vuna/Compiler/Elab/Usage.vuna:55"));
  ("v_Vuna_dCompiler_dElab_dUsage_duAdd", ("Vuna.Compiler.Elab.Usage.uAdd", "Vuna/Compiler/Elab/Usage.vuna:59"));
  ("v_Vuna_dCompiler_dElab_dUsage_duScale", ("Vuna.Compiler.Elab.Usage.uScale", "Vuna/Compiler/Elab/Usage.vuna:64"));
  ("v_Vuna_dCompiler_dElab_dUsage_duJoin", ("Vuna.Compiler.Elab.Usage.uJoin", "Vuna/Compiler/Elab/Usage.vuna:67"));
  ("v_Vuna_dCompiler_dElab_dUsage_duDrop", ("Vuna.Compiler.Elab.Usage.uDrop", "Vuna/Compiler/Elab/Usage.vuna:72"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig", ("Vuna.Compiler.Elab.Usage.checkBinderRig", "Vuna/Compiler/Elab/Usage.vuna:80"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckLamBinder", ("Vuna.Compiler.Elab.Usage.checkLamBinder", "Vuna/Compiler/Elab/Usage.vuna:96"));
  ("v_Vuna_dCompiler_dElab_dUsage_dshadowedByRuntime", ("Vuna.Compiler.Elab.Usage.shadowedByRuntime", "Vuna/Compiler/Elab/Usage.vuna:112"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckAltBinders", ("Vuna.Compiler.Elab.Usage.checkAltBinders", "Vuna/Compiler/Elab/Usage.vuna:119"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo", ("Vuna.Compiler.Elab.Usage.checkAltBindersGo", "Vuna/Compiler/Elab/Usage.vuna:122"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckTerm", ("Vuna.Compiler.Elab.Usage.checkTerm", "Vuna/Compiler/Elab/Usage.vuna:141"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckArgs", ("Vuna.Compiler.Elab.Usage.checkArgs", "Vuna/Compiler/Elab/Usage.vuna:181"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo", ("Vuna.Compiler.Elab.Usage.checkArgsGo", "Vuna/Compiler/Elab/Usage.vuna:184"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckAlts", ("Vuna.Compiler.Elab.Usage.checkAlts", "Vuna/Compiler/Elab/Usage.vuna:191"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo", ("Vuna.Compiler.Elab.Usage.checkAltsGo", "Vuna/Compiler/Elab/Usage.vuna:194"));
  ("v_Vuna_dCompiler_dElab_dUsage_disRigZero", ("Vuna.Compiler.Elab.Usage.isRigZero", "Vuna/Compiler/Elab/Usage.vuna:213"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckDefUsage", ("Vuna.Compiler.Elab.Usage.checkDefUsage", "Vuna/Compiler/Elab/Usage.vuna:219"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapCheck", ("Vuna.Compiler.Elab.Usage.capCheck", "Vuna/Compiler/Elab/Usage.vuna:241"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelFor", ("Vuna.Compiler.Elab.Usage.capCheckFuelFor", "Vuna/Compiler/Elab/Usage.vuna:247"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelMax", ("Vuna.Compiler.Elab.Usage.capCheckFuelMax", "Vuna/Compiler/Elab/Usage.vuna:253"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel", ("Vuna.Compiler.Elab.Usage.capCheckFuel", "Vuna/Compiler/Elab/Usage.vuna:256"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel", ("Vuna.Compiler.Elab.Usage.capArgsFuel", "Vuna/Compiler/Elab/Usage.vuna:290"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo", ("Vuna.Compiler.Elab.Usage.capArgsGo", "Vuna/Compiler/Elab/Usage.vuna:293"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel", ("Vuna.Compiler.Elab.Usage.capAltsFuel", "Vuna/Compiler/Elab/Usage.vuna:301"));
  ("v_Vuna_dCompiler_dElab_dUsage_dctorFamilyLinear", ("Vuna.Compiler.Elab.Usage.ctorFamilyLinear", "Vuna/Compiler/Elab/Usage.vuna:308"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckDefCapture", ("Vuna.Compiler.Elab.Usage.checkDefCapture", "Vuna/Compiler/Elab/Usage.vuna:316"));
  ("v_Vuna_dCompiler_dElab_dUsage_disTypeLevelDef", ("Vuna.Compiler.Elab.Usage.isTypeLevelDef", "Vuna/Compiler/Elab/Usage.vuna:319"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsage", ("Vuna.Compiler.Elab.Usage.checkProgramUsage", "Vuna/Compiler/Elab/Usage.vuna:325"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo", ("Vuna.Compiler.Elab.Usage.checkProgramUsageGo", "Vuna/Compiler/Elab/Usage.vuna:328"));
  ("v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf", ("Vuna.Compiler.Elab.Usage.defSpanOf", "Vuna/Compiler/Elab/Usage.vuna:338"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwarnUnusedBinder", ("Vuna.Compiler.Elab.Usage.warnUnusedBinder", "Vuna/Compiler/Elab/Usage.vuna:345"));
  ("v_Vuna_dCompiler_dElab_dUsage_dresetUseSpans", ("Vuna.Compiler.Elab.Usage.resetUseSpans", "Vuna/Compiler/Elab/Usage.vuna:356"));
  ("v_Vuna_dCompiler_dElab_dUsage_drecordUseSpan", ("Vuna.Compiler.Elab.Usage.recordUseSpan", "Vuna/Compiler/Elab/Usage.vuna:360"));
  ("v_Vuna_dCompiler_dElab_dUsage_dusesOf", ("Vuna.Compiler.Elab.Usage.usesOf", "Vuna/Compiler/Elab/Usage.vuna:364"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwithUseFields", ("Vuna.Compiler.Elab.Usage.withUseFields", "Vuna/Compiler/Elab/Usage.vuna:368"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwithUseSpans", ("Vuna.Compiler.Elab.Usage.withUseSpans", "Vuna/Compiler/Elab/Usage.vuna:372"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwarnAt", ("Vuna.Compiler.Elab.Usage.warnAt", "Vuna/Compiler/Elab/Usage.vuna:382"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwarnAt0", ("Vuna.Compiler.Elab.Usage.warnAt0", "Vuna/Compiler/Elab/Usage.vuna:386"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwarnAt1", ("Vuna.Compiler.Elab.Usage.warnAt1", "Vuna/Compiler/Elab/Usage.vuna:390"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwarnAt1Mod", ("Vuna.Compiler.Elab.Usage.warnAt1Mod", "Vuna/Compiler/Elab/Usage.vuna:394"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwarnAt0Mod", ("Vuna.Compiler.Elab.Usage.warnAt0Mod", "Vuna/Compiler/Elab/Usage.vuna:398"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyErr", ("Vuna.Compiler.Elab.Case.unifyErr", "Vuna/Compiler/Elab/Case.vuna:76"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyIdxList", ("Vuna.Compiler.Elab.Case.unifyIdxList", "Vuna/Compiler/Elab/Case.vuna:79"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo", ("Vuna.Compiler.Elab.Case.unifyIdxListGo", "Vuna/Compiler/Elab/Case.vuna:83"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyIdxListSized", ("Vuna.Compiler.Elab.Case.unifyIdxListSized", "Vuna/Compiler/Elab/Case.vuna:97"));
  ("v_Vuna_dCompiler_dElab_dCase_didxFuelFor", ("Vuna.Compiler.Elab.Case.idxFuelFor", "Vuna/Compiler/Elab/Case.vuna:100"));
  ("v_Vuna_dCompiler_dElab_dCase_didxFuelMax", ("Vuna.Compiler.Elab.Case.idxFuelMax", "Vuna/Compiler/Elab/Case.vuna:106"));
  ("v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList", ("Vuna.Compiler.Elab.Case.idxNatDepthOfList", "Vuna/Compiler/Elab/Case.vuna:109"));
  ("v_Vuna_dCompiler_dElab_dCase_didxNatDepthNear", ("Vuna.Compiler.Elab.Case.idxNatDepthNear", "Vuna/Compiler/Elab/Case.vuna:119"));
  ("v_Vuna_dCompiler_dElab_dCase_didxIsNatHead", ("Vuna.Compiler.Elab.Case.idxIsNatHead", "Vuna/Compiler/Elab/Case.vuna:129"));
  ("v_Vuna_dCompiler_dElab_dCase_didxIsNatCtor", ("Vuna.Compiler.Elab.Case.idxIsNatCtor", "Vuna/Compiler/Elab/Case.vuna:137"));
  ("v_Vuna_dCompiler_dElab_dCase_didxNatPrefixDepth", ("Vuna.Compiler.Elab.Case.idxNatPrefixDepth", "Vuna/Compiler/Elab/Case.vuna:141"));
  ("v_Vuna_dCompiler_dElab_dCase_didxNatPrefixGo", ("Vuna.Compiler.Elab.Case.idxNatPrefixGo", "Vuna/Compiler/Elab/Case.vuna:144"));
  ("v_Vuna_dCompiler_dElab_dCase_didxIsNatSuccHead", ("Vuna.Compiler.Elab.Case.idxIsNatSuccHead", "Vuna/Compiler/Elab/Case.vuna:160"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyIdx", ("Vuna.Compiler.Elab.Case.unifyIdx", "Vuna/Compiler/Elab/Case.vuna:168"));
  ("v_Vuna_dCompiler_dElab_dCase_doccursLevel", ("Vuna.Compiler.Elab.Case.occursLevel", "Vuna/Compiler/Elab/Case.vuna:199"));
  ("v_Vuna_dCompiler_dElab_dCase_doccursFreshLevel", ("Vuna.Compiler.Elab.Case.occursFreshLevel", "Vuna/Compiler/Elab/Case.vuna:229"));
  ("v_Vuna_dCompiler_dElab_dCase_doccursLevelList", ("Vuna.Compiler.Elab.Case.occursLevelList", "Vuna/Compiler/Elab/Case.vuna:232"));
  ("v_Vuna_dCompiler_dElab_dCase_doccursFuel", ("Vuna.Compiler.Elab.Case.occursFuel", "Vuna/Compiler/Elab/Case.vuna:239"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid", ("Vuna.Compiler.Elab.Case.unifyIdxRigid", "Vuna/Compiler/Elab/Case.vuna:243"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv", ("Vuna.Compiler.Elab.Case.unifyIdxConv", "Vuna/Compiler/Elab/Case.vuna:271"));
  ("v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable", ("Vuna.Compiler.Elab.Case.branchIsReachable", "Vuna/Compiler/Elab/Case.vuna:290"));
  ("v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify", ("Vuna.Compiler.Elab.Case.branchAfterUnify", "Vuna/Compiler/Elab/Case.vuna:295"));
  ("v_Vuna_dCompiler_dElab_dCase_dbranchVerdict", ("Vuna.Compiler.Elab.Case.branchVerdict", "Vuna/Compiler/Elab/Case.vuna:300"));
  ("v_Vuna_dCompiler_dElab_dCase_dbranchReachable", ("Vuna.Compiler.Elab.Case.branchReachable", "Vuna/Compiler/Elab/Case.vuna:308"));
  ("v_Vuna_dCompiler_dElab_dCase_dwildArgs", ("Vuna.Compiler.Elab.Case.wildArgs", "Vuna/Compiler/Elab/Case.vuna:311"));
  ("v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity", ("Vuna.Compiler.Elab.Case.ctorExplicitArity", "Vuna/Compiler/Elab/Case.vuna:315"));
  ("v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder", ("Vuna.Compiler.Elab.Case.ctxHasEmptyBinder", "Vuna/Compiler/Elab/Case.vuna:321"));
  ("v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt", ("Vuna.Compiler.Elab.Case.ctxHasEmptyBinderAt", "Vuna/Compiler/Elab/Case.vuna:324"));
  ("v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue", ("Vuna.Compiler.Elab.Case.isEmptyFamilyValue", "Vuna/Compiler/Elab/Case.vuna:332"));
  ("v_Vuna_dCompiler_dElab_dCase_drigidIdxVals", ("Vuna.Compiler.Elab.Case.rigidIdxVals", "Vuna/Compiler/Elab/Case.vuna:345"));
  ("v_Vuna_dCompiler_dElab_dCase_disRigidVal", ("Vuna.Compiler.Elab.Case.isRigidVal", "Vuna/Compiler/Elab/Case.vuna:349"));
  ("v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable", ("Vuna.Compiler.Elab.Case.allCtorsUnsatisfiable", "Vuna/Compiler/Elab/Case.vuna:358"));
  ("v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo", ("Vuna.Compiler.Elab.Case.allCtorsUnsatisfiableGo", "Vuna/Compiler/Elab/Case.vuna:361"));
  ("v_Vuna_dCompiler_dElab_dCase_dbindCtorTele", ("Vuna.Compiler.Elab.Case.bindCtorTele", "Vuna/Compiler/Elab/Case.vuna:373"));
  ("v_Vuna_dCompiler_dElab_dCase_dbindCtorGo", ("Vuna.Compiler.Elab.Case.bindCtorGo", "Vuna/Compiler/Elab/Case.vuna:376"));
  ("v_Vuna_dCompiler_dElab_dCase_dbindCtorField", ("Vuna.Compiler.Elab.Case.bindCtorField", "Vuna/Compiler/Elab/Case.vuna:395"));
  ("v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals", ("Vuna.Compiler.Elab.Case.freshTeleVals", "Vuna/Compiler/Elab/Case.vuna:402"));
  ("v_Vuna_dCompiler_dElab_dCase_dctorResultVals", ("Vuna.Compiler.Elab.Case.ctorResultVals", "Vuna/Compiler/Elab/Case.vuna:407"));
  ("v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn", ("Vuna.Compiler.Elab.Case.ctorResultValsIn", "Vuna/Compiler/Elab/Case.vuna:417"));
  ("v_Vuna_dCompiler_dElab_dCase_dctorResultTerms", ("Vuna.Compiler.Elab.Case.ctorResultTerms", "Vuna/Compiler/Elab/Case.vuna:420"));
  ("v_Vuna_dCompiler_dElab_dCase_dctorValueIn", ("Vuna.Compiler.Elab.Case.ctorValueIn", "Vuna/Compiler/Elab/Case.vuna:427"));
  ("v_Vuna_dCompiler_dElab_dCase_dteleValsFrom", ("Vuna.Compiler.Elab.Case.teleValsFrom", "Vuna/Compiler/Elab/Case.vuna:432"));
  ("v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee", ("Vuna.Compiler.Elab.Case.reflectScrutinee", "Vuna/Compiler/Elab/Case.vuna:445"));
  ("v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable", ("Vuna.Compiler.Elab.Case.patIrrefutable", "Vuna/Compiler/Elab/Case.vuna:462"));
  ("v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable", ("Vuna.Compiler.Elab.Case.patsAllIrrefutable", "Vuna/Compiler/Elab/Case.vuna:467"));
  ("v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered", ("Vuna.Compiler.Elab.Case.ctorHeadCovered", "Vuna/Compiler/Elab/Case.vuna:471"));
  ("v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered", ("Vuna.Compiler.Elab.Case.litHeadCovered", "Vuna/Compiler/Elab/Case.vuna:477"));
  ("v_Vuna_dCompiler_dElab_dCase_dlitPatEq", ("Vuna.Compiler.Elab.Case.litPatEq", "Vuna/Compiler/Elab/Case.vuna:481"));
  ("v_Vuna_dCompiler_dElab_dCase_dlitLabel", ("Vuna.Compiler.Elab.Case.litLabel", "Vuna/Compiler/Elab/Case.vuna:490"));
  ("v_Vuna_dCompiler_dElab_dCase_dstripAsPat", ("Vuna.Compiler.Elab.Case.stripAsPat", "Vuna/Compiler/Elab/Case.vuna:499"));
  ("v_Vuna_dCompiler_dElab_dCase_dstripAsPats", ("Vuna.Compiler.Elab.Case.stripAsPats", "Vuna/Compiler/Elab/Case.vuna:504"));
  ("v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat", ("Vuna.Compiler.Elab.Case.checkCaseAltsFlat", "Vuna/Compiler/Elab/Case.vuna:509"));
  ("v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo", ("Vuna.Compiler.Elab.Case.checkCaseAltsGo", "Vuna/Compiler/Elab/Case.vuna:512"));
  ("v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll", ("Vuna.Compiler.Elab.Case.checkCatchAll", "Vuna/Compiler/Elab/Case.vuna:545"));
  ("v_Vuna_dCompiler_dElab_dCase_dhasLitHead", ("Vuna.Compiler.Elab.Case.hasLitHead", "Vuna/Compiler/Elab/Case.vuna:555"));
  ("v_Vuna_dCompiler_dElab_dCase_daltNames", ("Vuna.Compiler.Elab.Case.altNames", "Vuna/Compiler/Elab/Case.vuna:565"));
  ("v_Vuna_dCompiler_dElab_dCase_dhasCatchAll", ("Vuna.Compiler.Elab.Case.hasCatchAll", "Vuna/Compiler/Elab/Case.vuna:571"));
  ("v_Vuna_dCompiler_dElab_dCase_dhasDupNames", ("Vuna.Compiler.Elab.Case.hasDupNames", "Vuna/Compiler/Elab/Case.vuna:577"));
  ("v_Vuna_dCompiler_dElab_dCase_danyNestedPat", ("Vuna.Compiler.Elab.Case.anyNestedPat", "Vuna/Compiler/Elab/Case.vuna:585"));
  ("v_Vuna_dCompiler_dElab_dCase_dnestedInPat", ("Vuna.Compiler.Elab.Case.nestedInPat", "Vuna/Compiler/Elab/Case.vuna:589"));
  ("v_Vuna_dCompiler_dElab_dCase_danyNestedArg", ("Vuna.Compiler.Elab.Case.anyNestedArg", "Vuna/Compiler/Elab/Case.vuna:593"));
  ("v_Vuna_dCompiler_dElab_dCase_dcheckCoverage", ("Vuna.Compiler.Elab.Case.checkCoverage", "Vuna/Compiler/Elab/Case.vuna:607"));
  ("v_Vuna_dCompiler_dElab_dCase_dcheckCovered", ("Vuna.Compiler.Elab.Case.checkCovered", "Vuna/Compiler/Elab/Case.vuna:611"));
  ("v_Vuna_dCompiler_dElab_dCase_dmissingCtors", ("Vuna.Compiler.Elab.Case.missingCtors", "Vuna/Compiler/Elab/Case.vuna:617"));
  ("v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone", ("Vuna.Compiler.Elab.Case.checkCaseDone", "Vuna/Compiler/Elab/Case.vuna:625"));
  ("v_Vuna_dCompiler_dElab_dCase_dbranchRemovalSpan", ("Vuna.Compiler.Elab.Case.branchRemovalSpan", "Vuna/Compiler/Elab/Case.vuna:633"));
  ("v_Vuna_dCompiler_dElab_dCase_dremoveBranchSuggest", ("Vuna.Compiler.Elab.Case.removeBranchSuggest", "Vuna/Compiler/Elab/Case.vuna:638"));
  ("v_Vuna_dCompiler_dElab_dMetaSpans_drecordMetaSpan", ("Vuna.Compiler.Elab.MetaSpans.recordMetaSpan", "Vuna/Compiler/Elab/MetaSpans.vuna:19"));
  ("v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanOf", ("Vuna.Compiler.Elab.MetaSpans.metaSpanOf", "Vuna/Compiler/Elab/MetaSpans.vuna:23"));
  ("v_Vuna_dCompiler_dElab_dMetaSpans_dlookupMeta", ("Vuna.Compiler.Elab.MetaSpans.lookupMeta", "Vuna/Compiler/Elab/MetaSpans.vuna:27"));
  ("v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt", ("Vuna.Compiler.Elab.MetaSpans.newMetaAt", "Vuna/Compiler/Elab/MetaSpans.vuna:32"));
  ("v_Vuna_dCompiler_dElab_dMetaSpans_dnewHoleMeta", ("Vuna.Compiler.Elab.MetaSpans.newHoleMeta", "Vuna/Compiler/Elab/MetaSpans.vuna:40"));
  ("v_Vuna_dCompiler_dElab_dDict_disDictDomain", ("Vuna.Compiler.Elab.Dict.isDictDomain", "Vuna/Compiler/Elab/Dict.vuna:56"));
  ("v_Vuna_dCompiler_dElab_dDict_disDictValue", ("Vuna.Compiler.Elab.Dict.isDictValue", "Vuna/Compiler/Elab/Dict.vuna:59"));
  ("v_Vuna_dCompiler_dElab_dDict_disDictFamily", ("Vuna.Compiler.Elab.Dict.isDictFamily", "Vuna/Compiler/Elab/Dict.vuna:65"));
  ("v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn", ("Vuna.Compiler.Elab.Dict.searchInstanceIn", "Vuna/Compiler/Elab/Dict.vuna:74"));
  ("v_Vuna_dCompiler_dElab_dDict_dsearchInstance", ("Vuna.Compiler.Elab.Dict.searchInstance", "Vuna/Compiler/Elab/Dict.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dDict_dinstMatchInst", ("Vuna.Compiler.Elab.Dict.instMatchInst", "Vuna/Compiler/Elab/Dict.vuna:85"));
  ("v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel", ("Vuna.Compiler.Elab.Dict.searchInstFuel", "Vuna/Compiler/Elab/Dict.vuna:94"));
  ("v_Vuna_dCompiler_dElab_dDict_dfindClass", ("Vuna.Compiler.Elab.Dict.findClass", "Vuna/Compiler/Elab/Dict.vuna:116"));
  ("v_Vuna_dCompiler_dElab_dDict_dfamOfClass", ("Vuna.Compiler.Elab.Dict.famOfClass", "Vuna/Compiler/Elab/Dict.vuna:121"));
  ("v_Vuna_dCompiler_dElab_dDict_danyViaClassFam", ("Vuna.Compiler.Elab.Dict.anyViaClassFam", "Vuna/Compiler/Elab/Dict.vuna:127"));
  ("v_Vuna_dCompiler_dElab_dDict_dviaAllowsFam", ("Vuna.Compiler.Elab.Dict.viaAllowsFam", "Vuna/Compiler/Elab/Dict.vuna:134"));
  ("v_Vuna_dCompiler_dElab_dDict_dapplyDataPis", ("Vuna.Compiler.Elab.Dict.applyDataPis", "Vuna/Compiler/Elab/Dict.vuna:138"));
  ("v_Vuna_dCompiler_dElab_dDict_dviaFieldType", ("Vuna.Compiler.Elab.Dict.viaFieldType", "Vuna/Compiler/Elab/Dict.vuna:147"));
  ("v_Vuna_dCompiler_dElab_dDict_dviaWrapperOf", ("Vuna.Compiler.Elab.Dict.viaWrapperOf", "Vuna/Compiler/Elab/Dict.vuna:156"));
  ("v_Vuna_dCompiler_dElab_dDict_dviaWrapperData", ("Vuna.Compiler.Elab.Dict.viaWrapperData", "Vuna/Compiler/Elab/Dict.vuna:162"));
  ("v_Vuna_dCompiler_dElab_dDict_dviaWrapperShape", ("Vuna.Compiler.Elab.Dict.viaWrapperShape", "Vuna/Compiler/Elab/Dict.vuna:168"));
  ("v_Vuna_dCompiler_dElab_dDict_danyViaWrapper", ("Vuna.Compiler.Elab.Dict.anyViaWrapper", "Vuna/Compiler/Elab/Dict.vuna:175"));
  ("v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists", ("Vuna.Compiler.Elab.Dict.viaCandidateExists", "Vuna/Compiler/Elab/Dict.vuna:182"));
  ("v_Vuna_dCompiler_dElab_dDict_dreplaceAt", ("Vuna.Compiler.Elab.Dict.replaceAt", "Vuna/Compiler/Elab/Dict.vuna:188"));
  ("v_Vuna_dCompiler_dElab_dDict_dtryViaDict", ("Vuna.Compiler.Elab.Dict.tryViaDict", "Vuna/Compiler/Elab/Dict.vuna:194"));
  ("v_Vuna_dCompiler_dElab_dDict_dtryViaArgs", ("Vuna.Compiler.Elab.Dict.tryViaArgs", "Vuna/Compiler/Elab/Dict.vuna:203"));
  ("v_Vuna_dCompiler_dElab_dDict_dsearchCandidates", ("Vuna.Compiler.Elab.Dict.searchCandidates", "Vuna/Compiler/Elab/Dict.vuna:219"));
  ("v_Vuna_dCompiler_dElab_dDict_dspecificInstances", ("Vuna.Compiler.Elab.Dict.specificInstances", "Vuna/Compiler/Elab/Dict.vuna:225"));
  ("v_Vuna_dCompiler_dElab_dDict_dblanketInstances", ("Vuna.Compiler.Elab.Dict.blanketInstances", "Vuna/Compiler/Elab/Dict.vuna:230"));
  ("v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch", ("Vuna.Compiler.Elab.Dict.finishInstanceSearch", "Vuna/Compiler/Elab/Dict.vuna:235"));
  ("v_Vuna_dCompiler_dElab_dDict_dmissingInstance", ("Vuna.Compiler.Elab.Dict.missingInstance", "Vuna/Compiler/Elab/Dict.vuna:247"));
  ("v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue", ("Vuna.Compiler.Elab.Dict.showResolvedValue", "Vuna/Compiler/Elab/Dict.vuna:262"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpGoal", "Vuna/Compiler/Elab/Dict.vuna:267"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpGoalGo", "Vuna/Compiler/Elab/Dict.vuna:270"));
  ("v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup", ("Vuna.Compiler.Elab.Dict.localDictLookup", "Vuna/Compiler/Elab/Dict.vuna:284"));
  ("v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo", ("Vuna.Compiler.Elab.Dict.localDictLookupGo", "Vuna/Compiler/Elab/Dict.vuna:289"));
  ("v_Vuna_dCompiler_dElab_dDict_drigidSearchFast", ("Vuna.Compiler.Elab.Dict.rigidSearchFast", "Vuna/Compiler/Elab/Dict.vuna:303"));
  ("v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily", ("Vuna.Compiler.Elab.Dict.valueDictFamily", "Vuna/Compiler/Elab/Dict.vuna:307"));
  ("v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance", ("Vuna.Compiler.Elab.Dict.hasSpecificInterpInstance", "Vuna/Compiler/Elab/Dict.vuna:317"));
  ("v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo", ("Vuna.Compiler.Elab.Dict.hasSpecificInterpInstanceGo", "Vuna/Compiler/Elab/Dict.vuna:321"));
  ("v_Vuna_dCompiler_dElab_dDict_dinstHeadArgTypeName", ("Vuna.Compiler.Elab.Dict.instHeadArgTypeName", "Vuna/Compiler/Elab/Dict.vuna:327"));
  ("v_Vuna_dCompiler_dElab_dDict_dtermTypeNameOf", ("Vuna.Compiler.Elab.Dict.termTypeNameOf", "Vuna/Compiler/Elab/Dict.vuna:332"));
  ("v_Vuna_dCompiler_dElab_dDict_disMonoInst", ("Vuna.Compiler.Elab.Dict.isMonoInst", "Vuna/Compiler/Elab/Dict.vuna:336"));
  ("v_Vuna_dCompiler_dElab_dDict_dallInstancesMono", ("Vuna.Compiler.Elab.Dict.allInstancesMono", "Vuna/Compiler/Elab/Dict.vuna:344"));
  ("v_Vuna_dCompiler_dElab_dDict_dmatchInstances", ("Vuna.Compiler.Elab.Dict.matchInstances", "Vuna/Compiler/Elab/Dict.vuna:348"));
  ("v_Vuna_dCompiler_dElab_dDict_dtryMatchInst", ("Vuna.Compiler.Elab.Dict.tryMatchInst", "Vuna/Compiler/Elab/Dict.vuna:356"));
  ("v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas", ("Vuna.Compiler.Elab.Dict.allocTeleMetas", "Vuna/Compiler/Elab/Dict.vuna:387"));
  ("v_Vuna_dCompiler_dElab_dDict_dallocMetaAt", ("Vuna.Compiler.Elab.Dict.allocMetaAt", "Vuna/Compiler/Elab/Dict.vuna:393"));
  ("v_Vuna_dCompiler_dElab_dDict_dtermMetaId", ("Vuna.Compiler.Elab.Dict.termMetaId", "Vuna/Compiler/Elab/Dict.vuna:397"));
  ("v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas", ("Vuna.Compiler.Elab.Dict.solveTeleMetas", "Vuna/Compiler/Elab/Dict.vuna:401"));
  ("v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs", ("Vuna.Compiler.Elab.Dict.solveDictCtxs", "Vuna/Compiler/Elab/Dict.vuna:409"));
  ("v_Vuna_dCompiler_dElab_dDict_drowMemDomName", ("Vuna.Compiler.Elab.Dict.rowMemDomName", "Vuna/Compiler/Elab/Dict.vuna:422"));
  ("v_Vuna_dCompiler_dElab_dDict_drowYesDomName", ("Vuna.Compiler.Elab.Dict.rowYesDomName", "Vuna/Compiler/Elab/Dict.vuna:425"));
  ("v_Vuna_dCompiler_dElab_dDict_drowNoDomName", ("Vuna.Compiler.Elab.Dict.rowNoDomName", "Vuna/Compiler/Elab/Dict.vuna:428"));
  ("v_Vuna_dCompiler_dElab_dDict_drowYesCtorName", ("Vuna.Compiler.Elab.Dict.rowYesCtorName", "Vuna/Compiler/Elab/Dict.vuna:432"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberDomName", ("Vuna.Compiler.Elab.Dict.memberDomName", "Vuna/Compiler/Elab/Dict.vuna:438"));
  ("v_Vuna_dCompiler_dElab_dDict_dhereCtorName", ("Vuna.Compiler.Elab.Dict.hereCtorName", "Vuna/Compiler/Elab/Dict.vuna:442"));
  ("v_Vuna_dCompiler_dElab_dDict_dthereCtorName", ("Vuna.Compiler.Elab.Dict.thereCtorName", "Vuna/Compiler/Elab/Dict.vuna:446"));
  ("v_Vuna_dCompiler_dElab_dDict_disMemberDomain", ("Vuna.Compiler.Elab.Dict.isMemberDomain", "Vuna/Compiler/Elab/Dict.vuna:456"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberSpine", ("Vuna.Compiler.Elab.Dict.memberSpine", "Vuna/Compiler/Elab/Dict.vuna:466"));
  ("v_Vuna_dCompiler_dElab_dDict_dctorValue", ("Vuna.Compiler.Elab.Dict.ctorValue", "Vuna/Compiler/Elab/Dict.vuna:476"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberLookup", ("Vuna.Compiler.Elab.Dict.memberLookup", "Vuna/Compiler/Elab/Dict.vuna:481"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberCandName", ("Vuna.Compiler.Elab.Dict.memberCandName", "Vuna/Compiler/Elab/Dict.vuna:500"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberCandIdx", ("Vuna.Compiler.Elab.Dict.memberCandIdx", "Vuna/Compiler/Elab/Dict.vuna:503"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberProbe", ("Vuna.Compiler.Elab.Dict.memberProbe", "Vuna/Compiler/Elab/Dict.vuna:507"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberNameText", ("Vuna.Compiler.Elab.Dict.memberNameText", "Vuna/Compiler/Elab/Dict.vuna:513"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberScan", ("Vuna.Compiler.Elab.Dict.memberScan", "Vuna/Compiler/Elab/Dict.vuna:519"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberProofAt", ("Vuna.Compiler.Elab.Dict.memberProofAt", "Vuna/Compiler/Elab/Dict.vuna:536"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberLookupRow", ("Vuna.Compiler.Elab.Dict.memberLookupRow", "Vuna/Compiler/Elab/Dict.vuna:553"));
  ("v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo", ("Vuna.Compiler.Elab.Dict.ctxMemberProofTermGo", "Vuna/Compiler/Elab/Dict.vuna:571"));
  ("v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTerm", ("Vuna.Compiler.Elab.Dict.ctxMemberProofTerm", "Vuna/Compiler/Elab/Dict.vuna:577"));
  ("v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnify", ("Vuna.Compiler.Elab.Dict.ctxMemberProofUnify", "Vuna/Compiler/Elab/Dict.vuna:583"));
  ("v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo", ("Vuna.Compiler.Elab.Dict.ctxMemberProofUnifyGo", "Vuna/Compiler/Elab/Dict.vuna:586"));
  ("v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta", ("Vuna.Compiler.Elab.Dict.solveRowMeta", "Vuna/Compiler/Elab/Dict.vuna:592"));
  ("v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx", ("Vuna.Compiler.Elab.Dict.resolveRowGoalsCtx", "Vuna/Compiler/Elab/Dict.vuna:597"));
  ("v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo", ("Vuna.Compiler.Elab.Dict.resolveRowGoalsCtxGo", "Vuna/Compiler/Elab/Dict.vuna:600"));
  ("v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals", ("Vuna.Compiler.Elab.Dict.resolveDictGoals", "Vuna/Compiler/Elab/Dict.vuna:631"));
  ("v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel", ("Vuna.Compiler.Elab.Dict.resolveDictGoalsFuel", "Vuna/Compiler/Elab/Dict.vuna:637"));
  ("v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal", ("Vuna.Compiler.Elab.Dict.tryResolveDictGoal", "Vuna/Compiler/Elab/Dict.vuna:684"));
  ("v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm", ("Vuna.Compiler.Elab.Dict.substDictTerm", "Vuna/Compiler/Elab/Dict.vuna:706"));
  ("v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo", ("Vuna.Compiler.Elab.Dict.substDictTermGo", "Vuna/Compiler/Elab/Dict.vuna:709"));
  ("v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt", ("Vuna.Compiler.Elab.Dict.substDictTermAlt", "Vuna/Compiler/Elab/Dict.vuna:736"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt", ("Vuna.Compiler.Elab.Dict.dictTermOfValueAt", "Vuna/Compiler/Elab/Dict.vuna:749"));
  ("v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt", ("Vuna.Compiler.Elab.Dict.renderDictTermAt", "Vuna/Compiler/Elab/Dict.vuna:752"));
  ("v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInst", ("Vuna.Compiler.Elab.Dict.piRigsOfInst", "Vuna/Compiler/Elab/Dict.vuna:783"));
  ("v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo", ("Vuna.Compiler.Elab.Dict.piRigsOfInstGo", "Vuna/Compiler/Elab/Dict.vuna:786"));
  ("v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal", ("Vuna.Compiler.Elab.Dict.piRigsOfGlobal", "Vuna/Compiler/Elab/Dict.vuna:792"));
  ("v_Vuna_dCompiler_dElab_dDict_dpiRigs", ("Vuna.Compiler.Elab.Dict.piRigs", "Vuna/Compiler/Elab/Dict.vuna:799"));
  ("v_Vuna_dCompiler_dElab_dDict_djoinInstNames", ("Vuna.Compiler.Elab.Dict.joinInstNames", "Vuna/Compiler/Elab/Dict.vuna:803"));
  ("v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames", ("Vuna.Compiler.Elab.Dict.joinRestInstNames", "Vuna/Compiler/Elab/Dict.vuna:807"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictArgKinds", ("Vuna.Compiler.Elab.Dict.dictArgKinds", "Vuna/Compiler/Elab/Dict.vuna:813"));
  ("v_Vuna_dCompiler_dElab_dDict_dctorParamKinds", ("Vuna.Compiler.Elab.Dict.ctorParamKinds", "Vuna/Compiler/Elab/Dict.vuna:823"));
  ("v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel", ("Vuna.Compiler.Elab.Dict.ctorParamKindsFuel", "Vuna/Compiler/Elab/Dict.vuna:826"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictArgKind", ("Vuna.Compiler.Elab.Dict.dictArgKind", "Vuna/Compiler/Elab/Dict.vuna:836"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf", ("Vuna.Compiler.Elab.Dict.dictFamilyNameOf", "Vuna/Compiler/Elab/Dict.vuna:841"));
  ("v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind", ("Vuna.Compiler.Elab.Dict.argHeadMatchesKind", "Vuna/Compiler/Elab/Dict.vuna:848"));
  ("v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf", ("Vuna.Compiler.Elab.Dict.neutralHeadOrSelf", "Vuna/Compiler/Elab/Dict.vuna:858"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictClassArgs", ("Vuna.Compiler.Elab.Dict.dictClassArgs", "Vuna/Compiler/Elab/Dict.vuna:864"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictClassArg", ("Vuna.Compiler.Elab.Dict.dictClassArg", "Vuna/Compiler/Elab/Dict.vuna:869"));
  ("v_Vuna_dCompiler_dElab_dDict_disRigidDictArg", ("Vuna.Compiler.Elab.Dict.isRigidDictArg", "Vuna/Compiler/Elab/Dict.vuna:878"));
  ("v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg", ("Vuna.Compiler.Elab.Dict.anyRigidClassArg", "Vuna/Compiler/Elab/Dict.vuna:881"));
  ("v_Vuna_dCompiler_dElab_dDict_disRigidClassArg", ("Vuna.Compiler.Elab.Dict.isRigidClassArg", "Vuna/Compiler/Elab/Dict.vuna:886"));
  ("v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar", ("Vuna.Compiler.Elab.Dict.valueHasRigidNVar", "Vuna/Compiler/Elab/Dict.vuna:889"));
  ("v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar", ("Vuna.Compiler.Elab.Dict.anyValueHasRigidNVar", "Vuna/Compiler/Elab/Dict.vuna:904"));
  ("v_Vuna_dCompiler_dElab_dDict_dclassHasProjection", ("Vuna.Compiler.Elab.Dict.classHasProjection", "Vuna/Compiler/Elab/Dict.vuna:912"));
  ("v_Vuna_dCompiler_dElab_dDict_disEqMethod", ("Vuna.Compiler.Elab.Dict.isEqMethod", "Vuna/Compiler/Elab/Dict.vuna:920"));
  ("v_Vuna_dCompiler_dElab_dDict_disCmpMethod", ("Vuna.Compiler.Elab.Dict.isCmpMethod", "Vuna/Compiler/Elab/Dict.vuna:927"));
  ("v_Vuna_dCompiler_dElab_dDict_dnumMethodOpName", ("Vuna.Compiler.Elab.Dict.numMethodOpName", "Vuna/Compiler/Elab/Dict.vuna:944"));
  ("v_Vuna_dCompiler_dElab_dDict_dmethodShortOf", ("Vuna.Compiler.Elab.Dict.methodShortOf", "Vuna/Compiler/Elab/Dict.vuna:952"));
  ("v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf", ("Vuna.Compiler.Elab.Dict.eqMethodShortOf", "Vuna/Compiler/Elab/Dict.vuna:956"));
  ("v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf", ("Vuna.Compiler.Elab.Dict.cmpMethodShortOf", "Vuna/Compiler/Elab/Dict.vuna:961"));
  ("v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy", ("Vuna.Compiler.Elab.Dict.specializeEqTy", "Vuna/Compiler/Elab/Dict.vuna:978"));
  ("v_Vuna_dCompiler_dElab_dDict_ddeferEqDict", ("Vuna.Compiler.Elab.Dict.deferEqDict", "Vuna/Compiler/Elab/Dict.vuna:1008"));
  ("v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName", ("Vuna.Compiler.Elab.Dict.cmpRuntimeName", "Vuna/Compiler/Elab/Dict.vuna:1024"));
  ("v_Vuna_dCompiler_dElab_dDict_dcmpGenericName", ("Vuna.Compiler.Elab.Dict.cmpGenericName", "Vuna/Compiler/Elab/Dict.vuna:1040"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta", ("Vuna.Compiler.Elab.Dict.dictArgUnsolvedMeta", "Vuna/Compiler/Elab/Dict.vuna:1050"));
  ("v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg", ("Vuna.Compiler.Elab.Dict.anyUnsolvedMetaArg", "Vuna/Compiler/Elab/Dict.vuna:1056"));
  ("v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy", ("Vuna.Compiler.Elab.Dict.specializeCmpTy", "Vuna/Compiler/Elab/Dict.vuna:1065"));
  ("v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit", ("Vuna.Compiler.Elab.Dict.boolShortCircuit", "Vuna/Compiler/Elab/Dict.vuna:1091"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoal", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberGoal", "Vuna/Compiler/Elab/Dict.vuna:1095"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberGoalGo", "Vuna/Compiler/Elab/Dict.vuna:1098"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoal", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoal", "Vuna/Compiler/Elab/Dict.vuna:1109"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalGo", "Vuna/Compiler/Elab/Dict.vuna:1112"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpGoalSpan", "Vuna/Compiler/Elab/Dict.vuna:1129"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpSpanGo", "Vuna/Compiler/Elab/Dict.vuna:1133"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalSpan", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberGoalSpan", "Vuna/Compiler/Elab/Dict.vuna:1144"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberSpanGo", "Vuna/Compiler/Elab/Dict.vuna:1148"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalSpan", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalSpan", "Vuna/Compiler/Elab/Dict.vuna:1156"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictSpanGo", "Vuna/Compiler/Elab/Dict.vuna:1160"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMeta", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalMeta", "Vuna/Compiler/Elab/Dict.vuna:1173"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalMetaGo", "Vuna/Compiler/Elab/Dict.vuna:1177"));
  ("v_Vuna_dCompiler_dElab_dMatch_dallVarPats", ("Vuna.Compiler.Elab.Match.allVarPats", "Vuna/Compiler/Elab/Match.vuna:26"));
  ("v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr", ("Vuna.Compiler.Elab.Match.multiToExpr", "Vuna/Compiler/Elab/Match.vuna:35"));
  ("v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr", ("Vuna.Compiler.Elab.Match.multiToCaseExpr", "Vuna/Compiler/Elab/Match.vuna:47"));
  ("v_Vuna_dCompiler_dElab_dMatch_darityOf", ("Vuna.Compiler.Elab.Match.arityOf", "Vuna/Compiler/Elab/Match.vuna:50"));
  ("v_Vuna_dCompiler_dElab_dMatch_dparamNames", ("Vuna.Compiler.Elab.Match.paramNames", "Vuna/Compiler/Elab/Match.vuna:54"));
  ("v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo", ("Vuna.Compiler.Elab.Match.paramNamesGo", "Vuna/Compiler/Elab/Match.vuna:57"));
  ("v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas", ("Vuna.Compiler.Elab.Match.wrapLambdas", "Vuna/Compiler/Elab/Match.vuna:62"));
  ("v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr", ("Vuna.Compiler.Elab.Match.litAltExpr", "Vuna/Compiler/Elab/Match.vuna:69"));
  ("v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo", ("Vuna.Compiler.Elab.Match.litAltExprGo", "Vuna/Compiler/Elab/Match.vuna:73"));
  ("v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses", ("Vuna.Compiler.Elab.Match.litBranchClauses", "Vuna/Compiler/Elab/Match.vuna:95"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch", ("Vuna.Compiler.Elab.Match.filterLitBranch", "Vuna/Compiler/Elab/Match.vuna:98"));
  ("v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody", ("Vuna.Compiler.Elab.Match.literalBranchBody", "Vuna/Compiler/Elab/Match.vuna:106"));
  ("v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches", ("Vuna.Compiler.Elab.Match.litPatMatches", "Vuna/Compiler/Elab/Match.vuna:110"));
  ("v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr", ("Vuna.Compiler.Elab.Match.litPatExpr", "Vuna/Compiler/Elab/Match.vuna:124"));
  ("v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr", ("Vuna.Compiler.Elab.Match.buildColumnExpr", "Vuna/Compiler/Elab/Match.vuna:130"));
  ("v_Vuna_dCompiler_dElab_dMatch_dhasAsHead", ("Vuna.Compiler.Elab.Match.hasAsHead", "Vuna/Compiler/Elab/Match.vuna:145"));
  ("v_Vuna_dCompiler_dElab_dMatch_dasColumn", ("Vuna.Compiler.Elab.Match.asColumn", "Vuna/Compiler/Elab/Match.vuna:151"));
  ("v_Vuna_dCompiler_dElab_dMatch_dasInnerClause", ("Vuna.Compiler.Elab.Match.asInnerClause", "Vuna/Compiler/Elab/Match.vuna:158"));
  ("v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead", ("Vuna.Compiler.Elab.Match.innerOfHead", "Vuna/Compiler/Elab/Match.vuna:162"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameAsHead", ("Vuna.Compiler.Elab.Match.renameAsHead", "Vuna/Compiler/Elab/Match.vuna:166"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan", ("Vuna.Compiler.Elab.Match.firstPatSpan", "Vuna/Compiler/Elab/Match.vuna:173"));
  ("v_Vuna_dCompiler_dElab_dMatch_dctorColumn", ("Vuna.Compiler.Elab.Match.ctorColumn", "Vuna/Compiler/Elab/Match.vuna:182"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor", ("Vuna.Compiler.Elab.Match.familyOfCtor", "Vuna/Compiler/Elab/Match.vuna:192"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered", ("Vuna.Compiler.Elab.Match.familyCovered", "Vuna/Compiler/Elab/Match.vuna:197"));
  ("v_Vuna_dCompiler_dElab_dMatch_dallNamesIn", ("Vuna.Compiler.Elab.Match.allNamesIn", "Vuna/Compiler/Elab/Match.vuna:203"));
  ("v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead", ("Vuna.Compiler.Elab.Match.hasCtorHead", "Vuna/Compiler/Elab/Match.vuna:209"));
  ("v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads", ("Vuna.Compiler.Elab.Match.allCtorHeads", "Vuna/Compiler/Elab/Match.vuna:218"));
  ("v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats", ("Vuna.Compiler.Elab.Match.allEmptyPats", "Vuna/Compiler/Elab/Match.vuna:226"));
  ("v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst", ("Vuna.Compiler.Elab.Match.bodyOfFirst", "Vuna/Compiler/Elab/Match.vuna:232"));
  ("v_Vuna_dCompiler_dElab_dMatch_disVarPatD", ("Vuna.Compiler.Elab.Match.isVarPatD", "Vuna/Compiler/Elab/Match.vuna:236"));
  ("v_Vuna_dCompiler_dElab_dMatch_dallVarHeads", ("Vuna.Compiler.Elab.Match.allVarHeads", "Vuna/Compiler/Elab/Match.vuna:241"));
  ("v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol", ("Vuna.Compiler.Elab.Match.stripFirstCol", "Vuna/Compiler/Elab/Match.vuna:247"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameFirstVars", ("Vuna.Compiler.Elab.Match.renameFirstVars", "Vuna/Compiler/Elab/Match.vuna:255"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameExpr", ("Vuna.Compiler.Elab.Match.renameExpr", "Vuna/Compiler/Elab/Match.vuna:262"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts", ("Vuna.Compiler.Elab.Match.renameInterpParts", "Vuna/Compiler/Elab/Match.vuna:302"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless", ("Vuna.Compiler.Elab.Match.renameExprUnless", "Vuna/Compiler/Elab/Match.vuna:309"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameBind", ("Vuna.Compiler.Elab.Match.renameBind", "Vuna/Compiler/Elab/Match.vuna:313"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue", ("Vuna.Compiler.Elab.Match.renameFieldValue", "Vuna/Compiler/Elab/Match.vuna:316"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause", ("Vuna.Compiler.Elab.Match.renameLocalClause", "Vuna/Compiler/Elab/Match.vuna:321"));
  ("v_Vuna_dCompiler_dElab_dMatch_dbindNames", ("Vuna.Compiler.Elab.Match.bindNames", "Vuna/Compiler/Elab/Match.vuna:326"));
  ("v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf", ("Vuna.Compiler.Elab.Match.patNamesOf", "Vuna/Compiler/Elab/Match.vuna:330"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameAlt", ("Vuna.Compiler.Elab.Match.renameAlt", "Vuna/Compiler/Elab/Match.vuna:339"));
  ("v_Vuna_dCompiler_dElab_dMatch_dctorAltList", ("Vuna.Compiler.Elab.Match.ctorAltList", "Vuna/Compiler/Elab/Match.vuna:350"));
  ("v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo", ("Vuna.Compiler.Elab.Match.ctorAltListGo", "Vuna/Compiler/Elab/Match.vuna:355"));
  ("v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount", ("Vuna.Compiler.Elab.Match.ctorSubPatCount", "Vuna/Compiler/Elab/Match.vuna:370"));
  ("v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor", ("Vuna.Compiler.Elab.Match.subNamesFor", "Vuna/Compiler/Elab/Match.vuna:381"));
  ("v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo", ("Vuna.Compiler.Elab.Match.subNamesForGo", "Vuna/Compiler/Elab/Match.vuna:384"));
  ("v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo", ("Vuna.Compiler.Elab.Match.subNamesForGoGo", "Vuna/Compiler/Elab/Match.vuna:387"));
  ("v_Vuna_dCompiler_dElab_dMatch_dctorHeads", ("Vuna.Compiler.Elab.Match.ctorHeads", "Vuna/Compiler/Elab/Match.vuna:392"));
  ("v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct", ("Vuna.Compiler.Elab.Match.addNameDistinct", "Vuna/Compiler/Elab/Match.vuna:400"));
  ("v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor", ("Vuna.Compiler.Elab.Match.clausesForCtor", "Vuna/Compiler/Elab/Match.vuna:408"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfilterFallback", ("Vuna.Compiler.Elab.Match.filterFallback", "Vuna/Compiler/Elab/Match.vuna:421"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList", ("Vuna.Compiler.Elab.Match.fallbackAltList", "Vuna/Compiler/Elab/Match.vuna:431"));
  ("v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks", ("Vuna.Compiler.Elab.Match.prepFallbacks", "Vuna/Compiler/Elab/Match.vuna:439"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef", ("Vuna.Compiler.Elab.Term.Support.inferVarRef", "Vuna/Compiler/Elab/Term/Support.vuna:27"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix", ("Vuna.Compiler.Elab.Term.Support.allImplicitPrefix", "Vuna/Compiler/Elab/Term/Support.vuna:43"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicit", ("Vuna.Compiler.Elab.Term.Support.instantiateAllImplicit", "Vuna/Compiler/Elab/Term/Support.vuna:48"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel", ("Vuna.Compiler.Elab.Term.Support.instantiateAllImplicitFuel", "Vuna/Compiler/Elab/Term/Support.vuna:51"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs", ("Vuna.Compiler.Elab.Term.Support.checkBindingSigs", "Vuna/Compiler/Elab/Term/Support.vuna:67"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs", ("Vuna.Compiler.Elab.Term.Support.checkWhereSigs", "Vuna/Compiler/Elab/Term/Support.vuna:71"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dwhereBindingName", ("Vuna.Compiler.Elab.Term.Support.whereBindingName", "Vuna/Compiler/Elab/Term/Support.vuna:80"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dwithEffectLabels", ("Vuna.Compiler.Elab.Term.Support.withEffectLabels", "Vuna/Compiler/Elab/Term/Support.vuna:85"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndices", ("Vuna.Compiler.Elab.Term.Impl.opaqueBranchIndices", "Vuna/Compiler/Elab/Term/Impl.vuna:83"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo", ("Vuna.Compiler.Elab.Term.Impl.opaqueBranchIndicesGo", "Vuna/Compiler/Elab/Term/Impl.vuna:86"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dbranchBinderOpaque", ("Vuna.Compiler.Elab.Term.Impl.branchBinderOpaque", "Vuna/Compiler/Elab/Term/Impl.vuna:92"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel", ("Vuna.Compiler.Elab.Term.Impl.elabConAltFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:104"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel", ("Vuna.Compiler.Elab.Term.Impl.elabCaseAltsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:132"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel", ("Vuna.Compiler.Elab.Term.Impl.elabCatchAllFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:153"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:179"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase", ("Vuna.Compiler.Elab.Term.Impl.needsMatrixCase", "Vuna/Compiler/Elab/Term/Impl.vuna:191"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseMatrixFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:199"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseFamFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:208"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkBoolCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:222"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel", ("Vuna.Compiler.Elab.Term.Impl.boolAltFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:233"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel", ("Vuna.Compiler.Elab.Term.Impl.boolAltGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:238"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLitCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:262"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLitAltsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:271"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel", ("Vuna.Compiler.Elab.Term.Impl.litAltStepFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:291"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLitBoundVarFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:302"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts", ("Vuna.Compiler.Elab.Term.Impl.natLitCaseAlts", "Vuna/Compiler/Elab/Term/Impl.vuna:319"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkNatLitCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:327"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel", ("Vuna.Compiler.Elab.Term.Impl.checkNatLitAltsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:334"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitAltStepFuel", ("Vuna.Compiler.Elab.Term.Impl.natLitAltStepFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:352"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitBoundVarFuel", ("Vuna.Compiler.Elab.Term.Impl.checkNatLitBoundVarFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:362"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseOfFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:372"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel", ("Vuna.Compiler.Elab.Term.Impl.inferCaseEFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:382"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCondBoolFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:398"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfShortOf", ("Vuna.Compiler.Elab.Term.Impl.perfShortOf", "Vuna/Compiler/Elab/Term/Impl.vuna:421"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfCanonical", ("Vuna.Compiler.Elab.Term.Impl.perfFamilyOfCanonical", "Vuna/Compiler/Elab/Term/Impl.vuna:428"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfValue", ("Vuna.Compiler.Elab.Term.Impl.perfFamilyOfValue", "Vuna/Compiler/Elab/Term/Impl.vuna:436"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformOperand", ("Vuna.Compiler.Elab.Term.Impl.performOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:442"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dqualifyShort", ("Vuna.Compiler.Elab.Term.Impl.qualifyShort", "Vuna/Compiler/Elab/Term/Impl.vuna:447"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformCallExpr", ("Vuna.Compiler.Elab.Term.Impl.performCallExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:454"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand", ("Vuna.Compiler.Elab.Term.Impl.handleOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:471"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamily", ("Vuna.Compiler.Elab.Term.Impl.handleClauseFamily", "Vuna/Compiler/Elab/Term/Impl.vuna:477"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyOfCtor", ("Vuna.Compiler.Elab.Term.Impl.handleFamilyOfCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:485"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilyOfPat", ("Vuna.Compiler.Elab.Term.Impl.handleClauseFamilyOfPat", "Vuna/Compiler/Elab/Term/Impl.vuna:491"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCheckFamilies", ("Vuna.Compiler.Elab.Term.Impl.handleCheckFamilies", "Vuna/Compiler/Elab/Term/Impl.vuna:496"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilies", ("Vuna.Compiler.Elab.Term.Impl.handleClauseFamilies", "Vuna/Compiler/Elab/Term/Impl.vuna:505"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArity", ("Vuna.Compiler.Elab.Term.Impl.handleOpArity", "Vuna/Compiler/Elab/Term/Impl.vuna:514"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disUniverseTerm", ("Vuna.Compiler.Elab.Term.Impl.isUniverseTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:524"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleKindArity", ("Vuna.Compiler.Elab.Term.Impl.handleKindArity", "Vuna/Compiler/Elab/Term/Impl.vuna:529"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleHoleArgs", ("Vuna.Compiler.Elab.Term.Impl.handleHoleArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:535"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArg", ("Vuna.Compiler.Elab.Term.Impl.handleOpArg", "Vuna/Compiler/Elab/Term/Impl.vuna:540"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResBinder", ("Vuna.Compiler.Elab.Term.Impl.handleResBinder", "Vuna/Compiler/Elab/Term/Impl.vuna:545"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResArg", ("Vuna.Compiler.Elab.Term.Impl.handleResArg", "Vuna/Compiler/Elab/Term/Impl.vuna:550"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCall", ("Vuna.Compiler.Elab.Term.Impl.handleCall", "Vuna/Compiler/Elab/Term/Impl.vuna:557"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpKind", ("Vuna.Compiler.Elab.Term.Impl.handleOpKind", "Vuna/Compiler/Elab/Term/Impl.vuna:567"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleDefaultRetBinder", ("Vuna.Compiler.Elab.Term.Impl.handleDefaultRetBinder", "Vuna/Compiler/Elab/Term/Impl.vuna:573"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleRetArg", ("Vuna.Compiler.Elab.Term.Impl.handleRetArg", "Vuna/Compiler/Elab/Term/Impl.vuna:577"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResFamilyOf", ("Vuna.Compiler.Elab.Term.Impl.handleResFamilyOf", "Vuna/Compiler/Elab/Term/Impl.vuna:584"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyArityOf", ("Vuna.Compiler.Elab.Term.Impl.handleFamilyArityOf", "Vuna/Compiler/Elab/Term/Impl.vuna:596"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith", ("Vuna.Compiler.Elab.Term.Impl.handleCallExprWith", "Vuna/Compiler/Elab/Term/Impl.vuna:608"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr", ("Vuna.Compiler.Elab.Term.Impl.handleCallExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:621"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAt", ("Vuna.Compiler.Elab.Term.Impl.handleCallExprAt", "Vuna/Compiler/Elab/Term/Impl.vuna:625"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel", ("Vuna.Compiler.Elab.Term.Impl.inferEFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:628"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCore", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelCore", "Vuna/Compiler/Elab/Term/Impl.vuna:647"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelCorePlain", "Vuna/Compiler/Elab/Term/Impl.vuna:658"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf", ("Vuna.Compiler.Elab.Term.Impl.recordTypeOf", "Vuna/Compiler/Elab/Term/Impl.vuna:714"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName", ("Vuna.Compiler.Elab.Term.Impl.recordFieldVarName", "Vuna/Compiler/Elab/Term/Impl.vuna:725"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPats", ("Vuna.Compiler.Elab.Term.Impl.recordFieldPats", "Vuna/Compiler/Elab/Term/Impl.vuna:729"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom", ("Vuna.Compiler.Elab.Term.Impl.recordFieldPatsFrom", "Vuna/Compiler/Elab/Term/Impl.vuna:733"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup", ("Vuna.Compiler.Elab.Term.Impl.recordFieldLookup", "Vuna/Compiler/Elab/Term/Impl.vuna:739"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo", ("Vuna.Compiler.Elab.Term.Impl.recordFieldLookupGo", "Vuna/Compiler/Elab/Term/Impl.vuna:742"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateUnknownGo", "Vuna/Compiler/Elab/Term/Impl.vuna:749"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknown", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateUnknown", "Vuna/Compiler/Elab/Term/Impl.vuna:756"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateValueFor", "Vuna/Compiler/Elab/Term/Impl.vuna:760"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArg", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateArg", "Vuna/Compiler/Elab/Term/Impl.vuna:766"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:772"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices", ("Vuna.Compiler.Elab.Term.Impl.recordUpdatedIndices", "Vuna/Compiler/Elab/Term/Impl.vuna:778"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPlan", ("Vuna.Compiler.Elab.Term.Impl.recordFieldPlan", "Vuna/Compiler/Elab/Term/Impl.vuna:809"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatePlan", ("Vuna.Compiler.Elab.Term.Impl.recordUpdatePlan", "Vuna/Compiler/Elab/Term/Impl.vuna:818"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldDictName", ("Vuna.Compiler.Elab.Term.Impl.hasFieldDictName", "Vuna/Compiler/Elab/Term/Impl.vuna:831"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict", ("Vuna.Compiler.Elab.Term.Impl.ctxHasFieldDict", "Vuna/Compiler/Elab/Term/Impl.vuna:837"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo", ("Vuna.Compiler.Elab.Term.Impl.ctxHasFieldDictGo", "Vuna/Compiler/Elab/Term/Impl.vuna:841"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldAccessFuel", ("Vuna.Compiler.Elab.Term.Impl.hasFieldAccessFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:862"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_delabEFieldFuel", ("Vuna.Compiler.Elab.Term.Impl.elabEFieldFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:880"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_delabERecUpdateFuel", ("Vuna.Compiler.Elab.Term.Impl.elabERecUpdateFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:897"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAnnFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:915"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel", ("Vuna.Compiler.Elab.Term.Impl.inferPiFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:926"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForExpected", ("Vuna.Compiler.Elab.Term.Impl.skipArithSpecForExpected", "Vuna/Compiler/Elab/Term/Impl.vuna:959"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForHint", ("Vuna.Compiler.Elab.Term.Impl.skipArithSpecForHint", "Vuna/Compiler/Elab/Term/Impl.vuna:970"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:975"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppGeneralFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1025"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppGeneralGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1034"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel", ("Vuna.Compiler.Elab.Term.Impl.inferArgsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1043"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems", ("Vuna.Compiler.Elab.Term.Impl.listLitElems", "Vuna/Compiler/Elab/Term/Impl.vuna:1050"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitConsTail", ("Vuna.Compiler.Elab.Term.Impl.listLitConsTail", "Vuna/Compiler/Elab/Term/Impl.vuna:1056"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort", ("Vuna.Compiler.Elab.Term.Impl.findCtorByShort", "Vuna/Compiler/Elab/Term/Impl.vuna:1064"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor", ("Vuna.Compiler.Elab.Term.Impl.litFamilyCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:1070"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo", ("Vuna.Compiler.Elab.Term.Impl.expandListLitGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1076"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowAtParts", ("Vuna.Compiler.Elab.Term.Impl.rowAtParts", "Vuna/Compiler/Elab/Term/Impl.vuna:1087"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitLabel", ("Vuna.Compiler.Elab.Term.Impl.rowLitLabel", "Vuna/Compiler/Elab/Term/Impl.vuna:1092"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameArg", ("Vuna.Compiler.Elab.Term.Impl.rowLitNameArg", "Vuna/Compiler/Elab/Term/Impl.vuna:1097"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameExpr", ("Vuna.Compiler.Elab.Term.Impl.rowLitNameExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:1102"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandRowListLitGo", ("Vuna.Compiler.Elab.Term.Impl.expandRowListLitGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1107"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit", ("Vuna.Compiler.Elab.Term.Impl.expandListLit", "Vuna/Compiler/Elab/Term/Impl.vuna:1114"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily", ("Vuna.Compiler.Elab.Term.Impl.listLitFamily", "Vuna/Compiler/Elab/Term/Impl.vuna:1127"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandArgListLit", ("Vuna.Compiler.Elab.Term.Impl.expandArgListLit", "Vuna/Compiler/Elab/Term/Impl.vuna:1133"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo", ("Vuna.Compiler.Elab.Term.Impl.inferArgsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1138"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel", ("Vuna.Compiler.Elab.Term.Impl.deferDictBinderFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1216"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel", ("Vuna.Compiler.Elab.Term.Impl.constrainDictDomFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1230"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel", ("Vuna.Compiler.Elab.Term.Impl.constrainDictDomGoKFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1248"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo", ("Vuna.Compiler.Elab.Term.Impl.natLitTermGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1268"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm", ("Vuna.Compiler.Elab.Term.Impl.natLitTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1271"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult", ("Vuna.Compiler.Elab.Term.Impl.natLitResult", "Vuna/Compiler/Elab/Term/Impl.vuna:1276"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm", ("Vuna.Compiler.Elab.Term.Impl.natToIntTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1279"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue", ("Vuna.Compiler.Elab.Term.Impl.intTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1282"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue", ("Vuna.Compiler.Elab.Term.Impl.natTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1285"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue", ("Vuna.Compiler.Elab.Term.Impl.floatTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1289"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy", ("Vuna.Compiler.Elab.Term.Impl.isIntTy", "Vuna/Compiler/Elab/Term/Impl.vuna:1292"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy", ("Vuna.Compiler.Elab.Term.Impl.isNatTy", "Vuna/Compiler/Elab/Term/Impl.vuna:1297"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy", ("Vuna.Compiler.Elab.Term.Impl.isFloatTy", "Vuna/Compiler/Elab/Term/Impl.vuna:1303"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm", ("Vuna.Compiler.Elab.Term.Impl.coerceTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1309"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands", ("Vuna.Compiler.Elab.Term.Impl.coerceNatOperands", "Vuna/Compiler/Elab/Term/Impl.vuna:1314"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_darithOpNameOf", ("Vuna.Compiler.Elab.Term.Impl.arithOpNameOf", "Vuna/Compiler/Elab/Term/Impl.vuna:1328"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName", ("Vuna.Compiler.Elab.Term.Impl.arithNatName", "Vuna/Compiler/Elab/Term/Impl.vuna:1335"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2", ("Vuna.Compiler.Elab.Term.Impl.intApp2", "Vuna/Compiler/Elab/Term/Impl.vuna:1341"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2", ("Vuna.Compiler.Elab.Term.Impl.natApp2", "Vuna/Compiler/Elab/Term/Impl.vuna:1344"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2", ("Vuna.Compiler.Elab.Term.Impl.floatApp2", "Vuna/Compiler/Elab/Term/Impl.vuna:1349"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_darithFloatName", ("Vuna.Compiler.Elab.Term.Impl.arithFloatName", "Vuna/Compiler/Elab/Term/Impl.vuna:1353"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr", ("Vuna.Compiler.Elab.Term.Impl.isEIntExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:1359"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithCheckFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1366"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckOpFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithCheckOpFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1373"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1396"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppOpFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithAppOpFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1403"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel", ("Vuna.Compiler.Elab.Term.Impl.checkEFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1426"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower", ("Vuna.Compiler.Elab.Term.Impl.literalTraitLower", "Vuna/Compiler/Elab/Term/Impl.vuna:1455"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRow", ("Vuna.Compiler.Elab.Term.Impl.checkEFuelNoRow", "Vuna/Compiler/Elab/Term/Impl.vuna:1463"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain", ("Vuna.Compiler.Elab.Term.Impl.checkEFuelNoRowPlain", "Vuna/Compiler/Elab/Term/Impl.vuna:1474"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLetFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1546"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor", ("Vuna.Compiler.Elab.Term.Impl.patHasOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:1557"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor", ("Vuna.Compiler.Elab.Term.Impl.anyPatHasOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:1565"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor", ("Vuna.Compiler.Elab.Term.Impl.anyFieldHasOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:1570"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor", ("Vuna.Compiler.Elab.Term.Impl.clausesHaveOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:1575"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns", ("Vuna.Compiler.Elab.Term.Impl.expandLocalFuns", "Vuna/Compiler/Elab/Term/Impl.vuna:1580"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind", ("Vuna.Compiler.Elab.Term.Impl.expandBind", "Vuna/Compiler/Elab/Term/Impl.vuna:1621"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt", ("Vuna.Compiler.Elab.Term.Impl.expandDoStmt", "Vuna/Compiler/Elab/Term/Impl.vuna:1625"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1632"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLetGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1639"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLetOneFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1646"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1689"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetBoundFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1701"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetIgnoredFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1717"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas", ("Vuna.Compiler.Elab.Term.Impl.stripPisWithMetas", "Vuna/Compiler/Elab/Term/Impl.vuna:1733"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disMetaHeadedValue", ("Vuna.Compiler.Elab.Term.Impl.isMetaHeadedValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1745"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disRigidHeadValue", ("Vuna.Compiler.Elab.Term.Impl.isRigidHeadValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1751"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryUseHint", ("Vuna.Compiler.Elab.Term.Impl.tryUseHint", "Vuna/Compiler/Elab/Term/Impl.vuna:1763"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelHint", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelHint", "Vuna/Compiler/Elab/Term/Impl.vuna:1779"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult", ("Vuna.Compiler.Elab.Term.Impl.effRowAndResult", "Vuna/Compiler/Elab/Term/Impl.vuna:1800"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue", ("Vuna.Compiler.Elab.Term.Impl.effRowOfValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1806"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue", ("Vuna.Compiler.Elab.Term.Impl.isNilRowValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1812"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_deffConsLabelTail", ("Vuna.Compiler.Elab.Term.Impl.effConsLabelTail", "Vuna/Compiler/Elab/Term/Impl.vuna:1819"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dshortGlobalName", ("Vuna.Compiler.Elab.Term.Impl.shortGlobalName", "Vuna/Compiler/Elab/Term/Impl.vuna:1825"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLabelText", ("Vuna.Compiler.Elab.Term.Impl.rowLabelText", "Vuna/Compiler/Elab/Term/Impl.vuna:1830"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlabelHeadArgs", ("Vuna.Compiler.Elab.Term.Impl.labelHeadArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:1835"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowNameText", ("Vuna.Compiler.Elab.Term.Impl.rowNameText", "Vuna/Compiler/Elab/Term/Impl.vuna:1840"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryText", ("Vuna.Compiler.Elab.Term.Impl.rowEntryText", "Vuna/Compiler/Elab/Term/Impl.vuna:1846"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels", ("Vuna.Compiler.Elab.Term.Impl.rowEffectLabels", "Vuna/Compiler/Elab/Term/Impl.vuna:1850"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels", ("Vuna.Compiler.Elab.Term.Impl.joinEffectLabels", "Vuna/Compiler/Elab/Term/Impl.vuna:1864"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dunhandledEffectLabel", ("Vuna.Compiler.Elab.Term.Impl.unhandledEffectLabel", "Vuna/Compiler/Elab/Term/Impl.vuna:1871"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryEffLift", ("Vuna.Compiler.Elab.Term.Impl.tryEffLift", "Vuna/Compiler/Elab/Term/Impl.vuna:1889"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel", ("Vuna.Compiler.Elab.Term.Impl.checkByInferFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1914"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLamFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1931"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeHeadTerm", ("Vuna.Compiler.Elab.Term.Impl.typeHeadTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1988"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeAppTerm", ("Vuna.Compiler.Elab.Term.Impl.typeAppTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1994"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel", ("Vuna.Compiler.Elab.Term.Impl.checkTypeFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1999"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel", ("Vuna.Compiler.Elab.Term.Impl.checkTypeInferFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2020"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2035"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppByValueFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2058"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppUnderTypeFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2068"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppUnderTypeFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2076"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind", ("Vuna.Compiler.Elab.Term.Impl.checkTypeAtKind", "Vuna/Compiler/Elab/Term/Impl.vuna:2093"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeEqAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2119"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeCmpAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2136"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeOpAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2155"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeInterpPrimApp", ("Vuna.Compiler.Elab.Term.Impl.specializeInterpPrimApp", "Vuna/Compiler/Elab/Term/Impl.vuna:2176"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm", ("Vuna.Compiler.Elab.Term.Impl.strFromIntTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2192"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromFloatTerm", ("Vuna.Compiler.Elab.Term.Impl.strFromFloatTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2196"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue", ("Vuna.Compiler.Elab.Term.Impl.strTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2199"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disStringTyValue", ("Vuna.Compiler.Elab.Term.Impl.isStringTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2202"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeBoolAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2214"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppGeneralFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2227"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs", ("Vuna.Compiler.Elab.Term.Impl.ctorResultArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:2262"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType", ("Vuna.Compiler.Elab.Term.Impl.ctorSpineOfType", "Vuna/Compiler/Elab/Term/Impl.vuna:2266"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis", ("Vuna.Compiler.Elab.Term.Impl.dropPis", "Vuna/Compiler/Elab/Term/Impl.vuna:2273"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs", ("Vuna.Compiler.Elab.Term.Impl.identityArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:2277"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorIdentitySpine", ("Vuna.Compiler.Elab.Term.Impl.ctorIdentitySpine", "Vuna/Compiler/Elab/Term/Impl.vuna:2284"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigs", ("Vuna.Compiler.Elab.Term.Impl.takeRigs", "Vuna/Compiler/Elab/Term/Impl.vuna:2295"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo", ("Vuna.Compiler.Elab.Term.Impl.takeRigsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:2298"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs", ("Vuna.Compiler.Elab.Term.Impl.ctorFamilyArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:2302"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo", ("Vuna.Compiler.Elab.Term.Impl.ctorFamilyArgsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:2317"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel", ("Vuna.Compiler.Elab.Term.Impl.resolveOverPatFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2332"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel", ("Vuna.Compiler.Elab.Term.Impl.resolveCtorPatFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2349"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel", ("Vuna.Compiler.Elab.Term.Impl.resolvePatArgsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2360"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAlts", ("Vuna.Compiler.Elab.Term.Impl.resolveOverAlts", "Vuna/Compiler/Elab/Term/Impl.vuna:2379"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo", ("Vuna.Compiler.Elab.Term.Impl.resolveOverAltsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:2383"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPats", ("Vuna.Compiler.Elab.Term.Impl.resolveOverFunPats", "Vuna/Compiler/Elab/Term/Impl.vuna:2395"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo", ("Vuna.Compiler.Elab.Term.Impl.resolveOverFunPatsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:2400"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel", ("Vuna.Compiler.Elab.Term.Impl.resolveClausePatsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2411"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppCtorFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2429"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead", ("Vuna.Compiler.Elab.Term.Impl.doMarkerHead", "Vuna/Compiler/Elab/Term/Impl.vuna:2475"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain", ("Vuna.Compiler.Elab.Term.Impl.decodeDoChain", "Vuna/Compiler/Elab/Term/Impl.vuna:2497"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock", ("Vuna.Compiler.Elab.Term.Impl.decodeDoBlock", "Vuna/Compiler/Elab/Term/Impl.vuna:2510"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild", ("Vuna.Compiler.Elab.Term.Impl.doChainBuild", "Vuna/Compiler/Elab/Term/Impl.vuna:2520"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback", ("Vuna.Compiler.Elab.Term.Impl.doChainFallback", "Vuna/Compiler/Elab/Term/Impl.vuna:2526"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine", ("Vuna.Compiler.Elab.Term.Impl.splitDoSpine", "Vuna/Compiler/Elab/Term/Impl.vuna:2533"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoExpected", ("Vuna.Compiler.Elab.Term.Impl.splitDoExpected", "Vuna/Compiler/Elab/Term/Impl.vuna:2540"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dbindShapeOf", ("Vuna.Compiler.Elab.Term.Impl.bindShapeOf", "Vuna/Compiler/Elab/Term/Impl.vuna:2556"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindHeadOf", ("Vuna.Compiler.Elab.Term.Impl.doBindHeadOf", "Vuna/Compiler/Elab/Term/Impl.vuna:2566"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf", ("Vuna.Compiler.Elab.Term.Impl.doBlockShapeOf", "Vuna/Compiler/Elab/Term/Impl.vuna:2575"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer", ("Vuna.Compiler.Elab.Term.Impl.doDictDefer", "Vuna/Compiler/Elab/Term/Impl.vuna:2585"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictStep", ("Vuna.Compiler.Elab.Term.Impl.doDictStep", "Vuna/Compiler/Elab/Term/Impl.vuna:2594"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock", ("Vuna.Compiler.Elab.Term.Impl.planDoBlock", "Vuna/Compiler/Elab/Term/Impl.vuna:2620"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindAppTerm", ("Vuna.Compiler.Elab.Term.Impl.doBindAppTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2639"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain", ("Vuna.Compiler.Elab.Term.Impl.elabDoChain", "Vuna/Compiler/Elab/Term/Impl.vuna:2662"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckDoBlockFuel", ("Vuna.Compiler.Elab.Term.Impl.checkDoBlockFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2684"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferDoBlockFuel", ("Vuna.Compiler.Elab.Term.Impl.inferDoBlockFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2713"));
  ("v_Vuna_dCompiler_dElab_dTerm_ddeferDictBinder", ("Vuna.Compiler.Elab.Term.deferDictBinder", "Vuna/Compiler/Elab/Term.vuna:67"));
  ("v_Vuna_dCompiler_dElab_dTerm_dspecializeCmpApp", ("Vuna.Compiler.Elab.Term.specializeCmpApp", "Vuna/Compiler/Elab/Term.vuna:71"));
  ("v_Vuna_dCompiler_dElab_dTerm_dspecializeEqApp", ("Vuna.Compiler.Elab.Term.specializeEqApp", "Vuna/Compiler/Elab/Term.vuna:74"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckTypeInfer", ("Vuna.Compiler.Elab.Term.checkTypeInfer", "Vuna/Compiler/Elab/Term.vuna:77"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer", ("Vuna.Compiler.Elab.Term.checkByInfer", "Vuna/Compiler/Elab/Term.vuna:80"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferLetIgnored", ("Vuna.Compiler.Elab.Term.inferLetIgnored", "Vuna/Compiler/Elab/Term.vuna:83"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferLetBound", ("Vuna.Compiler.Elab.Term.inferLetBound", "Vuna/Compiler/Elab/Term.vuna:86"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferLet", ("Vuna.Compiler.Elab.Term.inferLet", "Vuna/Compiler/Elab/Term.vuna:89"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferLetGo", ("Vuna.Compiler.Elab.Term.inferLetGo", "Vuna/Compiler/Elab/Term.vuna:92"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckAppCtor", ("Vuna.Compiler.Elab.Term.checkAppCtor", "Vuna/Compiler/Elab/Term.vuna:95"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckAppUnderType", ("Vuna.Compiler.Elab.Term.checkAppUnderType", "Vuna/Compiler/Elab/Term.vuna:98"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckApp", ("Vuna.Compiler.Elab.Term.checkApp", "Vuna/Compiler/Elab/Term.vuna:101"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckAppGeneral", ("Vuna.Compiler.Elab.Term.checkAppGeneral", "Vuna/Compiler/Elab/Term.vuna:104"));
  ("v_Vuna_dCompiler_dElab_dTerm_dspecializeOpApp", ("Vuna.Compiler.Elab.Term.specializeOpApp", "Vuna/Compiler/Elab/Term.vuna:107"));
  ("v_Vuna_dCompiler_dElab_dTerm_dspecializeBoolApp", ("Vuna.Compiler.Elab.Term.specializeBoolApp", "Vuna/Compiler/Elab/Term.vuna:110"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLam", ("Vuna.Compiler.Elab.Term.checkLam", "Vuna/Compiler/Elab/Term.vuna:113"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLetOne", ("Vuna.Compiler.Elab.Term.checkLetOne", "Vuna/Compiler/Elab/Term.vuna:116"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLet", ("Vuna.Compiler.Elab.Term.checkLet", "Vuna/Compiler/Elab/Term.vuna:119"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLetGo", ("Vuna.Compiler.Elab.Term.checkLetGo", "Vuna/Compiler/Elab/Term.vuna:122"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLitBoundVar", ("Vuna.Compiler.Elab.Term.checkLitBoundVar", "Vuna/Compiler/Elab/Term.vuna:125"));
  ("v_Vuna_dCompiler_dElab_dTerm_dlitAltStep", ("Vuna.Compiler.Elab.Term.litAltStep", "Vuna/Compiler/Elab/Term.vuna:128"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLitCase", ("Vuna.Compiler.Elab.Term.checkLitCase", "Vuna/Compiler/Elab/Term.vuna:131"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLitAlts", ("Vuna.Compiler.Elab.Term.checkLitAlts", "Vuna/Compiler/Elab/Term.vuna:134"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckBoolCase", ("Vuna.Compiler.Elab.Term.checkBoolCase", "Vuna/Compiler/Elab/Term.vuna:137"));
  ("v_Vuna_dCompiler_dElab_dTerm_dboolAlt", ("Vuna.Compiler.Elab.Term.boolAlt", "Vuna/Compiler/Elab/Term.vuna:140"));
  ("v_Vuna_dCompiler_dElab_dTerm_dboolAltGo", ("Vuna.Compiler.Elab.Term.boolAltGo", "Vuna/Compiler/Elab/Term.vuna:143"));
  ("v_Vuna_dCompiler_dElab_dTerm_delabCatchAll", ("Vuna.Compiler.Elab.Term.elabCatchAll", "Vuna/Compiler/Elab/Term.vuna:146"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckE", ("Vuna.Compiler.Elab.Term.checkE", "Vuna/Compiler/Elab/Term.vuna:150"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferPi", ("Vuna.Compiler.Elab.Term.inferPi", "Vuna/Compiler/Elab/Term.vuna:153"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferAnn", ("Vuna.Compiler.Elab.Term.inferAnn", "Vuna/Compiler/Elab/Term.vuna:156"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckType", ("Vuna.Compiler.Elab.Term.checkType", "Vuna/Compiler/Elab/Term.vuna:159"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferAppUnderType", ("Vuna.Compiler.Elab.Term.inferAppUnderType", "Vuna/Compiler/Elab/Term.vuna:162"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferArgs", ("Vuna.Compiler.Elab.Term.inferArgs", "Vuna/Compiler/Elab/Term.vuna:165"));
  ("v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDom", ("Vuna.Compiler.Elab.Term.constrainDictDom", "Vuna/Compiler/Elab/Term.vuna:168"));
  ("v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDomGoK", ("Vuna.Compiler.Elab.Term.constrainDictDomGoK", "Vuna/Compiler/Elab/Term.vuna:171"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferApp", ("Vuna.Compiler.Elab.Term.inferApp", "Vuna/Compiler/Elab/Term.vuna:174"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneral", ("Vuna.Compiler.Elab.Term.inferAppGeneral", "Vuna/Compiler/Elab/Term.vuna:177"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneralGo", ("Vuna.Compiler.Elab.Term.inferAppGeneralGo", "Vuna/Compiler/Elab/Term.vuna:180"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckCondBool", ("Vuna.Compiler.Elab.Term.checkCondBool", "Vuna/Compiler/Elab/Term.vuna:183"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferE", ("Vuna.Compiler.Elab.Term.inferE", "Vuna/Compiler/Elab/Term.vuna:186"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferCaseE", ("Vuna.Compiler.Elab.Term.inferCaseE", "Vuna/Compiler/Elab/Term.vuna:189"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckCase", ("Vuna.Compiler.Elab.Term.checkCase", "Vuna/Compiler/Elab/Term.vuna:192"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckCaseFam", ("Vuna.Compiler.Elab.Term.checkCaseFam", "Vuna/Compiler/Elab/Term.vuna:195"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckCaseOf", ("Vuna.Compiler.Elab.Term.checkCaseOf", "Vuna/Compiler/Elab/Term.vuna:198"));
  ("v_Vuna_dCompiler_dElab_dTerm_delabCaseAlts", ("Vuna.Compiler.Elab.Term.elabCaseAlts", "Vuna/Compiler/Elab/Term.vuna:201"));
  ("v_Vuna_dCompiler_dElab_dTerm_delabConAlt", ("Vuna.Compiler.Elab.Term.elabConAlt", "Vuna/Compiler/Elab/Term.vuna:204"));
  ("v_Vuna_dCompiler_dElab_dTerm_dresolveOverFunPats", ("Vuna.Compiler.Elab.Term.resolveOverFunPats", "Vuna/Compiler/Elab/Term.vuna:209"));
  ("v_Vuna_dCompiler_dElab_dData_delabCtor", ("Vuna.Compiler.Elab.Data.elabCtor", "Vuna/Compiler/Elab/Data.vuna:46"));
  ("v_Vuna_dCompiler_dElab_dData_delabCtors", ("Vuna.Compiler.Elab.Data.elabCtors", "Vuna/Compiler/Elab/Data.vuna:69"));
  ("v_Vuna_dCompiler_dElab_dData_dkindResultLevel", ("Vuna.Compiler.Elab.Data.kindResultLevel", "Vuna/Compiler/Elab/Data.vuna:81"));
  ("v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts", ("Vuna.Compiler.Elab.Data.checkCtorFieldSorts", "Vuna/Compiler/Elab/Data.vuna:92"));
  ("v_Vuna_dCompiler_dElab_dData_dcountSurfacePis", ("Vuna.Compiler.Elab.Data.countSurfacePis", "Vuna/Compiler/Elab/Data.vuna:103"));
  ("v_Vuna_dCompiler_dElab_dData_dcountTelePis", ("Vuna.Compiler.Elab.Data.countTelePis", "Vuna/Compiler/Elab/Data.vuna:109"));
  ("v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo", ("Vuna.Compiler.Elab.Data.ctorFieldSortsGo", "Vuna/Compiler/Elab/Data.vuna:113"));
  ("v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder", ("Vuna.Compiler.Elab.Data.ctorFieldSortsBinder", "Vuna/Compiler/Elab/Data.vuna:120"));
  ("v_Vuna_dCompiler_dElab_dData_delabDataHead", ("Vuna.Compiler.Elab.Data.elabDataHead", "Vuna/Compiler/Elab/Data.vuna:139"));
  ("v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound", ("Vuna.Compiler.Elab.Data.elabDataHeadsRound", "Vuna/Compiler/Elab/Data.vuna:166"));
  ("v_Vuna_dCompiler_dElab_dData_delabDataHeads", ("Vuna.Compiler.Elab.Data.elabDataHeads", "Vuna/Compiler/Elab/Data.vuna:173"));
  ("v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel", ("Vuna.Compiler.Elab.Data.elabDataHeadsFuel", "Vuna/Compiler/Elab/Data.vuna:176"));
  ("v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress", ("Vuna.Compiler.Elab.Data.elabDataHeadsNoProgress", "Vuna/Compiler/Elab/Data.vuna:188"));
  ("v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecord", ("Vuna.Compiler.Elab.Data.dtFieldsOfRecord", "Vuna/Compiler/Elab/Data.vuna:197"));
  ("v_Vuna_dCompiler_dElab_dData_dskipParamPis", ("Vuna.Compiler.Elab.Data.skipParamPis", "Vuna/Compiler/Elab/Data.vuna:204"));
  ("v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecordGo", ("Vuna.Compiler.Elab.Data.dtFieldsOfRecordGo", "Vuna/Compiler/Elab/Data.vuna:208"));
  ("v_Vuna_dCompiler_dElab_dData_delabDataBodies", ("Vuna.Compiler.Elab.Data.elabDataBodies", "Vuna/Compiler/Elab/Data.vuna:216"));
  ("v_Vuna_dCompiler_dElab_dData_dsameCtorSet", ("Vuna.Compiler.Elab.Data.sameCtorSet", "Vuna/Compiler/Elab/Data.vuna:279"));
  ("v_Vuna_dCompiler_dElab_dData_dallIn", ("Vuna.Compiler.Elab.Data.allIn", "Vuna/Compiler/Elab/Data.vuna:282"));
  ("v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls", ("Vuna.Compiler.Elab.Data.checkViaDataDecls", "Vuna/Compiler/Elab/Data.vuna:289"));
  ("v_Vuna_dCompiler_dElab_dData_dviaFieldOk", ("Vuna.Compiler.Elab.Data.viaFieldOk", "Vuna/Compiler/Elab/Data.vuna:307"));
  ("v_Vuna_dCompiler_dElab_dData_dreprIsTransparent", ("Vuna.Compiler.Elab.Data.reprIsTransparent", "Vuna/Compiler/Elab/Data.vuna:313"));
  ("v_Vuna_dCompiler_dElab_dData_dviaShapeOk", ("Vuna.Compiler.Elab.Data.viaShapeOk", "Vuna/Compiler/Elab/Data.vuna:320"));
  ("v_Vuna_dCompiler_dElab_dData_delabDatas", ("Vuna.Compiler.Elab.Data.elabDatas", "Vuna/Compiler/Elab/Data.vuna:330"));
  ("v_Vuna_dCompiler_dElab_dData_deraseIndexMask", ("Vuna.Compiler.Elab.Data.eraseIndexMask", "Vuna/Compiler/Elab/Data.vuna:347"));
  ("v_Vuna_dCompiler_dElab_dData_deraseMaskGo", ("Vuna.Compiler.Elab.Data.eraseMaskGo", "Vuna/Compiler/Elab/Data.vuna:350"));
  ("v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys", ("Vuna.Compiler.Elab.Data.paramUsedInFieldTys", "Vuna/Compiler/Elab/Data.vuna:355"));
  ("v_Vuna_dCompiler_dElab_dData_dusedInCtors", ("Vuna.Compiler.Elab.Data.usedInCtors", "Vuna/Compiler/Elab/Data.vuna:358"));
  ("v_Vuna_dCompiler_dElab_dData_dusedInCtor", ("Vuna.Compiler.Elab.Data.usedInCtor", "Vuna/Compiler/Elab/Data.vuna:362"));
  ("v_Vuna_dCompiler_dElab_dData_dctorFieldTerms", ("Vuna.Compiler.Elab.Data.ctorFieldTerms", "Vuna/Compiler/Elab/Data.vuna:366"));
  ("v_Vuna_dCompiler_dElab_dData_dctorFieldGo", ("Vuna.Compiler.Elab.Data.ctorFieldGo", "Vuna/Compiler/Elab/Data.vuna:369"));
  ("v_Vuna_dCompiler_dElab_dData_dusedInTele", ("Vuna.Compiler.Elab.Data.usedInTele", "Vuna/Compiler/Elab/Data.vuna:374"));
  ("v_Vuna_dCompiler_dElab_dData_dusedInTeleGo", ("Vuna.Compiler.Elab.Data.usedInTeleGo", "Vuna/Compiler/Elab/Data.vuna:377"));
  ("v_Vuna_dCompiler_dElab_dData_dtermUsesVar", ("Vuna.Compiler.Elab.Data.termUsesVar", "Vuna/Compiler/Elab/Data.vuna:381"));
  ("v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs", ("Vuna.Compiler.Elab.Data.termUsesVarArgs", "Vuna/Compiler/Elab/Data.vuna:404"));
  ("v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts", ("Vuna.Compiler.Elab.Data.termUsesVarAlts", "Vuna/Compiler/Elab/Data.vuna:408"));
  ("v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates", ("Vuna.Compiler.Elab.Data.indexErasureCandidates", "Vuna/Compiler/Elab/Data.vuna:414"));
  ("v_Vuna_dCompiler_dElab_dData_dcandidateOf", ("Vuna.Compiler.Elab.Data.candidateOf", "Vuna/Compiler/Elab/Data.vuna:418"));
  ("v_Vuna_dCompiler_dElab_dData_dcandidateNames", ("Vuna.Compiler.Elab.Data.candidateNames", "Vuna/Compiler/Elab/Data.vuna:421"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dfindInstanceClash", ("Vuna.Compiler.Elab.InstCoherence.findInstanceClash", "Vuna/Compiler/Elab/InstCoherence.vuna:43"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceExact", ("Vuna.Compiler.Elab.InstCoherence.anyInstanceExact", "Vuna/Compiler/Elab/InstCoherence.vuna:49"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap", ("Vuna.Compiler.Elab.InstCoherence.anyInstanceOverlap", "Vuna/Compiler/Elab/InstCoherence.vuna:57"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dinstanceExactQuiet", ("Vuna.Compiler.Elab.InstCoherence.instanceExactQuiet", "Vuna/Compiler/Elab/InstCoherence.vuna:66"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dheadsAlphaEqual", ("Vuna.Compiler.Elab.InstCoherence.headsAlphaEqual", "Vuna/Compiler/Elab/InstCoherence.vuna:71"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnv", ("Vuna.Compiler.Elab.InstCoherence.teleAlphaEnv", "Vuna/Compiler/Elab/InstCoherence.vuna:76"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnvGo", ("Vuna.Compiler.Elab.InstCoherence.teleAlphaEnvGo", "Vuna/Compiler/Elab/InstCoherence.vuna:79"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlap", ("Vuna.Compiler.Elab.InstCoherence.headsOverlap", "Vuna/Compiler/Elab/InstCoherence.vuna:86"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlapOne", ("Vuna.Compiler.Elab.InstCoherence.headsOverlapOne", "Vuna/Compiler/Elab/InstCoherence.vuna:94"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnv", ("Vuna.Compiler.Elab.InstCoherence.teleGlobalEnv", "Vuna/Compiler/Elab/InstCoherence.vuna:104"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnvGo", ("Vuna.Compiler.Elab.InstCoherence.teleGlobalEnvGo", "Vuna/Compiler/Elab/InstCoherence.vuna:107"));
  ("v_Vuna_dCompiler_dElab_dInstName_dinstanceHeadName", ("Vuna.Compiler.Elab.InstName.instanceHeadName", "Vuna/Compiler/Elab/InstName.vuna:21"));
  ("v_Vuna_dCompiler_dElab_dInstName_dinstanceName", ("Vuna.Compiler.Elab.InstName.instanceName", "Vuna/Compiler/Elab/InstName.vuna:39"));
  ("v_Vuna_dCompiler_dElab_dInstName_dsanitizeInstName", ("Vuna.Compiler.Elab.InstName.sanitizeInstName", "Vuna/Compiler/Elab/InstName.vuna:45"));
  ("v_Vuna_dCompiler_dElab_dInstName_dderivedInstName", ("Vuna.Compiler.Elab.InstName.derivedInstName", "Vuna/Compiler/Elab/InstName.vuna:50"));
  ("v_Vuna_dCompiler_dElab_dInstName_dargSuffixTail", ("Vuna.Compiler.Elab.InstName.argSuffixTail", "Vuna/Compiler/Elab/InstName.vuna:55"));
  ("v_Vuna_dCompiler_dElab_dInstName_dargSuffix", ("Vuna.Compiler.Elab.InstName.argSuffix", "Vuna/Compiler/Elab/InstName.vuna:60"));
  ("v_Vuna_dCompiler_dElab_dInstName_dexprNameFor", ("Vuna.Compiler.Elab.InstName.exprNameFor", "Vuna/Compiler/Elab/InstName.vuna:66"));
  ("v_Vuna_dCompiler_dElab_dInstName_dargNameOf", ("Vuna.Compiler.Elab.InstName.argNameOf", "Vuna/Compiler/Elab/InstName.vuna:76"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbindClassParams", ("Vuna.Compiler.Elab.Trait.bindClassParams", "Vuna/Compiler/Elab/Trait.vuna:88"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys", ("Vuna.Compiler.Elab.Trait.classFieldTys", "Vuna/Compiler/Elab/Trait.vuna:93"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo", ("Vuna.Compiler.Elab.Trait.classFieldTysGo", "Vuna/Compiler/Elab/Trait.vuna:97"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef", ("Vuna.Compiler.Elab.Trait.foldlAddDef", "Vuna/Compiler/Elab/Trait.vuna:106"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys", ("Vuna.Compiler.Elab.Trait.foldPiFieldTys", "Vuna/Compiler/Elab/Trait.vuna:114"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo", ("Vuna.Compiler.Elab.Trait.foldPiFieldTysGo", "Vuna/Compiler/Elab/Trait.vuna:117"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabTrait", ("Vuna.Compiler.Elab.Trait.elabTrait", "Vuna/Compiler/Elab/Trait.vuna:125"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabTraitKinds", ("Vuna.Compiler.Elab.Trait.elabTraitKinds", "Vuna/Compiler/Elab/Trait.vuna:137"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabTraitFinal", ("Vuna.Compiler.Elab.Trait.elabTraitFinal", "Vuna/Compiler/Elab/Trait.vuna:145"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclassParamKinds", ("Vuna.Compiler.Elab.Trait.classParamKinds", "Vuna/Compiler/Elab/Trait.vuna:172"));
  ("v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames", ("Vuna.Compiler.Elab.Trait.traitParamNames", "Vuna/Compiler/Elab/Trait.vuna:177"));
  ("v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds", ("Vuna.Compiler.Elab.Trait.traitParamKinds", "Vuna/Compiler/Elab/Trait.vuna:181"));
  ("v_Vuna_dCompiler_dElab_dTrait_dtraitKindExplicit", ("Vuna.Compiler.Elab.Trait.traitKindExplicit", "Vuna/Compiler/Elab/Trait.vuna:187"));
  ("v_Vuna_dCompiler_dElab_dTrait_dtraitKindInfer", ("Vuna.Compiler.Elab.Trait.traitKindInfer", "Vuna/Compiler/Elab/Trait.vuna:194"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis", ("Vuna.Compiler.Elab.Trait.foldParamPis", "Vuna/Compiler/Elab/Trait.vuna:200"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf", ("Vuna.Compiler.Elab.Trait.dictAppTermOf", "Vuna/Compiler/Elab/Trait.vuna:205"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs", ("Vuna.Compiler.Elab.Trait.dictParamArgs", "Vuna/Compiler/Elab/Trait.vuna:208"));
  ("v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs", ("Vuna.Compiler.Elab.Trait.traitMethodPairs", "Vuna/Compiler/Elab/Trait.vuna:213"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmethodProjections", ("Vuna.Compiler.Elab.Trait.methodProjections", "Vuna/Compiler/Elab/Trait.vuna:224"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip", ("Vuna.Compiler.Elab.Trait.methodProjZip", "Vuna/Compiler/Elab/Trait.vuna:228"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmethodProjType", ("Vuna.Compiler.Elab.Trait.methodProjType", "Vuna/Compiler/Elab/Trait.vuna:236"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionBody", ("Vuna.Compiler.Elab.Trait.projectionBody", "Vuna/Compiler/Elab/Trait.vuna:249"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionBodyOpaque", ("Vuna.Compiler.Elab.Trait.projectionBodyOpaque", "Vuna/Compiler/Elab/Trait.vuna:257"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams", ("Vuna.Compiler.Elab.Trait.projectionParamLams", "Vuna/Compiler/Elab/Trait.vuna:274"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionParamNames", ("Vuna.Compiler.Elab.Trait.projectionParamNames", "Vuna/Compiler/Elab/Trait.vuna:278"));
  ("v_Vuna_dCompiler_dElab_dTrait_dexplicitPiArity", ("Vuna.Compiler.Elab.Trait.explicitPiArity", "Vuna/Compiler/Elab/Trait.vuna:281"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs", ("Vuna.Compiler.Elab.Trait.projectionDefs", "Vuna/Compiler/Elab/Trait.vuna:287"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaque", ("Vuna.Compiler.Elab.Trait.projectionDefsOpaque", "Vuna/Compiler/Elab/Trait.vuna:292"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo", ("Vuna.Compiler.Elab.Trait.projectionDefsOpaqueGo", "Vuna/Compiler/Elab/Trait.vuna:296"));
  ("v_Vuna_dCompiler_dElab_dTrait_dflagAt", ("Vuna.Compiler.Elab.Trait.flagAt", "Vuna/Compiler/Elab/Trait.vuna:303"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo", ("Vuna.Compiler.Elab.Trait.projectionDefsGo", "Vuna/Compiler/Elab/Trait.vuna:307"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddeclTopName", ("Vuna.Compiler.Elab.Trait.declTopName", "Vuna/Compiler/Elab/Trait.vuna:317"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile", ("Vuna.Compiler.Elab.Trait.declNamedInFile", "Vuna/Compiler/Elab/Trait.vuna:323"));
  ("v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf", ("Vuna.Compiler.Elab.Trait.headTypeNameOf", "Vuna/Compiler/Elab/Trait.vuna:329"));
  ("v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf", ("Vuna.Compiler.Elab.Trait.headTypeNamesOf", "Vuna/Compiler/Elab/Trait.vuna:334"));
  ("v_Vuna_dCompiler_dElab_dTrait_disGlobalHeadType", ("Vuna.Compiler.Elab.Trait.isGlobalHeadType", "Vuna/Compiler/Elab/Trait.vuna:343"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTypeNames", ("Vuna.Compiler.Elab.Trait.instanceHeadTypeNames", "Vuna/Compiler/Elab/Trait.vuna:346"));
  ("v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile", ("Vuna.Compiler.Elab.Trait.anyDeclInFile", "Vuna/Compiler/Elab/Trait.vuna:351"));
  ("v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead", ("Vuna.Compiler.Elab.Trait.anyGlobalHead", "Vuna/Compiler/Elab/Trait.vuna:356"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceLandingOk", ("Vuna.Compiler.Elab.Trait.instanceLandingOk", "Vuna/Compiler/Elab/Trait.vuna:360"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceWithClass", ("Vuna.Compiler.Elab.Trait.elabInstanceWithClass", "Vuna/Compiler/Elab/Trait.vuna:370"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstance", ("Vuna.Compiler.Elab.Trait.elabInstance", "Vuna/Compiler/Elab/Trait.vuna:408"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts", ("Vuna.Compiler.Elab.Trait.instanceHeadParts", "Vuna/Compiler/Elab/Trait.vuna:420"));
  ("v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf", ("Vuna.Compiler.Elab.Trait.constraintPartsOf", "Vuna/Compiler/Elab/Trait.vuna:427"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts", ("Vuna.Compiler.Elab.Trait.instanceConstraintParts", "Vuna/Compiler/Elab/Trait.vuna:434"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstSigClass", ("Vuna.Compiler.Elab.Trait.instSigClass", "Vuna/Compiler/Elab/Trait.vuna:449"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstSigTele", ("Vuna.Compiler.Elab.Trait.instSigTele", "Vuna/Compiler/Elab/Trait.vuna:452"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx", ("Vuna.Compiler.Elab.Trait.instSigCtx", "Vuna/Compiler/Elab/Trait.vuna:455"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs", ("Vuna.Compiler.Elab.Trait.instSigArgs", "Vuna/Compiler/Elab/Trait.vuna:458"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstSigHead", ("Vuna.Compiler.Elab.Trait.instSigHead", "Vuna/Compiler/Elab/Trait.vuna:461"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig", ("Vuna.Compiler.Elab.Trait.elabInstanceSig", "Vuna/Compiler/Elab/Trait.vuna:469"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained", ("Vuna.Compiler.Elab.Trait.elabInstanceConstrained", "Vuna/Compiler/Elab/Trait.vuna:495"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds", ("Vuna.Compiler.Elab.Trait.checkArgsAtKinds", "Vuna/Compiler/Elab/Trait.vuna:523"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerms", ("Vuna.Compiler.Elab.Trait.closedTypeTerms", "Vuna/Compiler/Elab/Trait.vuna:535"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm", ("Vuna.Compiler.Elab.Trait.closedTypeTerm", "Vuna/Compiler/Elab/Trait.vuna:543"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs", ("Vuna.Compiler.Elab.Trait.closedTypeArgs", "Vuna/Compiler/Elab/Trait.vuna:552"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceMono", ("Vuna.Compiler.Elab.Trait.instanceMono", "Vuna/Compiler/Elab/Trait.vuna:561"));
  ("v_Vuna_dCompiler_dElab_dTrait_disLowerStart", ("Vuna.Compiler.Elab.Trait.isLowerStart", "Vuna/Compiler/Elab/Trait.vuna:566"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleMetas", ("Vuna.Compiler.Elab.Trait.instanceTeleMetas", "Vuna/Compiler/Elab/Trait.vuna:573"));
  ("v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit", ("Vuna.Compiler.Elab.Trait.teleMetasInit", "Vuna/Compiler/Elab/Trait.vuna:577"));
  ("v_Vuna_dCompiler_dElab_dTrait_dseedKindOf", ("Vuna.Compiler.Elab.Trait.seedKindOf", "Vuna/Compiler/Elab/Trait.vuna:590"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds", ("Vuna.Compiler.Elab.Trait.bareTeleSeeds", "Vuna/Compiler/Elab/Trait.vuna:596"));
  ("v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds", ("Vuna.Compiler.Elab.Trait.ctxBareTeleSeeds", "Vuna/Compiler/Elab/Trait.vuna:605"));
  ("v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds", ("Vuna.Compiler.Elab.Trait.resolveTeleKinds", "Vuna/Compiler/Elab/Trait.vuna:614"));
  ("v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKind", ("Vuna.Compiler.Elab.Trait.resolveTeleKind", "Vuna/Compiler/Elab/Trait.vuna:619"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind", ("Vuna.Compiler.Elab.Trait.fallbackTeleKind", "Vuna/Compiler/Elab/Trait.vuna:629"));
  ("v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower", ("Vuna.Compiler.Elab.Trait.exprFreeLower", "Vuna/Compiler/Elab/Trait.vuna:632"));
  ("v_Vuna_dCompiler_dElab_dTrait_duniqNames", ("Vuna.Compiler.Elab.Trait.uniqNames", "Vuna/Compiler/Elab/Trait.vuna:639"));
  ("v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned", ("Vuna.Compiler.Elab.Trait.keepOutBanned", "Vuna/Compiler/Elab/Trait.vuna:643"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx", ("Vuna.Compiler.Elab.Trait.instanceTeleCtx", "Vuna/Compiler/Elab/Trait.vuna:650"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo", ("Vuna.Compiler.Elab.Trait.instanceTeleCtxGo", "Vuna/Compiler/Elab/Trait.vuna:653"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains", ("Vuna.Compiler.Elab.Trait.elabConstraintDomains", "Vuna/Compiler/Elab/Trait.vuna:659"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx", ("Vuna.Compiler.Elab.Trait.instBodyCtx", "Vuna/Compiler/Elab/Trait.vuna:676"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo", ("Vuna.Compiler.Elab.Trait.instBodyCtxGo", "Vuna/Compiler/Elab/Trait.vuna:679"));
  ("v_Vuna_dCompiler_dElab_dTrait_dctxDictName", ("Vuna.Compiler.Elab.Trait.ctxDictName", "Vuna/Compiler/Elab/Trait.vuna:684"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstValueOf", ("Vuna.Compiler.Elab.Trait.instValueOf", "Vuna/Compiler/Elab/Trait.vuna:688"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam", ("Vuna.Compiler.Elab.Trait.instTeleLam", "Vuna/Compiler/Elab/Trait.vuna:694"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam", ("Vuna.Compiler.Elab.Trait.instCtxLam", "Vuna/Compiler/Elab/Trait.vuna:698"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo", ("Vuna.Compiler.Elab.Trait.instCtxLamGo", "Vuna/Compiler/Elab/Trait.vuna:701"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf", ("Vuna.Compiler.Elab.Trait.instTypeOf", "Vuna/Compiler/Elab/Trait.vuna:707"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx", ("Vuna.Compiler.Elab.Trait.instTypeCtx", "Vuna/Compiler/Elab/Trait.vuna:715"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele", ("Vuna.Compiler.Elab.Trait.instTypeTele", "Vuna/Compiler/Elab/Trait.vuna:720"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm", ("Vuna.Compiler.Elab.Trait.instanceHeadTerm", "Vuna/Compiler/Elab/Trait.vuna:726"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod", ("Vuna.Compiler.Elab.Trait.firstUnknownInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:732"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo", ("Vuna.Compiler.Elab.Trait.firstUnknownInstanceMethodGo", "Vuna/Compiler/Elab/Trait.vuna:736"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod", ("Vuna.Compiler.Elab.Trait.firstMissingInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:745"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo", ("Vuna.Compiler.Elab.Trait.firstMissingInstanceMethodGo", "Vuna/Compiler/Elab/Trait.vuna:748"));
  ("v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses", ("Vuna.Compiler.Elab.Trait.hasMethodClauses", "Vuna/Compiler/Elab/Trait.vuna:754"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl", ("Vuna.Compiler.Elab.Trait.findTraitDecl", "Vuna/Compiler/Elab/Trait.vuna:764"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan", ("Vuna.Compiler.Elab.Trait.findTraitMethodSpan", "Vuna/Compiler/Elab/Trait.vuna:770"));
  ("v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf", ("Vuna.Compiler.Elab.Trait.traitMethodSpanOf", "Vuna/Compiler/Elab/Trait.vuna:775"));
  ("v_Vuna_dCompiler_dElab_dTrait_dctorResultType", ("Vuna.Compiler.Elab.Trait.ctorResultType", "Vuna/Compiler/Elab/Trait.vuna:781"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfindClass", ("Vuna.Compiler.Elab.Trait.findClass", "Vuna/Compiler/Elab/Trait.vuna:785"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx", ("Vuna.Compiler.Elab.Trait.elabInstanceMethodsCtx", "Vuna/Compiler/Elab/Trait.vuna:792"));
  ("v_Vuna_dCompiler_dElab_dTrait_dzipClassFields", ("Vuna.Compiler.Elab.Trait.zipClassFields", "Vuna/Compiler/Elab/Trait.vuna:797"));
  ("v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields", ("Vuna.Compiler.Elab.Trait.zipMethodFields", "Vuna/Compiler/Elab/Trait.vuna:800"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams", ("Vuna.Compiler.Elab.Trait.substInstParams", "Vuna/Compiler/Elab/Trait.vuna:809"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo", ("Vuna.Compiler.Elab.Trait.substInstParamsGo", "Vuna/Compiler/Elab/Trait.vuna:812"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsAlt", ("Vuna.Compiler.Elab.Trait.substInstParamsAlt", "Vuna/Compiler/Elab/Trait.vuna:834"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstArgAt", ("Vuna.Compiler.Elab.Trait.instArgAt", "Vuna/Compiler/Elab/Trait.vuna:838"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo", ("Vuna.Compiler.Elab.Trait.elabInstanceMethodsGo", "Vuna/Compiler/Elab/Trait.vuna:842"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed", ("Vuna.Compiler.Elab.Trait.methodClausesNamed", "Vuna/Compiler/Elab/Trait.vuna:859"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo", ("Vuna.Compiler.Elab.Trait.methodClausesGo", "Vuna/Compiler/Elab/Trait.vuna:862"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn", ("Vuna.Compiler.Elab.Trait.elabInstanceMethodIn", "Vuna/Compiler/Elab/Trait.vuna:874"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod", ("Vuna.Compiler.Elab.Trait.elabInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:878"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals", ("Vuna.Compiler.Elab.Trait.solveCtxGoals", "Vuna/Compiler/Elab/Trait.vuna:887"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo", ("Vuna.Compiler.Elab.Trait.solveCtxGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:890"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx", ("Vuna.Compiler.Elab.Trait.matchCtxDictIdx", "Vuna/Compiler/Elab/Trait.vuna:904"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo", ("Vuna.Compiler.Elab.Trait.matchCtxDictIdxGo", "Vuna/Compiler/Elab/Trait.vuna:907"));
  ("v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual", ("Vuna.Compiler.Elab.Trait.ctxDictDomEqual", "Vuna/Compiler/Elab/Trait.vuna:915"));
  ("v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo", ("Vuna.Compiler.Elab.Trait.applyCtxSubstsTo", "Vuna/Compiler/Elab/Trait.vuna:922"));
  ("v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals", ("Vuna.Compiler.Elab.Trait.resolveRigidGoals", "Vuna/Compiler/Elab/Trait.vuna:929"));
  ("v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo", ("Vuna.Compiler.Elab.Trait.resolveRigidGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:932"));
  ("v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo", ("Vuna.Compiler.Elab.Trait.applyTermSubstsTo", "Vuna/Compiler/Elab/Trait.vuna:945"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm", ("Vuna.Compiler.Elab.Trait.substMetaTerm", "Vuna/Compiler/Elab/Trait.vuna:950"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo", ("Vuna.Compiler.Elab.Trait.substMetaTermGo", "Vuna/Compiler/Elab/Trait.vuna:953"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt", ("Vuna.Compiler.Elab.Trait.substMetaTermAlt", "Vuna/Compiler/Elab/Trait.vuna:973"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf", ("Vuna.Compiler.Elab.Trait.clauseSpanOf", "Vuna/Compiler/Elab/Trait.vuna:977"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals", ("Vuna.Compiler.Elab.Trait.freeDictGoals", "Vuna/Compiler/Elab/Trait.vuna:995"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo", ("Vuna.Compiler.Elab.Trait.freeDictGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:998"));
  ("v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup", ("Vuna.Compiler.Elab.Trait.addDictGoalGroup", "Vuna/Compiler/Elab/Trait.vuna:1009"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual", ("Vuna.Compiler.Elab.Trait.domainsEqual", "Vuna/Compiler/Elab/Trait.vuna:1015"));
  ("v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount", ("Vuna.Compiler.Elab.Trait.leadingImplicitCount", "Vuna/Compiler/Elab/Trait.vuna:1021"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta", ("Vuna.Compiler.Elab.Trait.solveLiftedMeta", "Vuna/Compiler/Elab/Trait.vuna:1028"));
  ("v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals", ("Vuna.Compiler.Elab.Trait.liftFreeDictGoals", "Vuna/Compiler/Elab/Trait.vuna:1034"));
  ("v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo", ("Vuna.Compiler.Elab.Trait.liftFreeDictGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:1049"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas", ("Vuna.Compiler.Elab.Trait.substExtraDictMetas", "Vuna/Compiler/Elab/Trait.vuna:1077"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas", ("Vuna.Compiler.Elab.Trait.solveLiftedMetas", "Vuna/Compiler/Elab/Trait.vuna:1082"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls", ("Vuna.Compiler.Elab.Trait.insertDictCalls", "Vuna/Compiler/Elab/Trait.vuna:1090"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo", ("Vuna.Compiler.Elab.Trait.injectDictGo", "Vuna/Compiler/Elab/Trait.vuna:1093"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel", ("Vuna.Compiler.Elab.Trait.injectDictGoFuel", "Vuna/Compiler/Elab/Trait.vuna:1096"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo", ("Vuna.Compiler.Elab.Trait.injectAltGo", "Vuna/Compiler/Elab/Trait.vuna:1126"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel", ("Vuna.Compiler.Elab.Trait.injectAltGoFuel", "Vuna/Compiler/Elab/Trait.vuna:1129"));
  ("v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine", ("Vuna.Compiler.Elab.Trait.rewriteTaggedSpine", "Vuna/Compiler/Elab/Trait.vuna:1135"));
  ("v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel", ("Vuna.Compiler.Elab.Trait.rewriteTaggedSpineFuel", "Vuna/Compiler/Elab/Trait.vuna:1139"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt", ("Vuna.Compiler.Elab.Trait.insertArgAt", "Vuna/Compiler/Elab/Trait.vuna:1151"));
  ("v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType", ("Vuna.Compiler.Elab.Trait.replaceGlobalType", "Vuna/Compiler/Elab/Trait.vuna:1155"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst", ("Vuna.Compiler.Elab.Trait.foldlAddInst", "Vuna/Compiler/Elab/Trait.vuna:1162"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads", ("Vuna.Compiler.Elab.Trait.checkInstanceHeads", "Vuna/Compiler/Elab/Trait.vuna:1170"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo", ("Vuna.Compiler.Elab.Trait.checkInstanceHeadsGo", "Vuna/Compiler/Elab/Trait.vuna:1173"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies", ("Vuna.Compiler.Elab.Trait.elabInstanceBodies", "Vuna/Compiler/Elab/Trait.vuna:1195"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo", ("Vuna.Compiler.Elab.Trait.elabInstanceBodiesGo", "Vuna/Compiler/Elab/Trait.vuna:1200"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf", ("Vuna.Compiler.Elab.Trait.instanceDefsOf", "Vuna/Compiler/Elab/Trait.vuna:1213"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf", ("Vuna.Compiler.Elab.Trait.defBodyOf", "Vuna/Compiler/Elab/Trait.vuna:1219"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabTraits", ("Vuna.Compiler.Elab.Trait.elabTraits", "Vuna/Compiler/Elab/Trait.vuna:1225"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo", ("Vuna.Compiler.Elab.Trait.elabTraitsGo", "Vuna/Compiler/Elab/Trait.vuna:1228"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstances", ("Vuna.Compiler.Elab.Trait.elabInstances", "Vuna/Compiler/Elab/Trait.vuna:1238"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo", ("Vuna.Compiler.Elab.Trait.elabInstancesGo", "Vuna/Compiler/Elab/Trait.vuna:1241"));
  ("v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf", ("Vuna.Compiler.Elab.Trait.extraDefsOf", "Vuna/Compiler/Elab/Trait.vuna:1252"));
  ("v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo", ("Vuna.Compiler.Elab.Trait.extraDefsGo", "Vuna/Compiler/Elab/Trait.vuna:1257"));
  ("v_Vuna_dCompiler_dElab_dTrait_dspanOfName", ("Vuna.Compiler.Elab.Trait.spanOfName", "Vuna/Compiler/Elab/Trait.vuna:1264"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl", ("Vuna.Compiler.Elab.Trait.defTypeOrDefaultTbl", "Vuna/Compiler/Elab/Trait.vuna:1268"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn", ("Vuna.Compiler.Elab.Trait.checkDefIn", "Vuna/Compiler/Elab/Trait.vuna:1276"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckDef", ("Vuna.Compiler.Elab.Trait.checkDef", "Vuna/Compiler/Elab/Trait.vuna:1280"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel", ("Vuna.Compiler.Elab.Trait.checkBindersFuel", "Vuna/Compiler/Elab/Trait.vuna:1283"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel", ("Vuna.Compiler.Elab.Trait.bindDictBinderFuel", "Vuna/Compiler/Elab/Trait.vuna:1300"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel", ("Vuna.Compiler.Elab.Trait.bindIndexBinderFuel", "Vuna/Compiler/Elab/Trait.vuna:1313"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel", ("Vuna.Compiler.Elab.Trait.checkBodyAtEndFuel", "Vuna/Compiler/Elab/Trait.vuna:1330"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel", ("Vuna.Compiler.Elab.Trait.bindOnePatternFuel", "Vuna/Compiler/Elab/Trait.vuna:1372"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn", ("Vuna.Compiler.Elab.Trait.elabFunDefIn", "Vuna/Compiler/Elab/Trait.vuna:1394"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabFunDefMulti", ("Vuna.Compiler.Elab.Trait.elabFunDefMulti", "Vuna/Compiler/Elab/Trait.vuna:1403"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabFunDef", ("Vuna.Compiler.Elab.Trait.elabFunDef", "Vuna/Compiler/Elab/Trait.vuna:1414"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckBinders", ("Vuna.Compiler.Elab.Trait.checkBinders", "Vuna/Compiler/Elab/Trait.vuna:1417"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder", ("Vuna.Compiler.Elab.Trait.bindIndexBinder", "Vuna/Compiler/Elab/Trait.vuna:1420"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern", ("Vuna.Compiler.Elab.Trait.bindOnePattern", "Vuna/Compiler/Elab/Trait.vuna:1424"));
  ("v_Vuna_dCompiler_dElab_dDerive_dtraitShortName", ("Vuna.Compiler.Elab.Derive.traitShortName", "Vuna/Compiler/Elab/Derive.vuna:30"));
  ("v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal", ("Vuna.Compiler.Elab.Derive.traitMethodGlobal", "Vuna/Compiler/Elab/Derive.vuna:35"));
  ("v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings", ("Vuna.Compiler.Elab.Derive.expandDerivings", "Vuna/Compiler/Elab/Derive.vuna:48"));
  ("v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings", ("Vuna.Compiler.Elab.Derive.collectDerivings", "Vuna/Compiler/Elab/Derive.vuna:52"));
  ("v_Vuna_dCompiler_dElab_dDerive_drecordCtorOf", ("Vuna.Compiler.Elab.Derive.recordCtorOf", "Vuna/Compiler/Elab/Derive.vuna:69"));
  ("v_Vuna_dCompiler_dElab_dDerive_drecordDerivingsFor", ("Vuna.Compiler.Elab.Derive.recordDerivingsFor", "Vuna/Compiler/Elab/Derive.vuna:74"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderivingsFor", ("Vuna.Compiler.Elab.Derive.derivingsFor", "Vuna/Compiler/Elab/Derive.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo", ("Vuna.Compiler.Elab.Derive.derivingsForGo", "Vuna/Compiler/Elab/Derive.vuna:81"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams", ("Vuna.Compiler.Elab.Derive.deriveCtxParams", "Vuna/Compiler/Elab/Derive.vuna:91"));
  ("v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions", ("Vuna.Compiler.Elab.Derive.anyCtorMentions", "Vuna/Compiler/Elab/Derive.vuna:97"));
  ("v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName", ("Vuna.Compiler.Elab.Derive.exprMentionsName", "Vuna/Compiler/Elab/Derive.vuna:101"));
  ("v_Vuna_dCompiler_dElab_dDerive_danyExprMentions", ("Vuna.Compiler.Elab.Derive.anyExprMentions", "Vuna/Compiler/Elab/Derive.vuna:108"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderiveInstance", ("Vuna.Compiler.Elab.Derive.deriveInstance", "Vuna/Compiler/Elab/Derive.vuna:115"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper", ("Vuna.Compiler.Elab.Derive.deriveWrapper", "Vuna/Compiler/Elab/Derive.vuna:164"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderiveWrapperCtor", ("Vuna.Compiler.Elab.Derive.deriveWrapperCtor", "Vuna/Compiler/Elab/Derive.vuna:173"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypes", ("Vuna.Compiler.Elab.Derive.deriveFieldTypes", "Vuna/Compiler/Elab/Derive.vuna:186"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName", ("Vuna.Compiler.Elab.Derive.deriveFieldTypeName", "Vuna/Compiler/Elab/Derive.vuna:192"));
  ("v_Vuna_dCompiler_dElab_dDerive_dinstHead", ("Vuna.Compiler.Elab.Derive.instHead", "Vuna/Compiler/Elab/Derive.vuna:198"));
  ("v_Vuna_dCompiler_dElab_dDerive_dapplyTypeParams", ("Vuna.Compiler.Elab.Derive.applyTypeParams", "Vuna/Compiler/Elab/Derive.vuna:202"));
  ("v_Vuna_dCompiler_dElab_dDerive_dshowBody", ("Vuna.Compiler.Elab.Derive.showBody", "Vuna/Compiler/Elab/Derive.vuna:209"));
  ("v_Vuna_dCompiler_dElab_dDerive_dshowAlts", ("Vuna.Compiler.Elab.Derive.showAlts", "Vuna/Compiler/Elab/Derive.vuna:212"));
  ("v_Vuna_dCompiler_dElab_dDerive_dshowCtor", ("Vuna.Compiler.Elab.Derive.showCtor", "Vuna/Compiler/Elab/Derive.vuna:222"));
  ("v_Vuna_dCompiler_dElab_dDerive_dshowFields", ("Vuna.Compiler.Elab.Derive.showFields", "Vuna/Compiler/Elab/Derive.vuna:227"));
  ("v_Vuna_dCompiler_dElab_dDerive_dshowOne", ("Vuna.Compiler.Elab.Derive.showOne", "Vuna/Compiler/Elab/Derive.vuna:235"));
  ("v_Vuna_dCompiler_dElab_dDerive_dhashBody", ("Vuna.Compiler.Elab.Derive.hashBody", "Vuna/Compiler/Elab/Derive.vuna:244"));
  ("v_Vuna_dCompiler_dElab_dDerive_dhashAlts", ("Vuna.Compiler.Elab.Derive.hashAlts", "Vuna/Compiler/Elab/Derive.vuna:248"));
  ("v_Vuna_dCompiler_dElab_dDerive_dhashFields", ("Vuna.Compiler.Elab.Derive.hashFields", "Vuna/Compiler/Elab/Derive.vuna:258"));
  ("v_Vuna_dCompiler_dElab_dDerive_deqBody", ("Vuna.Compiler.Elab.Derive.eqBody", "Vuna/Compiler/Elab/Derive.vuna:268"));
  ("v_Vuna_dCompiler_dElab_dDerive_deqAlt", ("Vuna.Compiler.Elab.Derive.eqAlt", "Vuna/Compiler/Elab/Derive.vuna:271"));
  ("v_Vuna_dCompiler_dElab_dDerive_deqInner", ("Vuna.Compiler.Elab.Derive.eqInner", "Vuna/Compiler/Elab/Derive.vuna:279"));
  ("v_Vuna_dCompiler_dElab_dDerive_dconjFields", ("Vuna.Compiler.Elab.Derive.conjFields", "Vuna/Compiler/Elab/Derive.vuna:286"));
  ("v_Vuna_dCompiler_dElab_dDerive_dneqBody", ("Vuna.Compiler.Elab.Derive.neqBody", "Vuna/Compiler/Elab/Derive.vuna:294"));
  ("v_Vuna_dCompiler_dElab_dDerive_dordBody", ("Vuna.Compiler.Elab.Derive.ordBody", "Vuna/Compiler/Elab/Derive.vuna:301"));
  ("v_Vuna_dCompiler_dElab_dDerive_dordAlts", ("Vuna.Compiler.Elab.Derive.ordAlts", "Vuna/Compiler/Elab/Derive.vuna:304"));
  ("v_Vuna_dCompiler_dElab_dDerive_dordInner", ("Vuna.Compiler.Elab.Derive.ordInner", "Vuna/Compiler/Elab/Derive.vuna:314"));
  ("v_Vuna_dCompiler_dElab_dDerive_dordInnerGo", ("Vuna.Compiler.Elab.Derive.ordInnerGo", "Vuna/Compiler/Elab/Derive.vuna:317"));
  ("v_Vuna_dCompiler_dElab_dDerive_dltFields", ("Vuna.Compiler.Elab.Derive.ltFields", "Vuna/Compiler/Elab/Derive.vuna:330"));
  ("v_Vuna_dCompiler_dElab_dDerive_dleBody", ("Vuna.Compiler.Elab.Derive.leBody", "Vuna/Compiler/Elab/Derive.vuna:343"));
  ("v_Vuna_dCompiler_dElab_dDerive_dvarNames", ("Vuna.Compiler.Elab.Derive.varNames", "Vuna/Compiler/Elab/Derive.vuna:349"));
  ("v_Vuna_dCompiler_dElab_dDerive_dvarNamesAt", ("Vuna.Compiler.Elab.Derive.varNamesAt", "Vuna/Compiler/Elab/Derive.vuna:352"));
  ("v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo", ("Vuna.Compiler.Elab.Derive.varNamesAtGo", "Vuna/Compiler/Elab/Derive.vuna:355"));
  ("v_Vuna_dCompiler_dElab_dDerive_dgtBody", ("Vuna.Compiler.Elab.Derive.gtBody", "Vuna/Compiler/Elab/Derive.vuna:361"));
  ("v_Vuna_dCompiler_dElab_dDerive_dgeBody", ("Vuna.Compiler.Elab.Derive.geBody", "Vuna/Compiler/Elab/Derive.vuna:364"));
  ("v_Vuna_dCompiler_dElab_dDerive_dboolTrue", ("Vuna.Compiler.Elab.Derive.boolTrue", "Vuna/Compiler/Elab/Derive.vuna:374"));
  ("v_Vuna_dCompiler_dElab_dDerive_dboolFalse", ("Vuna.Compiler.Elab.Derive.boolFalse", "Vuna/Compiler/Elab/Derive.vuna:377"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt", ("Vuna.Compiler.Elab.Termination.Measure.maxInt", "Vuna/Compiler/Elab/Termination/Measure.vuna:102"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty", ("Vuna.Compiler.Elab.Termination.Measure.notEmpty", "Vuna/Compiler/Elab/Termination/Measure.vuna:105"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo", ("Vuna.Compiler.Elab.Termination.Measure.allEqTo", "Vuna/Compiler/Elab/Termination/Measure.vuna:109"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallSame", ("Vuna.Compiler.Elab.Termination.Measure.allSame", "Vuna/Compiler/Elab/Termination/Measure.vuna:113"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup", ("Vuna.Compiler.Elab.Termination.Measure.dedup", "Vuna/Compiler/Elab/Termination/Measure.vuna:117"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma", ("Vuna.Compiler.Elab.Termination.Measure.joinComma", "Vuna/Compiler/Elab/Termination/Measure.vuna:121"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas", ("Vuna.Compiler.Elab.Termination.Measure.posHas", "Vuna/Compiler/Elab/Termination/Measure.vuna:127"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf", ("Vuna.Compiler.Elab.Termination.Measure.posTblOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:134"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo", ("Vuna.Compiler.Elab.Termination.Measure.posTblOfGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:137"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl", ("Vuna.Compiler.Elab.Termination.Measure.posHasTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:143"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt", ("Vuna.Compiler.Elab.Termination.Measure.memInt", "Vuna/Compiler/Elab/Termination/Measure.vuna:148"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd", ("Vuna.Compiler.Elab.Termination.Measure.posAdd", "Vuna/Compiler/Elab/Termination/Measure.vuna:152"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset", ("Vuna.Compiler.Elab.Termination.Measure.posSubset", "Vuna/Compiler/Elab/Termination/Measure.vuna:155"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEq", ("Vuna.Compiler.Elab.Termination.Measure.posSetEq", "Vuna/Compiler/Elab/Termination/Measure.vuna:159"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter", ("Vuna.Compiler.Elab.Termination.Measure.posFilter", "Vuna/Compiler/Elab/Termination/Measure.vuna:162"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion", ("Vuna.Compiler.Elab.Termination.Measure.posUnion", "Vuna/Compiler/Elab/Termination/Measure.vuna:167"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl", ("Vuna.Compiler.Elab.Termination.Measure.posFilterTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:173"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl", ("Vuna.Compiler.Elab.Termination.Measure.posSubsetTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:178"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl", ("Vuna.Compiler.Elab.Termination.Measure.posSetEqTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:182"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl", ("Vuna.Compiler.Elab.Termination.Measure.posUnionTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:186"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf", ("Vuna.Compiler.Elab.Termination.Measure.funDeclsOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:189"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup", ("Vuna.Compiler.Elab.Termination.Measure.lookupGroup", "Vuna/Compiler/Elab/Termination/Measure.vuna:195"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup", ("Vuna.Compiler.Elab.Termination.Measure.replaceGroup", "Vuna/Compiler/Elab/Termination/Measure.vuna:199"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefs", ("Vuna.Compiler.Elab.Termination.Measure.groupDefs", "Vuna/Compiler/Elab/Termination/Measure.vuna:204"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo", ("Vuna.Compiler.Elab.Termination.Measure.groupDefsGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:217"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames", ("Vuna.Compiler.Elab.Termination.Measure.defNames", "Vuna/Compiler/Elab/Termination/Measure.vuna:223"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef", ("Vuna.Compiler.Elab.Termination.Measure.clausesOfDef", "Vuna/Compiler/Elab/Termination/Measure.vuna:226"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl", ("Vuna.Compiler.Elab.Termination.Measure.clausesOfDefTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:231"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity", ("Vuna.Compiler.Elab.Termination.Measure.defArity", "Vuna/Compiler/Elab/Termination/Measure.vuna:236"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf", ("Vuna.Compiler.Elab.Termination.Measure.maxArityOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:240"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf", ("Vuna.Compiler.Elab.Termination.Measure.ctorNamesOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:245"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf", ("Vuna.Compiler.Elab.Termination.Measure.ctorNameOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:253"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict", ("Vuna.Compiler.Elab.Termination.Measure.patSizeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:256"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict", ("Vuna.Compiler.Elab.Termination.Measure.patsSizeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:266"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict", ("Vuna.Compiler.Elab.Termination.Measure.fieldsSizeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:271"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries", ("Vuna.Compiler.Elab.Termination.Measure.strSizeEntries", "Vuna/Compiler/Elab/Termination/Measure.vuna:276"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo", ("Vuna.Compiler.Elab.Termination.Measure.strSizeEntriesGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:279"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict", ("Vuna.Compiler.Elab.Termination.Measure.extendSizesStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:283"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict", ("Vuna.Compiler.Elab.Termination.Measure.sizeOfVarStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:293"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar", ("Vuna.Compiler.Elab.Termination.Measure.guardPosVar", "Vuna/Compiler/Elab/Termination/Measure.vuna:301"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName", ("Vuna.Compiler.Elab.Termination.Measure.opBaseName", "Vuna/Compiler/Elab/Termination/Measure.vuna:316"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE", ("Vuna.Compiler.Elab.Termination.Measure.guardLE", "Vuna/Compiler/Elab/Termination/Measure.vuna:319"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE", ("Vuna.Compiler.Elab.Termination.Measure.guardGE", "Vuna/Compiler/Elab/Termination/Measure.vuna:325"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT", ("Vuna.Compiler.Elab.Termination.Measure.guardLT", "Vuna/Compiler/Elab/Termination/Measure.vuna:331"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr", ("Vuna.Compiler.Elab.Termination.Measure.varOfExpr", "Vuna/Compiler/Elab/Termination/Measure.vuna:337"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive", ("Vuna.Compiler.Elab.Termination.Measure.argPositive", "Vuna/Compiler/Elab/Termination/Measure.vuna:342"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos", ("Vuna.Compiler.Elab.Termination.Measure.posMarkPos", "Vuna/Compiler/Elab/Termination/Measure.vuna:358"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg", ("Vuna.Compiler.Elab.Termination.Measure.posMarkNeg", "Vuna/Compiler/Elab/Termination/Measure.vuna:361"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize", ("Vuna.Compiler.Elab.Termination.Measure.posNormalize", "Vuna/Compiler/Elab/Termination/Measure.vuna:365"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblPairs", ("Vuna.Compiler.Elab.Termination.Measure.posTblPairs", "Vuna/Compiler/Elab/Termination/Measure.vuna:368"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposEntryPairs", ("Vuna.Compiler.Elab.Termination.Measure.posEntryPairs", "Vuna/Compiler/Elab/Termination/Measure.vuna:371"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts", ("Vuna.Compiler.Elab.Termination.Measure.dedupInts", "Vuna/Compiler/Elab/Termination/Measure.vuna:374"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs", ("Vuna.Compiler.Elab.Termination.Measure.posWalkArgs", "Vuna/Compiler/Elab/Termination/Measure.vuna:378"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields", ("Vuna.Compiler.Elab.Termination.Measure.posWalkFields", "Vuna/Compiler/Elab/Termination/Measure.vuna:384"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts", ("Vuna.Compiler.Elab.Termination.Measure.posWalkAlts", "Vuna/Compiler/Elab/Termination/Measure.vuna:390"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds", ("Vuna.Compiler.Elab.Termination.Measure.posWalkBinds", "Vuna/Compiler/Elab/Termination/Measure.vuna:396"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts", ("Vuna.Compiler.Elab.Termination.Measure.posWalkStmts", "Vuna/Compiler/Elab/Termination/Measure.vuna:402"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk", ("Vuna.Compiler.Elab.Termination.Measure.posWalk", "Vuna/Compiler/Elab/Termination/Measure.vuna:412"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee", ("Vuna.Compiler.Elab.Termination.Measure.posWalkCallee", "Vuna/Compiler/Elab/Termination/Measure.vuna:458"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo", ("Vuna.Compiler.Elab.Termination.Measure.posWalkCalleeGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:462"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses", ("Vuna.Compiler.Elab.Termination.Measure.posScanClauses", "Vuna/Compiler/Elab/Termination/Measure.vuna:471"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs", ("Vuna.Compiler.Elab.Termination.Measure.posScanDefs", "Vuna/Compiler/Elab/Termination/Measure.vuna:479"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNames", ("Vuna.Compiler.Elab.Termination.Measure.posScanNames", "Vuna/Compiler/Elab/Termination/Measure.vuna:486"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo", ("Vuna.Compiler.Elab.Termination.Measure.posScanNamesGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:492"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts", ("Vuna.Compiler.Elab.Termination.Measure.computePosFacts", "Vuna/Compiler/Elab/Termination/Measure.vuna:499"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep", ("Vuna.Compiler.Elab.Termination.Measure.computePosFactsStep", "Vuna/Compiler/Elab/Termination/Measure.vuna:502"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats", ("Vuna.Compiler.Elab.Termination.Measure.pathInPats", "Vuna/Compiler/Elab/Termination/Measure.vuna:512"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields", ("Vuna.Compiler.Elab.Termination.Measure.pathInFields", "Vuna/Compiler/Elab/Termination/Measure.vuna:518"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat", ("Vuna.Compiler.Elab.Termination.Measure.pathInPat", "Vuna/Compiler/Elab/Termination/Measure.vuna:524"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef", ("Vuna.Compiler.Elab.Termination.Measure.projectionOfDef", "Vuna/Compiler/Elab/Termination/Measure.vuna:531"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf", ("Vuna.Compiler.Elab.Termination.Measure.projectionsOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:542"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas", ("Vuna.Compiler.Elab.Termination.Measure.projHas", "Vuna/Compiler/Elab/Termination/Measure.vuna:548"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField", ("Vuna.Compiler.Elab.Termination.Measure.findWrapField", "Vuna/Compiler/Elab/Termination/Measure.vuna:552"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck", ("Vuna.Compiler.Elab.Termination.Measure.wrapCheck", "Vuna/Compiler/Elab/Termination/Measure.vuna:563"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn", ("Vuna.Compiler.Elab.Termination.Measure.posVarIn", "Vuna/Compiler/Elab/Termination/Measure.vuna:570"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel", ("Vuna.Compiler.Elab.Termination.Measure.arithRel", "Vuna/Compiler/Elab/Termination/Measure.vuna:573"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName", ("Vuna.Compiler.Elab.Termination.Measure.isSubOpName", "Vuna/Compiler/Elab/Termination/Measure.vuna:581"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus", ("Vuna.Compiler.Elab.Termination.Measure.arithMinus", "Vuna/Compiler/Elab/Termination/Measure.vuna:584"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase", ("Vuna.Compiler.Elab.Termination.Measure.arithMinusBase", "Vuna/Compiler/Elab/Termination/Measure.vuna:589"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel", ("Vuna.Compiler.Elab.Termination.Measure.projRel", "Vuna/Compiler/Elab/Termination/Measure.vuna:599"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg", ("Vuna.Compiler.Elab.Termination.Measure.relOfArg", "Vuna/Compiler/Elab/Termination/Measure.vuna:608"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel", ("Vuna.Compiler.Elab.Termination.Measure.argRel", "Vuna/Compiler/Elab/Termination/Measure.vuna:621"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid", ("Vuna.Compiler.Elab.Termination.Measure.markInvalid", "Vuna/Compiler/Elab/Termination/Measure.vuna:626"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode", ("Vuna.Compiler.Elab.Termination.Measure.addEdgeMode", "Vuna/Compiler/Elab/Termination/Measure.vuna:629"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead", ("Vuna.Compiler.Elab.Termination.Measure.groupHead", "Vuna/Compiler/Elab/Termination/Measure.vuna:633"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr", ("Vuna.Compiler.Elab.Termination.Measure.nthExpr", "Vuna/Compiler/Elab/Termination/Measure.vuna:637"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase", ("Vuna.Compiler.Elab.Termination.Measure.dotBase", "Vuna/Compiler/Elab/Termination/Measure.vuna:641"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike", ("Vuna.Compiler.Elab.Termination.Measure.isMapLike", "Vuna/Compiler/Elab/Termination/Measure.vuna:644"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes", ("Vuna.Compiler.Elab.Termination.Measure.extendElemSizes", "Vuna/Compiler/Elab/Termination/Measure.vuna:652"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict", ("Vuna.Compiler.Elab.Termination.Measure.edgeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:659"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo", ("Vuna.Compiler.Elab.Termination.Measure.edgeStrictGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:662"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets", ("Vuna.Compiler.Elab.Termination.Measure.edgeTargets", "Vuna/Compiler/Elab/Termination/Measure.vuna:669"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo", ("Vuna.Compiler.Elab.Termination.Measure.edgeTargetsGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:672"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj", ("Vuna.Compiler.Elab.Termination.Measure.weakAdj", "Vuna/Compiler/Elab/Termination/Measure.vuna:678"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo", ("Vuna.Compiler.Elab.Termination.Measure.weakAdjGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:681"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach", ("Vuna.Compiler.Elab.Termination.Measure.weakReach", "Vuna/Compiler/Elab/Termination/Measure.vuna:686"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel", ("Vuna.Compiler.Elab.Termination.Measure.weakReachFuel", "Vuna/Compiler/Elab/Termination/Measure.vuna:689"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle", ("Vuna.Compiler.Elab.Termination.Measure.hasWeakCycle", "Vuna/Compiler/Elab/Termination/Measure.vuna:698"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo", ("Vuna.Compiler.Elab.Termination.Measure.hasWeakCycleGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:701"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent", ("Vuna.Compiler.Elab.Termination.Measure.isDescent", "Vuna/Compiler/Elab/Termination/Measure.vuna:706"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes", ("Vuna.Compiler.Elab.Termination.Measure.filterModes", "Vuna/Compiler/Elab/Termination/Measure.vuna:709"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectList", "Vuna/Compiler/Elab/Termination/Scc.vuna:23"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectFields", "Vuna/Compiler/Elab/Termination/Scc.vuna:31"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectAlts", "Vuna/Compiler/Elab/Termination/Scc.vuna:39"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectBinds", "Vuna/Compiler/Elab/Termination/Scc.vuna:47"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectStmts", "Vuna/Compiler/Elab/Termination/Scc.vuna:55"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkC", "Vuna/Compiler/Elab/Termination/Scc.vuna:67"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds", ("Vuna.Compiler.Elab.Termination.Scc.localClauseBinds", "Vuna/Compiler/Elab/Termination/Scc.vuna:109"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkEApp", "Vuna/Compiler/Elab/Termination/Scc.vuna:114"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkEAppMap", "Vuna/Compiler/Elab/Termination/Scc.vuna:129"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkMapPartialInline", "Vuna/Compiler/Elab/Termination/Scc.vuna:149"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectClauses", "Vuna/Compiler/Elab/Termination/Scc.vuna:159"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect", ("Vuna.Compiler.Elab.Termination.Scc.siteCollect", "Vuna/Compiler/Elab/Termination/Scc.vuna:165"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:168"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict", ("Vuna.Compiler.Elab.Termination.Scc.scIsStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:174"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf", ("Vuna.Compiler.Elab.Termination.Scc.maxBaseOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:177"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge", ("Vuna.Compiler.Elab.Termination.Scc.insertEdge", "Vuna/Compiler/Elab/Termination/Scc.vuna:181"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges", ("Vuna.Compiler.Elab.Termination.Scc.sortEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:188"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict", ("Vuna.Compiler.Elab.Termination.Scc.mergeStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:192"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges", ("Vuna.Compiler.Elab.Termination.Scc.compactEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:195"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges", ("Vuna.Compiler.Elab.Termination.Scc.canonEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:203"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon", ("Vuna.Compiler.Elab.Termination.Scc.edgesEqCanon", "Vuna/Compiler/Elab/Termination/Scc.vuna:206"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq", ("Vuna.Compiler.Elab.Termination.Scc.edgesEq", "Vuna/Compiler/Elab/Termination/Scc.vuna:215"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith", ("Vuna.Compiler.Elab.Termination.Scc.combineWith", "Vuna/Compiler/Elab/Termination/Scc.vuna:218"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo", ("Vuna.Compiler.Elab.Termination.Scc.composeGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:224"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges", ("Vuna.Compiler.Elab.Termination.Scc.composeEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:228"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict", ("Vuna.Compiler.Elab.Termination.Scc.hasStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:231"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent", ("Vuna.Compiler.Elab.Termination.Scc.graphIdempotent", "Vuna/Compiler/Elab/Termination/Scc.vuna:235"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK", ("Vuna.Compiler.Elab.Termination.Scc.graphOK", "Vuna/Compiler/Elab/Termination/Scc.vuna:238"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK", ("Vuna.Compiler.Elab.Termination.Scc.graphsOK", "Vuna/Compiler/Elab/Termination/Scc.vuna:241"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap", ("Vuna.Compiler.Elab.Termination.Scc.tableGraphCap", "Vuna/Compiler/Elab/Termination/Scc.vuna:248"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup", ("Vuna.Compiler.Elab.Termination.Scc.tableLookup", "Vuna/Compiler/Elab/Termination/Scc.vuna:251"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas", ("Vuna.Compiler.Elab.Termination.Scc.graphListHas", "Vuna/Compiler/Elab/Termination/Scc.vuna:257"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset", ("Vuna.Compiler.Elab.Termination.Scc.graphListSubset", "Vuna/Compiler/Elab/Termination/Scc.vuna:261"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair", ("Vuna.Compiler.Elab.Termination.Scc.tableAddPair", "Vuna/Compiler/Elab/Termination/Scc.vuna:265"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd", ("Vuna.Compiler.Elab.Termination.Scc.tableAdd", "Vuna/Compiler/Elab/Termination/Scc.vuna:272"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs", ("Vuna.Compiler.Elab.Termination.Scc.closureStepHs", "Vuna/Compiler/Elab/Termination/Scc.vuna:283"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne", ("Vuna.Compiler.Elab.Termination.Scc.closureStepOne", "Vuna/Compiler/Elab/Termination/Scc.vuna:289"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo", ("Vuna.Compiler.Elab.Termination.Scc.closureStepOneGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:292"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs", ("Vuna.Compiler.Elab.Termination.Scc.closureStepGraphs", "Vuna/Compiler/Elab/Termination/Scc.vuna:299"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo", ("Vuna.Compiler.Elab.Termination.Scc.closureStepGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:305"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep", ("Vuna.Compiler.Elab.Termination.Scc.closureStep", "Vuna/Compiler/Elab/Termination/Scc.vuna:311"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame", ("Vuna.Compiler.Elab.Termination.Scc.tableSame", "Vuna/Compiler/Elab/Termination/Scc.vuna:314"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset", ("Vuna.Compiler.Elab.Termination.Scc.tableSubset", "Vuna/Compiler/Elab/Termination/Scc.vuna:317"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop", ("Vuna.Compiler.Elab.Termination.Scc.closureLoop", "Vuna/Compiler/Elab/Termination/Scc.vuna:323"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgeAt", "Vuna/Compiler/Elab/Termination/Scc.vuna:333"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgesJ", "Vuna/Compiler/Elab/Termination/Scc.vuna:340"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgesI", "Vuna/Compiler/Elab/Termination/Scc.vuna:346"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:352"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable", ("Vuna.Compiler.Elab.Termination.Scc.initialTable", "Vuna/Compiler/Elab/Termination/Scc.vuna:355"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo", ("Vuna.Compiler.Elab.Termination.Scc.initialTableGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:358"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable", ("Vuna.Compiler.Elab.Termination.Scc.sctCheckTable", "Vuna/Compiler/Elab/Termination/Scc.vuna:367"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs", ("Vuna.Compiler.Elab.Termination.Scc.sctBadGraphs", "Vuna/Compiler/Elab/Termination/Scc.vuna:372"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs", ("Vuna.Compiler.Elab.Termination.Scc.sctBadPairs", "Vuna/Compiler/Elab/Termination/Scc.vuna:376"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText", ("Vuna.Compiler.Elab.Termination.Scc.edgeText", "Vuna/Compiler/Elab/Termination/Scc.vuna:381"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText", ("Vuna.Compiler.Elab.Termination.Scc.strictEdgeText", "Vuna/Compiler/Elab/Termination/Scc.vuna:384"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText", ("Vuna.Compiler.Elab.Termination.Scc.weakEdgeText", "Vuna/Compiler/Elab/Termination/Scc.vuna:387"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText", ("Vuna.Compiler.Elab.Termination.Scc.edgesText", "Vuna/Compiler/Elab/Termination/Scc.vuna:390"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText", ("Vuna.Compiler.Elab.Termination.Scc.badGraphText", "Vuna/Compiler/Elab/Termination/Scc.vuna:395"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText", ("Vuna.Compiler.Elab.Termination.Scc.sctBadText", "Vuna/Compiler/Elab/Termination/Scc.vuna:400"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag", ("Vuna.Compiler.Elab.Termination.Scc.sctDiag", "Vuna/Compiler/Elab/Termination/Scc.vuna:405"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck", ("Vuna.Compiler.Elab.Termination.Scc.sctCheck", "Vuna/Compiler/Elab/Termination/Scc.vuna:408"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName", ("Vuna.Compiler.Elab.Termination.Scc.firstParamName", "Vuna/Compiler/Elab/Termination/Scc.vuna:426"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf", ("Vuna.Compiler.Elab.Termination.Scc.firstParamOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:432"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard", ("Vuna.Compiler.Elab.Termination.Scc.hasFuelGuard", "Vuna/Compiler/Elab/Termination/Scc.vuna:439"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict", ("Vuna.Compiler.Elab.Termination.Scc.siteFuelStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:446"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf", ("Vuna.Compiler.Elab.Termination.Scc.fuelEdgesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:458"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo", ("Vuna.Compiler.Elab.Termination.Scc.fuelEdgesGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:461"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded", ("Vuna.Compiler.Elab.Termination.Scc.fuelMembersGuarded", "Vuna/Compiler/Elab/Termination/Scc.vuna:469"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread", ("Vuna.Compiler.Elab.Termination.Scc.tryFuelThread", "Vuna/Compiler/Elab/Termination/Scc.vuna:477"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeModeOf", ("Vuna.Compiler.Elab.Termination.Scc.edgeModeOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:488"));
  ("v_Vuna_dCompiler_dElab_dTermination_dpatNames", ("Vuna.Compiler.Elab.Termination.patNames", "Vuna/Compiler/Elab/Termination.vuna:14"));
  ("v_Vuna_dCompiler_dElab_dTermination_dpatsNames", ("Vuna.Compiler.Elab.Termination.patsNames", "Vuna/Compiler/Elab/Termination.vuna:22"));
  ("v_Vuna_dCompiler_dElab_dTermination_drefsOfStmt", ("Vuna.Compiler.Elab.Termination.refsOfStmt", "Vuna/Compiler/Elab/Termination.vuna:25"));
  ("v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts", ("Vuna.Compiler.Elab.Termination.refsOfStmts", "Vuna/Compiler/Elab/Termination.vuna:29"));
  ("v_Vuna_dCompiler_dElab_dTermination_dexprRefsB", ("Vuna.Compiler.Elab.Termination.exprRefsB", "Vuna/Compiler/Elab/Termination.vuna:35"));
  ("v_Vuna_dCompiler_dElab_dTermination_drefsOfDef", ("Vuna.Compiler.Elab.Termination.refsOfDef", "Vuna/Compiler/Elab/Termination.vuna:61"));
  ("v_Vuna_dCompiler_dElab_dTermination_dmapEdges", ("Vuna.Compiler.Elab.Termination.mapEdges", "Vuna/Compiler/Elab/Termination.vuna:64"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcallGraph", ("Vuna.Compiler.Elab.Termination.callGraph", "Vuna/Compiler/Elab/Termination.vuna:70"));
  ("v_Vuna_dCompiler_dElab_dTermination_dadjOf", ("Vuna.Compiler.Elab.Termination.adjOf", "Vuna/Compiler/Elab/Termination.vuna:73"));
  ("v_Vuna_dCompiler_dElab_dTermination_dadjTblOf", ("Vuna.Compiler.Elab.Termination.adjTblOf", "Vuna/Compiler/Elab/Termination.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf", ("Vuna.Compiler.Elab.Termination.reverseAdjOf", "Vuna/Compiler/Elab/Termination.vuna:82"));
  ("v_Vuna_dCompiler_dElab_dTermination_daddSrcs", ("Vuna.Compiler.Elab.Termination.addSrcs", "Vuna/Compiler/Elab/Termination.vuna:86"));
  ("v_Vuna_dCompiler_dElab_dTermination_dreplacePair", ("Vuna.Compiler.Elab.Termination.replacePair", "Vuna/Compiler/Elab/Termination.vuna:95"));
  ("v_Vuna_dCompiler_dElab_dTermination_daddEdge", ("Vuna.Compiler.Elab.Termination.addEdge", "Vuna/Compiler/Elab/Termination.vuna:103"));
  ("v_Vuna_dCompiler_dElab_dTermination_daddEdges", ("Vuna.Compiler.Elab.Termination.addEdges", "Vuna/Compiler/Elab/Termination.vuna:108"));
  ("v_Vuna_dCompiler_dElab_dTermination_dtransposeGo", ("Vuna.Compiler.Elab.Termination.transposeGo", "Vuna/Compiler/Elab/Termination.vuna:112"));
  ("v_Vuna_dCompiler_dElab_dTermination_dtranspose", ("Vuna.Compiler.Elab.Termination.transpose", "Vuna/Compiler/Elab/Termination.vuna:116"));
  ("v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed", ("Vuna.Compiler.Elab.Termination.dedupTransposed", "Vuna/Compiler/Elab/Termination.vuna:119"));
  ("v_Vuna_dCompiler_dElab_dTermination_dedgeCount", ("Vuna.Compiler.Elab.Termination.edgeCount", "Vuna/Compiler/Elab/Termination.vuna:123"));
  ("v_Vuna_dCompiler_dElab_dTermination_dgraphFuel", ("Vuna.Compiler.Elab.Termination.graphFuel", "Vuna/Compiler/Elab/Termination.vuna:127"));
  ("v_Vuna_dCompiler_dElab_dTermination_ddfsPost", ("Vuna.Compiler.Elab.Termination.dfsPost", "Vuna/Compiler/Elab/Termination.vuna:131"));
  ("v_Vuna_dCompiler_dElab_dTermination_ddfsAll", ("Vuna.Compiler.Elab.Termination.dfsAll", "Vuna/Compiler/Elab/Termination.vuna:141"));
  ("v_Vuna_dCompiler_dElab_dTermination_dpostOrder", ("Vuna.Compiler.Elab.Termination.postOrder", "Vuna/Compiler/Elab/Termination.vuna:148"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcollectComp", ("Vuna.Compiler.Elab.Termination.collectComp", "Vuna/Compiler/Elab/Termination.vuna:151"));
  ("v_Vuna_dCompiler_dElab_dTermination_dsccOf", ("Vuna.Compiler.Elab.Termination.sccOf", "Vuna/Compiler/Elab/Termination.vuna:160"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalk", ("Vuna.Compiler.Elab.Termination.strWalk", "Vuna/Compiler/Elab/Termination.vuna:167"));
  ("v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds", ("Vuna.Compiler.Elab.Termination.localClauseBinds", "Vuna/Compiler/Elab/Termination.vuna:210"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkEApp", ("Vuna.Compiler.Elab.Termination.strWalkEApp", "Vuna/Compiler/Elab/Termination.vuna:215"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkEAppMap", ("Vuna.Compiler.Elab.Termination.strWalkEAppMap", "Vuna/Compiler/Elab/Termination.vuna:230"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline", ("Vuna.Compiler.Elab.Termination.strWalkMapPartialInline", "Vuna/Compiler/Elab/Termination.vuna:250"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp", ("Vuna.Compiler.Elab.Termination.strWalkApp", "Vuna/Compiler/Elab/Termination.vuna:262"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs", ("Vuna.Compiler.Elab.Termination.strWalkArgs", "Vuna/Compiler/Elab/Termination.vuna:268"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts", ("Vuna.Compiler.Elab.Termination.strWalkAlts", "Vuna/Compiler/Elab/Termination.vuna:276"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds", ("Vuna.Compiler.Elab.Termination.strWalkBinds", "Vuna/Compiler/Elab/Termination.vuna:284"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields", ("Vuna.Compiler.Elab.Termination.strWalkFields", "Vuna/Compiler/Elab/Termination.vuna:292"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts", ("Vuna.Compiler.Elab.Termination.strWalkStmts", "Vuna/Compiler/Elab/Termination.vuna:300"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrClause", ("Vuna.Compiler.Elab.Termination.strClause", "Vuna/Compiler/Elab/Termination.vuna:312"));
  ("v_Vuna_dCompiler_dElab_dTermination_dgroupMessage", ("Vuna.Compiler.Elab.Termination.groupMessage", "Vuna/Compiler/Elab/Termination.vuna:319"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsg", ("Vuna.Compiler.Elab.Termination.cannotProveMsg", "Vuna/Compiler/Elab/Termination.vuna:324"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsgEdges", ("Vuna.Compiler.Elab.Termination.cannotProveMsgEdges", "Vuna/Compiler/Elab/Termination.vuna:328"));
  ("v_Vuna_dCompiler_dElab_dTermination_dapplyCallFields", ("Vuna.Compiler.Elab.Termination.applyCallFields", "Vuna/Compiler/Elab/Termination.vuna:336"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcollectClauses", ("Vuna.Compiler.Elab.Termination.collectClauses", "Vuna/Compiler/Elab/Termination.vuna:342"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure", ("Vuna.Compiler.Elab.Termination.collectMeasure", "Vuna/Compiler/Elab/Termination.vuna:351"));
  ("v_Vuna_dCompiler_dElab_dTermination_dtryMeasure", ("Vuna.Compiler.Elab.Termination.tryMeasure", "Vuna/Compiler/Elab/Termination.vuna:359"));
  ("v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo", ("Vuna.Compiler.Elab.Termination.tryMeasureGo", "Vuna/Compiler/Elab/Termination.vuna:363"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup", ("Vuna.Compiler.Elab.Termination.checkStrictGroup", "Vuna/Compiler/Elab/Termination.vuna:379"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcheckComp", ("Vuna.Compiler.Elab.Termination.checkComp", "Vuna/Compiler/Elab/Termination.vuna:389"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcomputePosFactsWork", ("Vuna.Compiler.Elab.Termination.computePosFactsWork", "Vuna/Compiler/Elab/Termination.vuna:397"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDecls", ("Vuna.Compiler.Elab.Termination.checkTerminationDecls", "Vuna/Compiler/Elab/Termination.vuna:413"));
  ("v_Vuna_dCompiler_dElab_dTermination_ddfunNames", ("Vuna.Compiler.Elab.Termination.dfunNames", "Vuna/Compiler/Elab/Termination.vuna:416"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDeclsWith", ("Vuna.Compiler.Elab.Termination.checkTerminationDeclsWith", "Vuna/Compiler/Elab/Termination.vuna:422"));
  ("v_Vuna_dCompiler_dElab_dTermination_danyOwnTbl", ("Vuna.Compiler.Elab.Termination.anyOwnTbl", "Vuna/Compiler/Elab/Termination.vuna:443"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcheckSccsWith", ("Vuna.Compiler.Elab.Termination.checkSccsWith", "Vuna/Compiler/Elab/Termination.vuna:447"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcallMode", ("Vuna.Compiler.Elab.Termination.callMode", "Vuna/Compiler/Elab/Termination.vuna:455"));
  ("v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta", ("Vuna.Compiler.Elab.Driver.unsolvedMeta", "Vuna/Compiler/Elab/Driver.vuna:67"));
  ("v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant", ("Vuna.Compiler.Elab.Driver.unsolvedFromRelevant", "Vuna/Compiler/Elab/Driver.vuna:74"));
  ("v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo", ("Vuna.Compiler.Elab.Driver.unsolvedFromRelevantGo", "Vuna/Compiler/Elab/Driver.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabSigs", ("Vuna.Compiler.Elab.Driver.elabSigs", "Vuna/Compiler/Elab/Driver.vuna:93"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabSigsGo", ("Vuna.Compiler.Elab.Driver.elabSigsGo", "Vuna/Compiler/Elab/Driver.vuna:101"));
  ("v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx", ("Vuna.Compiler.Elab.Driver.leadingImplicitCtx", "Vuna/Compiler/Elab/Driver.vuna:115"));
  ("v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo", ("Vuna.Compiler.Elab.Driver.leadingImplicitCtxGo", "Vuna/Compiler/Elab/Driver.vuna:118"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders", ("Vuna.Compiler.Elab.Driver.elabSigDictBinders", "Vuna/Compiler/Elab/Driver.vuna:128"));
  ("v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts", ("Vuna.Compiler.Elab.Driver.insertSigDicts", "Vuna/Compiler/Elab/Driver.vuna:143"));
  ("v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts", ("Vuna.Compiler.Elab.Driver.prependSigDicts", "Vuna/Compiler/Elab/Driver.vuna:149"));
  ("v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev", ("Vuna.Compiler.Elab.Driver.insertSigDictsRev", "Vuna/Compiler/Elab/Driver.vuna:154"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsigDictName", ("Vuna.Compiler.Elab.Driver.sigDictName", "Vuna/Compiler/Elab/Driver.vuna:159"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders", ("Vuna.Compiler.Elab.Driver.declaredDictBinders", "Vuna/Compiler/Elab/Driver.vuna:174"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo", ("Vuna.Compiler.Elab.Driver.declaredDictBindersGo", "Vuna/Compiler/Elab/Driver.vuna:177"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals", ("Vuna.Compiler.Elab.Driver.solveDeclaredDictGoals", "Vuna/Compiler/Elab/Driver.vuna:190"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo", ("Vuna.Compiler.Elab.Driver.solveDeclaredDictGoalsGo", "Vuna/Compiler/Elab/Driver.vuna:205"));
  ("v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder", ("Vuna.Compiler.Elab.Driver.firstMatchDictBinder", "Vuna/Compiler/Elab/Driver.vuna:223"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches", ("Vuna.Compiler.Elab.Driver.dictDomMatches", "Vuna/Compiler/Elab/Driver.vuna:228"));
  ("v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts", ("Vuna.Compiler.Elab.Driver.applyDeclaredDictSubsts", "Vuna/Compiler/Elab/Driver.vuna:233"));
  ("v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf", ("Vuna.Compiler.Elab.Driver.clausesTblOf", "Vuna/Compiler/Elab/Driver.vuna:240"));
  ("v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo", ("Vuna.Compiler.Elab.Driver.clausesTblGo", "Vuna/Compiler/Elab/Driver.vuna:243"));
  ("v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl", ("Vuna.Compiler.Elab.Driver.clausesOfTbl", "Vuna/Compiler/Elab/Driver.vuna:254"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone", ("Vuna.Compiler.Elab.Driver.defAlreadyDone", "Vuna/Compiler/Elab/Driver.vuna:259"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs", ("Vuna.Compiler.Elab.Driver.defBodyPairs", "Vuna/Compiler/Elab/Driver.vuna:265"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair", ("Vuna.Compiler.Elab.Driver.defBodyPair", "Vuna/Compiler/Elab/Driver.vuna:268"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames", ("Vuna.Compiler.Elab.Driver.declFunNames", "Vuna/Compiler/Elab/Driver.vuna:274"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabBodies", ("Vuna.Compiler.Elab.Driver.elabBodies", "Vuna/Compiler/Elab/Driver.vuna:280"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined", ("Vuna.Compiler.Elab.Driver.checkAllDefined", "Vuna/Compiler/Elab/Driver.vuna:330"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo", ("Vuna.Compiler.Elab.Driver.checkAllDefinedGo", "Vuna/Compiler/Elab/Driver.vuna:335"));
  ("v_Vuna_dCompiler_dElab_dDriver_dfunNamesTbl", ("Vuna.Compiler.Elab.Driver.funNamesTbl", "Vuna/Compiler/Elab/Driver.vuna:347"));
  ("v_Vuna_dCompiler_dElab_dDriver_daxiomSpansTbl", ("Vuna.Compiler.Elab.Driver.axiomSpansTbl", "Vuna/Compiler/Elab/Driver.vuna:352"));
  ("v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs", ("Vuna.Compiler.Elab.Driver.axiomSpanPairs", "Vuna/Compiler/Elab/Driver.vuna:355"));
  ("v_Vuna_dCompiler_dElab_dDriver_dhasFunClause", ("Vuna.Compiler.Elab.Driver.hasFunClause", "Vuna/Compiler/Elab/Driver.vuna:362"));
  ("v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf", ("Vuna.Compiler.Elab.Driver.axiomSpanOf", "Vuna/Compiler/Elab/Driver.vuna:369"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy", ("Vuna.Compiler.Elab.Driver.checkExternTy", "Vuna/Compiler/Elab/Driver.vuna:379"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue", ("Vuna.Compiler.Elab.Driver.checkExternValue", "Vuna/Compiler/Elab/Driver.vuna:382"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain", ("Vuna.Compiler.Elab.Driver.checkExternDomain", "Vuna/Compiler/Elab/Driver.vuna:392"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem", ("Vuna.Compiler.Elab.Driver.checkExternArrayElem", "Vuna/Compiler/Elab/Driver.vuna:401"));
  ("v_Vuna_dCompiler_dElab_dDriver_dshowValueRepl", ("Vuna.Compiler.Elab.Driver.showValueRepl", "Vuna/Compiler/Elab/Driver.vuna:423"));
  ("v_Vuna_dCompiler_dElab_dDriver_dallReplCtors", ("Vuna.Compiler.Elab.Driver.allReplCtors", "Vuna/Compiler/Elab/Driver.vuna:426"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm", ("Vuna.Compiler.Elab.Driver.renderReplTerm", "Vuna/Compiler/Elab/Driver.vuna:430"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplApp", ("Vuna.Compiler.Elab.Driver.renderReplApp", "Vuna/Compiler/Elab/Driver.vuna:441"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplShortName", ("Vuna.Compiler.Elab.Driver.replShortName", "Vuna/Compiler/Elab/Driver.vuna:448"));
  ("v_Vuna_dCompiler_dElab_dDriver_dspineOf", ("Vuna.Compiler.Elab.Driver.spineOf", "Vuna/Compiler/Elab/Driver.vuna:451"));
  ("v_Vuna_dCompiler_dElab_dDriver_dappendLastTerm", ("Vuna.Compiler.Elab.Driver.appendLastTerm", "Vuna/Compiler/Elab/Driver.vuna:457"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName", ("Vuna.Compiler.Elab.Driver.replNatZeroName", "Vuna/Compiler/Elab/Driver.vuna:461"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName", ("Vuna.Compiler.Elab.Driver.replNatSuccName", "Vuna/Compiler/Elab/Driver.vuna:465"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplNatValue", ("Vuna.Compiler.Elab.Driver.replNatValue", "Vuna/Compiler/Elab/Driver.vuna:468"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplCtor", ("Vuna.Compiler.Elab.Driver.renderReplCtor", "Vuna/Compiler/Elab/Driver.vuna:480"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplList", ("Vuna.Compiler.Elab.Driver.renderReplList", "Vuna/Compiler/Elab/Driver.vuna:498"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail", ("Vuna.Compiler.Elab.Driver.renderReplListTail", "Vuna/Compiler/Elab/Driver.vuna:507"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplPair", ("Vuna.Compiler.Elab.Driver.renderReplPair", "Vuna/Compiler/Elab/Driver.vuna:519"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplUnary", ("Vuna.Compiler.Elab.Driver.renderReplUnary", "Vuna/Compiler/Elab/Driver.vuna:526"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric", ("Vuna.Compiler.Elab.Driver.renderReplGeneric", "Vuna/Compiler/Elab/Driver.vuna:532"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs", ("Vuna.Compiler.Elab.Driver.renderReplArgs", "Vuna/Compiler/Elab/Driver.vuna:536"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplArg", ("Vuna.Compiler.Elab.Driver.renderReplArg", "Vuna/Compiler/Elab/Driver.vuna:542"));
  ("v_Vuna_dCompiler_dElab_dDriver_disReplAtom", ("Vuna.Compiler.Elab.Driver.isReplAtom", "Vuna/Compiler/Elab/Driver.vuna:548"));
  ("v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs", ("Vuna.Compiler.Elab.Driver.keptCtorArgs", "Vuna/Compiler/Elab/Driver.vuna:565"));
  ("v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs", ("Vuna.Compiler.Elab.Driver.zipKeptArgs", "Vuna/Compiler/Elab/Driver.vuna:570"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplListNilName", ("Vuna.Compiler.Elab.Driver.replListNilName", "Vuna/Compiler/Elab/Driver.vuna:577"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplListConsName", ("Vuna.Compiler.Elab.Driver.replListConsName", "Vuna/Compiler/Elab/Driver.vuna:581"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplPairName", ("Vuna.Compiler.Elab.Driver.replPairName", "Vuna/Compiler/Elab/Driver.vuna:584"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplJustName", ("Vuna.Compiler.Elab.Driver.replJustName", "Vuna/Compiler/Elab/Driver.vuna:588"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplNothingName", ("Vuna.Compiler.Elab.Driver.replNothingName", "Vuna/Compiler/Elab/Driver.vuna:592"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn", ("Vuna.Compiler.Elab.Driver.dtEvalExprIn", "Vuna/Compiler/Elab/Driver.vuna:595"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo", ("Vuna.Compiler.Elab.Driver.dtEvalExprInInfo", "Vuna/Compiler/Elab/Driver.vuna:601"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfoCore", ("Vuna.Compiler.Elab.Driver.dtEvalExprInInfoCore", "Vuna/Compiler/Elab/Driver.vuna:606"));
  ("v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls", ("Vuna.Compiler.Elab.Driver.hasHasFieldDecls", "Vuna/Compiler/Elab/Driver.vuna:644"));
  ("v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas", ("Vuna.Compiler.Elab.Driver.shortRecordMetas", "Vuna/Compiler/Elab/Driver.vuna:653"));
  ("v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls", ("Vuna.Compiler.Elab.Driver.hasFieldInstancesOfDecls", "Vuna/Compiler/Elab/Driver.vuna:660"));
  ("v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance", ("Vuna.Compiler.Elab.Driver.hasExplicitHasFieldInstance", "Vuna/Compiler/Elab/Driver.vuna:664"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances", ("Vuna.Compiler.Elab.Driver.maybeAddHasFieldInstances", "Vuna/Compiler/Elab/Driver.vuna:675"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramFull", ("Vuna.Compiler.Elab.Driver.elabProgramFull", "Vuna/Compiler/Elab/Driver.vuna:683"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramGo", ("Vuna.Compiler.Elab.Driver.elabProgramGo", "Vuna/Compiler/Elab/Driver.vuna:693"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWith", ("Vuna.Compiler.Elab.Driver.elabProgramFullWith", "Vuna/Compiler/Elab/Driver.vuna:698"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux", ("Vuna.Compiler.Elab.Driver.elabProgramFullWithAux", "Vuna/Compiler/Elab/Driver.vuna:704"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith", ("Vuna.Compiler.Elab.Driver.elabProgramGoWith", "Vuna/Compiler/Elab/Driver.vuna:719"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux", ("Vuna.Compiler.Elab.Driver.elabProgramCoreWithAux", "Vuna/Compiler/Elab/Driver.vuna:733"));
  ("v_Vuna_dCompiler_dElab_dDriver_dfindDefByName", ("Vuna.Compiler.Elab.Driver.findDefByName", "Vuna/Compiler/Elab/Driver.vuna:810"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmainActionOf", ("Vuna.Compiler.Elab.Driver.mainActionOf", "Vuna/Compiler/Elab/Driver.vuna:816"));
  ("v_Vuna_dCompiler_dElab_dDriver_disNilRowTerm", ("Vuna.Compiler.Elab.Driver.isNilRowTerm", "Vuna/Compiler/Elab/Driver.vuna:825"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmainEntryRowCheck", ("Vuna.Compiler.Elab.Driver.mainEntryRowCheck", "Vuna/Compiler/Elab/Driver.vuna:831"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmainShowBuiltinTy", ("Vuna.Compiler.Elab.Driver.mainShowBuiltinTy", "Vuna/Compiler/Elab/Driver.vuna:847"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmainHasParams", ("Vuna.Compiler.Elab.Driver.mainHasParams", "Vuna/Compiler/Elab/Driver.vuna:860"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmainArityErr", ("Vuna.Compiler.Elab.Driver.mainArityErr", "Vuna/Compiler/Elab/Driver.vuna:866"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsynthMainShow", ("Vuna.Compiler.Elab.Driver.synthMainShow", "Vuna/Compiler/Elab/Driver.vuna:874"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmatchedBodies", ("Vuna.Compiler.Elab.Driver.matchedBodies", "Vuna/Compiler/Elab/Driver.vuna:892"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowInner", ("Vuna.Compiler.Elab.Driver.synthMainShowInner", "Vuna/Compiler/Elab/Driver.vuna:898"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowGo", ("Vuna.Compiler.Elab.Driver.synthMainShowGo", "Vuna/Compiler/Elab/Driver.vuna:905"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing", ("Vuna.Compiler.Elab.Driver.mainShowMissing", "Vuna/Compiler/Elab/Driver.vuna:924"));
  ("v_Vuna_dCompiler_dElab_dDriver_dfinishCore", ("Vuna.Compiler.Elab.Driver.finishCore", "Vuna/Compiler/Elab/Driver.vuna:931"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux", ("Vuna.Compiler.Elab.Driver.elabProgramGoWithAux", "Vuna/Compiler/Elab/Driver.vuna:991"));
  ("v_Vuna_dCompiler_dElab_dDriver_drezonkDefs", ("Vuna.Compiler.Elab.Driver.rezonkDefs", "Vuna/Compiler/Elab/Driver.vuna:997"));
  ("v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix", ("Vuna.Compiler.Elab.Driver.resolveDictGoalsFix", "Vuna/Compiler/Elab/Driver.vuna:1007"));
  ("v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo", ("Vuna.Compiler.Elab.Driver.resolveDictGoalsFixGo", "Vuna/Compiler/Elab/Driver.vuna:1012"));
  ("v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage", ("Vuna.Compiler.Elab.Driver.unsolvedMessage", "Vuna/Compiler/Elab/Driver.vuna:1021"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint", ("Vuna.Compiler.Elab.Driver.metaOwnerHint", "Vuna/Compiler/Elab/Driver.vuna:1041"));
  ("v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta", ("Vuna.Compiler.Elab.Driver.findDefWithMeta", "Vuna/Compiler/Elab/Driver.vuna:1046"));
  ("v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta", ("Vuna.Compiler.Elab.Driver.termHasMeta", "Vuna/Compiler/Elab/Driver.vuna:1051"));
  ("v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta", ("Vuna.Compiler.Elab.Driver.anyArgHasMeta", "Vuna/Compiler/Elab/Driver.vuna:1071"));
  ("v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta", ("Vuna.Compiler.Elab.Driver.anyAltHasMeta", "Vuna/Compiler/Elab/Driver.vuna:1075"));
  ("v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta", ("Vuna.Compiler.Elab.Driver.termHasAnyMeta", "Vuna/Compiler/Elab/Driver.vuna:1081"));
  ("v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta", ("Vuna.Compiler.Elab.Driver.anyArgHasAnyMeta", "Vuna/Compiler/Elab/Driver.vuna:1101"));
  ("v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta", ("Vuna.Compiler.Elab.Driver.anyAltHasAnyMeta", "Vuna/Compiler/Elab/Driver.vuna:1105"));
  ("v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf", ("Vuna.Compiler.Elab.Driver.ctxDepthOf", "Vuna/Compiler/Elab/Driver.vuna:1110"));
  ("v_Vuna_dCompiler_dElab_dDriver_dfindGoal", ("Vuna.Compiler.Elab.Driver.findGoal", "Vuna/Compiler/Elab/Driver.vuna:1113"));
  ("v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf", ("Vuna.Compiler.Elab.Driver.goalInfoOf", "Vuna/Compiler/Elab/Driver.vuna:1125"));
  ("v_Vuna_dCompiler_dElab_dDriver_dzonkGoal", ("Vuna.Compiler.Elab.Driver.zonkGoal", "Vuna/Compiler/Elab/Driver.vuna:1131"));
  ("v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf", ("Vuna.Compiler.Elab.Driver.ctxEntriesOf", "Vuna/Compiler/Elab/Driver.vuna:1135"));
  ("v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt", ("Vuna.Compiler.Elab.Driver.ctxEntriesAt", "Vuna/Compiler/Elab/Driver.vuna:1138"));
  ("v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram", ("Vuna.Compiler.Elab.Driver.goalsOfProgram", "Vuna/Compiler/Elab/Driver.vuna:1144"));
  ("v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgramTolerant", ("Vuna.Compiler.Elab.Driver.goalsOfProgramTolerant", "Vuna/Compiler/Elab/Driver.vuna:1152"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgram", ("Vuna.Compiler.Elab.Driver.elabProgram", "Vuna/Compiler/Elab/Driver.vuna:1159"));
  ("v_Vuna_dCompiler_dElab_dDriver_decOfProgram", ("Vuna.Compiler.Elab.Driver.ecOfProgram", "Vuna/Compiler/Elab/Driver.vuna:1168"));
  ("v_Vuna_dCompiler_dElab_dDriver_daddDatasEc", ("Vuna.Compiler.Elab.Driver.addDatasEc", "Vuna/Compiler/Elab/Driver.vuna:1181"));
  ("v_Vuna_dCompiler_dElab_dDriver_daddInstsEc", ("Vuna.Compiler.Elab.Driver.addInstsEc", "Vuna/Compiler/Elab/Driver.vuna:1185"));
  ("v_Vuna_dCompiler_dElab_dDriver_daddClassesEc", ("Vuna.Compiler.Elab.Driver.addClassesEc", "Vuna/Compiler/Elab/Driver.vuna:1189"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddictCandidatesOf", ("Vuna.Compiler.Elab.Driver.dictCandidatesOf", "Vuna/Compiler/Elab/Driver.vuna:1195"));
  ("v_Vuna_dCompiler_dElab_dDriver_dinstCandidate", ("Vuna.Compiler.Elab.Driver.instCandidate", "Vuna/Compiler/Elab/Driver.vuna:1203"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddictFamilyOfShown", ("Vuna.Compiler.Elab.Driver.dictFamilyOfShown", "Vuna/Compiler/Elab/Driver.vuna:1209"));
  ("v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar", ("Vuna.Compiler.Elab.Driver.takeWhileDictChar", "Vuna/Compiler/Elab/Driver.vuna:1219"));
  ("v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated", ("Vuna.Compiler.Elab.Driver.withMetaCreated", "Vuna/Compiler/Elab/Driver.vuna:1225"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum", ("Vuna.Compiler.Codegen.Decl.isAsciiAlphaNum", "Vuna/Compiler/Codegen/Decl.vuna:54"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar", ("Vuna.Compiler.Codegen.Decl.sanitizeChar", "Vuna/Compiler/Codegen/Decl.vuna:58"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName", ("Vuna.Compiler.Codegen.Decl.sanitizeName", "Vuna/Compiler/Codegen/Decl.vuna:65"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3", ("Vuna.Compiler.Codegen.Decl.ocamlPad3", "Vuna/Compiler/Codegen/Decl.vuna:68"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar", ("Vuna.Compiler.Codegen.Decl.ocamlEscapeChar", "Vuna/Compiler/Codegen/Decl.vuna:71"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_docamlString", ("Vuna.Compiler.Codegen.Decl.ocamlString", "Vuna/Compiler/Codegen/Decl.vuna:79"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dvalueName", ("Vuna.Compiler.Codegen.Decl.valueName", "Vuna/Compiler/Codegen/Decl.vuna:82"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dboolText", ("Vuna.Compiler.Codegen.Decl.boolText", "Vuna/Compiler/Codegen/Decl.vuna:87"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dtypeName", ("Vuna.Compiler.Codegen.Decl.typeName", "Vuna/Compiler/Codegen/Decl.vuna:92"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName", ("Vuna.Compiler.Codegen.Decl.ctorOcamlName", "Vuna/Compiler/Codegen/Decl.vuna:96"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dnoQual", ("Vuna.Compiler.Codegen.Decl.noQual", "Vuna/Compiler/Codegen/Decl.vuna:117"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf", ("Vuna.Compiler.Codegen.Decl.unitTblOf", "Vuna/Compiler/Codegen/Decl.vuna:120"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl", ("Vuna.Compiler.Codegen.Decl.unitOfTbl", "Vuna/Compiler/Codegen/Decl.vuna:123"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dqualOf", ("Vuna.Compiler.Codegen.Decl.qualOf", "Vuna/Compiler/Codegen/Decl.vuna:128"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix", ("Vuna.Compiler.Codegen.Decl.qualPrefix", "Vuna/Compiler/Codegen/Decl.vuna:132"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dqualValueText", ("Vuna.Compiler.Codegen.Decl.qualValueText", "Vuna/Compiler/Codegen/Decl.vuna:137"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText", ("Vuna.Compiler.Codegen.Decl.qualCtorText", "Vuna/Compiler/Codegen/Decl.vuna:140"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText", ("Vuna.Compiler.Codegen.Decl.qualTypeText", "Vuna/Compiler/Codegen/Decl.vuna:144"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNames", ("Vuna.Compiler.Codegen.Decl.dataTypeGlobalNames", "Vuna/Compiler/Codegen/Decl.vuna:147"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_ddataTypeGlobalNamesGo", ("Vuna.Compiler.Codegen.Decl.dataTypeGlobalNamesGo", "Vuna/Compiler/Codegen/Decl.vuna:150"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOf", ("Vuna.Compiler.Codegen.Decl.typeDepsOf", "Vuna/Compiler/Codegen/Decl.vuna:155"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dtypeDepsOfGo", ("Vuna.Compiler.Codegen.Decl.typeDepsOfGo", "Vuna/Compiler/Codegen/Decl.vuna:158"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords", ("Vuna.Compiler.Codegen.Decl.ocamlReservedWords", "Vuna/Compiler/Codegen/Decl.vuna:169"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName", ("Vuna.Compiler.Codegen.Decl.ocamlBinderName", "Vuna/Compiler/Codegen/Decl.vuna:229"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_djoinWith", ("Vuna.Compiler.Codegen.Decl.joinWith", "Vuna/Compiler/Codegen/Decl.vuna:237"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dinterpose", ("Vuna.Compiler.Codegen.Decl.interpose", "Vuna/Compiler/Codegen/Decl.vuna:240"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName", ("Vuna.Compiler.Codegen.Decl.typeParamName", "Vuna/Compiler/Codegen/Decl.vuna:264"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames", ("Vuna.Compiler.Codegen.Decl.typeParamNames", "Vuna/Compiler/Codegen/Decl.vuna:267"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl", ("Vuna.Compiler.Codegen.Decl.typeParamDecl", "Vuna/Compiler/Codegen/Decl.vuna:270"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevels", ("Vuna.Compiler.Codegen.Decl.typeParamLevels", "Vuna/Compiler/Codegen/Decl.vuna:277"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamLevelsGo", ("Vuna.Compiler.Codegen.Decl.typeParamLevelsGo", "Vuna/Compiler/Codegen/Decl.vuna:280"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dmemInt", ("Vuna.Compiler.Codegen.Decl.memInt", "Vuna/Compiler/Codegen/Decl.vuna:286"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlot", ("Vuna.Compiler.Codegen.Decl.levelSlot", "Vuna/Compiler/Codegen/Decl.vuna:290"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dlevelSlotGo", ("Vuna.Compiler.Codegen.Decl.levelSlotGo", "Vuna/Compiler/Codegen/Decl.vuna:293"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dnthValue", ("Vuna.Compiler.Codegen.Decl.nthValue", "Vuna/Compiler/Codegen/Decl.vuna:297"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dlookupUsed", ("Vuna.Compiler.Codegen.Decl.lookupUsed", "Vuna/Compiler/Codegen/Decl.vuna:301"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevels", ("Vuna.Compiler.Codegen.Decl.collectUsedLevels", "Vuna/Compiler/Codegen/Decl.vuna:308"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedLevelsFuel", ("Vuna.Compiler.Codegen.Decl.collectUsedLevelsFuel", "Vuna/Compiler/Codegen/Decl.vuna:311"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpineFuel", ("Vuna.Compiler.Codegen.Decl.collectUsedSpineFuel", "Vuna/Compiler/Codegen/Decl.vuna:328"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgs", ("Vuna.Compiler.Codegen.Decl.collectFamilyArgs", "Vuna/Compiler/Codegen/Decl.vuna:335"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dcollectFamilyArgsFuel", ("Vuna.Compiler.Codegen.Decl.collectFamilyArgsFuel", "Vuna/Compiler/Codegen/Decl.vuna:339"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorUsedLevels", ("Vuna.Compiler.Codegen.Decl.ctorUsedLevels", "Vuna/Compiler/Codegen/Decl.vuna:349"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_ddataUsedLevels", ("Vuna.Compiler.Codegen.Decl.dataUsedLevels", "Vuna/Compiler/Codegen/Decl.vuna:368"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dlevelListEq", ("Vuna.Compiler.Codegen.Decl.levelListEq", "Vuna/Compiler/Codegen/Decl.vuna:379"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dsameLevelTable", ("Vuna.Compiler.Codegen.Decl.sameLevelTable", "Vuna/Compiler/Codegen/Decl.vuna:384"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFix", ("Vuna.Compiler.Codegen.Decl.usedTableFix", "Vuna/Compiler/Codegen/Decl.vuna:391"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dusedTableFixFuel", ("Vuna.Compiler.Codegen.Decl.usedTableFixFuel", "Vuna/Compiler/Codegen/Decl.vuna:394"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText", ("Vuna.Compiler.Codegen.Decl.familyTyText", "Vuna/Compiler/Codegen/Decl.vuna:402"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgs", ("Vuna.Compiler.Codegen.Decl.renderFamilyArgs", "Vuna/Compiler/Codegen/Decl.vuna:407"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drenderFamilyArgsFuel", ("Vuna.Compiler.Codegen.Decl.renderFamilyArgsFuel", "Vuna/Compiler/Codegen/Decl.vuna:411"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArg", ("Vuna.Compiler.Codegen.Decl.renderTypeArg", "Vuna/Compiler/Codegen/Decl.vuna:421"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgFuel", ("Vuna.Compiler.Codegen.Decl.renderTypeArgFuel", "Vuna/Compiler/Codegen/Decl.vuna:424"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeArgGlobal", ("Vuna.Compiler.Codegen.Decl.renderTypeArgGlobal", "Vuna/Compiler/Codegen/Decl.vuna:436"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drenderTypeIntrinsic", ("Vuna.Compiler.Codegen.Decl.renderTypeIntrinsic", "Vuna/Compiler/Codegen/Decl.vuna:452"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTy", ("Vuna.Compiler.Codegen.Decl.renderPiTy", "Vuna/Compiler/Codegen/Decl.vuna:461"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drenderPiTyFuel", ("Vuna.Compiler.Codegen.Decl.renderPiTyFuel", "Vuna/Compiler/Codegen/Decl.vuna:464"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drenderFieldTy", ("Vuna.Compiler.Codegen.Decl.renderFieldTy", "Vuna/Compiler/Codegen/Decl.vuna:475"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig", ("Vuna.Compiler.Codegen.Decl.flagMatchesRig", "Vuna/Compiler/Codegen/Decl.vuna:501"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf", ("Vuna.Compiler.Codegen.Decl.ctorShapeOf", "Vuna/Compiler/Codegen/Decl.vuna:505"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_disTypeHeadOpaqueDatas", ("Vuna.Compiler.Codegen.Decl.isTypeHeadOpaqueDatas", "Vuna/Compiler/Codegen/Decl.vuna:522"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dmemOpaqueLevel", ("Vuna.Compiler.Codegen.Decl.memOpaqueLevel", "Vuna/Compiler/Codegen/Decl.vuna:529"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueFlagsOf", ("Vuna.Compiler.Codegen.Decl.ctorOpaqueFlagsOf", "Vuna/Compiler/Codegen/Decl.vuna:535"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueGo", ("Vuna.Compiler.Codegen.Decl.ctorOpaqueGo", "Vuna/Compiler/Codegen/Decl.vuna:538"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueTableOf", ("Vuna.Compiler.Codegen.Decl.ctorOpaqueTableOf", "Vuna/Compiler/Codegen/Decl.vuna:551"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorOpaqueKeptFlags", ("Vuna.Compiler.Codegen.Decl.ctorOpaqueKeptFlags", "Vuna/Compiler/Codegen/Decl.vuna:557"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorFieldTexts", ("Vuna.Compiler.Codegen.Decl.ctorFieldTexts", "Vuna/Compiler/Codegen/Decl.vuna:563"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorArityNeed", ("Vuna.Compiler.Codegen.Decl.ctorArityNeed", "Vuna/Compiler/Codegen/Decl.vuna:587"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_ddataArityNeed", ("Vuna.Compiler.Codegen.Decl.dataArityNeed", "Vuna/Compiler/Codegen/Decl.vuna:593"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dmaxIntList", ("Vuna.Compiler.Codegen.Decl.maxIntList", "Vuna/Compiler/Codegen/Decl.vuna:599"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText", ("Vuna.Compiler.Codegen.Decl.ctorDeclText", "Vuna/Compiler/Codegen/Decl.vuna:603"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dparenList", ("Vuna.Compiler.Codegen.Decl.parenList", "Vuna/Compiler/Codegen/Decl.vuna:608"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dparenOne", ("Vuna.Compiler.Codegen.Decl.parenOne", "Vuna/Compiler/Codegen/Decl.vuna:612"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dgenCtorDecl", ("Vuna.Compiler.Codegen.Decl.genCtorDecl", "Vuna/Compiler/Codegen/Decl.vuna:615"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_disRecordData", ("Vuna.Compiler.Codegen.Decl.isRecordData", "Vuna/Compiler/Codegen/Decl.vuna:626"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel", ("Vuna.Compiler.Codegen.Decl.recordFieldLabel", "Vuna/Compiler/Codegen/Decl.vuna:633"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFields", ("Vuna.Compiler.Codegen.Decl.recordRtFields", "Vuna/Compiler/Codegen/Decl.vuna:637"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drecordRtFieldsGo", ("Vuna.Compiler.Codegen.Decl.recordRtFieldsGo", "Vuna/Compiler/Codegen/Decl.vuna:646"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dhasRecordRepr", ("Vuna.Compiler.Codegen.Decl.hasRecordRepr", "Vuna/Compiler/Codegen/Decl.vuna:655"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dgenRecordDecl", ("Vuna.Compiler.Codegen.Decl.genRecordDecl", "Vuna/Compiler/Codegen/Decl.vuna:662"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls", ("Vuna.Compiler.Codegen.Decl.recordFieldDecls", "Vuna/Compiler/Codegen/Decl.vuna:671"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dgenUnboxedDataDecl", ("Vuna.Compiler.Codegen.Decl.genUnboxedDataDecl", "Vuna/Compiler/Codegen/Decl.vuna:679"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dgenDataDecl", ("Vuna.Compiler.Codegen.Decl.genDataDecl", "Vuna/Compiler/Codegen/Decl.vuna:687"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyText", ("Vuna.Compiler.Codegen.Decl.ctorBodyText", "Vuna/Compiler/Codegen/Decl.vuna:698"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_disBoolFamilyName", ("Vuna.Compiler.Codegen.Decl.isBoolFamilyName", "Vuna/Compiler/Codegen/Decl.vuna:704"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_disNatFamilyName", ("Vuna.Compiler.Codegen.Decl.isNatFamilyName", "Vuna/Compiler/Codegen/Decl.vuna:708"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_druntimeDatas", ("Vuna.Compiler.Codegen.Decl.runtimeDatas", "Vuna/Compiler/Codegen/Decl.vuna:711"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dusedTableOf", ("Vuna.Compiler.Codegen.Decl.usedTableOf", "Vuna/Compiler/Codegen/Decl.vuna:719"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsOf", ("Vuna.Compiler.Codegen.Decl.genTypeDeclsOf", "Vuna/Compiler/Codegen/Decl.vuna:722"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dgenTypeDeclsWith", ("Vuna.Compiler.Codegen.Decl.genTypeDeclsWith", "Vuna/Compiler/Codegen/Decl.vuna:725"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dcollectUsedSpine", ("Vuna.Compiler.Codegen.Decl.collectUsedSpine", "Vuna/Compiler/Codegen/Decl.vuna:732"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp", ("Vuna.Compiler.Codegen.Erase.flattenConApp", "Vuna/Compiler/Codegen/Erase.vuna:45"));
  ("v_Vuna_dCompiler_dCodegen_dErase_ddefTable", ("Vuna.Compiler.Codegen.Erase.defTable", "Vuna/Compiler/Codegen/Erase.vuna:56"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef", ("Vuna.Compiler.Codegen.Erase.findDtDef", "Vuna/Compiler/Codegen/Erase.vuna:63"));
  ("v_Vuna_dCompiler_dCodegen_dErase_disAxiomDef", ("Vuna.Compiler.Codegen.Erase.isAxiomDef", "Vuna/Compiler/Codegen/Erase.vuna:68"));
  ("v_Vuna_dCompiler_dCodegen_dErase_daxiomNamesOf", ("Vuna.Compiler.Codegen.Erase.axiomNamesOf", "Vuna/Compiler/Codegen/Erase.vuna:71"));
  ("v_Vuna_dCompiler_dCodegen_dErase_disTypeLevelDef", ("Vuna.Compiler.Codegen.Erase.isTypeLevelDef", "Vuna/Compiler/Codegen/Erase.vuna:76"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefs", ("Vuna.Compiler.Codegen.Erase.partitionDefs", "Vuna/Compiler/Codegen/Erase.vuna:82"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dpartitionDefsGo", ("Vuna.Compiler.Codegen.Erase.partitionDefsGo", "Vuna/Compiler/Codegen/Erase.vuna:85"));
  ("v_Vuna_dCompiler_dCodegen_dErase_ddefLocDiag", ("Vuna.Compiler.Codegen.Erase.defLocDiag", "Vuna/Compiler/Codegen/Erase.vuna:95"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntime", ("Vuna.Compiler.Codegen.Erase.checkNoAxiomRuntime", "Vuna/Compiler/Codegen/Erase.vuna:100"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckNoAxiomRuntimeGo", ("Vuna.Compiler.Codegen.Erase.checkNoAxiomRuntimeGo", "Vuna/Compiler/Codegen/Erase.vuna:103"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckAllErasure", ("Vuna.Compiler.Codegen.Erase.checkAllErasure", "Vuna/Compiler/Codegen/Erase.vuna:112"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckOneErasure", ("Vuna.Compiler.Codegen.Erase.checkOneErasure", "Vuna/Compiler/Codegen/Erase.vuna:119"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint", ("Vuna.Compiler.Codegen.Erase.showMetaHint", "Vuna/Compiler/Codegen/Erase.vuna:130"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckErasureFuel", ("Vuna.Compiler.Codegen.Erase.checkErasureFuel", "Vuna/Compiler/Codegen/Erase.vuna:133"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasureFuel", ("Vuna.Compiler.Codegen.Erase.checkConArgsErasureFuel", "Vuna/Compiler/Codegen/Erase.vuna:173"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasureFuel", ("Vuna.Compiler.Codegen.Erase.checkAltErasureFuel", "Vuna/Compiler/Codegen/Erase.vuna:181"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dbinderAt", ("Vuna.Compiler.Codegen.Erase.binderAt", "Vuna/Compiler/Codegen/Erase.vuna:191"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dtermDepsIntoFuel", ("Vuna.Compiler.Codegen.Erase.termDepsIntoFuel", "Vuna/Compiler/Codegen/Erase.vuna:196"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgsFuel", ("Vuna.Compiler.Codegen.Erase.termDepsArgsFuel", "Vuna/Compiler/Codegen/Erase.vuna:230"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAltsFuel", ("Vuna.Compiler.Codegen.Erase.termDepsAltsFuel", "Vuna/Compiler/Codegen/Erase.vuna:237"));
  ("v_Vuna_dCompiler_dCodegen_dErase_daddName", ("Vuna.Compiler.Codegen.Erase.addName", "Vuna/Compiler/Codegen/Erase.vuna:244"));
  ("v_Vuna_dCompiler_dCodegen_dErase_druntimeNamesOf", ("Vuna.Compiler.Codegen.Erase.runtimeNamesOf", "Vuna/Compiler/Codegen/Erase.vuna:249"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dlookupDtDef", ("Vuna.Compiler.Codegen.Erase.lookupDtDef", "Vuna/Compiler/Codegen/Erase.vuna:253"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf", ("Vuna.Compiler.Codegen.Erase.neighborsOf", "Vuna/Compiler/Codegen/Erase.vuna:263"));
  ("v_Vuna_dCompiler_dCodegen_dErase_daddDependents", ("Vuna.Compiler.Codegen.Erase.addDependents", "Vuna/Compiler/Codegen/Erase.vuna:269"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dreverseAdjTbl", ("Vuna.Compiler.Codegen.Erase.reverseAdjTbl", "Vuna/Compiler/Codegen/Erase.vuna:278"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dadjTblOf", ("Vuna.Compiler.Codegen.Erase.adjTblOf", "Vuna/Compiler/Codegen/Erase.vuna:282"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPost", ("Vuna.Compiler.Codegen.Erase.foldNeighborsPost", "Vuna/Compiler/Codegen/Erase.vuna:285"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsPostFuel", ("Vuna.Compiler.Codegen.Erase.foldNeighborsPostFuel", "Vuna/Compiler/Codegen/Erase.vuna:288"));
  ("v_Vuna_dCompiler_dCodegen_dErase_ddfsPost", ("Vuna.Compiler.Codegen.Erase.dfsPost", "Vuna/Compiler/Codegen/Erase.vuna:296"));
  ("v_Vuna_dCompiler_dCodegen_dErase_ddfsPostFuel", ("Vuna.Compiler.Codegen.Erase.dfsPostFuel", "Vuna/Compiler/Codegen/Erase.vuna:299"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dpostOrder", ("Vuna.Compiler.Codegen.Erase.postOrder", "Vuna/Compiler/Codegen/Erase.vuna:304"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollect", ("Vuna.Compiler.Codegen.Erase.foldNeighborsCollect", "Vuna/Compiler/Codegen/Erase.vuna:310"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dfoldNeighborsCollectFuel", ("Vuna.Compiler.Codegen.Erase.foldNeighborsCollectFuel", "Vuna/Compiler/Codegen/Erase.vuna:313"));
  ("v_Vuna_dCompiler_dCodegen_dErase_ddfsCollect", ("Vuna.Compiler.Codegen.Erase.dfsCollect", "Vuna/Compiler/Codegen/Erase.vuna:321"));
  ("v_Vuna_dCompiler_dCodegen_dErase_ddfsCollectFuel", ("Vuna.Compiler.Codegen.Erase.dfsCollectFuel", "Vuna/Compiler/Codegen/Erase.vuna:324"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcollectComps", ("Vuna.Compiler.Codegen.Erase.collectComps", "Vuna/Compiler/Codegen/Erase.vuna:329"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcomponentTblOf", ("Vuna.Compiler.Codegen.Erase.componentTblOf", "Vuna/Compiler/Codegen/Erase.vuna:336"));
  ("v_Vuna_dCompiler_dCodegen_dErase_daddAllNames", ("Vuna.Compiler.Codegen.Erase.addAllNames", "Vuna/Compiler/Codegen/Erase.vuna:340"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromComps", ("Vuna.Compiler.Codegen.Erase.groupsFromComps", "Vuna/Compiler/Codegen/Erase.vuna:345"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dgroupsFromCompsGo", ("Vuna.Compiler.Codegen.Erase.groupsFromCompsGo", "Vuna/Compiler/Codegen/Erase.vuna:349"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dgroupOf", ("Vuna.Compiler.Codegen.Erase.groupOf", "Vuna/Compiler/Codegen/Erase.vuna:362"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dfilterNames", ("Vuna.Compiler.Codegen.Erase.filterNames", "Vuna/Compiler/Codegen/Erase.vuna:369"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dnotIn", ("Vuna.Compiler.Codegen.Erase.notIn", "Vuna/Compiler/Codegen/Erase.vuna:374"));
  ("v_Vuna_dCompiler_dCodegen_dErase_duniqueNames", ("Vuna.Compiler.Codegen.Erase.uniqueNames", "Vuna/Compiler/Codegen/Erase.vuna:377"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dgroupDeps", ("Vuna.Compiler.Codegen.Erase.groupDeps", "Vuna/Compiler/Codegen/Erase.vuna:383"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dallIn", ("Vuna.Compiler.Codegen.Erase.allIn", "Vuna/Compiler/Codegen/Erase.vuna:387"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dgroupReady", ("Vuna.Compiler.Codegen.Erase.groupReady", "Vuna/Compiler/Codegen/Erase.vuna:391"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dpickReady", ("Vuna.Compiler.Codegen.Erase.pickReady", "Vuna/Compiler/Codegen/Erase.vuna:394"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dpickReadyAcc", ("Vuna.Compiler.Codegen.Erase.pickReadyAcc", "Vuna/Compiler/Codegen/Erase.vuna:397"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dorderGroups", ("Vuna.Compiler.Codegen.Erase.orderGroups", "Vuna/Compiler/Codegen/Erase.vuna:403"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAcc", ("Vuna.Compiler.Codegen.Erase.orderGroupsAcc", "Vuna/Compiler/Codegen/Erase.vuna:406"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dorderGroupsAccFuel", ("Vuna.Compiler.Codegen.Erase.orderGroupsAccFuel", "Vuna/Compiler/Codegen/Erase.vuna:410"));
  ("v_Vuna_dCompiler_dCodegen_dErase_ddepAdjacency", ("Vuna.Compiler.Codegen.Erase.depAdjacency", "Vuna/Compiler/Codegen/Erase.vuna:422"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dgroupRuntimeDefs", ("Vuna.Compiler.Codegen.Erase.groupRuntimeDefs", "Vuna/Compiler/Codegen/Erase.vuna:431"));
  ("v_Vuna_dCompiler_dCodegen_dErase_ddtDefTblOf", ("Vuna.Compiler.Codegen.Erase.dtDefTblOf", "Vuna/Compiler/Codegen/Erase.vuna:447"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dgroupDefsOf", ("Vuna.Compiler.Codegen.Erase.groupDefsOf", "Vuna/Compiler/Codegen/Erase.vuna:451"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNames", ("Vuna.Compiler.Codegen.Erase.checkNoDupOcamlNames", "Vuna/Compiler/Codegen/Erase.vuna:461"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckNoDupOcamlNamesGo", ("Vuna.Compiler.Codegen.Erase.checkNoDupOcamlNamesGo", "Vuna/Compiler/Codegen/Erase.vuna:464"));
  ("v_Vuna_dCompiler_dCodegen_dErase_densureUniqueOcamlNames", ("Vuna.Compiler.Codegen.Erase.ensureUniqueOcamlNames", "Vuna/Compiler/Codegen/Erase.vuna:470"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopes", ("Vuna.Compiler.Codegen.Erase.checkTermScopes", "Vuna/Compiler/Codegen/Erase.vuna:488"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckTermScopesArgs", ("Vuna.Compiler.Codegen.Erase.checkTermScopesArgs", "Vuna/Compiler/Codegen/Erase.vuna:519"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckAltScopes", ("Vuna.Compiler.Codegen.Erase.checkAltScopes", "Vuna/Compiler/Codegen/Erase.vuna:524"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckAllDefScopes", ("Vuna.Compiler.Codegen.Erase.checkAllDefScopes", "Vuna/Compiler/Codegen/Erase.vuna:531"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dtermDepsInto", ("Vuna.Compiler.Codegen.Erase.termDepsInto", "Vuna/Compiler/Codegen/Erase.vuna:541"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dtermDepsArgs", ("Vuna.Compiler.Codegen.Erase.termDepsArgs", "Vuna/Compiler/Codegen/Erase.vuna:544"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dtermDepsAlts", ("Vuna.Compiler.Codegen.Erase.termDepsAlts", "Vuna/Compiler/Codegen/Erase.vuna:547"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckErasure", ("Vuna.Compiler.Codegen.Erase.checkErasure", "Vuna/Compiler/Codegen/Erase.vuna:550"));
  ("v_Vuna_dCompiler_dCodegen_dErase_derasureFuelFor", ("Vuna.Compiler.Codegen.Erase.erasureFuelFor", "Vuna/Compiler/Codegen/Erase.vuna:559"));
  ("v_Vuna_dCompiler_dCodegen_dErase_derasureFuelMax", ("Vuna.Compiler.Codegen.Erase.erasureFuelMax", "Vuna/Compiler/Codegen/Erase.vuna:565"));
  ("v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForArgs", ("Vuna.Compiler.Codegen.Erase.erasureFuelForArgs", "Vuna/Compiler/Codegen/Erase.vuna:568"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckConArgsErasure", ("Vuna.Compiler.Codegen.Erase.checkConArgsErasure", "Vuna/Compiler/Codegen/Erase.vuna:572"));
  ("v_Vuna_dCompiler_dCodegen_dErase_dcheckAltErasure", ("Vuna.Compiler.Codegen.Erase.checkAltErasure", "Vuna/Compiler/Codegen/Erase.vuna:576"));
  ("v_Vuna_dCompiler_dCodegen_dErase_derasureFuelForAlts", ("Vuna.Compiler.Codegen.Erase.erasureFuelForAlts", "Vuna/Compiler/Codegen/Erase.vuna:579"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime", ("Vuna.Compiler.Codegen.Term.dtRuntime", "Vuna/Compiler/Codegen/Term.vuna:34"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime", ("Vuna.Compiler.Codegen.Term.dtPrimRuntime", "Vuna/Compiler/Codegen/Term.vuna:105"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtSchedRuntime", ("Vuna.Compiler.Codegen.Term.dtSchedRuntime", "Vuna/Compiler/Codegen/Term.vuna:360"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtReporterRuntime", ("Vuna.Compiler.Codegen.Term.dtReporterRuntime", "Vuna/Compiler/Codegen/Term.vuna:822"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtDefLocTable", ("Vuna.Compiler.Codegen.Term.dtDefLocTable", "Vuna/Compiler/Codegen/Term.vuna:860"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtDefLocRow", ("Vuna.Compiler.Codegen.Term.dtDefLocRow", "Vuna/Compiler/Codegen/Term.vuna:863"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtFloatRuntime", ("Vuna.Compiler.Codegen.Term.dtFloatRuntime", "Vuna/Compiler/Codegen/Term.vuna:871"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtTraceRuntime", ("Vuna.Compiler.Codegen.Term.dtTraceRuntime", "Vuna/Compiler/Codegen/Term.vuna:888"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntimeWith", ("Vuna.Compiler.Codegen.Term.dtRuntimeWith", "Vuna/Compiler/Codegen/Term.vuna:903"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge", ("Vuna.Compiler.Codegen.Term.dtListBridge", "Vuna/Compiler/Codegen/Term.vuna:918"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor", ("Vuna.Compiler.Codegen.Term.findFamilyCtor", "Vuna/Compiler/Codegen/Term.vuna:967"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData", ("Vuna.Compiler.Codegen.Term.findListFamilyData", "Vuna/Compiler/Codegen/Term.vuna:971"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef", ("Vuna.Compiler.Codegen.Term.genGlobalRef", "Vuna/Compiler/Codegen/Term.vuna:978"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_deffPrimText", ("Vuna.Compiler.Codegen.Term.effPrimText", "Vuna/Compiler/Codegen/Term.vuna:1002"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_deffThunkText", ("Vuna.Compiler.Codegen.Term.effThunkText", "Vuna/Compiler/Codegen/Term.vuna:1014"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_deffLinearBindText", ("Vuna.Compiler.Codegen.Term.effLinearBindText", "Vuna/Compiler/Codegen/Term.vuna:1023"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames", ("Vuna.Compiler.Codegen.Term.ioParamNames", "Vuna/Compiler/Codegen/Term.vuna:1037"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames", ("Vuna.Compiler.Codegen.Term.takeNames", "Vuna/Compiler/Codegen/Term.vuna:1040"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_drecordProjVar", ("Vuna.Compiler.Codegen.Term.recordProjVar", "Vuna/Compiler/Codegen/Term.vuna:1068"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dprojBinders", ("Vuna.Compiler.Codegen.Term.projBinders", "Vuna/Compiler/Codegen/Term.vuna:1072"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgsNext", ("Vuna.Compiler.Codegen.Term.gsNext", "Vuna/Compiler/Codegen/Term.vuna:1077"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext", ("Vuna.Compiler.Codegen.Term.gsPutNext", "Vuna/Compiler/Codegen/Term.vuna:1080"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData", ("Vuna.Compiler.Codegen.Term.ctorTableOfData", "Vuna/Compiler/Codegen/Term.vuna:1084"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf", ("Vuna.Compiler.Codegen.Term.ctorTableOf", "Vuna/Compiler/Codegen/Term.vuna:1087"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt", ("Vuna.Compiler.Codegen.Term.mkGenSt", "Vuna/Compiler/Codegen/Term.vuna:1091"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep", ("Vuna.Compiler.Codegen.Term.gsAddDep", "Vuna/Compiler/Codegen/Term.vuna:1105"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef", ("Vuna.Compiler.Codegen.Term.genValueRef", "Vuna/Compiler/Codegen/Term.vuna:1111"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef", ("Vuna.Compiler.Codegen.Term.genCtorRef", "Vuna/Compiler/Codegen/Term.vuna:1117"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dbridgeHelperNames", ("Vuna.Compiler.Codegen.Term.bridgeHelperNames", "Vuna/Compiler/Codegen/Term.vuna:1128"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dbridgeUnitOf", ("Vuna.Compiler.Codegen.Term.bridgeUnitOf", "Vuna/Compiler/Codegen/Term.vuna:1132"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dreplaceAll", ("Vuna.Compiler.Codegen.Term.replaceAll", "Vuna/Compiler/Codegen/Term.vuna:1135"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames", ("Vuna.Compiler.Codegen.Term.qualifyBridgeNames", "Vuna/Compiler/Codegen/Term.vuna:1138"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeText", ("Vuna.Compiler.Codegen.Term.qualifyBridgeText", "Vuna/Compiler/Codegen/Term.vuna:1143"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenBridgeRef", ("Vuna.Compiler.Codegen.Term.genBridgeRef", "Vuna/Compiler/Codegen/Term.vuna:1148"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity", ("Vuna.Compiler.Codegen.Term.runtimeArity", "Vuna/Compiler/Codegen/Term.vuna:1156"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_daeEnv", ("Vuna.Compiler.Codegen.Term.aeEnv", "Vuna/Compiler/Codegen/Term.vuna:1167"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_daePats", ("Vuna.Compiler.Codegen.Term.aePats", "Vuna/Compiler/Codegen/Term.vuna:1170"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_daeSt", ("Vuna.Compiler.Codegen.Term.aeSt", "Vuna/Compiler/Codegen/Term.vuna:1173"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo", ("Vuna.Compiler.Codegen.Term.altEnvGo", "Vuna/Compiler/Codegen/Term.vuna:1176"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_daltEnv", ("Vuna.Compiler.Codegen.Term.altEnv", "Vuna/Compiler/Codegen/Term.vuna:1185"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked", ("Vuna.Compiler.Codegen.Term.altEnvChecked", "Vuna/Compiler/Codegen/Term.vuna:1194"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dcountKept", ("Vuna.Compiler.Codegen.Term.countKept", "Vuna/Compiler/Codegen/Term.vuna:1201"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull", ("Vuna.Compiler.Codegen.Term.altEnvFull", "Vuna/Compiler/Codegen/Term.vuna:1205"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept", ("Vuna.Compiler.Codegen.Term.altEnvKept", "Vuna/Compiler/Codegen/Term.vuna:1219"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_drecordTermAsApp", ("Vuna.Compiler.Codegen.Term.recordTermAsApp", "Vuna/Compiler/Codegen/Term.vuna:1229"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel", ("Vuna.Compiler.Codegen.Term.genTermFuel", "Vuna/Compiler/Codegen/Term.vuna:1233"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dcollectLamChain", ("Vuna.Compiler.Codegen.Term.collectLamChain", "Vuna/Compiler/Codegen/Term.vuna:1284"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dlamParamPair", ("Vuna.Compiler.Codegen.Term.lamParamPair", "Vuna/Compiler/Codegen/Term.vuna:1289"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dlamParamName", ("Vuna.Compiler.Codegen.Term.lamParamName", "Vuna/Compiler/Codegen/Term.vuna:1293"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel", ("Vuna.Compiler.Codegen.Term.genTermLamFuel", "Vuna/Compiler/Codegen/Term.vuna:1296"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel", ("Vuna.Compiler.Codegen.Term.genAppFuel", "Vuna/Compiler/Codegen/Term.vuna:1312"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity", ("Vuna.Compiler.Codegen.Term.inlineOpArity", "Vuna/Compiler/Codegen/Term.vuna:1329"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dinlineText", ("Vuna.Compiler.Codegen.Term.inlineText", "Vuna/Compiler/Codegen/Term.vuna:1371"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dinlineArityMatches", ("Vuna.Compiler.Codegen.Term.inlineArityMatches", "Vuna/Compiler/Codegen/Term.vuna:1417"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dflattenIntrinsicApp", ("Vuna.Compiler.Codegen.Term.flattenIntrinsicApp", "Vuna/Compiler/Codegen/Term.vuna:1422"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dflattenConcatChain", ("Vuna.Compiler.Codegen.Term.flattenConcatChain", "Vuna/Compiler/Codegen/Term.vuna:1432"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves", ("Vuna.Compiler.Codegen.Term.concatLeaves", "Vuna/Compiler/Codegen/Term.vuna:1439"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenAppOptimizedFuel", ("Vuna.Compiler.Codegen.Term.genAppOptimizedFuel", "Vuna/Compiler/Codegen/Term.vuna:1447"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFuel", ("Vuna.Compiler.Codegen.Term.genPlainAppFuel", "Vuna/Compiler/Codegen/Term.vuna:1455"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFallback", ("Vuna.Compiler.Codegen.Term.genPlainAppFallback", "Vuna/Compiler/Codegen/Term.vuna:1465"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineAppFuel", ("Vuna.Compiler.Codegen.Term.genInlineAppFuel", "Vuna/Compiler/Codegen/Term.vuna:1473"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineArgsFuel", ("Vuna.Compiler.Codegen.Term.genInlineArgsFuel", "Vuna/Compiler/Codegen/Term.vuna:1481"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartsFuel", ("Vuna.Compiler.Codegen.Term.genConcatPartsFuel", "Vuna/Compiler/Codegen/Term.vuna:1491"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartTexts", ("Vuna.Compiler.Codegen.Term.genConcatPartTexts", "Vuna/Compiler/Codegen/Term.vuna:1497"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dconAppText", ("Vuna.Compiler.Codegen.Term.conAppText", "Vuna/Compiler/Codegen/Term.vuna:1508"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs", ("Vuna.Compiler.Codegen.Term.alignCtorArgs", "Vuna/Compiler/Codegen/Term.vuna:1517"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel", ("Vuna.Compiler.Codegen.Term.genConArgsFuel", "Vuna/Compiler/Codegen/Term.vuna:1531"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dctorArgText", ("Vuna.Compiler.Codegen.Term.ctorArgText", "Vuna/Compiler/Codegen/Term.vuna:1543"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dnatChainNext", ("Vuna.Compiler.Codegen.Term.natChainNext", "Vuna/Compiler/Codegen/Term.vuna:1548"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dnatChainValue", ("Vuna.Compiler.Codegen.Term.natChainValue", "Vuna/Compiler/Codegen/Term.vuna:1551"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel", ("Vuna.Compiler.Codegen.Term.genConAppFuel", "Vuna/Compiler/Codegen/Term.vuna:1563"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppNonChainFuel", ("Vuna.Compiler.Codegen.Term.genConAppNonChainFuel", "Vuna/Compiler/Codegen/Term.vuna:1569"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily", ("Vuna.Compiler.Codegen.Term.gsDepOfFamily", "Vuna/Compiler/Codegen/Term.vuna:1599"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_drecordLabelOf", ("Vuna.Compiler.Codegen.Term.recordLabelOf", "Vuna/Compiler/Codegen/Term.vuna:1606"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_drecordConText", ("Vuna.Compiler.Codegen.Term.recordConText", "Vuna/Compiler/Codegen/Term.vuna:1613"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_drecordAssigned", ("Vuna.Compiler.Codegen.Term.recordAssigned", "Vuna/Compiler/Codegen/Term.vuna:1618"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_drecordPatText", ("Vuna.Compiler.Codegen.Term.recordPatText", "Vuna/Compiler/Codegen/Term.vuna:1625"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dlookupRtLabel", ("Vuna.Compiler.Codegen.Term.lookupRtLabel", "Vuna/Compiler/Codegen/Term.vuna:1629"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dlookupRtPos", ("Vuna.Compiler.Codegen.Term.lookupRtPos", "Vuna/Compiler/Codegen/Term.vuna:1634"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dlookupRtPositions", ("Vuna.Compiler.Codegen.Term.lookupRtPositions", "Vuna/Compiler/Codegen/Term.vuna:1639"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dnthTextOr", ("Vuna.Compiler.Codegen.Term.nthTextOr", "Vuna/Compiler/Codegen/Term.vuna:1645"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_drecordUpdateTextOf", ("Vuna.Compiler.Codegen.Term.recordUpdateTextOf", "Vuna/Compiler/Codegen/Term.vuna:1650"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dupdateAssigned", ("Vuna.Compiler.Codegen.Term.updateAssigned", "Vuna/Compiler/Codegen/Term.vuna:1655"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenRecordUpdateFuel", ("Vuna.Compiler.Codegen.Term.genRecordUpdateFuel", "Vuna/Compiler/Codegen/Term.vuna:1663"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_drecordAltBinders", ("Vuna.Compiler.Codegen.Term.recordAltBinders", "Vuna/Compiler/Codegen/Term.vuna:1678"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenRecordUpdateArgsFuel", ("Vuna.Compiler.Codegen.Term.genRecordUpdateArgsFuel", "Vuna/Compiler/Codegen/Term.vuna:1683"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenUpdTextsFuel", ("Vuna.Compiler.Codegen.Term.genUpdTextsFuel", "Vuna/Compiler/Codegen/Term.vuna:1698"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dnthOpqArg", ("Vuna.Compiler.Codegen.Term.nthOpqArg", "Vuna/Compiler/Codegen/Term.vuna:1711"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenProjAsCaseFuel", ("Vuna.Compiler.Codegen.Term.genProjAsCaseFuel", "Vuna/Compiler/Codegen/Term.vuna:1718"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFinish", ("Vuna.Compiler.Codegen.Term.genConAppFinish", "Vuna/Compiler/Codegen/Term.vuna:1727"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenUnboxedConAppFinish", ("Vuna.Compiler.Codegen.Term.genUnboxedConAppFinish", "Vuna/Compiler/Codegen/Term.vuna:1738"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt", ("Vuna.Compiler.Codegen.Term.hasFallbackAlt", "Vuna/Compiler/Codegen/Term.vuna:1749"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText", ("Vuna.Compiler.Codegen.Term.armPatternText", "Vuna/Compiler/Codegen/Term.vuna:1753"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dunboxedCaseAlt", ("Vuna.Compiler.Codegen.Term.unboxedCaseAlt", "Vuna/Compiler/Codegen/Term.vuna:1760"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dallCatchAll", ("Vuna.Compiler.Codegen.Term.allCatchAll", "Vuna/Compiler/Codegen/Term.vuna:1772"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenUnboxedCaseFuel", ("Vuna.Compiler.Codegen.Term.genUnboxedCaseFuel", "Vuna/Compiler/Codegen/Term.vuna:1777"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenUnboxedCaseByName", ("Vuna.Compiler.Codegen.Term.genUnboxedCaseByName", "Vuna/Compiler/Codegen/Term.vuna:1784"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenUnboxedCaseWithFlags", ("Vuna.Compiler.Codegen.Term.genUnboxedCaseWithFlags", "Vuna/Compiler/Codegen/Term.vuna:1791"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenUnboxedCaseWithScrut", ("Vuna.Compiler.Codegen.Term.genUnboxedCaseWithScrut", "Vuna/Compiler/Codegen/Term.vuna:1799"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenUnboxedCaseWithBound", ("Vuna.Compiler.Codegen.Term.genUnboxedCaseWithBound", "Vuna/Compiler/Codegen/Term.vuna:1806"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dunboxedCaseLet", ("Vuna.Compiler.Codegen.Term.unboxedCaseLet", "Vuna/Compiler/Codegen/Term.vuna:1813"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel", ("Vuna.Compiler.Codegen.Term.genArmFuel", "Vuna/Compiler/Codegen/Term.vuna:1820"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel", ("Vuna.Compiler.Codegen.Term.genArmsFuel", "Vuna/Compiler/Codegen/Term.vuna:1848"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_disNatCtorName", ("Vuna.Compiler.Codegen.Term.isNatCtorName", "Vuna/Compiler/Codegen/Term.vuna:1861"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseApplies", ("Vuna.Compiler.Codegen.Term.natCaseApplies", "Vuna/Compiler/Codegen/Term.vuna:1864"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors", ("Vuna.Compiler.Codegen.Term.natCaseAllCtors", "Vuna/Compiler/Codegen/Term.vuna:1868"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseHasCtor", ("Vuna.Compiler.Codegen.Term.natCaseHasCtor", "Vuna/Compiler/Codegen/Term.vuna:1874"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy", ("Vuna.Compiler.Codegen.Term.findAltBy", "Vuna/Compiler/Codegen/Term.vuna:1880"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dfindCatchAllAlt", ("Vuna.Compiler.Codegen.Term.findCatchAllAlt", "Vuna/Compiler/Codegen/Term.vuna:1884"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAltBodyFuel", ("Vuna.Compiler.Codegen.Term.genNatAltBodyFuel", "Vuna/Compiler/Codegen/Term.vuna:1890"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenNatCaseFuel", ("Vuna.Compiler.Codegen.Term.genNatCaseFuel", "Vuna/Compiler/Codegen/Term.vuna:1905"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseBranchesFuel", ("Vuna.Compiler.Codegen.Term.natCaseBranchesFuel", "Vuna/Compiler/Codegen/Term.vuna:1921"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dnatAltTextFuel", ("Vuna.Compiler.Codegen.Term.natAltTextFuel", "Vuna/Compiler/Codegen/Term.vuna:1947"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel", ("Vuna.Compiler.Codegen.Term.genCaseFuel", "Vuna/Compiler/Codegen/Term.vuna:1951"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenGenericCaseFuel", ("Vuna.Compiler.Codegen.Term.genGenericCaseFuel", "Vuna/Compiler/Codegen/Term.vuna:1960"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dmainUnitName", ("Vuna.Compiler.Codegen.Term.mainUnitName", "Vuna/Compiler/Codegen/Term.vuna:1981"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dmainInitWrap", ("Vuna.Compiler.Codegen.Term.mainInitWrap", "Vuna/Compiler/Codegen/Term.vuna:1988"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef", ("Vuna.Compiler.Codegen.Term.genGroupDef", "Vuna/Compiler/Codegen/Term.vuna:1994"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenExternTy", ("Vuna.Compiler.Codegen.Term.genExternTy", "Vuna/Compiler/Codegen/Term.vuna:2016"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dexternTyText", ("Vuna.Compiler.Codegen.Term.externTyText", "Vuna/Compiler/Codegen/Term.vuna:2019"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dexternDomText", ("Vuna.Compiler.Codegen.Term.externDomText", "Vuna/Compiler/Codegen/Term.vuna:2028"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText", ("Vuna.Compiler.Codegen.Term.externBasicText", "Vuna/Compiler/Codegen/Term.vuna:2034"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies", ("Vuna.Compiler.Codegen.Term.genGroupBodies", "Vuna/Compiler/Codegen/Term.vuna:2042"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec", ("Vuna.Compiler.Codegen.Term.groupNeedsRec", "Vuna/Compiler/Codegen/Term.vuna:2051"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed", ("Vuna.Compiler.Codegen.Term.recursiveValueAllowed", "Vuna/Compiler/Codegen/Term.vuna:2060"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue", ("Vuna.Compiler.Codegen.Term.firstBadRecursiveValue", "Vuna/Compiler/Codegen/Term.vuna:2065"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup", ("Vuna.Compiler.Codegen.Term.genGroup", "Vuna/Compiler/Codegen/Term.vuna:2074"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet", ("Vuna.Compiler.Codegen.Term.genGroupLet", "Vuna/Compiler/Codegen/Term.vuna:2083"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups", ("Vuna.Compiler.Codegen.Term.genGroups", "Vuna/Compiler/Codegen/Term.vuna:2093"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dmainShow", ("Vuna.Compiler.Codegen.Term.mainShow", "Vuna/Compiler/Codegen/Term.vuna:2104"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dactionResultTy", ("Vuna.Compiler.Codegen.Term.actionResultTy", "Vuna/Compiler/Codegen/Term.vuna:2113"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_disNilRowTermCodegen", ("Vuna.Compiler.Codegen.Term.isNilRowTermCodegen", "Vuna/Compiler/Codegen/Term.vuna:2122"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName", ("Vuna.Compiler.Codegen.Term.mainShowForName", "Vuna/Compiler/Codegen/Term.vuna:2127"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dmainShowSynth", ("Vuna.Compiler.Codegen.Term.mainShowSynth", "Vuna/Compiler/Codegen/Term.vuna:2136"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook", ("Vuna.Compiler.Codegen.Term.genDtHook", "Vuna/Compiler/Codegen/Term.vuna:2144"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dactionRunText", ("Vuna.Compiler.Codegen.Term.actionRunText", "Vuna/Compiler/Codegen/Term.vuna:2161"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm", ("Vuna.Compiler.Codegen.Term.genTerm", "Vuna/Compiler/Codegen/Term.vuna:2168"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLam", ("Vuna.Compiler.Codegen.Term.genTermLam", "Vuna/Compiler/Codegen/Term.vuna:2171"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenApp", ("Vuna.Compiler.Codegen.Term.genApp", "Vuna/Compiler/Codegen/Term.vuna:2174"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenConApp", ("Vuna.Compiler.Codegen.Term.genConApp", "Vuna/Compiler/Codegen/Term.vuna:2177"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgs", ("Vuna.Compiler.Codegen.Term.genConArgs", "Vuna/Compiler/Codegen/Term.vuna:2180"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenArm", ("Vuna.Compiler.Codegen.Term.genArm", "Vuna/Compiler/Codegen/Term.vuna:2183"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenArms", ("Vuna.Compiler.Codegen.Term.genArms", "Vuna/Compiler/Codegen/Term.vuna:2186"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenCase", ("Vuna.Compiler.Codegen.Term.genCase", "Vuna/Compiler/Codegen/Term.vuna:2189"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit", ("Vuna.Compiler.Codegen.Assembly.runtimeUnit", "Vuna/Compiler/Codegen/Assembly.vuna:32"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps", ("Vuna.Compiler.Codegen.Assembly.unitPartsDeps", "Vuna/Compiler/Codegen/Assembly.vuna:44"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dprepareDtProgram", ("Vuna.Compiler.Codegen.Assembly.prepareDtProgram", "Vuna/Compiler/Codegen/Assembly.vuna:49"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts", ("Vuna.Compiler.Codegen.Assembly.genUnitParts", "Vuna/Compiler/Codegen/Assembly.vuna:85"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_daddDep", ("Vuna.Compiler.Codegen.Assembly.addDep", "Vuna/Compiler/Codegen/Assembly.vuna:98"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_duniqueDeps", ("Vuna.Compiler.Codegen.Assembly.uniqueDeps", "Vuna/Compiler/Codegen/Assembly.vuna:101"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText", ("Vuna.Compiler.Codegen.Assembly.genUnitText", "Vuna/Compiler/Codegen/Assembly.vuna:106"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dmainHook", ("Vuna.Compiler.Codegen.Assembly.mainHook", "Vuna/Compiler/Codegen/Assembly.vuna:113"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dhookDeps", ("Vuna.Compiler.Codegen.Assembly.hookDeps", "Vuna/Compiler/Codegen/Assembly.vuna:131"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDtProgram", ("Vuna.Compiler.Codegen.Assembly.checkDtProgram", "Vuna/Compiler/Codegen/Assembly.vuna:137"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader", ("Vuna.Compiler.Codegen.Assembly.openHeader", "Vuna/Compiler/Codegen/Assembly.vuna:150"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dconcatGroups", ("Vuna.Compiler.Codegen.Assembly.concatGroups", "Vuna/Compiler/Codegen/Assembly.vuna:153"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dlistBridgeFor", ("Vuna.Compiler.Codegen.Assembly.listBridgeFor", "Vuna/Compiler/Codegen/Assembly.vuna:158"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dmemDataName", ("Vuna.Compiler.Codegen.Assembly.memDataName", "Vuna/Compiler/Codegen/Assembly.vuna:163"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan", ("Vuna.Compiler.Driver.Owner.splitNoSpan", "Vuna/Compiler/Driver/Owner.vuna:36"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dentryOwner", ("Vuna.Compiler.Driver.Owner.entryOwner", "Vuna/Compiler/Driver/Owner.vuna:40"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName", ("Vuna.Compiler.Driver.Owner.modulePrefixOfName", "Vuna/Compiler/Driver/Owner.vuna:43"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames", ("Vuna.Compiler.Driver.Owner.splitDeclNames", "Vuna/Compiler/Driver/Owner.vuna:50"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDataNames", ("Vuna.Compiler.Driver.Owner.splitDataNames", "Vuna/Compiler/Driver/Owner.vuna:61"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dheadClassName", ("Vuna.Compiler.Driver.Owner.headClassName", "Vuna/Compiler/Driver/Owner.vuna:68"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnerOf", ("Vuna.Compiler.Driver.Owner.splitInstanceOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:77"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dhasFieldRecordTypeExpr", ("Vuna.Compiler.Driver.Owner.hasFieldRecordTypeExpr", "Vuna/Compiler/Driver/Owner.vuna:88"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dhasFieldOwnerOf", ("Vuna.Compiler.Driver.Owner.hasFieldOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:93"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitHasFieldOwners", ("Vuna.Compiler.Driver.Owner.splitHasFieldOwners", "Vuna/Compiler/Driver/Owner.vuna:104"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDerivedOwners", ("Vuna.Compiler.Driver.Owner.splitDerivedOwners", "Vuna/Compiler/Driver/Owner.vuna:109"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitTraitDefOwnerOf", ("Vuna.Compiler.Driver.Owner.splitTraitDefOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:117"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitTraitDataOwnerOf", ("Vuna.Compiler.Driver.Owner.splitTraitDataOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:122"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnersGo", ("Vuna.Compiler.Driver.Owner.splitInstanceOwnersGo", "Vuna/Compiler/Driver/Owner.vuna:126"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOf", ("Vuna.Compiler.Driver.Owner.splitOwnerEntriesOf", "Vuna/Compiler/Driver/Owner.vuna:131"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOf", ("Vuna.Compiler.Driver.Owner.splitDataOwnerEntriesOf", "Vuna/Compiler/Driver/Owner.vuna:136"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOfModules", ("Vuna.Compiler.Driver.Owner.splitOwnerEntriesOfModules", "Vuna/Compiler/Driver/Owner.vuna:141"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOfModules", ("Vuna.Compiler.Driver.Owner.splitDataOwnerEntriesOfModules", "Vuna/Compiler/Driver/Owner.vuna:146"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf", ("Vuna.Compiler.Driver.Owner.splitMetaOf", "Vuna/Compiler/Driver/Owner.vuna:161"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dlookupModuleOf", ("Vuna.Compiler.Driver.Owner.lookupModuleOf", "Vuna/Compiler/Driver/Owner.vuna:173"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dknownModuleOrErr", ("Vuna.Compiler.Driver.Owner.knownModuleOrErr", "Vuna/Compiler/Driver/Owner.vuna:176"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerOf", ("Vuna.Compiler.Driver.Owner.splitDataOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:183"));
  ("v_Vuna_dCompiler_dDriver_dOwner_disSyntheticInternalName", ("Vuna.Compiler.Driver.Owner.isSyntheticInternalName", "Vuna/Compiler/Driver/Owner.vuna:193"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDefOwnerOf", ("Vuna.Compiler.Driver.Owner.splitDefOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:196"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDefs", ("Vuna.Compiler.Driver.Owner.nameOwnerPairsOfDefs", "Vuna/Compiler/Driver/Owner.vuna:204"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDatas", ("Vuna.Compiler.Driver.Owner.nameOwnerPairsOfDatas", "Vuna/Compiler/Driver/Owner.vuna:210"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsplitName", ("Vuna.Compiler.Driver.Split.splitName", "Vuna/Compiler/Driver/Split.vuna:39"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsplitText", ("Vuna.Compiler.Driver.Split.splitText", "Vuna/Compiler/Driver/Split.vuna:42"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsplitDeps", ("Vuna.Compiler.Driver.Split.splitDeps", "Vuna/Compiler/Driver/Split.vuna:46"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFiles", ("Vuna.Compiler.Driver.Split.writeSplitFiles", "Vuna/Compiler/Driver/Split.vuna:50"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged", ("Vuna.Compiler.Driver.Split.writeSplitFilesIfChanged", "Vuna/Compiler/Driver/Split.vuna:61"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph", ("Vuna.Compiler.Driver.Split.splitGraph", "Vuna/Compiler/Driver/Split.vuna:85"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dstripMl", ("Vuna.Compiler.Driver.Split.stripMl", "Vuna/Compiler/Driver/Split.vuna:93"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsplitLayers", ("Vuna.Compiler.Driver.Split.splitLayers", "Vuna/Compiler/Driver/Split.vuna:99"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsplitDepths", ("Vuna.Compiler.Driver.Split.splitDepths", "Vuna/Compiler/Driver/Split.vuna:108"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddepthOfDeps", ("Vuna.Compiler.Driver.Split.depthOfDeps", "Vuna/Compiler/Driver/Split.vuna:114"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit", ("Vuna.Compiler.Driver.Split.depthOfUnit", "Vuna/Compiler/Driver/Split.vuna:118"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dgraphMaxDepth", ("Vuna.Compiler.Driver.Split.graphMaxDepth", "Vuna/Compiler/Driver/Split.vuna:123"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dmaxInt", ("Vuna.Compiler.Driver.Split.maxInt", "Vuna/Compiler/Driver/Split.vuna:128"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dbuildScript", ("Vuna.Compiler.Driver.Split.buildScript", "Vuna/Compiler/Driver/Split.vuna:139"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dstampWrites", ("Vuna.Compiler.Driver.Split.stampWrites", "Vuna/Compiler/Driver/Split.vuna:208"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dgraphUnits", ("Vuna.Compiler.Driver.Split.graphUnits", "Vuna/Compiler/Driver/Split.vuna:213"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dlayerScripts", ("Vuna.Compiler.Driver.Split.layerScripts", "Vuna/Compiler/Driver/Split.vuna:218"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dlayerCalls", ("Vuna.Compiler.Driver.Split.layerCalls", "Vuna/Compiler/Driver/Split.vuna:222"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dbgCalls", ("Vuna.Compiler.Driver.Split.bgCalls", "Vuna/Compiler/Driver/Split.vuna:229"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin", ("Vuna.Compiler.Driver.Split.spaceJoin", "Vuna/Compiler/Driver/Split.vuna:235"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix", ("Vuna.Compiler.Driver.Split.depsSuffix", "Vuna/Compiler/Driver/Split.vuna:239"));
  ("v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs", ("Vuna.Compiler.Driver.Split.joinCmxs", "Vuna/Compiler/Driver/Split.vuna:243"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dunitTieKey", ("Vuna.Compiler.Driver.Split.unitTieKey", "Vuna/Compiler/Driver/Split.vuna:260"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dnameSetOf", ("Vuna.Compiler.Driver.Split.nameSetOf", "Vuna/Compiler/Driver/Split.vuna:264"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dmarkNames", ("Vuna.Compiler.Driver.Split.markNames", "Vuna/Compiler/Driver/Split.vuna:269"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dtieTableOf", ("Vuna.Compiler.Driver.Split.tieTableOf", "Vuna/Compiler/Driver/Split.vuna:273"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dtieOf", ("Vuna.Compiler.Driver.Split.tieOf", "Vuna/Compiler/Driver/Split.vuna:278"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dmaxDepth", ("Vuna.Compiler.Driver.Split.maxDepth", "Vuna/Compiler/Driver/Split.vuna:285"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dstepDepths", ("Vuna.Compiler.Driver.Split.stepDepths", "Vuna/Compiler/Driver/Split.vuna:293"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsameDepthTable", ("Vuna.Compiler.Driver.Split.sameDepthTable", "Vuna/Compiler/Driver/Split.vuna:301"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dfixDepths", ("Vuna.Compiler.Driver.Split.fixDepths", "Vuna/Compiler/Driver/Split.vuna:306"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddepthEntryLess", ("Vuna.Compiler.Driver.Split.depthEntryLess", "Vuna/Compiler/Driver/Split.vuna:314"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dinsertDepthEntry", ("Vuna.Compiler.Driver.Split.insertDepthEntry", "Vuna/Compiler/Driver/Split.vuna:319"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsortDepthEntries", ("Vuna.Compiler.Driver.Split.sortDepthEntries", "Vuna/Compiler/Driver/Split.vuna:325"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dfilesOfDepthEntries", ("Vuna.Compiler.Driver.Split.filesOfDepthEntries", "Vuna/Compiler/Driver/Split.vuna:330"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dcanonicalTopo", ("Vuna.Compiler.Driver.Split.canonicalTopo", "Vuna/Compiler/Driver/Split.vuna:336"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsortDepsByTie", ("Vuna.Compiler.Driver.Split.sortDepsByTie", "Vuna/Compiler/Driver/Split.vuna:350"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsortDepEntries", ("Vuna.Compiler.Driver.Split.sortDepEntries", "Vuna/Compiler/Driver/Split.vuna:353"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dinsertDep", ("Vuna.Compiler.Driver.Split.insertDep", "Vuna/Compiler/Driver/Split.vuna:357"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dnormalizeFileDeps", ("Vuna.Compiler.Driver.Split.normalizeFileDeps", "Vuna/Compiler/Driver/Split.vuna:363"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dencSplitFile", ("Vuna.Compiler.Driver.Split.encSplitFile", "Vuna/Compiler/Driver/Split.vuna:374"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFile", ("Vuna.Compiler.Driver.Split.decSplitFile", "Vuna/Compiler/Driver/Split.vuna:377"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dencSplitFiles", ("Vuna.Compiler.Driver.Split.encSplitFiles", "Vuna/Compiler/Driver/Split.vuna:385"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFilesComplete", ("Vuna.Compiler.Driver.Split.decSplitFilesComplete", "Vuna/Compiler/Driver/Split.vuna:389"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFileComplete", ("Vuna.Compiler.Driver.Split.decSplitFileComplete", "Vuna/Compiler/Driver/Split.vuna:395"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dsplitUnitOfModule", ("Vuna.Compiler.Codegen.Split.splitUnitOfModule", "Vuna/Compiler/Codegen/Split.vuna:30"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dmainInitPrologue", ("Vuna.Compiler.Codegen.Split.mainInitPrologue", "Vuna/Compiler/Codegen/Split.vuna:35"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_downerTblOf", ("Vuna.Compiler.Codegen.Split.ownerTblOf", "Vuna/Compiler/Codegen/Split.vuna:43"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_downerOfTbl", ("Vuna.Compiler.Codegen.Split.ownerOfTbl", "Vuna/Compiler/Codegen/Split.vuna:46"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_ddatasInUnit", ("Vuna.Compiler.Codegen.Split.datasInUnit", "Vuna/Compiler/Codegen/Split.vuna:51"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_ddefsInUnit", ("Vuna.Compiler.Codegen.Split.defsInUnit", "Vuna/Compiler/Codegen/Split.vuna:54"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dposOfName", ("Vuna.Compiler.Codegen.Split.posOfName", "Vuna/Compiler/Codegen/Split.vuna:63"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dposOfNameGo", ("Vuna.Compiler.Codegen.Split.posOfNameGo", "Vuna/Compiler/Codegen/Split.vuna:66"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dcheckDepsOrder", ("Vuna.Compiler.Codegen.Split.checkDepsOrder", "Vuna/Compiler/Codegen/Split.vuna:70"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_ddepsInOrder", ("Vuna.Compiler.Codegen.Split.depsInOrder", "Vuna/Compiler/Codegen/Split.vuna:81"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dunitDepsOf", ("Vuna.Compiler.Codegen.Split.unitDepsOf", "Vuna/Compiler/Codegen/Split.vuna:84"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dmapToUnit", ("Vuna.Compiler.Codegen.Split.mapToUnit", "Vuna/Compiler/Codegen/Split.vuna:100"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclName", ("Vuna.Compiler.Codegen.Split.checkModuleDeclName", "Vuna/Compiler/Codegen/Split.vuna:106"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDeclNames", ("Vuna.Compiler.Codegen.Split.checkModuleDeclNames", "Vuna/Compiler/Codegen/Split.vuna:114"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dcheckModuleDecls", ("Vuna.Compiler.Codegen.Split.checkModuleDecls", "Vuna/Compiler/Codegen/Split.vuna:120"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclIdentities", ("Vuna.Compiler.Codegen.Split.entryDeclIdentities", "Vuna/Compiler/Codegen/Split.vuna:130"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dentryDeclKey", ("Vuna.Compiler.Codegen.Split.entryDeclKey", "Vuna/Compiler/Codegen/Split.vuna:142"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclName", ("Vuna.Compiler.Codegen.Split.checkEntryDeclName", "Vuna/Compiler/Codegen/Split.vuna:146"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDeclsGo", ("Vuna.Compiler.Codegen.Split.checkEntryDeclsGo", "Vuna/Compiler/Codegen/Split.vuna:156"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dcheckEntryDecls", ("Vuna.Compiler.Codegen.Split.checkEntryDecls", "Vuna/Compiler/Codegen/Split.vuna:162"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dcheckDefOwners", ("Vuna.Compiler.Codegen.Split.checkDefOwners", "Vuna/Compiler/Codegen/Split.vuna:167"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dcheckDataOwners", ("Vuna.Compiler.Codegen.Split.checkDataOwners", "Vuna/Compiler/Codegen/Split.vuna:172"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dcheckResolvedModules", ("Vuna.Compiler.Codegen.Split.checkResolvedModules", "Vuna/Compiler/Codegen/Split.vuna:177"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripPrefix", ("Vuna.Compiler.Codegen.Split.splitStripPrefix", "Vuna/Compiler/Codegen/Split.vuna:188"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripRoots", ("Vuna.Compiler.Codegen.Split.splitStripRoots", "Vuna/Compiler/Codegen/Split.vuna:194"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dsplitStripDotSlash", ("Vuna.Compiler.Codegen.Split.splitStripDotSlash", "Vuna/Compiler/Codegen/Split.vuna:199"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dsplitLocPath", ("Vuna.Compiler.Codegen.Split.splitLocPath", "Vuna/Compiler/Codegen/Split.vuna:203"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dnoUnitLookup", ("Vuna.Compiler.Codegen.Split.noUnitLookup", "Vuna/Compiler/Codegen/Split.vuna:209"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dnoUnitStore", ("Vuna.Compiler.Codegen.Split.noUnitStore", "Vuna/Compiler/Codegen/Split.vuna:212"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgram", ("Vuna.Compiler.Codegen.Split.generateDtSplitProgram", "Vuna/Compiler/Codegen/Split.vuna:217"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_danyDefUsesFloat", ("Vuna.Compiler.Codegen.Split.anyDefUsesFloat", "Vuna/Compiler/Codegen/Split.vuna:229"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_danyDefUsesTrace", ("Vuna.Compiler.Codegen.Split.anyDefUsesTrace", "Vuna/Compiler/Codegen/Split.vuna:237"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dgenerateDtSplitProgramWith", ("Vuna.Compiler.Codegen.Split.generateDtSplitProgramWith", "Vuna/Compiler/Codegen/Split.vuna:243"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dsplitProgramFilesWith", ("Vuna.Compiler.Codegen.Split.splitProgramFilesWith", "Vuna/Compiler/Codegen/Split.vuna:265"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dsplitWithOwnersWith", ("Vuna.Compiler.Codegen.Split.splitWithOwnersWith", "Vuna/Compiler/Codegen/Split.vuna:276"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dsplitModuleFilesWith", ("Vuna.Compiler.Codegen.Split.splitModuleFilesWith", "Vuna/Compiler/Codegen/Split.vuna:299"));
  ("v_Vuna_dCompiler_dCodegen_dSplit_dsplitMainFileWith", ("Vuna.Compiler.Codegen.Split.splitMainFileWith", "Vuna/Compiler/Codegen/Split.vuna:335"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dnoSpan", ("Vuna.Compiler.Canonical.CoreTerm.noSpan", "Vuna/Compiler/Canonical/CoreTerm.vuna:33"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dencRig", ("Vuna.Compiler.Canonical.CoreTerm.encRig", "Vuna/Compiler/Canonical/CoreTerm.vuna:40"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dencArg", ("Vuna.Compiler.Canonical.CoreTerm.encArg", "Vuna/Compiler/Canonical/CoreTerm.vuna:46"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dencArgs", ("Vuna.Compiler.Canonical.CoreTerm.encArgs", "Vuna/Compiler/Canonical/CoreTerm.vuna:50"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dencArgsGo", ("Vuna.Compiler.Canonical.CoreTerm.encArgsGo", "Vuna/Compiler/Canonical/CoreTerm.vuna:54"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dencBinder", ("Vuna.Compiler.Canonical.CoreTerm.encBinder", "Vuna/Compiler/Canonical/CoreTerm.vuna:59"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dencBinders", ("Vuna.Compiler.Canonical.CoreTerm.encBinders", "Vuna/Compiler/Canonical/CoreTerm.vuna:63"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dencAlt", ("Vuna.Compiler.Canonical.CoreTerm.encAlt", "Vuna/Compiler/Canonical/CoreTerm.vuna:67"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dencAlts", ("Vuna.Compiler.Canonical.CoreTerm.encAlts", "Vuna/Compiler/Canonical/CoreTerm.vuna:71"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dencAltsGo", ("Vuna.Compiler.Canonical.CoreTerm.encAltsGo", "Vuna/Compiler/Canonical/CoreTerm.vuna:75"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dencInts", ("Vuna.Compiler.Canonical.CoreTerm.encInts", "Vuna/Compiler/Canonical/CoreTerm.vuna:80"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dencTerm", ("Vuna.Compiler.Canonical.CoreTerm.encTerm", "Vuna/Compiler/Canonical/CoreTerm.vuna:84"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_dencTermBytes", ("Vuna.Compiler.Canonical.CoreTerm.encTermBytes", "Vuna/Compiler/Canonical/CoreTerm.vuna:107"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_ddecRig", ("Vuna.Compiler.Canonical.CoreTerm.decRig", "Vuna/Compiler/Canonical/CoreTerm.vuna:115"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_ddecArg", ("Vuna.Compiler.Canonical.CoreTerm.decArg", "Vuna/Compiler/Canonical/CoreTerm.vuna:126"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_ddecBinder", ("Vuna.Compiler.Canonical.CoreTerm.decBinder", "Vuna/Compiler/Canonical/CoreTerm.vuna:135"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_ddecAlt", ("Vuna.Compiler.Canonical.CoreTerm.decAlt", "Vuna/Compiler/Canonical/CoreTerm.vuna:144"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_ddecTerm", ("Vuna.Compiler.Canonical.CoreTerm.decTerm", "Vuna/Compiler/Canonical/CoreTerm.vuna:155"));
  ("v_Vuna_dCompiler_dCanonical_dCoreTerm_ddecTermComplete", ("Vuna.Compiler.Canonical.CoreTerm.decTermComplete", "Vuna/Compiler/Canonical/CoreTerm.vuna:263"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencDtCtor", ("Vuna.Compiler.Canonical.Elab.encDtCtor", "Vuna/Compiler/Canonical/Elab.vuna:67"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencDtFieldMeta", ("Vuna.Compiler.Canonical.Elab.encDtFieldMeta", "Vuna/Compiler/Canonical/Elab.vuna:72"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencDtData", ("Vuna.Compiler.Canonical.Elab.encDtData", "Vuna/Compiler/Canonical/Elab.vuna:76"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencDtDef", ("Vuna.Compiler.Canonical.Elab.encDtDef", "Vuna/Compiler/Canonical/Elab.vuna:82"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencDtDefs", ("Vuna.Compiler.Canonical.Elab.encDtDefs", "Vuna/Compiler/Canonical/Elab.vuna:88"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencDtInst", ("Vuna.Compiler.Canonical.Elab.encDtInst", "Vuna/Compiler/Canonical/Elab.vuna:92"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencDtClass", ("Vuna.Compiler.Canonical.Elab.encDtClass", "Vuna/Compiler/Canonical/Elab.vuna:97"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencTelePair", ("Vuna.Compiler.Canonical.Elab.encTelePair", "Vuna/Compiler/Canonical/Elab.vuna:102"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencBinder", ("Vuna.Compiler.Canonical.Elab.encBinder", "Vuna/Compiler/Canonical/Elab.vuna:106"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencMaybeTerm", ("Vuna.Compiler.Canonical.Elab.encMaybeTerm", "Vuna/Compiler/Canonical/Elab.vuna:110"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencReprTier", ("Vuna.Compiler.Canonical.Elab.encReprTier", "Vuna/Compiler/Canonical/Elab.vuna:114"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencExportEntry", ("Vuna.Compiler.Canonical.Elab.encExportEntry", "Vuna/Compiler/Canonical/Elab.vuna:123"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencExportEntries", ("Vuna.Compiler.Canonical.Elab.encExportEntries", "Vuna/Compiler/Canonical/Elab.vuna:127"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencFixity", ("Vuna.Compiler.Canonical.Elab.encFixity", "Vuna/Compiler/Canonical/Elab.vuna:131"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencFixities", ("Vuna.Compiler.Canonical.Elab.encFixities", "Vuna/Compiler/Canonical/Elab.vuna:137"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencImport", ("Vuna.Compiler.Canonical.Elab.encImport", "Vuna/Compiler/Canonical/Elab.vuna:141"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencImports", ("Vuna.Compiler.Canonical.Elab.encImports", "Vuna/Compiler/Canonical/Elab.vuna:146"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencRecordFieldMeta", ("Vuna.Compiler.Canonical.Elab.encRecordFieldMeta", "Vuna/Compiler/Canonical/Elab.vuna:150"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencRecordMeta", ("Vuna.Compiler.Canonical.Elab.encRecordMeta", "Vuna/Compiler/Canonical/Elab.vuna:155"));
  ("v_Vuna_dCompiler_dCanonical_dElab_dencRecordMetas", ("Vuna.Compiler.Canonical.Elab.encRecordMetas", "Vuna/Compiler/Canonical/Elab.vuna:161"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecBinder", ("Vuna.Compiler.Canonical.Elab.decBinder", "Vuna/Compiler/Canonical/Elab.vuna:168"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecTelePair", ("Vuna.Compiler.Canonical.Elab.decTelePair", "Vuna/Compiler/Canonical/Elab.vuna:175"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecReprTier", ("Vuna.Compiler.Canonical.Elab.decReprTier", "Vuna/Compiler/Canonical/Elab.vuna:181"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecDtCtor", ("Vuna.Compiler.Canonical.Elab.decDtCtor", "Vuna/Compiler/Canonical/Elab.vuna:191"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecDtFieldMeta", ("Vuna.Compiler.Canonical.Elab.decDtFieldMeta", "Vuna/Compiler/Canonical/Elab.vuna:197"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecDtData", ("Vuna.Compiler.Canonical.Elab.decDtData", "Vuna/Compiler/Canonical/Elab.vuna:203"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecDtDef", ("Vuna.Compiler.Canonical.Elab.decDtDef", "Vuna/Compiler/Canonical/Elab.vuna:209"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecDtDefs", ("Vuna.Compiler.Canonical.Elab.decDtDefs", "Vuna/Compiler/Canonical/Elab.vuna:225"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecDtInst", ("Vuna.Compiler.Canonical.Elab.decDtInst", "Vuna/Compiler/Canonical/Elab.vuna:229"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecDtClass", ("Vuna.Compiler.Canonical.Elab.decDtClass", "Vuna/Compiler/Canonical/Elab.vuna:235"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecExportEntry", ("Vuna.Compiler.Canonical.Elab.decExportEntry", "Vuna/Compiler/Canonical/Elab.vuna:241"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecExportEntries", ("Vuna.Compiler.Canonical.Elab.decExportEntries", "Vuna/Compiler/Canonical/Elab.vuna:247"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecFixity", ("Vuna.Compiler.Canonical.Elab.decFixity", "Vuna/Compiler/Canonical/Elab.vuna:251"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecFixities", ("Vuna.Compiler.Canonical.Elab.decFixities", "Vuna/Compiler/Canonical/Elab.vuna:257"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecImport", ("Vuna.Compiler.Canonical.Elab.decImport", "Vuna/Compiler/Canonical/Elab.vuna:261"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecImports", ("Vuna.Compiler.Canonical.Elab.decImports", "Vuna/Compiler/Canonical/Elab.vuna:267"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecRecordFieldMeta", ("Vuna.Compiler.Canonical.Elab.decRecordFieldMeta", "Vuna/Compiler/Canonical/Elab.vuna:271"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecRecordMeta", ("Vuna.Compiler.Canonical.Elab.decRecordMeta", "Vuna/Compiler/Canonical/Elab.vuna:277"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecRecordMetas", ("Vuna.Compiler.Canonical.Elab.decRecordMetas", "Vuna/Compiler/Canonical/Elab.vuna:283"));
  ("v_Vuna_dCompiler_dCanonical_dElab_ddecDtDefsComplete", ("Vuna.Compiler.Canonical.Elab.decDtDefsComplete", "Vuna/Compiler/Canonical/Elab.vuna:287"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedDatas", ("Vuna.Compiler.Driver.Cache.cachedDatas", "Vuna/Compiler/Driver/Cache.vuna:51"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedDefs", ("Vuna.Compiler.Driver.Cache.cachedDefs", "Vuna/Compiler/Driver/Cache.vuna:54"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals", ("Vuna.Compiler.Driver.Cache.cachedGlobals", "Vuna/Compiler/Driver/Cache.vuna:57"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedInsts", ("Vuna.Compiler.Driver.Cache.cachedInsts", "Vuna/Compiler/Driver/Cache.vuna:60"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedClasses", ("Vuna.Compiler.Driver.Cache.cachedClasses", "Vuna/Compiler/Driver/Cache.vuna:63"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixTerm", ("Vuna.Compiler.Driver.Cache.fixTerm", "Vuna/Compiler/Driver/Cache.vuna:69"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixDef", ("Vuna.Compiler.Driver.Cache.fixDef", "Vuna/Compiler/Driver/Cache.vuna:72"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixCtor", ("Vuna.Compiler.Driver.Cache.fixCtor", "Vuna/Compiler/Driver/Cache.vuna:77"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixFieldMeta", ("Vuna.Compiler.Driver.Cache.fixFieldMeta", "Vuna/Compiler/Driver/Cache.vuna:82"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixData", ("Vuna.Compiler.Driver.Cache.fixData", "Vuna/Compiler/Driver/Cache.vuna:84"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixClass", ("Vuna.Compiler.Driver.Cache.fixClass", "Vuna/Compiler/Driver/Cache.vuna:92"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixTele", ("Vuna.Compiler.Driver.Cache.fixTele", "Vuna/Compiler/Driver/Cache.vuna:98"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixInst", ("Vuna.Compiler.Driver.Cache.fixInst", "Vuna/Compiler/Driver/Cache.vuna:103"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram", ("Vuna.Compiler.Driver.Cache.cachedOfProgram", "Vuna/Compiler/Driver/Cache.vuna:109"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgramWith", ("Vuna.Compiler.Driver.Cache.cachedOfProgramWith", "Vuna/Compiler/Driver/Cache.vuna:115"));
  ("v_Vuna_dCompiler_dDriver_dCache_dtermValidAt", ("Vuna.Compiler.Driver.Cache.termValidAt", "Vuna/Compiler/Driver/Cache.vuna:126"));
  ("v_Vuna_dCompiler_dDriver_dCache_dctorsValid", ("Vuna.Compiler.Driver.Cache.ctorsValid", "Vuna/Compiler/Driver/Cache.vuna:130"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddatasValid", ("Vuna.Compiler.Driver.Cache.datasValid", "Vuna/Compiler/Driver/Cache.vuna:134"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddefsValid", ("Vuna.Compiler.Driver.Cache.defsValid", "Vuna/Compiler/Driver/Cache.vuna:139"));
  ("v_Vuna_dCompiler_dDriver_dCache_dbodyValid", ("Vuna.Compiler.Driver.Cache.bodyValid", "Vuna/Compiler/Driver/Cache.vuna:147"));
  ("v_Vuna_dCompiler_dDriver_dCache_dglobalsValid", ("Vuna.Compiler.Driver.Cache.globalsValid", "Vuna/Compiler/Driver/Cache.vuna:150"));
  ("v_Vuna_dCompiler_dDriver_dCache_dteleValid", ("Vuna.Compiler.Driver.Cache.teleValid", "Vuna/Compiler/Driver/Cache.vuna:154"));
  ("v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt", ("Vuna.Compiler.Driver.Cache.termsValidAt", "Vuna/Compiler/Driver/Cache.vuna:158"));
  ("v_Vuna_dCompiler_dDriver_dCache_dinstsValid", ("Vuna.Compiler.Driver.Cache.instsValid", "Vuna/Compiler/Driver/Cache.vuna:162"));
  ("v_Vuna_dCompiler_dDriver_dCache_dclassesValid", ("Vuna.Compiler.Driver.Cache.classesValid", "Vuna/Compiler/Driver/Cache.vuna:172"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid", ("Vuna.Compiler.Driver.Cache.cachedProgramValid", "Vuna/Compiler/Driver/Cache.vuna:181"));
  ("v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt", ("Vuna.Compiler.Driver.Cache.termIssueAt", "Vuna/Compiler/Driver/Cache.vuna:192"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddataIssue", ("Vuna.Compiler.Driver.Cache.dataIssue", "Vuna/Compiler/Driver/Cache.vuna:197"));
  ("v_Vuna_dCompiler_dDriver_dCache_dctorIssues", ("Vuna.Compiler.Driver.Cache.ctorIssues", "Vuna/Compiler/Driver/Cache.vuna:203"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddatasIssue", ("Vuna.Compiler.Driver.Cache.datasIssue", "Vuna/Compiler/Driver/Cache.vuna:210"));
  ("v_Vuna_dCompiler_dDriver_dCache_dbodyIssueAt", ("Vuna.Compiler.Driver.Cache.bodyIssueAt", "Vuna/Compiler/Driver/Cache.vuna:217"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddefIssue", ("Vuna.Compiler.Driver.Cache.defIssue", "Vuna/Compiler/Driver/Cache.vuna:222"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddefsIssue", ("Vuna.Compiler.Driver.Cache.defsIssue", "Vuna/Compiler/Driver/Cache.vuna:234"));
  ("v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue", ("Vuna.Compiler.Driver.Cache.globalsIssue", "Vuna/Compiler/Driver/Cache.vuna:241"));
  ("v_Vuna_dCompiler_dDriver_dCache_dinstIssue", ("Vuna.Compiler.Driver.Cache.instIssue", "Vuna/Compiler/Driver/Cache.vuna:248"));
  ("v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo", ("Vuna.Compiler.Driver.Cache.teleIssueGo", "Vuna/Compiler/Driver/Cache.vuna:263"));
  ("v_Vuna_dCompiler_dDriver_dCache_dctxIssues", ("Vuna.Compiler.Driver.Cache.ctxIssues", "Vuna/Compiler/Driver/Cache.vuna:270"));
  ("v_Vuna_dCompiler_dDriver_dCache_dinstsIssue", ("Vuna.Compiler.Driver.Cache.instsIssue", "Vuna/Compiler/Driver/Cache.vuna:277"));
  ("v_Vuna_dCompiler_dDriver_dCache_dclassIssue", ("Vuna.Compiler.Driver.Cache.classIssue", "Vuna/Compiler/Driver/Cache.vuna:284"));
  ("v_Vuna_dCompiler_dDriver_dCache_dclassesIssue", ("Vuna.Compiler.Driver.Cache.classesIssue", "Vuna/Compiler/Driver/Cache.vuna:294"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedProgramIssue", ("Vuna.Compiler.Driver.Cache.cachedProgramIssue", "Vuna/Compiler/Driver/Cache.vuna:301"));
  ("v_Vuna_dCompiler_dDriver_dCache_dsummaryMetaSegment", ("Vuna.Compiler.Driver.Cache.summaryMetaSegment", "Vuna/Compiler/Driver/Cache.vuna:321"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftTerm", ("Vuna.Compiler.Driver.Cache.shiftTerm", "Vuna/Compiler/Driver/Cache.vuna:325"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel", ("Vuna.Compiler.Driver.Cache.shiftTermFuel", "Vuna/Compiler/Driver/Cache.vuna:328"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftAltFuel", ("Vuna.Compiler.Driver.Cache.shiftAltFuel", "Vuna/Compiler/Driver/Cache.vuna:343"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftDef", ("Vuna.Compiler.Driver.Cache.shiftDef", "Vuna/Compiler/Driver/Cache.vuna:346"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftCtor", ("Vuna.Compiler.Driver.Cache.shiftCtor", "Vuna/Compiler/Driver/Cache.vuna:351"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftFieldMeta", ("Vuna.Compiler.Driver.Cache.shiftFieldMeta", "Vuna/Compiler/Driver/Cache.vuna:356"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftData", ("Vuna.Compiler.Driver.Cache.shiftData", "Vuna/Compiler/Driver/Cache.vuna:358"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftClass", ("Vuna.Compiler.Driver.Cache.shiftClass", "Vuna/Compiler/Driver/Cache.vuna:363"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftInst", ("Vuna.Compiler.Driver.Cache.shiftInst", "Vuna/Compiler/Driver/Cache.vuna:368"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftCachedProgram", ("Vuna.Compiler.Driver.Cache.shiftCachedProgram", "Vuna/Compiler/Driver/Cache.vuna:373"));
  ("v_Vuna_dCompiler_dDriver_dCache_dencCachedProgram", ("Vuna.Compiler.Driver.Cache.encCachedProgram", "Vuna/Compiler/Driver/Cache.vuna:389"));
  ("v_Vuna_dCompiler_dDriver_dCache_dencGlobalPair", ("Vuna.Compiler.Driver.Cache.encGlobalPair", "Vuna/Compiler/Driver/Cache.vuna:394"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddecCachedProgramComplete", ("Vuna.Compiler.Driver.Cache.decCachedProgramComplete", "Vuna/Compiler/Driver/Cache.vuna:398"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddecCachedProgram", ("Vuna.Compiler.Driver.Cache.decCachedProgram", "Vuna/Compiler/Driver/Cache.vuna:403"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddecGlobalPair", ("Vuna.Compiler.Driver.Cache.decGlobalPair", "Vuna/Compiler/Driver/Cache.vuna:408"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsiPathOf", ("Vuna.Compiler.Driver.Iface.siPathOf", "Vuna/Compiler/Driver/Iface.vuna:171"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsiHashOf", ("Vuna.Compiler.Driver.Iface.siHashOf", "Vuna/Compiler/Driver/Iface.vuna:174"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf", ("Vuna.Compiler.Driver.Iface.siMtimeOf", "Vuna/Compiler/Driver/Iface.vuna:177"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf", ("Vuna.Compiler.Driver.Iface.siSizeOf", "Vuna/Compiler/Driver/Iface.vuna:180"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiNameOf", ("Vuna.Compiler.Driver.Iface.miNameOf", "Vuna/Compiler/Driver/Iface.vuna:183"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf", ("Vuna.Compiler.Driver.Iface.miPackageOf", "Vuna/Compiler/Driver/Iface.vuna:186"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf", ("Vuna.Compiler.Driver.Iface.miCachedOf", "Vuna/Compiler/Driver/Iface.vuna:189"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf", ("Vuna.Compiler.Driver.Iface.miIfaceHashOf", "Vuna/Compiler/Driver/Iface.vuna:192"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf", ("Vuna.Compiler.Driver.Iface.miDepHashesOf", "Vuna/Compiler/Driver/Iface.vuna:195"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf", ("Vuna.Compiler.Driver.Iface.miSourceOf", "Vuna/Compiler/Driver/Iface.vuna:198"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf", ("Vuna.Compiler.Driver.Iface.miImportsOf", "Vuna/Compiler/Driver/Iface.vuna:201"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf", ("Vuna.Compiler.Driver.Iface.miImplicitImportsOf", "Vuna/Compiler/Driver/Iface.vuna:204"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf", ("Vuna.Compiler.Driver.Iface.miExportsOf", "Vuna/Compiler/Driver/Iface.vuna:207"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf", ("Vuna.Compiler.Driver.Iface.miFixitiesOf", "Vuna/Compiler/Driver/Iface.vuna:210"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf", ("Vuna.Compiler.Driver.Iface.miDeclsOf", "Vuna/Compiler/Driver/Iface.vuna:213"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiRecordsOf", ("Vuna.Compiler.Driver.Iface.miRecordsOf", "Vuna/Compiler/Driver/Iface.vuna:217"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf", ("Vuna.Compiler.Driver.Iface.miPreparedOf", "Vuna/Compiler/Driver/Iface.vuna:220"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpreparedForModule", ("Vuna.Compiler.Driver.Iface.preparedForModule", "Vuna/Compiler/Driver/Iface.vuna:226"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsetPrepared", ("Vuna.Compiler.Driver.Iface.setPrepared", "Vuna/Compiler/Driver/Iface.vuna:239"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceSchema", ("Vuna.Compiler.Driver.Iface.ifaceSchema", "Vuna/Compiler/Driver/Iface.vuna:254"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceHashVersion", ("Vuna.Compiler.Driver.Iface.ifaceHashVersion", "Vuna/Compiler/Driver/Iface.vuna:259"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong", ("Vuna.Compiler.Driver.Iface.hashTextStrong", "Vuna/Compiler/Driver/Iface.vuna:269"));
  ("v_Vuna_dCompiler_dDriver_dIface_dshaText", ("Vuna.Compiler.Driver.Iface.shaText", "Vuna/Compiler/Driver/Iface.vuna:274"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest", ("Vuna.Compiler.Driver.Iface.payloadDigest", "Vuna/Compiler/Driver/Iface.vuna:279"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpartOf", ("Vuna.Compiler.Driver.Iface.partOf", "Vuna/Compiler/Driver/Iface.vuna:283"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddigestParts", ("Vuna.Compiler.Driver.Iface.digestParts", "Vuna/Compiler/Driver/Iface.vuna:287"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddepMissingHash", ("Vuna.Compiler.Driver.Iface.depMissingHash", "Vuna/Compiler/Driver/Iface.vuna:291"));
  ("v_Vuna_dCompiler_dDriver_dIface_dinsertByText", ("Vuna.Compiler.Driver.Iface.insertByText", "Vuna/Compiler/Driver/Iface.vuna:298"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsortTextPairs", ("Vuna.Compiler.Driver.Iface.sortTextPairs", "Vuna/Compiler/Driver/Iface.vuna:304"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsortByText", ("Vuna.Compiler.Driver.Iface.sortByText", "Vuna/Compiler/Driver/Iface.vuna:308"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcanonStateEmpty", ("Vuna.Compiler.Driver.Iface.canonStateEmpty", "Vuna/Compiler/Driver/Iface.vuna:318"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcanonTerm", ("Vuna.Compiler.Driver.Iface.canonTerm", "Vuna/Compiler/Driver/Iface.vuna:321"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcanonArgs", ("Vuna.Compiler.Driver.Iface.canonArgs", "Vuna/Compiler/Driver/Iface.vuna:365"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcanonAlts", ("Vuna.Compiler.Driver.Iface.canonAlts", "Vuna/Compiler/Driver/Iface.vuna:373"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop", ("Vuna.Compiler.Driver.Iface.canonTermTop", "Vuna/Compiler/Driver/Iface.vuna:381"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe", ("Vuna.Compiler.Driver.Iface.canonMaybe", "Vuna/Compiler/Driver/Iface.vuna:384"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddefView", ("Vuna.Compiler.Driver.Iface.defView", "Vuna/Compiler/Driver/Iface.vuna:390"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencDefView", ("Vuna.Compiler.Driver.Iface.encDefView", "Vuna/Compiler/Driver/Iface.vuna:398"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashDefs", ("Vuna.Compiler.Driver.Iface.hashDefs", "Vuna/Compiler/Driver/Iface.vuna:401"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashDatas", ("Vuna.Compiler.Driver.Iface.hashDatas", "Vuna/Compiler/Driver/Iface.vuna:406"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashInsts", ("Vuna.Compiler.Driver.Iface.hashInsts", "Vuna/Compiler/Driver/Iface.vuna:409"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashClasses", ("Vuna.Compiler.Driver.Iface.hashClasses", "Vuna/Compiler/Driver/Iface.vuna:412"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencGlobal", ("Vuna.Compiler.Driver.Iface.encGlobal", "Vuna/Compiler/Driver/Iface.vuna:416"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashGlobals", ("Vuna.Compiler.Driver.Iface.hashGlobals", "Vuna/Compiler/Driver/Iface.vuna:419"));
  ("v_Vuna_dCompiler_dDriver_dIface_dexportKeyOf", ("Vuna.Compiler.Driver.Iface.exportKeyOf", "Vuna/Compiler/Driver/Iface.vuna:423"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashExports", ("Vuna.Compiler.Driver.Iface.hashExports", "Vuna/Compiler/Driver/Iface.vuna:426"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashFixities", ("Vuna.Compiler.Driver.Iface.hashFixities", "Vuna/Compiler/Driver/Iface.vuna:430"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashRecords", ("Vuna.Compiler.Driver.Iface.hashRecords", "Vuna/Compiler/Driver/Iface.vuna:434"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashImports", ("Vuna.Compiler.Driver.Iface.hashImports", "Vuna/Compiler/Driver/Iface.vuna:438"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashDecls", ("Vuna.Compiler.Driver.Iface.hashDecls", "Vuna/Compiler/Driver/Iface.vuna:444"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashOfParts", ("Vuna.Compiler.Driver.Iface.hashOfParts", "Vuna/Compiler/Driver/Iface.vuna:447"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashOfIface", ("Vuna.Compiler.Driver.Iface.hashOfIface", "Vuna/Compiler/Driver/Iface.vuna:452"));
  ("v_Vuna_dCompiler_dDriver_dIface_dtblOwner", ("Vuna.Compiler.Driver.Iface.tblOwner", "Vuna/Compiler/Driver/Iface.vuna:468"));
  ("v_Vuna_dCompiler_dDriver_dIface_dprefixOwner", ("Vuna.Compiler.Driver.Iface.prefixOwner", "Vuna/Compiler/Driver/Iface.vuna:471"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf", ("Vuna.Compiler.Driver.Iface.defOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:477"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf", ("Vuna.Compiler.Driver.Iface.dataOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:482"));
  ("v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs", ("Vuna.Compiler.Driver.Iface.ctorFamilyPairs", "Vuna/Compiler/Driver/Iface.vuna:488"));
  ("v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf", ("Vuna.Compiler.Driver.Iface.ctorOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:493"));
  ("v_Vuna_dCompiler_dDriver_dIface_difacePreludeNames", ("Vuna.Compiler.Driver.Iface.ifacePreludeNames", "Vuna/Compiler/Driver/Iface.vuna:500"));
  ("v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf", ("Vuna.Compiler.Driver.Iface.globalOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:505"));
  ("v_Vuna_dCompiler_dDriver_dIface_downerIndexOf", ("Vuna.Compiler.Driver.Iface.ownerIndexOf", "Vuna/Compiler/Driver/Iface.vuna:513"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner", ("Vuna.Compiler.Driver.Iface.partitionByOwner", "Vuna/Compiler/Driver/Iface.vuna:531"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo", ("Vuna.Compiler.Driver.Iface.partitionByOwnerGo", "Vuna/Compiler/Driver/Iface.vuna:535"));
  ("v_Vuna_dCompiler_dDriver_dIface_dbucketOf", ("Vuna.Compiler.Driver.Iface.bucketOf", "Vuna/Compiler/Driver/Iface.vuna:542"));
  ("v_Vuna_dCompiler_dDriver_dIface_dreverseBuckets", ("Vuna.Compiler.Driver.Iface.reverseBuckets", "Vuna/Compiler/Driver/Iface.vuna:547"));
  ("v_Vuna_dCompiler_dDriver_dIface_dreverseBucket", ("Vuna.Compiler.Driver.Iface.reverseBucket", "Vuna/Compiler/Driver/Iface.vuna:550"));
  ("v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf", ("Vuna.Compiler.Driver.Iface.progPartsOf", "Vuna/Compiler/Driver/Iface.vuna:553"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcpOfModule", ("Vuna.Compiler.Driver.Iface.cpOfModule", "Vuna/Compiler/Driver/Iface.vuna:564"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsourceOf", ("Vuna.Compiler.Driver.Iface.sourceOf", "Vuna/Compiler/Driver/Iface.vuna:577"));
  ("v_Vuna_dCompiler_dDriver_dIface_dimportNameOf", ("Vuna.Compiler.Driver.Iface.importNameOf", "Vuna/Compiler/Driver/Iface.vuna:581"));
  ("v_Vuna_dCompiler_dDriver_dIface_dimportNamesOfModule", ("Vuna.Compiler.Driver.Iface.importNamesOfModule", "Vuna/Compiler/Driver/Iface.vuna:584"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhasMissingDep", ("Vuna.Compiler.Driver.Iface.hasMissingDep", "Vuna/Compiler/Driver/Iface.vuna:589"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashOfImportName", ("Vuna.Compiler.Driver.Iface.hashOfImportName", "Vuna/Compiler/Driver/Iface.vuna:593"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddepHashesOf", ("Vuna.Compiler.Driver.Iface.depHashesOf", "Vuna/Compiler/Driver/Iface.vuna:598"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf", ("Vuna.Compiler.Driver.Iface.cleanIfaceOf", "Vuna/Compiler/Driver/Iface.vuna:601"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase", ("Vuna.Compiler.Driver.Iface.mkIfaceBase", "Vuna/Compiler/Driver/Iface.vuna:610"));
  ("v_Vuna_dCompiler_dDriver_dIface_dfinishIface", ("Vuna.Compiler.Driver.Iface.finishIface", "Vuna/Compiler/Driver/Iface.vuna:624"));
  ("v_Vuna_dCompiler_dDriver_dIface_difacesGo", ("Vuna.Compiler.Driver.Iface.ifacesGo", "Vuna/Compiler/Driver/Iface.vuna:632"));
  ("v_Vuna_dCompiler_dDriver_dIface_downerOfAny", ("Vuna.Compiler.Driver.Iface.ownerOfAny", "Vuna/Compiler/Driver/Iface.vuna:646"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueOf", ("Vuna.Compiler.Driver.Iface.coverageIssueOf", "Vuna/Compiler/Driver/Iface.vuna:653"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo", ("Vuna.Compiler.Driver.Iface.coverageIssueGo", "Vuna/Compiler/Driver/Iface.vuna:663"));
  ("v_Vuna_dCompiler_dDriver_dIface_dartifactNamesOf", ("Vuna.Compiler.Driver.Iface.artifactNamesOf", "Vuna/Compiler/Driver/Iface.vuna:670"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddataNamesOf", ("Vuna.Compiler.Driver.Iface.dataNamesOf", "Vuna/Compiler/Driver/Iface.vuna:676"));
  ("v_Vuna_dCompiler_dDriver_dIface_dctorNamesOf", ("Vuna.Compiler.Driver.Iface.ctorNamesOf", "Vuna/Compiler/Driver/Iface.vuna:679"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceNamesOf", ("Vuna.Compiler.Driver.Iface.ifaceNamesOf", "Vuna/Compiler/Driver/Iface.vuna:682"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceArtifactNames", ("Vuna.Compiler.Driver.Iface.ifaceArtifactNames", "Vuna/Compiler/Driver/Iface.vuna:689"));
  ("v_Vuna_dCompiler_dDriver_dIface_dfirstCoverageIssue", ("Vuna.Compiler.Driver.Iface.firstCoverageIssue", "Vuna/Compiler/Driver/Iface.vuna:692"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcoverageResult", ("Vuna.Compiler.Driver.Iface.coverageResult", "Vuna/Compiler/Driver/Iface.vuna:709"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceOfPackage", ("Vuna.Compiler.Driver.Iface.ifaceOfPackage", "Vuna/Compiler/Driver/Iface.vuna:714"));
  ("v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule", ("Vuna.Compiler.Driver.Iface.findNamedModule", "Vuna/Compiler/Driver/Iface.vuna:735"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsameOwner", ("Vuna.Compiler.Driver.Iface.sameOwner", "Vuna/Compiler/Driver/Iface.vuna:742"));
  ("v_Vuna_dCompiler_dDriver_dIface_downedByModule", ("Vuna.Compiler.Driver.Iface.ownedByModule", "Vuna/Compiler/Driver/Iface.vuna:746"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmoduleCoverageOk", ("Vuna.Compiler.Driver.Iface.moduleCoverageOk", "Vuna/Compiler/Driver/Iface.vuna:749"));
  ("v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent", ("Vuna.Compiler.Driver.Iface.allOwnedPresent", "Vuna/Compiler/Driver/Iface.vuna:755"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceOfModule", ("Vuna.Compiler.Driver.Iface.ifaceOfModule", "Vuna/Compiler/Driver/Iface.vuna:763"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpackageIfaceValid", ("Vuna.Compiler.Driver.Iface.packageIfaceValid", "Vuna/Compiler/Driver/Iface.vuna:787"));
  ("v_Vuna_dCompiler_dDriver_dIface_dallValid", ("Vuna.Compiler.Driver.Iface.allValid", "Vuna/Compiler/Driver/Iface.vuna:791"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf", ("Vuna.Compiler.Driver.Iface.moduleNamesOf", "Vuna/Compiler/Driver/Iface.vuna:795"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmanifestFileName", ("Vuna.Compiler.Driver.Iface.manifestFileName", "Vuna/Compiler/Driver/Iface.vuna:811"));
  ("v_Vuna_dCompiler_dDriver_dIface_drelUnder", ("Vuna.Compiler.Driver.Iface.relUnder", "Vuna/Compiler/Driver/Iface.vuna:817"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceMirrorMode", ("Vuna.Compiler.Driver.Iface.ifaceMirrorMode", "Vuna/Compiler/Driver/Iface.vuna:828"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceHashToken", ("Vuna.Compiler.Driver.Iface.ifaceHashToken", "Vuna/Compiler/Driver/Iface.vuna:834"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceRelPathOf", ("Vuna.Compiler.Driver.Iface.ifaceRelPathOf", "Vuna/Compiler/Driver/Iface.vuna:841"));
  ("v_Vuna_dCompiler_dDriver_dIface_dvalidIfaceRelPath", ("Vuna.Compiler.Driver.Iface.validIfaceRelPath", "Vuna/Compiler/Driver/Iface.vuna:855"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmeNameOfEntry", ("Vuna.Compiler.Driver.Iface.meNameOfEntry", "Vuna/Compiler/Driver/Iface.vuna:893"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmeFileOfEntry", ("Vuna.Compiler.Driver.Iface.meFileOfEntry", "Vuna/Compiler/Driver/Iface.vuna:896"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmeSourceOfEntry", ("Vuna.Compiler.Driver.Iface.meSourceOfEntry", "Vuna/Compiler/Driver/Iface.vuna:899"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmeIfaceHashOfEntry", ("Vuna.Compiler.Driver.Iface.meIfaceHashOfEntry", "Vuna/Compiler/Driver/Iface.vuna:902"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmeDepsOfEntry", ("Vuna.Compiler.Driver.Iface.meDepsOfEntry", "Vuna/Compiler/Driver/Iface.vuna:905"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmeImportsOfEntry", ("Vuna.Compiler.Driver.Iface.meImportsOfEntry", "Vuna/Compiler/Driver/Iface.vuna:908"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmeOriginOfEntry", ("Vuna.Compiler.Driver.Iface.meOriginOfEntry", "Vuna/Compiler/Driver/Iface.vuna:911"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmePayloadDigestOfEntry", ("Vuna.Compiler.Driver.Iface.mePayloadDigestOfEntry", "Vuna/Compiler/Driver/Iface.vuna:914"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpmSchemaOf", ("Vuna.Compiler.Driver.Iface.pmSchemaOf", "Vuna/Compiler/Driver/Iface.vuna:917"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpmCompilerOf", ("Vuna.Compiler.Driver.Iface.pmCompilerOf", "Vuna/Compiler/Driver/Iface.vuna:920"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpmPackageOf", ("Vuna.Compiler.Driver.Iface.pmPackageOf", "Vuna/Compiler/Driver/Iface.vuna:923"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpmEnvOf", ("Vuna.Compiler.Driver.Iface.pmEnvOf", "Vuna/Compiler/Driver/Iface.vuna:926"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpmModulesOf", ("Vuna.Compiler.Driver.Iface.pmModulesOf", "Vuna/Compiler/Driver/Iface.vuna:929"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmanifestPathOf", ("Vuna.Compiler.Driver.Iface.manifestPathOf", "Vuna/Compiler/Driver/Iface.vuna:932"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmodulePathOf", ("Vuna.Compiler.Driver.Iface.modulePathOf", "Vuna/Compiler/Driver/Iface.vuna:935"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceFileTag", ("Vuna.Compiler.Driver.Iface.ifaceFileTag", "Vuna/Compiler/Driver/Iface.vuna:944"));
  ("v_Vuna_dCompiler_dDriver_dIface_dreadManifest", ("Vuna.Compiler.Driver.Iface.readManifest", "Vuna/Compiler/Driver/Iface.vuna:948"));
  ("v_Vuna_dCompiler_dDriver_dIface_dwriteManifest", ("Vuna.Compiler.Driver.Iface.writeManifest", "Vuna/Compiler/Driver/Iface.vuna:969"));
  ("v_Vuna_dCompiler_dDriver_dIface_dentryOfPayload", ("Vuna.Compiler.Driver.Iface.entryOfPayload", "Vuna/Compiler/Driver/Iface.vuna:974"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOfWith", ("Vuna.Compiler.Driver.Iface.manifestEntryOfWith", "Vuna/Compiler/Driver/Iface.vuna:980"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmanifestEntryOf", ("Vuna.Compiler.Driver.Iface.manifestEntryOf", "Vuna/Compiler/Driver/Iface.vuna:983"));
  ("v_Vuna_dCompiler_dDriver_dIface_doldEntryOf", ("Vuna.Compiler.Driver.Iface.oldEntryOf", "Vuna/Compiler/Driver/Iface.vuna:986"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddepListsSame", ("Vuna.Compiler.Driver.Iface.depListsSame", "Vuna/Compiler/Driver/Iface.vuna:990"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddepListIn", ("Vuna.Compiler.Driver.Iface.depListIn", "Vuna/Compiler/Driver/Iface.vuna:993"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmapEff", ("Vuna.Compiler.Driver.Iface.mapEff", "Vuna/Compiler/Driver/Iface.vuna:1000"));
  ("v_Vuna_dCompiler_dDriver_dIface_dwriteModules", ("Vuna.Compiler.Driver.Iface.writeModules", "Vuna/Compiler/Driver/Iface.vuna:1011"));
  ("v_Vuna_dCompiler_dDriver_dIface_dreplaceManifestEntry", ("Vuna.Compiler.Driver.Iface.replaceManifestEntry", "Vuna/Compiler/Driver/Iface.vuna:1043"));
  ("v_Vuna_dCompiler_dDriver_dIface_dentryNameIn", ("Vuna.Compiler.Driver.Iface.entryNameIn", "Vuna/Compiler/Driver/Iface.vuna:1049"));
  ("v_Vuna_dCompiler_dDriver_dIface_dwriteModuleIfaceMerge", ("Vuna.Compiler.Driver.Iface.writeModuleIfaceMerge", "Vuna/Compiler/Driver/Iface.vuna:1053"));
  ("v_Vuna_dCompiler_dDriver_dIface_dwritePackageIface", ("Vuna.Compiler.Driver.Iface.writePackageIface", "Vuna/Compiler/Driver/Iface.vuna:1080"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceFileTokenOk", ("Vuna.Compiler.Driver.Iface.ifaceFileTokenOk", "Vuna/Compiler/Driver/Iface.vuna:1099"));
  ("v_Vuna_dCompiler_dDriver_dIface_dreadModuleFile", ("Vuna.Compiler.Driver.Iface.readModuleFile", "Vuna/Compiler/Driver/Iface.vuna:1105"));
  ("v_Vuna_dCompiler_dDriver_dIface_dreadModuleFileRaw", ("Vuna.Compiler.Driver.Iface.readModuleFileRaw", "Vuna/Compiler/Driver/Iface.vuna:1116"));
  ("v_Vuna_dCompiler_dDriver_dIface_dreadModuleFiles", ("Vuna.Compiler.Driver.Iface.readModuleFiles", "Vuna/Compiler/Driver/Iface.vuna:1137"));
  ("v_Vuna_dCompiler_dDriver_dIface_dreadPackageIface", ("Vuna.Compiler.Driver.Iface.readPackageIface", "Vuna/Compiler/Driver/Iface.vuna:1150"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceCodec", ("Vuna.Compiler.Driver.Iface.ifaceCodec", "Vuna/Compiler/Driver/Iface.vuna:1178"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmanifestCodec", ("Vuna.Compiler.Driver.Iface.manifestCodec", "Vuna/Compiler/Driver/Iface.vuna:1181"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencSourceInfo", ("Vuna.Compiler.Driver.Iface.encSourceInfo", "Vuna/Compiler/Driver/Iface.vuna:1185"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecSourceInfo", ("Vuna.Compiler.Driver.Iface.decSourceInfo", "Vuna/Compiler/Driver/Iface.vuna:1188"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencDepPair", ("Vuna.Compiler.Driver.Iface.encDepPair", "Vuna/Compiler/Driver/Iface.vuna:1193"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecDepPair", ("Vuna.Compiler.Driver.Iface.decDepPair", "Vuna/Compiler/Driver/Iface.vuna:1196"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencModuleIfacePayload", ("Vuna.Compiler.Driver.Iface.encModuleIfacePayload", "Vuna/Compiler/Driver/Iface.vuna:1202"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencModuleIfaceAt", ("Vuna.Compiler.Driver.Iface.encModuleIfaceAt", "Vuna/Compiler/Driver/Iface.vuna:1208"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencModuleIface", ("Vuna.Compiler.Driver.Iface.encModuleIface", "Vuna/Compiler/Driver/Iface.vuna:1211"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfaceAt", ("Vuna.Compiler.Driver.Iface.decModuleIfaceAt", "Vuna/Compiler/Driver/Iface.vuna:1214"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfacePayload", ("Vuna.Compiler.Driver.Iface.decModuleIfacePayload", "Vuna/Compiler/Driver/Iface.vuna:1217"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecManifestEntry", ("Vuna.Compiler.Driver.Iface.decManifestEntry", "Vuna/Compiler/Driver/Iface.vuna:1235"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfaceComplete", ("Vuna.Compiler.Driver.Iface.decModuleIfaceComplete", "Vuna/Compiler/Driver/Iface.vuna:1249"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencManifestEntry", ("Vuna.Compiler.Driver.Iface.encManifestEntry", "Vuna/Compiler/Driver/Iface.vuna:1255"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencManifestPayload", ("Vuna.Compiler.Driver.Iface.encManifestPayload", "Vuna/Compiler/Driver/Iface.vuna:1261"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencManifestAt", ("Vuna.Compiler.Driver.Iface.encManifestAt", "Vuna/Compiler/Driver/Iface.vuna:1266"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencManifest", ("Vuna.Compiler.Driver.Iface.encManifest", "Vuna/Compiler/Driver/Iface.vuna:1269"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecManifestAt", ("Vuna.Compiler.Driver.Iface.decManifestAt", "Vuna/Compiler/Driver/Iface.vuna:1272"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecManifestPayload", ("Vuna.Compiler.Driver.Iface.decManifestPayload", "Vuna/Compiler/Driver/Iface.vuna:1275"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecManifestComplete", ("Vuna.Compiler.Driver.Iface.decManifestComplete", "Vuna/Compiler/Driver/Iface.vuna:1281"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema", ("Vuna.Compiler.Driver.PerfCache.unitCacheSchema", "Vuna/Compiler/Driver/PerfCache.vuna:39"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec", ("Vuna.Compiler.Driver.PerfCache.unitCacheCodec", "Vuna/Compiler/Driver/PerfCache.vuna:43"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag", ("Vuna.Compiler.Driver.PerfCache.unitCacheTag", "Vuna/Compiler/Driver/PerfCache.vuna:46"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dcacheBaseOf", ("Vuna.Compiler.Driver.PerfCache.cacheBaseOf", "Vuna/Compiler/Driver/PerfCache.vuna:51"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheDir", ("Vuna.Compiler.Driver.PerfCache.unitCacheDir", "Vuna/Compiler/Driver/PerfCache.vuna:59"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf", ("Vuna.Compiler.Driver.PerfCache.hashTextOf", "Vuna/Compiler/Driver/PerfCache.vuna:64"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath", ("Vuna.Compiler.Driver.PerfCache.unitCachePath", "Vuna/Compiler/Driver/PerfCache.vuna:67"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName", ("Vuna.Compiler.Driver.PerfCache.unitCacheFileName", "Vuna/Compiler/Driver/PerfCache.vuna:71"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe", ("Vuna.Compiler.Driver.PerfCache.unitNameSafe", "Vuna/Compiler/Driver/PerfCache.vuna:79"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe", ("Vuna.Compiler.Driver.PerfCache.charSafe", "Vuna/Compiler/Driver/PerfCache.vuna:82"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryDir", ("Vuna.Compiler.Driver.PerfCache.unitCacheEntryDir", "Vuna/Compiler/Driver/PerfCache.vuna:88"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryKeyOf", ("Vuna.Compiler.Driver.PerfCache.unitCacheEntryKeyOf", "Vuna/Compiler/Driver/PerfCache.vuna:92"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile", ("Vuna.Compiler.Driver.PerfCache.safeRemoveFile", "Vuna/Compiler/Driver/PerfCache.vuna:104"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheGc", ("Vuna.Compiler.Driver.PerfCache.unitCacheGc", "Vuna/Compiler/Driver/PerfCache.vuna:109"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries", ("Vuna.Compiler.Driver.PerfCache.gcEntries", "Vuna/Compiler/Driver/PerfCache.vuna:115"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles", ("Vuna.Compiler.Driver.PerfCache.dropDirFiles", "Vuna/Compiler/Driver/PerfCache.vuna:130"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles", ("Vuna.Compiler.Driver.PerfCache.dropFiles", "Vuna/Compiler/Driver/PerfCache.vuna:135"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheBucketGc", ("Vuna.Compiler.Driver.PerfCache.unitCacheBucketGc", "Vuna/Compiler/Driver/PerfCache.vuna:146"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo", ("Vuna.Compiler.Driver.PerfCache.bucketGcGo", "Vuna/Compiler/Driver/PerfCache.vuna:152"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheRead", ("Vuna.Compiler.Driver.PerfCache.unitCacheRead", "Vuna/Compiler/Driver/PerfCache.vuna:166"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheWrite", ("Vuna.Compiler.Driver.PerfCache.unitCacheWrite", "Vuna/Compiler/Driver/PerfCache.vuna:175"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls", ("Vuna.Compiler.Driver.Dt.dtProjectDecls", "Vuna/Compiler/Driver/Dt.vuna:93"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoad", ("Vuna.Compiler.Driver.Dt.dtLoad", "Vuna/Compiler/Driver/Dt.vuna:97"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsForCheck", ("Vuna.Compiler.Driver.Dt.dtLoadPartsForCheck", "Vuna/Compiler/Driver/Dt.vuna:117"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesParts", ("Vuna.Compiler.Driver.Dt.dtLoadModulesParts", "Vuna/Compiler/Driver/Dt.vuna:125"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckDecls", ("Vuna.Compiler.Driver.Dt.dtCheckDecls", "Vuna/Compiler/Driver/Dt.vuna:135"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts", ("Vuna.Compiler.Driver.Dt.dtCheckWithProgramParts", "Vuna/Compiler/Driver/Dt.vuna:161"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryWithProgramParts", "Vuna/Compiler/Driver/Dt.vuna:164"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckPartsWithProgram", ("Vuna.Compiler.Driver.Dt.dtCheckPartsWithProgram", "Vuna/Compiler/Driver/Dt.vuna:167"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheck", ("Vuna.Compiler.Driver.Dt.dtCheck", "Vuna/Compiler/Driver/Dt.vuna:192"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtFileHasModuleHeader", ("Vuna.Compiler.Driver.Dt.dtFileHasModuleHeader", "Vuna/Compiler/Driver/Dt.vuna:201"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckModuleFile", ("Vuna.Compiler.Driver.Dt.dtCheckModuleFile", "Vuna/Compiler/Driver/Dt.vuna:211"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalFile", ("Vuna.Compiler.Driver.Dt.dtEvalFile", "Vuna/Compiler/Driver/Dt.vuna:221"));
  ("v_Vuna_dCompiler_dDriver_dDt_dreplProgramFull", ("Vuna.Compiler.Driver.Dt.replProgramFull", "Vuna/Compiler/Driver/Dt.vuna:239"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalExpr", ("Vuna.Compiler.Driver.Dt.dtEvalExpr", "Vuna/Compiler/Driver/Dt.vuna:253"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfo", ("Vuna.Compiler.Driver.Dt.dtEvalExprInfo", "Vuna/Compiler/Driver/Dt.vuna:264"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckSource", ("Vuna.Compiler.Driver.Dt.dtCheckSource", "Vuna/Compiler/Driver/Dt.vuna:274"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules", ("Vuna.Compiler.Driver.Dt.missingDepModules", "Vuna/Compiler/Driver/Dt.vuna:291"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceWithIfaces", ("Vuna.Compiler.Driver.Dt.dtCheckSourceWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:297"));
  ("v_Vuna_dCompiler_dDriver_dDt_dreplCheckParts", ("Vuna.Compiler.Driver.Dt.replCheckParts", "Vuna/Compiler/Driver/Dt.vuna:328"));
  ("v_Vuna_dCompiler_dDriver_dDt_dreplCheckPartsAux", ("Vuna.Compiler.Driver.Dt.replCheckPartsAux", "Vuna/Compiler/Driver/Dt.vuna:334"));
  ("v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfaces", ("Vuna.Compiler.Driver.Dt.replProgramWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:366"));
  ("v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfacesAux", ("Vuna.Compiler.Driver.Dt.replProgramWithIfacesAux", "Vuna/Compiler/Driver/Dt.vuna:375"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfoWithAuxCache", ("Vuna.Compiler.Driver.Dt.dtEvalExprInfoWithAuxCache", "Vuna/Compiler/Driver/Dt.vuna:407"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprWithAuxCache", ("Vuna.Compiler.Driver.Dt.dtEvalExprWithAuxCache", "Vuna/Compiler/Driver/Dt.vuna:417"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfoWithIfaces", ("Vuna.Compiler.Driver.Dt.dtEvalExprInfoWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:427"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprWithIfaces", ("Vuna.Compiler.Driver.Dt.dtEvalExprWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:435"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtInferDefTypes", ("Vuna.Compiler.Driver.Dt.dtInferDefTypes", "Vuna/Compiler/Driver/Dt.vuna:460"));
  ("v_Vuna_dCompiler_dDriver_dDt_daritiesOf", ("Vuna.Compiler.Driver.Dt.aritiesOf", "Vuna/Compiler/Driver/Dt.vuna:486"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfindArity", ("Vuna.Compiler.Driver.Dt.findArity", "Vuna/Compiler/Driver/Dt.vuna:493"));
  ("v_Vuna_dCompiler_dDriver_dDt_dallocTelescopes", ("Vuna.Compiler.Driver.Dt.allocTelescopes", "Vuna/Compiler/Driver/Dt.vuna:500"));
  ("v_Vuna_dCompiler_dDriver_dDt_dallocMetas", ("Vuna.Compiler.Driver.Dt.allocMetas", "Vuna/Compiler/Driver/Dt.vuna:513"));
  ("v_Vuna_dCompiler_dDriver_dDt_dbuildPi", ("Vuna.Compiler.Driver.Dt.buildPi", "Vuna/Compiler/Driver/Dt.vuna:521"));
  ("v_Vuna_dCompiler_dDriver_dDt_dinferEachType", ("Vuna.Compiler.Driver.Dt.inferEachType", "Vuna/Compiler/Driver/Dt.vuna:525"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfindDtDef", ("Vuna.Compiler.Driver.Dt.findDtDef", "Vuna/Compiler/Driver/Dt.vuna:533"));
  ("v_Vuna_dCompiler_dDriver_dDt_dloadReplDecls", ("Vuna.Compiler.Driver.Dt.loadReplDecls", "Vuna/Compiler/Driver/Dt.vuna:538"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtBindingTypes", ("Vuna.Compiler.Driver.Dt.dtBindingTypes", "Vuna/Compiler/Driver/Dt.vuna:549"));
  ("v_Vuna_dCompiler_dDriver_dDt_dgeneralizeSignature", ("Vuna.Compiler.Driver.Dt.generalizeSignature", "Vuna/Compiler/Driver/Dt.vuna:564"));
  ("v_Vuna_dCompiler_dDriver_dDt_dbuildGenMetas", ("Vuna.Compiler.Driver.Dt.buildGenMetas", "Vuna/Compiler/Driver/Dt.vuna:579"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfreshMetaName", ("Vuna.Compiler.Driver.Dt.freshMetaName", "Vuna/Compiler/Driver/Dt.vuna:587"));
  ("v_Vuna_dCompiler_dDriver_dDt_dpickFreshName", ("Vuna.Compiler.Driver.Dt.pickFreshName", "Vuna/Compiler/Driver/Dt.vuna:590"));
  ("v_Vuna_dCompiler_dDriver_dDt_dsubstGenMetas", ("Vuna.Compiler.Driver.Dt.substGenMetas", "Vuna/Compiler/Driver/Dt.vuna:599"));
  ("v_Vuna_dCompiler_dDriver_dDt_dwrapGenMetas", ("Vuna.Compiler.Driver.Dt.wrapGenMetas", "Vuna/Compiler/Driver/Dt.vuna:604"));
  ("v_Vuna_dCompiler_dDriver_dDt_dkindOfArity", ("Vuna.Compiler.Driver.Dt.kindOfArity", "Vuna/Compiler/Driver/Dt.vuna:608"));
  ("v_Vuna_dCompiler_dDriver_dDt_dkindArrows", ("Vuna.Compiler.Driver.Dt.kindArrows", "Vuna/Compiler/Driver/Dt.vuna:611"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf", ("Vuna.Compiler.Driver.Dt.metaIdsOf", "Vuna/Compiler/Driver/Dt.vuna:616"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfArgs", ("Vuna.Compiler.Driver.Dt.metaIdsOfArgs", "Vuna/Compiler/Driver/Dt.vuna:626"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfAlt", ("Vuna.Compiler.Driver.Dt.metaIdsOfAlt", "Vuna/Compiler/Driver/Dt.vuna:630"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupInts", ("Vuna.Compiler.Driver.Dt.dedupInts", "Vuna/Compiler/Driver/Dt.vuna:633"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity", ("Vuna.Compiler.Driver.Dt.maxMetaArity", "Vuna/Compiler/Driver/Dt.vuna:639"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityArgs", ("Vuna.Compiler.Driver.Dt.maxMetaArityArgs", "Vuna/Compiler/Driver/Dt.vuna:650"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityAlts", ("Vuna.Compiler.Driver.Dt.maxMetaArityAlts", "Vuna/Compiler/Driver/Dt.vuna:654"));
  ("v_Vuna_dCompiler_dDriver_dDt_dapplyArity", ("Vuna.Compiler.Driver.Dt.applyArity", "Vuna/Compiler/Driver/Dt.vuna:658"));
  ("v_Vuna_dCompiler_dDriver_dDt_dheadIsMeta", ("Vuna.Compiler.Driver.Dt.headIsMeta", "Vuna/Compiler/Driver/Dt.vuna:661"));
  ("v_Vuna_dCompiler_dDriver_dDt_dspineLen", ("Vuna.Compiler.Driver.Dt.spineLen", "Vuna/Compiler/Driver/Dt.vuna:666"));
  ("v_Vuna_dCompiler_dDriver_dDt_dimax", ("Vuna.Compiler.Driver.Dt.imax", "Vuna/Compiler/Driver/Dt.vuna:670"));
  ("v_Vuna_dCompiler_dDriver_dDt_dlistLen", ("Vuna.Compiler.Driver.Dt.listLen", "Vuna/Compiler/Driver/Dt.vuna:673"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtGoalsSource", ("Vuna.Compiler.Driver.Dt.dtGoalsSource", "Vuna/Compiler/Driver/Dt.vuna:678"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtGoalsSourceTolerant", ("Vuna.Compiler.Driver.Dt.dtGoalsSourceTolerant", "Vuna/Compiler/Driver/Dt.vuna:689"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtMainKind", ("Vuna.Compiler.Driver.Dt.dtMainKind", "Vuna/Compiler/Driver/Dt.vuna:705"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmainKindForName", ("Vuna.Compiler.Driver.Dt.mainKindForName", "Vuna/Compiler/Driver/Dt.vuna:724"));
  ("v_Vuna_dCompiler_dDriver_dDt_dreplExprName", ("Vuna.Compiler.Driver.Dt.replExprName", "Vuna/Compiler/Driver/Dt.vuna:731"));
  ("v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr", ("Vuna.Compiler.Driver.Dt.splitReplExpr", "Vuna/Compiler/Driver/Dt.vuna:735"));
  ("v_Vuna_dCompiler_dDriver_dDt_devalDtMain", ("Vuna.Compiler.Driver.Dt.evalDtMain", "Vuna/Compiler/Driver/Dt.vuna:744"));
  ("v_Vuna_dCompiler_dDriver_dDt_devalDtMainCore", ("Vuna.Compiler.Driver.Dt.evalDtMainCore", "Vuna/Compiler/Driver/Dt.vuna:755"));
  ("v_Vuna_dCompiler_dDriver_dDt_dinterpMainShow", ("Vuna.Compiler.Driver.Dt.interpMainShow", "Vuna/Compiler/Driver/Dt.vuna:778"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmainActionKind", ("Vuna.Compiler.Driver.Dt.mainActionKind", "Vuna/Compiler/Driver/Dt.vuna:786"));
  ("v_Vuna_dCompiler_dDriver_dDt_disNilRowTermDt", ("Vuna.Compiler.Driver.Dt.isNilRowTermDt", "Vuna/Compiler/Driver/Dt.vuna:793"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfindMainDef", ("Vuna.Compiler.Driver.Dt.findMainDef", "Vuna/Compiler/Driver/Dt.vuna:798"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddefTableOf", ("Vuna.Compiler.Driver.Dt.defTableOf", "Vuna/Compiler/Driver/Dt.vuna:803"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadParts", ("Vuna.Compiler.Driver.Dt.dtLoadParts", "Vuna/Compiler/Driver/Dt.vuna:813"));
  ("v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOf", ("Vuna.Compiler.Driver.Dt.cachedNamesOf", "Vuna/Compiler/Driver/Dt.vuna:819"));
  ("v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOne", ("Vuna.Compiler.Driver.Dt.cachedNamesOne", "Vuna/Compiler/Driver/Dt.vuna:822"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckOursParts", ("Vuna.Compiler.Driver.Dt.dtCheckOursParts", "Vuna/Compiler/Driver/Dt.vuna:827"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddepStartOfAt", ("Vuna.Compiler.Driver.Dt.depStartOfAt", "Vuna/Compiler/Driver/Dt.vuna:855"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddepStartOf", ("Vuna.Compiler.Driver.Dt.depStartOf", "Vuna/Compiler/Driver/Dt.vuna:875"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaList", ("Vuna.Compiler.Driver.Dt.maxMetaList", "Vuna/Compiler/Driver/Dt.vuna:879"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaDef", ("Vuna.Compiler.Driver.Dt.maxMetaDef", "Vuna/Compiler/Driver/Dt.vuna:883"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaCached", ("Vuna.Compiler.Driver.Dt.maxMetaCached", "Vuna/Compiler/Driver/Dt.vuna:888"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaCps", ("Vuna.Compiler.Driver.Dt.maxMetaCps", "Vuna/Compiler/Driver/Dt.vuna:891"));
  ("v_Vuna_dCompiler_dDriver_dDt_dcleanStartNext", ("Vuna.Compiler.Driver.Dt.cleanStartNext", "Vuna/Compiler/Driver/Dt.vuna:894"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast", ("Vuna.Compiler.Driver.Dt.dedupKeepLast", "Vuna/Compiler/Driver/Dt.vuna:904"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLastGo", ("Vuna.Compiler.Driver.Dt.dedupKeepLastGo", "Vuna/Compiler/Driver/Dt.vuna:907"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupDefBodies", ("Vuna.Compiler.Driver.Dt.dedupDefBodies", "Vuna/Compiler/Driver/Dt.vuna:917"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupDefs", ("Vuna.Compiler.Driver.Dt.dedupDefs", "Vuna/Compiler/Driver/Dt.vuna:920"));
  ("v_Vuna_dCompiler_dDriver_dDt_dbodyPairs", ("Vuna.Compiler.Driver.Dt.bodyPairs", "Vuna/Compiler/Driver/Dt.vuna:923"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupDatas", ("Vuna.Compiler.Driver.Dt.dedupDatas", "Vuna/Compiler/Driver/Dt.vuna:929"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupInsts", ("Vuna.Compiler.Driver.Dt.dedupInsts", "Vuna/Compiler/Driver/Dt.vuna:932"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupClasses", ("Vuna.Compiler.Driver.Dt.dedupClasses", "Vuna/Compiler/Driver/Dt.vuna:935"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals", ("Vuna.Compiler.Driver.Dt.dedupGlobals", "Vuna/Compiler/Driver/Dt.vuna:938"));
  ("v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms", ("Vuna.Compiler.Driver.Dt.shiftedDepPrograms", "Vuna/Compiler/Driver/Dt.vuna:950"));
  ("v_Vuna_dCompiler_dDriver_dDt_dshiftedDepProgramsGo", ("Vuna.Compiler.Driver.Dt.shiftedDepProgramsGo", "Vuna/Compiler/Driver/Dt.vuna:953"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces", ("Vuna.Compiler.Driver.Dt.modulesOfIfaces", "Vuna/Compiler/Driver/Dt.vuna:959"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsIncremental", ("Vuna.Compiler.Driver.Dt.dtLoadPartsIncremental", "Vuna/Compiler/Driver/Dt.vuna:969"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtPrepareTermAux", ("Vuna.Compiler.Driver.Dt.dtPrepareTermAux", "Vuna/Compiler/Driver/Dt.vuna:991"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtAuxForTermination", ("Vuna.Compiler.Driver.Dt.dtAuxForTermination", "Vuna/Compiler/Driver/Dt.vuna:1000"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtElabFullWithPrepared", ("Vuna.Compiler.Driver.Dt.dtElabFullWithPrepared", "Vuna/Compiler/Driver/Dt.vuna:1011"));
  ("v_Vuna_dCompiler_dDriver_dDt_dauxKeyOne", ("Vuna.Compiler.Driver.Dt.auxKeyOne", "Vuna/Compiler/Driver/Dt.vuna:1030"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtAuxKey", ("Vuna.Compiler.Driver.Dt.dtAuxKey", "Vuna/Compiler/Driver/Dt.vuna:1033"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtAuxOfCache", ("Vuna.Compiler.Driver.Dt.dtAuxOfCache", "Vuna/Compiler/Driver/Dt.vuna:1038"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalChecked", ("Vuna.Compiler.Driver.Dt.dtIncrementalChecked", "Vuna/Compiler/Driver/Dt.vuna:1042"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalCheckedCore", ("Vuna.Compiler.Driver.Dt.dtIncrementalCheckedCore", "Vuna/Compiler/Driver/Dt.vuna:1052"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtFinishPackage", ("Vuna.Compiler.Driver.Dt.dtFinishPackage", "Vuna/Compiler/Driver/Dt.vuna:1101"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtFinishPackageScoped", ("Vuna.Compiler.Driver.Dt.dtFinishPackageScoped", "Vuna/Compiler/Driver/Dt.vuna:1121"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtFinishScoped", ("Vuna.Compiler.Driver.Dt.dtFinishScoped", "Vuna/Compiler/Driver/Dt.vuna:1141"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckScoped", ("Vuna.Compiler.Driver.Dt.dtCheckScoped", "Vuna/Compiler/Driver/Dt.vuna:1155"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceIncremental", ("Vuna.Compiler.Driver.Dt.dtCheckSourceIncremental", "Vuna/Compiler/Driver/Dt.vuna:1173"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalSourceIncremental", ("Vuna.Compiler.Driver.Dt.dtEvalSourceIncremental", "Vuna/Compiler/Driver/Dt.vuna:1202"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceChecked", ("Vuna.Compiler.Driver.Dt.dtCheckSourceChecked", "Vuna/Compiler/Driver/Dt.vuna:1217"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageIncrementalParts", ("Vuna.Compiler.Driver.Dt.dtCheckPackageIncrementalParts", "Vuna/Compiler/Driver/Dt.vuna:1224"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfindModuleNameField", ("Vuna.Compiler.Driver.Dt.findModuleNameField", "Vuna/Compiler/Driver/Dt.vuna:1237"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfindModuleNamed", ("Vuna.Compiler.Driver.Dt.findModuleNamed", "Vuna/Compiler/Driver/Dt.vuna:1240"));
  ("v_Vuna_dCompiler_dDriver_dDt_dtopoDepsOf", ("Vuna.Compiler.Driver.Dt.topoDepsOf", "Vuna/Compiler/Driver/Dt.vuna:1245"));
  ("v_Vuna_dCompiler_dDriver_dDt_dtopoVisit", ("Vuna.Compiler.Driver.Dt.topoVisit", "Vuna/Compiler/Driver/Dt.vuna:1252"));
  ("v_Vuna_dCompiler_dDriver_dDt_dtopoVisitAll", ("Vuna.Compiler.Driver.Dt.topoVisitAll", "Vuna/Compiler/Driver/Dt.vuna:1262"));
  ("v_Vuna_dCompiler_dDriver_dDt_dtopoModules", ("Vuna.Compiler.Driver.Dt.topoModules", "Vuna/Compiler/Driver/Dt.vuna:1269"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitDeclsHash", ("Vuna.Compiler.Driver.Dt.unitDeclsHash", "Vuna/Compiler/Driver/Dt.vuna:1278"));
  ("v_Vuna_dCompiler_dDriver_dDt_dpairKeyValue", ("Vuna.Compiler.Driver.Dt.pairKeyValue", "Vuna/Compiler/Driver/Dt.vuna:1281"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitImportsOf", ("Vuna.Compiler.Driver.Dt.unitImportsOf", "Vuna/Compiler/Driver/Dt.vuna:1284"));
  ("v_Vuna_dCompiler_dDriver_dDt_dconcatKeys", ("Vuna.Compiler.Driver.Dt.concatKeys", "Vuna/Compiler/Driver/Dt.vuna:1287"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitImportKey", ("Vuna.Compiler.Driver.Dt.unitImportKey", "Vuna/Compiler/Driver/Dt.vuna:1291"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitKeyOne", ("Vuna.Compiler.Driver.Dt.unitKeyOne", "Vuna/Compiler/Driver/Dt.vuna:1296"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitKeysGo", ("Vuna.Compiler.Driver.Dt.unitKeysGo", "Vuna/Compiler/Driver/Dt.vuna:1302"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitKeysOf", ("Vuna.Compiler.Driver.Dt.unitKeysOf", "Vuna/Compiler/Driver/Dt.vuna:1306"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitCacheLookup", ("Vuna.Compiler.Driver.Dt.unitCacheLookup", "Vuna/Compiler/Driver/Dt.vuna:1318"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitCacheStore", ("Vuna.Compiler.Driver.Dt.unitCacheStore", "Vuna/Compiler/Driver/Dt.vuna:1331"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitCacheEnabled", ("Vuna.Compiler.Driver.Dt.unitCacheEnabled", "Vuna/Compiler/Driver/Dt.vuna:1341"));
  ("v_Vuna_dCompiler_dDriver_dDt_dsplitGenerateCached", ("Vuna.Compiler.Driver.Dt.splitGenerateCached", "Vuna/Compiler/Driver/Dt.vuna:1346"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtGenerateIncremental", ("Vuna.Compiler.Driver.Dt.dtGenerateIncremental", "Vuna/Compiler/Driver/Dt.vuna:1369"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectIncremental", ("Vuna.Compiler.Driver.Dt.dtSplitProjectIncremental", "Vuna/Compiler/Driver/Dt.vuna:1383"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmoduleOfIface", ("Vuna.Compiler.Driver.Dt.moduleOfIface", "Vuna/Compiler/Driver/Dt.vuna:1392"));
  ("v_Vuna_dCompiler_dDriver_dDt_dimportsOfModuleNames", ("Vuna.Compiler.Driver.Dt.importsOfModuleNames", "Vuna/Compiler/Driver/Dt.vuna:1402"));
  ("v_Vuna_dCompiler_dDriver_dDt_dclosureGo", ("Vuna.Compiler.Driver.Dt.closureGo", "Vuna/Compiler/Driver/Dt.vuna:1406"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports", ("Vuna.Compiler.Driver.Dt.filterProjectToImports", "Vuna/Compiler/Driver/Dt.vuna:1414"));
  ("v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf", ("Vuna.Compiler.Driver.Dt.preloadKeepOf", "Vuna/Compiler/Driver/Dt.vuna:1424"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps", ("Vuna.Compiler.Driver.Dt.materializedDeps", "Vuna/Compiler/Driver/Dt.vuna:1428"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaterializedOwn", ("Vuna.Compiler.Driver.Dt.materializedOwn", "Vuna/Compiler/Driver/Dt.vuna:1434"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsWithIfaces", ("Vuna.Compiler.Driver.Dt.dtLoadPartsWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:1440"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesPartsWithIfaces", ("Vuna.Compiler.Driver.Dt.dtLoadModulesPartsWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:1450"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageWithIfacesParts", ("Vuna.Compiler.Driver.Dt.dtCheckPackageWithIfacesParts", "Vuna/Compiler/Driver/Dt.vuna:1460"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesPartsIncremental", ("Vuna.Compiler.Driver.Dt.dtLoadModulesPartsIncremental", "Vuna/Compiler/Driver/Dt.vuna:1470"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageIncrementalParts", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryPackageIncrementalParts", "Vuna/Compiler/Driver/Dt.vuna:1484"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageWithIfacesParts", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryPackageWithIfacesParts", "Vuna/Compiler/Driver/Dt.vuna:1494"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectWithIfaces", ("Vuna.Compiler.Driver.Dt.dtSplitProjectWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:1506"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtSplitPartsOurs", ("Vuna.Compiler.Driver.Dt.dtSplitPartsOurs", "Vuna/Compiler/Driver/Dt.vuna:1516"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectParts", ("Vuna.Compiler.Driver.Dt.dtSplitProjectParts", "Vuna/Compiler/Driver/Dt.vuna:1549"));
  ("v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsIn", ("Vuna.Compiler.Driver.Dt.warnUnusedDefsIn", "Vuna/Compiler/Driver/Dt.vuna:1580"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtDefGlobalNames", ("Vuna.Compiler.Driver.Dt.dtDefGlobalNames", "Vuna/Compiler/Driver/Dt.vuna:1588"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaybeTermGlobals", ("Vuna.Compiler.Driver.Dt.maybeTermGlobals", "Vuna/Compiler/Driver/Dt.vuna:1592"));
  ("v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsGo", ("Vuna.Compiler.Driver.Dt.warnUnusedDefsGo", "Vuna/Compiler/Driver/Dt.vuna:1597"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckRecovering", ("Vuna.Compiler.Driver.Dt.dtCheckRecovering", "Vuna/Compiler/Driver/Dt.vuna:1616"));
  ("v_Vuna_dCompiler_dDriver_dDt_drecoverElab", ("Vuna.Compiler.Driver.Dt.recoverElab", "Vuna/Compiler/Driver/Dt.vuna:1625"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddiagPrimaryLine", ("Vuna.Compiler.Driver.Dt.diagPrimaryLine", "Vuna/Compiler/Driver/Dt.vuna:1640"));
  ("v_Vuna_dCompiler_dDriver_dDt_dprimarySpanOf", ("Vuna.Compiler.Driver.Dt.primarySpanOf", "Vuna/Compiler/Driver/Dt.vuna:1644"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddeclMatchesDiag", ("Vuna.Compiler.Driver.Dt.declMatchesDiag", "Vuna/Compiler/Driver/Dt.vuna:1650"));
  ("v_Vuna_dCompiler_dDriver_dDt_dprimaryLineOf", ("Vuna.Compiler.Driver.Dt.primaryLineOf", "Vuna/Compiler/Driver/Dt.vuna:1661"));
  ("v_Vuna_dCompiler_dDriver_dDt_dspanContainsLine", ("Vuna.Compiler.Driver.Dt.spanContainsLine", "Vuna/Compiler/Driver/Dt.vuna:1667"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddeclDropped", ("Vuna.Compiler.Driver.Dt.declDropped", "Vuna/Compiler/Driver/Dt.vuna:1671"));
  ("v_Vuna_dCompiler_dDriver_dDt_danyNameIn", ("Vuna.Compiler.Driver.Dt.anyNameIn", "Vuna/Compiler/Driver/Dt.vuna:1675"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmarkCascade", ("Vuna.Compiler.Driver.Dt.markCascade", "Vuna/Compiler/Driver/Dt.vuna:1681"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmentionedAny", ("Vuna.Compiler.Driver.Dt.mentionedAny", "Vuna/Compiler/Driver/Dt.vuna:1689"));
  ("v_Vuna_dCompiler_dDriver_dDt_danyWordIn", ("Vuna.Compiler.Driver.Dt.anyWordIn", "Vuna/Compiler/Driver/Dt.vuna:1693"));
  ("v_Vuna_dCompiler_dDriver_dDt_dwordsOf", ("Vuna.Compiler.Driver.Dt.wordsOf", "Vuna/Compiler/Driver/Dt.vuna:1698"));
  ("v_Vuna_dCompiler_dDriver_dDt_dwordsGo", ("Vuna.Compiler.Driver.Dt.wordsGo", "Vuna/Compiler/Driver/Dt.vuna:1702"));
  ("v_Vuna_dCompiler_dDriver_dDt_dflushWord", ("Vuna.Compiler.Driver.Dt.flushWord", "Vuna/Compiler/Driver/Dt.vuna:1709"));
  ("v_Vuna_dCompiler_dDriver_dDt_disIdentChar", ("Vuna.Compiler.Driver.Dt.isIdentChar", "Vuna/Compiler/Driver/Dt.vuna:1714"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryRecovering", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryRecovering", "Vuna/Compiler/Driver/Dt.vuna:1718"));
  ("v_Vuna_dCompiler_dDriver_dDt_dnormalizeDiagFile", ("Vuna.Compiler.Driver.Dt.normalizeDiagFile", "Vuna/Compiler/Driver/Dt.vuna:1727"));
  ("v_Base_dSort_dinsertBy", ("Base.Sort.insertBy", "Base/Sort.vuna:17"));
  ("v_Base_dSort_dsortBy", ("Base.Sort.sortBy", "Base/Sort.vuna:22"));
  ("v_Base_dSort_dmergeSort", ("Base.Sort.mergeSort", "Base/Sort.vuna:27"));
  ("v_Vuna_dCompiler_dQuery_ddbEmpty", ("Vuna.Compiler.Query.dbEmpty", "Vuna/Compiler/Query.vuna:96"));
  ("v_Vuna_dCompiler_dQuery_ddbWithOrigin", ("Vuna.Compiler.Query.dbWithOrigin", "Vuna/Compiler/Query.vuna:100"));
  ("v_Vuna_dCompiler_dQuery_ddbOriginOf", ("Vuna.Compiler.Query.dbOriginOf", "Vuna/Compiler/Query.vuna:103"));
  ("v_Vuna_dCompiler_dQuery_ddbTrace", ("Vuna.Compiler.Query.dbTrace", "Vuna/Compiler/Query.vuna:107"));
  ("v_Vuna_dCompiler_dQuery_ddbTraceText", ("Vuna.Compiler.Query.dbTraceText", "Vuna/Compiler/Query.vuna:111"));
  ("v_Vuna_dCompiler_dQuery_djoinComma", ("Vuna.Compiler.Query.joinComma", "Vuna/Compiler/Query.vuna:114"));
  ("v_Vuna_dCompiler_dQuery_ddbEntryCount", ("Vuna.Compiler.Query.dbEntryCount", "Vuna/Compiler/Query.vuna:120"));
  ("v_Vuna_dCompiler_dQuery_ddbLookup", ("Vuna.Compiler.Query.dbLookup", "Vuna/Compiler/Query.vuna:124"));
  ("v_Vuna_dCompiler_dQuery_ddbNote", ("Vuna.Compiler.Query.dbNote", "Vuna/Compiler/Query.vuna:130"));
  ("v_Vuna_dCompiler_dQuery_ddigestOfPayload", ("Vuna.Compiler.Query.digestOfPayload", "Vuna/Compiler/Query.vuna:134"));
  ("v_Vuna_dCompiler_dQuery_dshowQVal", ("Vuna.Compiler.Query.showQVal", "Vuna/Compiler/Query.vuna:142"));
  ("v_Vuna_dCompiler_dQuery_dlenPrefixed", ("Vuna.Compiler.Query.lenPrefixed", "Vuna/Compiler/Query.vuna:148"));
  ("v_Vuna_dCompiler_dQuery_ddigestOfVal", ("Vuna.Compiler.Query.digestOfVal", "Vuna/Compiler/Query.vuna:152"));
  ("v_Vuna_dCompiler_dQuery_ddsKeyOf", ("Vuna.Compiler.Query.dsKeyOf", "Vuna/Compiler/Query.vuna:165"));
  ("v_Vuna_dCompiler_dQuery_ddsDigestOf", ("Vuna.Compiler.Query.dsDigestOf", "Vuna/Compiler/Query.vuna:168"));
  ("v_Vuna_dCompiler_dQuery_ddsValueOf", ("Vuna.Compiler.Query.dsValueOf", "Vuna/Compiler/Query.vuna:171"));
  ("v_Vuna_dCompiler_dQuery_dsnapDep", ("Vuna.Compiler.Query.snapDep", "Vuna/Compiler/Query.vuna:175"));
  ("v_Vuna_dCompiler_dQuery_dsnapDeps", ("Vuna.Compiler.Query.snapDeps", "Vuna/Compiler/Query.vuna:180"));
  ("v_Vuna_dCompiler_dQuery_ddepPairsSorted", ("Vuna.Compiler.Query.depPairsSorted", "Vuna/Compiler/Query.vuna:185"));
  ("v_Vuna_dCompiler_dQuery_dsortByDepKey", ("Vuna.Compiler.Query.sortByDepKey", "Vuna/Compiler/Query.vuna:189"));
  ("v_Vuna_dCompiler_dQuery_dsameDeps", ("Vuna.Compiler.Query.sameDeps", "Vuna/Compiler/Query.vuna:193"));
  ("v_Vuna_dCompiler_dQuery_dquery", ("Vuna.Compiler.Query.query", "Vuna/Compiler/Query.vuna:207"));
  ("v_Vuna_dCompiler_dQuery_dqueryWith", ("Vuna.Compiler.Query.queryWith", "Vuna/Compiler/Query.vuna:214"));
  ("v_Vuna_dCompiler_dQuery_dqueryHit", ("Vuna.Compiler.Query.queryHit", "Vuna/Compiler/Query.vuna:228"));
  ("v_Vuna_dCompiler_dQuery_dsortKeys", ("Vuna.Compiler.Query.sortKeys", "Vuna/Compiler/Query.vuna:236"));
  ("v_Vuna_dCompiler_dQuery_drecordedKeys", ("Vuna.Compiler.Query.recordedKeys", "Vuna/Compiler/Query.vuna:239"));
  ("v_Vuna_dCompiler_dQuery_dqueryDepValues", ("Vuna.Compiler.Query.queryDepValues", "Vuna/Compiler/Query.vuna:244"));
  ("v_Vuna_dCompiler_dQuery_dmarkHit", ("Vuna.Compiler.Query.markHit", "Vuna/Compiler/Query.vuna:248"));
  ("v_Vuna_dCompiler_dQuery_dqueryResolve", ("Vuna.Compiler.Query.queryResolve", "Vuna/Compiler/Query.vuna:260"));
  ("v_Vuna_dCompiler_dQuery_dcommitMiss", ("Vuna.Compiler.Query.commitMiss", "Vuna/Compiler/Query.vuna:276"));
  ("v_Vuna_dCompiler_dQuery_ddepPairsFromKeys", ("Vuna.Compiler.Query.depPairsFromKeys", "Vuna/Compiler/Query.vuna:282"));
  ("v_Vuna_dCompiler_dQuery_dsnapDepWith", ("Vuna.Compiler.Query.snapDepWith", "Vuna/Compiler/Query.vuna:286"));
  ("v_Vuna_dCompiler_dQuery_dfindSnap", ("Vuna.Compiler.Query.findSnap", "Vuna/Compiler/Query.vuna:291"));
  ("v_Vuna_dCompiler_dQuery_dRun_drunEmpty", ("Vuna.Compiler.Query.Run.runEmpty", "Vuna/Compiler/Query/Run.vuna:82"));
  ("v_Vuna_dCompiler_dQuery_dRun_drunWithBudget", ("Vuna.Compiler.Query.Run.runWithBudget", "Vuna/Compiler/Query/Run.vuna:86"));
  ("v_Vuna_dCompiler_dQuery_dRun_drunStepCount", ("Vuna.Compiler.Query.Run.runStepCount", "Vuna/Compiler/Query/Run.vuna:90"));
  ("v_Vuna_dCompiler_dQuery_dRun_drunNote", ("Vuna.Compiler.Query.Run.runNote", "Vuna/Compiler/Query/Run.vuna:94"));
  ("v_Vuna_dCompiler_dQuery_dRun_dspendBudget", ("Vuna.Compiler.Query.Run.spendBudget", "Vuna/Compiler/Query/Run.vuna:98"));
  ("v_Vuna_dCompiler_dQuery_dRun_dinStack", ("Vuna.Compiler.Query.Run.inStack", "Vuna/Compiler/Query/Run.vuna:104"));
  ("v_Vuna_dCompiler_dQuery_dRun_drunNode", ("Vuna.Compiler.Query.Run.runNode", "Vuna/Compiler/Query/Run.vuna:118"));
  ("v_Vuna_dCompiler_dQuery_dRun_dqueryIndexCodec", ("Vuna.Compiler.Query.Run.queryIndexCodec", "Vuna/Compiler/Query/Run.vuna:146"));
  ("v_Vuna_dCompiler_dQuery_dRun_dqueryIndexSchema", ("Vuna.Compiler.Query.Run.queryIndexSchema", "Vuna/Compiler/Query/Run.vuna:149"));
  ("v_Vuna_dCompiler_dQuery_dRun_dqueryIndexTag", ("Vuna.Compiler.Query.Run.queryIndexTag", "Vuna/Compiler/Query/Run.vuna:152"));
  ("v_Vuna_dCompiler_dQuery_dRun_dsessionPath", ("Vuna.Compiler.Query.Run.sessionPath", "Vuna/Compiler/Query/Run.vuna:158"));
  ("v_Vuna_dCompiler_dQuery_dRun_dencVal", ("Vuna.Compiler.Query.Run.encVal", "Vuna/Compiler/Query/Run.vuna:163"));
  ("v_Vuna_dCompiler_dQuery_dRun_ddecVal", ("Vuna.Compiler.Query.Run.decVal", "Vuna/Compiler/Query/Run.vuna:168"));
  ("v_Vuna_dCompiler_dQuery_dRun_dencDep", ("Vuna.Compiler.Query.Run.encDep", "Vuna/Compiler/Query/Run.vuna:182"));
  ("v_Vuna_dCompiler_dQuery_dRun_ddecDep", ("Vuna.Compiler.Query.Run.decDep", "Vuna/Compiler/Query/Run.vuna:185"));
  ("v_Vuna_dCompiler_dQuery_dRun_dencIndexEntry", ("Vuna.Compiler.Query.Run.encIndexEntry", "Vuna/Compiler/Query/Run.vuna:193"));
  ("v_Vuna_dCompiler_dQuery_dRun_ddecIndexEntry", ("Vuna.Compiler.Query.Run.decIndexEntry", "Vuna/Compiler/Query/Run.vuna:198"));
  ("v_Vuna_dCompiler_dQuery_dRun_dencQueryIndex", ("Vuna.Compiler.Query.Run.encQueryIndex", "Vuna/Compiler/Query/Run.vuna:218"));
  ("v_Vuna_dCompiler_dQuery_dRun_ddecQueryIndexComplete", ("Vuna.Compiler.Query.Run.decQueryIndexComplete", "Vuna/Compiler/Query/Run.vuna:222"));
  ("v_Vuna_dCompiler_dQuery_dRun_dsessionLoad", ("Vuna.Compiler.Query.Run.sessionLoad", "Vuna/Compiler/Query/Run.vuna:230"));
  ("v_Vuna_dCompiler_dQuery_dRun_dsessionSave", ("Vuna.Compiler.Query.Run.sessionSave", "Vuna/Compiler/Query/Run.vuna:246"));
  ("v_Vuna_dCompiler_dQuery_dRun_dmemKey", ("Vuna.Compiler.Query.Run.memKey", "Vuna/Compiler/Query/Run.vuna:260"));
  ("v_Vuna_dCompiler_dQuery_dRun_dhashContentKey", ("Vuna.Compiler.Query.Run.hashContentKey", "Vuna/Compiler/Query/Run.vuna:265"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dcheckModsOf", ("Vuna.Compiler.Driver.Graph.checkModsOf", "Vuna/Compiler/Driver/Graph.vuna:61"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dgraphNodeKey", ("Vuna.Compiler.Driver.Graph.graphNodeKey", "Vuna/Compiler/Driver/Graph.vuna:65"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dcheckNodeKey", ("Vuna.Compiler.Driver.Graph.checkNodeKey", "Vuna/Compiler/Driver/Graph.vuna:69"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dgraphCheckMods", ("Vuna.Compiler.Driver.Graph.graphCheckMods", "Vuna/Compiler/Driver/Graph.vuna:73"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dnodeEnvKey", ("Vuna.Compiler.Driver.Graph.nodeEnvKey", "Vuna/Compiler/Driver/Graph.vuna:81"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dnodeSrcKey", ("Vuna.Compiler.Driver.Graph.nodeSrcKey", "Vuna/Compiler/Driver/Graph.vuna:84"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dnodeDepsKey", ("Vuna.Compiler.Driver.Graph.nodeDepsKey", "Vuna/Compiler/Driver/Graph.vuna:87"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dnodeCompilerKey", ("Vuna.Compiler.Driver.Graph.nodeCompilerKey", "Vuna/Compiler/Driver/Graph.vuna:90"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dgraphRunOpts", ("Vuna.Compiler.Driver.Graph.graphRunOpts", "Vuna/Compiler/Driver/Graph.vuna:94"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dgraphHit", ("Vuna.Compiler.Driver.Graph.graphHit", "Vuna/Compiler/Driver/Graph.vuna:98"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dgraphCommit", ("Vuna.Compiler.Driver.Graph.graphCommit", "Vuna/Compiler/Driver/Graph.vuna:102"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dgraphCommitRef", ("Vuna.Compiler.Driver.Graph.graphCommitRef", "Vuna/Compiler/Driver/Graph.vuna:106"));
  ("v_Vuna_dCompiler_dDriver_dGraph_dgraphNote", ("Vuna.Compiler.Driver.Graph.graphNote", "Vuna/Compiler/Driver/Graph.vuna:111"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmapEff", ("Vuna.Compiler.Driver.Compile.mapEff", "Vuna/Compiler/Driver/Compile.vuna:71"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff", ("Vuna.Compiler.Driver.Compile.concatMapEff", "Vuna/Compiler/Driver/Compile.vuna:78"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmapMaybeEff", ("Vuna.Compiler.Driver.Compile.mapMaybeEff", "Vuna/Compiler/Driver/Compile.vuna:85"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage", ("Vuna.Compiler.Driver.Compile.checkPackage", "Vuna/Compiler/Driver/Compile.vuna:100"));
  ("v_Vuna_dCompiler_dDriver_dCompile_densureDirPath", ("Vuna.Compiler.Driver.Compile.ensureDirPath", "Vuna/Compiler/Driver/Compile.vuna:116"));
  ("v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel", ("Vuna.Compiler.Driver.Compile.ensureDirPathFuel", "Vuna/Compiler/Driver/Compile.vuna:119"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddropPastSlash", ("Vuna.Compiler.Driver.Compile.dropPastSlash", "Vuna/Compiler/Driver/Compile.vuna:128"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dparentOfPath", ("Vuna.Compiler.Driver.Compile.parentOfPath", "Vuna/Compiler/Driver/Compile.vuna:132"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir", ("Vuna.Compiler.Driver.Compile.compileToDir", "Vuna/Compiler/Driver/Compile.vuna:148"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsummarySplitParts", ("Vuna.Compiler.Driver.Compile.summarySplitParts", "Vuna/Compiler/Driver/Compile.vuna:156"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcompileToDirNormal", ("Vuna.Compiler.Driver.Compile.compileToDirNormal", "Vuna/Compiler/Driver/Compile.vuna:179"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitBuild", ("Vuna.Compiler.Driver.Compile.splitBuild", "Vuna/Compiler/Driver/Compile.vuna:206"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dauditCompile", ("Vuna.Compiler.Driver.Compile.auditCompile", "Vuna/Compiler/Driver/Compile.vuna:236"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized", ("Vuna.Compiler.Driver.Compile.writeCompiledNormalized", "Vuna/Compiler/Driver/Compile.vuna:280"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles", ("Vuna.Compiler.Driver.Compile.copyFfiFiles", "Vuna/Compiler/Driver/Compile.vuna:304"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit", ("Vuna.Compiler.Driver.Compile.buildSplit", "Vuna/Compiler/Driver/Compile.vuna:325"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema", ("Vuna.Compiler.Driver.Compile.metaSchema", "Vuna/Compiler/Driver/Compile.vuna:345"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName", ("Vuna.Compiler.Driver.Compile.metaFileName", "Vuna/Compiler/Driver/Compile.vuna:348"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtextHash", ("Vuna.Compiler.Driver.Compile.textHash", "Vuna/Compiler/Driver/Compile.vuna:352"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint", ("Vuna.Compiler.Driver.Compile.compilerFingerprint", "Vuna/Compiler/Driver/Compile.vuna:361"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcacheBase", ("Vuna.Compiler.Driver.Compile.cacheBase", "Vuna/Compiler/Driver/Compile.vuna:366"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir", ("Vuna.Compiler.Driver.Compile.skipMetaDir", "Vuna/Compiler/Driver/Compile.vuna:376"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta", ("Vuna.Compiler.Driver.Compile.collectVunaMeta", "Vuna/Compiler/Driver/Compile.vuna:388"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta", ("Vuna.Compiler.Driver.Compile.walkVunaMeta", "Vuna/Compiler/Driver/Compile.vuna:398"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta", ("Vuna.Compiler.Driver.Compile.dropPrefixMeta", "Vuna/Compiler/Driver/Compile.vuna:413"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots", ("Vuna.Compiler.Driver.Compile.slashesToDots", "Vuna/Compiler/Driver/Compile.vuna:418"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dslashToDot", ("Vuna.Compiler.Driver.Compile.slashToDot", "Vuna/Compiler/Driver/Compile.vuna:421"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath", ("Vuna.Compiler.Driver.Compile.moduleNameOfPath", "Vuna/Compiler/Driver/Compile.vuna:424"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drootSources", ("Vuna.Compiler.Driver.Compile.rootSources", "Vuna/Compiler/Driver/Compile.vuna:431"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drootHash", ("Vuna.Compiler.Driver.Compile.rootHash", "Vuna/Compiler/Driver/Compile.vuna:439"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf", ("Vuna.Compiler.Driver.Compile.closureHashOf", "Vuna/Compiler/Driver/Compile.vuna:444"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dentrySource", ("Vuna.Compiler.Driver.Compile.entrySource", "Vuna/Compiler/Driver/Compile.vuna:449"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcontextSources", ("Vuna.Compiler.Driver.Compile.contextSources", "Vuna/Compiler/Driver/Compile.vuna:454"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes", ("Vuna.Compiler.Driver.Compile.dependencyHashes", "Vuna/Compiler/Driver/Compile.vuna:461"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText", ("Vuna.Compiler.Driver.Compile.metaPairText", "Vuna/Compiler/Driver/Compile.vuna:469"));
  ("v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList", ("Vuna.Compiler.Driver.Compile.joinJsonList", "Vuna/Compiler/Driver/Compile.vuna:472"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev", ("Vuna.Compiler.Driver.Compile.lastSegmentRev", "Vuna/Compiler/Driver/Compile.vuna:479"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dlastSegment", ("Vuna.Compiler.Driver.Compile.lastSegment", "Vuna/Compiler/Driver/Compile.vuna:483"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText", ("Vuna.Compiler.Driver.Compile.buildMetaText", "Vuna/Compiler/Driver/Compile.vuna:486"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf", ("Vuna.Compiler.Driver.Compile.metaPathOf", "Vuna/Compiler/Driver/Compile.vuna:499"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta", ("Vuna.Compiler.Driver.Compile.writeBuildMeta", "Vuna/Compiler/Driver/Compile.vuna:502"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate", ("Vuna.Compiler.Driver.Compile.metaUpToDate", "Vuna/Compiler/Driver/Compile.vuna:508"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript", ("Vuna.Compiler.Driver.Compile.runBuildScript", "Vuna/Compiler/Driver/Compile.vuna:523"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckNodeSchema", ("Vuna.Compiler.Driver.Compile.checkNodeSchema", "Vuna/Compiler/Driver/Compile.vuna:543"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dhashText", ("Vuna.Compiler.Driver.Compile.hashText", "Vuna/Compiler/Driver/Compile.vuna:546"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckModsExe", ("Vuna.Compiler.Driver.Compile.checkModsExe", "Vuna/Compiler/Driver/Compile.vuna:550"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckModsLib", ("Vuna.Compiler.Driver.Compile.checkModsLib", "Vuna/Compiler/Driver/Compile.vuna:565"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages", ("Vuna.Compiler.Driver.Compile.collectDepPackages", "Vuna/Compiler/Driver/Compile.vuna:583"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel", ("Vuna.Compiler.Driver.Compile.collectDepPackagesFuel", "Vuna/Compiler/Driver/Compile.vuna:586"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceDirOf", ("Vuna.Compiler.Driver.Compile.depIfaceDirOf", "Vuna/Compiler/Driver/Compile.vuna:598"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceOf", ("Vuna.Compiler.Driver.Compile.depIfaceOf", "Vuna/Compiler/Driver/Compile.vuna:601"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsameNameSet", ("Vuna.Compiler.Driver.Compile.sameNameSet", "Vuna/Compiler/Driver/Compile.vuna:622"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn", ("Vuna.Compiler.Driver.Compile.allNamesIn", "Vuna/Compiler/Driver/Compile.vuna:625"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList", ("Vuna.Compiler.Driver.Compile.depPackageList", "Vuna/Compiler/Driver/Compile.vuna:636"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount", ("Vuna.Compiler.Driver.Compile.depPackageCount", "Vuna/Compiler/Driver/Compile.vuna:641"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf", ("Vuna.Compiler.Driver.Compile.depIfacesOf", "Vuna/Compiler/Driver/Compile.vuna:644"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesGo", ("Vuna.Compiler.Driver.Compile.depIfacesGo", "Vuna/Compiler/Driver/Compile.vuna:650"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceSourcesValid", ("Vuna.Compiler.Driver.Compile.depIfaceSourcesValid", "Vuna/Compiler/Driver/Compile.vuna:689"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots", ("Vuna.Compiler.Driver.Compile.sourcePathMapOfRoots", "Vuna/Compiler/Driver/Compile.vuna:697"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid", ("Vuna.Compiler.Driver.Compile.allModuleSourcesValid", "Vuna/Compiler/Driver/Compile.vuna:705"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec", ("Vuna.Compiler.Driver.Compile.mtimeSafetyWindowSec", "Vuna/Compiler/Driver/Compile.vuna:717"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged", ("Vuna.Compiler.Driver.Compile.sourceInfoUnchanged", "Vuna/Compiler/Driver/Compile.vuna:720"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmtimeFastPath", ("Vuna.Compiler.Driver.Compile.mtimeFastPath", "Vuna/Compiler/Driver/Compile.vuna:743"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceChainValid", ("Vuna.Compiler.Driver.Compile.depIfaceChainValid", "Vuna/Compiler/Driver/Compile.vuna:750"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepHashesAllOk", ("Vuna.Compiler.Driver.Compile.depHashesAllOk", "Vuna/Compiler/Driver/Compile.vuna:756"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepHashListOk", ("Vuna.Compiler.Driver.Compile.depHashListOk", "Vuna/Compiler/Driver/Compile.vuna:760"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForCheck", ("Vuna.Compiler.Driver.Compile.depIfacesForCheck", "Vuna/Compiler/Driver/Compile.vuna:771"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolDepManifests", ("Vuna.Compiler.Driver.Compile.toolDepManifests", "Vuna/Compiler/Driver/Compile.vuna:780"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolManifestsGo", ("Vuna.Compiler.Driver.Compile.toolManifestsGo", "Vuna/Compiler/Driver/Compile.vuna:788"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmanifestSourcesValid", ("Vuna.Compiler.Driver.Compile.manifestSourcesValid", "Vuna/Compiler/Driver/Compile.vuna:815"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dallEntriesValid", ("Vuna.Compiler.Driver.Compile.allEntriesValid", "Vuna/Compiler/Driver/Compile.vuna:823"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolEntryTable", ("Vuna.Compiler.Driver.Compile.toolEntryTable", "Vuna/Compiler/Driver/Compile.vuna:831"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolFindEntry", ("Vuna.Compiler.Driver.Compile.toolFindEntry", "Vuna/Compiler/Driver/Compile.vuna:836"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolClosure", ("Vuna.Compiler.Driver.Compile.toolClosure", "Vuna/Compiler/Driver/Compile.vuna:841"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolClosureGo", ("Vuna.Compiler.Driver.Compile.toolClosureGo", "Vuna/Compiler/Driver/Compile.vuna:844"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfaces", ("Vuna.Compiler.Driver.Compile.toolReadIfaces", "Vuna/Compiler/Driver/Compile.vuna:856"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolReadIfacesGo", ("Vuna.Compiler.Driver.Compile.toolReadIfacesGo", "Vuna/Compiler/Driver/Compile.vuna:861"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolChainValid", ("Vuna.Compiler.Driver.Compile.toolChainValid", "Vuna/Compiler/Driver/Compile.vuna:876"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr", ("Vuna.Compiler.Driver.Compile.importNameStr", "Vuna/Compiler/Driver/Compile.vuna:882"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource", ("Vuna.Compiler.Driver.Compile.toolImportsOfSource", "Vuna/Compiler/Driver/Compile.vuna:885"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf", ("Vuna.Compiler.Driver.Compile.toolImportNamesOf", "Vuna/Compiler/Driver/Compile.vuna:894"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled", ("Vuna.Compiler.Driver.Compile.toolEnabled", "Vuna/Compiler/Driver/Compile.vuna:907"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolOwnManifest", ("Vuna.Compiler.Driver.Compile.toolOwnManifest", "Vuna/Compiler/Driver/Compile.vuna:912"));
  ("v_Vuna_dCompiler_dDriver_dCompile_downEntriesOf", ("Vuna.Compiler.Driver.Compile.ownEntriesOf", "Vuna/Compiler/Driver/Compile.vuna:926"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSource", ("Vuna.Compiler.Driver.Compile.depIfacesForToolSource", "Vuna/Compiler/Driver/Compile.vuna:929"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolProgram", ("Vuna.Compiler.Driver.Compile.depIfacesForToolProgram", "Vuna/Compiler/Driver/Compile.vuna:966"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForTool", ("Vuna.Compiler.Driver.Compile.depIfacesForTool", "Vuna/Compiler/Driver/Compile.vuna:969"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dbaseDepIfacesOf", ("Vuna.Compiler.Driver.Compile.baseDepIfacesOf", "Vuna/Compiler/Driver/Compile.vuna:978"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmanifestHashTable", ("Vuna.Compiler.Driver.Compile.manifestHashTable", "Vuna/Compiler/Driver/Compile.vuna:1018"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtableOfManifest", ("Vuna.Compiler.Driver.Compile.tableOfManifest", "Vuna/Compiler/Driver/Compile.vuna:1021"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dstatsOfManifest", ("Vuna.Compiler.Driver.Compile.statsOfManifest", "Vuna/Compiler/Driver/Compile.vuna:1026"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolTextHash", ("Vuna.Compiler.Driver.Compile.toolTextHash", "Vuna/Compiler/Driver/Compile.vuna:1032"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoForPath", ("Vuna.Compiler.Driver.Compile.sourceInfoForPath", "Vuna/Compiler/Driver/Compile.vuna:1035"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolNowSec", ("Vuna.Compiler.Driver.Compile.toolNowSec", "Vuna/Compiler/Driver/Compile.vuna:1042"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh", ("Vuna.Compiler.Driver.Compile.sourceFresh", "Vuna/Compiler/Driver/Compile.vuna:1050"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolSessionFresh", ("Vuna.Compiler.Driver.Compile.toolSessionFresh", "Vuna/Compiler/Driver/Compile.vuna:1065"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolContextTable", ("Vuna.Compiler.Driver.Compile.toolContextTable", "Vuna/Compiler/Driver/Compile.vuna:1072"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolNeededOfImports", ("Vuna.Compiler.Driver.Compile.toolNeededOfImports", "Vuna/Compiler/Driver/Compile.vuna:1081"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSourceDetailed", ("Vuna.Compiler.Driver.Compile.depIfacesForToolSourceDetailed", "Vuna/Compiler/Driver/Compile.vuna:1088"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanOwnModules", ("Vuna.Compiler.Driver.Compile.toolCleanOwnModules", "Vuna/Compiler/Driver/Compile.vuna:1129"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dfilterOwnEntries", ("Vuna.Compiler.Driver.Compile.filterOwnEntries", "Vuna/Compiler/Driver/Compile.vuna:1140"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo", ("Vuna.Compiler.Driver.Compile.toolCleanGo", "Vuna/Compiler/Driver/Compile.vuna:1151"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolWriteModuleIface", ("Vuna.Compiler.Driver.Compile.toolWriteModuleIface", "Vuna/Compiler/Driver/Compile.vuna:1165"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteModuleIfaceGuarded", ("Vuna.Compiler.Driver.Compile.writeModuleIfaceGuarded", "Vuna/Compiler/Driver/Compile.vuna:1179"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolWriteModuleIfaceCold", ("Vuna.Compiler.Driver.Compile.toolWriteModuleIfaceCold", "Vuna/Compiler/Driver/Compile.vuna:1203"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolHasOwnManifest", ("Vuna.Compiler.Driver.Compile.toolHasOwnManifest", "Vuna/Compiler/Driver/Compile.vuna:1220"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolOwnEntrySourceHash", ("Vuna.Compiler.Driver.Compile.toolOwnEntrySourceHash", "Vuna/Compiler/Driver/Compile.vuna:1229"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dentryHashOfEntries", ("Vuna.Compiler.Driver.Compile.entryHashOfEntries", "Vuna/Compiler/Driver/Compile.vuna:1234"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolCompilerFingerprint", ("Vuna.Compiler.Driver.Compile.toolCompilerFingerprint", "Vuna/Compiler/Driver/Compile.vuna:1240"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckViaGraph", ("Vuna.Compiler.Driver.Compile.checkViaGraph", "Vuna/Compiler/Driver/Compile.vuna:1249"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe", ("Vuna.Compiler.Driver.Compile.checkCachedExe", "Vuna/Compiler/Driver/Compile.vuna:1275"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe", ("Vuna.Compiler.Driver.Compile.checkUncachedExe", "Vuna/Compiler/Driver/Compile.vuna:1284"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckExeParts", ("Vuna.Compiler.Driver.Compile.summaryCheckExeParts", "Vuna/Compiler/Driver/Compile.vuna:1297"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe", ("Vuna.Compiler.Driver.Compile.fullCheckExe", "Vuna/Compiler/Driver/Compile.vuna:1323"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dauditCheckExe", ("Vuna.Compiler.Driver.Compile.auditCheckExe", "Vuna/Compiler/Driver/Compile.vuna:1331"));
  ("v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested", ("Vuna.Compiler.Driver.Compile.elabFullRequested", "Vuna/Compiler/Driver/Compile.vuna:1344"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested", ("Vuna.Compiler.Driver.Compile.ifaceAuditRequested", "Vuna/Compiler/Driver/Compile.vuna:1351"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf", ("Vuna.Compiler.Driver.Compile.checkSignatureOf", "Vuna/Compiler/Driver/Compile.vuna:1360"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitSignatureOf", ("Vuna.Compiler.Driver.Compile.splitSignatureOf", "Vuna/Compiler/Driver/Compile.vuna:1366"));
  ("v_Vuna_dCompiler_dDriver_dCompile_djoinLines", ("Vuna.Compiler.Driver.Compile.joinLines", "Vuna/Compiler/Driver/Compile.vuna:1370"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dauditCompare", ("Vuna.Compiler.Driver.Compile.auditCompare", "Vuna/Compiler/Driver/Compile.vuna:1376"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable", ("Vuna.Compiler.Driver.Compile.depIfaceHashTable", "Vuna/Compiler/Driver/Compile.vuna:1382"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dhashTableOf", ("Vuna.Compiler.Driver.Compile.hashTableOf", "Vuna/Compiler/Driver/Compile.vuna:1387"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpackageEnvHash", ("Vuna.Compiler.Driver.Compile.packageEnvHash", "Vuna/Compiler/Driver/Compile.vuna:1398"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepEnvText", ("Vuna.Compiler.Driver.Compile.depEnvText", "Vuna/Compiler/Driver/Compile.vuna:1413"));
  ("v_Vuna_dCompiler_dDriver_dCompile_downCleanInfo", ("Vuna.Compiler.Driver.Compile.ownCleanInfo", "Vuna/Compiler/Driver/Compile.vuna:1433"));
  ("v_Vuna_dCompiler_dDriver_dCompile_downCleanModules", ("Vuna.Compiler.Driver.Compile.ownCleanModules", "Vuna/Compiler/Driver/Compile.vuna:1454"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty", ("Vuna.Compiler.Driver.Compile.cleanIfacesOrEmpty", "Vuna/Compiler/Driver/Compile.vuna:1462"));
  ("v_Vuna_dCompiler_dDriver_dCompile_downOrigins", ("Vuna.Compiler.Driver.Compile.ownOrigins", "Vuna/Compiler/Driver/Compile.vuna:1473"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcleanModulesGo", ("Vuna.Compiler.Driver.Compile.cleanModulesGo", "Vuna/Compiler/Driver/Compile.vuna:1483"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpayloadSelfOk", ("Vuna.Compiler.Driver.Compile.payloadSelfOk", "Vuna/Compiler/Driver/Compile.vuna:1512"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk", ("Vuna.Compiler.Driver.Compile.moduleDepsOk", "Vuna/Compiler/Driver/Compile.vuna:1517"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf", ("Vuna.Compiler.Driver.Compile.cleanHashOf", "Vuna/Compiler/Driver/Compile.vuna:1526"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag", ("Vuna.Compiler.Driver.Compile.ifaceSchemaTag", "Vuna/Compiler/Driver/Compile.vuna:1535"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag", ("Vuna.Compiler.Driver.Compile.ifaceCompilerTag", "Vuna/Compiler/Driver/Compile.vuna:1538"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceRootOverride", ("Vuna.Compiler.Driver.Compile.ifaceRootOverride", "Vuna/Compiler/Driver/Compile.vuna:1544"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddropLeadingSlash", ("Vuna.Compiler.Driver.Compile.dropLeadingSlash", "Vuna/Compiler/Driver/Compile.vuna:1553"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceBaseOf", ("Vuna.Compiler.Driver.Compile.ifaceBaseOf", "Vuna/Compiler/Driver/Compile.vuna:1561"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceDirOf", ("Vuna.Compiler.Driver.Compile.ifaceDirOf", "Vuna/Compiler/Driver/Compile.vuna:1571"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceDirsWritable", ("Vuna.Compiler.Driver.Compile.ifaceDirsWritable", "Vuna/Compiler/Driver/Compile.vuna:1577"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceWriteReady", ("Vuna.Compiler.Driver.Compile.ifaceWriteReady", "Vuna/Compiler/Driver/Compile.vuna:1586"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceFilesOk", ("Vuna.Compiler.Driver.Compile.ifaceFilesOk", "Vuna/Compiler/Driver/Compile.vuna:1595"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceLockPath", ("Vuna.Compiler.Driver.Compile.ifaceLockPath", "Vuna/Compiler/Driver/Compile.vuna:1606"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceLockFresh", ("Vuna.Compiler.Driver.Compile.ifaceLockFresh", "Vuna/Compiler/Driver/Compile.vuna:1611"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dacquireIfaceLock", ("Vuna.Compiler.Driver.Compile.acquireIfaceLock", "Vuna/Compiler/Driver/Compile.vuna:1617"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dreleaseIfaceLock", ("Vuna.Compiler.Driver.Compile.releaseIfaceLock", "Vuna/Compiler/Driver/Compile.vuna:1630"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwithIfaceLock", ("Vuna.Compiler.Driver.Compile.withIfaceLock", "Vuna/Compiler/Driver/Compile.vuna:1633"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcollectIfaceFiles", ("Vuna.Compiler.Driver.Compile.collectIfaceFiles", "Vuna/Compiler/Driver/Compile.vuna:1651"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwalkIfaceFiles", ("Vuna.Compiler.Driver.Compile.walkIfaceFiles", "Vuna/Compiler/Driver/Compile.vuna:1661"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dgcIfaceOrphans", ("Vuna.Compiler.Driver.Compile.gcIfaceOrphans", "Vuna/Compiler/Driver/Compile.vuna:1673"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dgcIfaceGo", ("Vuna.Compiler.Driver.Compile.gcIfaceGo", "Vuna/Compiler/Driver/Compile.vuna:1682"));
  ("v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos", ("Vuna.Compiler.Driver.Compile.ownSourceInfos", "Vuna/Compiler/Driver/Compile.vuna:1704"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dresyncCleanSources", ("Vuna.Compiler.Driver.Compile.resyncCleanSources", "Vuna/Compiler/Driver/Compile.vuna:1722"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow", ("Vuna.Compiler.Driver.Compile.writeIfaceShadow", "Vuna/Compiler/Driver/Compile.vuna:1731"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceNow", ("Vuna.Compiler.Driver.Compile.writeIfaceNow", "Vuna/Compiler/Driver/Compile.vuna:1766"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested", ("Vuna.Compiler.Driver.Compile.ifaceSelfTestRequested", "Vuna/Compiler/Driver/Compile.vuna:1807"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName", ("Vuna.Compiler.Driver.Compile.ifaceHashOfName", "Vuna/Compiler/Driver/Compile.vuna:1812"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTest", ("Vuna.Compiler.Driver.Compile.ifaceSelfTest", "Vuna/Compiler/Driver/Compile.vuna:1817"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dallSelfHashesOk", ("Vuna.Compiler.Driver.Compile.allSelfHashesOk", "Vuna/Compiler/Driver/Compile.vuna:1840"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes", ("Vuna.Compiler.Driver.Compile.sameIfaceHashes", "Vuna/Compiler/Driver/Compile.vuna:1844"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow", ("Vuna.Compiler.Driver.Compile.checkAndShadow", "Vuna/Compiler/Driver/Compile.vuna:1851"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib", ("Vuna.Compiler.Driver.Compile.checkCachedLib", "Vuna/Compiler/Driver/Compile.vuna:1862"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib", ("Vuna.Compiler.Driver.Compile.checkUncachedLib", "Vuna/Compiler/Driver/Compile.vuna:1868"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckLibParts", ("Vuna.Compiler.Driver.Compile.summaryCheckLibParts", "Vuna/Compiler/Driver/Compile.vuna:1879"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib", ("Vuna.Compiler.Driver.Compile.fullCheckLib", "Vuna/Compiler/Driver/Compile.vuna:1905"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dauditCheckLib", ("Vuna.Compiler.Driver.Compile.auditCheckLib", "Vuna/Compiler/Driver/Compile.vuna:1911"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema", ("Vuna.Compiler.Driver.Compile.splitNodeSchema", "Vuna/Compiler/Driver/Compile.vuna:1934"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec", ("Vuna.Compiler.Driver.Compile.splitCacheCodec", "Vuna/Compiler/Driver/Compile.vuna:1940"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag", ("Vuna.Compiler.Driver.Compile.splitBlobTag", "Vuna/Compiler/Driver/Compile.vuna:1944"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf", ("Vuna.Compiler.Driver.Compile.splitModsOf", "Vuna/Compiler/Driver/Compile.vuna:1950"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath", ("Vuna.Compiler.Driver.Compile.splitBlobPath", "Vuna/Compiler/Driver/Compile.vuna:1965"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlob", ("Vuna.Compiler.Driver.Compile.writeSplitBlob", "Vuna/Compiler/Driver/Compile.vuna:1972"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dreadSplitBlob", ("Vuna.Compiler.Driver.Compile.readSplitBlob", "Vuna/Compiler/Driver/Compile.vuna:1986"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidModule", ("Vuna.Compiler.Driver.Compile.firstInvalidModule", "Vuna/Compiler/Driver/Compile.vuna:1997"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpmModulesOfIface", ("Vuna.Compiler.Driver.Compile.pmModulesOfIface", "Vuna/Compiler/Driver/Compile.vuna:2000"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidGo", ("Vuna.Compiler.Driver.Compile.firstInvalidGo", "Vuna/Compiler/Driver/Compile.vuna:2003"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_disDigitCode", ("Vuna.Compiler.Driver.DiagRender.isDigitCode", "Vuna/Compiler/Driver/DiagRender.vuna:29"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_disWordCode", ("Vuna.Compiler.Driver.DiagRender.isWordCode", "Vuna/Compiler/Driver/DiagRender.vuna:33"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dcharAt", ("Vuna.Compiler.Driver.DiagRender.charAt", "Vuna/Compiler/Driver/DiagRender.vuna:37"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dfindCharIdx", ("Vuna.Compiler.Driver.DiagRender.findCharIdx", "Vuna/Compiler/Driver/DiagRender.vuna:42"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dclampInt", ("Vuna.Compiler.Driver.DiagRender.clampInt", "Vuna/Compiler/Driver/DiagRender.vuna:46"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dpadLeft", ("Vuna.Compiler.Driver.DiagRender.padLeft", "Vuna/Compiler/Driver/DiagRender.vuna:50"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_ddigitsValue", ("Vuna.Compiler.Driver.DiagRender.digitsValue", "Vuna/Compiler/Driver/DiagRender.vuna:53"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dparseNum", ("Vuna.Compiler.Driver.DiagRender.parseNum", "Vuna/Compiler/Driver/DiagRender.vuna:57"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dallDigitCodes", ("Vuna.Compiler.Driver.DiagRender.allDigitCodes", "Vuna/Compiler/Driver/DiagRender.vuna:60"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_disNumText", ("Vuna.Compiler.Driver.DiagRender.isNumText", "Vuna/Compiler/Driver/DiagRender.vuna:65"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dlastText", ("Vuna.Compiler.Driver.DiagRender.lastText", "Vuna/Compiler/Driver/DiagRender.vuna:68"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dsplitCliPrefix", ("Vuna.Compiler.Driver.DiagRender.splitCliPrefix", "Vuna/Compiler/Driver/DiagRender.vuna:77"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dsplitPkg", ("Vuna.Compiler.Driver.DiagRender.splitPkg", "Vuna/Compiler/Driver/DiagRender.vuna:85"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dlocCandidates", ("Vuna.Compiler.Driver.DiagRender.locCandidates", "Vuna/Compiler/Driver/DiagRender.vuna:98"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dscanCandidates", ("Vuna.Compiler.Driver.DiagRender.scanCandidates", "Vuna/Compiler/Driver/DiagRender.vuna:101"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dnormalizeFile", ("Vuna.Compiler.Driver.DiagRender.normalizeFile", "Vuna/Compiler/Driver/DiagRender.vuna:116"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_ddropBracket", ("Vuna.Compiler.Driver.DiagRender.dropBracket", "Vuna/Compiler/Driver/DiagRender.vuna:123"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dlineAt", ("Vuna.Compiler.Driver.DiagRender.lineAt", "Vuna/Compiler/Driver/DiagRender.vuna:130"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dstripCr", ("Vuna.Compiler.Driver.DiagRender.stripCr", "Vuna/Compiler/Driver/DiagRender.vuna:134"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dfirstReadableLocEff", ("Vuna.Compiler.Driver.DiagRender.firstReadableLocEff", "Vuna/Compiler/Driver/DiagRender.vuna:138"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_ddisplayLine", ("Vuna.Compiler.Driver.DiagRender.displayLine", "Vuna/Compiler/Driver/DiagRender.vuna:156"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dtabToSpace", ("Vuna.Compiler.Driver.DiagRender.tabToSpace", "Vuna/Compiler/Driver/DiagRender.vuna:159"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dcaretStart", ("Vuna.Compiler.Driver.DiagRender.caretStart", "Vuna/Compiler/Driver/DiagRender.vuna:163"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dcaretWidth", ("Vuna.Compiler.Driver.DiagRender.caretWidth", "Vuna/Compiler/Driver/DiagRender.vuna:168"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dwordWidth", ("Vuna.Compiler.Driver.DiagRender.wordWidth", "Vuna/Compiler/Driver/DiagRender.vuna:175"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dlitWidth", ("Vuna.Compiler.Driver.DiagRender.litWidth", "Vuna/Compiler/Driver/DiagRender.vuna:180"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dgutter", ("Vuna.Compiler.Driver.DiagRender.gutter", "Vuna/Compiler/Driver/DiagRender.vuna:188"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dnumberRow", ("Vuna.Compiler.Driver.DiagRender.numberRow", "Vuna/Compiler/Driver/DiagRender.vuna:191"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dcaretRow", ("Vuna.Compiler.Driver.DiagRender.caretRow", "Vuna/Compiler/Driver/DiagRender.vuna:194"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_dsnippetBlock", ("Vuna.Compiler.Driver.DiagRender.snippetBlock", "Vuna/Compiler/Driver/DiagRender.vuna:198"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_drenderBodyEff", ("Vuna.Compiler.Driver.DiagRender.renderBodyEff", "Vuna/Compiler/Driver/DiagRender.vuna:212"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_drenderBodyWithNewlineEff", ("Vuna.Compiler.Driver.DiagRender.renderBodyWithNewlineEff", "Vuna/Compiler/Driver/DiagRender.vuna:221"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_drenderCliDiagnosticEff", ("Vuna.Compiler.Driver.DiagRender.renderCliDiagnosticEff", "Vuna/Compiler/Driver/DiagRender.vuna:232"));
  ("v_Vuna_dCompiler_dDriver_dDiagRender_drenderWithPrefixEff", ("Vuna.Compiler.Driver.DiagRender.renderWithPrefixEff", "Vuna/Compiler/Driver/DiagRender.vuna:242"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dseverityName", ("Vuna.Compiler.Diag.Format.severityName", "Vuna/Compiler/Diag/Format.vuna:32"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dphaseName", ("Vuna.Compiler.Diag.Format.phaseName", "Vuna/Compiler/Diag/Format.vuna:38"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dcategoryName", ("Vuna.Compiler.Diag.Format.categoryName", "Vuna/Compiler/Diag/Format.vuna:54"));
  ("v_Vuna_dCompiler_dDiag_dFormat_doriginName", ("Vuna.Compiler.Diag.Format.originName", "Vuna/Compiler/Diag/Format.vuna:70"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dapplicabilityName", ("Vuna.Compiler.Diag.Format.applicabilityName", "Vuna/Compiler/Diag/Format.vuna:74"));
  ("v_Vuna_dCompiler_dDiag_dFormat_drenderShort", ("Vuna.Compiler.Diag.Format.renderShort", "Vuna/Compiler/Diag/Format.vuna:82"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dprimarySpan", ("Vuna.Compiler.Diag.Format.primarySpan", "Vuna/Compiler/Diag/Format.vuna:89"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dprimaryText", ("Vuna.Compiler.Diag.Format.primaryText", "Vuna/Compiler/Diag/Format.vuna:95"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dlineAt", ("Vuna.Compiler.Diag.Format.lineAt", "Vuna/Compiler/Diag/Format.vuna:101"));
  ("v_Vuna_dCompiler_dDiag_dFormat_ddisplayLine", ("Vuna.Compiler.Diag.Format.displayLine", "Vuna/Compiler/Diag/Format.vuna:106"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dtabToSpace", ("Vuna.Compiler.Diag.Format.tabToSpace", "Vuna/Compiler/Diag/Format.vuna:109"));
  ("v_Vuna_dCompiler_dDiag_dFormat_drepeatSpace", ("Vuna.Compiler.Diag.Format.repeatSpace", "Vuna/Compiler/Diag/Format.vuna:113"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dpadLeft", ("Vuna.Compiler.Diag.Format.padLeft", "Vuna/Compiler/Diag/Format.vuna:116"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dcaretWidth", ("Vuna.Compiler.Diag.Format.caretWidth", "Vuna/Compiler/Diag/Format.vuna:120"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dsnippetOf", ("Vuna.Compiler.Diag.Format.snippetOf", "Vuna/Compiler/Diag/Format.vuna:126"));
  ("v_Vuna_dCompiler_dDiag_dFormat_drenderSnippet", ("Vuna.Compiler.Diag.Format.renderSnippet", "Vuna/Compiler/Diag/Format.vuna:143"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dlocalizedMessage", ("Vuna.Compiler.Diag.Format.localizedMessage", "Vuna/Compiler/Diag/Format.vuna:155"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dheaderOf", ("Vuna.Compiler.Diag.Format.headerOf", "Vuna/Compiler/Diag/Format.vuna:161"));
  ("v_Vuna_dCompiler_dDiag_dFormat_drenderHuman", ("Vuna.Compiler.Diag.Format.renderHuman", "Vuna/Compiler/Diag/Format.vuna:169"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonEscapeChar", ("Vuna.Compiler.Diag.Format.jsonEscapeChar", "Vuna/Compiler/Diag/Format.vuna:195"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dhex2", ("Vuna.Compiler.Diag.Format.hex2", "Vuna/Compiler/Diag/Format.vuna:203"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dhexDigit", ("Vuna.Compiler.Diag.Format.hexDigit", "Vuna/Compiler/Diag/Format.vuna:210"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonEscape", ("Vuna.Compiler.Diag.Format.jsonEscape", "Vuna/Compiler/Diag/Format.vuna:215"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonStr", ("Vuna.Compiler.Diag.Format.jsonStr", "Vuna/Compiler/Diag/Format.vuna:218"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonPos", ("Vuna.Compiler.Diag.Format.jsonPos", "Vuna/Compiler/Diag/Format.vuna:221"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonSpan", ("Vuna.Compiler.Diag.Format.jsonSpan", "Vuna/Compiler/Diag/Format.vuna:224"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonLabel", ("Vuna.Compiler.Diag.Format.jsonLabel", "Vuna/Compiler/Diag/Format.vuna:228"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dstyleName", ("Vuna.Compiler.Diag.Format.styleName", "Vuna/Compiler/Diag/Format.vuna:232"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonSpan", ("Vuna.Compiler.Diag.Format.maybeJsonSpan", "Vuna/Compiler/Diag/Format.vuna:237"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonCandidate", ("Vuna.Compiler.Diag.Format.jsonCandidate", "Vuna/Compiler/Diag/Format.vuna:241"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonString", ("Vuna.Compiler.Diag.Format.maybeJsonString", "Vuna/Compiler/Diag/Format.vuna:245"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonField", ("Vuna.Compiler.Diag.Format.jsonField", "Vuna/Compiler/Diag/Format.vuna:249"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonDiagEdit", ("Vuna.Compiler.Diag.Format.jsonDiagEdit", "Vuna/Compiler/Diag/Format.vuna:265"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonSuggestion", ("Vuna.Compiler.Diag.Format.jsonSuggestion", "Vuna/Compiler/Diag/Format.vuna:268"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonTrace", ("Vuna.Compiler.Diag.Format.jsonTrace", "Vuna/Compiler/Diag/Format.vuna:272"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonTraceFuel", ("Vuna.Compiler.Diag.Format.jsonTraceFuel", "Vuna/Compiler/Diag/Format.vuna:275"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonIce", ("Vuna.Compiler.Diag.Format.jsonIce", "Vuna/Compiler/Diag/Format.vuna:280"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dmaybeJsonIce", ("Vuna.Compiler.Diag.Format.maybeJsonIce", "Vuna/Compiler/Diag/Format.vuna:284"));
  ("v_Vuna_dCompiler_dDiag_dFormat_doriginJson", ("Vuna.Compiler.Diag.Format.originJson", "Vuna/Compiler/Diag/Format.vuna:288"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dmaybeParent", ("Vuna.Compiler.Diag.Format.maybeParent", "Vuna/Compiler/Diag/Format.vuna:292"));
  ("v_Vuna_dCompiler_dDiag_dFormat_djsonDiag", ("Vuna.Compiler.Diag.Format.jsonDiag", "Vuna/Compiler/Diag/Format.vuna:296"));
  ("v_Vuna_dCompiler_dDiag_dFormat_drenderJson", ("Vuna.Compiler.Diag.Format.renderJson", "Vuna/Compiler/Diag/Format.vuna:301"));
  ("v_Vuna_dCompiler_dDiag_dFormat_drenderJsonList", ("Vuna.Compiler.Diag.Format.renderJsonList", "Vuna/Compiler/Diag/Format.vuna:304"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dsarifLevel", ("Vuna.Compiler.Diag.Format.sarifLevel", "Vuna/Compiler/Diag/Format.vuna:311"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dsarifRuleId", ("Vuna.Compiler.Diag.Format.sarifRuleId", "Vuna/Compiler/Diag/Format.vuna:317"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dsarifRegion", ("Vuna.Compiler.Diag.Format.sarifRegion", "Vuna/Compiler/Diag/Format.vuna:320"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dsarifLocation", ("Vuna.Compiler.Diag.Format.sarifLocation", "Vuna/Compiler/Diag/Format.vuna:324"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dsarifRelated", ("Vuna.Compiler.Diag.Format.sarifRelated", "Vuna/Compiler/Diag/Format.vuna:328"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dsarifResult", ("Vuna.Compiler.Diag.Format.sarifResult", "Vuna/Compiler/Diag/Format.vuna:334"));
  ("v_Vuna_dCompiler_dDiag_dFormat_disPrimaryLabel", ("Vuna.Compiler.Diag.Format.isPrimaryLabel", "Vuna/Compiler/Diag/Format.vuna:348"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dsarifRules", ("Vuna.Compiler.Diag.Format.sarifRules", "Vuna/Compiler/Diag/Format.vuna:354"));
  ("v_Vuna_dCompiler_dDiag_dFormat_duniqueCodes", ("Vuna.Compiler.Diag.Format.uniqueCodes", "Vuna/Compiler/Diag/Format.vuna:357"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dmemCode", ("Vuna.Compiler.Diag.Format.memCode", "Vuna/Compiler/Diag/Format.vuna:362"));
  ("v_Vuna_dCompiler_dDiag_dFormat_druleJson", ("Vuna.Compiler.Diag.Format.ruleJson", "Vuna/Compiler/Diag/Format.vuna:366"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dsarifLevelName", ("Vuna.Compiler.Diag.Format.sarifLevelName", "Vuna/Compiler/Diag/Format.vuna:377"));
  ("v_Vuna_dCompiler_dDiag_dFormat_drenderSarif", ("Vuna.Compiler.Diag.Format.renderSarif", "Vuna/Compiler/Diag/Format.vuna:383"));
  ("v_Vuna_dCompiler_dDiag_dFormat_ddiagDescLine", ("Vuna.Compiler.Diag.Format.diagDescLine", "Vuna/Compiler/Diag/Format.vuna:391"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dfieldLine", ("Vuna.Compiler.Diag.Format.fieldLine", "Vuna/Compiler/Diag/Format.vuna:397"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dtraceLines", ("Vuna.Compiler.Diag.Format.traceLines", "Vuna/Compiler/Diag/Format.vuna:411"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dindent", ("Vuna.Compiler.Diag.Format.indent", "Vuna/Compiler/Diag/Format.vuna:416"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dsuggestionLine", ("Vuna.Compiler.Diag.Format.suggestionLine", "Vuna/Compiler/Diag/Format.vuna:419"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dshowInt", ("Vuna.Compiler.Diag.Format.showInt", "Vuna/Compiler/Diag/Format.vuna:422"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dcandidateTextOf", ("Vuna.Compiler.Diag.Format.candidateTextOf", "Vuna/Compiler/Diag/Format.vuna:425"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dcallSpanSuffix", ("Vuna.Compiler.Diag.Format.callSpanSuffix", "Vuna/Compiler/Diag/Format.vuna:429"));
  ("v_Vuna_dCompiler_dDiag_dFormat_dlocalizedJsonField", ("Vuna.Compiler.Diag.Format.localizedJsonField", "Vuna/Compiler/Diag/Format.vuna:433"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines", ("Vuna.Compiler.Driver.CompilerCli.compilerUsageLines", "Vuna/Compiler/Driver/CompilerCli.vuna:33"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage", ("Vuna.Compiler.Driver.CompilerCli.compilerUsage", "Vuna/Compiler/Driver/CompilerCli.vuna:45"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff", ("Vuna.Compiler.Driver.CompilerCli.mapEff", "Vuna/Compiler/Driver/CompilerCli.vuna:49"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli", ("Vuna.Compiler.Driver.CompilerCli.runCompilerCli", "Vuna/Compiler/Driver/CompilerCli.vuna:57"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultCliOpts", ("Vuna.Compiler.Driver.CompilerCli.defaultCliOpts", "Vuna/Compiler/Driver/CompilerCli.vuna:75"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease", ("Vuna.Compiler.Driver.CompilerCli.markRelease", "Vuna/Compiler/Driver/CompilerCli.vuna:79"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts", ("Vuna.Compiler.Driver.CompilerCli.withOpts", "Vuna/Compiler/Driver/CompilerCli.vuna:83"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor", ("Vuna.Compiler.Driver.CompilerCli.diagExitFor", "Vuna/Compiler/Driver/CompilerCli.vuna:88"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dflushSarif", ("Vuna.Compiler.Driver.CompilerCli.flushSarif", "Vuna/Compiler/Driver/CompilerCli.vuna:95"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig", ("Vuna.Compiler.Driver.CompilerCli.applyDiagConfig", "Vuna/Compiler/Driver/CompilerCli.vuna:108"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyManifestOpts", ("Vuna.Compiler.Driver.CompilerCli.applyManifestOpts", "Vuna/Compiler/Driver/CompilerCli.vuna:111"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags", ("Vuna.Compiler.Driver.CompilerCli.takeDiags", "Vuna/Compiler/Driver/CompilerCli.vuna:142"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo", ("Vuna.Compiler.Driver.CompilerCli.takeDiagsGo", "Vuna/Compiler/Driver/CompilerCli.vuna:146"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings", ("Vuna.Compiler.Driver.CompilerCli.stripDenyWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:151"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings", ("Vuna.Compiler.Driver.CompilerCli.hasDenyWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:158"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings", ("Vuna.Compiler.Driver.CompilerCli.hasShowWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:163"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag", ("Vuna.Compiler.Driver.CompilerCli.hasFormatFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:169"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormat", ("Vuna.Compiler.Driver.CompilerCli.stripDiagFormat", "Vuna/Compiler/Driver/CompilerCli.vuna:176"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo", ("Vuna.Compiler.Driver.CompilerCli.stripDiagFormatGo", "Vuna/Compiler/Driver/CompilerCli.vuna:180"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor", ("Vuna.Compiler.Driver.CompilerCli.runCompilerCliFor", "Vuna/Compiler/Driver/CompilerCli.vuna:194"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr", ("Vuna.Compiler.Driver.CompilerCli.parseIntOr", "Vuna/Compiler/Driver/CompilerCli.vuna:219"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars", ("Vuna.Compiler.Driver.CompilerCli.parseIntChars", "Vuna/Compiler/Driver/CompilerCli.vuna:223"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrors", ("Vuna.Compiler.Driver.CompilerCli.stripMaxErrors", "Vuna/Compiler/Driver/CompilerCli.vuna:230"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo", ("Vuna.Compiler.Driver.CompilerCli.stripMaxErrorsGo", "Vuna/Compiler/Driver/CompilerCli.vuna:234"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1", ("Vuna.Compiler.Driver.CompilerCli.runCompilerCliFor1", "Vuna/Compiler/Driver/CompilerCli.vuna:245"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion", ("Vuna.Compiler.Driver.CompilerCli.printVersion", "Vuna/Compiler/Driver/CompilerCli.vuna:261"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp", ("Vuna.Compiler.Driver.CompilerCli.anyHelp", "Vuna/Compiler/Driver/CompilerCli.vuna:267"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor", ("Vuna.Compiler.Driver.CompilerCli.helpFor", "Vuna/Compiler/Driver/CompilerCli.vuna:272"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr", ("Vuna.Compiler.Driver.CompilerCli.usageErr", "Vuna/Compiler/Driver/CompilerCli.vuna:278"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand", ("Vuna.Compiler.Driver.CompilerCli.unknownCommand", "Vuna/Compiler/Driver/CompilerCli.vuna:284"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand", ("Vuna.Compiler.Driver.CompilerCli.removedCommand", "Vuna/Compiler/Driver/CompilerCli.vuna:289"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag", ("Vuna.Compiler.Driver.CompilerCli.dashFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:297"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint", ("Vuna.Compiler.Driver.CompilerCli.removedFlagHint", "Vuna/Compiler/Driver/CompilerCli.vuna:300"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag", ("Vuna.Compiler.Driver.CompilerCli.removedFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:312"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText", ("Vuna.Compiler.Driver.CompilerCli.printErrText", "Vuna/Compiler/Driver/CompilerCli.vuna:322"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dseverityLabelOf", ("Vuna.Compiler.Driver.CompilerCli.severityLabelOf", "Vuna/Compiler/Driver/CompilerCli.vuna:329"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag", ("Vuna.Compiler.Driver.CompilerCli.emitDiag", "Vuna/Compiler/Driver/CompilerCli.vuna:337"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarifIn", ("Vuna.Compiler.Driver.CompilerCli.collectSarifIn", "Vuna/Compiler/Driver/CompilerCli.vuna:349"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq", ("Vuna.Compiler.Driver.CompilerCli.emitDiagRevSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:355"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix", ("Vuna.Compiler.Driver.CompilerCli.printDiagWithPrefix", "Vuna/Compiler/Driver/CompilerCli.vuna:362"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag", ("Vuna.Compiler.Driver.CompilerCli.printDiag", "Vuna/Compiler/Driver/CompilerCli.vuna:373"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr", ("Vuna.Compiler.Driver.CompilerCli.printErr", "Vuna/Compiler/Driver/CompilerCli.vuna:377"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList", ("Vuna.Compiler.Driver.CompilerCli.printDiagList", "Vuna/Compiler/Driver/CompilerCli.vuna:381"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir", ("Vuna.Compiler.Driver.CompilerCli.defaultDir", "Vuna/Compiler/Driver/CompilerCli.vuna:389"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr", ("Vuna.Compiler.Driver.CompilerCli.dtPathErr", "Vuna/Compiler/Driver/CompilerCli.vuna:396"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage", ("Vuna.Compiler.Driver.CompilerCli.executablePackage", "Vuna/Compiler/Driver/CompilerCli.vuna:400"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt", ("Vuna.Compiler.Driver.CompilerCli.executablePackageAt", "Vuna/Compiler/Driver/CompilerCli.vuna:409"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs", ("Vuna.Compiler.Driver.CompilerCli.compileArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:425"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse", ("Vuna.Compiler.Driver.CompilerCli.compileParse", "Vuna/Compiler/Driver/CompilerCli.vuna:428"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish", ("Vuna.Compiler.Driver.CompilerCli.compileFinish", "Vuna/Compiler/Driver/CompilerCli.vuna:440"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun", ("Vuna.Compiler.Driver.CompilerCli.compileRun", "Vuna/Compiler/Driver/CompilerCli.vuna:446"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry", ("Vuna.Compiler.Driver.CompilerCli.compileFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:455"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir", ("Vuna.Compiler.Driver.CompilerCli.compilePkgDir", "Vuna/Compiler/Driver/CompilerCli.vuna:470"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs", ("Vuna.Compiler.Driver.CompilerCli.checkArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:490"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit", ("Vuna.Compiler.Driver.CompilerCli.checkEmit", "Vuna/Compiler/Driver/CompilerCli.vuna:499"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir", ("Vuna.Compiler.Driver.CompilerCli.checkPkgDir", "Vuna/Compiler/Driver/CompilerCli.vuna:507"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckSpawnArgs", ("Vuna.Compiler.Driver.CompilerCli.checkSpawnArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:521"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages", ("Vuna.Compiler.Driver.CompilerCli.checkPackages", "Vuna/Compiler/Driver/CompilerCli.vuna:531"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot", ("Vuna.Compiler.Driver.CompilerCli.isWorkspaceRoot", "Vuna/Compiler/Driver/CompilerCli.vuna:551"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq", ("Vuna.Compiler.Driver.CompilerCli.checkRootsSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:559"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq", ("Vuna.Compiler.Driver.CompilerCli.checkPackageSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:565"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageCode", ("Vuna.Compiler.Driver.CompilerCli.checkPackageCode", "Vuna/Compiler/Driver/CompilerCli.vuna:576"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures", ("Vuna.Compiler.Driver.CompilerCli.countFailures", "Vuna/Compiler/Driver/CompilerCli.vuna:590"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry", ("Vuna.Compiler.Driver.CompilerCli.checkFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:594"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_disModuleFileEntry", ("Vuna.Compiler.Driver.CompilerCli.isModuleFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:609"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_disPackageEntryPath", ("Vuna.Compiler.Driver.CompilerCli.isPackageEntryPath", "Vuna/Compiler/Driver/CompilerCli.vuna:614"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckModuleFileEntry", ("Vuna.Compiler.Driver.CompilerCli.checkModuleFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:623"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEntryFile", ("Vuna.Compiler.Driver.CompilerCli.checkEntryFile", "Vuna/Compiler/Driver/CompilerCli.vuna:637"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs", ("Vuna.Compiler.Driver.CompilerCli.buildArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:668"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse", ("Vuna.Compiler.Driver.CompilerCli.buildParse", "Vuna/Compiler/Driver/CompilerCli.vuna:671"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun", ("Vuna.Compiler.Driver.CompilerCli.buildRun", "Vuna/Compiler/Driver/CompilerCli.vuna:693"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage", ("Vuna.Compiler.Driver.CompilerCli.isSingleLibraryPackage", "Vuna/Compiler/Driver/CompilerCli.vuna:707"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage", ("Vuna.Compiler.Driver.CompilerCli.libraryOnlyMessage", "Vuna/Compiler/Driver/CompilerCli.vuna:713"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets", ("Vuna.Compiler.Driver.CompilerCli.selectBuildTargets", "Vuna/Compiler/Driver/CompilerCli.vuna:718"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName", ("Vuna.Compiler.Driver.CompilerCli.findPackageByName", "Vuna/Compiler/Driver/CompilerCli.vuna:724"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets", ("Vuna.Compiler.Driver.CompilerCli.buildTargets", "Vuna/Compiler/Driver/CompilerCli.vuna:730"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne", ("Vuna.Compiler.Driver.CompilerCli.buildOne", "Vuna/Compiler/Driver/CompilerCli.vuna:739"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen", ("Vuna.Compiler.Driver.CompilerCli.compileCodegen", "Vuna/Compiler/Driver/CompilerCli.vuna:772"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked", ("Vuna.Compiler.Driver.CompilerCli.buildLinked", "Vuna/Compiler/Driver/CompilerCli.vuna:781"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash", ("Vuna.Compiler.Driver.CompilerCli.stripDotSlash", "Vuna/Compiler/Driver/CompilerCli.vuna:796"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile", ("Vuna.Compiler.Driver.CompilerCli.ownedByFile", "Vuna/Compiler/Driver/CompilerCli.vuna:801"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_downedByPackage", ("Vuna.Compiler.Driver.CompilerCli.ownedByPackage", "Vuna/Compiler/Driver/CompilerCli.vuna:805"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarnings", ("Vuna.Compiler.Driver.CompilerCli.finishWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:817"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir", ("Vuna.Compiler.Driver.CompilerCli.finishWarningsDir", "Vuna/Compiler/Driver/CompilerCli.vuna:828"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLang", ("Vuna.Compiler.Driver.CompilerCli.stripLang", "Vuna/Compiler/Driver/CompilerCli.vuna:842"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo", ("Vuna.Compiler.Driver.CompilerCli.stripLangGo", "Vuna/Compiler/Driver/CompilerCli.vuna:846"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag", ("Vuna.Compiler.Driver.CompilerCli.hasLangFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:856"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueOnError", ("Vuna.Compiler.Driver.CompilerCli.stripContinueOnError", "Vuna/Compiler/Driver/CompilerCli.vuna:861"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo", ("Vuna.Compiler.Driver.CompilerCli.stripContinueGo", "Vuna/Compiler/Driver/CompilerCli.vuna:864"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageErr", ("Vuna.Compiler.Driver.CompilerCli.checkPackageErr", "Vuna/Compiler/Driver/CompilerCli.vuna:869"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecover", ("Vuna.Compiler.Driver.CompilerCli.packageRecover", "Vuna/Compiler/Driver/CompilerCli.vuna:876"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverExe", ("Vuna.Compiler.Driver.CompilerCli.packageRecoverExe", "Vuna/Compiler/Driver/CompilerCli.vuna:882"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverLib", ("Vuna.Compiler.Driver.CompilerCli.packageRecoverLib", "Vuna/Compiler/Driver/CompilerCli.vuna:891"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered", ("Vuna.Compiler.Driver.CompilerCli.printRecovered", "Vuna/Compiler/Driver/CompilerCli.vuna:902"));
  ("v_Vuna_dCompiler_dFrontend_dCst_drowList", ("Vuna.Compiler.Frontend.Cst.rowList", "Vuna/Compiler/Frontend/Cst.vuna:72"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dbyteOffset", ("Vuna.Compiler.Frontend.Cst.byteOffset", "Vuna/Compiler/Frontend/Cst.vuna:77"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dbyteOffsetGo", ("Vuna.Compiler.Frontend.Cst.byteOffsetGo", "Vuna/Compiler/Frontend/Cst.vuna:81"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dposAtOffset", ("Vuna.Compiler.Frontend.Cst.posAtOffset", "Vuna/Compiler/Frontend/Cst.vuna:88"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dposAtGo", ("Vuna.Compiler.Frontend.Cst.posAtGo", "Vuna/Compiler/Frontend/Cst.vuna:92"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dspanOfRange", ("Vuna.Compiler.Frontend.Cst.spanOfRange", "Vuna/Compiler/Frontend/Cst.vuna:100"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dspanOfToken", ("Vuna.Compiler.Frontend.Cst.spanOfToken", "Vuna/Compiler/Frontend/Cst.vuna:109"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dsegmentChars", ("Vuna.Compiler.Frontend.Cst.segmentChars", "Vuna/Compiler/Frontend/Cst.vuna:119"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dgreedyDigits", ("Vuna.Compiler.Frontend.Cst.greedyDigits", "Vuna/Compiler/Frontend/Cst.vuna:124"));
  ("v_Vuna_dCompiler_dFrontend_dCst_drawStringText", ("Vuna.Compiler.Frontend.Cst.rawStringText", "Vuna/Compiler/Frontend/Cst.vuna:129"));
  ("v_Vuna_dCompiler_dFrontend_dCst_drawStringBody", ("Vuna.Compiler.Frontend.Cst.rawStringBody", "Vuna/Compiler/Frontend/Cst.vuna:134"));
  ("v_Vuna_dCompiler_dFrontend_dCst_drawStringEscape", ("Vuna.Compiler.Frontend.Cst.rawStringEscape", "Vuna/Compiler/Frontend/Cst.vuna:141"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtemplateText", ("Vuna.Compiler.Frontend.Cst.templateText", "Vuna/Compiler/Frontend/Cst.vuna:147"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtokTag", ("Vuna.Compiler.Frontend.Cst.tokTag", "Vuna/Compiler/Frontend/Cst.vuna:154"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtokSourceText", ("Vuna.Compiler.Frontend.Cst.tokSourceText", "Vuna/Compiler/Frontend/Cst.vuna:166"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtoTrivComment", ("Vuna.Compiler.Frontend.Cst.toTrivComment", "Vuna/Compiler/Frontend/Cst.vuna:190"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dspaceTrivia", ("Vuna.Compiler.Frontend.Cst.spaceTrivia", "Vuna/Compiler/Frontend/Cst.vuna:196"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dcommentTriviaKind", ("Vuna.Compiler.Frontend.Cst.commentTriviaKind", "Vuna/Compiler/Frontend/Cst.vuna:202"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dcommentTrivia", ("Vuna.Compiler.Frontend.Cst.commentTrivia", "Vuna/Compiler/Frontend/Cst.vuna:208"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dgapTrivia", ("Vuna.Compiler.Frontend.Cst.gapTrivia", "Vuna/Compiler/Frontend/Cst.vuna:216"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtakeCommentsBefore", ("Vuna.Compiler.Frontend.Cst.takeCommentsBefore", "Vuna/Compiler/Frontend/Cst.vuna:223"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dcommentStartsAtOrAfter", ("Vuna.Compiler.Frontend.Cst.commentStartsAtOrAfter", "Vuna/Compiler/Frontend/Cst.vuna:232"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtokStartOffset", ("Vuna.Compiler.Frontend.Cst.tokStartOffset", "Vuna/Compiler/Frontend/Cst.vuna:239"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtokLimit", ("Vuna.Compiler.Frontend.Cst.tokLimit", "Vuna/Compiler/Frontend/Cst.vuna:243"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtokenNode", ("Vuna.Compiler.Frontend.Cst.tokenNode", "Vuna/Compiler/Frontend/Cst.vuna:249"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dbuildTokens", ("Vuna.Compiler.Frontend.Cst.buildTokens", "Vuna/Compiler/Frontend/Cst.vuna:260"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dlexCst", ("Vuna.Compiler.Frontend.Cst.lexCst", "Vuna/Compiler/Frontend/Cst.vuna:275"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtriviaTextOf", ("Vuna.Compiler.Frontend.Cst.triviaTextOf", "Vuna/Compiler/Frontend/Cst.vuna:287"));
  ("v_Vuna_dCompiler_dFrontend_dCst_drenderParts", ("Vuna.Compiler.Frontend.Cst.renderParts", "Vuna/Compiler/Frontend/Cst.vuna:291"));
  ("v_Vuna_dCompiler_dFrontend_dCst_drenderCst", ("Vuna.Compiler.Frontend.Cst.renderCst", "Vuna/Compiler/Frontend/Cst.vuna:295"));
  ("v_Vuna_dCompiler_dFrontend_dCst_droundtripOk", ("Vuna.Compiler.Frontend.Cst.roundtripOk", "Vuna/Compiler/Frontend/Cst.vuna:299"));
  ("v_main", ("main", "app/Main.vuna:16"));
]
let rec dt_frame_key parts =
  match parts with
  | [] -> None
  | part :: rest -> if part = "(fun)" then dt_frame_key rest else Some part
let dt_frame_label slot =
  match Printexc.Slot.name slot with
  | None -> None
  | Some nm ->
    match dt_frame_key (List.rev (String.split_on_char '.' nm)) with
    | None -> None
    | Some key ->
      (match List.assoc_opt key dt_def_locs with
       | Some (display, loc) -> Some (display ^ " (" ^ loc ^ ")")
       | None -> None)
let dt_report_exn e bt =
  let msg = match e with Effect.Unhandled (Perform (key, name, _)) -> Printf.sprintf "unhandled effect %s (instance %s)" key name | Failure m -> m | _ -> Printexc.to_string e in
  Printf.eprintf "vuna: runtime error: %s\n%!" msg;
  match Printexc.backtrace_slots bt with
  | None -> ()
  | Some slots ->
    let rec go rest shown =
      if shown >= 12 then ()
      else match rest with
      | [] -> ()
      | slot :: tl ->
        (match dt_frame_label slot with
         | Some s -> Printf.eprintf "  at %s\n%!" s; go tl (shown + 1)
         | None -> go tl shown)
    in go (Array.to_list slots) 0
let dtp_debug_on_lazy = lazy (
  let has f = Array.exists (fun a -> a = f) Sys.argv in
  has "--debug-perf" || (try Sys.getenv "VUNA_DEBUG_PERF" = "1" with Not_found -> false))
let dtp_debug_on (_ : int) = Lazy.force dtp_debug_on_lazy
let dtp_debug_line (s : string) =
  Printf.eprintf "DEBUG %d %s
%!" (dtp_timeUs ()) s;
  0
