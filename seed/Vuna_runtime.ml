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
let bi_lt_str (a : string) (b : string) = a < b
let bi_le_str (a : string) (b : string) = a <= b
let bi_gt_str (a : string) (b : string) = a > b
let bi_ge_str (a : string) (b : string) = a >= b
let bi_lt_bool (a : bool) (b : bool) = compare a b < 0
let bi_le_bool (a : bool) (b : bool) = compare a b <= 0
let bi_gt_bool (a : bool) (b : bool) = compare a b > 0
let bi_ge_bool (a : bool) (b : bool) = compare a b >= 0
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
type _ Effect.t += Perform : int * int * string * string * Obj.t -> Obj.t Effect.t

(* 派发 id：与编译器 dispatchIdOf 及 native / wasm runtime 同一公式
   （FNV-1a 32 位，最后取低 30 位），三端对同一路由串必须得到同一个数。 *)
let dtp_effectId (s : string) : int =
  let h = ref 2166136261 in
  for i = 0 to String.length s - 1 do
    h := ((!h lxor Char.code (String.unsafe_get s i)) * 16777619) land 0xFFFFFFFF
  done;
  !h land 0x3FFFFFFF

(* bracket 的 abort cleanup 登记表（每纤程一份，LIFO）。
   `prim_effectHandleId` 在安装 handler 时记下当前深度 mark；handler 正常返回 /
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
  (* 预算 = 进入时的待跑条数：每轮 pop 一条必然递减，不需要魔法上限。 *)
  let pending = List.length !r - mark in
  if pending <= 0 then () else go pending
let dtp_cleanup_run_all_for (fid : int) =
  let r = dtp_cleanup_stack_of fid in
  let rec go fuel =
    if fuel <= 0 then ()
    else match !r with
      | [] -> ()
      | f :: rest -> r := rest; (try f () with _ -> ()); go (fuel - 1)
  in
  go (List.length !r)
let dtp_cleanup_forget (fid : int) = Hashtbl.remove dtp_cleanup_stacks fid
let dtp_cleanup_reset () =
  Hashtbl.reset dtp_cleanup_stacks;
  dtp_cleanup_fiber := -1

(* handler 的运行时壳：与旧内联实现等价，但 handler 退出时清掉其 extent 内残留的
   bracket cleanup（abort = 续延被丢弃，库层 finally 不会再跑）。 *)
(* 当前 handler 的 self 栈（每个 Domain 一份）：opH 执行期间把
   (keyId,nameId,key,name,ret,h) 压栈，`prim_effectSelf` 用它把子计算重新装进同一个 handler。 *)
let dtp_selfK = Domain.DLS.new_key (fun () -> ref ([] : (int * int * string * string * Obj.t * Obj.t) list))
let dtp_effect_run key name kid nid ret h th =
  let mark = dtp_cleanup_mark () in
  let run_cleanups () = dtp_cleanup_run_to mark in
  (* 外层 Obj.magic 与旧内联实现一致：effc 的 continue 返回 Obj.t，去掉它会让
     handler 的 answer 类型被钉成 Obj.t。 *)
  Obj.magic
    (match Effect.Deep.match_with th ()
      { retc = (fun x -> (Obj.magic ret) x);
        exnc = (fun e -> raise e);
        effc = (fun (type a) (eff : a Effect.t) -> match eff with
          | Perform (k, n, kk, nn, payload) when k = kid && n = nid ->
            Some (fun (cont : (a, Obj.t) Effect.Deep.continuation) ->
              let st = Domain.DLS.get dtp_selfK in
              let saved = !st in
              st := (kid, nid, key, name, Obj.repr ret, Obj.repr h) :: saved;
              Fun.protect
                ~finally:(fun () -> st := saved)
                (fun () ->
                  (Obj.magic h) payload (fun v -> Effect.Deep.continue cont (Obj.repr v))))
          | _ -> None) }
    with
    | r -> run_cleanups (); r
    | exception e -> run_cleanups (); raise e)
let dtp_effect_handle_id key name kid nid ret h th =
  fun u -> dtp_effect_run key name kid nid ret h (fun () -> (Obj.magic th) u)
let dtp_effect_self th =
  match !(Domain.DLS.get dtp_selfK) with
  | (kid, nid, key, name, ret, h) :: _ -> dtp_effect_run key name kid nid ret h (fun () -> (Obj.magic th) 0)
  | [] -> failwith "self outside handler"
let dtp_print s =
  (try print_string s; flush stdout; String.length s
   with _ -> 0)  (* 写失败（典型 EPIPE：`vuna … | head`）不再是宿主崩溃；输出到此为止 *)
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
(* 宿主失败通道：try 变体不抛宿主异常，而是把失败码写进**当前 Domain** 的状态槽，
   返回默认值；base 的宿主 handler 随后读 status 转成 typed error。0 = 成功。
   用 Domain.DLS 而不是全局 ref：异步任务会在别的 Domain 上跑。 *)
let dtp_hostStatusK = Domain.DLS.new_key (fun () -> ref 0)
let dtp_hostSetStatus c = (Domain.DLS.get dtp_hostStatusK) := c
let dtp_hostStatus () = !(Domain.DLS.get dtp_hostStatusK)
let dtp_hostCode (e : exn) : int =
  match e with
  | Unix.Unix_error (Unix.ENOENT, _, _) -> 1
  | Unix.Unix_error ((Unix.EACCES | Unix.EPERM), _, _) -> 2
  | Unix.Unix_error (Unix.ENOSPC, _, _) -> 3
  | Unix.Unix_error (Unix.ENOTDIR, _, _) -> 4
  | Unix.Unix_error (Unix.EISDIR, _, _) -> 5
  | Unix.Unix_error (Unix.EEXIST, _, _) -> 6
  | _ -> 9
(* `Sys_error` 不带 errno；先 `Unix.stat` 一次拿到具体原因，再退回通用码。 *)
let dtp_hostCodeAt path (e : exn) : int =
  try ignore (Unix.stat path); dtp_hostCode e
  with e2 -> dtp_hostCode e2
let dtp_hostFail code = dtp_hostSetStatus (if code = 0 then 9 else code)
let dtp_hostReset () = dtp_hostSetStatus 0
let dtp_hostMark code e =
  ignore e;
  dtp_hostSetStatus (if code = 0 then 9 else code)
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
let dtp_readLine () =
  (try dtp_hostReset (); input_line stdin
   with End_of_file -> dtp_hostSetStatus 1; "")
let dtp_readBytes n =
  if n <= 0 then (dtp_hostSetStatus 1; "")
  else
    let b = Bytes.create n in
    let k = (try dtp_hostReset (); input stdin b 0 n with _ -> 0) in
    if k <= 0 then (dtp_hostSetStatus 1; "") else Bytes.sub_string b 0 k
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
  (try dtp_hostReset (); int_of_float (Unix.stat path).Unix.st_mtime
   with e -> dtp_hostMark (dtp_hostCode e) e; 0)
let dtp_fileSize path =
  (try dtp_hostReset (); (Unix.stat path).Unix.st_size
   with e -> dtp_hostMark (dtp_hostCode e) e; 0)
let dtp_tryReadFile path =
  (try
     dtp_hostReset ();
     let fd = Unix.openfile path [Unix.O_RDONLY] 0 in
     Fun.protect ~finally:(fun () -> (try Unix.close fd with _ -> ()))
       (fun () ->
          let buf = Buffer.create 65536 in
          let tmp = Bytes.create 65536 in
          let rec go () =
            let n = Unix.read fd tmp 0 (Bytes.length tmp) in
            if n > 0 then (Buffer.add_subbytes buf tmp 0 n; go ()) in
          go (); Buffer.contents buf)
   with e -> dtp_hostMark (dtp_hostCode e) e; "")
let dtp_tryWriteFile path contents =
  (try
     dtp_hostReset ();
     let fd = Unix.openfile path [Unix.O_WRONLY; Unix.O_CREAT; Unix.O_TRUNC] 0o666 in
     Fun.protect ~finally:(fun () -> (try Unix.close fd with _ -> ()))
       (fun () ->
          let b = Bytes.of_string contents in
          let n = Bytes.length b in
          let rec go off =
            if off < n then
              let k = Unix.write fd b off (n - off) in
              if k > 0 then go (off + k) in
          go 0);
     String.length contents
   with e -> dtp_hostMark (dtp_hostCode e) e; 0)
let dtp_tryWriteFileAtomic path contents =
  let tmp = path ^ "." ^ string_of_int (Unix.getpid ()) ^ ".tmp" in
  (try
     dtp_hostReset ();
     (let fd = Unix.openfile tmp [Unix.O_WRONLY; Unix.O_CREAT; Unix.O_TRUNC] 0o666 in
      Fun.protect ~finally:(fun () -> (try Unix.close fd with _ -> ()))
        (fun () ->
           let b = Bytes.of_string contents in
           let n = Bytes.length b in
           let rec go off =
             if off < n then
               let k = Unix.write fd b off (n - off) in
               if k > 0 then go (off + k) in
           go 0));
     Unix.rename tmp path;
     String.length contents
   with e -> (try Unix.unlink tmp with _ -> ()); dtp_hostFail (dtp_hostCode e); 0)
let dtp_tryReadDir path =
  (try dtp_hostReset (); List.sort compare (Array.to_list (Sys.readdir path))
   with e -> dtp_hostFail (dtp_hostCodeAt path e); [])
let dtp_tryIsDirectory path =
  (try dtp_hostReset (); (Unix.stat path).Unix.st_kind = Unix.S_DIR
   with e -> dtp_hostMark (dtp_hostCode e) e; false)
let dtp_tryMakeDir path =
  (try
     dtp_hostReset ();
     (try Unix.mkdir path 0o755 with Unix.Unix_error (Unix.EEXIST, _, _) -> ());
     0
   with e -> dtp_hostMark (dtp_hostCode e) e; 1)
let dtp_tryRemoveFile path =
  (try
     dtp_hostReset ();
     (try Unix.unlink path with Unix.Unix_error (Unix.ENOENT, _, _) -> ());
     0
   with e -> dtp_hostMark (dtp_hostCode e) e; 1)
let dtp_tryRemoveTree path =
  let rec go p =
    try
      let st = Unix.lstat p in
      (match st.Unix.st_kind with
       | Unix.S_DIR ->
           Array.iter (fun e -> go (Filename.concat p e)) (Sys.readdir p);
           Unix.rmdir p
       | _ -> Unix.unlink p)
    with Unix.Unix_error (Unix.ENOENT, _, _) -> () in
  (try dtp_hostReset (); go path; 0
   with e -> dtp_hostMark (dtp_hostCode e) e; 1)
let dtp_tryRename src dst =
  (try dtp_hostReset (); Unix.rename src dst; 0
   with e -> dtp_hostMark (dtp_hostCode e) e; 1)
let dtp_trySymlink target link =
  (try dtp_hostReset (); Unix.symlink target link; 0
   with e -> dtp_hostMark (dtp_hostCode e) e; 1)
let dtp_tryMakeDirExclusive path =
  (try dtp_hostReset (); Unix.mkdir path 0o755; 0
   with e -> dtp_hostMark (dtp_hostCode e) e; 1)
let dtp_isTty () = Unix.isatty Unix.stdout
let dtp_tryRunIn dir args =
  let cmd = String.concat " " (List.map Filename.quote args) in
  (try
     dtp_hostReset ();
     let old = Sys.getcwd () in
     Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)
   with e -> dtp_hostFail (dtp_hostCodeAt dir e); -1)
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
  | None -> dtp_hostSetStatus 8; failwith "net: invalid handle"
let dtp_net_drop (h : int) = (try Hashtbl.remove dtp_net_tbl h with _ -> ())
let dtp_netCodeOf (ue : Unix.error) : int =
  match ue with
  | Unix.ECONNREFUSED | Unix.ENOENT -> 2
  | Unix.ETIMEDOUT -> 3
  | Unix.EPIPE | Unix.ECONNRESET -> 4
  | Unix.EADDRINUSE -> 5
  | _ -> 9
let dtp_net_error (what : string) (e : exn) : 'a =
  (match e with
   | Unix.Unix_error (ue, _, _) -> dtp_hostSetStatus (dtp_netCodeOf ue)
   | _ -> dtp_hostSetStatus 9);
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
let dtp_netStatus (e : exn) : int =
  match e with
  | Unix.Unix_error (ue, _, _) -> dtp_netCodeOf ue
  | _ -> 6
let dtp_netMarkStatus (e : exn) =
  let c = dtp_hostStatus () in
  dtp_hostMark (if c = 0 then dtp_netStatus e else c) e
let dtp_try_net_listen addr =
  (try dtp_hostReset (); dtp_net_listen addr
   with e -> dtp_netMarkStatus e; -1)
let dtp_try_net_port h =
  (try dtp_hostReset (); dtp_net_port h
   with e -> dtp_netMarkStatus e; -1)
let dtp_try_net_accept h =
  (try dtp_hostReset (); dtp_net_accept h
   with e -> dtp_netMarkStatus e; -1)
let dtp_try_net_send h s =
  (try dtp_hostReset (); dtp_net_send h s
   with e -> dtp_netMarkStatus e; 0)
let dtp_try_net_recv h n =
  if n <= 0 then (dtp_hostSetStatus 1; "")
  else
    let b = Bytes.create n in
    (try
       let k = Unix.read (dtp_net_get h) b 0 n in
       if k <= 0 then (dtp_hostSetStatus 1; "")
       else (dtp_hostReset (); Bytes.sub_string b 0 k)
     with e -> dtp_netMarkStatus e; "")
let dtp_try_net_close h =
  (try dtp_hostReset (); dtp_net_close h
   with e -> dtp_netMarkStatus e; 0)
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
let dtp_try_net_connect addr =
  (try dtp_hostReset (); dtp_net_connect addr
   with e -> dtp_netMarkStatus e; -1)
let dtp_try_net_accept_within h micros =
  (try
     dtp_hostReset ();
     let lfd = dtp_net_get h in
     let (r, _, _) = Unix.select [lfd] [] [] (float_of_int micros /. 1000000.0) in
     if r = [] then (dtp_hostSetStatus 7; -1)
     else let (fd, _) = Unix.accept lfd in dtp_net_put fd
   with e -> dtp_netMarkStatus e; -1)
let dtp_try_net_recv_within h n micros =
  if n <= 0 then (dtp_hostReset (); dtp_hostSetStatus 1; "")
  else
    (try
       dtp_hostReset ();
       let fd = dtp_net_get h in
       let b = Bytes.create n in
       let (r, _, _) = Unix.select [fd] [] [] (float_of_int micros /. 1000000.0) in
       if r = [] then (dtp_hostSetStatus 7; "")
       else
         let k = Unix.read fd b 0 n in
         if k <= 0 then (dtp_hostSetStatus 1; "") else Bytes.sub_string b 0 k
     with e -> dtp_netMarkStatus e; "")
let dtp_try_net_send_within h s micros =
  (try
     dtp_hostReset ();
     let fd = dtp_net_get h in
     let n = String.length s in
     let secs = float_of_int micros /. 1000000.0 in
     let rec go off =
       if off >= n then true
       else
         let (_, w, _) = Unix.select [] [fd] [] secs in
         if w = [] then false
         else
           let k = Unix.write_substring fd s off (n - off) in
           if k <= 0 then false else go (off + k) in
     if go 0 then n else (dtp_hostSetStatus 7; 0)
   with e -> dtp_netMarkStatus e; 0)
(* ------------------------------------------------------------------ *)
(* Single-threaded cooperative fiber scheduler.                        *)
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
  | Effect.Unhandled (Perform (_, _, key, name, _)) ->
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
  ("B_dContainer_dArray.v_fromList", ("Base.Container.Array.fromList", "Base/Container/Array.vuna:12"));
  ("B_dContainer_dArray.v_get", ("Base.Container.Array.get", "Base/Container/Array.vuna:24"));
  ("B_dContainer_dArray.v_length", ("Base.Container.Array.length", "Base/Container/Array.vuna:20"));
  ("B_dContainer_dArray.v_make", ("Base.Container.Array.make", "Base/Container/Array.vuna:32"));
  ("B_dContainer_dArray.v_set", ("Base.Container.Array.set", "Base/Container/Array.vuna:28"));
  ("B_dContainer_dArray.v_toList", ("Base.Container.Array.toList", "Base/Container/Array.vuna:16"));
  ("B_dContainer_dHashMap.v__ubucketOf", ("Base.Container.HashMap._bucketOf", "Base/Container/HashMap.vuna:26"));
  ("B_dContainer_dHashMap.v__udedupBucket", ("Base.Container.HashMap._dedupBucket", "Base/Container/HashMap.vuna:49"));
  ("B_dContainer_dHashMap.v__udedupGo", ("Base.Container.HashMap._dedupGo", "Base/Container/HashMap.vuna:43"));
  ("B_dContainer_dHashMap.v__uhasKeyIn", ("Base.Container.HashMap._hasKeyIn", "Base/Container/HashMap.vuna:38"));
  ("B_dContainer_dHashMap.v__ulookupAssoc", ("Base.Container.HashMap._lookupAssoc", "Base/Container/HashMap.vuna:33"));
  ("B_dContainer_dHashMap.v_fromList", ("Base.Container.HashMap.fromList", "Base/Container/HashMap.vuna:97"));
  ("B_dContainer_dHashMap.v_insert", ("Base.Container.HashMap.insert", "Base/Container/HashMap.vuna:54"));
  ("B_dContainer_dHashMap.v_insertAll", ("Base.Container.HashMap.insertAll", "Base/Container/HashMap.vuna:92"));
  ("B_dContainer_dHashMap.v_lookup", ("Base.Container.HashMap.lookup", "Base/Container/HashMap.vuna:72"));
  ("B_dContainer_dHashMap.v_member", ("Base.Container.HashMap.member", "Base/Container/HashMap.vuna:85"));
  ("B_dContainer_dHashMap.v_ofNames", ("Base.Container.HashMap.ofNames", "Base/Container/HashMap.vuna:102"));
  ("B_dContainer_dHashMap.v_size", ("Base.Container.HashMap.size", "Base/Container/HashMap.vuna:113"));
  ("B_dContainer_dHashMap.v_toList", ("Base.Container.HashMap.toList", "Base/Container/HashMap.vuna:106"));
  ("B_dData_dBase64.v_at", ("Base.Data.Base64.at", "Base/Data/Base64.vuna:60"));
  ("B_dData_dBase64.v_base64Decode", ("Base.Data.Base64.base64Decode", "Base/Data/Base64.vuna:26"));
  ("B_dData_dBase64.v_base64Encode", ("Base.Data.Base64.base64Encode", "Base/Data/Base64.vuna:18"));
  ("B_dData_dBase64.v_base64EncodeString", ("Base.Data.Base64.base64EncodeString", "Base/Data/Base64.vuna:22"));
  ("B_dData_dBase64.v_decodeDigit", ("Base.Data.Base64.decodeDigit", "Base/Data/Base64.vuna:94"));
  ("B_dData_dBase64.v_decodeGroup", ("Base.Data.Base64.decodeGroup", "Base/Data/Base64.vuna:105"));
  ("B_dData_dBase64.v_encodeDigit", ("Base.Data.Base64.encodeDigit", "Base/Data/Base64.vuna:85"));
  ("B_dData_dBase64.v_encodeGroup", ("Base.Data.Base64.encodeGroup", "Base/Data/Base64.vuna:71"));
  ("B_dData_dBase64.v_groups", ("Base.Data.Base64.groups", "Base/Data/Base64.vuna:52"));
  ("B_dData_dBase64.v_listLen", ("Base.Data.Base64.listLen", "Base/Data/Base64.vuna:56"));
  ("B_dData_dBase64.v_paddingCount", ("Base.Data.Base64.paddingCount", "Base/Data/Base64.vuna:45"));
  ("B_dData_dBase64.v_sequenceMaybe", ("Base.Data.Base64.sequenceMaybe", "Base/Data/Base64.vuna:114"));
  ("B_dData_dBase64.v_step", ("Base.Data.Base64.step", "Base/Data/Base64.vuna:121"));
  ("B_dData_dBase64.v_zeroBytes", ("Base.Data.Base64.zeroBytes", "Base/Data/Base64.vuna:67"));
  ("B_dData_dBits.v_add32", ("Base.Data.Bits.add32", "Base/Data/Bits.vuna:49"));
  ("B_dData_dBits.v_band", ("Base.Data.Bits.band", "Base/Data/Bits.vuna:8"));
  ("B_dData_dBits.v_bnot", ("Base.Data.Bits.bnot", "Base/Data/Bits.vuna:20"));
  ("B_dData_dBits.v_bor", ("Base.Data.Bits.bor", "Base/Data/Bits.vuna:12"));
  ("B_dData_dBits.v_bxor", ("Base.Data.Bits.bxor", "Base/Data/Bits.vuna:16"));
  ("B_dData_dBits.v_mask32", ("Base.Data.Bits.mask32", "Base/Data/Bits.vuna:32"));
  ("B_dData_dBits.v_mask8", ("Base.Data.Bits.mask8", "Base/Data/Bits.vuna:36"));
  ("B_dData_dBits.v_rol32", ("Base.Data.Bits.rol32", "Base/Data/Bits.vuna:61"));
  ("B_dData_dBits.v_rotr32", ("Base.Data.Bits.rotr32", "Base/Data/Bits.vuna:53"));
  ("B_dData_dBits.v_shl", ("Base.Data.Bits.shl", "Base/Data/Bits.vuna:24"));
  ("B_dData_dBits.v_shl32", ("Base.Data.Bits.shl32", "Base/Data/Bits.vuna:41"));
  ("B_dData_dBits.v_shr", ("Base.Data.Bits.shr", "Base/Data/Bits.vuna:28"));
  ("B_dData_dBits.v_shr32", ("Base.Data.Bits.shr32", "Base/Data/Bits.vuna:45"));
  ("B_dData_dBool.v_and", ("Base.Data.Bool.and", "Base/Data/Bool.vuna:24"));
  ("B_dData_dBool.v_bool", ("Base.Data.Bool.bool", "Base/Data/Bool.vuna:39"));
  ("B_dData_dBool.v_not", ("Base.Data.Bool.not", "Base/Data/Bool.vuna:19"));
  ("B_dData_dBool.v_or", ("Base.Data.Bool.or", "Base/Data/Bool.vuna:29"));
  ("B_dData_dBool.v_xor", ("Base.Data.Bool.xor", "Base/Data/Bool.vuna:34"));
  ("B_dData_dFloat.v_abs", ("Base.Data.Float.abs", "Base/Data/Float.vuna:51"));
  ("B_dData_dFloat.v_carryRev", ("Base.Data.Float.carryRev", "Base/Data/Float.vuna:88"));
  ("B_dData_dFloat.v_digStep", ("Base.Data.Float.digStep", "Base/Data/Float.vuna:79"));
  ("B_dData_dFloat.v_digitsText", ("Base.Data.Float.digitsText", "Base/Data/Float.vuna:116"));
  ("B_dData_dFloat.v_dsLen", ("Base.Data.Float.dsLen", "Base/Data/Float.vuna:111"));
  ("B_dData_dFloat.v_expForm", ("Base.Data.Float.expForm", "Base/Data/Float.vuna:132"));
  ("B_dData_dFloat.v_expSuffix", ("Base.Data.Float.expSuffix", "Base/Data/Float.vuna:124"));
  ("B_dData_dFloat.v_fixedForm", ("Base.Data.Float.fixedForm", "Base/Data/Float.vuna:140"));
  ("B_dData_dFloat.v_floatRender", ("Base.Data.Float.floatRender", "Base/Data/Float.vuna:151"));
  ("B_dData_dFloat.v_floatToInt", ("Base.Data.Float.floatToInt", "Base/Data/Float.vuna:63"));
  ("B_dData_dFloat.v_fromFloat", ("Base.Data.Float.fromFloat", "Base/Data/Float.vuna:19"));
  ("B_dData_dFloat.v_intToFloat", ("Base.Data.Float.intToFloat", "Base/Data/Float.vuna:59"));
  ("B_dData_dFloat.v_normStep", ("Base.Data.Float.normStep", "Base/Data/Float.vuna:71"));
  ("B_dData_dFloat.v_sqrt", ("Base.Data.Float.sqrt", "Base/Data/Float.vuna:55"));
  ("B_dData_dFloat.v_trimZeros", ("Base.Data.Float.trimZeros", "Base/Data/Float.vuna:104"));
  ("B_dData_dFloat.v_trimZerosRev", ("Base.Data.Float.trimZerosRev", "Base/Data/Float.vuna:99"));
  ("B_dData_dFloat.v_zerosText", ("Base.Data.Float.zerosText", "Base/Data/Float.vuna:120"));
  ("B_dData_dFunction.v__x124__x62_", ("Base.Data.Function.|>", "Base/Data/Function.vuna:29"));
  ("B_dData_dFunction.v__x36_", ("Base.Data.Function.$", "Base/Data/Function.vuna:25"));
  ("B_dData_dFunction.v_compose", ("Base.Data.Function.compose", "Base/Data/Function.vuna:21"));
  ("B_dData_dFunction.v_const", ("Base.Data.Function.const", "Base/Data/Function.vuna:13"));
  ("B_dData_dFunction.v_flip", ("Base.Data.Function.flip", "Base/Data/Function.vuna:17"));
  ("B_dData_dFunction.v_id", ("Base.Data.Function.id", "Base/Data/Function.vuna:9"));
  ("B_dData_dList.v_allMem", ("Base.Data.List.allMem", "Base/Data/List.vuna:108"));
  ("B_dData_dList.v_anyMem", ("Base.Data.List.anyMem", "Base/Data/List.vuna:113"));
  ("B_dData_dList.v_append", ("Base.Data.List.append", "Base/Data/List.vuna:32"));
  ("B_dData_dList.v_concatMap", ("Base.Data.List.concatMap", "Base/Data/List.vuna:77"));
  ("B_dData_dList.v_concatMapGo", ("Base.Data.List.concatMapGo", "Base/Data/List.vuna:81"));
  ("B_dData_dList.v_drop", ("Base.Data.List.drop", "Base/Data/List.vuna:133"));
  ("B_dData_dList.v_filter", ("Base.Data.List.filter", "Base/Data/List.vuna:61"));
  ("B_dData_dList.v_firstJust", ("Base.Data.List.firstJust", "Base/Data/List.vuna:155"));
  ("B_dData_dList.v_firstSuccess", ("Base.Data.List.firstSuccess", "Base/Data/List.vuna:164"));
  ("B_dData_dList.v_foldl", ("Base.Data.List.foldl", "Base/Data/List.vuna:66"));
  ("B_dData_dList.v_foldr", ("Base.Data.List.foldr", "Base/Data/List.vuna:71"));
  ("B_dData_dList.v_hasDupNames", ("Base.Data.List.hasDupNames", "Base/Data/List.vuna:118"));
  ("B_dData_dList.v_length", ("Base.Data.List.length", "Base/Data/List.vuna:47"));
  ("B_dData_dList.v_lengthInt", ("Base.Data.List.lengthInt", "Base/Data/List.vuna:51"));
  ("B_dData_dList.v_lookupPair", ("Base.Data.List.lookupPair", "Base/Data/List.vuna:96"));
  ("B_dData_dList.v_map", ("Base.Data.List.map", "Base/Data/List.vuna:56"));
  ("B_dData_dList.v_mapMaybe", ("Base.Data.List.mapMaybe", "Base/Data/List.vuna:147"));
  ("B_dData_dList.v_mem", ("Base.Data.List.mem", "Base/Data/List.vuna:86"));
  ("B_dData_dList.v_memName", ("Base.Data.List.memName", "Base/Data/List.vuna:91"));
  ("B_dData_dList.v_nubNames", ("Base.Data.List.nubNames", "Base/Data/List.vuna:103"));
  ("B_dData_dList.v_range", ("Base.Data.List.range", "Base/Data/List.vuna:139"));
  ("B_dData_dList.v_rangeFrom", ("Base.Data.List.rangeFrom", "Base/Data/List.vuna:143"));
  ("B_dData_dList.v_reverse", ("Base.Data.List.reverse", "Base/Data/List.vuna:42"));
  ("B_dData_dList.v_reverseOnto", ("Base.Data.List.reverseOnto", "Base/Data/List.vuna:37"));
  ("B_dData_dList.v_showElems", ("Base.Data.List.showElems", "Base/Data/List.vuna:186"));
  ("B_dData_dList.v_showElemsTail", ("Base.Data.List.showElemsTail", "Base/Data/List.vuna:191"));
  ("B_dData_dList.v_take", ("Base.Data.List.take", "Base/Data/List.vuna:128"));
  ("B_dData_dList.v_zip", ("Base.Data.List.zip", "Base/Data/List.vuna:123"));
  ("B_dData_dMaybe.v_fromMaybe", ("Base.Data.Maybe.fromMaybe", "Base/Data/Maybe.vuna:24"));
  ("B_dData_dMaybe.v_isJust", ("Base.Data.Maybe.isJust", "Base/Data/Maybe.vuna:29"));
  ("B_dData_dMaybe.v_isNothing", ("Base.Data.Maybe.isNothing", "Base/Data/Maybe.vuna:34"));
  ("B_dData_dMaybe.v_maybe", ("Base.Data.Maybe.maybe", "Base/Data/Maybe.vuna:39"));
  ("B_dData_dNat.v_fromInt", ("Base.Data.Nat.fromInt", "Base/Data/Nat.vuna:40"));
  ("B_dData_dNat.v_fromIntMaybe", ("Base.Data.Nat.fromIntMaybe", "Base/Data/Nat.vuna:44"));
  ("B_dData_dNat.v_isZero", ("Base.Data.Nat.isZero", "Base/Data/Nat.vuna:52"));
  ("B_dData_dNat.v_minus", ("Base.Data.Nat.minus", "Base/Data/Nat.vuna:28"));
  ("B_dData_dNat.v_mult", ("Base.Data.Nat.mult", "Base/Data/Nat.vuna:32"));
  ("B_dData_dNat.v_plus", ("Base.Data.Nat.plus", "Base/Data/Nat.vuna:24"));
  ("B_dData_dNat.v_pred", ("Base.Data.Nat.pred", "Base/Data/Nat.vuna:48"));
  ("B_dData_dNat.v_toInt", ("Base.Data.Nat.toInt", "Base/Data/Nat.vuna:36"));
  ("B_dData_dObs.v_obsCounter", ("Base.Data.Obs.obsCounter", "Base/Data/Obs.vuna:40"));
  ("B_dData_dObs.v_obsLevel", ("Base.Data.Obs.obsLevel", "Base/Data/Obs.vuna:25"));
  ("B_dData_dObs.v_obsLog", ("Base.Data.Obs.obsLog", "Base/Data/Obs.vuna:36"));
  ("B_dData_dObs.v_obsMark", ("Base.Data.Obs.obsMark", "Base/Data/Obs.vuna:44"));
  ("B_dData_dObs.v_obsOn", ("Base.Data.Obs.obsOn", "Base/Data/Obs.vuna:29"));
  ("B_dData_dObs.v_obsSampleStart", ("Base.Data.Obs.obsSampleStart", "Base/Data/Obs.vuna:60"));
  ("B_dData_dObs.v_obsSampleStop", ("Base.Data.Obs.obsSampleStop", "Base/Data/Obs.vuna:64"));
  ("B_dData_dObs.v_obsSpanBegin", ("Base.Data.Obs.obsSpanBegin", "Base/Data/Obs.vuna:49"));
  ("B_dData_dObs.v_obsSpanEnd", ("Base.Data.Obs.obsSpanEnd", "Base/Data/Obs.vuna:53"));
  ("B_dData_dObs_dSpan.v_obsSample", ("Base.Data.Obs.Span.obsSample", "Base/Data/Obs/Span.vuna:34"));
  ("B_dData_dObs_dSpan.v_obsSpan", ("Base.Data.Obs.Span.obsSpan", "Base/Data/Obs/Span.vuna:17"));
  ("B_dData_dObs_dSpan.v_obsSpanEff", ("Base.Data.Obs.Span.obsSpanEff", "Base/Data/Obs/Span.vuna:26"));
  ("B_dData_dObs_dSpan.v_obsSpanP", ("Base.Data.Obs.Span.obsSpanP", "Base/Data/Obs/Span.vuna:21"));
  ("B_dData_dPair.v_firstOf", ("Base.Data.Pair.firstOf", "Base/Data/Pair.vuna:19"));
  ("B_dData_dPair.v_secondOf", ("Base.Data.Pair.secondOf", "Base/Data/Pair.vuna:23"));
  ("B_dData_dResult.v_mapError", ("Base.Data.Result.mapError", "Base/Data/Result.vuna:65"));
  ("B_dData_dResult.v_step", ("Base.Data.Result.step", "Base/Data/Result.vuna:60"));
  ("B_dData_dResult.v_traverse", ("Base.Data.Result.traverse", "Base/Data/Result.vuna:48"));
  ("B_dData_dResult.v_withDefault", ("Base.Data.Result.withDefault", "Base/Data/Result.vuna:70"));
  ("B_dData_dSha1.v_bigEndian32", ("Base.Data.Sha1.bigEndian32", "Base/Data/Sha1.vuna:53"));
  ("B_dData_dSha1.v_bigEndian64", ("Base.Data.Sha1.bigEndian64", "Base/Data/Sha1.vuna:45"));
  ("B_dData_dSha1.v_compressBlock", ("Base.Data.Sha1.compressBlock", "Base/Data/Sha1.vuna:57"));
  ("B_dData_dSha1.v_expand", ("Base.Data.Sha1.expand", "Base/Data/Sha1.vuna:82"));
  ("B_dData_dSha1.v_expandStep", ("Base.Data.Sha1.expandStep", "Base/Data/Sha1.vuna:86"));
  ("B_dData_dSha1.v_headAfter", ("Base.Data.Sha1.headAfter", "Base/Data/Sha1.vuna:94"));
  ("B_dData_dSha1.v_hexByte", ("Base.Data.Sha1.hexByte", "Base/Data/Sha1.vuna:136"));
  ("B_dData_dSha1.v_hexDigit", ("Base.Data.Sha1.hexDigit", "Base/Data/Sha1.vuna:140"));
  ("B_dData_dSha1.v_pack4", ("Base.Data.Sha1.pack4", "Base/Data/Sha1.vuna:75"));
  ("B_dData_dSha1.v_padMessage", ("Base.Data.Sha1.padMessage", "Base/Data/Sha1.vuna:33"));
  ("B_dData_dSha1.v_roundF", ("Base.Data.Sha1.roundF", "Base/Data/Sha1.vuna:116"));
  ("B_dData_dSha1.v_roundK", ("Base.Data.Sha1.roundK", "Base/Data/Sha1.vuna:125"));
  ("B_dData_dSha1.v_sha1", ("Base.Data.Sha1.sha1", "Base/Data/Sha1.vuna:16"));
  ("B_dData_dSha1.v_sha1Init", ("Base.Data.Sha1.sha1Init", "Base/Data/Sha1.vuna:29"));
  ("B_dData_dSha1.v_sha1Raw", ("Base.Data.Sha1.sha1Raw", "Base/Data/Sha1.vuna:20"));
  ("B_dData_dSha1.v_sha1Round", ("Base.Data.Sha1.sha1Round", "Base/Data/Sha1.vuna:101"));
  ("B_dData_dSha1.v_wordsOf", ("Base.Data.Sha1.wordsOf", "Base/Data/Sha1.vuna:71"));
  ("B_dData_dSha1.v_wordsToBytes", ("Base.Data.Sha1.wordsToBytes", "Base/Data/Sha1.vuna:132"));
  ("B_dData_dSha1.v_zeroBytes", ("Base.Data.Sha1.zeroBytes", "Base/Data/Sha1.vuna:41"));
  ("B_dData_dSort.v_insertBy", ("Base.Data.Sort.insertBy", "Base/Data/Sort.vuna:11"));
  ("B_dData_dSort.v_mergeSort", ("Base.Data.Sort.mergeSort", "Base/Data/Sort.vuna:21"));
  ("B_dData_dSort.v_sortBy", ("Base.Data.Sort.sortBy", "Base/Data/Sort.vuna:16"));
  ("B_dData_dString.v__ucontainsChars", ("Base.Data.String._containsChars", "Base/Data/String.vuna:142"));
  ("B_dData_dString.v__udropSpace", ("Base.Data.String._dropSpace", "Base/Data/String.vuna:129"));
  ("B_dData_dString.v__uinterleave", ("Base.Data.String._interleave", "Base/Data/String.vuna:59"));
  ("B_dData_dString.v__uisSpace", ("Base.Data.String._isSpace", "Base/Data/String.vuna:125"));
  ("B_dData_dString.v__ustartsWithChars", ("Base.Data.String._startsWithChars", "Base/Data/String.vuna:134"));
  ("B_dData_dString.v_byteLength", ("Base.Data.String.byteLength", "Base/Data/String.vuna:21"));
  ("B_dData_dString.v_contains", ("Base.Data.String.contains", "Base/Data/String.vuna:86"));
  ("B_dData_dString.v_endsWith", ("Base.Data.String.endsWith", "Base/Data/String.vuna:97"));
  ("B_dData_dString.v_join", ("Base.Data.String.join", "Base/Data/String.vuna:55"));
  ("B_dData_dString.v_lines", ("Base.Data.String.lines", "Base/Data/String.vuna:65"));
  ("B_dData_dString.v_repeat", ("Base.Data.String.repeat", "Base/Data/String.vuna:117"));
  ("B_dData_dString.v_sameBytes", ("Base.Data.String.sameBytes", "Base/Data/String.vuna:105"));
  ("B_dData_dString.v_skipSep", ("Base.Data.String.skipSep", "Base/Data/String.vuna:44"));
  ("B_dData_dString.v_split", ("Base.Data.String.split", "Base/Data/String.vuna:25"));
  ("B_dData_dString.v_splitAcc", ("Base.Data.String.splitAcc", "Base/Data/String.vuna:33"));
  ("B_dData_dString.v_startsWith", ("Base.Data.String.startsWith", "Base/Data/String.vuna:90"));
  ("B_dData_dString.v_substring", ("Base.Data.String.substring", "Base/Data/String.vuna:121"));
  ("B_dData_dString.v_trim", ("Base.Data.String.trim", "Base/Data/String.vuna:82"));
  ("B_dData_dString.v_trimLeft", ("Base.Data.String.trimLeft", "Base/Data/String.vuna:74"));
  ("B_dData_dString.v_trimRight", ("Base.Data.String.trimRight", "Base/Data/String.vuna:78"));
  ("B_dData_dString.v_unlines", ("Base.Data.String.unlines", "Base/Data/String.vuna:69"));
  ("B_dData_dVec.v_substTemplate", ("Base.Data.Vec.substTemplate", "Base/Data/Vec.vuna:44"));
  ("B_dData_dVec.v_vecToList", ("Base.Data.Vec.vecToList", "Base/Data/Vec.vuna:48"));
  ("B_dData_dVec.v_vhead", ("Base.Data.Vec.vhead", "Base/Data/Vec.vuna:20"));
  ("B_dData_dVec.v_vlen", ("Base.Data.Vec.vlen", "Base/Data/Vec.vuna:32"));
  ("B_dData_dVec.v_vtail", ("Base.Data.Vec.vtail", "Base/Data/Vec.vuna:26"));
  ("B_dEffect_dArgs.v_argsGetArgs", ("Base.Effect.Args.argsGetArgs", "Base/Effect/Args.vuna:15"));
  ("B_dEffect_dArgs.v_argsOpHIO", ("Base.Effect.Args.argsOpHIO", "Base/Effect/Args.vuna:23"));
  ("B_dEffect_dArgs.v_argsOpHIOHost", ("Base.Effect.Args.argsOpHIOHost", "Base/Effect/Args.vuna:35"));
  ("B_dEffect_dArgs.v_handleArgs", ("Base.Effect.Args.handleArgs", "Base/Effect/Args.vuna:19"));
  ("B_dEffect_dArgs.v_handleArgsHostHost", ("Base.Effect.Args.handleArgsHostHost", "Base/Effect/Args.vuna:44"));
  ("B_dEffect_dArgs.v_runArgsHost", ("Base.Effect.Args.runArgsHost", "Base/Effect/Args.vuna:48"));
  ("B_dEffect_dClock.v_clockNow", ("Base.Effect.Clock.clockNow", "Base/Effect/Clock.vuna:18"));
  ("B_dEffect_dClock.v_clockOpHIO", ("Base.Effect.Clock.clockOpHIO", "Base/Effect/Clock.vuna:30"));
  ("B_dEffect_dClock.v_clockOpHIOHost", ("Base.Effect.Clock.clockOpHIOHost", "Base/Effect/Clock.vuna:46"));
  ("B_dEffect_dClock.v_clockSleepMicros", ("Base.Effect.Clock.clockSleepMicros", "Base/Effect/Clock.vuna:22"));
  ("B_dEffect_dClock.v_handleClock", ("Base.Effect.Clock.handleClock", "Base/Effect/Clock.vuna:26"));
  ("B_dEffect_dClock.v_handleClockHostHost", ("Base.Effect.Clock.handleClockHostHost", "Base/Effect/Clock.vuna:59"));
  ("B_dEffect_dClock.v_runClockHost", ("Base.Effect.Clock.runClockHost", "Base/Effect/Clock.vuna:64"));
  ("B_dEffect_dConsole.v_consoleEprint", ("Base.Effect.Console.consoleEprint", "Base/Effect/Console.vuna:25"));
  ("B_dEffect_dConsole.v_consoleOpHIO", ("Base.Effect.Console.consoleOpHIO", "Base/Effect/Console.vuna:33"));
  ("B_dEffect_dConsole.v_consoleOpHIOHost", ("Base.Effect.Console.consoleOpHIOHost", "Base/Effect/Console.vuna:49"));
  ("B_dEffect_dConsole.v_consolePrint", ("Base.Effect.Console.consolePrint", "Base/Effect/Console.vuna:21"));
  ("B_dEffect_dConsole.v_handleConsole", ("Base.Effect.Console.handleConsole", "Base/Effect/Console.vuna:29"));
  ("B_dEffect_dConsole.v_handleConsoleHostHost", ("Base.Effect.Console.handleConsoleHostHost", "Base/Effect/Console.vuna:56"));
  ("B_dEffect_dConsole.v_runConsoleHost", ("Base.Effect.Console.runConsoleHost", "Base/Effect/Console.vuna:61"));
  ("B_dEffect_dCore.v_Obj", ("Base.Effect.Core.Obj", "Base/Effect/Core.vuna:279"));
  ("B_dEffect_dCore.v_ObjTy", ("Base.Effect.Core.ObjTy", "Base/Effect/Core.vuna:371"));
  ("B_dEffect_dCore.v_bracket", ("Base.Effect.Core.bracket", "Base/Effect/Core.vuna:357"));
  ("B_dEffect_dCore.v_cleanupRun", ("Base.Effect.Core.cleanupRun", "Base/Effect/Core.vuna:754"));
  ("B_dEffect_dCore.v_contAdapter", ("Base.Effect.Core.contAdapter", "Base/Effect/Core.vuna:302"));
  ("B_dEffect_dCore.v_ctxKRest", ("Base.Effect.Core.ctxKRest", "Base/Effect/Core.vuna:480"));
  ("B_dEffect_dCore.v_ctxPrev", ("Base.Effect.Core.ctxPrev", "Base/Effect/Core.vuna:485"));
  ("B_dEffect_dCore.v_ctxPrompt", ("Base.Effect.Core.ctxPrompt", "Base/Effect/Core.vuna:475"));
  ("B_dEffect_dCore.v_ctxSlot", ("Base.Effect.Core.ctxSlot", "Base/Effect/Core.vuna:490"));
  ("B_dEffect_dCore.v_defaultInstance", ("Base.Effect.Core.defaultInstance", "Base/Effect/Core.vuna:58"));
  ("B_dEffect_dCore.v_depth", ("Base.Effect.Core.depth", "Base/Effect/Core.vuna:560"));
  ("B_dEffect_dCore.v_dropCleanups", ("Base.Effect.Core.dropCleanups", "Base/Effect/Core.vuna:760"));
  ("B_dEffect_dCore.v_effPrim", ("Base.Effect.Core.effPrim", "Base/Effect/Core.vuna:110"));
  ("B_dEffect_dCore.v_emptySt", ("Base.Effect.Core.emptySt", "Base/Effect/Core.vuna:427"));
  ("B_dEffect_dCore.v_finally", ("Base.Effect.Core.finally", "Base/Effect/Core.vuna:368"));
  ("B_dEffect_dCore.v_findFrame", ("Base.Effect.Core.findFrame", "Base/Effect/Core.vuna:587"));
  ("B_dEffect_dCore.v_finish", ("Base.Effect.Core.finish", "Base/Effect/Core.vuna:746"));
  ("B_dEffect_dCore.v_frameCleanDepth", ("Base.Effect.Core.frameCleanDepth", "Base/Effect/Core.vuna:465"));
  ("B_dEffect_dCore.v_frameComp", ("Base.Effect.Core.frameComp", "Base/Effect/Core.vuna:450"));
  ("B_dEffect_dCore.v_frameIdOf", ("Base.Effect.Core.frameIdOf", "Base/Effect/Core.vuna:470"));
  ("B_dEffect_dCore.v_frameKOuter", ("Base.Effect.Core.frameKOuter", "Base/Effect/Core.vuna:455"));
  ("B_dEffect_dCore.v_frameKey", ("Base.Effect.Core.frameKey", "Base/Effect/Core.vuna:430"));
  ("B_dEffect_dCore.v_frameName", ("Base.Effect.Core.frameName", "Base/Effect/Core.vuna:435"));
  ("B_dEffect_dCore.v_frameOpH", ("Base.Effect.Core.frameOpH", "Base/Effect/Core.vuna:445"));
  ("B_dEffect_dCore.v_framePrev", ("Base.Effect.Core.framePrev", "Base/Effect/Core.vuna:460"));
  ("B_dEffect_dCore.v_frameRet", ("Base.Effect.Core.frameRet", "Base/Effect/Core.vuna:440"));
  ("B_dEffect_dCore.v_fromObj", ("Base.Effect.Core.fromObj", "Base/Effect/Core.vuna:287"));
  ("B_dEffect_dCore.v_handleCore", ("Base.Effect.Core.handleCore", "Base/Effect/Core.vuna:245"));
  ("B_dEffect_dCore.v_handleCoreAt", ("Base.Effect.Core.handleCoreAt", "Base/Effect/Core.vuna:259"));
  ("B_dEffect_dCore.v_handleCoreAtId", ("Base.Effect.Core.handleCoreAtId", "Base/Effect/Core.vuna:264"));
  ("B_dEffect_dCore.v_handleCoreId", ("Base.Effect.Core.handleCoreId", "Base/Effect/Core.vuna:250"));
  ("B_dEffect_dCore.v_handleCoreLin", ("Base.Effect.Core.handleCoreLin", "Base/Effect/Core.vuna:306"));
  ("B_dEffect_dCore.v_handleCoreLinId", ("Base.Effect.Core.handleCoreLinId", "Base/Effect/Core.vuna:311"));
  ("B_dEffect_dCore.v_handleScoped", ("Base.Effect.Core.handleScoped", "Base/Effect/Core.vuna:146"));
  ("B_dEffect_dCore.v_handleSelf", ("Base.Effect.Core.handleSelf", "Base/Effect/Core.vuna:150"));
  ("B_dEffect_dCore.v_handleWith", ("Base.Effect.Core.handleWith", "Base/Effect/Core.vuna:321"));
  ("B_dEffect_dCore.v_handleWithAt", ("Base.Effect.Core.handleWithAt", "Base/Effect/Core.vuna:331"));
  ("B_dEffect_dCore.v_handleWithAtId", ("Base.Effect.Core.handleWithAtId", "Base/Effect/Core.vuna:336"));
  ("B_dEffect_dCore.v_handleWithId", ("Base.Effect.Core.handleWithId", "Base/Effect/Core.vuna:325"));
  ("B_dEffect_dCore.v_inChain", ("Base.Effect.Core.inChain", "Base/Effect/Core.vuna:569"));
  ("B_dEffect_dCore.v_joinEff", ("Base.Effect.Core.joinEff", "Base/Effect/Core.vuna:161"));
  ("B_dEffect_dCore.v_joinEffNilOuter", ("Base.Effect.Core.joinEffNilOuter", "Base/Effect/Core.vuna:174"));
  ("B_dEffect_dCore.v_machineRun", ("Base.Effect.Core.machineRun", "Base/Effect/Core.vuna:775"));
  ("B_dEffect_dCore.v_machineScoped", ("Base.Effect.Core.machineScoped", "Base/Effect/Core.vuna:600"));
  ("B_dEffect_dCore.v_markUsed", ("Base.Effect.Core.markUsed", "Base/Effect/Core.vuna:523"));
  ("B_dEffect_dCore.v_markUsedSmall", ("Base.Effect.Core.markUsedSmall", "Base/Effect/Core.vuna:535"));
  ("B_dEffect_dCore.v_mkCont", ("Base.Effect.Core.mkCont", "Base/Effect/Core.vuna:345"));
  ("B_dEffect_dCore.v_performCore", ("Base.Effect.Core.performCore", "Base/Effect/Core.vuna:237"));
  ("B_dEffect_dCore.v_performCoreId", ("Base.Effect.Core.performCoreId", "Base/Effect/Core.vuna:241"));
  ("B_dEffect_dCore.v_popCleanup", ("Base.Effect.Core.popCleanup", "Base/Effect/Core.vuna:354"));
  ("B_dEffect_dCore.v_prependFree", ("Base.Effect.Core.prependFree", "Base/Effect/Core.vuna:554"));
  ("B_dEffect_dCore.v_pushCleanup", ("Base.Effect.Core.pushCleanup", "Base/Effect/Core.vuna:351"));
  ("B_dEffect_dCore.v_raise", ("Base.Effect.Core.raise", "Base/Effect/Core.vuna:195"));
  ("B_dEffect_dCore.v_raiseTo", ("Base.Effect.Core.raiseTo", "Base/Effect/Core.vuna:200"));
  ("B_dEffect_dCore.v_reinstall", ("Base.Effect.Core.reinstall", "Base/Effect/Core.vuna:579"));
  ("B_dEffect_dCore.v_reinstallIfMissing", ("Base.Effect.Core.reinstallIfMissing", "Base/Effect/Core.vuna:584"));
  ("B_dEffect_dCore.v_removeFrame", ("Base.Effect.Core.removeFrame", "Base/Effect/Core.vuna:732"));
  ("B_dEffect_dCore.v_resIdx", ("Base.Effect.Core.resIdx", "Base/Effect/Core.vuna:229"));
  ("B_dEffect_dCore.v_resumeCont", ("Base.Effect.Core.resumeCont", "Base/Effect/Core.vuna:296"));
  ("B_dEffect_dCore.v_rowAppend", ("Base.Effect.Core.rowAppend", "Base/Effect/Core.vuna:53"));
  ("B_dEffect_dCore.v_rowRem", ("Base.Effect.Core.rowRem", "Base/Effect/Core.vuna:50"));
  ("B_dEffect_dCore.v_runEff", ("Base.Effect.Core.runEff", "Base/Effect/Core.vuna:130"));
  ("B_dEffect_dCore.v_runGo", ("Base.Effect.Core.runGo", "Base/Effect/Core.vuna:624"));
  ("B_dEffect_dCore.v_runMain", ("Base.Effect.Core.runMain", "Base/Effect/Core.vuna:155"));
  ("B_dEffect_dCore.v_runPure", ("Base.Effect.Core.runPure", "Base/Effect/Core.vuna:126"));
  ("B_dEffect_dCore.v_runThunk", ("Base.Effect.Core.runThunk", "Base/Effect/Core.vuna:120"));
  ("B_dEffect_dCore.v_samePrompt", ("Base.Effect.Core.samePrompt", "Base/Effect/Core.vuna:557"));
  ("B_dEffect_dCore.v_scope", ("Base.Effect.Core.scope", "Base/Effect/Core.vuna:140"));
  ("B_dEffect_dCore.v_sendCore", ("Base.Effect.Core.sendCore", "Base/Effect/Core.vuna:209"));
  ("B_dEffect_dCore.v_sendCoreId", ("Base.Effect.Core.sendCoreId", "Base/Effect/Core.vuna:213"));
  ("B_dEffect_dCore.v_sigFn", ("Base.Effect.Core.sigFn", "Base/Effect/Core.vuna:223"));
  ("B_dEffect_dCore.v_sigOf", ("Base.Effect.Core.sigOf", "Base/Effect/Core.vuna:233"));
  ("B_dEffect_dCore.v_step", ("Base.Effect.Core.step", "Base/Effect/Core.vuna:635"));
  ("B_dEffect_dCore.v_tailSlot", ("Base.Effect.Core.tailSlot", "Base/Effect/Core.vuna:519"));
  ("B_dEffect_dCore.v_toObj", ("Base.Effect.Core.toObj", "Base/Effect/Core.vuna:283"));
  ("B_dEffect_dCore.v_unwind", ("Base.Effect.Core.unwind", "Base/Effect/Core.vuna:718"));
  ("B_dEffect_dCore.v_usedEpoch", ("Base.Effect.Core.usedEpoch", "Base/Effect/Core.vuna:497"));
  ("B_dEffect_dCore.v_usedEpochSmall", ("Base.Effect.Core.usedEpochSmall", "Base/Effect/Core.vuna:509"));
  ("B_dEffect_dCore.v_usedLen", ("Base.Effect.Core.usedLen", "Base/Effect/Core.vuna:544"));
  ("B_dEffect_dCore.v_usedSmallLimit", ("Base.Effect.Core.usedSmallLimit", "Base/Effect/Core.vuna:411"));
  ("B_dEffect_dCore.v_weaken", ("Base.Effect.Core.weaken", "Base/Effect/Core.vuna:114"));
  ("B_dEffect_dCore.v_weakenRow", ("Base.Effect.Core.weakenRow", "Base/Effect/Core.vuna:186"));
  ("B_dEffect_dEnv.v_envExecPath", ("Base.Effect.Env.envExecPath", "Base/Effect/Env.vuna:39"));
  ("B_dEffect_dEnv.v_envGetCwd", ("Base.Effect.Env.envGetCwd", "Base/Effect/Env.vuna:35"));
  ("B_dEffect_dEnv.v_envGetEnv", ("Base.Effect.Env.envGetEnv", "Base/Effect/Env.vuna:23"));
  ("B_dEffect_dEnv.v_envGetEnvNonEmpty", ("Base.Effect.Env.envGetEnvNonEmpty", "Base/Effect/Env.vuna:28"));
  ("B_dEffect_dEnv.v_envOpHIO", ("Base.Effect.Env.envOpHIO", "Base/Effect/Env.vuna:47"));
  ("B_dEffect_dEnv.v_envOpHIOHost", ("Base.Effect.Env.envOpHIOHost", "Base/Effect/Env.vuna:67"));
  ("B_dEffect_dEnv.v_handleEnv", ("Base.Effect.Env.handleEnv", "Base/Effect/Env.vuna:43"));
  ("B_dEffect_dEnv.v_handleEnvHostHost", ("Base.Effect.Env.handleEnvHostHost", "Base/Effect/Env.vuna:84"));
  ("B_dEffect_dEnv.v_runEnvHost", ("Base.Effect.Env.runEnvHost", "Base/Effect/Env.vuna:88"));
  ("B_dEffect_dError.v_catch", ("Base.Effect.Error.catch", "Base/Effect/Error.vuna:44"));
  ("B_dEffect_dError.v_catchResult", ("Base.Effect.Error.catchResult", "Base/Effect/Error.vuna:33"));
  ("B_dEffect_dError.v_errorOpH", ("Base.Effect.Error.errorOpH", "Base/Effect/Error.vuna:27"));
  ("B_dEffect_dError.v_errorRet", ("Base.Effect.Error.errorRet", "Base/Effect/Error.vuna:23"));
  ("B_dEffect_dError.v_handleError", ("Base.Effect.Error.handleError", "Base/Effect/Error.vuna:19"));
  ("B_dEffect_dError.v_runError", ("Base.Effect.Error.runError", "Base/Effect/Error.vuna:40"));
  ("B_dEffect_dError.v_throw", ("Base.Effect.Error.throw", "Base/Effect/Error.vuna:15"));
  ("B_dEffect_dExit.v_exitOpHIO", ("Base.Effect.Exit.exitOpHIO", "Base/Effect/Exit.vuna:22"));
  ("B_dEffect_dExit.v_exitOpHIOHost", ("Base.Effect.Exit.exitOpHIOHost", "Base/Effect/Exit.vuna:34"));
  ("B_dEffect_dExit.v_exitWith", ("Base.Effect.Exit.exitWith", "Base/Effect/Exit.vuna:14"));
  ("B_dEffect_dExit.v_handleExit", ("Base.Effect.Exit.handleExit", "Base/Effect/Exit.vuna:18"));
  ("B_dEffect_dExit.v_handleExitHostHost", ("Base.Effect.Exit.handleExitHostHost", "Base/Effect/Exit.vuna:43"));
  ("B_dEffect_dExit.v_runExitHost", ("Base.Effect.Exit.runExitHost", "Base/Effect/Exit.vuna:47"));
  ("B_dEffect_dExn.v_bracketExn", ("Base.Effect.Exn.bracketExn", "Base/Effect/Exn.vuna:52"));
  ("B_dEffect_dExn.v_catchExn", ("Base.Effect.Exn.catchExn", "Base/Effect/Exn.vuna:43"));
  ("B_dEffect_dExn.v_exnOpH", ("Base.Effect.Exn.exnOpH", "Base/Effect/Exn.vuna:32"));
  ("B_dEffect_dExn.v_handleExn", ("Base.Effect.Exn.handleExn", "Base/Effect/Exn.vuna:28"));
  ("B_dEffect_dExn.v_runExn", ("Base.Effect.Exn.runExn", "Base/Effect/Exn.vuna:39"));
  ("B_dEffect_dExn.v_throwExn", ("Base.Effect.Exn.throwExn", "Base/Effect/Exn.vuna:20"));
  ("B_dEffect_dExn.v_tryWith", ("Base.Effect.Exn.tryWith", "Base/Effect/Exn.vuna:24"));
  ("B_dEffect_dFs.v_fsErrorOfCode", ("Base.Effect.Fs.fsErrorOfCode", "Base/Effect/Fs.vuna:84"));
  ("B_dEffect_dFs.v_fsErrorOpHR", ("Base.Effect.Fs.fsErrorOpHR", "Base/Effect/Fs.vuna:290"));
  ("B_dEffect_dFs.v_fsErrorRet", ("Base.Effect.Fs.fsErrorRet", "Base/Effect/Fs.vuna:286"));
  ("B_dEffect_dFs.v_fsErrorText", ("Base.Effect.Fs.fsErrorText", "Base/Effect/Fs.vuna:94"));
  ("B_dEffect_dFs.v_fsFail", ("Base.Effect.Fs.fsFail", "Base/Effect/Fs.vuna:80"));
  ("B_dEffect_dFs.v_fsFailAt", ("Base.Effect.Fs.fsFailAt", "Base/Effect/Fs.vuna:195"));
  ("B_dEffect_dFs.v_fsFileExists", ("Base.Effect.Fs.fsFileExists", "Base/Effect/Fs.vuna:156"));
  ("B_dEffect_dFs.v_fsFileMtime", ("Base.Effect.Fs.fsFileMtime", "Base/Effect/Fs.vuna:160"));
  ("B_dEffect_dFs.v_fsFileSize", ("Base.Effect.Fs.fsFileSize", "Base/Effect/Fs.vuna:164"));
  ("B_dEffect_dFs.v_fsHostStatus", ("Base.Effect.Fs.fsHostStatus", "Base/Effect/Fs.vuna:191"));
  ("B_dEffect_dFs.v_fsIsDirectory", ("Base.Effect.Fs.fsIsDirectory", "Base/Effect/Fs.vuna:138"));
  ("B_dEffect_dFs.v_fsMakeDir", ("Base.Effect.Fs.fsMakeDir", "Base/Effect/Fs.vuna:144"));
  ("B_dEffect_dFs.v_fsMakeDirExclusive", ("Base.Effect.Fs.fsMakeDirExclusive", "Base/Effect/Fs.vuna:180"));
  ("B_dEffect_dFs.v_fsOpHIOHost", ("Base.Effect.Fs.fsOpHIOHost", "Base/Effect/Fs.vuna:199"));
  ("B_dEffect_dFs.v_fsReadDir", ("Base.Effect.Fs.fsReadDir", "Base/Effect/Fs.vuna:132"));
  ("B_dEffect_dFs.v_fsReadFile", ("Base.Effect.Fs.fsReadFile", "Base/Effect/Fs.vuna:114"));
  ("B_dEffect_dFs.v_fsRemoveFile", ("Base.Effect.Fs.fsRemoveFile", "Base/Effect/Fs.vuna:150"));
  ("B_dEffect_dFs.v_fsRemoveTree", ("Base.Effect.Fs.fsRemoveTree", "Base/Effect/Fs.vuna:168"));
  ("B_dEffect_dFs.v_fsRename", ("Base.Effect.Fs.fsRename", "Base/Effect/Fs.vuna:172"));
  ("B_dEffect_dFs.v_fsSymlink", ("Base.Effect.Fs.fsSymlink", "Base/Effect/Fs.vuna:176"));
  ("B_dEffect_dFs.v_fsWriteFile", ("Base.Effect.Fs.fsWriteFile", "Base/Effect/Fs.vuna:120"));
  ("B_dEffect_dFs.v_fsWriteFileAtomic", ("Base.Effect.Fs.fsWriteFileAtomic", "Base/Effect/Fs.vuna:126"));
  ("B_dEffect_dFs.v_handleFs", ("Base.Effect.Fs.handleFs", "Base/Effect/Fs.vuna:184"));
  ("B_dEffect_dFs.v_handleFsHostHost", ("Base.Effect.Fs.handleFsHostHost", "Base/Effect/Fs.vuna:278"));
  ("B_dEffect_dFs.v_isDotEntry", ("Base.Effect.Fs.isDotEntry", "Base/Effect/Fs.vuna:107"));
  ("B_dEffect_dFs.v_runFsError", ("Base.Effect.Fs.runFsError", "Base/Effect/Fs.vuna:296"));
  ("B_dEffect_dFs.v_runFsErrorHost", ("Base.Effect.Fs.runFsErrorHost", "Base/Effect/Fs.vuna:300"));
  ("B_dEffect_dFs.v_runFsHost", ("Base.Effect.Fs.runFsHost", "Base/Effect/Fs.vuna:282"));
  ("B_dEffect_dFs.v_sortEntries", ("Base.Effect.Fs.sortEntries", "Base/Effect/Fs.vuna:110"));
  ("B_dEffect_dNet.v_handleContext", ("Base.Effect.Net.handleContext", "Base/Effect/Net.vuna:169"));
  ("B_dEffect_dNet.v_handleNet", ("Base.Effect.Net.handleNet", "Base/Effect/Net.vuna:161"));
  ("B_dEffect_dNet.v_handleNetHostHost", ("Base.Effect.Net.handleNetHostHost", "Base/Effect/Net.vuna:247"));
  ("B_dEffect_dNet.v_netAccept", ("Base.Effect.Net.netAccept", "Base/Effect/Net.vuna:66"));
  ("B_dEffect_dNet.v_netAcceptWithin", ("Base.Effect.Net.netAcceptWithin", "Base/Effect/Net.vuna:96"));
  ("B_dEffect_dNet.v_netClose", ("Base.Effect.Net.netClose", "Base/Effect/Net.vuna:84"));
  ("B_dEffect_dNet.v_netConnect", ("Base.Effect.Net.netConnect", "Base/Effect/Net.vuna:90"));
  ("B_dEffect_dNet.v_netErrorOfCode", ("Base.Effect.Net.netErrorOfCode", "Base/Effect/Net.vuna:140"));
  ("B_dEffect_dNet.v_netErrorOpHR", ("Base.Effect.Net.netErrorOpHR", "Base/Effect/Net.vuna:259"));
  ("B_dEffect_dNet.v_netErrorRet", ("Base.Effect.Net.netErrorRet", "Base/Effect/Net.vuna:255"));
  ("B_dEffect_dNet.v_netErrorText", ("Base.Effect.Net.netErrorText", "Base/Effect/Net.vuna:151"));
  ("B_dEffect_dNet.v_netFail", ("Base.Effect.Net.netFail", "Base/Effect/Net.vuna:136"));
  ("B_dEffect_dNet.v_netHostStatus", ("Base.Effect.Net.netHostStatus", "Base/Effect/Net.vuna:165"));
  ("B_dEffect_dNet.v_netListen", ("Base.Effect.Net.netListen", "Base/Effect/Net.vuna:54"));
  ("B_dEffect_dNet.v_netOpHIOHost", ("Base.Effect.Net.netOpHIOHost", "Base/Effect/Net.vuna:173"));
  ("B_dEffect_dNet.v_netPort", ("Base.Effect.Net.netPort", "Base/Effect/Net.vuna:60"));
  ("B_dEffect_dNet.v_netRecv", ("Base.Effect.Net.netRecv", "Base/Effect/Net.vuna:72"));
  ("B_dEffect_dNet.v_netRecvWithin", ("Base.Effect.Net.netRecvWithin", "Base/Effect/Net.vuna:102"));
  ("B_dEffect_dNet.v_netSend", ("Base.Effect.Net.netSend", "Base/Effect/Net.vuna:78"));
  ("B_dEffect_dNet.v_netSendWithin", ("Base.Effect.Net.netSendWithin", "Base/Effect/Net.vuna:108"));
  ("B_dEffect_dNet.v_runNetError", ("Base.Effect.Net.runNetError", "Base/Effect/Net.vuna:265"));
  ("B_dEffect_dNet.v_runNetErrorHost", ("Base.Effect.Net.runNetErrorHost", "Base/Effect/Net.vuna:269"));
  ("B_dEffect_dNet.v_runNetHost", ("Base.Effect.Net.runNetHost", "Base/Effect/Net.vuna:251"));
  ("B_dEffect_dProcess.v_handleProcess", ("Base.Effect.Process.handleProcess", "Base/Effect/Process.vuna:82"));
  ("B_dEffect_dProcess.v_handleProcessHostWith", ("Base.Effect.Process.handleProcessHostWith", "Base/Effect/Process.vuna:108"));
  ("B_dEffect_dProcess.v_handleProcessHostWithHost", ("Base.Effect.Process.handleProcessHostWithHost", "Base/Effect/Process.vuna:143"));
  ("B_dEffect_dProcess.v_processArgs", ("Base.Effect.Process.processArgs", "Base/Effect/Process.vuna:28"));
  ("B_dEffect_dProcess.v_processErrorOfCode", ("Base.Effect.Process.processErrorOfCode", "Base/Effect/Process.vuna:70"));
  ("B_dEffect_dProcess.v_processErrorOpHR", ("Base.Effect.Process.processErrorOpHR", "Base/Effect/Process.vuna:156"));
  ("B_dEffect_dProcess.v_processErrorRet", ("Base.Effect.Process.processErrorRet", "Base/Effect/Process.vuna:152"));
  ("B_dEffect_dProcess.v_processErrorText", ("Base.Effect.Process.processErrorText", "Base/Effect/Process.vuna:76"));
  ("B_dEffect_dProcess.v_processExit", ("Base.Effect.Process.processExit", "Base/Effect/Process.vuna:32"));
  ("B_dEffect_dProcess.v_processFail", ("Base.Effect.Process.processFail", "Base/Effect/Process.vuna:66"));
  ("B_dEffect_dProcess.v_processHostStatus", ("Base.Effect.Process.processHostStatus", "Base/Effect/Process.vuna:116"));
  ("B_dEffect_dProcess.v_processOpHIOWith", ("Base.Effect.Process.processOpHIOWith", "Base/Effect/Process.vuna:86"));
  ("B_dEffect_dProcess.v_processOpHIOWithHost", ("Base.Effect.Process.processOpHIOWithHost", "Base/Effect/Process.vuna:120"));
  ("B_dEffect_dProcess.v_processRunIn", ("Base.Effect.Process.processRunIn", "Base/Effect/Process.vuna:36"));
  ("B_dEffect_dProcess.v_processSpawn", ("Base.Effect.Process.processSpawn", "Base/Effect/Process.vuna:42"));
  ("B_dEffect_dProcess.v_processWait", ("Base.Effect.Process.processWait", "Base/Effect/Process.vuna:48"));
  ("B_dEffect_dProcess.v_runProcessError", ("Base.Effect.Process.runProcessError", "Base/Effect/Process.vuna:162"));
  ("B_dEffect_dProcess.v_runProcessErrorHost", ("Base.Effect.Process.runProcessErrorHost", "Base/Effect/Process.vuna:167"));
  ("B_dEffect_dProcess.v_runProcessHost", ("Base.Effect.Process.runProcessHost", "Base/Effect/Process.vuna:148"));
  ("B_dEffect_dPure_dError.v_catchError", ("Base.Effect.Pure.Error.catchError", "Base/Effect/Pure/Error.vuna:51"));
  ("B_dEffect_dPure_dError.v_ok", ("Base.Effect.Pure.Error.ok", "Base/Effect/Pure/Error.vuna:26"));
  ("B_dEffect_dPure_dError.v_runError", ("Base.Effect.Pure.Error.runError", "Base/Effect/Pure/Error.vuna:17"));
  ("B_dEffect_dPure_dError.v_throwError", ("Base.Effect.Pure.Error.throwError", "Base/Effect/Pure/Error.vuna:22"));
  ("B_dEffect_dPure_dIORef.v_modifyRef", ("Base.Effect.Pure.IORef.modifyRef", "Base/Effect/Pure/IORef.vuna:23"));
  ("B_dEffect_dPure_dIORef.v_newRef", ("Base.Effect.Pure.IORef.newRef", "Base/Effect/Pure/IORef.vuna:11"));
  ("B_dEffect_dPure_dIORef.v_readRef", ("Base.Effect.Pure.IORef.readRef", "Base/Effect/Pure/IORef.vuna:15"));
  ("B_dEffect_dPure_dIORef.v_writeRef", ("Base.Effect.Pure.IORef.writeRef", "Base/Effect/Pure/IORef.vuna:19"));
  ("B_dEffect_dPure_dReader.v_ask", ("Base.Effect.Pure.Reader.ask", "Base/Effect/Pure/Reader.vuna:30"));
  ("B_dEffect_dPure_dReader.v_local", ("Base.Effect.Pure.Reader.local", "Base/Effect/Pure/Reader.vuna:34"));
  ("B_dEffect_dPure_dReader.v_runReader", ("Base.Effect.Pure.Reader.runReader", "Base/Effect/Pure/Reader.vuna:15"));
  ("B_dEffect_dPure_dState.v_evalState", ("Base.Effect.Pure.State.evalState", "Base/Effect/Pure/State.vuna:21"));
  ("B_dEffect_dPure_dState.v_execState", ("Base.Effect.Pure.State.execState", "Base/Effect/Pure/State.vuna:25"));
  ("B_dEffect_dPure_dState.v_get", ("Base.Effect.Pure.State.get", "Base/Effect/Pure/State.vuna:64"));
  ("B_dEffect_dPure_dState.v_modify", ("Base.Effect.Pure.State.modify", "Base/Effect/Pure/State.vuna:72"));
  ("B_dEffect_dPure_dState.v_put", ("Base.Effect.Pure.State.put", "Base/Effect/Pure/State.vuna:68"));
  ("B_dEffect_dPure_dState.v_runState", ("Base.Effect.Pure.State.runState", "Base/Effect/Pure/State.vuna:17"));
  ("B_dEffect_dReader.v_ask", ("Base.Effect.Reader.ask", "Base/Effect/Reader.vuna:17"));
  ("B_dEffect_dReader.v_handleReader", ("Base.Effect.Reader.handleReader", "Base/Effect/Reader.vuna:39"));
  ("B_dEffect_dReader.v_handleReaderLin", ("Base.Effect.Reader.handleReaderLin", "Base/Effect/Reader.vuna:43"));
  ("B_dEffect_dReader.v_local", ("Base.Effect.Reader.local", "Base/Effect/Reader.vuna:32"));
  ("B_dEffect_dReader.v_localWith", ("Base.Effect.Reader.localWith", "Base/Effect/Reader.vuna:27"));
  ("B_dEffect_dReader.v_readerLocalOp", ("Base.Effect.Reader.readerLocalOp", "Base/Effect/Reader.vuna:21"));
  ("B_dEffect_dRef.v_refNew", ("Base.Effect.Ref.refNew", "Base/Effect/Ref.vuna:16"));
  ("B_dEffect_dRef.v_refRead", ("Base.Effect.Ref.refRead", "Base/Effect/Ref.vuna:20"));
  ("B_dEffect_dRef.v_refWrite", ("Base.Effect.Ref.refWrite", "Base/Effect/Ref.vuna:24"));
  ("B_dEffect_dState.v_get", ("Base.Effect.State.get", "Base/Effect/State.vuna:18"));
  ("B_dEffect_dState.v_handleState", ("Base.Effect.State.handleState", "Base/Effect/State.vuna:26"));
  ("B_dEffect_dState.v_put", ("Base.Effect.State.put", "Base/Effect/State.vuna:22"));
  ("B_dEffect_dStdin.v_handleStdin", ("Base.Effect.Stdin.handleStdin", "Base/Effect/Stdin.vuna:30"));
  ("B_dEffect_dStdin.v_handleStdinHostHost", ("Base.Effect.Stdin.handleStdinHostHost", "Base/Effect/Stdin.vuna:67"));
  ("B_dEffect_dStdin.v_runStdinHost", ("Base.Effect.Stdin.runStdinHost", "Base/Effect/Stdin.vuna:72"));
  ("B_dEffect_dStdin.v_stdinOpHIO", ("Base.Effect.Stdin.stdinOpHIO", "Base/Effect/Stdin.vuna:34"));
  ("B_dEffect_dStdin.v_stdinOpHIOHost", ("Base.Effect.Stdin.stdinOpHIOHost", "Base/Effect/Stdin.vuna:52"));
  ("B_dEffect_dStdin.v_stdinReadBytes", ("Base.Effect.Stdin.stdinReadBytes", "Base/Effect/Stdin.vuna:26"));
  ("B_dEffect_dStdin.v_stdinReadLine", ("Base.Effect.Stdin.stdinReadLine", "Base/Effect/Stdin.vuna:22"));
  ("B_dTrait_dApplicative.v_ap", ("Base.Trait.Applicative.ap", "Base/Trait/Applicative.vuna:16"));
  ("B_dTrait_dApplicative.v_liftA2", ("Base.Trait.Applicative.liftA2", "Base/Trait/Applicative.vuna:18"));
  ("B_dTrait_dApplicative.v_pure", ("Base.Trait.Applicative.pure", "Base/Trait/Applicative.vuna:14"));
  ("B_dTrait_dEq.v__x47__x61_", ("Base.Trait.Eq./=", "Base/Trait/Eq.vuna:14"));
  ("B_dTrait_dEq.v__x61__x61_", ("Base.Trait.Eq.==", "Base/Trait/Eq.vuna:12"));
  ("B_dTrait_dFoldable.v_fold", ("Base.Trait.Foldable.fold", "Base/Trait/Foldable.vuna:13"));
  ("B_dTrait_dFoldable.v_foldMap", ("Base.Trait.Foldable.foldMap", "Base/Trait/Foldable.vuna:17"));
  ("B_dTrait_dFromInt.v_fromInt", ("Base.Trait.FromInt.fromInt", "Base/Trait/FromInt.vuna:11"));
  ("B_dTrait_dFromString.v_fromString", ("Base.Trait.FromString.fromString", "Base/Trait/FromString.vuna:11"));
  ("B_dTrait_dFunctor.v_fmap", ("Base.Trait.Functor.fmap", "Base/Trait/Functor.vuna:9"));
  ("B_dTrait_dHashable.v_hash", ("Base.Trait.Hashable.hash", "Base/Trait/Hashable.vuna:16"));
  ("B_dTrait_dHashable.v_hashCombine", ("Base.Trait.Hashable.hashCombine", "Base/Trait/Hashable.vuna:24"));
  ("B_dTrait_dHashable.v_hashStr", ("Base.Trait.Hashable.hashStr", "Base/Trait/Hashable.vuna:20"));
  ("B_dTrait_dInterp.v_interp", ("Base.Trait.Interp.interp", "Base/Trait/Interp.vuna:15"));
  ("B_dTrait_dMonad.v__x62__x62_", ("Base.Trait.Monad.>>", "Base/Trait/Monad.vuna:19"));
  ("B_dTrait_dMonad.v__x62__x62__x61_", ("Base.Trait.Monad.>>=", "Base/Trait/Monad.vuna:15"));
  ("B_dTrait_dMonoid.v_mappend", ("Base.Trait.Monoid.mappend", "Base/Trait/Monoid.vuna:11"));
  ("B_dTrait_dMonoid.v_mempty", ("Base.Trait.Monoid.mempty", "Base/Trait/Monoid.vuna:16"));
  ("B_dTrait_dNeg.v_negate", ("Base.Trait.Neg.negate", "Base/Trait/Neg.vuna:10"));
  ("B_dTrait_dNum.v__x42_", ("Base.Trait.Num.*", "Base/Trait/Num.vuna:15"));
  ("B_dTrait_dNum.v__x43_", ("Base.Trait.Num.+", "Base/Trait/Num.vuna:11"));
  ("B_dTrait_dNum.v__x45_", ("Base.Trait.Num.-", "Base/Trait/Num.vuna:13"));
  ("B_dTrait_dNum.v__x47_", ("Base.Trait.Num./", "Base/Trait/Num.vuna:17"));
  ("B_dTrait_dOrd.v__x60_", ("Base.Trait.Ord.<", "Base/Trait/Ord.vuna:17"));
  ("B_dTrait_dOrd.v__x60__x61_", ("Base.Trait.Ord.<=", "Base/Trait/Ord.vuna:19"));
  ("B_dTrait_dOrd.v__x62_", ("Base.Trait.Ord.>", "Base/Trait/Ord.vuna:21"));
  ("B_dTrait_dOrd.v__x62__x61_", ("Base.Trait.Ord.>=", "Base/Trait/Ord.vuna:23"));
  ("B_dTrait_dOrd.v_compare", ("Base.Trait.Ord.compare", "Base/Trait/Ord.vuna:79"));
  ("B_dTrait_dOrd.v_max", ("Base.Trait.Ord.max", "Base/Trait/Ord.vuna:87"));
  ("B_dTrait_dOrd.v_min", ("Base.Trait.Ord.min", "Base/Trait/Ord.vuna:83"));
  ("B_dTrait_dShow.v_dbgShow", ("Base.Trait.Show.dbgShow", "Base/Trait/Show.vuna:31"));
  ("B_dTrait_dShow.v_debugShow", ("Base.Trait.Show.debugShow", "Base/Trait/Show.vuna:21"));
  ("B_dTrait_dShow.v_show", ("Base.Trait.Show.show", "Base/Trait/Show.vuna:11"));
  ("B_dTrait_dTraversable.v_mapM", ("Base.Trait.Traversable.mapM", "Base/Trait/Traversable.vuna:13"));
  ("Base_dBytes.v_curAtEnd", ("Vuna.Compiler.Base.Bytes.curAtEnd", "Vuna/Compiler/Base/Bytes.vuna:52"));
  ("Base_dBytes.v_curChar", ("Vuna.Compiler.Base.Bytes.curChar", "Vuna/Compiler/Base/Bytes.vuna:56"));
  ("Base_dBytes.v_curOf", ("Vuna.Compiler.Base.Bytes.curOf", "Vuna/Compiler/Base/Bytes.vuna:48"));
  ("Base_dBytes.v_curSkip", ("Vuna.Compiler.Base.Bytes.curSkip", "Vuna/Compiler/Base/Bytes.vuna:60"));
  ("Base_dBytes.v_curSlice", ("Vuna.Compiler.Base.Bytes.curSlice", "Vuna/Compiler/Base/Bytes.vuna:64"));
  ("Base_dBytes.v_decBool", ("Vuna.Compiler.Base.Bytes.decBool", "Vuna/Compiler/Base/Bytes.vuna:159"));
  ("Base_dBytes.v_decInt", ("Vuna.Compiler.Base.Bytes.decInt", "Vuna/Compiler/Base/Bytes.vuna:146"));
  ("Base_dBytes.v_decItems", ("Vuna.Compiler.Base.Bytes.decItems", "Vuna/Compiler/Base/Bytes.vuna:193"));
  ("Base_dBytes.v_decList", ("Vuna.Compiler.Base.Bytes.decList", "Vuna/Compiler/Base/Bytes.vuna:183"));
  ("Base_dBytes.v_decMaybe", ("Vuna.Compiler.Base.Bytes.decMaybe", "Vuna/Compiler/Base/Bytes.vuna:203"));
  ("Base_dBytes.v_decNumStop", ("Vuna.Compiler.Base.Bytes.decNumStop", "Vuna/Compiler/Base/Bytes.vuna:126"));
  ("Base_dBytes.v_decPair", ("Vuna.Compiler.Base.Bytes.decPair", "Vuna/Compiler/Base/Bytes.vuna:214"));
  ("Base_dBytes.v_decStr", ("Vuna.Compiler.Base.Bytes.decStr", "Vuna/Compiler/Base/Bytes.vuna:173"));
  ("Base_dBytes.v_decTag", ("Vuna.Compiler.Base.Bytes.decTag", "Vuna/Compiler/Base/Bytes.vuna:136"));
  ("Base_dBytes.v_encBool", ("Vuna.Compiler.Base.Bytes.encBool", "Vuna/Compiler/Base/Bytes.vuna:93"));
  ("Base_dBytes.v_encConcat", ("Vuna.Compiler.Base.Bytes.encConcat", "Vuna/Compiler/Base/Bytes.vuna:73"));
  ("Base_dBytes.v_encInt", ("Vuna.Compiler.Base.Bytes.encInt", "Vuna/Compiler/Base/Bytes.vuna:85"));
  ("Base_dBytes.v_encList", ("Vuna.Compiler.Base.Bytes.encList", "Vuna/Compiler/Base/Bytes.vuna:98"));
  ("Base_dBytes.v_encListGo", ("Vuna.Compiler.Base.Bytes.encListGo", "Vuna/Compiler/Base/Bytes.vuna:102"));
  ("Base_dBytes.v_encMaybe", ("Vuna.Compiler.Base.Bytes.encMaybe", "Vuna/Compiler/Base/Bytes.vuna:107"));
  ("Base_dBytes.v_encPair", ("Vuna.Compiler.Base.Bytes.encPair", "Vuna/Compiler/Base/Bytes.vuna:112"));
  ("Base_dBytes.v_encStr", ("Vuna.Compiler.Base.Bytes.encStr", "Vuna/Compiler/Base/Bytes.vuna:89"));
  ("Base_dBytes.v_encTag", ("Vuna.Compiler.Base.Bytes.encTag", "Vuna/Compiler/Base/Bytes.vuna:81"));
  ("Base_dBytes.v_encTop", ("Vuna.Compiler.Base.Bytes.encTop", "Vuna/Compiler/Base/Bytes.vuna:77"));
  ("Base_dBytes.v_isDigit", ("Vuna.Compiler.Base.Bytes.isDigit", "Vuna/Compiler/Base/Bytes.vuna:121"));
  ("Base_dBytes.v_lenOf", ("Vuna.Compiler.Base.Bytes.lenOf", "Vuna/Compiler/Base/Bytes.vuna:68"));
  ("Base_dBytes.v_thenPair", ("Vuna.Compiler.Base.Bytes.thenPair", "Vuna/Compiler/Base/Bytes.vuna:116"));
  ("Base_dCapabilities.v_capabilityOf", ("Vuna.Compiler.Base.Capabilities.capabilityOf", "Vuna/Compiler/Base/Capabilities.vuna:23"));
  ("Base_dCapabilities.v_wasmCapabilityOf", ("Vuna.Compiler.Base.Capabilities.wasmCapabilityOf", "Vuna/Compiler/Base/Capabilities.vuna:28"));
  ("Base_dCommon.v_bind", ("Vuna.Compiler.Base.Common.bind", "Vuna/Compiler/Base/Common.vuna:26"));
  ("Base_dCommon.v_runEffCheck", ("Vuna.Compiler.Base.Common.runEffCheck", "Vuna/Compiler/Base/Common.vuna:36"));
  ("Base_dCommon.v_step", ("Vuna.Compiler.Base.Common.step", "Vuna/Compiler/Base/Common.vuna:51"));
  ("Base_dCommon.v_traverse", ("Vuna.Compiler.Base.Common.traverse", "Vuna/Compiler/Base/Common.vuna:56"));
  ("Base_dDiag.v_appendMessage", ("Vuna.Compiler.Base.Diag.appendMessage", "Vuna/Compiler/Base/Diag.vuna:500"));
  ("Base_dDiag.v_contextPrefixOf", ("Vuna.Compiler.Base.Diag.contextPrefixOf", "Vuna/Compiler/Base/Diag.vuna:458"));
  ("Base_dDiag.v_diagAt", ("Vuna.Compiler.Base.Diag.diagAt", "Vuna/Compiler/Base/Diag.vuna:214"));
  ("Base_dDiag.v_diagFileOf", ("Vuna.Compiler.Base.Diag.diagFileOf", "Vuna/Compiler/Base/Diag.vuna:656"));
  ("Base_dDiag.v_diagNoLoc", ("Vuna.Compiler.Base.Diag.diagNoLoc", "Vuna/Compiler/Base/Diag.vuna:192"));
  ("Base_dDiag.v_diagText", ("Vuna.Compiler.Base.Diag.diagText", "Vuna/Compiler/Base/Diag.vuna:471"));
  ("Base_dDiag.v_err", ("Vuna.Compiler.Base.Diag.err", "Vuna/Compiler/Base/Diag.vuna:236"));
  ("Base_dDiag.v_hasPrimaryLabel", ("Vuna.Compiler.Base.Diag.hasPrimaryLabel", "Vuna/Compiler/Base/Diag.vuna:608"));
  ("Base_dDiag.v_icFuel", ("Vuna.Compiler.Base.Diag.icFuel", "Vuna/Compiler/Base/Diag.vuna:639"));
  ("Base_dDiag.v_icInternal", ("Vuna.Compiler.Base.Diag.icInternal", "Vuna/Compiler/Base/Diag.vuna:645"));
  ("Base_dDiag.v_labelSpanOf", ("Vuna.Compiler.Base.Diag.labelSpanOf", "Vuna/Compiler/Base/Diag.vuna:687"));
  ("Base_dDiag.v_locPrefixOf", ("Vuna.Compiler.Base.Diag.locPrefixOf", "Vuna/Compiler/Base/Diag.vuna:464"));
  ("Base_dDiag.v_mapDiagChildren", ("Vuna.Compiler.Base.Diag.mapDiagChildren", "Vuna/Compiler/Base/Diag.vuna:297"));
  ("Base_dDiag.v_mapLabelFile", ("Vuna.Compiler.Base.Diag.mapLabelFile", "Vuna/Compiler/Base/Diag.vuna:301"));
  ("Base_dDiag.v_mapSpanFile", ("Vuna.Compiler.Base.Diag.mapSpanFile", "Vuna/Compiler/Base/Diag.vuna:275"));
  ("Base_dDiag.v_mapSpanPath", ("Vuna.Compiler.Base.Diag.mapSpanPath", "Vuna/Compiler/Base/Diag.vuna:305"));
  ("Base_dDiag.v_markInternal", ("Vuna.Compiler.Base.Diag.markInternal", "Vuna/Compiler/Base/Diag.vuna:617"));
  ("Base_dDiag.v_normalizeSite", ("Vuna.Compiler.Base.Diag.normalizeSite", "Vuna/Compiler/Base/Diag.vuna:263"));
  ("Base_dDiag.v_onErrDiag", ("Vuna.Compiler.Base.Diag.onErrDiag", "Vuna/Compiler/Base/Diag.vuna:651"));
  ("Base_dDiag.v_primaryLabelOf", ("Vuna.Compiler.Base.Diag.primaryLabelOf", "Vuna/Compiler/Base/Diag.vuna:663"));
  ("Base_dDiag.v_primarySpanOf", ("Vuna.Compiler.Base.Diag.primarySpanOf", "Vuna/Compiler/Base/Diag.vuna:452"));
  ("Base_dDiag.v_rawAt", ("Vuna.Compiler.Base.Diag.rawAt", "Vuna/Compiler/Base/Diag.vuna:242"));
  ("Base_dDiag.v_rawNoLoc", ("Vuna.Compiler.Base.Diag.rawNoLoc", "Vuna/Compiler/Base/Diag.vuna:248"));
  ("Base_dDiag.v_sameDiag", ("Vuna.Compiler.Base.Diag.sameDiag", "Vuna/Compiler/Base/Diag.vuna:678"));
  ("Base_dDiag.v_sameSeverity", ("Vuna.Compiler.Base.Diag.sameSeverity", "Vuna/Compiler/Base/Diag.vuna:670"));
  ("Base_dDiag.v_stabilityOfAbsent", ("Vuna.Compiler.Base.Diag.stabilityOfAbsent", "Vuna/Compiler/Base/Diag.vuna:319"));
  ("Base_dDiag.v_withAbsent", ("Vuna.Compiler.Base.Diag.withAbsent", "Vuna/Compiler/Base/Diag.vuna:312"));
  ("Base_dDiag.v_withChildren", ("Vuna.Compiler.Base.Diag.withChildren", "Vuna/Compiler/Base/Diag.vuna:547"));
  ("Base_dDiag.v_withContext", ("Vuna.Compiler.Base.Diag.withContext", "Vuna/Compiler/Base/Diag.vuna:440"));
  ("Base_dDiag.v_withFallbackSpan", ("Vuna.Compiler.Base.Diag.withFallbackSpan", "Vuna/Compiler/Base/Diag.vuna:569"));
  ("Base_dDiag.v_withField", ("Vuna.Compiler.Base.Diag.withField", "Vuna/Compiler/Base/Diag.vuna:326"));
  ("Base_dDiag.v_withHelp", ("Vuna.Compiler.Base.Diag.withHelp", "Vuna/Compiler/Base/Diag.vuna:370"));
  ("Base_dDiag.v_withLabel", ("Vuna.Compiler.Base.Diag.withLabel", "Vuna/Compiler/Base/Diag.vuna:257"));
  ("Base_dDiag.v_withLabelFileIfEmpty", ("Vuna.Compiler.Base.Diag.withLabelFileIfEmpty", "Vuna/Compiler/Base/Diag.vuna:596"));
  ("Base_dDiag.v_withMessage", ("Vuna.Compiler.Base.Diag.withMessage", "Vuna/Compiler/Base/Diag.vuna:478"));
  ("Base_dDiag.v_withNote", ("Vuna.Compiler.Base.Diag.withNote", "Vuna/Compiler/Base/Diag.vuna:348"));
  ("Base_dDiag.v_withOrigin", ("Vuna.Compiler.Base.Diag.withOrigin", "Vuna/Compiler/Base/Diag.vuna:418"));
  ("Base_dDiag.v_withSpanFileIfEmpty", ("Vuna.Compiler.Base.Diag.withSpanFileIfEmpty", "Vuna/Compiler/Base/Diag.vuna:575"));
  ("Base_dDiag.v_withStability", ("Vuna.Compiler.Base.Diag.withStability", "Vuna/Compiler/Base/Diag.vuna:271"));
  ("Base_dDiag.v_withSuggestion", ("Vuna.Compiler.Base.Diag.withSuggestion", "Vuna/Compiler/Base/Diag.vuna:374"));
  ("Base_dDiag.v_withTrace", ("Vuna.Compiler.Base.Diag.withTrace", "Vuna/Compiler/Base/Diag.vuna:396"));
  ("Base_dDiag_dCodec.v_absentEnc", ("Vuna.Compiler.Base.Diag.Codec.absentEnc", "Vuna/Compiler/Base/Diag/Codec.vuna:446"));
  ("Base_dDiag_dCodec.v_absentOfTag", ("Vuna.Compiler.Base.Diag.Codec.absentOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:133"));
  ("Base_dDiag_dCodec.v_absentTag", ("Vuna.Compiler.Base.Diag.Codec.absentTag", "Vuna/Compiler/Base/Diag/Codec.vuna:127"));
  ("Base_dDiag_dCodec.v_applicabilityOfTag", ("Vuna.Compiler.Base.Diag.Codec.applicabilityOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:121"));
  ("Base_dDiag_dCodec.v_applicabilityTag", ("Vuna.Compiler.Base.Diag.Codec.applicabilityTag", "Vuna/Compiler/Base/Diag/Codec.vuna:116"));
  ("Base_dDiag_dCodec.v_catOfTag", ("Vuna.Compiler.Base.Diag.Codec.catOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:88"));
  ("Base_dDiag_dCodec.v_catTag", ("Vuna.Compiler.Base.Diag.Codec.catTag", "Vuna/Compiler/Base/Diag/Codec.vuna:72"));
  ("Base_dDiag_dCodec.v_checkOutcomeCodec", ("Vuna.Compiler.Base.Diag.Codec.checkOutcomeCodec", "Vuna/Compiler/Base/Diag/Codec.vuna:469"));
  ("Base_dDiag_dCodec.v_checkResultCodec", ("Vuna.Compiler.Base.Diag.Codec.checkResultCodec", "Vuna/Compiler/Base/Diag/Codec.vuna:490"));
  ("Base_dDiag_dCodec.v_decCall", ("Vuna.Compiler.Base.Diag.Codec.decCall", "Vuna/Compiler/Base/Diag/Codec.vuna:253"));
  ("Base_dDiag_dCodec.v_decCandidate", ("Vuna.Compiler.Base.Diag.Codec.decCandidate", "Vuna/Compiler/Base/Diag/Codec.vuna:241"));
  ("Base_dDiag_dCodec.v_decCheckOutcome", ("Vuna.Compiler.Base.Diag.Codec.decCheckOutcome", "Vuna/Compiler/Base/Diag/Codec.vuna:496"));
  ("Base_dDiag_dCodec.v_decCount", ("Vuna.Compiler.Base.Diag.Codec.decCount", "Vuna/Compiler/Base/Diag/Codec.vuna:176"));
  ("Base_dDiag_dCodec.v_decDiag", ("Vuna.Compiler.Base.Diag.Codec.decDiag", "Vuna/Compiler/Base/Diag/Codec.vuna:345"));
  ("Base_dDiag_dCodec.v_decDiagItems", ("Vuna.Compiler.Base.Diag.Codec.decDiagItems", "Vuna/Compiler/Base/Diag/Codec.vuna:427"));
  ("Base_dDiag_dCodec.v_decDiagList", ("Vuna.Compiler.Base.Diag.Codec.decDiagList", "Vuna/Compiler/Base/Diag/Codec.vuna:418"));
  ("Base_dDiag_dCodec.v_decDiagnostics", ("Vuna.Compiler.Base.Diag.Codec.decDiagnostics", "Vuna/Compiler/Base/Diag/Codec.vuna:456"));
  ("Base_dDiag_dCodec.v_decEdit", ("Vuna.Compiler.Base.Diag.Codec.decEdit", "Vuna/Compiler/Base/Diag/Codec.vuna:211"));
  ("Base_dDiag_dCodec.v_decField", ("Vuna.Compiler.Base.Diag.Codec.decField", "Vuna/Compiler/Base/Diag/Codec.vuna:273"));
  ("Base_dDiag_dCodec.v_decIce", ("Vuna.Compiler.Base.Diag.Codec.decIce", "Vuna/Compiler/Base/Diag/Codec.vuna:309"));
  ("Base_dDiag_dCodec.v_decLabel", ("Vuna.Compiler.Base.Diag.Codec.decLabel", "Vuna/Compiler/Base/Diag/Codec.vuna:193"));
  ("Base_dDiag_dCodec.v_decOrigin", ("Vuna.Compiler.Base.Diag.Codec.decOrigin", "Vuna/Compiler/Base/Diag/Codec.vuna:295"));
  ("Base_dDiag_dCodec.v_decOutcome", ("Vuna.Compiler.Base.Diag.Codec.decOutcome", "Vuna/Compiler/Base/Diag/Codec.vuna:476"));
  ("Base_dDiag_dCodec.v_decSpan", ("Vuna.Compiler.Base.Diag.Codec.decSpan", "Vuna/Compiler/Base/Diag/Codec.vuna:158"));
  ("Base_dDiag_dCodec.v_decSuggestion", ("Vuna.Compiler.Base.Diag.Codec.decSuggestion", "Vuna/Compiler/Base/Diag/Codec.vuna:223"));
  ("Base_dDiag_dCodec.v_decTrace", ("Vuna.Compiler.Base.Diag.Codec.decTrace", "Vuna/Compiler/Base/Diag/Codec.vuna:318"));
  ("Base_dDiag_dCodec.v_diagCodec", ("Vuna.Compiler.Base.Diag.Codec.diagCodec", "Vuna/Compiler/Base/Diag/Codec.vuna:20"));
  ("Base_dDiag_dCodec.v_encCall", ("Vuna.Compiler.Base.Diag.Codec.encCall", "Vuna/Compiler/Base/Diag/Codec.vuna:247"));
  ("Base_dDiag_dCodec.v_encCandidate", ("Vuna.Compiler.Base.Diag.Codec.encCandidate", "Vuna/Compiler/Base/Diag/Codec.vuna:235"));
  ("Base_dDiag_dCodec.v_encCheckOutcome", ("Vuna.Compiler.Base.Diag.Codec.encCheckOutcome", "Vuna/Compiler/Base/Diag/Codec.vuna:493"));
  ("Base_dDiag_dCodec.v_encDiag", ("Vuna.Compiler.Base.Diag.Codec.encDiag", "Vuna/Compiler/Base/Diag/Codec.vuna:339"));
  ("Base_dDiag_dCodec.v_encDiagList", ("Vuna.Compiler.Base.Diag.Codec.encDiagList", "Vuna/Compiler/Base/Diag/Codec.vuna:327"));
  ("Base_dDiag_dCodec.v_encDiagListGo", ("Vuna.Compiler.Base.Diag.Codec.encDiagListGo", "Vuna/Compiler/Base/Diag/Codec.vuna:330"));
  ("Base_dDiag_dCodec.v_encDiagnostics", ("Vuna.Compiler.Base.Diag.Codec.encDiagnostics", "Vuna/Compiler/Base/Diag/Codec.vuna:453"));
  ("Base_dDiag_dCodec.v_encEdit", ("Vuna.Compiler.Base.Diag.Codec.encEdit", "Vuna/Compiler/Base/Diag/Codec.vuna:208"));
  ("Base_dDiag_dCodec.v_encField", ("Vuna.Compiler.Base.Diag.Codec.encField", "Vuna/Compiler/Base/Diag/Codec.vuna:260"));
  ("Base_dDiag_dCodec.v_encIce", ("Vuna.Compiler.Base.Diag.Codec.encIce", "Vuna/Compiler/Base/Diag/Codec.vuna:305"));
  ("Base_dDiag_dCodec.v_encLabel", ("Vuna.Compiler.Base.Diag.Codec.encLabel", "Vuna/Compiler/Base/Diag/Codec.vuna:186"));
  ("Base_dDiag_dCodec.v_encOrigin", ("Vuna.Compiler.Base.Diag.Codec.encOrigin", "Vuna/Compiler/Base/Diag/Codec.vuna:291"));
  ("Base_dDiag_dCodec.v_encOutcome", ("Vuna.Compiler.Base.Diag.Codec.encOutcome", "Vuna/Compiler/Base/Diag/Codec.vuna:472"));
  ("Base_dDiag_dCodec.v_encSpan", ("Vuna.Compiler.Base.Diag.Codec.encSpan", "Vuna/Compiler/Base/Diag/Codec.vuna:152"));
  ("Base_dDiag_dCodec.v_encSuggestion", ("Vuna.Compiler.Base.Diag.Codec.encSuggestion", "Vuna/Compiler/Base/Diag/Codec.vuna:217"));
  ("Base_dDiag_dCodec.v_encTrace", ("Vuna.Compiler.Base.Diag.Codec.encTrace", "Vuna/Compiler/Base/Diag/Codec.vuna:335"));
  ("Base_dDiag_dCodec.v_mtAbsent", ("Vuna.Compiler.Base.Diag.Codec.mtAbsent", "Vuna/Compiler/Base/Diag/Codec.vuna:438"));
  ("Base_dDiag_dCodec.v_phaseOfTag", ("Vuna.Compiler.Base.Diag.Codec.phaseOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:55"));
  ("Base_dDiag_dCodec.v_phaseTag", ("Vuna.Compiler.Base.Diag.Codec.phaseTag", "Vuna/Compiler/Base/Diag/Codec.vuna:39"));
  ("Base_dDiag_dCodec.v_readCount", ("Vuna.Compiler.Base.Diag.Codec.readCount", "Vuna/Compiler/Base/Diag/Codec.vuna:166"));
  ("Base_dDiag_dCodec.v_sevOfTag", ("Vuna.Compiler.Base.Diag.Codec.sevOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:32"));
  ("Base_dDiag_dCodec.v_sevTag", ("Vuna.Compiler.Base.Diag.Codec.sevTag", "Vuna/Compiler/Base/Diag/Codec.vuna:26"));
  ("Base_dDiag_dCodec.v_stabilityOfTag", ("Vuna.Compiler.Base.Diag.Codec.stabilityOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:144"));
  ("Base_dDiag_dCodec.v_stabilityTag", ("Vuna.Compiler.Base.Diag.Codec.stabilityTag", "Vuna/Compiler/Base/Diag/Codec.vuna:140"));
  ("Base_dDiag_dCodec.v_styleOfTag", ("Vuna.Compiler.Base.Diag.Codec.styleOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:110"));
  ("Base_dDiag_dCodec.v_styleTag", ("Vuna.Compiler.Base.Diag.Codec.styleTag", "Vuna/Compiler/Base/Diag/Codec.vuna:105"));
  ("Base_dDiag_dCodec.v_thenPair", ("Vuna.Compiler.Base.Diag.Codec.thenPair", "Vuna/Compiler/Base/Diag/Codec.vuna:182"));
  ("Base_dDiag_dFormat.v_absentName", ("Vuna.Compiler.Base.Diag.Format.absentName", "Vuna/Compiler/Base/Diag/Format.vuna:408"));
  ("Base_dDiag_dFormat.v_applicabilityName", ("Vuna.Compiler.Base.Diag.Format.applicabilityName", "Vuna/Compiler/Base/Diag/Format.vuna:70"));
  ("Base_dDiag_dFormat.v_callFieldBlock", ("Vuna.Compiler.Base.Diag.Format.callFieldBlock", "Vuna/Compiler/Base/Diag/Format.vuna:563"));
  ("Base_dDiag_dFormat.v_callFieldSuffix", ("Vuna.Compiler.Base.Diag.Format.callFieldSuffix", "Vuna/Compiler/Base/Diag/Format.vuna:567"));
  ("Base_dDiag_dFormat.v_callFieldsOf", ("Vuna.Compiler.Base.Diag.Format.callFieldsOf", "Vuna/Compiler/Base/Diag/Format.vuna:573"));
  ("Base_dDiag_dFormat.v_callSpanSuffix", ("Vuna.Compiler.Base.Diag.Format.callSpanSuffix", "Vuna/Compiler/Base/Diag/Format.vuna:598"));
  ("Base_dDiag_dFormat.v_candidateTextOf", ("Vuna.Compiler.Base.Diag.Format.candidateTextOf", "Vuna/Compiler/Base/Diag/Format.vuna:594"));
  ("Base_dDiag_dFormat.v_caretWidthIn", ("Vuna.Compiler.Base.Diag.Format.caretWidthIn", "Vuna/Compiler/Base/Diag/Format.vuna:132"));
  ("Base_dDiag_dFormat.v_categoryName", ("Vuna.Compiler.Base.Diag.Format.categoryName", "Vuna/Compiler/Base/Diag/Format.vuna:50"));
  ("Base_dDiag_dFormat.v_diagDescLine", ("Vuna.Compiler.Base.Diag.Format.diagDescLine", "Vuna/Compiler/Base/Diag/Format.vuna:541"));
  ("Base_dDiag_dFormat.v_displayColGo", ("Vuna.Compiler.Base.Diag.Format.displayColGo", "Vuna/Compiler/Base/Diag/Format.vuna:121"));
  ("Base_dDiag_dFormat.v_displayColOf", ("Vuna.Compiler.Base.Diag.Format.displayColOf", "Vuna/Compiler/Base/Diag/Format.vuna:127"));
  ("Base_dDiag_dFormat.v_displayLine", ("Vuna.Compiler.Base.Diag.Format.displayLine", "Vuna/Compiler/Base/Diag/Format.vuna:102"));
  ("Base_dDiag_dFormat.v_fieldLine", ("Vuna.Compiler.Base.Diag.Format.fieldLine", "Vuna/Compiler/Base/Diag/Format.vuna:547"));
  ("Base_dDiag_dFormat.v_ghChar", ("Vuna.Compiler.Base.Diag.Format.ghChar", "Vuna/Compiler/Base/Diag/Format.vuna:241"));
  ("Base_dDiag_dFormat.v_githubEscape", ("Vuna.Compiler.Base.Diag.Format.githubEscape", "Vuna/Compiler/Base/Diag/Format.vuna:238"));
  ("Base_dDiag_dFormat.v_headerOf", ("Vuna.Compiler.Base.Diag.Format.headerOf", "Vuna/Compiler/Base/Diag/Format.vuna:267"));
  ("Base_dDiag_dFormat.v_hex2", ("Vuna.Compiler.Base.Diag.Format.hex2", "Vuna/Compiler/Base/Diag/Format.vuna:310"));
  ("Base_dDiag_dFormat.v_hexDigit", ("Vuna.Compiler.Base.Diag.Format.hexDigit", "Vuna/Compiler/Base/Diag/Format.vuna:317"));
  ("Base_dDiag_dFormat.v_indent", ("Vuna.Compiler.Base.Diag.Format.indent", "Vuna/Compiler/Base/Diag/Format.vuna:585"));
  ("Base_dDiag_dFormat.v_isContextStyle", ("Vuna.Compiler.Base.Diag.Format.isContextStyle", "Vuna/Compiler/Base/Diag/Format.vuna:204"));
  ("Base_dDiag_dFormat.v_isPrimaryLabel", ("Vuna.Compiler.Base.Diag.Format.isPrimaryLabel", "Vuna/Compiler/Base/Diag/Format.vuna:491"));
  ("Base_dDiag_dFormat.v_isPrimaryStyle", ("Vuna.Compiler.Base.Diag.Format.isPrimaryStyle", "Vuna/Compiler/Base/Diag/Format.vuna:200"));
  ("Base_dDiag_dFormat.v_isUtf8Cont", ("Vuna.Compiler.Base.Diag.Format.isUtf8Cont", "Vuna/Compiler/Base/Diag/Format.vuna:117"));
  ("Base_dDiag_dFormat.v_jsonAbsent", ("Vuna.Compiler.Base.Diag.Format.jsonAbsent", "Vuna/Compiler/Base/Diag/Format.vuna:414"));
  ("Base_dDiag_dFormat.v_jsonCandidate", ("Vuna.Compiler.Base.Diag.Format.jsonCandidate", "Vuna/Compiler/Base/Diag/Format.vuna:350"));
  ("Base_dDiag_dFormat.v_jsonDiag", ("Vuna.Compiler.Base.Diag.Format.jsonDiag", "Vuna/Compiler/Base/Diag/Format.vuna:418"));
  ("Base_dDiag_dFormat.v_jsonDiagEdit", ("Vuna.Compiler.Base.Diag.Format.jsonDiagEdit", "Vuna/Compiler/Base/Diag/Format.vuna:374"));
  ("Base_dDiag_dFormat.v_jsonEscape", ("Vuna.Compiler.Base.Diag.Format.jsonEscape", "Vuna/Compiler/Base/Diag/Format.vuna:324"));
  ("Base_dDiag_dFormat.v_jsonEscapeChar", ("Vuna.Compiler.Base.Diag.Format.jsonEscapeChar", "Vuna/Compiler/Base/Diag/Format.vuna:302"));
  ("Base_dDiag_dFormat.v_jsonField", ("Vuna.Compiler.Base.Diag.Format.jsonField", "Vuna/Compiler/Base/Diag/Format.vuna:358"));
  ("Base_dDiag_dFormat.v_jsonIce", ("Vuna.Compiler.Base.Diag.Format.jsonIce", "Vuna/Compiler/Base/Diag/Format.vuna:391"));
  ("Base_dDiag_dFormat.v_jsonLabel", ("Vuna.Compiler.Base.Diag.Format.jsonLabel", "Vuna/Compiler/Base/Diag/Format.vuna:337"));
  ("Base_dDiag_dFormat.v_jsonPos", ("Vuna.Compiler.Base.Diag.Format.jsonPos", "Vuna/Compiler/Base/Diag/Format.vuna:330"));
  ("Base_dDiag_dFormat.v_jsonSource", ("Vuna.Compiler.Base.Diag.Format.jsonSource", "Vuna/Compiler/Base/Diag/Format.vuna:439"));
  ("Base_dDiag_dFormat.v_jsonSpan", ("Vuna.Compiler.Base.Diag.Format.jsonSpan", "Vuna/Compiler/Base/Diag/Format.vuna:333"));
  ("Base_dDiag_dFormat.v_jsonStr", ("Vuna.Compiler.Base.Diag.Format.jsonStr", "Vuna/Compiler/Base/Diag/Format.vuna:327"));
  ("Base_dDiag_dFormat.v_jsonSuggestion", ("Vuna.Compiler.Base.Diag.Format.jsonSuggestion", "Vuna/Compiler/Base/Diag/Format.vuna:377"));
  ("Base_dDiag_dFormat.v_jsonTrace", ("Vuna.Compiler.Base.Diag.Format.jsonTrace", "Vuna/Compiler/Base/Diag/Format.vuna:381"));
  ("Base_dDiag_dFormat.v_jsonTraceFuel", ("Vuna.Compiler.Base.Diag.Format.jsonTraceFuel", "Vuna/Compiler/Base/Diag/Format.vuna:384"));
  ("Base_dDiag_dFormat.v_lineAt", ("Vuna.Compiler.Base.Diag.Format.lineAt", "Vuna/Compiler/Base/Diag/Format.vuna:97"));
  ("Base_dDiag_dFormat.v_localizedJsonField", ("Vuna.Compiler.Base.Diag.Format.localizedJsonField", "Vuna/Compiler/Base/Diag/Format.vuna:602"));
  ("Base_dDiag_dFormat.v_localizedMessage", ("Vuna.Compiler.Base.Diag.Format.localizedMessage", "Vuna/Compiler/Base/Diag/Format.vuna:258"));
  ("Base_dDiag_dFormat.v_maybeJsonIce", ("Vuna.Compiler.Base.Diag.Format.maybeJsonIce", "Vuna/Compiler/Base/Diag/Format.vuna:395"));
  ("Base_dDiag_dFormat.v_maybeJsonSpan", ("Vuna.Compiler.Base.Diag.Format.maybeJsonSpan", "Vuna/Compiler/Base/Diag/Format.vuna:346"));
  ("Base_dDiag_dFormat.v_maybeJsonString", ("Vuna.Compiler.Base.Diag.Format.maybeJsonString", "Vuna/Compiler/Base/Diag/Format.vuna:354"));
  ("Base_dDiag_dFormat.v_maybeParent", ("Vuna.Compiler.Base.Diag.Format.maybeParent", "Vuna/Compiler/Base/Diag/Format.vuna:403"));
  ("Base_dDiag_dFormat.v_memCode", ("Vuna.Compiler.Base.Diag.Format.memCode", "Vuna/Compiler/Base/Diag/Format.vuna:508"));
  ("Base_dDiag_dFormat.v_originJson", ("Vuna.Compiler.Base.Diag.Format.originJson", "Vuna/Compiler/Base/Diag/Format.vuna:399"));
  ("Base_dDiag_dFormat.v_originName", ("Vuna.Compiler.Base.Diag.Format.originName", "Vuna/Compiler/Base/Diag/Format.vuna:66"));
  ("Base_dDiag_dFormat.v_padLeft", ("Vuna.Compiler.Base.Diag.Format.padLeft", "Vuna/Compiler/Base/Diag/Format.vuna:112"));
  ("Base_dDiag_dFormat.v_phaseName", ("Vuna.Compiler.Base.Diag.Format.phaseName", "Vuna/Compiler/Base/Diag/Format.vuna:34"));
  ("Base_dDiag_dFormat.v_primarySpan", ("Vuna.Compiler.Base.Diag.Format.primarySpan", "Vuna/Compiler/Base/Diag/Format.vuna:85"));
  ("Base_dDiag_dFormat.v_primaryText", ("Vuna.Compiler.Base.Diag.Format.primaryText", "Vuna/Compiler/Base/Diag/Format.vuna:91"));
  ("Base_dDiag_dFormat.v_relatedBlocks", ("Vuna.Compiler.Base.Diag.Format.relatedBlocks", "Vuna/Compiler/Base/Diag/Format.vuna:208"));
  ("Base_dDiag_dFormat.v_renderGithub", ("Vuna.Compiler.Base.Diag.Format.renderGithub", "Vuna/Compiler/Base/Diag/Format.vuna:247"));
  ("Base_dDiag_dFormat.v_renderHuman", ("Vuna.Compiler.Base.Diag.Format.renderHuman", "Vuna/Compiler/Base/Diag/Format.vuna:277"));
  ("Base_dDiag_dFormat.v_renderJson", ("Vuna.Compiler.Base.Diag.Format.renderJson", "Vuna/Compiler/Base/Diag/Format.vuna:424"));
  ("Base_dDiag_dFormat.v_renderJsonList", ("Vuna.Compiler.Base.Diag.Format.renderJsonList", "Vuna/Compiler/Base/Diag/Format.vuna:427"));
  ("Base_dDiag_dFormat.v_renderJsonListWithSources", ("Vuna.Compiler.Base.Diag.Format.renderJsonListWithSources", "Vuna/Compiler/Base/Diag/Format.vuna:443"));
  ("Base_dDiag_dFormat.v_renderRelated", ("Vuna.Compiler.Base.Diag.Format.renderRelated", "Vuna/Compiler/Base/Diag/Format.vuna:230"));
  ("Base_dDiag_dFormat.v_renderSarif", ("Vuna.Compiler.Base.Diag.Format.renderSarif", "Vuna/Compiler/Base/Diag/Format.vuna:533"));
  ("Base_dDiag_dFormat.v_renderShort", ("Vuna.Compiler.Base.Diag.Format.renderShort", "Vuna/Compiler/Base/Diag/Format.vuna:78"));
  ("Base_dDiag_dFormat.v_renderShortSnippetEff", ("Vuna.Compiler.Base.Diag.Format.renderShortSnippetEff", "Vuna/Compiler/Base/Diag/Format.vuna:177"));
  ("Base_dDiag_dFormat.v_renderSnippet", ("Vuna.Compiler.Base.Diag.Format.renderSnippet", "Vuna/Compiler/Base/Diag/Format.vuna:159"));
  ("Base_dDiag_dFormat.v_repeatSpace", ("Vuna.Compiler.Base.Diag.Format.repeatSpace", "Vuna/Compiler/Base/Diag/Format.vuna:109"));
  ("Base_dDiag_dFormat.v_ruleJson", ("Vuna.Compiler.Base.Diag.Format.ruleJson", "Vuna/Compiler/Base/Diag/Format.vuna:512"));
  ("Base_dDiag_dFormat.v_sameAsPrimary", ("Vuna.Compiler.Base.Diag.Format.sameAsPrimary", "Vuna/Compiler/Base/Diag/Format.vuna:196"));
  ("Base_dDiag_dFormat.v_sameSpan", ("Vuna.Compiler.Base.Diag.Format.sameSpan", "Vuna/Compiler/Base/Diag/Format.vuna:187"));
  ("Base_dDiag_dFormat.v_sarifLevel", ("Vuna.Compiler.Base.Diag.Format.sarifLevel", "Vuna/Compiler/Base/Diag/Format.vuna:450"));
  ("Base_dDiag_dFormat.v_sarifLevelName", ("Vuna.Compiler.Base.Diag.Format.sarifLevelName", "Vuna/Compiler/Base/Diag/Format.vuna:527"));
  ("Base_dDiag_dFormat.v_sarifLocation", ("Vuna.Compiler.Base.Diag.Format.sarifLocation", "Vuna/Compiler/Base/Diag/Format.vuna:463"));
  ("Base_dDiag_dFormat.v_sarifRegion", ("Vuna.Compiler.Base.Diag.Format.sarifRegion", "Vuna/Compiler/Base/Diag/Format.vuna:459"));
  ("Base_dDiag_dFormat.v_sarifRelated", ("Vuna.Compiler.Base.Diag.Format.sarifRelated", "Vuna/Compiler/Base/Diag/Format.vuna:467"));
  ("Base_dDiag_dFormat.v_sarifResult", ("Vuna.Compiler.Base.Diag.Format.sarifResult", "Vuna/Compiler/Base/Diag/Format.vuna:474"));
  ("Base_dDiag_dFormat.v_sarifRuleId", ("Vuna.Compiler.Base.Diag.Format.sarifRuleId", "Vuna/Compiler/Base/Diag/Format.vuna:456"));
  ("Base_dDiag_dFormat.v_sarifRules", ("Vuna.Compiler.Base.Diag.Format.sarifRules", "Vuna/Compiler/Base/Diag/Format.vuna:498"));
  ("Base_dDiag_dFormat.v_severityName", ("Vuna.Compiler.Base.Diag.Format.severityName", "Vuna/Compiler/Base/Diag/Format.vuna:28"));
  ("Base_dDiag_dFormat.v_showInt", ("Vuna.Compiler.Base.Diag.Format.showInt", "Vuna/Compiler/Base/Diag/Format.vuna:591"));
  ("Base_dDiag_dFormat.v_snippetOf", ("Vuna.Compiler.Base.Diag.Format.snippetOf", "Vuna/Compiler/Base/Diag/Format.vuna:142"));
  ("Base_dDiag_dFormat.v_styleName", ("Vuna.Compiler.Base.Diag.Format.styleName", "Vuna/Compiler/Base/Diag/Format.vuna:341"));
  ("Base_dDiag_dFormat.v_suggestionLine", ("Vuna.Compiler.Base.Diag.Format.suggestionLine", "Vuna/Compiler/Base/Diag/Format.vuna:588"));
  ("Base_dDiag_dFormat.v_tabToSpace", ("Vuna.Compiler.Base.Diag.Format.tabToSpace", "Vuna/Compiler/Base/Diag/Format.vuna:105"));
  ("Base_dDiag_dFormat.v_traceLines", ("Vuna.Compiler.Base.Diag.Format.traceLines", "Vuna/Compiler/Base/Diag/Format.vuna:580"));
  ("Base_dDiag_dFormat.v_uniqueCodes", ("Vuna.Compiler.Base.Diag.Format.uniqueCodes", "Vuna/Compiler/Base/Diag/Format.vuna:501"));
  ("Base_dDiagnostics.v_allDescPairs", ("Vuna.Compiler.Base.Diagnostics.allDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:142"));
  ("Base_dDiagnostics.v_cgDescPairs", ("Vuna.Compiler.Base.Diagnostics.cgDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:102"));
  ("Base_dDiagnostics.v_codeDomain", ("Vuna.Compiler.Base.Diagnostics.codeDomain", "Vuna/Compiler/Base/Diagnostics.vuna:49"));
  ("Base_dDiagnostics.v_diagCategoryOf", ("Vuna.Compiler.Base.Diagnostics.diagCategoryOf", "Vuna/Compiler/Base/Diagnostics.vuna:71"));
  ("Base_dDiagnostics.v_diagDescOf", ("Vuna.Compiler.Base.Diagnostics.diagDescOf", "Vuna/Compiler/Base/Diagnostics.vuna:93"));
  ("Base_dDiagnostics.v_diagPhaseOf", ("Vuna.Compiler.Base.Diagnostics.diagPhaseOf", "Vuna/Compiler/Base/Diagnostics.vuna:56"));
  ("Base_dDiagnostics.v_diagSeverityOf", ("Vuna.Compiler.Base.Diagnostics.diagSeverityOf", "Vuna/Compiler/Base/Diagnostics.vuna:86"));
  ("Base_dDiagnostics.v_icDescPairs", ("Vuna.Compiler.Base.Diagnostics.icDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:107"));
  ("Base_dDiagnostics.v_ldDescPairs", ("Vuna.Compiler.Base.Diagnostics.ldDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:137"));
  ("Base_dDiagnostics.v_lexDescPairs", ("Vuna.Compiler.Base.Diagnostics.lexDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:112"));
  ("Base_dDiagnostics.v_lookupDesc", ("Vuna.Compiler.Base.Diagnostics.lookupDesc", "Vuna/Compiler/Base/Diagnostics.vuna:149"));
  ("Base_dDiagnostics.v_pkgDescPairs", ("Vuna.Compiler.Base.Diagnostics.pkgDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:127"));
  ("Base_dDiagnostics.v_psDescPairs", ("Vuna.Compiler.Base.Diagnostics.psDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:117"));
  ("Base_dDiagnostics.v_rnDescPairs", ("Vuna.Compiler.Base.Diagnostics.rnDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:122"));
  ("Base_dDiagnostics.v_tcDescPairs", ("Vuna.Compiler.Base.Diagnostics.tcDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:97"));
  ("Base_dDiagnostics.v_warnDescPairs", ("Vuna.Compiler.Base.Diagnostics.warnDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:132"));
  ("Base_dDiagnostics_dCg.v_cgAll", ("Vuna.Compiler.Base.Diagnostics.Cg.cgAll", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:66"));
  ("Base_dDiagnostics_dCg.v_cgChunk0", ("Vuna.Compiler.Base.Diagnostics.Cg.cgChunk0", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:69"));
  ("Base_dDiagnostics_dCg.v_cgChunk1", ("Vuna.Compiler.Base.Diagnostics.Cg.cgChunk1", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:90"));
  ("Base_dDiagnostics_dCg.v_cgCode", ("Vuna.Compiler.Base.Diagnostics.Cg.cgCode", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:32"));
  ("Base_dDiagnostics_dCg.v_cgErr", ("Vuna.Compiler.Base.Diagnostics.Cg.cgErr", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:117"));
  ("Base_dDiagnostics_dCg.v_cgErr0", ("Vuna.Compiler.Base.Diagnostics.Cg.cgErr0", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:121"));
  ("Base_dDiagnostics_dCg.v_cgErr0At", ("Vuna.Compiler.Base.Diagnostics.Cg.cgErr0At", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:129"));
  ("Base_dDiagnostics_dCg.v_cgErr1", ("Vuna.Compiler.Base.Diagnostics.Cg.cgErr1", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:125"));
  ("Base_dDiagnostics_dCg.v_cgErrDefAt", ("Vuna.Compiler.Base.Diagnostics.Cg.cgErrDefAt", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:135"));
  ("Base_dDiagnostics_dCg.v_cgMsg", ("Vuna.Compiler.Base.Diagnostics.Cg.cgMsg", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:114"));
  ("Base_dDiagnostics_dCg.v_cgTemplate", ("Vuna.Compiler.Base.Diagnostics.Cg.cgTemplate", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:45"));
  ("Base_dDiagnostics_dCommon.v_concatLists", ("Vuna.Compiler.Base.Diagnostics.Common.concatLists", "Vuna/Compiler/Base/Diagnostics/Common.vuna:35"));
  ("Base_dDiagnostics_dCommon.v_diagBody", ("Vuna.Compiler.Base.Diagnostics.Common.diagBody", "Vuna/Compiler/Base/Diagnostics/Common.vuna:18"));
  ("Base_dDiagnostics_dCommon.v_mkDiag", ("Vuna.Compiler.Base.Diagnostics.Common.mkDiag", "Vuna/Compiler/Base/Diagnostics/Common.vuna:22"));
  ("Base_dDiagnostics_dCommon.v_withDiagDef", ("Vuna.Compiler.Base.Diagnostics.Common.withDiagDef", "Vuna/Compiler/Base/Diagnostics/Common.vuna:30"));
  ("Base_dDiagnostics_dCommon.v_withDiagSpan", ("Vuna.Compiler.Base.Diagnostics.Common.withDiagSpan", "Vuna/Compiler/Base/Diagnostics/Common.vuna:26"));
  ("Base_dDiagnostics_dFrontend.v_lexAll", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexAll", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:220"));
  ("Base_dDiagnostics_dFrontend.v_lexCode", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexCode", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:30"));
  ("Base_dDiagnostics_dFrontend.v_lexErr0At", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexErr0At", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:411"));
  ("Base_dDiagnostics_dFrontend.v_lexErrAt", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexErrAt", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:398"));
  ("Base_dDiagnostics_dFrontend.v_lexMsg", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexMsg", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:391"));
  ("Base_dDiagnostics_dFrontend.v_lexTemplate", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexTemplate", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:38"));
  ("Base_dDiagnostics_dFrontend.v_psAll", ("Vuna.Compiler.Base.Diagnostics.Frontend.psAll", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:243"));
  ("Base_dDiagnostics_dFrontend.v_psCode", ("Vuna.Compiler.Base.Diagnostics.Frontend.psCode", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:108"));
  ("Base_dDiagnostics_dFrontend.v_psErr0At", ("Vuna.Compiler.Base.Diagnostics.Frontend.psErr0At", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:415"));
  ("Base_dDiagnostics_dFrontend.v_psErr1At", ("Vuna.Compiler.Base.Diagnostics.Frontend.psErr1At", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:419"));
  ("Base_dDiagnostics_dFrontend.v_psErrAt", ("Vuna.Compiler.Base.Diagnostics.Frontend.psErrAt", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:402"));
  ("Base_dDiagnostics_dFrontend.v_psMsg", ("Vuna.Compiler.Base.Diagnostics.Frontend.psMsg", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:394"));
  ("Base_dDiagnostics_dFrontend.v_psTemplate", ("Vuna.Compiler.Base.Diagnostics.Frontend.psTemplate", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:155"));
  ("Base_dDiagnostics_dIc.v_icAll", ("Vuna.Compiler.Base.Diagnostics.Ic.icAll", "Vuna/Compiler/Base/Diagnostics/Ic.vuna:30"));
  ("Base_dDiagnostics_dIc.v_icCode", ("Vuna.Compiler.Base.Diagnostics.Ic.icCode", "Vuna/Compiler/Base/Diagnostics/Ic.vuna:16"));
  ("Base_dDiagnostics_dIc.v_icTemplate", ("Vuna.Compiler.Base.Diagnostics.Ic.icTemplate", "Vuna/Compiler/Base/Diagnostics/Ic.vuna:20"));
  ("Base_dDiagnostics_dLoader.v_ldAll", ("Vuna.Compiler.Base.Diagnostics.Loader.ldAll", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:53"));
  ("Base_dDiagnostics_dLoader.v_ldCode", ("Vuna.Compiler.Base.Diagnostics.Loader.ldCode", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:27"));
  ("Base_dDiagnostics_dLoader.v_ldErr", ("Vuna.Compiler.Base.Diagnostics.Loader.ldErr", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:84"));
  ("Base_dDiagnostics_dLoader.v_ldErr0", ("Vuna.Compiler.Base.Diagnostics.Loader.ldErr0", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:88"));
  ("Base_dDiagnostics_dLoader.v_ldErr1", ("Vuna.Compiler.Base.Diagnostics.Loader.ldErr1", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:92"));
  ("Base_dDiagnostics_dLoader.v_ldErr2", ("Vuna.Compiler.Base.Diagnostics.Loader.ldErr2", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:100"));
  ("Base_dDiagnostics_dLoader.v_ldErr4", ("Vuna.Compiler.Base.Diagnostics.Loader.ldErr4", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:96"));
  ("Base_dDiagnostics_dLoader.v_ldMsg", ("Vuna.Compiler.Base.Diagnostics.Loader.ldMsg", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:81"));
  ("Base_dDiagnostics_dLoader.v_ldTemplate", ("Vuna.Compiler.Base.Diagnostics.Loader.ldTemplate", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:37"));
  ("Base_dDiagnostics_dPkg.v_atSpan", ("Vuna.Compiler.Base.Diagnostics.Pkg.atSpan", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:186"));
  ("Base_dDiagnostics_dPkg.v_pkgAll", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgAll", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:241"));
  ("Base_dDiagnostics_dPkg.v_pkgAt", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgAt", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:191"));
  ("Base_dDiagnostics_dPkg.v_pkgAt0", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgAt0", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:207"));
  ("Base_dDiagnostics_dPkg.v_pkgAt1", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgAt1", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:211"));
  ("Base_dDiagnostics_dPkg.v_pkgAt2", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgAt2", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:215"));
  ("Base_dDiagnostics_dPkg.v_pkgCode", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgCode", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:67"));
  ("Base_dDiagnostics_dPkg.v_pkgInvalid", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgInvalid", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:231"));
  ("Base_dDiagnostics_dPkg.v_pkgMsg", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgMsg", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:178"));
  ("Base_dDiagnostics_dPkg.v_pkgNoLoc", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgNoLoc", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:199"));
  ("Base_dDiagnostics_dPkg.v_pkgNoLoc1", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgNoLoc1", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:203"));
  ("Base_dDiagnostics_dPkg.v_pkgPath", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgPath", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:195"));
  ("Base_dDiagnostics_dPkg.v_pkgPath0", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgPath0", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:219"));
  ("Base_dDiagnostics_dPkg.v_pkgPath1", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgPath1", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:223"));
  ("Base_dDiagnostics_dPkg.v_pkgPath2", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgPath2", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:227"));
  ("Base_dDiagnostics_dPkg.v_pkgSpan", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgSpan", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:182"));
  ("Base_dDiagnostics_dPkg.v_pkgTemplate", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgTemplate", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:115"));
  ("Base_dDiagnostics_dRn.v_rnAll", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAll", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:169"));
  ("Base_dDiagnostics_dRn.v_rnAt0", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAt0", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:135"));
  ("Base_dDiagnostics_dRn.v_rnAt1", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAt1", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:139"));
  ("Base_dDiagnostics_dRn.v_rnAt2", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAt2", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:143"));
  ("Base_dDiagnostics_dRn.v_rnAt3", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAt3", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:147"));
  ("Base_dDiagnostics_dRn.v_rnCode", ("Vuna.Compiler.Base.Diagnostics.Rn.rnCode", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:56"));
  ("Base_dDiagnostics_dRn.v_rnErr", ("Vuna.Compiler.Base.Diagnostics.Rn.rnErr", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:127"));
  ("Base_dDiagnostics_dRn.v_rnMsg", ("Vuna.Compiler.Base.Diagnostics.Rn.rnMsg", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:123"));
  ("Base_dDiagnostics_dRn.v_rnNoLoc", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:131"));
  ("Base_dDiagnostics_dRn.v_rnNoLoc0", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc0", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:151"));
  ("Base_dDiagnostics_dRn.v_rnNoLoc1", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc1", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:155"));
  ("Base_dDiagnostics_dRn.v_rnNoLoc2", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc2", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:159"));
  ("Base_dDiagnostics_dRn.v_rnTemplate", ("Vuna.Compiler.Base.Diagnostics.Rn.rnTemplate", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:87"));
  ("Base_dDiagnostics_dSink.v_dedupeGo", ("Vuna.Compiler.Base.Diagnostics.Sink.dedupeGo", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:52"));
  ("Base_dDiagnostics_dSink.v_dedupeWarnings", ("Vuna.Compiler.Base.Diagnostics.Sink.dedupeWarnings", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:62"));
  ("Base_dDiagnostics_dSink.v_diagKey", ("Vuna.Compiler.Base.Diagnostics.Sink.diagKey", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:31"));
  ("Base_dDiagnostics_dSink.v_severityTag", ("Vuna.Compiler.Base.Diagnostics.Sink.severityTag", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:20"));
  ("Base_dDiagnostics_dSink.v_spanPart", ("Vuna.Compiler.Base.Diagnostics.Sink.spanPart", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:42"));
  ("Base_dDiagnostics_dSink.v_spansKey", ("Vuna.Compiler.Base.Diagnostics.Sink.spansKey", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:36"));
  ("Base_dDiagnostics_dSink.v_tagPart", ("Vuna.Compiler.Base.Diagnostics.Sink.tagPart", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:27"));
  ("Base_dDiagnostics_dTc.v_coverageCandidate", ("Vuna.Compiler.Base.Diagnostics.Tc.coverageCandidate", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:900"));
  ("Base_dDiagnostics_dTc.v_tcAll", ("Vuna.Compiler.Base.Diagnostics.Tc.tcAll", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:823"));
  ("Base_dDiagnostics_dTc.v_tcChunk0", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk0", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:408"));
  ("Base_dDiagnostics_dTc.v_tcChunk1", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk1", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:438"));
  ("Base_dDiagnostics_dTc.v_tcChunk10", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk10", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:713"));
  ("Base_dDiagnostics_dTc.v_tcChunk11", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk11", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:760"));
  ("Base_dDiagnostics_dTc.v_tcChunk12", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk12", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:802"));
  ("Base_dDiagnostics_dTc.v_tcChunk2", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk2", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:462"));
  ("Base_dDiagnostics_dTc.v_tcChunk3", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk3", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:491"));
  ("Base_dDiagnostics_dTc.v_tcChunk4", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk4", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:519"));
  ("Base_dDiagnostics_dTc.v_tcChunk5", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk5", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:542"));
  ("Base_dDiagnostics_dTc.v_tcChunk6", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk6", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:579"));
  ("Base_dDiagnostics_dTc.v_tcChunk7", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk7", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:611"));
  ("Base_dDiagnostics_dTc.v_tcChunk8", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk8", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:635"));
  ("Base_dDiagnostics_dTc.v_tcChunk9", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk9", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:679"));
  ("Base_dDiagnostics_dTc.v_tcCode", ("Vuna.Compiler.Base.Diagnostics.Tc.tcCode", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:150"));
  ("Base_dDiagnostics_dTc.v_tcCoverageMissing", ("Vuna.Compiler.Base.Diagnostics.Tc.tcCoverageMissing", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:891"));
  ("Base_dDiagnostics_dTc.v_tcErr", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:836"));
  ("Base_dDiagnostics_dTc.v_tcErr0", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr0", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:843"));
  ("Base_dDiagnostics_dTc.v_tcErr0NoLoc", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr0NoLoc", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:859"));
  ("Base_dDiagnostics_dTc.v_tcErr1", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr1", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:847"));
  ("Base_dDiagnostics_dTc.v_tcErr1NoLoc", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr1NoLoc", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:863"));
  ("Base_dDiagnostics_dTc.v_tcErr2", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr2", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:851"));
  ("Base_dDiagnostics_dTc.v_tcErr2NoLoc", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr2NoLoc", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:867"));
  ("Base_dDiagnostics_dTc.v_tcErr3", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr3", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:886"));
  ("Base_dDiagnostics_dTc.v_tcMsg", ("Vuna.Compiler.Base.Diagnostics.Tc.tcMsg", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:832"));
  ("Base_dDiagnostics_dTc.v_tcTemplate", ("Vuna.Compiler.Base.Diagnostics.Tc.tcTemplate", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:262"));
  ("Base_dDiagnostics_dTc.v_tcTypeMismatch", ("Vuna.Compiler.Base.Diagnostics.Tc.tcTypeMismatch", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:874"));
  ("Base_dDiagnostics_dTc.v_tcTypeMismatchNoLoc", ("Vuna.Compiler.Base.Diagnostics.Tc.tcTypeMismatchNoLoc", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:880"));
  ("Base_dDiagnostics_dWarning.v_targetEffectWarn", ("Vuna.Compiler.Base.Diagnostics.Warning.targetEffectWarn", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:71"));
  ("Base_dDiagnostics_dWarning.v_warnAll", ("Vuna.Compiler.Base.Diagnostics.Warning.warnAll", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:87"));
  ("Base_dDiagnostics_dWarning.v_warnCode", ("Vuna.Compiler.Base.Diagnostics.Warning.warnCode", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:32"));
  ("Base_dDiagnostics_dWarning.v_warnDiagAt", ("Vuna.Compiler.Base.Diagnostics.Warning.warnDiagAt", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:62"));
  ("Base_dDiagnostics_dWarning.v_warnDiagAtMod", ("Vuna.Compiler.Base.Diagnostics.Warning.warnDiagAtMod", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:66"));
  ("Base_dDiagnostics_dWarning.v_warnMsg", ("Vuna.Compiler.Base.Diagnostics.Warning.warnMsg", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:57"));
  ("Base_dDiagnostics_dWarning.v_warnTemplate", ("Vuna.Compiler.Base.Diagnostics.Warning.warnTemplate", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:43"));
  ("Base_dHash.v_atIdx", ("Vuna.Compiler.Base.Hash.atIdx", "Vuna/Compiler/Base/Hash.vuna:154"));
  ("Base_dHash.v_atWindow", ("Vuna.Compiler.Base.Hash.atWindow", "Vuna/Compiler/Base/Hash.vuna:226"));
  ("Base_dHash.v_bigSigma0", ("Vuna.Compiler.Base.Hash.bigSigma0", "Vuna/Compiler/Base/Hash.vuna:216"));
  ("Base_dHash.v_bigSigma1", ("Vuna.Compiler.Base.Hash.bigSigma1", "Vuna/Compiler/Base/Hash.vuna:220"));
  ("Base_dHash.v_blocksGo", ("Vuna.Compiler.Base.Hash.blocksGo", "Vuna/Compiler/Base/Hash.vuna:327"));
  ("Base_dHash.v_ch32", ("Vuna.Compiler.Base.Hash.ch32", "Vuna/Compiler/Base/Hash.vuna:249"));
  ("Base_dHash.v_chunk64", ("Vuna.Compiler.Base.Hash.chunk64", "Vuna/Compiler/Base/Hash.vuna:186"));
  ("Base_dHash.v_chunkWords", ("Vuna.Compiler.Base.Hash.chunkWords", "Vuna/Compiler/Base/Hash.vuna:204"));
  ("Base_dHash.v_chunkWordsString", ("Vuna.Compiler.Base.Hash.chunkWordsString", "Vuna/Compiler/Base/Hash.vuna:323"));
  ("Base_dHash.v_chunks", ("Vuna.Compiler.Base.Hash.chunks", "Vuna/Compiler/Base/Hash.vuna:190"));
  ("Base_dHash.v_compress", ("Vuna.Compiler.Base.Hash.compress", "Vuna/Compiler/Base/Hash.vuna:266"));
  ("Base_dHash.v_compressBlock", ("Vuna.Compiler.Base.Hash.compressBlock", "Vuna/Compiler/Base/Hash.vuna:284"));
  ("Base_dHash.v_contentAddress", ("Vuna.Compiler.Base.Hash.contentAddress", "Vuna/Compiler/Base/Hash.vuna:67"));
  ("Base_dHash.v_contentKey", ("Vuna.Compiler.Base.Hash.contentKey", "Vuna/Compiler/Base/Hash.vuna:62"));
  ("Base_dHash.v_digestHex", ("Vuna.Compiler.Base.Hash.digestHex", "Vuna/Compiler/Base/Hash.vuna:41"));
  ("Base_dHash.v_digestInt", ("Vuna.Compiler.Base.Hash.digestInt", "Vuna/Compiler/Base/Hash.vuna:49"));
  ("Base_dHash.v_digestIntOf", ("Vuna.Compiler.Base.Hash.digestIntOf", "Vuna/Compiler/Base/Hash.vuna:53"));
  ("Base_dHash.v_digestLanes", ("Vuna.Compiler.Base.Hash.digestLanes", "Vuna/Compiler/Base/Hash.vuna:25"));
  ("Base_dHash.v_digestOfBytes", ("Vuna.Compiler.Base.Hash.digestOfBytes", "Vuna/Compiler/Base/Hash.vuna:29"));
  ("Base_dHash.v_digestOfString", ("Vuna.Compiler.Base.Hash.digestOfString", "Vuna/Compiler/Base/Hash.vuna:37"));
  ("Base_dHash.v_digitAt", ("Vuna.Compiler.Base.Hash.digitAt", "Vuna/Compiler/Base/Hash.vuna:384"));
  ("Base_dHash.v_hex8", ("Vuna.Compiler.Base.Hash.hex8", "Vuna/Compiler/Base/Hash.vuna:378"));
  ("Base_dHash.v_hexDigit", ("Vuna.Compiler.Base.Hash.hexDigit", "Vuna/Compiler/Base/Hash.vuna:388"));
  ("Base_dHash.v_lenBytes", ("Vuna.Compiler.Base.Hash.lenBytes", "Vuna/Compiler/Base/Hash.vuna:163"));
  ("Base_dHash.v_lenInt", ("Vuna.Compiler.Base.Hash.lenInt", "Vuna/Compiler/Base/Hash.vuna:149"));
  ("Base_dHash.v_maj32", ("Vuna.Compiler.Base.Hash.maj32", "Vuna/Compiler/Base/Hash.vuna:253"));
  ("Base_dHash.v_padMessage", ("Vuna.Compiler.Base.Hash.padMessage", "Vuna/Compiler/Base/Hash.vuna:177"));
  ("Base_dHash.v_paddedByte", ("Vuna.Compiler.Base.Hash.paddedByte", "Vuna/Compiler/Base/Hash.vuna:303"));
  ("Base_dHash.v_paddedLen", ("Vuna.Compiler.Base.Hash.paddedLen", "Vuna/Compiler/Base/Hash.vuna:295"));
  ("Base_dHash.v_prehashGo", ("Vuna.Compiler.Base.Hash.prehashGo", "Vuna/Compiler/Base/Hash.vuna:365"));
  ("Base_dHash.v_prehashOfString", ("Vuna.Compiler.Base.Hash.prehashOfString", "Vuna/Compiler/Base/Hash.vuna:361"));
  ("Base_dHash.v_roundsGo", ("Vuna.Compiler.Base.Hash.roundsGo", "Vuna/Compiler/Base/Hash.vuna:257"));
  ("Base_dHash.v_schedule", ("Vuna.Compiler.Base.Hash.schedule", "Vuna/Compiler/Base/Hash.vuna:231"));
  ("Base_dHash.v_scheduleGo", ("Vuna.Compiler.Base.Hash.scheduleGo", "Vuna/Compiler/Base/Hash.vuna:235"));
  ("Base_dHash.v_sha256Bytes", ("Vuna.Compiler.Base.Hash.sha256Bytes", "Vuna/Compiler/Base/Hash.vuna:288"));
  ("Base_dHash.v_sha256OfString", ("Vuna.Compiler.Base.Hash.sha256OfString", "Vuna/Compiler/Base/Hash.vuna:341"));
  ("Base_dHash.v_shaInit", ("Vuna.Compiler.Base.Hash.shaInit", "Vuna/Compiler/Base/Hash.vuna:74"));
  ("Base_dHash.v_shaK", ("Vuna.Compiler.Base.Hash.shaK", "Vuna/Compiler/Base/Hash.vuna:79"));
  ("Base_dHash.v_sigma0Small", ("Vuna.Compiler.Base.Hash.sigma0Small", "Vuna/Compiler/Base/Hash.vuna:208"));
  ("Base_dHash.v_sigma1Small", ("Vuna.Compiler.Base.Hash.sigma1Small", "Vuna/Compiler/Base/Hash.vuna:212"));
  ("Base_dHash.v_wordAt", ("Vuna.Compiler.Base.Hash.wordAt", "Vuna/Compiler/Base/Hash.vuna:194"));
  ("Base_dHash.v_wordAtString", ("Vuna.Compiler.Base.Hash.wordAtString", "Vuna/Compiler/Base/Hash.vuna:312"));
  ("Base_dHash.v_zeros", ("Vuna.Compiler.Base.Hash.zeros", "Vuna/Compiler/Base/Hash.vuna:159"));
  ("Base_dHash.v_zipAdd", ("Vuna.Compiler.Base.Hash.zipAdd", "Vuna/Compiler/Base/Hash.vuna:280"));
  ("Base_dIntrinsics.v_allIntrinsics", ("Vuna.Compiler.Base.Intrinsics.allIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:1243"));
  ("Base_dIntrinsics.v_arityOfType", ("Vuna.Compiler.Base.Intrinsics.arityOfType", "Vuna/Compiler/Base/Intrinsics.vuna:56"));
  ("Base_dIntrinsics.v_assertIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.assertIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:375"));
  ("Base_dIntrinsics.v_baseIntrinsics", ("Vuna.Compiler.Base.Intrinsics.baseIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:818"));
  ("Base_dIntrinsics.v_boolFalseCtor", ("Vuna.Compiler.Base.Intrinsics.boolFalseCtor", "Vuna/Compiler/Base/Intrinsics.vuna:607"));
  ("Base_dIntrinsics.v_boolTrueCtor", ("Vuna.Compiler.Base.Intrinsics.boolTrueCtor", "Vuna/Compiler/Base/Intrinsics.vuna:603"));
  ("Base_dIntrinsics.v_boolTypeName", ("Vuna.Compiler.Base.Intrinsics.boolTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:599"));
  ("Base_dIntrinsics.v_builtinEffectErrorRunHostOf", ("Vuna.Compiler.Base.Intrinsics.builtinEffectErrorRunHostOf", "Vuna/Compiler/Base/Intrinsics.vuna:205"));
  ("Base_dIntrinsics.v_builtinEffectErrorRunHostOfRest", ("Vuna.Compiler.Base.Intrinsics.builtinEffectErrorRunHostOfRest", "Vuna/Compiler/Base/Intrinsics.vuna:208"));
  ("Base_dIntrinsics.v_builtinEffectExistsRest", ("Vuna.Compiler.Base.Intrinsics.builtinEffectExistsRest", "Vuna/Compiler/Base/Intrinsics.vuna:253"));
  ("Base_dIntrinsics.v_builtinEffectImplOf", ("Vuna.Compiler.Base.Intrinsics.builtinEffectImplOf", "Vuna/Compiler/Base/Intrinsics.vuna:196"));
  ("Base_dIntrinsics.v_builtinEffectImplOfRest", ("Vuna.Compiler.Base.Intrinsics.builtinEffectImplOfRest", "Vuna/Compiler/Base/Intrinsics.vuna:199"));
  ("Base_dIntrinsics.v_builtinEffects", ("Vuna.Compiler.Base.Intrinsics.builtinEffects", "Vuna/Compiler/Base/Intrinsics.vuna:135"));
  ("Base_dIntrinsics.v_canonicalCtorsFor", ("Vuna.Compiler.Base.Intrinsics.canonicalCtorsFor", "Vuna/Compiler/Base/Intrinsics.vuna:558"));
  ("Base_dIntrinsics.v_canonicalFamilies", ("Vuna.Compiler.Base.Intrinsics.canonicalFamilies", "Vuna/Compiler/Base/Intrinsics.vuna:686"));
  ("Base_dIntrinsics.v_canonicalReprOf", ("Vuna.Compiler.Base.Intrinsics.canonicalReprOf", "Vuna/Compiler/Base/Intrinsics.vuna:720"));
  ("Base_dIntrinsics.v_cfCtors", ("Vuna.Compiler.Base.Intrinsics.cfCtors", "Vuna/Compiler/Base/Intrinsics.vuna:678"));
  ("Base_dIntrinsics.v_cfName", ("Vuna.Compiler.Base.Intrinsics.cfName", "Vuna/Compiler/Base/Intrinsics.vuna:674"));
  ("Base_dIntrinsics.v_cfRepr", ("Vuna.Compiler.Base.Intrinsics.cfRepr", "Vuna/Compiler/Base/Intrinsics.vuna:682"));
  ("Base_dIntrinsics.v_cmpSpecializedTyNames", ("Vuna.Compiler.Base.Intrinsics.cmpSpecializedTyNames", "Vuna/Compiler/Base/Intrinsics.vuna:742"));
  ("Base_dIntrinsics.v_ctorSpellingKey", ("Vuna.Compiler.Base.Intrinsics.ctorSpellingKey", "Vuna/Compiler/Base/Intrinsics.vuna:697"));
  ("Base_dIntrinsics.v_debugLineIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.debugLineIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:317"));
  ("Base_dIntrinsics.v_debugOnIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.debugOnIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:313"));
  ("Base_dIntrinsics.v_directClassForKey", ("Vuna.Compiler.Base.Intrinsics.directClassForKey", "Vuna/Compiler/Base/Intrinsics.vuna:242"));
  ("Base_dIntrinsics.v_dispatchIdChars", ("Vuna.Compiler.Base.Intrinsics.dispatchIdChars", "Vuna/Compiler/Base/Intrinsics.vuna:1303"));
  ("Base_dIntrinsics.v_dispatchIdIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.dispatchIdIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:1294"));
  ("Base_dIntrinsics.v_dispatchIdOf", ("Vuna.Compiler.Base.Intrinsics.dispatchIdOf", "Vuna/Compiler/Base/Intrinsics.vuna:1300"));
  ("Base_dIntrinsics.v_dropLastSegment", ("Vuna.Compiler.Base.Intrinsics.dropLastSegment", "Vuna/Compiler/Base/Intrinsics.vuna:705"));
  ("Base_dIntrinsics.v_effDefaultInstance", ("Vuna.Compiler.Base.Intrinsics.effDefaultInstance", "Vuna/Compiler/Base/Intrinsics.vuna:446"));
  ("Base_dIntrinsics.v_effIntrinsics", ("Vuna.Compiler.Base.Intrinsics.effIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:948"));
  ("Base_dIntrinsics.v_effMainRunName", ("Vuna.Compiler.Base.Intrinsics.effMainRunName", "Vuna/Compiler/Base/Intrinsics.vuna:293"));
  ("Base_dIntrinsics.v_effMemberFamilyName", ("Vuna.Compiler.Base.Intrinsics.effMemberFamilyName", "Vuna/Compiler/Base/Intrinsics.vuna:420"));
  ("Base_dIntrinsics.v_effMemberHereCtor", ("Vuna.Compiler.Base.Intrinsics.effMemberHereCtor", "Vuna/Compiler/Base/Intrinsics.vuna:424"));
  ("Base_dIntrinsics.v_effMemberThereCtor", ("Vuna.Compiler.Base.Intrinsics.effMemberThereCtor", "Vuna/Compiler/Base/Intrinsics.vuna:428"));
  ("Base_dIntrinsics.v_effMkCtor", ("Vuna.Compiler.Base.Intrinsics.effMkCtor", "Vuna/Compiler/Base/Intrinsics.vuna:441"));
  ("Base_dIntrinsics.v_effNamedName", ("Vuna.Compiler.Base.Intrinsics.effNamedName", "Vuna/Compiler/Base/Intrinsics.vuna:408"));
  ("Base_dIntrinsics.v_effRowAppendName", ("Vuna.Compiler.Base.Intrinsics.effRowAppendName", "Vuna/Compiler/Base/Intrinsics.vuna:416"));
  ("Base_dIntrinsics.v_effRowConsCtor", ("Vuna.Compiler.Base.Intrinsics.effRowConsCtor", "Vuna/Compiler/Base/Intrinsics.vuna:404"));
  ("Base_dIntrinsics.v_effRowFamilyName", ("Vuna.Compiler.Base.Intrinsics.effRowFamilyName", "Vuna/Compiler/Base/Intrinsics.vuna:396"));
  ("Base_dIntrinsics.v_effRowNilCtor", ("Vuna.Compiler.Base.Intrinsics.effRowNilCtor", "Vuna/Compiler/Base/Intrinsics.vuna:400"));
  ("Base_dIntrinsics.v_effRowRemName", ("Vuna.Compiler.Base.Intrinsics.effRowRemName", "Vuna/Compiler/Base/Intrinsics.vuna:412"));
  ("Base_dIntrinsics.v_effRunName", ("Vuna.Compiler.Base.Intrinsics.effRunName", "Vuna/Compiler/Base/Intrinsics.vuna:288"));
  ("Base_dIntrinsics.v_effSendCoreIdName", ("Vuna.Compiler.Base.Intrinsics.effSendCoreIdName", "Vuna/Compiler/Base/Intrinsics.vuna:263"));
  ("Base_dIntrinsics.v_effSendCoreName", ("Vuna.Compiler.Base.Intrinsics.effSendCoreName", "Vuna/Compiler/Base/Intrinsics.vuna:260"));
  ("Base_dIntrinsics.v_effTypeName", ("Vuna.Compiler.Base.Intrinsics.effTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:432"));
  ("Base_dIntrinsics.v_effUnitTypeName", ("Vuna.Compiler.Base.Intrinsics.effUnitTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:437"));
  ("Base_dIntrinsics.v_ffiScalarNames", ("Vuna.Compiler.Base.Intrinsics.ffiScalarNames", "Vuna/Compiler/Base/Intrinsics.vuna:746"));
  ("Base_dIntrinsics.v_findCanonicalFamily", ("Vuna.Compiler.Base.Intrinsics.findCanonicalFamily", "Vuna/Compiler/Base/Intrinsics.vuna:711"));
  ("Base_dIntrinsics.v_findCanonicalFamilyGo", ("Vuna.Compiler.Base.Intrinsics.findCanonicalFamilyGo", "Vuna/Compiler/Base/Intrinsics.vuna:714"));
  ("Base_dIntrinsics.v_findIntrinsic", ("Vuna.Compiler.Base.Intrinsics.findIntrinsic", "Vuna/Compiler/Base/Intrinsics.vuna:1275"));
  ("Base_dIntrinsics.v_floatIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.floatIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:1249"));
  ("Base_dIntrinsics.v_floatIntrinsics", ("Vuna.Compiler.Base.Intrinsics.floatIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:920"));
  ("Base_dIntrinsics.v_floatTypeName", ("Vuna.Compiler.Base.Intrinsics.floatTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:595"));
  ("Base_dIntrinsics.v_fromFloatMethodName", ("Vuna.Compiler.Base.Intrinsics.fromFloatMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:784"));
  ("Base_dIntrinsics.v_fromFloatTypeName", ("Vuna.Compiler.Base.Intrinsics.fromFloatTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:780"));
  ("Base_dIntrinsics.v_fromIntMethodName", ("Vuna.Compiler.Base.Intrinsics.fromIntMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:776"));
  ("Base_dIntrinsics.v_fromIntTypeName", ("Vuna.Compiler.Base.Intrinsics.fromIntTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:772"));
  ("Base_dIntrinsics.v_fromStringMethodName", ("Vuna.Compiler.Base.Intrinsics.fromStringMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:768"));
  ("Base_dIntrinsics.v_fromStringTypeName", ("Vuna.Compiler.Base.Intrinsics.fromStringTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:764"));
  ("Base_dIntrinsics.v_hasFieldGetFieldName", ("Vuna.Compiler.Base.Intrinsics.hasFieldGetFieldName", "Vuna/Compiler/Base/Intrinsics.vuna:648"));
  ("Base_dIntrinsics.v_hasFieldLabelName", ("Vuna.Compiler.Base.Intrinsics.hasFieldLabelName", "Vuna/Compiler/Base/Intrinsics.vuna:640"));
  ("Base_dIntrinsics.v_hasFieldMethodName", ("Vuna.Compiler.Base.Intrinsics.hasFieldMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:652"));
  ("Base_dIntrinsics.v_hasFieldTraitName", ("Vuna.Compiler.Base.Intrinsics.hasFieldTraitName", "Vuna/Compiler/Base/Intrinsics.vuna:644"));
  ("Base_dIntrinsics.v_hostClassOf", ("Vuna.Compiler.Base.Intrinsics.hostClassOf", "Vuna/Compiler/Base/Intrinsics.vuna:214"));
  ("Base_dIntrinsics.v_hostClassOfRest", ("Vuna.Compiler.Base.Intrinsics.hostClassOfRest", "Vuna/Compiler/Base/Intrinsics.vuna:217"));
  ("Base_dIntrinsics.v_hostClassOfSendKey", ("Vuna.Compiler.Base.Intrinsics.hostClassOfSendKey", "Vuna/Compiler/Base/Intrinsics.vuna:229"));
  ("Base_dIntrinsics.v_hostClassOfSendKeyRest", ("Vuna.Compiler.Base.Intrinsics.hostClassOfSendKeyRest", "Vuna/Compiler/Base/Intrinsics.vuna:232"));
  ("Base_dIntrinsics.v_intTypeName", ("Vuna.Compiler.Base.Intrinsics.intTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:587"));
  ("Base_dIntrinsics.v_internalIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.internalIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:1239"));
  ("Base_dIntrinsics.v_internalIntrinsics", ("Vuna.Compiler.Base.Intrinsics.internalIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:1210"));
  ("Base_dIntrinsics.v_interpMethodName", ("Vuna.Compiler.Base.Intrinsics.interpMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:759"));
  ("Base_dIntrinsics.v_interpTypeName", ("Vuna.Compiler.Base.Intrinsics.interpTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:755"));
  ("Base_dIntrinsics.v_intrinsicArity", ("Vuna.Compiler.Base.Intrinsics.intrinsicArity", "Vuna/Compiler/Base/Intrinsics.vuna:565"));
  ("Base_dIntrinsics.v_intrinsicName", ("Vuna.Compiler.Base.Intrinsics.intrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:545"));
  ("Base_dIntrinsics.v_intrinsicReturnsEff", ("Vuna.Compiler.Base.Intrinsics.intrinsicReturnsEff", "Vuna/Compiler/Base/Intrinsics.vuna:571"));
  ("Base_dIntrinsics.v_intrinsicSignature", ("Vuna.Compiler.Base.Intrinsics.intrinsicSignature", "Vuna/Compiler/Base/Intrinsics.vuna:549"));
  ("Base_dIntrinsics.v_intrinsicTbl", ("Vuna.Compiler.Base.Intrinsics.intrinsicTbl", "Vuna/Compiler/Base/Intrinsics.vuna:1270"));
  ("Base_dIntrinsics.v_intrinsicVisible", ("Vuna.Compiler.Base.Intrinsics.intrinsicVisible", "Vuna/Compiler/Base/Intrinsics.vuna:553"));
  ("Base_dIntrinsics.v_isBoolCanonical", ("Vuna.Compiler.Base.Intrinsics.isBoolCanonical", "Vuna/Compiler/Base/Intrinsics.vuna:735"));
  ("Base_dIntrinsics.v_isBuiltinEffectTag", ("Vuna.Compiler.Base.Intrinsics.isBuiltinEffectTag", "Vuna/Compiler/Base/Intrinsics.vuna:250"));
  ("Base_dIntrinsics.v_isDebugOnlyName", ("Vuna.Compiler.Base.Intrinsics.isDebugOnlyName", "Vuna/Compiler/Base/Intrinsics.vuna:383"));
  ("Base_dIntrinsics.v_isFfiScalarName", ("Vuna.Compiler.Base.Intrinsics.isFfiScalarName", "Vuna/Compiler/Base/Intrinsics.vuna:750"));
  ("Base_dIntrinsics.v_isIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.isIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:1279"));
  ("Base_dIntrinsics.v_isIntrinsicTypeName", ("Vuna.Compiler.Base.Intrinsics.isIntrinsicTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:624"));
  ("Base_dIntrinsics.v_isSendCoreName", ("Vuna.Compiler.Base.Intrinsics.isSendCoreName", "Vuna/Compiler/Base/Intrinsics.vuna:267"));
  ("Base_dIntrinsics.v_isTypeConstructorName", ("Vuna.Compiler.Base.Intrinsics.isTypeConstructorName", "Vuna/Compiler/Base/Intrinsics.vuna:106"));
  ("Base_dIntrinsics.v_isUnboxedCanonical", ("Vuna.Compiler.Base.Intrinsics.isUnboxedCanonical", "Vuna/Compiler/Base/Intrinsics.vuna:727"));
  ("Base_dIntrinsics.v_listConsCtor", ("Vuna.Compiler.Base.Intrinsics.listConsCtor", "Vuna/Compiler/Base/Intrinsics.vuna:636"));
  ("Base_dIntrinsics.v_listFamilyName", ("Vuna.Compiler.Base.Intrinsics.listFamilyName", "Vuna/Compiler/Base/Intrinsics.vuna:628"));
  ("Base_dIntrinsics.v_listNilCtor", ("Vuna.Compiler.Base.Intrinsics.listNilCtor", "Vuna/Compiler/Base/Intrinsics.vuna:632"));
  ("Base_dIntrinsics.v_mainShowDefName", ("Vuna.Compiler.Base.Intrinsics.mainShowDefName", "Vuna/Compiler/Base/Intrinsics.vuna:284"));
  ("Base_dIntrinsics.v_natSuccCtor", ("Vuna.Compiler.Base.Intrinsics.natSuccCtor", "Vuna/Compiler/Base/Intrinsics.vuna:620"));
  ("Base_dIntrinsics.v_natTypeName", ("Vuna.Compiler.Base.Intrinsics.natTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:612"));
  ("Base_dIntrinsics.v_natZeroCtor", ("Vuna.Compiler.Base.Intrinsics.natZeroCtor", "Vuna/Compiler/Base/Intrinsics.vuna:616"));
  ("Base_dIntrinsics.v_obsCounterIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsCounterIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:351"));
  ("Base_dIntrinsics.v_obsIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.obsIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:1223"));
  ("Base_dIntrinsics.v_obsLevelIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsLevelIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:332"));
  ("Base_dIntrinsics.v_obsLogIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsLogIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:347"));
  ("Base_dIntrinsics.v_obsMarkIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsMarkIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:355"));
  ("Base_dIntrinsics.v_obsSampleStartIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSampleStartIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:367"));
  ("Base_dIntrinsics.v_obsSampleStopIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSampleStopIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:371"));
  ("Base_dIntrinsics.v_obsSpanBeginIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSpanBeginIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:359"));
  ("Base_dIntrinsics.v_obsSpanEndIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSpanEndIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:363"));
  ("Base_dIntrinsics.v_obsSpanIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSpanIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:336"));
  ("Base_dIntrinsics.v_obsSpanLabIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSpanLabIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:343"));
  ("Base_dIntrinsics.v_preludeTypeNames", ("Vuna.Compiler.Base.Intrinsics.preludeTypeNames", "Vuna/Compiler/Base/Intrinsics.vuna:450"));
  ("Base_dIntrinsics.v_preludeValueNames", ("Vuna.Compiler.Base.Intrinsics.preludeValueNames", "Vuna/Compiler/Base/Intrinsics.vuna:1290"));
  ("Base_dIntrinsics.v_primEffBind1Name", ("Vuna.Compiler.Base.Intrinsics.primEffBind1Name", "Vuna/Compiler/Base/Intrinsics.vuna:272"));
  ("Base_dIntrinsics.v_primEraseName", ("Vuna.Compiler.Base.Intrinsics.primEraseName", "Vuna/Compiler/Base/Intrinsics.vuna:278"));
  ("Base_dIntrinsics.v_strTypeName", ("Vuna.Compiler.Base.Intrinsics.strTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:591"));
  ("Base_dIntrinsics.v_todoIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.todoIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:379"));
  ("Base_dIntrinsics.v_traceIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.traceIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:1217"));
  ("Base_dIntrinsics.v_typeIntrinsicArities", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicArities", "Vuna/Compiler/Base/Intrinsics.vuna:84"));
  ("Base_dIntrinsics.v_typeIntrinsicArityOf", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicArityOf", "Vuna/Compiler/Base/Intrinsics.vuna:88"));
  ("Base_dIntrinsics.v_typeIntrinsicArityOfRest", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicArityOfRest", "Vuna/Compiler/Base/Intrinsics.vuna:92"));
  ("Base_dIntrinsics.v_typeIntrinsicCtorArity", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicCtorArity", "Vuna/Compiler/Base/Intrinsics.vuna:80"));
  ("Base_dIntrinsics.v_typeIntrinsicCtorName", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicCtorName", "Vuna/Compiler/Base/Intrinsics.vuna:76"));
  ("Base_dIntrinsics.v_typeIntrinsicCtorNames", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicCtorNames", "Vuna/Compiler/Base/Intrinsics.vuna:101"));
  ("Base_dIntrinsics.v_typeIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:583"));
  ("Base_dIntrinsics.v_typeReturnsEff", ("Vuna.Compiler.Base.Intrinsics.typeReturnsEff", "Vuna/Compiler/Base/Intrinsics.vuna:575"));
  ("Base_dIntrinsics.v_userIntrinsics", ("Vuna.Compiler.Base.Intrinsics.userIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:1286"));
  ("Base_dObs.v_obsCheck", ("Vuna.Compiler.Base.Obs.obsCheck", "Vuna/Compiler/Base/Obs.vuna:27"));
  ("Base_dObs.v_obsCountEff", ("Vuna.Compiler.Base.Obs.obsCountEff", "Vuna/Compiler/Base/Obs.vuna:44"));
  ("Base_dObs.v_obsDefCheck", ("Vuna.Compiler.Base.Obs.obsDefCheck", "Vuna/Compiler/Base/Obs.vuna:33"));
  ("Base_dObs.v_obsMarkEff", ("Vuna.Compiler.Base.Obs.obsMarkEff", "Vuna/Compiler/Base/Obs.vuna:38"));
  ("Base_dSource.v__usimilarName", ("Vuna.Compiler.Base.Source._similarName", "Vuna/Compiler/Base/Source.vuna:261"));
  ("Base_dSource.v_baseName", ("Vuna.Compiler.Base.Source.baseName", "Vuna/Compiler/Base/Source.vuna:231"));
  ("Base_dSource.v_containsDot", ("Vuna.Compiler.Base.Source.containsDot", "Vuna/Compiler/Base/Source.vuna:135"));
  ("Base_dSource.v_dotsRest", ("Vuna.Compiler.Base.Source.dotsRest", "Vuna/Compiler/Base/Source.vuna:176"));
  ("Base_dSource.v_dropPastSlash", ("Vuna.Compiler.Base.Source.dropPastSlash", "Vuna/Compiler/Base/Source.vuna:249"));
  ("Base_dSource.v_isSpanEmpty", ("Vuna.Compiler.Base.Source.isSpanEmpty", "Vuna/Compiler/Base/Source.vuna:98"));
  ("Base_dSource.v_joinArrows", ("Vuna.Compiler.Base.Source.joinArrows", "Vuna/Compiler/Base/Source.vuna:211"));
  ("Base_dSource.v_joinDots", ("Vuna.Compiler.Base.Source.joinDots", "Vuna/Compiler/Base/Source.vuna:168"));
  ("Base_dSource.v_joinDotsParts", ("Vuna.Compiler.Base.Source.joinDotsParts", "Vuna/Compiler/Base/Source.vuna:172"));
  ("Base_dSource.v_joinSlashes", ("Vuna.Compiler.Base.Source.joinSlashes", "Vuna/Compiler/Base/Source.vuna:205"));
  ("Base_dSource.v_lastSeg", ("Vuna.Compiler.Base.Source.lastSeg", "Vuna/Compiler/Base/Source.vuna:184"));
  ("Base_dSource.v_lastSegGo", ("Vuna.Compiler.Base.Source.lastSegGo", "Vuna/Compiler/Base/Source.vuna:187"));
  ("Base_dSource.v_lengthDiffLE", ("Vuna.Compiler.Base.Source.lengthDiffLE", "Vuna/Compiler/Base/Source.vuna:283"));
  ("Base_dSource.v_memChar", ("Vuna.Compiler.Base.Source.memChar", "Vuna/Compiler/Base/Source.vuna:122"));
  ("Base_dSource.v_parentOfPath", ("Vuna.Compiler.Base.Source.parentOfPath", "Vuna/Compiler/Base/Source.vuna:236"));
  ("Base_dSource.v_posCol", ("Vuna.Compiler.Base.Source.posCol", "Vuna/Compiler/Base/Source.vuna:50"));
  ("Base_dSource.v_posEndOffset", ("Vuna.Compiler.Base.Source.posEndOffset", "Vuna/Compiler/Base/Source.vuna:58"));
  ("Base_dSource.v_posLine", ("Vuna.Compiler.Base.Source.posLine", "Vuna/Compiler/Base/Source.vuna:46"));
  ("Base_dSource.v_posOffset", ("Vuna.Compiler.Base.Source.posOffset", "Vuna/Compiler/Base/Source.vuna:54"));
  ("Base_dSource.v_prefixLen2", ("Vuna.Compiler.Base.Source.prefixLen2", "Vuna/Compiler/Base/Source.vuna:277"));
  ("Base_dSource.v_prefixOfName", ("Vuna.Compiler.Base.Source.prefixOfName", "Vuna/Compiler/Base/Source.vuna:199"));
  ("Base_dSource.v_scanFor", ("Vuna.Compiler.Base.Source.scanFor", "Vuna/Compiler/Base/Source.vuna:128"));
  ("Base_dSource.v_showSpanLoc", ("Vuna.Compiler.Base.Source.showSpanLoc", "Vuna/Compiler/Base/Source.vuna:90"));
  ("Base_dSource.v_spanAtName", ("Vuna.Compiler.Base.Source.spanAtName", "Vuna/Compiler/Base/Source.vuna:105"));
  ("Base_dSource.v_spanEmpty", ("Vuna.Compiler.Base.Source.spanEmpty", "Vuna/Compiler/Base/Source.vuna:94"));
  ("Base_dSource.v_spanEndCol", ("Vuna.Compiler.Base.Source.spanEndCol", "Vuna/Compiler/Base/Source.vuna:74"));
  ("Base_dSource.v_spanEndLine", ("Vuna.Compiler.Base.Source.spanEndLine", "Vuna/Compiler/Base/Source.vuna:70"));
  ("Base_dSource.v_spanEndOffset", ("Vuna.Compiler.Base.Source.spanEndOffset", "Vuna/Compiler/Base/Source.vuna:82"));
  ("Base_dSource.v_spanFile", ("Vuna.Compiler.Base.Source.spanFile", "Vuna/Compiler/Base/Source.vuna:86"));
  ("Base_dSource.v_spanStartCol", ("Vuna.Compiler.Base.Source.spanStartCol", "Vuna/Compiler/Base/Source.vuna:66"));
  ("Base_dSource.v_spanStartLine", ("Vuna.Compiler.Base.Source.spanStartLine", "Vuna/Compiler/Base/Source.vuna:62"));
  ("Base_dSource.v_spanStartOffset", ("Vuna.Compiler.Base.Source.spanStartOffset", "Vuna/Compiler/Base/Source.vuna:78"));
  ("Base_dSource.v_splitLastDot", ("Vuna.Compiler.Base.Source.splitLastDot", "Vuna/Compiler/Base/Source.vuna:161"));
  ("Base_dSource.v_splitOnChar", ("Vuna.Compiler.Base.Source.splitOnChar", "Vuna/Compiler/Base/Source.vuna:143"));
  ("Base_dSource.v_splitOnCharGo", ("Vuna.Compiler.Base.Source.splitOnCharGo", "Vuna/Compiler/Base/Source.vuna:148"));
  ("Base_dSource.v_splitOnDot", ("Vuna.Compiler.Base.Source.splitOnDot", "Vuna/Compiler/Base/Source.vuna:139"));
  ("Base_dSource.v_splitPath", ("Vuna.Compiler.Base.Source.splitPath", "Vuna/Compiler/Base/Source.vuna:218"));
  ("Base_dSource.v_splitPathChars", ("Vuna.Compiler.Base.Source.splitPathChars", "Vuna/Compiler/Base/Source.vuna:222"));
  ("Base_dSource.v_suggest", ("Vuna.Compiler.Base.Source.suggest", "Vuna/Compiler/Base/Source.vuna:254"));
  ("Base_dStore.v_breakFirstNewline", ("Vuna.Compiler.Base.Store.breakFirstNewline", "Vuna/Compiler/Base/Store.vuna:88"));
  ("Base_dStore.v_claimAt", ("Vuna.Compiler.Base.Store.claimAt", "Vuna/Compiler/Base/Store.vuna:468"));
  ("Base_dStore.v_dirReady", ("Vuna.Compiler.Base.Store.dirReady", "Vuna/Compiler/Base/Store.vuna:358"));
  ("Base_dStore.v_dirUnder", ("Vuna.Compiler.Base.Store.dirUnder", "Vuna/Compiler/Base/Store.vuna:183"));
  ("Base_dStore.v_fCodecOf", ("Vuna.Compiler.Base.Store.fCodecOf", "Vuna/Compiler/Base/Store.vuna:59"));
  ("Base_dStore.v_fPayloadOf", ("Vuna.Compiler.Base.Store.fPayloadOf", "Vuna/Compiler/Base/Store.vuna:62"));
  ("Base_dStore.v_fTagOf", ("Vuna.Compiler.Base.Store.fTagOf", "Vuna/Compiler/Base/Store.vuna:56"));
  ("Base_dStore.v_frameHeader", ("Vuna.Compiler.Base.Store.frameHeader", "Vuna/Compiler/Base/Store.vuna:66"));
  ("Base_dStore.v_frameSplit", ("Vuna.Compiler.Base.Store.frameSplit", "Vuna/Compiler/Base/Store.vuna:99"));
  ("Base_dStore.v_headerDigestOf", ("Vuna.Compiler.Base.Store.headerDigestOf", "Vuna/Compiler/Base/Store.vuna:131"));
  ("Base_dStore.v_headerFields", ("Vuna.Compiler.Base.Store.headerFields", "Vuna/Compiler/Base/Store.vuna:82"));
  ("Base_dStore.v_headerOk", ("Vuna.Compiler.Base.Store.headerOk", "Vuna/Compiler/Base/Store.vuna:113"));
  ("Base_dStore.v_homeStoreRootEff", ("Vuna.Compiler.Base.Store.homeStoreRootEff", "Vuna/Compiler/Base/Store.vuna:189"));
  ("Base_dStore.v_insertRootLine", ("Vuna.Compiler.Base.Store.insertRootLine", "Vuna/Compiler/Base/Store.vuna:564"));
  ("Base_dStore.v_mergeRootLines", ("Vuna.Compiler.Base.Store.mergeRootLines", "Vuna/Compiler/Base/Store.vuna:567"));
  ("Base_dStore.v_objectPathIn", ("Vuna.Compiler.Base.Store.objectPathIn", "Vuna/Compiler/Base/Store.vuna:373"));
  ("Base_dStore.v_projectPathFileName", ("Vuna.Compiler.Base.Store.projectPathFileName", "Vuna/Compiler/Base/Store.vuna:573"));
  ("Base_dStore.v_scratchStale", ("Vuna.Compiler.Base.Store.scratchStale", "Vuna/Compiler/Base/Store.vuna:504"));
  ("Base_dStore.v_scratchStaleSec", ("Vuna.Compiler.Base.Store.scratchStaleSec", "Vuna/Compiler/Base/Store.vuna:501"));
  ("Base_dStore.v_storeCacheBaseEff", ("Vuna.Compiler.Base.Store.storeCacheBaseEff", "Vuna/Compiler/Base/Store.vuna:204"));
  ("Base_dStore.v_storeDataRootEff", ("Vuna.Compiler.Base.Store.storeDataRootEff", "Vuna/Compiler/Base/Store.vuna:173"));
  ("Base_dStore.v_storeDecode", ("Vuna.Compiler.Base.Store.storeDecode", "Vuna/Compiler/Base/Store.vuna:138"));
  ("Base_dStore.v_storeDecodeAs", ("Vuna.Compiler.Base.Store.storeDecodeAs", "Vuna/Compiler/Base/Store.vuna:155"));
  ("Base_dStore.v_storeDropPastSlash", ("Vuna.Compiler.Base.Store.storeDropPastSlash", "Vuna/Compiler/Base/Store.vuna:317"));
  ("Base_dStore.v_storeEncode", ("Vuna.Compiler.Base.Store.storeEncode", "Vuna/Compiler/Base/Store.vuna:70"));
  ("Base_dStore.v_storeEncodeAs", ("Vuna.Compiler.Base.Store.storeEncodeAs", "Vuna/Compiler/Base/Store.vuna:78"));
  ("Base_dStore.v_storeEnsureDirEff", ("Vuna.Compiler.Base.Store.storeEnsureDirEff", "Vuna/Compiler/Base/Store.vuna:277"));
  ("Base_dStore.v_storeEnsureDirFuel", ("Vuna.Compiler.Base.Store.storeEnsureDirFuel", "Vuna/Compiler/Base/Store.vuna:285"));
  ("Base_dStore.v_storeFileExistsEff", ("Vuna.Compiler.Base.Store.storeFileExistsEff", "Vuna/Compiler/Base/Store.vuna:270"));
  ("Base_dStore.v_storeMagic", ("Vuna.Compiler.Base.Store.storeMagic", "Vuna/Compiler/Base/Store.vuna:47"));
  ("Base_dStore.v_storeObjectExistsEff", ("Vuna.Compiler.Base.Store.storeObjectExistsEff", "Vuna/Compiler/Base/Store.vuna:383"));
  ("Base_dStore.v_storeObjectListEff", ("Vuna.Compiler.Base.Store.storeObjectListEff", "Vuna/Compiler/Base/Store.vuna:410"));
  ("Base_dStore.v_storeObjectPathEff", ("Vuna.Compiler.Base.Store.storeObjectPathEff", "Vuna/Compiler/Base/Store.vuna:376"));
  ("Base_dStore.v_storeObjectReadEff", ("Vuna.Compiler.Base.Store.storeObjectReadEff", "Vuna/Compiler/Base/Store.vuna:390"));
  ("Base_dStore.v_storeObjectRemoveEff", ("Vuna.Compiler.Base.Store.storeObjectRemoveEff", "Vuna/Compiler/Base/Store.vuna:421"));
  ("Base_dStore.v_storeObjectTag", ("Vuna.Compiler.Base.Store.storeObjectTag", "Vuna/Compiler/Base/Store.vuna:370"));
  ("Base_dStore.v_storeObjectWriteEff", ("Vuna.Compiler.Base.Store.storeObjectWriteEff", "Vuna/Compiler/Base/Store.vuna:399"));
  ("Base_dStore.v_storeParentOf", ("Vuna.Compiler.Base.Store.storeParentOf", "Vuna/Compiler/Base/Store.vuna:301"));
  ("Base_dStore.v_storeParentPathOf", ("Vuna.Compiler.Base.Store.storeParentPathOf", "Vuna/Compiler/Base/Store.vuna:314"));
  ("Base_dStore.v_storeProjectPathEff", ("Vuna.Compiler.Base.Store.storeProjectPathEff", "Vuna/Compiler/Base/Store.vuna:594"));
  ("Base_dStore.v_storeProjectPathRecordEff", ("Vuna.Compiler.Base.Store.storeProjectPathRecordEff", "Vuna/Compiler/Base/Store.vuna:577"));
  ("Base_dStore.v_storeReadAsEff", ("Vuna.Compiler.Base.Store.storeReadAsEff", "Vuna/Compiler/Base/Store.vuna:220"));
  ("Base_dStore.v_storeReadEff", ("Vuna.Compiler.Base.Store.storeReadEff", "Vuna/Compiler/Base/Store.vuna:208"));
  ("Base_dStore.v_storeRemoveEff", ("Vuna.Compiler.Base.Store.storeRemoveEff", "Vuna/Compiler/Base/Store.vuna:273"));
  ("Base_dStore.v_storeRootAppendEff", ("Vuna.Compiler.Base.Store.storeRootAppendEff", "Vuna/Compiler/Base/Store.vuna:611"));
  ("Base_dStore.v_storeRootEff", ("Vuna.Compiler.Base.Store.storeRootEff", "Vuna/Compiler/Base/Store.vuna:340"));
  ("Base_dStore.v_storeRootLoadEff", ("Vuna.Compiler.Base.Store.storeRootLoadEff", "Vuna/Compiler/Base/Store.vuna:629"));
  ("Base_dStore.v_storeRootProjectListEff", ("Vuna.Compiler.Base.Store.storeRootProjectListEff", "Vuna/Compiler/Base/Store.vuna:642"));
  ("Base_dStore.v_storeRootReadyEff", ("Vuna.Compiler.Base.Store.storeRootReadyEff", "Vuna/Compiler/Base/Store.vuna:344"));
  ("Base_dStore.v_storeRootRemoveEff", ("Vuna.Compiler.Base.Store.storeRootRemoveEff", "Vuna/Compiler/Base/Store.vuna:653"));
  ("Base_dStore.v_storeRootsPathEff", ("Vuna.Compiler.Base.Store.storeRootsPathEff", "Vuna/Compiler/Base/Store.vuna:557"));
  ("Base_dStore.v_storeScratchClaimEff", ("Vuna.Compiler.Base.Store.storeScratchClaimEff", "Vuna/Compiler/Base/Store.vuna:512"));
  ("Base_dStore.v_storeScratchDropEff", ("Vuna.Compiler.Base.Store.storeScratchDropEff", "Vuna/Compiler/Base/Store.vuna:534"));
  ("Base_dStore.v_storeScratchPathEff", ("Vuna.Compiler.Base.Store.storeScratchPathEff", "Vuna/Compiler/Base/Store.vuna:494"));
  ("Base_dStore.v_storeScratchPathIn", ("Vuna.Compiler.Base.Store.storeScratchPathIn", "Vuna/Compiler/Base/Store.vuna:491"));
  ("Base_dStore.v_storeScratchPathOfClaim", ("Vuna.Compiler.Base.Store.storeScratchPathOfClaim", "Vuna/Compiler/Base/Store.vuna:530"));
  ("Base_dStore.v_storeViewLockEff", ("Vuna.Compiler.Base.Store.storeViewLockEff", "Vuna/Compiler/Base/Store.vuna:458"));
  ("Base_dStore.v_storeViewPathEff", ("Vuna.Compiler.Base.Store.storeViewPathEff", "Vuna/Compiler/Base/Store.vuna:435"));
  ("Base_dStore.v_storeViewPublishEff", ("Vuna.Compiler.Base.Store.storeViewPublishEff", "Vuna/Compiler/Base/Store.vuna:541"));
  ("Base_dStore.v_storeViewUnlockEff", ("Vuna.Compiler.Base.Store.storeViewUnlockEff", "Vuna/Compiler/Base/Store.vuna:484"));
  ("Base_dStore.v_storeViewValidEff", ("Vuna.Compiler.Base.Store.storeViewValidEff", "Vuna/Compiler/Base/Store.vuna:441"));
  ("Base_dStore.v_storeWriteAsEff", ("Vuna.Compiler.Base.Store.storeWriteAsEff", "Vuna/Compiler/Base/Store.vuna:238"));
  ("Base_dStore.v_storeWriteEff", ("Vuna.Compiler.Base.Store.storeWriteEff", "Vuna/Compiler/Base/Store.vuna:234"));
  ("Base_dStore.v_storeWriteIfChangedAsEff", ("Vuna.Compiler.Base.Store.storeWriteIfChangedAsEff", "Vuna/Compiler/Base/Store.vuna:257"));
  ("Base_dStore.v_storeWriteIfChangedEff", ("Vuna.Compiler.Base.Store.storeWriteIfChangedEff", "Vuna/Compiler/Base/Store.vuna:243"));
  ("Base_dStore.v_tmpStoreRootEff", ("Vuna.Compiler.Base.Store.tmpStoreRootEff", "Vuna/Compiler/Base/Store.vuna:196"));
  ("Base_dStore.v_writeRootFiles", ("Vuna.Compiler.Base.Store.writeRootFiles", "Vuna/Compiler/Base/Store.vuna:619"));
  ("Base_dVersion.v_vunaVersion", ("Vuna.Compiler.Base.Version.vunaVersion", "Vuna/Compiler/Base/Version.vuna:12"));
  ("Codegen_dAssembly.v_addDep", ("Vuna.Compiler.Codegen.Assembly.addDep", "Vuna/Compiler/Codegen/Assembly.vuna:93"));
  ("Codegen_dAssembly.v_checkDefsForBuild", ("Vuna.Compiler.Codegen.Assembly.checkDefsForBuild", "Vuna/Compiler/Codegen/Assembly.vuna:77"));
  ("Codegen_dAssembly.v_checkGroupsForBuild", ("Vuna.Compiler.Codegen.Assembly.checkGroupsForBuild", "Vuna/Compiler/Codegen/Assembly.vuna:70"));
  ("Codegen_dAssembly.v_checkUnitParts", ("Vuna.Compiler.Codegen.Assembly.checkUnitParts", "Vuna/Compiler/Codegen/Assembly.vuna:67"));
  ("Codegen_dAssembly.v_genTypePart", ("Vuna.Compiler.Codegen.Assembly.genTypePart", "Vuna/Compiler/Codegen/Assembly.vuna:89"));
  ("Codegen_dAssembly.v_genUnitParts", ("Vuna.Compiler.Codegen.Assembly.genUnitParts", "Vuna/Compiler/Codegen/Assembly.vuna:46"));
  ("Codegen_dAssembly.v_genUnitPartsWith", ("Vuna.Compiler.Codegen.Assembly.genUnitPartsWith", "Vuna/Compiler/Codegen/Assembly.vuna:49"));
  ("Codegen_dAssembly.v_genUnitText", ("Vuna.Compiler.Codegen.Assembly.genUnitText", "Vuna/Compiler/Codegen/Assembly.vuna:101"));
  ("Codegen_dAssembly.v_listBridgeFor", ("Vuna.Compiler.Codegen.Assembly.listBridgeFor", "Vuna/Compiler/Codegen/Assembly.vuna:112"));
  ("Codegen_dAssembly.v_openHeader", ("Vuna.Compiler.Codegen.Assembly.openHeader", "Vuna/Compiler/Codegen/Assembly.vuna:108"));
  ("Codegen_dAssembly.v_runtimeUnit", ("Vuna.Compiler.Codegen.Assembly.runtimeUnit", "Vuna/Compiler/Codegen/Assembly.vuna:24"));
  ("Codegen_dAssembly.v_typeRefDeps", ("Vuna.Compiler.Codegen.Assembly.typeRefDeps", "Vuna/Compiler/Codegen/Assembly.vuna:118"));
  ("Codegen_dAssembly.v_uniqueDeps", ("Vuna.Compiler.Codegen.Assembly.uniqueDeps", "Vuna/Compiler/Codegen/Assembly.vuna:96"));
  ("Codegen_dAssembly.v_unitPartsDeps", ("Vuna.Compiler.Codegen.Assembly.unitPartsDeps", "Vuna/Compiler/Codegen/Assembly.vuna:36"));
  ("Codegen_dDecl.v_boolText", ("Vuna.Compiler.Codegen.Decl.boolText", "Vuna/Compiler/Codegen/Decl.vuna:74"));
  ("Codegen_dDecl.v_ctorOcamlName", ("Vuna.Compiler.Codegen.Decl.ctorOcamlName", "Vuna/Compiler/Codegen/Decl.vuna:83"));
  ("Codegen_dDecl.v_irBinderText", ("Vuna.Compiler.Codegen.Decl.irBinderText", "Vuna/Compiler/Codegen/Decl.vuna:218"));
  ("Codegen_dDecl.v_irTyDeclDeps", ("Vuna.Compiler.Codegen.Decl.irTyDeclDeps", "Vuna/Compiler/Codegen/Decl.vuna:264"));
  ("Codegen_dDecl.v_irTyDepsGo", ("Vuna.Compiler.Codegen.Decl.irTyDepsGo", "Vuna/Compiler/Codegen/Decl.vuna:279"));
  ("Codegen_dDecl.v_irTyGlobalNames", ("Vuna.Compiler.Codegen.Decl.irTyGlobalNames", "Vuna/Compiler/Codegen/Decl.vuna:267"));
  ("Codegen_dDecl.v_irTyText", ("Vuna.Compiler.Codegen.Decl.irTyText", "Vuna/Compiler/Codegen/Decl.vuna:224"));
  ("Codegen_dDecl.v_irTypeDeclsText", ("Vuna.Compiler.Codegen.Decl.irTypeDeclsText", "Vuna/Compiler/Codegen/Decl.vuna:260"));
  ("Codegen_dDecl.v_isAsciiAlphaNum", ("Vuna.Compiler.Codegen.Decl.isAsciiAlphaNum", "Vuna/Compiler/Codegen/Decl.vuna:31"));
  ("Codegen_dDecl.v_localName", ("Vuna.Compiler.Codegen.Decl.localName", "Vuna/Compiler/Codegen/Decl.vuna:66"));
  ("Codegen_dDecl.v_noQual", ("Vuna.Compiler.Codegen.Decl.noQual", "Vuna/Compiler/Codegen/Decl.vuna:110"));
  ("Codegen_dDecl.v_ocamlBinderName", ("Vuna.Compiler.Codegen.Decl.ocamlBinderName", "Vuna/Compiler/Codegen/Decl.vuna:205"));
  ("Codegen_dDecl.v_ocamlEscapeChar", ("Vuna.Compiler.Codegen.Decl.ocamlEscapeChar", "Vuna/Compiler/Codegen/Decl.vuna:48"));
  ("Codegen_dDecl.v_ocamlPad3", ("Vuna.Compiler.Codegen.Decl.ocamlPad3", "Vuna/Compiler/Codegen/Decl.vuna:45"));
  ("Codegen_dDecl.v_ocamlReservedWords", ("Vuna.Compiler.Codegen.Decl.ocamlReservedWords", "Vuna/Compiler/Codegen/Decl.vuna:144"));
  ("Codegen_dDecl.v_ocamlString", ("Vuna.Compiler.Codegen.Decl.ocamlString", "Vuna/Compiler/Codegen/Decl.vuna:56"));
  ("Codegen_dDecl.v_qualCtorText", ("Vuna.Compiler.Codegen.Decl.qualCtorText", "Vuna/Compiler/Codegen/Decl.vuna:134"));
  ("Codegen_dDecl.v_qualFamOf", ("Vuna.Compiler.Codegen.Decl.qualFamOf", "Vuna/Compiler/Codegen/Decl.vuna:228"));
  ("Codegen_dDecl.v_qualOf", ("Vuna.Compiler.Codegen.Decl.qualOf", "Vuna/Compiler/Codegen/Decl.vuna:122"));
  ("Codegen_dDecl.v_qualPrefix", ("Vuna.Compiler.Codegen.Decl.qualPrefix", "Vuna/Compiler/Codegen/Decl.vuna:126"));
  ("Codegen_dDecl.v_qualTypeText", ("Vuna.Compiler.Codegen.Decl.qualTypeText", "Vuna/Compiler/Codegen/Decl.vuna:138"));
  ("Codegen_dDecl.v_qualValueText", ("Vuna.Compiler.Codegen.Decl.qualValueText", "Vuna/Compiler/Codegen/Decl.vuna:131"));
  ("Codegen_dDecl.v_recordFieldLabel", ("Vuna.Compiler.Codegen.Decl.recordFieldLabel", "Vuna/Compiler/Codegen/Decl.vuna:88"));
  ("Codegen_dDecl.v_recordFieldsOf", ("Vuna.Compiler.Codegen.Decl.recordFieldsOf", "Vuna/Compiler/Codegen/Decl.vuna:252"));
  ("Codegen_dDecl.v_sanitizeChar", ("Vuna.Compiler.Codegen.Decl.sanitizeChar", "Vuna/Compiler/Codegen/Decl.vuna:35"));
  ("Codegen_dDecl.v_sanitizeName", ("Vuna.Compiler.Codegen.Decl.sanitizeName", "Vuna/Compiler/Codegen/Decl.vuna:42"));
  ("Codegen_dDecl.v_toOCtor", ("Vuna.Compiler.Codegen.Decl.toOCtor", "Vuna/Compiler/Codegen/Decl.vuna:249"));
  ("Codegen_dDecl.v_toODecl", ("Vuna.Compiler.Codegen.Decl.toODecl", "Vuna/Compiler/Codegen/Decl.vuna:243"));
  ("Codegen_dDecl.v_toOTy", ("Vuna.Compiler.Codegen.Decl.toOTy", "Vuna/Compiler/Codegen/Decl.vuna:231"));
  ("Codegen_dDecl.v_typeName", ("Vuna.Compiler.Codegen.Decl.typeName", "Vuna/Compiler/Codegen/Decl.vuna:79"));
  ("Codegen_dDecl.v_unitOfTbl", ("Vuna.Compiler.Codegen.Decl.unitOfTbl", "Vuna/Compiler/Codegen/Decl.vuna:116"));
  ("Codegen_dDecl.v_unitTblOf", ("Vuna.Compiler.Codegen.Decl.unitTblOf", "Vuna/Compiler/Codegen/Decl.vuna:113"));
  ("Codegen_dDecl.v_valueName", ("Vuna.Compiler.Codegen.Decl.valueName", "Vuna/Compiler/Codegen/Decl.vuna:69"));
  ("Codegen_dOcaml_dRender.v_binderText", ("Vuna.Compiler.Codegen.Ocaml.Render.binderText", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:88"));
  ("Codegen_dOcaml_dRender.v_ctorDecl", ("Vuna.Compiler.Codegen.Ocaml.Render.ctorDecl", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:49"));
  ("Codegen_dOcaml_dRender.v_familyTy", ("Vuna.Compiler.Codegen.Ocaml.Render.familyTy", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:31"));
  ("Codegen_dOcaml_dRender.v_fieldAssign", ("Vuna.Compiler.Codegen.Ocaml.Render.fieldAssign", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:85"));
  ("Codegen_dOcaml_dRender.v_fieldDecl", ("Vuna.Compiler.Codegen.Ocaml.Render.fieldDecl", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:65"));
  ("Codegen_dOcaml_dRender.v_interpose", ("Vuna.Compiler.Codegen.Ocaml.Render.interpose", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:16"));
  ("Codegen_dOcaml_dRender.v_joinWith", ("Vuna.Compiler.Codegen.Ocaml.Render.joinWith", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:13"));
  ("Codegen_dOcaml_dRender.v_recordField", ("Vuna.Compiler.Codegen.Ocaml.Render.recordField", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:120"));
  ("Codegen_dOcaml_dRender.v_recordFields", ("Vuna.Compiler.Codegen.Ocaml.Render.recordFields", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:123"));
  ("Codegen_dOcaml_dRender.v_renderArm", ("Vuna.Compiler.Codegen.Ocaml.Render.renderArm", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:117"));
  ("Codegen_dOcaml_dRender.v_renderDecl", ("Vuna.Compiler.Codegen.Ocaml.Render.renderDecl", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:57"));
  ("Codegen_dOcaml_dRender.v_renderDecls", ("Vuna.Compiler.Codegen.Ocaml.Render.renderDecls", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:69"));
  ("Codegen_dOcaml_dRender.v_renderPat", ("Vuna.Compiler.Codegen.Ocaml.Render.renderPat", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:78"));
  ("Codegen_dOcaml_dRender.v_renderTerm", ("Vuna.Compiler.Codegen.Ocaml.Render.renderTerm", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:92"));
  ("Codegen_dOcaml_dRender.v_renderTy", ("Vuna.Compiler.Codegen.Ocaml.Render.renderTy", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:37"));
  ("Codegen_dOcaml_dRender.v_typeParamDecl", ("Vuna.Compiler.Codegen.Ocaml.Render.typeParamDecl", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:24"));
  ("Codegen_dOcaml_dRender.v_typeParamName", ("Vuna.Compiler.Codegen.Ocaml.Render.typeParamName", "Vuna/Compiler/Codegen/Ocaml/Render.vuna:21"));
  ("Codegen_dRuntime.v_ocamlRtHelperNames", ("Vuna.Compiler.Codegen.Runtime.ocamlRtHelperNames", "Vuna/Compiler/Codegen/Runtime.vuna:338"));
  ("Codegen_dRuntime.v_ocamlRtText", ("Vuna.Compiler.Codegen.Runtime.ocamlRtText", "Vuna/Compiler/Codegen/Runtime.vuna:334"));
  ("Codegen_dRuntime.v_ocamlRtTextTable", ("Vuna.Compiler.Codegen.Runtime.ocamlRtTextTable", "Vuna/Compiler/Codegen/Runtime.vuna:26"));
  ("Codegen_dRuntime.v_rtTextExtra", ("Vuna.Compiler.Codegen.Runtime.rtTextExtra", "Vuna/Compiler/Codegen/Runtime.vuna:352"));
  ("Codegen_dRuntime.v_rtTextExtras", ("Vuna.Compiler.Codegen.Runtime.rtTextExtras", "Vuna/Compiler/Codegen/Runtime.vuna:359"));
  ("Codegen_dRuntime.v_rtTextGaps", ("Vuna.Compiler.Codegen.Runtime.rtTextGaps", "Vuna/Compiler/Codegen/Runtime.vuna:349"));
  ("Codegen_dRuntime.v_rtTextMissing", ("Vuna.Compiler.Codegen.Runtime.rtTextMissing", "Vuna/Compiler/Codegen/Runtime.vuna:342"));
  ("Codegen_dTerm.v_bindAndOf", ("Vuna.Compiler.Codegen.Term.bindAndOf", "Vuna/Compiler/Codegen/Term.vuna:2252"));
  ("Codegen_dTerm.v_bindFirstOf", ("Vuna.Compiler.Codegen.Term.bindFirstOf", "Vuna/Compiler/Codegen/Term.vuna:2249"));
  ("Codegen_dTerm.v_bindGroupOf", ("Vuna.Compiler.Codegen.Term.bindGroupOf", "Vuna/Compiler/Codegen/Term.vuna:2244"));
  ("Codegen_dTerm.v_bindKeywordOf", ("Vuna.Compiler.Codegen.Term.bindKeywordOf", "Vuna/Compiler/Codegen/Term.vuna:2255"));
  ("Codegen_dTerm.v_bridgeUnitOf", ("Vuna.Compiler.Codegen.Term.bridgeUnitOf", "Vuna/Compiler/Codegen/Term.vuna:1774"));
  ("Codegen_dTerm.v_dtDefLocTable", ("Vuna.Compiler.Codegen.Term.dtDefLocTable", "Vuna/Compiler/Codegen/Term.vuna:1698"));
  ("Codegen_dTerm.v_dtFloatRuntime", ("Vuna.Compiler.Codegen.Term.dtFloatRuntime", "Vuna/Compiler/Codegen/Term.vuna:1092"));
  ("Codegen_dTerm.v_dtListBridge", ("Vuna.Compiler.Codegen.Term.dtListBridge", "Vuna/Compiler/Codegen/Term.vuna:1645"));
  ("Codegen_dTerm.v_dtObsRuntime", ("Vuna.Compiler.Codegen.Term.dtObsRuntime", "Vuna/Compiler/Codegen/Term.vuna:1132"));
  ("Codegen_dTerm.v_dtPrimRuntime", ("Vuna.Compiler.Codegen.Term.dtPrimRuntime", "Vuna/Compiler/Codegen/Term.vuna:107"));
  ("Codegen_dTerm.v_dtReporterRuntime", ("Vuna.Compiler.Codegen.Term.dtReporterRuntime", "Vuna/Compiler/Codegen/Term.vuna:1051"));
  ("Codegen_dTerm.v_dtRuntime", ("Vuna.Compiler.Codegen.Term.dtRuntime", "Vuna/Compiler/Codegen/Term.vuna:32"));
  ("Codegen_dTerm.v_dtRuntimeWith", ("Vuna.Compiler.Codegen.Term.dtRuntimeWith", "Vuna/Compiler/Codegen/Term.vuna:1633"));
  ("Codegen_dTerm.v_dtSchedRuntime", ("Vuna.Compiler.Codegen.Term.dtSchedRuntime", "Vuna/Compiler/Codegen/Term.vuna:589"));
  ("Codegen_dTerm.v_dtTraceRuntime", ("Vuna.Compiler.Codegen.Term.dtTraceRuntime", "Vuna/Compiler/Codegen/Term.vuna:1109"));
  ("Codegen_dTerm.v_effThunkText", ("Vuna.Compiler.Codegen.Term.effThunkText", "Vuna/Compiler/Codegen/Term.vuna:1994"));
  ("Codegen_dTerm.v_effUnitTyPair", ("Vuna.Compiler.Codegen.Term.effUnitTyPair", "Vuna/Compiler/Codegen/Term.vuna:1799"));
  ("Codegen_dTerm.v_effUnitTypeNameIr", ("Vuna.Compiler.Codegen.Term.effUnitTypeNameIr", "Vuna/Compiler/Codegen/Term.vuna:1805"));
  ("Codegen_dTerm.v_foldHandlers", ("Vuna.Compiler.Codegen.Term.foldHandlers", "Vuna/Compiler/Codegen/Term.vuna:2349"));
  ("Codegen_dTerm.v_genArm", ("Vuna.Compiler.Codegen.Term.genArm", "Vuna/Compiler/Codegen/Term.vuna:2111"));
  ("Codegen_dTerm.v_genArms", ("Vuna.Compiler.Codegen.Term.genArms", "Vuna/Compiler/Codegen/Term.vuna:2097"));
  ("Codegen_dTerm.v_genAssignedFields", ("Vuna.Compiler.Codegen.Term.genAssignedFields", "Vuna/Compiler/Codegen/Term.vuna:2032"));
  ("Codegen_dTerm.v_genBridgeRef", ("Vuna.Compiler.Codegen.Term.genBridgeRef", "Vuna/Compiler/Codegen/Term.vuna:1792"));
  ("Codegen_dTerm.v_genCtorRef", ("Vuna.Compiler.Codegen.Term.genCtorRef", "Vuna/Compiler/Codegen/Term.vuna:1753"));
  ("Codegen_dTerm.v_genDef", ("Vuna.Compiler.Codegen.Term.genDef", "Vuna/Compiler/Codegen/Term.vuna:2288"));
  ("Codegen_dTerm.v_genEntryHook", ("Vuna.Compiler.Codegen.Term.genEntryHook", "Vuna/Compiler/Codegen/Term.vuna:2321"));
  ("Codegen_dTerm.v_genGroup", ("Vuna.Compiler.Codegen.Term.genGroup", "Vuna/Compiler/Codegen/Term.vuna:2227"));
  ("Codegen_dTerm.v_genGroupDefs", ("Vuna.Compiler.Codegen.Term.genGroupDefs", "Vuna/Compiler/Codegen/Term.vuna:2274"));
  ("Codegen_dTerm.v_genGroups", ("Vuna.Compiler.Codegen.Term.genGroups", "Vuna/Compiler/Codegen/Term.vuna:2213"));
  ("Codegen_dTerm.v_genIr", ("Vuna.Compiler.Codegen.Term.genIr", "Vuna/Compiler/Codegen/Term.vuna:1811"));
  ("Codegen_dTerm.v_genIrArgs", ("Vuna.Compiler.Codegen.Term.genIrArgs", "Vuna/Compiler/Codegen/Term.vuna:2017"));
  ("Codegen_dTerm.v_genIrNode", ("Vuna.Compiler.Codegen.Term.genIrNode", "Vuna/Compiler/Codegen/Term.vuna:1814"));
  ("Codegen_dTerm.v_genLamParams", ("Vuna.Compiler.Codegen.Term.genLamParams", "Vuna/Compiler/Codegen/Term.vuna:2057"));
  ("Codegen_dTerm.v_genLamParamsUnannotated", ("Vuna.Compiler.Codegen.Term.genLamParamsUnannotated", "Vuna/Compiler/Codegen/Term.vuna:2078"));
  ("Codegen_dTerm.v_genNatAlt", ("Vuna.Compiler.Codegen.Term.genNatAlt", "Vuna/Compiler/Codegen/Term.vuna:2191"));
  ("Codegen_dTerm.v_genNatBranches", ("Vuna.Compiler.Codegen.Term.genNatBranches", "Vuna/Compiler/Codegen/Term.vuna:2149"));
  ("Codegen_dTerm.v_genValueRef", ("Vuna.Compiler.Codegen.Term.genValueRef", "Vuna/Compiler/Codegen/Term.vuna:1746"));
  ("Codegen_dTerm.v_gsAddDep", ("Vuna.Compiler.Codegen.Term.gsAddDep", "Vuna/Compiler/Codegen/Term.vuna:1738"));
  ("Codegen_dTerm.v_gsDepOfFamily", ("Vuna.Compiler.Codegen.Term.gsDepOfFamily", "Vuna/Compiler/Codegen/Term.vuna:1760"));
  ("Codegen_dTerm.v_gsWithTyDeps", ("Vuna.Compiler.Codegen.Term.gsWithTyDeps", "Vuna/Compiler/Codegen/Term.vuna:2087"));
  ("Codegen_dTerm.v_hasCatchAll", ("Vuna.Compiler.Codegen.Term.hasCatchAll", "Vuna/Compiler/Codegen/Term.vuna:2090"));
  ("Codegen_dTerm.v_hookText", ("Vuna.Compiler.Codegen.Term.hookText", "Vuna/Compiler/Codegen/Term.vuna:2356"));
  ("Codegen_dTerm.v_inlineText", ("Vuna.Compiler.Codegen.Term.inlineText", "Vuna/Compiler/Codegen/Term.vuna:1575"));
  ("Codegen_dTerm.v_ioParamNames", ("Vuna.Compiler.Codegen.Term.ioParamNames", "Vuna/Compiler/Codegen/Term.vuna:2005"));
  ("Codegen_dTerm.v_lineDirectiveOf", ("Vuna.Compiler.Codegen.Term.lineDirectiveOf", "Vuna/Compiler/Codegen/Term.vuna:2265"));
  ("Codegen_dTerm.v_locRowOf", ("Vuna.Compiler.Codegen.Term.locRowOf", "Vuna/Compiler/Codegen/Term.vuna:1704"));
  ("Codegen_dTerm.v_mkGenSt", ("Vuna.Compiler.Codegen.Term.mkGenSt", "Vuna/Compiler/Codegen/Term.vuna:1731"));
  ("Codegen_dTerm.v_mkGenStWith", ("Vuna.Compiler.Codegen.Term.mkGenStWith", "Vuna/Compiler/Codegen/Term.vuna:1734"));
  ("Codegen_dTerm.v_nonErasedBinderText", ("Vuna.Compiler.Codegen.Term.nonErasedBinderText", "Vuna/Compiler/Codegen/Term.vuna:2050"));
  ("Codegen_dTerm.v_qualifyBridgeNames", ("Vuna.Compiler.Codegen.Term.qualifyBridgeNames", "Vuna/Compiler/Codegen/Term.vuna:1783"));
  ("Codegen_dTerm.v_qualifyBridgeText", ("Vuna.Compiler.Codegen.Term.qualifyBridgeText", "Vuna/Compiler/Codegen/Term.vuna:1788"));
  ("Codegen_dTerm.v_recordLabelOf", ("Vuna.Compiler.Codegen.Term.recordLabelOf", "Vuna/Compiler/Codegen/Term.vuna:1766"));
  ("Codegen_dTerm.v_recordPatFields", ("Vuna.Compiler.Codegen.Term.recordPatFields", "Vuna/Compiler/Codegen/Term.vuna:2137"));
  ("Codegen_dTerm.v_renderDefOf", ("Vuna.Compiler.Codegen.Term.renderDefOf", "Vuna/Compiler/Codegen/Term.vuna:2309"));
  ("Codegen_dTerm.v_replaceAll", ("Vuna.Compiler.Codegen.Term.replaceAll", "Vuna/Compiler/Codegen/Term.vuna:1780"));
  ("Codegen_dTerm.v_sortLocRows", ("Vuna.Compiler.Codegen.Term.sortLocRows", "Vuna/Compiler/Codegen/Term.vuna:1701"));
  ("Codegen_dTerm.v_takeNames", ("Vuna.Compiler.Codegen.Term.takeNames", "Vuna/Compiler/Codegen/Term.vuna:2008"));
  ("Codegen_dTerm.v_termOrImpossible", ("Vuna.Compiler.Codegen.Term.termOrImpossible", "Vuna/Compiler/Codegen/Term.vuna:2187"));
  ("Core_dCanonical.v_decAlt", ("Vuna.Compiler.Core.Canonical.decAlt", "Vuna/Compiler/Core/Canonical.vuna:149"));
  ("Core_dCanonical.v_decArg", ("Vuna.Compiler.Core.Canonical.decArg", "Vuna/Compiler/Core/Canonical.vuna:123"));
  ("Core_dCanonical.v_decBinder", ("Vuna.Compiler.Core.Canonical.decBinder", "Vuna/Compiler/Core/Canonical.vuna:136"));
  ("Core_dCanonical.v_decRig", ("Vuna.Compiler.Core.Canonical.decRig", "Vuna/Compiler/Core/Canonical.vuna:108"));
  ("Core_dCanonical.v_decTerm", ("Vuna.Compiler.Core.Canonical.decTerm", "Vuna/Compiler/Core/Canonical.vuna:165"));
  ("Core_dCanonical.v_decTermComplete", ("Vuna.Compiler.Core.Canonical.decTermComplete", "Vuna/Compiler/Core/Canonical.vuna:318"));
  ("Core_dCanonical.v_encAlt", ("Vuna.Compiler.Core.Canonical.encAlt", "Vuna/Compiler/Core/Canonical.vuna:60"));
  ("Core_dCanonical.v_encAlts", ("Vuna.Compiler.Core.Canonical.encAlts", "Vuna/Compiler/Core/Canonical.vuna:64"));
  ("Core_dCanonical.v_encAltsGo", ("Vuna.Compiler.Core.Canonical.encAltsGo", "Vuna/Compiler/Core/Canonical.vuna:68"));
  ("Core_dCanonical.v_encArg", ("Vuna.Compiler.Core.Canonical.encArg", "Vuna/Compiler/Core/Canonical.vuna:39"));
  ("Core_dCanonical.v_encArgs", ("Vuna.Compiler.Core.Canonical.encArgs", "Vuna/Compiler/Core/Canonical.vuna:43"));
  ("Core_dCanonical.v_encArgsGo", ("Vuna.Compiler.Core.Canonical.encArgsGo", "Vuna/Compiler/Core/Canonical.vuna:47"));
  ("Core_dCanonical.v_encBinder", ("Vuna.Compiler.Core.Canonical.encBinder", "Vuna/Compiler/Core/Canonical.vuna:52"));
  ("Core_dCanonical.v_encBinders", ("Vuna.Compiler.Core.Canonical.encBinders", "Vuna/Compiler/Core/Canonical.vuna:56"));
  ("Core_dCanonical.v_encInts", ("Vuna.Compiler.Core.Canonical.encInts", "Vuna/Compiler/Core/Canonical.vuna:73"));
  ("Core_dCanonical.v_encRig", ("Vuna.Compiler.Core.Canonical.encRig", "Vuna/Compiler/Core/Canonical.vuna:33"));
  ("Core_dCanonical.v_encTerm", ("Vuna.Compiler.Core.Canonical.encTerm", "Vuna/Compiler/Core/Canonical.vuna:77"));
  ("Core_dCanonical.v_encTermBytes", ("Vuna.Compiler.Core.Canonical.encTermBytes", "Vuna/Compiler/Core/Canonical.vuna:100"));
  ("Core_dCanonical.v_noSpan", ("Vuna.Compiler.Core.Canonical.noSpan", "Vuna/Compiler/Core/Canonical.vuna:26"));
  ("Core_dConv.v_absPatternBody", ("Vuna.Compiler.Core.Conv.absPatternBody", "Vuna/Compiler/Core/Conv.vuna:600"));
  ("Core_dConv.v_altsScopedTo", ("Vuna.Compiler.Core.Conv.altsScopedTo", "Vuna/Compiler/Core/Conv.vuna:554"));
  ("Core_dConv.v_argsScopedTo", ("Vuna.Compiler.Core.Conv.argsScopedTo", "Vuna/Compiler/Core/Conv.vuna:549"));
  ("Core_dConv.v_conv", ("Vuna.Compiler.Core.Conv.conv", "Vuna/Compiler/Core/Conv.vuna:778"));
  ("Core_dConv.v_convBoth", ("Vuna.Compiler.Core.Conv.convBoth", "Vuna/Compiler/Core/Conv.vuna:786"));
  ("Core_dConv.v_convBothFuel", ("Vuna.Compiler.Core.Conv.convBothFuel", "Vuna/Compiler/Core/Conv.vuna:310"));
  ("Core_dConv.v_convCaseAlts", ("Vuna.Compiler.Core.Conv.convCaseAlts", "Vuna/Compiler/Core/Conv.vuna:789"));
  ("Core_dConv.v_convCaseAltsFuel", ("Vuna.Compiler.Core.Conv.convCaseAltsFuel", "Vuna/Compiler/Core/Conv.vuna:448"));
  ("Core_dConv.v_convFuel", ("Vuna.Compiler.Core.Conv.convFuel", "Vuna/Compiler/Core/Conv.vuna:293"));
  ("Core_dConv.v_convFuelBase", ("Vuna.Compiler.Core.Conv.convFuelBase", "Vuna/Compiler/Core/Conv.vuna:198"));
  ("Core_dConv.v_convFuelFor", ("Vuna.Compiler.Core.Conv.convFuelFor", "Vuna/Compiler/Core/Conv.vuna:226"));
  ("Core_dConv.v_convFuelMax", ("Vuna.Compiler.Core.Conv.convFuelMax", "Vuna/Compiler/Core/Conv.vuna:233"));
  ("Core_dConv.v_convNatApplied", ("Vuna.Compiler.Core.Conv.convNatApplied", "Vuna/Compiler/Core/Conv.vuna:264"));
  ("Core_dConv.v_convNatChains", ("Vuna.Compiler.Core.Conv.convNatChains", "Vuna/Compiler/Core/Conv.vuna:244"));
  ("Core_dConv.v_convNatFuel", ("Vuna.Compiler.Core.Conv.convNatFuel", "Vuna/Compiler/Core/Conv.vuna:236"));
  ("Core_dConv.v_convNatNear", ("Vuna.Compiler.Core.Conv.convNatNear", "Vuna/Compiler/Core/Conv.vuna:204"));
  ("Core_dConv.v_convNatNeutral", ("Vuna.Compiler.Core.Conv.convNatNeutral", "Vuna/Compiler/Core/Conv.vuna:254"));
  ("Core_dConv.v_convNeutral", ("Vuna.Compiler.Core.Conv.convNeutral", "Vuna/Compiler/Core/Conv.vuna:798"));
  ("Core_dConv.v_convNeutralFuel", ("Vuna.Compiler.Core.Conv.convNeutralFuel", "Vuna/Compiler/Core/Conv.vuna:408"));
  ("Core_dConv.v_convOneAlt", ("Vuna.Compiler.Core.Conv.convOneAlt", "Vuna/Compiler/Core/Conv.vuna:792"));
  ("Core_dConv.v_convOneAltFuel", ("Vuna.Compiler.Core.Conv.convOneAltFuel", "Vuna/Compiler/Core/Conv.vuna:465"));
  ("Core_dConv.v_convSpines", ("Vuna.Compiler.Core.Conv.convSpines", "Vuna/Compiler/Core/Conv.vuna:801"));
  ("Core_dConv.v_convSpinesFuel", ("Vuna.Compiler.Core.Conv.convSpinesFuel", "Vuna/Compiler/Core/Conv.vuna:423"));
  ("Core_dConv.v_convValueLists", ("Vuna.Compiler.Core.Conv.convValueLists", "Vuna/Compiler/Core/Conv.vuna:795"));
  ("Core_dConv.v_convValueListsFuel", ("Vuna.Compiler.Core.Conv.convValueListsFuel", "Vuna/Compiler/Core/Conv.vuna:435"));
  ("Core_dConv.v_etaLeft", ("Vuna.Compiler.Core.Conv.etaLeft", "Vuna/Compiler/Core/Conv.vuna:804"));
  ("Core_dConv.v_etaLeftFuel", ("Vuna.Compiler.Core.Conv.etaLeftFuel", "Vuna/Compiler/Core/Conv.vuna:390"));
  ("Core_dConv.v_etaRight", ("Vuna.Compiler.Core.Conv.etaRight", "Vuna/Compiler/Core/Conv.vuna:807"));
  ("Core_dConv.v_etaRightFuel", ("Vuna.Compiler.Core.Conv.etaRightFuel", "Vuna/Compiler/Core/Conv.vuna:399"));
  ("Core_dConv.v_fastSame", ("Vuna.Compiler.Core.Conv.fastSame", "Vuna/Compiler/Core/Conv.vuna:25"));
  ("Core_dConv.v_isNatCtorName", ("Vuna.Compiler.Core.Conv.isNatCtorName", "Vuna/Compiler/Core/Conv.vuna:78"));
  ("Core_dConv.v_isNatLikeHead", ("Vuna.Compiler.Core.Conv.isNatLikeHead", "Vuna/Compiler/Core/Conv.vuna:153"));
  ("Core_dConv.v_isNatLikeValue", ("Vuna.Compiler.Core.Conv.isNatLikeValue", "Vuna/Compiler/Core/Conv.vuna:144"));
  ("Core_dConv.v_isNilList", ("Vuna.Compiler.Core.Conv.isNilList", "Vuna/Compiler/Core/Conv.vuna:279"));
  ("Core_dConv.v_isNilSpine", ("Vuna.Compiler.Core.Conv.isNilSpine", "Vuna/Compiler/Core/Conv.vuna:577"));
  ("Core_dConv.v_levelPos", ("Vuna.Compiler.Core.Conv.levelPos", "Vuna/Compiler/Core/Conv.vuna:585"));
  ("Core_dConv.v_levelPosGo", ("Vuna.Compiler.Core.Conv.levelPosGo", "Vuna/Compiler/Core/Conv.vuna:588"));
  ("Core_dConv.v_memLevel", ("Vuna.Compiler.Core.Conv.memLevel", "Vuna/Compiler/Core/Conv.vuna:581"));
  ("Core_dConv.v_metaCreatedDepth", ("Vuna.Compiler.Core.Conv.metaCreatedDepth", "Vuna/Compiler/Core/Conv.vuna:497"));
  ("Core_dConv.v_mismatchAt", ("Vuna.Compiler.Core.Conv.mismatchAt", "Vuna/Compiler/Core/Conv.vuna:476"));
  ("Core_dConv.v_natChainMaxValue", ("Vuna.Compiler.Core.Conv.natChainMaxValue", "Vuna/Compiler/Core/Conv.vuna:82"));
  ("Core_dConv.v_natChainNextValue", ("Vuna.Compiler.Core.Conv.natChainNextValue", "Vuna/Compiler/Core/Conv.vuna:85"));
  ("Core_dConv.v_natFoldApplied", ("Vuna.Compiler.Core.Conv.natFoldApplied", "Vuna/Compiler/Core/Conv.vuna:120"));
  ("Core_dConv.v_natFoldArgs", ("Vuna.Compiler.Core.Conv.natFoldArgs", "Vuna/Compiler/Core/Conv.vuna:107"));
  ("Core_dConv.v_natFoldGo", ("Vuna.Compiler.Core.Conv.natFoldGo", "Vuna/Compiler/Core/Conv.vuna:93"));
  ("Core_dConv.v_natFoldSucc", ("Vuna.Compiler.Core.Conv.natFoldSucc", "Vuna/Compiler/Core/Conv.vuna:128"));
  ("Core_dConv.v_natFoldValue", ("Vuna.Compiler.Core.Conv.natFoldValue", "Vuna/Compiler/Core/Conv.vuna:90"));
  ("Core_dConv.v_natPrefixDepth", ("Vuna.Compiler.Core.Conv.natPrefixDepth", "Vuna/Compiler/Core/Conv.vuna:162"));
  ("Core_dConv.v_natPrefixGo", ("Vuna.Compiler.Core.Conv.natPrefixGo", "Vuna/Compiler/Core/Conv.vuna:165"));
  ("Core_dConv.v_natPrefixMax", ("Vuna.Compiler.Core.Conv.natPrefixMax", "Vuna/Compiler/Core/Conv.vuna:218"));
  ("Core_dConv.v_patternEnv", ("Vuna.Compiler.Core.Conv.patternEnv", "Vuna/Compiler/Core/Conv.vuna:662"));
  ("Core_dConv.v_patternSolution", ("Vuna.Compiler.Core.Conv.patternSolution", "Vuna/Compiler/Core/Conv.vuna:674"));
  ("Core_dConv.v_patternSpineOf", ("Vuna.Compiler.Core.Conv.patternSpineOf", "Vuna/Compiler/Core/Conv.vuna:561"));
  ("Core_dConv.v_sameNatValue", ("Vuna.Compiler.Core.Conv.sameNatValue", "Vuna/Compiler/Core/Conv.vuna:134"));
  ("Core_dConv.v_sameNeutralAtom", ("Vuna.Compiler.Core.Conv.sameNeutralAtom", "Vuna/Compiler/Core/Conv.vuna:283"));
  ("Core_dConv.v_solveMeta", ("Vuna.Compiler.Core.Conv.solveMeta", "Vuna/Compiler/Core/Conv.vuna:810"));
  ("Core_dConv.v_solveMetaEmpty", ("Vuna.Compiler.Core.Conv.solveMetaEmpty", "Vuna/Compiler/Core/Conv.vuna:681"));
  ("Core_dConv.v_solveMetaEmptyStore", ("Vuna.Compiler.Core.Conv.solveMetaEmptyStore", "Vuna/Compiler/Core/Conv.vuna:686"));
  ("Core_dConv.v_solveMetaFuel", ("Vuna.Compiler.Core.Conv.solveMetaFuel", "Vuna/Compiler/Core/Conv.vuna:753"));
  ("Core_dConv.v_solveMetaHeadLegacyFuel", ("Vuna.Compiler.Core.Conv.solveMetaHeadLegacyFuel", "Vuna/Compiler/Core/Conv.vuna:726"));
  ("Core_dConv.v_solveMetaHoLegacyFuel", ("Vuna.Compiler.Core.Conv.solveMetaHoLegacyFuel", "Vuna/Compiler/Core/Conv.vuna:709"));
  ("Core_dConv.v_solveMetaNew", ("Vuna.Compiler.Core.Conv.solveMetaNew", "Vuna/Compiler/Core/Conv.vuna:775"));
  ("Core_dConv.v_solveMetaPattern", ("Vuna.Compiler.Core.Conv.solveMetaPattern", "Vuna/Compiler/Core/Conv.vuna:738"));
  ("Core_dConv.v_spineLevels", ("Vuna.Compiler.Core.Conv.spineLevels", "Vuna/Compiler/Core/Conv.vuna:592"));
  ("Core_dConv.v_splitAtVals", ("Vuna.Compiler.Core.Conv.splitAtVals", "Vuna/Compiler/Core/Conv.vuna:702"));
  ("Core_dConv.v_termScopedTo", ("Vuna.Compiler.Core.Conv.termScopedTo", "Vuna/Compiler/Core/Conv.vuna:505"));
  ("Core_dConv.v_wrapPatternLams", ("Vuna.Compiler.Core.Conv.wrapPatternLams", "Vuna/Compiler/Core/Conv.vuna:654"));
  ("Core_dEval.v_appendReduce", ("Vuna.Compiler.Core.Eval.appendReduce", "Vuna/Compiler/Core/Eval.vuna:575"));
  ("Core_dEval.v_applyCaseAlt", ("Vuna.Compiler.Core.Eval.applyCaseAlt", "Vuna/Compiler/Core/Eval.vuna:105"));
  ("Core_dEval.v_applyCaseAltFuel", ("Vuna.Compiler.Core.Eval.applyCaseAltFuel", "Vuna/Compiler/Core/Eval.vuna:108"));
  ("Core_dEval.v_applyClosure", ("Vuna.Compiler.Core.Eval.applyClosure", "Vuna/Compiler/Core/Eval.vuna:159"));
  ("Core_dEval.v_applyClosureBinder", ("Vuna.Compiler.Core.Eval.applyClosureBinder", "Vuna/Compiler/Core/Eval.vuna:963"));
  ("Core_dEval.v_applySpine", ("Vuna.Compiler.Core.Eval.applySpine", "Vuna/Compiler/Core/Eval.vuna:162"));
  ("Core_dEval.v_applyTermSpine", ("Vuna.Compiler.Core.Eval.applyTermSpine", "Vuna/Compiler/Core/Eval.vuna:990"));
  ("Core_dEval.v_applyValue", ("Vuna.Compiler.Core.Eval.applyValue", "Vuna/Compiler/Core/Eval.vuna:141"));
  ("Core_dEval.v_applyValueFuel", ("Vuna.Compiler.Core.Eval.applyValueFuel", "Vuna/Compiler/Core/Eval.vuna:144"));
  ("Core_dEval.v_argAt", ("Vuna.Compiler.Core.Eval.argAt", "Vuna/Compiler/Core/Eval.vuna:805"));
  ("Core_dEval.v_argValsAt", ("Vuna.Compiler.Core.Eval.argValsAt", "Vuna/Compiler/Core/Eval.vuna:957"));
  ("Core_dEval.v_asBool", ("Vuna.Compiler.Core.Eval.asBool", "Vuna/Compiler/Core/Eval.vuna:343"));
  ("Core_dEval.v_asFloat", ("Vuna.Compiler.Core.Eval.asFloat", "Vuna/Compiler/Core/Eval.vuna:308"));
  ("Core_dEval.v_asInt", ("Vuna.Compiler.Core.Eval.asInt", "Vuna/Compiler/Core/Eval.vuna:220"));
  ("Core_dEval.v_asNat", ("Vuna.Compiler.Core.Eval.asNat", "Vuna/Compiler/Core/Eval.vuna:268"));
  ("Core_dEval.v_asStr", ("Vuna.Compiler.Core.Eval.asStr", "Vuna/Compiler/Core/Eval.vuna:339"));
  ("Core_dEval.v_atPrim", ("Vuna.Compiler.Core.Eval.atPrim", "Vuna/Compiler/Core/Eval.vuna:739"));
  ("Core_dEval.v_boolPrim2", ("Vuna.Compiler.Core.Eval.boolPrim2", "Vuna/Compiler/Core/Eval.vuna:370"));
  ("Core_dEval.v_catchAllEnv", ("Vuna.Compiler.Core.Eval.catchAllEnv", "Vuna/Compiler/Core/Eval.vuna:127"));
  ("Core_dEval.v_cmpInt", ("Vuna.Compiler.Core.Eval.cmpInt", "Vuna/Compiler/Core/Eval.vuna:455"));
  ("Core_dEval.v_digitsOf", ("Vuna.Compiler.Core.Eval.digitsOf", "Vuna/Compiler/Core/Eval.vuna:287"));
  ("Core_dEval.v_digitsOfChars", ("Vuna.Compiler.Core.Eval.digitsOfChars", "Vuna/Compiler/Core/Eval.vuna:290"));
  ("Core_dEval.v_dropBytes", ("Vuna.Compiler.Core.Eval.dropBytes", "Vuna/Compiler/Core/Eval.vuna:788"));
  ("Core_dEval.v_eval", ("Vuna.Compiler.Core.Eval.eval", "Vuna/Compiler/Core/Eval.vuna:24"));
  ("Core_dEval.v_evalAlt", ("Vuna.Compiler.Core.Eval.evalAlt", "Vuna/Compiler/Core/Eval.vuna:72"));
  ("Core_dEval.v_evalAlts", ("Vuna.Compiler.Core.Eval.evalAlts", "Vuna/Compiler/Core/Eval.vuna:75"));
  ("Core_dEval.v_evalArgTerms", ("Vuna.Compiler.Core.Eval.evalArgTerms", "Vuna/Compiler/Core/Eval.vuna:79"));
  ("Core_dEval.v_evalArgTermsFuel", ("Vuna.Compiler.Core.Eval.evalArgTermsFuel", "Vuna/Compiler/Core/Eval.vuna:82"));
  ("Core_dEval.v_evalCase", ("Vuna.Compiler.Core.Eval.evalCase", "Vuna/Compiler/Core/Eval.vuna:93"));
  ("Core_dEval.v_evalCaseFuel", ("Vuna.Compiler.Core.Eval.evalCaseFuel", "Vuna/Compiler/Core/Eval.vuna:96"));
  ("Core_dEval.v_evalFuel", ("Vuna.Compiler.Core.Eval.evalFuel", "Vuna/Compiler/Core/Eval.vuna:41"));
  ("Core_dEval.v_evalFuelFor", ("Vuna.Compiler.Core.Eval.evalFuelFor", "Vuna/Compiler/Core/Eval.vuna:32"));
  ("Core_dEval.v_evalFuelMax", ("Vuna.Compiler.Core.Eval.evalFuelMax", "Vuna/Compiler/Core/Eval.vuna:38"));
  ("Core_dEval.v_evalIf", ("Vuna.Compiler.Core.Eval.evalIf", "Vuna/Compiler/Core/Eval.vuna:133"));
  ("Core_dEval.v_evalProjFuel", ("Vuna.Compiler.Core.Eval.evalProjFuel", "Vuna/Compiler/Core/Eval.vuna:810"));
  ("Core_dEval.v_floatBool2", ("Vuna.Compiler.Core.Eval.floatBool2", "Vuna/Compiler/Core/Eval.vuna:329"));
  ("Core_dEval.v_floatOfRaw", ("Vuna.Compiler.Core.Eval.floatOfRaw", "Vuna/Compiler/Core/Eval.vuna:280"));
  ("Core_dEval.v_floatPrim1", ("Vuna.Compiler.Core.Eval.floatPrim1", "Vuna/Compiler/Core/Eval.vuna:312"));
  ("Core_dEval.v_floatPrim2", ("Vuna.Compiler.Core.Eval.floatPrim2", "Vuna/Compiler/Core/Eval.vuna:319"));
  ("Core_dEval.v_force", ("Vuna.Compiler.Core.Eval.force", "Vuna/Compiler/Core/Eval.vuna:171"));
  ("Core_dEval.v_forceLabelArgs", ("Vuna.Compiler.Core.Eval.forceLabelArgs", "Vuna/Compiler/Core/Eval.vuna:544"));
  ("Core_dEval.v_freshVar", ("Vuna.Compiler.Core.Eval.freshVar", "Vuna/Compiler/Core/Eval.vuna:968"));
  ("Core_dEval.v_genericCmp", ("Vuna.Compiler.Core.Eval.genericCmp", "Vuna/Compiler/Core/Eval.vuna:440"));
  ("Core_dEval.v_genericPrim2", ("Vuna.Compiler.Core.Eval.genericPrim2", "Vuna/Compiler/Core/Eval.vuna:458"));
  ("Core_dEval.v_intPrim1", ("Vuna.Compiler.Core.Eval.intPrim1", "Vuna/Compiler/Core/Eval.vuna:395"));
  ("Core_dEval.v_intPrim2", ("Vuna.Compiler.Core.Eval.intPrim2", "Vuna/Compiler/Core/Eval.vuna:347"));
  ("Core_dEval.v_intPrim2Div", ("Vuna.Compiler.Core.Eval.intPrim2Div", "Vuna/Compiler/Core/Eval.vuna:360"));
  ("Core_dEval.v_isNilList", ("Vuna.Compiler.Core.Eval.isNilList", "Vuna/Compiler/Core/Eval.vuna:1100"));
  ("Core_dEval.v_lookupEnv", ("Vuna.Compiler.Core.Eval.lookupEnv", "Vuna/Compiler/Core/Eval.vuna:20"));
  ("Core_dEval.v_natClamp", ("Vuna.Compiler.Core.Eval.natClamp", "Vuna/Compiler/Core/Eval.vuna:229"));
  ("Core_dEval.v_natCtorInt", ("Vuna.Compiler.Core.Eval.natCtorInt", "Vuna/Compiler/Core/Eval.vuna:252"));
  ("Core_dEval.v_natMax", ("Vuna.Compiler.Core.Eval.natMax", "Vuna/Compiler/Core/Eval.vuna:226"));
  ("Core_dEval.v_natPrim1", ("Vuna.Compiler.Core.Eval.natPrim1", "Vuna/Compiler/Core/Eval.vuna:402"));
  ("Core_dEval.v_natPrim2", ("Vuna.Compiler.Core.Eval.natPrim2", "Vuna/Compiler/Core/Eval.vuna:409"));
  ("Core_dEval.v_natPrim2Div", ("Vuna.Compiler.Core.Eval.natPrim2Div", "Vuna/Compiler/Core/Eval.vuna:419"));
  ("Core_dEval.v_natSatAdd", ("Vuna.Compiler.Core.Eval.natSatAdd", "Vuna/Compiler/Core/Eval.vuna:232"));
  ("Core_dEval.v_natSatMul", ("Vuna.Compiler.Core.Eval.natSatMul", "Vuna/Compiler/Core/Eval.vuna:235"));
  ("Core_dEval.v_natTruncSub", ("Vuna.Compiler.Core.Eval.natTruncSub", "Vuna/Compiler/Core/Eval.vuna:238"));
  ("Core_dEval.v_natValue", ("Vuna.Compiler.Core.Eval.natValue", "Vuna/Compiler/Core/Eval.vuna:244"));
  ("Core_dEval.v_natValueGo", ("Vuna.Compiler.Core.Eval.natValueGo", "Vuna/Compiler/Core/Eval.vuna:241"));
  ("Core_dEval.v_natValueToInt", ("Vuna.Compiler.Core.Eval.natValueToInt", "Vuna/Compiler/Core/Eval.vuna:247"));
  ("Core_dEval.v_neutralEqFuel", ("Vuna.Compiler.Core.Eval.neutralEqFuel", "Vuna/Compiler/Core/Eval.vuna:518"));
  ("Core_dEval.v_normalize", ("Vuna.Compiler.Core.Eval.normalize", "Vuna/Compiler/Core/Eval.vuna:1127"));
  ("Core_dEval.v_normalizeCase", ("Vuna.Compiler.Core.Eval.normalizeCase", "Vuna/Compiler/Core/Eval.vuna:1130"));
  ("Core_dEval.v_normalizeCaseFuel", ("Vuna.Compiler.Core.Eval.normalizeCaseFuel", "Vuna/Compiler/Core/Eval.vuna:838"));
  ("Core_dEval.v_normalizeFuel", ("Vuna.Compiler.Core.Eval.normalizeFuel", "Vuna/Compiler/Core/Eval.vuna:822"));
  ("Core_dEval.v_normalizeIf", ("Vuna.Compiler.Core.Eval.normalizeIf", "Vuna/Compiler/Core/Eval.vuna:1136"));
  ("Core_dEval.v_normalizeIfFuel", ("Vuna.Compiler.Core.Eval.normalizeIfFuel", "Vuna/Compiler/Core/Eval.vuna:883"));
  ("Core_dEval.v_normalizeNeutral", ("Vuna.Compiler.Core.Eval.normalizeNeutral", "Vuna/Compiler/Core/Eval.vuna:1133"));
  ("Core_dEval.v_normalizeNeutralFuel", ("Vuna.Compiler.Core.Eval.normalizeNeutralFuel", "Vuna/Compiler/Core/Eval.vuna:864"));
  ("Core_dEval.v_normalizeProjFuel", ("Vuna.Compiler.Core.Eval.normalizeProjFuel", "Vuna/Compiler/Core/Eval.vuna:850"));
  ("Core_dEval.v_nthByte", ("Vuna.Compiler.Core.Eval.nthByte", "Vuna/Compiler/Core/Eval.vuna:752"));
  ("Core_dEval.v_obsReduce", ("Vuna.Compiler.Core.Eval.obsReduce", "Vuna/Compiler/Core/Eval.vuna:701"));
  ("Core_dEval.v_pow10Of", ("Vuna.Compiler.Core.Eval.pow10Of", "Vuna/Compiler/Core/Eval.vuna:297"));
  ("Core_dEval.v_primConst", ("Vuna.Compiler.Core.Eval.primConst", "Vuna/Compiler/Core/Eval.vuna:381"));
  ("Core_dEval.v_primReduce", ("Vuna.Compiler.Core.Eval.primReduce", "Vuna/Compiler/Core/Eval.vuna:601"));
  ("Core_dEval.v_quote", ("Vuna.Compiler.Core.Eval.quote", "Vuna/Compiler/Core/Eval.vuna:904"));
  ("Core_dEval.v_quoteArgValues", ("Vuna.Compiler.Core.Eval.quoteArgValues", "Vuna/Compiler/Core/Eval.vuna:945"));
  ("Core_dEval.v_quoteArgValuesFuel", ("Vuna.Compiler.Core.Eval.quoteArgValuesFuel", "Vuna/Compiler/Core/Eval.vuna:948"));
  ("Core_dEval.v_quoteCaseAlt", ("Vuna.Compiler.Core.Eval.quoteCaseAlt", "Vuna/Compiler/Core/Eval.vuna:929"));
  ("Core_dEval.v_quoteCaseAltFuel", ("Vuna.Compiler.Core.Eval.quoteCaseAltFuel", "Vuna/Compiler/Core/Eval.vuna:932"));
  ("Core_dEval.v_quoteFuel", ("Vuna.Compiler.Core.Eval.quoteFuel", "Vuna/Compiler/Core/Eval.vuna:907"));
  ("Core_dEval.v_quoteFuelBound", ("Vuna.Compiler.Core.Eval.quoteFuelBound", "Vuna/Compiler/Core/Eval.vuna:901"));
  ("Core_dEval.v_quoteNeutral", ("Vuna.Compiler.Core.Eval.quoteNeutral", "Vuna/Compiler/Core/Eval.vuna:971"));
  ("Core_dEval.v_quoteNeutralFuel", ("Vuna.Compiler.Core.Eval.quoteNeutralFuel", "Vuna/Compiler/Core/Eval.vuna:974"));
  ("Core_dEval.v_rowRemReduce", ("Vuna.Compiler.Core.Eval.rowRemReduce", "Vuna/Compiler/Core/Eval.vuna:552"));
  ("Core_dEval.v_showFloatOf", ("Vuna.Compiler.Core.Eval.showFloatOf", "Vuna/Compiler/Core/Eval.vuna:301"));
  ("Core_dEval.v_showFloatRaw", ("Vuna.Compiler.Core.Eval.showFloatRaw", "Vuna/Compiler/Core/Eval.vuna:305"));
  ("Core_dEval.v_showValue", ("Vuna.Compiler.Core.Eval.showValue", "Vuna/Compiler/Core/Eval.vuna:1124"));
  ("Core_dEval.v_showValueAt", ("Vuna.Compiler.Core.Eval.showValueAt", "Vuna/Compiler/Core/Eval.vuna:1106"));
  ("Core_dEval.v_spineAppend", ("Vuna.Compiler.Core.Eval.spineAppend", "Vuna/Compiler/Core/Eval.vuna:137"));
  ("Core_dEval.v_strAtBytes", ("Vuna.Compiler.Core.Eval.strAtBytes", "Vuna/Compiler/Core/Eval.vuna:749"));
  ("Core_dEval.v_strEq", ("Vuna.Compiler.Core.Eval.strEq", "Vuna/Compiler/Core/Eval.vuna:437"));
  ("Core_dEval.v_strHashChars", ("Vuna.Compiler.Core.Eval.strHashChars", "Vuna/Compiler/Core/Eval.vuna:734"));
  ("Core_dEval.v_strHashOf", ("Vuna.Compiler.Core.Eval.strHashOf", "Vuna/Compiler/Core/Eval.vuna:731"));
  ("Core_dEval.v_strPrim1", ("Vuna.Compiler.Core.Eval.strPrim1", "Vuna/Compiler/Core/Eval.vuna:429"));
  ("Core_dEval.v_strPrim2", ("Vuna.Compiler.Core.Eval.strPrim2", "Vuna/Compiler/Core/Eval.vuna:385"));
  ("Core_dEval.v_strPrim3", ("Vuna.Compiler.Core.Eval.strPrim3", "Vuna/Compiler/Core/Eval.vuna:465"));
  ("Core_dEval.v_substSolvedAlt", ("Vuna.Compiler.Core.Eval.substSolvedAlt", "Vuna/Compiler/Core/Eval.vuna:1040"));
  ("Core_dEval.v_substSolvedAltAt", ("Vuna.Compiler.Core.Eval.substSolvedAltAt", "Vuna/Compiler/Core/Eval.vuna:1097"));
  ("Core_dEval.v_substSolvedAltAtTbl", ("Vuna.Compiler.Core.Eval.substSolvedAltAtTbl", "Vuna/Compiler/Core/Eval.vuna:1186"));
  ("Core_dEval.v_substSolvedMetas", ("Vuna.Compiler.Core.Eval.substSolvedMetas", "Vuna/Compiler/Core/Eval.vuna:998"));
  ("Core_dEval.v_substSolvedMetasAt", ("Vuna.Compiler.Core.Eval.substSolvedMetasAt", "Vuna/Compiler/Core/Eval.vuna:1049"));
  ("Core_dEval.v_substSolvedMetasAtGo", ("Vuna.Compiler.Core.Eval.substSolvedMetasAtGo", "Vuna/Compiler/Core/Eval.vuna:1053"));
  ("Core_dEval.v_substSolvedMetasAtTbl", ("Vuna.Compiler.Core.Eval.substSolvedMetasAtTbl", "Vuna/Compiler/Core/Eval.vuna:1146"));
  ("Core_dEval.v_substSolvedMetasAtTblFuel", ("Vuna.Compiler.Core.Eval.substSolvedMetasAtTblFuel", "Vuna/Compiler/Core/Eval.vuna:1149"));
  ("Core_dEval.v_substringBytes", ("Vuna.Compiler.Core.Eval.substringBytes", "Vuna/Compiler/Core/Eval.vuna:771"));
  ("Core_dEval.v_substringPrim", ("Vuna.Compiler.Core.Eval.substringPrim", "Vuna/Compiler/Core/Eval.vuna:758"));
  ("Core_dEval.v_takeBytes", ("Vuna.Compiler.Core.Eval.takeBytes", "Vuna/Compiler/Core/Eval.vuna:779"));
  ("Core_dEval.v_valueEqFuel", ("Vuna.Compiler.Core.Eval.valueEqFuel", "Vuna/Compiler/Core/Eval.vuna:482"));
  ("Core_dEval.v_valueListEqFuel", ("Vuna.Compiler.Core.Eval.valueListEqFuel", "Vuna/Compiler/Core/Eval.vuna:529"));
  ("Core_dEval.v_varIndex", ("Vuna.Compiler.Core.Eval.varIndex", "Vuna/Compiler/Core/Eval.vuna:987"));
  ("Core_dTerm.v_anyAltFree", ("Vuna.Compiler.Core.Term.anyAltFree", "Vuna/Compiler/Core/Term.vuna:899"));
  ("Core_dTerm.v_anyAltUsesFloat", ("Vuna.Compiler.Core.Term.anyAltUsesFloat", "Vuna/Compiler/Core/Term.vuna:476"));
  ("Core_dTerm.v_anyArgUsesFloat", ("Vuna.Compiler.Core.Term.anyArgUsesFloat", "Vuna/Compiler/Core/Term.vuna:471"));
  ("Core_dTerm.v_anyNegativeVarAlts", ("Vuna.Compiler.Core.Term.anyNegativeVarAlts", "Vuna/Compiler/Core/Term.vuna:934"));
  ("Core_dTerm.v_anyNegativeVarArgs", ("Vuna.Compiler.Core.Term.anyNegativeVarArgs", "Vuna/Compiler/Core/Term.vuna:930"));
  ("Core_dTerm.v_anyPairFree", ("Vuna.Compiler.Core.Term.anyPairFree", "Vuna/Compiler/Core/Term.vuna:895"));
  ("Core_dTerm.v_binderNameOf", ("Vuna.Compiler.Core.Term.binderNameOf", "Vuna/Compiler/Core/Term.vuna:166"));
  ("Core_dTerm.v_binderOfPair", ("Vuna.Compiler.Core.Term.binderOfPair", "Vuna/Compiler/Core/Term.vuna:183"));
  ("Core_dTerm.v_binderPair", ("Vuna.Compiler.Core.Term.binderPair", "Vuna/Compiler/Core/Term.vuna:176"));
  ("Core_dTerm.v_binderPairs", ("Vuna.Compiler.Core.Term.binderPairs", "Vuna/Compiler/Core/Term.vuna:179"));
  ("Core_dTerm.v_binderRigOf", ("Vuna.Compiler.Core.Term.binderRigOf", "Vuna/Compiler/Core/Term.vuna:169"));
  ("Core_dTerm.v_binderSpanOf", ("Vuna.Compiler.Core.Term.binderSpanOf", "Vuna/Compiler/Core/Term.vuna:172"));
  ("Core_dTerm.v_bindersOfPairs", ("Vuna.Compiler.Core.Term.bindersOfPairs", "Vuna/Compiler/Core/Term.vuna:186"));
  ("Core_dTerm.v_bodyTermsOf", ("Vuna.Compiler.Core.Term.bodyTermsOf", "Vuna/Compiler/Core/Term.vuna:526"));
  ("Core_dTerm.v_caseAltBinders", ("Vuna.Compiler.Core.Term.caseAltBinders", "Vuna/Compiler/Core/Term.vuna:198"));
  ("Core_dTerm.v_caseAltBody", ("Vuna.Compiler.Core.Term.caseAltBody", "Vuna/Compiler/Core/Term.vuna:201"));
  ("Core_dTerm.v_caseAltName", ("Vuna.Compiler.Core.Term.caseAltName", "Vuna/Compiler/Core/Term.vuna:195"));
  ("Core_dTerm.v_countLams", ("Vuna.Compiler.Core.Term.countLams", "Vuna/Compiler/Core/Term.vuna:863"));
  ("Core_dTerm.v_countPis", ("Vuna.Compiler.Core.Term.countPis", "Vuna/Compiler/Core/Term.vuna:843"));
  ("Core_dTerm.v_cutoffOf", ("Vuna.Compiler.Core.Term.cutoffOf", "Vuna/Compiler/Core/Term.vuna:840"));
  ("Core_dTerm.v_defLookup", ("Vuna.Compiler.Core.Term.defLookup", "Vuna/Compiler/Core/Term.vuna:538"));
  ("Core_dTerm.v_defaultExplicitRig", ("Vuna.Compiler.Core.Term.defaultExplicitRig", "Vuna/Compiler/Core/Term.vuna:55"));
  ("Core_dTerm.v_defaultFuel", ("Vuna.Compiler.Core.Term.defaultFuel", "Vuna/Compiler/Core/Term.vuna:239"));
  ("Core_dTerm.v_flattenTermApp", ("Vuna.Compiler.Core.Term.flattenTermApp", "Vuna/Compiler/Core/Term.vuna:296"));
  ("Core_dTerm.v_flattenTermAppGo", ("Vuna.Compiler.Core.Term.flattenTermAppGo", "Vuna/Compiler/Core/Term.vuna:299"));
  ("Core_dTerm.v_hasFreeTermVar", ("Vuna.Compiler.Core.Term.hasFreeTermVar", "Vuna/Compiler/Core/Term.vuna:868"));
  ("Core_dTerm.v_hasFreeTermVarMaybe", ("Vuna.Compiler.Core.Term.hasFreeTermVarMaybe", "Vuna/Compiler/Core/Term.vuna:891"));
  ("Core_dTerm.v_hasFreeVar", ("Vuna.Compiler.Core.Term.hasFreeVar", "Vuna/Compiler/Core/Term.vuna:542"));
  ("Core_dTerm.v_hasFreeVarAlts", ("Vuna.Compiler.Core.Term.hasFreeVarAlts", "Vuna/Compiler/Core/Term.vuna:578"));
  ("Core_dTerm.v_hasFreeVarArgs", ("Vuna.Compiler.Core.Term.hasFreeVarArgs", "Vuna/Compiler/Core/Term.vuna:574"));
  ("Core_dTerm.v_hasFreeVarMaybe", ("Vuna.Compiler.Core.Term.hasFreeVarMaybe", "Vuna/Compiler/Core/Term.vuna:570"));
  ("Core_dTerm.v_hasMeta", ("Vuna.Compiler.Core.Term.hasMeta", "Vuna/Compiler/Core/Term.vuna:583"));
  ("Core_dTerm.v_hasMetaAlts", ("Vuna.Compiler.Core.Term.hasMetaAlts", "Vuna/Compiler/Core/Term.vuna:618"));
  ("Core_dTerm.v_hasMetaArgs", ("Vuna.Compiler.Core.Term.hasMetaArgs", "Vuna/Compiler/Core/Term.vuna:614"));
  ("Core_dTerm.v_hasMetaMaybe", ("Vuna.Compiler.Core.Term.hasMetaMaybe", "Vuna/Compiler/Core/Term.vuna:610"));
  ("Core_dTerm.v_hasNegativeVar", ("Vuna.Compiler.Core.Term.hasNegativeVar", "Vuna/Compiler/Core/Term.vuna:906"));
  ("Core_dTerm.v_hasNegativeVarMaybe", ("Vuna.Compiler.Core.Term.hasNegativeVarMaybe", "Vuna/Compiler/Core/Term.vuna:926"));
  ("Core_dTerm.v_hasUnsolvedMetaClo", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaClo", "Vuna/Compiler/Core/Term.vuna:981"));
  ("Core_dTerm.v_hasUnsolvedMetaCloFuel", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaCloFuel", "Vuna/Compiler/Core/Term.vuna:984"));
  ("Core_dTerm.v_hasUnsolvedMetaList", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaList", "Vuna/Compiler/Core/Term.vuna:969"));
  ("Core_dTerm.v_hasUnsolvedMetaListFuel", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaListFuel", "Vuna/Compiler/Core/Term.vuna:972"));
  ("Core_dTerm.v_hasUnsolvedMetaValue", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaValue", "Vuna/Compiler/Core/Term.vuna:943"));
  ("Core_dTerm.v_hasUnsolvedMetaValueFuel", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaValueFuel", "Vuna/Compiler/Core/Term.vuna:946"));
  ("Core_dTerm.v_insertDictBinder", ("Vuna.Compiler.Core.Term.insertDictBinder", "Vuna/Compiler/Core/Term.vuna:813"));
  ("Core_dTerm.v_insertDictBinderGo", ("Vuna.Compiler.Core.Term.insertDictBinderGo", "Vuna/Compiler/Core/Term.vuna:819"));
  ("Core_dTerm.v_insertImplicitBinder", ("Vuna.Compiler.Core.Term.insertImplicitBinder", "Vuna/Compiler/Core/Term.vuna:828"));
  ("Core_dTerm.v_insertImplicitBinderGo", ("Vuna.Compiler.Core.Term.insertImplicitBinderGo", "Vuna/Compiler/Core/Term.vuna:831"));
  ("Core_dTerm.v_insertLamBinder", ("Vuna.Compiler.Core.Term.insertLamBinder", "Vuna/Compiler/Core/Term.vuna:852"));
  ("Core_dTerm.v_insertLamBinderGo", ("Vuna.Compiler.Core.Term.insertLamBinderGo", "Vuna/Compiler/Core/Term.vuna:855"));
  ("Core_dTerm.v_isTypeValue", ("Vuna.Compiler.Core.Term.isTypeValue", "Vuna/Compiler/Core/Term.vuna:995"));
  ("Core_dTerm.v_lamBinderTyOf", ("Vuna.Compiler.Core.Term.lamBinderTyOf", "Vuna/Compiler/Core/Term.vuna:635"));
  ("Core_dTerm.v_lamResultTyOf", ("Vuna.Compiler.Core.Term.lamResultTyOf", "Vuna/Compiler/Core/Term.vuna:639"));
  ("Core_dTerm.v_lamTyMap", ("Vuna.Compiler.Core.Term.lamTyMap", "Vuna/Compiler/Core/Term.vuna:653"));
  ("Core_dTerm.v_lamTyOf", ("Vuna.Compiler.Core.Term.lamTyOf", "Vuna/Compiler/Core/Term.vuna:643"));
  ("Core_dTerm.v_lamTyWithBinder", ("Vuna.Compiler.Core.Term.lamTyWithBinder", "Vuna/Compiler/Core/Term.vuna:647"));
  ("Core_dTerm.v_lamTyWithResult", ("Vuna.Compiler.Core.Term.lamTyWithResult", "Vuna/Compiler/Core/Term.vuna:650"));
  ("Core_dTerm.v_levelEq", ("Vuna.Compiler.Core.Term.levelEq", "Vuna/Compiler/Core/Term.vuna:116"));
  ("Core_dTerm.v_levelEscapes", ("Vuna.Compiler.Core.Term.levelEscapes", "Vuna/Compiler/Core/Term.vuna:1007"));
  ("Core_dTerm.v_levelEscapesClo", ("Vuna.Compiler.Core.Term.levelEscapesClo", "Vuna/Compiler/Core/Term.vuna:1032"));
  ("Core_dTerm.v_levelEscapesList", ("Vuna.Compiler.Core.Term.levelEscapesList", "Vuna/Compiler/Core/Term.vuna:1028"));
  ("Core_dTerm.v_levelLt", ("Vuna.Compiler.Core.Term.levelLt", "Vuna/Compiler/Core/Term.vuna:119"));
  ("Core_dTerm.v_levelMax", ("Vuna.Compiler.Core.Term.levelMax", "Vuna/Compiler/Core/Term.vuna:106"));
  ("Core_dTerm.v_levelOfInt", ("Vuna.Compiler.Core.Term.levelOfInt", "Vuna/Compiler/Core/Term.vuna:113"));
  ("Core_dTerm.v_levelSucc", ("Vuna.Compiler.Core.Term.levelSucc", "Vuna/Compiler/Core/Term.vuna:103"));
  ("Core_dTerm.v_levelToInt", ("Vuna.Compiler.Core.Term.levelToInt", "Vuna/Compiler/Core/Term.vuna:109"));
  ("Core_dTerm.v_levelZero", ("Vuna.Compiler.Core.Term.levelZero", "Vuna/Compiler/Core/Term.vuna:100"));
  ("Core_dTerm.v_lookupPair", ("Vuna.Compiler.Core.Term.lookupPair", "Vuna/Compiler/Core/Term.vuna:534"));
  ("Core_dTerm.v_mapTermMaybe", ("Vuna.Compiler.Core.Term.mapTermMaybe", "Vuna/Compiler/Core/Term.vuna:624"));
  ("Core_dTerm.v_metaLookup", ("Vuna.Compiler.Core.Term.metaLookup", "Vuna/Compiler/Core/Term.vuna:349"));
  ("Core_dTerm.v_metaLookupList", ("Vuna.Compiler.Core.Term.metaLookupList", "Vuna/Compiler/Core/Term.vuna:353"));
  ("Core_dTerm.v_metaScanBound", ("Vuna.Compiler.Core.Term.metaScanBound", "Vuna/Compiler/Core/Term.vuna:940"));
  ("Core_dTerm.v_natChainArgs", ("Vuna.Compiler.Core.Term.natChainArgs", "Vuna/Compiler/Core/Term.vuna:275"));
  ("Core_dTerm.v_natChainGo", ("Vuna.Compiler.Core.Term.natChainGo", "Vuna/Compiler/Core/Term.vuna:263"));
  ("Core_dTerm.v_natChainMax", ("Vuna.Compiler.Core.Term.natChainMax", "Vuna/Compiler/Core/Term.vuna:253"));
  ("Core_dTerm.v_natChainNext", ("Vuna.Compiler.Core.Term.natChainNext", "Vuna/Compiler/Core/Term.vuna:292"));
  ("Core_dTerm.v_natChainValue", ("Vuna.Compiler.Core.Term.natChainValue", "Vuna/Compiler/Core/Term.vuna:260"));
  ("Core_dTerm.v_reachesTermsFuel", ("Vuna.Compiler.Core.Term.reachesTermsFuel", "Vuna/Compiler/Core/Term.vuna:514"));
  ("Core_dTerm.v_recordAppShow", ("Vuna.Compiler.Core.Term.recordAppShow", "Vuna/Compiler/Core/Term.vuna:1097"));
  ("Core_dTerm.v_rigAdd", ("Vuna.Compiler.Core.Term.rigAdd", "Vuna/Compiler/Core/Term.vuna:62"));
  ("Core_dTerm.v_rigExact", ("Vuna.Compiler.Core.Term.rigExact", "Vuna/Compiler/Core/Term.vuna:82"));
  ("Core_dTerm.v_rigIsErased", ("Vuna.Compiler.Core.Term.rigIsErased", "Vuna/Compiler/Core/Term.vuna:35"));
  ("Core_dTerm.v_rigIsLinear", ("Vuna.Compiler.Core.Term.rigIsLinear", "Vuna/Compiler/Core/Term.vuna:40"));
  ("Core_dTerm.v_rigIsOmega", ("Vuna.Compiler.Core.Term.rigIsOmega", "Vuna/Compiler/Core/Term.vuna:44"));
  ("Core_dTerm.v_rigJoin", ("Vuna.Compiler.Core.Term.rigJoin", "Vuna/Compiler/Core/Term.vuna:74"));
  ("Core_dTerm.v_rigOfBinder", ("Vuna.Compiler.Core.Term.rigOfBinder", "Vuna/Compiler/Core/Term.vuna:50"));
  ("Core_dTerm.v_rigScale", ("Vuna.Compiler.Core.Term.rigScale", "Vuna/Compiler/Core/Term.vuna:68"));
  ("Core_dTerm.v_shift", ("Vuna.Compiler.Core.Term.shift", "Vuna/Compiler/Core/Term.vuna:662"));
  ("Core_dTerm.v_shiftAlt", ("Vuna.Compiler.Core.Term.shiftAlt", "Vuna/Compiler/Core/Term.vuna:710"));
  ("Core_dTerm.v_shiftAlts", ("Vuna.Compiler.Core.Term.shiftAlts", "Vuna/Compiler/Core/Term.vuna:706"));
  ("Core_dTerm.v_shiftArgs", ("Vuna.Compiler.Core.Term.shiftArgs", "Vuna/Compiler/Core/Term.vuna:701"));
  ("Core_dTerm.v_showArgTerms", ("Vuna.Compiler.Core.Term.showArgTerms", "Vuna/Compiler/Core/Term.vuna:1092"));
  ("Core_dTerm.v_showBinders", ("Vuna.Compiler.Core.Term.showBinders", "Vuna/Compiler/Core/Term.vuna:1112"));
  ("Core_dTerm.v_showCoreAlts", ("Vuna.Compiler.Core.Term.showCoreAlts", "Vuna/Compiler/Core/Term.vuna:1107"));
  ("Core_dTerm.v_showCoreChars", ("Vuna.Compiler.Core.Term.showCoreChars", "Vuna/Compiler/Core/Term.vuna:1119"));
  ("Core_dTerm.v_showCoreString", ("Vuna.Compiler.Core.Term.showCoreString", "Vuna/Compiler/Core/Term.vuna:1116"));
  ("Core_dTerm.v_showPiSig", ("Vuna.Compiler.Core.Term.showPiSig", "Vuna/Compiler/Core/Term.vuna:1067"));
  ("Core_dTerm.v_showRig", ("Vuna.Compiler.Core.Term.showRig", "Vuna/Compiler/Core/Term.vuna:89"));
  ("Core_dTerm.v_showSigAppText", ("Vuna.Compiler.Core.Term.showSigAppText", "Vuna/Compiler/Core/Term.vuna:1102"));
  ("Core_dTerm.v_showSigArgs", ("Vuna.Compiler.Core.Term.showSigArgs", "Vuna/Compiler/Core/Term.vuna:1088"));
  ("Core_dTerm.v_showSigParenIfPi", ("Vuna.Compiler.Core.Term.showSigParenIfPi", "Vuna/Compiler/Core/Term.vuna:1084"));
  ("Core_dTerm.v_showTerm", ("Vuna.Compiler.Core.Term.showTerm", "Vuna/Compiler/Core/Term.vuna:1035"));
  ("Core_dTerm.v_showTypeSig", ("Vuna.Compiler.Core.Term.showTypeSig", "Vuna/Compiler/Core/Term.vuna:1076"));
  ("Core_dTerm.v_solsCons", ("Vuna.Compiler.Core.Term.solsCons", "Vuna/Compiler/Core/Term.vuna:394"));
  ("Core_dTerm.v_solsDepth", ("Vuna.Compiler.Core.Term.solsDepth", "Vuna/Compiler/Core/Term.vuna:386"));
  ("Core_dTerm.v_solsEmpty", ("Vuna.Compiler.Core.Term.solsEmpty", "Vuna/Compiler/Core/Term.vuna:372"));
  ("Core_dTerm.v_solsFromList", ("Vuna.Compiler.Core.Term.solsFromList", "Vuna/Compiler/Core/Term.vuna:375"));
  ("Core_dTerm.v_solsList", ("Vuna.Compiler.Core.Term.solsList", "Vuna/Compiler/Core/Term.vuna:382"));
  ("Core_dTerm.v_solsLookup", ("Vuna.Compiler.Core.Term.solsLookup", "Vuna/Compiler/Core/Term.vuna:391"));
  ("Core_dTerm.v_solsOf", ("Vuna.Compiler.Core.Term.solsOf", "Vuna/Compiler/Core/Term.vuna:379"));
  ("Core_dTerm.v_substAltAt", ("Vuna.Compiler.Core.Term.substAltAt", "Vuna/Compiler/Core/Term.vuna:757"));
  ("Core_dTerm.v_substMetaVar", ("Vuna.Compiler.Core.Term.substMetaVar", "Vuna/Compiler/Core/Term.vuna:764"));
  ("Core_dTerm.v_substMetaVarAlt", ("Vuna.Compiler.Core.Term.substMetaVarAlt", "Vuna/Compiler/Core/Term.vuna:807"));
  ("Core_dTerm.v_substMetaVarGo", ("Vuna.Compiler.Core.Term.substMetaVarGo", "Vuna/Compiler/Core/Term.vuna:767"));
  ("Core_dTerm.v_substVarAt", ("Vuna.Compiler.Core.Term.substVarAt", "Vuna/Compiler/Core/Term.vuna:715"));
  ("Core_dTerm.v_termGlobalNames", ("Vuna.Compiler.Core.Term.termGlobalNames", "Vuna/Compiler/Core/Term.vuna:482"));
  ("Core_dTerm.v_termHasUnsolvedMeta", ("Vuna.Compiler.Core.Term.termHasUnsolvedMeta", "Vuna/Compiler/Core/Term.vuna:399"));
  ("Core_dTerm.v_termHasUnsolvedMetaAlts", ("Vuna.Compiler.Core.Term.termHasUnsolvedMetaAlts", "Vuna/Compiler/Core/Term.vuna:441"));
  ("Core_dTerm.v_termHasUnsolvedMetaArgs", ("Vuna.Compiler.Core.Term.termHasUnsolvedMetaArgs", "Vuna/Compiler/Core/Term.vuna:436"));
  ("Core_dTerm.v_termHasUnsolvedMetaMaybe", ("Vuna.Compiler.Core.Term.termHasUnsolvedMetaMaybe", "Vuna/Compiler/Core/Term.vuna:432"));
  ("Core_dTerm.v_termReachesFloat", ("Vuna.Compiler.Core.Term.termReachesFloat", "Vuna/Compiler/Core/Term.vuna:509"));
  ("Core_dTerm.v_termSize", ("Vuna.Compiler.Core.Term.termSize", "Vuna/Compiler/Core/Term.vuna:307"));
  ("Core_dTerm.v_termSizeAlts", ("Vuna.Compiler.Core.Term.termSizeAlts", "Vuna/Compiler/Core/Term.vuna:341"));
  ("Core_dTerm.v_termSizeArgs", ("Vuna.Compiler.Core.Term.termSizeArgs", "Vuna/Compiler/Core/Term.vuna:337"));
  ("Core_dTerm.v_termSizeMaybe", ("Vuna.Compiler.Core.Term.termSizeMaybe", "Vuna/Compiler/Core/Term.vuna:333"));
  ("Core_dTerm.v_termUsesFloat", ("Vuna.Compiler.Core.Term.termUsesFloat", "Vuna/Compiler/Core/Term.vuna:448"));
  ("Core_dTerm.v_typeLevelOf", ("Vuna.Compiler.Core.Term.typeLevelOf", "Vuna/Compiler/Core/Term.vuna:999"));
  ("Driver_dCache.v_bodyIssueAt", ("Vuna.Compiler.Driver.Cache.bodyIssueAt", "Vuna/Compiler/Driver/Cache.vuna:226"));
  ("Driver_dCache.v_bodyValid", ("Vuna.Compiler.Driver.Cache.bodyValid", "Vuna/Compiler/Driver/Cache.vuna:158"));
  ("Driver_dCache.v_cachedClasses", ("Vuna.Compiler.Driver.Cache.cachedClasses", "Vuna/Compiler/Driver/Cache.vuna:49"));
  ("Driver_dCache.v_cachedDatas", ("Vuna.Compiler.Driver.Cache.cachedDatas", "Vuna/Compiler/Driver/Cache.vuna:37"));
  ("Driver_dCache.v_cachedDefs", ("Vuna.Compiler.Driver.Cache.cachedDefs", "Vuna/Compiler/Driver/Cache.vuna:40"));
  ("Driver_dCache.v_cachedGlobals", ("Vuna.Compiler.Driver.Cache.cachedGlobals", "Vuna/Compiler/Driver/Cache.vuna:43"));
  ("Driver_dCache.v_cachedInsts", ("Vuna.Compiler.Driver.Cache.cachedInsts", "Vuna/Compiler/Driver/Cache.vuna:46"));
  ("Driver_dCache.v_cachedOfProgram", ("Vuna.Compiler.Driver.Cache.cachedOfProgram", "Vuna/Compiler/Driver/Cache.vuna:115"));
  ("Driver_dCache.v_cachedOfProgramWith", ("Vuna.Compiler.Driver.Cache.cachedOfProgramWith", "Vuna/Compiler/Driver/Cache.vuna:121"));
  ("Driver_dCache.v_cachedOpaqueOf", ("Vuna.Compiler.Driver.Cache.cachedOpaqueOf", "Vuna/Compiler/Driver/Cache.vuna:52"));
  ("Driver_dCache.v_cachedProgramIssue", ("Vuna.Compiler.Driver.Cache.cachedProgramIssue", "Vuna/Compiler/Driver/Cache.vuna:321"));
  ("Driver_dCache.v_cachedProgramValid", ("Vuna.Compiler.Driver.Cache.cachedProgramValid", "Vuna/Compiler/Driver/Cache.vuna:190"));
  ("Driver_dCache.v_classIssue", ("Vuna.Compiler.Driver.Cache.classIssue", "Vuna/Compiler/Driver/Cache.vuna:298"));
  ("Driver_dCache.v_classesIssue", ("Vuna.Compiler.Driver.Cache.classesIssue", "Vuna/Compiler/Driver/Cache.vuna:314"));
  ("Driver_dCache.v_classesValid", ("Vuna.Compiler.Driver.Cache.classesValid", "Vuna/Compiler/Driver/Cache.vuna:181"));
  ("Driver_dCache.v_ctorIssues", ("Vuna.Compiler.Driver.Cache.ctorIssues", "Vuna/Compiler/Driver/Cache.vuna:212"));
  ("Driver_dCache.v_ctorsValid", ("Vuna.Compiler.Driver.Cache.ctorsValid", "Vuna/Compiler/Driver/Cache.vuna:140"));
  ("Driver_dCache.v_ctxIssues", ("Vuna.Compiler.Driver.Cache.ctxIssues", "Vuna/Compiler/Driver/Cache.vuna:284"));
  ("Driver_dCache.v_dataIssue", ("Vuna.Compiler.Driver.Cache.dataIssue", "Vuna/Compiler/Driver/Cache.vuna:206"));
  ("Driver_dCache.v_datasIssue", ("Vuna.Compiler.Driver.Cache.datasIssue", "Vuna/Compiler/Driver/Cache.vuna:219"));
  ("Driver_dCache.v_datasValid", ("Vuna.Compiler.Driver.Cache.datasValid", "Vuna/Compiler/Driver/Cache.vuna:144"));
  ("Driver_dCache.v_decCachedProgram", ("Vuna.Compiler.Driver.Cache.decCachedProgram", "Vuna/Compiler/Driver/Cache.vuna:494"));
  ("Driver_dCache.v_decCachedProgramComplete", ("Vuna.Compiler.Driver.Cache.decCachedProgramComplete", "Vuna/Compiler/Driver/Cache.vuna:488"));
  ("Driver_dCache.v_decGlobalPair", ("Vuna.Compiler.Driver.Cache.decGlobalPair", "Vuna/Compiler/Driver/Cache.vuna:500"));
  ("Driver_dCache.v_defIssue", ("Vuna.Compiler.Driver.Cache.defIssue", "Vuna/Compiler/Driver/Cache.vuna:232"));
  ("Driver_dCache.v_defsIssue", ("Vuna.Compiler.Driver.Cache.defsIssue", "Vuna/Compiler/Driver/Cache.vuna:246"));
  ("Driver_dCache.v_defsValid", ("Vuna.Compiler.Driver.Cache.defsValid", "Vuna/Compiler/Driver/Cache.vuna:149"));
  ("Driver_dCache.v_encCachedProgram", ("Vuna.Compiler.Driver.Cache.encCachedProgram", "Vuna/Compiler/Driver/Cache.vuna:477"));
  ("Driver_dCache.v_encGlobalPair", ("Vuna.Compiler.Driver.Cache.encGlobalPair", "Vuna/Compiler/Driver/Cache.vuna:484"));
  ("Driver_dCache.v_fixClass", ("Vuna.Compiler.Driver.Cache.fixClass", "Vuna/Compiler/Driver/Cache.vuna:93"));
  ("Driver_dCache.v_fixCtor", ("Vuna.Compiler.Driver.Cache.fixCtor", "Vuna/Compiler/Driver/Cache.vuna:70"));
  ("Driver_dCache.v_fixData", ("Vuna.Compiler.Driver.Cache.fixData", "Vuna/Compiler/Driver/Cache.vuna:77"));
  ("Driver_dCache.v_fixDef", ("Vuna.Compiler.Driver.Cache.fixDef", "Vuna/Compiler/Driver/Cache.vuna:65"));
  ("Driver_dCache.v_fixFieldMeta", ("Vuna.Compiler.Driver.Cache.fixFieldMeta", "Vuna/Compiler/Driver/Cache.vuna:75"));
  ("Driver_dCache.v_fixInst", ("Vuna.Compiler.Driver.Cache.fixInst", "Vuna/Compiler/Driver/Cache.vuna:109"));
  ("Driver_dCache.v_fixTele", ("Vuna.Compiler.Driver.Cache.fixTele", "Vuna/Compiler/Driver/Cache.vuna:104"));
  ("Driver_dCache.v_fixTerm", ("Vuna.Compiler.Driver.Cache.fixTerm", "Vuna/Compiler/Driver/Cache.vuna:62"));
  ("Driver_dCache.v_globalsIssue", ("Vuna.Compiler.Driver.Cache.globalsIssue", "Vuna/Compiler/Driver/Cache.vuna:253"));
  ("Driver_dCache.v_globalsValid", ("Vuna.Compiler.Driver.Cache.globalsValid", "Vuna/Compiler/Driver/Cache.vuna:161"));
  ("Driver_dCache.v_instIssue", ("Vuna.Compiler.Driver.Cache.instIssue", "Vuna/Compiler/Driver/Cache.vuna:260"));
  ("Driver_dCache.v_instsIssue", ("Vuna.Compiler.Driver.Cache.instsIssue", "Vuna/Compiler/Driver/Cache.vuna:291"));
  ("Driver_dCache.v_instsValid", ("Vuna.Compiler.Driver.Cache.instsValid", "Vuna/Compiler/Driver/Cache.vuna:173"));
  ("Driver_dCache.v_shiftAlts", ("Vuna.Compiler.Driver.Cache.shiftAlts", "Vuna/Compiler/Driver/Cache.vuna:407"));
  ("Driver_dCache.v_shiftArgs", ("Vuna.Compiler.Driver.Cache.shiftArgs", "Vuna/Compiler/Driver/Cache.vuna:400"));
  ("Driver_dCache.v_shiftCachedProgram", ("Vuna.Compiler.Driver.Cache.shiftCachedProgram", "Vuna/Compiler/Driver/Cache.vuna:461"));
  ("Driver_dCache.v_shiftClass", ("Vuna.Compiler.Driver.Cache.shiftClass", "Vuna/Compiler/Driver/Cache.vuna:445"));
  ("Driver_dCache.v_shiftCtor", ("Vuna.Compiler.Driver.Cache.shiftCtor", "Vuna/Compiler/Driver/Cache.vuna:424"));
  ("Driver_dCache.v_shiftData", ("Vuna.Compiler.Driver.Cache.shiftData", "Vuna/Compiler/Driver/Cache.vuna:432"));
  ("Driver_dCache.v_shiftDef", ("Vuna.Compiler.Driver.Cache.shiftDef", "Vuna/Compiler/Driver/Cache.vuna:414"));
  ("Driver_dCache.v_shiftFieldMeta", ("Vuna.Compiler.Driver.Cache.shiftFieldMeta", "Vuna/Compiler/Driver/Cache.vuna:428"));
  ("Driver_dCache.v_shiftGlobal", ("Vuna.Compiler.Driver.Cache.shiftGlobal", "Vuna/Compiler/Driver/Cache.vuna:457"));
  ("Driver_dCache.v_shiftInst", ("Vuna.Compiler.Driver.Cache.shiftInst", "Vuna/Compiler/Driver/Cache.vuna:451"));
  ("Driver_dCache.v_shiftLamTyFuel", ("Vuna.Compiler.Driver.Cache.shiftLamTyFuel", "Vuna/Compiler/Driver/Cache.vuna:386"));
  ("Driver_dCache.v_shiftTele", ("Vuna.Compiler.Driver.Cache.shiftTele", "Vuna/Compiler/Driver/Cache.vuna:438"));
  ("Driver_dCache.v_shiftTerm", ("Vuna.Compiler.Driver.Cache.shiftTerm", "Vuna/Compiler/Driver/Cache.vuna:357"));
  ("Driver_dCache.v_shiftTermFuel", ("Vuna.Compiler.Driver.Cache.shiftTermFuel", "Vuna/Compiler/Driver/Cache.vuna:360"));
  ("Driver_dCache.v_shiftTermMaybeFuel", ("Vuna.Compiler.Driver.Cache.shiftTermMaybeFuel", "Vuna/Compiler/Driver/Cache.vuna:394"));
  ("Driver_dCache.v_summaryMetaSegment", ("Vuna.Compiler.Driver.Cache.summaryMetaSegment", "Vuna/Compiler/Driver/Cache.vuna:347"));
  ("Driver_dCache.v_teleIssueGo", ("Vuna.Compiler.Driver.Cache.teleIssueGo", "Vuna/Compiler/Driver/Cache.vuna:277"));
  ("Driver_dCache.v_teleValid", ("Vuna.Compiler.Driver.Cache.teleValid", "Vuna/Compiler/Driver/Cache.vuna:165"));
  ("Driver_dCache.v_termIssueAt", ("Vuna.Compiler.Driver.Cache.termIssueAt", "Vuna/Compiler/Driver/Cache.vuna:198"));
  ("Driver_dCache.v_termValidAt", ("Vuna.Compiler.Driver.Cache.termValidAt", "Vuna/Compiler/Driver/Cache.vuna:136"));
  ("Driver_dCache.v_termsValidAt", ("Vuna.Compiler.Driver.Cache.termsValidAt", "Vuna/Compiler/Driver/Cache.vuna:169"));
  ("Driver_dCache.v_withCachedOpaque", ("Vuna.Compiler.Driver.Cache.withCachedOpaque", "Vuna/Compiler/Driver/Cache.vuna:55"));
  ("Driver_dCompile.v_absoluteSpanLabel", ("Vuna.Compiler.Driver.Compile.absoluteSpanLabel", "Vuna/Compiler/Driver/Compile.vuna:1679"));
  ("Driver_dCompile.v_allNamesIn", ("Vuna.Compiler.Driver.Compile.allNamesIn", "Vuna/Compiler/Driver/Compile.vuna:820"));
  ("Driver_dCompile.v_allSelfHashesOk", ("Vuna.Compiler.Driver.Compile.allSelfHashesOk", "Vuna/Compiler/Driver/Compile.vuna:2303"));
  ("Driver_dCompile.v_allStableDiags", ("Vuna.Compiler.Driver.Compile.allStableDiags", "Vuna/Compiler/Driver/Compile.vuna:1703"));
  ("Driver_dCompile.v_anyAbsoluteChild", ("Vuna.Compiler.Driver.Compile.anyAbsoluteChild", "Vuna/Compiler/Driver/Compile.vuna:1689"));
  ("Driver_dCompile.v_anyExportFrom", ("Vuna.Compiler.Driver.Compile.anyExportFrom", "Vuna/Compiler/Driver/Compile.vuna:2049"));
  ("Driver_dCompile.v_auditCheckExe", ("Vuna.Compiler.Driver.Compile.auditCheckExe", "Vuna/Compiler/Driver/Compile.vuna:1921"));
  ("Driver_dCompile.v_auditCheckLib", ("Vuna.Compiler.Driver.Compile.auditCheckLib", "Vuna/Compiler/Driver/Compile.vuna:2390"));
  ("Driver_dCompile.v_auditCompare", ("Vuna.Compiler.Driver.Compile.auditCompare", "Vuna/Compiler/Driver/Compile.vuna:1969"));
  ("Driver_dCompile.v_auditCompile", ("Vuna.Compiler.Driver.Compile.auditCompile", "Vuna/Compiler/Driver/Compile.vuna:291"));
  ("Driver_dCompile.v_baseDepIfacesOf", ("Vuna.Compiler.Driver.Compile.baseDepIfacesOf", "Vuna/Compiler/Driver/Compile.vuna:1383"));
  ("Driver_dCompile.v_buildIdForEff", ("Vuna.Compiler.Driver.Compile.buildIdForEff", "Vuna/Compiler/Driver/Compile.vuna:574"));
  ("Driver_dCompile.v_buildMetaText", ("Vuna.Compiler.Driver.Compile.buildMetaText", "Vuna/Compiler/Driver/Compile.vuna:676"));
  ("Driver_dCompile.v_buildSplit", ("Vuna.Compiler.Driver.Compile.buildSplit", "Vuna/Compiler/Driver/Compile.vuna:407"));
  ("Driver_dCompile.v_buildViewAddrOf", ("Vuna.Compiler.Driver.Compile.buildViewAddrOf", "Vuna/Compiler/Driver/Compile.vuna:2551"));
  ("Driver_dCompile.v_cacheBase", ("Vuna.Compiler.Driver.Compile.cacheBase", "Vuna/Compiler/Driver/Compile.vuna:448"));
  ("Driver_dCompile.v_canonicalDir", ("Vuna.Compiler.Driver.Compile.canonicalDir", "Vuna/Compiler/Driver/Compile.vuna:1656"));
  ("Driver_dCompile.v_canonicalPath", ("Vuna.Compiler.Driver.Compile.canonicalPath", "Vuna/Compiler/Driver/Compile.vuna:1660"));
  ("Driver_dCompile.v_checkAndShadow", ("Vuna.Compiler.Driver.Compile.checkAndShadow", "Vuna/Compiler/Driver/Compile.vuna:2315"));
  ("Driver_dCompile.v_checkCachedExe", ("Vuna.Compiler.Driver.Compile.checkCachedExe", "Vuna/Compiler/Driver/Compile.vuna:1851"));
  ("Driver_dCompile.v_checkCachedLib", ("Vuna.Compiler.Driver.Compile.checkCachedLib", "Vuna/Compiler/Driver/Compile.vuna:2328"));
  ("Driver_dCompile.v_checkInOf", ("Vuna.Compiler.Driver.Compile.checkInOf", "Vuna/Compiler/Driver/Compile.vuna:2559"));
  ("Driver_dCompile.v_checkModsExe", ("Vuna.Compiler.Driver.Compile.checkModsExe", "Vuna/Compiler/Driver/Compile.vuna:772"));
  ("Driver_dCompile.v_checkModsLib", ("Vuna.Compiler.Driver.Compile.checkModsLib", "Vuna/Compiler/Driver/Compile.vuna:785"));
  ("Driver_dCompile.v_checkModsOf", ("Vuna.Compiler.Driver.Compile.checkModsOf", "Vuna/Compiler/Driver/Compile.vuna:1744"));
  ("Driver_dCompile.v_checkNodeSchema", ("Vuna.Compiler.Driver.Compile.checkNodeSchema", "Vuna/Compiler/Driver/Compile.vuna:727"));
  ("Driver_dCompile.v_checkPackage", ("Vuna.Compiler.Driver.Compile.checkPackage", "Vuna/Compiler/Driver/Compile.vuna:91"));
  ("Driver_dCompile.v_checkSignatureOf", ("Vuna.Compiler.Driver.Compile.checkSignatureOf", "Vuna/Compiler/Driver/Compile.vuna:1953"));
  ("Driver_dCompile.v_checkUncachedExe", ("Vuna.Compiler.Driver.Compile.checkUncachedExe", "Vuna/Compiler/Driver/Compile.vuna:1863"));
  ("Driver_dCompile.v_checkUncachedLib", ("Vuna.Compiler.Driver.Compile.checkUncachedLib", "Vuna/Compiler/Driver/Compile.vuna:2337"));
  ("Driver_dCompile.v_checkViaGraph", ("Vuna.Compiler.Driver.Compile.checkViaGraph", "Vuna/Compiler/Driver/Compile.vuna:1772"));
  ("Driver_dCompile.v_cleanFixpoint", ("Vuna.Compiler.Driver.Compile.cleanFixpoint", "Vuna/Compiler/Driver/Compile.vuna:1576"));
  ("Driver_dCompile.v_cleanHashOf", ("Vuna.Compiler.Driver.Compile.cleanHashOf", "Vuna/Compiler/Driver/Compile.vuna:2117"));
  ("Driver_dCompile.v_cleanIfacesOrEmpty", ("Vuna.Compiler.Driver.Compile.cleanIfacesOrEmpty", "Vuna/Compiler/Driver/Compile.vuna:2085"));
  ("Driver_dCompile.v_cleanPass", ("Vuna.Compiler.Driver.Compile.cleanPass", "Vuna/Compiler/Driver/Compile.vuna:1591"));
  ("Driver_dCompile.v_cleanSelfOk", ("Vuna.Compiler.Driver.Compile.cleanSelfOk", "Vuna/Compiler/Driver/Compile.vuna:1554"));
  ("Driver_dCompile.v_closureEdges", ("Vuna.Compiler.Driver.Compile.closureEdges", "Vuna/Compiler/Driver/Compile.vuna:1341"));
  ("Driver_dCompile.v_closureFuel", ("Vuna.Compiler.Driver.Compile.closureFuel", "Vuna/Compiler/Driver/Compile.vuna:1338"));
  ("Driver_dCompile.v_closureHashOf", ("Vuna.Compiler.Driver.Compile.closureHashOf", "Vuna/Compiler/Driver/Compile.vuna:528"));
  ("Driver_dCompile.v_closureModsEff", ("Vuna.Compiler.Driver.Compile.closureModsEff", "Vuna/Compiler/Driver/Compile.vuna:900"));
  ("Driver_dCompile.v_collectClean", ("Vuna.Compiler.Driver.Compile.collectClean", "Vuna/Compiler/Driver/Compile.vuna:2070"));
  ("Driver_dCompile.v_collectDepPackages", ("Vuna.Compiler.Driver.Compile.collectDepPackages", "Vuna/Compiler/Driver/Compile.vuna:801"));
  ("Driver_dCompile.v_collectDepPackagesFuel", ("Vuna.Compiler.Driver.Compile.collectDepPackagesFuel", "Vuna/Compiler/Driver/Compile.vuna:804"));
  ("Driver_dCompile.v_collectVunaMeta", ("Vuna.Compiler.Driver.Compile.collectVunaMeta", "Vuna/Compiler/Driver/Compile.vuna:456"));
  ("Driver_dCompile.v_compileToDir", ("Vuna.Compiler.Driver.Compile.compileToDir", "Vuna/Compiler/Driver/Compile.vuna:163"));
  ("Driver_dCompile.v_compileToDirNormal", ("Vuna.Compiler.Driver.Compile.compileToDirNormal", "Vuna/Compiler/Driver/Compile.vuna:207"));
  ("Driver_dCompile.v_compilerClosureModule", ("Vuna.Compiler.Driver.Compile.compilerClosureModule", "Vuna/Compiler/Driver/Compile.vuna:570"));
  ("Driver_dCompile.v_compilerFingerprint", ("Vuna.Compiler.Driver.Compile.compilerFingerprint", "Vuna/Compiler/Driver/Compile.vuna:443"));
  ("Driver_dCompile.v_concatMapEff", ("Vuna.Compiler.Driver.Compile.concatMapEff", "Vuna/Compiler/Driver/Compile.vuna:66"));
  ("Driver_dCompile.v_contextSources", ("Vuna.Compiler.Driver.Compile.contextSources", "Vuna/Compiler/Driver/Compile.vuna:543"));
  ("Driver_dCompile.v_copyFfiFiles", ("Vuna.Compiler.Driver.Compile.copyFfiFiles", "Vuna/Compiler/Driver/Compile.vuna:380"));
  ("Driver_dCompile.v_decOrderNamesComplete", ("Vuna.Compiler.Driver.Compile.decOrderNamesComplete", "Vuna/Compiler/Driver/Compile.vuna:1157"));
  ("Driver_dCompile.v_defLocLine", ("Vuna.Compiler.Driver.Compile.defLocLine", "Vuna/Compiler/Driver/Compile.vuna:2503"));
  ("Driver_dCompile.v_depIdentitiesEff", ("Vuna.Compiler.Driver.Compile.depIdentitiesEff", "Vuna/Compiler/Driver/Compile.vuna:633"));
  ("Driver_dCompile.v_depIdentitiesHash", ("Vuna.Compiler.Driver.Compile.depIdentitiesHash", "Vuna/Compiler/Driver/Compile.vuna:639"));
  ("Driver_dCompile.v_depIfaceHashTable", ("Vuna.Compiler.Driver.Compile.depIfaceHashTable", "Vuna/Compiler/Driver/Compile.vuna:1979"));
  ("Driver_dCompile.v_depIfacesForCheck", ("Vuna.Compiler.Driver.Compile.depIfacesForCheck", "Vuna/Compiler/Driver/Compile.vuna:1279"));
  ("Driver_dCompile.v_depIfacesForTool", ("Vuna.Compiler.Driver.Compile.depIfacesForTool", "Vuna/Compiler/Driver/Compile.vuna:1373"));
  ("Driver_dCompile.v_depIfacesForToolProgram", ("Vuna.Compiler.Driver.Compile.depIfacesForToolProgram", "Vuna/Compiler/Driver/Compile.vuna:1370"));
  ("Driver_dCompile.v_depIfacesForToolSource", ("Vuna.Compiler.Driver.Compile.depIfacesForToolSource", "Vuna/Compiler/Driver/Compile.vuna:1352"));
  ("Driver_dCompile.v_depIfacesForToolSourceDetailed", ("Vuna.Compiler.Driver.Compile.depIfacesForToolSourceDetailed", "Vuna/Compiler/Driver/Compile.vuna:1475"));
  ("Driver_dCompile.v_depIfacesOf", ("Vuna.Compiler.Driver.Compile.depIfacesOf", "Vuna/Compiler/Driver/Compile.vuna:1123"));
  ("Driver_dCompile.v_depModsByOrderEff", ("Vuna.Compiler.Driver.Compile.depModsByOrderEff", "Vuna/Compiler/Driver/Compile.vuna:1261"));
  ("Driver_dCompile.v_depModsOf", ("Vuna.Compiler.Driver.Compile.depModsOf", "Vuna/Compiler/Driver/Compile.vuna:1117"));
  ("Driver_dCompile.v_depPackageCount", ("Vuna.Compiler.Driver.Compile.depPackageCount", "Vuna/Compiler/Driver/Compile.vuna:837"));
  ("Driver_dCompile.v_depPackageList", ("Vuna.Compiler.Driver.Compile.depPackageList", "Vuna/Compiler/Driver/Compile.vuna:831"));
  ("Driver_dCompile.v_depRootIdentityEff", ("Vuna.Compiler.Driver.Compile.depRootIdentityEff", "Vuna/Compiler/Driver/Compile.vuna:607"));
  ("Driver_dCompile.v_depSemanticText", ("Vuna.Compiler.Driver.Compile.depSemanticText", "Vuna/Compiler/Driver/Compile.vuna:750"));
  ("Driver_dCompile.v_depSourceText", ("Vuna.Compiler.Driver.Compile.depSourceText", "Vuna/Compiler/Driver/Compile.vuna:745"));
  ("Driver_dCompile.v_depSrcOf", ("Vuna.Compiler.Driver.Compile.depSrcOf", "Vuna/Compiler/Driver/Compile.vuna:969"));
  ("Driver_dCompile.v_dependencyHashes", ("Vuna.Compiler.Driver.Compile.dependencyHashes", "Vuna/Compiler/Driver/Compile.vuna:551"));
  ("Driver_dCompile.v_diagHasAbsolutePath", ("Vuna.Compiler.Driver.Compile.diagHasAbsolutePath", "Vuna/Compiler/Driver/Compile.vuna:1693"));
  ("Driver_dCompile.v_dirtyFix", ("Vuna.Compiler.Driver.Compile.dirtyFix", "Vuna/Compiler/Driver/Compile.vuna:2061"));
  ("Driver_dCompile.v_distinctPkgs", ("Vuna.Compiler.Driver.Compile.distinctPkgs", "Vuna/Compiler/Driver/Compile.vuna:1222"));
  ("Driver_dCompile.v_dropPrefixMeta", ("Vuna.Compiler.Driver.Compile.dropPrefixMeta", "Vuna/Compiler/Driver/Compile.vuna:491"));
  ("Driver_dCompile.v_elabFullRequested", ("Vuna.Compiler.Driver.Compile.elabFullRequested", "Vuna/Compiler/Driver/Compile.vuna:1935"));
  ("Driver_dCompile.v_encOrderNames", ("Vuna.Compiler.Driver.Compile.encOrderNames", "Vuna/Compiler/Driver/Compile.vuna:1154"));
  ("Driver_dCompile.v_ensureDirPath", ("Vuna.Compiler.Driver.Compile.ensureDirPath", "Vuna/Compiler/Driver/Compile.vuna:139"));
  ("Driver_dCompile.v_ensureDirPathFuel", ("Vuna.Compiler.Driver.Compile.ensureDirPathFuel", "Vuna/Compiler/Driver/Compile.vuna:142"));
  ("Driver_dCompile.v_entrySource", ("Vuna.Compiler.Driver.Compile.entrySource", "Vuna/Compiler/Driver/Compile.vuna:533"));
  ("Driver_dCompile.v_exportedDepModsOf", ("Vuna.Compiler.Driver.Compile.exportedDepModsOf", "Vuna/Compiler/Driver/Compile.vuna:1247"));
  ("Driver_dCompile.v_exportedOwnOf", ("Vuna.Compiler.Driver.Compile.exportedOwnOf", "Vuna/Compiler/Driver/Compile.vuna:2186"));
  ("Driver_dCompile.v_exportsFromDirty", ("Vuna.Compiler.Driver.Compile.exportsFromDirty", "Vuna/Compiler/Driver/Compile.vuna:2046"));
  ("Driver_dCompile.v_findClosureMod", ("Vuna.Compiler.Driver.Compile.findClosureMod", "Vuna/Compiler/Driver/Compile.vuna:896"));
  ("Driver_dCompile.v_findPkgEntry", ("Vuna.Compiler.Driver.Compile.findPkgEntry", "Vuna/Compiler/Driver/Compile.vuna:892"));
  ("Driver_dCompile.v_fromDirty", ("Vuna.Compiler.Driver.Compile.fromDirty", "Vuna/Compiler/Driver/Compile.vuna:2054"));
  ("Driver_dCompile.v_fullCheckExe", ("Vuna.Compiler.Driver.Compile.fullCheckExe", "Vuna/Compiler/Driver/Compile.vuna:1913"));
  ("Driver_dCompile.v_fullCheckLib", ("Vuna.Compiler.Driver.Compile.fullCheckLib", "Vuna/Compiler/Driver/Compile.vuna:2384"));
  ("Driver_dCompile.v_goPkgs", ("Vuna.Compiler.Driver.Compile.goPkgs", "Vuna/Compiler/Driver/Compile.vuna:1227"));
  ("Driver_dCompile.v_hasAbsoluteLabels", ("Vuna.Compiler.Driver.Compile.hasAbsoluteLabels", "Vuna/Compiler/Driver/Compile.vuna:1685"));
  ("Driver_dCompile.v_hashText", ("Vuna.Compiler.Driver.Compile.hashText", "Vuna/Compiler/Driver/Compile.vuna:730"));
  ("Driver_dCompile.v_ifaceAddrOf", ("Vuna.Compiler.Driver.Compile.ifaceAddrOf", "Vuna/Compiler/Driver/Compile.vuna:983"));
  ("Driver_dCompile.v_ifaceAuditRequested", ("Vuna.Compiler.Driver.Compile.ifaceAuditRequested", "Vuna/Compiler/Driver/Compile.vuna:1943"));
  ("Driver_dCompile.v_ifaceCompilerTag", ("Vuna.Compiler.Driver.Compile.ifaceCompilerTag", "Vuna/Compiler/Driver/Compile.vuna:2126"));
  ("Driver_dCompile.v_ifaceHashOfName", ("Vuna.Compiler.Driver.Compile.ifaceHashOfName", "Vuna/Compiler/Driver/Compile.vuna:2298"));
  ("Driver_dCompile.v_ifaceModsEff", ("Vuna.Compiler.Driver.Compile.ifaceModsEff", "Vuna/Compiler/Driver/Compile.vuna:1001"));
  ("Driver_dCompile.v_ifaceModsWithEff", ("Vuna.Compiler.Driver.Compile.ifaceModsWithEff", "Vuna/Compiler/Driver/Compile.vuna:1007"));
  ("Driver_dCompile.v_ifaceObjectCodec", ("Vuna.Compiler.Driver.Compile.ifaceObjectCodec", "Vuna/Compiler/Driver/Compile.vuna:849"));
  ("Driver_dCompile.v_ifaceSelfTestRequested", ("Vuna.Compiler.Driver.Compile.ifaceSelfTestRequested", "Vuna/Compiler/Driver/Compile.vuna:2292"));
  ("Driver_dCompile.v_ifacesForContextEff", ("Vuna.Compiler.Driver.Compile.ifacesForContextEff", "Vuna/Compiler/Driver/Compile.vuna:1050"));
  ("Driver_dCompile.v_ifacesForRootsEff", ("Vuna.Compiler.Driver.Compile.ifacesForRootsEff", "Vuna/Compiler/Driver/Compile.vuna:1057"));
  ("Driver_dCompile.v_importClosureGo", ("Vuna.Compiler.Driver.Compile.importClosureGo", "Vuna/Compiler/Driver/Compile.vuna:1320"));
  ("Driver_dCompile.v_importClosureOf", ("Vuna.Compiler.Driver.Compile.importClosureOf", "Vuna/Compiler/Driver/Compile.vuna:1335"));
  ("Driver_dCompile.v_importNameStr", ("Vuna.Compiler.Driver.Compile.importNameStr", "Vuna/Compiler/Driver/Compile.vuna:1285"));
  ("Driver_dCompile.v_isDepModOf", ("Vuna.Compiler.Driver.Compile.isDepModOf", "Vuna/Compiler/Driver/Compile.vuna:951"));
  ("Driver_dCompile.v_isNeededMod", ("Vuna.Compiler.Driver.Compile.isNeededMod", "Vuna/Compiler/Driver/Compile.vuna:1345"));
  ("Driver_dCompile.v_isSelfModOf", ("Vuna.Compiler.Driver.Compile.isSelfModOf", "Vuna/Compiler/Driver/Compile.vuna:954"));
  ("Driver_dCompile.v_isStableDiag", ("Vuna.Compiler.Driver.Compile.isStableDiag", "Vuna/Compiler/Driver/Compile.vuna:1697"));
  ("Driver_dCompile.v_joinJsonList", ("Vuna.Compiler.Driver.Compile.joinJsonList", "Vuna/Compiler/Driver/Compile.vuna:662"));
  ("Driver_dCompile.v_joinLines", ("Vuna.Compiler.Driver.Compile.joinLines", "Vuna/Compiler/Driver/Compile.vuna:1963"));
  ("Driver_dCompile.v_lastSegment", ("Vuna.Compiler.Driver.Compile.lastSegment", "Vuna/Compiler/Driver/Compile.vuna:673"));
  ("Driver_dCompile.v_lastSegmentRev", ("Vuna.Compiler.Driver.Compile.lastSegmentRev", "Vuna/Compiler/Driver/Compile.vuna:669"));
  ("Driver_dCompile.v_layoutDigestOf", ("Vuna.Compiler.Driver.Compile.layoutDigestOf", "Vuna/Compiler/Driver/Compile.vuna:2509"));
  ("Driver_dCompile.v_loadHeaderEff", ("Vuna.Compiler.Driver.Compile.loadHeaderEff", "Vuna/Compiler/Driver/Compile.vuna:924"));
  ("Driver_dCompile.v_manifestSemanticText", ("Vuna.Compiler.Driver.Compile.manifestSemanticText", "Vuna/Compiler/Driver/Compile.vuna:754"));
  ("Driver_dCompile.v_mapEff", ("Vuna.Compiler.Driver.Compile.mapEff", "Vuna/Compiler/Driver/Compile.vuna:58"));
  ("Driver_dCompile.v_mapMaybeEff", ("Vuna.Compiler.Driver.Compile.mapMaybeEff", "Vuna/Compiler/Driver/Compile.vuna:74"));
  ("Driver_dCompile.v_maybeSemanticText", ("Vuna.Compiler.Driver.Compile.maybeSemanticText", "Vuna/Compiler/Driver/Compile.vuna:741"));
  ("Driver_dCompile.v_metaFileName", ("Vuna.Compiler.Driver.Compile.metaFileName", "Vuna/Compiler/Driver/Compile.vuna:433"));
  ("Driver_dCompile.v_metaPairText", ("Vuna.Compiler.Driver.Compile.metaPairText", "Vuna/Compiler/Driver/Compile.vuna:659"));
  ("Driver_dCompile.v_metaPathOf", ("Vuna.Compiler.Driver.Compile.metaPathOf", "Vuna/Compiler/Driver/Compile.vuna:688"));
  ("Driver_dCompile.v_metaSchema", ("Vuna.Compiler.Driver.Compile.metaSchema", "Vuna/Compiler/Driver/Compile.vuna:430"));
  ("Driver_dCompile.v_metaUpToDate", ("Vuna.Compiler.Driver.Compile.metaUpToDate", "Vuna/Compiler/Driver/Compile.vuna:699"));
  ("Driver_dCompile.v_missingNamesOf", ("Vuna.Compiler.Driver.Compile.missingNamesOf", "Vuna/Compiler/Driver/Compile.vuna:2265"));
  ("Driver_dCompile.v_modGraphEntry", ("Vuna.Compiler.Driver.Compile.modGraphEntry", "Vuna/Compiler/Driver/Compile.vuna:945"));
  ("Driver_dCompile.v_modHashPair", ("Vuna.Compiler.Driver.Compile.modHashPair", "Vuna/Compiler/Driver/Compile.vuna:1507"));
  ("Driver_dCompile.v_modNameOf", ("Vuna.Compiler.Driver.Compile.modNameOf", "Vuna/Compiler/Driver/Compile.vuna:948"));
  ("Driver_dCompile.v_moduleDepsOk", ("Vuna.Compiler.Driver.Compile.moduleDepsOk", "Vuna/Compiler/Driver/Compile.vuna:2104"));
  ("Driver_dCompile.v_moduleGraphOf", ("Vuna.Compiler.Driver.Compile.moduleGraphOf", "Vuna/Compiler/Driver/Compile.vuna:957"));
  ("Driver_dCompile.v_moduleNameOfPath", ("Vuna.Compiler.Driver.Compile.moduleNameOfPath", "Vuna/Compiler/Driver/Compile.vuna:504"));
  ("Driver_dCompile.v_mtimeSafetyWindowSec", ("Vuna.Compiler.Driver.Compile.mtimeSafetyWindowSec", "Vuna/Compiler/Driver/Compile.vuna:1433"));
  ("Driver_dCompile.v_nameExportedBy", ("Vuna.Compiler.Driver.Compile.nameExportedBy", "Vuna/Compiler/Driver/Compile.vuna:2177"));
  ("Driver_dCompile.v_orderCodec", ("Vuna.Compiler.Driver.Compile.orderCodec", "Vuna/Compiler/Driver/Compile.vuna:1151"));
  ("Driver_dCompile.v_orderCoversEff", ("Vuna.Compiler.Driver.Compile.orderCoversEff", "Vuna/Compiler/Driver/Compile.vuna:1202"));
  ("Driver_dCompile.v_orderKeyOfEff", ("Vuna.Compiler.Driver.Compile.orderKeyOfEff", "Vuna/Compiler/Driver/Compile.vuna:1169"));
  ("Driver_dCompile.v_orderKind", ("Vuna.Compiler.Driver.Compile.orderKind", "Vuna/Compiler/Driver/Compile.vuna:1148"));
  ("Driver_dCompile.v_ownCleanInfo", ("Vuna.Compiler.Driver.Compile.ownCleanInfo", "Vuna/Compiler/Driver/Compile.vuna:2022"));
  ("Driver_dCompile.v_ownCleanModules", ("Vuna.Compiler.Driver.Compile.ownCleanModules", "Vuna/Compiler/Driver/Compile.vuna:2076"));
  ("Driver_dCompile.v_ownCleanWanted", ("Vuna.Compiler.Driver.Compile.ownCleanWanted", "Vuna/Compiler/Driver/Compile.vuna:1535"));
  ("Driver_dCompile.v_ownRootsOf", ("Vuna.Compiler.Driver.Compile.ownRootsOf", "Vuna/Compiler/Driver/Compile.vuna:540"));
  ("Driver_dCompile.v_ownSourceInfos", ("Vuna.Compiler.Driver.Compile.ownSourceInfos", "Vuna/Compiler/Driver/Compile.vuna:2132"));
  ("Driver_dCompile.v_packageEnvHash", ("Vuna.Compiler.Driver.Compile.packageEnvHash", "Vuna/Compiler/Driver/Compile.vuna:1990"));
  ("Driver_dCompile.v_pairText", ("Vuna.Compiler.Driver.Compile.pairText", "Vuna/Compiler/Driver/Compile.vuna:642"));
  ("Driver_dCompile.v_payloadSelfOk", ("Vuna.Compiler.Driver.Compile.payloadSelfOk", "Vuna/Compiler/Driver/Compile.vuna:2098"));
  ("Driver_dCompile.v_pickByOrder", ("Vuna.Compiler.Driver.Compile.pickByOrder", "Vuna/Compiler/Driver/Compile.vuna:1212"));
  ("Driver_dCompile.v_pickDepMods", ("Vuna.Compiler.Driver.Compile.pickDepMods", "Vuna/Compiler/Driver/Compile.vuna:1267"));
  ("Driver_dCompile.v_pkgEq", ("Vuna.Compiler.Driver.Compile.pkgEq", "Vuna/Compiler/Driver/Compile.vuna:1219"));
  ("Driver_dCompile.v_pkgIfaceSummaryCodec", ("Vuna.Compiler.Driver.Compile.pkgIfaceSummaryCodec", "Vuna/Compiler/Driver/Compile.vuna:600"));
  ("Driver_dCompile.v_pkgIfaceSummaryKeyOf", ("Vuna.Compiler.Driver.Compile.pkgIfaceSummaryKeyOf", "Vuna/Compiler/Driver/Compile.vuna:603"));
  ("Driver_dCompile.v_pkgIfaceSummaryKind", ("Vuna.Compiler.Driver.Compile.pkgIfaceSummaryKind", "Vuna/Compiler/Driver/Compile.vuna:597"));
  ("Driver_dCompile.v_pkgKeyOf", ("Vuna.Compiler.Driver.Compile.pkgKeyOf", "Vuna/Compiler/Driver/Compile.vuna:873"));
  ("Driver_dCompile.v_pkgTableEff", ("Vuna.Compiler.Driver.Compile.pkgTableEff", "Vuna/Compiler/Driver/Compile.vuna:876"));
  ("Driver_dCompile.v_prepareForStore", ("Vuna.Compiler.Driver.Compile.prepareForStore", "Vuna/Compiler/Driver/Compile.vuna:1707"));
  ("Driver_dCompile.v_projectIdOf", ("Vuna.Compiler.Driver.Compile.projectIdOf", "Vuna/Compiler/Driver/Compile.vuna:1751"));
  ("Driver_dCompile.v_readIfaceAtEff", ("Vuna.Compiler.Driver.Compile.readIfaceAtEff", "Vuna/Compiler/Driver/Compile.vuna:1065"));
  ("Driver_dCompile.v_readIfaceListEff", ("Vuna.Compiler.Driver.Compile.readIfaceListEff", "Vuna/Compiler/Driver/Compile.vuna:1093"));
  ("Driver_dCompile.v_readIfaceListPartialEff", ("Vuna.Compiler.Driver.Compile.readIfaceListPartialEff", "Vuna/Compiler/Driver/Compile.vuna:1081"));
  ("Driver_dCompile.v_readIfaces", ("Vuna.Compiler.Driver.Compile.readIfaces", "Vuna/Compiler/Driver/Compile.vuna:2036"));
  ("Driver_dCompile.v_readOneModIface", ("Vuna.Compiler.Driver.Compile.readOneModIface", "Vuna/Compiler/Driver/Compile.vuna:2016"));
  ("Driver_dCompile.v_readOrderEff", ("Vuna.Compiler.Driver.Compile.readOrderEff", "Vuna/Compiler/Driver/Compile.vuna:1187"));
  ("Driver_dCompile.v_readSplitBlob", ("Vuna.Compiler.Driver.Compile.readSplitBlob", "Vuna/Compiler/Driver/Compile.vuna:2587"));
  ("Driver_dCompile.v_readSplitPointer", ("Vuna.Compiler.Driver.Compile.readSplitPointer", "Vuna/Compiler/Driver/Compile.vuna:2490"));
  ("Driver_dCompile.v_rebuildSplit", ("Vuna.Compiler.Driver.Compile.rebuildSplit", "Vuna/Compiler/Driver/Compile.vuna:236"));
  ("Driver_dCompile.v_releaseFlagOf", ("Vuna.Compiler.Driver.Compile.releaseFlagOf", "Vuna/Compiler/Driver/Compile.vuna:768"));
  ("Driver_dCompile.v_replayFailure", ("Vuna.Compiler.Driver.Compile.replayFailure", "Vuna/Compiler/Driver/Compile.vuna:1718"));
  ("Driver_dCompile.v_resolveStoredDiag", ("Vuna.Compiler.Driver.Compile.resolveStoredDiag", "Vuna/Compiler/Driver/Compile.vuna:1715"));
  ("Driver_dCompile.v_resolveStoredPath", ("Vuna.Compiler.Driver.Compile.resolveStoredPath", "Vuna/Compiler/Driver/Compile.vuna:1671"));
  ("Driver_dCompile.v_resyncCleanSources", ("Vuna.Compiler.Driver.Compile.resyncCleanSources", "Vuna/Compiler/Driver/Compile.vuna:2154"));
  ("Driver_dCompile.v_rootEnvHashOf", ("Vuna.Compiler.Driver.Compile.rootEnvHashOf", "Vuna/Compiler/Driver/Compile.vuna:1031"));
  ("Driver_dCompile.v_rootExportsOf", ("Vuna.Compiler.Driver.Compile.rootExportsOf", "Vuna/Compiler/Driver/Compile.vuna:1256"));
  ("Driver_dCompile.v_rootHash", ("Vuna.Compiler.Driver.Compile.rootHash", "Vuna/Compiler/Driver/Compile.vuna:522"));
  ("Driver_dCompile.v_rootKeepEff", ("Vuna.Compiler.Driver.Compile.rootKeepEff", "Vuna/Compiler/Driver/Compile.vuna:1760"));
  ("Driver_dCompile.v_rootOfName", ("Vuna.Compiler.Driver.Compile.rootOfName", "Vuna/Compiler/Driver/Compile.vuna:1163"));
  ("Driver_dCompile.v_rootPkgTableEff", ("Vuna.Compiler.Driver.Compile.rootPkgTableEff", "Vuna/Compiler/Driver/Compile.vuna:1040"));
  ("Driver_dCompile.v_rootSources", ("Vuna.Compiler.Driver.Compile.rootSources", "Vuna/Compiler/Driver/Compile.vuna:511"));
  ("Driver_dCompile.v_runAndStore", ("Vuna.Compiler.Driver.Compile.runAndStore", "Vuna/Compiler/Driver/Compile.vuna:1807"));
  ("Driver_dCompile.v_runBuildScript", ("Vuna.Compiler.Driver.Compile.runBuildScript", "Vuna/Compiler/Driver/Compile.vuna:717"));
  ("Driver_dCompile.v_sameIfaceHashes", ("Vuna.Compiler.Driver.Compile.sameIfaceHashes", "Vuna/Compiler/Driver/Compile.vuna:2307"));
  ("Driver_dCompile.v_sameNameSet", ("Vuna.Compiler.Driver.Compile.sameNameSet", "Vuna/Compiler/Driver/Compile.vuna:817"));
  ("Driver_dCompile.v_selfModsOf", ("Vuna.Compiler.Driver.Compile.selfModsOf", "Vuna/Compiler/Driver/Compile.vuna:1120"));
  ("Driver_dCompile.v_shadowAllowed", ("Vuna.Compiler.Driver.Compile.shadowAllowed", "Vuna/Compiler/Driver/Compile.vuna:2170"));
  ("Driver_dCompile.v_skipMetaDir", ("Vuna.Compiler.Driver.Compile.skipMetaDir", "Vuna/Compiler/Driver/Compile.vuna:453"));
  ("Driver_dCompile.v_slashToDot", ("Vuna.Compiler.Driver.Compile.slashToDot", "Vuna/Compiler/Driver/Compile.vuna:501"));
  ("Driver_dCompile.v_slashesToDots", ("Vuna.Compiler.Driver.Compile.slashesToDots", "Vuna/Compiler/Driver/Compile.vuna:498"));
  ("Driver_dCompile.v_sourceFresh", ("Vuna.Compiler.Driver.Compile.sourceFresh", "Vuna/Compiler/Driver/Compile.vuna:1438"));
  ("Driver_dCompile.v_sourceInfoForPath", ("Vuna.Compiler.Driver.Compile.sourceInfoForPath", "Vuna/Compiler/Driver/Compile.vuna:1417"));
  ("Driver_dCompile.v_splitBlobPath", ("Vuna.Compiler.Driver.Compile.splitBlobPath", "Vuna/Compiler/Driver/Compile.vuna:2450"));
  ("Driver_dCompile.v_splitBlobTag", ("Vuna.Compiler.Driver.Compile.splitBlobTag", "Vuna/Compiler/Driver/Compile.vuna:2421"));
  ("Driver_dCompile.v_splitCacheCodec", ("Vuna.Compiler.Driver.Compile.splitCacheCodec", "Vuna/Compiler/Driver/Compile.vuna:2417"));
  ("Driver_dCompile.v_splitIdentityOf", ("Vuna.Compiler.Driver.Compile.splitIdentityOf", "Vuna/Compiler/Driver/Compile.vuna:2514"));
  ("Driver_dCompile.v_splitInOf", ("Vuna.Compiler.Driver.Compile.splitInOf", "Vuna/Compiler/Driver/Compile.vuna:2473"));
  ("Driver_dCompile.v_splitModsOf", ("Vuna.Compiler.Driver.Compile.splitModsOf", "Vuna/Compiler/Driver/Compile.vuna:2428"));
  ("Driver_dCompile.v_splitNodeSchema", ("Vuna.Compiler.Driver.Compile.splitNodeSchema", "Vuna/Compiler/Driver/Compile.vuna:2411"));
  ("Driver_dCompile.v_splitPtrCodec", ("Vuna.Compiler.Driver.Compile.splitPtrCodec", "Vuna/Compiler/Driver/Compile.vuna:2487"));
  ("Driver_dCompile.v_splitPtrKind", ("Vuna.Compiler.Driver.Compile.splitPtrKind", "Vuna/Compiler/Driver/Compile.vuna:2484"));
  ("Driver_dCompile.v_splitSignatureOf", ("Vuna.Compiler.Driver.Compile.splitSignatureOf", "Vuna/Compiler/Driver/Compile.vuna:1959"));
  ("Driver_dCompile.v_srcPairOf", ("Vuna.Compiler.Driver.Compile.srcPairOf", "Vuna/Compiler/Driver/Compile.vuna:979"));
  ("Driver_dCompile.v_srcTblOf", ("Vuna.Compiler.Driver.Compile.srcTblOf", "Vuna/Compiler/Driver/Compile.vuna:976"));
  ("Driver_dCompile.v_statOfClosureMod", ("Vuna.Compiler.Driver.Compile.statOfClosureMod", "Vuna/Compiler/Driver/Compile.vuna:1510"));
  ("Driver_dCompile.v_storeCheckPayload", ("Vuna.Compiler.Driver.Compile.storeCheckPayload", "Vuna/Compiler/Driver/Compile.vuna:1723"));
  ("Driver_dCompile.v_summaryCheckExeParts", ("Vuna.Compiler.Driver.Compile.summaryCheckExeParts", "Vuna/Compiler/Driver/Compile.vuna:1881"));
  ("Driver_dCompile.v_summaryCheckLibParts", ("Vuna.Compiler.Driver.Compile.summaryCheckLibParts", "Vuna/Compiler/Driver/Compile.vuna:2353"));
  ("Driver_dCompile.v_summarySplitParts", ("Vuna.Compiler.Driver.Compile.summarySplitParts", "Vuna/Compiler/Driver/Compile.vuna:183"));
  ("Driver_dCompile.v_textHash", ("Vuna.Compiler.Driver.Compile.textHash", "Vuna/Compiler/Driver/Compile.vuna:437"));
  ("Driver_dCompile.v_toolCleanGo", ("Vuna.Compiler.Driver.Compile.toolCleanGo", "Vuna/Compiler/Driver/Compile.vuna:1548"));
  ("Driver_dCompile.v_toolCleanOwnModules", ("Vuna.Compiler.Driver.Compile.toolCleanOwnModules", "Vuna/Compiler/Driver/Compile.vuna:1520"));
  ("Driver_dCompile.v_toolCompilerFingerprint", ("Vuna.Compiler.Driver.Compile.toolCompilerFingerprint", "Vuna/Compiler/Driver/Compile.vuna:1645"));
  ("Driver_dCompile.v_toolDepModsOf", ("Vuna.Compiler.Driver.Compile.toolDepModsOf", "Vuna/Compiler/Driver/Compile.vuna:1349"));
  ("Driver_dCompile.v_toolEnabled", ("Vuna.Compiler.Driver.Compile.toolEnabled", "Vuna/Compiler/Driver/Compile.vuna:1314"));
  ("Driver_dCompile.v_toolImportNamesOf", ("Vuna.Compiler.Driver.Compile.toolImportNamesOf", "Vuna/Compiler/Driver/Compile.vuna:1299"));
  ("Driver_dCompile.v_toolImportsOfSource", ("Vuna.Compiler.Driver.Compile.toolImportsOfSource", "Vuna/Compiler/Driver/Compile.vuna:1288"));
  ("Driver_dCompile.v_toolNeededOfImports", ("Vuna.Compiler.Driver.Compile.toolNeededOfImports", "Vuna/Compiler/Driver/Compile.vuna:1466"));
  ("Driver_dCompile.v_toolNowSec", ("Vuna.Compiler.Driver.Compile.toolNowSec", "Vuna/Compiler/Driver/Compile.vuna:1425"));
  ("Driver_dCompile.v_toolSessionFresh", ("Vuna.Compiler.Driver.Compile.toolSessionFresh", "Vuna/Compiler/Driver/Compile.vuna:1458"));
  ("Driver_dCompile.v_toolTextHash", ("Vuna.Compiler.Driver.Compile.toolTextHash", "Vuna/Compiler/Driver/Compile.vuna:1414"));
  ("Driver_dCompile.v_toolWriteModuleIface", ("Vuna.Compiler.Driver.Compile.toolWriteModuleIface", "Vuna/Compiler/Driver/Compile.vuna:1603"));
  ("Driver_dCompile.v_toolWriteModuleIfaceCold", ("Vuna.Compiler.Driver.Compile.toolWriteModuleIfaceCold", "Vuna/Compiler/Driver/Compile.vuna:1630"));
  ("Driver_dCompile.v_toolchainIdEff", ("Vuna.Compiler.Driver.Compile.toolchainIdEff", "Vuna/Compiler/Driver/Compile.vuna:2527"));
  ("Driver_dCompile.v_walkVunaMeta", ("Vuna.Compiler.Driver.Compile.walkVunaMeta", "Vuna/Compiler/Driver/Compile.vuna:471"));
  ("Driver_dCompile.v_withAddr", ("Vuna.Compiler.Driver.Compile.withAddr", "Vuna/Compiler/Driver/Compile.vuna:988"));
  ("Driver_dCompile.v_withPrelude", ("Vuna.Compiler.Driver.Compile.withPrelude", "Vuna/Compiler/Driver/Compile.vuna:938"));
  ("Driver_dCompile.v_writeBuildMeta", ("Vuna.Compiler.Driver.Compile.writeBuildMeta", "Vuna/Compiler/Driver/Compile.vuna:691"));
  ("Driver_dCompile.v_writeCompiledNormalized", ("Vuna.Compiler.Driver.Compile.writeCompiledNormalized", "Vuna/Compiler/Driver/Compile.vuna:352"));
  ("Driver_dCompile.v_writeFileIfChanged", ("Vuna.Compiler.Driver.Compile.writeFileIfChanged", "Vuna/Compiler/Driver/Compile.vuna:337"));
  ("Driver_dCompile.v_writeIfaceObjects", ("Vuna.Compiler.Driver.Compile.writeIfaceObjects", "Vuna/Compiler/Driver/Compile.vuna:2276"));
  ("Driver_dCompile.v_writeIfaceShadow", ("Vuna.Compiler.Driver.Compile.writeIfaceShadow", "Vuna/Compiler/Driver/Compile.vuna:2195"));
  ("Driver_dCompile.v_writeModuleIfaceGuarded", ("Vuna.Compiler.Driver.Compile.writeModuleIfaceGuarded", "Vuna/Compiler/Driver/Compile.vuna:1617"));
  ("Driver_dCompile.v_writeOrderEff", ("Vuna.Compiler.Driver.Compile.writeOrderEff", "Vuna/Compiler/Driver/Compile.vuna:1177"));
  ("Driver_dCompile.v_writePkgIfaceSummaryEff", ("Vuna.Compiler.Driver.Compile.writePkgIfaceSummaryEff", "Vuna/Compiler/Driver/Compile.vuna:646"));
  ("Driver_dCompile.v_writeSplitBlob", ("Vuna.Compiler.Driver.Compile.writeSplitBlob", "Vuna/Compiler/Driver/Compile.vuna:2566"));
  ("Driver_dCompile.v_writeSplitBlobAt", ("Vuna.Compiler.Driver.Compile.writeSplitBlobAt", "Vuna/Compiler/Driver/Compile.vuna:2458"));
  ("Driver_dCompile.v_writeSplitPointer", ("Vuna.Compiler.Driver.Compile.writeSplitPointer", "Vuna/Compiler/Driver/Compile.vuna:2500"));
  ("Driver_dCompilerCli.v_anyHelp", ("Vuna.Compiler.Driver.CompilerCli.anyHelp", "Vuna/Compiler/Driver/CompilerCli.vuna:581"));
  ("Driver_dCompilerCli.v_applyDiagConfig", ("Vuna.Compiler.Driver.CompilerCli.applyDiagConfig", "Vuna/Compiler/Driver/CompilerCli.vuna:195"));
  ("Driver_dCompilerCli.v_applyManifestOpts", ("Vuna.Compiler.Driver.CompilerCli.applyManifestOpts", "Vuna/Compiler/Driver/CompilerCli.vuna:198"));
  ("Driver_dCompilerCli.v_buildArgs", ("Vuna.Compiler.Driver.CompilerCli.buildArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:1145"));
  ("Driver_dCompilerCli.v_buildDefaultView", ("Vuna.Compiler.Driver.CompilerCli.buildDefaultView", "Vuna/Compiler/Driver/CompilerCli.vuna:1399"));
  ("Driver_dCompilerCli.v_buildExplicit", ("Vuna.Compiler.Driver.CompilerCli.buildExplicit", "Vuna/Compiler/Driver/CompilerCli.vuna:1378"));
  ("Driver_dCompilerCli.v_buildLinked", ("Vuna.Compiler.Driver.CompilerCli.buildLinked", "Vuna/Compiler/Driver/CompilerCli.vuna:1503"));
  ("Driver_dCompilerCli.v_buildNativeOne", ("Vuna.Compiler.Driver.CompilerCli.buildNativeOne", "Vuna/Compiler/Driver/CompilerCli.vuna:1248"));
  ("Driver_dCompilerCli.v_buildOne", ("Vuna.Compiler.Driver.CompilerCli.buildOne", "Vuna/Compiler/Driver/CompilerCli.vuna:1341"));
  ("Driver_dCompilerCli.v_buildParse", ("Vuna.Compiler.Driver.CompilerCli.buildParse", "Vuna/Compiler/Driver/CompilerCli.vuna:1148"));
  ("Driver_dCompilerCli.v_buildRun", ("Vuna.Compiler.Driver.CompilerCli.buildRun", "Vuna/Compiler/Driver/CompilerCli.vuna:1187"));
  ("Driver_dCompilerCli.v_buildTargets", ("Vuna.Compiler.Driver.CompilerCli.buildTargets", "Vuna/Compiler/Driver/CompilerCli.vuna:1237"));
  ("Driver_dCompilerCli.v_buildWasmOne", ("Vuna.Compiler.Driver.CompilerCli.buildWasmOne", "Vuna/Compiler/Driver/CompilerCli.vuna:1299"));
  ("Driver_dCompilerCli.v_checkArgs", ("Vuna.Compiler.Driver.CompilerCli.checkArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:868"));
  ("Driver_dCompilerCli.v_checkEmit", ("Vuna.Compiler.Driver.CompilerCli.checkEmit", "Vuna/Compiler/Driver/CompilerCli.vuna:880"));
  ("Driver_dCompilerCli.v_checkEntryFile", ("Vuna.Compiler.Driver.CompilerCli.checkEntryFile", "Vuna/Compiler/Driver/CompilerCli.vuna:1110"));
  ("Driver_dCompilerCli.v_checkFileEntry", ("Vuna.Compiler.Driver.CompilerCli.checkFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:1062"));
  ("Driver_dCompilerCli.v_checkMembersByLevel", ("Vuna.Compiler.Driver.CompilerCli.checkMembersByLevel", "Vuna/Compiler/Driver/CompilerCli.vuna:966"));
  ("Driver_dCompilerCli.v_checkMembersParallel", ("Vuna.Compiler.Driver.CompilerCli.checkMembersParallel", "Vuna/Compiler/Driver/CompilerCli.vuna:996"));
  ("Driver_dCompilerCli.v_checkModuleFileEntry", ("Vuna.Compiler.Driver.CompilerCli.checkModuleFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:1095"));
  ("Driver_dCompilerCli.v_checkPackageCode", ("Vuna.Compiler.Driver.CompilerCli.checkPackageCode", "Vuna/Compiler/Driver/CompilerCli.vuna:1043"));
  ("Driver_dCompilerCli.v_checkPackageErr", ("Vuna.Compiler.Driver.CompilerCli.checkPackageErr", "Vuna/Compiler/Driver/CompilerCli.vuna:1597"));
  ("Driver_dCompilerCli.v_checkPackageSeq", ("Vuna.Compiler.Driver.CompilerCli.checkPackageSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:1032"));
  ("Driver_dCompilerCli.v_checkPackages", ("Vuna.Compiler.Driver.CompilerCli.checkPackages", "Vuna/Compiler/Driver/CompilerCli.vuna:931"));
  ("Driver_dCompilerCli.v_checkPackagesSpawn", ("Vuna.Compiler.Driver.CompilerCli.checkPackagesSpawn", "Vuna/Compiler/Driver/CompilerCli.vuna:951"));
  ("Driver_dCompilerCli.v_checkPkgDir", ("Vuna.Compiler.Driver.CompilerCli.checkPkgDir", "Vuna/Compiler/Driver/CompilerCli.vuna:891"));
  ("Driver_dCompilerCli.v_checkPkgsInProcess", ("Vuna.Compiler.Driver.CompilerCli.checkPkgsInProcess", "Vuna/Compiler/Driver/CompilerCli.vuna:1011"));
  ("Driver_dCompilerCli.v_checkRootsSeq", ("Vuna.Compiler.Driver.CompilerCli.checkRootsSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:1023"));
  ("Driver_dCompilerCli.v_checkSpawnArgs", ("Vuna.Compiler.Driver.CompilerCli.checkSpawnArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:906"));
  ("Driver_dCompilerCli.v_collectLabelFiles", ("Vuna.Compiler.Driver.CompilerCli.collectLabelFiles", "Vuna/Compiler/Driver/CompilerCli.vuna:313"));
  ("Driver_dCompilerCli.v_collectSarifIn", ("Vuna.Compiler.Driver.CompilerCli.collectSarifIn", "Vuna/Compiler/Driver/CompilerCli.vuna:688"));
  ("Driver_dCompilerCli.v_compileArgs", ("Vuna.Compiler.Driver.CompilerCli.compileArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:768"));
  ("Driver_dCompilerCli.v_compileCodegen", ("Vuna.Compiler.Driver.CompilerCli.compileCodegen", "Vuna/Compiler/Driver/CompilerCli.vuna:1493"));
  ("Driver_dCompilerCli.v_compileFileEntry", ("Vuna.Compiler.Driver.CompilerCli.compileFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:833"));
  ("Driver_dCompilerCli.v_compileFinish", ("Vuna.Compiler.Driver.CompilerCli.compileFinish", "Vuna/Compiler/Driver/CompilerCli.vuna:797"));
  ("Driver_dCompilerCli.v_compileParse", ("Vuna.Compiler.Driver.CompilerCli.compileParse", "Vuna/Compiler/Driver/CompilerCli.vuna:771"));
  ("Driver_dCompilerCli.v_compilePkgDir", ("Vuna.Compiler.Driver.CompilerCli.compilePkgDir", "Vuna/Compiler/Driver/CompilerCli.vuna:849"));
  ("Driver_dCompilerCli.v_compileRun", ("Vuna.Compiler.Driver.CompilerCli.compileRun", "Vuna/Compiler/Driver/CompilerCli.vuna:804"));
  ("Driver_dCompilerCli.v_compileToTarget", ("Vuna.Compiler.Driver.CompilerCli.compileToTarget", "Vuna/Compiler/Driver/CompilerCli.vuna:816"));
  ("Driver_dCompilerCli.v_compilerUsage", ("Vuna.Compiler.Driver.CompilerCli.compilerUsage", "Vuna/Compiler/Driver/CompilerCli.vuna:53"));
  ("Driver_dCompilerCli.v_compilerUsageLines", ("Vuna.Compiler.Driver.CompilerCli.compilerUsageLines", "Vuna/Compiler/Driver/CompilerCli.vuna:41"));
  ("Driver_dCompilerCli.v_countFailures", ("Vuna.Compiler.Driver.CompilerCli.countFailures", "Vuna/Compiler/Driver/CompilerCli.vuna:1058"));
  ("Driver_dCompilerCli.v_dashFlag", ("Vuna.Compiler.Driver.CompilerCli.dashFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:614"));
  ("Driver_dCompilerCli.v_defaultCliOpts", ("Vuna.Compiler.Driver.CompilerCli.defaultCliOpts", "Vuna/Compiler/Driver/CompilerCli.vuna:88"));
  ("Driver_dCompilerCli.v_defaultDir", ("Vuna.Compiler.Driver.CompilerCli.defaultDir", "Vuna/Compiler/Driver/CompilerCli.vuna:730"));
  ("Driver_dCompilerCli.v_depsReady", ("Vuna.Compiler.Driver.CompilerCli.depsReady", "Vuna/Compiler/Driver/CompilerCli.vuna:984"));
  ("Driver_dCompilerCli.v_depsReadyList", ("Vuna.Compiler.Driver.CompilerCli.depsReadyList", "Vuna/Compiler/Driver/CompilerCli.vuna:987"));
  ("Driver_dCompilerCli.v_diagExitFor", ("Vuna.Compiler.Driver.CompilerCli.diagExitFor", "Vuna/Compiler/Driver/CompilerCli.vuna:162"));
  ("Driver_dCompilerCli.v_dirOf", ("Vuna.Compiler.Driver.CompilerCli.dirOf", "Vuna/Compiler/Driver/CompilerCli.vuna:338"));
  ("Driver_dCompilerCli.v_dtPathErr", ("Vuna.Compiler.Driver.CompilerCli.dtPathErr", "Vuna/Compiler/Driver/CompilerCli.vuna:737"));
  ("Driver_dCompilerCli.v_emitDiag", ("Vuna.Compiler.Driver.CompilerCli.emitDiag", "Vuna/Compiler/Driver/CompilerCli.vuna:664"));
  ("Driver_dCompilerCli.v_emitDiagRevSeq", ("Vuna.Compiler.Driver.CompilerCli.emitDiagRevSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:692"));
  ("Driver_dCompilerCli.v_emitDiagSeq", ("Vuna.Compiler.Driver.CompilerCli.emitDiagSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:695"));
  ("Driver_dCompilerCli.v_executablePackage", ("Vuna.Compiler.Driver.CompilerCli.executablePackage", "Vuna/Compiler/Driver/CompilerCli.vuna:741"));
  ("Driver_dCompilerCli.v_executablePackageAt", ("Vuna.Compiler.Driver.CompilerCli.executablePackageAt", "Vuna/Compiler/Driver/CompilerCli.vuna:752"));
  ("Driver_dCompilerCli.v_findPackageByName", ("Vuna.Compiler.Driver.CompilerCli.findPackageByName", "Vuna/Compiler/Driver/CompilerCli.vuna:1231"));
  ("Driver_dCompilerCli.v_findPkgRootGo", ("Vuna.Compiler.Driver.CompilerCli.findPkgRootGo", "Vuna/Compiler/Driver/CompilerCli.vuna:379"));
  ("Driver_dCompilerCli.v_finishWarnings", ("Vuna.Compiler.Driver.CompilerCli.finishWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:1540"));
  ("Driver_dCompilerCli.v_finishWarningsDir", ("Vuna.Compiler.Driver.CompilerCli.finishWarningsDir", "Vuna/Compiler/Driver/CompilerCli.vuna:1551"));
  ("Driver_dCompilerCli.v_flushSarif", ("Vuna.Compiler.Driver.CompilerCli.flushSarif", "Vuna/Compiler/Driver/CompilerCli.vuna:172"));
  ("Driver_dCompilerCli.v_hasDenyWarnings", ("Vuna.Compiler.Driver.CompilerCli.hasDenyWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:280"));
  ("Driver_dCompilerCli.v_hasFailFast", ("Vuna.Compiler.Driver.CompilerCli.hasFailFast", "Vuna/Compiler/Driver/CompilerCli.vuna:298"));
  ("Driver_dCompilerCli.v_hasFormatFlag", ("Vuna.Compiler.Driver.CompilerCli.hasFormatFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:455"));
  ("Driver_dCompilerCli.v_hasLangFlag", ("Vuna.Compiler.Driver.CompilerCli.hasLangFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:1584"));
  ("Driver_dCompilerCli.v_hasShowCascade", ("Vuna.Compiler.Driver.CompilerCli.hasShowCascade", "Vuna/Compiler/Driver/CompilerCli.vuna:285"));
  ("Driver_dCompilerCli.v_hasShowWarnings", ("Vuna.Compiler.Driver.CompilerCli.hasShowWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:449"));
  ("Driver_dCompilerCli.v_hasWithSources", ("Vuna.Compiler.Driver.CompilerCli.hasWithSources", "Vuna/Compiler/Driver/CompilerCli.vuna:294"));
  ("Driver_dCompilerCli.v_helpFor", ("Vuna.Compiler.Driver.CompilerCli.helpFor", "Vuna/Compiler/Driver/CompilerCli.vuna:586"));
  ("Driver_dCompilerCli.v_isCascadeDiag", ("Vuna.Compiler.Driver.CompilerCli.isCascadeDiag", "Vuna/Compiler/Driver/CompilerCli.vuna:429"));
  ("Driver_dCompilerCli.v_isKnownTarget", ("Vuna.Compiler.Driver.CompilerCli.isKnownTarget", "Vuna/Compiler/Driver/CompilerCli.vuna:794"));
  ("Driver_dCompilerCli.v_isMachineFormat", ("Vuna.Compiler.Driver.CompilerCli.isMachineFormat", "Vuna/Compiler/Driver/CompilerCli.vuna:928"));
  ("Driver_dCompilerCli.v_isModuleFileEntry", ("Vuna.Compiler.Driver.CompilerCli.isModuleFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:1078"));
  ("Driver_dCompilerCli.v_isPackageEntryPath", ("Vuna.Compiler.Driver.CompilerCli.isPackageEntryPath", "Vuna/Compiler/Driver/CompilerCli.vuna:1084"));
  ("Driver_dCompilerCli.v_isSingleLibraryPackage", ("Vuna.Compiler.Driver.CompilerCli.isSingleLibraryPackage", "Vuna/Compiler/Driver/CompilerCli.vuna:1212"));
  ("Driver_dCompilerCli.v_isTextDiagFormat", ("Vuna.Compiler.Driver.CompilerCli.isTextDiagFormat", "Vuna/Compiler/Driver/CompilerCli.vuna:436"));
  ("Driver_dCompilerCli.v_isWorkspaceRoot", ("Vuna.Compiler.Driver.CompilerCli.isWorkspaceRoot", "Vuna/Compiler/Driver/CompilerCli.vuna:1020"));
  ("Driver_dCompilerCli.v_labelFiles", ("Vuna.Compiler.Driver.CompilerCli.labelFiles", "Vuna/Compiler/Driver/CompilerCli.vuna:317"));
  ("Driver_dCompilerCli.v_lastSlashGo", ("Vuna.Compiler.Driver.CompilerCli.lastSlashGo", "Vuna/Compiler/Driver/CompilerCli.vuna:331"));
  ("Driver_dCompilerCli.v_lastSlashIndexOf", ("Vuna.Compiler.Driver.CompilerCli.lastSlashIndexOf", "Vuna/Compiler/Driver/CompilerCli.vuna:335"));
  ("Driver_dCompilerCli.v_libraryOnlyMessage", ("Vuna.Compiler.Driver.CompilerCli.libraryOnlyMessage", "Vuna/Compiler/Driver/CompilerCli.vuna:1219"));
  ("Driver_dCompilerCli.v_linkDefaultOutput", ("Vuna.Compiler.Driver.CompilerCli.linkDefaultOutput", "Vuna/Compiler/Driver/CompilerCli.vuna:1483"));
  ("Driver_dCompilerCli.v_mapEff", ("Vuna.Compiler.Driver.CompilerCli.mapEff", "Vuna/Compiler/Driver/CompilerCli.vuna:57"));
  ("Driver_dCompilerCli.v_markFormatExplicit", ("Vuna.Compiler.Driver.CompilerCli.markFormatExplicit", "Vuna/Compiler/Driver/CompilerCli.vuna:135"));
  ("Driver_dCompilerCli.v_markRelease", ("Vuna.Compiler.Driver.CompilerCli.markRelease", "Vuna/Compiler/Driver/CompilerCli.vuna:109"));
  ("Driver_dCompilerCli.v_markTarget", ("Vuna.Compiler.Driver.CompilerCli.markTarget", "Vuna/Compiler/Driver/CompilerCli.vuna:113"));
  ("Driver_dCompilerCli.v_markViewComplete", ("Vuna.Compiler.Driver.CompilerCli.markViewComplete", "Vuna/Compiler/Driver/CompilerCli.vuna:1477"));
  ("Driver_dCompilerCli.v_maxErrorsOf", ("Vuna.Compiler.Driver.CompilerCli.maxErrorsOf", "Vuna/Compiler/Driver/CompilerCli.vuna:258"));
  ("Driver_dCompilerCli.v_memStr", ("Vuna.Compiler.Driver.CompilerCli.memStr", "Vuna/Compiler/Driver/CompilerCli.vuna:326"));
  ("Driver_dCompilerCli.v_moduleOfRel", ("Vuna.Compiler.Driver.CompilerCli.moduleOfRel", "Vuna/Compiler/Driver/CompilerCli.vuna:365"));
  ("Driver_dCompilerCli.v_nativeBuildScript", ("Vuna.Compiler.Driver.CompilerCli.nativeBuildScript", "Vuna/Compiler/Driver/CompilerCli.vuna:1290"));
  ("Driver_dCompilerCli.v_ownedByFile", ("Vuna.Compiler.Driver.CompilerCli.ownedByFile", "Vuna/Compiler/Driver/CompilerCli.vuna:1525"));
  ("Driver_dCompilerCli.v_ownedByPackage", ("Vuna.Compiler.Driver.CompilerCli.ownedByPackage", "Vuna/Compiler/Driver/CompilerCli.vuna:1529"));
  ("Driver_dCompilerCli.v_packageRecover", ("Vuna.Compiler.Driver.CompilerCli.packageRecover", "Vuna/Compiler/Driver/CompilerCli.vuna:1606"));
  ("Driver_dCompilerCli.v_packageRecoverExe", ("Vuna.Compiler.Driver.CompilerCli.packageRecoverExe", "Vuna/Compiler/Driver/CompilerCli.vuna:1613"));
  ("Driver_dCompilerCli.v_packageRecoverLib", ("Vuna.Compiler.Driver.CompilerCli.packageRecoverLib", "Vuna/Compiler/Driver/CompilerCli.vuna:1623"));
  ("Driver_dCompilerCli.v_parseIntChars", ("Vuna.Compiler.Driver.CompilerCli.parseIntChars", "Vuna/Compiler/Driver/CompilerCli.vuna:526"));
  ("Driver_dCompilerCli.v_parseIntOr", ("Vuna.Compiler.Driver.CompilerCli.parseIntOr", "Vuna/Compiler/Driver/CompilerCli.vuna:522"));
  ("Driver_dCompilerCli.v_printDiag", ("Vuna.Compiler.Driver.CompilerCli.printDiag", "Vuna/Compiler/Driver/CompilerCli.vuna:714"));
  ("Driver_dCompilerCli.v_printDiagList", ("Vuna.Compiler.Driver.CompilerCli.printDiagList", "Vuna/Compiler/Driver/CompilerCli.vuna:722"));
  ("Driver_dCompilerCli.v_printDiagWithPrefix", ("Vuna.Compiler.Driver.CompilerCli.printDiagWithPrefix", "Vuna/Compiler/Driver/CompilerCli.vuna:702"));
  ("Driver_dCompilerCli.v_printErr", ("Vuna.Compiler.Driver.CompilerCli.printErr", "Vuna/Compiler/Driver/CompilerCli.vuna:718"));
  ("Driver_dCompilerCli.v_printErrText", ("Vuna.Compiler.Driver.CompilerCli.printErrText", "Vuna/Compiler/Driver/CompilerCli.vuna:648"));
  ("Driver_dCompilerCli.v_printRecovered", ("Vuna.Compiler.Driver.CompilerCli.printRecovered", "Vuna/Compiler/Driver/CompilerCli.vuna:1636"));
  ("Driver_dCompilerCli.v_printVersion", ("Vuna.Compiler.Driver.CompilerCli.printVersion", "Vuna/Compiler/Driver/CompilerCli.vuna:574"));
  ("Driver_dCompilerCli.v_removedCommand", ("Vuna.Compiler.Driver.CompilerCli.removedCommand", "Vuna/Compiler/Driver/CompilerCli.vuna:606"));
  ("Driver_dCompilerCli.v_removedFlag", ("Vuna.Compiler.Driver.CompilerCli.removedFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:636"));
  ("Driver_dCompilerCli.v_removedFlagHint", ("Vuna.Compiler.Driver.CompilerCli.removedFlagHint", "Vuna/Compiler/Driver/CompilerCli.vuna:617"));
  ("Driver_dCompilerCli.v_runCompilerCli", ("Vuna.Compiler.Driver.CompilerCli.runCompilerCli", "Vuna/Compiler/Driver/CompilerCli.vuna:66"));
  ("Driver_dCompilerCli.v_runCompilerCliFor", ("Vuna.Compiler.Driver.CompilerCli.runCompilerCliFor", "Vuna/Compiler/Driver/CompilerCli.vuna:495"));
  ("Driver_dCompilerCli.v_runCompilerCliFor1", ("Vuna.Compiler.Driver.CompilerCli.runCompilerCliFor1", "Vuna/Compiler/Driver/CompilerCli.vuna:554"));
  ("Driver_dCompilerCli.v_selectBuildTargets", ("Vuna.Compiler.Driver.CompilerCli.selectBuildTargets", "Vuna/Compiler/Driver/CompilerCli.vuna:1224"));
  ("Driver_dCompilerCli.v_severityLabelOf", ("Vuna.Compiler.Driver.CompilerCli.severityLabelOf", "Vuna/Compiler/Driver/CompilerCli.vuna:655"));
  ("Driver_dCompilerCli.v_sourcePairsEff", ("Vuna.Compiler.Driver.CompilerCli.sourcePairsEff", "Vuna/Compiler/Driver/CompilerCli.vuna:421"));
  ("Driver_dCompilerCli.v_sourceRefEff", ("Vuna.Compiler.Driver.CompilerCli.sourceRefEff", "Vuna/Compiler/Driver/CompilerCli.vuna:402"));
  ("Driver_dCompilerCli.v_splitSlash", ("Vuna.Compiler.Driver.CompilerCli.splitSlash", "Vuna/Compiler/Driver/CompilerCli.vuna:354"));
  ("Driver_dCompilerCli.v_splitSlashGo", ("Vuna.Compiler.Driver.CompilerCli.splitSlashGo", "Vuna/Compiler/Driver/CompilerCli.vuna:357"));
  ("Driver_dCompilerCli.v_stdoutIsTty", ("Vuna.Compiler.Driver.CompilerCli.stdoutIsTty", "Vuna/Compiler/Driver/CompilerCli.vuna:491"));
  ("Driver_dCompilerCli.v_stripContinueGo", ("Vuna.Compiler.Driver.CompilerCli.stripContinueGo", "Vuna/Compiler/Driver/CompilerCli.vuna:1592"));
  ("Driver_dCompilerCli.v_stripContinueOnError", ("Vuna.Compiler.Driver.CompilerCli.stripContinueOnError", "Vuna/Compiler/Driver/CompilerCli.vuna:1589"));
  ("Driver_dCompilerCli.v_stripDenyWarnings", ("Vuna.Compiler.Driver.CompilerCli.stripDenyWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:271"));
  ("Driver_dCompilerCli.v_stripDiagFormat", ("Vuna.Compiler.Driver.CompilerCli.stripDiagFormat", "Vuna/Compiler/Driver/CompilerCli.vuna:464"));
  ("Driver_dCompilerCli.v_stripDiagFormatGo", ("Vuna.Compiler.Driver.CompilerCli.stripDiagFormatGo", "Vuna/Compiler/Driver/CompilerCli.vuna:468"));
  ("Driver_dCompilerCli.v_stripDotSlash", ("Vuna.Compiler.Driver.CompilerCli.stripDotSlash", "Vuna/Compiler/Driver/CompilerCli.vuna:1520"));
  ("Driver_dCompilerCli.v_stripFailFast", ("Vuna.Compiler.Driver.CompilerCli.stripFailFast", "Vuna/Compiler/Driver/CompilerCli.vuna:302"));
  ("Driver_dCompilerCli.v_stripLang", ("Vuna.Compiler.Driver.CompilerCli.stripLang", "Vuna/Compiler/Driver/CompilerCli.vuna:1567"));
  ("Driver_dCompilerCli.v_stripLangGo", ("Vuna.Compiler.Driver.CompilerCli.stripLangGo", "Vuna/Compiler/Driver/CompilerCli.vuna:1571"));
  ("Driver_dCompilerCli.v_stripMaxErrors", ("Vuna.Compiler.Driver.CompilerCli.stripMaxErrors", "Vuna/Compiler/Driver/CompilerCli.vuna:534"));
  ("Driver_dCompilerCli.v_stripMaxErrorsGo", ("Vuna.Compiler.Driver.CompilerCli.stripMaxErrorsGo", "Vuna/Compiler/Driver/CompilerCli.vuna:538"));
  ("Driver_dCompilerCli.v_stripPathPrefix", ("Vuna.Compiler.Driver.CompilerCli.stripPathPrefix", "Vuna/Compiler/Driver/CompilerCli.vuna:344"));
  ("Driver_dCompilerCli.v_stripShowCascade", ("Vuna.Compiler.Driver.CompilerCli.stripShowCascade", "Vuna/Compiler/Driver/CompilerCli.vuna:289"));
  ("Driver_dCompilerCli.v_stripWithSources", ("Vuna.Compiler.Driver.CompilerCli.stripWithSources", "Vuna/Compiler/Driver/CompilerCli.vuna:307"));
  ("Driver_dCompilerCli.v_takeDiags", ("Vuna.Compiler.Driver.CompilerCli.takeDiags", "Vuna/Compiler/Driver/CompilerCli.vuna:262"));
  ("Driver_dCompilerCli.v_takeDiagsGo", ("Vuna.Compiler.Driver.CompilerCli.takeDiagsGo", "Vuna/Compiler/Driver/CompilerCli.vuna:266"));
  ("Driver_dCompilerCli.v_unknownCommand", ("Vuna.Compiler.Driver.CompilerCli.unknownCommand", "Vuna/Compiler/Driver/CompilerCli.vuna:600"));
  ("Driver_dCompilerCli.v_usageErr", ("Vuna.Compiler.Driver.CompilerCli.usageErr", "Vuna/Compiler/Driver/CompilerCli.vuna:593"));
  ("Driver_dCompilerCli.v_visibleDiags", ("Vuna.Compiler.Driver.CompilerCli.visibleDiags", "Vuna/Compiler/Driver/CompilerCli.vuna:439"));
  ("Driver_dCompilerCli.v_waitView", ("Vuna.Compiler.Driver.CompilerCli.waitView", "Vuna/Compiler/Driver/CompilerCli.vuna:1459"));
  ("Driver_dCompilerCli.v_withOpts", ("Vuna.Compiler.Driver.CompilerCli.withOpts", "Vuna/Compiler/Driver/CompilerCli.vuna:156"));
  ("Driver_dCompilerCli.v_workspaceMultiOut", ("Vuna.Compiler.Driver.CompilerCli.workspaceMultiOut", "Vuna/Compiler/Driver/CompilerCli.vuna:1204"));
  ("Driver_dDt.v_allocMetas", ("Vuna.Compiler.Driver.Dt.allocMetas", "Vuna/Compiler/Driver/Dt.vuna:647"));
  ("Driver_dDt.v_allocTelescopes", ("Vuna.Compiler.Driver.Dt.allocTelescopes", "Vuna/Compiler/Driver/Dt.vuna:634"));
  ("Driver_dDt.v_applyArity", ("Vuna.Compiler.Driver.Dt.applyArity", "Vuna/Compiler/Driver/Dt.vuna:819"));
  ("Driver_dDt.v_aritiesOf", ("Vuna.Compiler.Driver.Dt.aritiesOf", "Vuna/Compiler/Driver/Dt.vuna:618"));
  ("Driver_dDt.v_auxKeyOne", ("Vuna.Compiler.Driver.Dt.auxKeyOne", "Vuna/Compiler/Driver/Dt.vuna:1293"));
  ("Driver_dDt.v_bodyPairs", ("Vuna.Compiler.Driver.Dt.bodyPairs", "Vuna/Compiler/Driver/Dt.vuna:1137"));
  ("Driver_dDt.v_buildGenMetas", ("Vuna.Compiler.Driver.Dt.buildGenMetas", "Vuna/Compiler/Driver/Dt.vuna:721"));
  ("Driver_dDt.v_buildPi", ("Vuna.Compiler.Driver.Dt.buildPi", "Vuna/Compiler/Driver/Dt.vuna:655"));
  ("Driver_dDt.v_cachedNamesOf", ("Vuna.Compiler.Driver.Dt.cachedNamesOf", "Vuna/Compiler/Driver/Dt.vuna:1018"));
  ("Driver_dDt.v_cachedNamesOne", ("Vuna.Compiler.Driver.Dt.cachedNamesOne", "Vuna/Compiler/Driver/Dt.vuna:1021"));
  ("Driver_dDt.v_checkDeclsWithWarns", ("Vuna.Compiler.Driver.Dt.checkDeclsWithWarns", "Vuna/Compiler/Driver/Dt.vuna:142"));
  ("Driver_dDt.v_checkDtProgramOf", ("Vuna.Compiler.Driver.Dt.checkDtProgramOf", "Vuna/Compiler/Driver/Dt.vuna:2137"));
  ("Driver_dDt.v_cleanStartNext", ("Vuna.Compiler.Driver.Dt.cleanStartNext", "Vuna/Compiler/Driver/Dt.vuna:1106"));
  ("Driver_dDt.v_closureFuel", ("Vuna.Compiler.Driver.Dt.closureFuel", "Vuna/Compiler/Driver/Dt.vuna:1824"));
  ("Driver_dDt.v_closureGo", ("Vuna.Compiler.Driver.Dt.closureGo", "Vuna/Compiler/Driver/Dt.vuna:1831"));
  ("Driver_dDt.v_concatKeys", ("Vuna.Compiler.Driver.Dt.concatKeys", "Vuna/Compiler/Driver/Dt.vuna:1678"));
  ("Driver_dDt.v_dedupClasses", ("Vuna.Compiler.Driver.Dt.dedupClasses", "Vuna/Compiler/Driver/Dt.vuna:1150"));
  ("Driver_dDt.v_dedupDatas", ("Vuna.Compiler.Driver.Dt.dedupDatas", "Vuna/Compiler/Driver/Dt.vuna:1144"));
  ("Driver_dDt.v_dedupDefBodies", ("Vuna.Compiler.Driver.Dt.dedupDefBodies", "Vuna/Compiler/Driver/Dt.vuna:1131"));
  ("Driver_dDt.v_dedupDefs", ("Vuna.Compiler.Driver.Dt.dedupDefs", "Vuna/Compiler/Driver/Dt.vuna:1134"));
  ("Driver_dDt.v_dedupGlobals", ("Vuna.Compiler.Driver.Dt.dedupGlobals", "Vuna/Compiler/Driver/Dt.vuna:1153"));
  ("Driver_dDt.v_dedupInsts", ("Vuna.Compiler.Driver.Dt.dedupInsts", "Vuna/Compiler/Driver/Dt.vuna:1147"));
  ("Driver_dDt.v_dedupInts", ("Vuna.Compiler.Driver.Dt.dedupInts", "Vuna/Compiler/Driver/Dt.vuna:785"));
  ("Driver_dDt.v_dedupKeepLast", ("Vuna.Compiler.Driver.Dt.dedupKeepLast", "Vuna/Compiler/Driver/Dt.vuna:1116"));
  ("Driver_dDt.v_dedupKeepLastGo", ("Vuna.Compiler.Driver.Dt.dedupKeepLastGo", "Vuna/Compiler/Driver/Dt.vuna:1119"));
  ("Driver_dDt.v_dedupSortedGo", ("Vuna.Compiler.Driver.Dt.dedupSortedGo", "Vuna/Compiler/Driver/Dt.vuna:1191"));
  ("Driver_dDt.v_dedupSortedNames", ("Vuna.Compiler.Driver.Dt.dedupSortedNames", "Vuna/Compiler/Driver/Dt.vuna:1188"));
  ("Driver_dDt.v_defTableOf", ("Vuna.Compiler.Driver.Dt.defTableOf", "Vuna/Compiler/Driver/Dt.vuna:1001"));
  ("Driver_dDt.v_depStartOf", ("Vuna.Compiler.Driver.Dt.depStartOf", "Vuna/Compiler/Driver/Dt.vuna:1086"));
  ("Driver_dDt.v_depStartOfAt", ("Vuna.Compiler.Driver.Dt.depStartOfAt", "Vuna/Compiler/Driver/Dt.vuna:1061"));
  ("Driver_dDt.v_dtAuxForTermination", ("Vuna.Compiler.Driver.Dt.dtAuxForTermination", "Vuna/Compiler/Driver/Dt.vuna:1258"));
  ("Driver_dDt.v_dtAuxKey", ("Vuna.Compiler.Driver.Dt.dtAuxKey", "Vuna/Compiler/Driver/Dt.vuna:1296"));
  ("Driver_dDt.v_dtAuxOfCache", ("Vuna.Compiler.Driver.Dt.dtAuxOfCache", "Vuna/Compiler/Driver/Dt.vuna:1301"));
  ("Driver_dDt.v_dtBindingTypes", ("Vuna.Compiler.Driver.Dt.dtBindingTypes", "Vuna/Compiler/Driver/Dt.vuna:688"));
  ("Driver_dDt.v_dtCheck", ("Vuna.Compiler.Driver.Dt.dtCheck", "Vuna/Compiler/Driver/Dt.vuna:254"));
  ("Driver_dDt.v_dtCheckDecls", ("Vuna.Compiler.Driver.Dt.dtCheckDecls", "Vuna/Compiler/Driver/Dt.vuna:132"));
  ("Driver_dDt.v_dtCheckLibraryPackageIncrementalParts", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryPackageIncrementalParts", "Vuna/Compiler/Driver/Dt.vuna:1927"));
  ("Driver_dDt.v_dtCheckLibraryPackageWithIfacesParts", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryPackageWithIfacesParts", "Vuna/Compiler/Driver/Dt.vuna:1940"));
  ("Driver_dDt.v_dtCheckLibraryRecovering", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryRecovering", "Vuna/Compiler/Driver/Dt.vuna:2125"));
  ("Driver_dDt.v_dtCheckLibraryWithProgramParts", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryWithProgramParts", "Vuna/Compiler/Driver/Dt.vuna:171"));
  ("Driver_dDt.v_dtCheckModuleFile", ("Vuna.Compiler.Driver.Dt.dtCheckModuleFile", "Vuna/Compiler/Driver/Dt.vuna:287"));
  ("Driver_dDt.v_dtCheckOursParts", ("Vuna.Compiler.Driver.Dt.dtCheckOursParts", "Vuna/Compiler/Driver/Dt.vuna:1027"));
  ("Driver_dDt.v_dtCheckPackageIncrementalParts", ("Vuna.Compiler.Driver.Dt.dtCheckPackageIncrementalParts", "Vuna/Compiler/Driver/Dt.vuna:1591"));
  ("Driver_dDt.v_dtCheckPackageWithIfacesParts", ("Vuna.Compiler.Driver.Dt.dtCheckPackageWithIfacesParts", "Vuna/Compiler/Driver/Dt.vuna:1897"));
  ("Driver_dDt.v_dtCheckPartsWithProgram", ("Vuna.Compiler.Driver.Dt.dtCheckPartsWithProgram", "Vuna/Compiler/Driver/Dt.vuna:175"));
  ("Driver_dDt.v_dtCheckRecovering", ("Vuna.Compiler.Driver.Dt.dtCheckRecovering", "Vuna/Compiler/Driver/Dt.vuna:2114"));
  ("Driver_dDt.v_dtCheckScoped", ("Vuna.Compiler.Driver.Dt.dtCheckScoped", "Vuna/Compiler/Driver/Dt.vuna:1482"));
  ("Driver_dDt.v_dtCheckSource", ("Vuna.Compiler.Driver.Dt.dtCheckSource", "Vuna/Compiler/Driver/Dt.vuna:367"));
  ("Driver_dDt.v_dtCheckSourceChecked", ("Vuna.Compiler.Driver.Dt.dtCheckSourceChecked", "Vuna/Compiler/Driver/Dt.vuna:1580"));
  ("Driver_dDt.v_dtCheckSourceIncremental", ("Vuna.Compiler.Driver.Dt.dtCheckSourceIncremental", "Vuna/Compiler/Driver/Dt.vuna:1497"));
  ("Driver_dDt.v_dtCheckSourceWithIfaces", ("Vuna.Compiler.Driver.Dt.dtCheckSourceWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:396"));
  ("Driver_dDt.v_dtCheckWithProgramParts", ("Vuna.Compiler.Driver.Dt.dtCheckWithProgramParts", "Vuna/Compiler/Driver/Dt.vuna:167"));
  ("Driver_dDt.v_dtDefGlobalNames", ("Vuna.Compiler.Driver.Dt.dtDefGlobalNames", "Vuna/Compiler/Driver/Dt.vuna:2079"));
  ("Driver_dDt.v_dtElabFullWithPrepared", ("Vuna.Compiler.Driver.Dt.dtElabFullWithPrepared", "Vuna/Compiler/Driver/Dt.vuna:1271"));
  ("Driver_dDt.v_dtEvalExpr", ("Vuna.Compiler.Driver.Dt.dtEvalExpr", "Vuna/Compiler/Driver/Dt.vuna:342"));
  ("Driver_dDt.v_dtEvalExprInfo", ("Vuna.Compiler.Driver.Dt.dtEvalExprInfo", "Vuna/Compiler/Driver/Dt.vuna:355"));
  ("Driver_dDt.v_dtEvalExprInfoWithAuxCache", ("Vuna.Compiler.Driver.Dt.dtEvalExprInfoWithAuxCache", "Vuna/Compiler/Driver/Dt.vuna:522"));
  ("Driver_dDt.v_dtEvalExprInfoWithIfaces", ("Vuna.Compiler.Driver.Dt.dtEvalExprInfoWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:548"));
  ("Driver_dDt.v_dtEvalExprWithAuxCache", ("Vuna.Compiler.Driver.Dt.dtEvalExprWithAuxCache", "Vuna/Compiler/Driver/Dt.vuna:535"));
  ("Driver_dDt.v_dtEvalExprWithIfaces", ("Vuna.Compiler.Driver.Dt.dtEvalExprWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:558"));
  ("Driver_dDt.v_dtEvalFile", ("Vuna.Compiler.Driver.Dt.dtEvalFile", "Vuna/Compiler/Driver/Dt.vuna:299"));
  ("Driver_dDt.v_dtEvalSourceIncremental", ("Vuna.Compiler.Driver.Dt.dtEvalSourceIncremental", "Vuna/Compiler/Driver/Dt.vuna:1560"));
  ("Driver_dDt.v_dtFileHasModuleHeader", ("Vuna.Compiler.Driver.Dt.dtFileHasModuleHeader", "Vuna/Compiler/Driver/Dt.vuna:275"));
  ("Driver_dDt.v_dtFinishPackage", ("Vuna.Compiler.Driver.Dt.dtFinishPackage", "Vuna/Compiler/Driver/Dt.vuna:1409"));
  ("Driver_dDt.v_dtFinishPackageScoped", ("Vuna.Compiler.Driver.Dt.dtFinishPackageScoped", "Vuna/Compiler/Driver/Dt.vuna:1437"));
  ("Driver_dDt.v_dtFinishScoped", ("Vuna.Compiler.Driver.Dt.dtFinishScoped", "Vuna/Compiler/Driver/Dt.vuna:1463"));
  ("Driver_dDt.v_dtGenerateIncremental", ("Vuna.Compiler.Driver.Dt.dtGenerateIncremental", "Vuna/Compiler/Driver/Dt.vuna:1759"));
  ("Driver_dDt.v_dtGoalsIncrementalCore", ("Vuna.Compiler.Driver.Dt.dtGoalsIncrementalCore", "Vuna/Compiler/Driver/Dt.vuna:1402"));
  ("Driver_dDt.v_dtGoalsSource", ("Vuna.Compiler.Driver.Dt.dtGoalsSource", "Vuna/Compiler/Driver/Dt.vuna:839"));
  ("Driver_dDt.v_dtGoalsSourceIncremental", ("Vuna.Compiler.Driver.Dt.dtGoalsSourceIncremental", "Vuna/Compiler/Driver/Dt.vuna:1528"));
  ("Driver_dDt.v_dtGoalsSourceTolerant", ("Vuna.Compiler.Driver.Dt.dtGoalsSourceTolerant", "Vuna/Compiler/Driver/Dt.vuna:853"));
  ("Driver_dDt.v_dtIncrementalChecked", ("Vuna.Compiler.Driver.Dt.dtIncrementalChecked", "Vuna/Compiler/Driver/Dt.vuna:1305"));
  ("Driver_dDt.v_dtIncrementalCheckedCore", ("Vuna.Compiler.Driver.Dt.dtIncrementalCheckedCore", "Vuna/Compiler/Driver/Dt.vuna:1389"));
  ("Driver_dDt.v_dtIncrementalSetup", ("Vuna.Compiler.Driver.Dt.dtIncrementalSetup", "Vuna/Compiler/Driver/Dt.vuna:1334"));
  ("Driver_dDt.v_dtInferDefTypes", ("Vuna.Compiler.Driver.Dt.dtInferDefTypes", "Vuna/Compiler/Driver/Dt.vuna:585"));
  ("Driver_dDt.v_dtLoad", ("Vuna.Compiler.Driver.Dt.dtLoad", "Vuna/Compiler/Driver/Dt.vuna:81"));
  ("Driver_dDt.v_dtLoadModulesParts", ("Vuna.Compiler.Driver.Dt.dtLoadModulesParts", "Vuna/Compiler/Driver/Dt.vuna:118"));
  ("Driver_dDt.v_dtLoadModulesPartsIncremental", ("Vuna.Compiler.Driver.Dt.dtLoadModulesPartsIncremental", "Vuna/Compiler/Driver/Dt.vuna:1910"));
  ("Driver_dDt.v_dtLoadModulesPartsWithIfaces", ("Vuna.Compiler.Driver.Dt.dtLoadModulesPartsWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:1883"));
  ("Driver_dDt.v_dtLoadParts", ("Vuna.Compiler.Driver.Dt.dtLoadParts", "Vuna/Compiler/Driver/Dt.vuna:1012"));
  ("Driver_dDt.v_dtLoadPartsForCheck", ("Vuna.Compiler.Driver.Dt.dtLoadPartsForCheck", "Vuna/Compiler/Driver/Dt.vuna:106"));
  ("Driver_dDt.v_dtLoadPartsIncremental", ("Vuna.Compiler.Driver.Dt.dtLoadPartsIncremental", "Vuna/Compiler/Driver/Dt.vuna:1222"));
  ("Driver_dDt.v_dtLoadPartsWithIfaces", ("Vuna.Compiler.Driver.Dt.dtLoadPartsWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:1869"));
  ("Driver_dDt.v_dtMainKind", ("Vuna.Compiler.Driver.Dt.dtMainKind", "Vuna/Compiler/Driver/Dt.vuna:872"));
  ("Driver_dDt.v_dtPrepareTermAux", ("Vuna.Compiler.Driver.Dt.dtPrepareTermAux", "Vuna/Compiler/Driver/Dt.vuna:1247"));
  ("Driver_dDt.v_dtProjectDecls", ("Vuna.Compiler.Driver.Dt.dtProjectDecls", "Vuna/Compiler/Driver/Dt.vuna:77"));
  ("Driver_dDt.v_dtSplitPartsOurs", ("Vuna.Compiler.Driver.Dt.dtSplitPartsOurs", "Vuna/Compiler/Driver/Dt.vuna:1980"));
  ("Driver_dDt.v_dtSplitPartsOursWith", ("Vuna.Compiler.Driver.Dt.dtSplitPartsOursWith", "Vuna/Compiler/Driver/Dt.vuna:1983"));
  ("Driver_dDt.v_dtSplitProjectIncremental", ("Vuna.Compiler.Driver.Dt.dtSplitProjectIncremental", "Vuna/Compiler/Driver/Dt.vuna:1781"));
  ("Driver_dDt.v_dtSplitProjectParts", ("Vuna.Compiler.Driver.Dt.dtSplitProjectParts", "Vuna/Compiler/Driver/Dt.vuna:2036"));
  ("Driver_dDt.v_dtSplitProjectWithIfaces", ("Vuna.Compiler.Driver.Dt.dtSplitProjectWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:1956"));
  ("Driver_dDt.v_evalDtMain", ("Vuna.Compiler.Driver.Dt.evalDtMain", "Vuna/Compiler/Driver/Dt.vuna:937"));
  ("Driver_dDt.v_evalDtMainCore", ("Vuna.Compiler.Driver.Dt.evalDtMainCore", "Vuna/Compiler/Driver/Dt.vuna:948"));
  ("Driver_dDt.v_filterProjectToImports", ("Vuna.Compiler.Driver.Dt.filterProjectToImports", "Vuna/Compiler/Driver/Dt.vuna:1843"));
  ("Driver_dDt.v_findArity", ("Vuna.Compiler.Driver.Dt.findArity", "Vuna/Compiler/Driver/Dt.vuna:626"));
  ("Driver_dDt.v_findDtDef", ("Vuna.Compiler.Driver.Dt.findDtDef", "Vuna/Compiler/Driver/Dt.vuna:669"));
  ("Driver_dDt.v_findMainDef", ("Vuna.Compiler.Driver.Dt.findMainDef", "Vuna/Compiler/Driver/Dt.vuna:996"));
  ("Driver_dDt.v_findModuleNameField", ("Vuna.Compiler.Driver.Dt.findModuleNameField", "Vuna/Compiler/Driver/Dt.vuna:1607"));
  ("Driver_dDt.v_findModuleNamed", ("Vuna.Compiler.Driver.Dt.findModuleNamed", "Vuna/Compiler/Driver/Dt.vuna:1610"));
  ("Driver_dDt.v_freshMetaName", ("Vuna.Compiler.Driver.Dt.freshMetaName", "Vuna/Compiler/Driver/Dt.vuna:729"));
  ("Driver_dDt.v_generalizeSignature", ("Vuna.Compiler.Driver.Dt.generalizeSignature", "Vuna/Compiler/Driver/Dt.vuna:705"));
  ("Driver_dDt.v_headIsMeta", ("Vuna.Compiler.Driver.Dt.headIsMeta", "Vuna/Compiler/Driver/Dt.vuna:822"));
  ("Driver_dDt.v_imax", ("Vuna.Compiler.Driver.Dt.imax", "Vuna/Compiler/Driver/Dt.vuna:831"));
  ("Driver_dDt.v_importsEdgeCount", ("Vuna.Compiler.Driver.Dt.importsEdgeCount", "Vuna/Compiler/Driver/Dt.vuna:1827"));
  ("Driver_dDt.v_importsOfModuleNames", ("Vuna.Compiler.Driver.Dt.importsOfModuleNames", "Vuna/Compiler/Driver/Dt.vuna:1818"));
  ("Driver_dDt.v_inferEachType", ("Vuna.Compiler.Driver.Dt.inferEachType", "Vuna/Compiler/Driver/Dt.vuna:659"));
  ("Driver_dDt.v_interpMainShow", ("Vuna.Compiler.Driver.Dt.interpMainShow", "Vuna/Compiler/Driver/Dt.vuna:974"));
  ("Driver_dDt.v_isNilRowTermDt", ("Vuna.Compiler.Driver.Dt.isNilRowTermDt", "Vuna/Compiler/Driver/Dt.vuna:991"));
  ("Driver_dDt.v_kindArrows", ("Vuna.Compiler.Driver.Dt.kindArrows", "Vuna/Compiler/Driver/Dt.vuna:753"));
  ("Driver_dDt.v_kindOfArity", ("Vuna.Compiler.Driver.Dt.kindOfArity", "Vuna/Compiler/Driver/Dt.vuna:750"));
  ("Driver_dDt.v_listLen", ("Vuna.Compiler.Driver.Dt.listLen", "Vuna/Compiler/Driver/Dt.vuna:834"));
  ("Driver_dDt.v_loadReplDecls", ("Vuna.Compiler.Driver.Dt.loadReplDecls", "Vuna/Compiler/Driver/Dt.vuna:674"));
  ("Driver_dDt.v_lookupMainKind", ("Vuna.Compiler.Driver.Dt.lookupMainKind", "Vuna/Compiler/Driver/Dt.vuna:916"));
  ("Driver_dDt.v_mainActionKind", ("Vuna.Compiler.Driver.Dt.mainActionKind", "Vuna/Compiler/Driver/Dt.vuna:983"));
  ("Driver_dDt.v_mainKindForName", ("Vuna.Compiler.Driver.Dt.mainKindForName", "Vuna/Compiler/Driver/Dt.vuna:910"));
  ("Driver_dDt.v_mainKindNames", ("Vuna.Compiler.Driver.Dt.mainKindNames", "Vuna/Compiler/Driver/Dt.vuna:901"));
  ("Driver_dDt.v_materializedDeps", ("Vuna.Compiler.Driver.Dt.materializedDeps", "Vuna/Compiler/Driver/Dt.vuna:1857"));
  ("Driver_dDt.v_materializedOwn", ("Vuna.Compiler.Driver.Dt.materializedOwn", "Vuna/Compiler/Driver/Dt.vuna:1863"));
  ("Driver_dDt.v_maxMetaArity", ("Vuna.Compiler.Driver.Dt.maxMetaArity", "Vuna/Compiler/Driver/Dt.vuna:790"));
  ("Driver_dDt.v_maxMetaArityAlts", ("Vuna.Compiler.Driver.Dt.maxMetaArityAlts", "Vuna/Compiler/Driver/Dt.vuna:815"));
  ("Driver_dDt.v_maxMetaArityArgs", ("Vuna.Compiler.Driver.Dt.maxMetaArityArgs", "Vuna/Compiler/Driver/Dt.vuna:811"));
  ("Driver_dDt.v_maxMetaArityMaybe", ("Vuna.Compiler.Driver.Dt.maxMetaArityMaybe", "Vuna/Compiler/Driver/Dt.vuna:807"));
  ("Driver_dDt.v_maxMetaCached", ("Vuna.Compiler.Driver.Dt.maxMetaCached", "Vuna/Compiler/Driver/Dt.vuna:1100"));
  ("Driver_dDt.v_maxMetaCps", ("Vuna.Compiler.Driver.Dt.maxMetaCps", "Vuna/Compiler/Driver/Dt.vuna:1103"));
  ("Driver_dDt.v_maxMetaDef", ("Vuna.Compiler.Driver.Dt.maxMetaDef", "Vuna/Compiler/Driver/Dt.vuna:1094"));
  ("Driver_dDt.v_maxMetaList", ("Vuna.Compiler.Driver.Dt.maxMetaList", "Vuna/Compiler/Driver/Dt.vuna:1090"));
  ("Driver_dDt.v_maybeTermGlobals", ("Vuna.Compiler.Driver.Dt.maybeTermGlobals", "Vuna/Compiler/Driver/Dt.vuna:2083"));
  ("Driver_dDt.v_metaIdsOf", ("Vuna.Compiler.Driver.Dt.metaIdsOf", "Vuna/Compiler/Driver/Dt.vuna:758"));
  ("Driver_dDt.v_metaIdsOfAlt", ("Vuna.Compiler.Driver.Dt.metaIdsOfAlt", "Vuna/Compiler/Driver/Dt.vuna:782"));
  ("Driver_dDt.v_metaIdsOfArgs", ("Vuna.Compiler.Driver.Dt.metaIdsOfArgs", "Vuna/Compiler/Driver/Dt.vuna:778"));
  ("Driver_dDt.v_metaIdsOfMaybe", ("Vuna.Compiler.Driver.Dt.metaIdsOfMaybe", "Vuna/Compiler/Driver/Dt.vuna:774"));
  ("Driver_dDt.v_missingDepModules", ("Vuna.Compiler.Driver.Dt.missingDepModules", "Vuna/Compiler/Driver/Dt.vuna:388"));
  ("Driver_dDt.v_moduleOfIface", ("Vuna.Compiler.Driver.Dt.moduleOfIface", "Vuna/Compiler/Driver/Dt.vuna:1799"));
  ("Driver_dDt.v_moduleOrderLess", ("Vuna.Compiler.Driver.Dt.moduleOrderLess", "Vuna/Compiler/Driver/Dt.vuna:1650"));
  ("Driver_dDt.v_modulesOfIfaces", ("Vuna.Compiler.Driver.Dt.modulesOfIfaces", "Vuna/Compiler/Driver/Dt.vuna:1212"));
  ("Driver_dDt.v_nameSlotTbl", ("Vuna.Compiler.Driver.Dt.nameSlotTbl", "Vuna/Compiler/Driver/Dt.vuna:1198"));
  ("Driver_dDt.v_opaqueSigType", ("Vuna.Compiler.Driver.Dt.opaqueSigType", "Vuna/Compiler/Driver/Dt.vuna:246"));
  ("Driver_dDt.v_pairKeyValue", ("Vuna.Compiler.Driver.Dt.pairKeyValue", "Vuna/Compiler/Driver/Dt.vuna:1672"));
  ("Driver_dDt.v_pickFreshName", ("Vuna.Compiler.Driver.Dt.pickFreshName", "Vuna/Compiler/Driver/Dt.vuna:732"));
  ("Driver_dDt.v_preloadKeepOf", ("Vuna.Compiler.Driver.Dt.preloadKeepOf", "Vuna/Compiler/Driver/Dt.vuna:1853"));
  ("Driver_dDt.v_replCheckParts", ("Vuna.Compiler.Driver.Dt.replCheckParts", "Vuna/Compiler/Driver/Dt.vuna:433"));
  ("Driver_dDt.v_replCheckPartsAux", ("Vuna.Compiler.Driver.Dt.replCheckPartsAux", "Vuna/Compiler/Driver/Dt.vuna:440"));
  ("Driver_dDt.v_replExprName", ("Vuna.Compiler.Driver.Dt.replExprName", "Vuna/Compiler/Driver/Dt.vuna:921"));
  ("Driver_dDt.v_replProgramFull", ("Vuna.Compiler.Driver.Dt.replProgramFull", "Vuna/Compiler/Driver/Dt.vuna:323"));
  ("Driver_dDt.v_replProgramWithIfaces", ("Vuna.Compiler.Driver.Dt.replProgramWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:474"));
  ("Driver_dDt.v_replProgramWithIfacesAux", ("Vuna.Compiler.Driver.Dt.replProgramWithIfacesAux", "Vuna/Compiler/Driver/Dt.vuna:485"));
  ("Driver_dDt.v_sealAbstractAfter", ("Vuna.Compiler.Driver.Dt.sealAbstractAfter", "Vuna/Compiler/Driver/Dt.vuna:223"));
  ("Driver_dDt.v_sealDeclOf", ("Vuna.Compiler.Driver.Dt.sealDeclOf", "Vuna/Compiler/Driver/Dt.vuna:234"));
  ("Driver_dDt.v_sealModule", ("Vuna.Compiler.Driver.Dt.sealModule", "Vuna/Compiler/Driver/Dt.vuna:213"));
  ("Driver_dDt.v_sealOpaqueDecls", ("Vuna.Compiler.Driver.Dt.sealOpaqueDecls", "Vuna/Compiler/Driver/Dt.vuna:210"));
  ("Driver_dDt.v_sealSpan", ("Vuna.Compiler.Driver.Dt.sealSpan", "Vuna/Compiler/Driver/Dt.vuna:243"));
  ("Driver_dDt.v_shiftedDepPrograms", ("Vuna.Compiler.Driver.Dt.shiftedDepPrograms", "Vuna/Compiler/Driver/Dt.vuna:1172"));
  ("Driver_dDt.v_shiftedDepProgramsGo", ("Vuna.Compiler.Driver.Dt.shiftedDepProgramsGo", "Vuna/Compiler/Driver/Dt.vuna:1202"));
  ("Driver_dDt.v_sortNames", ("Vuna.Compiler.Driver.Dt.sortNames", "Vuna/Compiler/Driver/Dt.vuna:1183"));
  ("Driver_dDt.v_spineLen", ("Vuna.Compiler.Driver.Dt.spineLen", "Vuna/Compiler/Driver/Dt.vuna:827"));
  ("Driver_dDt.v_splitGenerateCached", ("Vuna.Compiler.Driver.Dt.splitGenerateCached", "Vuna/Compiler/Driver/Dt.vuna:1741"));
  ("Driver_dDt.v_splitReplExpr", ("Vuna.Compiler.Driver.Dt.splitReplExpr", "Vuna/Compiler/Driver/Dt.vuna:925"));
  ("Driver_dDt.v_substGenMetas", ("Vuna.Compiler.Driver.Dt.substGenMetas", "Vuna/Compiler/Driver/Dt.vuna:741"));
  ("Driver_dDt.v_topoDepsOf", ("Vuna.Compiler.Driver.Dt.topoDepsOf", "Vuna/Compiler/Driver/Dt.vuna:1615"));
  ("Driver_dDt.v_topoModules", ("Vuna.Compiler.Driver.Dt.topoModules", "Vuna/Compiler/Driver/Dt.vuna:1657"));
  ("Driver_dDt.v_topoVisit", ("Vuna.Compiler.Driver.Dt.topoVisit", "Vuna/Compiler/Driver/Dt.vuna:1625"));
  ("Driver_dDt.v_topoVisitAll", ("Vuna.Compiler.Driver.Dt.topoVisitAll", "Vuna/Compiler/Driver/Dt.vuna:1639"));
  ("Driver_dDt.v_unitCacheEnabled", ("Vuna.Compiler.Driver.Dt.unitCacheEnabled", "Vuna/Compiler/Driver/Dt.vuna:1735"));
  ("Driver_dDt.v_unitCacheLookup", ("Vuna.Compiler.Driver.Dt.unitCacheLookup", "Vuna/Compiler/Driver/Dt.vuna:1710"));
  ("Driver_dDt.v_unitCacheStore", ("Vuna.Compiler.Driver.Dt.unitCacheStore", "Vuna/Compiler/Driver/Dt.vuna:1726"));
  ("Driver_dDt.v_unitDeclsHash", ("Vuna.Compiler.Driver.Dt.unitDeclsHash", "Vuna/Compiler/Driver/Dt.vuna:1669"));
  ("Driver_dDt.v_unitImportKey", ("Vuna.Compiler.Driver.Dt.unitImportKey", "Vuna/Compiler/Driver/Dt.vuna:1682"));
  ("Driver_dDt.v_unitImportsOf", ("Vuna.Compiler.Driver.Dt.unitImportsOf", "Vuna/Compiler/Driver/Dt.vuna:1675"));
  ("Driver_dDt.v_unitKeyOne", ("Vuna.Compiler.Driver.Dt.unitKeyOne", "Vuna/Compiler/Driver/Dt.vuna:1688"));
  ("Driver_dDt.v_unitKeysGo", ("Vuna.Compiler.Driver.Dt.unitKeysGo", "Vuna/Compiler/Driver/Dt.vuna:1694"));
  ("Driver_dDt.v_unitKeysOf", ("Vuna.Compiler.Driver.Dt.unitKeysOf", "Vuna/Compiler/Driver/Dt.vuna:1698"));
  ("Driver_dDt.v_warnUnusedDefsGo", ("Vuna.Compiler.Driver.Dt.warnUnusedDefsGo", "Vuna/Compiler/Driver/Dt.vuna:2092"));
  ("Driver_dDt.v_warnUnusedDefsIn", ("Vuna.Compiler.Driver.Dt.warnUnusedDefsIn", "Vuna/Compiler/Driver/Dt.vuna:2071"));
  ("Driver_dDt.v_warnUnusedDefsTbl", ("Vuna.Compiler.Driver.Dt.warnUnusedDefsTbl", "Vuna/Compiler/Driver/Dt.vuna:2095"));
  ("Driver_dDt.v_wrapGenMetas", ("Vuna.Compiler.Driver.Dt.wrapGenMetas", "Vuna/Compiler/Driver/Dt.vuna:746"));
  ("Driver_dIface.v_allOwnedPresent", ("Vuna.Compiler.Driver.Iface.allOwnedPresent", "Vuna/Compiler/Driver/Iface.vuna:817"));
  ("Driver_dIface.v_artifactNamesOf", ("Vuna.Compiler.Driver.Iface.artifactNamesOf", "Vuna/Compiler/Driver/Iface.vuna:730"));
  ("Driver_dIface.v_bucketOf", ("Vuna.Compiler.Driver.Iface.bucketOf", "Vuna/Compiler/Driver/Iface.vuna:558"));
  ("Driver_dIface.v_canonAlts", ("Vuna.Compiler.Driver.Iface.canonAlts", "Vuna/Compiler/Driver/Iface.vuna:328"));
  ("Driver_dIface.v_canonArgs", ("Vuna.Compiler.Driver.Iface.canonArgs", "Vuna/Compiler/Driver/Iface.vuna:320"));
  ("Driver_dIface.v_canonMaybe", ("Vuna.Compiler.Driver.Iface.canonMaybe", "Vuna/Compiler/Driver/Iface.vuna:339"));
  ("Driver_dIface.v_canonStateEmpty", ("Vuna.Compiler.Driver.Iface.canonStateEmpty", "Vuna/Compiler/Driver/Iface.vuna:272"));
  ("Driver_dIface.v_canonTerm", ("Vuna.Compiler.Driver.Iface.canonTerm", "Vuna/Compiler/Driver/Iface.vuna:275"));
  ("Driver_dIface.v_canonTermTop", ("Vuna.Compiler.Driver.Iface.canonTermTop", "Vuna/Compiler/Driver/Iface.vuna:336"));
  ("Driver_dIface.v_cleanIfaceOf", ("Vuna.Compiler.Driver.Iface.cleanIfaceOf", "Vuna/Compiler/Driver/Iface.vuna:618"));
  ("Driver_dIface.v_coverageIssueGo", ("Vuna.Compiler.Driver.Iface.coverageIssueGo", "Vuna/Compiler/Driver/Iface.vuna:720"));
  ("Driver_dIface.v_coverageIssueOf", ("Vuna.Compiler.Driver.Iface.coverageIssueOf", "Vuna/Compiler/Driver/Iface.vuna:709"));
  ("Driver_dIface.v_coverageResult", ("Vuna.Compiler.Driver.Iface.coverageResult", "Vuna/Compiler/Driver/Iface.vuna:770"));
  ("Driver_dIface.v_cpOfModule", ("Vuna.Compiler.Driver.Iface.cpOfModule", "Vuna/Compiler/Driver/Iface.vuna:582"));
  ("Driver_dIface.v_ctorFamilyPairs", ("Vuna.Compiler.Driver.Iface.ctorFamilyPairs", "Vuna/Compiler/Driver/Iface.vuna:497"));
  ("Driver_dIface.v_ctorNamesOf", ("Vuna.Compiler.Driver.Iface.ctorNamesOf", "Vuna/Compiler/Driver/Iface.vuna:740"));
  ("Driver_dIface.v_ctorOwnerOf", ("Vuna.Compiler.Driver.Iface.ctorOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:502"));
  ("Driver_dIface.v_dataNamesOf", ("Vuna.Compiler.Driver.Iface.dataNamesOf", "Vuna/Compiler/Driver/Iface.vuna:737"));
  ("Driver_dIface.v_dataOwnerOf", ("Vuna.Compiler.Driver.Iface.dataOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:490"));
  ("Driver_dIface.v_decDefLoc", ("Vuna.Compiler.Driver.Iface.decDefLoc", "Vuna/Compiler/Driver/Iface.vuna:880"));
  ("Driver_dIface.v_decDepPair", ("Vuna.Compiler.Driver.Iface.decDepPair", "Vuna/Compiler/Driver/Iface.vuna:870"));
  ("Driver_dIface.v_decModuleIfaceAt", ("Vuna.Compiler.Driver.Iface.decModuleIfaceAt", "Vuna/Compiler/Driver/Iface.vuna:900"));
  ("Driver_dIface.v_decModuleIfaceComplete", ("Vuna.Compiler.Driver.Iface.decModuleIfaceComplete", "Vuna/Compiler/Driver/Iface.vuna:924"));
  ("Driver_dIface.v_decModuleIfacePayload", ("Vuna.Compiler.Driver.Iface.decModuleIfacePayload", "Vuna/Compiler/Driver/Iface.vuna:903"));
  ("Driver_dIface.v_decSourceInfo", ("Vuna.Compiler.Driver.Iface.decSourceInfo", "Vuna/Compiler/Driver/Iface.vuna:861"));
  ("Driver_dIface.v_defLocOf", ("Vuna.Compiler.Driver.Iface.defLocOf", "Vuna/Compiler/Driver/Iface.vuna:161"));
  ("Driver_dIface.v_defLocsOfDefs", ("Vuna.Compiler.Driver.Iface.defLocsOfDefs", "Vuna/Compiler/Driver/Iface.vuna:170"));
  ("Driver_dIface.v_defOwnerOf", ("Vuna.Compiler.Driver.Iface.defOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:484"));
  ("Driver_dIface.v_defView", ("Vuna.Compiler.Driver.Iface.defView", "Vuna/Compiler/Driver/Iface.vuna:345"));
  ("Driver_dIface.v_depHashesOf", ("Vuna.Compiler.Driver.Iface.depHashesOf", "Vuna/Compiler/Driver/Iface.vuna:615"));
  ("Driver_dIface.v_depMissingHash", ("Vuna.Compiler.Driver.Iface.depMissingHash", "Vuna/Compiler/Driver/Iface.vuna:252"));
  ("Driver_dIface.v_digestParts", ("Vuna.Compiler.Driver.Iface.digestParts", "Vuna/Compiler/Driver/Iface.vuna:244"));
  ("Driver_dIface.v_encDefLoc", ("Vuna.Compiler.Driver.Iface.encDefLoc", "Vuna/Compiler/Driver/Iface.vuna:877"));
  ("Driver_dIface.v_encDefView", ("Vuna.Compiler.Driver.Iface.encDefView", "Vuna/Compiler/Driver/Iface.vuna:353"));
  ("Driver_dIface.v_encDepPair", ("Vuna.Compiler.Driver.Iface.encDepPair", "Vuna/Compiler/Driver/Iface.vuna:867"));
  ("Driver_dIface.v_encGlobal", ("Vuna.Compiler.Driver.Iface.encGlobal", "Vuna/Compiler/Driver/Iface.vuna:383"));
  ("Driver_dIface.v_encModuleIface", ("Vuna.Compiler.Driver.Iface.encModuleIface", "Vuna/Compiler/Driver/Iface.vuna:897"));
  ("Driver_dIface.v_encModuleIfaceAt", ("Vuna.Compiler.Driver.Iface.encModuleIfaceAt", "Vuna/Compiler/Driver/Iface.vuna:894"));
  ("Driver_dIface.v_encModuleIfacePayload", ("Vuna.Compiler.Driver.Iface.encModuleIfacePayload", "Vuna/Compiler/Driver/Iface.vuna:887"));
  ("Driver_dIface.v_encSourceInfo", ("Vuna.Compiler.Driver.Iface.encSourceInfo", "Vuna/Compiler/Driver/Iface.vuna:858"));
  ("Driver_dIface.v_exportKeyOf", ("Vuna.Compiler.Driver.Iface.exportKeyOf", "Vuna/Compiler/Driver/Iface.vuna:390"));
  ("Driver_dIface.v_findNamedModule", ("Vuna.Compiler.Driver.Iface.findNamedModule", "Vuna/Compiler/Driver/Iface.vuna:797"));
  ("Driver_dIface.v_finishIface", ("Vuna.Compiler.Driver.Iface.finishIface", "Vuna/Compiler/Driver/Iface.vuna:665"));
  ("Driver_dIface.v_firstCoverageIssue", ("Vuna.Compiler.Driver.Iface.firstCoverageIssue", "Vuna/Compiler/Driver/Iface.vuna:754"));
  ("Driver_dIface.v_flatParts", ("Vuna.Compiler.Driver.Iface.flatParts", "Vuna/Compiler/Driver/Iface.vuna:247"));
  ("Driver_dIface.v_globalOwnerOf", ("Vuna.Compiler.Driver.Iface.globalOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:515"));
  ("Driver_dIface.v_hasMissingDep", ("Vuna.Compiler.Driver.Iface.hasMissingDep", "Vuna/Compiler/Driver/Iface.vuna:605"));
  ("Driver_dIface.v_hashClasses", ("Vuna.Compiler.Driver.Iface.hashClasses", "Vuna/Compiler/Driver/Iface.vuna:378"));
  ("Driver_dIface.v_hashDatas", ("Vuna.Compiler.Driver.Iface.hashDatas", "Vuna/Compiler/Driver/Iface.vuna:372"));
  ("Driver_dIface.v_hashDecls", ("Vuna.Compiler.Driver.Iface.hashDecls", "Vuna/Compiler/Driver/Iface.vuna:411"));
  ("Driver_dIface.v_hashDeclsForIface", ("Vuna.Compiler.Driver.Iface.hashDeclsForIface", "Vuna/Compiler/Driver/Iface.vuna:421"));
  ("Driver_dIface.v_hashDefView", ("Vuna.Compiler.Driver.Iface.hashDefView", "Vuna/Compiler/Driver/Iface.vuna:356"));
  ("Driver_dIface.v_hashDefs", ("Vuna.Compiler.Driver.Iface.hashDefs", "Vuna/Compiler/Driver/Iface.vuna:363"));
  ("Driver_dIface.v_hashExports", ("Vuna.Compiler.Driver.Iface.hashExports", "Vuna/Compiler/Driver/Iface.vuna:393"));
  ("Driver_dIface.v_hashFixities", ("Vuna.Compiler.Driver.Iface.hashFixities", "Vuna/Compiler/Driver/Iface.vuna:397"));
  ("Driver_dIface.v_hashGlobals", ("Vuna.Compiler.Driver.Iface.hashGlobals", "Vuna/Compiler/Driver/Iface.vuna:386"));
  ("Driver_dIface.v_hashImports", ("Vuna.Compiler.Driver.Iface.hashImports", "Vuna/Compiler/Driver/Iface.vuna:405"));
  ("Driver_dIface.v_hashInsts", ("Vuna.Compiler.Driver.Iface.hashInsts", "Vuna/Compiler/Driver/Iface.vuna:375"));
  ("Driver_dIface.v_hashOfIface", ("Vuna.Compiler.Driver.Iface.hashOfIface", "Vuna/Compiler/Driver/Iface.vuna:431"));
  ("Driver_dIface.v_hashOfImportName", ("Vuna.Compiler.Driver.Iface.hashOfImportName", "Vuna/Compiler/Driver/Iface.vuna:609"));
  ("Driver_dIface.v_hashOfParts", ("Vuna.Compiler.Driver.Iface.hashOfParts", "Vuna/Compiler/Driver/Iface.vuna:424"));
  ("Driver_dIface.v_hashOpaque", ("Vuna.Compiler.Driver.Iface.hashOpaque", "Vuna/Compiler/Driver/Iface.vuna:368"));
  ("Driver_dIface.v_hashRecords", ("Vuna.Compiler.Driver.Iface.hashRecords", "Vuna/Compiler/Driver/Iface.vuna:401"));
  ("Driver_dIface.v_hashTextStrong", ("Vuna.Compiler.Driver.Iface.hashTextStrong", "Vuna/Compiler/Driver/Iface.vuna:227"));
  ("Driver_dIface.v_ifaceArtifactNames", ("Vuna.Compiler.Driver.Iface.ifaceArtifactNames", "Vuna/Compiler/Driver/Iface.vuna:751"));
  ("Driver_dIface.v_ifaceHashVersion", ("Vuna.Compiler.Driver.Iface.ifaceHashVersion", "Vuna/Compiler/Driver/Iface.vuna:217"));
  ("Driver_dIface.v_ifaceNamesOf", ("Vuna.Compiler.Driver.Iface.ifaceNamesOf", "Vuna/Compiler/Driver/Iface.vuna:743"));
  ("Driver_dIface.v_ifaceOfModule", ("Vuna.Compiler.Driver.Iface.ifaceOfModule", "Vuna/Compiler/Driver/Iface.vuna:827"));
  ("Driver_dIface.v_ifaceOfPackage", ("Vuna.Compiler.Driver.Iface.ifaceOfPackage", "Vuna/Compiler/Driver/Iface.vuna:776"));
  ("Driver_dIface.v_ifacePreludeNames", ("Vuna.Compiler.Driver.Iface.ifacePreludeNames", "Vuna/Compiler/Driver/Iface.vuna:510"));
  ("Driver_dIface.v_ifaceSchema", ("Vuna.Compiler.Driver.Iface.ifaceSchema", "Vuna/Compiler/Driver/Iface.vuna:212"));
  ("Driver_dIface.v_ifacesGo", ("Vuna.Compiler.Driver.Iface.ifacesGo", "Vuna/Compiler/Driver/Iface.vuna:687"));
  ("Driver_dIface.v_implHashOfParts", ("Vuna.Compiler.Driver.Iface.implHashOfParts", "Vuna/Compiler/Driver/Iface.vuna:459"));
  ("Driver_dIface.v_importNameOf", ("Vuna.Compiler.Driver.Iface.importNameOf", "Vuna/Compiler/Driver/Iface.vuna:597"));
  ("Driver_dIface.v_importNamesOfModule", ("Vuna.Compiler.Driver.Iface.importNamesOfModule", "Vuna/Compiler/Driver/Iface.vuna:600"));
  ("Driver_dIface.v_isSealName", ("Vuna.Compiler.Driver.Iface.isSealName", "Vuna/Compiler/Driver/Iface.vuna:727"));
  ("Driver_dIface.v_miCachedOf", ("Vuna.Compiler.Driver.Iface.miCachedOf", "Vuna/Compiler/Driver/Iface.vuna:119"));
  ("Driver_dIface.v_miDeclsOf", ("Vuna.Compiler.Driver.Iface.miDeclsOf", "Vuna/Compiler/Driver/Iface.vuna:146"));
  ("Driver_dIface.v_miDefLocsOf", ("Vuna.Compiler.Driver.Iface.miDefLocsOf", "Vuna/Compiler/Driver/Iface.vuna:158"));
  ("Driver_dIface.v_miDepHashesOf", ("Vuna.Compiler.Driver.Iface.miDepHashesOf", "Vuna/Compiler/Driver/Iface.vuna:128"));
  ("Driver_dIface.v_miExportsOf", ("Vuna.Compiler.Driver.Iface.miExportsOf", "Vuna/Compiler/Driver/Iface.vuna:140"));
  ("Driver_dIface.v_miFixitiesOf", ("Vuna.Compiler.Driver.Iface.miFixitiesOf", "Vuna/Compiler/Driver/Iface.vuna:143"));
  ("Driver_dIface.v_miIfaceHashOf", ("Vuna.Compiler.Driver.Iface.miIfaceHashOf", "Vuna/Compiler/Driver/Iface.vuna:122"));
  ("Driver_dIface.v_miImplHashOf", ("Vuna.Compiler.Driver.Iface.miImplHashOf", "Vuna/Compiler/Driver/Iface.vuna:125"));
  ("Driver_dIface.v_miImplicitImportsOf", ("Vuna.Compiler.Driver.Iface.miImplicitImportsOf", "Vuna/Compiler/Driver/Iface.vuna:137"));
  ("Driver_dIface.v_miImportsOf", ("Vuna.Compiler.Driver.Iface.miImportsOf", "Vuna/Compiler/Driver/Iface.vuna:134"));
  ("Driver_dIface.v_miNameOf", ("Vuna.Compiler.Driver.Iface.miNameOf", "Vuna/Compiler/Driver/Iface.vuna:113"));
  ("Driver_dIface.v_miPackageOf", ("Vuna.Compiler.Driver.Iface.miPackageOf", "Vuna/Compiler/Driver/Iface.vuna:116"));
  ("Driver_dIface.v_miPreparedOf", ("Vuna.Compiler.Driver.Iface.miPreparedOf", "Vuna/Compiler/Driver/Iface.vuna:153"));
  ("Driver_dIface.v_miRecordsOf", ("Vuna.Compiler.Driver.Iface.miRecordsOf", "Vuna/Compiler/Driver/Iface.vuna:150"));
  ("Driver_dIface.v_miSourceOf", ("Vuna.Compiler.Driver.Iface.miSourceOf", "Vuna/Compiler/Driver/Iface.vuna:131"));
  ("Driver_dIface.v_mkIfaceBase", ("Vuna.Compiler.Driver.Iface.mkIfaceBase", "Vuna/Compiler/Driver/Iface.vuna:627"));
  ("Driver_dIface.v_moduleCoverageOk", ("Vuna.Compiler.Driver.Iface.moduleCoverageOk", "Vuna/Compiler/Driver/Iface.vuna:811"));
  ("Driver_dIface.v_moduleNamesOf", ("Vuna.Compiler.Driver.Iface.moduleNamesOf", "Vuna/Compiler/Driver/Iface.vuna:853"));
  ("Driver_dIface.v_ownedByModule", ("Vuna.Compiler.Driver.Iface.ownedByModule", "Vuna/Compiler/Driver/Iface.vuna:808"));
  ("Driver_dIface.v_ownerIndexOf", ("Vuna.Compiler.Driver.Iface.ownerIndexOf", "Vuna/Compiler/Driver/Iface.vuna:527"));
  ("Driver_dIface.v_ownerOfAny", ("Vuna.Compiler.Driver.Iface.ownerOfAny", "Vuna/Compiler/Driver/Iface.vuna:700"));
  ("Driver_dIface.v_partOf", ("Vuna.Compiler.Driver.Iface.partOf", "Vuna/Compiler/Driver/Iface.vuna:240"));
  ("Driver_dIface.v_partitionByOwner", ("Vuna.Compiler.Driver.Iface.partitionByOwner", "Vuna/Compiler/Driver/Iface.vuna:548"));
  ("Driver_dIface.v_partitionByOwnerGo", ("Vuna.Compiler.Driver.Iface.partitionByOwnerGo", "Vuna/Compiler/Driver/Iface.vuna:551"));
  ("Driver_dIface.v_payloadDigest", ("Vuna.Compiler.Driver.Iface.payloadDigest", "Vuna/Compiler/Driver/Iface.vuna:236"));
  ("Driver_dIface.v_pkgIfaceHashOfModules", ("Vuna.Compiler.Driver.Iface.pkgIfaceHashOfModules", "Vuna/Compiler/Driver/Iface.vuna:446"));
  ("Driver_dIface.v_pkgImplHashOfModules", ("Vuna.Compiler.Driver.Iface.pkgImplHashOfModules", "Vuna/Compiler/Driver/Iface.vuna:450"));
  ("Driver_dIface.v_prefixOwner", ("Vuna.Compiler.Driver.Iface.prefixOwner", "Vuna/Compiler/Driver/Iface.vuna:478"));
  ("Driver_dIface.v_preparedForModule", ("Vuna.Compiler.Driver.Iface.preparedForModule", "Vuna/Compiler/Driver/Iface.vuna:176"));
  ("Driver_dIface.v_progPartsOf", ("Vuna.Compiler.Driver.Iface.progPartsOf", "Vuna/Compiler/Driver/Iface.vuna:570"));
  ("Driver_dIface.v_reverseBucket", ("Vuna.Compiler.Driver.Iface.reverseBucket", "Vuna/Compiler/Driver/Iface.vuna:567"));
  ("Driver_dIface.v_reverseBuckets", ("Vuna.Compiler.Driver.Iface.reverseBuckets", "Vuna/Compiler/Driver/Iface.vuna:564"));
  ("Driver_dIface.v_sameOwner", ("Vuna.Compiler.Driver.Iface.sameOwner", "Vuna/Compiler/Driver/Iface.vuna:804"));
  ("Driver_dIface.v_setPrepared", ("Vuna.Compiler.Driver.Iface.setPrepared", "Vuna/Compiler/Driver/Iface.vuna:192"));
  ("Driver_dIface.v_shaText", ("Vuna.Compiler.Driver.Iface.shaText", "Vuna/Compiler/Driver/Iface.vuna:231"));
  ("Driver_dIface.v_siHashOf", ("Vuna.Compiler.Driver.Iface.siHashOf", "Vuna/Compiler/Driver/Iface.vuna:104"));
  ("Driver_dIface.v_siMtimeOf", ("Vuna.Compiler.Driver.Iface.siMtimeOf", "Vuna/Compiler/Driver/Iface.vuna:107"));
  ("Driver_dIface.v_siPathOf", ("Vuna.Compiler.Driver.Iface.siPathOf", "Vuna/Compiler/Driver/Iface.vuna:101"));
  ("Driver_dIface.v_siSizeOf", ("Vuna.Compiler.Driver.Iface.siSizeOf", "Vuna/Compiler/Driver/Iface.vuna:110"));
  ("Driver_dIface.v_sortByText", ("Vuna.Compiler.Driver.Iface.sortByText", "Vuna/Compiler/Driver/Iface.vuna:262"));
  ("Driver_dIface.v_sortModuleIfaces", ("Vuna.Compiler.Driver.Iface.sortModuleIfaces", "Vuna/Compiler/Driver/Iface.vuna:455"));
  ("Driver_dIface.v_sortTextPairs", ("Vuna.Compiler.Driver.Iface.sortTextPairs", "Vuna/Compiler/Driver/Iface.vuna:259"));
  ("Driver_dIface.v_sourceOf", ("Vuna.Compiler.Driver.Iface.sourceOf", "Vuna/Compiler/Driver/Iface.vuna:593"));
  ("Driver_dIface.v_stripOpaqueDeclBodies", ("Vuna.Compiler.Driver.Iface.stripOpaqueDeclBodies", "Vuna/Compiler/Driver/Iface.vuna:416"));
  ("Driver_dIface.v_tblOwner", ("Vuna.Compiler.Driver.Iface.tblOwner", "Vuna/Compiler/Driver/Iface.vuna:475"));
  ("Driver_dNative.v_compileNative", ("Vuna.Compiler.Driver.Native.compileNative", "Vuna/Compiler/Driver/Native.vuna:53"));
  ("Driver_dNative.v_dropLast", ("Vuna.Compiler.Driver.Native.dropLast", "Vuna/Compiler/Driver/Native.vuna:32"));
  ("Driver_dNative.v_nativeErrDiag", ("Vuna.Compiler.Driver.Native.nativeErrDiag", "Vuna/Compiler/Driver/Native.vuna:29"));
  ("Driver_dNative.v_parentDirOf", ("Vuna.Compiler.Driver.Native.parentDirOf", "Vuna/Compiler/Driver/Native.vuna:37"));
  ("Driver_dNative.v_writeFiles", ("Vuna.Compiler.Driver.Native.writeFiles", "Vuna/Compiler/Driver/Native.vuna:45"));
  ("Driver_dOwner.v_entryOwner", ("Vuna.Compiler.Driver.Owner.entryOwner", "Vuna/Compiler/Driver/Owner.vuna:29"));
  ("Driver_dOwner.v_hasFieldOwnerOf", ("Vuna.Compiler.Driver.Owner.hasFieldOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:87"));
  ("Driver_dOwner.v_hasFieldRecordTypeExpr", ("Vuna.Compiler.Driver.Owner.hasFieldRecordTypeExpr", "Vuna/Compiler/Driver/Owner.vuna:82"));
  ("Driver_dOwner.v_headClassName", ("Vuna.Compiler.Driver.Owner.headClassName", "Vuna/Compiler/Driver/Owner.vuna:59"));
  ("Driver_dOwner.v_isSyntheticInternalName", ("Vuna.Compiler.Driver.Owner.isSyntheticInternalName", "Vuna/Compiler/Driver/Owner.vuna:201"));
  ("Driver_dOwner.v_knownModuleOrErr", ("Vuna.Compiler.Driver.Owner.knownModuleOrErr", "Vuna/Compiler/Driver/Owner.vuna:179"));
  ("Driver_dOwner.v_lookupModuleOf", ("Vuna.Compiler.Driver.Owner.lookupModuleOf", "Vuna/Compiler/Driver/Owner.vuna:176"));
  ("Driver_dOwner.v_modulePrefixOfName", ("Vuna.Compiler.Driver.Owner.modulePrefixOfName", "Vuna/Compiler/Driver/Owner.vuna:33"));
  ("Driver_dOwner.v_nameOwnerPairsOfDatas", ("Vuna.Compiler.Driver.Owner.nameOwnerPairsOfDatas", "Vuna/Compiler/Driver/Owner.vuna:223"));
  ("Driver_dOwner.v_nameOwnerPairsOfDefs", ("Vuna.Compiler.Driver.Owner.nameOwnerPairsOfDefs", "Vuna/Compiler/Driver/Owner.vuna:216"));
  ("Driver_dOwner.v_splitDataNames", ("Vuna.Compiler.Driver.Owner.splitDataNames", "Vuna/Compiler/Driver/Owner.vuna:51"));
  ("Driver_dOwner.v_splitDataOwnerEntriesOf", ("Vuna.Compiler.Driver.Owner.splitDataOwnerEntriesOf", "Vuna/Compiler/Driver/Owner.vuna:133"));
  ("Driver_dOwner.v_splitDataOwnerEntriesOfModules", ("Vuna.Compiler.Driver.Owner.splitDataOwnerEntriesOfModules", "Vuna/Compiler/Driver/Owner.vuna:144"));
  ("Driver_dOwner.v_splitDataOwnerOf", ("Vuna.Compiler.Driver.Owner.splitDataOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:188"));
  ("Driver_dOwner.v_splitDeclNames", ("Vuna.Compiler.Driver.Owner.splitDeclNames", "Vuna/Compiler/Driver/Owner.vuna:39"));
  ("Driver_dOwner.v_splitDefOwnerOf", ("Vuna.Compiler.Driver.Owner.splitDefOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:204"));
  ("Driver_dOwner.v_splitDerivedOwners", ("Vuna.Compiler.Driver.Owner.splitDerivedOwners", "Vuna/Compiler/Driver/Owner.vuna:105"));
  ("Driver_dOwner.v_splitHasFieldOwners", ("Vuna.Compiler.Driver.Owner.splitHasFieldOwners", "Vuna/Compiler/Driver/Owner.vuna:100"));
  ("Driver_dOwner.v_splitInstanceOwnerOf", ("Vuna.Compiler.Driver.Owner.splitInstanceOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:69"));
  ("Driver_dOwner.v_splitInstanceOwnersGo", ("Vuna.Compiler.Driver.Owner.splitInstanceOwnersGo", "Vuna/Compiler/Driver/Owner.vuna:122"));
  ("Driver_dOwner.v_splitMetaOf", ("Vuna.Compiler.Driver.Owner.splitMetaOf", "Vuna/Compiler/Driver/Owner.vuna:159"));
  ("Driver_dOwner.v_splitNoSpan", ("Vuna.Compiler.Driver.Owner.splitNoSpan", "Vuna/Compiler/Driver/Owner.vuna:25"));
  ("Driver_dOwner.v_splitOwnerEntriesOf", ("Vuna.Compiler.Driver.Owner.splitOwnerEntriesOf", "Vuna/Compiler/Driver/Owner.vuna:127"));
  ("Driver_dOwner.v_splitOwnerEntriesOfModules", ("Vuna.Compiler.Driver.Owner.splitOwnerEntriesOfModules", "Vuna/Compiler/Driver/Owner.vuna:139"));
  ("Driver_dOwner.v_splitTraitDataOwnerOf", ("Vuna.Compiler.Driver.Owner.splitTraitDataOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:118"));
  ("Driver_dOwner.v_splitTraitDefOwnerOf", ("Vuna.Compiler.Driver.Owner.splitTraitDefOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:113"));
  ("Driver_dPerfCache.v_bucketGcGo", ("Vuna.Compiler.Driver.PerfCache.bucketGcGo", "Vuna/Compiler/Driver/PerfCache.vuna:141"));
  ("Driver_dPerfCache.v_charSafe", ("Vuna.Compiler.Driver.PerfCache.charSafe", "Vuna/Compiler/Driver/PerfCache.vuna:70"));
  ("Driver_dPerfCache.v_dropDirFiles", ("Vuna.Compiler.Driver.PerfCache.dropDirFiles", "Vuna/Compiler/Driver/PerfCache.vuna:116"));
  ("Driver_dPerfCache.v_dropFiles", ("Vuna.Compiler.Driver.PerfCache.dropFiles", "Vuna/Compiler/Driver/PerfCache.vuna:122"));
  ("Driver_dPerfCache.v_gcEntries", ("Vuna.Compiler.Driver.PerfCache.gcEntries", "Vuna/Compiler/Driver/PerfCache.vuna:97"));
  ("Driver_dPerfCache.v_hashTextOf", ("Vuna.Compiler.Driver.PerfCache.hashTextOf", "Vuna/Compiler/Driver/PerfCache.vuna:52"));
  ("Driver_dPerfCache.v_safeRemoveFile", ("Vuna.Compiler.Driver.PerfCache.safeRemoveFile", "Vuna/Compiler/Driver/PerfCache.vuna:87"));
  ("Driver_dPerfCache.v_unitCacheBucketGc", ("Vuna.Compiler.Driver.PerfCache.unitCacheBucketGc", "Vuna/Compiler/Driver/PerfCache.vuna:134"));
  ("Driver_dPerfCache.v_unitCacheCodec", ("Vuna.Compiler.Driver.PerfCache.unitCacheCodec", "Vuna/Compiler/Driver/PerfCache.vuna:35"));
  ("Driver_dPerfCache.v_unitCacheDir", ("Vuna.Compiler.Driver.PerfCache.unitCacheDir", "Vuna/Compiler/Driver/PerfCache.vuna:46"));
  ("Driver_dPerfCache.v_unitCacheEntryDir", ("Vuna.Compiler.Driver.PerfCache.unitCacheEntryDir", "Vuna/Compiler/Driver/PerfCache.vuna:76"));
  ("Driver_dPerfCache.v_unitCacheEntryKeyOf", ("Vuna.Compiler.Driver.PerfCache.unitCacheEntryKeyOf", "Vuna/Compiler/Driver/PerfCache.vuna:80"));
  ("Driver_dPerfCache.v_unitCacheFileName", ("Vuna.Compiler.Driver.PerfCache.unitCacheFileName", "Vuna/Compiler/Driver/PerfCache.vuna:59"));
  ("Driver_dPerfCache.v_unitCacheGc", ("Vuna.Compiler.Driver.PerfCache.unitCacheGc", "Vuna/Compiler/Driver/PerfCache.vuna:90"));
  ("Driver_dPerfCache.v_unitCachePath", ("Vuna.Compiler.Driver.PerfCache.unitCachePath", "Vuna/Compiler/Driver/PerfCache.vuna:55"));
  ("Driver_dPerfCache.v_unitCacheRead", ("Vuna.Compiler.Driver.PerfCache.unitCacheRead", "Vuna/Compiler/Driver/PerfCache.vuna:159"));
  ("Driver_dPerfCache.v_unitCacheSchema", ("Vuna.Compiler.Driver.PerfCache.unitCacheSchema", "Vuna/Compiler/Driver/PerfCache.vuna:31"));
  ("Driver_dPerfCache.v_unitCacheTag", ("Vuna.Compiler.Driver.PerfCache.unitCacheTag", "Vuna/Compiler/Driver/PerfCache.vuna:38"));
  ("Driver_dPerfCache.v_unitCacheWrite", ("Vuna.Compiler.Driver.PerfCache.unitCacheWrite", "Vuna/Compiler/Driver/PerfCache.vuna:170"));
  ("Driver_dPerfCache.v_unitNameSafe", ("Vuna.Compiler.Driver.PerfCache.unitNameSafe", "Vuna/Compiler/Driver/PerfCache.vuna:67"));
  ("Driver_dSplit.v_buildScript", ("Vuna.Compiler.Driver.Split.buildScript", "Vuna/Compiler/Driver/Split.vuna:141"));
  ("Driver_dSplit.v_canonicalTopo", ("Vuna.Compiler.Driver.Split.canonicalTopo", "Vuna/Compiler/Driver/Split.vuna:366"));
  ("Driver_dSplit.v_convergedWithin", ("Vuna.Compiler.Driver.Split.convergedWithin", "Vuna/Compiler/Driver/Split.vuna:271"));
  ("Driver_dSplit.v_decSplitFile", ("Vuna.Compiler.Driver.Split.decSplitFile", "Vuna/Compiler/Driver/Split.vuna:401"));
  ("Driver_dSplit.v_decSplitFileComplete", ("Vuna.Compiler.Driver.Split.decSplitFileComplete", "Vuna/Compiler/Driver/Split.vuna:421"));
  ("Driver_dSplit.v_decSplitFilesComplete", ("Vuna.Compiler.Driver.Split.decSplitFilesComplete", "Vuna/Compiler/Driver/Split.vuna:414"));
  ("Driver_dSplit.v_depsSuffix", ("Vuna.Compiler.Driver.Split.depsSuffix", "Vuna/Compiler/Driver/Split.vuna:258"));
  ("Driver_dSplit.v_depthEntryLess", ("Vuna.Compiler.Driver.Split.depthEntryLess", "Vuna/Compiler/Driver/Split.vuna:348"));
  ("Driver_dSplit.v_depthOfDeps", ("Vuna.Compiler.Driver.Split.depthOfDeps", "Vuna/Compiler/Driver/Split.vuna:114"));
  ("Driver_dSplit.v_depthOfUnit", ("Vuna.Compiler.Driver.Split.depthOfUnit", "Vuna/Compiler/Driver/Split.vuna:118"));
  ("Driver_dSplit.v_encSplitFile", ("Vuna.Compiler.Driver.Split.encSplitFile", "Vuna/Compiler/Driver/Split.vuna:398"));
  ("Driver_dSplit.v_encSplitFiles", ("Vuna.Compiler.Driver.Split.encSplitFiles", "Vuna/Compiler/Driver/Split.vuna:410"));
  ("Driver_dSplit.v_filesOfDepthEntries", ("Vuna.Compiler.Driver.Split.filesOfDepthEntries", "Vuna/Compiler/Driver/Split.vuna:359"));
  ("Driver_dSplit.v_fixDepths", ("Vuna.Compiler.Driver.Split.fixDepths", "Vuna/Compiler/Driver/Split.vuna:338"));
  ("Driver_dSplit.v_graphMaxDepth", ("Vuna.Compiler.Driver.Split.graphMaxDepth", "Vuna/Compiler/Driver/Split.vuna:124"));
  ("Driver_dSplit.v_markNames", ("Vuna.Compiler.Driver.Split.markNames", "Vuna/Compiler/Driver/Split.vuna:300"));
  ("Driver_dSplit.v_maxDepth", ("Vuna.Compiler.Driver.Split.maxDepth", "Vuna/Compiler/Driver/Split.vuna:317"));
  ("Driver_dSplit.v_maxInt", ("Vuna.Compiler.Driver.Split.maxInt", "Vuna/Compiler/Driver/Split.vuna:129"));
  ("Driver_dSplit.v_nameSetOf", ("Vuna.Compiler.Driver.Split.nameSetOf", "Vuna/Compiler/Driver/Split.vuna:295"));
  ("Driver_dSplit.v_normalizeFileDeps", ("Vuna.Compiler.Driver.Split.normalizeFileDeps", "Vuna/Compiler/Driver/Split.vuna:387"));
  ("Driver_dSplit.v_sameDepthTable", ("Vuna.Compiler.Driver.Split.sameDepthTable", "Vuna/Compiler/Driver/Split.vuna:333"));
  ("Driver_dSplit.v_sortDepEntries", ("Vuna.Compiler.Driver.Split.sortDepEntries", "Vuna/Compiler/Driver/Split.vuna:384"));
  ("Driver_dSplit.v_sortDepsByTie", ("Vuna.Compiler.Driver.Split.sortDepsByTie", "Vuna/Compiler/Driver/Split.vuna:381"));
  ("Driver_dSplit.v_sortDepthEntries", ("Vuna.Compiler.Driver.Split.sortDepthEntries", "Vuna/Compiler/Driver/Split.vuna:355"));
  ("Driver_dSplit.v_spaceJoin", ("Vuna.Compiler.Driver.Split.spaceJoin", "Vuna/Compiler/Driver/Split.vuna:254"));
  ("Driver_dSplit.v_splitDeps", ("Vuna.Compiler.Driver.Split.splitDeps", "Vuna/Compiler/Driver/Split.vuna:37"));
  ("Driver_dSplit.v_splitDepths", ("Vuna.Compiler.Driver.Split.splitDepths", "Vuna/Compiler/Driver/Split.vuna:108"));
  ("Driver_dSplit.v_splitGraph", ("Vuna.Compiler.Driver.Split.splitGraph", "Vuna/Compiler/Driver/Split.vuna:83"));
  ("Driver_dSplit.v_splitGraphAcyclic", ("Vuna.Compiler.Driver.Split.splitGraphAcyclic", "Vuna/Compiler/Driver/Split.vuna:264"));
  ("Driver_dSplit.v_splitLayers", ("Vuna.Compiler.Driver.Split.splitLayers", "Vuna/Compiler/Driver/Split.vuna:99"));
  ("Driver_dSplit.v_splitName", ("Vuna.Compiler.Driver.Split.splitName", "Vuna/Compiler/Driver/Split.vuna:30"));
  ("Driver_dSplit.v_splitText", ("Vuna.Compiler.Driver.Split.splitText", "Vuna/Compiler/Driver/Split.vuna:33"));
  ("Driver_dSplit.v_stepDepths", ("Vuna.Compiler.Driver.Split.stepDepths", "Vuna/Compiler/Driver/Split.vuna:325"));
  ("Driver_dSplit.v_stripMl", ("Vuna.Compiler.Driver.Split.stripMl", "Vuna/Compiler/Driver/Split.vuna:93"));
  ("Driver_dSplit.v_tableRest", ("Vuna.Compiler.Driver.Split.tableRest", "Vuna/Compiler/Driver/Split.vuna:250"));
  ("Driver_dSplit.v_tableRows", ("Vuna.Compiler.Driver.Split.tableRows", "Vuna/Compiler/Driver/Split.vuna:246"));
  ("Driver_dSplit.v_tieOf", ("Vuna.Compiler.Driver.Split.tieOf", "Vuna/Compiler/Driver/Split.vuna:309"));
  ("Driver_dSplit.v_tieTableOf", ("Vuna.Compiler.Driver.Split.tieTableOf", "Vuna/Compiler/Driver/Split.vuna:304"));
  ("Driver_dSplit.v_unitTableText", ("Vuna.Compiler.Driver.Split.unitTableText", "Vuna/Compiler/Driver/Split.vuna:242"));
  ("Driver_dSplit.v_unitTieKey", ("Vuna.Compiler.Driver.Split.unitTieKey", "Vuna/Compiler/Driver/Split.vuna:291"));
  ("Driver_dSplit.v_writeSplitFiles", ("Vuna.Compiler.Driver.Split.writeSplitFiles", "Vuna/Compiler/Driver/Split.vuna:41"));
  ("Driver_dSplit.v_writeSplitFilesIfChanged", ("Vuna.Compiler.Driver.Split.writeSplitFilesIfChanged", "Vuna/Compiler/Driver/Split.vuna:54"));
  ("Driver_dSplitGen.v_basePkgPrefix", ("Vuna.Compiler.Driver.SplitGen.basePkgPrefix", "Vuna/Compiler/Driver/SplitGen.vuna:43"));
  ("Driver_dSplitGen.v_cachedUnitOk", ("Vuna.Compiler.Driver.SplitGen.cachedUnitOk", "Vuna/Compiler/Driver/SplitGen.vuna:127"));
  ("Driver_dSplitGen.v_checkDataOwners", ("Vuna.Compiler.Driver.SplitGen.checkDataOwners", "Vuna/Compiler/Driver/SplitGen.vuna:260"));
  ("Driver_dSplitGen.v_checkDefOwners", ("Vuna.Compiler.Driver.SplitGen.checkDefOwners", "Vuna/Compiler/Driver/SplitGen.vuna:253"));
  ("Driver_dSplitGen.v_checkDepsKnown", ("Vuna.Compiler.Driver.SplitGen.checkDepsKnown", "Vuna/Compiler/Driver/SplitGen.vuna:101"));
  ("Driver_dSplitGen.v_checkEntryDeclName", ("Vuna.Compiler.Driver.SplitGen.checkEntryDeclName", "Vuna/Compiler/Driver/SplitGen.vuna:229"));
  ("Driver_dSplitGen.v_checkEntryDecls", ("Vuna.Compiler.Driver.SplitGen.checkEntryDecls", "Vuna/Compiler/Driver/SplitGen.vuna:248"));
  ("Driver_dSplitGen.v_checkEntryDeclsGo", ("Vuna.Compiler.Driver.SplitGen.checkEntryDeclsGo", "Vuna/Compiler/Driver/SplitGen.vuna:241"));
  ("Driver_dSplitGen.v_checkModuleDeclName", ("Vuna.Compiler.Driver.SplitGen.checkModuleDeclName", "Vuna/Compiler/Driver/SplitGen.vuna:182"));
  ("Driver_dSplitGen.v_checkModuleDeclNames", ("Vuna.Compiler.Driver.SplitGen.checkModuleDeclNames", "Vuna/Compiler/Driver/SplitGen.vuna:194"));
  ("Driver_dSplitGen.v_checkModuleDecls", ("Vuna.Compiler.Driver.SplitGen.checkModuleDecls", "Vuna/Compiler/Driver/SplitGen.vuna:201"));
  ("Driver_dSplitGen.v_checkResolvedModules", ("Vuna.Compiler.Driver.SplitGen.checkResolvedModules", "Vuna/Compiler/Driver/SplitGen.vuna:265"));
  ("Driver_dSplitGen.v_checkSplitAcyclic", ("Vuna.Compiler.Driver.SplitGen.checkSplitAcyclic", "Vuna/Compiler/Driver/SplitGen.vuna:155"));
  ("Driver_dSplitGen.v_checkSplitNames", ("Vuna.Compiler.Driver.SplitGen.checkSplitNames", "Vuna/Compiler/Driver/SplitGen.vuna:145"));
  ("Driver_dSplitGen.v_compilerPkgPrefix", ("Vuna.Compiler.Driver.SplitGen.compilerPkgPrefix", "Vuna/Compiler/Driver/SplitGen.vuna:40"));
  ("Driver_dSplitGen.v_datasInUnit", ("Vuna.Compiler.Driver.SplitGen.datasInUnit", "Vuna/Compiler/Driver/SplitGen.vuna:82"));
  ("Driver_dSplitGen.v_defsInUnit", ("Vuna.Compiler.Driver.SplitGen.defsInUnit", "Vuna/Compiler/Driver/SplitGen.vuna:85"));
  ("Driver_dSplitGen.v_depsInOrder", ("Vuna.Compiler.Driver.SplitGen.depsInOrder", "Vuna/Compiler/Driver/SplitGen.vuna:112"));
  ("Driver_dSplitGen.v_depsKnown", ("Vuna.Compiler.Driver.SplitGen.depsKnown", "Vuna/Compiler/Driver/SplitGen.vuna:130"));
  ("Driver_dSplitGen.v_entryDeclIdentities", ("Vuna.Compiler.Driver.SplitGen.entryDeclIdentities", "Vuna/Compiler/Driver/SplitGen.vuna:212"));
  ("Driver_dSplitGen.v_entryDeclKey", ("Vuna.Compiler.Driver.SplitGen.entryDeclKey", "Vuna/Compiler/Driver/SplitGen.vuna:225"));
  ("Driver_dSplitGen.v_generateDtSplitProgram", ("Vuna.Compiler.Driver.SplitGen.generateDtSplitProgram", "Vuna/Compiler/Driver/SplitGen.vuna:309"));
  ("Driver_dSplitGen.v_generateDtSplitProgramWith", ("Vuna.Compiler.Driver.SplitGen.generateDtSplitProgramWith", "Vuna/Compiler/Driver/SplitGen.vuna:324"));
  ("Driver_dSplitGen.v_keepCached", ("Vuna.Compiler.Driver.SplitGen.keepCached", "Vuna/Compiler/Driver/SplitGen.vuna:135"));
  ("Driver_dSplitGen.v_knownUnit", ("Vuna.Compiler.Driver.SplitGen.knownUnit", "Vuna/Compiler/Driver/SplitGen.vuna:98"));
  ("Driver_dSplitGen.v_mainInitPrologue", ("Vuna.Compiler.Driver.SplitGen.mainInitPrologue", "Vuna/Compiler/Driver/SplitGen.vuna:65"));
  ("Driver_dSplitGen.v_mapToUnit", ("Vuna.Compiler.Driver.SplitGen.mapToUnit", "Vuna/Compiler/Driver/SplitGen.vuna:176"));
  ("Driver_dSplitGen.v_noUnitLookup", ("Vuna.Compiler.Driver.SplitGen.noUnitLookup", "Vuna/Compiler/Driver/SplitGen.vuna:301"));
  ("Driver_dSplitGen.v_noUnitStore", ("Vuna.Compiler.Driver.SplitGen.noUnitStore", "Vuna/Compiler/Driver/SplitGen.vuna:304"));
  ("Driver_dSplitGen.v_ownerOfTbl", ("Vuna.Compiler.Driver.SplitGen.ownerOfTbl", "Vuna/Compiler/Driver/SplitGen.vuna:76"));
  ("Driver_dSplitGen.v_ownerTblOf", ("Vuna.Compiler.Driver.SplitGen.ownerTblOf", "Vuna/Compiler/Driver/SplitGen.vuna:73"));
  ("Driver_dSplitGen.v_splitLocPath", ("Vuna.Compiler.Driver.SplitGen.splitLocPath", "Vuna/Compiler/Driver/SplitGen.vuna:295"));
  ("Driver_dSplitGen.v_splitMainFileWith", ("Vuna.Compiler.Driver.SplitGen.splitMainFileWith", "Vuna/Compiler/Driver/SplitGen.vuna:486"));
  ("Driver_dSplitGen.v_splitModuleFilesWith", ("Vuna.Compiler.Driver.SplitGen.splitModuleFilesWith", "Vuna/Compiler/Driver/SplitGen.vuna:441"));
  ("Driver_dSplitGen.v_splitProgramCheckedWith", ("Vuna.Compiler.Driver.SplitGen.splitProgramCheckedWith", "Vuna/Compiler/Driver/SplitGen.vuna:375"));
  ("Driver_dSplitGen.v_splitProgramFilesWith", ("Vuna.Compiler.Driver.SplitGen.splitProgramFilesWith", "Vuna/Compiler/Driver/SplitGen.vuna:357"));
  ("Driver_dSplitGen.v_splitStripDotSlash", ("Vuna.Compiler.Driver.SplitGen.splitStripDotSlash", "Vuna/Compiler/Driver/SplitGen.vuna:291"));
  ("Driver_dSplitGen.v_splitStripPrefix", ("Vuna.Compiler.Driver.SplitGen.splitStripPrefix", "Vuna/Compiler/Driver/SplitGen.vuna:277"));
  ("Driver_dSplitGen.v_splitStripRoots", ("Vuna.Compiler.Driver.SplitGen.splitStripRoots", "Vuna/Compiler/Driver/SplitGen.vuna:286"));
  ("Driver_dSplitGen.v_splitUnitOfModule", ("Vuna.Compiler.Driver.SplitGen.splitUnitOfModule", "Vuna/Compiler/Driver/SplitGen.vuna:37"));
  ("Driver_dSplitGen.v_splitWithOwnersWith", ("Vuna.Compiler.Driver.SplitGen.splitWithOwnersWith", "Vuna/Compiler/Driver/SplitGen.vuna:399"));
  ("Driver_dSplitGen.v_uniqueSplitNames", ("Vuna.Compiler.Driver.SplitGen.uniqueSplitNames", "Vuna/Compiler/Driver/SplitGen.vuna:140"));
  ("Driver_dSplitGen.v_unitDepsOf", ("Vuna.Compiler.Driver.SplitGen.unitDepsOf", "Vuna/Compiler/Driver/SplitGen.vuna:115"));
  ("Driver_dSplitGen.v_unitOfLocName", ("Vuna.Compiler.Driver.SplitGen.unitOfLocName", "Vuna/Compiler/Driver/SplitGen.vuna:57"));
  ("Driver_dSplitGen.v_unitPathOf", ("Vuna.Compiler.Driver.SplitGen.unitPathOf", "Vuna/Compiler/Driver/SplitGen.vuna:46"));
  ("Driver_dToolPayload.v_decToolContextComplete", ("Vuna.Compiler.Driver.ToolPayload.decToolContextComplete", "Vuna/Compiler/Driver/ToolPayload.vuna:48"));
  ("Driver_dToolPayload.v_decToolContextPayload", ("Vuna.Compiler.Driver.ToolPayload.decToolContextPayload", "Vuna/Compiler/Driver/ToolPayload.vuna:54"));
  ("Driver_dToolPayload.v_encToolContext", ("Vuna.Compiler.Driver.ToolPayload.encToolContext", "Vuna/Compiler/Driver/ToolPayload.vuna:44"));
  ("Driver_dToolPayload.v_encToolContextPayload", ("Vuna.Compiler.Driver.ToolPayload.encToolContextPayload", "Vuna/Compiler/Driver/ToolPayload.vuna:34"));
  ("Driver_dToolPayload.v_toolContextCodec", ("Vuna.Compiler.Driver.ToolPayload.toolContextCodec", "Vuna/Compiler/Driver/ToolPayload.vuna:31"));
  ("Driver_dToolPayload.v_toolContextSchema", ("Vuna.Compiler.Driver.ToolPayload.toolContextSchema", "Vuna/Compiler/Driver/ToolPayload.vuna:27"));
  ("Driver_dWasm.v_capWarnings", ("Vuna.Compiler.Driver.Wasm.capWarnings", "Vuna/Compiler/Driver/Wasm.vuna:39"));
  ("Driver_dWasm.v_compileWasm", ("Vuna.Compiler.Driver.Wasm.compileWasm", "Vuna/Compiler/Driver/Wasm.vuna:51"));
  ("Driver_dWasm.v_entryCapabilityWarnings", ("Vuna.Compiler.Driver.Wasm.entryCapabilityWarnings", "Vuna/Compiler/Driver/Wasm.vuna:33"));
  ("Driver_dWasm.v_isUnavailable", ("Vuna.Compiler.Driver.Wasm.isUnavailable", "Vuna/Compiler/Driver/Wasm.vuna:47"));
  ("Driver_dWasm.v_wasmErrDiag", ("Vuna.Compiler.Driver.Wasm.wasmErrDiag", "Vuna/Compiler/Driver/Wasm.vuna:28"));
  ("Elab_dCanonical.v_decBinder", ("Vuna.Compiler.Elab.Canonical.decBinder", "Vuna/Compiler/Elab/Canonical.vuna:169"));
  ("Elab_dCanonical.v_decDtClass", ("Vuna.Compiler.Elab.Canonical.decDtClass", "Vuna/Compiler/Elab/Canonical.vuna:248"));
  ("Elab_dCanonical.v_decDtCtor", ("Vuna.Compiler.Elab.Canonical.decDtCtor", "Vuna/Compiler/Elab/Canonical.vuna:201"));
  ("Elab_dCanonical.v_decDtData", ("Vuna.Compiler.Elab.Canonical.decDtData", "Vuna/Compiler/Elab/Canonical.vuna:215"));
  ("Elab_dCanonical.v_decDtDef", ("Vuna.Compiler.Elab.Canonical.decDtDef", "Vuna/Compiler/Elab/Canonical.vuna:222"));
  ("Elab_dCanonical.v_decDtDefs", ("Vuna.Compiler.Elab.Canonical.decDtDefs", "Vuna/Compiler/Elab/Canonical.vuna:237"));
  ("Elab_dCanonical.v_decDtDefsComplete", ("Vuna.Compiler.Elab.Canonical.decDtDefsComplete", "Vuna/Compiler/Elab/Canonical.vuna:306"));
  ("Elab_dCanonical.v_decDtFieldMeta", ("Vuna.Compiler.Elab.Canonical.decDtFieldMeta", "Vuna/Compiler/Elab/Canonical.vuna:208"));
  ("Elab_dCanonical.v_decDtInst", ("Vuna.Compiler.Elab.Canonical.decDtInst", "Vuna/Compiler/Elab/Canonical.vuna:241"));
  ("Elab_dCanonical.v_decExportEntries", ("Vuna.Compiler.Elab.Canonical.decExportEntries", "Vuna/Compiler/Elab/Canonical.vuna:262"));
  ("Elab_dCanonical.v_decExportEntry", ("Vuna.Compiler.Elab.Canonical.decExportEntry", "Vuna/Compiler/Elab/Canonical.vuna:255"));
  ("Elab_dCanonical.v_decFixities", ("Vuna.Compiler.Elab.Canonical.decFixities", "Vuna/Compiler/Elab/Canonical.vuna:273"));
  ("Elab_dCanonical.v_decFixity", ("Vuna.Compiler.Elab.Canonical.decFixity", "Vuna/Compiler/Elab/Canonical.vuna:266"));
  ("Elab_dCanonical.v_decImport", ("Vuna.Compiler.Elab.Canonical.decImport", "Vuna/Compiler/Elab/Canonical.vuna:277"));
  ("Elab_dCanonical.v_decImports", ("Vuna.Compiler.Elab.Canonical.decImports", "Vuna/Compiler/Elab/Canonical.vuna:284"));
  ("Elab_dCanonical.v_decRecordFieldMeta", ("Vuna.Compiler.Elab.Canonical.decRecordFieldMeta", "Vuna/Compiler/Elab/Canonical.vuna:288"));
  ("Elab_dCanonical.v_decRecordMeta", ("Vuna.Compiler.Elab.Canonical.decRecordMeta", "Vuna/Compiler/Elab/Canonical.vuna:295"));
  ("Elab_dCanonical.v_decRecordMetas", ("Vuna.Compiler.Elab.Canonical.decRecordMetas", "Vuna/Compiler/Elab/Canonical.vuna:302"));
  ("Elab_dCanonical.v_decReprTier", ("Vuna.Compiler.Elab.Canonical.decReprTier", "Vuna/Compiler/Elab/Canonical.vuna:186"));
  ("Elab_dCanonical.v_decSpan", ("Vuna.Compiler.Elab.Canonical.decSpan", "Vuna/Compiler/Elab/Canonical.vuna:70"));
  ("Elab_dCanonical.v_decTelePair", ("Vuna.Compiler.Elab.Canonical.decTelePair", "Vuna/Compiler/Elab/Canonical.vuna:179"));
  ("Elab_dCanonical.v_encBinder", ("Vuna.Compiler.Elab.Canonical.encBinder", "Vuna/Compiler/Elab/Canonical.vuna:108"));
  ("Elab_dCanonical.v_encDtClass", ("Vuna.Compiler.Elab.Canonical.encDtClass", "Vuna/Compiler/Elab/Canonical.vuna:97"));
  ("Elab_dCanonical.v_encDtClassSem", ("Vuna.Compiler.Elab.Canonical.encDtClassSem", "Vuna/Compiler/Elab/Canonical.vuna:90"));
  ("Elab_dCanonical.v_encDtCtor", ("Vuna.Compiler.Elab.Canonical.encDtCtor", "Vuna/Compiler/Elab/Canonical.vuna:38"));
  ("Elab_dCanonical.v_encDtData", ("Vuna.Compiler.Elab.Canonical.encDtData", "Vuna/Compiler/Elab/Canonical.vuna:47"));
  ("Elab_dCanonical.v_encDtDef", ("Vuna.Compiler.Elab.Canonical.encDtDef", "Vuna/Compiler/Elab/Canonical.vuna:54"));
  ("Elab_dCanonical.v_encDtDefs", ("Vuna.Compiler.Elab.Canonical.encDtDefs", "Vuna/Compiler/Elab/Canonical.vuna:60"));
  ("Elab_dCanonical.v_encDtFieldMeta", ("Vuna.Compiler.Elab.Canonical.encDtFieldMeta", "Vuna/Compiler/Elab/Canonical.vuna:43"));
  ("Elab_dCanonical.v_encDtInst", ("Vuna.Compiler.Elab.Canonical.encDtInst", "Vuna/Compiler/Elab/Canonical.vuna:85"));
  ("Elab_dCanonical.v_encDtInstSem", ("Vuna.Compiler.Elab.Canonical.encDtInstSem", "Vuna/Compiler/Elab/Canonical.vuna:80"));
  ("Elab_dCanonical.v_encExportEntries", ("Vuna.Compiler.Elab.Canonical.encExportEntries", "Vuna/Compiler/Elab/Canonical.vuna:129"));
  ("Elab_dCanonical.v_encExportEntry", ("Vuna.Compiler.Elab.Canonical.encExportEntry", "Vuna/Compiler/Elab/Canonical.vuna:125"));
  ("Elab_dCanonical.v_encFixities", ("Vuna.Compiler.Elab.Canonical.encFixities", "Vuna/Compiler/Elab/Canonical.vuna:137"));
  ("Elab_dCanonical.v_encFixity", ("Vuna.Compiler.Elab.Canonical.encFixity", "Vuna/Compiler/Elab/Canonical.vuna:133"));
  ("Elab_dCanonical.v_encImport", ("Vuna.Compiler.Elab.Canonical.encImport", "Vuna/Compiler/Elab/Canonical.vuna:141"));
  ("Elab_dCanonical.v_encImports", ("Vuna.Compiler.Elab.Canonical.encImports", "Vuna/Compiler/Elab/Canonical.vuna:146"));
  ("Elab_dCanonical.v_encMaybeSpan", ("Vuna.Compiler.Elab.Canonical.encMaybeSpan", "Vuna/Compiler/Elab/Canonical.vuna:76"));
  ("Elab_dCanonical.v_encMaybeTerm", ("Vuna.Compiler.Elab.Canonical.encMaybeTerm", "Vuna/Compiler/Elab/Canonical.vuna:112"));
  ("Elab_dCanonical.v_encRecordFieldMeta", ("Vuna.Compiler.Elab.Canonical.encRecordFieldMeta", "Vuna/Compiler/Elab/Canonical.vuna:150"));
  ("Elab_dCanonical.v_encRecordMeta", ("Vuna.Compiler.Elab.Canonical.encRecordMeta", "Vuna/Compiler/Elab/Canonical.vuna:155"));
  ("Elab_dCanonical.v_encRecordMetas", ("Vuna.Compiler.Elab.Canonical.encRecordMetas", "Vuna/Compiler/Elab/Canonical.vuna:162"));
  ("Elab_dCanonical.v_encReprTier", ("Vuna.Compiler.Elab.Canonical.encReprTier", "Vuna/Compiler/Elab/Canonical.vuna:116"));
  ("Elab_dCanonical.v_encSpan", ("Vuna.Compiler.Elab.Canonical.encSpan", "Vuna/Compiler/Elab/Canonical.vuna:64"));
  ("Elab_dCanonical.v_encTelePair", ("Vuna.Compiler.Elab.Canonical.encTelePair", "Vuna/Compiler/Elab/Canonical.vuna:104"));
  ("Elab_dCase.v_allCtorsUnsatisfiable", ("Vuna.Compiler.Elab.Case.allCtorsUnsatisfiable", "Vuna/Compiler/Elab/Case.vuna:356"));
  ("Elab_dCase.v_allCtorsUnsatisfiableGo", ("Vuna.Compiler.Elab.Case.allCtorsUnsatisfiableGo", "Vuna/Compiler/Elab/Case.vuna:359"));
  ("Elab_dCase.v_altNames", ("Vuna.Compiler.Elab.Case.altNames", "Vuna/Compiler/Elab/Case.vuna:577"));
  ("Elab_dCase.v_anyNestedArg", ("Vuna.Compiler.Elab.Case.anyNestedArg", "Vuna/Compiler/Elab/Case.vuna:605"));
  ("Elab_dCase.v_anyNestedPat", ("Vuna.Compiler.Elab.Case.anyNestedPat", "Vuna/Compiler/Elab/Case.vuna:597"));
  ("Elab_dCase.v_bindCtorField", ("Vuna.Compiler.Elab.Case.bindCtorField", "Vuna/Compiler/Elab/Case.vuna:397"));
  ("Elab_dCase.v_bindCtorGo", ("Vuna.Compiler.Elab.Case.bindCtorGo", "Vuna/Compiler/Elab/Case.vuna:375"));
  ("Elab_dCase.v_bindCtorTele", ("Vuna.Compiler.Elab.Case.bindCtorTele", "Vuna/Compiler/Elab/Case.vuna:372"));
  ("Elab_dCase.v_branchAfterUnify", ("Vuna.Compiler.Elab.Case.branchAfterUnify", "Vuna/Compiler/Elab/Case.vuna:277"));
  ("Elab_dCase.v_branchIsReachable", ("Vuna.Compiler.Elab.Case.branchIsReachable", "Vuna/Compiler/Elab/Case.vuna:272"));
  ("Elab_dCase.v_branchReachable", ("Vuna.Compiler.Elab.Case.branchReachable", "Vuna/Compiler/Elab/Case.vuna:300"));
  ("Elab_dCase.v_branchRemovalSpan", ("Vuna.Compiler.Elab.Case.branchRemovalSpan", "Vuna/Compiler/Elab/Case.vuna:651"));
  ("Elab_dCase.v_branchVerdict", ("Vuna.Compiler.Elab.Case.branchVerdict", "Vuna/Compiler/Elab/Case.vuna:284"));
  ("Elab_dCase.v_checkCaseAltsFlat", ("Vuna.Compiler.Elab.Case.checkCaseAltsFlat", "Vuna/Compiler/Elab/Case.vuna:518"));
  ("Elab_dCase.v_checkCaseAltsGo", ("Vuna.Compiler.Elab.Case.checkCaseAltsGo", "Vuna/Compiler/Elab/Case.vuna:521"));
  ("Elab_dCase.v_checkCaseDone", ("Vuna.Compiler.Elab.Case.checkCaseDone", "Vuna/Compiler/Elab/Case.vuna:640"));
  ("Elab_dCase.v_checkCatchAll", ("Vuna.Compiler.Elab.Case.checkCatchAll", "Vuna/Compiler/Elab/Case.vuna:556"));
  ("Elab_dCase.v_checkCoverage", ("Vuna.Compiler.Elab.Case.checkCoverage", "Vuna/Compiler/Elab/Case.vuna:620"));
  ("Elab_dCase.v_checkCovered", ("Vuna.Compiler.Elab.Case.checkCovered", "Vuna/Compiler/Elab/Case.vuna:624"));
  ("Elab_dCase.v_ctorExplicitArity", ("Vuna.Compiler.Elab.Case.ctorExplicitArity", "Vuna/Compiler/Elab/Case.vuna:308"));
  ("Elab_dCase.v_ctorHeadCovered", ("Vuna.Compiler.Elab.Case.ctorHeadCovered", "Vuna/Compiler/Elab/Case.vuna:476"));
  ("Elab_dCase.v_ctorResultTerms", ("Vuna.Compiler.Elab.Case.ctorResultTerms", "Vuna/Compiler/Elab/Case.vuna:422"));
  ("Elab_dCase.v_ctorResultVals", ("Vuna.Compiler.Elab.Case.ctorResultVals", "Vuna/Compiler/Elab/Case.vuna:409"));
  ("Elab_dCase.v_ctorResultValsIn", ("Vuna.Compiler.Elab.Case.ctorResultValsIn", "Vuna/Compiler/Elab/Case.vuna:419"));
  ("Elab_dCase.v_ctorValueIn", ("Vuna.Compiler.Elab.Case.ctorValueIn", "Vuna/Compiler/Elab/Case.vuna:430"));
  ("Elab_dCase.v_ctxHasEmptyBinder", ("Vuna.Compiler.Elab.Case.ctxHasEmptyBinder", "Vuna/Compiler/Elab/Case.vuna:314"));
  ("Elab_dCase.v_ctxHasEmptyBinderAt", ("Vuna.Compiler.Elab.Case.ctxHasEmptyBinderAt", "Vuna/Compiler/Elab/Case.vuna:317"));
  ("Elab_dCase.v_freshTeleVals", ("Vuna.Compiler.Elab.Case.freshTeleVals", "Vuna/Compiler/Elab/Case.vuna:404"));
  ("Elab_dCase.v_hasCatchAll", ("Vuna.Compiler.Elab.Case.hasCatchAll", "Vuna/Compiler/Elab/Case.vuna:584"));
  ("Elab_dCase.v_hasLitHead", ("Vuna.Compiler.Elab.Case.hasLitHead", "Vuna/Compiler/Elab/Case.vuna:566"));
  ("Elab_dCase.v_idxFuelFor", ("Vuna.Compiler.Elab.Case.idxFuelFor", "Vuna/Compiler/Elab/Case.vuna:63"));
  ("Elab_dCase.v_idxFuelMax", ("Vuna.Compiler.Elab.Case.idxFuelMax", "Vuna/Compiler/Elab/Case.vuna:69"));
  ("Elab_dCase.v_idxIsNatCtor", ("Vuna.Compiler.Elab.Case.idxIsNatCtor", "Vuna/Compiler/Elab/Case.vuna:105"));
  ("Elab_dCase.v_idxIsNatHead", ("Vuna.Compiler.Elab.Case.idxIsNatHead", "Vuna/Compiler/Elab/Case.vuna:96"));
  ("Elab_dCase.v_idxIsNatSuccHead", ("Vuna.Compiler.Elab.Case.idxIsNatSuccHead", "Vuna/Compiler/Elab/Case.vuna:138"));
  ("Elab_dCase.v_idxNatDepthNear", ("Vuna.Compiler.Elab.Case.idxNatDepthNear", "Vuna/Compiler/Elab/Case.vuna:82"));
  ("Elab_dCase.v_idxNatDepthOfList", ("Vuna.Compiler.Elab.Case.idxNatDepthOfList", "Vuna/Compiler/Elab/Case.vuna:72"));
  ("Elab_dCase.v_idxNatPrefixDepth", ("Vuna.Compiler.Elab.Case.idxNatPrefixDepth", "Vuna/Compiler/Elab/Case.vuna:109"));
  ("Elab_dCase.v_idxNatPrefixGo", ("Vuna.Compiler.Elab.Case.idxNatPrefixGo", "Vuna/Compiler/Elab/Case.vuna:112"));
  ("Elab_dCase.v_isEmptyFamilyValue", ("Vuna.Compiler.Elab.Case.isEmptyFamilyValue", "Vuna/Compiler/Elab/Case.vuna:325"));
  ("Elab_dCase.v_isRigidVal", ("Vuna.Compiler.Elab.Case.isRigidVal", "Vuna/Compiler/Elab/Case.vuna:347"));
  ("Elab_dCase.v_litHeadCovered", ("Vuna.Compiler.Elab.Case.litHeadCovered", "Vuna/Compiler/Elab/Case.vuna:484"));
  ("Elab_dCase.v_litLabel", ("Vuna.Compiler.Elab.Case.litLabel", "Vuna/Compiler/Elab/Case.vuna:499"));
  ("Elab_dCase.v_litPatEq", ("Vuna.Compiler.Elab.Case.litPatEq", "Vuna/Compiler/Elab/Case.vuna:488"));
  ("Elab_dCase.v_missingCtors", ("Vuna.Compiler.Elab.Case.missingCtors", "Vuna/Compiler/Elab/Case.vuna:630"));
  ("Elab_dCase.v_nestedInPat", ("Vuna.Compiler.Elab.Case.nestedInPat", "Vuna/Compiler/Elab/Case.vuna:601"));
  ("Elab_dCase.v_occursFreshLevel", ("Vuna.Compiler.Elab.Case.occursFreshLevel", "Vuna/Compiler/Elab/Case.vuna:201"));
  ("Elab_dCase.v_occursFuel", ("Vuna.Compiler.Elab.Case.occursFuel", "Vuna/Compiler/Elab/Case.vuna:211"));
  ("Elab_dCase.v_occursLevel", ("Vuna.Compiler.Elab.Case.occursLevel", "Vuna/Compiler/Elab/Case.vuna:174"));
  ("Elab_dCase.v_occursLevelList", ("Vuna.Compiler.Elab.Case.occursLevelList", "Vuna/Compiler/Elab/Case.vuna:204"));
  ("Elab_dCase.v_patIrrefutable", ("Vuna.Compiler.Elab.Case.patIrrefutable", "Vuna/Compiler/Elab/Case.vuna:467"));
  ("Elab_dCase.v_patsAllIrrefutable", ("Vuna.Compiler.Elab.Case.patsAllIrrefutable", "Vuna/Compiler/Elab/Case.vuna:472"));
  ("Elab_dCase.v_reflectScrutinee", ("Vuna.Compiler.Elab.Case.reflectScrutinee", "Vuna/Compiler/Elab/Case.vuna:448"));
  ("Elab_dCase.v_removeBranchSuggest", ("Vuna.Compiler.Elab.Case.removeBranchSuggest", "Vuna/Compiler/Elab/Case.vuna:663"));
  ("Elab_dCase.v_rigidIdxVals", ("Vuna.Compiler.Elab.Case.rigidIdxVals", "Vuna/Compiler/Elab/Case.vuna:343"));
  ("Elab_dCase.v_stripAsPat", ("Vuna.Compiler.Elab.Case.stripAsPat", "Vuna/Compiler/Elab/Case.vuna:508"));
  ("Elab_dCase.v_stripAsPats", ("Vuna.Compiler.Elab.Case.stripAsPats", "Vuna/Compiler/Elab/Case.vuna:513"));
  ("Elab_dCase.v_teleValsFrom", ("Vuna.Compiler.Elab.Case.teleValsFrom", "Vuna/Compiler/Elab/Case.vuna:436"));
  ("Elab_dCase.v_unifyErr", ("Vuna.Compiler.Elab.Case.unifyErr", "Vuna/Compiler/Elab/Case.vuna:37"));
  ("Elab_dCase.v_unifyIdx", ("Vuna.Compiler.Elab.Case.unifyIdx", "Vuna/Compiler/Elab/Case.vuna:147"));
  ("Elab_dCase.v_unifyIdxConv", ("Vuna.Compiler.Elab.Case.unifyIdxConv", "Vuna/Compiler/Elab/Case.vuna:252"));
  ("Elab_dCase.v_unifyIdxList", ("Vuna.Compiler.Elab.Case.unifyIdxList", "Vuna/Compiler/Elab/Case.vuna:41"));
  ("Elab_dCase.v_unifyIdxListGo", ("Vuna.Compiler.Elab.Case.unifyIdxListGo", "Vuna/Compiler/Elab/Case.vuna:45"));
  ("Elab_dCase.v_unifyIdxListSized", ("Vuna.Compiler.Elab.Case.unifyIdxListSized", "Vuna/Compiler/Elab/Case.vuna:60"));
  ("Elab_dCase.v_unifyIdxRigid", ("Vuna.Compiler.Elab.Case.unifyIdxRigid", "Vuna/Compiler/Elab/Case.vuna:215"));
  ("Elab_dCase.v_wildArgs", ("Vuna.Compiler.Elab.Case.wildArgs", "Vuna/Compiler/Elab/Case.vuna:304"));
  ("Elab_dCoverage.v_allSameLen", ("Vuna.Compiler.Elab.Coverage.allSameLen", "Vuna/Compiler/Elab/Coverage.vuna:253"));
  ("Elab_dCoverage.v_anyShortCtor", ("Vuna.Compiler.Elab.Coverage.anyShortCtor", "Vuna/Compiler/Elab/Coverage.vuna:118"));
  ("Elab_dCoverage.v_concatMapRow", ("Vuna.Compiler.Elab.Coverage.concatMapRow", "Vuna/Compiler/Elab/Coverage.vuna:77"));
  ("Elab_dCoverage.v_coverageFuelFor", ("Vuna.Compiler.Elab.Coverage.coverageFuelFor", "Vuna/Compiler/Elab/Coverage.vuna:239"));
  ("Elab_dCoverage.v_coverageFuelMax", ("Vuna.Compiler.Elab.Coverage.coverageFuelMax", "Vuna/Compiler/Elab/Coverage.vuna:245"));
  ("Elab_dCoverage.v_coverageWitness", ("Vuna.Compiler.Elab.Coverage.coverageWitness", "Vuna/Compiler/Elab/Coverage.vuna:169"));
  ("Elab_dCoverage.v_ctorHeadsOf", ("Vuna.Compiler.Elab.Coverage.ctorHeadsOf", "Vuna/Compiler/Elab/Coverage.vuna:54"));
  ("Elab_dCoverage.v_defaultRows", ("Vuna.Compiler.Elab.Coverage.defaultRows", "Vuna/Compiler/Elab/Coverage.vuna:66"));
  ("Elab_dCoverage.v_dropPats", ("Vuna.Compiler.Elab.Coverage.dropPats", "Vuna/Compiler/Elab/Coverage.vuna:154"));
  ("Elab_dCoverage.v_emptyPatSpan", ("Vuna.Compiler.Elab.Coverage.emptyPatSpan", "Vuna/Compiler/Elab/Coverage.vuna:34"));
  ("Elab_dCoverage.v_familyCtors", ("Vuna.Compiler.Elab.Coverage.familyCtors", "Vuna/Compiler/Elab/Coverage.vuna:102"));
  ("Elab_dCoverage.v_familyOfShortCtors", ("Vuna.Compiler.Elab.Coverage.familyOfShortCtors", "Vuna/Compiler/Elab/Coverage.vuna:112"));
  ("Elab_dCoverage.v_findShortCtor", ("Vuna.Compiler.Elab.Coverage.findShortCtor", "Vuna/Compiler/Elab/Coverage.vuna:133"));
  ("Elab_dCoverage.v_hasNilRow", ("Vuna.Compiler.Elab.Coverage.hasNilRow", "Vuna/Compiler/Elab/Coverage.vuna:90"));
  ("Elab_dCoverage.v_hasShortCtor", ("Vuna.Compiler.Elab.Coverage.hasShortCtor", "Vuna/Compiler/Elab/Coverage.vuna:122"));
  ("Elab_dCoverage.v_headCtorName", ("Vuna.Compiler.Elab.Coverage.headCtorName", "Vuna/Compiler/Elab/Coverage.vuna:46"));
  ("Elab_dCoverage.v_improveDiag", ("Vuna.Compiler.Elab.Coverage.improveDiag", "Vuna/Compiler/Elab/Coverage.vuna:273"));
  ("Elab_dCoverage.v_improveExhaustive", ("Vuna.Compiler.Elab.Coverage.improveExhaustive", "Vuna/Compiler/Elab/Coverage.vuna:269"));
  ("Elab_dCoverage.v_isWildHead", ("Vuna.Compiler.Elab.Coverage.isWildHead", "Vuna/Compiler/Elab/Coverage.vuna:58"));
  ("Elab_dCoverage.v_lookupEntry", ("Vuna.Compiler.Elab.Coverage.lookupEntry", "Vuna/Compiler/Elab/Coverage.vuna:97"));
  ("Elab_dCoverage.v_matrixArity", ("Vuna.Compiler.Elab.Coverage.matrixArity", "Vuna/Compiler/Elab/Coverage.vuna:257"));
  ("Elab_dCoverage.v_matrixNodes", ("Vuna.Compiler.Elab.Coverage.matrixNodes", "Vuna/Compiler/Elab/Coverage.vuna:234"));
  ("Elab_dCoverage.v_matrixWitness", ("Vuna.Compiler.Elab.Coverage.matrixWitness", "Vuna/Compiler/Elab/Coverage.vuna:207"));
  ("Elab_dCoverage.v_orderedCtors", ("Vuna.Compiler.Elab.Coverage.orderedCtors", "Vuna/Compiler/Elab/Coverage.vuna:139"));
  ("Elab_dCoverage.v_patHead", ("Vuna.Compiler.Elab.Coverage.patHead", "Vuna/Compiler/Elab/Coverage.vuna:42"));
  ("Elab_dCoverage.v_patNodes", ("Vuna.Compiler.Elab.Coverage.patNodes", "Vuna/Compiler/Elab/Coverage.vuna:220"));
  ("Elab_dCoverage.v_patNodesFields", ("Vuna.Compiler.Elab.Coverage.patNodesFields", "Vuna/Compiler/Elab/Coverage.vuna:230"));
  ("Elab_dCoverage.v_patNodesList", ("Vuna.Compiler.Elab.Coverage.patNodesList", "Vuna/Compiler/Elab/Coverage.vuna:226"));
  ("Elab_dCoverage.v_renderPat", ("Vuna.Compiler.Elab.Coverage.renderPat", "Vuna/Compiler/Elab/Coverage.vuna:299"));
  ("Elab_dCoverage.v_renderPatIn", ("Vuna.Compiler.Elab.Coverage.renderPatIn", "Vuna/Compiler/Elab/Coverage.vuna:302"));
  ("Elab_dCoverage.v_renderWitness", ("Vuna.Compiler.Elab.Coverage.renderWitness", "Vuna/Compiler/Elab/Coverage.vuna:322"));
  ("Elab_dCoverage.v_sentinelCtorIn", ("Vuna.Compiler.Elab.Coverage.sentinelCtorIn", "Vuna/Compiler/Elab/Coverage.vuna:127"));
  ("Elab_dCoverage.v_specializeCtor", ("Vuna.Compiler.Elab.Coverage.specializeCtor", "Vuna/Compiler/Elab/Coverage.vuna:74"));
  ("Elab_dCoverage.v_specializeRow", ("Vuna.Compiler.Elab.Coverage.specializeRow", "Vuna/Compiler/Elab/Coverage.vuna:81"));
  ("Elab_dCoverage.v_takePats", ("Vuna.Compiler.Elab.Coverage.takePats", "Vuna/Compiler/Elab/Coverage.vuna:145"));
  ("Elab_dCoverage.v_uniformArity", ("Vuna.Compiler.Elab.Coverage.uniformArity", "Vuna/Compiler/Elab/Coverage.vuna:249"));
  ("Elab_dCoverage.v_wilds", ("Vuna.Compiler.Elab.Coverage.wilds", "Vuna/Compiler/Elab/Coverage.vuna:38"));
  ("Elab_dCoverage.v_witnessNamesCtor", ("Vuna.Compiler.Elab.Coverage.witnessNamesCtor", "Vuna/Compiler/Elab/Coverage.vuna:290"));
  ("Elab_dData.v_candidateNames", ("Vuna.Compiler.Elab.Data.candidateNames", "Vuna/Compiler/Elab/Data.vuna:460"));
  ("Elab_dData.v_candidateOf", ("Vuna.Compiler.Elab.Data.candidateOf", "Vuna/Compiler/Elab/Data.vuna:457"));
  ("Elab_dData.v_checkCtorFieldSorts", ("Vuna.Compiler.Elab.Data.checkCtorFieldSorts", "Vuna/Compiler/Elab/Data.vuna:80"));
  ("Elab_dData.v_checkViaDataDecls", ("Vuna.Compiler.Elab.Data.checkViaDataDecls", "Vuna/Compiler/Elab/Data.vuna:303"));
  ("Elab_dData.v_checkViaDataDeclsGo", ("Vuna.Compiler.Elab.Data.checkViaDataDeclsGo", "Vuna/Compiler/Elab/Data.vuna:307"));
  ("Elab_dData.v_countSurfacePis", ("Vuna.Compiler.Elab.Data.countSurfacePis", "Vuna/Compiler/Elab/Data.vuna:94"));
  ("Elab_dData.v_countTelePis", ("Vuna.Compiler.Elab.Data.countTelePis", "Vuna/Compiler/Elab/Data.vuna:100"));
  ("Elab_dData.v_ctorFieldGo", ("Vuna.Compiler.Elab.Data.ctorFieldGo", "Vuna/Compiler/Elab/Data.vuna:408"));
  ("Elab_dData.v_ctorFieldSortsBinder", ("Vuna.Compiler.Elab.Data.ctorFieldSortsBinder", "Vuna/Compiler/Elab/Data.vuna:111"));
  ("Elab_dData.v_ctorFieldSortsGo", ("Vuna.Compiler.Elab.Data.ctorFieldSortsGo", "Vuna/Compiler/Elab/Data.vuna:104"));
  ("Elab_dData.v_ctorFieldTerms", ("Vuna.Compiler.Elab.Data.ctorFieldTerms", "Vuna/Compiler/Elab/Data.vuna:405"));
  ("Elab_dData.v_dtFieldsOfRecord", ("Vuna.Compiler.Elab.Data.dtFieldsOfRecord", "Vuna/Compiler/Elab/Data.vuna:204"));
  ("Elab_dData.v_dtFieldsOfRecordGo", ("Vuna.Compiler.Elab.Data.dtFieldsOfRecordGo", "Vuna/Compiler/Elab/Data.vuna:217"));
  ("Elab_dData.v_elabCtor", ("Vuna.Compiler.Elab.Data.elabCtor", "Vuna/Compiler/Elab/Data.vuna:26"));
  ("Elab_dData.v_elabCtors", ("Vuna.Compiler.Elab.Data.elabCtors", "Vuna/Compiler/Elab/Data.vuna:51"));
  ("Elab_dData.v_elabDataBodies", ("Vuna.Compiler.Elab.Data.elabDataBodies", "Vuna/Compiler/Elab/Data.vuna:225"));
  ("Elab_dData.v_elabDataHead", ("Vuna.Compiler.Elab.Data.elabDataHead", "Vuna/Compiler/Elab/Data.vuna:134"));
  ("Elab_dData.v_elabDataHeads", ("Vuna.Compiler.Elab.Data.elabDataHeads", "Vuna/Compiler/Elab/Data.vuna:176"));
  ("Elab_dData.v_elabDataHeadsFuel", ("Vuna.Compiler.Elab.Data.elabDataHeadsFuel", "Vuna/Compiler/Elab/Data.vuna:179"));
  ("Elab_dData.v_elabDataHeadsNoProgress", ("Vuna.Compiler.Elab.Data.elabDataHeadsNoProgress", "Vuna/Compiler/Elab/Data.vuna:194"));
  ("Elab_dData.v_elabDataHeadsRound", ("Vuna.Compiler.Elab.Data.elabDataHeadsRound", "Vuna/Compiler/Elab/Data.vuna:168"));
  ("Elab_dData.v_elabDatas", ("Vuna.Compiler.Elab.Data.elabDatas", "Vuna/Compiler/Elab/Data.vuna:364"));
  ("Elab_dData.v_eraseIndexMask", ("Vuna.Compiler.Elab.Data.eraseIndexMask", "Vuna/Compiler/Elab/Data.vuna:386"));
  ("Elab_dData.v_eraseMaskGo", ("Vuna.Compiler.Elab.Data.eraseMaskGo", "Vuna/Compiler/Elab/Data.vuna:389"));
  ("Elab_dData.v_indexErasureCandidates", ("Vuna.Compiler.Elab.Data.indexErasureCandidates", "Vuna/Compiler/Elab/Data.vuna:453"));
  ("Elab_dData.v_kindResultLevel", ("Vuna.Compiler.Elab.Data.kindResultLevel", "Vuna/Compiler/Elab/Data.vuna:69"));
  ("Elab_dData.v_paramUsedInFieldTys", ("Vuna.Compiler.Elab.Data.paramUsedInFieldTys", "Vuna/Compiler/Elab/Data.vuna:394"));
  ("Elab_dData.v_reprIsAlias", ("Vuna.Compiler.Elab.Data.reprIsAlias", "Vuna/Compiler/Elab/Data.vuna:340"));
  ("Elab_dData.v_sameCtorSet", ("Vuna.Compiler.Elab.Data.sameCtorSet", "Vuna/Compiler/Elab/Data.vuna:293"));
  ("Elab_dData.v_skipParamPis", ("Vuna.Compiler.Elab.Data.skipParamPis", "Vuna/Compiler/Elab/Data.vuna:213"));
  ("Elab_dData.v_termUsesVar", ("Vuna.Compiler.Elab.Data.termUsesVar", "Vuna/Compiler/Elab/Data.vuna:420"));
  ("Elab_dData.v_termUsesVarAlts", ("Vuna.Compiler.Elab.Data.termUsesVarAlts", "Vuna/Compiler/Elab/Data.vuna:447"));
  ("Elab_dData.v_termUsesVarArgs", ("Vuna.Compiler.Elab.Data.termUsesVarArgs", "Vuna/Compiler/Elab/Data.vuna:443"));
  ("Elab_dData.v_usedInCtor", ("Vuna.Compiler.Elab.Data.usedInCtor", "Vuna/Compiler/Elab/Data.vuna:401"));
  ("Elab_dData.v_usedInCtors", ("Vuna.Compiler.Elab.Data.usedInCtors", "Vuna/Compiler/Elab/Data.vuna:397"));
  ("Elab_dData.v_usedInTele", ("Vuna.Compiler.Elab.Data.usedInTele", "Vuna/Compiler/Elab/Data.vuna:413"));
  ("Elab_dData.v_usedInTeleGo", ("Vuna.Compiler.Elab.Data.usedInTeleGo", "Vuna/Compiler/Elab/Data.vuna:416"));
  ("Elab_dData.v_viaFieldOk", ("Vuna.Compiler.Elab.Data.viaFieldOk", "Vuna/Compiler/Elab/Data.vuna:334"));
  ("Elab_dData.v_viaShapeOk", ("Vuna.Compiler.Elab.Data.viaShapeOk", "Vuna/Compiler/Elab/Data.vuna:347"));
  ("Elab_dData.v_viaShapeOkWith", ("Vuna.Compiler.Elab.Data.viaShapeOkWith", "Vuna/Compiler/Elab/Data.vuna:350"));
  ("Elab_dDerive.v_anyCtorMentions", ("Vuna.Compiler.Elab.Derive.anyCtorMentions", "Vuna/Compiler/Elab/Derive.vuna:134"));
  ("Elab_dDerive.v_anyExprMentions", ("Vuna.Compiler.Elab.Derive.anyExprMentions", "Vuna/Compiler/Elab/Derive.vuna:145"));
  ("Elab_dDerive.v_anyTraitHasMethod", ("Vuna.Compiler.Elab.Derive.anyTraitHasMethod", "Vuna/Compiler/Elab/Derive.vuna:65"));
  ("Elab_dDerive.v_applyTypeParams", ("Vuna.Compiler.Elab.Derive.applyTypeParams", "Vuna/Compiler/Elab/Derive.vuna:246"));
  ("Elab_dDerive.v_boolFalse", ("Vuna.Compiler.Elab.Derive.boolFalse", "Vuna/Compiler/Elab/Derive.vuna:449"));
  ("Elab_dDerive.v_boolTrue", ("Vuna.Compiler.Elab.Derive.boolTrue", "Vuna/Compiler/Elab/Derive.vuna:446"));
  ("Elab_dDerive.v_collectDerivings", ("Vuna.Compiler.Elab.Derive.collectDerivings", "Vuna/Compiler/Elab/Derive.vuna:76"));
  ("Elab_dDerive.v_conjFields", ("Vuna.Compiler.Elab.Derive.conjFields", "Vuna/Compiler/Elab/Derive.vuna:341"));
  ("Elab_dDerive.v_deriveCtxParams", ("Vuna.Compiler.Elab.Derive.deriveCtxParams", "Vuna/Compiler/Elab/Derive.vuna:126"));
  ("Elab_dDerive.v_deriveFieldTypeName", ("Vuna.Compiler.Elab.Derive.deriveFieldTypeName", "Vuna/Compiler/Elab/Derive.vuna:235"));
  ("Elab_dDerive.v_deriveFieldTypes", ("Vuna.Compiler.Elab.Derive.deriveFieldTypes", "Vuna/Compiler/Elab/Derive.vuna:229"));
  ("Elab_dDerive.v_deriveInstance", ("Vuna.Compiler.Elab.Derive.deriveInstance", "Vuna/Compiler/Elab/Derive.vuna:152"));
  ("Elab_dDerive.v_deriveWrapper", ("Vuna.Compiler.Elab.Derive.deriveWrapper", "Vuna/Compiler/Elab/Derive.vuna:206"));
  ("Elab_dDerive.v_deriveWrapperCtor", ("Vuna.Compiler.Elab.Derive.deriveWrapperCtor", "Vuna/Compiler/Elab/Derive.vuna:216"));
  ("Elab_dDerive.v_derivingsFor", ("Vuna.Compiler.Elab.Derive.derivingsFor", "Vuna/Compiler/Elab/Derive.vuna:111"));
  ("Elab_dDerive.v_derivingsForGo", ("Vuna.Compiler.Elab.Derive.derivingsForGo", "Vuna/Compiler/Elab/Derive.vuna:115"));
  ("Elab_dDerive.v_eqAlt", ("Vuna.Compiler.Elab.Derive.eqAlt", "Vuna/Compiler/Elab/Derive.vuna:323"));
  ("Elab_dDerive.v_eqBody", ("Vuna.Compiler.Elab.Derive.eqBody", "Vuna/Compiler/Elab/Derive.vuna:320"));
  ("Elab_dDerive.v_eqInner", ("Vuna.Compiler.Elab.Derive.eqInner", "Vuna/Compiler/Elab/Derive.vuna:331"));
  ("Elab_dDerive.v_expandDerivings", ("Vuna.Compiler.Elab.Derive.expandDerivings", "Vuna/Compiler/Elab/Derive.vuna:51"));
  ("Elab_dDerive.v_exprMentionsName", ("Vuna.Compiler.Elab.Derive.exprMentionsName", "Vuna/Compiler/Elab/Derive.vuna:138"));
  ("Elab_dDerive.v_geBody", ("Vuna.Compiler.Elab.Derive.geBody", "Vuna/Compiler/Elab/Derive.vuna:435"));
  ("Elab_dDerive.v_gtBody", ("Vuna.Compiler.Elab.Derive.gtBody", "Vuna/Compiler/Elab/Derive.vuna:431"));
  ("Elab_dDerive.v_hashAlts", ("Vuna.Compiler.Elab.Derive.hashAlts", "Vuna/Compiler/Elab/Derive.vuna:296"));
  ("Elab_dDerive.v_hashBody", ("Vuna.Compiler.Elab.Derive.hashBody", "Vuna/Compiler/Elab/Derive.vuna:291"));
  ("Elab_dDerive.v_hashFields", ("Vuna.Compiler.Elab.Derive.hashFields", "Vuna/Compiler/Elab/Derive.vuna:306"));
  ("Elab_dDerive.v_instHead", ("Vuna.Compiler.Elab.Derive.instHead", "Vuna/Compiler/Elab/Derive.vuna:241"));
  ("Elab_dDerive.v_leBody", ("Vuna.Compiler.Elab.Derive.leBody", "Vuna/Compiler/Elab/Derive.vuna:410"));
  ("Elab_dDerive.v_ltFields", ("Vuna.Compiler.Elab.Derive.ltFields", "Vuna/Compiler/Elab/Derive.vuna:395"));
  ("Elab_dDerive.v_neqBody", ("Vuna.Compiler.Elab.Derive.neqBody", "Vuna/Compiler/Elab/Derive.vuna:354"));
  ("Elab_dDerive.v_ordAlts", ("Vuna.Compiler.Elab.Derive.ordAlts", "Vuna/Compiler/Elab/Derive.vuna:368"));
  ("Elab_dDerive.v_ordBody", ("Vuna.Compiler.Elab.Derive.ordBody", "Vuna/Compiler/Elab/Derive.vuna:365"));
  ("Elab_dDerive.v_ordInner", ("Vuna.Compiler.Elab.Derive.ordInner", "Vuna/Compiler/Elab/Derive.vuna:378"));
  ("Elab_dDerive.v_ordInnerGo", ("Vuna.Compiler.Elab.Derive.ordInnerGo", "Vuna/Compiler/Elab/Derive.vuna:381"));
  ("Elab_dDerive.v_recordCtorOf", ("Vuna.Compiler.Elab.Derive.recordCtorOf", "Vuna/Compiler/Elab/Derive.vuna:102"));
  ("Elab_dDerive.v_recordDerivingsFor", ("Vuna.Compiler.Elab.Derive.recordDerivingsFor", "Vuna/Compiler/Elab/Derive.vuna:107"));
  ("Elab_dDerive.v_showAlts", ("Vuna.Compiler.Elab.Derive.showAlts", "Vuna/Compiler/Elab/Derive.vuna:256"));
  ("Elab_dDerive.v_showBody", ("Vuna.Compiler.Elab.Derive.showBody", "Vuna/Compiler/Elab/Derive.vuna:253"));
  ("Elab_dDerive.v_showCtor", ("Vuna.Compiler.Elab.Derive.showCtor", "Vuna/Compiler/Elab/Derive.vuna:266"));
  ("Elab_dDerive.v_showFields", ("Vuna.Compiler.Elab.Derive.showFields", "Vuna/Compiler/Elab/Derive.vuna:271"));
  ("Elab_dDerive.v_showOne", ("Vuna.Compiler.Elab.Derive.showOne", "Vuna/Compiler/Elab/Derive.vuna:282"));
  ("Elab_dDerive.v_traitMethodGlobal", ("Vuna.Compiler.Elab.Derive.traitMethodGlobal", "Vuna/Compiler/Elab/Derive.vuna:36"));
  ("Elab_dDerive.v_traitMethodOf", ("Vuna.Compiler.Elab.Derive.traitMethodOf", "Vuna/Compiler/Elab/Derive.vuna:59"));
  ("Elab_dDerive.v_traitShortName", ("Vuna.Compiler.Elab.Derive.traitShortName", "Vuna/Compiler/Elab/Derive.vuna:31"));
  ("Elab_dDerive.v_varNames", ("Vuna.Compiler.Elab.Derive.varNames", "Vuna/Compiler/Elab/Derive.vuna:417"));
  ("Elab_dDerive.v_varNamesAt", ("Vuna.Compiler.Elab.Derive.varNamesAt", "Vuna/Compiler/Elab/Derive.vuna:420"));
  ("Elab_dDerive.v_varNamesAtGo", ("Vuna.Compiler.Elab.Derive.varNamesAtGo", "Vuna/Compiler/Elab/Derive.vuna:423"));
  ("Elab_dDict.v_allInstancesMono", ("Vuna.Compiler.Elab.Dict.allInstancesMono", "Vuna/Compiler/Elab/Dict.vuna:359"));
  ("Elab_dDict.v_allocMetaAt", ("Vuna.Compiler.Elab.Dict.allocMetaAt", "Vuna/Compiler/Elab/Dict.vuna:410"));
  ("Elab_dDict.v_allocTeleMetas", ("Vuna.Compiler.Elab.Dict.allocTeleMetas", "Vuna/Compiler/Elab/Dict.vuna:402"));
  ("Elab_dDict.v_anyRigidClassArg", ("Vuna.Compiler.Elab.Dict.anyRigidClassArg", "Vuna/Compiler/Elab/Dict.vuna:997"));
  ("Elab_dDict.v_anyUnsolvedMetaArg", ("Vuna.Compiler.Elab.Dict.anyUnsolvedMetaArg", "Vuna/Compiler/Elab/Dict.vuna:1201"));
  ("Elab_dDict.v_anyValueHasRigidNVar", ("Vuna.Compiler.Elab.Dict.anyValueHasRigidNVar", "Vuna/Compiler/Elab/Dict.vuna:1021"));
  ("Elab_dDict.v_anyViaClassFam", ("Vuna.Compiler.Elab.Dict.anyViaClassFam", "Vuna/Compiler/Elab/Dict.vuna:107"));
  ("Elab_dDict.v_anyViaWrapper", ("Vuna.Compiler.Elab.Dict.anyViaWrapper", "Vuna/Compiler/Elab/Dict.vuna:169"));
  ("Elab_dDict.v_applyDataPis", ("Vuna.Compiler.Elab.Dict.applyDataPis", "Vuna/Compiler/Elab/Dict.vuna:119"));
  ("Elab_dDict.v_argHeadMatchesKind", ("Vuna.Compiler.Elab.Dict.argHeadMatchesKind", "Vuna/Compiler/Elab/Dict.vuna:959"));
  ("Elab_dDict.v_blanketInstances", ("Vuna.Compiler.Elab.Dict.blanketInstances", "Vuna/Compiler/Elab/Dict.vuna:227"));
  ("Elab_dDict.v_boolShortCircuit", ("Vuna.Compiler.Elab.Dict.boolShortCircuit", "Vuna/Compiler/Elab/Dict.vuna:1239"));
  ("Elab_dDict.v_classHasProjection", ("Vuna.Compiler.Elab.Dict.classHasProjection", "Vuna/Compiler/Elab/Dict.vuna:1029"));
  ("Elab_dDict.v_cmpMethodShortOf", ("Vuna.Compiler.Elab.Dict.cmpMethodShortOf", "Vuna/Compiler/Elab/Dict.vuna:1085"));
  ("Elab_dDict.v_cmpRuntimeName", ("Vuna.Compiler.Elab.Dict.cmpRuntimeName", "Vuna/Compiler/Elab/Dict.vuna:1153"));
  ("Elab_dDict.v_ctorParamKinds", ("Vuna.Compiler.Elab.Dict.ctorParamKinds", "Vuna/Compiler/Elab/Dict.vuna:932"));
  ("Elab_dDict.v_ctorParamKindsFuel", ("Vuna.Compiler.Elab.Dict.ctorParamKindsFuel", "Vuna/Compiler/Elab/Dict.vuna:935"));
  ("Elab_dDict.v_ctorValue", ("Vuna.Compiler.Elab.Dict.ctorValue", "Vuna/Compiler/Elab/Dict.vuna:492"));
  ("Elab_dDict.v_ctxMemberProofTerm", ("Vuna.Compiler.Elab.Dict.ctxMemberProofTerm", "Vuna/Compiler/Elab/Dict.vuna:614"));
  ("Elab_dDict.v_ctxMemberProofTermGo", ("Vuna.Compiler.Elab.Dict.ctxMemberProofTermGo", "Vuna/Compiler/Elab/Dict.vuna:606"));
  ("Elab_dDict.v_ctxMemberProofUnify", ("Vuna.Compiler.Elab.Dict.ctxMemberProofUnify", "Vuna/Compiler/Elab/Dict.vuna:620"));
  ("Elab_dDict.v_ctxMemberProofUnifyGo", ("Vuna.Compiler.Elab.Dict.ctxMemberProofUnifyGo", "Vuna/Compiler/Elab/Dict.vuna:623"));
  ("Elab_dDict.v_deferEqDict", ("Vuna.Compiler.Elab.Dict.deferEqDict", "Vuna/Compiler/Elab/Dict.vuna:1135"));
  ("Elab_dDict.v_dictArgKind", ("Vuna.Compiler.Elab.Dict.dictArgKind", "Vuna/Compiler/Elab/Dict.vuna:945"));
  ("Elab_dDict.v_dictArgKinds", ("Vuna.Compiler.Elab.Dict.dictArgKinds", "Vuna/Compiler/Elab/Dict.vuna:919"));
  ("Elab_dDict.v_dictArgUnsolvedMeta", ("Vuna.Compiler.Elab.Dict.dictArgUnsolvedMeta", "Vuna/Compiler/Elab/Dict.vuna:1195"));
  ("Elab_dDict.v_dictClassArg", ("Vuna.Compiler.Elab.Dict.dictClassArg", "Vuna/Compiler/Elab/Dict.vuna:984"));
  ("Elab_dDict.v_dictClassArgs", ("Vuna.Compiler.Elab.Dict.dictClassArgs", "Vuna/Compiler/Elab/Dict.vuna:978"));
  ("Elab_dDict.v_dictFamilyNameOf", ("Vuna.Compiler.Elab.Dict.dictFamilyNameOf", "Vuna/Compiler/Elab/Dict.vuna:951"));
  ("Elab_dDict.v_dictTermOfValueAt", ("Vuna.Compiler.Elab.Dict.dictTermOfValueAt", "Vuna/Compiler/Elab/Dict.vuna:843"));
  ("Elab_dDict.v_eqMethodShortOf", ("Vuna.Compiler.Elab.Dict.eqMethodShortOf", "Vuna/Compiler/Elab/Dict.vuna:1082"));
  ("Elab_dDict.v_famOfClass", ("Vuna.Compiler.Elab.Dict.famOfClass", "Vuna/Compiler/Elab/Dict.vuna:100"));
  ("Elab_dDict.v_findClass", ("Vuna.Compiler.Elab.Dict.findClass", "Vuna/Compiler/Elab/Dict.vuna:95"));
  ("Elab_dDict.v_finishInstanceSearch", ("Vuna.Compiler.Elab.Dict.finishInstanceSearch", "Vuna/Compiler/Elab/Dict.vuna:232"));
  ("Elab_dDict.v_firstUnsolvedDictGoal", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoal", "Vuna/Compiler/Elab/Dict.vuna:1260"));
  ("Elab_dDict.v_firstUnsolvedDictGoalGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalGo", "Vuna/Compiler/Elab/Dict.vuna:1263"));
  ("Elab_dDict.v_firstUnsolvedDictGoalMeta", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalMeta", "Vuna/Compiler/Elab/Dict.vuna:1340"));
  ("Elab_dDict.v_firstUnsolvedDictGoalMetaGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalMetaGo", "Vuna/Compiler/Elab/Dict.vuna:1344"));
  ("Elab_dDict.v_firstUnsolvedDictGoalSpan", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalSpan", "Vuna/Compiler/Elab/Dict.vuna:1319"));
  ("Elab_dDict.v_firstUnsolvedDictSpanGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictSpanGo", "Vuna/Compiler/Elab/Dict.vuna:1323"));
  ("Elab_dDict.v_firstUnsolvedInterpGoal", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpGoal", "Vuna/Compiler/Elab/Dict.vuna:266"));
  ("Elab_dDict.v_firstUnsolvedInterpGoalGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpGoalGo", "Vuna/Compiler/Elab/Dict.vuna:269"));
  ("Elab_dDict.v_firstUnsolvedInterpGoalSpan", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpGoalSpan", "Vuna/Compiler/Elab/Dict.vuna:1286"));
  ("Elab_dDict.v_firstUnsolvedInterpSpanGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpSpanGo", "Vuna/Compiler/Elab/Dict.vuna:1290"));
  ("Elab_dDict.v_firstUnsolvedMemberGoal", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberGoal", "Vuna/Compiler/Elab/Dict.vuna:1243"));
  ("Elab_dDict.v_firstUnsolvedMemberGoalGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberGoalGo", "Vuna/Compiler/Elab/Dict.vuna:1246"));
  ("Elab_dDict.v_firstUnsolvedMemberGoalSpan", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberGoalSpan", "Vuna/Compiler/Elab/Dict.vuna:1304"));
  ("Elab_dDict.v_firstUnsolvedMemberSpanGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberSpanGo", "Vuna/Compiler/Elab/Dict.vuna:1308"));
  ("Elab_dDict.v_hasSpecificInterpInstance", ("Vuna.Compiler.Elab.Dict.hasSpecificInterpInstance", "Vuna/Compiler/Elab/Dict.vuna:327"));
  ("Elab_dDict.v_hasSpecificInterpInstanceGo", ("Vuna.Compiler.Elab.Dict.hasSpecificInterpInstanceGo", "Vuna/Compiler/Elab/Dict.vuna:331"));
  ("Elab_dDict.v_hereCtorName", ("Vuna.Compiler.Elab.Dict.hereCtorName", "Vuna/Compiler/Elab/Dict.vuna:462"));
  ("Elab_dDict.v_instHeadArgTypeName", ("Vuna.Compiler.Elab.Dict.instHeadArgTypeName", "Vuna/Compiler/Elab/Dict.vuna:339"));
  ("Elab_dDict.v_instMatchInst", ("Vuna.Compiler.Elab.Dict.instMatchInst", "Vuna/Compiler/Elab/Dict.vuna:55"));
  ("Elab_dDict.v_isCmpMethod", ("Vuna.Compiler.Elab.Dict.isCmpMethod", "Vuna/Compiler/Elab/Dict.vuna:1048"));
  ("Elab_dDict.v_isDictDomain", ("Vuna.Compiler.Elab.Dict.isDictDomain", "Vuna/Compiler/Elab/Dict.vuna:25"));
  ("Elab_dDict.v_isDictFamily", ("Vuna.Compiler.Elab.Dict.isDictFamily", "Vuna/Compiler/Elab/Dict.vuna:35"));
  ("Elab_dDict.v_isDictValue", ("Vuna.Compiler.Elab.Dict.isDictValue", "Vuna/Compiler/Elab/Dict.vuna:28"));
  ("Elab_dDict.v_isEqMethod", ("Vuna.Compiler.Elab.Dict.isEqMethod", "Vuna/Compiler/Elab/Dict.vuna:1041"));
  ("Elab_dDict.v_isGtShort", ("Vuna.Compiler.Elab.Dict.isGtShort", "Vuna/Compiler/Elab/Dict.vuna:1188"));
  ("Elab_dDict.v_isLeShort", ("Vuna.Compiler.Elab.Dict.isLeShort", "Vuna/Compiler/Elab/Dict.vuna:1185"));
  ("Elab_dDict.v_isLtShort", ("Vuna.Compiler.Elab.Dict.isLtShort", "Vuna/Compiler/Elab/Dict.vuna:1182"));
  ("Elab_dDict.v_isMemberDomain", ("Vuna.Compiler.Elab.Dict.isMemberDomain", "Vuna/Compiler/Elab/Dict.vuna:476"));
  ("Elab_dDict.v_isMonoInst", ("Vuna.Compiler.Elab.Dict.isMonoInst", "Vuna/Compiler/Elab/Dict.vuna:349"));
  ("Elab_dDict.v_isRigidClassArg", ("Vuna.Compiler.Elab.Dict.isRigidClassArg", "Vuna/Compiler/Elab/Dict.vuna:1002"));
  ("Elab_dDict.v_isRigidDictArg", ("Vuna.Compiler.Elab.Dict.isRigidDictArg", "Vuna/Compiler/Elab/Dict.vuna:994"));
  ("Elab_dDict.v_joinInstNames", ("Vuna.Compiler.Elab.Dict.joinInstNames", "Vuna/Compiler/Elab/Dict.vuna:909"));
  ("Elab_dDict.v_joinRestInstNames", ("Vuna.Compiler.Elab.Dict.joinRestInstNames", "Vuna/Compiler/Elab/Dict.vuna:913"));
  ("Elab_dDict.v_labelCandIdx", ("Vuna.Compiler.Elab.Dict.labelCandIdx", "Vuna/Compiler/Elab/Dict.vuna:528"));
  ("Elab_dDict.v_labelCandName", ("Vuna.Compiler.Elab.Dict.labelCandName", "Vuna/Compiler/Elab/Dict.vuna:525"));
  ("Elab_dDict.v_labelCandText", ("Vuna.Compiler.Elab.Dict.labelCandText", "Vuna/Compiler/Elab/Dict.vuna:532"));
  ("Elab_dDict.v_labelScan", ("Vuna.Compiler.Elab.Dict.labelScan", "Vuna/Compiler/Elab/Dict.vuna:544"));
  ("Elab_dDict.v_localDictLookup", ("Vuna.Compiler.Elab.Dict.localDictLookup", "Vuna/Compiler/Elab/Dict.vuna:287"));
  ("Elab_dDict.v_localDictLookupExact", ("Vuna.Compiler.Elab.Dict.localDictLookupExact", "Vuna/Compiler/Elab/Dict.vuna:290"));
  ("Elab_dDict.v_localDictLookupGo", ("Vuna.Compiler.Elab.Dict.localDictLookupGo", "Vuna/Compiler/Elab/Dict.vuna:296"));
  ("Elab_dDict.v_matchInstances", ("Vuna.Compiler.Elab.Dict.matchInstances", "Vuna/Compiler/Elab/Dict.vuna:363"));
  ("Elab_dDict.v_memberDomName", ("Vuna.Compiler.Elab.Dict.memberDomName", "Vuna/Compiler/Elab/Dict.vuna:458"));
  ("Elab_dDict.v_memberLookup", ("Vuna.Compiler.Elab.Dict.memberLookup", "Vuna/Compiler/Elab/Dict.vuna:498"));
  ("Elab_dDict.v_memberLookupRowLabel", ("Vuna.Compiler.Elab.Dict.memberLookupRowLabel", "Vuna/Compiler/Elab/Dict.vuna:584"));
  ("Elab_dDict.v_memberNameText", ("Vuna.Compiler.Elab.Dict.memberNameText", "Vuna/Compiler/Elab/Dict.vuna:515"));
  ("Elab_dDict.v_memberProbe", ("Vuna.Compiler.Elab.Dict.memberProbe", "Vuna/Compiler/Elab/Dict.vuna:508"));
  ("Elab_dDict.v_memberProofAtLabel", ("Vuna.Compiler.Elab.Dict.memberProofAtLabel", "Vuna/Compiler/Elab/Dict.vuna:569"));
  ("Elab_dDict.v_memberSpine", ("Vuna.Compiler.Elab.Dict.memberSpine", "Vuna/Compiler/Elab/Dict.vuna:482"));
  ("Elab_dDict.v_methodShortOf", ("Vuna.Compiler.Elab.Dict.methodShortOf", "Vuna/Compiler/Elab/Dict.vuna:1078"));
  ("Elab_dDict.v_missingInstance", ("Vuna.Compiler.Elab.Dict.missingInstance", "Vuna/Compiler/Elab/Dict.vuna:244"));
  ("Elab_dDict.v_neutralHeadOrSelf", ("Vuna.Compiler.Elab.Dict.neutralHeadOrSelf", "Vuna/Compiler/Elab/Dict.vuna:972"));
  ("Elab_dDict.v_numMethodOpName", ("Vuna.Compiler.Elab.Dict.numMethodOpName", "Vuna/Compiler/Elab/Dict.vuna:1067"));
  ("Elab_dDict.v_opShortOf", ("Vuna.Compiler.Elab.Dict.opShortOf", "Vuna/Compiler/Elab/Dict.vuna:1036"));
  ("Elab_dDict.v_piRigs", ("Vuna.Compiler.Elab.Dict.piRigs", "Vuna/Compiler/Elab/Dict.vuna:905"));
  ("Elab_dDict.v_piRigsOfGlobal", ("Vuna.Compiler.Elab.Dict.piRigsOfGlobal", "Vuna/Compiler/Elab/Dict.vuna:896"));
  ("Elab_dDict.v_piRigsOfInst", ("Vuna.Compiler.Elab.Dict.piRigsOfInst", "Vuna/Compiler/Elab/Dict.vuna:885"));
  ("Elab_dDict.v_piRigsOfInstGo", ("Vuna.Compiler.Elab.Dict.piRigsOfInstGo", "Vuna/Compiler/Elab/Dict.vuna:888"));
  ("Elab_dDict.v_projectionFor", ("Vuna.Compiler.Elab.Dict.projectionFor", "Vuna/Compiler/Elab/Dict.vuna:1089"));
  ("Elab_dDict.v_renderDictTermAt", ("Vuna.Compiler.Elab.Dict.renderDictTermAt", "Vuna/Compiler/Elab/Dict.vuna:846"));
  ("Elab_dDict.v_replaceAt", ("Vuna.Compiler.Elab.Dict.replaceAt", "Vuna/Compiler/Elab/Dict.vuna:184"));
  ("Elab_dDict.v_resolveDictGoals", ("Vuna.Compiler.Elab.Dict.resolveDictGoals", "Vuna/Compiler/Elab/Dict.vuna:692"));
  ("Elab_dDict.v_resolveDictGoalsFuel", ("Vuna.Compiler.Elab.Dict.resolveDictGoalsFuel", "Vuna/Compiler/Elab/Dict.vuna:702"));
  ("Elab_dDict.v_resolveRowGoalsCtx", ("Vuna.Compiler.Elab.Dict.resolveRowGoalsCtx", "Vuna/Compiler/Elab/Dict.vuna:642"));
  ("Elab_dDict.v_resolveRowGoalsCtxGo", ("Vuna.Compiler.Elab.Dict.resolveRowGoalsCtxGo", "Vuna/Compiler/Elab/Dict.vuna:645"));
  ("Elab_dDict.v_rigidSearchFast", ("Vuna.Compiler.Elab.Dict.rigidSearchFast", "Vuna/Compiler/Elab/Dict.vuna:312"));
  ("Elab_dDict.v_rowMemDomName", ("Vuna.Compiler.Elab.Dict.rowMemDomName", "Vuna/Compiler/Elab/Dict.vuna:442"));
  ("Elab_dDict.v_rowNoDomName", ("Vuna.Compiler.Elab.Dict.rowNoDomName", "Vuna/Compiler/Elab/Dict.vuna:448"));
  ("Elab_dDict.v_rowYesCtorName", ("Vuna.Compiler.Elab.Dict.rowYesCtorName", "Vuna/Compiler/Elab/Dict.vuna:452"));
  ("Elab_dDict.v_rowYesDomName", ("Vuna.Compiler.Elab.Dict.rowYesDomName", "Vuna/Compiler/Elab/Dict.vuna:445"));
  ("Elab_dDict.v_searchCandidates", ("Vuna.Compiler.Elab.Dict.searchCandidates", "Vuna/Compiler/Elab/Dict.vuna:216"));
  ("Elab_dDict.v_searchInstFuel", ("Vuna.Compiler.Elab.Dict.searchInstFuel", "Vuna/Compiler/Elab/Dict.vuna:64"));
  ("Elab_dDict.v_searchInstance", ("Vuna.Compiler.Elab.Dict.searchInstance", "Vuna/Compiler/Elab/Dict.vuna:48"));
  ("Elab_dDict.v_searchInstanceIn", ("Vuna.Compiler.Elab.Dict.searchInstanceIn", "Vuna/Compiler/Elab/Dict.vuna:44"));
  ("Elab_dDict.v_showResolvedValue", ("Vuna.Compiler.Elab.Dict.showResolvedValue", "Vuna/Compiler/Elab/Dict.vuna:261"));
  ("Elab_dDict.v_solveDictCtxs", ("Vuna.Compiler.Elab.Dict.solveDictCtxs", "Vuna/Compiler/Elab/Dict.vuna:428"));
  ("Elab_dDict.v_solveRowMeta", ("Vuna.Compiler.Elab.Dict.solveRowMeta", "Vuna/Compiler/Elab/Dict.vuna:636"));
  ("Elab_dDict.v_solveTeleMetas", ("Vuna.Compiler.Elab.Dict.solveTeleMetas", "Vuna/Compiler/Elab/Dict.vuna:418"));
  ("Elab_dDict.v_specializeCmpTy", ("Vuna.Compiler.Elab.Dict.specializeCmpTy", "Vuna/Compiler/Elab/Dict.vuna:1210"));
  ("Elab_dDict.v_specializeEqTy", ("Vuna.Compiler.Elab.Dict.specializeEqTy", "Vuna/Compiler/Elab/Dict.vuna:1102"));
  ("Elab_dDict.v_specificInstances", ("Vuna.Compiler.Elab.Dict.specificInstances", "Vuna/Compiler/Elab/Dict.vuna:222"));
  ("Elab_dDict.v_substDictTerm", ("Vuna.Compiler.Elab.Dict.substDictTerm", "Vuna/Compiler/Elab/Dict.vuna:783"));
  ("Elab_dDict.v_substDictTermAlt", ("Vuna.Compiler.Elab.Dict.substDictTermAlt", "Vuna/Compiler/Elab/Dict.vuna:830"));
  ("Elab_dDict.v_substDictTermGo", ("Vuna.Compiler.Elab.Dict.substDictTermGo", "Vuna/Compiler/Elab/Dict.vuna:786"));
  ("Elab_dDict.v_termMetaId", ("Vuna.Compiler.Elab.Dict.termMetaId", "Vuna/Compiler/Elab/Dict.vuna:414"));
  ("Elab_dDict.v_termTypeNameOf", ("Vuna.Compiler.Elab.Dict.termTypeNameOf", "Vuna/Compiler/Elab/Dict.vuna:345"));
  ("Elab_dDict.v_thereCtorName", ("Vuna.Compiler.Elab.Dict.thereCtorName", "Vuna/Compiler/Elab/Dict.vuna:466"));
  ("Elab_dDict.v_tryMatchInst", ("Vuna.Compiler.Elab.Dict.tryMatchInst", "Vuna/Compiler/Elab/Dict.vuna:373"));
  ("Elab_dDict.v_tryResolveDictGoal", ("Vuna.Compiler.Elab.Dict.tryResolveDictGoal", "Vuna/Compiler/Elab/Dict.vuna:752"));
  ("Elab_dDict.v_tryViaArgs", ("Vuna.Compiler.Elab.Dict.tryViaArgs", "Vuna/Compiler/Elab/Dict.vuna:199"));
  ("Elab_dDict.v_tryViaDict", ("Vuna.Compiler.Elab.Dict.tryViaDict", "Vuna/Compiler/Elab/Dict.vuna:189"));
  ("Elab_dDict.v_valueDictFamily", ("Vuna.Compiler.Elab.Dict.valueDictFamily", "Vuna/Compiler/Elab/Dict.vuna:316"));
  ("Elab_dDict.v_valueHasRigidNVar", ("Vuna.Compiler.Elab.Dict.valueHasRigidNVar", "Vuna/Compiler/Elab/Dict.vuna:1005"));
  ("Elab_dDict.v_viaAllowsFam", ("Vuna.Compiler.Elab.Dict.viaAllowsFam", "Vuna/Compiler/Elab/Dict.vuna:115"));
  ("Elab_dDict.v_viaCandidateExists", ("Vuna.Compiler.Elab.Dict.viaCandidateExists", "Vuna/Compiler/Elab/Dict.vuna:177"));
  ("Elab_dDict.v_viaFieldType", ("Vuna.Compiler.Elab.Dict.viaFieldType", "Vuna/Compiler/Elab/Dict.vuna:132"));
  ("Elab_dDict.v_viaWrapperData", ("Vuna.Compiler.Elab.Dict.viaWrapperData", "Vuna/Compiler/Elab/Dict.vuna:152"));
  ("Elab_dDict.v_viaWrapperOf", ("Vuna.Compiler.Elab.Dict.viaWrapperOf", "Vuna/Compiler/Elab/Dict.vuna:145"));
  ("Elab_dDict.v_viaWrapperShape", ("Vuna.Compiler.Elab.Dict.viaWrapperShape", "Vuna/Compiler/Elab/Dict.vuna:159"));
  ("Elab_dDriver.v_addClassesEc", ("Vuna.Compiler.Elab.Driver.addClassesEc", "Vuna/Compiler/Elab/Driver.vuna:1581"));
  ("Elab_dDriver.v_addDatasEc", ("Vuna.Compiler.Elab.Driver.addDatasEc", "Vuna/Compiler/Elab/Driver.vuna:1573"));
  ("Elab_dDriver.v_addInstsEc", ("Vuna.Compiler.Elab.Driver.addInstsEc", "Vuna/Compiler/Elab/Driver.vuna:1577"));
  ("Elab_dDriver.v_allReplCtors", ("Vuna.Compiler.Elab.Driver.allReplCtors", "Vuna/Compiler/Elab/Driver.vuna:587"));
  ("Elab_dDriver.v_anyAltHasAnyMeta", ("Vuna.Compiler.Elab.Driver.anyAltHasAnyMeta", "Vuna/Compiler/Elab/Driver.vuna:1472"));
  ("Elab_dDriver.v_anyAltHasMeta", ("Vuna.Compiler.Elab.Driver.anyAltHasMeta", "Vuna/Compiler/Elab/Driver.vuna:1432"));
  ("Elab_dDriver.v_anyArgHasAnyMeta", ("Vuna.Compiler.Elab.Driver.anyArgHasAnyMeta", "Vuna/Compiler/Elab/Driver.vuna:1468"));
  ("Elab_dDriver.v_anyArgHasMeta", ("Vuna.Compiler.Elab.Driver.anyArgHasMeta", "Vuna/Compiler/Elab/Driver.vuna:1428"));
  ("Elab_dDriver.v_appendLastTerm", ("Vuna.Compiler.Elab.Driver.appendLastTerm", "Vuna/Compiler/Elab/Driver.vuna:626"));
  ("Elab_dDriver.v_applyDeclaredDictSubsts", ("Vuna.Compiler.Elab.Driver.applyDeclaredDictSubsts", "Vuna/Compiler/Elab/Driver.vuna:317"));
  ("Elab_dDriver.v_axiomSpanOf", ("Vuna.Compiler.Elab.Driver.axiomSpanOf", "Vuna/Compiler/Elab/Driver.vuna:520"));
  ("Elab_dDriver.v_axiomSpanPairs", ("Vuna.Compiler.Elab.Driver.axiomSpanPairs", "Vuna/Compiler/Elab/Driver.vuna:504"));
  ("Elab_dDriver.v_axiomSpansTbl", ("Vuna.Compiler.Elab.Driver.axiomSpansTbl", "Vuna/Compiler/Elab/Driver.vuna:501"));
  ("Elab_dDriver.v_builtinHostLabelOf", ("Vuna.Compiler.Elab.Driver.builtinHostLabelOf", "Vuna/Compiler/Elab/Driver.vuna:1112"));
  ("Elab_dDriver.v_candidateLe", ("Vuna.Compiler.Elab.Driver.candidateLe", "Vuna/Compiler/Elab/Driver.vuna:1599"));
  ("Elab_dDriver.v_checkAllDefined", ("Vuna.Compiler.Elab.Driver.checkAllDefined", "Vuna/Compiler/Elab/Driver.vuna:469"));
  ("Elab_dDriver.v_checkAllDefinedGo", ("Vuna.Compiler.Elab.Driver.checkAllDefinedGo", "Vuna/Compiler/Elab/Driver.vuna:477"));
  ("Elab_dDriver.v_checkExternArrayElem", ("Vuna.Compiler.Elab.Driver.checkExternArrayElem", "Vuna/Compiler/Elab/Driver.vuna:563"));
  ("Elab_dDriver.v_checkExternDomain", ("Vuna.Compiler.Elab.Driver.checkExternDomain", "Vuna/Compiler/Elab/Driver.vuna:550"));
  ("Elab_dDriver.v_checkExternTy", ("Vuna.Compiler.Elab.Driver.checkExternTy", "Vuna/Compiler/Elab/Driver.vuna:531"));
  ("Elab_dDriver.v_checkExternValue", ("Vuna.Compiler.Elab.Driver.checkExternValue", "Vuna/Compiler/Elab/Driver.vuna:534"));
  ("Elab_dDriver.v_clausesOfTbl", ("Vuna.Compiler.Elab.Driver.clausesOfTbl", "Vuna/Compiler/Elab/Driver.vuna:340"));
  ("Elab_dDriver.v_clausesTblGo", ("Vuna.Compiler.Elab.Driver.clausesTblGo", "Vuna/Compiler/Elab/Driver.vuna:327"));
  ("Elab_dDriver.v_clausesTblOf", ("Vuna.Compiler.Elab.Driver.clausesTblOf", "Vuna/Compiler/Elab/Driver.vuna:324"));
  ("Elab_dDriver.v_countNames", ("Vuna.Compiler.Elab.Driver.countNames", "Vuna/Compiler/Elab/Driver.vuna:40"));
  ("Elab_dDriver.v_ctxDepthOf", ("Vuna.Compiler.Elab.Driver.ctxDepthOf", "Vuna/Compiler/Elab/Driver.vuna:1481"));
  ("Elab_dDriver.v_ctxEntriesAt", ("Vuna.Compiler.Elab.Driver.ctxEntriesAt", "Vuna/Compiler/Elab/Driver.vuna:1512"));
  ("Elab_dDriver.v_ctxEntriesOf", ("Vuna.Compiler.Elab.Driver.ctxEntriesOf", "Vuna/Compiler/Elab/Driver.vuna:1509"));
  ("Elab_dDriver.v_declFunNames", ("Vuna.Compiler.Elab.Driver.declFunNames", "Vuna/Compiler/Elab/Driver.vuna:363"));
  ("Elab_dDriver.v_declaredDictBinders", ("Vuna.Compiler.Elab.Driver.declaredDictBinders", "Vuna/Compiler/Elab/Driver.vuna:250"));
  ("Elab_dDriver.v_declaredDictBindersGo", ("Vuna.Compiler.Elab.Driver.declaredDictBindersGo", "Vuna/Compiler/Elab/Driver.vuna:253"));
  ("Elab_dDriver.v_defAlreadyDone", ("Vuna.Compiler.Elab.Driver.defAlreadyDone", "Vuna/Compiler/Elab/Driver.vuna:346"));
  ("Elab_dDriver.v_defBodyPair", ("Vuna.Compiler.Elab.Driver.defBodyPair", "Vuna/Compiler/Elab/Driver.vuna:356"));
  ("Elab_dDriver.v_defBodyPairs", ("Vuna.Compiler.Elab.Driver.defBodyPairs", "Vuna/Compiler/Elab/Driver.vuna:353"));
  ("Elab_dDriver.v_dictCandidatesOf", ("Vuna.Compiler.Elab.Driver.dictCandidatesOf", "Vuna/Compiler/Elab/Driver.vuna:1587"));
  ("Elab_dDriver.v_dictDomMatches", ("Vuna.Compiler.Elab.Driver.dictDomMatches", "Vuna/Compiler/Elab/Driver.vuna:311"));
  ("Elab_dDriver.v_dictFamilyOfShown", ("Vuna.Compiler.Elab.Driver.dictFamilyOfShown", "Vuna/Compiler/Elab/Driver.vuna:1611"));
  ("Elab_dDriver.v_dtEvalExprIn", ("Vuna.Compiler.Elab.Driver.dtEvalExprIn", "Vuna/Compiler/Elab/Driver.vuna:795"));
  ("Elab_dDriver.v_dtEvalExprInInfo", ("Vuna.Compiler.Elab.Driver.dtEvalExprInInfo", "Vuna/Compiler/Elab/Driver.vuna:801"));
  ("Elab_dDriver.v_dtEvalExprInInfoCore", ("Vuna.Compiler.Elab.Driver.dtEvalExprInInfoCore", "Vuna/Compiler/Elab/Driver.vuna:806"));
  ("Elab_dDriver.v_ecOfProgram", ("Vuna.Compiler.Elab.Driver.ecOfProgram", "Vuna/Compiler/Elab/Driver.vuna:1560"));
  ("Elab_dDriver.v_elabBodies", ("Vuna.Compiler.Elab.Driver.elabBodies", "Vuna/Compiler/Elab/Driver.vuna:413"));
  ("Elab_dDriver.v_elabGoalsWithPrepared", ("Vuna.Compiler.Elab.Driver.elabGoalsWithPrepared", "Vuna/Compiler/Elab/Driver.vuna:1540"));
  ("Elab_dDriver.v_elabMemberConstraintDoms", ("Vuna.Compiler.Elab.Driver.elabMemberConstraintDoms", "Vuna/Compiler/Elab/Driver.vuna:172"));
  ("Elab_dDriver.v_elabOneDef", ("Vuna.Compiler.Elab.Driver.elabOneDef", "Vuna/Compiler/Elab/Driver.vuna:371"));
  ("Elab_dDriver.v_elabProgram", ("Vuna.Compiler.Elab.Driver.elabProgram", "Vuna/Compiler/Elab/Driver.vuna:1550"));
  ("Elab_dDriver.v_elabProgramCoreWithAux", ("Vuna.Compiler.Elab.Driver.elabProgramCoreWithAux", "Vuna/Compiler/Elab/Driver.vuna:996"));
  ("Elab_dDriver.v_elabProgramErrors", ("Vuna.Compiler.Elab.Driver.elabProgramErrors", "Vuna/Compiler/Elab/Driver.vuna:926"));
  ("Elab_dDriver.v_elabProgramFull", ("Vuna.Compiler.Elab.Driver.elabProgramFull", "Vuna/Compiler/Elab/Driver.vuna:912"));
  ("Elab_dDriver.v_elabProgramFullWith", ("Vuna.Compiler.Elab.Driver.elabProgramFullWith", "Vuna/Compiler/Elab/Driver.vuna:956"));
  ("Elab_dDriver.v_elabProgramFullWithAux", ("Vuna.Compiler.Elab.Driver.elabProgramFullWithAux", "Vuna/Compiler/Elab/Driver.vuna:962"));
  ("Elab_dDriver.v_elabProgramGo", ("Vuna.Compiler.Elab.Driver.elabProgramGo", "Vuna/Compiler/Elab/Driver.vuna:951"));
  ("Elab_dDriver.v_elabProgramGoWith", ("Vuna.Compiler.Elab.Driver.elabProgramGoWith", "Vuna/Compiler/Elab/Driver.vuna:982"));
  ("Elab_dDriver.v_elabProgramGoWithAux", ("Vuna.Compiler.Elab.Driver.elabProgramGoWithAux", "Vuna/Compiler/Elab/Driver.vuna:1331"));
  ("Elab_dDriver.v_elabSigDictBinders", ("Vuna.Compiler.Elab.Driver.elabSigDictBinders", "Vuna/Compiler/Elab/Driver.vuna:122"));
  ("Elab_dDriver.v_elabSigs", ("Vuna.Compiler.Elab.Driver.elabSigs", "Vuna/Compiler/Elab/Driver.vuna:76"));
  ("Elab_dDriver.v_elabSigsGo", ("Vuna.Compiler.Elab.Driver.elabSigsGo", "Vuna/Compiler/Elab/Driver.vuna:87"));
  ("Elab_dDriver.v_findDefByName", ("Vuna.Compiler.Elab.Driver.findDefByName", "Vuna/Compiler/Elab/Driver.vuna:1085"));
  ("Elab_dDriver.v_findDefWithMeta", ("Vuna.Compiler.Elab.Driver.findDefWithMeta", "Vuna/Compiler/Elab/Driver.vuna:1397"));
  ("Elab_dDriver.v_findGoal", ("Vuna.Compiler.Elab.Driver.findGoal", "Vuna/Compiler/Elab/Driver.vuna:1484"));
  ("Elab_dDriver.v_finishCore", ("Vuna.Compiler.Elab.Driver.finishCore", "Vuna/Compiler/Elab/Driver.vuna:1257"));
  ("Elab_dDriver.v_firstMatchDictBinder", ("Vuna.Compiler.Elab.Driver.firstMatchDictBinder", "Vuna/Compiler/Elab/Driver.vuna:306"));
  ("Elab_dDriver.v_funNamesTbl", ("Vuna.Compiler.Elab.Driver.funNamesTbl", "Vuna/Compiler/Elab/Driver.vuna:496"));
  ("Elab_dDriver.v_goalInfoOf", ("Vuna.Compiler.Elab.Driver.goalInfoOf", "Vuna/Compiler/Elab/Driver.vuna:1496"));
  ("Elab_dDriver.v_goalsOfProgram", ("Vuna.Compiler.Elab.Driver.goalsOfProgram", "Vuna/Compiler/Elab/Driver.vuna:1520"));
  ("Elab_dDriver.v_goalsOfProgramTolerant", ("Vuna.Compiler.Elab.Driver.goalsOfProgramTolerant", "Vuna/Compiler/Elab/Driver.vuna:1529"));
  ("Elab_dDriver.v_hasExplicitHasFieldInstance", ("Vuna.Compiler.Elab.Driver.hasExplicitHasFieldInstance", "Vuna/Compiler/Elab/Driver.vuna:887"));
  ("Elab_dDriver.v_hasFieldInstancesOfDecls", ("Vuna.Compiler.Elab.Driver.hasFieldInstancesOfDecls", "Vuna/Compiler/Elab/Driver.vuna:883"));
  ("Elab_dDriver.v_hasFunClause", ("Vuna.Compiler.Elab.Driver.hasFunClause", "Vuna/Compiler/Elab/Driver.vuna:512"));
  ("Elab_dDriver.v_hasHasFieldDecls", ("Vuna.Compiler.Elab.Driver.hasHasFieldDecls", "Vuna/Compiler/Elab/Driver.vuna:866"));
  ("Elab_dDriver.v_insertSigDicts", ("Vuna.Compiler.Elab.Driver.insertSigDicts", "Vuna/Compiler/Elab/Driver.vuna:217"));
  ("Elab_dDriver.v_insertSigDictsRev", ("Vuna.Compiler.Elab.Driver.insertSigDictsRev", "Vuna/Compiler/Elab/Driver.vuna:230"));
  ("Elab_dDriver.v_insertSigMembers", ("Vuna.Compiler.Elab.Driver.insertSigMembers", "Vuna/Compiler/Elab/Driver.vuna:186"));
  ("Elab_dDriver.v_insertSigMembersRev", ("Vuna.Compiler.Elab.Driver.insertSigMembersRev", "Vuna/Compiler/Elab/Driver.vuna:199"));
  ("Elab_dDriver.v_instCandidate", ("Vuna.Compiler.Elab.Driver.instCandidate", "Vuna/Compiler/Elab/Driver.vuna:1603"));
  ("Elab_dDriver.v_isBuiltinHostLabel", ("Vuna.Compiler.Elab.Driver.isBuiltinHostLabel", "Vuna/Compiler/Elab/Driver.vuna:1107"));
  ("Elab_dDriver.v_isBuiltinHostRowValue", ("Vuna.Compiler.Elab.Driver.isBuiltinHostRowValue", "Vuna/Compiler/Elab/Driver.vuna:1122"));
  ("Elab_dDriver.v_isMemberConstraintExpr", ("Vuna.Compiler.Elab.Driver.isMemberConstraintExpr", "Vuna/Compiler/Elab/Driver.vuna:158"));
  ("Elab_dDriver.v_isNilRowTerm", ("Vuna.Compiler.Elab.Driver.isNilRowTerm", "Vuna/Compiler/Elab/Driver.vuna:1100"));
  ("Elab_dDriver.v_isReplAtom", ("Vuna.Compiler.Elab.Driver.isReplAtom", "Vuna/Compiler/Elab/Driver.vuna:747"));
  ("Elab_dDriver.v_keptCtorArgs", ("Vuna.Compiler.Elab.Driver.keptCtorArgs", "Vuna/Compiler/Elab/Driver.vuna:764"));
  ("Elab_dDriver.v_leadingImplicitCtx", ("Vuna.Compiler.Elab.Driver.leadingImplicitCtx", "Vuna/Compiler/Elab/Driver.vuna:105"));
  ("Elab_dDriver.v_leadingImplicitCtxGo", ("Vuna.Compiler.Elab.Driver.leadingImplicitCtxGo", "Vuna/Compiler/Elab/Driver.vuna:108"));
  ("Elab_dDriver.v_mainActionOf", ("Vuna.Compiler.Elab.Driver.mainActionOf", "Vuna/Compiler/Elab/Driver.vuna:1092"));
  ("Elab_dDriver.v_mainArityErr", ("Vuna.Compiler.Elab.Driver.mainArityErr", "Vuna/Compiler/Elab/Driver.vuna:1179"));
  ("Elab_dDriver.v_mainEntryRowCheck", ("Vuna.Compiler.Elab.Driver.mainEntryRowCheck", "Vuna/Compiler/Elab/Driver.vuna:1138"));
  ("Elab_dDriver.v_mainHasParams", ("Vuna.Compiler.Elab.Driver.mainHasParams", "Vuna/Compiler/Elab/Driver.vuna:1173"));
  ("Elab_dDriver.v_mainShowBuiltinTy", ("Vuna.Compiler.Elab.Driver.mainShowBuiltinTy", "Vuna/Compiler/Elab/Driver.vuna:1164"));
  ("Elab_dDriver.v_mainShowMissing", ("Vuna.Compiler.Elab.Driver.mainShowMissing", "Vuna/Compiler/Elab/Driver.vuna:1250"));
  ("Elab_dDriver.v_matchedBodies", ("Vuna.Compiler.Elab.Driver.matchedBodies", "Vuna/Compiler/Elab/Driver.vuna:1210"));
  ("Elab_dDriver.v_maybeAddHasFieldInstances", ("Vuna.Compiler.Elab.Driver.maybeAddHasFieldInstances", "Vuna/Compiler/Elab/Driver.vuna:901"));
  ("Elab_dDriver.v_memberSugarExpr", ("Vuna.Compiler.Elab.Driver.memberSugarExpr", "Vuna/Compiler/Elab/Driver.vuna:164"));
  ("Elab_dDriver.v_metaOwnerHint", ("Vuna.Compiler.Elab.Driver.metaOwnerHint", "Vuna/Compiler/Elab/Driver.vuna:1391"));
  ("Elab_dDriver.v_prependSigDicts", ("Vuna.Compiler.Elab.Driver.prependSigDicts", "Vuna/Compiler/Elab/Driver.vuna:225"));
  ("Elab_dDriver.v_prependSigMembers", ("Vuna.Compiler.Elab.Driver.prependSigMembers", "Vuna/Compiler/Elab/Driver.vuna:194"));
  ("Elab_dDriver.v_renderReplApp", ("Vuna.Compiler.Elab.Driver.renderReplApp", "Vuna/Compiler/Elab/Driver.vuna:605"));
  ("Elab_dDriver.v_renderReplArg", ("Vuna.Compiler.Elab.Driver.renderReplArg", "Vuna/Compiler/Elab/Driver.vuna:738"));
  ("Elab_dDriver.v_renderReplArgs", ("Vuna.Compiler.Elab.Driver.renderReplArgs", "Vuna/Compiler/Elab/Driver.vuna:730"));
  ("Elab_dDriver.v_renderReplCtor", ("Vuna.Compiler.Elab.Driver.renderReplCtor", "Vuna/Compiler/Elab/Driver.vuna:657"));
  ("Elab_dDriver.v_renderReplGeneric", ("Vuna.Compiler.Elab.Driver.renderReplGeneric", "Vuna/Compiler/Elab/Driver.vuna:726"));
  ("Elab_dDriver.v_renderReplList", ("Vuna.Compiler.Elab.Driver.renderReplList", "Vuna/Compiler/Elab/Driver.vuna:675"));
  ("Elab_dDriver.v_renderReplListTail", ("Vuna.Compiler.Elab.Driver.renderReplListTail", "Vuna/Compiler/Elab/Driver.vuna:688"));
  ("Elab_dDriver.v_renderReplPair", ("Vuna.Compiler.Elab.Driver.renderReplPair", "Vuna/Compiler/Elab/Driver.vuna:708"));
  ("Elab_dDriver.v_renderReplTerm", ("Vuna.Compiler.Elab.Driver.renderReplTerm", "Vuna/Compiler/Elab/Driver.vuna:591"));
  ("Elab_dDriver.v_renderReplUnary", ("Vuna.Compiler.Elab.Driver.renderReplUnary", "Vuna/Compiler/Elab/Driver.vuna:717"));
  ("Elab_dDriver.v_replJustName", ("Vuna.Compiler.Elab.Driver.replJustName", "Vuna/Compiler/Elab/Driver.vuna:788"));
  ("Elab_dDriver.v_replListConsName", ("Vuna.Compiler.Elab.Driver.replListConsName", "Vuna/Compiler/Elab/Driver.vuna:781"));
  ("Elab_dDriver.v_replListNilName", ("Vuna.Compiler.Elab.Driver.replListNilName", "Vuna/Compiler/Elab/Driver.vuna:777"));
  ("Elab_dDriver.v_replNatSuccName", ("Vuna.Compiler.Elab.Driver.replNatSuccName", "Vuna/Compiler/Elab/Driver.vuna:634"));
  ("Elab_dDriver.v_replNatValue", ("Vuna.Compiler.Elab.Driver.replNatValue", "Vuna/Compiler/Elab/Driver.vuna:637"));
  ("Elab_dDriver.v_replNatZeroName", ("Vuna.Compiler.Elab.Driver.replNatZeroName", "Vuna/Compiler/Elab/Driver.vuna:630"));
  ("Elab_dDriver.v_replNothingName", ("Vuna.Compiler.Elab.Driver.replNothingName", "Vuna/Compiler/Elab/Driver.vuna:792"));
  ("Elab_dDriver.v_replPairName", ("Vuna.Compiler.Elab.Driver.replPairName", "Vuna/Compiler/Elab/Driver.vuna:784"));
  ("Elab_dDriver.v_replShortName", ("Vuna.Compiler.Elab.Driver.replShortName", "Vuna/Compiler/Elab/Driver.vuna:616"));
  ("Elab_dDriver.v_resolveDictGoalsFix", ("Vuna.Compiler.Elab.Driver.resolveDictGoalsFix", "Vuna/Compiler/Elab/Driver.vuna:1349"));
  ("Elab_dDriver.v_resolveDictGoalsFixGo", ("Vuna.Compiler.Elab.Driver.resolveDictGoalsFixGo", "Vuna/Compiler/Elab/Driver.vuna:1355"));
  ("Elab_dDriver.v_resumeBodies", ("Vuna.Compiler.Elab.Driver.resumeBodies", "Vuna/Compiler/Elab/Driver.vuna:406"));
  ("Elab_dDriver.v_rezonkDefs", ("Vuna.Compiler.Elab.Driver.rezonkDefs", "Vuna/Compiler/Elab/Driver.vuna:1338"));
  ("Elab_dDriver.v_shortRecordMetas", ("Vuna.Compiler.Elab.Driver.shortRecordMetas", "Vuna/Compiler/Elab/Driver.vuna:874"));
  ("Elab_dDriver.v_showCounters", ("Vuna.Compiler.Elab.Driver.showCounters", "Vuna/Compiler/Elab/Driver.vuna:34"));
  ("Elab_dDriver.v_showValueRepl", ("Vuna.Compiler.Elab.Driver.showValueRepl", "Vuna/Compiler/Elab/Driver.vuna:584"));
  ("Elab_dDriver.v_sigDictName", ("Vuna.Compiler.Elab.Driver.sigDictName", "Vuna/Compiler/Elab/Driver.vuna:235"));
  ("Elab_dDriver.v_sigMemberName", ("Vuna.Compiler.Elab.Driver.sigMemberName", "Vuna/Compiler/Elab/Driver.vuna:208"));
  ("Elab_dDriver.v_solveDeclaredDictGoals", ("Vuna.Compiler.Elab.Driver.solveDeclaredDictGoals", "Vuna/Compiler/Elab/Driver.vuna:264"));
  ("Elab_dDriver.v_solveDeclaredDictGoalsGo", ("Vuna.Compiler.Elab.Driver.solveDeclaredDictGoalsGo", "Vuna/Compiler/Elab/Driver.vuna:281"));
  ("Elab_dDriver.v_sortCandidates", ("Vuna.Compiler.Elab.Driver.sortCandidates", "Vuna/Compiler/Elab/Driver.vuna:1596"));
  ("Elab_dDriver.v_spineOf", ("Vuna.Compiler.Elab.Driver.spineOf", "Vuna/Compiler/Elab/Driver.vuna:619"));
  ("Elab_dDriver.v_splitMemberCtx", ("Vuna.Compiler.Elab.Driver.splitMemberCtx", "Vuna/Compiler/Elab/Driver.vuna:148"));
  ("Elab_dDriver.v_synthMainShow", ("Vuna.Compiler.Elab.Driver.synthMainShow", "Vuna/Compiler/Elab/Driver.vuna:1187"));
  ("Elab_dDriver.v_synthMainShowGo", ("Vuna.Compiler.Elab.Driver.synthMainShowGo", "Vuna/Compiler/Elab/Driver.vuna:1226"));
  ("Elab_dDriver.v_synthMainShowInner", ("Vuna.Compiler.Elab.Driver.synthMainShowInner", "Vuna/Compiler/Elab/Driver.vuna:1219"));
  ("Elab_dDriver.v_takeWhileDictChar", ("Vuna.Compiler.Elab.Driver.takeWhileDictChar", "Vuna/Compiler/Elab/Driver.vuna:1622"));
  ("Elab_dDriver.v_termHasAnyMeta", ("Vuna.Compiler.Elab.Driver.termHasAnyMeta", "Vuna/Compiler/Elab/Driver.vuna:1442"));
  ("Elab_dDriver.v_termHasAnyMetaMaybe", ("Vuna.Compiler.Elab.Driver.termHasAnyMetaMaybe", "Vuna/Compiler/Elab/Driver.vuna:1476"));
  ("Elab_dDriver.v_termHasMeta", ("Vuna.Compiler.Elab.Driver.termHasMeta", "Vuna/Compiler/Elab/Driver.vuna:1402"));
  ("Elab_dDriver.v_termHasMetaMaybe", ("Vuna.Compiler.Elab.Driver.termHasMetaMaybe", "Vuna/Compiler/Elab/Driver.vuna:1436"));
  ("Elab_dDriver.v_unsolvedFromRelevant", ("Vuna.Compiler.Elab.Driver.unsolvedFromRelevant", "Vuna/Compiler/Elab/Driver.vuna:57"));
  ("Elab_dDriver.v_unsolvedFromRelevantGo", ("Vuna.Compiler.Elab.Driver.unsolvedFromRelevantGo", "Vuna/Compiler/Elab/Driver.vuna:61"));
  ("Elab_dDriver.v_unsolvedMessage", ("Vuna.Compiler.Elab.Driver.unsolvedMessage", "Vuna/Compiler/Elab/Driver.vuna:1367"));
  ("Elab_dDriver.v_unsolvedMeta", ("Vuna.Compiler.Elab.Driver.unsolvedMeta", "Vuna/Compiler/Elab/Driver.vuna:50"));
  ("Elab_dDriver.v_withMetaCreated", ("Vuna.Compiler.Elab.Driver.withMetaCreated", "Vuna/Compiler/Elab/Driver.vuna:1628"));
  ("Elab_dDriver.v_zipKeptArgs", ("Vuna.Compiler.Elab.Driver.zipKeptArgs", "Vuna/Compiler/Elab/Driver.vuna:770"));
  ("Elab_dDriver.v_zonkGoal", ("Vuna.Compiler.Elab.Driver.zonkGoal", "Vuna/Compiler/Elab/Driver.vuna:1505"));
  ("Elab_dInstCoherence.v_anyInstanceExact", ("Vuna.Compiler.Elab.InstCoherence.anyInstanceExact", "Vuna/Compiler/Elab/InstCoherence.vuna:44"));
  ("Elab_dInstCoherence.v_anyInstanceOverlap", ("Vuna.Compiler.Elab.InstCoherence.anyInstanceOverlap", "Vuna/Compiler/Elab/InstCoherence.vuna:54"));
  ("Elab_dInstCoherence.v_findInstanceClash", ("Vuna.Compiler.Elab.InstCoherence.findInstanceClash", "Vuna/Compiler/Elab/InstCoherence.vuna:35"));
  ("Elab_dInstCoherence.v_headsAlphaEqual", ("Vuna.Compiler.Elab.InstCoherence.headsAlphaEqual", "Vuna/Compiler/Elab/InstCoherence.vuna:72"));
  ("Elab_dInstCoherence.v_headsOverlap", ("Vuna.Compiler.Elab.InstCoherence.headsOverlap", "Vuna/Compiler/Elab/InstCoherence.vuna:90"));
  ("Elab_dInstCoherence.v_headsOverlapOne", ("Vuna.Compiler.Elab.InstCoherence.headsOverlapOne", "Vuna/Compiler/Elab/InstCoherence.vuna:100"));
  ("Elab_dInstCoherence.v_instanceExactQuiet", ("Vuna.Compiler.Elab.InstCoherence.instanceExactQuiet", "Vuna/Compiler/Elab/InstCoherence.vuna:67"));
  ("Elab_dInstCoherence.v_teleAlphaEnv", ("Vuna.Compiler.Elab.InstCoherence.teleAlphaEnv", "Vuna/Compiler/Elab/InstCoherence.vuna:78"));
  ("Elab_dInstCoherence.v_teleAlphaEnvGo", ("Vuna.Compiler.Elab.InstCoherence.teleAlphaEnvGo", "Vuna/Compiler/Elab/InstCoherence.vuna:81"));
  ("Elab_dInstCoherence.v_teleGlobalEnv", ("Vuna.Compiler.Elab.InstCoherence.teleGlobalEnv", "Vuna/Compiler/Elab/InstCoherence.vuna:111"));
  ("Elab_dInstCoherence.v_teleGlobalEnvGo", ("Vuna.Compiler.Elab.InstCoherence.teleGlobalEnvGo", "Vuna/Compiler/Elab/InstCoherence.vuna:114"));
  ("Elab_dInstName.v_argNameOf", ("Vuna.Compiler.Elab.InstName.argNameOf", "Vuna/Compiler/Elab/InstName.vuna:70"));
  ("Elab_dInstName.v_argSuffix", ("Vuna.Compiler.Elab.InstName.argSuffix", "Vuna/Compiler/Elab/InstName.vuna:53"));
  ("Elab_dInstName.v_argSuffixTail", ("Vuna.Compiler.Elab.InstName.argSuffixTail", "Vuna/Compiler/Elab/InstName.vuna:48"));
  ("Elab_dInstName.v_derivedInstName", ("Vuna.Compiler.Elab.InstName.derivedInstName", "Vuna/Compiler/Elab/InstName.vuna:43"));
  ("Elab_dInstName.v_exprNameFor", ("Vuna.Compiler.Elab.InstName.exprNameFor", "Vuna/Compiler/Elab/InstName.vuna:59"));
  ("Elab_dInstName.v_instanceHeadName", ("Vuna.Compiler.Elab.InstName.instanceHeadName", "Vuna/Compiler/Elab/InstName.vuna:14"));
  ("Elab_dInstName.v_instanceName", ("Vuna.Compiler.Elab.InstName.instanceName", "Vuna/Compiler/Elab/InstName.vuna:32"));
  ("Elab_dInstName.v_sanitizeInstName", ("Vuna.Compiler.Elab.InstName.sanitizeInstName", "Vuna/Compiler/Elab/InstName.vuna:38"));
  ("Elab_dMatch.v_addNameDistinct", ("Vuna.Compiler.Elab.Match.addNameDistinct", "Vuna/Compiler/Elab/Match.vuna:543"));
  ("Elab_dMatch.v_allCtorHeads", ("Vuna.Compiler.Elab.Match.allCtorHeads", "Vuna/Compiler/Elab/Match.vuna:298"));
  ("Elab_dMatch.v_allEmptyPats", ("Vuna.Compiler.Elab.Match.allEmptyPats", "Vuna/Compiler/Elab/Match.vuna:337"));
  ("Elab_dMatch.v_allIrrefutablePats", ("Vuna.Compiler.Elab.Match.allIrrefutablePats", "Vuna/Compiler/Elab/Match.vuna:328"));
  ("Elab_dMatch.v_allVarHeads", ("Vuna.Compiler.Elab.Match.allVarHeads", "Vuna/Compiler/Elab/Match.vuna:353"));
  ("Elab_dMatch.v_allVarPats", ("Vuna.Compiler.Elab.Match.allVarPats", "Vuna/Compiler/Elab/Match.vuna:28"));
  ("Elab_dMatch.v_allWildPats", ("Vuna.Compiler.Elab.Match.allWildPats", "Vuna/Compiler/Elab/Match.vuna:309"));
  ("Elab_dMatch.v_arityOf", ("Vuna.Compiler.Elab.Match.arityOf", "Vuna/Compiler/Elab/Match.vuna:78"));
  ("Elab_dMatch.v_asColumn", ("Vuna.Compiler.Elab.Match.asColumn", "Vuna/Compiler/Elab/Match.vuna:196"));
  ("Elab_dMatch.v_asInnerClause", ("Vuna.Compiler.Elab.Match.asInnerClause", "Vuna/Compiler/Elab/Match.vuna:205"));
  ("Elab_dMatch.v_bindNames", ("Vuna.Compiler.Elab.Match.bindNames", "Vuna/Compiler/Elab/Match.vuna:459"));
  ("Elab_dMatch.v_bodyOfFirst", ("Vuna.Compiler.Elab.Match.bodyOfFirst", "Vuna/Compiler/Elab/Match.vuna:344"));
  ("Elab_dMatch.v_buildColumnExpr", ("Vuna.Compiler.Elab.Match.buildColumnExpr", "Vuna/Compiler/Elab/Match.vuna:163"));
  ("Elab_dMatch.v_buildColumnExprPruned", ("Vuna.Compiler.Elab.Match.buildColumnExprPruned", "Vuna/Compiler/Elab/Match.vuna:170"));
  ("Elab_dMatch.v_canonHeads", ("Vuna.Compiler.Elab.Match.canonHeads", "Vuna/Compiler/Elab/Match.vuna:260"));
  ("Elab_dMatch.v_clauseArityTooMany", ("Vuna.Compiler.Elab.Match.clauseArityTooMany", "Vuna/Compiler/Elab/Match.vuna:40"));
  ("Elab_dMatch.v_clausesForCtor", ("Vuna.Compiler.Elab.Match.clausesForCtor", "Vuna/Compiler/Elab/Match.vuna:551"));
  ("Elab_dMatch.v_ctorAltList", ("Vuna.Compiler.Elab.Match.ctorAltList", "Vuna/Compiler/Elab/Match.vuna:483"));
  ("Elab_dMatch.v_ctorAltListGo", ("Vuna.Compiler.Elab.Match.ctorAltListGo", "Vuna/Compiler/Elab/Match.vuna:490"));
  ("Elab_dMatch.v_ctorColumn", ("Vuna.Compiler.Elab.Match.ctorColumn", "Vuna/Compiler/Elab/Match.vuna:229"));
  ("Elab_dMatch.v_ctorHeads", ("Vuna.Compiler.Elab.Match.ctorHeads", "Vuna/Compiler/Elab/Match.vuna:533"));
  ("Elab_dMatch.v_ctorSubPatCount", ("Vuna.Compiler.Elab.Match.ctorSubPatCount", "Vuna/Compiler/Elab/Match.vuna:506"));
  ("Elab_dMatch.v_fallbackAltList", ("Vuna.Compiler.Elab.Match.fallbackAltList", "Vuna/Compiler/Elab/Match.vuna:579"));
  ("Elab_dMatch.v_familyCovered", ("Vuna.Compiler.Elab.Match.familyCovered", "Vuna/Compiler/Elab/Match.vuna:273"));
  ("Elab_dMatch.v_familyOfCtor", ("Vuna.Compiler.Elab.Match.familyOfCtor", "Vuna/Compiler/Elab/Match.vuna:242"));
  ("Elab_dMatch.v_familyOfHead", ("Vuna.Compiler.Elab.Match.familyOfHead", "Vuna/Compiler/Elab/Match.vuna:250"));
  ("Elab_dMatch.v_filterFallback", ("Vuna.Compiler.Elab.Match.filterFallback", "Vuna/Compiler/Elab/Match.vuna:569"));
  ("Elab_dMatch.v_filterLitBranch", ("Vuna.Compiler.Elab.Match.filterLitBranch", "Vuna/Compiler/Elab/Match.vuna:127"));
  ("Elab_dMatch.v_firstPatSpan", ("Vuna.Compiler.Elab.Match.firstPatSpan", "Vuna/Compiler/Elab/Match.vuna:220"));
  ("Elab_dMatch.v_firstPats", ("Vuna.Compiler.Elab.Match.firstPats", "Vuna/Compiler/Elab/Match.vuna:317"));
  ("Elab_dMatch.v_hasAsHead", ("Vuna.Compiler.Elab.Match.hasAsHead", "Vuna/Compiler/Elab/Match.vuna:189"));
  ("Elab_dMatch.v_hasCtorHead", ("Vuna.Compiler.Elab.Match.hasCtorHead", "Vuna/Compiler/Elab/Match.vuna:287"));
  ("Elab_dMatch.v_innerOfHead", ("Vuna.Compiler.Elab.Match.innerOfHead", "Vuna/Compiler/Elab/Match.vuna:209"));
  ("Elab_dMatch.v_irrefutablePat", ("Vuna.Compiler.Elab.Match.irrefutablePat", "Vuna/Compiler/Elab/Match.vuna:322"));
  ("Elab_dMatch.v_isVarPatD", ("Vuna.Compiler.Elab.Match.isVarPatD", "Vuna/Compiler/Elab/Match.vuna:348"));
  ("Elab_dMatch.v_isWildPat", ("Vuna.Compiler.Elab.Match.isWildPat", "Vuna/Compiler/Elab/Match.vuna:313"));
  ("Elab_dMatch.v_litAltExpr", ("Vuna.Compiler.Elab.Match.litAltExpr", "Vuna/Compiler/Elab/Match.vuna:99"));
  ("Elab_dMatch.v_litAltExprGo", ("Vuna.Compiler.Elab.Match.litAltExprGo", "Vuna/Compiler/Elab/Match.vuna:103"));
  ("Elab_dMatch.v_litBranchClauses", ("Vuna.Compiler.Elab.Match.litBranchClauses", "Vuna/Compiler/Elab/Match.vuna:124"));
  ("Elab_dMatch.v_litPatExpr", ("Vuna.Compiler.Elab.Match.litPatExpr", "Vuna/Compiler/Elab/Match.vuna:157"));
  ("Elab_dMatch.v_litPatMatches", ("Vuna.Compiler.Elab.Match.litPatMatches", "Vuna/Compiler/Elab/Match.vuna:141"));
  ("Elab_dMatch.v_literalBranchBody", ("Vuna.Compiler.Elab.Match.literalBranchBody", "Vuna/Compiler/Elab/Match.vuna:137"));
  ("Elab_dMatch.v_matrixOf", ("Vuna.Compiler.Elab.Match.matrixOf", "Vuna/Compiler/Elab/Match.vuna:71"));
  ("Elab_dMatch.v_multiToCaseExpr", ("Vuna.Compiler.Elab.Match.multiToCaseExpr", "Vuna/Compiler/Elab/Match.vuna:60"));
  ("Elab_dMatch.v_multiToExpr", ("Vuna.Compiler.Elab.Match.multiToExpr", "Vuna/Compiler/Elab/Match.vuna:45"));
  ("Elab_dMatch.v_paramNames", ("Vuna.Compiler.Elab.Match.paramNames", "Vuna/Compiler/Elab/Match.vuna:82"));
  ("Elab_dMatch.v_paramNamesGo", ("Vuna.Compiler.Elab.Match.paramNamesGo", "Vuna/Compiler/Elab/Match.vuna:85"));
  ("Elab_dMatch.v_patNamesOf", ("Vuna.Compiler.Elab.Match.patNamesOf", "Vuna/Compiler/Elab/Match.vuna:463"));
  ("Elab_dMatch.v_prepFallbacks", ("Vuna.Compiler.Elab.Match.prepFallbacks", "Vuna/Compiler/Elab/Match.vuna:588"));
  ("Elab_dMatch.v_prepVarColumn", ("Vuna.Compiler.Elab.Match.prepVarColumn", "Vuna/Compiler/Elab/Match.vuna:370"));
  ("Elab_dMatch.v_pruneRows", ("Vuna.Compiler.Elab.Match.pruneRows", "Vuna/Compiler/Elab/Match.vuna:333"));
  ("Elab_dMatch.v_renameAlt", ("Vuna.Compiler.Elab.Match.renameAlt", "Vuna/Compiler/Elab/Match.vuna:472"));
  ("Elab_dMatch.v_renameAsHead", ("Vuna.Compiler.Elab.Match.renameAsHead", "Vuna/Compiler/Elab/Match.vuna:213"));
  ("Elab_dMatch.v_renameBind", ("Vuna.Compiler.Elab.Match.renameBind", "Vuna/Compiler/Elab/Match.vuna:445"));
  ("Elab_dMatch.v_renameExpr", ("Vuna.Compiler.Elab.Match.renameExpr", "Vuna/Compiler/Elab/Match.vuna:381"));
  ("Elab_dMatch.v_renameExprUnless", ("Vuna.Compiler.Elab.Match.renameExprUnless", "Vuna/Compiler/Elab/Match.vuna:441"));
  ("Elab_dMatch.v_renameFieldValue", ("Vuna.Compiler.Elab.Match.renameFieldValue", "Vuna/Compiler/Elab/Match.vuna:448"));
  ("Elab_dMatch.v_renameInterpParts", ("Vuna.Compiler.Elab.Match.renameInterpParts", "Vuna/Compiler/Elab/Match.vuna:434"));
  ("Elab_dMatch.v_renameLocalClause", ("Vuna.Compiler.Elab.Match.renameLocalClause", "Vuna/Compiler/Elab/Match.vuna:453"));
  ("Elab_dMatch.v_stripAsPat", ("Vuna.Compiler.Elab.Match.stripAsPat", "Vuna/Compiler/Elab/Match.vuna:74"));
  ("Elab_dMatch.v_stripFirstCol", ("Vuna.Compiler.Elab.Match.stripFirstCol", "Vuna/Compiler/Elab/Match.vuna:360"));
  ("Elab_dMatch.v_subNamesFor", ("Vuna.Compiler.Elab.Match.subNamesFor", "Vuna/Compiler/Elab/Match.vuna:520"));
  ("Elab_dMatch.v_subNamesForGo", ("Vuna.Compiler.Elab.Match.subNamesForGo", "Vuna/Compiler/Elab/Match.vuna:523"));
  ("Elab_dMatch.v_subNamesForGoGo", ("Vuna.Compiler.Elab.Match.subNamesForGoGo", "Vuna/Compiler/Elab/Match.vuna:526"));
  ("Elab_dMatch.v_wrapLambdas", ("Vuna.Compiler.Elab.Match.wrapLambdas", "Vuna/Compiler/Elab/Match.vuna:92"));
  ("Elab_dMeta.v_allTeleArgs", ("Vuna.Compiler.Elab.Meta.allTeleArgs", "Vuna/Compiler/Elab/Meta.vuna:772"));
  ("Elab_dMeta.v_anyCtorIndexed", ("Vuna.Compiler.Elab.Meta.anyCtorIndexed", "Vuna/Compiler/Elab/Meta.vuna:1451"));
  ("Elab_dMeta.v_anyLinearVals", ("Vuna.Compiler.Elab.Meta.anyLinearVals", "Vuna/Compiler/Elab/Meta.vuna:1161"));
  ("Elab_dMeta.v_anyNonVarArg", ("Vuna.Compiler.Elab.Meta.anyNonVarArg", "Vuna/Compiler/Elab/Meta.vuna:1464"));
  ("Elab_dMeta.v_baseNameOf", ("Vuna.Compiler.Elab.Meta.baseNameOf", "Vuna/Compiler/Elab/Meta.vuna:1425"));
  ("Elab_dMeta.v_binderRig", ("Vuna.Compiler.Elab.Meta.binderRig", "Vuna/Compiler/Elab/Meta.vuna:952"));
  ("Elab_dMeta.v_boolCtorTerm", ("Vuna.Compiler.Elab.Meta.boolCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:87"));
  ("Elab_dMeta.v_boolCtorValue", ("Vuna.Compiler.Elab.Meta.boolCtorValue", "Vuna/Compiler/Elab/Meta.vuna:83"));
  ("Elab_dMeta.v_candidatesInFamily", ("Vuna.Compiler.Elab.Meta.candidatesInFamily", "Vuna/Compiler/Elab/Meta.vuna:472"));
  ("Elab_dMeta.v_castErased", ("Vuna.Compiler.Elab.Meta.castErased", "Vuna/Compiler/Elab/Meta.vuna:1091"));
  ("Elab_dMeta.v_collectDataDecls", ("Vuna.Compiler.Elab.Meta.collectDataDecls", "Vuna/Compiler/Elab/Meta.vuna:306"));
  ("Elab_dMeta.v_collectInstDecls", ("Vuna.Compiler.Elab.Meta.collectInstDecls", "Vuna/Compiler/Elab/Meta.vuna:702"));
  ("Elab_dMeta.v_collectSigOne", ("Vuna.Compiler.Elab.Meta.collectSigOne", "Vuna/Compiler/Elab/Meta.vuna:289"));
  ("Elab_dMeta.v_collectSigs", ("Vuna.Compiler.Elab.Meta.collectSigs", "Vuna/Compiler/Elab/Meta.vuna:256"));
  ("Elab_dMeta.v_collectSigsInto", ("Vuna.Compiler.Elab.Meta.collectSigsInto", "Vuna/Compiler/Elab/Meta.vuna:270"));
  ("Elab_dMeta.v_collectTraitDecls", ("Vuna.Compiler.Elab.Meta.collectTraitDecls", "Vuna/Compiler/Elab/Meta.vuna:695"));
  ("Elab_dMeta.v_convEc", ("Vuna.Compiler.Elab.Meta.convEc", "Vuna/Compiler/Elab/Meta.vuna:125"));
  ("Elab_dMeta.v_ctorAppTerm", ("Vuna.Compiler.Elab.Meta.ctorAppTerm", "Vuna/Compiler/Elab/Meta.vuna:1333"));
  ("Elab_dMeta.v_ctorAppTermEc", ("Vuna.Compiler.Elab.Meta.ctorAppTermEc", "Vuna/Compiler/Elab/Meta.vuna:1320"));
  ("Elab_dMeta.v_ctorFamilyIs", ("Vuna.Compiler.Elab.Meta.ctorFamilyIs", "Vuna/Compiler/Elab/Meta.vuna:465"));
  ("Elab_dMeta.v_ctorFamilyNameOf", ("Vuna.Compiler.Elab.Meta.ctorFamilyNameOf", "Vuna/Compiler/Elab/Meta.vuna:427"));
  ("Elab_dMeta.v_ctorFamilyTable", ("Vuna.Compiler.Elab.Meta.ctorFamilyTable", "Vuna/Compiler/Elab/Meta.vuna:1439"));
  ("Elab_dMeta.v_ctorGlobals", ("Vuna.Compiler.Elab.Meta.ctorGlobals", "Vuna/Compiler/Elab/Meta.vuna:662"));
  ("Elab_dMeta.v_ctorLinearName", ("Vuna.Compiler.Elab.Meta.ctorLinearName", "Vuna/Compiler/Elab/Meta.vuna:1171"));
  ("Elab_dMeta.v_ctorRefTerm", ("Vuna.Compiler.Elab.Meta.ctorRefTerm", "Vuna/Compiler/Elab/Meta.vuna:1306"));
  ("Elab_dMeta.v_ctorRefTermEc", ("Vuna.Compiler.Elab.Meta.ctorRefTermEc", "Vuna/Compiler/Elab/Meta.vuna:1297"));
  ("Elab_dMeta.v_ctorResultIndexed", ("Vuna.Compiler.Elab.Meta.ctorResultIndexed", "Vuna/Compiler/Elab/Meta.vuna:1455"));
  ("Elab_dMeta.v_ctxHasLinear", ("Vuna.Compiler.Elab.Meta.ctxHasLinear", "Vuna/Compiler/Elab/Meta.vuna:1196"));
  ("Elab_dMeta.v_ctxHasLinearItems", ("Vuna.Compiler.Elab.Meta.ctxHasLinearItems", "Vuna/Compiler/Elab/Meta.vuna:1199"));
  ("Elab_dMeta.v_ctxItemAt", ("Vuna.Compiler.Elab.Meta.ctxItemAt", "Vuna/Compiler/Elab/Meta.vuna:930"));
  ("Elab_dMeta.v_dataLinearName", ("Vuna.Compiler.Elab.Meta.dataLinearName", "Vuna/Compiler/Elab/Meta.vuna:1165"));
  ("Elab_dMeta.v_dataNamesOf", ("Vuna.Compiler.Elab.Meta.dataNamesOf", "Vuna/Compiler/Elab/Meta.vuna:318"));
  ("Elab_dMeta.v_dataShortNameOf", ("Vuna.Compiler.Elab.Meta.dataShortNameOf", "Vuna/Compiler/Elab/Meta.vuna:410"));
  ("Elab_dMeta.v_defaultOrOver", ("Vuna.Compiler.Elab.Meta.defaultOrOver", "Vuna/Compiler/Elab/Meta.vuna:504"));
  ("Elab_dMeta.v_dictCtorName", ("Vuna.Compiler.Elab.Meta.dictCtorName", "Vuna/Compiler/Elab/Meta.vuna:691"));
  ("Elab_dMeta.v_dictTypeName", ("Vuna.Compiler.Elab.Meta.dictTypeName", "Vuna/Compiler/Elab/Meta.vuna:688"));
  ("Elab_dMeta.v_dropCount", ("Vuna.Compiler.Elab.Meta.dropCount", "Vuna/Compiler/Elab/Meta.vuna:1394"));
  ("Elab_dMeta.v_dropParams", ("Vuna.Compiler.Elab.Meta.dropParams", "Vuna/Compiler/Elab/Meta.vuna:658"));
  ("Elab_dMeta.v_dropPis", ("Vuna.Compiler.Elab.Meta.dropPis", "Vuna/Compiler/Elab/Meta.vuna:1460"));
  ("Elab_dMeta.v_dtCtorLookup", ("Vuna.Compiler.Elab.Meta.dtCtorLookup", "Vuna/Compiler/Elab/Meta.vuna:362"));
  ("Elab_dMeta.v_dtCtorLookupEc", ("Vuna.Compiler.Elab.Meta.dtCtorLookupEc", "Vuna/Compiler/Elab/Meta.vuna:372"));
  ("Elab_dMeta.v_dtDataLookup", ("Vuna.Compiler.Elab.Meta.dtDataLookup", "Vuna/Compiler/Elab/Meta.vuna:354"));
  ("Elab_dMeta.v_dualFamilyOf", ("Vuna.Compiler.Elab.Meta.dualFamilyOf", "Vuna/Compiler/Elab/Meta.vuna:453"));
  ("Elab_dMeta.v_etaCtorLa", ("Vuna.Compiler.Elab.Meta.etaCtorLa", "Vuna/Compiler/Elab/Meta.vuna:1381"));
  ("Elab_dMeta.v_etaCtorTerm", ("Vuna.Compiler.Elab.Meta.etaCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:1364"));
  ("Elab_dMeta.v_expectedFamilyOf", ("Vuna.Compiler.Elab.Meta.expectedFamilyOf", "Vuna/Compiler/Elab/Meta.vuna:434"));
  ("Elab_dMeta.v_expectedFamilyOfFuel", ("Vuna.Compiler.Elab.Meta.expectedFamilyOfFuel", "Vuna/Compiler/Elab/Meta.vuna:438"));
  ("Elab_dMeta.v_explicitPiArity", ("Vuna.Compiler.Elab.Meta.explicitPiArity", "Vuna/Compiler/Elab/Meta.vuna:1432"));
  ("Elab_dMeta.v_familyIndexed", ("Vuna.Compiler.Elab.Meta.familyIndexed", "Vuna/Compiler/Elab/Meta.vuna:1448"));
  ("Elab_dMeta.v_fieldBinderGo", ("Vuna.Compiler.Elab.Meta.fieldBinderGo", "Vuna/Compiler/Elab/Meta.vuna:739"));
  ("Elab_dMeta.v_fieldBinderGoGo", ("Vuna.Compiler.Elab.Meta.fieldBinderGoGo", "Vuna/Compiler/Elab/Meta.vuna:742"));
  ("Elab_dMeta.v_fieldBinderNames", ("Vuna.Compiler.Elab.Meta.fieldBinderNames", "Vuna/Compiler/Elab/Meta.vuna:736"));
  ("Elab_dMeta.v_fieldVarName", ("Vuna.Compiler.Elab.Meta.fieldVarName", "Vuna/Compiler/Elab/Meta.vuna:733"));
  ("Elab_dMeta.v_findCatchAllBody", ("Vuna.Compiler.Elab.Meta.findCatchAllBody", "Vuna/Compiler/Elab/Meta.vuna:1472"));
  ("Elab_dMeta.v_findClassByShortName", ("Vuna.Compiler.Elab.Meta.findClassByShortName", "Vuna/Compiler/Elab/Meta.vuna:751"));
  ("Elab_dMeta.v_findCtorIn", ("Vuna.Compiler.Elab.Meta.findCtorIn", "Vuna/Compiler/Elab/Meta.vuna:358"));
  ("Elab_dMeta.v_foldAppTerms", ("Vuna.Compiler.Elab.Meta.foldAppTerms", "Vuna/Compiler/Elab/Meta.vuna:1403"));
  ("Elab_dMeta.v_freshVarValue", ("Vuna.Compiler.Elab.Meta.freshVarValue", "Vuna/Compiler/Elab/Meta.vuna:1264"));
  ("Elab_dMeta.v_globalLookup", ("Vuna.Compiler.Elab.Meta.globalLookup", "Vuna/Compiler/Elab/Meta.vuna:225"));
  ("Elab_dMeta.v_globalsLookup", ("Vuna.Compiler.Elab.Meta.globalsLookup", "Vuna/Compiler/Elab/Meta.vuna:232"));
  ("Elab_dMeta.v_globalsTableOf", ("Vuna.Compiler.Elab.Meta.globalsTableOf", "Vuna/Compiler/Elab/Meta.vuna:244"));
  ("Elab_dMeta.v_hasFamParams", ("Vuna.Compiler.Elab.Meta.hasFamParams", "Vuna/Compiler/Elab/Meta.vuna:1414"));
  ("Elab_dMeta.v_hasNoExplicitPi", ("Vuna.Compiler.Elab.Meta.hasNoExplicitPi", "Vuna/Compiler/Elab/Meta.vuna:28"));
  ("Elab_dMeta.v_hasNoExplicitPiFuel", ("Vuna.Compiler.Elab.Meta.hasNoExplicitPiFuel", "Vuna/Compiler/Elab/Meta.vuna:31"));
  ("Elab_dMeta.v_hasOutOfScopeVar", ("Vuna.Compiler.Elab.Meta.hasOutOfScopeVar", "Vuna/Compiler/Elab/Meta.vuna:635"));
  ("Elab_dMeta.v_hasOutOfScopeVarAlts", ("Vuna.Compiler.Elab.Meta.hasOutOfScopeVarAlts", "Vuna/Compiler/Elab/Meta.vuna:641"));
  ("Elab_dMeta.v_hasOutOfScopeVarArgs", ("Vuna.Compiler.Elab.Meta.hasOutOfScopeVarArgs", "Vuna/Compiler/Elab/Meta.vuna:638"));
  ("Elab_dMeta.v_implicitBinderRig", ("Vuna.Compiler.Elab.Meta.implicitBinderRig", "Vuna/Compiler/Elab/Meta.vuna:867"));
  ("Elab_dMeta.v_inferCtorRef", ("Vuna.Compiler.Elab.Meta.inferCtorRef", "Vuna/Compiler/Elab/Meta.vuna:96"));
  ("Elab_dMeta.v_instantiateNullaryCtor", ("Vuna.Compiler.Elab.Meta.instantiateNullaryCtor", "Vuna/Compiler/Elab/Meta.vuna:45"));
  ("Elab_dMeta.v_instantiateNullaryCtorFuel", ("Vuna.Compiler.Elab.Meta.instantiateNullaryCtorFuel", "Vuna/Compiler/Elab/Meta.vuna:48"));
  ("Elab_dMeta.v_isBlanketInst", ("Vuna.Compiler.Elab.Meta.isBlanketInst", "Vuna/Compiler/Elab/Meta.vuna:779"));
  ("Elab_dMeta.v_isBlanketInstHead", ("Vuna.Compiler.Elab.Meta.isBlanketInstHead", "Vuna/Compiler/Elab/Meta.vuna:763"));
  ("Elab_dMeta.v_isBoolGlobal", ("Vuna.Compiler.Elab.Meta.isBoolGlobal", "Vuna/Compiler/Elab/Meta.vuna:1279"));
  ("Elab_dMeta.v_isBoolType", ("Vuna.Compiler.Elab.Meta.isBoolType", "Vuna/Compiler/Elab/Meta.vuna:1271"));
  ("Elab_dMeta.v_isDataFamilyName", ("Vuna.Compiler.Elab.Meta.isDataFamilyName", "Vuna/Compiler/Elab/Meta.vuna:390"));
  ("Elab_dMeta.v_isDataHead", ("Vuna.Compiler.Elab.Meta.isDataHead", "Vuna/Compiler/Elab/Meta.vuna:1254"));
  ("Elab_dMeta.v_isFamilyKindFuel", ("Vuna.Compiler.Elab.Meta.isFamilyKindFuel", "Vuna/Compiler/Elab/Meta.vuna:986"));
  ("Elab_dMeta.v_isFamilyKindValue", ("Vuna.Compiler.Elab.Meta.isFamilyKindValue", "Vuna/Compiler/Elab/Meta.vuna:983"));
  ("Elab_dMeta.v_isImplicitDomain", ("Vuna.Compiler.Elab.Meta.isImplicitDomain", "Vuna/Compiler/Elab/Meta.vuna:840"));
  ("Elab_dMeta.v_isIndexDomain", ("Vuna.Compiler.Elab.Meta.isIndexDomain", "Vuna/Compiler/Elab/Meta.vuna:825"));
  ("Elab_dMeta.v_isKindWithCtx", ("Vuna.Compiler.Elab.Meta.isKindWithCtx", "Vuna/Compiler/Elab/Meta.vuna:895"));
  ("Elab_dMeta.v_isKindWithCtxFuel", ("Vuna.Compiler.Elab.Meta.isKindWithCtxFuel", "Vuna/Compiler/Elab/Meta.vuna:898"));
  ("Elab_dMeta.v_isLinClosureName", ("Vuna.Compiler.Elab.Meta.isLinClosureName", "Vuna/Compiler/Elab/Meta.vuna:808"));
  ("Elab_dMeta.v_isLinearType", ("Vuna.Compiler.Elab.Meta.isLinearType", "Vuna/Compiler/Elab/Meta.vuna:1145"));
  ("Elab_dMeta.v_isLinearTypeFuel", ("Vuna.Compiler.Elab.Meta.isLinearTypeFuel", "Vuna/Compiler/Elab/Meta.vuna:1148"));
  ("Elab_dMeta.v_isOpaqueRuntimeTyIn", ("Vuna.Compiler.Elab.Meta.isOpaqueRuntimeTyIn", "Vuna/Compiler/Elab/Meta.vuna:1082"));
  ("Elab_dMeta.v_isSortExpr", ("Vuna.Compiler.Elab.Meta.isSortExpr", "Vuna/Compiler/Elab/Meta.vuna:1419"));
  ("Elab_dMeta.v_isSortVal", ("Vuna.Compiler.Elab.Meta.isSortVal", "Vuna/Compiler/Elab/Meta.vuna:1284"));
  ("Elab_dMeta.v_isStringImplicitDomain", ("Vuna.Compiler.Elab.Meta.isStringImplicitDomain", "Vuna/Compiler/Elab/Meta.vuna:861"));
  ("Elab_dMeta.v_isTypeDomain", ("Vuna.Compiler.Elab.Meta.isTypeDomain", "Vuna/Compiler/Elab/Meta.vuna:949"));
  ("Elab_dMeta.v_isTypeHeadOpaqueEc", ("Vuna.Compiler.Elab.Meta.isTypeHeadOpaqueEc", "Vuna/Compiler/Elab/Meta.vuna:979"));
  ("Elab_dMeta.v_isTypeLayerValue", ("Vuna.Compiler.Elab.Meta.isTypeLayerValue", "Vuna/Compiler/Elab/Meta.vuna:1241"));
  ("Elab_dMeta.v_isTypeLayerValueFuel", ("Vuna.Compiler.Elab.Meta.isTypeLayerValueFuel", "Vuna/Compiler/Elab/Meta.vuna:1244"));
  ("Elab_dMeta.v_isTypeLevelGlobal", ("Vuna.Compiler.Elab.Meta.isTypeLevelGlobal", "Vuna/Compiler/Elab/Meta.vuna:397"));
  ("Elab_dMeta.v_isTypeLikeWithCtx", ("Vuna.Compiler.Elab.Meta.isTypeLikeWithCtx", "Vuna/Compiler/Elab/Meta.vuna:911"));
  ("Elab_dMeta.v_isTypeName", ("Vuna.Compiler.Elab.Meta.isTypeName", "Vuna/Compiler/Elab/Meta.vuna:403"));
  ("Elab_dMeta.v_isTypeishValue", ("Vuna.Compiler.Elab.Meta.isTypeishValue", "Vuna/Compiler/Elab/Meta.vuna:1054"));
  ("Elab_dMeta.v_isUniverseValue", ("Vuna.Compiler.Elab.Meta.isUniverseValue", "Vuna/Compiler/Elab/Meta.vuna:995"));
  ("Elab_dMeta.v_kindDomainWellFormed", ("Vuna.Compiler.Elab.Meta.kindDomainWellFormed", "Vuna/Compiler/Elab/Meta.vuna:344"));
  ("Elab_dMeta.v_kindWellFormed", ("Vuna.Compiler.Elab.Meta.kindWellFormed", "Vuna/Compiler/Elab/Meta.vuna:337"));
  ("Elab_dMeta.v_linClosureMark", ("Vuna.Compiler.Elab.Meta.linClosureMark", "Vuna/Compiler/Elab/Meta.vuna:798"));
  ("Elab_dMeta.v_linClosureName", ("Vuna.Compiler.Elab.Meta.linClosureName", "Vuna/Compiler/Elab/Meta.vuna:801"));
  ("Elab_dMeta.v_linClosureOrigGo", ("Vuna.Compiler.Elab.Meta.linClosureOrigGo", "Vuna/Compiler/Elab/Meta.vuna:814"));
  ("Elab_dMeta.v_linClosureOrigName", ("Vuna.Compiler.Elab.Meta.linClosureOrigName", "Vuna/Compiler/Elab/Meta.vuna:811"));
  ("Elab_dMeta.v_litEqName", ("Vuna.Compiler.Elab.Meta.litEqName", "Vuna/Compiler/Elab/Meta.vuna:819"));
  ("Elab_dMeta.v_lookupDataHead", ("Vuna.Compiler.Elab.Meta.lookupDataHead", "Vuna/Compiler/Elab/Meta.vuna:672"));
  ("Elab_dMeta.v_lookupSpanPair", ("Vuna.Compiler.Elab.Meta.lookupSpanPair", "Vuna/Compiler/Elab/Meta.vuna:121"));
  ("Elab_dMeta.v_maxInt", ("Vuna.Compiler.Elab.Meta.maxInt", "Vuna/Compiler/Elab/Meta.vuna:222"));
  ("Elab_dMeta.v_memDefName", ("Vuna.Compiler.Elab.Meta.memDefName", "Vuna/Compiler/Elab/Meta.vuna:252"));
  ("Elab_dMeta.v_memLevel", ("Vuna.Compiler.Elab.Meta.memLevel", "Vuna/Compiler/Elab/Meta.vuna:1061"));
  ("Elab_dMeta.v_memMetaId", ("Vuna.Compiler.Elab.Meta.memMetaId", "Vuna/Compiler/Elab/Meta.vuna:152"));
  ("Elab_dMeta.v_memSig", ("Vuna.Compiler.Elab.Meta.memSig", "Vuna/Compiler/Elab/Meta.vuna:248"));
  ("Elab_dMeta.v_metaSpanOf", ("Vuna.Compiler.Elab.Meta.metaSpanOf", "Vuna/Compiler/Elab/Meta.vuna:116"));
  ("Elab_dMeta.v_methodArgLams", ("Vuna.Compiler.Elab.Meta.methodArgLams", "Vuna/Compiler/Elab/Meta.vuna:725"));
  ("Elab_dMeta.v_methodArgTerms", ("Vuna.Compiler.Elab.Meta.methodArgTerms", "Vuna/Compiler/Elab/Meta.vuna:715"));
  ("Elab_dMeta.v_methodArgTermsGo", ("Vuna.Compiler.Elab.Meta.methodArgTermsGo", "Vuna/Compiler/Elab/Meta.vuna:718"));
  ("Elab_dMeta.v_mkCtorTerm", ("Vuna.Compiler.Elab.Meta.mkCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:1349"));
  ("Elab_dMeta.v_neutralBinderIndexDomain", ("Vuna.Compiler.Elab.Meta.neutralBinderIndexDomain", "Vuna/Compiler/Elab/Meta.vuna:872"));
  ("Elab_dMeta.v_neutralBinderType", ("Vuna.Compiler.Elab.Meta.neutralBinderType", "Vuna/Compiler/Elab/Meta.vuna:879"));
  ("Elab_dMeta.v_neutralHeadName", ("Vuna.Compiler.Elab.Meta.neutralHeadName", "Vuna/Compiler/Elab/Meta.vuna:1275"));
  ("Elab_dMeta.v_nonEmpty", ("Vuna.Compiler.Elab.Meta.nonEmpty", "Vuna/Compiler/Elab/Meta.vuna:326"));
  ("Elab_dMeta.v_nullaryCtorTerm", ("Vuna.Compiler.Elab.Meta.nullaryCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:69"));
  ("Elab_dMeta.v_nvarOpaqueCtx", ("Vuna.Compiler.Elab.Meta.nvarOpaqueCtx", "Vuna/Compiler/Elab/Meta.vuna:1066"));
  ("Elab_dMeta.v_outerScan", ("Vuna.Compiler.Elab.Meta.outerScan", "Vuna/Compiler/Elab/Meta.vuna:1209"));
  ("Elab_dMeta.v_outerScanAlts", ("Vuna.Compiler.Elab.Meta.outerScanAlts", "Vuna/Compiler/Elab/Meta.vuna:1236"));
  ("Elab_dMeta.v_outerScanArgs", ("Vuna.Compiler.Elab.Meta.outerScanArgs", "Vuna/Compiler/Elab/Meta.vuna:1231"));
  ("Elab_dMeta.v_overCandidatesText", ("Vuna.Compiler.Elab.Meta.overCandidatesText", "Vuna/Compiler/Elab/Meta.vuna:449"));
  ("Elab_dMeta.v_paramNameOf", ("Vuna.Compiler.Elab.Meta.paramNameOf", "Vuna/Compiler/Elab/Meta.vuna:710"));
  ("Elab_dMeta.v_prependFamParams", ("Vuna.Compiler.Elab.Meta.prependFamParams", "Vuna/Compiler/Elab/Meta.vuna:649"));
  ("Elab_dMeta.v_relevantMetas", ("Vuna.Compiler.Elab.Meta.relevantMetas", "Vuna/Compiler/Elab/Meta.vuna:156"));
  ("Elab_dMeta.v_resolveOverCtor", ("Vuna.Compiler.Elab.Meta.resolveOverCtor", "Vuna/Compiler/Elab/Meta.vuna:477"));
  ("Elab_dMeta.v_resolveOverCtorGo", ("Vuna.Compiler.Elab.Meta.resolveOverCtorGo", "Vuna/Compiler/Elab/Meta.vuna:488"));
  ("Elab_dMeta.v_resultSpine", ("Vuna.Compiler.Elab.Meta.resultSpine", "Vuna/Compiler/Elab/Meta.vuna:560"));
  ("Elab_dMeta.v_rigCaseField", ("Vuna.Compiler.Elab.Meta.rigCaseField", "Vuna/Compiler/Elab/Meta.vuna:1188"));
  ("Elab_dMeta.v_rigForLinearDomain", ("Vuna.Compiler.Elab.Meta.rigForLinearDomain", "Vuna/Compiler/Elab/Meta.vuna:1178"));
  ("Elab_dMeta.v_rigOfLinearValue", ("Vuna.Compiler.Elab.Meta.rigOfLinearValue", "Vuna/Compiler/Elab/Meta.vuna:1192"));
  ("Elab_dMeta.v_rigOfQty", ("Vuna.Compiler.Elab.Meta.rigOfQty", "Vuna/Compiler/Elab/Meta.vuna:956"));
  ("Elab_dMeta.v_shiftCtorArgs", ("Vuna.Compiler.Elab.Meta.shiftCtorArgs", "Vuna/Compiler/Elab/Meta.vuna:1372"));
  ("Elab_dMeta.v_spineOfType", ("Vuna.Compiler.Elab.Meta.spineOfType", "Vuna/Compiler/Elab/Meta.vuna:552"));
  ("Elab_dMeta.v_splitKind", ("Vuna.Compiler.Elab.Meta.splitKind", "Vuna/Compiler/Elab/Meta.vuna:350"));
  ("Elab_dMeta.v_substClassParam", ("Vuna.Compiler.Elab.Meta.substClassParam", "Vuna/Compiler/Elab/Meta.vuna:785"));
  ("Elab_dMeta.v_teleOf", ("Vuna.Compiler.Elab.Meta.teleOf", "Vuna/Compiler/Elab/Meta.vuna:544"));
  ("Elab_dMeta.v_teleOfType", ("Vuna.Compiler.Elab.Meta.teleOfType", "Vuna/Compiler/Elab/Meta.vuna:541"));
  ("Elab_dMeta.v_termHasOuterLinear", ("Vuna.Compiler.Elab.Meta.termHasOuterLinear", "Vuna/Compiler/Elab/Meta.vuna:1206"));
  ("Elab_dMeta.v_termMetasAll", ("Vuna.Compiler.Elab.Meta.termMetasAll", "Vuna/Compiler/Elab/Meta.vuna:191"));
  ("Elab_dMeta.v_termMetasAllMaybe", ("Vuna.Compiler.Elab.Meta.termMetasAllMaybe", "Vuna/Compiler/Elab/Meta.vuna:218"));
  ("Elab_dMeta.v_termMetasRuntime", ("Vuna.Compiler.Elab.Meta.termMetasRuntime", "Vuna/Compiler/Elab/Meta.vuna:163"));
  ("Elab_dMeta.v_typeHeadLookup", ("Vuna.Compiler.Elab.Meta.typeHeadLookup", "Vuna/Compiler/Elab/Meta.vuna:513"));
  ("Elab_dMeta.v_typeLookup", ("Vuna.Compiler.Elab.Meta.typeLookup", "Vuna/Compiler/Elab/Meta.vuna:520"));
  ("Elab_dMeta.v_typeNameOfDualCtor", ("Vuna.Compiler.Elab.Meta.typeNameOfDualCtor", "Vuna/Compiler/Elab/Meta.vuna:414"));
  ("Elab_dMeta.v_unsolvedFrom", ("Vuna.Compiler.Elab.Meta.unsolvedFrom", "Vuna/Compiler/Elab/Meta.vuna:138"));
  ("Elab_dMeta.v_unsolvedFromGo", ("Vuna.Compiler.Elab.Meta.unsolvedFromGo", "Vuna/Compiler/Elab/Meta.vuna:141"));
  ("Elab_dMeta.v_valueHasImplicitPi", ("Vuna.Compiler.Elab.Meta.valueHasImplicitPi", "Vuna/Compiler/Elab/Meta.vuna:1009"));
  ("Elab_dMeta.v_valueHasImplicitPiFuel", ("Vuna.Compiler.Elab.Meta.valueHasImplicitPiFuel", "Vuna/Compiler/Elab/Meta.vuna:1012"));
  ("Elab_dMeta.v_valueLookup", ("Vuna.Compiler.Elab.Meta.valueLookup", "Vuna/Compiler/Elab/Meta.vuna:530"));
  ("Elab_dMeta.v_valueOpaqueGo", ("Vuna.Compiler.Elab.Meta.valueOpaqueGo", "Vuna/Compiler/Elab/Meta.vuna:1021"));
  ("Elab_dMeta.v_valueOpaqueScoped", ("Vuna.Compiler.Elab.Meta.valueOpaqueScoped", "Vuna/Compiler/Elab/Meta.vuna:1003"));
  ("Elab_dMeta.v_valueOpaqueTypeSpine", ("Vuna.Compiler.Elab.Meta.valueOpaqueTypeSpine", "Vuna/Compiler/Elab/Meta.vuna:1043"));
  ("Elab_dMeta.v_wrapOpaqueAltFuel", ("Vuna.Compiler.Elab.Meta.wrapOpaqueAltFuel", "Vuna/Compiler/Elab/Meta.vuna:1140"));
  ("Elab_dMeta.v_wrapOpaqueUses", ("Vuna.Compiler.Elab.Meta.wrapOpaqueUses", "Vuna/Compiler/Elab/Meta.vuna:1097"));
  ("Elab_dMeta.v_wrapOpaqueUsesFuel", ("Vuna.Compiler.Elab.Meta.wrapOpaqueUsesFuel", "Vuna/Compiler/Elab/Meta.vuna:1100"));
  ("Elab_dMeta.v_wrapOpaqueVar", ("Vuna.Compiler.Elab.Meta.wrapOpaqueVar", "Vuna/Compiler/Elab/Meta.vuna:1131"));
  ("Elab_dMeta.v_zipTeleRigs", ("Vuna.Compiler.Elab.Meta.zipTeleRigs", "Vuna/Compiler/Elab/Meta.vuna:76"));
  ("Elab_dMeta.v_zonkAlt", ("Vuna.Compiler.Elab.Meta.zonkAlt", "Vuna/Compiler/Elab/Meta.vuna:619"));
  ("Elab_dMeta.v_zonkAltFuel", ("Vuna.Compiler.Elab.Meta.zonkAltFuel", "Vuna/Compiler/Elab/Meta.vuna:624"));
  ("Elab_dMeta.v_zonkFuelFor", ("Vuna.Compiler.Elab.Meta.zonkFuelFor", "Vuna/Compiler/Elab/Meta.vuna:582"));
  ("Elab_dMeta.v_zonkFuelMax", ("Vuna.Compiler.Elab.Meta.zonkFuelMax", "Vuna/Compiler/Elab/Meta.vuna:588"));
  ("Elab_dMeta.v_zonkTerm", ("Vuna.Compiler.Elab.Meta.zonkTerm", "Vuna/Compiler/Elab/Meta.vuna:577"));
  ("Elab_dMeta.v_zonkTermFuel", ("Vuna.Compiler.Elab.Meta.zonkTermFuel", "Vuna/Compiler/Elab/Meta.vuna:591"));
  ("Elab_dMeta.v_zonkValueOnly", ("Vuna.Compiler.Elab.Meta.zonkValueOnly", "Vuna/Compiler/Elab/Meta.vuna:1079"));
  ("Elab_dMetaSpans.v_lookupMeta", ("Vuna.Compiler.Elab.MetaSpans.lookupMeta", "Vuna/Compiler/Elab/MetaSpans.vuna:29"));
  ("Elab_dMetaSpans.v_metaSpanOf", ("Vuna.Compiler.Elab.MetaSpans.metaSpanOf", "Vuna/Compiler/Elab/MetaSpans.vuna:25"));
  ("Elab_dMetaSpans.v_newHoleMeta", ("Vuna.Compiler.Elab.MetaSpans.newHoleMeta", "Vuna/Compiler/Elab/MetaSpans.vuna:42"));
  ("Elab_dMetaSpans.v_newMetaAt", ("Vuna.Compiler.Elab.MetaSpans.newMetaAt", "Vuna/Compiler/Elab/MetaSpans.vuna:34"));
  ("Elab_dMetaSpans.v_recordMetaSpan", ("Vuna.Compiler.Elab.MetaSpans.recordMetaSpan", "Vuna/Compiler/Elab/MetaSpans.vuna:21"));
  ("Elab_dPrelude.v_baseNameOf", ("Vuna.Compiler.Elab.Prelude.baseNameOf", "Vuna/Compiler/Elab/Prelude.vuna:177"));
  ("Elab_dPrelude.v_boolTy", ("Vuna.Compiler.Elab.Prelude.boolTy", "Vuna/Compiler/Elab/Prelude.vuna:33"));
  ("Elab_dPrelude.v_boolTyValue", ("Vuna.Compiler.Elab.Prelude.boolTyValue", "Vuna/Compiler/Elab/Prelude.vuna:37"));
  ("Elab_dPrelude.v_builtinEqTyName", ("Vuna.Compiler.Elab.Prelude.builtinEqTyName", "Vuna/Compiler/Elab/Prelude.vuna:148"));
  ("Elab_dPrelude.v_builtinTyName", ("Vuna.Compiler.Elab.Prelude.builtinTyName", "Vuna/Compiler/Elab/Prelude.vuna:50"));
  ("Elab_dPrelude.v_classMethodProjection", ("Vuna.Compiler.Elab.Prelude.classMethodProjection", "Vuna/Compiler/Elab/Prelude.vuna:181"));
  ("Elab_dPrelude.v_classMethodProjectionGo", ("Vuna.Compiler.Elab.Prelude.classMethodProjectionGo", "Vuna/Compiler/Elab/Prelude.vuna:184"));
  ("Elab_dPrelude.v_cmpBuiltinTyName", ("Vuna.Compiler.Elab.Prelude.cmpBuiltinTyName", "Vuna/Compiler/Elab/Prelude.vuna:161"));
  ("Elab_dPrelude.v_eqRuntimeName", ("Vuna.Compiler.Elab.Prelude.eqRuntimeName", "Vuna/Compiler/Elab/Prelude.vuna:65"));
  ("Elab_dPrelude.v_floatTy", ("Vuna.Compiler.Elab.Prelude.floatTy", "Vuna/Compiler/Elab/Prelude.vuna:29"));
  ("Elab_dPrelude.v_fun2", ("Vuna.Compiler.Elab.Prelude.fun2", "Vuna/Compiler/Elab/Prelude.vuna:41"));
  ("Elab_dPrelude.v_indexOfName", ("Vuna.Compiler.Elab.Prelude.indexOfName", "Vuna/Compiler/Elab/Prelude.vuna:80"));
  ("Elab_dPrelude.v_indexOfNameGo", ("Vuna.Compiler.Elab.Prelude.indexOfNameGo", "Vuna/Compiler/Elab/Prelude.vuna:76"));
  ("Elab_dPrelude.v_intTy", ("Vuna.Compiler.Elab.Prelude.intTy", "Vuna/Compiler/Elab/Prelude.vuna:22"));
  ("Elab_dPrelude.v_internalValueGlobals", ("Vuna.Compiler.Elab.Prelude.internalValueGlobals", "Vuna/Compiler/Elab/Prelude.vuna:135"));
  ("Elab_dPrelude.v_isEqShort", ("Vuna.Compiler.Elab.Prelude.isEqShort", "Vuna/Compiler/Elab/Prelude.vuna:60"));
  ("Elab_dPrelude.v_ityToTerm", ("Vuna.Compiler.Elab.Prelude.ityToTerm", "Vuna/Compiler/Elab/Prelude.vuna:83"));
  ("Elab_dPrelude.v_ityToTermEnv", ("Vuna.Compiler.Elab.Prelude.ityToTermEnv", "Vuna/Compiler/Elab/Prelude.vuna:86"));
  ("Elab_dPrelude.v_preludeGlobals", ("Vuna.Compiler.Elab.Prelude.preludeGlobals", "Vuna/Compiler/Elab/Prelude.vuna:139"));
  ("Elab_dPrelude.v_preludeNames", ("Vuna.Compiler.Elab.Prelude.preludeNames", "Vuna/Compiler/Elab/Prelude.vuna:144"));
  ("Elab_dPrelude.v_preludeTypeGlobals", ("Vuna.Compiler.Elab.Prelude.preludeTypeGlobals", "Vuna/Compiler/Elab/Prelude.vuna:123"));
  ("Elab_dPrelude.v_preludeValueGlobals", ("Vuna.Compiler.Elab.Prelude.preludeValueGlobals", "Vuna/Compiler/Elab/Prelude.vuna:129"));
  ("Elab_dPrelude.v_prependParams", ("Vuna.Compiler.Elab.Prelude.prependParams", "Vuna/Compiler/Elab/Prelude.vuna:169"));
  ("Elab_dPrelude.v_strTy", ("Vuna.Compiler.Elab.Prelude.strTy", "Vuna/Compiler/Elab/Prelude.vuna:25"));
  ("Elab_dPrelude.v_typeCtorKindTerm", ("Vuna.Compiler.Elab.Prelude.typeCtorKindTerm", "Vuna/Compiler/Elab/Prelude.vuna:115"));
  ("Elab_dRecords.v_ctorName", ("Vuna.Compiler.Elab.Records.ctorName", "Vuna/Compiler/Elab/Records.vuna:360"));
  ("Elab_dRecords.v_desugarAltFuel", ("Vuna.Compiler.Elab.Records.desugarAltFuel", "Vuna/Compiler/Elab/Records.vuna:271"));
  ("Elab_dRecords.v_desugarBindFuel", ("Vuna.Compiler.Elab.Records.desugarBindFuel", "Vuna/Compiler/Elab/Records.vuna:252"));
  ("Elab_dRecords.v_desugarDoStmtFuel", ("Vuna.Compiler.Elab.Records.desugarDoStmtFuel", "Vuna/Compiler/Elab/Records.vuna:223"));
  ("Elab_dRecords.v_desugarExpr", ("Vuna.Compiler.Elab.Records.desugarExpr", "Vuna/Compiler/Elab/Records.vuna:363"));
  ("Elab_dRecords.v_desugarExprFuel", ("Vuna.Compiler.Elab.Records.desugarExprFuel", "Vuna/Compiler/Elab/Records.vuna:192"));
  ("Elab_dRecords.v_desugarFieldValueFuel", ("Vuna.Compiler.Elab.Records.desugarFieldValueFuel", "Vuna/Compiler/Elab/Records.vuna:243"));
  ("Elab_dRecords.v_desugarLocalClauseFuel", ("Vuna.Compiler.Elab.Records.desugarLocalClauseFuel", "Vuna/Compiler/Elab/Records.vuna:262"));
  ("Elab_dRecords.v_desugarPattern", ("Vuna.Compiler.Elab.Records.desugarPattern", "Vuna/Compiler/Elab/Records.vuna:160"));
  ("Elab_dRecords.v_desugarPatternFuel", ("Vuna.Compiler.Elab.Records.desugarPatternFuel", "Vuna/Compiler/Elab/Records.vuna:163"));
  ("Elab_dRecords.v_desugarRecordDecl", ("Vuna.Compiler.Elab.Records.desugarRecordDecl", "Vuna/Compiler/Elab/Records.vuna:140"));
  ("Elab_dRecords.v_desugarRecordPatternFieldsFuel", ("Vuna.Compiler.Elab.Records.desugarRecordPatternFieldsFuel", "Vuna/Compiler/Elab/Records.vuna:180"));
  ("Elab_dRecords.v_desugarRecordValuesFuel", ("Vuna.Compiler.Elab.Records.desugarRecordValuesFuel", "Vuna/Compiler/Elab/Records.vuna:232"));
  ("Elab_dRecords.v_desugarRecords", ("Vuna.Compiler.Elab.Records.desugarRecords", "Vuna/Compiler/Elab/Records.vuna:137"));
  ("Elab_dRecords.v_duplicateFieldMsg", ("Vuna.Compiler.Elab.Records.duplicateFieldMsg", "Vuna/Compiler/Elab/Records.vuna:76"));
  ("Elab_dRecords.v_expandCaseAs", ("Vuna.Compiler.Elab.Records.expandCaseAs", "Vuna/Compiler/Elab/Records.vuna:368"));
  ("Elab_dRecords.v_expandCaseAsGo", ("Vuna.Compiler.Elab.Records.expandCaseAsGo", "Vuna/Compiler/Elab/Records.vuna:371"));
  ("Elab_dRecords.v_fieldNamesOf", ("Vuna.Compiler.Elab.Records.fieldNamesOf", "Vuna/Compiler/Elab/Records.vuna:55"));
  ("Elab_dRecords.v_firstUnknownFieldMsg", ("Vuna.Compiler.Elab.Records.firstUnknownFieldMsg", "Vuna/Compiler/Elab/Records.vuna:84"));
  ("Elab_dRecords.v_hasDuplicateFieldNames", ("Vuna.Compiler.Elab.Records.hasDuplicateFieldNames", "Vuna/Compiler/Elab/Records.vuna:63"));
  ("Elab_dRecords.v_hasFieldInstanceDecl", ("Vuna.Compiler.Elab.Records.hasFieldInstanceDecl", "Vuna/Compiler/Elab/Records.vuna:322"));
  ("Elab_dRecords.v_hasUnknownFields", ("Vuna.Compiler.Elab.Records.hasUnknownFields", "Vuna/Compiler/Elab/Records.vuna:79"));
  ("Elab_dRecords.v_lookupProvided", ("Vuna.Compiler.Elab.Records.lookupProvided", "Vuna/Compiler/Elab/Records.vuna:59"));
  ("Elab_dRecords.v_lookupRecord", ("Vuna.Compiler.Elab.Records.lookupRecord", "Vuna/Compiler/Elab/Records.vuna:51"));
  ("Elab_dRecords.v_missingFieldMsg", ("Vuna.Compiler.Elab.Records.missingFieldMsg", "Vuna/Compiler/Elab/Records.vuna:70"));
  ("Elab_dRecords.v_prepareDecls", ("Vuna.Compiler.Elab.Records.prepareDecls", "Vuna/Compiler/Elab/Records.vuna:345"));
  ("Elab_dRecords.v_prepareDeclsWith", ("Vuna.Compiler.Elab.Records.prepareDeclsWith", "Vuna/Compiler/Elab/Records.vuna:350"));
  ("Elab_dRecords.v_recordArrowType", ("Vuna.Compiler.Elab.Records.recordArrowType", "Vuna/Compiler/Elab/Records.vuna:117"));
  ("Elab_dRecords.v_recordArrowTypeGo", ("Vuna.Compiler.Elab.Records.recordArrowTypeGo", "Vuna/Compiler/Elab/Records.vuna:120"));
  ("Elab_dRecords.v_recordCtorType", ("Vuna.Compiler.Elab.Records.recordCtorType", "Vuna/Compiler/Elab/Records.vuna:133"));
  ("Elab_dRecords.v_recordFieldNames", ("Vuna.Compiler.Elab.Records.recordFieldNames", "Vuna/Compiler/Elab/Records.vuna:46"));
  ("Elab_dRecords.v_recordFieldPairs", ("Vuna.Compiler.Elab.Records.recordFieldPairs", "Vuna/Compiler/Elab/Records.vuna:41"));
  ("Elab_dRecords.v_recordFieldsOf", ("Vuna.Compiler.Elab.Records.recordFieldsOf", "Vuna/Compiler/Elab/Records.vuna:100"));
  ("Elab_dRecords.v_recordHasFieldInstances", ("Vuna.Compiler.Elab.Records.recordHasFieldInstances", "Vuna/Compiler/Elab/Records.vuna:282"));
  ("Elab_dRecords.v_recordHasFieldInstancesGo", ("Vuna.Compiler.Elab.Records.recordHasFieldInstancesGo", "Vuna/Compiler/Elab/Records.vuna:299"));
  ("Elab_dRecords.v_recordHasFieldInstancesOf", ("Vuna.Compiler.Elab.Records.recordHasFieldInstancesOf", "Vuna/Compiler/Elab/Records.vuna:288"));
  ("Elab_dRecords.v_recordInstancePats", ("Vuna.Compiler.Elab.Records.recordInstancePats", "Vuna/Compiler/Elab/Records.vuna:310"));
  ("Elab_dRecords.v_recordInstancePatsFrom", ("Vuna.Compiler.Elab.Records.recordInstancePatsFrom", "Vuna/Compiler/Elab/Records.vuna:314"));
  ("Elab_dRecords.v_recordInstanceVar", ("Vuna.Compiler.Elab.Records.recordInstanceVar", "Vuna/Compiler/Elab/Records.vuna:306"));
  ("Elab_dRecords.v_recordParamPis", ("Vuna.Compiler.Elab.Records.recordParamPis", "Vuna/Compiler/Elab/Records.vuna:127"));
  ("Elab_dRecords.v_recordParamVarExprs", ("Vuna.Compiler.Elab.Records.recordParamVarExprs", "Vuna/Compiler/Elab/Records.vuna:106"));
  ("Elab_dRecords.v_recordRetType", ("Vuna.Compiler.Elab.Records.recordRetType", "Vuna/Compiler/Elab/Records.vuna:109"));
  ("Elab_dRecords.v_recordsOfDecls", ("Vuna.Compiler.Elab.Records.recordsOfDecls", "Vuna/Compiler/Elab/Records.vuna:90"));
  ("Elab_dRecords.v_unknownFieldMsg", ("Vuna.Compiler.Elab.Records.unknownFieldMsg", "Vuna/Compiler/Elab/Records.vuna:73"));
  ("Elab_dRepresentation.v_anyReachBack", ("Vuna.Compiler.Elab.Representation.anyReachBack", "Vuna/Compiler/Elab/Representation.vuna:231"));
  ("Elab_dRepresentation.v_candidateEdges", ("Vuna.Compiler.Elab.Representation.candidateEdges", "Vuna/Compiler/Elab/Representation.vuna:205"));
  ("Elab_dRepresentation.v_candidateNames", ("Vuna.Compiler.Elab.Representation.candidateNames", "Vuna/Compiler/Elab/Representation.vuna:201"));
  ("Elab_dRepresentation.v_candidateRefs", ("Vuna.Compiler.Elab.Representation.candidateRefs", "Vuna/Compiler/Elab/Representation.vuna:210"));
  ("Elab_dRepresentation.v_ctorFieldDomainTerm", ("Vuna.Compiler.Elab.Representation.ctorFieldDomainTerm", "Vuna/Compiler/Elab/Representation.vuna:90"));
  ("Elab_dRepresentation.v_ctorFieldDomainTermGo", ("Vuna.Compiler.Elab.Representation.ctorFieldDomainTermGo", "Vuna/Compiler/Elab/Representation.vuna:94"));
  ("Elab_dRepresentation.v_ctorKeepFlags", ("Vuna.Compiler.Elab.Representation.ctorKeepFlags", "Vuna/Compiler/Elab/Representation.vuna:38"));
  ("Elab_dRepresentation.v_findDtData", ("Vuna.Compiler.Elab.Representation.findDtData", "Vuna/Compiler/Elab/Representation.vuna:57"));
  ("Elab_dRepresentation.v_isSpecialUnboxFamily", ("Vuna.Compiler.Elab.Representation.isSpecialUnboxFamily", "Vuna/Compiler/Elab/Representation.vuna:52"));
  ("Elab_dRepresentation.v_keptIndices", ("Vuna.Compiler.Elab.Representation.keptIndices", "Vuna/Compiler/Elab/Representation.vuna:42"));
  ("Elab_dRepresentation.v_keptIndicesGo", ("Vuna.Compiler.Elab.Representation.keptIndicesGo", "Vuna/Compiler/Elab/Representation.vuna:46"));
  ("Elab_dRepresentation.v_knownTypeHead", ("Vuna.Compiler.Elab.Representation.knownTypeHead", "Vuna/Compiler/Elab/Representation.vuna:62"));
  ("Elab_dRepresentation.v_lookupNeighbors", ("Vuna.Compiler.Elab.Representation.lookupNeighbors", "Vuna/Compiler/Elab/Representation.vuna:217"));
  ("Elab_dRepresentation.v_lookupUnboxedInfo", ("Vuna.Compiler.Elab.Representation.lookupUnboxedInfo", "Vuna/Compiler/Elab/Representation.vuna:262"));
  ("Elab_dRepresentation.v_reachesBackTo", ("Vuna.Compiler.Elab.Representation.reachesBackTo", "Vuna/Compiler/Elab/Representation.vuna:223"));
  ("Elab_dRepresentation.v_reprIsBoxed", ("Vuna.Compiler.Elab.Representation.reprIsBoxed", "Vuna/Compiler/Elab/Representation.vuna:160"));
  ("Elab_dRepresentation.v_substFamArgs", ("Vuna.Compiler.Elab.Representation.substFamArgs", "Vuna/Compiler/Elab/Representation.vuna:147"));
  ("Elab_dRepresentation.v_substFamArgsGo", ("Vuna.Compiler.Elab.Representation.substFamArgsGo", "Vuna/Compiler/Elab/Representation.vuna:150"));
  ("Elab_dRepresentation.v_termAppHeadRepresentable", ("Vuna.Compiler.Elab.Representation.termAppHeadRepresentable", "Vuna/Compiler/Elab/Representation.vuna:83"));
  ("Elab_dRepresentation.v_termIsFunction", ("Vuna.Compiler.Elab.Representation.termIsFunction", "Vuna/Compiler/Elab/Representation.vuna:106"));
  ("Elab_dRepresentation.v_termIsFunctionFuel", ("Vuna.Compiler.Elab.Representation.termIsFunctionFuel", "Vuna/Compiler/Elab/Representation.vuna:109"));
  ("Elab_dRepresentation.v_termIsFunctionHead", ("Vuna.Compiler.Elab.Representation.termIsFunctionHead", "Vuna/Compiler/Elab/Representation.vuna:123"));
  ("Elab_dRepresentation.v_termRepresentable", ("Vuna.Compiler.Elab.Representation.termRepresentable", "Vuna/Compiler/Elab/Representation.vuna:72"));
  ("Elab_dRepresentation.v_unboxedCandCtor", ("Vuna.Compiler.Elab.Representation.unboxedCandCtor", "Vuna/Compiler/Elab/Representation.vuna:29"));
  ("Elab_dRepresentation.v_unboxedCandIndex", ("Vuna.Compiler.Elab.Representation.unboxedCandIndex", "Vuna/Compiler/Elab/Representation.vuna:33"));
  ("Elab_dRepresentation.v_unboxedCandName", ("Vuna.Compiler.Elab.Representation.unboxedCandName", "Vuna/Compiler/Elab/Representation.vuna:25"));
  ("Elab_dRepresentation.v_unboxedCandidateOfData", ("Vuna.Compiler.Elab.Representation.unboxedCandidateOfData", "Vuna/Compiler/Elab/Representation.vuna:168"));
  ("Elab_dRepresentation.v_unboxedCandidates", ("Vuna.Compiler.Elab.Representation.unboxedCandidates", "Vuna/Compiler/Elab/Representation.vuna:197"));
  ("Elab_dRepresentation.v_unboxedFamilySet", ("Vuna.Compiler.Elab.Representation.unboxedFamilySet", "Vuna/Compiler/Elab/Representation.vuna:258"));
  ("Elab_dRepresentation.v_unboxedInfoOf", ("Vuna.Compiler.Elab.Representation.unboxedInfoOf", "Vuna/Compiler/Elab/Representation.vuna:246"));
  ("Elab_dSig.v_argParamKinds", ("Vuna.Compiler.Elab.Sig.argParamKinds", "Vuna/Compiler/Elab/Sig.vuna:224"));
  ("Elab_dSig.v_arityFun", ("Vuna.Compiler.Elab.Sig.arityFun", "Vuna/Compiler/Elab/Sig.vuna:26"));
  ("Elab_dSig.v_bannedForModule", ("Vuna.Compiler.Elab.Sig.bannedForModule", "Vuna/Compiler/Elab/Sig.vuna:267"));
  ("Elab_dSig.v_classParamKind", ("Vuna.Compiler.Elab.Sig.classParamKind", "Vuna/Compiler/Elab/Sig.vuna:23"));
  ("Elab_dSig.v_classParamKindOf", ("Vuna.Compiler.Elab.Sig.classParamKindOf", "Vuna/Compiler/Elab/Sig.vuna:20"));
  ("Elab_dSig.v_dataParamKindTbl", ("Vuna.Compiler.Elab.Sig.dataParamKindTbl", "Vuna/Compiler/Elab/Sig.vuna:200"));
  ("Elab_dSig.v_definedNames", ("Vuna.Compiler.Elab.Sig.definedNames", "Vuna/Compiler/Elab/Sig.vuna:369"));
  ("Elab_dSig.v_dropName", ("Vuna.Compiler.Elab.Sig.dropName", "Vuna/Compiler/Elab/Sig.vuna:187"));
  ("Elab_dSig.v_dropPiBound", ("Vuna.Compiler.Elab.Sig.dropPiBound", "Vuna/Compiler/Elab/Sig.vuna:183"));
  ("Elab_dSig.v_exprLowerVars", ("Vuna.Compiler.Elab.Sig.exprLowerVars", "Vuna/Compiler/Elab/Sig.vuna:162"));
  ("Elab_dSig.v_exprMaxAppArity", ("Vuna.Compiler.Elab.Sig.exprMaxAppArity", "Vuna/Compiler/Elab/Sig.vuna:37"));
  ("Elab_dSig.v_filterNamesInModule", ("Vuna.Compiler.Elab.Sig.filterNamesInModule", "Vuna/Compiler/Elab/Sig.vuna:270"));
  ("Elab_dSig.v_freeNames", ("Vuna.Compiler.Elab.Sig.freeNames", "Vuna/Compiler/Elab/Sig.vuna:82"));
  ("Elab_dSig.v_isLowerIdent", ("Vuna.Compiler.Elab.Sig.isLowerIdent", "Vuna/Compiler/Elab/Sig.vuna:177"));
  ("Elab_dSig.v_keepOut", ("Vuna.Compiler.Elab.Sig.keepOut", "Vuna/Compiler/Elab/Sig.vuna:85"));
  ("Elab_dSig.v_keepOutQualified", ("Vuna.Compiler.Elab.Sig.keepOutQualified", "Vuna/Compiler/Elab/Sig.vuna:350"));
  ("Elab_dSig.v_keepOutTbl", ("Vuna.Compiler.Elab.Sig.keepOutTbl", "Vuna/Compiler/Elab/Sig.vuna:360"));
  ("Elab_dSig.v_kindArrowExpr", ("Vuna.Compiler.Elab.Sig.kindArrowExpr", "Vuna/Compiler/Elab/Sig.vuna:148"));
  ("Elab_dSig.v_kindDomains", ("Vuna.Compiler.Elab.Sig.kindDomains", "Vuna/Compiler/Elab/Sig.vuna:210"));
  ("Elab_dSig.v_kindOverrideOf", ("Vuna.Compiler.Elab.Sig.kindOverrideOf", "Vuna/Compiler/Elab/Sig.vuna:340"));
  ("Elab_dSig.v_lookupParamKinds", ("Vuna.Compiler.Elab.Sig.lookupParamKinds", "Vuna/Compiler/Elab/Sig.vuna:243"));
  ("Elab_dSig.v_lowerVarNames", ("Vuna.Compiler.Elab.Sig.lowerVarNames", "Vuna/Compiler/Elab/Sig.vuna:159"));
  ("Elab_dSig.v_maxIntList", ("Vuna.Compiler.Elab.Sig.maxIntList", "Vuna/Compiler/Elab/Sig.vuna:33"));
  ("Elab_dSig.v_memberDomainOf", ("Vuna.Compiler.Elab.Sig.memberDomainOf", "Vuna/Compiler/Elab/Sig.vuna:144"));
  ("Elab_dSig.v_memberDomainOverrides", ("Vuna.Compiler.Elab.Sig.memberDomainOverrides", "Vuna/Compiler/Elab/Sig.vuna:123"));
  ("Elab_dSig.v_memberDomainOverridesOne", ("Vuna.Compiler.Elab.Sig.memberDomainOverridesOne", "Vuna/Compiler/Elab/Sig.vuna:127"));
  ("Elab_dSig.v_methodArgRigsOf", ("Vuna.Compiler.Elab.Sig.methodArgRigsOf", "Vuna/Compiler/Elab/Sig.vuna:62"));
  ("Elab_dSig.v_methodArgRigsOfGo", ("Vuna.Compiler.Elab.Sig.methodArgRigsOfGo", "Vuna/Compiler/Elab/Sig.vuna:65"));
  ("Elab_dSig.v_methodMaxAppArity", ("Vuna.Compiler.Elab.Sig.methodMaxAppArity", "Vuna/Compiler/Elab/Sig.vuna:29"));
  ("Elab_dSig.v_modulePrefixOf", ("Vuna.Compiler.Elab.Sig.modulePrefixOf", "Vuna/Compiler/Elab/Sig.vuna:279"));
  ("Elab_dSig.v_paramKindOf", ("Vuna.Compiler.Elab.Sig.paramKindOf", "Vuna/Compiler/Elab/Sig.vuna:346"));
  ("Elab_dSig.v_piBoundNames", ("Vuna.Compiler.Elab.Sig.piBoundNames", "Vuna/Compiler/Elab/Sig.vuna:155"));
  ("Elab_dSig.v_qualifiedBannedTbl", ("Vuna.Compiler.Elab.Sig.qualifiedBannedTbl", "Vuna/Compiler/Elab/Sig.vuna:293"));
  ("Elab_dSig.v_qualifiedKey", ("Vuna.Compiler.Elab.Sig.qualifiedKey", "Vuna/Compiler/Elab/Sig.vuna:299"));
  ("Elab_dSig.v_quantify", ("Vuna.Compiler.Elab.Sig.quantify", "Vuna/Compiler/Elab/Sig.vuna:89"));
  ("Elab_dSig.v_quantifyTopKinds", ("Vuna.Compiler.Elab.Sig.quantifyTopKinds", "Vuna/Compiler/Elab/Sig.vuna:98"));
  ("Elab_dSig.v_quantifyTopKindsWith", ("Vuna.Compiler.Elab.Sig.quantifyTopKindsWith", "Vuna/Compiler/Elab/Sig.vuna:111"));
  ("Elab_dSig.v_quantifyTopSig", ("Vuna.Compiler.Elab.Sig.quantifyTopSig", "Vuna/Compiler/Elab/Sig.vuna:193"));
  ("Elab_dSig.v_quantifyTopSigCached", ("Vuna.Compiler.Elab.Sig.quantifyTopSigCached", "Vuna/Compiler/Elab/Sig.vuna:303"));
  ("Elab_dSig.v_quantifyTopSigCtxCached", ("Vuna.Compiler.Elab.Sig.quantifyTopSigCtxCached", "Vuna/Compiler/Elab/Sig.vuna:314"));
  ("Elab_dSig.v_quantifyTopSigCtxCachedKinds", ("Vuna.Compiler.Elab.Sig.quantifyTopSigCtxCachedKinds", "Vuna/Compiler/Elab/Sig.vuna:329"));
  ("Elab_dSig.v_quantifyTraitSig", ("Vuna.Compiler.Elab.Sig.quantifyTraitSig", "Vuna/Compiler/Elab/Sig.vuna:79"));
  ("Elab_dSig.v_topPreludeNames", ("Vuna.Compiler.Elab.Sig.topPreludeNames", "Vuna/Compiler/Elab/Sig.vuna:365"));
  ("Elab_dSig.v_topQuantBanned", ("Vuna.Compiler.Elab.Sig.topQuantBanned", "Vuna/Compiler/Elab/Sig.vuna:261"));
  ("Elab_dSig.v_zipArgKinds", ("Vuna.Compiler.Elab.Sig.zipArgKinds", "Vuna/Compiler/Elab/Sig.vuna:248"));
  ("Elab_dSig.v_zipArgKindsGo", ("Vuna.Compiler.Elab.Sig.zipArgKindsGo", "Vuna/Compiler/Elab/Sig.vuna:252"));
  ("Elab_dTerm.v_boolAlt", ("Vuna.Compiler.Elab.Term.boolAlt", "Vuna/Compiler/Elab/Term.vuna:95"));
  ("Elab_dTerm.v_boolAltGo", ("Vuna.Compiler.Elab.Term.boolAltGo", "Vuna/Compiler/Elab/Term.vuna:98"));
  ("Elab_dTerm.v_checkApp", ("Vuna.Compiler.Elab.Term.checkApp", "Vuna/Compiler/Elab/Term.vuna:55"));
  ("Elab_dTerm.v_checkAppCtor", ("Vuna.Compiler.Elab.Term.checkAppCtor", "Vuna/Compiler/Elab/Term.vuna:49"));
  ("Elab_dTerm.v_checkAppGeneral", ("Vuna.Compiler.Elab.Term.checkAppGeneral", "Vuna/Compiler/Elab/Term.vuna:58"));
  ("Elab_dTerm.v_checkAppUnderType", ("Vuna.Compiler.Elab.Term.checkAppUnderType", "Vuna/Compiler/Elab/Term.vuna:52"));
  ("Elab_dTerm.v_checkBoolCase", ("Vuna.Compiler.Elab.Term.checkBoolCase", "Vuna/Compiler/Elab/Term.vuna:92"));
  ("Elab_dTerm.v_checkByInfer", ("Vuna.Compiler.Elab.Term.checkByInfer", "Vuna/Compiler/Elab/Term.vuna:34"));
  ("Elab_dTerm.v_checkCase", ("Vuna.Compiler.Elab.Term.checkCase", "Vuna/Compiler/Elab/Term.vuna:147"));
  ("Elab_dTerm.v_checkCaseFam", ("Vuna.Compiler.Elab.Term.checkCaseFam", "Vuna/Compiler/Elab/Term.vuna:150"));
  ("Elab_dTerm.v_checkCaseOf", ("Vuna.Compiler.Elab.Term.checkCaseOf", "Vuna/Compiler/Elab/Term.vuna:153"));
  ("Elab_dTerm.v_checkCondBool", ("Vuna.Compiler.Elab.Term.checkCondBool", "Vuna/Compiler/Elab/Term.vuna:138"));
  ("Elab_dTerm.v_checkE", ("Vuna.Compiler.Elab.Term.checkE", "Vuna/Compiler/Elab/Term.vuna:105"));
  ("Elab_dTerm.v_checkLam", ("Vuna.Compiler.Elab.Term.checkLam", "Vuna/Compiler/Elab/Term.vuna:67"));
  ("Elab_dTerm.v_checkLet", ("Vuna.Compiler.Elab.Term.checkLet", "Vuna/Compiler/Elab/Term.vuna:73"));
  ("Elab_dTerm.v_checkLetGo", ("Vuna.Compiler.Elab.Term.checkLetGo", "Vuna/Compiler/Elab/Term.vuna:76"));
  ("Elab_dTerm.v_checkLetOne", ("Vuna.Compiler.Elab.Term.checkLetOne", "Vuna/Compiler/Elab/Term.vuna:70"));
  ("Elab_dTerm.v_checkLitAlts", ("Vuna.Compiler.Elab.Term.checkLitAlts", "Vuna/Compiler/Elab/Term.vuna:89"));
  ("Elab_dTerm.v_checkLitBoundVar", ("Vuna.Compiler.Elab.Term.checkLitBoundVar", "Vuna/Compiler/Elab/Term.vuna:79"));
  ("Elab_dTerm.v_checkLitCase", ("Vuna.Compiler.Elab.Term.checkLitCase", "Vuna/Compiler/Elab/Term.vuna:86"));
  ("Elab_dTerm.v_checkType", ("Vuna.Compiler.Elab.Term.checkType", "Vuna/Compiler/Elab/Term.vuna:114"));
  ("Elab_dTerm.v_checkTypeInfer", ("Vuna.Compiler.Elab.Term.checkTypeInfer", "Vuna/Compiler/Elab/Term.vuna:31"));
  ("Elab_dTerm.v_constrainDictDom", ("Vuna.Compiler.Elab.Term.constrainDictDom", "Vuna/Compiler/Elab/Term.vuna:123"));
  ("Elab_dTerm.v_constrainDictDomGoK", ("Vuna.Compiler.Elab.Term.constrainDictDomGoK", "Vuna/Compiler/Elab/Term.vuna:126"));
  ("Elab_dTerm.v_deferDictBinder", ("Vuna.Compiler.Elab.Term.deferDictBinder", "Vuna/Compiler/Elab/Term.vuna:21"));
  ("Elab_dTerm.v_elabCaseAlts", ("Vuna.Compiler.Elab.Term.elabCaseAlts", "Vuna/Compiler/Elab/Term.vuna:156"));
  ("Elab_dTerm.v_elabCatchAll", ("Vuna.Compiler.Elab.Term.elabCatchAll", "Vuna/Compiler/Elab/Term.vuna:101"));
  ("Elab_dTerm.v_elabConAlt", ("Vuna.Compiler.Elab.Term.elabConAlt", "Vuna/Compiler/Elab/Term.vuna:159"));
  ("Elab_dTerm.v_inferAnn", ("Vuna.Compiler.Elab.Term.inferAnn", "Vuna/Compiler/Elab/Term.vuna:111"));
  ("Elab_dTerm.v_inferApp", ("Vuna.Compiler.Elab.Term.inferApp", "Vuna/Compiler/Elab/Term.vuna:129"));
  ("Elab_dTerm.v_inferAppGeneral", ("Vuna.Compiler.Elab.Term.inferAppGeneral", "Vuna/Compiler/Elab/Term.vuna:132"));
  ("Elab_dTerm.v_inferAppGeneralGo", ("Vuna.Compiler.Elab.Term.inferAppGeneralGo", "Vuna/Compiler/Elab/Term.vuna:135"));
  ("Elab_dTerm.v_inferAppUnderType", ("Vuna.Compiler.Elab.Term.inferAppUnderType", "Vuna/Compiler/Elab/Term.vuna:117"));
  ("Elab_dTerm.v_inferArgs", ("Vuna.Compiler.Elab.Term.inferArgs", "Vuna/Compiler/Elab/Term.vuna:120"));
  ("Elab_dTerm.v_inferCaseE", ("Vuna.Compiler.Elab.Term.inferCaseE", "Vuna/Compiler/Elab/Term.vuna:144"));
  ("Elab_dTerm.v_inferE", ("Vuna.Compiler.Elab.Term.inferE", "Vuna/Compiler/Elab/Term.vuna:141"));
  ("Elab_dTerm.v_inferLet", ("Vuna.Compiler.Elab.Term.inferLet", "Vuna/Compiler/Elab/Term.vuna:43"));
  ("Elab_dTerm.v_inferLetBound", ("Vuna.Compiler.Elab.Term.inferLetBound", "Vuna/Compiler/Elab/Term.vuna:40"));
  ("Elab_dTerm.v_inferLetGo", ("Vuna.Compiler.Elab.Term.inferLetGo", "Vuna/Compiler/Elab/Term.vuna:46"));
  ("Elab_dTerm.v_inferLetIgnored", ("Vuna.Compiler.Elab.Term.inferLetIgnored", "Vuna/Compiler/Elab/Term.vuna:37"));
  ("Elab_dTerm.v_inferPi", ("Vuna.Compiler.Elab.Term.inferPi", "Vuna/Compiler/Elab/Term.vuna:108"));
  ("Elab_dTerm.v_litAltStep", ("Vuna.Compiler.Elab.Term.litAltStep", "Vuna/Compiler/Elab/Term.vuna:83"));
  ("Elab_dTerm.v_resolveOverFunPats", ("Vuna.Compiler.Elab.Term.resolveOverFunPats", "Vuna/Compiler/Elab/Term.vuna:164"));
  ("Elab_dTerm.v_specializeBoolApp", ("Vuna.Compiler.Elab.Term.specializeBoolApp", "Vuna/Compiler/Elab/Term.vuna:64"));
  ("Elab_dTerm.v_specializeCmpApp", ("Vuna.Compiler.Elab.Term.specializeCmpApp", "Vuna/Compiler/Elab/Term.vuna:25"));
  ("Elab_dTerm.v_specializeEqApp", ("Vuna.Compiler.Elab.Term.specializeEqApp", "Vuna/Compiler/Elab/Term.vuna:28"));
  ("Elab_dTerm.v_specializeOpApp", ("Vuna.Compiler.Elab.Term.specializeOpApp", "Vuna/Compiler/Elab/Term.vuna:61"));
  ("Elab_dTerm_dImpl.v_anyFieldHasOverCtor", ("Vuna.Compiler.Elab.Term.Impl.anyFieldHasOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:2146"));
  ("Elab_dTerm_dImpl.v_anyPatHasOverCtor", ("Vuna.Compiler.Elab.Term.Impl.anyPatHasOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:2141"));
  ("Elab_dTerm_dImpl.v_appAtCallExpr", ("Vuna.Compiler.Elab.Term.Impl.appAtCallExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:541"));
  ("Elab_dTerm_dImpl.v_appAtOperand", ("Vuna.Compiler.Elab.Term.Impl.appAtOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:535"));
  ("Elab_dTerm_dImpl.v_appAtParts", ("Vuna.Compiler.Elab.Term.Impl.appAtParts", "Vuna/Compiler/Elab/Term/Impl.vuna:1356"));
  ("Elab_dTerm_dImpl.v_applyExtra", ("Vuna.Compiler.Elab.Term.Impl.applyExtra", "Vuna/Compiler/Elab/Term/Impl.vuna:1372"));
  ("Elab_dTerm_dImpl.v_arithFloatName", ("Vuna.Compiler.Elab.Term.Impl.arithFloatName", "Vuna/Compiler/Elab/Term/Impl.vuna:1761"));
  ("Elab_dTerm_dImpl.v_arithNatName", ("Vuna.Compiler.Elab.Term.Impl.arithNatName", "Vuna/Compiler/Elab/Term/Impl.vuna:1743"));
  ("Elab_dTerm_dImpl.v_arithOpNameOf", ("Vuna.Compiler.Elab.Term.Impl.arithOpNameOf", "Vuna/Compiler/Elab/Term/Impl.vuna:1736"));
  ("Elab_dTerm_dImpl.v_bindShapeOf", ("Vuna.Compiler.Elab.Term.Impl.bindShapeOf", "Vuna/Compiler/Elab/Term/Impl.vuna:3488"));
  ("Elab_dTerm_dImpl.v_boolAltFuel", ("Vuna.Compiler.Elab.Term.Impl.boolAltFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:228"));
  ("Elab_dTerm_dImpl.v_boolAltGoFuel", ("Vuna.Compiler.Elab.Term.Impl.boolAltGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:235"));
  ("Elab_dTerm_dImpl.v_branchBinderOpaque", ("Vuna.Compiler.Elab.Term.Impl.branchBinderOpaque", "Vuna/Compiler/Elab/Term/Impl.vuna:44"));
  ("Elab_dTerm_dImpl.v_checkAppByValueFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppByValueFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2851"));
  ("Elab_dTerm_dImpl.v_checkAppCtorFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppCtorFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3338"));
  ("Elab_dTerm_dImpl.v_checkAppFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2821"));
  ("Elab_dTerm_dImpl.v_checkAppGeneralFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppGeneralFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3080"));
  ("Elab_dTerm_dImpl.v_checkAppUnderTypeFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppUnderTypeFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2864"));
  ("Elab_dTerm_dImpl.v_checkBoolCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkBoolCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:208"));
  ("Elab_dTerm_dImpl.v_checkByInferFuel", ("Vuna.Compiler.Elab.Term.Impl.checkByInferFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2678"));
  ("Elab_dTerm_dImpl.v_checkCaseFamFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseFamFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:189"));
  ("Elab_dTerm_dImpl.v_checkCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:152"));
  ("Elab_dTerm_dImpl.v_checkCaseMatrixFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseMatrixFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:178"));
  ("Elab_dTerm_dImpl.v_checkCaseOfFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseOfFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:436"));
  ("Elab_dTerm_dImpl.v_checkCondBoolFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCondBoolFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:472"));
  ("Elab_dTerm_dImpl.v_checkDoBlockFuel", ("Vuna.Compiler.Elab.Term.Impl.checkDoBlockFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3655"));
  ("Elab_dTerm_dImpl.v_checkEFuel", ("Vuna.Compiler.Elab.Term.Impl.checkEFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1880"));
  ("Elab_dTerm_dImpl.v_checkEFuelNoRow", ("Vuna.Compiler.Elab.Term.Impl.checkEFuelNoRow", "Vuna/Compiler/Elab/Term/Impl.vuna:1967"));
  ("Elab_dTerm_dImpl.v_checkEFuelNoRowPlain", ("Vuna.Compiler.Elab.Term.Impl.checkEFuelNoRowPlain", "Vuna/Compiler/Elab/Term/Impl.vuna:2002"));
  ("Elab_dTerm_dImpl.v_checkLamFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLamFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2699"));
  ("Elab_dTerm_dImpl.v_checkLetFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLetFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2119"));
  ("Elab_dTerm_dImpl.v_checkLetGoFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLetGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2227"));
  ("Elab_dTerm_dImpl.v_checkLetOneFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLetOneFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2236"));
  ("Elab_dTerm_dImpl.v_checkLitAltsFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLitAltsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:289"));
  ("Elab_dTerm_dImpl.v_checkLitBoundVarFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLitBoundVarFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:336"));
  ("Elab_dTerm_dImpl.v_checkLitCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLitCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:275"));
  ("Elab_dTerm_dImpl.v_checkNatLitAltsFuel", ("Vuna.Compiler.Elab.Term.Impl.checkNatLitAltsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:378"));
  ("Elab_dTerm_dImpl.v_checkNatLitBoundVarFuel", ("Vuna.Compiler.Elab.Term.Impl.checkNatLitBoundVarFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:422"));
  ("Elab_dTerm_dImpl.v_checkNatLitCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkNatLitCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:366"));
  ("Elab_dTerm_dImpl.v_checkTypeAtKind", ("Vuna.Compiler.Elab.Term.Impl.checkTypeAtKind", "Vuna/Compiler/Elab/Term/Impl.vuna:2899"));
  ("Elab_dTerm_dImpl.v_checkTypeFuel", ("Vuna.Compiler.Elab.Term.Impl.checkTypeFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2770"));
  ("Elab_dTerm_dImpl.v_checkTypeInferFuel", ("Vuna.Compiler.Elab.Term.Impl.checkTypeInferFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2803"));
  ("Elab_dTerm_dImpl.v_clausesHaveOverCtor", ("Vuna.Compiler.Elab.Term.Impl.clausesHaveOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:2151"));
  ("Elab_dTerm_dImpl.v_coerceNatOperands", ("Vuna.Compiler.Elab.Term.Impl.coerceNatOperands", "Vuna/Compiler/Elab/Term/Impl.vuna:1718"));
  ("Elab_dTerm_dImpl.v_coerceTerm", ("Vuna.Compiler.Elab.Term.Impl.coerceTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1713"));
  ("Elab_dTerm_dImpl.v_constrainDictDomFuel", ("Vuna.Compiler.Elab.Term.Impl.constrainDictDomFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1615"));
  ("Elab_dTerm_dImpl.v_constrainDictDomGoKFuel", ("Vuna.Compiler.Elab.Term.Impl.constrainDictDomGoKFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1642"));
  ("Elab_dTerm_dImpl.v_countOpArrows", ("Vuna.Compiler.Elab.Term.Impl.countOpArrows", "Vuna/Compiler/Elab/Term/Impl.vuna:627"));
  ("Elab_dTerm_dImpl.v_ctorFamilyArgs", ("Vuna.Compiler.Elab.Term.Impl.ctorFamilyArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:3171"));
  ("Elab_dTerm_dImpl.v_ctorFamilyArgsGo", ("Vuna.Compiler.Elab.Term.Impl.ctorFamilyArgsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:3185"));
  ("Elab_dTerm_dImpl.v_ctorIdentitySpine", ("Vuna.Compiler.Elab.Term.Impl.ctorIdentitySpine", "Vuna/Compiler/Elab/Term/Impl.vuna:3151"));
  ("Elab_dTerm_dImpl.v_ctorResultArgs", ("Vuna.Compiler.Elab.Term.Impl.ctorResultArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:3125"));
  ("Elab_dTerm_dImpl.v_ctorSpineOfType", ("Vuna.Compiler.Elab.Term.Impl.ctorSpineOfType", "Vuna/Compiler/Elab/Term/Impl.vuna:3129"));
  ("Elab_dTerm_dImpl.v_ctxHasFieldDict", ("Vuna.Compiler.Elab.Term.Impl.ctxHasFieldDict", "Vuna/Compiler/Elab/Term/Impl.vuna:1011"));
  ("Elab_dTerm_dImpl.v_ctxHasFieldDictGo", ("Vuna.Compiler.Elab.Term.Impl.ctxHasFieldDictGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1015"));
  ("Elab_dTerm_dImpl.v_decodeDoBlock", ("Vuna.Compiler.Elab.Term.Impl.decodeDoBlock", "Vuna/Compiler/Elab/Term/Impl.vuna:3434"));
  ("Elab_dTerm_dImpl.v_decodeDoChain", ("Vuna.Compiler.Elab.Term.Impl.decodeDoChain", "Vuna/Compiler/Elab/Term/Impl.vuna:3415"));
  ("Elab_dTerm_dImpl.v_deferDictBinderFuel", ("Vuna.Compiler.Elab.Term.Impl.deferDictBinderFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1597"));
  ("Elab_dTerm_dImpl.v_doBindAppTerm", ("Vuna.Compiler.Elab.Term.Impl.doBindAppTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:3590"));
  ("Elab_dTerm_dImpl.v_doBindHeadOf", ("Vuna.Compiler.Elab.Term.Impl.doBindHeadOf", "Vuna/Compiler/Elab/Term/Impl.vuna:3503"));
  ("Elab_dTerm_dImpl.v_doBlockShapeOf", ("Vuna.Compiler.Elab.Term.Impl.doBlockShapeOf", "Vuna/Compiler/Elab/Term/Impl.vuna:3514"));
  ("Elab_dTerm_dImpl.v_doChainBuild", ("Vuna.Compiler.Elab.Term.Impl.doChainBuild", "Vuna/Compiler/Elab/Term/Impl.vuna:3446"));
  ("Elab_dTerm_dImpl.v_doChainFallback", ("Vuna.Compiler.Elab.Term.Impl.doChainFallback", "Vuna/Compiler/Elab/Term/Impl.vuna:3455"));
  ("Elab_dTerm_dImpl.v_doDictDefer", ("Vuna.Compiler.Elab.Term.Impl.doDictDefer", "Vuna/Compiler/Elab/Term/Impl.vuna:3526"));
  ("Elab_dTerm_dImpl.v_doDictStep", ("Vuna.Compiler.Elab.Term.Impl.doDictStep", "Vuna/Compiler/Elab/Term/Impl.vuna:3535"));
  ("Elab_dTerm_dImpl.v_doMarkerHead", ("Vuna.Compiler.Elab.Term.Impl.doMarkerHead", "Vuna/Compiler/Elab/Term/Impl.vuna:3392"));
  ("Elab_dTerm_dImpl.v_dropPis", ("Vuna.Compiler.Elab.Term.Impl.dropPis", "Vuna/Compiler/Elab/Term/Impl.vuna:3137"));
  ("Elab_dTerm_dImpl.v_effRowAndResult", ("Vuna.Compiler.Elab.Term.Impl.effRowAndResult", "Vuna/Compiler/Elab/Term/Impl.vuna:2427"));
  ("Elab_dTerm_dImpl.v_effRowOfValue", ("Vuna.Compiler.Elab.Term.Impl.effRowOfValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2433"));
  ("Elab_dTerm_dImpl.v_elabCaseAltsFuel", ("Vuna.Compiler.Elab.Term.Impl.elabCaseAltsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:98"));
  ("Elab_dTerm_dImpl.v_elabCatchAllFuel", ("Vuna.Compiler.Elab.Term.Impl.elabCatchAllFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:122"));
  ("Elab_dTerm_dImpl.v_elabConAltFuel", ("Vuna.Compiler.Elab.Term.Impl.elabConAltFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:57"));
  ("Elab_dTerm_dImpl.v_elabDoChain", ("Vuna.Compiler.Elab.Term.Impl.elabDoChain", "Vuna/Compiler/Elab/Term/Impl.vuna:3621"));
  ("Elab_dTerm_dImpl.v_elabEFieldFuel", ("Vuna.Compiler.Elab.Term.Impl.elabEFieldFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1066"));
  ("Elab_dTerm_dImpl.v_elabERecUpdateFuel", ("Vuna.Compiler.Elab.Term.Impl.elabERecUpdateFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1092"));
  ("Elab_dTerm_dImpl.v_expandArgListLit", ("Vuna.Compiler.Elab.Term.Impl.expandArgListLit", "Vuna/Compiler/Elab/Term/Impl.vuna:1454"));
  ("Elab_dTerm_dImpl.v_expandBind", ("Vuna.Compiler.Elab.Term.Impl.expandBind", "Vuna/Compiler/Elab/Term/Impl.vuna:2206"));
  ("Elab_dTerm_dImpl.v_expandDoStmt", ("Vuna.Compiler.Elab.Term.Impl.expandDoStmt", "Vuna/Compiler/Elab/Term/Impl.vuna:2210"));
  ("Elab_dTerm_dImpl.v_expandListLit", ("Vuna.Compiler.Elab.Term.Impl.expandListLit", "Vuna/Compiler/Elab/Term/Impl.vuna:1429"));
  ("Elab_dTerm_dImpl.v_expandListLitGo", ("Vuna.Compiler.Elab.Term.Impl.expandListLitGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1339"));
  ("Elab_dTerm_dImpl.v_expandLocalFuns", ("Vuna.Compiler.Elab.Term.Impl.expandLocalFuns", "Vuna/Compiler/Elab/Term/Impl.vuna:2156"));
  ("Elab_dTerm_dImpl.v_expandRowListLitGo", ("Vuna.Compiler.Elab.Term.Impl.expandRowListLitGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1395"));
  ("Elab_dTerm_dImpl.v_exprFormName", ("Vuna.Compiler.Elab.Term.Impl.exprFormName", "Vuna/Compiler/Elab/Term/Impl.vuna:1942"));
  ("Elab_dTerm_dImpl.v_findCtorByShort", ("Vuna.Compiler.Elab.Term.Impl.findCtorByShort", "Vuna/Compiler/Elab/Term/Impl.vuna:1326"));
  ("Elab_dTerm_dImpl.v_firstCtorOf", ("Vuna.Compiler.Elab.Term.Impl.firstCtorOf", "Vuna/Compiler/Elab/Term/Impl.vuna:1421"));
  ("Elab_dTerm_dImpl.v_floatApp2", ("Vuna.Compiler.Elab.Term.Impl.floatApp2", "Vuna/Compiler/Elab/Term/Impl.vuna:1757"));
  ("Elab_dTerm_dImpl.v_floatTyValue", ("Vuna.Compiler.Elab.Term.Impl.floatTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1690"));
  ("Elab_dTerm_dImpl.v_handleCall", ("Vuna.Compiler.Elab.Term.Impl.handleCall", "Vuna/Compiler/Elab/Term/Impl.vuna:673"));
  ("Elab_dTerm_dImpl.v_handleCallExpr", ("Vuna.Compiler.Elab.Term.Impl.handleCallExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:732"));
  ("Elab_dTerm_dImpl.v_handleCallExprAt", ("Vuna.Compiler.Elab.Term.Impl.handleCallExprAt", "Vuna/Compiler/Elab/Term/Impl.vuna:737"));
  ("Elab_dTerm_dImpl.v_handleCallExprAtHole", ("Vuna.Compiler.Elab.Term.Impl.handleCallExprAtHole", "Vuna/Compiler/Elab/Term/Impl.vuna:742"));
  ("Elab_dTerm_dImpl.v_handleCallExprWith", ("Vuna.Compiler.Elab.Term.Impl.handleCallExprWith", "Vuna/Compiler/Elab/Term/Impl.vuna:716"));
  ("Elab_dTerm_dImpl.v_handleCheckFamilies", ("Vuna.Compiler.Elab.Term.Impl.handleCheckFamilies", "Vuna/Compiler/Elab/Term/Impl.vuna:597"));
  ("Elab_dTerm_dImpl.v_handleClauseFamilies", ("Vuna.Compiler.Elab.Term.Impl.handleClauseFamilies", "Vuna/Compiler/Elab/Term/Impl.vuna:609"));
  ("Elab_dTerm_dImpl.v_handleClauseFamily", ("Vuna.Compiler.Elab.Term.Impl.handleClauseFamily", "Vuna/Compiler/Elab/Term/Impl.vuna:575"));
  ("Elab_dTerm_dImpl.v_handleClauseFamilyOfPat", ("Vuna.Compiler.Elab.Term.Impl.handleClauseFamilyOfPat", "Vuna/Compiler/Elab/Term/Impl.vuna:592"));
  ("Elab_dTerm_dImpl.v_handleDefaultRetBinder", ("Vuna.Compiler.Elab.Term.Impl.handleDefaultRetBinder", "Vuna/Compiler/Elab/Term/Impl.vuna:690"));
  ("Elab_dTerm_dImpl.v_handleFamilyOfCtor", ("Vuna.Compiler.Elab.Term.Impl.handleFamilyOfCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:585"));
  ("Elab_dTerm_dImpl.v_handleHoleArgs", ("Vuna.Compiler.Elab.Term.Impl.handleHoleArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:646"));
  ("Elab_dTerm_dImpl.v_handleOpArg", ("Vuna.Compiler.Elab.Term.Impl.handleOpArg", "Vuna/Compiler/Elab/Term/Impl.vuna:651"));
  ("Elab_dTerm_dImpl.v_handleOpArity", ("Vuna.Compiler.Elab.Term.Impl.handleOpArity", "Vuna/Compiler/Elab/Term/Impl.vuna:621"));
  ("Elab_dTerm_dImpl.v_handleOpKind", ("Vuna.Compiler.Elab.Term.Impl.handleOpKind", "Vuna/Compiler/Elab/Term/Impl.vuna:683"));
  ("Elab_dTerm_dImpl.v_handleOperand", ("Vuna.Compiler.Elab.Term.Impl.handleOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:569"));
  ("Elab_dTerm_dImpl.v_handleRetArg", ("Vuna.Compiler.Elab.Term.Impl.handleRetArg", "Vuna/Compiler/Elab/Term/Impl.vuna:694"));
  ("Elab_dTerm_dImpl.v_handleSigArg", ("Vuna.Compiler.Elab.Term.Impl.handleSigArg", "Vuna/Compiler/Elab/Term/Impl.vuna:664"));
  ("Elab_dTerm_dImpl.v_handleSigBinder", ("Vuna.Compiler.Elab.Term.Impl.handleSigBinder", "Vuna/Compiler/Elab/Term/Impl.vuna:659"));
  ("Elab_dTerm_dImpl.v_hasFieldAccessFuel", ("Vuna.Compiler.Elab.Term.Impl.hasFieldAccessFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1044"));
  ("Elab_dTerm_dImpl.v_hasFieldDictName", ("Vuna.Compiler.Elab.Term.Impl.hasFieldDictName", "Vuna/Compiler/Elab/Term/Impl.vuna:1005"));
  ("Elab_dTerm_dImpl.v_identityArgs", ("Vuna.Compiler.Elab.Term.Impl.identityArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:3141"));
  ("Elab_dTerm_dImpl.v_inferAnnFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAnnFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1121"));
  ("Elab_dTerm_dImpl.v_inferAppFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1203"));
  ("Elab_dTerm_dImpl.v_inferAppGeneralFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppGeneralFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1273"));
  ("Elab_dTerm_dImpl.v_inferAppGeneralGoFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppGeneralGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1288"));
  ("Elab_dTerm_dImpl.v_inferAppUnderTypeFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppUnderTypeFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2875"));
  ("Elab_dTerm_dImpl.v_inferArgsFuel", ("Vuna.Compiler.Elab.Term.Impl.inferArgsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1304"));
  ("Elab_dTerm_dImpl.v_inferArgsGo", ("Vuna.Compiler.Elab.Term.Impl.inferArgsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1460"));
  ("Elab_dTerm_dImpl.v_inferCaseEFuel", ("Vuna.Compiler.Elab.Term.Impl.inferCaseEFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:452"));
  ("Elab_dTerm_dImpl.v_inferDoBlockFuel", ("Vuna.Compiler.Elab.Term.Impl.inferDoBlockFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3698"));
  ("Elab_dTerm_dImpl.v_inferEFuel", ("Vuna.Compiler.Elab.Term.Impl.inferEFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:746"));
  ("Elab_dTerm_dImpl.v_inferEFuelCore", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelCore", "Vuna/Compiler/Elab/Term/Impl.vuna:788"));
  ("Elab_dTerm_dImpl.v_inferEFuelCorePlain", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelCorePlain", "Vuna/Compiler/Elab/Term/Impl.vuna:806"));
  ("Elab_dTerm_dImpl.v_inferEFuelHint", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelHint", "Vuna/Compiler/Elab/Term/Impl.vuna:2400"));
  ("Elab_dTerm_dImpl.v_inferLetBoundFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetBoundFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2298"));
  ("Elab_dTerm_dImpl.v_inferLetFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2217"));
  ("Elab_dTerm_dImpl.v_inferLetGoFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2284"));
  ("Elab_dTerm_dImpl.v_inferLetIgnoredFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetIgnoredFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2320"));
  ("Elab_dTerm_dImpl.v_inferPiFuel", ("Vuna.Compiler.Elab.Term.Impl.inferPiFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1139"));
  ("Elab_dTerm_dImpl.v_instArgOperand", ("Vuna.Compiler.Elab.Term.Impl.instArgOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:529"));
  ("Elab_dTerm_dImpl.v_intApp2", ("Vuna.Compiler.Elab.Term.Impl.intApp2", "Vuna/Compiler/Elab/Term/Impl.vuna:1749"));
  ("Elab_dTerm_dImpl.v_intTyValue", ("Vuna.Compiler.Elab.Term.Impl.intTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1683"));
  ("Elab_dTerm_dImpl.v_isEIntExpr", ("Vuna.Compiler.Elab.Term.Impl.isEIntExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:1767"));
  ("Elab_dTerm_dImpl.v_isFloatTy", ("Vuna.Compiler.Elab.Term.Impl.isFloatTy", "Vuna/Compiler/Elab/Term/Impl.vuna:1706"));
  ("Elab_dTerm_dImpl.v_isIntTy", ("Vuna.Compiler.Elab.Term.Impl.isIntTy", "Vuna/Compiler/Elab/Term/Impl.vuna:1693"));
  ("Elab_dTerm_dImpl.v_isMetaHeadedValue", ("Vuna.Compiler.Elab.Term.Impl.isMetaHeadedValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2357"));
  ("Elab_dTerm_dImpl.v_isNatTy", ("Vuna.Compiler.Elab.Term.Impl.isNatTy", "Vuna/Compiler/Elab/Term/Impl.vuna:1699"));
  ("Elab_dTerm_dImpl.v_isNilRowValue", ("Vuna.Compiler.Elab.Term.Impl.isNilRowValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2440"));
  ("Elab_dTerm_dImpl.v_isRigidHeadValue", ("Vuna.Compiler.Elab.Term.Impl.isRigidHeadValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2364"));
  ("Elab_dTerm_dImpl.v_isSimpleComp", ("Vuna.Compiler.Elab.Term.Impl.isSimpleComp", "Vuna/Compiler/Elab/Term/Impl.vuna:1876"));
  ("Elab_dTerm_dImpl.v_isStringTyValue", ("Vuna.Compiler.Elab.Term.Impl.isStringTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:3047"));
  ("Elab_dTerm_dImpl.v_isUniverseTerm", ("Vuna.Compiler.Elab.Term.Impl.isUniverseTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:641"));
  ("Elab_dTerm_dImpl.v_joinEffectLabels", ("Vuna.Compiler.Elab.Term.Impl.joinEffectLabels", "Vuna/Compiler/Elab/Term/Impl.vuna:2559"));
  ("Elab_dTerm_dImpl.v_labelHeadArgs", ("Vuna.Compiler.Elab.Term.Impl.labelHeadArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:2468"));
  ("Elab_dTerm_dImpl.v_listLitConsTail", ("Vuna.Compiler.Elab.Term.Impl.listLitConsTail", "Vuna/Compiler/Elab/Term/Impl.vuna:1317"));
  ("Elab_dTerm_dImpl.v_listLitElems", ("Vuna.Compiler.Elab.Term.Impl.listLitElems", "Vuna/Compiler/Elab/Term/Impl.vuna:1311"));
  ("Elab_dTerm_dImpl.v_listLitFamily", ("Vuna.Compiler.Elab.Term.Impl.listLitFamily", "Vuna/Compiler/Elab/Term/Impl.vuna:1447"));
  ("Elab_dTerm_dImpl.v_litAltStepFuel", ("Vuna.Compiler.Elab.Term.Impl.litAltStepFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:319"));
  ("Elab_dTerm_dImpl.v_litFamilyCons", ("Vuna.Compiler.Elab.Term.Impl.litFamilyCons", "Vuna/Compiler/Elab/Term/Impl.vuna:1418"));
  ("Elab_dTerm_dImpl.v_litFamilyCtor", ("Vuna.Compiler.Elab.Term.Impl.litFamilyCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:1332"));
  ("Elab_dTerm_dImpl.v_literalTraitLower", ("Vuna.Compiler.Elab.Term.Impl.literalTraitLower", "Vuna/Compiler/Elab/Term/Impl.vuna:1933"));
  ("Elab_dTerm_dImpl.v_namedLabelParts", ("Vuna.Compiler.Elab.Term.Impl.namedLabelParts", "Vuna/Compiler/Elab/Term/Impl.vuna:2488"));
  ("Elab_dTerm_dImpl.v_natApp2", ("Vuna.Compiler.Elab.Term.Impl.natApp2", "Vuna/Compiler/Elab/Term/Impl.vuna:1752"));
  ("Elab_dTerm_dImpl.v_natLitAltStepFuel", ("Vuna.Compiler.Elab.Term.Impl.natLitAltStepFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:406"));
  ("Elab_dTerm_dImpl.v_natLitCaseAlts", ("Vuna.Compiler.Elab.Term.Impl.natLitCaseAlts", "Vuna/Compiler/Elab/Term/Impl.vuna:357"));
  ("Elab_dTerm_dImpl.v_natLitResult", ("Vuna.Compiler.Elab.Term.Impl.natLitResult", "Vuna/Compiler/Elab/Term/Impl.vuna:1677"));
  ("Elab_dTerm_dImpl.v_natLitTerm", ("Vuna.Compiler.Elab.Term.Impl.natLitTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1672"));
  ("Elab_dTerm_dImpl.v_natLitTermGo", ("Vuna.Compiler.Elab.Term.Impl.natLitTermGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1669"));
  ("Elab_dTerm_dImpl.v_natToIntTerm", ("Vuna.Compiler.Elab.Term.Impl.natToIntTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1680"));
  ("Elab_dTerm_dImpl.v_natTyValue", ("Vuna.Compiler.Elab.Term.Impl.natTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1686"));
  ("Elab_dTerm_dImpl.v_needsMatrixCase", ("Vuna.Compiler.Elab.Term.Impl.needsMatrixCase", "Vuna/Compiler/Elab/Term/Impl.vuna:170"));
  ("Elab_dTerm_dImpl.v_opFamilyArityOf", ("Vuna.Compiler.Elab.Term.Impl.opFamilyArityOf", "Vuna/Compiler/Elab/Term/Impl.vuna:705"));
  ("Elab_dTerm_dImpl.v_opaqueBranchIndices", ("Vuna.Compiler.Elab.Term.Impl.opaqueBranchIndices", "Vuna/Compiler/Elab/Term/Impl.vuna:33"));
  ("Elab_dTerm_dImpl.v_opaqueBranchIndicesGo", ("Vuna.Compiler.Elab.Term.Impl.opaqueBranchIndicesGo", "Vuna/Compiler/Elab/Term/Impl.vuna:36"));
  ("Elab_dTerm_dImpl.v_overValueCandidateMatches", ("Vuna.Compiler.Elab.Term.Impl.overValueCandidateMatches", "Vuna/Compiler/Elab/Term/Impl.vuna:1986"));
  ("Elab_dTerm_dImpl.v_patHasOverCtor", ("Vuna.Compiler.Elab.Term.Impl.patHasOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:2133"));
  ("Elab_dTerm_dImpl.v_perfFamilyOfCanonical", ("Vuna.Compiler.Elab.Term.Impl.perfFamilyOfCanonical", "Vuna/Compiler/Elab/Term/Impl.vuna:508"));
  ("Elab_dTerm_dImpl.v_perfFamilyOfValue", ("Vuna.Compiler.Elab.Term.Impl.perfFamilyOfValue", "Vuna/Compiler/Elab/Term/Impl.vuna:516"));
  ("Elab_dTerm_dImpl.v_perfShortOf", ("Vuna.Compiler.Elab.Term.Impl.perfShortOf", "Vuna/Compiler/Elab/Term/Impl.vuna:499"));
  ("Elab_dTerm_dImpl.v_performCallExpr", ("Vuna.Compiler.Elab.Term.Impl.performCallExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:550"));
  ("Elab_dTerm_dImpl.v_performOperand", ("Vuna.Compiler.Elab.Term.Impl.performOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:523"));
  ("Elab_dTerm_dImpl.v_planDoBlock", ("Vuna.Compiler.Elab.Term.Impl.planDoBlock", "Vuna/Compiler/Elab/Term/Impl.vuna:3563"));
  ("Elab_dTerm_dImpl.v_recordFieldLookup", ("Vuna.Compiler.Elab.Term.Impl.recordFieldLookup", "Vuna/Compiler/Elab/Term/Impl.vuna:904"));
  ("Elab_dTerm_dImpl.v_recordFieldLookupGo", ("Vuna.Compiler.Elab.Term.Impl.recordFieldLookupGo", "Vuna/Compiler/Elab/Term/Impl.vuna:907"));
  ("Elab_dTerm_dImpl.v_recordFieldPats", ("Vuna.Compiler.Elab.Term.Impl.recordFieldPats", "Vuna/Compiler/Elab/Term/Impl.vuna:892"));
  ("Elab_dTerm_dImpl.v_recordFieldPatsFrom", ("Vuna.Compiler.Elab.Term.Impl.recordFieldPatsFrom", "Vuna/Compiler/Elab/Term/Impl.vuna:896"));
  ("Elab_dTerm_dImpl.v_recordFieldPlan", ("Vuna.Compiler.Elab.Term.Impl.recordFieldPlan", "Vuna/Compiler/Elab/Term/Impl.vuna:979"));
  ("Elab_dTerm_dImpl.v_recordFieldVarName", ("Vuna.Compiler.Elab.Term.Impl.recordFieldVarName", "Vuna/Compiler/Elab/Term/Impl.vuna:888"));
  ("Elab_dTerm_dImpl.v_recordTypeOf", ("Vuna.Compiler.Elab.Term.Impl.recordTypeOf", "Vuna/Compiler/Elab/Term/Impl.vuna:872"));
  ("Elab_dTerm_dImpl.v_recordUpdateArg", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateArg", "Vuna/Compiler/Elab/Term/Impl.vuna:934"));
  ("Elab_dTerm_dImpl.v_recordUpdateArgs", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:941"));
  ("Elab_dTerm_dImpl.v_recordUpdatePlan", ("Vuna.Compiler.Elab.Term.Impl.recordUpdatePlan", "Vuna/Compiler/Elab/Term/Impl.vuna:990"));
  ("Elab_dTerm_dImpl.v_recordUpdateUnknown", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateUnknown", "Vuna/Compiler/Elab/Term/Impl.vuna:924"));
  ("Elab_dTerm_dImpl.v_recordUpdateUnknownGo", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateUnknownGo", "Vuna/Compiler/Elab/Term/Impl.vuna:916"));
  ("Elab_dTerm_dImpl.v_recordUpdateValueFor", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateValueFor", "Vuna/Compiler/Elab/Term/Impl.vuna:928"));
  ("Elab_dTerm_dImpl.v_recordUpdatedIndices", ("Vuna.Compiler.Elab.Term.Impl.recordUpdatedIndices", "Vuna/Compiler/Elab/Term/Impl.vuna:947"));
  ("Elab_dTerm_dImpl.v_resolveClausePatsFuel", ("Vuna.Compiler.Elab.Term.Impl.resolveClausePatsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3311"));
  ("Elab_dTerm_dImpl.v_resolveCtorPatFuel", ("Vuna.Compiler.Elab.Term.Impl.resolveCtorPatFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3221"));
  ("Elab_dTerm_dImpl.v_resolveOverAlts", ("Vuna.Compiler.Elab.Term.Impl.resolveOverAlts", "Vuna/Compiler/Elab/Term/Impl.vuna:3265"));
  ("Elab_dTerm_dImpl.v_resolveOverAltsGo", ("Vuna.Compiler.Elab.Term.Impl.resolveOverAltsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:3269"));
  ("Elab_dTerm_dImpl.v_resolveOverFunPats", ("Vuna.Compiler.Elab.Term.Impl.resolveOverFunPats", "Vuna/Compiler/Elab/Term/Impl.vuna:3288"));
  ("Elab_dTerm_dImpl.v_resolveOverFunPatsGo", ("Vuna.Compiler.Elab.Term.Impl.resolveOverFunPatsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:3293"));
  ("Elab_dTerm_dImpl.v_resolveOverPatFuel", ("Vuna.Compiler.Elab.Term.Impl.resolveOverPatFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3203"));
  ("Elab_dTerm_dImpl.v_resolveOverValueTarget", ("Vuna.Compiler.Elab.Term.Impl.resolveOverValueTarget", "Vuna/Compiler/Elab/Term/Impl.vuna:1996"));
  ("Elab_dTerm_dImpl.v_resolvePatArgsFuel", ("Vuna.Compiler.Elab.Term.Impl.resolvePatArgsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3237"));
  ("Elab_dTerm_dImpl.v_rowAtParts", ("Vuna.Compiler.Elab.Term.Impl.rowAtParts", "Vuna/Compiler/Elab/Term/Impl.vuna:1351"));
  ("Elab_dTerm_dImpl.v_rowConsArgs", ("Vuna.Compiler.Elab.Term.Impl.rowConsArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:1405"));
  ("Elab_dTerm_dImpl.v_rowConsEntry", ("Vuna.Compiler.Elab.Term.Impl.rowConsEntry", "Vuna/Compiler/Elab/Term/Impl.vuna:1408"));
  ("Elab_dTerm_dImpl.v_rowContainsValue", ("Vuna.Compiler.Elab.Term.Impl.rowContainsValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2592"));
  ("Elab_dTerm_dImpl.v_rowEffectLabels", ("Vuna.Compiler.Elab.Term.Impl.rowEffectLabels", "Vuna/Compiler/Elab/Term/Impl.vuna:2507"));
  ("Elab_dTerm_dImpl.v_rowEntryLabelTail", ("Vuna.Compiler.Elab.Term.Impl.rowEntryLabelTail", "Vuna/Compiler/Elab/Term/Impl.vuna:2447"));
  ("Elab_dTerm_dImpl.v_rowEntryParts", ("Vuna.Compiler.Elab.Term.Impl.rowEntryParts", "Vuna/Compiler/Elab/Term/Impl.vuna:1363"));
  ("Elab_dTerm_dImpl.v_rowEntryText", ("Vuna.Compiler.Elab.Term.Impl.rowEntryText", "Vuna/Compiler/Elab/Term/Impl.vuna:2480"));
  ("Elab_dTerm_dImpl.v_rowEntryTextOf", ("Vuna.Compiler.Elab.Term.Impl.rowEntryTextOf", "Vuna/Compiler/Elab/Term/Impl.vuna:2500"));
  ("Elab_dTerm_dImpl.v_rowLabelText", ("Vuna.Compiler.Elab.Term.Impl.rowLabelText", "Vuna/Compiler/Elab/Term/Impl.vuna:2462"));
  ("Elab_dTerm_dImpl.v_rowLitLabel", ("Vuna.Compiler.Elab.Term.Impl.rowLitLabel", "Vuna/Compiler/Elab/Term/Impl.vuna:1377"));
  ("Elab_dTerm_dImpl.v_rowLitNameArg", ("Vuna.Compiler.Elab.Term.Impl.rowLitNameArg", "Vuna/Compiler/Elab/Term/Impl.vuna:1383"));
  ("Elab_dTerm_dImpl.v_rowLitNameExpr", ("Vuna.Compiler.Elab.Term.Impl.rowLitNameExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:1389"));
  ("Elab_dTerm_dImpl.v_rowNameText", ("Vuna.Compiler.Elab.Term.Impl.rowNameText", "Vuna/Compiler/Elab/Term/Impl.vuna:2473"));
  ("Elab_dTerm_dImpl.v_rowNonDefaultHostEntries", ("Vuna.Compiler.Elab.Term.Impl.rowNonDefaultHostEntries", "Vuna/Compiler/Elab/Term/Impl.vuna:2533"));
  ("Elab_dTerm_dImpl.v_rowSubValue", ("Vuna.Compiler.Elab.Term.Impl.rowSubValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2607"));
  ("Elab_dTerm_dImpl.v_sameLabelValue", ("Vuna.Compiler.Elab.Term.Impl.sameLabelValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2589"));
  ("Elab_dTerm_dImpl.v_shortGlobalName", ("Vuna.Compiler.Elab.Term.Impl.shortGlobalName", "Vuna/Compiler/Elab/Term/Impl.vuna:2458"));
  ("Elab_dTerm_dImpl.v_skipArithSpecForExpected", ("Vuna.Compiler.Elab.Term.Impl.skipArithSpecForExpected", "Vuna/Compiler/Elab/Term/Impl.vuna:1181"));
  ("Elab_dTerm_dImpl.v_skipArithSpecForHint", ("Vuna.Compiler.Elab.Term.Impl.skipArithSpecForHint", "Vuna/Compiler/Elab/Term/Impl.vuna:1198"));
  ("Elab_dTerm_dImpl.v_specializeArithAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1830"));
  ("Elab_dTerm_dImpl.v_specializeArithAppOpFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithAppOpFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1840"));
  ("Elab_dTerm_dImpl.v_specializeArithCheckFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithCheckFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1774"));
  ("Elab_dTerm_dImpl.v_specializeArithCheckOpFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithCheckOpFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1784"));
  ("Elab_dTerm_dImpl.v_specializeBoolAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeBoolAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3059"));
  ("Elab_dTerm_dImpl.v_specializeCmpAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeCmpAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2960"));
  ("Elab_dTerm_dImpl.v_specializeEqAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeEqAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2936"));
  ("Elab_dTerm_dImpl.v_specializeInterpPrimApp", ("Vuna.Compiler.Elab.Term.Impl.specializeInterpPrimApp", "Vuna/Compiler/Elab/Term/Impl.vuna:3019"));
  ("Elab_dTerm_dImpl.v_specializeOpAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeOpAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2986"));
  ("Elab_dTerm_dImpl.v_splitDoExpected", ("Vuna.Compiler.Elab.Term.Impl.splitDoExpected", "Vuna/Compiler/Elab/Term/Impl.vuna:3470"));
  ("Elab_dTerm_dImpl.v_splitDoSpine", ("Vuna.Compiler.Elab.Term.Impl.splitDoSpine", "Vuna/Compiler/Elab/Term/Impl.vuna:3462"));
  ("Elab_dTerm_dImpl.v_strFromFloatTerm", ("Vuna.Compiler.Elab.Term.Impl.strFromFloatTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:3041"));
  ("Elab_dTerm_dImpl.v_strFromIntTerm", ("Vuna.Compiler.Elab.Term.Impl.strFromIntTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:3037"));
  ("Elab_dTerm_dImpl.v_strTyValue", ("Vuna.Compiler.Elab.Term.Impl.strTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:3044"));
  ("Elab_dTerm_dImpl.v_stripPisWithMetas", ("Vuna.Compiler.Elab.Term.Impl.stripPisWithMetas", "Vuna/Compiler/Elab/Term/Impl.vuna:2342"));
  ("Elab_dTerm_dImpl.v_takeRigs", ("Vuna.Compiler.Elab.Term.Impl.takeRigs", "Vuna/Compiler/Elab/Term/Impl.vuna:3164"));
  ("Elab_dTerm_dImpl.v_takeRigsGo", ("Vuna.Compiler.Elab.Term.Impl.takeRigsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:3167"));
  ("Elab_dTerm_dImpl.v_tryEffLift", ("Vuna.Compiler.Elab.Term.Impl.tryEffLift", "Vuna/Compiler/Elab/Term/Impl.vuna:2627"));
  ("Elab_dTerm_dImpl.v_tryUseHint", ("Vuna.Compiler.Elab.Term.Impl.tryUseHint", "Vuna/Compiler/Elab/Term/Impl.vuna:2377"));
  ("Elab_dTerm_dImpl.v_typeAppTerm", ("Vuna.Compiler.Elab.Term.Impl.typeAppTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2764"));
  ("Elab_dTerm_dImpl.v_typeHeadTerm", ("Vuna.Compiler.Elab.Term.Impl.typeHeadTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2757"));
  ("Elab_dTerm_dImpl.v_unhandledEffectLabel", ("Vuna.Compiler.Elab.Term.Impl.unhandledEffectLabel", "Vuna/Compiler/Elab/Term/Impl.vuna:2567"));
  ("Elab_dTerm_dImpl.v_weakenLabelTerm", ("Vuna.Compiler.Elab.Term.Impl.weakenLabelTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2671"));
  ("Elab_dTerm_dImpl.v_wrapRowEntry", ("Vuna.Compiler.Elab.Term.Impl.wrapRowEntry", "Vuna/Compiler/Elab/Term/Impl.vuna:1413"));
  ("Elab_dTerm_dSupport.v_allImplicitPrefix", ("Vuna.Compiler.Elab.Term.Support.allImplicitPrefix", "Vuna/Compiler/Elab/Term/Support.vuna:41"));
  ("Elab_dTerm_dSupport.v_checkBindingSigs", ("Vuna.Compiler.Elab.Term.Support.checkBindingSigs", "Vuna/Compiler/Elab/Term/Support.vuna:68"));
  ("Elab_dTerm_dSupport.v_checkWhereSigs", ("Vuna.Compiler.Elab.Term.Support.checkWhereSigs", "Vuna/Compiler/Elab/Term/Support.vuna:72"));
  ("Elab_dTerm_dSupport.v_inferVarRef", ("Vuna.Compiler.Elab.Term.Support.inferVarRef", "Vuna/Compiler/Elab/Term/Support.vuna:21"));
  ("Elab_dTerm_dSupport.v_instantiateAllImplicit", ("Vuna.Compiler.Elab.Term.Support.instantiateAllImplicit", "Vuna/Compiler/Elab/Term/Support.vuna:46"));
  ("Elab_dTerm_dSupport.v_instantiateAllImplicitFuel", ("Vuna.Compiler.Elab.Term.Support.instantiateAllImplicitFuel", "Vuna/Compiler/Elab/Term/Support.vuna:49"));
  ("Elab_dTerm_dSupport.v_whereBindingName", ("Vuna.Compiler.Elab.Term.Support.whereBindingName", "Vuna/Compiler/Elab/Term/Support.vuna:82"));
  ("Elab_dTerm_dSupport.v_withEffectLabels", ("Vuna.Compiler.Elab.Term.Support.withEffectLabels", "Vuna/Compiler/Elab/Term/Support.vuna:87"));
  ("Elab_dTermination.v_addEdge", ("Vuna.Compiler.Elab.Termination.addEdge", "Vuna/Compiler/Elab/Termination.vuna:110"));
  ("Elab_dTermination.v_addEdges", ("Vuna.Compiler.Elab.Termination.addEdges", "Vuna/Compiler/Elab/Termination.vuna:116"));
  ("Elab_dTermination.v_addSrcs", ("Vuna.Compiler.Elab.Termination.addSrcs", "Vuna/Compiler/Elab/Termination.vuna:93"));
  ("Elab_dTermination.v_adjOf", ("Vuna.Compiler.Elab.Termination.adjOf", "Vuna/Compiler/Elab/Termination.vuna:79"));
  ("Elab_dTermination.v_adjTblOf", ("Vuna.Compiler.Elab.Termination.adjTblOf", "Vuna/Compiler/Elab/Termination.vuna:85"));
  ("Elab_dTermination.v_anyOwnTbl", ("Vuna.Compiler.Elab.Termination.anyOwnTbl", "Vuna/Compiler/Elab/Termination.vuna:596"));
  ("Elab_dTermination.v_applyCallFields", ("Vuna.Compiler.Elab.Termination.applyCallFields", "Vuna/Compiler/Elab/Termination.vuna:434"));
  ("Elab_dTermination.v_betterFail", ("Vuna.Compiler.Elab.Termination.betterFail", "Vuna/Compiler/Elab/Termination.vuna:495"));
  ("Elab_dTermination.v_callGraph", ("Vuna.Compiler.Elab.Termination.callGraph", "Vuna/Compiler/Elab/Termination.vuna:76"));
  ("Elab_dTermination.v_callMode", ("Vuna.Compiler.Elab.Termination.callMode", "Vuna/Compiler/Elab/Termination.vuna:611"));
  ("Elab_dTermination.v_cannotProveMsgEdges", ("Vuna.Compiler.Elab.Termination.cannotProveMsgEdges", "Vuna/Compiler/Elab/Termination.vuna:422"));
  ("Elab_dTermination.v_checkComp", ("Vuna.Compiler.Elab.Termination.checkComp", "Vuna/Compiler/Elab/Termination.vuna:534"));
  ("Elab_dTermination.v_checkSccsWith", ("Vuna.Compiler.Elab.Termination.checkSccsWith", "Vuna/Compiler/Elab/Termination.vuna:600"));
  ("Elab_dTermination.v_checkStrictGroup", ("Vuna.Compiler.Elab.Termination.checkStrictGroup", "Vuna/Compiler/Elab/Termination.vuna:523"));
  ("Elab_dTermination.v_checkTerminationDecls", ("Vuna.Compiler.Elab.Termination.checkTerminationDecls", "Vuna/Compiler/Elab/Termination.vuna:560"));
  ("Elab_dTermination.v_checkTerminationDeclsWith", ("Vuna.Compiler.Elab.Termination.checkTerminationDeclsWith", "Vuna/Compiler/Elab/Termination.vuna:570"));
  ("Elab_dTermination.v_collectClauses", ("Vuna.Compiler.Elab.Termination.collectClauses", "Vuna/Compiler/Elab/Termination.vuna:442"));
  ("Elab_dTermination.v_collectComp", ("Vuna.Compiler.Elab.Termination.collectComp", "Vuna/Compiler/Elab/Termination.vuna:167"));
  ("Elab_dTermination.v_collectMeasure", ("Vuna.Compiler.Elab.Termination.collectMeasure", "Vuna/Compiler/Elab/Termination.vuna:461"));
  ("Elab_dTermination.v_computePosFactsWork", ("Vuna.Compiler.Elab.Termination.computePosFactsWork", "Vuna/Compiler/Elab/Termination.vuna:542"));
  ("Elab_dTermination.v_dedupTransposed", ("Vuna.Compiler.Elab.Termination.dedupTransposed", "Vuna/Compiler/Elab/Termination.vuna:127"));
  ("Elab_dTermination.v_dfsAll", ("Vuna.Compiler.Elab.Termination.dfsAll", "Vuna/Compiler/Elab/Termination.vuna:148"));
  ("Elab_dTermination.v_dfsPost", ("Vuna.Compiler.Elab.Termination.dfsPost", "Vuna/Compiler/Elab/Termination.vuna:139"));
  ("Elab_dTermination.v_dfunNames", ("Vuna.Compiler.Elab.Termination.dfunNames", "Vuna/Compiler/Elab/Termination.vuna:563"));
  ("Elab_dTermination.v_edgeCount", ("Vuna.Compiler.Elab.Termination.edgeCount", "Vuna/Compiler/Elab/Termination.vuna:131"));
  ("Elab_dTermination.v_edgeRankOf", ("Vuna.Compiler.Elab.Termination.edgeRankOf", "Vuna/Compiler/Elab/Termination.vuna:488"));
  ("Elab_dTermination.v_edgesRankOf", ("Vuna.Compiler.Elab.Termination.edgesRankOf", "Vuna/Compiler/Elab/Termination.vuna:491"));
  ("Elab_dTermination.v_emptyFail", ("Vuna.Compiler.Elab.Termination.emptyFail", "Vuna/Compiler/Elab/Termination.vuna:474"));
  ("Elab_dTermination.v_exprRefsB", ("Vuna.Compiler.Elab.Termination.exprRefsB", "Vuna/Compiler/Elab/Termination.vuna:38"));
  ("Elab_dTermination.v_graphFuel", ("Vuna.Compiler.Elab.Termination.graphFuel", "Vuna/Compiler/Elab/Termination.vuna:135"));
  ("Elab_dTermination.v_groupMessage", ("Vuna.Compiler.Elab.Termination.groupMessage", "Vuna/Compiler/Elab/Termination.vuna:416"));
  ("Elab_dTermination.v_hintEdge", ("Vuna.Compiler.Elab.Termination.hintEdge", "Vuna/Compiler/Elab/Termination.vuna:231"));
  ("Elab_dTermination.v_hintRankOf", ("Vuna.Compiler.Elab.Termination.hintRankOf", "Vuna/Compiler/Elab/Termination.vuna:478"));
  ("Elab_dTermination.v_mapEdges", ("Vuna.Compiler.Elab.Termination.mapEdges", "Vuna/Compiler/Elab/Termination.vuna:70"));
  ("Elab_dTermination.v_patNames", ("Vuna.Compiler.Elab.Termination.patNames", "Vuna/Compiler/Elab/Termination.vuna:15"));
  ("Elab_dTermination.v_patsNames", ("Vuna.Compiler.Elab.Termination.patsNames", "Vuna/Compiler/Elab/Termination.vuna:23"));
  ("Elab_dTermination.v_postOrder", ("Vuna.Compiler.Elab.Termination.postOrder", "Vuna/Compiler/Elab/Termination.vuna:160"));
  ("Elab_dTermination.v_refsOfDef", ("Vuna.Compiler.Elab.Termination.refsOfDef", "Vuna/Compiler/Elab/Termination.vuna:67"));
  ("Elab_dTermination.v_refsOfStmt", ("Vuna.Compiler.Elab.Termination.refsOfStmt", "Vuna/Compiler/Elab/Termination.vuna:26"));
  ("Elab_dTermination.v_refsOfStmts", ("Vuna.Compiler.Elab.Termination.refsOfStmts", "Vuna/Compiler/Elab/Termination.vuna:30"));
  ("Elab_dTermination.v_replacePair", ("Vuna.Compiler.Elab.Termination.replacePair", "Vuna/Compiler/Elab/Termination.vuna:103"));
  ("Elab_dTermination.v_reverseAdjOf", ("Vuna.Compiler.Elab.Termination.reverseAdjOf", "Vuna/Compiler/Elab/Termination.vuna:89"));
  ("Elab_dTermination.v_sccOf", ("Vuna.Compiler.Elab.Termination.sccOf", "Vuna/Compiler/Elab/Termination.vuna:185"));
  ("Elab_dTermination.v_strClause", ("Vuna.Compiler.Elab.Termination.strClause", "Vuna/Compiler/Elab/Termination.vuna:399"));
  ("Elab_dTermination.v_strWalk", ("Vuna.Compiler.Elab.Termination.strWalk", "Vuna/Compiler/Elab/Termination.vuna:199"));
  ("Elab_dTermination.v_strWalkAlts", ("Vuna.Compiler.Elab.Termination.strWalkAlts", "Vuna/Compiler/Elab/Termination.vuna:327"));
  ("Elab_dTermination.v_strWalkApp", ("Vuna.Compiler.Elab.Termination.strWalkApp", "Vuna/Compiler/Elab/Termination.vuna:289"));
  ("Elab_dTermination.v_strWalkArgs", ("Vuna.Compiler.Elab.Termination.strWalkArgs", "Vuna/Compiler/Elab/Termination.vuna:307"));
  ("Elab_dTermination.v_strWalkBinds", ("Vuna.Compiler.Elab.Termination.strWalkBinds", "Vuna/Compiler/Elab/Termination.vuna:348"));
  ("Elab_dTermination.v_strWalkEApp", ("Vuna.Compiler.Elab.Termination.strWalkEApp", "Vuna/Compiler/Elab/Termination.vuna:237"));
  ("Elab_dTermination.v_strWalkEAppMap", ("Vuna.Compiler.Elab.Termination.strWalkEAppMap", "Vuna/Compiler/Elab/Termination.vuna:262"));
  ("Elab_dTermination.v_strWalkFields", ("Vuna.Compiler.Elab.Termination.strWalkFields", "Vuna/Compiler/Elab/Termination.vuna:368"));
  ("Elab_dTermination.v_strWalkMapPartialInline", ("Vuna.Compiler.Elab.Termination.strWalkMapPartialInline", "Vuna/Compiler/Elab/Termination.vuna:275"));
  ("Elab_dTermination.v_strWalkStmts", ("Vuna.Compiler.Elab.Termination.strWalkStmts", "Vuna/Compiler/Elab/Termination.vuna:388"));
  ("Elab_dTermination.v_transpose", ("Vuna.Compiler.Elab.Termination.transpose", "Vuna/Compiler/Elab/Termination.vuna:124"));
  ("Elab_dTermination.v_transposeGo", ("Vuna.Compiler.Elab.Termination.transposeGo", "Vuna/Compiler/Elab/Termination.vuna:120"));
  ("Elab_dTermination.v_tryMeasure", ("Vuna.Compiler.Elab.Termination.tryMeasure", "Vuna/Compiler/Elab/Termination.vuna:502"));
  ("Elab_dTermination.v_tryMeasureGo", ("Vuna.Compiler.Elab.Termination.tryMeasureGo", "Vuna/Compiler/Elab/Termination.vuna:506"));
  ("Elab_dTermination_dMeasure.v_addEdgeMode", ("Vuna.Compiler.Elab.Termination.Measure.addEdgeMode", "Vuna/Compiler/Elab/Termination/Measure.vuna:892"));
  ("Elab_dTermination_dMeasure.v_allEqTo", ("Vuna.Compiler.Elab.Termination.Measure.allEqTo", "Vuna/Compiler/Elab/Termination/Measure.vuna:19"));
  ("Elab_dTermination_dMeasure.v_allSame", ("Vuna.Compiler.Elab.Termination.Measure.allSame", "Vuna/Compiler/Elab/Termination/Measure.vuna:23"));
  ("Elab_dTermination_dMeasure.v_argPositive", ("Vuna.Compiler.Elab.Termination.Measure.argPositive", "Vuna/Compiler/Elab/Termination/Measure.vuna:388"));
  ("Elab_dTermination_dMeasure.v_argRel", ("Vuna.Compiler.Elab.Termination.Measure.argRel", "Vuna/Compiler/Elab/Termination/Measure.vuna:845"));
  ("Elab_dTermination_dMeasure.v_argRelHint", ("Vuna.Compiler.Elab.Termination.Measure.argRelHint", "Vuna/Compiler/Elab/Termination/Measure.vuna:853"));
  ("Elab_dTermination_dMeasure.v_arithMinus", ("Vuna.Compiler.Elab.Termination.Measure.arithMinus", "Vuna/Compiler/Elab/Termination/Measure.vuna:792"));
  ("Elab_dTermination_dMeasure.v_arithMinusBase", ("Vuna.Compiler.Elab.Termination.Measure.arithMinusBase", "Vuna/Compiler/Elab/Termination/Measure.vuna:797"));
  ("Elab_dTermination_dMeasure.v_arithRel", ("Vuna.Compiler.Elab.Termination.Measure.arithRel", "Vuna/Compiler/Elab/Termination/Measure.vuna:777"));
  ("Elab_dTermination_dMeasure.v_clausesOfDef", ("Vuna.Compiler.Elab.Termination.Measure.clausesOfDef", "Vuna/Compiler/Elab/Termination/Measure.vuna:143"));
  ("Elab_dTermination_dMeasure.v_clausesOfDefTbl", ("Vuna.Compiler.Elab.Termination.Measure.clausesOfDefTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:148"));
  ("Elab_dTermination_dMeasure.v_computePosFacts", ("Vuna.Compiler.Elab.Termination.Measure.computePosFacts", "Vuna/Compiler/Elab/Termination/Measure.vuna:651"));
  ("Elab_dTermination_dMeasure.v_computePosFactsStep", ("Vuna.Compiler.Elab.Termination.Measure.computePosFactsStep", "Vuna/Compiler/Elab/Termination/Measure.vuna:654"));
  ("Elab_dTermination_dMeasure.v_ctorNameOf", ("Vuna.Compiler.Elab.Termination.Measure.ctorNameOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:172"));
  ("Elab_dTermination_dMeasure.v_ctorNamesOf", ("Vuna.Compiler.Elab.Termination.Measure.ctorNamesOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:163"));
  ("Elab_dTermination_dMeasure.v_dedup", ("Vuna.Compiler.Elab.Termination.Measure.dedup", "Vuna/Compiler/Elab/Termination/Measure.vuna:28"));
  ("Elab_dTermination_dMeasure.v_dedupInts", ("Vuna.Compiler.Elab.Termination.Measure.dedupInts", "Vuna/Compiler/Elab/Termination/Measure.vuna:426"));
  ("Elab_dTermination_dMeasure.v_defArity", ("Vuna.Compiler.Elab.Termination.Measure.defArity", "Vuna/Compiler/Elab/Termination/Measure.vuna:154"));
  ("Elab_dTermination_dMeasure.v_defNames", ("Vuna.Compiler.Elab.Termination.Measure.defNames", "Vuna/Compiler/Elab/Termination/Measure.vuna:140"));
  ("Elab_dTermination_dMeasure.v_edgeStrict", ("Vuna.Compiler.Elab.Termination.Measure.edgeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:995"));
  ("Elab_dTermination_dMeasure.v_edgeStrictGo", ("Vuna.Compiler.Elab.Termination.Measure.edgeStrictGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:998"));
  ("Elab_dTermination_dMeasure.v_edgeTargets", ("Vuna.Compiler.Elab.Termination.Measure.edgeTargets", "Vuna/Compiler/Elab/Termination/Measure.vuna:1009"));
  ("Elab_dTermination_dMeasure.v_edgeTargetsGo", ("Vuna.Compiler.Elab.Termination.Measure.edgeTargetsGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:1012"));
  ("Elab_dTermination_dMeasure.v_extendByBinds", ("Vuna.Compiler.Elab.Termination.Measure.extendByBinds", "Vuna/Compiler/Elab/Termination/Measure.vuna:219"));
  ("Elab_dTermination_dMeasure.v_extendElemSizes", ("Vuna.Compiler.Elab.Termination.Measure.extendElemSizes", "Vuna/Compiler/Elab/Termination/Measure.vuna:985"));
  ("Elab_dTermination_dMeasure.v_extendSizesStrict", ("Vuna.Compiler.Elab.Termination.Measure.extendSizesStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:202"));
  ("Elab_dTermination_dMeasure.v_fieldsSizeStrict", ("Vuna.Compiler.Elab.Termination.Measure.fieldsSizeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:190"));
  ("Elab_dTermination_dMeasure.v_filterModes", ("Vuna.Compiler.Elab.Termination.Measure.filterModes", "Vuna/Compiler/Elab/Termination/Measure.vuna:1096"));
  ("Elab_dTermination_dMeasure.v_findWrapField", ("Vuna.Compiler.Elab.Termination.Measure.findWrapField", "Vuna/Compiler/Elab/Termination/Measure.vuna:743"));
  ("Elab_dTermination_dMeasure.v_foldLHofSpec", ("Vuna.Compiler.Elab.Termination.Measure.foldLHofSpec", "Vuna/Compiler/Elab/Termination/Measure.vuna:923"));
  ("Elab_dTermination_dMeasure.v_foldRHofSpec", ("Vuna.Compiler.Elab.Termination.Measure.foldRHofSpec", "Vuna/Compiler/Elab/Termination/Measure.vuna:926"));
  ("Elab_dTermination_dMeasure.v_funDeclsOf", ("Vuna.Compiler.Elab.Termination.Measure.funDeclsOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:101"));
  ("Elab_dTermination_dMeasure.v_groupDefs", ("Vuna.Compiler.Elab.Termination.Measure.groupDefs", "Vuna/Compiler/Elab/Termination/Measure.vuna:117"));
  ("Elab_dTermination_dMeasure.v_groupDefsGo", ("Vuna.Compiler.Elab.Termination.Measure.groupDefsGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:133"));
  ("Elab_dTermination_dMeasure.v_groupHead", ("Vuna.Compiler.Elab.Termination.Measure.groupHead", "Vuna/Compiler/Elab/Termination/Measure.vuna:896"));
  ("Elab_dTermination_dMeasure.v_guardElsePosAtom", ("Vuna.Compiler.Elab.Termination.Measure.guardElsePosAtom", "Vuna/Compiler/Elab/Termination/Measure.vuna:319"));
  ("Elab_dTermination_dMeasure.v_guardElsePosVars", ("Vuna.Compiler.Elab.Termination.Measure.guardElsePosVars", "Vuna/Compiler/Elab/Termination/Measure.vuna:367"));
  ("Elab_dTermination_dMeasure.v_guardGE", ("Vuna.Compiler.Elab.Termination.Measure.guardGE", "Vuna/Compiler/Elab/Termination/Measure.vuna:258"));
  ("Elab_dTermination_dMeasure.v_guardInter", ("Vuna.Compiler.Elab.Termination.Measure.guardInter", "Vuna/Compiler/Elab/Termination/Measure.vuna:288"));
  ("Elab_dTermination_dMeasure.v_guardLE", ("Vuna.Compiler.Elab.Termination.Measure.guardLE", "Vuna/Compiler/Elab/Termination/Measure.vuna:251"));
  ("Elab_dTermination_dMeasure.v_guardLT", ("Vuna.Compiler.Elab.Termination.Measure.guardLT", "Vuna/Compiler/Elab/Termination/Measure.vuna:265"));
  ("Elab_dTermination_dMeasure.v_guardPosVar", ("Vuna.Compiler.Elab.Termination.Measure.guardPosVar", "Vuna/Compiler/Elab/Termination/Measure.vuna:231"));
  ("Elab_dTermination_dMeasure.v_guardThenPosAtom", ("Vuna.Compiler.Elab.Termination.Measure.guardThenPosAtom", "Vuna/Compiler/Elab/Termination/Measure.vuna:293"));
  ("Elab_dTermination_dMeasure.v_guardThenPosVars", ("Vuna.Compiler.Elab.Termination.Measure.guardThenPosVars", "Vuna/Compiler/Elab/Termination/Measure.vuna:345"));
  ("Elab_dTermination_dMeasure.v_guardUnion", ("Vuna.Compiler.Elab.Termination.Measure.guardUnion", "Vuna/Compiler/Elab/Termination/Measure.vuna:285"));
  ("Elab_dTermination_dMeasure.v_hasWeakCycle", ("Vuna.Compiler.Elab.Termination.Measure.hasWeakCycle", "Vuna/Compiler/Elab/Termination/Measure.vuna:1039"));
  ("Elab_dTermination_dMeasure.v_hasWeakCycleGo", ("Vuna.Compiler.Elab.Termination.Measure.hasWeakCycleGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:1042"));
  ("Elab_dTermination_dMeasure.v_hintArith", ("Vuna.Compiler.Elab.Termination.Measure.hintArith", "Vuna/Compiler/Elab/Termination/Measure.vuna:877"));
  ("Elab_dTermination_dMeasure.v_hofLambdaCall", ("Vuna.Compiler.Elab.Termination.Measure.hofLambdaCall", "Vuna/Compiler/Elab/Termination/Measure.vuna:967"));
  ("Elab_dTermination_dMeasure.v_hofSpecOf", ("Vuna.Compiler.Elab.Termination.Measure.hofSpecOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:929"));
  ("Elab_dTermination_dMeasure.v_isAddOpName", ("Vuna.Compiler.Elab.Termination.Measure.isAddOpName", "Vuna/Compiler/Elab/Termination/Measure.vuna:789"));
  ("Elab_dTermination_dMeasure.v_isDescent", ("Vuna.Compiler.Elab.Termination.Measure.isDescent", "Vuna/Compiler/Elab/Termination/Measure.vuna:1093"));
  ("Elab_dTermination_dMeasure.v_isSubOpName", ("Vuna.Compiler.Elab.Termination.Measure.isSubOpName", "Vuna/Compiler/Elab/Termination/Measure.vuna:785"));
  ("Elab_dTermination_dMeasure.v_joinComma", ("Vuna.Compiler.Elab.Termination.Measure.joinComma", "Vuna/Compiler/Elab/Termination/Measure.vuna:31"));
  ("Elab_dTermination_dMeasure.v_localClauseBinds", ("Vuna.Compiler.Elab.Termination.Measure.localClauseBinds", "Vuna/Compiler/Elab/Termination/Measure.vuna:278"));
  ("Elab_dTermination_dMeasure.v_lookupGroup", ("Vuna.Compiler.Elab.Termination.Measure.lookupGroup", "Vuna/Compiler/Elab/Termination/Measure.vuna:108"));
  ("Elab_dTermination_dMeasure.v_markInvalid", ("Vuna.Compiler.Elab.Termination.Measure.markInvalid", "Vuna/Compiler/Elab/Termination/Measure.vuna:889"));
  ("Elab_dTermination_dMeasure.v_maxArityOf", ("Vuna.Compiler.Elab.Termination.Measure.maxArityOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:158"));
  ("Elab_dTermination_dMeasure.v_maxInt", ("Vuna.Compiler.Elab.Termination.Measure.maxInt", "Vuna/Compiler/Elab/Termination/Measure.vuna:12"));
  ("Elab_dTermination_dMeasure.v_memInt", ("Vuna.Compiler.Elab.Termination.Measure.memInt", "Vuna/Compiler/Elab/Termination/Measure.vuna:60"));
  ("Elab_dTermination_dMeasure.v_notEmpty", ("Vuna.Compiler.Elab.Termination.Measure.notEmpty", "Vuna/Compiler/Elab/Termination/Measure.vuna:15"));
  ("Elab_dTermination_dMeasure.v_nthExpr", ("Vuna.Compiler.Elab.Termination.Measure.nthExpr", "Vuna/Compiler/Elab/Termination/Measure.vuna:900"));
  ("Elab_dTermination_dMeasure.v_nthName", ("Vuna.Compiler.Elab.Termination.Measure.nthName", "Vuna/Compiler/Elab/Termination/Measure.vuna:945"));
  ("Elab_dTermination_dMeasure.v_opBaseName", ("Vuna.Compiler.Elab.Termination.Measure.opBaseName", "Vuna/Compiler/Elab/Termination/Measure.vuna:248"));
  ("Elab_dTermination_dMeasure.v_patSizeStrict", ("Vuna.Compiler.Elab.Termination.Measure.patSizeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:175"));
  ("Elab_dTermination_dMeasure.v_pathInFields", ("Vuna.Compiler.Elab.Termination.Measure.pathInFields", "Vuna/Compiler/Elab/Termination/Measure.vuna:671"));
  ("Elab_dTermination_dMeasure.v_pathInPat", ("Vuna.Compiler.Elab.Termination.Measure.pathInPat", "Vuna/Compiler/Elab/Termination/Measure.vuna:678"));
  ("Elab_dTermination_dMeasure.v_pathInPats", ("Vuna.Compiler.Elab.Termination.Measure.pathInPats", "Vuna/Compiler/Elab/Termination/Measure.vuna:664"));
  ("Elab_dTermination_dMeasure.v_patsSizeStrict", ("Vuna.Compiler.Elab.Termination.Measure.patsSizeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:185"));
  ("Elab_dTermination_dMeasure.v_peelLam", ("Vuna.Compiler.Elab.Termination.Measure.peelLam", "Vuna/Compiler/Elab/Termination/Measure.vuna:950"));
  ("Elab_dTermination_dMeasure.v_posAdd", ("Vuna.Compiler.Elab.Termination.Measure.posAdd", "Vuna/Compiler/Elab/Termination/Measure.vuna:64"));
  ("Elab_dTermination_dMeasure.v_posEntryPairs", ("Vuna.Compiler.Elab.Termination.Measure.posEntryPairs", "Vuna/Compiler/Elab/Termination/Measure.vuna:423"));
  ("Elab_dTermination_dMeasure.v_posFilter", ("Vuna.Compiler.Elab.Termination.Measure.posFilter", "Vuna/Compiler/Elab/Termination/Measure.vuna:74"));
  ("Elab_dTermination_dMeasure.v_posFilterTbl", ("Vuna.Compiler.Elab.Termination.Measure.posFilterTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:85"));
  ("Elab_dTermination_dMeasure.v_posHas", ("Vuna.Compiler.Elab.Termination.Measure.posHas", "Vuna/Compiler/Elab/Termination/Measure.vuna:37"));
  ("Elab_dTermination_dMeasure.v_posHasTbl", ("Vuna.Compiler.Elab.Termination.Measure.posHasTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:54"));
  ("Elab_dTermination_dMeasure.v_posMarkNeg", ("Vuna.Compiler.Elab.Termination.Measure.posMarkNeg", "Vuna/Compiler/Elab/Termination/Measure.vuna:413"));
  ("Elab_dTermination_dMeasure.v_posMarkPos", ("Vuna.Compiler.Elab.Termination.Measure.posMarkPos", "Vuna/Compiler/Elab/Termination/Measure.vuna:410"));
  ("Elab_dTermination_dMeasure.v_posNormalize", ("Vuna.Compiler.Elab.Termination.Measure.posNormalize", "Vuna/Compiler/Elab/Termination/Measure.vuna:417"));
  ("Elab_dTermination_dMeasure.v_posScanClauses", ("Vuna.Compiler.Elab.Termination.Measure.posScanClauses", "Vuna/Compiler/Elab/Termination/Measure.vuna:615"));
  ("Elab_dTermination_dMeasure.v_posScanDefs", ("Vuna.Compiler.Elab.Termination.Measure.posScanDefs", "Vuna/Compiler/Elab/Termination/Measure.vuna:623"));
  ("Elab_dTermination_dMeasure.v_posScanNames", ("Vuna.Compiler.Elab.Termination.Measure.posScanNames", "Vuna/Compiler/Elab/Termination/Measure.vuna:634"));
  ("Elab_dTermination_dMeasure.v_posScanNamesGo", ("Vuna.Compiler.Elab.Termination.Measure.posScanNamesGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:640"));
  ("Elab_dTermination_dMeasure.v_posSetEq", ("Vuna.Compiler.Elab.Termination.Measure.posSetEq", "Vuna/Compiler/Elab/Termination/Measure.vuna:71"));
  ("Elab_dTermination_dMeasure.v_posSetEqTbl", ("Vuna.Compiler.Elab.Termination.Measure.posSetEqTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:94"));
  ("Elab_dTermination_dMeasure.v_posSubset", ("Vuna.Compiler.Elab.Termination.Measure.posSubset", "Vuna/Compiler/Elab/Termination/Measure.vuna:67"));
  ("Elab_dTermination_dMeasure.v_posSubsetTbl", ("Vuna.Compiler.Elab.Termination.Measure.posSubsetTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:90"));
  ("Elab_dTermination_dMeasure.v_posTblOf", ("Vuna.Compiler.Elab.Termination.Measure.posTblOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:44"));
  ("Elab_dTermination_dMeasure.v_posTblOfGo", ("Vuna.Compiler.Elab.Termination.Measure.posTblOfGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:47"));
  ("Elab_dTermination_dMeasure.v_posTblPairs", ("Vuna.Compiler.Elab.Termination.Measure.posTblPairs", "Vuna/Compiler/Elab/Termination/Measure.vuna:420"));
  ("Elab_dTermination_dMeasure.v_posUnion", ("Vuna.Compiler.Elab.Termination.Measure.posUnion", "Vuna/Compiler/Elab/Termination/Measure.vuna:79"));
  ("Elab_dTermination_dMeasure.v_posUnionTbl", ("Vuna.Compiler.Elab.Termination.Measure.posUnionTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:98"));
  ("Elab_dTermination_dMeasure.v_posVarIn", ("Vuna.Compiler.Elab.Termination.Measure.posVarIn", "Vuna/Compiler/Elab/Termination/Measure.vuna:774"));
  ("Elab_dTermination_dMeasure.v_posWalk", ("Vuna.Compiler.Elab.Termination.Measure.posWalk", "Vuna/Compiler/Elab/Termination/Measure.vuna:514"));
  ("Elab_dTermination_dMeasure.v_posWalkAlts", ("Vuna.Compiler.Elab.Termination.Measure.posWalkAlts", "Vuna/Compiler/Elab/Termination/Measure.vuna:454"));
  ("Elab_dTermination_dMeasure.v_posWalkArgs", ("Vuna.Compiler.Elab.Termination.Measure.posWalkArgs", "Vuna/Compiler/Elab/Termination/Measure.vuna:430"));
  ("Elab_dTermination_dMeasure.v_posWalkBinds", ("Vuna.Compiler.Elab.Termination.Measure.posWalkBinds", "Vuna/Compiler/Elab/Termination/Measure.vuna:479"));
  ("Elab_dTermination_dMeasure.v_posWalkCallee", ("Vuna.Compiler.Elab.Termination.Measure.posWalkCallee", "Vuna/Compiler/Elab/Termination/Measure.vuna:601"));
  ("Elab_dTermination_dMeasure.v_posWalkCalleeGo", ("Vuna.Compiler.Elab.Termination.Measure.posWalkCalleeGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:605"));
  ("Elab_dTermination_dMeasure.v_posWalkClauses", ("Vuna.Compiler.Elab.Termination.Measure.posWalkClauses", "Vuna/Compiler/Elab/Termination/Measure.vuna:467"));
  ("Elab_dTermination_dMeasure.v_posWalkFields", ("Vuna.Compiler.Elab.Termination.Measure.posWalkFields", "Vuna/Compiler/Elab/Termination/Measure.vuna:442"));
  ("Elab_dTermination_dMeasure.v_posWalkStmts", ("Vuna.Compiler.Elab.Termination.Measure.posWalkStmts", "Vuna/Compiler/Elab/Termination/Measure.vuna:491"));
  ("Elab_dTermination_dMeasure.v_projHas", ("Vuna.Compiler.Elab.Termination.Measure.projHas", "Vuna/Compiler/Elab/Termination/Measure.vuna:707"));
  ("Elab_dTermination_dMeasure.v_projRel", ("Vuna.Compiler.Elab.Termination.Measure.projRel", "Vuna/Compiler/Elab/Termination/Measure.vuna:814"));
  ("Elab_dTermination_dMeasure.v_projectionOfDef", ("Vuna.Compiler.Elab.Termination.Measure.projectionOfDef", "Vuna/Compiler/Elab/Termination/Measure.vuna:685"));
  ("Elab_dTermination_dMeasure.v_projectionsOf", ("Vuna.Compiler.Elab.Termination.Measure.projectionsOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:700"));
  ("Elab_dTermination_dMeasure.v_relAscending", ("Vuna.Compiler.Elab.Termination.Measure.relAscending", "Vuna/Compiler/Elab/Termination/Measure.vuna:1070"));
  ("Elab_dTermination_dMeasure.v_relEqual", ("Vuna.Compiler.Elab.Termination.Measure.relEqual", "Vuna/Compiler/Elab/Termination/Measure.vuna:1049"));
  ("Elab_dTermination_dMeasure.v_relMissingGuard", ("Vuna.Compiler.Elab.Termination.Measure.relMissingGuard", "Vuna/Compiler/Elab/Termination/Measure.vuna:1061"));
  ("Elab_dTermination_dMeasure.v_relNoRelation", ("Vuna.Compiler.Elab.Termination.Measure.relNoRelation", "Vuna/Compiler/Elab/Termination/Measure.vuna:1064"));
  ("Elab_dTermination_dMeasure.v_relOfArg", ("Vuna.Compiler.Elab.Termination.Measure.relOfArg", "Vuna/Compiler/Elab/Termination/Measure.vuna:826"));
  ("Elab_dTermination_dMeasure.v_relOtherPosition", ("Vuna.Compiler.Elab.Termination.Measure.relOtherPosition", "Vuna/Compiler/Elab/Termination/Measure.vuna:1067"));
  ("Elab_dTermination_dMeasure.v_relStrictMinus", ("Vuna.Compiler.Elab.Termination.Measure.relStrictMinus", "Vuna/Compiler/Elab/Termination/Measure.vuna:1055"));
  ("Elab_dTermination_dMeasure.v_relStrictSub", ("Vuna.Compiler.Elab.Termination.Measure.relStrictSub", "Vuna/Compiler/Elab/Termination/Measure.vuna:1052"));
  ("Elab_dTermination_dMeasure.v_relText", ("Vuna.Compiler.Elab.Termination.Measure.relText", "Vuna/Compiler/Elab/Termination/Measure.vuna:1074"));
  ("Elab_dTermination_dMeasure.v_relUnknownSize", ("Vuna.Compiler.Elab.Termination.Measure.relUnknownSize", "Vuna/Compiler/Elab/Termination/Measure.vuna:1058"));
  ("Elab_dTermination_dMeasure.v_replaceGroup", ("Vuna.Compiler.Elab.Termination.Measure.replaceGroup", "Vuna/Compiler/Elab/Termination/Measure.vuna:112"));
  ("Elab_dTermination_dMeasure.v_sameCtorApp", ("Vuna.Compiler.Elab.Termination.Measure.sameCtorApp", "Vuna/Compiler/Elab/Termination/Measure.vuna:713"));
  ("Elab_dTermination_dMeasure.v_sameCtorField", ("Vuna.Compiler.Elab.Termination.Measure.sameCtorField", "Vuna/Compiler/Elab/Termination/Measure.vuna:728"));
  ("Elab_dTermination_dMeasure.v_sameCtorGo", ("Vuna.Compiler.Elab.Termination.Measure.sameCtorGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:716"));
  ("Elab_dTermination_dMeasure.v_sizeOfVarStrict", ("Vuna.Compiler.Elab.Termination.Measure.sizeOfVarStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:223"));
  ("Elab_dTermination_dMeasure.v_strSizeEntries", ("Vuna.Compiler.Elab.Termination.Measure.strSizeEntries", "Vuna/Compiler/Elab/Termination/Measure.vuna:195"));
  ("Elab_dTermination_dMeasure.v_strSizeEntriesGo", ("Vuna.Compiler.Elab.Termination.Measure.strSizeEntriesGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:198"));
  ("Elab_dTermination_dMeasure.v_unaryHofSpec", ("Vuna.Compiler.Elab.Termination.Measure.unaryHofSpec", "Vuna/Compiler/Elab/Termination/Measure.vuna:920"));
  ("Elab_dTermination_dMeasure.v_varOfExpr", ("Vuna.Compiler.Elab.Termination.Measure.varOfExpr", "Vuna/Compiler/Elab/Termination/Measure.vuna:272"));
  ("Elab_dTermination_dMeasure.v_weakAdj", ("Vuna.Compiler.Elab.Termination.Measure.weakAdj", "Vuna/Compiler/Elab/Termination/Measure.vuna:1018"));
  ("Elab_dTermination_dMeasure.v_weakAdjGo", ("Vuna.Compiler.Elab.Termination.Measure.weakAdjGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:1021"));
  ("Elab_dTermination_dMeasure.v_weakReach", ("Vuna.Compiler.Elab.Termination.Measure.weakReach", "Vuna/Compiler/Elab/Termination/Measure.vuna:1026"));
  ("Elab_dTermination_dMeasure.v_weakReachFuel", ("Vuna.Compiler.Elab.Termination.Measure.weakReachFuel", "Vuna/Compiler/Elab/Termination/Measure.vuna:1029"));
  ("Elab_dTermination_dMeasure.v_wrapCheck", ("Vuna.Compiler.Elab.Termination.Measure.wrapCheck", "Vuna/Compiler/Elab/Termination/Measure.vuna:761"));
  ("Elab_dTermination_dScc.v_aliasNameOf", ("Vuna.Compiler.Elab.Termination.Scc.aliasNameOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:199"));
  ("Elab_dTermination_dScc.v_aliasOf", ("Vuna.Compiler.Elab.Termination.Scc.aliasOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:210"));
  ("Elab_dTermination_dScc.v_allWeakEdges", ("Vuna.Compiler.Elab.Termination.Scc.allWeakEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:950"));
  ("Elab_dTermination_dScc.v_argBases", ("Vuna.Compiler.Elab.Termination.Scc.argBases", "Vuna/Compiler/Elab/Termination/Scc.vuna:527"));
  ("Elab_dTermination_dScc.v_argBasesAlts", ("Vuna.Compiler.Elab.Termination.Scc.argBasesAlts", "Vuna/Compiler/Elab/Termination/Scc.vuna:618"));
  ("Elab_dTermination_dScc.v_argBasesArgs", ("Vuna.Compiler.Elab.Termination.Scc.argBasesArgs", "Vuna/Compiler/Elab/Termination/Scc.vuna:603"));
  ("Elab_dTermination_dScc.v_argBasesBinds", ("Vuna.Compiler.Elab.Termination.Scc.argBasesBinds", "Vuna/Compiler/Elab/Termination/Scc.vuna:613"));
  ("Elab_dTermination_dScc.v_argBasesClauses", ("Vuna.Compiler.Elab.Termination.Scc.argBasesClauses", "Vuna/Compiler/Elab/Termination/Scc.vuna:623"));
  ("Elab_dTermination_dScc.v_argBasesFields", ("Vuna.Compiler.Elab.Termination.Scc.argBasesFields", "Vuna/Compiler/Elab/Termination/Scc.vuna:608"));
  ("Elab_dTermination_dScc.v_argBasesGo", ("Vuna.Compiler.Elab.Termination.Scc.argBasesGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:563"));
  ("Elab_dTermination_dScc.v_argBasesParts", ("Vuna.Compiler.Elab.Termination.Scc.argBasesParts", "Vuna/Compiler/Elab/Termination/Scc.vuna:638"));
  ("Elab_dTermination_dScc.v_argBasesStmts", ("Vuna.Compiler.Elab.Termination.Scc.argBasesStmts", "Vuna/Compiler/Elab/Termination/Scc.vuna:630"));
  ("Elab_dTermination_dScc.v_badGraphText", ("Vuna.Compiler.Elab.Termination.Scc.badGraphText", "Vuna/Compiler/Elab/Termination/Scc.vuna:750"));
  ("Elab_dTermination_dScc.v_basesUpTo", ("Vuna.Compiler.Elab.Termination.Scc.basesUpTo", "Vuna/Compiler/Elab/Termination/Scc.vuna:533"));
  ("Elab_dTermination_dScc.v_basesUpToGo", ("Vuna.Compiler.Elab.Termination.Scc.basesUpToGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:530"));
  ("Elab_dTermination_dScc.v_blindEdges", ("Vuna.Compiler.Elab.Termination.Scc.blindEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:657"));
  ("Elab_dTermination_dScc.v_blindEdgesI", ("Vuna.Compiler.Elab.Termination.Scc.blindEdgesI", "Vuna/Compiler/Elab/Termination/Scc.vuna:650"));
  ("Elab_dTermination_dScc.v_blindEdgesJ", ("Vuna.Compiler.Elab.Termination.Scc.blindEdgesJ", "Vuna/Compiler/Elab/Termination/Scc.vuna:646"));
  ("Elab_dTermination_dScc.v_blindPairText", ("Vuna.Compiler.Elab.Termination.Scc.blindPairText", "Vuna/Compiler/Elab/Termination/Scc.vuna:768"));
  ("Elab_dTermination_dScc.v_blindSitesOf", ("Vuna.Compiler.Elab.Termination.Scc.blindSitesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:25"));
  ("Elab_dTermination_dScc.v_callerFuelName", ("Vuna.Compiler.Elab.Termination.Scc.callerFuelName", "Vuna/Compiler/Elab/Termination/Scc.vuna:863"));
  ("Elab_dTermination_dScc.v_canonEdges", ("Vuna.Compiler.Elab.Termination.Scc.canonEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:366"));
  ("Elab_dTermination_dScc.v_closureLoop", ("Vuna.Compiler.Elab.Termination.Scc.closureLoop", "Vuna/Compiler/Elab/Termination/Scc.vuna:512"));
  ("Elab_dTermination_dScc.v_closureStep", ("Vuna.Compiler.Elab.Termination.Scc.closureStep", "Vuna/Compiler/Elab/Termination/Scc.vuna:499"));
  ("Elab_dTermination_dScc.v_closureStepGo", ("Vuna.Compiler.Elab.Termination.Scc.closureStepGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:492"));
  ("Elab_dTermination_dScc.v_closureStepGraphs", ("Vuna.Compiler.Elab.Termination.Scc.closureStepGraphs", "Vuna/Compiler/Elab/Termination/Scc.vuna:485"));
  ("Elab_dTermination_dScc.v_closureStepHs", ("Vuna.Compiler.Elab.Termination.Scc.closureStepHs", "Vuna/Compiler/Elab/Termination/Scc.vuna:465"));
  ("Elab_dTermination_dScc.v_closureStepOne", ("Vuna.Compiler.Elab.Termination.Scc.closureStepOne", "Vuna/Compiler/Elab/Termination/Scc.vuna:472"));
  ("Elab_dTermination_dScc.v_closureStepOneGo", ("Vuna.Compiler.Elab.Termination.Scc.closureStepOneGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:475"));
  ("Elab_dTermination_dScc.v_combineWith", ("Vuna.Compiler.Elab.Termination.Scc.combineWith", "Vuna/Compiler/Elab/Termination/Scc.vuna:385"));
  ("Elab_dTermination_dScc.v_compactEdges", ("Vuna.Compiler.Elab.Termination.Scc.compactEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:355"));
  ("Elab_dTermination_dScc.v_composeEdges", ("Vuna.Compiler.Elab.Termination.Scc.composeEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:398"));
  ("Elab_dTermination_dScc.v_composeGo", ("Vuna.Compiler.Elab.Termination.Scc.composeGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:394"));
  ("Elab_dTermination_dScc.v_countGraphs", ("Vuna.Compiler.Elab.Termination.Scc.countGraphs", "Vuna/Compiler/Elab/Termination/Scc.vuna:783"));
  ("Elab_dTermination_dScc.v_dedupBases", ("Vuna.Compiler.Elab.Termination.Scc.dedupBases", "Vuna/Compiler/Elab/Termination/Scc.vuna:540"));
  ("Elab_dTermination_dScc.v_dropAliases", ("Vuna.Compiler.Elab.Termination.Scc.dropAliases", "Vuna/Compiler/Elab/Termination/Scc.vuna:206"));
  ("Elab_dTermination_dScc.v_edgeModeOf", ("Vuna.Compiler.Elab.Termination.Scc.edgeModeOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:992"));
  ("Elab_dTermination_dScc.v_edgeText", ("Vuna.Compiler.Elab.Termination.Scc.edgeText", "Vuna/Compiler/Elab/Termination/Scc.vuna:736"));
  ("Elab_dTermination_dScc.v_edgesEq", ("Vuna.Compiler.Elab.Termination.Scc.edgesEq", "Vuna/Compiler/Elab/Termination/Scc.vuna:382"));
  ("Elab_dTermination_dScc.v_edgesEqCanon", ("Vuna.Compiler.Elab.Termination.Scc.edgesEqCanon", "Vuna/Compiler/Elab/Termination/Scc.vuna:369"));
  ("Elab_dTermination_dScc.v_edgesText", ("Vuna.Compiler.Elab.Termination.Scc.edgesText", "Vuna/Compiler/Elab/Termination/Scc.vuna:745"));
  ("Elab_dTermination_dScc.v_fuelAcceptable", ("Vuna.Compiler.Elab.Termination.Scc.fuelAcceptable", "Vuna/Compiler/Elab/Termination/Scc.vuna:974"));
  ("Elab_dTermination_dScc.v_fuelEdgesGo", ("Vuna.Compiler.Elab.Termination.Scc.fuelEdgesGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:920"));
  ("Elab_dTermination_dScc.v_fuelEdgesOf", ("Vuna.Compiler.Elab.Termination.Scc.fuelEdgesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:915"));
  ("Elab_dTermination_dScc.v_fuelParamIndexOf", ("Vuna.Compiler.Elab.Termination.Scc.fuelParamIndexOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:849"));
  ("Elab_dTermination_dScc.v_fuelParamNameOf", ("Vuna.Compiler.Elab.Termination.Scc.fuelParamNameOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:841"));
  ("Elab_dTermination_dScc.v_graphIdempotent", ("Vuna.Compiler.Elab.Termination.Scc.graphIdempotent", "Vuna/Compiler/Elab/Termination/Scc.vuna:405"));
  ("Elab_dTermination_dScc.v_graphListHas", ("Vuna.Compiler.Elab.Termination.Scc.graphListHas", "Vuna/Compiler/Elab/Termination/Scc.vuna:431"));
  ("Elab_dTermination_dScc.v_graphListSubset", ("Vuna.Compiler.Elab.Termination.Scc.graphListSubset", "Vuna/Compiler/Elab/Termination/Scc.vuna:435"));
  ("Elab_dTermination_dScc.v_graphOK", ("Vuna.Compiler.Elab.Termination.Scc.graphOK", "Vuna/Compiler/Elab/Termination/Scc.vuna:410"));
  ("Elab_dTermination_dScc.v_graphsOK", ("Vuna.Compiler.Elab.Termination.Scc.graphsOK", "Vuna/Compiler/Elab/Termination/Scc.vuna:413"));
  ("Elab_dTermination_dScc.v_guardParamGo", ("Vuna.Compiler.Elab.Termination.Scc.guardParamGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:836"));
  ("Elab_dTermination_dScc.v_hasBase", ("Vuna.Compiler.Elab.Termination.Scc.hasBase", "Vuna/Compiler/Elab/Termination/Scc.vuna:536"));
  ("Elab_dTermination_dScc.v_hasFuelGuard", ("Vuna.Compiler.Elab.Termination.Scc.hasFuelGuard", "Vuna/Compiler/Elab/Termination/Scc.vuna:829"));
  ("Elab_dTermination_dScc.v_hasStrict", ("Vuna.Compiler.Elab.Termination.Scc.hasStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:401"));
  ("Elab_dTermination_dScc.v_initialTable", ("Vuna.Compiler.Elab.Termination.Scc.initialTable", "Vuna/Compiler/Elab/Termination/Scc.vuna:702"));
  ("Elab_dTermination_dScc.v_initialTableGo", ("Vuna.Compiler.Elab.Termination.Scc.initialTableGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:705"));
  ("Elab_dTermination_dScc.v_inlAlts", ("Vuna.Compiler.Elab.Termination.Scc.inlAlts", "Vuna/Compiler/Elab/Termination/Scc.vuna:251"));
  ("Elab_dTermination_dScc.v_inlArgs", ("Vuna.Compiler.Elab.Termination.Scc.inlArgs", "Vuna/Compiler/Elab/Termination/Scc.vuna:219"));
  ("Elab_dTermination_dScc.v_inlBinds", ("Vuna.Compiler.Elab.Termination.Scc.inlBinds", "Vuna/Compiler/Elab/Termination/Scc.vuna:234"));
  ("Elab_dTermination_dScc.v_inlClauses", ("Vuna.Compiler.Elab.Termination.Scc.inlClauses", "Vuna/Compiler/Elab/Termination/Scc.vuna:256"));
  ("Elab_dTermination_dScc.v_inlFields", ("Vuna.Compiler.Elab.Termination.Scc.inlFields", "Vuna/Compiler/Elab/Termination/Scc.vuna:223"));
  ("Elab_dTermination_dScc.v_inlGo", ("Vuna.Compiler.Elab.Termination.Scc.inlGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:269"));
  ("Elab_dTermination_dScc.v_inlParts", ("Vuna.Compiler.Elab.Termination.Scc.inlParts", "Vuna/Compiler/Elab/Termination/Scc.vuna:227"));
  ("Elab_dTermination_dScc.v_inlStmts", ("Vuna.Compiler.Elab.Termination.Scc.inlStmts", "Vuna/Compiler/Elab/Termination/Scc.vuna:261"));
  ("Elab_dTermination_dScc.v_inlineAliases", ("Vuna.Compiler.Elab.Termination.Scc.inlineAliases", "Vuna/Compiler/Elab/Termination/Scc.vuna:299"));
  ("Elab_dTermination_dScc.v_insertEdge", ("Vuna.Compiler.Elab.Termination.Scc.insertEdge", "Vuna/Compiler/Elab/Termination/Scc.vuna:338"));
  ("Elab_dTermination_dScc.v_isBlindSite", ("Vuna.Compiler.Elab.Termination.Scc.isBlindSite", "Vuna/Compiler/Elab/Termination/Scc.vuna:765"));
  ("Elab_dTermination_dScc.v_lookupAlias", ("Vuna.Compiler.Elab.Termination.Scc.lookupAlias", "Vuna/Compiler/Elab/Termination/Scc.vuna:202"));
  ("Elab_dTermination_dScc.v_maxBaseOf", ("Vuna.Compiler.Elab.Termination.Scc.maxBaseOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:334"));
  ("Elab_dTermination_dScc.v_memberGuarded", ("Vuna.Compiler.Elab.Termination.Scc.memberGuarded", "Vuna/Compiler/Elab/Termination/Scc.vuna:938"));
  ("Elab_dTermination_dScc.v_mergeStrict", ("Vuna.Compiler.Elab.Termination.Scc.mergeStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:352"));
  ("Elab_dTermination_dScc.v_nthDeps", ("Vuna.Compiler.Elab.Termination.Scc.nthDeps", "Vuna/Compiler/Elab/Termination/Scc.vuna:673"));
  ("Elab_dTermination_dScc.v_onlyUnguarded", ("Vuna.Compiler.Elab.Termination.Scc.onlyUnguarded", "Vuna/Compiler/Elab/Termination/Scc.vuna:955"));
  ("Elab_dTermination_dScc.v_paramIndexGo", ("Vuna.Compiler.Elab.Termination.Scc.paramIndexGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:822"));
  ("Elab_dTermination_dScc.v_paramNamesOf", ("Vuna.Compiler.Elab.Termination.Scc.paramNamesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:815"));
  ("Elab_dTermination_dScc.v_paramsOf", ("Vuna.Compiler.Elab.Termination.Scc.paramsOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:875"));
  ("Elab_dTermination_dScc.v_patNamesOf", ("Vuna.Compiler.Elab.Termination.Scc.patNamesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:544"));
  ("Elab_dTermination_dScc.v_patNamesOfBinds", ("Vuna.Compiler.Elab.Termination.Scc.patNamesOfBinds", "Vuna/Compiler/Elab/Termination/Scc.vuna:559"));
  ("Elab_dTermination_dScc.v_patNamesOfFields", ("Vuna.Compiler.Elab.Termination.Scc.patNamesOfFields", "Vuna/Compiler/Elab/Termination/Scc.vuna:555"));
  ("Elab_dTermination_dScc.v_patNamesOfPats", ("Vuna.Compiler.Elab.Termination.Scc.patNamesOfPats", "Vuna/Compiler/Elab/Termination/Scc.vuna:551"));
  ("Elab_dTermination_dScc.v_scIsStrict", ("Vuna.Compiler.Elab.Termination.Scc.scIsStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:331"));
  ("Elab_dTermination_dScc.v_sctBadGraphs", ("Vuna.Compiler.Elab.Termination.Scc.sctBadGraphs", "Vuna/Compiler/Elab/Termination/Scc.vuna:727"));
  ("Elab_dTermination_dScc.v_sctBadPairs", ("Vuna.Compiler.Elab.Termination.Scc.sctBadPairs", "Vuna/Compiler/Elab/Termination/Scc.vuna:731"));
  ("Elab_dTermination_dScc.v_sctBadText", ("Vuna.Compiler.Elab.Termination.Scc.sctBadText", "Vuna/Compiler/Elab/Termination/Scc.vuna:755"));
  ("Elab_dTermination_dScc.v_sctBlindNote", ("Vuna.Compiler.Elab.Termination.Scc.sctBlindNote", "Vuna/Compiler/Elab/Termination/Scc.vuna:771"));
  ("Elab_dTermination_dScc.v_sctCheck", ("Vuna.Compiler.Elab.Termination.Scc.sctCheck", "Vuna/Compiler/Elab/Termination/Scc.vuna:778"));
  ("Elab_dTermination_dScc.v_sctCheckGo", ("Vuna.Compiler.Elab.Termination.Scc.sctCheckGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:787"));
  ("Elab_dTermination_dScc.v_sctCheckTable", ("Vuna.Compiler.Elab.Termination.Scc.sctCheckTable", "Vuna/Compiler/Elab/Termination/Scc.vuna:722"));
  ("Elab_dTermination_dScc.v_sctClosureFuel", ("Vuna.Compiler.Elab.Termination.Scc.sctClosureFuel", "Vuna/Compiler/Elab/Termination/Scc.vuna:718"));
  ("Elab_dTermination_dScc.v_sctDiag", ("Vuna.Compiler.Elab.Termination.Scc.sctDiag", "Vuna/Compiler/Elab/Termination/Scc.vuna:760"));
  ("Elab_dTermination_dScc.v_siteCollect", ("Vuna.Compiler.Elab.Termination.Scc.siteCollect", "Vuna/Compiler/Elab/Termination/Scc.vuna:316"));
  ("Elab_dTermination_dScc.v_siteCollectAlts", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectAlts", "Vuna/Compiler/Elab/Termination/Scc.vuna:71"));
  ("Elab_dTermination_dScc.v_siteCollectBinds", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectBinds", "Vuna/Compiler/Elab/Termination/Scc.vuna:91"));
  ("Elab_dTermination_dScc.v_siteCollectClauses", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectClauses", "Vuna/Compiler/Elab/Termination/Scc.vuna:302"));
  ("Elab_dTermination_dScc.v_siteCollectFields", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectFields", "Vuna/Compiler/Elab/Termination/Scc.vuna:52"));
  ("Elab_dTermination_dScc.v_siteCollectGo", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:319"));
  ("Elab_dTermination_dScc.v_siteCollectList", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectList", "Vuna/Compiler/Elab/Termination/Scc.vuna:33"));
  ("Elab_dTermination_dScc.v_siteCollectStmts", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectStmts", "Vuna/Compiler/Elab/Termination/Scc.vuna:110"));
  ("Elab_dTermination_dScc.v_siteEdgeAt", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgeAt", "Vuna/Compiler/Elab/Termination/Scc.vuna:663"));
  ("Elab_dTermination_dScc.v_siteEdgesI", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgesI", "Vuna/Compiler/Elab/Termination/Scc.vuna:686"));
  ("Elab_dTermination_dScc.v_siteEdgesJ", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgesJ", "Vuna/Compiler/Elab/Termination/Scc.vuna:677"));
  ("Elab_dTermination_dScc.v_siteEdgesOf", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:695"));
  ("Elab_dTermination_dScc.v_siteFuelStrict", ("Vuna.Compiler.Elab.Termination.Scc.siteFuelStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:884"));
  ("Elab_dTermination_dScc.v_siteWalkC", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkC", "Vuna/Compiler/Elab/Termination/Scc.vuna:121"));
  ("Elab_dTermination_dScc.v_siteWalkEApp", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkEApp", "Vuna/Compiler/Elab/Termination/Scc.vuna:148"));
  ("Elab_dTermination_dScc.v_siteWalkEAppMap", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkEAppMap", "Vuna/Compiler/Elab/Termination/Scc.vuna:170"));
  ("Elab_dTermination_dScc.v_siteWalkMapPartialInline", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkMapPartialInline", "Vuna/Compiler/Elab/Termination/Scc.vuna:183"));
  ("Elab_dTermination_dScc.v_sortEdges", ("Vuna.Compiler.Elab.Termination.Scc.sortEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:348"));
  ("Elab_dTermination_dScc.v_strictEdgeText", ("Vuna.Compiler.Elab.Termination.Scc.strictEdgeText", "Vuna/Compiler/Elab/Termination/Scc.vuna:739"));
  ("Elab_dTermination_dScc.v_tableAdd", ("Vuna.Compiler.Elab.Termination.Scc.tableAdd", "Vuna/Compiler/Elab/Termination/Scc.vuna:450"));
  ("Elab_dTermination_dScc.v_tableAddPair", ("Vuna.Compiler.Elab.Termination.Scc.tableAddPair", "Vuna/Compiler/Elab/Termination/Scc.vuna:439"));
  ("Elab_dTermination_dScc.v_tableGraphCap", ("Vuna.Compiler.Elab.Termination.Scc.tableGraphCap", "Vuna/Compiler/Elab/Termination/Scc.vuna:420"));
  ("Elab_dTermination_dScc.v_tableLookup", ("Vuna.Compiler.Elab.Termination.Scc.tableLookup", "Vuna/Compiler/Elab/Termination/Scc.vuna:423"));
  ("Elab_dTermination_dScc.v_tableSame", ("Vuna.Compiler.Elab.Termination.Scc.tableSame", "Vuna/Compiler/Elab/Termination/Scc.vuna:502"));
  ("Elab_dTermination_dScc.v_tableSubset", ("Vuna.Compiler.Elab.Termination.Scc.tableSubset", "Vuna/Compiler/Elab/Termination/Scc.vuna:505"));
  ("Elab_dTermination_dScc.v_tryFuelThread", ("Vuna.Compiler.Elab.Termination.Scc.tryFuelThread", "Vuna/Compiler/Elab/Termination/Scc.vuna:980"));
  ("Elab_dTermination_dScc.v_unguardedCycle", ("Vuna.Compiler.Elab.Termination.Scc.unguardedCycle", "Vuna/Compiler/Elab/Termination/Scc.vuna:967"));
  ("Elab_dTermination_dScc.v_unguardedOf", ("Vuna.Compiler.Elab.Termination.Scc.unguardedOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:944"));
  ("Elab_dTermination_dScc.v_weakEdgeText", ("Vuna.Compiler.Elab.Termination.Scc.weakEdgeText", "Vuna/Compiler/Elab/Termination/Scc.vuna:742"));
  ("Elab_dTrait.v_addDictGoalGroup", ("Vuna.Compiler.Elab.Trait.addDictGoalGroup", "Vuna/Compiler/Elab/Trait.vuna:1132"));
  ("Elab_dTrait.v_anyDeclInFile", ("Vuna.Compiler.Elab.Trait.anyDeclInFile", "Vuna/Compiler/Elab/Trait.vuna:320"));
  ("Elab_dTrait.v_anyGlobalHead", ("Vuna.Compiler.Elab.Trait.anyGlobalHead", "Vuna/Compiler/Elab/Trait.vuna:325"));
  ("Elab_dTrait.v_anySameMethod", ("Vuna.Compiler.Elab.Trait.anySameMethod", "Vuna/Compiler/Elab/Trait.vuna:793"));
  ("Elab_dTrait.v_applyCtxSubstsTo", ("Vuna.Compiler.Elab.Trait.applyCtxSubstsTo", "Vuna/Compiler/Elab/Trait.vuna:1019"));
  ("Elab_dTrait.v_applyTermSubstsTo", ("Vuna.Compiler.Elab.Trait.applyTermSubstsTo", "Vuna/Compiler/Elab/Trait.vuna:1047"));
  ("Elab_dTrait.v_bareTeleSeeds", ("Vuna.Compiler.Elab.Trait.bareTeleSeeds", "Vuna/Compiler/Elab/Trait.vuna:624"));
  ("Elab_dTrait.v_bindClassParams", ("Vuna.Compiler.Elab.Trait.bindClassParams", "Vuna/Compiler/Elab/Trait.vuna:30"));
  ("Elab_dTrait.v_bindDictBinderFuel", ("Vuna.Compiler.Elab.Trait.bindDictBinderFuel", "Vuna/Compiler/Elab/Trait.vuna:1455"));
  ("Elab_dTrait.v_bindIndexBinder", ("Vuna.Compiler.Elab.Trait.bindIndexBinder", "Vuna/Compiler/Elab/Trait.vuna:1608"));
  ("Elab_dTrait.v_bindIndexBinderFuel", ("Vuna.Compiler.Elab.Trait.bindIndexBinderFuel", "Vuna/Compiler/Elab/Trait.vuna:1472"));
  ("Elab_dTrait.v_bindOnePattern", ("Vuna.Compiler.Elab.Trait.bindOnePattern", "Vuna/Compiler/Elab/Trait.vuna:1612"));
  ("Elab_dTrait.v_bindOnePatternFuel", ("Vuna.Compiler.Elab.Trait.bindOnePatternFuel", "Vuna/Compiler/Elab/Trait.vuna:1542"));
  ("Elab_dTrait.v_canonicalMethodShort", ("Vuna.Compiler.Elab.Trait.canonicalMethodShort", "Vuna/Compiler/Elab/Trait.vuna:774"));
  ("Elab_dTrait.v_checkArgsAtKinds", ("Vuna.Compiler.Elab.Trait.checkArgsAtKinds", "Vuna/Compiler/Elab/Trait.vuna:532"));
  ("Elab_dTrait.v_checkBinders", ("Vuna.Compiler.Elab.Trait.checkBinders", "Vuna/Compiler/Elab/Trait.vuna:1605"));
  ("Elab_dTrait.v_checkBindersFuel", ("Vuna.Compiler.Elab.Trait.checkBindersFuel", "Vuna/Compiler/Elab/Trait.vuna:1443"));
  ("Elab_dTrait.v_checkBodyAtEndFuel", ("Vuna.Compiler.Elab.Trait.checkBodyAtEndFuel", "Vuna/Compiler/Elab/Trait.vuna:1493"));
  ("Elab_dTrait.v_checkDef", ("Vuna.Compiler.Elab.Trait.checkDef", "Vuna/Compiler/Elab/Trait.vuna:1440"));
  ("Elab_dTrait.v_checkDefIn", ("Vuna.Compiler.Elab.Trait.checkDefIn", "Vuna/Compiler/Elab/Trait.vuna:1436"));
  ("Elab_dTrait.v_checkInstanceHeads", ("Vuna.Compiler.Elab.Trait.checkInstanceHeads", "Vuna/Compiler/Elab/Trait.vuna:1292"));
  ("Elab_dTrait.v_checkInstanceHeadsGo", ("Vuna.Compiler.Elab.Trait.checkInstanceHeadsGo", "Vuna/Compiler/Elab/Trait.vuna:1295"));
  ("Elab_dTrait.v_checkSuperClasses", ("Vuna.Compiler.Elab.Trait.checkSuperClasses", "Vuna/Compiler/Elab/Trait.vuna:339"));
  ("Elab_dTrait.v_classFieldTys", ("Vuna.Compiler.Elab.Trait.classFieldTys", "Vuna/Compiler/Elab/Trait.vuna:35"));
  ("Elab_dTrait.v_classFieldTysGo", ("Vuna.Compiler.Elab.Trait.classFieldTysGo", "Vuna/Compiler/Elab/Trait.vuna:39"));
  ("Elab_dTrait.v_classParamKinds", ("Vuna.Compiler.Elab.Trait.classParamKinds", "Vuna/Compiler/Elab/Trait.vuna:128"));
  ("Elab_dTrait.v_clauseSpanOf", ("Vuna.Compiler.Elab.Trait.clauseSpanOf", "Vuna/Compiler/Elab/Trait.vuna:1096"));
  ("Elab_dTrait.v_closedTypeArgs", ("Vuna.Compiler.Elab.Trait.closedTypeArgs", "Vuna/Compiler/Elab/Trait.vuna:571"));
  ("Elab_dTrait.v_closedTypeTerm", ("Vuna.Compiler.Elab.Trait.closedTypeTerm", "Vuna/Compiler/Elab/Trait.vuna:560"));
  ("Elab_dTrait.v_closedTypeTerms", ("Vuna.Compiler.Elab.Trait.closedTypeTerms", "Vuna/Compiler/Elab/Trait.vuna:550"));
  ("Elab_dTrait.v_constraintPartsOf", ("Vuna.Compiler.Elab.Trait.constraintPartsOf", "Vuna/Compiler/Elab/Trait.vuna:423"));
  ("Elab_dTrait.v_ctorResultType", ("Vuna.Compiler.Elab.Trait.ctorResultType", "Vuna/Compiler/Elab/Trait.vuna:853"));
  ("Elab_dTrait.v_ctxBareTeleSeeds", ("Vuna.Compiler.Elab.Trait.ctxBareTeleSeeds", "Vuna/Compiler/Elab/Trait.vuna:636"));
  ("Elab_dTrait.v_ctxDictDomEqual", ("Vuna.Compiler.Elab.Trait.ctxDictDomEqual", "Vuna/Compiler/Elab/Trait.vuna:1010"));
  ("Elab_dTrait.v_ctxDictName", ("Vuna.Compiler.Elab.Trait.ctxDictName", "Vuna/Compiler/Elab/Trait.vuna:722"));
  ("Elab_dTrait.v_declNamedInFile", ("Vuna.Compiler.Elab.Trait.declNamedInFile", "Vuna/Compiler/Elab/Trait.vuna:289"));
  ("Elab_dTrait.v_declTopName", ("Vuna.Compiler.Elab.Trait.declTopName", "Vuna/Compiler/Elab/Trait.vuna:283"));
  ("Elab_dTrait.v_defBodyOf", ("Vuna.Compiler.Elab.Trait.defBodyOf", "Vuna/Compiler/Elab/Trait.vuna:1368"));
  ("Elab_dTrait.v_defTypeOrDefaultTbl", ("Vuna.Compiler.Elab.Trait.defTypeOrDefaultTbl", "Vuna/Compiler/Elab/Trait.vuna:1427"));
  ("Elab_dTrait.v_dictAppTermOf", ("Vuna.Compiler.Elab.Trait.dictAppTermOf", "Vuna/Compiler/Elab/Trait.vuna:171"));
  ("Elab_dTrait.v_dictParamArgs", ("Vuna.Compiler.Elab.Trait.dictParamArgs", "Vuna/Compiler/Elab/Trait.vuna:174"));
  ("Elab_dTrait.v_domainsEqual", ("Vuna.Compiler.Elab.Trait.domainsEqual", "Vuna/Compiler/Elab/Trait.vuna:1140"));
  ("Elab_dTrait.v_elabConstraintDomains", ("Vuna.Compiler.Elab.Trait.elabConstraintDomains", "Vuna/Compiler/Elab/Trait.vuna:688"));
  ("Elab_dTrait.v_elabFunDef", ("Vuna.Compiler.Elab.Trait.elabFunDef", "Vuna/Compiler/Elab/Trait.vuna:1602"));
  ("Elab_dTrait.v_elabFunDefIn", ("Vuna.Compiler.Elab.Trait.elabFunDefIn", "Vuna/Compiler/Elab/Trait.vuna:1570"));
  ("Elab_dTrait.v_elabFunDefMulti", ("Vuna.Compiler.Elab.Trait.elabFunDefMulti", "Vuna/Compiler/Elab/Trait.vuna:1581"));
  ("Elab_dTrait.v_elabInstance", ("Vuna.Compiler.Elab.Trait.elabInstance", "Vuna/Compiler/Elab/Trait.vuna:399"));
  ("Elab_dTrait.v_elabInstanceBodies", ("Vuna.Compiler.Elab.Trait.elabInstanceBodies", "Vuna/Compiler/Elab/Trait.vuna:1321"));
  ("Elab_dTrait.v_elabInstanceBodiesGo", ("Vuna.Compiler.Elab.Trait.elabInstanceBodiesGo", "Vuna/Compiler/Elab/Trait.vuna:1333"));
  ("Elab_dTrait.v_elabInstanceConstrained", ("Vuna.Compiler.Elab.Trait.elabInstanceConstrained", "Vuna/Compiler/Elab/Trait.vuna:498"));
  ("Elab_dTrait.v_elabInstanceMethod", ("Vuna.Compiler.Elab.Trait.elabInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:970"));
  ("Elab_dTrait.v_elabInstanceMethodIn", ("Vuna.Compiler.Elab.Trait.elabInstanceMethodIn", "Vuna/Compiler/Elab/Trait.vuna:966"));
  ("Elab_dTrait.v_elabInstanceMethodsCtx", ("Vuna.Compiler.Elab.Trait.elabInstanceMethodsCtx", "Vuna/Compiler/Elab/Trait.vuna:861"));
  ("Elab_dTrait.v_elabInstanceMethodsGo", ("Vuna.Compiler.Elab.Trait.elabInstanceMethodsGo", "Vuna/Compiler/Elab/Trait.vuna:930"));
  ("Elab_dTrait.v_elabInstanceSig", ("Vuna.Compiler.Elab.Trait.elabInstanceSig", "Vuna/Compiler/Elab/Trait.vuna:467"));
  ("Elab_dTrait.v_elabInstanceWithClass", ("Vuna.Compiler.Elab.Trait.elabInstanceWithClass", "Vuna/Compiler/Elab/Trait.vuna:349"));
  ("Elab_dTrait.v_elabInstances", ("Vuna.Compiler.Elab.Trait.elabInstances", "Vuna/Compiler/Elab/Trait.vuna:1389"));
  ("Elab_dTrait.v_elabInstancesGo", ("Vuna.Compiler.Elab.Trait.elabInstancesGo", "Vuna/Compiler/Elab/Trait.vuna:1392"));
  ("Elab_dTrait.v_elabTrait", ("Vuna.Compiler.Elab.Trait.elabTrait", "Vuna/Compiler/Elab/Trait.vuna:73"));
  ("Elab_dTrait.v_elabTraitFinal", ("Vuna.Compiler.Elab.Trait.elabTraitFinal", "Vuna/Compiler/Elab/Trait.vuna:96"));
  ("Elab_dTrait.v_elabTraitKinds", ("Vuna.Compiler.Elab.Trait.elabTraitKinds", "Vuna/Compiler/Elab/Trait.vuna:87"));
  ("Elab_dTrait.v_elabTraits", ("Vuna.Compiler.Elab.Trait.elabTraits", "Vuna/Compiler/Elab/Trait.vuna:1375"));
  ("Elab_dTrait.v_elabTraitsGo", ("Vuna.Compiler.Elab.Trait.elabTraitsGo", "Vuna/Compiler/Elab/Trait.vuna:1378"));
  ("Elab_dTrait.v_exprFreeLower", ("Vuna.Compiler.Elab.Trait.exprFreeLower", "Vuna/Compiler/Elab/Trait.vuna:666"));
  ("Elab_dTrait.v_extraDefsGo", ("Vuna.Compiler.Elab.Trait.extraDefsGo", "Vuna/Compiler/Elab/Trait.vuna:1410"));
  ("Elab_dTrait.v_extraDefsOf", ("Vuna.Compiler.Elab.Trait.extraDefsOf", "Vuna/Compiler/Elab/Trait.vuna:1406"));
  ("Elab_dTrait.v_fallbackTeleKind", ("Vuna.Compiler.Elab.Trait.fallbackTeleKind", "Vuna/Compiler/Elab/Trait.vuna:663"));
  ("Elab_dTrait.v_findTraitDecl", ("Vuna.Compiler.Elab.Trait.findTraitDecl", "Vuna/Compiler/Elab/Trait.vuna:833"));
  ("Elab_dTrait.v_findTraitMethodSpan", ("Vuna.Compiler.Elab.Trait.findTraitMethodSpan", "Vuna/Compiler/Elab/Trait.vuna:841"));
  ("Elab_dTrait.v_firstMissingInstanceMethod", ("Vuna.Compiler.Elab.Trait.firstMissingInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:811"));
  ("Elab_dTrait.v_firstMissingInstanceMethodGo", ("Vuna.Compiler.Elab.Trait.firstMissingInstanceMethodGo", "Vuna/Compiler/Elab/Trait.vuna:814"));
  ("Elab_dTrait.v_firstUnknownInstanceMethod", ("Vuna.Compiler.Elab.Trait.firstUnknownInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:797"));
  ("Elab_dTrait.v_firstUnknownInstanceMethodGo", ("Vuna.Compiler.Elab.Trait.firstUnknownInstanceMethodGo", "Vuna/Compiler/Elab/Trait.vuna:801"));
  ("Elab_dTrait.v_flagAt", ("Vuna.Compiler.Elab.Trait.flagAt", "Vuna/Compiler/Elab/Trait.vuna:269"));
  ("Elab_dTrait.v_foldParamPis", ("Vuna.Compiler.Elab.Trait.foldParamPis", "Vuna/Compiler/Elab/Trait.vuna:166"));
  ("Elab_dTrait.v_foldPiFieldTys", ("Vuna.Compiler.Elab.Trait.foldPiFieldTys", "Vuna/Compiler/Elab/Trait.vuna:62"));
  ("Elab_dTrait.v_foldPiFieldTysGo", ("Vuna.Compiler.Elab.Trait.foldPiFieldTysGo", "Vuna/Compiler/Elab/Trait.vuna:65"));
  ("Elab_dTrait.v_foldlAddDef", ("Vuna.Compiler.Elab.Trait.foldlAddDef", "Vuna/Compiler/Elab/Trait.vuna:54"));
  ("Elab_dTrait.v_foldlAddInst", ("Vuna.Compiler.Elab.Trait.foldlAddInst", "Vuna/Compiler/Elab/Trait.vuna:1284"));
  ("Elab_dTrait.v_freeDictGoals", ("Vuna.Compiler.Elab.Trait.freeDictGoals", "Vuna/Compiler/Elab/Trait.vuna:1114"));
  ("Elab_dTrait.v_freeDictGoalsGo", ("Vuna.Compiler.Elab.Trait.freeDictGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:1117"));
  ("Elab_dTrait.v_hasMethodClauses", ("Vuna.Compiler.Elab.Trait.hasMethodClauses", "Vuna/Compiler/Elab/Trait.vuna:822"));
  ("Elab_dTrait.v_headTypeNameOf", ("Vuna.Compiler.Elab.Trait.headTypeNameOf", "Vuna/Compiler/Elab/Trait.vuna:296"));
  ("Elab_dTrait.v_headTypeNamesOf", ("Vuna.Compiler.Elab.Trait.headTypeNamesOf", "Vuna/Compiler/Elab/Trait.vuna:301"));
  ("Elab_dTrait.v_injectAltGo", ("Vuna.Compiler.Elab.Trait.injectAltGo", "Vuna/Compiler/Elab/Trait.vuna:1250"));
  ("Elab_dTrait.v_injectAltGoFuel", ("Vuna.Compiler.Elab.Trait.injectAltGoFuel", "Vuna/Compiler/Elab/Trait.vuna:1253"));
  ("Elab_dTrait.v_injectDictGo", ("Vuna.Compiler.Elab.Trait.injectDictGo", "Vuna/Compiler/Elab/Trait.vuna:1222"));
  ("Elab_dTrait.v_injectDictGoFuel", ("Vuna.Compiler.Elab.Trait.injectDictGoFuel", "Vuna/Compiler/Elab/Trait.vuna:1225"));
  ("Elab_dTrait.v_insertArgAt", ("Vuna.Compiler.Elab.Trait.insertArgAt", "Vuna/Compiler/Elab/Trait.vuna:1274"));
  ("Elab_dTrait.v_insertDictCalls", ("Vuna.Compiler.Elab.Trait.insertDictCalls", "Vuna/Compiler/Elab/Trait.vuna:1219"));
  ("Elab_dTrait.v_instArgAt", ("Vuna.Compiler.Elab.Trait.instArgAt", "Vuna/Compiler/Elab/Trait.vuna:926"));
  ("Elab_dTrait.v_instBodyCtx", ("Vuna.Compiler.Elab.Trait.instBodyCtx", "Vuna/Compiler/Elab/Trait.vuna:714"));
  ("Elab_dTrait.v_instBodyCtxGo", ("Vuna.Compiler.Elab.Trait.instBodyCtxGo", "Vuna/Compiler/Elab/Trait.vuna:717"));
  ("Elab_dTrait.v_instCtxLam", ("Vuna.Compiler.Elab.Trait.instCtxLam", "Vuna/Compiler/Elab/Trait.vuna:736"));
  ("Elab_dTrait.v_instCtxLamGo", ("Vuna.Compiler.Elab.Trait.instCtxLamGo", "Vuna/Compiler/Elab/Trait.vuna:739"));
  ("Elab_dTrait.v_instSigArgs", ("Vuna.Compiler.Elab.Trait.instSigArgs", "Vuna/Compiler/Elab/Trait.vuna:456"));
  ("Elab_dTrait.v_instSigClass", ("Vuna.Compiler.Elab.Trait.instSigClass", "Vuna/Compiler/Elab/Trait.vuna:447"));
  ("Elab_dTrait.v_instSigCtx", ("Vuna.Compiler.Elab.Trait.instSigCtx", "Vuna/Compiler/Elab/Trait.vuna:453"));
  ("Elab_dTrait.v_instSigHead", ("Vuna.Compiler.Elab.Trait.instSigHead", "Vuna/Compiler/Elab/Trait.vuna:459"));
  ("Elab_dTrait.v_instSigTele", ("Vuna.Compiler.Elab.Trait.instSigTele", "Vuna/Compiler/Elab/Trait.vuna:450"));
  ("Elab_dTrait.v_instTeleLam", ("Vuna.Compiler.Elab.Trait.instTeleLam", "Vuna/Compiler/Elab/Trait.vuna:732"));
  ("Elab_dTrait.v_instTypeCtx", ("Vuna.Compiler.Elab.Trait.instTypeCtx", "Vuna/Compiler/Elab/Trait.vuna:755"));
  ("Elab_dTrait.v_instTypeOf", ("Vuna.Compiler.Elab.Trait.instTypeOf", "Vuna/Compiler/Elab/Trait.vuna:747"));
  ("Elab_dTrait.v_instTypeTele", ("Vuna.Compiler.Elab.Trait.instTypeTele", "Vuna/Compiler/Elab/Trait.vuna:760"));
  ("Elab_dTrait.v_instValueOf", ("Vuna.Compiler.Elab.Trait.instValueOf", "Vuna/Compiler/Elab/Trait.vuna:726"));
  ("Elab_dTrait.v_instanceConstraintParts", ("Vuna.Compiler.Elab.Trait.instanceConstraintParts", "Vuna/Compiler/Elab/Trait.vuna:431"));
  ("Elab_dTrait.v_instanceDefsOf", ("Vuna.Compiler.Elab.Trait.instanceDefsOf", "Vuna/Compiler/Elab/Trait.vuna:1362"));
  ("Elab_dTrait.v_instanceHeadParts", ("Vuna.Compiler.Elab.Trait.instanceHeadParts", "Vuna/Compiler/Elab/Trait.vuna:415"));
  ("Elab_dTrait.v_instanceHeadTerm", ("Vuna.Compiler.Elab.Trait.instanceHeadTerm", "Vuna/Compiler/Elab/Trait.vuna:766"));
  ("Elab_dTrait.v_instanceHeadTypeNames", ("Vuna.Compiler.Elab.Trait.instanceHeadTypeNames", "Vuna/Compiler/Elab/Trait.vuna:314"));
  ("Elab_dTrait.v_instanceLandingOk", ("Vuna.Compiler.Elab.Trait.instanceLandingOk", "Vuna/Compiler/Elab/Trait.vuna:329"));
  ("Elab_dTrait.v_instanceMono", ("Vuna.Compiler.Elab.Trait.instanceMono", "Vuna/Compiler/Elab/Trait.vuna:582"));
  ("Elab_dTrait.v_instanceTeleCtx", ("Vuna.Compiler.Elab.Trait.instanceTeleCtx", "Vuna/Compiler/Elab/Trait.vuna:679"));
  ("Elab_dTrait.v_instanceTeleCtxGo", ("Vuna.Compiler.Elab.Trait.instanceTeleCtxGo", "Vuna/Compiler/Elab/Trait.vuna:682"));
  ("Elab_dTrait.v_instanceTeleMetas", ("Vuna.Compiler.Elab.Trait.instanceTeleMetas", "Vuna/Compiler/Elab/Trait.vuna:596"));
  ("Elab_dTrait.v_isGlobalHeadType", ("Vuna.Compiler.Elab.Trait.isGlobalHeadType", "Vuna/Compiler/Elab/Trait.vuna:311"));
  ("Elab_dTrait.v_isLowerStart", ("Vuna.Compiler.Elab.Trait.isLowerStart", "Vuna/Compiler/Elab/Trait.vuna:588"));
  ("Elab_dTrait.v_keepOutBanned", ("Vuna.Compiler.Elab.Trait.keepOutBanned", "Vuna/Compiler/Elab/Trait.vuna:673"));
  ("Elab_dTrait.v_leadingImplicitCount", ("Vuna.Compiler.Elab.Trait.leadingImplicitCount", "Vuna/Compiler/Elab/Trait.vuna:1147"));
  ("Elab_dTrait.v_liftFreeDictGoals", ("Vuna.Compiler.Elab.Trait.liftFreeDictGoals", "Vuna/Compiler/Elab/Trait.vuna:1161"));
  ("Elab_dTrait.v_liftFreeDictGoalsGo", ("Vuna.Compiler.Elab.Trait.liftFreeDictGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:1177"));
  ("Elab_dTrait.v_matchCtxDictIdx", ("Vuna.Compiler.Elab.Trait.matchCtxDictIdx", "Vuna/Compiler/Elab/Trait.vuna:998"));
  ("Elab_dTrait.v_matchCtxDictIdxGo", ("Vuna.Compiler.Elab.Trait.matchCtxDictIdxGo", "Vuna/Compiler/Elab/Trait.vuna:1001"));
  ("Elab_dTrait.v_methodClausesGo", ("Vuna.Compiler.Elab.Trait.methodClausesGo", "Vuna/Compiler/Elab/Trait.vuna:951"));
  ("Elab_dTrait.v_methodClausesNamed", ("Vuna.Compiler.Elab.Trait.methodClausesNamed", "Vuna/Compiler/Elab/Trait.vuna:948"));
  ("Elab_dTrait.v_methodProjType", ("Vuna.Compiler.Elab.Trait.methodProjType", "Vuna/Compiler/Elab/Trait.vuna:202"));
  ("Elab_dTrait.v_methodProjZip", ("Vuna.Compiler.Elab.Trait.methodProjZip", "Vuna/Compiler/Elab/Trait.vuna:194"));
  ("Elab_dTrait.v_methodProjections", ("Vuna.Compiler.Elab.Trait.methodProjections", "Vuna/Compiler/Elab/Trait.vuna:190"));
  ("Elab_dTrait.v_projectionBody", ("Vuna.Compiler.Elab.Trait.projectionBody", "Vuna/Compiler/Elab/Trait.vuna:215"));
  ("Elab_dTrait.v_projectionBodyOpaque", ("Vuna.Compiler.Elab.Trait.projectionBodyOpaque", "Vuna/Compiler/Elab/Trait.vuna:223"));
  ("Elab_dTrait.v_projectionDefs", ("Vuna.Compiler.Elab.Trait.projectionDefs", "Vuna/Compiler/Elab/Trait.vuna:251"));
  ("Elab_dTrait.v_projectionDefsGo", ("Vuna.Compiler.Elab.Trait.projectionDefsGo", "Vuna/Compiler/Elab/Trait.vuna:273"));
  ("Elab_dTrait.v_projectionDefsOpaque", ("Vuna.Compiler.Elab.Trait.projectionDefsOpaque", "Vuna/Compiler/Elab/Trait.vuna:256"));
  ("Elab_dTrait.v_projectionDefsOpaqueGo", ("Vuna.Compiler.Elab.Trait.projectionDefsOpaqueGo", "Vuna/Compiler/Elab/Trait.vuna:260"));
  ("Elab_dTrait.v_projectionParamLams", ("Vuna.Compiler.Elab.Trait.projectionParamLams", "Vuna/Compiler/Elab/Trait.vuna:242"));
  ("Elab_dTrait.v_projectionParamNames", ("Vuna.Compiler.Elab.Trait.projectionParamNames", "Vuna/Compiler/Elab/Trait.vuna:247"));
  ("Elab_dTrait.v_replaceGlobalType", ("Vuna.Compiler.Elab.Trait.replaceGlobalType", "Vuna/Compiler/Elab/Trait.vuna:1278"));
  ("Elab_dTrait.v_resolveRigidGoals", ("Vuna.Compiler.Elab.Trait.resolveRigidGoals", "Vuna/Compiler/Elab/Trait.vuna:1026"));
  ("Elab_dTrait.v_resolveRigidGoalsGo", ("Vuna.Compiler.Elab.Trait.resolveRigidGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:1029"));
  ("Elab_dTrait.v_resolveTeleKind", ("Vuna.Compiler.Elab.Trait.resolveTeleKind", "Vuna/Compiler/Elab/Trait.vuna:652"));
  ("Elab_dTrait.v_resolveTeleKinds", ("Vuna.Compiler.Elab.Trait.resolveTeleKinds", "Vuna/Compiler/Elab/Trait.vuna:647"));
  ("Elab_dTrait.v_rewriteTaggedSpine", ("Vuna.Compiler.Elab.Trait.rewriteTaggedSpine", "Vuna/Compiler/Elab/Trait.vuna:1261"));
  ("Elab_dTrait.v_rewriteTaggedSpineFuel", ("Vuna.Compiler.Elab.Trait.rewriteTaggedSpineFuel", "Vuna/Compiler/Elab/Trait.vuna:1265"));
  ("Elab_dTrait.v_sameMethodShort", ("Vuna.Compiler.Elab.Trait.sameMethodShort", "Vuna/Compiler/Elab/Trait.vuna:790"));
  ("Elab_dTrait.v_seedKindOf", ("Vuna.Compiler.Elab.Trait.seedKindOf", "Vuna/Compiler/Elab/Trait.vuna:618"));
  ("Elab_dTrait.v_solveCtxGoals", ("Vuna.Compiler.Elab.Trait.solveCtxGoals", "Vuna/Compiler/Elab/Trait.vuna:979"));
  ("Elab_dTrait.v_solveCtxGoalsGo", ("Vuna.Compiler.Elab.Trait.solveCtxGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:982"));
  ("Elab_dTrait.v_solveLiftedMeta", ("Vuna.Compiler.Elab.Trait.solveLiftedMeta", "Vuna/Compiler/Elab/Trait.vuna:1154"));
  ("Elab_dTrait.v_solveLiftedMetas", ("Vuna.Compiler.Elab.Trait.solveLiftedMetas", "Vuna/Compiler/Elab/Trait.vuna:1211"));
  ("Elab_dTrait.v_spanOfName", ("Vuna.Compiler.Elab.Trait.spanOfName", "Vuna/Compiler/Elab/Trait.vuna:1423"));
  ("Elab_dTrait.v_substExtraDictMetas", ("Vuna.Compiler.Elab.Trait.substExtraDictMetas", "Vuna/Compiler/Elab/Trait.vuna:1206"));
  ("Elab_dTrait.v_substInstParams", ("Vuna.Compiler.Elab.Trait.substInstParams", "Vuna/Compiler/Elab/Trait.vuna:878"));
  ("Elab_dTrait.v_substInstParamsAlt", ("Vuna.Compiler.Elab.Trait.substInstParamsAlt", "Vuna/Compiler/Elab/Trait.vuna:922"));
  ("Elab_dTrait.v_substInstParamsGo", ("Vuna.Compiler.Elab.Trait.substInstParamsGo", "Vuna/Compiler/Elab/Trait.vuna:881"));
  ("Elab_dTrait.v_substMetaTerm", ("Vuna.Compiler.Elab.Trait.substMetaTerm", "Vuna/Compiler/Elab/Trait.vuna:1052"));
  ("Elab_dTrait.v_substMetaTermAlt", ("Vuna.Compiler.Elab.Trait.substMetaTermAlt", "Vuna/Compiler/Elab/Trait.vuna:1092"));
  ("Elab_dTrait.v_substMetaTermGo", ("Vuna.Compiler.Elab.Trait.substMetaTermGo", "Vuna/Compiler/Elab/Trait.vuna:1055"));
  ("Elab_dTrait.v_teleMetasInit", ("Vuna.Compiler.Elab.Trait.teleMetasInit", "Vuna/Compiler/Elab/Trait.vuna:600"));
  ("Elab_dTrait.v_traitKindExplicit", ("Vuna.Compiler.Elab.Trait.traitKindExplicit", "Vuna/Compiler/Elab/Trait.vuna:144"));
  ("Elab_dTrait.v_traitKindInfer", ("Vuna.Compiler.Elab.Trait.traitKindInfer", "Vuna/Compiler/Elab/Trait.vuna:157"));
  ("Elab_dTrait.v_traitMethodPairs", ("Vuna.Compiler.Elab.Trait.traitMethodPairs", "Vuna/Compiler/Elab/Trait.vuna:179"));
  ("Elab_dTrait.v_traitMethodSpanOf", ("Vuna.Compiler.Elab.Trait.traitMethodSpanOf", "Vuna/Compiler/Elab/Trait.vuna:846"));
  ("Elab_dTrait.v_traitParamKinds", ("Vuna.Compiler.Elab.Trait.traitParamKinds", "Vuna/Compiler/Elab/Trait.vuna:137"));
  ("Elab_dTrait.v_traitParamNames", ("Vuna.Compiler.Elab.Trait.traitParamNames", "Vuna/Compiler/Elab/Trait.vuna:133"));
  ("Elab_dTrait.v_zipClassFields", ("Vuna.Compiler.Elab.Trait.zipClassFields", "Vuna/Compiler/Elab/Trait.vuna:866"));
  ("Elab_dTrait.v_zipMethodFields", ("Vuna.Compiler.Elab.Trait.zipMethodFields", "Vuna/Compiler/Elab/Trait.vuna:869"));
  ("Elab_dTypes.v_allBucketsMatch", ("Vuna.Compiler.Elab.Types.allBucketsMatch", "Vuna/Compiler/Elab/Types.vuna:487"));
  ("Elab_dTypes.v_bucketCount", ("Vuna.Compiler.Elab.Types.bucketCount", "Vuna/Compiler/Elab/Types.vuna:482"));
  ("Elab_dTypes.v_csEmpty", ("Vuna.Compiler.Elab.Types.csEmpty", "Vuna/Compiler/Elab/Types.vuna:275"));
  ("Elab_dTypes.v_ctorTblOfDatas", ("Vuna.Compiler.Elab.Types.ctorTblOfDatas", "Vuna/Compiler/Elab/Types.vuna:873"));
  ("Elab_dTypes.v_ctxBind", ("Vuna.Compiler.Elab.Types.ctxBind", "Vuna/Compiler/Elab/Types.vuna:1078"));
  ("Elab_dTypes.v_ctxBindValue", ("Vuna.Compiler.Elab.Types.ctxBindValue", "Vuna/Compiler/Elab/Types.vuna:1083"));
  ("Elab_dTypes.v_ctxDepth", ("Vuna.Compiler.Elab.Types.ctxDepth", "Vuna/Compiler/Elab/Types.vuna:1075"));
  ("Elab_dTypes.v_ctxEnv", ("Vuna.Compiler.Elab.Types.ctxEnv", "Vuna/Compiler/Elab/Types.vuna:1112"));
  ("Elab_dTypes.v_ctxEnvAt", ("Vuna.Compiler.Elab.Types.ctxEnvAt", "Vuna/Compiler/Elab/Types.vuna:1105"));
  ("Elab_dTypes.v_ctxEnvRefined", ("Vuna.Compiler.Elab.Types.ctxEnvRefined", "Vuna/Compiler/Elab/Types.vuna:1116"));
  ("Elab_dTypes.v_ctxLookup", ("Vuna.Compiler.Elab.Types.ctxLookup", "Vuna/Compiler/Elab/Types.vuna:1096"));
  ("Elab_dTypes.v_ctxLookupAt", ("Vuna.Compiler.Elab.Types.ctxLookupAt", "Vuna/Compiler/Elab/Types.vuna:1091"));
  ("Elab_dTypes.v_ctxRefine", ("Vuna.Compiler.Elab.Types.ctxRefine", "Vuna/Compiler/Elab/Types.vuna:1088"));
  ("Elab_dTypes.v_dataCtorPairs", ("Vuna.Compiler.Elab.Types.dataCtorPairs", "Vuna/Compiler/Elab/Types.vuna:876"));
  ("Elab_dTypes.v_datasHaveLinear", ("Vuna.Compiler.Elab.Types.datasHaveLinear", "Vuna/Compiler/Elab/Types.vuna:1054"));
  ("Elab_dTypes.v_dtClassName", ("Vuna.Compiler.Elab.Types.dtClassName", "Vuna/Compiler/Elab/Types.vuna:159"));
  ("Elab_dTypes.v_dtCtorFamily", ("Vuna.Compiler.Elab.Types.dtCtorFamily", "Vuna/Compiler/Elab/Types.vuna:74"));
  ("Elab_dTypes.v_dtCtorName", ("Vuna.Compiler.Elab.Types.dtCtorName", "Vuna/Compiler/Elab/Types.vuna:71"));
  ("Elab_dTypes.v_dtCtorTelescope", ("Vuna.Compiler.Elab.Types.dtCtorTelescope", "Vuna/Compiler/Elab/Types.vuna:77"));
  ("Elab_dTypes.v_dtCtorType", ("Vuna.Compiler.Elab.Types.dtCtorType", "Vuna/Compiler/Elab/Types.vuna:80"));
  ("Elab_dTypes.v_dtDataCtors", ("Vuna.Compiler.Elab.Types.dtDataCtors", "Vuna/Compiler/Elab/Types.vuna:113"));
  ("Elab_dTypes.v_dtDataFields", ("Vuna.Compiler.Elab.Types.dtDataFields", "Vuna/Compiler/Elab/Types.vuna:130"));
  ("Elab_dTypes.v_dtDataIsRecord", ("Vuna.Compiler.Elab.Types.dtDataIsRecord", "Vuna/Compiler/Elab/Types.vuna:134"));
  ("Elab_dTypes.v_dtDataKind", ("Vuna.Compiler.Elab.Types.dtDataKind", "Vuna/Compiler/Elab/Types.vuna:116"));
  ("Elab_dTypes.v_dtDataLinear", ("Vuna.Compiler.Elab.Types.dtDataLinear", "Vuna/Compiler/Elab/Types.vuna:136"));
  ("Elab_dTypes.v_dtDataName", ("Vuna.Compiler.Elab.Types.dtDataName", "Vuna/Compiler/Elab/Types.vuna:110"));
  ("Elab_dTypes.v_dtDataRepr", ("Vuna.Compiler.Elab.Types.dtDataRepr", "Vuna/Compiler/Elab/Types.vuna:126"));
  ("Elab_dTypes.v_dtDataViaClasses", ("Vuna.Compiler.Elab.Types.dtDataViaClasses", "Vuna/Compiler/Elab/Types.vuna:120"));
  ("Elab_dTypes.v_dtDefBody", ("Vuna.Compiler.Elab.Types.dtDefBody", "Vuna/Compiler/Elab/Types.vuna:40"));
  ("Elab_dTypes.v_dtDefExtern", ("Vuna.Compiler.Elab.Types.dtDefExtern", "Vuna/Compiler/Elab/Types.vuna:52"));
  ("Elab_dTypes.v_dtDefHasBody", ("Vuna.Compiler.Elab.Types.dtDefHasBody", "Vuna/Compiler/Elab/Types.vuna:46"));
  ("Elab_dTypes.v_dtDefName", ("Vuna.Compiler.Elab.Types.dtDefName", "Vuna/Compiler/Elab/Types.vuna:30"));
  ("Elab_dTypes.v_dtDefSpan", ("Vuna.Compiler.Elab.Types.dtDefSpan", "Vuna/Compiler/Elab/Types.vuna:57"));
  ("Elab_dTypes.v_dtDefType", ("Vuna.Compiler.Elab.Types.dtDefType", "Vuna/Compiler/Elab/Types.vuna:35"));
  ("Elab_dTypes.v_dtInstName", ("Vuna.Compiler.Elab.Types.dtInstName", "Vuna/Compiler/Elab/Types.vuna:172"));
  ("Elab_dTypes.v_dtProgClasses", ("Vuna.Compiler.Elab.Types.dtProgClasses", "Vuna/Compiler/Elab/Types.vuna:1210"));
  ("Elab_dTypes.v_dtProgDatas", ("Vuna.Compiler.Elab.Types.dtProgDatas", "Vuna/Compiler/Elab/Types.vuna:1192"));
  ("Elab_dTypes.v_dtProgDefs", ("Vuna.Compiler.Elab.Types.dtProgDefs", "Vuna/Compiler/Elab/Types.vuna:1195"));
  ("Elab_dTypes.v_dtProgGlobals", ("Vuna.Compiler.Elab.Types.dtProgGlobals", "Vuna/Compiler/Elab/Types.vuna:1204"));
  ("Elab_dTypes.v_dtProgGoals", ("Vuna.Compiler.Elab.Types.dtProgGoals", "Vuna/Compiler/Elab/Types.vuna:1198"));
  ("Elab_dTypes.v_dtProgInsts", ("Vuna.Compiler.Elab.Types.dtProgInsts", "Vuna/Compiler/Elab/Types.vuna:1207"));
  ("Elab_dTypes.v_dtProgSols", ("Vuna.Compiler.Elab.Types.dtProgSols", "Vuna/Compiler/Elab/Types.vuna:1201"));
  ("Elab_dTypes.v_dtProgWarnings", ("Vuna.Compiler.Elab.Types.dtProgWarnings", "Vuna/Compiler/Elab/Types.vuna:1214"));
  ("Elab_dTypes.v_ecAddClass", ("Vuna.Compiler.Elab.Types.ecAddClass", "Vuna/Compiler/Elab/Types.vuna:563"));
  ("Elab_dTypes.v_ecAddConstraint", ("Vuna.Compiler.Elab.Types.ecAddConstraint", "Vuna/Compiler/Elab/Types.vuna:636"));
  ("Elab_dTypes.v_ecAddData", ("Vuna.Compiler.Elab.Types.ecAddData", "Vuna/Compiler/Elab/Types.vuna:846"));
  ("Elab_dTypes.v_ecAddDef", ("Vuna.Compiler.Elab.Types.ecAddDef", "Vuna/Compiler/Elab/Types.vuna:788"));
  ("Elab_dTypes.v_ecAddError", ("Vuna.Compiler.Elab.Types.ecAddError", "Vuna/Compiler/Elab/Types.vuna:1028"));
  ("Elab_dTypes.v_ecAddGoal", ("Vuna.Compiler.Elab.Types.ecAddGoal", "Vuna/Compiler/Elab/Types.vuna:504"));
  ("Elab_dTypes.v_ecAddInst", ("Vuna.Compiler.Elab.Types.ecAddInst", "Vuna/Compiler/Elab/Types.vuna:530"));
  ("Elab_dTypes.v_ecAddInstRaw", ("Vuna.Compiler.Elab.Types.ecAddInstRaw", "Vuna/Compiler/Elab/Types.vuna:537"));
  ("Elab_dTypes.v_ecAddWarning", ("Vuna.Compiler.Elab.Types.ecAddWarning", "Vuna/Compiler/Elab/Types.vuna:990"));
  ("Elab_dTypes.v_ecBump", ("Vuna.Compiler.Elab.Types.ecBump", "Vuna/Compiler/Elab/Types.vuna:997"));
  ("Elab_dTypes.v_ecClasses", ("Vuna.Compiler.Elab.Types.ecClasses", "Vuna/Compiler/Elab/Types.vuna:500"));
  ("Elab_dTypes.v_ecConstraints", ("Vuna.Compiler.Elab.Types.ecConstraints", "Vuna/Compiler/Elab/Types.vuna:591"));
  ("Elab_dTypes.v_ecCounters", ("Vuna.Compiler.Elab.Types.ecCounters", "Vuna/Compiler/Elab/Types.vuna:994"));
  ("Elab_dTypes.v_ecCtorIndexComplete", ("Vuna.Compiler.Elab.Types.ecCtorIndexComplete", "Vuna/Compiler/Elab/Types.vuna:752"));
  ("Elab_dTypes.v_ecDatas", ("Vuna.Compiler.Elab.Types.ecDatas", "Vuna/Compiler/Elab/Types.vuna:417"));
  ("Elab_dTypes.v_ecDefTbl", ("Vuna.Compiler.Elab.Types.ecDefTbl", "Vuna/Compiler/Elab/Types.vuna:381"));
  ("Elab_dTypes.v_ecDefs", ("Vuna.Compiler.Elab.Types.ecDefs", "Vuna/Compiler/Elab/Types.vuna:376"));
  ("Elab_dTypes.v_ecDepthTbl", ("Vuna.Compiler.Elab.Types.ecDepthTbl", "Vuna/Compiler/Elab/Types.vuna:421"));
  ("Elab_dTypes.v_ecDictPassIdle", ("Vuna.Compiler.Elab.Types.ecDictPassIdle", "Vuna/Compiler/Elab/Types.vuna:764"));
  ("Elab_dTypes.v_ecEmpty", ("Vuna.Compiler.Elab.Types.ecEmpty", "Vuna/Compiler/Elab/Types.vuna:660"));
  ("Elab_dTypes.v_ecErrors", ("Vuna.Compiler.Elab.Types.ecErrors", "Vuna/Compiler/Elab/Types.vuna:1024"));
  ("Elab_dTypes.v_ecGlobalsTbl", ("Vuna.Compiler.Elab.Types.ecGlobalsTbl", "Vuna/Compiler/Elab/Types.vuna:387"));
  ("Elab_dTypes.v_ecGoals", ("Vuna.Compiler.Elab.Types.ecGoals", "Vuna/Compiler/Elab/Types.vuna:454"));
  ("Elab_dTypes.v_ecHasLinear", ("Vuna.Compiler.Elab.Types.ecHasLinear", "Vuna/Compiler/Elab/Types.vuna:887"));
  ("Elab_dTypes.v_ecInsts", ("Vuna.Compiler.Elab.Types.ecInsts", "Vuna/Compiler/Elab/Types.vuna:458"));
  ("Elab_dTypes.v_ecInstsAudit", ("Vuna.Compiler.Elab.Types.ecInstsAudit", "Vuna/Compiler/Elab/Types.vuna:474"));
  ("Elab_dTypes.v_ecInstsFamily", ("Vuna.Compiler.Elab.Types.ecInstsFamily", "Vuna/Compiler/Elab/Types.vuna:464"));
  ("Elab_dTypes.v_ecMetaSpans", ("Vuna.Compiler.Elab.Types.ecMetaSpans", "Vuna/Compiler/Elab/Types.vuna:893"));
  ("Elab_dTypes.v_ecNext", ("Vuna.Compiler.Elab.Types.ecNext", "Vuna/Compiler/Elab/Types.vuna:367"));
  ("Elab_dTypes.v_ecPending", ("Vuna.Compiler.Elab.Types.ecPending", "Vuna/Compiler/Elab/Types.vuna:623"));
  ("Elab_dTypes.v_ecPutClausesTbl", ("Vuna.Compiler.Elab.Types.ecPutClausesTbl", "Vuna/Compiler/Elab/Types.vuna:342"));
  ("Elab_dTypes.v_ecPutConstraints", ("Vuna.Compiler.Elab.Types.ecPutConstraints", "Vuna/Compiler/Elab/Types.vuna:596"));
  ("Elab_dTypes.v_ecPutCtorIndexComplete", ("Vuna.Compiler.Elab.Types.ecPutCtorIndexComplete", "Vuna/Compiler/Elab/Types.vuna:757"));
  ("Elab_dTypes.v_ecPutCtorTbl", ("Vuna.Compiler.Elab.Types.ecPutCtorTbl", "Vuna/Compiler/Elab/Types.vuna:879"));
  ("Elab_dTypes.v_ecPutDefTbl", ("Vuna.Compiler.Elab.Types.ecPutDefTbl", "Vuna/Compiler/Elab/Types.vuna:1222"));
  ("Elab_dTypes.v_ecPutGlobalsTbl", ("Vuna.Compiler.Elab.Types.ecPutGlobalsTbl", "Vuna/Compiler/Elab/Types.vuna:391"));
  ("Elab_dTypes.v_ecPutMetaSpans", ("Vuna.Compiler.Elab.Types.ecPutMetaSpans", "Vuna/Compiler/Elab/Types.vuna:898"));
  ("Elab_dTypes.v_ecPutNext", ("Vuna.Compiler.Elab.Types.ecPutNext", "Vuna/Compiler/Elab/Types.vuna:316"));
  ("Elab_dTypes.v_ecPutPassMarker", ("Vuna.Compiler.Elab.Types.ecPutPassMarker", "Vuna/Compiler/Elab/Types.vuna:745"));
  ("Elab_dTypes.v_ecPutPending", ("Vuna.Compiler.Elab.Types.ecPutPending", "Vuna/Compiler/Elab/Types.vuna:629"));
  ("Elab_dTypes.v_ecPutSols", ("Vuna.Compiler.Elab.Types.ecPutSols", "Vuna/Compiler/Elab/Types.vuna:698"));
  ("Elab_dTypes.v_ecPutSolsCount", ("Vuna.Compiler.Elab.Types.ecPutSolsCount", "Vuna/Compiler/Elab/Types.vuna:712"));
  ("Elab_dTypes.v_ecPutSolsRaw", ("Vuna.Compiler.Elab.Types.ecPutSolsRaw", "Vuna/Compiler/Elab/Types.vuna:718"));
  ("Elab_dTypes.v_ecPutUseSpans", ("Vuna.Compiler.Elab.Types.ecPutUseSpans", "Vuna/Compiler/Elab/Types.vuna:930"));
  ("Elab_dTypes.v_ecPutWarnings", ("Vuna.Compiler.Elab.Types.ecPutWarnings", "Vuna/Compiler/Elab/Types.vuna:963"));
  ("Elab_dTypes.v_ecRecordTried", ("Vuna.Compiler.Elab.Types.ecRecordTried", "Vuna/Compiler/Elab/Types.vuna:652"));
  ("Elab_dTypes.v_ecRemoveDefTbl", ("Vuna.Compiler.Elab.Types.ecRemoveDefTbl", "Vuna/Compiler/Elab/Types.vuna:820"));
  ("Elab_dTypes.v_ecSetGlobalsComplete", ("Vuna.Compiler.Elab.Types.ecSetGlobalsComplete", "Vuna/Compiler/Elab/Types.vuna:428"));
  ("Elab_dTypes.v_ecSolTbl", ("Vuna.Compiler.Elab.Types.ecSolTbl", "Vuna/Compiler/Elab/Types.vuna:688"));
  ("Elab_dTypes.v_ecSols", ("Vuna.Compiler.Elab.Types.ecSols", "Vuna/Compiler/Elab/Types.vuna:371"));
  ("Elab_dTypes.v_ecSolsCountOf", ("Vuna.Compiler.Elab.Types.ecSolsCountOf", "Vuna/Compiler/Elab/Types.vuna:707"));
  ("Elab_dTypes.v_ecSolsP", ("Vuna.Compiler.Elab.Types.ecSolsP", "Vuna/Compiler/Elab/Types.vuna:696"));
  ("Elab_dTypes.v_ecTriedAt", ("Vuna.Compiler.Elab.Types.ecTriedAt", "Vuna/Compiler/Elab/Types.vuna:646"));
  ("Elab_dTypes.v_ecUseSpans", ("Vuna.Compiler.Elab.Types.ecUseSpans", "Vuna/Compiler/Elab/Types.vuna:925"));
  ("Elab_dTypes.v_ecWarnings", ("Vuna.Compiler.Elab.Types.ecWarnings", "Vuna/Compiler/Elab/Types.vuna:958"));
  ("Elab_dTypes.v_emptyCtx", ("Vuna.Compiler.Elab.Types.emptyCtx", "Vuna/Compiler/Elab/Types.vuna:1156"));
  ("Elab_dTypes.v_errAt", ("Vuna.Compiler.Elab.Types.errAt", "Vuna/Compiler/Elab/Types.vuna:1162"));
  ("Elab_dTypes.v_evalCtx", ("Vuna.Compiler.Elab.Types.evalCtx", "Vuna/Compiler/Elab/Types.vuna:1148"));
  ("Elab_dTypes.v_flattenTaggedApp", ("Vuna.Compiler.Elab.Types.flattenTaggedApp", "Vuna/Compiler/Elab/Types.vuna:178"));
  ("Elab_dTypes.v_forceVal", ("Vuna.Compiler.Elab.Types.forceVal", "Vuna/Compiler/Elab/Types.vuna:1172"));
  ("Elab_dTypes.v_hasInstName", ("Vuna.Compiler.Elab.Types.hasInstName", "Vuna/Compiler/Elab/Types.vuna:533"));
  ("Elab_dTypes.v_instFamilyOf", ("Vuna.Compiler.Elab.Types.instFamilyOf", "Vuna/Compiler/Elab/Types.vuna:200"));
  ("Elab_dTypes.v_instNamesEq", ("Vuna.Compiler.Elab.Types.instNamesEq", "Vuna/Compiler/Elab/Types.vuna:494"));
  ("Elab_dTypes.v_instStoreEmpty", ("Vuna.Compiler.Elab.Types.instStoreEmpty", "Vuna/Compiler/Elab/Types.vuna:207"));
  ("Elab_dTypes.v_instStoreFamily", ("Vuna.Compiler.Elab.Types.instStoreFamily", "Vuna/Compiler/Elab/Types.vuna:231"));
  ("Elab_dTypes.v_instStoreOf", ("Vuna.Compiler.Elab.Types.instStoreOf", "Vuna/Compiler/Elab/Types.vuna:212"));
  ("Elab_dTypes.v_instStorePush", ("Vuna.Compiler.Elab.Types.instStorePush", "Vuna/Compiler/Elab/Types.vuna:217"));
  ("Elab_dTypes.v_memDataNameIn", ("Vuna.Compiler.Elab.Types.memDataNameIn", "Vuna/Compiler/Elab/Types.vuna:781"));
  ("Elab_dTypes.v_newMeta", ("Vuna.Compiler.Elab.Types.newMeta", "Vuna/Compiler/Elab/Types.vuna:1166"));
  ("Elab_dTypes.v_prefixUntilId", ("Vuna.Compiler.Elab.Types.prefixUntilId", "Vuna/Compiler/Elab/Types.vuna:775"));
  ("Elab_dTypes.v_refineLookup", ("Vuna.Compiler.Elab.Types.refineLookup", "Vuna/Compiler/Elab/Types.vuna:1143"));
  ("Elab_dTypes.v_refineValue", ("Vuna.Compiler.Elab.Types.refineValue", "Vuna/Compiler/Elab/Types.vuna:1121"));
  ("Elab_dTypes.v_refinedEnv", ("Vuna.Compiler.Elab.Types.refinedEnv", "Vuna/Compiler/Elab/Types.vuna:1100"));
  ("Elab_dTypes.v_solsDelta", ("Vuna.Compiler.Elab.Types.solsDelta", "Vuna/Compiler/Elab/Types.vuna:771"));
  ("Elab_dTypes.v_solsToTbl", ("Vuna.Compiler.Elab.Types.solsToTbl", "Vuna/Compiler/Elab/Types.vuna:1219"));
  ("Elab_dTypes.v_varTypeValue", ("Vuna.Compiler.Elab.Types.varTypeValue", "Vuna/Compiler/Elab/Types.vuna:1153"));
  ("Elab_dUsage.v_binderEditSpan", ("Vuna.Compiler.Elab.Usage.binderEditSpan", "Vuna/Compiler/Elab/Usage.vuna:106"));
  ("Elab_dUsage.v_capAltsFuel", ("Vuna.Compiler.Elab.Usage.capAltsFuel", "Vuna/Compiler/Elab/Usage.vuna:351"));
  ("Elab_dUsage.v_capArgsFuel", ("Vuna.Compiler.Elab.Usage.capArgsFuel", "Vuna/Compiler/Elab/Usage.vuna:339"));
  ("Elab_dUsage.v_capArgsGo", ("Vuna.Compiler.Elab.Usage.capArgsGo", "Vuna/Compiler/Elab/Usage.vuna:342"));
  ("Elab_dUsage.v_capCheck", ("Vuna.Compiler.Elab.Usage.capCheck", "Vuna/Compiler/Elab/Usage.vuna:298"));
  ("Elab_dUsage.v_capCheckFuel", ("Vuna.Compiler.Elab.Usage.capCheckFuel", "Vuna/Compiler/Elab/Usage.vuna:313"));
  ("Elab_dUsage.v_capCheckFuelFor", ("Vuna.Compiler.Elab.Usage.capCheckFuelFor", "Vuna/Compiler/Elab/Usage.vuna:304"));
  ("Elab_dUsage.v_capCheckFuelMax", ("Vuna.Compiler.Elab.Usage.capCheckFuelMax", "Vuna/Compiler/Elab/Usage.vuna:310"));
  ("Elab_dUsage.v_checkAltBinders", ("Vuna.Compiler.Elab.Usage.checkAltBinders", "Vuna/Compiler/Elab/Usage.vuna:142"));
  ("Elab_dUsage.v_checkAltBindersGo", ("Vuna.Compiler.Elab.Usage.checkAltBindersGo", "Vuna/Compiler/Elab/Usage.vuna:145"));
  ("Elab_dUsage.v_checkAlts", ("Vuna.Compiler.Elab.Usage.checkAlts", "Vuna/Compiler/Elab/Usage.vuna:240"));
  ("Elab_dUsage.v_checkAltsGo", ("Vuna.Compiler.Elab.Usage.checkAltsGo", "Vuna/Compiler/Elab/Usage.vuna:243"));
  ("Elab_dUsage.v_checkArgs", ("Vuna.Compiler.Elab.Usage.checkArgs", "Vuna/Compiler/Elab/Usage.vuna:227"));
  ("Elab_dUsage.v_checkArgsGo", ("Vuna.Compiler.Elab.Usage.checkArgsGo", "Vuna/Compiler/Elab/Usage.vuna:230"));
  ("Elab_dUsage.v_checkBinderRig", ("Vuna.Compiler.Elab.Usage.checkBinderRig", "Vuna/Compiler/Elab/Usage.vuna:79"));
  ("Elab_dUsage.v_checkDefCapture", ("Vuna.Compiler.Elab.Usage.checkDefCapture", "Vuna/Compiler/Elab/Usage.vuna:369"));
  ("Elab_dUsage.v_checkDefUsage", ("Vuna.Compiler.Elab.Usage.checkDefUsage", "Vuna/Compiler/Elab/Usage.vuna:275"));
  ("Elab_dUsage.v_checkLamBinder", ("Vuna.Compiler.Elab.Usage.checkLamBinder", "Vuna/Compiler/Elab/Usage.vuna:114"));
  ("Elab_dUsage.v_checkProgramUsage", ("Vuna.Compiler.Elab.Usage.checkProgramUsage", "Vuna/Compiler/Elab/Usage.vuna:378"));
  ("Elab_dUsage.v_checkProgramUsageGo", ("Vuna.Compiler.Elab.Usage.checkProgramUsageGo", "Vuna/Compiler/Elab/Usage.vuna:381"));
  ("Elab_dUsage.v_checkTerm", ("Vuna.Compiler.Elab.Usage.checkTerm", "Vuna/Compiler/Elab/Usage.vuna:177"));
  ("Elab_dUsage.v_ctorFamilyLinear", ("Vuna.Compiler.Elab.Usage.ctorFamilyLinear", "Vuna/Compiler/Elab/Usage.vuna:359"));
  ("Elab_dUsage.v_defSpanOf", ("Vuna.Compiler.Elab.Usage.defSpanOf", "Vuna/Compiler/Elab/Usage.vuna:393"));
  ("Elab_dUsage.v_isRigZero", ("Vuna.Compiler.Elab.Usage.isRigZero", "Vuna/Compiler/Elab/Usage.vuna:269"));
  ("Elab_dUsage.v_isTypeForming", ("Vuna.Compiler.Elab.Usage.isTypeForming", "Vuna/Compiler/Elab/Usage.vuna:28"));
  ("Elab_dUsage.v_isTypeFormingFuel", ("Vuna.Compiler.Elab.Usage.isTypeFormingFuel", "Vuna/Compiler/Elab/Usage.vuna:31"));
  ("Elab_dUsage.v_isTypeLevelDef", ("Vuna.Compiler.Elab.Usage.isTypeLevelDef", "Vuna/Compiler/Elab/Usage.vuna:372"));
  ("Elab_dUsage.v_recordUseSpan", ("Vuna.Compiler.Elab.Usage.recordUseSpan", "Vuna/Compiler/Elab/Usage.vuna:421"));
  ("Elab_dUsage.v_renameSuggestion", ("Vuna.Compiler.Elab.Usage.renameSuggestion", "Vuna/Compiler/Elab/Usage.vuna:405"));
  ("Elab_dUsage.v_resetUseSpans", ("Vuna.Compiler.Elab.Usage.resetUseSpans", "Vuna/Compiler/Elab/Usage.vuna:417"));
  ("Elab_dUsage.v_resolvedBinderSpan", ("Vuna.Compiler.Elab.Usage.resolvedBinderSpan", "Vuna/Compiler/Elab/Usage.vuna:101"));
  ("Elab_dUsage.v_shadowedByRuntime", ("Vuna.Compiler.Elab.Usage.shadowedByRuntime", "Vuna/Compiler/Elab/Usage.vuna:135"));
  ("Elab_dUsage.v_uAdd", ("Vuna.Compiler.Elab.Usage.uAdd", "Vuna/Compiler/Elab/Usage.vuna:55"));
  ("Elab_dUsage.v_uDrop", ("Vuna.Compiler.Elab.Usage.uDrop", "Vuna/Compiler/Elab/Usage.vuna:68"));
  ("Elab_dUsage.v_uJoin", ("Vuna.Compiler.Elab.Usage.uJoin", "Vuna/Compiler/Elab/Usage.vuna:63"));
  ("Elab_dUsage.v_uScale", ("Vuna.Compiler.Elab.Usage.uScale", "Vuna/Compiler/Elab/Usage.vuna:60"));
  ("Elab_dUsage.v_uVarAt", ("Vuna.Compiler.Elab.Usage.uVarAt", "Vuna/Compiler/Elab/Usage.vuna:48"));
  ("Elab_dUsage.v_uVarAtGo", ("Vuna.Compiler.Elab.Usage.uVarAtGo", "Vuna/Compiler/Elab/Usage.vuna:51"));
  ("Elab_dUsage.v_uZeroOf", ("Vuna.Compiler.Elab.Usage.uZeroOf", "Vuna/Compiler/Elab/Usage.vuna:45"));
  ("Elab_dUsage.v_usesOf", ("Vuna.Compiler.Elab.Usage.usesOf", "Vuna/Compiler/Elab/Usage.vuna:425"));
  ("Elab_dUsage.v_warnAt", ("Vuna.Compiler.Elab.Usage.warnAt", "Vuna/Compiler/Elab/Usage.vuna:443"));
  ("Elab_dUsage.v_warnAt0", ("Vuna.Compiler.Elab.Usage.warnAt0", "Vuna/Compiler/Elab/Usage.vuna:447"));
  ("Elab_dUsage.v_warnAt0Mod", ("Vuna.Compiler.Elab.Usage.warnAt0Mod", "Vuna/Compiler/Elab/Usage.vuna:459"));
  ("Elab_dUsage.v_warnAt1", ("Vuna.Compiler.Elab.Usage.warnAt1", "Vuna/Compiler/Elab/Usage.vuna:451"));
  ("Elab_dUsage.v_warnAt1Mod", ("Vuna.Compiler.Elab.Usage.warnAt1Mod", "Vuna/Compiler/Elab/Usage.vuna:455"));
  ("Elab_dUsage.v_warnUnusedBinder", ("Vuna.Compiler.Elab.Usage.warnUnusedBinder", "Vuna/Compiler/Elab/Usage.vuna:401"));
  ("Elab_dUsage.v_withUseFields", ("Vuna.Compiler.Elab.Usage.withUseFields", "Vuna/Compiler/Elab/Usage.vuna:429"));
  ("Elab_dUsage.v_withUseSpans", ("Vuna.Compiler.Elab.Usage.withUseSpans", "Vuna/Compiler/Elab/Usage.vuna:433"));
  ("Frontend_dAst.v__udeclCtors", ("Vuna.Compiler.Frontend.Ast._declCtors", "Vuna/Compiler/Frontend/Ast.vuna:396"));
  ("Frontend_dAst.v_appAtSyntax", ("Vuna.Compiler.Frontend.Ast.appAtSyntax", "Vuna/Compiler/Frontend/Ast.vuna:631"));
  ("Frontend_dAst.v_ascribeSyntax", ("Vuna.Compiler.Frontend.Ast.ascribeSyntax", "Vuna/Compiler/Frontend/Ast.vuna:560"));
  ("Frontend_dAst.v_clausesFor", ("Vuna.Compiler.Frontend.Ast.clausesFor", "Vuna/Compiler/Frontend/Ast.vuna:319"));
  ("Frontend_dAst.v_collectClauses", ("Vuna.Compiler.Frontend.Ast.collectClauses", "Vuna/Compiler/Frontend/Ast.vuna:311"));
  ("Frontend_dAst.v_ctorArity", ("Vuna.Compiler.Frontend.Ast.ctorArity", "Vuna/Compiler/Frontend/Ast.vuna:361"));
  ("Frontend_dAst.v_ctorDisplayName", ("Vuna.Compiler.Frontend.Ast.ctorDisplayName", "Vuna/Compiler/Frontend/Ast.vuna:340"));
  ("Frontend_dAst.v_ctorName", ("Vuna.Compiler.Frontend.Ast.ctorName", "Vuna/Compiler/Frontend/Ast.vuna:328"));
  ("Frontend_dAst.v_ctorShortName", ("Vuna.Compiler.Frontend.Ast.ctorShortName", "Vuna/Compiler/Frontend/Ast.vuna:334"));
  ("Frontend_dAst.v_ctorSpan", ("Vuna.Compiler.Frontend.Ast.ctorSpan", "Vuna/Compiler/Frontend/Ast.vuna:280"));
  ("Frontend_dAst.v_ctorType", ("Vuna.Compiler.Frontend.Ast.ctorType", "Vuna/Compiler/Frontend/Ast.vuna:349"));
  ("Frontend_dAst.v_ctorsOf", ("Vuna.Compiler.Frontend.Ast.ctorsOf", "Vuna/Compiler/Frontend/Ast.vuna:402"));
  ("Frontend_dAst.v_declAllNames", ("Vuna.Compiler.Frontend.Ast.declAllNames", "Vuna/Compiler/Frontend/Ast.vuna:389"));
  ("Frontend_dAst.v_declDerivings", ("Vuna.Compiler.Frontend.Ast.declDerivings", "Vuna/Compiler/Frontend/Ast.vuna:414"));
  ("Frontend_dAst.v_declNames", ("Vuna.Compiler.Frontend.Ast.declNames", "Vuna/Compiler/Frontend/Ast.vuna:373"));
  ("Frontend_dAst.v_declSpan", ("Vuna.Compiler.Frontend.Ast.declSpan", "Vuna/Compiler/Frontend/Ast.vuna:270"));
  ("Frontend_dAst.v_declTypeNames", ("Vuna.Compiler.Frontend.Ast.declTypeNames", "Vuna/Compiler/Frontend/Ast.vuna:405"));
  ("Frontend_dAst.v_doBindSyntaxName", ("Vuna.Compiler.Frontend.Ast.doBindSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:681"));
  ("Frontend_dAst.v_doBindSyntaxPrefix", ("Vuna.Compiler.Frontend.Ast.doBindSyntaxPrefix", "Vuna/Compiler/Frontend/Ast.vuna:673"));
  ("Frontend_dAst.v_doIgnoreSyntaxName", ("Vuna.Compiler.Frontend.Ast.doIgnoreSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:685"));
  ("Frontend_dAst.v_doIgnoreSyntaxPrefix", ("Vuna.Compiler.Frontend.Ast.doIgnoreSyntaxPrefix", "Vuna/Compiler/Frontend/Ast.vuna:677"));
  ("Frontend_dAst.v_doStmtExpr", ("Vuna.Compiler.Frontend.Ast.doStmtExpr", "Vuna/Compiler/Frontend/Ast.vuna:266"));
  ("Frontend_dAst.v_doStmtSpan", ("Vuna.Compiler.Frontend.Ast.doStmtSpan", "Vuna/Compiler/Frontend/Ast.vuna:262"));
  ("Frontend_dAst.v_doSyntaxCanonical", ("Vuna.Compiler.Frontend.Ast.doSyntaxCanonical", "Vuna/Compiler/Frontend/Ast.vuna:698"));
  ("Frontend_dAst.v_dropNChars", ("Vuna.Compiler.Frontend.Ast.dropNChars", "Vuna/Compiler/Frontend/Ast.vuna:457"));
  ("Frontend_dAst.v_dropNamePrefix", ("Vuna.Compiler.Frontend.Ast.dropNamePrefix", "Vuna/Compiler/Frontend/Ast.vuna:467"));
  ("Frontend_dAst.v_exportItemSpan", ("Vuna.Compiler.Frontend.Ast.exportItemSpan", "Vuna/Compiler/Frontend/Ast.vuna:304"));
  ("Frontend_dAst.v_exportSpecName", ("Vuna.Compiler.Frontend.Ast.exportSpecName", "Vuna/Compiler/Frontend/Ast.vuna:180"));
  ("Frontend_dAst.v_exportSpecSpan", ("Vuna.Compiler.Frontend.Ast.exportSpecSpan", "Vuna/Compiler/Frontend/Ast.vuna:184"));
  ("Frontend_dAst.v_exprSpan", ("Vuna.Compiler.Frontend.Ast.exprSpan", "Vuna/Compiler/Frontend/Ast.vuna:237"));
  ("Frontend_dAst.v_fieldName", ("Vuna.Compiler.Frontend.Ast.fieldName", "Vuna/Compiler/Frontend/Ast.vuna:286"));
  ("Frontend_dAst.v_fieldSpan", ("Vuna.Compiler.Frontend.Ast.fieldSpan", "Vuna/Compiler/Frontend/Ast.vuna:283"));
  ("Frontend_dAst.v_fieldType", ("Vuna.Compiler.Frontend.Ast.fieldType", "Vuna/Compiler/Frontend/Ast.vuna:289"));
  ("Frontend_dAst.v_fixitySpan", ("Vuna.Compiler.Frontend.Ast.fixitySpan", "Vuna/Compiler/Frontend/Ast.vuna:119"));
  ("Frontend_dAst.v_funArity", ("Vuna.Compiler.Frontend.Ast.funArity", "Vuna/Compiler/Frontend/Ast.vuna:322"));
  ("Frontend_dAst.v_handleNoRetSyntax", ("Vuna.Compiler.Frontend.Ast.handleNoRetSyntax", "Vuna/Compiler/Frontend/Ast.vuna:610"));
  ("Frontend_dAst.v_handleSyntax", ("Vuna.Compiler.Frontend.Ast.handleSyntax", "Vuna/Compiler/Frontend/Ast.vuna:602"));
  ("Frontend_dAst.v_holeNameOf", ("Vuna.Compiler.Frontend.Ast.holeNameOf", "Vuna/Compiler/Frontend/Ast.vuna:435"));
  ("Frontend_dAst.v_holeNamed", ("Vuna.Compiler.Frontend.Ast.holeNamed", "Vuna/Compiler/Frontend/Ast.vuna:428"));
  ("Frontend_dAst.v_instArgSyntax", ("Vuna.Compiler.Frontend.Ast.instArgSyntax", "Vuna/Compiler/Frontend/Ast.vuna:640"));
  ("Frontend_dAst.v_internalNamePrefix", ("Vuna.Compiler.Frontend.Ast.internalNamePrefix", "Vuna/Compiler/Frontend/Ast.vuna:445"));
  ("Frontend_dAst.v_isAppAtSyntax", ("Vuna.Compiler.Frontend.Ast.isAppAtSyntax", "Vuna/Compiler/Frontend/Ast.vuna:635"));
  ("Frontend_dAst.v_isAscribeSyntax", ("Vuna.Compiler.Frontend.Ast.isAscribeSyntax", "Vuna/Compiler/Frontend/Ast.vuna:564"));
  ("Frontend_dAst.v_isDoBindSyntaxName", ("Vuna.Compiler.Frontend.Ast.isDoBindSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:689"));
  ("Frontend_dAst.v_isDoIgnoreSyntaxName", ("Vuna.Compiler.Frontend.Ast.isDoIgnoreSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:693"));
  ("Frontend_dAst.v_isHandleNoRetSyntax", ("Vuna.Compiler.Frontend.Ast.isHandleNoRetSyntax", "Vuna/Compiler/Frontend/Ast.vuna:614"));
  ("Frontend_dAst.v_isHandleSyntax", ("Vuna.Compiler.Frontend.Ast.isHandleSyntax", "Vuna/Compiler/Frontend/Ast.vuna:606"));
  ("Frontend_dAst.v_isHoleName", ("Vuna.Compiler.Frontend.Ast.isHoleName", "Vuna/Compiler/Frontend/Ast.vuna:425"));
  ("Frontend_dAst.v_isInstArgSyntax", ("Vuna.Compiler.Frontend.Ast.isInstArgSyntax", "Vuna/Compiler/Frontend/Ast.vuna:644"));
  ("Frontend_dAst.v_isInternalSyntaxName", ("Vuna.Compiler.Frontend.Ast.isInternalSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:453"));
  ("Frontend_dAst.v_isListConsSyntax", ("Vuna.Compiler.Frontend.Ast.isListConsSyntax", "Vuna/Compiler/Frontend/Ast.vuna:536"));
  ("Frontend_dAst.v_isListNilSyntax", ("Vuna.Compiler.Frontend.Ast.isListNilSyntax", "Vuna/Compiler/Frontend/Ast.vuna:532"));
  ("Frontend_dAst.v_isMacroSyntaxName", ("Vuna.Compiler.Frontend.Ast.isMacroSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:664"));
  ("Frontend_dAst.v_isOverCtorName", ("Vuna.Compiler.Frontend.Ast.isOverCtorName", "Vuna/Compiler/Frontend/Ast.vuna:496"));
  ("Frontend_dAst.v_isOverValueName", ("Vuna.Compiler.Frontend.Ast.isOverValueName", "Vuna/Compiler/Frontend/Ast.vuna:518"));
  ("Frontend_dAst.v_isPerformSyntax", ("Vuna.Compiler.Frontend.Ast.isPerformSyntax", "Vuna/Compiler/Frontend/Ast.vuna:590"));
  ("Frontend_dAst.v_isRowAtSyntax", ("Vuna.Compiler.Frontend.Ast.isRowAtSyntax", "Vuna/Compiler/Frontend/Ast.vuna:624"));
  ("Frontend_dAst.v_isTuplePairSyntax", ("Vuna.Compiler.Frontend.Ast.isTuplePairSyntax", "Vuna/Compiler/Frontend/Ast.vuna:546"));
  ("Frontend_dAst.v_isTupleUnitSyntax", ("Vuna.Compiler.Frontend.Ast.isTupleUnitSyntax", "Vuna/Compiler/Frontend/Ast.vuna:554"));
  ("Frontend_dAst.v_joinWithAt", ("Vuna.Compiler.Frontend.Ast.joinWithAt", "Vuna/Compiler/Frontend/Ast.vuna:472"));
  ("Frontend_dAst.v_listConsSyntax", ("Vuna.Compiler.Frontend.Ast.listConsSyntax", "Vuna/Compiler/Frontend/Ast.vuna:528"));
  ("Frontend_dAst.v_listNilSyntax", ("Vuna.Compiler.Frontend.Ast.listNilSyntax", "Vuna/Compiler/Frontend/Ast.vuna:524"));
  ("Frontend_dAst.v_lookupCtorArity", ("Vuna.Compiler.Frontend.Ast.lookupCtorArity", "Vuna/Compiler/Frontend/Ast.vuna:356"));
  ("Frontend_dAst.v_macroNameOf", ("Vuna.Compiler.Frontend.Ast.macroNameOf", "Vuna/Compiler/Frontend/Ast.vuna:668"));
  ("Frontend_dAst.v_macroSyntaxName", ("Vuna.Compiler.Frontend.Ast.macroSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:660"));
  ("Frontend_dAst.v_macroSyntaxPrefix", ("Vuna.Compiler.Frontend.Ast.macroSyntaxPrefix", "Vuna/Compiler/Frontend/Ast.vuna:656"));
  ("Frontend_dAst.v_opacitySpecName", ("Vuna.Compiler.Frontend.Ast.opacitySpecName", "Vuna/Compiler/Frontend/Ast.vuna:199"));
  ("Frontend_dAst.v_opacitySpecSpan", ("Vuna.Compiler.Frontend.Ast.opacitySpecSpan", "Vuna/Compiler/Frontend/Ast.vuna:202"));
  ("Frontend_dAst.v_overCtorName", ("Vuna.Compiler.Frontend.Ast.overCtorName", "Vuna/Compiler/Frontend/Ast.vuna:478"));
  ("Frontend_dAst.v_overCtorPrefix", ("Vuna.Compiler.Frontend.Ast.overCtorPrefix", "Vuna/Compiler/Frontend/Ast.vuna:449"));
  ("Frontend_dAst.v_overCtorShort", ("Vuna.Compiler.Frontend.Ast.overCtorShort", "Vuna/Compiler/Frontend/Ast.vuna:482"));
  ("Frontend_dAst.v_overCtorTargets", ("Vuna.Compiler.Frontend.Ast.overCtorTargets", "Vuna/Compiler/Frontend/Ast.vuna:489"));
  ("Frontend_dAst.v_overValueName", ("Vuna.Compiler.Frontend.Ast.overValueName", "Vuna/Compiler/Frontend/Ast.vuna:503"));
  ("Frontend_dAst.v_overValuePrefix", ("Vuna.Compiler.Frontend.Ast.overValuePrefix", "Vuna/Compiler/Frontend/Ast.vuna:500"));
  ("Frontend_dAst.v_overValueShort", ("Vuna.Compiler.Frontend.Ast.overValueShort", "Vuna/Compiler/Frontend/Ast.vuna:506"));
  ("Frontend_dAst.v_overValueTargets", ("Vuna.Compiler.Frontend.Ast.overValueTargets", "Vuna/Compiler/Frontend/Ast.vuna:512"));
  ("Frontend_dAst.v_patSpan", ("Vuna.Compiler.Frontend.Ast.patSpan", "Vuna/Compiler/Frontend/Ast.vuna:228"));
  ("Frontend_dAst.v_performSyntax", ("Vuna.Compiler.Frontend.Ast.performSyntax", "Vuna/Compiler/Frontend/Ast.vuna:586"));
  ("Frontend_dAst.v_qtyIsZero", ("Vuna.Compiler.Frontend.Ast.qtyIsZero", "Vuna/Compiler/Frontend/Ast.vuna:45"));
  ("Frontend_dAst.v_reprPrefix", ("Vuna.Compiler.Frontend.Ast.reprPrefix", "Vuna/Compiler/Frontend/Ast.vuna:59"));
  ("Frontend_dAst.v_rowAtSyntax", ("Vuna.Compiler.Frontend.Ast.rowAtSyntax", "Vuna/Compiler/Frontend/Ast.vuna:620"));
  ("Frontend_dAst.v_topNames", ("Vuna.Compiler.Frontend.Ast.topNames", "Vuna/Compiler/Frontend/Ast.vuna:386"));
  ("Frontend_dAst.v_traitMethodName", ("Vuna.Compiler.Frontend.Ast.traitMethodName", "Vuna/Compiler/Frontend/Ast.vuna:292"));
  ("Frontend_dAst.v_traitMethodSpan", ("Vuna.Compiler.Frontend.Ast.traitMethodSpan", "Vuna/Compiler/Frontend/Ast.vuna:295"));
  ("Frontend_dAst.v_tuplePairSyntax", ("Vuna.Compiler.Frontend.Ast.tuplePairSyntax", "Vuna/Compiler/Frontend/Ast.vuna:542"));
  ("Frontend_dAst.v_tupleUnitSyntax", ("Vuna.Compiler.Frontend.Ast.tupleUnitSyntax", "Vuna/Compiler/Frontend/Ast.vuna:550"));
  ("Frontend_dAst.v_typeArity", ("Vuna.Compiler.Frontend.Ast.typeArity", "Vuna/Compiler/Frontend/Ast.vuna:352"));
  ("Frontend_dAst.v_typeNamesOf", ("Vuna.Compiler.Frontend.Ast.typeNamesOf", "Vuna/Compiler/Frontend/Ast.vuna:411"));
  ("Frontend_dCanonical_dAst.v_decClause", ("Vuna.Compiler.Frontend.Canonical.Ast.decClause", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:800"));
  ("Frontend_dCanonical_dAst.v_decCtor", ("Vuna.Compiler.Frontend.Canonical.Ast.decCtor", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:589"));
  ("Frontend_dCanonical_dAst.v_decCtorComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decCtorComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:980"));
  ("Frontend_dCanonical_dAst.v_decDecl", ("Vuna.Compiler.Frontend.Canonical.Ast.decDecl", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:668"));
  ("Frontend_dCanonical_dAst.v_decDeclComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decDeclComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:945"));
  ("Frontend_dCanonical_dAst.v_decDecls", ("Vuna.Compiler.Frontend.Canonical.Ast.decDecls", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:909"));
  ("Frontend_dCanonical_dAst.v_decDeclsComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decDeclsComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1008"));
  ("Frontend_dCanonical_dAst.v_decDeclsItems", ("Vuna.Compiler.Frontend.Canonical.Ast.decDeclsItems", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:919"));
  ("Frontend_dCanonical_dAst.v_decDoStmt", ("Vuna.Compiler.Frontend.Canonical.Ast.decDoStmt", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:396"));
  ("Frontend_dCanonical_dAst.v_decDoStmtComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decDoStmtComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:973"));
  ("Frontend_dCanonical_dAst.v_decExportItem", ("Vuna.Compiler.Frontend.Canonical.Ast.decExportItem", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1072"));
  ("Frontend_dCanonical_dAst.v_decExportMembers", ("Vuna.Compiler.Frontend.Canonical.Ast.decExportMembers", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1088"));
  ("Frontend_dCanonical_dAst.v_decExportSpec", ("Vuna.Compiler.Frontend.Canonical.Ast.decExportSpec", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1102"));
  ("Frontend_dCanonical_dAst.v_decExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.decExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:419"));
  ("Frontend_dCanonical_dAst.v_decExprComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decExprComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:938"));
  ("Frontend_dCanonical_dAst.v_decExprList", ("Vuna.Compiler.Frontend.Canonical.Ast.decExprList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:865"));
  ("Frontend_dCanonical_dAst.v_decExprListItems", ("Vuna.Compiler.Frontend.Canonical.Ast.decExprListItems", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:875"));
  ("Frontend_dCanonical_dAst.v_decField", ("Vuna.Compiler.Frontend.Canonical.Ast.decField", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:611"));
  ("Frontend_dCanonical_dAst.v_decFieldComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decFieldComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:987"));
  ("Frontend_dCanonical_dAst.v_decFixityLike", ("Vuna.Compiler.Frontend.Canonical.Ast.decFixityLike", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1148"));
  ("Frontend_dCanonical_dAst.v_decImportLike", ("Vuna.Compiler.Frontend.Canonical.Ast.decImportLike", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1142"));
  ("Frontend_dCanonical_dAst.v_decInterpPart", ("Vuna.Compiler.Frontend.Canonical.Ast.decInterpPart", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:330"));
  ("Frontend_dCanonical_dAst.v_decInterpPartComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decInterpPartComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:966"));
  ("Frontend_dCanonical_dAst.v_decListDigits", ("Vuna.Compiler.Frontend.Canonical.Ast.decListDigits", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:850"));
  ("Frontend_dCanonical_dAst.v_decListHead", ("Vuna.Compiler.Frontend.Canonical.Ast.decListHead", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:840"));
  ("Frontend_dCanonical_dAst.v_decMaybeExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.decMaybeExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:326"));
  ("Frontend_dCanonical_dAst.v_decMaybeQty", ("Vuna.Compiler.Frontend.Canonical.Ast.decMaybeQty", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:322"));
  ("Frontend_dCanonical_dAst.v_decModDecl", ("Vuna.Compiler.Frontend.Canonical.Ast.decModDecl", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1136"));
  ("Frontend_dCanonical_dAst.v_decOpacity", ("Vuna.Compiler.Frontend.Canonical.Ast.decOpacity", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1115"));
  ("Frontend_dCanonical_dAst.v_decOpacitySpec", ("Vuna.Compiler.Frontend.Canonical.Ast.decOpacitySpec", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1129"));
  ("Frontend_dCanonical_dAst.v_decPat", ("Vuna.Compiler.Frontend.Canonical.Ast.decPat", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:350"));
  ("Frontend_dCanonical_dAst.v_decPatComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decPatComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:931"));
  ("Frontend_dCanonical_dAst.v_decPatExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.decPatExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:787"));
  ("Frontend_dCanonical_dAst.v_decPatList", ("Vuna.Compiler.Frontend.Canonical.Ast.decPatList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:887"));
  ("Frontend_dCanonical_dAst.v_decPatListItems", ("Vuna.Compiler.Frontend.Canonical.Ast.decPatListItems", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:897"));
  ("Frontend_dCanonical_dAst.v_decQty", ("Vuna.Compiler.Frontend.Canonical.Ast.decQty", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:293"));
  ("Frontend_dCanonical_dAst.v_decQtyComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decQtyComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:952"));
  ("Frontend_dCanonical_dAst.v_decReprTier", ("Vuna.Compiler.Frontend.Canonical.Ast.decReprTier", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:307"));
  ("Frontend_dCanonical_dAst.v_decReprTierComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decReprTierComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:959"));
  ("Frontend_dCanonical_dAst.v_decSourceFileComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decSourceFileComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1155"));
  ("Frontend_dCanonical_dAst.v_decSourceFileGo", ("Vuna.Compiler.Frontend.Canonical.Ast.decSourceFileGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1161"));
  ("Frontend_dCanonical_dAst.v_decStrExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.decStrExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:813"));
  ("Frontend_dCanonical_dAst.v_decStrPat", ("Vuna.Compiler.Frontend.Canonical.Ast.decStrPat", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:826"));
  ("Frontend_dCanonical_dAst.v_decTraitMethod", ("Vuna.Compiler.Frontend.Canonical.Ast.decTraitMethod", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:649"));
  ("Frontend_dCanonical_dAst.v_decTraitMethodComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decTraitMethodComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1001"));
  ("Frontend_dCanonical_dAst.v_decTraitParam", ("Vuna.Compiler.Frontend.Canonical.Ast.decTraitParam", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:630"));
  ("Frontend_dCanonical_dAst.v_decTraitParamComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decTraitParamComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:994"));
  ("Frontend_dCanonical_dAst.v_encClauses", ("Vuna.Compiler.Frontend.Canonical.Ast.encClauses", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:115"));
  ("Frontend_dCanonical_dAst.v_encClausesGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encClausesGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:119"));
  ("Frontend_dCanonical_dAst.v_encCtor", ("Vuna.Compiler.Frontend.Canonical.Ast.encCtor", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:253"));
  ("Frontend_dCanonical_dAst.v_encCtorList", ("Vuna.Compiler.Frontend.Canonical.Ast.encCtorList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:160"));
  ("Frontend_dCanonical_dAst.v_encCtorListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encCtorListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:164"));
  ("Frontend_dCanonical_dAst.v_encDecl", ("Vuna.Compiler.Frontend.Canonical.Ast.encDecl", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:269"));
  ("Frontend_dCanonical_dAst.v_encDecls", ("Vuna.Compiler.Frontend.Canonical.Ast.encDecls", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:196"));
  ("Frontend_dCanonical_dAst.v_encDeclsGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encDeclsGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:200"));
  ("Frontend_dCanonical_dAst.v_encDoStmt", ("Vuna.Compiler.Frontend.Canonical.Ast.encDoStmt", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:220"));
  ("Frontend_dCanonical_dAst.v_encExportItem", ("Vuna.Compiler.Frontend.Canonical.Ast.encExportItem", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1022"));
  ("Frontend_dCanonical_dAst.v_encExportMembers", ("Vuna.Compiler.Frontend.Canonical.Ast.encExportMembers", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1029"));
  ("Frontend_dCanonical_dAst.v_encExportSpec", ("Vuna.Compiler.Frontend.Canonical.Ast.encExportSpec", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1034"));
  ("Frontend_dCanonical_dAst.v_encExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.encExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:225"));
  ("Frontend_dCanonical_dAst.v_encExprList", ("Vuna.Compiler.Frontend.Canonical.Ast.encExprList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:88"));
  ("Frontend_dCanonical_dAst.v_encExprListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encExprListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:92"));
  ("Frontend_dCanonical_dAst.v_encField", ("Vuna.Compiler.Frontend.Canonical.Ast.encField", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:257"));
  ("Frontend_dCanonical_dAst.v_encFieldList", ("Vuna.Compiler.Frontend.Canonical.Ast.encFieldList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:169"));
  ("Frontend_dCanonical_dAst.v_encFieldListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encFieldListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:173"));
  ("Frontend_dCanonical_dAst.v_encFixityLike", ("Vuna.Compiler.Frontend.Canonical.Ast.encFixityLike", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1068"));
  ("Frontend_dCanonical_dAst.v_encImportLike", ("Vuna.Compiler.Frontend.Canonical.Ast.encImportLike", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1064"));
  ("Frontend_dCanonical_dAst.v_encInterpPart", ("Vuna.Compiler.Frontend.Canonical.Ast.encInterpPart", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:205"));
  ("Frontend_dCanonical_dAst.v_encMaybeExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.encMaybeExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:69"));
  ("Frontend_dCanonical_dAst.v_encMaybeQty", ("Vuna.Compiler.Frontend.Canonical.Ast.encMaybeQty", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:64"));
  ("Frontend_dCanonical_dAst.v_encModDecl", ("Vuna.Compiler.Frontend.Canonical.Ast.encModDecl", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1047"));
  ("Frontend_dCanonical_dAst.v_encOpacity", ("Vuna.Compiler.Frontend.Canonical.Ast.encOpacity", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1038"));
  ("Frontend_dCanonical_dAst.v_encOpacitySpec", ("Vuna.Compiler.Frontend.Canonical.Ast.encOpacitySpec", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1043"));
  ("Frontend_dCanonical_dAst.v_encPartList", ("Vuna.Compiler.Frontend.Canonical.Ast.encPartList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:133"));
  ("Frontend_dCanonical_dAst.v_encPartListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encPartListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:137"));
  ("Frontend_dCanonical_dAst.v_encPat", ("Vuna.Compiler.Frontend.Canonical.Ast.encPat", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:210"));
  ("Frontend_dCanonical_dAst.v_encPatExprList", ("Vuna.Compiler.Frontend.Canonical.Ast.encPatExprList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:106"));
  ("Frontend_dCanonical_dAst.v_encPatExprListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encPatExprListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:110"));
  ("Frontend_dCanonical_dAst.v_encPatList", ("Vuna.Compiler.Frontend.Canonical.Ast.encPatList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:97"));
  ("Frontend_dCanonical_dAst.v_encPatListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encPatListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:101"));
  ("Frontend_dCanonical_dAst.v_encQty", ("Vuna.Compiler.Frontend.Canonical.Ast.encQty", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:53"));
  ("Frontend_dCanonical_dAst.v_encReprTier", ("Vuna.Compiler.Frontend.Canonical.Ast.encReprTier", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:58"));
  ("Frontend_dCanonical_dAst.v_encSourceFile", ("Vuna.Compiler.Frontend.Canonical.Ast.encSourceFile", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1054"));
  ("Frontend_dCanonical_dAst.v_encStmtList", ("Vuna.Compiler.Frontend.Canonical.Ast.encStmtList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:124"));
  ("Frontend_dCanonical_dAst.v_encStmtListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encStmtListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:128"));
  ("Frontend_dCanonical_dAst.v_encStrExprList", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrExprList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:142"));
  ("Frontend_dCanonical_dAst.v_encStrExprListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrExprListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:146"));
  ("Frontend_dCanonical_dAst.v_encStrList", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:79"));
  ("Frontend_dCanonical_dAst.v_encStrListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:83"));
  ("Frontend_dCanonical_dAst.v_encStrPatList", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrPatList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:151"));
  ("Frontend_dCanonical_dAst.v_encStrPatListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrPatListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:155"));
  ("Frontend_dCanonical_dAst.v_encTraitMethod", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitMethod", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:265"));
  ("Frontend_dCanonical_dAst.v_encTraitMethodList", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitMethodList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:187"));
  ("Frontend_dCanonical_dAst.v_encTraitMethodListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitMethodListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:191"));
  ("Frontend_dCanonical_dAst.v_encTraitParam", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitParam", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:261"));
  ("Frontend_dCanonical_dAst.v_encTraitParamList", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitParamList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:178"));
  ("Frontend_dCanonical_dAst.v_encTraitParamListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitParamListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:182"));
  ("Frontend_dCanonical_dAst.v_noSpan", ("Vuna.Compiler.Frontend.Canonical.Ast.noSpan", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:46"));
  ("Frontend_dCanonical_dPkg.v_contentTag", ("Vuna.Compiler.Frontend.Canonical.Pkg.contentTag", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:43"));
  ("Frontend_dCanonical_dPkg.v_decContentAt", ("Vuna.Compiler.Frontend.Canonical.Pkg.decContentAt", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:90"));
  ("Frontend_dCanonical_dPkg.v_decFile", ("Vuna.Compiler.Frontend.Canonical.Pkg.decFile", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:81"));
  ("Frontend_dCanonical_dPkg.v_decIdentityAt", ("Vuna.Compiler.Frontend.Canonical.Pkg.decIdentityAt", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:106"));
  ("Frontend_dCanonical_dPkg.v_decPackageContent", ("Vuna.Compiler.Frontend.Canonical.Pkg.decPackageContent", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:97"));
  ("Frontend_dCanonical_dPkg.v_decPackageIdentity", ("Vuna.Compiler.Frontend.Canonical.Pkg.decPackageIdentity", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:128"));
  ("Frontend_dCanonical_dPkg.v_decStrPair", ("Vuna.Compiler.Frontend.Canonical.Pkg.decStrPair", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:103"));
  ("Frontend_dCanonical_dPkg.v_encFile", ("Vuna.Compiler.Frontend.Canonical.Pkg.encFile", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:50"));
  ("Frontend_dCanonical_dPkg.v_encFiles", ("Vuna.Compiler.Frontend.Canonical.Pkg.encFiles", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:53"));
  ("Frontend_dCanonical_dPkg.v_encIdentity", ("Vuna.Compiler.Frontend.Canonical.Pkg.encIdentity", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:70"));
  ("Frontend_dCanonical_dPkg.v_encPackageContent", ("Vuna.Compiler.Frontend.Canonical.Pkg.encPackageContent", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:57"));
  ("Frontend_dCanonical_dPkg.v_encPackageIdentity", ("Vuna.Compiler.Frontend.Canonical.Pkg.encPackageIdentity", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:77"));
  ("Frontend_dCanonical_dPkg.v_encStrPair", ("Vuna.Compiler.Frontend.Canonical.Pkg.encStrPair", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:67"));
  ("Frontend_dCanonical_dPkg.v_hashFile", ("Vuna.Compiler.Frontend.Canonical.Pkg.hashFile", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:64"));
  ("Frontend_dCanonical_dPkg.v_identityOfSource", ("Vuna.Compiler.Frontend.Canonical.Pkg.identityOfSource", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:61"));
  ("Frontend_dCanonical_dPkg.v_identityTag", ("Vuna.Compiler.Frontend.Canonical.Pkg.identityTag", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:46"));
  ("Frontend_dCst.v_advanceBy", ("Vuna.Compiler.Frontend.Cst.advanceBy", "Vuna/Compiler/Frontend/Cst.vuna:111"));
  ("Frontend_dCst.v_advanceTo", ("Vuna.Compiler.Frontend.Cst.advanceTo", "Vuna/Compiler/Frontend/Cst.vuna:102"));
  ("Frontend_dCst.v_attachLeaf", ("Vuna.Compiler.Frontend.Cst.attachLeaf", "Vuna/Compiler/Frontend/Cst.vuna:402"));
  ("Frontend_dCst.v_attachLeafTop", ("Vuna.Compiler.Frontend.Cst.attachLeafTop", "Vuna/Compiler/Frontend/Cst.vuna:418"));
  ("Frontend_dCst.v_attachNode", ("Vuna.Compiler.Frontend.Cst.attachNode", "Vuna/Compiler/Frontend/Cst.vuna:431"));
  ("Frontend_dCst.v_buildCst", ("Vuna.Compiler.Frontend.Cst.buildCst", "Vuna/Compiler/Frontend/Cst.vuna:559"));
  ("Frontend_dCst.v_buildFrames", ("Vuna.Compiler.Frontend.Cst.buildFrames", "Vuna/Compiler/Frontend/Cst.vuna:527"));
  ("Frontend_dCst.v_buildTokens", ("Vuna.Compiler.Frontend.Cst.buildTokens", "Vuna/Compiler/Frontend/Cst.vuna:288"));
  ("Frontend_dCst.v_closeAll", ("Vuna.Compiler.Frontend.Cst.closeAll", "Vuna/Compiler/Frontend/Cst.vuna:549"));
  ("Frontend_dCst.v_closeBlocks", ("Vuna.Compiler.Frontend.Cst.closeBlocks", "Vuna/Compiler/Frontend/Cst.vuna:452"));
  ("Frontend_dCst.v_closeDecls", ("Vuna.Compiler.Frontend.Cst.closeDecls", "Vuna/Compiler/Frontend/Cst.vuna:462"));
  ("Frontend_dCst.v_closeFrame", ("Vuna.Compiler.Frontend.Cst.closeFrame", "Vuna/Compiler/Frontend/Cst.vuna:423"));
  ("Frontend_dCst.v_closeTop", ("Vuna.Compiler.Frontend.Cst.closeTop", "Vuna/Compiler/Frontend/Cst.vuna:447"));
  ("Frontend_dCst.v_commentEndPos", ("Vuna.Compiler.Frontend.Cst.commentEndPos", "Vuna/Compiler/Frontend/Cst.vuna:230"));
  ("Frontend_dCst.v_commentStartsAtOrAfter", ("Vuna.Compiler.Frontend.Cst.commentStartsAtOrAfter", "Vuna/Compiler/Frontend/Cst.vuna:258"));
  ("Frontend_dCst.v_commentTrivia", ("Vuna.Compiler.Frontend.Cst.commentTrivia", "Vuna/Compiler/Frontend/Cst.vuna:223"));
  ("Frontend_dCst.v_commentTriviaKind", ("Vuna.Compiler.Frontend.Cst.commentTriviaKind", "Vuna/Compiler/Frontend/Cst.vuna:217"));
  ("Frontend_dCst.v_cstKindTag", ("Vuna.Compiler.Frontend.Cst.cstKindTag", "Vuna/Compiler/Frontend/Cst.vuna:382"));
  ("Frontend_dCst.v_cstTokCount", ("Vuna.Compiler.Frontend.Cst.cstTokCount", "Vuna/Compiler/Frontend/Cst.vuna:571"));
  ("Frontend_dCst.v_curPos", ("Vuna.Compiler.Frontend.Cst.curPos", "Vuna/Compiler/Frontend/Cst.vuna:89"));
  ("Frontend_dCst.v_frameCount", ("Vuna.Compiler.Frontend.Cst.frameCount", "Vuna/Compiler/Frontend/Cst.vuna:488"));
  ("Frontend_dCst.v_gapTrivia", ("Vuna.Compiler.Frontend.Cst.gapTrivia", "Vuna/Compiler/Frontend/Cst.vuna:237"));
  ("Frontend_dCst.v_groupCloseOf", ("Vuna.Compiler.Frontend.Cst.groupCloseOf", "Vuna/Compiler/Frontend/Cst.vuna:512"));
  ("Frontend_dCst.v_isLineStart", ("Vuna.Compiler.Frontend.Cst.isLineStart", "Vuna/Compiler/Frontend/Cst.vuna:523"));
  ("Frontend_dCst.v_isSymText", ("Vuna.Compiler.Frontend.Cst.isSymText", "Vuna/Compiler/Frontend/Cst.vuna:519"));
  ("Frontend_dCst.v_kindIsBlock", ("Vuna.Compiler.Frontend.Cst.kindIsBlock", "Vuna/Compiler/Frontend/Cst.vuna:471"));
  ("Frontend_dCst.v_kindIsDecl", ("Vuna.Compiler.Frontend.Cst.kindIsDecl", "Vuna/Compiler/Frontend/Cst.vuna:475"));
  ("Frontend_dCst.v_kindIsFile", ("Vuna.Compiler.Frontend.Cst.kindIsFile", "Vuna/Compiler/Frontend/Cst.vuna:483"));
  ("Frontend_dCst.v_kindIsGroup", ("Vuna.Compiler.Frontend.Cst.kindIsGroup", "Vuna/Compiler/Frontend/Cst.vuna:479"));
  ("Frontend_dCst.v_layoutStep", ("Vuna.Compiler.Frontend.Cst.layoutStep", "Vuna/Compiler/Frontend/Cst.vuna:494"));
  ("Frontend_dCst.v_lexCst", ("Vuna.Compiler.Frontend.Cst.lexCst", "Vuna/Compiler/Frontend/Cst.vuna:303"));
  ("Frontend_dCst.v_lexCstGo", ("Vuna.Compiler.Frontend.Cst.lexCstGo", "Vuna/Compiler/Frontend/Cst.vuna:306"));
  ("Frontend_dCst.v_lineCurStart", ("Vuna.Compiler.Frontend.Cst.lineCurStart", "Vuna/Compiler/Frontend/Cst.vuna:86"));
  ("Frontend_dCst.v_nodeChildren", ("Vuna.Compiler.Frontend.Cst.nodeChildren", "Vuna/Compiler/Frontend/Cst.vuna:367"));
  ("Frontend_dCst.v_nodeKind", ("Vuna.Compiler.Frontend.Cst.nodeKind", "Vuna/Compiler/Frontend/Cst.vuna:362"));
  ("Frontend_dCst.v_nodeKindTag", ("Vuna.Compiler.Frontend.Cst.nodeKindTag", "Vuna/Compiler/Frontend/Cst.vuna:378"));
  ("Frontend_dCst.v_nodeSpan", ("Vuna.Compiler.Frontend.Cst.nodeSpan", "Vuna/Compiler/Frontend/Cst.vuna:357"));
  ("Frontend_dCst.v_nodeToken", ("Vuna.Compiler.Frontend.Cst.nodeToken", "Vuna/Compiler/Frontend/Cst.vuna:372"));
  ("Frontend_dCst.v_renderCst", ("Vuna.Compiler.Frontend.Cst.renderCst", "Vuna/Compiler/Frontend/Cst.vuna:325"));
  ("Frontend_dCst.v_renderCstTree", ("Vuna.Compiler.Frontend.Cst.renderCstTree", "Vuna/Compiler/Frontend/Cst.vuna:576"));
  ("Frontend_dCst.v_renderParts", ("Vuna.Compiler.Frontend.Cst.renderParts", "Vuna/Compiler/Frontend/Cst.vuna:321"));
  ("Frontend_dCst.v_roundtripOk", ("Vuna.Compiler.Frontend.Cst.roundtripOk", "Vuna/Compiler/Frontend/Cst.vuna:329"));
  ("Frontend_dCst.v_scanDigitsEnd", ("Vuna.Compiler.Frontend.Cst.scanDigitsEnd", "Vuna/Compiler/Frontend/Cst.vuna:127"));
  ("Frontend_dCst.v_scanStringEnd", ("Vuna.Compiler.Frontend.Cst.scanStringEnd", "Vuna/Compiler/Frontend/Cst.vuna:133"));
  ("Frontend_dCst.v_sliceText", ("Vuna.Compiler.Frontend.Cst.sliceText", "Vuna/Compiler/Frontend/Cst.vuna:120"));
  ("Frontend_dCst.v_spaceTrivia", ("Vuna.Compiler.Frontend.Cst.spaceTrivia", "Vuna/Compiler/Frontend/Cst.vuna:203"));
  ("Frontend_dCst.v_spanEndOf", ("Vuna.Compiler.Frontend.Cst.spanEndOf", "Vuna/Compiler/Frontend/Cst.vuna:199"));
  ("Frontend_dCst.v_spanStartOf", ("Vuna.Compiler.Frontend.Cst.spanStartOf", "Vuna/Compiler/Frontend/Cst.vuna:196"));
  ("Frontend_dCst.v_stepCur", ("Vuna.Compiler.Frontend.Cst.stepCur", "Vuna/Compiler/Frontend/Cst.vuna:93"));
  ("Frontend_dCst.v_takeCommentsBefore", ("Vuna.Compiler.Frontend.Cst.takeCommentsBefore", "Vuna/Compiler/Frontend/Cst.vuna:247"));
  ("Frontend_dCst.v_toTrivComments", ("Vuna.Compiler.Frontend.Cst.toTrivComments", "Vuna/Compiler/Frontend/Cst.vuna:185"));
  ("Frontend_dCst.v_tokTag", ("Vuna.Compiler.Frontend.Cst.tokTag", "Vuna/Compiler/Frontend/Cst.vuna:142"));
  ("Frontend_dCst.v_tokText", ("Vuna.Compiler.Frontend.Cst.tokText", "Vuna/Compiler/Frontend/Cst.vuna:154"));
  ("Frontend_dCst.v_tokenNode", ("Vuna.Compiler.Frontend.Cst.tokenNode", "Vuna/Compiler/Frontend/Cst.vuna:266"));
  ("Frontend_dCst.v_treeRoundtripOk", ("Vuna.Compiler.Frontend.Cst.treeRoundtripOk", "Vuna/Compiler/Frontend/Cst.vuna:581"));
  ("Frontend_dCst.v_triviaTextOf", ("Vuna.Compiler.Frontend.Cst.triviaTextOf", "Vuna/Compiler/Frontend/Cst.vuna:317"));
  ("Frontend_dLexer.v_advanceChar", ("Vuna.Compiler.Frontend.Lexer.advanceChar", "Vuna/Compiler/Frontend/Lexer.vuna:99"));
  ("Frontend_dLexer.v_charsEmpty", ("Vuna.Compiler.Frontend.Lexer.charsEmpty", "Vuna/Compiler/Frontend/Lexer.vuna:61"));
  ("Frontend_dLexer.v_charsNext", ("Vuna.Compiler.Frontend.Lexer.charsNext", "Vuna/Compiler/Frontend/Lexer.vuna:75"));
  ("Frontend_dLexer.v_charsNext2", ("Vuna.Compiler.Frontend.Lexer.charsNext2", "Vuna/Compiler/Frontend/Lexer.vuna:79"));
  ("Frontend_dLexer.v_charsOffset", ("Vuna.Compiler.Frontend.Lexer.charsOffset", "Vuna/Compiler/Frontend/Lexer.vuna:54"));
  ("Frontend_dLexer.v_charsPeek", ("Vuna.Compiler.Frontend.Lexer.charsPeek", "Vuna/Compiler/Frontend/Lexer.vuna:64"));
  ("Frontend_dLexer.v_charsPeekAt", ("Vuna.Compiler.Frontend.Lexer.charsPeekAt", "Vuna/Compiler/Frontend/Lexer.vuna:67"));
  ("Frontend_dLexer.v_charsPos", ("Vuna.Compiler.Frontend.Lexer.charsPos", "Vuna/Compiler/Frontend/Lexer.vuna:57"));
  ("Frontend_dLexer.v_charsPos2", ("Vuna.Compiler.Frontend.Lexer.charsPos2", "Vuna/Compiler/Frontend/Lexer.vuna:83"));
  ("Frontend_dLexer.v_charsSource", ("Vuna.Compiler.Frontend.Lexer.charsSource", "Vuna/Compiler/Frontend/Lexer.vuna:51"));
  ("Frontend_dLexer.v_charsStep", ("Vuna.Compiler.Frontend.Lexer.charsStep", "Vuna/Compiler/Frontend/Lexer.vuna:71"));
  ("Frontend_dLexer.v_classifyIdent", ("Vuna.Compiler.Frontend.Lexer.classifyIdent", "Vuna/Compiler/Frontend/Lexer.vuna:202"));
  ("Frontend_dLexer.v_collectBlockBody", ("Vuna.Compiler.Frontend.Lexer.collectBlockBody", "Vuna/Compiler/Frontend/Lexer.vuna:241"));
  ("Frontend_dLexer.v_collectFloat", ("Vuna.Compiler.Frontend.Lexer.collectFloat", "Vuna/Compiler/Frontend/Lexer.vuna:435"));
  ("Frontend_dLexer.v_collectFrac", ("Vuna.Compiler.Frontend.Lexer.collectFrac", "Vuna/Compiler/Frontend/Lexer.vuna:447"));
  ("Frontend_dLexer.v_collectIdent", ("Vuna.Compiler.Frontend.Lexer.collectIdent", "Vuna/Compiler/Frontend/Lexer.vuna:382"));
  ("Frontend_dLexer.v_collectInt", ("Vuna.Compiler.Frontend.Lexer.collectInt", "Vuna/Compiler/Frontend/Lexer.vuna:400"));
  ("Frontend_dLexer.v_collectInternalIdent", ("Vuna.Compiler.Frontend.Lexer.collectInternalIdent", "Vuna/Compiler/Frontend/Lexer.vuna:371"));
  ("Frontend_dLexer.v_collectLineBody", ("Vuna.Compiler.Frontend.Lexer.collectLineBody", "Vuna/Compiler/Frontend/Lexer.vuna:229"));
  ("Frontend_dLexer.v_collectOp", ("Vuna.Compiler.Frontend.Lexer.collectOp", "Vuna/Compiler/Frontend/Lexer.vuna:458"));
  ("Frontend_dLexer.v_commentSpan", ("Vuna.Compiler.Frontend.Lexer.commentSpan", "Vuna/Compiler/Frontend/Lexer.vuna:217"));
  ("Frontend_dLexer.v_commentSpanOf", ("Vuna.Compiler.Frontend.Lexer.commentSpanOf", "Vuna/Compiler/Frontend/Lexer.vuna:278"));
  ("Frontend_dLexer.v_decodeEscape", ("Vuna.Compiler.Frontend.Lexer.decodeEscape", "Vuna/Compiler/Frontend/Lexer.vuna:481"));
  ("Frontend_dLexer.v_depthAfter", ("Vuna.Compiler.Frontend.Lexer.depthAfter", "Vuna/Compiler/Frontend/Lexer.vuna:566"));
  ("Frontend_dLexer.v_digitRunIsFloat", ("Vuna.Compiler.Frontend.Lexer.digitRunIsFloat", "Vuna/Compiler/Frontend/Lexer.vuna:422"));
  ("Frontend_dLexer.v_dropOpeningNewline", ("Vuna.Compiler.Frontend.Lexer.dropOpeningNewline", "Vuna/Compiler/Frontend/Lexer.vuna:491"));
  ("Frontend_dLexer.v_dropTrailingSpace", ("Vuna.Compiler.Frontend.Lexer.dropTrailingSpace", "Vuna/Compiler/Frontend/Lexer.vuna:223"));
  ("Frontend_dLexer.v_flushText", ("Vuna.Compiler.Frontend.Lexer.flushText", "Vuna/Compiler/Frontend/Lexer.vuna:500"));
  ("Frontend_dLexer.v_isDigit", ("Vuna.Compiler.Frontend.Lexer.isDigit", "Vuna/Compiler/Frontend/Lexer.vuna:115"));
  ("Frontend_dLexer.v_isIdentChar", ("Vuna.Compiler.Frontend.Lexer.isIdentChar", "Vuna/Compiler/Frontend/Lexer.vuna:112"));
  ("Frontend_dLexer.v_isIdentStart", ("Vuna.Compiler.Frontend.Lexer.isIdentStart", "Vuna/Compiler/Frontend/Lexer.vuna:109"));
  ("Frontend_dLexer.v_isKeyword", ("Vuna.Compiler.Frontend.Lexer.isKeyword", "Vuna/Compiler/Frontend/Lexer.vuna:151"));
  ("Frontend_dLexer.v_isLowerChar", ("Vuna.Compiler.Frontend.Lexer.isLowerChar", "Vuna/Compiler/Frontend/Lexer.vuna:106"));
  ("Frontend_dLexer.v_isOpChar", ("Vuna.Compiler.Frontend.Lexer.isOpChar", "Vuna/Compiler/Frontend/Lexer.vuna:121"));
  ("Frontend_dLexer.v_isSpace", ("Vuna.Compiler.Frontend.Lexer.isSpace", "Vuna/Compiler/Frontend/Lexer.vuna:118"));
  ("Frontend_dLexer.v_isUpperChar", ("Vuna.Compiler.Frontend.Lexer.isUpperChar", "Vuna/Compiler/Frontend/Lexer.vuna:103"));
  ("Frontend_dLexer.v_lexChars", ("Vuna.Compiler.Frontend.Lexer.lexChars", "Vuna/Compiler/Frontend/Lexer.vuna:673"));
  ("Frontend_dLexer.v_lexCharsRev", ("Vuna.Compiler.Frontend.Lexer.lexCharsRev", "Vuna/Compiler/Frontend/Lexer.vuna:679"));
  ("Frontend_dLexer.v_lexCharsWith", ("Vuna.Compiler.Frontend.Lexer.lexCharsWith", "Vuna/Compiler/Frontend/Lexer.vuna:650"));
  ("Frontend_dLexer.v_lexCharsWithRev", ("Vuna.Compiler.Frontend.Lexer.lexCharsWithRev", "Vuna/Compiler/Frontend/Lexer.vuna:656"));
  ("Frontend_dLexer.v_lexComments", ("Vuna.Compiler.Frontend.Lexer.lexComments", "Vuna/Compiler/Frontend/Lexer.vuna:702"));
  ("Frontend_dLexer.v_lexHoleTokens", ("Vuna.Compiler.Frontend.Lexer.lexHoleTokens", "Vuna/Compiler/Frontend/Lexer.vuna:547"));
  ("Frontend_dLexer.v_lexOneToken", ("Vuna.Compiler.Frontend.Lexer.lexOneToken", "Vuna/Compiler/Frontend/Lexer.vuna:572"));
  ("Frontend_dLexer.v_lexSingleStringToken", ("Vuna.Compiler.Frontend.Lexer.lexSingleStringToken", "Vuna/Compiler/Frontend/Lexer.vuna:630"));
  ("Frontend_dLexer.v_lexSource", ("Vuna.Compiler.Frontend.Lexer.lexSource", "Vuna/Compiler/Frontend/Lexer.vuna:699"));
  ("Frontend_dLexer.v_lexSourceWithComments", ("Vuna.Compiler.Frontend.Lexer.lexSourceWithComments", "Vuna/Compiler/Frontend/Lexer.vuna:696"));
  ("Frontend_dLexer.v_lexSpanAt", ("Vuna.Compiler.Frontend.Lexer.lexSpanAt", "Vuna/Compiler/Frontend/Lexer.vuna:96"));
  ("Frontend_dLexer.v_lexStringToken", ("Vuna.Compiler.Frontend.Lexer.lexStringToken", "Vuna/Compiler/Frontend/Lexer.vuna:619"));
  ("Frontend_dLexer.v_maxIntLiteral", ("Vuna.Compiler.Frontend.Lexer.maxIntLiteral", "Vuna/Compiler/Frontend/Lexer.vuna:395"));
  ("Frontend_dLexer.v_posWithEnd", ("Vuna.Compiler.Frontend.Lexer.posWithEnd", "Vuna/Compiler/Frontend/Lexer.vuna:93"));
  ("Frontend_dLexer.v_scanTemplateText", ("Vuna.Compiler.Frontend.Lexer.scanTemplateText", "Vuna/Compiler/Frontend/Lexer.vuna:507"));
  ("Frontend_dLexer.v_setTokEnd", ("Vuna.Compiler.Frontend.Lexer.setTokEnd", "Vuna/Compiler/Frontend/Lexer.vuna:89"));
  ("Frontend_dLexer.v_skipBlockComment", ("Vuna.Compiler.Frontend.Lexer.skipBlockComment", "Vuna/Compiler/Frontend/Lexer.vuna:266"));
  ("Frontend_dLexer.v_skipLineComment", ("Vuna.Compiler.Frontend.Lexer.skipLineComment", "Vuna/Compiler/Frontend/Lexer.vuna:254"));
  ("Frontend_dLexer.v_skipTrivia", ("Vuna.Compiler.Frontend.Lexer.skipTrivia", "Vuna/Compiler/Frontend/Lexer.vuna:304"));
  ("Frontend_dLexer.v_skipTriviaComments", ("Vuna.Compiler.Frontend.Lexer.skipTriviaComments", "Vuna/Compiler/Frontend/Lexer.vuna:330"));
  ("Frontend_dLexer.v_skipTriviaCommentsGo", ("Vuna.Compiler.Frontend.Lexer.skipTriviaCommentsGo", "Vuna/Compiler/Frontend/Lexer.vuna:333"));
  ("Frontend_dLexer.v_sourceFuel", ("Vuna.Compiler.Frontend.Lexer.sourceFuel", "Vuna/Compiler/Frontend/Lexer.vuna:714"));
  ("Frontend_dLexer.v_startsWithVunaAt", ("Vuna.Compiler.Frontend.Lexer.startsWithVunaAt", "Vuna/Compiler/Frontend/Lexer.vuna:364"));
  ("Frontend_dLexer.v_trimTrailingSpace", ("Vuna.Compiler.Frontend.Lexer.trimTrailingSpace", "Vuna/Compiler/Frontend/Lexer.vuna:220"));
  ("Frontend_dManifest.v_allHex", ("Vuna.Compiler.Frontend.Manifest.allHex", "Vuna/Compiler/Frontend/Manifest.vuna:431"));
  ("Frontend_dManifest.v_applyDepEntry", ("Vuna.Compiler.Frontend.Manifest.applyDepEntry", "Vuna/Compiler/Frontend/Manifest.vuna:319"));
  ("Frontend_dManifest.v_atLine", ("Vuna.Compiler.Frontend.Manifest.atLine", "Vuna/Compiler/Frontend/Manifest.vuna:101"));
  ("Frontend_dManifest.v_boolField", ("Vuna.Compiler.Frontend.Manifest.boolField", "Vuna/Compiler/Frontend/Manifest.vuna:149"));
  ("Frontend_dManifest.v_buildDependency", ("Vuna.Compiler.Frontend.Manifest.buildDependency", "Vuna/Compiler/Frontend/Manifest.vuna:371"));
  ("Frontend_dManifest.v_buildManifest", ("Vuna.Compiler.Frontend.Manifest.buildManifest", "Vuna/Compiler/Frontend/Manifest.vuna:528"));
  ("Frontend_dManifest.v_buildTables", ("Vuna.Compiler.Frontend.Manifest.buildTables", "Vuna/Compiler/Frontend/Manifest.vuna:406"));
  ("Frontend_dManifest.v_checkEntries", ("Vuna.Compiler.Frontend.Manifest.checkEntries", "Vuna/Compiler/Frontend/Manifest.vuna:275"));
  ("Frontend_dManifest.v_checkHashForm", ("Vuna.Compiler.Frontend.Manifest.checkHashForm", "Vuna/Compiler/Frontend/Manifest.vuna:443"));
  ("Frontend_dManifest.v_checkIdentityForm", ("Vuna.Compiler.Frontend.Manifest.checkIdentityForm", "Vuna/Compiler/Frontend/Manifest.vuna:448"));
  ("Frontend_dManifest.v_checkOneEntry", ("Vuna.Compiler.Frontend.Manifest.checkOneEntry", "Vuna/Compiler/Frontend/Manifest.vuna:257"));
  ("Frontend_dManifest.v_checkRootSections", ("Vuna.Compiler.Frontend.Manifest.checkRootSections", "Vuna/Compiler/Frontend/Manifest.vuna:520"));
  ("Frontend_dManifest.v_collectDependencies", ("Vuna.Compiler.Frontend.Manifest.collectDependencies", "Vuna/Compiler/Frontend/Manifest.vuna:413"));
  ("Frontend_dManifest.v_collectLayers", ("Vuna.Compiler.Frontend.Manifest.collectLayers", "Vuna/Compiler/Frontend/Manifest.vuna:171"));
  ("Frontend_dManifest.v_collectStrings", ("Vuna.Compiler.Frontend.Manifest.collectStrings", "Vuna/Compiler/Frontend/Manifest.vuna:360"));
  ("Frontend_dManifest.v_collectTables", ("Vuna.Compiler.Frontend.Manifest.collectTables", "Vuna/Compiler/Frontend/Manifest.vuna:349"));
  ("Frontend_dManifest.v_depAliasOf", ("Vuna.Compiler.Frontend.Manifest.depAliasOf", "Vuna/Compiler/Frontend/Manifest.vuna:41"));
  ("Frontend_dManifest.v_depAliasOfSection", ("Vuna.Compiler.Frontend.Manifest.depAliasOfSection", "Vuna/Compiler/Frontend/Manifest.vuna:247"));
  ("Frontend_dManifest.v_depHashOf", ("Vuna.Compiler.Frontend.Manifest.depHashOf", "Vuna/Compiler/Frontend/Manifest.vuna:47"));
  ("Frontend_dManifest.v_depIdentityOf", ("Vuna.Compiler.Frontend.Manifest.depIdentityOf", "Vuna/Compiler/Frontend/Manifest.vuna:50"));
  ("Frontend_dManifest.v_depSourceOf", ("Vuna.Compiler.Frontend.Manifest.depSourceOf", "Vuna/Compiler/Frontend/Manifest.vuna:44"));
  ("Frontend_dManifest.v_dirFromRev", ("Vuna.Compiler.Frontend.Manifest.dirFromRev", "Vuna/Compiler/Frontend/Manifest.vuna:626"));
  ("Frontend_dManifest.v_dirResult", ("Vuna.Compiler.Frontend.Manifest.dirResult", "Vuna/Compiler/Frontend/Manifest.vuna:630"));
  ("Frontend_dManifest.v_emptyDepAcc", ("Vuna.Compiler.Frontend.Manifest.emptyDepAcc", "Vuna/Compiler/Frontend/Manifest.vuna:88"));
  ("Frontend_dManifest.v_ensureAcc", ("Vuna.Compiler.Frontend.Manifest.ensureAcc", "Vuna/Compiler/Frontend/Manifest.vuna:288"));
  ("Frontend_dManifest.v_fieldLine", ("Vuna.Compiler.Frontend.Manifest.fieldLine", "Vuna/Compiler/Frontend/Manifest.vuna:112"));
  ("Frontend_dManifest.v_fieldLoc", ("Vuna.Compiler.Frontend.Manifest.fieldLoc", "Vuna/Compiler/Frontend/Manifest.vuna:118"));
  ("Frontend_dManifest.v_hasAcc", ("Vuna.Compiler.Frontend.Manifest.hasAcc", "Vuna/Compiler/Frontend/Manifest.vuna:284"));
  ("Frontend_dManifest.v_intField", ("Vuna.Compiler.Frontend.Manifest.intField", "Vuna/Compiler/Frontend/Manifest.vuna:142"));
  ("Frontend_dManifest.v_isDepSourceKey", ("Vuna.Compiler.Frontend.Manifest.isDepSourceKey", "Vuna/Compiler/Frontend/Manifest.vuna:251"));
  ("Frontend_dManifest.v_isDepTableSection", ("Vuna.Compiler.Frontend.Manifest.isDepTableSection", "Vuna/Compiler/Frontend/Manifest.vuna:237"));
  ("Frontend_dManifest.v_isDigitChar", ("Vuna.Compiler.Frontend.Manifest.isDigitChar", "Vuna/Compiler/Frontend/Manifest.vuna:92"));
  ("Frontend_dManifest.v_isHexChar", ("Vuna.Compiler.Frontend.Manifest.isHexChar", "Vuna/Compiler/Frontend/Manifest.vuna:428"));
  ("Frontend_dManifest.v_isLayersSection", ("Vuna.Compiler.Frontend.Manifest.isLayersSection", "Vuna/Compiler/Frontend/Manifest.vuna:163"));
  ("Frontend_dManifest.v_isLintSection", ("Vuna.Compiler.Frontend.Manifest.isLintSection", "Vuna/Compiler/Frontend/Manifest.vuna:243"));
  ("Frontend_dManifest.v_isLowerAlphaChar", ("Vuna.Compiler.Frontend.Manifest.isLowerAlphaChar", "Vuna/Compiler/Frontend/Manifest.vuna:98"));
  ("Frontend_dManifest.v_isUpperAlphaChar", ("Vuna.Compiler.Frontend.Manifest.isUpperAlphaChar", "Vuna/Compiler/Frontend/Manifest.vuna:95"));
  ("Frontend_dManifest.v_layerHasCycle", ("Vuna.Compiler.Frontend.Manifest.layerHasCycle", "Vuna/Compiler/Frontend/Manifest.vuna:209"));
  ("Frontend_dManifest.v_layerSeen", ("Vuna.Compiler.Frontend.Manifest.layerSeen", "Vuna/Compiler/Frontend/Manifest.vuna:167"));
  ("Frontend_dManifest.v_layerUsesOf", ("Vuna.Compiler.Frontend.Manifest.layerUsesOf", "Vuna/Compiler/Frontend/Manifest.vuna:187"));
  ("Frontend_dManifest.v_layerUsesTotal", ("Vuna.Compiler.Frontend.Manifest.layerUsesTotal", "Vuna/Compiler/Frontend/Manifest.vuna:205"));
  ("Frontend_dManifest.v_layerVisitBound", ("Vuna.Compiler.Frontend.Manifest.layerVisitBound", "Vuna/Compiler/Frontend/Manifest.vuna:202"));
  ("Frontend_dManifest.v_manifestDir", ("Vuna.Compiler.Frontend.Manifest.manifestDir", "Vuna/Compiler/Frontend/Manifest.vuna:623"));
  ("Frontend_dManifest.v_manifestErr", ("Vuna.Compiler.Frontend.Manifest.manifestErr", "Vuna/Compiler/Frontend/Manifest.vuna:104"));
  ("Frontend_dManifest.v_mapAcc", ("Vuna.Compiler.Frontend.Manifest.mapAcc", "Vuna/Compiler/Frontend/Manifest.vuna:291"));
  ("Frontend_dManifest.v_orEmptyList", ("Vuna.Compiler.Frontend.Manifest.orEmptyList", "Vuna/Compiler/Frontend/Manifest.vuna:156"));
  ("Frontend_dManifest.v_orFalse", ("Vuna.Compiler.Frontend.Manifest.orFalse", "Vuna/Compiler/Frontend/Manifest.vuna:232"));
  ("Frontend_dManifest.v_parseManifest", ("Vuna.Compiler.Frontend.Manifest.parseManifest", "Vuna/Compiler/Frontend/Manifest.vuna:550"));
  ("Frontend_dManifest.v_reachesFrom", ("Vuna.Compiler.Frontend.Manifest.reachesFrom", "Vuna/Compiler/Frontend/Manifest.vuna:191"));
  ("Frontend_dManifest.v_resolveManifestPath", ("Vuna.Compiler.Frontend.Manifest.resolveManifestPath", "Vuna/Compiler/Frontend/Manifest.vuna:634"));
  ("Frontend_dManifest.v_sameSection", ("Vuna.Compiler.Frontend.Manifest.sameSection", "Vuna/Compiler/Frontend/Manifest.vuna:107"));
  ("Frontend_dManifest.v_sectionPresent", ("Vuna.Compiler.Frontend.Manifest.sectionPresent", "Vuna/Compiler/Frontend/Manifest.vuna:500"));
  ("Frontend_dManifest.v_setAccGit", ("Vuna.Compiler.Frontend.Manifest.setAccGit", "Vuna/Compiler/Frontend/Manifest.vuna:299"));
  ("Frontend_dManifest.v_setAccHash", ("Vuna.Compiler.Frontend.Manifest.setAccHash", "Vuna/Compiler/Frontend/Manifest.vuna:308"));
  ("Frontend_dManifest.v_setAccIdentity", ("Vuna.Compiler.Frontend.Manifest.setAccIdentity", "Vuna/Compiler/Frontend/Manifest.vuna:311"));
  ("Frontend_dManifest.v_setAccPath", ("Vuna.Compiler.Frontend.Manifest.setAccPath", "Vuna/Compiler/Frontend/Manifest.vuna:296"));
  ("Frontend_dManifest.v_setAccRev", ("Vuna.Compiler.Frontend.Manifest.setAccRev", "Vuna/Compiler/Frontend/Manifest.vuna:302"));
  ("Frontend_dManifest.v_setAccUrl", ("Vuna.Compiler.Frontend.Manifest.setAccUrl", "Vuna/Compiler/Frontend/Manifest.vuna:305"));
  ("Frontend_dManifest.v_startsWithSection", ("Vuna.Compiler.Frontend.Manifest.startsWithSection", "Vuna/Compiler/Frontend/Manifest.vuna:505"));
  ("Frontend_dManifest.v_stringField", ("Vuna.Compiler.Frontend.Manifest.stringField", "Vuna/Compiler/Frontend/Manifest.vuna:124"));
  ("Frontend_dManifest.v_stringListField", ("Vuna.Compiler.Frontend.Manifest.stringListField", "Vuna/Compiler/Frontend/Manifest.vuna:131"));
  ("Frontend_dManifest.v_stringValueOf", ("Vuna.Compiler.Frontend.Manifest.stringValueOf", "Vuna/Compiler/Frontend/Manifest.vuna:314"));
  ("Frontend_dManifest.v_validHashText", ("Vuna.Compiler.Frontend.Manifest.validHashText", "Vuna/Compiler/Frontend/Manifest.vuna:436"));
  ("Frontend_dManifest.v_validModuleName", ("Vuna.Compiler.Frontend.Manifest.validModuleName", "Vuna/Compiler/Frontend/Manifest.vuna:565"));
  ("Frontend_dManifest.v_validModuleSegment", ("Vuna.Compiler.Frontend.Manifest.validModuleSegment", "Vuna/Compiler/Frontend/Manifest.vuna:572"));
  ("Frontend_dManifest.v_validModuleSegmentChars", ("Vuna.Compiler.Frontend.Manifest.validModuleSegmentChars", "Vuna/Compiler/Frontend/Manifest.vuna:575"));
  ("Frontend_dManifest.v_validModuleSegments", ("Vuna.Compiler.Frontend.Manifest.validModuleSegments", "Vuna/Compiler/Frontend/Manifest.vuna:568"));
  ("Frontend_dManifest.v_validModuleTail", ("Vuna.Compiler.Frontend.Manifest.validModuleTail", "Vuna/Compiler/Frontend/Manifest.vuna:579"));
  ("Frontend_dManifest.v_validPackageChars", ("Vuna.Compiler.Frontend.Manifest.validPackageChars", "Vuna/Compiler/Frontend/Manifest.vuna:560"));
  ("Frontend_dManifest.v_validPackageName", ("Vuna.Compiler.Frontend.Manifest.validPackageName", "Vuna/Compiler/Frontend/Manifest.vuna:557"));
  ("Frontend_dManifest.v_validateDependencies", ("Vuna.Compiler.Frontend.Manifest.validateDependencies", "Vuna/Compiler/Frontend/Manifest.vuna:482"));
  ("Frontend_dManifest.v_validateDependency", ("Vuna.Compiler.Frontend.Manifest.validateDependency", "Vuna/Compiler/Frontend/Manifest.vuna:453"));
  ("Frontend_dManifest.v_validateDepsSeen", ("Vuna.Compiler.Frontend.Manifest.validateDepsSeen", "Vuna/Compiler/Frontend/Manifest.vuna:472"));
  ("Frontend_dManifest.v_validateDiagFormat", ("Vuna.Compiler.Frontend.Manifest.validateDiagFormat", "Vuna/Compiler/Frontend/Manifest.vuna:486"));
  ("Frontend_dManifest.v_validateDiagLang", ("Vuna.Compiler.Frontend.Manifest.validateDiagLang", "Vuna/Compiler/Frontend/Manifest.vuna:641"));
  ("Frontend_dManifest.v_validateDiagMax", ("Vuna.Compiler.Frontend.Manifest.validateDiagMax", "Vuna/Compiler/Frontend/Manifest.vuna:494"));
  ("Frontend_dManifest.v_validateExports", ("Vuna.Compiler.Frontend.Manifest.validateExports", "Vuna/Compiler/Frontend/Manifest.vuna:607"));
  ("Frontend_dManifest.v_validateLayerTargets", ("Vuna.Compiler.Frontend.Manifest.validateLayerTargets", "Vuna/Compiler/Frontend/Manifest.vuna:223"));
  ("Frontend_dManifest.v_validateLayers", ("Vuna.Compiler.Frontend.Manifest.validateLayers", "Vuna/Compiler/Frontend/Manifest.vuna:213"));
  ("Frontend_dManifest.v_validateManifest", ("Vuna.Compiler.Frontend.Manifest.validateManifest", "Vuna/Compiler/Frontend/Manifest.vuna:611"));
  ("Frontend_dManifest.v_validateMembers", ("Vuna.Compiler.Frontend.Manifest.validateMembers", "Vuna/Compiler/Frontend/Manifest.vuna:597"));
  ("Frontend_dManifest.v_validateModules", ("Vuna.Compiler.Frontend.Manifest.validateModules", "Vuna/Compiler/Frontend/Manifest.vuna:602"));
  ("Frontend_dManifest.v_validateName", ("Vuna.Compiler.Frontend.Manifest.validateName", "Vuna/Compiler/Frontend/Manifest.vuna:589"));
  ("Frontend_dManifest.v_validateRootShape", ("Vuna.Compiler.Frontend.Manifest.validateRootShape", "Vuna/Compiler/Frontend/Manifest.vuna:510"));
  ("Frontend_dPackages_dPkg.v_absolutePath", ("Vuna.Compiler.Frontend.Packages.Pkg.absolutePath", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:159"));
  ("Frontend_dPackages_dPkg.v_baseCandidates", ("Vuna.Compiler.Frontend.Packages.Pkg.baseCandidates", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:644"));
  ("Frontend_dPackages_dPkg.v_baseNotFound", ("Vuna.Compiler.Frontend.Packages.Pkg.baseNotFound", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:653"));
  ("Frontend_dPackages_dPkg.v_baseOnlyContext", ("Vuna.Compiler.Frontend.Packages.Pkg.baseOnlyContext", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:686"));
  ("Frontend_dPackages_dPkg.v_checkUniqueNamesGo", ("Vuna.Compiler.Frontend.Packages.Pkg.checkUniqueNamesGo", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:410"));
  ("Frontend_dPackages_dPkg.v_checkUniquePackageNames", ("Vuna.Compiler.Frontend.Packages.Pkg.checkUniquePackageNames", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:421"));
  ("Frontend_dPackages_dPkg.v_collectDependencyIds", ("Vuna.Compiler.Frontend.Packages.Pkg.collectDependencyIds", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:400"));
  ("Frontend_dPackages_dPkg.v_collectPackageIds", ("Vuna.Compiler.Frontend.Packages.Pkg.collectPackageIds", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:395"));
  ("Frontend_dPackages_dPkg.v_contextAt", ("Vuna.Compiler.Frontend.Packages.Pkg.contextAt", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:699"));
  ("Frontend_dPackages_dPkg.v_contextDir", ("Vuna.Compiler.Frontend.Packages.Pkg.contextDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:77"));
  ("Frontend_dPackages_dPkg.v_contextForDir", ("Vuna.Compiler.Frontend.Packages.Pkg.contextForDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:744"));
  ("Frontend_dPackages_dPkg.v_contextForFile", ("Vuna.Compiler.Frontend.Packages.Pkg.contextForFile", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:735"));
  ("Frontend_dPackages_dPkg.v_contextPackageName", ("Vuna.Compiler.Frontend.Packages.Pkg.contextPackageName", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:87"));
  ("Frontend_dPackages_dPkg.v_contextPackageOf", ("Vuna.Compiler.Frontend.Packages.Pkg.contextPackageOf", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:84"));
  ("Frontend_dPackages_dPkg.v_contextRelease", ("Vuna.Compiler.Frontend.Packages.Pkg.contextRelease", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:91"));
  ("Frontend_dPackages_dPkg.v_contextRoots", ("Vuna.Compiler.Frontend.Packages.Pkg.contextRoots", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:80"));
  ("Frontend_dPackages_dPkg.v_contextWithRelease", ("Vuna.Compiler.Frontend.Packages.Pkg.contextWithRelease", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:95"));
  ("Frontend_dPackages_dPkg.v_cycleMessage", ("Vuna.Compiler.Frontend.Packages.Pkg.cycleMessage", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:219"));
  ("Frontend_dPackages_dPkg.v_cyclePrefix", ("Vuna.Compiler.Frontend.Packages.Pkg.cyclePrefix", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:209"));
  ("Frontend_dPackages_dPkg.v_dependencyNameOk", ("Vuna.Compiler.Frontend.Packages.Pkg.dependencyNameOk", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:227"));
  ("Frontend_dPackages_dPkg.v_dependencyRootOf", ("Vuna.Compiler.Frontend.Packages.Pkg.dependencyRootOf", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:551"));
  ("Frontend_dPackages_dPkg.v_dependencyRoots", ("Vuna.Compiler.Frontend.Packages.Pkg.dependencyRoots", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:563"));
  ("Frontend_dPackages_dPkg.v_findManifestDir", ("Vuna.Compiler.Frontend.Packages.Pkg.findManifestDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:627"));
  ("Frontend_dPackages_dPkg.v_findManifestDirMaybe", ("Vuna.Compiler.Frontend.Packages.Pkg.findManifestDirMaybe", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:619"));
  ("Frontend_dPackages_dPkg.v_findManifestUpMaybe", ("Vuna.Compiler.Frontend.Packages.Pkg.findManifestUpMaybe", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:599"));
  ("Frontend_dPackages_dPkg.v_findManifestUpMaybeStep", ("Vuna.Compiler.Frontend.Packages.Pkg.findManifestUpMaybeStep", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:608"));
  ("Frontend_dPackages_dPkg.v_firstExistingBase", ("Vuna.Compiler.Frontend.Packages.Pkg.firstExistingBase", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:656"));
  ("Frontend_dPackages_dPkg.v_hasManifest", ("Vuna.Compiler.Frontend.Packages.Pkg.hasManifest", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:641"));
  ("Frontend_dPackages_dPkg.v_joinPath", ("Vuna.Compiler.Frontend.Packages.Pkg.joinPath", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:169"));
  ("Frontend_dPackages_dPkg.v_joinPathsText", ("Vuna.Compiler.Frontend.Packages.Pkg.joinPathsText", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:172"));
  ("Frontend_dPackages_dPkg.v_loadDependencyList", ("Vuna.Compiler.Frontend.Packages.Pkg.loadDependencyList", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:311"));
  ("Frontend_dPackages_dPkg.v_loadManifestAt", ("Vuna.Compiler.Frontend.Packages.Pkg.loadManifestAt", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:179"));
  ("Frontend_dPackages_dPkg.v_loadMembers", ("Vuna.Compiler.Frontend.Packages.Pkg.loadMembers", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:450"));
  ("Frontend_dPackages_dPkg.v_loadOneDependency", ("Vuna.Compiler.Frontend.Packages.Pkg.loadOneDependency", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:333"));
  ("Frontend_dPackages_dPkg.v_loadPackage", ("Vuna.Compiler.Frontend.Packages.Pkg.loadPackage", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:436"));
  ("Frontend_dPackages_dPkg.v_loadPackageWalk", ("Vuna.Compiler.Frontend.Packages.Pkg.loadPackageWalk", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:358"));
  ("Frontend_dPackages_dPkg.v_loadStoreDependency", ("Vuna.Compiler.Frontend.Packages.Pkg.loadStoreDependency", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:238"));
  ("Frontend_dPackages_dPkg.v_loadWorkspace", ("Vuna.Compiler.Frontend.Packages.Pkg.loadWorkspace", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:490"));
  ("Frontend_dPackages_dPkg.v_locateBase", ("Vuna.Compiler.Frontend.Packages.Pkg.locateBase", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:665"));
  ("Frontend_dPackages_dPkg.v_lookupPackageDir", ("Vuna.Compiler.Frontend.Packages.Pkg.lookupPackageDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:405"));
  ("Frontend_dPackages_dPkg.v_manifestNameString", ("Vuna.Compiler.Frontend.Packages.Pkg.manifestNameString", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:197"));
  ("Frontend_dPackages_dPkg.v_memStackDir", ("Vuna.Compiler.Frontend.Packages.Pkg.memStackDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:205"));
  ("Frontend_dPackages_dPkg.v_mismatchMessage", ("Vuna.Compiler.Frontend.Packages.Pkg.mismatchMessage", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:231"));
  ("Frontend_dPackages_dPkg.v_normalizeAcc", ("Vuna.Compiler.Frontend.Packages.Pkg.normalizeAcc", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:128"));
  ("Frontend_dPackages_dPkg.v_normalizeDir", ("Vuna.Compiler.Frontend.Packages.Pkg.normalizeDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:146"));
  ("Frontend_dPackages_dPkg.v_packageContext", ("Vuna.Compiler.Frontend.Packages.Pkg.packageContext", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:589"));
  ("Frontend_dPackages_dPkg.v_packageDependencies", ("Vuna.Compiler.Frontend.Packages.Pkg.packageDependencies", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:46"));
  ("Frontend_dPackages_dPkg.v_packageDir", ("Vuna.Compiler.Frontend.Packages.Pkg.packageDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:98"));
  ("Frontend_dPackages_dPkg.v_packageEntry", ("Vuna.Compiler.Frontend.Packages.Pkg.packageEntry", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:585"));
  ("Frontend_dPackages_dPkg.v_packageExports", ("Vuna.Compiler.Frontend.Packages.Pkg.packageExports", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:107"));
  ("Frontend_dPackages_dPkg.v_packageLayers", ("Vuna.Compiler.Frontend.Packages.Pkg.packageLayers", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:110"));
  ("Frontend_dPackages_dPkg.v_packageName", ("Vuna.Compiler.Frontend.Packages.Pkg.packageName", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:101"));
  ("Frontend_dPackages_dPkg.v_packageRoots", ("Vuna.Compiler.Frontend.Packages.Pkg.packageRoots", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:576"));
  ("Frontend_dPackages_dPkg.v_pkgFuelBound", ("Vuna.Compiler.Frontend.Packages.Pkg.pkgFuelBound", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:432"));
  ("Frontend_dPackages_dPkg.v_rootDir", ("Vuna.Compiler.Frontend.Packages.Pkg.rootDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:64"));
  ("Frontend_dPackages_dPkg.v_rootLayers", ("Vuna.Compiler.Frontend.Packages.Pkg.rootLayers", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:70"));
  ("Frontend_dPackages_dPkg.v_rootName", ("Vuna.Compiler.Frontend.Packages.Pkg.rootName", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:67"));
  ("Frontend_dPackages_dPkg.v_rootPackage", ("Vuna.Compiler.Frontend.Packages.Pkg.rootPackage", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:74"));
  ("Frontend_dPackages_dPkg.v_splitOnSlash", ("Vuna.Compiler.Frontend.Packages.Pkg.splitOnSlash", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:122"));
  ("Frontend_dPackages_dPkg.v_splitSlashChars", ("Vuna.Compiler.Frontend.Packages.Pkg.splitSlashChars", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:114"));
  ("Frontend_dPackages_dPkg.v_verifyIdentityEff", ("Vuna.Compiler.Frontend.Packages.Pkg.verifyIdentityEff", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:270"));
  ("Frontend_dPackages_dPkg.v_verifyPathHashEff", ("Vuna.Compiler.Frontend.Packages.Pkg.verifyPathHashEff", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:291"));
  ("Frontend_dPackages_dPkg.v_workspaceAllPackages", ("Vuna.Compiler.Frontend.Packages.Pkg.workspaceAllPackages", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:482"));
  ("Frontend_dPackages_dPkg.v_workspaceContext", ("Vuna.Compiler.Frontend.Packages.Pkg.workspaceContext", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:541"));
  ("Frontend_dPackages_dPkg.v_workspaceMembersOf", ("Vuna.Compiler.Frontend.Packages.Pkg.workspaceMembersOf", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:478"));
  ("Frontend_dPackages_dPkg.v_workspacePackages", ("Vuna.Compiler.Frontend.Packages.Pkg.workspacePackages", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:528"));
  ("Frontend_dPackages_dPkg.v_workspaceRootOf", ("Vuna.Compiler.Frontend.Packages.Pkg.workspaceRootOf", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:475"));
  ("Frontend_dPackages_dSource.v_collectDirFiles", ("Vuna.Compiler.Frontend.Packages.Source.collectDirFiles", "Vuna/Compiler/Frontend/Packages/Source.vuna:84"));
  ("Frontend_dPackages_dSource.v_collectNames", ("Vuna.Compiler.Frontend.Packages.Source.collectNames", "Vuna/Compiler/Frontend/Packages/Source.vuna:101"));
  ("Frontend_dPackages_dSource.v_contentHashOf", ("Vuna.Compiler.Frontend.Packages.Source.contentHashOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:185"));
  ("Frontend_dPackages_dSource.v_depKeyOf", ("Vuna.Compiler.Frontend.Packages.Source.depKeyOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:173"));
  ("Frontend_dPackages_dSource.v_exportsOf", ("Vuna.Compiler.Frontend.Packages.Source.exportsOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:165"));
  ("Frontend_dPackages_dSource.v_filePathLe", ("Vuna.Compiler.Frontend.Packages.Source.filePathLe", "Vuna/Compiler/Frontend/Packages/Source.vuna:144"));
  ("Frontend_dPackages_dSource.v_identityHashOf", ("Vuna.Compiler.Frontend.Packages.Source.identityHashOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:189"));
  ("Frontend_dPackages_dSource.v_normalizeHash", ("Vuna.Compiler.Frontend.Packages.Source.normalizeHash", "Vuna/Compiler/Frontend/Packages/Source.vuna:39"));
  ("Frontend_dPackages_dSource.v_packageFilesEff", ("Vuna.Compiler.Frontend.Packages.Source.packageFilesEff", "Vuna/Compiler/Frontend/Packages/Source.vuna:48"));
  ("Frontend_dPackages_dSource.v_packageNameOf", ("Vuna.Compiler.Frontend.Packages.Source.packageNameOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:159"));
  ("Frontend_dPackages_dSource.v_packageSourceEff", ("Vuna.Compiler.Frontend.Packages.Source.packageSourceEff", "Vuna/Compiler/Frontend/Packages/Source.vuna:151"));
  ("Frontend_dPackages_dSource.v_pkgSourceDepth", ("Vuna.Compiler.Frontend.Packages.Source.pkgSourceDepth", "Vuna/Compiler/Frontend/Packages/Source.vuna:70"));
  ("Frontend_dPackages_dSource.v_readManifestFile", ("Vuna.Compiler.Frontend.Packages.Source.readManifestFile", "Vuna/Compiler/Frontend/Packages/Source.vuna:73"));
  ("Frontend_dPackages_dSource.v_skipSourceDir", ("Vuna.Compiler.Frontend.Packages.Source.skipSourceDir", "Vuna/Compiler/Frontend/Packages/Source.vuna:24"));
  ("Frontend_dPackages_dSource.v_sortByPath", ("Vuna.Compiler.Frontend.Packages.Source.sortByPath", "Vuna/Compiler/Frontend/Packages/Source.vuna:147"));
  ("Frontend_dPackages_dSource.v_verifyHash", ("Vuna.Compiler.Frontend.Packages.Source.verifyHash", "Vuna/Compiler/Frontend/Packages/Source.vuna:43"));
  ("Frontend_dPackages_dSource.v_walkName", ("Vuna.Compiler.Frontend.Packages.Source.walkName", "Vuna/Compiler/Frontend/Packages/Source.vuna:118"));
  ("Frontend_dParser.v_addParsedDecl", ("Vuna.Compiler.Frontend.Parser.addParsedDecl", "Vuna/Compiler/Frontend/Parser.vuna:293"));
  ("Frontend_dParser.v_anyDottedName", ("Vuna.Compiler.Frontend.Parser.anyDottedName", "Vuna/Compiler/Frontend/Parser.vuna:1709"));
  ("Frontend_dParser.v_atIdentName", ("Vuna.Compiler.Frontend.Parser.atIdentName", "Vuna/Compiler/Frontend/Parser.vuna:1175"));
  ("Frontend_dParser.v_bindingBindsGo", ("Vuna.Compiler.Frontend.Parser.bindingBindsGo", "Vuna/Compiler/Frontend/Parser.vuna:978"));
  ("Frontend_dParser.v_bindingItemsToBinds", ("Vuna.Compiler.Frontend.Parser.bindingItemsToBinds", "Vuna/Compiler/Frontend/Parser.vuna:975"));
  ("Frontend_dParser.v_bindingSigOf", ("Vuna.Compiler.Frontend.Parser.bindingSigOf", "Vuna/Compiler/Frontend/Parser.vuna:1037"));
  ("Frontend_dParser.v_checkBindersAt", ("Vuna.Compiler.Frontend.Parser.checkBindersAt", "Vuna/Compiler/Frontend/Parser.vuna:2193"));
  ("Frontend_dParser.v_checkNoRepeatedBinders", ("Vuna.Compiler.Frontend.Parser.checkNoRepeatedBinders", "Vuna/Compiler/Frontend/Parser.vuna:2199"));
  ("Frontend_dParser.v_consumeQty", ("Vuna.Compiler.Frontend.Parser.consumeQty", "Vuna/Compiler/Frontend/Parser.vuna:1714"));
  ("Frontend_dParser.v_ctxThenSplit", ("Vuna.Compiler.Frontend.Parser.ctxThenSplit", "Vuna/Compiler/Frontend/Parser.vuna:1289"));
  ("Frontend_dParser.v_emptyDeclAcc", ("Vuna.Compiler.Frontend.Parser.emptyDeclAcc", "Vuna/Compiler/Frontend/Parser.vuna:57"));
  ("Frontend_dParser.v_emptyParsedDecl", ("Vuna.Compiler.Frontend.Parser.emptyParsedDecl", "Vuna/Compiler/Frontend/Parser.vuna:66"));
  ("Frontend_dParser.v_expectDeclName", ("Vuna.Compiler.Frontend.Parser.expectDeclName", "Vuna/Compiler/Frontend/Parser.vuna:744"));
  ("Frontend_dParser.v_expectFixityLevel", ("Vuna.Compiler.Frontend.Parser.expectFixityLevel", "Vuna/Compiler/Frontend/Parser.vuna:765"));
  ("Frontend_dParser.v_expectOpName", ("Vuna.Compiler.Frontend.Parser.expectOpName", "Vuna/Compiler/Frontend/Parser.vuna:774"));
  ("Frontend_dParser.v_exportItemOf", ("Vuna.Compiler.Frontend.Parser.exportItemOf", "Vuna/Compiler/Frontend/Parser.vuna:158"));
  ("Frontend_dParser.v_exportMarkerFollows", ("Vuna.Compiler.Frontend.Parser.exportMarkerFollows", "Vuna/Compiler/Frontend/Parser.vuna:367"));
  ("Frontend_dParser.v_exportStart", ("Vuna.Compiler.Frontend.Parser.exportStart", "Vuna/Compiler/Frontend/Parser.vuna:361"));
  ("Frontend_dParser.v_finishAsPattern", ("Vuna.Compiler.Frontend.Parser.finishAsPattern", "Vuna/Compiler/Frontend/Parser.vuna:2297"));
  ("Frontend_dParser.v_firstDanglingSig", ("Vuna.Compiler.Frontend.Parser.firstDanglingSig", "Vuna/Compiler/Frontend/Parser.vuna:1047"));
  ("Frontend_dParser.v_firstOtherKName", ("Vuna.Compiler.Frontend.Parser.firstOtherKName", "Vuna/Compiler/Frontend/Parser.vuna:2052"));
  ("Frontend_dParser.v_firstRepeatedBinding", ("Vuna.Compiler.Frontend.Parser.firstRepeatedBinding", "Vuna/Compiler/Frontend/Parser.vuna:2180"));
  ("Frontend_dParser.v_firstRepeatedBindingGo", ("Vuna.Compiler.Frontend.Parser.firstRepeatedBindingGo", "Vuna/Compiler/Frontend/Parser.vuna:2184"));
  ("Frontend_dParser.v_foldCons", ("Vuna.Compiler.Frontend.Parser.foldCons", "Vuna/Compiler/Frontend/Parser.vuna:1775"));
  ("Frontend_dParser.v_foldPCon", ("Vuna.Compiler.Frontend.Parser.foldPCon", "Vuna/Compiler/Frontend/Parser.vuna:2366"));
  ("Frontend_dParser.v_foldPairExprs", ("Vuna.Compiler.Frontend.Parser.foldPairExprs", "Vuna/Compiler/Frontend/Parser.vuna:1654"));
  ("Frontend_dParser.v_foldPairPats", ("Vuna.Compiler.Frontend.Parser.foldPairPats", "Vuna/Compiler/Frontend/Parser.vuna:2381"));
  ("Frontend_dParser.v_foldPiNames", ("Vuna.Compiler.Frontend.Parser.foldPiNames", "Vuna/Compiler/Frontend/Parser.vuna:1704"));
  ("Frontend_dParser.v_handleAlt", ("Vuna.Compiler.Frontend.Parser.handleAlt", "Vuna/Compiler/Frontend/Parser.vuna:2060"));
  ("Frontend_dParser.v_handleExpr", ("Vuna.Compiler.Frontend.Parser.handleExpr", "Vuna/Compiler/Frontend/Parser.vuna:2077"));
  ("Frontend_dParser.v_handleOpBinder", ("Vuna.Compiler.Frontend.Parser.handleOpBinder", "Vuna/Compiler/Frontend/Parser.vuna:1906"));
  ("Frontend_dParser.v_handleOpIndexBinder", ("Vuna.Compiler.Frontend.Parser.handleOpIndexBinder", "Vuna/Compiler/Frontend/Parser.vuna:1910"));
  ("Frontend_dParser.v_handleOpKName", ("Vuna.Compiler.Frontend.Parser.handleOpKName", "Vuna/Compiler/Frontend/Parser.vuna:2048"));
  ("Frontend_dParser.v_handleOpLam", ("Vuna.Compiler.Frontend.Parser.handleOpLam", "Vuna/Compiler/Frontend/Parser.vuna:2069"));
  ("Frontend_dParser.v_handleOpTail", ("Vuna.Compiler.Frontend.Parser.handleOpTail", "Vuna/Compiler/Frontend/Parser.vuna:2038"));
  ("Frontend_dParser.v_handleRetExpr", ("Vuna.Compiler.Frontend.Parser.handleRetExpr", "Vuna/Compiler/Frontend/Parser.vuna:2064"));
  ("Frontend_dParser.v_hasBindingSig", ("Vuna.Compiler.Frontend.Parser.hasBindingSig", "Vuna/Compiler/Frontend/Parser.vuna:1041"));
  ("Frontend_dParser.v_holeSpan", ("Vuna.Compiler.Frontend.Parser.holeSpan", "Vuna/Compiler/Frontend/Parser.vuna:1611"));
  ("Frontend_dParser.v_innermostPiCod", ("Vuna.Compiler.Frontend.Parser.innermostPiCod", "Vuna/Compiler/Frontend/Parser.vuna:1294"));
  ("Frontend_dParser.v_instanceMethodStart", ("Vuna.Compiler.Frontend.Parser.instanceMethodStart", "Vuna/Compiler/Frontend/Parser.vuna:1344"));
  ("Frontend_dParser.v_isReturnClauseHead", ("Vuna.Compiler.Frontend.Parser.isReturnClauseHead", "Vuna/Compiler/Frontend/Parser.vuna:1968"));
  ("Frontend_dParser.v_localFunMerge", ("Vuna.Compiler.Frontend.Parser.localFunMerge", "Vuna/Compiler/Frontend/Parser.vuna:1015"));
  ("Frontend_dParser.v_macroAtom", ("Vuna.Compiler.Frontend.Parser.macroAtom", "Vuna/Compiler/Frontend/Parser.vuna:1527"));
  ("Frontend_dParser.v_macroBangAt", ("Vuna.Compiler.Frontend.Parser.macroBangAt", "Vuna/Compiler/Frontend/Parser.vuna:1520"));
  ("Frontend_dParser.v_opacityGiven", ("Vuna.Compiler.Frontend.Parser.opacityGiven", "Vuna/Compiler/Frontend/Parser.vuna:453"));
  ("Frontend_dParser.v_opacitySpecOf", ("Vuna.Compiler.Frontend.Parser.opacitySpecOf", "Vuna/Compiler/Frontend/Parser.vuna:457"));
  ("Frontend_dParser.v_opacityStart", ("Vuna.Compiler.Frontend.Parser.opacityStart", "Vuna/Compiler/Frontend/Parser.vuna:392"));
  ("Frontend_dParser.v_parenIsMemberList", ("Vuna.Compiler.Frontend.Parser.parenIsMemberList", "Vuna/Compiler/Frontend/Parser.vuna:720"));
  ("Frontend_dParser.v_parseAltList", ("Vuna.Compiler.Frontend.Parser.parseAltList", "Vuna/Compiler/Frontend/Parser.vuna:1860"));
  ("Frontend_dParser.v_parseApplication", ("Vuna.Compiler.Frontend.Parser.parseApplication", "Vuna/Compiler/Frontend/Parser.vuna:1441"));
  ("Frontend_dParser.v_parseArgs", ("Vuna.Compiler.Frontend.Parser.parseArgs", "Vuna/Compiler/Frontend/Parser.vuna:1485"));
  ("Frontend_dParser.v_parseAsName", ("Vuna.Compiler.Frontend.Parser.parseAsName", "Vuna/Compiler/Frontend/Parser.vuna:2309"));
  ("Frontend_dParser.v_parseAtPayload", ("Vuna.Compiler.Frontend.Parser.parseAtPayload", "Vuna/Compiler/Frontend/Parser.vuna:1463"));
  ("Frontend_dParser.v_parseAtom", ("Vuna.Compiler.Frontend.Parser.parseAtom", "Vuna/Compiler/Frontend/Parser.vuna:1496"));
  ("Frontend_dParser.v_parseAtomBase", ("Vuna.Compiler.Frontend.Parser.parseAtomBase", "Vuna/Compiler/Frontend/Parser.vuna:1531"));
  ("Frontend_dParser.v_parseAxiom", ("Vuna.Compiler.Frontend.Parser.parseAxiom", "Vuna/Compiler/Frontend/Parser.vuna:829"));
  ("Frontend_dParser.v_parseAxiomExport", ("Vuna.Compiler.Frontend.Parser.parseAxiomExport", "Vuna/Compiler/Frontend/Parser.vuna:490"));
  ("Frontend_dParser.v_parseBindingDef", ("Vuna.Compiler.Frontend.Parser.parseBindingDef", "Vuna/Compiler/Frontend/Parser.vuna:955"));
  ("Frontend_dParser.v_parseBindingItem", ("Vuna.Compiler.Frontend.Parser.parseBindingItem", "Vuna/Compiler/Frontend/Parser.vuna:942"));
  ("Frontend_dParser.v_parseBindingItemsAt", ("Vuna.Compiler.Frontend.Parser.parseBindingItemsAt", "Vuna/Compiler/Frontend/Parser.vuna:930"));
  ("Frontend_dParser.v_parseBindingValue", ("Vuna.Compiler.Frontend.Parser.parseBindingValue", "Vuna/Compiler/Frontend/Parser.vuna:964"));
  ("Frontend_dParser.v_parseCase", ("Vuna.Compiler.Frontend.Parser.parseCase", "Vuna/Compiler/Frontend/Parser.vuna:1829"));
  ("Frontend_dParser.v_parseCaseAlts", ("Vuna.Compiler.Frontend.Parser.parseCaseAlts", "Vuna/Compiler/Frontend/Parser.vuna:1838"));
  ("Frontend_dParser.v_parseClause", ("Vuna.Compiler.Frontend.Parser.parseClause", "Vuna/Compiler/Frontend/Parser.vuna:871"));
  ("Frontend_dParser.v_parseClausePatterns", ("Vuna.Compiler.Frontend.Parser.parseClausePatterns", "Vuna/Compiler/Frontend/Parser.vuna:1053"));
  ("Frontend_dParser.v_parseCtorList", ("Vuna.Compiler.Frontend.Parser.parseCtorList", "Vuna/Compiler/Frontend/Parser.vuna:1375"));
  ("Frontend_dParser.v_parseCtors", ("Vuna.Compiler.Frontend.Parser.parseCtors", "Vuna/Compiler/Frontend/Parser.vuna:1367"));
  ("Frontend_dParser.v_parseCtxRest", ("Vuna.Compiler.Frontend.Parser.parseCtxRest", "Vuna/Compiler/Frontend/Parser.vuna:1303"));
  ("Frontend_dParser.v_parseCtxThenExpr", ("Vuna.Compiler.Frontend.Parser.parseCtxThenExpr", "Vuna/Compiler/Frontend/Parser.vuna:1277"));
  ("Frontend_dParser.v_parseData", ("Vuna.Compiler.Frontend.Parser.parseData", "Vuna/Compiler/Frontend/Parser.vuna:1101"));
  ("Frontend_dParser.v_parseDataExport", ("Vuna.Compiler.Frontend.Parser.parseDataExport", "Vuna/Compiler/Frontend/Parser.vuna:576"));
  ("Frontend_dParser.v_parseDecl", ("Vuna.Compiler.Frontend.Parser.parseDecl", "Vuna/Compiler/Frontend/Parser.vuna:789"));
  ("Frontend_dParser.v_parseDecls", ("Vuna.Compiler.Frontend.Parser.parseDecls", "Vuna/Compiler/Frontend/Parser.vuna:262"));
  ("Frontend_dParser.v_parseDeriving", ("Vuna.Compiler.Frontend.Parser.parseDeriving", "Vuna/Compiler/Frontend/Parser.vuna:1183"));
  ("Frontend_dParser.v_parseDerivingNames", ("Vuna.Compiler.Frontend.Parser.parseDerivingNames", "Vuna/Compiler/Frontend/Parser.vuna:1199"));
  ("Frontend_dParser.v_parseDerivingParens", ("Vuna.Compiler.Frontend.Parser.parseDerivingParens", "Vuna/Compiler/Frontend/Parser.vuna:1193"));
  ("Frontend_dParser.v_parseDo", ("Vuna.Compiler.Frontend.Parser.parseDo", "Vuna/Compiler/Frontend/Parser.vuna:2098"));
  ("Frontend_dParser.v_parseDoExprStmt", ("Vuna.Compiler.Frontend.Parser.parseDoExprStmt", "Vuna/Compiler/Frontend/Parser.vuna:2150"));
  ("Frontend_dParser.v_parseDoStmt", ("Vuna.Compiler.Frontend.Parser.parseDoStmt", "Vuna/Compiler/Frontend/Parser.vuna:2141"));
  ("Frontend_dParser.v_parseDoStmts", ("Vuna.Compiler.Frontend.Parser.parseDoStmts", "Vuna/Compiler/Frontend/Parser.vuna:2121"));
  ("Frontend_dParser.v_parseExportDecl", ("Vuna.Compiler.Frontend.Parser.parseExportDecl", "Vuna/Compiler/Frontend/Parser.vuna:401"));
  ("Frontend_dParser.v_parseExportImport", ("Vuna.Compiler.Frontend.Parser.parseExportImport", "Vuna/Compiler/Frontend/Parser.vuna:165"));
  ("Frontend_dParser.v_parseExportItem", ("Vuna.Compiler.Frontend.Parser.parseExportItem", "Vuna/Compiler/Frontend/Parser.vuna:118"));
  ("Frontend_dParser.v_parseExportItems", ("Vuna.Compiler.Frontend.Parser.parseExportItems", "Vuna/Compiler/Frontend/Parser.vuna:103"));
  ("Frontend_dParser.v_parseExportItemsFrom", ("Vuna.Compiler.Frontend.Parser.parseExportItemsFrom", "Vuna/Compiler/Frontend/Parser.vuna:109"));
  ("Frontend_dParser.v_parseExportMembers", ("Vuna.Compiler.Frontend.Parser.parseExportMembers", "Vuna/Compiler/Frontend/Parser.vuna:143"));
  ("Frontend_dParser.v_parseExportNamespace", ("Vuna.Compiler.Frontend.Parser.parseExportNamespace", "Vuna/Compiler/Frontend/Parser.vuna:173"));
  ("Frontend_dParser.v_parseExportedPlain", ("Vuna.Compiler.Frontend.Parser.parseExportedPlain", "Vuna/Compiler/Frontend/Parser.vuna:407"));
  ("Frontend_dParser.v_parseExportedValue", ("Vuna.Compiler.Frontend.Parser.parseExportedValue", "Vuna/Compiler/Frontend/Parser.vuna:462"));
  ("Frontend_dParser.v_parseExpr", ("Vuna.Compiler.Frontend.Parser.parseExpr", "Vuna/Compiler/Frontend/Parser.vuna:1385"));
  ("Frontend_dParser.v_parseExpressionSource", ("Vuna.Compiler.Frontend.Parser.parseExpressionSource", "Vuna/Compiler/Frontend/Parser.vuna:44"));
  ("Frontend_dParser.v_parseExtern", ("Vuna.Compiler.Frontend.Parser.parseExtern", "Vuna/Compiler/Frontend/Parser.vuna:837"));
  ("Frontend_dParser.v_parseExternExport", ("Vuna.Compiler.Frontend.Parser.parseExternExport", "Vuna/Compiler/Frontend/Parser.vuna:502"));
  ("Frontend_dParser.v_parseFieldList", ("Vuna.Compiler.Frontend.Parser.parseFieldList", "Vuna/Compiler/Frontend/Parser.vuna:1163"));
  ("Frontend_dParser.v_parseFieldSuffix", ("Vuna.Compiler.Frontend.Parser.parseFieldSuffix", "Vuna/Compiler/Frontend/Parser.vuna:1506"));
  ("Frontend_dParser.v_parseFields", ("Vuna.Compiler.Frontend.Parser.parseFields", "Vuna/Compiler/Frontend/Parser.vuna:1155"));
  ("Frontend_dParser.v_parseFixityDecl", ("Vuna.Compiler.Frontend.Parser.parseFixityDecl", "Vuna/Compiler/Frontend/Parser.vuna:736"));
  ("Frontend_dParser.v_parseFixityOrDecl", ("Vuna.Compiler.Frontend.Parser.parseFixityOrDecl", "Vuna/Compiler/Frontend/Parser.vuna:335"));
  ("Frontend_dParser.v_parseHandle", ("Vuna.Compiler.Frontend.Parser.parseHandle", "Vuna/Compiler/Frontend/Parser.vuna:1914"));
  ("Frontend_dParser.v_parseHandleBody", ("Vuna.Compiler.Frontend.Parser.parseHandleBody", "Vuna/Compiler/Frontend/Parser.vuna:1949"));
  ("Frontend_dParser.v_parseHandleClauses", ("Vuna.Compiler.Frontend.Parser.parseHandleClauses", "Vuna/Compiler/Frontend/Parser.vuna:1975"));
  ("Frontend_dParser.v_parseHandleComp", ("Vuna.Compiler.Frontend.Parser.parseHandleComp", "Vuna/Compiler/Frontend/Parser.vuna:1936"));
  ("Frontend_dParser.v_parseHandleOpClause", ("Vuna.Compiler.Frontend.Parser.parseHandleOpClause", "Vuna/Compiler/Frontend/Parser.vuna:2015"));
  ("Frontend_dParser.v_parseHandleRetClause", ("Vuna.Compiler.Frontend.Parser.parseHandleRetClause", "Vuna/Compiler/Frontend/Parser.vuna:2005"));
  ("Frontend_dParser.v_parseIf", ("Vuna.Compiler.Frontend.Parser.parseIf", "Vuna/Compiler/Frontend/Parser.vuna:2087"));
  ("Frontend_dParser.v_parseImportAfterKeyword", ("Vuna.Compiler.Frontend.Parser.parseImportAfterKeyword", "Vuna/Compiler/Frontend/Parser.vuna:180"));
  ("Frontend_dParser.v_parseImportAlias", ("Vuna.Compiler.Frontend.Parser.parseImportAlias", "Vuna/Compiler/Frontend/Parser.vuna:216"));
  ("Frontend_dParser.v_parseImportSpec", ("Vuna.Compiler.Frontend.Parser.parseImportSpec", "Vuna/Compiler/Frontend/Parser.vuna:210"));
  ("Frontend_dParser.v_parseImports", ("Vuna.Compiler.Frontend.Parser.parseImports", "Vuna/Compiler/Frontend/Parser.vuna:223"));
  ("Frontend_dParser.v_parseInfix", ("Vuna.Compiler.Frontend.Parser.parseInfix", "Vuna/Compiler/Frontend/Parser.vuna:1400"));
  ("Frontend_dParser.v_parseInstance", ("Vuna.Compiler.Frontend.Parser.parseInstance", "Vuna/Compiler/Frontend/Parser.vuna:1260"));
  ("Frontend_dParser.v_parseInstanceBody", ("Vuna.Compiler.Frontend.Parser.parseInstanceBody", "Vuna/Compiler/Frontend/Parser.vuna:1316"));
  ("Frontend_dParser.v_parseInstanceDecl", ("Vuna.Compiler.Frontend.Parser.parseInstanceDecl", "Vuna/Compiler/Frontend/Parser.vuna:1334"));
  ("Frontend_dParser.v_parseInstanceDeclList", ("Vuna.Compiler.Frontend.Parser.parseInstanceDeclList", "Vuna/Compiler/Frontend/Parser.vuna:1324"));
  ("Frontend_dParser.v_parseInstanceTail", ("Vuna.Compiler.Frontend.Parser.parseInstanceTail", "Vuna/Compiler/Frontend/Parser.vuna:1271"));
  ("Frontend_dParser.v_parseLambda", ("Vuna.Compiler.Frontend.Parser.parseLambda", "Vuna/Compiler/Frontend/Parser.vuna:1779"));
  ("Frontend_dParser.v_parseLambdaParam", ("Vuna.Compiler.Frontend.Parser.parseLambdaParam", "Vuna/Compiler/Frontend/Parser.vuna:1789"));
  ("Frontend_dParser.v_parseLambdaParams", ("Vuna.Compiler.Frontend.Parser.parseLambdaParams", "Vuna/Compiler/Frontend/Parser.vuna:1795"));
  ("Frontend_dParser.v_parseLet", ("Vuna.Compiler.Frontend.Parser.parseLet", "Vuna/Compiler/Frontend/Parser.vuna:1806"));
  ("Frontend_dParser.v_parseLetBindings", ("Vuna.Compiler.Frontend.Parser.parseLetBindings", "Vuna/Compiler/Frontend/Parser.vuna:1817"));
  ("Frontend_dParser.v_parseLhs", ("Vuna.Compiler.Frontend.Parser.parseLhs", "Vuna/Compiler/Frontend/Parser.vuna:1413"));
  ("Frontend_dParser.v_parseLinearDecl", ("Vuna.Compiler.Frontend.Parser.parseLinearDecl", "Vuna/Compiler/Frontend/Parser.vuna:1065"));
  ("Frontend_dParser.v_parseLinearExport", ("Vuna.Compiler.Frontend.Parser.parseLinearExport", "Vuna/Compiler/Frontend/Parser.vuna:515"));
  ("Frontend_dParser.v_parseListElemAt", ("Vuna.Compiler.Frontend.Parser.parseListElemAt", "Vuna/Compiler/Frontend/Parser.vuna:1763"));
  ("Frontend_dParser.v_parseListExpr", ("Vuna.Compiler.Frontend.Parser.parseListExpr", "Vuna/Compiler/Frontend/Parser.vuna:1743"));
  ("Frontend_dParser.v_parseListExprElems", ("Vuna.Compiler.Frontend.Parser.parseListExprElems", "Vuna/Compiler/Frontend/Parser.vuna:1752"));
  ("Frontend_dParser.v_parseListPattern", ("Vuna.Compiler.Frontend.Parser.parseListPattern", "Vuna/Compiler/Frontend/Parser.vuna:2347"));
  ("Frontend_dParser.v_parseListPatternElems", ("Vuna.Compiler.Frontend.Parser.parseListPatternElems", "Vuna/Compiler/Frontend/Parser.vuna:2356"));
  ("Frontend_dParser.v_parseMemberNames", ("Vuna.Compiler.Frontend.Parser.parseMemberNames", "Vuna/Compiler/Frontend/Parser.vuna:149"));
  ("Frontend_dParser.v_parseMethodSigList", ("Vuna.Compiler.Frontend.Parser.parseMethodSigList", "Vuna/Compiler/Frontend/Parser.vuna:1247"));
  ("Frontend_dParser.v_parseMethodSigs", ("Vuna.Compiler.Frontend.Parser.parseMethodSigs", "Vuna/Compiler/Frontend/Parser.vuna:1239"));
  ("Frontend_dParser.v_parseModDecl", ("Vuna.Compiler.Frontend.Parser.parseModDecl", "Vuna/Compiler/Frontend/Parser.vuna:94"));
  ("Frontend_dParser.v_parseNegation", ("Vuna.Compiler.Frontend.Parser.parseNegation", "Vuna/Compiler/Frontend/Parser.vuna:1431"));
  ("Frontend_dParser.v_parseOpacityDecl", ("Vuna.Compiler.Frontend.Parser.parseOpacityDecl", "Vuna/Compiler/Frontend/Parser.vuna:526"));
  ("Frontend_dParser.v_parseOpacityValue", ("Vuna.Compiler.Frontend.Parser.parseOpacityValue", "Vuna/Compiler/Frontend/Parser.vuna:543"));
  ("Frontend_dParser.v_parseOptionalMembers", ("Vuna.Compiler.Frontend.Parser.parseOptionalMembers", "Vuna/Compiler/Frontend/Parser.vuna:732"));
  ("Frontend_dParser.v_parseParams", ("Vuna.Compiler.Frontend.Parser.parseParams", "Vuna/Compiler/Frontend/Parser.vuna:1358"));
  ("Frontend_dParser.v_parseParenAtom", ("Vuna.Compiler.Frontend.Parser.parseParenAtom", "Vuna/Compiler/Frontend/Parser.vuna:1628"));
  ("Frontend_dParser.v_parseParenTupleRest", ("Vuna.Compiler.Frontend.Parser.parseParenTupleRest", "Vuna/Compiler/Frontend/Parser.vuna:1644"));
  ("Frontend_dParser.v_parsePatternAtom", ("Vuna.Compiler.Frontend.Parser.parsePatternAtom", "Vuna/Compiler/Frontend/Parser.vuna:2287"));
  ("Frontend_dParser.v_parsePatternAtomBase", ("Vuna.Compiler.Frontend.Parser.parsePatternAtomBase", "Vuna/Compiler/Frontend/Parser.vuna:2318"));
  ("Frontend_dParser.v_parsePatternAtoms", ("Vuna.Compiler.Frontend.Parser.parsePatternAtoms", "Vuna/Compiler/Frontend/Parser.vuna:2276"));
  ("Frontend_dParser.v_parsePatternCons", ("Vuna.Compiler.Frontend.Parser.parsePatternCons", "Vuna/Compiler/Frontend/Parser.vuna:2212"));
  ("Frontend_dParser.v_parsePatternHead", ("Vuna.Compiler.Frontend.Parser.parsePatternHead", "Vuna/Compiler/Frontend/Parser.vuna:2221"));
  ("Frontend_dParser.v_parsePatternSingle", ("Vuna.Compiler.Frontend.Parser.parsePatternSingle", "Vuna/Compiler/Frontend/Parser.vuna:2207"));
  ("Frontend_dParser.v_parsePatternTupleRest", ("Vuna.Compiler.Frontend.Parser.parsePatternTupleRest", "Vuna/Compiler/Frontend/Parser.vuna:2371"));
  ("Frontend_dParser.v_parsePerform", ("Vuna.Compiler.Frontend.Parser.parsePerform", "Vuna/Compiler/Frontend/Parser.vuna:1877"));
  ("Frontend_dParser.v_parsePiBinder", ("Vuna.Compiler.Frontend.Parser.parsePiBinder", "Vuna/Compiler/Frontend/Parser.vuna:1673"));
  ("Frontend_dParser.v_parsePiNames", ("Vuna.Compiler.Frontend.Parser.parsePiNames", "Vuna/Compiler/Frontend/Parser.vuna:1685"));
  ("Frontend_dParser.v_parsePiNamesRest", ("Vuna.Compiler.Frontend.Parser.parsePiNamesRest", "Vuna/Compiler/Frontend/Parser.vuna:1694"));
  ("Frontend_dParser.v_parseRecord", ("Vuna.Compiler.Frontend.Parser.parseRecord", "Vuna/Compiler/Frontend/Parser.vuna:1132"));
  ("Frontend_dParser.v_parseRecordAssignList", ("Vuna.Compiler.Frontend.Parser.parseRecordAssignList", "Vuna/Compiler/Frontend/Parser.vuna:1734"));
  ("Frontend_dParser.v_parseRecordAssignments", ("Vuna.Compiler.Frontend.Parser.parseRecordAssignments", "Vuna/Compiler/Frontend/Parser.vuna:1723"));
  ("Frontend_dParser.v_parseRecordExport", ("Vuna.Compiler.Frontend.Parser.parseRecordExport", "Vuna/Compiler/Frontend/Parser.vuna:611"));
  ("Frontend_dParser.v_parseRecordPatternField", ("Vuna.Compiler.Frontend.Parser.parseRecordPatternField", "Vuna/Compiler/Frontend/Parser.vuna:2264"));
  ("Frontend_dParser.v_parseRecordPatternFields", ("Vuna.Compiler.Frontend.Parser.parseRecordPatternFields", "Vuna/Compiler/Frontend/Parser.vuna:2244"));
  ("Frontend_dParser.v_parseRecordPatternList", ("Vuna.Compiler.Frontend.Parser.parseRecordPatternList", "Vuna/Compiler/Frontend/Parser.vuna:2253"));
  ("Frontend_dParser.v_parseReexportTail", ("Vuna.Compiler.Frontend.Parser.parseReexportTail", "Vuna/Compiler/Frontend/Parser.vuna:187"));
  ("Frontend_dParser.v_parseSectionAtom", ("Vuna.Compiler.Frontend.Parser.parseSectionAtom", "Vuna/Compiler/Frontend/Parser.vuna:1661"));
  ("Frontend_dParser.v_parseSignature", ("Vuna.Compiler.Frontend.Parser.parseSignature", "Vuna/Compiler/Frontend/Parser.vuna:857"));
  ("Frontend_dParser.v_parseSource", ("Vuna.Compiler.Frontend.Parser.parseSource", "Vuna/Compiler/Frontend/Parser.vuna:37"));
  ("Frontend_dParser.v_parseSourceFile", ("Vuna.Compiler.Frontend.Parser.parseSourceFile", "Vuna/Compiler/Frontend/Parser.vuna:71"));
  ("Frontend_dParser.v_parseSourceRecovering", ("Vuna.Compiler.Frontend.Parser.parseSourceRecovering", "Vuna/Compiler/Frontend/Parser.vuna:2389"));
  ("Frontend_dParser.v_parseSourceRecoveringTokens", ("Vuna.Compiler.Frontend.Parser.parseSourceRecoveringTokens", "Vuna/Compiler/Frontend/Parser.vuna:2397"));
  ("Frontend_dParser.v_parseSourceWithComments", ("Vuna.Compiler.Frontend.Parser.parseSourceWithComments", "Vuna/Compiler/Frontend/Parser.vuna:28"));
  ("Frontend_dParser.v_parseTemplateAtom", ("Vuna.Compiler.Frontend.Parser.parseTemplateAtom", "Vuna/Compiler/Frontend/Parser.vuna:1570"));
  ("Frontend_dParser.v_parseTemplateHole", ("Vuna.Compiler.Frontend.Parser.parseTemplateHole", "Vuna/Compiler/Frontend/Parser.vuna:1595"));
  ("Frontend_dParser.v_parseTemplateParts", ("Vuna.Compiler.Frontend.Parser.parseTemplateParts", "Vuna/Compiler/Frontend/Parser.vuna:1583"));
  ("Frontend_dParser.v_parseTieredDecl", ("Vuna.Compiler.Frontend.Parser.parseTieredDecl", "Vuna/Compiler/Frontend/Parser.vuna:1089"));
  ("Frontend_dParser.v_parseTieredExport", ("Vuna.Compiler.Frontend.Parser.parseTieredExport", "Vuna/Compiler/Frontend/Parser.vuna:565"));
  ("Frontend_dParser.v_parseTrait", ("Vuna.Compiler.Frontend.Parser.parseTrait", "Vuna/Compiler/Frontend/Parser.vuna:1210"));
  ("Frontend_dParser.v_parseTraitExport", ("Vuna.Compiler.Frontend.Parser.parseTraitExport", "Vuna/Compiler/Frontend/Parser.vuna:640"));
  ("Frontend_dParser.v_parseTraitExportMembers", ("Vuna.Compiler.Frontend.Parser.parseTraitExportMembers", "Vuna/Compiler/Frontend/Parser.vuna:715"));
  ("Frontend_dParser.v_parseTraitHead", ("Vuna.Compiler.Frontend.Parser.parseTraitHead", "Vuna/Compiler/Frontend/Parser.vuna:668"));
  ("Frontend_dParser.v_parseTraitParams", ("Vuna.Compiler.Frontend.Parser.parseTraitParams", "Vuna/Compiler/Frontend/Parser.vuna:1229"));
  ("Frontend_dParser.v_parseTraitSupers", ("Vuna.Compiler.Frontend.Parser.parseTraitSupers", "Vuna/Compiler/Frontend/Parser.vuna:694"));
  ("Frontend_dParser.v_parseTraitSupersRest", ("Vuna.Compiler.Frontend.Parser.parseTraitSupersRest", "Vuna/Compiler/Frontend/Parser.vuna:703"));
  ("Frontend_dParser.v_parseWhere", ("Vuna.Compiler.Frontend.Parser.parseWhere", "Vuna/Compiler/Frontend/Parser.vuna:905"));
  ("Frontend_dParser.v_parseWhereBindings", ("Vuna.Compiler.Frontend.Parser.parseWhereBindings", "Vuna/Compiler/Frontend/Parser.vuna:917"));
  ("Frontend_dParser.v_patBinderBindings", ("Vuna.Compiler.Frontend.Parser.patBinderBindings", "Vuna/Compiler/Frontend/Parser.vuna:2169"));
  ("Frontend_dParser.v_patBoundName", ("Vuna.Compiler.Frontend.Parser.patBoundName", "Vuna/Compiler/Frontend/Parser.vuna:1033"));
  ("Frontend_dParser.v_ps0", ("Vuna.Compiler.Frontend.Parser.ps0", "Vuna/Compiler/Frontend/Parser.vuna:17"));
  ("Frontend_dParser.v_ps1", ("Vuna.Compiler.Frontend.Parser.ps1", "Vuna/Compiler/Frontend/Parser.vuna:20"));
  ("Frontend_dParser.v_psAt", ("Vuna.Compiler.Frontend.Parser.psAt", "Vuna/Compiler/Frontend/Parser.vuna:23"));
  ("Frontend_dParser.v_qualifyExportItem", ("Vuna.Compiler.Frontend.Parser.qualifyExportItem", "Vuna/Compiler/Frontend/Parser.vuna:203"));
  ("Frontend_dParser.v_recoverDecl", ("Vuna.Compiler.Frontend.Parser.recoverDecl", "Vuna/Compiler/Frontend/Parser.vuna:319"));
  ("Frontend_dParser.v_reexportPrefix", ("Vuna.Compiler.Frontend.Parser.reexportPrefix", "Vuna/Compiler/Frontend/Parser.vuna:197"));
  ("Frontend_dParser.v_rejectCtxSuffix", ("Vuna.Compiler.Frontend.Parser.rejectCtxSuffix", "Vuna/Compiler/Frontend/Parser.vuna:852"));
  ("Frontend_dParser.v_replacePiCod", ("Vuna.Compiler.Frontend.Parser.replacePiCod", "Vuna/Compiler/Frontend/Parser.vuna:1298"));
  ("Frontend_dParser.v_reverseDeclAcc", ("Vuna.Compiler.Frontend.Parser.reverseDeclAcc", "Vuna/Compiler/Frontend/Parser.vuna:314"));
  ("Frontend_dParser.v_rowAtNameExpr", ("Vuna.Compiler.Frontend.Parser.rowAtNameExpr", "Vuna/Compiler/Frontend/Parser.vuna:1871"));
  ("Frontend_dParser.v_skipFrom", ("Vuna.Compiler.Frontend.Parser.skipFrom", "Vuna/Compiler/Frontend/Parser.vuna:329"));
  ("Frontend_dParser.v_skipToDeclLine", ("Vuna.Compiler.Frontend.Parser.skipToDeclLine", "Vuna/Compiler/Frontend/Parser.vuna:325"));
  ("Frontend_dParser.v_spanFromExpr", ("Vuna.Compiler.Frontend.Parser.spanFromExpr", "Vuna/Compiler/Frontend/Parser.vuna:1472"));
  ("Frontend_dParser.v_textPartsOf", ("Vuna.Compiler.Frontend.Parser.textPartsOf", "Vuna/Compiler/Frontend/Parser.vuna:1619"));
  ("Frontend_dParser.v_tierFollows", ("Vuna.Compiler.Frontend.Parser.tierFollows", "Vuna/Compiler/Frontend/Parser.vuna:1077"));
  ("Frontend_dParser.v_toksFuel", ("Vuna.Compiler.Frontend.Parser.toksFuel", "Vuna/Compiler/Frontend/Parser.vuna:1615"));
  ("Frontend_dParser.v_traitSupersFollow", ("Vuna.Compiler.Frontend.Parser.traitSupersFollow", "Vuna/Compiler/Frontend/Parser.vuna:681"));
  ("Frontend_dParser.v_traitSupersFollowGo", ("Vuna.Compiler.Frontend.Parser.traitSupersFollowGo", "Vuna/Compiler/Frontend/Parser.vuna:684"));
  ("Frontend_dParser_dSupport.v_advance", ("Vuna.Compiler.Frontend.Parser.Support.advance", "Vuna/Compiler/Frontend/Parser/Support.vuna:97"));
  ("Frontend_dParser_dSupport.v_arrowAt", ("Vuna.Compiler.Frontend.Parser.Support.arrowAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:207"));
  ("Frontend_dParser_dSupport.v_atKw", ("Vuna.Compiler.Frontend.Parser.Support.atKw", "Vuna/Compiler/Frontend/Parser/Support.vuna:211"));
  ("Frontend_dParser_dSupport.v_atSym", ("Vuna.Compiler.Frontend.Parser.Support.atSym", "Vuna/Compiler/Frontend/Parser/Support.vuna:141"));
  ("Frontend_dParser_dSupport.v_badCaseIndent", ("Vuna.Compiler.Frontend.Parser.Support.badCaseIndent", "Vuna/Compiler/Frontend/Parser/Support.vuna:408"));
  ("Frontend_dParser_dSupport.v_binderHead", ("Vuna.Compiler.Frontend.Parser.Support.binderHead", "Vuna/Compiler/Frontend/Parser/Support.vuna:158"));
  ("Frontend_dParser_dSupport.v_binderNameTail", ("Vuna.Compiler.Frontend.Parser.Support.binderNameTail", "Vuna/Compiler/Frontend/Parser/Support.vuna:175"));
  ("Frontend_dParser_dSupport.v_canContinue", ("Vuna.Compiler.Frontend.Parser.Support.canContinue", "Vuna/Compiler/Frontend/Parser/Support.vuna:217"));
  ("Frontend_dParser_dSupport.v_closeParenNext", ("Vuna.Compiler.Frontend.Parser.Support.closeParenNext", "Vuna/Compiler/Frontend/Parser/Support.vuna:364"));
  ("Frontend_dParser_dSupport.v_countArrows", ("Vuna.Compiler.Frontend.Parser.Support.countArrows", "Vuna/Compiler/Frontend/Parser/Support.vuna:394"));
  ("Frontend_dParser_dSupport.v_ctorPatternStart", ("Vuna.Compiler.Frontend.Parser.Support.ctorPatternStart", "Vuna/Compiler/Frontend/Parser/Support.vuna:282"));
  ("Frontend_dParser_dSupport.v_expectIdent", ("Vuna.Compiler.Frontend.Parser.Support.expectIdent", "Vuna/Compiler/Frontend/Parser/Support.vuna:239"));
  ("Frontend_dParser_dSupport.v_expectKw", ("Vuna.Compiler.Frontend.Parser.Support.expectKw", "Vuna/Compiler/Frontend/Parser/Support.vuna:233"));
  ("Frontend_dParser_dSupport.v_expectSym", ("Vuna.Compiler.Frontend.Parser.Support.expectSym", "Vuna/Compiler/Frontend/Parser/Support.vuna:226"));
  ("Frontend_dParser_dSupport.v_expectValueName", ("Vuna.Compiler.Frontend.Parser.Support.expectValueName", "Vuna/Compiler/Frontend/Parser/Support.vuna:247"));
  ("Frontend_dParser_dSupport.v_fileOf", ("Vuna.Compiler.Frontend.Parser.Support.fileOf", "Vuna/Compiler/Frontend/Parser/Support.vuna:32"));
  ("Frontend_dParser_dSupport.v_holeAtomAt", ("Vuna.Compiler.Frontend.Parser.Support.holeAtomAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:305"));
  ("Frontend_dParser_dSupport.v_isEof", ("Vuna.Compiler.Frontend.Parser.Support.isEof", "Vuna/Compiler/Frontend/Parser/Support.vuna:104"));
  ("Frontend_dParser_dSupport.v_isReservedValueName", ("Vuna.Compiler.Frontend.Parser.Support.isReservedValueName", "Vuna/Compiler/Frontend/Parser/Support.vuna:359"));
  ("Frontend_dParser_dSupport.v_isSyntaxSym", ("Vuna.Compiler.Frontend.Parser.Support.isSyntaxSym", "Vuna/Compiler/Frontend/Parser/Support.vuna:332"));
  ("Frontend_dParser_dSupport.v_lastPos", ("Vuna.Compiler.Frontend.Parser.Support.lastPos", "Vuna/Compiler/Frontend/Parser/Support.vuna:94"));
  ("Frontend_dParser_dSupport.v_minusLiteralAt", ("Vuna.Compiler.Frontend.Parser.Support.minusLiteralAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:387"));
  ("Frontend_dParser_dSupport.v_mkState", ("Vuna.Compiler.Frontend.Parser.Support.mkState", "Vuna/Compiler/Frontend/Parser/Support.vuna:40"));
  ("Frontend_dParser_dSupport.v_mkStateAt", ("Vuna.Compiler.Frontend.Parser.Support.mkStateAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:44"));
  ("Frontend_dParser_dSupport.v_nthTok", ("Vuna.Compiler.Frontend.Parser.Support.nthTok", "Vuna/Compiler/Frontend/Parser/Support.vuna:148"));
  ("Frontend_dParser_dSupport.v_peekPos", ("Vuna.Compiler.Frontend.Parser.Support.peekPos", "Vuna/Compiler/Frontend/Parser/Support.vuna:79"));
  ("Frontend_dParser_dSupport.v_peekTok", ("Vuna.Compiler.Frontend.Parser.Support.peekTok", "Vuna/Compiler/Frontend/Parser/Support.vuna:75"));
  ("Frontend_dParser_dSupport.v_peekTokAt", ("Vuna.Compiler.Frontend.Parser.Support.peekTokAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:152"));
  ("Frontend_dParser_dSupport.v_piArrowAhead", ("Vuna.Compiler.Frontend.Parser.Support.piArrowAhead", "Vuna/Compiler/Frontend/Parser/Support.vuna:197"));
  ("Frontend_dParser_dSupport.v_piArrowAheadGo", ("Vuna.Compiler.Frontend.Parser.Support.piArrowAheadGo", "Vuna/Compiler/Frontend/Parser/Support.vuna:200"));
  ("Frontend_dParser_dSupport.v_pmodeOf", ("Vuna.Compiler.Frontend.Parser.Support.pmodeOf", "Vuna/Compiler/Frontend/Parser/Support.vuna:36"));
  ("Frontend_dParser_dSupport.v_quantifiedHead", ("Vuna.Compiler.Frontend.Parser.Support.quantifiedHead", "Vuna/Compiler/Frontend/Parser/Support.vuna:185"));
  ("Frontend_dParser_dSupport.v_sameLineState", ("Vuna.Compiler.Frontend.Parser.Support.sameLineState", "Vuna/Compiler/Frontend/Parser/Support.vuna:136"));
  ("Frontend_dParser_dSupport.v_sectionOpAt", ("Vuna.Compiler.Frontend.Parser.Support.sectionOpAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:373"));
  ("Frontend_dParser_dSupport.v_spanOf", ("Vuna.Compiler.Frontend.Parser.Support.spanOf", "Vuna/Compiler/Frontend/Parser/Support.vuna:48"));
  ("Frontend_dParser_dSupport.v_startsAtom", ("Vuna.Compiler.Frontend.Parser.Support.startsAtom", "Vuna/Compiler/Frontend/Parser/Support.vuna:285"));
  ("Frontend_dParser_dSupport.v_startsPatternAtom", ("Vuna.Compiler.Frontend.Parser.Support.startsPatternAtom", "Vuna/Compiler/Frontend/Parser/Support.vuna:319"));
  ("Frontend_dParser_dSupport.v_stateFuel", ("Vuna.Compiler.Frontend.Parser.Support.stateFuel", "Vuna/Compiler/Frontend/Parser/Support.vuna:133"));
  ("Frontend_dParser_dSupport.v_terminatesExpression", ("Vuna.Compiler.Frontend.Parser.Support.terminatesExpression", "Vuna/Compiler/Frontend/Parser/Support.vuna:399"));
  ("Frontend_dParser_dSupport.v_tokSpan", ("Vuna.Compiler.Frontend.Parser.Support.tokSpan", "Vuna/Compiler/Frontend/Parser/Support.vuna:84"));
  ("Frontend_dParser_dSupport.v_tokTail", ("Vuna.Compiler.Frontend.Parser.Support.tokTail", "Vuna/Compiler/Frontend/Parser/Support.vuna:170"));
  ("Frontend_dParser_dSupport.v_tokenSpan", ("Vuna.Compiler.Frontend.Parser.Support.tokenSpan", "Vuna/Compiler/Frontend/Parser/Support.vuna:61"));
  ("Frontend_dParser_dSupport.v_underscoreCtorName", ("Vuna.Compiler.Frontend.Parser.Support.underscoreCtorName", "Vuna/Compiler/Frontend/Parser/Support.vuna:270"));
  ("Frontend_dParser_dSupport.v_upperFirst", ("Vuna.Compiler.Frontend.Parser.Support.upperFirst", "Vuna/Compiler/Frontend/Parser/Support.vuna:262"));
  ("Frontend_dRast.v__udeclCtors", ("Vuna.Compiler.Frontend.Rast._declCtors", "Vuna/Compiler/Frontend/Rast.vuna:392"));
  ("Frontend_dRast.v_appAtSyntax", ("Vuna.Compiler.Frontend.Rast.appAtSyntax", "Vuna/Compiler/Frontend/Rast.vuna:599"));
  ("Frontend_dRast.v_astTraitParamName", ("Vuna.Compiler.Frontend.Rast.astTraitParamName", "Vuna/Compiler/Frontend/Rast.vuna:838"));
  ("Frontend_dRast.v_bindersOfPats", ("Vuna.Compiler.Frontend.Rast.bindersOfPats", "Vuna/Compiler/Frontend/Rast.vuna:761"));
  ("Frontend_dRast.v_bindingBinders", ("Vuna.Compiler.Frontend.Rast.bindingBinders", "Vuna/Compiler/Frontend/Rast.vuna:835"));
  ("Frontend_dRast.v_clauseWeight", ("Vuna.Compiler.Frontend.Rast.clauseWeight", "Vuna/Compiler/Frontend/Rast.vuna:232"));
  ("Frontend_dRast.v_clausesFor", ("Vuna.Compiler.Frontend.Rast.clausesFor", "Vuna/Compiler/Frontend/Rast.vuna:315"));
  ("Frontend_dRast.v_collectClauses", ("Vuna.Compiler.Frontend.Rast.collectClauses", "Vuna/Compiler/Frontend/Rast.vuna:307"));
  ("Frontend_dRast.v_ctorArity", ("Vuna.Compiler.Frontend.Rast.ctorArity", "Vuna/Compiler/Frontend/Rast.vuna:357"));
  ("Frontend_dRast.v_ctorDisplayName", ("Vuna.Compiler.Frontend.Rast.ctorDisplayName", "Vuna/Compiler/Frontend/Rast.vuna:336"));
  ("Frontend_dRast.v_ctorName", ("Vuna.Compiler.Frontend.Rast.ctorName", "Vuna/Compiler/Frontend/Rast.vuna:324"));
  ("Frontend_dRast.v_ctorShortName", ("Vuna.Compiler.Frontend.Rast.ctorShortName", "Vuna/Compiler/Frontend/Rast.vuna:330"));
  ("Frontend_dRast.v_ctorSpan", ("Vuna.Compiler.Frontend.Rast.ctorSpan", "Vuna/Compiler/Frontend/Rast.vuna:282"));
  ("Frontend_dRast.v_ctorType", ("Vuna.Compiler.Frontend.Rast.ctorType", "Vuna/Compiler/Frontend/Rast.vuna:345"));
  ("Frontend_dRast.v_ctorsOf", ("Vuna.Compiler.Frontend.Rast.ctorsOf", "Vuna/Compiler/Frontend/Rast.vuna:398"));
  ("Frontend_dRast.v_declAllNames", ("Vuna.Compiler.Frontend.Rast.declAllNames", "Vuna/Compiler/Frontend/Rast.vuna:385"));
  ("Frontend_dRast.v_declDerivings", ("Vuna.Compiler.Frontend.Rast.declDerivings", "Vuna/Compiler/Frontend/Rast.vuna:410"));
  ("Frontend_dRast.v_declNames", ("Vuna.Compiler.Frontend.Rast.declNames", "Vuna/Compiler/Frontend/Rast.vuna:369"));
  ("Frontend_dRast.v_declSpan", ("Vuna.Compiler.Frontend.Rast.declSpan", "Vuna/Compiler/Frontend/Rast.vuna:272"));
  ("Frontend_dRast.v_declTypeNames", ("Vuna.Compiler.Frontend.Rast.declTypeNames", "Vuna/Compiler/Frontend/Rast.vuna:401"));
  ("Frontend_dRast.v_doBindSyntaxName", ("Vuna.Compiler.Frontend.Rast.doBindSyntaxName", "Vuna/Compiler/Frontend/Rast.vuna:649"));
  ("Frontend_dRast.v_doBindSyntaxPrefix", ("Vuna.Compiler.Frontend.Rast.doBindSyntaxPrefix", "Vuna/Compiler/Frontend/Rast.vuna:641"));
  ("Frontend_dRast.v_doIgnoreSyntaxName", ("Vuna.Compiler.Frontend.Rast.doIgnoreSyntaxName", "Vuna/Compiler/Frontend/Rast.vuna:653"));
  ("Frontend_dRast.v_doIgnoreSyntaxPrefix", ("Vuna.Compiler.Frontend.Rast.doIgnoreSyntaxPrefix", "Vuna/Compiler/Frontend/Rast.vuna:645"));
  ("Frontend_dRast.v_doStmtExpr", ("Vuna.Compiler.Frontend.Rast.doStmtExpr", "Vuna/Compiler/Frontend/Rast.vuna:268"));
  ("Frontend_dRast.v_doStmtSpan", ("Vuna.Compiler.Frontend.Rast.doStmtSpan", "Vuna/Compiler/Frontend/Rast.vuna:264"));
  ("Frontend_dRast.v_doStmtWeight", ("Vuna.Compiler.Frontend.Rast.doStmtWeight", "Vuna/Compiler/Frontend/Rast.vuna:240"));
  ("Frontend_dRast.v_doSyntaxCanonical", ("Vuna.Compiler.Frontend.Rast.doSyntaxCanonical", "Vuna/Compiler/Frontend/Rast.vuna:666"));
  ("Frontend_dRast.v_dropNChars", ("Vuna.Compiler.Frontend.Rast.dropNChars", "Vuna/Compiler/Frontend/Rast.vuna:453"));
  ("Frontend_dRast.v_dropNamePrefix", ("Vuna.Compiler.Frontend.Rast.dropNamePrefix", "Vuna/Compiler/Frontend/Rast.vuna:463"));
  ("Frontend_dRast.v_exportItemSpan", ("Vuna.Compiler.Frontend.Rast.exportItemSpan", "Vuna/Compiler/Frontend/Rast.vuna:300"));
  ("Frontend_dRast.v_exprBudget", ("Vuna.Compiler.Frontend.Rast.exprBudget", "Vuna/Compiler/Frontend/Rast.vuna:257"));
  ("Frontend_dRast.v_exprSpan", ("Vuna.Compiler.Frontend.Rast.exprSpan", "Vuna/Compiler/Frontend/Rast.vuna:150"));
  ("Frontend_dRast.v_exprWeight", ("Vuna.Compiler.Frontend.Rast.exprWeight", "Vuna/Compiler/Frontend/Rast.vuna:199"));
  ("Frontend_dRast.v_exprWeightFields", ("Vuna.Compiler.Frontend.Rast.exprWeightFields", "Vuna/Compiler/Frontend/Rast.vuna:236"));
  ("Frontend_dRast.v_exprWeightList", ("Vuna.Compiler.Frontend.Rast.exprWeightList", "Vuna/Compiler/Frontend/Rast.vuna:224"));
  ("Frontend_dRast.v_fieldName", ("Vuna.Compiler.Frontend.Rast.fieldName", "Vuna/Compiler/Frontend/Rast.vuna:288"));
  ("Frontend_dRast.v_fieldSpan", ("Vuna.Compiler.Frontend.Rast.fieldSpan", "Vuna/Compiler/Frontend/Rast.vuna:285"));
  ("Frontend_dRast.v_fieldType", ("Vuna.Compiler.Frontend.Rast.fieldType", "Vuna/Compiler/Frontend/Rast.vuna:291"));
  ("Frontend_dRast.v_funArity", ("Vuna.Compiler.Frontend.Rast.funArity", "Vuna/Compiler/Frontend/Rast.vuna:318"));
  ("Frontend_dRast.v_handleNoRetSyntax", ("Vuna.Compiler.Frontend.Rast.handleNoRetSyntax", "Vuna/Compiler/Frontend/Rast.vuna:578"));
  ("Frontend_dRast.v_handleSyntax", ("Vuna.Compiler.Frontend.Rast.handleSyntax", "Vuna/Compiler/Frontend/Rast.vuna:570"));
  ("Frontend_dRast.v_holeNameOf", ("Vuna.Compiler.Frontend.Rast.holeNameOf", "Vuna/Compiler/Frontend/Rast.vuna:431"));
  ("Frontend_dRast.v_holeNamed", ("Vuna.Compiler.Frontend.Rast.holeNamed", "Vuna/Compiler/Frontend/Rast.vuna:424"));
  ("Frontend_dRast.v_instArgSyntax", ("Vuna.Compiler.Frontend.Rast.instArgSyntax", "Vuna/Compiler/Frontend/Rast.vuna:608"));
  ("Frontend_dRast.v_internalNamePrefix", ("Vuna.Compiler.Frontend.Rast.internalNamePrefix", "Vuna/Compiler/Frontend/Rast.vuna:441"));
  ("Frontend_dRast.v_interpWeight", ("Vuna.Compiler.Frontend.Rast.interpWeight", "Vuna/Compiler/Frontend/Rast.vuna:248"));
  ("Frontend_dRast.v_isAppAtSyntax", ("Vuna.Compiler.Frontend.Rast.isAppAtSyntax", "Vuna/Compiler/Frontend/Rast.vuna:603"));
  ("Frontend_dRast.v_isDoBindSyntaxName", ("Vuna.Compiler.Frontend.Rast.isDoBindSyntaxName", "Vuna/Compiler/Frontend/Rast.vuna:657"));
  ("Frontend_dRast.v_isDoIgnoreSyntaxName", ("Vuna.Compiler.Frontend.Rast.isDoIgnoreSyntaxName", "Vuna/Compiler/Frontend/Rast.vuna:661"));
  ("Frontend_dRast.v_isHandleNoRetSyntax", ("Vuna.Compiler.Frontend.Rast.isHandleNoRetSyntax", "Vuna/Compiler/Frontend/Rast.vuna:582"));
  ("Frontend_dRast.v_isHandleSyntax", ("Vuna.Compiler.Frontend.Rast.isHandleSyntax", "Vuna/Compiler/Frontend/Rast.vuna:574"));
  ("Frontend_dRast.v_isHoleName", ("Vuna.Compiler.Frontend.Rast.isHoleName", "Vuna/Compiler/Frontend/Rast.vuna:421"));
  ("Frontend_dRast.v_isInstArgSyntax", ("Vuna.Compiler.Frontend.Rast.isInstArgSyntax", "Vuna/Compiler/Frontend/Rast.vuna:612"));
  ("Frontend_dRast.v_isInternalSyntaxName", ("Vuna.Compiler.Frontend.Rast.isInternalSyntaxName", "Vuna/Compiler/Frontend/Rast.vuna:449"));
  ("Frontend_dRast.v_isListConsSyntax", ("Vuna.Compiler.Frontend.Rast.isListConsSyntax", "Vuna/Compiler/Frontend/Rast.vuna:532"));
  ("Frontend_dRast.v_isListNilSyntax", ("Vuna.Compiler.Frontend.Rast.isListNilSyntax", "Vuna/Compiler/Frontend/Rast.vuna:528"));
  ("Frontend_dRast.v_isMacroSyntaxName", ("Vuna.Compiler.Frontend.Rast.isMacroSyntaxName", "Vuna/Compiler/Frontend/Rast.vuna:632"));
  ("Frontend_dRast.v_isOverCtorName", ("Vuna.Compiler.Frontend.Rast.isOverCtorName", "Vuna/Compiler/Frontend/Rast.vuna:492"));
  ("Frontend_dRast.v_isOverValueName", ("Vuna.Compiler.Frontend.Rast.isOverValueName", "Vuna/Compiler/Frontend/Rast.vuna:514"));
  ("Frontend_dRast.v_isPerformSyntax", ("Vuna.Compiler.Frontend.Rast.isPerformSyntax", "Vuna/Compiler/Frontend/Rast.vuna:558"));
  ("Frontend_dRast.v_isRowAtSyntax", ("Vuna.Compiler.Frontend.Rast.isRowAtSyntax", "Vuna/Compiler/Frontend/Rast.vuna:592"));
  ("Frontend_dRast.v_joinWithAt", ("Vuna.Compiler.Frontend.Rast.joinWithAt", "Vuna/Compiler/Frontend/Rast.vuna:468"));
  ("Frontend_dRast.v_listConsSyntax", ("Vuna.Compiler.Frontend.Rast.listConsSyntax", "Vuna/Compiler/Frontend/Rast.vuna:524"));
  ("Frontend_dRast.v_listNilSyntax", ("Vuna.Compiler.Frontend.Rast.listNilSyntax", "Vuna/Compiler/Frontend/Rast.vuna:520"));
  ("Frontend_dRast.v_lookupCtorArity", ("Vuna.Compiler.Frontend.Rast.lookupCtorArity", "Vuna/Compiler/Frontend/Rast.vuna:352"));
  ("Frontend_dRast.v_macroNameOf", ("Vuna.Compiler.Frontend.Rast.macroNameOf", "Vuna/Compiler/Frontend/Rast.vuna:636"));
  ("Frontend_dRast.v_macroSyntaxName", ("Vuna.Compiler.Frontend.Rast.macroSyntaxName", "Vuna/Compiler/Frontend/Rast.vuna:628"));
  ("Frontend_dRast.v_macroSyntaxPrefix", ("Vuna.Compiler.Frontend.Rast.macroSyntaxPrefix", "Vuna/Compiler/Frontend/Rast.vuna:624"));
  ("Frontend_dRast.v_nameOf", ("Vuna.Compiler.Frontend.Rast.nameOf", "Vuna/Compiler/Frontend/Rast.vuna:682"));
  ("Frontend_dRast.v_ofAlt", ("Vuna.Compiler.Frontend.Rast.ofAlt", "Vuna/Compiler/Frontend/Rast.vuna:809"));
  ("Frontend_dRast.v_ofBinding", ("Vuna.Compiler.Frontend.Rast.ofBinding", "Vuna/Compiler/Frontend/Rast.vuna:799"));
  ("Frontend_dRast.v_ofCtor", ("Vuna.Compiler.Frontend.Rast.ofCtor", "Vuna/Compiler/Frontend/Rast.vuna:725"));
  ("Frontend_dRast.v_ofDecl", ("Vuna.Compiler.Frontend.Rast.ofDecl", "Vuna/Compiler/Frontend/Rast.vuna:690"));
  ("Frontend_dRast.v_ofDecls", ("Vuna.Compiler.Frontend.Rast.ofDecls", "Vuna/Compiler/Frontend/Rast.vuna:686"));
  ("Frontend_dRast.v_ofExpr", ("Vuna.Compiler.Frontend.Rast.ofExpr", "Vuna/Compiler/Frontend/Rast.vuna:765"));
  ("Frontend_dRast.v_ofField", ("Vuna.Compiler.Frontend.Rast.ofField", "Vuna/Compiler/Frontend/Rast.vuna:728"));
  ("Frontend_dRast.v_ofFieldValue", ("Vuna.Compiler.Frontend.Rast.ofFieldValue", "Vuna/Compiler/Frontend/Rast.vuna:812"));
  ("Frontend_dRast.v_ofInterpPart", ("Vuna.Compiler.Frontend.Rast.ofInterpPart", "Vuna/Compiler/Frontend/Rast.vuna:815"));
  ("Frontend_dRast.v_ofLocalClause", ("Vuna.Compiler.Frontend.Rast.ofLocalClause", "Vuna/Compiler/Frontend/Rast.vuna:805"));
  ("Frontend_dRast.v_ofMaybeExpr", ("Vuna.Compiler.Frontend.Rast.ofMaybeExpr", "Vuna/Compiler/Frontend/Rast.vuna:844"));
  ("Frontend_dRast.v_ofPat", ("Vuna.Compiler.Frontend.Rast.ofPat", "Vuna/Compiler/Frontend/Rast.vuna:735"));
  ("Frontend_dRast.v_ofPatField", ("Vuna.Compiler.Frontend.Rast.ofPatField", "Vuna/Compiler/Frontend/Rast.vuna:746"));
  ("Frontend_dRast.v_ofStmts", ("Vuna.Compiler.Frontend.Rast.ofStmts", "Vuna/Compiler/Frontend/Rast.vuna:821"));
  ("Frontend_dRast.v_ofTraitMethod", ("Vuna.Compiler.Frontend.Rast.ofTraitMethod", "Vuna/Compiler/Frontend/Rast.vuna:731"));
  ("Frontend_dRast.v_ofTraitParam", ("Vuna.Compiler.Frontend.Rast.ofTraitParam", "Vuna/Compiler/Frontend/Rast.vuna:841"));
  ("Frontend_dRast.v_oneDoStmtWeight", ("Vuna.Compiler.Frontend.Rast.oneDoStmtWeight", "Vuna/Compiler/Frontend/Rast.vuna:244"));
  ("Frontend_dRast.v_oneInterpWeight", ("Vuna.Compiler.Frontend.Rast.oneInterpWeight", "Vuna/Compiler/Frontend/Rast.vuna:252"));
  ("Frontend_dRast.v_overCtorName", ("Vuna.Compiler.Frontend.Rast.overCtorName", "Vuna/Compiler/Frontend/Rast.vuna:474"));
  ("Frontend_dRast.v_overCtorPrefix", ("Vuna.Compiler.Frontend.Rast.overCtorPrefix", "Vuna/Compiler/Frontend/Rast.vuna:445"));
  ("Frontend_dRast.v_overCtorShort", ("Vuna.Compiler.Frontend.Rast.overCtorShort", "Vuna/Compiler/Frontend/Rast.vuna:478"));
  ("Frontend_dRast.v_overCtorTargets", ("Vuna.Compiler.Frontend.Rast.overCtorTargets", "Vuna/Compiler/Frontend/Rast.vuna:485"));
  ("Frontend_dRast.v_overValueName", ("Vuna.Compiler.Frontend.Rast.overValueName", "Vuna/Compiler/Frontend/Rast.vuna:499"));
  ("Frontend_dRast.v_overValuePrefix", ("Vuna.Compiler.Frontend.Rast.overValuePrefix", "Vuna/Compiler/Frontend/Rast.vuna:496"));
  ("Frontend_dRast.v_overValueShort", ("Vuna.Compiler.Frontend.Rast.overValueShort", "Vuna/Compiler/Frontend/Rast.vuna:502"));
  ("Frontend_dRast.v_overValueTargets", ("Vuna.Compiler.Frontend.Rast.overValueTargets", "Vuna/Compiler/Frontend/Rast.vuna:508"));
  ("Frontend_dRast.v_patBinders", ("Vuna.Compiler.Frontend.Rast.patBinders", "Vuna/Compiler/Frontend/Rast.vuna:750"));
  ("Frontend_dRast.v_patBudget", ("Vuna.Compiler.Frontend.Rast.patBudget", "Vuna/Compiler/Frontend/Rast.vuna:261"));
  ("Frontend_dRast.v_patExprWeight", ("Vuna.Compiler.Frontend.Rast.patExprWeight", "Vuna/Compiler/Frontend/Rast.vuna:228"));
  ("Frontend_dRast.v_patFieldBinders", ("Vuna.Compiler.Frontend.Rast.patFieldBinders", "Vuna/Compiler/Frontend/Rast.vuna:832"));
  ("Frontend_dRast.v_patSpan", ("Vuna.Compiler.Frontend.Rast.patSpan", "Vuna/Compiler/Frontend/Rast.vuna:141"));
  ("Frontend_dRast.v_patWeight", ("Vuna.Compiler.Frontend.Rast.patWeight", "Vuna/Compiler/Frontend/Rast.vuna:180"));
  ("Frontend_dRast.v_patWeightFields", ("Vuna.Compiler.Frontend.Rast.patWeightFields", "Vuna/Compiler/Frontend/Rast.vuna:193"));
  ("Frontend_dRast.v_patWeightList", ("Vuna.Compiler.Frontend.Rast.patWeightList", "Vuna/Compiler/Frontend/Rast.vuna:189"));
  ("Frontend_dRast.v_performSyntax", ("Vuna.Compiler.Frontend.Rast.performSyntax", "Vuna/Compiler/Frontend/Rast.vuna:554"));
  ("Frontend_dRast.v_rowAtSyntax", ("Vuna.Compiler.Frontend.Rast.rowAtSyntax", "Vuna/Compiler/Frontend/Rast.vuna:588"));
  ("Frontend_dRast.v_topNames", ("Vuna.Compiler.Frontend.Rast.topNames", "Vuna/Compiler/Frontend/Rast.vuna:382"));
  ("Frontend_dRast.v_traitMethodName", ("Vuna.Compiler.Frontend.Rast.traitMethodName", "Vuna/Compiler/Frontend/Rast.vuna:294"));
  ("Frontend_dRast.v_traitMethodSpan", ("Vuna.Compiler.Frontend.Rast.traitMethodSpan", "Vuna/Compiler/Frontend/Rast.vuna:297"));
  ("Frontend_dRast.v_typeArity", ("Vuna.Compiler.Frontend.Rast.typeArity", "Vuna/Compiler/Frontend/Rast.vuna:348"));
  ("Frontend_dRast.v_typeNamesOf", ("Vuna.Compiler.Frontend.Rast.typeNamesOf", "Vuna/Compiler/Frontend/Rast.vuna:407"));
  ("Frontend_dRast_dBridge.v_maybeMap", ("Vuna.Compiler.Frontend.Rast.Bridge.maybeMap", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:132"));
  ("Frontend_dRast_dBridge.v_toAstAlt", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstAlt", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:56"));
  ("Frontend_dRast_dBridge.v_toAstBinding", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstBinding", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:50"));
  ("Frontend_dRast_dBridge.v_toAstCtor", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstCtor", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:120"));
  ("Frontend_dRast_dBridge.v_toAstDecl", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstDecl", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:99"));
  ("Frontend_dRast_dBridge.v_toAstDecls", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstDecls", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:96"));
  ("Frontend_dRast_dBridge.v_toAstExpr", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstExpr", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:14"));
  ("Frontend_dRast_dBridge.v_toAstField", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstField", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:123"));
  ("Frontend_dRast_dBridge.v_toAstFieldValue", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstFieldValue", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:59"));
  ("Frontend_dRast_dBridge.v_toAstInterpPart", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstInterpPart", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:44"));
  ("Frontend_dRast_dBridge.v_toAstLocalClause", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstLocalClause", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:53"));
  ("Frontend_dRast_dBridge.v_toAstPat", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstPat", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:68"));
  ("Frontend_dRast_dBridge.v_toAstPatField", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstPatField", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:80"));
  ("Frontend_dRast_dBridge.v_toAstStmt", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstStmt", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:62"));
  ("Frontend_dRast_dBridge.v_toAstTraitMethod", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstTraitMethod", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:129"));
  ("Frontend_dRast_dBridge.v_toAstTraitParam", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstTraitParam", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:126"));
  ("Frontend_dRast_dBridge.v_toRastDecl", ("Vuna.Compiler.Frontend.Rast.Bridge.toRastDecl", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:92"));
  ("Frontend_dRast_dBridge.v_toRastDecls", ("Vuna.Compiler.Frontend.Rast.Bridge.toRastDecls", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:88"));
  ("Frontend_dRast_dBridge.v_toRastExpr", ("Vuna.Compiler.Frontend.Rast.Bridge.toRastExpr", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:84"));
  ("Frontend_dRast_dBridge.v_toRastPat", ("Vuna.Compiler.Frontend.Rast.Bridge.toRastPat", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:137"));
  ("Frontend_dRast_dBridge.v_toRastPatField", ("Vuna.Compiler.Frontend.Rast.Bridge.toRastPatField", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:149"));
  ("Frontend_dRast_dName.v_classifyName", ("Vuna.Compiler.Frontend.Rast.Name.classifyName", "Vuna/Compiler/Frontend/Rast/Name.vuna:69"));
  ("Frontend_dRast_dName.v_hasIntrinsic", ("Vuna.Compiler.Frontend.Rast.Name.hasIntrinsic", "Vuna/Compiler/Frontend/Rast/Name.vuna:87"));
  ("Frontend_dRast_dName.v_isCompilerModulePrefix", ("Vuna.Compiler.Frontend.Rast.Name.isCompilerModulePrefix", "Vuna/Compiler/Frontend/Rast/Name.vuna:63"));
  ("Frontend_dRast_dName.v_isPreludeName", ("Vuna.Compiler.Frontend.Rast.Name.isPreludeName", "Vuna/Compiler/Frontend/Rast/Name.vuna:109"));
  ("Frontend_dRast_dName.v_lastDotAt", ("Vuna.Compiler.Frontend.Rast.Name.lastDotAt", "Vuna/Compiler/Frontend/Rast/Name.vuna:102"));
  ("Frontend_dRast_dName.v_rnameBase", ("Vuna.Compiler.Frontend.Rast.Name.rnameBase", "Vuna/Compiler/Frontend/Rast/Name.vuna:57"));
  ("Frontend_dRast_dName.v_rnameIsGlobal", ("Vuna.Compiler.Frontend.Rast.Name.rnameIsGlobal", "Vuna/Compiler/Frontend/Rast/Name.vuna:32"));
  ("Frontend_dRast_dName.v_rnameIsHole", ("Vuna.Compiler.Frontend.Rast.Name.rnameIsHole", "Vuna/Compiler/Frontend/Rast/Name.vuna:47"));
  ("Frontend_dRast_dName.v_rnameIsIntrinsic", ("Vuna.Compiler.Frontend.Rast.Name.rnameIsIntrinsic", "Vuna/Compiler/Frontend/Rast/Name.vuna:37"));
  ("Frontend_dRast_dName.v_rnameIsMacro", ("Vuna.Compiler.Frontend.Rast.Name.rnameIsMacro", "Vuna/Compiler/Frontend/Rast/Name.vuna:42"));
  ("Frontend_dRast_dName.v_rnameKey", ("Vuna.Compiler.Frontend.Rast.Name.rnameKey", "Vuna/Compiler/Frontend/Rast/Name.vuna:24"));
  ("Frontend_dRast_dName.v_rnameModule", ("Vuna.Compiler.Frontend.Rast.Name.rnameModule", "Vuna/Compiler/Frontend/Rast/Name.vuna:52"));
  ("Frontend_dRast_dName.v_splitGlobalKey", ("Vuna.Compiler.Frontend.Rast.Name.splitGlobalKey", "Vuna/Compiler/Frontend/Rast/Name.vuna:94"));
  ("Frontend_dToml.v_TomlDoc", ("Vuna.Compiler.Frontend.Toml.TomlDoc", "Vuna/Compiler/Frontend/Toml.vuna:47"));
  ("Frontend_dToml.v_advanceChars", ("Vuna.Compiler.Frontend.Toml.advanceChars", "Vuna/Compiler/Frontend/Toml.vuna:142"));
  ("Frontend_dToml.v_advanceCursor", ("Vuna.Compiler.Frontend.Toml.advanceCursor", "Vuna/Compiler/Frontend/Toml.vuna:101"));
  ("Frontend_dToml.v_afterDoubleBracket", ("Vuna.Compiler.Frontend.Toml.afterDoubleBracket", "Vuna/Compiler/Frontend/Toml.vuna:903"));
  ("Frontend_dToml.v_afterSingleBracket", ("Vuna.Compiler.Frontend.Toml.afterSingleBracket", "Vuna/Compiler/Frontend/Toml.vuna:876"));
  ("Frontend_dToml.v_appendPath", ("Vuna.Compiler.Frontend.Toml.appendPath", "Vuna/Compiler/Frontend/Toml.vuna:158"));
  ("Frontend_dToml.v_appendTableArray", ("Vuna.Compiler.Frontend.Toml.appendTableArray", "Vuna/Compiler/Frontend/Toml.vuna:236"));
  ("Frontend_dToml.v_arrayStrings", ("Vuna.Compiler.Frontend.Toml.arrayStrings", "Vuna/Compiler/Frontend/Toml.vuna:1003"));
  ("Frontend_dToml.v_childSectionOf", ("Vuna.Compiler.Frontend.Toml.childSectionOf", "Vuna/Compiler/Frontend/Toml.vuna:1039"));
  ("Frontend_dToml.v_collectBareKey", ("Vuna.Compiler.Frontend.Toml.collectBareKey", "Vuna/Compiler/Frontend/Toml.vuna:582"));
  ("Frontend_dToml.v_countLines", ("Vuna.Compiler.Frontend.Toml.countLines", "Vuna/Compiler/Frontend/Toml.vuna:89"));
  ("Frontend_dToml.v_cursorFuel", ("Vuna.Compiler.Frontend.Toml.cursorFuel", "Vuna/Compiler/Frontend/Toml.vuna:82"));
  ("Frontend_dToml.v_dropChars", ("Vuna.Compiler.Frontend.Toml.dropChars", "Vuna/Compiler/Frontend/Toml.vuna:132"));
  ("Frontend_dToml.v_dropFirstNewline", ("Vuna.Compiler.Frontend.Toml.dropFirstNewline", "Vuna/Compiler/Frontend/Toml.vuna:517"));
  ("Frontend_dToml.v_duplicateKeyMsg", ("Vuna.Compiler.Frontend.Toml.duplicateKeyMsg", "Vuna/Compiler/Frontend/Toml.vuna:279"));
  ("Frontend_dToml.v_ensureTable", ("Vuna.Compiler.Frontend.Toml.ensureTable", "Vuna/Compiler/Frontend/Toml.vuna:200"));
  ("Frontend_dToml.v_expectEol", ("Vuna.Compiler.Frontend.Toml.expectEol", "Vuna/Compiler/Frontend/Toml.vuna:837"));
  ("Frontend_dToml.v_expectEolAfterComment", ("Vuna.Compiler.Frontend.Toml.expectEolAfterComment", "Vuna/Compiler/Frontend/Toml.vuna:849"));
  ("Frontend_dToml.v_failAt", ("Vuna.Compiler.Frontend.Toml.failAt", "Vuna/Compiler/Frontend/Toml.vuna:155"));
  ("Frontend_dToml.v_fieldValues", ("Vuna.Compiler.Frontend.Toml.fieldValues", "Vuna/Compiler/Frontend/Toml.vuna:365"));
  ("Frontend_dToml.v_finishInteger", ("Vuna.Compiler.Frontend.Toml.finishInteger", "Vuna/Compiler/Frontend/Toml.vuna:801"));
  ("Frontend_dToml.v_flattenElems", ("Vuna.Compiler.Frontend.Toml.flattenElems", "Vuna/Compiler/Frontend/Toml.vuna:337"));
  ("Frontend_dToml.v_flattenFields", ("Vuna.Compiler.Frontend.Toml.flattenFields", "Vuna/Compiler/Frontend/Toml.vuna:325"));
  ("Frontend_dToml.v_flattenFuel", ("Vuna.Compiler.Frontend.Toml.flattenFuel", "Vuna/Compiler/Frontend/Toml.vuna:98"));
  ("Frontend_dToml.v_flattenLeaf", ("Vuna.Compiler.Frontend.Toml.flattenLeaf", "Vuna/Compiler/Frontend/Toml.vuna:345"));
  ("Frontend_dToml.v_flattenLeafFields", ("Vuna.Compiler.Frontend.Toml.flattenLeafFields", "Vuna/Compiler/Frontend/Toml.vuna:352"));
  ("Frontend_dToml.v_flattenNode", ("Vuna.Compiler.Frontend.Toml.flattenNode", "Vuna/Compiler/Frontend/Toml.vuna:332"));
  ("Frontend_dToml.v_hexValue", ("Vuna.Compiler.Frontend.Toml.hexValue", "Vuna/Compiler/Frontend/Toml.vuna:125"));
  ("Frontend_dToml.v_insertValue", ("Vuna.Compiler.Frontend.Toml.insertValue", "Vuna/Compiler/Frontend/Toml.vuna:287"));
  ("Frontend_dToml.v_isAlphaChar", ("Vuna.Compiler.Frontend.Toml.isAlphaChar", "Vuna/Compiler/Frontend/Toml.vuna:116"));
  ("Frontend_dToml.v_isBareKeyChar", ("Vuna.Compiler.Frontend.Toml.isBareKeyChar", "Vuna/Compiler/Frontend/Toml.vuna:119"));
  ("Frontend_dToml.v_isBlankChar", ("Vuna.Compiler.Frontend.Toml.isBlankChar", "Vuna/Compiler/Frontend/Toml.vuna:128"));
  ("Frontend_dToml.v_isDigitChar", ("Vuna.Compiler.Frontend.Toml.isDigitChar", "Vuna/Compiler/Frontend/Toml.vuna:107"));
  ("Frontend_dToml.v_isHexDigit", ("Vuna.Compiler.Frontend.Toml.isHexDigit", "Vuna/Compiler/Frontend/Toml.vuna:122"));
  ("Frontend_dToml.v_isLowerAlphaChar", ("Vuna.Compiler.Frontend.Toml.isLowerAlphaChar", "Vuna/Compiler/Frontend/Toml.vuna:113"));
  ("Frontend_dToml.v_isSurrogate", ("Vuna.Compiler.Frontend.Toml.isSurrogate", "Vuna/Compiler/Frontend/Toml.vuna:423"));
  ("Frontend_dToml.v_isUpperAlphaChar", ("Vuna.Compiler.Frontend.Toml.isUpperAlphaChar", "Vuna/Compiler/Frontend/Toml.vuna:110"));
  ("Frontend_dToml.v_kindIsDotted", ("Vuna.Compiler.Frontend.Toml.kindIsDotted", "Vuna/Compiler/Frontend/Toml.vuna:194"));
  ("Frontend_dToml.v_kindIsExplicit", ("Vuna.Compiler.Frontend.Toml.kindIsExplicit", "Vuna/Compiler/Frontend/Toml.vuna:190"));
  ("Frontend_dToml.v_lastFields", ("Vuna.Compiler.Frontend.Toml.lastFields", "Vuna/Compiler/Frontend/Toml.vuna:180"));
  ("Frontend_dToml.v_lenInt", ("Vuna.Compiler.Frontend.Toml.lenInt", "Vuna/Compiler/Frontend/Toml.vuna:77"));
  ("Frontend_dToml.v_lineFuel", ("Vuna.Compiler.Frontend.Toml.lineFuel", "Vuna/Compiler/Frontend/Toml.vuna:86"));
  ("Frontend_dToml.v_lookupEntry", ("Vuna.Compiler.Frontend.Toml.lookupEntry", "Vuna/Compiler/Frontend/Toml.vuna:1011"));
  ("Frontend_dToml.v_lookupEntryLine", ("Vuna.Compiler.Frontend.Toml.lookupEntryLine", "Vuna/Compiler/Frontend/Toml.vuna:1016"));
  ("Frontend_dToml.v_lookupField", ("Vuna.Compiler.Frontend.Toml.lookupField", "Vuna/Compiler/Frontend/Toml.vuna:170"));
  ("Frontend_dToml.v_makeInteger", ("Vuna.Compiler.Frontend.Toml.makeInteger", "Vuna/Compiler/Frontend/Toml.vuna:810"));
  ("Frontend_dToml.v_matchChars", ("Vuna.Compiler.Frontend.Toml.matchChars", "Vuna/Compiler/Frontend/Toml.vuna:821"));
  ("Frontend_dToml.v_matchWord", ("Vuna.Compiler.Frontend.Toml.matchWord", "Vuna/Compiler/Frontend/Toml.vuna:827"));
  ("Frontend_dToml.v_nodeValue", ("Vuna.Compiler.Frontend.Toml.nodeValue", "Vuna/Compiler/Frontend/Toml.vuna:360"));
  ("Frontend_dToml.v_parseArrayItems", ("Vuna.Compiler.Frontend.Toml.parseArrayItems", "Vuna/Compiler/Frontend/Toml.vuna:705"));
  ("Frontend_dToml.v_parseArrayValue", ("Vuna.Compiler.Frontend.Toml.parseArrayValue", "Vuna/Compiler/Frontend/Toml.vuna:696"));
  ("Frontend_dToml.v_parseBareKey", ("Vuna.Compiler.Frontend.Toml.parseBareKey", "Vuna/Compiler/Frontend/Toml.vuna:590"));
  ("Frontend_dToml.v_parseBasicChars", ("Vuna.Compiler.Frontend.Toml.parseBasicChars", "Vuna/Compiler/Frontend/Toml.vuna:434"));
  ("Frontend_dToml.v_parseBasicEscape", ("Vuna.Compiler.Frontend.Toml.parseBasicEscape", "Vuna/Compiler/Frontend/Toml.vuna:448"));
  ("Frontend_dToml.v_parseBasicString", ("Vuna.Compiler.Frontend.Toml.parseBasicString", "Vuna/Compiler/Frontend/Toml.vuna:428"));
  ("Frontend_dToml.v_parseBracketLine", ("Vuna.Compiler.Frontend.Toml.parseBracketLine", "Vuna/Compiler/Frontend/Toml.vuna:969"));
  ("Frontend_dToml.v_parseEntryValue", ("Vuna.Compiler.Frontend.Toml.parseEntryValue", "Vuna/Compiler/Frontend/Toml.vuna:921"));
  ("Frontend_dToml.v_parseHexCode", ("Vuna.Compiler.Frontend.Toml.parseHexCode", "Vuna/Compiler/Frontend/Toml.vuna:478"));
  ("Frontend_dToml.v_parseInlineFields", ("Vuna.Compiler.Frontend.Toml.parseInlineFields", "Vuna/Compiler/Frontend/Toml.vuna:737"));
  ("Frontend_dToml.v_parseInlineTable", ("Vuna.Compiler.Frontend.Toml.parseInlineTable", "Vuna/Compiler/Frontend/Toml.vuna:728"));
  ("Frontend_dToml.v_parseIntValue", ("Vuna.Compiler.Frontend.Toml.parseIntValue", "Vuna/Compiler/Frontend/Toml.vuna:814"));
  ("Frontend_dToml.v_parseInteger", ("Vuna.Compiler.Frontend.Toml.parseInteger", "Vuna/Compiler/Frontend/Toml.vuna:774"));
  ("Frontend_dToml.v_parseIntegerDigits", ("Vuna.Compiler.Frontend.Toml.parseIntegerDigits", "Vuna/Compiler/Frontend/Toml.vuna:786"));
  ("Frontend_dToml.v_parseKeyLine", ("Vuna.Compiler.Frontend.Toml.parseKeyLine", "Vuna/Compiler/Frontend/Toml.vuna:938"));
  ("Frontend_dToml.v_parseKeyPath", ("Vuna.Compiler.Frontend.Toml.parseKeyPath", "Vuna/Compiler/Frontend/Toml.vuna:620"));
  ("Frontend_dToml.v_parseKeySegment", ("Vuna.Compiler.Frontend.Toml.parseKeySegment", "Vuna/Compiler/Frontend/Toml.vuna:601"));
  ("Frontend_dToml.v_parseKeySegments", ("Vuna.Compiler.Frontend.Toml.parseKeySegments", "Vuna/Compiler/Frontend/Toml.vuna:623"));
  ("Frontend_dToml.v_parseLiteralChars", ("Vuna.Compiler.Frontend.Toml.parseLiteralChars", "Vuna/Compiler/Frontend/Toml.vuna:496"));
  ("Frontend_dToml.v_parseLiteralString", ("Vuna.Compiler.Frontend.Toml.parseLiteralString", "Vuna/Compiler/Frontend/Toml.vuna:490"));
  ("Frontend_dToml.v_parseMultilineBasic", ("Vuna.Compiler.Frontend.Toml.parseMultilineBasic", "Vuna/Compiler/Frontend/Toml.vuna:511"));
  ("Frontend_dToml.v_parseMultilineBasicChars", ("Vuna.Compiler.Frontend.Toml.parseMultilineBasicChars", "Vuna/Compiler/Frontend/Toml.vuna:522"));
  ("Frontend_dToml.v_parseMultilineEscape", ("Vuna.Compiler.Frontend.Toml.parseMultilineEscape", "Vuna/Compiler/Frontend/Toml.vuna:537"));
  ("Frontend_dToml.v_parseMultilineLiteral", ("Vuna.Compiler.Frontend.Toml.parseMultilineLiteral", "Vuna/Compiler/Frontend/Toml.vuna:562"));
  ("Frontend_dToml.v_parseMultilineLiteralChars", ("Vuna.Compiler.Frontend.Toml.parseMultilineLiteralChars", "Vuna/Compiler/Frontend/Toml.vuna:568"));
  ("Frontend_dToml.v_parseMultilineValue", ("Vuna.Compiler.Frontend.Toml.parseMultilineValue", "Vuna/Compiler/Frontend/Toml.vuna:682"));
  ("Frontend_dToml.v_parseSectionLine", ("Vuna.Compiler.Frontend.Toml.parseSectionLine", "Vuna/Compiler/Frontend/Toml.vuna:862"));
  ("Frontend_dToml.v_parseSingleStringValue", ("Vuna.Compiler.Frontend.Toml.parseSingleStringValue", "Vuna/Compiler/Frontend/Toml.vuna:667"));
  ("Frontend_dToml.v_parseTableArrayLine", ("Vuna.Compiler.Frontend.Toml.parseTableArrayLine", "Vuna/Compiler/Frontend/Toml.vuna:889"));
  ("Frontend_dToml.v_parseToml", ("Vuna.Compiler.Frontend.Toml.parseToml", "Vuna/Compiler/Frontend/Toml.vuna:982"));
  ("Frontend_dToml.v_parseTomlAt", ("Vuna.Compiler.Frontend.Toml.parseTomlAt", "Vuna/Compiler/Frontend/Toml.vuna:985"));
  ("Frontend_dToml.v_parseTomlDoc", ("Vuna.Compiler.Frontend.Toml.parseTomlDoc", "Vuna/Compiler/Frontend/Toml.vuna:994"));
  ("Frontend_dToml.v_parseTomlLoop", ("Vuna.Compiler.Frontend.Toml.parseTomlLoop", "Vuna/Compiler/Frontend/Toml.vuna:952"));
  ("Frontend_dToml.v_parseTomlLoopAt", ("Vuna.Compiler.Frontend.Toml.parseTomlLoopAt", "Vuna/Compiler/Frontend/Toml.vuna:959"));
  ("Frontend_dToml.v_parseUnicodeEscape", ("Vuna.Compiler.Frontend.Toml.parseUnicodeEscape", "Vuna/Compiler/Frontend/Toml.vuna:468"));
  ("Frontend_dToml.v_parseValue", ("Vuna.Compiler.Frontend.Toml.parseValue", "Vuna/Compiler/Frontend/Toml.vuna:638"));
  ("Frontend_dToml.v_pathFuel", ("Vuna.Compiler.Frontend.Toml.pathFuel", "Vuna/Compiler/Frontend/Toml.vuna:94"));
  ("Frontend_dToml.v_replaceField", ("Vuna.Compiler.Frontend.Toml.replaceField", "Vuna/Compiler/Frontend/Toml.vuna:174"));
  ("Frontend_dToml.v_replaceLastFields", ("Vuna.Compiler.Frontend.Toml.replaceLastFields", "Vuna/Compiler/Frontend/Toml.vuna:185"));
  ("Frontend_dToml.v_rootValue", ("Vuna.Compiler.Frontend.Toml.rootValue", "Vuna/Compiler/Frontend/Toml.vuna:374"));
  ("Frontend_dToml.v_samePath", ("Vuna.Compiler.Frontend.Toml.samePath", "Vuna/Compiler/Frontend/Toml.vuna:1063"));
  ("Frontend_dToml.v_sectionOfPath", ("Vuna.Compiler.Frontend.Toml.sectionOfPath", "Vuna/Compiler/Frontend/Toml.vuna:273"));
  ("Frontend_dToml.v_sectionsUnder", ("Vuna.Compiler.Frontend.Toml.sectionsUnder", "Vuna/Compiler/Frontend/Toml.vuna:1022"));
  ("Frontend_dToml.v_sectionsUnderGo", ("Vuna.Compiler.Frontend.Toml.sectionsUnderGo", "Vuna/Compiler/Frontend/Toml.vuna:1025"));
  ("Frontend_dToml.v_skipBlank", ("Vuna.Compiler.Frontend.Toml.skipBlank", "Vuna/Compiler/Frontend/Toml.vuna:379"));
  ("Frontend_dToml.v_skipComment", ("Vuna.Compiler.Frontend.Toml.skipComment", "Vuna/Compiler/Frontend/Toml.vuna:388"));
  ("Frontend_dToml.v_skipContinuation", ("Vuna.Compiler.Frontend.Toml.skipContinuation", "Vuna/Compiler/Frontend/Toml.vuna:551"));
  ("Frontend_dToml.v_skipGap", ("Vuna.Compiler.Frontend.Toml.skipGap", "Vuna/Compiler/Frontend/Toml.vuna:394"));
  ("Frontend_dToml.v_skipGapGo", ("Vuna.Compiler.Frontend.Toml.skipGapGo", "Vuna/Compiler/Frontend/Toml.vuna:397"));
  ("Frontend_dToml.v_splitAtList", ("Vuna.Compiler.Frontend.Toml.splitAtList", "Vuna/Compiler/Frontend/Toml.vuna:1051"));
  ("Frontend_dToml.v_splitLast", ("Vuna.Compiler.Frontend.Toml.splitLast", "Vuna/Compiler/Frontend/Toml.vuna:161"));
  ("Frontend_dToml.v_startsWithTripleOf", ("Vuna.Compiler.Frontend.Toml.startsWithTripleOf", "Vuna/Compiler/Frontend/Toml.vuna:146"));
  ("Frontend_dToml.v_stripCR", ("Vuna.Compiler.Frontend.Toml.stripCR", "Vuna/Compiler/Frontend/Toml.vuna:151"));
  ("Frontend_dToml.v_tableFields", ("Vuna.Compiler.Frontend.Toml.tableFields", "Vuna/Compiler/Frontend/Toml.vuna:370"));
  ("Frontend_dToml.v_utf8OfCode", ("Vuna.Compiler.Frontend.Toml.utf8OfCode", "Vuna/Compiler/Frontend/Toml.vuna:412"));
  ("Ir_dAnalysis.v_addAllNames", ("Vuna.Compiler.Ir.Analysis.addAllNames", "Vuna/Compiler/Ir/Analysis.vuna:130"));
  ("Ir_dAnalysis.v_addDependents", ("Vuna.Compiler.Ir.Analysis.addDependents", "Vuna/Compiler/Ir/Analysis.vuna:31"));
  ("Ir_dAnalysis.v_addReverseEdges", ("Vuna.Compiler.Ir.Analysis.addReverseEdges", "Vuna/Compiler/Ir/Analysis.vuna:220"));
  ("Ir_dAnalysis.v_adjTblOf", ("Vuna.Compiler.Ir.Analysis.adjTblOf", "Vuna/Compiler/Ir/Analysis.vuna:28"));
  ("Ir_dAnalysis.v_allCovered", ("Vuna.Compiler.Ir.Analysis.allCovered", "Vuna/Compiler/Ir/Analysis.vuna:296"));
  ("Ir_dAnalysis.v_anyMentions", ("Vuna.Compiler.Ir.Analysis.anyMentions", "Vuna/Compiler/Ir/Analysis.vuna:512"));
  ("Ir_dAnalysis.v_anyMentionsAltM", ("Vuna.Compiler.Ir.Analysis.anyMentionsAltM", "Vuna/Compiler/Ir/Analysis.vuna:526"));
  ("Ir_dAnalysis.v_anyMentionsAlts", ("Vuna.Compiler.Ir.Analysis.anyMentionsAlts", "Vuna/Compiler/Ir/Analysis.vuna:521"));
  ("Ir_dAnalysis.v_anyMentionsFields", ("Vuna.Compiler.Ir.Analysis.anyMentionsFields", "Vuna/Compiler/Ir/Analysis.vuna:516"));
  ("Ir_dAnalysis.v_assembleGo", ("Vuna.Compiler.Ir.Analysis.assembleGo", "Vuna/Compiler/Ir/Analysis.vuna:466"));
  ("Ir_dAnalysis.v_assembleGroupNames", ("Vuna.Compiler.Ir.Analysis.assembleGroupNames", "Vuna/Compiler/Ir/Analysis.vuna:458"));
  ("Ir_dAnalysis.v_assembleGroups", ("Vuna.Compiler.Ir.Analysis.assembleGroups", "Vuna/Compiler/Ir/Analysis.vuna:329"));
  ("Ir_dAnalysis.v_checkGroupsCover", ("Vuna.Compiler.Ir.Analysis.checkGroupsCover", "Vuna/Compiler/Ir/Analysis.vuna:287"));
  ("Ir_dAnalysis.v_checkUniqueDefNames", ("Vuna.Compiler.Ir.Analysis.checkUniqueDefNames", "Vuna/Compiler/Ir/Analysis.vuna:442"));
  ("Ir_dAnalysis.v_checkUniqueDefNamesGo", ("Vuna.Compiler.Ir.Analysis.checkUniqueDefNamesGo", "Vuna/Compiler/Ir/Analysis.vuna:445"));
  ("Ir_dAnalysis.v_collectComps", ("Vuna.Compiler.Ir.Analysis.collectComps", "Vuna/Compiler/Ir/Analysis.vuna:116"));
  ("Ir_dAnalysis.v_componentTblOf", ("Vuna.Compiler.Ir.Analysis.componentTblOf", "Vuna/Compiler/Ir/Analysis.vuna:126"));
  ("Ir_dAnalysis.v_countList", ("Vuna.Compiler.Ir.Analysis.countList", "Vuna/Compiler/Ir/Analysis.vuna:366"));
  ("Ir_dAnalysis.v_depEdgeCount", ("Vuna.Compiler.Ir.Analysis.depEdgeCount", "Vuna/Compiler/Ir/Analysis.vuna:363"));
  ("Ir_dAnalysis.v_dfsCollect", ("Vuna.Compiler.Ir.Analysis.dfsCollect", "Vuna/Compiler/Ir/Analysis.vuna:105"));
  ("Ir_dAnalysis.v_dfsCollectFuel", ("Vuna.Compiler.Ir.Analysis.dfsCollectFuel", "Vuna/Compiler/Ir/Analysis.vuna:108"));
  ("Ir_dAnalysis.v_dfsPost", ("Vuna.Compiler.Ir.Analysis.dfsPost", "Vuna/Compiler/Ir/Analysis.vuna:65"));
  ("Ir_dAnalysis.v_dfsPostFuel", ("Vuna.Compiler.Ir.Analysis.dfsPostFuel", "Vuna/Compiler/Ir/Analysis.vuna:68"));
  ("Ir_dAnalysis.v_filterNames", ("Vuna.Compiler.Ir.Analysis.filterNames", "Vuna/Compiler/Ir/Analysis.vuna:157"));
  ("Ir_dAnalysis.v_findDefByName", ("Vuna.Compiler.Ir.Analysis.findDefByName", "Vuna/Compiler/Ir/Analysis.vuna:316"));
  ("Ir_dAnalysis.v_firstBadRecName", ("Vuna.Compiler.Ir.Analysis.firstBadRecName", "Vuna/Compiler/Ir/Analysis.vuna:482"));
  ("Ir_dAnalysis.v_firstBadRecursiveValue", ("Vuna.Compiler.Ir.Analysis.firstBadRecursiveValue", "Vuna/Compiler/Ir/Analysis.vuna:308"));
  ("Ir_dAnalysis.v_flattenApp", ("Vuna.Compiler.Ir.Analysis.flattenApp", "Vuna/Compiler/Ir/Analysis.vuna:426"));
  ("Ir_dAnalysis.v_foldNeighborsCollect", ("Vuna.Compiler.Ir.Analysis.foldNeighborsCollect", "Vuna/Compiler/Ir/Analysis.vuna:88"));
  ("Ir_dAnalysis.v_foldNeighborsCollectFuel", ("Vuna.Compiler.Ir.Analysis.foldNeighborsCollectFuel", "Vuna/Compiler/Ir/Analysis.vuna:91"));
  ("Ir_dAnalysis.v_foldNeighborsPost", ("Vuna.Compiler.Ir.Analysis.foldNeighborsPost", "Vuna/Compiler/Ir/Analysis.vuna:48"));
  ("Ir_dAnalysis.v_foldNeighborsPostFuel", ("Vuna.Compiler.Ir.Analysis.foldNeighborsPostFuel", "Vuna/Compiler/Ir/Analysis.vuna:51"));
  ("Ir_dAnalysis.v_groupDefsOf", ("Vuna.Compiler.Ir.Analysis.groupDefsOf", "Vuna/Compiler/Ir/Analysis.vuna:320"));
  ("Ir_dAnalysis.v_groupDepIdx", ("Vuna.Compiler.Ir.Analysis.groupDepIdx", "Vuna/Compiler/Ir/Analysis.vuna:201"));
  ("Ir_dAnalysis.v_groupDepIdxGo", ("Vuna.Compiler.Ir.Analysis.groupDepIdxGo", "Vuna/Compiler/Ir/Analysis.vuna:205"));
  ("Ir_dAnalysis.v_groupIndexTbl", ("Vuna.Compiler.Ir.Analysis.groupIndexTbl", "Vuna/Compiler/Ir/Analysis.vuna:193"));
  ("Ir_dAnalysis.v_groupNames", ("Vuna.Compiler.Ir.Analysis.groupNames", "Vuna/Compiler/Ir/Analysis.vuna:269"));
  ("Ir_dAnalysis.v_groupNamesGo", ("Vuna.Compiler.Ir.Analysis.groupNamesGo", "Vuna/Compiler/Ir/Analysis.vuna:462"));
  ("Ir_dAnalysis.v_groupNeedsRec", ("Vuna.Compiler.Ir.Analysis.groupNeedsRec", "Vuna/Compiler/Ir/Analysis.vuna:301"));
  ("Ir_dAnalysis.v_groupOf", ("Vuna.Compiler.Ir.Analysis.groupOf", "Vuna/Compiler/Ir/Analysis.vuna:150"));
  ("Ir_dAnalysis.v_groupsFromComps", ("Vuna.Compiler.Ir.Analysis.groupsFromComps", "Vuna/Compiler/Ir/Analysis.vuna:135"));
  ("Ir_dAnalysis.v_groupsFromCompsGo", ("Vuna.Compiler.Ir.Analysis.groupsFromCompsGo", "Vuna/Compiler/Ir/Analysis.vuna:139"));
  ("Ir_dAnalysis.v_indexGroups", ("Vuna.Compiler.Ir.Analysis.indexGroups", "Vuna/Compiler/Ir/Analysis.vuna:189"));
  ("Ir_dAnalysis.v_insertReady", ("Vuna.Compiler.Ir.Analysis.insertReady", "Vuna/Compiler/Ir/Analysis.vuna:243"));
  ("Ir_dAnalysis.v_irMentionsGlobal", ("Vuna.Compiler.Ir.Analysis.irMentionsGlobal", "Vuna/Compiler/Ir/Analysis.vuna:488"));
  ("Ir_dAnalysis.v_irStringsOf", ("Vuna.Compiler.Ir.Analysis.irStringsOf", "Vuna/Compiler/Ir/Analysis.vuna:392"));
  ("Ir_dAnalysis.v_irStringsOfAlt", ("Vuna.Compiler.Ir.Analysis.irStringsOfAlt", "Vuna/Compiler/Ir/Analysis.vuna:418"));
  ("Ir_dAnalysis.v_irStringsOfAltMaybe", ("Vuna.Compiler.Ir.Analysis.irStringsOfAltMaybe", "Vuna/Compiler/Ir/Analysis.vuna:421"));
  ("Ir_dAnalysis.v_irStringsOfDef", ("Vuna.Compiler.Ir.Analysis.irStringsOfDef", "Vuna/Compiler/Ir/Analysis.vuna:434"));
  ("Ir_dAnalysis.v_irStringsOfField", ("Vuna.Compiler.Ir.Analysis.irStringsOfField", "Vuna/Compiler/Ir/Analysis.vuna:415"));
  ("Ir_dAnalysis.v_lookupDeps", ("Vuna.Compiler.Ir.Analysis.lookupDeps", "Vuna/Compiler/Ir/Analysis.vuna:236"));
  ("Ir_dAnalysis.v_lookupInt", ("Vuna.Compiler.Ir.Analysis.lookupInt", "Vuna/Compiler/Ir/Analysis.vuna:224"));
  ("Ir_dAnalysis.v_lookupNames", ("Vuna.Compiler.Ir.Analysis.lookupNames", "Vuna/Compiler/Ir/Analysis.vuna:230"));
  ("Ir_dAnalysis.v_neighborsOf", ("Vuna.Compiler.Ir.Analysis.neighborsOf", "Vuna/Compiler/Ir/Analysis.vuna:22"));
  ("Ir_dAnalysis.v_notIn", ("Vuna.Compiler.Ir.Analysis.notIn", "Vuna/Compiler/Ir/Analysis.vuna:162"));
  ("Ir_dAnalysis.v_orderGroups", ("Vuna.Compiler.Ir.Analysis.orderGroups", "Vuna/Compiler/Ir/Analysis.vuna:172"));
  ("Ir_dAnalysis.v_orderGroupsGo", ("Vuna.Compiler.Ir.Analysis.orderGroupsGo", "Vuna/Compiler/Ir/Analysis.vuna:247"));
  ("Ir_dAnalysis.v_postOrder", ("Vuna.Compiler.Ir.Analysis.postOrder", "Vuna/Compiler/Ir/Analysis.vuna:76"));
  ("Ir_dAnalysis.v_reachableDefs", ("Vuna.Compiler.Ir.Analysis.reachableDefs", "Vuna/Compiler/Ir/Analysis.vuna:355"));
  ("Ir_dAnalysis.v_reachableNames", ("Vuna.Compiler.Ir.Analysis.reachableNames", "Vuna/Compiler/Ir/Analysis.vuna:370"));
  ("Ir_dAnalysis.v_reverseAdjTbl", ("Vuna.Compiler.Ir.Analysis.reverseAdjTbl", "Vuna/Compiler/Ir/Analysis.vuna:41"));
  ("Ir_dAnalysis.v_reverseDepTbl", ("Vuna.Compiler.Ir.Analysis.reverseDepTbl", "Vuna/Compiler/Ir/Analysis.vuna:216"));
  ("Ir_dAnf.v_anf", ("Vuna.Compiler.Ir.Anf.anf", "Vuna/Compiler/Ir/Anf.vuna:91"));
  ("Ir_dAnf.v_anfAltMaybe", ("Vuna.Compiler.Ir.Anf.anfAltMaybe", "Vuna/Compiler/Ir/Anf.vuna:224"));
  ("Ir_dAnf.v_anfAlts", ("Vuna.Compiler.Ir.Anf.anfAlts", "Vuna/Compiler/Ir/Anf.vuna:211"));
  ("Ir_dAnf.v_anfDef", ("Vuna.Compiler.Ir.Anf.anfDef", "Vuna/Compiler/Ir/Anf.vuna:314"));
  ("Ir_dAnf.v_anfDefs", ("Vuna.Compiler.Ir.Anf.anfDefs", "Vuna/Compiler/Ir/Anf.vuna:321"));
  ("Ir_dAnf.v_anfFields", ("Vuna.Compiler.Ir.Anf.anfFields", "Vuna/Compiler/Ir/Anf.vuna:197"));
  ("Ir_dAnf.v_anfFuelFor", ("Vuna.Compiler.Ir.Anf.anfFuelFor", "Vuna/Compiler/Ir/Anf.vuna:342"));
  ("Ir_dAnf.v_anfGroup", ("Vuna.Compiler.Ir.Anf.anfGroup", "Vuna/Compiler/Ir/Anf.vuna:330"));
  ("Ir_dAnf.v_anfGroups", ("Vuna.Compiler.Ir.Anf.anfGroups", "Vuna/Compiler/Ir/Anf.vuna:337"));
  ("Ir_dAnf.v_anfGroupsList", ("Vuna.Compiler.Ir.Anf.anfGroupsList", "Vuna/Compiler/Ir/Anf.vuna:333"));
  ("Ir_dAnf.v_anfList", ("Vuna.Compiler.Ir.Anf.anfList", "Vuna/Compiler/Ir/Anf.vuna:183"));
  ("Ir_dAnf.v_anfProgramDefs", ("Vuna.Compiler.Ir.Anf.anfProgramDefs", "Vuna/Compiler/Ir/Anf.vuna:352"));
  ("Ir_dAnf.v_applyIrs", ("Vuna.Compiler.Ir.Anf.applyIrs", "Vuna/Compiler/Ir/Anf.vuna:58"));
  ("Ir_dAnf.v_bindSimple", ("Vuna.Compiler.Ir.Anf.bindSimple", "Vuna/Compiler/Ir/Anf.vuna:78"));
  ("Ir_dAnf.v_countAltM", ("Vuna.Compiler.Ir.Anf.countAltM", "Vuna/Compiler/Ir/Anf.vuna:305"));
  ("Ir_dAnf.v_countAnfAlts", ("Vuna.Compiler.Ir.Anf.countAnfAlts", "Vuna/Compiler/Ir/Anf.vuna:296"));
  ("Ir_dAnf.v_countAnfBinders", ("Vuna.Compiler.Ir.Anf.countAnfBinders", "Vuna/Compiler/Ir/Anf.vuna:238"));
  ("Ir_dAnf.v_countAnfFields", ("Vuna.Compiler.Ir.Anf.countAnfFields", "Vuna/Compiler/Ir/Anf.vuna:287"));
  ("Ir_dAnf.v_countAnfList", ("Vuna.Compiler.Ir.Anf.countAnfList", "Vuna/Compiler/Ir/Anf.vuna:278"));
  ("Ir_dAnf.v_countBs", ("Vuna.Compiler.Ir.Anf.countBs", "Vuna/Compiler/Ir/Anf.vuna:268"));
  ("Ir_dAnf.v_defsSize", ("Vuna.Compiler.Ir.Anf.defsSize", "Vuna/Compiler/Ir/Anf.vuna:345"));
  ("Ir_dAnf.v_freshBinder", ("Vuna.Compiler.Ir.Anf.freshBinder", "Vuna/Compiler/Ir/Anf.vuna:75"));
  ("Ir_dAnf.v_isAnfBinder", ("Vuna.Compiler.Ir.Anf.isAnfBinder", "Vuna/Compiler/Ir/Anf.vuna:272"));
  ("Ir_dAnf.v_isSimple", ("Vuna.Compiler.Ir.Anf.isSimple", "Vuna/Compiler/Ir/Anf.vuna:64"));
  ("Ir_dAnf.v_letsIn", ("Vuna.Compiler.Ir.Anf.letsIn", "Vuna/Compiler/Ir/Anf.vuna:87"));
  ("Ir_dAnf.v_mkAnf", ("Vuna.Compiler.Ir.Anf.mkAnf", "Vuna/Compiler/Ir/Anf.vuna:25"));
  ("Ir_dAnf.v_spineOfIr", ("Vuna.Compiler.Ir.Anf.spineOfIr", "Vuna/Compiler/Ir/Anf.vuna:51"));
  ("Ir_dCps.v_addDepOnce", ("Vuna.Compiler.Ir.Cps.addDepOnce", "Vuna/Compiler/Ir/Cps.vuna:1563"));
  ("Ir_dCps.v_applyAll", ("Vuna.Compiler.Ir.Cps.applyAll", "Vuna/Compiler/Ir/Cps.vuna:148"));
  ("Ir_dCps.v_arityOf", ("Vuna.Compiler.Ir.Cps.arityOf", "Vuna/Compiler/Ir/Cps.vuna:928"));
  ("Ir_dCps.v_bNameEq", ("Vuna.Compiler.Ir.Cps.bNameEq", "Vuna/Compiler/Ir/Cps.vuna:110"));
  ("Ir_dCps.v_binderEq", ("Vuna.Compiler.Ir.Cps.binderEq", "Vuna/Compiler/Ir/Cps.vuna:117"));
  ("Ir_dCps.v_binderErased", ("Vuna.Compiler.Ir.Cps.binderErased", "Vuna/Compiler/Ir/Cps.vuna:124"));
  ("Ir_dCps.v_clauseArityOf", ("Vuna.Compiler.Ir.Cps.clauseArityOf", "Vuna/Compiler/Ir/Cps.vuna:996"));
  ("Ir_dCps.v_clauseGlobals", ("Vuna.Compiler.Ir.Cps.clauseGlobals", "Vuna/Compiler/Ir/Cps.vuna:1008"));
  ("Ir_dCps.v_cleanupPopName", ("Vuna.Compiler.Ir.Cps.cleanupPopName", "Vuna/Compiler/Ir/Cps.vuna:1134"));
  ("Ir_dCps.v_cleanupPushName", ("Vuna.Compiler.Ir.Cps.cleanupPushName", "Vuna/Compiler/Ir/Cps.vuna:1131"));
  ("Ir_dCps.v_collectHandleOpsDefs", ("Vuna.Compiler.Ir.Cps.collectHandleOpsDefs", "Vuna/Compiler/Ir/Cps.vuna:1101"));
  ("Ir_dCps.v_collectHandleOpsDefsGo", ("Vuna.Compiler.Ir.Cps.collectHandleOpsDefsGo", "Vuna/Compiler/Ir/Cps.vuna:1107"));
  ("Ir_dCps.v_collectHandlerGlobals", ("Vuna.Compiler.Ir.Cps.collectHandlerGlobals", "Vuna/Compiler/Ir/Cps.vuna:1034"));
  ("Ir_dCps.v_collectHandlerGlobalsAltM", ("Vuna.Compiler.Ir.Cps.collectHandlerGlobalsAltM", "Vuna/Compiler/Ir/Cps.vuna:1092"));
  ("Ir_dCps.v_collectHandlerGlobalsAlts", ("Vuna.Compiler.Ir.Cps.collectHandlerGlobalsAlts", "Vuna/Compiler/Ir/Cps.vuna:1083"));
  ("Ir_dCps.v_collectHandlerGlobalsFields", ("Vuna.Compiler.Ir.Cps.collectHandlerGlobalsFields", "Vuna/Compiler/Ir/Cps.vuna:1074"));
  ("Ir_dCps.v_collectHandlerGlobalsList", ("Vuna.Compiler.Ir.Cps.collectHandlerGlobalsList", "Vuna/Compiler/Ir/Cps.vuna:1065"));
  ("Ir_dCps.v_cpsAlt", ("Vuna.Compiler.Ir.Cps.cpsAlt", "Vuna/Compiler/Ir/Cps.vuna:254"));
  ("Ir_dCps.v_cpsAltMaybe", ("Vuna.Compiler.Ir.Cps.cpsAltMaybe", "Vuna/Compiler/Ir/Cps.vuna:263"));
  ("Ir_dCps.v_cpsApp", ("Vuna.Compiler.Ir.Cps.cpsApp", "Vuna/Compiler/Ir/Cps.vuna:294"));
  ("Ir_dCps.v_cpsArgs", ("Vuna.Compiler.Ir.Cps.cpsArgs", "Vuna/Compiler/Ir/Cps.vuna:273"));
  ("Ir_dCps.v_cpsDefs", ("Vuna.Compiler.Ir.Cps.cpsDefs", "Vuna/Compiler/Ir/Cps.vuna:1598"));
  ("Ir_dCps.v_cpsDefsMachine", ("Vuna.Compiler.Ir.Cps.cpsDefsMachine", "Vuna/Compiler/Ir/Cps.vuna:1575"));
  ("Ir_dCps.v_cpsDefsSize", ("Vuna.Compiler.Ir.Cps.cpsDefsSize", "Vuna/Compiler/Ir/Cps.vuna:97"));
  ("Ir_dCps.v_cpsExpr", ("Vuna.Compiler.Ir.Cps.cpsExpr", "Vuna/Compiler/Ir/Cps.vuna:224"));
  ("Ir_dCps.v_cpsFuelBase", ("Vuna.Compiler.Ir.Cps.cpsFuelBase", "Vuna/Compiler/Ir/Cps.vuna:91"));
  ("Ir_dCps.v_cpsFuelOfBody", ("Vuna.Compiler.Ir.Cps.cpsFuelOfBody", "Vuna/Compiler/Ir/Cps.vuna:94"));
  ("Ir_dCps.v_cpsFuelOfDefs", ("Vuna.Compiler.Ir.Cps.cpsFuelOfDefs", "Vuna/Compiler/Ir/Cps.vuna:104"));
  ("Ir_dCps.v_cpsThunkCall", ("Vuna.Compiler.Ir.Cps.cpsThunkCall", "Vuna/Compiler/Ir/Cps.vuna:286"));
  ("Ir_dCps.v_cpsUnit", ("Vuna.Compiler.Ir.Cps.cpsUnit", "Vuna/Compiler/Ir/Cps.vuna:1590"));
  ("Ir_dCps.v_defArities", ("Vuna.Compiler.Ir.Cps.defArities", "Vuna/Compiler/Ir/Cps.vuna:907"));
  ("Ir_dCps.v_defSigs", ("Vuna.Compiler.Ir.Cps.defSigs", "Vuna/Compiler/Ir/Cps.vuna:916"));
  ("Ir_dCps.v_flattenApp", ("Vuna.Compiler.Ir.Cps.flattenApp", "Vuna/Compiler/Ir/Cps.vuna:152"));
  ("Ir_dCps.v_foldAppMap", ("Vuna.Compiler.Ir.Cps.foldAppMap", "Vuna/Compiler/Ir/Cps.vuna:1550"));
  ("Ir_dCps.v_freshA", ("Vuna.Compiler.Ir.Cps.freshA", "Vuna/Compiler/Ir/Cps.vuna:145"));
  ("Ir_dCps.v_freshK", ("Vuna.Compiler.Ir.Cps.freshK", "Vuna/Compiler/Ir/Cps.vuna:139"));
  ("Ir_dCps.v_freshU", ("Vuna.Compiler.Ir.Cps.freshU", "Vuna/Compiler/Ir/Cps.vuna:142"));
  ("Ir_dCps.v_freshV", ("Vuna.Compiler.Ir.Cps.freshV", "Vuna/Compiler/Ir/Cps.vuna:136"));
  ("Ir_dCps.v_fuelOf", ("Vuna.Compiler.Ir.Cps.fuelOf", "Vuna/Compiler/Ir/Cps.vuna:1031"));
  ("Ir_dCps.v_funArity", ("Vuna.Compiler.Ir.Cps.funArity", "Vuna/Compiler/Ir/Cps.vuna:936"));
  ("Ir_dCps.v_funResult", ("Vuna.Compiler.Ir.Cps.funResult", "Vuna/Compiler/Ir/Cps.vuna:940"));
  ("Ir_dCps.v_handleScopedName", ("Vuna.Compiler.Ir.Cps.handleScopedName", "Vuna/Compiler/Ir/Cps.vuna:86"));
  ("Ir_dCps.v_handlerTables", ("Vuna.Compiler.Ir.Cps.handlerTables", "Vuna/Compiler/Ir/Cps.vuna:925"));
  ("Ir_dCps.v_hasClauseParam", ("Vuna.Compiler.Ir.Cps.hasClauseParam", "Vuna/Compiler/Ir/Cps.vuna:960"));
  ("Ir_dCps.v_identityCont", ("Vuna.Compiler.Ir.Cps.identityCont", "Vuna/Compiler/Ir/Cps.vuna:213"));
  ("Ir_dCps.v_irCpsHandleName", ("Vuna.Compiler.Ir.Cps.irCpsHandleName", "Vuna/Compiler/Ir/Cps.vuna:37"));
  ("Ir_dCps.v_irCpsPerformName", ("Vuna.Compiler.Ir.Cps.irCpsPerformName", "Vuna/Compiler/Ir/Cps.vuna:34"));
  ("Ir_dCps.v_irCpsSelfName", ("Vuna.Compiler.Ir.Cps.irCpsSelfName", "Vuna/Compiler/Ir/Cps.vuna:40"));
  ("Ir_dCps.v_irMApplyName", ("Vuna.Compiler.Ir.Cps.irMApplyName", "Vuna/Compiler/Ir/Cps.vuna:54"));
  ("Ir_dCps.v_irMDoneName", ("Vuna.Compiler.Ir.Cps.irMDoneName", "Vuna/Compiler/Ir/Cps.vuna:63"));
  ("Ir_dCps.v_irMHandleName", ("Vuna.Compiler.Ir.Cps.irMHandleName", "Vuna/Compiler/Ir/Cps.vuna:46"));
  ("Ir_dCps.v_irMPerformName", ("Vuna.Compiler.Ir.Cps.irMPerformName", "Vuna/Compiler/Ir/Cps.vuna:43"));
  ("Ir_dCps.v_irMRunEffName", ("Vuna.Compiler.Ir.Cps.irMRunEffName", "Vuna/Compiler/Ir/Cps.vuna:57"));
  ("Ir_dCps.v_irMRunName", ("Vuna.Compiler.Ir.Cps.irMRunName", "Vuna/Compiler/Ir/Cps.vuna:60"));
  ("Ir_dCps.v_irMSelfName", ("Vuna.Compiler.Ir.Cps.irMSelfName", "Vuna/Compiler/Ir/Cps.vuna:49"));
  ("Ir_dCps.v_irScopedMkCtor", ("Vuna.Compiler.Ir.Cps.irScopedMkCtor", "Vuna/Compiler/Ir/Cps.vuna:70"));
  ("Ir_dCps.v_irScopedTypeName", ("Vuna.Compiler.Ir.Cps.irScopedTypeName", "Vuna/Compiler/Ir/Cps.vuna:67"));
  ("Ir_dCps.v_isClauseGlobal", ("Vuna.Compiler.Ir.Cps.isClauseGlobal", "Vuna/Compiler/Ir/Cps.vuna:1002"));
  ("Ir_dCps.v_isClauseTy", ("Vuna.Compiler.Ir.Cps.isClauseTy", "Vuna/Compiler/Ir/Cps.vuna:951"));
  ("Ir_dCps.v_isContBinder", ("Vuna.Compiler.Ir.Cps.isContBinder", "Vuna/Compiler/Ir/Cps.vuna:1283"));
  ("Ir_dCps.v_isCoreHandleCombinator", ("Vuna.Compiler.Ir.Cps.isCoreHandleCombinator", "Vuna/Compiler/Ir/Cps.vuna:966"));
  ("Ir_dCps.v_isEffContLambda", ("Vuna.Compiler.Ir.Cps.isEffContLambda", "Vuna/Compiler/Ir/Cps.vuna:584"));
  ("Ir_dCps.v_isEffResultTy", ("Vuna.Compiler.Ir.Cps.isEffResultTy", "Vuna/Compiler/Ir/Cps.vuna:580"));
  ("Ir_dCps.v_isEffThunkBody", ("Vuna.Compiler.Ir.Cps.isEffThunkBody", "Vuna/Compiler/Ir/Cps.vuna:588"));
  ("Ir_dCps.v_isFunTy", ("Vuna.Compiler.Ir.Cps.isFunTy", "Vuna/Compiler/Ir/Cps.vuna:944"));
  ("Ir_dCps.v_isHandleCombinator", ("Vuna.Compiler.Ir.Cps.isHandleCombinator", "Vuna/Compiler/Ir/Cps.vuna:986"));
  ("Ir_dCps.v_isHandlerCombinatorTy", ("Vuna.Compiler.Ir.Cps.isHandlerCombinatorTy", "Vuna/Compiler/Ir/Cps.vuna:956"));
  ("Ir_dCps.v_isTailCont", ("Vuna.Compiler.Ir.Cps.isTailCont", "Vuna/Compiler/Ir/Cps.vuna:690"));
  ("Ir_dCps.v_isThunkAlt", ("Vuna.Compiler.Ir.Cps.isThunkAlt", "Vuna/Compiler/Ir/Cps.vuna:202"));
  ("Ir_dCps.v_isThunkCtor", ("Vuna.Compiler.Ir.Cps.isThunkCtor", "Vuna/Compiler/Ir/Cps.vuna:197"));
  ("Ir_dCps.v_lastBinderOf", ("Vuna.Compiler.Ir.Cps.lastBinderOf", "Vuna/Compiler/Ir/Cps.vuna:1201"));
  ("Ir_dCps.v_lenOf", ("Vuna.Compiler.Ir.Cps.lenOf", "Vuna/Compiler/Ir/Cps.vuna:1025"));
  ("Ir_dCps.v_mApplys", ("Vuna.Compiler.Ir.Cps.mApplys", "Vuna/Compiler/Ir/Cps.vuna:1289"));
  ("Ir_dCps.v_mApplysAltM", ("Vuna.Compiler.Ir.Cps.mApplysAltM", "Vuna/Compiler/Ir/Cps.vuna:1341"));
  ("Ir_dCps.v_mApplysAlts", ("Vuna.Compiler.Ir.Cps.mApplysAlts", "Vuna/Compiler/Ir/Cps.vuna:1332"));
  ("Ir_dCps.v_mApplysDef", ("Vuna.Compiler.Ir.Cps.mApplysDef", "Vuna/Compiler/Ir/Cps.vuna:1422"));
  ("Ir_dCps.v_mApplysFields", ("Vuna.Compiler.Ir.Cps.mApplysFields", "Vuna/Compiler/Ir/Cps.vuna:1323"));
  ("Ir_dCps.v_mApplysList", ("Vuna.Compiler.Ir.Cps.mApplysList", "Vuna/Compiler/Ir/Cps.vuna:1314"));
  ("Ir_dCps.v_mBNameText", ("Vuna.Compiler.Ir.Cps.mBNameText", "Vuna/Compiler/Ir/Cps.vuna:509"));
  ("Ir_dCps.v_mBodyOf", ("Vuna.Compiler.Ir.Cps.mBodyOf", "Vuna/Compiler/Ir/Cps.vuna:897"));
  ("Ir_dCps.v_mCleanupDef", ("Vuna.Compiler.Ir.Cps.mCleanupDef", "Vuna/Compiler/Ir/Cps.vuna:1212"));
  ("Ir_dCps.v_mCps", ("Vuna.Compiler.Ir.Cps.mCps", "Vuna/Compiler/Ir/Cps.vuna:696"));
  ("Ir_dCps.v_mCpsAltM", ("Vuna.Compiler.Ir.Cps.mCpsAltM", "Vuna/Compiler/Ir/Cps.vuna:629"));
  ("Ir_dCps.v_mCpsAlts", ("Vuna.Compiler.Ir.Cps.mCpsAlts", "Vuna/Compiler/Ir/Cps.vuna:620"));
  ("Ir_dCps.v_mCpsApply", ("Vuna.Compiler.Ir.Cps.mCpsApply", "Vuna/Compiler/Ir/Cps.vuna:661"));
  ("Ir_dCps.v_mCpsApplyArgs", ("Vuna.Compiler.Ir.Cps.mCpsApplyArgs", "Vuna/Compiler/Ir/Cps.vuna:677"));
  ("Ir_dCps.v_mCpsArgs", ("Vuna.Compiler.Ir.Cps.mCpsArgs", "Vuna/Compiler/Ir/Cps.vuna:646"));
  ("Ir_dCps.v_mDef", ("Vuna.Compiler.Ir.Cps.mDef", "Vuna/Compiler/Ir/Cps.vuna:1244"));
  ("Ir_dCps.v_mDefs", ("Vuna.Compiler.Ir.Cps.mDefs", "Vuna/Compiler/Ir/Cps.vuna:1270"));
  ("Ir_dCps.v_mDoneCont", ("Vuna.Compiler.Ir.Cps.mDoneCont", "Vuna/Compiler/Ir/Cps.vuna:869"));
  ("Ir_dCps.v_mEffContLambda", ("Vuna.Compiler.Ir.Cps.mEffContLambda", "Vuna/Compiler/Ir/Cps.vuna:609"));
  ("Ir_dCps.v_mEraseHead", ("Vuna.Compiler.Ir.Cps.mEraseHead", "Vuna/Compiler/Ir/Cps.vuna:534"));
  ("Ir_dCps.v_mFieldsH", ("Vuna.Compiler.Ir.Cps.mFieldsH", "Vuna/Compiler/Ir/Cps.vuna:755"));
  ("Ir_dCps.v_mFieldsS", ("Vuna.Compiler.Ir.Cps.mFieldsS", "Vuna/Compiler/Ir/Cps.vuna:842"));
  ("Ir_dCps.v_mFreshK", ("Vuna.Compiler.Ir.Cps.mFreshK", "Vuna/Compiler/Ir/Cps.vuna:568"));
  ("Ir_dCps.v_mFreshR", ("Vuna.Compiler.Ir.Cps.mFreshR", "Vuna/Compiler/Ir/Cps.vuna:575"));
  ("Ir_dCps.v_mFreshTailK", ("Vuna.Compiler.Ir.Cps.mFreshTailK", "Vuna/Compiler/Ir/Cps.vuna:572"));
  ("Ir_dCps.v_mFreshV", ("Vuna.Compiler.Ir.Cps.mFreshV", "Vuna/Compiler/Ir/Cps.vuna:565"));
  ("Ir_dCps.v_mHandlerFun", ("Vuna.Compiler.Ir.Cps.mHandlerFun", "Vuna/Compiler/Ir/Cps.vuna:1228"));
  ("Ir_dCps.v_mHandlerLam", ("Vuna.Compiler.Ir.Cps.mHandlerLam", "Vuna/Compiler/Ir/Cps.vuna:733"));
  ("Ir_dCps.v_mHandlers", ("Vuna.Compiler.Ir.Cps.mHandlers", "Vuna/Compiler/Ir/Cps.vuna:764"));
  ("Ir_dCps.v_mHandlersAltM", ("Vuna.Compiler.Ir.Cps.mHandlersAltM", "Vuna/Compiler/Ir/Cps.vuna:795"));
  ("Ir_dCps.v_mHandlersAlts", ("Vuna.Compiler.Ir.Cps.mHandlersAlts", "Vuna/Compiler/Ir/Cps.vuna:786"));
  ("Ir_dCps.v_mIsControl", ("Vuna.Compiler.Ir.Cps.mIsControl", "Vuna/Compiler/Ir/Cps.vuna:638"));
  ("Ir_dCps.v_mIsOp", ("Vuna.Compiler.Ir.Cps.mIsOp", "Vuna/Compiler/Ir/Cps.vuna:515"));
  ("Ir_dCps.v_mIsResumeApp", ("Vuna.Compiler.Ir.Cps.mIsResumeApp", "Vuna/Compiler/Ir/Cps.vuna:547"));
  ("Ir_dCps.v_mIsResumeAppGo", ("Vuna.Compiler.Ir.Cps.mIsResumeAppGo", "Vuna/Compiler/Ir/Cps.vuna:550"));
  ("Ir_dCps.v_mListH", ("Vuna.Compiler.Ir.Cps.mListH", "Vuna/Compiler/Ir/Cps.vuna:746"));
  ("Ir_dCps.v_mListS", ("Vuna.Compiler.Ir.Cps.mListS", "Vuna/Compiler/Ir/Cps.vuna:833"));
  ("Ir_dCps.v_mMarked", ("Vuna.Compiler.Ir.Cps.mMarked", "Vuna/Compiler/Ir/Cps.vuna:1356"));
  ("Ir_dCps.v_mMarkedAltM", ("Vuna.Compiler.Ir.Cps.mMarkedAltM", "Vuna/Compiler/Ir/Cps.vuna:1407"));
  ("Ir_dCps.v_mMarkedAlts", ("Vuna.Compiler.Ir.Cps.mMarkedAlts", "Vuna/Compiler/Ir/Cps.vuna:1398"));
  ("Ir_dCps.v_mMarkedDef", ("Vuna.Compiler.Ir.Cps.mMarkedDef", "Vuna/Compiler/Ir/Cps.vuna:1416"));
  ("Ir_dCps.v_mMarkedFields", ("Vuna.Compiler.Ir.Cps.mMarkedFields", "Vuna/Compiler/Ir/Cps.vuna:1389"));
  ("Ir_dCps.v_mMarkedList", ("Vuna.Compiler.Ir.Cps.mMarkedList", "Vuna/Compiler/Ir/Cps.vuna:1380"));
  ("Ir_dCps.v_mNoResumption", ("Vuna.Compiler.Ir.Cps.mNoResumption", "Vuna/Compiler/Ir/Cps.vuna:604"));
  ("Ir_dCps.v_mResumeGo", ("Vuna.Compiler.Ir.Cps.mResumeGo", "Vuna/Compiler/Ir/Cps.vuna:524"));
  ("Ir_dCps.v_mResumption", ("Vuna.Compiler.Ir.Cps.mResumption", "Vuna/Compiler/Ir/Cps.vuna:521"));
  ("Ir_dCps.v_mRunEffTerm", ("Vuna.Compiler.Ir.Cps.mRunEffTerm", "Vuna/Compiler/Ir/Cps.vuna:594"));
  ("Ir_dCps.v_mScopedAltM", ("Vuna.Compiler.Ir.Cps.mScopedAltM", "Vuna/Compiler/Ir/Cps.vuna:1192"));
  ("Ir_dCps.v_mScopedAlts", ("Vuna.Compiler.Ir.Cps.mScopedAlts", "Vuna/Compiler/Ir/Cps.vuna:1183"));
  ("Ir_dCps.v_mScopedCalls", ("Vuna.Compiler.Ir.Cps.mScopedCalls", "Vuna/Compiler/Ir/Cps.vuna:1137"));
  ("Ir_dCps.v_mScopedFields", ("Vuna.Compiler.Ir.Cps.mScopedFields", "Vuna/Compiler/Ir/Cps.vuna:1174"));
  ("Ir_dCps.v_mScopedList", ("Vuna.Compiler.Ir.Cps.mScopedList", "Vuna/Compiler/Ir/Cps.vuna:1165"));
  ("Ir_dCps.v_mSteps", ("Vuna.Compiler.Ir.Cps.mSteps", "Vuna/Compiler/Ir/Cps.vuna:1466"));
  ("Ir_dCps.v_mStepsAltM", ("Vuna.Compiler.Ir.Cps.mStepsAltM", "Vuna/Compiler/Ir/Cps.vuna:1540"));
  ("Ir_dCps.v_mStepsAlts", ("Vuna.Compiler.Ir.Cps.mStepsAlts", "Vuna/Compiler/Ir/Cps.vuna:1531"));
  ("Ir_dCps.v_mStepsDef", ("Vuna.Compiler.Ir.Cps.mStepsDef", "Vuna/Compiler/Ir/Cps.vuna:1566"));
  ("Ir_dCps.v_mStepsFields", ("Vuna.Compiler.Ir.Cps.mStepsFields", "Vuna/Compiler/Ir/Cps.vuna:1522"));
  ("Ir_dCps.v_mStepsList", ("Vuna.Compiler.Ir.Cps.mStepsList", "Vuna/Compiler/Ir/Cps.vuna:1513"));
  ("Ir_dCps.v_mStripErase", ("Vuna.Compiler.Ir.Cps.mStripErase", "Vuna/Compiler/Ir/Cps.vuna:541"));
  ("Ir_dCps.v_mSym", ("Vuna.Compiler.Ir.Cps.mSym", "Vuna/Compiler/Ir/Cps.vuna:804"));
  ("Ir_dCps.v_mSyms", ("Vuna.Compiler.Ir.Cps.mSyms", "Vuna/Compiler/Ir/Cps.vuna:810"));
  ("Ir_dCps.v_mSymsAltMM", ("Vuna.Compiler.Ir.Cps.mSymsAltMM", "Vuna/Compiler/Ir/Cps.vuna:860"));
  ("Ir_dCps.v_mSymsAltsM", ("Vuna.Compiler.Ir.Cps.mSymsAltsM", "Vuna/Compiler/Ir/Cps.vuna:851"));
  ("Ir_dCps.v_mTrampolineBody", ("Vuna.Compiler.Ir.Cps.mTrampolineBody", "Vuna/Compiler/Ir/Cps.vuna:875"));
  ("Ir_dCps.v_machineArgsOf", ("Vuna.Compiler.Ir.Cps.machineArgsOf", "Vuna/Compiler/Ir/Cps.vuna:1453"));
  ("Ir_dCps.v_machineCtl", ("Vuna.Compiler.Ir.Cps.machineCtl", "Vuna/Compiler/Ir/Cps.vuna:1433"));
  ("Ir_dCps.v_machineCtorOf", ("Vuna.Compiler.Ir.Cps.machineCtorOf", "Vuna/Compiler/Ir/Cps.vuna:1436"));
  ("Ir_dCps.v_machineRunGlobal", ("Vuna.Compiler.Ir.Cps.machineRunGlobal", "Vuna/Compiler/Ir/Cps.vuna:1560"));
  ("Ir_dCps.v_mapAltCps", ("Vuna.Compiler.Ir.Cps.mapAltCps", "Vuna/Compiler/Ir/Cps.vuna:178"));
  ("Ir_dCps.v_mapAltDirect", ("Vuna.Compiler.Ir.Cps.mapAltDirect", "Vuna/Compiler/Ir/Cps.vuna:169"));
  ("Ir_dCps.v_mapDirect", ("Vuna.Compiler.Ir.Cps.mapDirect", "Vuna/Compiler/Ir/Cps.vuna:160"));
  ("Ir_dCps.v_mapFieldsDirect", ("Vuna.Compiler.Ir.Cps.mapFieldsDirect", "Vuna/Compiler/Ir/Cps.vuna:187"));
  ("Ir_dCps.v_memBinder", ("Vuna.Compiler.Ir.Cps.memBinder", "Vuna/Compiler/Ir/Cps.vuna:120"));
  ("Ir_dCps.v_memName", ("Vuna.Compiler.Ir.Cps.memName", "Vuna/Compiler/Ir/Cps.vuna:1116"));
  ("Ir_dCps.v_mkBinder", ("Vuna.Compiler.Ir.Cps.mkBinder", "Vuna/Compiler/Ir/Cps.vuna:131"));
  ("Ir_dCps.v_runEffName", ("Vuna.Compiler.Ir.Cps.runEffName", "Vuna/Compiler/Ir/Cps.vuna:80"));
  ("Ir_dCps.v_runMainName", ("Vuna.Compiler.Ir.Cps.runMainName", "Vuna/Compiler/Ir/Cps.vuna:83"));
  ("Ir_dCps.v_runPureName", ("Vuna.Compiler.Ir.Cps.runPureName", "Vuna/Compiler/Ir/Cps.vuna:77"));
  ("Ir_dCps.v_runThunkName", ("Vuna.Compiler.Ir.Cps.runThunkName", "Vuna/Compiler/Ir/Cps.vuna:74"));
  ("Ir_dCps.v_runtimeBinders", ("Vuna.Compiler.Ir.Cps.runtimeBinders", "Vuna/Compiler/Ir/Cps.vuna:128"));
  ("Ir_dCps.v_scopeName", ("Vuna.Compiler.Ir.Cps.scopeName", "Vuna/Compiler/Ir/Cps.vuna:1128"));
  ("Ir_dCps.v_scopedName", ("Vuna.Compiler.Ir.Cps.scopedName", "Vuna/Compiler/Ir/Cps.vuna:1122"));
  ("Ir_dCps.v_selfAlt", ("Vuna.Compiler.Ir.Cps.selfAlt", "Vuna/Compiler/Ir/Cps.vuna:403"));
  ("Ir_dCps.v_selfAlts", ("Vuna.Compiler.Ir.Cps.selfAlts", "Vuna/Compiler/Ir/Cps.vuna:412"));
  ("Ir_dCps.v_selfBody", ("Vuna.Compiler.Ir.Cps.selfBody", "Vuna/Compiler/Ir/Cps.vuna:427"));
  ("Ir_dCps.v_selfName", ("Vuna.Compiler.Ir.Cps.selfName", "Vuna/Compiler/Ir/Cps.vuna:1125"));
  ("Ir_dCps.v_sigOf", ("Vuna.Compiler.Ir.Cps.sigOf", "Vuna/Compiler/Ir/Cps.vuna:932"));
  ("Ir_dCps.v_thunkBindersOfAlt", ("Vuna.Compiler.Ir.Cps.thunkBindersOfAlt", "Vuna/Compiler/Ir/Cps.vuna:209"));
  ("Ir_dCps.v_trampolineBody", ("Vuna.Compiler.Ir.Cps.trampolineBody", "Vuna/Compiler/Ir/Cps.vuna:386"));
  ("Ir_dCps.v_transformAltDirect", ("Vuna.Compiler.Ir.Cps.transformAltDirect", "Vuna/Compiler/Ir/Cps.vuna:365"));
  ("Ir_dCps.v_transformAltMaybe", ("Vuna.Compiler.Ir.Cps.transformAltMaybe", "Vuna/Compiler/Ir/Cps.vuna:372"));
  ("Ir_dCps.v_transformDef", ("Vuna.Compiler.Ir.Cps.transformDef", "Vuna/Compiler/Ir/Cps.vuna:448"));
  ("Ir_dCps.v_transformDefs", ("Vuna.Compiler.Ir.Cps.transformDefs", "Vuna/Compiler/Ir/Cps.vuna:467"));
  ("Ir_dCps.v_transformDirect", ("Vuna.Compiler.Ir.Cps.transformDirect", "Vuna/Compiler/Ir/Cps.vuna:318"));
  ("Ir_dCps.v_transformGroup", ("Vuna.Compiler.Ir.Cps.transformGroup", "Vuna/Compiler/Ir/Cps.vuna:482"));
  ("Ir_dCps.v_transformGroups", ("Vuna.Compiler.Ir.Cps.transformGroups", "Vuna/Compiler/Ir/Cps.vuna:491"));
  ("Ir_dDispatch.v_argCount", ("Vuna.Compiler.Ir.Dispatch.argCount", "Vuna/Compiler/Ir/Dispatch.vuna:58"));
  ("Ir_dDispatch.v_buildSpine", ("Vuna.Compiler.Ir.Dispatch.buildSpine", "Vuna/Compiler/Ir/Dispatch.vuna:54"));
  ("Ir_dDispatch.v_dispatch", ("Vuna.Compiler.Ir.Dispatch.dispatch", "Vuna/Compiler/Ir/Dispatch.vuna:94"));
  ("Ir_dDispatch.v_dispatchAlt", ("Vuna.Compiler.Ir.Dispatch.dispatchAlt", "Vuna/Compiler/Ir/Dispatch.vuna:153"));
  ("Ir_dDispatch.v_dispatchAltM", ("Vuna.Compiler.Ir.Dispatch.dispatchAltM", "Vuna/Compiler/Ir/Dispatch.vuna:157"));
  ("Ir_dDispatch.v_dispatchAlts", ("Vuna.Compiler.Ir.Dispatch.dispatchAlts", "Vuna/Compiler/Ir/Dispatch.vuna:166"));
  ("Ir_dDispatch.v_dispatchDef", ("Vuna.Compiler.Ir.Dispatch.dispatchDef", "Vuna/Compiler/Ir/Dispatch.vuna:175"));
  ("Ir_dDispatch.v_dispatchEntry", ("Vuna.Compiler.Ir.Dispatch.dispatchEntry", "Vuna/Compiler/Ir/Dispatch.vuna:183"));
  ("Ir_dDispatch.v_dispatchEntryM", ("Vuna.Compiler.Ir.Dispatch.dispatchEntryM", "Vuna/Compiler/Ir/Dispatch.vuna:193"));
  ("Ir_dDispatch.v_dispatchFields", ("Vuna.Compiler.Ir.Dispatch.dispatchFields", "Vuna/Compiler/Ir/Dispatch.vuna:144"));
  ("Ir_dDispatch.v_dispatchFuelBase", ("Vuna.Compiler.Ir.Dispatch.dispatchFuelBase", "Vuna/Compiler/Ir/Dispatch.vuna:207"));
  ("Ir_dDispatch.v_dispatchFuelOfBody", ("Vuna.Compiler.Ir.Dispatch.dispatchFuelOfBody", "Vuna/Compiler/Ir/Dispatch.vuna:210"));
  ("Ir_dDispatch.v_dispatchGroup", ("Vuna.Compiler.Ir.Dispatch.dispatchGroup", "Vuna/Compiler/Ir/Dispatch.vuna:180"));
  ("Ir_dDispatch.v_dispatchIdArg", ("Vuna.Compiler.Ir.Dispatch.dispatchIdArg", "Vuna/Compiler/Ir/Dispatch.vuna:63"));
  ("Ir_dDispatch.v_dispatchIdNameOf", ("Vuna.Compiler.Ir.Dispatch.dispatchIdNameOf", "Vuna/Compiler/Ir/Dispatch.vuna:23"));
  ("Ir_dDispatch.v_dispatchIdsUnit", ("Vuna.Compiler.Ir.Dispatch.dispatchIdsUnit", "Vuna/Compiler/Ir/Dispatch.vuna:198"));
  ("Ir_dDispatch.v_dispatchList", ("Vuna.Compiler.Ir.Dispatch.dispatchList", "Vuna/Compiler/Ir/Dispatch.vuna:135"));
  ("Ir_dDispatch.v_dispatchSpine", ("Vuna.Compiler.Ir.Dispatch.dispatchSpine", "Vuna/Compiler/Ir/Dispatch.vuna:69"));
  ("Ir_dDispatch.v_dispatchSpineArgs", ("Vuna.Compiler.Ir.Dispatch.dispatchSpineArgs", "Vuna/Compiler/Ir/Dispatch.vuna:84"));
  ("Ir_dDispatch.v_flattenSpine", ("Vuna.Compiler.Ir.Dispatch.flattenSpine", "Vuna/Compiler/Ir/Dispatch.vuna:47"));
  ("Ir_dModel.v_allAnnotatableIrTys", ("Vuna.Compiler.Ir.Model.allAnnotatableIrTys", "Vuna/Compiler/Ir/Model.vuna:99"));
  ("Ir_dModel.v_irAltBindersOf", ("Vuna.Compiler.Ir.Model.irAltBindersOf", "Vuna/Compiler/Ir/Model.vuna:523"));
  ("Ir_dModel.v_irAltBodyOf", ("Vuna.Compiler.Ir.Model.irAltBodyOf", "Vuna/Compiler/Ir/Model.vuna:527"));
  ("Ir_dModel.v_irAltCtorOf", ("Vuna.Compiler.Ir.Model.irAltCtorOf", "Vuna/Compiler/Ir/Model.vuna:519"));
  ("Ir_dModel.v_irDefArity", ("Vuna.Compiler.Ir.Model.irDefArity", "Vuna/Compiler/Ir/Model.vuna:318"));
  ("Ir_dModel.v_irDefBody", ("Vuna.Compiler.Ir.Model.irDefBody", "Vuna/Compiler/Ir/Model.vuna:330"));
  ("Ir_dModel.v_irDefDeps", ("Vuna.Compiler.Ir.Model.irDefDeps", "Vuna/Compiler/Ir/Model.vuna:322"));
  ("Ir_dModel.v_irDefExtern", ("Vuna.Compiler.Ir.Model.irDefExtern", "Vuna/Compiler/Ir/Model.vuna:334"));
  ("Ir_dModel.v_irDefInitGuard", ("Vuna.Compiler.Ir.Model.irDefInitGuard", "Vuna/Compiler/Ir/Model.vuna:344"));
  ("Ir_dModel.v_irDefName", ("Vuna.Compiler.Ir.Model.irDefName", "Vuna/Compiler/Ir/Model.vuna:314"));
  ("Ir_dModel.v_irDefRecValueOk", ("Vuna.Compiler.Ir.Model.irDefRecValueOk", "Vuna/Compiler/Ir/Model.vuna:339"));
  ("Ir_dModel.v_irDefSpan", ("Vuna.Compiler.Ir.Model.irDefSpan", "Vuna/Compiler/Ir/Model.vuna:348"));
  ("Ir_dModel.v_irDefTy", ("Vuna.Compiler.Ir.Model.irDefTy", "Vuna/Compiler/Ir/Model.vuna:326"));
  ("Ir_dModel.v_irEffMkCtor", ("Vuna.Compiler.Ir.Model.irEffMkCtor", "Vuna/Compiler/Ir/Model.vuna:284"));
  ("Ir_dModel.v_irEffTypeName", ("Vuna.Compiler.Ir.Model.irEffTypeName", "Vuna/Compiler/Ir/Model.vuna:281"));
  ("Ir_dModel.v_irEntryHandlersOf", ("Vuna.Compiler.Ir.Model.irEntryHandlersOf", "Vuna/Compiler/Ir/Model.vuna:547"));
  ("Ir_dModel.v_irEntryIsActionOf", ("Vuna.Compiler.Ir.Model.irEntryIsActionOf", "Vuna/Compiler/Ir/Model.vuna:539"));
  ("Ir_dModel.v_irEntryMainOf", ("Vuna.Compiler.Ir.Model.irEntryMainOf", "Vuna/Compiler/Ir/Model.vuna:535"));
  ("Ir_dModel.v_irEntryRowTagsOf", ("Vuna.Compiler.Ir.Model.irEntryRowTagsOf", "Vuna/Compiler/Ir/Model.vuna:551"));
  ("Ir_dModel.v_irEntryRunMainOf", ("Vuna.Compiler.Ir.Model.irEntryRunMainOf", "Vuna/Compiler/Ir/Model.vuna:543"));
  ("Ir_dModel.v_irEntryShowOf", ("Vuna.Compiler.Ir.Model.irEntryShowOf", "Vuna/Compiler/Ir/Model.vuna:531"));
  ("Ir_dModel.v_irGroupDefs", ("Vuna.Compiler.Ir.Model.irGroupDefs", "Vuna/Compiler/Ir/Model.vuna:360"));
  ("Ir_dModel.v_irGroupIsRec", ("Vuna.Compiler.Ir.Model.irGroupIsRec", "Vuna/Compiler/Ir/Model.vuna:357"));
  ("Ir_dModel.v_irInlineArity", ("Vuna.Compiler.Ir.Model.irInlineArity", "Vuna/Compiler/Ir/Model.vuna:456"));
  ("Ir_dModel.v_irLamTyFuel", ("Vuna.Compiler.Ir.Model.irLamTyFuel", "Vuna/Compiler/Ir/Model.vuna:262"));
  ("Ir_dModel.v_irListConsOf", ("Vuna.Compiler.Ir.Model.irListConsOf", "Vuna/Compiler/Ir/Model.vuna:515"));
  ("Ir_dModel.v_irListFamilyOf", ("Vuna.Compiler.Ir.Model.irListFamilyOf", "Vuna/Compiler/Ir/Model.vuna:507"));
  ("Ir_dModel.v_irListNilOf", ("Vuna.Compiler.Ir.Model.irListNilOf", "Vuna/Compiler/Ir/Model.vuna:511"));
  ("Ir_dModel.v_irProgSharedOf", ("Vuna.Compiler.Ir.Model.irProgSharedOf", "Vuna/Compiler/Ir/Model.vuna:555"));
  ("Ir_dModel.v_irProgUnitOf", ("Vuna.Compiler.Ir.Model.irProgUnitOf", "Vuna/Compiler/Ir/Model.vuna:559"));
  ("Ir_dModel.v_irResultTyFuel", ("Vuna.Compiler.Ir.Model.irResultTyFuel", "Vuna/Compiler/Ir/Model.vuna:230"));
  ("Ir_dModel.v_irResultTyOf", ("Vuna.Compiler.Ir.Model.irResultTyOf", "Vuna/Compiler/Ir/Model.vuna:227"));
  ("Ir_dModel.v_irSharedCtorShapeOf", ("Vuna.Compiler.Ir.Model.irSharedCtorShapeOf", "Vuna/Compiler/Ir/Model.vuna:424"));
  ("Ir_dModel.v_irSharedRecordFieldsOf", ("Vuna.Compiler.Ir.Model.irSharedRecordFieldsOf", "Vuna/Compiler/Ir/Model.vuna:429"));
  ("Ir_dModel.v_irSharedUnboxedOf", ("Vuna.Compiler.Ir.Model.irSharedUnboxedOf", "Vuna/Compiler/Ir/Model.vuna:419"));
  ("Ir_dModel.v_irSize", ("Vuna.Compiler.Ir.Model.irSize", "Vuna/Compiler/Ir/Model.vuna:566"));
  ("Ir_dModel.v_irSizeAlt", ("Vuna.Compiler.Ir.Model.irSizeAlt", "Vuna/Compiler/Ir/Model.vuna:603"));
  ("Ir_dModel.v_irSizeAlts", ("Vuna.Compiler.Ir.Model.irSizeAlts", "Vuna/Compiler/Ir/Model.vuna:599"));
  ("Ir_dModel.v_irSizeChildren", ("Vuna.Compiler.Ir.Model.irSizeChildren", "Vuna/Compiler/Ir/Model.vuna:570"));
  ("Ir_dModel.v_irSizeFields", ("Vuna.Compiler.Ir.Model.irSizeFields", "Vuna/Compiler/Ir/Model.vuna:595"));
  ("Ir_dModel.v_irSizeList", ("Vuna.Compiler.Ir.Model.irSizeList", "Vuna/Compiler/Ir/Model.vuna:591"));
  ("Ir_dModel.v_irTyAnnotatable", ("Vuna.Compiler.Ir.Model.irTyAnnotatable", "Vuna/Compiler/Ir/Model.vuna:87"));
  ("Ir_dModel.v_irTyAt", ("Vuna.Compiler.Ir.Model.irTyAt", "Vuna/Compiler/Ir/Model.vuna:80"));
  ("Ir_dModel.v_irTyDataArgsOf", ("Vuna.Compiler.Ir.Model.irTyDataArgsOf", "Vuna/Compiler/Ir/Model.vuna:75"));
  ("Ir_dModel.v_irTySubstVars", ("Vuna.Compiler.Ir.Model.irTySubstVars", "Vuna/Compiler/Ir/Model.vuna:56"));
  ("Ir_dModel.v_irTyVarAt", ("Vuna.Compiler.Ir.Model.irTyVarAt", "Vuna/Compiler/Ir/Model.vuna:70"));
  ("Ir_dModel.v_mkIrBinder", ("Vuna.Compiler.Ir.Model.mkIrBinder", "Vuna/Compiler/Ir/Model.vuna:128"));
  ("Ir_dModel.v_mkIrBinderArm", ("Vuna.Compiler.Ir.Model.mkIrBinderArm", "Vuna/Compiler/Ir/Model.vuna:140"));
  ("Ir_dModel.v_mkIrBinderErased", ("Vuna.Compiler.Ir.Model.mkIrBinderErased", "Vuna/Compiler/Ir/Model.vuna:136"));
  ("Ir_dModel.v_mkIrBinderNat", ("Vuna.Compiler.Ir.Model.mkIrBinderNat", "Vuna/Compiler/Ir/Model.vuna:144"));
  ("Ir_dModel.v_mkIrBinderTyped", ("Vuna.Compiler.Ir.Model.mkIrBinderTyped", "Vuna/Compiler/Ir/Model.vuna:132"));
  ("Ir_dModel.v_mkIrBinderWild", ("Vuna.Compiler.Ir.Model.mkIrBinderWild", "Vuna/Compiler/Ir/Model.vuna:148"));
  ("Ir_dRepresent.v_allCatchAll", ("Vuna.Compiler.Ir.Represent.allCatchAll", "Vuna/Compiler/Ir/Represent.vuna:94"));
  ("Ir_dRepresent.v_representAlt", ("Vuna.Compiler.Ir.Represent.representAlt", "Vuna/Compiler/Ir/Represent.vuna:101"));
  ("Ir_dRepresent.v_representAltIr", ("Vuna.Compiler.Ir.Represent.representAltIr", "Vuna/Compiler/Ir/Represent.vuna:107"));
  ("Ir_dRepresent.v_representCase", ("Vuna.Compiler.Ir.Represent.representCase", "Vuna/Compiler/Ir/Represent.vuna:76"));
  ("Ir_dRepresent.v_representDef", ("Vuna.Compiler.Ir.Represent.representDef", "Vuna/Compiler/Ir/Represent.vuna:27"));
  ("Ir_dRepresent.v_representGroup", ("Vuna.Compiler.Ir.Represent.representGroup", "Vuna/Compiler/Ir/Represent.vuna:24"));
  ("Ir_dRepresent.v_representIr", ("Vuna.Compiler.Ir.Represent.representIr", "Vuna/Compiler/Ir/Represent.vuna:34"));
  ("Ir_dRepresent.v_representUnit", ("Vuna.Compiler.Ir.Represent.representUnit", "Vuna/Compiler/Ir/Represent.vuna:15"));
  ("Ir_dRuntime.v_irListLength", ("Vuna.Compiler.Ir.Runtime.irListLength", "Vuna/Compiler/Ir/Runtime.vuna:414"));
  ("Ir_dRuntime.v_irRtBridgedNames", ("Vuna.Compiler.Ir.Runtime.irRtBridgedNames", "Vuna/Compiler/Ir/Runtime.vuna:342"));
  ("Ir_dRuntime.v_irRtBridgesList", ("Vuna.Compiler.Ir.Runtime.irRtBridgesList", "Vuna/Compiler/Ir/Runtime.vuna:401"));
  ("Ir_dRuntime.v_irRtContract", ("Vuna.Compiler.Ir.Runtime.irRtContract", "Vuna/Compiler/Ir/Runtime.vuna:379"));
  ("Ir_dRuntime.v_irRtIsKnown", ("Vuna.Compiler.Ir.Runtime.irRtIsKnown", "Vuna/Compiler/Ir/Runtime.vuna:394"));
  ("Ir_dRuntime.v_irRtLookup", ("Vuna.Compiler.Ir.Runtime.irRtLookup", "Vuna/Compiler/Ir/Runtime.vuna:390"));
  ("Ir_dRuntime.v_irRtLookupGo", ("Vuna.Compiler.Ir.Runtime.irRtLookupGo", "Vuna/Compiler/Ir/Runtime.vuna:385"));
  ("Ir_dRuntime.v_irRtNames", ("Vuna.Compiler.Ir.Runtime.irRtNames", "Vuna/Compiler/Ir/Runtime.vuna:375"));
  ("Ir_dRuntime.v_irRtNatSucc", ("Vuna.Compiler.Ir.Runtime.irRtNatSucc", "Vuna/Compiler/Ir/Runtime.vuna:49"));
  ("Ir_dRuntime.v_irRtPlainNames", ("Vuna.Compiler.Ir.Runtime.irRtPlainNames", "Vuna/Compiler/Ir/Runtime.vuna:73"));
  ("Ir_dRuntime.v_irRtShowBool", ("Vuna.Compiler.Ir.Runtime.irRtShowBool", "Vuna/Compiler/Ir/Runtime.vuna:64"));
  ("Ir_dRuntime.v_irRtShowFloat", ("Vuna.Compiler.Ir.Runtime.irRtShowFloat", "Vuna/Compiler/Ir/Runtime.vuna:61"));
  ("Ir_dRuntime.v_irRtShowInt", ("Vuna.Compiler.Ir.Runtime.irRtShowInt", "Vuna/Compiler/Ir/Runtime.vuna:52"));
  ("Ir_dRuntime.v_irRtShowNat", ("Vuna.Compiler.Ir.Runtime.irRtShowNat", "Vuna/Compiler/Ir/Runtime.vuna:55"));
  ("Ir_dRuntime.v_irRtShowStr", ("Vuna.Compiler.Ir.Runtime.irRtShowStr", "Vuna/Compiler/Ir/Runtime.vuna:58"));
  ("Ir_dRuntime.v_irRtSymBridgesOf", ("Vuna.Compiler.Ir.Runtime.irRtSymBridgesOf", "Vuna/Compiler/Ir/Runtime.vuna:44"));
  ("Ir_dRuntime.v_irRtSymNameOf", ("Vuna.Compiler.Ir.Runtime.irRtSymNameOf", "Vuna/Compiler/Ir/Runtime.vuna:40"));
  ("Ir_dRuntime.v_irRtSyntheticNames", ("Vuna.Compiler.Ir.Runtime.irRtSyntheticNames", "Vuna/Compiler/Ir/Runtime.vuna:68"));
  ("Ir_dRuntime.v_irSymbolsOf", ("Vuna.Compiler.Ir.Runtime.irSymbolsOf", "Vuna/Compiler/Ir/Runtime.vuna:419"));
  ("Ir_dRuntime.v_irSymbolsOfAlt", ("Vuna.Compiler.Ir.Runtime.irSymbolsOfAlt", "Vuna/Compiler/Ir/Runtime.vuna:452"));
  ("Ir_dRuntime.v_irSymbolsOfAltMaybe", ("Vuna.Compiler.Ir.Runtime.irSymbolsOfAltMaybe", "Vuna/Compiler/Ir/Runtime.vuna:455"));
  ("Ir_dRuntime.v_irSymbolsOfDef", ("Vuna.Compiler.Ir.Runtime.irSymbolsOfDef", "Vuna/Compiler/Ir/Runtime.vuna:459"));
  ("Ir_dRuntime.v_irSymbolsOfEntry", ("Vuna.Compiler.Ir.Runtime.irSymbolsOfEntry", "Vuna/Compiler/Ir/Runtime.vuna:472"));
  ("Ir_dRuntime.v_irSymbolsOfField", ("Vuna.Compiler.Ir.Runtime.irSymbolsOfField", "Vuna/Compiler/Ir/Runtime.vuna:449"));
  ("Ir_dRuntime.v_irSymbolsOfUnit", ("Vuna.Compiler.Ir.Runtime.irSymbolsOfUnit", "Vuna/Compiler/Ir/Runtime.vuna:466"));
  ("Ir_dTail.v_addDef", ("Vuna.Compiler.Ir.Tail.addDef", "Vuna/Compiler/Ir/Tail.vuna:25"));
  ("Ir_dTail.v_annotateAlt", ("Vuna.Compiler.Ir.Tail.annotateAlt", "Vuna/Compiler/Ir/Tail.vuna:151"));
  ("Ir_dTail.v_annotateAltMaybe", ("Vuna.Compiler.Ir.Tail.annotateAltMaybe", "Vuna/Compiler/Ir/Tail.vuna:155"));
  ("Ir_dTail.v_annotateAt", ("Vuna.Compiler.Ir.Tail.annotateAt", "Vuna/Compiler/Ir/Tail.vuna:105"));
  ("Ir_dTail.v_annotateBody", ("Vuna.Compiler.Ir.Tail.annotateBody", "Vuna/Compiler/Ir/Tail.vuna:48"));
  ("Ir_dTail.v_annotateDef", ("Vuna.Compiler.Ir.Tail.annotateDef", "Vuna/Compiler/Ir/Tail.vuna:40"));
  ("Ir_dTail.v_annotateDefs", ("Vuna.Compiler.Ir.Tail.annotateDefs", "Vuna/Compiler/Ir/Tail.vuna:52"));
  ("Ir_dTail.v_annotateDefsWith", ("Vuna.Compiler.Ir.Tail.annotateDefsWith", "Vuna/Compiler/Ir/Tail.vuna:37"));
  ("Ir_dTail.v_annotateField", ("Vuna.Compiler.Ir.Tail.annotateField", "Vuna/Compiler/Ir/Tail.vuna:148"));
  ("Ir_dTail.v_arityOfTable", ("Vuna.Compiler.Ir.Tail.arityOfTable", "Vuna/Compiler/Ir/Tail.vuna:31"));
  ("Ir_dTail.v_arityTableOf", ("Vuna.Compiler.Ir.Tail.arityTableOf", "Vuna/Compiler/Ir/Tail.vuna:22"));
  ("Ir_dTail.v_stripAlt", ("Vuna.Compiler.Ir.Tail.stripAlt", "Vuna/Compiler/Ir/Tail.vuna:96"));
  ("Ir_dTail.v_stripAltM", ("Vuna.Compiler.Ir.Tail.stripAltM", "Vuna/Compiler/Ir/Tail.vuna:99"));
  ("Ir_dTail.v_stripField", ("Vuna.Compiler.Ir.Tail.stripField", "Vuna/Compiler/Ir/Tail.vuna:93"));
  ("Ir_dTail.v_stripTail", ("Vuna.Compiler.Ir.Tail.stripTail", "Vuna/Compiler/Ir/Tail.vuna:60"));
  ("Ir_dTail.v_stripTailAt", ("Vuna.Compiler.Ir.Tail.stripTailAt", "Vuna/Compiler/Ir/Tail.vuna:63"));
  ("Ir_dTail.v_tailFuelOf", ("Vuna.Compiler.Ir.Tail.tailFuelOf", "Vuna/Compiler/Ir/Tail.vuna:34"));
  ("Ir_dValidate.v_altWork", ("Vuna.Compiler.Ir.Validate.altWork", "Vuna/Compiler/Ir/Validate.vuna:397"));
  ("Ir_dValidate.v_checkAltBinderTys", ("Vuna.Compiler.Ir.Validate.checkAltBinderTys", "Vuna/Compiler/Ir/Validate.vuna:244"));
  ("Ir_dValidate.v_checkAltBinderTysM", ("Vuna.Compiler.Ir.Validate.checkAltBinderTysM", "Vuna/Compiler/Ir/Validate.vuna:251"));
  ("Ir_dValidate.v_checkAppTyM", ("Vuna.Compiler.Ir.Validate.checkAppTyM", "Vuna/Compiler/Ir/Validate.vuna:184"));
  ("Ir_dValidate.v_checkBinderTys", ("Vuna.Compiler.Ir.Validate.checkBinderTys", "Vuna/Compiler/Ir/Validate.vuna:106"));
  ("Ir_dValidate.v_checkBinderTysOf", ("Vuna.Compiler.Ir.Validate.checkBinderTysOf", "Vuna/Compiler/Ir/Validate.vuna:232"));
  ("Ir_dValidate.v_checkBinderTysWork", ("Vuna.Compiler.Ir.Validate.checkBinderTysWork", "Vuna/Compiler/Ir/Validate.vuna:151"));
  ("Ir_dValidate.v_checkCtorArity", ("Vuna.Compiler.Ir.Validate.checkCtorArity", "Vuna/Compiler/Ir/Validate.vuna:212"));
  ("Ir_dValidate.v_checkCtorTys", ("Vuna.Compiler.Ir.Validate.checkCtorTys", "Vuna/Compiler/Ir/Validate.vuna:191"));
  ("Ir_dValidate.v_checkDeclCtorSlots", ("Vuna.Compiler.Ir.Validate.checkDeclCtorSlots", "Vuna/Compiler/Ir/Validate.vuna:312"));
  ("Ir_dValidate.v_checkDeclSlots", ("Vuna.Compiler.Ir.Validate.checkDeclSlots", "Vuna/Compiler/Ir/Validate.vuna:307"));
  ("Ir_dValidate.v_checkDefArityVsSig", ("Vuna.Compiler.Ir.Validate.checkDefArityVsSig", "Vuna/Compiler/Ir/Validate.vuna:122"));
  ("Ir_dValidate.v_checkDefTy", ("Vuna.Compiler.Ir.Validate.checkDefTy", "Vuna/Compiler/Ir/Validate.vuna:144"));
  ("Ir_dValidate.v_checkGroupOrder", ("Vuna.Compiler.Ir.Validate.checkGroupOrder", "Vuna/Compiler/Ir/Validate.vuna:33"));
  ("Ir_dValidate.v_checkGroupOrderGo", ("Vuna.Compiler.Ir.Validate.checkGroupOrderGo", "Vuna/Compiler/Ir/Validate.vuna:36"));
  ("Ir_dValidate.v_checkIrTyM", ("Vuna.Compiler.Ir.Validate.checkIrTyM", "Vuna/Compiler/Ir/Validate.vuna:228"));
  ("Ir_dValidate.v_checkNodeBinderTys", ("Vuna.Compiler.Ir.Validate.checkNodeBinderTys", "Vuna/Compiler/Ir/Validate.vuna:160"));
  ("Ir_dValidate.v_checkScopedDefs", ("Vuna.Compiler.Ir.Validate.checkScopedDefs", "Vuna/Compiler/Ir/Validate.vuna:344"));
  ("Ir_dValidate.v_checkScopedUnit", ("Vuna.Compiler.Ir.Validate.checkScopedUnit", "Vuna/Compiler/Ir/Validate.vuna:341"));
  ("Ir_dValidate.v_checkScopedWork", ("Vuna.Compiler.Ir.Validate.checkScopedWork", "Vuna/Compiler/Ir/Validate.vuna:357"));
  ("Ir_dValidate.v_checkSymbolRefs", ("Vuna.Compiler.Ir.Validate.checkSymbolRefs", "Vuna/Compiler/Ir/Validate.vuna:71"));
  ("Ir_dValidate.v_checkTyArity", ("Vuna.Compiler.Ir.Validate.checkTyArity", "Vuna/Compiler/Ir/Validate.vuna:255"));
  ("Ir_dValidate.v_checkTyArityIn", ("Vuna.Compiler.Ir.Validate.checkTyArityIn", "Vuna/Compiler/Ir/Validate.vuna:260"));
  ("Ir_dValidate.v_checkTyArityList", ("Vuna.Compiler.Ir.Validate.checkTyArityList", "Vuna/Compiler/Ir/Validate.vuna:287"));
  ("Ir_dValidate.v_checkTyArityListIn", ("Vuna.Compiler.Ir.Validate.checkTyArityListIn", "Vuna/Compiler/Ir/Validate.vuna:290"));
  ("Ir_dValidate.v_checkTyArityListM", ("Vuna.Compiler.Ir.Validate.checkTyArityListM", "Vuna/Compiler/Ir/Validate.vuna:206"));
  ("Ir_dValidate.v_countKeptFlags", ("Vuna.Compiler.Ir.Validate.countKeptFlags", "Vuna/Compiler/Ir/Validate.vuna:224"));
  ("Ir_dValidate.v_firstMissingDep", ("Vuna.Compiler.Ir.Validate.firstMissingDep", "Vuna/Compiler/Ir/Validate.vuna:58"));
  ("Ir_dValidate.v_firstUnorderedDep", ("Vuna.Compiler.Ir.Validate.firstUnorderedDep", "Vuna/Compiler/Ir/Validate.vuna:48"));
  ("Ir_dValidate.v_firstUnorderedDepGo", ("Vuna.Compiler.Ir.Validate.firstUnorderedDepGo", "Vuna/Compiler/Ir/Validate.vuna:51"));
  ("Ir_dValidate.v_irTyArrowArity", ("Vuna.Compiler.Ir.Validate.irTyArrowArity", "Vuna/Compiler/Ir/Validate.vuna:140"));
  ("Ir_dValidate.v_listLength", ("Vuna.Compiler.Ir.Validate.listLength", "Vuna/Compiler/Ir/Validate.vuna:328"));
  ("Ir_dValidate.v_maybeAlts", ("Vuna.Compiler.Ir.Validate.maybeAlts", "Vuna/Compiler/Ir/Validate.vuna:393"));
  ("Ir_dValidate.v_memBinder", ("Vuna.Compiler.Ir.Validate.memBinder", "Vuna/Compiler/Ir/Validate.vuna:402"));
  ("Ir_dValidate.v_sameBName", ("Vuna.Compiler.Ir.Validate.sameBName", "Vuna/Compiler/Ir/Validate.vuna:410"));
  ("Ir_dValidate.v_sameBinder", ("Vuna.Compiler.Ir.Validate.sameBinder", "Vuna/Compiler/Ir/Validate.vuna:406"));
  ("Ir_dValidate.v_scopedChildren", ("Vuna.Compiler.Ir.Validate.scopedChildren", "Vuna/Compiler/Ir/Validate.vuna:370"));
  ("Ir_dValidate.v_scopedFuelOf", ("Vuna.Compiler.Ir.Validate.scopedFuelOf", "Vuna/Compiler/Ir/Validate.vuna:354"));
  ("Ir_dValidate.v_tyDeclArityOf", ("Vuna.Compiler.Ir.Validate.tyDeclArityOf", "Vuna/Compiler/Ir/Validate.vuna:319"));
  ("Ir_dValidate.v_validateProgram", ("Vuna.Compiler.Ir.Validate.validateProgram", "Vuna/Compiler/Ir/Validate.vuna:87"));
  ("Ir_dValidate.v_validateTyDecls", ("Vuna.Compiler.Ir.Validate.validateTyDecls", "Vuna/Compiler/Ir/Validate.vuna:299"));
  ("Ir_dValidate.v_validateTyDeclsGo", ("Vuna.Compiler.Ir.Validate.validateTyDeclsGo", "Vuna/Compiler/Ir/Validate.vuna:302"));
  ("Ir_dValidate.v_validateUnit", ("Vuna.Compiler.Ir.Validate.validateUnit", "Vuna/Compiler/Ir/Validate.vuna:23"));
  ("Loader_dAddr.v_addrOf", ("Vuna.Compiler.Loader.Addr.addrOf", "Vuna/Compiler/Loader/Addr.vuna:32"));
  ("Loader_dAddr.v_addrSchema", ("Vuna.Compiler.Loader.Addr.addrSchema", "Vuna/Compiler/Loader/Addr.vuna:24"));
  ("Loader_dAddr.v_dedupNames", ("Vuna.Compiler.Loader.Addr.dedupNames", "Vuna/Compiler/Loader/Addr.vuna:77"));
  ("Loader_dAddr.v_exportItemDep", ("Vuna.Compiler.Loader.Addr.exportItemDep", "Vuna/Compiler/Loader/Addr.vuna:72"));
  ("Loader_dAddr.v_fixRowOf", ("Vuna.Compiler.Loader.Addr.fixRowOf", "Vuna/Compiler/Loader/Addr.vuna:63"));
  ("Loader_dAddr.v_hashHex", ("Vuna.Compiler.Loader.Addr.hashHex", "Vuna/Compiler/Loader/Addr.vuna:28"));
  ("Loader_dAddr.v_headerOfSource", ("Vuna.Compiler.Loader.Addr.headerOfSource", "Vuna/Compiler/Loader/Addr.vuna:83"));
  ("Loader_dAddr.v_importNameOf", ("Vuna.Compiler.Loader.Addr.importNameOf", "Vuna/Compiler/Loader/Addr.vuna:66"));
  ("Loader_dAddr.v_projectIdAddrOf", ("Vuna.Compiler.Loader.Addr.projectIdAddrOf", "Vuna/Compiler/Loader/Addr.vuna:37"));
  ("Loader_dExpand.v_debugOnRef", ("Vuna.Compiler.Loader.Expand.debugOnRef", "Vuna/Compiler/Loader/Expand.vuna:216"));
  ("Loader_dExpand.v_expandClauses", ("Vuna.Compiler.Loader.Expand.expandClauses", "Vuna/Compiler/Loader/Expand.vuna:161"));
  ("Loader_dExpand.v_expandCtor", ("Vuna.Compiler.Loader.Expand.expandCtor", "Vuna/Compiler/Loader/Expand.vuna:74"));
  ("Loader_dExpand.v_expandCtors", ("Vuna.Compiler.Loader.Expand.expandCtors", "Vuna/Compiler/Loader/Expand.vuna:65"));
  ("Loader_dExpand.v_expandDecl", ("Vuna.Compiler.Loader.Expand.expandDecl", "Vuna/Compiler/Loader/Expand.vuna:50"));
  ("Loader_dExpand.v_expandDecls", ("Vuna.Compiler.Loader.Expand.expandDecls", "Vuna/Compiler/Loader/Expand.vuna:38"));
  ("Loader_dExpand.v_expandDeclsGo", ("Vuna.Compiler.Loader.Expand.expandDeclsGo", "Vuna/Compiler/Loader/Expand.vuna:41"));
  ("Loader_dExpand.v_expandDoStmts", ("Vuna.Compiler.Loader.Expand.expandDoStmts", "Vuna/Compiler/Loader/Expand.vuna:179"));
  ("Loader_dExpand.v_expandExpr", ("Vuna.Compiler.Loader.Expand.expandExpr", "Vuna/Compiler/Loader/Expand.vuna:113"));
  ("Loader_dExpand.v_expandExprs", ("Vuna.Compiler.Loader.Expand.expandExprs", "Vuna/Compiler/Loader/Expand.vuna:104"));
  ("Loader_dExpand.v_expandField", ("Vuna.Compiler.Loader.Expand.expandField", "Vuna/Compiler/Loader/Expand.vuna:87"));
  ("Loader_dExpand.v_expandFieldExprs", ("Vuna.Compiler.Loader.Expand.expandFieldExprs", "Vuna/Compiler/Loader/Expand.vuna:170"));
  ("Loader_dExpand.v_expandFields", ("Vuna.Compiler.Loader.Expand.expandFields", "Vuna/Compiler/Loader/Expand.vuna:78"));
  ("Loader_dExpand.v_expandFuelBound", ("Vuna.Compiler.Loader.Expand.expandFuelBound", "Vuna/Compiler/Loader/Expand.vuna:34"));
  ("Loader_dExpand.v_expandInterpParts", ("Vuna.Compiler.Loader.Expand.expandInterpParts", "Vuna/Compiler/Loader/Expand.vuna:191"));
  ("Loader_dExpand.v_expandMacro", ("Vuna.Compiler.Loader.Expand.expandMacro", "Vuna/Compiler/Loader/Expand.vuna:235"));
  ("Loader_dExpand.v_expandPatExprs", ("Vuna.Compiler.Loader.Expand.expandPatExprs", "Vuna/Compiler/Loader/Expand.vuna:152"));
  ("Loader_dExpand.v_expandTraitMethod", ("Vuna.Compiler.Loader.Expand.expandTraitMethod", "Vuna/Compiler/Loader/Expand.vuna:100"));
  ("Loader_dExpand.v_expandTraitMethods", ("Vuna.Compiler.Loader.Expand.expandTraitMethods", "Vuna/Compiler/Loader/Expand.vuna:91"));
  ("Loader_dExpand.v_internalRef", ("Vuna.Compiler.Loader.Expand.internalRef", "Vuna/Compiler/Loader/Expand.vuna:212"));
  ("Loader_dExpand.v_macroArityMismatch", ("Vuna.Compiler.Loader.Expand.macroArityMismatch", "Vuna/Compiler/Loader/Expand.vuna:219"));
  ("Loader_dFingerprint.v_buildIdFileName", ("Vuna.Compiler.Loader.Fingerprint.buildIdFileName", "Vuna/Compiler/Loader/Fingerprint.vuna:38"));
  ("Loader_dFingerprint.v_buildIdSchema", ("Vuna.Compiler.Loader.Fingerprint.buildIdSchema", "Vuna/Compiler/Loader/Fingerprint.vuna:42"));
  ("Loader_dFingerprint.v_compilerFingerprintEff", ("Vuna.Compiler.Loader.Fingerprint.compilerFingerprintEff", "Vuna/Compiler/Loader/Fingerprint.vuna:106"));
  ("Loader_dFingerprint.v_compilerIdOf", ("Vuna.Compiler.Loader.Fingerprint.compilerIdOf", "Vuna/Compiler/Loader/Fingerprint.vuna:48"));
  ("Loader_dFingerprint.v_compilerTagEff", ("Vuna.Compiler.Loader.Fingerprint.compilerTagEff", "Vuna/Compiler/Loader/Fingerprint.vuna:64"));
  ("Loader_dFingerprint.v_fingerprintOfStat", ("Vuna.Compiler.Loader.Fingerprint.fingerprintOfStat", "Vuna/Compiler/Loader/Fingerprint.vuna:57"));
  ("Loader_dFingerprint.v_readBuildIdNear", ("Vuna.Compiler.Loader.Fingerprint.readBuildIdNear", "Vuna/Compiler/Loader/Fingerprint.vuna:86"));
  ("Loader_dFingerprint.v_readFirstBuildId", ("Vuna.Compiler.Loader.Fingerprint.readFirstBuildId", "Vuna/Compiler/Loader/Fingerprint.vuna:93"));
  ("Loader_dFingerprint.v_sourceFrag", ("Vuna.Compiler.Loader.Fingerprint.sourceFrag", "Vuna/Compiler/Loader/Fingerprint.vuna:53"));
  ("Loader_dFingerprint.v_textHashOf", ("Vuna.Compiler.Loader.Fingerprint.textHashOf", "Vuna/Compiler/Loader/Fingerprint.vuna:60"));
  ("Loader_dFixity.v_builtinFixityDecls", ("Vuna.Compiler.Loader.Fixity.builtinFixityDecls", "Vuna/Compiler/Loader/Fixity.vuna:40"));
  ("Loader_dFixity.v_builtinFixityOps", ("Vuna.Compiler.Loader.Fixity.builtinFixityOps", "Vuna/Compiler/Loader/Fixity.vuna:48"));
  ("Loader_dFixity.v_checkUniqueFixities", ("Vuna.Compiler.Loader.Fixity.checkUniqueFixities", "Vuna/Compiler/Loader/Fixity.vuna:56"));
  ("Loader_dFixity.v_checkUniqueFixitiesGo", ("Vuna.Compiler.Loader.Fixity.checkUniqueFixitiesGo", "Vuna/Compiler/Loader/Fixity.vuna:59"));
  ("Loader_dFixity.v_climb", ("Vuna.Compiler.Loader.Fixity.climb", "Vuna/Compiler/Loader/Fixity.vuna:156"));
  ("Loader_dFixity.v_collectChain", ("Vuna.Compiler.Loader.Fixity.collectChain", "Vuna/Compiler/Loader/Fixity.vuna:132"));
  ("Loader_dFixity.v_fixityOf", ("Vuna.Compiler.Loader.Fixity.fixityOf", "Vuna/Compiler/Loader/Fixity.vuna:106"));
  ("Loader_dFixity.v_fixityOpOf", ("Vuna.Compiler.Loader.Fixity.fixityOpOf", "Vuna/Compiler/Loader/Fixity.vuna:51"));
  ("Loader_dFixity.v_foldApps", ("Vuna.Compiler.Loader.Fixity.foldApps", "Vuna/Compiler/Loader/Fixity.vuna:197"));
  ("Loader_dFixity.v_infixTerm", ("Vuna.Compiler.Loader.Fixity.infixTerm", "Vuna/Compiler/Loader/Fixity.vuna:118"));
  ("Loader_dFixity.v_lookupDecl", ("Vuna.Compiler.Loader.Fixity.lookupDecl", "Vuna/Compiler/Loader/Fixity.vuna:76"));
  ("Loader_dFixity.v_lookupFixity", ("Vuna.Compiler.Loader.Fixity.lookupFixity", "Vuna/Compiler/Loader/Fixity.vuna:87"));
  ("Loader_dFixity.v_lookupFixityDecl", ("Vuna.Compiler.Loader.Fixity.lookupFixityDecl", "Vuna/Compiler/Loader/Fixity.vuna:81"));
  ("Loader_dFixity.v_renameMode", ("Vuna.Compiler.Loader.Fixity.renameMode", "Vuna/Compiler/Loader/Fixity.vuna:35"));
  ("Loader_dFixity.v_reorderAlt", ("Vuna.Compiler.Loader.Fixity.reorderAlt", "Vuna/Compiler/Loader/Fixity.vuna:336"));
  ("Loader_dFixity.v_reorderAlts", ("Vuna.Compiler.Loader.Fixity.reorderAlts", "Vuna/Compiler/Loader/Fixity.vuna:333"));
  ("Loader_dFixity.v_reorderBind", ("Vuna.Compiler.Loader.Fixity.reorderBind", "Vuna/Compiler/Loader/Fixity.vuna:316"));
  ("Loader_dFixity.v_reorderBinds", ("Vuna.Compiler.Loader.Fixity.reorderBinds", "Vuna/Compiler/Loader/Fixity.vuna:313"));
  ("Loader_dFixity.v_reorderChain", ("Vuna.Compiler.Loader.Fixity.reorderChain", "Vuna/Compiler/Loader/Fixity.vuna:182"));
  ("Loader_dFixity.v_reorderClause", ("Vuna.Compiler.Loader.Fixity.reorderClause", "Vuna/Compiler/Loader/Fixity.vuna:342"));
  ("Loader_dFixity.v_reorderClauses", ("Vuna.Compiler.Loader.Fixity.reorderClauses", "Vuna/Compiler/Loader/Fixity.vuna:329"));
  ("Loader_dFixity.v_reorderCtor", ("Vuna.Compiler.Loader.Fixity.reorderCtor", "Vuna/Compiler/Loader/Fixity.vuna:420"));
  ("Loader_dFixity.v_reorderDecl", ("Vuna.Compiler.Loader.Fixity.reorderDecl", "Vuna/Compiler/Loader/Fixity.vuna:380"));
  ("Loader_dFixity.v_reorderDoStmt", ("Vuna.Compiler.Loader.Fixity.reorderDoStmt", "Vuna/Compiler/Loader/Fixity.vuna:348"));
  ("Loader_dFixity.v_reorderExpr", ("Vuna.Compiler.Loader.Fixity.reorderExpr", "Vuna/Compiler/Loader/Fixity.vuna:296"));
  ("Loader_dFixity.v_reorderField", ("Vuna.Compiler.Loader.Fixity.reorderField", "Vuna/Compiler/Loader/Fixity.vuna:325"));
  ("Loader_dFixity.v_reorderFields", ("Vuna.Compiler.Loader.Fixity.reorderFields", "Vuna/Compiler/Loader/Fixity.vuna:322"));
  ("Loader_dFixity.v_reorderInstanceMethodDecl", ("Vuna.Compiler.Loader.Fixity.reorderInstanceMethodDecl", "Vuna/Compiler/Loader/Fixity.vuna:432"));
  ("Loader_dFixity.v_reorderInterpParts", ("Vuna.Compiler.Loader.Fixity.reorderInterpParts", "Vuna/Compiler/Loader/Fixity.vuna:302"));
  ("Loader_dFixity.v_reorderNonChain", ("Vuna.Compiler.Loader.Fixity.reorderNonChain", "Vuna/Compiler/Loader/Fixity.vuna:202"));
  ("Loader_dFixity.v_reorderPattern", ("Vuna.Compiler.Loader.Fixity.reorderPattern", "Vuna/Compiler/Loader/Fixity.vuna:356"));
  ("Loader_dFixity.v_reorderProgram", ("Vuna.Compiler.Loader.Fixity.reorderProgram", "Vuna/Compiler/Loader/Fixity.vuna:443"));
  ("Loader_dFixity.v_reorderRecPatField", ("Vuna.Compiler.Loader.Fixity.reorderRecPatField", "Vuna/Compiler/Loader/Fixity.vuna:375"));
  ("Loader_dFixity.v_reorderRecordField", ("Vuna.Compiler.Loader.Fixity.reorderRecordField", "Vuna/Compiler/Loader/Fixity.vuna:424"));
  ("Loader_dFixity.v_reorderTraitMethod", ("Vuna.Compiler.Loader.Fixity.reorderTraitMethod", "Vuna/Compiler/Loader/Fixity.vuna:428"));
  ("Loader_dFixity.v_reorderTraitParam", ("Vuna.Compiler.Loader.Fixity.reorderTraitParam", "Vuna/Compiler/Loader/Fixity.vuna:411"));
  ("Loader_dFixity.v_tableOf", ("Vuna.Compiler.Loader.Fixity.tableOf", "Vuna/Compiler/Loader/Fixity.vuna:28"));
  ("Loader_dFixity.v_tableOfKeepOps", ("Vuna.Compiler.Loader.Fixity.tableOfKeepOps", "Vuna/Compiler/Loader/Fixity.vuna:32"));
  ("Loader_dFixity.v_unknownFixityMsg", ("Vuna.Compiler.Loader.Fixity.unknownFixityMsg", "Vuna/Compiler/Loader/Fixity.vuna:101"));
  ("Loader_dFlatten.v_abstractOpaquePrefix", ("Vuna.Compiler.Loader.Flatten.abstractOpaquePrefix", "Vuna/Compiler/Loader/Flatten.vuna:519"));
  ("Loader_dFlatten.v_anyTargetIn", ("Vuna.Compiler.Loader.Flatten.anyTargetIn", "Vuna/Compiler/Loader/Flatten.vuna:1028"));
  ("Loader_dFlatten.v_bindRefNames", ("Vuna.Compiler.Loader.Flatten.bindRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1099"));
  ("Loader_dFlatten.v_clauseRefNames", ("Vuna.Compiler.Loader.Flatten.clauseRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1103"));
  ("Loader_dFlatten.v_computeExports", ("Vuna.Compiler.Loader.Flatten.computeExports", "Vuna/Compiler/Loader/Flatten.vuna:535"));
  ("Loader_dFlatten.v_ctorEntriesOfType", ("Vuna.Compiler.Loader.Flatten.ctorEntriesOfType", "Vuna/Compiler/Loader/Flatten.vuna:218"));
  ("Loader_dFlatten.v_ctorRefNames", ("Vuna.Compiler.Loader.Flatten.ctorRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1049"));
  ("Loader_dFlatten.v_declGlobalNames", ("Vuna.Compiler.Loader.Flatten.declGlobalNames", "Vuna/Compiler/Loader/Flatten.vuna:1007"));
  ("Loader_dFlatten.v_declRefNames", ("Vuna.Compiler.Loader.Flatten.declRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1034"));
  ("Loader_dFlatten.v_dedupeByFullKey", ("Vuna.Compiler.Loader.Flatten.dedupeByFullKey", "Vuna/Compiler/Loader/Flatten.vuna:481"));
  ("Loader_dFlatten.v_dedupeExportEntries", ("Vuna.Compiler.Loader.Flatten.dedupeExportEntries", "Vuna/Compiler/Loader/Flatten.vuna:475"));
  ("Loader_dFlatten.v_dedupeFixities", ("Vuna.Compiler.Loader.Flatten.dedupeFixities", "Vuna/Compiler/Loader/Flatten.vuna:79"));
  ("Loader_dFlatten.v_dedupeFixitiesGo", ("Vuna.Compiler.Loader.Flatten.dedupeFixitiesGo", "Vuna/Compiler/Loader/Flatten.vuna:82"));
  ("Loader_dFlatten.v_doStmtRefNames", ("Vuna.Compiler.Loader.Flatten.doStmtRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1107"));
  ("Loader_dFlatten.v_expandGlobalName", ("Vuna.Compiler.Loader.Flatten.expandGlobalName", "Vuna/Compiler/Loader/Flatten.vuna:1014"));
  ("Loader_dFlatten.v_explicitExports", ("Vuna.Compiler.Loader.Flatten.explicitExports", "Vuna/Compiler/Loader/Flatten.vuna:490"));
  ("Loader_dFlatten.v_exportBare", ("Vuna.Compiler.Loader.Flatten.exportBare", "Vuna/Compiler/Loader/Flatten.vuna:324"));
  ("Loader_dFlatten.v_exportEntryKey", ("Vuna.Compiler.Loader.Flatten.exportEntryKey", "Vuna/Compiler/Loader/Flatten.vuna:478"));
  ("Loader_dFlatten.v_exportItemEntries", ("Vuna.Compiler.Loader.Flatten.exportItemEntries", "Vuna/Compiler/Loader/Flatten.vuna:443"));
  ("Loader_dFlatten.v_exportItemsAll", ("Vuna.Compiler.Loader.Flatten.exportItemsAll", "Vuna/Compiler/Loader/Flatten.vuna:499"));
  ("Loader_dFlatten.v_exportSelective", ("Vuna.Compiler.Loader.Flatten.exportSelective", "Vuna/Compiler/Loader/Flatten.vuna:361"));
  ("Loader_dFlatten.v_exportSpecToItem", ("Vuna.Compiler.Loader.Flatten.exportSpecToItem", "Vuna/Compiler/Loader/Flatten.vuna:553"));
  ("Loader_dFlatten.v_exportTargetOf", ("Vuna.Compiler.Loader.Flatten.exportTargetOf", "Vuna/Compiler/Loader/Flatten.vuna:1024"));
  ("Loader_dFlatten.v_exportTypeAll", ("Vuna.Compiler.Loader.Flatten.exportTypeAll", "Vuna/Compiler/Loader/Flatten.vuna:376"));
  ("Loader_dFlatten.v_exprRefNames", ("Vuna.Compiler.Loader.Flatten.exprRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1071"));
  ("Loader_dFlatten.v_fieldRefNames", ("Vuna.Compiler.Loader.Flatten.fieldRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1053"));
  ("Loader_dFlatten.v_filterExportMembers", ("Vuna.Compiler.Loader.Flatten.filterExportMembers", "Vuna/Compiler/Loader/Flatten.vuna:467"));
  ("Loader_dFlatten.v_findCtorNamed", ("Vuna.Compiler.Loader.Flatten.findCtorNamed", "Vuna/Compiler/Loader/Flatten.vuna:143"));
  ("Loader_dFlatten.v_findMethodNamed", ("Vuna.Compiler.Loader.Flatten.findMethodNamed", "Vuna/Compiler/Loader/Flatten.vuna:149"));
  ("Loader_dFlatten.v_findOwnCtorNames", ("Vuna.Compiler.Loader.Flatten.findOwnCtorNames", "Vuna/Compiler/Loader/Flatten.vuna:155"));
  ("Loader_dFlatten.v_findOwnData", ("Vuna.Compiler.Loader.Flatten.findOwnData", "Vuna/Compiler/Loader/Flatten.vuna:118"));
  ("Loader_dFlatten.v_findOwnFn", ("Vuna.Compiler.Loader.Flatten.findOwnFn", "Vuna/Compiler/Loader/Flatten.vuna:133"));
  ("Loader_dFlatten.v_fixitiesForSource", ("Vuna.Compiler.Loader.Flatten.fixitiesForSource", "Vuna/Compiler/Loader/Flatten.vuna:917"));
  ("Loader_dFlatten.v_fixitiesForSourceIn", ("Vuna.Compiler.Loader.Flatten.fixitiesForSourceIn", "Vuna/Compiler/Loader/Flatten.vuna:871"));
  ("Loader_dFlatten.v_fixityDeclKey", ("Vuna.Compiler.Loader.Flatten.fixityDeclKey", "Vuna/Compiler/Loader/Flatten.vuna:94"));
  ("Loader_dFlatten.v_hasImportOf", ("Vuna.Compiler.Loader.Flatten.hasImportOf", "Vuna/Compiler/Loader/Flatten.vuna:426"));
  ("Loader_dFlatten.v_implicitPrelude", ("Vuna.Compiler.Loader.Flatten.implicitPrelude", "Vuna/Compiler/Loader/Flatten.vuna:567"));
  ("Loader_dFlatten.v_implicitPreludeDeps", ("Vuna.Compiler.Loader.Flatten.implicitPreludeDeps", "Vuna/Compiler/Loader/Flatten.vuna:584"));
  ("Loader_dFlatten.v_implicitPreludeFrom", ("Vuna.Compiler.Loader.Flatten.implicitPreludeFrom", "Vuna/Compiler/Loader/Flatten.vuna:576"));
  ("Loader_dFlatten.v_importRemovalSpan", ("Vuna.Compiler.Loader.Flatten.importRemovalSpan", "Vuna/Compiler/Loader/Flatten.vuna:994"));
  ("Loader_dFlatten.v_interpPartRefNames", ("Vuna.Compiler.Loader.Flatten.interpPartRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1112"));
  ("Loader_dFlatten.v_interpReferencedInSource", ("Vuna.Compiler.Loader.Flatten.interpReferencedInSource", "Vuna/Compiler/Loader/Flatten.vuna:977"));
  ("Loader_dFlatten.v_isAbstractOpaqueName", ("Vuna.Compiler.Loader.Flatten.isAbstractOpaqueName", "Vuna/Compiler/Loader/Flatten.vuna:532"));
  ("Loader_dFlatten.v_isEmptyEntries", ("Vuna.Compiler.Loader.Flatten.isEmptyEntries", "Vuna/Compiler/Loader/Flatten.vuna:372"));
  ("Loader_dFlatten.v_isPrivateName", ("Vuna.Compiler.Loader.Flatten.isPrivateName", "Vuna/Compiler/Loader/Flatten.vuna:103"));
  ("Loader_dFlatten.v_isRecordDecl", ("Vuna.Compiler.Loader.Flatten.isRecordDecl", "Vuna/Compiler/Loader/Flatten.vuna:253"));
  ("Loader_dFlatten.v_isRecordTarget", ("Vuna.Compiler.Loader.Flatten.isRecordTarget", "Vuna/Compiler/Loader/Flatten.vuna:240"));
  ("Loader_dFlatten.v_joinCommaNames", ("Vuna.Compiler.Loader.Flatten.joinCommaNames", "Vuna/Compiler/Loader/Flatten.vuna:438"));
  ("Loader_dFlatten.v_loadAll", ("Vuna.Compiler.Loader.Flatten.loadAll", "Vuna/Compiler/Loader/Flatten.vuna:602"));
  ("Loader_dFlatten.v_loadModule", ("Vuna.Compiler.Loader.Flatten.loadModule", "Vuna/Compiler/Loader/Flatten.vuna:633"));
  ("Loader_dFlatten.v_loadModuleSource", ("Vuna.Compiler.Loader.Flatten.loadModuleSource", "Vuna/Compiler/Loader/Flatten.vuna:821"));
  ("Loader_dFlatten.v_loadModuleSourceWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadModuleSourceWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:825"));
  ("Loader_dFlatten.v_loadProject", ("Vuna.Compiler.Loader.Flatten.loadProject", "Vuna/Compiler/Loader/Flatten.vuna:716"));
  ("Loader_dFlatten.v_loadProjectModules", ("Vuna.Compiler.Loader.Flatten.loadProjectModules", "Vuna/Compiler/Loader/Flatten.vuna:762"));
  ("Loader_dFlatten.v_loadProjectModulesWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadProjectModulesWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:765"));
  ("Loader_dFlatten.v_loadProjectSource", ("Vuna.Compiler.Loader.Flatten.loadProjectSource", "Vuna/Compiler/Loader/Flatten.vuna:780"));
  ("Loader_dFlatten.v_loadProjectSourceWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadProjectSourceWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:784"));
  ("Loader_dFlatten.v_loadProjectWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadProjectWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:723"));
  ("Loader_dFlatten.v_namespaceEntry", ("Vuna.Compiler.Loader.Flatten.namespaceEntry", "Vuna/Compiler/Loader/Flatten.vuna:463"));
  ("Loader_dFlatten.v_namespaceImportsGo", ("Vuna.Compiler.Loader.Flatten.namespaceImportsGo", "Vuna/Compiler/Loader/Flatten.vuna:417"));
  ("Loader_dFlatten.v_namespaceImportsOf", ("Vuna.Compiler.Loader.Flatten.namespaceImportsOf", "Vuna/Compiler/Loader/Flatten.vuna:414"));
  ("Loader_dFlatten.v_notEmpty", ("Vuna.Compiler.Loader.Flatten.notEmpty", "Vuna/Compiler/Loader/Flatten.vuna:549"));
  ("Loader_dFlatten.v_nsDropLocal", ("Vuna.Compiler.Loader.Flatten.nsDropLocal", "Vuna/Compiler/Loader/Flatten.vuna:629"));
  ("Loader_dFlatten.v_nsTakeLocal", ("Vuna.Compiler.Loader.Flatten.nsTakeLocal", "Vuna/Compiler/Loader/Flatten.vuna:625"));
  ("Loader_dFlatten.v_opaqueBaseName", ("Vuna.Compiler.Loader.Flatten.opaqueBaseName", "Vuna/Compiler/Loader/Flatten.vuna:522"));
  ("Loader_dFlatten.v_opaqueNamesOf", ("Vuna.Compiler.Loader.Flatten.opaqueNamesOf", "Vuna/Compiler/Loader/Flatten.vuna:511"));
  ("Loader_dFlatten.v_ownCtorEntries", ("Vuna.Compiler.Loader.Flatten.ownCtorEntries", "Vuna/Compiler/Loader/Flatten.vuna:175"));
  ("Loader_dFlatten.v_ownCtorEntriesNamed", ("Vuna.Compiler.Loader.Flatten.ownCtorEntriesNamed", "Vuna/Compiler/Loader/Flatten.vuna:305"));
  ("Loader_dFlatten.v_ownDataCtorEntries", ("Vuna.Compiler.Loader.Flatten.ownDataCtorEntries", "Vuna/Compiler/Loader/Flatten.vuna:184"));
  ("Loader_dFlatten.v_ownOrImportedTypeRef", ("Vuna.Compiler.Loader.Flatten.ownOrImportedTypeRef", "Vuna/Compiler/Loader/Flatten.vuna:266"));
  ("Loader_dFlatten.v_ownOrImportedValueRef", ("Vuna.Compiler.Loader.Flatten.ownOrImportedValueRef", "Vuna/Compiler/Loader/Flatten.vuna:278"));
  ("Loader_dFlatten.v_ownOrImportedValueRef2", ("Vuna.Compiler.Loader.Flatten.ownOrImportedValueRef2", "Vuna/Compiler/Loader/Flatten.vuna:285"));
  ("Loader_dFlatten.v_ownTypeEntries", ("Vuna.Compiler.Loader.Flatten.ownTypeEntries", "Vuna/Compiler/Loader/Flatten.vuna:192"));
  ("Loader_dFlatten.v_parseFileWithPath", ("Vuna.Compiler.Loader.Flatten.parseFileWithPath", "Vuna/Compiler/Loader/Flatten.vuna:47"));
  ("Loader_dFlatten.v_parseFileWithPathMode", ("Vuna.Compiler.Loader.Flatten.parseFileWithPathMode", "Vuna/Compiler/Loader/Flatten.vuna:50"));
  ("Loader_dFlatten.v_parseWith", ("Vuna.Compiler.Loader.Flatten.parseWith", "Vuna/Compiler/Loader/Flatten.vuna:59"));
  ("Loader_dFlatten.v_patRefNames", ("Vuna.Compiler.Loader.Flatten.patRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1061"));
  ("Loader_dFlatten.v_pathPrefixOf", ("Vuna.Compiler.Loader.Flatten.pathPrefixOf", "Vuna/Compiler/Loader/Flatten.vuna:616"));
  ("Loader_dFlatten.v_privateExportMsg", ("Vuna.Compiler.Loader.Flatten.privateExportMsg", "Vuna/Compiler/Loader/Flatten.vuna:106"));
  ("Loader_dFlatten.v_refEntryList", ("Vuna.Compiler.Loader.Flatten.refEntryList", "Vuna/Compiler/Loader/Flatten.vuna:261"));
  ("Loader_dFlatten.v_renameExportEntry", ("Vuna.Compiler.Loader.Flatten.renameExportEntry", "Vuna/Compiler/Loader/Flatten.vuna:352"));
  ("Loader_dFlatten.v_renameTypeEntry", ("Vuna.Compiler.Loader.Flatten.renameTypeEntry", "Vuna/Compiler/Loader/Flatten.vuna:356"));
  ("Loader_dFlatten.v_resolveImportPrefix", ("Vuna.Compiler.Loader.Flatten.resolveImportPrefix", "Vuna/Compiler/Loader/Flatten.vuna:431"));
  ("Loader_dFlatten.v_resolveModulesKeep", ("Vuna.Compiler.Loader.Flatten.resolveModulesKeep", "Vuna/Compiler/Loader/Flatten.vuna:945"));
  ("Loader_dFlatten.v_resolveProject", ("Vuna.Compiler.Loader.Flatten.resolveProject", "Vuna/Compiler/Loader/Flatten.vuna:929"));
  ("Loader_dFlatten.v_resolveProjectKeeping", ("Vuna.Compiler.Loader.Flatten.resolveProjectKeeping", "Vuna/Compiler/Loader/Flatten.vuna:937"));
  ("Loader_dFlatten.v_resolveProjectWith", ("Vuna.Compiler.Loader.Flatten.resolveProjectWith", "Vuna/Compiler/Loader/Flatten.vuna:933"));
  ("Loader_dFlatten.v_showCycle", ("Vuna.Compiler.Loader.Flatten.showCycle", "Vuna/Compiler/Loader/Flatten.vuna:559"));
  ("Loader_dFlatten.v_traitMethodRefNames", ("Vuna.Compiler.Loader.Flatten.traitMethodRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1057"));
  ("Loader_dFlatten.v_typeRefDominates", ("Vuna.Compiler.Loader.Flatten.typeRefDominates", "Vuna/Compiler/Loader/Flatten.vuna:229"));
  ("Loader_dFlatten.v_unusedImportWarnings", ("Vuna.Compiler.Loader.Flatten.unusedImportWarnings", "Vuna/Compiler/Loader/Flatten.vuna:961"));
  ("Loader_dFlatten.v_unusedImportWarningsGo", ("Vuna.Compiler.Loader.Flatten.unusedImportWarningsGo", "Vuna/Compiler/Loader/Flatten.vuna:983"));
  ("Loader_dFlatten.v_validateModuleHeader", ("Vuna.Compiler.Loader.Flatten.validateModuleHeader", "Vuna/Compiler/Loader/Flatten.vuna:506"));
  ("Loader_dFlatten.v_visibleFixitiesOf", ("Vuna.Compiler.Loader.Flatten.visibleFixitiesOf", "Vuna/Compiler/Loader/Flatten.vuna:73"));
  ("Loader_dFlatten.v_withImportSpan", ("Vuna.Compiler.Loader.Flatten.withImportSpan", "Vuna/Compiler/Loader/Flatten.vuna:598"));
  ("Loader_dFlatten.v_withLayerCheck", ("Vuna.Compiler.Loader.Flatten.withLayerCheck", "Vuna/Compiler/Loader/Flatten.vuna:594"));
  ("Loader_dLayers.v_allowedByRow", ("Vuna.Compiler.Loader.Layers.allowedByRow", "Vuna/Compiler/Loader/Layers.vuna:51"));
  ("Loader_dLayers.v_checkImports", ("Vuna.Compiler.Loader.Layers.checkImports", "Vuna/Compiler/Loader/Layers.vuna:90"));
  ("Loader_dLayers.v_checkModules", ("Vuna.Compiler.Loader.Layers.checkModules", "Vuna/Compiler/Loader/Layers.vuna:105"));
  ("Loader_dLayers.v_checkProjectLayers", ("Vuna.Compiler.Loader.Layers.checkProjectLayers", "Vuna/Compiler/Loader/Layers.vuna:119"));
  ("Loader_dLayers.v_closureBound", ("Vuna.Compiler.Loader.Layers.closureBound", "Vuna/Compiler/Loader/Layers.vuna:43"));
  ("Loader_dLayers.v_closureGo", ("Vuna.Compiler.Loader.Layers.closureGo", "Vuna/Compiler/Loader/Layers.vuna:32"));
  ("Loader_dLayers.v_covered", ("Vuna.Compiler.Loader.Layers.covered", "Vuna/Compiler/Loader/Layers.vuna:54"));
  ("Loader_dLayers.v_importAllowed", ("Vuna.Compiler.Loader.Layers.importAllowed", "Vuna/Compiler/Loader/Layers.vuna:59"));
  ("Loader_dLayers.v_isLayerPrefix", ("Vuna.Compiler.Loader.Layers.isLayerPrefix", "Vuna/Compiler/Loader/Layers.vuna:25"));
  ("Loader_dLayers.v_labelBest", ("Vuna.Compiler.Loader.Layers.labelBest", "Vuna/Compiler/Loader/Layers.vuna:77"));
  ("Loader_dLayers.v_labelOf", ("Vuna.Compiler.Loader.Layers.labelOf", "Vuna/Compiler/Loader/Layers.vuna:71"));
  ("Loader_dLayers.v_layerMatches", ("Vuna.Compiler.Loader.Layers.layerMatches", "Vuna/Compiler/Loader/Layers.vuna:64"));
  ("Loader_dLayers.v_layersOfRoot", ("Vuna.Compiler.Loader.Layers.layersOfRoot", "Vuna/Compiler/Loader/Layers.vuna:82"));
  ("Loader_dLayers.v_matchingLayers", ("Vuna.Compiler.Loader.Layers.matchingLayers", "Vuna/Compiler/Loader/Layers.vuna:67"));
  ("Loader_dLayers.v_usesOfLayer", ("Vuna.Compiler.Loader.Layers.usesOfLayer", "Vuna/Compiler/Loader/Layers.vuna:28"));
  ("Loader_dLayers.v_usesTotal", ("Vuna.Compiler.Loader.Layers.usesTotal", "Vuna/Compiler/Loader/Layers.vuna:46"));
  ("Loader_dLayers.v_withImportSpan", ("Vuna.Compiler.Loader.Layers.withImportSpan", "Vuna/Compiler/Loader/Layers.vuna:86"));
  ("Loader_dModules.v__ujoinNames", ("Vuna.Compiler.Loader.Modules._joinNames", "Vuna/Compiler/Loader/Modules.vuna:284"));
  ("Loader_dModules.v__ujoinRootDirs", ("Vuna.Compiler.Loader.Modules._joinRootDirs", "Vuna/Compiler/Loader/Modules.vuna:535"));
  ("Loader_dModules.v_aliasIs", ("Vuna.Compiler.Loader.Modules.aliasIs", "Vuna/Compiler/Loader/Modules.vuna:199"));
  ("Loader_dModules.v_allIdentChars", ("Vuna.Compiler.Loader.Modules.allIdentChars", "Vuna/Compiler/Loader/Modules.vuna:116"));
  ("Loader_dModules.v_allSegmentsValid", ("Vuna.Compiler.Loader.Modules.allSegmentsValid", "Vuna/Compiler/Loader/Modules.vuna:126"));
  ("Loader_dModules.v_anyCtorNamed", ("Vuna.Compiler.Loader.Modules.anyCtorNamed", "Vuna/Compiler/Loader/Modules.vuna:645"));
  ("Loader_dModules.v_anyCtorTarget", ("Vuna.Compiler.Loader.Modules.anyCtorTarget", "Vuna/Compiler/Loader/Modules.vuna:650"));
  ("Loader_dModules.v_anyModuleCtorTarget", ("Vuna.Compiler.Loader.Modules.anyModuleCtorTarget", "Vuna/Compiler/Loader/Modules.vuna:620"));
  ("Loader_dModules.v_candidateDir", ("Vuna.Compiler.Loader.Modules.candidateDir", "Vuna/Compiler/Loader/Modules.vuna:538"));
  ("Loader_dModules.v_checkImportAliasSyntax", ("Vuna.Compiler.Loader.Modules.checkImportAliasSyntax", "Vuna/Compiler/Loader/Modules.vuna:219"));
  ("Loader_dModules.v_collectModuleFiles", ("Vuna.Compiler.Loader.Modules.collectModuleFiles", "Vuna/Compiler/Loader/Modules.vuna:519"));
  ("Loader_dModules.v_ctorCanonical", ("Vuna.Compiler.Loader.Modules.ctorCanonical", "Vuna/Compiler/Loader/Modules.vuna:173"));
  ("Loader_dModules.v_dropFirst", ("Vuna.Compiler.Loader.Modules.dropFirst", "Vuna/Compiler/Loader/Modules.vuna:598"));
  ("Loader_dModules.v_entriesByName", ("Vuna.Compiler.Loader.Modules.entriesByName", "Vuna/Compiler/Loader/Modules.vuna:367"));
  ("Loader_dModules.v_exportIndexOf", ("Vuna.Compiler.Loader.Modules.exportIndexOf", "Vuna/Compiler/Loader/Modules.vuna:356"));
  ("Loader_dModules.v_exportIndexOfGo", ("Vuna.Compiler.Loader.Modules.exportIndexOfGo", "Vuna/Compiler/Loader/Modules.vuna:359"));
  ("Loader_dModules.v_exportIndexOfModule", ("Vuna.Compiler.Loader.Modules.exportIndexOfModule", "Vuna/Compiler/Loader/Modules.vuna:373"));
  ("Loader_dModules.v_exportsOf", ("Vuna.Compiler.Loader.Modules.exportsOf", "Vuna/Compiler/Loader/Modules.vuna:329"));
  ("Loader_dModules.v_filterCtors", ("Vuna.Compiler.Loader.Modules.filterCtors", "Vuna/Compiler/Loader/Modules.vuna:414"));
  ("Loader_dModules.v_filterKinds", ("Vuna.Compiler.Loader.Modules.filterKinds", "Vuna/Compiler/Loader/Modules.vuna:398"));
  ("Loader_dModules.v_findExportCtor", ("Vuna.Compiler.Loader.Modules.findExportCtor", "Vuna/Compiler/Loader/Modules.vuna:406"));
  ("Loader_dModules.v_findExportCtorIn", ("Vuna.Compiler.Loader.Modules.findExportCtorIn", "Vuna/Compiler/Loader/Modules.vuna:441"));
  ("Loader_dModules.v_findExportCtors", ("Vuna.Compiler.Loader.Modules.findExportCtors", "Vuna/Compiler/Loader/Modules.vuna:410"));
  ("Loader_dModules.v_findExportCtorsIn", ("Vuna.Compiler.Loader.Modules.findExportCtorsIn", "Vuna/Compiler/Loader/Modules.vuna:444"));
  ("Loader_dModules.v_findExportModule", ("Vuna.Compiler.Loader.Modules.findExportModule", "Vuna/Compiler/Loader/Modules.vuna:426"));
  ("Loader_dModules.v_findExportModuleIn", ("Vuna.Compiler.Loader.Modules.findExportModuleIn", "Vuna/Compiler/Loader/Modules.vuna:429"));
  ("Loader_dModules.v_findExportModules", ("Vuna.Compiler.Loader.Modules.findExportModules", "Vuna/Compiler/Loader/Modules.vuna:395"));
  ("Loader_dModules.v_findExportType", ("Vuna.Compiler.Loader.Modules.findExportType", "Vuna/Compiler/Loader/Modules.vuna:422"));
  ("Loader_dModules.v_findExportTypeIn", ("Vuna.Compiler.Loader.Modules.findExportTypeIn", "Vuna/Compiler/Loader/Modules.vuna:447"));
  ("Loader_dModules.v_findExportTypes", ("Vuna.Compiler.Loader.Modules.findExportTypes", "Vuna/Compiler/Loader/Modules.vuna:392"));
  ("Loader_dModules.v_findExportTypesIn", ("Vuna.Compiler.Loader.Modules.findExportTypesIn", "Vuna/Compiler/Loader/Modules.vuna:438"));
  ("Loader_dModules.v_findExportValue", ("Vuna.Compiler.Loader.Modules.findExportValue", "Vuna/Compiler/Loader/Modules.vuna:385"));
  ("Loader_dModules.v_findExportValueIn", ("Vuna.Compiler.Loader.Modules.findExportValueIn", "Vuna/Compiler/Loader/Modules.vuna:432"));
  ("Loader_dModules.v_findExportValues", ("Vuna.Compiler.Loader.Modules.findExportValues", "Vuna/Compiler/Loader/Modules.vuna:389"));
  ("Loader_dModules.v_findExportValuesIn", ("Vuna.Compiler.Loader.Modules.findExportValuesIn", "Vuna/Compiler/Loader/Modules.vuna:435"));
  ("Loader_dModules.v_findImportModule", ("Vuna.Compiler.Loader.Modules.findImportModule", "Vuna/Compiler/Loader/Modules.vuna:243"));
  ("Loader_dModules.v_findModule", ("Vuna.Compiler.Loader.Modules.findModule", "Vuna/Compiler/Loader/Modules.vuna:602"));
  ("Loader_dModules.v_findModuleFile", ("Vuna.Compiler.Loader.Modules.findModuleFile", "Vuna/Compiler/Loader/Modules.vuna:545"));
  ("Loader_dModules.v_importModuleNames", ("Vuna.Compiler.Loader.Modules.importModuleNames", "Vuna/Compiler/Loader/Modules.vuna:179"));
  ("Loader_dModules.v_importName", ("Vuna.Compiler.Loader.Modules.importName", "Vuna/Compiler/Loader/Modules.vuna:176"));
  ("Loader_dModules.v_isCtorCanonical", ("Vuna.Compiler.Loader.Modules.isCtorCanonical", "Vuna/Compiler/Loader/Modules.vuna:656"));
  ("Loader_dModules.v_isCtorTargetInDecls", ("Vuna.Compiler.Loader.Modules.isCtorTargetInDecls", "Vuna/Compiler/Loader/Modules.vuna:634"));
  ("Loader_dModules.v_isDataOrRecordCtorTarget", ("Vuna.Compiler.Loader.Modules.isDataOrRecordCtorTarget", "Vuna/Compiler/Loader/Modules.vuna:613"));
  ("Loader_dModules.v_isMangled", ("Vuna.Compiler.Loader.Modules.isMangled", "Vuna/Compiler/Loader/Modules.vuna:146"));
  ("Loader_dModules.v_lastSegment", ("Vuna.Compiler.Loader.Modules.lastSegment", "Vuna/Compiler/Loader/Modules.vuna:205"));
  ("Loader_dModules.v_longestIndexPrefix", ("Vuna.Compiler.Loader.Modules.longestIndexPrefix", "Vuna/Compiler/Loader/Modules.vuna:585"));
  ("Loader_dModules.v_lookupExport", ("Vuna.Compiler.Loader.Modules.lookupExport", "Vuna/Compiler/Loader/Modules.vuna:380"));
  ("Loader_dModules.v_mangle", ("Vuna.Compiler.Loader.Modules.mangle", "Vuna/Compiler/Loader/Modules.vuna:142"));
  ("Loader_dModules.v_missingModule", ("Vuna.Compiler.Loader.Modules.missingModule", "Vuna/Compiler/Loader/Modules.vuna:293"));
  ("Loader_dModules.v_moduleAllImportsOf", ("Vuna.Compiler.Loader.Modules.moduleAllImportsOf", "Vuna/Compiler/Loader/Modules.vuna:60"));
  ("Loader_dModules.v_moduleCtors", ("Vuna.Compiler.Loader.Modules.moduleCtors", "Vuna/Compiler/Loader/Modules.vuna:303"));
  ("Loader_dModules.v_moduleDecls", ("Vuna.Compiler.Loader.Modules.moduleDecls", "Vuna/Compiler/Loader/Modules.vuna:297"));
  ("Loader_dModules.v_moduleDeclsOf", ("Vuna.Compiler.Loader.Modules.moduleDeclsOf", "Vuna/Compiler/Loader/Modules.vuna:63"));
  ("Loader_dModules.v_moduleExportIndexOfOf", ("Vuna.Compiler.Loader.Modules.moduleExportIndexOfOf", "Vuna/Compiler/Loader/Modules.vuna:567"));
  ("Loader_dModules.v_moduleFixitiesOf", ("Vuna.Compiler.Loader.Modules.moduleFixitiesOf", "Vuna/Compiler/Loader/Modules.vuna:66"));
  ("Loader_dModules.v_moduleNameOf", ("Vuna.Compiler.Loader.Modules.moduleNameOf", "Vuna/Compiler/Loader/Modules.vuna:54"));
  ("Loader_dModules.v_moduleOpaqueOf", ("Vuna.Compiler.Loader.Modules.moduleOpaqueOf", "Vuna/Compiler/Loader/Modules.vuna:73"));
  ("Loader_dModules.v_modulePackageOf", ("Vuna.Compiler.Loader.Modules.modulePackageOf", "Vuna/Compiler/Loader/Modules.vuna:57"));
  ("Loader_dModules.v_modulePath", ("Vuna.Compiler.Loader.Modules.modulePath", "Vuna/Compiler/Loader/Modules.vuna:507"));
  ("Loader_dModules.v_moduleReexportsOf", ("Vuna.Compiler.Loader.Modules.moduleReexportsOf", "Vuna/Compiler/Loader/Modules.vuna:70"));
  ("Loader_dModules.v_modulesExportingCtor", ("Vuna.Compiler.Loader.Modules.modulesExportingCtor", "Vuna/Compiler/Loader/Modules.vuna:475"));
  ("Loader_dModules.v_modulesExportingCtorFrom", ("Vuna.Compiler.Loader.Modules.modulesExportingCtorFrom", "Vuna/Compiler/Loader/Modules.vuna:465"));
  ("Loader_dModules.v_modulesExportingType", ("Vuna.Compiler.Loader.Modules.modulesExportingType", "Vuna/Compiler/Loader/Modules.vuna:489"));
  ("Loader_dModules.v_modulesExportingTypeFrom", ("Vuna.Compiler.Loader.Modules.modulesExportingTypeFrom", "Vuna/Compiler/Loader/Modules.vuna:479"));
  ("Loader_dModules.v_modulesExportingValue", ("Vuna.Compiler.Loader.Modules.modulesExportingValue", "Vuna/Compiler/Loader/Modules.vuna:460"));
  ("Loader_dModules.v_modulesExportingValueFrom", ("Vuna.Compiler.Loader.Modules.modulesExportingValueFrom", "Vuna/Compiler/Loader/Modules.vuna:450"));
  ("Loader_dModules.v_normalizeImports", ("Vuna.Compiler.Loader.Modules.normalizeImports", "Vuna/Compiler/Loader/Modules.vuna:344"));
  ("Loader_dModules.v_notEmptyList", ("Vuna.Compiler.Loader.Modules.notEmptyList", "Vuna/Compiler/Loader/Modules.vuna:210"));
  ("Loader_dModules.v_openModuleNames", ("Vuna.Compiler.Loader.Modules.openModuleNames", "Vuna/Compiler/Loader/Modules.vuna:230"));
  ("Loader_dModules.v_openModuleNamesAll", ("Vuna.Compiler.Loader.Modules.openModuleNamesAll", "Vuna/Compiler/Loader/Modules.vuna:234"));
  ("Loader_dModules.v_projectEntryAllImports", ("Vuna.Compiler.Loader.Modules.projectEntryAllImports", "Vuna/Compiler/Loader/Modules.vuna:76"));
  ("Loader_dModules.v_qualifierCandidates", ("Vuna.Compiler.Loader.Modules.qualifierCandidates", "Vuna/Compiler/Loader/Modules.vuna:188"));
  ("Loader_dModules.v_reexportedImportNames", ("Vuna.Compiler.Loader.Modules.reexportedImportNames", "Vuna/Compiler/Loader/Modules.vuna:255"));
  ("Loader_dModules.v_reexportedImportNamesGo", ("Vuna.Compiler.Loader.Modules.reexportedImportNamesGo", "Vuna/Compiler/Loader/Modules.vuna:258"));
  ("Loader_dModules.v_reexportedImportNamesOfHeader", ("Vuna.Compiler.Loader.Modules.reexportedImportNamesOfHeader", "Vuna/Compiler/Loader/Modules.vuna:279"));
  ("Loader_dModules.v_resolveModuleName", ("Vuna.Compiler.Loader.Modules.resolveModuleName", "Vuna/Compiler/Loader/Modules.vuna:309"));
  ("Loader_dModules.v_resolvePathModule", ("Vuna.Compiler.Loader.Modules.resolvePathModule", "Vuna/Compiler/Loader/Modules.vuna:318"));
  ("Loader_dModules.v_resolvedName", ("Vuna.Compiler.Loader.Modules.resolvedName", "Vuna/Compiler/Loader/Modules.vuna:335"));
  ("Loader_dModules.v_rootAllows", ("Vuna.Compiler.Loader.Modules.rootAllows", "Vuna/Compiler/Loader/Modules.vuna:511"));
  ("Loader_dModules.v_sameTargetRest", ("Vuna.Compiler.Loader.Modules.sameTargetRest", "Vuna/Compiler/Loader/Modules.vuna:494"));
  ("Loader_dModules.v_sliceEq", ("Vuna.Compiler.Loader.Modules.sliceEq", "Vuna/Compiler/Loader/Modules.vuna:157"));
  ("Loader_dModules.v_sliceEqGo", ("Vuna.Compiler.Loader.Modules.sliceEqGo", "Vuna/Compiler/Loader/Modules.vuna:160"));
  ("Loader_dModules.v_takeSegsLocal", ("Vuna.Compiler.Loader.Modules.takeSegsLocal", "Vuna/Compiler/Loader/Modules.vuna:594"));
  ("Loader_dModules.v_unifyEntryPairs", ("Vuna.Compiler.Loader.Modules.unifyEntryPairs", "Vuna/Compiler/Loader/Modules.vuna:498"));
  ("Loader_dModules.v_validModuleName", ("Vuna.Compiler.Loader.Modules.validModuleName", "Vuna/Compiler/Loader/Modules.vuna:136"));
  ("Loader_dModules.v_validSegment", ("Vuna.Compiler.Loader.Modules.validSegment", "Vuna/Compiler/Loader/Modules.vuna:120"));
  ("Loader_dModules.v_validateImports", ("Vuna.Compiler.Loader.Modules.validateImports", "Vuna/Compiler/Loader/Modules.vuna:216"));
  ("Loader_dModules.v_walkNamespaceIndex", ("Vuna.Compiler.Loader.Modules.walkNamespaceIndex", "Vuna/Compiler/Loader/Modules.vuna:564"));
  ("Loader_dModules.v_walkNamespaceIndexFuel", ("Vuna.Compiler.Loader.Modules.walkNamespaceIndexFuel", "Vuna/Compiler/Loader/Modules.vuna:570"));
  ("Loader_dModules.v_withImportSite", ("Vuna.Compiler.Loader.Modules.withImportSite", "Vuna/Compiler/Loader/Modules.vuna:183"));
  ("Loader_dModules.v_withImporterSpan", ("Vuna.Compiler.Loader.Modules.withImporterSpan", "Vuna/Compiler/Loader/Modules.vuna:542"));
  ("Loader_dResolve.v_allEmptyTails", ("Vuna.Compiler.Loader.Resolve.allEmptyTails", "Vuna/Compiler/Loader/Resolve.vuna:626"));
  ("Loader_dResolve.v_allEq", ("Vuna.Compiler.Loader.Resolve.allEq", "Vuna/Compiler/Loader/Resolve.vuna:467"));
  ("Loader_dResolve.v_allSameTarget", ("Vuna.Compiler.Loader.Resolve.allSameTarget", "Vuna/Compiler/Loader/Resolve.vuna:462"));
  ("Loader_dResolve.v_anyCtorNamed", ("Vuna.Compiler.Loader.Resolve.anyCtorNamed", "Vuna/Compiler/Loader/Resolve.vuna:369"));
  ("Loader_dResolve.v_builtinArity", ("Vuna.Compiler.Loader.Resolve.builtinArity", "Vuna/Compiler/Loader/Resolve.vuna:44"));
  ("Loader_dResolve.v_checkBinder", ("Vuna.Compiler.Loader.Resolve.checkBinder", "Vuna/Compiler/Loader/Resolve.vuna:732"));
  ("Loader_dResolve.v_checkDebugConstruct", ("Vuna.Compiler.Loader.Resolve.checkDebugConstruct", "Vuna/Compiler/Loader/Resolve.vuna:914"));
  ("Loader_dResolve.v_checkTopName", ("Vuna.Compiler.Loader.Resolve.checkTopName", "Vuna/Compiler/Loader/Resolve.vuna:736"));
  ("Loader_dResolve.v_collectRecBinds", ("Vuna.Compiler.Loader.Resolve.collectRecBinds", "Vuna/Compiler/Loader/Resolve.vuna:856"));
  ("Loader_dResolve.v_commaJoin", ("Vuna.Compiler.Loader.Resolve.commaJoin", "Vuna/Compiler/Loader/Resolve.vuna:277"));
  ("Loader_dResolve.v_concatLeft", ("Vuna.Compiler.Loader.Resolve.concatLeft", "Vuna/Compiler/Loader/Resolve.vuna:906"));
  ("Loader_dResolve.v_constraintHeadOf", ("Vuna.Compiler.Loader.Resolve.constraintHeadOf", "Vuna/Compiler/Loader/Resolve.vuna:1238"));
  ("Loader_dResolve.v_ctorCandidates", ("Vuna.Compiler.Loader.Resolve.ctorCandidates", "Vuna/Compiler/Loader/Resolve.vuna:183"));
  ("Loader_dResolve.v_ctorCandsOf", ("Vuna.Compiler.Loader.Resolve.ctorCandsOf", "Vuna/Compiler/Loader/Resolve.vuna:115"));
  ("Loader_dResolve.v_ctorEntryHits", ("Vuna.Compiler.Loader.Resolve.ctorEntryHits", "Vuna/Compiler/Loader/Resolve.vuna:473"));
  ("Loader_dResolve.v_ctorFamilyEntryOf", ("Vuna.Compiler.Loader.Resolve.ctorFamilyEntryOf", "Vuna/Compiler/Loader/Resolve.vuna:490"));
  ("Loader_dResolve.v_ctorFamilyHits", ("Vuna.Compiler.Loader.Resolve.ctorFamilyHits", "Vuna/Compiler/Loader/Resolve.vuna:493"));
  ("Loader_dResolve.v_ctorPairTargets", ("Vuna.Compiler.Loader.Resolve.ctorPairTargets", "Vuna/Compiler/Loader/Resolve.vuna:1438"));
  ("Loader_dResolve.v_ctorRelFamily", ("Vuna.Compiler.Loader.Resolve.ctorRelFamily", "Vuna/Compiler/Loader/Resolve.vuna:382"));
  ("Loader_dResolve.v_ctorTargetInDecls", ("Vuna.Compiler.Loader.Resolve.ctorTargetInDecls", "Vuna/Compiler/Loader/Resolve.vuna:352"));
  ("Loader_dResolve.v_ctorTargetInFamily", ("Vuna.Compiler.Loader.Resolve.ctorTargetInFamily", "Vuna/Compiler/Loader/Resolve.vuna:388"));
  ("Loader_dResolve.v_declValueNames", ("Vuna.Compiler.Loader.Resolve.declValueNames", "Vuna/Compiler/Loader/Resolve.vuna:95"));
  ("Loader_dResolve.v_dropSegs", ("Vuna.Compiler.Loader.Resolve.dropSegs", "Vuna/Compiler/Loader/Resolve.vuna:574"));
  ("Loader_dResolve.v_dtPreludeNames", ("Vuna.Compiler.Loader.Resolve.dtPreludeNames", "Vuna/Compiler/Loader/Resolve.vuna:66"));
  ("Loader_dResolve.v_entryHits", ("Vuna.Compiler.Loader.Resolve.entryHits", "Vuna/Compiler/Loader/Resolve.vuna:300"));
  ("Loader_dResolve.v_exportTarget", ("Vuna.Compiler.Loader.Resolve.exportTarget", "Vuna/Compiler/Loader/Resolve.vuna:449"));
  ("Loader_dResolve.v_exprLowerNames", ("Vuna.Compiler.Loader.Resolve.exprLowerNames", "Vuna/Compiler/Loader/Resolve.vuna:1387"));
  ("Loader_dResolve.v_findFamilyCtorInModules", ("Vuna.Compiler.Loader.Resolve.findFamilyCtorInModules", "Vuna/Compiler/Loader/Resolve.vuna:374"));
  ("Loader_dResolve.v_firstModuleOf", ("Vuna.Compiler.Loader.Resolve.firstModuleOf", "Vuna/Compiler/Loader/Resolve.vuna:295"));
  ("Loader_dResolve.v_foldFieldChain", ("Vuna.Compiler.Loader.Resolve.foldFieldChain", "Vuna/Compiler/Loader/Resolve.vuna:566"));
  ("Loader_dResolve.v_hiddenRef", ("Vuna.Compiler.Loader.Resolve.hiddenRef", "Vuna/Compiler/Loader/Resolve.vuna:948"));
  ("Loader_dResolve.v_implicitScopeTable", ("Vuna.Compiler.Loader.Resolve.implicitScopeTable", "Vuna/Compiler/Loader/Resolve.vuna:1368"));
  ("Loader_dResolve.v_importedCtorTargets", ("Vuna.Compiler.Loader.Resolve.importedCtorTargets", "Vuna/Compiler/Loader/Resolve.vuna:174"));
  ("Loader_dResolve.v_isBuiltinName", ("Vuna.Compiler.Loader.Resolve.isBuiltinName", "Vuna/Compiler/Loader/Resolve.vuna:50"));
  ("Loader_dResolve.v_isDtPreludeName", ("Vuna.Compiler.Loader.Resolve.isDtPreludeName", "Vuna/Compiler/Loader/Resolve.vuna:63"));
  ("Loader_dResolve.v_isEmptyPaths", ("Vuna.Compiler.Loader.Resolve.isEmptyPaths", "Vuna/Compiler/Loader/Resolve.vuna:633"));
  ("Loader_dResolve.v_isLowerIdent", ("Vuna.Compiler.Loader.Resolve.isLowerIdent", "Vuna/Compiler/Loader/Resolve.vuna:1392"));
  ("Loader_dResolve.v_isLowerTypeName", ("Vuna.Compiler.Loader.Resolve.isLowerTypeName", "Vuna/Compiler/Loader/Resolve.vuna:1103"));
  ("Loader_dResolve.v_isParserSyntaxName", ("Vuna.Compiler.Loader.Resolve.isParserSyntaxName", "Vuna/Compiler/Loader/Resolve.vuna:929"));
  ("Loader_dResolve.v_isStringDomainExpr", ("Vuna.Compiler.Loader.Resolve.isStringDomainExpr", "Vuna/Compiler/Loader/Resolve.vuna:1445"));
  ("Loader_dResolve.v_lastSegmentOf", ("Vuna.Compiler.Loader.Resolve.lastSegmentOf", "Vuna/Compiler/Loader/Resolve.vuna:282"));
  ("Loader_dResolve.v_leadingImplicitNames", ("Vuna.Compiler.Loader.Resolve.leadingImplicitNames", "Vuna/Compiler/Loader/Resolve.vuna:1380"));
  ("Loader_dResolve.v_localCtorResult", ("Vuna.Compiler.Loader.Resolve.localCtorResult", "Vuna/Compiler/Loader/Resolve.vuna:1143"));
  ("Loader_dResolve.v_localCtorTarget", ("Vuna.Compiler.Loader.Resolve.localCtorTarget", "Vuna/Compiler/Loader/Resolve.vuna:155"));
  ("Loader_dResolve.v_localCtorTargets", ("Vuna.Compiler.Loader.Resolve.localCtorTargets", "Vuna/Compiler/Loader/Resolve.vuna:150"));
  ("Loader_dResolve.v_longestNamespaceEntry", ("Vuna.Compiler.Loader.Resolve.longestNamespaceEntry", "Vuna/Compiler/Loader/Resolve.vuna:217"));
  ("Loader_dResolve.v_longestNamespaceEntryGo", ("Vuna.Compiler.Loader.Resolve.longestNamespaceEntryGo", "Vuna/Compiler/Loader/Resolve.vuna:220"));
  ("Loader_dResolve.v_lowerTemplate", ("Vuna.Compiler.Loader.Resolve.lowerTemplate", "Vuna/Compiler/Loader/Resolve.vuna:893"));
  ("Loader_dResolve.v_memPathKey", ("Vuna.Compiler.Loader.Resolve.memPathKey", "Vuna/Compiler/Loader/Resolve.vuna:273"));
  ("Loader_dResolve.v_memberLabel", ("Vuna.Compiler.Loader.Resolve.memberLabel", "Vuna/Compiler/Loader/Resolve.vuna:288"));
  ("Loader_dResolve.v_namespacesOf", ("Vuna.Compiler.Loader.Resolve.namespacesOf", "Vuna/Compiler/Loader/Resolve.vuna:145"));
  ("Loader_dResolve.v_namespacesOfWith", ("Vuna.Compiler.Loader.Resolve.namespacesOfWith", "Vuna/Compiler/Loader/Resolve.vuna:126"));
  ("Loader_dResolve.v_normalizeSyntaxNames", ("Vuna.Compiler.Loader.Resolve.normalizeSyntaxNames", "Vuna/Compiler/Loader/Resolve.vuna:958"));
  ("Loader_dResolve.v_normalizeTypeSyntaxNames", ("Vuna.Compiler.Loader.Resolve.normalizeTypeSyntaxNames", "Vuna/Compiler/Loader/Resolve.vuna:1250"));
  ("Loader_dResolve.v_notEmptyList", ("Vuna.Compiler.Loader.Resolve.notEmptyList", "Vuna/Compiler/Loader/Resolve.vuna:193"));
  ("Loader_dResolve.v_pairExportTarget", ("Vuna.Compiler.Loader.Resolve.pairExportTarget", "Vuna/Compiler/Loader/Resolve.vuna:166"));
  ("Loader_dResolve.v_pairIsDataCtor", ("Vuna.Compiler.Loader.Resolve.pairIsDataCtor", "Vuna/Compiler/Loader/Resolve.vuna:170"));
  ("Loader_dResolve.v_pathEntryHits", ("Vuna.Compiler.Loader.Resolve.pathEntryHits", "Vuna/Compiler/Loader/Resolve.vuna:578"));
  ("Loader_dResolve.v_pathKey", ("Vuna.Compiler.Loader.Resolve.pathKey", "Vuna/Compiler/Loader/Resolve.vuna:270"));
  ("Loader_dResolve.v_pickCtorOrOver", ("Vuna.Compiler.Loader.Resolve.pickCtorOrOver", "Vuna/Compiler/Loader/Resolve.vuna:701"));
  ("Loader_dResolve.v_pickTypeEntries", ("Vuna.Compiler.Loader.Resolve.pickTypeEntries", "Vuna/Compiler/Loader/Resolve.vuna:328"));
  ("Loader_dResolve.v_pickValueEntries", ("Vuna.Compiler.Loader.Resolve.pickValueEntries", "Vuna/Compiler/Loader/Resolve.vuna:322"));
  ("Loader_dResolve.v_pickValueEntry", ("Vuna.Compiler.Loader.Resolve.pickValueEntry", "Vuna/Compiler/Loader/Resolve.vuna:316"));
  ("Loader_dResolve.v_pickValueOrOver", ("Vuna.Compiler.Loader.Resolve.pickValueOrOver", "Vuna/Compiler/Loader/Resolve.vuna:693"));
  ("Loader_dResolve.v_realModuleName", ("Vuna.Compiler.Loader.Resolve.realModuleName", "Vuna/Compiler/Loader/Resolve.vuna:237"));
  ("Loader_dResolve.v_resolveAlt", ("Vuna.Compiler.Loader.Resolve.resolveAlt", "Vuna/Compiler/Loader/Resolve.vuna:771"));
  ("Loader_dResolve.v_resolveConstraintExpr", ("Vuna.Compiler.Loader.Resolve.resolveConstraintExpr", "Vuna/Compiler/Loader/Resolve.vuna:1229"));
  ("Loader_dResolve.v_resolveCtor", ("Vuna.Compiler.Loader.Resolve.resolveCtor", "Vuna/Compiler/Loader/Resolve.vuna:709"));
  ("Loader_dResolve.v_resolveCtorDecl", ("Vuna.Compiler.Loader.Resolve.resolveCtorDecl", "Vuna/Compiler/Loader/Resolve.vuna:1097"));
  ("Loader_dResolve.v_resolveCtorDotted", ("Vuna.Compiler.Loader.Resolve.resolveCtorDotted", "Vuna/Compiler/Loader/Resolve.vuna:518"));
  ("Loader_dResolve.v_resolveCtorSpec", ("Vuna.Compiler.Loader.Resolve.resolveCtorSpec", "Vuna/Compiler/Loader/Resolve.vuna:1289"));
  ("Loader_dResolve.v_resolveDecl", ("Vuna.Compiler.Loader.Resolve.resolveDecl", "Vuna/Compiler/Loader/Resolve.vuna:1295"));
  ("Loader_dResolve.v_resolveDeclWithImplicitScopes", ("Vuna.Compiler.Loader.Resolve.resolveDeclWithImplicitScopes", "Vuna/Compiler/Loader/Resolve.vuna:1402"));
  ("Loader_dResolve.v_resolveDo", ("Vuna.Compiler.Loader.Resolve.resolveDo", "Vuna/Compiler/Loader/Resolve.vuna:1045"));
  ("Loader_dResolve.v_resolveDoBind", ("Vuna.Compiler.Loader.Resolve.resolveDoBind", "Vuna/Compiler/Loader/Resolve.vuna:1058"));
  ("Loader_dResolve.v_resolveDoChain", ("Vuna.Compiler.Loader.Resolve.resolveDoChain", "Vuna/Compiler/Loader/Resolve.vuna:1074"));
  ("Loader_dResolve.v_resolveDottedExpr", ("Vuna.Compiler.Loader.Resolve.resolveDottedExpr", "Vuna/Compiler/Loader/Resolve.vuna:541"));
  ("Loader_dResolve.v_resolveDottedTypeName", ("Vuna.Compiler.Loader.Resolve.resolveDottedTypeName", "Vuna/Compiler/Loader/Resolve.vuna:1207"));
  ("Loader_dResolve.v_resolveDottedTypeTargetOnly", ("Vuna.Compiler.Loader.Resolve.resolveDottedTypeTargetOnly", "Vuna/Compiler/Loader/Resolve.vuna:416"));
  ("Loader_dResolve.v_resolveEntry", ("Vuna.Compiler.Loader.Resolve.resolveEntry", "Vuna/Compiler/Loader/Resolve.vuna:1411"));
  ("Loader_dResolve.v_resolveExpr", ("Vuna.Compiler.Loader.Resolve.resolveExpr", "Vuna/Compiler/Loader/Resolve.vuna:967"));
  ("Loader_dResolve.v_resolveExprRaw", ("Vuna.Compiler.Loader.Resolve.resolveExprRaw", "Vuna/Compiler/Loader/Resolve.vuna:976"));
  ("Loader_dResolve.v_resolveFamilyQualifiedCtor", ("Vuna.Compiler.Loader.Resolve.resolveFamilyQualifiedCtor", "Vuna/Compiler/Loader/Resolve.vuna:432"));
  ("Loader_dResolve.v_resolveFieldValue", ("Vuna.Compiler.Loader.Resolve.resolveFieldValue", "Vuna/Compiler/Loader/Resolve.vuna:1087"));
  ("Loader_dResolve.v_resolveFuelBound", ("Vuna.Compiler.Loader.Resolve.resolveFuelBound", "Vuna/Compiler/Loader/Resolve.vuna:40"));
  ("Loader_dResolve.v_resolveGlobal", ("Vuna.Compiler.Loader.Resolve.resolveGlobal", "Vuna/Compiler/Loader/Resolve.vuna:642"));
  ("Loader_dResolve.v_resolveInstanceMethod", ("Vuna.Compiler.Loader.Resolve.resolveInstanceMethod", "Vuna/Compiler/Loader/Resolve.vuna:1344"));
  ("Loader_dResolve.v_resolveInterpParts", ("Vuna.Compiler.Loader.Resolve.resolveInterpParts", "Vuna/Compiler/Loader/Resolve.vuna:1026"));
  ("Loader_dResolve.v_resolveLet", ("Vuna.Compiler.Loader.Resolve.resolveLet", "Vuna/Compiler/Loader/Resolve.vuna:812"));
  ("Loader_dResolve.v_resolveLetSeq", ("Vuna.Compiler.Loader.Resolve.resolveLetSeq", "Vuna/Compiler/Loader/Resolve.vuna:821"));
  ("Loader_dResolve.v_resolveLocalClause", ("Vuna.Compiler.Loader.Resolve.resolveLocalClause", "Vuna/Compiler/Loader/Resolve.vuna:783"));
  ("Loader_dResolve.v_resolveLocalPats", ("Vuna.Compiler.Loader.Resolve.resolveLocalPats", "Vuna/Compiler/Loader/Resolve.vuna:794"));
  ("Loader_dResolve.v_resolveLowerTypeName", ("Vuna.Compiler.Loader.Resolve.resolveLowerTypeName", "Vuna/Compiler/Loader/Resolve.vuna:1151"));
  ("Loader_dResolve.v_resolveModules", ("Vuna.Compiler.Loader.Resolve.resolveModules", "Vuna/Compiler/Loader/Resolve.vuna:1415"));
  ("Loader_dResolve.v_resolveNonLowerTypeName", ("Vuna.Compiler.Loader.Resolve.resolveNonLowerTypeName", "Vuna/Compiler/Loader/Resolve.vuna:1182"));
  ("Loader_dResolve.v_resolvePathPrefixes", ("Vuna.Compiler.Loader.Resolve.resolvePathPrefixes", "Vuna/Compiler/Loader/Resolve.vuna:231"));
  ("Loader_dResolve.v_resolvePathPrefixesTry", ("Vuna.Compiler.Loader.Resolve.resolvePathPrefixesTry", "Vuna/Compiler/Loader/Resolve.vuna:243"));
  ("Loader_dResolve.v_resolvePattern", ("Vuna.Compiler.Loader.Resolve.resolvePattern", "Vuna/Compiler/Loader/Resolve.vuna:746"));
  ("Loader_dResolve.v_resolveProgram", ("Vuna.Compiler.Loader.Resolve.resolveProgram", "Vuna/Compiler/Loader/Resolve.vuna:1356"));
  ("Loader_dResolve.v_resolveQualified", ("Vuna.Compiler.Loader.Resolve.resolveQualified", "Vuna/Compiler/Loader/Resolve.vuna:334"));
  ("Loader_dResolve.v_resolveQualifiedPath", ("Vuna.Compiler.Loader.Resolve.resolveQualifiedPath", "Vuna/Compiler/Loader/Resolve.vuna:609"));
  ("Loader_dResolve.v_resolveRecLet", ("Vuna.Compiler.Loader.Resolve.resolveRecLet", "Vuna/Compiler/Loader/Resolve.vuna:844"));
  ("Loader_dResolve.v_resolveRecValues", ("Vuna.Compiler.Loader.Resolve.resolveRecValues", "Vuna/Compiler/Loader/Resolve.vuna:872"));
  ("Loader_dResolve.v_resolveRecordField", ("Vuna.Compiler.Loader.Resolve.resolveRecordField", "Vuna/Compiler/Loader/Resolve.vuna:1332"));
  ("Loader_dResolve.v_resolveRecordPatternField", ("Vuna.Compiler.Loader.Resolve.resolveRecordPatternField", "Vuna/Compiler/Loader/Resolve.vuna:760"));
  ("Loader_dResolve.v_resolveTopName", ("Vuna.Compiler.Loader.Resolve.resolveTopName", "Vuna/Compiler/Loader/Resolve.vuna:742"));
  ("Loader_dResolve.v_resolveTraitMethod", ("Vuna.Compiler.Loader.Resolve.resolveTraitMethod", "Vuna/Compiler/Loader/Resolve.vuna:1338"));
  ("Loader_dResolve.v_resolveTypeExpr", ("Vuna.Compiler.Loader.Resolve.resolveTypeExpr", "Vuna/Compiler/Loader/Resolve.vuna:1243"));
  ("Loader_dResolve.v_resolveTypeExprScoped", ("Vuna.Compiler.Loader.Resolve.resolveTypeExprScoped", "Vuna/Compiler/Loader/Resolve.vuna:1257"));
  ("Loader_dResolve.v_resolveTypeExprScopedRaw", ("Vuna.Compiler.Loader.Resolve.resolveTypeExprScopedRaw", "Vuna/Compiler/Loader/Resolve.vuna:1266"));
  ("Loader_dResolve.v_resolveTypeName", ("Vuna.Compiler.Loader.Resolve.resolveTypeName", "Vuna/Compiler/Loader/Resolve.vuna:1128"));
  ("Loader_dResolve.v_resolveTypeTarget", ("Vuna.Compiler.Loader.Resolve.resolveTypeTarget", "Vuna/Compiler/Loader/Resolve.vuna:397"));
  ("Loader_dResolve.v_resolveTypeTopName", ("Vuna.Compiler.Loader.Resolve.resolveTypeTopName", "Vuna/Compiler/Loader/Resolve.vuna:1284"));
  ("Loader_dResolve.v_scopeNamesOf", ("Vuna.Compiler.Loader.Resolve.scopeNamesOf", "Vuna/Compiler/Loader/Resolve.vuna:1398"));
  ("Loader_dResolve.v_startsUpperName", ("Vuna.Compiler.Loader.Resolve.startsUpperName", "Vuna/Compiler/Loader/Resolve.vuna:1109"));
  ("Loader_dResolve.v_takeSegs", ("Vuna.Compiler.Loader.Resolve.takeSegs", "Vuna/Compiler/Loader/Resolve.vuna:570"));
  ("Loader_dResolve.v_templateChunks", ("Vuna.Compiler.Loader.Resolve.templateChunks", "Vuna/Compiler/Loader/Resolve.vuna:899"));
  ("Loader_dResolve.v_traitImportHint", ("Vuna.Compiler.Loader.Resolve.traitImportHint", "Vuna/Compiler/Loader/Resolve.vuna:73"));
  ("Loader_dResolve.v_tyShape", ("Vuna.Compiler.Loader.Resolve.tyShape", "Vuna/Compiler/Loader/Resolve.vuna:1422"));
  ("Loader_dResolve.v_uniqPathResults", ("Vuna.Compiler.Loader.Resolve.uniqPathResults", "Vuna/Compiler/Loader/Resolve.vuna:265"));
  ("Loader_dResolve.v_uniqPathTargets", ("Vuna.Compiler.Loader.Resolve.uniqPathTargets", "Vuna/Compiler/Loader/Resolve.vuna:604"));
  ("Loader_dResolve.v_uniqueCtorTarget", ("Vuna.Compiler.Loader.Resolve.uniqueCtorTarget", "Vuna/Compiler/Loader/Resolve.vuna:453"));
  ("Loader_dResolve.v_valueNamesOf", ("Vuna.Compiler.Loader.Resolve.valueNamesOf", "Vuna/Compiler/Loader/Resolve.vuna:107"));
  ("Loader_dResolve.v_walkNamespaceCandidates", ("Vuna.Compiler.Loader.Resolve.walkNamespaceCandidates", "Vuna/Compiler/Loader/Resolve.vuna:258"));
  ("Loader_dResolve.v_walkNamespacePaths", ("Vuna.Compiler.Loader.Resolve.walkNamespacePaths", "Vuna/Compiler/Loader/Resolve.vuna:199"));
  ("Loader_dResolve.v_walkNamespacePathsFuel", ("Vuna.Compiler.Loader.Resolve.walkNamespacePathsFuel", "Vuna/Compiler/Loader/Resolve.vuna:202"));
  ("Lowering_dChecks.v_addName", ("Vuna.Compiler.Lowering.Checks.addName", "Vuna/Compiler/Lowering/Checks.vuna:256"));
  ("Lowering_dChecks.v_addRuntimeDep", ("Vuna.Compiler.Lowering.Checks.addRuntimeDep", "Vuna/Compiler/Lowering/Checks.vuna:297"));
  ("Lowering_dChecks.v_axiomNamesOf", ("Vuna.Compiler.Lowering.Checks.axiomNamesOf", "Vuna/Compiler/Lowering/Checks.vuna:70"));
  ("Lowering_dChecks.v_binderAt", ("Vuna.Compiler.Lowering.Checks.binderAt", "Vuna/Compiler/Lowering/Checks.vuna:200"));
  ("Lowering_dChecks.v_checkAllDefScopes", ("Vuna.Compiler.Lowering.Checks.checkAllDefScopes", "Vuna/Compiler/Lowering/Checks.vuna:430"));
  ("Lowering_dChecks.v_checkAllErasure", ("Vuna.Compiler.Lowering.Checks.checkAllErasure", "Vuna/Compiler/Lowering/Checks.vuna:116"));
  ("Lowering_dChecks.v_checkAltErasure", ("Vuna.Compiler.Lowering.Checks.checkAltErasure", "Vuna/Compiler/Lowering/Checks.vuna:485"));
  ("Lowering_dChecks.v_checkAltErasureFuel", ("Vuna.Compiler.Lowering.Checks.checkAltErasureFuel", "Vuna/Compiler/Lowering/Checks.vuna:189"));
  ("Lowering_dChecks.v_checkAltScopes", ("Vuna.Compiler.Lowering.Checks.checkAltScopes", "Vuna/Compiler/Lowering/Checks.vuna:423"));
  ("Lowering_dChecks.v_checkConArgsErasure", ("Vuna.Compiler.Lowering.Checks.checkConArgsErasure", "Vuna/Compiler/Lowering/Checks.vuna:481"));
  ("Lowering_dChecks.v_checkConArgsErasureFuel", ("Vuna.Compiler.Lowering.Checks.checkConArgsErasureFuel", "Vuna/Compiler/Lowering/Checks.vuna:177"));
  ("Lowering_dChecks.v_checkErasure", ("Vuna.Compiler.Lowering.Checks.checkErasure", "Vuna/Compiler/Lowering/Checks.vuna:451"));
  ("Lowering_dChecks.v_checkErasureFuel", ("Vuna.Compiler.Lowering.Checks.checkErasureFuel", "Vuna/Compiler/Lowering/Checks.vuna:457"));
  ("Lowering_dChecks.v_checkErasureNode", ("Vuna.Compiler.Lowering.Checks.checkErasureNode", "Vuna/Compiler/Lowering/Checks.vuna:142"));
  ("Lowering_dChecks.v_checkNoAxiomRuntime", ("Vuna.Compiler.Lowering.Checks.checkNoAxiomRuntime", "Vuna/Compiler/Lowering/Checks.vuna:102"));
  ("Lowering_dChecks.v_checkNoAxiomRuntimeGo", ("Vuna.Compiler.Lowering.Checks.checkNoAxiomRuntimeGo", "Vuna/Compiler/Lowering/Checks.vuna:105"));
  ("Lowering_dChecks.v_checkOneErasure", ("Vuna.Compiler.Lowering.Checks.checkOneErasure", "Vuna/Compiler/Lowering/Checks.vuna:125"));
  ("Lowering_dChecks.v_checkTermScopes", ("Vuna.Compiler.Lowering.Checks.checkTermScopes", "Vuna/Compiler/Lowering/Checks.vuna:369"));
  ("Lowering_dChecks.v_checkTermScopesArgs", ("Vuna.Compiler.Lowering.Checks.checkTermScopesArgs", "Vuna/Compiler/Lowering/Checks.vuna:418"));
  ("Lowering_dChecks.v_checkTermScopesMaybe", ("Vuna.Compiler.Lowering.Checks.checkTermScopesMaybe", "Vuna/Compiler/Lowering/Checks.vuna:407"));
  ("Lowering_dChecks.v_checkTermScopesSlot", ("Vuna.Compiler.Lowering.Checks.checkTermScopesSlot", "Vuna/Compiler/Lowering/Checks.vuna:411"));
  ("Lowering_dChecks.v_defLocDiag", ("Vuna.Compiler.Lowering.Checks.defLocDiag", "Vuna/Compiler/Lowering/Checks.vuna:97"));
  ("Lowering_dChecks.v_defTable", ("Vuna.Compiler.Lowering.Checks.defTable", "Vuna/Compiler/Lowering/Checks.vuna:54"));
  ("Lowering_dChecks.v_erasureFuelFor", ("Vuna.Compiler.Lowering.Checks.erasureFuelFor", "Vuna/Compiler/Lowering/Checks.vuna:468"));
  ("Lowering_dChecks.v_erasureFuelForAlts", ("Vuna.Compiler.Lowering.Checks.erasureFuelForAlts", "Vuna/Compiler/Lowering/Checks.vuna:488"));
  ("Lowering_dChecks.v_erasureFuelForArgs", ("Vuna.Compiler.Lowering.Checks.erasureFuelForArgs", "Vuna/Compiler/Lowering/Checks.vuna:477"));
  ("Lowering_dChecks.v_erasureFuelMax", ("Vuna.Compiler.Lowering.Checks.erasureFuelMax", "Vuna/Compiler/Lowering/Checks.vuna:474"));
  ("Lowering_dChecks.v_findDtDef", ("Vuna.Compiler.Lowering.Checks.findDtDef", "Vuna/Compiler/Lowering/Checks.vuna:62"));
  ("Lowering_dChecks.v_flattenAppSpine", ("Vuna.Compiler.Lowering.Checks.flattenAppSpine", "Vuna/Compiler/Lowering/Checks.vuna:44"));
  ("Lowering_dChecks.v_flattenAppSpineGo", ("Vuna.Compiler.Lowering.Checks.flattenAppSpineGo", "Vuna/Compiler/Lowering/Checks.vuna:47"));
  ("Lowering_dChecks.v_flattenConApp", ("Vuna.Compiler.Lowering.Checks.flattenConApp", "Vuna/Compiler/Lowering/Checks.vuna:34"));
  ("Lowering_dChecks.v_isAxiomDef", ("Vuna.Compiler.Lowering.Checks.isAxiomDef", "Vuna/Compiler/Lowering/Checks.vuna:67"));
  ("Lowering_dChecks.v_isTypeLevelDef", ("Vuna.Compiler.Lowering.Checks.isTypeLevelDef", "Vuna/Compiler/Lowering/Checks.vuna:75"));
  ("Lowering_dChecks.v_noUseFlags", ("Vuna.Compiler.Lowering.Checks.noUseFlags", "Vuna/Compiler/Lowering/Checks.vuna:273"));
  ("Lowering_dChecks.v_orUseFlags", ("Vuna.Compiler.Lowering.Checks.orUseFlags", "Vuna/Compiler/Lowering/Checks.vuna:276"));
  ("Lowering_dChecks.v_partitionDefs", ("Vuna.Compiler.Lowering.Checks.partitionDefs", "Vuna/Compiler/Lowering/Checks.vuna:81"));
  ("Lowering_dChecks.v_partitionDefsGo", ("Vuna.Compiler.Lowering.Checks.partitionDefsGo", "Vuna/Compiler/Lowering/Checks.vuna:84"));
  ("Lowering_dChecks.v_runtimeNamesOf", ("Vuna.Compiler.Lowering.Checks.runtimeNamesOf", "Vuna/Compiler/Lowering/Checks.vuna:360"));
  ("Lowering_dChecks.v_showMetaHint", ("Vuna.Compiler.Lowering.Checks.showMetaHint", "Vuna/Compiler/Lowering/Checks.vuna:139"));
  ("Lowering_dChecks.v_termDepsAlts", ("Vuna.Compiler.Lowering.Checks.termDepsAlts", "Vuna/Compiler/Lowering/Checks.vuna:448"));
  ("Lowering_dChecks.v_termDepsAltsFuel", ("Vuna.Compiler.Lowering.Checks.termDepsAltsFuel", "Vuna/Compiler/Lowering/Checks.vuna:244"));
  ("Lowering_dChecks.v_termDepsArgs", ("Vuna.Compiler.Lowering.Checks.termDepsArgs", "Vuna/Compiler/Lowering/Checks.vuna:445"));
  ("Lowering_dChecks.v_termDepsArgsFuel", ("Vuna.Compiler.Lowering.Checks.termDepsArgsFuel", "Vuna/Compiler/Lowering/Checks.vuna:234"));
  ("Lowering_dChecks.v_termDepsInto", ("Vuna.Compiler.Lowering.Checks.termDepsInto", "Vuna/Compiler/Lowering/Checks.vuna:442"));
  ("Lowering_dChecks.v_termDepsIntoFuel", ("Vuna.Compiler.Lowering.Checks.termDepsIntoFuel", "Vuna/Compiler/Lowering/Checks.vuna:205"));
  ("Lowering_dChecks.v_termUseAltsFuel", ("Vuna.Compiler.Lowering.Checks.termUseAltsFuel", "Vuna/Compiler/Lowering/Checks.vuna:346"));
  ("Lowering_dChecks.v_termUseArgsFuel", ("Vuna.Compiler.Lowering.Checks.termUseArgsFuel", "Vuna/Compiler/Lowering/Checks.vuna:332"));
  ("Lowering_dChecks.v_termUseFuel", ("Vuna.Compiler.Lowering.Checks.termUseFuel", "Vuna/Compiler/Lowering/Checks.vuna:307"));
  ("Lowering_dChecks.v_termUseInto", ("Vuna.Compiler.Lowering.Checks.termUseInto", "Vuna/Compiler/Lowering/Checks.vuna:289"));
  ("Lowering_dChecks.v_useBudgetFor", ("Vuna.Compiler.Lowering.Checks.useBudgetFor", "Vuna/Compiler/Lowering/Checks.vuna:294"));
  ("Lowering_dChecks.v_withFlags", ("Vuna.Compiler.Lowering.Checks.withFlags", "Vuna/Compiler/Lowering/Checks.vuna:304"));
  ("Lowering_dEntry.v_actionResultTyIn", ("Vuna.Compiler.Lowering.Entry.actionResultTyIn", "Vuna/Compiler/Lowering/Entry.vuna:25"));
  ("Lowering_dEntry.v_collectBuiltinRowTags", ("Vuna.Compiler.Lowering.Entry.collectBuiltinRowTags", "Vuna/Compiler/Lowering/Entry.vuna:37"));
  ("Lowering_dEntry.v_filterMapErrorRunHost", ("Vuna.Compiler.Lowering.Entry.filterMapErrorRunHost", "Vuna/Compiler/Lowering/Entry.vuna:119"));
  ("Lowering_dEntry.v_filterMapRunHost", ("Vuna.Compiler.Lowering.Entry.filterMapRunHost", "Vuna/Compiler/Lowering/Entry.vuna:110"));
  ("Lowering_dEntry.v_lowerEntryOf", ("Vuna.Compiler.Lowering.Entry.lowerEntryOf", "Vuna/Compiler/Lowering/Entry.vuna:91"));
  ("Lowering_dEntry.v_mainRowTags", ("Vuna.Compiler.Lowering.Entry.mainRowTags", "Vuna/Compiler/Lowering/Entry.vuna:53"));
  ("Lowering_dEntry.v_mainShowForNameIr", ("Vuna.Compiler.Lowering.Entry.mainShowForNameIr", "Vuna/Compiler/Lowering/Entry.vuna:72"));
  ("Lowering_dEntry.v_mainShowIr", ("Vuna.Compiler.Lowering.Entry.mainShowIr", "Vuna/Compiler/Lowering/Entry.vuna:63"));
  ("Lowering_dEntry.v_mainShowRtIr", ("Vuna.Compiler.Lowering.Entry.mainShowRtIr", "Vuna/Compiler/Lowering/Entry.vuna:78"));
  ("Lowering_dEntry.v_tagOf", ("Vuna.Compiler.Lowering.Entry.tagOf", "Vuna/Compiler/Lowering/Entry.vuna:47"));
  ("Lowering_dEntry.v_unwrapNamedTerm", ("Vuna.Compiler.Lowering.Entry.unwrapNamedTerm", "Vuna/Compiler/Lowering/Entry.vuna:33"));
  ("Lowering_dEnv.v_anyDefFlag", ("Vuna.Compiler.Lowering.Env.anyDefFlag", "Vuna/Compiler/Lowering/Env.vuna:395"));
  ("Lowering_dEnv.v_collectFamilyArgs", ("Vuna.Compiler.Lowering.Env.collectFamilyArgs", "Vuna/Compiler/Lowering/Env.vuna:262"));
  ("Lowering_dEnv.v_collectFamilyArgsFuel", ("Vuna.Compiler.Lowering.Env.collectFamilyArgsFuel", "Vuna/Compiler/Lowering/Env.vuna:266"));
  ("Lowering_dEnv.v_collectUsedLevels", ("Vuna.Compiler.Lowering.Env.collectUsedLevels", "Vuna/Compiler/Lowering/Env.vuna:233"));
  ("Lowering_dEnv.v_collectUsedLevelsFuel", ("Vuna.Compiler.Lowering.Env.collectUsedLevelsFuel", "Vuna/Compiler/Lowering/Env.vuna:236"));
  ("Lowering_dEnv.v_collectUsedSpineFuel", ("Vuna.Compiler.Lowering.Env.collectUsedSpineFuel", "Vuna/Compiler/Lowering/Env.vuna:252"));
  ("Lowering_dEnv.v_ctorOpaqueFlagsOf", ("Vuna.Compiler.Lowering.Env.ctorOpaqueFlagsOf", "Vuna/Compiler/Lowering/Env.vuna:158"));
  ("Lowering_dEnv.v_ctorOpaqueGo", ("Vuna.Compiler.Lowering.Env.ctorOpaqueGo", "Vuna/Compiler/Lowering/Env.vuna:161"));
  ("Lowering_dEnv.v_ctorOpaqueTableOf", ("Vuna.Compiler.Lowering.Env.ctorOpaqueTableOf", "Vuna/Compiler/Lowering/Env.vuna:437"));
  ("Lowering_dEnv.v_ctorTableOf", ("Vuna.Compiler.Lowering.Env.ctorTableOf", "Vuna/Compiler/Lowering/Env.vuna:431"));
  ("Lowering_dEnv.v_ctorUsedLevels", ("Vuna.Compiler.Lowering.Env.ctorUsedLevels", "Vuna/Compiler/Lowering/Env.vuna:278"));
  ("Lowering_dEnv.v_dataUsedLevels", ("Vuna.Compiler.Lowering.Env.dataUsedLevels", "Vuna/Compiler/Lowering/Env.vuna:305"));
  ("Lowering_dEnv.v_defFactsOf", ("Vuna.Compiler.Lowering.Env.defFactsOf", "Vuna/Compiler/Lowering/Env.vuna:477"));
  ("Lowering_dEnv.v_defFactsTblOf", ("Vuna.Compiler.Lowering.Env.defFactsTblOf", "Vuna/Compiler/Lowering/Env.vuna:467"));
  ("Lowering_dEnv.v_defTblOf", ("Vuna.Compiler.Lowering.Env.defTblOf", "Vuna/Compiler/Lowering/Env.vuna:497"));
  ("Lowering_dEnv.v_factsDepsOf", ("Vuna.Compiler.Lowering.Env.factsDepsOf", "Vuna/Compiler/Lowering/Env.vuna:365"));
  ("Lowering_dEnv.v_factsOf", ("Vuna.Compiler.Lowering.Env.factsOf", "Vuna/Compiler/Lowering/Env.vuna:369"));
  ("Lowering_dEnv.v_findFamilyCtor", ("Vuna.Compiler.Lowering.Env.findFamilyCtor", "Vuna/Compiler/Lowering/Env.vuna:418"));
  ("Lowering_dEnv.v_findListFamilyData", ("Vuna.Compiler.Lowering.Env.findListFamilyData", "Vuna/Compiler/Lowering/Env.vuna:426"));
  ("Lowering_dEnv.v_floatRenderRefName", ("Vuna.Compiler.Lowering.Env.floatRenderRefName", "Vuna/Compiler/Lowering/Env.vuna:361"));
  ("Lowering_dEnv.v_hasDataNamed", ("Vuna.Compiler.Lowering.Env.hasDataNamed", "Vuna/Compiler/Lowering/Env.vuna:506"));
  ("Lowering_dEnv.v_hasRecordRepr", ("Vuna.Compiler.Lowering.Env.hasRecordRepr", "Vuna/Compiler/Lowering/Env.vuna:143"));
  ("Lowering_dEnv.v_intrinsicUseFlagsTbl", ("Vuna.Compiler.Lowering.Env.intrinsicUseFlagsTbl", "Vuna/Compiler/Lowering/Env.vuna:484"));
  ("Lowering_dEnv.v_isRecordData", ("Vuna.Compiler.Lowering.Env.isRecordData", "Vuna/Compiler/Lowering/Env.vuna:114"));
  ("Lowering_dEnv.v_isTypeHeadOpaqueDatas", ("Vuna.Compiler.Lowering.Env.isTypeHeadOpaqueDatas", "Vuna/Compiler/Lowering/Env.vuna:93"));
  ("Lowering_dEnv.v_levelListEq", ("Vuna.Compiler.Lowering.Env.levelListEq", "Vuna/Compiler/Lowering/Env.vuna:314"));
  ("Lowering_dEnv.v_levelSlotGoIn", ("Vuna.Compiler.Lowering.Env.levelSlotGoIn", "Vuna/Compiler/Lowering/Env.vuna:214"));
  ("Lowering_dEnv.v_levelSlotIn", ("Vuna.Compiler.Lowering.Env.levelSlotIn", "Vuna/Compiler/Lowering/Env.vuna:211"));
  ("Lowering_dEnv.v_listFamOf", ("Vuna.Compiler.Lowering.Env.listFamOf", "Vuna/Compiler/Lowering/Env.vuna:406"));
  ("Lowering_dEnv.v_listLength", ("Vuna.Compiler.Lowering.Env.listLength", "Vuna/Compiler/Lowering/Env.vuna:75"));
  ("Lowering_dEnv.v_locRowPair", ("Vuna.Compiler.Lowering.Env.locRowPair", "Vuna/Compiler/Lowering/Env.vuna:183"));
  ("Lowering_dEnv.v_lookupFacts", ("Vuna.Compiler.Lowering.Env.lookupFacts", "Vuna/Compiler/Lowering/Env.vuna:400"));
  ("Lowering_dEnv.v_lookupTyParamsIn", ("Vuna.Compiler.Lowering.Env.lookupTyParamsIn", "Vuna/Compiler/Lowering/Env.vuna:227"));
  ("Lowering_dEnv.v_lookupUsedIn", ("Vuna.Compiler.Lowering.Env.lookupUsedIn", "Vuna/Compiler/Lowering/Env.vuna:222"));
  ("Lowering_dEnv.v_lowerSharedOf", ("Vuna.Compiler.Lowering.Env.lowerSharedOf", "Vuna/Compiler/Lowering/Env.vuna:375"));
  ("Lowering_dEnv.v_lwEnvShared", ("Vuna.Compiler.Lowering.Env.lwEnvShared", "Vuna/Compiler/Lowering/Env.vuna:65"));
  ("Lowering_dEnv.v_lwEnvWithUnit", ("Vuna.Compiler.Lowering.Env.lwEnvWithUnit", "Vuna/Compiler/Lowering/Env.vuna:69"));
  ("Lowering_dEnv.v_mapSome", ("Vuna.Compiler.Lowering.Env.mapSome", "Vuna/Compiler/Lowering/Env.vuna:84"));
  ("Lowering_dEnv.v_memIntIn", ("Vuna.Compiler.Lowering.Env.memIntIn", "Vuna/Compiler/Lowering/Env.vuna:207"));
  ("Lowering_dEnv.v_memOpaqueLevel", ("Vuna.Compiler.Lowering.Env.memOpaqueLevel", "Vuna/Compiler/Lowering/Env.vuna:102"));
  ("Lowering_dEnv.v_mkLwEnv", ("Vuna.Compiler.Lowering.Env.mkLwEnv", "Vuna/Compiler/Lowering/Env.vuna:444"));
  ("Lowering_dEnv.v_nameSetOf", ("Vuna.Compiler.Lowering.Env.nameSetOf", "Vuna/Compiler/Lowering/Env.vuna:510"));
  ("Lowering_dEnv.v_nthValueIn", ("Vuna.Compiler.Lowering.Env.nthValueIn", "Vuna/Compiler/Lowering/Env.vuna:218"));
  ("Lowering_dEnv.v_pushDep", ("Vuna.Compiler.Lowering.Env.pushDep", "Vuna/Compiler/Lowering/Env.vuna:80"));
  ("Lowering_dEnv.v_recordFieldsOf", ("Vuna.Compiler.Lowering.Env.recordFieldsOf", "Vuna/Compiler/Lowering/Env.vuna:353"));
  ("Lowering_dEnv.v_recordRtFields", ("Vuna.Compiler.Lowering.Env.recordRtFields", "Vuna/Compiler/Lowering/Env.vuna:124"));
  ("Lowering_dEnv.v_recordRtFieldsGo", ("Vuna.Compiler.Lowering.Env.recordRtFieldsGo", "Vuna/Compiler/Lowering/Env.vuna:133"));
  ("Lowering_dEnv.v_rtDatasOf", ("Vuna.Compiler.Lowering.Env.rtDatasOf", "Vuna/Compiler/Lowering/Env.vuna:153"));
  ("Lowering_dEnv.v_sameLevelTable", ("Vuna.Compiler.Lowering.Env.sameLevelTable", "Vuna/Compiler/Lowering/Env.vuna:319"));
  ("Lowering_dEnv.v_strTblOf", ("Vuna.Compiler.Lowering.Env.strTblOf", "Vuna/Compiler/Lowering/Env.vuna:502"));
  ("Lowering_dEnv.v_tyParamsOf", ("Vuna.Compiler.Lowering.Env.tyParamsOf", "Vuna/Compiler/Lowering/Env.vuna:350"));
  ("Lowering_dEnv.v_typeParamLevels", ("Vuna.Compiler.Lowering.Env.typeParamLevels", "Vuna/Compiler/Lowering/Env.vuna:196"));
  ("Lowering_dEnv.v_typeParamLevelsGo", ("Vuna.Compiler.Lowering.Env.typeParamLevelsGo", "Vuna/Compiler/Lowering/Env.vuna:199"));
  ("Lowering_dEnv.v_unboxedRowOf", ("Vuna.Compiler.Lowering.Env.unboxedRowOf", "Vuna/Compiler/Lowering/Env.vuna:391"));
  ("Lowering_dEnv.v_useFlagsOfName", ("Vuna.Compiler.Lowering.Env.useFlagsOfName", "Vuna/Compiler/Lowering/Env.vuna:490"));
  ("Lowering_dEnv.v_usedFixRounds", ("Vuna.Compiler.Lowering.Env.usedFixRounds", "Vuna/Compiler/Lowering/Env.vuna:330"));
  ("Lowering_dEnv.v_usedSlotCount", ("Vuna.Compiler.Lowering.Env.usedSlotCount", "Vuna/Compiler/Lowering/Env.vuna:333"));
  ("Lowering_dEnv.v_usedTableFix", ("Vuna.Compiler.Lowering.Env.usedTableFix", "Vuna/Compiler/Lowering/Env.vuna:337"));
  ("Lowering_dEnv.v_usedTableFixFuel", ("Vuna.Compiler.Lowering.Env.usedTableFixFuel", "Vuna/Compiler/Lowering/Env.vuna:340"));
  ("Lowering_dProgram.v_adjOfDef", ("Vuna.Compiler.Lowering.Program.adjOfDef", "Vuna/Compiler/Lowering/Program.vuna:1443"));
  ("Lowering_dProgram.v_aeEnvOf", ("Vuna.Compiler.Lowering.Program.aeEnvOf", "Vuna/Compiler/Lowering/Program.vuna:668"));
  ("Lowering_dProgram.v_aePatsOf", ("Vuna.Compiler.Lowering.Program.aePatsOf", "Vuna/Compiler/Lowering/Program.vuna:671"));
  ("Lowering_dProgram.v_aeStOf", ("Vuna.Compiler.Lowering.Program.aeStOf", "Vuna/Compiler/Lowering/Program.vuna:674"));
  ("Lowering_dProgram.v_alignCtorArgs", ("Vuna.Compiler.Lowering.Program.alignCtorArgs", "Vuna/Compiler/Lowering/Program.vuna:524"));
  ("Lowering_dProgram.v_allCatchAll", ("Vuna.Compiler.Lowering.Program.allCatchAll", "Vuna/Compiler/Lowering/Program.vuna:792"));
  ("Lowering_dProgram.v_allRuntimeArgs", ("Vuna.Compiler.Lowering.Program.allRuntimeArgs", "Vuna/Compiler/Lowering/Program.vuna:511"));
  ("Lowering_dProgram.v_altEnvCheckedIn", ("Vuna.Compiler.Lowering.Program.altEnvCheckedIn", "Vuna/Compiler/Lowering/Program.vuna:697"));
  ("Lowering_dProgram.v_altEnvFullIn", ("Vuna.Compiler.Lowering.Program.altEnvFullIn", "Vuna/Compiler/Lowering/Program.vuna:707"));
  ("Lowering_dProgram.v_altEnvGo", ("Vuna.Compiler.Lowering.Program.altEnvGo", "Vuna/Compiler/Lowering/Program.vuna:681"));
  ("Lowering_dProgram.v_altEnvIn", ("Vuna.Compiler.Lowering.Program.altEnvIn", "Vuna/Compiler/Lowering/Program.vuna:692"));
  ("Lowering_dProgram.v_altEnvKeptIn", ("Vuna.Compiler.Lowering.Program.altEnvKeptIn", "Vuna/Compiler/Lowering/Program.vuna:727"));
  ("Lowering_dProgram.v_appTyFrom", ("Vuna.Compiler.Lowering.Program.appTyFrom", "Vuna/Compiler/Lowering/Program.vuna:413"));
  ("Lowering_dProgram.v_appTyOf", ("Vuna.Compiler.Lowering.Program.appTyOf", "Vuna/Compiler/Lowering/Program.vuna:400"));
  ("Lowering_dProgram.v_appTyOfIr", ("Vuna.Compiler.Lowering.Program.appTyOfIr", "Vuna/Compiler/Lowering/Program.vuna:407"));
  ("Lowering_dProgram.v_appendGroups", ("Vuna.Compiler.Lowering.Program.appendGroups", "Vuna/Compiler/Lowering/Program.vuna:1331"));
  ("Lowering_dProgram.v_armResultTyOf", ("Vuna.Compiler.Lowering.Program.armResultTyOf", "Vuna/Compiler/Lowering/Program.vuna:845"));
  ("Lowering_dProgram.v_armTyTblOf", ("Vuna.Compiler.Lowering.Program.armTyTblOf", "Vuna/Compiler/Lowering/Program.vuna:752"));
  ("Lowering_dProgram.v_binderAtIn", ("Vuna.Compiler.Lowering.Program.binderAtIn", "Vuna/Compiler/Lowering/Program.vuna:147"));
  ("Lowering_dProgram.v_binderErasedOf", ("Vuna.Compiler.Lowering.Program.binderErasedOf", "Vuna/Compiler/Lowering/Program.vuna:55"));
  ("Lowering_dProgram.v_binderOfParam", ("Vuna.Compiler.Lowering.Program.binderOfParam", "Vuna/Compiler/Lowering/Program.vuna:320"));
  ("Lowering_dProgram.v_binderWithTy", ("Vuna.Compiler.Lowering.Program.binderWithTy", "Vuna/Compiler/Lowering/Program.vuna:739"));
  ("Lowering_dProgram.v_bindersOfParams", ("Vuna.Compiler.Lowering.Program.bindersOfParams", "Vuna/Compiler/Lowering/Program.vuna:313"));
  ("Lowering_dProgram.v_bindersOfParamsHint", ("Vuna.Compiler.Lowering.Program.bindersOfParamsHint", "Vuna/Compiler/Lowering/Program.vuna:332"));
  ("Lowering_dProgram.v_checkNoDupOcamlNames", ("Vuna.Compiler.Lowering.Program.checkNoDupOcamlNames", "Vuna/Compiler/Lowering/Program.vuna:1241"));
  ("Lowering_dProgram.v_checkNoDupOcamlNamesGo", ("Vuna.Compiler.Lowering.Program.checkNoDupOcamlNamesGo", "Vuna/Compiler/Lowering/Program.vuna:1244"));
  ("Lowering_dProgram.v_checkProgramOf", ("Vuna.Compiler.Lowering.Program.checkProgramOf", "Vuna/Compiler/Lowering/Program.vuna:1365"));
  ("Lowering_dProgram.v_checkRuntimeContract", ("Vuna.Compiler.Lowering.Program.checkRuntimeContract", "Vuna/Compiler/Lowering/Program.vuna:1374"));
  ("Lowering_dProgram.v_collectLamChainIn", ("Vuna.Compiler.Lowering.Program.collectLamChainIn", "Vuna/Compiler/Lowering/Program.vuna:206"));
  ("Lowering_dProgram.v_concatLeavesGo", ("Vuna.Compiler.Lowering.Program.concatLeavesGo", "Vuna/Compiler/Lowering/Program.vuna:486"));
  ("Lowering_dProgram.v_concatLeavesIn", ("Vuna.Compiler.Lowering.Program.concatLeavesIn", "Vuna/Compiler/Lowering/Program.vuna:483"));
  ("Lowering_dProgram.v_countKept", ("Vuna.Compiler.Lowering.Program.countKept", "Vuna/Compiler/Lowering/Program.vuna:677"));
  ("Lowering_dProgram.v_countRuntimeParams", ("Vuna.Compiler.Lowering.Program.countRuntimeParams", "Vuna/Compiler/Lowering/Program.vuna:282"));
  ("Lowering_dProgram.v_ctorArgIr", ("Vuna.Compiler.Lowering.Program.ctorArgIr", "Vuna/Compiler/Lowering/Program.vuna:567"));
  ("Lowering_dProgram.v_ctorOpaqueKeptFlags", ("Vuna.Compiler.Lowering.Program.ctorOpaqueKeptFlags", "Vuna/Compiler/Lowering/Program.vuna:572"));
  ("Lowering_dProgram.v_effResultTyOf", ("Vuna.Compiler.Lowering.Program.effResultTyOf", "Vuna/Compiler/Lowering/Program.vuna:300"));
  ("Lowering_dProgram.v_effUnitTyIn", ("Vuna.Compiler.Lowering.Program.effUnitTyIn", "Vuna/Compiler/Lowering/Program.vuna:190"));
  ("Lowering_dProgram.v_ensureUniqueOcamlNamesIn", ("Vuna.Compiler.Lowering.Program.ensureUniqueOcamlNamesIn", "Vuna/Compiler/Lowering/Program.vuna:1254"));
  ("Lowering_dProgram.v_eraseTele", ("Vuna.Compiler.Lowering.Program.eraseTele", "Vuna/Compiler/Lowering/Program.vuna:1072"));
  ("Lowering_dProgram.v_externBasicIr", ("Vuna.Compiler.Lowering.Program.externBasicIr", "Vuna/Compiler/Lowering/Program.vuna:1208"));
  ("Lowering_dProgram.v_externDomIr", ("Vuna.Compiler.Lowering.Program.externDomIr", "Vuna/Compiler/Lowering/Program.vuna:1202"));
  ("Lowering_dProgram.v_externTyIr", ("Vuna.Compiler.Lowering.Program.externTyIr", "Vuna/Compiler/Lowering/Program.vuna:1190"));
  ("Lowering_dProgram.v_findAltBy", ("Vuna.Compiler.Lowering.Program.findAltBy", "Vuna/Compiler/Lowering/Program.vuna:940"));
  ("Lowering_dProgram.v_findCatchAllAlt", ("Vuna.Compiler.Lowering.Program.findCatchAllAlt", "Vuna/Compiler/Lowering/Program.vuna:944"));
  ("Lowering_dProgram.v_firstOfList", ("Vuna.Compiler.Lowering.Program.firstOfList", "Vuna/Compiler/Lowering/Program.vuna:1398"));
  ("Lowering_dProgram.v_flattenConcatChainIn", ("Vuna.Compiler.Lowering.Program.flattenConcatChainIn", "Vuna/Compiler/Lowering/Program.vuna:473"));
  ("Lowering_dProgram.v_flattenIntrinsicAppIn", ("Vuna.Compiler.Lowering.Program.flattenIntrinsicAppIn", "Vuna/Compiler/Lowering/Program.vuna:500"));
  ("Lowering_dProgram.v_groupDefs", ("Vuna.Compiler.Lowering.Program.groupDefs", "Vuna/Compiler/Lowering/Program.vuna:1294"));
  ("Lowering_dProgram.v_groupOfPair", ("Vuna.Compiler.Lowering.Program.groupOfPair", "Vuna/Compiler/Lowering/Program.vuna:1446"));
  ("Lowering_dProgram.v_hasFallbackAlt", ("Vuna.Compiler.Lowering.Program.hasFallbackAlt", "Vuna/Compiler/Lowering/Program.vuna:788"));
  ("Lowering_dProgram.v_headGlobalOf", ("Vuna.Compiler.Lowering.Program.headGlobalOf", "Vuna/Compiler/Lowering/Program.vuna:306"));
  ("Lowering_dProgram.v_initGuardOf", ("Vuna.Compiler.Lowering.Program.initGuardOf", "Vuna/Compiler/Lowering/Program.vuna:1155"));
  ("Lowering_dProgram.v_inlineArityMatchesIn", ("Vuna.Compiler.Lowering.Program.inlineArityMatchesIn", "Vuna/Compiler/Lowering/Program.vuna:515"));
  ("Lowering_dProgram.v_isNatCtorName", ("Vuna.Compiler.Lowering.Program.isNatCtorName", "Vuna/Compiler/Lowering/Program.vuna:919"));
  ("Lowering_dProgram.v_lookupArmTy", ("Vuna.Compiler.Lowering.Program.lookupArmTy", "Vuna/Compiler/Lowering/Program.vuna:773"));
  ("Lowering_dProgram.v_lookupRtLabelIn", ("Vuna.Compiler.Lowering.Program.lookupRtLabelIn", "Vuna/Compiler/Lowering/Program.vuna:1040"));
  ("Lowering_dProgram.v_lookupRtPosIn", ("Vuna.Compiler.Lowering.Program.lookupRtPosIn", "Vuna/Compiler/Lowering/Program.vuna:1045"));
  ("Lowering_dProgram.v_lookupRtPositionsIn", ("Vuna.Compiler.Lowering.Program.lookupRtPositionsIn", "Vuna/Compiler/Lowering/Program.vuna:1050"));
  ("Lowering_dProgram.v_lowerAppFallbackFuel", ("Vuna.Compiler.Lowering.Program.lowerAppFallbackFuel", "Vuna/Compiler/Lowering/Program.vuna:419"));
  ("Lowering_dProgram.v_lowerAppFuel", ("Vuna.Compiler.Lowering.Program.lowerAppFuel", "Vuna/Compiler/Lowering/Program.vuna:358"));
  ("Lowering_dProgram.v_lowerArmBodyFuel", ("Vuna.Compiler.Lowering.Program.lowerArmBodyFuel", "Vuna/Compiler/Lowering/Program.vuna:785"));
  ("Lowering_dProgram.v_lowerArmFuel", ("Vuna.Compiler.Lowering.Program.lowerArmFuel", "Vuna/Compiler/Lowering/Program.vuna:858"));
  ("Lowering_dProgram.v_lowerArmsFuel", ("Vuna.Compiler.Lowering.Program.lowerArmsFuel", "Vuna/Compiler/Lowering/Program.vuna:892"));
  ("Lowering_dProgram.v_lowerBridgeGuard", ("Vuna.Compiler.Lowering.Program.lowerBridgeGuard", "Vuna/Compiler/Lowering/Program.vuna:183"));
  ("Lowering_dProgram.v_lowerBudgetFor", ("Vuna.Compiler.Lowering.Program.lowerBudgetFor", "Vuna/Compiler/Lowering/Program.vuna:72"));
  ("Lowering_dProgram.v_lowerCaseFuel", ("Vuna.Compiler.Lowering.Program.lowerCaseFuel", "Vuna/Compiler/Lowering/Program.vuna:1000"));
  ("Lowering_dProgram.v_lowerConAppFinish", ("Vuna.Compiler.Lowering.Program.lowerConAppFinish", "Vuna/Compiler/Lowering/Program.vuna:631"));
  ("Lowering_dProgram.v_lowerConAppFuel", ("Vuna.Compiler.Lowering.Program.lowerConAppFuel", "Vuna/Compiler/Lowering/Program.vuna:578"));
  ("Lowering_dProgram.v_lowerConAppNonChainFuel", ("Vuna.Compiler.Lowering.Program.lowerConAppNonChainFuel", "Vuna/Compiler/Lowering/Program.vuna:587"));
  ("Lowering_dProgram.v_lowerConArgsFuel", ("Vuna.Compiler.Lowering.Program.lowerConArgsFuel", "Vuna/Compiler/Lowering/Program.vuna:546"));
  ("Lowering_dProgram.v_lowerDef", ("Vuna.Compiler.Lowering.Program.lowerDef", "Vuna/Compiler/Lowering/Program.vuna:1164"));
  ("Lowering_dProgram.v_lowerDefBodyTerm", ("Vuna.Compiler.Lowering.Program.lowerDefBodyTerm", "Vuna/Compiler/Lowering/Program.vuna:258"));
  ("Lowering_dProgram.v_lowerDefs", ("Vuna.Compiler.Lowering.Program.lowerDefs", "Vuna/Compiler/Lowering/Program.vuna:1219"));
  ("Lowering_dProgram.v_lowerExternTy", ("Vuna.Compiler.Lowering.Program.lowerExternTy", "Vuna/Compiler/Lowering/Program.vuna:1187"));
  ("Lowering_dProgram.v_lowerGlobalRef", ("Vuna.Compiler.Lowering.Program.lowerGlobalRef", "Vuna/Compiler/Lowering/Program.vuna:164"));
  ("Lowering_dProgram.v_lowerInlineArgsFuel", ("Vuna.Compiler.Lowering.Program.lowerInlineArgsFuel", "Vuna/Compiler/Lowering/Program.vuna:435"));
  ("Lowering_dProgram.v_lowerLamChainFuel", ("Vuna.Compiler.Lowering.Program.lowerLamChainFuel", "Vuna/Compiler/Lowering/Program.vuna:227"));
  ("Lowering_dProgram.v_lowerLamFuel", ("Vuna.Compiler.Lowering.Program.lowerLamFuel", "Vuna/Compiler/Lowering/Program.vuna:217"));
  ("Lowering_dProgram.v_lowerNatAltFuel", ("Vuna.Compiler.Lowering.Program.lowerNatAltFuel", "Vuna/Compiler/Lowering/Program.vuna:949"));
  ("Lowering_dProgram.v_lowerNatCaseFuel", ("Vuna.Compiler.Lowering.Program.lowerNatCaseFuel", "Vuna/Compiler/Lowering/Program.vuna:965"));
  ("Lowering_dProgram.v_lowerPlainAppFuel", ("Vuna.Compiler.Lowering.Program.lowerPlainAppFuel", "Vuna/Compiler/Lowering/Program.vuna:380"));
  ("Lowering_dProgram.v_lowerProgramOf", ("Vuna.Compiler.Lowering.Program.lowerProgramOf", "Vuna/Compiler/Lowering/Program.vuna:1450"));
  ("Lowering_dProgram.v_lowerProjAsCaseFuel", ("Vuna.Compiler.Lowering.Program.lowerProjAsCaseFuel", "Vuna/Compiler/Lowering/Program.vuna:1021"));
  ("Lowering_dProgram.v_lowerRecordUpdateArgsFuel", ("Vuna.Compiler.Lowering.Program.lowerRecordUpdateArgsFuel", "Vuna/Compiler/Lowering/Program.vuna:1092"));
  ("Lowering_dProgram.v_lowerRecordUpdateFuel", ("Vuna.Compiler.Lowering.Program.lowerRecordUpdateFuel", "Vuna/Compiler/Lowering/Program.vuna:1075"));
  ("Lowering_dProgram.v_lowerTerm", ("Vuna.Compiler.Lowering.Program.lowerTerm", "Vuna/Compiler/Lowering/Program.vuna:75"));
  ("Lowering_dProgram.v_lowerTermFuel", ("Vuna.Compiler.Lowering.Program.lowerTermFuel", "Vuna/Compiler/Lowering/Program.vuna:78"));
  ("Lowering_dProgram.v_lowerTermsFuel", ("Vuna.Compiler.Lowering.Program.lowerTermsFuel", "Vuna/Compiler/Lowering/Program.vuna:455"));
  ("Lowering_dProgram.v_lowerUnboxedCaseAlt", ("Vuna.Compiler.Lowering.Program.lowerUnboxedCaseAlt", "Vuna/Compiler/Lowering/Program.vuna:797"));
  ("Lowering_dProgram.v_lowerUnboxedCaseFuel", ("Vuna.Compiler.Lowering.Program.lowerUnboxedCaseFuel", "Vuna/Compiler/Lowering/Program.vuna:811"));
  ("Lowering_dProgram.v_lowerUnitAfterChecks", ("Vuna.Compiler.Lowering.Program.lowerUnitAfterChecks", "Vuna/Compiler/Lowering/Program.vuna:1421"));
  ("Lowering_dProgram.v_lowerUnitChecked", ("Vuna.Compiler.Lowering.Program.lowerUnitChecked", "Vuna/Compiler/Lowering/Program.vuna:1412"));
  ("Lowering_dProgram.v_lowerUnitOf", ("Vuna.Compiler.Lowering.Program.lowerUnitOf", "Vuna/Compiler/Lowering/Program.vuna:1405"));
  ("Lowering_dProgram.v_lowerUpdFieldsFuel", ("Vuna.Compiler.Lowering.Program.lowerUpdFieldsFuel", "Vuna/Compiler/Lowering/Program.vuna:1115"));
  ("Lowering_dProgram.v_mapMaybeDef", ("Vuna.Compiler.Lowering.Program.mapMaybeDef", "Vuna/Compiler/Lowering/Program.vuna:1354"));
  ("Lowering_dProgram.v_nameKey", ("Vuna.Compiler.Lowering.Program.nameKey", "Vuna/Compiler/Lowering/Program.vuna:1238"));
  ("Lowering_dProgram.v_natCaseAllCtors", ("Vuna.Compiler.Lowering.Program.natCaseAllCtors", "Vuna/Compiler/Lowering/Program.vuna:926"));
  ("Lowering_dProgram.v_natCaseApplies", ("Vuna.Compiler.Lowering.Program.natCaseApplies", "Vuna/Compiler/Lowering/Program.vuna:922"));
  ("Lowering_dProgram.v_natCaseHasCtor", ("Vuna.Compiler.Lowering.Program.natCaseHasCtor", "Vuna/Compiler/Lowering/Program.vuna:933"));
  ("Lowering_dProgram.v_nthOpqArgIn", ("Vuna.Compiler.Lowering.Program.nthOpqArgIn", "Vuna/Compiler/Lowering/Program.vuna:1061"));
  ("Lowering_dProgram.v_partitionRuntimeDefs", ("Vuna.Compiler.Lowering.Program.partitionRuntimeDefs", "Vuna/Compiler/Lowering/Program.vuna:1472"));
  ("Lowering_dProgram.v_prepareProgram", ("Vuna.Compiler.Lowering.Program.prepareProgram", "Vuna/Compiler/Lowering/Program.vuna:1271"));
  ("Lowering_dProgram.v_projBindersIn", ("Vuna.Compiler.Lowering.Program.projBindersIn", "Vuna/Compiler/Lowering/Program.vuna:1033"));
  ("Lowering_dProgram.v_recOkOfTbl", ("Vuna.Compiler.Lowering.Program.recOkOfTbl", "Vuna/Compiler/Lowering/Program.vuna:1316"));
  ("Lowering_dProgram.v_recordAltBindersIn", ("Vuna.Compiler.Lowering.Program.recordAltBindersIn", "Vuna/Compiler/Lowering/Program.vuna:1069"));
  ("Lowering_dProgram.v_recordFieldNameAt", ("Vuna.Compiler.Lowering.Program.recordFieldNameAt", "Vuna/Compiler/Lowering/Program.vuna:151"));
  ("Lowering_dProgram.v_recordProjVarIn", ("Vuna.Compiler.Lowering.Program.recordProjVarIn", "Vuna/Compiler/Lowering/Program.vuna:1030"));
  ("Lowering_dProgram.v_recordTermAsAppIn", ("Vuna.Compiler.Lowering.Program.recordTermAsAppIn", "Vuna/Compiler/Lowering/Program.vuna:157"));
  ("Lowering_dProgram.v_recursiveValueAllowedIn", ("Vuna.Compiler.Lowering.Program.recursiveValueAllowedIn", "Vuna/Compiler/Lowering/Program.vuna:1148"));
  ("Lowering_dProgram.v_retagAltEnv", ("Vuna.Compiler.Lowering.Program.retagAltEnv", "Vuna/Compiler/Lowering/Program.vuna:781"));
  ("Lowering_dProgram.v_retagArmBinder", ("Vuna.Compiler.Lowering.Program.retagArmBinder", "Vuna/Compiler/Lowering/Program.vuna:764"));
  ("Lowering_dProgram.v_retagArmEnv", ("Vuna.Compiler.Lowering.Program.retagArmEnv", "Vuna/Compiler/Lowering/Program.vuna:777"));
  ("Lowering_dProgram.v_runtimeArityIn", ("Vuna.Compiler.Lowering.Program.runtimeArityIn", "Vuna/Compiler/Lowering/Program.vuna:1143"));
  ("Lowering_dProgram.v_sigArrowTys", ("Vuna.Compiler.Lowering.Program.sigArrowTys", "Vuna/Compiler/Lowering/Program.vuna:287"));
  ("Lowering_dProgram.v_spanOfTbl", ("Vuna.Compiler.Lowering.Program.spanOfTbl", "Vuna/Compiler/Lowering/Program.vuna:1325"));
  ("Lowering_dProgram.v_tblLookup", ("Vuna.Compiler.Lowering.Program.tblLookup", "Vuna/Compiler/Lowering/Program.vuna:1313"));
  ("Lowering_dProgram.v_typedPats", ("Vuna.Compiler.Lowering.Program.typedPats", "Vuna/Compiler/Lowering/Program.vuna:742"));
  ("Lowering_dProgram.v_typedPatsAll", ("Vuna.Compiler.Lowering.Program.typedPatsAll", "Vuna/Compiler/Lowering/Program.vuna:747"));
  ("Lowering_dProgram.v_zipFieldNames", ("Vuna.Compiler.Lowering.Program.zipFieldNames", "Vuna/Compiler/Lowering/Program.vuna:647"));
  ("Lowering_dTy.v_annotCalleeTy", ("Vuna.Compiler.Lowering.Ty.annotCalleeTy", "Vuna/Compiler/Lowering/Ty.vuna:335"));
  ("Lowering_dTy.v_annotConTy", ("Vuna.Compiler.Lowering.Ty.annotConTy", "Vuna/Compiler/Lowering/Ty.vuna:266"));
  ("Lowering_dTy.v_annotFamilyArgs", ("Vuna.Compiler.Lowering.Ty.annotFamilyArgs", "Vuna/Compiler/Lowering/Ty.vuna:415"));
  ("Lowering_dTy.v_annotGlobalTy", ("Vuna.Compiler.Lowering.Ty.annotGlobalTy", "Vuna/Compiler/Lowering/Ty.vuna:361"));
  ("Lowering_dTy.v_annotHeadTy", ("Vuna.Compiler.Lowering.Ty.annotHeadTy", "Vuna/Compiler/Lowering/Ty.vuna:297"));
  ("Lowering_dTy.v_annotTyOf", ("Vuna.Compiler.Lowering.Ty.annotTyOf", "Vuna/Compiler/Lowering/Ty.vuna:218"));
  ("Lowering_dTy.v_annotTyOfFuel", ("Vuna.Compiler.Lowering.Ty.annotTyOfFuel", "Vuna/Compiler/Lowering/Ty.vuna:229"));
  ("Lowering_dTy.v_annotTyOfTotal", ("Vuna.Compiler.Lowering.Ty.annotTyOfTotal", "Vuna/Compiler/Lowering/Ty.vuna:221"));
  ("Lowering_dTy.v_binderTyAtIn", ("Vuna.Compiler.Lowering.Ty.binderTyAtIn", "Vuna/Compiler/Lowering/Ty.vuna:283"));
  ("Lowering_dTy.v_countRuntimeArgs", ("Vuna.Compiler.Lowering.Ty.countRuntimeArgs", "Vuna/Compiler/Lowering/Ty.vuna:379"));
  ("Lowering_dTy.v_ctorArityNeed", ("Vuna.Compiler.Lowering.Ty.ctorArityNeed", "Vuna/Compiler/Lowering/Ty.vuna:190"));
  ("Lowering_dTy.v_ctorFieldTys", ("Vuna.Compiler.Lowering.Ty.ctorFieldTys", "Vuna/Compiler/Lowering/Ty.vuna:151"));
  ("Lowering_dTy.v_ctorKeptFieldTys", ("Vuna.Compiler.Lowering.Ty.ctorKeptFieldTys", "Vuna/Compiler/Lowering/Ty.vuna:460"));
  ("Lowering_dTy.v_ctorTypeArgsOf", ("Vuna.Compiler.Lowering.Ty.ctorTypeArgsOf", "Vuna/Compiler/Lowering/Ty.vuna:438"));
  ("Lowering_dTy.v_dataArityNeed", ("Vuna.Compiler.Lowering.Ty.dataArityNeed", "Vuna/Compiler/Lowering/Ty.vuna:196"));
  ("Lowering_dTy.v_findCtorInLocal", ("Vuna.Compiler.Lowering.Ty.findCtorInLocal", "Vuna/Compiler/Lowering/Ty.vuna:454"));
  ("Lowering_dTy.v_flagMatchesRigIn", ("Vuna.Compiler.Lowering.Ty.flagMatchesRigIn", "Vuna/Compiler/Lowering/Ty.vuna:146"));
  ("Lowering_dTy.v_flattenAnnotApp", ("Vuna.Compiler.Lowering.Ty.flattenAnnotApp", "Vuna/Compiler/Lowering/Ty.vuna:289"));
  ("Lowering_dTy.v_flattenAnnotAppGo", ("Vuna.Compiler.Lowering.Ty.flattenAnnotAppGo", "Vuna/Compiler/Lowering/Ty.vuna:292"));
  ("Lowering_dTy.v_flattenAnnotAppRig", ("Vuna.Compiler.Lowering.Ty.flattenAnnotAppRig", "Vuna/Compiler/Lowering/Ty.vuna:371"));
  ("Lowering_dTy.v_flattenAnnotAppRigGo", ("Vuna.Compiler.Lowering.Ty.flattenAnnotAppRigGo", "Vuna/Compiler/Lowering/Ty.vuna:374"));
  ("Lowering_dTy.v_foldlTyNames", ("Vuna.Compiler.Lowering.Ty.foldlTyNames", "Vuna/Compiler/Lowering/Ty.vuna:536"));
  ("Lowering_dTy.v_globalTyTermOf", ("Vuna.Compiler.Lowering.Ty.globalTyTermOf", "Vuna/Compiler/Lowering/Ty.vuna:354"));
  ("Lowering_dTy.v_maxIntListIn", ("Vuna.Compiler.Lowering.Ty.maxIntListIn", "Vuna/Compiler/Lowering/Ty.vuna:202"));
  ("Lowering_dTy.v_nthTermIn", ("Vuna.Compiler.Lowering.Ty.nthTermIn", "Vuna/Compiler/Lowering/Ty.vuna:433"));
  ("Lowering_dTy.v_peelIrFuns", ("Vuna.Compiler.Lowering.Ty.peelIrFuns", "Vuna/Compiler/Lowering/Ty.vuna:384"));
  ("Lowering_dTy.v_peelPiArgsTy", ("Vuna.Compiler.Lowering.Ty.peelPiArgsTy", "Vuna/Compiler/Lowering/Ty.vuna:396"));
  ("Lowering_dTy.v_renderFamilyArgs", ("Vuna.Compiler.Lowering.Ty.renderFamilyArgs", "Vuna/Compiler/Lowering/Ty.vuna:83"));
  ("Lowering_dTy.v_renderFieldTy", ("Vuna.Compiler.Lowering.Ty.renderFieldTy", "Vuna/Compiler/Lowering/Ty.vuna:117"));
  ("Lowering_dTy.v_renderPiTy", ("Vuna.Compiler.Lowering.Ty.renderPiTy", "Vuna/Compiler/Lowering/Ty.vuna:99"));
  ("Lowering_dTy.v_renderPiTyFuel", ("Vuna.Compiler.Lowering.Ty.renderPiTyFuel", "Vuna/Compiler/Lowering/Ty.vuna:102"));
  ("Lowering_dTy.v_renderTyFuel", ("Vuna.Compiler.Lowering.Ty.renderTyFuel", "Vuna/Compiler/Lowering/Ty.vuna:29"));
  ("Lowering_dTy.v_renderTyGlobal", ("Vuna.Compiler.Lowering.Ty.renderTyGlobal", "Vuna/Compiler/Lowering/Ty.vuna:60"));
  ("Lowering_dTy.v_renderTyIntrinsicWith", ("Vuna.Compiler.Lowering.Ty.renderTyIntrinsicWith", "Vuna/Compiler/Lowering/Ty.vuna:78"));
  ("Lowering_dTy.v_renderTyOf", ("Vuna.Compiler.Lowering.Ty.renderTyOf", "Vuna/Compiler/Lowering/Ty.vuna:26"));
  ("Lowering_dTy.v_reprTyIr", ("Vuna.Compiler.Lowering.Ty.reprTyIr", "Vuna/Compiler/Lowering/Ty.vuna:46"));
  ("Lowering_dTy.v_tyDeclOf", ("Vuna.Compiler.Lowering.Ty.tyDeclOf", "Vuna/Compiler/Lowering/Ty.vuna:493"));
  ("Lowering_dTy.v_tyDeclRefs", ("Vuna.Compiler.Lowering.Ty.tyDeclRefs", "Vuna/Compiler/Lowering/Ty.vuna:524"));
  ("Lowering_dTy.v_tyDeclRefsGo", ("Vuna.Compiler.Lowering.Ty.tyDeclRefsGo", "Vuna/Compiler/Lowering/Ty.vuna:532"));
  ("Lowering_dTy.v_tyDeclTys", ("Vuna.Compiler.Lowering.Ty.tyDeclTys", "Vuna/Compiler/Lowering/Ty.vuna:527"));
  ("Lowering_dTy.v_tyDeclsGo", ("Vuna.Compiler.Lowering.Ty.tyDeclsGo", "Vuna/Compiler/Lowering/Ty.vuna:486"));
  ("Lowering_dTy.v_tyDeclsOf", ("Vuna.Compiler.Lowering.Ty.tyDeclsOf", "Vuna/Compiler/Lowering/Ty.vuna:483"));
  ("Lowering_dTy.v_tyNamesInto", ("Vuna.Compiler.Lowering.Ty.tyNamesInto", "Vuna/Compiler/Lowering/Ty.vuna:540"));
  ("Main.v_Applicative_uBase_uData_uList_uList", ("Applicative_Base_Data_List_List", "Base/Data/List.vuna:179"));
  ("Main.v_Applicative_uBase_uData_uMaybe_uMaybe", ("Applicative_Base_Data_Maybe_Maybe", "Base/Data/Maybe.vuna:55"));
  ("Main.v_Applicative_uBase_uData_uResult_uResult", ("Applicative_Base_Data_Result_Result", "Base/Data/Result.vuna:33"));
  ("Main.v_Applicative_uBase_uEffect_uCore_uEff_ur", ("Applicative_Base_Effect_Core_Eff_r", "Base/Effect/Core.vuna:89"));
  ("Main.v_Applicative_uBase_uEffect_uPure_uError_uError_ue", ("Applicative_Base_Effect_Pure_Error_Error_e", "Base/Effect/Pure/Error.vuna:36"));
  ("Main.v_Applicative_uBase_uEffect_uPure_uReader_uReader_ue", ("Applicative_Base_Effect_Pure_Reader_Reader_e", "Base/Effect/Pure/Reader.vuna:23"));
  ("Main.v_Applicative_uBase_uEffect_uPure_uState_uState_us", ("Applicative_Base_Effect_Pure_State_State_s", "Base/Effect/Pure/State.vuna:43"));
  ("Main.v_Applicative_uVuna_uCompiler_uBase_uCommon_uEffCheck", ("Applicative_Vuna_Compiler_Base_Common_EffCheck", "Vuna/Compiler/Base/Common.vuna:41"));
  ("Main.v_Applicative_uVuna_uCompiler_uBase_uDiag_uCheck", ("Applicative_Vuna_Compiler_Base_Diag_Check", "Vuna/Compiler/Base/Diag.vuna:531"));
  ("Main.v_DebugShow_ua", ("DebugShow_a", "Base/Trait/Show.vuna:24"));
  ("Main.v_Eq_uArray_ua", ("Eq_Array_a", "Base/Container/Array.vuna:35"));
  ("Main.v_Eq_uBase_uData_uBool_uBool", ("Eq_Base_Data_Bool_Bool", "Base/Trait/Eq.vuna:17"));
  ("Main.v_Eq_uBase_uData_uList_uList_ua", ("Eq_Base_Data_List_List_a", "Base/Data/List.vuna:200"));
  ("Main.v_Eq_uBase_uData_uMaybe_uMaybe_ua", ("Eq_Base_Data_Maybe_Maybe_a", "Base/Data/Maybe.vuna:82"));
  ("Main.v_Eq_uBase_uData_uNat_uNat", ("Eq_Base_Data_Nat_Nat", "Base/Data/Nat.vuna:54"));
  ("Main.v_Eq_uBase_uData_uPair_uPair_ua_ub", ("Eq_Base_Data_Pair_Pair_a_b", "Base/Data/Pair.vuna:34"));
  ("Main.v_Eq_uBase_uData_uResult_uResult_ua", ("Eq_Base_Data_Result_Result_a", "Base/Data/Result.vuna:82"));
  ("Main.v_Eq_uBase_uData_uUnit_uUnit", ("Eq_Base_Data_Unit_Unit", "Base/Data/Unit.vuna:16"));
  ("Main.v_Eq_uBase_uTrait_uOrd_uOrdering", ("Eq_Base_Trait_Ord_Ordering", "Base/Trait/Ord.vuna:45"));
  ("Main.v_Eq_uFloat", ("Eq_Float", "Base/Data/Float.vuna:25"));
  ("Main.v_Eq_uInt", ("Eq_Int", "Base/Data/Int.vuna:13"));
  ("Main.v_Eq_uString", ("Eq_String", "Base/Data/String.vuna:151"));
  ("Main.v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry", ("Eq_Vuna_Compiler_Loader_Modules_ExportEntry", "Vuna/Compiler/Loader/Modules.vuna:103"));
  ("Main.v_Foldable_uBase_uData_uList_uList", ("Foldable_Base_Data_List_List", "Base/Data/List.vuna:231"));
  ("Main.v_Foldable_uBase_uData_uMaybe_uMaybe", ("Foldable_Base_Data_Maybe_Maybe", "Base/Data/Maybe.vuna:116"));
  ("Main.v_Foldable_uBase_uData_uResult_uResult", ("Foldable_Base_Data_Result_Result", "Base/Data/Result.vuna:94"));
  ("Main.v_FromFloat_uFloat", ("FromFloat_Float", "Base/Data/Float.vuna:22"));
  ("Main.v_FromInt_uInt", ("FromInt_Int", "Base/Trait/FromInt.vuna:14"));
  ("Main.v_FromString_uString", ("FromString_String", "Base/Trait/FromString.vuna:14"));
  ("Main.v_Functor_uBase_uData_uList_uList", ("Functor_Base_Data_List_List", "Base/Data/List.vuna:173"));
  ("Main.v_Functor_uBase_uData_uMaybe_uMaybe", ("Functor_Base_Data_Maybe_Maybe", "Base/Data/Maybe.vuna:43"));
  ("Main.v_Functor_uBase_uData_uResult_uResult", ("Functor_Base_Data_Result_Result", "Base/Data/Result.vuna:25"));
  ("Main.v_Functor_uBase_uEffect_uCore_uEff_ur", ("Functor_Base_Effect_Core_Eff_r", "Base/Effect/Core.vuna:71"));
  ("Main.v_Functor_uBase_uEffect_uPure_uError_uError_ue", ("Functor_Base_Effect_Pure_Error_Error_e", "Base/Effect/Pure/Error.vuna:28"));
  ("Main.v_Functor_uBase_uEffect_uPure_uReader_uReader_ue", ("Functor_Base_Effect_Pure_Reader_Reader_e", "Base/Effect/Pure/Reader.vuna:17"));
  ("Main.v_Functor_uBase_uEffect_uPure_uState_uState_us", ("Functor_Base_Effect_Pure_State_State_s", "Base/Effect/Pure/State.vuna:27"));
  ("Main.v_Functor_uVuna_uCompiler_uBase_uCommon_uEffCheck", ("Functor_Vuna_Compiler_Base_Common_EffCheck", "Vuna/Compiler/Base/Common.vuna:38"));
  ("Main.v_Functor_uVuna_uCompiler_uBase_uDiag_uCheck", ("Functor_Vuna_Compiler_Base_Diag_Check", "Vuna/Compiler/Base/Diag.vuna:523"));
  ("Main.v_Hashable_uBase_uData_uBool_uBool", ("Hashable_Base_Data_Bool_Bool", "Base/Data/Bool.vuna:47"));
  ("Main.v_Hashable_uBase_uData_uList_uList_ua", ("Hashable_Base_Data_List_List_a", "Base/Data/List.vuna:217"));
  ("Main.v_Hashable_uBase_uData_uMaybe_uMaybe_ua", ("Hashable_Base_Data_Maybe_Maybe_a", "Base/Data/Maybe.vuna:98"));
  ("Main.v_Hashable_uBase_uData_uNat_uNat", ("Hashable_Base_Data_Nat_Nat", "Base/Data/Nat.vuna:74"));
  ("Main.v_Hashable_uBase_uData_uPair_uPair_ua_ub", ("Hashable_Base_Data_Pair_Pair_a_b", "Base/Data/Pair.vuna:44"));
  ("Main.v_Hashable_uBase_uData_uResult_uResult_ua", ("Hashable_Base_Data_Result_Result_a", "Base/Data/Result.vuna:88"));
  ("Main.v_Hashable_uBase_uData_uUnit_uUnit", ("Hashable_Base_Data_Unit_Unit", "Base/Data/Unit.vuna:29"));
  ("Main.v_Hashable_uBase_uTrait_uOrd_uOrdering", ("Hashable_Base_Trait_Ord_Ordering", "Base/Trait/Ord.vuna:89"));
  ("Main.v_Hashable_uInt", ("Hashable_Int", "Base/Data/Int.vuna:38"));
  ("Main.v_Hashable_uString", ("Hashable_String", "Base/Data/String.vuna:162"));
  ("Main.v_Interp_uString", ("Interp_String", "Base/Trait/Interp.vuna:22"));
  ("Main.v_Interp_ua", ("Interp_a", "Base/Trait/Interp.vuna:18"));
  ("Main.v_Monad_uBase_uData_uList_uList", ("Monad_Base_Data_List_List", "Base/Data/List.vuna:176"));
  ("Main.v_Monad_uBase_uData_uMaybe_uMaybe", ("Monad_Base_Data_Maybe_Maybe", "Base/Data/Maybe.vuna:49"));
  ("Main.v_Monad_uBase_uData_uResult_uResult", ("Monad_Base_Data_Result_Result", "Base/Data/Result.vuna:29"));
  ("Main.v_Monad_uBase_uEffect_uCore_uEff_ur", ("Monad_Base_Effect_Core_Eff_r", "Base/Effect/Core.vuna:79"));
  ("Main.v_Monad_uBase_uEffect_uPure_uError_uError_ue", ("Monad_Base_Effect_Pure_Error_Error_e", "Base/Effect/Pure/Error.vuna:32"));
  ("Main.v_Monad_uBase_uEffect_uPure_uReader_uReader_ue", ("Monad_Base_Effect_Pure_Reader_Reader_e", "Base/Effect/Pure/Reader.vuna:20"));
  ("Main.v_Monad_uBase_uEffect_uPure_uState_uState_us", ("Monad_Base_Effect_Pure_State_State_s", "Base/Effect/Pure/State.vuna:35"));
  ("Main.v_Monad_uVuna_uCompiler_uBase_uCommon_uEffCheck", ("Monad_Vuna_Compiler_Base_Common_EffCheck", "Vuna/Compiler/Base/Common.vuna:46"));
  ("Main.v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck", ("Monad_Vuna_Compiler_Base_Diag_Check", "Vuna/Compiler/Base/Diag.vuna:527"));
  ("Main.v_Monoid_uBase_uData_uList_uList_ua", ("Monoid_Base_Data_List_List_a", "Base/Data/List.vuna:227"));
  ("Main.v_Monoid_uBase_uData_uMaybe_uMaybe_ua", ("Monoid_Base_Data_Maybe_Maybe_a", "Base/Data/Maybe.vuna:113"));
  ("Main.v_Monoid_uBase_uData_uNat_uNat", ("Monoid_Base_Data_Nat_Nat", "Base/Data/Nat.vuna:80"));
  ("Main.v_Monoid_uBase_uData_uUnit_uUnit", ("Monoid_Base_Data_Unit_Unit", "Base/Data/Unit.vuna:35"));
  ("Main.v_Monoid_uString", ("Monoid_String", "Base/Data/String.vuna:168"));
  ("Main.v_Neg_uFloat", ("Neg_Float", "Base/Data/Float.vuna:43"));
  ("Main.v_Neg_uInt", ("Neg_Int", "Base/Data/Int.vuna:31"));
  ("Main.v_Num_uBase_uData_uNat_uNat", ("Num_Base_Data_Nat_Nat", "Base/Data/Nat.vuna:65"));
  ("Main.v_Num_uFloat", ("Num_Float", "Base/Data/Float.vuna:36"));
  ("Main.v_Num_uInt", ("Num_Int", "Base/Data/Int.vuna:24"));
  ("Main.v_Ord_uBase_uData_uBool_uBool", ("Ord_Base_Data_Bool_Bool", "Base/Trait/Ord.vuna:26"));
  ("Main.v_Ord_uBase_uData_uList_uList_ua", ("Ord_Base_Data_List_List_a", "Base/Data/List.vuna:207"));
  ("Main.v_Ord_uBase_uData_uMaybe_uMaybe_ua", ("Ord_Base_Data_Maybe_Maybe_a", "Base/Data/Maybe.vuna:89"));
  ("Main.v_Ord_uBase_uData_uNat_uNat", ("Ord_Base_Data_Nat_Nat", "Base/Data/Nat.vuna:58"));
  ("Main.v_Ord_uBase_uData_uPair_uPair_ua_ub", ("Ord_Base_Data_Pair_Pair_a_b", "Base/Data/Pair.vuna:38"));
  ("Main.v_Ord_uBase_uData_uUnit_uUnit", ("Ord_Base_Data_Unit_Unit", "Base/Data/Unit.vuna:20"));
  ("Main.v_Ord_uBase_uTrait_uOrd_uOrdering", ("Ord_Base_Trait_Ord_Ordering", "Base/Trait/Ord.vuna:52"));
  ("Main.v_Ord_uFloat", ("Ord_Float", "Base/Data/Float.vuna:29"));
  ("Main.v_Ord_uInt", ("Ord_Int", "Base/Data/Int.vuna:17"));
  ("Main.v_Ord_uString", ("Ord_String", "Base/Data/String.vuna:155"));
  ("Main.v_Semigroup_uBase_uData_uList_uList_ua", ("Semigroup_Base_Data_List_List_a", "Base/Data/List.vuna:224"));
  ("Main.v_Semigroup_uBase_uData_uMaybe_uMaybe_ua", ("Semigroup_Base_Data_Maybe_Maybe_a", "Base/Data/Maybe.vuna:104"));
  ("Main.v_Semigroup_uBase_uData_uNat_uNat", ("Semigroup_Base_Data_Nat_Nat", "Base/Data/Nat.vuna:77"));
  ("Main.v_Semigroup_uBase_uData_uUnit_uUnit", ("Semigroup_Base_Data_Unit_Unit", "Base/Data/Unit.vuna:32"));
  ("Main.v_Semigroup_uString", ("Semigroup_String", "Base/Data/String.vuna:165"));
  ("Main.v_Show_uArray_ua", ("Show_Array_a", "Base/Container/Array.vuna:40"));
  ("Main.v_Show_uBase_uContainer_uHashMap_uHashMap_uk_uv", ("Show_Base_Container_HashMap_HashMap_k_v", "Base/Container/HashMap.vuna:116"));
  ("Main.v_Show_uBase_uData_uBool_uBool", ("Show_Base_Data_Bool_Bool", "Base/Data/Bool.vuna:43"));
  ("Main.v_Show_uBase_uData_uList_uList_ua", ("Show_Base_Data_List_List_a", "Base/Data/List.vuna:196"));
  ("Main.v_Show_uBase_uData_uMaybe_uMaybe_ua", ("Show_Base_Data_Maybe_Maybe_a", "Base/Data/Maybe.vuna:75"));
  ("Main.v_Show_uBase_uData_uNat_uNat", ("Show_Base_Data_Nat_Nat", "Base/Data/Nat.vuna:71"));
  ("Main.v_Show_uBase_uData_uPair_uPair_ua_ub", ("Show_Base_Data_Pair_Pair_a_b", "Base/Data/Pair.vuna:28"));
  ("Main.v_Show_uBase_uData_uResult_uResult_ua", ("Show_Base_Data_Result_Result_a", "Base/Data/Result.vuna:75"));
  ("Main.v_Show_uBase_uData_uUnit_uUnit", ("Show_Base_Data_Unit_Unit", "Base/Data/Unit.vuna:26"));
  ("Main.v_Show_uBase_uTrait_uOrd_uOrdering", ("Show_Base_Trait_Ord_Ordering", "Base/Trait/Ord.vuna:70"));
  ("Main.v_Show_uFloat", ("Show_Float", "Base/Data/Float.vuna:46"));
  ("Main.v_Show_uInt", ("Show_Int", "Base/Data/Int.vuna:34"));
  ("Main.v_Show_uString", ("Show_String", "Base/Trait/Show.vuna:14"));
  ("Main.v_Traversable_uBase_uData_uList_uList_uf", ("Traversable_Base_Data_List_List_f", "Base/Data/List.vuna:234"));
  ("Main.v_Traversable_uBase_uData_uMaybe_uMaybe_uf", ("Traversable_Base_Data_Maybe_Maybe_f", "Base/Data/Maybe.vuna:122"));
  ("Main.v_Traversable_uBase_uData_uResult_uResult_uf", ("Traversable_Base_Data_Result_Result_f", "Base/Data/Result.vuna:100"));
  ("Main.v_main", ("main", "app/Main.vuna:43"));
  ("Native_dAbi.v_isNativeNameChar", ("Vuna.Compiler.Native.Abi.isNativeNameChar", "Vuna/Compiler/Native/Abi.vuna:220"));
  ("Native_dAbi.v_mapRetTo", ("Vuna.Compiler.Native.Abi.mapRetTo", "Vuna/Compiler/Native/Abi.vuna:195"));
  ("Native_dAbi.v_nativeArenaEndLabel", ("Vuna.Compiler.Native.Abi.nativeArenaEndLabel", "Vuna/Compiler/Native/Abi.vuna:141"));
  ("Native_dAbi.v_nativeArgRegs", ("Vuna.Compiler.Native.Abi.nativeArgRegs", "Vuna/Compiler/Native/Abi.vuna:34"));
  ("Native_dAbi.v_nativeBlockHeaderBytes", ("Vuna.Compiler.Native.Abi.nativeBlockHeaderBytes", "Vuna/Compiler/Native/Abi.vuna:82"));
  ("Native_dAbi.v_nativeClassCount", ("Vuna.Compiler.Native.Abi.nativeClassCount", "Vuna/Compiler/Native/Abi.vuna:109"));
  ("Native_dAbi.v_nativeCleanupHeadLabel", ("Vuna.Compiler.Native.Abi.nativeCleanupHeadLabel", "Vuna/Compiler/Native/Abi.vuna:172"));
  ("Native_dAbi.v_nativeCurSegLabel", ("Vuna.Compiler.Native.Abi.nativeCurSegLabel", "Vuna/Compiler/Native/Abi.vuna:149"));
  ("Native_dAbi.v_nativeDataLabel", ("Vuna.Compiler.Native.Abi.nativeDataLabel", "Vuna/Compiler/Native/Abi.vuna:256"));
  ("Native_dAbi.v_nativeEntryLabel", ("Vuna.Compiler.Native.Abi.nativeEntryLabel", "Vuna/Compiler/Native/Abi.vuna:247"));
  ("Native_dAbi.v_nativeEpilogue", ("Vuna.Compiler.Native.Abi.nativeEpilogue", "Vuna/Compiler/Native/Abi.vuna:186"));
  ("Native_dAbi.v_nativeFrameBytes", ("Vuna.Compiler.Native.Abi.nativeFrameBytes", "Vuna/Compiler/Native/Abi.vuna:52"));
  ("Native_dAbi.v_nativeFreeFlag", ("Vuna.Compiler.Native.Abi.nativeFreeFlag", "Vuna/Compiler/Native/Abi.vuna:89"));
  ("Native_dAbi.v_nativeFreeTableBytes", ("Vuna.Compiler.Native.Abi.nativeFreeTableBytes", "Vuna/Compiler/Native/Abi.vuna:113"));
  ("Native_dAbi.v_nativeFreeTableLabel", ("Vuna.Compiler.Native.Abi.nativeFreeTableLabel", "Vuna/Compiler/Native/Abi.vuna:153"));
  ("Native_dAbi.v_nativeFuncLabel", ("Vuna.Compiler.Native.Abi.nativeFuncLabel", "Vuna/Compiler/Native/Abi.vuna:231"));
  ("Native_dAbi.v_nativeGcMinDefaultBytes", ("Vuna.Compiler.Native.Abi.nativeGcMinDefaultBytes", "Vuna/Compiler/Native/Abi.vuna:161"));
  ("Native_dAbi.v_nativeGlobalValueLabel", ("Vuna.Compiler.Native.Abi.nativeGlobalValueLabel", "Vuna/Compiler/Native/Abi.vuna:239"));
  ("Native_dAbi.v_nativeHeapBytes", ("Vuna.Compiler.Native.Abi.nativeHeapBytes", "Vuna/Compiler/Native/Abi.vuna:121"));
  ("Native_dAbi.v_nativeHeapEndLabel", ("Vuna.Compiler.Native.Abi.nativeHeapEndLabel", "Vuna/Compiler/Native/Abi.vuna:133"));
  ("Native_dAbi.v_nativeHeapLabel", ("Vuna.Compiler.Native.Abi.nativeHeapLabel", "Vuna/Compiler/Native/Abi.vuna:129"));
  ("Native_dAbi.v_nativeHeapPtrLabel", ("Vuna.Compiler.Native.Abi.nativeHeapPtrLabel", "Vuna/Compiler/Native/Abi.vuna:137"));
  ("Native_dAbi.v_nativeHeapSegLabel", ("Vuna.Compiler.Native.Abi.nativeHeapSegLabel", "Vuna/Compiler/Native/Abi.vuna:125"));
  ("Native_dAbi.v_nativeHugeFreeLabel", ("Vuna.Compiler.Native.Abi.nativeHugeFreeLabel", "Vuna/Compiler/Native/Abi.vuna:157"));
  ("Native_dAbi.v_nativeJumpLabel", ("Vuna.Compiler.Native.Abi.nativeJumpLabel", "Vuna/Compiler/Native/Abi.vuna:252"));
  ("Native_dAbi.v_nativeLeafFlag", ("Vuna.Compiler.Native.Abi.nativeLeafFlag", "Vuna/Compiler/Native/Abi.vuna:93"));
  ("Native_dAbi.v_nativeMarkFlag", ("Vuna.Compiler.Native.Abi.nativeMarkFlag", "Vuna/Compiler/Native/Abi.vuna:86"));
  ("Native_dAbi.v_nativeMaxArgs", ("Vuna.Compiler.Native.Abi.nativeMaxArgs", "Vuna/Compiler/Native/Abi.vuna:38"));
  ("Native_dAbi.v_nativeMaxClassBytes", ("Vuna.Compiler.Native.Abi.nativeMaxClassBytes", "Vuna/Compiler/Native/Abi.vuna:105"));
  ("Native_dAbi.v_nativeMinBlockBytes", ("Vuna.Compiler.Native.Abi.nativeMinBlockBytes", "Vuna/Compiler/Native/Abi.vuna:101"));
  ("Native_dAbi.v_nativeName", ("Vuna.Compiler.Native.Abi.nativeName", "Vuna/Compiler/Native/Abi.vuna:227"));
  ("Native_dAbi.v_nativeNameChar", ("Vuna.Compiler.Native.Abi.nativeNameChar", "Vuna/Compiler/Native/Abi.vuna:223"));
  ("Native_dAbi.v_nativePinFlag", ("Vuna.Compiler.Native.Abi.nativePinFlag", "Vuna/Compiler/Native/Abi.vuna:97"));
  ("Native_dAbi.v_nativePrologue", ("Vuna.Compiler.Native.Abi.nativePrologue", "Vuna/Compiler/Native/Abi.vuna:179"));
  ("Native_dAbi.v_nativeRtLabel", ("Vuna.Compiler.Native.Abi.nativeRtLabel", "Vuna/Compiler/Native/Abi.vuna:235"));
  ("Native_dAbi.v_nativeRtValueLabel", ("Vuna.Compiler.Native.Abi.nativeRtValueLabel", "Vuna/Compiler/Native/Abi.vuna:243"));
  ("Native_dAbi.v_nativeRuntimeModule", ("Vuna.Compiler.Native.Abi.nativeRuntimeModule", "Vuna/Compiler/Native/Abi.vuna:30"));
  ("Native_dAbi.v_nativeSegHeaderBytes", ("Vuna.Compiler.Native.Abi.nativeSegHeaderBytes", "Vuna/Compiler/Native/Abi.vuna:117"));
  ("Native_dAbi.v_nativeSegsLabel", ("Vuna.Compiler.Native.Abi.nativeSegsLabel", "Vuna/Compiler/Native/Abi.vuna:145"));
  ("Native_dAbi.v_nativeSlotOff", ("Vuna.Compiler.Native.Abi.nativeSlotOff", "Vuna/Compiler/Native/Abi.vuna:48"));
  ("Native_dAbi.v_nativeStackArgCount", ("Vuna.Compiler.Native.Abi.nativeStackArgCount", "Vuna/Compiler/Native/Abi.vuna:59"));
  ("Native_dAbi.v_nativeStackArgOff", ("Vuna.Compiler.Native.Abi.nativeStackArgOff", "Vuna/Compiler/Native/Abi.vuna:44"));
  ("Native_dAbi.v_nativeStackPadBytes", ("Vuna.Compiler.Native.Abi.nativeStackPadBytes", "Vuna/Compiler/Native/Abi.vuna:66"));
  ("Native_dAbi.v_nativeStackTopLabel", ("Vuna.Compiler.Native.Abi.nativeStackTopLabel", "Vuna/Compiler/Native/Abi.vuna:168"));
  ("Native_dAbi.v_nativeStrHeaderBytes", ("Vuna.Compiler.Native.Abi.nativeStrHeaderBytes", "Vuna/Compiler/Native/Abi.vuna:78"));
  ("Native_dAbi.v_nativeStrLitLabel", ("Vuna.Compiler.Native.Abi.nativeStrLitLabel", "Vuna/Compiler/Native/Abi.vuna:260"));
  ("Native_dAbi.v_nativeTailRoomBytes", ("Vuna.Compiler.Native.Abi.nativeTailRoomBytes", "Vuna/Compiler/Native/Abi.vuna:71"));
  ("Native_dAbi.v_rtFunc", ("Vuna.Compiler.Native.Abi.rtFunc", "Vuna/Compiler/Native/Abi.vuna:203"));
  ("Native_dAbi.v_rtRawFunc", ("Vuna.Compiler.Native.Abi.rtRawFunc", "Vuna/Compiler/Native/Abi.vuna:214"));
  ("Native_dAbi.v_stackGuardInstrs", ("Vuna.Compiler.Native.Abi.stackGuardInstrs", "Vuna/Compiler/Native/Abi.vuna:190"));
  ("Native_dAudit.v_auditAltKeys", ("Vuna.Compiler.Native.Audit.auditAltKeys", "Vuna/Compiler/Native/Audit.vuna:89"));
  ("Native_dAudit.v_auditAltMaybeKeys", ("Vuna.Compiler.Native.Audit.auditAltMaybeKeys", "Vuna/Compiler/Native/Audit.vuna:92"));
  ("Native_dAudit.v_auditCategories", ("Vuna.Compiler.Native.Audit.auditCategories", "Vuna/Compiler/Native/Audit.vuna:129"));
  ("Native_dAudit.v_auditCategoryExamples", ("Vuna.Compiler.Native.Audit.auditCategoryExamples", "Vuna/Compiler/Native/Audit.vuna:135"));
  ("Native_dAudit.v_auditCategoryLine", ("Vuna.Compiler.Native.Audit.auditCategoryLine", "Vuna/Compiler/Native/Audit.vuna:145"));
  ("Native_dAudit.v_auditDefKeys", ("Vuna.Compiler.Native.Audit.auditDefKeys", "Vuna/Compiler/Native/Audit.vuna:96"));
  ("Native_dAudit.v_auditErased", ("Vuna.Compiler.Native.Audit.auditErased", "Vuna/Compiler/Native/Audit.vuna:23"));
  ("Native_dAudit.v_auditExamplesText", ("Vuna.Compiler.Native.Audit.auditExamplesText", "Vuna/Compiler/Native/Audit.vuna:139"));
  ("Native_dAudit.v_auditInCategory", ("Vuna.Compiler.Native.Audit.auditInCategory", "Vuna/Compiler/Native/Audit.vuna:132"));
  ("Native_dAudit.v_auditKeys", ("Vuna.Compiler.Native.Audit.auditKeys", "Vuna/Compiler/Native/Audit.vuna:54"));
  ("Native_dAudit.v_auditPrefixOf", ("Vuna.Compiler.Native.Audit.auditPrefixOf", "Vuna/Compiler/Native/Audit.vuna:114"));
  ("Native_dAudit.v_auditRestOf", ("Vuna.Compiler.Native.Audit.auditRestOf", "Vuna/Compiler/Native/Audit.vuna:121"));
  ("Native_dAudit.v_auditRtAppKeys", ("Vuna.Compiler.Native.Audit.auditRtAppKeys", "Vuna/Compiler/Native/Audit.vuna:43"));
  ("Native_dAudit.v_auditRuntimeBinders", ("Vuna.Compiler.Native.Audit.auditRuntimeBinders", "Vuna/Compiler/Native/Audit.vuna:27"));
  ("Native_dAudit.v_auditSymSupported", ("Vuna.Compiler.Native.Audit.auditSymSupported", "Vuna/Compiler/Native/Audit.vuna:31"));
  ("Native_dAudit.v_auditUniq", ("Vuna.Compiler.Native.Audit.auditUniq", "Vuna/Compiler/Native/Audit.vuna:105"));
  ("Native_dAudit.v_memKey", ("Vuna.Compiler.Native.Audit.memKey", "Vuna/Compiler/Native/Audit.vuna:109"));
  ("Native_dAudit.v_nativeAuditEnrich", ("Vuna.Compiler.Native.Audit.nativeAuditEnrich", "Vuna/Compiler/Native/Audit.vuna:170"));
  ("Native_dAudit.v_nativeAuditLines", ("Vuna.Compiler.Native.Audit.nativeAuditLines", "Vuna/Compiler/Native/Audit.vuna:156"));
  ("Native_dGc.v_allocReqLabel", ("Vuna.Compiler.Native.Gc.allocReqLabel", "Vuna/Compiler/Native/Gc.vuna:78"));
  ("Native_dGc.v_allocSaveR8Label", ("Vuna.Compiler.Native.Gc.allocSaveR8Label", "Vuna/Compiler/Native/Gc.vuna:87"));
  ("Native_dGc.v_allocSaveR9Label", ("Vuna.Compiler.Native.Gc.allocSaveR9Label", "Vuna/Compiler/Native/Gc.vuna:90"));
  ("Native_dGc.v_allocSaveRdiLabel", ("Vuna.Compiler.Native.Gc.allocSaveRdiLabel", "Vuna/Compiler/Native/Gc.vuna:81"));
  ("Native_dGc.v_allocSaveRsiLabel", ("Vuna.Compiler.Native.Gc.allocSaveRsiLabel", "Vuna/Compiler/Native/Gc.vuna:84"));
  ("Native_dGc.v_gcAppendFn", ("Vuna.Compiler.Native.Gc.gcAppendFn", "Vuna/Compiler/Native/Gc.vuna:192"));
  ("Native_dGc.v_gcBufLabel", ("Vuna.Compiler.Native.Gc.gcBufLabel", "Vuna/Compiler/Native/Gc.vuna:93"));
  ("Native_dGc.v_gcCollectFn", ("Vuna.Compiler.Native.Gc.gcCollectFn", "Vuna/Compiler/Native/Gc.vuna:207"));
  ("Native_dGc.v_gcCountLabel", ("Vuna.Compiler.Native.Gc.gcCountLabel", "Vuna/Compiler/Native/Gc.vuna:38"));
  ("Native_dGc.v_gcGrowMarkFn", ("Vuna.Compiler.Native.Gc.gcGrowMarkFn", "Vuna/Compiler/Native/Gc.vuna:151"));
  ("Native_dGc.v_gcHiLabel", ("Vuna.Compiler.Native.Gc.gcHiLabel", "Vuna/Compiler/Native/Gc.vuna:67"));
  ("Native_dGc.v_gcLiveLabel", ("Vuna.Compiler.Native.Gc.gcLiveLabel", "Vuna/Compiler/Native/Gc.vuna:26"));
  ("Native_dGc.v_gcLoLabel", ("Vuna.Compiler.Native.Gc.gcLoLabel", "Vuna/Compiler/Native/Gc.vuna:64"));
  ("Native_dGc.v_gcLogFn", ("Vuna.Compiler.Native.Gc.gcLogFn", "Vuna/Compiler/Native/Gc.vuna:198"));
  ("Native_dGc.v_gcLogLabel", ("Vuna.Compiler.Native.Gc.gcLogLabel", "Vuna/Compiler/Native/Gc.vuna:44"));
  ("Native_dGc.v_gcMinLabel", ("Vuna.Compiler.Native.Gc.gcMinLabel", "Vuna/Compiler/Native/Gc.vuna:35"));
  ("Native_dGc.v_gcRunningLabel", ("Vuna.Compiler.Native.Gc.gcRunningLabel", "Vuna/Compiler/Native/Gc.vuna:47"));
  ("Native_dGc.v_gcScanWordsFn", ("Vuna.Compiler.Native.Gc.gcScanWordsFn", "Vuna/Compiler/Native/Gc.vuna:172"));
  ("Native_dGc.v_gcSinceLabel", ("Vuna.Compiler.Native.Gc.gcSinceLabel", "Vuna/Compiler/Native/Gc.vuna:29"));
  ("Native_dGc.v_gcSpanLabel", ("Vuna.Compiler.Native.Gc.gcSpanLabel", "Vuna/Compiler/Native/Gc.vuna:74"));
  ("Native_dGc.v_gcStressLabel", ("Vuna.Compiler.Native.Gc.gcStressLabel", "Vuna/Compiler/Native/Gc.vuna:41"));
  ("Native_dGc.v_gcSweepFn", ("Vuna.Compiler.Native.Gc.gcSweepFn", "Vuna/Compiler/Native/Gc.vuna:181"));
  ("Native_dGc.v_gcThresholdLabel", ("Vuna.Compiler.Native.Gc.gcThresholdLabel", "Vuna/Compiler/Native/Gc.vuna:32"));
  ("Native_dGc.v_gcTmpLabel", ("Vuna.Compiler.Native.Gc.gcTmpLabel", "Vuna/Compiler/Native/Gc.vuna:70"));
  ("Native_dGc.v_gcTryFn", ("Vuna.Compiler.Native.Gc.gcTryFn", "Vuna/Compiler/Native/Gc.vuna:162"));
  ("Native_dGc.v_initGcFn", ("Vuna.Compiler.Native.Gc.initGcFn", "Vuna/Compiler/Native/Gc.vuna:140"));
  ("Native_dGc.v_markBaseLabel", ("Vuna.Compiler.Native.Gc.markBaseLabel", "Vuna/Compiler/Native/Gc.vuna:51"));
  ("Native_dGc.v_markEndLabel", ("Vuna.Compiler.Native.Gc.markEndLabel", "Vuna/Compiler/Native/Gc.vuna:57"));
  ("Native_dGc.v_markSizeLabel", ("Vuna.Compiler.Native.Gc.markSizeLabel", "Vuna/Compiler/Native/Gc.vuna:60"));
  ("Native_dGc.v_markTopLabel", ("Vuna.Compiler.Native.Gc.markTopLabel", "Vuna/Compiler/Native/Gc.vuna:54"));
  ("Native_dGc.v_nativeGcBss", ("Vuna.Compiler.Native.Gc.nativeGcBss", "Vuna/Compiler/Native/Gc.vuna:96"));
  ("Native_dGc.v_nativeGcFuncs", ("Vuna.Compiler.Native.Gc.nativeGcFuncs", "Vuna/Compiler/Native/Gc.vuna:214"));
  ("Native_dGc.v_nativeGcRodata", ("Vuna.Compiler.Native.Gc.nativeGcRodata", "Vuna/Compiler/Native/Gc.vuna:123"));
  ("Native_dModel.v_nativeErrText", ("Vuna.Compiler.Native.Model.nativeErrText", "Vuna/Compiler/Native/Model.vuna:28"));
  ("Native_dModel.v_reg8Text", ("Vuna.Compiler.Native.Model.reg8Text", "Vuna/Compiler/Native/Model.vuna:65"));
  ("Native_dModel.v_regText", ("Vuna.Compiler.Native.Model.regText", "Vuna/Compiler/Native/Model.vuna:50"));
  ("Native_dModule.v_addDefToPools", ("Vuna.Compiler.Native.Module.addDefToPools", "Vuna/Compiler/Native/Module.vuna:329"));
  ("Native_dModule.v_addLit", ("Vuna.Compiler.Native.Module.addLit", "Vuna/Compiler/Native/Module.vuna:310"));
  ("Native_dModule.v_applyAllIr", ("Vuna.Compiler.Native.Module.applyAllIr", "Vuna/Compiler/Native/Module.vuna:757"));
  ("Native_dModule.v_argRegAt", ("Vuna.Compiler.Native.Module.argRegAt", "Vuna/Compiler/Native/Module.vuna:361"));
  ("Native_dModule.v_argRegAtIn", ("Vuna.Compiler.Native.Module.argRegAtIn", "Vuna/Compiler/Native/Module.vuna:364"));
  ("Native_dModule.v_arrayFromListFn", ("Vuna.Compiler.Native.Module.arrayFromListFn", "Vuna/Compiler/Native/Module.vuna:1823"));
  ("Native_dModule.v_arrayToListFn", ("Vuna.Compiler.Native.Module.arrayToListFn", "Vuna/Compiler/Native/Module.vuna:1838"));
  ("Native_dModule.v_bNameEq", ("Vuna.Compiler.Native.Module.bNameEq", "Vuna/Compiler/Native/Module.vuna:127"));
  ("Native_dModule.v_baseSlotRead", ("Vuna.Compiler.Native.Module.baseSlotRead", "Vuna/Compiler/Native/Module.vuna:164"));
  ("Native_dModule.v_bindArgs", ("Vuna.Compiler.Native.Module.bindArgs", "Vuna/Compiler/Native/Module.vuna:1461"));
  ("Native_dModule.v_bindArgsGo", ("Vuna.Compiler.Native.Module.bindArgsGo", "Vuna/Compiler/Native/Module.vuna:1472"));
  ("Native_dModule.v_bindCaptures", ("Vuna.Compiler.Native.Module.bindCaptures", "Vuna/Compiler/Native/Module.vuna:951"));
  ("Native_dModule.v_bindFields", ("Vuna.Compiler.Native.Module.bindFields", "Vuna/Compiler/Native/Module.vuna:1358"));
  ("Native_dModule.v_binderEq", ("Vuna.Compiler.Native.Module.binderEq", "Vuna/Compiler/Native/Module.vuna:134"));
  ("Native_dModule.v_bridgeFn", ("Vuna.Compiler.Native.Module.bridgeFn", "Vuna/Compiler/Native/Module.vuna:1698"));
  ("Native_dModule.v_bridgeFnExits", ("Vuna.Compiler.Native.Module.bridgeFnExits", "Vuna/Compiler/Native/Module.vuna:1687"));
  ("Native_dModule.v_build", ("Vuna.Compiler.Native.Module.build", "Vuna/Compiler/Native/Module.vuna:1912"));
  ("Native_dModule.v_buildCmdFn", ("Vuna.Compiler.Native.Module.buildCmdFn", "Vuna/Compiler/Native/Module.vuna:1745"));
  ("Native_dModule.v_buildSlotUse", ("Vuna.Compiler.Native.Module.buildSlotUse", "Vuna/Compiler/Native/Module.vuna:217"));
  ("Native_dModule.v_callSlotsInstrs", ("Vuna.Compiler.Native.Module.callSlotsInstrs", "Vuna/Compiler/Native/Module.vuna:423"));
  ("Native_dModule.v_caseFamilyOf", ("Vuna.Compiler.Native.Module.caseFamilyOf", "Vuna/Compiler/Native/Module.vuna:1274"));
  ("Native_dModule.v_caseFamilyOfAlts", ("Vuna.Compiler.Native.Module.caseFamilyOfAlts", "Vuna/Compiler/Native/Module.vuna:1278"));
  ("Native_dModule.v_cat", ("Vuna.Compiler.Native.Module.cat", "Vuna/Compiler/Native/Module.vuna:1024"));
  ("Native_dModule.v_clearDeadSlots", ("Vuna.Compiler.Native.Module.clearDeadSlots", "Vuna/Compiler/Native/Module.vuna:289"));
  ("Native_dModule.v_clearSlotOf", ("Vuna.Compiler.Native.Module.clearSlotOf", "Vuna/Compiler/Native/Module.vuna:237"));
  ("Native_dModule.v_clearSlotsInstrs", ("Vuna.Compiler.Native.Module.clearSlotsInstrs", "Vuna/Compiler/Native/Module.vuna:293"));
  ("Native_dModule.v_clearsAt", ("Vuna.Compiler.Native.Module.clearsAt", "Vuna/Compiler/Native/Module.vuna:222"));
  ("Native_dModule.v_closureArgLoad", ("Vuna.Compiler.Native.Module.closureArgLoad", "Vuna/Compiler/Native/Module.vuna:488"));
  ("Native_dModule.v_closureArgRegs", ("Vuna.Compiler.Native.Module.closureArgRegs", "Vuna/Compiler/Native/Module.vuna:947"));
  ("Native_dModule.v_closureCallSlotsInstrs", ("Vuna.Compiler.Native.Module.closureCallSlotsInstrs", "Vuna/Compiler/Native/Module.vuna:544"));
  ("Native_dModule.v_closureTailCallSlotsInstrs", ("Vuna.Compiler.Native.Module.closureTailCallSlotsInstrs", "Vuna/Compiler/Native/Module.vuna:557"));
  ("Native_dModule.v_ctorArityIn", ("Vuna.Compiler.Native.Module.ctorArityIn", "Vuna/Compiler/Native/Module.vuna:1085"));
  ("Native_dModule.v_ctorTagGo", ("Vuna.Compiler.Native.Module.ctorTagGo", "Vuna/Compiler/Native/Module.vuna:1081"));
  ("Native_dModule.v_ctorTagIn", ("Vuna.Compiler.Native.Module.ctorTagIn", "Vuna/Compiler/Native/Module.vuna:1078"));
  ("Native_dModule.v_declName", ("Vuna.Compiler.Native.Module.declName", "Vuna/Compiler/Native/Module.vuna:1073"));
  ("Native_dModule.v_declOf", ("Vuna.Compiler.Native.Module.declOf", "Vuna/Compiler/Native/Module.vuna:1069"));
  ("Native_dModule.v_dedupeClosures", ("Vuna.Compiler.Native.Module.dedupeClosures", "Vuna/Compiler/Native/Module.vuna:1569"));
  ("Native_dModule.v_dedupeFuncs", ("Vuna.Compiler.Native.Module.dedupeFuncs", "Vuna/Compiler/Native/Module.vuna:1564"));
  ("Native_dModule.v_delInt", ("Vuna.Compiler.Native.Module.delInt", "Vuna/Compiler/Native/Module.vuna:262"));
  ("Native_dModule.v_dropLast", ("Vuna.Compiler.Native.Module.dropLast", "Vuna/Compiler/Native/Module.vuna:68"));
  ("Native_dModule.v_effArgBinders", ("Vuna.Compiler.Native.Module.effArgBinders", "Vuna/Compiler/Native/Module.vuna:764"));
  ("Native_dModule.v_effUnitBinder", ("Vuna.Compiler.Native.Module.effUnitBinder", "Vuna/Compiler/Native/Module.vuna:761"));
  ("Native_dModule.v_emitClears", ("Vuna.Compiler.Native.Module.emitClears", "Vuna/Compiler/Native/Module.vuna:230"));
  ("Native_dModule.v_entryShowKind", ("Vuna.Compiler.Native.Module.entryShowKind", "Vuna/Compiler/Native/Module.vuna:1577"));
  ("Native_dModule.v_findCatchAll", ("Vuna.Compiler.Native.Module.findCatchAll", "Vuna/Compiler/Native/Module.vuna:1285"));
  ("Native_dModule.v_findDef", ("Vuna.Compiler.Native.Module.findDef", "Vuna/Compiler/Native/Module.vuna:299"));
  ("Native_dModule.v_floatDigitsGo", ("Vuna.Compiler.Native.Module.floatDigitsGo", "Vuna/Compiler/Native/Module.vuna:728"));
  ("Native_dModule.v_floatDigitsOf", ("Vuna.Compiler.Native.Module.floatDigitsOf", "Vuna/Compiler/Native/Module.vuna:725"));
  ("Native_dModule.v_floatPow10", ("Vuna.Compiler.Native.Module.floatPow10", "Vuna/Compiler/Native/Module.vuna:733"));
  ("Native_dModule.v_floatRenderName", ("Vuna.Compiler.Native.Module.floatRenderName", "Vuna/Compiler/Native/Module.vuna:717"));
  ("Native_dModule.v_freshLabel", ("Vuna.Compiler.Native.Module.freshLabel", "Vuna/Compiler/Native/Module.vuna:108"));
  ("Native_dModule.v_freshSlot", ("Vuna.Compiler.Native.Module.freshSlot", "Vuna/Compiler/Native/Module.vuna:101"));
  ("Native_dModule.v_genAlloc", ("Vuna.Compiler.Native.Module.genAlloc", "Vuna/Compiler/Native/Module.vuna:1055"));
  ("Native_dModule.v_genApp", ("Vuna.Compiler.Native.Module.genApp", "Vuna/Compiler/Native/Module.vuna:910"));
  ("Native_dModule.v_genApplyCall", ("Vuna.Compiler.Native.Module.genApplyCall", "Vuna/Compiler/Native/Module.vuna:568"));
  ("Native_dModule.v_genApplyHead", ("Vuna.Compiler.Native.Module.genApplyHead", "Vuna/Compiler/Native/Module.vuna:592"));
  ("Native_dModule.v_genArgs", ("Vuna.Compiler.Native.Module.genArgs", "Vuna/Compiler/Native/Module.vuna:371"));
  ("Native_dModule.v_genArm", ("Vuna.Compiler.Native.Module.genArm", "Vuna/Compiler/Native/Module.vuna:1304"));
  ("Native_dModule.v_genBoolChain", ("Vuna.Compiler.Native.Module.genBoolChain", "Vuna/Compiler/Native/Module.vuna:877"));
  ("Native_dModule.v_genCase", ("Vuna.Compiler.Native.Module.genCase", "Vuna/Compiler/Native/Module.vuna:1247"));
  ("Native_dModule.v_genCaseAlts", ("Vuna.Compiler.Native.Module.genCaseAlts", "Vuna/Compiler/Native/Module.vuna:1260"));
  ("Native_dModule.v_genConcatMany", ("Vuna.Compiler.Native.Module.genConcatMany", "Vuna/Compiler/Native/Module.vuna:683"));
  ("Native_dModule.v_genConcatRest", ("Vuna.Compiler.Native.Module.genConcatRest", "Vuna/Compiler/Native/Module.vuna:702"));
  ("Native_dModule.v_genCtor", ("Vuna.Compiler.Native.Module.genCtor", "Vuna/Compiler/Native/Module.vuna:1115"));
  ("Native_dModule.v_genCtorFinish", ("Vuna.Compiler.Native.Module.genCtorFinish", "Vuna/Compiler/Native/Module.vuna:1138"));
  ("Native_dModule.v_genCtorGo", ("Vuna.Compiler.Native.Module.genCtorGo", "Vuna/Compiler/Native/Module.vuna:1125"));
  ("Native_dModule.v_genDefFunc", ("Vuna.Compiler.Native.Module.genDefFunc", "Vuna/Compiler/Native/Module.vuna:1490"));
  ("Native_dModule.v_genDefault", ("Vuna.Compiler.Native.Module.genDefault", "Vuna/Compiler/Native/Module.vuna:1295"));
  ("Native_dModule.v_genDefs", ("Vuna.Compiler.Native.Module.genDefs", "Vuna/Compiler/Native/Module.vuna:1548"));
  ("Native_dModule.v_genEffThunk", ("Vuna.Compiler.Native.Module.genEffThunk", "Vuna/Compiler/Native/Module.vuna:774"));
  ("Native_dModule.v_genExpr", ("Vuna.Compiler.Native.Module.genExpr", "Vuna/Compiler/Native/Module.vuna:792"));
  ("Native_dModule.v_genExprAt", ("Vuna.Compiler.Native.Module.genExprAt", "Vuna/Compiler/Native/Module.vuna:798"));
  ("Native_dModule.v_genFloatLit", ("Vuna.Compiler.Native.Module.genFloatLit", "Vuna/Compiler/Native/Module.vuna:736"));
  ("Native_dModule.v_genGlobalCall", ("Vuna.Compiler.Native.Module.genGlobalCall", "Vuna/Compiler/Native/Module.vuna:627"));
  ("Native_dModule.v_genLamApp", ("Vuna.Compiler.Native.Module.genLamApp", "Vuna/Compiler/Native/Module.vuna:896"));
  ("Native_dModule.v_genLamValue", ("Vuna.Compiler.Native.Module.genLamValue", "Vuna/Compiler/Native/Module.vuna:976"));
  ("Native_dModule.v_genNatArm", ("Vuna.Compiler.Native.Module.genNatArm", "Vuna/Compiler/Native/Module.vuna:1381"));
  ("Native_dModule.v_genNatCase", ("Vuna.Compiler.Native.Module.genNatCase", "Vuna/Compiler/Native/Module.vuna:1408"));
  ("Native_dModule.v_genNatSuccCall", ("Vuna.Compiler.Native.Module.genNatSuccCall", "Vuna/Compiler/Native/Module.vuna:639"));
  ("Native_dModule.v_genProj", ("Vuna.Compiler.Native.Module.genProj", "Vuna/Compiler/Native/Module.vuna:1171"));
  ("Native_dModule.v_genProjFinish", ("Vuna.Compiler.Native.Module.genProjFinish", "Vuna/Compiler/Native/Module.vuna:1184"));
  ("Native_dModule.v_genRecUpd", ("Vuna.Compiler.Native.Module.genRecUpd", "Vuna/Compiler/Native/Module.vuna:1193"));
  ("Native_dModule.v_genRecUpdStart", ("Vuna.Compiler.Native.Module.genRecUpdStart", "Vuna/Compiler/Native/Module.vuna:1203"));
  ("Native_dModule.v_genRecord", ("Vuna.Compiler.Native.Module.genRecord", "Vuna/Compiler/Native/Module.vuna:1151"));
  ("Native_dModule.v_genRecordAlts", ("Vuna.Compiler.Native.Module.genRecordAlts", "Vuna/Compiler/Native/Module.vuna:1369"));
  ("Native_dModule.v_genRecordFinish", ("Vuna.Compiler.Native.Module.genRecordFinish", "Vuna/Compiler/Native/Module.vuna:1161"));
  ("Native_dModule.v_genRtApp", ("Vuna.Compiler.Native.Module.genRtApp", "Vuna/Compiler/Native/Module.vuna:650"));
  ("Native_dModule.v_genRtValueCall", ("Vuna.Compiler.Native.Module.genRtValueCall", "Vuna/Compiler/Native/Module.vuna:665"));
  ("Native_dModule.v_genSaturatedCall", ("Vuna.Compiler.Native.Module.genSaturatedCall", "Vuna/Compiler/Native/Module.vuna:397"));
  ("Native_dModule.v_genSelfTailCall", ("Vuna.Compiler.Native.Module.genSelfTailCall", "Vuna/Compiler/Native/Module.vuna:615"));
  ("Native_dModule.v_genTailCall", ("Vuna.Compiler.Native.Module.genTailCall", "Vuna/Compiler/Native/Module.vuna:411"));
  ("Native_dModule.v_genUpdFields", ("Vuna.Compiler.Native.Module.genUpdFields", "Vuna/Compiler/Native/Module.vuna:1215"));
  ("Native_dModule.v_genValueClosure", ("Vuna.Compiler.Native.Module.genValueClosure", "Vuna/Compiler/Native/Module.vuna:521"));
  ("Native_dModule.v_genVariantAlts", ("Vuna.Compiler.Native.Module.genVariantAlts", "Vuna/Compiler/Native/Module.vuna:1324"));
  ("Native_dModule.v_genVariantAltsGo", ("Vuna.Compiler.Native.Module.genVariantAltsGo", "Vuna/Compiler/Native/Module.vuna:1327"));
  ("Native_dModule.v_genVariantArm", ("Vuna.Compiler.Native.Module.genVariantArm", "Vuna/Compiler/Native/Module.vuna:1349"));
  ("Native_dModule.v_getArgsFn", ("Vuna.Compiler.Native.Module.getArgsFn", "Vuna/Compiler/Native/Module.vuna:1712"));
  ("Native_dModule.v_getLocal", ("Vuna.Compiler.Native.Module.getLocal", "Vuna/Compiler/Native/Module.vuna:1034"));
  ("Native_dModule.v_getObjField", ("Vuna.Compiler.Native.Module.getObjField", "Vuna/Compiler/Native/Module.vuna:1050"));
  ("Native_dModule.v_hasFuncLabel", ("Vuna.Compiler.Native.Module.hasFuncLabel", "Vuna/Compiler/Native/Module.vuna:483"));
  ("Native_dModule.v_hasNatBranch", ("Vuna.Compiler.Native.Module.hasNatBranch", "Vuna/Compiler/Native/Module.vuna:1403"));
  ("Native_dModule.v_hasNativeClosure", ("Vuna.Compiler.Native.Module.hasNativeClosure", "Vuna/Compiler/Native/Module.vuna:514"));
  ("Native_dModule.v_insertSortedFn", ("Vuna.Compiler.Native.Module.insertSortedFn", "Vuna/Compiler/Native/Module.vuna:1726"));
  ("Native_dModule.v_instrSlotReads", ("Vuna.Compiler.Native.Module.instrSlotReads", "Vuna/Compiler/Native/Module.vuna:168"));
  ("Native_dModule.v_internal", ("Vuna.Compiler.Native.Module.internal", "Vuna/Compiler/Native/Module.vuna:53"));
  ("Native_dModule.v_isCallInstr", ("Vuna.Compiler.Native.Module.isCallInstr", "Vuna/Compiler/Native/Module.vuna:245"));
  ("Native_dModule.v_isErasedBinder", ("Vuna.Compiler.Native.Module.isErasedBinder", "Vuna/Compiler/Native/Module.vuna:145"));
  ("Native_dModule.v_labelCountOf", ("Vuna.Compiler.Native.Module.labelCountOf", "Vuna/Compiler/Native/Module.vuna:1539"));
  ("Native_dModule.v_lastCallGo", ("Vuna.Compiler.Native.Module.lastCallGo", "Vuna/Compiler/Native/Module.vuna:254"));
  ("Native_dModule.v_lastCallIndex", ("Vuna.Compiler.Native.Module.lastCallIndex", "Vuna/Compiler/Native/Module.vuna:251"));
  ("Native_dModule.v_listHasStr", ("Vuna.Compiler.Native.Module.listHasStr", "Vuna/Compiler/Native/Module.vuna:712"));
  ("Native_dModule.v_listLengthI", ("Vuna.Compiler.Native.Module.listLengthI", "Vuna/Compiler/Native/Module.vuna:1027"));
  ("Native_dModule.v_loadArgRegs", ("Vuna.Compiler.Native.Module.loadArgRegs", "Vuna/Compiler/Native/Module.vuna:356"));
  ("Native_dModule.v_loadReg", ("Vuna.Compiler.Native.Module.loadReg", "Vuna/Compiler/Native/Module.vuna:121"));
  ("Native_dModule.v_loadSlot", ("Vuna.Compiler.Native.Module.loadSlot", "Vuna/Compiler/Native/Module.vuna:118"));
  ("Native_dModule.v_lookupBinder", ("Vuna.Compiler.Native.Module.lookupBinder", "Vuna/Compiler/Native/Module.vuna:137"));
  ("Native_dModule.v_lookupFieldIr", ("Vuna.Compiler.Native.Module.lookupFieldIr", "Vuna/Compiler/Native/Module.vuna:1238"));
  ("Native_dModule.v_mapRetToLocal", ("Vuna.Compiler.Native.Module.mapRetToLocal", "Vuna/Compiler/Native/Module.vuna:1693"));
  ("Native_dModule.v_maxArityIn", ("Vuna.Compiler.Native.Module.maxArityIn", "Vuna/Compiler/Native/Module.vuna:1090"));
  ("Native_dModule.v_memInt", ("Vuna.Compiler.Native.Module.memInt", "Vuna/Compiler/Native/Module.vuna:258"));
  ("Native_dModule.v_memStr", ("Vuna.Compiler.Native.Module.memStr", "Vuna/Compiler/Native/Module.vuna:303"));
  ("Native_dModule.v_moduleKeyOf", ("Vuna.Compiler.Native.Module.moduleKeyOf", "Vuna/Compiler/Native/Module.vuna:321"));
  ("Native_dModule.v_modulePathOf", ("Vuna.Compiler.Native.Module.modulePathOf", "Vuna/Compiler/Native/Module.vuna:60"));
  ("Native_dModule.v_modulePoolOf", ("Vuna.Compiler.Native.Module.modulePoolOf", "Vuna/Compiler/Native/Module.vuna:341"));
  ("Native_dModule.v_modulePools", ("Vuna.Compiler.Native.Module.modulePools", "Vuna/Compiler/Native/Module.vuna:326"));
  ("Native_dModule.v_nativeArityOf", ("Vuna.Compiler.Native.Module.nativeArityOf", "Vuna/Compiler/Native/Module.vuna:768"));
  ("Native_dModule.v_nativeBridgeFuncs", ("Vuna.Compiler.Native.Module.nativeBridgeFuncs", "Vuna/Compiler/Native/Module.vuna:1887"));
  ("Native_dModule.v_nativeFuelOfBody", ("Vuna.Compiler.Native.Module.nativeFuelOfBody", "Vuna/Compiler/Native/Module.vuna:788"));
  ("Native_dModule.v_nativeFuncLabelOf", ("Vuna.Compiler.Native.Module.nativeFuncLabelOf", "Vuna/Compiler/Native/Module.vuna:480"));
  ("Native_dModule.v_nativeStaticClosureLabel", ("Vuna.Compiler.Native.Module.nativeStaticClosureLabel", "Vuna/Compiler/Native/Module.vuna:511"));
  ("Native_dModule.v_nbind", ("Vuna.Compiler.Native.Module.nbind", "Vuna/Compiler/Native/Module.vuna:46"));
  ("Native_dModule.v_nlistCellBytes", ("Vuna.Compiler.Native.Module.nlistCellBytes", "Vuna/Compiler/Native/Module.vuna:1708"));
  ("Native_dModule.v_nlistDescOf", ("Vuna.Compiler.Native.Module.nlistDescOf", "Vuna/Compiler/Native/Module.vuna:1669"));
  ("Native_dModule.v_padObjZero", ("Vuna.Compiler.Native.Module.padObjZero", "Vuna/Compiler/Native/Module.vuna:1111"));
  ("Native_dModule.v_poolItems", ("Vuna.Compiler.Native.Module.poolItems", "Vuna/Compiler/Native/Module.vuna:349"));
  ("Native_dModule.v_poolLabelOf", ("Vuna.Compiler.Native.Module.poolLabelOf", "Vuna/Compiler/Native/Module.vuna:345"));
  ("Native_dModule.v_poolOfDefs", ("Vuna.Compiler.Native.Module.poolOfDefs", "Vuna/Compiler/Native/Module.vuna:317"));
  ("Native_dModule.v_pruneClears", ("Vuna.Compiler.Native.Module.pruneClears", "Vuna/Compiler/Native/Module.vuna:269"));
  ("Native_dModule.v_pruneGo", ("Vuna.Compiler.Native.Module.pruneGo", "Vuna/Compiler/Native/Module.vuna:272"));
  ("Native_dModule.v_pushBinder", ("Vuna.Compiler.Native.Module.pushBinder", "Vuna/Compiler/Native/Module.vuna:142"));
  ("Native_dModule.v_pushOne", ("Vuna.Compiler.Native.Module.pushOne", "Vuna/Compiler/Native/Module.vuna:445"));
  ("Native_dModule.v_pushStackArgs", ("Vuna.Compiler.Native.Module.pushStackArgs", "Vuna/Compiler/Native/Module.vuna:437"));
  ("Native_dModule.v_putLabelCount", ("Vuna.Compiler.Native.Module.putLabelCount", "Vuna/Compiler/Native/Module.vuna:1543"));
  ("Native_dModule.v_putPool", ("Vuna.Compiler.Native.Module.putPool", "Vuna/Compiler/Native/Module.vuna:336"));
  ("Native_dModule.v_recordPosGo", ("Vuna.Compiler.Native.Module.recordPosGo", "Vuna/Compiler/Native/Module.vuna:1101"));
  ("Native_dModule.v_recordPosOf", ("Vuna.Compiler.Native.Module.recordPosOf", "Vuna/Compiler/Native/Module.vuna:1098"));
  ("Native_dModule.v_recordReads", ("Vuna.Compiler.Native.Module.recordReads", "Vuna/Compiler/Native/Module.vuna:213"));
  ("Native_dModule.v_restoreBinderScope", ("Vuna.Compiler.Native.Module.restoreBinderScope", "Vuna/Compiler/Native/Module.vuna:149"));
  ("Native_dModule.v_rtValueArityOf", ("Vuna.Compiler.Native.Module.rtValueArityOf", "Vuna/Compiler/Native/Module.vuna:539"));
  ("Native_dModule.v_runtimeBinders", ("Vuna.Compiler.Native.Module.runtimeBinders", "Vuna/Compiler/Native/Module.vuna:152"));
  ("Native_dModule.v_selfSlotMoves", ("Vuna.Compiler.Native.Module.selfSlotMoves", "Vuna/Compiler/Native/Module.vuna:607"));
  ("Native_dModule.v_setLocal", ("Vuna.Compiler.Native.Module.setLocal", "Vuna/Compiler/Native/Module.vuna:1031"));
  ("Native_dModule.v_setObjFromSlot", ("Vuna.Compiler.Native.Module.setObjFromSlot", "Vuna/Compiler/Native/Module.vuna:1038"));
  ("Native_dModule.v_setObjImm", ("Vuna.Compiler.Native.Module.setObjImm", "Vuna/Compiler/Native/Module.vuna:1046"));
  ("Native_dModule.v_slotReadOff", ("Vuna.Compiler.Native.Module.slotReadOff", "Vuna/Compiler/Native/Module.vuna:160"));
  ("Native_dModule.v_slotUsePut", ("Vuna.Compiler.Native.Module.slotUsePut", "Vuna/Compiler/Native/Module.vuna:208"));
  ("Native_dModule.v_slotWriteOf", ("Vuna.Compiler.Native.Module.slotWriteOf", "Vuna/Compiler/Native/Module.vuna:241"));
  ("Native_dModule.v_slotsOfBinders", ("Vuna.Compiler.Native.Module.slotsOfBinders", "Vuna/Compiler/Native/Module.vuna:1464"));
  ("Native_dModule.v_sortListFn", ("Vuna.Compiler.Native.Module.sortListFn", "Vuna/Compiler/Native/Module.vuna:1734"));
  ("Native_dModule.v_spawnSelfFn", ("Vuna.Compiler.Native.Module.spawnSelfFn", "Vuna/Compiler/Native/Module.vuna:1761"));
  ("Native_dModule.v_startFunc", ("Vuna.Compiler.Native.Module.startFunc", "Vuna/Compiler/Native/Module.vuna:1588"));
  ("Native_dModule.v_storeCapsAt", ("Vuna.Compiler.Native.Module.storeCapsAt", "Vuna/Compiler/Native/Module.vuna:970"));
  ("Native_dModule.v_storeCloArity", ("Vuna.Compiler.Native.Module.storeCloArity", "Vuna/Compiler/Native/Module.vuna:966"));
  ("Native_dModule.v_storeCloCode", ("Vuna.Compiler.Native.Module.storeCloCode", "Vuna/Compiler/Native/Module.vuna:962"));
  ("Native_dModule.v_storeSlot", ("Vuna.Compiler.Native.Module.storeSlot", "Vuna/Compiler/Native/Module.vuna:115"));
  ("Native_dModule.v_storeSlotFields", ("Vuna.Compiler.Native.Module.storeSlotFields", "Vuna/Compiler/Native/Module.vuna:1106"));
  ("Native_dModule.v_strArgAtFn", ("Vuna.Compiler.Native.Module.strArgAtFn", "Vuna/Compiler/Native/Module.vuna:1853"));
  ("Native_dModule.v_strConcatManyFn", ("Vuna.Compiler.Native.Module.strConcatManyFn", "Vuna/Compiler/Native/Module.vuna:1807"));
  ("Native_dModule.v_strPackFn", ("Vuna.Compiler.Native.Module.strPackFn", "Vuna/Compiler/Native/Module.vuna:1793"));
  ("Native_dModule.v_strSubstTemplateFn", ("Vuna.Compiler.Native.Module.strSubstTemplateFn", "Vuna/Compiler/Native/Module.vuna:1866"));
  ("Native_dModule.v_strUnpackFn", ("Vuna.Compiler.Native.Module.strUnpackFn", "Vuna/Compiler/Native/Module.vuna:1779"));
  ("Native_dModule.v_tagOfScrut", ("Vuna.Compiler.Native.Module.tagOfScrut", "Vuna/Compiler/Native/Module.vuna:1318"));
  ("Native_dModule.v_tailCallFits", ("Vuna.Compiler.Native.Module.tailCallFits", "Vuna/Compiler/Native/Module.vuna:453"));
  ("Native_dModule.v_tailCallSlotsInstrs", ("Vuna.Compiler.Native.Module.tailCallSlotsInstrs", "Vuna/Compiler/Native/Module.vuna:468"));
  ("Native_dModule.v_tailStackArgMoves", ("Vuna.Compiler.Native.Module.tailStackArgMoves", "Vuna/Compiler/Native/Module.vuna:458"));
  ("Native_dModule.v_trapImpossible", ("Vuna.Compiler.Native.Module.trapImpossible", "Vuna/Compiler/Native/Module.vuna:1292"));
  ("Native_dModule.v_tryReadDirFn", ("Vuna.Compiler.Native.Module.tryReadDirFn", "Vuna/Compiler/Native/Module.vuna:1769"));
  ("Native_dModule.v_tryRunInFn", ("Vuna.Compiler.Native.Module.tryRunInFn", "Vuna/Compiler/Native/Module.vuna:1753"));
  ("Native_dModule.v_unsupported", ("Vuna.Compiler.Native.Module.unsupported", "Vuna/Compiler/Native/Module.vuna:50"));
  ("Native_dModule.v_valueWrapperFunc", ("Vuna.Compiler.Native.Module.valueWrapperFunc", "Vuna/Compiler/Native/Module.vuna:496"));
  ("Native_dRender.v_asmEscapeChar", ("Vuna.Compiler.Native.Render.asmEscapeChar", "Vuna/Compiler/Native/Render.vuna:128"));
  ("Native_dRender.v_asmString", ("Vuna.Compiler.Native.Render.asmString", "Vuna/Compiler/Native/Render.vuna:141"));
  ("Native_dRender.v_fileOfKey", ("Vuna.Compiler.Native.Render.fileOfKey", "Vuna/Compiler/Native/Render.vuna:207"));
  ("Native_dRender.v_funcsOfKey", ("Vuna.Compiler.Native.Render.funcsOfKey", "Vuna/Compiler/Native/Render.vuna:199"));
  ("Native_dRender.v_indent", ("Vuna.Compiler.Native.Render.indent", "Vuna/Compiler/Native/Render.vuna:25"));
  ("Native_dRender.v_isEmpty", ("Vuna.Compiler.Native.Render.isEmpty", "Vuna/Compiler/Native/Render.vuna:181"));
  ("Native_dRender.v_isMemOperand", ("Vuna.Compiler.Native.Render.isMemOperand", "Vuna/Compiler/Native/Render.vuna:53"));
  ("Native_dRender.v_isShiftOp", ("Vuna.Compiler.Native.Render.isShiftOp", "Vuna/Compiler/Native/Render.vuna:65"));
  ("Native_dRender.v_litsOfKey", ("Vuna.Compiler.Native.Render.litsOfKey", "Vuna/Compiler/Native/Render.vuna:202"));
  ("Native_dRender.v_memString", ("Vuna.Compiler.Native.Render.memString", "Vuna/Compiler/Native/Render.vuna:185"));
  ("Native_dRender.v_memText", ("Vuna.Compiler.Native.Render.memText", "Vuna/Compiler/Native/Render.vuna:28"));
  ("Native_dRender.v_memXText", ("Vuna.Compiler.Native.Render.memXText", "Vuna/Compiler/Native/Render.vuna:37"));
  ("Native_dRender.v_moduleKeyOfFunc", ("Vuna.Compiler.Native.Render.moduleKeyOfFunc", "Vuna/Compiler/Native/Render.vuna:189"));
  ("Native_dRender.v_moduleKeysOf", ("Vuna.Compiler.Native.Render.moduleKeysOf", "Vuna/Compiler/Native/Render.vuna:196"));
  ("Native_dRender.v_padOct", ("Vuna.Compiler.Native.Render.padOct", "Vuna/Compiler/Native/Render.vuna:133"));
  ("Native_dRender.v_pushModuleKey", ("Vuna.Compiler.Native.Render.pushModuleKey", "Vuna/Compiler/Native/Render.vuna:192"));
  ("Native_dRender.v_renderBinReg", ("Vuna.Compiler.Native.Render.renderBinReg", "Vuna/Compiler/Native/Render.vuna:68"));
  ("Native_dRender.v_renderBss", ("Vuna.Compiler.Native.Render.renderBss", "Vuna/Compiler/Native/Render.vuna:156"));
  ("Native_dRender.v_renderByteOp", ("Vuna.Compiler.Native.Render.renderByteOp", "Vuna/Compiler/Native/Render.vuna:76"));
  ("Native_dRender.v_renderClosure", ("Vuna.Compiler.Native.Render.renderClosure", "Vuna/Compiler/Native/Render.vuna:163"));
  ("Native_dRender.v_renderFiles", ("Vuna.Compiler.Native.Render.renderFiles", "Vuna/Compiler/Native/Render.vuna:228"));
  ("Native_dRender.v_renderFunc", ("Vuna.Compiler.Native.Render.renderFunc", "Vuna/Compiler/Native/Render.vuna:173"));
  ("Native_dRender.v_renderInstr", ("Vuna.Compiler.Native.Render.renderInstr", "Vuna/Compiler/Native/Render.vuna:79"));
  ("Native_dRender.v_renderMov", ("Vuna.Compiler.Native.Render.renderMov", "Vuna/Compiler/Native/Render.vuna:58"));
  ("Native_dRender.v_renderOperand", ("Vuna.Compiler.Native.Render.renderOperand", "Vuna/Compiler/Native/Render.vuna:46"));
  ("Native_dRender.v_renderProgramFile", ("Vuna.Compiler.Native.Render.renderProgramFile", "Vuna/Compiler/Native/Render.vuna:210"));
  ("Native_dRender.v_renderRodata", ("Vuna.Compiler.Native.Render.renderRodata", "Vuna/Compiler/Native/Render.vuna:144"));
  ("Native_dRender.v_renderStrLit", ("Vuna.Compiler.Native.Render.renderStrLit", "Vuna/Compiler/Native/Render.vuna:148"));
  ("Native_dRuntime.v_allocClassInstrs", ("Vuna.Compiler.Native.Runtime.allocClassInstrs", "Vuna/Compiler/Native/Runtime.vuna:663"));
  ("Native_dRuntime.v_allocFn", ("Vuna.Compiler.Native.Runtime.allocFn", "Vuna/Compiler/Native/Runtime.vuna:685"));
  ("Native_dRuntime.v_allocLeafFn", ("Vuna.Compiler.Native.Runtime.allocLeafFn", "Vuna/Compiler/Native/Runtime.vuna:692"));
  ("Native_dRuntime.v_allocPinnedFn", ("Vuna.Compiler.Native.Runtime.allocPinnedFn", "Vuna/Compiler/Native/Runtime.vuna:699"));
  ("Native_dRuntime.v_applyExactFn", ("Vuna.Compiler.Native.Runtime.applyExactFn", "Vuna/Compiler/Native/Runtime.vuna:838"));
  ("Native_dRuntime.v_applyFn", ("Vuna.Compiler.Native.Runtime.applyFn", "Vuna/Compiler/Native/Runtime.vuna:830"));
  ("Native_dRuntime.v_applyShimFn", ("Vuna.Compiler.Native.Runtime.applyShimFn", "Vuna/Compiler/Native/Runtime.vuna:848"));
  ("Native_dRuntime.v_argcLabel", ("Vuna.Compiler.Native.Runtime.argcLabel", "Vuna/Compiler/Native/Runtime.vuna:145"));
  ("Native_dRuntime.v_argvLabel", ("Vuna.Compiler.Native.Runtime.argvLabel", "Vuna/Compiler/Native/Runtime.vuna:148"));
  ("Native_dRuntime.v_arrayEmptyFn", ("Vuna.Compiler.Native.Runtime.arrayEmptyFn", "Vuna/Compiler/Native/Runtime.vuna:600"));
  ("Native_dRuntime.v_arrayGetFn", ("Vuna.Compiler.Native.Runtime.arrayGetFn", "Vuna/Compiler/Native/Runtime.vuna:611"));
  ("Native_dRuntime.v_arrayLengthFn", ("Vuna.Compiler.Native.Runtime.arrayLengthFn", "Vuna/Compiler/Native/Runtime.vuna:607"));
  ("Native_dRuntime.v_arrayMakeFn", ("Vuna.Compiler.Native.Runtime.arrayMakeFn", "Vuna/Compiler/Native/Runtime.vuna:627"));
  ("Native_dRuntime.v_arrayOobMessage", ("Vuna.Compiler.Native.Runtime.arrayOobMessage", "Vuna/Compiler/Native/Runtime.vuna:127"));
  ("Native_dRuntime.v_arraySetFn", ("Vuna.Compiler.Native.Runtime.arraySetFn", "Vuna/Compiler/Native/Runtime.vuna:619"));
  ("Native_dRuntime.v_assertFn", ("Vuna.Compiler.Native.Runtime.assertFn", "Vuna/Compiler/Native/Runtime.vuna:806"));
  ("Native_dRuntime.v_assertPrefix", ("Vuna.Compiler.Native.Runtime.assertPrefix", "Vuna/Compiler/Native/Runtime.vuna:116"));
  ("Native_dRuntime.v_bitNotFn", ("Vuna.Compiler.Native.Runtime.bitNotFn", "Vuna/Compiler/Native/Runtime.vuna:235"));
  ("Native_dRuntime.v_bitShlFn", ("Vuna.Compiler.Native.Runtime.bitShlFn", "Vuna/Compiler/Native/Runtime.vuna:243"));
  ("Native_dRuntime.v_bitShrFn", ("Vuna.Compiler.Native.Runtime.bitShrFn", "Vuna/Compiler/Native/Runtime.vuna:252"));
  ("Native_dRuntime.v_cStrCpyFn", ("Vuna.Compiler.Native.Runtime.cStrCpyFn", "Vuna/Compiler/Native/Runtime.vuna:1002"));
  ("Native_dRuntime.v_cgBufLabel", ("Vuna.Compiler.Native.Runtime.cgBufLabel", "Vuna/Compiler/Native/Runtime.vuna:105"));
  ("Native_dRuntime.v_cgroupCpuMaxPath", ("Vuna.Compiler.Native.Runtime.cgroupCpuMaxPath", "Vuna/Compiler/Native/Runtime.vuna:78"));
  ("Native_dRuntime.v_cgroupCpusFn", ("Vuna.Compiler.Native.Runtime.cgroupCpusFn", "Vuna/Compiler/Native/Runtime.vuna:1240"));
  ("Native_dRuntime.v_cleanupHeadLabel", ("Vuna.Compiler.Native.Runtime.cleanupHeadLabel", "Vuna/Compiler/Native/Runtime.vuna:171"));
  ("Native_dRuntime.v_cleanupPopFn", ("Vuna.Compiler.Native.Runtime.cleanupPopFn", "Vuna/Compiler/Native/Runtime.vuna:954"));
  ("Native_dRuntime.v_cleanupPushFn", ("Vuna.Compiler.Native.Runtime.cleanupPushFn", "Vuna/Compiler/Native/Runtime.vuna:946"));
  ("Native_dRuntime.v_cmdBufLabel", ("Vuna.Compiler.Native.Runtime.cmdBufLabel", "Vuna/Compiler/Native/Runtime.vuna:192"));
  ("Native_dRuntime.v_cmdRunShFn", ("Vuna.Compiler.Native.Runtime.cmdRunShFn", "Vuna/Compiler/Native/Runtime.vuna:1174"));
  ("Native_dRuntime.v_cpuCountLabel", ("Vuna.Compiler.Native.Runtime.cpuCountLabel", "Vuna/Compiler/Native/Runtime.vuna:86"));
  ("Native_dRuntime.v_cpuCurLabel", ("Vuna.Compiler.Native.Runtime.cpuCurLabel", "Vuna/Compiler/Native/Runtime.vuna:98"));
  ("Native_dRuntime.v_cpuNewLabel", ("Vuna.Compiler.Native.Runtime.cpuNewLabel", "Vuna/Compiler/Native/Runtime.vuna:101"));
  ("Native_dRuntime.v_cpusKey", ("Vuna.Compiler.Native.Runtime.cpusKey", "Vuna/Compiler/Native/Runtime.vuna:68"));
  ("Native_dRuntime.v_cwdBufLabel", ("Vuna.Compiler.Native.Runtime.cwdBufLabel", "Vuna/Compiler/Native/Runtime.vuna:195"));
  ("Native_dRuntime.v_debugLineFn", ("Vuna.Compiler.Native.Runtime.debugLineFn", "Vuna/Compiler/Native/Runtime.vuna:297"));
  ("Native_dRuntime.v_debugOnFn", ("Vuna.Compiler.Native.Runtime.debugOnFn", "Vuna/Compiler/Native/Runtime.vuna:294"));
  ("Native_dRuntime.v_dirBufLabel", ("Vuna.Compiler.Native.Runtime.dirBufLabel", "Vuna/Compiler/Native/Runtime.vuna:184"));
  ("Native_dRuntime.v_dirCloseFn", ("Vuna.Compiler.Native.Runtime.dirCloseFn", "Vuna/Compiler/Native/Runtime.vuna:1166"));
  ("Native_dRuntime.v_dirNamesFn", ("Vuna.Compiler.Native.Runtime.dirNamesFn", "Vuna/Compiler/Native/Runtime.vuna:1158"));
  ("Native_dRuntime.v_dirNamesLabel", ("Vuna.Compiler.Native.Runtime.dirNamesLabel", "Vuna/Compiler/Native/Runtime.vuna:187"));
  ("Native_dRuntime.v_dirOpenFn", ("Vuna.Compiler.Native.Runtime.dirOpenFn", "Vuna/Compiler/Native/Runtime.vuna:1149"));
  ("Native_dRuntime.v_divFn", ("Vuna.Compiler.Native.Runtime.divFn", "Vuna/Compiler/Native/Runtime.vuna:304"));
  ("Native_dRuntime.v_divZeroMessage", ("Vuna.Compiler.Native.Runtime.divZeroMessage", "Vuna/Compiler/Native/Runtime.vuna:42"));
  ("Native_dRuntime.v_effExitFn", ("Vuna.Compiler.Native.Runtime.effExitFn", "Vuna/Compiler/Native/Runtime.vuna:591"));
  ("Native_dRuntime.v_effNewRefFn", ("Vuna.Compiler.Native.Runtime.effNewRefFn", "Vuna/Compiler/Native/Runtime.vuna:556"));
  ("Native_dRuntime.v_effPrintFn", ("Vuna.Compiler.Native.Runtime.effPrintFn", "Vuna/Compiler/Native/Runtime.vuna:571"));
  ("Native_dRuntime.v_effReadRefFn", ("Vuna.Compiler.Native.Runtime.effReadRefFn", "Vuna/Compiler/Native/Runtime.vuna:563"));
  ("Native_dRuntime.v_effWriteRefFn", ("Vuna.Compiler.Native.Runtime.effWriteRefFn", "Vuna/Compiler/Native/Runtime.vuna:566"));
  ("Native_dRuntime.v_effectIdFn", ("Vuna.Compiler.Native.Runtime.effectIdFn", "Vuna/Compiler/Native/Runtime.vuna:444"));
  ("Native_dRuntime.v_envChildLabel", ("Vuna.Compiler.Native.Runtime.envChildLabel", "Vuna/Compiler/Native/Runtime.vuna:109"));
  ("Native_dRuntime.v_envFilterFn", ("Vuna.Compiler.Native.Runtime.envFilterFn", "Vuna/Compiler/Native/Runtime.vuna:1283"));
  ("Native_dRuntime.v_envLookupFn", ("Vuna.Compiler.Native.Runtime.envLookupFn", "Vuna/Compiler/Native/Runtime.vuna:1216"));
  ("Native_dRuntime.v_envpLabel", ("Vuna.Compiler.Native.Runtime.envpLabel", "Vuna/Compiler/Native/Runtime.vuna:151"));
  ("Native_dRuntime.v_eraseFn", ("Vuna.Compiler.Native.Runtime.eraseFn", "Vuna/Compiler/Native/Runtime.vuna:588"));
  ("Native_dRuntime.v_errFinish", ("Vuna.Compiler.Native.Runtime.errFinish", "Vuna/Compiler/Native/Runtime.vuna:766"));
  ("Native_dRuntime.v_errPrefix", ("Vuna.Compiler.Native.Runtime.errPrefix", "Vuna/Compiler/Native/Runtime.vuna:113"));
  ("Native_dRuntime.v_execPathFn", ("Vuna.Compiler.Native.Runtime.execPathFn", "Vuna/Compiler/Native/Runtime.vuna:908"));
  ("Native_dRuntime.v_exitWithFn", ("Vuna.Compiler.Native.Runtime.exitWithFn", "Vuna/Compiler/Native/Runtime.vuna:1198"));
  ("Native_dRuntime.v_fileExistsFn", ("Vuna.Compiler.Native.Runtime.fileExistsFn", "Vuna/Compiler/Native/Runtime.vuna:1034"));
  ("Native_dRuntime.v_fileMtimeFn", ("Vuna.Compiler.Native.Runtime.fileMtimeFn", "Vuna/Compiler/Native/Runtime.vuna:1042"));
  ("Native_dRuntime.v_fileSizeFn", ("Vuna.Compiler.Native.Runtime.fileSizeFn", "Vuna/Compiler/Native/Runtime.vuna:1050"));
  ("Native_dRuntime.v_floatAbsFn", ("Vuna.Compiler.Native.Runtime.floatAbsFn", "Vuna/Compiler/Native/Runtime.vuna:510"));
  ("Native_dRuntime.v_floatBinFn", ("Vuna.Compiler.Native.Runtime.floatBinFn", "Vuna/Compiler/Native/Runtime.vuna:474"));
  ("Native_dRuntime.v_floatBox", ("Vuna.Compiler.Native.Runtime.floatBox", "Vuna/Compiler/Native/Runtime.vuna:464"));
  ("Native_dRuntime.v_floatCmpFn", ("Vuna.Compiler.Native.Runtime.floatCmpFn", "Vuna/Compiler/Native/Runtime.vuna:505"));
  ("Native_dRuntime.v_floatCmpNeq", ("Vuna.Compiler.Native.Runtime.floatCmpNeq", "Vuna/Compiler/Native/Runtime.vuna:494"));
  ("Native_dRuntime.v_floatCmpOrdered", ("Vuna.Compiler.Native.Runtime.floatCmpOrdered", "Vuna/Compiler/Native/Runtime.vuna:482"));
  ("Native_dRuntime.v_floatFromIntFn", ("Vuna.Compiler.Native.Runtime.floatFromIntFn", "Vuna/Compiler/Native/Runtime.vuna:468"));
  ("Native_dRuntime.v_floatSqrtFn", ("Vuna.Compiler.Native.Runtime.floatSqrtFn", "Vuna/Compiler/Native/Runtime.vuna:517"));
  ("Native_dRuntime.v_fsFailFn", ("Vuna.Compiler.Native.Runtime.fsFailFn", "Vuna/Compiler/Native/Runtime.vuna:969"));
  ("Native_dRuntime.v_getcwdFn", ("Vuna.Compiler.Native.Runtime.getcwdFn", "Vuna/Compiler/Native/Runtime.vuna:900"));
  ("Native_dRuntime.v_getenvFn", ("Vuna.Compiler.Native.Runtime.getenvFn", "Vuna/Compiler/Native/Runtime.vuna:892"));
  ("Native_dRuntime.v_hostStatusFn", ("Vuna.Compiler.Native.Runtime.hostStatusFn", "Vuna/Compiler/Native/Runtime.vuna:941"));
  ("Native_dRuntime.v_hostStatusLabel", ("Vuna.Compiler.Native.Runtime.hostStatusLabel", "Vuna/Compiler/Native/Runtime.vuna:156"));
  ("Native_dRuntime.v_impossibleMessage", ("Vuna.Compiler.Native.Runtime.impossibleMessage", "Vuna/Compiler/Native/Runtime.vuna:122"));
  ("Native_dRuntime.v_inheritKey", ("Vuna.Compiler.Native.Runtime.inheritKey", "Vuna/Compiler/Native/Runtime.vuna:71"));
  ("Native_dRuntime.v_initCpusFn", ("Vuna.Compiler.Native.Runtime.initCpusFn", "Vuna/Compiler/Native/Runtime.vuna:1249"));
  ("Native_dRuntime.v_initMemFn", ("Vuna.Compiler.Native.Runtime.initMemFn", "Vuna/Compiler/Native/Runtime.vuna:1231"));
  ("Native_dRuntime.v_initTimeoutFn", ("Vuna.Compiler.Native.Runtime.initTimeoutFn", "Vuna/Compiler/Native/Runtime.vuna:1257"));
  ("Native_dRuntime.v_intBinary", ("Vuna.Compiler.Native.Runtime.intBinary", "Vuna/Compiler/Native/Runtime.vuna:222"));
  ("Native_dRuntime.v_intCompare", ("Vuna.Compiler.Native.Runtime.intCompare", "Vuna/Compiler/Native/Runtime.vuna:230"));
  ("Native_dRuntime.v_intFromFloatFn", ("Vuna.Compiler.Native.Runtime.intFromFloatFn", "Vuna/Compiler/Native/Runtime.vuna:471"));
  ("Native_dRuntime.v_isTtyFn", ("Vuna.Compiler.Native.Runtime.isTtyFn", "Vuna/Compiler/Native/Runtime.vuna:933"));
  ("Native_dRuntime.v_itimerLabel", ("Vuna.Compiler.Native.Runtime.itimerLabel", "Vuna/Compiler/Native/Runtime.vuna:94"));
  ("Native_dRuntime.v_lstatPathFn", ("Vuna.Compiler.Native.Runtime.lstatPathFn", "Vuna/Compiler/Native/Runtime.vuna:1026"));
  ("Native_dRuntime.v_mRunEffFn", ("Vuna.Compiler.Native.Runtime.mRunEffFn", "Vuna/Compiler/Native/Runtime.vuna:581"));
  ("Native_dRuntime.v_memLimitKey", ("Vuna.Compiler.Native.Runtime.memLimitKey", "Vuna/Compiler/Native/Runtime.vuna:62"));
  ("Native_dRuntime.v_memLimitLabel", ("Vuna.Compiler.Native.Runtime.memLimitLabel", "Vuna/Compiler/Native/Runtime.vuna:82"));
  ("Native_dRuntime.v_memLimitMessage", ("Vuna.Compiler.Native.Runtime.memLimitMessage", "Vuna/Compiler/Native/Runtime.vuna:49"));
  ("Native_dRuntime.v_natAddFn", ("Vuna.Compiler.Native.Runtime.natAddFn", "Vuna/Compiler/Native/Runtime.vuna:314"));
  ("Native_dRuntime.v_natDivFn", ("Vuna.Compiler.Native.Runtime.natDivFn", "Vuna/Compiler/Native/Runtime.vuna:335"));
  ("Native_dRuntime.v_natFromIntFn", ("Vuna.Compiler.Native.Runtime.natFromIntFn", "Vuna/Compiler/Native/Runtime.vuna:342"));
  ("Native_dRuntime.v_natMulFn", ("Vuna.Compiler.Native.Runtime.natMulFn", "Vuna/Compiler/Native/Runtime.vuna:328"));
  ("Native_dRuntime.v_natSubFn", ("Vuna.Compiler.Native.Runtime.natSubFn", "Vuna/Compiler/Native/Runtime.vuna:321"));
  ("Native_dRuntime.v_natSuccFn", ("Vuna.Compiler.Native.Runtime.natSuccFn", "Vuna/Compiler/Native/Runtime.vuna:349"));
  ("Native_dRuntime.v_natToIntFn", ("Vuna.Compiler.Native.Runtime.natToIntFn", "Vuna/Compiler/Native/Runtime.vuna:260"));
  ("Native_dRuntime.v_nativeBss", ("Vuna.Compiler.Native.Runtime.nativeBss", "Vuna/Compiler/Native/Runtime.vuna:212"));
  ("Native_dRuntime.v_nativeEnvPrefix", ("Vuna.Compiler.Native.Runtime.nativeEnvPrefix", "Vuna/Compiler/Native/Runtime.vuna:75"));
  ("Native_dRuntime.v_nativeMaxInt", ("Vuna.Compiler.Native.Runtime.nativeMaxInt", "Vuna/Compiler/Native/Runtime.vuna:35"));
  ("Native_dRuntime.v_nativeMemDefaultBytes", ("Vuna.Compiler.Native.Runtime.nativeMemDefaultBytes", "Vuna/Compiler/Native/Runtime.vuna:58"));
  ("Native_dRuntime.v_nativeMinInt", ("Vuna.Compiler.Native.Runtime.nativeMinInt", "Vuna/Compiler/Native/Runtime.vuna:39"));
  ("Native_dRuntime.v_nativeRodata", ("Vuna.Compiler.Native.Runtime.nativeRodata", "Vuna/Compiler/Native/Runtime.vuna:138"));
  ("Native_dRuntime.v_nativeRtFuncs", ("Vuna.Compiler.Native.Runtime.nativeRtFuncs", "Vuna/Compiler/Native/Runtime.vuna:1292"));
  ("Native_dRuntime.v_nativeRtTarget", ("Vuna.Compiler.Native.Runtime.nativeRtTarget", "Vuna/Compiler/Native/Runtime.vuna:1534"));
  ("Native_dRuntime.v_nativeRtTargetBase", ("Vuna.Compiler.Native.Runtime.nativeRtTargetBase", "Vuna/Compiler/Native/Runtime.vuna:1300"));
  ("Native_dRuntime.v_nativeRtTargetHost", ("Vuna.Compiler.Native.Runtime.nativeRtTargetHost", "Vuna/Compiler/Native/Runtime.vuna:1339"));
  ("Native_dRuntime.v_nativeRtValueArity", ("Vuna.Compiler.Native.Runtime.nativeRtValueArity", "Vuna/Compiler/Native/Runtime.vuna:1707"));
  ("Native_dRuntime.v_nativeRtValueArityBase", ("Vuna.Compiler.Native.Runtime.nativeRtValueArityBase", "Vuna/Compiler/Native/Runtime.vuna:1542"));
  ("Native_dRuntime.v_nativeRtValueArityHost", ("Vuna.Compiler.Native.Runtime.nativeRtValueArityHost", "Vuna/Compiler/Native/Runtime.vuna:1552"));
  ("Native_dRuntime.v_nowUsFn", ("Vuna.Compiler.Native.Runtime.nowUsFn", "Vuna/Compiler/Native/Runtime.vuna:917"));
  ("Native_dRuntime.v_obsSpanFn", ("Vuna.Compiler.Native.Runtime.obsSpanFn", "Vuna/Compiler/Native/Runtime.vuna:277"));
  ("Native_dRuntime.v_obsSpanLabFn", ("Vuna.Compiler.Native.Runtime.obsSpanLabFn", "Vuna/Compiler/Native/Runtime.vuna:285"));
  ("Native_dRuntime.v_obsZero2Fn", ("Vuna.Compiler.Native.Runtime.obsZero2Fn", "Vuna/Compiler/Native/Runtime.vuna:272"));
  ("Native_dRuntime.v_obsZeroFn", ("Vuna.Compiler.Native.Runtime.obsZeroFn", "Vuna/Compiler/Native/Runtime.vuna:269"));
  ("Native_dRuntime.v_oomMessage", ("Vuna.Compiler.Native.Runtime.oomMessage", "Vuna/Compiler/Native/Runtime.vuna:45"));
  ("Native_dRuntime.v_parseU64Fn", ("Vuna.Compiler.Native.Runtime.parseU64Fn", "Vuna/Compiler/Native/Runtime.vuna:1224"));
  ("Native_dRuntime.v_pathBuf2Label", ("Vuna.Compiler.Native.Runtime.pathBuf2Label", "Vuna/Compiler/Native/Runtime.vuna:175"));
  ("Native_dRuntime.v_pathBufLabel", ("Vuna.Compiler.Native.Runtime.pathBufLabel", "Vuna/Compiler/Native/Runtime.vuna:160"));
  ("Native_dRuntime.v_pathTooLongMessage", ("Vuna.Compiler.Native.Runtime.pathTooLongMessage", "Vuna/Compiler/Native/Runtime.vuna:131"));
  ("Native_dRuntime.v_pow2CeilFn", ("Vuna.Compiler.Native.Runtime.pow2CeilFn", "Vuna/Compiler/Native/Runtime.vuna:544"));
  ("Native_dRuntime.v_primFailFn", ("Vuna.Compiler.Native.Runtime.primFailFn", "Vuna/Compiler/Native/Runtime.vuna:814"));
  ("Native_dRuntime.v_printBoolFn", ("Vuna.Compiler.Native.Runtime.printBoolFn", "Vuna/Compiler/Native/Runtime.vuna:646"));
  ("Native_dRuntime.v_printIntFn", ("Vuna.Compiler.Native.Runtime.printIntFn", "Vuna/Compiler/Native/Runtime.vuna:638"));
  ("Native_dRuntime.v_printStrFn", ("Vuna.Compiler.Native.Runtime.printStrFn", "Vuna/Compiler/Native/Runtime.vuna:654"));
  ("Native_dRuntime.v_readBufLabel", ("Vuna.Compiler.Native.Runtime.readBufLabel", "Vuna/Compiler/Native/Runtime.vuna:208"));
  ("Native_dRuntime.v_removeTreeFn", ("Vuna.Compiler.Native.Runtime.removeTreeFn", "Vuna/Compiler/Native/Runtime.vuna:1133"));
  ("Native_dRuntime.v_rmtreeDeepMessage", ("Vuna.Compiler.Native.Runtime.rmtreeDeepMessage", "Vuna/Compiler/Native/Runtime.vuna:135"));
  ("Native_dRuntime.v_shArgvLabel", ("Vuna.Compiler.Native.Runtime.shArgvLabel", "Vuna/Compiler/Native/Runtime.vuna:204"));
  ("Native_dRuntime.v_sigActLabel", ("Vuna.Compiler.Native.Runtime.sigActLabel", "Vuna/Compiler/Native/Runtime.vuna:90"));
  ("Native_dRuntime.v_sigalrmFn", ("Vuna.Compiler.Native.Runtime.sigalrmFn", "Vuna/Compiler/Native/Runtime.vuna:1269"));
  ("Native_dRuntime.v_sigreturnStubFn", ("Vuna.Compiler.Native.Runtime.sigreturnStubFn", "Vuna/Compiler/Native/Runtime.vuna:1265"));
  ("Native_dRuntime.v_sleepUsFn", ("Vuna.Compiler.Native.Runtime.sleepUsFn", "Vuna/Compiler/Native/Runtime.vuna:925"));
  ("Native_dRuntime.v_spawnArgvLabel", ("Vuna.Compiler.Native.Runtime.spawnArgvLabel", "Vuna/Compiler/Native/Runtime.vuna:198"));
  ("Native_dRuntime.v_spawnBufLabel", ("Vuna.Compiler.Native.Runtime.spawnBufLabel", "Vuna/Compiler/Native/Runtime.vuna:201"));
  ("Native_dRuntime.v_spawnExecFn", ("Vuna.Compiler.Native.Runtime.spawnExecFn", "Vuna/Compiler/Native/Runtime.vuna:1182"));
  ("Native_dRuntime.v_stackLimitLabel", ("Vuna.Compiler.Native.Runtime.stackLimitLabel", "Vuna/Compiler/Native/Runtime.vuna:524"));
  ("Native_dRuntime.v_stackOverflowMessage", ("Vuna.Compiler.Native.Runtime.stackOverflowMessage", "Vuna/Compiler/Native/Runtime.vuna:527"));
  ("Native_dRuntime.v_stackTopLabel", ("Vuna.Compiler.Native.Runtime.stackTopLabel", "Vuna/Compiler/Native/Runtime.vuna:521"));
  ("Native_dRuntime.v_statBufLabel", ("Vuna.Compiler.Native.Runtime.statBufLabel", "Vuna/Compiler/Native/Runtime.vuna:180"));
  ("Native_dRuntime.v_statPathFn", ("Vuna.Compiler.Native.Runtime.statPathFn", "Vuna/Compiler/Native/Runtime.vuna:1018"));
  ("Native_dRuntime.v_strAllocFn", ("Vuna.Compiler.Native.Runtime.strAllocFn", "Vuna/Compiler/Native/Runtime.vuna:361"));
  ("Native_dRuntime.v_strAtFn", ("Vuna.Compiler.Native.Runtime.strAtFn", "Vuna/Compiler/Native/Runtime.vuna:419"));
  ("Native_dRuntime.v_strCompareFn", ("Vuna.Compiler.Native.Runtime.strCompareFn", "Vuna/Compiler/Native/Runtime.vuna:395"));
  ("Native_dRuntime.v_strCompareFnOf", ("Vuna.Compiler.Native.Runtime.strCompareFnOf", "Vuna/Compiler/Native/Runtime.vuna:403"));
  ("Native_dRuntime.v_strConcatFn", ("Vuna.Compiler.Native.Runtime.strConcatFn", "Vuna/Compiler/Native/Runtime.vuna:373"));
  ("Native_dRuntime.v_strCopyIntoFn", ("Vuna.Compiler.Native.Runtime.strCopyIntoFn", "Vuna/Compiler/Native/Runtime.vuna:993"));
  ("Native_dRuntime.v_strEmptyFn", ("Vuna.Compiler.Native.Runtime.strEmptyFn", "Vuna/Compiler/Native/Runtime.vuna:884"));
  ("Native_dRuntime.v_strEqFn", ("Vuna.Compiler.Native.Runtime.strEqFn", "Vuna/Compiler/Native/Runtime.vuna:381"));
  ("Native_dRuntime.v_strFromBytesFn", ("Vuna.Compiler.Native.Runtime.strFromBytesFn", "Vuna/Compiler/Native/Runtime.vuna:860"));
  ("Native_dRuntime.v_strFromCFn", ("Vuna.Compiler.Native.Runtime.strFromCFn", "Vuna/Compiler/Native/Runtime.vuna:868"));
  ("Native_dRuntime.v_strFromIntFn", ("Vuna.Compiler.Native.Runtime.strFromIntFn", "Vuna/Compiler/Native/Runtime.vuna:411"));
  ("Native_dRuntime.v_strHashFn", ("Vuna.Compiler.Native.Runtime.strHashFn", "Vuna/Compiler/Native/Runtime.vuna:435"));
  ("Native_dRuntime.v_strLengthFn", ("Vuna.Compiler.Native.Runtime.strLengthFn", "Vuna/Compiler/Native/Runtime.vuna:369"));
  ("Native_dRuntime.v_strNeqFn", ("Vuna.Compiler.Native.Runtime.strNeqFn", "Vuna/Compiler/Native/Runtime.vuna:389"));
  ("Native_dRuntime.v_strOneCharFn", ("Vuna.Compiler.Native.Runtime.strOneCharFn", "Vuna/Compiler/Native/Runtime.vuna:876"));
  ("Native_dRuntime.v_strShowFn", ("Vuna.Compiler.Native.Runtime.strShowFn", "Vuna/Compiler/Native/Runtime.vuna:453"));
  ("Native_dRuntime.v_strSubstringFn", ("Vuna.Compiler.Native.Runtime.strSubstringFn", "Vuna/Compiler/Native/Runtime.vuna:427"));
  ("Native_dRuntime.v_strToC2Fn", ("Vuna.Compiler.Native.Runtime.strToC2Fn", "Vuna/Compiler/Native/Runtime.vuna:985"));
  ("Native_dRuntime.v_strToCFn", ("Vuna.Compiler.Native.Runtime.strToCFn", "Vuna/Compiler/Native/Runtime.vuna:977"));
  ("Native_dRuntime.v_termiosLabel", ("Vuna.Compiler.Native.Runtime.termiosLabel", "Vuna/Compiler/Native/Runtime.vuna:167"));
  ("Native_dRuntime.v_timeoutKey", ("Vuna.Compiler.Native.Runtime.timeoutKey", "Vuna/Compiler/Native/Runtime.vuna:65"));
  ("Native_dRuntime.v_timeoutMessage", ("Vuna.Compiler.Native.Runtime.timeoutMessage", "Vuna/Compiler/Native/Runtime.vuna:53"));
  ("Native_dRuntime.v_todoFn", ("Vuna.Compiler.Native.Runtime.todoFn", "Vuna/Compiler/Native/Runtime.vuna:818"));
  ("Native_dRuntime.v_todoPrefix", ("Vuna.Compiler.Native.Runtime.todoPrefix", "Vuna/Compiler/Native/Runtime.vuna:119"));
  ("Native_dRuntime.v_trapArrayOobFn", ("Vuna.Compiler.Native.Runtime.trapArrayOobFn", "Vuna/Compiler/Native/Runtime.vuna:717"));
  ("Native_dRuntime.v_trapAssertFn", ("Vuna.Compiler.Native.Runtime.trapAssertFn", "Vuna/Compiler/Native/Runtime.vuna:794"));
  ("Native_dRuntime.v_trapDivZeroFn", ("Vuna.Compiler.Native.Runtime.trapDivZeroFn", "Vuna/Compiler/Native/Runtime.vuna:711"));
  ("Native_dRuntime.v_trapImpossibleFn", ("Vuna.Compiler.Native.Runtime.trapImpossibleFn", "Vuna/Compiler/Native/Runtime.vuna:705"));
  ("Native_dRuntime.v_trapMemLimitFn", ("Vuna.Compiler.Native.Runtime.trapMemLimitFn", "Vuna/Compiler/Native/Runtime.vuna:1275"));
  ("Native_dRuntime.v_trapMsgFn", ("Vuna.Compiler.Native.Runtime.trapMsgFn", "Vuna/Compiler/Native/Runtime.vuna:787"));
  ("Native_dRuntime.v_trapOomFn", ("Vuna.Compiler.Native.Runtime.trapOomFn", "Vuna/Compiler/Native/Runtime.vuna:723"));
  ("Native_dRuntime.v_trapPathLongFn", ("Vuna.Compiler.Native.Runtime.trapPathLongFn", "Vuna/Compiler/Native/Runtime.vuna:729"));
  ("Native_dRuntime.v_trapRmtreeDeepFn", ("Vuna.Compiler.Native.Runtime.trapRmtreeDeepFn", "Vuna/Compiler/Native/Runtime.vuna:536"));
  ("Native_dRuntime.v_trapStackOverflowFn", ("Vuna.Compiler.Native.Runtime.trapStackOverflowFn", "Vuna/Compiler/Native/Runtime.vuna:530"));
  ("Native_dRuntime.v_trapTodoFn", ("Vuna.Compiler.Native.Runtime.trapTodoFn", "Vuna/Compiler/Native/Runtime.vuna:801"));
  ("Native_dRuntime.v_trapWithPrefix", ("Vuna.Compiler.Native.Runtime.trapWithPrefix", "Vuna/Compiler/Native/Runtime.vuna:780"));
  ("Native_dRuntime.v_tryIsDirFn", ("Vuna.Compiler.Native.Runtime.tryIsDirFn", "Vuna/Compiler/Native/Runtime.vuna:1058"));
  ("Native_dRuntime.v_tryMakeDirExclusiveFn", ("Vuna.Compiler.Native.Runtime.tryMakeDirExclusiveFn", "Vuna/Compiler/Native/Runtime.vuna:1100"));
  ("Native_dRuntime.v_tryMakeDirFn", ("Vuna.Compiler.Native.Runtime.tryMakeDirFn", "Vuna/Compiler/Native/Runtime.vuna:1092"));
  ("Native_dRuntime.v_tryReadFileFn", ("Vuna.Compiler.Native.Runtime.tryReadFileFn", "Vuna/Compiler/Native/Runtime.vuna:1068"));
  ("Native_dRuntime.v_tryRemoveFileFn", ("Vuna.Compiler.Native.Runtime.tryRemoveFileFn", "Vuna/Compiler/Native/Runtime.vuna:1108"));
  ("Native_dRuntime.v_tryRemoveTreeFn", ("Vuna.Compiler.Native.Runtime.tryRemoveTreeFn", "Vuna/Compiler/Native/Runtime.vuna:1141"));
  ("Native_dRuntime.v_tryRenameFn", ("Vuna.Compiler.Native.Runtime.tryRenameFn", "Vuna/Compiler/Native/Runtime.vuna:1116"));
  ("Native_dRuntime.v_trySymlinkFn", ("Vuna.Compiler.Native.Runtime.trySymlinkFn", "Vuna/Compiler/Native/Runtime.vuna:1124"));
  ("Native_dRuntime.v_tryWriteFileAtomicFn", ("Vuna.Compiler.Native.Runtime.tryWriteFileAtomicFn", "Vuna/Compiler/Native/Runtime.vuna:1084"));
  ("Native_dRuntime.v_tryWriteFileFn", ("Vuna.Compiler.Native.Runtime.tryWriteFileFn", "Vuna/Compiler/Native/Runtime.vuna:1076"));
  ("Native_dRuntime.v_tsLabel", ("Vuna.Compiler.Native.Runtime.tsLabel", "Vuna/Compiler/Native/Runtime.vuna:164"));
  ("Native_dRuntime.v_u64ToDecFn", ("Vuna.Compiler.Native.Runtime.u64ToDecFn", "Vuna/Compiler/Native/Runtime.vuna:1010"));
  ("Native_dRuntime.v_waitPidFn", ("Vuna.Compiler.Native.Runtime.waitPidFn", "Vuna/Compiler/Native/Runtime.vuna:1190"));
  ("Native_dRuntime.v_writeErrMsg", ("Vuna.Compiler.Native.Runtime.writeErrMsg", "Vuna/Compiler/Native/Runtime.vuna:755"));
  ("Native_dRuntime.v_writeErrRaw", ("Vuna.Compiler.Native.Runtime.writeErrRaw", "Vuna/Compiler/Native/Runtime.vuna:744"));
  ("Wasm_dInstr.v_oneInstr", ("Vuna.Compiler.Wasm.Instr.oneInstr", "Vuna/Compiler/Wasm/Instr.vuna:96"));
  ("Wasm_dInstr.v_seqInstr", ("Vuna.Compiler.Wasm.Instr.seqInstr", "Vuna/Compiler/Wasm/Instr.vuna:92"));
  ("Wasm_dModel.v_targetText", ("Vuna.Compiler.Wasm.Model.targetText", "Vuna/Compiler/Wasm/Model.vuna:23"));
  ("Wasm_dModel.v_wasmErrText", ("Vuna.Compiler.Wasm.Model.wasmErrText", "Vuna/Compiler/Wasm/Model.vuna:32"));
  ("Wasm_dModel.v_watValTyText", ("Vuna.Compiler.Wasm.Model.watValTyText", "Vuna/Compiler/Wasm/Model.vuna:51"));
  ("Wasm_dModule.v_abortSend", ("Vuna.Compiler.Wasm.Module.abortSend", "Vuna/Compiler/Wasm/Module.vuna:1839"));
  ("Wasm_dModule.v_addElemName", ("Vuna.Compiler.Wasm.Module.addElemName", "Vuna/Compiler/Wasm/Module.vuna:502"));
  ("Wasm_dModule.v_addLamFunc", ("Vuna.Compiler.Wasm.Module.addLamFunc", "Vuna/Compiler/Wasm/Module.vuna:499"));
  ("Wasm_dModule.v_altMaybeSym", ("Vuna.Compiler.Wasm.Module.altMaybeSym", "Vuna/Compiler/Wasm/Module.vuna:1699"));
  ("Wasm_dModule.v_anyAltSym", ("Vuna.Compiler.Wasm.Module.anyAltSym", "Vuna/Compiler/Wasm/Module.vuna:1694"));
  ("Wasm_dModule.v_anyHostHandled", ("Vuna.Compiler.Wasm.Module.anyHostHandled", "Vuna/Compiler/Wasm/Module.vuna:1754"));
  ("Wasm_dModule.v_anyIrSym", ("Vuna.Compiler.Wasm.Module.anyIrSym", "Vuna/Compiler/Wasm/Module.vuna:1689"));
  ("Wasm_dModule.v_applyAllIr", ("Vuna.Compiler.Wasm.Module.applyAllIr", "Vuna/Compiler/Wasm/Module.vuna:237"));
  ("Wasm_dModule.v_bNameEq", ("Vuna.Compiler.Wasm.Module.bNameEq", "Vuna/Compiler/Wasm/Module.vuna:64"));
  ("Wasm_dModule.v_baseImports", ("Vuna.Compiler.Wasm.Module.baseImports", "Vuna/Compiler/Wasm/Module.vuna:1600"));
  ("Wasm_dModule.v_baseTypes", ("Vuna.Compiler.Wasm.Module.baseTypes", "Vuna/Compiler/Wasm/Module.vuna:1587"));
  ("Wasm_dModule.v_beginFuncScope", ("Vuna.Compiler.Wasm.Module.beginFuncScope", "Vuna/Compiler/Wasm/Module.vuna:109"));
  ("Wasm_dModule.v_bindEnvLocals", ("Vuna.Compiler.Wasm.Module.bindEnvLocals", "Vuna/Compiler/Wasm/Module.vuna:486"));
  ("Wasm_dModule.v_bindFields", ("Vuna.Compiler.Wasm.Module.bindFields", "Vuna/Compiler/Wasm/Module.vuna:1002"));
  ("Wasm_dModule.v_bindScrutBinder", ("Vuna.Compiler.Wasm.Module.bindScrutBinder", "Vuna/Compiler/Wasm/Module.vuna:953"));
  ("Wasm_dModule.v_binderEq", ("Vuna.Compiler.Wasm.Module.binderEq", "Vuna/Compiler/Wasm/Module.vuna:82"));
  ("Wasm_dModule.v_binderErasedOf", ("Vuna.Compiler.Wasm.Module.binderErasedOf", "Vuna/Compiler/Wasm/Module.vuna:61"));
  ("Wasm_dModule.v_binderNameOf", ("Vuna.Compiler.Wasm.Module.binderNameOf", "Vuna/Compiler/Wasm/Module.vuna:58"));
  ("Wasm_dModule.v_boolI31", ("Vuna.Compiler.Wasm.Module.boolI31", "Vuna/Compiler/Wasm/Module.vuna:198"));
  ("Wasm_dModule.v_boxInstr", ("Vuna.Compiler.Wasm.Module.boxInstr", "Vuna/Compiler/Wasm/Module.vuna:660"));
  ("Wasm_dModule.v_build", ("Vuna.Compiler.Wasm.Module.build", "Vuna/Compiler/Wasm/Module.vuna:2045"));
  ("Wasm_dModule.v_buildModule", ("Vuna.Compiler.Wasm.Module.buildModule", "Vuna/Compiler/Wasm/Module.vuna:1765"));
  ("Wasm_dModule.v_capGetInstrs", ("Vuna.Compiler.Wasm.Module.capGetInstrs", "Vuna/Compiler/Wasm/Module.vuna:481"));
  ("Wasm_dModule.v_caseFamilyOf", ("Vuna.Compiler.Wasm.Module.caseFamilyOf", "Vuna/Compiler/Wasm/Module.vuna:926"));
  ("Wasm_dModule.v_caseFamilyOfAlts", ("Vuna.Compiler.Wasm.Module.caseFamilyOfAlts", "Vuna/Compiler/Wasm/Module.vuna:930"));
  ("Wasm_dModule.v_catI", ("Vuna.Compiler.Wasm.Module.catI", "Vuna/Compiler/Wasm/Module.vuna:1237"));
  ("Wasm_dModule.v_classifyWasmErr", ("Vuna.Compiler.Wasm.Module.classifyWasmErr", "Vuna/Compiler/Wasm/Module.vuna:2164"));
  ("Wasm_dModule.v_closeRefs", ("Vuna.Compiler.Wasm.Module.closeRefs", "Vuna/Compiler/Wasm/Module.vuna:1997"));
  ("Wasm_dModule.v_closeRefsAll", ("Vuna.Compiler.Wasm.Module.closeRefsAll", "Vuna/Compiler/Wasm/Module.vuna:2019"));
  ("Wasm_dModule.v_cmpArrFunc", ("Vuna.Compiler.Wasm.Module.cmpArrFunc", "Vuna/Compiler/Wasm/Module.vuna:1092"));
  ("Wasm_dModule.v_cmpDispatch", ("Vuna.Compiler.Wasm.Module.cmpDispatch", "Vuna/Compiler/Wasm/Module.vuna:1192"));
  ("Wasm_dModule.v_cmpFamBody", ("Vuna.Compiler.Wasm.Module.cmpFamBody", "Vuna/Compiler/Wasm/Module.vuna:1150"));
  ("Wasm_dModule.v_cmpFamFlat", ("Vuna.Compiler.Wasm.Module.cmpFamFlat", "Vuna/Compiler/Wasm/Module.vuna:1170"));
  ("Wasm_dModule.v_cmpFields", ("Vuna.Compiler.Wasm.Module.cmpFields", "Vuna/Compiler/Wasm/Module.vuna:1135"));
  ("Wasm_dModule.v_cmpPrimFlat", ("Vuna.Compiler.Wasm.Module.cmpPrimFlat", "Vuna/Compiler/Wasm/Module.vuna:1183"));
  ("Wasm_dModule.v_cmpStrFunc", ("Vuna.Compiler.Wasm.Module.cmpStrFunc", "Vuna/Compiler/Wasm/Module.vuna:1048"));
  ("Wasm_dModule.v_cmpTrapFunc", ("Vuna.Compiler.Wasm.Module.cmpTrapFunc", "Vuna/Compiler/Wasm/Module.vuna:1038"));
  ("Wasm_dModule.v_concatMapType", ("Vuna.Compiler.Wasm.Module.concatMapType", "Vuna/Compiler/Wasm/Module.vuna:1674"));
  ("Wasm_dModule.v_defUsesSyms", ("Vuna.Compiler.Wasm.Module.defUsesSyms", "Vuna/Compiler/Wasm/Module.vuna:1743"));
  ("Wasm_dModule.v_defsUseSyms", ("Vuna.Compiler.Wasm.Module.defsUseSyms", "Vuna/Compiler/Wasm/Module.vuna:1749"));
  ("Wasm_dModule.v_depKeeps", ("Vuna.Compiler.Wasm.Module.depKeeps", "Vuna/Compiler/Wasm/Module.vuna:1985"));
  ("Wasm_dModule.v_directSend", ("Vuna.Compiler.Wasm.Module.directSend", "Vuna/Compiler/Wasm/Module.vuna:1830"));
  ("Wasm_dModule.v_effArgBinders", ("Vuna.Compiler.Wasm.Module.effArgBinders", "Vuna/Compiler/Wasm/Module.vuna:244"));
  ("Wasm_dModule.v_effScanFuel", ("Vuna.Compiler.Wasm.Module.effScanFuel", "Vuna/Compiler/Wasm/Module.vuna:1686"));
  ("Wasm_dModule.v_effSymbols", ("Vuna.Compiler.Wasm.Module.effSymbols", "Vuna/Compiler/Wasm/Module.vuna:1682"));
  ("Wasm_dModule.v_effUnitBinder", ("Vuna.Compiler.Wasm.Module.effUnitBinder", "Vuna/Compiler/Wasm/Module.vuna:241"));
  ("Wasm_dModule.v_emptyStr", ("Vuna.Compiler.Wasm.Module.emptyStr", "Vuna/Compiler/Wasm/Module.vuna:201"));
  ("Wasm_dModule.v_endFuncScope", ("Vuna.Compiler.Wasm.Module.endFuncScope", "Vuna/Compiler/Wasm/Module.vuna:122"));
  ("Wasm_dModule.v_ensureLocal", ("Vuna.Compiler.Wasm.Module.ensureLocal", "Vuna/Compiler/Wasm/Module.vuna:911"));
  ("Wasm_dModule.v_entryShowFunc", ("Vuna.Compiler.Wasm.Module.entryShowFunc", "Vuna/Compiler/Wasm/Module.vuna:1542"));
  ("Wasm_dModule.v_etaBinders", ("Vuna.Compiler.Wasm.Module.etaBinders", "Vuna/Compiler/Wasm/Module.vuna:331"));
  ("Wasm_dModule.v_famNameOf", ("Vuna.Compiler.Wasm.Module.famNameOf", "Vuna/Compiler/Wasm/Module.vuna:2160"));
  ("Wasm_dModule.v_famOrFail", ("Vuna.Compiler.Wasm.Module.famOrFail", "Vuna/Compiler/Wasm/Module.vuna:757"));
  ("Wasm_dModule.v_fieldSym", ("Vuna.Compiler.Wasm.Module.fieldSym", "Vuna/Compiler/Wasm/Module.vuna:1703"));
  ("Wasm_dModule.v_floatDigitsGo", ("Vuna.Compiler.Wasm.Module.floatDigitsGo", "Vuna/Compiler/Wasm/Module.vuna:212"));
  ("Wasm_dModule.v_floatDigitsOf", ("Vuna.Compiler.Wasm.Module.floatDigitsOf", "Vuna/Compiler/Wasm/Module.vuna:209"));
  ("Wasm_dModule.v_floatPow10", ("Vuna.Compiler.Wasm.Module.floatPow10", "Vuna/Compiler/Wasm/Module.vuna:217"));
  ("Wasm_dModule.v_floatRenderName", ("Vuna.Compiler.Wasm.Module.floatRenderName", "Vuna/Compiler/Wasm/Module.vuna:2157"));
  ("Wasm_dModule.v_foldlStrings", ("Vuna.Compiler.Wasm.Module.foldlStrings", "Vuna/Compiler/Wasm/Module.vuna:2168"));
  ("Wasm_dModule.v_freshLocal", ("Vuna.Compiler.Wasm.Module.freshLocal", "Vuna/Compiler/Wasm/Module.vuna:90"));
  ("Wasm_dModule.v_funcParams", ("Vuna.Compiler.Wasm.Module.funcParams", "Vuna/Compiler/Wasm/Module.vuna:164"));
  ("Wasm_dModule.v_genAltBody", ("Vuna.Compiler.Wasm.Module.genAltBody", "Vuna/Compiler/Wasm/Module.vuna:987"));
  ("Wasm_dModule.v_genApp", ("Vuna.Compiler.Wasm.Module.genApp", "Vuna/Compiler/Wasm/Module.vuna:422"));
  ("Wasm_dModule.v_genApplyArgs", ("Vuna.Compiler.Wasm.Module.genApplyArgs", "Vuna/Compiler/Wasm/Module.vuna:567"));
  ("Wasm_dModule.v_genApplyValue", ("Vuna.Compiler.Wasm.Module.genApplyValue", "Vuna/Compiler/Wasm/Module.vuna:556"));
  ("Wasm_dModule.v_genArgsThen", ("Vuna.Compiler.Wasm.Module.genArgsThen", "Vuna/Compiler/Wasm/Module.vuna:613"));
  ("Wasm_dModule.v_genCase", ("Vuna.Compiler.Wasm.Module.genCase", "Vuna/Compiler/Wasm/Module.vuna:880"));
  ("Wasm_dModule.v_genCatchAllOnly", ("Vuna.Compiler.Wasm.Module.genCatchAllOnly", "Vuna/Compiler/Wasm/Module.vuna:938"));
  ("Wasm_dModule.v_genConcatMany", ("Vuna.Compiler.Wasm.Module.genConcatMany", "Vuna/Compiler/Wasm/Module.vuna:725"));
  ("Wasm_dModule.v_genConcatRest", ("Vuna.Compiler.Wasm.Module.genConcatRest", "Vuna/Compiler/Wasm/Module.vuna:741"));
  ("Wasm_dModule.v_genCtor", ("Vuna.Compiler.Wasm.Module.genCtor", "Vuna/Compiler/Wasm/Module.vuna:781"));
  ("Wasm_dModule.v_genDefFunc", ("Vuna.Compiler.Wasm.Module.genDefFunc", "Vuna/Compiler/Wasm/Module.vuna:1458"));
  ("Wasm_dModule.v_genDefFuncBody", ("Vuna.Compiler.Wasm.Module.genDefFuncBody", "Vuna/Compiler/Wasm/Module.vuna:1464"));
  ("Wasm_dModule.v_genDefFuncGo", ("Vuna.Compiler.Wasm.Module.genDefFuncGo", "Vuna/Compiler/Wasm/Module.vuna:1481"));
  ("Wasm_dModule.v_genDefFuncs", ("Vuna.Compiler.Wasm.Module.genDefFuncs", "Vuna/Compiler/Wasm/Module.vuna:1501"));
  ("Wasm_dModule.v_genDefInit", ("Vuna.Compiler.Wasm.Module.genDefInit", "Vuna/Compiler/Wasm/Module.vuna:1517"));
  ("Wasm_dModule.v_genDefsInits", ("Vuna.Compiler.Wasm.Module.genDefsInits", "Vuna/Compiler/Wasm/Module.vuna:1529"));
  ("Wasm_dModule.v_genEffThunk", ("Vuna.Compiler.Wasm.Module.genEffThunk", "Vuna/Compiler/Wasm/Module.vuna:248"));
  ("Wasm_dModule.v_genExpr", ("Vuna.Compiler.Wasm.Module.genExpr", "Vuna/Compiler/Wasm/Module.vuna:260"));
  ("Wasm_dModule.v_genExprs", ("Vuna.Compiler.Wasm.Module.genExprs", "Vuna/Compiler/Wasm/Module.vuna:766"));
  ("Wasm_dModule.v_genFloatLit", ("Vuna.Compiler.Wasm.Module.genFloatLit", "Vuna/Compiler/Wasm/Module.vuna:220"));
  ("Wasm_dModule.v_genGlobalCall", ("Vuna.Compiler.Wasm.Module.genGlobalCall", "Vuna/Compiler/Wasm/Module.vuna:447"));
  ("Wasm_dModule.v_genGlobalRef", ("Vuna.Compiler.Wasm.Module.genGlobalRef", "Vuna/Compiler/Wasm/Module.vuna:300"));
  ("Wasm_dModule.v_genIf", ("Vuna.Compiler.Wasm.Module.genIf", "Vuna/Compiler/Wasm/Module.vuna:362"));
  ("Wasm_dModule.v_genLamApp", ("Vuna.Compiler.Wasm.Module.genLamApp", "Vuna/Compiler/Wasm/Module.vuna:584"));
  ("Wasm_dModule.v_genLamValue", ("Vuna.Compiler.Wasm.Module.genLamValue", "Vuna/Compiler/Wasm/Module.vuna:515"));
  ("Wasm_dModule.v_genLet", ("Vuna.Compiler.Wasm.Module.genLet", "Vuna/Compiler/Wasm/Module.vuna:383"));
  ("Wasm_dModule.v_genLetBound", ("Vuna.Compiler.Wasm.Module.genLetBound", "Vuna/Compiler/Wasm/Module.vuna:395"));
  ("Wasm_dModule.v_genNatArm", ("Vuna.Compiler.Wasm.Module.genNatArm", "Vuna/Compiler/Wasm/Module.vuna:665"));
  ("Wasm_dModule.v_genNatArmAlt", ("Vuna.Compiler.Wasm.Module.genNatArmAlt", "Vuna/Compiler/Wasm/Module.vuna:674"));
  ("Wasm_dModule.v_genNatCase", ("Vuna.Compiler.Wasm.Module.genNatCase", "Vuna/Compiler/Wasm/Module.vuna:692"));
  ("Wasm_dModule.v_genProj", ("Vuna.Compiler.Wasm.Module.genProj", "Vuna/Compiler/Wasm/Module.vuna:821"));
  ("Wasm_dModule.v_genRecUpd", ("Vuna.Compiler.Wasm.Module.genRecUpd", "Vuna/Compiler/Wasm/Module.vuna:837"));
  ("Wasm_dModule.v_genRecord", ("Vuna.Compiler.Wasm.Module.genRecord", "Vuna/Compiler/Wasm/Module.vuna:806"));
  ("Wasm_dModule.v_genRecordCase", ("Vuna.Compiler.Wasm.Module.genRecordCase", "Vuna/Compiler/Wasm/Module.vuna:1014"));
  ("Wasm_dModule.v_genRtApp", ("Vuna.Compiler.Wasm.Module.genRtApp", "Vuna/Compiler/Wasm/Module.vuna:626"));
  ("Wasm_dModule.v_genRtValue", ("Vuna.Compiler.Wasm.Module.genRtValue", "Vuna/Compiler/Wasm/Module.vuna:317"));
  ("Wasm_dModule.v_genStartBody", ("Vuna.Compiler.Wasm.Module.genStartBody", "Vuna/Compiler/Wasm/Module.vuna:1553"));
  ("Wasm_dModule.v_genStr", ("Vuna.Compiler.Wasm.Module.genStr", "Vuna/Compiler/Wasm/Module.vuna:345"));
  ("Wasm_dModule.v_genUpdFields", ("Vuna.Compiler.Wasm.Module.genUpdFields", "Vuna/Compiler/Wasm/Module.vuna:854"));
  ("Wasm_dModule.v_genVar", ("Vuna.Compiler.Wasm.Module.genVar", "Vuna/Compiler/Wasm/Module.vuna:293"));
  ("Wasm_dModule.v_genVariantCase", ("Vuna.Compiler.Wasm.Module.genVariantCase", "Vuna/Compiler/Wasm/Module.vuna:962"));
  ("Wasm_dModule.v_globalOfDef", ("Vuna.Compiler.Wasm.Module.globalOfDef", "Vuna/Compiler/Wasm/Module.vuna:1670"));
  ("Wasm_dModule.v_globalsOf", ("Vuna.Compiler.Wasm.Module.globalsOf", "Vuna/Compiler/Wasm/Module.vuna:1667"));
  ("Wasm_dModule.v_globalsOfAlt", ("Vuna.Compiler.Wasm.Module.globalsOfAlt", "Vuna/Compiler/Wasm/Module.vuna:1975"));
  ("Wasm_dModule.v_globalsOfAltMaybe", ("Vuna.Compiler.Wasm.Module.globalsOfAltMaybe", "Vuna/Compiler/Wasm/Module.vuna:1978"));
  ("Wasm_dModule.v_globalsOfField", ("Vuna.Compiler.Wasm.Module.globalsOfField", "Vuna/Compiler/Wasm/Module.vuna:1972"));
  ("Wasm_dModule.v_hcPureK", ("Vuna.Compiler.Wasm.Module.hcPureK", "Vuna/Compiler/Wasm/Module.vuna:1813"));
  ("Wasm_dModule.v_irGlobalsOf", ("Vuna.Compiler.Wasm.Module.irGlobalsOf", "Vuna/Compiler/Wasm/Module.vuna:1950"));
  ("Wasm_dModule.v_irUsesSyms", ("Vuna.Compiler.Wasm.Module.irUsesSyms", "Vuna/Compiler/Wasm/Module.vuna:1709"));
  ("Wasm_dModule.v_isConcreteFam", ("Vuna.Compiler.Wasm.Module.isConcreteFam", "Vuna/Compiler/Wasm/Module.vuna:1186"));
  ("Wasm_dModule.v_joinWith", ("Vuna.Compiler.Wasm.Module.joinWith", "Vuna/Compiler/Wasm/Module.vuna:2211"));
  ("Wasm_dModule.v_listLengthB", ("Vuna.Compiler.Wasm.Module.listLengthB", "Vuna/Compiler/Wasm/Module.vuna:415"));
  ("Wasm_dModule.v_listNull", ("Vuna.Compiler.Wasm.Module.listNull", "Vuna/Compiler/Wasm/Module.vuna:1761"));
  ("Wasm_dModule.v_lookupBinder", ("Vuna.Compiler.Wasm.Module.lookupBinder", "Vuna/Compiler/Wasm/Module.vuna:85"));
  ("Wasm_dModule.v_lookupFieldIr", ("Vuna.Compiler.Wasm.Module.lookupFieldIr", "Vuna/Compiler/Wasm/Module.vuna:873"));
  ("Wasm_dModule.v_memFuncName", ("Vuna.Compiler.Wasm.Module.memFuncName", "Vuna/Compiler/Wasm/Module.vuna:153"));
  ("Wasm_dModule.v_memLocalName", ("Vuna.Compiler.Wasm.Module.memLocalName", "Vuna/Compiler/Wasm/Module.vuna:143"));
  ("Wasm_dModule.v_memStr", ("Vuna.Compiler.Wasm.Module.memStr", "Vuna/Compiler/Wasm/Module.vuna:907"));
  ("Wasm_dModule.v_mergeArmState", ("Vuna.Compiler.Wasm.Module.mergeArmState", "Vuna/Compiler/Wasm/Module.vuna:130"));
  ("Wasm_dModule.v_mergeFuncs", ("Vuna.Compiler.Wasm.Module.mergeFuncs", "Vuna/Compiler/Wasm/Module.vuna:150"));
  ("Wasm_dModule.v_mergeLocals", ("Vuna.Compiler.Wasm.Module.mergeLocals", "Vuna/Compiler/Wasm/Module.vuna:140"));
  ("Wasm_dModule.v_mergeNames", ("Vuna.Compiler.Wasm.Module.mergeNames", "Vuna/Compiler/Wasm/Module.vuna:157"));
  ("Wasm_dModule.v_mkConsts", ("Vuna.Compiler.Wasm.Module.mkConsts", "Vuna/Compiler/Wasm/Module.vuna:2172"));
  ("Wasm_dModule.v_noTail", ("Vuna.Compiler.Wasm.Module.noTail", "Vuna/Compiler/Wasm/Module.vuna:115"));
  ("Wasm_dModule.v_opFieldOf", ("Vuna.Compiler.Wasm.Module.opFieldOf", "Vuna/Compiler/Wasm/Module.vuna:1825"));
  ("Wasm_dModule.v_performSyms", ("Vuna.Compiler.Wasm.Module.performSyms", "Vuna/Compiler/Wasm/Module.vuna:1740"));
  ("Wasm_dModule.v_poolAdd", ("Vuna.Compiler.Wasm.Module.poolAdd", "Vuna/Compiler/Wasm/Module.vuna:171"));
  ("Wasm_dModule.v_poolBytes", ("Vuna.Compiler.Wasm.Module.poolBytes", "Vuna/Compiler/Wasm/Module.vuna:192"));
  ("Wasm_dModule.v_poolLookup", ("Vuna.Compiler.Wasm.Module.poolLookup", "Vuna/Compiler/Wasm/Module.vuna:189"));
  ("Wasm_dModule.v_poolOf", ("Vuna.Compiler.Wasm.Module.poolOf", "Vuna/Compiler/Wasm/Module.vuna:178"));
  ("Wasm_dModule.v_poolOffsets", ("Vuna.Compiler.Wasm.Module.poolOffsets", "Vuna/Compiler/Wasm/Module.vuna:184"));
  ("Wasm_dModule.v_prepend", ("Vuna.Compiler.Wasm.Module.prepend", "Vuna/Compiler/Wasm/Module.vuna:918"));
  ("Wasm_dModule.v_pureKDef", ("Vuna.Compiler.Wasm.Module.pureKDef", "Vuna/Compiler/Wasm/Module.vuna:1934"));
  ("Wasm_dModule.v_pushBinder", ("Vuna.Compiler.Wasm.Module.pushBinder", "Vuna/Compiler/Wasm/Module.vuna:97"));
  ("Wasm_dModule.v_reachableByRefs", ("Vuna.Compiler.Wasm.Module.reachableByRefs", "Vuna/Compiler/Wasm/Module.vuna:2035"));
  ("Wasm_dModule.v_refNullN", ("Vuna.Compiler.Wasm.Module.refNullN", "Vuna/Compiler/Wasm/Module.vuna:763"));
  ("Wasm_dModule.v_refNulls", ("Vuna.Compiler.Wasm.Module.refNulls", "Vuna/Compiler/Wasm/Module.vuna:1240"));
  ("Wasm_dModule.v_refsAllOf", ("Vuna.Compiler.Wasm.Module.refsAllOf", "Vuna/Compiler/Wasm/Module.vuna:2013"));
  ("Wasm_dModule.v_refsOf", ("Vuna.Compiler.Wasm.Module.refsOf", "Vuna/Compiler/Wasm/Module.vuna:1991"));
  ("Wasm_dModule.v_restoreFuncScope", ("Vuna.Compiler.Wasm.Module.restoreFuncScope", "Vuna/Compiler/Wasm/Module.vuna:505"));
  ("Wasm_dModule.v_restoreScope", ("Vuna.Compiler.Wasm.Module.restoreScope", "Vuna/Compiler/Wasm/Module.vuna:101"));
  ("Wasm_dModule.v_restoreTail", ("Vuna.Compiler.Wasm.Module.restoreTail", "Vuna/Compiler/Wasm/Module.vuna:922"));
  ("Wasm_dModule.v_resumeArm", ("Vuna.Compiler.Wasm.Module.resumeArm", "Vuna/Compiler/Wasm/Module.vuna:359"));
  ("Wasm_dModule.v_rtArrayFromListF", ("Vuna.Compiler.Wasm.Module.rtArrayFromListF", "Vuna/Compiler/Wasm/Module.vuna:1385"));
  ("Wasm_dModule.v_rtArrayToListF", ("Vuna.Compiler.Wasm.Module.rtArrayToListF", "Vuna/Compiler/Wasm/Module.vuna:1399"));
  ("Wasm_dModule.v_rtCompareFunc", ("Vuna.Compiler.Wasm.Module.rtCompareFunc", "Vuna/Compiler/Wasm/Module.vuna:1215"));
  ("Wasm_dModule.v_rtGetArgsF", ("Vuna.Compiler.Wasm.Module.rtGetArgsF", "Vuna/Compiler/Wasm/Module.vuna:1413"));
  ("Wasm_dModule.v_rtStrArgAtF", ("Vuna.Compiler.Wasm.Module.rtStrArgAtF", "Vuna/Compiler/Wasm/Module.vuna:1314"));
  ("Wasm_dModule.v_rtStrConcatManyF", ("Vuna.Compiler.Wasm.Module.rtStrConcatManyF", "Vuna/Compiler/Wasm/Module.vuna:1296"));
  ("Wasm_dModule.v_rtStrPackF", ("Vuna.Compiler.Wasm.Module.rtStrPackF", "Vuna/Compiler/Wasm/Module.vuna:1285"));
  ("Wasm_dModule.v_rtStrSubstTemplateF", ("Vuna.Compiler.Wasm.Module.rtStrSubstTemplateF", "Vuna/Compiler/Wasm/Module.vuna:1372"));
  ("Wasm_dModule.v_rtStrUnpackF", ("Vuna.Compiler.Wasm.Module.rtStrUnpackF", "Vuna/Compiler/Wasm/Module.vuna:1267"));
  ("Wasm_dModule.v_rtTryReadDirF", ("Vuna.Compiler.Wasm.Module.rtTryReadDirF", "Vuna/Compiler/Wasm/Module.vuna:1436"));
  ("Wasm_dModule.v_runtimeBinders", ("Vuna.Compiler.Wasm.Module.runtimeBinders", "Vuna/Compiler/Wasm/Module.vuna:105"));
  ("Wasm_dModule.v_rw", ("Vuna.Compiler.Wasm.Module.rw", "Vuna/Compiler/Wasm/Module.vuna:1855"));
  ("Wasm_dModule.v_rwAlt", ("Vuna.Compiler.Wasm.Module.rwAlt", "Vuna/Compiler/Wasm/Module.vuna:1911"));
  ("Wasm_dModule.v_rwAltMaybe", ("Vuna.Compiler.Wasm.Module.rwAltMaybe", "Vuna/Compiler/Wasm/Module.vuna:1914"));
  ("Wasm_dModule.v_rwDef", ("Vuna.Compiler.Wasm.Module.rwDef", "Vuna/Compiler/Wasm/Module.vuna:1918"));
  ("Wasm_dModule.v_rwField", ("Vuna.Compiler.Wasm.Module.rwField", "Vuna/Compiler/Wasm/Module.vuna:1908"));
  ("Wasm_dModule.v_rwSpine", ("Vuna.Compiler.Wasm.Module.rwSpine", "Vuna/Compiler/Wasm/Module.vuna:1890"));
  ("Wasm_dModule.v_scrutInstrs", ("Vuna.Compiler.Wasm.Module.scrutInstrs", "Vuna/Compiler/Wasm/Module.vuna:904"));
  ("Wasm_dModule.v_scrutSlot", ("Vuna.Compiler.Wasm.Module.scrutSlot", "Vuna/Compiler/Wasm/Module.vuna:901"));
  ("Wasm_dModule.v_sendTailOf", ("Vuna.Compiler.Wasm.Module.sendTailOf", "Vuna/Compiler/Wasm/Module.vuna:1875"));
  ("Wasm_dModule.v_spineOf", ("Vuna.Compiler.Wasm.Module.spineOf", "Vuna/Compiler/Wasm/Module.vuna:1817"));
  ("Wasm_dModule.v_splitAt", ("Vuna.Compiler.Wasm.Module.splitAt", "Vuna/Compiler/Wasm/Module.vuna:334"));
  ("Wasm_dModule.v_stDigits", ("Vuna.Compiler.Wasm.Module.stDigits", "Vuna/Compiler/Wasm/Module.vuna:1327"));
  ("Wasm_dModule.v_stNotPlaceholder", ("Vuna.Compiler.Wasm.Module.stNotPlaceholder", "Vuna/Compiler/Wasm/Module.vuna:1343"));
  ("Wasm_dModule.v_stripIrCasts", ("Vuna.Compiler.Wasm.Module.stripIrCasts", "Vuna/Compiler/Wasm/Module.vuna:1885"));
  ("Wasm_dModule.v_unboxLocalInt", ("Vuna.Compiler.Wasm.Module.unboxLocalInt", "Vuna/Compiler/Wasm/Module.vuna:657"));
  ("Wasm_dModule.v_wasmBridgeFuncs", ("Vuna.Compiler.Wasm.Module.wasmBridgeFuncs", "Vuna/Compiler/Wasm/Module.vuna:1252"));
  ("Wasm_dModule.v_wasmCompareFuncs", ("Vuna.Compiler.Wasm.Module.wasmCompareFuncs", "Vuna/Compiler/Wasm/Module.vuna:1231"));
  ("Wasm_dModule.v_wasmListTy", ("Vuna.Compiler.Wasm.Module.wasmListTy", "Vuna/Compiler/Wasm/Module.vuna:1243"));
  ("Wasm_dModule.v_wasmNilCell", ("Vuna.Compiler.Wasm.Module.wasmNilCell", "Vuna/Compiler/Wasm/Module.vuna:1246"));
  ("Wasm_dModule.v_watFuncNameOfF", ("Vuna.Compiler.Wasm.Module.watFuncNameOfF", "Vuna/Compiler/Wasm/Module.vuna:147"));
  ("Wasm_dModule.v_withTail", ("Vuna.Compiler.Wasm.Module.withTail", "Vuna/Compiler/Wasm/Module.vuna:118"));
  ("Wasm_dModule.v_zipIdx", ("Vuna.Compiler.Wasm.Module.zipIdx", "Vuna/Compiler/Wasm/Module.vuna:160"));
  ("Wasm_dRender.v_chunkBytes", ("Vuna.Compiler.Wasm.Render.chunkBytes", "Vuna/Compiler/Wasm/Render.vuna:80"));
  ("Wasm_dRender.v_chunkBytesGo", ("Vuna.Compiler.Wasm.Render.chunkBytesGo", "Vuna/Compiler/Wasm/Render.vuna:83"));
  ("Wasm_dRender.v_fitsLine", ("Vuna.Compiler.Wasm.Render.fitsLine", "Vuna/Compiler/Wasm/Render.vuna:27"));
  ("Wasm_dRender.v_flushWord", ("Vuna.Compiler.Wasm.Render.flushWord", "Vuna/Compiler/Wasm/Render.vuna:44"));
  ("Wasm_dRender.v_funcOpeningMulti", ("Vuna.Compiler.Wasm.Render.funcOpeningMulti", "Vuna/Compiler/Wasm/Render.vuna:334"));
  ("Wasm_dRender.v_funcOpeningOne", ("Vuna.Compiler.Wasm.Render.funcOpeningOne", "Vuna/Compiler/Wasm/Render.vuna:326"));
  ("Wasm_dRender.v_funcTypeMulti", ("Vuna.Compiler.Wasm.Render.funcTypeMulti", "Vuna/Compiler/Wasm/Render.vuna:230"));
  ("Wasm_dRender.v_funcTypeOne", ("Vuna.Compiler.Wasm.Render.funcTypeOne", "Vuna/Compiler/Wasm/Render.vuna:223"));
  ("Wasm_dRender.v_hex2", ("Vuna.Compiler.Wasm.Render.hex2", "Vuna/Compiler/Wasm/Render.vuna:67"));
  ("Wasm_dRender.v_hexDigit", ("Vuna.Compiler.Wasm.Render.hexDigit", "Vuna/Compiler/Wasm/Render.vuna:64"));
  ("Wasm_dRender.v_importMulti", ("Vuna.Compiler.Wasm.Render.importMulti", "Vuna/Compiler/Wasm/Render.vuna:297"));
  ("Wasm_dRender.v_importOne", ("Vuna.Compiler.Wasm.Render.importOne", "Vuna/Compiler/Wasm/Render.vuna:288"));
  ("Wasm_dRender.v_joinWith", ("Vuna.Compiler.Wasm.Render.joinWith", "Vuna/Compiler/Wasm/Render.vuna:30"));
  ("Wasm_dRender.v_lineOf", ("Vuna.Compiler.Wasm.Render.lineOf", "Vuna/Compiler/Wasm/Render.vuna:24"));
  ("Wasm_dRender.v_maxLine", ("Vuna.Compiler.Wasm.Render.maxLine", "Vuna/Compiler/Wasm/Render.vuna:18"));
  ("Wasm_dRender.v_moduleLines", ("Vuna.Compiler.Wasm.Render.moduleLines", "Vuna/Compiler/Wasm/Render.vuna:389"));
  ("Wasm_dRender.v_renderArrayType", ("Vuna.Compiler.Wasm.Render.renderArrayType", "Vuna/Compiler/Wasm/Render.vuna:279"));
  ("Wasm_dRender.v_renderBlock", ("Vuna.Compiler.Wasm.Render.renderBlock", "Vuna/Compiler/Wasm/Render.vuna:177"));
  ("Wasm_dRender.v_renderData", ("Vuna.Compiler.Wasm.Render.renderData", "Vuna/Compiler/Wasm/Render.vuna:372"));
  ("Wasm_dRender.v_renderElem", ("Vuna.Compiler.Wasm.Render.renderElem", "Vuna/Compiler/Wasm/Render.vuna:362"));
  ("Wasm_dRender.v_renderExport", ("Vuna.Compiler.Wasm.Render.renderExport", "Vuna/Compiler/Wasm/Render.vuna:355"));
  ("Wasm_dRender.v_renderField", ("Vuna.Compiler.Wasm.Render.renderField", "Vuna/Compiler/Wasm/Render.vuna:213"));
  ("Wasm_dRender.v_renderFunc", ("Vuna.Compiler.Wasm.Render.renderFunc", "Vuna/Compiler/Wasm/Render.vuna:343"));
  ("Wasm_dRender.v_renderFuncType", ("Vuna.Compiler.Wasm.Render.renderFuncType", "Vuna/Compiler/Wasm/Render.vuna:265"));
  ("Wasm_dRender.v_renderGlobal", ("Vuna.Compiler.Wasm.Render.renderGlobal", "Vuna/Compiler/Wasm/Render.vuna:320"));
  ("Wasm_dRender.v_renderIf", ("Vuna.Compiler.Wasm.Render.renderIf", "Vuna/Compiler/Wasm/Render.vuna:167"));
  ("Wasm_dRender.v_renderImport", ("Vuna.Compiler.Wasm.Render.renderImport", "Vuna/Compiler/Wasm/Render.vuna:317"));
  ("Wasm_dRender.v_renderInstr", ("Vuna.Compiler.Wasm.Render.renderInstr", "Vuna/Compiler/Wasm/Render.vuna:159"));
  ("Wasm_dRender.v_renderInstrFlat", ("Vuna.Compiler.Wasm.Render.renderInstrFlat", "Vuna/Compiler/Wasm/Render.vuna:96"));
  ("Wasm_dRender.v_renderInstrs", ("Vuna.Compiler.Wasm.Render.renderInstrs", "Vuna/Compiler/Wasm/Render.vuna:156"));
  ("Wasm_dRender.v_renderLoop", ("Vuna.Compiler.Wasm.Render.renderLoop", "Vuna/Compiler/Wasm/Render.vuna:183"));
  ("Wasm_dRender.v_renderModule", ("Vuna.Compiler.Wasm.Render.renderModule", "Vuna/Compiler/Wasm/Render.vuna:408"));
  ("Wasm_dRender.v_renderParam", ("Vuna.Compiler.Wasm.Render.renderParam", "Vuna/Compiler/Wasm/Render.vuna:207"));
  ("Wasm_dRender.v_renderResult", ("Vuna.Compiler.Wasm.Render.renderResult", "Vuna/Compiler/Wasm/Render.vuna:210"));
  ("Wasm_dRender.v_renderStructType", ("Vuna.Compiler.Wasm.Render.renderStructType", "Vuna/Compiler/Wasm/Render.vuna:272"));
  ("Wasm_dRender.v_renderTag", ("Vuna.Compiler.Wasm.Render.renderTag", "Vuna/Compiler/Wasm/Render.vuna:310"));
  ("Wasm_dRender.v_renderTryTable", ("Vuna.Compiler.Wasm.Render.renderTryTable", "Vuna/Compiler/Wasm/Render.vuna:191"));
  ("Wasm_dRender.v_renderType", ("Vuna.Compiler.Wasm.Render.renderType", "Vuna/Compiler/Wasm/Render.vuna:259"));
  ("Wasm_dRender.v_resultSuffix", ("Vuna.Compiler.Wasm.Render.resultSuffix", "Vuna/Compiler/Wasm/Render.vuna:92"));
  ("Wasm_dRender.v_sectionComment", ("Vuna.Compiler.Wasm.Render.sectionComment", "Vuna/Compiler/Wasm/Render.vuna:386"));
  ("Wasm_dRender.v_spaces", ("Vuna.Compiler.Wasm.Render.spaces", "Vuna/Compiler/Wasm/Render.vuna:21"));
  ("Wasm_dRender.v_structTypeMulti", ("Vuna.Compiler.Wasm.Render.structTypeMulti", "Vuna/Compiler/Wasm/Render.vuna:249"));
  ("Wasm_dRender.v_structTypeOne", ("Vuna.Compiler.Wasm.Render.structTypeOne", "Vuna/Compiler/Wasm/Render.vuna:243"));
  ("Wasm_dRender.v_watEscapeChar", ("Vuna.Compiler.Wasm.Render.watEscapeChar", "Vuna/Compiler/Wasm/Render.vuna:70"));
  ("Wasm_dRender.v_watString", ("Vuna.Compiler.Wasm.Render.watString", "Vuna/Compiler/Wasm/Render.vuna:76"));
  ("Wasm_dRender.v_wordsOf", ("Vuna.Compiler.Wasm.Render.wordsOf", "Vuna/Compiler/Wasm/Render.vuna:36"));
  ("Wasm_dRender.v_wordsOfGo", ("Vuna.Compiler.Wasm.Render.wordsOfGo", "Vuna/Compiler/Wasm/Render.vuna:39"));
  ("Wasm_dRender.v_wrapComment", ("Vuna.Compiler.Wasm.Render.wrapComment", "Vuna/Compiler/Wasm/Render.vuna:48"));
  ("Wasm_dRender.v_wrapWords", ("Vuna.Compiler.Wasm.Render.wrapWords", "Vuna/Compiler/Wasm/Render.vuna:51"));
  ("Wasm_dRuntime.v_binBool", ("Vuna.Compiler.Wasm.Runtime.binBool", "Vuna/Compiler/Wasm/Runtime.vuna:138"));
  ("Wasm_dRuntime.v_binInt", ("Vuna.Compiler.Wasm.Runtime.binInt", "Vuna/Compiler/Wasm/Runtime.vuna:124"));
  ("Wasm_dRuntime.v_boolValue", ("Vuna.Compiler.Wasm.Runtime.boolValue", "Vuna/Compiler/Wasm/Runtime.vuna:155"));
  ("Wasm_dRuntime.v_boxI64", ("Vuna.Compiler.Wasm.Runtime.boxI64", "Vuna/Compiler/Wasm/Runtime.vuna:210"));
  ("Wasm_dRuntime.v_boxInt", ("Vuna.Compiler.Wasm.Runtime.boxInt", "Vuna/Compiler/Wasm/Runtime.vuna:118"));
  ("Wasm_dRuntime.v_cat", ("Vuna.Compiler.Wasm.Runtime.cat", "Vuna/Compiler/Wasm/Runtime.vuna:70"));
  ("Wasm_dRuntime.v_cmpInt", ("Vuna.Compiler.Wasm.Runtime.cmpInt", "Vuna/Compiler/Wasm/Runtime.vuna:131"));
  ("Wasm_dRuntime.v_cpsParams", ("Vuna.Compiler.Wasm.Runtime.cpsParams", "Vuna/Compiler/Wasm/Runtime.vuna:1842"));
  ("Wasm_dRuntime.v_dataSegmentName", ("Vuna.Compiler.Wasm.Runtime.dataSegmentName", "Vuna/Compiler/Wasm/Runtime.vuna:161"));
  ("Wasm_dRuntime.v_emptyStrInstrs", ("Vuna.Compiler.Wasm.Runtime.emptyStrInstrs", "Vuna/Compiler/Wasm/Runtime.vuna:207"));
  ("Wasm_dRuntime.v_errnoEq", ("Vuna.Compiler.Wasm.Runtime.errnoEq", "Vuna/Compiler/Wasm/Runtime.vuna:282"));
  ("Wasm_dRuntime.v_escapePair", ("Vuna.Compiler.Wasm.Runtime.escapePair", "Vuna/Compiler/Wasm/Runtime.vuna:1247"));
  ("Wasm_dRuntime.v_escapeStepAll", ("Vuna.Compiler.Wasm.Runtime.escapeStepAll", "Vuna/Compiler/Wasm/Runtime.vuna:1256"));
  ("Wasm_dRuntime.v_failWithConst", ("Vuna.Compiler.Wasm.Runtime.failWithConst", "Vuna/Compiler/Wasm/Runtime.vuna:1308"));
  ("Wasm_dRuntime.v_localP", ("Vuna.Compiler.Wasm.Runtime.localP", "Vuna/Compiler/Wasm/Runtime.vuna:73"));
  ("Wasm_dRuntime.v_maxInt63", ("Vuna.Compiler.Wasm.Runtime.maxInt63", "Vuna/Compiler/Wasm/Runtime.vuna:1413"));
  ("Wasm_dRuntime.v_mkString", ("Vuna.Compiler.Wasm.Runtime.mkString", "Vuna/Compiler/Wasm/Runtime.vuna:164"));
  ("Wasm_dRuntime.v_readRights", ("Vuna.Compiler.Wasm.Runtime.readRights", "Vuna/Compiler/Wasm/Runtime.vuna:201"));
  ("Wasm_dRuntime.v_rtApply", ("Vuna.Compiler.Wasm.Runtime.rtApply", "Vuna/Compiler/Wasm/Runtime.vuna:79"));
  ("Wasm_dRuntime.v_rtArrayGet", ("Vuna.Compiler.Wasm.Runtime.rtArrayGet", "Vuna/Compiler/Wasm/Runtime.vuna:1129"));
  ("Wasm_dRuntime.v_rtArrayLength", ("Vuna.Compiler.Wasm.Runtime.rtArrayLength", "Vuna/Compiler/Wasm/Runtime.vuna:1120"));
  ("Wasm_dRuntime.v_rtArrayMake", ("Vuna.Compiler.Wasm.Runtime.rtArrayMake", "Vuna/Compiler/Wasm/Runtime.vuna:1154"));
  ("Wasm_dRuntime.v_rtArrayOob", ("Vuna.Compiler.Wasm.Runtime.rtArrayOob", "Vuna/Compiler/Wasm/Runtime.vuna:996"));
  ("Wasm_dRuntime.v_rtArraySet", ("Vuna.Compiler.Wasm.Runtime.rtArraySet", "Vuna/Compiler/Wasm/Runtime.vuna:1139"));
  ("Wasm_dRuntime.v_rtAssert", ("Vuna.Compiler.Wasm.Runtime.rtAssert", "Vuna/Compiler/Wasm/Runtime.vuna:1321"));
  ("Wasm_dRuntime.v_rtBitNot", ("Vuna.Compiler.Wasm.Runtime.rtBitNot", "Vuna/Compiler/Wasm/Runtime.vuna:1796"));
  ("Wasm_dRuntime.v_rtBitShl", ("Vuna.Compiler.Wasm.Runtime.rtBitShl", "Vuna/Compiler/Wasm/Runtime.vuna:1815"));
  ("Wasm_dRuntime.v_rtBitShr", ("Vuna.Compiler.Wasm.Runtime.rtBitShr", "Vuna/Compiler/Wasm/Runtime.vuna:1825"));
  ("Wasm_dRuntime.v_rtBoxZero", ("Vuna.Compiler.Wasm.Runtime.rtBoxZero", "Vuna/Compiler/Wasm/Runtime.vuna:1652"));
  ("Wasm_dRuntime.v_rtBoxZero2", ("Vuna.Compiler.Wasm.Runtime.rtBoxZero2", "Vuna/Compiler/Wasm/Runtime.vuna:1723"));
  ("Wasm_dRuntime.v_rtCleanupPop", ("Vuna.Compiler.Wasm.Runtime.rtCleanupPop", "Vuna/Compiler/Wasm/Runtime.vuna:1763"));
  ("Wasm_dRuntime.v_rtCleanupPush", ("Vuna.Compiler.Wasm.Runtime.rtCleanupPush", "Vuna/Compiler/Wasm/Runtime.vuna:1744"));
  ("Wasm_dRuntime.v_rtCmpF64", ("Vuna.Compiler.Wasm.Runtime.rtCmpF64", "Vuna/Compiler/Wasm/Runtime.vuna:1699"));
  ("Wasm_dRuntime.v_rtCmpI32", ("Vuna.Compiler.Wasm.Runtime.rtCmpI32", "Vuna/Compiler/Wasm/Runtime.vuna:1667"));
  ("Wasm_dRuntime.v_rtCmpI64", ("Vuna.Compiler.Wasm.Runtime.rtCmpI64", "Vuna/Compiler/Wasm/Runtime.vuna:1683"));
  ("Wasm_dRuntime.v_rtConstFalse1", ("Vuna.Compiler.Wasm.Runtime.rtConstFalse1", "Vuna/Compiler/Wasm/Runtime.vuna:1659"));
  ("Wasm_dRuntime.v_rtCpsUnhandled", ("Vuna.Compiler.Wasm.Runtime.rtCpsUnhandled", "Vuna/Compiler/Wasm/Runtime.vuna:1846"));
  ("Wasm_dRuntime.v_rtCpsUnhandled2", ("Vuna.Compiler.Wasm.Runtime.rtCpsUnhandled2", "Vuna/Compiler/Wasm/Runtime.vuna:1851"));
  ("Wasm_dRuntime.v_rtDiv", ("Vuna.Compiler.Wasm.Runtime.rtDiv", "Vuna/Compiler/Wasm/Runtime.vuna:1311"));
  ("Wasm_dRuntime.v_rtEffExit", ("Vuna.Compiler.Wasm.Runtime.rtEffExit", "Vuna/Compiler/Wasm/Runtime.vuna:1048"));
  ("Wasm_dRuntime.v_rtEffNewRef", ("Vuna.Compiler.Wasm.Runtime.rtEffNewRef", "Vuna/Compiler/Wasm/Runtime.vuna:1011"));
  ("Wasm_dRuntime.v_rtEffPrint", ("Vuna.Compiler.Wasm.Runtime.rtEffPrint", "Vuna/Compiler/Wasm/Runtime.vuna:1039"));
  ("Wasm_dRuntime.v_rtEffReadRef", ("Vuna.Compiler.Wasm.Runtime.rtEffReadRef", "Vuna/Compiler/Wasm/Runtime.vuna:1020"));
  ("Wasm_dRuntime.v_rtEffWriteRef", ("Vuna.Compiler.Wasm.Runtime.rtEffWriteRef", "Vuna/Compiler/Wasm/Runtime.vuna:1029"));
  ("Wasm_dRuntime.v_rtEffectId", ("Vuna.Compiler.Wasm.Runtime.rtEffectId", "Vuna/Compiler/Wasm/Runtime.vuna:1584"));
  ("Wasm_dRuntime.v_rtEmptyStr", ("Vuna.Compiler.Wasm.Runtime.rtEmptyStr", "Vuna/Compiler/Wasm/Runtime.vuna:479"));
  ("Wasm_dRuntime.v_rtEqStr", ("Vuna.Compiler.Wasm.Runtime.rtEqStr", "Vuna/Compiler/Wasm/Runtime.vuna:1602"));
  ("Wasm_dRuntime.v_rtErase", ("Vuna.Compiler.Wasm.Runtime.rtErase", "Vuna/Compiler/Wasm/Runtime.vuna:1347"));
  ("Wasm_dRuntime.v_rtErrno", ("Vuna.Compiler.Wasm.Runtime.rtErrno", "Vuna/Compiler/Wasm/Runtime.vuna:285"));
  ("Wasm_dRuntime.v_rtExecPath", ("Vuna.Compiler.Wasm.Runtime.rtExecPath", "Vuna/Compiler/Wasm/Runtime.vuna:950"));
  ("Wasm_dRuntime.v_rtFailStr", ("Vuna.Compiler.Wasm.Runtime.rtFailStr", "Vuna/Compiler/Wasm/Runtime.vuna:985"));
  ("Wasm_dRuntime.v_rtFdReadAll", ("Vuna.Compiler.Wasm.Runtime.rtFdReadAll", "Vuna/Compiler/Wasm/Runtime.vuna:450"));
  ("Wasm_dRuntime.v_rtFileExists", ("Vuna.Compiler.Wasm.Runtime.rtFileExists", "Vuna/Compiler/Wasm/Runtime.vuna:626"));
  ("Wasm_dRuntime.v_rtFileMtime", ("Vuna.Compiler.Wasm.Runtime.rtFileMtime", "Vuna/Compiler/Wasm/Runtime.vuna:644"));
  ("Wasm_dRuntime.v_rtFileSize", ("Vuna.Compiler.Wasm.Runtime.rtFileSize", "Vuna/Compiler/Wasm/Runtime.vuna:651"));
  ("Wasm_dRuntime.v_rtFloatAbs", ("Vuna.Compiler.Wasm.Runtime.rtFloatAbs", "Vuna/Compiler/Wasm/Runtime.vuna:1097"));
  ("Wasm_dRuntime.v_rtFloatBin", ("Vuna.Compiler.Wasm.Runtime.rtFloatBin", "Vuna/Compiler/Wasm/Runtime.vuna:1079"));
  ("Wasm_dRuntime.v_rtFloatCmp", ("Vuna.Compiler.Wasm.Runtime.rtFloatCmp", "Vuna/Compiler/Wasm/Runtime.vuna:1088"));
  ("Wasm_dRuntime.v_rtFloatFromInt", ("Vuna.Compiler.Wasm.Runtime.rtFloatFromInt", "Vuna/Compiler/Wasm/Runtime.vuna:1061"));
  ("Wasm_dRuntime.v_rtFloatSqrt", ("Vuna.Compiler.Wasm.Runtime.rtFloatSqrt", "Vuna/Compiler/Wasm/Runtime.vuna:1106"));
  ("Wasm_dRuntime.v_rtFunc", ("Vuna.Compiler.Wasm.Runtime.rtFunc", "Vuna/Compiler/Wasm/Runtime.vuna:76"));
  ("Wasm_dRuntime.v_rtFunctions", ("Vuna.Compiler.Wasm.Runtime.rtFunctions", "Vuna/Compiler/Wasm/Runtime.vuna:1865"));
  ("Wasm_dRuntime.v_rtGenericCmp", ("Vuna.Compiler.Wasm.Runtime.rtGenericCmp", "Vuna/Compiler/Wasm/Runtime.vuna:1716"));
  ("Wasm_dRuntime.v_rtGetCwd", ("Vuna.Compiler.Wasm.Runtime.rtGetCwd", "Vuna/Compiler/Wasm/Runtime.vuna:947"));
  ("Wasm_dRuntime.v_rtGetEnv", ("Vuna.Compiler.Wasm.Runtime.rtGetEnv", "Vuna/Compiler/Wasm/Runtime.vuna:875"));
  ("Wasm_dRuntime.v_rtHostStatus", ("Vuna.Compiler.Wasm.Runtime.rtHostStatus", "Vuna/Compiler/Wasm/Runtime.vuna:865"));
  ("Wasm_dRuntime.v_rtHostTrap", ("Vuna.Compiler.Wasm.Runtime.rtHostTrap", "Vuna/Compiler/Wasm/Runtime.vuna:1730"));
  ("Wasm_dRuntime.v_rtImplOf", ("Vuna.Compiler.Wasm.Runtime.rtImplOf", "Vuna/Compiler/Wasm/Runtime.vuna:1995"));
  ("Wasm_dRuntime.v_rtIntFromFloat", ("Vuna.Compiler.Wasm.Runtime.rtIntFromFloat", "Vuna/Compiler/Wasm/Runtime.vuna:1070"));
  ("Wasm_dRuntime.v_rtMRunEff", ("Vuna.Compiler.Wasm.Runtime.rtMRunEff", "Vuna/Compiler/Wasm/Runtime.vuna:103"));
  ("Wasm_dRuntime.v_rtMemToStr", ("Vuna.Compiler.Wasm.Runtime.rtMemToStr", "Vuna/Compiler/Wasm/Runtime.vuna:261"));
  ("Wasm_dRuntime.v_rtNatAdd", ("Vuna.Compiler.Wasm.Runtime.rtNatAdd", "Vuna/Compiler/Wasm/Runtime.vuna:1416"));
  ("Wasm_dRuntime.v_rtNatDiv", ("Vuna.Compiler.Wasm.Runtime.rtNatDiv", "Vuna/Compiler/Wasm/Runtime.vuna:1455"));
  ("Wasm_dRuntime.v_rtNatFromInt", ("Vuna.Compiler.Wasm.Runtime.rtNatFromInt", "Vuna/Compiler/Wasm/Runtime.vuna:1473"));
  ("Wasm_dRuntime.v_rtNatMul", ("Vuna.Compiler.Wasm.Runtime.rtNatMul", "Vuna/Compiler/Wasm/Runtime.vuna:1436"));
  ("Wasm_dRuntime.v_rtNatSub", ("Vuna.Compiler.Wasm.Runtime.rtNatSub", "Vuna/Compiler/Wasm/Runtime.vuna:1426"));
  ("Wasm_dRuntime.v_rtNatSucc", ("Vuna.Compiler.Wasm.Runtime.rtNatSucc", "Vuna/Compiler/Wasm/Runtime.vuna:1400"));
  ("Wasm_dRuntime.v_rtNatToInt", ("Vuna.Compiler.Wasm.Runtime.rtNatToInt", "Vuna/Compiler/Wasm/Runtime.vuna:1466"));
  ("Wasm_dRuntime.v_rtNeqStr", ("Vuna.Compiler.Wasm.Runtime.rtNeqStr", "Vuna/Compiler/Wasm/Runtime.vuna:1635"));
  ("Wasm_dRuntime.v_rtObsSpan", ("Vuna.Compiler.Wasm.Runtime.rtObsSpan", "Vuna/Compiler/Wasm/Runtime.vuna:1781"));
  ("Wasm_dRuntime.v_rtObsSpanLab", ("Vuna.Compiler.Wasm.Runtime.rtObsSpanLab", "Vuna/Compiler/Wasm/Runtime.vuna:1789"));
  ("Wasm_dRuntime.v_rtPathCopyRel", ("Vuna.Compiler.Wasm.Runtime.rtPathCopyRel", "Vuna/Compiler/Wasm/Runtime.vuna:216"));
  ("Wasm_dRuntime.v_rtPathLen", ("Vuna.Compiler.Wasm.Runtime.rtPathLen", "Vuna/Compiler/Wasm/Runtime.vuna:390"));
  ("Wasm_dRuntime.v_rtPathOpen", ("Vuna.Compiler.Wasm.Runtime.rtPathOpen", "Vuna/Compiler/Wasm/Runtime.vuna:414"));
  ("Wasm_dRuntime.v_rtPrimFail", ("Vuna.Compiler.Wasm.Runtime.rtPrimFail", "Vuna/Compiler/Wasm/Runtime.vuna:1331"));
  ("Wasm_dRuntime.v_rtPrintln", ("Vuna.Compiler.Wasm.Runtime.rtPrintln", "Vuna/Compiler/Wasm/Runtime.vuna:976"));
  ("Wasm_dRuntime.v_rtResumeTwice", ("Vuna.Compiler.Wasm.Runtime.rtResumeTwice", "Vuna/Compiler/Wasm/Runtime.vuna:1839"));
  ("Wasm_dRuntime.v_rtShowBool", ("Vuna.Compiler.Wasm.Runtime.rtShowBool", "Vuna/Compiler/Wasm/Runtime.vuna:1232"));
  ("Wasm_dRuntime.v_rtShowInt", ("Vuna.Compiler.Wasm.Runtime.rtShowInt", "Vuna/Compiler/Wasm/Runtime.vuna:1229"));
  ("Wasm_dRuntime.v_rtShowStr", ("Vuna.Compiler.Wasm.Runtime.rtShowStr", "Vuna/Compiler/Wasm/Runtime.vuna:1263"));
  ("Wasm_dRuntime.v_rtStatErr", ("Vuna.Compiler.Wasm.Runtime.rtStatErr", "Vuna/Compiler/Wasm/Runtime.vuna:483"));
  ("Wasm_dRuntime.v_rtStrAt", ("Vuna.Compiler.Wasm.Runtime.rtStrAt", "Vuna/Compiler/Wasm/Runtime.vuna:1495"));
  ("Wasm_dRuntime.v_rtStrConcat", ("Vuna.Compiler.Wasm.Runtime.rtStrConcat", "Vuna/Compiler/Wasm/Runtime.vuna:1353"));
  ("Wasm_dRuntime.v_rtStrFromInt", ("Vuna.Compiler.Wasm.Runtime.rtStrFromInt", "Vuna/Compiler/Wasm/Runtime.vuna:1164"));
  ("Wasm_dRuntime.v_rtStrHash", ("Vuna.Compiler.Wasm.Runtime.rtStrHash", "Vuna/Compiler/Wasm/Runtime.vuna:1565"));
  ("Wasm_dRuntime.v_rtStrLength", ("Vuna.Compiler.Wasm.Runtime.rtStrLength", "Vuna/Compiler/Wasm/Runtime.vuna:1486"));
  ("Wasm_dRuntime.v_rtSubstring", ("Vuna.Compiler.Wasm.Runtime.rtSubstring", "Vuna/Compiler/Wasm/Runtime.vuna:1525"));
  ("Wasm_dRuntime.v_rtTimeUs", ("Vuna.Compiler.Wasm.Runtime.rtTimeUs", "Vuna/Compiler/Wasm/Runtime.vuna:953"));
  ("Wasm_dRuntime.v_rtTodo", ("Vuna.Compiler.Wasm.Runtime.rtTodo", "Vuna/Compiler/Wasm/Runtime.vuna:1338"));
  ("Wasm_dRuntime.v_rtTryIsDirectory", ("Vuna.Compiler.Wasm.Runtime.rtTryIsDirectory", "Vuna/Compiler/Wasm/Runtime.vuna:599"));
  ("Wasm_dRuntime.v_rtTryMakeDir", ("Vuna.Compiler.Wasm.Runtime.rtTryMakeDir", "Vuna/Compiler/Wasm/Runtime.vuna:676"));
  ("Wasm_dRuntime.v_rtTryMakeDirExclusive", ("Vuna.Compiler.Wasm.Runtime.rtTryMakeDirExclusive", "Vuna/Compiler/Wasm/Runtime.vuna:710"));
  ("Wasm_dRuntime.v_rtTryReadFile", ("Vuna.Compiler.Wasm.Runtime.rtTryReadFile", "Vuna/Compiler/Wasm/Runtime.vuna:503"));
  ("Wasm_dRuntime.v_rtTryRemoveFile", ("Vuna.Compiler.Wasm.Runtime.rtTryRemoveFile", "Vuna/Compiler/Wasm/Runtime.vuna:745"));
  ("Wasm_dRuntime.v_rtTryRemoveTree", ("Vuna.Compiler.Wasm.Runtime.rtTryRemoveTree", "Vuna/Compiler/Wasm/Runtime.vuna:779"));
  ("Wasm_dRuntime.v_rtTryRename", ("Vuna.Compiler.Wasm.Runtime.rtTryRename", "Vuna/Compiler/Wasm/Runtime.vuna:826"));
  ("Wasm_dRuntime.v_rtTryWriteFile", ("Vuna.Compiler.Wasm.Runtime.rtTryWriteFile", "Vuna/Compiler/Wasm/Runtime.vuna:545"));
  ("Wasm_dRuntime.v_rtTryWriteFileAtomic", ("Vuna.Compiler.Wasm.Runtime.rtTryWriteFileAtomic", "Vuna/Compiler/Wasm/Runtime.vuna:581"));
  ("Wasm_dRuntime.v_rtWrite", ("Vuna.Compiler.Wasm.Runtime.rtWrite", "Vuna/Compiler/Wasm/Runtime.vuna:379"));
  ("Wasm_dRuntime.v_rtWriteChunked", ("Vuna.Compiler.Wasm.Runtime.rtWriteChunked", "Vuna/Compiler/Wasm/Runtime.vuna:297"));
  ("Wasm_dRuntime.v_shiftCountOk", ("Vuna.Compiler.Wasm.Runtime.shiftCountOk", "Vuna/Compiler/Wasm/Runtime.vuna:1803"));
  ("Wasm_dRuntime.v_unboxInt", ("Vuna.Compiler.Wasm.Runtime.unboxInt", "Vuna/Compiler/Wasm/Runtime.vuna:115"));
  ("Wasm_dRuntime.v_wasiAux", ("Vuna.Compiler.Wasm.Runtime.wasiAux", "Vuna/Compiler/Wasm/Runtime.vuna:197"));
  ("Wasm_dRuntime.v_wasiDir", ("Vuna.Compiler.Wasm.Runtime.wasiDir", "Vuna/Compiler/Wasm/Runtime.vuna:191"));
  ("Wasm_dRuntime.v_wasiDirCap", ("Vuna.Compiler.Wasm.Runtime.wasiDirCap", "Vuna/Compiler/Wasm/Runtime.vuna:194"));
  ("Wasm_dRuntime.v_wasiIo", ("Vuna.Compiler.Wasm.Runtime.wasiIo", "Vuna/Compiler/Wasm/Runtime.vuna:182"));
  ("Wasm_dRuntime.v_wasiIoCap", ("Vuna.Compiler.Wasm.Runtime.wasiIoCap", "Vuna/Compiler/Wasm/Runtime.vuna:185"));
  ("Wasm_dRuntime.v_wasiIov", ("Vuna.Compiler.Wasm.Runtime.wasiIov", "Vuna/Compiler/Wasm/Runtime.vuna:170"));
  ("Wasm_dRuntime.v_wasiN", ("Vuna.Compiler.Wasm.Runtime.wasiN", "Vuna/Compiler/Wasm/Runtime.vuna:173"));
  ("Wasm_dRuntime.v_wasiPath1", ("Vuna.Compiler.Wasm.Runtime.wasiPath1", "Vuna/Compiler/Wasm/Runtime.vuna:176"));
  ("Wasm_dRuntime.v_wasiPath2", ("Vuna.Compiler.Wasm.Runtime.wasiPath2", "Vuna/Compiler/Wasm/Runtime.vuna:179"));
  ("Wasm_dRuntime.v_wasiStat", ("Vuna.Compiler.Wasm.Runtime.wasiStat", "Vuna/Compiler/Wasm/Runtime.vuna:188"));
  ("Wasm_dRuntime.v_wrap63", ("Vuna.Compiler.Wasm.Runtime.wrap63", "Vuna/Compiler/Wasm/Runtime.vuna:121"));
  ("Wasm_dRuntime.v_writeRights", ("Vuna.Compiler.Wasm.Runtime.writeRights", "Vuna/Compiler/Wasm/Runtime.vuna:204"));
  ("Wasm_dTypes.v_ctorEntriesOf", ("Vuna.Compiler.Wasm.Types.ctorEntriesOf", "Vuna/Compiler/Wasm/Types.vuna:79"));
  ("Wasm_dTypes.v_ctorEntriesOfGo", ("Vuna.Compiler.Wasm.Types.ctorEntriesOfGo", "Vuna/Compiler/Wasm/Types.vuna:82"));
  ("Wasm_dTypes.v_famOfDecl", ("Vuna.Compiler.Wasm.Types.famOfDecl", "Vuna/Compiler/Wasm/Types.vuna:94"));
  ("Wasm_dTypes.v_isWatNameChar", ("Vuna.Compiler.Wasm.Types.isWatNameChar", "Vuna/Compiler/Wasm/Types.vuna:50"));
  ("Wasm_dTypes.v_maxCtorFields", ("Vuna.Compiler.Wasm.Types.maxCtorFields", "Vuna/Compiler/Wasm/Types.vuna:87"));
  ("Wasm_dTypes.v_repeatField", ("Vuna.Compiler.Wasm.Types.repeatField", "Vuna/Compiler/Wasm/Types.vuna:147"));
  ("Wasm_dTypes.v_wasmCtorFieldCountOf", ("Vuna.Compiler.Wasm.Types.wasmCtorFieldCountOf", "Vuna/Compiler/Wasm/Types.vuna:118"));
  ("Wasm_dTypes.v_wasmCtorFieldGo", ("Vuna.Compiler.Wasm.Types.wasmCtorFieldGo", "Vuna/Compiler/Wasm/Types.vuna:121"));
  ("Wasm_dTypes.v_wasmCtorTagGo", ("Vuna.Compiler.Wasm.Types.wasmCtorTagGo", "Vuna/Compiler/Wasm/Types.vuna:113"));
  ("Wasm_dTypes.v_wasmCtorTagOf", ("Vuna.Compiler.Wasm.Types.wasmCtorTagOf", "Vuna/Compiler/Wasm/Types.vuna:110"));
  ("Wasm_dTypes.v_wasmFamFields", ("Vuna.Compiler.Wasm.Types.wasmFamFields", "Vuna/Compiler/Wasm/Types.vuna:140"));
  ("Wasm_dTypes.v_wasmFamLookup", ("Vuna.Compiler.Wasm.Types.wasmFamLookup", "Vuna/Compiler/Wasm/Types.vuna:106"));
  ("Wasm_dTypes.v_wasmFamType", ("Vuna.Compiler.Wasm.Types.wasmFamType", "Vuna/Compiler/Wasm/Types.vuna:151"));
  ("Wasm_dTypes.v_wasmFamsOf", ("Vuna.Compiler.Wasm.Types.wasmFamsOf", "Vuna/Compiler/Wasm/Types.vuna:103"));
  ("Wasm_dTypes.v_wasmIsRecordFam", ("Vuna.Compiler.Wasm.Types.wasmIsRecordFam", "Vuna/Compiler/Wasm/Types.vuna:134"));
  ("Wasm_dTypes.v_wasmListFamFromFams", ("Vuna.Compiler.Wasm.Types.wasmListFamFromFams", "Vuna/Compiler/Wasm/Types.vuna:166"));
  ("Wasm_dTypes.v_wasmRecordFieldGo", ("Vuna.Compiler.Wasm.Types.wasmRecordFieldGo", "Vuna/Compiler/Wasm/Types.vuna:129"));
  ("Wasm_dTypes.v_wasmRecordFieldIndex", ("Vuna.Compiler.Wasm.Types.wasmRecordFieldIndex", "Vuna/Compiler/Wasm/Types.vuna:126"));
  ("Wasm_dTypes.v_watDataNameOf", ("Vuna.Compiler.Wasm.Types.watDataNameOf", "Vuna/Compiler/Wasm/Types.vuna:73"));
  ("Wasm_dTypes.v_watFamName", ("Vuna.Compiler.Wasm.Types.watFamName", "Vuna/Compiler/Wasm/Types.vuna:61"));
  ("Wasm_dTypes.v_watFuncNameOf", ("Vuna.Compiler.Wasm.Types.watFuncNameOf", "Vuna/Compiler/Wasm/Types.vuna:65"));
  ("Wasm_dTypes.v_watGlobalNameOf", ("Vuna.Compiler.Wasm.Types.watGlobalNameOf", "Vuna/Compiler/Wasm/Types.vuna:69"));
  ("Wasm_dTypes.v_watName", ("Vuna.Compiler.Wasm.Types.watName", "Vuna/Compiler/Wasm/Types.vuna:57"));
  ("Wasm_dTypes.v_watNameChar", ("Vuna.Compiler.Wasm.Types.watNameChar", "Vuna/Compiler/Wasm/Types.vuna:53"));
]
let rec dt_frame_parts parts =
  match parts with
  | [] -> []
  | "(fun)" :: rest -> dt_frame_parts rest
  | p :: rest -> p :: dt_frame_parts rest
let dt_frame_key nm =
  match dt_frame_parts (List.rev (String.split_on_char '.' nm)) with
  | value :: unit :: _ -> Some (unit ^ "." ^ value)
  | _ -> None
let dt_frame_label slot =
  match Printexc.Slot.name slot with
  | None -> None
  | Some nm ->
    match dt_frame_key nm with
    | None -> None
    | Some key ->
      (match List.assoc_opt key dt_def_locs with
       | Some (display, loc) -> Some (display ^ " (" ^ loc ^ ")")
       | None -> None)
let dt_bt_labels (bt : Printexc.raw_backtrace) : string list =
  match Printexc.backtrace_slots bt with
  | None -> []
  | Some slots ->
    let rec go rest shown last acc =
      if shown >= 12 then List.rev acc
      else match rest with
      | [] -> List.rev acc
      | slot :: tl ->
        (match dt_frame_label slot with
         | Some s -> if s = last then go tl shown last acc else go tl (shown + 1) s (s :: acc)
         | None -> go tl shown last acc)
    in go (Array.to_list slots) 0 "" []
let dt_report_exn e bt =
  let msg = match e with Effect.Unhandled (Perform (_, _, key, name, _)) -> Printf.sprintf "unhandled effect %s (instance %s)" key name | Failure m -> m | _ -> Printexc.to_string e in
  Printf.eprintf "vuna: runtime error: %s\n%!" msg;
  List.iter (fun s -> Printf.eprintf "  at %s\n%!" s) (dt_bt_labels bt)
let dtp_debug_on_lazy = lazy (
  let has f = Array.exists (fun a -> a = f) Sys.argv in
  has "--debug-perf" || (try Sys.getenv "VUNA_DEBUG_PERF" = "1" with Not_found -> false))
let dtp_debug_on (_ : int) = Lazy.force dtp_debug_on_lazy
let dtp_debug_line (s : string) =
  Printf.eprintf "DEBUG %d %s
%!" (dtp_timeUs ()) s;
  0
(* ------------------------------------------------------------------ *)
(* vuna observability runtime (generated; see docs/reference/          *)
(* observability.md). Off by default: a probe pays one Lazy.force.     *)
(* Events are Chrome Trace Event JSONL, one object per line.           *)
(*                                                                     *)
(* This text is embedded verbatim in Codegen.Term.dtObsRuntime. It      *)
(* therefore contains NO backslash characters and NO line comments:    *)
(* every quote is built from Char.chr 34 so the surrounding vuna string *)
(* literal stays straightforward to escape.                            *)
(* ------------------------------------------------------------------ *)
let dtp_obs_qc = Char.chr 34
let dtp_obs_bs = Char.chr 92
let dtp_obs_nl = Char.chr 10
let dtp_obs_colon = Char.chr 58
let dtp_obs_comma = Char.chr 44
let dtp_obs_lb = Char.chr 123
let dtp_obs_rb = Char.chr 125
let dtp_obs_ls = Char.chr 91
let dtp_obs_rs = Char.chr 93

let dtp_obs_level_lazy = lazy (
  let env =
    match int_of_string_opt (try Sys.getenv "VUNA_OBS" with Not_found -> "") with
    | Some n -> n
    | None -> 0
  in
  let rec scan i acc =
    let n = Array.length Sys.argv in
    if i >= n then acc
    else if Sys.argv.(i) = "--obs" then scan (i + 1) (if acc > 2 then acc else 2)
    else if Sys.argv.(i) = "--obs-level" && i + 1 < n then
      (match int_of_string_opt Sys.argv.(i + 1) with
       | Some v -> scan (i + 2) v
       | None -> scan (i + 2) acc)
    else if String.length Sys.argv.(i) > 11 && String.sub Sys.argv.(i) 0 11 = "--obs-level" then
      (match int_of_string_opt (String.sub Sys.argv.(i) 12 (String.length Sys.argv.(i) - 12)) with
       | Some v -> scan (i + 1) v
       | None -> scan (i + 1) acc)
    else scan (i + 1) acc
  in
  let l = scan 1 env in
  if l < 0 then 0 else if l > 3 then 3 else l)

let dtp_obs_level (_ : int) = Lazy.force dtp_obs_level_lazy
let dtp_obs_on () = Lazy.force dtp_obs_level_lazy > 0
let dtp_obs_tid () = let t = !dtp_sched_current in if t < 0 then 0 else t

let dtp_obs_esc b (s : string) =
  String.iter
    (fun c ->
      if Char.code c = 34 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b dtp_obs_qc end
      else if Char.code c = 92 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b dtp_obs_bs end
      else if Char.code c = 10 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b (Char.chr 110) end
      else if Char.code c = 13 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b (Char.chr 114) end
      else if Char.code c = 9 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b (Char.chr 116) end
      else if Char.code c < 32 then begin
        Buffer.add_char b dtp_obs_bs;
        Buffer.add_char b (Char.chr 117);
        Buffer.add_string b (Printf.sprintf "%04x" (Char.code c))
      end
      else Buffer.add_char b c)
    s

let dtp_obs_key b (k : string) =
  Buffer.add_char b dtp_obs_qc;
  dtp_obs_esc b k;
  Buffer.add_char b dtp_obs_qc;
  Buffer.add_char b dtp_obs_colon

let dtp_obs_str b (s : string) =
  Buffer.add_char b dtp_obs_qc;
  dtp_obs_esc b s;
  Buffer.add_char b dtp_obs_qc

let dtp_obs_int b (n : int) = Buffer.add_string b (string_of_int n)


let dtp_obs_sink_path () =
  match Sys.getenv_opt "VUNA_OBS_FILE" with
  | Some p when p <> "" -> p
  | _ ->
    let d =
      match Sys.getenv_opt "VUNA_OBS_DIR" with
      | Some d when d <> "" -> d
      | _ -> Filename.concat (Filename.get_temp_dir_name ()) "vuna-obs"
    in
    Filename.concat d ("vuna-" ^ string_of_int (Unix.getpid ()) ^ ".jsonl")

let dtp_obs_chan : out_channel option ref = ref None
let dtp_obs_started = ref false
let dtp_obs_warned = ref false
let dtp_obs_count = ref 0
let dtp_obs_buf = Buffer.create 8192

let dtp_obs_open () =
  match !dtp_obs_chan with
  | Some c -> Some c
  | None ->
    let path = dtp_obs_sink_path () in
    let dir = Filename.dirname path in
    (try if not (Sys.file_exists dir) then Unix.mkdir dir 0o755 with _ -> ());
    (match (try Some (open_out_bin path) with _ -> None) with
     | None ->
       if not !dtp_obs_warned then begin
         dtp_obs_warned := true;
         Printf.eprintf "vuna: obs: cannot write %s, events dropped" path;
         output_char stderr dtp_obs_nl;
         flush stderr
       end;
       None
     | Some c ->
       dtp_obs_chan := Some c;
       Some c)

let dtp_obs_flush () =
  (match !dtp_obs_chan with
   | None -> ()
   | Some c ->
     if Buffer.length dtp_obs_buf > 0 then Buffer.output_buffer c dtp_obs_buf;
     Buffer.clear dtp_obs_buf;
     (try flush c with _ -> ()));
  dtp_obs_count := 0;
  0

let dtp_obs_hdr b (ph : string) (name : string) (ts : int) =
  Buffer.add_char b dtp_obs_lb;
  dtp_obs_key b "ph";
  dtp_obs_str b ph;
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "ts";
  dtp_obs_int b ts;
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "pid";
  dtp_obs_int b (Unix.getpid ());
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "tid";
  dtp_obs_int b (dtp_obs_tid ());
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "name";
  dtp_obs_str b name

let dtp_obs_meta () =
  let b = Buffer.create 256 in
  Buffer.add_char b dtp_obs_lb;
  dtp_obs_key b "ph";
  dtp_obs_str b "M";
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "name";
  dtp_obs_str b "vuna.obs.schema";
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "pid";
  dtp_obs_int b (Unix.getpid ());
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "tid";
  dtp_obs_int b 0;
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "args";
  Buffer.add_char b dtp_obs_lb;
  dtp_obs_key b "schema";
  dtp_obs_str b "vuna-obs 1";
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "level";
  dtp_obs_int b (dtp_obs_level 0);
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "exec";
  dtp_obs_str b (try Sys.executable_name with _ -> "");
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "argv";
  Buffer.add_char b dtp_obs_ls;
  Array.iteri
    (fun i a ->
      if i > 0 then Buffer.add_char b dtp_obs_comma;
      dtp_obs_str b a)
    Sys.argv;
  Buffer.add_char b dtp_obs_rs;
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "t0";
  dtp_obs_int b (dtp_timeUs ());
  Buffer.add_char b dtp_obs_rb;
  Buffer.add_char b dtp_obs_rb;
  Buffer.add_char b dtp_obs_nl;
  Buffer.contents b

let dtp_obs_emit (ev : string) =
  match dtp_obs_open () with
  | None -> 0
  | Some _ ->
    if not !dtp_obs_started then begin
      dtp_obs_started := true;
      Buffer.add_string dtp_obs_buf (dtp_obs_meta ())
    end;
    Buffer.add_string dtp_obs_buf ev;
    incr dtp_obs_count;
    if !dtp_obs_count >= 256 then dtp_obs_flush () else 0

let dtp_obs_shutdown () =
  ignore (dtp_obs_flush ());
  (match !dtp_obs_chan with
   | Some c -> dtp_obs_chan := None; (try close_out c with _ -> ())
   | None -> ())

let () = at_exit dtp_obs_shutdown

let dtp_obs_span_emit (name : string) (cat : string) (label_opt : string option)
    (t0 : int) (s0 : Gc.stat) (ok : bool) =
  let t1 = dtp_timeUs () in
  let s1 = Gc.quick_stat () in
  let b = Buffer.create 192 in
  dtp_obs_hdr b "X" name t0;
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "cat";
  dtp_obs_str b cat;
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "dur";
  dtp_obs_int b (if t1 - t0 < 0 then 0 else t1 - t0);
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "args";
  Buffer.add_char b dtp_obs_lb;
  (match label_opt with
   | None -> ()
   | Some label ->
     dtp_obs_key b "def";
     dtp_obs_str b label;
     Buffer.add_char b dtp_obs_comma);
  dtp_obs_key b "allocWords";
  dtp_obs_int b
    (int_of_float
       (s1.Gc.minor_words -. s0.Gc.minor_words +. (s1.Gc.major_words -. s0.Gc.major_words)));
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "heapWords";
  dtp_obs_int b s1.Gc.top_heap_words;
  if not ok then begin
    Buffer.add_char b dtp_obs_comma;
    dtp_obs_key b "error";
    Buffer.add_string b "true"
  end;
  Buffer.add_char b dtp_obs_rb;
  Buffer.add_char b dtp_obs_rb;
  Buffer.add_char b dtp_obs_nl;
  ignore (dtp_obs_emit (Buffer.contents b))

let dtp_obs_span (name : string) (cat : string) (f : int -> 'a) : 'a =
  if not (dtp_obs_on ()) then f 0
  else begin
    let t0 = dtp_timeUs () in
    let s0 = Gc.quick_stat () in
    let v = try f 0 with e -> dtp_obs_span_emit name cat None t0 s0 false; raise e in
    dtp_obs_span_emit name cat None t0 s0 true;
    v
  end

let dtp_obs_span_lab (name : string) (cat : string) (label : string) (f : int -> 'a) : 'a =
  if not (dtp_obs_on ()) then f 0
  else begin
    let t0 = dtp_timeUs () in
    let s0 = Gc.quick_stat () in
    let v = try f 0 with e -> dtp_obs_span_emit name cat (Some label) t0 s0 false; raise e in
    dtp_obs_span_emit name cat (Some label) t0 s0 true;
    v
  end

let dtp_obs_open_spans : (int, string * string * int * Gc.stat) Hashtbl.t =
  Hashtbl.create 64

let dtp_obs_span_seq = ref 0

let dtp_obs_span_begin (name : string) (cat : string) : int =
  if not (dtp_obs_on ()) then 0
  else begin
    incr dtp_obs_span_seq;
    let id = !dtp_obs_span_seq in
    Hashtbl.replace dtp_obs_open_spans id (name, cat, dtp_timeUs (), Gc.quick_stat ());
    id
  end

let dtp_obs_span_end (id : int) : int =
  if id = 0 then 0
  else match Hashtbl.find_opt dtp_obs_open_spans id with
    | None -> 0
    | Some (name, cat, t0, s0) ->
      Hashtbl.remove dtp_obs_open_spans id;
      dtp_obs_span_emit name cat None t0 s0 true;
      0

let dtp_obs_mark_like (ph : string) (name : string) (cat : string) (kv : (Buffer.t -> unit) option) =
  let b = Buffer.create 160 in
  dtp_obs_hdr b ph name (dtp_timeUs ());
  Buffer.add_char b dtp_obs_comma;
  dtp_obs_key b "cat";
  dtp_obs_str b cat;
  (match kv with
   | None -> ()
   | Some put ->
     Buffer.add_char b dtp_obs_comma;
     dtp_obs_key b "args";
     Buffer.add_char b dtp_obs_lb;
     put b;
     Buffer.add_char b dtp_obs_rb);
  Buffer.add_char b dtp_obs_rb;
  Buffer.add_char b dtp_obs_nl;
  ignore (dtp_obs_emit (Buffer.contents b));
  0

let dtp_obs_log (text : string) : int =
  if not (dtp_obs_on ()) then 0
  else begin
    Printf.eprintf "DEBUG %d %s" (dtp_timeUs ()) text;
    output_char stderr dtp_obs_nl;
    flush stderr;
    dtp_obs_mark_like "i" "vuna.log" "vuna.log"
      (Some (fun b -> dtp_obs_key b "text"; dtp_obs_str b text))
  end

let dtp_obs_counter (name : string) (v : int) : int =
  if not (dtp_obs_on ()) then 0
  else dtp_obs_mark_like "C" name "vuna.counter"
    (Some (fun b -> dtp_obs_key b "value"; dtp_obs_int b v))

let dtp_obs_mark (name : string) : int =
  if not (dtp_obs_on ()) then 0
  else dtp_obs_mark_like "i" name "vuna.mark" None

let dtp_obs_cap = 8192
let dtp_obs_cpu : Printexc.raw_backtrace option array = Array.make 8192 None
let dtp_obs_cpu_n = ref 0
let dtp_obs_cpu_on = ref false

let dtp_obs_cpu_tick (_ : int) =
  if !dtp_obs_cpu_on && !dtp_obs_cpu_n < dtp_obs_cap then begin
    dtp_obs_cpu.(!dtp_obs_cpu_n) <- Some (Printexc.get_callstack 32);
    incr dtp_obs_cpu_n
  end

let dtp_obs_frames b (bt : Printexc.raw_backtrace) =
  let slots = match Printexc.backtrace_slots bt with None -> [||] | Some s -> s in
  Buffer.add_char b dtp_obs_ls;
  let first = ref true in
  Array.iter
    (fun slot ->
      let nm = match Printexc.Slot.name slot with Some n -> n | None -> "" in
      let loc =
        match Printexc.Slot.location slot with
        | Some l -> Printf.sprintf "%s:%d" l.filename l.line_number
        | None -> ""
      in
      if !first then first := false else Buffer.add_char b dtp_obs_comma;
      dtp_obs_str b (if loc = "" then nm else nm ^ "@" ^ loc))
    slots;
  Buffer.add_char b dtp_obs_rs

let dtp_obs_mem : Printexc.raw_backtrace option array = Array.make 8192 None
let dtp_obs_mem_n = ref 0
let dtp_obs_mem_run : Gc.Memprof.t option ref = ref None

let dtp_obs_mem_add (bt : Printexc.raw_backtrace) =
  if !dtp_obs_mem_n < dtp_obs_cap then begin
    dtp_obs_mem.(!dtp_obs_mem_n) <- Some bt;
    incr dtp_obs_mem_n
  end

let dtp_obs_tracker : (unit, unit) Gc.Memprof.tracker =
  { alloc_minor =
      (fun (i : Gc.Memprof.allocation) -> dtp_obs_mem_add i.callstack; (None : unit option));
    alloc_major =
      (fun (i : Gc.Memprof.allocation) -> dtp_obs_mem_add i.callstack; (None : unit option));
    promote = (fun () -> None);
    dealloc_minor = (fun () -> ());
    dealloc_major = (fun () -> ()) }

let dtp_obs_emit_samples (name : string) (n : int) (get : int -> Printexc.raw_backtrace option) =
  for i = 0 to n - 1 do
    match get i with
    | None -> ()
    | Some bt ->
      let b = Buffer.create 256 in
      dtp_obs_hdr b "i" name (dtp_timeUs ());
      Buffer.add_char b dtp_obs_comma;
      dtp_obs_key b "cat";
      dtp_obs_str b "vuna.sample";
      Buffer.add_char b dtp_obs_comma;
      dtp_obs_key b "args";
      Buffer.add_char b dtp_obs_lb;
      dtp_obs_key b "stack";
      dtp_obs_frames b bt;
      Buffer.add_char b dtp_obs_rb;
      Buffer.add_char b dtp_obs_rb;
      Buffer.add_char b dtp_obs_nl;
      ignore (dtp_obs_emit (Buffer.contents b))
  done

let dtp_obs_sample_start (mode : string) (interval_us : int) : int =
  if not (dtp_obs_on ()) then 0
  else begin
    (* `mode` 为空串时按 `VUNA_OBS_SAMPLE`（env）取缺省（`cpu`）；这样 `vuna dev obs run
       --sample both` 的 env 注入能生效，而库层调用总是显式给 mode。 *)
    let mode2 =
      if mode <> "" then mode
      else match Sys.getenv_opt "VUNA_OBS_SAMPLE" with
        | Some m when m <> "" -> m
        | _ -> "cpu"
    in
    let iv2 =
      if interval_us > 0 then interval_us
      else
        match int_of_string_opt (match Sys.getenv_opt "VUNA_OBS_INTERVAL" with Some v -> v | None -> "") with
        | Some v when v > 0 -> v
        | _ -> 1000
    in
    let want_cpu = mode2 = "cpu" || mode2 = "both" in
    let want_mem = mode2 = "mem" || mode2 = "both" in
    (if want_cpu then
       try
         Sys.set_signal Sys.sigprof (Sys.Signal_handle dtp_obs_cpu_tick);
         dtp_obs_cpu_on := true;
         ignore
           (Unix.setitimer Unix.ITIMER_PROF
              { Unix.it_interval = float_of_int iv2 /. 1000000.0;
                it_value = float_of_int iv2 /. 1000000.0 })
       with _ -> ());
    (if want_mem then
       try
         dtp_obs_mem_run :=
           Some (Gc.Memprof.start ~sampling_rate:1e-4 ~callstack_size:16 dtp_obs_tracker)
       with _ -> ());
    0
  end

let dtp_obs_sample_stop (_ : int) : int =
  if not (dtp_obs_on ()) then 0
  else begin
    (try
       dtp_obs_cpu_on := false;
       ignore (Unix.setitimer Unix.ITIMER_PROF { Unix.it_interval = 0.0; it_value = 0.0 })
     with _ -> ());
    (try (match !dtp_obs_mem_run with Some _ -> Gc.Memprof.stop () | None -> ()) with _ -> ());
    dtp_obs_mem_run := None;
    dtp_obs_emit_samples "vuna.sample.cpu" !dtp_obs_cpu_n (fun i -> dtp_obs_cpu.(i));
    dtp_obs_emit_samples "vuna.sample.mem" !dtp_obs_mem_n (fun i -> dtp_obs_mem.(i));
    dtp_obs_flush ()
  end
