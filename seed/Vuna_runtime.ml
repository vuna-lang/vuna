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
type _ Effect.t += Perform : string * string * Obj.t -> Obj.t Effect.t

(* bracket 的 abort cleanup 登记表（每纤程一份，LIFO）。
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
  ("v_Applicative_uBase_uEff_uEff_ur", ("Applicative_Base_Eff_Eff_r", "Base/Eff.vuna:66"));
  ("v_Applicative_uBase_uList_uList", ("Applicative_Base_List_List", "Base/List.vuna:178"));
  ("v_Applicative_uBase_uMaybe_uMaybe", ("Applicative_Base_Maybe_Maybe", "Base/Maybe.vuna:53"));
  ("v_Applicative_uBase_uResult_uResult", ("Applicative_Base_Result_Result", "Base/Result.vuna:33"));
  ("v_Applicative_uVuna_uCompiler_uBase_uCommon_uEffCheck", ("Applicative_Vuna_Compiler_Base_Common_EffCheck", "Vuna/Compiler/Base/Common.vuna:41"));
  ("v_Applicative_uVuna_uCompiler_uBase_uDiag_uCheck", ("Applicative_Vuna_Compiler_Base_Diag_Check", "Vuna/Compiler/Base/Diag.vuna:373"));
  ("v_Base_dApplicative_dap", ("Base.Applicative.ap", "Base/Applicative.vuna:18"));
  ("v_Base_dApplicative_dliftA2", ("Base.Applicative.liftA2", "Base/Applicative.vuna:20"));
  ("v_Base_dApplicative_dpure", ("Base.Applicative.pure", "Base/Applicative.vuna:16"));
  ("v_Base_dArray_dfromList", ("Base.Array.fromList", "Base/Array.vuna:12"));
  ("v_Base_dArray_dget", ("Base.Array.get", "Base/Array.vuna:24"));
  ("v_Base_dArray_dlength", ("Base.Array.length", "Base/Array.vuna:20"));
  ("v_Base_dArray_dmake", ("Base.Array.make", "Base/Array.vuna:32"));
  ("v_Base_dArray_dset", ("Base.Array.set", "Base/Array.vuna:28"));
  ("v_Base_dArray_dtoList", ("Base.Array.toList", "Base/Array.vuna:16"));
  ("v_Base_dBits_dadd32", ("Base.Bits.add32", "Base/Bits.vuna:49"));
  ("v_Base_dBits_dband", ("Base.Bits.band", "Base/Bits.vuna:8"));
  ("v_Base_dBits_dbnot", ("Base.Bits.bnot", "Base/Bits.vuna:20"));
  ("v_Base_dBits_dbor", ("Base.Bits.bor", "Base/Bits.vuna:12"));
  ("v_Base_dBits_dbxor", ("Base.Bits.bxor", "Base/Bits.vuna:16"));
  ("v_Base_dBits_dmask32", ("Base.Bits.mask32", "Base/Bits.vuna:32"));
  ("v_Base_dBits_dmask8", ("Base.Bits.mask8", "Base/Bits.vuna:36"));
  ("v_Base_dBits_drol32", ("Base.Bits.rol32", "Base/Bits.vuna:61"));
  ("v_Base_dBits_drotr32", ("Base.Bits.rotr32", "Base/Bits.vuna:53"));
  ("v_Base_dBits_dshl", ("Base.Bits.shl", "Base/Bits.vuna:24"));
  ("v_Base_dBits_dshl32", ("Base.Bits.shl32", "Base/Bits.vuna:41"));
  ("v_Base_dBits_dshr", ("Base.Bits.shr", "Base/Bits.vuna:28"));
  ("v_Base_dBits_dshr32", ("Base.Bits.shr32", "Base/Bits.vuna:45"));
  ("v_Base_dBool_dand", ("Base.Bool.and", "Base/Bool.vuna:24"));
  ("v_Base_dBool_dbool", ("Base.Bool.bool", "Base/Bool.vuna:39"));
  ("v_Base_dBool_dnot", ("Base.Bool.not", "Base/Bool.vuna:19"));
  ("v_Base_dBool_dor", ("Base.Bool.or", "Base/Bool.vuna:29"));
  ("v_Base_dBool_dxor", ("Base.Bool.xor", "Base/Bool.vuna:34"));
  ("v_Base_dEffArgs_dargsGetArgs", ("Base.EffArgs.argsGetArgs", "Base/EffArgs.vuna:19"));
  ("v_Base_dEffArgs_dargsOpHIO", ("Base.EffArgs.argsOpHIO", "Base/EffArgs.vuna:27"));
  ("v_Base_dEffArgs_dargsOpHIOHost", ("Base.EffArgs.argsOpHIOHost", "Base/EffArgs.vuna:37"));
  ("v_Base_dEffArgs_dhandleArgs", ("Base.EffArgs.handleArgs", "Base/EffArgs.vuna:23"));
  ("v_Base_dEffArgs_dhandleArgsHostHost", ("Base.EffArgs.handleArgsHostHost", "Base/EffArgs.vuna:44"));
  ("v_Base_dEffArgs_dresArgs", ("Base.EffArgs.resArgs", "Base/EffArgs.vuna:15"));
  ("v_Base_dEffArgs_drunArgsHost", ("Base.EffArgs.runArgsHost", "Base/EffArgs.vuna:48"));
  ("v_Base_dEffClock_dclockNow", ("Base.EffClock.clockNow", "Base/EffClock.vuna:23"));
  ("v_Base_dEffClock_dclockOpHIO", ("Base.EffClock.clockOpHIO", "Base/EffClock.vuna:35"));
  ("v_Base_dEffClock_dclockOpHIOHost", ("Base.EffClock.clockOpHIOHost", "Base/EffClock.vuna:48"));
  ("v_Base_dEffClock_dclockSleepMicros", ("Base.EffClock.clockSleepMicros", "Base/EffClock.vuna:27"));
  ("v_Base_dEffClock_dhandleClock", ("Base.EffClock.handleClock", "Base/EffClock.vuna:31"));
  ("v_Base_dEffClock_dhandleClockHostHost", ("Base.EffClock.handleClockHostHost", "Base/EffClock.vuna:58"));
  ("v_Base_dEffClock_dresClock", ("Base.EffClock.resClock", "Base/EffClock.vuna:18"));
  ("v_Base_dEffClock_drunClockHost", ("Base.EffClock.runClockHost", "Base/EffClock.vuna:62"));
  ("v_Base_dEffConsole_dconsoleEprint", ("Base.EffConsole.consoleEprint", "Base/EffConsole.vuna:31"));
  ("v_Base_dEffConsole_dconsoleOpHIO", ("Base.EffConsole.consoleOpHIO", "Base/EffConsole.vuna:39"));
  ("v_Base_dEffConsole_dconsoleOpHIOHost", ("Base.EffConsole.consoleOpHIOHost", "Base/EffConsole.vuna:52"));
  ("v_Base_dEffConsole_dconsolePrint", ("Base.EffConsole.consolePrint", "Base/EffConsole.vuna:27"));
  ("v_Base_dEffConsole_dhandleConsole", ("Base.EffConsole.handleConsole", "Base/EffConsole.vuna:35"));
  ("v_Base_dEffConsole_dhandleConsoleHostHost", ("Base.EffConsole.handleConsoleHostHost", "Base/EffConsole.vuna:62"));
  ("v_Base_dEffConsole_dresConsole", ("Base.EffConsole.resConsole", "Base/EffConsole.vuna:22"));
  ("v_Base_dEffConsole_drunConsoleHost", ("Base.EffConsole.runConsoleHost", "Base/EffConsole.vuna:67"));
  ("v_Base_dEffEnv_denvExecPath", ("Base.EffEnv.envExecPath", "Base/EffEnv.vuna:44"));
  ("v_Base_dEffEnv_denvGetCwd", ("Base.EffEnv.envGetCwd", "Base/EffEnv.vuna:40"));
  ("v_Base_dEffEnv_denvGetEnv", ("Base.EffEnv.envGetEnv", "Base/EffEnv.vuna:29"));
  ("v_Base_dEffEnv_denvGetEnvNonEmpty", ("Base.EffEnv.envGetEnvNonEmpty", "Base/EffEnv.vuna:34"));
  ("v_Base_dEffEnv_denvOpHIO", ("Base.EffEnv.envOpHIO", "Base/EffEnv.vuna:52"));
  ("v_Base_dEffEnv_denvOpHIOHost", ("Base.EffEnv.envOpHIOHost", "Base/EffEnv.vuna:68"));
  ("v_Base_dEffEnv_dhandleEnv", ("Base.EffEnv.handleEnv", "Base/EffEnv.vuna:48"));
  ("v_Base_dEffEnv_dhandleEnvHostHost", ("Base.EffEnv.handleEnvHostHost", "Base/EffEnv.vuna:81"));
  ("v_Base_dEffEnv_dresEnv", ("Base.EffEnv.resEnv", "Base/EffEnv.vuna:23"));
  ("v_Base_dEffEnv_drunEnvHost", ("Base.EffEnv.runEnvHost", "Base/EffEnv.vuna:85"));
  ("v_Base_dEffExit_dexitOpHIO", ("Base.EffExit.exitOpHIO", "Base/EffExit.vuna:26"));
  ("v_Base_dEffExit_dexitOpHIOHost", ("Base.EffExit.exitOpHIOHost", "Base/EffExit.vuna:36"));
  ("v_Base_dEffExit_dexitWith", ("Base.EffExit.exitWith", "Base/EffExit.vuna:18"));
  ("v_Base_dEffExit_dhandleExit", ("Base.EffExit.handleExit", "Base/EffExit.vuna:22"));
  ("v_Base_dEffExit_dhandleExitHostHost", ("Base.EffExit.handleExitHostHost", "Base/EffExit.vuna:43"));
  ("v_Base_dEffExit_dresExit", ("Base.EffExit.resExit", "Base/EffExit.vuna:14"));
  ("v_Base_dEffExit_drunExitHost", ("Base.EffExit.runExitHost", "Base/EffExit.vuna:47"));
  ("v_Base_dEffFs_dfsErrorOfCode", ("Base.EffFs.fsErrorOfCode", "Base/EffFs.vuna:105"));
  ("v_Base_dEffFs_dfsErrorOpHR", ("Base.EffFs.fsErrorOpHR", "Base/EffFs.vuna:274"));
  ("v_Base_dEffFs_dfsErrorRet", ("Base.EffFs.fsErrorRet", "Base/EffFs.vuna:270"));
  ("v_Base_dEffFs_dfsErrorText", ("Base.EffFs.fsErrorText", "Base/EffFs.vuna:115"));
  ("v_Base_dEffFs_dfsFail", ("Base.EffFs.fsFail", "Base/EffFs.vuna:101"));
  ("v_Base_dEffFs_dfsFileExists", ("Base.EffFs.fsFileExists", "Base/EffFs.vuna:163"));
  ("v_Base_dEffFs_dfsFileMtime", ("Base.EffFs.fsFileMtime", "Base/EffFs.vuna:167"));
  ("v_Base_dEffFs_dfsFileSize", ("Base.EffFs.fsFileSize", "Base/EffFs.vuna:171"));
  ("v_Base_dEffFs_dfsHostStatus", ("Base.EffFs.fsHostStatus", "Base/EffFs.vuna:198"));
  ("v_Base_dEffFs_dfsIsDirectory", ("Base.EffFs.fsIsDirectory", "Base/EffFs.vuna:148"));
  ("v_Base_dEffFs_dfsMakeDir", ("Base.EffFs.fsMakeDir", "Base/EffFs.vuna:153"));
  ("v_Base_dEffFs_dfsMakeDirExclusive", ("Base.EffFs.fsMakeDirExclusive", "Base/EffFs.vuna:187"));
  ("v_Base_dEffFs_dfsOpHIOHost", ("Base.EffFs.fsOpHIOHost", "Base/EffFs.vuna:202"));
  ("v_Base_dEffFs_dfsReadDir", ("Base.EffFs.fsReadDir", "Base/EffFs.vuna:143"));
  ("v_Base_dEffFs_dfsReadFile", ("Base.EffFs.fsReadFile", "Base/EffFs.vuna:128"));
  ("v_Base_dEffFs_dfsRemoveFile", ("Base.EffFs.fsRemoveFile", "Base/EffFs.vuna:158"));
  ("v_Base_dEffFs_dfsRemoveTree", ("Base.EffFs.fsRemoveTree", "Base/EffFs.vuna:175"));
  ("v_Base_dEffFs_dfsRename", ("Base.EffFs.fsRename", "Base/EffFs.vuna:179"));
  ("v_Base_dEffFs_dfsSymlink", ("Base.EffFs.fsSymlink", "Base/EffFs.vuna:183"));
  ("v_Base_dEffFs_dfsWriteFile", ("Base.EffFs.fsWriteFile", "Base/EffFs.vuna:133"));
  ("v_Base_dEffFs_dfsWriteFileAtomic", ("Base.EffFs.fsWriteFileAtomic", "Base/EffFs.vuna:138"));
  ("v_Base_dEffFs_dhandleFs", ("Base.EffFs.handleFs", "Base/EffFs.vuna:191"));
  ("v_Base_dEffFs_dhandleFsHostHost", ("Base.EffFs.handleFsHostHost", "Base/EffFs.vuna:262"));
  ("v_Base_dEffFs_dresFs", ("Base.EffFs.resFs", "Base/EffFs.vuna:54"));
  ("v_Base_dEffFs_dresFsError", ("Base.EffFs.resFsError", "Base/EffFs.vuna:97"));
  ("v_Base_dEffFs_drunFsError", ("Base.EffFs.runFsError", "Base/EffFs.vuna:279"));
  ("v_Base_dEffFs_drunFsErrorHost", ("Base.EffFs.runFsErrorHost", "Base/EffFs.vuna:283"));
  ("v_Base_dEffFs_drunFsHost", ("Base.EffFs.runFsHost", "Base/EffFs.vuna:266"));
  ("v_Base_dEffFs_dsortEntries", ("Base.EffFs.sortEntries", "Base/EffFs.vuna:124"));
  ("v_Base_dEffProcess_dhandleProcess", ("Base.EffProcess.handleProcess", "Base/EffProcess.vuna:92"));
  ("v_Base_dEffProcess_dhandleProcessHostWith", ("Base.EffProcess.handleProcessHostWith", "Base/EffProcess.vuna:115"));
  ("v_Base_dEffProcess_dhandleProcessHostWithHost", ("Base.EffProcess.handleProcessHostWithHost", "Base/EffProcess.vuna:146"));
  ("v_Base_dEffProcess_dprocessArgs", ("Base.EffProcess.processArgs", "Base/EffProcess.vuna:36"));
  ("v_Base_dEffProcess_dprocessErrorOfCode", ("Base.EffProcess.processErrorOfCode", "Base/EffProcess.vuna:80"));
  ("v_Base_dEffProcess_dprocessErrorOpHR", ("Base.EffProcess.processErrorOpHR", "Base/EffProcess.vuna:161"));
  ("v_Base_dEffProcess_dprocessErrorRet", ("Base.EffProcess.processErrorRet", "Base/EffProcess.vuna:157"));
  ("v_Base_dEffProcess_dprocessErrorText", ("Base.EffProcess.processErrorText", "Base/EffProcess.vuna:86"));
  ("v_Base_dEffProcess_dprocessExit", ("Base.EffProcess.processExit", "Base/EffProcess.vuna:40"));
  ("v_Base_dEffProcess_dprocessFail", ("Base.EffProcess.processFail", "Base/EffProcess.vuna:76"));
  ("v_Base_dEffProcess_dprocessHostStatus", ("Base.EffProcess.processHostStatus", "Base/EffProcess.vuna:122"));
  ("v_Base_dEffProcess_dprocessOpHIOWith", ("Base.EffProcess.processOpHIOWith", "Base/EffProcess.vuna:96"));
  ("v_Base_dEffProcess_dprocessOpHIOWithHost", ("Base.EffProcess.processOpHIOWithHost", "Base/EffProcess.vuna:126"));
  ("v_Base_dEffProcess_dprocessRunIn", ("Base.EffProcess.processRunIn", "Base/EffProcess.vuna:44"));
  ("v_Base_dEffProcess_dprocessSpawn", ("Base.EffProcess.processSpawn", "Base/EffProcess.vuna:49"));
  ("v_Base_dEffProcess_dprocessWait", ("Base.EffProcess.processWait", "Base/EffProcess.vuna:54"));
  ("v_Base_dEffProcess_dresProcess", ("Base.EffProcess.resProcess", "Base/EffProcess.vuna:28"));
  ("v_Base_dEffProcess_dresProcessError", ("Base.EffProcess.resProcessError", "Base/EffProcess.vuna:72"));
  ("v_Base_dEffProcess_drunProcessError", ("Base.EffProcess.runProcessError", "Base/EffProcess.vuna:166"));
  ("v_Base_dEffProcess_drunProcessErrorHost", ("Base.EffProcess.runProcessErrorHost", "Base/EffProcess.vuna:171"));
  ("v_Base_dEffProcess_drunProcessHost", ("Base.EffProcess.runProcessHost", "Base/EffProcess.vuna:151"));
  ("v_Base_dEffStdin_dhandleStdin", ("Base.EffStdin.handleStdin", "Base/EffStdin.vuna:35"));
  ("v_Base_dEffStdin_dhandleStdinHostHost", ("Base.EffStdin.handleStdinHostHost", "Base/EffStdin.vuna:66"));
  ("v_Base_dEffStdin_dresStdin", ("Base.EffStdin.resStdin", "Base/EffStdin.vuna:22"));
  ("v_Base_dEffStdin_drunStdinHost", ("Base.EffStdin.runStdinHost", "Base/EffStdin.vuna:70"));
  ("v_Base_dEffStdin_dstdinOpHIO", ("Base.EffStdin.stdinOpHIO", "Base/EffStdin.vuna:39"));
  ("v_Base_dEffStdin_dstdinOpHIOHost", ("Base.EffStdin.stdinOpHIOHost", "Base/EffStdin.vuna:54"));
  ("v_Base_dEffStdin_dstdinReadBytes", ("Base.EffStdin.stdinReadBytes", "Base/EffStdin.vuna:31"));
  ("v_Base_dEffStdin_dstdinReadLine", ("Base.EffStdin.stdinReadLine", "Base/EffStdin.vuna:27"));
  ("v_Base_dEff_dbracket", ("Base.Eff.bracket", "Base/Eff.vuna:212"));
  ("v_Base_dEff_dcontAdapter", ("Base.Eff.contAdapter", "Base/Eff.vuna:168"));
  ("v_Base_dEff_ddefaultInstance", ("Base.Eff.defaultInstance", "Base/Eff.vuna:42"));
  ("v_Base_dEff_deffPrim", ("Base.Eff.effPrim", "Base/Eff.vuna:79"));
  ("v_Base_dEff_dfinally", ("Base.Eff.finally", "Base/Eff.vuna:222"));
  ("v_Base_dEff_dhandleCore", ("Base.Eff.handleCore", "Base/Eff.vuna:152"));
  ("v_Base_dEff_dhandleCoreLin", ("Base.Eff.handleCoreLin", "Base/Eff.vuna:172"));
  ("v_Base_dEff_dhandleWith", ("Base.Eff.handleWith", "Base/Eff.vuna:195"));
  ("v_Base_dEff_dhandleWithAt", ("Base.Eff.handleWithAt", "Base/Eff.vuna:200"));
  ("v_Base_dEff_djoinEff", ("Base.Eff.joinEff", "Base/Eff.vuna:109"));
  ("v_Base_dEff_djoinEffNilOuter", ("Base.Eff.joinEffNilOuter", "Base/Eff.vuna:118"));
  ("v_Base_dEff_dmkCont", ("Base.Eff.mkCont", "Base/Eff.vuna:208"));
  ("v_Base_dEff_dperformCore", ("Base.Eff.performCore", "Base/Eff.vuna:148"));
  ("v_Base_dEff_draise", ("Base.Eff.raise", "Base/Eff.vuna:132"));
  ("v_Base_dEff_draiseTo", ("Base.Eff.raiseTo", "Base/Eff.vuna:137"));
  ("v_Base_dEff_dresFn", ("Base.Eff.resFn", "Base/Eff.vuna:185"));
  ("v_Base_dEff_dresOf", ("Base.Eff.resOf", "Base/Eff.vuna:189"));
  ("v_Base_dEff_dresumeCont", ("Base.Eff.resumeCont", "Base/Eff.vuna:163"));
  ("v_Base_dEff_drowAppend", ("Base.Eff.rowAppend", "Base/Eff.vuna:37"));
  ("v_Base_dEff_drowRem", ("Base.Eff.rowRem", "Base/Eff.vuna:34"));
  ("v_Base_dEff_drunEff", ("Base.Eff.runEff", "Base/Eff.vuna:98"));
  ("v_Base_dEff_drunMain", ("Base.Eff.runMain", "Base/Eff.vuna:103"));
  ("v_Base_dEff_drunPure", ("Base.Eff.runPure", "Base/Eff.vuna:94"));
  ("v_Base_dEff_drunThunk", ("Base.Eff.runThunk", "Base/Eff.vuna:89"));
  ("v_Base_dEff_dsendCore", ("Base.Eff.sendCore", "Base/Eff.vuna:143"));
  ("v_Base_dEff_dweaken", ("Base.Eff.weaken", "Base/Eff.vuna:84"));
  ("v_Base_dEff_dweakenRow", ("Base.Eff.weakenRow", "Base/Eff.vuna:126"));
  ("v_Base_dEq_d_x47__x61_", ("Base.Eq./=", "Base/Eq.vuna:16"));
  ("v_Base_dEq_d_x61__x61_", ("Base.Eq.==", "Base/Eq.vuna:14"));
  ("v_Base_dFloat_dabs", ("Base.Float.abs", "Base/Float.vuna:51"));
  ("v_Base_dFloat_dcarryRev", ("Base.Float.carryRev", "Base/Float.vuna:88"));
  ("v_Base_dFloat_ddigStep", ("Base.Float.digStep", "Base/Float.vuna:79"));
  ("v_Base_dFloat_ddigitsText", ("Base.Float.digitsText", "Base/Float.vuna:112"));
  ("v_Base_dFloat_ddsLen", ("Base.Float.dsLen", "Base/Float.vuna:107"));
  ("v_Base_dFloat_dexpForm", ("Base.Float.expForm", "Base/Float.vuna:128"));
  ("v_Base_dFloat_dexpSuffix", ("Base.Float.expSuffix", "Base/Float.vuna:120"));
  ("v_Base_dFloat_dfixedForm", ("Base.Float.fixedForm", "Base/Float.vuna:135"));
  ("v_Base_dFloat_dfloatRender", ("Base.Float.floatRender", "Base/Float.vuna:145"));
  ("v_Base_dFloat_dfloatToInt", ("Base.Float.floatToInt", "Base/Float.vuna:63"));
  ("v_Base_dFloat_dfromFloat", ("Base.Float.fromFloat", "Base/Float.vuna:19"));
  ("v_Base_dFloat_dintToFloat", ("Base.Float.intToFloat", "Base/Float.vuna:59"));
  ("v_Base_dFloat_dnormStep", ("Base.Float.normStep", "Base/Float.vuna:71"));
  ("v_Base_dFloat_dsqrt", ("Base.Float.sqrt", "Base/Float.vuna:55"));
  ("v_Base_dFloat_dtrimZeros", ("Base.Float.trimZeros", "Base/Float.vuna:101"));
  ("v_Base_dFloat_dtrimZerosRev", ("Base.Float.trimZerosRev", "Base/Float.vuna:96"));
  ("v_Base_dFloat_dzerosText", ("Base.Float.zerosText", "Base/Float.vuna:116"));
  ("v_Base_dFoldable_dfold", ("Base.Foldable.fold", "Base/Foldable.vuna:13"));
  ("v_Base_dFoldable_dfoldMap", ("Base.Foldable.foldMap", "Base/Foldable.vuna:17"));
  ("v_Base_dFromInt_dfromInt", ("Base.FromInt.fromInt", "Base/FromInt.vuna:11"));
  ("v_Base_dFromString_dfromString", ("Base.FromString.fromString", "Base/FromString.vuna:11"));
  ("v_Base_dFunctor_dfmap", ("Base.Functor.fmap", "Base/Functor.vuna:9"));
  ("v_Base_dHashMap_d_ubucketOf", ("Base.HashMap._bucketOf", "Base/HashMap.vuna:26"));
  ("v_Base_dHashMap_d_udedupBucket", ("Base.HashMap._dedupBucket", "Base/HashMap.vuna:49"));
  ("v_Base_dHashMap_d_udedupGo", ("Base.HashMap._dedupGo", "Base/HashMap.vuna:43"));
  ("v_Base_dHashMap_d_uhasKeyIn", ("Base.HashMap._hasKeyIn", "Base/HashMap.vuna:38"));
  ("v_Base_dHashMap_d_ulookupAssoc", ("Base.HashMap._lookupAssoc", "Base/HashMap.vuna:33"));
  ("v_Base_dHashMap_dfromList", ("Base.HashMap.fromList", "Base/HashMap.vuna:90"));
  ("v_Base_dHashMap_dinsert", ("Base.HashMap.insert", "Base/HashMap.vuna:54"));
  ("v_Base_dHashMap_dinsertAll", ("Base.HashMap.insertAll", "Base/HashMap.vuna:85"));
  ("v_Base_dHashMap_dlookup", ("Base.HashMap.lookup", "Base/HashMap.vuna:68"));
  ("v_Base_dHashMap_dmember", ("Base.HashMap.member", "Base/HashMap.vuna:79"));
  ("v_Base_dHashMap_dofNames", ("Base.HashMap.ofNames", "Base/HashMap.vuna:95"));
  ("v_Base_dHashMap_dsize", ("Base.HashMap.size", "Base/HashMap.vuna:105"));
  ("v_Base_dHashMap_dtoList", ("Base.HashMap.toList", "Base/HashMap.vuna:99"));
  ("v_Base_dHashable_dhash", ("Base.Hashable.hash", "Base/Hashable.vuna:16"));
  ("v_Base_dHashable_dhashCombine", ("Base.Hashable.hashCombine", "Base/Hashable.vuna:24"));
  ("v_Base_dHashable_dhashStr", ("Base.Hashable.hashStr", "Base/Hashable.vuna:20"));
  ("v_Base_dInterp_dinterp", ("Base.Interp.interp", "Base/Interp.vuna:15"));
  ("v_Base_dList_dallMem", ("Base.List.allMem", "Base/List.vuna:110"));
  ("v_Base_dList_danyMem", ("Base.List.anyMem", "Base/List.vuna:115"));
  ("v_Base_dList_dappend", ("Base.List.append", "Base/List.vuna:34"));
  ("v_Base_dList_dconcatMap", ("Base.List.concatMap", "Base/List.vuna:79"));
  ("v_Base_dList_dconcatMapGo", ("Base.List.concatMapGo", "Base/List.vuna:83"));
  ("v_Base_dList_ddrop", ("Base.List.drop", "Base/List.vuna:135"));
  ("v_Base_dList_dfilter", ("Base.List.filter", "Base/List.vuna:63"));
  ("v_Base_dList_dfirstJust", ("Base.List.firstJust", "Base/List.vuna:156"));
  ("v_Base_dList_dfirstSuccess", ("Base.List.firstSuccess", "Base/List.vuna:164"));
  ("v_Base_dList_dfoldl", ("Base.List.foldl", "Base/List.vuna:68"));
  ("v_Base_dList_dfoldr", ("Base.List.foldr", "Base/List.vuna:73"));
  ("v_Base_dList_dhasDupNames", ("Base.List.hasDupNames", "Base/List.vuna:120"));
  ("v_Base_dList_dlength", ("Base.List.length", "Base/List.vuna:49"));
  ("v_Base_dList_dlengthInt", ("Base.List.lengthInt", "Base/List.vuna:53"));
  ("v_Base_dList_dlookupPair", ("Base.List.lookupPair", "Base/List.vuna:98"));
  ("v_Base_dList_dmap", ("Base.List.map", "Base/List.vuna:58"));
  ("v_Base_dList_dmapMaybe", ("Base.List.mapMaybe", "Base/List.vuna:149"));
  ("v_Base_dList_dmem", ("Base.List.mem", "Base/List.vuna:88"));
  ("v_Base_dList_dmemName", ("Base.List.memName", "Base/List.vuna:93"));
  ("v_Base_dList_dnubNames", ("Base.List.nubNames", "Base/List.vuna:105"));
  ("v_Base_dList_drange", ("Base.List.range", "Base/List.vuna:141"));
  ("v_Base_dList_drangeFrom", ("Base.List.rangeFrom", "Base/List.vuna:145"));
  ("v_Base_dList_dreverse", ("Base.List.reverse", "Base/List.vuna:44"));
  ("v_Base_dList_dreverseOnto", ("Base.List.reverseOnto", "Base/List.vuna:39"));
  ("v_Base_dList_dshowElems", ("Base.List.showElems", "Base/List.vuna:185"));
  ("v_Base_dList_dshowElemsTail", ("Base.List.showElemsTail", "Base/List.vuna:190"));
  ("v_Base_dList_dtake", ("Base.List.take", "Base/List.vuna:130"));
  ("v_Base_dList_dzip", ("Base.List.zip", "Base/List.vuna:125"));
  ("v_Base_dMaybe_dfromMaybe", ("Base.Maybe.fromMaybe", "Base/Maybe.vuna:24"));
  ("v_Base_dMaybe_disJust", ("Base.Maybe.isJust", "Base/Maybe.vuna:29"));
  ("v_Base_dMaybe_disNothing", ("Base.Maybe.isNothing", "Base/Maybe.vuna:34"));
  ("v_Base_dMaybe_dmaybe", ("Base.Maybe.maybe", "Base/Maybe.vuna:39"));
  ("v_Base_dMonad_d_x62__x62_", ("Base.Monad.>>", "Base/Monad.vuna:21"));
  ("v_Base_dMonad_d_x62__x62__x61_", ("Base.Monad.>>=", "Base/Monad.vuna:17"));
  ("v_Base_dMonoid_dmappend", ("Base.Monoid.mappend", "Base/Monoid.vuna:11"));
  ("v_Base_dMonoid_dmempty", ("Base.Monoid.mempty", "Base/Monoid.vuna:16"));
  ("v_Base_dNat_dfromInt", ("Base.Nat.fromInt", "Base/Nat.vuna:40"));
  ("v_Base_dNat_dfromIntMaybe", ("Base.Nat.fromIntMaybe", "Base/Nat.vuna:44"));
  ("v_Base_dNat_disZero", ("Base.Nat.isZero", "Base/Nat.vuna:52"));
  ("v_Base_dNat_dminus", ("Base.Nat.minus", "Base/Nat.vuna:28"));
  ("v_Base_dNat_dmult", ("Base.Nat.mult", "Base/Nat.vuna:32"));
  ("v_Base_dNat_dplus", ("Base.Nat.plus", "Base/Nat.vuna:24"));
  ("v_Base_dNat_dpred", ("Base.Nat.pred", "Base/Nat.vuna:48"));
  ("v_Base_dNat_dtoInt", ("Base.Nat.toInt", "Base/Nat.vuna:36"));
  ("v_Base_dNeg_dnegate", ("Base.Neg.negate", "Base/Neg.vuna:10"));
  ("v_Base_dNum_d_x42_", ("Base.Num.*", "Base/Num.vuna:18"));
  ("v_Base_dNum_d_x43_", ("Base.Num.+", "Base/Num.vuna:14"));
  ("v_Base_dNum_d_x45_", ("Base.Num.-", "Base/Num.vuna:16"));
  ("v_Base_dNum_d_x47_", ("Base.Num./", "Base/Num.vuna:20"));
  ("v_Base_dObs_dSpan_dobsSample", ("Base.Obs.Span.obsSample", "Base/Obs/Span.vuna:33"));
  ("v_Base_dObs_dSpan_dobsSpan", ("Base.Obs.Span.obsSpan", "Base/Obs/Span.vuna:17"));
  ("v_Base_dObs_dSpan_dobsSpanEff", ("Base.Obs.Span.obsSpanEff", "Base/Obs/Span.vuna:26"));
  ("v_Base_dObs_dSpan_dobsSpanP", ("Base.Obs.Span.obsSpanP", "Base/Obs/Span.vuna:21"));
  ("v_Base_dObs_dobsCounter", ("Base.Obs.obsCounter", "Base/Obs.vuna:40"));
  ("v_Base_dObs_dobsLevel", ("Base.Obs.obsLevel", "Base/Obs.vuna:25"));
  ("v_Base_dObs_dobsLog", ("Base.Obs.obsLog", "Base/Obs.vuna:36"));
  ("v_Base_dObs_dobsMark", ("Base.Obs.obsMark", "Base/Obs.vuna:44"));
  ("v_Base_dObs_dobsOn", ("Base.Obs.obsOn", "Base/Obs.vuna:29"));
  ("v_Base_dObs_dobsSampleStart", ("Base.Obs.obsSampleStart", "Base/Obs.vuna:60"));
  ("v_Base_dObs_dobsSampleStop", ("Base.Obs.obsSampleStop", "Base/Obs.vuna:64"));
  ("v_Base_dObs_dobsSpanBegin", ("Base.Obs.obsSpanBegin", "Base/Obs.vuna:49"));
  ("v_Base_dObs_dobsSpanEnd", ("Base.Obs.obsSpanEnd", "Base/Obs.vuna:53"));
  ("v_Base_dOrd_d_x60_", ("Base.Ord.<", "Base/Ord.vuna:21"));
  ("v_Base_dOrd_d_x60__x61_", ("Base.Ord.<=", "Base/Ord.vuna:23"));
  ("v_Base_dOrd_d_x62_", ("Base.Ord.>", "Base/Ord.vuna:25"));
  ("v_Base_dOrd_d_x62__x61_", ("Base.Ord.>=", "Base/Ord.vuna:27"));
  ("v_Base_dOrd_dcompare", ("Base.Ord.compare", "Base/Ord.vuna:79"));
  ("v_Base_dOrd_dmax", ("Base.Ord.max", "Base/Ord.vuna:87"));
  ("v_Base_dOrd_dmin", ("Base.Ord.min", "Base/Ord.vuna:83"));
  ("v_Base_dPair_dfirstOf", ("Base.Pair.firstOf", "Base/Pair.vuna:19"));
  ("v_Base_dPair_dsecondOf", ("Base.Pair.secondOf", "Base/Pair.vuna:23"));
  ("v_Base_dResult_dmapError", ("Base.Result.mapError", "Base/Result.vuna:61"));
  ("v_Base_dResult_dstep", ("Base.Result.step", "Base/Result.vuna:56"));
  ("v_Base_dResult_dtraverse", ("Base.Result.traverse", "Base/Result.vuna:46"));
  ("v_Base_dResult_dwithDefault", ("Base.Result.withDefault", "Base/Result.vuna:66"));
  ("v_Base_dShow_ddbgShow", ("Base.Show.dbgShow", "Base/Show.vuna:31"));
  ("v_Base_dShow_ddebugShow", ("Base.Show.debugShow", "Base/Show.vuna:21"));
  ("v_Base_dShow_dshow", ("Base.Show.show", "Base/Show.vuna:11"));
  ("v_Base_dSort_dinsertBy", ("Base.Sort.insertBy", "Base/Sort.vuna:11"));
  ("v_Base_dSort_dmergeSort", ("Base.Sort.mergeSort", "Base/Sort.vuna:21"));
  ("v_Base_dSort_dsortBy", ("Base.Sort.sortBy", "Base/Sort.vuna:16"));
  ("v_Base_dString_d_ucontainsChars", ("Base.String._containsChars", "Base/String.vuna:121"));
  ("v_Base_dString_d_udropSpace", ("Base.String._dropSpace", "Base/String.vuna:109"));
  ("v_Base_dString_d_uinterleave", ("Base.String._interleave", "Base/String.vuna:53"));
  ("v_Base_dString_d_uisSpace", ("Base.String._isSpace", "Base/String.vuna:105"));
  ("v_Base_dString_d_ustartsWithChars", ("Base.String._startsWithChars", "Base/String.vuna:114"));
  ("v_Base_dString_dbyteLength", ("Base.String.byteLength", "Base/String.vuna:23"));
  ("v_Base_dString_dcontains", ("Base.String.contains", "Base/String.vuna:80"));
  ("v_Base_dString_dendsWith", ("Base.String.endsWith", "Base/String.vuna:88"));
  ("v_Base_dString_djoin", ("Base.String.join", "Base/String.vuna:49"));
  ("v_Base_dString_dlines", ("Base.String.lines", "Base/String.vuna:59"));
  ("v_Base_dString_drepeat", ("Base.String.repeat", "Base/String.vuna:97"));
  ("v_Base_dString_dskipSep", ("Base.String.skipSep", "Base/String.vuna:41"));
  ("v_Base_dString_dsplit", ("Base.String.split", "Base/String.vuna:27"));
  ("v_Base_dString_dsplitAcc", ("Base.String.splitAcc", "Base/String.vuna:33"));
  ("v_Base_dString_dstartsWith", ("Base.String.startsWith", "Base/String.vuna:84"));
  ("v_Base_dString_dsubstring", ("Base.String.substring", "Base/String.vuna:101"));
  ("v_Base_dString_dtrim", ("Base.String.trim", "Base/String.vuna:76"));
  ("v_Base_dString_dtrimLeft", ("Base.String.trimLeft", "Base/String.vuna:68"));
  ("v_Base_dString_dtrimRight", ("Base.String.trimRight", "Base/String.vuna:72"));
  ("v_Base_dString_dunlines", ("Base.String.unlines", "Base/String.vuna:63"));
  ("v_Base_dTraversable_dmapM", ("Base.Traversable.mapM", "Base/Traversable.vuna:13"));
  ("v_Base_dVec_dsubstTemplate", ("Base.Vec.substTemplate", "Base/Vec.vuna:41"));
  ("v_Base_dVec_dvecToList", ("Base.Vec.vecToList", "Base/Vec.vuna:45"));
  ("v_Base_dVec_dvhead", ("Base.Vec.vhead", "Base/Vec.vuna:20"));
  ("v_Base_dVec_dvlen", ("Base.Vec.vlen", "Base/Vec.vuna:30"));
  ("v_Base_dVec_dvtail", ("Base.Vec.vtail", "Base/Vec.vuna:25"));
  ("v_DebugShow_ua", ("DebugShow_a", "Base/Show.vuna:24"));
  ("v_Eq_uArray_ua", ("Eq_Array_a", "Base/Array.vuna:35"));
  ("v_Eq_uBase_uBool_uBool", ("Eq_Base_Bool_Bool", "Base/Eq.vuna:19"));
  ("v_Eq_uBase_uList_uList_ua", ("Eq_Base_List_List_a", "Base/List.vuna:199"));
  ("v_Eq_uBase_uMaybe_uMaybe_ua", ("Eq_Base_Maybe_Maybe_a", "Base/Maybe.vuna:75"));
  ("v_Eq_uBase_uNat_uNat", ("Eq_Base_Nat_Nat", "Base/Nat.vuna:54"));
  ("v_Eq_uBase_uOrd_uOrdering", ("Eq_Base_Ord_Ordering", "Base/Ord.vuna:49"));
  ("v_Eq_uBase_uPair_uPair_ua_ub", ("Eq_Base_Pair_Pair_a_b", "Base/Pair.vuna:33"));
  ("v_Eq_uBase_uResult_uResult_ua", ("Eq_Base_Result_Result_a", "Base/Result.vuna:77"));
  ("v_Eq_uBase_uUnit_uUnit", ("Eq_Base_Unit_Unit", "Base/Unit.vuna:16"));
  ("v_Eq_uFloat", ("Eq_Float", "Base/Float.vuna:25"));
  ("v_Eq_uInt", ("Eq_Int", "Base/Int.vuna:13"));
  ("v_Eq_uString", ("Eq_String", "Base/String.vuna:127"));
  ("v_Eq_uVuna_uCompiler_uLoader_uModules_uExportEntry", ("Eq_Vuna_Compiler_Loader_Modules_ExportEntry", "Vuna/Compiler/Loader/Modules.vuna:103"));
  ("v_Foldable_uBase_uList_uList", ("Foldable_Base_List_List", "Base/List.vuna:229"));
  ("v_Foldable_uBase_uMaybe_uMaybe", ("Foldable_Base_Maybe_Maybe", "Base/Maybe.vuna:106"));
  ("v_Foldable_uBase_uResult_uResult", ("Foldable_Base_Result_Result", "Base/Result.vuna:88"));
  ("v_FromFloat_uFloat", ("FromFloat_Float", "Base/Float.vuna:22"));
  ("v_FromInt_uInt", ("FromInt_Int", "Base/FromInt.vuna:14"));
  ("v_FromString_uString", ("FromString_String", "Base/FromString.vuna:14"));
  ("v_Functor_uBase_uEff_uEff_ur", ("Functor_Base_Eff_Eff_r", "Base/Eff.vuna:55"));
  ("v_Functor_uBase_uList_uList", ("Functor_Base_List_List", "Base/List.vuna:172"));
  ("v_Functor_uBase_uMaybe_uMaybe", ("Functor_Base_Maybe_Maybe", "Base/Maybe.vuna:43"));
  ("v_Functor_uBase_uResult_uResult", ("Functor_Base_Result_Result", "Base/Result.vuna:25"));
  ("v_Functor_uVuna_uCompiler_uBase_uCommon_uEffCheck", ("Functor_Vuna_Compiler_Base_Common_EffCheck", "Vuna/Compiler/Base/Common.vuna:38"));
  ("v_Functor_uVuna_uCompiler_uBase_uDiag_uCheck", ("Functor_Vuna_Compiler_Base_Diag_Check", "Vuna/Compiler/Base/Diag.vuna:365"));
  ("v_Hashable_uBase_uBool_uBool", ("Hashable_Base_Bool_Bool", "Base/Bool.vuna:47"));
  ("v_Hashable_uBase_uList_uList_ua", ("Hashable_Base_List_List_a", "Base/List.vuna:216"));
  ("v_Hashable_uBase_uMaybe_uMaybe_ua", ("Hashable_Base_Maybe_Maybe_a", "Base/Maybe.vuna:91"));
  ("v_Hashable_uBase_uNat_uNat", ("Hashable_Base_Nat_Nat", "Base/Nat.vuna:74"));
  ("v_Hashable_uBase_uOrd_uOrdering", ("Hashable_Base_Ord_Ordering", "Base/Ord.vuna:89"));
  ("v_Hashable_uBase_uPair_uPair_ua_ub", ("Hashable_Base_Pair_Pair_a_b", "Base/Pair.vuna:43"));
  ("v_Hashable_uBase_uResult_uResult_ua", ("Hashable_Base_Result_Result_a", "Base/Result.vuna:83"));
  ("v_Hashable_uBase_uUnit_uUnit", ("Hashable_Base_Unit_Unit", "Base/Unit.vuna:29"));
  ("v_Hashable_uInt", ("Hashable_Int", "Base/Int.vuna:38"));
  ("v_Hashable_uString", ("Hashable_String", "Base/String.vuna:138"));
  ("v_Interp_uString", ("Interp_String", "Base/Interp.vuna:22"));
  ("v_Interp_ua", ("Interp_a", "Base/Interp.vuna:18"));
  ("v_Monad_uBase_uEff_uEff_ur", ("Monad_Base_Eff_Eff_r", "Base/Eff.vuna:60"));
  ("v_Monad_uBase_uList_uList", ("Monad_Base_List_List", "Base/List.vuna:175"));
  ("v_Monad_uBase_uMaybe_uMaybe", ("Monad_Base_Maybe_Maybe", "Base/Maybe.vuna:48"));
  ("v_Monad_uBase_uResult_uResult", ("Monad_Base_Result_Result", "Base/Result.vuna:29"));
  ("v_Monad_uVuna_uCompiler_uBase_uCommon_uEffCheck", ("Monad_Vuna_Compiler_Base_Common_EffCheck", "Vuna/Compiler/Base/Common.vuna:46"));
  ("v_Monad_uVuna_uCompiler_uBase_uDiag_uCheck", ("Monad_Vuna_Compiler_Base_Diag_Check", "Vuna/Compiler/Base/Diag.vuna:369"));
  ("v_Monoid_uBase_uList_uList_ua", ("Monoid_Base_List_List_a", "Base/List.vuna:225"));
  ("v_Monoid_uBase_uMaybe_uMaybe_ua", ("Monoid_Base_Maybe_Maybe_a", "Base/Maybe.vuna:103"));
  ("v_Monoid_uBase_uNat_uNat", ("Monoid_Base_Nat_Nat", "Base/Nat.vuna:80"));
  ("v_Monoid_uBase_uUnit_uUnit", ("Monoid_Base_Unit_Unit", "Base/Unit.vuna:35"));
  ("v_Monoid_uString", ("Monoid_String", "Base/String.vuna:144"));
  ("v_Neg_uFloat", ("Neg_Float", "Base/Float.vuna:43"));
  ("v_Neg_uInt", ("Neg_Int", "Base/Int.vuna:31"));
  ("v_Num_uBase_uNat_uNat", ("Num_Base_Nat_Nat", "Base/Nat.vuna:65"));
  ("v_Num_uFloat", ("Num_Float", "Base/Float.vuna:36"));
  ("v_Num_uInt", ("Num_Int", "Base/Int.vuna:24"));
  ("v_Ord_uBase_uBool_uBool", ("Ord_Base_Bool_Bool", "Base/Ord.vuna:30"));
  ("v_Ord_uBase_uList_uList_ua", ("Ord_Base_List_List_a", "Base/List.vuna:206"));
  ("v_Ord_uBase_uMaybe_uMaybe_ua", ("Ord_Base_Maybe_Maybe_a", "Base/Maybe.vuna:82"));
  ("v_Ord_uBase_uNat_uNat", ("Ord_Base_Nat_Nat", "Base/Nat.vuna:58"));
  ("v_Ord_uBase_uOrd_uOrdering", ("Ord_Base_Ord_Ordering", "Base/Ord.vuna:56"));
  ("v_Ord_uBase_uPair_uPair_ua_ub", ("Ord_Base_Pair_Pair_a_b", "Base/Pair.vuna:37"));
  ("v_Ord_uBase_uUnit_uUnit", ("Ord_Base_Unit_Unit", "Base/Unit.vuna:20"));
  ("v_Ord_uFloat", ("Ord_Float", "Base/Float.vuna:29"));
  ("v_Ord_uInt", ("Ord_Int", "Base/Int.vuna:17"));
  ("v_Ord_uString", ("Ord_String", "Base/String.vuna:131"));
  ("v_Semigroup_uBase_uList_uList_ua", ("Semigroup_Base_List_List_a", "Base/List.vuna:222"));
  ("v_Semigroup_uBase_uMaybe_uMaybe_ua", ("Semigroup_Base_Maybe_Maybe_a", "Base/Maybe.vuna:96"));
  ("v_Semigroup_uBase_uNat_uNat", ("Semigroup_Base_Nat_Nat", "Base/Nat.vuna:77"));
  ("v_Semigroup_uBase_uUnit_uUnit", ("Semigroup_Base_Unit_Unit", "Base/Unit.vuna:32"));
  ("v_Semigroup_uString", ("Semigroup_String", "Base/String.vuna:141"));
  ("v_Show_uArray_ua", ("Show_Array_a", "Base/Array.vuna:40"));
  ("v_Show_uBase_uBool_uBool", ("Show_Base_Bool_Bool", "Base/Bool.vuna:43"));
  ("v_Show_uBase_uHashMap_uHashMap_uk_uv", ("Show_Base_HashMap_HashMap_k_v", "Base/HashMap.vuna:108"));
  ("v_Show_uBase_uList_uList_ua", ("Show_Base_List_List_a", "Base/List.vuna:195"));
  ("v_Show_uBase_uMaybe_uMaybe_ua", ("Show_Base_Maybe_Maybe_a", "Base/Maybe.vuna:69"));
  ("v_Show_uBase_uNat_uNat", ("Show_Base_Nat_Nat", "Base/Nat.vuna:71"));
  ("v_Show_uBase_uOrd_uOrdering", ("Show_Base_Ord_Ordering", "Base/Ord.vuna:71"));
  ("v_Show_uBase_uPair_uPair_ua_ub", ("Show_Base_Pair_Pair_a_b", "Base/Pair.vuna:28"));
  ("v_Show_uBase_uResult_uResult_ua", ("Show_Base_Result_Result_a", "Base/Result.vuna:71"));
  ("v_Show_uBase_uUnit_uUnit", ("Show_Base_Unit_Unit", "Base/Unit.vuna:26"));
  ("v_Show_uFloat", ("Show_Float", "Base/Float.vuna:46"));
  ("v_Show_uInt", ("Show_Int", "Base/Int.vuna:34"));
  ("v_Show_uString", ("Show_String", "Base/Show.vuna:14"));
  ("v_Traversable_uBase_uList_uList_uf", ("Traversable_Base_List_List_f", "Base/List.vuna:232"));
  ("v_Traversable_uBase_uMaybe_uMaybe_uf", ("Traversable_Base_Maybe_Maybe_f", "Base/Maybe.vuna:111"));
  ("v_Traversable_uBase_uResult_uResult_uf", ("Traversable_Base_Result_Result_f", "Base/Result.vuna:93"));
  ("v_Vuna_dCompiler_dBase_dBytes_dcurAtEnd", ("Vuna.Compiler.Base.Bytes.curAtEnd", "Vuna/Compiler/Base/Bytes.vuna:52"));
  ("v_Vuna_dCompiler_dBase_dBytes_dcurChar", ("Vuna.Compiler.Base.Bytes.curChar", "Vuna/Compiler/Base/Bytes.vuna:56"));
  ("v_Vuna_dCompiler_dBase_dBytes_dcurOf", ("Vuna.Compiler.Base.Bytes.curOf", "Vuna/Compiler/Base/Bytes.vuna:48"));
  ("v_Vuna_dCompiler_dBase_dBytes_dcurSkip", ("Vuna.Compiler.Base.Bytes.curSkip", "Vuna/Compiler/Base/Bytes.vuna:60"));
  ("v_Vuna_dCompiler_dBase_dBytes_dcurSlice", ("Vuna.Compiler.Base.Bytes.curSlice", "Vuna/Compiler/Base/Bytes.vuna:64"));
  ("v_Vuna_dCompiler_dBase_dBytes_ddecBool", ("Vuna.Compiler.Base.Bytes.decBool", "Vuna/Compiler/Base/Bytes.vuna:152"));
  ("v_Vuna_dCompiler_dBase_dBytes_ddecInt", ("Vuna.Compiler.Base.Bytes.decInt", "Vuna/Compiler/Base/Bytes.vuna:142"));
  ("v_Vuna_dCompiler_dBase_dBytes_ddecItems", ("Vuna.Compiler.Base.Bytes.decItems", "Vuna/Compiler/Base/Bytes.vuna:179"));
  ("v_Vuna_dCompiler_dBase_dBytes_ddecList", ("Vuna.Compiler.Base.Bytes.decList", "Vuna/Compiler/Base/Bytes.vuna:171"));
  ("v_Vuna_dCompiler_dBase_dBytes_ddecMaybe", ("Vuna.Compiler.Base.Bytes.decMaybe", "Vuna/Compiler/Base/Bytes.vuna:186"));
  ("v_Vuna_dCompiler_dBase_dBytes_ddecNumStop", ("Vuna.Compiler.Base.Bytes.decNumStop", "Vuna/Compiler/Base/Bytes.vuna:126"));
  ("v_Vuna_dCompiler_dBase_dBytes_ddecPair", ("Vuna.Compiler.Base.Bytes.decPair", "Vuna/Compiler/Base/Bytes.vuna:194"));
  ("v_Vuna_dCompiler_dBase_dBytes_ddecStr", ("Vuna.Compiler.Base.Bytes.decStr", "Vuna/Compiler/Base/Bytes.vuna:162"));
  ("v_Vuna_dCompiler_dBase_dBytes_ddecTag", ("Vuna.Compiler.Base.Bytes.decTag", "Vuna/Compiler/Base/Bytes.vuna:135"));
  ("v_Vuna_dCompiler_dBase_dBytes_dencBool", ("Vuna.Compiler.Base.Bytes.encBool", "Vuna/Compiler/Base/Bytes.vuna:93"));
  ("v_Vuna_dCompiler_dBase_dBytes_dencConcat", ("Vuna.Compiler.Base.Bytes.encConcat", "Vuna/Compiler/Base/Bytes.vuna:73"));
  ("v_Vuna_dCompiler_dBase_dBytes_dencInt", ("Vuna.Compiler.Base.Bytes.encInt", "Vuna/Compiler/Base/Bytes.vuna:85"));
  ("v_Vuna_dCompiler_dBase_dBytes_dencList", ("Vuna.Compiler.Base.Bytes.encList", "Vuna/Compiler/Base/Bytes.vuna:98"));
  ("v_Vuna_dCompiler_dBase_dBytes_dencListGo", ("Vuna.Compiler.Base.Bytes.encListGo", "Vuna/Compiler/Base/Bytes.vuna:102"));
  ("v_Vuna_dCompiler_dBase_dBytes_dencMaybe", ("Vuna.Compiler.Base.Bytes.encMaybe", "Vuna/Compiler/Base/Bytes.vuna:107"));
  ("v_Vuna_dCompiler_dBase_dBytes_dencPair", ("Vuna.Compiler.Base.Bytes.encPair", "Vuna/Compiler/Base/Bytes.vuna:112"));
  ("v_Vuna_dCompiler_dBase_dBytes_dencStr", ("Vuna.Compiler.Base.Bytes.encStr", "Vuna/Compiler/Base/Bytes.vuna:89"));
  ("v_Vuna_dCompiler_dBase_dBytes_dencTag", ("Vuna.Compiler.Base.Bytes.encTag", "Vuna/Compiler/Base/Bytes.vuna:81"));
  ("v_Vuna_dCompiler_dBase_dBytes_dencTop", ("Vuna.Compiler.Base.Bytes.encTop", "Vuna/Compiler/Base/Bytes.vuna:77"));
  ("v_Vuna_dCompiler_dBase_dBytes_disDigit", ("Vuna.Compiler.Base.Bytes.isDigit", "Vuna/Compiler/Base/Bytes.vuna:121"));
  ("v_Vuna_dCompiler_dBase_dBytes_dlenOf", ("Vuna.Compiler.Base.Bytes.lenOf", "Vuna/Compiler/Base/Bytes.vuna:68"));
  ("v_Vuna_dCompiler_dBase_dBytes_dthenPair", ("Vuna.Compiler.Base.Bytes.thenPair", "Vuna/Compiler/Base/Bytes.vuna:116"));
  ("v_Vuna_dCompiler_dBase_dCommon_dbind", ("Vuna.Compiler.Base.Common.bind", "Vuna/Compiler/Base/Common.vuna:26"));
  ("v_Vuna_dCompiler_dBase_dCommon_drunEffCheck", ("Vuna.Compiler.Base.Common.runEffCheck", "Vuna/Compiler/Base/Common.vuna:36"));
  ("v_Vuna_dCompiler_dBase_dCommon_dstep", ("Vuna.Compiler.Base.Common.step", "Vuna/Compiler/Base/Common.vuna:51"));
  ("v_Vuna_dCompiler_dBase_dCommon_dtraverse", ("Vuna.Compiler.Base.Common.traverse", "Vuna/Compiler/Base/Common.vuna:56"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dabsentEnc", ("Vuna.Compiler.Base.Diag.Codec.absentEnc", "Vuna/Compiler/Base/Diag/Codec.vuna:373"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dabsentOfTag", ("Vuna.Compiler.Base.Diag.Codec.absentOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:133"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dabsentTag", ("Vuna.Compiler.Base.Diag.Codec.absentTag", "Vuna/Compiler/Base/Diag/Codec.vuna:127"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dapplicabilityOfTag", ("Vuna.Compiler.Base.Diag.Codec.applicabilityOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:121"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dapplicabilityTag", ("Vuna.Compiler.Base.Diag.Codec.applicabilityTag", "Vuna/Compiler/Base/Diag/Codec.vuna:116"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dcatOfTag", ("Vuna.Compiler.Base.Diag.Codec.catOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:88"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dcatTag", ("Vuna.Compiler.Base.Diag.Codec.catTag", "Vuna/Compiler/Base/Diag/Codec.vuna:72"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dcheckOutcomeCodec", ("Vuna.Compiler.Base.Diag.Codec.checkOutcomeCodec", "Vuna/Compiler/Base/Diag/Codec.vuna:396"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dcheckResultCodec", ("Vuna.Compiler.Base.Diag.Codec.checkResultCodec", "Vuna/Compiler/Base/Diag/Codec.vuna:412"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecCall", ("Vuna.Compiler.Base.Diag.Codec.decCall", "Vuna/Compiler/Base/Diag/Codec.vuna:232"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecCandidate", ("Vuna.Compiler.Base.Diag.Codec.decCandidate", "Vuna/Compiler/Base/Diag/Codec.vuna:222"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecCheckOutcome", ("Vuna.Compiler.Base.Diag.Codec.decCheckOutcome", "Vuna/Compiler/Base/Diag/Codec.vuna:418"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecCount", ("Vuna.Compiler.Base.Diag.Codec.decCount", "Vuna/Compiler/Base/Diag/Codec.vuna:172"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecDiag", ("Vuna.Compiler.Base.Diag.Codec.decDiag", "Vuna/Compiler/Base/Diag/Codec.vuna:319"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecDiagItems", ("Vuna.Compiler.Base.Diag.Codec.decDiagItems", "Vuna/Compiler/Base/Diag/Codec.vuna:359"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecDiagList", ("Vuna.Compiler.Base.Diag.Codec.decDiagList", "Vuna/Compiler/Base/Diag/Codec.vuna:353"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecDiagnostics", ("Vuna.Compiler.Base.Diag.Codec.decDiagnostics", "Vuna/Compiler/Base/Diag/Codec.vuna:383"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecEdit", ("Vuna.Compiler.Base.Diag.Codec.decEdit", "Vuna/Compiler/Base/Diag/Codec.vuna:199"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecField", ("Vuna.Compiler.Base.Diag.Codec.decField", "Vuna/Compiler/Base/Diag/Codec.vuna:251"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecIce", ("Vuna.Compiler.Base.Diag.Codec.decIce", "Vuna/Compiler/Base/Diag/Codec.vuna:286"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecLabel", ("Vuna.Compiler.Base.Diag.Codec.decLabel", "Vuna/Compiler/Base/Diag/Codec.vuna:186"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecOrigin", ("Vuna.Compiler.Base.Diag.Codec.decOrigin", "Vuna/Compiler/Base/Diag/Codec.vuna:275"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecOutcome", ("Vuna.Compiler.Base.Diag.Codec.decOutcome", "Vuna/Compiler/Base/Diag/Codec.vuna:403"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecSpan", ("Vuna.Compiler.Base.Diag.Codec.decSpan", "Vuna/Compiler/Base/Diag/Codec.vuna:157"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecSuggestion", ("Vuna.Compiler.Base.Diag.Codec.decSuggestion", "Vuna/Compiler/Base/Diag/Codec.vuna:209"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddecTrace", ("Vuna.Compiler.Base.Diag.Codec.decTrace", "Vuna/Compiler/Base/Diag/Codec.vuna:294"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_ddiagCodec", ("Vuna.Compiler.Base.Diag.Codec.diagCodec", "Vuna/Compiler/Base/Diag/Codec.vuna:20"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencCall", ("Vuna.Compiler.Base.Diag.Codec.encCall", "Vuna/Compiler/Base/Diag/Codec.vuna:227"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencCandidate", ("Vuna.Compiler.Base.Diag.Codec.encCandidate", "Vuna/Compiler/Base/Diag/Codec.vuna:217"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencCheckOutcome", ("Vuna.Compiler.Base.Diag.Codec.encCheckOutcome", "Vuna/Compiler/Base/Diag/Codec.vuna:415"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencDiag", ("Vuna.Compiler.Base.Diag.Codec.encDiag", "Vuna/Compiler/Base/Diag/Codec.vuna:314"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencDiagList", ("Vuna.Compiler.Base.Diag.Codec.encDiagList", "Vuna/Compiler/Base/Diag/Codec.vuna:302"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencDiagListGo", ("Vuna.Compiler.Base.Diag.Codec.encDiagListGo", "Vuna/Compiler/Base/Diag/Codec.vuna:305"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencDiagnostics", ("Vuna.Compiler.Base.Diag.Codec.encDiagnostics", "Vuna/Compiler/Base/Diag/Codec.vuna:380"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencEdit", ("Vuna.Compiler.Base.Diag.Codec.encEdit", "Vuna/Compiler/Base/Diag/Codec.vuna:196"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencField", ("Vuna.Compiler.Base.Diag.Codec.encField", "Vuna/Compiler/Base/Diag/Codec.vuna:238"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencIce", ("Vuna.Compiler.Base.Diag.Codec.encIce", "Vuna/Compiler/Base/Diag/Codec.vuna:282"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencLabel", ("Vuna.Compiler.Base.Diag.Codec.encLabel", "Vuna/Compiler/Base/Diag/Codec.vuna:181"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencOrigin", ("Vuna.Compiler.Base.Diag.Codec.encOrigin", "Vuna/Compiler/Base/Diag/Codec.vuna:271"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencOutcome", ("Vuna.Compiler.Base.Diag.Codec.encOutcome", "Vuna/Compiler/Base/Diag/Codec.vuna:399"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencSpan", ("Vuna.Compiler.Base.Diag.Codec.encSpan", "Vuna/Compiler/Base/Diag/Codec.vuna:152"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencSuggestion", ("Vuna.Compiler.Base.Diag.Codec.encSuggestion", "Vuna/Compiler/Base/Diag/Codec.vuna:204"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dencTrace", ("Vuna.Compiler.Base.Diag.Codec.encTrace", "Vuna/Compiler/Base/Diag/Codec.vuna:310"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dmtAbsent", ("Vuna.Compiler.Base.Diag.Codec.mtAbsent", "Vuna/Compiler/Base/Diag/Codec.vuna:366"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dphaseOfTag", ("Vuna.Compiler.Base.Diag.Codec.phaseOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:55"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dphaseTag", ("Vuna.Compiler.Base.Diag.Codec.phaseTag", "Vuna/Compiler/Base/Diag/Codec.vuna:39"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dreadCount", ("Vuna.Compiler.Base.Diag.Codec.readCount", "Vuna/Compiler/Base/Diag/Codec.vuna:164"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dsevOfTag", ("Vuna.Compiler.Base.Diag.Codec.sevOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:32"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dsevTag", ("Vuna.Compiler.Base.Diag.Codec.sevTag", "Vuna/Compiler/Base/Diag/Codec.vuna:26"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dstabilityOfTag", ("Vuna.Compiler.Base.Diag.Codec.stabilityOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:144"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dstabilityTag", ("Vuna.Compiler.Base.Diag.Codec.stabilityTag", "Vuna/Compiler/Base/Diag/Codec.vuna:140"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dstyleOfTag", ("Vuna.Compiler.Base.Diag.Codec.styleOfTag", "Vuna/Compiler/Base/Diag/Codec.vuna:110"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dstyleTag", ("Vuna.Compiler.Base.Diag.Codec.styleTag", "Vuna/Compiler/Base/Diag/Codec.vuna:105"));
  ("v_Vuna_dCompiler_dBase_dDiag_dCodec_dthenPair", ("Vuna.Compiler.Base.Diag.Codec.thenPair", "Vuna/Compiler/Base/Diag/Codec.vuna:177"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dabsentName", ("Vuna.Compiler.Base.Diag.Format.absentName", "Vuna/Compiler/Base/Diag/Format.vuna:389"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dapplicabilityName", ("Vuna.Compiler.Base.Diag.Format.applicabilityName", "Vuna/Compiler/Base/Diag/Format.vuna:70"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dcallSpanSuffix", ("Vuna.Compiler.Base.Diag.Format.callSpanSuffix", "Vuna/Compiler/Base/Diag/Format.vuna:551"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dcandidateTextOf", ("Vuna.Compiler.Base.Diag.Format.candidateTextOf", "Vuna/Compiler/Base/Diag/Format.vuna:547"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dcaretWidthIn", ("Vuna.Compiler.Base.Diag.Format.caretWidthIn", "Vuna/Compiler/Base/Diag/Format.vuna:132"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dcategoryName", ("Vuna.Compiler.Base.Diag.Format.categoryName", "Vuna/Compiler/Base/Diag/Format.vuna:50"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_ddiagDescLine", ("Vuna.Compiler.Base.Diag.Format.diagDescLine", "Vuna/Compiler/Base/Diag/Format.vuna:513"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_ddisplayColGo", ("Vuna.Compiler.Base.Diag.Format.displayColGo", "Vuna/Compiler/Base/Diag/Format.vuna:121"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_ddisplayColOf", ("Vuna.Compiler.Base.Diag.Format.displayColOf", "Vuna/Compiler/Base/Diag/Format.vuna:127"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_ddisplayLine", ("Vuna.Compiler.Base.Diag.Format.displayLine", "Vuna/Compiler/Base/Diag/Format.vuna:102"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dfieldLine", ("Vuna.Compiler.Base.Diag.Format.fieldLine", "Vuna/Compiler/Base/Diag/Format.vuna:519"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dghChar", ("Vuna.Compiler.Base.Diag.Format.ghChar", "Vuna/Compiler/Base/Diag/Format.vuna:229"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dgithubEscape", ("Vuna.Compiler.Base.Diag.Format.githubEscape", "Vuna/Compiler/Base/Diag/Format.vuna:226"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dheaderOf", ("Vuna.Compiler.Base.Diag.Format.headerOf", "Vuna/Compiler/Base/Diag/Format.vuna:252"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dhex2", ("Vuna.Compiler.Base.Diag.Format.hex2", "Vuna/Compiler/Base/Diag/Format.vuna:295"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dhexDigit", ("Vuna.Compiler.Base.Diag.Format.hexDigit", "Vuna/Compiler/Base/Diag/Format.vuna:302"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dindent", ("Vuna.Compiler.Base.Diag.Format.indent", "Vuna/Compiler/Base/Diag/Format.vuna:538"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_disContextStyle", ("Vuna.Compiler.Base.Diag.Format.isContextStyle", "Vuna/Compiler/Base/Diag/Format.vuna:196"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_disPrimaryLabel", ("Vuna.Compiler.Base.Diag.Format.isPrimaryLabel", "Vuna/Compiler/Base/Diag/Format.vuna:467"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_disPrimaryStyle", ("Vuna.Compiler.Base.Diag.Format.isPrimaryStyle", "Vuna/Compiler/Base/Diag/Format.vuna:192"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_disUtf8Cont", ("Vuna.Compiler.Base.Diag.Format.isUtf8Cont", "Vuna/Compiler/Base/Diag/Format.vuna:117"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonAbsent", ("Vuna.Compiler.Base.Diag.Format.jsonAbsent", "Vuna/Compiler/Base/Diag/Format.vuna:395"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonCandidate", ("Vuna.Compiler.Base.Diag.Format.jsonCandidate", "Vuna/Compiler/Base/Diag/Format.vuna:333"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonDiag", ("Vuna.Compiler.Base.Diag.Format.jsonDiag", "Vuna/Compiler/Base/Diag/Format.vuna:399"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonDiagEdit", ("Vuna.Compiler.Base.Diag.Format.jsonDiagEdit", "Vuna/Compiler/Base/Diag/Format.vuna:357"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonEscape", ("Vuna.Compiler.Base.Diag.Format.jsonEscape", "Vuna/Compiler/Base/Diag/Format.vuna:307"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonEscapeChar", ("Vuna.Compiler.Base.Diag.Format.jsonEscapeChar", "Vuna/Compiler/Base/Diag/Format.vuna:287"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonField", ("Vuna.Compiler.Base.Diag.Format.jsonField", "Vuna/Compiler/Base/Diag/Format.vuna:341"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonIce", ("Vuna.Compiler.Base.Diag.Format.jsonIce", "Vuna/Compiler/Base/Diag/Format.vuna:372"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonLabel", ("Vuna.Compiler.Base.Diag.Format.jsonLabel", "Vuna/Compiler/Base/Diag/Format.vuna:320"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonPos", ("Vuna.Compiler.Base.Diag.Format.jsonPos", "Vuna/Compiler/Base/Diag/Format.vuna:313"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonSource", ("Vuna.Compiler.Base.Diag.Format.jsonSource", "Vuna/Compiler/Base/Diag/Format.vuna:419"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonSpan", ("Vuna.Compiler.Base.Diag.Format.jsonSpan", "Vuna/Compiler/Base/Diag/Format.vuna:316"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonStr", ("Vuna.Compiler.Base.Diag.Format.jsonStr", "Vuna/Compiler/Base/Diag/Format.vuna:310"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonSuggestion", ("Vuna.Compiler.Base.Diag.Format.jsonSuggestion", "Vuna/Compiler/Base/Diag/Format.vuna:360"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonTrace", ("Vuna.Compiler.Base.Diag.Format.jsonTrace", "Vuna/Compiler/Base/Diag/Format.vuna:364"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_djsonTraceFuel", ("Vuna.Compiler.Base.Diag.Format.jsonTraceFuel", "Vuna/Compiler/Base/Diag/Format.vuna:367"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dlineAt", ("Vuna.Compiler.Base.Diag.Format.lineAt", "Vuna/Compiler/Base/Diag/Format.vuna:97"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dlocalizedJsonField", ("Vuna.Compiler.Base.Diag.Format.localizedJsonField", "Vuna/Compiler/Base/Diag/Format.vuna:555"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dlocalizedMessage", ("Vuna.Compiler.Base.Diag.Format.localizedMessage", "Vuna/Compiler/Base/Diag/Format.vuna:246"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dmaybeJsonIce", ("Vuna.Compiler.Base.Diag.Format.maybeJsonIce", "Vuna/Compiler/Base/Diag/Format.vuna:376"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dmaybeJsonSpan", ("Vuna.Compiler.Base.Diag.Format.maybeJsonSpan", "Vuna/Compiler/Base/Diag/Format.vuna:329"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dmaybeJsonString", ("Vuna.Compiler.Base.Diag.Format.maybeJsonString", "Vuna/Compiler/Base/Diag/Format.vuna:337"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dmaybeParent", ("Vuna.Compiler.Base.Diag.Format.maybeParent", "Vuna/Compiler/Base/Diag/Format.vuna:384"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dmemCode", ("Vuna.Compiler.Base.Diag.Format.memCode", "Vuna/Compiler/Base/Diag/Format.vuna:481"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_doriginJson", ("Vuna.Compiler.Base.Diag.Format.originJson", "Vuna/Compiler/Base/Diag/Format.vuna:380"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_doriginName", ("Vuna.Compiler.Base.Diag.Format.originName", "Vuna/Compiler/Base/Diag/Format.vuna:66"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dpadLeft", ("Vuna.Compiler.Base.Diag.Format.padLeft", "Vuna/Compiler/Base/Diag/Format.vuna:112"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dphaseName", ("Vuna.Compiler.Base.Diag.Format.phaseName", "Vuna/Compiler/Base/Diag/Format.vuna:34"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dprimarySpan", ("Vuna.Compiler.Base.Diag.Format.primarySpan", "Vuna/Compiler/Base/Diag/Format.vuna:85"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dprimaryText", ("Vuna.Compiler.Base.Diag.Format.primaryText", "Vuna/Compiler/Base/Diag/Format.vuna:91"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_drelatedBlocks", ("Vuna.Compiler.Base.Diag.Format.relatedBlocks", "Vuna/Compiler/Base/Diag/Format.vuna:200"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderGithub", ("Vuna.Compiler.Base.Diag.Format.renderGithub", "Vuna/Compiler/Base/Diag/Format.vuna:235"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderHuman", ("Vuna.Compiler.Base.Diag.Format.renderHuman", "Vuna/Compiler/Base/Diag/Format.vuna:260"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderJson", ("Vuna.Compiler.Base.Diag.Format.renderJson", "Vuna/Compiler/Base/Diag/Format.vuna:404"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderJsonList", ("Vuna.Compiler.Base.Diag.Format.renderJsonList", "Vuna/Compiler/Base/Diag/Format.vuna:407"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderJsonListWithSources", ("Vuna.Compiler.Base.Diag.Format.renderJsonListWithSources", "Vuna/Compiler/Base/Diag/Format.vuna:423"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderRelated", ("Vuna.Compiler.Base.Diag.Format.renderRelated", "Vuna/Compiler/Base/Diag/Format.vuna:219"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderSarif", ("Vuna.Compiler.Base.Diag.Format.renderSarif", "Vuna/Compiler/Base/Diag/Format.vuna:505"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderShort", ("Vuna.Compiler.Base.Diag.Format.renderShort", "Vuna/Compiler/Base/Diag/Format.vuna:78"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderShortSnippetEff", ("Vuna.Compiler.Base.Diag.Format.renderShortSnippetEff", "Vuna/Compiler/Base/Diag/Format.vuna:172"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_drenderSnippet", ("Vuna.Compiler.Base.Diag.Format.renderSnippet", "Vuna/Compiler/Base/Diag/Format.vuna:159"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_drepeatSpace", ("Vuna.Compiler.Base.Diag.Format.repeatSpace", "Vuna/Compiler/Base/Diag/Format.vuna:109"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_druleJson", ("Vuna.Compiler.Base.Diag.Format.ruleJson", "Vuna/Compiler/Base/Diag/Format.vuna:485"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dsameAsPrimary", ("Vuna.Compiler.Base.Diag.Format.sameAsPrimary", "Vuna/Compiler/Base/Diag/Format.vuna:188"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dsameSpan", ("Vuna.Compiler.Base.Diag.Format.sameSpan", "Vuna/Compiler/Base/Diag/Format.vuna:180"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dsarifLevel", ("Vuna.Compiler.Base.Diag.Format.sarifLevel", "Vuna/Compiler/Base/Diag/Format.vuna:430"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dsarifLevelName", ("Vuna.Compiler.Base.Diag.Format.sarifLevelName", "Vuna/Compiler/Base/Diag/Format.vuna:499"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dsarifLocation", ("Vuna.Compiler.Base.Diag.Format.sarifLocation", "Vuna/Compiler/Base/Diag/Format.vuna:443"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dsarifRegion", ("Vuna.Compiler.Base.Diag.Format.sarifRegion", "Vuna/Compiler/Base/Diag/Format.vuna:439"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dsarifRelated", ("Vuna.Compiler.Base.Diag.Format.sarifRelated", "Vuna/Compiler/Base/Diag/Format.vuna:447"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dsarifResult", ("Vuna.Compiler.Base.Diag.Format.sarifResult", "Vuna/Compiler/Base/Diag/Format.vuna:453"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dsarifRuleId", ("Vuna.Compiler.Base.Diag.Format.sarifRuleId", "Vuna/Compiler/Base/Diag/Format.vuna:436"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dsarifRules", ("Vuna.Compiler.Base.Diag.Format.sarifRules", "Vuna/Compiler/Base/Diag/Format.vuna:473"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dseverityName", ("Vuna.Compiler.Base.Diag.Format.severityName", "Vuna/Compiler/Base/Diag/Format.vuna:28"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dshowInt", ("Vuna.Compiler.Base.Diag.Format.showInt", "Vuna/Compiler/Base/Diag/Format.vuna:544"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dsnippetOf", ("Vuna.Compiler.Base.Diag.Format.snippetOf", "Vuna/Compiler/Base/Diag/Format.vuna:142"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dstyleName", ("Vuna.Compiler.Base.Diag.Format.styleName", "Vuna/Compiler/Base/Diag/Format.vuna:324"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dsuggestionLine", ("Vuna.Compiler.Base.Diag.Format.suggestionLine", "Vuna/Compiler/Base/Diag/Format.vuna:541"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dtabToSpace", ("Vuna.Compiler.Base.Diag.Format.tabToSpace", "Vuna/Compiler/Base/Diag/Format.vuna:105"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_dtraceLines", ("Vuna.Compiler.Base.Diag.Format.traceLines", "Vuna/Compiler/Base/Diag/Format.vuna:533"));
  ("v_Vuna_dCompiler_dBase_dDiag_dFormat_duniqueCodes", ("Vuna.Compiler.Base.Diag.Format.uniqueCodes", "Vuna/Compiler/Base/Diag/Format.vuna:476"));
  ("v_Vuna_dCompiler_dBase_dDiag_dappendMessage", ("Vuna.Compiler.Base.Diag.appendMessage", "Vuna/Compiler/Base/Diag.vuna:357"));
  ("v_Vuna_dCompiler_dBase_dDiag_dcontextPrefixOf", ("Vuna.Compiler.Base.Diag.contextPrefixOf", "Vuna/Compiler/Base/Diag.vuna:331"));
  ("v_Vuna_dCompiler_dBase_dDiag_ddiagAt", ("Vuna.Compiler.Base.Diag.diagAt", "Vuna/Compiler/Base/Diag.vuna:198"));
  ("v_Vuna_dCompiler_dBase_dDiag_ddiagFileOf", ("Vuna.Compiler.Base.Diag.diagFileOf", "Vuna/Compiler/Base/Diag.vuna:450"));
  ("v_Vuna_dCompiler_dBase_dDiag_ddiagNoLoc", ("Vuna.Compiler.Base.Diag.diagNoLoc", "Vuna/Compiler/Base/Diag.vuna:192"));
  ("v_Vuna_dCompiler_dBase_dDiag_ddiagText", ("Vuna.Compiler.Base.Diag.diagText", "Vuna/Compiler/Base/Diag.vuna:343"));
  ("v_Vuna_dCompiler_dBase_dDiag_derr", ("Vuna.Compiler.Base.Diag.err", "Vuna/Compiler/Base/Diag.vuna:204"));
  ("v_Vuna_dCompiler_dBase_dDiag_dhasPrimaryLabel", ("Vuna.Compiler.Base.Diag.hasPrimaryLabel", "Vuna/Compiler/Base/Diag.vuna:415"));
  ("v_Vuna_dCompiler_dBase_dDiag_dicFuel", ("Vuna.Compiler.Base.Diag.icFuel", "Vuna/Compiler/Base/Diag.vuna:433"));
  ("v_Vuna_dCompiler_dBase_dDiag_dicInternal", ("Vuna.Compiler.Base.Diag.icInternal", "Vuna/Compiler/Base/Diag.vuna:439"));
  ("v_Vuna_dCompiler_dBase_dDiag_dlabelSpanOf", ("Vuna.Compiler.Base.Diag.labelSpanOf", "Vuna/Compiler/Base/Diag.vuna:477"));
  ("v_Vuna_dCompiler_dBase_dDiag_dlocPrefixOf", ("Vuna.Compiler.Base.Diag.locPrefixOf", "Vuna/Compiler/Base/Diag.vuna:337"));
  ("v_Vuna_dCompiler_dBase_dDiag_dmapDiagChildren", ("Vuna.Compiler.Base.Diag.mapDiagChildren", "Vuna/Compiler/Base/Diag.vuna:247"));
  ("v_Vuna_dCompiler_dBase_dDiag_dmapLabelFile", ("Vuna.Compiler.Base.Diag.mapLabelFile", "Vuna/Compiler/Base/Diag.vuna:251"));
  ("v_Vuna_dCompiler_dBase_dDiag_dmapSpanFile", ("Vuna.Compiler.Base.Diag.mapSpanFile", "Vuna/Compiler/Base/Diag.vuna:241"));
  ("v_Vuna_dCompiler_dBase_dDiag_dmapSpanPath", ("Vuna.Compiler.Base.Diag.mapSpanPath", "Vuna/Compiler/Base/Diag.vuna:255"));
  ("v_Vuna_dCompiler_dBase_dDiag_dmarkInternal", ("Vuna.Compiler.Base.Diag.markInternal", "Vuna/Compiler/Base/Diag.vuna:424"));
  ("v_Vuna_dCompiler_dBase_dDiag_dnormalizeSite", ("Vuna.Compiler.Base.Diag.normalizeSite", "Vuna/Compiler/Base/Diag.vuna:231"));
  ("v_Vuna_dCompiler_dBase_dDiag_donErrDiag", ("Vuna.Compiler.Base.Diag.onErrDiag", "Vuna/Compiler/Base/Diag.vuna:445"));
  ("v_Vuna_dCompiler_dBase_dDiag_dprimaryLabelOf", ("Vuna.Compiler.Base.Diag.primaryLabelOf", "Vuna/Compiler/Base/Diag.vuna:456"));
  ("v_Vuna_dCompiler_dBase_dDiag_dprimarySpanOf", ("Vuna.Compiler.Base.Diag.primarySpanOf", "Vuna/Compiler/Base/Diag.vuna:325"));
  ("v_Vuna_dCompiler_dBase_dDiag_drawAt", ("Vuna.Compiler.Base.Diag.rawAt", "Vuna/Compiler/Base/Diag.vuna:210"));
  ("v_Vuna_dCompiler_dBase_dDiag_drawNoLoc", ("Vuna.Compiler.Base.Diag.rawNoLoc", "Vuna/Compiler/Base/Diag.vuna:216"));
  ("v_Vuna_dCompiler_dBase_dDiag_dsameDiag", ("Vuna.Compiler.Base.Diag.sameDiag", "Vuna/Compiler/Base/Diag.vuna:470"));
  ("v_Vuna_dCompiler_dBase_dDiag_dsameSeverity", ("Vuna.Compiler.Base.Diag.sameSeverity", "Vuna/Compiler/Base/Diag.vuna:462"));
  ("v_Vuna_dCompiler_dBase_dDiag_dstabilityOfAbsent", ("Vuna.Compiler.Base.Diag.stabilityOfAbsent", "Vuna/Compiler/Base/Diag.vuna:267"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithAbsent", ("Vuna.Compiler.Base.Diag.withAbsent", "Vuna/Compiler/Base/Diag.vuna:262"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithChildren", ("Vuna.Compiler.Base.Diag.withChildren", "Vuna/Compiler/Base/Diag.vuna:387"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithContext", ("Vuna.Compiler.Base.Diag.withContext", "Vuna/Compiler/Base/Diag.vuna:313"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithFallbackSpan", ("Vuna.Compiler.Base.Diag.withFallbackSpan", "Vuna/Compiler/Base/Diag.vuna:394"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithField", ("Vuna.Compiler.Base.Diag.withField", "Vuna/Compiler/Base/Diag.vuna:274"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithHelp", ("Vuna.Compiler.Base.Diag.withHelp", "Vuna/Compiler/Base/Diag.vuna:288"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithLabel", ("Vuna.Compiler.Base.Diag.withLabel", "Vuna/Compiler/Base/Diag.vuna:225"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithLabelFileIfEmpty", ("Vuna.Compiler.Base.Diag.withLabelFileIfEmpty", "Vuna/Compiler/Base/Diag.vuna:407"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithMessage", ("Vuna.Compiler.Base.Diag.withMessage", "Vuna/Compiler/Base/Diag.vuna:350"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithNote", ("Vuna.Compiler.Base.Diag.withNote", "Vuna/Compiler/Base/Diag.vuna:281"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithOrigin", ("Vuna.Compiler.Base.Diag.withOrigin", "Vuna/Compiler/Base/Diag.vuna:306"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithSpanFileIfEmpty", ("Vuna.Compiler.Base.Diag.withSpanFileIfEmpty", "Vuna/Compiler/Base/Diag.vuna:400"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithStability", ("Vuna.Compiler.Base.Diag.withStability", "Vuna/Compiler/Base/Diag.vuna:237"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithSuggestion", ("Vuna.Compiler.Base.Diag.withSuggestion", "Vuna/Compiler/Base/Diag.vuna:292"));
  ("v_Vuna_dCompiler_dBase_dDiag_dwithTrace", ("Vuna.Compiler.Base.Diag.withTrace", "Vuna/Compiler/Base/Diag.vuna:299"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgAll", ("Vuna.Compiler.Base.Diagnostics.Cg.cgAll", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:66"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgChunk0", ("Vuna.Compiler.Base.Diagnostics.Cg.cgChunk0", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:69"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgChunk1", ("Vuna.Compiler.Base.Diagnostics.Cg.cgChunk1", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:80"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgCode", ("Vuna.Compiler.Base.Diagnostics.Cg.cgCode", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:32"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr", ("Vuna.Compiler.Base.Diagnostics.Cg.cgErr", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:94"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0", ("Vuna.Compiler.Base.Diagnostics.Cg.cgErr0", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:98"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr0At", ("Vuna.Compiler.Base.Diagnostics.Cg.cgErr0At", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:106"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErr1", ("Vuna.Compiler.Base.Diagnostics.Cg.cgErr1", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:102"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgErrDefAt", ("Vuna.Compiler.Base.Diagnostics.Cg.cgErrDefAt", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:112"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgMsg", ("Vuna.Compiler.Base.Diagnostics.Cg.cgMsg", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:91"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCg_dcgTemplate", ("Vuna.Compiler.Base.Diagnostics.Cg.cgTemplate", "Vuna/Compiler/Base/Diagnostics/Cg.vuna:45"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCommon_dconcatLists", ("Vuna.Compiler.Base.Diagnostics.Common.concatLists", "Vuna/Compiler/Base/Diagnostics/Common.vuna:35"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCommon_ddiagBody", ("Vuna.Compiler.Base.Diagnostics.Common.diagBody", "Vuna/Compiler/Base/Diagnostics/Common.vuna:18"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCommon_dmkDiag", ("Vuna.Compiler.Base.Diagnostics.Common.mkDiag", "Vuna/Compiler/Base/Diagnostics/Common.vuna:22"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCommon_dwithDiagDef", ("Vuna.Compiler.Base.Diagnostics.Common.withDiagDef", "Vuna/Compiler/Base/Diagnostics/Common.vuna:30"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dCommon_dwithDiagSpan", ("Vuna.Compiler.Base.Diagnostics.Common.withDiagSpan", "Vuna/Compiler/Base/Diagnostics/Common.vuna:26"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexAll", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexAll", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:221"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexCode", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexCode", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:31"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErr0At", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexErr0At", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:304"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexErrAt", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexErrAt", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:292"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexMsg", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexMsg", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:285"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dlexTemplate", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexTemplate", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:39"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsAll", ("Vuna.Compiler.Base.Diagnostics.Frontend.psAll", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:231"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsCode", ("Vuna.Compiler.Base.Diagnostics.Frontend.psCode", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:109"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr0At", ("Vuna.Compiler.Base.Diagnostics.Frontend.psErr0At", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:308"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErr1At", ("Vuna.Compiler.Base.Diagnostics.Frontend.psErr1At", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:312"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsErrAt", ("Vuna.Compiler.Base.Diagnostics.Frontend.psErrAt", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:296"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsMsg", ("Vuna.Compiler.Base.Diagnostics.Frontend.psMsg", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:288"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dFrontend_dpsTemplate", ("Vuna.Compiler.Base.Diagnostics.Frontend.psTemplate", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:156"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dIc_dicAll", ("Vuna.Compiler.Base.Diagnostics.Ic.icAll", "Vuna/Compiler/Base/Diagnostics/Ic.vuna:30"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dIc_dicCode", ("Vuna.Compiler.Base.Diagnostics.Ic.icCode", "Vuna/Compiler/Base/Diagnostics/Ic.vuna:16"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dIc_dicTemplate", ("Vuna.Compiler.Base.Diagnostics.Ic.icTemplate", "Vuna/Compiler/Base/Diagnostics/Ic.vuna:20"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldAll", ("Vuna.Compiler.Base.Diagnostics.Loader.ldAll", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:54"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldCode", ("Vuna.Compiler.Base.Diagnostics.Loader.ldCode", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:28"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr", ("Vuna.Compiler.Base.Diagnostics.Loader.ldErr", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:69"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr0", ("Vuna.Compiler.Base.Diagnostics.Loader.ldErr0", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:73"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr1", ("Vuna.Compiler.Base.Diagnostics.Loader.ldErr1", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:77"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr2", ("Vuna.Compiler.Base.Diagnostics.Loader.ldErr2", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:85"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldErr4", ("Vuna.Compiler.Base.Diagnostics.Loader.ldErr4", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:81"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldMsg", ("Vuna.Compiler.Base.Diagnostics.Loader.ldMsg", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:66"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dLoader_dldTemplate", ("Vuna.Compiler.Base.Diagnostics.Loader.ldTemplate", "Vuna/Compiler/Base/Diagnostics/Loader.vuna:38"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_datSpan", ("Vuna.Compiler.Base.Diagnostics.Pkg.atSpan", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:175"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAll", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgAll", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:230"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgAt", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:180"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt0", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgAt0", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:196"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt1", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgAt1", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:200"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgAt2", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgAt2", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:204"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgCode", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgCode", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:64"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgInvalid", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgInvalid", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:220"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgMsg", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgMsg", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:167"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgNoLoc", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:188"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgNoLoc1", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgNoLoc1", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:192"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgPath", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:184"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath0", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgPath0", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:208"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath1", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgPath1", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:212"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgPath2", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgPath2", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:216"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgSpan", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgSpan", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:171"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dPkg_dpkgTemplate", ("Vuna.Compiler.Base.Diagnostics.Pkg.pkgTemplate", "Vuna/Compiler/Base/Diagnostics/Pkg.vuna:109"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAll", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAll", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:169"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt0", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAt0", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:135"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt1", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAt1", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:139"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt2", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAt2", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:143"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnAt3", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAt3", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:147"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnCode", ("Vuna.Compiler.Base.Diagnostics.Rn.rnCode", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:56"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnErr", ("Vuna.Compiler.Base.Diagnostics.Rn.rnErr", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:127"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnMsg", ("Vuna.Compiler.Base.Diagnostics.Rn.rnMsg", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:123"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:131"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc0", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc0", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:151"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc1", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc1", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:155"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnNoLoc2", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc2", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:159"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dRn_drnTemplate", ("Vuna.Compiler.Base.Diagnostics.Rn.rnTemplate", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:87"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddedupeGo", ("Vuna.Compiler.Base.Diagnostics.Sink.dedupeGo", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:56"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddedupeWarnings", ("Vuna.Compiler.Base.Diagnostics.Sink.dedupeWarnings", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:66"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dSink_ddiagKey", ("Vuna.Compiler.Base.Diagnostics.Sink.diagKey", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:31"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dseverityTag", ("Vuna.Compiler.Base.Diagnostics.Sink.severityTag", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:20"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dspanPart", ("Vuna.Compiler.Base.Diagnostics.Sink.spanPart", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:42"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dspansKey", ("Vuna.Compiler.Base.Diagnostics.Sink.spansKey", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:36"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dSink_dtagPart", ("Vuna.Compiler.Base.Diagnostics.Sink.tagPart", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:27"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dcoverageCandidate", ("Vuna.Compiler.Base.Diagnostics.Tc.coverageCandidate", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:628"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcAll", ("Vuna.Compiler.Base.Diagnostics.Tc.tcAll", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:552"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk0", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk0", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:396"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk1", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk1", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:406"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk10", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk10", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:515"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk11", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk11", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:531"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk12", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk12", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:545"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk2", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk2", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:417"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk3", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk3", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:430"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk4", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk4", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:442"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk5", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk5", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:452"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk6", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk6", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:464"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk7", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk7", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:477"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk8", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk8", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:488"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcChunk9", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk9", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:503"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcCode", ("Vuna.Compiler.Base.Diagnostics.Tc.tcCode", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:146"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcCoverageMissing", ("Vuna.Compiler.Base.Diagnostics.Tc.tcCoverageMissing", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:620"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:565"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr0", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:572"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr0NoLoc", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr0NoLoc", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:588"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr1", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:576"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr1NoLoc", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr1NoLoc", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:592"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr2", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:580"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr2NoLoc", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr2NoLoc", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:596"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcErr3", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr3", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:615"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcMsg", ("Vuna.Compiler.Base.Diagnostics.Tc.tcMsg", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:561"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcTemplate", ("Vuna.Compiler.Base.Diagnostics.Tc.tcTemplate", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:255"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcTypeMismatch", ("Vuna.Compiler.Base.Diagnostics.Tc.tcTypeMismatch", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:603"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dTc_dtcTypeMismatchNoLoc", ("Vuna.Compiler.Base.Diagnostics.Tc.tcTypeMismatchNoLoc", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:609"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dwarnAll", ("Vuna.Compiler.Base.Diagnostics.Warning.warnAll", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:71"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dwarnCode", ("Vuna.Compiler.Base.Diagnostics.Warning.warnCode", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:30"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dwarnDiagAt", ("Vuna.Compiler.Base.Diagnostics.Warning.warnDiagAt", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:57"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dwarnDiagAtMod", ("Vuna.Compiler.Base.Diagnostics.Warning.warnDiagAtMod", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:61"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dwarnMsg", ("Vuna.Compiler.Base.Diagnostics.Warning.warnMsg", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:52"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dWarning_dwarnTemplate", ("Vuna.Compiler.Base.Diagnostics.Warning.warnTemplate", "Vuna/Compiler/Base/Diagnostics/Warning.vuna:40"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dallDescPairs", ("Vuna.Compiler.Base.Diagnostics.allDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:142"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dcgDescPairs", ("Vuna.Compiler.Base.Diagnostics.cgDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:102"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dcodeDomain", ("Vuna.Compiler.Base.Diagnostics.codeDomain", "Vuna/Compiler/Base/Diagnostics.vuna:50"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_ddiagCategoryOf", ("Vuna.Compiler.Base.Diagnostics.diagCategoryOf", "Vuna/Compiler/Base/Diagnostics.vuna:71"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_ddiagDescOf", ("Vuna.Compiler.Base.Diagnostics.diagDescOf", "Vuna/Compiler/Base/Diagnostics.vuna:93"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_ddiagPhaseOf", ("Vuna.Compiler.Base.Diagnostics.diagPhaseOf", "Vuna/Compiler/Base/Diagnostics.vuna:56"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_ddiagSeverityOf", ("Vuna.Compiler.Base.Diagnostics.diagSeverityOf", "Vuna/Compiler/Base/Diagnostics.vuna:86"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dicDescPairs", ("Vuna.Compiler.Base.Diagnostics.icDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:107"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dldDescPairs", ("Vuna.Compiler.Base.Diagnostics.ldDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:137"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dlexDescPairs", ("Vuna.Compiler.Base.Diagnostics.lexDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:112"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dlookupDesc", ("Vuna.Compiler.Base.Diagnostics.lookupDesc", "Vuna/Compiler/Base/Diagnostics.vuna:148"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dpkgDescPairs", ("Vuna.Compiler.Base.Diagnostics.pkgDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:127"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dpsDescPairs", ("Vuna.Compiler.Base.Diagnostics.psDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:117"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_drnDescPairs", ("Vuna.Compiler.Base.Diagnostics.rnDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:122"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dtcDescPairs", ("Vuna.Compiler.Base.Diagnostics.tcDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:97"));
  ("v_Vuna_dCompiler_dBase_dDiagnostics_dwarnDescPairs", ("Vuna.Compiler.Base.Diagnostics.warnDescPairs", "Vuna/Compiler/Base/Diagnostics.vuna:132"));
  ("v_Vuna_dCompiler_dBase_dHash_datIdx", ("Vuna.Compiler.Base.Hash.atIdx", "Vuna/Compiler/Base/Hash.vuna:153"));
  ("v_Vuna_dCompiler_dBase_dHash_datWindow", ("Vuna.Compiler.Base.Hash.atWindow", "Vuna/Compiler/Base/Hash.vuna:224"));
  ("v_Vuna_dCompiler_dBase_dHash_dbigSigma0", ("Vuna.Compiler.Base.Hash.bigSigma0", "Vuna/Compiler/Base/Hash.vuna:214"));
  ("v_Vuna_dCompiler_dBase_dHash_dbigSigma1", ("Vuna.Compiler.Base.Hash.bigSigma1", "Vuna/Compiler/Base/Hash.vuna:218"));
  ("v_Vuna_dCompiler_dBase_dHash_dblocksGo", ("Vuna.Compiler.Base.Hash.blocksGo", "Vuna/Compiler/Base/Hash.vuna:313"));
  ("v_Vuna_dCompiler_dBase_dHash_dch32", ("Vuna.Compiler.Base.Hash.ch32", "Vuna/Compiler/Base/Hash.vuna:245"));
  ("v_Vuna_dCompiler_dBase_dHash_dchunk64", ("Vuna.Compiler.Base.Hash.chunk64", "Vuna/Compiler/Base/Hash.vuna:184"));
  ("v_Vuna_dCompiler_dBase_dHash_dchunkWords", ("Vuna.Compiler.Base.Hash.chunkWords", "Vuna/Compiler/Base/Hash.vuna:202"));
  ("v_Vuna_dCompiler_dBase_dHash_dchunkWordsString", ("Vuna.Compiler.Base.Hash.chunkWordsString", "Vuna/Compiler/Base/Hash.vuna:309"));
  ("v_Vuna_dCompiler_dBase_dHash_dchunks", ("Vuna.Compiler.Base.Hash.chunks", "Vuna/Compiler/Base/Hash.vuna:188"));
  ("v_Vuna_dCompiler_dBase_dHash_dcompress", ("Vuna.Compiler.Base.Hash.compress", "Vuna/Compiler/Base/Hash.vuna:262"));
  ("v_Vuna_dCompiler_dBase_dHash_dcompressBlock", ("Vuna.Compiler.Base.Hash.compressBlock", "Vuna/Compiler/Base/Hash.vuna:272"));
  ("v_Vuna_dCompiler_dBase_dHash_dcontentAddress", ("Vuna.Compiler.Base.Hash.contentAddress", "Vuna/Compiler/Base/Hash.vuna:67"));
  ("v_Vuna_dCompiler_dBase_dHash_dcontentKey", ("Vuna.Compiler.Base.Hash.contentKey", "Vuna/Compiler/Base/Hash.vuna:62"));
  ("v_Vuna_dCompiler_dBase_dHash_ddigestHex", ("Vuna.Compiler.Base.Hash.digestHex", "Vuna/Compiler/Base/Hash.vuna:41"));
  ("v_Vuna_dCompiler_dBase_dHash_ddigestInt", ("Vuna.Compiler.Base.Hash.digestInt", "Vuna/Compiler/Base/Hash.vuna:49"));
  ("v_Vuna_dCompiler_dBase_dHash_ddigestIntOf", ("Vuna.Compiler.Base.Hash.digestIntOf", "Vuna/Compiler/Base/Hash.vuna:53"));
  ("v_Vuna_dCompiler_dBase_dHash_ddigestLanes", ("Vuna.Compiler.Base.Hash.digestLanes", "Vuna/Compiler/Base/Hash.vuna:25"));
  ("v_Vuna_dCompiler_dBase_dHash_ddigestOfBytes", ("Vuna.Compiler.Base.Hash.digestOfBytes", "Vuna/Compiler/Base/Hash.vuna:29"));
  ("v_Vuna_dCompiler_dBase_dHash_ddigestOfString", ("Vuna.Compiler.Base.Hash.digestOfString", "Vuna/Compiler/Base/Hash.vuna:37"));
  ("v_Vuna_dCompiler_dBase_dHash_ddigitAt", ("Vuna.Compiler.Base.Hash.digitAt", "Vuna/Compiler/Base/Hash.vuna:361"));
  ("v_Vuna_dCompiler_dBase_dHash_dhex8", ("Vuna.Compiler.Base.Hash.hex8", "Vuna/Compiler/Base/Hash.vuna:355"));
  ("v_Vuna_dCompiler_dBase_dHash_dhexDigit", ("Vuna.Compiler.Base.Hash.hexDigit", "Vuna/Compiler/Base/Hash.vuna:365"));
  ("v_Vuna_dCompiler_dBase_dHash_dlenBytes", ("Vuna.Compiler.Base.Hash.lenBytes", "Vuna/Compiler/Base/Hash.vuna:162"));
  ("v_Vuna_dCompiler_dBase_dHash_dlenInt", ("Vuna.Compiler.Base.Hash.lenInt", "Vuna/Compiler/Base/Hash.vuna:148"));
  ("v_Vuna_dCompiler_dBase_dHash_dmaj32", ("Vuna.Compiler.Base.Hash.maj32", "Vuna/Compiler/Base/Hash.vuna:249"));
  ("v_Vuna_dCompiler_dBase_dHash_dpadMessage", ("Vuna.Compiler.Base.Hash.padMessage", "Vuna/Compiler/Base/Hash.vuna:175"));
  ("v_Vuna_dCompiler_dBase_dHash_dpaddedByte", ("Vuna.Compiler.Base.Hash.paddedByte", "Vuna/Compiler/Base/Hash.vuna:291"));
  ("v_Vuna_dCompiler_dBase_dHash_dpaddedLen", ("Vuna.Compiler.Base.Hash.paddedLen", "Vuna/Compiler/Base/Hash.vuna:283"));
  ("v_Vuna_dCompiler_dBase_dHash_dprehashGo", ("Vuna.Compiler.Base.Hash.prehashGo", "Vuna/Compiler/Base/Hash.vuna:344"));
  ("v_Vuna_dCompiler_dBase_dHash_dprehashOfString", ("Vuna.Compiler.Base.Hash.prehashOfString", "Vuna/Compiler/Base/Hash.vuna:340"));
  ("v_Vuna_dCompiler_dBase_dHash_droundsGo", ("Vuna.Compiler.Base.Hash.roundsGo", "Vuna/Compiler/Base/Hash.vuna:253"));
  ("v_Vuna_dCompiler_dBase_dHash_dschedule", ("Vuna.Compiler.Base.Hash.schedule", "Vuna/Compiler/Base/Hash.vuna:229"));
  ("v_Vuna_dCompiler_dBase_dHash_dscheduleGo", ("Vuna.Compiler.Base.Hash.scheduleGo", "Vuna/Compiler/Base/Hash.vuna:233"));
  ("v_Vuna_dCompiler_dBase_dHash_dsha256Bytes", ("Vuna.Compiler.Base.Hash.sha256Bytes", "Vuna/Compiler/Base/Hash.vuna:276"));
  ("v_Vuna_dCompiler_dBase_dHash_dsha256OfString", ("Vuna.Compiler.Base.Hash.sha256OfString", "Vuna/Compiler/Base/Hash.vuna:320"));
  ("v_Vuna_dCompiler_dBase_dHash_dshaInit", ("Vuna.Compiler.Base.Hash.shaInit", "Vuna/Compiler/Base/Hash.vuna:74"));
  ("v_Vuna_dCompiler_dBase_dHash_dshaK", ("Vuna.Compiler.Base.Hash.shaK", "Vuna/Compiler/Base/Hash.vuna:79"));
  ("v_Vuna_dCompiler_dBase_dHash_dsigma0Small", ("Vuna.Compiler.Base.Hash.sigma0Small", "Vuna/Compiler/Base/Hash.vuna:206"));
  ("v_Vuna_dCompiler_dBase_dHash_dsigma1Small", ("Vuna.Compiler.Base.Hash.sigma1Small", "Vuna/Compiler/Base/Hash.vuna:210"));
  ("v_Vuna_dCompiler_dBase_dHash_dwordAt", ("Vuna.Compiler.Base.Hash.wordAt", "Vuna/Compiler/Base/Hash.vuna:192"));
  ("v_Vuna_dCompiler_dBase_dHash_dwordAtString", ("Vuna.Compiler.Base.Hash.wordAtString", "Vuna/Compiler/Base/Hash.vuna:298"));
  ("v_Vuna_dCompiler_dBase_dHash_dzeros", ("Vuna.Compiler.Base.Hash.zeros", "Vuna/Compiler/Base/Hash.vuna:158"));
  ("v_Vuna_dCompiler_dBase_dHash_dzipAdd", ("Vuna.Compiler.Base.Hash.zipAdd", "Vuna/Compiler/Base/Hash.vuna:268"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dallIntrinsics", ("Vuna.Compiler.Base.Intrinsics.allIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:1033"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_darityOfType", ("Vuna.Compiler.Base.Intrinsics.arityOfType", "Vuna/Compiler/Base/Intrinsics.vuna:60"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dassertIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.assertIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:288"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dbaseIntrinsics", ("Vuna.Compiler.Base.Intrinsics.baseIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:701"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dboolFalseCtor", ("Vuna.Compiler.Base.Intrinsics.boolFalseCtor", "Vuna/Compiler/Base/Intrinsics.vuna:514"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dboolTrueCtor", ("Vuna.Compiler.Base.Intrinsics.boolTrueCtor", "Vuna/Compiler/Base/Intrinsics.vuna:510"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dboolTypeName", ("Vuna.Compiler.Base.Intrinsics.boolTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:506"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dbuiltinEffectErrorRunHostOf", ("Vuna.Compiler.Base.Intrinsics.builtinEffectErrorRunHostOf", "Vuna/Compiler/Base/Intrinsics.vuna:127"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dbuiltinEffectExistsRest", ("Vuna.Compiler.Base.Intrinsics.builtinEffectExistsRest", "Vuna/Compiler/Base/Intrinsics.vuna:178"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dbuiltinEffectImplOf", ("Vuna.Compiler.Base.Intrinsics.builtinEffectImplOf", "Vuna/Compiler/Base/Intrinsics.vuna:159"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dbuiltinEffectImplOfRest", ("Vuna.Compiler.Base.Intrinsics.builtinEffectImplOfRest", "Vuna/Compiler/Base/Intrinsics.vuna:162"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dbuiltinEffectRunHostOf", ("Vuna.Compiler.Base.Intrinsics.builtinEffectRunHostOf", "Vuna/Compiler/Base/Intrinsics.vuna:150"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dbuiltinEffectRunHostOfRest", ("Vuna.Compiler.Base.Intrinsics.builtinEffectRunHostOfRest", "Vuna/Compiler/Base/Intrinsics.vuna:153"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dbuiltinEffects", ("Vuna.Compiler.Base.Intrinsics.builtinEffects", "Vuna/Compiler/Base/Intrinsics.vuna:135"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dcanonicalCtorsFor", ("Vuna.Compiler.Base.Intrinsics.canonicalCtorsFor", "Vuna/Compiler/Base/Intrinsics.vuna:465"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dcanonicalFamilies", ("Vuna.Compiler.Base.Intrinsics.canonicalFamilies", "Vuna/Compiler/Base/Intrinsics.vuna:577"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dcanonicalReprOf", ("Vuna.Compiler.Base.Intrinsics.canonicalReprOf", "Vuna/Compiler/Base/Intrinsics.vuna:607"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dcfCtors", ("Vuna.Compiler.Base.Intrinsics.cfCtors", "Vuna/Compiler/Base/Intrinsics.vuna:569"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dcfName", ("Vuna.Compiler.Base.Intrinsics.cfName", "Vuna/Compiler/Base/Intrinsics.vuna:565"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dcfRepr", ("Vuna.Compiler.Base.Intrinsics.cfRepr", "Vuna/Compiler/Base/Intrinsics.vuna:573"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dcmpSpecializedTyNames", ("Vuna.Compiler.Base.Intrinsics.cmpSpecializedTyNames", "Vuna/Compiler/Base/Intrinsics.vuna:626"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dctorSpellingKey", ("Vuna.Compiler.Base.Intrinsics.ctorSpellingKey", "Vuna/Compiler/Base/Intrinsics.vuna:587"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_ddebugLineIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.debugLineIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:230"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_ddebugOnIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.debugOnIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:226"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_ddropLastSegment", ("Vuna.Compiler.Base.Intrinsics.dropLastSegment", "Vuna/Compiler/Base/Intrinsics.vuna:593"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffDefaultInstance", ("Vuna.Compiler.Base.Intrinsics.effDefaultInstance", "Vuna/Compiler/Base/Intrinsics.vuna:354"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffIntrinsics", ("Vuna.Compiler.Base.Intrinsics.effIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:806"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffMainRunName", ("Vuna.Compiler.Base.Intrinsics.effMainRunName", "Vuna/Compiler/Base/Intrinsics.vuna:206"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberFamilyName", ("Vuna.Compiler.Base.Intrinsics.effMemberFamilyName", "Vuna/Compiler/Base/Intrinsics.vuna:328"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberHereCtor", ("Vuna.Compiler.Base.Intrinsics.effMemberHereCtor", "Vuna/Compiler/Base/Intrinsics.vuna:332"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffMemberThereCtor", ("Vuna.Compiler.Base.Intrinsics.effMemberThereCtor", "Vuna/Compiler/Base/Intrinsics.vuna:336"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffMkCtor", ("Vuna.Compiler.Base.Intrinsics.effMkCtor", "Vuna/Compiler/Base/Intrinsics.vuna:349"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffRowAppendName", ("Vuna.Compiler.Base.Intrinsics.effRowAppendName", "Vuna/Compiler/Base/Intrinsics.vuna:324"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffRowConsCtor", ("Vuna.Compiler.Base.Intrinsics.effRowConsCtor", "Vuna/Compiler/Base/Intrinsics.vuna:316"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffRowFamilyName", ("Vuna.Compiler.Base.Intrinsics.effRowFamilyName", "Vuna/Compiler/Base/Intrinsics.vuna:308"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffRowNilCtor", ("Vuna.Compiler.Base.Intrinsics.effRowNilCtor", "Vuna/Compiler/Base/Intrinsics.vuna:312"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffRowRemName", ("Vuna.Compiler.Base.Intrinsics.effRowRemName", "Vuna/Compiler/Base/Intrinsics.vuna:320"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffRunName", ("Vuna.Compiler.Base.Intrinsics.effRunName", "Vuna/Compiler/Base/Intrinsics.vuna:201"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffTypeName", ("Vuna.Compiler.Base.Intrinsics.effTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:340"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_deffUnitTypeName", ("Vuna.Compiler.Base.Intrinsics.effUnitTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:345"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dffiScalarNames", ("Vuna.Compiler.Base.Intrinsics.ffiScalarNames", "Vuna/Compiler/Base/Intrinsics.vuna:630"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dfindCanonicalFamily", ("Vuna.Compiler.Base.Intrinsics.findCanonicalFamily", "Vuna/Compiler/Base/Intrinsics.vuna:598"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dfindCanonicalFamilyGo", ("Vuna.Compiler.Base.Intrinsics.findCanonicalFamilyGo", "Vuna/Compiler/Base/Intrinsics.vuna:601"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dfindIntrinsic", ("Vuna.Compiler.Base.Intrinsics.findIntrinsic", "Vuna/Compiler/Base/Intrinsics.vuna:1065"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dfloatIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.floatIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:1039"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dfloatIntrinsics", ("Vuna.Compiler.Base.Intrinsics.floatIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:780"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dfloatTypeName", ("Vuna.Compiler.Base.Intrinsics.floatTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:502"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatMethodName", ("Vuna.Compiler.Base.Intrinsics.fromFloatMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:668"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dfromFloatTypeName", ("Vuna.Compiler.Base.Intrinsics.fromFloatTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:664"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntMethodName", ("Vuna.Compiler.Base.Intrinsics.fromIntMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:660"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dfromIntTypeName", ("Vuna.Compiler.Base.Intrinsics.fromIntTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:656"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringMethodName", ("Vuna.Compiler.Base.Intrinsics.fromStringMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:652"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dfromStringTypeName", ("Vuna.Compiler.Base.Intrinsics.fromStringTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:648"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dhostRowName", ("Vuna.Compiler.Base.Intrinsics.hostRowName", "Vuna/Compiler/Base/Intrinsics.vuna:172"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dhostTailName", ("Vuna.Compiler.Base.Intrinsics.hostTailName", "Vuna/Compiler/Base/Intrinsics.vuna:175"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dintTypeName", ("Vuna.Compiler.Base.Intrinsics.intTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:494"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dinternalIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.internalIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:1029"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dinternalIntrinsics", ("Vuna.Compiler.Base.Intrinsics.internalIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:1001"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dinterpMethodName", ("Vuna.Compiler.Base.Intrinsics.interpMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:643"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dinterpTypeName", ("Vuna.Compiler.Base.Intrinsics.interpTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:639"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicArity", ("Vuna.Compiler.Base.Intrinsics.intrinsicArity", "Vuna/Compiler/Base/Intrinsics.vuna:471"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicName", ("Vuna.Compiler.Base.Intrinsics.intrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:452"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicReturnsEff", ("Vuna.Compiler.Base.Intrinsics.intrinsicReturnsEff", "Vuna/Compiler/Base/Intrinsics.vuna:477"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicSignature", ("Vuna.Compiler.Base.Intrinsics.intrinsicSignature", "Vuna/Compiler/Base/Intrinsics.vuna:456"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicTbl", ("Vuna.Compiler.Base.Intrinsics.intrinsicTbl", "Vuna/Compiler/Base/Intrinsics.vuna:1059"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dintrinsicVisible", ("Vuna.Compiler.Base.Intrinsics.intrinsicVisible", "Vuna/Compiler/Base/Intrinsics.vuna:460"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_disBoolCanonical", ("Vuna.Compiler.Base.Intrinsics.isBoolCanonical", "Vuna/Compiler/Base/Intrinsics.vuna:620"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_disBuiltinEffectTag", ("Vuna.Compiler.Base.Intrinsics.isBuiltinEffectTag", "Vuna/Compiler/Base/Intrinsics.vuna:168"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_disDebugOnlyName", ("Vuna.Compiler.Base.Intrinsics.isDebugOnlyName", "Vuna/Compiler/Base/Intrinsics.vuna:296"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_disFfiScalarName", ("Vuna.Compiler.Base.Intrinsics.isFfiScalarName", "Vuna/Compiler/Base/Intrinsics.vuna:634"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_disIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.isIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:1069"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_disIntrinsicTypeName", ("Vuna.Compiler.Base.Intrinsics.isIntrinsicTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:531"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_disTypeConstructorName", ("Vuna.Compiler.Base.Intrinsics.isTypeConstructorName", "Vuna/Compiler/Base/Intrinsics.vuna:108"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_disUnboxedCanonical", ("Vuna.Compiler.Base.Intrinsics.isUnboxedCanonical", "Vuna/Compiler/Base/Intrinsics.vuna:613"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dlistConsCtor", ("Vuna.Compiler.Base.Intrinsics.listConsCtor", "Vuna/Compiler/Base/Intrinsics.vuna:543"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dlistFamilyName", ("Vuna.Compiler.Base.Intrinsics.listFamilyName", "Vuna/Compiler/Base/Intrinsics.vuna:535"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dlistNilCtor", ("Vuna.Compiler.Base.Intrinsics.listNilCtor", "Vuna/Compiler/Base/Intrinsics.vuna:539"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dmainShowDefName", ("Vuna.Compiler.Base.Intrinsics.mainShowDefName", "Vuna/Compiler/Base/Intrinsics.vuna:197"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dnatSuccCtor", ("Vuna.Compiler.Base.Intrinsics.natSuccCtor", "Vuna/Compiler/Base/Intrinsics.vuna:527"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dnatTypeName", ("Vuna.Compiler.Base.Intrinsics.natTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:519"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dnatZeroCtor", ("Vuna.Compiler.Base.Intrinsics.natZeroCtor", "Vuna/Compiler/Base/Intrinsics.vuna:523"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dobsCounterIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsCounterIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:264"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dobsIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.obsIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:1014"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dobsLevelIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsLevelIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:245"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dobsLogIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsLogIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:260"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dobsMarkIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsMarkIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:268"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dobsSampleStartIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSampleStartIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:280"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dobsSampleStopIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSampleStopIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:284"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dobsSpanBeginIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSpanBeginIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:272"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dobsSpanEndIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSpanEndIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:276"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dobsSpanIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSpanIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:249"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dobsSpanLabIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSpanLabIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:256"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dpreludeTypeNames", ("Vuna.Compiler.Base.Intrinsics.preludeTypeNames", "Vuna/Compiler/Base/Intrinsics.vuna:358"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dpreludeValueNames", ("Vuna.Compiler.Base.Intrinsics.preludeValueNames", "Vuna/Compiler/Base/Intrinsics.vuna:1079"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dprimEffBind1Name", ("Vuna.Compiler.Base.Intrinsics.primEffBind1Name", "Vuna/Compiler/Base/Intrinsics.vuna:185"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dprimEraseName", ("Vuna.Compiler.Base.Intrinsics.primEraseName", "Vuna/Compiler/Base/Intrinsics.vuna:191"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dstrTypeName", ("Vuna.Compiler.Base.Intrinsics.strTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:498"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dtodoIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.todoIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:292"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dtraceIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.traceIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:1008"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dtypeIntrinsicArities", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicArities", "Vuna/Compiler/Base/Intrinsics.vuna:88"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dtypeIntrinsicArityOf", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicArityOf", "Vuna/Compiler/Base/Intrinsics.vuna:92"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dtypeIntrinsicArityOfRest", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicArityOfRest", "Vuna/Compiler/Base/Intrinsics.vuna:96"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dtypeIntrinsicCtorArity", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicCtorArity", "Vuna/Compiler/Base/Intrinsics.vuna:84"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dtypeIntrinsicCtorName", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicCtorName", "Vuna/Compiler/Base/Intrinsics.vuna:80"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dtypeIntrinsicCtorNames", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicCtorNames", "Vuna/Compiler/Base/Intrinsics.vuna:103"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dtypeIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:490"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_dtypeReturnsEff", ("Vuna.Compiler.Base.Intrinsics.typeReturnsEff", "Vuna/Compiler/Base/Intrinsics.vuna:481"));
  ("v_Vuna_dCompiler_dBase_dIntrinsics_duserIntrinsics", ("Vuna.Compiler.Base.Intrinsics.userIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:1075"));
  ("v_Vuna_dCompiler_dBase_dObs_dobsCheck", ("Vuna.Compiler.Base.Obs.obsCheck", "Vuna/Compiler/Base/Obs.vuna:27"));
  ("v_Vuna_dCompiler_dBase_dObs_dobsCountEff", ("Vuna.Compiler.Base.Obs.obsCountEff", "Vuna/Compiler/Base/Obs.vuna:44"));
  ("v_Vuna_dCompiler_dBase_dObs_dobsDefCheck", ("Vuna.Compiler.Base.Obs.obsDefCheck", "Vuna/Compiler/Base/Obs.vuna:33"));
  ("v_Vuna_dCompiler_dBase_dObs_dobsMarkEff", ("Vuna.Compiler.Base.Obs.obsMarkEff", "Vuna/Compiler/Base/Obs.vuna:38"));
  ("v_Vuna_dCompiler_dBase_dSource_d_usimilarName", ("Vuna.Compiler.Base.Source._similarName", "Vuna/Compiler/Base/Source.vuna:205"));
  ("v_Vuna_dCompiler_dBase_dSource_dbaseName", ("Vuna.Compiler.Base.Source.baseName", "Vuna/Compiler/Base/Source.vuna:175"));
  ("v_Vuna_dCompiler_dBase_dSource_dcontainsDot", ("Vuna.Compiler.Base.Source.containsDot", "Vuna/Compiler/Base/Source.vuna:99"));
  ("v_Vuna_dCompiler_dBase_dSource_ddropPastSlash", ("Vuna.Compiler.Base.Source.dropPastSlash", "Vuna/Compiler/Base/Source.vuna:193"));
  ("v_Vuna_dCompiler_dBase_dSource_djoinArrows", ("Vuna.Compiler.Base.Source.joinArrows", "Vuna/Compiler/Base/Source.vuna:155"));
  ("v_Vuna_dCompiler_dBase_dSource_djoinDots", ("Vuna.Compiler.Base.Source.joinDots", "Vuna/Compiler/Base/Source.vuna:132"));
  ("v_Vuna_dCompiler_dBase_dSource_djoinSlashes", ("Vuna.Compiler.Base.Source.joinSlashes", "Vuna/Compiler/Base/Source.vuna:149"));
  ("v_Vuna_dCompiler_dBase_dSource_dlastSeg", ("Vuna.Compiler.Base.Source.lastSeg", "Vuna/Compiler/Base/Source.vuna:140"));
  ("v_Vuna_dCompiler_dBase_dSource_dlengthDiffLE", ("Vuna.Compiler.Base.Source.lengthDiffLE", "Vuna/Compiler/Base/Source.vuna:223"));
  ("v_Vuna_dCompiler_dBase_dSource_dmemChar", ("Vuna.Compiler.Base.Source.memChar", "Vuna/Compiler/Base/Source.vuna:94"));
  ("v_Vuna_dCompiler_dBase_dSource_dparentOfPath", ("Vuna.Compiler.Base.Source.parentOfPath", "Vuna/Compiler/Base/Source.vuna:180"));
  ("v_Vuna_dCompiler_dBase_dSource_dposCol", ("Vuna.Compiler.Base.Source.posCol", "Vuna/Compiler/Base/Source.vuna:54"));
  ("v_Vuna_dCompiler_dBase_dSource_dposLine", ("Vuna.Compiler.Base.Source.posLine", "Vuna/Compiler/Base/Source.vuna:50"));
  ("v_Vuna_dCompiler_dBase_dSource_dposOffset", ("Vuna.Compiler.Base.Source.posOffset", "Vuna/Compiler/Base/Source.vuna:58"));
  ("v_Vuna_dCompiler_dBase_dSource_dprefixLen2", ("Vuna.Compiler.Base.Source.prefixLen2", "Vuna/Compiler/Base/Source.vuna:217"));
  ("v_Vuna_dCompiler_dBase_dSource_dprefixOfName", ("Vuna.Compiler.Base.Source.prefixOfName", "Vuna/Compiler/Base/Source.vuna:144"));
  ("v_Vuna_dCompiler_dBase_dSource_dshowSpanLoc", ("Vuna.Compiler.Base.Source.showSpanLoc", "Vuna/Compiler/Base/Source.vuna:90"));
  ("v_Vuna_dCompiler_dBase_dSource_dspanEndCol", ("Vuna.Compiler.Base.Source.spanEndCol", "Vuna/Compiler/Base/Source.vuna:74"));
  ("v_Vuna_dCompiler_dBase_dSource_dspanEndLine", ("Vuna.Compiler.Base.Source.spanEndLine", "Vuna/Compiler/Base/Source.vuna:70"));
  ("v_Vuna_dCompiler_dBase_dSource_dspanEndOffset", ("Vuna.Compiler.Base.Source.spanEndOffset", "Vuna/Compiler/Base/Source.vuna:82"));
  ("v_Vuna_dCompiler_dBase_dSource_dspanFile", ("Vuna.Compiler.Base.Source.spanFile", "Vuna/Compiler/Base/Source.vuna:86"));
  ("v_Vuna_dCompiler_dBase_dSource_dspanStartCol", ("Vuna.Compiler.Base.Source.spanStartCol", "Vuna/Compiler/Base/Source.vuna:66"));
  ("v_Vuna_dCompiler_dBase_dSource_dspanStartLine", ("Vuna.Compiler.Base.Source.spanStartLine", "Vuna/Compiler/Base/Source.vuna:62"));
  ("v_Vuna_dCompiler_dBase_dSource_dspanStartOffset", ("Vuna.Compiler.Base.Source.spanStartOffset", "Vuna/Compiler/Base/Source.vuna:78"));
  ("v_Vuna_dCompiler_dBase_dSource_dsplitCharsOn", ("Vuna.Compiler.Base.Source.splitCharsOn", "Vuna/Compiler/Base/Source.vuna:111"));
  ("v_Vuna_dCompiler_dBase_dSource_dsplitCharsOnDot", ("Vuna.Compiler.Base.Source.splitCharsOnDot", "Vuna/Compiler/Base/Source.vuna:118"));
  ("v_Vuna_dCompiler_dBase_dSource_dsplitLastDot", ("Vuna.Compiler.Base.Source.splitLastDot", "Vuna/Compiler/Base/Source.vuna:126"));
  ("v_Vuna_dCompiler_dBase_dSource_dsplitOnChar", ("Vuna.Compiler.Base.Source.splitOnChar", "Vuna/Compiler/Base/Source.vuna:107"));
  ("v_Vuna_dCompiler_dBase_dSource_dsplitOnDot", ("Vuna.Compiler.Base.Source.splitOnDot", "Vuna/Compiler/Base/Source.vuna:103"));
  ("v_Vuna_dCompiler_dBase_dSource_dsplitPath", ("Vuna.Compiler.Base.Source.splitPath", "Vuna/Compiler/Base/Source.vuna:162"));
  ("v_Vuna_dCompiler_dBase_dSource_dsplitPathChars", ("Vuna.Compiler.Base.Source.splitPathChars", "Vuna/Compiler/Base/Source.vuna:166"));
  ("v_Vuna_dCompiler_dBase_dSource_dsuggest", ("Vuna.Compiler.Base.Source.suggest", "Vuna/Compiler/Base/Source.vuna:198"));
  ("v_Vuna_dCompiler_dBase_dStore_dbreakFirstNewline", ("Vuna.Compiler.Base.Store.breakFirstNewline", "Vuna/Compiler/Base/Store.vuna:87"));
  ("v_Vuna_dCompiler_dBase_dStore_dclaimAt", ("Vuna.Compiler.Base.Store.claimAt", "Vuna/Compiler/Base/Store.vuna:420"));
  ("v_Vuna_dCompiler_dBase_dStore_ddirReady", ("Vuna.Compiler.Base.Store.dirReady", "Vuna/Compiler/Base/Store.vuna:326"));
  ("v_Vuna_dCompiler_dBase_dStore_ddirUnder", ("Vuna.Compiler.Base.Store.dirUnder", "Vuna/Compiler/Base/Store.vuna:173"));
  ("v_Vuna_dCompiler_dBase_dStore_dfCodecOf", ("Vuna.Compiler.Base.Store.fCodecOf", "Vuna/Compiler/Base/Store.vuna:59"));
  ("v_Vuna_dCompiler_dBase_dStore_dfPayloadOf", ("Vuna.Compiler.Base.Store.fPayloadOf", "Vuna/Compiler/Base/Store.vuna:62"));
  ("v_Vuna_dCompiler_dBase_dStore_dfTagOf", ("Vuna.Compiler.Base.Store.fTagOf", "Vuna/Compiler/Base/Store.vuna:56"));
  ("v_Vuna_dCompiler_dBase_dStore_dframeHeader", ("Vuna.Compiler.Base.Store.frameHeader", "Vuna/Compiler/Base/Store.vuna:66"));
  ("v_Vuna_dCompiler_dBase_dStore_dframeSplit", ("Vuna.Compiler.Base.Store.frameSplit", "Vuna/Compiler/Base/Store.vuna:96"));
  ("v_Vuna_dCompiler_dBase_dStore_dheaderDigestOf", ("Vuna.Compiler.Base.Store.headerDigestOf", "Vuna/Compiler/Base/Store.vuna:128"));
  ("v_Vuna_dCompiler_dBase_dStore_dheaderFields", ("Vuna.Compiler.Base.Store.headerFields", "Vuna/Compiler/Base/Store.vuna:82"));
  ("v_Vuna_dCompiler_dBase_dStore_dheaderOk", ("Vuna.Compiler.Base.Store.headerOk", "Vuna/Compiler/Base/Store.vuna:110"));
  ("v_Vuna_dCompiler_dBase_dStore_dhomeStoreRootEff", ("Vuna.Compiler.Base.Store.homeStoreRootEff", "Vuna/Compiler/Base/Store.vuna:179"));
  ("v_Vuna_dCompiler_dBase_dStore_dinsertRootLine", ("Vuna.Compiler.Base.Store.insertRootLine", "Vuna/Compiler/Base/Store.vuna:500"));
  ("v_Vuna_dCompiler_dBase_dStore_dmergeRootLines", ("Vuna.Compiler.Base.Store.mergeRootLines", "Vuna/Compiler/Base/Store.vuna:503"));
  ("v_Vuna_dCompiler_dBase_dStore_dobjectPathIn", ("Vuna.Compiler.Base.Store.objectPathIn", "Vuna/Compiler/Base/Store.vuna:338"));
  ("v_Vuna_dCompiler_dBase_dStore_dprojectPathFileName", ("Vuna.Compiler.Base.Store.projectPathFileName", "Vuna/Compiler/Base/Store.vuna:509"));
  ("v_Vuna_dCompiler_dBase_dStore_dscratchStale", ("Vuna.Compiler.Base.Store.scratchStale", "Vuna/Compiler/Base/Store.vuna:449"));
  ("v_Vuna_dCompiler_dBase_dStore_dscratchStaleSec", ("Vuna.Compiler.Base.Store.scratchStaleSec", "Vuna/Compiler/Base/Store.vuna:446"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreCacheBaseEff", ("Vuna.Compiler.Base.Store.storeCacheBaseEff", "Vuna/Compiler/Base/Store.vuna:192"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreDataRootEff", ("Vuna.Compiler.Base.Store.storeDataRootEff", "Vuna/Compiler/Base/Store.vuna:163"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreDecode", ("Vuna.Compiler.Base.Store.storeDecode", "Vuna/Compiler/Base/Store.vuna:134"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreDecodeAs", ("Vuna.Compiler.Base.Store.storeDecodeAs", "Vuna/Compiler/Base/Store.vuna:148"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreDropPastSlash", ("Vuna.Compiler.Base.Store.storeDropPastSlash", "Vuna/Compiler/Base/Store.vuna:288"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreEncode", ("Vuna.Compiler.Base.Store.storeEncode", "Vuna/Compiler/Base/Store.vuna:70"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreEncodeAs", ("Vuna.Compiler.Base.Store.storeEncodeAs", "Vuna/Compiler/Base/Store.vuna:78"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirEff", ("Vuna.Compiler.Base.Store.storeEnsureDirEff", "Vuna/Compiler/Base/Store.vuna:254"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreEnsureDirFuel", ("Vuna.Compiler.Base.Store.storeEnsureDirFuel", "Vuna/Compiler/Base/Store.vuna:262"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreFileExistsEff", ("Vuna.Compiler.Base.Store.storeFileExistsEff", "Vuna/Compiler/Base/Store.vuna:247"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreMagic", ("Vuna.Compiler.Base.Store.storeMagic", "Vuna/Compiler/Base/Store.vuna:47"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreObjectExistsEff", ("Vuna.Compiler.Base.Store.storeObjectExistsEff", "Vuna/Compiler/Base/Store.vuna:347"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreObjectListEff", ("Vuna.Compiler.Base.Store.storeObjectListEff", "Vuna/Compiler/Base/Store.vuna:369"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreObjectPathEff", ("Vuna.Compiler.Base.Store.storeObjectPathEff", "Vuna/Compiler/Base/Store.vuna:341"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreObjectReadEff", ("Vuna.Compiler.Base.Store.storeObjectReadEff", "Vuna/Compiler/Base/Store.vuna:353"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreObjectRemoveEff", ("Vuna.Compiler.Base.Store.storeObjectRemoveEff", "Vuna/Compiler/Base/Store.vuna:379"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreObjectTag", ("Vuna.Compiler.Base.Store.storeObjectTag", "Vuna/Compiler/Base/Store.vuna:335"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreObjectWriteEff", ("Vuna.Compiler.Base.Store.storeObjectWriteEff", "Vuna/Compiler/Base/Store.vuna:360"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreParentOf", ("Vuna.Compiler.Base.Store.storeParentOf", "Vuna/Compiler/Base/Store.vuna:272"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreParentPathOf", ("Vuna.Compiler.Base.Store.storeParentPathOf", "Vuna/Compiler/Base/Store.vuna:285"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreProjectPathEff", ("Vuna.Compiler.Base.Store.storeProjectPathEff", "Vuna/Compiler/Base/Store.vuna:527"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreProjectPathRecordEff", ("Vuna.Compiler.Base.Store.storeProjectPathRecordEff", "Vuna/Compiler/Base/Store.vuna:513"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreReadAsEff", ("Vuna.Compiler.Base.Store.storeReadAsEff", "Vuna/Compiler/Base/Store.vuna:205"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreReadEff", ("Vuna.Compiler.Base.Store.storeReadEff", "Vuna/Compiler/Base/Store.vuna:196"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreRemoveEff", ("Vuna.Compiler.Base.Store.storeRemoveEff", "Vuna/Compiler/Base/Store.vuna:250"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreRootAppendEff", ("Vuna.Compiler.Base.Store.storeRootAppendEff", "Vuna/Compiler/Base/Store.vuna:542"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreRootEff", ("Vuna.Compiler.Base.Store.storeRootEff", "Vuna/Compiler/Base/Store.vuna:311"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreRootLoadEff", ("Vuna.Compiler.Base.Store.storeRootLoadEff", "Vuna/Compiler/Base/Store.vuna:571"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreRootProjectListEff", ("Vuna.Compiler.Base.Store.storeRootProjectListEff", "Vuna/Compiler/Base/Store.vuna:586"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreRootReadyEff", ("Vuna.Compiler.Base.Store.storeRootReadyEff", "Vuna/Compiler/Base/Store.vuna:315"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreRootRemoveEff", ("Vuna.Compiler.Base.Store.storeRootRemoveEff", "Vuna/Compiler/Base/Store.vuna:596"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreRootsPathEff", ("Vuna.Compiler.Base.Store.storeRootsPathEff", "Vuna/Compiler/Base/Store.vuna:494"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreScratchClaimEff", ("Vuna.Compiler.Base.Store.storeScratchClaimEff", "Vuna/Compiler/Base/Store.vuna:456"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreScratchDropEff", ("Vuna.Compiler.Base.Store.storeScratchDropEff", "Vuna/Compiler/Base/Store.vuna:473"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreScratchPathEff", ("Vuna.Compiler.Base.Store.storeScratchPathEff", "Vuna/Compiler/Base/Store.vuna:440"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreScratchPathIn", ("Vuna.Compiler.Base.Store.storeScratchPathIn", "Vuna/Compiler/Base/Store.vuna:437"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreScratchPathOfClaim", ("Vuna.Compiler.Base.Store.storeScratchPathOfClaim", "Vuna/Compiler/Base/Store.vuna:469"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreViewLockEff", ("Vuna.Compiler.Base.Store.storeViewLockEff", "Vuna/Compiler/Base/Store.vuna:411"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreViewPathEff", ("Vuna.Compiler.Base.Store.storeViewPathEff", "Vuna/Compiler/Base/Store.vuna:392"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreViewPublishEff", ("Vuna.Compiler.Base.Store.storeViewPublishEff", "Vuna/Compiler/Base/Store.vuna:479"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreViewUnlockEff", ("Vuna.Compiler.Base.Store.storeViewUnlockEff", "Vuna/Compiler/Base/Store.vuna:431"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreViewValidEff", ("Vuna.Compiler.Base.Store.storeViewValidEff", "Vuna/Compiler/Base/Store.vuna:397"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreWriteAsEff", ("Vuna.Compiler.Base.Store.storeWriteAsEff", "Vuna/Compiler/Base/Store.vuna:219"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreWriteEff", ("Vuna.Compiler.Base.Store.storeWriteEff", "Vuna/Compiler/Base/Store.vuna:215"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreWriteIfChangedAsEff", ("Vuna.Compiler.Base.Store.storeWriteIfChangedAsEff", "Vuna/Compiler/Base/Store.vuna:236"));
  ("v_Vuna_dCompiler_dBase_dStore_dstoreWriteIfChangedEff", ("Vuna.Compiler.Base.Store.storeWriteIfChangedEff", "Vuna/Compiler/Base/Store.vuna:224"));
  ("v_Vuna_dCompiler_dBase_dStore_dtmpStoreRootEff", ("Vuna.Compiler.Base.Store.tmpStoreRootEff", "Vuna/Compiler/Base/Store.vuna:185"));
  ("v_Vuna_dCompiler_dBase_dStore_dwriteRootFiles", ("Vuna.Compiler.Base.Store.writeRootFiles", "Vuna/Compiler/Base/Store.vuna:561"));
  ("v_Vuna_dCompiler_dBase_dVersion_dvunaVersion", ("Vuna.Compiler.Base.Version.vunaVersion", "Vuna/Compiler/Base/Version.vuna:12"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_daddDep", ("Vuna.Compiler.Codegen.Assembly.addDep", "Vuna/Compiler/Codegen/Assembly.vuna:87"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dcheckDefsForBuild", ("Vuna.Compiler.Codegen.Assembly.checkDefsForBuild", "Vuna/Compiler/Codegen/Assembly.vuna:73"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dcheckGroupsForBuild", ("Vuna.Compiler.Codegen.Assembly.checkGroupsForBuild", "Vuna/Compiler/Codegen/Assembly.vuna:67"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dcheckUnitParts", ("Vuna.Compiler.Codegen.Assembly.checkUnitParts", "Vuna/Compiler/Codegen/Assembly.vuna:64"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dgenTypePart", ("Vuna.Compiler.Codegen.Assembly.genTypePart", "Vuna/Compiler/Codegen/Assembly.vuna:83"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitParts", ("Vuna.Compiler.Codegen.Assembly.genUnitParts", "Vuna/Compiler/Codegen/Assembly.vuna:45"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitPartsWith", ("Vuna.Compiler.Codegen.Assembly.genUnitPartsWith", "Vuna/Compiler/Codegen/Assembly.vuna:48"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dgenUnitText", ("Vuna.Compiler.Codegen.Assembly.genUnitText", "Vuna/Compiler/Codegen/Assembly.vuna:95"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dlistBridgeFor", ("Vuna.Compiler.Codegen.Assembly.listBridgeFor", "Vuna/Compiler/Codegen/Assembly.vuna:106"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dopenHeader", ("Vuna.Compiler.Codegen.Assembly.openHeader", "Vuna/Compiler/Codegen/Assembly.vuna:102"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_druntimeUnit", ("Vuna.Compiler.Codegen.Assembly.runtimeUnit", "Vuna/Compiler/Codegen/Assembly.vuna:23"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dtypeRefDeps", ("Vuna.Compiler.Codegen.Assembly.typeRefDeps", "Vuna/Compiler/Codegen/Assembly.vuna:112"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_duniqueDeps", ("Vuna.Compiler.Codegen.Assembly.uniqueDeps", "Vuna/Compiler/Codegen/Assembly.vuna:90"));
  ("v_Vuna_dCompiler_dCodegen_dAssembly_dunitPartsDeps", ("Vuna.Compiler.Codegen.Assembly.unitPartsDeps", "Vuna/Compiler/Codegen/Assembly.vuna:35"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dboolText", ("Vuna.Compiler.Codegen.Decl.boolText", "Vuna/Compiler/Codegen/Decl.vuna:61"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorBodyOf", ("Vuna.Compiler.Codegen.Decl.ctorBodyOf", "Vuna/Compiler/Codegen/Decl.vuna:266"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclOf", ("Vuna.Compiler.Codegen.Decl.ctorDeclOf", "Vuna/Compiler/Codegen/Decl.vuna:270"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorDeclText", ("Vuna.Compiler.Codegen.Decl.ctorDeclText", "Vuna/Compiler/Codegen/Decl.vuna:221"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName", ("Vuna.Compiler.Codegen.Decl.ctorOcamlName", "Vuna/Compiler/Codegen/Decl.vuna:70"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dfamilyTyText", ("Vuna.Compiler.Codegen.Decl.familyTyText", "Vuna/Compiler/Codegen/Decl.vuna:216"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dinterpose", ("Vuna.Compiler.Codegen.Decl.interpose", "Vuna/Compiler/Codegen/Decl.vuna:199"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dirBinderText", ("Vuna.Compiler.Codegen.Decl.irBinderText", "Vuna/Compiler/Codegen/Decl.vuna:240"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dirTyDeclDeps", ("Vuna.Compiler.Codegen.Decl.irTyDeclDeps", "Vuna/Compiler/Codegen/Decl.vuna:286"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dirTyDeclText", ("Vuna.Compiler.Codegen.Decl.irTyDeclText", "Vuna/Compiler/Codegen/Decl.vuna:259"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dirTyDepsGo", ("Vuna.Compiler.Codegen.Decl.irTyDepsGo", "Vuna/Compiler/Codegen/Decl.vuna:301"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dirTyGlobalNames", ("Vuna.Compiler.Codegen.Decl.irTyGlobalNames", "Vuna/Compiler/Codegen/Decl.vuna:289"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dirTyText", ("Vuna.Compiler.Codegen.Decl.irTyText", "Vuna/Compiler/Codegen/Decl.vuna:246"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dirTypeDeclsText", ("Vuna.Compiler.Codegen.Decl.irTypeDeclsText", "Vuna/Compiler/Codegen/Decl.vuna:281"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_disAsciiAlphaNum", ("Vuna.Compiler.Codegen.Decl.isAsciiAlphaNum", "Vuna/Compiler/Codegen/Decl.vuna:28"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_djoinWith", ("Vuna.Compiler.Codegen.Decl.joinWith", "Vuna/Compiler/Codegen/Decl.vuna:196"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dnoQual", ("Vuna.Compiler.Codegen.Decl.noQual", "Vuna/Compiler/Codegen/Decl.vuna:95"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName", ("Vuna.Compiler.Codegen.Decl.ocamlBinderName", "Vuna/Compiler/Codegen/Decl.vuna:188"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_docamlEscapeChar", ("Vuna.Compiler.Codegen.Decl.ocamlEscapeChar", "Vuna/Compiler/Codegen/Decl.vuna:45"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_docamlPad3", ("Vuna.Compiler.Codegen.Decl.ocamlPad3", "Vuna/Compiler/Codegen/Decl.vuna:42"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_docamlReservedWords", ("Vuna.Compiler.Codegen.Decl.ocamlReservedWords", "Vuna/Compiler/Codegen/Decl.vuna:128"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_docamlString", ("Vuna.Compiler.Codegen.Decl.ocamlString", "Vuna/Compiler/Codegen/Decl.vuna:53"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dparenList", ("Vuna.Compiler.Codegen.Decl.parenList", "Vuna/Compiler/Codegen/Decl.vuna:226"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dparenOne", ("Vuna.Compiler.Codegen.Decl.parenOne", "Vuna/Compiler/Codegen/Decl.vuna:230"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText", ("Vuna.Compiler.Codegen.Decl.qualCtorText", "Vuna/Compiler/Codegen/Decl.vuna:118"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dqualOf", ("Vuna.Compiler.Codegen.Decl.qualOf", "Vuna/Compiler/Codegen/Decl.vuna:106"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dqualPrefix", ("Vuna.Compiler.Codegen.Decl.qualPrefix", "Vuna/Compiler/Codegen/Decl.vuna:110"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dqualTypeText", ("Vuna.Compiler.Codegen.Decl.qualTypeText", "Vuna/Compiler/Codegen/Decl.vuna:122"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dqualValueText", ("Vuna.Compiler.Codegen.Decl.qualValueText", "Vuna/Compiler/Codegen/Decl.vuna:115"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldDecls", ("Vuna.Compiler.Codegen.Decl.recordFieldDecls", "Vuna/Compiler/Codegen/Decl.vuna:274"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_drecordFieldLabel", ("Vuna.Compiler.Codegen.Decl.recordFieldLabel", "Vuna/Compiler/Codegen/Decl.vuna:74"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeChar", ("Vuna.Compiler.Codegen.Decl.sanitizeChar", "Vuna/Compiler/Codegen/Decl.vuna:32"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dsanitizeName", ("Vuna.Compiler.Codegen.Decl.sanitizeName", "Vuna/Compiler/Codegen/Decl.vuna:39"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dtypeName", ("Vuna.Compiler.Codegen.Decl.typeName", "Vuna/Compiler/Codegen/Decl.vuna:66"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamDecl", ("Vuna.Compiler.Codegen.Decl.typeParamDecl", "Vuna/Compiler/Codegen/Decl.vuna:210"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamName", ("Vuna.Compiler.Codegen.Decl.typeParamName", "Vuna/Compiler/Codegen/Decl.vuna:204"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dtypeParamNames", ("Vuna.Compiler.Codegen.Decl.typeParamNames", "Vuna/Compiler/Codegen/Decl.vuna:207"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl", ("Vuna.Compiler.Codegen.Decl.unitOfTbl", "Vuna/Compiler/Codegen/Decl.vuna:101"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dunitTblOf", ("Vuna.Compiler.Codegen.Decl.unitTblOf", "Vuna/Compiler/Codegen/Decl.vuna:98"));
  ("v_Vuna_dCompiler_dCodegen_dDecl_dvalueName", ("Vuna.Compiler.Codegen.Decl.valueName", "Vuna/Compiler/Codegen/Decl.vuna:56"));
  ("v_Vuna_dCompiler_dCodegen_dRuntime_docamlRtHelperNames", ("Vuna.Compiler.Codegen.Runtime.ocamlRtHelperNames", "Vuna/Compiler/Codegen/Runtime.vuna:327"));
  ("v_Vuna_dCompiler_dCodegen_dRuntime_docamlRtText", ("Vuna.Compiler.Codegen.Runtime.ocamlRtText", "Vuna/Compiler/Codegen/Runtime.vuna:323"));
  ("v_Vuna_dCompiler_dCodegen_dRuntime_docamlRtTextTable", ("Vuna.Compiler.Codegen.Runtime.ocamlRtTextTable", "Vuna/Compiler/Codegen/Runtime.vuna:26"));
  ("v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtra", ("Vuna.Compiler.Codegen.Runtime.rtTextExtra", "Vuna/Compiler/Codegen/Runtime.vuna:340"));
  ("v_Vuna_dCompiler_dCodegen_dRuntime_drtTextExtras", ("Vuna.Compiler.Codegen.Runtime.rtTextExtras", "Vuna/Compiler/Codegen/Runtime.vuna:346"));
  ("v_Vuna_dCompiler_dCodegen_dRuntime_drtTextGaps", ("Vuna.Compiler.Codegen.Runtime.rtTextGaps", "Vuna/Compiler/Codegen/Runtime.vuna:337"));
  ("v_Vuna_dCompiler_dCodegen_dRuntime_drtTextMissing", ("Vuna.Compiler.Codegen.Runtime.rtTextMissing", "Vuna/Compiler/Codegen/Runtime.vuna:331"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText", ("Vuna.Compiler.Codegen.Term.armPatternText", "Vuna/Compiler/Codegen/Term.vuna:1976"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dbindAndOf", ("Vuna.Compiler.Codegen.Term.bindAndOf", "Vuna/Compiler/Codegen/Term.vuna:2053"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dbindFirstOf", ("Vuna.Compiler.Codegen.Term.bindFirstOf", "Vuna/Compiler/Codegen/Term.vuna:2050"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dbindGroupOf", ("Vuna.Compiler.Codegen.Term.bindGroupOf", "Vuna/Compiler/Codegen/Term.vuna:2045"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dbindKeywordOf", ("Vuna.Compiler.Codegen.Term.bindKeywordOf", "Vuna/Compiler/Codegen/Term.vuna:2056"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dbridgeUnitOf", ("Vuna.Compiler.Codegen.Term.bridgeUnitOf", "Vuna/Compiler/Codegen/Term.vuna:1740"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dconAppText", ("Vuna.Compiler.Codegen.Term.conAppText", "Vuna/Compiler/Codegen/Term.vuna:2146"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtDefLocTable", ("Vuna.Compiler.Codegen.Term.dtDefLocTable", "Vuna/Compiler/Codegen/Term.vuna:1666"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtFloatRuntime", ("Vuna.Compiler.Codegen.Term.dtFloatRuntime", "Vuna/Compiler/Codegen/Term.vuna:1061"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge", ("Vuna.Compiler.Codegen.Term.dtListBridge", "Vuna/Compiler/Codegen/Term.vuna:1614"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtObsRuntime", ("Vuna.Compiler.Codegen.Term.dtObsRuntime", "Vuna/Compiler/Codegen/Term.vuna:1101"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime", ("Vuna.Compiler.Codegen.Term.dtPrimRuntime", "Vuna/Compiler/Codegen/Term.vuna:105"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtReporterRuntime", ("Vuna.Compiler.Codegen.Term.dtReporterRuntime", "Vuna/Compiler/Codegen/Term.vuna:1025"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime", ("Vuna.Compiler.Codegen.Term.dtRuntime", "Vuna/Compiler/Codegen/Term.vuna:30"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntimeWith", ("Vuna.Compiler.Codegen.Term.dtRuntimeWith", "Vuna/Compiler/Codegen/Term.vuna:1601"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtSchedRuntime", ("Vuna.Compiler.Codegen.Term.dtSchedRuntime", "Vuna/Compiler/Codegen/Term.vuna:563"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_ddtTraceRuntime", ("Vuna.Compiler.Codegen.Term.dtTraceRuntime", "Vuna/Compiler/Codegen/Term.vuna:1078"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_deffThunkText", ("Vuna.Compiler.Codegen.Term.effThunkText", "Vuna/Compiler/Codegen/Term.vuna:1885"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_deffUnitTyPair", ("Vuna.Compiler.Codegen.Term.effUnitTyPair", "Vuna/Compiler/Codegen/Term.vuna:1764"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_deffUnitTypeNameIr", ("Vuna.Compiler.Codegen.Term.effUnitTypeNameIr", "Vuna/Compiler/Codegen/Term.vuna:1770"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dfoldHandlers", ("Vuna.Compiler.Codegen.Term.foldHandlers", "Vuna/Compiler/Codegen/Term.vuna:2131"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenArm", ("Vuna.Compiler.Codegen.Term.genArm", "Vuna/Compiler/Codegen/Term.vuna:1942"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenArms", ("Vuna.Compiler.Codegen.Term.genArms", "Vuna/Compiler/Codegen/Term.vuna:1934"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenAssignedFields", ("Vuna.Compiler.Codegen.Term.genAssignedFields", "Vuna/Compiler/Codegen/Term.vuna:1912"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenBridgeRef", ("Vuna.Compiler.Codegen.Term.genBridgeRef", "Vuna/Compiler/Codegen/Term.vuna:1757"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef", ("Vuna.Compiler.Codegen.Term.genCtorRef", "Vuna/Compiler/Codegen/Term.vuna:1719"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenDef", ("Vuna.Compiler.Codegen.Term.genDef", "Vuna/Compiler/Codegen/Term.vuna:2082"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenEntryHook", ("Vuna.Compiler.Codegen.Term.genEntryHook", "Vuna/Compiler/Codegen/Term.vuna:2108"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup", ("Vuna.Compiler.Codegen.Term.genGroup", "Vuna/Compiler/Codegen/Term.vuna:2033"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies", ("Vuna.Compiler.Codegen.Term.genGroupBodies", "Vuna/Compiler/Codegen/Term.vuna:2074"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups", ("Vuna.Compiler.Codegen.Term.genGroups", "Vuna/Compiler/Codegen/Term.vuna:2025"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenIr", ("Vuna.Compiler.Codegen.Term.genIr", "Vuna/Compiler/Codegen/Term.vuna:1776"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenIrArgs", ("Vuna.Compiler.Codegen.Term.genIrArgs", "Vuna/Compiler/Codegen/Term.vuna:1903"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenIrNode", ("Vuna.Compiler.Codegen.Term.genIrNode", "Vuna/Compiler/Codegen/Term.vuna:1779"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAlt", ("Vuna.Compiler.Codegen.Term.genNatAlt", "Vuna/Compiler/Codegen/Term.vuna:2009"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenNatBranches", ("Vuna.Compiler.Codegen.Term.genNatBranches", "Vuna/Compiler/Codegen/Term.vuna:1983"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef", ("Vuna.Compiler.Codegen.Term.genValueRef", "Vuna/Compiler/Codegen/Term.vuna:1712"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep", ("Vuna.Compiler.Codegen.Term.gsAddDep", "Vuna/Compiler/Codegen/Term.vuna:1706"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dgsDepOfFamily", ("Vuna.Compiler.Codegen.Term.gsDepOfFamily", "Vuna/Compiler/Codegen/Term.vuna:1726"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dhasCatchAll", ("Vuna.Compiler.Codegen.Term.hasCatchAll", "Vuna/Compiler/Codegen/Term.vuna:1928"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dhookText", ("Vuna.Compiler.Codegen.Term.hookText", "Vuna/Compiler/Codegen/Term.vuna:2138"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dinlineText", ("Vuna.Compiler.Codegen.Term.inlineText", "Vuna/Compiler/Codegen/Term.vuna:1544"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames", ("Vuna.Compiler.Codegen.Term.ioParamNames", "Vuna/Compiler/Codegen/Term.vuna:1894"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dlineDirectiveOf", ("Vuna.Compiler.Codegen.Term.lineDirectiveOf", "Vuna/Compiler/Codegen/Term.vuna:2066"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dlocRowOf", ("Vuna.Compiler.Codegen.Term.locRowOf", "Vuna/Compiler/Codegen/Term.vuna:1672"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt", ("Vuna.Compiler.Codegen.Term.mkGenSt", "Vuna/Compiler/Codegen/Term.vuna:1699"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dmkGenStWith", ("Vuna.Compiler.Codegen.Term.mkGenStWith", "Vuna/Compiler/Codegen/Term.vuna:1702"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dnonErasedBinderText", ("Vuna.Compiler.Codegen.Term.nonErasedBinderText", "Vuna/Compiler/Codegen/Term.vuna:1924"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames", ("Vuna.Compiler.Codegen.Term.qualifyBridgeNames", "Vuna/Compiler/Codegen/Term.vuna:1748"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeText", ("Vuna.Compiler.Codegen.Term.qualifyBridgeText", "Vuna/Compiler/Codegen/Term.vuna:1753"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_drecordLabelOf", ("Vuna.Compiler.Codegen.Term.recordLabelOf", "Vuna/Compiler/Codegen/Term.vuna:1732"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_drecordPatAssigned", ("Vuna.Compiler.Codegen.Term.recordPatAssigned", "Vuna/Compiler/Codegen/Term.vuna:1969"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_drecordPatText", ("Vuna.Compiler.Codegen.Term.recordPatText", "Vuna/Compiler/Codegen/Term.vuna:1965"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dreplaceAll", ("Vuna.Compiler.Codegen.Term.replaceAll", "Vuna/Compiler/Codegen/Term.vuna:1745"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dsortLocRows", ("Vuna.Compiler.Codegen.Term.sortLocRows", "Vuna/Compiler/Codegen/Term.vuna:1669"));
  ("v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames", ("Vuna.Compiler.Codegen.Term.takeNames", "Vuna/Compiler/Codegen/Term.vuna:1897"));
  ("v_Vuna_dCompiler_dCore_dCanonical_ddecAlt", ("Vuna.Compiler.Core.Canonical.decAlt", "Vuna/Compiler/Core/Canonical.vuna:137"));
  ("v_Vuna_dCompiler_dCore_dCanonical_ddecArg", ("Vuna.Compiler.Core.Canonical.decArg", "Vuna/Compiler/Core/Canonical.vuna:119"));
  ("v_Vuna_dCompiler_dCore_dCanonical_ddecBinder", ("Vuna.Compiler.Core.Canonical.decBinder", "Vuna/Compiler/Core/Canonical.vuna:128"));
  ("v_Vuna_dCompiler_dCore_dCanonical_ddecRig", ("Vuna.Compiler.Core.Canonical.decRig", "Vuna/Compiler/Core/Canonical.vuna:108"));
  ("v_Vuna_dCompiler_dCore_dCanonical_ddecTerm", ("Vuna.Compiler.Core.Canonical.decTerm", "Vuna/Compiler/Core/Canonical.vuna:148"));
  ("v_Vuna_dCompiler_dCore_dCanonical_ddecTermComplete", ("Vuna.Compiler.Core.Canonical.decTermComplete", "Vuna/Compiler/Core/Canonical.vuna:256"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dencAlt", ("Vuna.Compiler.Core.Canonical.encAlt", "Vuna/Compiler/Core/Canonical.vuna:60"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dencAlts", ("Vuna.Compiler.Core.Canonical.encAlts", "Vuna/Compiler/Core/Canonical.vuna:64"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dencAltsGo", ("Vuna.Compiler.Core.Canonical.encAltsGo", "Vuna/Compiler/Core/Canonical.vuna:68"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dencArg", ("Vuna.Compiler.Core.Canonical.encArg", "Vuna/Compiler/Core/Canonical.vuna:39"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dencArgs", ("Vuna.Compiler.Core.Canonical.encArgs", "Vuna/Compiler/Core/Canonical.vuna:43"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dencArgsGo", ("Vuna.Compiler.Core.Canonical.encArgsGo", "Vuna/Compiler/Core/Canonical.vuna:47"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dencBinder", ("Vuna.Compiler.Core.Canonical.encBinder", "Vuna/Compiler/Core/Canonical.vuna:52"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dencBinders", ("Vuna.Compiler.Core.Canonical.encBinders", "Vuna/Compiler/Core/Canonical.vuna:56"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dencInts", ("Vuna.Compiler.Core.Canonical.encInts", "Vuna/Compiler/Core/Canonical.vuna:73"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dencRig", ("Vuna.Compiler.Core.Canonical.encRig", "Vuna/Compiler/Core/Canonical.vuna:33"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dencTerm", ("Vuna.Compiler.Core.Canonical.encTerm", "Vuna/Compiler/Core/Canonical.vuna:77"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dencTermBytes", ("Vuna.Compiler.Core.Canonical.encTermBytes", "Vuna/Compiler/Core/Canonical.vuna:100"));
  ("v_Vuna_dCompiler_dCore_dCanonical_dnoSpan", ("Vuna.Compiler.Core.Canonical.noSpan", "Vuna/Compiler/Core/Canonical.vuna:26"));
  ("v_Vuna_dCompiler_dCore_dConv_dabsPatternBody", ("Vuna.Compiler.Core.Conv.absPatternBody", "Vuna/Compiler/Core/Conv.vuna:498"));
  ("v_Vuna_dCompiler_dCore_dConv_daltsScopedTo", ("Vuna.Compiler.Core.Conv.altsScopedTo", "Vuna/Compiler/Core/Conv.vuna:457"));
  ("v_Vuna_dCompiler_dCore_dConv_dargsScopedTo", ("Vuna.Compiler.Core.Conv.argsScopedTo", "Vuna/Compiler/Core/Conv.vuna:452"));
  ("v_Vuna_dCompiler_dCore_dConv_dconv", ("Vuna.Compiler.Core.Conv.conv", "Vuna/Compiler/Core/Conv.vuna:639"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvBoth", ("Vuna.Compiler.Core.Conv.convBoth", "Vuna/Compiler/Core/Conv.vuna:647"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvBothFuel", ("Vuna.Compiler.Core.Conv.convBothFuel", "Vuna/Compiler/Core/Conv.vuna:252"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvCaseAlts", ("Vuna.Compiler.Core.Conv.convCaseAlts", "Vuna/Compiler/Core/Conv.vuna:650"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvCaseAltsFuel", ("Vuna.Compiler.Core.Conv.convCaseAltsFuel", "Vuna/Compiler/Core/Conv.vuna:368"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvFuel", ("Vuna.Compiler.Core.Conv.convFuel", "Vuna/Compiler/Core/Conv.vuna:239"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvFuelFor", ("Vuna.Compiler.Core.Conv.convFuelFor", "Vuna/Compiler/Core/Conv.vuna:185"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvFuelMax", ("Vuna.Compiler.Core.Conv.convFuelMax", "Vuna/Compiler/Core/Conv.vuna:192"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNatApplied", ("Vuna.Compiler.Core.Conv.convNatApplied", "Vuna/Compiler/Core/Conv.vuna:216"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNatChains", ("Vuna.Compiler.Core.Conv.convNatChains", "Vuna/Compiler/Core/Conv.vuna:200"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNatFuel", ("Vuna.Compiler.Core.Conv.convNatFuel", "Vuna/Compiler/Core/Conv.vuna:195"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNatNear", ("Vuna.Compiler.Core.Conv.convNatNear", "Vuna/Compiler/Core/Conv.vuna:167"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNatNeutral", ("Vuna.Compiler.Core.Conv.convNatNeutral", "Vuna/Compiler/Core/Conv.vuna:208"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNeutral", ("Vuna.Compiler.Core.Conv.convNeutral", "Vuna/Compiler/Core/Conv.vuna:659"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvNeutralFuel", ("Vuna.Compiler.Core.Conv.convNeutralFuel", "Vuna/Compiler/Core/Conv.vuna:335"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvOneAlt", ("Vuna.Compiler.Core.Conv.convOneAlt", "Vuna/Compiler/Core/Conv.vuna:653"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvOneAltFuel", ("Vuna.Compiler.Core.Conv.convOneAltFuel", "Vuna/Compiler/Core/Conv.vuna:379"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvSpines", ("Vuna.Compiler.Core.Conv.convSpines", "Vuna/Compiler/Core/Conv.vuna:662"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvSpinesFuel", ("Vuna.Compiler.Core.Conv.convSpinesFuel", "Vuna/Compiler/Core/Conv.vuna:349"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvValueLists", ("Vuna.Compiler.Core.Conv.convValueLists", "Vuna/Compiler/Core/Conv.vuna:656"));
  ("v_Vuna_dCompiler_dCore_dConv_dconvValueListsFuel", ("Vuna.Compiler.Core.Conv.convValueListsFuel", "Vuna/Compiler/Core/Conv.vuna:358"));
  ("v_Vuna_dCompiler_dCore_dConv_detaLeft", ("Vuna.Compiler.Core.Conv.etaLeft", "Vuna/Compiler/Core/Conv.vuna:665"));
  ("v_Vuna_dCompiler_dCore_dConv_detaLeftFuel", ("Vuna.Compiler.Core.Conv.etaLeftFuel", "Vuna/Compiler/Core/Conv.vuna:321"));
  ("v_Vuna_dCompiler_dCore_dConv_detaRight", ("Vuna.Compiler.Core.Conv.etaRight", "Vuna/Compiler/Core/Conv.vuna:668"));
  ("v_Vuna_dCompiler_dCore_dConv_detaRightFuel", ("Vuna.Compiler.Core.Conv.etaRightFuel", "Vuna/Compiler/Core/Conv.vuna:328"));
  ("v_Vuna_dCompiler_dCore_dConv_dfastSame", ("Vuna.Compiler.Core.Conv.fastSame", "Vuna/Compiler/Core/Conv.vuna:25"));
  ("v_Vuna_dCompiler_dCore_dConv_disNatCtorName", ("Vuna.Compiler.Core.Conv.isNatCtorName", "Vuna/Compiler/Core/Conv.vuna:68"));
  ("v_Vuna_dCompiler_dCore_dConv_disNatLikeHead", ("Vuna.Compiler.Core.Conv.isNatLikeHead", "Vuna/Compiler/Core/Conv.vuna:130"));
  ("v_Vuna_dCompiler_dCore_dConv_disNatLikeValue", ("Vuna.Compiler.Core.Conv.isNatLikeValue", "Vuna/Compiler/Core/Conv.vuna:122"));
  ("v_Vuna_dCompiler_dCore_dConv_disNilList", ("Vuna.Compiler.Core.Conv.isNilList", "Vuna/Compiler/Core/Conv.vuna:227"));
  ("v_Vuna_dCompiler_dCore_dConv_disNilSpine", ("Vuna.Compiler.Core.Conv.isNilSpine", "Vuna/Compiler/Core/Conv.vuna:475"));
  ("v_Vuna_dCompiler_dCore_dConv_dlevelPos", ("Vuna.Compiler.Core.Conv.levelPos", "Vuna/Compiler/Core/Conv.vuna:483"));
  ("v_Vuna_dCompiler_dCore_dConv_dlevelPosGo", ("Vuna.Compiler.Core.Conv.levelPosGo", "Vuna/Compiler/Core/Conv.vuna:486"));
  ("v_Vuna_dCompiler_dCore_dConv_dmemLevel", ("Vuna.Compiler.Core.Conv.memLevel", "Vuna/Compiler/Core/Conv.vuna:479"));
  ("v_Vuna_dCompiler_dCore_dConv_dmetaCreatedDepth", ("Vuna.Compiler.Core.Conv.metaCreatedDepth", "Vuna/Compiler/Core/Conv.vuna:410"));
  ("v_Vuna_dCompiler_dCore_dConv_dmismatchAt", ("Vuna.Compiler.Core.Conv.mismatchAt", "Vuna/Compiler/Core/Conv.vuna:389"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatChainMaxValue", ("Vuna.Compiler.Core.Conv.natChainMaxValue", "Vuna/Compiler/Core/Conv.vuna:72"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatChainNextValue", ("Vuna.Compiler.Core.Conv.natChainNextValue", "Vuna/Compiler/Core/Conv.vuna:75"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatFoldApplied", ("Vuna.Compiler.Core.Conv.natFoldApplied", "Vuna/Compiler/Core/Conv.vuna:102"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatFoldArgs", ("Vuna.Compiler.Core.Conv.natFoldArgs", "Vuna/Compiler/Core/Conv.vuna:93"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatFoldGo", ("Vuna.Compiler.Core.Conv.natFoldGo", "Vuna/Compiler/Core/Conv.vuna:83"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatFoldSucc", ("Vuna.Compiler.Core.Conv.natFoldSucc", "Vuna/Compiler/Core/Conv.vuna:109"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatFoldValue", ("Vuna.Compiler.Core.Conv.natFoldValue", "Vuna/Compiler/Core/Conv.vuna:80"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatPrefixDepth", ("Vuna.Compiler.Core.Conv.natPrefixDepth", "Vuna/Compiler/Core/Conv.vuna:138"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatPrefixGo", ("Vuna.Compiler.Core.Conv.natPrefixGo", "Vuna/Compiler/Core/Conv.vuna:141"));
  ("v_Vuna_dCompiler_dCore_dConv_dnatPrefixMax", ("Vuna.Compiler.Core.Conv.natPrefixMax", "Vuna/Compiler/Core/Conv.vuna:177"));
  ("v_Vuna_dCompiler_dCore_dConv_dpatternEnv", ("Vuna.Compiler.Core.Conv.patternEnv", "Vuna/Compiler/Core/Conv.vuna:534"));
  ("v_Vuna_dCompiler_dCore_dConv_dpatternSolution", ("Vuna.Compiler.Core.Conv.patternSolution", "Vuna/Compiler/Core/Conv.vuna:542"));
  ("v_Vuna_dCompiler_dCore_dConv_dpatternSpineOf", ("Vuna.Compiler.Core.Conv.patternSpineOf", "Vuna/Compiler/Core/Conv.vuna:464"));
  ("v_Vuna_dCompiler_dCore_dConv_dsameNatValue", ("Vuna.Compiler.Core.Conv.sameNatValue", "Vuna/Compiler/Core/Conv.vuna:114"));
  ("v_Vuna_dCompiler_dCore_dConv_dsameNeutralAtom", ("Vuna.Compiler.Core.Conv.sameNeutralAtom", "Vuna/Compiler/Core/Conv.vuna:231"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMeta", ("Vuna.Compiler.Core.Conv.solveMeta", "Vuna/Compiler/Core/Conv.vuna:671"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmpty", ("Vuna.Compiler.Core.Conv.solveMetaEmpty", "Vuna/Compiler/Core/Conv.vuna:549"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaEmptyStore", ("Vuna.Compiler.Core.Conv.solveMetaEmptyStore", "Vuna/Compiler/Core/Conv.vuna:554"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaFuel", ("Vuna.Compiler.Core.Conv.solveMetaFuel", "Vuna/Compiler/Core/Conv.vuna:619"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaHeadLegacyFuel", ("Vuna.Compiler.Core.Conv.solveMetaHeadLegacyFuel", "Vuna/Compiler/Core/Conv.vuna:592"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaHoLegacyFuel", ("Vuna.Compiler.Core.Conv.solveMetaHoLegacyFuel", "Vuna/Compiler/Core/Conv.vuna:573"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaNew", ("Vuna.Compiler.Core.Conv.solveMetaNew", "Vuna/Compiler/Core/Conv.vuna:636"));
  ("v_Vuna_dCompiler_dCore_dConv_dsolveMetaPattern", ("Vuna.Compiler.Core.Conv.solveMetaPattern", "Vuna/Compiler/Core/Conv.vuna:604"));
  ("v_Vuna_dCompiler_dCore_dConv_dspineLevels", ("Vuna.Compiler.Core.Conv.spineLevels", "Vuna/Compiler/Core/Conv.vuna:490"));
  ("v_Vuna_dCompiler_dCore_dConv_dsplitAtVals", ("Vuna.Compiler.Core.Conv.splitAtVals", "Vuna/Compiler/Core/Conv.vuna:567"));
  ("v_Vuna_dCompiler_dCore_dConv_dtermScopedTo", ("Vuna.Compiler.Core.Conv.termScopedTo", "Vuna/Compiler/Core/Conv.vuna:417"));
  ("v_Vuna_dCompiler_dCore_dConv_dwrapPatternLams", ("Vuna.Compiler.Core.Conv.wrapPatternLams", "Vuna/Compiler/Core/Conv.vuna:527"));
  ("v_Vuna_dCompiler_dCore_dEval_dappendReduce", ("Vuna.Compiler.Core.Eval.appendReduce", "Vuna/Compiler/Core/Eval.vuna:528"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyCaseAlt", ("Vuna.Compiler.Core.Eval.applyCaseAlt", "Vuna/Compiler/Core/Eval.vuna:110"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyCaseAltFuel", ("Vuna.Compiler.Core.Eval.applyCaseAltFuel", "Vuna/Compiler/Core/Eval.vuna:113"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyClosure", ("Vuna.Compiler.Core.Eval.applyClosure", "Vuna/Compiler/Core/Eval.vuna:156"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyClosureBinder", ("Vuna.Compiler.Core.Eval.applyClosureBinder", "Vuna/Compiler/Core/Eval.vuna:846"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplySpine", ("Vuna.Compiler.Core.Eval.applySpine", "Vuna/Compiler/Core/Eval.vuna:159"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyTermSpine", ("Vuna.Compiler.Core.Eval.applyTermSpine", "Vuna/Compiler/Core/Eval.vuna:872"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyValue", ("Vuna.Compiler.Core.Eval.applyValue", "Vuna/Compiler/Core/Eval.vuna:138"));
  ("v_Vuna_dCompiler_dCore_dEval_dapplyValueFuel", ("Vuna.Compiler.Core.Eval.applyValueFuel", "Vuna/Compiler/Core/Eval.vuna:141"));
  ("v_Vuna_dCompiler_dCore_dEval_dargAt", ("Vuna.Compiler.Core.Eval.argAt", "Vuna/Compiler/Core/Eval.vuna:716"));
  ("v_Vuna_dCompiler_dCore_dEval_dargValsAt", ("Vuna.Compiler.Core.Eval.argValsAt", "Vuna/Compiler/Core/Eval.vuna:840"));
  ("v_Vuna_dCompiler_dCore_dEval_dasBool", ("Vuna.Compiler.Core.Eval.asBool", "Vuna/Compiler/Core/Eval.vuna:320"));
  ("v_Vuna_dCompiler_dCore_dEval_dasFloat", ("Vuna.Compiler.Core.Eval.asFloat", "Vuna/Compiler/Core/Eval.vuna:290"));
  ("v_Vuna_dCompiler_dCore_dEval_dasInt", ("Vuna.Compiler.Core.Eval.asInt", "Vuna/Compiler/Core/Eval.vuna:208"));
  ("v_Vuna_dCompiler_dCore_dEval_dasNat", ("Vuna.Compiler.Core.Eval.asNat", "Vuna/Compiler/Core/Eval.vuna:251"));
  ("v_Vuna_dCompiler_dCore_dEval_dasStr", ("Vuna.Compiler.Core.Eval.asStr", "Vuna/Compiler/Core/Eval.vuna:316"));
  ("v_Vuna_dCompiler_dCore_dEval_datPrim", ("Vuna.Compiler.Core.Eval.atPrim", "Vuna/Compiler/Core/Eval.vuna:661"));
  ("v_Vuna_dCompiler_dCore_dEval_dboolPrim2", ("Vuna.Compiler.Core.Eval.boolPrim2", "Vuna/Compiler/Core/Eval.vuna:343"));
  ("v_Vuna_dCompiler_dCore_dEval_dcatchAllEnv", ("Vuna.Compiler.Core.Eval.catchAllEnv", "Vuna/Compiler/Core/Eval.vuna:125"));
  ("v_Vuna_dCompiler_dCore_dEval_dcmpInt", ("Vuna.Compiler.Core.Eval.cmpInt", "Vuna/Compiler/Core/Eval.vuna:414"));
  ("v_Vuna_dCompiler_dCore_dEval_ddigitsOf", ("Vuna.Compiler.Core.Eval.digitsOf", "Vuna/Compiler/Core/Eval.vuna:269"));
  ("v_Vuna_dCompiler_dCore_dEval_ddigitsOfChars", ("Vuna.Compiler.Core.Eval.digitsOfChars", "Vuna/Compiler/Core/Eval.vuna:272"));
  ("v_Vuna_dCompiler_dCore_dEval_ddropBytes", ("Vuna.Compiler.Core.Eval.dropBytes", "Vuna/Compiler/Core/Eval.vuna:702"));
  ("v_Vuna_dCompiler_dCore_dEval_deval", ("Vuna.Compiler.Core.Eval.eval", "Vuna/Compiler/Core/Eval.vuna:24"));
  ("v_Vuna_dCompiler_dCore_dEval_devalAlt", ("Vuna.Compiler.Core.Eval.evalAlt", "Vuna/Compiler/Core/Eval.vuna:83"));
  ("v_Vuna_dCompiler_dCore_dEval_devalAlts", ("Vuna.Compiler.Core.Eval.evalAlts", "Vuna/Compiler/Core/Eval.vuna:86"));
  ("v_Vuna_dCompiler_dCore_dEval_devalArgTerms", ("Vuna.Compiler.Core.Eval.evalArgTerms", "Vuna/Compiler/Core/Eval.vuna:90"));
  ("v_Vuna_dCompiler_dCore_dEval_devalArgTermsFuel", ("Vuna.Compiler.Core.Eval.evalArgTermsFuel", "Vuna/Compiler/Core/Eval.vuna:93"));
  ("v_Vuna_dCompiler_dCore_dEval_devalCase", ("Vuna.Compiler.Core.Eval.evalCase", "Vuna/Compiler/Core/Eval.vuna:101"));
  ("v_Vuna_dCompiler_dCore_dEval_devalCaseFuel", ("Vuna.Compiler.Core.Eval.evalCaseFuel", "Vuna/Compiler/Core/Eval.vuna:104"));
  ("v_Vuna_dCompiler_dCore_dEval_devalFuel", ("Vuna.Compiler.Core.Eval.evalFuel", "Vuna/Compiler/Core/Eval.vuna:51"));
  ("v_Vuna_dCompiler_dCore_dEval_devalFuelFor", ("Vuna.Compiler.Core.Eval.evalFuelFor", "Vuna/Compiler/Core/Eval.vuna:32"));
  ("v_Vuna_dCompiler_dCore_dEval_devalFuelMax", ("Vuna.Compiler.Core.Eval.evalFuelMax", "Vuna/Compiler/Core/Eval.vuna:38"));
  ("v_Vuna_dCompiler_dCore_dEval_devalIf", ("Vuna.Compiler.Core.Eval.evalIf", "Vuna/Compiler/Core/Eval.vuna:130"));
  ("v_Vuna_dCompiler_dCore_dEval_devalProjFuel", ("Vuna.Compiler.Core.Eval.evalProjFuel", "Vuna/Compiler/Core/Eval.vuna:721"));
  ("v_Vuna_dCompiler_dCore_dEval_dfloatBool2", ("Vuna.Compiler.Core.Eval.floatBool2", "Vuna/Compiler/Core/Eval.vuna:308"));
  ("v_Vuna_dCompiler_dCore_dEval_dfloatOfRaw", ("Vuna.Compiler.Core.Eval.floatOfRaw", "Vuna/Compiler/Core/Eval.vuna:263"));
  ("v_Vuna_dCompiler_dCore_dEval_dfloatPrim1", ("Vuna.Compiler.Core.Eval.floatPrim1", "Vuna/Compiler/Core/Eval.vuna:294"));
  ("v_Vuna_dCompiler_dCore_dEval_dfloatPrim2", ("Vuna.Compiler.Core.Eval.floatPrim2", "Vuna/Compiler/Core/Eval.vuna:300"));
  ("v_Vuna_dCompiler_dCore_dEval_dforce", ("Vuna.Compiler.Core.Eval.force", "Vuna/Compiler/Core/Eval.vuna:168"));
  ("v_Vuna_dCompiler_dCore_dEval_dforceLabelArgs", ("Vuna.Compiler.Core.Eval.forceLabelArgs", "Vuna/Compiler/Core/Eval.vuna:486"));
  ("v_Vuna_dCompiler_dCore_dEval_dfreshVar", ("Vuna.Compiler.Core.Eval.freshVar", "Vuna/Compiler/Core/Eval.vuna:851"));
  ("v_Vuna_dCompiler_dCore_dEval_dgenericCmp", ("Vuna.Compiler.Core.Eval.genericCmp", "Vuna/Compiler/Core/Eval.vuna:402"));
  ("v_Vuna_dCompiler_dCore_dEval_dgenericPrim2", ("Vuna.Compiler.Core.Eval.genericPrim2", "Vuna/Compiler/Core/Eval.vuna:417"));
  ("v_Vuna_dCompiler_dCore_dEval_dhostRowValue", ("Vuna.Compiler.Core.Eval.hostRowValue", "Vuna/Compiler/Core/Eval.vuna:47"));
  ("v_Vuna_dCompiler_dCore_dEval_dhostTailValue", ("Vuna.Compiler.Core.Eval.hostTailValue", "Vuna/Compiler/Core/Eval.vuna:42"));
  ("v_Vuna_dCompiler_dCore_dEval_dintPrim1", ("Vuna.Compiler.Core.Eval.intPrim1", "Vuna/Compiler/Core/Eval.vuna:364"));
  ("v_Vuna_dCompiler_dCore_dEval_dintPrim2", ("Vuna.Compiler.Core.Eval.intPrim2", "Vuna/Compiler/Core/Eval.vuna:324"));
  ("v_Vuna_dCompiler_dCore_dEval_dintPrim2Div", ("Vuna.Compiler.Core.Eval.intPrim2Div", "Vuna/Compiler/Core/Eval.vuna:335"));
  ("v_Vuna_dCompiler_dCore_dEval_disNilList", ("Vuna.Compiler.Core.Eval.isNilList", "Vuna/Compiler/Core/Eval.vuna:948"));
  ("v_Vuna_dCompiler_dCore_dEval_dlookupEnv", ("Vuna.Compiler.Core.Eval.lookupEnv", "Vuna/Compiler/Core/Eval.vuna:20"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatClamp", ("Vuna.Compiler.Core.Eval.natClamp", "Vuna/Compiler/Core/Eval.vuna:217"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatCtorInt", ("Vuna.Compiler.Core.Eval.natCtorInt", "Vuna/Compiler/Core/Eval.vuna:240"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatMax", ("Vuna.Compiler.Core.Eval.natMax", "Vuna/Compiler/Core/Eval.vuna:214"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatPrim1", ("Vuna.Compiler.Core.Eval.natPrim1", "Vuna/Compiler/Core/Eval.vuna:370"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatPrim2", ("Vuna.Compiler.Core.Eval.natPrim2", "Vuna/Compiler/Core/Eval.vuna:376"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatPrim2Div", ("Vuna.Compiler.Core.Eval.natPrim2Div", "Vuna/Compiler/Core/Eval.vuna:384"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatSatAdd", ("Vuna.Compiler.Core.Eval.natSatAdd", "Vuna/Compiler/Core/Eval.vuna:220"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatSatMul", ("Vuna.Compiler.Core.Eval.natSatMul", "Vuna/Compiler/Core/Eval.vuna:223"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatTruncSub", ("Vuna.Compiler.Core.Eval.natTruncSub", "Vuna/Compiler/Core/Eval.vuna:226"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatValue", ("Vuna.Compiler.Core.Eval.natValue", "Vuna/Compiler/Core/Eval.vuna:232"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatValueGo", ("Vuna.Compiler.Core.Eval.natValueGo", "Vuna/Compiler/Core/Eval.vuna:229"));
  ("v_Vuna_dCompiler_dCore_dEval_dnatValueToInt", ("Vuna.Compiler.Core.Eval.natValueToInt", "Vuna/Compiler/Core/Eval.vuna:235"));
  ("v_Vuna_dCompiler_dCore_dEval_dneutralEqFuel", ("Vuna.Compiler.Core.Eval.neutralEqFuel", "Vuna/Compiler/Core/Eval.vuna:463"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalize", ("Vuna.Compiler.Core.Eval.normalize", "Vuna/Compiler/Core/Eval.vuna:972"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeCase", ("Vuna.Compiler.Core.Eval.normalizeCase", "Vuna/Compiler/Core/Eval.vuna:975"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeCaseFuel", ("Vuna.Compiler.Core.Eval.normalizeCaseFuel", "Vuna/Compiler/Core/Eval.vuna:741"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeFuel", ("Vuna.Compiler.Core.Eval.normalizeFuel", "Vuna/Compiler/Core/Eval.vuna:729"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeIf", ("Vuna.Compiler.Core.Eval.normalizeIf", "Vuna/Compiler/Core/Eval.vuna:981"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeIfFuel", ("Vuna.Compiler.Core.Eval.normalizeIfFuel", "Vuna/Compiler/Core/Eval.vuna:773"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutral", ("Vuna.Compiler.Core.Eval.normalizeNeutral", "Vuna/Compiler/Core/Eval.vuna:978"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeNeutralFuel", ("Vuna.Compiler.Core.Eval.normalizeNeutralFuel", "Vuna/Compiler/Core/Eval.vuna:758"));
  ("v_Vuna_dCompiler_dCore_dEval_dnormalizeProjFuel", ("Vuna.Compiler.Core.Eval.normalizeProjFuel", "Vuna/Compiler/Core/Eval.vuna:749"));
  ("v_Vuna_dCompiler_dCore_dEval_dnthByte", ("Vuna.Compiler.Core.Eval.nthByte", "Vuna/Compiler/Core/Eval.vuna:672"));
  ("v_Vuna_dCompiler_dCore_dEval_dobsReduce", ("Vuna.Compiler.Core.Eval.obsReduce", "Vuna/Compiler/Core/Eval.vuna:635"));
  ("v_Vuna_dCompiler_dCore_dEval_dpow10Of", ("Vuna.Compiler.Core.Eval.pow10Of", "Vuna/Compiler/Core/Eval.vuna:279"));
  ("v_Vuna_dCompiler_dCore_dEval_dprimConst", ("Vuna.Compiler.Core.Eval.primConst", "Vuna/Compiler/Core/Eval.vuna:352"));
  ("v_Vuna_dCompiler_dCore_dEval_dprimReduce", ("Vuna.Compiler.Core.Eval.primReduce", "Vuna/Compiler/Core/Eval.vuna:543"));
  ("v_Vuna_dCompiler_dCore_dEval_dquote", ("Vuna.Compiler.Core.Eval.quote", "Vuna/Compiler/Core/Eval.vuna:788"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteArgValues", ("Vuna.Compiler.Core.Eval.quoteArgValues", "Vuna/Compiler/Core/Eval.vuna:830"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteArgValuesFuel", ("Vuna.Compiler.Core.Eval.quoteArgValuesFuel", "Vuna/Compiler/Core/Eval.vuna:833"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteCaseAlt", ("Vuna.Compiler.Core.Eval.quoteCaseAlt", "Vuna/Compiler/Core/Eval.vuna:817"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteCaseAltFuel", ("Vuna.Compiler.Core.Eval.quoteCaseAltFuel", "Vuna/Compiler/Core/Eval.vuna:820"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteFuel", ("Vuna.Compiler.Core.Eval.quoteFuel", "Vuna/Compiler/Core/Eval.vuna:791"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteNeutral", ("Vuna.Compiler.Core.Eval.quoteNeutral", "Vuna/Compiler/Core/Eval.vuna:854"));
  ("v_Vuna_dCompiler_dCore_dEval_dquoteNeutralFuel", ("Vuna.Compiler.Core.Eval.quoteNeutralFuel", "Vuna/Compiler/Core/Eval.vuna:857"));
  ("v_Vuna_dCompiler_dCore_dEval_drowRemReduce", ("Vuna.Compiler.Core.Eval.rowRemReduce", "Vuna/Compiler/Core/Eval.vuna:495"));
  ("v_Vuna_dCompiler_dCore_dEval_dshowFloatOf", ("Vuna.Compiler.Core.Eval.showFloatOf", "Vuna/Compiler/Core/Eval.vuna:283"));
  ("v_Vuna_dCompiler_dCore_dEval_dshowFloatRaw", ("Vuna.Compiler.Core.Eval.showFloatRaw", "Vuna/Compiler/Core/Eval.vuna:287"));
  ("v_Vuna_dCompiler_dCore_dEval_dshowValue", ("Vuna.Compiler.Core.Eval.showValue", "Vuna/Compiler/Core/Eval.vuna:969"));
  ("v_Vuna_dCompiler_dCore_dEval_dshowValueAt", ("Vuna.Compiler.Core.Eval.showValueAt", "Vuna/Compiler/Core/Eval.vuna:954"));
  ("v_Vuna_dCompiler_dCore_dEval_dspineAppend", ("Vuna.Compiler.Core.Eval.spineAppend", "Vuna/Compiler/Core/Eval.vuna:134"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrAtBytes", ("Vuna.Compiler.Core.Eval.strAtBytes", "Vuna/Compiler/Core/Eval.vuna:669"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrEq", ("Vuna.Compiler.Core.Eval.strEq", "Vuna/Compiler/Core/Eval.vuna:399"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrHashChars", ("Vuna.Compiler.Core.Eval.strHashChars", "Vuna/Compiler/Core/Eval.vuna:656"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrHashOf", ("Vuna.Compiler.Core.Eval.strHashOf", "Vuna/Compiler/Core/Eval.vuna:653"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrPrim1", ("Vuna.Compiler.Core.Eval.strPrim1", "Vuna/Compiler/Core/Eval.vuna:392"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrPrim2", ("Vuna.Compiler.Core.Eval.strPrim2", "Vuna/Compiler/Core/Eval.vuna:356"));
  ("v_Vuna_dCompiler_dCore_dEval_dstrPrim3", ("Vuna.Compiler.Core.Eval.strPrim3", "Vuna/Compiler/Core/Eval.vuna:423"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAlt", ("Vuna.Compiler.Core.Eval.substSolvedAlt", "Vuna/Compiler/Core/Eval.vuna:906"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAt", ("Vuna.Compiler.Core.Eval.substSolvedAltAt", "Vuna/Compiler/Core/Eval.vuna:945"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedAltAtTbl", ("Vuna.Compiler.Core.Eval.substSolvedAltAtTbl", "Vuna/Compiler/Core/Eval.vuna:1023"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetas", ("Vuna.Compiler.Core.Eval.substSolvedMetas", "Vuna/Compiler/Core/Eval.vuna:880"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAt", ("Vuna.Compiler.Core.Eval.substSolvedMetasAt", "Vuna/Compiler/Core/Eval.vuna:915"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtGo", ("Vuna.Compiler.Core.Eval.substSolvedMetasAtGo", "Vuna/Compiler/Core/Eval.vuna:919"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTbl", ("Vuna.Compiler.Core.Eval.substSolvedMetasAtTbl", "Vuna/Compiler/Core/Eval.vuna:991"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstSolvedMetasAtTblFuel", ("Vuna.Compiler.Core.Eval.substSolvedMetasAtTblFuel", "Vuna/Compiler/Core/Eval.vuna:994"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstringBytes", ("Vuna.Compiler.Core.Eval.substringBytes", "Vuna/Compiler/Core/Eval.vuna:688"));
  ("v_Vuna_dCompiler_dCore_dEval_dsubstringPrim", ("Vuna.Compiler.Core.Eval.substringPrim", "Vuna/Compiler/Core/Eval.vuna:678"));
  ("v_Vuna_dCompiler_dCore_dEval_dtakeBytes", ("Vuna.Compiler.Core.Eval.takeBytes", "Vuna/Compiler/Core/Eval.vuna:696"));
  ("v_Vuna_dCompiler_dCore_dEval_dvalueEqFuel", ("Vuna.Compiler.Core.Eval.valueEqFuel", "Vuna/Compiler/Core/Eval.vuna:437"));
  ("v_Vuna_dCompiler_dCore_dEval_dvalueListEqFuel", ("Vuna.Compiler.Core.Eval.valueListEqFuel", "Vuna/Compiler/Core/Eval.vuna:472"));
  ("v_Vuna_dCompiler_dCore_dEval_dvarIndex", ("Vuna.Compiler.Core.Eval.varIndex", "Vuna/Compiler/Core/Eval.vuna:869"));
  ("v_Vuna_dCompiler_dCore_dTerm_danyAltFree", ("Vuna.Compiler.Core.Term.anyAltFree", "Vuna/Compiler/Core/Term.vuna:712"));
  ("v_Vuna_dCompiler_dCore_dTerm_danyAltUsesFloat", ("Vuna.Compiler.Core.Term.anyAltUsesFloat", "Vuna/Compiler/Core/Term.vuna:413"));
  ("v_Vuna_dCompiler_dCore_dTerm_danyArgUsesFloat", ("Vuna.Compiler.Core.Term.anyArgUsesFloat", "Vuna/Compiler/Core/Term.vuna:408"));
  ("v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarAlts", ("Vuna.Compiler.Core.Term.anyNegativeVarAlts", "Vuna/Compiler/Core/Term.vuna:737"));
  ("v_Vuna_dCompiler_dCore_dTerm_danyNegativeVarArgs", ("Vuna.Compiler.Core.Term.anyNegativeVarArgs", "Vuna/Compiler/Core/Term.vuna:733"));
  ("v_Vuna_dCompiler_dCore_dTerm_danyPairFree", ("Vuna.Compiler.Core.Term.anyPairFree", "Vuna/Compiler/Core/Term.vuna:708"));
  ("v_Vuna_dCompiler_dCore_dTerm_dbodyTermsOf", ("Vuna.Compiler.Core.Term.bodyTermsOf", "Vuna/Compiler/Core/Term.vuna:460"));
  ("v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders", ("Vuna.Compiler.Core.Term.caseAltBinders", "Vuna/Compiler/Core/Term.vuna:164"));
  ("v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody", ("Vuna.Compiler.Core.Term.caseAltBody", "Vuna/Compiler/Core/Term.vuna:167"));
  ("v_Vuna_dCompiler_dCore_dTerm_dcaseAltName", ("Vuna.Compiler.Core.Term.caseAltName", "Vuna/Compiler/Core/Term.vuna:161"));
  ("v_Vuna_dCompiler_dCore_dTerm_dcountLams", ("Vuna.Compiler.Core.Term.countLams", "Vuna/Compiler/Core/Term.vuna:686"));
  ("v_Vuna_dCompiler_dCore_dTerm_dcountPis", ("Vuna.Compiler.Core.Term.countPis", "Vuna/Compiler/Core/Term.vuna:668"));
  ("v_Vuna_dCompiler_dCore_dTerm_dcutoffOf", ("Vuna.Compiler.Core.Term.cutoffOf", "Vuna/Compiler/Core/Term.vuna:665"));
  ("v_Vuna_dCompiler_dCore_dTerm_ddefLookup", ("Vuna.Compiler.Core.Term.defLookup", "Vuna/Compiler/Core/Term.vuna:471"));
  ("v_Vuna_dCompiler_dCore_dTerm_ddefaultExplicitRig", ("Vuna.Compiler.Core.Term.defaultExplicitRig", "Vuna/Compiler/Core/Term.vuna:56"));
  ("v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel", ("Vuna.Compiler.Core.Term.defaultFuel", "Vuna/Compiler/Core/Term.vuna:205"));
  ("v_Vuna_dCompiler_dCore_dTerm_dflattenTermApp", ("Vuna.Compiler.Core.Term.flattenTermApp", "Vuna/Compiler/Core/Term.vuna:253"));
  ("v_Vuna_dCompiler_dCore_dTerm_dflattenTermAppGo", ("Vuna.Compiler.Core.Term.flattenTermAppGo", "Vuna/Compiler/Core/Term.vuna:256"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasFreeTermVar", ("Vuna.Compiler.Core.Term.hasFreeTermVar", "Vuna/Compiler/Core/Term.vuna:691"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasFreeVar", ("Vuna.Compiler.Core.Term.hasFreeVar", "Vuna/Compiler/Core/Term.vuna:475"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarAlts", ("Vuna.Compiler.Core.Term.hasFreeVarAlts", "Vuna/Compiler/Core/Term.vuna:501"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasFreeVarArgs", ("Vuna.Compiler.Core.Term.hasFreeVarArgs", "Vuna/Compiler/Core/Term.vuna:497"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasMeta", ("Vuna.Compiler.Core.Term.hasMeta", "Vuna/Compiler/Core/Term.vuna:506"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasMetaAlts", ("Vuna.Compiler.Core.Term.hasMetaAlts", "Vuna/Compiler/Core/Term.vuna:531"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasMetaArgs", ("Vuna.Compiler.Core.Term.hasMetaArgs", "Vuna/Compiler/Core/Term.vuna:527"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasNegativeVar", ("Vuna.Compiler.Core.Term.hasNegativeVar", "Vuna/Compiler/Core/Term.vuna:719"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaClo", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaClo", "Vuna/Compiler/Core/Term.vuna:778"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaCloFuel", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaCloFuel", "Vuna/Compiler/Core/Term.vuna:781"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaList", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaList", "Vuna/Compiler/Core/Term.vuna:768"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaListFuel", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaListFuel", "Vuna/Compiler/Core/Term.vuna:771"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValue", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaValue", "Vuna/Compiler/Core/Term.vuna:742"));
  ("v_Vuna_dCompiler_dCore_dTerm_dhasUnsolvedMetaValueFuel", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaValueFuel", "Vuna/Compiler/Core/Term.vuna:745"));
  ("v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinder", ("Vuna.Compiler.Core.Term.insertDictBinder", "Vuna/Compiler/Core/Term.vuna:642"));
  ("v_Vuna_dCompiler_dCore_dTerm_dinsertDictBinderGo", ("Vuna.Compiler.Core.Term.insertDictBinderGo", "Vuna/Compiler/Core/Term.vuna:648"));
  ("v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinder", ("Vuna.Compiler.Core.Term.insertImplicitBinder", "Vuna/Compiler/Core/Term.vuna:655"));
  ("v_Vuna_dCompiler_dCore_dTerm_dinsertImplicitBinderGo", ("Vuna.Compiler.Core.Term.insertImplicitBinderGo", "Vuna/Compiler/Core/Term.vuna:658"));
  ("v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinder", ("Vuna.Compiler.Core.Term.insertLamBinder", "Vuna/Compiler/Core/Term.vuna:677"));
  ("v_Vuna_dCompiler_dCore_dTerm_dinsertLamBinderGo", ("Vuna.Compiler.Core.Term.insertLamBinderGo", "Vuna/Compiler/Core/Term.vuna:680"));
  ("v_Vuna_dCompiler_dCore_dTerm_disTypeValue", ("Vuna.Compiler.Core.Term.isTypeValue", "Vuna/Compiler/Core/Term.vuna:789"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelEq", ("Vuna.Compiler.Core.Term.levelEq", "Vuna/Compiler/Core/Term.vuna:117"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelEscapes", ("Vuna.Compiler.Core.Term.levelEscapes", "Vuna/Compiler/Core/Term.vuna:801"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesClo", ("Vuna.Compiler.Core.Term.levelEscapesClo", "Vuna/Compiler/Core/Term.vuna:825"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelEscapesList", ("Vuna.Compiler.Core.Term.levelEscapesList", "Vuna/Compiler/Core/Term.vuna:821"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelLt", ("Vuna.Compiler.Core.Term.levelLt", "Vuna/Compiler/Core/Term.vuna:120"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelMax", ("Vuna.Compiler.Core.Term.levelMax", "Vuna/Compiler/Core/Term.vuna:107"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelOfInt", ("Vuna.Compiler.Core.Term.levelOfInt", "Vuna/Compiler/Core/Term.vuna:114"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelSucc", ("Vuna.Compiler.Core.Term.levelSucc", "Vuna/Compiler/Core/Term.vuna:104"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelToInt", ("Vuna.Compiler.Core.Term.levelToInt", "Vuna/Compiler/Core/Term.vuna:110"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlevelZero", ("Vuna.Compiler.Core.Term.levelZero", "Vuna/Compiler/Core/Term.vuna:101"));
  ("v_Vuna_dCompiler_dCore_dTerm_dlookupPair", ("Vuna.Compiler.Core.Term.lookupPair", "Vuna/Compiler/Core/Term.vuna:467"));
  ("v_Vuna_dCompiler_dCore_dTerm_dmetaLookup", ("Vuna.Compiler.Core.Term.metaLookup", "Vuna/Compiler/Core/Term.vuna:296"));
  ("v_Vuna_dCompiler_dCore_dTerm_dmetaLookupList", ("Vuna.Compiler.Core.Term.metaLookupList", "Vuna/Compiler/Core/Term.vuna:300"));
  ("v_Vuna_dCompiler_dCore_dTerm_dnatChainArgs", ("Vuna.Compiler.Core.Term.natChainArgs", "Vuna/Compiler/Core/Term.vuna:237"));
  ("v_Vuna_dCompiler_dCore_dTerm_dnatChainGo", ("Vuna.Compiler.Core.Term.natChainGo", "Vuna/Compiler/Core/Term.vuna:229"));
  ("v_Vuna_dCompiler_dCore_dTerm_dnatChainMax", ("Vuna.Compiler.Core.Term.natChainMax", "Vuna/Compiler/Core/Term.vuna:219"));
  ("v_Vuna_dCompiler_dCore_dTerm_dnatChainNext", ("Vuna.Compiler.Core.Term.natChainNext", "Vuna/Compiler/Core/Term.vuna:249"));
  ("v_Vuna_dCompiler_dCore_dTerm_dnatChainValue", ("Vuna.Compiler.Core.Term.natChainValue", "Vuna/Compiler/Core/Term.vuna:226"));
  ("v_Vuna_dCompiler_dCore_dTerm_dreachesTermsFuel", ("Vuna.Compiler.Core.Term.reachesTermsFuel", "Vuna/Compiler/Core/Term.vuna:451"));
  ("v_Vuna_dCompiler_dCore_dTerm_drecordAppShow", ("Vuna.Compiler.Core.Term.recordAppShow", "Vuna/Compiler/Core/Term.vuna:879"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigAdd", ("Vuna.Compiler.Core.Term.rigAdd", "Vuna/Compiler/Core/Term.vuna:63"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigExact", ("Vuna.Compiler.Core.Term.rigExact", "Vuna/Compiler/Core/Term.vuna:83"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigIsErased", ("Vuna.Compiler.Core.Term.rigIsErased", "Vuna/Compiler/Core/Term.vuna:35"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigIsLinear", ("Vuna.Compiler.Core.Term.rigIsLinear", "Vuna/Compiler/Core/Term.vuna:40"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigIsOmega", ("Vuna.Compiler.Core.Term.rigIsOmega", "Vuna/Compiler/Core/Term.vuna:44"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigJoin", ("Vuna.Compiler.Core.Term.rigJoin", "Vuna/Compiler/Core/Term.vuna:75"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigOfBinder", ("Vuna.Compiler.Core.Term.rigOfBinder", "Vuna/Compiler/Core/Term.vuna:51"));
  ("v_Vuna_dCompiler_dCore_dTerm_drigScale", ("Vuna.Compiler.Core.Term.rigScale", "Vuna/Compiler/Core/Term.vuna:69"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshift", ("Vuna.Compiler.Core.Term.shift", "Vuna/Compiler/Core/Term.vuna:540"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshiftAlt", ("Vuna.Compiler.Core.Term.shiftAlt", "Vuna/Compiler/Core/Term.vuna:573"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshiftAlts", ("Vuna.Compiler.Core.Term.shiftAlts", "Vuna/Compiler/Core/Term.vuna:569"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshiftArgs", ("Vuna.Compiler.Core.Term.shiftArgs", "Vuna/Compiler/Core/Term.vuna:564"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowArgTerms", ("Vuna.Compiler.Core.Term.showArgTerms", "Vuna/Compiler/Core/Term.vuna:874"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowBinders", ("Vuna.Compiler.Core.Term.showBinders", "Vuna/Compiler/Core/Term.vuna:894"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowCoreAlts", ("Vuna.Compiler.Core.Term.showCoreAlts", "Vuna/Compiler/Core/Term.vuna:889"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowCoreChars", ("Vuna.Compiler.Core.Term.showCoreChars", "Vuna/Compiler/Core/Term.vuna:901"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowCoreString", ("Vuna.Compiler.Core.Term.showCoreString", "Vuna/Compiler/Core/Term.vuna:898"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowRig", ("Vuna.Compiler.Core.Term.showRig", "Vuna/Compiler/Core/Term.vuna:90"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowSigAppText", ("Vuna.Compiler.Core.Term.showSigAppText", "Vuna/Compiler/Core/Term.vuna:884"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowSigArgs", ("Vuna.Compiler.Core.Term.showSigArgs", "Vuna/Compiler/Core/Term.vuna:870"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowSigParenIfPi", ("Vuna.Compiler.Core.Term.showSigParenIfPi", "Vuna/Compiler/Core/Term.vuna:866"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowTerm", ("Vuna.Compiler.Core.Term.showTerm", "Vuna/Compiler/Core/Term.vuna:828"));
  ("v_Vuna_dCompiler_dCore_dTerm_dshowTypeSig", ("Vuna.Compiler.Core.Term.showTypeSig", "Vuna/Compiler/Core/Term.vuna:855"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsCons", ("Vuna.Compiler.Core.Term.solsCons", "Vuna/Compiler/Core/Term.vuna:342"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsDepth", ("Vuna.Compiler.Core.Term.solsDepth", "Vuna/Compiler/Core/Term.vuna:334"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty", ("Vuna.Compiler.Core.Term.solsEmpty", "Vuna/Compiler/Core/Term.vuna:319"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsFromList", ("Vuna.Compiler.Core.Term.solsFromList", "Vuna/Compiler/Core/Term.vuna:322"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsList", ("Vuna.Compiler.Core.Term.solsList", "Vuna/Compiler/Core/Term.vuna:330"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsLookup", ("Vuna.Compiler.Core.Term.solsLookup", "Vuna/Compiler/Core/Term.vuna:339"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsolsOf", ("Vuna.Compiler.Core.Term.solsOf", "Vuna/Compiler/Core/Term.vuna:327"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsubstAltAt", ("Vuna.Compiler.Core.Term.substAltAt", "Vuna/Compiler/Core/Term.vuna:605"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVar", ("Vuna.Compiler.Core.Term.substMetaVar", "Vuna/Compiler/Core/Term.vuna:610"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarAlt", ("Vuna.Compiler.Core.Term.substMetaVarAlt", "Vuna/Compiler/Core/Term.vuna:636"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsubstMetaVarGo", ("Vuna.Compiler.Core.Term.substMetaVarGo", "Vuna/Compiler/Core/Term.vuna:613"));
  ("v_Vuna_dCompiler_dCore_dTerm_dsubstVarAt", ("Vuna.Compiler.Core.Term.substVarAt", "Vuna/Compiler/Core/Term.vuna:578"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermGlobalNames", ("Vuna.Compiler.Core.Term.termGlobalNames", "Vuna/Compiler/Core/Term.vuna:419"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMeta", ("Vuna.Compiler.Core.Term.termHasUnsolvedMeta", "Vuna/Compiler/Core/Term.vuna:347"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaAlts", ("Vuna.Compiler.Core.Term.termHasUnsolvedMetaAlts", "Vuna/Compiler/Core/Term.vuna:378"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermHasUnsolvedMetaArgs", ("Vuna.Compiler.Core.Term.termHasUnsolvedMetaArgs", "Vuna/Compiler/Core/Term.vuna:373"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermReachesFloat", ("Vuna.Compiler.Core.Term.termReachesFloat", "Vuna/Compiler/Core/Term.vuna:446"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermSize", ("Vuna.Compiler.Core.Term.termSize", "Vuna/Compiler/Core/Term.vuna:264"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermSizeAlts", ("Vuna.Compiler.Core.Term.termSizeAlts", "Vuna/Compiler/Core/Term.vuna:288"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermSizeArgs", ("Vuna.Compiler.Core.Term.termSizeArgs", "Vuna/Compiler/Core/Term.vuna:284"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtermUsesFloat", ("Vuna.Compiler.Core.Term.termUsesFloat", "Vuna/Compiler/Core/Term.vuna:385"));
  ("v_Vuna_dCompiler_dCore_dTerm_dtypeLevelOf", ("Vuna.Compiler.Core.Term.typeLevelOf", "Vuna/Compiler/Core/Term.vuna:793"));
  ("v_Vuna_dCompiler_dDriver_dCache_dbodyIssueAt", ("Vuna.Compiler.Driver.Cache.bodyIssueAt", "Vuna/Compiler/Driver/Cache.vuna:212"));
  ("v_Vuna_dCompiler_dDriver_dCache_dbodyValid", ("Vuna.Compiler.Driver.Cache.bodyValid", "Vuna/Compiler/Driver/Cache.vuna:141"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedClasses", ("Vuna.Compiler.Driver.Cache.cachedClasses", "Vuna/Compiler/Driver/Cache.vuna:49"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedDatas", ("Vuna.Compiler.Driver.Cache.cachedDatas", "Vuna/Compiler/Driver/Cache.vuna:37"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedDefs", ("Vuna.Compiler.Driver.Cache.cachedDefs", "Vuna/Compiler/Driver/Cache.vuna:40"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedGlobals", ("Vuna.Compiler.Driver.Cache.cachedGlobals", "Vuna/Compiler/Driver/Cache.vuna:43"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedInsts", ("Vuna.Compiler.Driver.Cache.cachedInsts", "Vuna/Compiler/Driver/Cache.vuna:46"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgram", ("Vuna.Compiler.Driver.Cache.cachedOfProgram", "Vuna/Compiler/Driver/Cache.vuna:103"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedOfProgramWith", ("Vuna.Compiler.Driver.Cache.cachedOfProgramWith", "Vuna/Compiler/Driver/Cache.vuna:109"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedOpaqueOf", ("Vuna.Compiler.Driver.Cache.cachedOpaqueOf", "Vuna/Compiler/Driver/Cache.vuna:52"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedProgramIssue", ("Vuna.Compiler.Driver.Cache.cachedProgramIssue", "Vuna/Compiler/Driver/Cache.vuna:300"));
  ("v_Vuna_dCompiler_dDriver_dCache_dcachedProgramValid", ("Vuna.Compiler.Driver.Cache.cachedProgramValid", "Vuna/Compiler/Driver/Cache.vuna:176"));
  ("v_Vuna_dCompiler_dDriver_dCache_dclassIssue", ("Vuna.Compiler.Driver.Cache.classIssue", "Vuna/Compiler/Driver/Cache.vuna:279"));
  ("v_Vuna_dCompiler_dDriver_dCache_dclassesIssue", ("Vuna.Compiler.Driver.Cache.classesIssue", "Vuna/Compiler/Driver/Cache.vuna:293"));
  ("v_Vuna_dCompiler_dDriver_dCache_dclassesValid", ("Vuna.Compiler.Driver.Cache.classesValid", "Vuna/Compiler/Driver/Cache.vuna:166"));
  ("v_Vuna_dCompiler_dDriver_dCache_dctorIssues", ("Vuna.Compiler.Driver.Cache.ctorIssues", "Vuna/Compiler/Driver/Cache.vuna:198"));
  ("v_Vuna_dCompiler_dDriver_dCache_dctorsValid", ("Vuna.Compiler.Driver.Cache.ctorsValid", "Vuna/Compiler/Driver/Cache.vuna:124"));
  ("v_Vuna_dCompiler_dDriver_dCache_dctxIssues", ("Vuna.Compiler.Driver.Cache.ctxIssues", "Vuna/Compiler/Driver/Cache.vuna:265"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddataIssue", ("Vuna.Compiler.Driver.Cache.dataIssue", "Vuna/Compiler/Driver/Cache.vuna:192"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddatasIssue", ("Vuna.Compiler.Driver.Cache.datasIssue", "Vuna/Compiler/Driver/Cache.vuna:205"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddatasValid", ("Vuna.Compiler.Driver.Cache.datasValid", "Vuna/Compiler/Driver/Cache.vuna:128"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddecCachedProgram", ("Vuna.Compiler.Driver.Cache.decCachedProgram", "Vuna/Compiler/Driver/Cache.vuna:456"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddecCachedProgramComplete", ("Vuna.Compiler.Driver.Cache.decCachedProgramComplete", "Vuna/Compiler/Driver/Cache.vuna:451"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddecGlobalPair", ("Vuna.Compiler.Driver.Cache.decGlobalPair", "Vuna/Compiler/Driver/Cache.vuna:461"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddefIssue", ("Vuna.Compiler.Driver.Cache.defIssue", "Vuna/Compiler/Driver/Cache.vuna:217"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddefsIssue", ("Vuna.Compiler.Driver.Cache.defsIssue", "Vuna/Compiler/Driver/Cache.vuna:229"));
  ("v_Vuna_dCompiler_dDriver_dCache_ddefsValid", ("Vuna.Compiler.Driver.Cache.defsValid", "Vuna/Compiler/Driver/Cache.vuna:133"));
  ("v_Vuna_dCompiler_dDriver_dCache_dencCachedProgram", ("Vuna.Compiler.Driver.Cache.encCachedProgram", "Vuna/Compiler/Driver/Cache.vuna:442"));
  ("v_Vuna_dCompiler_dDriver_dCache_dencGlobalPair", ("Vuna.Compiler.Driver.Cache.encGlobalPair", "Vuna/Compiler/Driver/Cache.vuna:447"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixClass", ("Vuna.Compiler.Driver.Cache.fixClass", "Vuna/Compiler/Driver/Cache.vuna:85"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixCtor", ("Vuna.Compiler.Driver.Cache.fixCtor", "Vuna/Compiler/Driver/Cache.vuna:70"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixData", ("Vuna.Compiler.Driver.Cache.fixData", "Vuna/Compiler/Driver/Cache.vuna:77"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixDef", ("Vuna.Compiler.Driver.Cache.fixDef", "Vuna/Compiler/Driver/Cache.vuna:65"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixFieldMeta", ("Vuna.Compiler.Driver.Cache.fixFieldMeta", "Vuna/Compiler/Driver/Cache.vuna:75"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixInst", ("Vuna.Compiler.Driver.Cache.fixInst", "Vuna/Compiler/Driver/Cache.vuna:97"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixTele", ("Vuna.Compiler.Driver.Cache.fixTele", "Vuna/Compiler/Driver/Cache.vuna:92"));
  ("v_Vuna_dCompiler_dDriver_dCache_dfixTerm", ("Vuna.Compiler.Driver.Cache.fixTerm", "Vuna/Compiler/Driver/Cache.vuna:62"));
  ("v_Vuna_dCompiler_dDriver_dCache_dglobalsIssue", ("Vuna.Compiler.Driver.Cache.globalsIssue", "Vuna/Compiler/Driver/Cache.vuna:236"));
  ("v_Vuna_dCompiler_dDriver_dCache_dglobalsValid", ("Vuna.Compiler.Driver.Cache.globalsValid", "Vuna/Compiler/Driver/Cache.vuna:144"));
  ("v_Vuna_dCompiler_dDriver_dCache_dinstIssue", ("Vuna.Compiler.Driver.Cache.instIssue", "Vuna/Compiler/Driver/Cache.vuna:243"));
  ("v_Vuna_dCompiler_dDriver_dCache_dinstsIssue", ("Vuna.Compiler.Driver.Cache.instsIssue", "Vuna/Compiler/Driver/Cache.vuna:272"));
  ("v_Vuna_dCompiler_dDriver_dCache_dinstsValid", ("Vuna.Compiler.Driver.Cache.instsValid", "Vuna/Compiler/Driver/Cache.vuna:156"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftAlts", ("Vuna.Compiler.Driver.Cache.shiftAlts", "Vuna/Compiler/Driver/Cache.vuna:379"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftArgs", ("Vuna.Compiler.Driver.Cache.shiftArgs", "Vuna/Compiler/Driver/Cache.vuna:373"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftCachedProgram", ("Vuna.Compiler.Driver.Cache.shiftCachedProgram", "Vuna/Compiler/Driver/Cache.vuna:427"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftClass", ("Vuna.Compiler.Driver.Cache.shiftClass", "Vuna/Compiler/Driver/Cache.vuna:413"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftCtor", ("Vuna.Compiler.Driver.Cache.shiftCtor", "Vuna/Compiler/Driver/Cache.vuna:394"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftData", ("Vuna.Compiler.Driver.Cache.shiftData", "Vuna/Compiler/Driver/Cache.vuna:402"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftDef", ("Vuna.Compiler.Driver.Cache.shiftDef", "Vuna/Compiler/Driver/Cache.vuna:385"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftFieldMeta", ("Vuna.Compiler.Driver.Cache.shiftFieldMeta", "Vuna/Compiler/Driver/Cache.vuna:398"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftGlobal", ("Vuna.Compiler.Driver.Cache.shiftGlobal", "Vuna/Compiler/Driver/Cache.vuna:423"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftInst", ("Vuna.Compiler.Driver.Cache.shiftInst", "Vuna/Compiler/Driver/Cache.vuna:418"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftTele", ("Vuna.Compiler.Driver.Cache.shiftTele", "Vuna/Compiler/Driver/Cache.vuna:407"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftTerm", ("Vuna.Compiler.Driver.Cache.shiftTerm", "Vuna/Compiler/Driver/Cache.vuna:331"));
  ("v_Vuna_dCompiler_dDriver_dCache_dshiftTermFuel", ("Vuna.Compiler.Driver.Cache.shiftTermFuel", "Vuna/Compiler/Driver/Cache.vuna:334"));
  ("v_Vuna_dCompiler_dDriver_dCache_dsummaryMetaSegment", ("Vuna.Compiler.Driver.Cache.summaryMetaSegment", "Vuna/Compiler/Driver/Cache.vuna:321"));
  ("v_Vuna_dCompiler_dDriver_dCache_dteleIssueGo", ("Vuna.Compiler.Driver.Cache.teleIssueGo", "Vuna/Compiler/Driver/Cache.vuna:258"));
  ("v_Vuna_dCompiler_dDriver_dCache_dteleValid", ("Vuna.Compiler.Driver.Cache.teleValid", "Vuna/Compiler/Driver/Cache.vuna:148"));
  ("v_Vuna_dCompiler_dDriver_dCache_dtermIssueAt", ("Vuna.Compiler.Driver.Cache.termIssueAt", "Vuna/Compiler/Driver/Cache.vuna:187"));
  ("v_Vuna_dCompiler_dDriver_dCache_dtermValidAt", ("Vuna.Compiler.Driver.Cache.termValidAt", "Vuna/Compiler/Driver/Cache.vuna:120"));
  ("v_Vuna_dCompiler_dDriver_dCache_dtermsValidAt", ("Vuna.Compiler.Driver.Cache.termsValidAt", "Vuna/Compiler/Driver/Cache.vuna:152"));
  ("v_Vuna_dCompiler_dDriver_dCache_dwithCachedOpaque", ("Vuna.Compiler.Driver.Cache.withCachedOpaque", "Vuna/Compiler/Driver/Cache.vuna:55"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dabsoluteSpanLabel", ("Vuna.Compiler.Driver.Compile.absoluteSpanLabel", "Vuna/Compiler/Driver/Compile.vuna:1630"));
  ("v_Vuna_dCompiler_dDriver_dCompile_daddrOfModIn", ("Vuna.Compiler.Driver.Compile.addrOfModIn", "Vuna/Compiler/Driver/Compile.vuna:884"));
  ("v_Vuna_dCompiler_dDriver_dCompile_daddrsVia", ("Vuna.Compiler.Driver.Compile.addrsVia", "Vuna/Compiler/Driver/Compile.vuna:979"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dallModuleSourcesValid", ("Vuna.Compiler.Driver.Compile.allModuleSourcesValid", "Vuna/Compiler/Driver/Compile.vuna:1244"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dallNamesIn", ("Vuna.Compiler.Driver.Compile.allNamesIn", "Vuna/Compiler/Driver/Compile.vuna:726"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dallSelfHashesOk", ("Vuna.Compiler.Driver.Compile.allSelfHashesOk", "Vuna/Compiler/Driver/Compile.vuna:2157"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dallStableDiags", ("Vuna.Compiler.Driver.Compile.allStableDiags", "Vuna/Compiler/Driver/Compile.vuna:1652"));
  ("v_Vuna_dCompiler_dDriver_dCompile_danyAbsoluteChild", ("Vuna.Compiler.Driver.Compile.anyAbsoluteChild", "Vuna/Compiler/Driver/Compile.vuna:1639"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dassignAndWriteMods", ("Vuna.Compiler.Driver.Compile.assignAndWriteMods", "Vuna/Compiler/Driver/Compile.vuna:982"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dassignGo", ("Vuna.Compiler.Driver.Compile.assignGo", "Vuna/Compiler/Driver/Compile.vuna:899"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dassignOrdered", ("Vuna.Compiler.Driver.Compile.assignOrdered", "Vuna/Compiler/Driver/Compile.vuna:908"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dauditCheckExe", ("Vuna.Compiler.Driver.Compile.auditCheckExe", "Vuna/Compiler/Driver/Compile.vuna:1849"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dauditCheckLib", ("Vuna.Compiler.Driver.Compile.auditCheckLib", "Vuna/Compiler/Driver/Compile.vuna:2228"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dauditCompare", ("Vuna.Compiler.Driver.Compile.auditCompare", "Vuna/Compiler/Driver/Compile.vuna:1894"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dauditCompile", ("Vuna.Compiler.Driver.Compile.auditCompile", "Vuna/Compiler/Driver/Compile.vuna:259"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dbaseDepIfacesOf", ("Vuna.Compiler.Driver.Compile.baseDepIfacesOf", "Vuna/Compiler/Driver/Compile.vuna:1372"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dbuildIdForEff", ("Vuna.Compiler.Driver.Compile.buildIdForEff", "Vuna/Compiler/Driver/Compile.vuna:501"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dbuildMetaText", ("Vuna.Compiler.Driver.Compile.buildMetaText", "Vuna/Compiler/Driver/Compile.vuna:594"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dbuildSplit", ("Vuna.Compiler.Driver.Compile.buildSplit", "Vuna/Compiler/Driver/Compile.vuna:359"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dbuildViewAddrOf", ("Vuna.Compiler.Driver.Compile.buildViewAddrOf", "Vuna/Compiler/Driver/Compile.vuna:2378"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcacheBase", ("Vuna.Compiler.Driver.Compile.cacheBase", "Vuna/Compiler/Driver/Compile.vuna:397"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcanonicalDir", ("Vuna.Compiler.Driver.Compile.canonicalDir", "Vuna/Compiler/Driver/Compile.vuna:1611"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcanonicalPath", ("Vuna.Compiler.Driver.Compile.canonicalPath", "Vuna/Compiler/Driver/Compile.vuna:1615"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckAndShadow", ("Vuna.Compiler.Driver.Compile.checkAndShadow", "Vuna/Compiler/Driver/Compile.vuna:2168"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedExe", ("Vuna.Compiler.Driver.Compile.checkCachedExe", "Vuna/Compiler/Driver/Compile.vuna:1791"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckCachedLib", ("Vuna.Compiler.Driver.Compile.checkCachedLib", "Vuna/Compiler/Driver/Compile.vuna:2179"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckInOf", ("Vuna.Compiler.Driver.Compile.checkInOf", "Vuna/Compiler/Driver/Compile.vuna:2385"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckModsExe", ("Vuna.Compiler.Driver.Compile.checkModsExe", "Vuna/Compiler/Driver/Compile.vuna:683"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckModsLib", ("Vuna.Compiler.Driver.Compile.checkModsLib", "Vuna/Compiler/Driver/Compile.vuna:696"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckModsOf", ("Vuna.Compiler.Driver.Compile.checkModsOf", "Vuna/Compiler/Driver/Compile.vuna:1691"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckNodeSchema", ("Vuna.Compiler.Driver.Compile.checkNodeSchema", "Vuna/Compiler/Driver/Compile.vuna:640"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckPackage", ("Vuna.Compiler.Driver.Compile.checkPackage", "Vuna/Compiler/Driver/Compile.vuna:87"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckSignatureOf", ("Vuna.Compiler.Driver.Compile.checkSignatureOf", "Vuna/Compiler/Driver/Compile.vuna:1878"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedExe", ("Vuna.Compiler.Driver.Compile.checkUncachedExe", "Vuna/Compiler/Driver/Compile.vuna:1800"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckUncachedLib", ("Vuna.Compiler.Driver.Compile.checkUncachedLib", "Vuna/Compiler/Driver/Compile.vuna:2185"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcheckViaGraph", ("Vuna.Compiler.Driver.Compile.checkViaGraph", "Vuna/Compiler/Driver/Compile.vuna:1717"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcleanFixpoint", ("Vuna.Compiler.Driver.Compile.cleanFixpoint", "Vuna/Compiler/Driver/Compile.vuna:1541"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcleanHashOf", ("Vuna.Compiler.Driver.Compile.cleanHashOf", "Vuna/Compiler/Driver/Compile.vuna:1985"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcleanIfacesOrEmpty", ("Vuna.Compiler.Driver.Compile.cleanIfacesOrEmpty", "Vuna/Compiler/Driver/Compile.vuna:1960"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcleanPass", ("Vuna.Compiler.Driver.Compile.cleanPass", "Vuna/Compiler/Driver/Compile.vuna:1551"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcleanSelfOk", ("Vuna.Compiler.Driver.Compile.cleanSelfOk", "Vuna/Compiler/Driver/Compile.vuna:1520"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dclosureHashOf", ("Vuna.Compiler.Driver.Compile.closureHashOf", "Vuna/Compiler/Driver/Compile.vuna:461"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dclosureModsEff", ("Vuna.Compiler.Driver.Compile.closureModsEff", "Vuna/Compiler/Driver/Compile.vuna:803"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcollectClean", ("Vuna.Compiler.Driver.Compile.collectClean", "Vuna/Compiler/Driver/Compile.vuna:1946"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackages", ("Vuna.Compiler.Driver.Compile.collectDepPackages", "Vuna/Compiler/Driver/Compile.vuna:712"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcollectDepPackagesFuel", ("Vuna.Compiler.Driver.Compile.collectDepPackagesFuel", "Vuna/Compiler/Driver/Compile.vuna:715"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcollectVunaMeta", ("Vuna.Compiler.Driver.Compile.collectVunaMeta", "Vuna/Compiler/Driver/Compile.vuna:405"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcompileToDir", ("Vuna.Compiler.Driver.Compile.compileToDir", "Vuna/Compiler/Driver/Compile.vuna:149"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcompileToDirNormal", ("Vuna.Compiler.Driver.Compile.compileToDirNormal", "Vuna/Compiler/Driver/Compile.vuna:187"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcompilerClosureModule", ("Vuna.Compiler.Driver.Compile.compilerClosureModule", "Vuna/Compiler/Driver/Compile.vuna:497"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcompilerFingerprint", ("Vuna.Compiler.Driver.Compile.compilerFingerprint", "Vuna/Compiler/Driver/Compile.vuna:392"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dconcatMapEff", ("Vuna.Compiler.Driver.Compile.concatMapEff", "Vuna/Compiler/Driver/Compile.vuna:65"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcontextSources", ("Vuna.Compiler.Driver.Compile.contextSources", "Vuna/Compiler/Driver/Compile.vuna:475"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dcopyFfiFiles", ("Vuna.Compiler.Driver.Compile.copyFfiFiles", "Vuna/Compiler/Driver/Compile.vuna:338"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddecMods", ("Vuna.Compiler.Driver.Compile.decMods", "Vuna/Compiler/Driver/Compile.vuna:974"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddecOrderNamesComplete", ("Vuna.Compiler.Driver.Compile.decOrderNamesComplete", "Vuna/Compiler/Driver/Compile.vuna:1108"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddefLocLine", ("Vuna.Compiler.Driver.Compile.defLocLine", "Vuna/Compiler/Driver/Compile.vuna:2335"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepAddrOf", ("Vuna.Compiler.Driver.Compile.depAddrOf", "Vuna/Compiler/Driver/Compile.vuna:867"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesEff", ("Vuna.Compiler.Driver.Compile.depIdentitiesEff", "Vuna/Compiler/Driver/Compile.vuna:554"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIdentitiesHash", ("Vuna.Compiler.Driver.Compile.depIdentitiesHash", "Vuna/Compiler/Driver/Compile.vuna:559"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceHashTable", ("Vuna.Compiler.Driver.Compile.depIfaceHashTable", "Vuna/Compiler/Driver/Compile.vuna:1902"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfaceSourcesValid", ("Vuna.Compiler.Driver.Compile.depIfaceSourcesValid", "Vuna/Compiler/Driver/Compile.vuna:1228"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForCheck", ("Vuna.Compiler.Driver.Compile.depIfacesForCheck", "Vuna/Compiler/Driver/Compile.vuna:1289"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForTool", ("Vuna.Compiler.Driver.Compile.depIfacesForTool", "Vuna/Compiler/Driver/Compile.vuna:1363"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolProgram", ("Vuna.Compiler.Driver.Compile.depIfacesForToolProgram", "Vuna/Compiler/Driver/Compile.vuna:1360"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSource", ("Vuna.Compiler.Driver.Compile.depIfacesForToolSource", "Vuna/Compiler/Driver/Compile.vuna:1345"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesForToolSourceDetailed", ("Vuna.Compiler.Driver.Compile.depIfacesForToolSourceDetailed", "Vuna/Compiler/Driver/Compile.vuna:1450"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepIfacesOf", ("Vuna.Compiler.Driver.Compile.depIfacesOf", "Vuna/Compiler/Driver/Compile.vuna:1077"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepModsByOrderEff", ("Vuna.Compiler.Driver.Compile.depModsByOrderEff", "Vuna/Compiler/Driver/Compile.vuna:1202"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepModsOf", ("Vuna.Compiler.Driver.Compile.depModsOf", "Vuna/Compiler/Driver/Compile.vuna:1071"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepModsOrdered", ("Vuna.Compiler.Driver.Compile.depModsOrdered", "Vuna/Compiler/Driver/Compile.vuna:1217"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepPackageCount", ("Vuna.Compiler.Driver.Compile.depPackageCount", "Vuna/Compiler/Driver/Compile.vuna:742"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepPackageList", ("Vuna.Compiler.Driver.Compile.depPackageList", "Vuna/Compiler/Driver/Compile.vuna:737"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepRootIdentityEff", ("Vuna.Compiler.Driver.Compile.depRootIdentityEff", "Vuna/Compiler/Driver/Compile.vuna:531"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepSemanticText", ("Vuna.Compiler.Driver.Compile.depSemanticText", "Vuna/Compiler/Driver/Compile.vuna:663"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddepSourceText", ("Vuna.Compiler.Driver.Compile.depSourceText", "Vuna/Compiler/Driver/Compile.vuna:658"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddependencyHashes", ("Vuna.Compiler.Driver.Compile.dependencyHashes", "Vuna/Compiler/Driver/Compile.vuna:482"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddiagHasAbsolutePath", ("Vuna.Compiler.Driver.Compile.diagHasAbsolutePath", "Vuna/Compiler/Driver/Compile.vuna:1643"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddistinctPkgs", ("Vuna.Compiler.Driver.Compile.distinctPkgs", "Vuna/Compiler/Driver/Compile.vuna:1163"));
  ("v_Vuna_dCompiler_dDriver_dCompile_ddropPrefixMeta", ("Vuna.Compiler.Driver.Compile.dropPrefixMeta", "Vuna/Compiler/Driver/Compile.vuna:430"));
  ("v_Vuna_dCompiler_dDriver_dCompile_delabFullRequested", ("Vuna.Compiler.Driver.Compile.elabFullRequested", "Vuna/Compiler/Driver/Compile.vuna:1862"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dencMods", ("Vuna.Compiler.Driver.Compile.encMods", "Vuna/Compiler/Driver/Compile.vuna:971"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dencOrderNames", ("Vuna.Compiler.Driver.Compile.encOrderNames", "Vuna/Compiler/Driver/Compile.vuna:1105"));
  ("v_Vuna_dCompiler_dDriver_dCompile_densureDirPath", ("Vuna.Compiler.Driver.Compile.ensureDirPath", "Vuna/Compiler/Driver/Compile.vuna:131"));
  ("v_Vuna_dCompiler_dDriver_dCompile_densureDirPathFuel", ("Vuna.Compiler.Driver.Compile.ensureDirPathFuel", "Vuna/Compiler/Driver/Compile.vuna:134"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dentrySource", ("Vuna.Compiler.Driver.Compile.entrySource", "Vuna/Compiler/Driver/Compile.vuna:466"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dexportedDepModsOf", ("Vuna.Compiler.Driver.Compile.exportedDepModsOf", "Vuna/Compiler/Driver/Compile.vuna:1188"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dexportedOwnOf", ("Vuna.Compiler.Driver.Compile.exportedOwnOf", "Vuna/Compiler/Driver/Compile.vuna:2051"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dfindClosureMod", ("Vuna.Compiler.Driver.Compile.findClosureMod", "Vuna/Compiler/Driver/Compile.vuna:799"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dfindPkgEntry", ("Vuna.Compiler.Driver.Compile.findPkgEntry", "Vuna/Compiler/Driver/Compile.vuna:795"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidGo", ("Vuna.Compiler.Driver.Compile.firstInvalidGo", "Vuna/Compiler/Driver/Compile.vuna:2430"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dfirstInvalidModule", ("Vuna.Compiler.Driver.Compile.firstInvalidModule", "Vuna/Compiler/Driver/Compile.vuna:2424"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dfullCheckExe", ("Vuna.Compiler.Driver.Compile.fullCheckExe", "Vuna/Compiler/Driver/Compile.vuna:1841"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dfullCheckLib", ("Vuna.Compiler.Driver.Compile.fullCheckLib", "Vuna/Compiler/Driver/Compile.vuna:2222"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dgoPkgs", ("Vuna.Compiler.Driver.Compile.goPkgs", "Vuna/Compiler/Driver/Compile.vuna:1168"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dhasAbsoluteLabels", ("Vuna.Compiler.Driver.Compile.hasAbsoluteLabels", "Vuna/Compiler/Driver/Compile.vuna:1635"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dhashText", ("Vuna.Compiler.Driver.Compile.hashText", "Vuna/Compiler/Driver/Compile.vuna:643"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dheaderAddrOfMod", ("Vuna.Compiler.Driver.Compile.headerAddrOfMod", "Vuna/Compiler/Driver/Compile.vuna:818"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceAddrIn", ("Vuna.Compiler.Driver.Compile.ifaceAddrIn", "Vuna/Compiler/Driver/Compile.vuna:879"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceAuditRequested", ("Vuna.Compiler.Driver.Compile.ifaceAuditRequested", "Vuna/Compiler/Driver/Compile.vuna:1869"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceCompilerTag", ("Vuna.Compiler.Driver.Compile.ifaceCompilerTag", "Vuna/Compiler/Driver/Compile.vuna:1997"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceHashOfName", ("Vuna.Compiler.Driver.Compile.ifaceHashOfName", "Vuna/Compiler/Driver/Compile.vuna:2152"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceModsEff", ("Vuna.Compiler.Driver.Compile.ifaceModsEff", "Vuna/Compiler/Driver/Compile.vuna:918"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceModsWithEff", ("Vuna.Compiler.Driver.Compile.ifaceModsWithEff", "Vuna/Compiler/Driver/Compile.vuna:923"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceObjectCodec", ("Vuna.Compiler.Driver.Compile.ifaceObjectCodec", "Vuna/Compiler/Driver/Compile.vuna:754"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceSchemaTag", ("Vuna.Compiler.Driver.Compile.ifaceSchemaTag", "Vuna/Compiler/Driver/Compile.vuna:1994"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difaceSelfTestRequested", ("Vuna.Compiler.Driver.Compile.ifaceSelfTestRequested", "Vuna/Compiler/Driver/Compile.vuna:2147"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difacesForContextEff", ("Vuna.Compiler.Driver.Compile.ifacesForContextEff", "Vuna/Compiler/Driver/Compile.vuna:1014"));
  ("v_Vuna_dCompiler_dDriver_dCompile_difacesForRootsEff", ("Vuna.Compiler.Driver.Compile.ifacesForRootsEff", "Vuna/Compiler/Driver/Compile.vuna:1020"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dimportClosureGo", ("Vuna.Compiler.Driver.Compile.importClosureGo", "Vuna/Compiler/Driver/Compile.vuna:1325"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dimportClosureOf", ("Vuna.Compiler.Driver.Compile.importClosureOf", "Vuna/Compiler/Driver/Compile.vuna:1335"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dimportNameStr", ("Vuna.Compiler.Driver.Compile.importNameStr", "Vuna/Compiler/Driver/Compile.vuna:1295"));
  ("v_Vuna_dCompiler_dDriver_dCompile_disDepModOf", ("Vuna.Compiler.Driver.Compile.isDepModOf", "Vuna/Compiler/Driver/Compile.vuna:857"));
  ("v_Vuna_dCompiler_dDriver_dCompile_disNeededMod", ("Vuna.Compiler.Driver.Compile.isNeededMod", "Vuna/Compiler/Driver/Compile.vuna:1338"));
  ("v_Vuna_dCompiler_dDriver_dCompile_disSelfModOf", ("Vuna.Compiler.Driver.Compile.isSelfModOf", "Vuna/Compiler/Driver/Compile.vuna:860"));
  ("v_Vuna_dCompiler_dDriver_dCompile_disStableDiag", ("Vuna.Compiler.Driver.Compile.isStableDiag", "Vuna/Compiler/Driver/Compile.vuna:1647"));
  ("v_Vuna_dCompiler_dDriver_dCompile_djoinJsonList", ("Vuna.Compiler.Driver.Compile.joinJsonList", "Vuna/Compiler/Driver/Compile.vuna:580"));
  ("v_Vuna_dCompiler_dDriver_dCompile_djoinLines", ("Vuna.Compiler.Driver.Compile.joinLines", "Vuna/Compiler/Driver/Compile.vuna:1888"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dlastSegment", ("Vuna.Compiler.Driver.Compile.lastSegment", "Vuna/Compiler/Driver/Compile.vuna:591"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dlastSegmentRev", ("Vuna.Compiler.Driver.Compile.lastSegmentRev", "Vuna/Compiler/Driver/Compile.vuna:587"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dlayoutDigestOf", ("Vuna.Compiler.Driver.Compile.layoutDigestOf", "Vuna/Compiler/Driver/Compile.vuna:2341"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dloadHeaderEff", ("Vuna.Compiler.Driver.Compile.loadHeaderEff", "Vuna/Compiler/Driver/Compile.vuna:825"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmanifestSemanticText", ("Vuna.Compiler.Driver.Compile.manifestSemanticText", "Vuna/Compiler/Driver/Compile.vuna:667"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmapEff", ("Vuna.Compiler.Driver.Compile.mapEff", "Vuna/Compiler/Driver/Compile.vuna:58"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmapMaybeEff", ("Vuna.Compiler.Driver.Compile.mapMaybeEff", "Vuna/Compiler/Driver/Compile.vuna:72"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmaybeSemanticText", ("Vuna.Compiler.Driver.Compile.maybeSemanticText", "Vuna/Compiler/Driver/Compile.vuna:654"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmetaFileName", ("Vuna.Compiler.Driver.Compile.metaFileName", "Vuna/Compiler/Driver/Compile.vuna:382"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmetaPairText", ("Vuna.Compiler.Driver.Compile.metaPairText", "Vuna/Compiler/Driver/Compile.vuna:577"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmetaPathOf", ("Vuna.Compiler.Driver.Compile.metaPathOf", "Vuna/Compiler/Driver/Compile.vuna:606"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmetaSchema", ("Vuna.Compiler.Driver.Compile.metaSchema", "Vuna/Compiler/Driver/Compile.vuna:379"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmetaUpToDate", ("Vuna.Compiler.Driver.Compile.metaUpToDate", "Vuna/Compiler/Driver/Compile.vuna:616"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmissingNamesOf", ("Vuna.Compiler.Driver.Compile.missingNamesOf", "Vuna/Compiler/Driver/Compile.vuna:2124"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmodGraphEntry", ("Vuna.Compiler.Driver.Compile.modGraphEntry", "Vuna/Compiler/Driver/Compile.vuna:851"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmodHashPair", ("Vuna.Compiler.Driver.Compile.modHashPair", "Vuna/Compiler/Driver/Compile.vuna:1478"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmodKeyOf", ("Vuna.Compiler.Driver.Compile.modKeyOf", "Vuna/Compiler/Driver/Compile.vuna:965"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmodNameOf", ("Vuna.Compiler.Driver.Compile.modNameOf", "Vuna/Compiler/Driver/Compile.vuna:854"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmodsCodec", ("Vuna.Compiler.Driver.Compile.modsCodec", "Vuna/Compiler/Driver/Compile.vuna:962"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmodsKeyOf", ("Vuna.Compiler.Driver.Compile.modsKeyOf", "Vuna/Compiler/Driver/Compile.vuna:968"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmodsKind", ("Vuna.Compiler.Driver.Compile.modsKind", "Vuna/Compiler/Driver/Compile.vuna:959"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmoduleDepsOk", ("Vuna.Compiler.Driver.Compile.moduleDepsOk", "Vuna/Compiler/Driver/Compile.vuna:1976"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmoduleGraphOf", ("Vuna.Compiler.Driver.Compile.moduleGraphOf", "Vuna/Compiler/Driver/Compile.vuna:863"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmoduleNameOfPath", ("Vuna.Compiler.Driver.Compile.moduleNameOfPath", "Vuna/Compiler/Driver/Compile.vuna:441"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmtimeFastPath", ("Vuna.Compiler.Driver.Compile.mtimeFastPath", "Vuna/Compiler/Driver/Compile.vuna:1282"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dmtimeSafetyWindowSec", ("Vuna.Compiler.Driver.Compile.mtimeSafetyWindowSec", "Vuna/Compiler/Driver/Compile.vuna:1256"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dnameExportedBy", ("Vuna.Compiler.Driver.Compile.nameExportedBy", "Vuna/Compiler/Driver/Compile.vuna:2042"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dorderCodec", ("Vuna.Compiler.Driver.Compile.orderCodec", "Vuna/Compiler/Driver/Compile.vuna:1102"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dorderCoversEff", ("Vuna.Compiler.Driver.Compile.orderCoversEff", "Vuna/Compiler/Driver/Compile.vuna:1146"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dorderKeyOfEff", ("Vuna.Compiler.Driver.Compile.orderKeyOfEff", "Vuna/Compiler/Driver/Compile.vuna:1119"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dorderKind", ("Vuna.Compiler.Driver.Compile.orderKind", "Vuna/Compiler/Driver/Compile.vuna:1099"));
  ("v_Vuna_dCompiler_dDriver_dCompile_downCleanInfo", ("Vuna.Compiler.Driver.Compile.ownCleanInfo", "Vuna/Compiler/Driver/Compile.vuna:1938"));
  ("v_Vuna_dCompiler_dDriver_dCompile_downCleanModules", ("Vuna.Compiler.Driver.Compile.ownCleanModules", "Vuna/Compiler/Driver/Compile.vuna:1952"));
  ("v_Vuna_dCompiler_dDriver_dCompile_downCleanWanted", ("Vuna.Compiler.Driver.Compile.ownCleanWanted", "Vuna/Compiler/Driver/Compile.vuna:1504"));
  ("v_Vuna_dCompiler_dDriver_dCompile_downRootsOf", ("Vuna.Compiler.Driver.Compile.ownRootsOf", "Vuna/Compiler/Driver/Compile.vuna:472"));
  ("v_Vuna_dCompiler_dDriver_dCompile_downSourceInfos", ("Vuna.Compiler.Driver.Compile.ownSourceInfos", "Vuna/Compiler/Driver/Compile.vuna:2003"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpackageEnvHash", ("Vuna.Compiler.Driver.Compile.packageEnvHash", "Vuna/Compiler/Driver/Compile.vuna:1912"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpairText", ("Vuna.Compiler.Driver.Compile.pairText", "Vuna/Compiler/Driver/Compile.vuna:562"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpayloadSelfOk", ("Vuna.Compiler.Driver.Compile.payloadSelfOk", "Vuna/Compiler/Driver/Compile.vuna:1971"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpickByOrder", ("Vuna.Compiler.Driver.Compile.pickByOrder", "Vuna/Compiler/Driver/Compile.vuna:1154"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpickDepMods", ("Vuna.Compiler.Driver.Compile.pickDepMods", "Vuna/Compiler/Driver/Compile.vuna:1208"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpkgEq", ("Vuna.Compiler.Driver.Compile.pkgEq", "Vuna/Compiler/Driver/Compile.vuna:1160"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryCodec", ("Vuna.Compiler.Driver.Compile.pkgIfaceSummaryCodec", "Vuna/Compiler/Driver/Compile.vuna:524"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKeyOf", ("Vuna.Compiler.Driver.Compile.pkgIfaceSummaryKeyOf", "Vuna/Compiler/Driver/Compile.vuna:527"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpkgIfaceSummaryKind", ("Vuna.Compiler.Driver.Compile.pkgIfaceSummaryKind", "Vuna/Compiler/Driver/Compile.vuna:521"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpkgKeyOf", ("Vuna.Compiler.Driver.Compile.pkgKeyOf", "Vuna/Compiler/Driver/Compile.vuna:778"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpkgTableEff", ("Vuna.Compiler.Driver.Compile.pkgTableEff", "Vuna/Compiler/Driver/Compile.vuna:781"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dpmModulesOfIface", ("Vuna.Compiler.Driver.Compile.pmModulesOfIface", "Vuna/Compiler/Driver/Compile.vuna:2427"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dprepareForStore", ("Vuna.Compiler.Driver.Compile.prepareForStore", "Vuna/Compiler/Driver/Compile.vuna:1656"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dprojectIdOf", ("Vuna.Compiler.Driver.Compile.projectIdOf", "Vuna/Compiler/Driver/Compile.vuna:1698"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceAtEff", ("Vuna.Compiler.Driver.Compile.readIfaceAtEff", "Vuna/Compiler/Driver/Compile.vuna:1027"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListEff", ("Vuna.Compiler.Driver.Compile.readIfaceListEff", "Vuna/Compiler/Driver/Compile.vuna:1051"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dreadIfaceListPartialEff", ("Vuna.Compiler.Driver.Compile.readIfaceListPartialEff", "Vuna/Compiler/Driver/Compile.vuna:1041"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dreadOneModIface", ("Vuna.Compiler.Driver.Compile.readOneModIface", "Vuna/Compiler/Driver/Compile.vuna:1933"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dreadOrderEff", ("Vuna.Compiler.Driver.Compile.readOrderEff", "Vuna/Compiler/Driver/Compile.vuna:1134"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dreadSplitBlob", ("Vuna.Compiler.Driver.Compile.readSplitBlob", "Vuna/Compiler/Driver/Compile.vuna:2411"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dreadSplitPointer", ("Vuna.Compiler.Driver.Compile.readSplitPointer", "Vuna/Compiler/Driver/Compile.vuna:2324"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drebuildSplit", ("Vuna.Compiler.Driver.Compile.rebuildSplit", "Vuna/Compiler/Driver/Compile.vuna:212"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dreleaseFlagOf", ("Vuna.Compiler.Driver.Compile.releaseFlagOf", "Vuna/Compiler/Driver/Compile.vuna:679"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dreplayFailure", ("Vuna.Compiler.Driver.Compile.replayFailure", "Vuna/Compiler/Driver/Compile.vuna:1666"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredDiag", ("Vuna.Compiler.Driver.Compile.resolveStoredDiag", "Vuna/Compiler/Driver/Compile.vuna:1663"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dresolveStoredPath", ("Vuna.Compiler.Driver.Compile.resolveStoredPath", "Vuna/Compiler/Driver/Compile.vuna:1623"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dresyncCleanSources", ("Vuna.Compiler.Driver.Compile.resyncCleanSources", "Vuna/Compiler/Driver/Compile.vuna:2020"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drootEnvHashOf", ("Vuna.Compiler.Driver.Compile.rootEnvHashOf", "Vuna/Compiler/Driver/Compile.vuna:999"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drootExportsOf", ("Vuna.Compiler.Driver.Compile.rootExportsOf", "Vuna/Compiler/Driver/Compile.vuna:1197"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drootHash", ("Vuna.Compiler.Driver.Compile.rootHash", "Vuna/Compiler/Driver/Compile.vuna:456"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drootKeepEff", ("Vuna.Compiler.Driver.Compile.rootKeepEff", "Vuna/Compiler/Driver/Compile.vuna:1706"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drootOfName", ("Vuna.Compiler.Driver.Compile.rootOfName", "Vuna/Compiler/Driver/Compile.vuna:1113"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drootPkgTableEff", ("Vuna.Compiler.Driver.Compile.rootPkgTableEff", "Vuna/Compiler/Driver/Compile.vuna:1007"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drootSources", ("Vuna.Compiler.Driver.Compile.rootSources", "Vuna/Compiler/Driver/Compile.vuna:448"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drunAndStore", ("Vuna.Compiler.Driver.Compile.runAndStore", "Vuna/Compiler/Driver/Compile.vuna:1746"));
  ("v_Vuna_dCompiler_dDriver_dCompile_drunBuildScript", ("Vuna.Compiler.Driver.Compile.runBuildScript", "Vuna/Compiler/Driver/Compile.vuna:631"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsameIfaceHashes", ("Vuna.Compiler.Driver.Compile.sameIfaceHashes", "Vuna/Compiler/Driver/Compile.vuna:2161"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsameNameSet", ("Vuna.Compiler.Driver.Compile.sameNameSet", "Vuna/Compiler/Driver/Compile.vuna:723"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dselfModsOf", ("Vuna.Compiler.Driver.Compile.selfModsOf", "Vuna/Compiler/Driver/Compile.vuna:1074"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dshadowAllowed", ("Vuna.Compiler.Driver.Compile.shadowAllowed", "Vuna/Compiler/Driver/Compile.vuna:2036"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dskipMetaDir", ("Vuna.Compiler.Driver.Compile.skipMetaDir", "Vuna/Compiler/Driver/Compile.vuna:402"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dslashToDot", ("Vuna.Compiler.Driver.Compile.slashToDot", "Vuna/Compiler/Driver/Compile.vuna:438"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dslashesToDots", ("Vuna.Compiler.Driver.Compile.slashesToDots", "Vuna/Compiler/Driver/Compile.vuna:435"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsortNames", ("Vuna.Compiler.Driver.Compile.sortNames", "Vuna/Compiler/Driver/Compile.vuna:896"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsourceFresh", ("Vuna.Compiler.Driver.Compile.sourceFresh", "Vuna/Compiler/Driver/Compile.vuna:1420"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoForPath", ("Vuna.Compiler.Driver.Compile.sourceInfoForPath", "Vuna/Compiler/Driver/Compile.vuna:1405"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsourceInfoUnchanged", ("Vuna.Compiler.Driver.Compile.sourceInfoUnchanged", "Vuna/Compiler/Driver/Compile.vuna:1259"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsourcePathMapOfRoots", ("Vuna.Compiler.Driver.Compile.sourcePathMapOfRoots", "Vuna/Compiler/Driver/Compile.vuna:1236"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobPath", ("Vuna.Compiler.Driver.Compile.splitBlobPath", "Vuna/Compiler/Driver/Compile.vuna:2286"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitBlobTag", ("Vuna.Compiler.Driver.Compile.splitBlobTag", "Vuna/Compiler/Driver/Compile.vuna:2259"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitCacheCodec", ("Vuna.Compiler.Driver.Compile.splitCacheCodec", "Vuna/Compiler/Driver/Compile.vuna:2255"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitIdentityOf", ("Vuna.Compiler.Driver.Compile.splitIdentityOf", "Vuna/Compiler/Driver/Compile.vuna:2346"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitInOf", ("Vuna.Compiler.Driver.Compile.splitInOf", "Vuna/Compiler/Driver/Compile.vuna:2307"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitModsOf", ("Vuna.Compiler.Driver.Compile.splitModsOf", "Vuna/Compiler/Driver/Compile.vuna:2265"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitNodeSchema", ("Vuna.Compiler.Driver.Compile.splitNodeSchema", "Vuna/Compiler/Driver/Compile.vuna:2249"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrCodec", ("Vuna.Compiler.Driver.Compile.splitPtrCodec", "Vuna/Compiler/Driver/Compile.vuna:2321"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitPtrKind", ("Vuna.Compiler.Driver.Compile.splitPtrKind", "Vuna/Compiler/Driver/Compile.vuna:2318"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsplitSignatureOf", ("Vuna.Compiler.Driver.Compile.splitSignatureOf", "Vuna/Compiler/Driver/Compile.vuna:1884"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dstatOfClosureMod", ("Vuna.Compiler.Driver.Compile.statOfClosureMod", "Vuna/Compiler/Driver/Compile.vuna:1481"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dstoreCheckPayload", ("Vuna.Compiler.Driver.Compile.storeCheckPayload", "Vuna/Compiler/Driver/Compile.vuna:1671"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckExeParts", ("Vuna.Compiler.Driver.Compile.summaryCheckExeParts", "Vuna/Compiler/Driver/Compile.vuna:1813"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsummaryCheckLibParts", ("Vuna.Compiler.Driver.Compile.summaryCheckLibParts", "Vuna/Compiler/Driver/Compile.vuna:2196"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dsummarySplitParts", ("Vuna.Compiler.Driver.Compile.summarySplitParts", "Vuna/Compiler/Driver/Compile.vuna:166"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtextHash", ("Vuna.Compiler.Driver.Compile.textHash", "Vuna/Compiler/Driver/Compile.vuna:386"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanGo", ("Vuna.Compiler.Driver.Compile.toolCleanGo", "Vuna/Compiler/Driver/Compile.vuna:1515"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolCleanOwnModules", ("Vuna.Compiler.Driver.Compile.toolCleanOwnModules", "Vuna/Compiler/Driver/Compile.vuna:1490"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolCompilerFingerprint", ("Vuna.Compiler.Driver.Compile.toolCompilerFingerprint", "Vuna/Compiler/Driver/Compile.vuna:1600"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolDepModsOf", ("Vuna.Compiler.Driver.Compile.toolDepModsOf", "Vuna/Compiler/Driver/Compile.vuna:1342"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolEnabled", ("Vuna.Compiler.Driver.Compile.toolEnabled", "Vuna/Compiler/Driver/Compile.vuna:1320"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolImportNamesOf", ("Vuna.Compiler.Driver.Compile.toolImportNamesOf", "Vuna/Compiler/Driver/Compile.vuna:1307"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolImportsOfSource", ("Vuna.Compiler.Driver.Compile.toolImportsOfSource", "Vuna/Compiler/Driver/Compile.vuna:1298"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolNeededOfImports", ("Vuna.Compiler.Driver.Compile.toolNeededOfImports", "Vuna/Compiler/Driver/Compile.vuna:1442"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolNowSec", ("Vuna.Compiler.Driver.Compile.toolNowSec", "Vuna/Compiler/Driver/Compile.vuna:1412"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolSessionFresh", ("Vuna.Compiler.Driver.Compile.toolSessionFresh", "Vuna/Compiler/Driver/Compile.vuna:1435"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolTextHash", ("Vuna.Compiler.Driver.Compile.toolTextHash", "Vuna/Compiler/Driver/Compile.vuna:1402"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolWriteModuleIface", ("Vuna.Compiler.Driver.Compile.toolWriteModuleIface", "Vuna/Compiler/Driver/Compile.vuna:1561"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolWriteModuleIfaceCold", ("Vuna.Compiler.Driver.Compile.toolWriteModuleIfaceCold", "Vuna/Compiler/Driver/Compile.vuna:1585"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dtoolchainIdEff", ("Vuna.Compiler.Driver.Compile.toolchainIdEff", "Vuna/Compiler/Driver/Compile.vuna:2359"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwalkVunaMeta", ("Vuna.Compiler.Driver.Compile.walkVunaMeta", "Vuna/Compiler/Driver/Compile.vuna:415"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwithAddr", ("Vuna.Compiler.Driver.Compile.withAddr", "Vuna/Compiler/Driver/Compile.vuna:889"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwithPrelude", ("Vuna.Compiler.Driver.Compile.withPrelude", "Vuna/Compiler/Driver/Compile.vuna:846"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteBuildMeta", ("Vuna.Compiler.Driver.Compile.writeBuildMeta", "Vuna/Compiler/Driver/Compile.vuna:609"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteCompiledNormalized", ("Vuna.Compiler.Driver.Compile.writeCompiledNormalized", "Vuna/Compiler/Driver/Compile.vuna:312"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteFileIfChanged", ("Vuna.Compiler.Driver.Compile.writeFileIfChanged", "Vuna/Compiler/Driver/Compile.vuna:300"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceObjects", ("Vuna.Compiler.Driver.Compile.writeIfaceObjects", "Vuna/Compiler/Driver/Compile.vuna:2133"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteIfaceShadow", ("Vuna.Compiler.Driver.Compile.writeIfaceShadow", "Vuna/Compiler/Driver/Compile.vuna:2058"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteModuleIfaceGuarded", ("Vuna.Compiler.Driver.Compile.writeModuleIfaceGuarded", "Vuna/Compiler/Driver/Compile.vuna:1575"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteOrderEff", ("Vuna.Compiler.Driver.Compile.writeOrderEff", "Vuna/Compiler/Driver/Compile.vuna:1126"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwritePkgIfaceSummaryEff", ("Vuna.Compiler.Driver.Compile.writePkgIfaceSummaryEff", "Vuna/Compiler/Driver/Compile.vuna:566"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlob", ("Vuna.Compiler.Driver.Compile.writeSplitBlob", "Vuna/Compiler/Driver/Compile.vuna:2391"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitBlobAt", ("Vuna.Compiler.Driver.Compile.writeSplitBlobAt", "Vuna/Compiler/Driver/Compile.vuna:2293"));
  ("v_Vuna_dCompiler_dDriver_dCompile_dwriteSplitPointer", ("Vuna.Compiler.Driver.Compile.writeSplitPointer", "Vuna/Compiler/Driver/Compile.vuna:2332"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_danyHelp", ("Vuna.Compiler.Driver.CompilerCli.anyHelp", "Vuna/Compiler/Driver/CompilerCli.vuna:453"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyDiagConfig", ("Vuna.Compiler.Driver.CompilerCli.applyDiagConfig", "Vuna/Compiler/Driver/CompilerCli.vuna:141"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dapplyManifestOpts", ("Vuna.Compiler.Driver.CompilerCli.applyManifestOpts", "Vuna/Compiler/Driver/CompilerCli.vuna:144"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildArgs", ("Vuna.Compiler.Driver.CompilerCli.buildArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:913"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildDefaultView", ("Vuna.Compiler.Driver.CompilerCli.buildDefaultView", "Vuna/Compiler/Driver/CompilerCli.vuna:1103"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildExplicit", ("Vuna.Compiler.Driver.CompilerCli.buildExplicit", "Vuna/Compiler/Driver/CompilerCli.vuna:1084"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildLinked", ("Vuna.Compiler.Driver.CompilerCli.buildLinked", "Vuna/Compiler/Driver/CompilerCli.vuna:1187"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildNativeOne", ("Vuna.Compiler.Driver.CompilerCli.buildNativeOne", "Vuna/Compiler/Driver/CompilerCli.vuna:988"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildOne", ("Vuna.Compiler.Driver.CompilerCli.buildOne", "Vuna/Compiler/Driver/CompilerCli.vuna:1055"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildParse", ("Vuna.Compiler.Driver.CompilerCli.buildParse", "Vuna/Compiler/Driver/CompilerCli.vuna:916"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildRun", ("Vuna.Compiler.Driver.CompilerCli.buildRun", "Vuna/Compiler/Driver/CompilerCli.vuna:941"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildTargets", ("Vuna.Compiler.Driver.CompilerCli.buildTargets", "Vuna/Compiler/Driver/CompilerCli.vuna:978"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dbuildWasmOne", ("Vuna.Compiler.Driver.CompilerCli.buildWasmOne", "Vuna/Compiler/Driver/CompilerCli.vuna:1024"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckArgs", ("Vuna.Compiler.Driver.CompilerCli.checkArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:701"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEmit", ("Vuna.Compiler.Driver.CompilerCli.checkEmit", "Vuna/Compiler/Driver/CompilerCli.vuna:710"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckEntryFile", ("Vuna.Compiler.Driver.CompilerCli.checkEntryFile", "Vuna/Compiler/Driver/CompilerCli.vuna:882"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckFileEntry", ("Vuna.Compiler.Driver.CompilerCli.checkFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:839"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckModuleFileEntry", ("Vuna.Compiler.Driver.CompilerCli.checkModuleFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:868"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageCode", ("Vuna.Compiler.Driver.CompilerCli.checkPackageCode", "Vuna/Compiler/Driver/CompilerCli.vuna:821"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageErr", ("Vuna.Compiler.Driver.CompilerCli.checkPackageErr", "Vuna/Compiler/Driver/CompilerCli.vuna:1275"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackageSeq", ("Vuna.Compiler.Driver.CompilerCli.checkPackageSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:810"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackages", ("Vuna.Compiler.Driver.CompilerCli.checkPackages", "Vuna/Compiler/Driver/CompilerCli.vuna:754"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPackagesSpawn", ("Vuna.Compiler.Driver.CompilerCli.checkPackagesSpawn", "Vuna/Compiler/Driver/CompilerCli.vuna:767"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgDir", ("Vuna.Compiler.Driver.CompilerCli.checkPkgDir", "Vuna/Compiler/Driver/CompilerCli.vuna:718"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckPkgsInProcess", ("Vuna.Compiler.Driver.CompilerCli.checkPkgsInProcess", "Vuna/Compiler/Driver/CompilerCli.vuna:787"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckRootsSeq", ("Vuna.Compiler.Driver.CompilerCli.checkRootsSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:801"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcheckSpawnArgs", ("Vuna.Compiler.Driver.CompilerCli.checkSpawnArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:732"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectLabelFiles", ("Vuna.Compiler.Driver.CompilerCli.collectLabelFiles", "Vuna/Compiler/Driver/CompilerCli.vuna:229"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcollectSarifIn", ("Vuna.Compiler.Driver.CompilerCli.collectSarifIn", "Vuna/Compiler/Driver/CompilerCli.vuna:538"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileArgs", ("Vuna.Compiler.Driver.CompilerCli.compileArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:613"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileCodegen", ("Vuna.Compiler.Driver.CompilerCli.compileCodegen", "Vuna/Compiler/Driver/CompilerCli.vuna:1178"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFileEntry", ("Vuna.Compiler.Driver.CompilerCli.compileFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:666"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileFinish", ("Vuna.Compiler.Driver.CompilerCli.compileFinish", "Vuna/Compiler/Driver/CompilerCli.vuna:635"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileParse", ("Vuna.Compiler.Driver.CompilerCli.compileParse", "Vuna/Compiler/Driver/CompilerCli.vuna:616"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilePkgDir", ("Vuna.Compiler.Driver.CompilerCli.compilePkgDir", "Vuna/Compiler/Driver/CompilerCli.vuna:681"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileRun", ("Vuna.Compiler.Driver.CompilerCli.compileRun", "Vuna/Compiler/Driver/CompilerCli.vuna:641"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompileToTarget", ("Vuna.Compiler.Driver.CompilerCli.compileToTarget", "Vuna/Compiler/Driver/CompilerCli.vuna:651"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsage", ("Vuna.Compiler.Driver.CompilerCli.compilerUsage", "Vuna/Compiler/Driver/CompilerCli.vuna:52"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcompilerUsageLines", ("Vuna.Compiler.Driver.CompilerCli.compilerUsageLines", "Vuna/Compiler/Driver/CompilerCli.vuna:40"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dcountFailures", ("Vuna.Compiler.Driver.CompilerCli.countFailures", "Vuna/Compiler/Driver/CompilerCli.vuna:835"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_ddashFlag", ("Vuna.Compiler.Driver.CompilerCli.dashFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:482"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultCliOpts", ("Vuna.Compiler.Driver.CompilerCli.defaultCliOpts", "Vuna/Compiler/Driver/CompilerCli.vuna:86"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_ddefaultDir", ("Vuna.Compiler.Driver.CompilerCli.defaultDir", "Vuna/Compiler/Driver/CompilerCli.vuna:577"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_ddiagExitFor", ("Vuna.Compiler.Driver.CompilerCli.diagExitFor", "Vuna/Compiler/Driver/CompilerCli.vuna:116"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_ddirOf", ("Vuna.Compiler.Driver.CompilerCli.dirOf", "Vuna/Compiler/Driver/CompilerCli.vuna:252"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_ddtPathErr", ("Vuna.Compiler.Driver.CompilerCli.dtPathErr", "Vuna/Compiler/Driver/CompilerCli.vuna:584"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiag", ("Vuna.Compiler.Driver.CompilerCli.emitDiag", "Vuna/Compiler/Driver/CompilerCli.vuna:521"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_demitDiagRevSeq", ("Vuna.Compiler.Driver.CompilerCli.emitDiagRevSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:543"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackage", ("Vuna.Compiler.Driver.CompilerCli.executablePackage", "Vuna/Compiler/Driver/CompilerCli.vuna:588"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dexecutablePackageAt", ("Vuna.Compiler.Driver.CompilerCli.executablePackageAt", "Vuna/Compiler/Driver/CompilerCli.vuna:597"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPackageByName", ("Vuna.Compiler.Driver.CompilerCli.findPackageByName", "Vuna/Compiler/Driver/CompilerCli.vuna:972"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dfindPkgRootGo", ("Vuna.Compiler.Driver.CompilerCli.findPkgRootGo", "Vuna/Compiler/Driver/CompilerCli.vuna:284"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarnings", ("Vuna.Compiler.Driver.CompilerCli.finishWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:1223"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dfinishWarningsDir", ("Vuna.Compiler.Driver.CompilerCli.finishWarningsDir", "Vuna/Compiler/Driver/CompilerCli.vuna:1234"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dflushSarif", ("Vuna.Compiler.Driver.CompilerCli.flushSarif", "Vuna/Compiler/Driver/CompilerCli.vuna:123"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhasDenyWarnings", ("Vuna.Compiler.Driver.CompilerCli.hasDenyWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:196"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFailFast", ("Vuna.Compiler.Driver.CompilerCli.hasFailFast", "Vuna/Compiler/Driver/CompilerCli.vuna:214"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhasFormatFlag", ("Vuna.Compiler.Driver.CompilerCli.hasFormatFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:347"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhasLangFlag", ("Vuna.Compiler.Driver.CompilerCli.hasLangFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:1262"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowCascade", ("Vuna.Compiler.Driver.CompilerCli.hasShowCascade", "Vuna/Compiler/Driver/CompilerCli.vuna:201"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhasShowWarnings", ("Vuna.Compiler.Driver.CompilerCli.hasShowWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:341"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhasWithSources", ("Vuna.Compiler.Driver.CompilerCli.hasWithSources", "Vuna/Compiler/Driver/CompilerCli.vuna:210"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dhelpFor", ("Vuna.Compiler.Driver.CompilerCli.helpFor", "Vuna/Compiler/Driver/CompilerCli.vuna:458"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_disCascadeDiag", ("Vuna.Compiler.Driver.CompilerCli.isCascadeDiag", "Vuna/Compiler/Driver/CompilerCli.vuna:324"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_disKnownTarget", ("Vuna.Compiler.Driver.CompilerCli.isKnownTarget", "Vuna/Compiler/Driver/CompilerCli.vuna:632"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_disMachineFormat", ("Vuna.Compiler.Driver.CompilerCli.isMachineFormat", "Vuna/Compiler/Driver/CompilerCli.vuna:751"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_disModuleFileEntry", ("Vuna.Compiler.Driver.CompilerCli.isModuleFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:854"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_disPackageEntryPath", ("Vuna.Compiler.Driver.CompilerCli.isPackageEntryPath", "Vuna/Compiler/Driver/CompilerCli.vuna:859"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_disSingleLibraryPackage", ("Vuna.Compiler.Driver.CompilerCli.isSingleLibraryPackage", "Vuna/Compiler/Driver/CompilerCli.vuna:955"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_disTextDiagFormat", ("Vuna.Compiler.Driver.CompilerCli.isTextDiagFormat", "Vuna/Compiler/Driver/CompilerCli.vuna:330"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_disWorkspaceRoot", ("Vuna.Compiler.Driver.CompilerCli.isWorkspaceRoot", "Vuna/Compiler/Driver/CompilerCli.vuna:793"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dlabelFiles", ("Vuna.Compiler.Driver.CompilerCli.labelFiles", "Vuna/Compiler/Driver/CompilerCli.vuna:233"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dlastSlashGo", ("Vuna.Compiler.Driver.CompilerCli.lastSlashGo", "Vuna/Compiler/Driver/CompilerCli.vuna:245"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dlastSlashIndexOf", ("Vuna.Compiler.Driver.CompilerCli.lastSlashIndexOf", "Vuna/Compiler/Driver/CompilerCli.vuna:249"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dlibraryOnlyMessage", ("Vuna.Compiler.Driver.CompilerCli.libraryOnlyMessage", "Vuna/Compiler/Driver/CompilerCli.vuna:961"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dlinkDefaultOutput", ("Vuna.Compiler.Driver.CompilerCli.linkDefaultOutput", "Vuna/Compiler/Driver/CompilerCli.vuna:1169"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dmapEff", ("Vuna.Compiler.Driver.CompilerCli.mapEff", "Vuna/Compiler/Driver/CompilerCli.vuna:56"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkFormatExplicit", ("Vuna.Compiler.Driver.CompilerCli.markFormatExplicit", "Vuna/Compiler/Driver/CompilerCli.vuna:104"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkRelease", ("Vuna.Compiler.Driver.CompilerCli.markRelease", "Vuna/Compiler/Driver/CompilerCli.vuna:92"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkTarget", ("Vuna.Compiler.Driver.CompilerCli.markTarget", "Vuna/Compiler/Driver/CompilerCli.vuna:96"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dmarkViewComplete", ("Vuna.Compiler.Driver.CompilerCli.markViewComplete", "Vuna/Compiler/Driver/CompilerCli.vuna:1163"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dmaxErrorsOf", ("Vuna.Compiler.Driver.CompilerCli.maxErrorsOf", "Vuna/Compiler/Driver/CompilerCli.vuna:176"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dmemStr", ("Vuna.Compiler.Driver.CompilerCli.memStr", "Vuna/Compiler/Driver/CompilerCli.vuna:240"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dmoduleOfRel", ("Vuna.Compiler.Driver.CompilerCli.moduleOfRel", "Vuna/Compiler/Driver/CompilerCli.vuna:273"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_downedByFile", ("Vuna.Compiler.Driver.CompilerCli.ownedByFile", "Vuna/Compiler/Driver/CompilerCli.vuna:1207"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_downedByPackage", ("Vuna.Compiler.Driver.CompilerCli.ownedByPackage", "Vuna/Compiler/Driver/CompilerCli.vuna:1211"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecover", ("Vuna.Compiler.Driver.CompilerCli.packageRecover", "Vuna/Compiler/Driver/CompilerCli.vuna:1282"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverExe", ("Vuna.Compiler.Driver.CompilerCli.packageRecoverExe", "Vuna/Compiler/Driver/CompilerCli.vuna:1288"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dpackageRecoverLib", ("Vuna.Compiler.Driver.CompilerCli.packageRecoverLib", "Vuna/Compiler/Driver/CompilerCli.vuna:1297"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntChars", ("Vuna.Compiler.Driver.CompilerCli.parseIntChars", "Vuna/Compiler/Driver/CompilerCli.vuna:410"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dparseIntOr", ("Vuna.Compiler.Driver.CompilerCli.parseIntOr", "Vuna/Compiler/Driver/CompilerCli.vuna:406"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiag", ("Vuna.Compiler.Driver.CompilerCli.printDiag", "Vuna/Compiler/Driver/CompilerCli.vuna:561"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagList", ("Vuna.Compiler.Driver.CompilerCli.printDiagList", "Vuna/Compiler/Driver/CompilerCli.vuna:569"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintDiagWithPrefix", ("Vuna.Compiler.Driver.CompilerCli.printDiagWithPrefix", "Vuna/Compiler/Driver/CompilerCli.vuna:550"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErr", ("Vuna.Compiler.Driver.CompilerCli.printErr", "Vuna/Compiler/Driver/CompilerCli.vuna:565"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintErrText", ("Vuna.Compiler.Driver.CompilerCli.printErrText", "Vuna/Compiler/Driver/CompilerCli.vuna:507"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintRecovered", ("Vuna.Compiler.Driver.CompilerCli.printRecovered", "Vuna/Compiler/Driver/CompilerCli.vuna:1308"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dprintVersion", ("Vuna.Compiler.Driver.CompilerCli.printVersion", "Vuna/Compiler/Driver/CompilerCli.vuna:447"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedCommand", ("Vuna.Compiler.Driver.CompilerCli.removedCommand", "Vuna/Compiler/Driver/CompilerCli.vuna:475"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlag", ("Vuna.Compiler.Driver.CompilerCli.removedFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:497"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dremovedFlagHint", ("Vuna.Compiler.Driver.CompilerCli.removedFlagHint", "Vuna/Compiler/Driver/CompilerCli.vuna:485"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCli", ("Vuna.Compiler.Driver.CompilerCli.runCompilerCli", "Vuna/Compiler/Driver/CompilerCli.vuna:64"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor", ("Vuna.Compiler.Driver.CompilerCli.runCompilerCliFor", "Vuna/Compiler/Driver/CompilerCli.vuna:376"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_drunCompilerCliFor1", ("Vuna.Compiler.Driver.CompilerCli.runCompilerCliFor1", "Vuna/Compiler/Driver/CompilerCli.vuna:432"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dselectBuildTargets", ("Vuna.Compiler.Driver.CompilerCli.selectBuildTargets", "Vuna/Compiler/Driver/CompilerCli.vuna:966"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dseverityLabelOf", ("Vuna.Compiler.Driver.CompilerCli.severityLabelOf", "Vuna/Compiler/Driver/CompilerCli.vuna:513"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dsourcePairsEff", ("Vuna.Compiler.Driver.CompilerCli.sourcePairsEff", "Vuna/Compiler/Driver/CompilerCli.vuna:317"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dsourceRefEff", ("Vuna.Compiler.Driver.CompilerCli.sourceRefEff", "Vuna/Compiler/Driver/CompilerCli.vuna:302"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlash", ("Vuna.Compiler.Driver.CompilerCli.splitSlash", "Vuna/Compiler/Driver/CompilerCli.vuna:264"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dsplitSlashGo", ("Vuna.Compiler.Driver.CompilerCli.splitSlashGo", "Vuna/Compiler/Driver/CompilerCli.vuna:267"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstdoutIsTty", ("Vuna.Compiler.Driver.CompilerCli.stdoutIsTty", "Vuna/Compiler/Driver/CompilerCli.vuna:372"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueGo", ("Vuna.Compiler.Driver.CompilerCli.stripContinueGo", "Vuna/Compiler/Driver/CompilerCli.vuna:1270"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripContinueOnError", ("Vuna.Compiler.Driver.CompilerCli.stripContinueOnError", "Vuna/Compiler/Driver/CompilerCli.vuna:1267"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDenyWarnings", ("Vuna.Compiler.Driver.CompilerCli.stripDenyWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:189"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormat", ("Vuna.Compiler.Driver.CompilerCli.stripDiagFormat", "Vuna/Compiler/Driver/CompilerCli.vuna:354"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDiagFormatGo", ("Vuna.Compiler.Driver.CompilerCli.stripDiagFormatGo", "Vuna/Compiler/Driver/CompilerCli.vuna:358"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripDotSlash", ("Vuna.Compiler.Driver.CompilerCli.stripDotSlash", "Vuna/Compiler/Driver/CompilerCli.vuna:1202"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripFailFast", ("Vuna.Compiler.Driver.CompilerCli.stripFailFast", "Vuna/Compiler/Driver/CompilerCli.vuna:218"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLang", ("Vuna.Compiler.Driver.CompilerCli.stripLang", "Vuna/Compiler/Driver/CompilerCli.vuna:1248"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripLangGo", ("Vuna.Compiler.Driver.CompilerCli.stripLangGo", "Vuna/Compiler/Driver/CompilerCli.vuna:1252"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrors", ("Vuna.Compiler.Driver.CompilerCli.stripMaxErrors", "Vuna/Compiler/Driver/CompilerCli.vuna:417"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripMaxErrorsGo", ("Vuna.Compiler.Driver.CompilerCli.stripMaxErrorsGo", "Vuna/Compiler/Driver/CompilerCli.vuna:421"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripPathPrefix", ("Vuna.Compiler.Driver.CompilerCli.stripPathPrefix", "Vuna/Compiler/Driver/CompilerCli.vuna:258"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripShowCascade", ("Vuna.Compiler.Driver.CompilerCli.stripShowCascade", "Vuna/Compiler/Driver/CompilerCli.vuna:205"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dstripWithSources", ("Vuna.Compiler.Driver.CompilerCli.stripWithSources", "Vuna/Compiler/Driver/CompilerCli.vuna:223"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiags", ("Vuna.Compiler.Driver.CompilerCli.takeDiags", "Vuna/Compiler/Driver/CompilerCli.vuna:180"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dtakeDiagsGo", ("Vuna.Compiler.Driver.CompilerCli.takeDiagsGo", "Vuna/Compiler/Driver/CompilerCli.vuna:184"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dunknownCommand", ("Vuna.Compiler.Driver.CompilerCli.unknownCommand", "Vuna/Compiler/Driver/CompilerCli.vuna:470"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dusageErr", ("Vuna.Compiler.Driver.CompilerCli.usageErr", "Vuna/Compiler/Driver/CompilerCli.vuna:464"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dvisibleDiags", ("Vuna.Compiler.Driver.CompilerCli.visibleDiags", "Vuna/Compiler/Driver/CompilerCli.vuna:333"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dwaitView", ("Vuna.Compiler.Driver.CompilerCli.waitView", "Vuna/Compiler/Driver/CompilerCli.vuna:1151"));
  ("v_Vuna_dCompiler_dDriver_dCompilerCli_dwithOpts", ("Vuna.Compiler.Driver.CompilerCli.withOpts", "Vuna/Compiler/Driver/CompilerCli.vuna:111"));
  ("v_Vuna_dCompiler_dDriver_dDt_dallocMetas", ("Vuna.Compiler.Driver.Dt.allocMetas", "Vuna/Compiler/Driver/Dt.vuna:569"));
  ("v_Vuna_dCompiler_dDriver_dDt_dallocTelescopes", ("Vuna.Compiler.Driver.Dt.allocTelescopes", "Vuna/Compiler/Driver/Dt.vuna:556"));
  ("v_Vuna_dCompiler_dDriver_dDt_dapplyArity", ("Vuna.Compiler.Driver.Dt.applyArity", "Vuna/Compiler/Driver/Dt.vuna:713"));
  ("v_Vuna_dCompiler_dDriver_dDt_daritiesOf", ("Vuna.Compiler.Driver.Dt.aritiesOf", "Vuna/Compiler/Driver/Dt.vuna:542"));
  ("v_Vuna_dCompiler_dDriver_dDt_dauxKeyOne", ("Vuna.Compiler.Driver.Dt.auxKeyOne", "Vuna/Compiler/Driver/Dt.vuna:1135"));
  ("v_Vuna_dCompiler_dDriver_dDt_dbodyPairs", ("Vuna.Compiler.Driver.Dt.bodyPairs", "Vuna/Compiler/Driver/Dt.vuna:993"));
  ("v_Vuna_dCompiler_dDriver_dDt_dbuildGenMetas", ("Vuna.Compiler.Driver.Dt.buildGenMetas", "Vuna/Compiler/Driver/Dt.vuna:635"));
  ("v_Vuna_dCompiler_dDriver_dDt_dbuildPi", ("Vuna.Compiler.Driver.Dt.buildPi", "Vuna/Compiler/Driver/Dt.vuna:577"));
  ("v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOf", ("Vuna.Compiler.Driver.Dt.cachedNamesOf", "Vuna/Compiler/Driver/Dt.vuna:886"));
  ("v_Vuna_dCompiler_dDriver_dDt_dcachedNamesOne", ("Vuna.Compiler.Driver.Dt.cachedNamesOne", "Vuna/Compiler/Driver/Dt.vuna:889"));
  ("v_Vuna_dCompiler_dDriver_dDt_dcheckDeclsWithWarns", ("Vuna.Compiler.Driver.Dt.checkDeclsWithWarns", "Vuna/Compiler/Driver/Dt.vuna:133"));
  ("v_Vuna_dCompiler_dDriver_dDt_dcheckDtProgramOf", ("Vuna.Compiler.Driver.Dt.checkDtProgramOf", "Vuna/Compiler/Driver/Dt.vuna:1832"));
  ("v_Vuna_dCompiler_dDriver_dDt_dcleanStartNext", ("Vuna.Compiler.Driver.Dt.cleanStartNext", "Vuna/Compiler/Driver/Dt.vuna:964"));
  ("v_Vuna_dCompiler_dDriver_dDt_dclosureGo", ("Vuna.Compiler.Driver.Dt.closureGo", "Vuna/Compiler/Driver/Dt.vuna:1578"));
  ("v_Vuna_dCompiler_dDriver_dDt_dconcatKeys", ("Vuna.Compiler.Driver.Dt.concatKeys", "Vuna/Compiler/Driver/Dt.vuna:1455"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupClasses", ("Vuna.Compiler.Driver.Dt.dedupClasses", "Vuna/Compiler/Driver/Dt.vuna:1005"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupDatas", ("Vuna.Compiler.Driver.Dt.dedupDatas", "Vuna/Compiler/Driver/Dt.vuna:999"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupDefBodies", ("Vuna.Compiler.Driver.Dt.dedupDefBodies", "Vuna/Compiler/Driver/Dt.vuna:987"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupDefs", ("Vuna.Compiler.Driver.Dt.dedupDefs", "Vuna/Compiler/Driver/Dt.vuna:990"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupGlobals", ("Vuna.Compiler.Driver.Dt.dedupGlobals", "Vuna/Compiler/Driver/Dt.vuna:1008"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupInsts", ("Vuna.Compiler.Driver.Dt.dedupInsts", "Vuna/Compiler/Driver/Dt.vuna:1002"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupInts", ("Vuna.Compiler.Driver.Dt.dedupInts", "Vuna/Compiler/Driver/Dt.vuna:689"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLast", ("Vuna.Compiler.Driver.Dt.dedupKeepLast", "Vuna/Compiler/Driver/Dt.vuna:974"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupKeepLastGo", ("Vuna.Compiler.Driver.Dt.dedupKeepLastGo", "Vuna/Compiler/Driver/Dt.vuna:977"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupSortedGo", ("Vuna.Compiler.Driver.Dt.dedupSortedGo", "Vuna/Compiler/Driver/Dt.vuna:1044"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddedupSortedNames", ("Vuna.Compiler.Driver.Dt.dedupSortedNames", "Vuna/Compiler/Driver/Dt.vuna:1041"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddefTableOf", ("Vuna.Compiler.Driver.Dt.defTableOf", "Vuna/Compiler/Driver/Dt.vuna:870"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddepStartOf", ("Vuna.Compiler.Driver.Dt.depStartOf", "Vuna/Compiler/Driver/Dt.vuna:945"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddepStartOfAt", ("Vuna.Compiler.Driver.Dt.depStartOfAt", "Vuna/Compiler/Driver/Dt.vuna:922"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtAuxForTermination", ("Vuna.Compiler.Driver.Dt.dtAuxForTermination", "Vuna/Compiler/Driver/Dt.vuna:1105"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtAuxKey", ("Vuna.Compiler.Driver.Dt.dtAuxKey", "Vuna/Compiler/Driver/Dt.vuna:1138"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtAuxOfCache", ("Vuna.Compiler.Driver.Dt.dtAuxOfCache", "Vuna/Compiler/Driver/Dt.vuna:1143"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtBindingTypes", ("Vuna.Compiler.Driver.Dt.dtBindingTypes", "Vuna/Compiler/Driver/Dt.vuna:605"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheck", ("Vuna.Compiler.Driver.Dt.dtCheck", "Vuna/Compiler/Driver/Dt.vuna:231"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckDecls", ("Vuna.Compiler.Driver.Dt.dtCheckDecls", "Vuna/Compiler/Driver/Dt.vuna:125"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageIncrementalParts", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryPackageIncrementalParts", "Vuna/Compiler/Driver/Dt.vuna:1659"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryPackageWithIfacesParts", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryPackageWithIfacesParts", "Vuna/Compiler/Driver/Dt.vuna:1669"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryRecovering", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryRecovering", "Vuna/Compiler/Driver/Dt.vuna:1822"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckLibraryWithProgramParts", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryWithProgramParts", "Vuna/Compiler/Driver/Dt.vuna:159"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckModuleFile", ("Vuna.Compiler.Driver.Dt.dtCheckModuleFile", "Vuna/Compiler/Driver/Dt.vuna:260"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckOursParts", ("Vuna.Compiler.Driver.Dt.dtCheckOursParts", "Vuna/Compiler/Driver/Dt.vuna:894"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageIncrementalParts", ("Vuna.Compiler.Driver.Dt.dtCheckPackageIncrementalParts", "Vuna/Compiler/Driver/Dt.vuna:1392"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckPackageWithIfacesParts", ("Vuna.Compiler.Driver.Dt.dtCheckPackageWithIfacesParts", "Vuna/Compiler/Driver/Dt.vuna:1634"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckPartsWithProgram", ("Vuna.Compiler.Driver.Dt.dtCheckPartsWithProgram", "Vuna/Compiler/Driver/Dt.vuna:163"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckRecovering", ("Vuna.Compiler.Driver.Dt.dtCheckRecovering", "Vuna/Compiler/Driver/Dt.vuna:1813"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckScoped", ("Vuna.Compiler.Driver.Dt.dtCheckScoped", "Vuna/Compiler/Driver/Dt.vuna:1298"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckSource", ("Vuna.Compiler.Driver.Dt.dtCheckSource", "Vuna/Compiler/Driver/Dt.vuna:327"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceChecked", ("Vuna.Compiler.Driver.Dt.dtCheckSourceChecked", "Vuna/Compiler/Driver/Dt.vuna:1382"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceIncremental", ("Vuna.Compiler.Driver.Dt.dtCheckSourceIncremental", "Vuna/Compiler/Driver/Dt.vuna:1312"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckSourceWithIfaces", ("Vuna.Compiler.Driver.Dt.dtCheckSourceWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:350"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtCheckWithProgramParts", ("Vuna.Compiler.Driver.Dt.dtCheckWithProgramParts", "Vuna/Compiler/Driver/Dt.vuna:155"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtDefGlobalNames", ("Vuna.Compiler.Driver.Dt.dtDefGlobalNames", "Vuna/Compiler/Driver/Dt.vuna:1778"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtElabFullWithPrepared", ("Vuna.Compiler.Driver.Dt.dtElabFullWithPrepared", "Vuna/Compiler/Driver/Dt.vuna:1116"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalExpr", ("Vuna.Compiler.Driver.Dt.dtEvalExpr", "Vuna/Compiler/Driver/Dt.vuna:306"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfo", ("Vuna.Compiler.Driver.Dt.dtEvalExprInfo", "Vuna/Compiler/Driver/Dt.vuna:317"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfoWithAuxCache", ("Vuna.Compiler.Driver.Dt.dtEvalExprInfoWithAuxCache", "Vuna/Compiler/Driver/Dt.vuna:463"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprInfoWithIfaces", ("Vuna.Compiler.Driver.Dt.dtEvalExprInfoWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:483"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprWithAuxCache", ("Vuna.Compiler.Driver.Dt.dtEvalExprWithAuxCache", "Vuna/Compiler/Driver/Dt.vuna:473"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalExprWithIfaces", ("Vuna.Compiler.Driver.Dt.dtEvalExprWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:491"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalFile", ("Vuna.Compiler.Driver.Dt.dtEvalFile", "Vuna/Compiler/Driver/Dt.vuna:270"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtEvalSourceIncremental", ("Vuna.Compiler.Driver.Dt.dtEvalSourceIncremental", "Vuna/Compiler/Driver/Dt.vuna:1367"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtFileHasModuleHeader", ("Vuna.Compiler.Driver.Dt.dtFileHasModuleHeader", "Vuna/Compiler/Driver/Dt.vuna:250"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtFinishPackage", ("Vuna.Compiler.Driver.Dt.dtFinishPackage", "Vuna/Compiler/Driver/Dt.vuna:1238"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtFinishPackageScoped", ("Vuna.Compiler.Driver.Dt.dtFinishPackageScoped", "Vuna/Compiler/Driver/Dt.vuna:1261"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtFinishScoped", ("Vuna.Compiler.Driver.Dt.dtFinishScoped", "Vuna/Compiler/Driver/Dt.vuna:1281"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtGenerateIncremental", ("Vuna.Compiler.Driver.Dt.dtGenerateIncremental", "Vuna/Compiler/Driver/Dt.vuna:1532"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtGoalsIncrementalCore", ("Vuna.Compiler.Driver.Dt.dtGoalsIncrementalCore", "Vuna/Compiler/Driver/Dt.vuna:1231"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtGoalsSource", ("Vuna.Compiler.Driver.Dt.dtGoalsSource", "Vuna/Compiler/Driver/Dt.vuna:733"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtGoalsSourceIncremental", ("Vuna.Compiler.Driver.Dt.dtGoalsSourceIncremental", "Vuna/Compiler/Driver/Dt.vuna:1340"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtGoalsSourceTolerant", ("Vuna.Compiler.Driver.Dt.dtGoalsSourceTolerant", "Vuna/Compiler/Driver/Dt.vuna:744"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalChecked", ("Vuna.Compiler.Driver.Dt.dtIncrementalChecked", "Vuna/Compiler/Driver/Dt.vuna:1147"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalCheckedCore", ("Vuna.Compiler.Driver.Dt.dtIncrementalCheckedCore", "Vuna/Compiler/Driver/Dt.vuna:1221"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtIncrementalSetup", ("Vuna.Compiler.Driver.Dt.dtIncrementalSetup", "Vuna/Compiler/Driver/Dt.vuna:1171"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtInferDefTypes", ("Vuna.Compiler.Driver.Dt.dtInferDefTypes", "Vuna/Compiler/Driver/Dt.vuna:516"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoad", ("Vuna.Compiler.Driver.Dt.dtLoad", "Vuna/Compiler/Driver/Dt.vuna:79"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesParts", ("Vuna.Compiler.Driver.Dt.dtLoadModulesParts", "Vuna/Compiler/Driver/Dt.vuna:113"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesPartsIncremental", ("Vuna.Compiler.Driver.Dt.dtLoadModulesPartsIncremental", "Vuna/Compiler/Driver/Dt.vuna:1644"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadModulesPartsWithIfaces", ("Vuna.Compiler.Driver.Dt.dtLoadModulesPartsWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:1623"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadParts", ("Vuna.Compiler.Driver.Dt.dtLoadParts", "Vuna/Compiler/Driver/Dt.vuna:880"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsForCheck", ("Vuna.Compiler.Driver.Dt.dtLoadPartsForCheck", "Vuna/Compiler/Driver/Dt.vuna:103"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsIncremental", ("Vuna.Compiler.Driver.Dt.dtLoadPartsIncremental", "Vuna/Compiler/Driver/Dt.vuna:1073"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtLoadPartsWithIfaces", ("Vuna.Compiler.Driver.Dt.dtLoadPartsWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:1612"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtMainKind", ("Vuna.Compiler.Driver.Dt.dtMainKind", "Vuna/Compiler/Driver/Dt.vuna:760"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtPrepareTermAux", ("Vuna.Compiler.Driver.Dt.dtPrepareTermAux", "Vuna/Compiler/Driver/Dt.vuna:1096"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtProjectDecls", ("Vuna.Compiler.Driver.Dt.dtProjectDecls", "Vuna/Compiler/Driver/Dt.vuna:75"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtSplitPartsOurs", ("Vuna.Compiler.Driver.Dt.dtSplitPartsOurs", "Vuna/Compiler/Driver/Dt.vuna:1698"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtSplitPartsOursWith", ("Vuna.Compiler.Driver.Dt.dtSplitPartsOursWith", "Vuna/Compiler/Driver/Dt.vuna:1701"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectIncremental", ("Vuna.Compiler.Driver.Dt.dtSplitProjectIncremental", "Vuna/Compiler/Driver/Dt.vuna:1546"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectParts", ("Vuna.Compiler.Driver.Dt.dtSplitProjectParts", "Vuna/Compiler/Driver/Dt.vuna:1735"));
  ("v_Vuna_dCompiler_dDriver_dDt_ddtSplitProjectWithIfaces", ("Vuna.Compiler.Driver.Dt.dtSplitProjectWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:1682"));
  ("v_Vuna_dCompiler_dDriver_dDt_devalDtMain", ("Vuna.Compiler.Driver.Dt.evalDtMain", "Vuna/Compiler/Driver/Dt.vuna:811"));
  ("v_Vuna_dCompiler_dDriver_dDt_devalDtMainCore", ("Vuna.Compiler.Driver.Dt.evalDtMainCore", "Vuna/Compiler/Driver/Dt.vuna:822"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfilterProjectToImports", ("Vuna.Compiler.Driver.Dt.filterProjectToImports", "Vuna/Compiler/Driver/Dt.vuna:1586"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfindArity", ("Vuna.Compiler.Driver.Dt.findArity", "Vuna/Compiler/Driver/Dt.vuna:549"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfindDtDef", ("Vuna.Compiler.Driver.Dt.findDtDef", "Vuna/Compiler/Driver/Dt.vuna:589"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfindMainDef", ("Vuna.Compiler.Driver.Dt.findMainDef", "Vuna/Compiler/Driver/Dt.vuna:865"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfindModuleNameField", ("Vuna.Compiler.Driver.Dt.findModuleNameField", "Vuna/Compiler/Driver/Dt.vuna:1405"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfindModuleNamed", ("Vuna.Compiler.Driver.Dt.findModuleNamed", "Vuna/Compiler/Driver/Dt.vuna:1408"));
  ("v_Vuna_dCompiler_dDriver_dDt_dfreshMetaName", ("Vuna.Compiler.Driver.Dt.freshMetaName", "Vuna/Compiler/Driver/Dt.vuna:643"));
  ("v_Vuna_dCompiler_dDriver_dDt_dgeneralizeSignature", ("Vuna.Compiler.Driver.Dt.generalizeSignature", "Vuna/Compiler/Driver/Dt.vuna:620"));
  ("v_Vuna_dCompiler_dDriver_dDt_dheadIsMeta", ("Vuna.Compiler.Driver.Dt.headIsMeta", "Vuna/Compiler/Driver/Dt.vuna:716"));
  ("v_Vuna_dCompiler_dDriver_dDt_dimax", ("Vuna.Compiler.Driver.Dt.imax", "Vuna/Compiler/Driver/Dt.vuna:725"));
  ("v_Vuna_dCompiler_dDriver_dDt_dimportsOfModuleNames", ("Vuna.Compiler.Driver.Dt.importsOfModuleNames", "Vuna/Compiler/Driver/Dt.vuna:1574"));
  ("v_Vuna_dCompiler_dDriver_dDt_dinferEachType", ("Vuna.Compiler.Driver.Dt.inferEachType", "Vuna/Compiler/Driver/Dt.vuna:581"));
  ("v_Vuna_dCompiler_dDriver_dDt_dinterpMainShow", ("Vuna.Compiler.Driver.Dt.interpMainShow", "Vuna/Compiler/Driver/Dt.vuna:845"));
  ("v_Vuna_dCompiler_dDriver_dDt_disNilRowTermDt", ("Vuna.Compiler.Driver.Dt.isNilRowTermDt", "Vuna/Compiler/Driver/Dt.vuna:860"));
  ("v_Vuna_dCompiler_dDriver_dDt_dkindArrows", ("Vuna.Compiler.Driver.Dt.kindArrows", "Vuna/Compiler/Driver/Dt.vuna:667"));
  ("v_Vuna_dCompiler_dDriver_dDt_dkindOfArity", ("Vuna.Compiler.Driver.Dt.kindOfArity", "Vuna/Compiler/Driver/Dt.vuna:664"));
  ("v_Vuna_dCompiler_dDriver_dDt_dlistLen", ("Vuna.Compiler.Driver.Dt.listLen", "Vuna/Compiler/Driver/Dt.vuna:728"));
  ("v_Vuna_dCompiler_dDriver_dDt_dloadReplDecls", ("Vuna.Compiler.Driver.Dt.loadReplDecls", "Vuna/Compiler/Driver/Dt.vuna:594"));
  ("v_Vuna_dCompiler_dDriver_dDt_dlookupMainKind", ("Vuna.Compiler.Driver.Dt.lookupMainKind", "Vuna/Compiler/Driver/Dt.vuna:793"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmainActionKind", ("Vuna.Compiler.Driver.Dt.mainActionKind", "Vuna/Compiler/Driver/Dt.vuna:853"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmainKindForName", ("Vuna.Compiler.Driver.Dt.mainKindForName", "Vuna/Compiler/Driver/Dt.vuna:788"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmainKindNames", ("Vuna.Compiler.Driver.Dt.mainKindNames", "Vuna/Compiler/Driver/Dt.vuna:780"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaterializedDeps", ("Vuna.Compiler.Driver.Dt.materializedDeps", "Vuna/Compiler/Driver/Dt.vuna:1600"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaterializedOwn", ("Vuna.Compiler.Driver.Dt.materializedOwn", "Vuna/Compiler/Driver/Dt.vuna:1606"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArity", ("Vuna.Compiler.Driver.Dt.maxMetaArity", "Vuna/Compiler/Driver/Dt.vuna:694"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityAlts", ("Vuna.Compiler.Driver.Dt.maxMetaArityAlts", "Vuna/Compiler/Driver/Dt.vuna:709"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaArityArgs", ("Vuna.Compiler.Driver.Dt.maxMetaArityArgs", "Vuna/Compiler/Driver/Dt.vuna:705"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaCached", ("Vuna.Compiler.Driver.Dt.maxMetaCached", "Vuna/Compiler/Driver/Dt.vuna:958"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaCps", ("Vuna.Compiler.Driver.Dt.maxMetaCps", "Vuna/Compiler/Driver/Dt.vuna:961"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaDef", ("Vuna.Compiler.Driver.Dt.maxMetaDef", "Vuna/Compiler/Driver/Dt.vuna:953"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaxMetaList", ("Vuna.Compiler.Driver.Dt.maxMetaList", "Vuna/Compiler/Driver/Dt.vuna:949"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmaybeTermGlobals", ("Vuna.Compiler.Driver.Dt.maybeTermGlobals", "Vuna/Compiler/Driver/Dt.vuna:1782"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOf", ("Vuna.Compiler.Driver.Dt.metaIdsOf", "Vuna/Compiler/Driver/Dt.vuna:672"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfAlt", ("Vuna.Compiler.Driver.Dt.metaIdsOfAlt", "Vuna/Compiler/Driver/Dt.vuna:686"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmetaIdsOfArgs", ("Vuna.Compiler.Driver.Dt.metaIdsOfArgs", "Vuna/Compiler/Driver/Dt.vuna:682"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmissingDepModules", ("Vuna.Compiler.Driver.Dt.missingDepModules", "Vuna/Compiler/Driver/Dt.vuna:344"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmoduleOfIface", ("Vuna.Compiler.Driver.Dt.moduleOfIface", "Vuna/Compiler/Driver/Dt.vuna:1563"));
  ("v_Vuna_dCompiler_dDriver_dDt_dmodulesOfIfaces", ("Vuna.Compiler.Driver.Dt.modulesOfIfaces", "Vuna/Compiler/Driver/Dt.vuna:1063"));
  ("v_Vuna_dCompiler_dDriver_dDt_dnameSlotTbl", ("Vuna.Compiler.Driver.Dt.nameSlotTbl", "Vuna/Compiler/Driver/Dt.vuna:1050"));
  ("v_Vuna_dCompiler_dDriver_dDt_dopaqueSigType", ("Vuna.Compiler.Driver.Dt.opaqueSigType", "Vuna/Compiler/Driver/Dt.vuna:224"));
  ("v_Vuna_dCompiler_dDriver_dDt_dpairKeyValue", ("Vuna.Compiler.Driver.Dt.pairKeyValue", "Vuna/Compiler/Driver/Dt.vuna:1449"));
  ("v_Vuna_dCompiler_dDriver_dDt_dpickFreshName", ("Vuna.Compiler.Driver.Dt.pickFreshName", "Vuna/Compiler/Driver/Dt.vuna:646"));
  ("v_Vuna_dCompiler_dDriver_dDt_dpreloadKeepOf", ("Vuna.Compiler.Driver.Dt.preloadKeepOf", "Vuna/Compiler/Driver/Dt.vuna:1596"));
  ("v_Vuna_dCompiler_dDriver_dDt_dreplCheckParts", ("Vuna.Compiler.Driver.Dt.replCheckParts", "Vuna/Compiler/Driver/Dt.vuna:383"));
  ("v_Vuna_dCompiler_dDriver_dDt_dreplCheckPartsAux", ("Vuna.Compiler.Driver.Dt.replCheckPartsAux", "Vuna/Compiler/Driver/Dt.vuna:389"));
  ("v_Vuna_dCompiler_dDriver_dDt_dreplExprName", ("Vuna.Compiler.Driver.Dt.replExprName", "Vuna/Compiler/Driver/Dt.vuna:798"));
  ("v_Vuna_dCompiler_dDriver_dDt_dreplProgramFull", ("Vuna.Compiler.Driver.Dt.replProgramFull", "Vuna/Compiler/Driver/Dt.vuna:292"));
  ("v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfaces", ("Vuna.Compiler.Driver.Dt.replProgramWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:421"));
  ("v_Vuna_dCompiler_dDriver_dDt_dreplProgramWithIfacesAux", ("Vuna.Compiler.Driver.Dt.replProgramWithIfacesAux", "Vuna/Compiler/Driver/Dt.vuna:430"));
  ("v_Vuna_dCompiler_dDriver_dDt_dsealAbstractAfter", ("Vuna.Compiler.Driver.Dt.sealAbstractAfter", "Vuna/Compiler/Driver/Dt.vuna:205"));
  ("v_Vuna_dCompiler_dDriver_dDt_dsealDeclOf", ("Vuna.Compiler.Driver.Dt.sealDeclOf", "Vuna/Compiler/Driver/Dt.vuna:213"));
  ("v_Vuna_dCompiler_dDriver_dDt_dsealModule", ("Vuna.Compiler.Driver.Dt.sealModule", "Vuna/Compiler/Driver/Dt.vuna:195"));
  ("v_Vuna_dCompiler_dDriver_dDt_dsealOpaqueDecls", ("Vuna.Compiler.Driver.Dt.sealOpaqueDecls", "Vuna/Compiler/Driver/Dt.vuna:192"));
  ("v_Vuna_dCompiler_dDriver_dDt_dsealSpan", ("Vuna.Compiler.Driver.Dt.sealSpan", "Vuna/Compiler/Driver/Dt.vuna:221"));
  ("v_Vuna_dCompiler_dDriver_dDt_dshiftedDepPrograms", ("Vuna.Compiler.Driver.Dt.shiftedDepPrograms", "Vuna/Compiler/Driver/Dt.vuna:1027"));
  ("v_Vuna_dCompiler_dDriver_dDt_dshiftedDepProgramsGo", ("Vuna.Compiler.Driver.Dt.shiftedDepProgramsGo", "Vuna/Compiler/Driver/Dt.vuna:1054"));
  ("v_Vuna_dCompiler_dDriver_dDt_dsortNames", ("Vuna.Compiler.Driver.Dt.sortNames", "Vuna/Compiler/Driver/Dt.vuna:1036"));
  ("v_Vuna_dCompiler_dDriver_dDt_dspineLen", ("Vuna.Compiler.Driver.Dt.spineLen", "Vuna/Compiler/Driver/Dt.vuna:721"));
  ("v_Vuna_dCompiler_dDriver_dDt_dsplitGenerateCached", ("Vuna.Compiler.Driver.Dt.splitGenerateCached", "Vuna/Compiler/Driver/Dt.vuna:1512"));
  ("v_Vuna_dCompiler_dDriver_dDt_dsplitReplExpr", ("Vuna.Compiler.Driver.Dt.splitReplExpr", "Vuna/Compiler/Driver/Dt.vuna:802"));
  ("v_Vuna_dCompiler_dDriver_dDt_dsubstGenMetas", ("Vuna.Compiler.Driver.Dt.substGenMetas", "Vuna/Compiler/Driver/Dt.vuna:655"));
  ("v_Vuna_dCompiler_dDriver_dDt_dtopoDepsOf", ("Vuna.Compiler.Driver.Dt.topoDepsOf", "Vuna/Compiler/Driver/Dt.vuna:1413"));
  ("v_Vuna_dCompiler_dDriver_dDt_dtopoModules", ("Vuna.Compiler.Driver.Dt.topoModules", "Vuna/Compiler/Driver/Dt.vuna:1437"));
  ("v_Vuna_dCompiler_dDriver_dDt_dtopoVisit", ("Vuna.Compiler.Driver.Dt.topoVisit", "Vuna/Compiler/Driver/Dt.vuna:1420"));
  ("v_Vuna_dCompiler_dDriver_dDt_dtopoVisitAll", ("Vuna.Compiler.Driver.Dt.topoVisitAll", "Vuna/Compiler/Driver/Dt.vuna:1430"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitCacheEnabled", ("Vuna.Compiler.Driver.Dt.unitCacheEnabled", "Vuna/Compiler/Driver/Dt.vuna:1507"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitCacheLookup", ("Vuna.Compiler.Driver.Dt.unitCacheLookup", "Vuna/Compiler/Driver/Dt.vuna:1486"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitCacheStore", ("Vuna.Compiler.Driver.Dt.unitCacheStore", "Vuna/Compiler/Driver/Dt.vuna:1499"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitDeclsHash", ("Vuna.Compiler.Driver.Dt.unitDeclsHash", "Vuna/Compiler/Driver/Dt.vuna:1446"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitImportKey", ("Vuna.Compiler.Driver.Dt.unitImportKey", "Vuna/Compiler/Driver/Dt.vuna:1459"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitImportsOf", ("Vuna.Compiler.Driver.Dt.unitImportsOf", "Vuna/Compiler/Driver/Dt.vuna:1452"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitKeyOne", ("Vuna.Compiler.Driver.Dt.unitKeyOne", "Vuna/Compiler/Driver/Dt.vuna:1464"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitKeysGo", ("Vuna.Compiler.Driver.Dt.unitKeysGo", "Vuna/Compiler/Driver/Dt.vuna:1470"));
  ("v_Vuna_dCompiler_dDriver_dDt_dunitKeysOf", ("Vuna.Compiler.Driver.Dt.unitKeysOf", "Vuna/Compiler/Driver/Dt.vuna:1474"));
  ("v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsGo", ("Vuna.Compiler.Driver.Dt.warnUnusedDefsGo", "Vuna/Compiler/Driver/Dt.vuna:1791"));
  ("v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsIn", ("Vuna.Compiler.Driver.Dt.warnUnusedDefsIn", "Vuna/Compiler/Driver/Dt.vuna:1770"));
  ("v_Vuna_dCompiler_dDriver_dDt_dwarnUnusedDefsTbl", ("Vuna.Compiler.Driver.Dt.warnUnusedDefsTbl", "Vuna/Compiler/Driver/Dt.vuna:1794"));
  ("v_Vuna_dCompiler_dDriver_dDt_dwrapGenMetas", ("Vuna.Compiler.Driver.Dt.wrapGenMetas", "Vuna/Compiler/Driver/Dt.vuna:660"));
  ("v_Vuna_dCompiler_dDriver_dIface_dallOwnedPresent", ("Vuna.Compiler.Driver.Iface.allOwnedPresent", "Vuna/Compiler/Driver/Iface.vuna:742"));
  ("v_Vuna_dCompiler_dDriver_dIface_dallValid", ("Vuna.Compiler.Driver.Iface.allValid", "Vuna/Compiler/Driver/Iface.vuna:778"));
  ("v_Vuna_dCompiler_dDriver_dIface_dartifactNamesOf", ("Vuna.Compiler.Driver.Iface.artifactNamesOf", "Vuna/Compiler/Driver/Iface.vuna:658"));
  ("v_Vuna_dCompiler_dDriver_dIface_dbucketOf", ("Vuna.Compiler.Driver.Iface.bucketOf", "Vuna/Compiler/Driver/Iface.vuna:527"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcanonAlts", ("Vuna.Compiler.Driver.Iface.canonAlts", "Vuna/Compiler/Driver/Iface.vuna:315"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcanonArgs", ("Vuna.Compiler.Driver.Iface.canonArgs", "Vuna/Compiler/Driver/Iface.vuna:307"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcanonMaybe", ("Vuna.Compiler.Driver.Iface.canonMaybe", "Vuna/Compiler/Driver/Iface.vuna:326"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcanonStateEmpty", ("Vuna.Compiler.Driver.Iface.canonStateEmpty", "Vuna/Compiler/Driver/Iface.vuna:260"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcanonTerm", ("Vuna.Compiler.Driver.Iface.canonTerm", "Vuna/Compiler/Driver/Iface.vuna:263"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcanonTermTop", ("Vuna.Compiler.Driver.Iface.canonTermTop", "Vuna/Compiler/Driver/Iface.vuna:323"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcleanIfaceOf", ("Vuna.Compiler.Driver.Iface.cleanIfaceOf", "Vuna/Compiler/Driver/Iface.vuna:584"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueGo", ("Vuna.Compiler.Driver.Iface.coverageIssueGo", "Vuna/Compiler/Driver/Iface.vuna:648"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcoverageIssueOf", ("Vuna.Compiler.Driver.Iface.coverageIssueOf", "Vuna/Compiler/Driver/Iface.vuna:638"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcoverageResult", ("Vuna.Compiler.Driver.Iface.coverageResult", "Vuna/Compiler/Driver/Iface.vuna:696"));
  ("v_Vuna_dCompiler_dDriver_dIface_dcpOfModule", ("Vuna.Compiler.Driver.Iface.cpOfModule", "Vuna/Compiler/Driver/Iface.vuna:549"));
  ("v_Vuna_dCompiler_dDriver_dIface_dctorFamilyPairs", ("Vuna.Compiler.Driver.Iface.ctorFamilyPairs", "Vuna/Compiler/Driver/Iface.vuna:474"));
  ("v_Vuna_dCompiler_dDriver_dIface_dctorNamesOf", ("Vuna.Compiler.Driver.Iface.ctorNamesOf", "Vuna/Compiler/Driver/Iface.vuna:667"));
  ("v_Vuna_dCompiler_dDriver_dIface_dctorOwnerOf", ("Vuna.Compiler.Driver.Iface.ctorOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:479"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddataNamesOf", ("Vuna.Compiler.Driver.Iface.dataNamesOf", "Vuna/Compiler/Driver/Iface.vuna:664"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddataOwnerOf", ("Vuna.Compiler.Driver.Iface.dataOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:468"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecDefLoc", ("Vuna.Compiler.Driver.Iface.decDefLoc", "Vuna/Compiler/Driver/Iface.vuna:813"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecDepPair", ("Vuna.Compiler.Driver.Iface.decDepPair", "Vuna/Compiler/Driver/Iface.vuna:804"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfaceAt", ("Vuna.Compiler.Driver.Iface.decModuleIfaceAt", "Vuna/Compiler/Driver/Iface.vuna:831"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfaceComplete", ("Vuna.Compiler.Driver.Iface.decModuleIfaceComplete", "Vuna/Compiler/Driver/Iface.vuna:854"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecModuleIfacePayload", ("Vuna.Compiler.Driver.Iface.decModuleIfacePayload", "Vuna/Compiler/Driver/Iface.vuna:834"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddecSourceInfo", ("Vuna.Compiler.Driver.Iface.decSourceInfo", "Vuna/Compiler/Driver/Iface.vuna:796"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddefLocOf", ("Vuna.Compiler.Driver.Iface.defLocOf", "Vuna/Compiler/Driver/Iface.vuna:170"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddefLocsOfDefs", ("Vuna.Compiler.Driver.Iface.defLocsOfDefs", "Vuna/Compiler/Driver/Iface.vuna:178"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddefOwnerOf", ("Vuna.Compiler.Driver.Iface.defOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:463"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddefView", ("Vuna.Compiler.Driver.Iface.defView", "Vuna/Compiler/Driver/Iface.vuna:332"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddepHashesOf", ("Vuna.Compiler.Driver.Iface.depHashesOf", "Vuna/Compiler/Driver/Iface.vuna:581"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddepMissingHash", ("Vuna.Compiler.Driver.Iface.depMissingHash", "Vuna/Compiler/Driver/Iface.vuna:240"));
  ("v_Vuna_dCompiler_dDriver_dIface_ddigestParts", ("Vuna.Compiler.Driver.Iface.digestParts", "Vuna/Compiler/Driver/Iface.vuna:236"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencDefLoc", ("Vuna.Compiler.Driver.Iface.encDefLoc", "Vuna/Compiler/Driver/Iface.vuna:810"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencDefView", ("Vuna.Compiler.Driver.Iface.encDefView", "Vuna/Compiler/Driver/Iface.vuna:340"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencDepPair", ("Vuna.Compiler.Driver.Iface.encDepPair", "Vuna/Compiler/Driver/Iface.vuna:801"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencGlobal", ("Vuna.Compiler.Driver.Iface.encGlobal", "Vuna/Compiler/Driver/Iface.vuna:370"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencModuleIface", ("Vuna.Compiler.Driver.Iface.encModuleIface", "Vuna/Compiler/Driver/Iface.vuna:828"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencModuleIfaceAt", ("Vuna.Compiler.Driver.Iface.encModuleIfaceAt", "Vuna/Compiler/Driver/Iface.vuna:825"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencModuleIfacePayload", ("Vuna.Compiler.Driver.Iface.encModuleIfacePayload", "Vuna/Compiler/Driver/Iface.vuna:819"));
  ("v_Vuna_dCompiler_dDriver_dIface_dencSourceInfo", ("Vuna.Compiler.Driver.Iface.encSourceInfo", "Vuna/Compiler/Driver/Iface.vuna:793"));
  ("v_Vuna_dCompiler_dDriver_dIface_dexportKeyOf", ("Vuna.Compiler.Driver.Iface.exportKeyOf", "Vuna/Compiler/Driver/Iface.vuna:377"));
  ("v_Vuna_dCompiler_dDriver_dIface_dfindNamedModule", ("Vuna.Compiler.Driver.Iface.findNamedModule", "Vuna/Compiler/Driver/Iface.vuna:722"));
  ("v_Vuna_dCompiler_dDriver_dIface_dfinishIface", ("Vuna.Compiler.Driver.Iface.finishIface", "Vuna/Compiler/Driver/Iface.vuna:609"));
  ("v_Vuna_dCompiler_dDriver_dIface_dfirstCoverageIssue", ("Vuna.Compiler.Driver.Iface.firstCoverageIssue", "Vuna/Compiler/Driver/Iface.vuna:680"));
  ("v_Vuna_dCompiler_dDriver_dIface_dglobalOwnerOf", ("Vuna.Compiler.Driver.Iface.globalOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:491"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhasMissingDep", ("Vuna.Compiler.Driver.Iface.hasMissingDep", "Vuna/Compiler/Driver/Iface.vuna:572"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashClasses", ("Vuna.Compiler.Driver.Iface.hashClasses", "Vuna/Compiler/Driver/Iface.vuna:365"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashDatas", ("Vuna.Compiler.Driver.Iface.hashDatas", "Vuna/Compiler/Driver/Iface.vuna:359"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashDecls", ("Vuna.Compiler.Driver.Iface.hashDecls", "Vuna/Compiler/Driver/Iface.vuna:398"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashDeclsForIface", ("Vuna.Compiler.Driver.Iface.hashDeclsForIface", "Vuna/Compiler/Driver/Iface.vuna:408"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashDefView", ("Vuna.Compiler.Driver.Iface.hashDefView", "Vuna/Compiler/Driver/Iface.vuna:343"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashDefs", ("Vuna.Compiler.Driver.Iface.hashDefs", "Vuna/Compiler/Driver/Iface.vuna:350"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashExports", ("Vuna.Compiler.Driver.Iface.hashExports", "Vuna/Compiler/Driver/Iface.vuna:380"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashFixities", ("Vuna.Compiler.Driver.Iface.hashFixities", "Vuna/Compiler/Driver/Iface.vuna:384"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashGlobals", ("Vuna.Compiler.Driver.Iface.hashGlobals", "Vuna/Compiler/Driver/Iface.vuna:373"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashImports", ("Vuna.Compiler.Driver.Iface.hashImports", "Vuna/Compiler/Driver/Iface.vuna:392"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashInsts", ("Vuna.Compiler.Driver.Iface.hashInsts", "Vuna/Compiler/Driver/Iface.vuna:362"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashOfIface", ("Vuna.Compiler.Driver.Iface.hashOfIface", "Vuna/Compiler/Driver/Iface.vuna:418"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashOfImportName", ("Vuna.Compiler.Driver.Iface.hashOfImportName", "Vuna/Compiler/Driver/Iface.vuna:576"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashOfParts", ("Vuna.Compiler.Driver.Iface.hashOfParts", "Vuna/Compiler/Driver/Iface.vuna:411"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashOpaque", ("Vuna.Compiler.Driver.Iface.hashOpaque", "Vuna/Compiler/Driver/Iface.vuna:355"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashRecords", ("Vuna.Compiler.Driver.Iface.hashRecords", "Vuna/Compiler/Driver/Iface.vuna:388"));
  ("v_Vuna_dCompiler_dDriver_dIface_dhashTextStrong", ("Vuna.Compiler.Driver.Iface.hashTextStrong", "Vuna/Compiler/Driver/Iface.vuna:219"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceArtifactNames", ("Vuna.Compiler.Driver.Iface.ifaceArtifactNames", "Vuna/Compiler/Driver/Iface.vuna:677"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceCodec", ("Vuna.Compiler.Driver.Iface.ifaceCodec", "Vuna/Compiler/Driver/Iface.vuna:789"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceHashVersion", ("Vuna.Compiler.Driver.Iface.ifaceHashVersion", "Vuna/Compiler/Driver/Iface.vuna:209"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceNamesOf", ("Vuna.Compiler.Driver.Iface.ifaceNamesOf", "Vuna/Compiler/Driver/Iface.vuna:670"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceOfModule", ("Vuna.Compiler.Driver.Iface.ifaceOfModule", "Vuna/Compiler/Driver/Iface.vuna:750"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceOfPackage", ("Vuna.Compiler.Driver.Iface.ifaceOfPackage", "Vuna/Compiler/Driver/Iface.vuna:701"));
  ("v_Vuna_dCompiler_dDriver_dIface_difacePreludeNames", ("Vuna.Compiler.Driver.Iface.ifacePreludeNames", "Vuna/Compiler/Driver/Iface.vuna:486"));
  ("v_Vuna_dCompiler_dDriver_dIface_difaceSchema", ("Vuna.Compiler.Driver.Iface.ifaceSchema", "Vuna/Compiler/Driver/Iface.vuna:204"));
  ("v_Vuna_dCompiler_dDriver_dIface_difacesGo", ("Vuna.Compiler.Driver.Iface.ifacesGo", "Vuna/Compiler/Driver/Iface.vuna:618"));
  ("v_Vuna_dCompiler_dDriver_dIface_dimplHashOfParts", ("Vuna.Compiler.Driver.Iface.implHashOfParts", "Vuna/Compiler/Driver/Iface.vuna:438"));
  ("v_Vuna_dCompiler_dDriver_dIface_dimportNameOf", ("Vuna.Compiler.Driver.Iface.importNameOf", "Vuna/Compiler/Driver/Iface.vuna:564"));
  ("v_Vuna_dCompiler_dDriver_dIface_dimportNamesOfModule", ("Vuna.Compiler.Driver.Iface.importNamesOfModule", "Vuna/Compiler/Driver/Iface.vuna:567"));
  ("v_Vuna_dCompiler_dDriver_dIface_disSealName", ("Vuna.Compiler.Driver.Iface.isSealName", "Vuna/Compiler/Driver/Iface.vuna:655"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiCachedOf", ("Vuna.Compiler.Driver.Iface.miCachedOf", "Vuna/Compiler/Driver/Iface.vuna:128"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiDeclsOf", ("Vuna.Compiler.Driver.Iface.miDeclsOf", "Vuna/Compiler/Driver/Iface.vuna:155"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiDefLocsOf", ("Vuna.Compiler.Driver.Iface.miDefLocsOf", "Vuna/Compiler/Driver/Iface.vuna:167"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiDepHashesOf", ("Vuna.Compiler.Driver.Iface.miDepHashesOf", "Vuna/Compiler/Driver/Iface.vuna:137"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiExportsOf", ("Vuna.Compiler.Driver.Iface.miExportsOf", "Vuna/Compiler/Driver/Iface.vuna:149"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiFixitiesOf", ("Vuna.Compiler.Driver.Iface.miFixitiesOf", "Vuna/Compiler/Driver/Iface.vuna:152"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiIfaceHashOf", ("Vuna.Compiler.Driver.Iface.miIfaceHashOf", "Vuna/Compiler/Driver/Iface.vuna:131"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiImplHashOf", ("Vuna.Compiler.Driver.Iface.miImplHashOf", "Vuna/Compiler/Driver/Iface.vuna:134"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiImplicitImportsOf", ("Vuna.Compiler.Driver.Iface.miImplicitImportsOf", "Vuna/Compiler/Driver/Iface.vuna:146"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiImportsOf", ("Vuna.Compiler.Driver.Iface.miImportsOf", "Vuna/Compiler/Driver/Iface.vuna:143"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiNameOf", ("Vuna.Compiler.Driver.Iface.miNameOf", "Vuna/Compiler/Driver/Iface.vuna:122"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiPackageOf", ("Vuna.Compiler.Driver.Iface.miPackageOf", "Vuna/Compiler/Driver/Iface.vuna:125"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiPreparedOf", ("Vuna.Compiler.Driver.Iface.miPreparedOf", "Vuna/Compiler/Driver/Iface.vuna:162"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiRecordsOf", ("Vuna.Compiler.Driver.Iface.miRecordsOf", "Vuna/Compiler/Driver/Iface.vuna:159"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmiSourceOf", ("Vuna.Compiler.Driver.Iface.miSourceOf", "Vuna/Compiler/Driver/Iface.vuna:140"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmkIfaceBase", ("Vuna.Compiler.Driver.Iface.mkIfaceBase", "Vuna/Compiler/Driver/Iface.vuna:593"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmoduleCoverageOk", ("Vuna.Compiler.Driver.Iface.moduleCoverageOk", "Vuna/Compiler/Driver/Iface.vuna:736"));
  ("v_Vuna_dCompiler_dDriver_dIface_dmoduleNamesOf", ("Vuna.Compiler.Driver.Iface.moduleNamesOf", "Vuna/Compiler/Driver/Iface.vuna:782"));
  ("v_Vuna_dCompiler_dDriver_dIface_downedByModule", ("Vuna.Compiler.Driver.Iface.ownedByModule", "Vuna/Compiler/Driver/Iface.vuna:733"));
  ("v_Vuna_dCompiler_dDriver_dIface_downerIndexOf", ("Vuna.Compiler.Driver.Iface.ownerIndexOf", "Vuna/Compiler/Driver/Iface.vuna:499"));
  ("v_Vuna_dCompiler_dDriver_dIface_downerOfAny", ("Vuna.Compiler.Driver.Iface.ownerOfAny", "Vuna/Compiler/Driver/Iface.vuna:631"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpackageIfaceValid", ("Vuna.Compiler.Driver.Iface.packageIfaceValid", "Vuna/Compiler/Driver/Iface.vuna:774"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpartOf", ("Vuna.Compiler.Driver.Iface.partOf", "Vuna/Compiler/Driver/Iface.vuna:232"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwner", ("Vuna.Compiler.Driver.Iface.partitionByOwner", "Vuna/Compiler/Driver/Iface.vuna:517"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpartitionByOwnerGo", ("Vuna.Compiler.Driver.Iface.partitionByOwnerGo", "Vuna/Compiler/Driver/Iface.vuna:521"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpayloadDigest", ("Vuna.Compiler.Driver.Iface.payloadDigest", "Vuna/Compiler/Driver/Iface.vuna:228"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpkgIfaceHashOfModules", ("Vuna.Compiler.Driver.Iface.pkgIfaceHashOfModules", "Vuna/Compiler/Driver/Iface.vuna:425"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpkgImplHashOfModules", ("Vuna.Compiler.Driver.Iface.pkgImplHashOfModules", "Vuna/Compiler/Driver/Iface.vuna:429"));
  ("v_Vuna_dCompiler_dDriver_dIface_dprefixOwner", ("Vuna.Compiler.Driver.Iface.prefixOwner", "Vuna/Compiler/Driver/Iface.vuna:457"));
  ("v_Vuna_dCompiler_dDriver_dIface_dpreparedForModule", ("Vuna.Compiler.Driver.Iface.preparedForModule", "Vuna/Compiler/Driver/Iface.vuna:184"));
  ("v_Vuna_dCompiler_dDriver_dIface_dprogPartsOf", ("Vuna.Compiler.Driver.Iface.progPartsOf", "Vuna/Compiler/Driver/Iface.vuna:538"));
  ("v_Vuna_dCompiler_dDriver_dIface_dreverseBucket", ("Vuna.Compiler.Driver.Iface.reverseBucket", "Vuna/Compiler/Driver/Iface.vuna:535"));
  ("v_Vuna_dCompiler_dDriver_dIface_dreverseBuckets", ("Vuna.Compiler.Driver.Iface.reverseBuckets", "Vuna/Compiler/Driver/Iface.vuna:532"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsameOwner", ("Vuna.Compiler.Driver.Iface.sameOwner", "Vuna/Compiler/Driver/Iface.vuna:729"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsetPrepared", ("Vuna.Compiler.Driver.Iface.setPrepared", "Vuna/Compiler/Driver/Iface.vuna:197"));
  ("v_Vuna_dCompiler_dDriver_dIface_dshaText", ("Vuna.Compiler.Driver.Iface.shaText", "Vuna/Compiler/Driver/Iface.vuna:223"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsiHashOf", ("Vuna.Compiler.Driver.Iface.siHashOf", "Vuna/Compiler/Driver/Iface.vuna:113"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsiMtimeOf", ("Vuna.Compiler.Driver.Iface.siMtimeOf", "Vuna/Compiler/Driver/Iface.vuna:116"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsiPathOf", ("Vuna.Compiler.Driver.Iface.siPathOf", "Vuna/Compiler/Driver/Iface.vuna:110"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsiSizeOf", ("Vuna.Compiler.Driver.Iface.siSizeOf", "Vuna/Compiler/Driver/Iface.vuna:119"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsortByText", ("Vuna.Compiler.Driver.Iface.sortByText", "Vuna/Compiler/Driver/Iface.vuna:250"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsortModuleIfaces", ("Vuna.Compiler.Driver.Iface.sortModuleIfaces", "Vuna/Compiler/Driver/Iface.vuna:434"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsortTextPairs", ("Vuna.Compiler.Driver.Iface.sortTextPairs", "Vuna/Compiler/Driver/Iface.vuna:247"));
  ("v_Vuna_dCompiler_dDriver_dIface_dsourceOf", ("Vuna.Compiler.Driver.Iface.sourceOf", "Vuna/Compiler/Driver/Iface.vuna:560"));
  ("v_Vuna_dCompiler_dDriver_dIface_dstripOpaqueDeclBodies", ("Vuna.Compiler.Driver.Iface.stripOpaqueDeclBodies", "Vuna/Compiler/Driver/Iface.vuna:403"));
  ("v_Vuna_dCompiler_dDriver_dIface_dtblOwner", ("Vuna.Compiler.Driver.Iface.tblOwner", "Vuna/Compiler/Driver/Iface.vuna:454"));
  ("v_Vuna_dCompiler_dDriver_dNative_dcompileNative", ("Vuna.Compiler.Driver.Native.compileNative", "Vuna/Compiler/Driver/Native.vuna:30"));
  ("v_Vuna_dCompiler_dDriver_dNative_dnativeErrDiag", ("Vuna.Compiler.Driver.Native.nativeErrDiag", "Vuna/Compiler/Driver/Native.vuna:27"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dentryOwner", ("Vuna.Compiler.Driver.Owner.entryOwner", "Vuna/Compiler/Driver/Owner.vuna:28"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dhasFieldOwnerOf", ("Vuna.Compiler.Driver.Owner.hasFieldOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:81"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dhasFieldRecordTypeExpr", ("Vuna.Compiler.Driver.Owner.hasFieldRecordTypeExpr", "Vuna/Compiler/Driver/Owner.vuna:76"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dheadClassName", ("Vuna.Compiler.Driver.Owner.headClassName", "Vuna/Compiler/Driver/Owner.vuna:56"));
  ("v_Vuna_dCompiler_dDriver_dOwner_disSyntheticInternalName", ("Vuna.Compiler.Driver.Owner.isSyntheticInternalName", "Vuna/Compiler/Driver/Owner.vuna:181"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dknownModuleOrErr", ("Vuna.Compiler.Driver.Owner.knownModuleOrErr", "Vuna/Compiler/Driver/Owner.vuna:164"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dlookupModuleOf", ("Vuna.Compiler.Driver.Owner.lookupModuleOf", "Vuna/Compiler/Driver/Owner.vuna:161"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dmodulePrefixOfName", ("Vuna.Compiler.Driver.Owner.modulePrefixOfName", "Vuna/Compiler/Driver/Owner.vuna:32"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDatas", ("Vuna.Compiler.Driver.Owner.nameOwnerPairsOfDatas", "Vuna/Compiler/Driver/Owner.vuna:198"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dnameOwnerPairsOfDefs", ("Vuna.Compiler.Driver.Owner.nameOwnerPairsOfDefs", "Vuna/Compiler/Driver/Owner.vuna:192"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDataNames", ("Vuna.Compiler.Driver.Owner.splitDataNames", "Vuna/Compiler/Driver/Owner.vuna:49"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOf", ("Vuna.Compiler.Driver.Owner.splitDataOwnerEntriesOf", "Vuna/Compiler/Driver/Owner.vuna:124"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerEntriesOfModules", ("Vuna.Compiler.Driver.Owner.splitDataOwnerEntriesOfModules", "Vuna/Compiler/Driver/Owner.vuna:134"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDataOwnerOf", ("Vuna.Compiler.Driver.Owner.splitDataOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:171"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDeclNames", ("Vuna.Compiler.Driver.Owner.splitDeclNames", "Vuna/Compiler/Driver/Owner.vuna:38"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDefOwnerOf", ("Vuna.Compiler.Driver.Owner.splitDefOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:184"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitDerivedOwners", ("Vuna.Compiler.Driver.Owner.splitDerivedOwners", "Vuna/Compiler/Driver/Owner.vuna:97"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitHasFieldOwners", ("Vuna.Compiler.Driver.Owner.splitHasFieldOwners", "Vuna/Compiler/Driver/Owner.vuna:92"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnerOf", ("Vuna.Compiler.Driver.Owner.splitInstanceOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:65"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitInstanceOwnersGo", ("Vuna.Compiler.Driver.Owner.splitInstanceOwnersGo", "Vuna/Compiler/Driver/Owner.vuna:114"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitMetaOf", ("Vuna.Compiler.Driver.Owner.splitMetaOf", "Vuna/Compiler/Driver/Owner.vuna:149"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitNoSpan", ("Vuna.Compiler.Driver.Owner.splitNoSpan", "Vuna/Compiler/Driver/Owner.vuna:24"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOf", ("Vuna.Compiler.Driver.Owner.splitOwnerEntriesOf", "Vuna/Compiler/Driver/Owner.vuna:119"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitOwnerEntriesOfModules", ("Vuna.Compiler.Driver.Owner.splitOwnerEntriesOfModules", "Vuna/Compiler/Driver/Owner.vuna:129"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitTraitDataOwnerOf", ("Vuna.Compiler.Driver.Owner.splitTraitDataOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:110"));
  ("v_Vuna_dCompiler_dDriver_dOwner_dsplitTraitDefOwnerOf", ("Vuna.Compiler.Driver.Owner.splitTraitDefOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:105"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dbucketGcGo", ("Vuna.Compiler.Driver.PerfCache.bucketGcGo", "Vuna/Compiler/Driver/PerfCache.vuna:130"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dcharSafe", ("Vuna.Compiler.Driver.PerfCache.charSafe", "Vuna/Compiler/Driver/PerfCache.vuna:68"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_ddropDirFiles", ("Vuna.Compiler.Driver.PerfCache.dropDirFiles", "Vuna/Compiler/Driver/PerfCache.vuna:108"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_ddropFiles", ("Vuna.Compiler.Driver.PerfCache.dropFiles", "Vuna/Compiler/Driver/PerfCache.vuna:113"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dgcEntries", ("Vuna.Compiler.Driver.PerfCache.gcEntries", "Vuna/Compiler/Driver/PerfCache.vuna:93"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dhashTextOf", ("Vuna.Compiler.Driver.PerfCache.hashTextOf", "Vuna/Compiler/Driver/PerfCache.vuna:50"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dsafeRemoveFile", ("Vuna.Compiler.Driver.PerfCache.safeRemoveFile", "Vuna/Compiler/Driver/PerfCache.vuna:84"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheBucketGc", ("Vuna.Compiler.Driver.PerfCache.unitCacheBucketGc", "Vuna/Compiler/Driver/PerfCache.vuna:124"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheCodec", ("Vuna.Compiler.Driver.PerfCache.unitCacheCodec", "Vuna/Compiler/Driver/PerfCache.vuna:35"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheDir", ("Vuna.Compiler.Driver.PerfCache.unitCacheDir", "Vuna/Compiler/Driver/PerfCache.vuna:45"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryDir", ("Vuna.Compiler.Driver.PerfCache.unitCacheEntryDir", "Vuna/Compiler/Driver/PerfCache.vuna:74"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheEntryKeyOf", ("Vuna.Compiler.Driver.PerfCache.unitCacheEntryKeyOf", "Vuna/Compiler/Driver/PerfCache.vuna:78"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheFileName", ("Vuna.Compiler.Driver.PerfCache.unitCacheFileName", "Vuna/Compiler/Driver/PerfCache.vuna:57"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheGc", ("Vuna.Compiler.Driver.PerfCache.unitCacheGc", "Vuna/Compiler/Driver/PerfCache.vuna:87"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCachePath", ("Vuna.Compiler.Driver.PerfCache.unitCachePath", "Vuna/Compiler/Driver/PerfCache.vuna:53"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheRead", ("Vuna.Compiler.Driver.PerfCache.unitCacheRead", "Vuna/Compiler/Driver/PerfCache.vuna:144"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheSchema", ("Vuna.Compiler.Driver.PerfCache.unitCacheSchema", "Vuna/Compiler/Driver/PerfCache.vuna:31"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheTag", ("Vuna.Compiler.Driver.PerfCache.unitCacheTag", "Vuna/Compiler/Driver/PerfCache.vuna:38"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitCacheWrite", ("Vuna.Compiler.Driver.PerfCache.unitCacheWrite", "Vuna/Compiler/Driver/PerfCache.vuna:153"));
  ("v_Vuna_dCompiler_dDriver_dPerfCache_dunitNameSafe", ("Vuna.Compiler.Driver.PerfCache.unitNameSafe", "Vuna/Compiler/Driver/PerfCache.vuna:65"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dcheckDataOwners", ("Vuna.Compiler.Driver.SplitGen.checkDataOwners", "Vuna/Compiler/Driver/SplitGen.vuna:178"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dcheckDefOwners", ("Vuna.Compiler.Driver.SplitGen.checkDefOwners", "Vuna/Compiler/Driver/SplitGen.vuna:172"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dcheckDepsOrder", ("Vuna.Compiler.Driver.SplitGen.checkDepsOrder", "Vuna/Compiler/Driver/SplitGen.vuna:72"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dcheckEntryDeclName", ("Vuna.Compiler.Driver.SplitGen.checkEntryDeclName", "Vuna/Compiler/Driver/SplitGen.vuna:151"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dcheckEntryDecls", ("Vuna.Compiler.Driver.SplitGen.checkEntryDecls", "Vuna/Compiler/Driver/SplitGen.vuna:167"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dcheckEntryDeclsGo", ("Vuna.Compiler.Driver.SplitGen.checkEntryDeclsGo", "Vuna/Compiler/Driver/SplitGen.vuna:161"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dcheckModuleDeclName", ("Vuna.Compiler.Driver.SplitGen.checkModuleDeclName", "Vuna/Compiler/Driver/SplitGen.vuna:111"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dcheckModuleDeclNames", ("Vuna.Compiler.Driver.SplitGen.checkModuleDeclNames", "Vuna/Compiler/Driver/SplitGen.vuna:119"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dcheckModuleDecls", ("Vuna.Compiler.Driver.SplitGen.checkModuleDecls", "Vuna/Compiler/Driver/SplitGen.vuna:125"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dcheckResolvedModules", ("Vuna.Compiler.Driver.SplitGen.checkResolvedModules", "Vuna/Compiler/Driver/SplitGen.vuna:183"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_ddatasInUnit", ("Vuna.Compiler.Driver.SplitGen.datasInUnit", "Vuna/Compiler/Driver/SplitGen.vuna:53"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_ddefsInUnit", ("Vuna.Compiler.Driver.SplitGen.defsInUnit", "Vuna/Compiler/Driver/SplitGen.vuna:56"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_ddepsInOrder", ("Vuna.Compiler.Driver.SplitGen.depsInOrder", "Vuna/Compiler/Driver/SplitGen.vuna:83"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclIdentities", ("Vuna.Compiler.Driver.SplitGen.entryDeclIdentities", "Vuna/Compiler/Driver/SplitGen.vuna:135"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dentryDeclKey", ("Vuna.Compiler.Driver.SplitGen.entryDeclKey", "Vuna/Compiler/Driver/SplitGen.vuna:147"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dgenerateDtSplitProgram", ("Vuna.Compiler.Driver.SplitGen.generateDtSplitProgram", "Vuna/Compiler/Driver/SplitGen.vuna:223"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dgenerateDtSplitProgramWith", ("Vuna.Compiler.Driver.SplitGen.generateDtSplitProgramWith", "Vuna/Compiler/Driver/SplitGen.vuna:230"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dmainInitPrologue", ("Vuna.Compiler.Driver.SplitGen.mainInitPrologue", "Vuna/Compiler/Driver/SplitGen.vuna:37"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dmapToUnit", ("Vuna.Compiler.Driver.SplitGen.mapToUnit", "Vuna/Compiler/Driver/SplitGen.vuna:105"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dnoUnitLookup", ("Vuna.Compiler.Driver.SplitGen.noUnitLookup", "Vuna/Compiler/Driver/SplitGen.vuna:215"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dnoUnitStore", ("Vuna.Compiler.Driver.SplitGen.noUnitStore", "Vuna/Compiler/Driver/SplitGen.vuna:218"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_downerOfTbl", ("Vuna.Compiler.Driver.SplitGen.ownerOfTbl", "Vuna/Compiler/Driver/SplitGen.vuna:48"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_downerTblOf", ("Vuna.Compiler.Driver.SplitGen.ownerTblOf", "Vuna/Compiler/Driver/SplitGen.vuna:45"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dposOfName", ("Vuna.Compiler.Driver.SplitGen.posOfName", "Vuna/Compiler/Driver/SplitGen.vuna:65"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dposOfNameGo", ("Vuna.Compiler.Driver.SplitGen.posOfNameGo", "Vuna/Compiler/Driver/SplitGen.vuna:68"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dsplitLocPath", ("Vuna.Compiler.Driver.SplitGen.splitLocPath", "Vuna/Compiler/Driver/SplitGen.vuna:209"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dsplitMainFileWith", ("Vuna.Compiler.Driver.SplitGen.splitMainFileWith", "Vuna/Compiler/Driver/SplitGen.vuna:333"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dsplitModuleFilesWith", ("Vuna.Compiler.Driver.SplitGen.splitModuleFilesWith", "Vuna/Compiler/Driver/SplitGen.vuna:295"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dsplitProgramCheckedWith", ("Vuna.Compiler.Driver.SplitGen.splitProgramCheckedWith", "Vuna/Compiler/Driver/SplitGen.vuna:260"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dsplitProgramFilesWith", ("Vuna.Compiler.Driver.SplitGen.splitProgramFilesWith", "Vuna/Compiler/Driver/SplitGen.vuna:253"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dsplitStripDotSlash", ("Vuna.Compiler.Driver.SplitGen.splitStripDotSlash", "Vuna/Compiler/Driver/SplitGen.vuna:205"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dsplitStripPrefix", ("Vuna.Compiler.Driver.SplitGen.splitStripPrefix", "Vuna/Compiler/Driver/SplitGen.vuna:194"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dsplitStripRoots", ("Vuna.Compiler.Driver.SplitGen.splitStripRoots", "Vuna/Compiler/Driver/SplitGen.vuna:200"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dsplitUnitOfModule", ("Vuna.Compiler.Driver.SplitGen.splitUnitOfModule", "Vuna/Compiler/Driver/SplitGen.vuna:32"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dsplitWithOwnersWith", ("Vuna.Compiler.Driver.SplitGen.splitWithOwnersWith", "Vuna/Compiler/Driver/SplitGen.vuna:271"));
  ("v_Vuna_dCompiler_dDriver_dSplitGen_dunitDepsOf", ("Vuna.Compiler.Driver.SplitGen.unitDepsOf", "Vuna/Compiler/Driver/SplitGen.vuna:86"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dbgCalls", ("Vuna.Compiler.Driver.Split.bgCalls", "Vuna/Compiler/Driver/Split.vuna:220"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dbuildScript", ("Vuna.Compiler.Driver.Split.buildScript", "Vuna/Compiler/Driver/Split.vuna:130"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dcanonicalTopo", ("Vuna.Compiler.Driver.Split.canonicalTopo", "Vuna/Compiler/Driver/Split.vuna:319"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFile", ("Vuna.Compiler.Driver.Split.decSplitFile", "Vuna/Compiler/Driver/Split.vuna:353"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFileComplete", ("Vuna.Compiler.Driver.Split.decSplitFileComplete", "Vuna/Compiler/Driver/Split.vuna:371"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddecSplitFilesComplete", ("Vuna.Compiler.Driver.Split.decSplitFilesComplete", "Vuna/Compiler/Driver/Split.vuna:365"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddepsSuffix", ("Vuna.Compiler.Driver.Split.depsSuffix", "Vuna/Compiler/Driver/Split.vuna:230"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddepthEntryLess", ("Vuna.Compiler.Driver.Split.depthEntryLess", "Vuna/Compiler/Driver/Split.vuna:304"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddepthOfDeps", ("Vuna.Compiler.Driver.Split.depthOfDeps", "Vuna/Compiler/Driver/Split.vuna:105"));
  ("v_Vuna_dCompiler_dDriver_dSplit_ddepthOfUnit", ("Vuna.Compiler.Driver.Split.depthOfUnit", "Vuna/Compiler/Driver/Split.vuna:109"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dencSplitFile", ("Vuna.Compiler.Driver.Split.encSplitFile", "Vuna/Compiler/Driver/Split.vuna:350"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dencSplitFiles", ("Vuna.Compiler.Driver.Split.encSplitFiles", "Vuna/Compiler/Driver/Split.vuna:361"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dfilesOfDepthEntries", ("Vuna.Compiler.Driver.Split.filesOfDepthEntries", "Vuna/Compiler/Driver/Split.vuna:313"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dfixDepths", ("Vuna.Compiler.Driver.Split.fixDepths", "Vuna/Compiler/Driver/Split.vuna:296"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dgraphMaxDepth", ("Vuna.Compiler.Driver.Split.graphMaxDepth", "Vuna/Compiler/Driver/Split.vuna:114"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dgraphUnits", ("Vuna.Compiler.Driver.Split.graphUnits", "Vuna/Compiler/Driver/Split.vuna:204"));
  ("v_Vuna_dCompiler_dDriver_dSplit_djoinCmxs", ("Vuna.Compiler.Driver.Split.joinCmxs", "Vuna/Compiler/Driver/Split.vuna:234"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dlayerCalls", ("Vuna.Compiler.Driver.Split.layerCalls", "Vuna/Compiler/Driver/Split.vuna:213"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dlayerScripts", ("Vuna.Compiler.Driver.Split.layerScripts", "Vuna/Compiler/Driver/Split.vuna:209"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dmarkNames", ("Vuna.Compiler.Driver.Split.markNames", "Vuna/Compiler/Driver/Split.vuna:259"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dmaxDepth", ("Vuna.Compiler.Driver.Split.maxDepth", "Vuna/Compiler/Driver/Split.vuna:275"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dmaxInt", ("Vuna.Compiler.Driver.Split.maxInt", "Vuna/Compiler/Driver/Split.vuna:119"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dnameSetOf", ("Vuna.Compiler.Driver.Split.nameSetOf", "Vuna/Compiler/Driver/Split.vuna:254"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dnormalizeFileDeps", ("Vuna.Compiler.Driver.Split.normalizeFileDeps", "Vuna/Compiler/Driver/Split.vuna:339"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsameDepthTable", ("Vuna.Compiler.Driver.Split.sameDepthTable", "Vuna/Compiler/Driver/Split.vuna:291"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsortDepEntries", ("Vuna.Compiler.Driver.Split.sortDepEntries", "Vuna/Compiler/Driver/Split.vuna:336"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsortDepsByTie", ("Vuna.Compiler.Driver.Split.sortDepsByTie", "Vuna/Compiler/Driver/Split.vuna:333"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsortDepthEntries", ("Vuna.Compiler.Driver.Split.sortDepthEntries", "Vuna/Compiler/Driver/Split.vuna:309"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dspaceJoin", ("Vuna.Compiler.Driver.Split.spaceJoin", "Vuna/Compiler/Driver/Split.vuna:226"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsplitDeps", ("Vuna.Compiler.Driver.Split.splitDeps", "Vuna/Compiler/Driver/Split.vuna:37"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsplitDepths", ("Vuna.Compiler.Driver.Split.splitDepths", "Vuna/Compiler/Driver/Split.vuna:99"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsplitGraph", ("Vuna.Compiler.Driver.Split.splitGraph", "Vuna/Compiler/Driver/Split.vuna:76"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsplitLayers", ("Vuna.Compiler.Driver.Split.splitLayers", "Vuna/Compiler/Driver/Split.vuna:90"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsplitName", ("Vuna.Compiler.Driver.Split.splitName", "Vuna/Compiler/Driver/Split.vuna:30"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dsplitText", ("Vuna.Compiler.Driver.Split.splitText", "Vuna/Compiler/Driver/Split.vuna:33"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dstampWrites", ("Vuna.Compiler.Driver.Split.stampWrites", "Vuna/Compiler/Driver/Split.vuna:199"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dstepDepths", ("Vuna.Compiler.Driver.Split.stepDepths", "Vuna/Compiler/Driver/Split.vuna:283"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dstripMl", ("Vuna.Compiler.Driver.Split.stripMl", "Vuna/Compiler/Driver/Split.vuna:84"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dtieOf", ("Vuna.Compiler.Driver.Split.tieOf", "Vuna/Compiler/Driver/Split.vuna:268"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dtieTableOf", ("Vuna.Compiler.Driver.Split.tieTableOf", "Vuna/Compiler/Driver/Split.vuna:263"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dunitTieKey", ("Vuna.Compiler.Driver.Split.unitTieKey", "Vuna/Compiler/Driver/Split.vuna:250"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFiles", ("Vuna.Compiler.Driver.Split.writeSplitFiles", "Vuna/Compiler/Driver/Split.vuna:41"));
  ("v_Vuna_dCompiler_dDriver_dSplit_dwriteSplitFilesIfChanged", ("Vuna.Compiler.Driver.Split.writeSplitFilesIfChanged", "Vuna/Compiler/Driver/Split.vuna:52"));
  ("v_Vuna_dCompiler_dDriver_dToolPayload_ddecToolContextComplete", ("Vuna.Compiler.Driver.ToolPayload.decToolContextComplete", "Vuna/Compiler/Driver/ToolPayload.vuna:48"));
  ("v_Vuna_dCompiler_dDriver_dToolPayload_ddecToolContextPayload", ("Vuna.Compiler.Driver.ToolPayload.decToolContextPayload", "Vuna/Compiler/Driver/ToolPayload.vuna:53"));
  ("v_Vuna_dCompiler_dDriver_dToolPayload_dencToolContext", ("Vuna.Compiler.Driver.ToolPayload.encToolContext", "Vuna/Compiler/Driver/ToolPayload.vuna:44"));
  ("v_Vuna_dCompiler_dDriver_dToolPayload_dencToolContextPayload", ("Vuna.Compiler.Driver.ToolPayload.encToolContextPayload", "Vuna/Compiler/Driver/ToolPayload.vuna:34"));
  ("v_Vuna_dCompiler_dDriver_dToolPayload_dtoolContextCodec", ("Vuna.Compiler.Driver.ToolPayload.toolContextCodec", "Vuna/Compiler/Driver/ToolPayload.vuna:31"));
  ("v_Vuna_dCompiler_dDriver_dToolPayload_dtoolContextSchema", ("Vuna.Compiler.Driver.ToolPayload.toolContextSchema", "Vuna/Compiler/Driver/ToolPayload.vuna:27"));
  ("v_Vuna_dCompiler_dDriver_dWasm_dcompileWasm", ("Vuna.Compiler.Driver.Wasm.compileWasm", "Vuna/Compiler/Driver/Wasm.vuna:28"));
  ("v_Vuna_dCompiler_dDriver_dWasm_dwasmErrDiag", ("Vuna.Compiler.Driver.Wasm.wasmErrDiag", "Vuna/Compiler/Driver/Wasm.vuna:25"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecBinder", ("Vuna.Compiler.Elab.Canonical.decBinder", "Vuna/Compiler/Elab/Canonical.vuna:164"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecDtClass", ("Vuna.Compiler.Elab.Canonical.decDtClass", "Vuna/Compiler/Elab/Canonical.vuna:231"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecDtCtor", ("Vuna.Compiler.Elab.Canonical.decDtCtor", "Vuna/Compiler/Elab/Canonical.vuna:187"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecDtData", ("Vuna.Compiler.Elab.Canonical.decDtData", "Vuna/Compiler/Elab/Canonical.vuna:199"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecDtDef", ("Vuna.Compiler.Elab.Canonical.decDtDef", "Vuna/Compiler/Elab/Canonical.vuna:205"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecDtDefs", ("Vuna.Compiler.Elab.Canonical.decDtDefs", "Vuna/Compiler/Elab/Canonical.vuna:221"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecDtDefsComplete", ("Vuna.Compiler.Elab.Canonical.decDtDefsComplete", "Vuna/Compiler/Elab/Canonical.vuna:283"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecDtFieldMeta", ("Vuna.Compiler.Elab.Canonical.decDtFieldMeta", "Vuna/Compiler/Elab/Canonical.vuna:193"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecDtInst", ("Vuna.Compiler.Elab.Canonical.decDtInst", "Vuna/Compiler/Elab/Canonical.vuna:225"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecExportEntries", ("Vuna.Compiler.Elab.Canonical.decExportEntries", "Vuna/Compiler/Elab/Canonical.vuna:243"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecExportEntry", ("Vuna.Compiler.Elab.Canonical.decExportEntry", "Vuna/Compiler/Elab/Canonical.vuna:237"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecFixities", ("Vuna.Compiler.Elab.Canonical.decFixities", "Vuna/Compiler/Elab/Canonical.vuna:253"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecFixity", ("Vuna.Compiler.Elab.Canonical.decFixity", "Vuna/Compiler/Elab/Canonical.vuna:247"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecImport", ("Vuna.Compiler.Elab.Canonical.decImport", "Vuna/Compiler/Elab/Canonical.vuna:257"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecImports", ("Vuna.Compiler.Elab.Canonical.decImports", "Vuna/Compiler/Elab/Canonical.vuna:263"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecRecordFieldMeta", ("Vuna.Compiler.Elab.Canonical.decRecordFieldMeta", "Vuna/Compiler/Elab/Canonical.vuna:267"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecRecordMeta", ("Vuna.Compiler.Elab.Canonical.decRecordMeta", "Vuna/Compiler/Elab/Canonical.vuna:273"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecRecordMetas", ("Vuna.Compiler.Elab.Canonical.decRecordMetas", "Vuna/Compiler/Elab/Canonical.vuna:279"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecReprTier", ("Vuna.Compiler.Elab.Canonical.decReprTier", "Vuna/Compiler/Elab/Canonical.vuna:177"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecSpan", ("Vuna.Compiler.Elab.Canonical.decSpan", "Vuna/Compiler/Elab/Canonical.vuna:67"));
  ("v_Vuna_dCompiler_dElab_dCanonical_ddecTelePair", ("Vuna.Compiler.Elab.Canonical.decTelePair", "Vuna/Compiler/Elab/Canonical.vuna:171"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencBinder", ("Vuna.Compiler.Elab.Canonical.encBinder", "Vuna/Compiler/Elab/Canonical.vuna:102"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencDtClass", ("Vuna.Compiler.Elab.Canonical.encDtClass", "Vuna/Compiler/Elab/Canonical.vuna:92"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencDtClassSem", ("Vuna.Compiler.Elab.Canonical.encDtClassSem", "Vuna/Compiler/Elab/Canonical.vuna:86"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencDtCtor", ("Vuna.Compiler.Elab.Canonical.encDtCtor", "Vuna/Compiler/Elab/Canonical.vuna:37"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencDtData", ("Vuna.Compiler.Elab.Canonical.encDtData", "Vuna/Compiler/Elab/Canonical.vuna:46"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencDtDef", ("Vuna.Compiler.Elab.Canonical.encDtDef", "Vuna/Compiler/Elab/Canonical.vuna:52"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencDtDefs", ("Vuna.Compiler.Elab.Canonical.encDtDefs", "Vuna/Compiler/Elab/Canonical.vuna:58"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencDtFieldMeta", ("Vuna.Compiler.Elab.Canonical.encDtFieldMeta", "Vuna/Compiler/Elab/Canonical.vuna:42"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencDtInst", ("Vuna.Compiler.Elab.Canonical.encDtInst", "Vuna/Compiler/Elab/Canonical.vuna:81"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencDtInstSem", ("Vuna.Compiler.Elab.Canonical.encDtInstSem", "Vuna/Compiler/Elab/Canonical.vuna:76"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencExportEntries", ("Vuna.Compiler.Elab.Canonical.encExportEntries", "Vuna/Compiler/Elab/Canonical.vuna:123"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencExportEntry", ("Vuna.Compiler.Elab.Canonical.encExportEntry", "Vuna/Compiler/Elab/Canonical.vuna:119"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencFixities", ("Vuna.Compiler.Elab.Canonical.encFixities", "Vuna/Compiler/Elab/Canonical.vuna:133"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencFixity", ("Vuna.Compiler.Elab.Canonical.encFixity", "Vuna/Compiler/Elab/Canonical.vuna:127"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencImport", ("Vuna.Compiler.Elab.Canonical.encImport", "Vuna/Compiler/Elab/Canonical.vuna:137"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencImports", ("Vuna.Compiler.Elab.Canonical.encImports", "Vuna/Compiler/Elab/Canonical.vuna:142"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencMaybeSpan", ("Vuna.Compiler.Elab.Canonical.encMaybeSpan", "Vuna/Compiler/Elab/Canonical.vuna:72"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencMaybeTerm", ("Vuna.Compiler.Elab.Canonical.encMaybeTerm", "Vuna/Compiler/Elab/Canonical.vuna:106"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencRecordFieldMeta", ("Vuna.Compiler.Elab.Canonical.encRecordFieldMeta", "Vuna/Compiler/Elab/Canonical.vuna:146"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencRecordMeta", ("Vuna.Compiler.Elab.Canonical.encRecordMeta", "Vuna/Compiler/Elab/Canonical.vuna:151"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencRecordMetas", ("Vuna.Compiler.Elab.Canonical.encRecordMetas", "Vuna/Compiler/Elab/Canonical.vuna:157"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencReprTier", ("Vuna.Compiler.Elab.Canonical.encReprTier", "Vuna/Compiler/Elab/Canonical.vuna:110"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencSpan", ("Vuna.Compiler.Elab.Canonical.encSpan", "Vuna/Compiler/Elab/Canonical.vuna:62"));
  ("v_Vuna_dCompiler_dElab_dCanonical_dencTelePair", ("Vuna.Compiler.Elab.Canonical.encTelePair", "Vuna/Compiler/Elab/Canonical.vuna:98"));
  ("v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiable", ("Vuna.Compiler.Elab.Case.allCtorsUnsatisfiable", "Vuna/Compiler/Elab/Case.vuna:313"));
  ("v_Vuna_dCompiler_dElab_dCase_dallCtorsUnsatisfiableGo", ("Vuna.Compiler.Elab.Case.allCtorsUnsatisfiableGo", "Vuna/Compiler/Elab/Case.vuna:316"));
  ("v_Vuna_dCompiler_dElab_dCase_daltNames", ("Vuna.Compiler.Elab.Case.altNames", "Vuna/Compiler/Elab/Case.vuna:519"));
  ("v_Vuna_dCompiler_dElab_dCase_danyNestedArg", ("Vuna.Compiler.Elab.Case.anyNestedArg", "Vuna/Compiler/Elab/Case.vuna:544"));
  ("v_Vuna_dCompiler_dElab_dCase_danyNestedPat", ("Vuna.Compiler.Elab.Case.anyNestedPat", "Vuna/Compiler/Elab/Case.vuna:536"));
  ("v_Vuna_dCompiler_dElab_dCase_dbindCtorField", ("Vuna.Compiler.Elab.Case.bindCtorField", "Vuna/Compiler/Elab/Case.vuna:350"));
  ("v_Vuna_dCompiler_dElab_dCase_dbindCtorGo", ("Vuna.Compiler.Elab.Case.bindCtorGo", "Vuna/Compiler/Elab/Case.vuna:331"));
  ("v_Vuna_dCompiler_dElab_dCase_dbindCtorTele", ("Vuna.Compiler.Elab.Case.bindCtorTele", "Vuna/Compiler/Elab/Case.vuna:328"));
  ("v_Vuna_dCompiler_dElab_dCase_dbranchAfterUnify", ("Vuna.Compiler.Elab.Case.branchAfterUnify", "Vuna/Compiler/Elab/Case.vuna:250"));
  ("v_Vuna_dCompiler_dElab_dCase_dbranchIsReachable", ("Vuna.Compiler.Elab.Case.branchIsReachable", "Vuna/Compiler/Elab/Case.vuna:245"));
  ("v_Vuna_dCompiler_dElab_dCase_dbranchReachable", ("Vuna.Compiler.Elab.Case.branchReachable", "Vuna/Compiler/Elab/Case.vuna:263"));
  ("v_Vuna_dCompiler_dElab_dCase_dbranchRemovalSpan", ("Vuna.Compiler.Elab.Case.branchRemovalSpan", "Vuna/Compiler/Elab/Case.vuna:584"));
  ("v_Vuna_dCompiler_dElab_dCase_dbranchVerdict", ("Vuna.Compiler.Elab.Case.branchVerdict", "Vuna/Compiler/Elab/Case.vuna:255"));
  ("v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsFlat", ("Vuna.Compiler.Elab.Case.checkCaseAltsFlat", "Vuna/Compiler/Elab/Case.vuna:463"));
  ("v_Vuna_dCompiler_dElab_dCase_dcheckCaseAltsGo", ("Vuna.Compiler.Elab.Case.checkCaseAltsGo", "Vuna/Compiler/Elab/Case.vuna:466"));
  ("v_Vuna_dCompiler_dElab_dCase_dcheckCaseDone", ("Vuna.Compiler.Elab.Case.checkCaseDone", "Vuna/Compiler/Elab/Case.vuna:576"));
  ("v_Vuna_dCompiler_dElab_dCase_dcheckCatchAll", ("Vuna.Compiler.Elab.Case.checkCatchAll", "Vuna/Compiler/Elab/Case.vuna:499"));
  ("v_Vuna_dCompiler_dElab_dCase_dcheckCoverage", ("Vuna.Compiler.Elab.Case.checkCoverage", "Vuna/Compiler/Elab/Case.vuna:558"));
  ("v_Vuna_dCompiler_dElab_dCase_dcheckCovered", ("Vuna.Compiler.Elab.Case.checkCovered", "Vuna/Compiler/Elab/Case.vuna:562"));
  ("v_Vuna_dCompiler_dElab_dCase_dctorExplicitArity", ("Vuna.Compiler.Elab.Case.ctorExplicitArity", "Vuna/Compiler/Elab/Case.vuna:270"));
  ("v_Vuna_dCompiler_dElab_dCase_dctorHeadCovered", ("Vuna.Compiler.Elab.Case.ctorHeadCovered", "Vuna/Compiler/Elab/Case.vuna:425"));
  ("v_Vuna_dCompiler_dElab_dCase_dctorResultTerms", ("Vuna.Compiler.Elab.Case.ctorResultTerms", "Vuna/Compiler/Elab/Case.vuna:375"));
  ("v_Vuna_dCompiler_dElab_dCase_dctorResultVals", ("Vuna.Compiler.Elab.Case.ctorResultVals", "Vuna/Compiler/Elab/Case.vuna:362"));
  ("v_Vuna_dCompiler_dElab_dCase_dctorResultValsIn", ("Vuna.Compiler.Elab.Case.ctorResultValsIn", "Vuna/Compiler/Elab/Case.vuna:372"));
  ("v_Vuna_dCompiler_dElab_dCase_dctorValueIn", ("Vuna.Compiler.Elab.Case.ctorValueIn", "Vuna/Compiler/Elab/Case.vuna:382"));
  ("v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinder", ("Vuna.Compiler.Elab.Case.ctxHasEmptyBinder", "Vuna/Compiler/Elab/Case.vuna:276"));
  ("v_Vuna_dCompiler_dElab_dCase_dctxHasEmptyBinderAt", ("Vuna.Compiler.Elab.Case.ctxHasEmptyBinderAt", "Vuna/Compiler/Elab/Case.vuna:279"));
  ("v_Vuna_dCompiler_dElab_dCase_dfreshTeleVals", ("Vuna.Compiler.Elab.Case.freshTeleVals", "Vuna/Compiler/Elab/Case.vuna:357"));
  ("v_Vuna_dCompiler_dElab_dCase_dhasCatchAll", ("Vuna.Compiler.Elab.Case.hasCatchAll", "Vuna/Compiler/Elab/Case.vuna:525"));
  ("v_Vuna_dCompiler_dElab_dCase_dhasLitHead", ("Vuna.Compiler.Elab.Case.hasLitHead", "Vuna/Compiler/Elab/Case.vuna:509"));
  ("v_Vuna_dCompiler_dElab_dCase_didxFuelFor", ("Vuna.Compiler.Elab.Case.idxFuelFor", "Vuna/Compiler/Elab/Case.vuna:60"));
  ("v_Vuna_dCompiler_dElab_dCase_didxFuelMax", ("Vuna.Compiler.Elab.Case.idxFuelMax", "Vuna/Compiler/Elab/Case.vuna:66"));
  ("v_Vuna_dCompiler_dElab_dCase_didxIsNatCtor", ("Vuna.Compiler.Elab.Case.idxIsNatCtor", "Vuna/Compiler/Elab/Case.vuna:97"));
  ("v_Vuna_dCompiler_dElab_dCase_didxIsNatHead", ("Vuna.Compiler.Elab.Case.idxIsNatHead", "Vuna/Compiler/Elab/Case.vuna:89"));
  ("v_Vuna_dCompiler_dElab_dCase_didxIsNatSuccHead", ("Vuna.Compiler.Elab.Case.idxIsNatSuccHead", "Vuna/Compiler/Elab/Case.vuna:120"));
  ("v_Vuna_dCompiler_dElab_dCase_didxNatDepthNear", ("Vuna.Compiler.Elab.Case.idxNatDepthNear", "Vuna/Compiler/Elab/Case.vuna:79"));
  ("v_Vuna_dCompiler_dElab_dCase_didxNatDepthOfList", ("Vuna.Compiler.Elab.Case.idxNatDepthOfList", "Vuna/Compiler/Elab/Case.vuna:69"));
  ("v_Vuna_dCompiler_dElab_dCase_didxNatPrefixDepth", ("Vuna.Compiler.Elab.Case.idxNatPrefixDepth", "Vuna/Compiler/Elab/Case.vuna:101"));
  ("v_Vuna_dCompiler_dElab_dCase_didxNatPrefixGo", ("Vuna.Compiler.Elab.Case.idxNatPrefixGo", "Vuna/Compiler/Elab/Case.vuna:104"));
  ("v_Vuna_dCompiler_dElab_dCase_disEmptyFamilyValue", ("Vuna.Compiler.Elab.Case.isEmptyFamilyValue", "Vuna/Compiler/Elab/Case.vuna:287"));
  ("v_Vuna_dCompiler_dElab_dCase_disRigidVal", ("Vuna.Compiler.Elab.Case.isRigidVal", "Vuna/Compiler/Elab/Case.vuna:304"));
  ("v_Vuna_dCompiler_dElab_dCase_dlitHeadCovered", ("Vuna.Compiler.Elab.Case.litHeadCovered", "Vuna/Compiler/Elab/Case.vuna:431"));
  ("v_Vuna_dCompiler_dElab_dCase_dlitLabel", ("Vuna.Compiler.Elab.Case.litLabel", "Vuna/Compiler/Elab/Case.vuna:444"));
  ("v_Vuna_dCompiler_dElab_dCase_dlitPatEq", ("Vuna.Compiler.Elab.Case.litPatEq", "Vuna/Compiler/Elab/Case.vuna:435"));
  ("v_Vuna_dCompiler_dElab_dCase_dmissingCtors", ("Vuna.Compiler.Elab.Case.missingCtors", "Vuna/Compiler/Elab/Case.vuna:568"));
  ("v_Vuna_dCompiler_dElab_dCase_dnestedInPat", ("Vuna.Compiler.Elab.Case.nestedInPat", "Vuna/Compiler/Elab/Case.vuna:540"));
  ("v_Vuna_dCompiler_dElab_dCase_doccursFreshLevel", ("Vuna.Compiler.Elab.Case.occursFreshLevel", "Vuna/Compiler/Elab/Case.vuna:184"));
  ("v_Vuna_dCompiler_dElab_dCase_doccursFuel", ("Vuna.Compiler.Elab.Case.occursFuel", "Vuna/Compiler/Elab/Case.vuna:194"));
  ("v_Vuna_dCompiler_dElab_dCase_doccursLevel", ("Vuna.Compiler.Elab.Case.occursLevel", "Vuna/Compiler/Elab/Case.vuna:154"));
  ("v_Vuna_dCompiler_dElab_dCase_doccursLevelList", ("Vuna.Compiler.Elab.Case.occursLevelList", "Vuna/Compiler/Elab/Case.vuna:187"));
  ("v_Vuna_dCompiler_dElab_dCase_dpatIrrefutable", ("Vuna.Compiler.Elab.Case.patIrrefutable", "Vuna/Compiler/Elab/Case.vuna:416"));
  ("v_Vuna_dCompiler_dElab_dCase_dpatsAllIrrefutable", ("Vuna.Compiler.Elab.Case.patsAllIrrefutable", "Vuna/Compiler/Elab/Case.vuna:421"));
  ("v_Vuna_dCompiler_dElab_dCase_dreflectScrutinee", ("Vuna.Compiler.Elab.Case.reflectScrutinee", "Vuna/Compiler/Elab/Case.vuna:399"));
  ("v_Vuna_dCompiler_dElab_dCase_dremoveBranchSuggest", ("Vuna.Compiler.Elab.Case.removeBranchSuggest", "Vuna/Compiler/Elab/Case.vuna:590"));
  ("v_Vuna_dCompiler_dElab_dCase_drigidIdxVals", ("Vuna.Compiler.Elab.Case.rigidIdxVals", "Vuna/Compiler/Elab/Case.vuna:300"));
  ("v_Vuna_dCompiler_dElab_dCase_dstripAsPat", ("Vuna.Compiler.Elab.Case.stripAsPat", "Vuna/Compiler/Elab/Case.vuna:453"));
  ("v_Vuna_dCompiler_dElab_dCase_dstripAsPats", ("Vuna.Compiler.Elab.Case.stripAsPats", "Vuna/Compiler/Elab/Case.vuna:458"));
  ("v_Vuna_dCompiler_dElab_dCase_dteleValsFrom", ("Vuna.Compiler.Elab.Case.teleValsFrom", "Vuna/Compiler/Elab/Case.vuna:387"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyErr", ("Vuna.Compiler.Elab.Case.unifyErr", "Vuna/Compiler/Elab/Case.vuna:36"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyIdx", ("Vuna.Compiler.Elab.Case.unifyIdx", "Vuna/Compiler/Elab/Case.vuna:128"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyIdxConv", ("Vuna.Compiler.Elab.Case.unifyIdxConv", "Vuna/Compiler/Elab/Case.vuna:226"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyIdxList", ("Vuna.Compiler.Elab.Case.unifyIdxList", "Vuna/Compiler/Elab/Case.vuna:39"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyIdxListGo", ("Vuna.Compiler.Elab.Case.unifyIdxListGo", "Vuna/Compiler/Elab/Case.vuna:43"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyIdxListSized", ("Vuna.Compiler.Elab.Case.unifyIdxListSized", "Vuna/Compiler/Elab/Case.vuna:57"));
  ("v_Vuna_dCompiler_dElab_dCase_dunifyIdxRigid", ("Vuna.Compiler.Elab.Case.unifyIdxRigid", "Vuna/Compiler/Elab/Case.vuna:198"));
  ("v_Vuna_dCompiler_dElab_dCase_dwildArgs", ("Vuna.Compiler.Elab.Case.wildArgs", "Vuna/Compiler/Elab/Case.vuna:266"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dallSameLen", ("Vuna.Compiler.Elab.Coverage.allSameLen", "Vuna/Compiler/Elab/Coverage.vuna:165"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dconcatMapRow", ("Vuna.Compiler.Elab.Coverage.concatMapRow", "Vuna/Compiler/Elab/Coverage.vuna:73"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dcoverageWitness", ("Vuna.Compiler.Elab.Coverage.coverageWitness", "Vuna/Compiler/Elab/Coverage.vuna:126"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dctorHeadsOf", ("Vuna.Compiler.Elab.Coverage.ctorHeadsOf", "Vuna/Compiler/Elab/Coverage.vuna:52"));
  ("v_Vuna_dCompiler_dElab_dCoverage_ddefaultRows", ("Vuna.Compiler.Elab.Coverage.defaultRows", "Vuna/Compiler/Elab/Coverage.vuna:63"));
  ("v_Vuna_dCompiler_dElab_dCoverage_ddropPats", ("Vuna.Compiler.Elab.Coverage.dropPats", "Vuna/Compiler/Elab/Coverage.vuna:114"));
  ("v_Vuna_dCompiler_dElab_dCoverage_demptyPatSpan", ("Vuna.Compiler.Elab.Coverage.emptyPatSpan", "Vuna/Compiler/Elab/Coverage.vuna:33"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dfamilyCtors", ("Vuna.Compiler.Elab.Coverage.familyCtors", "Vuna/Compiler/Elab/Coverage.vuna:96"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dhasNilRow", ("Vuna.Compiler.Elab.Coverage.hasNilRow", "Vuna/Compiler/Elab/Coverage.vuna:85"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dheadCtorName", ("Vuna.Compiler.Elab.Coverage.headCtorName", "Vuna/Compiler/Elab/Coverage.vuna:45"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dimproveDiag", ("Vuna.Compiler.Elab.Coverage.improveDiag", "Vuna/Compiler/Elab/Coverage.vuna:185"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dimproveExhaustive", ("Vuna.Compiler.Elab.Coverage.improveExhaustive", "Vuna/Compiler/Elab/Coverage.vuna:181"));
  ("v_Vuna_dCompiler_dElab_dCoverage_disWildHead", ("Vuna.Compiler.Elab.Coverage.isWildHead", "Vuna/Compiler/Elab/Coverage.vuna:56"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dlookupEntry", ("Vuna.Compiler.Elab.Coverage.lookupEntry", "Vuna/Compiler/Elab/Coverage.vuna:91"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dmatrixArity", ("Vuna.Compiler.Elab.Coverage.matrixArity", "Vuna/Compiler/Elab/Coverage.vuna:169"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dmatrixWitness", ("Vuna.Compiler.Elab.Coverage.matrixWitness", "Vuna/Compiler/Elab/Coverage.vuna:155"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dorderedCtors", ("Vuna.Compiler.Elab.Coverage.orderedCtors", "Vuna/Compiler/Elab/Coverage.vuna:103"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dpatHead", ("Vuna.Compiler.Elab.Coverage.patHead", "Vuna/Compiler/Elab/Coverage.vuna:41"));
  ("v_Vuna_dCompiler_dElab_dCoverage_drenderPat", ("Vuna.Compiler.Elab.Coverage.renderPat", "Vuna/Compiler/Elab/Coverage.vuna:205"));
  ("v_Vuna_dCompiler_dElab_dCoverage_drenderPatIn", ("Vuna.Compiler.Elab.Coverage.renderPatIn", "Vuna/Compiler/Elab/Coverage.vuna:208"));
  ("v_Vuna_dCompiler_dElab_dCoverage_drenderWitness", ("Vuna.Compiler.Elab.Coverage.renderWitness", "Vuna/Compiler/Elab/Coverage.vuna:223"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dspecializeCtor", ("Vuna.Compiler.Elab.Coverage.specializeCtor", "Vuna/Compiler/Elab/Coverage.vuna:70"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dspecializeRow", ("Vuna.Compiler.Elab.Coverage.specializeRow", "Vuna/Compiler/Elab/Coverage.vuna:77"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dtakePats", ("Vuna.Compiler.Elab.Coverage.takePats", "Vuna/Compiler/Elab/Coverage.vuna:108"));
  ("v_Vuna_dCompiler_dElab_dCoverage_duniformArity", ("Vuna.Compiler.Elab.Coverage.uniformArity", "Vuna/Compiler/Elab/Coverage.vuna:161"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dwilds", ("Vuna.Compiler.Elab.Coverage.wilds", "Vuna/Compiler/Elab/Coverage.vuna:37"));
  ("v_Vuna_dCompiler_dElab_dCoverage_dwitnessNamesCtor", ("Vuna.Compiler.Elab.Coverage.witnessNamesCtor", "Vuna/Compiler/Elab/Coverage.vuna:197"));
  ("v_Vuna_dCompiler_dElab_dData_dcandidateNames", ("Vuna.Compiler.Elab.Data.candidateNames", "Vuna/Compiler/Elab/Data.vuna:410"));
  ("v_Vuna_dCompiler_dElab_dData_dcandidateOf", ("Vuna.Compiler.Elab.Data.candidateOf", "Vuna/Compiler/Elab/Data.vuna:407"));
  ("v_Vuna_dCompiler_dElab_dData_dcheckCtorFieldSorts", ("Vuna.Compiler.Elab.Data.checkCtorFieldSorts", "Vuna/Compiler/Elab/Data.vuna:74"));
  ("v_Vuna_dCompiler_dElab_dData_dcheckViaDataDecls", ("Vuna.Compiler.Elab.Data.checkViaDataDecls", "Vuna/Compiler/Elab/Data.vuna:271"));
  ("v_Vuna_dCompiler_dElab_dData_dcheckViaDataDeclsGo", ("Vuna.Compiler.Elab.Data.checkViaDataDeclsGo", "Vuna/Compiler/Elab/Data.vuna:275"));
  ("v_Vuna_dCompiler_dElab_dData_dcountSurfacePis", ("Vuna.Compiler.Elab.Data.countSurfacePis", "Vuna/Compiler/Elab/Data.vuna:85"));
  ("v_Vuna_dCompiler_dElab_dData_dcountTelePis", ("Vuna.Compiler.Elab.Data.countTelePis", "Vuna/Compiler/Elab/Data.vuna:91"));
  ("v_Vuna_dCompiler_dElab_dData_dctorFieldGo", ("Vuna.Compiler.Elab.Data.ctorFieldGo", "Vuna/Compiler/Elab/Data.vuna:358"));
  ("v_Vuna_dCompiler_dElab_dData_dctorFieldSortsBinder", ("Vuna.Compiler.Elab.Data.ctorFieldSortsBinder", "Vuna/Compiler/Elab/Data.vuna:102"));
  ("v_Vuna_dCompiler_dElab_dData_dctorFieldSortsGo", ("Vuna.Compiler.Elab.Data.ctorFieldSortsGo", "Vuna/Compiler/Elab/Data.vuna:95"));
  ("v_Vuna_dCompiler_dElab_dData_dctorFieldTerms", ("Vuna.Compiler.Elab.Data.ctorFieldTerms", "Vuna/Compiler/Elab/Data.vuna:355"));
  ("v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecord", ("Vuna.Compiler.Elab.Data.dtFieldsOfRecord", "Vuna/Compiler/Elab/Data.vuna:179"));
  ("v_Vuna_dCompiler_dElab_dData_ddtFieldsOfRecordGo", ("Vuna.Compiler.Elab.Data.dtFieldsOfRecordGo", "Vuna/Compiler/Elab/Data.vuna:190"));
  ("v_Vuna_dCompiler_dElab_dData_delabCtor", ("Vuna.Compiler.Elab.Data.elabCtor", "Vuna/Compiler/Elab/Data.vuna:25"));
  ("v_Vuna_dCompiler_dElab_dData_delabCtors", ("Vuna.Compiler.Elab.Data.elabCtors", "Vuna/Compiler/Elab/Data.vuna:51"));
  ("v_Vuna_dCompiler_dElab_dData_delabDataBodies", ("Vuna.Compiler.Elab.Data.elabDataBodies", "Vuna/Compiler/Elab/Data.vuna:198"));
  ("v_Vuna_dCompiler_dElab_dData_delabDataHead", ("Vuna.Compiler.Elab.Data.elabDataHead", "Vuna/Compiler/Elab/Data.vuna:121"));
  ("v_Vuna_dCompiler_dElab_dData_delabDataHeads", ("Vuna.Compiler.Elab.Data.elabDataHeads", "Vuna/Compiler/Elab/Data.vuna:155"));
  ("v_Vuna_dCompiler_dElab_dData_delabDataHeadsFuel", ("Vuna.Compiler.Elab.Data.elabDataHeadsFuel", "Vuna/Compiler/Elab/Data.vuna:158"));
  ("v_Vuna_dCompiler_dElab_dData_delabDataHeadsNoProgress", ("Vuna.Compiler.Elab.Data.elabDataHeadsNoProgress", "Vuna/Compiler/Elab/Data.vuna:170"));
  ("v_Vuna_dCompiler_dElab_dData_delabDataHeadsRound", ("Vuna.Compiler.Elab.Data.elabDataHeadsRound", "Vuna/Compiler/Elab/Data.vuna:148"));
  ("v_Vuna_dCompiler_dElab_dData_delabDatas", ("Vuna.Compiler.Elab.Data.elabDatas", "Vuna/Compiler/Elab/Data.vuna:319"));
  ("v_Vuna_dCompiler_dElab_dData_deraseIndexMask", ("Vuna.Compiler.Elab.Data.eraseIndexMask", "Vuna/Compiler/Elab/Data.vuna:336"));
  ("v_Vuna_dCompiler_dElab_dData_deraseMaskGo", ("Vuna.Compiler.Elab.Data.eraseMaskGo", "Vuna/Compiler/Elab/Data.vuna:339"));
  ("v_Vuna_dCompiler_dElab_dData_dindexErasureCandidates", ("Vuna.Compiler.Elab.Data.indexErasureCandidates", "Vuna/Compiler/Elab/Data.vuna:403"));
  ("v_Vuna_dCompiler_dElab_dData_dkindResultLevel", ("Vuna.Compiler.Elab.Data.kindResultLevel", "Vuna/Compiler/Elab/Data.vuna:63"));
  ("v_Vuna_dCompiler_dElab_dData_dparamUsedInFieldTys", ("Vuna.Compiler.Elab.Data.paramUsedInFieldTys", "Vuna/Compiler/Elab/Data.vuna:344"));
  ("v_Vuna_dCompiler_dElab_dData_dreprIsAlias", ("Vuna.Compiler.Elab.Data.reprIsAlias", "Vuna/Compiler/Elab/Data.vuna:299"));
  ("v_Vuna_dCompiler_dElab_dData_dsameCtorSet", ("Vuna.Compiler.Elab.Data.sameCtorSet", "Vuna/Compiler/Elab/Data.vuna:261"));
  ("v_Vuna_dCompiler_dElab_dData_dskipParamPis", ("Vuna.Compiler.Elab.Data.skipParamPis", "Vuna/Compiler/Elab/Data.vuna:186"));
  ("v_Vuna_dCompiler_dElab_dData_dtermUsesVar", ("Vuna.Compiler.Elab.Data.termUsesVar", "Vuna/Compiler/Elab/Data.vuna:370"));
  ("v_Vuna_dCompiler_dElab_dData_dtermUsesVarAlts", ("Vuna.Compiler.Elab.Data.termUsesVarAlts", "Vuna/Compiler/Elab/Data.vuna:397"));
  ("v_Vuna_dCompiler_dElab_dData_dtermUsesVarArgs", ("Vuna.Compiler.Elab.Data.termUsesVarArgs", "Vuna/Compiler/Elab/Data.vuna:393"));
  ("v_Vuna_dCompiler_dElab_dData_dusedInCtor", ("Vuna.Compiler.Elab.Data.usedInCtor", "Vuna/Compiler/Elab/Data.vuna:351"));
  ("v_Vuna_dCompiler_dElab_dData_dusedInCtors", ("Vuna.Compiler.Elab.Data.usedInCtors", "Vuna/Compiler/Elab/Data.vuna:347"));
  ("v_Vuna_dCompiler_dElab_dData_dusedInTele", ("Vuna.Compiler.Elab.Data.usedInTele", "Vuna/Compiler/Elab/Data.vuna:363"));
  ("v_Vuna_dCompiler_dElab_dData_dusedInTeleGo", ("Vuna.Compiler.Elab.Data.usedInTeleGo", "Vuna/Compiler/Elab/Data.vuna:366"));
  ("v_Vuna_dCompiler_dElab_dData_dviaFieldOk", ("Vuna.Compiler.Elab.Data.viaFieldOk", "Vuna/Compiler/Elab/Data.vuna:293"));
  ("v_Vuna_dCompiler_dElab_dData_dviaShapeOk", ("Vuna.Compiler.Elab.Data.viaShapeOk", "Vuna/Compiler/Elab/Data.vuna:306"));
  ("v_Vuna_dCompiler_dElab_dData_dviaShapeOkWith", ("Vuna.Compiler.Elab.Data.viaShapeOkWith", "Vuna/Compiler/Elab/Data.vuna:309"));
  ("v_Vuna_dCompiler_dElab_dDerive_danyCtorMentions", ("Vuna.Compiler.Elab.Derive.anyCtorMentions", "Vuna/Compiler/Elab/Derive.vuna:115"));
  ("v_Vuna_dCompiler_dElab_dDerive_danyExprMentions", ("Vuna.Compiler.Elab.Derive.anyExprMentions", "Vuna/Compiler/Elab/Derive.vuna:126"));
  ("v_Vuna_dCompiler_dElab_dDerive_danyTraitHasMethod", ("Vuna.Compiler.Elab.Derive.anyTraitHasMethod", "Vuna/Compiler/Elab/Derive.vuna:61"));
  ("v_Vuna_dCompiler_dElab_dDerive_dapplyTypeParams", ("Vuna.Compiler.Elab.Derive.applyTypeParams", "Vuna/Compiler/Elab/Derive.vuna:223"));
  ("v_Vuna_dCompiler_dElab_dDerive_dboolFalse", ("Vuna.Compiler.Elab.Derive.boolFalse", "Vuna/Compiler/Elab/Derive.vuna:398"));
  ("v_Vuna_dCompiler_dElab_dDerive_dboolTrue", ("Vuna.Compiler.Elab.Derive.boolTrue", "Vuna/Compiler/Elab/Derive.vuna:395"));
  ("v_Vuna_dCompiler_dElab_dDerive_dcollectDerivings", ("Vuna.Compiler.Elab.Derive.collectDerivings", "Vuna/Compiler/Elab/Derive.vuna:69"));
  ("v_Vuna_dCompiler_dElab_dDerive_dconjFields", ("Vuna.Compiler.Elab.Derive.conjFields", "Vuna/Compiler/Elab/Derive.vuna:307"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderiveCtxParams", ("Vuna.Compiler.Elab.Derive.deriveCtxParams", "Vuna/Compiler/Elab/Derive.vuna:109"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypeName", ("Vuna.Compiler.Elab.Derive.deriveFieldTypeName", "Vuna/Compiler/Elab/Derive.vuna:213"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderiveFieldTypes", ("Vuna.Compiler.Elab.Derive.deriveFieldTypes", "Vuna/Compiler/Elab/Derive.vuna:207"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderiveInstance", ("Vuna.Compiler.Elab.Derive.deriveInstance", "Vuna/Compiler/Elab/Derive.vuna:133"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderiveWrapper", ("Vuna.Compiler.Elab.Derive.deriveWrapper", "Vuna/Compiler/Elab/Derive.vuna:185"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderiveWrapperCtor", ("Vuna.Compiler.Elab.Derive.deriveWrapperCtor", "Vuna/Compiler/Elab/Derive.vuna:194"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderivingsFor", ("Vuna.Compiler.Elab.Derive.derivingsFor", "Vuna/Compiler/Elab/Derive.vuna:95"));
  ("v_Vuna_dCompiler_dElab_dDerive_dderivingsForGo", ("Vuna.Compiler.Elab.Derive.derivingsForGo", "Vuna/Compiler/Elab/Derive.vuna:99"));
  ("v_Vuna_dCompiler_dElab_dDerive_deqAlt", ("Vuna.Compiler.Elab.Derive.eqAlt", "Vuna/Compiler/Elab/Derive.vuna:292"));
  ("v_Vuna_dCompiler_dElab_dDerive_deqBody", ("Vuna.Compiler.Elab.Derive.eqBody", "Vuna/Compiler/Elab/Derive.vuna:289"));
  ("v_Vuna_dCompiler_dElab_dDerive_deqInner", ("Vuna.Compiler.Elab.Derive.eqInner", "Vuna/Compiler/Elab/Derive.vuna:300"));
  ("v_Vuna_dCompiler_dElab_dDerive_dexpandDerivings", ("Vuna.Compiler.Elab.Derive.expandDerivings", "Vuna/Compiler/Elab/Derive.vuna:48"));
  ("v_Vuna_dCompiler_dElab_dDerive_dexprMentionsName", ("Vuna.Compiler.Elab.Derive.exprMentionsName", "Vuna/Compiler/Elab/Derive.vuna:119"));
  ("v_Vuna_dCompiler_dElab_dDerive_dgeBody", ("Vuna.Compiler.Elab.Derive.geBody", "Vuna/Compiler/Elab/Derive.vuna:385"));
  ("v_Vuna_dCompiler_dElab_dDerive_dgtBody", ("Vuna.Compiler.Elab.Derive.gtBody", "Vuna/Compiler/Elab/Derive.vuna:382"));
  ("v_Vuna_dCompiler_dElab_dDerive_dhashAlts", ("Vuna.Compiler.Elab.Derive.hashAlts", "Vuna/Compiler/Elab/Derive.vuna:269"));
  ("v_Vuna_dCompiler_dElab_dDerive_dhashBody", ("Vuna.Compiler.Elab.Derive.hashBody", "Vuna/Compiler/Elab/Derive.vuna:265"));
  ("v_Vuna_dCompiler_dElab_dDerive_dhashFields", ("Vuna.Compiler.Elab.Derive.hashFields", "Vuna/Compiler/Elab/Derive.vuna:279"));
  ("v_Vuna_dCompiler_dElab_dDerive_dinstHead", ("Vuna.Compiler.Elab.Derive.instHead", "Vuna/Compiler/Elab/Derive.vuna:219"));
  ("v_Vuna_dCompiler_dElab_dDerive_dleBody", ("Vuna.Compiler.Elab.Derive.leBody", "Vuna/Compiler/Elab/Derive.vuna:364"));
  ("v_Vuna_dCompiler_dElab_dDerive_dltFields", ("Vuna.Compiler.Elab.Derive.ltFields", "Vuna/Compiler/Elab/Derive.vuna:351"));
  ("v_Vuna_dCompiler_dElab_dDerive_dneqBody", ("Vuna.Compiler.Elab.Derive.neqBody", "Vuna/Compiler/Elab/Derive.vuna:315"));
  ("v_Vuna_dCompiler_dElab_dDerive_dordAlts", ("Vuna.Compiler.Elab.Derive.ordAlts", "Vuna/Compiler/Elab/Derive.vuna:325"));
  ("v_Vuna_dCompiler_dElab_dDerive_dordBody", ("Vuna.Compiler.Elab.Derive.ordBody", "Vuna/Compiler/Elab/Derive.vuna:322"));
  ("v_Vuna_dCompiler_dElab_dDerive_dordInner", ("Vuna.Compiler.Elab.Derive.ordInner", "Vuna/Compiler/Elab/Derive.vuna:335"));
  ("v_Vuna_dCompiler_dElab_dDerive_dordInnerGo", ("Vuna.Compiler.Elab.Derive.ordInnerGo", "Vuna/Compiler/Elab/Derive.vuna:338"));
  ("v_Vuna_dCompiler_dElab_dDerive_drecordCtorOf", ("Vuna.Compiler.Elab.Derive.recordCtorOf", "Vuna/Compiler/Elab/Derive.vuna:86"));
  ("v_Vuna_dCompiler_dElab_dDerive_drecordDerivingsFor", ("Vuna.Compiler.Elab.Derive.recordDerivingsFor", "Vuna/Compiler/Elab/Derive.vuna:91"));
  ("v_Vuna_dCompiler_dElab_dDerive_dshowAlts", ("Vuna.Compiler.Elab.Derive.showAlts", "Vuna/Compiler/Elab/Derive.vuna:233"));
  ("v_Vuna_dCompiler_dElab_dDerive_dshowBody", ("Vuna.Compiler.Elab.Derive.showBody", "Vuna/Compiler/Elab/Derive.vuna:230"));
  ("v_Vuna_dCompiler_dElab_dDerive_dshowCtor", ("Vuna.Compiler.Elab.Derive.showCtor", "Vuna/Compiler/Elab/Derive.vuna:243"));
  ("v_Vuna_dCompiler_dElab_dDerive_dshowFields", ("Vuna.Compiler.Elab.Derive.showFields", "Vuna/Compiler/Elab/Derive.vuna:248"));
  ("v_Vuna_dCompiler_dElab_dDerive_dshowOne", ("Vuna.Compiler.Elab.Derive.showOne", "Vuna/Compiler/Elab/Derive.vuna:256"));
  ("v_Vuna_dCompiler_dElab_dDerive_dtraitMethodGlobal", ("Vuna.Compiler.Elab.Derive.traitMethodGlobal", "Vuna/Compiler/Elab/Derive.vuna:35"));
  ("v_Vuna_dCompiler_dElab_dDerive_dtraitMethodOf", ("Vuna.Compiler.Elab.Derive.traitMethodOf", "Vuna/Compiler/Elab/Derive.vuna:56"));
  ("v_Vuna_dCompiler_dElab_dDerive_dtraitShortName", ("Vuna.Compiler.Elab.Derive.traitShortName", "Vuna/Compiler/Elab/Derive.vuna:30"));
  ("v_Vuna_dCompiler_dElab_dDerive_dvarNames", ("Vuna.Compiler.Elab.Derive.varNames", "Vuna/Compiler/Elab/Derive.vuna:370"));
  ("v_Vuna_dCompiler_dElab_dDerive_dvarNamesAt", ("Vuna.Compiler.Elab.Derive.varNamesAt", "Vuna/Compiler/Elab/Derive.vuna:373"));
  ("v_Vuna_dCompiler_dElab_dDerive_dvarNamesAtGo", ("Vuna.Compiler.Elab.Derive.varNamesAtGo", "Vuna/Compiler/Elab/Derive.vuna:376"));
  ("v_Vuna_dCompiler_dElab_dDict_dallInstancesMono", ("Vuna.Compiler.Elab.Dict.allInstancesMono", "Vuna/Compiler/Elab/Dict.vuna:319"));
  ("v_Vuna_dCompiler_dElab_dDict_dallocMetaAt", ("Vuna.Compiler.Elab.Dict.allocMetaAt", "Vuna/Compiler/Elab/Dict.vuna:368"));
  ("v_Vuna_dCompiler_dElab_dDict_dallocTeleMetas", ("Vuna.Compiler.Elab.Dict.allocTeleMetas", "Vuna/Compiler/Elab/Dict.vuna:362"));
  ("v_Vuna_dCompiler_dElab_dDict_danyRigidClassArg", ("Vuna.Compiler.Elab.Dict.anyRigidClassArg", "Vuna/Compiler/Elab/Dict.vuna:866"));
  ("v_Vuna_dCompiler_dElab_dDict_danyUnsolvedMetaArg", ("Vuna.Compiler.Elab.Dict.anyUnsolvedMetaArg", "Vuna/Compiler/Elab/Dict.vuna:1108"));
  ("v_Vuna_dCompiler_dElab_dDict_danyValueHasRigidNVar", ("Vuna.Compiler.Elab.Dict.anyValueHasRigidNVar", "Vuna/Compiler/Elab/Dict.vuna:889"));
  ("v_Vuna_dCompiler_dElab_dDict_danyViaClassFam", ("Vuna.Compiler.Elab.Dict.anyViaClassFam", "Vuna/Compiler/Elab/Dict.vuna:100"));
  ("v_Vuna_dCompiler_dElab_dDict_danyViaWrapper", ("Vuna.Compiler.Elab.Dict.anyViaWrapper", "Vuna/Compiler/Elab/Dict.vuna:148"));
  ("v_Vuna_dCompiler_dElab_dDict_dapplyDataPis", ("Vuna.Compiler.Elab.Dict.applyDataPis", "Vuna/Compiler/Elab/Dict.vuna:111"));
  ("v_Vuna_dCompiler_dElab_dDict_dargHeadMatchesKind", ("Vuna.Compiler.Elab.Dict.argHeadMatchesKind", "Vuna/Compiler/Elab/Dict.vuna:833"));
  ("v_Vuna_dCompiler_dElab_dDict_dblanketInstances", ("Vuna.Compiler.Elab.Dict.blanketInstances", "Vuna/Compiler/Elab/Dict.vuna:202"));
  ("v_Vuna_dCompiler_dElab_dDict_dboolShortCircuit", ("Vuna.Compiler.Elab.Dict.boolShortCircuit", "Vuna/Compiler/Elab/Dict.vuna:1143"));
  ("v_Vuna_dCompiler_dElab_dDict_dclassHasProjection", ("Vuna.Compiler.Elab.Dict.classHasProjection", "Vuna/Compiler/Elab/Dict.vuna:897"));
  ("v_Vuna_dCompiler_dElab_dDict_dcmpMethodShortOf", ("Vuna.Compiler.Elab.Dict.cmpMethodShortOf", "Vuna/Compiler/Elab/Dict.vuna:969"));
  ("v_Vuna_dCompiler_dElab_dDict_dcmpRuntimeName", ("Vuna.Compiler.Elab.Dict.cmpRuntimeName", "Vuna/Compiler/Elab/Dict.vuna:1070"));
  ("v_Vuna_dCompiler_dElab_dDict_dctorParamKinds", ("Vuna.Compiler.Elab.Dict.ctorParamKinds", "Vuna/Compiler/Elab/Dict.vuna:808"));
  ("v_Vuna_dCompiler_dElab_dDict_dctorParamKindsFuel", ("Vuna.Compiler.Elab.Dict.ctorParamKindsFuel", "Vuna/Compiler/Elab/Dict.vuna:811"));
  ("v_Vuna_dCompiler_dElab_dDict_dctorValue", ("Vuna.Compiler.Elab.Dict.ctorValue", "Vuna/Compiler/Elab/Dict.vuna:451"));
  ("v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTerm", ("Vuna.Compiler.Elab.Dict.ctxMemberProofTerm", "Vuna/Compiler/Elab/Dict.vuna:552"));
  ("v_Vuna_dCompiler_dElab_dDict_dctxMemberProofTermGo", ("Vuna.Compiler.Elab.Dict.ctxMemberProofTermGo", "Vuna/Compiler/Elab/Dict.vuna:546"));
  ("v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnify", ("Vuna.Compiler.Elab.Dict.ctxMemberProofUnify", "Vuna/Compiler/Elab/Dict.vuna:558"));
  ("v_Vuna_dCompiler_dElab_dDict_dctxMemberProofUnifyGo", ("Vuna.Compiler.Elab.Dict.ctxMemberProofUnifyGo", "Vuna/Compiler/Elab/Dict.vuna:561"));
  ("v_Vuna_dCompiler_dElab_dDict_ddeferEqDict", ("Vuna.Compiler.Elab.Dict.deferEqDict", "Vuna/Compiler/Elab/Dict.vuna:1052"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictArgKind", ("Vuna.Compiler.Elab.Dict.dictArgKind", "Vuna/Compiler/Elab/Dict.vuna:821"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictArgKinds", ("Vuna.Compiler.Elab.Dict.dictArgKinds", "Vuna/Compiler/Elab/Dict.vuna:798"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictArgUnsolvedMeta", ("Vuna.Compiler.Elab.Dict.dictArgUnsolvedMeta", "Vuna/Compiler/Elab/Dict.vuna:1102"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictClassArg", ("Vuna.Compiler.Elab.Dict.dictClassArg", "Vuna/Compiler/Elab/Dict.vuna:854"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictClassArgs", ("Vuna.Compiler.Elab.Dict.dictClassArgs", "Vuna/Compiler/Elab/Dict.vuna:849"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictFamilyNameOf", ("Vuna.Compiler.Elab.Dict.dictFamilyNameOf", "Vuna/Compiler/Elab/Dict.vuna:826"));
  ("v_Vuna_dCompiler_dElab_dDict_ddictTermOfValueAt", ("Vuna.Compiler.Elab.Dict.dictTermOfValueAt", "Vuna/Compiler/Elab/Dict.vuna:734"));
  ("v_Vuna_dCompiler_dElab_dDict_deqMethodShortOf", ("Vuna.Compiler.Elab.Dict.eqMethodShortOf", "Vuna/Compiler/Elab/Dict.vuna:966"));
  ("v_Vuna_dCompiler_dElab_dDict_dfamOfClass", ("Vuna.Compiler.Elab.Dict.famOfClass", "Vuna/Compiler/Elab/Dict.vuna:94"));
  ("v_Vuna_dCompiler_dElab_dDict_dfindClass", ("Vuna.Compiler.Elab.Dict.findClass", "Vuna/Compiler/Elab/Dict.vuna:89"));
  ("v_Vuna_dCompiler_dElab_dDict_dfinishInstanceSearch", ("Vuna.Compiler.Elab.Dict.finishInstanceSearch", "Vuna/Compiler/Elab/Dict.vuna:207"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoal", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoal", "Vuna/Compiler/Elab/Dict.vuna:1161"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalGo", "Vuna/Compiler/Elab/Dict.vuna:1164"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMeta", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalMeta", "Vuna/Compiler/Elab/Dict.vuna:1225"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalMetaGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalMetaGo", "Vuna/Compiler/Elab/Dict.vuna:1229"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictGoalSpan", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalSpan", "Vuna/Compiler/Elab/Dict.vuna:1208"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedDictSpanGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictSpanGo", "Vuna/Compiler/Elab/Dict.vuna:1212"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoal", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpGoal", "Vuna/Compiler/Elab/Dict.vuna:239"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpGoalGo", "Vuna/Compiler/Elab/Dict.vuna:242"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpGoalSpan", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpGoalSpan", "Vuna/Compiler/Elab/Dict.vuna:1181"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedInterpSpanGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpSpanGo", "Vuna/Compiler/Elab/Dict.vuna:1185"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoal", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberGoal", "Vuna/Compiler/Elab/Dict.vuna:1147"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberGoalGo", "Vuna/Compiler/Elab/Dict.vuna:1150"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberGoalSpan", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberGoalSpan", "Vuna/Compiler/Elab/Dict.vuna:1196"));
  ("v_Vuna_dCompiler_dElab_dDict_dfirstUnsolvedMemberSpanGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberSpanGo", "Vuna/Compiler/Elab/Dict.vuna:1200"));
  ("v_Vuna_dCompiler_dElab_dDict_dhasMethodShort", ("Vuna.Compiler.Elab.Dict.hasMethodShort", "Vuna/Compiler/Elab/Dict.vuna:1000"));
  ("v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstance", ("Vuna.Compiler.Elab.Dict.hasSpecificInterpInstance", "Vuna/Compiler/Elab/Dict.vuna:292"));
  ("v_Vuna_dCompiler_dElab_dDict_dhasSpecificInterpInstanceGo", ("Vuna.Compiler.Elab.Dict.hasSpecificInterpInstanceGo", "Vuna/Compiler/Elab/Dict.vuna:296"));
  ("v_Vuna_dCompiler_dElab_dDict_dhereCtorName", ("Vuna.Compiler.Elab.Dict.hereCtorName", "Vuna/Compiler/Elab/Dict.vuna:417"));
  ("v_Vuna_dCompiler_dElab_dDict_dinstHeadArgTypeName", ("Vuna.Compiler.Elab.Dict.instHeadArgTypeName", "Vuna/Compiler/Elab/Dict.vuna:302"));
  ("v_Vuna_dCompiler_dElab_dDict_dinstMatchInst", ("Vuna.Compiler.Elab.Dict.instMatchInst", "Vuna/Compiler/Elab/Dict.vuna:53"));
  ("v_Vuna_dCompiler_dElab_dDict_disCmpMethod", ("Vuna.Compiler.Elab.Dict.isCmpMethod", "Vuna/Compiler/Elab/Dict.vuna:920"));
  ("v_Vuna_dCompiler_dElab_dDict_disDictDomain", ("Vuna.Compiler.Elab.Dict.isDictDomain", "Vuna/Compiler/Elab/Dict.vuna:24"));
  ("v_Vuna_dCompiler_dElab_dDict_disDictFamily", ("Vuna.Compiler.Elab.Dict.isDictFamily", "Vuna/Compiler/Elab/Dict.vuna:33"));
  ("v_Vuna_dCompiler_dElab_dDict_disDictValue", ("Vuna.Compiler.Elab.Dict.isDictValue", "Vuna/Compiler/Elab/Dict.vuna:27"));
  ("v_Vuna_dCompiler_dElab_dDict_disEqMethod", ("Vuna.Compiler.Elab.Dict.isEqMethod", "Vuna/Compiler/Elab/Dict.vuna:909"));
  ("v_Vuna_dCompiler_dElab_dDict_disGtShort", ("Vuna.Compiler.Elab.Dict.isGtShort", "Vuna/Compiler/Elab/Dict.vuna:1095"));
  ("v_Vuna_dCompiler_dElab_dDict_disLeShort", ("Vuna.Compiler.Elab.Dict.isLeShort", "Vuna/Compiler/Elab/Dict.vuna:1092"));
  ("v_Vuna_dCompiler_dElab_dDict_disLtShort", ("Vuna.Compiler.Elab.Dict.isLtShort", "Vuna/Compiler/Elab/Dict.vuna:1089"));
  ("v_Vuna_dCompiler_dElab_dDict_disMemberDomain", ("Vuna.Compiler.Elab.Dict.isMemberDomain", "Vuna/Compiler/Elab/Dict.vuna:431"));
  ("v_Vuna_dCompiler_dElab_dDict_disMonoInst", ("Vuna.Compiler.Elab.Dict.isMonoInst", "Vuna/Compiler/Elab/Dict.vuna:311"));
  ("v_Vuna_dCompiler_dElab_dDict_disRigidClassArg", ("Vuna.Compiler.Elab.Dict.isRigidClassArg", "Vuna/Compiler/Elab/Dict.vuna:871"));
  ("v_Vuna_dCompiler_dElab_dDict_disRigidDictArg", ("Vuna.Compiler.Elab.Dict.isRigidDictArg", "Vuna/Compiler/Elab/Dict.vuna:863"));
  ("v_Vuna_dCompiler_dElab_dDict_djoinInstNames", ("Vuna.Compiler.Elab.Dict.joinInstNames", "Vuna/Compiler/Elab/Dict.vuna:788"));
  ("v_Vuna_dCompiler_dElab_dDict_djoinRestInstNames", ("Vuna.Compiler.Elab.Dict.joinRestInstNames", "Vuna/Compiler/Elab/Dict.vuna:792"));
  ("v_Vuna_dCompiler_dElab_dDict_dlocalDictLookup", ("Vuna.Compiler.Elab.Dict.localDictLookup", "Vuna/Compiler/Elab/Dict.vuna:256"));
  ("v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupExact", ("Vuna.Compiler.Elab.Dict.localDictLookupExact", "Vuna/Compiler/Elab/Dict.vuna:259"));
  ("v_Vuna_dCompiler_dElab_dDict_dlocalDictLookupGo", ("Vuna.Compiler.Elab.Dict.localDictLookupGo", "Vuna/Compiler/Elab/Dict.vuna:264"));
  ("v_Vuna_dCompiler_dElab_dDict_dmatchInstances", ("Vuna.Compiler.Elab.Dict.matchInstances", "Vuna/Compiler/Elab/Dict.vuna:323"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberCandIdx", ("Vuna.Compiler.Elab.Dict.memberCandIdx", "Vuna/Compiler/Elab/Dict.vuna:478"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberCandName", ("Vuna.Compiler.Elab.Dict.memberCandName", "Vuna/Compiler/Elab/Dict.vuna:475"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberDomName", ("Vuna.Compiler.Elab.Dict.memberDomName", "Vuna/Compiler/Elab/Dict.vuna:413"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberLookup", ("Vuna.Compiler.Elab.Dict.memberLookup", "Vuna/Compiler/Elab/Dict.vuna:456"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberLookupRow", ("Vuna.Compiler.Elab.Dict.memberLookupRow", "Vuna/Compiler/Elab/Dict.vuna:528"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberNameText", ("Vuna.Compiler.Elab.Dict.memberNameText", "Vuna/Compiler/Elab/Dict.vuna:488"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberProbe", ("Vuna.Compiler.Elab.Dict.memberProbe", "Vuna/Compiler/Elab/Dict.vuna:482"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberProofAt", ("Vuna.Compiler.Elab.Dict.memberProofAt", "Vuna/Compiler/Elab/Dict.vuna:511"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberScan", ("Vuna.Compiler.Elab.Dict.memberScan", "Vuna/Compiler/Elab/Dict.vuna:494"));
  ("v_Vuna_dCompiler_dElab_dDict_dmemberSpine", ("Vuna.Compiler.Elab.Dict.memberSpine", "Vuna/Compiler/Elab/Dict.vuna:441"));
  ("v_Vuna_dCompiler_dElab_dDict_dmethodNameAliases", ("Vuna.Compiler.Elab.Dict.methodNameAliases", "Vuna/Compiler/Elab/Dict.vuna:974"));
  ("v_Vuna_dCompiler_dElab_dDict_dmethodShortOf", ("Vuna.Compiler.Elab.Dict.methodShortOf", "Vuna/Compiler/Elab/Dict.vuna:962"));
  ("v_Vuna_dCompiler_dElab_dDict_dmissingInstance", ("Vuna.Compiler.Elab.Dict.missingInstance", "Vuna/Compiler/Elab/Dict.vuna:219"));
  ("v_Vuna_dCompiler_dElab_dDict_dneutralHeadOrSelf", ("Vuna.Compiler.Elab.Dict.neutralHeadOrSelf", "Vuna/Compiler/Elab/Dict.vuna:843"));
  ("v_Vuna_dCompiler_dElab_dDict_dnumMethodOpName", ("Vuna.Compiler.Elab.Dict.numMethodOpName", "Vuna/Compiler/Elab/Dict.vuna:953"));
  ("v_Vuna_dCompiler_dElab_dDict_dopShortOf", ("Vuna.Compiler.Elab.Dict.opShortOf", "Vuna/Compiler/Elab/Dict.vuna:903"));
  ("v_Vuna_dCompiler_dElab_dDict_dpiRigs", ("Vuna.Compiler.Elab.Dict.piRigs", "Vuna/Compiler/Elab/Dict.vuna:784"));
  ("v_Vuna_dCompiler_dElab_dDict_dpiRigsOfGlobal", ("Vuna.Compiler.Elab.Dict.piRigsOfGlobal", "Vuna/Compiler/Elab/Dict.vuna:777"));
  ("v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInst", ("Vuna.Compiler.Elab.Dict.piRigsOfInst", "Vuna/Compiler/Elab/Dict.vuna:768"));
  ("v_Vuna_dCompiler_dElab_dDict_dpiRigsOfInstGo", ("Vuna.Compiler.Elab.Dict.piRigsOfInstGo", "Vuna/Compiler/Elab/Dict.vuna:771"));
  ("v_Vuna_dCompiler_dElab_dDict_dprojectionFor", ("Vuna.Compiler.Elab.Dict.projectionFor", "Vuna/Compiler/Elab/Dict.vuna:1004"));
  ("v_Vuna_dCompiler_dElab_dDict_drenderDictTermAt", ("Vuna.Compiler.Elab.Dict.renderDictTermAt", "Vuna/Compiler/Elab/Dict.vuna:737"));
  ("v_Vuna_dCompiler_dElab_dDict_dreplaceAt", ("Vuna.Compiler.Elab.Dict.replaceAt", "Vuna/Compiler/Elab/Dict.vuna:161"));
  ("v_Vuna_dCompiler_dElab_dDict_dresolveDictGoals", ("Vuna.Compiler.Elab.Dict.resolveDictGoals", "Vuna/Compiler/Elab/Dict.vuna:613"));
  ("v_Vuna_dCompiler_dElab_dDict_dresolveDictGoalsFuel", ("Vuna.Compiler.Elab.Dict.resolveDictGoalsFuel", "Vuna/Compiler/Elab/Dict.vuna:621"));
  ("v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtx", ("Vuna.Compiler.Elab.Dict.resolveRowGoalsCtx", "Vuna/Compiler/Elab/Dict.vuna:579"));
  ("v_Vuna_dCompiler_dElab_dDict_dresolveRowGoalsCtxGo", ("Vuna.Compiler.Elab.Dict.resolveRowGoalsCtxGo", "Vuna/Compiler/Elab/Dict.vuna:582"));
  ("v_Vuna_dCompiler_dElab_dDict_drigidSearchFast", ("Vuna.Compiler.Elab.Dict.rigidSearchFast", "Vuna/Compiler/Elab/Dict.vuna:278"));
  ("v_Vuna_dCompiler_dElab_dDict_drowMemDomName", ("Vuna.Compiler.Elab.Dict.rowMemDomName", "Vuna/Compiler/Elab/Dict.vuna:397"));
  ("v_Vuna_dCompiler_dElab_dDict_drowNoDomName", ("Vuna.Compiler.Elab.Dict.rowNoDomName", "Vuna/Compiler/Elab/Dict.vuna:403"));
  ("v_Vuna_dCompiler_dElab_dDict_drowYesCtorName", ("Vuna.Compiler.Elab.Dict.rowYesCtorName", "Vuna/Compiler/Elab/Dict.vuna:407"));
  ("v_Vuna_dCompiler_dElab_dDict_drowYesDomName", ("Vuna.Compiler.Elab.Dict.rowYesDomName", "Vuna/Compiler/Elab/Dict.vuna:400"));
  ("v_Vuna_dCompiler_dElab_dDict_dsearchCandidates", ("Vuna.Compiler.Elab.Dict.searchCandidates", "Vuna/Compiler/Elab/Dict.vuna:191"));
  ("v_Vuna_dCompiler_dElab_dDict_dsearchInstFuel", ("Vuna.Compiler.Elab.Dict.searchInstFuel", "Vuna/Compiler/Elab/Dict.vuna:62"));
  ("v_Vuna_dCompiler_dElab_dDict_dsearchInstance", ("Vuna.Compiler.Elab.Dict.searchInstance", "Vuna/Compiler/Elab/Dict.vuna:46"));
  ("v_Vuna_dCompiler_dElab_dDict_dsearchInstanceIn", ("Vuna.Compiler.Elab.Dict.searchInstanceIn", "Vuna/Compiler/Elab/Dict.vuna:42"));
  ("v_Vuna_dCompiler_dElab_dDict_dshowResolvedValue", ("Vuna.Compiler.Elab.Dict.showResolvedValue", "Vuna/Compiler/Elab/Dict.vuna:234"));
  ("v_Vuna_dCompiler_dElab_dDict_dsolveDictCtxs", ("Vuna.Compiler.Elab.Dict.solveDictCtxs", "Vuna/Compiler/Elab/Dict.vuna:384"));
  ("v_Vuna_dCompiler_dElab_dDict_dsolveRowMeta", ("Vuna.Compiler.Elab.Dict.solveRowMeta", "Vuna/Compiler/Elab/Dict.vuna:574"));
  ("v_Vuna_dCompiler_dElab_dDict_dsolveTeleMetas", ("Vuna.Compiler.Elab.Dict.solveTeleMetas", "Vuna/Compiler/Elab/Dict.vuna:376"));
  ("v_Vuna_dCompiler_dElab_dDict_dspecializeCmpTy", ("Vuna.Compiler.Elab.Dict.specializeCmpTy", "Vuna/Compiler/Elab/Dict.vuna:1117"));
  ("v_Vuna_dCompiler_dElab_dDict_dspecializeEqTy", ("Vuna.Compiler.Elab.Dict.specializeEqTy", "Vuna/Compiler/Elab/Dict.vuna:1022"));
  ("v_Vuna_dCompiler_dElab_dDict_dspecificInstances", ("Vuna.Compiler.Elab.Dict.specificInstances", "Vuna/Compiler/Elab/Dict.vuna:197"));
  ("v_Vuna_dCompiler_dElab_dDict_dsubstDictTerm", ("Vuna.Compiler.Elab.Dict.substDictTerm", "Vuna/Compiler/Elab/Dict.vuna:691"));
  ("v_Vuna_dCompiler_dElab_dDict_dsubstDictTermAlt", ("Vuna.Compiler.Elab.Dict.substDictTermAlt", "Vuna/Compiler/Elab/Dict.vuna:721"));
  ("v_Vuna_dCompiler_dElab_dDict_dsubstDictTermGo", ("Vuna.Compiler.Elab.Dict.substDictTermGo", "Vuna/Compiler/Elab/Dict.vuna:694"));
  ("v_Vuna_dCompiler_dElab_dDict_dtermMetaId", ("Vuna.Compiler.Elab.Dict.termMetaId", "Vuna/Compiler/Elab/Dict.vuna:372"));
  ("v_Vuna_dCompiler_dElab_dDict_dtermTypeNameOf", ("Vuna.Compiler.Elab.Dict.termTypeNameOf", "Vuna/Compiler/Elab/Dict.vuna:307"));
  ("v_Vuna_dCompiler_dElab_dDict_dthereCtorName", ("Vuna.Compiler.Elab.Dict.thereCtorName", "Vuna/Compiler/Elab/Dict.vuna:421"));
  ("v_Vuna_dCompiler_dElab_dDict_dtryMatchInst", ("Vuna.Compiler.Elab.Dict.tryMatchInst", "Vuna/Compiler/Elab/Dict.vuna:331"));
  ("v_Vuna_dCompiler_dElab_dDict_dtryResolveDictGoal", ("Vuna.Compiler.Elab.Dict.tryResolveDictGoal", "Vuna/Compiler/Elab/Dict.vuna:669"));
  ("v_Vuna_dCompiler_dElab_dDict_dtryViaArgs", ("Vuna.Compiler.Elab.Dict.tryViaArgs", "Vuna/Compiler/Elab/Dict.vuna:175"));
  ("v_Vuna_dCompiler_dElab_dDict_dtryViaDict", ("Vuna.Compiler.Elab.Dict.tryViaDict", "Vuna/Compiler/Elab/Dict.vuna:166"));
  ("v_Vuna_dCompiler_dElab_dDict_dvalueDictFamily", ("Vuna.Compiler.Elab.Dict.valueDictFamily", "Vuna/Compiler/Elab/Dict.vuna:282"));
  ("v_Vuna_dCompiler_dElab_dDict_dvalueHasRigidNVar", ("Vuna.Compiler.Elab.Dict.valueHasRigidNVar", "Vuna/Compiler/Elab/Dict.vuna:874"));
  ("v_Vuna_dCompiler_dElab_dDict_dviaAllowsFam", ("Vuna.Compiler.Elab.Dict.viaAllowsFam", "Vuna/Compiler/Elab/Dict.vuna:107"));
  ("v_Vuna_dCompiler_dElab_dDict_dviaCandidateExists", ("Vuna.Compiler.Elab.Dict.viaCandidateExists", "Vuna/Compiler/Elab/Dict.vuna:155"));
  ("v_Vuna_dCompiler_dElab_dDict_dviaFieldType", ("Vuna.Compiler.Elab.Dict.viaFieldType", "Vuna/Compiler/Elab/Dict.vuna:120"));
  ("v_Vuna_dCompiler_dElab_dDict_dviaWrapperData", ("Vuna.Compiler.Elab.Dict.viaWrapperData", "Vuna/Compiler/Elab/Dict.vuna:135"));
  ("v_Vuna_dCompiler_dElab_dDict_dviaWrapperOf", ("Vuna.Compiler.Elab.Dict.viaWrapperOf", "Vuna/Compiler/Elab/Dict.vuna:129"));
  ("v_Vuna_dCompiler_dElab_dDict_dviaWrapperShape", ("Vuna.Compiler.Elab.Dict.viaWrapperShape", "Vuna/Compiler/Elab/Dict.vuna:141"));
  ("v_Vuna_dCompiler_dElab_dDriver_daddClassesEc", ("Vuna.Compiler.Elab.Driver.addClassesEc", "Vuna/Compiler/Elab/Driver.vuna:1288"));
  ("v_Vuna_dCompiler_dElab_dDriver_daddDatasEc", ("Vuna.Compiler.Elab.Driver.addDatasEc", "Vuna/Compiler/Elab/Driver.vuna:1280"));
  ("v_Vuna_dCompiler_dElab_dDriver_daddInstsEc", ("Vuna.Compiler.Elab.Driver.addInstsEc", "Vuna/Compiler/Elab/Driver.vuna:1284"));
  ("v_Vuna_dCompiler_dElab_dDriver_dallReplCtors", ("Vuna.Compiler.Elab.Driver.allReplCtors", "Vuna/Compiler/Elab/Driver.vuna:486"));
  ("v_Vuna_dCompiler_dElab_dDriver_danyAltHasAnyMeta", ("Vuna.Compiler.Elab.Driver.anyAltHasAnyMeta", "Vuna/Compiler/Elab/Driver.vuna:1194"));
  ("v_Vuna_dCompiler_dElab_dDriver_danyAltHasMeta", ("Vuna.Compiler.Elab.Driver.anyAltHasMeta", "Vuna/Compiler/Elab/Driver.vuna:1164"));
  ("v_Vuna_dCompiler_dElab_dDriver_danyArgHasAnyMeta", ("Vuna.Compiler.Elab.Driver.anyArgHasAnyMeta", "Vuna/Compiler/Elab/Driver.vuna:1190"));
  ("v_Vuna_dCompiler_dElab_dDriver_danyArgHasMeta", ("Vuna.Compiler.Elab.Driver.anyArgHasMeta", "Vuna/Compiler/Elab/Driver.vuna:1160"));
  ("v_Vuna_dCompiler_dElab_dDriver_dappendLastTerm", ("Vuna.Compiler.Elab.Driver.appendLastTerm", "Vuna/Compiler/Elab/Driver.vuna:517"));
  ("v_Vuna_dCompiler_dElab_dDriver_dapplyDeclaredDictSubsts", ("Vuna.Compiler.Elab.Driver.applyDeclaredDictSubsts", "Vuna/Compiler/Elab/Driver.vuna:266"));
  ("v_Vuna_dCompiler_dElab_dDriver_daxiomSpanOf", ("Vuna.Compiler.Elab.Driver.axiomSpanOf", "Vuna/Compiler/Elab/Driver.vuna:430"));
  ("v_Vuna_dCompiler_dElab_dDriver_daxiomSpanPairs", ("Vuna.Compiler.Elab.Driver.axiomSpanPairs", "Vuna/Compiler/Elab/Driver.vuna:416"));
  ("v_Vuna_dCompiler_dElab_dDriver_daxiomSpansTbl", ("Vuna.Compiler.Elab.Driver.axiomSpansTbl", "Vuna/Compiler/Elab/Driver.vuna:413"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcandidateLe", ("Vuna.Compiler.Elab.Driver.candidateLe", "Vuna/Compiler/Elab/Driver.vuna:1306"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefined", ("Vuna.Compiler.Elab.Driver.checkAllDefined", "Vuna/Compiler/Elab/Driver.vuna:391"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcheckAllDefinedGo", ("Vuna.Compiler.Elab.Driver.checkAllDefinedGo", "Vuna/Compiler/Elab/Driver.vuna:396"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcheckExternArrayElem", ("Vuna.Compiler.Elab.Driver.checkExternArrayElem", "Vuna/Compiler/Elab/Driver.vuna:462"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcheckExternDomain", ("Vuna.Compiler.Elab.Driver.checkExternDomain", "Vuna/Compiler/Elab/Driver.vuna:453"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcheckExternTy", ("Vuna.Compiler.Elab.Driver.checkExternTy", "Vuna/Compiler/Elab/Driver.vuna:440"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcheckExternValue", ("Vuna.Compiler.Elab.Driver.checkExternValue", "Vuna/Compiler/Elab/Driver.vuna:443"));
  ("v_Vuna_dCompiler_dElab_dDriver_dclausesOfTbl", ("Vuna.Compiler.Elab.Driver.clausesOfTbl", "Vuna/Compiler/Elab/Driver.vuna:287"));
  ("v_Vuna_dCompiler_dElab_dDriver_dclausesTblGo", ("Vuna.Compiler.Elab.Driver.clausesTblGo", "Vuna/Compiler/Elab/Driver.vuna:276"));
  ("v_Vuna_dCompiler_dElab_dDriver_dclausesTblOf", ("Vuna.Compiler.Elab.Driver.clausesTblOf", "Vuna/Compiler/Elab/Driver.vuna:273"));
  ("v_Vuna_dCompiler_dElab_dDriver_dcountNames", ("Vuna.Compiler.Elab.Driver.countNames", "Vuna/Compiler/Elab/Driver.vuna:38"));
  ("v_Vuna_dCompiler_dElab_dDriver_dctxDepthOf", ("Vuna.Compiler.Elab.Driver.ctxDepthOf", "Vuna/Compiler/Elab/Driver.vuna:1199"));
  ("v_Vuna_dCompiler_dElab_dDriver_dctxEntriesAt", ("Vuna.Compiler.Elab.Driver.ctxEntriesAt", "Vuna/Compiler/Elab/Driver.vuna:1227"));
  ("v_Vuna_dCompiler_dElab_dDriver_dctxEntriesOf", ("Vuna.Compiler.Elab.Driver.ctxEntriesOf", "Vuna/Compiler/Elab/Driver.vuna:1224"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddeclFunNames", ("Vuna.Compiler.Elab.Driver.declFunNames", "Vuna/Compiler/Elab/Driver.vuna:307"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBinders", ("Vuna.Compiler.Elab.Driver.declaredDictBinders", "Vuna/Compiler/Elab/Driver.vuna:209"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddeclaredDictBindersGo", ("Vuna.Compiler.Elab.Driver.declaredDictBindersGo", "Vuna/Compiler/Elab/Driver.vuna:212"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddefAlreadyDone", ("Vuna.Compiler.Elab.Driver.defAlreadyDone", "Vuna/Compiler/Elab/Driver.vuna:292"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddefBodyPair", ("Vuna.Compiler.Elab.Driver.defBodyPair", "Vuna/Compiler/Elab/Driver.vuna:301"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddefBodyPairs", ("Vuna.Compiler.Elab.Driver.defBodyPairs", "Vuna/Compiler/Elab/Driver.vuna:298"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddictCandidatesOf", ("Vuna.Compiler.Elab.Driver.dictCandidatesOf", "Vuna/Compiler/Elab/Driver.vuna:1294"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddictDomMatches", ("Vuna.Compiler.Elab.Driver.dictDomMatches", "Vuna/Compiler/Elab/Driver.vuna:261"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddictFamilyOfShown", ("Vuna.Compiler.Elab.Driver.dictFamilyOfShown", "Vuna/Compiler/Elab/Driver.vuna:1316"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprIn", ("Vuna.Compiler.Elab.Driver.dtEvalExprIn", "Vuna/Compiler/Elab/Driver.vuna:655"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfo", ("Vuna.Compiler.Elab.Driver.dtEvalExprInInfo", "Vuna/Compiler/Elab/Driver.vuna:661"));
  ("v_Vuna_dCompiler_dElab_dDriver_ddtEvalExprInInfoCore", ("Vuna.Compiler.Elab.Driver.dtEvalExprInInfoCore", "Vuna/Compiler/Elab/Driver.vuna:666"));
  ("v_Vuna_dCompiler_dElab_dDriver_decOfProgram", ("Vuna.Compiler.Elab.Driver.ecOfProgram", "Vuna/Compiler/Elab/Driver.vuna:1267"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabBodies", ("Vuna.Compiler.Elab.Driver.elabBodies", "Vuna/Compiler/Elab/Driver.vuna:352"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabGoalsWithPrepared", ("Vuna.Compiler.Elab.Driver.elabGoalsWithPrepared", "Vuna/Compiler/Elab/Driver.vuna:1251"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabMemberConstraintDoms", ("Vuna.Compiler.Elab.Driver.elabMemberConstraintDoms", "Vuna/Compiler/Elab/Driver.vuna:144"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabOneDef", ("Vuna.Compiler.Elab.Driver.elabOneDef", "Vuna/Compiler/Elab/Driver.vuna:314"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgram", ("Vuna.Compiler.Elab.Driver.elabProgram", "Vuna/Compiler/Elab/Driver.vuna:1258"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramCoreWithAux", ("Vuna.Compiler.Elab.Driver.elabProgramCoreWithAux", "Vuna/Compiler/Elab/Driver.vuna:813"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramErrors", ("Vuna.Compiler.Elab.Driver.elabProgramErrors", "Vuna/Compiler/Elab/Driver.vuna:757"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramFull", ("Vuna.Compiler.Elab.Driver.elabProgramFull", "Vuna/Compiler/Elab/Driver.vuna:743"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWith", ("Vuna.Compiler.Elab.Driver.elabProgramFullWith", "Vuna/Compiler/Elab/Driver.vuna:778"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramFullWithAux", ("Vuna.Compiler.Elab.Driver.elabProgramFullWithAux", "Vuna/Compiler/Elab/Driver.vuna:784"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramGo", ("Vuna.Compiler.Elab.Driver.elabProgramGo", "Vuna/Compiler/Elab/Driver.vuna:773"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWith", ("Vuna.Compiler.Elab.Driver.elabProgramGoWith", "Vuna/Compiler/Elab/Driver.vuna:799"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabProgramGoWithAux", ("Vuna.Compiler.Elab.Driver.elabProgramGoWithAux", "Vuna/Compiler/Elab/Driver.vuna:1081"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabSigDictBinders", ("Vuna.Compiler.Elab.Driver.elabSigDictBinders", "Vuna/Compiler/Elab/Driver.vuna:112"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabSigs", ("Vuna.Compiler.Elab.Driver.elabSigs", "Vuna/Compiler/Elab/Driver.vuna:73"));
  ("v_Vuna_dCompiler_dElab_dDriver_delabSigsGo", ("Vuna.Compiler.Elab.Driver.elabSigsGo", "Vuna/Compiler/Elab/Driver.vuna:81"));
  ("v_Vuna_dCompiler_dElab_dDriver_dfindDefByName", ("Vuna.Compiler.Elab.Driver.findDefByName", "Vuna/Compiler/Elab/Driver.vuna:891"));
  ("v_Vuna_dCompiler_dElab_dDriver_dfindDefWithMeta", ("Vuna.Compiler.Elab.Driver.findDefWithMeta", "Vuna/Compiler/Elab/Driver.vuna:1135"));
  ("v_Vuna_dCompiler_dElab_dDriver_dfindGoal", ("Vuna.Compiler.Elab.Driver.findGoal", "Vuna/Compiler/Elab/Driver.vuna:1202"));
  ("v_Vuna_dCompiler_dElab_dDriver_dfinishCore", ("Vuna.Compiler.Elab.Driver.finishCore", "Vuna/Compiler/Elab/Driver.vuna:1021"));
  ("v_Vuna_dCompiler_dElab_dDriver_dfirstMatchDictBinder", ("Vuna.Compiler.Elab.Driver.firstMatchDictBinder", "Vuna/Compiler/Elab/Driver.vuna:256"));
  ("v_Vuna_dCompiler_dElab_dDriver_dfunNamesTbl", ("Vuna.Compiler.Elab.Driver.funNamesTbl", "Vuna/Compiler/Elab/Driver.vuna:408"));
  ("v_Vuna_dCompiler_dElab_dDriver_dgoalInfoOf", ("Vuna.Compiler.Elab.Driver.goalInfoOf", "Vuna/Compiler/Elab/Driver.vuna:1214"));
  ("v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgram", ("Vuna.Compiler.Elab.Driver.goalsOfProgram", "Vuna/Compiler/Elab/Driver.vuna:1233"));
  ("v_Vuna_dCompiler_dElab_dDriver_dgoalsOfProgramTolerant", ("Vuna.Compiler.Elab.Driver.goalsOfProgramTolerant", "Vuna/Compiler/Elab/Driver.vuna:1241"));
  ("v_Vuna_dCompiler_dElab_dDriver_dhasExplicitHasFieldInstance", ("Vuna.Compiler.Elab.Driver.hasExplicitHasFieldInstance", "Vuna/Compiler/Elab/Driver.vuna:724"));
  ("v_Vuna_dCompiler_dElab_dDriver_dhasFieldInstancesOfDecls", ("Vuna.Compiler.Elab.Driver.hasFieldInstancesOfDecls", "Vuna/Compiler/Elab/Driver.vuna:720"));
  ("v_Vuna_dCompiler_dElab_dDriver_dhasFunClause", ("Vuna.Compiler.Elab.Driver.hasFunClause", "Vuna/Compiler/Elab/Driver.vuna:423"));
  ("v_Vuna_dCompiler_dElab_dDriver_dhasHasFieldDecls", ("Vuna.Compiler.Elab.Driver.hasHasFieldDecls", "Vuna/Compiler/Elab/Driver.vuna:704"));
  ("v_Vuna_dCompiler_dElab_dDriver_dinsertSigDicts", ("Vuna.Compiler.Elab.Driver.insertSigDicts", "Vuna/Compiler/Elab/Driver.vuna:178"));
  ("v_Vuna_dCompiler_dElab_dDriver_dinsertSigDictsRev", ("Vuna.Compiler.Elab.Driver.insertSigDictsRev", "Vuna/Compiler/Elab/Driver.vuna:189"));
  ("v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembers", ("Vuna.Compiler.Elab.Driver.insertSigMembers", "Vuna/Compiler/Elab/Driver.vuna:152"));
  ("v_Vuna_dCompiler_dElab_dDriver_dinsertSigMembersRev", ("Vuna.Compiler.Elab.Driver.insertSigMembersRev", "Vuna/Compiler/Elab/Driver.vuna:163"));
  ("v_Vuna_dCompiler_dElab_dDriver_dinstCandidate", ("Vuna.Compiler.Elab.Driver.instCandidate", "Vuna/Compiler/Elab/Driver.vuna:1310"));
  ("v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostLabel", ("Vuna.Compiler.Elab.Driver.isBuiltinHostLabel", "Vuna/Compiler/Elab/Driver.vuna:912"));
  ("v_Vuna_dCompiler_dElab_dDriver_disBuiltinHostRowValue", ("Vuna.Compiler.Elab.Driver.isBuiltinHostRowValue", "Vuna/Compiler/Elab/Driver.vuna:916"));
  ("v_Vuna_dCompiler_dElab_dDriver_disMemberConstraintExpr", ("Vuna.Compiler.Elab.Driver.isMemberConstraintExpr", "Vuna/Compiler/Elab/Driver.vuna:140"));
  ("v_Vuna_dCompiler_dElab_dDriver_disNilRowTerm", ("Vuna.Compiler.Elab.Driver.isNilRowTerm", "Vuna/Compiler/Elab/Driver.vuna:905"));
  ("v_Vuna_dCompiler_dElab_dDriver_disReplAtom", ("Vuna.Compiler.Elab.Driver.isReplAtom", "Vuna/Compiler/Elab/Driver.vuna:608"));
  ("v_Vuna_dCompiler_dElab_dDriver_dkeptCtorArgs", ("Vuna.Compiler.Elab.Driver.keptCtorArgs", "Vuna/Compiler/Elab/Driver.vuna:625"));
  ("v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtx", ("Vuna.Compiler.Elab.Driver.leadingImplicitCtx", "Vuna/Compiler/Elab/Driver.vuna:95"));
  ("v_Vuna_dCompiler_dElab_dDriver_dleadingImplicitCtxGo", ("Vuna.Compiler.Elab.Driver.leadingImplicitCtxGo", "Vuna/Compiler/Elab/Driver.vuna:98"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmainActionOf", ("Vuna.Compiler.Elab.Driver.mainActionOf", "Vuna/Compiler/Elab/Driver.vuna:898"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmainArityErr", ("Vuna.Compiler.Elab.Driver.mainArityErr", "Vuna/Compiler/Elab/Driver.vuna:956"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmainEntryRowCheck", ("Vuna.Compiler.Elab.Driver.mainEntryRowCheck", "Vuna/Compiler/Elab/Driver.vuna:925"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmainHasParams", ("Vuna.Compiler.Elab.Driver.mainHasParams", "Vuna/Compiler/Elab/Driver.vuna:950"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmainShowBuiltinTy", ("Vuna.Compiler.Elab.Driver.mainShowBuiltinTy", "Vuna/Compiler/Elab/Driver.vuna:942"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmainShowMissing", ("Vuna.Compiler.Elab.Driver.mainShowMissing", "Vuna/Compiler/Elab/Driver.vuna:1014"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmatchedBodies", ("Vuna.Compiler.Elab.Driver.matchedBodies", "Vuna/Compiler/Elab/Driver.vuna:982"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmaybeAddHasFieldInstances", ("Vuna.Compiler.Elab.Driver.maybeAddHasFieldInstances", "Vuna/Compiler/Elab/Driver.vuna:735"));
  ("v_Vuna_dCompiler_dElab_dDriver_dmetaOwnerHint", ("Vuna.Compiler.Elab.Driver.metaOwnerHint", "Vuna/Compiler/Elab/Driver.vuna:1130"));
  ("v_Vuna_dCompiler_dElab_dDriver_dprependSigDicts", ("Vuna.Compiler.Elab.Driver.prependSigDicts", "Vuna/Compiler/Elab/Driver.vuna:184"));
  ("v_Vuna_dCompiler_dElab_dDriver_dprependSigMembers", ("Vuna.Compiler.Elab.Driver.prependSigMembers", "Vuna/Compiler/Elab/Driver.vuna:158"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplApp", ("Vuna.Compiler.Elab.Driver.renderReplApp", "Vuna/Compiler/Elab/Driver.vuna:501"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplArg", ("Vuna.Compiler.Elab.Driver.renderReplArg", "Vuna/Compiler/Elab/Driver.vuna:602"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplArgs", ("Vuna.Compiler.Elab.Driver.renderReplArgs", "Vuna/Compiler/Elab/Driver.vuna:596"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplCtor", ("Vuna.Compiler.Elab.Driver.renderReplCtor", "Vuna/Compiler/Elab/Driver.vuna:540"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplGeneric", ("Vuna.Compiler.Elab.Driver.renderReplGeneric", "Vuna/Compiler/Elab/Driver.vuna:592"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplList", ("Vuna.Compiler.Elab.Driver.renderReplList", "Vuna/Compiler/Elab/Driver.vuna:558"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplListTail", ("Vuna.Compiler.Elab.Driver.renderReplListTail", "Vuna/Compiler/Elab/Driver.vuna:567"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplPair", ("Vuna.Compiler.Elab.Driver.renderReplPair", "Vuna/Compiler/Elab/Driver.vuna:579"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplTerm", ("Vuna.Compiler.Elab.Driver.renderReplTerm", "Vuna/Compiler/Elab/Driver.vuna:490"));
  ("v_Vuna_dCompiler_dElab_dDriver_drenderReplUnary", ("Vuna.Compiler.Elab.Driver.renderReplUnary", "Vuna/Compiler/Elab/Driver.vuna:586"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplJustName", ("Vuna.Compiler.Elab.Driver.replJustName", "Vuna/Compiler/Elab/Driver.vuna:648"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplListConsName", ("Vuna.Compiler.Elab.Driver.replListConsName", "Vuna/Compiler/Elab/Driver.vuna:641"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplListNilName", ("Vuna.Compiler.Elab.Driver.replListNilName", "Vuna/Compiler/Elab/Driver.vuna:637"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplNatSuccName", ("Vuna.Compiler.Elab.Driver.replNatSuccName", "Vuna/Compiler/Elab/Driver.vuna:525"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplNatValue", ("Vuna.Compiler.Elab.Driver.replNatValue", "Vuna/Compiler/Elab/Driver.vuna:528"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplNatZeroName", ("Vuna.Compiler.Elab.Driver.replNatZeroName", "Vuna/Compiler/Elab/Driver.vuna:521"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplNothingName", ("Vuna.Compiler.Elab.Driver.replNothingName", "Vuna/Compiler/Elab/Driver.vuna:652"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplPairName", ("Vuna.Compiler.Elab.Driver.replPairName", "Vuna/Compiler/Elab/Driver.vuna:644"));
  ("v_Vuna_dCompiler_dElab_dDriver_dreplShortName", ("Vuna.Compiler.Elab.Driver.replShortName", "Vuna/Compiler/Elab/Driver.vuna:508"));
  ("v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFix", ("Vuna.Compiler.Elab.Driver.resolveDictGoalsFix", "Vuna/Compiler/Elab/Driver.vuna:1097"));
  ("v_Vuna_dCompiler_dElab_dDriver_dresolveDictGoalsFixGo", ("Vuna.Compiler.Elab.Driver.resolveDictGoalsFixGo", "Vuna/Compiler/Elab/Driver.vuna:1102"));
  ("v_Vuna_dCompiler_dElab_dDriver_dresumeBodies", ("Vuna.Compiler.Elab.Driver.resumeBodies", "Vuna/Compiler/Elab/Driver.vuna:345"));
  ("v_Vuna_dCompiler_dElab_dDriver_drezonkDefs", ("Vuna.Compiler.Elab.Driver.rezonkDefs", "Vuna/Compiler/Elab/Driver.vuna:1087"));
  ("v_Vuna_dCompiler_dElab_dDriver_dshortRecordMetas", ("Vuna.Compiler.Elab.Driver.shortRecordMetas", "Vuna/Compiler/Elab/Driver.vuna:713"));
  ("v_Vuna_dCompiler_dElab_dDriver_dshowCounters", ("Vuna.Compiler.Elab.Driver.showCounters", "Vuna/Compiler/Elab/Driver.vuna:33"));
  ("v_Vuna_dCompiler_dElab_dDriver_dshowValueRepl", ("Vuna.Compiler.Elab.Driver.showValueRepl", "Vuna/Compiler/Elab/Driver.vuna:483"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsigDictName", ("Vuna.Compiler.Elab.Driver.sigDictName", "Vuna/Compiler/Elab/Driver.vuna:194"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsigMemberName", ("Vuna.Compiler.Elab.Driver.sigMemberName", "Vuna/Compiler/Elab/Driver.vuna:169"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoals", ("Vuna.Compiler.Elab.Driver.solveDeclaredDictGoals", "Vuna/Compiler/Elab/Driver.vuna:223"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsolveDeclaredDictGoalsGo", ("Vuna.Compiler.Elab.Driver.solveDeclaredDictGoalsGo", "Vuna/Compiler/Elab/Driver.vuna:238"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsortCandidates", ("Vuna.Compiler.Elab.Driver.sortCandidates", "Vuna/Compiler/Elab/Driver.vuna:1303"));
  ("v_Vuna_dCompiler_dElab_dDriver_dspineOf", ("Vuna.Compiler.Elab.Driver.spineOf", "Vuna/Compiler/Elab/Driver.vuna:511"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsplitMemberCtx", ("Vuna.Compiler.Elab.Driver.splitMemberCtx", "Vuna/Compiler/Elab/Driver.vuna:132"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsynthMainShow", ("Vuna.Compiler.Elab.Driver.synthMainShow", "Vuna/Compiler/Elab/Driver.vuna:964"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowGo", ("Vuna.Compiler.Elab.Driver.synthMainShowGo", "Vuna/Compiler/Elab/Driver.vuna:995"));
  ("v_Vuna_dCompiler_dElab_dDriver_dsynthMainShowInner", ("Vuna.Compiler.Elab.Driver.synthMainShowInner", "Vuna/Compiler/Elab/Driver.vuna:988"));
  ("v_Vuna_dCompiler_dElab_dDriver_dtakeWhileDictChar", ("Vuna.Compiler.Elab.Driver.takeWhileDictChar", "Vuna/Compiler/Elab/Driver.vuna:1326"));
  ("v_Vuna_dCompiler_dElab_dDriver_dtermHasAnyMeta", ("Vuna.Compiler.Elab.Driver.termHasAnyMeta", "Vuna/Compiler/Elab/Driver.vuna:1170"));
  ("v_Vuna_dCompiler_dElab_dDriver_dtermHasMeta", ("Vuna.Compiler.Elab.Driver.termHasMeta", "Vuna/Compiler/Elab/Driver.vuna:1140"));
  ("v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevant", ("Vuna.Compiler.Elab.Driver.unsolvedFromRelevant", "Vuna/Compiler/Elab/Driver.vuna:54"));
  ("v_Vuna_dCompiler_dElab_dDriver_dunsolvedFromRelevantGo", ("Vuna.Compiler.Elab.Driver.unsolvedFromRelevantGo", "Vuna/Compiler/Elab/Driver.vuna:58"));
  ("v_Vuna_dCompiler_dElab_dDriver_dunsolvedMessage", ("Vuna.Compiler.Elab.Driver.unsolvedMessage", "Vuna/Compiler/Elab/Driver.vuna:1111"));
  ("v_Vuna_dCompiler_dElab_dDriver_dunsolvedMeta", ("Vuna.Compiler.Elab.Driver.unsolvedMeta", "Vuna/Compiler/Elab/Driver.vuna:47"));
  ("v_Vuna_dCompiler_dElab_dDriver_dwithMetaCreated", ("Vuna.Compiler.Elab.Driver.withMetaCreated", "Vuna/Compiler/Elab/Driver.vuna:1332"));
  ("v_Vuna_dCompiler_dElab_dDriver_dzipKeptArgs", ("Vuna.Compiler.Elab.Driver.zipKeptArgs", "Vuna/Compiler/Elab/Driver.vuna:630"));
  ("v_Vuna_dCompiler_dElab_dDriver_dzonkGoal", ("Vuna.Compiler.Elab.Driver.zonkGoal", "Vuna/Compiler/Elab/Driver.vuna:1220"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceExact", ("Vuna.Compiler.Elab.InstCoherence.anyInstanceExact", "Vuna/Compiler/Elab/InstCoherence.vuna:41"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_danyInstanceOverlap", ("Vuna.Compiler.Elab.InstCoherence.anyInstanceOverlap", "Vuna/Compiler/Elab/InstCoherence.vuna:49"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dfindInstanceClash", ("Vuna.Compiler.Elab.InstCoherence.findInstanceClash", "Vuna/Compiler/Elab/InstCoherence.vuna:35"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dheadsAlphaEqual", ("Vuna.Compiler.Elab.InstCoherence.headsAlphaEqual", "Vuna/Compiler/Elab/InstCoherence.vuna:63"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlap", ("Vuna.Compiler.Elab.InstCoherence.headsOverlap", "Vuna/Compiler/Elab/InstCoherence.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dheadsOverlapOne", ("Vuna.Compiler.Elab.InstCoherence.headsOverlapOne", "Vuna/Compiler/Elab/InstCoherence.vuna:86"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dinstanceExactQuiet", ("Vuna.Compiler.Elab.InstCoherence.instanceExactQuiet", "Vuna/Compiler/Elab/InstCoherence.vuna:58"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnv", ("Vuna.Compiler.Elab.InstCoherence.teleAlphaEnv", "Vuna/Compiler/Elab/InstCoherence.vuna:68"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dteleAlphaEnvGo", ("Vuna.Compiler.Elab.InstCoherence.teleAlphaEnvGo", "Vuna/Compiler/Elab/InstCoherence.vuna:71"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnv", ("Vuna.Compiler.Elab.InstCoherence.teleGlobalEnv", "Vuna/Compiler/Elab/InstCoherence.vuna:96"));
  ("v_Vuna_dCompiler_dElab_dInstCoherence_dteleGlobalEnvGo", ("Vuna.Compiler.Elab.InstCoherence.teleGlobalEnvGo", "Vuna/Compiler/Elab/InstCoherence.vuna:99"));
  ("v_Vuna_dCompiler_dElab_dInstName_dargNameOf", ("Vuna.Compiler.Elab.InstName.argNameOf", "Vuna/Compiler/Elab/InstName.vuna:67"));
  ("v_Vuna_dCompiler_dElab_dInstName_dargSuffix", ("Vuna.Compiler.Elab.InstName.argSuffix", "Vuna/Compiler/Elab/InstName.vuna:51"));
  ("v_Vuna_dCompiler_dElab_dInstName_dargSuffixTail", ("Vuna.Compiler.Elab.InstName.argSuffixTail", "Vuna/Compiler/Elab/InstName.vuna:46"));
  ("v_Vuna_dCompiler_dElab_dInstName_dderivedInstName", ("Vuna.Compiler.Elab.InstName.derivedInstName", "Vuna/Compiler/Elab/InstName.vuna:41"));
  ("v_Vuna_dCompiler_dElab_dInstName_dexprNameFor", ("Vuna.Compiler.Elab.InstName.exprNameFor", "Vuna/Compiler/Elab/InstName.vuna:57"));
  ("v_Vuna_dCompiler_dElab_dInstName_dinstanceHeadName", ("Vuna.Compiler.Elab.InstName.instanceHeadName", "Vuna/Compiler/Elab/InstName.vuna:13"));
  ("v_Vuna_dCompiler_dElab_dInstName_dinstanceName", ("Vuna.Compiler.Elab.InstName.instanceName", "Vuna/Compiler/Elab/InstName.vuna:30"));
  ("v_Vuna_dCompiler_dElab_dInstName_dsanitizeInstName", ("Vuna.Compiler.Elab.InstName.sanitizeInstName", "Vuna/Compiler/Elab/InstName.vuna:36"));
  ("v_Vuna_dCompiler_dElab_dMatch_daddNameDistinct", ("Vuna.Compiler.Elab.Match.addNameDistinct", "Vuna/Compiler/Elab/Match.vuna:456"));
  ("v_Vuna_dCompiler_dElab_dMatch_dallCtorHeads", ("Vuna.Compiler.Elab.Match.allCtorHeads", "Vuna/Compiler/Elab/Match.vuna:242"));
  ("v_Vuna_dCompiler_dElab_dMatch_dallEmptyPats", ("Vuna.Compiler.Elab.Match.allEmptyPats", "Vuna/Compiler/Elab/Match.vuna:279"));
  ("v_Vuna_dCompiler_dElab_dMatch_dallIrrefutablePats", ("Vuna.Compiler.Elab.Match.allIrrefutablePats", "Vuna/Compiler/Elab/Match.vuna:270"));
  ("v_Vuna_dCompiler_dElab_dMatch_dallVarHeads", ("Vuna.Compiler.Elab.Match.allVarHeads", "Vuna/Compiler/Elab/Match.vuna:294"));
  ("v_Vuna_dCompiler_dElab_dMatch_dallVarPats", ("Vuna.Compiler.Elab.Match.allVarPats", "Vuna/Compiler/Elab/Match.vuna:27"));
  ("v_Vuna_dCompiler_dElab_dMatch_dallWildPats", ("Vuna.Compiler.Elab.Match.allWildPats", "Vuna/Compiler/Elab/Match.vuna:251"));
  ("v_Vuna_dCompiler_dElab_dMatch_darityOf", ("Vuna.Compiler.Elab.Match.arityOf", "Vuna/Compiler/Elab/Match.vuna:71"));
  ("v_Vuna_dCompiler_dElab_dMatch_dasColumn", ("Vuna.Compiler.Elab.Match.asColumn", "Vuna/Compiler/Elab/Match.vuna:178"));
  ("v_Vuna_dCompiler_dElab_dMatch_dasInnerClause", ("Vuna.Compiler.Elab.Match.asInnerClause", "Vuna/Compiler/Elab/Match.vuna:185"));
  ("v_Vuna_dCompiler_dElab_dMatch_dbindNames", ("Vuna.Compiler.Elab.Match.bindNames", "Vuna/Compiler/Elab/Match.vuna:382"));
  ("v_Vuna_dCompiler_dElab_dMatch_dbodyOfFirst", ("Vuna.Compiler.Elab.Match.bodyOfFirst", "Vuna/Compiler/Elab/Match.vuna:285"));
  ("v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExpr", ("Vuna.Compiler.Elab.Match.buildColumnExpr", "Vuna/Compiler/Elab/Match.vuna:148"));
  ("v_Vuna_dCompiler_dElab_dMatch_dbuildColumnExprPruned", ("Vuna.Compiler.Elab.Match.buildColumnExprPruned", "Vuna/Compiler/Elab/Match.vuna:153"));
  ("v_Vuna_dCompiler_dElab_dMatch_dclauseArityTooMany", ("Vuna.Compiler.Elab.Match.clauseArityTooMany", "Vuna/Compiler/Elab/Match.vuna:38"));
  ("v_Vuna_dCompiler_dElab_dMatch_dclausesForCtor", ("Vuna.Compiler.Elab.Match.clausesForCtor", "Vuna/Compiler/Elab/Match.vuna:464"));
  ("v_Vuna_dCompiler_dElab_dMatch_dctorAltList", ("Vuna.Compiler.Elab.Match.ctorAltList", "Vuna/Compiler/Elab/Match.vuna:406"));
  ("v_Vuna_dCompiler_dElab_dMatch_dctorAltListGo", ("Vuna.Compiler.Elab.Match.ctorAltListGo", "Vuna/Compiler/Elab/Match.vuna:411"));
  ("v_Vuna_dCompiler_dElab_dMatch_dctorColumn", ("Vuna.Compiler.Elab.Match.ctorColumn", "Vuna/Compiler/Elab/Match.vuna:209"));
  ("v_Vuna_dCompiler_dElab_dMatch_dctorHeads", ("Vuna.Compiler.Elab.Match.ctorHeads", "Vuna/Compiler/Elab/Match.vuna:448"));
  ("v_Vuna_dCompiler_dElab_dMatch_dctorSubPatCount", ("Vuna.Compiler.Elab.Match.ctorSubPatCount", "Vuna/Compiler/Elab/Match.vuna:426"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfallbackAltList", ("Vuna.Compiler.Elab.Match.fallbackAltList", "Vuna/Compiler/Elab/Match.vuna:486"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfamilyCovered", ("Vuna.Compiler.Elab.Match.familyCovered", "Vuna/Compiler/Elab/Match.vuna:225"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfamilyOfCtor", ("Vuna.Compiler.Elab.Match.familyOfCtor", "Vuna/Compiler/Elab/Match.vuna:219"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfilterFallback", ("Vuna.Compiler.Elab.Match.filterFallback", "Vuna/Compiler/Elab/Match.vuna:477"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfilterLitBranch", ("Vuna.Compiler.Elab.Match.filterLitBranch", "Vuna/Compiler/Elab/Match.vuna:116"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfirstPatSpan", ("Vuna.Compiler.Elab.Match.firstPatSpan", "Vuna/Compiler/Elab/Match.vuna:200"));
  ("v_Vuna_dCompiler_dElab_dMatch_dfirstPats", ("Vuna.Compiler.Elab.Match.firstPats", "Vuna/Compiler/Elab/Match.vuna:259"));
  ("v_Vuna_dCompiler_dElab_dMatch_dhasAsHead", ("Vuna.Compiler.Elab.Match.hasAsHead", "Vuna/Compiler/Elab/Match.vuna:172"));
  ("v_Vuna_dCompiler_dElab_dMatch_dhasCtorHead", ("Vuna.Compiler.Elab.Match.hasCtorHead", "Vuna/Compiler/Elab/Match.vuna:233"));
  ("v_Vuna_dCompiler_dElab_dMatch_dinnerOfHead", ("Vuna.Compiler.Elab.Match.innerOfHead", "Vuna/Compiler/Elab/Match.vuna:189"));
  ("v_Vuna_dCompiler_dElab_dMatch_dirrefutablePat", ("Vuna.Compiler.Elab.Match.irrefutablePat", "Vuna/Compiler/Elab/Match.vuna:264"));
  ("v_Vuna_dCompiler_dElab_dMatch_disVarPatD", ("Vuna.Compiler.Elab.Match.isVarPatD", "Vuna/Compiler/Elab/Match.vuna:289"));
  ("v_Vuna_dCompiler_dElab_dMatch_disWildPat", ("Vuna.Compiler.Elab.Match.isWildPat", "Vuna/Compiler/Elab/Match.vuna:255"));
  ("v_Vuna_dCompiler_dElab_dMatch_dlitAltExpr", ("Vuna.Compiler.Elab.Match.litAltExpr", "Vuna/Compiler/Elab/Match.vuna:90"));
  ("v_Vuna_dCompiler_dElab_dMatch_dlitAltExprGo", ("Vuna.Compiler.Elab.Match.litAltExprGo", "Vuna/Compiler/Elab/Match.vuna:94"));
  ("v_Vuna_dCompiler_dElab_dMatch_dlitBranchClauses", ("Vuna.Compiler.Elab.Match.litBranchClauses", "Vuna/Compiler/Elab/Match.vuna:113"));
  ("v_Vuna_dCompiler_dElab_dMatch_dlitPatExpr", ("Vuna.Compiler.Elab.Match.litPatExpr", "Vuna/Compiler/Elab/Match.vuna:142"));
  ("v_Vuna_dCompiler_dElab_dMatch_dlitPatMatches", ("Vuna.Compiler.Elab.Match.litPatMatches", "Vuna/Compiler/Elab/Match.vuna:128"));
  ("v_Vuna_dCompiler_dElab_dMatch_dliteralBranchBody", ("Vuna.Compiler.Elab.Match.literalBranchBody", "Vuna/Compiler/Elab/Match.vuna:124"));
  ("v_Vuna_dCompiler_dElab_dMatch_dmatrixOf", ("Vuna.Compiler.Elab.Match.matrixOf", "Vuna/Compiler/Elab/Match.vuna:64"));
  ("v_Vuna_dCompiler_dElab_dMatch_dmultiToCaseExpr", ("Vuna.Compiler.Elab.Match.multiToCaseExpr", "Vuna/Compiler/Elab/Match.vuna:56"));
  ("v_Vuna_dCompiler_dElab_dMatch_dmultiToExpr", ("Vuna.Compiler.Elab.Match.multiToExpr", "Vuna/Compiler/Elab/Match.vuna:43"));
  ("v_Vuna_dCompiler_dElab_dMatch_dparamNames", ("Vuna.Compiler.Elab.Match.paramNames", "Vuna/Compiler/Elab/Match.vuna:75"));
  ("v_Vuna_dCompiler_dElab_dMatch_dparamNamesGo", ("Vuna.Compiler.Elab.Match.paramNamesGo", "Vuna/Compiler/Elab/Match.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dMatch_dpatNamesOf", ("Vuna.Compiler.Elab.Match.patNamesOf", "Vuna/Compiler/Elab/Match.vuna:386"));
  ("v_Vuna_dCompiler_dElab_dMatch_dprepFallbacks", ("Vuna.Compiler.Elab.Match.prepFallbacks", "Vuna/Compiler/Elab/Match.vuna:494"));
  ("v_Vuna_dCompiler_dElab_dMatch_dprepVarColumn", ("Vuna.Compiler.Elab.Match.prepVarColumn", "Vuna/Compiler/Elab/Match.vuna:309"));
  ("v_Vuna_dCompiler_dElab_dMatch_dpruneRows", ("Vuna.Compiler.Elab.Match.pruneRows", "Vuna/Compiler/Elab/Match.vuna:275"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameAlt", ("Vuna.Compiler.Elab.Match.renameAlt", "Vuna/Compiler/Elab/Match.vuna:395"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameAsHead", ("Vuna.Compiler.Elab.Match.renameAsHead", "Vuna/Compiler/Elab/Match.vuna:193"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameBind", ("Vuna.Compiler.Elab.Match.renameBind", "Vuna/Compiler/Elab/Match.vuna:369"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameExpr", ("Vuna.Compiler.Elab.Match.renameExpr", "Vuna/Compiler/Elab/Match.vuna:318"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameExprUnless", ("Vuna.Compiler.Elab.Match.renameExprUnless", "Vuna/Compiler/Elab/Match.vuna:365"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameFieldValue", ("Vuna.Compiler.Elab.Match.renameFieldValue", "Vuna/Compiler/Elab/Match.vuna:372"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameInterpParts", ("Vuna.Compiler.Elab.Match.renameInterpParts", "Vuna/Compiler/Elab/Match.vuna:358"));
  ("v_Vuna_dCompiler_dElab_dMatch_drenameLocalClause", ("Vuna.Compiler.Elab.Match.renameLocalClause", "Vuna/Compiler/Elab/Match.vuna:377"));
  ("v_Vuna_dCompiler_dElab_dMatch_dstripAsPat", ("Vuna.Compiler.Elab.Match.stripAsPat", "Vuna/Compiler/Elab/Match.vuna:67"));
  ("v_Vuna_dCompiler_dElab_dMatch_dstripFirstCol", ("Vuna.Compiler.Elab.Match.stripFirstCol", "Vuna/Compiler/Elab/Match.vuna:300"));
  ("v_Vuna_dCompiler_dElab_dMatch_dsubNamesFor", ("Vuna.Compiler.Elab.Match.subNamesFor", "Vuna/Compiler/Elab/Match.vuna:437"));
  ("v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGo", ("Vuna.Compiler.Elab.Match.subNamesForGo", "Vuna/Compiler/Elab/Match.vuna:440"));
  ("v_Vuna_dCompiler_dElab_dMatch_dsubNamesForGoGo", ("Vuna.Compiler.Elab.Match.subNamesForGoGo", "Vuna/Compiler/Elab/Match.vuna:443"));
  ("v_Vuna_dCompiler_dElab_dMatch_dwrapLambdas", ("Vuna.Compiler.Elab.Match.wrapLambdas", "Vuna/Compiler/Elab/Match.vuna:83"));
  ("v_Vuna_dCompiler_dElab_dMetaSpans_dlookupMeta", ("Vuna.Compiler.Elab.MetaSpans.lookupMeta", "Vuna/Compiler/Elab/MetaSpans.vuna:29"));
  ("v_Vuna_dCompiler_dElab_dMetaSpans_dmetaSpanOf", ("Vuna.Compiler.Elab.MetaSpans.metaSpanOf", "Vuna/Compiler/Elab/MetaSpans.vuna:25"));
  ("v_Vuna_dCompiler_dElab_dMetaSpans_dnewHoleMeta", ("Vuna.Compiler.Elab.MetaSpans.newHoleMeta", "Vuna/Compiler/Elab/MetaSpans.vuna:42"));
  ("v_Vuna_dCompiler_dElab_dMetaSpans_dnewMetaAt", ("Vuna.Compiler.Elab.MetaSpans.newMetaAt", "Vuna/Compiler/Elab/MetaSpans.vuna:34"));
  ("v_Vuna_dCompiler_dElab_dMetaSpans_drecordMetaSpan", ("Vuna.Compiler.Elab.MetaSpans.recordMetaSpan", "Vuna/Compiler/Elab/MetaSpans.vuna:21"));
  ("v_Vuna_dCompiler_dElab_dMeta_dallTeleArgs", ("Vuna.Compiler.Elab.Meta.allTeleArgs", "Vuna/Compiler/Elab/Meta.vuna:668"));
  ("v_Vuna_dCompiler_dElab_dMeta_danyCtorIndexed", ("Vuna.Compiler.Elab.Meta.anyCtorIndexed", "Vuna/Compiler/Elab/Meta.vuna:1267"));
  ("v_Vuna_dCompiler_dElab_dMeta_danyLinearVals", ("Vuna.Compiler.Elab.Meta.anyLinearVals", "Vuna/Compiler/Elab/Meta.vuna:1013"));
  ("v_Vuna_dCompiler_dElab_dMeta_danyNonVarArg", ("Vuna.Compiler.Elab.Meta.anyNonVarArg", "Vuna/Compiler/Elab/Meta.vuna:1279"));
  ("v_Vuna_dCompiler_dElab_dMeta_dbaseNameOf", ("Vuna.Compiler.Elab.Meta.baseNameOf", "Vuna/Compiler/Elab/Meta.vuna:1241"));
  ("v_Vuna_dCompiler_dElab_dMeta_dbinderRig", ("Vuna.Compiler.Elab.Meta.binderRig", "Vuna/Compiler/Elab/Meta.vuna:830"));
  ("v_Vuna_dCompiler_dElab_dMeta_dboolCtorTerm", ("Vuna.Compiler.Elab.Meta.boolCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:72"));
  ("v_Vuna_dCompiler_dElab_dMeta_dboolCtorValue", ("Vuna.Compiler.Elab.Meta.boolCtorValue", "Vuna/Compiler/Elab/Meta.vuna:68"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcandidatesInFamily", ("Vuna.Compiler.Elab.Meta.candidatesInFamily", "Vuna/Compiler/Elab/Meta.vuna:409"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcastErased", ("Vuna.Compiler.Elab.Meta.castErased", "Vuna/Compiler/Elab/Meta.vuna:943"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcollectDataDecls", ("Vuna.Compiler.Elab.Meta.collectDataDecls", "Vuna/Compiler/Elab/Meta.vuna:260"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcollectInstDecls", ("Vuna.Compiler.Elab.Meta.collectInstDecls", "Vuna/Compiler/Elab/Meta.vuna:605"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcollectSigOne", ("Vuna.Compiler.Elab.Meta.collectSigOne", "Vuna/Compiler/Elab/Meta.vuna:250"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcollectSigs", ("Vuna.Compiler.Elab.Meta.collectSigs", "Vuna/Compiler/Elab/Meta.vuna:219"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcollectSigsInto", ("Vuna.Compiler.Elab.Meta.collectSigsInto", "Vuna/Compiler/Elab/Meta.vuna:233"));
  ("v_Vuna_dCompiler_dElab_dMeta_dcollectTraitDecls", ("Vuna.Compiler.Elab.Meta.collectTraitDecls", "Vuna/Compiler/Elab/Meta.vuna:599"));
  ("v_Vuna_dCompiler_dElab_dMeta_dconvEc", ("Vuna.Compiler.Elab.Meta.convEc", "Vuna/Compiler/Elab/Meta.vuna:105"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorAppTerm", ("Vuna.Compiler.Elab.Meta.ctorAppTerm", "Vuna/Compiler/Elab/Meta.vuna:1161"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorAppTermEc", ("Vuna.Compiler.Elab.Meta.ctorAppTermEc", "Vuna/Compiler/Elab/Meta.vuna:1152"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorFamilyIs", ("Vuna.Compiler.Elab.Meta.ctorFamilyIs", "Vuna/Compiler/Elab/Meta.vuna:403"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorFamilyNameOf", ("Vuna.Compiler.Elab.Meta.ctorFamilyNameOf", "Vuna/Compiler/Elab/Meta.vuna:371"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorFamilyTable", ("Vuna.Compiler.Elab.Meta.ctorFamilyTable", "Vuna/Compiler/Elab/Meta.vuna:1255"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorGlobals", ("Vuna.Compiler.Elab.Meta.ctorGlobals", "Vuna/Compiler/Elab/Meta.vuna:568"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorLinearName", ("Vuna.Compiler.Elab.Meta.ctorLinearName", "Vuna/Compiler/Elab/Meta.vuna:1022"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorRefTerm", ("Vuna.Compiler.Elab.Meta.ctorRefTerm", "Vuna/Compiler/Elab/Meta.vuna:1140"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorRefTermEc", ("Vuna.Compiler.Elab.Meta.ctorRefTermEc", "Vuna/Compiler/Elab/Meta.vuna:1133"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctorResultIndexed", ("Vuna.Compiler.Elab.Meta.ctorResultIndexed", "Vuna/Compiler/Elab/Meta.vuna:1271"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctxHasLinear", ("Vuna.Compiler.Elab.Meta.ctxHasLinear", "Vuna/Compiler/Elab/Meta.vuna:1043"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctxHasLinearItems", ("Vuna.Compiler.Elab.Meta.ctxHasLinearItems", "Vuna/Compiler/Elab/Meta.vuna:1046"));
  ("v_Vuna_dCompiler_dElab_dMeta_dctxItemAt", ("Vuna.Compiler.Elab.Meta.ctxItemAt", "Vuna/Compiler/Elab/Meta.vuna:808"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddataLinearName", ("Vuna.Compiler.Elab.Meta.dataLinearName", "Vuna/Compiler/Elab/Meta.vuna:1017"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddataNamesOf", ("Vuna.Compiler.Elab.Meta.dataNamesOf", "Vuna/Compiler/Elab/Meta.vuna:271"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddataShortNameOf", ("Vuna.Compiler.Elab.Meta.dataShortNameOf", "Vuna/Compiler/Elab/Meta.vuna:358"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddefaultOrOver", ("Vuna.Compiler.Elab.Meta.defaultOrOver", "Vuna/Compiler/Elab/Meta.vuna:433"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddictCtorName", ("Vuna.Compiler.Elab.Meta.dictCtorName", "Vuna/Compiler/Elab/Meta.vuna:595"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddictTypeName", ("Vuna.Compiler.Elab.Meta.dictTypeName", "Vuna/Compiler/Elab/Meta.vuna:592"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddropCount", ("Vuna.Compiler.Elab.Meta.dropCount", "Vuna/Compiler/Elab/Meta.vuna:1213"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddropParams", ("Vuna.Compiler.Elab.Meta.dropParams", "Vuna/Compiler/Elab/Meta.vuna:564"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddropPis", ("Vuna.Compiler.Elab.Meta.dropPis", "Vuna/Compiler/Elab/Meta.vuna:1275"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookup", ("Vuna.Compiler.Elab.Meta.dtCtorLookup", "Vuna/Compiler/Elab/Meta.vuna:314"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddtCtorLookupEc", ("Vuna.Compiler.Elab.Meta.dtCtorLookupEc", "Vuna/Compiler/Elab/Meta.vuna:323"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddtDataLookup", ("Vuna.Compiler.Elab.Meta.dtDataLookup", "Vuna/Compiler/Elab/Meta.vuna:306"));
  ("v_Vuna_dCompiler_dElab_dMeta_ddualFamilyOf", ("Vuna.Compiler.Elab.Meta.dualFamilyOf", "Vuna/Compiler/Elab/Meta.vuna:394"));
  ("v_Vuna_dCompiler_dElab_dMeta_detaCtorLa", ("Vuna.Compiler.Elab.Meta.etaCtorLa", "Vuna/Compiler/Elab/Meta.vuna:1204"));
  ("v_Vuna_dCompiler_dElab_dMeta_detaCtorTerm", ("Vuna.Compiler.Elab.Meta.etaCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:1187"));
  ("v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOf", ("Vuna.Compiler.Elab.Meta.expectedFamilyOf", "Vuna/Compiler/Elab/Meta.vuna:377"));
  ("v_Vuna_dCompiler_dElab_dMeta_dexpectedFamilyOfFuel", ("Vuna.Compiler.Elab.Meta.expectedFamilyOfFuel", "Vuna/Compiler/Elab/Meta.vuna:381"));
  ("v_Vuna_dCompiler_dElab_dMeta_dexplicitPiArity", ("Vuna.Compiler.Elab.Meta.explicitPiArity", "Vuna/Compiler/Elab/Meta.vuna:1248"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfamilyIndexed", ("Vuna.Compiler.Elab.Meta.familyIndexed", "Vuna/Compiler/Elab/Meta.vuna:1264"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGo", ("Vuna.Compiler.Elab.Meta.fieldBinderGo", "Vuna/Compiler/Elab/Meta.vuna:640"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfieldBinderGoGo", ("Vuna.Compiler.Elab.Meta.fieldBinderGoGo", "Vuna/Compiler/Elab/Meta.vuna:643"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfieldBinderNames", ("Vuna.Compiler.Elab.Meta.fieldBinderNames", "Vuna/Compiler/Elab/Meta.vuna:637"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfieldVarName", ("Vuna.Compiler.Elab.Meta.fieldVarName", "Vuna/Compiler/Elab/Meta.vuna:634"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfindCatchAllBody", ("Vuna.Compiler.Elab.Meta.findCatchAllBody", "Vuna/Compiler/Elab/Meta.vuna:1286"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfindClassByShortName", ("Vuna.Compiler.Elab.Meta.findClassByShortName", "Vuna/Compiler/Elab/Meta.vuna:650"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfindCtorIn", ("Vuna.Compiler.Elab.Meta.findCtorIn", "Vuna/Compiler/Elab/Meta.vuna:310"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfoldAppTerms", ("Vuna.Compiler.Elab.Meta.foldAppTerms", "Vuna/Compiler/Elab/Meta.vuna:1219"));
  ("v_Vuna_dCompiler_dElab_dMeta_dfreshVarValue", ("Vuna.Compiler.Elab.Meta.freshVarValue", "Vuna/Compiler/Elab/Meta.vuna:1101"));
  ("v_Vuna_dCompiler_dElab_dMeta_dglobalLookup", ("Vuna.Compiler.Elab.Meta.globalLookup", "Vuna/Compiler/Elab/Meta.vuna:189"));
  ("v_Vuna_dCompiler_dElab_dMeta_dglobalsLookup", ("Vuna.Compiler.Elab.Meta.globalsLookup", "Vuna/Compiler/Elab/Meta.vuna:196"));
  ("v_Vuna_dCompiler_dElab_dMeta_dglobalsTableOf", ("Vuna.Compiler.Elab.Meta.globalsTableOf", "Vuna/Compiler/Elab/Meta.vuna:207"));
  ("v_Vuna_dCompiler_dElab_dMeta_dhasFamParams", ("Vuna.Compiler.Elab.Meta.hasFamParams", "Vuna/Compiler/Elab/Meta.vuna:1230"));
  ("v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPi", ("Vuna.Compiler.Elab.Meta.hasNoExplicitPi", "Vuna/Compiler/Elab/Meta.vuna:27"));
  ("v_Vuna_dCompiler_dElab_dMeta_dhasNoExplicitPiFuel", ("Vuna.Compiler.Elab.Meta.hasNoExplicitPiFuel", "Vuna/Compiler/Elab/Meta.vuna:30"));
  ("v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVar", ("Vuna.Compiler.Elab.Meta.hasOutOfScopeVar", "Vuna/Compiler/Elab/Meta.vuna:543"));
  ("v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarAlts", ("Vuna.Compiler.Elab.Meta.hasOutOfScopeVarAlts", "Vuna/Compiler/Elab/Meta.vuna:549"));
  ("v_Vuna_dCompiler_dElab_dMeta_dhasOutOfScopeVarArgs", ("Vuna.Compiler.Elab.Meta.hasOutOfScopeVarArgs", "Vuna/Compiler/Elab/Meta.vuna:546"));
  ("v_Vuna_dCompiler_dElab_dMeta_dimplicitBinderRig", ("Vuna.Compiler.Elab.Meta.implicitBinderRig", "Vuna/Compiler/Elab/Meta.vuna:754"));
  ("v_Vuna_dCompiler_dElab_dMeta_dinferCtorRef", ("Vuna.Compiler.Elab.Meta.inferCtorRef", "Vuna/Compiler/Elab/Meta.vuna:80"));
  ("v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtor", ("Vuna.Compiler.Elab.Meta.instantiateNullaryCtor", "Vuna/Compiler/Elab/Meta.vuna:41"));
  ("v_Vuna_dCompiler_dElab_dMeta_dinstantiateNullaryCtorFuel", ("Vuna.Compiler.Elab.Meta.instantiateNullaryCtorFuel", "Vuna/Compiler/Elab/Meta.vuna:44"));
  ("v_Vuna_dCompiler_dElab_dMeta_disBlanketInst", ("Vuna.Compiler.Elab.Meta.isBlanketInst", "Vuna/Compiler/Elab/Meta.vuna:674"));
  ("v_Vuna_dCompiler_dElab_dMeta_disBlanketInstHead", ("Vuna.Compiler.Elab.Meta.isBlanketInstHead", "Vuna/Compiler/Elab/Meta.vuna:662"));
  ("v_Vuna_dCompiler_dElab_dMeta_disBoolGlobal", ("Vuna.Compiler.Elab.Meta.isBoolGlobal", "Vuna/Compiler/Elab/Meta.vuna:1116"));
  ("v_Vuna_dCompiler_dElab_dMeta_disBoolType", ("Vuna.Compiler.Elab.Meta.isBoolType", "Vuna/Compiler/Elab/Meta.vuna:1108"));
  ("v_Vuna_dCompiler_dElab_dMeta_disDataFamilyName", ("Vuna.Compiler.Elab.Meta.isDataFamilyName", "Vuna/Compiler/Elab/Meta.vuna:340"));
  ("v_Vuna_dCompiler_dElab_dMeta_disDataHead", ("Vuna.Compiler.Elab.Meta.isDataHead", "Vuna/Compiler/Elab/Meta.vuna:1093"));
  ("v_Vuna_dCompiler_dElab_dMeta_disFamilyKindFuel", ("Vuna.Compiler.Elab.Meta.isFamilyKindFuel", "Vuna/Compiler/Elab/Meta.vuna:861"));
  ("v_Vuna_dCompiler_dElab_dMeta_disFamilyKindValue", ("Vuna.Compiler.Elab.Meta.isFamilyKindValue", "Vuna/Compiler/Elab/Meta.vuna:858"));
  ("v_Vuna_dCompiler_dElab_dMeta_disImplicitDomain", ("Vuna.Compiler.Elab.Meta.isImplicitDomain", "Vuna/Compiler/Elab/Meta.vuna:732"));
  ("v_Vuna_dCompiler_dElab_dMeta_disIndexDomain", ("Vuna.Compiler.Elab.Meta.isIndexDomain", "Vuna/Compiler/Elab/Meta.vuna:717"));
  ("v_Vuna_dCompiler_dElab_dMeta_disKindWithCtx", ("Vuna.Compiler.Elab.Meta.isKindWithCtx", "Vuna/Compiler/Elab/Meta.vuna:778"));
  ("v_Vuna_dCompiler_dElab_dMeta_disKindWithCtxFuel", ("Vuna.Compiler.Elab.Meta.isKindWithCtxFuel", "Vuna/Compiler/Elab/Meta.vuna:781"));
  ("v_Vuna_dCompiler_dElab_dMeta_disLinClosureName", ("Vuna.Compiler.Elab.Meta.isLinClosureName", "Vuna/Compiler/Elab/Meta.vuna:700"));
  ("v_Vuna_dCompiler_dElab_dMeta_disLinearType", ("Vuna.Compiler.Elab.Meta.isLinearType", "Vuna/Compiler/Elab/Meta.vuna:1001"));
  ("v_Vuna_dCompiler_dElab_dMeta_disLinearTypeFuel", ("Vuna.Compiler.Elab.Meta.isLinearTypeFuel", "Vuna/Compiler/Elab/Meta.vuna:1004"));
  ("v_Vuna_dCompiler_dElab_dMeta_disOpaqueRuntimeTyIn", ("Vuna.Compiler.Elab.Meta.isOpaqueRuntimeTyIn", "Vuna/Compiler/Elab/Meta.vuna:938"));
  ("v_Vuna_dCompiler_dElab_dMeta_disSortExpr", ("Vuna.Compiler.Elab.Meta.isSortExpr", "Vuna/Compiler/Elab/Meta.vuna:1235"));
  ("v_Vuna_dCompiler_dElab_dMeta_disSortVal", ("Vuna.Compiler.Elab.Meta.isSortVal", "Vuna/Compiler/Elab/Meta.vuna:1121"));
  ("v_Vuna_dCompiler_dElab_dMeta_disStringImplicitDomain", ("Vuna.Compiler.Elab.Meta.isStringImplicitDomain", "Vuna/Compiler/Elab/Meta.vuna:749"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeDomain", ("Vuna.Compiler.Elab.Meta.isTypeDomain", "Vuna/Compiler/Elab/Meta.vuna:827"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeHeadOpaqueEc", ("Vuna.Compiler.Elab.Meta.isTypeHeadOpaqueEc", "Vuna/Compiler/Elab/Meta.vuna:854"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValue", ("Vuna.Compiler.Elab.Meta.isTypeLayerValue", "Vuna/Compiler/Elab/Meta.vuna:1081"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeLayerValueFuel", ("Vuna.Compiler.Elab.Meta.isTypeLayerValueFuel", "Vuna/Compiler/Elab/Meta.vuna:1084"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeLevelGlobal", ("Vuna.Compiler.Elab.Meta.isTypeLevelGlobal", "Vuna/Compiler/Elab/Meta.vuna:346"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeLikeWithCtx", ("Vuna.Compiler.Elab.Meta.isTypeLikeWithCtx", "Vuna/Compiler/Elab/Meta.vuna:793"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeName", ("Vuna.Compiler.Elab.Meta.isTypeName", "Vuna/Compiler/Elab/Meta.vuna:351"));
  ("v_Vuna_dCompiler_dElab_dMeta_disTypeishValue", ("Vuna.Compiler.Elab.Meta.isTypeishValue", "Vuna/Compiler/Elab/Meta.vuna:912"));
  ("v_Vuna_dCompiler_dElab_dMeta_disUniverseValue", ("Vuna.Compiler.Elab.Meta.isUniverseValue", "Vuna/Compiler/Elab/Meta.vuna:869"));
  ("v_Vuna_dCompiler_dElab_dMeta_dkindDomainWellFormed", ("Vuna.Compiler.Elab.Meta.kindDomainWellFormed", "Vuna/Compiler/Elab/Meta.vuna:296"));
  ("v_Vuna_dCompiler_dElab_dMeta_dkindWellFormed", ("Vuna.Compiler.Elab.Meta.kindWellFormed", "Vuna/Compiler/Elab/Meta.vuna:289"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlinClosureMark", ("Vuna.Compiler.Elab.Meta.linClosureMark", "Vuna/Compiler/Elab/Meta.vuna:693"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlinClosureName", ("Vuna.Compiler.Elab.Meta.linClosureName", "Vuna/Compiler/Elab/Meta.vuna:696"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigGo", ("Vuna.Compiler.Elab.Meta.linClosureOrigGo", "Vuna/Compiler/Elab/Meta.vuna:706"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlinClosureOrigName", ("Vuna.Compiler.Elab.Meta.linClosureOrigName", "Vuna/Compiler/Elab/Meta.vuna:703"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlitEqName", ("Vuna.Compiler.Elab.Meta.litEqName", "Vuna/Compiler/Elab/Meta.vuna:711"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlookupDataHead", ("Vuna.Compiler.Elab.Meta.lookupDataHead", "Vuna/Compiler/Elab/Meta.vuna:578"));
  ("v_Vuna_dCompiler_dElab_dMeta_dlookupSpanPair", ("Vuna.Compiler.Elab.Meta.lookupSpanPair", "Vuna/Compiler/Elab/Meta.vuna:101"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmaxInt", ("Vuna.Compiler.Elab.Meta.maxInt", "Vuna/Compiler/Elab/Meta.vuna:186"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmemDefName", ("Vuna.Compiler.Elab.Meta.memDefName", "Vuna/Compiler/Elab/Meta.vuna:215"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmemLevel", ("Vuna.Compiler.Elab.Meta.memLevel", "Vuna/Compiler/Elab/Meta.vuna:919"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmemMetaId", ("Vuna.Compiler.Elab.Meta.memMetaId", "Vuna/Compiler/Elab/Meta.vuna:127"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmemSig", ("Vuna.Compiler.Elab.Meta.memSig", "Vuna/Compiler/Elab/Meta.vuna:211"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmetaSpanOf", ("Vuna.Compiler.Elab.Meta.metaSpanOf", "Vuna/Compiler/Elab/Meta.vuna:96"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmethodArgLams", ("Vuna.Compiler.Elab.Meta.methodArgLams", "Vuna/Compiler/Elab/Meta.vuna:627"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmethodArgTerms", ("Vuna.Compiler.Elab.Meta.methodArgTerms", "Vuna/Compiler/Elab/Meta.vuna:617"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmethodArgTermsGo", ("Vuna.Compiler.Elab.Meta.methodArgTermsGo", "Vuna/Compiler/Elab/Meta.vuna:620"));
  ("v_Vuna_dCompiler_dElab_dMeta_dmkCtorTerm", ("Vuna.Compiler.Elab.Meta.mkCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:1173"));
  ("v_Vuna_dCompiler_dElab_dMeta_dneutralBinderIndexDomain", ("Vuna.Compiler.Elab.Meta.neutralBinderIndexDomain", "Vuna/Compiler/Elab/Meta.vuna:759"));
  ("v_Vuna_dCompiler_dElab_dMeta_dneutralBinderType", ("Vuna.Compiler.Elab.Meta.neutralBinderType", "Vuna/Compiler/Elab/Meta.vuna:765"));
  ("v_Vuna_dCompiler_dElab_dMeta_dneutralHeadName", ("Vuna.Compiler.Elab.Meta.neutralHeadName", "Vuna/Compiler/Elab/Meta.vuna:1112"));
  ("v_Vuna_dCompiler_dElab_dMeta_dnonEmpty", ("Vuna.Compiler.Elab.Meta.nonEmpty", "Vuna/Compiler/Elab/Meta.vuna:278"));
  ("v_Vuna_dCompiler_dElab_dMeta_dnullaryCtorTerm", ("Vuna.Compiler.Elab.Meta.nullaryCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:56"));
  ("v_Vuna_dCompiler_dElab_dMeta_dnvarOpaqueCtx", ("Vuna.Compiler.Elab.Meta.nvarOpaqueCtx", "Vuna/Compiler/Elab/Meta.vuna:924"));
  ("v_Vuna_dCompiler_dElab_dMeta_douterScan", ("Vuna.Compiler.Elab.Meta.outerScan", "Vuna/Compiler/Elab/Meta.vuna:1056"));
  ("v_Vuna_dCompiler_dElab_dMeta_douterScanAlts", ("Vuna.Compiler.Elab.Meta.outerScanAlts", "Vuna/Compiler/Elab/Meta.vuna:1076"));
  ("v_Vuna_dCompiler_dElab_dMeta_douterScanArgs", ("Vuna.Compiler.Elab.Meta.outerScanArgs", "Vuna/Compiler/Elab/Meta.vuna:1071"));
  ("v_Vuna_dCompiler_dElab_dMeta_doverCandidatesText", ("Vuna.Compiler.Elab.Meta.overCandidatesText", "Vuna/Compiler/Elab/Meta.vuna:390"));
  ("v_Vuna_dCompiler_dElab_dMeta_dparamNameOf", ("Vuna.Compiler.Elab.Meta.paramNameOf", "Vuna/Compiler/Elab/Meta.vuna:612"));
  ("v_Vuna_dCompiler_dElab_dMeta_dprependFamParams", ("Vuna.Compiler.Elab.Meta.prependFamParams", "Vuna/Compiler/Elab/Meta.vuna:557"));
  ("v_Vuna_dCompiler_dElab_dMeta_drelevantMetas", ("Vuna.Compiler.Elab.Meta.relevantMetas", "Vuna/Compiler/Elab/Meta.vuna:131"));
  ("v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtor", ("Vuna.Compiler.Elab.Meta.resolveOverCtor", "Vuna/Compiler/Elab/Meta.vuna:414"));
  ("v_Vuna_dCompiler_dElab_dMeta_dresolveOverCtorGo", ("Vuna.Compiler.Elab.Meta.resolveOverCtorGo", "Vuna/Compiler/Elab/Meta.vuna:422"));
  ("v_Vuna_dCompiler_dElab_dMeta_dresultSpine", ("Vuna.Compiler.Elab.Meta.resultSpine", "Vuna/Compiler/Elab/Meta.vuna:485"));
  ("v_Vuna_dCompiler_dElab_dMeta_drigCaseField", ("Vuna.Compiler.Elab.Meta.rigCaseField", "Vuna/Compiler/Elab/Meta.vuna:1035"));
  ("v_Vuna_dCompiler_dElab_dMeta_drigForLinearDomain", ("Vuna.Compiler.Elab.Meta.rigForLinearDomain", "Vuna/Compiler/Elab/Meta.vuna:1028"));
  ("v_Vuna_dCompiler_dElab_dMeta_drigOfLinearValue", ("Vuna.Compiler.Elab.Meta.rigOfLinearValue", "Vuna/Compiler/Elab/Meta.vuna:1039"));
  ("v_Vuna_dCompiler_dElab_dMeta_drigOfQty", ("Vuna.Compiler.Elab.Meta.rigOfQty", "Vuna/Compiler/Elab/Meta.vuna:834"));
  ("v_Vuna_dCompiler_dElab_dMeta_dshiftCtorArgs", ("Vuna.Compiler.Elab.Meta.shiftCtorArgs", "Vuna/Compiler/Elab/Meta.vuna:1195"));
  ("v_Vuna_dCompiler_dElab_dMeta_dspineOfType", ("Vuna.Compiler.Elab.Meta.spineOfType", "Vuna/Compiler/Elab/Meta.vuna:478"));
  ("v_Vuna_dCompiler_dElab_dMeta_dsplitKind", ("Vuna.Compiler.Elab.Meta.splitKind", "Vuna/Compiler/Elab/Meta.vuna:302"));
  ("v_Vuna_dCompiler_dElab_dMeta_dsubstClassParam", ("Vuna.Compiler.Elab.Meta.substClassParam", "Vuna/Compiler/Elab/Meta.vuna:680"));
  ("v_Vuna_dCompiler_dElab_dMeta_dteleOf", ("Vuna.Compiler.Elab.Meta.teleOf", "Vuna/Compiler/Elab/Meta.vuna:470"));
  ("v_Vuna_dCompiler_dElab_dMeta_dteleOfType", ("Vuna.Compiler.Elab.Meta.teleOfType", "Vuna/Compiler/Elab/Meta.vuna:467"));
  ("v_Vuna_dCompiler_dElab_dMeta_dtermHasOuterLinear", ("Vuna.Compiler.Elab.Meta.termHasOuterLinear", "Vuna/Compiler/Elab/Meta.vuna:1053"));
  ("v_Vuna_dCompiler_dElab_dMeta_dtermMetasAll", ("Vuna.Compiler.Elab.Meta.termMetasAll", "Vuna/Compiler/Elab/Meta.vuna:165"));
  ("v_Vuna_dCompiler_dElab_dMeta_dtermMetasRuntime", ("Vuna.Compiler.Elab.Meta.termMetasRuntime", "Vuna/Compiler/Elab/Meta.vuna:137"));
  ("v_Vuna_dCompiler_dElab_dMeta_dtypeHeadLookup", ("Vuna.Compiler.Elab.Meta.typeHeadLookup", "Vuna/Compiler/Elab/Meta.vuna:442"));
  ("v_Vuna_dCompiler_dElab_dMeta_dtypeLookup", ("Vuna.Compiler.Elab.Meta.typeLookup", "Vuna/Compiler/Elab/Meta.vuna:448"));
  ("v_Vuna_dCompiler_dElab_dMeta_dtypeNameOfDualCtor", ("Vuna.Compiler.Elab.Meta.typeNameOfDualCtor", "Vuna/Compiler/Elab/Meta.vuna:362"));
  ("v_Vuna_dCompiler_dElab_dMeta_dunsolvedFrom", ("Vuna.Compiler.Elab.Meta.unsolvedFrom", "Vuna/Compiler/Elab/Meta.vuna:115"));
  ("v_Vuna_dCompiler_dElab_dMeta_dunsolvedFromGo", ("Vuna.Compiler.Elab.Meta.unsolvedFromGo", "Vuna/Compiler/Elab/Meta.vuna:118"));
  ("v_Vuna_dCompiler_dElab_dMeta_dvalueLookup", ("Vuna.Compiler.Elab.Meta.valueLookup", "Vuna/Compiler/Elab/Meta.vuna:458"));
  ("v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueGo", ("Vuna.Compiler.Elab.Meta.valueOpaqueGo", "Vuna/Compiler/Elab/Meta.vuna:881"));
  ("v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueScoped", ("Vuna.Compiler.Elab.Meta.valueOpaqueScoped", "Vuna/Compiler/Elab/Meta.vuna:877"));
  ("v_Vuna_dCompiler_dElab_dMeta_dvalueOpaqueTypeSpine", ("Vuna.Compiler.Elab.Meta.valueOpaqueTypeSpine", "Vuna/Compiler/Elab/Meta.vuna:902"));
  ("v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueAltFuel", ("Vuna.Compiler.Elab.Meta.wrapOpaqueAltFuel", "Vuna/Compiler/Elab/Meta.vuna:996"));
  ("v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUses", ("Vuna.Compiler.Elab.Meta.wrapOpaqueUses", "Vuna/Compiler/Elab/Meta.vuna:949"));
  ("v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueUsesFuel", ("Vuna.Compiler.Elab.Meta.wrapOpaqueUsesFuel", "Vuna/Compiler/Elab/Meta.vuna:952"));
  ("v_Vuna_dCompiler_dElab_dMeta_dwrapOpaqueVar", ("Vuna.Compiler.Elab.Meta.wrapOpaqueVar", "Vuna/Compiler/Elab/Meta.vuna:990"));
  ("v_Vuna_dCompiler_dElab_dMeta_dzipTeleRigs", ("Vuna.Compiler.Elab.Meta.zipTeleRigs", "Vuna/Compiler/Elab/Meta.vuna:61"));
  ("v_Vuna_dCompiler_dElab_dMeta_dzonkAlt", ("Vuna.Compiler.Elab.Meta.zonkAlt", "Vuna/Compiler/Elab/Meta.vuna:530"));
  ("v_Vuna_dCompiler_dElab_dMeta_dzonkAltFuel", ("Vuna.Compiler.Elab.Meta.zonkAltFuel", "Vuna/Compiler/Elab/Meta.vuna:535"));
  ("v_Vuna_dCompiler_dElab_dMeta_dzonkTerm", ("Vuna.Compiler.Elab.Meta.zonkTerm", "Vuna/Compiler/Elab/Meta.vuna:502"));
  ("v_Vuna_dCompiler_dElab_dMeta_dzonkTermFuel", ("Vuna.Compiler.Elab.Meta.zonkTermFuel", "Vuna/Compiler/Elab/Meta.vuna:505"));
  ("v_Vuna_dCompiler_dElab_dMeta_dzonkValueOnly", ("Vuna.Compiler.Elab.Meta.zonkValueOnly", "Vuna/Compiler/Elab/Meta.vuna:935"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dbaseNameOf", ("Vuna.Compiler.Elab.Prelude.baseNameOf", "Vuna/Compiler/Elab/Prelude.vuna:174"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dboolTy", ("Vuna.Compiler.Elab.Prelude.boolTy", "Vuna/Compiler/Elab/Prelude.vuna:33"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dboolTyValue", ("Vuna.Compiler.Elab.Prelude.boolTyValue", "Vuna/Compiler/Elab/Prelude.vuna:37"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dbuiltinEqTyName", ("Vuna.Compiler.Elab.Prelude.builtinEqTyName", "Vuna/Compiler/Elab/Prelude.vuna:149"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dbuiltinTyName", ("Vuna.Compiler.Elab.Prelude.builtinTyName", "Vuna/Compiler/Elab/Prelude.vuna:50"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjection", ("Vuna.Compiler.Elab.Prelude.classMethodProjection", "Vuna/Compiler/Elab/Prelude.vuna:178"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dclassMethodProjectionGo", ("Vuna.Compiler.Elab.Prelude.classMethodProjectionGo", "Vuna/Compiler/Elab/Prelude.vuna:181"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dcmpBuiltinTyName", ("Vuna.Compiler.Elab.Prelude.cmpBuiltinTyName", "Vuna/Compiler/Elab/Prelude.vuna:159"));
  ("v_Vuna_dCompiler_dElab_dPrelude_deqRuntimeName", ("Vuna.Compiler.Elab.Prelude.eqRuntimeName", "Vuna/Compiler/Elab/Prelude.vuna:63"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dfloatTy", ("Vuna.Compiler.Elab.Prelude.floatTy", "Vuna/Compiler/Elab/Prelude.vuna:29"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dfun2", ("Vuna.Compiler.Elab.Prelude.fun2", "Vuna/Compiler/Elab/Prelude.vuna:41"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dindexOfName", ("Vuna.Compiler.Elab.Prelude.indexOfName", "Vuna/Compiler/Elab/Prelude.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dindexOfNameGo", ("Vuna.Compiler.Elab.Prelude.indexOfNameGo", "Vuna/Compiler/Elab/Prelude.vuna:74"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dintTy", ("Vuna.Compiler.Elab.Prelude.intTy", "Vuna/Compiler/Elab/Prelude.vuna:22"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dinternalValueGlobals", ("Vuna.Compiler.Elab.Prelude.internalValueGlobals", "Vuna/Compiler/Elab/Prelude.vuna:136"));
  ("v_Vuna_dCompiler_dElab_dPrelude_disEqShort", ("Vuna.Compiler.Elab.Prelude.isEqShort", "Vuna/Compiler/Elab/Prelude.vuna:58"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dityToTerm", ("Vuna.Compiler.Elab.Prelude.ityToTerm", "Vuna/Compiler/Elab/Prelude.vuna:81"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dityToTermEnv", ("Vuna.Compiler.Elab.Prelude.ityToTermEnv", "Vuna/Compiler/Elab/Prelude.vuna:84"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dpreludeGlobals", ("Vuna.Compiler.Elab.Prelude.preludeGlobals", "Vuna/Compiler/Elab/Prelude.vuna:140"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dpreludeNames", ("Vuna.Compiler.Elab.Prelude.preludeNames", "Vuna/Compiler/Elab/Prelude.vuna:145"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dpreludeTypeGlobals", ("Vuna.Compiler.Elab.Prelude.preludeTypeGlobals", "Vuna/Compiler/Elab/Prelude.vuna:125"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dpreludeValueGlobals", ("Vuna.Compiler.Elab.Prelude.preludeValueGlobals", "Vuna/Compiler/Elab/Prelude.vuna:130"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dprependParams", ("Vuna.Compiler.Elab.Prelude.prependParams", "Vuna/Compiler/Elab/Prelude.vuna:166"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dstrTy", ("Vuna.Compiler.Elab.Prelude.strTy", "Vuna/Compiler/Elab/Prelude.vuna:25"));
  ("v_Vuna_dCompiler_dElab_dPrelude_dtypeCtorKindTerm", ("Vuna.Compiler.Elab.Prelude.typeCtorKindTerm", "Vuna/Compiler/Elab/Prelude.vuna:119"));
  ("v_Vuna_dCompiler_dElab_dRecords_dctorName", ("Vuna.Compiler.Elab.Records.ctorName", "Vuna/Compiler/Elab/Records.vuna:362"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarAltFuel", ("Vuna.Compiler.Elab.Records.desugarAltFuel", "Vuna/Compiler/Elab/Records.vuna:288"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarBindFuel", ("Vuna.Compiler.Elab.Records.desugarBindFuel", "Vuna/Compiler/Elab/Records.vuna:274"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarDoStmtFuel", ("Vuna.Compiler.Elab.Records.desugarDoStmtFuel", "Vuna/Compiler/Elab/Records.vuna:250"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarExpr", ("Vuna.Compiler.Elab.Records.desugarExpr", "Vuna/Compiler/Elab/Records.vuna:365"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarExprFuel", ("Vuna.Compiler.Elab.Records.desugarExprFuel", "Vuna/Compiler/Elab/Records.vuna:193"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarFieldValueFuel", ("Vuna.Compiler.Elab.Records.desugarFieldValueFuel", "Vuna/Compiler/Elab/Records.vuna:269"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarLocalClauseFuel", ("Vuna.Compiler.Elab.Records.desugarLocalClauseFuel", "Vuna/Compiler/Elab/Records.vuna:281"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarPattern", ("Vuna.Compiler.Elab.Records.desugarPattern", "Vuna/Compiler/Elab/Records.vuna:154"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarPatternFuel", ("Vuna.Compiler.Elab.Records.desugarPatternFuel", "Vuna/Compiler/Elab/Records.vuna:157"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordDecl", ("Vuna.Compiler.Elab.Records.desugarRecordDecl", "Vuna/Compiler/Elab/Records.vuna:135"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordPatternFieldsFuel", ("Vuna.Compiler.Elab.Records.desugarRecordPatternFieldsFuel", "Vuna/Compiler/Elab/Records.vuna:180"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarRecordValuesFuel", ("Vuna.Compiler.Elab.Records.desugarRecordValuesFuel", "Vuna/Compiler/Elab/Records.vuna:259"));
  ("v_Vuna_dCompiler_dElab_dRecords_ddesugarRecords", ("Vuna.Compiler.Elab.Records.desugarRecords", "Vuna/Compiler/Elab/Records.vuna:132"));
  ("v_Vuna_dCompiler_dElab_dRecords_dduplicateFieldMsg", ("Vuna.Compiler.Elab.Records.duplicateFieldMsg", "Vuna/Compiler/Elab/Records.vuna:73"));
  ("v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAs", ("Vuna.Compiler.Elab.Records.expandCaseAs", "Vuna/Compiler/Elab/Records.vuna:370"));
  ("v_Vuna_dCompiler_dElab_dRecords_dexpandCaseAsGo", ("Vuna.Compiler.Elab.Records.expandCaseAsGo", "Vuna/Compiler/Elab/Records.vuna:373"));
  ("v_Vuna_dCompiler_dElab_dRecords_dfieldNamesOf", ("Vuna.Compiler.Elab.Records.fieldNamesOf", "Vuna/Compiler/Elab/Records.vuna:53"));
  ("v_Vuna_dCompiler_dElab_dRecords_dfirstUnknownFieldMsg", ("Vuna.Compiler.Elab.Records.firstUnknownFieldMsg", "Vuna/Compiler/Elab/Records.vuna:81"));
  ("v_Vuna_dCompiler_dElab_dRecords_dhasDuplicateFieldNames", ("Vuna.Compiler.Elab.Records.hasDuplicateFieldNames", "Vuna/Compiler/Elab/Records.vuna:61"));
  ("v_Vuna_dCompiler_dElab_dRecords_dhasFieldInstanceDecl", ("Vuna.Compiler.Elab.Records.hasFieldInstanceDecl", "Vuna/Compiler/Elab/Records.vuna:329"));
  ("v_Vuna_dCompiler_dElab_dRecords_dhasUnknownFields", ("Vuna.Compiler.Elab.Records.hasUnknownFields", "Vuna/Compiler/Elab/Records.vuna:76"));
  ("v_Vuna_dCompiler_dElab_dRecords_dlookupProvided", ("Vuna.Compiler.Elab.Records.lookupProvided", "Vuna/Compiler/Elab/Records.vuna:57"));
  ("v_Vuna_dCompiler_dElab_dRecords_dlookupRecord", ("Vuna.Compiler.Elab.Records.lookupRecord", "Vuna/Compiler/Elab/Records.vuna:49"));
  ("v_Vuna_dCompiler_dElab_dRecords_dmissingFieldMsg", ("Vuna.Compiler.Elab.Records.missingFieldMsg", "Vuna/Compiler/Elab/Records.vuna:67"));
  ("v_Vuna_dCompiler_dElab_dRecords_dprepareDecls", ("Vuna.Compiler.Elab.Records.prepareDecls", "Vuna/Compiler/Elab/Records.vuna:347"));
  ("v_Vuna_dCompiler_dElab_dRecords_dprepareDeclsWith", ("Vuna.Compiler.Elab.Records.prepareDeclsWith", "Vuna/Compiler/Elab/Records.vuna:352"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordArrowType", ("Vuna.Compiler.Elab.Records.recordArrowType", "Vuna/Compiler/Elab/Records.vuna:112"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordArrowTypeGo", ("Vuna.Compiler.Elab.Records.recordArrowTypeGo", "Vuna/Compiler/Elab/Records.vuna:115"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordCtorType", ("Vuna.Compiler.Elab.Records.recordCtorType", "Vuna/Compiler/Elab/Records.vuna:128"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordFieldNames", ("Vuna.Compiler.Elab.Records.recordFieldNames", "Vuna/Compiler/Elab/Records.vuna:44"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordFieldPairs", ("Vuna.Compiler.Elab.Records.recordFieldPairs", "Vuna/Compiler/Elab/Records.vuna:39"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordFieldsOf", ("Vuna.Compiler.Elab.Records.recordFieldsOf", "Vuna/Compiler/Elab/Records.vuna:96"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstances", ("Vuna.Compiler.Elab.Records.recordHasFieldInstances", "Vuna/Compiler/Elab/Records.vuna:296"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstancesGo", ("Vuna.Compiler.Elab.Records.recordHasFieldInstancesGo", "Vuna/Compiler/Elab/Records.vuna:308"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordHasFieldInstancesOf", ("Vuna.Compiler.Elab.Records.recordHasFieldInstancesOf", "Vuna/Compiler/Elab/Records.vuna:302"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordInstancePats", ("Vuna.Compiler.Elab.Records.recordInstancePats", "Vuna/Compiler/Elab/Records.vuna:319"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordInstancePatsFrom", ("Vuna.Compiler.Elab.Records.recordInstancePatsFrom", "Vuna/Compiler/Elab/Records.vuna:323"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordInstanceVar", ("Vuna.Compiler.Elab.Records.recordInstanceVar", "Vuna/Compiler/Elab/Records.vuna:315"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordParamPis", ("Vuna.Compiler.Elab.Records.recordParamPis", "Vuna/Compiler/Elab/Records.vuna:122"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordParamVarExprs", ("Vuna.Compiler.Elab.Records.recordParamVarExprs", "Vuna/Compiler/Elab/Records.vuna:102"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordRetType", ("Vuna.Compiler.Elab.Records.recordRetType", "Vuna/Compiler/Elab/Records.vuna:105"));
  ("v_Vuna_dCompiler_dElab_dRecords_drecordsOfDecls", ("Vuna.Compiler.Elab.Records.recordsOfDecls", "Vuna/Compiler/Elab/Records.vuna:87"));
  ("v_Vuna_dCompiler_dElab_dRecords_dunknownFieldMsg", ("Vuna.Compiler.Elab.Records.unknownFieldMsg", "Vuna/Compiler/Elab/Records.vuna:70"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_danyReachBack", ("Vuna.Compiler.Elab.Representation.anyReachBack", "Vuna/Compiler/Elab/Representation.vuna:169"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dcandidateEdges", ("Vuna.Compiler.Elab.Representation.candidateEdges", "Vuna/Compiler/Elab/Representation.vuna:146"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dcandidateNames", ("Vuna.Compiler.Elab.Representation.candidateNames", "Vuna/Compiler/Elab/Representation.vuna:142"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dcandidateRefs", ("Vuna.Compiler.Elab.Representation.candidateRefs", "Vuna/Compiler/Elab/Representation.vuna:151"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTerm", ("Vuna.Compiler.Elab.Representation.ctorFieldDomainTerm", "Vuna/Compiler/Elab/Representation.vuna:87"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dctorFieldDomainTermGo", ("Vuna.Compiler.Elab.Representation.ctorFieldDomainTermGo", "Vuna/Compiler/Elab/Representation.vuna:91"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dctorKeepFlags", ("Vuna.Compiler.Elab.Representation.ctorKeepFlags", "Vuna/Compiler/Elab/Representation.vuna:37"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dfindDtData", ("Vuna.Compiler.Elab.Representation.findDtData", "Vuna/Compiler/Elab/Representation.vuna:56"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_disSpecialUnboxFamily", ("Vuna.Compiler.Elab.Representation.isSpecialUnboxFamily", "Vuna/Compiler/Elab/Representation.vuna:51"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndices", ("Vuna.Compiler.Elab.Representation.keptIndices", "Vuna/Compiler/Elab/Representation.vuna:41"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dkeptIndicesGo", ("Vuna.Compiler.Elab.Representation.keptIndicesGo", "Vuna/Compiler/Elab/Representation.vuna:45"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dknownTypeHead", ("Vuna.Compiler.Elab.Representation.knownTypeHead", "Vuna/Compiler/Elab/Representation.vuna:61"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dlookupNeighbors", ("Vuna.Compiler.Elab.Representation.lookupNeighbors", "Vuna/Compiler/Elab/Representation.vuna:157"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dlookupUnboxedInfo", ("Vuna.Compiler.Elab.Representation.lookupUnboxedInfo", "Vuna/Compiler/Elab/Representation.vuna:194"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dreachesBackTo", ("Vuna.Compiler.Elab.Representation.reachesBackTo", "Vuna/Compiler/Elab/Representation.vuna:163"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dreprIsBoxed", ("Vuna.Compiler.Elab.Representation.reprIsBoxed", "Vuna/Compiler/Elab/Representation.vuna:110"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dtermAppHeadRepresentable", ("Vuna.Compiler.Elab.Representation.termAppHeadRepresentable", "Vuna/Compiler/Elab/Representation.vuna:80"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dtermIsFunction", ("Vuna.Compiler.Elab.Representation.termIsFunction", "Vuna/Compiler/Elab/Representation.vuna:100"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dtermRepresentable", ("Vuna.Compiler.Elab.Representation.termRepresentable", "Vuna/Compiler/Elab/Representation.vuna:69"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandCtor", ("Vuna.Compiler.Elab.Representation.unboxedCandCtor", "Vuna/Compiler/Elab/Representation.vuna:28"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandIndex", ("Vuna.Compiler.Elab.Representation.unboxedCandIndex", "Vuna/Compiler/Elab/Representation.vuna:32"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandName", ("Vuna.Compiler.Elab.Representation.unboxedCandName", "Vuna/Compiler/Elab/Representation.vuna:24"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandidateOfData", ("Vuna.Compiler.Elab.Representation.unboxedCandidateOfData", "Vuna/Compiler/Elab/Representation.vuna:118"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedCandidates", ("Vuna.Compiler.Elab.Representation.unboxedCandidates", "Vuna/Compiler/Elab/Representation.vuna:138"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedFamilySet", ("Vuna.Compiler.Elab.Representation.unboxedFamilySet", "Vuna/Compiler/Elab/Representation.vuna:190"));
  ("v_Vuna_dCompiler_dElab_dRepresentation_dunboxedInfoOf", ("Vuna.Compiler.Elab.Representation.unboxedInfoOf", "Vuna/Compiler/Elab/Representation.vuna:179"));
  ("v_Vuna_dCompiler_dElab_dSig_dargParamKinds", ("Vuna.Compiler.Elab.Sig.argParamKinds", "Vuna/Compiler/Elab/Sig.vuna:204"));
  ("v_Vuna_dCompiler_dElab_dSig_darityFun", ("Vuna.Compiler.Elab.Sig.arityFun", "Vuna/Compiler/Elab/Sig.vuna:25"));
  ("v_Vuna_dCompiler_dElab_dSig_dbannedForModule", ("Vuna.Compiler.Elab.Sig.bannedForModule", "Vuna/Compiler/Elab/Sig.vuna:246"));
  ("v_Vuna_dCompiler_dElab_dSig_dclassParamKind", ("Vuna.Compiler.Elab.Sig.classParamKind", "Vuna/Compiler/Elab/Sig.vuna:22"));
  ("v_Vuna_dCompiler_dElab_dSig_dclassParamKindOf", ("Vuna.Compiler.Elab.Sig.classParamKindOf", "Vuna/Compiler/Elab/Sig.vuna:19"));
  ("v_Vuna_dCompiler_dElab_dSig_ddataParamKindTbl", ("Vuna.Compiler.Elab.Sig.dataParamKindTbl", "Vuna/Compiler/Elab/Sig.vuna:183"));
  ("v_Vuna_dCompiler_dElab_dSig_ddefinedNames", ("Vuna.Compiler.Elab.Sig.definedNames", "Vuna/Compiler/Elab/Sig.vuna:337"));
  ("v_Vuna_dCompiler_dElab_dSig_ddropName", ("Vuna.Compiler.Elab.Sig.dropName", "Vuna/Compiler/Elab/Sig.vuna:170"));
  ("v_Vuna_dCompiler_dElab_dSig_ddropPiBound", ("Vuna.Compiler.Elab.Sig.dropPiBound", "Vuna/Compiler/Elab/Sig.vuna:166"));
  ("v_Vuna_dCompiler_dElab_dSig_dexprLowerVars", ("Vuna.Compiler.Elab.Sig.exprLowerVars", "Vuna/Compiler/Elab/Sig.vuna:146"));
  ("v_Vuna_dCompiler_dElab_dSig_dexprMaxAppArity", ("Vuna.Compiler.Elab.Sig.exprMaxAppArity", "Vuna/Compiler/Elab/Sig.vuna:36"));
  ("v_Vuna_dCompiler_dElab_dSig_dfilterNamesInModule", ("Vuna.Compiler.Elab.Sig.filterNamesInModule", "Vuna/Compiler/Elab/Sig.vuna:249"));
  ("v_Vuna_dCompiler_dElab_dSig_dfreeNames", ("Vuna.Compiler.Elab.Sig.freeNames", "Vuna/Compiler/Elab/Sig.vuna:79"));
  ("v_Vuna_dCompiler_dElab_dSig_disLowerIdent", ("Vuna.Compiler.Elab.Sig.isLowerIdent", "Vuna/Compiler/Elab/Sig.vuna:161"));
  ("v_Vuna_dCompiler_dElab_dSig_dkeepOut", ("Vuna.Compiler.Elab.Sig.keepOut", "Vuna/Compiler/Elab/Sig.vuna:82"));
  ("v_Vuna_dCompiler_dElab_dSig_dkeepOutQualified", ("Vuna.Compiler.Elab.Sig.keepOutQualified", "Vuna/Compiler/Elab/Sig.vuna:321"));
  ("v_Vuna_dCompiler_dElab_dSig_dkeepOutTbl", ("Vuna.Compiler.Elab.Sig.keepOutTbl", "Vuna/Compiler/Elab/Sig.vuna:328"));
  ("v_Vuna_dCompiler_dElab_dSig_dkindArrowExpr", ("Vuna.Compiler.Elab.Sig.kindArrowExpr", "Vuna/Compiler/Elab/Sig.vuna:134"));
  ("v_Vuna_dCompiler_dElab_dSig_dkindDomains", ("Vuna.Compiler.Elab.Sig.kindDomains", "Vuna/Compiler/Elab/Sig.vuna:192"));
  ("v_Vuna_dCompiler_dElab_dSig_dkindOverrideOf", ("Vuna.Compiler.Elab.Sig.kindOverrideOf", "Vuna/Compiler/Elab/Sig.vuna:312"));
  ("v_Vuna_dCompiler_dElab_dSig_dlookupParamKinds", ("Vuna.Compiler.Elab.Sig.lookupParamKinds", "Vuna/Compiler/Elab/Sig.vuna:223"));
  ("v_Vuna_dCompiler_dElab_dSig_dlowerVarNames", ("Vuna.Compiler.Elab.Sig.lowerVarNames", "Vuna/Compiler/Elab/Sig.vuna:143"));
  ("v_Vuna_dCompiler_dElab_dSig_dmaxIntList", ("Vuna.Compiler.Elab.Sig.maxIntList", "Vuna/Compiler/Elab/Sig.vuna:32"));
  ("v_Vuna_dCompiler_dElab_dSig_dmemberDomainOf", ("Vuna.Compiler.Elab.Sig.memberDomainOf", "Vuna/Compiler/Elab/Sig.vuna:130"));
  ("v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverrides", ("Vuna.Compiler.Elab.Sig.memberDomainOverrides", "Vuna/Compiler/Elab/Sig.vuna:113"));
  ("v_Vuna_dCompiler_dElab_dSig_dmemberDomainOverridesOne", ("Vuna.Compiler.Elab.Sig.memberDomainOverridesOne", "Vuna/Compiler/Elab/Sig.vuna:117"));
  ("v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOf", ("Vuna.Compiler.Elab.Sig.methodArgRigsOf", "Vuna/Compiler/Elab/Sig.vuna:59"));
  ("v_Vuna_dCompiler_dElab_dSig_dmethodArgRigsOfGo", ("Vuna.Compiler.Elab.Sig.methodArgRigsOfGo", "Vuna/Compiler/Elab/Sig.vuna:62"));
  ("v_Vuna_dCompiler_dElab_dSig_dmethodMaxAppArity", ("Vuna.Compiler.Elab.Sig.methodMaxAppArity", "Vuna/Compiler/Elab/Sig.vuna:28"));
  ("v_Vuna_dCompiler_dElab_dSig_dmodulePrefixOf", ("Vuna.Compiler.Elab.Sig.modulePrefixOf", "Vuna/Compiler/Elab/Sig.vuna:256"));
  ("v_Vuna_dCompiler_dElab_dSig_dparamKindOf", ("Vuna.Compiler.Elab.Sig.paramKindOf", "Vuna/Compiler/Elab/Sig.vuna:317"));
  ("v_Vuna_dCompiler_dElab_dSig_dpiBoundNames", ("Vuna.Compiler.Elab.Sig.piBoundNames", "Vuna/Compiler/Elab/Sig.vuna:139"));
  ("v_Vuna_dCompiler_dElab_dSig_dqualifiedBannedTbl", ("Vuna.Compiler.Elab.Sig.qualifiedBannedTbl", "Vuna/Compiler/Elab/Sig.vuna:269"));
  ("v_Vuna_dCompiler_dElab_dSig_dqualifiedKey", ("Vuna.Compiler.Elab.Sig.qualifiedKey", "Vuna/Compiler/Elab/Sig.vuna:274"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantify", ("Vuna.Compiler.Elab.Sig.quantify", "Vuna/Compiler/Elab/Sig.vuna:86"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantifyTopKinds", ("Vuna.Compiler.Elab.Sig.quantifyTopKinds", "Vuna/Compiler/Elab/Sig.vuna:94"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantifyTopKindsWith", ("Vuna.Compiler.Elab.Sig.quantifyTopKindsWith", "Vuna/Compiler/Elab/Sig.vuna:102"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantifyTopSig", ("Vuna.Compiler.Elab.Sig.quantifyTopSig", "Vuna/Compiler/Elab/Sig.vuna:176"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCached", ("Vuna.Compiler.Elab.Sig.quantifyTopSigCached", "Vuna/Compiler/Elab/Sig.vuna:278"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCached", ("Vuna.Compiler.Elab.Sig.quantifyTopSigCtxCached", "Vuna/Compiler/Elab/Sig.vuna:286"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantifyTopSigCtxCachedKinds", ("Vuna.Compiler.Elab.Sig.quantifyTopSigCtxCachedKinds", "Vuna/Compiler/Elab/Sig.vuna:301"));
  ("v_Vuna_dCompiler_dElab_dSig_dquantifyTraitSig", ("Vuna.Compiler.Elab.Sig.quantifyTraitSig", "Vuna/Compiler/Elab/Sig.vuna:76"));
  ("v_Vuna_dCompiler_dElab_dSig_dtopPreludeNames", ("Vuna.Compiler.Elab.Sig.topPreludeNames", "Vuna/Compiler/Elab/Sig.vuna:333"));
  ("v_Vuna_dCompiler_dElab_dSig_dtopQuantBanned", ("Vuna.Compiler.Elab.Sig.topQuantBanned", "Vuna/Compiler/Elab/Sig.vuna:240"));
  ("v_Vuna_dCompiler_dElab_dSig_dzipArgKinds", ("Vuna.Compiler.Elab.Sig.zipArgKinds", "Vuna/Compiler/Elab/Sig.vuna:228"));
  ("v_Vuna_dCompiler_dElab_dSig_dzipArgKindsGo", ("Vuna.Compiler.Elab.Sig.zipArgKindsGo", "Vuna/Compiler/Elab/Sig.vuna:232"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_danyFieldHasOverCtor", ("Vuna.Compiler.Elab.Term.Impl.anyFieldHasOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:1640"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_danyPatHasOverCtor", ("Vuna.Compiler.Elab.Term.Impl.anyPatHasOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:1635"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtCallExpr", ("Vuna.Compiler.Elab.Term.Impl.appAtCallExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:409"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtOperand", ("Vuna.Compiler.Elab.Term.Impl.appAtOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:403"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dappAtParts", ("Vuna.Compiler.Elab.Term.Impl.appAtParts", "Vuna/Compiler/Elab/Term/Impl.vuna:1065"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dapplyExtra", ("Vuna.Compiler.Elab.Term.Impl.applyExtra", "Vuna/Compiler/Elab/Term/Impl.vuna:1079"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_darithFloatName", ("Vuna.Compiler.Elab.Term.Impl.arithFloatName", "Vuna/Compiler/Elab/Term/Impl.vuna:1372"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_darithNatName", ("Vuna.Compiler.Elab.Term.Impl.arithNatName", "Vuna/Compiler/Elab/Term/Impl.vuna:1354"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_darithOpNameOf", ("Vuna.Compiler.Elab.Term.Impl.arithOpNameOf", "Vuna/Compiler/Elab/Term/Impl.vuna:1347"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dbindShapeOf", ("Vuna.Compiler.Elab.Term.Impl.bindShapeOf", "Vuna/Compiler/Elab/Term/Impl.vuna:2665"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltFuel", ("Vuna.Compiler.Elab.Term.Impl.boolAltFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:183"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dboolAltGoFuel", ("Vuna.Compiler.Elab.Term.Impl.boolAltGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:188"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dbranchBinderOpaque", ("Vuna.Compiler.Elab.Term.Impl.branchBinderOpaque", "Vuna/Compiler/Elab/Term/Impl.vuna:41"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppByValueFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppByValueFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2167"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppCtorFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppCtorFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2538"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2142"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppGeneralFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppGeneralFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2336"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckAppUnderTypeFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppUnderTypeFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2177"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckBoolCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkBoolCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:172"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckByInferFuel", ("Vuna.Compiler.Elab.Term.Impl.checkByInferFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2021"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFamFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseFamFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:158"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:128"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseMatrixFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseMatrixFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:148"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCaseOfFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseOfFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:322"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckCondBoolFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCondBoolFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:348"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckDoBlockFuel", ("Vuna.Compiler.Elab.Term.Impl.checkDoBlockFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2793"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuel", ("Vuna.Compiler.Elab.Term.Impl.checkEFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1445"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRow", ("Vuna.Compiler.Elab.Term.Impl.checkEFuelNoRow", "Vuna/Compiler/Elab/Term/Impl.vuna:1516"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckEFuelNoRowPlain", ("Vuna.Compiler.Elab.Term.Impl.checkEFuelNoRowPlain", "Vuna/Compiler/Elab/Term/Impl.vuna:1527"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLamFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLamFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2038"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLetFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1616"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetGoFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLetGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1709"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLetOneFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLetOneFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1716"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitAltsFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLitAltsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:221"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitBoundVarFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLitBoundVarFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:252"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckLitCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLitCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:212"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitAltsFuel", ("Vuna.Compiler.Elab.Term.Impl.checkNatLitAltsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:284"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitBoundVarFuel", ("Vuna.Compiler.Elab.Term.Impl.checkNatLitBoundVarFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:312"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckNatLitCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkNatLitCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:277"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeAtKind", ("Vuna.Compiler.Elab.Term.Impl.checkTypeAtKind", "Vuna/Compiler/Elab/Term/Impl.vuna:2202"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeFuel", ("Vuna.Compiler.Elab.Term.Impl.checkTypeFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2106"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcheckTypeInferFuel", ("Vuna.Compiler.Elab.Term.Impl.checkTypeInferFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2127"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dclausesHaveOverCtor", ("Vuna.Compiler.Elab.Term.Impl.clausesHaveOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:1645"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceNatOperands", ("Vuna.Compiler.Elab.Term.Impl.coerceNatOperands", "Vuna/Compiler/Elab/Term/Impl.vuna:1333"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dcoerceTerm", ("Vuna.Compiler.Elab.Term.Impl.coerceTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1328"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomFuel", ("Vuna.Compiler.Elab.Term.Impl.constrainDictDomFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1249"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dconstrainDictDomGoKFuel", ("Vuna.Compiler.Elab.Term.Impl.constrainDictDomGoKFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1267"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgs", ("Vuna.Compiler.Elab.Term.Impl.ctorFamilyArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:2411"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorFamilyArgsGo", ("Vuna.Compiler.Elab.Term.Impl.ctorFamilyArgsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:2426"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorIdentitySpine", ("Vuna.Compiler.Elab.Term.Impl.ctorIdentitySpine", "Vuna/Compiler/Elab/Term/Impl.vuna:2393"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorResultArgs", ("Vuna.Compiler.Elab.Term.Impl.ctorResultArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:2371"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctorSpineOfType", ("Vuna.Compiler.Elab.Term.Impl.ctorSpineOfType", "Vuna/Compiler/Elab/Term/Impl.vuna:2375"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDict", ("Vuna.Compiler.Elab.Term.Impl.ctxHasFieldDict", "Vuna/Compiler/Elab/Term/Impl.vuna:811"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dctxHasFieldDictGo", ("Vuna.Compiler.Elab.Term.Impl.ctxHasFieldDictGo", "Vuna/Compiler/Elab/Term/Impl.vuna:815"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoBlock", ("Vuna.Compiler.Elab.Term.Impl.decodeDoBlock", "Vuna/Compiler/Elab/Term/Impl.vuna:2619"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddecodeDoChain", ("Vuna.Compiler.Elab.Term.Impl.decodeDoChain", "Vuna/Compiler/Elab/Term/Impl.vuna:2606"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddeferDictBinderFuel", ("Vuna.Compiler.Elab.Term.Impl.deferDictBinderFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1235"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindAppTerm", ("Vuna.Compiler.Elab.Term.Impl.doBindAppTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2748"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBindHeadOf", ("Vuna.Compiler.Elab.Term.Impl.doBindHeadOf", "Vuna/Compiler/Elab/Term/Impl.vuna:2675"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoBlockShapeOf", ("Vuna.Compiler.Elab.Term.Impl.doBlockShapeOf", "Vuna/Compiler/Elab/Term/Impl.vuna:2684"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainBuild", ("Vuna.Compiler.Elab.Term.Impl.doChainBuild", "Vuna/Compiler/Elab/Term/Impl.vuna:2629"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoChainFallback", ("Vuna.Compiler.Elab.Term.Impl.doChainFallback", "Vuna/Compiler/Elab/Term/Impl.vuna:2635"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictDefer", ("Vuna.Compiler.Elab.Term.Impl.doDictDefer", "Vuna/Compiler/Elab/Term/Impl.vuna:2694"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoDictStep", ("Vuna.Compiler.Elab.Term.Impl.doDictStep", "Vuna/Compiler/Elab/Term/Impl.vuna:2703"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddoMarkerHead", ("Vuna.Compiler.Elab.Term.Impl.doMarkerHead", "Vuna/Compiler/Elab/Term/Impl.vuna:2584"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_ddropPis", ("Vuna.Compiler.Elab.Term.Impl.dropPis", "Vuna/Compiler/Elab/Term/Impl.vuna:2382"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_deffConsLabelTail", ("Vuna.Compiler.Elab.Term.Impl.effConsLabelTail", "Vuna/Compiler/Elab/Term/Impl.vuna:1893"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowAndResult", ("Vuna.Compiler.Elab.Term.Impl.effRowAndResult", "Vuna/Compiler/Elab/Term/Impl.vuna:1874"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_deffRowOfValue", ("Vuna.Compiler.Elab.Term.Impl.effRowOfValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1880"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCaseAltsFuel", ("Vuna.Compiler.Elab.Term.Impl.elabCaseAltsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:81"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_delabCatchAllFuel", ("Vuna.Compiler.Elab.Term.Impl.elabCatchAllFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:102"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_delabConAltFuel", ("Vuna.Compiler.Elab.Term.Impl.elabConAltFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:53"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_delabDoChain", ("Vuna.Compiler.Elab.Term.Impl.elabDoChain", "Vuna/Compiler/Elab/Term/Impl.vuna:2771"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_delabEFieldFuel", ("Vuna.Compiler.Elab.Term.Impl.elabEFieldFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:854"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_delabERecUpdateFuel", ("Vuna.Compiler.Elab.Term.Impl.elabERecUpdateFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:871"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandArgListLit", ("Vuna.Compiler.Elab.Term.Impl.expandArgListLit", "Vuna/Compiler/Elab/Term/Impl.vuna:1135"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandBind", ("Vuna.Compiler.Elab.Term.Impl.expandBind", "Vuna/Compiler/Elab/Term/Impl.vuna:1691"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandDoStmt", ("Vuna.Compiler.Elab.Term.Impl.expandDoStmt", "Vuna/Compiler/Elab/Term/Impl.vuna:1695"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLit", ("Vuna.Compiler.Elab.Term.Impl.expandListLit", "Vuna/Compiler/Elab/Term/Impl.vuna:1116"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandListLitGo", ("Vuna.Compiler.Elab.Term.Impl.expandListLitGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1050"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandLocalFuns", ("Vuna.Compiler.Elab.Term.Impl.expandLocalFuns", "Vuna/Compiler/Elab/Term/Impl.vuna:1650"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexpandRowListLitGo", ("Vuna.Compiler.Elab.Term.Impl.expandRowListLitGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1099"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dexprFormName", ("Vuna.Compiler.Elab.Term.Impl.exprFormName", "Vuna/Compiler/Elab/Term/Impl.vuna:1491"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dfindCtorByShort", ("Vuna.Compiler.Elab.Term.Impl.findCtorByShort", "Vuna/Compiler/Elab/Term/Impl.vuna:1038"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dfirstCtorOf", ("Vuna.Compiler.Elab.Term.Impl.firstCtorOf", "Vuna/Compiler/Elab/Term/Impl.vuna:1109"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatApp2", ("Vuna.Compiler.Elab.Term.Impl.floatApp2", "Vuna/Compiler/Elab/Term/Impl.vuna:1368"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dfloatTyValue", ("Vuna.Compiler.Elab.Term.Impl.floatTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1308"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCall", ("Vuna.Compiler.Elab.Term.Impl.handleCall", "Vuna/Compiler/Elab/Term/Impl.vuna:524"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExpr", ("Vuna.Compiler.Elab.Term.Impl.handleCallExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:588"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprAt", ("Vuna.Compiler.Elab.Term.Impl.handleCallExprAt", "Vuna/Compiler/Elab/Term/Impl.vuna:592"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCallExprWith", ("Vuna.Compiler.Elab.Term.Impl.handleCallExprWith", "Vuna/Compiler/Elab/Term/Impl.vuna:575"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleCheckFamilies", ("Vuna.Compiler.Elab.Term.Impl.handleCheckFamilies", "Vuna/Compiler/Elab/Term/Impl.vuna:463"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilies", ("Vuna.Compiler.Elab.Term.Impl.handleClauseFamilies", "Vuna/Compiler/Elab/Term/Impl.vuna:472"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamily", ("Vuna.Compiler.Elab.Term.Impl.handleClauseFamily", "Vuna/Compiler/Elab/Term/Impl.vuna:444"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleClauseFamilyOfPat", ("Vuna.Compiler.Elab.Term.Impl.handleClauseFamilyOfPat", "Vuna/Compiler/Elab/Term/Impl.vuna:458"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleDefaultRetBinder", ("Vuna.Compiler.Elab.Term.Impl.handleDefaultRetBinder", "Vuna/Compiler/Elab/Term/Impl.vuna:540"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyArityOf", ("Vuna.Compiler.Elab.Term.Impl.handleFamilyArityOf", "Vuna/Compiler/Elab/Term/Impl.vuna:563"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleFamilyOfCtor", ("Vuna.Compiler.Elab.Term.Impl.handleFamilyOfCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:452"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleHoleArgs", ("Vuna.Compiler.Elab.Term.Impl.handleHoleArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:502"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleKindArity", ("Vuna.Compiler.Elab.Term.Impl.handleKindArity", "Vuna/Compiler/Elab/Term/Impl.vuna:496"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArg", ("Vuna.Compiler.Elab.Term.Impl.handleOpArg", "Vuna/Compiler/Elab/Term/Impl.vuna:507"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpArity", ("Vuna.Compiler.Elab.Term.Impl.handleOpArity", "Vuna/Compiler/Elab/Term/Impl.vuna:481"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOpKind", ("Vuna.Compiler.Elab.Term.Impl.handleOpKind", "Vuna/Compiler/Elab/Term/Impl.vuna:534"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleOperand", ("Vuna.Compiler.Elab.Term.Impl.handleOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:438"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResArg", ("Vuna.Compiler.Elab.Term.Impl.handleResArg", "Vuna/Compiler/Elab/Term/Impl.vuna:517"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResBinder", ("Vuna.Compiler.Elab.Term.Impl.handleResBinder", "Vuna/Compiler/Elab/Term/Impl.vuna:512"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleResFamilyOf", ("Vuna.Compiler.Elab.Term.Impl.handleResFamilyOf", "Vuna/Compiler/Elab/Term/Impl.vuna:551"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhandleRetArg", ("Vuna.Compiler.Elab.Term.Impl.handleRetArg", "Vuna/Compiler/Elab/Term/Impl.vuna:544"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldAccessFuel", ("Vuna.Compiler.Elab.Term.Impl.hasFieldAccessFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:836"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dhasFieldDictName", ("Vuna.Compiler.Elab.Term.Impl.hasFieldDictName", "Vuna/Compiler/Elab/Term/Impl.vuna:805"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_didentityArgs", ("Vuna.Compiler.Elab.Term.Impl.identityArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:2386"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAnnFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAnnFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:889"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:949"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppGeneralFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:999"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppGeneralGoFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppGeneralGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1008"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferAppUnderTypeFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppUnderTypeFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2185"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsFuel", ("Vuna.Compiler.Elab.Term.Impl.inferArgsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1017"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferArgsGo", ("Vuna.Compiler.Elab.Term.Impl.inferArgsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1140"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferCaseEFuel", ("Vuna.Compiler.Elab.Term.Impl.inferCaseEFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:332"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferDoBlockFuel", ("Vuna.Compiler.Elab.Term.Impl.inferDoBlockFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2822"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuel", ("Vuna.Compiler.Elab.Term.Impl.inferEFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:595"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCore", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelCore", "Vuna/Compiler/Elab/Term/Impl.vuna:618"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelCorePlain", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelCorePlain", "Vuna/Compiler/Elab/Term/Impl.vuna:629"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferEFuelHint", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelHint", "Vuna/Compiler/Elab/Term/Impl.vuna:1849"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetBoundFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetBoundFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1771"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1702"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetGoFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1759"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferLetIgnoredFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetIgnoredFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1787"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinferPiFuel", ("Vuna.Compiler.Elab.Term.Impl.inferPiFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:900"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dinstArgOperand", ("Vuna.Compiler.Elab.Term.Impl.instArgOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:397"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dintApp2", ("Vuna.Compiler.Elab.Term.Impl.intApp2", "Vuna/Compiler/Elab/Term/Impl.vuna:1360"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dintTyValue", ("Vuna.Compiler.Elab.Term.Impl.intTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1301"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disEIntExpr", ("Vuna.Compiler.Elab.Term.Impl.isEIntExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:1378"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disFloatTy", ("Vuna.Compiler.Elab.Term.Impl.isFloatTy", "Vuna/Compiler/Elab/Term/Impl.vuna:1322"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disIntTy", ("Vuna.Compiler.Elab.Term.Impl.isIntTy", "Vuna/Compiler/Elab/Term/Impl.vuna:1311"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disMetaHeadedValue", ("Vuna.Compiler.Elab.Term.Impl.isMetaHeadedValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1815"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disNatTy", ("Vuna.Compiler.Elab.Term.Impl.isNatTy", "Vuna/Compiler/Elab/Term/Impl.vuna:1316"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disNilRowValue", ("Vuna.Compiler.Elab.Term.Impl.isNilRowValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1886"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disRigidHeadValue", ("Vuna.Compiler.Elab.Term.Impl.isRigidHeadValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1821"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disStringTyValue", ("Vuna.Compiler.Elab.Term.Impl.isStringTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2313"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_disUniverseTerm", ("Vuna.Compiler.Elab.Term.Impl.isUniverseTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:491"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_djoinEffectLabels", ("Vuna.Compiler.Elab.Term.Impl.joinEffectLabels", "Vuna/Compiler/Elab/Term/Impl.vuna:1937"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlabelHeadArgs", ("Vuna.Compiler.Elab.Term.Impl.labelHeadArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:1908"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitConsTail", ("Vuna.Compiler.Elab.Term.Impl.listLitConsTail", "Vuna/Compiler/Elab/Term/Impl.vuna:1030"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitElems", ("Vuna.Compiler.Elab.Term.Impl.listLitElems", "Vuna/Compiler/Elab/Term/Impl.vuna:1024"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlistLitFamily", ("Vuna.Compiler.Elab.Term.Impl.listLitFamily", "Vuna/Compiler/Elab/Term/Impl.vuna:1129"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitAltStepFuel", ("Vuna.Compiler.Elab.Term.Impl.litAltStepFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:241"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCons", ("Vuna.Compiler.Elab.Term.Impl.litFamilyCons", "Vuna/Compiler/Elab/Term/Impl.vuna:1106"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dlitFamilyCtor", ("Vuna.Compiler.Elab.Term.Impl.litFamilyCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:1044"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dliteralTraitLower", ("Vuna.Compiler.Elab.Term.Impl.literalTraitLower", "Vuna/Compiler/Elab/Term/Impl.vuna:1482"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatApp2", ("Vuna.Compiler.Elab.Term.Impl.natApp2", "Vuna/Compiler/Elab/Term/Impl.vuna:1363"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitAltStepFuel", ("Vuna.Compiler.Elab.Term.Impl.natLitAltStepFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:302"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitCaseAlts", ("Vuna.Compiler.Elab.Term.Impl.natLitCaseAlts", "Vuna/Compiler/Elab/Term/Impl.vuna:269"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitResult", ("Vuna.Compiler.Elab.Term.Impl.natLitResult", "Vuna/Compiler/Elab/Term/Impl.vuna:1295"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTerm", ("Vuna.Compiler.Elab.Term.Impl.natLitTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1290"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatLitTermGo", ("Vuna.Compiler.Elab.Term.Impl.natLitTermGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1287"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatToIntTerm", ("Vuna.Compiler.Elab.Term.Impl.natToIntTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1298"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dnatTyValue", ("Vuna.Compiler.Elab.Term.Impl.natTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1304"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dneedsMatrixCase", ("Vuna.Compiler.Elab.Term.Impl.needsMatrixCase", "Vuna/Compiler/Elab/Term/Impl.vuna:140"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndices", ("Vuna.Compiler.Elab.Term.Impl.opaqueBranchIndices", "Vuna/Compiler/Elab/Term/Impl.vuna:32"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dopaqueBranchIndicesGo", ("Vuna.Compiler.Elab.Term.Impl.opaqueBranchIndicesGo", "Vuna/Compiler/Elab/Term/Impl.vuna:35"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dpatHasOverCtor", ("Vuna.Compiler.Elab.Term.Impl.patHasOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:1627"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfCanonical", ("Vuna.Compiler.Elab.Term.Impl.perfFamilyOfCanonical", "Vuna/Compiler/Elab/Term/Impl.vuna:378"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfFamilyOfValue", ("Vuna.Compiler.Elab.Term.Impl.perfFamilyOfValue", "Vuna/Compiler/Elab/Term/Impl.vuna:385"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dperfShortOf", ("Vuna.Compiler.Elab.Term.Impl.perfShortOf", "Vuna/Compiler/Elab/Term/Impl.vuna:371"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformCallExpr", ("Vuna.Compiler.Elab.Term.Impl.performCallExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:421"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dperformOperand", ("Vuna.Compiler.Elab.Term.Impl.performOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:391"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dplanDoBlock", ("Vuna.Compiler.Elab.Term.Impl.planDoBlock", "Vuna/Compiler/Elab/Term/Impl.vuna:2729"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dqualifyShort", ("Vuna.Compiler.Elab.Term.Impl.qualifyShort", "Vuna/Compiler/Elab/Term/Impl.vuna:414"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookup", ("Vuna.Compiler.Elab.Term.Impl.recordFieldLookup", "Vuna/Compiler/Elab/Term/Impl.vuna:713"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldLookupGo", ("Vuna.Compiler.Elab.Term.Impl.recordFieldLookupGo", "Vuna/Compiler/Elab/Term/Impl.vuna:716"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPats", ("Vuna.Compiler.Elab.Term.Impl.recordFieldPats", "Vuna/Compiler/Elab/Term/Impl.vuna:703"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPatsFrom", ("Vuna.Compiler.Elab.Term.Impl.recordFieldPatsFrom", "Vuna/Compiler/Elab/Term/Impl.vuna:707"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldPlan", ("Vuna.Compiler.Elab.Term.Impl.recordFieldPlan", "Vuna/Compiler/Elab/Term/Impl.vuna:783"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordFieldVarName", ("Vuna.Compiler.Elab.Term.Impl.recordFieldVarName", "Vuna/Compiler/Elab/Term/Impl.vuna:699"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordTypeOf", ("Vuna.Compiler.Elab.Term.Impl.recordTypeOf", "Vuna/Compiler/Elab/Term/Impl.vuna:688"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArg", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateArg", "Vuna/Compiler/Elab/Term/Impl.vuna:740"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateArgs", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:746"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatePlan", ("Vuna.Compiler.Elab.Term.Impl.recordUpdatePlan", "Vuna/Compiler/Elab/Term/Impl.vuna:792"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknown", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateUnknown", "Vuna/Compiler/Elab/Term/Impl.vuna:730"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateUnknownGo", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateUnknownGo", "Vuna/Compiler/Elab/Term/Impl.vuna:723"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdateValueFor", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateValueFor", "Vuna/Compiler/Elab/Term/Impl.vuna:734"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drecordUpdatedIndices", ("Vuna.Compiler.Elab.Term.Impl.recordUpdatedIndices", "Vuna/Compiler/Elab/Term/Impl.vuna:752"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveClausePatsFuel", ("Vuna.Compiler.Elab.Term.Impl.resolveClausePatsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2520"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveCtorPatFuel", ("Vuna.Compiler.Elab.Term.Impl.resolveCtorPatFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2458"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAlts", ("Vuna.Compiler.Elab.Term.Impl.resolveOverAlts", "Vuna/Compiler/Elab/Term/Impl.vuna:2488"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverAltsGo", ("Vuna.Compiler.Elab.Term.Impl.resolveOverAltsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:2492"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPats", ("Vuna.Compiler.Elab.Term.Impl.resolveOverFunPats", "Vuna/Compiler/Elab/Term/Impl.vuna:2504"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverFunPatsGo", ("Vuna.Compiler.Elab.Term.Impl.resolveOverFunPatsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:2509"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolveOverPatFuel", ("Vuna.Compiler.Elab.Term.Impl.resolveOverPatFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2441"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dresolvePatArgsFuel", ("Vuna.Compiler.Elab.Term.Impl.resolvePatArgsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2469"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowAtParts", ("Vuna.Compiler.Elab.Term.Impl.rowAtParts", "Vuna/Compiler/Elab/Term/Impl.vuna:1061"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowContainsValue", ("Vuna.Compiler.Elab.Term.Impl.rowContainsValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1964"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEffectLabels", ("Vuna.Compiler.Elab.Term.Impl.rowEffectLabels", "Vuna/Compiler/Elab/Term/Impl.vuna:1923"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryParts", ("Vuna.Compiler.Elab.Term.Impl.rowEntryParts", "Vuna/Compiler/Elab/Term/Impl.vuna:1072"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowEntryText", ("Vuna.Compiler.Elab.Term.Impl.rowEntryText", "Vuna/Compiler/Elab/Term/Impl.vuna:1919"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLabelText", ("Vuna.Compiler.Elab.Term.Impl.rowLabelText", "Vuna/Compiler/Elab/Term/Impl.vuna:1903"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitLabel", ("Vuna.Compiler.Elab.Term.Impl.rowLitLabel", "Vuna/Compiler/Elab/Term/Impl.vuna:1084"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameArg", ("Vuna.Compiler.Elab.Term.Impl.rowLitNameArg", "Vuna/Compiler/Elab/Term/Impl.vuna:1089"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowLitNameExpr", ("Vuna.Compiler.Elab.Term.Impl.rowLitNameExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:1094"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowNameText", ("Vuna.Compiler.Elab.Term.Impl.rowNameText", "Vuna/Compiler/Elab/Term/Impl.vuna:1913"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_drowSubValue", ("Vuna.Compiler.Elab.Term.Impl.rowSubValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1974"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dsameLabelValue", ("Vuna.Compiler.Elab.Term.Impl.sameLabelValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1961"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dshortGlobalName", ("Vuna.Compiler.Elab.Term.Impl.shortGlobalName", "Vuna/Compiler/Elab/Term/Impl.vuna:1899"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForExpected", ("Vuna.Compiler.Elab.Term.Impl.skipArithSpecForExpected", "Vuna/Compiler/Elab/Term/Impl.vuna:933"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dskipArithSpecForHint", ("Vuna.Compiler.Elab.Term.Impl.skipArithSpecForHint", "Vuna/Compiler/Elab/Term/Impl.vuna:944"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1415"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithAppOpFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithAppOpFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1422"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithCheckFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1385"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeArithCheckOpFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithCheckOpFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1392"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeBoolAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeBoolAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2325"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeCmpAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeCmpAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2247"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeEqAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeEqAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2230"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeInterpPrimApp", ("Vuna.Compiler.Elab.Term.Impl.specializeInterpPrimApp", "Vuna/Compiler/Elab/Term/Impl.vuna:2287"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dspecializeOpAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeOpAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2266"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoExpected", ("Vuna.Compiler.Elab.Term.Impl.splitDoExpected", "Vuna/Compiler/Elab/Term/Impl.vuna:2649"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dsplitDoSpine", ("Vuna.Compiler.Elab.Term.Impl.splitDoSpine", "Vuna/Compiler/Elab/Term/Impl.vuna:2642"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromFloatTerm", ("Vuna.Compiler.Elab.Term.Impl.strFromFloatTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2307"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrFromIntTerm", ("Vuna.Compiler.Elab.Term.Impl.strFromIntTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2303"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dstrTyValue", ("Vuna.Compiler.Elab.Term.Impl.strTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2310"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dstripPisWithMetas", ("Vuna.Compiler.Elab.Term.Impl.stripPisWithMetas", "Vuna/Compiler/Elab/Term/Impl.vuna:1803"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigs", ("Vuna.Compiler.Elab.Term.Impl.takeRigs", "Vuna/Compiler/Elab/Term/Impl.vuna:2404"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dtakeRigsGo", ("Vuna.Compiler.Elab.Term.Impl.takeRigsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:2407"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryEffLift", ("Vuna.Compiler.Elab.Term.Impl.tryEffLift", "Vuna/Compiler/Elab/Term/Impl.vuna:1989"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dtryUseHint", ("Vuna.Compiler.Elab.Term.Impl.tryUseHint", "Vuna/Compiler/Elab/Term/Impl.vuna:1833"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeAppTerm", ("Vuna.Compiler.Elab.Term.Impl.typeAppTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2101"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dtypeHeadTerm", ("Vuna.Compiler.Elab.Term.Impl.typeHeadTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2095"));
  ("v_Vuna_dCompiler_dElab_dTerm_dImpl_dunhandledEffectLabel", ("Vuna.Compiler.Elab.Term.Impl.unhandledEffectLabel", "Vuna/Compiler/Elab/Term/Impl.vuna:1944"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dallImplicitPrefix", ("Vuna.Compiler.Elab.Term.Support.allImplicitPrefix", "Vuna/Compiler/Elab/Term/Support.vuna:36"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckBindingSigs", ("Vuna.Compiler.Elab.Term.Support.checkBindingSigs", "Vuna/Compiler/Elab/Term/Support.vuna:60"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dcheckWhereSigs", ("Vuna.Compiler.Elab.Term.Support.checkWhereSigs", "Vuna/Compiler/Elab/Term/Support.vuna:64"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dinferVarRef", ("Vuna.Compiler.Elab.Term.Support.inferVarRef", "Vuna/Compiler/Elab/Term/Support.vuna:20"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicit", ("Vuna.Compiler.Elab.Term.Support.instantiateAllImplicit", "Vuna/Compiler/Elab/Term/Support.vuna:41"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dinstantiateAllImplicitFuel", ("Vuna.Compiler.Elab.Term.Support.instantiateAllImplicitFuel", "Vuna/Compiler/Elab/Term/Support.vuna:44"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dwhereBindingName", ("Vuna.Compiler.Elab.Term.Support.whereBindingName", "Vuna/Compiler/Elab/Term/Support.vuna:73"));
  ("v_Vuna_dCompiler_dElab_dTerm_dSupport_dwithEffectLabels", ("Vuna.Compiler.Elab.Term.Support.withEffectLabels", "Vuna/Compiler/Elab/Term/Support.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dTerm_dboolAlt", ("Vuna.Compiler.Elab.Term.boolAlt", "Vuna/Compiler/Elab/Term.vuna:93"));
  ("v_Vuna_dCompiler_dElab_dTerm_dboolAltGo", ("Vuna.Compiler.Elab.Term.boolAltGo", "Vuna/Compiler/Elab/Term.vuna:96"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckApp", ("Vuna.Compiler.Elab.Term.checkApp", "Vuna/Compiler/Elab/Term.vuna:54"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckAppCtor", ("Vuna.Compiler.Elab.Term.checkAppCtor", "Vuna/Compiler/Elab/Term.vuna:48"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckAppGeneral", ("Vuna.Compiler.Elab.Term.checkAppGeneral", "Vuna/Compiler/Elab/Term.vuna:57"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckAppUnderType", ("Vuna.Compiler.Elab.Term.checkAppUnderType", "Vuna/Compiler/Elab/Term.vuna:51"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckBoolCase", ("Vuna.Compiler.Elab.Term.checkBoolCase", "Vuna/Compiler/Elab/Term.vuna:90"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckByInfer", ("Vuna.Compiler.Elab.Term.checkByInfer", "Vuna/Compiler/Elab/Term.vuna:33"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckCase", ("Vuna.Compiler.Elab.Term.checkCase", "Vuna/Compiler/Elab/Term.vuna:145"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckCaseFam", ("Vuna.Compiler.Elab.Term.checkCaseFam", "Vuna/Compiler/Elab/Term.vuna:148"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckCaseOf", ("Vuna.Compiler.Elab.Term.checkCaseOf", "Vuna/Compiler/Elab/Term.vuna:151"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckCondBool", ("Vuna.Compiler.Elab.Term.checkCondBool", "Vuna/Compiler/Elab/Term.vuna:136"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckE", ("Vuna.Compiler.Elab.Term.checkE", "Vuna/Compiler/Elab/Term.vuna:103"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLam", ("Vuna.Compiler.Elab.Term.checkLam", "Vuna/Compiler/Elab/Term.vuna:66"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLet", ("Vuna.Compiler.Elab.Term.checkLet", "Vuna/Compiler/Elab/Term.vuna:72"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLetGo", ("Vuna.Compiler.Elab.Term.checkLetGo", "Vuna/Compiler/Elab/Term.vuna:75"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLetOne", ("Vuna.Compiler.Elab.Term.checkLetOne", "Vuna/Compiler/Elab/Term.vuna:69"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLitAlts", ("Vuna.Compiler.Elab.Term.checkLitAlts", "Vuna/Compiler/Elab/Term.vuna:87"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLitBoundVar", ("Vuna.Compiler.Elab.Term.checkLitBoundVar", "Vuna/Compiler/Elab/Term.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckLitCase", ("Vuna.Compiler.Elab.Term.checkLitCase", "Vuna/Compiler/Elab/Term.vuna:84"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckType", ("Vuna.Compiler.Elab.Term.checkType", "Vuna/Compiler/Elab/Term.vuna:112"));
  ("v_Vuna_dCompiler_dElab_dTerm_dcheckTypeInfer", ("Vuna.Compiler.Elab.Term.checkTypeInfer", "Vuna/Compiler/Elab/Term.vuna:30"));
  ("v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDom", ("Vuna.Compiler.Elab.Term.constrainDictDom", "Vuna/Compiler/Elab/Term.vuna:121"));
  ("v_Vuna_dCompiler_dElab_dTerm_dconstrainDictDomGoK", ("Vuna.Compiler.Elab.Term.constrainDictDomGoK", "Vuna/Compiler/Elab/Term.vuna:124"));
  ("v_Vuna_dCompiler_dElab_dTerm_ddeferDictBinder", ("Vuna.Compiler.Elab.Term.deferDictBinder", "Vuna/Compiler/Elab/Term.vuna:20"));
  ("v_Vuna_dCompiler_dElab_dTerm_delabCaseAlts", ("Vuna.Compiler.Elab.Term.elabCaseAlts", "Vuna/Compiler/Elab/Term.vuna:154"));
  ("v_Vuna_dCompiler_dElab_dTerm_delabCatchAll", ("Vuna.Compiler.Elab.Term.elabCatchAll", "Vuna/Compiler/Elab/Term.vuna:99"));
  ("v_Vuna_dCompiler_dElab_dTerm_delabConAlt", ("Vuna.Compiler.Elab.Term.elabConAlt", "Vuna/Compiler/Elab/Term.vuna:157"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferAnn", ("Vuna.Compiler.Elab.Term.inferAnn", "Vuna/Compiler/Elab/Term.vuna:109"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferApp", ("Vuna.Compiler.Elab.Term.inferApp", "Vuna/Compiler/Elab/Term.vuna:127"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneral", ("Vuna.Compiler.Elab.Term.inferAppGeneral", "Vuna/Compiler/Elab/Term.vuna:130"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferAppGeneralGo", ("Vuna.Compiler.Elab.Term.inferAppGeneralGo", "Vuna/Compiler/Elab/Term.vuna:133"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferAppUnderType", ("Vuna.Compiler.Elab.Term.inferAppUnderType", "Vuna/Compiler/Elab/Term.vuna:115"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferArgs", ("Vuna.Compiler.Elab.Term.inferArgs", "Vuna/Compiler/Elab/Term.vuna:118"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferCaseE", ("Vuna.Compiler.Elab.Term.inferCaseE", "Vuna/Compiler/Elab/Term.vuna:142"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferE", ("Vuna.Compiler.Elab.Term.inferE", "Vuna/Compiler/Elab/Term.vuna:139"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferLet", ("Vuna.Compiler.Elab.Term.inferLet", "Vuna/Compiler/Elab/Term.vuna:42"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferLetBound", ("Vuna.Compiler.Elab.Term.inferLetBound", "Vuna/Compiler/Elab/Term.vuna:39"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferLetGo", ("Vuna.Compiler.Elab.Term.inferLetGo", "Vuna/Compiler/Elab/Term.vuna:45"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferLetIgnored", ("Vuna.Compiler.Elab.Term.inferLetIgnored", "Vuna/Compiler/Elab/Term.vuna:36"));
  ("v_Vuna_dCompiler_dElab_dTerm_dinferPi", ("Vuna.Compiler.Elab.Term.inferPi", "Vuna/Compiler/Elab/Term.vuna:106"));
  ("v_Vuna_dCompiler_dElab_dTerm_dlitAltStep", ("Vuna.Compiler.Elab.Term.litAltStep", "Vuna/Compiler/Elab/Term.vuna:81"));
  ("v_Vuna_dCompiler_dElab_dTerm_dresolveOverFunPats", ("Vuna.Compiler.Elab.Term.resolveOverFunPats", "Vuna/Compiler/Elab/Term.vuna:162"));
  ("v_Vuna_dCompiler_dElab_dTerm_dspecializeBoolApp", ("Vuna.Compiler.Elab.Term.specializeBoolApp", "Vuna/Compiler/Elab/Term.vuna:63"));
  ("v_Vuna_dCompiler_dElab_dTerm_dspecializeCmpApp", ("Vuna.Compiler.Elab.Term.specializeCmpApp", "Vuna/Compiler/Elab/Term.vuna:24"));
  ("v_Vuna_dCompiler_dElab_dTerm_dspecializeEqApp", ("Vuna.Compiler.Elab.Term.specializeEqApp", "Vuna/Compiler/Elab/Term.vuna:27"));
  ("v_Vuna_dCompiler_dElab_dTerm_dspecializeOpApp", ("Vuna.Compiler.Elab.Term.specializeOpApp", "Vuna/Compiler/Elab/Term.vuna:60"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_daddEdgeMode", ("Vuna.Compiler.Elab.Termination.Measure.addEdgeMode", "Vuna/Compiler/Elab/Termination/Measure.vuna:538"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallEqTo", ("Vuna.Compiler.Elab.Termination.Measure.allEqTo", "Vuna/Compiler/Elab/Termination/Measure.vuna:18"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dallSame", ("Vuna.Compiler.Elab.Termination.Measure.allSame", "Vuna/Compiler/Elab/Termination/Measure.vuna:22"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargPositive", ("Vuna.Compiler.Elab.Termination.Measure.argPositive", "Vuna/Compiler/Elab/Termination/Measure.vuna:251"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dargRel", ("Vuna.Compiler.Elab.Termination.Measure.argRel", "Vuna/Compiler/Elab/Termination/Measure.vuna:530"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinus", ("Vuna.Compiler.Elab.Termination.Measure.arithMinus", "Vuna/Compiler/Elab/Termination/Measure.vuna:493"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithMinusBase", ("Vuna.Compiler.Elab.Termination.Measure.arithMinusBase", "Vuna/Compiler/Elab/Termination/Measure.vuna:498"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_darithRel", ("Vuna.Compiler.Elab.Termination.Measure.arithRel", "Vuna/Compiler/Elab/Termination/Measure.vuna:482"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDef", ("Vuna.Compiler.Elab.Termination.Measure.clausesOfDef", "Vuna/Compiler/Elab/Termination/Measure.vuna:135"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dclausesOfDefTbl", ("Vuna.Compiler.Elab.Termination.Measure.clausesOfDefTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:140"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFacts", ("Vuna.Compiler.Elab.Termination.Measure.computePosFacts", "Vuna/Compiler/Elab/Termination/Measure.vuna:408"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dcomputePosFactsStep", ("Vuna.Compiler.Elab.Termination.Measure.computePosFactsStep", "Vuna/Compiler/Elab/Termination/Measure.vuna:411"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNameOf", ("Vuna.Compiler.Elab.Termination.Measure.ctorNameOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:162"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dctorNamesOf", ("Vuna.Compiler.Elab.Termination.Measure.ctorNamesOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:154"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedup", ("Vuna.Compiler.Elab.Termination.Measure.dedup", "Vuna/Compiler/Elab/Termination/Measure.vuna:27"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddedupInts", ("Vuna.Compiler.Elab.Termination.Measure.dedupInts", "Vuna/Compiler/Elab/Termination/Measure.vuna:283"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefArity", ("Vuna.Compiler.Elab.Termination.Measure.defArity", "Vuna/Compiler/Elab/Termination/Measure.vuna:145"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddefNames", ("Vuna.Compiler.Elab.Termination.Measure.defNames", "Vuna/Compiler/Elab/Termination/Measure.vuna:132"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_ddotBase", ("Vuna.Compiler.Elab.Termination.Measure.dotBase", "Vuna/Compiler/Elab/Termination/Measure.vuna:550"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrict", ("Vuna.Compiler.Elab.Termination.Measure.edgeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:568"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeStrictGo", ("Vuna.Compiler.Elab.Termination.Measure.edgeStrictGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:571"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargets", ("Vuna.Compiler.Elab.Termination.Measure.edgeTargets", "Vuna/Compiler/Elab/Termination/Measure.vuna:578"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dedgeTargetsGo", ("Vuna.Compiler.Elab.Termination.Measure.edgeTargetsGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:581"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendElemSizes", ("Vuna.Compiler.Elab.Termination.Measure.extendElemSizes", "Vuna/Compiler/Elab/Termination/Measure.vuna:561"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dextendSizesStrict", ("Vuna.Compiler.Elab.Termination.Measure.extendSizesStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:192"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfieldsSizeStrict", ("Vuna.Compiler.Elab.Termination.Measure.fieldsSizeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:180"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfilterModes", ("Vuna.Compiler.Elab.Termination.Measure.filterModes", "Vuna/Compiler/Elab/Termination/Measure.vuna:618"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfindWrapField", ("Vuna.Compiler.Elab.Termination.Measure.findWrapField", "Vuna/Compiler/Elab/Termination/Measure.vuna:461"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dfunDeclsOf", ("Vuna.Compiler.Elab.Termination.Measure.funDeclsOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:98"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefs", ("Vuna.Compiler.Elab.Termination.Measure.groupDefs", "Vuna/Compiler/Elab/Termination/Measure.vuna:113"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupDefsGo", ("Vuna.Compiler.Elab.Termination.Measure.groupDefsGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:126"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dgroupHead", ("Vuna.Compiler.Elab.Termination.Measure.groupHead", "Vuna/Compiler/Elab/Termination/Measure.vuna:542"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardGE", ("Vuna.Compiler.Elab.Termination.Measure.guardGE", "Vuna/Compiler/Elab/Termination/Measure.vuna:234"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLE", ("Vuna.Compiler.Elab.Termination.Measure.guardLE", "Vuna/Compiler/Elab/Termination/Measure.vuna:228"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardLT", ("Vuna.Compiler.Elab.Termination.Measure.guardLT", "Vuna/Compiler/Elab/Termination/Measure.vuna:240"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dguardPosVar", ("Vuna.Compiler.Elab.Termination.Measure.guardPosVar", "Vuna/Compiler/Elab/Termination/Measure.vuna:210"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycle", ("Vuna.Compiler.Elab.Termination.Measure.hasWeakCycle", "Vuna/Compiler/Elab/Termination/Measure.vuna:607"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dhasWeakCycleGo", ("Vuna.Compiler.Elab.Termination.Measure.hasWeakCycleGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:610"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_disDescent", ("Vuna.Compiler.Elab.Termination.Measure.isDescent", "Vuna/Compiler/Elab/Termination/Measure.vuna:615"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_disMapLike", ("Vuna.Compiler.Elab.Termination.Measure.isMapLike", "Vuna/Compiler/Elab/Termination/Measure.vuna:553"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_disSubOpName", ("Vuna.Compiler.Elab.Termination.Measure.isSubOpName", "Vuna/Compiler/Elab/Termination/Measure.vuna:490"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_djoinComma", ("Vuna.Compiler.Elab.Termination.Measure.joinComma", "Vuna/Compiler/Elab/Termination/Measure.vuna:30"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dlookupGroup", ("Vuna.Compiler.Elab.Termination.Measure.lookupGroup", "Vuna/Compiler/Elab/Termination/Measure.vuna:104"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmarkInvalid", ("Vuna.Compiler.Elab.Termination.Measure.markInvalid", "Vuna/Compiler/Elab/Termination/Measure.vuna:535"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxArityOf", ("Vuna.Compiler.Elab.Termination.Measure.maxArityOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:149"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmaxInt", ("Vuna.Compiler.Elab.Termination.Measure.maxInt", "Vuna/Compiler/Elab/Termination/Measure.vuna:11"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dmemInt", ("Vuna.Compiler.Elab.Termination.Measure.memInt", "Vuna/Compiler/Elab/Termination/Measure.vuna:57"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnotEmpty", ("Vuna.Compiler.Elab.Termination.Measure.notEmpty", "Vuna/Compiler/Elab/Termination/Measure.vuna:14"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dnthExpr", ("Vuna.Compiler.Elab.Termination.Measure.nthExpr", "Vuna/Compiler/Elab/Termination/Measure.vuna:546"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dopBaseName", ("Vuna.Compiler.Elab.Termination.Measure.opBaseName", "Vuna/Compiler/Elab/Termination/Measure.vuna:225"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatSizeStrict", ("Vuna.Compiler.Elab.Termination.Measure.patSizeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:165"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInFields", ("Vuna.Compiler.Elab.Termination.Measure.pathInFields", "Vuna/Compiler/Elab/Termination/Measure.vuna:427"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPat", ("Vuna.Compiler.Elab.Termination.Measure.pathInPat", "Vuna/Compiler/Elab/Termination/Measure.vuna:433"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpathInPats", ("Vuna.Compiler.Elab.Termination.Measure.pathInPats", "Vuna/Compiler/Elab/Termination/Measure.vuna:421"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dpatsSizeStrict", ("Vuna.Compiler.Elab.Termination.Measure.patsSizeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:175"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposAdd", ("Vuna.Compiler.Elab.Termination.Measure.posAdd", "Vuna/Compiler/Elab/Termination/Measure.vuna:61"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposEntryPairs", ("Vuna.Compiler.Elab.Termination.Measure.posEntryPairs", "Vuna/Compiler/Elab/Termination/Measure.vuna:280"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilter", ("Vuna.Compiler.Elab.Termination.Measure.posFilter", "Vuna/Compiler/Elab/Termination/Measure.vuna:71"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposFilterTbl", ("Vuna.Compiler.Elab.Termination.Measure.posFilterTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:82"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHas", ("Vuna.Compiler.Elab.Termination.Measure.posHas", "Vuna/Compiler/Elab/Termination/Measure.vuna:36"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposHasTbl", ("Vuna.Compiler.Elab.Termination.Measure.posHasTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:52"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkNeg", ("Vuna.Compiler.Elab.Termination.Measure.posMarkNeg", "Vuna/Compiler/Elab/Termination/Measure.vuna:270"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposMarkPos", ("Vuna.Compiler.Elab.Termination.Measure.posMarkPos", "Vuna/Compiler/Elab/Termination/Measure.vuna:267"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposNormalize", ("Vuna.Compiler.Elab.Termination.Measure.posNormalize", "Vuna/Compiler/Elab/Termination/Measure.vuna:274"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanClauses", ("Vuna.Compiler.Elab.Termination.Measure.posScanClauses", "Vuna/Compiler/Elab/Termination/Measure.vuna:380"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanDefs", ("Vuna.Compiler.Elab.Termination.Measure.posScanDefs", "Vuna/Compiler/Elab/Termination/Measure.vuna:388"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNames", ("Vuna.Compiler.Elab.Termination.Measure.posScanNames", "Vuna/Compiler/Elab/Termination/Measure.vuna:395"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposScanNamesGo", ("Vuna.Compiler.Elab.Termination.Measure.posScanNamesGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:401"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEq", ("Vuna.Compiler.Elab.Termination.Measure.posSetEq", "Vuna/Compiler/Elab/Termination/Measure.vuna:68"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSetEqTbl", ("Vuna.Compiler.Elab.Termination.Measure.posSetEqTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:91"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubset", ("Vuna.Compiler.Elab.Termination.Measure.posSubset", "Vuna/Compiler/Elab/Termination/Measure.vuna:64"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposSubsetTbl", ("Vuna.Compiler.Elab.Termination.Measure.posSubsetTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:87"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOf", ("Vuna.Compiler.Elab.Termination.Measure.posTblOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:43"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblOfGo", ("Vuna.Compiler.Elab.Termination.Measure.posTblOfGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:46"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposTblPairs", ("Vuna.Compiler.Elab.Termination.Measure.posTblPairs", "Vuna/Compiler/Elab/Termination/Measure.vuna:277"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnion", ("Vuna.Compiler.Elab.Termination.Measure.posUnion", "Vuna/Compiler/Elab/Termination/Measure.vuna:76"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposUnionTbl", ("Vuna.Compiler.Elab.Termination.Measure.posUnionTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:95"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposVarIn", ("Vuna.Compiler.Elab.Termination.Measure.posVarIn", "Vuna/Compiler/Elab/Termination/Measure.vuna:479"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalk", ("Vuna.Compiler.Elab.Termination.Measure.posWalk", "Vuna/Compiler/Elab/Termination/Measure.vuna:321"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkAlts", ("Vuna.Compiler.Elab.Termination.Measure.posWalkAlts", "Vuna/Compiler/Elab/Termination/Measure.vuna:299"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkArgs", ("Vuna.Compiler.Elab.Termination.Measure.posWalkArgs", "Vuna/Compiler/Elab/Termination/Measure.vuna:287"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkBinds", ("Vuna.Compiler.Elab.Termination.Measure.posWalkBinds", "Vuna/Compiler/Elab/Termination/Measure.vuna:305"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCallee", ("Vuna.Compiler.Elab.Termination.Measure.posWalkCallee", "Vuna/Compiler/Elab/Termination/Measure.vuna:367"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkCalleeGo", ("Vuna.Compiler.Elab.Termination.Measure.posWalkCalleeGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:371"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkFields", ("Vuna.Compiler.Elab.Termination.Measure.posWalkFields", "Vuna/Compiler/Elab/Termination/Measure.vuna:293"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dposWalkStmts", ("Vuna.Compiler.Elab.Termination.Measure.posWalkStmts", "Vuna/Compiler/Elab/Termination/Measure.vuna:311"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojHas", ("Vuna.Compiler.Elab.Termination.Measure.projHas", "Vuna/Compiler/Elab/Termination/Measure.vuna:457"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojRel", ("Vuna.Compiler.Elab.Termination.Measure.projRel", "Vuna/Compiler/Elab/Termination/Measure.vuna:508"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionOfDef", ("Vuna.Compiler.Elab.Termination.Measure.projectionOfDef", "Vuna/Compiler/Elab/Termination/Measure.vuna:440"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dprojectionsOf", ("Vuna.Compiler.Elab.Termination.Measure.projectionsOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:451"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_drelOfArg", ("Vuna.Compiler.Elab.Termination.Measure.relOfArg", "Vuna/Compiler/Elab/Termination/Measure.vuna:517"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dreplaceGroup", ("Vuna.Compiler.Elab.Termination.Measure.replaceGroup", "Vuna/Compiler/Elab/Termination/Measure.vuna:108"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dsizeOfVarStrict", ("Vuna.Compiler.Elab.Termination.Measure.sizeOfVarStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:202"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntries", ("Vuna.Compiler.Elab.Termination.Measure.strSizeEntries", "Vuna/Compiler/Elab/Termination/Measure.vuna:185"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dstrSizeEntriesGo", ("Vuna.Compiler.Elab.Termination.Measure.strSizeEntriesGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:188"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dvarOfExpr", ("Vuna.Compiler.Elab.Termination.Measure.varOfExpr", "Vuna/Compiler/Elab/Termination/Measure.vuna:246"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdj", ("Vuna.Compiler.Elab.Termination.Measure.weakAdj", "Vuna/Compiler/Elab/Termination/Measure.vuna:587"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakAdjGo", ("Vuna.Compiler.Elab.Termination.Measure.weakAdjGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:590"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReach", ("Vuna.Compiler.Elab.Termination.Measure.weakReach", "Vuna/Compiler/Elab/Termination/Measure.vuna:595"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dweakReachFuel", ("Vuna.Compiler.Elab.Termination.Measure.weakReachFuel", "Vuna/Compiler/Elab/Termination/Measure.vuna:598"));
  ("v_Vuna_dCompiler_dElab_dTermination_dMeasure_dwrapCheck", ("Vuna.Compiler.Elab.Termination.Measure.wrapCheck", "Vuna/Compiler/Elab/Termination/Measure.vuna:472"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dbadGraphText", ("Vuna.Compiler.Elab.Termination.Scc.badGraphText", "Vuna/Compiler/Elab/Termination/Scc.vuna:395"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dcanonEdges", ("Vuna.Compiler.Elab.Termination.Scc.canonEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:203"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureLoop", ("Vuna.Compiler.Elab.Termination.Scc.closureLoop", "Vuna/Compiler/Elab/Termination/Scc.vuna:323"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStep", ("Vuna.Compiler.Elab.Termination.Scc.closureStep", "Vuna/Compiler/Elab/Termination/Scc.vuna:311"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGo", ("Vuna.Compiler.Elab.Termination.Scc.closureStepGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:305"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepGraphs", ("Vuna.Compiler.Elab.Termination.Scc.closureStepGraphs", "Vuna/Compiler/Elab/Termination/Scc.vuna:299"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepHs", ("Vuna.Compiler.Elab.Termination.Scc.closureStepHs", "Vuna/Compiler/Elab/Termination/Scc.vuna:283"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOne", ("Vuna.Compiler.Elab.Termination.Scc.closureStepOne", "Vuna/Compiler/Elab/Termination/Scc.vuna:289"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dclosureStepOneGo", ("Vuna.Compiler.Elab.Termination.Scc.closureStepOneGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:292"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dcombineWith", ("Vuna.Compiler.Elab.Termination.Scc.combineWith", "Vuna/Compiler/Elab/Termination/Scc.vuna:218"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dcompactEdges", ("Vuna.Compiler.Elab.Termination.Scc.compactEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:195"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeEdges", ("Vuna.Compiler.Elab.Termination.Scc.composeEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:228"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dcomposeGo", ("Vuna.Compiler.Elab.Termination.Scc.composeGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:224"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeModeOf", ("Vuna.Compiler.Elab.Termination.Scc.edgeModeOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:488"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dedgeText", ("Vuna.Compiler.Elab.Termination.Scc.edgeText", "Vuna/Compiler/Elab/Termination/Scc.vuna:381"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEq", ("Vuna.Compiler.Elab.Termination.Scc.edgesEq", "Vuna/Compiler/Elab/Termination/Scc.vuna:215"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesEqCanon", ("Vuna.Compiler.Elab.Termination.Scc.edgesEqCanon", "Vuna/Compiler/Elab/Termination/Scc.vuna:206"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dedgesText", ("Vuna.Compiler.Elab.Termination.Scc.edgesText", "Vuna/Compiler/Elab/Termination/Scc.vuna:390"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamName", ("Vuna.Compiler.Elab.Termination.Scc.firstParamName", "Vuna/Compiler/Elab/Termination/Scc.vuna:426"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dfirstParamOf", ("Vuna.Compiler.Elab.Termination.Scc.firstParamOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:432"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesGo", ("Vuna.Compiler.Elab.Termination.Scc.fuelEdgesGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:461"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelEdgesOf", ("Vuna.Compiler.Elab.Termination.Scc.fuelEdgesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:458"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dfuelMembersGuarded", ("Vuna.Compiler.Elab.Termination.Scc.fuelMembersGuarded", "Vuna/Compiler/Elab/Termination/Scc.vuna:469"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphIdempotent", ("Vuna.Compiler.Elab.Termination.Scc.graphIdempotent", "Vuna/Compiler/Elab/Termination/Scc.vuna:235"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListHas", ("Vuna.Compiler.Elab.Termination.Scc.graphListHas", "Vuna/Compiler/Elab/Termination/Scc.vuna:257"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphListSubset", ("Vuna.Compiler.Elab.Termination.Scc.graphListSubset", "Vuna/Compiler/Elab/Termination/Scc.vuna:261"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphOK", ("Vuna.Compiler.Elab.Termination.Scc.graphOK", "Vuna/Compiler/Elab/Termination/Scc.vuna:238"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dgraphsOK", ("Vuna.Compiler.Elab.Termination.Scc.graphsOK", "Vuna/Compiler/Elab/Termination/Scc.vuna:241"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dhasFuelGuard", ("Vuna.Compiler.Elab.Termination.Scc.hasFuelGuard", "Vuna/Compiler/Elab/Termination/Scc.vuna:439"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dhasStrict", ("Vuna.Compiler.Elab.Termination.Scc.hasStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:231"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTable", ("Vuna.Compiler.Elab.Termination.Scc.initialTable", "Vuna/Compiler/Elab/Termination/Scc.vuna:355"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dinitialTableGo", ("Vuna.Compiler.Elab.Termination.Scc.initialTableGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:358"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dinsertEdge", ("Vuna.Compiler.Elab.Termination.Scc.insertEdge", "Vuna/Compiler/Elab/Termination/Scc.vuna:181"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dlocalClauseBinds", ("Vuna.Compiler.Elab.Termination.Scc.localClauseBinds", "Vuna/Compiler/Elab/Termination/Scc.vuna:109"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dmaxBaseOf", ("Vuna.Compiler.Elab.Termination.Scc.maxBaseOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:177"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dmergeStrict", ("Vuna.Compiler.Elab.Termination.Scc.mergeStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:192"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dscIsStrict", ("Vuna.Compiler.Elab.Termination.Scc.scIsStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:174"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadGraphs", ("Vuna.Compiler.Elab.Termination.Scc.sctBadGraphs", "Vuna/Compiler/Elab/Termination/Scc.vuna:372"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadPairs", ("Vuna.Compiler.Elab.Termination.Scc.sctBadPairs", "Vuna/Compiler/Elab/Termination/Scc.vuna:376"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsctBadText", ("Vuna.Compiler.Elab.Termination.Scc.sctBadText", "Vuna/Compiler/Elab/Termination/Scc.vuna:400"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheck", ("Vuna.Compiler.Elab.Termination.Scc.sctCheck", "Vuna/Compiler/Elab/Termination/Scc.vuna:408"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsctCheckTable", ("Vuna.Compiler.Elab.Termination.Scc.sctCheckTable", "Vuna/Compiler/Elab/Termination/Scc.vuna:367"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsctDiag", ("Vuna.Compiler.Elab.Termination.Scc.sctDiag", "Vuna/Compiler/Elab/Termination/Scc.vuna:405"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollect", ("Vuna.Compiler.Elab.Termination.Scc.siteCollect", "Vuna/Compiler/Elab/Termination/Scc.vuna:165"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectAlts", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectAlts", "Vuna/Compiler/Elab/Termination/Scc.vuna:39"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectBinds", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectBinds", "Vuna/Compiler/Elab/Termination/Scc.vuna:47"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectClauses", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectClauses", "Vuna/Compiler/Elab/Termination/Scc.vuna:159"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectFields", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectFields", "Vuna/Compiler/Elab/Termination/Scc.vuna:31"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectGo", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:168"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectList", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectList", "Vuna/Compiler/Elab/Termination/Scc.vuna:23"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteCollectStmts", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectStmts", "Vuna/Compiler/Elab/Termination/Scc.vuna:55"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgeAt", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgeAt", "Vuna/Compiler/Elab/Termination/Scc.vuna:333"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesI", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgesI", "Vuna/Compiler/Elab/Termination/Scc.vuna:346"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesJ", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgesJ", "Vuna/Compiler/Elab/Termination/Scc.vuna:340"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteEdgesOf", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:352"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteFuelStrict", ("Vuna.Compiler.Elab.Termination.Scc.siteFuelStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:446"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkC", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkC", "Vuna/Compiler/Elab/Termination/Scc.vuna:67"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEApp", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkEApp", "Vuna/Compiler/Elab/Termination/Scc.vuna:114"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkEAppMap", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkEAppMap", "Vuna/Compiler/Elab/Termination/Scc.vuna:129"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsiteWalkMapPartialInline", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkMapPartialInline", "Vuna/Compiler/Elab/Termination/Scc.vuna:149"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dsortEdges", ("Vuna.Compiler.Elab.Termination.Scc.sortEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:188"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dstrictEdgeText", ("Vuna.Compiler.Elab.Termination.Scc.strictEdgeText", "Vuna/Compiler/Elab/Termination/Scc.vuna:384"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAdd", ("Vuna.Compiler.Elab.Termination.Scc.tableAdd", "Vuna/Compiler/Elab/Termination/Scc.vuna:272"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtableAddPair", ("Vuna.Compiler.Elab.Termination.Scc.tableAddPair", "Vuna/Compiler/Elab/Termination/Scc.vuna:265"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtableGraphCap", ("Vuna.Compiler.Elab.Termination.Scc.tableGraphCap", "Vuna/Compiler/Elab/Termination/Scc.vuna:248"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtableLookup", ("Vuna.Compiler.Elab.Termination.Scc.tableLookup", "Vuna/Compiler/Elab/Termination/Scc.vuna:251"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSame", ("Vuna.Compiler.Elab.Termination.Scc.tableSame", "Vuna/Compiler/Elab/Termination/Scc.vuna:314"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtableSubset", ("Vuna.Compiler.Elab.Termination.Scc.tableSubset", "Vuna/Compiler/Elab/Termination/Scc.vuna:317"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dtryFuelThread", ("Vuna.Compiler.Elab.Termination.Scc.tryFuelThread", "Vuna/Compiler/Elab/Termination/Scc.vuna:477"));
  ("v_Vuna_dCompiler_dElab_dTermination_dScc_dweakEdgeText", ("Vuna.Compiler.Elab.Termination.Scc.weakEdgeText", "Vuna/Compiler/Elab/Termination/Scc.vuna:387"));
  ("v_Vuna_dCompiler_dElab_dTermination_daddEdge", ("Vuna.Compiler.Elab.Termination.addEdge", "Vuna/Compiler/Elab/Termination.vuna:102"));
  ("v_Vuna_dCompiler_dElab_dTermination_daddEdges", ("Vuna.Compiler.Elab.Termination.addEdges", "Vuna/Compiler/Elab/Termination.vuna:107"));
  ("v_Vuna_dCompiler_dElab_dTermination_daddSrcs", ("Vuna.Compiler.Elab.Termination.addSrcs", "Vuna/Compiler/Elab/Termination.vuna:86"));
  ("v_Vuna_dCompiler_dElab_dTermination_dadjOf", ("Vuna.Compiler.Elab.Termination.adjOf", "Vuna/Compiler/Elab/Termination.vuna:73"));
  ("v_Vuna_dCompiler_dElab_dTermination_dadjTblOf", ("Vuna.Compiler.Elab.Termination.adjTblOf", "Vuna/Compiler/Elab/Termination.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dTermination_danyOwnTbl", ("Vuna.Compiler.Elab.Termination.anyOwnTbl", "Vuna/Compiler/Elab/Termination.vuna:445"));
  ("v_Vuna_dCompiler_dElab_dTermination_dapplyCallFields", ("Vuna.Compiler.Elab.Termination.applyCallFields", "Vuna/Compiler/Elab/Termination.vuna:338"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcallGraph", ("Vuna.Compiler.Elab.Termination.callGraph", "Vuna/Compiler/Elab/Termination.vuna:70"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcallMode", ("Vuna.Compiler.Elab.Termination.callMode", "Vuna/Compiler/Elab/Termination.vuna:457"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsg", ("Vuna.Compiler.Elab.Termination.cannotProveMsg", "Vuna/Compiler/Elab/Termination.vuna:323"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcannotProveMsgEdges", ("Vuna.Compiler.Elab.Termination.cannotProveMsgEdges", "Vuna/Compiler/Elab/Termination.vuna:327"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcheckComp", ("Vuna.Compiler.Elab.Termination.checkComp", "Vuna/Compiler/Elab/Termination.vuna:391"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcheckSccsWith", ("Vuna.Compiler.Elab.Termination.checkSccsWith", "Vuna/Compiler/Elab/Termination.vuna:449"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcheckStrictGroup", ("Vuna.Compiler.Elab.Termination.checkStrictGroup", "Vuna/Compiler/Elab/Termination.vuna:381"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDecls", ("Vuna.Compiler.Elab.Termination.checkTerminationDecls", "Vuna/Compiler/Elab/Termination.vuna:415"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcheckTerminationDeclsWith", ("Vuna.Compiler.Elab.Termination.checkTerminationDeclsWith", "Vuna/Compiler/Elab/Termination.vuna:424"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcollectClauses", ("Vuna.Compiler.Elab.Termination.collectClauses", "Vuna/Compiler/Elab/Termination.vuna:344"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcollectComp", ("Vuna.Compiler.Elab.Termination.collectComp", "Vuna/Compiler/Elab/Termination.vuna:150"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcollectMeasure", ("Vuna.Compiler.Elab.Termination.collectMeasure", "Vuna/Compiler/Elab/Termination.vuna:353"));
  ("v_Vuna_dCompiler_dElab_dTermination_dcomputePosFactsWork", ("Vuna.Compiler.Elab.Termination.computePosFactsWork", "Vuna/Compiler/Elab/Termination.vuna:399"));
  ("v_Vuna_dCompiler_dElab_dTermination_ddedupTransposed", ("Vuna.Compiler.Elab.Termination.dedupTransposed", "Vuna/Compiler/Elab/Termination.vuna:118"));
  ("v_Vuna_dCompiler_dElab_dTermination_ddfsAll", ("Vuna.Compiler.Elab.Termination.dfsAll", "Vuna/Compiler/Elab/Termination.vuna:140"));
  ("v_Vuna_dCompiler_dElab_dTermination_ddfsPost", ("Vuna.Compiler.Elab.Termination.dfsPost", "Vuna/Compiler/Elab/Termination.vuna:130"));
  ("v_Vuna_dCompiler_dElab_dTermination_ddfunNames", ("Vuna.Compiler.Elab.Termination.dfunNames", "Vuna/Compiler/Elab/Termination.vuna:418"));
  ("v_Vuna_dCompiler_dElab_dTermination_dedgeCount", ("Vuna.Compiler.Elab.Termination.edgeCount", "Vuna/Compiler/Elab/Termination.vuna:122"));
  ("v_Vuna_dCompiler_dElab_dTermination_dexprRefsB", ("Vuna.Compiler.Elab.Termination.exprRefsB", "Vuna/Compiler/Elab/Termination.vuna:35"));
  ("v_Vuna_dCompiler_dElab_dTermination_dgraphFuel", ("Vuna.Compiler.Elab.Termination.graphFuel", "Vuna/Compiler/Elab/Termination.vuna:126"));
  ("v_Vuna_dCompiler_dElab_dTermination_dgroupMessage", ("Vuna.Compiler.Elab.Termination.groupMessage", "Vuna/Compiler/Elab/Termination.vuna:318"));
  ("v_Vuna_dCompiler_dElab_dTermination_dlocalClauseBinds", ("Vuna.Compiler.Elab.Termination.localClauseBinds", "Vuna/Compiler/Elab/Termination.vuna:209"));
  ("v_Vuna_dCompiler_dElab_dTermination_dmapEdges", ("Vuna.Compiler.Elab.Termination.mapEdges", "Vuna/Compiler/Elab/Termination.vuna:64"));
  ("v_Vuna_dCompiler_dElab_dTermination_dpatNames", ("Vuna.Compiler.Elab.Termination.patNames", "Vuna/Compiler/Elab/Termination.vuna:14"));
  ("v_Vuna_dCompiler_dElab_dTermination_dpatsNames", ("Vuna.Compiler.Elab.Termination.patsNames", "Vuna/Compiler/Elab/Termination.vuna:22"));
  ("v_Vuna_dCompiler_dElab_dTermination_dpostOrder", ("Vuna.Compiler.Elab.Termination.postOrder", "Vuna/Compiler/Elab/Termination.vuna:147"));
  ("v_Vuna_dCompiler_dElab_dTermination_drefsOfDef", ("Vuna.Compiler.Elab.Termination.refsOfDef", "Vuna/Compiler/Elab/Termination.vuna:61"));
  ("v_Vuna_dCompiler_dElab_dTermination_drefsOfStmt", ("Vuna.Compiler.Elab.Termination.refsOfStmt", "Vuna/Compiler/Elab/Termination.vuna:25"));
  ("v_Vuna_dCompiler_dElab_dTermination_drefsOfStmts", ("Vuna.Compiler.Elab.Termination.refsOfStmts", "Vuna/Compiler/Elab/Termination.vuna:29"));
  ("v_Vuna_dCompiler_dElab_dTermination_dreplacePair", ("Vuna.Compiler.Elab.Termination.replacePair", "Vuna/Compiler/Elab/Termination.vuna:95"));
  ("v_Vuna_dCompiler_dElab_dTermination_dreverseAdjOf", ("Vuna.Compiler.Elab.Termination.reverseAdjOf", "Vuna/Compiler/Elab/Termination.vuna:82"));
  ("v_Vuna_dCompiler_dElab_dTermination_dsccOf", ("Vuna.Compiler.Elab.Termination.sccOf", "Vuna/Compiler/Elab/Termination.vuna:159"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrClause", ("Vuna.Compiler.Elab.Termination.strClause", "Vuna/Compiler/Elab/Termination.vuna:311"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalk", ("Vuna.Compiler.Elab.Termination.strWalk", "Vuna/Compiler/Elab/Termination.vuna:166"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkAlts", ("Vuna.Compiler.Elab.Termination.strWalkAlts", "Vuna/Compiler/Elab/Termination.vuna:275"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkApp", ("Vuna.Compiler.Elab.Termination.strWalkApp", "Vuna/Compiler/Elab/Termination.vuna:261"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkArgs", ("Vuna.Compiler.Elab.Termination.strWalkArgs", "Vuna/Compiler/Elab/Termination.vuna:267"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkBinds", ("Vuna.Compiler.Elab.Termination.strWalkBinds", "Vuna/Compiler/Elab/Termination.vuna:283"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkEApp", ("Vuna.Compiler.Elab.Termination.strWalkEApp", "Vuna/Compiler/Elab/Termination.vuna:214"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkEAppMap", ("Vuna.Compiler.Elab.Termination.strWalkEAppMap", "Vuna/Compiler/Elab/Termination.vuna:229"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkFields", ("Vuna.Compiler.Elab.Termination.strWalkFields", "Vuna/Compiler/Elab/Termination.vuna:291"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkMapPartialInline", ("Vuna.Compiler.Elab.Termination.strWalkMapPartialInline", "Vuna/Compiler/Elab/Termination.vuna:249"));
  ("v_Vuna_dCompiler_dElab_dTermination_dstrWalkStmts", ("Vuna.Compiler.Elab.Termination.strWalkStmts", "Vuna/Compiler/Elab/Termination.vuna:299"));
  ("v_Vuna_dCompiler_dElab_dTermination_dtranspose", ("Vuna.Compiler.Elab.Termination.transpose", "Vuna/Compiler/Elab/Termination.vuna:115"));
  ("v_Vuna_dCompiler_dElab_dTermination_dtransposeGo", ("Vuna.Compiler.Elab.Termination.transposeGo", "Vuna/Compiler/Elab/Termination.vuna:111"));
  ("v_Vuna_dCompiler_dElab_dTermination_dtryMeasure", ("Vuna.Compiler.Elab.Termination.tryMeasure", "Vuna/Compiler/Elab/Termination.vuna:361"));
  ("v_Vuna_dCompiler_dElab_dTermination_dtryMeasureGo", ("Vuna.Compiler.Elab.Termination.tryMeasureGo", "Vuna/Compiler/Elab/Termination.vuna:365"));
  ("v_Vuna_dCompiler_dElab_dTrait_daddDictGoalGroup", ("Vuna.Compiler.Elab.Trait.addDictGoalGroup", "Vuna/Compiler/Elab/Trait.vuna:978"));
  ("v_Vuna_dCompiler_dElab_dTrait_danyDeclInFile", ("Vuna.Compiler.Elab.Trait.anyDeclInFile", "Vuna/Compiler/Elab/Trait.vuna:292"));
  ("v_Vuna_dCompiler_dElab_dTrait_danyGlobalHead", ("Vuna.Compiler.Elab.Trait.anyGlobalHead", "Vuna/Compiler/Elab/Trait.vuna:297"));
  ("v_Vuna_dCompiler_dElab_dTrait_danySameMethod", ("Vuna.Compiler.Elab.Trait.anySameMethod", "Vuna/Compiler/Elab/Trait.vuna:699"));
  ("v_Vuna_dCompiler_dElab_dTrait_dapplyCtxSubstsTo", ("Vuna.Compiler.Elab.Trait.applyCtxSubstsTo", "Vuna/Compiler/Elab/Trait.vuna:891"));
  ("v_Vuna_dCompiler_dElab_dTrait_dapplyTermSubstsTo", ("Vuna.Compiler.Elab.Trait.applyTermSubstsTo", "Vuna/Compiler/Elab/Trait.vuna:914"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbareTeleSeeds", ("Vuna.Compiler.Elab.Trait.bareTeleSeeds", "Vuna/Compiler/Elab/Trait.vuna:548"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbindClassParams", ("Vuna.Compiler.Elab.Trait.bindClassParams", "Vuna/Compiler/Elab/Trait.vuna:29"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbindDictBinderFuel", ("Vuna.Compiler.Elab.Trait.bindDictBinderFuel", "Vuna/Compiler/Elab/Trait.vuna:1275"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinder", ("Vuna.Compiler.Elab.Trait.bindIndexBinder", "Vuna/Compiler/Elab/Trait.vuna:1401"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbindIndexBinderFuel", ("Vuna.Compiler.Elab.Trait.bindIndexBinderFuel", "Vuna/Compiler/Elab/Trait.vuna:1288"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbindOnePattern", ("Vuna.Compiler.Elab.Trait.bindOnePattern", "Vuna/Compiler/Elab/Trait.vuna:1405"));
  ("v_Vuna_dCompiler_dElab_dTrait_dbindOnePatternFuel", ("Vuna.Compiler.Elab.Trait.bindOnePatternFuel", "Vuna/Compiler/Elab/Trait.vuna:1347"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcanonicalMethodShort", ("Vuna.Compiler.Elab.Trait.canonicalMethodShort", "Vuna/Compiler/Elab/Trait.vuna:681"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckArgsAtKinds", ("Vuna.Compiler.Elab.Trait.checkArgsAtKinds", "Vuna/Compiler/Elab/Trait.vuna:475"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckBinders", ("Vuna.Compiler.Elab.Trait.checkBinders", "Vuna/Compiler/Elab/Trait.vuna:1398"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckBindersFuel", ("Vuna.Compiler.Elab.Trait.checkBindersFuel", "Vuna/Compiler/Elab/Trait.vuna:1256"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckBodyAtEndFuel", ("Vuna.Compiler.Elab.Trait.checkBodyAtEndFuel", "Vuna/Compiler/Elab/Trait.vuna:1305"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckDef", ("Vuna.Compiler.Elab.Trait.checkDef", "Vuna/Compiler/Elab/Trait.vuna:1253"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckDefIn", ("Vuna.Compiler.Elab.Trait.checkDefIn", "Vuna/Compiler/Elab/Trait.vuna:1249"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeads", ("Vuna.Compiler.Elab.Trait.checkInstanceHeads", "Vuna/Compiler/Elab/Trait.vuna:1138"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckInstanceHeadsGo", ("Vuna.Compiler.Elab.Trait.checkInstanceHeadsGo", "Vuna/Compiler/Elab/Trait.vuna:1141"));
  ("v_Vuna_dCompiler_dElab_dTrait_dcheckSuperClasses", ("Vuna.Compiler.Elab.Trait.checkSuperClasses", "Vuna/Compiler/Elab/Trait.vuna:312"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclassFieldTys", ("Vuna.Compiler.Elab.Trait.classFieldTys", "Vuna/Compiler/Elab/Trait.vuna:34"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclassFieldTysGo", ("Vuna.Compiler.Elab.Trait.classFieldTysGo", "Vuna/Compiler/Elab/Trait.vuna:38"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclassParamKinds", ("Vuna.Compiler.Elab.Trait.classParamKinds", "Vuna/Compiler/Elab/Trait.vuna:118"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclauseSpanOf", ("Vuna.Compiler.Elab.Trait.clauseSpanOf", "Vuna/Compiler/Elab/Trait.vuna:946"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclosedTypeArgs", ("Vuna.Compiler.Elab.Trait.closedTypeArgs", "Vuna/Compiler/Elab/Trait.vuna:504"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerm", ("Vuna.Compiler.Elab.Trait.closedTypeTerm", "Vuna/Compiler/Elab/Trait.vuna:495"));
  ("v_Vuna_dCompiler_dElab_dTrait_dclosedTypeTerms", ("Vuna.Compiler.Elab.Trait.closedTypeTerms", "Vuna/Compiler/Elab/Trait.vuna:487"));
  ("v_Vuna_dCompiler_dElab_dTrait_dconstraintPartsOf", ("Vuna.Compiler.Elab.Trait.constraintPartsOf", "Vuna/Compiler/Elab/Trait.vuna:380"));
  ("v_Vuna_dCompiler_dElab_dTrait_dctorResultType", ("Vuna.Compiler.Elab.Trait.ctorResultType", "Vuna/Compiler/Elab/Trait.vuna:753"));
  ("v_Vuna_dCompiler_dElab_dTrait_dctxBareTeleSeeds", ("Vuna.Compiler.Elab.Trait.ctxBareTeleSeeds", "Vuna/Compiler/Elab/Trait.vuna:557"));
  ("v_Vuna_dCompiler_dElab_dTrait_dctxDictDomEqual", ("Vuna.Compiler.Elab.Trait.ctxDictDomEqual", "Vuna/Compiler/Elab/Trait.vuna:884"));
  ("v_Vuna_dCompiler_dElab_dTrait_dctxDictName", ("Vuna.Compiler.Elab.Trait.ctxDictName", "Vuna/Compiler/Elab/Trait.vuna:631"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddeclNamedInFile", ("Vuna.Compiler.Elab.Trait.declNamedInFile", "Vuna/Compiler/Elab/Trait.vuna:264"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddeclTopName", ("Vuna.Compiler.Elab.Trait.declTopName", "Vuna/Compiler/Elab/Trait.vuna:258"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddefBodyOf", ("Vuna.Compiler.Elab.Trait.defBodyOf", "Vuna/Compiler/Elab/Trait.vuna:1192"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddefTypeOrDefaultTbl", ("Vuna.Compiler.Elab.Trait.defTypeOrDefaultTbl", "Vuna/Compiler/Elab/Trait.vuna:1241"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddictAppTermOf", ("Vuna.Compiler.Elab.Trait.dictAppTermOf", "Vuna/Compiler/Elab/Trait.vuna:151"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddictParamArgs", ("Vuna.Compiler.Elab.Trait.dictParamArgs", "Vuna/Compiler/Elab/Trait.vuna:154"));
  ("v_Vuna_dCompiler_dElab_dTrait_ddomainsEqual", ("Vuna.Compiler.Elab.Trait.domainsEqual", "Vuna/Compiler/Elab/Trait.vuna:984"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabConstraintDomains", ("Vuna.Compiler.Elab.Trait.elabConstraintDomains", "Vuna/Compiler/Elab/Trait.vuna:606"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabFunDef", ("Vuna.Compiler.Elab.Trait.elabFunDef", "Vuna/Compiler/Elab/Trait.vuna:1395"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabFunDefIn", ("Vuna.Compiler.Elab.Trait.elabFunDefIn", "Vuna/Compiler/Elab/Trait.vuna:1369"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabFunDefMulti", ("Vuna.Compiler.Elab.Trait.elabFunDefMulti", "Vuna/Compiler/Elab/Trait.vuna:1378"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstance", ("Vuna.Compiler.Elab.Trait.elabInstance", "Vuna/Compiler/Elab/Trait.vuna:361"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodies", ("Vuna.Compiler.Elab.Trait.elabInstanceBodies", "Vuna/Compiler/Elab/Trait.vuna:1163"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceBodiesGo", ("Vuna.Compiler.Elab.Trait.elabInstanceBodiesGo", "Vuna/Compiler/Elab/Trait.vuna:1168"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceConstrained", ("Vuna.Compiler.Elab.Trait.elabInstanceConstrained", "Vuna/Compiler/Elab/Trait.vuna:447"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethod", ("Vuna.Compiler.Elab.Trait.elabInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:847"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodIn", ("Vuna.Compiler.Elab.Trait.elabInstanceMethodIn", "Vuna/Compiler/Elab/Trait.vuna:843"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsCtx", ("Vuna.Compiler.Elab.Trait.elabInstanceMethodsCtx", "Vuna/Compiler/Elab/Trait.vuna:761"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceMethodsGo", ("Vuna.Compiler.Elab.Trait.elabInstanceMethodsGo", "Vuna/Compiler/Elab/Trait.vuna:811"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceSig", ("Vuna.Compiler.Elab.Trait.elabInstanceSig", "Vuna/Compiler/Elab/Trait.vuna:422"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstanceWithClass", ("Vuna.Compiler.Elab.Trait.elabInstanceWithClass", "Vuna/Compiler/Elab/Trait.vuna:322"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstances", ("Vuna.Compiler.Elab.Trait.elabInstances", "Vuna/Compiler/Elab/Trait.vuna:1211"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabInstancesGo", ("Vuna.Compiler.Elab.Trait.elabInstancesGo", "Vuna/Compiler/Elab/Trait.vuna:1214"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabTrait", ("Vuna.Compiler.Elab.Trait.elabTrait", "Vuna/Compiler/Elab/Trait.vuna:66"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabTraitFinal", ("Vuna.Compiler.Elab.Trait.elabTraitFinal", "Vuna/Compiler/Elab/Trait.vuna:86"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabTraitKinds", ("Vuna.Compiler.Elab.Trait.elabTraitKinds", "Vuna/Compiler/Elab/Trait.vuna:78"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabTraits", ("Vuna.Compiler.Elab.Trait.elabTraits", "Vuna/Compiler/Elab/Trait.vuna:1198"));
  ("v_Vuna_dCompiler_dElab_dTrait_delabTraitsGo", ("Vuna.Compiler.Elab.Trait.elabTraitsGo", "Vuna/Compiler/Elab/Trait.vuna:1201"));
  ("v_Vuna_dCompiler_dElab_dTrait_dexprFreeLower", ("Vuna.Compiler.Elab.Trait.exprFreeLower", "Vuna/Compiler/Elab/Trait.vuna:584"));
  ("v_Vuna_dCompiler_dElab_dTrait_dextraDefsGo", ("Vuna.Compiler.Elab.Trait.extraDefsGo", "Vuna/Compiler/Elab/Trait.vuna:1230"));
  ("v_Vuna_dCompiler_dElab_dTrait_dextraDefsOf", ("Vuna.Compiler.Elab.Trait.extraDefsOf", "Vuna/Compiler/Elab/Trait.vuna:1225"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfallbackTeleKind", ("Vuna.Compiler.Elab.Trait.fallbackTeleKind", "Vuna/Compiler/Elab/Trait.vuna:581"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfindTraitDecl", ("Vuna.Compiler.Elab.Trait.findTraitDecl", "Vuna/Compiler/Elab/Trait.vuna:735"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfindTraitMethodSpan", ("Vuna.Compiler.Elab.Trait.findTraitMethodSpan", "Vuna/Compiler/Elab/Trait.vuna:742"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethod", ("Vuna.Compiler.Elab.Trait.firstMissingInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:716"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfirstMissingInstanceMethodGo", ("Vuna.Compiler.Elab.Trait.firstMissingInstanceMethodGo", "Vuna/Compiler/Elab/Trait.vuna:719"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethod", ("Vuna.Compiler.Elab.Trait.firstUnknownInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:703"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfirstUnknownInstanceMethodGo", ("Vuna.Compiler.Elab.Trait.firstUnknownInstanceMethodGo", "Vuna/Compiler/Elab/Trait.vuna:707"));
  ("v_Vuna_dCompiler_dElab_dTrait_dflagAt", ("Vuna.Compiler.Elab.Trait.flagAt", "Vuna/Compiler/Elab/Trait.vuna:244"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfoldParamPis", ("Vuna.Compiler.Elab.Trait.foldParamPis", "Vuna/Compiler/Elab/Trait.vuna:146"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTys", ("Vuna.Compiler.Elab.Trait.foldPiFieldTys", "Vuna/Compiler/Elab/Trait.vuna:55"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfoldPiFieldTysGo", ("Vuna.Compiler.Elab.Trait.foldPiFieldTysGo", "Vuna/Compiler/Elab/Trait.vuna:58"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfoldlAddDef", ("Vuna.Compiler.Elab.Trait.foldlAddDef", "Vuna/Compiler/Elab/Trait.vuna:47"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfoldlAddInst", ("Vuna.Compiler.Elab.Trait.foldlAddInst", "Vuna/Compiler/Elab/Trait.vuna:1130"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoals", ("Vuna.Compiler.Elab.Trait.freeDictGoals", "Vuna/Compiler/Elab/Trait.vuna:964"));
  ("v_Vuna_dCompiler_dElab_dTrait_dfreeDictGoalsGo", ("Vuna.Compiler.Elab.Trait.freeDictGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:967"));
  ("v_Vuna_dCompiler_dElab_dTrait_dhasMethodClauses", ("Vuna.Compiler.Elab.Trait.hasMethodClauses", "Vuna/Compiler/Elab/Trait.vuna:725"));
  ("v_Vuna_dCompiler_dElab_dTrait_dheadTypeNameOf", ("Vuna.Compiler.Elab.Trait.headTypeNameOf", "Vuna/Compiler/Elab/Trait.vuna:270"));
  ("v_Vuna_dCompiler_dElab_dTrait_dheadTypeNamesOf", ("Vuna.Compiler.Elab.Trait.headTypeNamesOf", "Vuna/Compiler/Elab/Trait.vuna:275"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinjectAltGo", ("Vuna.Compiler.Elab.Trait.injectAltGo", "Vuna/Compiler/Elab/Trait.vuna:1095"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinjectAltGoFuel", ("Vuna.Compiler.Elab.Trait.injectAltGoFuel", "Vuna/Compiler/Elab/Trait.vuna:1098"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinjectDictGo", ("Vuna.Compiler.Elab.Trait.injectDictGo", "Vuna/Compiler/Elab/Trait.vuna:1062"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinjectDictGoFuel", ("Vuna.Compiler.Elab.Trait.injectDictGoFuel", "Vuna/Compiler/Elab/Trait.vuna:1065"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinsertArgAt", ("Vuna.Compiler.Elab.Trait.insertArgAt", "Vuna/Compiler/Elab/Trait.vuna:1120"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinsertDictCalls", ("Vuna.Compiler.Elab.Trait.insertDictCalls", "Vuna/Compiler/Elab/Trait.vuna:1059"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstArgAt", ("Vuna.Compiler.Elab.Trait.instArgAt", "Vuna/Compiler/Elab/Trait.vuna:807"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtx", ("Vuna.Compiler.Elab.Trait.instBodyCtx", "Vuna/Compiler/Elab/Trait.vuna:623"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstBodyCtxGo", ("Vuna.Compiler.Elab.Trait.instBodyCtxGo", "Vuna/Compiler/Elab/Trait.vuna:626"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstCtxLam", ("Vuna.Compiler.Elab.Trait.instCtxLam", "Vuna/Compiler/Elab/Trait.vuna:645"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstCtxLamGo", ("Vuna.Compiler.Elab.Trait.instCtxLamGo", "Vuna/Compiler/Elab/Trait.vuna:648"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstSigArgs", ("Vuna.Compiler.Elab.Trait.instSigArgs", "Vuna/Compiler/Elab/Trait.vuna:411"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstSigClass", ("Vuna.Compiler.Elab.Trait.instSigClass", "Vuna/Compiler/Elab/Trait.vuna:402"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstSigCtx", ("Vuna.Compiler.Elab.Trait.instSigCtx", "Vuna/Compiler/Elab/Trait.vuna:408"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstSigHead", ("Vuna.Compiler.Elab.Trait.instSigHead", "Vuna/Compiler/Elab/Trait.vuna:414"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstSigTele", ("Vuna.Compiler.Elab.Trait.instSigTele", "Vuna/Compiler/Elab/Trait.vuna:405"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstTeleLam", ("Vuna.Compiler.Elab.Trait.instTeleLam", "Vuna/Compiler/Elab/Trait.vuna:641"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstTypeCtx", ("Vuna.Compiler.Elab.Trait.instTypeCtx", "Vuna/Compiler/Elab/Trait.vuna:662"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstTypeOf", ("Vuna.Compiler.Elab.Trait.instTypeOf", "Vuna/Compiler/Elab/Trait.vuna:654"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstTypeTele", ("Vuna.Compiler.Elab.Trait.instTypeTele", "Vuna/Compiler/Elab/Trait.vuna:667"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstValueOf", ("Vuna.Compiler.Elab.Trait.instValueOf", "Vuna/Compiler/Elab/Trait.vuna:635"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceConstraintParts", ("Vuna.Compiler.Elab.Trait.instanceConstraintParts", "Vuna/Compiler/Elab/Trait.vuna:387"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceDefsOf", ("Vuna.Compiler.Elab.Trait.instanceDefsOf", "Vuna/Compiler/Elab/Trait.vuna:1186"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadParts", ("Vuna.Compiler.Elab.Trait.instanceHeadParts", "Vuna/Compiler/Elab/Trait.vuna:373"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTerm", ("Vuna.Compiler.Elab.Trait.instanceHeadTerm", "Vuna/Compiler/Elab/Trait.vuna:673"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceHeadTypeNames", ("Vuna.Compiler.Elab.Trait.instanceHeadTypeNames", "Vuna/Compiler/Elab/Trait.vuna:287"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceLandingOk", ("Vuna.Compiler.Elab.Trait.instanceLandingOk", "Vuna/Compiler/Elab/Trait.vuna:301"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceMono", ("Vuna.Compiler.Elab.Trait.instanceMono", "Vuna/Compiler/Elab/Trait.vuna:513"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtx", ("Vuna.Compiler.Elab.Trait.instanceTeleCtx", "Vuna/Compiler/Elab/Trait.vuna:597"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleCtxGo", ("Vuna.Compiler.Elab.Trait.instanceTeleCtxGo", "Vuna/Compiler/Elab/Trait.vuna:600"));
  ("v_Vuna_dCompiler_dElab_dTrait_dinstanceTeleMetas", ("Vuna.Compiler.Elab.Trait.instanceTeleMetas", "Vuna/Compiler/Elab/Trait.vuna:525"));
  ("v_Vuna_dCompiler_dElab_dTrait_disGlobalHeadType", ("Vuna.Compiler.Elab.Trait.isGlobalHeadType", "Vuna/Compiler/Elab/Trait.vuna:284"));
  ("v_Vuna_dCompiler_dElab_dTrait_disLowerStart", ("Vuna.Compiler.Elab.Trait.isLowerStart", "Vuna/Compiler/Elab/Trait.vuna:518"));
  ("v_Vuna_dCompiler_dElab_dTrait_dkeepOutBanned", ("Vuna.Compiler.Elab.Trait.keepOutBanned", "Vuna/Compiler/Elab/Trait.vuna:591"));
  ("v_Vuna_dCompiler_dElab_dTrait_dleadingImplicitCount", ("Vuna.Compiler.Elab.Trait.leadingImplicitCount", "Vuna/Compiler/Elab/Trait.vuna:990"));
  ("v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoals", ("Vuna.Compiler.Elab.Trait.liftFreeDictGoals", "Vuna/Compiler/Elab/Trait.vuna:1003"));
  ("v_Vuna_dCompiler_dElab_dTrait_dliftFreeDictGoalsGo", ("Vuna.Compiler.Elab.Trait.liftFreeDictGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:1018"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdx", ("Vuna.Compiler.Elab.Trait.matchCtxDictIdx", "Vuna/Compiler/Elab/Trait.vuna:873"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmatchCtxDictIdxGo", ("Vuna.Compiler.Elab.Trait.matchCtxDictIdxGo", "Vuna/Compiler/Elab/Trait.vuna:876"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmethodClausesGo", ("Vuna.Compiler.Elab.Trait.methodClausesGo", "Vuna/Compiler/Elab/Trait.vuna:831"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmethodClausesNamed", ("Vuna.Compiler.Elab.Trait.methodClausesNamed", "Vuna/Compiler/Elab/Trait.vuna:828"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmethodProjType", ("Vuna.Compiler.Elab.Trait.methodProjType", "Vuna/Compiler/Elab/Trait.vuna:182"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmethodProjZip", ("Vuna.Compiler.Elab.Trait.methodProjZip", "Vuna/Compiler/Elab/Trait.vuna:174"));
  ("v_Vuna_dCompiler_dElab_dTrait_dmethodProjections", ("Vuna.Compiler.Elab.Trait.methodProjections", "Vuna/Compiler/Elab/Trait.vuna:170"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionBody", ("Vuna.Compiler.Elab.Trait.projectionBody", "Vuna/Compiler/Elab/Trait.vuna:195"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionBodyOpaque", ("Vuna.Compiler.Elab.Trait.projectionBodyOpaque", "Vuna/Compiler/Elab/Trait.vuna:203"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionDefs", ("Vuna.Compiler.Elab.Trait.projectionDefs", "Vuna/Compiler/Elab/Trait.vuna:228"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsGo", ("Vuna.Compiler.Elab.Trait.projectionDefsGo", "Vuna/Compiler/Elab/Trait.vuna:248"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaque", ("Vuna.Compiler.Elab.Trait.projectionDefsOpaque", "Vuna/Compiler/Elab/Trait.vuna:233"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionDefsOpaqueGo", ("Vuna.Compiler.Elab.Trait.projectionDefsOpaqueGo", "Vuna/Compiler/Elab/Trait.vuna:237"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionParamLams", ("Vuna.Compiler.Elab.Trait.projectionParamLams", "Vuna/Compiler/Elab/Trait.vuna:220"));
  ("v_Vuna_dCompiler_dElab_dTrait_dprojectionParamNames", ("Vuna.Compiler.Elab.Trait.projectionParamNames", "Vuna/Compiler/Elab/Trait.vuna:224"));
  ("v_Vuna_dCompiler_dElab_dTrait_dreplaceGlobalType", ("Vuna.Compiler.Elab.Trait.replaceGlobalType", "Vuna/Compiler/Elab/Trait.vuna:1124"));
  ("v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoals", ("Vuna.Compiler.Elab.Trait.resolveRigidGoals", "Vuna/Compiler/Elab/Trait.vuna:898"));
  ("v_Vuna_dCompiler_dElab_dTrait_dresolveRigidGoalsGo", ("Vuna.Compiler.Elab.Trait.resolveRigidGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:901"));
  ("v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKind", ("Vuna.Compiler.Elab.Trait.resolveTeleKind", "Vuna/Compiler/Elab/Trait.vuna:571"));
  ("v_Vuna_dCompiler_dElab_dTrait_dresolveTeleKinds", ("Vuna.Compiler.Elab.Trait.resolveTeleKinds", "Vuna/Compiler/Elab/Trait.vuna:566"));
  ("v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpine", ("Vuna.Compiler.Elab.Trait.rewriteTaggedSpine", "Vuna/Compiler/Elab/Trait.vuna:1104"));
  ("v_Vuna_dCompiler_dElab_dTrait_drewriteTaggedSpineFuel", ("Vuna.Compiler.Elab.Trait.rewriteTaggedSpineFuel", "Vuna/Compiler/Elab/Trait.vuna:1108"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsameMethodShort", ("Vuna.Compiler.Elab.Trait.sameMethodShort", "Vuna/Compiler/Elab/Trait.vuna:696"));
  ("v_Vuna_dCompiler_dElab_dTrait_dseedKindOf", ("Vuna.Compiler.Elab.Trait.seedKindOf", "Vuna/Compiler/Elab/Trait.vuna:542"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoals", ("Vuna.Compiler.Elab.Trait.solveCtxGoals", "Vuna/Compiler/Elab/Trait.vuna:856"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsolveCtxGoalsGo", ("Vuna.Compiler.Elab.Trait.solveCtxGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:859"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMeta", ("Vuna.Compiler.Elab.Trait.solveLiftedMeta", "Vuna/Compiler/Elab/Trait.vuna:997"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsolveLiftedMetas", ("Vuna.Compiler.Elab.Trait.solveLiftedMetas", "Vuna/Compiler/Elab/Trait.vuna:1051"));
  ("v_Vuna_dCompiler_dElab_dTrait_dspanOfName", ("Vuna.Compiler.Elab.Trait.spanOfName", "Vuna/Compiler/Elab/Trait.vuna:1237"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstExtraDictMetas", ("Vuna.Compiler.Elab.Trait.substExtraDictMetas", "Vuna/Compiler/Elab/Trait.vuna:1046"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstInstParams", ("Vuna.Compiler.Elab.Trait.substInstParams", "Vuna/Compiler/Elab/Trait.vuna:778"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsAlt", ("Vuna.Compiler.Elab.Trait.substInstParamsAlt", "Vuna/Compiler/Elab/Trait.vuna:803"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstInstParamsGo", ("Vuna.Compiler.Elab.Trait.substInstParamsGo", "Vuna/Compiler/Elab/Trait.vuna:781"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTerm", ("Vuna.Compiler.Elab.Trait.substMetaTerm", "Vuna/Compiler/Elab/Trait.vuna:919"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermAlt", ("Vuna.Compiler.Elab.Trait.substMetaTermAlt", "Vuna/Compiler/Elab/Trait.vuna:942"));
  ("v_Vuna_dCompiler_dElab_dTrait_dsubstMetaTermGo", ("Vuna.Compiler.Elab.Trait.substMetaTermGo", "Vuna/Compiler/Elab/Trait.vuna:922"));
  ("v_Vuna_dCompiler_dElab_dTrait_dteleMetasInit", ("Vuna.Compiler.Elab.Trait.teleMetasInit", "Vuna/Compiler/Elab/Trait.vuna:529"));
  ("v_Vuna_dCompiler_dElab_dTrait_dtraitKindExplicit", ("Vuna.Compiler.Elab.Trait.traitKindExplicit", "Vuna/Compiler/Elab/Trait.vuna:133"));
  ("v_Vuna_dCompiler_dElab_dTrait_dtraitKindInfer", ("Vuna.Compiler.Elab.Trait.traitKindInfer", "Vuna/Compiler/Elab/Trait.vuna:140"));
  ("v_Vuna_dCompiler_dElab_dTrait_dtraitMethodPairs", ("Vuna.Compiler.Elab.Trait.traitMethodPairs", "Vuna/Compiler/Elab/Trait.vuna:159"));
  ("v_Vuna_dCompiler_dElab_dTrait_dtraitMethodSpanOf", ("Vuna.Compiler.Elab.Trait.traitMethodSpanOf", "Vuna/Compiler/Elab/Trait.vuna:747"));
  ("v_Vuna_dCompiler_dElab_dTrait_dtraitParamKinds", ("Vuna.Compiler.Elab.Trait.traitParamKinds", "Vuna/Compiler/Elab/Trait.vuna:127"));
  ("v_Vuna_dCompiler_dElab_dTrait_dtraitParamNames", ("Vuna.Compiler.Elab.Trait.traitParamNames", "Vuna/Compiler/Elab/Trait.vuna:123"));
  ("v_Vuna_dCompiler_dElab_dTrait_dzipClassFields", ("Vuna.Compiler.Elab.Trait.zipClassFields", "Vuna/Compiler/Elab/Trait.vuna:766"));
  ("v_Vuna_dCompiler_dElab_dTrait_dzipMethodFields", ("Vuna.Compiler.Elab.Trait.zipMethodFields", "Vuna/Compiler/Elab/Trait.vuna:769"));
  ("v_Vuna_dCompiler_dElab_dTypes_dallBucketsMatch", ("Vuna.Compiler.Elab.Types.allBucketsMatch", "Vuna/Compiler/Elab/Types.vuna:397"));
  ("v_Vuna_dCompiler_dElab_dTypes_dbucketCount", ("Vuna.Compiler.Elab.Types.bucketCount", "Vuna/Compiler/Elab/Types.vuna:392"));
  ("v_Vuna_dCompiler_dElab_dTypes_dcsEmpty", ("Vuna.Compiler.Elab.Types.csEmpty", "Vuna/Compiler/Elab/Types.vuna:269"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctorTblOfDatas", ("Vuna.Compiler.Elab.Types.ctorTblOfDatas", "Vuna/Compiler/Elab/Types.vuna:582"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxBind", ("Vuna.Compiler.Elab.Types.ctxBind", "Vuna/Compiler/Elab/Types.vuna:683"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxBindValue", ("Vuna.Compiler.Elab.Types.ctxBindValue", "Vuna/Compiler/Elab/Types.vuna:688"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxDepth", ("Vuna.Compiler.Elab.Types.ctxDepth", "Vuna/Compiler/Elab/Types.vuna:680"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxEnv", ("Vuna.Compiler.Elab.Types.ctxEnv", "Vuna/Compiler/Elab/Types.vuna:717"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxEnvAt", ("Vuna.Compiler.Elab.Types.ctxEnvAt", "Vuna/Compiler/Elab/Types.vuna:710"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxEnvRefined", ("Vuna.Compiler.Elab.Types.ctxEnvRefined", "Vuna/Compiler/Elab/Types.vuna:721"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxLookup", ("Vuna.Compiler.Elab.Types.ctxLookup", "Vuna/Compiler/Elab/Types.vuna:701"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxLookupAt", ("Vuna.Compiler.Elab.Types.ctxLookupAt", "Vuna/Compiler/Elab/Types.vuna:696"));
  ("v_Vuna_dCompiler_dElab_dTypes_dctxRefine", ("Vuna.Compiler.Elab.Types.ctxRefine", "Vuna/Compiler/Elab/Types.vuna:693"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddataCtorPairs", ("Vuna.Compiler.Elab.Types.dataCtorPairs", "Vuna/Compiler/Elab/Types.vuna:586"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddatasHaveLinear", ("Vuna.Compiler.Elab.Types.datasHaveLinear", "Vuna/Compiler/Elab/Types.vuna:659"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtClassName", ("Vuna.Compiler.Elab.Types.dtClassName", "Vuna/Compiler/Elab/Types.vuna:158"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily", ("Vuna.Compiler.Elab.Types.dtCtorFamily", "Vuna/Compiler/Elab/Types.vuna:73"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtCtorName", ("Vuna.Compiler.Elab.Types.dtCtorName", "Vuna/Compiler/Elab/Types.vuna:70"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtCtorTelescope", ("Vuna.Compiler.Elab.Types.dtCtorTelescope", "Vuna/Compiler/Elab/Types.vuna:76"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtCtorType", ("Vuna.Compiler.Elab.Types.dtCtorType", "Vuna/Compiler/Elab/Types.vuna:79"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors", ("Vuna.Compiler.Elab.Types.dtDataCtors", "Vuna/Compiler/Elab/Types.vuna:112"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataFields", ("Vuna.Compiler.Elab.Types.dtDataFields", "Vuna/Compiler/Elab/Types.vuna:129"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataIsRecord", ("Vuna.Compiler.Elab.Types.dtDataIsRecord", "Vuna/Compiler/Elab/Types.vuna:133"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataKind", ("Vuna.Compiler.Elab.Types.dtDataKind", "Vuna/Compiler/Elab/Types.vuna:115"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataLinear", ("Vuna.Compiler.Elab.Types.dtDataLinear", "Vuna/Compiler/Elab/Types.vuna:135"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataName", ("Vuna.Compiler.Elab.Types.dtDataName", "Vuna/Compiler/Elab/Types.vuna:109"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataRepr", ("Vuna.Compiler.Elab.Types.dtDataRepr", "Vuna/Compiler/Elab/Types.vuna:125"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDataViaClasses", ("Vuna.Compiler.Elab.Types.dtDataViaClasses", "Vuna/Compiler/Elab/Types.vuna:119"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDefBody", ("Vuna.Compiler.Elab.Types.dtDefBody", "Vuna/Compiler/Elab/Types.vuna:39"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern", ("Vuna.Compiler.Elab.Types.dtDefExtern", "Vuna/Compiler/Elab/Types.vuna:51"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDefHasBody", ("Vuna.Compiler.Elab.Types.dtDefHasBody", "Vuna/Compiler/Elab/Types.vuna:45"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDefName", ("Vuna.Compiler.Elab.Types.dtDefName", "Vuna/Compiler/Elab/Types.vuna:29"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan", ("Vuna.Compiler.Elab.Types.dtDefSpan", "Vuna/Compiler/Elab/Types.vuna:56"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtDefType", ("Vuna.Compiler.Elab.Types.dtDefType", "Vuna/Compiler/Elab/Types.vuna:34"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtInstName", ("Vuna.Compiler.Elab.Types.dtInstName", "Vuna/Compiler/Elab/Types.vuna:171"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgClasses", ("Vuna.Compiler.Elab.Types.dtProgClasses", "Vuna/Compiler/Elab/Types.vuna:812"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgDatas", ("Vuna.Compiler.Elab.Types.dtProgDatas", "Vuna/Compiler/Elab/Types.vuna:794"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgDefs", ("Vuna.Compiler.Elab.Types.dtProgDefs", "Vuna/Compiler/Elab/Types.vuna:797"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgGlobals", ("Vuna.Compiler.Elab.Types.dtProgGlobals", "Vuna/Compiler/Elab/Types.vuna:806"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgGoals", ("Vuna.Compiler.Elab.Types.dtProgGoals", "Vuna/Compiler/Elab/Types.vuna:800"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgInsts", ("Vuna.Compiler.Elab.Types.dtProgInsts", "Vuna/Compiler/Elab/Types.vuna:809"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgSols", ("Vuna.Compiler.Elab.Types.dtProgSols", "Vuna/Compiler/Elab/Types.vuna:803"));
  ("v_Vuna_dCompiler_dElab_dTypes_ddtProgWarnings", ("Vuna.Compiler.Elab.Types.dtProgWarnings", "Vuna/Compiler/Elab/Types.vuna:816"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddClass", ("Vuna.Compiler.Elab.Types.ecAddClass", "Vuna/Compiler/Elab/Types.vuna:431"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddConstraint", ("Vuna.Compiler.Elab.Types.ecAddConstraint", "Vuna/Compiler/Elab/Types.vuna:460"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddData", ("Vuna.Compiler.Elab.Types.ecAddData", "Vuna/Compiler/Elab/Types.vuna:575"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddDef", ("Vuna.Compiler.Elab.Types.ecAddDef", "Vuna/Compiler/Elab/Types.vuna:560"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddError", ("Vuna.Compiler.Elab.Types.ecAddError", "Vuna/Compiler/Elab/Types.vuna:654"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddGoal", ("Vuna.Compiler.Elab.Types.ecAddGoal", "Vuna/Compiler/Elab/Types.vuna:414"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddInst", ("Vuna.Compiler.Elab.Types.ecAddInst", "Vuna/Compiler/Elab/Types.vuna:419"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddInstRaw", ("Vuna.Compiler.Elab.Types.ecAddInstRaw", "Vuna/Compiler/Elab/Types.vuna:426"));
  ("v_Vuna_dCompiler_dElab_dTypes_decAddWarning", ("Vuna.Compiler.Elab.Types.ecAddWarning", "Vuna/Compiler/Elab/Types.vuna:637"));
  ("v_Vuna_dCompiler_dElab_dTypes_decBump", ("Vuna.Compiler.Elab.Types.ecBump", "Vuna/Compiler/Elab/Types.vuna:644"));
  ("v_Vuna_dCompiler_dElab_dTypes_decClasses", ("Vuna.Compiler.Elab.Types.ecClasses", "Vuna/Compiler/Elab/Types.vuna:410"));
  ("v_Vuna_dCompiler_dElab_dTypes_decConstraints", ("Vuna.Compiler.Elab.Types.ecConstraints", "Vuna/Compiler/Elab/Types.vuna:438"));
  ("v_Vuna_dCompiler_dElab_dTypes_decCounters", ("Vuna.Compiler.Elab.Types.ecCounters", "Vuna/Compiler/Elab/Types.vuna:641"));
  ("v_Vuna_dCompiler_dElab_dTypes_decCtorIndexComplete", ("Vuna.Compiler.Elab.Types.ecCtorIndexComplete", "Vuna/Compiler/Elab/Types.vuna:527"));
  ("v_Vuna_dCompiler_dElab_dTypes_decDatas", ("Vuna.Compiler.Elab.Types.ecDatas", "Vuna/Compiler/Elab/Types.vuna:348"));
  ("v_Vuna_dCompiler_dElab_dTypes_decDefTbl", ("Vuna.Compiler.Elab.Types.ecDefTbl", "Vuna/Compiler/Elab/Types.vuna:333"));
  ("v_Vuna_dCompiler_dElab_dTypes_decDefs", ("Vuna.Compiler.Elab.Types.ecDefs", "Vuna/Compiler/Elab/Types.vuna:328"));
  ("v_Vuna_dCompiler_dElab_dTypes_decDepthTbl", ("Vuna.Compiler.Elab.Types.ecDepthTbl", "Vuna/Compiler/Elab/Types.vuna:352"));
  ("v_Vuna_dCompiler_dElab_dTypes_decDictPassIdle", ("Vuna.Compiler.Elab.Types.ecDictPassIdle", "Vuna/Compiler/Elab/Types.vuna:537"));
  ("v_Vuna_dCompiler_dElab_dTypes_decEmpty", ("Vuna.Compiler.Elab.Types.ecEmpty", "Vuna/Compiler/Elab/Types.vuna:479"));
  ("v_Vuna_dCompiler_dElab_dTypes_decErrors", ("Vuna.Compiler.Elab.Types.ecErrors", "Vuna/Compiler/Elab/Types.vuna:650"));
  ("v_Vuna_dCompiler_dElab_dTypes_decGlobalsTbl", ("Vuna.Compiler.Elab.Types.ecGlobalsTbl", "Vuna/Compiler/Elab/Types.vuna:339"));
  ("v_Vuna_dCompiler_dElab_dTypes_decGoals", ("Vuna.Compiler.Elab.Types.ecGoals", "Vuna/Compiler/Elab/Types.vuna:364"));
  ("v_Vuna_dCompiler_dElab_dTypes_decHasLinear", ("Vuna.Compiler.Elab.Types.ecHasLinear", "Vuna/Compiler/Elab/Types.vuna:597"));
  ("v_Vuna_dCompiler_dElab_dTypes_decInsts", ("Vuna.Compiler.Elab.Types.ecInsts", "Vuna/Compiler/Elab/Types.vuna:368"));
  ("v_Vuna_dCompiler_dElab_dTypes_decInstsAudit", ("Vuna.Compiler.Elab.Types.ecInstsAudit", "Vuna/Compiler/Elab/Types.vuna:384"));
  ("v_Vuna_dCompiler_dElab_dTypes_decInstsFamily", ("Vuna.Compiler.Elab.Types.ecInstsFamily", "Vuna/Compiler/Elab/Types.vuna:374"));
  ("v_Vuna_dCompiler_dElab_dTypes_decMetaSpans", ("Vuna.Compiler.Elab.Types.ecMetaSpans", "Vuna/Compiler/Elab/Types.vuna:603"));
  ("v_Vuna_dCompiler_dElab_dTypes_decNext", ("Vuna.Compiler.Elab.Types.ecNext", "Vuna/Compiler/Elab/Types.vuna:319"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPending", ("Vuna.Compiler.Elab.Types.ecPending", "Vuna/Compiler/Elab/Types.vuna:449"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutClausesTbl", ("Vuna.Compiler.Elab.Types.ecPutClausesTbl", "Vuna/Compiler/Elab/Types.vuna:315"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutConstraints", ("Vuna.Compiler.Elab.Types.ecPutConstraints", "Vuna/Compiler/Elab/Types.vuna:443"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutCtorIndexComplete", ("Vuna.Compiler.Elab.Types.ecPutCtorIndexComplete", "Vuna/Compiler/Elab/Types.vuna:531"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutCtorTbl", ("Vuna.Compiler.Elab.Types.ecPutCtorTbl", "Vuna/Compiler/Elab/Types.vuna:589"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutDefTbl", ("Vuna.Compiler.Elab.Types.ecPutDefTbl", "Vuna/Compiler/Elab/Types.vuna:824"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutGlobalsTbl", ("Vuna.Compiler.Elab.Types.ecPutGlobalsTbl", "Vuna/Compiler/Elab/Types.vuna:343"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutMetaSpans", ("Vuna.Compiler.Elab.Types.ecPutMetaSpans", "Vuna/Compiler/Elab/Types.vuna:608"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutNext", ("Vuna.Compiler.Elab.Types.ecPutNext", "Vuna/Compiler/Elab/Types.vuna:310"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutPassMarker", ("Vuna.Compiler.Elab.Types.ecPutPassMarker", "Vuna/Compiler/Elab/Types.vuna:521"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutPending", ("Vuna.Compiler.Elab.Types.ecPutPending", "Vuna/Compiler/Elab/Types.vuna:454"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutSols", ("Vuna.Compiler.Elab.Types.ecPutSols", "Vuna/Compiler/Elab/Types.vuna:497"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutSolsCount", ("Vuna.Compiler.Elab.Types.ecPutSolsCount", "Vuna/Compiler/Elab/Types.vuna:510"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutSolsRaw", ("Vuna.Compiler.Elab.Types.ecPutSolsRaw", "Vuna/Compiler/Elab/Types.vuna:515"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutUseSpans", ("Vuna.Compiler.Elab.Types.ecPutUseSpans", "Vuna/Compiler/Elab/Types.vuna:619"));
  ("v_Vuna_dCompiler_dElab_dTypes_decPutWarnings", ("Vuna.Compiler.Elab.Types.ecPutWarnings", "Vuna/Compiler/Elab/Types.vuna:631"));
  ("v_Vuna_dCompiler_dElab_dTypes_decRecordTried", ("Vuna.Compiler.Elab.Types.ecRecordTried", "Vuna/Compiler/Elab/Types.vuna:473"));
  ("v_Vuna_dCompiler_dElab_dTypes_decRemoveDefTbl", ("Vuna.Compiler.Elab.Types.ecRemoveDefTbl", "Vuna/Compiler/Elab/Types.vuna:569"));
  ("v_Vuna_dCompiler_dElab_dTypes_decSetGlobalsComplete", ("Vuna.Compiler.Elab.Types.ecSetGlobalsComplete", "Vuna/Compiler/Elab/Types.vuna:359"));
  ("v_Vuna_dCompiler_dElab_dTypes_decSolTbl", ("Vuna.Compiler.Elab.Types.ecSolTbl", "Vuna/Compiler/Elab/Types.vuna:487"));
  ("v_Vuna_dCompiler_dElab_dTypes_decSols", ("Vuna.Compiler.Elab.Types.ecSols", "Vuna/Compiler/Elab/Types.vuna:323"));
  ("v_Vuna_dCompiler_dElab_dTypes_decSolsCountOf", ("Vuna.Compiler.Elab.Types.ecSolsCountOf", "Vuna/Compiler/Elab/Types.vuna:506"));
  ("v_Vuna_dCompiler_dElab_dTypes_decSolsP", ("Vuna.Compiler.Elab.Types.ecSolsP", "Vuna/Compiler/Elab/Types.vuna:495"));
  ("v_Vuna_dCompiler_dElab_dTypes_decTriedAt", ("Vuna.Compiler.Elab.Types.ecTriedAt", "Vuna/Compiler/Elab/Types.vuna:468"));
  ("v_Vuna_dCompiler_dElab_dTypes_decUseSpans", ("Vuna.Compiler.Elab.Types.ecUseSpans", "Vuna/Compiler/Elab/Types.vuna:614"));
  ("v_Vuna_dCompiler_dElab_dTypes_decWarnings", ("Vuna.Compiler.Elab.Types.ecWarnings", "Vuna/Compiler/Elab/Types.vuna:626"));
  ("v_Vuna_dCompiler_dElab_dTypes_demptyCtx", ("Vuna.Compiler.Elab.Types.emptyCtx", "Vuna/Compiler/Elab/Types.vuna:759"));
  ("v_Vuna_dCompiler_dElab_dTypes_derrAt", ("Vuna.Compiler.Elab.Types.errAt", "Vuna/Compiler/Elab/Types.vuna:765"));
  ("v_Vuna_dCompiler_dElab_dTypes_devalCtx", ("Vuna.Compiler.Elab.Types.evalCtx", "Vuna/Compiler/Elab/Types.vuna:751"));
  ("v_Vuna_dCompiler_dElab_dTypes_dflattenTaggedApp", ("Vuna.Compiler.Elab.Types.flattenTaggedApp", "Vuna/Compiler/Elab/Types.vuna:177"));
  ("v_Vuna_dCompiler_dElab_dTypes_dforceVal", ("Vuna.Compiler.Elab.Types.forceVal", "Vuna/Compiler/Elab/Types.vuna:774"));
  ("v_Vuna_dCompiler_dElab_dTypes_dhasInstName", ("Vuna.Compiler.Elab.Types.hasInstName", "Vuna/Compiler/Elab/Types.vuna:422"));
  ("v_Vuna_dCompiler_dElab_dTypes_dinstFamilyOf", ("Vuna.Compiler.Elab.Types.instFamilyOf", "Vuna/Compiler/Elab/Types.vuna:198"));
  ("v_Vuna_dCompiler_dElab_dTypes_dinstNamesEq", ("Vuna.Compiler.Elab.Types.instNamesEq", "Vuna/Compiler/Elab/Types.vuna:404"));
  ("v_Vuna_dCompiler_dElab_dTypes_dinstStoreEmpty", ("Vuna.Compiler.Elab.Types.instStoreEmpty", "Vuna/Compiler/Elab/Types.vuna:204"));
  ("v_Vuna_dCompiler_dElab_dTypes_dinstStoreFamily", ("Vuna.Compiler.Elab.Types.instStoreFamily", "Vuna/Compiler/Elab/Types.vuna:226"));
  ("v_Vuna_dCompiler_dElab_dTypes_dinstStoreOf", ("Vuna.Compiler.Elab.Types.instStoreOf", "Vuna/Compiler/Elab/Types.vuna:209"));
  ("v_Vuna_dCompiler_dElab_dTypes_dinstStorePush", ("Vuna.Compiler.Elab.Types.instStorePush", "Vuna/Compiler/Elab/Types.vuna:214"));
  ("v_Vuna_dCompiler_dElab_dTypes_dmemDataNameIn", ("Vuna.Compiler.Elab.Types.memDataNameIn", "Vuna/Compiler/Elab/Types.vuna:553"));
  ("v_Vuna_dCompiler_dElab_dTypes_dnewMeta", ("Vuna.Compiler.Elab.Types.newMeta", "Vuna/Compiler/Elab/Types.vuna:769"));
  ("v_Vuna_dCompiler_dElab_dTypes_dprefixUntilId", ("Vuna.Compiler.Elab.Types.prefixUntilId", "Vuna/Compiler/Elab/Types.vuna:547"));
  ("v_Vuna_dCompiler_dElab_dTypes_drefineLookup", ("Vuna.Compiler.Elab.Types.refineLookup", "Vuna/Compiler/Elab/Types.vuna:746"));
  ("v_Vuna_dCompiler_dElab_dTypes_drefineValue", ("Vuna.Compiler.Elab.Types.refineValue", "Vuna/Compiler/Elab/Types.vuna:726"));
  ("v_Vuna_dCompiler_dElab_dTypes_drefinedEnv", ("Vuna.Compiler.Elab.Types.refinedEnv", "Vuna/Compiler/Elab/Types.vuna:705"));
  ("v_Vuna_dCompiler_dElab_dTypes_dsolsDelta", ("Vuna.Compiler.Elab.Types.solsDelta", "Vuna/Compiler/Elab/Types.vuna:543"));
  ("v_Vuna_dCompiler_dElab_dTypes_dsolsToTbl", ("Vuna.Compiler.Elab.Types.solsToTbl", "Vuna/Compiler/Elab/Types.vuna:821"));
  ("v_Vuna_dCompiler_dElab_dTypes_dvarTypeValue", ("Vuna.Compiler.Elab.Types.varTypeValue", "Vuna/Compiler/Elab/Types.vuna:756"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapAltsFuel", ("Vuna.Compiler.Elab.Usage.capAltsFuel", "Vuna/Compiler/Elab/Usage.vuna:293"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapArgsFuel", ("Vuna.Compiler.Elab.Usage.capArgsFuel", "Vuna/Compiler/Elab/Usage.vuna:282"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapArgsGo", ("Vuna.Compiler.Elab.Usage.capArgsGo", "Vuna/Compiler/Elab/Usage.vuna:285"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapCheck", ("Vuna.Compiler.Elab.Usage.capCheck", "Vuna/Compiler/Elab/Usage.vuna:233"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuel", ("Vuna.Compiler.Elab.Usage.capCheckFuel", "Vuna/Compiler/Elab/Usage.vuna:248"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelFor", ("Vuna.Compiler.Elab.Usage.capCheckFuelFor", "Vuna/Compiler/Elab/Usage.vuna:239"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcapCheckFuelMax", ("Vuna.Compiler.Elab.Usage.capCheckFuelMax", "Vuna/Compiler/Elab/Usage.vuna:245"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckAltBinders", ("Vuna.Compiler.Elab.Usage.checkAltBinders", "Vuna/Compiler/Elab/Usage.vuna:113"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckAltBindersGo", ("Vuna.Compiler.Elab.Usage.checkAltBindersGo", "Vuna/Compiler/Elab/Usage.vuna:116"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckAlts", ("Vuna.Compiler.Elab.Usage.checkAlts", "Vuna/Compiler/Elab/Usage.vuna:185"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckAltsGo", ("Vuna.Compiler.Elab.Usage.checkAltsGo", "Vuna/Compiler/Elab/Usage.vuna:188"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckArgs", ("Vuna.Compiler.Elab.Usage.checkArgs", "Vuna/Compiler/Elab/Usage.vuna:175"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckArgsGo", ("Vuna.Compiler.Elab.Usage.checkArgsGo", "Vuna/Compiler/Elab/Usage.vuna:178"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckBinderRig", ("Vuna.Compiler.Elab.Usage.checkBinderRig", "Vuna/Compiler/Elab/Usage.vuna:74"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckDefCapture", ("Vuna.Compiler.Elab.Usage.checkDefCapture", "Vuna/Compiler/Elab/Usage.vuna:308"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckDefUsage", ("Vuna.Compiler.Elab.Usage.checkDefUsage", "Vuna/Compiler/Elab/Usage.vuna:211"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckLamBinder", ("Vuna.Compiler.Elab.Usage.checkLamBinder", "Vuna/Compiler/Elab/Usage.vuna:90"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsage", ("Vuna.Compiler.Elab.Usage.checkProgramUsage", "Vuna/Compiler/Elab/Usage.vuna:317"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckProgramUsageGo", ("Vuna.Compiler.Elab.Usage.checkProgramUsageGo", "Vuna/Compiler/Elab/Usage.vuna:320"));
  ("v_Vuna_dCompiler_dElab_dUsage_dcheckTerm", ("Vuna.Compiler.Elab.Usage.checkTerm", "Vuna/Compiler/Elab/Usage.vuna:135"));
  ("v_Vuna_dCompiler_dElab_dUsage_dctorFamilyLinear", ("Vuna.Compiler.Elab.Usage.ctorFamilyLinear", "Vuna/Compiler/Elab/Usage.vuna:300"));
  ("v_Vuna_dCompiler_dElab_dUsage_ddefSpanOf", ("Vuna.Compiler.Elab.Usage.defSpanOf", "Vuna/Compiler/Elab/Usage.vuna:330"));
  ("v_Vuna_dCompiler_dElab_dUsage_disRigZero", ("Vuna.Compiler.Elab.Usage.isRigZero", "Vuna/Compiler/Elab/Usage.vuna:205"));
  ("v_Vuna_dCompiler_dElab_dUsage_disTypeForming", ("Vuna.Compiler.Elab.Usage.isTypeForming", "Vuna/Compiler/Elab/Usage.vuna:28"));
  ("v_Vuna_dCompiler_dElab_dUsage_disTypeFormingFuel", ("Vuna.Compiler.Elab.Usage.isTypeFormingFuel", "Vuna/Compiler/Elab/Usage.vuna:31"));
  ("v_Vuna_dCompiler_dElab_dUsage_disTypeLevelDef", ("Vuna.Compiler.Elab.Usage.isTypeLevelDef", "Vuna/Compiler/Elab/Usage.vuna:311"));
  ("v_Vuna_dCompiler_dElab_dUsage_drecordUseSpan", ("Vuna.Compiler.Elab.Usage.recordUseSpan", "Vuna/Compiler/Elab/Usage.vuna:352"));
  ("v_Vuna_dCompiler_dElab_dUsage_dresetUseSpans", ("Vuna.Compiler.Elab.Usage.resetUseSpans", "Vuna/Compiler/Elab/Usage.vuna:348"));
  ("v_Vuna_dCompiler_dElab_dUsage_dshadowedByRuntime", ("Vuna.Compiler.Elab.Usage.shadowedByRuntime", "Vuna/Compiler/Elab/Usage.vuna:106"));
  ("v_Vuna_dCompiler_dElab_dUsage_duAdd", ("Vuna.Compiler.Elab.Usage.uAdd", "Vuna/Compiler/Elab/Usage.vuna:53"));
  ("v_Vuna_dCompiler_dElab_dUsage_duDrop", ("Vuna.Compiler.Elab.Usage.uDrop", "Vuna/Compiler/Elab/Usage.vuna:66"));
  ("v_Vuna_dCompiler_dElab_dUsage_duJoin", ("Vuna.Compiler.Elab.Usage.uJoin", "Vuna/Compiler/Elab/Usage.vuna:61"));
  ("v_Vuna_dCompiler_dElab_dUsage_duScale", ("Vuna.Compiler.Elab.Usage.uScale", "Vuna/Compiler/Elab/Usage.vuna:58"));
  ("v_Vuna_dCompiler_dElab_dUsage_duVarAt", ("Vuna.Compiler.Elab.Usage.uVarAt", "Vuna/Compiler/Elab/Usage.vuna:46"));
  ("v_Vuna_dCompiler_dElab_dUsage_duVarAtGo", ("Vuna.Compiler.Elab.Usage.uVarAtGo", "Vuna/Compiler/Elab/Usage.vuna:49"));
  ("v_Vuna_dCompiler_dElab_dUsage_duZeroOf", ("Vuna.Compiler.Elab.Usage.uZeroOf", "Vuna/Compiler/Elab/Usage.vuna:43"));
  ("v_Vuna_dCompiler_dElab_dUsage_dusesOf", ("Vuna.Compiler.Elab.Usage.usesOf", "Vuna/Compiler/Elab/Usage.vuna:356"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwarnAt", ("Vuna.Compiler.Elab.Usage.warnAt", "Vuna/Compiler/Elab/Usage.vuna:374"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwarnAt0", ("Vuna.Compiler.Elab.Usage.warnAt0", "Vuna/Compiler/Elab/Usage.vuna:378"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwarnAt0Mod", ("Vuna.Compiler.Elab.Usage.warnAt0Mod", "Vuna/Compiler/Elab/Usage.vuna:390"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwarnAt1", ("Vuna.Compiler.Elab.Usage.warnAt1", "Vuna/Compiler/Elab/Usage.vuna:382"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwarnAt1Mod", ("Vuna.Compiler.Elab.Usage.warnAt1Mod", "Vuna/Compiler/Elab/Usage.vuna:386"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwarnUnusedBinder", ("Vuna.Compiler.Elab.Usage.warnUnusedBinder", "Vuna/Compiler/Elab/Usage.vuna:337"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwithUseFields", ("Vuna.Compiler.Elab.Usage.withUseFields", "Vuna/Compiler/Elab/Usage.vuna:360"));
  ("v_Vuna_dCompiler_dElab_dUsage_dwithUseSpans", ("Vuna.Compiler.Elab.Usage.withUseSpans", "Vuna/Compiler/Elab/Usage.vuna:364"));
  ("v_Vuna_dCompiler_dFrontend_dAst_d_udeclCtors", ("Vuna.Compiler.Frontend.Ast._declCtors", "Vuna/Compiler/Frontend/Ast.vuna:387"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dappAtSyntax", ("Vuna.Compiler.Frontend.Ast.appAtSyntax", "Vuna/Compiler/Frontend/Ast.vuna:566"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dclausesFor", ("Vuna.Compiler.Frontend.Ast.clausesFor", "Vuna/Compiler/Frontend/Ast.vuna:315"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dcollectClauses", ("Vuna.Compiler.Frontend.Ast.collectClauses", "Vuna/Compiler/Frontend/Ast.vuna:308"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorArity", ("Vuna.Compiler.Frontend.Ast.ctorArity", "Vuna/Compiler/Frontend/Ast.vuna:354"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorDisplayName", ("Vuna.Compiler.Frontend.Ast.ctorDisplayName", "Vuna/Compiler/Frontend/Ast.vuna:335"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorName", ("Vuna.Compiler.Frontend.Ast.ctorName", "Vuna/Compiler/Frontend/Ast.vuna:323"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorShortName", ("Vuna.Compiler.Frontend.Ast.ctorShortName", "Vuna/Compiler/Frontend/Ast.vuna:329"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorSpan", ("Vuna.Compiler.Frontend.Ast.ctorSpan", "Vuna/Compiler/Frontend/Ast.vuna:278"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorType", ("Vuna.Compiler.Frontend.Ast.ctorType", "Vuna/Compiler/Frontend/Ast.vuna:342"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dctorsOf", ("Vuna.Compiler.Frontend.Ast.ctorsOf", "Vuna/Compiler/Frontend/Ast.vuna:393"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddeclAllNames", ("Vuna.Compiler.Frontend.Ast.declAllNames", "Vuna/Compiler/Frontend/Ast.vuna:380"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddeclDerivings", ("Vuna.Compiler.Frontend.Ast.declDerivings", "Vuna/Compiler/Frontend/Ast.vuna:405"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddeclNames", ("Vuna.Compiler.Frontend.Ast.declNames", "Vuna/Compiler/Frontend/Ast.vuna:364"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddeclSpan", ("Vuna.Compiler.Frontend.Ast.declSpan", "Vuna/Compiler/Frontend/Ast.vuna:268"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddeclTypeNames", ("Vuna.Compiler.Frontend.Ast.declTypeNames", "Vuna/Compiler/Frontend/Ast.vuna:396"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxName", ("Vuna.Compiler.Frontend.Ast.doBindSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:616"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoBindSyntaxPrefix", ("Vuna.Compiler.Frontend.Ast.doBindSyntaxPrefix", "Vuna/Compiler/Frontend/Ast.vuna:608"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxName", ("Vuna.Compiler.Frontend.Ast.doIgnoreSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:620"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoIgnoreSyntaxPrefix", ("Vuna.Compiler.Frontend.Ast.doIgnoreSyntaxPrefix", "Vuna/Compiler/Frontend/Ast.vuna:612"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoStmtExpr", ("Vuna.Compiler.Frontend.Ast.doStmtExpr", "Vuna/Compiler/Frontend/Ast.vuna:264"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoStmtSpan", ("Vuna.Compiler.Frontend.Ast.doStmtSpan", "Vuna/Compiler/Frontend/Ast.vuna:260"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddoSyntaxCanonical", ("Vuna.Compiler.Frontend.Ast.doSyntaxCanonical", "Vuna/Compiler/Frontend/Ast.vuna:633"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddropNChars", ("Vuna.Compiler.Frontend.Ast.dropNChars", "Vuna/Compiler/Frontend/Ast.vuna:447"));
  ("v_Vuna_dCompiler_dFrontend_dAst_ddropNamePrefix", ("Vuna.Compiler.Frontend.Ast.dropNamePrefix", "Vuna/Compiler/Frontend/Ast.vuna:454"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dexportItemSpan", ("Vuna.Compiler.Frontend.Ast.exportItemSpan", "Vuna/Compiler/Frontend/Ast.vuna:302"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dexportSpecName", ("Vuna.Compiler.Frontend.Ast.exportSpecName", "Vuna/Compiler/Frontend/Ast.vuna:178"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dexportSpecSpan", ("Vuna.Compiler.Frontend.Ast.exportSpecSpan", "Vuna/Compiler/Frontend/Ast.vuna:182"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dexprSpan", ("Vuna.Compiler.Frontend.Ast.exprSpan", "Vuna/Compiler/Frontend/Ast.vuna:235"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dfieldName", ("Vuna.Compiler.Frontend.Ast.fieldName", "Vuna/Compiler/Frontend/Ast.vuna:284"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dfieldSpan", ("Vuna.Compiler.Frontend.Ast.fieldSpan", "Vuna/Compiler/Frontend/Ast.vuna:281"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dfieldType", ("Vuna.Compiler.Frontend.Ast.fieldType", "Vuna/Compiler/Frontend/Ast.vuna:287"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dfixitySpan", ("Vuna.Compiler.Frontend.Ast.fixitySpan", "Vuna/Compiler/Frontend/Ast.vuna:119"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dfunArity", ("Vuna.Compiler.Frontend.Ast.funArity", "Vuna/Compiler/Frontend/Ast.vuna:318"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dhandleNoRetSyntax", ("Vuna.Compiler.Frontend.Ast.handleNoRetSyntax", "Vuna/Compiler/Frontend/Ast.vuna:545"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dhandleSyntax", ("Vuna.Compiler.Frontend.Ast.handleSyntax", "Vuna/Compiler/Frontend/Ast.vuna:537"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dholeNameOf", ("Vuna.Compiler.Frontend.Ast.holeNameOf", "Vuna/Compiler/Frontend/Ast.vuna:425"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dholeNamed", ("Vuna.Compiler.Frontend.Ast.holeNamed", "Vuna/Compiler/Frontend/Ast.vuna:419"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dinstArgSyntax", ("Vuna.Compiler.Frontend.Ast.instArgSyntax", "Vuna/Compiler/Frontend/Ast.vuna:575"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dinternalNamePrefix", ("Vuna.Compiler.Frontend.Ast.internalNamePrefix", "Vuna/Compiler/Frontend/Ast.vuna:435"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disAppAtSyntax", ("Vuna.Compiler.Frontend.Ast.isAppAtSyntax", "Vuna/Compiler/Frontend/Ast.vuna:570"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disDoBindSyntaxName", ("Vuna.Compiler.Frontend.Ast.isDoBindSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:624"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disDoIgnoreSyntaxName", ("Vuna.Compiler.Frontend.Ast.isDoIgnoreSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:628"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disHandleNoRetSyntax", ("Vuna.Compiler.Frontend.Ast.isHandleNoRetSyntax", "Vuna/Compiler/Frontend/Ast.vuna:549"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disHandleSyntax", ("Vuna.Compiler.Frontend.Ast.isHandleSyntax", "Vuna/Compiler/Frontend/Ast.vuna:541"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disHoleName", ("Vuna.Compiler.Frontend.Ast.isHoleName", "Vuna/Compiler/Frontend/Ast.vuna:416"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disInstArgSyntax", ("Vuna.Compiler.Frontend.Ast.isInstArgSyntax", "Vuna/Compiler/Frontend/Ast.vuna:579"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disInternalSyntaxName", ("Vuna.Compiler.Frontend.Ast.isInternalSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:443"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disListConsSyntax", ("Vuna.Compiler.Frontend.Ast.isListConsSyntax", "Vuna/Compiler/Frontend/Ast.vuna:499"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disListNilSyntax", ("Vuna.Compiler.Frontend.Ast.isListNilSyntax", "Vuna/Compiler/Frontend/Ast.vuna:495"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disMacroSyntaxName", ("Vuna.Compiler.Frontend.Ast.isMacroSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:599"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disOverCtorName", ("Vuna.Compiler.Frontend.Ast.isOverCtorName", "Vuna/Compiler/Frontend/Ast.vuna:481"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disPerformSyntax", ("Vuna.Compiler.Frontend.Ast.isPerformSyntax", "Vuna/Compiler/Frontend/Ast.vuna:525"));
  ("v_Vuna_dCompiler_dFrontend_dAst_disRowAtSyntax", ("Vuna.Compiler.Frontend.Ast.isRowAtSyntax", "Vuna/Compiler/Frontend/Ast.vuna:559"));
  ("v_Vuna_dCompiler_dFrontend_dAst_djoinWithAt", ("Vuna.Compiler.Frontend.Ast.joinWithAt", "Vuna/Compiler/Frontend/Ast.vuna:459"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dlistConsSyntax", ("Vuna.Compiler.Frontend.Ast.listConsSyntax", "Vuna/Compiler/Frontend/Ast.vuna:491"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dlistNilSyntax", ("Vuna.Compiler.Frontend.Ast.listNilSyntax", "Vuna/Compiler/Frontend/Ast.vuna:487"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dlookupCtorArity", ("Vuna.Compiler.Frontend.Ast.lookupCtorArity", "Vuna/Compiler/Frontend/Ast.vuna:349"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dmacroNameOf", ("Vuna.Compiler.Frontend.Ast.macroNameOf", "Vuna/Compiler/Frontend/Ast.vuna:603"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxName", ("Vuna.Compiler.Frontend.Ast.macroSyntaxName", "Vuna/Compiler/Frontend/Ast.vuna:595"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dmacroSyntaxPrefix", ("Vuna.Compiler.Frontend.Ast.macroSyntaxPrefix", "Vuna/Compiler/Frontend/Ast.vuna:591"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dopacitySpecName", ("Vuna.Compiler.Frontend.Ast.opacitySpecName", "Vuna/Compiler/Frontend/Ast.vuna:197"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dopacitySpecSpan", ("Vuna.Compiler.Frontend.Ast.opacitySpecSpan", "Vuna/Compiler/Frontend/Ast.vuna:200"));
  ("v_Vuna_dCompiler_dFrontend_dAst_doverCtorName", ("Vuna.Compiler.Frontend.Ast.overCtorName", "Vuna/Compiler/Frontend/Ast.vuna:465"));
  ("v_Vuna_dCompiler_dFrontend_dAst_doverCtorPrefix", ("Vuna.Compiler.Frontend.Ast.overCtorPrefix", "Vuna/Compiler/Frontend/Ast.vuna:439"));
  ("v_Vuna_dCompiler_dFrontend_dAst_doverCtorShort", ("Vuna.Compiler.Frontend.Ast.overCtorShort", "Vuna/Compiler/Frontend/Ast.vuna:469"));
  ("v_Vuna_dCompiler_dFrontend_dAst_doverCtorTargets", ("Vuna.Compiler.Frontend.Ast.overCtorTargets", "Vuna/Compiler/Frontend/Ast.vuna:475"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dpatSpan", ("Vuna.Compiler.Frontend.Ast.patSpan", "Vuna/Compiler/Frontend/Ast.vuna:226"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dperformSyntax", ("Vuna.Compiler.Frontend.Ast.performSyntax", "Vuna/Compiler/Frontend/Ast.vuna:521"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dqtyIsZero", ("Vuna.Compiler.Frontend.Ast.qtyIsZero", "Vuna/Compiler/Frontend/Ast.vuna:45"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dreprPrefix", ("Vuna.Compiler.Frontend.Ast.reprPrefix", "Vuna/Compiler/Frontend/Ast.vuna:59"));
  ("v_Vuna_dCompiler_dFrontend_dAst_drowAtSyntax", ("Vuna.Compiler.Frontend.Ast.rowAtSyntax", "Vuna/Compiler/Frontend/Ast.vuna:555"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dtopNames", ("Vuna.Compiler.Frontend.Ast.topNames", "Vuna/Compiler/Frontend/Ast.vuna:377"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodName", ("Vuna.Compiler.Frontend.Ast.traitMethodName", "Vuna/Compiler/Frontend/Ast.vuna:290"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dtraitMethodSpan", ("Vuna.Compiler.Frontend.Ast.traitMethodSpan", "Vuna/Compiler/Frontend/Ast.vuna:293"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dtypeArity", ("Vuna.Compiler.Frontend.Ast.typeArity", "Vuna/Compiler/Frontend/Ast.vuna:345"));
  ("v_Vuna_dCompiler_dFrontend_dAst_dtypeNamesOf", ("Vuna.Compiler.Frontend.Ast.typeNamesOf", "Vuna/Compiler/Frontend/Ast.vuna:402"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecClause", ("Vuna.Compiler.Frontend.Canonical.Ast.decClause", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:648"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecCtor", ("Vuna.Compiler.Frontend.Canonical.Ast.decCtor", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:503"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecCtorComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decCtorComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:785"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDecl", ("Vuna.Compiler.Frontend.Canonical.Ast.decDecl", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:557"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDeclComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decDeclComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:755"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDecls", ("Vuna.Compiler.Frontend.Canonical.Ast.decDecls", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:728"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDeclsComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decDeclsComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:809"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDeclsItems", ("Vuna.Compiler.Frontend.Canonical.Ast.decDeclsItems", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:735"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDoStmt", ("Vuna.Compiler.Frontend.Canonical.Ast.decDoStmt", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:366"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecDoStmtComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decDoStmtComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:779"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExportItem", ("Vuna.Compiler.Frontend.Canonical.Ast.decExportItem", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:871"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExportMembers", ("Vuna.Compiler.Frontend.Canonical.Ast.decExportMembers", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:883"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExportSpec", ("Vuna.Compiler.Frontend.Canonical.Ast.decExportSpec", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:892"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.decExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:382"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExprComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decExprComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:749"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExprList", ("Vuna.Compiler.Frontend.Canonical.Ast.decExprList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:698"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecExprListItems", ("Vuna.Compiler.Frontend.Canonical.Ast.decExprListItems", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:705"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecField", ("Vuna.Compiler.Frontend.Canonical.Ast.decField", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:518"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecFieldComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decFieldComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:791"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecFixityLike", ("Vuna.Compiler.Frontend.Canonical.Ast.decFixityLike", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:927"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecImportLike", ("Vuna.Compiler.Frontend.Canonical.Ast.decImportLike", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:922"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecInterpPart", ("Vuna.Compiler.Frontend.Canonical.Ast.decInterpPart", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:319"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecInterpPartComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decInterpPartComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:773"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecListDigits", ("Vuna.Compiler.Frontend.Canonical.Ast.decListDigits", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:683"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecListHead", ("Vuna.Compiler.Frontend.Canonical.Ast.decListHead", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:676"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecMaybeExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.decMaybeExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:315"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecMaybeQty", ("Vuna.Compiler.Frontend.Canonical.Ast.decMaybeQty", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:311"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecModDecl", ("Vuna.Compiler.Frontend.Canonical.Ast.decModDecl", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:917"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecOpacity", ("Vuna.Compiler.Frontend.Canonical.Ast.decOpacity", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:902"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecOpacitySpec", ("Vuna.Compiler.Frontend.Canonical.Ast.decOpacitySpec", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:911"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPat", ("Vuna.Compiler.Frontend.Canonical.Ast.decPat", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:333"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decPatComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:743"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.decPatExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:639"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatList", ("Vuna.Compiler.Frontend.Canonical.Ast.decPatList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:713"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecPatListItems", ("Vuna.Compiler.Frontend.Canonical.Ast.decPatListItems", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:720"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecQty", ("Vuna.Compiler.Frontend.Canonical.Ast.decQty", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:290"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecQtyComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decQtyComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:761"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecReprTier", ("Vuna.Compiler.Frontend.Canonical.Ast.decReprTier", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:300"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecReprTierComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decReprTierComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:767"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecSourceFileComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decSourceFileComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:933"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecSourceFileGo", ("Vuna.Compiler.Frontend.Canonical.Ast.decSourceFileGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:938"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecStrExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.decStrExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:657"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecStrPat", ("Vuna.Compiler.Frontend.Canonical.Ast.decStrPat", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:666"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecTraitMethod", ("Vuna.Compiler.Frontend.Canonical.Ast.decTraitMethod", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:544"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecTraitMethodComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decTraitMethodComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:803"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecTraitParam", ("Vuna.Compiler.Frontend.Canonical.Ast.decTraitParam", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:531"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_ddecTraitParamComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decTraitParamComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:797"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencClauses", ("Vuna.Compiler.Frontend.Canonical.Ast.encClauses", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:115"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencClausesGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encClausesGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:119"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencCtor", ("Vuna.Compiler.Frontend.Canonical.Ast.encCtor", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:253"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencCtorList", ("Vuna.Compiler.Frontend.Canonical.Ast.encCtorList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:160"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencCtorListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encCtorListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:164"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDecl", ("Vuna.Compiler.Frontend.Canonical.Ast.encDecl", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:269"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDecls", ("Vuna.Compiler.Frontend.Canonical.Ast.encDecls", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:196"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDeclsGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encDeclsGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:200"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencDoStmt", ("Vuna.Compiler.Frontend.Canonical.Ast.encDoStmt", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:220"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExportItem", ("Vuna.Compiler.Frontend.Canonical.Ast.encExportItem", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:823"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExportMembers", ("Vuna.Compiler.Frontend.Canonical.Ast.encExportMembers", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:829"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExportSpec", ("Vuna.Compiler.Frontend.Canonical.Ast.encExportSpec", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:834"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.encExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:225"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExprList", ("Vuna.Compiler.Frontend.Canonical.Ast.encExprList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:88"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencExprListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encExprListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:92"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencField", ("Vuna.Compiler.Frontend.Canonical.Ast.encField", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:257"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencFieldList", ("Vuna.Compiler.Frontend.Canonical.Ast.encFieldList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:169"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencFieldListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encFieldListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:173"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencFixityLike", ("Vuna.Compiler.Frontend.Canonical.Ast.encFixityLike", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:865"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencImportLike", ("Vuna.Compiler.Frontend.Canonical.Ast.encImportLike", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:861"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencInterpPart", ("Vuna.Compiler.Frontend.Canonical.Ast.encInterpPart", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:205"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencMaybeExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.encMaybeExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:69"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencMaybeQty", ("Vuna.Compiler.Frontend.Canonical.Ast.encMaybeQty", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:64"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencModDecl", ("Vuna.Compiler.Frontend.Canonical.Ast.encModDecl", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:847"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencOpacity", ("Vuna.Compiler.Frontend.Canonical.Ast.encOpacity", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:838"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencOpacitySpec", ("Vuna.Compiler.Frontend.Canonical.Ast.encOpacitySpec", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:843"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPartList", ("Vuna.Compiler.Frontend.Canonical.Ast.encPartList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:133"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPartListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encPartListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:137"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPat", ("Vuna.Compiler.Frontend.Canonical.Ast.encPat", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:210"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatExprList", ("Vuna.Compiler.Frontend.Canonical.Ast.encPatExprList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:106"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatExprListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encPatExprListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:110"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatList", ("Vuna.Compiler.Frontend.Canonical.Ast.encPatList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:97"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencPatListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encPatListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:101"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencQty", ("Vuna.Compiler.Frontend.Canonical.Ast.encQty", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:53"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencReprTier", ("Vuna.Compiler.Frontend.Canonical.Ast.encReprTier", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:58"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencSourceFile", ("Vuna.Compiler.Frontend.Canonical.Ast.encSourceFile", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:853"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStmtList", ("Vuna.Compiler.Frontend.Canonical.Ast.encStmtList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:124"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStmtListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encStmtListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:128"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrExprList", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrExprList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:142"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrExprListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrExprListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:146"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrList", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:79"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:83"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrPatList", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrPatList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:151"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencStrPatListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrPatListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:155"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitMethod", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitMethod", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:265"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitMethodList", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitMethodList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:187"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitMethodListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitMethodListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:191"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitParam", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitParam", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:261"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitParamList", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitParamList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:178"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dencTraitParamListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitParamListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:182"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dAst_dnoSpan", ("Vuna.Compiler.Frontend.Canonical.Ast.noSpan", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:46"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_ddecListDigits", ("Vuna.Compiler.Frontend.Canonical.Lex.decListDigits", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:96"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_ddecListHead", ("Vuna.Compiler.Frontend.Canonical.Lex.decListHead", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:90"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_ddecPTok", ("Vuna.Compiler.Frontend.Canonical.Lex.decPTok", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:154"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_ddecPTokItems", ("Vuna.Compiler.Frontend.Canonical.Lex.decPTokItems", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:183"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_ddecPTokList", ("Vuna.Compiler.Frontend.Canonical.Lex.decPTokList", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:177"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_ddecPTokListComplete", ("Vuna.Compiler.Frontend.Canonical.Lex.decPTokListComplete", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:191"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_ddecPos", ("Vuna.Compiler.Frontend.Canonical.Lex.decPos", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:84"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_ddecTmplPart", ("Vuna.Compiler.Frontend.Canonical.Lex.decTmplPart", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:106"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_ddecTmplPartItems", ("Vuna.Compiler.Frontend.Canonical.Lex.decTmplPartItems", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:169"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_ddecTmplPartList", ("Vuna.Compiler.Frontend.Canonical.Lex.decTmplPartList", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:163"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_ddecTok", ("Vuna.Compiler.Frontend.Canonical.Lex.decTok", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:120"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_dencPTok", ("Vuna.Compiler.Frontend.Canonical.Lex.encPTok", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:69"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_dencPTokList", ("Vuna.Compiler.Frontend.Canonical.Lex.encPTokList", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:73"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_dencPTokListGo", ("Vuna.Compiler.Frontend.Canonical.Lex.encPTokListGo", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:76"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_dencPos", ("Vuna.Compiler.Frontend.Canonical.Lex.encPos", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:38"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_dencTmplPart", ("Vuna.Compiler.Frontend.Canonical.Lex.encTmplPart", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:42"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_dencTmplPartList", ("Vuna.Compiler.Frontend.Canonical.Lex.encTmplPartList", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:59"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_dencTmplPartListGo", ("Vuna.Compiler.Frontend.Canonical.Lex.encTmplPartListGo", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:62"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dLex_dencTok", ("Vuna.Compiler.Frontend.Canonical.Lex.encTok", "Vuna/Compiler/Frontend/Canonical/Lex.vuna:47"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dcontentTag", ("Vuna.Compiler.Frontend.Canonical.Pkg.contentTag", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:43"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_ddecContentAt", ("Vuna.Compiler.Frontend.Canonical.Pkg.decContentAt", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:87"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_ddecFile", ("Vuna.Compiler.Frontend.Canonical.Pkg.decFile", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:80"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_ddecIdentityAt", ("Vuna.Compiler.Frontend.Canonical.Pkg.decIdentityAt", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:101"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_ddecPackageContent", ("Vuna.Compiler.Frontend.Canonical.Pkg.decPackageContent", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:93"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_ddecPackageIdentity", ("Vuna.Compiler.Frontend.Canonical.Pkg.decPackageIdentity", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:116"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_ddecStrPair", ("Vuna.Compiler.Frontend.Canonical.Pkg.decStrPair", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:98"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dencFile", ("Vuna.Compiler.Frontend.Canonical.Pkg.encFile", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:50"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dencFiles", ("Vuna.Compiler.Frontend.Canonical.Pkg.encFiles", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:53"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dencIdentity", ("Vuna.Compiler.Frontend.Canonical.Pkg.encIdentity", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:70"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dencPackageContent", ("Vuna.Compiler.Frontend.Canonical.Pkg.encPackageContent", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:57"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dencPackageIdentity", ("Vuna.Compiler.Frontend.Canonical.Pkg.encPackageIdentity", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:76"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dencStrPair", ("Vuna.Compiler.Frontend.Canonical.Pkg.encStrPair", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:67"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_dhashFile", ("Vuna.Compiler.Frontend.Canonical.Pkg.hashFile", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:64"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_didentityOfSource", ("Vuna.Compiler.Frontend.Canonical.Pkg.identityOfSource", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:61"));
  ("v_Vuna_dCompiler_dFrontend_dCanonical_dPkg_didentityTag", ("Vuna.Compiler.Frontend.Canonical.Pkg.identityTag", "Vuna/Compiler/Frontend/Canonical/Pkg.vuna:46"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dadvanceBy", ("Vuna.Compiler.Frontend.Cst.advanceBy", "Vuna/Compiler/Frontend/Cst.vuna:100"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dadvanceTo", ("Vuna.Compiler.Frontend.Cst.advanceTo", "Vuna/Compiler/Frontend/Cst.vuna:93"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dbuildTokens", ("Vuna.Compiler.Frontend.Cst.buildTokens", "Vuna/Compiler/Frontend/Cst.vuna:264"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dcommentEndPos", ("Vuna.Compiler.Frontend.Cst.commentEndPos", "Vuna/Compiler/Frontend/Cst.vuna:215"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dcommentStartsAtOrAfter", ("Vuna.Compiler.Frontend.Cst.commentStartsAtOrAfter", "Vuna/Compiler/Frontend/Cst.vuna:240"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dcommentTrivia", ("Vuna.Compiler.Frontend.Cst.commentTrivia", "Vuna/Compiler/Frontend/Cst.vuna:208"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dcommentTriviaKind", ("Vuna.Compiler.Frontend.Cst.commentTriviaKind", "Vuna/Compiler/Frontend/Cst.vuna:202"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dcurPos", ("Vuna.Compiler.Frontend.Cst.curPos", "Vuna/Compiler/Frontend/Cst.vuna:82"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dgapTrivia", ("Vuna.Compiler.Frontend.Cst.gapTrivia", "Vuna/Compiler/Frontend/Cst.vuna:222"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dlexCst", ("Vuna.Compiler.Frontend.Cst.lexCst", "Vuna/Compiler/Frontend/Cst.vuna:278"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dlexCstGo", ("Vuna.Compiler.Frontend.Cst.lexCstGo", "Vuna/Compiler/Frontend/Cst.vuna:281"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dlineCurStart", ("Vuna.Compiler.Frontend.Cst.lineCurStart", "Vuna/Compiler/Frontend/Cst.vuna:79"));
  ("v_Vuna_dCompiler_dFrontend_dCst_drenderCst", ("Vuna.Compiler.Frontend.Cst.renderCst", "Vuna/Compiler/Frontend/Cst.vuna:299"));
  ("v_Vuna_dCompiler_dFrontend_dCst_drenderParts", ("Vuna.Compiler.Frontend.Cst.renderParts", "Vuna/Compiler/Frontend/Cst.vuna:295"));
  ("v_Vuna_dCompiler_dFrontend_dCst_droundtripOk", ("Vuna.Compiler.Frontend.Cst.roundtripOk", "Vuna/Compiler/Frontend/Cst.vuna:303"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dscanDigitsEnd", ("Vuna.Compiler.Frontend.Cst.scanDigitsEnd", "Vuna/Compiler/Frontend/Cst.vuna:114"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dscanStringEnd", ("Vuna.Compiler.Frontend.Cst.scanStringEnd", "Vuna/Compiler/Frontend/Cst.vuna:120"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dsliceText", ("Vuna.Compiler.Frontend.Cst.sliceText", "Vuna/Compiler/Frontend/Cst.vuna:107"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dspaceTrivia", ("Vuna.Compiler.Frontend.Cst.spaceTrivia", "Vuna/Compiler/Frontend/Cst.vuna:188"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dspanEndOf", ("Vuna.Compiler.Frontend.Cst.spanEndOf", "Vuna/Compiler/Frontend/Cst.vuna:184"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dspanStartOf", ("Vuna.Compiler.Frontend.Cst.spanStartOf", "Vuna/Compiler/Frontend/Cst.vuna:181"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dstepCur", ("Vuna.Compiler.Frontend.Cst.stepCur", "Vuna/Compiler/Frontend/Cst.vuna:86"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtakeCommentsBefore", ("Vuna.Compiler.Frontend.Cst.takeCommentsBefore", "Vuna/Compiler/Frontend/Cst.vuna:231"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtoTrivComments", ("Vuna.Compiler.Frontend.Cst.toTrivComments", "Vuna/Compiler/Frontend/Cst.vuna:170"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtokTag", ("Vuna.Compiler.Frontend.Cst.tokTag", "Vuna/Compiler/Frontend/Cst.vuna:127"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtokText", ("Vuna.Compiler.Frontend.Cst.tokText", "Vuna/Compiler/Frontend/Cst.vuna:139"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtokenNode", ("Vuna.Compiler.Frontend.Cst.tokenNode", "Vuna/Compiler/Frontend/Cst.vuna:248"));
  ("v_Vuna_dCompiler_dFrontend_dCst_dtriviaTextOf", ("Vuna.Compiler.Frontend.Cst.triviaTextOf", "Vuna/Compiler/Frontend/Cst.vuna:291"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dadvanceChar", ("Vuna.Compiler.Frontend.Lexer.advanceChar", "Vuna/Compiler/Frontend/Lexer.vuna:91"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcharsEmpty", ("Vuna.Compiler.Frontend.Lexer.charsEmpty", "Vuna/Compiler/Frontend/Lexer.vuna:61"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext", ("Vuna.Compiler.Frontend.Lexer.charsNext", "Vuna/Compiler/Frontend/Lexer.vuna:75"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcharsNext2", ("Vuna.Compiler.Frontend.Lexer.charsNext2", "Vuna/Compiler/Frontend/Lexer.vuna:79"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcharsOffset", ("Vuna.Compiler.Frontend.Lexer.charsOffset", "Vuna/Compiler/Frontend/Lexer.vuna:54"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeek", ("Vuna.Compiler.Frontend.Lexer.charsPeek", "Vuna/Compiler/Frontend/Lexer.vuna:64"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcharsPeekAt", ("Vuna.Compiler.Frontend.Lexer.charsPeekAt", "Vuna/Compiler/Frontend/Lexer.vuna:67"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos", ("Vuna.Compiler.Frontend.Lexer.charsPos", "Vuna/Compiler/Frontend/Lexer.vuna:57"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcharsPos2", ("Vuna.Compiler.Frontend.Lexer.charsPos2", "Vuna/Compiler/Frontend/Lexer.vuna:83"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcharsSource", ("Vuna.Compiler.Frontend.Lexer.charsSource", "Vuna/Compiler/Frontend/Lexer.vuna:51"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcharsStep", ("Vuna.Compiler.Frontend.Lexer.charsStep", "Vuna/Compiler/Frontend/Lexer.vuna:71"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dclassifyIdent", ("Vuna.Compiler.Frontend.Lexer.classifyIdent", "Vuna/Compiler/Frontend/Lexer.vuna:172"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectBlockBody", ("Vuna.Compiler.Frontend.Lexer.collectBlockBody", "Vuna/Compiler/Frontend/Lexer.vuna:209"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectFloat", ("Vuna.Compiler.Frontend.Lexer.collectFloat", "Vuna/Compiler/Frontend/Lexer.vuna:376"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectFrac", ("Vuna.Compiler.Frontend.Lexer.collectFrac", "Vuna/Compiler/Frontend/Lexer.vuna:387"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectIdent", ("Vuna.Compiler.Frontend.Lexer.collectIdent", "Vuna/Compiler/Frontend/Lexer.vuna:329"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectInt", ("Vuna.Compiler.Frontend.Lexer.collectInt", "Vuna/Compiler/Frontend/Lexer.vuna:346"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectInternalIdent", ("Vuna.Compiler.Frontend.Lexer.collectInternalIdent", "Vuna/Compiler/Frontend/Lexer.vuna:320"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectLineBody", ("Vuna.Compiler.Frontend.Lexer.collectLineBody", "Vuna/Compiler/Frontend/Lexer.vuna:199"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcollectOp", ("Vuna.Compiler.Frontend.Lexer.collectOp", "Vuna/Compiler/Frontend/Lexer.vuna:396"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpan", ("Vuna.Compiler.Frontend.Lexer.commentSpan", "Vuna/Compiler/Frontend/Lexer.vuna:187"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dcommentSpanOf", ("Vuna.Compiler.Frontend.Lexer.commentSpanOf", "Vuna/Compiler/Frontend/Lexer.vuna:245"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_ddecodeEscape", ("Vuna.Compiler.Frontend.Lexer.decodeEscape", "Vuna/Compiler/Frontend/Lexer.vuna:417"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_ddepthAfter", ("Vuna.Compiler.Frontend.Lexer.depthAfter", "Vuna/Compiler/Frontend/Lexer.vuna:486"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_ddigitRunIsFloat", ("Vuna.Compiler.Frontend.Lexer.digitRunIsFloat", "Vuna/Compiler/Frontend/Lexer.vuna:365"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_ddropOpeningNewline", ("Vuna.Compiler.Frontend.Lexer.dropOpeningNewline", "Vuna/Compiler/Frontend/Lexer.vuna:427"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_ddropTrailingSpace", ("Vuna.Compiler.Frontend.Lexer.dropTrailingSpace", "Vuna/Compiler/Frontend/Lexer.vuna:193"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dflushText", ("Vuna.Compiler.Frontend.Lexer.flushText", "Vuna/Compiler/Frontend/Lexer.vuna:434"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disDigit", ("Vuna.Compiler.Frontend.Lexer.isDigit", "Vuna/Compiler/Frontend/Lexer.vuna:107"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disIdentChar", ("Vuna.Compiler.Frontend.Lexer.isIdentChar", "Vuna/Compiler/Frontend/Lexer.vuna:104"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disIdentStart", ("Vuna.Compiler.Frontend.Lexer.isIdentStart", "Vuna/Compiler/Frontend/Lexer.vuna:101"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disKeyword", ("Vuna.Compiler.Frontend.Lexer.isKeyword", "Vuna/Compiler/Frontend/Lexer.vuna:140"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disLowerChar", ("Vuna.Compiler.Frontend.Lexer.isLowerChar", "Vuna/Compiler/Frontend/Lexer.vuna:98"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disOpChar", ("Vuna.Compiler.Frontend.Lexer.isOpChar", "Vuna/Compiler/Frontend/Lexer.vuna:113"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disSpace", ("Vuna.Compiler.Frontend.Lexer.isSpace", "Vuna/Compiler/Frontend/Lexer.vuna:110"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_disUpperChar", ("Vuna.Compiler.Frontend.Lexer.isUpperChar", "Vuna/Compiler/Frontend/Lexer.vuna:95"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexChars", ("Vuna.Compiler.Frontend.Lexer.lexChars", "Vuna/Compiler/Frontend/Lexer.vuna:566"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsRev", ("Vuna.Compiler.Frontend.Lexer.lexCharsRev", "Vuna/Compiler/Frontend/Lexer.vuna:571"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWith", ("Vuna.Compiler.Frontend.Lexer.lexCharsWith", "Vuna/Compiler/Frontend/Lexer.vuna:549"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexCharsWithRev", ("Vuna.Compiler.Frontend.Lexer.lexCharsWithRev", "Vuna/Compiler/Frontend/Lexer.vuna:554"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexComments", ("Vuna.Compiler.Frontend.Lexer.lexComments", "Vuna/Compiler/Frontend/Lexer.vuna:588"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexHoleTokens", ("Vuna.Compiler.Frontend.Lexer.lexHoleTokens", "Vuna/Compiler/Frontend/Lexer.vuna:474"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexOneToken", ("Vuna.Compiler.Frontend.Lexer.lexOneToken", "Vuna/Compiler/Frontend/Lexer.vuna:492"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexSingleStringToken", ("Vuna.Compiler.Frontend.Lexer.lexSingleStringToken", "Vuna/Compiler/Frontend/Lexer.vuna:533"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexSource", ("Vuna.Compiler.Frontend.Lexer.lexSource", "Vuna/Compiler/Frontend/Lexer.vuna:585"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexSourceWithComments", ("Vuna.Compiler.Frontend.Lexer.lexSourceWithComments", "Vuna/Compiler/Frontend/Lexer.vuna:582"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexSpanAt", ("Vuna.Compiler.Frontend.Lexer.lexSpanAt", "Vuna/Compiler/Frontend/Lexer.vuna:88"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dlexStringToken", ("Vuna.Compiler.Frontend.Lexer.lexStringToken", "Vuna/Compiler/Frontend/Lexer.vuna:526"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dmaxIntLiteral", ("Vuna.Compiler.Frontend.Lexer.maxIntLiteral", "Vuna/Compiler/Frontend/Lexer.vuna:341"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dscanTemplateText", ("Vuna.Compiler.Frontend.Lexer.scanTemplateText", "Vuna/Compiler/Frontend/Lexer.vuna:441"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dskipBlockComment", ("Vuna.Compiler.Frontend.Lexer.skipBlockComment", "Vuna/Compiler/Frontend/Lexer.vuna:232"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dskipLineComment", ("Vuna.Compiler.Frontend.Lexer.skipLineComment", "Vuna/Compiler/Frontend/Lexer.vuna:223"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dskipTrivia", ("Vuna.Compiler.Frontend.Lexer.skipTrivia", "Vuna/Compiler/Frontend/Lexer.vuna:265"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaComments", ("Vuna.Compiler.Frontend.Lexer.skipTriviaComments", "Vuna/Compiler/Frontend/Lexer.vuna:283"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dskipTriviaCommentsGo", ("Vuna.Compiler.Frontend.Lexer.skipTriviaCommentsGo", "Vuna/Compiler/Frontend/Lexer.vuna:286"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dsourceFuel", ("Vuna.Compiler.Frontend.Lexer.sourceFuel", "Vuna/Compiler/Frontend/Lexer.vuna:599"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dstartsWithVunaAt", ("Vuna.Compiler.Frontend.Lexer.startsWithVunaAt", "Vuna/Compiler/Frontend/Lexer.vuna:312"));
  ("v_Vuna_dCompiler_dFrontend_dLexer_dtrimTrailingSpace", ("Vuna.Compiler.Frontend.Lexer.trimTrailingSpace", "Vuna/Compiler/Frontend/Lexer.vuna:190"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dallHex", ("Vuna.Compiler.Frontend.Manifest.allHex", "Vuna/Compiler/Frontend/Manifest.vuna:378"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dapplyDepEntry", ("Vuna.Compiler.Frontend.Manifest.applyDepEntry", "Vuna/Compiler/Frontend/Manifest.vuna:298"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_datLine", ("Vuna.Compiler.Frontend.Manifest.atLine", "Vuna/Compiler/Frontend/Manifest.vuna:99"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dboolField", ("Vuna.Compiler.Frontend.Manifest.boolField", "Vuna/Compiler/Frontend/Manifest.vuna:141"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dbuildDependency", ("Vuna.Compiler.Frontend.Manifest.buildDependency", "Vuna/Compiler/Frontend/Manifest.vuna:338"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dbuildManifest", ("Vuna.Compiler.Frontend.Manifest.buildManifest", "Vuna/Compiler/Frontend/Manifest.vuna:440"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dbuildTables", ("Vuna.Compiler.Frontend.Manifest.buildTables", "Vuna/Compiler/Frontend/Manifest.vuna:357"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dcheckEntries", ("Vuna.Compiler.Frontend.Manifest.checkEntries", "Vuna/Compiler/Frontend/Manifest.vuna:255"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dcheckHashForm", ("Vuna.Compiler.Frontend.Manifest.checkHashForm", "Vuna/Compiler/Frontend/Manifest.vuna:388"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dcheckIdentityForm", ("Vuna.Compiler.Frontend.Manifest.checkIdentityForm", "Vuna/Compiler/Frontend/Manifest.vuna:393"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dcheckOneEntry", ("Vuna.Compiler.Frontend.Manifest.checkOneEntry", "Vuna/Compiler/Frontend/Manifest.vuna:236"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dcollectDependencies", ("Vuna.Compiler.Frontend.Manifest.collectDependencies", "Vuna/Compiler/Frontend/Manifest.vuna:363"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dcollectLayers", ("Vuna.Compiler.Frontend.Manifest.collectLayers", "Vuna/Compiler/Frontend/Manifest.vuna:162"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dcollectStrings", ("Vuna.Compiler.Frontend.Manifest.collectStrings", "Vuna/Compiler/Frontend/Manifest.vuna:330"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dcollectTables", ("Vuna.Compiler.Frontend.Manifest.collectTables", "Vuna/Compiler/Frontend/Manifest.vuna:322"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOf", ("Vuna.Compiler.Frontend.Manifest.depAliasOf", "Vuna/Compiler/Frontend/Manifest.vuna:41"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_ddepAliasOfSection", ("Vuna.Compiler.Frontend.Manifest.depAliasOfSection", "Vuna/Compiler/Frontend/Manifest.vuna:222"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_ddepHashOf", ("Vuna.Compiler.Frontend.Manifest.depHashOf", "Vuna/Compiler/Frontend/Manifest.vuna:47"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_ddepIdentityOf", ("Vuna.Compiler.Frontend.Manifest.depIdentityOf", "Vuna/Compiler/Frontend/Manifest.vuna:50"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_ddepSourceOf", ("Vuna.Compiler.Frontend.Manifest.depSourceOf", "Vuna/Compiler/Frontend/Manifest.vuna:44"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_ddirFromRev", ("Vuna.Compiler.Frontend.Manifest.dirFromRev", "Vuna/Compiler/Frontend/Manifest.vuna:538"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_ddirResult", ("Vuna.Compiler.Frontend.Manifest.dirResult", "Vuna/Compiler/Frontend/Manifest.vuna:542"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_demptyDepAcc", ("Vuna.Compiler.Frontend.Manifest.emptyDepAcc", "Vuna/Compiler/Frontend/Manifest.vuna:86"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_densureAcc", ("Vuna.Compiler.Frontend.Manifest.ensureAcc", "Vuna/Compiler/Frontend/Manifest.vuna:267"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dfieldLine", ("Vuna.Compiler.Frontend.Manifest.fieldLine", "Vuna/Compiler/Frontend/Manifest.vuna:110"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dfieldLoc", ("Vuna.Compiler.Frontend.Manifest.fieldLoc", "Vuna/Compiler/Frontend/Manifest.vuna:115"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dhasAcc", ("Vuna.Compiler.Frontend.Manifest.hasAcc", "Vuna/Compiler/Frontend/Manifest.vuna:263"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dintField", ("Vuna.Compiler.Frontend.Manifest.intField", "Vuna/Compiler/Frontend/Manifest.vuna:135"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_disDepSourceKey", ("Vuna.Compiler.Frontend.Manifest.isDepSourceKey", "Vuna/Compiler/Frontend/Manifest.vuna:226"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_disDepTableSection", ("Vuna.Compiler.Frontend.Manifest.isDepTableSection", "Vuna/Compiler/Frontend/Manifest.vuna:212"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_disDigitChar", ("Vuna.Compiler.Frontend.Manifest.isDigitChar", "Vuna/Compiler/Frontend/Manifest.vuna:90"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_disHexChar", ("Vuna.Compiler.Frontend.Manifest.isHexChar", "Vuna/Compiler/Frontend/Manifest.vuna:375"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_disLayersSection", ("Vuna.Compiler.Frontend.Manifest.isLayersSection", "Vuna/Compiler/Frontend/Manifest.vuna:154"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_disLintSection", ("Vuna.Compiler.Frontend.Manifest.isLintSection", "Vuna/Compiler/Frontend/Manifest.vuna:218"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_disLowerAlphaChar", ("Vuna.Compiler.Frontend.Manifest.isLowerAlphaChar", "Vuna/Compiler/Frontend/Manifest.vuna:96"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_disUpperAlphaChar", ("Vuna.Compiler.Frontend.Manifest.isUpperAlphaChar", "Vuna/Compiler/Frontend/Manifest.vuna:93"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dlayerHasCycle", ("Vuna.Compiler.Frontend.Manifest.layerHasCycle", "Vuna/Compiler/Frontend/Manifest.vuna:187"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dlayerSeen", ("Vuna.Compiler.Frontend.Manifest.layerSeen", "Vuna/Compiler/Frontend/Manifest.vuna:158"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dlayerUsesOf", ("Vuna.Compiler.Frontend.Manifest.layerUsesOf", "Vuna/Compiler/Frontend/Manifest.vuna:174"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dmanifestDir", ("Vuna.Compiler.Frontend.Manifest.manifestDir", "Vuna/Compiler/Frontend/Manifest.vuna:535"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dmanifestErr", ("Vuna.Compiler.Frontend.Manifest.manifestErr", "Vuna/Compiler/Frontend/Manifest.vuna:102"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dmapAcc", ("Vuna.Compiler.Frontend.Manifest.mapAcc", "Vuna/Compiler/Frontend/Manifest.vuna:270"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dorEmptyList", ("Vuna.Compiler.Frontend.Manifest.orEmptyList", "Vuna/Compiler/Frontend/Manifest.vuna:147"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dorFalse", ("Vuna.Compiler.Frontend.Manifest.orFalse", "Vuna/Compiler/Frontend/Manifest.vuna:207"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dparseManifest", ("Vuna.Compiler.Frontend.Manifest.parseManifest", "Vuna/Compiler/Frontend/Manifest.vuna:475"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dreachesFrom", ("Vuna.Compiler.Frontend.Manifest.reachesFrom", "Vuna/Compiler/Frontend/Manifest.vuna:178"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dresolveManifestPath", ("Vuna.Compiler.Frontend.Manifest.resolveManifestPath", "Vuna/Compiler/Frontend/Manifest.vuna:546"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dsameSection", ("Vuna.Compiler.Frontend.Manifest.sameSection", "Vuna/Compiler/Frontend/Manifest.vuna:105"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dsetAccGit", ("Vuna.Compiler.Frontend.Manifest.setAccGit", "Vuna/Compiler/Frontend/Manifest.vuna:278"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dsetAccHash", ("Vuna.Compiler.Frontend.Manifest.setAccHash", "Vuna/Compiler/Frontend/Manifest.vuna:287"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dsetAccIdentity", ("Vuna.Compiler.Frontend.Manifest.setAccIdentity", "Vuna/Compiler/Frontend/Manifest.vuna:290"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dsetAccPath", ("Vuna.Compiler.Frontend.Manifest.setAccPath", "Vuna/Compiler/Frontend/Manifest.vuna:275"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dsetAccRev", ("Vuna.Compiler.Frontend.Manifest.setAccRev", "Vuna/Compiler/Frontend/Manifest.vuna:281"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dsetAccUrl", ("Vuna.Compiler.Frontend.Manifest.setAccUrl", "Vuna/Compiler/Frontend/Manifest.vuna:284"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dstringField", ("Vuna.Compiler.Frontend.Manifest.stringField", "Vuna/Compiler/Frontend/Manifest.vuna:120"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dstringListField", ("Vuna.Compiler.Frontend.Manifest.stringListField", "Vuna/Compiler/Frontend/Manifest.vuna:126"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dstringValueOf", ("Vuna.Compiler.Frontend.Manifest.stringValueOf", "Vuna/Compiler/Frontend/Manifest.vuna:293"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidHashText", ("Vuna.Compiler.Frontend.Manifest.validHashText", "Vuna/Compiler/Frontend/Manifest.vuna:383"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleName", ("Vuna.Compiler.Frontend.Manifest.validModuleName", "Vuna/Compiler/Frontend/Manifest.vuna:489"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegment", ("Vuna.Compiler.Frontend.Manifest.validModuleSegment", "Vuna/Compiler/Frontend/Manifest.vuna:496"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegmentChars", ("Vuna.Compiler.Frontend.Manifest.validModuleSegmentChars", "Vuna/Compiler/Frontend/Manifest.vuna:499"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleSegments", ("Vuna.Compiler.Frontend.Manifest.validModuleSegments", "Vuna/Compiler/Frontend/Manifest.vuna:492"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidModuleTail", ("Vuna.Compiler.Frontend.Manifest.validModuleTail", "Vuna/Compiler/Frontend/Manifest.vuna:503"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageChars", ("Vuna.Compiler.Frontend.Manifest.validPackageChars", "Vuna/Compiler/Frontend/Manifest.vuna:484"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidPackageName", ("Vuna.Compiler.Frontend.Manifest.validPackageName", "Vuna/Compiler/Frontend/Manifest.vuna:481"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependencies", ("Vuna.Compiler.Frontend.Manifest.validateDependencies", "Vuna/Compiler/Frontend/Manifest.vuna:425"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDependency", ("Vuna.Compiler.Frontend.Manifest.validateDependency", "Vuna/Compiler/Frontend/Manifest.vuna:398"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDepsSeen", ("Vuna.Compiler.Frontend.Manifest.validateDepsSeen", "Vuna/Compiler/Frontend/Manifest.vuna:418"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagFormat", ("Vuna.Compiler.Frontend.Manifest.validateDiagFormat", "Vuna/Compiler/Frontend/Manifest.vuna:429"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagLang", ("Vuna.Compiler.Frontend.Manifest.validateDiagLang", "Vuna/Compiler/Frontend/Manifest.vuna:553"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateDiagMax", ("Vuna.Compiler.Frontend.Manifest.validateDiagMax", "Vuna/Compiler/Frontend/Manifest.vuna:435"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateExports", ("Vuna.Compiler.Frontend.Manifest.validateExports", "Vuna/Compiler/Frontend/Manifest.vuna:525"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayerTargets", ("Vuna.Compiler.Frontend.Manifest.validateLayerTargets", "Vuna/Compiler/Frontend/Manifest.vuna:200"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateLayers", ("Vuna.Compiler.Frontend.Manifest.validateLayers", "Vuna/Compiler/Frontend/Manifest.vuna:191"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateManifest", ("Vuna.Compiler.Frontend.Manifest.validateManifest", "Vuna/Compiler/Frontend/Manifest.vuna:529"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateMembers", ("Vuna.Compiler.Frontend.Manifest.validateMembers", "Vuna/Compiler/Frontend/Manifest.vuna:515"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateModules", ("Vuna.Compiler.Frontend.Manifest.validateModules", "Vuna/Compiler/Frontend/Manifest.vuna:520"));
  ("v_Vuna_dCompiler_dFrontend_dManifest_dvalidateName", ("Vuna.Compiler.Frontend.Manifest.validateName", "Vuna/Compiler/Frontend/Manifest.vuna:509"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dabsolutePath", ("Vuna.Compiler.Frontend.Packages.Pkg.absolutePath", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:148"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseCandidates", ("Vuna.Compiler.Frontend.Packages.Pkg.baseCandidates", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:492"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseNotFound", ("Vuna.Compiler.Frontend.Packages.Pkg.baseNotFound", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:500"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dbaseOnlyContext", ("Vuna.Compiler.Frontend.Packages.Pkg.baseOnlyContext", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:529"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniqueNamesGo", ("Vuna.Compiler.Frontend.Packages.Pkg.checkUniqueNamesGo", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:348"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcheckUniquePackageNames", ("Vuna.Compiler.Frontend.Packages.Pkg.checkUniquePackageNames", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:356"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectDependencyIds", ("Vuna.Compiler.Frontend.Packages.Pkg.collectDependencyIds", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:338"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcollectPackageIds", ("Vuna.Compiler.Frontend.Packages.Pkg.collectPackageIds", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:333"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextAt", ("Vuna.Compiler.Frontend.Packages.Pkg.contextAt", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:539"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextDir", ("Vuna.Compiler.Frontend.Packages.Pkg.contextDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:76"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextForDir", ("Vuna.Compiler.Frontend.Packages.Pkg.contextForDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:564"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextForFile", ("Vuna.Compiler.Frontend.Packages.Pkg.contextForFile", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:556"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageName", ("Vuna.Compiler.Frontend.Packages.Pkg.contextPackageName", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:86"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextPackageOf", ("Vuna.Compiler.Frontend.Packages.Pkg.contextPackageOf", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:83"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRelease", ("Vuna.Compiler.Frontend.Packages.Pkg.contextRelease", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:90"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextRoots", ("Vuna.Compiler.Frontend.Packages.Pkg.contextRoots", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:79"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcontextWithRelease", ("Vuna.Compiler.Frontend.Packages.Pkg.contextWithRelease", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:94"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcycleMessage", ("Vuna.Compiler.Frontend.Packages.Pkg.cycleMessage", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:197"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dcyclePrefix", ("Vuna.Compiler.Frontend.Packages.Pkg.cyclePrefix", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:190"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyNameOk", ("Vuna.Compiler.Frontend.Packages.Pkg.dependencyNameOk", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:204"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRootOf", ("Vuna.Compiler.Frontend.Packages.Pkg.dependencyRootOf", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:416"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_ddependencyRoots", ("Vuna.Compiler.Frontend.Packages.Pkg.dependencyRoots", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:425"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestDir", ("Vuna.Compiler.Frontend.Packages.Pkg.findManifestDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:477"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestDirMaybe", ("Vuna.Compiler.Frontend.Packages.Pkg.findManifestDirMaybe", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:469"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestUpMaybe", ("Vuna.Compiler.Frontend.Packages.Pkg.findManifestUpMaybe", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:453"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfindManifestUpMaybeStep", ("Vuna.Compiler.Frontend.Packages.Pkg.findManifestUpMaybeStep", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:459"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dfirstExistingBase", ("Vuna.Compiler.Frontend.Packages.Pkg.firstExistingBase", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:503"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dhasManifest", ("Vuna.Compiler.Frontend.Packages.Pkg.hasManifest", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:489"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPath", ("Vuna.Compiler.Frontend.Packages.Pkg.joinPath", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:155"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_djoinPathsText", ("Vuna.Compiler.Frontend.Packages.Pkg.joinPathsText", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:158"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadDependencyList", ("Vuna.Compiler.Frontend.Packages.Pkg.loadDependencyList", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:267"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadManifestAt", ("Vuna.Compiler.Frontend.Packages.Pkg.loadManifestAt", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:165"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadMembers", ("Vuna.Compiler.Frontend.Packages.Pkg.loadMembers", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:382"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadOneDependency", ("Vuna.Compiler.Frontend.Packages.Pkg.loadOneDependency", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:283"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackage", ("Vuna.Compiler.Frontend.Packages.Pkg.loadPackage", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:371"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadPackageWalk", ("Vuna.Compiler.Frontend.Packages.Pkg.loadPackageWalk", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:304"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dloadStoreDependency", ("Vuna.Compiler.Frontend.Packages.Pkg.loadStoreDependency", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:215"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dlocateBase", ("Vuna.Compiler.Frontend.Packages.Pkg.locateBase", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:511"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dlookupPackageDir", ("Vuna.Compiler.Frontend.Packages.Pkg.lookupPackageDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:343"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmanifestNameString", ("Vuna.Compiler.Frontend.Packages.Pkg.manifestNameString", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:179"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmemStackDir", ("Vuna.Compiler.Frontend.Packages.Pkg.memStackDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:186"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dmismatchMessage", ("Vuna.Compiler.Frontend.Packages.Pkg.mismatchMessage", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:208"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeAcc", ("Vuna.Compiler.Frontend.Packages.Pkg.normalizeAcc", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:124"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dnormalizeDir", ("Vuna.Compiler.Frontend.Packages.Pkg.normalizeDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:138"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageContext", ("Vuna.Compiler.Frontend.Packages.Pkg.packageContext", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:447"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDependencies", ("Vuna.Compiler.Frontend.Packages.Pkg.packageDependencies", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:45"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageDir", ("Vuna.Compiler.Frontend.Packages.Pkg.packageDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:97"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageEntry", ("Vuna.Compiler.Frontend.Packages.Pkg.packageEntry", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:443"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageExports", ("Vuna.Compiler.Frontend.Packages.Pkg.packageExports", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:105"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageLayers", ("Vuna.Compiler.Frontend.Packages.Pkg.packageLayers", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:108"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageName", ("Vuna.Compiler.Frontend.Packages.Pkg.packageName", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:100"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpackageRoots", ("Vuna.Compiler.Frontend.Packages.Pkg.packageRoots", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:434"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dpkgFuelBound", ("Vuna.Compiler.Frontend.Packages.Pkg.pkgFuelBound", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:367"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootDir", ("Vuna.Compiler.Frontend.Packages.Pkg.rootDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:63"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootLayers", ("Vuna.Compiler.Frontend.Packages.Pkg.rootLayers", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:69"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootName", ("Vuna.Compiler.Frontend.Packages.Pkg.rootName", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:66"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_drootPackage", ("Vuna.Compiler.Frontend.Packages.Pkg.rootPackage", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:73"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitOnSlash", ("Vuna.Compiler.Frontend.Packages.Pkg.splitOnSlash", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:118"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dsplitSlashChars", ("Vuna.Compiler.Frontend.Packages.Pkg.splitSlashChars", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:112"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dverifyIdentityEff", ("Vuna.Compiler.Frontend.Packages.Pkg.verifyIdentityEff", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:240"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dverifyPathHashEff", ("Vuna.Compiler.Frontend.Packages.Pkg.verifyPathHashEff", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:254"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dPkg_dworkspacePackages", ("Vuna.Compiler.Frontend.Packages.Pkg.workspacePackages", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:398"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcollectDirFiles", ("Vuna.Compiler.Frontend.Packages.Source.collectDirFiles", "Vuna/Compiler/Frontend/Packages/Source.vuna:61"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcollectNames", ("Vuna.Compiler.Frontend.Packages.Source.collectNames", "Vuna/Compiler/Frontend/Packages/Source.vuna:74"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dcontentHashOf", ("Vuna.Compiler.Frontend.Packages.Source.contentHashOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:134"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_ddepKeyOf", ("Vuna.Compiler.Frontend.Packages.Source.depKeyOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:125"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dexportsOf", ("Vuna.Compiler.Frontend.Packages.Source.exportsOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:118"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dfilePathLe", ("Vuna.Compiler.Frontend.Packages.Source.filePathLe", "Vuna/Compiler/Frontend/Packages/Source.vuna:100"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_didentityHashOf", ("Vuna.Compiler.Frontend.Packages.Source.identityHashOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:138"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dnormalizeHash", ("Vuna.Compiler.Frontend.Packages.Source.normalizeHash", "Vuna/Compiler/Frontend/Packages/Source.vuna:37"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpackageFilesEff", ("Vuna.Compiler.Frontend.Packages.Source.packageFilesEff", "Vuna/Compiler/Frontend/Packages/Source.vuna:45"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpackageNameOf", ("Vuna.Compiler.Frontend.Packages.Source.packageNameOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:113"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dpackageSourceEff", ("Vuna.Compiler.Frontend.Packages.Source.packageSourceEff", "Vuna/Compiler/Frontend/Packages/Source.vuna:107"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dreadManifestFile", ("Vuna.Compiler.Frontend.Packages.Source.readManifestFile", "Vuna/Compiler/Frontend/Packages/Source.vuna:53"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dskipSourceDir", ("Vuna.Compiler.Frontend.Packages.Source.skipSourceDir", "Vuna/Compiler/Frontend/Packages/Source.vuna:24"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dsortByPath", ("Vuna.Compiler.Frontend.Packages.Source.sortByPath", "Vuna/Compiler/Frontend/Packages/Source.vuna:103"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dverifyHash", ("Vuna.Compiler.Frontend.Packages.Source.verifyHash", "Vuna/Compiler/Frontend/Packages/Source.vuna:41"));
  ("v_Vuna_dCompiler_dFrontend_dPackages_dSource_dwalkName", ("Vuna.Compiler.Frontend.Packages.Source.walkName", "Vuna/Compiler/Frontend/Packages/Source.vuna:82"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dadvance", ("Vuna.Compiler.Frontend.Parser.Support.advance", "Vuna/Compiler/Frontend/Parser/Support.vuna:74"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_datKw", ("Vuna.Compiler.Frontend.Parser.Support.atKw", "Vuna/Compiler/Frontend/Parser/Support.vuna:156"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_datSym", ("Vuna.Compiler.Frontend.Parser.Support.atSym", "Vuna/Compiler/Frontend/Parser/Support.vuna:115"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbadCaseIndent", ("Vuna.Compiler.Frontend.Parser.Support.badCaseIndent", "Vuna/Compiler/Frontend/Parser/Support.vuna:322"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderHead", ("Vuna.Compiler.Frontend.Parser.Support.binderHead", "Vuna/Compiler/Frontend/Parser/Support.vuna:131"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dbinderNameTail", ("Vuna.Compiler.Frontend.Parser.Support.binderNameTail", "Vuna/Compiler/Frontend/Parser/Support.vuna:142"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcanContinue", ("Vuna.Compiler.Frontend.Parser.Support.canContinue", "Vuna/Compiler/Frontend/Parser/Support.vuna:161"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcloseParenNext", ("Vuna.Compiler.Frontend.Parser.Support.closeParenNext", "Vuna/Compiler/Frontend/Parser/Support.vuna:284"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dcountArrows", ("Vuna.Compiler.Frontend.Parser.Support.countArrows", "Vuna/Compiler/Frontend/Parser/Support.vuna:308"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dctorPatternStart", ("Vuna.Compiler.Frontend.Parser.Support.ctorPatternStart", "Vuna/Compiler/Frontend/Parser/Support.vuna:210"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectIdent", ("Vuna.Compiler.Frontend.Parser.Support.expectIdent", "Vuna/Compiler/Frontend/Parser/Support.vuna:178"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectKw", ("Vuna.Compiler.Frontend.Parser.Support.expectKw", "Vuna/Compiler/Frontend/Parser/Support.vuna:173"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectSym", ("Vuna.Compiler.Frontend.Parser.Support.expectSym", "Vuna/Compiler/Frontend/Parser/Support.vuna:168"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dexpectValueName", ("Vuna.Compiler.Frontend.Parser.Support.expectValueName", "Vuna/Compiler/Frontend/Parser/Support.vuna:185"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dfileOf", ("Vuna.Compiler.Frontend.Parser.Support.fileOf", "Vuna/Compiler/Frontend/Parser/Support.vuna:32"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dholeAtomAt", ("Vuna.Compiler.Frontend.Parser.Support.holeAtomAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:231"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_disEof", ("Vuna.Compiler.Frontend.Parser.Support.isEof", "Vuna/Compiler/Frontend/Parser/Support.vuna:80"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_disReservedValueName", ("Vuna.Compiler.Frontend.Parser.Support.isReservedValueName", "Vuna/Compiler/Frontend/Parser/Support.vuna:279"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_disSyntaxSym", ("Vuna.Compiler.Frontend.Parser.Support.isSyntaxSym", "Vuna/Compiler/Frontend/Parser/Support.vuna:253"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dlastPos", ("Vuna.Compiler.Frontend.Parser.Support.lastPos", "Vuna/Compiler/Frontend/Parser/Support.vuna:71"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dminusLiteralAt", ("Vuna.Compiler.Frontend.Parser.Support.minusLiteralAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:302"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dmkState", ("Vuna.Compiler.Frontend.Parser.Support.mkState", "Vuna/Compiler/Frontend/Parser/Support.vuna:40"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dmkStateAt", ("Vuna.Compiler.Frontend.Parser.Support.mkStateAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:44"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dnthTok", ("Vuna.Compiler.Frontend.Parser.Support.nthTok", "Vuna/Compiler/Frontend/Parser/Support.vuna:121"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekPos", ("Vuna.Compiler.Frontend.Parser.Support.peekPos", "Vuna/Compiler/Frontend/Parser/Support.vuna:57"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTok", ("Vuna.Compiler.Frontend.Parser.Support.peekTok", "Vuna/Compiler/Frontend/Parser/Support.vuna:53"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpeekTokAt", ("Vuna.Compiler.Frontend.Parser.Support.peekTokAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:125"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dpmodeOf", ("Vuna.Compiler.Frontend.Parser.Support.pmodeOf", "Vuna/Compiler/Frontend/Parser/Support.vuna:36"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dquantifiedHead", ("Vuna.Compiler.Frontend.Parser.Support.quantifiedHead", "Vuna/Compiler/Frontend/Parser/Support.vuna:149"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsameLineState", ("Vuna.Compiler.Frontend.Parser.Support.sameLineState", "Vuna/Compiler/Frontend/Parser/Support.vuna:111"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dsectionOpAt", ("Vuna.Compiler.Frontend.Parser.Support.sectionOpAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:292"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dspanOf", ("Vuna.Compiler.Frontend.Parser.Support.spanOf", "Vuna/Compiler/Frontend/Parser/Support.vuna:48"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsAtom", ("Vuna.Compiler.Frontend.Parser.Support.startsAtom", "Vuna/Compiler/Frontend/Parser/Support.vuna:213"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstartsPatternAtom", ("Vuna.Compiler.Frontend.Parser.Support.startsPatternAtom", "Vuna/Compiler/Frontend/Parser/Support.vuna:241"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dstateFuel", ("Vuna.Compiler.Frontend.Parser.Support.stateFuel", "Vuna/Compiler/Frontend/Parser/Support.vuna:108"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dterminatesExpression", ("Vuna.Compiler.Frontend.Parser.Support.terminatesExpression", "Vuna/Compiler/Frontend/Parser/Support.vuna:313"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dtokSpan", ("Vuna.Compiler.Frontend.Parser.Support.tokSpan", "Vuna/Compiler/Frontend/Parser/Support.vuna:62"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dunderscoreCtorName", ("Vuna.Compiler.Frontend.Parser.Support.underscoreCtorName", "Vuna/Compiler/Frontend/Parser/Support.vuna:202"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dSupport_dupperFirst", ("Vuna.Compiler.Frontend.Parser.Support.upperFirst", "Vuna/Compiler/Frontend/Parser/Support.vuna:195"));
  ("v_Vuna_dCompiler_dFrontend_dParser_daddParsedDecl", ("Vuna.Compiler.Frontend.Parser.addParsedDecl", "Vuna/Compiler/Frontend/Parser.vuna:211"));
  ("v_Vuna_dCompiler_dFrontend_dParser_danyDottedName", ("Vuna.Compiler.Frontend.Parser.anyDottedName", "Vuna/Compiler/Frontend/Parser.vuna:1298"));
  ("v_Vuna_dCompiler_dFrontend_dParser_datIdentName", ("Vuna.Compiler.Frontend.Parser.atIdentName", "Vuna/Compiler/Frontend/Parser.vuna:880"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dbindingBindsGo", ("Vuna.Compiler.Frontend.Parser.bindingBindsGo", "Vuna/Compiler/Frontend/Parser.vuna:741"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dbindingItemsToBinds", ("Vuna.Compiler.Frontend.Parser.bindingItemsToBinds", "Vuna/Compiler/Frontend/Parser.vuna:738"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dbindingSigOf", ("Vuna.Compiler.Frontend.Parser.bindingSigOf", "Vuna/Compiler/Frontend/Parser.vuna:782"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dcheckBindersAt", ("Vuna.Compiler.Frontend.Parser.checkBindersAt", "Vuna/Compiler/Frontend/Parser.vuna:1645"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dcheckNoRepeatedBinders", ("Vuna.Compiler.Frontend.Parser.checkNoRepeatedBinders", "Vuna/Compiler/Frontend/Parser.vuna:1650"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dconsumeQty", ("Vuna.Compiler.Frontend.Parser.consumeQty", "Vuna/Compiler/Frontend/Parser.vuna:1303"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dctxThenSplit", ("Vuna.Compiler.Frontend.Parser.ctxThenSplit", "Vuna/Compiler/Frontend/Parser.vuna:969"));
  ("v_Vuna_dCompiler_dFrontend_dParser_demptyDeclAcc", ("Vuna.Compiler.Frontend.Parser.emptyDeclAcc", "Vuna/Compiler/Frontend/Parser.vuna:53"));
  ("v_Vuna_dCompiler_dFrontend_dParser_demptyParsedDecl", ("Vuna.Compiler.Frontend.Parser.emptyParsedDecl", "Vuna/Compiler/Frontend/Parser.vuna:62"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dexpectDeclName", ("Vuna.Compiler.Frontend.Parser.expectDeclName", "Vuna/Compiler/Frontend/Parser.vuna:551"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dexpectFixityLevel", ("Vuna.Compiler.Frontend.Parser.expectFixityLevel", "Vuna/Compiler/Frontend/Parser.vuna:565"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dexpectOpName", ("Vuna.Compiler.Frontend.Parser.expectOpName", "Vuna/Compiler/Frontend/Parser.vuna:572"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dexportItemOf", ("Vuna.Compiler.Frontend.Parser.exportItemOf", "Vuna/Compiler/Frontend/Parser.vuna:127"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dexportMarkerFollows", ("Vuna.Compiler.Frontend.Parser.exportMarkerFollows", "Vuna/Compiler/Frontend/Parser.vuna:272"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dexportStart", ("Vuna.Compiler.Frontend.Parser.exportStart", "Vuna/Compiler/Frontend/Parser.vuna:267"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfinishAsPattern", ("Vuna.Compiler.Frontend.Parser.finishAsPattern", "Vuna/Compiler/Frontend/Parser.vuna:1731"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfirstDanglingSig", ("Vuna.Compiler.Frontend.Parser.firstDanglingSig", "Vuna/Compiler/Frontend/Parser.vuna:791"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfirstOtherKName", ("Vuna.Compiler.Frontend.Parser.firstOtherKName", "Vuna/Compiler/Frontend/Parser.vuna:1532"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfirstRepeatedBinding", ("Vuna.Compiler.Frontend.Parser.firstRepeatedBinding", "Vuna/Compiler/Frontend/Parser.vuna:1632"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfirstRepeatedBindingGo", ("Vuna.Compiler.Frontend.Parser.firstRepeatedBindingGo", "Vuna/Compiler/Frontend/Parser.vuna:1636"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfoldCons", ("Vuna.Compiler.Frontend.Parser.foldCons", "Vuna/Compiler/Frontend/Parser.vuna:1346"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfoldPCon", ("Vuna.Compiler.Frontend.Parser.foldPCon", "Vuna/Compiler/Frontend/Parser.vuna:1788"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dfoldPiNames", ("Vuna.Compiler.Frontend.Parser.foldPiNames", "Vuna/Compiler/Frontend/Parser.vuna:1293"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleAlt", ("Vuna.Compiler.Frontend.Parser.handleAlt", "Vuna/Compiler/Frontend/Parser.vuna:1540"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleExpr", ("Vuna.Compiler.Frontend.Parser.handleExpr", "Vuna/Compiler/Frontend/Parser.vuna:1554"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleOpBinder", ("Vuna.Compiler.Frontend.Parser.handleOpBinder", "Vuna/Compiler/Frontend/Parser.vuna:1440"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleOpKName", ("Vuna.Compiler.Frontend.Parser.handleOpKName", "Vuna/Compiler/Frontend/Parser.vuna:1528"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleOpLam", ("Vuna.Compiler.Frontend.Parser.handleOpLam", "Vuna/Compiler/Frontend/Parser.vuna:1549"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleOpTail", ("Vuna.Compiler.Frontend.Parser.handleOpTail", "Vuna/Compiler/Frontend/Parser.vuna:1521"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhandleRetExpr", ("Vuna.Compiler.Frontend.Parser.handleRetExpr", "Vuna/Compiler/Frontend/Parser.vuna:1544"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dhasBindingSig", ("Vuna.Compiler.Frontend.Parser.hasBindingSig", "Vuna/Compiler/Frontend/Parser.vuna:786"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dholeSpan", ("Vuna.Compiler.Frontend.Parser.holeSpan", "Vuna/Compiler/Frontend/Parser.vuna:1246"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dinnermostPiCod", ("Vuna.Compiler.Frontend.Parser.innermostPiCod", "Vuna/Compiler/Frontend/Parser.vuna:974"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dinstanceMethodStart", ("Vuna.Compiler.Frontend.Parser.instanceMethodStart", "Vuna/Compiler/Frontend/Parser.vuna:1013"));
  ("v_Vuna_dCompiler_dFrontend_dParser_disReturnClauseHead", ("Vuna.Compiler.Frontend.Parser.isReturnClauseHead", "Vuna/Compiler/Frontend/Parser.vuna:1476"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dlocalFunMerge", ("Vuna.Compiler.Frontend.Parser.localFunMerge", "Vuna/Compiler/Frontend/Parser.vuna:765"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dmacroAtom", ("Vuna.Compiler.Frontend.Parser.macroAtom", "Vuna/Compiler/Frontend/Parser.vuna:1158"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dmacroBangAt", ("Vuna.Compiler.Frontend.Parser.macroBangAt", "Vuna/Compiler/Frontend/Parser.vuna:1152"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dopacityGiven", ("Vuna.Compiler.Frontend.Parser.opacityGiven", "Vuna/Compiler/Frontend/Parser.vuna:336"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dopacitySpecOf", ("Vuna.Compiler.Frontend.Parser.opacitySpecOf", "Vuna/Compiler/Frontend/Parser.vuna:340"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dopacityStart", ("Vuna.Compiler.Frontend.Parser.opacityStart", "Vuna/Compiler/Frontend/Parser.vuna:294"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparenIsMemberList", ("Vuna.Compiler.Frontend.Parser.parenIsMemberList", "Vuna/Compiler/Frontend/Parser.vuna:530"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseAltList", ("Vuna.Compiler.Frontend.Parser.parseAltList", "Vuna/Compiler/Frontend/Parser.vuna:1398"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseApplication", ("Vuna.Compiler.Frontend.Parser.parseApplication", "Vuna/Compiler/Frontend/Parser.vuna:1099"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseArgs", ("Vuna.Compiler.Frontend.Parser.parseArgs", "Vuna/Compiler/Frontend/Parser.vuna:1128"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseAsName", ("Vuna.Compiler.Frontend.Parser.parseAsName", "Vuna/Compiler/Frontend/Parser.vuna:1745"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseAtPayload", ("Vuna.Compiler.Frontend.Parser.parseAtPayload", "Vuna/Compiler/Frontend/Parser.vuna:1115"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseAtom", ("Vuna.Compiler.Frontend.Parser.parseAtom", "Vuna/Compiler/Frontend/Parser.vuna:1135"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseAtomBase", ("Vuna.Compiler.Frontend.Parser.parseAtomBase", "Vuna/Compiler/Frontend/Parser.vuna:1162"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseAxiom", ("Vuna.Compiler.Frontend.Parser.parseAxiom", "Vuna/Compiler/Frontend/Parser.vuna:616"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseAxiomExport", ("Vuna.Compiler.Frontend.Parser.parseAxiomExport", "Vuna/Compiler/Frontend/Parser.vuna:368"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseBindingDef", ("Vuna.Compiler.Frontend.Parser.parseBindingDef", "Vuna/Compiler/Frontend/Parser.vuna:718"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseBindingItem", ("Vuna.Compiler.Frontend.Parser.parseBindingItem", "Vuna/Compiler/Frontend/Parser.vuna:707"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseBindingItemsAt", ("Vuna.Compiler.Frontend.Parser.parseBindingItemsAt", "Vuna/Compiler/Frontend/Parser.vuna:697"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseBindingValue", ("Vuna.Compiler.Frontend.Parser.parseBindingValue", "Vuna/Compiler/Frontend/Parser.vuna:730"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseCase", ("Vuna.Compiler.Frontend.Parser.parseCase", "Vuna/Compiler/Frontend/Parser.vuna:1381"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseCaseAlts", ("Vuna.Compiler.Frontend.Parser.parseCaseAlts", "Vuna/Compiler/Frontend/Parser.vuna:1387"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseClause", ("Vuna.Compiler.Frontend.Parser.parseClause", "Vuna/Compiler/Frontend/Parser.vuna:653"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseClausePatterns", ("Vuna.Compiler.Frontend.Parser.parseClausePatterns", "Vuna/Compiler/Frontend/Parser.vuna:797"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseCtorList", ("Vuna.Compiler.Frontend.Parser.parseCtorList", "Vuna/Compiler/Frontend/Parser.vuna:1037"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseCtors", ("Vuna.Compiler.Frontend.Parser.parseCtors", "Vuna/Compiler/Frontend/Parser.vuna:1032"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseCtxRest", ("Vuna.Compiler.Frontend.Parser.parseCtxRest", "Vuna/Compiler/Frontend/Parser.vuna:983"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseCtxThenExpr", ("Vuna.Compiler.Frontend.Parser.parseCtxThenExpr", "Vuna/Compiler/Frontend/Parser.vuna:960"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseData", ("Vuna.Compiler.Frontend.Parser.parseData", "Vuna/Compiler/Frontend/Parser.vuna:835"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDataExport", ("Vuna.Compiler.Frontend.Parser.parseDataExport", "Vuna/Compiler/Frontend/Parser.vuna:433"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDecl", ("Vuna.Compiler.Frontend.Parser.parseDecl", "Vuna/Compiler/Frontend/Parser.vuna:582"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDecls", ("Vuna.Compiler.Frontend.Parser.parseDecls", "Vuna/Compiler/Frontend/Parser.vuna:191"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDeriving", ("Vuna.Compiler.Frontend.Parser.parseDeriving", "Vuna/Compiler/Frontend/Parser.vuna:887"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDerivingNames", ("Vuna.Compiler.Frontend.Parser.parseDerivingNames", "Vuna/Compiler/Frontend/Parser.vuna:899"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDerivingParens", ("Vuna.Compiler.Frontend.Parser.parseDerivingParens", "Vuna/Compiler/Frontend/Parser.vuna:894"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDo", ("Vuna.Compiler.Frontend.Parser.parseDo", "Vuna/Compiler/Frontend/Parser.vuna:1571"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDoExprStmt", ("Vuna.Compiler.Frontend.Parser.parseDoExprStmt", "Vuna/Compiler/Frontend/Parser.vuna:1605"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDoStmt", ("Vuna.Compiler.Frontend.Parser.parseDoStmt", "Vuna/Compiler/Frontend/Parser.vuna:1596"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseDoStmts", ("Vuna.Compiler.Frontend.Parser.parseDoStmts", "Vuna/Compiler/Frontend/Parser.vuna:1582"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExportDecl", ("Vuna.Compiler.Frontend.Parser.parseExportDecl", "Vuna/Compiler/Frontend/Parser.vuna:302"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExportImport", ("Vuna.Compiler.Frontend.Parser.parseExportImport", "Vuna/Compiler/Frontend/Parser.vuna:134"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExportItem", ("Vuna.Compiler.Frontend.Parser.parseExportItem", "Vuna/Compiler/Frontend/Parser.vuna:98"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExportItems", ("Vuna.Compiler.Frontend.Parser.parseExportItems", "Vuna/Compiler/Frontend/Parser.vuna:87"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExportItemsFrom", ("Vuna.Compiler.Frontend.Parser.parseExportItemsFrom", "Vuna/Compiler/Frontend/Parser.vuna:92"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExportMembers", ("Vuna.Compiler.Frontend.Parser.parseExportMembers", "Vuna/Compiler/Frontend/Parser.vuna:116"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExportedPlain", ("Vuna.Compiler.Frontend.Parser.parseExportedPlain", "Vuna/Compiler/Frontend/Parser.vuna:307"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExportedValue", ("Vuna.Compiler.Frontend.Parser.parseExportedValue", "Vuna/Compiler/Frontend/Parser.vuna:345"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExpr", ("Vuna.Compiler.Frontend.Parser.parseExpr", "Vuna/Compiler/Frontend/Parser.vuna:1046"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExpressionSource", ("Vuna.Compiler.Frontend.Parser.parseExpressionSource", "Vuna/Compiler/Frontend/Parser.vuna:41"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExtern", ("Vuna.Compiler.Frontend.Parser.parseExtern", "Vuna/Compiler/Frontend/Parser.vuna:623"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseExternExport", ("Vuna.Compiler.Frontend.Parser.parseExternExport", "Vuna/Compiler/Frontend/Parser.vuna:376"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseFieldList", ("Vuna.Compiler.Frontend.Parser.parseFieldList", "Vuna/Compiler/Frontend/Parser.vuna:869"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseFieldSuffix", ("Vuna.Compiler.Frontend.Parser.parseFieldSuffix", "Vuna/Compiler/Frontend/Parser.vuna:1142"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseFields", ("Vuna.Compiler.Frontend.Parser.parseFields", "Vuna/Compiler/Frontend/Parser.vuna:863"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseFixityDecl", ("Vuna.Compiler.Frontend.Parser.parseFixityDecl", "Vuna/Compiler/Frontend/Parser.vuna:544"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseFixityOrDecl", ("Vuna.Compiler.Frontend.Parser.parseFixityOrDecl", "Vuna/Compiler/Frontend/Parser.vuna:249"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseHandle", ("Vuna.Compiler.Frontend.Parser.parseHandle", "Vuna/Compiler/Frontend/Parser.vuna:1444"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseHandleBody", ("Vuna.Compiler.Frontend.Parser.parseHandleBody", "Vuna/Compiler/Frontend/Parser.vuna:1464"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseHandleClauses", ("Vuna.Compiler.Frontend.Parser.parseHandleClauses", "Vuna/Compiler/Frontend/Parser.vuna:1482"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseHandleComp", ("Vuna.Compiler.Frontend.Parser.parseHandleComp", "Vuna/Compiler/Frontend/Parser.vuna:1455"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseHandleOpClause", ("Vuna.Compiler.Frontend.Parser.parseHandleOpClause", "Vuna/Compiler/Frontend/Parser.vuna:1507"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseHandleRetClause", ("Vuna.Compiler.Frontend.Parser.parseHandleRetClause", "Vuna/Compiler/Frontend/Parser.vuna:1500"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseIf", ("Vuna.Compiler.Frontend.Parser.parseIf", "Vuna/Compiler/Frontend/Parser.vuna:1563"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseImportAfterKeyword", ("Vuna.Compiler.Frontend.Parser.parseImportAfterKeyword", "Vuna/Compiler/Frontend/Parser.vuna:140"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseImportAlias", ("Vuna.Compiler.Frontend.Parser.parseImportAlias", "Vuna/Compiler/Frontend/Parser.vuna:168"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseImportSpec", ("Vuna.Compiler.Frontend.Parser.parseImportSpec", "Vuna/Compiler/Frontend/Parser.vuna:163"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseImports", ("Vuna.Compiler.Frontend.Parser.parseImports", "Vuna/Compiler/Frontend/Parser.vuna:174"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseInfix", ("Vuna.Compiler.Frontend.Parser.parseInfix", "Vuna/Compiler/Frontend/Parser.vuna:1056"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseInstance", ("Vuna.Compiler.Frontend.Parser.parseInstance", "Vuna/Compiler/Frontend/Parser.vuna:949"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseInstanceBody", ("Vuna.Compiler.Frontend.Parser.parseInstanceBody", "Vuna/Compiler/Frontend/Parser.vuna:991"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseInstanceDecl", ("Vuna.Compiler.Frontend.Parser.parseInstanceDecl", "Vuna/Compiler/Frontend/Parser.vuna:1006"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseInstanceDeclList", ("Vuna.Compiler.Frontend.Parser.parseInstanceDeclList", "Vuna/Compiler/Frontend/Parser.vuna:997"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseInstanceTail", ("Vuna.Compiler.Frontend.Parser.parseInstanceTail", "Vuna/Compiler/Frontend/Parser.vuna:955"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLambda", ("Vuna.Compiler.Frontend.Parser.parseLambda", "Vuna/Compiler/Frontend/Parser.vuna:1350"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLambdaParams", ("Vuna.Compiler.Frontend.Parser.parseLambdaParams", "Vuna/Compiler/Frontend/Parser.vuna:1356"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLet", ("Vuna.Compiler.Frontend.Parser.parseLet", "Vuna/Compiler/Frontend/Parser.vuna:1363"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLetBindings", ("Vuna.Compiler.Frontend.Parser.parseLetBindings", "Vuna/Compiler/Frontend/Parser.vuna:1371"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLhs", ("Vuna.Compiler.Frontend.Parser.parseLhs", "Vuna/Compiler/Frontend/Parser.vuna:1073"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLinearDecl", ("Vuna.Compiler.Frontend.Parser.parseLinearDecl", "Vuna/Compiler/Frontend/Parser.vuna:805"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseLinearExport", ("Vuna.Compiler.Frontend.Parser.parseLinearExport", "Vuna/Compiler/Frontend/Parser.vuna:385"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseListElemAt", ("Vuna.Compiler.Frontend.Parser.parseListElemAt", "Vuna/Compiler/Frontend/Parser.vuna:1338"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseListExpr", ("Vuna.Compiler.Frontend.Parser.parseListExpr", "Vuna/Compiler/Frontend/Parser.vuna:1324"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseListExprElems", ("Vuna.Compiler.Frontend.Parser.parseListExprElems", "Vuna/Compiler/Frontend/Parser.vuna:1330"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseListPattern", ("Vuna.Compiler.Frontend.Parser.parseListPattern", "Vuna/Compiler/Frontend/Parser.vuna:1775"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseListPatternElems", ("Vuna.Compiler.Frontend.Parser.parseListPatternElems", "Vuna/Compiler/Frontend/Parser.vuna:1781"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseMemberNames", ("Vuna.Compiler.Frontend.Parser.parseMemberNames", "Vuna/Compiler/Frontend/Parser.vuna:121"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseMethodSigList", ("Vuna.Compiler.Frontend.Parser.parseMethodSigList", "Vuna/Compiler/Frontend/Parser.vuna:937"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseMethodSigs", ("Vuna.Compiler.Frontend.Parser.parseMethodSigs", "Vuna/Compiler/Frontend/Parser.vuna:931"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseModDecl", ("Vuna.Compiler.Frontend.Parser.parseModDecl", "Vuna/Compiler/Frontend/Parser.vuna:81"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseNegation", ("Vuna.Compiler.Frontend.Parser.parseNegation", "Vuna/Compiler/Frontend/Parser.vuna:1088"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseOpacityDecl", ("Vuna.Compiler.Frontend.Parser.parseOpacityDecl", "Vuna/Compiler/Frontend/Parser.vuna:393"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseOpacityValue", ("Vuna.Compiler.Frontend.Parser.parseOpacityValue", "Vuna/Compiler/Frontend/Parser.vuna:406"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseOptionalMembers", ("Vuna.Compiler.Frontend.Parser.parseOptionalMembers", "Vuna/Compiler/Frontend/Parser.vuna:540"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseParams", ("Vuna.Compiler.Frontend.Parser.parseParams", "Vuna/Compiler/Frontend/Parser.vuna:1024"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePatternAtom", ("Vuna.Compiler.Frontend.Parser.parsePatternAtom", "Vuna/Compiler/Frontend/Parser.vuna:1724"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePatternAtomBase", ("Vuna.Compiler.Frontend.Parser.parsePatternAtomBase", "Vuna/Compiler/Frontend/Parser.vuna:1752"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePatternAtoms", ("Vuna.Compiler.Frontend.Parser.parsePatternAtoms", "Vuna/Compiler/Frontend/Parser.vuna:1717"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePatternCons", ("Vuna.Compiler.Frontend.Parser.parsePatternCons", "Vuna/Compiler/Frontend/Parser.vuna:1663"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePatternHead", ("Vuna.Compiler.Frontend.Parser.parsePatternHead", "Vuna/Compiler/Frontend/Parser.vuna:1669"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePatternSingle", ("Vuna.Compiler.Frontend.Parser.parsePatternSingle", "Vuna/Compiler/Frontend/Parser.vuna:1657"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePerform", ("Vuna.Compiler.Frontend.Parser.parsePerform", "Vuna/Compiler/Frontend/Parser.vuna:1414"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePiBinder", ("Vuna.Compiler.Frontend.Parser.parsePiBinder", "Vuna/Compiler/Frontend/Parser.vuna:1272"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePiNames", ("Vuna.Compiler.Frontend.Parser.parsePiNames", "Vuna/Compiler/Frontend/Parser.vuna:1280"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparsePiNamesRest", ("Vuna.Compiler.Frontend.Parser.parsePiNamesRest", "Vuna/Compiler/Frontend/Parser.vuna:1286"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecord", ("Vuna.Compiler.Frontend.Parser.parseRecord", "Vuna/Compiler/Frontend/Parser.vuna:851"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecordAssignList", ("Vuna.Compiler.Frontend.Parser.parseRecordAssignList", "Vuna/Compiler/Frontend/Parser.vuna:1318"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecordAssignments", ("Vuna.Compiler.Frontend.Parser.parseRecordAssignments", "Vuna/Compiler/Frontend/Parser.vuna:1311"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecordExport", ("Vuna.Compiler.Frontend.Parser.parseRecordExport", "Vuna/Compiler/Frontend/Parser.vuna:452"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecordPatternField", ("Vuna.Compiler.Frontend.Parser.parseRecordPatternField", "Vuna/Compiler/Frontend/Parser.vuna:1705"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecordPatternFields", ("Vuna.Compiler.Frontend.Parser.parseRecordPatternFields", "Vuna/Compiler/Frontend/Parser.vuna:1692"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseRecordPatternList", ("Vuna.Compiler.Frontend.Parser.parseRecordPatternList", "Vuna/Compiler/Frontend/Parser.vuna:1698"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseReexportTail", ("Vuna.Compiler.Frontend.Parser.parseReexportTail", "Vuna/Compiler/Frontend/Parser.vuna:145"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSectionAtom", ("Vuna.Compiler.Frontend.Parser.parseSectionAtom", "Vuna/Compiler/Frontend/Parser.vuna:1263"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSignature", ("Vuna.Compiler.Frontend.Parser.parseSignature", "Vuna/Compiler/Frontend/Parser.vuna:640"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSource", ("Vuna.Compiler.Frontend.Parser.parseSource", "Vuna/Compiler/Frontend/Parser.vuna:35"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSourceFile", ("Vuna.Compiler.Frontend.Parser.parseSourceFile", "Vuna/Compiler/Frontend/Parser.vuna:67"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSourceRecovering", ("Vuna.Compiler.Frontend.Parser.parseSourceRecovering", "Vuna/Compiler/Frontend/Parser.vuna:1795"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSourceRecoveringTokens", ("Vuna.Compiler.Frontend.Parser.parseSourceRecoveringTokens", "Vuna/Compiler/Frontend/Parser.vuna:1802"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseSourceWithComments", ("Vuna.Compiler.Frontend.Parser.parseSourceWithComments", "Vuna/Compiler/Frontend/Parser.vuna:28"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTemplateAtom", ("Vuna.Compiler.Frontend.Parser.parseTemplateAtom", "Vuna/Compiler/Frontend/Parser.vuna:1209"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTemplateHole", ("Vuna.Compiler.Frontend.Parser.parseTemplateHole", "Vuna/Compiler/Frontend/Parser.vuna:1230"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTemplateParts", ("Vuna.Compiler.Frontend.Parser.parseTemplateParts", "Vuna/Compiler/Frontend/Parser.vuna:1217"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTieredDecl", ("Vuna.Compiler.Frontend.Parser.parseTieredDecl", "Vuna/Compiler/Frontend/Parser.vuna:824"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTieredExport", ("Vuna.Compiler.Frontend.Parser.parseTieredExport", "Vuna/Compiler/Frontend/Parser.vuna:424"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTrait", ("Vuna.Compiler.Frontend.Parser.parseTrait", "Vuna/Compiler/Frontend/Parser.vuna:907"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTraitExport", ("Vuna.Compiler.Frontend.Parser.parseTraitExport", "Vuna/Compiler/Frontend/Parser.vuna:469"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTraitExportMembers", ("Vuna.Compiler.Frontend.Parser.parseTraitExportMembers", "Vuna/Compiler/Frontend/Parser.vuna:525"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTraitHead", ("Vuna.Compiler.Frontend.Parser.parseTraitHead", "Vuna/Compiler/Frontend/Parser.vuna:489"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTraitParams", ("Vuna.Compiler.Frontend.Parser.parseTraitParams", "Vuna/Compiler/Frontend/Parser.vuna:919"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTraitSupers", ("Vuna.Compiler.Frontend.Parser.parseTraitSupers", "Vuna/Compiler/Frontend/Parser.vuna:511"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseTraitSupersRest", ("Vuna.Compiler.Frontend.Parser.parseTraitSupersRest", "Vuna/Compiler/Frontend/Parser.vuna:517"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseWhere", ("Vuna.Compiler.Frontend.Parser.parseWhere", "Vuna/Compiler/Frontend/Parser.vuna:676"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dparseWhereBindings", ("Vuna.Compiler.Frontend.Parser.parseWhereBindings", "Vuna/Compiler/Frontend/Parser.vuna:684"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dpatBinderBindings", ("Vuna.Compiler.Frontend.Parser.patBinderBindings", "Vuna/Compiler/Frontend/Parser.vuna:1621"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dpatBoundName", ("Vuna.Compiler.Frontend.Parser.patBoundName", "Vuna/Compiler/Frontend/Parser.vuna:778"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dps0", ("Vuna.Compiler.Frontend.Parser.ps0", "Vuna/Compiler/Frontend/Parser.vuna:17"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dps1", ("Vuna.Compiler.Frontend.Parser.ps1", "Vuna/Compiler/Frontend/Parser.vuna:20"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dpsAt", ("Vuna.Compiler.Frontend.Parser.psAt", "Vuna/Compiler/Frontend/Parser.vuna:23"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dqualifyExportItem", ("Vuna.Compiler.Frontend.Parser.qualifyExportItem", "Vuna/Compiler/Frontend/Parser.vuna:157"));
  ("v_Vuna_dCompiler_dFrontend_dParser_drecoverDecl", ("Vuna.Compiler.Frontend.Parser.recoverDecl", "Vuna/Compiler/Frontend/Parser.vuna:233"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dreexportPrefix", ("Vuna.Compiler.Frontend.Parser.reexportPrefix", "Vuna/Compiler/Frontend/Parser.vuna:152"));
  ("v_Vuna_dCompiler_dFrontend_dParser_drejectCtxSuffix", ("Vuna.Compiler.Frontend.Parser.rejectCtxSuffix", "Vuna/Compiler/Frontend/Parser.vuna:635"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dreplacePiCod", ("Vuna.Compiler.Frontend.Parser.replacePiCod", "Vuna/Compiler/Frontend/Parser.vuna:978"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dreverseDeclAcc", ("Vuna.Compiler.Frontend.Parser.reverseDeclAcc", "Vuna/Compiler/Frontend/Parser.vuna:228"));
  ("v_Vuna_dCompiler_dFrontend_dParser_drowAtNameExpr", ("Vuna.Compiler.Frontend.Parser.rowAtNameExpr", "Vuna/Compiler/Frontend/Parser.vuna:1408"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dskipFrom", ("Vuna.Compiler.Frontend.Parser.skipFrom", "Vuna/Compiler/Frontend/Parser.vuna:243"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dskipToDeclLine", ("Vuna.Compiler.Frontend.Parser.skipToDeclLine", "Vuna/Compiler/Frontend/Parser.vuna:239"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dspanFromExpr", ("Vuna.Compiler.Frontend.Parser.spanFromExpr", "Vuna/Compiler/Frontend/Parser.vuna:1121"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dtextPartsOf", ("Vuna.Compiler.Frontend.Parser.textPartsOf", "Vuna/Compiler/Frontend/Parser.vuna:1254"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dtierFollows", ("Vuna.Compiler.Frontend.Parser.tierFollows", "Vuna/Compiler/Frontend/Parser.vuna:814"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dtoksFuel", ("Vuna.Compiler.Frontend.Parser.toksFuel", "Vuna/Compiler/Frontend/Parser.vuna:1250"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dtraitSupersFollow", ("Vuna.Compiler.Frontend.Parser.traitSupersFollow", "Vuna/Compiler/Frontend/Parser.vuna:499"));
  ("v_Vuna_dCompiler_dFrontend_dParser_dtraitSupersFollowGo", ("Vuna.Compiler.Frontend.Parser.traitSupersFollowGo", "Vuna/Compiler/Frontend/Parser.vuna:502"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dTomlDoc", ("Vuna.Compiler.Frontend.Toml.TomlDoc", "Vuna/Compiler/Frontend/Toml.vuna:46"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dadvanceChars", ("Vuna.Compiler.Frontend.Toml.advanceChars", "Vuna/Compiler/Frontend/Toml.vuna:137"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dadvanceCursor", ("Vuna.Compiler.Frontend.Toml.advanceCursor", "Vuna/Compiler/Frontend/Toml.vuna:99"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dafterDoubleBracket", ("Vuna.Compiler.Frontend.Toml.afterDoubleBracket", "Vuna/Compiler/Frontend/Toml.vuna:764"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dafterSingleBracket", ("Vuna.Compiler.Frontend.Toml.afterSingleBracket", "Vuna/Compiler/Frontend/Toml.vuna:744"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dappendPath", ("Vuna.Compiler.Frontend.Toml.appendPath", "Vuna/Compiler/Frontend/Toml.vuna:153"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dappendTableArray", ("Vuna.Compiler.Frontend.Toml.appendTableArray", "Vuna/Compiler/Frontend/Toml.vuna:224"));
  ("v_Vuna_dCompiler_dFrontend_dToml_darrayStrings", ("Vuna.Compiler.Frontend.Toml.arrayStrings", "Vuna/Compiler/Frontend/Toml.vuna:846"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dchildSectionOf", ("Vuna.Compiler.Frontend.Toml.childSectionOf", "Vuna/Compiler/Frontend/Toml.vuna:879"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dcollectBareKey", ("Vuna.Compiler.Frontend.Toml.collectBareKey", "Vuna/Compiler/Frontend/Toml.vuna:522"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dcountLines", ("Vuna.Compiler.Frontend.Toml.countLines", "Vuna/Compiler/Frontend/Toml.vuna:87"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dcursorFuel", ("Vuna.Compiler.Frontend.Toml.cursorFuel", "Vuna/Compiler/Frontend/Toml.vuna:80"));
  ("v_Vuna_dCompiler_dFrontend_dToml_ddropChars", ("Vuna.Compiler.Frontend.Toml.dropChars", "Vuna/Compiler/Frontend/Toml.vuna:130"));
  ("v_Vuna_dCompiler_dFrontend_dToml_ddropFirstNewline", ("Vuna.Compiler.Frontend.Toml.dropFirstNewline", "Vuna/Compiler/Frontend/Toml.vuna:462"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dduplicateKeyMsg", ("Vuna.Compiler.Frontend.Toml.duplicateKeyMsg", "Vuna/Compiler/Frontend/Toml.vuna:260"));
  ("v_Vuna_dCompiler_dFrontend_dToml_densureTable", ("Vuna.Compiler.Frontend.Toml.ensureTable", "Vuna/Compiler/Frontend/Toml.vuna:194"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dexpectEol", ("Vuna.Compiler.Frontend.Toml.expectEol", "Vuna/Compiler/Frontend/Toml.vuna:715"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dexpectEolAfterComment", ("Vuna.Compiler.Frontend.Toml.expectEolAfterComment", "Vuna/Compiler/Frontend/Toml.vuna:724"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dfailAt", ("Vuna.Compiler.Frontend.Toml.failAt", "Vuna/Compiler/Frontend/Toml.vuna:150"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dfieldValues", ("Vuna.Compiler.Frontend.Toml.fieldValues", "Vuna/Compiler/Frontend/Toml.vuna:331"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dfinishInteger", ("Vuna.Compiler.Frontend.Toml.finishInteger", "Vuna/Compiler/Frontend/Toml.vuna:682"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dflattenElems", ("Vuna.Compiler.Frontend.Toml.flattenElems", "Vuna/Compiler/Frontend/Toml.vuna:306"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dflattenFields", ("Vuna.Compiler.Frontend.Toml.flattenFields", "Vuna/Compiler/Frontend/Toml.vuna:295"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dflattenFuel", ("Vuna.Compiler.Frontend.Toml.flattenFuel", "Vuna/Compiler/Frontend/Toml.vuna:96"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dflattenLeaf", ("Vuna.Compiler.Frontend.Toml.flattenLeaf", "Vuna/Compiler/Frontend/Toml.vuna:313"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dflattenLeafFields", ("Vuna.Compiler.Frontend.Toml.flattenLeafFields", "Vuna/Compiler/Frontend/Toml.vuna:319"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dflattenNode", ("Vuna.Compiler.Frontend.Toml.flattenNode", "Vuna/Compiler/Frontend/Toml.vuna:301"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dhexValue", ("Vuna.Compiler.Frontend.Toml.hexValue", "Vuna/Compiler/Frontend/Toml.vuna:123"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dinsertValue", ("Vuna.Compiler.Frontend.Toml.insertValue", "Vuna/Compiler/Frontend/Toml.vuna:266"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disAlphaChar", ("Vuna.Compiler.Frontend.Toml.isAlphaChar", "Vuna/Compiler/Frontend/Toml.vuna:114"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disBareKeyChar", ("Vuna.Compiler.Frontend.Toml.isBareKeyChar", "Vuna/Compiler/Frontend/Toml.vuna:117"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disBlankChar", ("Vuna.Compiler.Frontend.Toml.isBlankChar", "Vuna/Compiler/Frontend/Toml.vuna:126"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disDigitChar", ("Vuna.Compiler.Frontend.Toml.isDigitChar", "Vuna/Compiler/Frontend/Toml.vuna:105"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disHexDigit", ("Vuna.Compiler.Frontend.Toml.isHexDigit", "Vuna/Compiler/Frontend/Toml.vuna:120"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disLowerAlphaChar", ("Vuna.Compiler.Frontend.Toml.isLowerAlphaChar", "Vuna/Compiler/Frontend/Toml.vuna:111"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disSurrogate", ("Vuna.Compiler.Frontend.Toml.isSurrogate", "Vuna/Compiler/Frontend/Toml.vuna:384"));
  ("v_Vuna_dCompiler_dFrontend_dToml_disUpperAlphaChar", ("Vuna.Compiler.Frontend.Toml.isUpperAlphaChar", "Vuna/Compiler/Frontend/Toml.vuna:108"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dkindIsDotted", ("Vuna.Compiler.Frontend.Toml.kindIsDotted", "Vuna/Compiler/Frontend/Toml.vuna:188"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dkindIsExplicit", ("Vuna.Compiler.Frontend.Toml.kindIsExplicit", "Vuna/Compiler/Frontend/Toml.vuna:184"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dlastNode", ("Vuna.Compiler.Frontend.Toml.lastNode", "Vuna/Compiler/Frontend/Toml.vuna:174"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dlenInt", ("Vuna.Compiler.Frontend.Toml.lenInt", "Vuna/Compiler/Frontend/Toml.vuna:75"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dlineFuel", ("Vuna.Compiler.Frontend.Toml.lineFuel", "Vuna/Compiler/Frontend/Toml.vuna:84"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dlookupEntry", ("Vuna.Compiler.Frontend.Toml.lookupEntry", "Vuna/Compiler/Frontend/Toml.vuna:853"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dlookupEntryLine", ("Vuna.Compiler.Frontend.Toml.lookupEntryLine", "Vuna/Compiler/Frontend/Toml.vuna:858"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dlookupField", ("Vuna.Compiler.Frontend.Toml.lookupField", "Vuna/Compiler/Frontend/Toml.vuna:164"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dmakeInteger", ("Vuna.Compiler.Frontend.Toml.makeInteger", "Vuna/Compiler/Frontend/Toml.vuna:691"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dmatchChars", ("Vuna.Compiler.Frontend.Toml.matchChars", "Vuna/Compiler/Frontend/Toml.vuna:701"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dmatchWord", ("Vuna.Compiler.Frontend.Toml.matchWord", "Vuna/Compiler/Frontend/Toml.vuna:707"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dnodeFields", ("Vuna.Compiler.Frontend.Toml.nodeFields", "Vuna/Compiler/Frontend/Toml.vuna:340"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dnodeValue", ("Vuna.Compiler.Frontend.Toml.nodeValue", "Vuna/Compiler/Frontend/Toml.vuna:326"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseArrayItems", ("Vuna.Compiler.Frontend.Toml.parseArrayItems", "Vuna/Compiler/Frontend/Toml.vuna:614"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseArrayValue", ("Vuna.Compiler.Frontend.Toml.parseArrayValue", "Vuna/Compiler/Frontend/Toml.vuna:608"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseBareKey", ("Vuna.Compiler.Frontend.Toml.parseBareKey", "Vuna/Compiler/Frontend/Toml.vuna:528"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseBasicChars", ("Vuna.Compiler.Frontend.Toml.parseBasicChars", "Vuna/Compiler/Frontend/Toml.vuna:394"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseBasicEscape", ("Vuna.Compiler.Frontend.Toml.parseBasicEscape", "Vuna/Compiler/Frontend/Toml.vuna:404"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseBasicString", ("Vuna.Compiler.Frontend.Toml.parseBasicString", "Vuna/Compiler/Frontend/Toml.vuna:389"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseBracketLine", ("Vuna.Compiler.Frontend.Toml.parseBracketLine", "Vuna/Compiler/Frontend/Toml.vuna:814"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseEntryValue", ("Vuna.Compiler.Frontend.Toml.parseEntryValue", "Vuna/Compiler/Frontend/Toml.vuna:775"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseHexCode", ("Vuna.Compiler.Frontend.Toml.parseHexCode", "Vuna/Compiler/Frontend/Toml.vuna:430"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseInlineFields", ("Vuna.Compiler.Frontend.Toml.parseInlineFields", "Vuna/Compiler/Frontend/Toml.vuna:639"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseInlineTable", ("Vuna.Compiler.Frontend.Toml.parseInlineTable", "Vuna/Compiler/Frontend/Toml.vuna:633"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseIntValue", ("Vuna.Compiler.Frontend.Toml.parseIntValue", "Vuna/Compiler/Frontend/Toml.vuna:695"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseInteger", ("Vuna.Compiler.Frontend.Toml.parseInteger", "Vuna/Compiler/Frontend/Toml.vuna:665"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseIntegerDigits", ("Vuna.Compiler.Frontend.Toml.parseIntegerDigits", "Vuna/Compiler/Frontend/Toml.vuna:673"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseKeyLine", ("Vuna.Compiler.Frontend.Toml.parseKeyLine", "Vuna/Compiler/Frontend/Toml.vuna:788"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseKeyPath", ("Vuna.Compiler.Frontend.Toml.parseKeyPath", "Vuna/Compiler/Frontend/Toml.vuna:551"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseKeySegment", ("Vuna.Compiler.Frontend.Toml.parseKeySegment", "Vuna/Compiler/Frontend/Toml.vuna:536"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseKeySegments", ("Vuna.Compiler.Frontend.Toml.parseKeySegments", "Vuna/Compiler/Frontend/Toml.vuna:554"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralChars", ("Vuna.Compiler.Frontend.Toml.parseLiteralChars", "Vuna/Compiler/Frontend/Toml.vuna:445"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseLiteralString", ("Vuna.Compiler.Frontend.Toml.parseLiteralString", "Vuna/Compiler/Frontend/Toml.vuna:440"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasic", ("Vuna.Compiler.Frontend.Toml.parseMultilineBasic", "Vuna/Compiler/Frontend/Toml.vuna:456"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineBasicChars", ("Vuna.Compiler.Frontend.Toml.parseMultilineBasicChars", "Vuna/Compiler/Frontend/Toml.vuna:467"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineEscape", ("Vuna.Compiler.Frontend.Toml.parseMultilineEscape", "Vuna/Compiler/Frontend/Toml.vuna:482"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteral", ("Vuna.Compiler.Frontend.Toml.parseMultilineLiteral", "Vuna/Compiler/Frontend/Toml.vuna:502"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineLiteralChars", ("Vuna.Compiler.Frontend.Toml.parseMultilineLiteralChars", "Vuna/Compiler/Frontend/Toml.vuna:508"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseMultilineValue", ("Vuna.Compiler.Frontend.Toml.parseMultilineValue", "Vuna/Compiler/Frontend/Toml.vuna:596"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseSectionLine", ("Vuna.Compiler.Frontend.Toml.parseSectionLine", "Vuna/Compiler/Frontend/Toml.vuna:733"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseSingleStringValue", ("Vuna.Compiler.Frontend.Toml.parseSingleStringValue", "Vuna/Compiler/Frontend/Toml.vuna:585"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseTableArrayLine", ("Vuna.Compiler.Frontend.Toml.parseTableArrayLine", "Vuna/Compiler/Frontend/Toml.vuna:753"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseToml", ("Vuna.Compiler.Frontend.Toml.parseToml", "Vuna/Compiler/Frontend/Toml.vuna:825"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseTomlAt", ("Vuna.Compiler.Frontend.Toml.parseTomlAt", "Vuna/Compiler/Frontend/Toml.vuna:828"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseTomlDoc", ("Vuna.Compiler.Frontend.Toml.parseTomlDoc", "Vuna/Compiler/Frontend/Toml.vuna:837"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoop", ("Vuna.Compiler.Frontend.Toml.parseTomlLoop", "Vuna/Compiler/Frontend/Toml.vuna:800"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseTomlLoopAt", ("Vuna.Compiler.Frontend.Toml.parseTomlLoopAt", "Vuna/Compiler/Frontend/Toml.vuna:805"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseUnicodeEscape", ("Vuna.Compiler.Frontend.Toml.parseUnicodeEscape", "Vuna/Compiler/Frontend/Toml.vuna:420"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dparseValue", ("Vuna.Compiler.Frontend.Toml.parseValue", "Vuna/Compiler/Frontend/Toml.vuna:566"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dpathFuel", ("Vuna.Compiler.Frontend.Toml.pathFuel", "Vuna/Compiler/Frontend/Toml.vuna:92"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dreplaceField", ("Vuna.Compiler.Frontend.Toml.replaceField", "Vuna/Compiler/Frontend/Toml.vuna:168"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dreplaceLastNode", ("Vuna.Compiler.Frontend.Toml.replaceLastNode", "Vuna/Compiler/Frontend/Toml.vuna:179"));
  ("v_Vuna_dCompiler_dFrontend_dToml_drootValue", ("Vuna.Compiler.Frontend.Toml.rootValue", "Vuna/Compiler/Frontend/Toml.vuna:344"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dsamePath", ("Vuna.Compiler.Frontend.Toml.samePath", "Vuna/Compiler/Frontend/Toml.vuna:895"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dsectionOfPath", ("Vuna.Compiler.Frontend.Toml.sectionOfPath", "Vuna/Compiler/Frontend/Toml.vuna:255"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnder", ("Vuna.Compiler.Frontend.Toml.sectionsUnder", "Vuna/Compiler/Frontend/Toml.vuna:864"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dsectionsUnderGo", ("Vuna.Compiler.Frontend.Toml.sectionsUnderGo", "Vuna/Compiler/Frontend/Toml.vuna:867"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dskipBlank", ("Vuna.Compiler.Frontend.Toml.skipBlank", "Vuna/Compiler/Frontend/Toml.vuna:349"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dskipComment", ("Vuna.Compiler.Frontend.Toml.skipComment", "Vuna/Compiler/Frontend/Toml.vuna:356"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dskipContinuation", ("Vuna.Compiler.Frontend.Toml.skipContinuation", "Vuna/Compiler/Frontend/Toml.vuna:494"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dskipGap", ("Vuna.Compiler.Frontend.Toml.skipGap", "Vuna/Compiler/Frontend/Toml.vuna:362"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dskipGapGo", ("Vuna.Compiler.Frontend.Toml.skipGapGo", "Vuna/Compiler/Frontend/Toml.vuna:365"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dsplitAtList", ("Vuna.Compiler.Frontend.Toml.splitAtList", "Vuna/Compiler/Frontend/Toml.vuna:887"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dsplitLast", ("Vuna.Compiler.Frontend.Toml.splitLast", "Vuna/Compiler/Frontend/Toml.vuna:156"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dstartsWithTripleOf", ("Vuna.Compiler.Frontend.Toml.startsWithTripleOf", "Vuna/Compiler/Frontend/Toml.vuna:141"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dstripCR", ("Vuna.Compiler.Frontend.Toml.stripCR", "Vuna/Compiler/Frontend/Toml.vuna:146"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dtableFields", ("Vuna.Compiler.Frontend.Toml.tableFields", "Vuna/Compiler/Frontend/Toml.vuna:336"));
  ("v_Vuna_dCompiler_dFrontend_dToml_dutf8OfCode", ("Vuna.Compiler.Frontend.Toml.utf8OfCode", "Vuna/Compiler/Frontend/Toml.vuna:377"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_daddAllNames", ("Vuna.Compiler.Ir.Analysis.addAllNames", "Vuna/Compiler/Ir/Analysis.vuna:103"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_daddDependents", ("Vuna.Compiler.Ir.Analysis.addDependents", "Vuna/Compiler/Ir/Analysis.vuna:29"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_daddReverseEdges", ("Vuna.Compiler.Ir.Analysis.addReverseEdges", "Vuna/Compiler/Ir/Analysis.vuna:186"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dadjTblOf", ("Vuna.Compiler.Ir.Analysis.adjTblOf", "Vuna/Compiler/Ir/Analysis.vuna:26"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dallCovered", ("Vuna.Compiler.Ir.Analysis.allCovered", "Vuna/Compiler/Ir/Analysis.vuna:254"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dassembleGo", ("Vuna.Compiler.Ir.Analysis.assembleGo", "Vuna/Compiler/Ir/Analysis.vuna:398"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroupNames", ("Vuna.Compiler.Ir.Analysis.assembleGroupNames", "Vuna/Compiler/Ir/Analysis.vuna:390"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dassembleGroups", ("Vuna.Compiler.Ir.Analysis.assembleGroups", "Vuna/Compiler/Ir/Analysis.vuna:284"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dcheckGroupsCover", ("Vuna.Compiler.Ir.Analysis.checkGroupsCover", "Vuna/Compiler/Ir/Analysis.vuna:247"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNames", ("Vuna.Compiler.Ir.Analysis.checkUniqueDefNames", "Vuna/Compiler/Ir/Analysis.vuna:376"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dcheckUniqueDefNamesGo", ("Vuna.Compiler.Ir.Analysis.checkUniqueDefNamesGo", "Vuna/Compiler/Ir/Analysis.vuna:379"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dcollectComps", ("Vuna.Compiler.Ir.Analysis.collectComps", "Vuna/Compiler/Ir/Analysis.vuna:92"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dcomponentTblOf", ("Vuna.Compiler.Ir.Analysis.componentTblOf", "Vuna/Compiler/Ir/Analysis.vuna:99"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dcountList", ("Vuna.Compiler.Ir.Analysis.countList", "Vuna/Compiler/Ir/Analysis.vuna:317"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_ddepEdgeCount", ("Vuna.Compiler.Ir.Analysis.depEdgeCount", "Vuna/Compiler/Ir/Analysis.vuna:314"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_ddfsCollect", ("Vuna.Compiler.Ir.Analysis.dfsCollect", "Vuna/Compiler/Ir/Analysis.vuna:84"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_ddfsCollectFuel", ("Vuna.Compiler.Ir.Analysis.dfsCollectFuel", "Vuna/Compiler/Ir/Analysis.vuna:87"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_ddfsPost", ("Vuna.Compiler.Ir.Analysis.dfsPost", "Vuna/Compiler/Ir/Analysis.vuna:56"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_ddfsPostFuel", ("Vuna.Compiler.Ir.Analysis.dfsPostFuel", "Vuna/Compiler/Ir/Analysis.vuna:59"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dfilterNames", ("Vuna.Compiler.Ir.Analysis.filterNames", "Vuna/Compiler/Ir/Analysis.vuna:128"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dfindDefByName", ("Vuna.Compiler.Ir.Analysis.findDefByName", "Vuna/Compiler/Ir/Analysis.vuna:272"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecName", ("Vuna.Compiler.Ir.Analysis.firstBadRecName", "Vuna/Compiler/Ir/Analysis.vuna:410"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dfirstBadRecursiveValue", ("Vuna.Compiler.Ir.Analysis.firstBadRecursiveValue", "Vuna/Compiler/Ir/Analysis.vuna:266"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollect", ("Vuna.Compiler.Ir.Analysis.foldNeighborsCollect", "Vuna/Compiler/Ir/Analysis.vuna:73"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsCollectFuel", ("Vuna.Compiler.Ir.Analysis.foldNeighborsCollectFuel", "Vuna/Compiler/Ir/Analysis.vuna:76"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPost", ("Vuna.Compiler.Ir.Analysis.foldNeighborsPost", "Vuna/Compiler/Ir/Analysis.vuna:45"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dfoldNeighborsPostFuel", ("Vuna.Compiler.Ir.Analysis.foldNeighborsPostFuel", "Vuna/Compiler/Ir/Analysis.vuna:48"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dgroupDefsOf", ("Vuna.Compiler.Ir.Analysis.groupDefsOf", "Vuna/Compiler/Ir/Analysis.vuna:276"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dgroupDepIdx", ("Vuna.Compiler.Ir.Analysis.groupDepIdx", "Vuna/Compiler/Ir/Analysis.vuna:170"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dgroupDepIdxGo", ("Vuna.Compiler.Ir.Analysis.groupDepIdxGo", "Vuna/Compiler/Ir/Analysis.vuna:174"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dgroupIndexTbl", ("Vuna.Compiler.Ir.Analysis.groupIndexTbl", "Vuna/Compiler/Ir/Analysis.vuna:163"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dgroupNames", ("Vuna.Compiler.Ir.Analysis.groupNames", "Vuna/Compiler/Ir/Analysis.vuna:229"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dgroupNamesGo", ("Vuna.Compiler.Ir.Analysis.groupNamesGo", "Vuna/Compiler/Ir/Analysis.vuna:394"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dgroupNeedsRec", ("Vuna.Compiler.Ir.Analysis.groupNeedsRec", "Vuna/Compiler/Ir/Analysis.vuna:259"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dgroupOf", ("Vuna.Compiler.Ir.Analysis.groupOf", "Vuna/Compiler/Ir/Analysis.vuna:121"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromComps", ("Vuna.Compiler.Ir.Analysis.groupsFromComps", "Vuna/Compiler/Ir/Analysis.vuna:108"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dgroupsFromCompsGo", ("Vuna.Compiler.Ir.Analysis.groupsFromCompsGo", "Vuna/Compiler/Ir/Analysis.vuna:112"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dindexGroups", ("Vuna.Compiler.Ir.Analysis.indexGroups", "Vuna/Compiler/Ir/Analysis.vuna:159"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dinsertReady", ("Vuna.Compiler.Ir.Analysis.insertReady", "Vuna/Compiler/Ir/Analysis.vuna:206"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOf", ("Vuna.Compiler.Ir.Analysis.irStringsOf", "Vuna/Compiler/Ir/Analysis.vuna:338"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfAlt", ("Vuna.Compiler.Ir.Analysis.irStringsOfAlt", "Vuna/Compiler/Ir/Analysis.vuna:361"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfAltMaybe", ("Vuna.Compiler.Ir.Analysis.irStringsOfAltMaybe", "Vuna/Compiler/Ir/Analysis.vuna:364"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfDef", ("Vuna.Compiler.Ir.Analysis.irStringsOfDef", "Vuna/Compiler/Ir/Analysis.vuna:369"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dirStringsOfField", ("Vuna.Compiler.Ir.Analysis.irStringsOfField", "Vuna/Compiler/Ir/Analysis.vuna:358"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dlookupDeps", ("Vuna.Compiler.Ir.Analysis.lookupDeps", "Vuna/Compiler/Ir/Analysis.vuna:200"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dlookupInt", ("Vuna.Compiler.Ir.Analysis.lookupInt", "Vuna/Compiler/Ir/Analysis.vuna:190"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dlookupNames", ("Vuna.Compiler.Ir.Analysis.lookupNames", "Vuna/Compiler/Ir/Analysis.vuna:195"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dneighborsOf", ("Vuna.Compiler.Ir.Analysis.neighborsOf", "Vuna/Compiler/Ir/Analysis.vuna:21"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dnotIn", ("Vuna.Compiler.Ir.Analysis.notIn", "Vuna/Compiler/Ir/Analysis.vuna:133"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dorderGroups", ("Vuna.Compiler.Ir.Analysis.orderGroups", "Vuna/Compiler/Ir/Analysis.vuna:143"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dorderGroupsGo", ("Vuna.Compiler.Ir.Analysis.orderGroupsGo", "Vuna/Compiler/Ir/Analysis.vuna:210"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dpostOrder", ("Vuna.Compiler.Ir.Analysis.postOrder", "Vuna/Compiler/Ir/Analysis.vuna:64"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dreachableDefs", ("Vuna.Compiler.Ir.Analysis.reachableDefs", "Vuna/Compiler/Ir/Analysis.vuna:305"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dreachableNames", ("Vuna.Compiler.Ir.Analysis.reachableNames", "Vuna/Compiler/Ir/Analysis.vuna:321"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dreverseAdjTbl", ("Vuna.Compiler.Ir.Analysis.reverseAdjTbl", "Vuna/Compiler/Ir/Analysis.vuna:38"));
  ("v_Vuna_dCompiler_dIr_dAnalysis_dreverseDepTbl", ("Vuna.Compiler.Ir.Analysis.reverseDepTbl", "Vuna/Compiler/Ir/Analysis.vuna:182"));
  ("v_Vuna_dCompiler_dIr_dModel_dirAltBindersOf", ("Vuna.Compiler.Ir.Model.irAltBindersOf", "Vuna/Compiler/Ir/Model.vuna:380"));
  ("v_Vuna_dCompiler_dIr_dModel_dirAltBodyOf", ("Vuna.Compiler.Ir.Model.irAltBodyOf", "Vuna/Compiler/Ir/Model.vuna:384"));
  ("v_Vuna_dCompiler_dIr_dModel_dirAltCtorOf", ("Vuna.Compiler.Ir.Model.irAltCtorOf", "Vuna/Compiler/Ir/Model.vuna:376"));
  ("v_Vuna_dCompiler_dIr_dModel_dirDefArity", ("Vuna.Compiler.Ir.Model.irDefArity", "Vuna/Compiler/Ir/Model.vuna:198"));
  ("v_Vuna_dCompiler_dIr_dModel_dirDefBody", ("Vuna.Compiler.Ir.Model.irDefBody", "Vuna/Compiler/Ir/Model.vuna:206"));
  ("v_Vuna_dCompiler_dIr_dModel_dirDefDeps", ("Vuna.Compiler.Ir.Model.irDefDeps", "Vuna/Compiler/Ir/Model.vuna:202"));
  ("v_Vuna_dCompiler_dIr_dModel_dirDefExtern", ("Vuna.Compiler.Ir.Model.irDefExtern", "Vuna/Compiler/Ir/Model.vuna:210"));
  ("v_Vuna_dCompiler_dIr_dModel_dirDefInitGuard", ("Vuna.Compiler.Ir.Model.irDefInitGuard", "Vuna/Compiler/Ir/Model.vuna:220"));
  ("v_Vuna_dCompiler_dIr_dModel_dirDefName", ("Vuna.Compiler.Ir.Model.irDefName", "Vuna/Compiler/Ir/Model.vuna:194"));
  ("v_Vuna_dCompiler_dIr_dModel_dirDefRecValueOk", ("Vuna.Compiler.Ir.Model.irDefRecValueOk", "Vuna/Compiler/Ir/Model.vuna:215"));
  ("v_Vuna_dCompiler_dIr_dModel_dirDefSpan", ("Vuna.Compiler.Ir.Model.irDefSpan", "Vuna/Compiler/Ir/Model.vuna:224"));
  ("v_Vuna_dCompiler_dIr_dModel_dirEntryHandlersOf", ("Vuna.Compiler.Ir.Model.irEntryHandlersOf", "Vuna/Compiler/Ir/Model.vuna:404"));
  ("v_Vuna_dCompiler_dIr_dModel_dirEntryIsActionOf", ("Vuna.Compiler.Ir.Model.irEntryIsActionOf", "Vuna/Compiler/Ir/Model.vuna:396"));
  ("v_Vuna_dCompiler_dIr_dModel_dirEntryMainOf", ("Vuna.Compiler.Ir.Model.irEntryMainOf", "Vuna/Compiler/Ir/Model.vuna:392"));
  ("v_Vuna_dCompiler_dIr_dModel_dirEntryRunMainOf", ("Vuna.Compiler.Ir.Model.irEntryRunMainOf", "Vuna/Compiler/Ir/Model.vuna:400"));
  ("v_Vuna_dCompiler_dIr_dModel_dirEntryShowOf", ("Vuna.Compiler.Ir.Model.irEntryShowOf", "Vuna/Compiler/Ir/Model.vuna:388"));
  ("v_Vuna_dCompiler_dIr_dModel_dirGroupDefs", ("Vuna.Compiler.Ir.Model.irGroupDefs", "Vuna/Compiler/Ir/Model.vuna:236"));
  ("v_Vuna_dCompiler_dIr_dModel_dirGroupIsRec", ("Vuna.Compiler.Ir.Model.irGroupIsRec", "Vuna/Compiler/Ir/Model.vuna:233"));
  ("v_Vuna_dCompiler_dIr_dModel_dirInlineArity", ("Vuna.Compiler.Ir.Model.irInlineArity", "Vuna/Compiler/Ir/Model.vuna:315"));
  ("v_Vuna_dCompiler_dIr_dModel_dirListConsOf", ("Vuna.Compiler.Ir.Model.irListConsOf", "Vuna/Compiler/Ir/Model.vuna:372"));
  ("v_Vuna_dCompiler_dIr_dModel_dirListFamilyOf", ("Vuna.Compiler.Ir.Model.irListFamilyOf", "Vuna/Compiler/Ir/Model.vuna:364"));
  ("v_Vuna_dCompiler_dIr_dModel_dirListNilOf", ("Vuna.Compiler.Ir.Model.irListNilOf", "Vuna/Compiler/Ir/Model.vuna:368"));
  ("v_Vuna_dCompiler_dIr_dModel_dirProgSharedOf", ("Vuna.Compiler.Ir.Model.irProgSharedOf", "Vuna/Compiler/Ir/Model.vuna:408"));
  ("v_Vuna_dCompiler_dIr_dModel_dirProgUnitOf", ("Vuna.Compiler.Ir.Model.irProgUnitOf", "Vuna/Compiler/Ir/Model.vuna:412"));
  ("v_Vuna_dCompiler_dIr_dModel_dirSharedRecordFieldsOf", ("Vuna.Compiler.Ir.Model.irSharedRecordFieldsOf", "Vuna/Compiler/Ir/Model.vuna:288"));
  ("v_Vuna_dCompiler_dIr_dModel_dmkIrBinder", ("Vuna.Compiler.Ir.Model.mkIrBinder", "Vuna/Compiler/Ir/Model.vuna:83"));
  ("v_Vuna_dCompiler_dIr_dModel_dmkIrBinderArm", ("Vuna.Compiler.Ir.Model.mkIrBinderArm", "Vuna/Compiler/Ir/Model.vuna:91"));
  ("v_Vuna_dCompiler_dIr_dModel_dmkIrBinderErased", ("Vuna.Compiler.Ir.Model.mkIrBinderErased", "Vuna/Compiler/Ir/Model.vuna:87"));
  ("v_Vuna_dCompiler_dIr_dModel_dmkIrBinderNat", ("Vuna.Compiler.Ir.Model.mkIrBinderNat", "Vuna/Compiler/Ir/Model.vuna:95"));
  ("v_Vuna_dCompiler_dIr_dModel_dmkIrBinderWild", ("Vuna.Compiler.Ir.Model.mkIrBinderWild", "Vuna/Compiler/Ir/Model.vuna:99"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirListLength", ("Vuna.Compiler.Ir.Runtime.irListLength", "Vuna/Compiler/Ir/Runtime.vuna:405"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtBridgedNames", ("Vuna.Compiler.Ir.Runtime.irRtBridgedNames", "Vuna/Compiler/Ir/Runtime.vuna:337"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtBridgesList", ("Vuna.Compiler.Ir.Runtime.irRtBridgesList", "Vuna/Compiler/Ir/Runtime.vuna:393"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtContract", ("Vuna.Compiler.Ir.Runtime.irRtContract", "Vuna/Compiler/Ir/Runtime.vuna:373"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtIsKnown", ("Vuna.Compiler.Ir.Runtime.irRtIsKnown", "Vuna/Compiler/Ir/Runtime.vuna:387"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtLookup", ("Vuna.Compiler.Ir.Runtime.irRtLookup", "Vuna/Compiler/Ir/Runtime.vuna:383"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtLookupGo", ("Vuna.Compiler.Ir.Runtime.irRtLookupGo", "Vuna/Compiler/Ir/Runtime.vuna:378"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtNames", ("Vuna.Compiler.Ir.Runtime.irRtNames", "Vuna/Compiler/Ir/Runtime.vuna:369"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtNatSucc", ("Vuna.Compiler.Ir.Runtime.irRtNatSucc", "Vuna/Compiler/Ir/Runtime.vuna:49"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtPlainNames", ("Vuna.Compiler.Ir.Runtime.irRtPlainNames", "Vuna/Compiler/Ir/Runtime.vuna:73"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtShowBool", ("Vuna.Compiler.Ir.Runtime.irRtShowBool", "Vuna/Compiler/Ir/Runtime.vuna:64"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtShowFloat", ("Vuna.Compiler.Ir.Runtime.irRtShowFloat", "Vuna/Compiler/Ir/Runtime.vuna:61"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtShowInt", ("Vuna.Compiler.Ir.Runtime.irRtShowInt", "Vuna/Compiler/Ir/Runtime.vuna:52"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtShowNat", ("Vuna.Compiler.Ir.Runtime.irRtShowNat", "Vuna/Compiler/Ir/Runtime.vuna:55"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtShowStr", ("Vuna.Compiler.Ir.Runtime.irRtShowStr", "Vuna/Compiler/Ir/Runtime.vuna:58"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtSymBridgesOf", ("Vuna.Compiler.Ir.Runtime.irRtSymBridgesOf", "Vuna/Compiler/Ir/Runtime.vuna:44"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtSymNameOf", ("Vuna.Compiler.Ir.Runtime.irRtSymNameOf", "Vuna/Compiler/Ir/Runtime.vuna:40"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirRtSyntheticNames", ("Vuna.Compiler.Ir.Runtime.irRtSyntheticNames", "Vuna/Compiler/Ir/Runtime.vuna:68"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOf", ("Vuna.Compiler.Ir.Runtime.irSymbolsOf", "Vuna/Compiler/Ir/Runtime.vuna:410"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfAlt", ("Vuna.Compiler.Ir.Runtime.irSymbolsOfAlt", "Vuna/Compiler/Ir/Runtime.vuna:440"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfAltMaybe", ("Vuna.Compiler.Ir.Runtime.irSymbolsOfAltMaybe", "Vuna/Compiler/Ir/Runtime.vuna:443"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfDef", ("Vuna.Compiler.Ir.Runtime.irSymbolsOfDef", "Vuna/Compiler/Ir/Runtime.vuna:447"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfEntry", ("Vuna.Compiler.Ir.Runtime.irSymbolsOfEntry", "Vuna/Compiler/Ir/Runtime.vuna:458"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfField", ("Vuna.Compiler.Ir.Runtime.irSymbolsOfField", "Vuna/Compiler/Ir/Runtime.vuna:437"));
  ("v_Vuna_dCompiler_dIr_dRuntime_dirSymbolsOfUnit", ("Vuna.Compiler.Ir.Runtime.irSymbolsOfUnit", "Vuna/Compiler/Ir/Runtime.vuna:453"));
  ("v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrder", ("Vuna.Compiler.Ir.Validate.checkGroupOrder", "Vuna/Compiler/Ir/Validate.vuna:32"));
  ("v_Vuna_dCompiler_dIr_dValidate_dcheckGroupOrderGo", ("Vuna.Compiler.Ir.Validate.checkGroupOrderGo", "Vuna/Compiler/Ir/Validate.vuna:35"));
  ("v_Vuna_dCompiler_dIr_dValidate_dcheckSymbolRefs", ("Vuna.Compiler.Ir.Validate.checkSymbolRefs", "Vuna/Compiler/Ir/Validate.vuna:65"));
  ("v_Vuna_dCompiler_dIr_dValidate_dfirstMissingDep", ("Vuna.Compiler.Ir.Validate.firstMissingDep", "Vuna/Compiler/Ir/Validate.vuna:56"));
  ("v_Vuna_dCompiler_dIr_dValidate_dfirstUnorderedDep", ("Vuna.Compiler.Ir.Validate.firstUnorderedDep", "Vuna/Compiler/Ir/Validate.vuna:47"));
  ("v_Vuna_dCompiler_dIr_dValidate_dfirstUnorderedDepGo", ("Vuna.Compiler.Ir.Validate.firstUnorderedDepGo", "Vuna/Compiler/Ir/Validate.vuna:50"));
  ("v_Vuna_dCompiler_dIr_dValidate_dvalidateProgram", ("Vuna.Compiler.Ir.Validate.validateProgram", "Vuna/Compiler/Ir/Validate.vuna:76"));
  ("v_Vuna_dCompiler_dIr_dValidate_dvalidateUnit", ("Vuna.Compiler.Ir.Validate.validateUnit", "Vuna/Compiler/Ir/Validate.vuna:23"));
  ("v_Vuna_dCompiler_dLoader_dAddr_daddrOf", ("Vuna.Compiler.Loader.Addr.addrOf", "Vuna/Compiler/Loader/Addr.vuna:39"));
  ("v_Vuna_dCompiler_dLoader_dAddr_daddrSchema", ("Vuna.Compiler.Loader.Addr.addrSchema", "Vuna/Compiler/Loader/Addr.vuna:31"));
  ("v_Vuna_dCompiler_dLoader_dAddr_ddecFixRow", ("Vuna.Compiler.Loader.Addr.decFixRow", "Vuna/Compiler/Loader/Addr.vuna:86"));
  ("v_Vuna_dCompiler_dLoader_dAddr_ddecHeader", ("Vuna.Compiler.Loader.Addr.decHeader", "Vuna/Compiler/Loader/Addr.vuna:97"));
  ("v_Vuna_dCompiler_dLoader_dAddr_ddecModHeaderComplete", ("Vuna.Compiler.Loader.Addr.decModHeaderComplete", "Vuna/Compiler/Loader/Addr.vuna:107"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dencFixRow", ("Vuna.Compiler.Loader.Addr.encFixRow", "Vuna/Compiler/Loader/Addr.vuna:75"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dencHeader", ("Vuna.Compiler.Loader.Addr.encHeader", "Vuna/Compiler/Loader/Addr.vuna:79"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dencModHeader", ("Vuna.Compiler.Loader.Addr.encModHeader", "Vuna/Compiler/Loader/Addr.vuna:83"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dfixRowOf", ("Vuna.Compiler.Loader.Addr.fixRowOf", "Vuna/Compiler/Loader/Addr.vuna:161"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dhashHex", ("Vuna.Compiler.Loader.Addr.hashHex", "Vuna/Compiler/Loader/Addr.vuna:35"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dheaderAddrOf", ("Vuna.Compiler.Loader.Addr.headerAddrOf", "Vuna/Compiler/Loader/Addr.vuna:113"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dheaderCodec", ("Vuna.Compiler.Loader.Addr.headerCodec", "Vuna/Compiler/Loader/Addr.vuna:61"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dheaderKind", ("Vuna.Compiler.Loader.Addr.headerKind", "Vuna/Compiler/Loader/Addr.vuna:58"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dheaderOfSource", ("Vuna.Compiler.Loader.Addr.headerOfSource", "Vuna/Compiler/Loader/Addr.vuna:168"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dimportNameOf", ("Vuna.Compiler.Loader.Addr.importNameOf", "Vuna/Compiler/Loader/Addr.vuna:164"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dlookupImports", ("Vuna.Compiler.Loader.Addr.lookupImports", "Vuna/Compiler/Loader/Addr.vuna:136"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dprojectIdAddrOf", ("Vuna.Compiler.Loader.Addr.projectIdAddrOf", "Vuna/Compiler/Loader/Addr.vuna:44"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dreadHeaderEff", ("Vuna.Compiler.Loader.Addr.readHeaderEff", "Vuna/Compiler/Loader/Addr.vuna:117"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dtopoModules", ("Vuna.Compiler.Loader.Addr.topoModules", "Vuna/Compiler/Loader/Addr.vuna:155"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dtopoVisitGo", ("Vuna.Compiler.Loader.Addr.topoVisitGo", "Vuna/Compiler/Loader/Addr.vuna:140"));
  ("v_Vuna_dCompiler_dLoader_dAddr_dwriteHeaderEff", ("Vuna.Compiler.Loader.Addr.writeHeaderEff", "Vuna/Compiler/Loader/Addr.vuna:126"));
  ("v_Vuna_dCompiler_dLoader_dExpand_ddebugOnRef", ("Vuna.Compiler.Loader.Expand.debugOnRef", "Vuna/Compiler/Loader/Expand.vuna:251"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandClauses", ("Vuna.Compiler.Loader.Expand.expandClauses", "Vuna/Compiler/Loader/Expand.vuna:198"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandCtor", ("Vuna.Compiler.Loader.Expand.expandCtor", "Vuna/Compiler/Loader/Expand.vuna:84"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandCtors", ("Vuna.Compiler.Loader.Expand.expandCtors", "Vuna/Compiler/Loader/Expand.vuna:76"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandDecl", ("Vuna.Compiler.Loader.Expand.expandDecl", "Vuna/Compiler/Loader/Expand.vuna:49"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandDecls", ("Vuna.Compiler.Loader.Expand.expandDecls", "Vuna/Compiler/Loader/Expand.vuna:38"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandDeclsGo", ("Vuna.Compiler.Loader.Expand.expandDeclsGo", "Vuna/Compiler/Loader/Expand.vuna:41"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandDoStmts", ("Vuna.Compiler.Loader.Expand.expandDoStmts", "Vuna/Compiler/Loader/Expand.vuna:214"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandExpr", ("Vuna.Compiler.Loader.Expand.expandExpr", "Vuna/Compiler/Loader/Expand.vuna:120"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandExprs", ("Vuna.Compiler.Loader.Expand.expandExprs", "Vuna/Compiler/Loader/Expand.vuna:112"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandField", ("Vuna.Compiler.Loader.Expand.expandField", "Vuna/Compiler/Loader/Expand.vuna:96"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandFieldExprs", ("Vuna.Compiler.Loader.Expand.expandFieldExprs", "Vuna/Compiler/Loader/Expand.vuna:206"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandFields", ("Vuna.Compiler.Loader.Expand.expandFields", "Vuna/Compiler/Loader/Expand.vuna:88"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandFuelBound", ("Vuna.Compiler.Loader.Expand.expandFuelBound", "Vuna/Compiler/Loader/Expand.vuna:34"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandInterpParts", ("Vuna.Compiler.Loader.Expand.expandInterpParts", "Vuna/Compiler/Loader/Expand.vuna:226"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandMacro", ("Vuna.Compiler.Loader.Expand.expandMacro", "Vuna/Compiler/Loader/Expand.vuna:270"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandPatExprs", ("Vuna.Compiler.Loader.Expand.expandPatExprs", "Vuna/Compiler/Loader/Expand.vuna:190"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandTraitMethod", ("Vuna.Compiler.Loader.Expand.expandTraitMethod", "Vuna/Compiler/Loader/Expand.vuna:108"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dexpandTraitMethods", ("Vuna.Compiler.Loader.Expand.expandTraitMethods", "Vuna/Compiler/Loader/Expand.vuna:100"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dinternalRef", ("Vuna.Compiler.Loader.Expand.internalRef", "Vuna/Compiler/Loader/Expand.vuna:247"));
  ("v_Vuna_dCompiler_dLoader_dExpand_dmacroArityMismatch", ("Vuna.Compiler.Loader.Expand.macroArityMismatch", "Vuna/Compiler/Loader/Expand.vuna:254"));
  ("v_Vuna_dCompiler_dLoader_dFingerprint_dbuildIdFileName", ("Vuna.Compiler.Loader.Fingerprint.buildIdFileName", "Vuna/Compiler/Loader/Fingerprint.vuna:38"));
  ("v_Vuna_dCompiler_dLoader_dFingerprint_dbuildIdSchema", ("Vuna.Compiler.Loader.Fingerprint.buildIdSchema", "Vuna/Compiler/Loader/Fingerprint.vuna:42"));
  ("v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerFingerprintEff", ("Vuna.Compiler.Loader.Fingerprint.compilerFingerprintEff", "Vuna/Compiler/Loader/Fingerprint.vuna:99"));
  ("v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerIdOf", ("Vuna.Compiler.Loader.Fingerprint.compilerIdOf", "Vuna/Compiler/Loader/Fingerprint.vuna:48"));
  ("v_Vuna_dCompiler_dLoader_dFingerprint_dcompilerTagEff", ("Vuna.Compiler.Loader.Fingerprint.compilerTagEff", "Vuna/Compiler/Loader/Fingerprint.vuna:64"));
  ("v_Vuna_dCompiler_dLoader_dFingerprint_dfingerprintOfStat", ("Vuna.Compiler.Loader.Fingerprint.fingerprintOfStat", "Vuna/Compiler/Loader/Fingerprint.vuna:57"));
  ("v_Vuna_dCompiler_dLoader_dFingerprint_dreadBuildIdNear", ("Vuna.Compiler.Loader.Fingerprint.readBuildIdNear", "Vuna/Compiler/Loader/Fingerprint.vuna:82"));
  ("v_Vuna_dCompiler_dLoader_dFingerprint_dreadFirstBuildId", ("Vuna.Compiler.Loader.Fingerprint.readFirstBuildId", "Vuna/Compiler/Loader/Fingerprint.vuna:89"));
  ("v_Vuna_dCompiler_dLoader_dFingerprint_dsourceFrag", ("Vuna.Compiler.Loader.Fingerprint.sourceFrag", "Vuna/Compiler/Loader/Fingerprint.vuna:53"));
  ("v_Vuna_dCompiler_dLoader_dFingerprint_dtextHashOf", ("Vuna.Compiler.Loader.Fingerprint.textHashOf", "Vuna/Compiler/Loader/Fingerprint.vuna:60"));
  ("v_Vuna_dCompiler_dLoader_dFixity_daliasOf", ("Vuna.Compiler.Loader.Fixity.aliasOf", "Vuna/Compiler/Loader/Fixity.vuna:102"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dbuiltinFixityDecls", ("Vuna.Compiler.Loader.Fixity.builtinFixityDecls", "Vuna/Compiler/Loader/Fixity.vuna:40"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dbuiltinFixityOps", ("Vuna.Compiler.Loader.Fixity.builtinFixityOps", "Vuna/Compiler/Loader/Fixity.vuna:47"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dcheckUniqueFixities", ("Vuna.Compiler.Loader.Fixity.checkUniqueFixities", "Vuna/Compiler/Loader/Fixity.vuna:55"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dcheckUniqueFixitiesGo", ("Vuna.Compiler.Loader.Fixity.checkUniqueFixitiesGo", "Vuna/Compiler/Loader/Fixity.vuna:59"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dclimb", ("Vuna.Compiler.Loader.Fixity.climb", "Vuna/Compiler/Loader/Fixity.vuna:154"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dcollectChain", ("Vuna.Compiler.Loader.Fixity.collectChain", "Vuna/Compiler/Loader/Fixity.vuna:140"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dfindTarget", ("Vuna.Compiler.Loader.Fixity.findTarget", "Vuna/Compiler/Loader/Fixity.vuna:76"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dfixityOf", ("Vuna.Compiler.Loader.Fixity.fixityOf", "Vuna/Compiler/Loader/Fixity.vuna:122"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dfixityOpOf", ("Vuna.Compiler.Loader.Fixity.fixityOpOf", "Vuna/Compiler/Loader/Fixity.vuna:50"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dfoldApps", ("Vuna.Compiler.Loader.Fixity.foldApps", "Vuna/Compiler/Loader/Fixity.vuna:182"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dinfixTerm", ("Vuna.Compiler.Loader.Fixity.infixTerm", "Vuna/Compiler/Loader/Fixity.vuna:131"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dlookupDecl", ("Vuna.Compiler.Loader.Fixity.lookupDecl", "Vuna/Compiler/Loader/Fixity.vuna:87"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dlookupFixity", ("Vuna.Compiler.Loader.Fixity.lookupFixity", "Vuna/Compiler/Loader/Fixity.vuna:97"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dlookupFixityDecl", ("Vuna.Compiler.Loader.Fixity.lookupFixityDecl", "Vuna/Compiler/Loader/Fixity.vuna:92"));
  ("v_Vuna_dCompiler_dLoader_dFixity_drenameMode", ("Vuna.Compiler.Loader.Fixity.renameMode", "Vuna/Compiler/Loader/Fixity.vuna:35"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderAlt", ("Vuna.Compiler.Loader.Fixity.reorderAlt", "Vuna/Compiler/Loader/Fixity.vuna:304"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderAlts", ("Vuna.Compiler.Loader.Fixity.reorderAlts", "Vuna/Compiler/Loader/Fixity.vuna:301"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderBind", ("Vuna.Compiler.Loader.Fixity.reorderBind", "Vuna/Compiler/Loader/Fixity.vuna:285"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderBinds", ("Vuna.Compiler.Loader.Fixity.reorderBinds", "Vuna/Compiler/Loader/Fixity.vuna:282"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderChain", ("Vuna.Compiler.Loader.Fixity.reorderChain", "Vuna/Compiler/Loader/Fixity.vuna:172"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderClause", ("Vuna.Compiler.Loader.Fixity.reorderClause", "Vuna/Compiler/Loader/Fixity.vuna:309"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderClauses", ("Vuna.Compiler.Loader.Fixity.reorderClauses", "Vuna/Compiler/Loader/Fixity.vuna:297"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderCtor", ("Vuna.Compiler.Loader.Fixity.reorderCtor", "Vuna/Compiler/Loader/Fixity.vuna:383"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderDecl", ("Vuna.Compiler.Loader.Fixity.reorderDecl", "Vuna/Compiler/Loader/Fixity.vuna:348"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderDoStmt", ("Vuna.Compiler.Loader.Fixity.reorderDoStmt", "Vuna/Compiler/Loader/Fixity.vuna:315"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderExpr", ("Vuna.Compiler.Loader.Fixity.reorderExpr", "Vuna/Compiler/Loader/Fixity.vuna:186"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderField", ("Vuna.Compiler.Loader.Fixity.reorderField", "Vuna/Compiler/Loader/Fixity.vuna:293"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderFields", ("Vuna.Compiler.Loader.Fixity.reorderFields", "Vuna/Compiler/Loader/Fixity.vuna:290"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderInstanceMethodDecl", ("Vuna.Compiler.Loader.Fixity.reorderInstanceMethodDecl", "Vuna/Compiler/Loader/Fixity.vuna:395"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderInterpParts", ("Vuna.Compiler.Loader.Fixity.reorderInterpParts", "Vuna/Compiler/Loader/Fixity.vuna:273"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderPattern", ("Vuna.Compiler.Loader.Fixity.reorderPattern", "Vuna/Compiler/Loader/Fixity.vuna:322"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderProgram", ("Vuna.Compiler.Loader.Fixity.reorderProgram", "Vuna/Compiler/Loader/Fixity.vuna:405"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderRecPatField", ("Vuna.Compiler.Loader.Fixity.reorderRecPatField", "Vuna/Compiler/Loader/Fixity.vuna:343"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderRecordField", ("Vuna.Compiler.Loader.Fixity.reorderRecordField", "Vuna/Compiler/Loader/Fixity.vuna:387"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderTraitMethod", ("Vuna.Compiler.Loader.Fixity.reorderTraitMethod", "Vuna/Compiler/Loader/Fixity.vuna:391"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dreorderTraitParam", ("Vuna.Compiler.Loader.Fixity.reorderTraitParam", "Vuna/Compiler/Loader/Fixity.vuna:376"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dsymbolOfTargetIn", ("Vuna.Compiler.Loader.Fixity.symbolOfTargetIn", "Vuna/Compiler/Loader/Fixity.vuna:83"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dtableOf", ("Vuna.Compiler.Loader.Fixity.tableOf", "Vuna/Compiler/Loader/Fixity.vuna:28"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dtableOfKeepOps", ("Vuna.Compiler.Loader.Fixity.tableOfKeepOps", "Vuna/Compiler/Loader/Fixity.vuna:32"));
  ("v_Vuna_dCompiler_dLoader_dFixity_dunknownFixityMsg", ("Vuna.Compiler.Loader.Fixity.unknownFixityMsg", "Vuna/Compiler/Loader/Fixity.vuna:117"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dabstractOpaquePrefix", ("Vuna.Compiler.Loader.Flatten.abstractOpaquePrefix", "Vuna/Compiler/Loader/Flatten.vuna:516"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_danyTargetIn", ("Vuna.Compiler.Loader.Flatten.anyTargetIn", "Vuna/Compiler/Loader/Flatten.vuna:914"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dbindRefNames", ("Vuna.Compiler.Loader.Flatten.bindRefNames", "Vuna/Compiler/Loader/Flatten.vuna:985"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportDuplicates", ("Vuna.Compiler.Loader.Flatten.checkExportDuplicates", "Vuna/Compiler/Loader/Flatten.vuna:446"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dcheckExportItems", ("Vuna.Compiler.Loader.Flatten.checkExportItems", "Vuna/Compiler/Loader/Flatten.vuna:479"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dclauseRefNames", ("Vuna.Compiler.Loader.Flatten.clauseRefNames", "Vuna/Compiler/Loader/Flatten.vuna:989"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dcomputeExports", ("Vuna.Compiler.Loader.Flatten.computeExports", "Vuna/Compiler/Loader/Flatten.vuna:528"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dctorEntriesOfType", ("Vuna.Compiler.Loader.Flatten.ctorEntriesOfType", "Vuna/Compiler/Loader/Flatten.vuna:248"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dctorRefNames", ("Vuna.Compiler.Loader.Flatten.ctorRefNames", "Vuna/Compiler/Loader/Flatten.vuna:935"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddeclGlobalNames", ("Vuna.Compiler.Loader.Flatten.declGlobalNames", "Vuna/Compiler/Loader/Flatten.vuna:896"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddeclRefNames", ("Vuna.Compiler.Loader.Flatten.declRefNames", "Vuna/Compiler/Loader/Flatten.vuna:920"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddedupeByFullKey", ("Vuna.Compiler.Loader.Flatten.dedupeByFullKey", "Vuna/Compiler/Loader/Flatten.vuna:437"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddedupeExportEntries", ("Vuna.Compiler.Loader.Flatten.dedupeExportEntries", "Vuna/Compiler/Loader/Flatten.vuna:431"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixities", ("Vuna.Compiler.Loader.Flatten.dedupeFixities", "Vuna/Compiler/Loader/Flatten.vuna:130"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddedupeFixitiesGo", ("Vuna.Compiler.Loader.Flatten.dedupeFixitiesGo", "Vuna/Compiler/Loader/Flatten.vuna:133"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddoStmtRefNames", ("Vuna.Compiler.Loader.Flatten.doStmtRefNames", "Vuna/Compiler/Loader/Flatten.vuna:993"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_ddupItemKeys", ("Vuna.Compiler.Loader.Flatten.dupItemKeys", "Vuna/Compiler/Loader/Flatten.vuna:465"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dduplicateExportItem", ("Vuna.Compiler.Loader.Flatten.duplicateExportItem", "Vuna/Compiler/Loader/Flatten.vuna:460"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexpandGlobalName", ("Vuna.Compiler.Loader.Flatten.expandGlobalName", "Vuna/Compiler/Loader/Flatten.vuna:903"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexplicitExports", ("Vuna.Compiler.Loader.Flatten.explicitExports", "Vuna/Compiler/Loader/Flatten.vuna:490"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportBare", ("Vuna.Compiler.Loader.Flatten.exportBare", "Vuna/Compiler/Loader/Flatten.vuna:331"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportEntryKey", ("Vuna.Compiler.Loader.Flatten.exportEntryKey", "Vuna/Compiler/Loader/Flatten.vuna:434"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportItemEntries", ("Vuna.Compiler.Loader.Flatten.exportItemEntries", "Vuna/Compiler/Loader/Flatten.vuna:394"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportItemKey", ("Vuna.Compiler.Loader.Flatten.exportItemKey", "Vuna/Compiler/Loader/Flatten.vuna:454"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportItemName", ("Vuna.Compiler.Loader.Flatten.exportItemName", "Vuna/Compiler/Loader/Flatten.vuna:473"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportItemSpanOfName", ("Vuna.Compiler.Loader.Flatten.exportItemSpanOfName", "Vuna/Compiler/Loader/Flatten.vuna:485"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportItemsAll", ("Vuna.Compiler.Loader.Flatten.exportItemsAll", "Vuna/Compiler/Loader/Flatten.vuna:498"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportSelective", ("Vuna.Compiler.Loader.Flatten.exportSelective", "Vuna/Compiler/Loader/Flatten.vuna:353"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportSpecToItem", ("Vuna.Compiler.Loader.Flatten.exportSpecToItem", "Vuna/Compiler/Loader/Flatten.vuna:550"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportTargetOf", ("Vuna.Compiler.Loader.Flatten.exportTargetOf", "Vuna/Compiler/Loader/Flatten.vuna:910"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexportTypeAll", ("Vuna.Compiler.Loader.Flatten.exportTypeAll", "Vuna/Compiler/Loader/Flatten.vuna:367"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dexprRefNames", ("Vuna.Compiler.Loader.Flatten.exprRefNames", "Vuna/Compiler/Loader/Flatten.vuna:957"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfieldRefNames", ("Vuna.Compiler.Loader.Flatten.fieldRefNames", "Vuna/Compiler/Loader/Flatten.vuna:939"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfilterExportMembers", ("Vuna.Compiler.Loader.Flatten.filterExportMembers", "Vuna/Compiler/Loader/Flatten.vuna:406"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfindCtorNamed", ("Vuna.Compiler.Loader.Flatten.findCtorNamed", "Vuna/Compiler/Loader/Flatten.vuna:184"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfindMethodNamed", ("Vuna.Compiler.Loader.Flatten.findMethodNamed", "Vuna/Compiler/Loader/Flatten.vuna:190"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnCtorNames", ("Vuna.Compiler.Loader.Flatten.findOwnCtorNames", "Vuna/Compiler/Loader/Flatten.vuna:196"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnData", ("Vuna.Compiler.Loader.Flatten.findOwnData", "Vuna/Compiler/Loader/Flatten.vuna:164"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfindOwnFn", ("Vuna.Compiler.Loader.Flatten.findOwnFn", "Vuna/Compiler/Loader/Flatten.vuna:175"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSource", ("Vuna.Compiler.Loader.Flatten.fixitiesForSource", "Vuna/Compiler/Loader/Flatten.vuna:823"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfixitiesForSourceIn", ("Vuna.Compiler.Loader.Flatten.fixitiesForSourceIn", "Vuna/Compiler/Loader/Flatten.vuna:783"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dfixityDeclKey", ("Vuna.Compiler.Loader.Flatten.fixityDeclKey", "Vuna/Compiler/Loader/Flatten.vuna:145"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dhasConflictingExport", ("Vuna.Compiler.Loader.Flatten.hasConflictingExport", "Vuna/Compiler/Loader/Flatten.vuna:421"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dhasSamePublicKind", ("Vuna.Compiler.Loader.Flatten.hasSamePublicKind", "Vuna/Compiler/Loader/Flatten.vuna:412"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPrelude", ("Vuna.Compiler.Loader.Flatten.implicitPrelude", "Vuna/Compiler/Loader/Flatten.vuna:564"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeDeps", ("Vuna.Compiler.Loader.Flatten.implicitPreludeDeps", "Vuna/Compiler/Loader/Flatten.vuna:578"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dimplicitPreludeFrom", ("Vuna.Compiler.Loader.Flatten.implicitPreludeFrom", "Vuna/Compiler/Loader/Flatten.vuna:570"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dimportRemovalSpan", ("Vuna.Compiler.Loader.Flatten.importRemovalSpan", "Vuna/Compiler/Loader/Flatten.vuna:889"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dinterpPartRefNames", ("Vuna.Compiler.Loader.Flatten.interpPartRefNames", "Vuna/Compiler/Loader/Flatten.vuna:998"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dinterpReferencedInSource", ("Vuna.Compiler.Loader.Flatten.interpReferencedInSource", "Vuna/Compiler/Loader/Flatten.vuna:874"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_disAbstractOpaqueName", ("Vuna.Compiler.Loader.Flatten.isAbstractOpaqueName", "Vuna/Compiler/Loader/Flatten.vuna:525"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_disPrivateName", ("Vuna.Compiler.Loader.Flatten.isPrivateName", "Vuna/Compiler/Loader/Flatten.vuna:154"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_disRecordDecl", ("Vuna.Compiler.Loader.Flatten.isRecordDecl", "Vuna/Compiler/Loader/Flatten.vuna:275"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_disRecordTarget", ("Vuna.Compiler.Loader.Flatten.isRecordTarget", "Vuna/Compiler/Loader/Flatten.vuna:265"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dlexAddrOf", ("Vuna.Compiler.Loader.Flatten.lexAddrOf", "Vuna/Compiler/Loader/Flatten.vuna:67"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dlexAndStore", ("Vuna.Compiler.Loader.Flatten.lexAndStore", "Vuna/Compiler/Loader/Flatten.vuna:101"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dlexCacheCodec", ("Vuna.Compiler.Loader.Flatten.lexCacheCodec", "Vuna/Compiler/Loader/Flatten.vuna:58"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dlexCacheSchema", ("Vuna.Compiler.Loader.Flatten.lexCacheSchema", "Vuna/Compiler/Loader/Flatten.vuna:54"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadAll", ("Vuna.Compiler.Loader.Flatten.loadAll", "Vuna/Compiler/Loader/Flatten.vuna:595"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadModule", ("Vuna.Compiler.Loader.Flatten.loadModule", "Vuna/Compiler/Loader/Flatten.vuna:605"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSource", ("Vuna.Compiler.Loader.Flatten.loadModuleSource", "Vuna/Compiler/Loader/Flatten.vuna:743"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadModuleSourceWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadModuleSourceWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:747"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadProject", ("Vuna.Compiler.Loader.Flatten.loadProject", "Vuna/Compiler/Loader/Flatten.vuna:654"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModules", ("Vuna.Compiler.Loader.Flatten.loadProjectModules", "Vuna/Compiler/Loader/Flatten.vuna:691"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectModulesWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadProjectModulesWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:694"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSource", ("Vuna.Compiler.Loader.Flatten.loadProjectSource", "Vuna/Compiler/Loader/Flatten.vuna:709"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectSourceWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadProjectSourceWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:713"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dloadProjectWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadProjectWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:661"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dmemFirstOf", ("Vuna.Compiler.Loader.Flatten.memFirstOf", "Vuna/Compiler/Loader/Flatten.vuna:469"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dnotEmpty", ("Vuna.Compiler.Loader.Flatten.notEmpty", "Vuna/Compiler/Loader/Flatten.vuna:546"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dopaqueBaseName", ("Vuna.Compiler.Loader.Flatten.opaqueBaseName", "Vuna/Compiler/Loader/Flatten.vuna:519"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dopaqueNamesOf", ("Vuna.Compiler.Loader.Flatten.opaqueNamesOf", "Vuna/Compiler/Loader/Flatten.vuna:509"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntries", ("Vuna.Compiler.Loader.Flatten.ownCtorEntries", "Vuna/Compiler/Loader/Flatten.vuna:212"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downCtorEntriesNamed", ("Vuna.Compiler.Loader.Flatten.ownCtorEntriesNamed", "Vuna/Compiler/Loader/Flatten.vuna:315"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downDataCtorEntries", ("Vuna.Compiler.Loader.Flatten.ownDataCtorEntries", "Vuna/Compiler/Loader/Flatten.vuna:221"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedTypeRef", ("Vuna.Compiler.Loader.Flatten.ownOrImportedTypeRef", "Vuna/Compiler/Loader/Flatten.vuna:286"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef", ("Vuna.Compiler.Loader.Flatten.ownOrImportedValueRef", "Vuna/Compiler/Loader/Flatten.vuna:296"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downOrImportedValueRef2", ("Vuna.Compiler.Loader.Flatten.ownOrImportedValueRef2", "Vuna/Compiler/Loader/Flatten.vuna:302"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_downTypeEntries", ("Vuna.Compiler.Loader.Flatten.ownTypeEntries", "Vuna/Compiler/Loader/Flatten.vuna:229"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPath", ("Vuna.Compiler.Loader.Flatten.parseFileWithPath", "Vuna/Compiler/Loader/Flatten.vuna:86"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dparseFileWithPathMode", ("Vuna.Compiler.Loader.Flatten.parseFileWithPathMode", "Vuna/Compiler/Loader/Flatten.vuna:89"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dparseWith", ("Vuna.Compiler.Loader.Flatten.parseWith", "Vuna/Compiler/Loader/Flatten.vuna:111"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dpatRefNames", ("Vuna.Compiler.Loader.Flatten.patRefNames", "Vuna/Compiler/Loader/Flatten.vuna:947"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dprivateExportMsg", ("Vuna.Compiler.Loader.Flatten.privateExportMsg", "Vuna/Compiler/Loader/Flatten.vuna:157"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dreadLexCache", ("Vuna.Compiler.Loader.Flatten.readLexCache", "Vuna/Compiler/Loader/Flatten.vuna:71"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_drefEntryList", ("Vuna.Compiler.Loader.Flatten.refEntryList", "Vuna/Compiler/Loader/Flatten.vuna:281"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dresolveModulesKeep", ("Vuna.Compiler.Loader.Flatten.resolveModulesKeep", "Vuna/Compiler/Loader/Flatten.vuna:848"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dresolveProject", ("Vuna.Compiler.Loader.Flatten.resolveProject", "Vuna/Compiler/Loader/Flatten.vuna:833"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectKeeping", ("Vuna.Compiler.Loader.Flatten.resolveProjectKeeping", "Vuna/Compiler/Loader/Flatten.vuna:841"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dresolveProjectWith", ("Vuna.Compiler.Loader.Flatten.resolveProjectWith", "Vuna/Compiler/Loader/Flatten.vuna:837"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dsameExportEntry", ("Vuna.Compiler.Loader.Flatten.sameExportEntry", "Vuna/Compiler/Loader/Flatten.vuna:427"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dshowCycle", ("Vuna.Compiler.Loader.Flatten.showCycle", "Vuna/Compiler/Loader/Flatten.vuna:556"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dstoreLexCache", ("Vuna.Compiler.Loader.Flatten.storeLexCache", "Vuna/Compiler/Loader/Flatten.vuna:80"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dtraitMethodRefNames", ("Vuna.Compiler.Loader.Flatten.traitMethodRefNames", "Vuna/Compiler/Loader/Flatten.vuna:943"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dtypeRefDominates", ("Vuna.Compiler.Loader.Flatten.typeRefDominates", "Vuna/Compiler/Loader/Flatten.vuna:257"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarnings", ("Vuna.Compiler.Loader.Flatten.unusedImportWarnings", "Vuna/Compiler/Loader/Flatten.vuna:860"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dunusedImportWarningsGo", ("Vuna.Compiler.Loader.Flatten.unusedImportWarningsGo", "Vuna/Compiler/Loader/Flatten.vuna:880"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dvalidateModuleHeader", ("Vuna.Compiler.Loader.Flatten.validateModuleHeader", "Vuna/Compiler/Loader/Flatten.vuna:504"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dvisibleFixitiesOf", ("Vuna.Compiler.Loader.Flatten.visibleFixitiesOf", "Vuna/Compiler/Loader/Flatten.vuna:124"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dwithImportSpan", ("Vuna.Compiler.Loader.Flatten.withImportSpan", "Vuna/Compiler/Loader/Flatten.vuna:591"));
  ("v_Vuna_dCompiler_dLoader_dFlatten_dwithLayerCheck", ("Vuna.Compiler.Loader.Flatten.withLayerCheck", "Vuna/Compiler/Loader/Flatten.vuna:587"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dallowedByRow", ("Vuna.Compiler.Loader.Layers.allowedByRow", "Vuna/Compiler/Loader/Layers.vuna:41"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dcheckImports", ("Vuna.Compiler.Loader.Layers.checkImports", "Vuna/Compiler/Loader/Layers.vuna:79"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dcheckModules", ("Vuna.Compiler.Loader.Layers.checkModules", "Vuna/Compiler/Loader/Layers.vuna:89"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dcheckProjectLayers", ("Vuna.Compiler.Loader.Layers.checkProjectLayers", "Vuna/Compiler/Loader/Layers.vuna:101"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dclosureGo", ("Vuna.Compiler.Loader.Layers.closureGo", "Vuna/Compiler/Loader/Layers.vuna:32"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dcovered", ("Vuna.Compiler.Loader.Layers.covered", "Vuna/Compiler/Loader/Layers.vuna:44"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dimportAllowed", ("Vuna.Compiler.Loader.Layers.importAllowed", "Vuna/Compiler/Loader/Layers.vuna:49"));
  ("v_Vuna_dCompiler_dLoader_dLayers_disLayerPrefix", ("Vuna.Compiler.Loader.Layers.isLayerPrefix", "Vuna/Compiler/Loader/Layers.vuna:25"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dlabelBest", ("Vuna.Compiler.Loader.Layers.labelBest", "Vuna/Compiler/Loader/Layers.vuna:66"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dlabelOf", ("Vuna.Compiler.Loader.Layers.labelOf", "Vuna/Compiler/Loader/Layers.vuna:61"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dlayerMatches", ("Vuna.Compiler.Loader.Layers.layerMatches", "Vuna/Compiler/Loader/Layers.vuna:54"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dlayersOfRoot", ("Vuna.Compiler.Loader.Layers.layersOfRoot", "Vuna/Compiler/Loader/Layers.vuna:71"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dmatchingLayers", ("Vuna.Compiler.Loader.Layers.matchingLayers", "Vuna/Compiler/Loader/Layers.vuna:57"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dusesOfLayer", ("Vuna.Compiler.Loader.Layers.usesOfLayer", "Vuna/Compiler/Loader/Layers.vuna:28"));
  ("v_Vuna_dCompiler_dLoader_dLayers_dwithImportSpan", ("Vuna.Compiler.Loader.Layers.withImportSpan", "Vuna/Compiler/Loader/Layers.vuna:75"));
  ("v_Vuna_dCompiler_dLoader_dModules_d_ujoinNames", ("Vuna.Compiler.Loader.Modules._joinNames", "Vuna/Compiler/Loader/Modules.vuna:230"));
  ("v_Vuna_dCompiler_dLoader_dModules_d_ujoinRootDirs", ("Vuna.Compiler.Loader.Modules._joinRootDirs", "Vuna/Compiler/Loader/Modules.vuna:391"));
  ("v_Vuna_dCompiler_dLoader_dModules_dallIdentChars", ("Vuna.Compiler.Loader.Modules.allIdentChars", "Vuna/Compiler/Loader/Modules.vuna:116"));
  ("v_Vuna_dCompiler_dLoader_dModules_dallSegmentsValid", ("Vuna.Compiler.Loader.Modules.allSegmentsValid", "Vuna/Compiler/Loader/Modules.vuna:125"));
  ("v_Vuna_dCompiler_dLoader_dModules_danyCtorNamed", ("Vuna.Compiler.Loader.Modules.anyCtorNamed", "Vuna/Compiler/Loader/Modules.vuna:459"));
  ("v_Vuna_dCompiler_dLoader_dModules_danyCtorTarget", ("Vuna.Compiler.Loader.Modules.anyCtorTarget", "Vuna/Compiler/Loader/Modules.vuna:464"));
  ("v_Vuna_dCompiler_dLoader_dModules_danyModuleCtorTarget", ("Vuna.Compiler.Loader.Modules.anyModuleCtorTarget", "Vuna/Compiler/Loader/Modules.vuna:437"));
  ("v_Vuna_dCompiler_dLoader_dModules_dcandidateDir", ("Vuna.Compiler.Loader.Modules.candidateDir", "Vuna/Compiler/Loader/Modules.vuna:394"));
  ("v_Vuna_dCompiler_dLoader_dModules_dcheckImportAliases", ("Vuna.Compiler.Loader.Modules.checkImportAliases", "Vuna/Compiler/Loader/Modules.vuna:177"));
  ("v_Vuna_dCompiler_dLoader_dModules_dcollectModuleFiles", ("Vuna.Compiler.Loader.Modules.collectModuleFiles", "Vuna/Compiler/Loader/Modules.vuna:379"));
  ("v_Vuna_dCompiler_dLoader_dModules_dctorCanonical", ("Vuna.Compiler.Loader.Modules.ctorCanonical", "Vuna/Compiler/Loader/Modules.vuna:142"));
  ("v_Vuna_dCompiler_dLoader_dModules_dduplicateImportSpan", ("Vuna.Compiler.Loader.Modules.duplicateImportSpan", "Vuna/Compiler/Loader/Modules.vuna:171"));
  ("v_Vuna_dCompiler_dLoader_dModules_dentriesByName", ("Vuna.Compiler.Loader.Modules.entriesByName", "Vuna/Compiler/Loader/Modules.vuna:269"));
  ("v_Vuna_dCompiler_dLoader_dModules_dexportIndexOf", ("Vuna.Compiler.Loader.Modules.exportIndexOf", "Vuna/Compiler/Loader/Modules.vuna:258"));
  ("v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfGo", ("Vuna.Compiler.Loader.Modules.exportIndexOfGo", "Vuna/Compiler/Loader/Modules.vuna:261"));
  ("v_Vuna_dCompiler_dLoader_dModules_dexportIndexOfModule", ("Vuna.Compiler.Loader.Modules.exportIndexOfModule", "Vuna/Compiler/Loader/Modules.vuna:274"));
  ("v_Vuna_dCompiler_dLoader_dModules_dexportsOf", ("Vuna.Compiler.Loader.Modules.exportsOf", "Vuna/Compiler/Loader/Modules.vuna:252"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfilterCtors", ("Vuna.Compiler.Loader.Modules.filterCtors", "Vuna/Compiler/Loader/Modules.vuna:296"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindExportCtor", ("Vuna.Compiler.Loader.Modules.findExportCtor", "Vuna/Compiler/Loader/Modules.vuna:288"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindExportCtorIn", ("Vuna.Compiler.Loader.Modules.findExportCtorIn", "Vuna/Compiler/Loader/Modules.vuna:308"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindExportCtors", ("Vuna.Compiler.Loader.Modules.findExportCtors", "Vuna/Compiler/Loader/Modules.vuna:292"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindExportCtorsIn", ("Vuna.Compiler.Loader.Modules.findExportCtorsIn", "Vuna/Compiler/Loader/Modules.vuna:311"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindExportType", ("Vuna.Compiler.Loader.Modules.findExportType", "Vuna/Compiler/Loader/Modules.vuna:302"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindExportTypeIn", ("Vuna.Compiler.Loader.Modules.findExportTypeIn", "Vuna/Compiler/Loader/Modules.vuna:314"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindExportValue", ("Vuna.Compiler.Loader.Modules.findExportValue", "Vuna/Compiler/Loader/Modules.vuna:285"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindExportValueIn", ("Vuna.Compiler.Loader.Modules.findExportValueIn", "Vuna/Compiler/Loader/Modules.vuna:305"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindImportModule", ("Vuna.Compiler.Loader.Modules.findImportModule", "Vuna/Compiler/Loader/Modules.vuna:200"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindImportPrefix", ("Vuna.Compiler.Loader.Modules.findImportPrefix", "Vuna/Compiler/Loader/Modules.vuna:207"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindModule", ("Vuna.Compiler.Loader.Modules.findModule", "Vuna/Compiler/Loader/Modules.vuna:421"));
  ("v_Vuna_dCompiler_dLoader_dModules_dfindModuleFile", ("Vuna.Compiler.Loader.Modules.findModuleFile", "Vuna/Compiler/Loader/Modules.vuna:401"));
  ("v_Vuna_dCompiler_dLoader_dModules_dhasDuplicateName", ("Vuna.Compiler.Loader.Modules.hasDuplicateName", "Vuna/Compiler/Loader/Modules.vuna:151"));
  ("v_Vuna_dCompiler_dLoader_dModules_dimportAliases", ("Vuna.Compiler.Loader.Modules.importAliases", "Vuna/Compiler/Loader/Modules.vuna:155"));
  ("v_Vuna_dCompiler_dLoader_dModules_dimportModuleNames", ("Vuna.Compiler.Loader.Modules.importModuleNames", "Vuna/Compiler/Loader/Modules.vuna:148"));
  ("v_Vuna_dCompiler_dLoader_dModules_dimportName", ("Vuna.Compiler.Loader.Modules.importName", "Vuna/Compiler/Loader/Modules.vuna:145"));
  ("v_Vuna_dCompiler_dLoader_dModules_disCtorTargetInDecls", ("Vuna.Compiler.Loader.Modules.isCtorTargetInDecls", "Vuna/Compiler/Loader/Modules.vuna:449"));
  ("v_Vuna_dCompiler_dLoader_dModules_disDataOrRecordCtorTarget", ("Vuna.Compiler.Loader.Modules.isDataOrRecordCtorTarget", "Vuna/Compiler/Loader/Modules.vuna:430"));
  ("v_Vuna_dCompiler_dLoader_dModules_dlookupExport", ("Vuna.Compiler.Loader.Modules.lookupExport", "Vuna/Compiler/Loader/Modules.vuna:280"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmangle", ("Vuna.Compiler.Loader.Modules.mangle", "Vuna/Compiler/Loader/Modules.vuna:137"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmissingModule", ("Vuna.Compiler.Loader.Modules.missingModule", "Vuna/Compiler/Loader/Modules.vuna:239"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleAllImportsOf", ("Vuna.Compiler.Loader.Modules.moduleAllImportsOf", "Vuna/Compiler/Loader/Modules.vuna:60"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleCtors", ("Vuna.Compiler.Loader.Modules.moduleCtors", "Vuna/Compiler/Loader/Modules.vuna:248"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleDecls", ("Vuna.Compiler.Loader.Modules.moduleDecls", "Vuna/Compiler/Loader/Modules.vuna:243"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleDeclsOf", ("Vuna.Compiler.Loader.Modules.moduleDeclsOf", "Vuna/Compiler/Loader/Modules.vuna:63"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleFixitiesOf", ("Vuna.Compiler.Loader.Modules.moduleFixitiesOf", "Vuna/Compiler/Loader/Modules.vuna:66"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleNameOf", ("Vuna.Compiler.Loader.Modules.moduleNameOf", "Vuna/Compiler/Loader/Modules.vuna:54"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleOpaqueOf", ("Vuna.Compiler.Loader.Modules.moduleOpaqueOf", "Vuna/Compiler/Loader/Modules.vuna:73"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulePackageOf", ("Vuna.Compiler.Loader.Modules.modulePackageOf", "Vuna/Compiler/Loader/Modules.vuna:57"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulePath", ("Vuna.Compiler.Loader.Modules.modulePath", "Vuna/Compiler/Loader/Modules.vuna:368"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmoduleReexportsOf", ("Vuna.Compiler.Loader.Modules.moduleReexportsOf", "Vuna/Compiler/Loader/Modules.vuna:70"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtor", ("Vuna.Compiler.Loader.Modules.modulesExportingCtor", "Vuna/Compiler/Loader/Modules.vuna:339"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingCtorFrom", ("Vuna.Compiler.Loader.Modules.modulesExportingCtorFrom", "Vuna/Compiler/Loader/Modules.vuna:331"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingType", ("Vuna.Compiler.Loader.Modules.modulesExportingType", "Vuna/Compiler/Loader/Modules.vuna:352"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingTypeFrom", ("Vuna.Compiler.Loader.Modules.modulesExportingTypeFrom", "Vuna/Compiler/Loader/Modules.vuna:343"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValue", ("Vuna.Compiler.Loader.Modules.modulesExportingValue", "Vuna/Compiler/Loader/Modules.vuna:326"));
  ("v_Vuna_dCompiler_dLoader_dModules_dmodulesExportingValueFrom", ("Vuna.Compiler.Loader.Modules.modulesExportingValueFrom", "Vuna/Compiler/Loader/Modules.vuna:317"));
  ("v_Vuna_dCompiler_dLoader_dModules_dopenModuleNames", ("Vuna.Compiler.Loader.Modules.openModuleNames", "Vuna/Compiler/Loader/Modules.vuna:193"));
  ("v_Vuna_dCompiler_dLoader_dModules_dprojectEntryAllImports", ("Vuna.Compiler.Loader.Modules.projectEntryAllImports", "Vuna/Compiler/Loader/Modules.vuna:76"));
  ("v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNames", ("Vuna.Compiler.Loader.Modules.reexportedImportNames", "Vuna/Compiler/Loader/Modules.vuna:212"));
  ("v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesGo", ("Vuna.Compiler.Loader.Modules.reexportedImportNamesGo", "Vuna/Compiler/Loader/Modules.vuna:215"));
  ("v_Vuna_dCompiler_dLoader_dModules_dreexportedImportNamesOfHeader", ("Vuna.Compiler.Loader.Modules.reexportedImportNamesOfHeader", "Vuna/Compiler/Loader/Modules.vuna:225"));
  ("v_Vuna_dCompiler_dLoader_dModules_drootAllows", ("Vuna.Compiler.Loader.Modules.rootAllows", "Vuna/Compiler/Loader/Modules.vuna:372"));
  ("v_Vuna_dCompiler_dLoader_dModules_dsameTargetRest", ("Vuna.Compiler.Loader.Modules.sameTargetRest", "Vuna/Compiler/Loader/Modules.vuna:357"));
  ("v_Vuna_dCompiler_dLoader_dModules_dspanOfAlias", ("Vuna.Compiler.Loader.Modules.spanOfAlias", "Vuna/Compiler/Loader/Modules.vuna:165"));
  ("v_Vuna_dCompiler_dLoader_dModules_dunifyEntryPairs", ("Vuna.Compiler.Loader.Modules.unifyEntryPairs", "Vuna/Compiler/Loader/Modules.vuna:361"));
  ("v_Vuna_dCompiler_dLoader_dModules_dvalidModuleName", ("Vuna.Compiler.Loader.Modules.validModuleName", "Vuna/Compiler/Loader/Modules.vuna:132"));
  ("v_Vuna_dCompiler_dLoader_dModules_dvalidSegment", ("Vuna.Compiler.Loader.Modules.validSegment", "Vuna/Compiler/Loader/Modules.vuna:120"));
  ("v_Vuna_dCompiler_dLoader_dModules_dvalidateImports", ("Vuna.Compiler.Loader.Modules.validateImports", "Vuna/Compiler/Loader/Modules.vuna:188"));
  ("v_Vuna_dCompiler_dLoader_dModules_dwithImportSite", ("Vuna.Compiler.Loader.Modules.withImportSite", "Vuna/Compiler/Loader/Modules.vuna:162"));
  ("v_Vuna_dCompiler_dLoader_dModules_dwithImporterSpan", ("Vuna.Compiler.Loader.Modules.withImporterSpan", "Vuna/Compiler/Loader/Modules.vuna:398"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dallEq", ("Vuna.Compiler.Loader.Resolve.allEq", "Vuna/Compiler/Loader/Resolve.vuna:292"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dallSameTarget", ("Vuna.Compiler.Loader.Resolve.allSameTarget", "Vuna/Compiler/Loader/Resolve.vuna:287"));
  ("v_Vuna_dCompiler_dLoader_dResolve_danyCtorNamed", ("Vuna.Compiler.Loader.Resolve.anyCtorNamed", "Vuna/Compiler/Loader/Resolve.vuna:211"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dbuiltinArity", ("Vuna.Compiler.Loader.Resolve.builtinArity", "Vuna/Compiler/Loader/Resolve.vuna:43"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dcheckBinder", ("Vuna.Compiler.Loader.Resolve.checkBinder", "Vuna/Compiler/Loader/Resolve.vuna:420"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dcheckDebugConstruct", ("Vuna.Compiler.Loader.Resolve.checkDebugConstruct", "Vuna/Compiler/Loader/Resolve.vuna:570"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dcheckTopName", ("Vuna.Compiler.Loader.Resolve.checkTopName", "Vuna/Compiler/Loader/Resolve.vuna:424"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dcollectRecBinds", ("Vuna.Compiler.Loader.Resolve.collectRecBinds", "Vuna/Compiler/Loader/Resolve.vuna:523"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dconcatLeft", ("Vuna.Compiler.Loader.Resolve.concatLeft", "Vuna/Compiler/Loader/Resolve.vuna:562"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dconstraintHeadOf", ("Vuna.Compiler.Loader.Resolve.constraintHeadOf", "Vuna/Compiler/Loader/Resolve.vuna:859"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dctorCandidates", ("Vuna.Compiler.Loader.Resolve.ctorCandidates", "Vuna/Compiler/Loader/Resolve.vuna:166"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dctorCandsOf", ("Vuna.Compiler.Loader.Resolve.ctorCandsOf", "Vuna/Compiler/Loader/Resolve.vuna:111"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dctorPairTargets", ("Vuna.Compiler.Loader.Resolve.ctorPairTargets", "Vuna/Compiler/Loader/Resolve.vuna:1045"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dctorRelFamily", ("Vuna.Compiler.Loader.Resolve.ctorRelFamily", "Vuna/Compiler/Loader/Resolve.vuna:223"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInDecls", ("Vuna.Compiler.Loader.Resolve.ctorTargetInDecls", "Vuna/Compiler/Loader/Resolve.vuna:199"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dctorTargetInFamily", ("Vuna.Compiler.Loader.Resolve.ctorTargetInFamily", "Vuna/Compiler/Loader/Resolve.vuna:228"));
  ("v_Vuna_dCompiler_dLoader_dResolve_ddeclValueNames", ("Vuna.Compiler.Loader.Resolve.declValueNames", "Vuna/Compiler/Loader/Resolve.vuna:92"));
  ("v_Vuna_dCompiler_dLoader_dResolve_ddropSegs", ("Vuna.Compiler.Loader.Resolve.dropSegs", "Vuna/Compiler/Loader/Resolve.vuna:336"));
  ("v_Vuna_dCompiler_dLoader_dResolve_ddtPreludeNames", ("Vuna.Compiler.Loader.Resolve.dtPreludeNames", "Vuna/Compiler/Loader/Resolve.vuna:63"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dexportTarget", ("Vuna.Compiler.Loader.Resolve.exportTarget", "Vuna/Compiler/Loader/Resolve.vuna:276"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dexprLowerNames", ("Vuna.Compiler.Loader.Resolve.exprLowerNames", "Vuna/Compiler/Loader/Resolve.vuna:995"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dfindFamilyCtorInModules", ("Vuna.Compiler.Loader.Resolve.findFamilyCtorInModules", "Vuna/Compiler/Loader/Resolve.vuna:216"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dfoldFieldChain", ("Vuna.Compiler.Loader.Resolve.foldFieldChain", "Vuna/Compiler/Loader/Resolve.vuna:328"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dimplicitScopeTable", ("Vuna.Compiler.Loader.Resolve.implicitScopeTable", "Vuna/Compiler/Loader/Resolve.vuna:978"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dimportedCtorTargets", ("Vuna.Compiler.Loader.Resolve.importedCtorTargets", "Vuna/Compiler/Loader/Resolve.vuna:158"));
  ("v_Vuna_dCompiler_dLoader_dResolve_disBuiltinName", ("Vuna.Compiler.Loader.Resolve.isBuiltinName", "Vuna/Compiler/Loader/Resolve.vuna:48"));
  ("v_Vuna_dCompiler_dLoader_dResolve_disDtPreludeName", ("Vuna.Compiler.Loader.Resolve.isDtPreludeName", "Vuna/Compiler/Loader/Resolve.vuna:60"));
  ("v_Vuna_dCompiler_dLoader_dResolve_disLowerIdent", ("Vuna.Compiler.Loader.Resolve.isLowerIdent", "Vuna/Compiler/Loader/Resolve.vuna:1000"));
  ("v_Vuna_dCompiler_dLoader_dResolve_disLowerTypeName", ("Vuna.Compiler.Loader.Resolve.isLowerTypeName", "Vuna/Compiler/Loader/Resolve.vuna:751"));
  ("v_Vuna_dCompiler_dLoader_dResolve_disParserSyntaxName", ("Vuna.Compiler.Loader.Resolve.isParserSyntaxName", "Vuna/Compiler/Loader/Resolve.vuna:579"));
  ("v_Vuna_dCompiler_dLoader_dResolve_disStringDomainExpr", ("Vuna.Compiler.Loader.Resolve.isStringDomainExpr", "Vuna/Compiler/Loader/Resolve.vuna:1052"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dleadingImplicitNames", ("Vuna.Compiler.Loader.Resolve.leadingImplicitNames", "Vuna/Compiler/Loader/Resolve.vuna:989"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorResult", ("Vuna.Compiler.Loader.Resolve.localCtorResult", "Vuna/Compiler/Loader/Resolve.vuna:784"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTarget", ("Vuna.Compiler.Loader.Resolve.localCtorTarget", "Vuna/Compiler/Loader/Resolve.vuna:140"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dlocalCtorTargets", ("Vuna.Compiler.Loader.Resolve.localCtorTargets", "Vuna/Compiler/Loader/Resolve.vuna:135"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dlowerTemplate", ("Vuna.Compiler.Loader.Resolve.lowerTemplate", "Vuna/Compiler/Loader/Resolve.vuna:550"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOf", ("Vuna.Compiler.Loader.Resolve.namespacesOf", "Vuna/Compiler/Loader/Resolve.vuna:130"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dnamespacesOfWith", ("Vuna.Compiler.Loader.Resolve.namespacesOfWith", "Vuna/Compiler/Loader/Resolve.vuna:120"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dnotEmptyList", ("Vuna.Compiler.Loader.Resolve.notEmptyList", "Vuna/Compiler/Loader/Resolve.vuna:174"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dpairExportTarget", ("Vuna.Compiler.Loader.Resolve.pairExportTarget", "Vuna/Compiler/Loader/Resolve.vuna:150"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dpairIsDataCtor", ("Vuna.Compiler.Loader.Resolve.pairIsDataCtor", "Vuna/Compiler/Loader/Resolve.vuna:154"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dpickCtorOrOver", ("Vuna.Compiler.Loader.Resolve.pickCtorOrOver", "Vuna/Compiler/Loader/Resolve.vuna:399"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveAlt", ("Vuna.Compiler.Loader.Resolve.resolveAlt", "Vuna/Compiler/Loader/Resolve.vuna:463"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveConstraintExpr", ("Vuna.Compiler.Loader.Resolve.resolveConstraintExpr", "Vuna/Compiler/Loader/Resolve.vuna:852"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveCtor", ("Vuna.Compiler.Loader.Resolve.resolveCtor", "Vuna/Compiler/Loader/Resolve.vuna:407"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDecl", ("Vuna.Compiler.Loader.Resolve.resolveCtorDecl", "Vuna/Compiler/Loader/Resolve.vuna:746"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorDotted", ("Vuna.Compiler.Loader.Resolve.resolveCtorDotted", "Vuna/Compiler/Loader/Resolve.vuna:298"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveCtorSpec", ("Vuna.Compiler.Loader.Resolve.resolveCtorSpec", "Vuna/Compiler/Loader/Resolve.vuna:904"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDecl", ("Vuna.Compiler.Loader.Resolve.resolveDecl", "Vuna/Compiler/Loader/Resolve.vuna:910"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDeclWithImplicitScopes", ("Vuna.Compiler.Loader.Resolve.resolveDeclWithImplicitScopes", "Vuna/Compiler/Loader/Resolve.vuna:1009"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDo", ("Vuna.Compiler.Loader.Resolve.resolveDo", "Vuna/Compiler/Loader/Resolve.vuna:696"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDoBind", ("Vuna.Compiler.Loader.Resolve.resolveDoBind", "Vuna/Compiler/Loader/Resolve.vuna:708"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDoChain", ("Vuna.Compiler.Loader.Resolve.resolveDoChain", "Vuna/Compiler/Loader/Resolve.vuna:723"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedExpr", ("Vuna.Compiler.Loader.Resolve.resolveDottedExpr", "Vuna/Compiler/Loader/Resolve.vuna:312"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeName", ("Vuna.Compiler.Loader.Resolve.resolveDottedTypeName", "Vuna/Compiler/Loader/Resolve.vuna:832"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveDottedTypeTargetOnly", ("Vuna.Compiler.Loader.Resolve.resolveDottedTypeTargetOnly", "Vuna/Compiler/Loader/Resolve.vuna:249"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveEntry", ("Vuna.Compiler.Loader.Resolve.resolveEntry", "Vuna/Compiler/Loader/Resolve.vuna:1018"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveExpr", ("Vuna.Compiler.Loader.Resolve.resolveExpr", "Vuna/Compiler/Loader/Resolve.vuna:591"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveFamilyQualifiedCtor", ("Vuna.Compiler.Loader.Resolve.resolveFamilyQualifiedCtor", "Vuna/Compiler/Loader/Resolve.vuna:264"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveFieldValue", ("Vuna.Compiler.Loader.Resolve.resolveFieldValue", "Vuna/Compiler/Loader/Resolve.vuna:739"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveFuelBound", ("Vuna.Compiler.Loader.Resolve.resolveFuelBound", "Vuna/Compiler/Loader/Resolve.vuna:39"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveGlobal", ("Vuna.Compiler.Loader.Resolve.resolveGlobal", "Vuna/Compiler/Loader/Resolve.vuna:363"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveInstanceMethod", ("Vuna.Compiler.Loader.Resolve.resolveInstanceMethod", "Vuna/Compiler/Loader/Resolve.vuna:957"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveInterpParts", ("Vuna.Compiler.Loader.Resolve.resolveInterpParts", "Vuna/Compiler/Loader/Resolve.vuna:675"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveLet", ("Vuna.Compiler.Loader.Resolve.resolveLet", "Vuna/Compiler/Loader/Resolve.vuna:492"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveLetSeq", ("Vuna.Compiler.Loader.Resolve.resolveLetSeq", "Vuna/Compiler/Loader/Resolve.vuna:498"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalClause", ("Vuna.Compiler.Loader.Resolve.resolveLocalClause", "Vuna/Compiler/Loader/Resolve.vuna:473"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveLocalPats", ("Vuna.Compiler.Loader.Resolve.resolveLocalPats", "Vuna/Compiler/Loader/Resolve.vuna:482"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveLowerTypeName", ("Vuna.Compiler.Loader.Resolve.resolveLowerTypeName", "Vuna/Compiler/Loader/Resolve.vuna:791"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveModules", ("Vuna.Compiler.Loader.Resolve.resolveModules", "Vuna/Compiler/Loader/Resolve.vuna:1022"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveNonLowerTypeName", ("Vuna.Compiler.Loader.Resolve.resolveNonLowerTypeName", "Vuna/Compiler/Loader/Resolve.vuna:814"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolvePattern", ("Vuna.Compiler.Loader.Resolve.resolvePattern", "Vuna/Compiler/Loader/Resolve.vuna:433"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveProgram", ("Vuna.Compiler.Loader.Resolve.resolveProgram", "Vuna/Compiler/Loader/Resolve.vuna:967"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveQualified", ("Vuna.Compiler.Loader.Resolve.resolveQualified", "Vuna/Compiler/Loader/Resolve.vuna:178"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveQualifiedPath", ("Vuna.Compiler.Loader.Resolve.resolveQualifiedPath", "Vuna/Compiler/Loader/Resolve.vuna:340"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveRecLet", ("Vuna.Compiler.Loader.Resolve.resolveRecLet", "Vuna/Compiler/Loader/Resolve.vuna:512"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveRecValues", ("Vuna.Compiler.Loader.Resolve.resolveRecValues", "Vuna/Compiler/Loader/Resolve.vuna:531"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordField", ("Vuna.Compiler.Loader.Resolve.resolveRecordField", "Vuna/Compiler/Loader/Resolve.vuna:946"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveRecordPatternField", ("Vuna.Compiler.Loader.Resolve.resolveRecordPatternField", "Vuna/Compiler/Loader/Resolve.vuna:457"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTopName", ("Vuna.Compiler.Loader.Resolve.resolveTopName", "Vuna/Compiler/Loader/Resolve.vuna:429"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTraitMethod", ("Vuna.Compiler.Loader.Resolve.resolveTraitMethod", "Vuna/Compiler/Loader/Resolve.vuna:951"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExpr", ("Vuna.Compiler.Loader.Resolve.resolveTypeExpr", "Vuna/Compiler/Loader/Resolve.vuna:864"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeExprScoped", ("Vuna.Compiler.Loader.Resolve.resolveTypeExprScoped", "Vuna/Compiler/Loader/Resolve.vuna:870"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeName", ("Vuna.Compiler.Loader.Resolve.resolveTypeName", "Vuna/Compiler/Loader/Resolve.vuna:774"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTarget", ("Vuna.Compiler.Loader.Resolve.resolveTypeTarget", "Vuna/Compiler/Loader/Resolve.vuna:236"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dresolveTypeTopName", ("Vuna.Compiler.Loader.Resolve.resolveTypeTopName", "Vuna/Compiler/Loader/Resolve.vuna:899"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dscopeNamesOf", ("Vuna.Compiler.Loader.Resolve.scopeNamesOf", "Vuna/Compiler/Loader/Resolve.vuna:1005"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dstartsUpperName", ("Vuna.Compiler.Loader.Resolve.startsUpperName", "Vuna/Compiler/Loader/Resolve.vuna:756"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dtakeSegs", ("Vuna.Compiler.Loader.Resolve.takeSegs", "Vuna/Compiler/Loader/Resolve.vuna:332"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dtemplateChunks", ("Vuna.Compiler.Loader.Resolve.templateChunks", "Vuna/Compiler/Loader/Resolve.vuna:555"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dtraitImportHint", ("Vuna.Compiler.Loader.Resolve.traitImportHint", "Vuna/Compiler/Loader/Resolve.vuna:70"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dtyShape", ("Vuna.Compiler.Loader.Resolve.tyShape", "Vuna/Compiler/Loader/Resolve.vuna:1029"));
  ("v_Vuna_dCompiler_dLoader_dResolve_duniqueCtorTarget", ("Vuna.Compiler.Loader.Resolve.uniqueCtorTarget", "Vuna/Compiler/Loader/Resolve.vuna:280"));
  ("v_Vuna_dCompiler_dLoader_dResolve_dvalueNamesOf", ("Vuna.Compiler.Loader.Resolve.valueNamesOf", "Vuna/Compiler/Loader/Resolve.vuna:103"));
  ("v_Vuna_dCompiler_dLowering_dChecks_daddName", ("Vuna.Compiler.Lowering.Checks.addName", "Vuna/Compiler/Lowering/Checks.vuna:241"));
  ("v_Vuna_dCompiler_dLowering_dChecks_daddRuntimeDep", ("Vuna.Compiler.Lowering.Checks.addRuntimeDep", "Vuna/Compiler/Lowering/Checks.vuna:280"));
  ("v_Vuna_dCompiler_dLowering_dChecks_daxiomNamesOf", ("Vuna.Compiler.Lowering.Checks.axiomNamesOf", "Vuna/Compiler/Lowering/Checks.vuna:67"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dbinderAt", ("Vuna.Compiler.Lowering.Checks.binderAt", "Vuna/Compiler/Lowering/Checks.vuna:188"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckAllDefScopes", ("Vuna.Compiler.Lowering.Checks.checkAllDefScopes", "Vuna/Compiler/Lowering/Checks.vuna:387"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckAllErasure", ("Vuna.Compiler.Lowering.Checks.checkAllErasure", "Vuna/Compiler/Lowering/Checks.vuna:108"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasure", ("Vuna.Compiler.Lowering.Checks.checkAltErasure", "Vuna/Compiler/Lowering/Checks.vuna:432"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckAltErasureFuel", ("Vuna.Compiler.Lowering.Checks.checkAltErasureFuel", "Vuna/Compiler/Lowering/Checks.vuna:178"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckAltScopes", ("Vuna.Compiler.Lowering.Checks.checkAltScopes", "Vuna/Compiler/Lowering/Checks.vuna:380"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasure", ("Vuna.Compiler.Lowering.Checks.checkConArgsErasure", "Vuna/Compiler/Lowering/Checks.vuna:428"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckConArgsErasureFuel", ("Vuna.Compiler.Lowering.Checks.checkConArgsErasureFuel", "Vuna/Compiler/Lowering/Checks.vuna:170"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckErasure", ("Vuna.Compiler.Lowering.Checks.checkErasure", "Vuna/Compiler/Lowering/Checks.vuna:406"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckErasureFuel", ("Vuna.Compiler.Lowering.Checks.checkErasureFuel", "Vuna/Compiler/Lowering/Checks.vuna:130"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntime", ("Vuna.Compiler.Lowering.Checks.checkNoAxiomRuntime", "Vuna/Compiler/Lowering/Checks.vuna:96"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckNoAxiomRuntimeGo", ("Vuna.Compiler.Lowering.Checks.checkNoAxiomRuntimeGo", "Vuna/Compiler/Lowering/Checks.vuna:99"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckOneErasure", ("Vuna.Compiler.Lowering.Checks.checkOneErasure", "Vuna/Compiler/Lowering/Checks.vuna:116"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopes", ("Vuna.Compiler.Lowering.Checks.checkTermScopes", "Vuna/Compiler/Lowering/Checks.vuna:344"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dcheckTermScopesArgs", ("Vuna.Compiler.Lowering.Checks.checkTermScopesArgs", "Vuna/Compiler/Lowering/Checks.vuna:375"));
  ("v_Vuna_dCompiler_dLowering_dChecks_ddefLocDiag", ("Vuna.Compiler.Lowering.Checks.defLocDiag", "Vuna/Compiler/Lowering/Checks.vuna:91"));
  ("v_Vuna_dCompiler_dLowering_dChecks_ddefTable", ("Vuna.Compiler.Lowering.Checks.defTable", "Vuna/Compiler/Lowering/Checks.vuna:52"));
  ("v_Vuna_dCompiler_dLowering_dChecks_derasureFuelFor", ("Vuna.Compiler.Lowering.Checks.erasureFuelFor", "Vuna/Compiler/Lowering/Checks.vuna:415"));
  ("v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForAlts", ("Vuna.Compiler.Lowering.Checks.erasureFuelForAlts", "Vuna/Compiler/Lowering/Checks.vuna:435"));
  ("v_Vuna_dCompiler_dLowering_dChecks_derasureFuelForArgs", ("Vuna.Compiler.Lowering.Checks.erasureFuelForArgs", "Vuna/Compiler/Lowering/Checks.vuna:424"));
  ("v_Vuna_dCompiler_dLowering_dChecks_derasureFuelMax", ("Vuna.Compiler.Lowering.Checks.erasureFuelMax", "Vuna/Compiler/Lowering/Checks.vuna:421"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dfindDtDef", ("Vuna.Compiler.Lowering.Checks.findDtDef", "Vuna/Compiler/Lowering/Checks.vuna:59"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpine", ("Vuna.Compiler.Lowering.Checks.flattenAppSpine", "Vuna/Compiler/Lowering/Checks.vuna:42"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dflattenAppSpineGo", ("Vuna.Compiler.Lowering.Checks.flattenAppSpineGo", "Vuna/Compiler/Lowering/Checks.vuna:45"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dflattenConApp", ("Vuna.Compiler.Lowering.Checks.flattenConApp", "Vuna/Compiler/Lowering/Checks.vuna:34"));
  ("v_Vuna_dCompiler_dLowering_dChecks_disAxiomDef", ("Vuna.Compiler.Lowering.Checks.isAxiomDef", "Vuna/Compiler/Lowering/Checks.vuna:64"));
  ("v_Vuna_dCompiler_dLowering_dChecks_disTypeLevelDef", ("Vuna.Compiler.Lowering.Checks.isTypeLevelDef", "Vuna/Compiler/Lowering/Checks.vuna:72"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dnoUseFlags", ("Vuna.Compiler.Lowering.Checks.noUseFlags", "Vuna/Compiler/Lowering/Checks.vuna:258"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dorUseFlags", ("Vuna.Compiler.Lowering.Checks.orUseFlags", "Vuna/Compiler/Lowering/Checks.vuna:261"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefs", ("Vuna.Compiler.Lowering.Checks.partitionDefs", "Vuna/Compiler/Lowering/Checks.vuna:78"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dpartitionDefsGo", ("Vuna.Compiler.Lowering.Checks.partitionDefsGo", "Vuna/Compiler/Lowering/Checks.vuna:81"));
  ("v_Vuna_dCompiler_dLowering_dChecks_druntimeNamesOf", ("Vuna.Compiler.Lowering.Checks.runtimeNamesOf", "Vuna/Compiler/Lowering/Checks.vuna:335"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dshowMetaHint", ("Vuna.Compiler.Lowering.Checks.showMetaHint", "Vuna/Compiler/Lowering/Checks.vuna:127"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAlts", ("Vuna.Compiler.Lowering.Checks.termDepsAlts", "Vuna/Compiler/Lowering/Checks.vuna:403"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dtermDepsAltsFuel", ("Vuna.Compiler.Lowering.Checks.termDepsAltsFuel", "Vuna/Compiler/Lowering/Checks.vuna:234"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgs", ("Vuna.Compiler.Lowering.Checks.termDepsArgs", "Vuna/Compiler/Lowering/Checks.vuna:400"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dtermDepsArgsFuel", ("Vuna.Compiler.Lowering.Checks.termDepsArgsFuel", "Vuna/Compiler/Lowering/Checks.vuna:227"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dtermDepsInto", ("Vuna.Compiler.Lowering.Checks.termDepsInto", "Vuna/Compiler/Lowering/Checks.vuna:397"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dtermDepsIntoFuel", ("Vuna.Compiler.Lowering.Checks.termDepsIntoFuel", "Vuna/Compiler/Lowering/Checks.vuna:193"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dtermUseAltsFuel", ("Vuna.Compiler.Lowering.Checks.termUseAltsFuel", "Vuna/Compiler/Lowering/Checks.vuna:328"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dtermUseArgsFuel", ("Vuna.Compiler.Lowering.Checks.termUseArgsFuel", "Vuna/Compiler/Lowering/Checks.vuna:321"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dtermUseFuel", ("Vuna.Compiler.Lowering.Checks.termUseFuel", "Vuna/Compiler/Lowering/Checks.vuna:288"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dtermUseInto", ("Vuna.Compiler.Lowering.Checks.termUseInto", "Vuna/Compiler/Lowering/Checks.vuna:272"));
  ("v_Vuna_dCompiler_dLowering_dChecks_duseBudgetFor", ("Vuna.Compiler.Lowering.Checks.useBudgetFor", "Vuna/Compiler/Lowering/Checks.vuna:277"));
  ("v_Vuna_dCompiler_dLowering_dChecks_dwithFlags", ("Vuna.Compiler.Lowering.Checks.withFlags", "Vuna/Compiler/Lowering/Checks.vuna:285"));
  ("v_Vuna_dCompiler_dLowering_dEntry_dactionResultTyIn", ("Vuna.Compiler.Lowering.Entry.actionResultTyIn", "Vuna/Compiler/Lowering/Entry.vuna:25"));
  ("v_Vuna_dCompiler_dLowering_dEntry_dcollectBuiltinRowTags", ("Vuna.Compiler.Lowering.Entry.collectBuiltinRowTags", "Vuna/Compiler/Lowering/Entry.vuna:31"));
  ("v_Vuna_dCompiler_dLowering_dEntry_dfilterMapErrorRunHost", ("Vuna.Compiler.Lowering.Entry.filterMapErrorRunHost", "Vuna/Compiler/Lowering/Entry.vuna:95"));
  ("v_Vuna_dCompiler_dLowering_dEntry_dfilterMapRunHost", ("Vuna.Compiler.Lowering.Entry.filterMapRunHost", "Vuna/Compiler/Lowering/Entry.vuna:86"));
  ("v_Vuna_dCompiler_dLowering_dEntry_dlowerEntryOf", ("Vuna.Compiler.Lowering.Entry.lowerEntryOf", "Vuna/Compiler/Lowering/Entry.vuna:73"));
  ("v_Vuna_dCompiler_dLowering_dEntry_dmainRowTags", ("Vuna.Compiler.Lowering.Entry.mainRowTags", "Vuna/Compiler/Lowering/Entry.vuna:44"));
  ("v_Vuna_dCompiler_dLowering_dEntry_dmainShowForNameIr", ("Vuna.Compiler.Lowering.Entry.mainShowForNameIr", "Vuna/Compiler/Lowering/Entry.vuna:59"));
  ("v_Vuna_dCompiler_dLowering_dEntry_dmainShowIr", ("Vuna.Compiler.Lowering.Entry.mainShowIr", "Vuna/Compiler/Lowering/Entry.vuna:52"));
  ("v_Vuna_dCompiler_dLowering_dEntry_dmainShowRtIr", ("Vuna.Compiler.Lowering.Entry.mainShowRtIr", "Vuna/Compiler/Lowering/Entry.vuna:64"));
  ("v_Vuna_dCompiler_dLowering_dEnv_danyDefFlag", ("Vuna.Compiler.Lowering.Env.anyDefFlag", "Vuna/Compiler/Lowering/Env.vuna:331"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgs", ("Vuna.Compiler.Lowering.Env.collectFamilyArgs", "Vuna/Compiler/Lowering/Env.vuna:232"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dcollectFamilyArgsFuel", ("Vuna.Compiler.Lowering.Env.collectFamilyArgsFuel", "Vuna/Compiler/Lowering/Env.vuna:236"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevels", ("Vuna.Compiler.Lowering.Env.collectUsedLevels", "Vuna/Compiler/Lowering/Env.vuna:205"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedLevelsFuel", ("Vuna.Compiler.Lowering.Env.collectUsedLevelsFuel", "Vuna/Compiler/Lowering/Env.vuna:208"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dcollectUsedSpineFuel", ("Vuna.Compiler.Lowering.Env.collectUsedSpineFuel", "Vuna/Compiler/Lowering/Env.vuna:225"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueFlagsOf", ("Vuna.Compiler.Lowering.Env.ctorOpaqueFlagsOf", "Vuna/Compiler/Lowering/Env.vuna:142"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueGo", ("Vuna.Compiler.Lowering.Env.ctorOpaqueGo", "Vuna/Compiler/Lowering/Env.vuna:145"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dctorOpaqueTableOf", ("Vuna.Compiler.Lowering.Env.ctorOpaqueTableOf", "Vuna/Compiler/Lowering/Env.vuna:367"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dctorTableOf", ("Vuna.Compiler.Lowering.Env.ctorTableOf", "Vuna/Compiler/Lowering/Env.vuna:361"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dctorUsedLevels", ("Vuna.Compiler.Lowering.Env.ctorUsedLevels", "Vuna/Compiler/Lowering/Env.vuna:246"));
  ("v_Vuna_dCompiler_dLowering_dEnv_ddataUsedLevels", ("Vuna.Compiler.Lowering.Env.dataUsedLevels", "Vuna/Compiler/Lowering/Env.vuna:264"));
  ("v_Vuna_dCompiler_dLowering_dEnv_ddefFactsOf", ("Vuna.Compiler.Lowering.Env.defFactsOf", "Vuna/Compiler/Lowering/Env.vuna:394"));
  ("v_Vuna_dCompiler_dLowering_dEnv_ddefFactsTblOf", ("Vuna.Compiler.Lowering.Env.defFactsTblOf", "Vuna/Compiler/Lowering/Env.vuna:385"));
  ("v_Vuna_dCompiler_dLowering_dEnv_ddefTblOf", ("Vuna.Compiler.Lowering.Env.defTblOf", "Vuna/Compiler/Lowering/Env.vuna:412"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dfactsDepsOf", ("Vuna.Compiler.Lowering.Env.factsDepsOf", "Vuna/Compiler/Lowering/Env.vuna:310"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dfactsOf", ("Vuna.Compiler.Lowering.Env.factsOf", "Vuna/Compiler/Lowering/Env.vuna:314"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dfindFamilyCtor", ("Vuna.Compiler.Lowering.Env.findFamilyCtor", "Vuna/Compiler/Lowering/Env.vuna:350"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dfindListFamilyData", ("Vuna.Compiler.Lowering.Env.findListFamilyData", "Vuna/Compiler/Lowering/Env.vuna:356"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dfloatRenderRefName", ("Vuna.Compiler.Lowering.Env.floatRenderRefName", "Vuna/Compiler/Lowering/Env.vuna:306"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dhasDataNamed", ("Vuna.Compiler.Lowering.Env.hasDataNamed", "Vuna/Compiler/Lowering/Env.vuna:421"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dhasRecordRepr", ("Vuna.Compiler.Lowering.Env.hasRecordRepr", "Vuna/Compiler/Lowering/Env.vuna:130"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dintrinsicUseFlagsTbl", ("Vuna.Compiler.Lowering.Env.intrinsicUseFlagsTbl", "Vuna/Compiler/Lowering/Env.vuna:400"));
  ("v_Vuna_dCompiler_dLowering_dEnv_disRecordData", ("Vuna.Compiler.Lowering.Env.isRecordData", "Vuna/Compiler/Lowering/Env.vuna:107"));
  ("v_Vuna_dCompiler_dLowering_dEnv_disTypeHeadOpaqueDatas", ("Vuna.Compiler.Lowering.Env.isTypeHeadOpaqueDatas", "Vuna/Compiler/Lowering/Env.vuna:89"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dlevelListEq", ("Vuna.Compiler.Lowering.Env.levelListEq", "Vuna/Compiler/Lowering/Env.vuna:273"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotGoIn", ("Vuna.Compiler.Lowering.Env.levelSlotGoIn", "Vuna/Compiler/Lowering/Env.vuna:187"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dlevelSlotIn", ("Vuna.Compiler.Lowering.Env.levelSlotIn", "Vuna/Compiler/Lowering/Env.vuna:184"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dlistFamOf", ("Vuna.Compiler.Lowering.Env.listFamOf", "Vuna/Compiler/Lowering/Env.vuna:341"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dlistLength", ("Vuna.Compiler.Lowering.Env.listLength", "Vuna/Compiler/Lowering/Env.vuna:72"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dlocRowPair", ("Vuna.Compiler.Lowering.Env.locRowPair", "Vuna/Compiler/Lowering/Env.vuna:159"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dlookupFacts", ("Vuna.Compiler.Lowering.Env.lookupFacts", "Vuna/Compiler/Lowering/Env.vuna:336"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dlookupTyParamsIn", ("Vuna.Compiler.Lowering.Env.lookupTyParamsIn", "Vuna/Compiler/Lowering/Env.vuna:200"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dlookupUsedIn", ("Vuna.Compiler.Lowering.Env.lookupUsedIn", "Vuna/Compiler/Lowering/Env.vuna:195"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dlowerSharedOf", ("Vuna.Compiler.Lowering.Env.lowerSharedOf", "Vuna/Compiler/Lowering/Env.vuna:320"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dlwEnvShared", ("Vuna.Compiler.Lowering.Env.lwEnvShared", "Vuna/Compiler/Lowering/Env.vuna:62"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dlwEnvWithUnit", ("Vuna.Compiler.Lowering.Env.lwEnvWithUnit", "Vuna/Compiler/Lowering/Env.vuna:66"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dmapSome", ("Vuna.Compiler.Lowering.Env.mapSome", "Vuna/Compiler/Lowering/Env.vuna:81"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dmemIntIn", ("Vuna.Compiler.Lowering.Env.memIntIn", "Vuna/Compiler/Lowering/Env.vuna:180"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dmemOpaqueLevel", ("Vuna.Compiler.Lowering.Env.memOpaqueLevel", "Vuna/Compiler/Lowering/Env.vuna:95"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dmkLwEnv", ("Vuna.Compiler.Lowering.Env.mkLwEnv", "Vuna/Compiler/Lowering/Env.vuna:373"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dnameSetOf", ("Vuna.Compiler.Lowering.Env.nameSetOf", "Vuna/Compiler/Lowering/Env.vuna:425"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dnthValueIn", ("Vuna.Compiler.Lowering.Env.nthValueIn", "Vuna/Compiler/Lowering/Env.vuna:191"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dpushDep", ("Vuna.Compiler.Lowering.Env.pushDep", "Vuna/Compiler/Lowering/Env.vuna:77"));
  ("v_Vuna_dCompiler_dLowering_dEnv_drecordFieldsOf", ("Vuna.Compiler.Lowering.Env.recordFieldsOf", "Vuna/Compiler/Lowering/Env.vuna:299"));
  ("v_Vuna_dCompiler_dLowering_dEnv_drecordRtFields", ("Vuna.Compiler.Lowering.Env.recordRtFields", "Vuna/Compiler/Lowering/Env.vuna:114"));
  ("v_Vuna_dCompiler_dLowering_dEnv_drecordRtFieldsGo", ("Vuna.Compiler.Lowering.Env.recordRtFieldsGo", "Vuna/Compiler/Lowering/Env.vuna:122"));
  ("v_Vuna_dCompiler_dLowering_dEnv_drtDatasOf", ("Vuna.Compiler.Lowering.Env.rtDatasOf", "Vuna/Compiler/Lowering/Env.vuna:137"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dsameLevelTable", ("Vuna.Compiler.Lowering.Env.sameLevelTable", "Vuna/Compiler/Lowering/Env.vuna:278"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dstrTblOf", ("Vuna.Compiler.Lowering.Env.strTblOf", "Vuna/Compiler/Lowering/Env.vuna:417"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dtyParamsOf", ("Vuna.Compiler.Lowering.Env.tyParamsOf", "Vuna/Compiler/Lowering/Env.vuna:296"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevels", ("Vuna.Compiler.Lowering.Env.typeParamLevels", "Vuna/Compiler/Lowering/Env.vuna:171"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dtypeParamLevelsGo", ("Vuna.Compiler.Lowering.Env.typeParamLevelsGo", "Vuna/Compiler/Lowering/Env.vuna:174"));
  ("v_Vuna_dCompiler_dLowering_dEnv_duseFlagsOfName", ("Vuna.Compiler.Lowering.Env.useFlagsOfName", "Vuna/Compiler/Lowering/Env.vuna:406"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dusedTableFix", ("Vuna.Compiler.Lowering.Env.usedTableFix", "Vuna/Compiler/Lowering/Env.vuna:285"));
  ("v_Vuna_dCompiler_dLowering_dEnv_dusedTableFixFuel", ("Vuna.Compiler.Lowering.Env.usedTableFixFuel", "Vuna/Compiler/Lowering/Env.vuna:288"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dadjOfDef", ("Vuna.Compiler.Lowering.Program.adjOfDef", "Vuna/Compiler/Lowering/Program.vuna:901"));
  ("v_Vuna_dCompiler_dLowering_dProgram_daeEnvOf", ("Vuna.Compiler.Lowering.Program.aeEnvOf", "Vuna/Compiler/Lowering/Program.vuna:374"));
  ("v_Vuna_dCompiler_dLowering_dProgram_daePatsOf", ("Vuna.Compiler.Lowering.Program.aePatsOf", "Vuna/Compiler/Lowering/Program.vuna:377"));
  ("v_Vuna_dCompiler_dLowering_dProgram_daeStOf", ("Vuna.Compiler.Lowering.Program.aeStOf", "Vuna/Compiler/Lowering/Program.vuna:380"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dalignCtorArgs", ("Vuna.Compiler.Lowering.Program.alignCtorArgs", "Vuna/Compiler/Lowering/Program.vuna:279"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dallCatchAll", ("Vuna.Compiler.Lowering.Program.allCatchAll", "Vuna/Compiler/Lowering/Program.vuna:439"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dallRuntimeArgs", ("Vuna.Compiler.Lowering.Program.allRuntimeArgs", "Vuna/Compiler/Lowering/Program.vuna:266"));
  ("v_Vuna_dCompiler_dLowering_dProgram_daltEnvCheckedIn", ("Vuna.Compiler.Lowering.Program.altEnvCheckedIn", "Vuna/Compiler/Lowering/Program.vuna:401"));
  ("v_Vuna_dCompiler_dLowering_dProgram_daltEnvFullIn", ("Vuna.Compiler.Lowering.Program.altEnvFullIn", "Vuna/Compiler/Lowering/Program.vuna:408"));
  ("v_Vuna_dCompiler_dLowering_dProgram_daltEnvGo", ("Vuna.Compiler.Lowering.Program.altEnvGo", "Vuna/Compiler/Lowering/Program.vuna:387"));
  ("v_Vuna_dCompiler_dLowering_dProgram_daltEnvIn", ("Vuna.Compiler.Lowering.Program.altEnvIn", "Vuna/Compiler/Lowering/Program.vuna:396"));
  ("v_Vuna_dCompiler_dLowering_dProgram_daltEnvKeptIn", ("Vuna.Compiler.Lowering.Program.altEnvKeptIn", "Vuna/Compiler/Lowering/Program.vuna:422"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dappendGroups", ("Vuna.Compiler.Lowering.Program.appendGroups", "Vuna/Compiler/Lowering/Program.vuna:809"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dbinderAtIn", ("Vuna.Compiler.Lowering.Program.binderAtIn", "Vuna/Compiler/Lowering/Program.vuna:117"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dbinderErasedOf", ("Vuna.Compiler.Lowering.Program.binderErasedOf", "Vuna/Compiler/Lowering/Program.vuna:52"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dbinderOfParam", ("Vuna.Compiler.Lowering.Program.binderOfParam", "Vuna/Compiler/Lowering/Program.vuna:181"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNames", ("Vuna.Compiler.Lowering.Program.checkNoDupOcamlNames", "Vuna/Compiler/Lowering/Program.vuna:734"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dcheckNoDupOcamlNamesGo", ("Vuna.Compiler.Lowering.Program.checkNoDupOcamlNamesGo", "Vuna/Compiler/Lowering/Program.vuna:737"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dcheckProgramOf", ("Vuna.Compiler.Lowering.Program.checkProgramOf", "Vuna/Compiler/Lowering/Program.vuna:835"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dcheckRuntimeContract", ("Vuna.Compiler.Lowering.Program.checkRuntimeContract", "Vuna/Compiler/Lowering/Program.vuna:843"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dcollectLamChainIn", ("Vuna.Compiler.Lowering.Program.collectLamChainIn", "Vuna/Compiler/Lowering/Program.vuna:165"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesGo", ("Vuna.Compiler.Lowering.Program.concatLeavesGo", "Vuna/Compiler/Lowering/Program.vuna:247"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dconcatLeavesIn", ("Vuna.Compiler.Lowering.Program.concatLeavesIn", "Vuna/Compiler/Lowering/Program.vuna:244"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dcountKept", ("Vuna.Compiler.Lowering.Program.countKept", "Vuna/Compiler/Lowering/Program.vuna:383"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dctorArgIr", ("Vuna.Compiler.Lowering.Program.ctorArgIr", "Vuna/Compiler/Lowering/Program.vuna:306"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dctorOpaqueKeptFlags", ("Vuna.Compiler.Lowering.Program.ctorOpaqueKeptFlags", "Vuna/Compiler/Lowering/Program.vuna:311"));
  ("v_Vuna_dCompiler_dLowering_dProgram_deffUnitTyIn", ("Vuna.Compiler.Lowering.Program.effUnitTyIn", "Vuna/Compiler/Lowering/Program.vuna:156"));
  ("v_Vuna_dCompiler_dLowering_dProgram_densureUniqueOcamlNamesIn", ("Vuna.Compiler.Lowering.Program.ensureUniqueOcamlNamesIn", "Vuna/Compiler/Lowering/Program.vuna:743"));
  ("v_Vuna_dCompiler_dLowering_dProgram_deraseTele", ("Vuna.Compiler.Lowering.Program.eraseTele", "Vuna/Compiler/Lowering/Program.vuna:613"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dexternBasicIr", ("Vuna.Compiler.Lowering.Program.externBasicIr", "Vuna/Compiler/Lowering/Program.vuna:714"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dexternDomIr", ("Vuna.Compiler.Lowering.Program.externDomIr", "Vuna/Compiler/Lowering/Program.vuna:708"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dexternTyIr", ("Vuna.Compiler.Lowering.Program.externTyIr", "Vuna/Compiler/Lowering/Program.vuna:700"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dfindAltBy", ("Vuna.Compiler.Lowering.Program.findAltBy", "Vuna/Compiler/Lowering/Program.vuna:515"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dfindCatchAllAlt", ("Vuna.Compiler.Lowering.Program.findCatchAllAlt", "Vuna/Compiler/Lowering/Program.vuna:519"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dfirstOfList", ("Vuna.Compiler.Lowering.Program.firstOfList", "Vuna/Compiler/Lowering/Program.vuna:862"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dflattenConcatChainIn", ("Vuna.Compiler.Lowering.Program.flattenConcatChainIn", "Vuna/Compiler/Lowering/Program.vuna:237"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dflattenIntrinsicAppIn", ("Vuna.Compiler.Lowering.Program.flattenIntrinsicAppIn", "Vuna/Compiler/Lowering/Program.vuna:259"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dgroupDefs", ("Vuna.Compiler.Lowering.Program.groupDefs", "Vuna/Compiler/Lowering/Program.vuna:781"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dgroupOfPair", ("Vuna.Compiler.Lowering.Program.groupOfPair", "Vuna/Compiler/Lowering/Program.vuna:904"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dhasFallbackAlt", ("Vuna.Compiler.Lowering.Program.hasFallbackAlt", "Vuna/Compiler/Lowering/Program.vuna:435"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dinitGuardOf", ("Vuna.Compiler.Lowering.Program.initGuardOf", "Vuna/Compiler/Lowering/Program.vuna:671"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dinlineArityMatchesIn", ("Vuna.Compiler.Lowering.Program.inlineArityMatchesIn", "Vuna/Compiler/Lowering/Program.vuna:270"));
  ("v_Vuna_dCompiler_dLowering_dProgram_disNatCtorName", ("Vuna.Compiler.Lowering.Program.isNatCtorName", "Vuna/Compiler/Lowering/Program.vuna:496"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlookupRtLabelIn", ("Vuna.Compiler.Lowering.Program.lookupRtLabelIn", "Vuna/Compiler/Lowering/Program.vuna:586"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPosIn", ("Vuna.Compiler.Lowering.Program.lookupRtPosIn", "Vuna/Compiler/Lowering/Program.vuna:591"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlookupRtPositionsIn", ("Vuna.Compiler.Lowering.Program.lookupRtPositionsIn", "Vuna/Compiler/Lowering/Program.vuna:596"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFallbackFuel", ("Vuna.Compiler.Lowering.Program.lowerAppFallbackFuel", "Vuna/Compiler/Lowering/Program.vuna:208"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerAppFuel", ("Vuna.Compiler.Lowering.Program.lowerAppFuel", "Vuna/Compiler/Lowering/Program.vuna:185"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerArmBodyFuel", ("Vuna.Compiler.Lowering.Program.lowerArmBodyFuel", "Vuna/Compiler/Lowering/Program.vuna:432"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerArmFuel", ("Vuna.Compiler.Lowering.Program.lowerArmFuel", "Vuna/Compiler/Lowering/Program.vuna:468"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerArmsFuel", ("Vuna.Compiler.Lowering.Program.lowerArmsFuel", "Vuna/Compiler/Lowering/Program.vuna:484"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerBridgeGuard", ("Vuna.Compiler.Lowering.Program.lowerBridgeGuard", "Vuna/Compiler/Lowering/Program.vuna:151"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerBudgetFor", ("Vuna.Compiler.Lowering.Program.lowerBudgetFor", "Vuna/Compiler/Lowering/Program.vuna:69"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerCaseFuel", ("Vuna.Compiler.Lowering.Program.lowerCaseFuel", "Vuna/Compiler/Lowering/Program.vuna:556"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFinish", ("Vuna.Compiler.Lowering.Program.lowerConAppFinish", "Vuna/Compiler/Lowering/Program.vuna:350"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppFuel", ("Vuna.Compiler.Lowering.Program.lowerConAppFuel", "Vuna/Compiler/Lowering/Program.vuna:317"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerConAppNonChainFuel", ("Vuna.Compiler.Lowering.Program.lowerConAppNonChainFuel", "Vuna/Compiler/Lowering/Program.vuna:323"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerConArgsFuel", ("Vuna.Compiler.Lowering.Program.lowerConArgsFuel", "Vuna/Compiler/Lowering/Program.vuna:293"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerDef", ("Vuna.Compiler.Lowering.Program.lowerDef", "Vuna/Compiler/Lowering/Program.vuna:680"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerDefs", ("Vuna.Compiler.Lowering.Program.lowerDefs", "Vuna/Compiler/Lowering/Program.vuna:722"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerExternTy", ("Vuna.Compiler.Lowering.Program.lowerExternTy", "Vuna/Compiler/Lowering/Program.vuna:697"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerGlobalRef", ("Vuna.Compiler.Lowering.Program.lowerGlobalRef", "Vuna/Compiler/Lowering/Program.vuna:134"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerInlineArgsFuel", ("Vuna.Compiler.Lowering.Program.lowerInlineArgsFuel", "Vuna/Compiler/Lowering/Program.vuna:216"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerLamFuel", ("Vuna.Compiler.Lowering.Program.lowerLamFuel", "Vuna/Compiler/Lowering/Program.vuna:170"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerNatAltFuel", ("Vuna.Compiler.Lowering.Program.lowerNatAltFuel", "Vuna/Compiler/Lowering/Program.vuna:524"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerNatCaseFuel", ("Vuna.Compiler.Lowering.Program.lowerNatCaseFuel", "Vuna/Compiler/Lowering/Program.vuna:534"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerPlainAppFuel", ("Vuna.Compiler.Lowering.Program.lowerPlainAppFuel", "Vuna/Compiler/Lowering/Program.vuna:197"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerProgramOf", ("Vuna.Compiler.Lowering.Program.lowerProgramOf", "Vuna/Compiler/Lowering/Program.vuna:908"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerProjAsCaseFuel", ("Vuna.Compiler.Lowering.Program.lowerProjAsCaseFuel", "Vuna/Compiler/Lowering/Program.vuna:568"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateArgsFuel", ("Vuna.Compiler.Lowering.Program.lowerRecordUpdateArgsFuel", "Vuna/Compiler/Lowering/Program.vuna:629"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerRecordUpdateFuel", ("Vuna.Compiler.Lowering.Program.lowerRecordUpdateFuel", "Vuna/Compiler/Lowering/Program.vuna:616"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerTerm", ("Vuna.Compiler.Lowering.Program.lowerTerm", "Vuna/Compiler/Lowering/Program.vuna:72"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerTermFuel", ("Vuna.Compiler.Lowering.Program.lowerTermFuel", "Vuna/Compiler/Lowering/Program.vuna:75"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerTermsFuel", ("Vuna.Compiler.Lowering.Program.lowerTermsFuel", "Vuna/Compiler/Lowering/Program.vuna:227"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseAlt", ("Vuna.Compiler.Lowering.Program.lowerUnboxedCaseAlt", "Vuna/Compiler/Lowering/Program.vuna:444"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerUnboxedCaseFuel", ("Vuna.Compiler.Lowering.Program.lowerUnboxedCaseFuel", "Vuna/Compiler/Lowering/Program.vuna:454"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitAfterChecks", ("Vuna.Compiler.Lowering.Program.lowerUnitAfterChecks", "Vuna/Compiler/Lowering/Program.vuna:883"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitChecked", ("Vuna.Compiler.Lowering.Program.lowerUnitChecked", "Vuna/Compiler/Lowering/Program.vuna:875"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerUnitOf", ("Vuna.Compiler.Lowering.Program.lowerUnitOf", "Vuna/Compiler/Lowering/Program.vuna:869"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dlowerUpdFieldsFuel", ("Vuna.Compiler.Lowering.Program.lowerUpdFieldsFuel", "Vuna/Compiler/Lowering/Program.vuna:642"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dmapMaybeDef", ("Vuna.Compiler.Lowering.Program.mapMaybeDef", "Vuna/Compiler/Lowering/Program.vuna:825"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dnatCaseAllCtors", ("Vuna.Compiler.Lowering.Program.natCaseAllCtors", "Vuna/Compiler/Lowering/Program.vuna:503"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dnatCaseApplies", ("Vuna.Compiler.Lowering.Program.natCaseApplies", "Vuna/Compiler/Lowering/Program.vuna:499"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dnatCaseHasCtor", ("Vuna.Compiler.Lowering.Program.natCaseHasCtor", "Vuna/Compiler/Lowering/Program.vuna:509"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dnthOpqArgIn", ("Vuna.Compiler.Lowering.Program.nthOpqArgIn", "Vuna/Compiler/Lowering/Program.vuna:602"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dpartitionRuntimeDefs", ("Vuna.Compiler.Lowering.Program.partitionRuntimeDefs", "Vuna/Compiler/Lowering/Program.vuna:921"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dprepareProgram", ("Vuna.Compiler.Lowering.Program.prepareProgram", "Vuna/Compiler/Lowering/Program.vuna:759"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dprojBindersIn", ("Vuna.Compiler.Lowering.Program.projBindersIn", "Vuna/Compiler/Lowering/Program.vuna:579"));
  ("v_Vuna_dCompiler_dLowering_dProgram_drecOkOfTbl", ("Vuna.Compiler.Lowering.Program.recOkOfTbl", "Vuna/Compiler/Lowering/Program.vuna:797"));
  ("v_Vuna_dCompiler_dLowering_dProgram_drecordAltBindersIn", ("Vuna.Compiler.Lowering.Program.recordAltBindersIn", "Vuna/Compiler/Lowering/Program.vuna:610"));
  ("v_Vuna_dCompiler_dLowering_dProgram_drecordFieldNameAt", ("Vuna.Compiler.Lowering.Program.recordFieldNameAt", "Vuna/Compiler/Lowering/Program.vuna:121"));
  ("v_Vuna_dCompiler_dLowering_dProgram_drecordProjVarIn", ("Vuna.Compiler.Lowering.Program.recordProjVarIn", "Vuna/Compiler/Lowering/Program.vuna:576"));
  ("v_Vuna_dCompiler_dLowering_dProgram_drecordTermAsAppIn", ("Vuna.Compiler.Lowering.Program.recordTermAsAppIn", "Vuna/Compiler/Lowering/Program.vuna:127"));
  ("v_Vuna_dCompiler_dLowering_dProgram_drecursiveValueAllowedIn", ("Vuna.Compiler.Lowering.Program.recursiveValueAllowedIn", "Vuna/Compiler/Lowering/Program.vuna:665"));
  ("v_Vuna_dCompiler_dLowering_dProgram_druntimeArityIn", ("Vuna.Compiler.Lowering.Program.runtimeArityIn", "Vuna/Compiler/Lowering/Program.vuna:660"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dspanOfTbl", ("Vuna.Compiler.Lowering.Program.spanOfTbl", "Vuna/Compiler/Lowering/Program.vuna:804"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dtblLookup", ("Vuna.Compiler.Lowering.Program.tblLookup", "Vuna/Compiler/Lowering/Program.vuna:794"));
  ("v_Vuna_dCompiler_dLowering_dProgram_dzipFieldNames", ("Vuna.Compiler.Lowering.Program.zipFieldNames", "Vuna/Compiler/Lowering/Program.vuna:359"));
  ("v_Vuna_dCompiler_dLowering_dTy_dctorArityNeed", ("Vuna.Compiler.Lowering.Ty.ctorArityNeed", "Vuna/Compiler/Lowering/Ty.vuna:139"));
  ("v_Vuna_dCompiler_dLowering_dTy_dctorFieldTys", ("Vuna.Compiler.Lowering.Ty.ctorFieldTys", "Vuna/Compiler/Lowering/Ty.vuna:115"));
  ("v_Vuna_dCompiler_dLowering_dTy_ddataArityNeed", ("Vuna.Compiler.Lowering.Ty.dataArityNeed", "Vuna/Compiler/Lowering/Ty.vuna:145"));
  ("v_Vuna_dCompiler_dLowering_dTy_dflagMatchesRigIn", ("Vuna.Compiler.Lowering.Ty.flagMatchesRigIn", "Vuna/Compiler/Lowering/Ty.vuna:110"));
  ("v_Vuna_dCompiler_dLowering_dTy_dfoldlTyNames", ("Vuna.Compiler.Lowering.Ty.foldlTyNames", "Vuna/Compiler/Lowering/Ty.vuna:202"));
  ("v_Vuna_dCompiler_dLowering_dTy_dmaxIntListIn", ("Vuna.Compiler.Lowering.Ty.maxIntListIn", "Vuna/Compiler/Lowering/Ty.vuna:151"));
  ("v_Vuna_dCompiler_dLowering_dTy_drenderFamilyArgs", ("Vuna.Compiler.Lowering.Ty.renderFamilyArgs", "Vuna/Compiler/Lowering/Ty.vuna:65"));
  ("v_Vuna_dCompiler_dLowering_dTy_drenderFieldTy", ("Vuna.Compiler.Lowering.Ty.renderFieldTy", "Vuna/Compiler/Lowering/Ty.vuna:91"));
  ("v_Vuna_dCompiler_dLowering_dTy_drenderPiTy", ("Vuna.Compiler.Lowering.Ty.renderPiTy", "Vuna/Compiler/Lowering/Ty.vuna:76"));
  ("v_Vuna_dCompiler_dLowering_dTy_drenderPiTyFuel", ("Vuna.Compiler.Lowering.Ty.renderPiTyFuel", "Vuna/Compiler/Lowering/Ty.vuna:79"));
  ("v_Vuna_dCompiler_dLowering_dTy_drenderTyFuel", ("Vuna.Compiler.Lowering.Ty.renderTyFuel", "Vuna/Compiler/Lowering/Ty.vuna:29"));
  ("v_Vuna_dCompiler_dLowering_dTy_drenderTyGlobal", ("Vuna.Compiler.Lowering.Ty.renderTyGlobal", "Vuna/Compiler/Lowering/Ty.vuna:50"));
  ("v_Vuna_dCompiler_dLowering_dTy_drenderTyIntrinsic", ("Vuna.Compiler.Lowering.Ty.renderTyIntrinsic", "Vuna/Compiler/Lowering/Ty.vuna:60"));
  ("v_Vuna_dCompiler_dLowering_dTy_drenderTyOf", ("Vuna.Compiler.Lowering.Ty.renderTyOf", "Vuna/Compiler/Lowering/Ty.vuna:26"));
  ("v_Vuna_dCompiler_dLowering_dTy_dreprTyIr", ("Vuna.Compiler.Lowering.Ty.reprTyIr", "Vuna/Compiler/Lowering/Ty.vuna:41"));
  ("v_Vuna_dCompiler_dLowering_dTy_dtyDeclOf", ("Vuna.Compiler.Lowering.Ty.tyDeclOf", "Vuna/Compiler/Lowering/Ty.vuna:170"));
  ("v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefs", ("Vuna.Compiler.Lowering.Ty.tyDeclRefs", "Vuna/Compiler/Lowering/Ty.vuna:190"));
  ("v_Vuna_dCompiler_dLowering_dTy_dtyDeclRefsGo", ("Vuna.Compiler.Lowering.Ty.tyDeclRefsGo", "Vuna/Compiler/Lowering/Ty.vuna:198"));
  ("v_Vuna_dCompiler_dLowering_dTy_dtyDeclTys", ("Vuna.Compiler.Lowering.Ty.tyDeclTys", "Vuna/Compiler/Lowering/Ty.vuna:193"));
  ("v_Vuna_dCompiler_dLowering_dTy_dtyDeclsGo", ("Vuna.Compiler.Lowering.Ty.tyDeclsGo", "Vuna/Compiler/Lowering/Ty.vuna:164"));
  ("v_Vuna_dCompiler_dLowering_dTy_dtyDeclsOf", ("Vuna.Compiler.Lowering.Ty.tyDeclsOf", "Vuna/Compiler/Lowering/Ty.vuna:161"));
  ("v_Vuna_dCompiler_dLowering_dTy_dtyNamesInto", ("Vuna.Compiler.Lowering.Ty.tyNamesInto", "Vuna/Compiler/Lowering/Ty.vuna:206"));
  ("v_Vuna_dCompiler_dNative_dAbi_disNativeNameChar", ("Vuna.Compiler.Native.Abi.isNativeNameChar", "Vuna/Compiler/Native/Abi.vuna:95"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeArenaEndLabel", ("Vuna.Compiler.Native.Abi.nativeArenaEndLabel", "Vuna/Compiler/Native/Abi.vuna:76"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeArgRegs", ("Vuna.Compiler.Native.Abi.nativeArgRegs", "Vuna/Compiler/Native/Abi.vuna:28"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeDataLabel", ("Vuna.Compiler.Native.Abi.nativeDataLabel", "Vuna/Compiler/Native/Abi.vuna:131"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeEntryLabel", ("Vuna.Compiler.Native.Abi.nativeEntryLabel", "Vuna/Compiler/Native/Abi.vuna:122"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeEpilogue", ("Vuna.Compiler.Native.Abi.nativeEpilogue", "Vuna/Compiler/Native/Abi.vuna:89"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeFrameBytes", ("Vuna.Compiler.Native.Abi.nativeFrameBytes", "Vuna/Compiler/Native/Abi.vuna:46"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeFuncLabel", ("Vuna.Compiler.Native.Abi.nativeFuncLabel", "Vuna/Compiler/Native/Abi.vuna:106"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeGlobalValueLabel", ("Vuna.Compiler.Native.Abi.nativeGlobalValueLabel", "Vuna/Compiler/Native/Abi.vuna:114"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeHeapBytes", ("Vuna.Compiler.Native.Abi.nativeHeapBytes", "Vuna/Compiler/Native/Abi.vuna:60"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeHeapEndLabel", ("Vuna.Compiler.Native.Abi.nativeHeapEndLabel", "Vuna/Compiler/Native/Abi.vuna:68"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeHeapLabel", ("Vuna.Compiler.Native.Abi.nativeHeapLabel", "Vuna/Compiler/Native/Abi.vuna:64"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeHeapPtrLabel", ("Vuna.Compiler.Native.Abi.nativeHeapPtrLabel", "Vuna/Compiler/Native/Abi.vuna:72"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeJumpLabel", ("Vuna.Compiler.Native.Abi.nativeJumpLabel", "Vuna/Compiler/Native/Abi.vuna:127"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeMaxArgs", ("Vuna.Compiler.Native.Abi.nativeMaxArgs", "Vuna/Compiler/Native/Abi.vuna:32"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeName", ("Vuna.Compiler.Native.Abi.nativeName", "Vuna/Compiler/Native/Abi.vuna:102"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeNameChar", ("Vuna.Compiler.Native.Abi.nativeNameChar", "Vuna/Compiler/Native/Abi.vuna:98"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativePrologue", ("Vuna.Compiler.Native.Abi.nativePrologue", "Vuna/Compiler/Native/Abi.vuna:83"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeRtLabel", ("Vuna.Compiler.Native.Abi.nativeRtLabel", "Vuna/Compiler/Native/Abi.vuna:110"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeRtValueLabel", ("Vuna.Compiler.Native.Abi.nativeRtValueLabel", "Vuna/Compiler/Native/Abi.vuna:118"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeSlotOff", ("Vuna.Compiler.Native.Abi.nativeSlotOff", "Vuna/Compiler/Native/Abi.vuna:42"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeStackArgOff", ("Vuna.Compiler.Native.Abi.nativeStackArgOff", "Vuna/Compiler/Native/Abi.vuna:38"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeStrHeaderBytes", ("Vuna.Compiler.Native.Abi.nativeStrHeaderBytes", "Vuna/Compiler/Native/Abi.vuna:56"));
  ("v_Vuna_dCompiler_dNative_dAbi_dnativeStrLitLabel", ("Vuna.Compiler.Native.Abi.nativeStrLitLabel", "Vuna/Compiler/Native/Abi.vuna:135"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditAltKeys", ("Vuna.Compiler.Native.Audit.auditAltKeys", "Vuna/Compiler/Native/Audit.vuna:88"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditAltMaybeKeys", ("Vuna.Compiler.Native.Audit.auditAltMaybeKeys", "Vuna/Compiler/Native/Audit.vuna:91"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditCategories", ("Vuna.Compiler.Native.Audit.auditCategories", "Vuna/Compiler/Native/Audit.vuna:124"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditCategoryExamples", ("Vuna.Compiler.Native.Audit.auditCategoryExamples", "Vuna/Compiler/Native/Audit.vuna:131"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditCategoryLine", ("Vuna.Compiler.Native.Audit.auditCategoryLine", "Vuna/Compiler/Native/Audit.vuna:140"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditDefKeys", ("Vuna.Compiler.Native.Audit.auditDefKeys", "Vuna/Compiler/Native/Audit.vuna:95"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditErased", ("Vuna.Compiler.Native.Audit.auditErased", "Vuna/Compiler/Native/Audit.vuna:23"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditExamplesText", ("Vuna.Compiler.Native.Audit.auditExamplesText", "Vuna/Compiler/Native/Audit.vuna:135"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditInCategory", ("Vuna.Compiler.Native.Audit.auditInCategory", "Vuna/Compiler/Native/Audit.vuna:128"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditKeys", ("Vuna.Compiler.Native.Audit.auditKeys", "Vuna/Compiler/Native/Audit.vuna:53"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditPrefixOf", ("Vuna.Compiler.Native.Audit.auditPrefixOf", "Vuna/Compiler/Native/Audit.vuna:112"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditRestOf", ("Vuna.Compiler.Native.Audit.auditRestOf", "Vuna/Compiler/Native/Audit.vuna:118"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditRtAppKeys", ("Vuna.Compiler.Native.Audit.auditRtAppKeys", "Vuna/Compiler/Native/Audit.vuna:44"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditRuntimeBinders", ("Vuna.Compiler.Native.Audit.auditRuntimeBinders", "Vuna/Compiler/Native/Audit.vuna:27"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditSymSupported", ("Vuna.Compiler.Native.Audit.auditSymSupported", "Vuna/Compiler/Native/Audit.vuna:31"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditUniq", ("Vuna.Compiler.Native.Audit.auditUniq", "Vuna/Compiler/Native/Audit.vuna:103"));
  ("v_Vuna_dCompiler_dNative_dAudit_dauditValueArity", ("Vuna.Compiler.Native.Audit.auditValueArity", "Vuna/Compiler/Native/Audit.vuna:39"));
  ("v_Vuna_dCompiler_dNative_dAudit_dmemKey", ("Vuna.Compiler.Native.Audit.memKey", "Vuna/Compiler/Native/Audit.vuna:107"));
  ("v_Vuna_dCompiler_dNative_dAudit_dnativeAuditEnrich", ("Vuna.Compiler.Native.Audit.nativeAuditEnrich", "Vuna/Compiler/Native/Audit.vuna:161"));
  ("v_Vuna_dCompiler_dNative_dAudit_dnativeAuditLines", ("Vuna.Compiler.Native.Audit.nativeAuditLines", "Vuna/Compiler/Native/Audit.vuna:149"));
  ("v_Vuna_dCompiler_dNative_dModel_dnativeErrText", ("Vuna.Compiler.Native.Model.nativeErrText", "Vuna/Compiler/Native/Model.vuna:27"));
  ("v_Vuna_dCompiler_dNative_dModel_dreg8Text", ("Vuna.Compiler.Native.Model.reg8Text", "Vuna/Compiler/Native/Model.vuna:64"));
  ("v_Vuna_dCompiler_dNative_dModel_dregText", ("Vuna.Compiler.Native.Model.regText", "Vuna/Compiler/Native/Model.vuna:49"));
  ("v_Vuna_dCompiler_dNative_dModule_daddLit", ("Vuna.Compiler.Native.Module.addLit", "Vuna/Compiler/Native/Module.vuna:134"));
  ("v_Vuna_dCompiler_dNative_dModule_dapplyAllIr", ("Vuna.Compiler.Native.Module.applyAllIr", "Vuna/Compiler/Native/Module.vuna:428"));
  ("v_Vuna_dCompiler_dNative_dModule_dargRegAt", ("Vuna.Compiler.Native.Module.argRegAt", "Vuna/Compiler/Native/Module.vuna:158"));
  ("v_Vuna_dCompiler_dNative_dModule_dargRegAtIn", ("Vuna.Compiler.Native.Module.argRegAtIn", "Vuna/Compiler/Native/Module.vuna:161"));
  ("v_Vuna_dCompiler_dNative_dModule_darrayFromListFn", ("Vuna.Compiler.Native.Module.arrayFromListFn", "Vuna/Compiler/Native/Module.vuna:1205"));
  ("v_Vuna_dCompiler_dNative_dModule_darrayToListFn", ("Vuna.Compiler.Native.Module.arrayToListFn", "Vuna/Compiler/Native/Module.vuna:1218"));
  ("v_Vuna_dCompiler_dNative_dModule_dbNameEq", ("Vuna.Compiler.Native.Module.bNameEq", "Vuna/Compiler/Native/Module.vuna:92"));
  ("v_Vuna_dCompiler_dNative_dModule_dbindArgs", ("Vuna.Compiler.Native.Module.bindArgs", "Vuna/Compiler/Native/Module.vuna:1017"));
  ("v_Vuna_dCompiler_dNative_dModule_dbindArgsGo", ("Vuna.Compiler.Native.Module.bindArgsGo", "Vuna/Compiler/Native/Module.vuna:1021"));
  ("v_Vuna_dCompiler_dNative_dModule_dbindCaptures", ("Vuna.Compiler.Native.Module.bindCaptures", "Vuna/Compiler/Native/Module.vuna:578"));
  ("v_Vuna_dCompiler_dNative_dModule_dbindFields", ("Vuna.Compiler.Native.Module.bindFields", "Vuna/Compiler/Native/Module.vuna:932"));
  ("v_Vuna_dCompiler_dNative_dModule_dbinderEq", ("Vuna.Compiler.Native.Module.binderEq", "Vuna/Compiler/Native/Module.vuna:99"));
  ("v_Vuna_dCompiler_dNative_dModule_dbridgeFn", ("Vuna.Compiler.Native.Module.bridgeFn", "Vuna/Compiler/Native/Module.vuna:1156"));
  ("v_Vuna_dCompiler_dNative_dModule_dbuild", ("Vuna.Compiler.Native.Module.build", "Vuna/Compiler/Native/Module.vuna:1276"));
  ("v_Vuna_dCompiler_dNative_dModule_dcallSlotsInstrs", ("Vuna.Compiler.Native.Module.callSlotsInstrs", "Vuna/Compiler/Native/Module.vuna:198"));
  ("v_Vuna_dCompiler_dNative_dModule_dcaseFamilyOf", ("Vuna.Compiler.Native.Module.caseFamilyOf", "Vuna/Compiler/Native/Module.vuna:866"));
  ("v_Vuna_dCompiler_dNative_dModule_dcat", ("Vuna.Compiler.Native.Module.cat", "Vuna/Compiler/Native/Module.vuna:643"));
  ("v_Vuna_dCompiler_dNative_dModule_dclosureArgLoad", ("Vuna.Compiler.Native.Module.closureArgLoad", "Vuna/Compiler/Native/Module.vuna:233"));
  ("v_Vuna_dCompiler_dNative_dModule_dclosureArgRegs", ("Vuna.Compiler.Native.Module.closureArgRegs", "Vuna/Compiler/Native/Module.vuna:574"));
  ("v_Vuna_dCompiler_dNative_dModule_dclosureCallSlotsInstrs", ("Vuna.Compiler.Native.Module.closureCallSlotsInstrs", "Vuna/Compiler/Native/Module.vuna:275"));
  ("v_Vuna_dCompiler_dNative_dModule_dctorArityIn", ("Vuna.Compiler.Native.Module.ctorArityIn", "Vuna/Compiler/Native/Module.vuna:702"));
  ("v_Vuna_dCompiler_dNative_dModule_dctorTagGo", ("Vuna.Compiler.Native.Module.ctorTagGo", "Vuna/Compiler/Native/Module.vuna:698"));
  ("v_Vuna_dCompiler_dNative_dModule_dctorTagIn", ("Vuna.Compiler.Native.Module.ctorTagIn", "Vuna/Compiler/Native/Module.vuna:695"));
  ("v_Vuna_dCompiler_dNative_dModule_ddeclName", ("Vuna.Compiler.Native.Module.declName", "Vuna/Compiler/Native/Module.vuna:690"));
  ("v_Vuna_dCompiler_dNative_dModule_ddeclOf", ("Vuna.Compiler.Native.Module.declOf", "Vuna/Compiler/Native/Module.vuna:686"));
  ("v_Vuna_dCompiler_dNative_dModule_ddedupeFuncs", ("Vuna.Compiler.Native.Module.dedupeFuncs", "Vuna/Compiler/Native/Module.vuna:1076"));
  ("v_Vuna_dCompiler_dNative_dModule_deffArgBinders", ("Vuna.Compiler.Native.Module.effArgBinders", "Vuna/Compiler/Native/Module.vuna:435"));
  ("v_Vuna_dCompiler_dNative_dModule_deffUnitBinder", ("Vuna.Compiler.Native.Module.effUnitBinder", "Vuna/Compiler/Native/Module.vuna:432"));
  ("v_Vuna_dCompiler_dNative_dModule_dentryShowKind", ("Vuna.Compiler.Native.Module.entryShowKind", "Vuna/Compiler/Native/Module.vuna:1084"));
  ("v_Vuna_dCompiler_dNative_dModule_dfindCatchAll", ("Vuna.Compiler.Native.Module.findCatchAll", "Vuna/Compiler/Native/Module.vuna:872"));
  ("v_Vuna_dCompiler_dNative_dModule_dfindDef", ("Vuna.Compiler.Native.Module.findDef", "Vuna/Compiler/Native/Module.vuna:123"));
  ("v_Vuna_dCompiler_dNative_dModule_dflattenApp", ("Vuna.Compiler.Native.Module.flattenApp", "Vuna/Compiler/Native/Module.vuna:535"));
  ("v_Vuna_dCompiler_dNative_dModule_dfloatDigitsGo", ("Vuna.Compiler.Native.Module.floatDigitsGo", "Vuna/Compiler/Native/Module.vuna:400"));
  ("v_Vuna_dCompiler_dNative_dModule_dfloatDigitsOf", ("Vuna.Compiler.Native.Module.floatDigitsOf", "Vuna/Compiler/Native/Module.vuna:397"));
  ("v_Vuna_dCompiler_dNative_dModule_dfloatPow10", ("Vuna.Compiler.Native.Module.floatPow10", "Vuna/Compiler/Native/Module.vuna:405"));
  ("v_Vuna_dCompiler_dNative_dModule_dfloatRenderName", ("Vuna.Compiler.Native.Module.floatRenderName", "Vuna/Compiler/Native/Module.vuna:389"));
  ("v_Vuna_dCompiler_dNative_dModule_dfreshLabel", ("Vuna.Compiler.Native.Module.freshLabel", "Vuna/Compiler/Native/Module.vuna:73"));
  ("v_Vuna_dCompiler_dNative_dModule_dfreshSlot", ("Vuna.Compiler.Native.Module.freshSlot", "Vuna/Compiler/Native/Module.vuna:66"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenAlloc", ("Vuna.Compiler.Native.Module.genAlloc", "Vuna/Compiler/Native/Module.vuna:673"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenApp", ("Vuna.Compiler.Native.Module.genApp", "Vuna/Compiler/Native/Module.vuna:552"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenApplyCall", ("Vuna.Compiler.Native.Module.genApplyCall", "Vuna/Compiler/Native/Module.vuna:288"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenApplyHead", ("Vuna.Compiler.Native.Module.genApplyHead", "Vuna/Compiler/Native/Module.vuna:310"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenArgs", ("Vuna.Compiler.Native.Module.genArgs", "Vuna/Compiler/Native/Module.vuna:168"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenArm", ("Vuna.Compiler.Native.Module.genArm", "Vuna/Compiler/Native/Module.vuna:887"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenBoolChain", ("Vuna.Compiler.Native.Module.genBoolChain", "Vuna/Compiler/Native/Module.vuna:521"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenCase", ("Vuna.Compiler.Native.Module.genCase", "Vuna/Compiler/Native/Module.vuna:847"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenCaseAlts", ("Vuna.Compiler.Native.Module.genCaseAlts", "Vuna/Compiler/Native/Module.vuna:856"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenConcatMany", ("Vuna.Compiler.Native.Module.genConcatMany", "Vuna/Compiler/Native/Module.vuna:363"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenConcatRest", ("Vuna.Compiler.Native.Module.genConcatRest", "Vuna/Compiler/Native/Module.vuna:377"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenCtor", ("Vuna.Compiler.Native.Module.genCtor", "Vuna/Compiler/Native/Module.vuna:732"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenCtorFinish", ("Vuna.Compiler.Native.Module.genCtorFinish", "Vuna/Compiler/Native/Module.vuna:750"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenCtorGo", ("Vuna.Compiler.Native.Module.genCtorGo", "Vuna/Compiler/Native/Module.vuna:739"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenDefFunc", ("Vuna.Compiler.Native.Module.genDefFunc", "Vuna/Compiler/Native/Module.vuna:1037"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenDefault", ("Vuna.Compiler.Native.Module.genDefault", "Vuna/Compiler/Native/Module.vuna:881"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenDefs", ("Vuna.Compiler.Native.Module.genDefs", "Vuna/Compiler/Native/Module.vuna:1069"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenEffThunk", ("Vuna.Compiler.Native.Module.genEffThunk", "Vuna/Compiler/Native/Module.vuna:438"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenExpr", ("Vuna.Compiler.Native.Module.genExpr", "Vuna/Compiler/Native/Module.vuna:448"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenFloatLit", ("Vuna.Compiler.Native.Module.genFloatLit", "Vuna/Compiler/Native/Module.vuna:408"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenGlobalCall", ("Vuna.Compiler.Native.Module.genGlobalCall", "Vuna/Compiler/Native/Module.vuna:320"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenLamApp", ("Vuna.Compiler.Native.Module.genLamApp", "Vuna/Compiler/Native/Module.vuna:542"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenLamValue", ("Vuna.Compiler.Native.Module.genLamValue", "Vuna/Compiler/Native/Module.vuna:603"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenNatArm", ("Vuna.Compiler.Native.Module.genNatArm", "Vuna/Compiler/Native/Module.vuna:952"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenNatCase", ("Vuna.Compiler.Native.Module.genNatCase", "Vuna/Compiler/Native/Module.vuna:978"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenNatSuccCall", ("Vuna.Compiler.Native.Module.genNatSuccCall", "Vuna/Compiler/Native/Module.vuna:331"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenProj", ("Vuna.Compiler.Native.Module.genProj", "Vuna/Compiler/Native/Module.vuna:782"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenProjFinish", ("Vuna.Compiler.Native.Module.genProjFinish", "Vuna/Compiler/Native/Module.vuna:791"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenRecUpd", ("Vuna.Compiler.Native.Module.genRecUpd", "Vuna/Compiler/Native/Module.vuna:800"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenRecUpdStart", ("Vuna.Compiler.Native.Module.genRecUpdStart", "Vuna/Compiler/Native/Module.vuna:809"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenRecord", ("Vuna.Compiler.Native.Module.genRecord", "Vuna/Compiler/Native/Module.vuna:763"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenRecordAlts", ("Vuna.Compiler.Native.Module.genRecordAlts", "Vuna/Compiler/Native/Module.vuna:942"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenRecordFinish", ("Vuna.Compiler.Native.Module.genRecordFinish", "Vuna/Compiler/Native/Module.vuna:772"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenRtApp", ("Vuna.Compiler.Native.Module.genRtApp", "Vuna/Compiler/Native/Module.vuna:337"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenRtValueCall", ("Vuna.Compiler.Native.Module.genRtValueCall", "Vuna/Compiler/Native/Module.vuna:350"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenSaturatedCall", ("Vuna.Compiler.Native.Module.genSaturatedCall", "Vuna/Compiler/Native/Module.vuna:187"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenUpdFields", ("Vuna.Compiler.Native.Module.genUpdFields", "Vuna/Compiler/Native/Module.vuna:820"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenValueClosure", ("Vuna.Compiler.Native.Module.genValueClosure", "Vuna/Compiler/Native/Module.vuna:252"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenVariantAlts", ("Vuna.Compiler.Native.Module.genVariantAlts", "Vuna/Compiler/Native/Module.vuna:905"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenVariantAltsGo", ("Vuna.Compiler.Native.Module.genVariantAltsGo", "Vuna/Compiler/Native/Module.vuna:908"));
  ("v_Vuna_dCompiler_dNative_dModule_dgenVariantArm", ("Vuna.Compiler.Native.Module.genVariantArm", "Vuna/Compiler/Native/Module.vuna:926"));
  ("v_Vuna_dCompiler_dNative_dModule_dgetLocal", ("Vuna.Compiler.Native.Module.getLocal", "Vuna/Compiler/Native/Module.vuna:653"));
  ("v_Vuna_dCompiler_dNative_dModule_dgetObjField", ("Vuna.Compiler.Native.Module.getObjField", "Vuna/Compiler/Native/Module.vuna:668"));
  ("v_Vuna_dCompiler_dNative_dModule_dhasFuncLabel", ("Vuna.Compiler.Native.Module.hasFuncLabel", "Vuna/Compiler/Native/Module.vuna:228"));
  ("v_Vuna_dCompiler_dNative_dModule_dhasNatBranch", ("Vuna.Compiler.Native.Module.hasNatBranch", "Vuna/Compiler/Native/Module.vuna:973"));
  ("v_Vuna_dCompiler_dNative_dModule_dinternal", ("Vuna.Compiler.Native.Module.internal", "Vuna/Compiler/Native/Module.vuna:50"));
  ("v_Vuna_dCompiler_dNative_dModule_disErasedBinder", ("Vuna.Compiler.Native.Module.isErasedBinder", "Vuna/Compiler/Native/Module.vuna:110"));
  ("v_Vuna_dCompiler_dNative_dModule_dlistHasStr", ("Vuna.Compiler.Native.Module.listHasStr", "Vuna/Compiler/Native/Module.vuna:384"));
  ("v_Vuna_dCompiler_dNative_dModule_dlistLengthI", ("Vuna.Compiler.Native.Module.listLengthI", "Vuna/Compiler/Native/Module.vuna:646"));
  ("v_Vuna_dCompiler_dNative_dModule_dloadArgRegs", ("Vuna.Compiler.Native.Module.loadArgRegs", "Vuna/Compiler/Native/Module.vuna:153"));
  ("v_Vuna_dCompiler_dNative_dModule_dloadReg", ("Vuna.Compiler.Native.Module.loadReg", "Vuna/Compiler/Native/Module.vuna:86"));
  ("v_Vuna_dCompiler_dNative_dModule_dloadSlot", ("Vuna.Compiler.Native.Module.loadSlot", "Vuna/Compiler/Native/Module.vuna:83"));
  ("v_Vuna_dCompiler_dNative_dModule_dlookupBinder", ("Vuna.Compiler.Native.Module.lookupBinder", "Vuna/Compiler/Native/Module.vuna:102"));
  ("v_Vuna_dCompiler_dNative_dModule_dlookupFieldIr", ("Vuna.Compiler.Native.Module.lookupFieldIr", "Vuna/Compiler/Native/Module.vuna:838"));
  ("v_Vuna_dCompiler_dNative_dModule_dmaxArityIn", ("Vuna.Compiler.Native.Module.maxArityIn", "Vuna/Compiler/Native/Module.vuna:707"));
  ("v_Vuna_dCompiler_dNative_dModule_dmemStr", ("Vuna.Compiler.Native.Module.memStr", "Vuna/Compiler/Native/Module.vuna:127"));
  ("v_Vuna_dCompiler_dNative_dModule_dnativeBridgeFuncs", ("Vuna.Compiler.Native.Module.nativeBridgeFuncs", "Vuna/Compiler/Native/Module.vuna:1260"));
  ("v_Vuna_dCompiler_dNative_dModule_dnativeFuncLabelOf", ("Vuna.Compiler.Native.Module.nativeFuncLabelOf", "Vuna/Compiler/Native/Module.vuna:225"));
  ("v_Vuna_dCompiler_dNative_dModule_dnbind", ("Vuna.Compiler.Native.Module.nbind", "Vuna/Compiler/Native/Module.vuna:43"));
  ("v_Vuna_dCompiler_dNative_dModule_dnlistCellBytes", ("Vuna.Compiler.Native.Module.nlistCellBytes", "Vuna/Compiler/Native/Module.vuna:1163"));
  ("v_Vuna_dCompiler_dNative_dModule_dnlistDescOf", ("Vuna.Compiler.Native.Module.nlistDescOf", "Vuna/Compiler/Native/Module.vuna:1143"));
  ("v_Vuna_dCompiler_dNative_dModule_dpadObjZero", ("Vuna.Compiler.Native.Module.padObjZero", "Vuna/Compiler/Native/Module.vuna:728"));
  ("v_Vuna_dCompiler_dNative_dModule_dpoolItems", ("Vuna.Compiler.Native.Module.poolItems", "Vuna/Compiler/Native/Module.vuna:146"));
  ("v_Vuna_dCompiler_dNative_dModule_dpoolLabelOf", ("Vuna.Compiler.Native.Module.poolLabelOf", "Vuna/Compiler/Native/Module.vuna:142"));
  ("v_Vuna_dCompiler_dNative_dModule_dpoolOfDefs", ("Vuna.Compiler.Native.Module.poolOfDefs", "Vuna/Compiler/Native/Module.vuna:139"));
  ("v_Vuna_dCompiler_dNative_dModule_dpushBinder", ("Vuna.Compiler.Native.Module.pushBinder", "Vuna/Compiler/Native/Module.vuna:107"));
  ("v_Vuna_dCompiler_dNative_dModule_dpushOne", ("Vuna.Compiler.Native.Module.pushOne", "Vuna/Compiler/Native/Module.vuna:219"));
  ("v_Vuna_dCompiler_dNative_dModule_dpushStackArgs", ("Vuna.Compiler.Native.Module.pushStackArgs", "Vuna/Compiler/Native/Module.vuna:211"));
  ("v_Vuna_dCompiler_dNative_dModule_drecordPosGo", ("Vuna.Compiler.Native.Module.recordPosGo", "Vuna/Compiler/Native/Module.vuna:718"));
  ("v_Vuna_dCompiler_dNative_dModule_drecordPosOf", ("Vuna.Compiler.Native.Module.recordPosOf", "Vuna/Compiler/Native/Module.vuna:715"));
  ("v_Vuna_dCompiler_dNative_dModule_drestoreBinderScope", ("Vuna.Compiler.Native.Module.restoreBinderScope", "Vuna/Compiler/Native/Module.vuna:114"));
  ("v_Vuna_dCompiler_dNative_dModule_drtValueArityOf", ("Vuna.Compiler.Native.Module.rtValueArityOf", "Vuna/Compiler/Native/Module.vuna:270"));
  ("v_Vuna_dCompiler_dNative_dModule_druntimeBinders", ("Vuna.Compiler.Native.Module.runtimeBinders", "Vuna/Compiler/Native/Module.vuna:117"));
  ("v_Vuna_dCompiler_dNative_dModule_dsetLocal", ("Vuna.Compiler.Native.Module.setLocal", "Vuna/Compiler/Native/Module.vuna:650"));
  ("v_Vuna_dCompiler_dNative_dModule_dsetObjFromSlot", ("Vuna.Compiler.Native.Module.setObjFromSlot", "Vuna/Compiler/Native/Module.vuna:657"));
  ("v_Vuna_dCompiler_dNative_dModule_dsetObjImm", ("Vuna.Compiler.Native.Module.setObjImm", "Vuna/Compiler/Native/Module.vuna:664"));
  ("v_Vuna_dCompiler_dNative_dModule_dstartFunc", ("Vuna.Compiler.Native.Module.startFunc", "Vuna/Compiler/Native/Module.vuna:1094"));
  ("v_Vuna_dCompiler_dNative_dModule_dstoreCapsAt", ("Vuna.Compiler.Native.Module.storeCapsAt", "Vuna/Compiler/Native/Module.vuna:597"));
  ("v_Vuna_dCompiler_dNative_dModule_dstoreCloArity", ("Vuna.Compiler.Native.Module.storeCloArity", "Vuna/Compiler/Native/Module.vuna:593"));
  ("v_Vuna_dCompiler_dNative_dModule_dstoreCloCode", ("Vuna.Compiler.Native.Module.storeCloCode", "Vuna/Compiler/Native/Module.vuna:589"));
  ("v_Vuna_dCompiler_dNative_dModule_dstoreSlot", ("Vuna.Compiler.Native.Module.storeSlot", "Vuna/Compiler/Native/Module.vuna:80"));
  ("v_Vuna_dCompiler_dNative_dModule_dstoreSlotFields", ("Vuna.Compiler.Native.Module.storeSlotFields", "Vuna/Compiler/Native/Module.vuna:723"));
  ("v_Vuna_dCompiler_dNative_dModule_dstrArgAtFn", ("Vuna.Compiler.Native.Module.strArgAtFn", "Vuna/Compiler/Native/Module.vuna:1230"));
  ("v_Vuna_dCompiler_dNative_dModule_dstrConcatManyFn", ("Vuna.Compiler.Native.Module.strConcatManyFn", "Vuna/Compiler/Native/Module.vuna:1191"));
  ("v_Vuna_dCompiler_dNative_dModule_dstrPackFn", ("Vuna.Compiler.Native.Module.strPackFn", "Vuna/Compiler/Native/Module.vuna:1179"));
  ("v_Vuna_dCompiler_dNative_dModule_dstrSubstTemplateFn", ("Vuna.Compiler.Native.Module.strSubstTemplateFn", "Vuna/Compiler/Native/Module.vuna:1241"));
  ("v_Vuna_dCompiler_dNative_dModule_dstrUnpackFn", ("Vuna.Compiler.Native.Module.strUnpackFn", "Vuna/Compiler/Native/Module.vuna:1167"));
  ("v_Vuna_dCompiler_dNative_dModule_dtagOfScrut", ("Vuna.Compiler.Native.Module.tagOfScrut", "Vuna/Compiler/Native/Module.vuna:899"));
  ("v_Vuna_dCompiler_dNative_dModule_dtrapImpossible", ("Vuna.Compiler.Native.Module.trapImpossible", "Vuna/Compiler/Native/Module.vuna:878"));
  ("v_Vuna_dCompiler_dNative_dModule_dunsupported", ("Vuna.Compiler.Native.Module.unsupported", "Vuna/Compiler/Native/Module.vuna:47"));
  ("v_Vuna_dCompiler_dNative_dModule_dvalueWrapperFunc", ("Vuna.Compiler.Native.Module.valueWrapperFunc", "Vuna/Compiler/Native/Module.vuna:240"));
  ("v_Vuna_dCompiler_dNative_dRender_dasmEscapeChar", ("Vuna.Compiler.Native.Render.asmEscapeChar", "Vuna/Compiler/Native/Render.vuna:117"));
  ("v_Vuna_dCompiler_dNative_dRender_dasmString", ("Vuna.Compiler.Native.Render.asmString", "Vuna/Compiler/Native/Render.vuna:130"));
  ("v_Vuna_dCompiler_dNative_dRender_dindent", ("Vuna.Compiler.Native.Render.indent", "Vuna/Compiler/Native/Render.vuna:26"));
  ("v_Vuna_dCompiler_dNative_dRender_disMemOperand", ("Vuna.Compiler.Native.Render.isMemOperand", "Vuna/Compiler/Native/Render.vuna:48"));
  ("v_Vuna_dCompiler_dNative_dRender_disShiftOp", ("Vuna.Compiler.Native.Render.isShiftOp", "Vuna/Compiler/Native/Render.vuna:58"));
  ("v_Vuna_dCompiler_dNative_dRender_dmemText", ("Vuna.Compiler.Native.Render.memText", "Vuna/Compiler/Native/Render.vuna:29"));
  ("v_Vuna_dCompiler_dNative_dRender_dmemXText", ("Vuna.Compiler.Native.Render.memXText", "Vuna/Compiler/Native/Render.vuna:35"));
  ("v_Vuna_dCompiler_dNative_dRender_dpadOct", ("Vuna.Compiler.Native.Render.padOct", "Vuna/Compiler/Native/Render.vuna:122"));
  ("v_Vuna_dCompiler_dNative_dRender_drenderBinReg", ("Vuna.Compiler.Native.Render.renderBinReg", "Vuna/Compiler/Native/Render.vuna:61"));
  ("v_Vuna_dCompiler_dNative_dRender_drenderBss", ("Vuna.Compiler.Native.Render.renderBss", "Vuna/Compiler/Native/Render.vuna:144"));
  ("v_Vuna_dCompiler_dNative_dRender_drenderByteOp", ("Vuna.Compiler.Native.Render.renderByteOp", "Vuna/Compiler/Native/Render.vuna:67"));
  ("v_Vuna_dCompiler_dNative_dRender_drenderFunc", ("Vuna.Compiler.Native.Render.renderFunc", "Vuna/Compiler/Native/Render.vuna:151"));
  ("v_Vuna_dCompiler_dNative_dRender_drenderInstr", ("Vuna.Compiler.Native.Render.renderInstr", "Vuna/Compiler/Native/Render.vuna:70"));
  ("v_Vuna_dCompiler_dNative_dRender_drenderMov", ("Vuna.Compiler.Native.Render.renderMov", "Vuna/Compiler/Native/Render.vuna:53"));
  ("v_Vuna_dCompiler_dNative_dRender_drenderOperand", ("Vuna.Compiler.Native.Render.renderOperand", "Vuna/Compiler/Native/Render.vuna:41"));
  ("v_Vuna_dCompiler_dNative_dRender_drenderProgram", ("Vuna.Compiler.Native.Render.renderProgram", "Vuna/Compiler/Native/Render.vuna:160"));
  ("v_Vuna_dCompiler_dNative_dRender_drenderRodata", ("Vuna.Compiler.Native.Render.renderRodata", "Vuna/Compiler/Native/Render.vuna:133"));
  ("v_Vuna_dCompiler_dNative_dRender_drenderStrLit", ("Vuna.Compiler.Native.Render.renderStrLit", "Vuna/Compiler/Native/Render.vuna:137"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dallocFn", ("Vuna.Compiler.Native.Runtime.allocFn", "Vuna/Compiler/Native/Runtime.vuna:589"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dapplyExactFn", ("Vuna.Compiler.Native.Runtime.applyExactFn", "Vuna/Compiler/Native/Runtime.vuna:707"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dapplyFn", ("Vuna.Compiler.Native.Runtime.applyFn", "Vuna/Compiler/Native/Runtime.vuna:701"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dapplyShimFn", ("Vuna.Compiler.Native.Runtime.applyShimFn", "Vuna/Compiler/Native/Runtime.vuna:715"));
  ("v_Vuna_dCompiler_dNative_dRuntime_darrayGetFn", ("Vuna.Compiler.Native.Runtime.arrayGetFn", "Vuna/Compiler/Native/Runtime.vuna:550"));
  ("v_Vuna_dCompiler_dNative_dRuntime_darrayLengthFn", ("Vuna.Compiler.Native.Runtime.arrayLengthFn", "Vuna/Compiler/Native/Runtime.vuna:546"));
  ("v_Vuna_dCompiler_dNative_dRuntime_darrayMakeFn", ("Vuna.Compiler.Native.Runtime.arrayMakeFn", "Vuna/Compiler/Native/Runtime.vuna:562"));
  ("v_Vuna_dCompiler_dNative_dRuntime_darrayOobMessage", ("Vuna.Compiler.Native.Runtime.arrayOobMessage", "Vuna/Compiler/Native/Runtime.vuna:58"));
  ("v_Vuna_dCompiler_dNative_dRuntime_darraySetFn", ("Vuna.Compiler.Native.Runtime.arraySetFn", "Vuna/Compiler/Native/Runtime.vuna:556"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dassertFn", ("Vuna.Compiler.Native.Runtime.assertFn", "Vuna/Compiler/Native/Runtime.vuna:679"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dassertPrefix", ("Vuna.Compiler.Native.Runtime.assertPrefix", "Vuna/Compiler/Native/Runtime.vuna:47"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dbadStackMessage", ("Vuna.Compiler.Native.Runtime.badStackMessage", "Vuna/Compiler/Native/Runtime.vuna:400"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dbitNotFn", ("Vuna.Compiler.Native.Runtime.bitNotFn", "Vuna/Compiler/Native/Runtime.vuna:134"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dbitShlFn", ("Vuna.Compiler.Native.Runtime.bitShlFn", "Vuna/Compiler/Native/Runtime.vuna:140"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dbitShrFn", ("Vuna.Compiler.Native.Runtime.bitShrFn", "Vuna/Compiler/Native/Runtime.vuna:147"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dcapFreeLabel", ("Vuna.Compiler.Native.Runtime.capFreeLabel", "Vuna/Compiler/Native/Runtime.vuna:391"));
  ("v_Vuna_dCompiler_dNative_dRuntime_ddebugLineFn", ("Vuna.Compiler.Native.Runtime.debugLineFn", "Vuna/Compiler/Native/Runtime.vuna:186"));
  ("v_Vuna_dCompiler_dNative_dRuntime_ddebugOnFn", ("Vuna.Compiler.Native.Runtime.debugOnFn", "Vuna/Compiler/Native/Runtime.vuna:183"));
  ("v_Vuna_dCompiler_dNative_dRuntime_ddivFn", ("Vuna.Compiler.Native.Runtime.divFn", "Vuna/Compiler/Native/Runtime.vuna:192"));
  ("v_Vuna_dCompiler_dNative_dRuntime_ddivZeroMessage", ("Vuna.Compiler.Native.Runtime.divZeroMessage", "Vuna/Compiler/Native/Runtime.vuna:37"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffAllocCaptureFn", ("Vuna.Compiler.Native.Runtime.effAllocCaptureFn", "Vuna/Compiler/Native/Runtime.vuna:475"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffAllocSegmentFn", ("Vuna.Compiler.Native.Runtime.effAllocSegmentFn", "Vuna/Compiler/Native/Runtime.vuna:461"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffExitFn", ("Vuna.Compiler.Native.Runtime.effExitFn", "Vuna/Compiler/Native/Runtime.vuna:538"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffFreeSegmentFn", ("Vuna.Compiler.Native.Runtime.effFreeSegmentFn", "Vuna/Compiler/Native/Runtime.vuna:467"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffHandleFn", ("Vuna.Compiler.Native.Runtime.effHandleFn", "Vuna/Compiler/Native/Runtime.vuna:435"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffKdoneFn", ("Vuna.Compiler.Native.Runtime.effKdoneFn", "Vuna/Compiler/Native/Runtime.vuna:505"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffNewRefFn", ("Vuna.Compiler.Native.Runtime.effNewRefFn", "Vuna/Compiler/Native/Runtime.vuna:516"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffPerformFn", ("Vuna.Compiler.Native.Runtime.effPerformFn", "Vuna/Compiler/Native/Runtime.vuna:428"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffPrintFn", ("Vuna.Compiler.Native.Runtime.effPrintFn", "Vuna/Compiler/Native/Runtime.vuna:529"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffReadRefFn", ("Vuna.Compiler.Native.Runtime.effReadRefFn", "Vuna/Compiler/Native/Runtime.vuna:521"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffResumeFn", ("Vuna.Compiler.Native.Runtime.effResumeFn", "Vuna/Compiler/Native/Runtime.vuna:498"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffTranslateNodesFn", ("Vuna.Compiler.Native.Runtime.effTranslateNodesFn", "Vuna/Compiler/Native/Runtime.vuna:483"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffUnrelocateFn", ("Vuna.Compiler.Native.Runtime.effUnrelocateFn", "Vuna/Compiler/Native/Runtime.vuna:490"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deffWriteRefFn", ("Vuna.Compiler.Native.Runtime.effWriteRefFn", "Vuna/Compiler/Native/Runtime.vuna:524"));
  ("v_Vuna_dCompiler_dNative_dRuntime_deraseFn", ("Vuna.Compiler.Native.Runtime.eraseFn", "Vuna/Compiler/Native/Runtime.vuna:535"));
  ("v_Vuna_dCompiler_dNative_dRuntime_derrFinish", ("Vuna.Compiler.Native.Runtime.errFinish", "Vuna/Compiler/Native/Runtime.vuna:643"));
  ("v_Vuna_dCompiler_dNative_dRuntime_derrPrefix", ("Vuna.Compiler.Native.Runtime.errPrefix", "Vuna/Compiler/Native/Runtime.vuna:44"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dfloatAbsFn", ("Vuna.Compiler.Native.Runtime.floatAbsFn", "Vuna/Compiler/Native/Runtime.vuna:351"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dfloatBinFn", ("Vuna.Compiler.Native.Runtime.floatBinFn", "Vuna/Compiler/Native/Runtime.vuna:319"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dfloatBox", ("Vuna.Compiler.Native.Runtime.floatBox", "Vuna/Compiler/Native/Runtime.vuna:310"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dfloatCmpFn", ("Vuna.Compiler.Native.Runtime.floatCmpFn", "Vuna/Compiler/Native/Runtime.vuna:346"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dfloatCmpNeq", ("Vuna.Compiler.Native.Runtime.floatCmpNeq", "Vuna/Compiler/Native/Runtime.vuna:336"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dfloatCmpOrdered", ("Vuna.Compiler.Native.Runtime.floatCmpOrdered", "Vuna/Compiler/Native/Runtime.vuna:325"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dfloatFromIntFn", ("Vuna.Compiler.Native.Runtime.floatFromIntFn", "Vuna/Compiler/Native/Runtime.vuna:313"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dfloatSqrtFn", ("Vuna.Compiler.Native.Runtime.floatSqrtFn", "Vuna/Compiler/Native/Runtime.vuna:356"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dfreeBlockFn", ("Vuna.Compiler.Native.Runtime.freeBlockFn", "Vuna/Compiler/Native/Runtime.vuna:454"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dfreeCaptureFn", ("Vuna.Compiler.Native.Runtime.freeCaptureFn", "Vuna/Compiler/Native/Runtime.vuna:448"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dhandlersLabel", ("Vuna.Compiler.Native.Runtime.handlersLabel", "Vuna/Compiler/Native/Runtime.vuna:379"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dimpossibleMessage", ("Vuna.Compiler.Native.Runtime.impossibleMessage", "Vuna/Compiler/Native/Runtime.vuna:53"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dintBinary", ("Vuna.Compiler.Native.Runtime.intBinary", "Vuna/Compiler/Native/Runtime.vuna:123"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dintCompare", ("Vuna.Compiler.Native.Runtime.intCompare", "Vuna/Compiler/Native/Runtime.vuna:129"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dintFromFloatFn", ("Vuna.Compiler.Native.Runtime.intFromFloatFn", "Vuna/Compiler/Native/Runtime.vuna:316"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dmapRetTo", ("Vuna.Compiler.Native.Runtime.mapRetTo", "Vuna/Compiler/Native/Runtime.vuna:112"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnatAddFn", ("Vuna.Compiler.Native.Runtime.natAddFn", "Vuna/Compiler/Native/Runtime.vuna:200"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnatDivFn", ("Vuna.Compiler.Native.Runtime.natDivFn", "Vuna/Compiler/Native/Runtime.vuna:215"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnatFromIntFn", ("Vuna.Compiler.Native.Runtime.natFromIntFn", "Vuna/Compiler/Native/Runtime.vuna:220"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnatMulFn", ("Vuna.Compiler.Native.Runtime.natMulFn", "Vuna/Compiler/Native/Runtime.vuna:210"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnatSubFn", ("Vuna.Compiler.Native.Runtime.natSubFn", "Vuna/Compiler/Native/Runtime.vuna:205"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnatSuccFn", ("Vuna.Compiler.Native.Runtime.natSuccFn", "Vuna/Compiler/Native/Runtime.vuna:225"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnatToIntFn", ("Vuna.Compiler.Native.Runtime.natToIntFn", "Vuna/Compiler/Native/Runtime.vuna:153"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnativeBss", ("Vuna.Compiler.Native.Runtime.nativeBss", "Vuna/Compiler/Native/Runtime.vuna:80"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnativeMaxInt", ("Vuna.Compiler.Native.Runtime.nativeMaxInt", "Vuna/Compiler/Native/Runtime.vuna:34"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnativeRodata", ("Vuna.Compiler.Native.Runtime.nativeRodata", "Vuna/Compiler/Native/Runtime.vuna:61"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnativeRtFuncs", ("Vuna.Compiler.Native.Runtime.nativeRtFuncs", "Vuna/Compiler/Native/Runtime.vuna:723"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnativeRtTarget", ("Vuna.Compiler.Native.Runtime.nativeRtTarget", "Vuna/Compiler/Native/Runtime.vuna:837"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dnativeRtValueArity", ("Vuna.Compiler.Native.Runtime.nativeRtValueArity", "Vuna/Compiler/Native/Runtime.vuna:953"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dobsSpanFn", ("Vuna.Compiler.Native.Runtime.obsSpanFn", "Vuna/Compiler/Native/Runtime.vuna:170"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dobsSpanLabFn", ("Vuna.Compiler.Native.Runtime.obsSpanLabFn", "Vuna/Compiler/Native/Runtime.vuna:176"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dobsZero2Fn", ("Vuna.Compiler.Native.Runtime.obsZero2Fn", "Vuna/Compiler/Native/Runtime.vuna:165"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dobsZeroFn", ("Vuna.Compiler.Native.Runtime.obsZeroFn", "Vuna/Compiler/Native/Runtime.vuna:162"));
  ("v_Vuna_dCompiler_dNative_dRuntime_doomMessage", ("Vuna.Compiler.Native.Runtime.oomMessage", "Vuna/Compiler/Native/Runtime.vuna:40"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dpow2CeilFn", ("Vuna.Compiler.Native.Runtime.pow2CeilFn", "Vuna/Compiler/Native/Runtime.vuna:442"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dprimFailFn", ("Vuna.Compiler.Native.Runtime.primFailFn", "Vuna/Compiler/Native/Runtime.vuna:685"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dprintBoolFn", ("Vuna.Compiler.Native.Runtime.printBoolFn", "Vuna/Compiler/Native/Runtime.vuna:577"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dprintIntFn", ("Vuna.Compiler.Native.Runtime.printIntFn", "Vuna/Compiler/Native/Runtime.vuna:571"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dprintStrFn", ("Vuna.Compiler.Native.Runtime.printStrFn", "Vuna/Compiler/Native/Runtime.vuna:583"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dresumeTwiceMessage", ("Vuna.Compiler.Native.Runtime.resumeTwiceMessage", "Vuna/Compiler/Native/Runtime.vuna:397"));
  ("v_Vuna_dCompiler_dNative_dRuntime_drtFunc", ("Vuna.Compiler.Native.Runtime.rtFunc", "Vuna/Compiler/Native/Runtime.vuna:104"));
  ("v_Vuna_dCompiler_dNative_dRuntime_drtRawFunc", ("Vuna.Compiler.Native.Runtime.rtRawFunc", "Vuna/Compiler/Native/Runtime.vuna:119"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dsegFreeLabel", ("Vuna.Compiler.Native.Runtime.segFreeLabel", "Vuna/Compiler/Native/Runtime.vuna:388"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstackGuardInstrs", ("Vuna.Compiler.Native.Runtime.stackGuardInstrs", "Vuna/Compiler/Native/Runtime.vuna:100"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstackLimitLabel", ("Vuna.Compiler.Native.Runtime.stackLimitLabel", "Vuna/Compiler/Native/Runtime.vuna:385"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstackOverflowMessage", ("Vuna.Compiler.Native.Runtime.stackOverflowMessage", "Vuna/Compiler/Native/Runtime.vuna:403"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstackTopLabel", ("Vuna.Compiler.Native.Runtime.stackTopLabel", "Vuna/Compiler/Native/Runtime.vuna:382"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstrAllocFn", ("Vuna.Compiler.Native.Runtime.strAllocFn", "Vuna/Compiler/Native/Runtime.vuna:236"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstrAtFn", ("Vuna.Compiler.Native.Runtime.strAtFn", "Vuna/Compiler/Native/Runtime.vuna:282"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstrCompareFn", ("Vuna.Compiler.Native.Runtime.strCompareFn", "Vuna/Compiler/Native/Runtime.vuna:264"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstrCompareFnOf", ("Vuna.Compiler.Native.Runtime.strCompareFnOf", "Vuna/Compiler/Native/Runtime.vuna:270"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstrConcatFn", ("Vuna.Compiler.Native.Runtime.strConcatFn", "Vuna/Compiler/Native/Runtime.vuna:246"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstrEqFn", ("Vuna.Compiler.Native.Runtime.strEqFn", "Vuna/Compiler/Native/Runtime.vuna:252"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstrFromIntFn", ("Vuna.Compiler.Native.Runtime.strFromIntFn", "Vuna/Compiler/Native/Runtime.vuna:276"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstrHashFn", ("Vuna.Compiler.Native.Runtime.strHashFn", "Vuna/Compiler/Native/Runtime.vuna:294"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstrLengthFn", ("Vuna.Compiler.Native.Runtime.strLengthFn", "Vuna/Compiler/Native/Runtime.vuna:242"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstrNeqFn", ("Vuna.Compiler.Native.Runtime.strNeqFn", "Vuna/Compiler/Native/Runtime.vuna:258"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstrShowFn", ("Vuna.Compiler.Native.Runtime.strShowFn", "Vuna/Compiler/Native/Runtime.vuna:301"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dstrSubstringFn", ("Vuna.Compiler.Native.Runtime.strSubstringFn", "Vuna/Compiler/Native/Runtime.vuna:288"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtodoFn", ("Vuna.Compiler.Native.Runtime.todoFn", "Vuna/Compiler/Native/Runtime.vuna:689"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtodoPrefix", ("Vuna.Compiler.Native.Runtime.todoPrefix", "Vuna/Compiler/Native/Runtime.vuna:50"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtrapArrayOobFn", ("Vuna.Compiler.Native.Runtime.trapArrayOobFn", "Vuna/Compiler/Native/Runtime.vuna:604"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtrapAssertFn", ("Vuna.Compiler.Native.Runtime.trapAssertFn", "Vuna/Compiler/Native/Runtime.vuna:668"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtrapBadStackFn", ("Vuna.Compiler.Native.Runtime.trapBadStackFn", "Vuna/Compiler/Native/Runtime.vuna:416"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtrapDivZeroFn", ("Vuna.Compiler.Native.Runtime.trapDivZeroFn", "Vuna/Compiler/Native/Runtime.vuna:599"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtrapImpossibleFn", ("Vuna.Compiler.Native.Runtime.trapImpossibleFn", "Vuna/Compiler/Native/Runtime.vuna:594"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtrapMsgFn", ("Vuna.Compiler.Native.Runtime.trapMsgFn", "Vuna/Compiler/Native/Runtime.vuna:662"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtrapOomFn", ("Vuna.Compiler.Native.Runtime.trapOomFn", "Vuna/Compiler/Native/Runtime.vuna:609"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtrapResumeTwiceFn", ("Vuna.Compiler.Native.Runtime.trapResumeTwiceFn", "Vuna/Compiler/Native/Runtime.vuna:411"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtrapStackOverflowFn", ("Vuna.Compiler.Native.Runtime.trapStackOverflowFn", "Vuna/Compiler/Native/Runtime.vuna:421"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtrapTodoFn", ("Vuna.Compiler.Native.Runtime.trapTodoFn", "Vuna/Compiler/Native/Runtime.vuna:674"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtrapUnhandledFn", ("Vuna.Compiler.Native.Runtime.trapUnhandledFn", "Vuna/Compiler/Native/Runtime.vuna:406"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dtrapWithPrefix", ("Vuna.Compiler.Native.Runtime.trapWithPrefix", "Vuna/Compiler/Native/Runtime.vuna:656"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dunhandledEffectMessage", ("Vuna.Compiler.Native.Runtime.unhandledEffectMessage", "Vuna/Compiler/Native/Runtime.vuna:394"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dwriteErrMsg", ("Vuna.Compiler.Native.Runtime.writeErrMsg", "Vuna/Compiler/Native/Runtime.vuna:633"));
  ("v_Vuna_dCompiler_dNative_dRuntime_dwriteErrRaw", ("Vuna.Compiler.Native.Runtime.writeErrRaw", "Vuna/Compiler/Native/Runtime.vuna:623"));
  ("v_Vuna_dCompiler_dWasm_dInstr_doneInstr", ("Vuna.Compiler.Wasm.Instr.oneInstr", "Vuna/Compiler/Wasm/Instr.vuna:90"));
  ("v_Vuna_dCompiler_dWasm_dInstr_dseqInstr", ("Vuna.Compiler.Wasm.Instr.seqInstr", "Vuna/Compiler/Wasm/Instr.vuna:86"));
  ("v_Vuna_dCompiler_dWasm_dModel_dtargetText", ("Vuna.Compiler.Wasm.Model.targetText", "Vuna/Compiler/Wasm/Model.vuna:23"));
  ("v_Vuna_dCompiler_dWasm_dModel_dwasmErrText", ("Vuna.Compiler.Wasm.Model.wasmErrText", "Vuna/Compiler/Wasm/Model.vuna:32"));
  ("v_Vuna_dCompiler_dWasm_dModel_dwatValTyText", ("Vuna.Compiler.Wasm.Model.watValTyText", "Vuna/Compiler/Wasm/Model.vuna:51"));
  ("v_Vuna_dCompiler_dWasm_dModule_daddElemName", ("Vuna.Compiler.Wasm.Module.addElemName", "Vuna/Compiler/Wasm/Module.vuna:435"));
  ("v_Vuna_dCompiler_dWasm_dModule_daddLamFunc", ("Vuna.Compiler.Wasm.Module.addLamFunc", "Vuna/Compiler/Wasm/Module.vuna:432"));
  ("v_Vuna_dCompiler_dWasm_dModule_dapplyAllIr", ("Vuna.Compiler.Wasm.Module.applyAllIr", "Vuna/Compiler/Wasm/Module.vuna:219"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbNameEq", ("Vuna.Compiler.Wasm.Module.bNameEq", "Vuna/Compiler/Wasm/Module.vuna:59"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbaseImports", ("Vuna.Compiler.Wasm.Module.baseImports", "Vuna/Compiler/Wasm/Module.vuna:1335"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbaseTags", ("Vuna.Compiler.Wasm.Module.baseTags", "Vuna/Compiler/Wasm/Module.vuna:1332"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbaseTypes", ("Vuna.Compiler.Wasm.Module.baseTypes", "Vuna/Compiler/Wasm/Module.vuna:1317"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbeginFuncScope", ("Vuna.Compiler.Wasm.Module.beginFuncScope", "Vuna/Compiler/Wasm/Module.vuna:100"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbindEnvLocals", ("Vuna.Compiler.Wasm.Module.bindEnvLocals", "Vuna/Compiler/Wasm/Module.vuna:421"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbindFields", ("Vuna.Compiler.Wasm.Module.bindFields", "Vuna/Compiler/Wasm/Module.vuna:822"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbindScrutBinder", ("Vuna.Compiler.Wasm.Module.bindScrutBinder", "Vuna/Compiler/Wasm/Module.vuna:786"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbinderEq", ("Vuna.Compiler.Wasm.Module.binderEq", "Vuna/Compiler/Wasm/Module.vuna:73"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbinderErasedOf", ("Vuna.Compiler.Wasm.Module.binderErasedOf", "Vuna/Compiler/Wasm/Module.vuna:56"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbinderNameOf", ("Vuna.Compiler.Wasm.Module.binderNameOf", "Vuna/Compiler/Wasm/Module.vuna:53"));
  ("v_Vuna_dCompiler_dWasm_dModule_dboolI31", ("Vuna.Compiler.Wasm.Module.boolI31", "Vuna/Compiler/Wasm/Module.vuna:181"));
  ("v_Vuna_dCompiler_dWasm_dModule_dboxInstr", ("Vuna.Compiler.Wasm.Module.boxInstr", "Vuna/Compiler/Wasm/Module.vuna:554"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbuild", ("Vuna.Compiler.Wasm.Module.build", "Vuna/Compiler/Wasm/Module.vuna:1402"));
  ("v_Vuna_dCompiler_dWasm_dModule_dbuildModule", ("Vuna.Compiler.Wasm.Module.buildModule", "Vuna/Compiler/Wasm/Module.vuna:1370"));
  ("v_Vuna_dCompiler_dWasm_dModule_dcapGetInstrs", ("Vuna.Compiler.Wasm.Module.capGetInstrs", "Vuna/Compiler/Wasm/Module.vuna:416"));
  ("v_Vuna_dCompiler_dWasm_dModule_dcaseFamilyOf", ("Vuna.Compiler.Wasm.Module.caseFamilyOf", "Vuna/Compiler/Wasm/Module.vuna:769"));
  ("v_Vuna_dCompiler_dWasm_dModule_dcatI", ("Vuna.Compiler.Wasm.Module.catI", "Vuna/Compiler/Wasm/Module.vuna:1019"));
  ("v_Vuna_dCompiler_dWasm_dModule_dclassifyWasmErr", ("Vuna.Compiler.Wasm.Module.classifyWasmErr", "Vuna/Compiler/Wasm/Module.vuna:1456"));
  ("v_Vuna_dCompiler_dWasm_dModule_dcmpArrFunc", ("Vuna.Compiler.Wasm.Module.cmpArrFunc", "Vuna/Compiler/Wasm/Module.vuna:894"));
  ("v_Vuna_dCompiler_dWasm_dModule_dcmpDispatch", ("Vuna.Compiler.Wasm.Module.cmpDispatch", "Vuna/Compiler/Wasm/Module.vuna:982"));
  ("v_Vuna_dCompiler_dWasm_dModule_dcmpFamBody", ("Vuna.Compiler.Wasm.Module.cmpFamBody", "Vuna/Compiler/Wasm/Module.vuna:946"));
  ("v_Vuna_dCompiler_dWasm_dModule_dcmpFamFlat", ("Vuna.Compiler.Wasm.Module.cmpFamFlat", "Vuna/Compiler/Wasm/Module.vuna:965"));
  ("v_Vuna_dCompiler_dWasm_dModule_dcmpFields", ("Vuna.Compiler.Wasm.Module.cmpFields", "Vuna/Compiler/Wasm/Module.vuna:932"));
  ("v_Vuna_dCompiler_dWasm_dModule_dcmpPrimFlat", ("Vuna.Compiler.Wasm.Module.cmpPrimFlat", "Vuna/Compiler/Wasm/Module.vuna:974"));
  ("v_Vuna_dCompiler_dWasm_dModule_dcmpStrFunc", ("Vuna.Compiler.Wasm.Module.cmpStrFunc", "Vuna/Compiler/Wasm/Module.vuna:855"));
  ("v_Vuna_dCompiler_dWasm_dModule_dcmpTrapFunc", ("Vuna.Compiler.Wasm.Module.cmpTrapFunc", "Vuna/Compiler/Wasm/Module.vuna:850"));
  ("v_Vuna_dCompiler_dWasm_dModule_dconcatMapType", ("Vuna.Compiler.Wasm.Module.concatMapType", "Vuna/Compiler/Wasm/Module.vuna:1364"));
  ("v_Vuna_dCompiler_dWasm_dModule_deffArgBinders", ("Vuna.Compiler.Wasm.Module.effArgBinders", "Vuna/Compiler/Wasm/Module.vuna:226"));
  ("v_Vuna_dCompiler_dWasm_dModule_deffUnitBinder", ("Vuna.Compiler.Wasm.Module.effUnitBinder", "Vuna/Compiler/Wasm/Module.vuna:223"));
  ("v_Vuna_dCompiler_dWasm_dModule_demptyStr", ("Vuna.Compiler.Wasm.Module.emptyStr", "Vuna/Compiler/Wasm/Module.vuna:184"));
  ("v_Vuna_dCompiler_dWasm_dModule_dendFuncScope", ("Vuna.Compiler.Wasm.Module.endFuncScope", "Vuna/Compiler/Wasm/Module.vuna:113"));
  ("v_Vuna_dCompiler_dWasm_dModule_densureLocal", ("Vuna.Compiler.Wasm.Module.ensureLocal", "Vuna/Compiler/Wasm/Module.vuna:756"));
  ("v_Vuna_dCompiler_dWasm_dModule_dentryShowFunc", ("Vuna.Compiler.Wasm.Module.entryShowFunc", "Vuna/Compiler/Wasm/Module.vuna:1276"));
  ("v_Vuna_dCompiler_dWasm_dModule_detaBinders", ("Vuna.Compiler.Wasm.Module.etaBinders", "Vuna/Compiler/Wasm/Module.vuna:292"));
  ("v_Vuna_dCompiler_dWasm_dModule_dfamNameOf", ("Vuna.Compiler.Wasm.Module.famNameOf", "Vuna/Compiler/Wasm/Module.vuna:1452"));
  ("v_Vuna_dCompiler_dWasm_dModule_dfamOrFail", ("Vuna.Compiler.Wasm.Module.famOrFail", "Vuna/Compiler/Wasm/Module.vuna:631"));
  ("v_Vuna_dCompiler_dWasm_dModule_dflattenApp", ("Vuna.Compiler.Wasm.Module.flattenApp", "Vuna/Compiler/Wasm/Module.vuna:369"));
  ("v_Vuna_dCompiler_dWasm_dModule_dfloatDigitsGo", ("Vuna.Compiler.Wasm.Module.floatDigitsGo", "Vuna/Compiler/Wasm/Module.vuna:195"));
  ("v_Vuna_dCompiler_dWasm_dModule_dfloatDigitsOf", ("Vuna.Compiler.Wasm.Module.floatDigitsOf", "Vuna/Compiler/Wasm/Module.vuna:192"));
  ("v_Vuna_dCompiler_dWasm_dModule_dfloatPow10", ("Vuna.Compiler.Wasm.Module.floatPow10", "Vuna/Compiler/Wasm/Module.vuna:200"));
  ("v_Vuna_dCompiler_dWasm_dModule_dfloatRenderName", ("Vuna.Compiler.Wasm.Module.floatRenderName", "Vuna/Compiler/Wasm/Module.vuna:1449"));
  ("v_Vuna_dCompiler_dWasm_dModule_dfoldlStrings", ("Vuna.Compiler.Wasm.Module.foldlStrings", "Vuna/Compiler/Wasm/Module.vuna:1460"));
  ("v_Vuna_dCompiler_dWasm_dModule_dfreshLocal", ("Vuna.Compiler.Wasm.Module.freshLocal", "Vuna/Compiler/Wasm/Module.vuna:81"));
  ("v_Vuna_dCompiler_dWasm_dModule_dfuncParams", ("Vuna.Compiler.Wasm.Module.funcParams", "Vuna/Compiler/Wasm/Module.vuna:149"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenAltBody", ("Vuna.Compiler.Wasm.Module.genAltBody", "Vuna/Compiler/Wasm/Module.vuna:812"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenApp", ("Vuna.Compiler.Wasm.Module.genApp", "Vuna/Compiler/Wasm/Module.vuna:376"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenApplyArgs", ("Vuna.Compiler.Wasm.Module.genApplyArgs", "Vuna/Compiler/Wasm/Module.vuna:490"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenApplyValue", ("Vuna.Compiler.Wasm.Module.genApplyValue", "Vuna/Compiler/Wasm/Module.vuna:484"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenArgsThen", ("Vuna.Compiler.Wasm.Module.genArgsThen", "Vuna/Compiler/Wasm/Module.vuna:522"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenCase", ("Vuna.Compiler.Wasm.Module.genCase", "Vuna/Compiler/Wasm/Module.vuna:725"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenCatchAllOnly", ("Vuna.Compiler.Wasm.Module.genCatchAllOnly", "Vuna/Compiler/Wasm/Module.vuna:776"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenConcatMany", ("Vuna.Compiler.Wasm.Module.genConcatMany", "Vuna/Compiler/Wasm/Module.vuna:608"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenConcatRest", ("Vuna.Compiler.Wasm.Module.genConcatRest", "Vuna/Compiler/Wasm/Module.vuna:619"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenCtor", ("Vuna.Compiler.Wasm.Module.genCtor", "Vuna/Compiler/Wasm/Module.vuna:650"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenDefFunc", ("Vuna.Compiler.Wasm.Module.genDefFunc", "Vuna/Compiler/Wasm/Module.vuna:1210"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncBody", ("Vuna.Compiler.Wasm.Module.genDefFuncBody", "Vuna/Compiler/Wasm/Module.vuna:1216"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncGo", ("Vuna.Compiler.Wasm.Module.genDefFuncGo", "Vuna/Compiler/Wasm/Module.vuna:1230"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenDefFuncs", ("Vuna.Compiler.Wasm.Module.genDefFuncs", "Vuna/Compiler/Wasm/Module.vuna:1245"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenDefInit", ("Vuna.Compiler.Wasm.Module.genDefInit", "Vuna/Compiler/Wasm/Module.vuna:1257"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenDefsInits", ("Vuna.Compiler.Wasm.Module.genDefsInits", "Vuna/Compiler/Wasm/Module.vuna:1267"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenEffThunk", ("Vuna.Compiler.Wasm.Module.genEffThunk", "Vuna/Compiler/Wasm/Module.vuna:229"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenExpr", ("Vuna.Compiler.Wasm.Module.genExpr", "Vuna/Compiler/Wasm/Module.vuna:239"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenExprs", ("Vuna.Compiler.Wasm.Module.genExprs", "Vuna/Compiler/Wasm/Module.vuna:639"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenFloatLit", ("Vuna.Compiler.Wasm.Module.genFloatLit", "Vuna/Compiler/Wasm/Module.vuna:203"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenGlobalCall", ("Vuna.Compiler.Wasm.Module.genGlobalCall", "Vuna/Compiler/Wasm/Module.vuna:392"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenGlobalRef", ("Vuna.Compiler.Wasm.Module.genGlobalRef", "Vuna/Compiler/Wasm/Module.vuna:271"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenIf", ("Vuna.Compiler.Wasm.Module.genIf", "Vuna/Compiler/Wasm/Module.vuna:316"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenLamApp", ("Vuna.Compiler.Wasm.Module.genLamApp", "Vuna/Compiler/Wasm/Module.vuna:500"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenLamValue", ("Vuna.Compiler.Wasm.Module.genLamValue", "Vuna/Compiler/Wasm/Module.vuna:448"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenLet", ("Vuna.Compiler.Wasm.Module.genLet", "Vuna/Compiler/Wasm/Module.vuna:334"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenLetBound", ("Vuna.Compiler.Wasm.Module.genLetBound", "Vuna/Compiler/Wasm/Module.vuna:346"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenNatArm", ("Vuna.Compiler.Wasm.Module.genNatArm", "Vuna/Compiler/Wasm/Module.vuna:559"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenNatArmAlt", ("Vuna.Compiler.Wasm.Module.genNatArmAlt", "Vuna/Compiler/Wasm/Module.vuna:565"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenNatCase", ("Vuna.Compiler.Wasm.Module.genNatCase", "Vuna/Compiler/Wasm/Module.vuna:581"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenProj", ("Vuna.Compiler.Wasm.Module.genProj", "Vuna/Compiler/Wasm/Module.vuna:678"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenRecUpd", ("Vuna.Compiler.Wasm.Module.genRecUpd", "Vuna/Compiler/Wasm/Module.vuna:691"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenRecord", ("Vuna.Compiler.Wasm.Module.genRecord", "Vuna/Compiler/Wasm/Module.vuna:669"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenRecordCase", ("Vuna.Compiler.Wasm.Module.genRecordCase", "Vuna/Compiler/Wasm/Module.vuna:832"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenRtApp", ("Vuna.Compiler.Wasm.Module.genRtApp", "Vuna/Compiler/Wasm/Module.vuna:531"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenRtValue", ("Vuna.Compiler.Wasm.Module.genRtValue", "Vuna/Compiler/Wasm/Module.vuna:282"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenStartBody", ("Vuna.Compiler.Wasm.Module.genStartBody", "Vuna/Compiler/Wasm/Module.vuna:1286"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenStr", ("Vuna.Compiler.Wasm.Module.genStr", "Vuna/Compiler/Wasm/Module.vuna:302"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenUpdFields", ("Vuna.Compiler.Wasm.Module.genUpdFields", "Vuna/Compiler/Wasm/Module.vuna:704"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenVar", ("Vuna.Compiler.Wasm.Module.genVar", "Vuna/Compiler/Wasm/Module.vuna:265"));
  ("v_Vuna_dCompiler_dWasm_dModule_dgenVariantCase", ("Vuna.Compiler.Wasm.Module.genVariantCase", "Vuna/Compiler/Wasm/Module.vuna:793"));
  ("v_Vuna_dCompiler_dWasm_dModule_dglobalOfDef", ("Vuna.Compiler.Wasm.Module.globalOfDef", "Vuna/Compiler/Wasm/Module.vuna:1360"));
  ("v_Vuna_dCompiler_dWasm_dModule_dglobalsOf", ("Vuna.Compiler.Wasm.Module.globalsOf", "Vuna/Compiler/Wasm/Module.vuna:1357"));
  ("v_Vuna_dCompiler_dWasm_dModule_disConcreteFam", ("Vuna.Compiler.Wasm.Module.isConcreteFam", "Vuna/Compiler/Wasm/Module.vuna:977"));
  ("v_Vuna_dCompiler_dWasm_dModule_djoinWith", ("Vuna.Compiler.Wasm.Module.joinWith", "Vuna/Compiler/Wasm/Module.vuna:1484"));
  ("v_Vuna_dCompiler_dWasm_dModule_dlistLengthB", ("Vuna.Compiler.Wasm.Module.listLengthB", "Vuna/Compiler/Wasm/Module.vuna:362"));
  ("v_Vuna_dCompiler_dWasm_dModule_dlookupBinder", ("Vuna.Compiler.Wasm.Module.lookupBinder", "Vuna/Compiler/Wasm/Module.vuna:76"));
  ("v_Vuna_dCompiler_dWasm_dModule_dlookupFieldIr", ("Vuna.Compiler.Wasm.Module.lookupFieldIr", "Vuna/Compiler/Wasm/Module.vuna:718"));
  ("v_Vuna_dCompiler_dWasm_dModule_dmemFuncName", ("Vuna.Compiler.Wasm.Module.memFuncName", "Vuna/Compiler/Wasm/Module.vuna:138"));
  ("v_Vuna_dCompiler_dWasm_dModule_dmemLocalName", ("Vuna.Compiler.Wasm.Module.memLocalName", "Vuna/Compiler/Wasm/Module.vuna:128"));
  ("v_Vuna_dCompiler_dWasm_dModule_dmemStr", ("Vuna.Compiler.Wasm.Module.memStr", "Vuna/Compiler/Wasm/Module.vuna:752"));
  ("v_Vuna_dCompiler_dWasm_dModule_dmergeArmState", ("Vuna.Compiler.Wasm.Module.mergeArmState", "Vuna/Compiler/Wasm/Module.vuna:121"));
  ("v_Vuna_dCompiler_dWasm_dModule_dmergeFuncs", ("Vuna.Compiler.Wasm.Module.mergeFuncs", "Vuna/Compiler/Wasm/Module.vuna:135"));
  ("v_Vuna_dCompiler_dWasm_dModule_dmergeLocals", ("Vuna.Compiler.Wasm.Module.mergeLocals", "Vuna/Compiler/Wasm/Module.vuna:125"));
  ("v_Vuna_dCompiler_dWasm_dModule_dmergeNames", ("Vuna.Compiler.Wasm.Module.mergeNames", "Vuna/Compiler/Wasm/Module.vuna:142"));
  ("v_Vuna_dCompiler_dWasm_dModule_dmkConsts", ("Vuna.Compiler.Wasm.Module.mkConsts", "Vuna/Compiler/Wasm/Module.vuna:1464"));
  ("v_Vuna_dCompiler_dWasm_dModule_dnoTail", ("Vuna.Compiler.Wasm.Module.noTail", "Vuna/Compiler/Wasm/Module.vuna:106"));
  ("v_Vuna_dCompiler_dWasm_dModule_dpoolAdd", ("Vuna.Compiler.Wasm.Module.poolAdd", "Vuna/Compiler/Wasm/Module.vuna:156"));
  ("v_Vuna_dCompiler_dWasm_dModule_dpoolBytes", ("Vuna.Compiler.Wasm.Module.poolBytes", "Vuna/Compiler/Wasm/Module.vuna:175"));
  ("v_Vuna_dCompiler_dWasm_dModule_dpoolLookup", ("Vuna.Compiler.Wasm.Module.poolLookup", "Vuna/Compiler/Wasm/Module.vuna:172"));
  ("v_Vuna_dCompiler_dWasm_dModule_dpoolOf", ("Vuna.Compiler.Wasm.Module.poolOf", "Vuna/Compiler/Wasm/Module.vuna:161"));
  ("v_Vuna_dCompiler_dWasm_dModule_dpoolOffsets", ("Vuna.Compiler.Wasm.Module.poolOffsets", "Vuna/Compiler/Wasm/Module.vuna:167"));
  ("v_Vuna_dCompiler_dWasm_dModule_dprepend", ("Vuna.Compiler.Wasm.Module.prepend", "Vuna/Compiler/Wasm/Module.vuna:761"));
  ("v_Vuna_dCompiler_dWasm_dModule_dpushBinder", ("Vuna.Compiler.Wasm.Module.pushBinder", "Vuna/Compiler/Wasm/Module.vuna:88"));
  ("v_Vuna_dCompiler_dWasm_dModule_drefNullN", ("Vuna.Compiler.Wasm.Module.refNullN", "Vuna/Compiler/Wasm/Module.vuna:636"));
  ("v_Vuna_dCompiler_dWasm_dModule_drefNulls", ("Vuna.Compiler.Wasm.Module.refNulls", "Vuna/Compiler/Wasm/Module.vuna:1022"));
  ("v_Vuna_dCompiler_dWasm_dModule_drestoreFuncScope", ("Vuna.Compiler.Wasm.Module.restoreFuncScope", "Vuna/Compiler/Wasm/Module.vuna:438"));
  ("v_Vuna_dCompiler_dWasm_dModule_drestoreScope", ("Vuna.Compiler.Wasm.Module.restoreScope", "Vuna/Compiler/Wasm/Module.vuna:92"));
  ("v_Vuna_dCompiler_dWasm_dModule_drestoreTail", ("Vuna.Compiler.Wasm.Module.restoreTail", "Vuna/Compiler/Wasm/Module.vuna:765"));
  ("v_Vuna_dCompiler_dWasm_dModule_dresumeArm", ("Vuna.Compiler.Wasm.Module.resumeArm", "Vuna/Compiler/Wasm/Module.vuna:313"));
  ("v_Vuna_dCompiler_dWasm_dModule_drtArrayFromListF", ("Vuna.Compiler.Wasm.Module.rtArrayFromListF", "Vuna/Compiler/Wasm/Module.vuna:1149"));
  ("v_Vuna_dCompiler_dWasm_dModule_drtArrayToListF", ("Vuna.Compiler.Wasm.Module.rtArrayToListF", "Vuna/Compiler/Wasm/Module.vuna:1158"));
  ("v_Vuna_dCompiler_dWasm_dModule_drtCompareFunc", ("Vuna.Compiler.Wasm.Module.rtCompareFunc", "Vuna/Compiler/Wasm/Module.vuna:1001"));
  ("v_Vuna_dCompiler_dWasm_dModule_drtGetArgsF", ("Vuna.Compiler.Wasm.Module.rtGetArgsF", "Vuna/Compiler/Wasm/Module.vuna:1167"));
  ("v_Vuna_dCompiler_dWasm_dModule_drtStrArgAtF", ("Vuna.Compiler.Wasm.Module.rtStrArgAtF", "Vuna/Compiler/Wasm/Module.vuna:1092"));
  ("v_Vuna_dCompiler_dWasm_dModule_drtStrConcatManyF", ("Vuna.Compiler.Wasm.Module.rtStrConcatManyF", "Vuna/Compiler/Wasm/Module.vuna:1075"));
  ("v_Vuna_dCompiler_dWasm_dModule_drtStrPackF", ("Vuna.Compiler.Wasm.Module.rtStrPackF", "Vuna/Compiler/Wasm/Module.vuna:1064"));
  ("v_Vuna_dCompiler_dWasm_dModule_drtStrSubstTemplateF", ("Vuna.Compiler.Wasm.Module.rtStrSubstTemplateF", "Vuna/Compiler/Wasm/Module.vuna:1140"));
  ("v_Vuna_dCompiler_dWasm_dModule_drtStrUnpackF", ("Vuna.Compiler.Wasm.Module.rtStrUnpackF", "Vuna/Compiler/Wasm/Module.vuna:1047"));
  ("v_Vuna_dCompiler_dWasm_dModule_drtTryReadDirF", ("Vuna.Compiler.Wasm.Module.rtTryReadDirF", "Vuna/Compiler/Wasm/Module.vuna:1189"));
  ("v_Vuna_dCompiler_dWasm_dModule_druntimeBinders", ("Vuna.Compiler.Wasm.Module.runtimeBinders", "Vuna/Compiler/Wasm/Module.vuna:96"));
  ("v_Vuna_dCompiler_dWasm_dModule_dscrutInstrs", ("Vuna.Compiler.Wasm.Module.scrutInstrs", "Vuna/Compiler/Wasm/Module.vuna:749"));
  ("v_Vuna_dCompiler_dWasm_dModule_dscrutSlot", ("Vuna.Compiler.Wasm.Module.scrutSlot", "Vuna/Compiler/Wasm/Module.vuna:746"));
  ("v_Vuna_dCompiler_dWasm_dModule_dsplitAt", ("Vuna.Compiler.Wasm.Module.splitAt", "Vuna/Compiler/Wasm/Module.vuna:295"));
  ("v_Vuna_dCompiler_dWasm_dModule_dstDigits", ("Vuna.Compiler.Wasm.Module.stDigits", "Vuna/Compiler/Wasm/Module.vuna:1100"));
  ("v_Vuna_dCompiler_dWasm_dModule_dstNotPlaceholder", ("Vuna.Compiler.Wasm.Module.stNotPlaceholder", "Vuna/Compiler/Wasm/Module.vuna:1112"));
  ("v_Vuna_dCompiler_dWasm_dModule_dunboxLocalInt", ("Vuna.Compiler.Wasm.Module.unboxLocalInt", "Vuna/Compiler/Wasm/Module.vuna:551"));
  ("v_Vuna_dCompiler_dWasm_dModule_dwasmBridgeFuncs", ("Vuna.Compiler.Wasm.Module.wasmBridgeFuncs", "Vuna/Compiler/Wasm/Module.vuna:1033"));
  ("v_Vuna_dCompiler_dWasm_dModule_dwasmCompareFuncs", ("Vuna.Compiler.Wasm.Module.wasmCompareFuncs", "Vuna/Compiler/Wasm/Module.vuna:1013"));
  ("v_Vuna_dCompiler_dWasm_dModule_dwasmListTy", ("Vuna.Compiler.Wasm.Module.wasmListTy", "Vuna/Compiler/Wasm/Module.vuna:1025"));
  ("v_Vuna_dCompiler_dWasm_dModule_dwasmNilCell", ("Vuna.Compiler.Wasm.Module.wasmNilCell", "Vuna/Compiler/Wasm/Module.vuna:1028"));
  ("v_Vuna_dCompiler_dWasm_dModule_dwatFuncNameOfF", ("Vuna.Compiler.Wasm.Module.watFuncNameOfF", "Vuna/Compiler/Wasm/Module.vuna:132"));
  ("v_Vuna_dCompiler_dWasm_dModule_dwithTail", ("Vuna.Compiler.Wasm.Module.withTail", "Vuna/Compiler/Wasm/Module.vuna:109"));
  ("v_Vuna_dCompiler_dWasm_dModule_dzipIdx", ("Vuna.Compiler.Wasm.Module.zipIdx", "Vuna/Compiler/Wasm/Module.vuna:145"));
  ("v_Vuna_dCompiler_dWasm_dRender_dchunkBytes", ("Vuna.Compiler.Wasm.Render.chunkBytes", "Vuna/Compiler/Wasm/Render.vuna:78"));
  ("v_Vuna_dCompiler_dWasm_dRender_dchunkBytesGo", ("Vuna.Compiler.Wasm.Render.chunkBytesGo", "Vuna/Compiler/Wasm/Render.vuna:81"));
  ("v_Vuna_dCompiler_dWasm_dRender_dfitsLine", ("Vuna.Compiler.Wasm.Render.fitsLine", "Vuna/Compiler/Wasm/Render.vuna:27"));
  ("v_Vuna_dCompiler_dWasm_dRender_dflushWord", ("Vuna.Compiler.Wasm.Render.flushWord", "Vuna/Compiler/Wasm/Render.vuna:44"));
  ("v_Vuna_dCompiler_dWasm_dRender_dfuncOpeningMulti", ("Vuna.Compiler.Wasm.Render.funcOpeningMulti", "Vuna/Compiler/Wasm/Render.vuna:301"));
  ("v_Vuna_dCompiler_dWasm_dRender_dfuncOpeningOne", ("Vuna.Compiler.Wasm.Render.funcOpeningOne", "Vuna/Compiler/Wasm/Render.vuna:293"));
  ("v_Vuna_dCompiler_dWasm_dRender_dfuncTypeMulti", ("Vuna.Compiler.Wasm.Render.funcTypeMulti", "Vuna/Compiler/Wasm/Render.vuna:204"));
  ("v_Vuna_dCompiler_dWasm_dRender_dfuncTypeOne", ("Vuna.Compiler.Wasm.Render.funcTypeOne", "Vuna/Compiler/Wasm/Render.vuna:197"));
  ("v_Vuna_dCompiler_dWasm_dRender_dhex2", ("Vuna.Compiler.Wasm.Render.hex2", "Vuna/Compiler/Wasm/Render.vuna:65"));
  ("v_Vuna_dCompiler_dWasm_dRender_dhexDigit", ("Vuna.Compiler.Wasm.Render.hexDigit", "Vuna/Compiler/Wasm/Render.vuna:62"));
  ("v_Vuna_dCompiler_dWasm_dRender_dimportMulti", ("Vuna.Compiler.Wasm.Render.importMulti", "Vuna/Compiler/Wasm/Render.vuna:265"));
  ("v_Vuna_dCompiler_dWasm_dRender_dimportOne", ("Vuna.Compiler.Wasm.Render.importOne", "Vuna/Compiler/Wasm/Render.vuna:257"));
  ("v_Vuna_dCompiler_dWasm_dRender_djoinWith", ("Vuna.Compiler.Wasm.Render.joinWith", "Vuna/Compiler/Wasm/Render.vuna:30"));
  ("v_Vuna_dCompiler_dWasm_dRender_dlineOf", ("Vuna.Compiler.Wasm.Render.lineOf", "Vuna/Compiler/Wasm/Render.vuna:24"));
  ("v_Vuna_dCompiler_dWasm_dRender_dmaxLine", ("Vuna.Compiler.Wasm.Render.maxLine", "Vuna/Compiler/Wasm/Render.vuna:18"));
  ("v_Vuna_dCompiler_dWasm_dRender_dmoduleLines", ("Vuna.Compiler.Wasm.Render.moduleLines", "Vuna/Compiler/Wasm/Render.vuna:349"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderArrayType", ("Vuna.Compiler.Wasm.Render.renderArrayType", "Vuna/Compiler/Wasm/Render.vuna:248"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderBlock", ("Vuna.Compiler.Wasm.Render.renderBlock", "Vuna/Compiler/Wasm/Render.vuna:168"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderData", ("Vuna.Compiler.Wasm.Render.renderData", "Vuna/Compiler/Wasm/Render.vuna:334"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderElem", ("Vuna.Compiler.Wasm.Render.renderElem", "Vuna/Compiler/Wasm/Render.vuna:326"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderExport", ("Vuna.Compiler.Wasm.Render.renderExport", "Vuna/Compiler/Wasm/Render.vuna:321"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderField", ("Vuna.Compiler.Wasm.Render.renderField", "Vuna/Compiler/Wasm/Render.vuna:189"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderFunc", ("Vuna.Compiler.Wasm.Render.renderFunc", "Vuna/Compiler/Wasm/Render.vuna:310"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderFuncType", ("Vuna.Compiler.Wasm.Render.renderFuncType", "Vuna/Compiler/Wasm/Render.vuna:238"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderGlobal", ("Vuna.Compiler.Wasm.Render.renderGlobal", "Vuna/Compiler/Wasm/Render.vuna:287"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderIf", ("Vuna.Compiler.Wasm.Render.renderIf", "Vuna/Compiler/Wasm/Render.vuna:158"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderImport", ("Vuna.Compiler.Wasm.Render.renderImport", "Vuna/Compiler/Wasm/Render.vuna:284"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderInstr", ("Vuna.Compiler.Wasm.Render.renderInstr", "Vuna/Compiler/Wasm/Render.vuna:151"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderInstrFlat", ("Vuna.Compiler.Wasm.Render.renderInstrFlat", "Vuna/Compiler/Wasm/Render.vuna:93"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderInstrs", ("Vuna.Compiler.Wasm.Render.renderInstrs", "Vuna/Compiler/Wasm/Render.vuna:148"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderLoop", ("Vuna.Compiler.Wasm.Render.renderLoop", "Vuna/Compiler/Wasm/Render.vuna:174"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderModule", ("Vuna.Compiler.Wasm.Render.renderModule", "Vuna/Compiler/Wasm/Render.vuna:366"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderParam", ("Vuna.Compiler.Wasm.Render.renderParam", "Vuna/Compiler/Wasm/Render.vuna:183"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderResult", ("Vuna.Compiler.Wasm.Render.renderResult", "Vuna/Compiler/Wasm/Render.vuna:186"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderStructType", ("Vuna.Compiler.Wasm.Render.renderStructType", "Vuna/Compiler/Wasm/Render.vuna:243"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderTag", ("Vuna.Compiler.Wasm.Render.renderTag", "Vuna/Compiler/Wasm/Render.vuna:277"));
  ("v_Vuna_dCompiler_dWasm_dRender_drenderType", ("Vuna.Compiler.Wasm.Render.renderType", "Vuna/Compiler/Wasm/Render.vuna:232"));
  ("v_Vuna_dCompiler_dWasm_dRender_dresultSuffix", ("Vuna.Compiler.Wasm.Render.resultSuffix", "Vuna/Compiler/Wasm/Render.vuna:89"));
  ("v_Vuna_dCompiler_dWasm_dRender_dsectionComment", ("Vuna.Compiler.Wasm.Render.sectionComment", "Vuna/Compiler/Wasm/Render.vuna:346"));
  ("v_Vuna_dCompiler_dWasm_dRender_dspaces", ("Vuna.Compiler.Wasm.Render.spaces", "Vuna/Compiler/Wasm/Render.vuna:21"));
  ("v_Vuna_dCompiler_dWasm_dRender_dstructTypeMulti", ("Vuna.Compiler.Wasm.Render.structTypeMulti", "Vuna/Compiler/Wasm/Render.vuna:222"));
  ("v_Vuna_dCompiler_dWasm_dRender_dstructTypeOne", ("Vuna.Compiler.Wasm.Render.structTypeOne", "Vuna/Compiler/Wasm/Render.vuna:216"));
  ("v_Vuna_dCompiler_dWasm_dRender_dwatEscapeChar", ("Vuna.Compiler.Wasm.Render.watEscapeChar", "Vuna/Compiler/Wasm/Render.vuna:68"));
  ("v_Vuna_dCompiler_dWasm_dRender_dwatString", ("Vuna.Compiler.Wasm.Render.watString", "Vuna/Compiler/Wasm/Render.vuna:74"));
  ("v_Vuna_dCompiler_dWasm_dRender_dwordsOf", ("Vuna.Compiler.Wasm.Render.wordsOf", "Vuna/Compiler/Wasm/Render.vuna:36"));
  ("v_Vuna_dCompiler_dWasm_dRender_dwordsOfGo", ("Vuna.Compiler.Wasm.Render.wordsOfGo", "Vuna/Compiler/Wasm/Render.vuna:39"));
  ("v_Vuna_dCompiler_dWasm_dRender_dwrapComment", ("Vuna.Compiler.Wasm.Render.wrapComment", "Vuna/Compiler/Wasm/Render.vuna:48"));
  ("v_Vuna_dCompiler_dWasm_dRender_dwrapWords", ("Vuna.Compiler.Wasm.Render.wrapWords", "Vuna/Compiler/Wasm/Render.vuna:51"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dbinBool", ("Vuna.Compiler.Wasm.Runtime.binBool", "Vuna/Compiler/Wasm/Runtime.vuna:125"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dbinInt", ("Vuna.Compiler.Wasm.Runtime.binInt", "Vuna/Compiler/Wasm/Runtime.vuna:111"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dboolValue", ("Vuna.Compiler.Wasm.Runtime.boolValue", "Vuna/Compiler/Wasm/Runtime.vuna:141"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dboxI64", ("Vuna.Compiler.Wasm.Runtime.boxI64", "Vuna/Compiler/Wasm/Runtime.vuna:196"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dboxInt", ("Vuna.Compiler.Wasm.Runtime.boxInt", "Vuna/Compiler/Wasm/Runtime.vuna:105"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dcat", ("Vuna.Compiler.Wasm.Runtime.cat", "Vuna/Compiler/Wasm/Runtime.vuna:69"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dcmpInt", ("Vuna.Compiler.Wasm.Runtime.cmpInt", "Vuna/Compiler/Wasm/Runtime.vuna:118"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_ddataSegmentName", ("Vuna.Compiler.Wasm.Runtime.dataSegmentName", "Vuna/Compiler/Wasm/Runtime.vuna:147"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_demptyStrInstrs", ("Vuna.Compiler.Wasm.Runtime.emptyStrInstrs", "Vuna/Compiler/Wasm/Runtime.vuna:193"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_derrnoEq", ("Vuna.Compiler.Wasm.Runtime.errnoEq", "Vuna/Compiler/Wasm/Runtime.vuna:244"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_descapePair", ("Vuna.Compiler.Wasm.Runtime.escapePair", "Vuna/Compiler/Wasm/Runtime.vuna:1160"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_descapeStepAll", ("Vuna.Compiler.Wasm.Runtime.escapeStepAll", "Vuna/Compiler/Wasm/Runtime.vuna:1168"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dfailWithConst", ("Vuna.Compiler.Wasm.Runtime.failWithConst", "Vuna/Compiler/Wasm/Runtime.vuna:1218"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dlocalP", ("Vuna.Compiler.Wasm.Runtime.localP", "Vuna/Compiler/Wasm/Runtime.vuna:72"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dmaxInt63", ("Vuna.Compiler.Wasm.Runtime.maxInt63", "Vuna/Compiler/Wasm/Runtime.vuna:1321"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dmkString", ("Vuna.Compiler.Wasm.Runtime.mkString", "Vuna/Compiler/Wasm/Runtime.vuna:150"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dreadRights", ("Vuna.Compiler.Wasm.Runtime.readRights", "Vuna/Compiler/Wasm/Runtime.vuna:187"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtApply", ("Vuna.Compiler.Wasm.Runtime.rtApply", "Vuna/Compiler/Wasm/Runtime.vuna:78"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtArrayGet", ("Vuna.Compiler.Wasm.Runtime.rtArrayGet", "Vuna/Compiler/Wasm/Runtime.vuna:1061"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtArrayLength", ("Vuna.Compiler.Wasm.Runtime.rtArrayLength", "Vuna/Compiler/Wasm/Runtime.vuna:1056"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtArrayMake", ("Vuna.Compiler.Wasm.Runtime.rtArrayMake", "Vuna/Compiler/Wasm/Runtime.vuna:1082"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtArrayOob", ("Vuna.Compiler.Wasm.Runtime.rtArrayOob", "Vuna/Compiler/Wasm/Runtime.vuna:980"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtArraySet", ("Vuna.Compiler.Wasm.Runtime.rtArraySet", "Vuna/Compiler/Wasm/Runtime.vuna:1071"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtAssert", ("Vuna.Compiler.Wasm.Runtime.rtAssert", "Vuna/Compiler/Wasm/Runtime.vuna:1231"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtBitNot", ("Vuna.Compiler.Wasm.Runtime.rtBitNot", "Vuna/Compiler/Wasm/Runtime.vuna:1643"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtBitShl", ("Vuna.Compiler.Wasm.Runtime.rtBitShl", "Vuna/Compiler/Wasm/Runtime.vuna:1661"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtBitShr", ("Vuna.Compiler.Wasm.Runtime.rtBitShr", "Vuna/Compiler/Wasm/Runtime.vuna:1671"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtBoxZero", ("Vuna.Compiler.Wasm.Runtime.rtBoxZero", "Vuna/Compiler/Wasm/Runtime.vuna:1515"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtBoxZero2", ("Vuna.Compiler.Wasm.Runtime.rtBoxZero2", "Vuna/Compiler/Wasm/Runtime.vuna:1583"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtCleanupPop", ("Vuna.Compiler.Wasm.Runtime.rtCleanupPop", "Vuna/Compiler/Wasm/Runtime.vuna:1614"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtCleanupPush", ("Vuna.Compiler.Wasm.Runtime.rtCleanupPush", "Vuna/Compiler/Wasm/Runtime.vuna:1600"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtCmpF64", ("Vuna.Compiler.Wasm.Runtime.rtCmpF64", "Vuna/Compiler/Wasm/Runtime.vuna:1560"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtCmpI32", ("Vuna.Compiler.Wasm.Runtime.rtCmpI32", "Vuna/Compiler/Wasm/Runtime.vuna:1530"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtCmpI64", ("Vuna.Compiler.Wasm.Runtime.rtCmpI64", "Vuna/Compiler/Wasm/Runtime.vuna:1545"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtConstFalse1", ("Vuna.Compiler.Wasm.Runtime.rtConstFalse1", "Vuna/Compiler/Wasm/Runtime.vuna:1522"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtDiv", ("Vuna.Compiler.Wasm.Runtime.rtDiv", "Vuna/Compiler/Wasm/Runtime.vuna:1221"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtEffExit", ("Vuna.Compiler.Wasm.Runtime.rtEffExit", "Vuna/Compiler/Wasm/Runtime.vuna:1012"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtEffHandle", ("Vuna.Compiler.Wasm.Runtime.rtEffHandle", "Vuna/Compiler/Wasm/Runtime.vuna:1805"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtEffNewRef", ("Vuna.Compiler.Wasm.Runtime.rtEffNewRef", "Vuna/Compiler/Wasm/Runtime.vuna:991"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtEffPerform", ("Vuna.Compiler.Wasm.Runtime.rtEffPerform", "Vuna/Compiler/Wasm/Runtime.vuna:1686"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtEffPrint", ("Vuna.Compiler.Wasm.Runtime.rtEffPrint", "Vuna/Compiler/Wasm/Runtime.vuna:1007"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtEffReadRef", ("Vuna.Compiler.Wasm.Runtime.rtEffReadRef", "Vuna/Compiler/Wasm/Runtime.vuna:996"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtEffResumeClo", ("Vuna.Compiler.Wasm.Runtime.rtEffResumeClo", "Vuna/Compiler/Wasm/Runtime.vuna:1697"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtEffThunk", ("Vuna.Compiler.Wasm.Runtime.rtEffThunk", "Vuna/Compiler/Wasm/Runtime.vuna:1692"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtEffWriteRef", ("Vuna.Compiler.Wasm.Runtime.rtEffWriteRef", "Vuna/Compiler/Wasm/Runtime.vuna:1001"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtEmptyStr", ("Vuna.Compiler.Wasm.Runtime.rtEmptyStr", "Vuna/Compiler/Wasm/Runtime.vuna:410"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtEqStr", ("Vuna.Compiler.Wasm.Runtime.rtEqStr", "Vuna/Compiler/Wasm/Runtime.vuna:1475"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtErase", ("Vuna.Compiler.Wasm.Runtime.rtErase", "Vuna/Compiler/Wasm/Runtime.vuna:1257"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtErrno", ("Vuna.Compiler.Wasm.Runtime.rtErrno", "Vuna/Compiler/Wasm/Runtime.vuna:247"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtExecPath", ("Vuna.Compiler.Wasm.Runtime.rtExecPath", "Vuna/Compiler/Wasm/Runtime.vuna:907"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtFailStr", ("Vuna.Compiler.Wasm.Runtime.rtFailStr", "Vuna/Compiler/Wasm/Runtime.vuna:969"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtFdReadAll", ("Vuna.Compiler.Wasm.Runtime.rtFdReadAll", "Vuna/Compiler/Wasm/Runtime.vuna:386"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtFileExists", ("Vuna.Compiler.Wasm.Runtime.rtFileExists", "Vuna/Compiler/Wasm/Runtime.vuna:548"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtFileMtime", ("Vuna.Compiler.Wasm.Runtime.rtFileMtime", "Vuna/Compiler/Wasm/Runtime.vuna:565"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtFileSize", ("Vuna.Compiler.Wasm.Runtime.rtFileSize", "Vuna/Compiler/Wasm/Runtime.vuna:589"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtFloatAbs", ("Vuna.Compiler.Wasm.Runtime.rtFloatAbs", "Vuna/Compiler/Wasm/Runtime.vuna:1041"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtFloatBin", ("Vuna.Compiler.Wasm.Runtime.rtFloatBin", "Vuna/Compiler/Wasm/Runtime.vuna:1031"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtFloatCmp", ("Vuna.Compiler.Wasm.Runtime.rtFloatCmp", "Vuna/Compiler/Wasm/Runtime.vuna:1036"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtFloatFromInt", ("Vuna.Compiler.Wasm.Runtime.rtFloatFromInt", "Vuna/Compiler/Wasm/Runtime.vuna:1021"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtFloatSqrt", ("Vuna.Compiler.Wasm.Runtime.rtFloatSqrt", "Vuna/Compiler/Wasm/Runtime.vuna:1046"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtFunc", ("Vuna.Compiler.Wasm.Runtime.rtFunc", "Vuna/Compiler/Wasm/Runtime.vuna:75"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtFunctions", ("Vuna.Compiler.Wasm.Runtime.rtFunctions", "Vuna/Compiler/Wasm/Runtime.vuna:1834"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtGenericCmp", ("Vuna.Compiler.Wasm.Runtime.rtGenericCmp", "Vuna/Compiler/Wasm/Runtime.vuna:1576"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtGetCwd", ("Vuna.Compiler.Wasm.Runtime.rtGetCwd", "Vuna/Compiler/Wasm/Runtime.vuna:898"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtGetEnv", ("Vuna.Compiler.Wasm.Runtime.rtGetEnv", "Vuna/Compiler/Wasm/Runtime.vuna:832"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtHandleLoop", ("Vuna.Compiler.Wasm.Runtime.rtHandleLoop", "Vuna/Compiler/Wasm/Runtime.vuna:1723"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtHostStatus", ("Vuna.Compiler.Wasm.Runtime.rtHostStatus", "Vuna/Compiler/Wasm/Runtime.vuna:826"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtHostTrap", ("Vuna.Compiler.Wasm.Runtime.rtHostTrap", "Vuna/Compiler/Wasm/Runtime.vuna:1590"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtImplOf", ("Vuna.Compiler.Wasm.Runtime.rtImplOf", "Vuna/Compiler/Wasm/Runtime.vuna:1966"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtIntFromFloat", ("Vuna.Compiler.Wasm.Runtime.rtIntFromFloat", "Vuna/Compiler/Wasm/Runtime.vuna:1026"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtMemToStr", ("Vuna.Compiler.Wasm.Runtime.rtMemToStr", "Vuna/Compiler/Wasm/Runtime.vuna:227"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtNatAdd", ("Vuna.Compiler.Wasm.Runtime.rtNatAdd", "Vuna/Compiler/Wasm/Runtime.vuna:1324"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtNatDiv", ("Vuna.Compiler.Wasm.Runtime.rtNatDiv", "Vuna/Compiler/Wasm/Runtime.vuna:1362"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtNatFromInt", ("Vuna.Compiler.Wasm.Runtime.rtNatFromInt", "Vuna/Compiler/Wasm/Runtime.vuna:1380"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtNatMul", ("Vuna.Compiler.Wasm.Runtime.rtNatMul", "Vuna/Compiler/Wasm/Runtime.vuna:1344"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtNatSub", ("Vuna.Compiler.Wasm.Runtime.rtNatSub", "Vuna/Compiler/Wasm/Runtime.vuna:1334"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtNatSucc", ("Vuna.Compiler.Wasm.Runtime.rtNatSucc", "Vuna/Compiler/Wasm/Runtime.vuna:1308"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtNatToInt", ("Vuna.Compiler.Wasm.Runtime.rtNatToInt", "Vuna/Compiler/Wasm/Runtime.vuna:1373"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtNeqStr", ("Vuna.Compiler.Wasm.Runtime.rtNeqStr", "Vuna/Compiler/Wasm/Runtime.vuna:1499"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtObsSpan", ("Vuna.Compiler.Wasm.Runtime.rtObsSpan", "Vuna/Compiler/Wasm/Runtime.vuna:1628"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtObsSpanLab", ("Vuna.Compiler.Wasm.Runtime.rtObsSpanLab", "Vuna/Compiler/Wasm/Runtime.vuna:1636"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtPathCopyRel", ("Vuna.Compiler.Wasm.Runtime.rtPathCopyRel", "Vuna/Compiler/Wasm/Runtime.vuna:201"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtPathLen", ("Vuna.Compiler.Wasm.Runtime.rtPathLen", "Vuna/Compiler/Wasm/Runtime.vuna:334"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtPathOpen", ("Vuna.Compiler.Wasm.Runtime.rtPathOpen", "Vuna/Compiler/Wasm/Runtime.vuna:354"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtPrimFail", ("Vuna.Compiler.Wasm.Runtime.rtPrimFail", "Vuna/Compiler/Wasm/Runtime.vuna:1241"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtPrintln", ("Vuna.Compiler.Wasm.Runtime.rtPrintln", "Vuna/Compiler/Wasm/Runtime.vuna:960"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtResumeTwice", ("Vuna.Compiler.Wasm.Runtime.rtResumeTwice", "Vuna/Compiler/Wasm/Runtime.vuna:1802"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtShowBool", ("Vuna.Compiler.Wasm.Runtime.rtShowBool", "Vuna/Compiler/Wasm/Runtime.vuna:1146"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtShowInt", ("Vuna.Compiler.Wasm.Runtime.rtShowInt", "Vuna/Compiler/Wasm/Runtime.vuna:1143"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtShowStr", ("Vuna.Compiler.Wasm.Runtime.rtShowStr", "Vuna/Compiler/Wasm/Runtime.vuna:1175"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtSleep", ("Vuna.Compiler.Wasm.Runtime.rtSleep", "Vuna/Compiler/Wasm/Runtime.vuna:932"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtStatErr", ("Vuna.Compiler.Wasm.Runtime.rtStatErr", "Vuna/Compiler/Wasm/Runtime.vuna:414"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtStrAt", ("Vuna.Compiler.Wasm.Runtime.rtStrAt", "Vuna/Compiler/Wasm/Runtime.vuna:1402"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtStrConcat", ("Vuna.Compiler.Wasm.Runtime.rtStrConcat", "Vuna/Compiler/Wasm/Runtime.vuna:1263"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtStrFromInt", ("Vuna.Compiler.Wasm.Runtime.rtStrFromInt", "Vuna/Compiler/Wasm/Runtime.vuna:1092"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtStrHash", ("Vuna.Compiler.Wasm.Runtime.rtStrHash", "Vuna/Compiler/Wasm/Runtime.vuna:1461"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtStrLength", ("Vuna.Compiler.Wasm.Runtime.rtStrLength", "Vuna/Compiler/Wasm/Runtime.vuna:1393"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtSubstring", ("Vuna.Compiler.Wasm.Runtime.rtSubstring", "Vuna/Compiler/Wasm/Runtime.vuna:1430"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtTimeUs", ("Vuna.Compiler.Wasm.Runtime.rtTimeUs", "Vuna/Compiler/Wasm/Runtime.vuna:910"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtTodo", ("Vuna.Compiler.Wasm.Runtime.rtTodo", "Vuna/Compiler/Wasm/Runtime.vuna:1248"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtTryIsDirectory", ("Vuna.Compiler.Wasm.Runtime.rtTryIsDirectory", "Vuna/Compiler/Wasm/Runtime.vuna:524"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtTryMakeDir", ("Vuna.Compiler.Wasm.Runtime.rtTryMakeDir", "Vuna/Compiler/Wasm/Runtime.vuna:611"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtTryMakeDirExclusive", ("Vuna.Compiler.Wasm.Runtime.rtTryMakeDirExclusive", "Vuna/Compiler/Wasm/Runtime.vuna:644"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtTryReadFile", ("Vuna.Compiler.Wasm.Runtime.rtTryReadFile", "Vuna/Compiler/Wasm/Runtime.vuna:433"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtTryRemoveFile", ("Vuna.Compiler.Wasm.Runtime.rtTryRemoveFile", "Vuna/Compiler/Wasm/Runtime.vuna:678"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtTryRemoveTree", ("Vuna.Compiler.Wasm.Runtime.rtTryRemoveTree", "Vuna/Compiler/Wasm/Runtime.vuna:711"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtTryRename", ("Vuna.Compiler.Wasm.Runtime.rtTryRename", "Vuna/Compiler/Wasm/Runtime.vuna:757"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtTrySymlink", ("Vuna.Compiler.Wasm.Runtime.rtTrySymlink", "Vuna/Compiler/Wasm/Runtime.vuna:792"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtTryWriteFile", ("Vuna.Compiler.Wasm.Runtime.rtTryWriteFile", "Vuna/Compiler/Wasm/Runtime.vuna:472"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtTryWriteFileAtomic", ("Vuna.Compiler.Wasm.Runtime.rtTryWriteFileAtomic", "Vuna/Compiler/Wasm/Runtime.vuna:507"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtWrite", ("Vuna.Compiler.Wasm.Runtime.rtWrite", "Vuna/Compiler/Wasm/Runtime.vuna:323"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_drtWriteChunked", ("Vuna.Compiler.Wasm.Runtime.rtWriteChunked", "Vuna/Compiler/Wasm/Runtime.vuna:257"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dshiftCountOk", ("Vuna.Compiler.Wasm.Runtime.shiftCountOk", "Vuna/Compiler/Wasm/Runtime.vuna:1650"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dunboxInt", ("Vuna.Compiler.Wasm.Runtime.unboxInt", "Vuna/Compiler/Wasm/Runtime.vuna:102"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dwasiAux", ("Vuna.Compiler.Wasm.Runtime.wasiAux", "Vuna/Compiler/Wasm/Runtime.vuna:183"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dwasiDir", ("Vuna.Compiler.Wasm.Runtime.wasiDir", "Vuna/Compiler/Wasm/Runtime.vuna:177"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dwasiDirCap", ("Vuna.Compiler.Wasm.Runtime.wasiDirCap", "Vuna/Compiler/Wasm/Runtime.vuna:180"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dwasiIo", ("Vuna.Compiler.Wasm.Runtime.wasiIo", "Vuna/Compiler/Wasm/Runtime.vuna:168"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dwasiIoCap", ("Vuna.Compiler.Wasm.Runtime.wasiIoCap", "Vuna/Compiler/Wasm/Runtime.vuna:171"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dwasiIov", ("Vuna.Compiler.Wasm.Runtime.wasiIov", "Vuna/Compiler/Wasm/Runtime.vuna:156"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dwasiN", ("Vuna.Compiler.Wasm.Runtime.wasiN", "Vuna/Compiler/Wasm/Runtime.vuna:159"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dwasiPath1", ("Vuna.Compiler.Wasm.Runtime.wasiPath1", "Vuna/Compiler/Wasm/Runtime.vuna:162"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dwasiPath2", ("Vuna.Compiler.Wasm.Runtime.wasiPath2", "Vuna/Compiler/Wasm/Runtime.vuna:165"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dwasiStat", ("Vuna.Compiler.Wasm.Runtime.wasiStat", "Vuna/Compiler/Wasm/Runtime.vuna:174"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dwrap63", ("Vuna.Compiler.Wasm.Runtime.wrap63", "Vuna/Compiler/Wasm/Runtime.vuna:108"));
  ("v_Vuna_dCompiler_dWasm_dRuntime_dwriteRights", ("Vuna.Compiler.Wasm.Runtime.writeRights", "Vuna/Compiler/Wasm/Runtime.vuna:190"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dctorEntriesOf", ("Vuna.Compiler.Wasm.Types.ctorEntriesOf", "Vuna/Compiler/Wasm/Types.vuna:79"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dctorEntriesOfGo", ("Vuna.Compiler.Wasm.Types.ctorEntriesOfGo", "Vuna/Compiler/Wasm/Types.vuna:82"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dfamOfDecl", ("Vuna.Compiler.Wasm.Types.famOfDecl", "Vuna/Compiler/Wasm/Types.vuna:94"));
  ("v_Vuna_dCompiler_dWasm_dTypes_disWatNameChar", ("Vuna.Compiler.Wasm.Types.isWatNameChar", "Vuna/Compiler/Wasm/Types.vuna:50"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dmaxCtorFields", ("Vuna.Compiler.Wasm.Types.maxCtorFields", "Vuna/Compiler/Wasm/Types.vuna:87"));
  ("v_Vuna_dCompiler_dWasm_dTypes_drepeatField", ("Vuna.Compiler.Wasm.Types.repeatField", "Vuna/Compiler/Wasm/Types.vuna:145"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorFieldCountOf", ("Vuna.Compiler.Wasm.Types.wasmCtorFieldCountOf", "Vuna/Compiler/Wasm/Types.vuna:118"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorFieldGo", ("Vuna.Compiler.Wasm.Types.wasmCtorFieldGo", "Vuna/Compiler/Wasm/Types.vuna:121"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorTagGo", ("Vuna.Compiler.Wasm.Types.wasmCtorTagGo", "Vuna/Compiler/Wasm/Types.vuna:113"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwasmCtorTagOf", ("Vuna.Compiler.Wasm.Types.wasmCtorTagOf", "Vuna/Compiler/Wasm/Types.vuna:110"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwasmFamFields", ("Vuna.Compiler.Wasm.Types.wasmFamFields", "Vuna/Compiler/Wasm/Types.vuna:139"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwasmFamLookup", ("Vuna.Compiler.Wasm.Types.wasmFamLookup", "Vuna/Compiler/Wasm/Types.vuna:106"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwasmFamType", ("Vuna.Compiler.Wasm.Types.wasmFamType", "Vuna/Compiler/Wasm/Types.vuna:149"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwasmFamsOf", ("Vuna.Compiler.Wasm.Types.wasmFamsOf", "Vuna/Compiler/Wasm/Types.vuna:103"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwasmIsRecordFam", ("Vuna.Compiler.Wasm.Types.wasmIsRecordFam", "Vuna/Compiler/Wasm/Types.vuna:134"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwasmListFamFromFams", ("Vuna.Compiler.Wasm.Types.wasmListFamFromFams", "Vuna/Compiler/Wasm/Types.vuna:163"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwasmRecordFieldGo", ("Vuna.Compiler.Wasm.Types.wasmRecordFieldGo", "Vuna/Compiler/Wasm/Types.vuna:129"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwasmRecordFieldIndex", ("Vuna.Compiler.Wasm.Types.wasmRecordFieldIndex", "Vuna/Compiler/Wasm/Types.vuna:126"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwatDataNameOf", ("Vuna.Compiler.Wasm.Types.watDataNameOf", "Vuna/Compiler/Wasm/Types.vuna:73"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwatFamName", ("Vuna.Compiler.Wasm.Types.watFamName", "Vuna/Compiler/Wasm/Types.vuna:61"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwatFuncNameOf", ("Vuna.Compiler.Wasm.Types.watFuncNameOf", "Vuna/Compiler/Wasm/Types.vuna:65"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwatGlobalNameOf", ("Vuna.Compiler.Wasm.Types.watGlobalNameOf", "Vuna/Compiler/Wasm/Types.vuna:69"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwatName", ("Vuna.Compiler.Wasm.Types.watName", "Vuna/Compiler/Wasm/Types.vuna:57"));
  ("v_Vuna_dCompiler_dWasm_dTypes_dwatNameChar", ("Vuna.Compiler.Wasm.Types.watNameChar", "Vuna/Compiler/Wasm/Types.vuna:53"));
  ("v_main", ("main", "app/Main.vuna:36"));
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
  let msg = match e with Effect.Unhandled (Perform (key, name, _)) -> Printf.sprintf "unhandled effect %s (instance %s)" key name | Failure m -> m | _ -> Printexc.to_string e in
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
    (* `mode` 为空串时按 `VUNA_OBS_SAMPLE`（env）取缺省（`cpu`）；这样 `vuna obs run
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
