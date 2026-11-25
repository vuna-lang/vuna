let () =
  let c = Gc.get () in
  Gc.set { c with minor_heap_size = 16 * 1024 * 1024; space_overhead = 200 }
let () =
  if (try Sys.getenv "VN_PERF_STATS" with Not_found -> "") <> "" then
    at_exit (fun () ->
      let s = Gc.quick_stat () in
      Printf.eprintf "VN_PERF minor_words=%.0f major_words=%.0f minor_collections=%d major_collections=%d top_heap_words=%d allocated_words=%.0f\n"
        s.Gc.minor_words s.Gc.major_words s.Gc.minor_collections s.Gc.major_collections s.Gc.top_heap_words
        (Gc.allocated_bytes () /. (float_of_int Sys.word_size /. 8.)))
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
let dtp_readFileRange path offset length =
  try
    if offset < 0 || length <= 0 then ""
    else
      let ch = open_in_bin path in
      Fun.protect ~finally:(fun () -> close_in_noerr ch)
        (fun () ->
           let size = in_channel_length ch in
           if offset >= size then ""
           else (seek_in ch offset; really_input_string ch (min length (size - offset))))
  with Sys_error msg -> failwith ("readFileRange: " ^ msg)
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
let dtp_tryReadFileRange path offset length =
  (try
     dtp_hostReset ();
     if offset < 0 || length <= 0 then ""
     else
       let fd = Unix.openfile path [Unix.O_RDONLY] 0 in
       Fun.protect ~finally:(fun () -> (try Unix.close fd with _ -> ()))
         (fun () ->
            let size = (Unix.stat path).Unix.st_size in
            if offset >= size then ""
            else
              let want = min length (size - offset) in
              ignore (Unix.lseek fd offset Unix.SEEK_SET);
              let b = Bytes.create want in
              let rec go pos =
                if pos < want then
                  let k = Unix.read fd b pos (want - pos) in
                  if k > 0 then go (pos + k) in
              go 0; Bytes.sub_string b 0 want)
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
let dtp_dynNew cap =
  ref (Array.make (if cap < 1 then 1 else cap) (Obj.repr 0), 0)
let dtp_dynLen (r : (Obj.t array * int) ref) = snd !r
let dtp_dynGet (r : (Obj.t array * int) ref) i =
  let (a, n) = !r in
  if i < 0 || i >= n then invalid_arg "index out of bounds" else Obj.obj a.(i)
let dtp_dynSet (r : (Obj.t array * int) ref) i v =
  let (a, n) = !r in
  if i < 0 || i >= n then invalid_arg "index out of bounds"
  else begin a.(i) <- Obj.repr v; 0 end
let dtp_dynPush (r : (Obj.t array * int) ref) v =
  let (a, n) = !r in
  if n < Array.length a then begin
    a.(n) <- Obj.repr v;
    r := (a, n + 1)
  end else begin
    let cap = Array.length a in
    let ncap = if cap * 2 < 8 then 8 else cap * 2 in
    let b = Array.make ncap (Obj.repr 0) in
    Array.blit a 0 b 0 n;
    b.(n) <- Obj.repr v;
    r := (b, n + 1)
  end;
  0
let dtp_dynClear (r : (Obj.t array * int) ref) =
  let (a, _) = !r in r := (a, 0); 0
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
(* 监听句柄绑定的 unix socket 路径与当时的 inode：关闭句柄时只删仍然指向自己的那份文件。
   没有这条记录（tcp 句柄 / 已被替换的路径）就不删，免得删掉同一路径上后继进程的 socket。 *)
let dtp_net_owned : (int, string * int) Hashtbl.t = Hashtbl.create 4
let dtp_net_next = ref 1
let dtp_net_put (fd : Unix.file_descr) : int =
  let k = !dtp_net_next in
  dtp_net_next := k + 1;
  Hashtbl.replace dtp_net_tbl k fd;
  k
let dtp_net_put_owned (fd : Unix.file_descr) (path : string) : int =
  let h = dtp_net_put fd in
  (try Hashtbl.replace dtp_net_owned h (path, (Unix.stat path).Unix.st_ino) with _ -> ());
  h
let dtp_net_get (h : int) : Unix.file_descr =
  match Hashtbl.find_opt dtp_net_tbl h with
  | Some fd -> fd
  | None -> dtp_hostSetStatus 8; failwith "net: invalid handle"
let dtp_net_unlink_owned (h : int) =
  match Hashtbl.find_opt dtp_net_owned h with
  | Some (path, ino) ->
    (try if (Unix.stat path).Unix.st_ino = ino then Sys.remove path with _ -> ())
  | None -> ()
let dtp_net_drop (h : int) =
  (try Hashtbl.remove dtp_net_tbl h with _ -> ());
  (try Hashtbl.remove dtp_net_owned h with _ -> ())
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
    (try Unix.bind s (Unix.ADDR_UNIX path); Unix.listen s 8; dtp_net_put_owned s path
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
  dtp_net_unlink_owned h;
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
  ("B_dContainer_dHashMap.v__ubucketInsert", ("Base.Container.HashMap._bucketInsert", "Base/Container/HashMap.vuna:35"));
  ("B_dContainer_dHashMap.v__ubucketOf", ("Base.Container.HashMap._bucketOf", "Base/Container/HashMap.vuna:28"));
  ("B_dContainer_dHashMap.v__ubucketRemove", ("Base.Container.HashMap._bucketRemove", "Base/Container/HashMap.vuna:45"));
  ("B_dContainer_dHashMap.v__ulookupAssoc", ("Base.Container.HashMap._lookupAssoc", "Base/Container/HashMap.vuna:55"));
  ("B_dContainer_dHashMap.v_fromList", ("Base.Container.HashMap.fromList", "Base/Container/HashMap.vuna:124"));
  ("B_dContainer_dHashMap.v_insert", ("Base.Container.HashMap.insert", "Base/Container/HashMap.vuna:61"));
  ("B_dContainer_dHashMap.v_insertAll", ("Base.Container.HashMap.insertAll", "Base/Container/HashMap.vuna:119"));
  ("B_dContainer_dHashMap.v_lookup", ("Base.Container.HashMap.lookup", "Base/Container/HashMap.vuna:99"));
  ("B_dContainer_dHashMap.v_member", ("Base.Container.HashMap.member", "Base/Container/HashMap.vuna:112"));
  ("B_dContainer_dHashMap.v_ofNames", ("Base.Container.HashMap.ofNames", "Base/Container/HashMap.vuna:129"));
  ("B_dContainer_dHashMap.v_remove", ("Base.Container.HashMap.remove", "Base/Container/HashMap.vuna:82"));
  ("B_dContainer_dHashMap.v_size", ("Base.Container.HashMap.size", "Base/Container/HashMap.vuna:140"));
  ("B_dContainer_dHashMap.v_toList", ("Base.Container.HashMap.toList", "Base/Container/HashMap.vuna:133"));
  ("B_dContainer_dQueue.v_appendLists", ("Base.Container.Queue.appendLists", "Base/Container/Queue.vuna:33"));
  ("B_dContainer_dQueue.v_empty", ("Base.Container.Queue.empty", "Base/Container/Queue.vuna:46"));
  ("B_dContainer_dQueue.v_fromList", ("Base.Container.Queue.fromList", "Base/Container/Queue.vuna:83"));
  ("B_dContainer_dQueue.v_isEmpty", ("Base.Container.Queue.isEmpty", "Base/Container/Queue.vuna:75"));
  ("B_dContainer_dQueue.v_lenInt", ("Base.Container.Queue.lenInt", "Base/Container/Queue.vuna:37"));
  ("B_dContainer_dQueue.v_lenIntGo", ("Base.Container.Queue.lenIntGo", "Base/Container/Queue.vuna:41"));
  ("B_dContainer_dQueue.v_peek", ("Base.Container.Queue.peek", "Base/Container/Queue.vuna:67"));
  ("B_dContainer_dQueue.v_pop", ("Base.Container.Queue.pop", "Base/Container/Queue.vuna:59"));
  ("B_dContainer_dQueue.v_push", ("Base.Container.Queue.push", "Base/Container/Queue.vuna:50"));
  ("B_dContainer_dQueue.v_pushAll", ("Base.Container.Queue.pushAll", "Base/Container/Queue.vuna:54"));
  ("B_dContainer_dQueue.v_revOnto", ("Base.Container.Queue.revOnto", "Base/Container/Queue.vuna:28"));
  ("B_dContainer_dQueue.v_size", ("Base.Container.Queue.size", "Base/Container/Queue.vuna:79"));
  ("B_dContainer_dQueue.v_toList", ("Base.Container.Queue.toList", "Base/Container/Queue.vuna:87"));
  ("B_dData_dBase64.v_at", ("Base.Data.Base64.at", "Base/Data/Base64.vuna:60"));
  ("B_dData_dBase64.v_base64Decode", ("Base.Data.Base64.base64Decode", "Base/Data/Base64.vuna:26"));
  ("B_dData_dBase64.v_base64Encode", ("Base.Data.Base64.base64Encode", "Base/Data/Base64.vuna:18"));
  ("B_dData_dBase64.v_base64EncodeString", ("Base.Data.Base64.base64EncodeString", "Base/Data/Base64.vuna:22"));
  ("B_dData_dBase64.v_decodeDigit", ("Base.Data.Base64.decodeDigit", "Base/Data/Base64.vuna:92"));
  ("B_dData_dBase64.v_decodeGroup", ("Base.Data.Base64.decodeGroup", "Base/Data/Base64.vuna:107"));
  ("B_dData_dBase64.v_encodeDigit", ("Base.Data.Base64.encodeDigit", "Base/Data/Base64.vuna:83"));
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
  ("B_dData_dFin.v_finFromInt", ("Base.Data.Fin.finFromInt", "Base/Data/Fin.vuna:41"));
  ("B_dData_dFin.v_finFromNat", ("Base.Data.Fin.finFromNat", "Base/Data/Fin.vuna:35"));
  ("B_dData_dFin.v_finLast", ("Base.Data.Fin.finLast", "Base/Data/Fin.vuna:30"));
  ("B_dData_dFin.v_finToNat", ("Base.Data.Fin.finToNat", "Base/Data/Fin.vuna:20"));
  ("B_dData_dFin.v_finWeaken", ("Base.Data.Fin.finWeaken", "Base/Data/Fin.vuna:25"));
  ("B_dData_dFloat.v__uintegralLimit", ("Base.Data.Float._integralLimit", "Base/Data/Float.vuna:116"));
  ("B_dData_dFloat.v__ukeepZeroSign", ("Base.Data.Float._keepZeroSign", "Base/Data/Float.vuna:124"));
  ("B_dData_dFloat.v__unegZero", ("Base.Data.Float._negZero", "Base/Data/Float.vuna:120"));
  ("B_dData_dFloat.v_abs", ("Base.Data.Float.abs", "Base/Data/Float.vuna:52"));
  ("B_dData_dFloat.v_carryRev", ("Base.Data.Float.carryRev", "Base/Data/Float.vuna:205"));
  ("B_dData_dFloat.v_ceil", ("Base.Data.Float.ceil", "Base/Data/Float.vuna:147"));
  ("B_dData_dFloat.v_ceilToInt", ("Base.Data.Float.ceilToInt", "Base/Data/Float.vuna:176"));
  ("B_dData_dFloat.v_digStep", ("Base.Data.Float.digStep", "Base/Data/Float.vuna:196"));
  ("B_dData_dFloat.v_digitsText", ("Base.Data.Float.digitsText", "Base/Data/Float.vuna:233"));
  ("B_dData_dFloat.v_dsLen", ("Base.Data.Float.dsLen", "Base/Data/Float.vuna:228"));
  ("B_dData_dFloat.v_expForm", ("Base.Data.Float.expForm", "Base/Data/Float.vuna:249"));
  ("B_dData_dFloat.v_expSuffix", ("Base.Data.Float.expSuffix", "Base/Data/Float.vuna:241"));
  ("B_dData_dFloat.v_fixedForm", ("Base.Data.Float.fixedForm", "Base/Data/Float.vuna:257"));
  ("B_dData_dFloat.v_floatRender", ("Base.Data.Float.floatRender", "Base/Data/Float.vuna:268"));
  ("B_dData_dFloat.v_floatToIntMaybe", ("Base.Data.Float.floatToIntMaybe", "Base/Data/Float.vuna:78"));
  ("B_dData_dFloat.v_floatToIntSat", ("Base.Data.Float.floatToIntSat", "Base/Data/Float.vuna:69"));
  ("B_dData_dFloat.v_floatToIntTrunc", ("Base.Data.Float.floatToIntTrunc", "Base/Data/Float.vuna:65"));
  ("B_dData_dFloat.v_floatToNat", ("Base.Data.Float.floatToNat", "Base/Data/Float.vuna:87"));
  ("B_dData_dFloat.v_floatToNatMaybe", ("Base.Data.Float.floatToNatMaybe", "Base/Data/Float.vuna:91"));
  ("B_dData_dFloat.v_floor", ("Base.Data.Float.floor", "Base/Data/Float.vuna:135"));
  ("B_dData_dFloat.v_floorToInt", ("Base.Data.Float.floorToInt", "Base/Data/Float.vuna:172"));
  ("B_dData_dFloat.v_fromFloat", ("Base.Data.Float.fromFloat", "Base/Data/Float.vuna:20"));
  ("B_dData_dFloat.v_intToFloat", ("Base.Data.Float.intToFloat", "Base/Data/Float.vuna:60"));
  ("B_dData_dFloat.v_isFinite", ("Base.Data.Float.isFinite", "Base/Data/Float.vuna:109"));
  ("B_dData_dFloat.v_isInfinite", ("Base.Data.Float.isInfinite", "Base/Data/Float.vuna:105"));
  ("B_dData_dFloat.v_isNaN", ("Base.Data.Float.isNaN", "Base/Data/Float.vuna:101"));
  ("B_dData_dFloat.v_normStep", ("Base.Data.Float.normStep", "Base/Data/Float.vuna:188"));
  ("B_dData_dFloat.v_round", ("Base.Data.Float.round", "Base/Data/Float.vuna:159"));
  ("B_dData_dFloat.v_roundToInt", ("Base.Data.Float.roundToInt", "Base/Data/Float.vuna:180"));
  ("B_dData_dFloat.v_sqrt", ("Base.Data.Float.sqrt", "Base/Data/Float.vuna:56"));
  ("B_dData_dFloat.v_trimZeros", ("Base.Data.Float.trimZeros", "Base/Data/Float.vuna:221"));
  ("B_dData_dFloat.v_trimZerosRev", ("Base.Data.Float.trimZerosRev", "Base/Data/Float.vuna:216"));
  ("B_dData_dFloat.v_trunc", ("Base.Data.Float.trunc", "Base/Data/Float.vuna:128"));
  ("B_dData_dFloat.v_zerosText", ("Base.Data.Float.zerosText", "Base/Data/Float.vuna:237"));
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
  ("B_dData_dLog.v_logAt", ("Base.Data.Log.logAt", "Base/Data/Log.vuna:23"));
  ("B_dData_dLog.v_logDebug", ("Base.Data.Log.logDebug", "Base/Data/Log.vuna:39"));
  ("B_dData_dLog.v_logError", ("Base.Data.Log.logError", "Base/Data/Log.vuna:27"));
  ("B_dData_dLog.v_logInfo", ("Base.Data.Log.logInfo", "Base/Data/Log.vuna:35"));
  ("B_dData_dLog.v_logOn", ("Base.Data.Log.logOn", "Base/Data/Log.vuna:19"));
  ("B_dData_dLog.v_logTrace", ("Base.Data.Log.logTrace", "Base/Data/Log.vuna:43"));
  ("B_dData_dLog.v_logWarn", ("Base.Data.Log.logWarn", "Base/Data/Log.vuna:31"));
  ("B_dData_dMaybe.v_fromMaybe", ("Base.Data.Maybe.fromMaybe", "Base/Data/Maybe.vuna:24"));
  ("B_dData_dMaybe.v_isJust", ("Base.Data.Maybe.isJust", "Base/Data/Maybe.vuna:29"));
  ("B_dData_dMaybe.v_isNothing", ("Base.Data.Maybe.isNothing", "Base/Data/Maybe.vuna:34"));
  ("B_dData_dMaybe.v_maybe", ("Base.Data.Maybe.maybe", "Base/Data/Maybe.vuna:39"));
  ("B_dData_dNat.v_fromIntClamp", ("Base.Data.Nat.fromIntClamp", "Base/Data/Nat.vuna:41"));
  ("B_dData_dNat.v_fromIntMaybe", ("Base.Data.Nat.fromIntMaybe", "Base/Data/Nat.vuna:45"));
  ("B_dData_dNat.v_isZero", ("Base.Data.Nat.isZero", "Base/Data/Nat.vuna:53"));
  ("B_dData_dNat.v_minus", ("Base.Data.Nat.minus", "Base/Data/Nat.vuna:29"));
  ("B_dData_dNat.v_mult", ("Base.Data.Nat.mult", "Base/Data/Nat.vuna:33"));
  ("B_dData_dNat.v_plus", ("Base.Data.Nat.plus", "Base/Data/Nat.vuna:25"));
  ("B_dData_dNat.v_pred", ("Base.Data.Nat.pred", "Base/Data/Nat.vuna:49"));
  ("B_dData_dNat.v_toInt", ("Base.Data.Nat.toInt", "Base/Data/Nat.vuna:37"));
  ("B_dData_dObs.v_obsCounter", ("Base.Data.Obs.obsCounter", "Base/Data/Obs.vuna:36"));
  ("B_dData_dObs.v_obsLevel", ("Base.Data.Obs.obsLevel", "Base/Data/Obs.vuna:25"));
  ("B_dData_dObs.v_obsMark", ("Base.Data.Obs.obsMark", "Base/Data/Obs.vuna:40"));
  ("B_dData_dObs.v_obsOn", ("Base.Data.Obs.obsOn", "Base/Data/Obs.vuna:29"));
  ("B_dData_dObs.v_obsSampleStart", ("Base.Data.Obs.obsSampleStart", "Base/Data/Obs.vuna:56"));
  ("B_dData_dObs.v_obsSampleStop", ("Base.Data.Obs.obsSampleStop", "Base/Data/Obs.vuna:60"));
  ("B_dData_dObs.v_obsSpanBegin", ("Base.Data.Obs.obsSpanBegin", "Base/Data/Obs.vuna:45"));
  ("B_dData_dObs.v_obsSpanEnd", ("Base.Data.Obs.obsSpanEnd", "Base/Data/Obs.vuna:49"));
  ("B_dData_dObs_dSpan.v_obsSample", ("Base.Data.Obs.Span.obsSample", "Base/Data/Obs/Span.vuna:34"));
  ("B_dData_dObs_dSpan.v_obsSpan", ("Base.Data.Obs.Span.obsSpan", "Base/Data/Obs/Span.vuna:17"));
  ("B_dData_dObs_dSpan.v_obsSpanEff", ("Base.Data.Obs.Span.obsSpanEff", "Base/Data/Obs/Span.vuna:26"));
  ("B_dData_dObs_dSpan.v_obsSpanP", ("Base.Data.Obs.Span.obsSpanP", "Base/Data/Obs/Span.vuna:21"));
  ("B_dData_dPair.v_firstOf", ("Base.Data.Pair.firstOf", "Base/Data/Pair.vuna:19"));
  ("B_dData_dPair.v_secondOf", ("Base.Data.Pair.secondOf", "Base/Data/Pair.vuna:23"));
  ("B_dData_dResult.v_mapError", ("Base.Data.Result.mapError", "Base/Data/Result.vuna:64"));
  ("B_dData_dResult.v_step", ("Base.Data.Result.step", "Base/Data/Result.vuna:59"));
  ("B_dData_dResult.v_traverse", ("Base.Data.Result.traverse", "Base/Data/Result.vuna:47"));
  ("B_dData_dResult.v_withDefault", ("Base.Data.Result.withDefault", "Base/Data/Result.vuna:69"));
  ("B_dData_dSha1.v_bigEndian32", ("Base.Data.Sha1.bigEndian32", "Base/Data/Sha1.vuna:53"));
  ("B_dData_dSha1.v_bigEndian64", ("Base.Data.Sha1.bigEndian64", "Base/Data/Sha1.vuna:45"));
  ("B_dData_dSha1.v_compressBlock", ("Base.Data.Sha1.compressBlock", "Base/Data/Sha1.vuna:57"));
  ("B_dData_dSha1.v_expand", ("Base.Data.Sha1.expand", "Base/Data/Sha1.vuna:78"));
  ("B_dData_dSha1.v_expandStep", ("Base.Data.Sha1.expandStep", "Base/Data/Sha1.vuna:82"));
  ("B_dData_dSha1.v_headAfter", ("Base.Data.Sha1.headAfter", "Base/Data/Sha1.vuna:90"));
  ("B_dData_dSha1.v_hexByte", ("Base.Data.Sha1.hexByte", "Base/Data/Sha1.vuna:128"));
  ("B_dData_dSha1.v_hexDigit", ("Base.Data.Sha1.hexDigit", "Base/Data/Sha1.vuna:132"));
  ("B_dData_dSha1.v_pack4", ("Base.Data.Sha1.pack4", "Base/Data/Sha1.vuna:73"));
  ("B_dData_dSha1.v_padMessage", ("Base.Data.Sha1.padMessage", "Base/Data/Sha1.vuna:33"));
  ("B_dData_dSha1.v_roundF", ("Base.Data.Sha1.roundF", "Base/Data/Sha1.vuna:108"));
  ("B_dData_dSha1.v_roundK", ("Base.Data.Sha1.roundK", "Base/Data/Sha1.vuna:117"));
  ("B_dData_dSha1.v_sha1", ("Base.Data.Sha1.sha1", "Base/Data/Sha1.vuna:16"));
  ("B_dData_dSha1.v_sha1Init", ("Base.Data.Sha1.sha1Init", "Base/Data/Sha1.vuna:29"));
  ("B_dData_dSha1.v_sha1Raw", ("Base.Data.Sha1.sha1Raw", "Base/Data/Sha1.vuna:20"));
  ("B_dData_dSha1.v_sha1Round", ("Base.Data.Sha1.sha1Round", "Base/Data/Sha1.vuna:97"));
  ("B_dData_dSha1.v_wordsOf", ("Base.Data.Sha1.wordsOf", "Base/Data/Sha1.vuna:69"));
  ("B_dData_dSha1.v_wordsToBytes", ("Base.Data.Sha1.wordsToBytes", "Base/Data/Sha1.vuna:124"));
  ("B_dData_dSha1.v_zeroBytes", ("Base.Data.Sha1.zeroBytes", "Base/Data/Sha1.vuna:41"));
  ("B_dData_dSort.v_insertBy", ("Base.Data.Sort.insertBy", "Base/Data/Sort.vuna:37"));
  ("B_dData_dSort.v_insertionSortBy", ("Base.Data.Sort.insertionSortBy", "Base/Data/Sort.vuna:42"));
  ("B_dData_dSort.v_lenInt", ("Base.Data.Sort.lenInt", "Base/Data/Sort.vuna:17"));
  ("B_dData_dSort.v_lenIntGo", ("Base.Data.Sort.lenIntGo", "Base/Data/Sort.vuna:21"));
  ("B_dData_dSort.v_mergeOnto", ("Base.Data.Sort.mergeOnto", "Base/Data/Sort.vuna:60"));
  ("B_dData_dSort.v_mergeSort", ("Base.Data.Sort.mergeSort", "Base/Data/Sort.vuna:87"));
  ("B_dData_dSort.v_msort", ("Base.Data.Sort.msort", "Base/Data/Sort.vuna:67"));
  ("B_dData_dSort.v_revOnto", ("Base.Data.Sort.revOnto", "Base/Data/Sort.vuna:47"));
  ("B_dData_dSort.v_shortList", ("Base.Data.Sort.shortList", "Base/Data/Sort.vuna:32"));
  ("B_dData_dSort.v_sortBy", ("Base.Data.Sort.sortBy", "Base/Data/Sort.vuna:80"));
  ("B_dData_dSort.v_sortedBy", ("Base.Data.Sort.sortedBy", "Base/Data/Sort.vuna:26"));
  ("B_dData_dSort.v_splitHalves", ("Base.Data.Sort.splitHalves", "Base/Data/Sort.vuna:52"));
  ("B_dData_dStream.v_cons", ("Base.Data.Stream.cons", "Base/Data/Stream.vuna:41"));
  ("B_dData_dStream.v_empty", ("Base.Data.Stream.empty", "Base/Data/Stream.vuna:33"));
  ("B_dData_dStream.v_filter", ("Base.Data.Stream.filter", "Base/Data/Stream.vuna:62"));
  ("B_dData_dStream.v_filterStep", ("Base.Data.Stream.filterStep", "Base/Data/Stream.vuna:65"));
  ("B_dData_dStream.v_foldl", ("Base.Data.Stream.foldl", "Base/Data/Stream.vuna:89"));
  ("B_dData_dStream.v_foldlStep", ("Base.Data.Stream.foldlStep", "Base/Data/Stream.vuna:92"));
  ("B_dData_dStream.v_fromList", ("Base.Data.Stream.fromList", "Base/Data/Stream.vuna:45"));
  ("B_dData_dStream.v_fromListStep", ("Base.Data.Stream.fromListStep", "Base/Data/Stream.vuna:48"));
  ("B_dData_dStream.v_map", ("Base.Data.Stream.map", "Base/Data/Stream.vuna:53"));
  ("B_dData_dStream.v_mapStep", ("Base.Data.Stream.mapStep", "Base/Data/Stream.vuna:56"));
  ("B_dData_dStream.v_singleton", ("Base.Data.Stream.singleton", "Base/Data/Stream.vuna:37"));
  ("B_dData_dStream.v_take", ("Base.Data.Stream.take", "Base/Data/Stream.vuna:71"));
  ("B_dData_dStream.v_takeStep", ("Base.Data.Stream.takeStep", "Base/Data/Stream.vuna:74"));
  ("B_dData_dStream.v_toList", ("Base.Data.Stream.toList", "Base/Data/Stream.vuna:80"));
  ("B_dData_dStream.v_toListStep", ("Base.Data.Stream.toListStep", "Base/Data/Stream.vuna:83"));
  ("B_dData_dStream.v_uncons", ("Base.Data.Stream.uncons", "Base/Data/Stream.vuna:29"));
  ("B_dData_dString.v__ucontainsChars", ("Base.Data.String._containsChars", "Base/Data/String.vuna:203"));
  ("B_dData_dString.v__udigitsToInt", ("Base.Data.String._digitsToInt", "Base/Data/String.vuna:164"));
  ("B_dData_dString.v__udigitsToNegInt", ("Base.Data.String._digitsToNegInt", "Base/Data/String.vuna:175"));
  ("B_dData_dString.v__udropSpace", ("Base.Data.String._dropSpace", "Base/Data/String.vuna:190"));
  ("B_dData_dString.v__uinterleave", ("Base.Data.String._interleave", "Base/Data/String.vuna:60"));
  ("B_dData_dString.v__uisSpace", ("Base.Data.String._isSpace", "Base/Data/String.vuna:186"));
  ("B_dData_dString.v__uminInt", ("Base.Data.String._minInt", "Base/Data/String.vuna:160"));
  ("B_dData_dString.v__unatDigits", ("Base.Data.String._natDigits", "Base/Data/String.vuna:152"));
  ("B_dData_dString.v__ustartsWithChars", ("Base.Data.String._startsWithChars", "Base/Data/String.vuna:195"));
  ("B_dData_dString.v_byteLength", ("Base.Data.String.byteLength", "Base/Data/String.vuna:22"));
  ("B_dData_dString.v_contains", ("Base.Data.String.contains", "Base/Data/String.vuna:87"));
  ("B_dData_dString.v_endsWith", ("Base.Data.String.endsWith", "Base/Data/String.vuna:98"));
  ("B_dData_dString.v_join", ("Base.Data.String.join", "Base/Data/String.vuna:56"));
  ("B_dData_dString.v_lines", ("Base.Data.String.lines", "Base/Data/String.vuna:66"));
  ("B_dData_dString.v_parseInt", ("Base.Data.String.parseInt", "Base/Data/String.vuna:134"));
  ("B_dData_dString.v_parseIntOr", ("Base.Data.String.parseIntOr", "Base/Data/String.vuna:145"));
  ("B_dData_dString.v_parseNat", ("Base.Data.String.parseNat", "Base/Data/String.vuna:126"));
  ("B_dData_dString.v_repeat", ("Base.Data.String.repeat", "Base/Data/String.vuna:118"));
  ("B_dData_dString.v_sameBytes", ("Base.Data.String.sameBytes", "Base/Data/String.vuna:106"));
  ("B_dData_dString.v_skipSep", ("Base.Data.String.skipSep", "Base/Data/String.vuna:45"));
  ("B_dData_dString.v_split", ("Base.Data.String.split", "Base/Data/String.vuna:26"));
  ("B_dData_dString.v_splitAcc", ("Base.Data.String.splitAcc", "Base/Data/String.vuna:34"));
  ("B_dData_dString.v_startsWith", ("Base.Data.String.startsWith", "Base/Data/String.vuna:91"));
  ("B_dData_dString.v_substring", ("Base.Data.String.substring", "Base/Data/String.vuna:122"));
  ("B_dData_dString.v_trim", ("Base.Data.String.trim", "Base/Data/String.vuna:83"));
  ("B_dData_dString.v_trimLeft", ("Base.Data.String.trimLeft", "Base/Data/String.vuna:75"));
  ("B_dData_dString.v_trimRight", ("Base.Data.String.trimRight", "Base/Data/String.vuna:79"));
  ("B_dData_dString.v_unlines", ("Base.Data.String.unlines", "Base/Data/String.vuna:70"));
  ("B_dData_dVec.v_get", ("Base.Data.Vec.get", "Base/Data/Vec.vuna:40"));
  ("B_dData_dVec.v_getMaybe", ("Base.Data.Vec.getMaybe", "Base/Data/Vec.vuna:45"));
  ("B_dData_dVec.v_substTemplate", ("Base.Data.Vec.substTemplate", "Base/Data/Vec.vuna:61"));
  ("B_dData_dVec.v_tabulate", ("Base.Data.Vec.tabulate", "Base/Data/Vec.vuna:51"));
  ("B_dData_dVec.v_vecToList", ("Base.Data.Vec.vecToList", "Base/Data/Vec.vuna:65"));
  ("B_dData_dVec.v_vhead", ("Base.Data.Vec.vhead", "Base/Data/Vec.vuna:21"));
  ("B_dData_dVec.v_vlen", ("Base.Data.Vec.vlen", "Base/Data/Vec.vuna:33"));
  ("B_dData_dVec.v_vtail", ("Base.Data.Vec.vtail", "Base/Data/Vec.vuna:27"));
  ("B_dEffect_dArgs.v_argsGetArgs", ("Base.Effect.Args.argsGetArgs", "Base/Effect/Args.vuna:16"));
  ("B_dEffect_dArgs.v_argsOpHIOHost", ("Base.Effect.Args.argsOpHIOHost", "Base/Effect/Args.vuna:27"));
  ("B_dEffect_dArgs.v_handleArgs", ("Base.Effect.Args.handleArgs", "Base/Effect/Args.vuna:20"));
  ("B_dEffect_dArgs.v_handleArgsHostHost", ("Base.Effect.Args.handleArgsHostHost", "Base/Effect/Args.vuna:36"));
  ("B_dEffect_dArgs.v_runArgsHost", ("Base.Effect.Args.runArgsHost", "Base/Effect/Args.vuna:40"));
  ("B_dEffect_dClock.v_clockNow", ("Base.Effect.Clock.clockNow", "Base/Effect/Clock.vuna:19"));
  ("B_dEffect_dClock.v_clockOpHIOHost", ("Base.Effect.Clock.clockOpHIOHost", "Base/Effect/Clock.vuna:35"));
  ("B_dEffect_dClock.v_clockSleepMicros", ("Base.Effect.Clock.clockSleepMicros", "Base/Effect/Clock.vuna:23"));
  ("B_dEffect_dClock.v_handleClock", ("Base.Effect.Clock.handleClock", "Base/Effect/Clock.vuna:27"));
  ("B_dEffect_dClock.v_handleClockHostHost", ("Base.Effect.Clock.handleClockHostHost", "Base/Effect/Clock.vuna:48"));
  ("B_dEffect_dClock.v_runClockHost", ("Base.Effect.Clock.runClockHost", "Base/Effect/Clock.vuna:53"));
  ("B_dEffect_dConsole.v_consoleEprint", ("Base.Effect.Console.consoleEprint", "Base/Effect/Console.vuna:26"));
  ("B_dEffect_dConsole.v_consoleOpHILib", ("Base.Effect.Console.consoleOpHILib", "Base/Effect/Console.vuna:45"));
  ("B_dEffect_dConsole.v_consoleOpHIOHost", ("Base.Effect.Console.consoleOpHIOHost", "Base/Effect/Console.vuna:38"));
  ("B_dEffect_dConsole.v_consolePrint", ("Base.Effect.Console.consolePrint", "Base/Effect/Console.vuna:22"));
  ("B_dEffect_dConsole.v_handleConsole", ("Base.Effect.Console.handleConsole", "Base/Effect/Console.vuna:30"));
  ("B_dEffect_dConsole.v_handleConsoleHostHost", ("Base.Effect.Console.handleConsoleHostHost", "Base/Effect/Console.vuna:58"));
  ("B_dEffect_dConsole.v_runConsoleHost", ("Base.Effect.Console.runConsoleHost", "Base/Effect/Console.vuna:64"));
  ("B_dEffect_dCore.v_Obj", ("Base.Effect.Core.Obj", "Base/Effect/Core.vuna:301"));
  ("B_dEffect_dCore.v_ObjTy", ("Base.Effect.Core.ObjTy", "Base/Effect/Core.vuna:393"));
  ("B_dEffect_dCore.v_bracket", ("Base.Effect.Core.bracket", "Base/Effect/Core.vuna:379"));
  ("B_dEffect_dCore.v_cleanupRun", ("Base.Effect.Core.cleanupRun", "Base/Effect/Core.vuna:796"));
  ("B_dEffect_dCore.v_contAdapter", ("Base.Effect.Core.contAdapter", "Base/Effect/Core.vuna:324"));
  ("B_dEffect_dCore.v_ctxKRest", ("Base.Effect.Core.ctxKRest", "Base/Effect/Core.vuna:482"));
  ("B_dEffect_dCore.v_ctxPrev", ("Base.Effect.Core.ctxPrev", "Base/Effect/Core.vuna:485"));
  ("B_dEffect_dCore.v_ctxPrompt", ("Base.Effect.Core.ctxPrompt", "Base/Effect/Core.vuna:479"));
  ("B_dEffect_dCore.v_ctxSlot", ("Base.Effect.Core.ctxSlot", "Base/Effect/Core.vuna:488"));
  ("B_dEffect_dCore.v_defaultInstance", ("Base.Effect.Core.defaultInstance", "Base/Effect/Core.vuna:58"));
  ("B_dEffect_dCore.v_depth", ("Base.Effect.Core.depth", "Base/Effect/Core.vuna:556"));
  ("B_dEffect_dCore.v_dropCleanups", ("Base.Effect.Core.dropCleanups", "Base/Effect/Core.vuna:800"));
  ("B_dEffect_dCore.v_dropEffHead", ("Base.Effect.Core.dropEffHead", "Base/Effect/Core.vuna:201"));
  ("B_dEffect_dCore.v_effPrim", ("Base.Effect.Core.effPrim", "Base/Effect/Core.vuna:110"));
  ("B_dEffect_dCore.v_emptySt", ("Base.Effect.Core.emptySt", "Base/Effect/Core.vuna:449"));
  ("B_dEffect_dCore.v_finally", ("Base.Effect.Core.finally", "Base/Effect/Core.vuna:390"));
  ("B_dEffect_dCore.v_findFrame", ("Base.Effect.Core.findFrame", "Base/Effect/Core.vuna:582"));
  ("B_dEffect_dCore.v_finish", ("Base.Effect.Core.finish", "Base/Effect/Core.vuna:781"));
  ("B_dEffect_dCore.v_frameCleanDepth", ("Base.Effect.Core.frameCleanDepth", "Base/Effect/Core.vuna:473"));
  ("B_dEffect_dCore.v_frameComp", ("Base.Effect.Core.frameComp", "Base/Effect/Core.vuna:464"));
  ("B_dEffect_dCore.v_frameIdOf", ("Base.Effect.Core.frameIdOf", "Base/Effect/Core.vuna:476"));
  ("B_dEffect_dCore.v_frameKOuter", ("Base.Effect.Core.frameKOuter", "Base/Effect/Core.vuna:467"));
  ("B_dEffect_dCore.v_frameKey", ("Base.Effect.Core.frameKey", "Base/Effect/Core.vuna:452"));
  ("B_dEffect_dCore.v_frameName", ("Base.Effect.Core.frameName", "Base/Effect/Core.vuna:455"));
  ("B_dEffect_dCore.v_frameOpH", ("Base.Effect.Core.frameOpH", "Base/Effect/Core.vuna:461"));
  ("B_dEffect_dCore.v_framePrev", ("Base.Effect.Core.framePrev", "Base/Effect/Core.vuna:470"));
  ("B_dEffect_dCore.v_frameRet", ("Base.Effect.Core.frameRet", "Base/Effect/Core.vuna:458"));
  ("B_dEffect_dCore.v_fromObj", ("Base.Effect.Core.fromObj", "Base/Effect/Core.vuna:309"));
  ("B_dEffect_dCore.v_handleCore", ("Base.Effect.Core.handleCore", "Base/Effect/Core.vuna:267"));
  ("B_dEffect_dCore.v_handleCoreAt", ("Base.Effect.Core.handleCoreAt", "Base/Effect/Core.vuna:281"));
  ("B_dEffect_dCore.v_handleCoreAtId", ("Base.Effect.Core.handleCoreAtId", "Base/Effect/Core.vuna:286"));
  ("B_dEffect_dCore.v_handleCoreId", ("Base.Effect.Core.handleCoreId", "Base/Effect/Core.vuna:272"));
  ("B_dEffect_dCore.v_handleCoreLin", ("Base.Effect.Core.handleCoreLin", "Base/Effect/Core.vuna:328"));
  ("B_dEffect_dCore.v_handleCoreLinId", ("Base.Effect.Core.handleCoreLinId", "Base/Effect/Core.vuna:333"));
  ("B_dEffect_dCore.v_handleScoped", ("Base.Effect.Core.handleScoped", "Base/Effect/Core.vuna:147"));
  ("B_dEffect_dCore.v_handleSelf", ("Base.Effect.Core.handleSelf", "Base/Effect/Core.vuna:151"));
  ("B_dEffect_dCore.v_handleWith", ("Base.Effect.Core.handleWith", "Base/Effect/Core.vuna:343"));
  ("B_dEffect_dCore.v_handleWithAt", ("Base.Effect.Core.handleWithAt", "Base/Effect/Core.vuna:353"));
  ("B_dEffect_dCore.v_handleWithAtId", ("Base.Effect.Core.handleWithAtId", "Base/Effect/Core.vuna:358"));
  ("B_dEffect_dCore.v_handleWithId", ("Base.Effect.Core.handleWithId", "Base/Effect/Core.vuna:347"));
  ("B_dEffect_dCore.v_inChain", ("Base.Effect.Core.inChain", "Base/Effect/Core.vuna:565"));
  ("B_dEffect_dCore.v_joinEff", ("Base.Effect.Core.joinEff", "Base/Effect/Core.vuna:163"));
  ("B_dEffect_dCore.v_joinEffNilInner", ("Base.Effect.Core.joinEffNilInner", "Base/Effect/Core.vuna:189"));
  ("B_dEffect_dCore.v_joinEffNilOuter", ("Base.Effect.Core.joinEffNilOuter", "Base/Effect/Core.vuna:176"));
  ("B_dEffect_dCore.v_machineRun", ("Base.Effect.Core.machineRun", "Base/Effect/Core.vuna:815"));
  ("B_dEffect_dCore.v_machineScoped", ("Base.Effect.Core.machineScoped", "Base/Effect/Core.vuna:595"));
  ("B_dEffect_dCore.v_markUsed", ("Base.Effect.Core.markUsed", "Base/Effect/Core.vuna:519"));
  ("B_dEffect_dCore.v_markUsedSmall", ("Base.Effect.Core.markUsedSmall", "Base/Effect/Core.vuna:531"));
  ("B_dEffect_dCore.v_mkCont", ("Base.Effect.Core.mkCont", "Base/Effect/Core.vuna:367"));
  ("B_dEffect_dCore.v_performCore", ("Base.Effect.Core.performCore", "Base/Effect/Core.vuna:259"));
  ("B_dEffect_dCore.v_performCoreId", ("Base.Effect.Core.performCoreId", "Base/Effect/Core.vuna:263"));
  ("B_dEffect_dCore.v_popCleanup", ("Base.Effect.Core.popCleanup", "Base/Effect/Core.vuna:376"));
  ("B_dEffect_dCore.v_prependFree", ("Base.Effect.Core.prependFree", "Base/Effect/Core.vuna:550"));
  ("B_dEffect_dCore.v_pushCleanup", ("Base.Effect.Core.pushCleanup", "Base/Effect/Core.vuna:373"));
  ("B_dEffect_dCore.v_raise", ("Base.Effect.Core.raise", "Base/Effect/Core.vuna:217"));
  ("B_dEffect_dCore.v_raiseTo", ("Base.Effect.Core.raiseTo", "Base/Effect/Core.vuna:222"));
  ("B_dEffect_dCore.v_reinstall", ("Base.Effect.Core.reinstall", "Base/Effect/Core.vuna:575"));
  ("B_dEffect_dCore.v_reinstallIfMissing", ("Base.Effect.Core.reinstallIfMissing", "Base/Effect/Core.vuna:579"));
  ("B_dEffect_dCore.v_removeFrame", ("Base.Effect.Core.removeFrame", "Base/Effect/Core.vuna:767"));
  ("B_dEffect_dCore.v_resIdx", ("Base.Effect.Core.resIdx", "Base/Effect/Core.vuna:251"));
  ("B_dEffect_dCore.v_resumeCont", ("Base.Effect.Core.resumeCont", "Base/Effect/Core.vuna:318"));
  ("B_dEffect_dCore.v_rowAppend", ("Base.Effect.Core.rowAppend", "Base/Effect/Core.vuna:53"));
  ("B_dEffect_dCore.v_rowRem", ("Base.Effect.Core.rowRem", "Base/Effect/Core.vuna:50"));
  ("B_dEffect_dCore.v_runEff", ("Base.Effect.Core.runEff", "Base/Effect/Core.vuna:131"));
  ("B_dEffect_dCore.v_runGo", ("Base.Effect.Core.runGo", "Base/Effect/Core.vuna:617"));
  ("B_dEffect_dCore.v_runMain", ("Base.Effect.Core.runMain", "Base/Effect/Core.vuna:157"));
  ("B_dEffect_dCore.v_runPure", ("Base.Effect.Core.runPure", "Base/Effect/Core.vuna:127"));
  ("B_dEffect_dCore.v_runThunk", ("Base.Effect.Core.runThunk", "Base/Effect/Core.vuna:120"));
  ("B_dEffect_dCore.v_samePrompt", ("Base.Effect.Core.samePrompt", "Base/Effect/Core.vuna:553"));
  ("B_dEffect_dCore.v_scope", ("Base.Effect.Core.scope", "Base/Effect/Core.vuna:141"));
  ("B_dEffect_dCore.v_sendCore", ("Base.Effect.Core.sendCore", "Base/Effect/Core.vuna:231"));
  ("B_dEffect_dCore.v_sendCoreId", ("Base.Effect.Core.sendCoreId", "Base/Effect/Core.vuna:235"));
  ("B_dEffect_dCore.v_sigFn", ("Base.Effect.Core.sigFn", "Base/Effect/Core.vuna:245"));
  ("B_dEffect_dCore.v_sigOf", ("Base.Effect.Core.sigOf", "Base/Effect/Core.vuna:255"));
  ("B_dEffect_dCore.v_step", ("Base.Effect.Core.step", "Base/Effect/Core.vuna:628"));
  ("B_dEffect_dCore.v_tailSlot", ("Base.Effect.Core.tailSlot", "Base/Effect/Core.vuna:515"));
  ("B_dEffect_dCore.v_toObj", ("Base.Effect.Core.toObj", "Base/Effect/Core.vuna:305"));
  ("B_dEffect_dCore.v_unwind", ("Base.Effect.Core.unwind", "Base/Effect/Core.vuna:746"));
  ("B_dEffect_dCore.v_usedEpoch", ("Base.Effect.Core.usedEpoch", "Base/Effect/Core.vuna:493"));
  ("B_dEffect_dCore.v_usedEpochSmall", ("Base.Effect.Core.usedEpochSmall", "Base/Effect/Core.vuna:505"));
  ("B_dEffect_dCore.v_usedLen", ("Base.Effect.Core.usedLen", "Base/Effect/Core.vuna:540"));
  ("B_dEffect_dCore.v_usedSmallLimit", ("Base.Effect.Core.usedSmallLimit", "Base/Effect/Core.vuna:433"));
  ("B_dEffect_dCore.v_weaken", ("Base.Effect.Core.weaken", "Base/Effect/Core.vuna:114"));
  ("B_dEffect_dCore.v_weakenRow", ("Base.Effect.Core.weakenRow", "Base/Effect/Core.vuna:208"));
  ("B_dEffect_dCursor.v_cursorOfState", ("Base.Effect.Cursor.cursorOfState", "Base/Effect/Cursor.vuna:25"));
  ("B_dEffect_dCursor.v_foldC", ("Base.Effect.Cursor.foldC", "Base/Effect/Cursor.vuna:67"));
  ("B_dEffect_dCursor.v_mapC", ("Base.Effect.Cursor.mapC", "Base/Effect/Cursor.vuna:33"));
  ("B_dEffect_dCursor.v_mapStep", ("Base.Effect.Cursor.mapStep", "Base/Effect/Cursor.vuna:36"));
  ("B_dEffect_dCursor.v_next", ("Base.Effect.Cursor.next", "Base/Effect/Cursor.vuna:29"));
  ("B_dEffect_dCursor.v_ofList", ("Base.Effect.Cursor.ofList", "Base/Effect/Cursor.vuna:43"));
  ("B_dEffect_dCursor.v_ofListStep", ("Base.Effect.Cursor.ofListStep", "Base/Effect/Cursor.vuna:46"));
  ("B_dEffect_dCursor.v_takeC", ("Base.Effect.Cursor.takeC", "Base/Effect/Cursor.vuna:51"));
  ("B_dEffect_dEnv.v_envExecPath", ("Base.Effect.Env.envExecPath", "Base/Effect/Env.vuna:40"));
  ("B_dEffect_dEnv.v_envGetCwd", ("Base.Effect.Env.envGetCwd", "Base/Effect/Env.vuna:36"));
  ("B_dEffect_dEnv.v_envGetEnv", ("Base.Effect.Env.envGetEnv", "Base/Effect/Env.vuna:24"));
  ("B_dEffect_dEnv.v_envGetEnvNonEmpty", ("Base.Effect.Env.envGetEnvNonEmpty", "Base/Effect/Env.vuna:29"));
  ("B_dEffect_dEnv.v_envOpHIOHost", ("Base.Effect.Env.envOpHIOHost", "Base/Effect/Env.vuna:51"));
  ("B_dEffect_dEnv.v_handleEnv", ("Base.Effect.Env.handleEnv", "Base/Effect/Env.vuna:44"));
  ("B_dEffect_dEnv.v_handleEnvHostHost", ("Base.Effect.Env.handleEnvHostHost", "Base/Effect/Env.vuna:68"));
  ("B_dEffect_dEnv.v_runEnvHost", ("Base.Effect.Env.runEnvHost", "Base/Effect/Env.vuna:72"));
  ("B_dEffect_dExit.v_exitOpHIOHost", ("Base.Effect.Exit.exitOpHIOHost", "Base/Effect/Exit.vuna:27"));
  ("B_dEffect_dExit.v_exitWith", ("Base.Effect.Exit.exitWith", "Base/Effect/Exit.vuna:15"));
  ("B_dEffect_dExit.v_handleExit", ("Base.Effect.Exit.handleExit", "Base/Effect/Exit.vuna:19"));
  ("B_dEffect_dExit.v_handleExitHostHost", ("Base.Effect.Exit.handleExitHostHost", "Base/Effect/Exit.vuna:36"));
  ("B_dEffect_dExit.v_runExitHost", ("Base.Effect.Exit.runExitHost", "Base/Effect/Exit.vuna:40"));
  ("B_dEffect_dFs.v_fsChunkStep", ("Base.Effect.Fs.fsChunkStep", "Base/Effect/Fs.vuna:138"));
  ("B_dEffect_dFs.v_fsErrorOfCode", ("Base.Effect.Fs.fsErrorOfCode", "Base/Effect/Fs.vuna:90"));
  ("B_dEffect_dFs.v_fsErrorOpHR", ("Base.Effect.Fs.fsErrorOpHR", "Base/Effect/Fs.vuna:325"));
  ("B_dEffect_dFs.v_fsErrorRet", ("Base.Effect.Fs.fsErrorRet", "Base/Effect/Fs.vuna:321"));
  ("B_dEffect_dFs.v_fsErrorText", ("Base.Effect.Fs.fsErrorText", "Base/Effect/Fs.vuna:100"));
  ("B_dEffect_dFs.v_fsFail", ("Base.Effect.Fs.fsFail", "Base/Effect/Fs.vuna:86"));
  ("B_dEffect_dFs.v_fsFailAt", ("Base.Effect.Fs.fsFailAt", "Base/Effect/Fs.vuna:225"));
  ("B_dEffect_dFs.v_fsFileCursor", ("Base.Effect.Fs.fsFileCursor", "Base/Effect/Fs.vuna:134"));
  ("B_dEffect_dFs.v_fsFileExists", ("Base.Effect.Fs.fsFileExists", "Base/Effect/Fs.vuna:186"));
  ("B_dEffect_dFs.v_fsFileMtime", ("Base.Effect.Fs.fsFileMtime", "Base/Effect/Fs.vuna:190"));
  ("B_dEffect_dFs.v_fsFileSize", ("Base.Effect.Fs.fsFileSize", "Base/Effect/Fs.vuna:194"));
  ("B_dEffect_dFs.v_fsHostStatus", ("Base.Effect.Fs.fsHostStatus", "Base/Effect/Fs.vuna:221"));
  ("B_dEffect_dFs.v_fsIsDirectory", ("Base.Effect.Fs.fsIsDirectory", "Base/Effect/Fs.vuna:168"));
  ("B_dEffect_dFs.v_fsMakeDir", ("Base.Effect.Fs.fsMakeDir", "Base/Effect/Fs.vuna:174"));
  ("B_dEffect_dFs.v_fsMakeDirExclusive", ("Base.Effect.Fs.fsMakeDirExclusive", "Base/Effect/Fs.vuna:210"));
  ("B_dEffect_dFs.v_fsOpHIOHost", ("Base.Effect.Fs.fsOpHIOHost", "Base/Effect/Fs.vuna:229"));
  ("B_dEffect_dFs.v_fsReadDir", ("Base.Effect.Fs.fsReadDir", "Base/Effect/Fs.vuna:162"));
  ("B_dEffect_dFs.v_fsReadFile", ("Base.Effect.Fs.fsReadFile", "Base/Effect/Fs.vuna:120"));
  ("B_dEffect_dFs.v_fsReadFileRange", ("Base.Effect.Fs.fsReadFileRange", "Base/Effect/Fs.vuna:126"));
  ("B_dEffect_dFs.v_fsRemoveFile", ("Base.Effect.Fs.fsRemoveFile", "Base/Effect/Fs.vuna:180"));
  ("B_dEffect_dFs.v_fsRemoveTree", ("Base.Effect.Fs.fsRemoveTree", "Base/Effect/Fs.vuna:198"));
  ("B_dEffect_dFs.v_fsRename", ("Base.Effect.Fs.fsRename", "Base/Effect/Fs.vuna:202"));
  ("B_dEffect_dFs.v_fsSymlink", ("Base.Effect.Fs.fsSymlink", "Base/Effect/Fs.vuna:206"));
  ("B_dEffect_dFs.v_fsWriteFile", ("Base.Effect.Fs.fsWriteFile", "Base/Effect/Fs.vuna:150"));
  ("B_dEffect_dFs.v_fsWriteFileAtomic", ("Base.Effect.Fs.fsWriteFileAtomic", "Base/Effect/Fs.vuna:156"));
  ("B_dEffect_dFs.v_handleFs", ("Base.Effect.Fs.handleFs", "Base/Effect/Fs.vuna:214"));
  ("B_dEffect_dFs.v_handleFsHostHost", ("Base.Effect.Fs.handleFsHostHost", "Base/Effect/Fs.vuna:313"));
  ("B_dEffect_dFs.v_isDotEntry", ("Base.Effect.Fs.isDotEntry", "Base/Effect/Fs.vuna:113"));
  ("B_dEffect_dFs.v_runFsError", ("Base.Effect.Fs.runFsError", "Base/Effect/Fs.vuna:331"));
  ("B_dEffect_dFs.v_runFsErrorHost", ("Base.Effect.Fs.runFsErrorHost", "Base/Effect/Fs.vuna:335"));
  ("B_dEffect_dFs.v_runFsHost", ("Base.Effect.Fs.runFsHost", "Base/Effect/Fs.vuna:317"));
  ("B_dEffect_dFs.v_sortEntries", ("Base.Effect.Fs.sortEntries", "Base/Effect/Fs.vuna:116"));
  ("B_dEffect_dHost.v_hostSync", ("Base.Effect.Host.hostSync", "Base/Effect/Host.vuna:32"));
  ("B_dEffect_dHost.v_runHost", ("Base.Effect.Host.runHost", "Base/Effect/Host.vuna:25"));
  ("B_dEffect_dProcess.v_handleProcess", ("Base.Effect.Process.handleProcess", "Base/Effect/Process.vuna:83"));
  ("B_dEffect_dProcess.v_handleProcessHostWith", ("Base.Effect.Process.handleProcessHostWith", "Base/Effect/Process.vuna:109"));
  ("B_dEffect_dProcess.v_handleProcessHostWithHost", ("Base.Effect.Process.handleProcessHostWithHost", "Base/Effect/Process.vuna:144"));
  ("B_dEffect_dProcess.v_processArgs", ("Base.Effect.Process.processArgs", "Base/Effect/Process.vuna:29"));
  ("B_dEffect_dProcess.v_processErrorOfCode", ("Base.Effect.Process.processErrorOfCode", "Base/Effect/Process.vuna:71"));
  ("B_dEffect_dProcess.v_processErrorOpHR", ("Base.Effect.Process.processErrorOpHR", "Base/Effect/Process.vuna:157"));
  ("B_dEffect_dProcess.v_processErrorRet", ("Base.Effect.Process.processErrorRet", "Base/Effect/Process.vuna:153"));
  ("B_dEffect_dProcess.v_processErrorText", ("Base.Effect.Process.processErrorText", "Base/Effect/Process.vuna:77"));
  ("B_dEffect_dProcess.v_processExit", ("Base.Effect.Process.processExit", "Base/Effect/Process.vuna:33"));
  ("B_dEffect_dProcess.v_processFail", ("Base.Effect.Process.processFail", "Base/Effect/Process.vuna:67"));
  ("B_dEffect_dProcess.v_processHostStatus", ("Base.Effect.Process.processHostStatus", "Base/Effect/Process.vuna:117"));
  ("B_dEffect_dProcess.v_processOpHIOWith", ("Base.Effect.Process.processOpHIOWith", "Base/Effect/Process.vuna:87"));
  ("B_dEffect_dProcess.v_processOpHIOWithHost", ("Base.Effect.Process.processOpHIOWithHost", "Base/Effect/Process.vuna:121"));
  ("B_dEffect_dProcess.v_processRunIn", ("Base.Effect.Process.processRunIn", "Base/Effect/Process.vuna:37"));
  ("B_dEffect_dProcess.v_processSpawn", ("Base.Effect.Process.processSpawn", "Base/Effect/Process.vuna:43"));
  ("B_dEffect_dProcess.v_processWait", ("Base.Effect.Process.processWait", "Base/Effect/Process.vuna:49"));
  ("B_dEffect_dProcess.v_runProcessError", ("Base.Effect.Process.runProcessError", "Base/Effect/Process.vuna:163"));
  ("B_dEffect_dProcess.v_runProcessErrorHost", ("Base.Effect.Process.runProcessErrorHost", "Base/Effect/Process.vuna:168"));
  ("B_dEffect_dProcess.v_runProcessHost", ("Base.Effect.Process.runProcessHost", "Base/Effect/Process.vuna:149"));
  ("B_dEffect_dStdin.v_handleStdin", ("Base.Effect.Stdin.handleStdin", "Base/Effect/Stdin.vuna:31"));
  ("B_dEffect_dStdin.v_handleStdinHostHost", ("Base.Effect.Stdin.handleStdinHostHost", "Base/Effect/Stdin.vuna:53"));
  ("B_dEffect_dStdin.v_runStdinHost", ("Base.Effect.Stdin.runStdinHost", "Base/Effect/Stdin.vuna:58"));
  ("B_dEffect_dStdin.v_stdinOpHIOHost", ("Base.Effect.Stdin.stdinOpHIOHost", "Base/Effect/Stdin.vuna:38"));
  ("B_dEffect_dStdin.v_stdinReadBytes", ("Base.Effect.Stdin.stdinReadBytes", "Base/Effect/Stdin.vuna:27"));
  ("B_dEffect_dStdin.v_stdinReadLine", ("Base.Effect.Stdin.stdinReadLine", "Base/Effect/Stdin.vuna:23"));
  ("B_dTrait_dApplicative.v_ap", ("Base.Trait.Applicative.ap", "Base/Trait/Applicative.vuna:16"));
  ("B_dTrait_dApplicative.v_liftA2", ("Base.Trait.Applicative.liftA2", "Base/Trait/Applicative.vuna:18"));
  ("B_dTrait_dApplicative.v_pure", ("Base.Trait.Applicative.pure", "Base/Trait/Applicative.vuna:14"));
  ("B_dTrait_dConvert.v_convert", ("Base.Trait.Convert.convert", "Base/Trait/Convert.vuna:13"));
  ("B_dTrait_dConvert.v_convertMaybe", ("Base.Trait.Convert.convertMaybe", "Base/Trait/Convert.vuna:18"));
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
  ("B_dTrait_dOrd.v_clamp", ("Base.Trait.Ord.clamp", "Base/Trait/Ord.vuna:91"));
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
  ("Base_dBytes.v_decListHead", ("Vuna.Compiler.Base.Bytes.decListHead", "Vuna/Compiler/Base/Bytes.vuna:221"));
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
  ("Base_dDiagnostics_dFrontend.v_lexAll", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexAll", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:231"));
  ("Base_dDiagnostics_dFrontend.v_lexCode", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexCode", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:30"));
  ("Base_dDiagnostics_dFrontend.v_lexErr0At", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexErr0At", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:433"));
  ("Base_dDiagnostics_dFrontend.v_lexErrAt", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexErrAt", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:420"));
  ("Base_dDiagnostics_dFrontend.v_lexMsg", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexMsg", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:413"));
  ("Base_dDiagnostics_dFrontend.v_lexTemplate", ("Vuna.Compiler.Base.Diagnostics.Frontend.lexTemplate", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:38"));
  ("Base_dDiagnostics_dFrontend.v_psAll", ("Vuna.Compiler.Base.Diagnostics.Frontend.psAll", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:254"));
  ("Base_dDiagnostics_dFrontend.v_psCode", ("Vuna.Compiler.Base.Diagnostics.Frontend.psCode", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:113"));
  ("Base_dDiagnostics_dFrontend.v_psErr0At", ("Vuna.Compiler.Base.Diagnostics.Frontend.psErr0At", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:437"));
  ("Base_dDiagnostics_dFrontend.v_psErr1At", ("Vuna.Compiler.Base.Diagnostics.Frontend.psErr1At", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:441"));
  ("Base_dDiagnostics_dFrontend.v_psErrAt", ("Vuna.Compiler.Base.Diagnostics.Frontend.psErrAt", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:424"));
  ("Base_dDiagnostics_dFrontend.v_psMsg", ("Vuna.Compiler.Base.Diagnostics.Frontend.psMsg", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:416"));
  ("Base_dDiagnostics_dFrontend.v_psTemplate", ("Vuna.Compiler.Base.Diagnostics.Frontend.psTemplate", "Vuna/Compiler/Base/Diagnostics/Frontend.vuna:162"));
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
  ("Base_dDiagnostics_dRn.v_rnAll", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAll", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:187"));
  ("Base_dDiagnostics_dRn.v_rnAt0", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAt0", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:149"));
  ("Base_dDiagnostics_dRn.v_rnAt1", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAt1", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:153"));
  ("Base_dDiagnostics_dRn.v_rnAt2", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAt2", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:157"));
  ("Base_dDiagnostics_dRn.v_rnAt3", ("Vuna.Compiler.Base.Diagnostics.Rn.rnAt3", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:161"));
  ("Base_dDiagnostics_dRn.v_rnCode", ("Vuna.Compiler.Base.Diagnostics.Rn.rnCode", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:62"));
  ("Base_dDiagnostics_dRn.v_rnErr", ("Vuna.Compiler.Base.Diagnostics.Rn.rnErr", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:141"));
  ("Base_dDiagnostics_dRn.v_rnMsg", ("Vuna.Compiler.Base.Diagnostics.Rn.rnMsg", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:137"));
  ("Base_dDiagnostics_dRn.v_rnNoLoc", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:145"));
  ("Base_dDiagnostics_dRn.v_rnNoLoc0", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc0", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:165"));
  ("Base_dDiagnostics_dRn.v_rnNoLoc1", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc1", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:169"));
  ("Base_dDiagnostics_dRn.v_rnNoLoc2", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc2", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:173"));
  ("Base_dDiagnostics_dRn.v_rnNoLoc3", ("Vuna.Compiler.Base.Diagnostics.Rn.rnNoLoc3", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:177"));
  ("Base_dDiagnostics_dRn.v_rnTemplate", ("Vuna.Compiler.Base.Diagnostics.Rn.rnTemplate", "Vuna/Compiler/Base/Diagnostics/Rn.vuna:96"));
  ("Base_dDiagnostics_dSink.v_dedupeGo", ("Vuna.Compiler.Base.Diagnostics.Sink.dedupeGo", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:52"));
  ("Base_dDiagnostics_dSink.v_dedupeWarnings", ("Vuna.Compiler.Base.Diagnostics.Sink.dedupeWarnings", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:62"));
  ("Base_dDiagnostics_dSink.v_diagKey", ("Vuna.Compiler.Base.Diagnostics.Sink.diagKey", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:31"));
  ("Base_dDiagnostics_dSink.v_severityTag", ("Vuna.Compiler.Base.Diagnostics.Sink.severityTag", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:20"));
  ("Base_dDiagnostics_dSink.v_spanPart", ("Vuna.Compiler.Base.Diagnostics.Sink.spanPart", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:42"));
  ("Base_dDiagnostics_dSink.v_spansKey", ("Vuna.Compiler.Base.Diagnostics.Sink.spansKey", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:36"));
  ("Base_dDiagnostics_dSink.v_tagPart", ("Vuna.Compiler.Base.Diagnostics.Sink.tagPart", "Vuna/Compiler/Base/Diagnostics/Sink.vuna:27"));
  ("Base_dDiagnostics_dTc.v_coverageCandidate", ("Vuna.Compiler.Base.Diagnostics.Tc.coverageCandidate", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:934"));
  ("Base_dDiagnostics_dTc.v_tcAll", ("Vuna.Compiler.Base.Diagnostics.Tc.tcAll", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:857"));
  ("Base_dDiagnostics_dTc.v_tcChunk0", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk0", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:426"));
  ("Base_dDiagnostics_dTc.v_tcChunk1", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk1", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:456"));
  ("Base_dDiagnostics_dTc.v_tcChunk10", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk10", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:739"));
  ("Base_dDiagnostics_dTc.v_tcChunk11", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk11", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:786"));
  ("Base_dDiagnostics_dTc.v_tcChunk12", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk12", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:828"));
  ("Base_dDiagnostics_dTc.v_tcChunk2", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk2", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:480"));
  ("Base_dDiagnostics_dTc.v_tcChunk3", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk3", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:509"));
  ("Base_dDiagnostics_dTc.v_tcChunk4", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk4", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:537"));
  ("Base_dDiagnostics_dTc.v_tcChunk5", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk5", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:560"));
  ("Base_dDiagnostics_dTc.v_tcChunk6", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk6", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:601"));
  ("Base_dDiagnostics_dTc.v_tcChunk7", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk7", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:633"));
  ("Base_dDiagnostics_dTc.v_tcChunk8", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk8", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:661"));
  ("Base_dDiagnostics_dTc.v_tcChunk9", ("Vuna.Compiler.Base.Diagnostics.Tc.tcChunk9", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:705"));
  ("Base_dDiagnostics_dTc.v_tcCode", ("Vuna.Compiler.Base.Diagnostics.Tc.tcCode", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:157"));
  ("Base_dDiagnostics_dTc.v_tcCoverageMissing", ("Vuna.Compiler.Base.Diagnostics.Tc.tcCoverageMissing", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:925"));
  ("Base_dDiagnostics_dTc.v_tcErr", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:870"));
  ("Base_dDiagnostics_dTc.v_tcErr0", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr0", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:877"));
  ("Base_dDiagnostics_dTc.v_tcErr0NoLoc", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr0NoLoc", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:893"));
  ("Base_dDiagnostics_dTc.v_tcErr1", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr1", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:881"));
  ("Base_dDiagnostics_dTc.v_tcErr1NoLoc", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr1NoLoc", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:897"));
  ("Base_dDiagnostics_dTc.v_tcErr2", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr2", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:885"));
  ("Base_dDiagnostics_dTc.v_tcErr2NoLoc", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr2NoLoc", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:901"));
  ("Base_dDiagnostics_dTc.v_tcErr3", ("Vuna.Compiler.Base.Diagnostics.Tc.tcErr3", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:920"));
  ("Base_dDiagnostics_dTc.v_tcMsg", ("Vuna.Compiler.Base.Diagnostics.Tc.tcMsg", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:866"));
  ("Base_dDiagnostics_dTc.v_tcTemplate", ("Vuna.Compiler.Base.Diagnostics.Tc.tcTemplate", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:273"));
  ("Base_dDiagnostics_dTc.v_tcTypeMismatch", ("Vuna.Compiler.Base.Diagnostics.Tc.tcTypeMismatch", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:908"));
  ("Base_dDiagnostics_dTc.v_tcTypeMismatchNoLoc", ("Vuna.Compiler.Base.Diagnostics.Tc.tcTypeMismatchNoLoc", "Vuna/Compiler/Base/Diagnostics/Tc.vuna:914"));
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
  ("Base_dIgnore.v_ancestorChain", ("Vuna.Compiler.Base.Ignore.ancestorChain", "Vuna/Compiler/Base/Ignore.vuna:102"));
  ("Base_dIgnore.v_buildRule", ("Vuna.Compiler.Base.Ignore.buildRule", "Vuna/Compiler/Base/Ignore.vuna:68"));
  ("Base_dIgnore.v_findGitRoot", ("Vuna.Compiler.Base.Ignore.findGitRoot", "Vuna/Compiler/Base/Ignore.vuna:125"));
  ("Base_dIgnore.v_ignoreContextAt", ("Vuna.Compiler.Base.Ignore.ignoreContextAt", "Vuna/Compiler/Base/Ignore.vuna:84"));
  ("Base_dIgnore.v_ignoreContextEff", ("Vuna.Compiler.Base.Ignore.ignoreContextEff", "Vuna/Compiler/Base/Ignore.vuna:80"));
  ("Base_dIgnore.v_ignorePathOf", ("Vuna.Compiler.Base.Ignore.ignorePathOf", "Vuna/Compiler/Base/Ignore.vuna:171"));
  ("Base_dIgnore.v_isIgnored", ("Vuna.Compiler.Base.Ignore.isIgnored", "Vuna/Compiler/Base/Ignore.vuna:175"));
  ("Base_dIgnore.v_lastMatch", ("Vuna.Compiler.Base.Ignore.lastMatch", "Vuna/Compiler/Base/Ignore.vuna:179"));
  ("Base_dIgnore.v_loadChain", ("Vuna.Compiler.Base.Ignore.loadChain", "Vuna/Compiler/Base/Ignore.vuna:114"));
  ("Base_dIgnore.v_loadIgnoreFile", ("Vuna.Compiler.Base.Ignore.loadIgnoreFile", "Vuna/Compiler/Base/Ignore.vuna:140"));
  ("Base_dIgnore.v_matchAnySegments", ("Vuna.Compiler.Base.Ignore.matchAnySegments", "Vuna/Compiler/Base/Ignore.vuna:215"));
  ("Base_dIgnore.v_matchSegment", ("Vuna.Compiler.Base.Ignore.matchSegment", "Vuna/Compiler/Base/Ignore.vuna:220"));
  ("Base_dIgnore.v_matchSegmentChars", ("Vuna.Compiler.Base.Ignore.matchSegmentChars", "Vuna/Compiler/Base/Ignore.vuna:225"));
  ("Base_dIgnore.v_matchSegmentGo", ("Vuna.Compiler.Base.Ignore.matchSegmentGo", "Vuna/Compiler/Base/Ignore.vuna:229"));
  ("Base_dIgnore.v_matchSegmentStar", ("Vuna.Compiler.Base.Ignore.matchSegmentStar", "Vuna/Compiler/Base/Ignore.vuna:243"));
  ("Base_dIgnore.v_matchSegments", ("Vuna.Compiler.Base.Ignore.matchSegments", "Vuna/Compiler/Base/Ignore.vuna:207"));
  ("Base_dIgnore.v_parseGitignore", ("Vuna.Compiler.Base.Ignore.parseGitignore", "Vuna/Compiler/Base/Ignore.vuna:49"));
  ("Base_dIgnore.v_parseGitignoreLine", ("Vuna.Compiler.Base.Ignore.parseGitignoreLine", "Vuna/Compiler/Base/Ignore.vuna:53"));
  ("Base_dIgnore.v_relUnder", ("Vuna.Compiler.Base.Ignore.relUnder", "Vuna/Compiler/Base/Ignore.vuna:159"));
  ("Base_dIgnore.v_ruleMatches", ("Vuna.Compiler.Base.Ignore.ruleMatches", "Vuna/Compiler/Base/Ignore.vuna:185"));
  ("Base_dIgnore.v_stripBase", ("Vuna.Compiler.Base.Ignore.stripBase", "Vuna/Compiler/Base/Ignore.vuna:195"));
  ("Base_dIgnore.v_trimTrailingSlash", ("Vuna.Compiler.Base.Ignore.trimTrailingSlash", "Vuna/Compiler/Base/Ignore.vuna:97"));
  ("Base_dIntrinsics.v_allIntrinsics", ("Vuna.Compiler.Base.Intrinsics.allIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:1154"));
  ("Base_dIntrinsics.v_arityOfType", ("Vuna.Compiler.Base.Intrinsics.arityOfType", "Vuna/Compiler/Base/Intrinsics.vuna:65"));
  ("Base_dIntrinsics.v_assertIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.assertIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:388"));
  ("Base_dIntrinsics.v_baseIntrinsics", ("Vuna.Compiler.Base.Intrinsics.baseIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:836"));
  ("Base_dIntrinsics.v_boolFalseCtor", ("Vuna.Compiler.Base.Intrinsics.boolFalseCtor", "Vuna/Compiler/Base/Intrinsics.vuna:626"));
  ("Base_dIntrinsics.v_boolTrueCtor", ("Vuna.Compiler.Base.Intrinsics.boolTrueCtor", "Vuna/Compiler/Base/Intrinsics.vuna:622"));
  ("Base_dIntrinsics.v_boolTypeName", ("Vuna.Compiler.Base.Intrinsics.boolTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:618"));
  ("Base_dIntrinsics.v_builtinEffectErrorRunHostOf", ("Vuna.Compiler.Base.Intrinsics.builtinEffectErrorRunHostOf", "Vuna/Compiler/Base/Intrinsics.vuna:221"));
  ("Base_dIntrinsics.v_builtinEffectErrorRunHostOfRest", ("Vuna.Compiler.Base.Intrinsics.builtinEffectErrorRunHostOfRest", "Vuna/Compiler/Base/Intrinsics.vuna:224"));
  ("Base_dIntrinsics.v_builtinEffectExistsRest", ("Vuna.Compiler.Base.Intrinsics.builtinEffectExistsRest", "Vuna/Compiler/Base/Intrinsics.vuna:267"));
  ("Base_dIntrinsics.v_builtinEffectImplOf", ("Vuna.Compiler.Base.Intrinsics.builtinEffectImplOf", "Vuna/Compiler/Base/Intrinsics.vuna:212"));
  ("Base_dIntrinsics.v_builtinEffectImplOfRest", ("Vuna.Compiler.Base.Intrinsics.builtinEffectImplOfRest", "Vuna/Compiler/Base/Intrinsics.vuna:215"));
  ("Base_dIntrinsics.v_builtinEffects", ("Vuna.Compiler.Base.Intrinsics.builtinEffects", "Vuna/Compiler/Base/Intrinsics.vuna:151"));
  ("Base_dIntrinsics.v_canonicalCtorsFor", ("Vuna.Compiler.Base.Intrinsics.canonicalCtorsFor", "Vuna/Compiler/Base/Intrinsics.vuna:576"));
  ("Base_dIntrinsics.v_canonicalFamilies", ("Vuna.Compiler.Base.Intrinsics.canonicalFamilies", "Vuna/Compiler/Base/Intrinsics.vuna:705"));
  ("Base_dIntrinsics.v_canonicalReprOf", ("Vuna.Compiler.Base.Intrinsics.canonicalReprOf", "Vuna/Compiler/Base/Intrinsics.vuna:739"));
  ("Base_dIntrinsics.v_cfCtors", ("Vuna.Compiler.Base.Intrinsics.cfCtors", "Vuna/Compiler/Base/Intrinsics.vuna:697"));
  ("Base_dIntrinsics.v_cfName", ("Vuna.Compiler.Base.Intrinsics.cfName", "Vuna/Compiler/Base/Intrinsics.vuna:693"));
  ("Base_dIntrinsics.v_cfRepr", ("Vuna.Compiler.Base.Intrinsics.cfRepr", "Vuna/Compiler/Base/Intrinsics.vuna:701"));
  ("Base_dIntrinsics.v_cmpSpecializedTyNames", ("Vuna.Compiler.Base.Intrinsics.cmpSpecializedTyNames", "Vuna/Compiler/Base/Intrinsics.vuna:761"));
  ("Base_dIntrinsics.v_ctorSpellingKey", ("Vuna.Compiler.Base.Intrinsics.ctorSpellingKey", "Vuna/Compiler/Base/Intrinsics.vuna:716"));
  ("Base_dIntrinsics.v_directClassForKey", ("Vuna.Compiler.Base.Intrinsics.directClassForKey", "Vuna/Compiler/Base/Intrinsics.vuna:258"));
  ("Base_dIntrinsics.v_dispatchIdChars", ("Vuna.Compiler.Base.Intrinsics.dispatchIdChars", "Vuna/Compiler/Base/Intrinsics.vuna:1214"));
  ("Base_dIntrinsics.v_dispatchIdIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.dispatchIdIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:1205"));
  ("Base_dIntrinsics.v_dispatchIdOf", ("Vuna.Compiler.Base.Intrinsics.dispatchIdOf", "Vuna/Compiler/Base/Intrinsics.vuna:1211"));
  ("Base_dIntrinsics.v_dropLastSegment", ("Vuna.Compiler.Base.Intrinsics.dropLastSegment", "Vuna/Compiler/Base/Intrinsics.vuna:724"));
  ("Base_dIntrinsics.v_effDefaultInstance", ("Vuna.Compiler.Base.Intrinsics.effDefaultInstance", "Vuna/Compiler/Base/Intrinsics.vuna:464"));
  ("Base_dIntrinsics.v_effHostOpName", ("Vuna.Compiler.Base.Intrinsics.effHostOpName", "Vuna/Compiler/Base/Intrinsics.vuna:450"));
  ("Base_dIntrinsics.v_effIntrinsics", ("Vuna.Compiler.Base.Intrinsics.effIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:972"));
  ("Base_dIntrinsics.v_effMainRunName", ("Vuna.Compiler.Base.Intrinsics.effMainRunName", "Vuna/Compiler/Base/Intrinsics.vuna:307"));
  ("Base_dIntrinsics.v_effMemberFamilyName", ("Vuna.Compiler.Base.Intrinsics.effMemberFamilyName", "Vuna/Compiler/Base/Intrinsics.vuna:433"));
  ("Base_dIntrinsics.v_effMemberHereCtor", ("Vuna.Compiler.Base.Intrinsics.effMemberHereCtor", "Vuna/Compiler/Base/Intrinsics.vuna:437"));
  ("Base_dIntrinsics.v_effMemberThereCtor", ("Vuna.Compiler.Base.Intrinsics.effMemberThereCtor", "Vuna/Compiler/Base/Intrinsics.vuna:441"));
  ("Base_dIntrinsics.v_effMkCtor", ("Vuna.Compiler.Base.Intrinsics.effMkCtor", "Vuna/Compiler/Base/Intrinsics.vuna:459"));
  ("Base_dIntrinsics.v_effNamedName", ("Vuna.Compiler.Base.Intrinsics.effNamedName", "Vuna/Compiler/Base/Intrinsics.vuna:421"));
  ("Base_dIntrinsics.v_effRowAppendName", ("Vuna.Compiler.Base.Intrinsics.effRowAppendName", "Vuna/Compiler/Base/Intrinsics.vuna:429"));
  ("Base_dIntrinsics.v_effRowConsCtor", ("Vuna.Compiler.Base.Intrinsics.effRowConsCtor", "Vuna/Compiler/Base/Intrinsics.vuna:417"));
  ("Base_dIntrinsics.v_effRowFamilyName", ("Vuna.Compiler.Base.Intrinsics.effRowFamilyName", "Vuna/Compiler/Base/Intrinsics.vuna:409"));
  ("Base_dIntrinsics.v_effRowNilCtor", ("Vuna.Compiler.Base.Intrinsics.effRowNilCtor", "Vuna/Compiler/Base/Intrinsics.vuna:413"));
  ("Base_dIntrinsics.v_effRowRemName", ("Vuna.Compiler.Base.Intrinsics.effRowRemName", "Vuna/Compiler/Base/Intrinsics.vuna:425"));
  ("Base_dIntrinsics.v_effRunName", ("Vuna.Compiler.Base.Intrinsics.effRunName", "Vuna/Compiler/Base/Intrinsics.vuna:302"));
  ("Base_dIntrinsics.v_effSendCoreIdName", ("Vuna.Compiler.Base.Intrinsics.effSendCoreIdName", "Vuna/Compiler/Base/Intrinsics.vuna:277"));
  ("Base_dIntrinsics.v_effSendCoreName", ("Vuna.Compiler.Base.Intrinsics.effSendCoreName", "Vuna/Compiler/Base/Intrinsics.vuna:274"));
  ("Base_dIntrinsics.v_effTypeName", ("Vuna.Compiler.Base.Intrinsics.effTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:445"));
  ("Base_dIntrinsics.v_effUnitTypeName", ("Vuna.Compiler.Base.Intrinsics.effUnitTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:455"));
  ("Base_dIntrinsics.v_ffiScalarNames", ("Vuna.Compiler.Base.Intrinsics.ffiScalarNames", "Vuna/Compiler/Base/Intrinsics.vuna:765"));
  ("Base_dIntrinsics.v_findCanonicalFamily", ("Vuna.Compiler.Base.Intrinsics.findCanonicalFamily", "Vuna/Compiler/Base/Intrinsics.vuna:730"));
  ("Base_dIntrinsics.v_findCanonicalFamilyGo", ("Vuna.Compiler.Base.Intrinsics.findCanonicalFamilyGo", "Vuna/Compiler/Base/Intrinsics.vuna:733"));
  ("Base_dIntrinsics.v_findIntrinsic", ("Vuna.Compiler.Base.Intrinsics.findIntrinsic", "Vuna/Compiler/Base/Intrinsics.vuna:1186"));
  ("Base_dIntrinsics.v_floatIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.floatIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:1160"));
  ("Base_dIntrinsics.v_floatIntrinsics", ("Vuna.Compiler.Base.Intrinsics.floatIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:938"));
  ("Base_dIntrinsics.v_floatTypeName", ("Vuna.Compiler.Base.Intrinsics.floatTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:614"));
  ("Base_dIntrinsics.v_fromFloatMethodName", ("Vuna.Compiler.Base.Intrinsics.fromFloatMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:803"));
  ("Base_dIntrinsics.v_fromFloatTypeName", ("Vuna.Compiler.Base.Intrinsics.fromFloatTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:799"));
  ("Base_dIntrinsics.v_fromIntMethodName", ("Vuna.Compiler.Base.Intrinsics.fromIntMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:795"));
  ("Base_dIntrinsics.v_fromIntTypeName", ("Vuna.Compiler.Base.Intrinsics.fromIntTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:791"));
  ("Base_dIntrinsics.v_fromStringMethodName", ("Vuna.Compiler.Base.Intrinsics.fromStringMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:787"));
  ("Base_dIntrinsics.v_fromStringTypeName", ("Vuna.Compiler.Base.Intrinsics.fromStringTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:783"));
  ("Base_dIntrinsics.v_hasFieldGetFieldName", ("Vuna.Compiler.Base.Intrinsics.hasFieldGetFieldName", "Vuna/Compiler/Base/Intrinsics.vuna:667"));
  ("Base_dIntrinsics.v_hasFieldLabelName", ("Vuna.Compiler.Base.Intrinsics.hasFieldLabelName", "Vuna/Compiler/Base/Intrinsics.vuna:659"));
  ("Base_dIntrinsics.v_hasFieldMethodName", ("Vuna.Compiler.Base.Intrinsics.hasFieldMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:671"));
  ("Base_dIntrinsics.v_hasFieldTraitName", ("Vuna.Compiler.Base.Intrinsics.hasFieldTraitName", "Vuna/Compiler/Base/Intrinsics.vuna:663"));
  ("Base_dIntrinsics.v_hostClassOf", ("Vuna.Compiler.Base.Intrinsics.hostClassOf", "Vuna/Compiler/Base/Intrinsics.vuna:230"));
  ("Base_dIntrinsics.v_hostClassOfRest", ("Vuna.Compiler.Base.Intrinsics.hostClassOfRest", "Vuna/Compiler/Base/Intrinsics.vuna:233"));
  ("Base_dIntrinsics.v_hostClassOfSendKey", ("Vuna.Compiler.Base.Intrinsics.hostClassOfSendKey", "Vuna/Compiler/Base/Intrinsics.vuna:245"));
  ("Base_dIntrinsics.v_hostClassOfSendKeyRest", ("Vuna.Compiler.Base.Intrinsics.hostClassOfSendKeyRest", "Vuna/Compiler/Base/Intrinsics.vuna:248"));
  ("Base_dIntrinsics.v_intTypeName", ("Vuna.Compiler.Base.Intrinsics.intTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:606"));
  ("Base_dIntrinsics.v_internalIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.internalIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:1150"));
  ("Base_dIntrinsics.v_internalIntrinsics", ("Vuna.Compiler.Base.Intrinsics.internalIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:1122"));
  ("Base_dIntrinsics.v_interpMethodName", ("Vuna.Compiler.Base.Intrinsics.interpMethodName", "Vuna/Compiler/Base/Intrinsics.vuna:778"));
  ("Base_dIntrinsics.v_interpTypeName", ("Vuna.Compiler.Base.Intrinsics.interpTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:774"));
  ("Base_dIntrinsics.v_intrinsicArity", ("Vuna.Compiler.Base.Intrinsics.intrinsicArity", "Vuna/Compiler/Base/Intrinsics.vuna:583"));
  ("Base_dIntrinsics.v_intrinsicName", ("Vuna.Compiler.Base.Intrinsics.intrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:563"));
  ("Base_dIntrinsics.v_intrinsicReturnsEff", ("Vuna.Compiler.Base.Intrinsics.intrinsicReturnsEff", "Vuna/Compiler/Base/Intrinsics.vuna:589"));
  ("Base_dIntrinsics.v_intrinsicSignature", ("Vuna.Compiler.Base.Intrinsics.intrinsicSignature", "Vuna/Compiler/Base/Intrinsics.vuna:567"));
  ("Base_dIntrinsics.v_intrinsicTbl", ("Vuna.Compiler.Base.Intrinsics.intrinsicTbl", "Vuna/Compiler/Base/Intrinsics.vuna:1181"));
  ("Base_dIntrinsics.v_intrinsicVisible", ("Vuna.Compiler.Base.Intrinsics.intrinsicVisible", "Vuna/Compiler/Base/Intrinsics.vuna:571"));
  ("Base_dIntrinsics.v_isBoolCanonical", ("Vuna.Compiler.Base.Intrinsics.isBoolCanonical", "Vuna/Compiler/Base/Intrinsics.vuna:754"));
  ("Base_dIntrinsics.v_isBuiltinEffectTag", ("Vuna.Compiler.Base.Intrinsics.isBuiltinEffectTag", "Vuna/Compiler/Base/Intrinsics.vuna:264"));
  ("Base_dIntrinsics.v_isDebugOnlyName", ("Vuna.Compiler.Base.Intrinsics.isDebugOnlyName", "Vuna/Compiler/Base/Intrinsics.vuna:396"));
  ("Base_dIntrinsics.v_isFfiScalarName", ("Vuna.Compiler.Base.Intrinsics.isFfiScalarName", "Vuna/Compiler/Base/Intrinsics.vuna:769"));
  ("Base_dIntrinsics.v_isIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.isIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:1190"));
  ("Base_dIntrinsics.v_isIntrinsicTypeName", ("Vuna.Compiler.Base.Intrinsics.isIntrinsicTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:643"));
  ("Base_dIntrinsics.v_isSendCoreName", ("Vuna.Compiler.Base.Intrinsics.isSendCoreName", "Vuna/Compiler/Base/Intrinsics.vuna:281"));
  ("Base_dIntrinsics.v_isTypeConstructorName", ("Vuna.Compiler.Base.Intrinsics.isTypeConstructorName", "Vuna/Compiler/Base/Intrinsics.vuna:122"));
  ("Base_dIntrinsics.v_isUnboxedCanonical", ("Vuna.Compiler.Base.Intrinsics.isUnboxedCanonical", "Vuna/Compiler/Base/Intrinsics.vuna:746"));
  ("Base_dIntrinsics.v_listConsCtor", ("Vuna.Compiler.Base.Intrinsics.listConsCtor", "Vuna/Compiler/Base/Intrinsics.vuna:655"));
  ("Base_dIntrinsics.v_listFamilyName", ("Vuna.Compiler.Base.Intrinsics.listFamilyName", "Vuna/Compiler/Base/Intrinsics.vuna:647"));
  ("Base_dIntrinsics.v_listNilCtor", ("Vuna.Compiler.Base.Intrinsics.listNilCtor", "Vuna/Compiler/Base/Intrinsics.vuna:651"));
  ("Base_dIntrinsics.v_logEmitIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.logEmitIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:334"));
  ("Base_dIntrinsics.v_logIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.logIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:1129"));
  ("Base_dIntrinsics.v_logOnIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.logOnIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:330"));
  ("Base_dIntrinsics.v_mainShowDefName", ("Vuna.Compiler.Base.Intrinsics.mainShowDefName", "Vuna/Compiler/Base/Intrinsics.vuna:298"));
  ("Base_dIntrinsics.v_natSuccCtor", ("Vuna.Compiler.Base.Intrinsics.natSuccCtor", "Vuna/Compiler/Base/Intrinsics.vuna:639"));
  ("Base_dIntrinsics.v_natTypeName", ("Vuna.Compiler.Base.Intrinsics.natTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:631"));
  ("Base_dIntrinsics.v_natZeroCtor", ("Vuna.Compiler.Base.Intrinsics.natZeroCtor", "Vuna/Compiler/Base/Intrinsics.vuna:635"));
  ("Base_dIntrinsics.v_obsCounterIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsCounterIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:364"));
  ("Base_dIntrinsics.v_obsIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.obsIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:1135"));
  ("Base_dIntrinsics.v_obsLevelIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsLevelIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:349"));
  ("Base_dIntrinsics.v_obsMarkIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsMarkIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:368"));
  ("Base_dIntrinsics.v_obsSampleStartIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSampleStartIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:380"));
  ("Base_dIntrinsics.v_obsSampleStopIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSampleStopIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:384"));
  ("Base_dIntrinsics.v_obsSpanBeginIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSpanBeginIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:372"));
  ("Base_dIntrinsics.v_obsSpanEndIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSpanEndIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:376"));
  ("Base_dIntrinsics.v_obsSpanIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSpanIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:353"));
  ("Base_dIntrinsics.v_obsSpanLabIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.obsSpanLabIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:360"));
  ("Base_dIntrinsics.v_preludeTypeNames", ("Vuna.Compiler.Base.Intrinsics.preludeTypeNames", "Vuna/Compiler/Base/Intrinsics.vuna:468"));
  ("Base_dIntrinsics.v_preludeValueNames", ("Vuna.Compiler.Base.Intrinsics.preludeValueNames", "Vuna/Compiler/Base/Intrinsics.vuna:1201"));
  ("Base_dIntrinsics.v_primEffBind1Name", ("Vuna.Compiler.Base.Intrinsics.primEffBind1Name", "Vuna/Compiler/Base/Intrinsics.vuna:286"));
  ("Base_dIntrinsics.v_primEraseName", ("Vuna.Compiler.Base.Intrinsics.primEraseName", "Vuna/Compiler/Base/Intrinsics.vuna:292"));
  ("Base_dIntrinsics.v_strTypeName", ("Vuna.Compiler.Base.Intrinsics.strTypeName", "Vuna/Compiler/Base/Intrinsics.vuna:610"));
  ("Base_dIntrinsics.v_todoIntrinsicName", ("Vuna.Compiler.Base.Intrinsics.todoIntrinsicName", "Vuna/Compiler/Base/Intrinsics.vuna:392"));
  ("Base_dIntrinsics.v_typeIntrinsicArities", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicArities", "Vuna/Compiler/Base/Intrinsics.vuna:93"));
  ("Base_dIntrinsics.v_typeIntrinsicArityOf", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicArityOf", "Vuna/Compiler/Base/Intrinsics.vuna:104"));
  ("Base_dIntrinsics.v_typeIntrinsicArityOfRest", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicArityOfRest", "Vuna/Compiler/Base/Intrinsics.vuna:108"));
  ("Base_dIntrinsics.v_typeIntrinsicCtorArity", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicCtorArity", "Vuna/Compiler/Base/Intrinsics.vuna:89"));
  ("Base_dIntrinsics.v_typeIntrinsicCtorName", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicCtorName", "Vuna/Compiler/Base/Intrinsics.vuna:85"));
  ("Base_dIntrinsics.v_typeIntrinsicCtorNames", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicCtorNames", "Vuna/Compiler/Base/Intrinsics.vuna:117"));
  ("Base_dIntrinsics.v_typeIntrinsicNames", ("Vuna.Compiler.Base.Intrinsics.typeIntrinsicNames", "Vuna/Compiler/Base/Intrinsics.vuna:602"));
  ("Base_dIntrinsics.v_typeReturnsEff", ("Vuna.Compiler.Base.Intrinsics.typeReturnsEff", "Vuna/Compiler/Base/Intrinsics.vuna:593"));
  ("Base_dIntrinsics.v_userIntrinsics", ("Vuna.Compiler.Base.Intrinsics.userIntrinsics", "Vuna/Compiler/Base/Intrinsics.vuna:1197"));
  ("Base_dObs.v_obsCheck", ("Vuna.Compiler.Base.Obs.obsCheck", "Vuna/Compiler/Base/Obs.vuna:27"));
  ("Base_dObs.v_obsCountAt", ("Vuna.Compiler.Base.Obs.obsCountAt", "Vuna/Compiler/Base/Obs.vuna:38"));
  ("Base_dObs.v_obsCountEff", ("Vuna.Compiler.Base.Obs.obsCountEff", "Vuna/Compiler/Base/Obs.vuna:59"));
  ("Base_dObs.v_obsDefCheck", ("Vuna.Compiler.Base.Obs.obsDefCheck", "Vuna/Compiler/Base/Obs.vuna:49"));
  ("Base_dObs.v_obsDefCheckAt", ("Vuna.Compiler.Base.Obs.obsDefCheckAt", "Vuna/Compiler/Base/Obs.vuna:44"));
  ("Base_dObs.v_obsMarkEff", ("Vuna.Compiler.Base.Obs.obsMarkEff", "Vuna/Compiler/Base/Obs.vuna:53"));
  ("Base_dObs.v_obsPure", ("Vuna.Compiler.Base.Obs.obsPure", "Vuna/Compiler/Base/Obs.vuna:32"));
  ("Base_dSource.v__usimilarName", ("Vuna.Compiler.Base.Source._similarName", "Vuna/Compiler/Base/Source.vuna:259"));
  ("Base_dSource.v_baseName", ("Vuna.Compiler.Base.Source.baseName", "Vuna/Compiler/Base/Source.vuna:229"));
  ("Base_dSource.v_containsDot", ("Vuna.Compiler.Base.Source.containsDot", "Vuna/Compiler/Base/Source.vuna:133"));
  ("Base_dSource.v_dotsRest", ("Vuna.Compiler.Base.Source.dotsRest", "Vuna/Compiler/Base/Source.vuna:174"));
  ("Base_dSource.v_dropPastSlash", ("Vuna.Compiler.Base.Source.dropPastSlash", "Vuna/Compiler/Base/Source.vuna:247"));
  ("Base_dSource.v_isSpanEmpty", ("Vuna.Compiler.Base.Source.isSpanEmpty", "Vuna/Compiler/Base/Source.vuna:98"));
  ("Base_dSource.v_joinArrows", ("Vuna.Compiler.Base.Source.joinArrows", "Vuna/Compiler/Base/Source.vuna:209"));
  ("Base_dSource.v_joinDots", ("Vuna.Compiler.Base.Source.joinDots", "Vuna/Compiler/Base/Source.vuna:166"));
  ("Base_dSource.v_joinDotsParts", ("Vuna.Compiler.Base.Source.joinDotsParts", "Vuna/Compiler/Base/Source.vuna:170"));
  ("Base_dSource.v_joinSlashes", ("Vuna.Compiler.Base.Source.joinSlashes", "Vuna/Compiler/Base/Source.vuna:203"));
  ("Base_dSource.v_lastSeg", ("Vuna.Compiler.Base.Source.lastSeg", "Vuna/Compiler/Base/Source.vuna:182"));
  ("Base_dSource.v_lastSegGo", ("Vuna.Compiler.Base.Source.lastSegGo", "Vuna/Compiler/Base/Source.vuna:185"));
  ("Base_dSource.v_lengthDiffLE", ("Vuna.Compiler.Base.Source.lengthDiffLE", "Vuna/Compiler/Base/Source.vuna:281"));
  ("Base_dSource.v_memChar", ("Vuna.Compiler.Base.Source.memChar", "Vuna/Compiler/Base/Source.vuna:120"));
  ("Base_dSource.v_parentOfPath", ("Vuna.Compiler.Base.Source.parentOfPath", "Vuna/Compiler/Base/Source.vuna:234"));
  ("Base_dSource.v_posCol", ("Vuna.Compiler.Base.Source.posCol", "Vuna/Compiler/Base/Source.vuna:50"));
  ("Base_dSource.v_posEndOffset", ("Vuna.Compiler.Base.Source.posEndOffset", "Vuna/Compiler/Base/Source.vuna:58"));
  ("Base_dSource.v_posLine", ("Vuna.Compiler.Base.Source.posLine", "Vuna/Compiler/Base/Source.vuna:46"));
  ("Base_dSource.v_posOffset", ("Vuna.Compiler.Base.Source.posOffset", "Vuna/Compiler/Base/Source.vuna:54"));
  ("Base_dSource.v_prefixLen2", ("Vuna.Compiler.Base.Source.prefixLen2", "Vuna/Compiler/Base/Source.vuna:275"));
  ("Base_dSource.v_prefixOfName", ("Vuna.Compiler.Base.Source.prefixOfName", "Vuna/Compiler/Base/Source.vuna:197"));
  ("Base_dSource.v_scanFor", ("Vuna.Compiler.Base.Source.scanFor", "Vuna/Compiler/Base/Source.vuna:126"));
  ("Base_dSource.v_showSpanLoc", ("Vuna.Compiler.Base.Source.showSpanLoc", "Vuna/Compiler/Base/Source.vuna:90"));
  ("Base_dSource.v_spanAtName", ("Vuna.Compiler.Base.Source.spanAtName", "Vuna/Compiler/Base/Source.vuna:104"));
  ("Base_dSource.v_spanEmpty", ("Vuna.Compiler.Base.Source.spanEmpty", "Vuna/Compiler/Base/Source.vuna:94"));
  ("Base_dSource.v_spanEndCol", ("Vuna.Compiler.Base.Source.spanEndCol", "Vuna/Compiler/Base/Source.vuna:74"));
  ("Base_dSource.v_spanEndLine", ("Vuna.Compiler.Base.Source.spanEndLine", "Vuna/Compiler/Base/Source.vuna:70"));
  ("Base_dSource.v_spanEndOffset", ("Vuna.Compiler.Base.Source.spanEndOffset", "Vuna/Compiler/Base/Source.vuna:82"));
  ("Base_dSource.v_spanFile", ("Vuna.Compiler.Base.Source.spanFile", "Vuna/Compiler/Base/Source.vuna:86"));
  ("Base_dSource.v_spanStartCol", ("Vuna.Compiler.Base.Source.spanStartCol", "Vuna/Compiler/Base/Source.vuna:66"));
  ("Base_dSource.v_spanStartLine", ("Vuna.Compiler.Base.Source.spanStartLine", "Vuna/Compiler/Base/Source.vuna:62"));
  ("Base_dSource.v_spanStartOffset", ("Vuna.Compiler.Base.Source.spanStartOffset", "Vuna/Compiler/Base/Source.vuna:78"));
  ("Base_dSource.v_splitLastDot", ("Vuna.Compiler.Base.Source.splitLastDot", "Vuna/Compiler/Base/Source.vuna:159"));
  ("Base_dSource.v_splitOnChar", ("Vuna.Compiler.Base.Source.splitOnChar", "Vuna/Compiler/Base/Source.vuna:141"));
  ("Base_dSource.v_splitOnCharGo", ("Vuna.Compiler.Base.Source.splitOnCharGo", "Vuna/Compiler/Base/Source.vuna:146"));
  ("Base_dSource.v_splitOnDot", ("Vuna.Compiler.Base.Source.splitOnDot", "Vuna/Compiler/Base/Source.vuna:137"));
  ("Base_dSource.v_splitPath", ("Vuna.Compiler.Base.Source.splitPath", "Vuna/Compiler/Base/Source.vuna:216"));
  ("Base_dSource.v_splitPathChars", ("Vuna.Compiler.Base.Source.splitPathChars", "Vuna/Compiler/Base/Source.vuna:220"));
  ("Base_dSource.v_suggest", ("Vuna.Compiler.Base.Source.suggest", "Vuna/Compiler/Base/Source.vuna:252"));
  ("Base_dStore.v_breakFirstNewline", ("Vuna.Compiler.Base.Store.breakFirstNewline", "Vuna/Compiler/Base/Store.vuna:88"));
  ("Base_dStore.v_claimAt", ("Vuna.Compiler.Base.Store.claimAt", "Vuna/Compiler/Base/Store.vuna:465"));
  ("Base_dStore.v_dirReady", ("Vuna.Compiler.Base.Store.dirReady", "Vuna/Compiler/Base/Store.vuna:355"));
  ("Base_dStore.v_dirUnder", ("Vuna.Compiler.Base.Store.dirUnder", "Vuna/Compiler/Base/Store.vuna:180"));
  ("Base_dStore.v_fCodecOf", ("Vuna.Compiler.Base.Store.fCodecOf", "Vuna/Compiler/Base/Store.vuna:59"));
  ("Base_dStore.v_fPayloadOf", ("Vuna.Compiler.Base.Store.fPayloadOf", "Vuna/Compiler/Base/Store.vuna:62"));
  ("Base_dStore.v_fTagOf", ("Vuna.Compiler.Base.Store.fTagOf", "Vuna/Compiler/Base/Store.vuna:56"));
  ("Base_dStore.v_frameHeader", ("Vuna.Compiler.Base.Store.frameHeader", "Vuna/Compiler/Base/Store.vuna:66"));
  ("Base_dStore.v_frameSplit", ("Vuna.Compiler.Base.Store.frameSplit", "Vuna/Compiler/Base/Store.vuna:96"));
  ("Base_dStore.v_headerDigestOf", ("Vuna.Compiler.Base.Store.headerDigestOf", "Vuna/Compiler/Base/Store.vuna:128"));
  ("Base_dStore.v_headerFields", ("Vuna.Compiler.Base.Store.headerFields", "Vuna/Compiler/Base/Store.vuna:82"));
  ("Base_dStore.v_headerOk", ("Vuna.Compiler.Base.Store.headerOk", "Vuna/Compiler/Base/Store.vuna:110"));
  ("Base_dStore.v_homeStoreRootEff", ("Vuna.Compiler.Base.Store.homeStoreRootEff", "Vuna/Compiler/Base/Store.vuna:186"));
  ("Base_dStore.v_insertRootLine", ("Vuna.Compiler.Base.Store.insertRootLine", "Vuna/Compiler/Base/Store.vuna:561"));
  ("Base_dStore.v_mergeRootLines", ("Vuna.Compiler.Base.Store.mergeRootLines", "Vuna/Compiler/Base/Store.vuna:564"));
  ("Base_dStore.v_objectPathIn", ("Vuna.Compiler.Base.Store.objectPathIn", "Vuna/Compiler/Base/Store.vuna:370"));
  ("Base_dStore.v_projectPathFileName", ("Vuna.Compiler.Base.Store.projectPathFileName", "Vuna/Compiler/Base/Store.vuna:570"));
  ("Base_dStore.v_scratchStale", ("Vuna.Compiler.Base.Store.scratchStale", "Vuna/Compiler/Base/Store.vuna:501"));
  ("Base_dStore.v_scratchStaleSec", ("Vuna.Compiler.Base.Store.scratchStaleSec", "Vuna/Compiler/Base/Store.vuna:498"));
  ("Base_dStore.v_storeCacheBaseEff", ("Vuna.Compiler.Base.Store.storeCacheBaseEff", "Vuna/Compiler/Base/Store.vuna:201"));
  ("Base_dStore.v_storeDataRootEff", ("Vuna.Compiler.Base.Store.storeDataRootEff", "Vuna/Compiler/Base/Store.vuna:170"));
  ("Base_dStore.v_storeDecode", ("Vuna.Compiler.Base.Store.storeDecode", "Vuna/Compiler/Base/Store.vuna:135"));
  ("Base_dStore.v_storeDecodeAs", ("Vuna.Compiler.Base.Store.storeDecodeAs", "Vuna/Compiler/Base/Store.vuna:152"));
  ("Base_dStore.v_storeDropPastSlash", ("Vuna.Compiler.Base.Store.storeDropPastSlash", "Vuna/Compiler/Base/Store.vuna:314"));
  ("Base_dStore.v_storeEncode", ("Vuna.Compiler.Base.Store.storeEncode", "Vuna/Compiler/Base/Store.vuna:70"));
  ("Base_dStore.v_storeEncodeAs", ("Vuna.Compiler.Base.Store.storeEncodeAs", "Vuna/Compiler/Base/Store.vuna:78"));
  ("Base_dStore.v_storeEnsureDirEff", ("Vuna.Compiler.Base.Store.storeEnsureDirEff", "Vuna/Compiler/Base/Store.vuna:274"));
  ("Base_dStore.v_storeEnsureDirFuel", ("Vuna.Compiler.Base.Store.storeEnsureDirFuel", "Vuna/Compiler/Base/Store.vuna:282"));
  ("Base_dStore.v_storeFileExistsEff", ("Vuna.Compiler.Base.Store.storeFileExistsEff", "Vuna/Compiler/Base/Store.vuna:267"));
  ("Base_dStore.v_storeMagic", ("Vuna.Compiler.Base.Store.storeMagic", "Vuna/Compiler/Base/Store.vuna:47"));
  ("Base_dStore.v_storeObjectExistsEff", ("Vuna.Compiler.Base.Store.storeObjectExistsEff", "Vuna/Compiler/Base/Store.vuna:380"));
  ("Base_dStore.v_storeObjectListEff", ("Vuna.Compiler.Base.Store.storeObjectListEff", "Vuna/Compiler/Base/Store.vuna:407"));
  ("Base_dStore.v_storeObjectPathEff", ("Vuna.Compiler.Base.Store.storeObjectPathEff", "Vuna/Compiler/Base/Store.vuna:373"));
  ("Base_dStore.v_storeObjectReadEff", ("Vuna.Compiler.Base.Store.storeObjectReadEff", "Vuna/Compiler/Base/Store.vuna:387"));
  ("Base_dStore.v_storeObjectRemoveEff", ("Vuna.Compiler.Base.Store.storeObjectRemoveEff", "Vuna/Compiler/Base/Store.vuna:418"));
  ("Base_dStore.v_storeObjectTag", ("Vuna.Compiler.Base.Store.storeObjectTag", "Vuna/Compiler/Base/Store.vuna:367"));
  ("Base_dStore.v_storeObjectWriteEff", ("Vuna.Compiler.Base.Store.storeObjectWriteEff", "Vuna/Compiler/Base/Store.vuna:396"));
  ("Base_dStore.v_storeParentOf", ("Vuna.Compiler.Base.Store.storeParentOf", "Vuna/Compiler/Base/Store.vuna:298"));
  ("Base_dStore.v_storeParentPathOf", ("Vuna.Compiler.Base.Store.storeParentPathOf", "Vuna/Compiler/Base/Store.vuna:311"));
  ("Base_dStore.v_storeProjectPathEff", ("Vuna.Compiler.Base.Store.storeProjectPathEff", "Vuna/Compiler/Base/Store.vuna:591"));
  ("Base_dStore.v_storeProjectPathRecordEff", ("Vuna.Compiler.Base.Store.storeProjectPathRecordEff", "Vuna/Compiler/Base/Store.vuna:574"));
  ("Base_dStore.v_storeReadAsEff", ("Vuna.Compiler.Base.Store.storeReadAsEff", "Vuna/Compiler/Base/Store.vuna:217"));
  ("Base_dStore.v_storeReadEff", ("Vuna.Compiler.Base.Store.storeReadEff", "Vuna/Compiler/Base/Store.vuna:205"));
  ("Base_dStore.v_storeRemoveEff", ("Vuna.Compiler.Base.Store.storeRemoveEff", "Vuna/Compiler/Base/Store.vuna:270"));
  ("Base_dStore.v_storeRootAppendEff", ("Vuna.Compiler.Base.Store.storeRootAppendEff", "Vuna/Compiler/Base/Store.vuna:608"));
  ("Base_dStore.v_storeRootEff", ("Vuna.Compiler.Base.Store.storeRootEff", "Vuna/Compiler/Base/Store.vuna:337"));
  ("Base_dStore.v_storeRootLoadEff", ("Vuna.Compiler.Base.Store.storeRootLoadEff", "Vuna/Compiler/Base/Store.vuna:626"));
  ("Base_dStore.v_storeRootProjectListEff", ("Vuna.Compiler.Base.Store.storeRootProjectListEff", "Vuna/Compiler/Base/Store.vuna:639"));
  ("Base_dStore.v_storeRootReadyEff", ("Vuna.Compiler.Base.Store.storeRootReadyEff", "Vuna/Compiler/Base/Store.vuna:341"));
  ("Base_dStore.v_storeRootRemoveEff", ("Vuna.Compiler.Base.Store.storeRootRemoveEff", "Vuna/Compiler/Base/Store.vuna:650"));
  ("Base_dStore.v_storeRootsPathEff", ("Vuna.Compiler.Base.Store.storeRootsPathEff", "Vuna/Compiler/Base/Store.vuna:554"));
  ("Base_dStore.v_storeScratchClaimEff", ("Vuna.Compiler.Base.Store.storeScratchClaimEff", "Vuna/Compiler/Base/Store.vuna:509"));
  ("Base_dStore.v_storeScratchDropEff", ("Vuna.Compiler.Base.Store.storeScratchDropEff", "Vuna/Compiler/Base/Store.vuna:531"));
  ("Base_dStore.v_storeScratchPathEff", ("Vuna.Compiler.Base.Store.storeScratchPathEff", "Vuna/Compiler/Base/Store.vuna:491"));
  ("Base_dStore.v_storeScratchPathIn", ("Vuna.Compiler.Base.Store.storeScratchPathIn", "Vuna/Compiler/Base/Store.vuna:488"));
  ("Base_dStore.v_storeScratchPathOfClaim", ("Vuna.Compiler.Base.Store.storeScratchPathOfClaim", "Vuna/Compiler/Base/Store.vuna:527"));
  ("Base_dStore.v_storeViewLockEff", ("Vuna.Compiler.Base.Store.storeViewLockEff", "Vuna/Compiler/Base/Store.vuna:455"));
  ("Base_dStore.v_storeViewPathEff", ("Vuna.Compiler.Base.Store.storeViewPathEff", "Vuna/Compiler/Base/Store.vuna:432"));
  ("Base_dStore.v_storeViewPublishEff", ("Vuna.Compiler.Base.Store.storeViewPublishEff", "Vuna/Compiler/Base/Store.vuna:538"));
  ("Base_dStore.v_storeViewUnlockEff", ("Vuna.Compiler.Base.Store.storeViewUnlockEff", "Vuna/Compiler/Base/Store.vuna:481"));
  ("Base_dStore.v_storeViewValidEff", ("Vuna.Compiler.Base.Store.storeViewValidEff", "Vuna/Compiler/Base/Store.vuna:438"));
  ("Base_dStore.v_storeWriteAsEff", ("Vuna.Compiler.Base.Store.storeWriteAsEff", "Vuna/Compiler/Base/Store.vuna:235"));
  ("Base_dStore.v_storeWriteEff", ("Vuna.Compiler.Base.Store.storeWriteEff", "Vuna/Compiler/Base/Store.vuna:231"));
  ("Base_dStore.v_storeWriteIfChangedAsEff", ("Vuna.Compiler.Base.Store.storeWriteIfChangedAsEff", "Vuna/Compiler/Base/Store.vuna:254"));
  ("Base_dStore.v_storeWriteIfChangedEff", ("Vuna.Compiler.Base.Store.storeWriteIfChangedEff", "Vuna/Compiler/Base/Store.vuna:240"));
  ("Base_dStore.v_tmpStoreRootEff", ("Vuna.Compiler.Base.Store.tmpStoreRootEff", "Vuna/Compiler/Base/Store.vuna:193"));
  ("Base_dStore.v_writeRootFiles", ("Vuna.Compiler.Base.Store.writeRootFiles", "Vuna/Compiler/Base/Store.vuna:616"));
  ("Base_dVersion.v_vunaVersion", ("Vuna.Compiler.Base.Version.vunaVersion", "Vuna/Compiler/Base/Version.vuna:12"));
  ("Base_dWalk.v_collectFilesEff", ("Vuna.Compiler.Base.Walk.collectFilesEff", "Vuna/Compiler/Base/Walk.vuna:23"));
  ("Base_dWalk.v_collectGo", ("Vuna.Compiler.Base.Walk.collectGo", "Vuna/Compiler/Base/Walk.vuna:37"));
  ("Base_dWalk.v_concatMapEff", ("Vuna.Compiler.Base.Walk.concatMapEff", "Vuna/Compiler/Base/Walk.vuna:80"));
  ("Base_dWalk.v_pathExistsDir", ("Vuna.Compiler.Base.Walk.pathExistsDir", "Vuna/Compiler/Base/Walk.vuna:73"));
  ("Base_dWalk.v_walkFuelExhausted", ("Vuna.Compiler.Base.Walk.walkFuelExhausted", "Vuna/Compiler/Base/Walk.vuna:18"));
  ("Base_dWalk.v_walkName", ("Vuna.Compiler.Base.Walk.walkName", "Vuna/Compiler/Base/Walk.vuna:48"));
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
  ("Core_dConv.v_absPatternBody", ("Vuna.Compiler.Core.Conv.absPatternBody", "Vuna/Compiler/Core/Conv.vuna:647"));
  ("Core_dConv.v_altsScopedTo", ("Vuna.Compiler.Core.Conv.altsScopedTo", "Vuna/Compiler/Core/Conv.vuna:601"));
  ("Core_dConv.v_argsScopedTo", ("Vuna.Compiler.Core.Conv.argsScopedTo", "Vuna/Compiler/Core/Conv.vuna:596"));
  ("Core_dConv.v_conv", ("Vuna.Compiler.Core.Conv.conv", "Vuna/Compiler/Core/Conv.vuna:824"));
  ("Core_dConv.v_convBoth", ("Vuna.Compiler.Core.Conv.convBoth", "Vuna/Compiler/Core/Conv.vuna:834"));
  ("Core_dConv.v_convBothFuel", ("Vuna.Compiler.Core.Conv.convBothFuel", "Vuna/Compiler/Core/Conv.vuna:354"));
  ("Core_dConv.v_convCaseAlts", ("Vuna.Compiler.Core.Conv.convCaseAlts", "Vuna/Compiler/Core/Conv.vuna:837"));
  ("Core_dConv.v_convCaseAltsFuel", ("Vuna.Compiler.Core.Conv.convCaseAltsFuel", "Vuna/Compiler/Core/Conv.vuna:492"));
  ("Core_dConv.v_convFuel", ("Vuna.Compiler.Core.Conv.convFuel", "Vuna/Compiler/Core/Conv.vuna:335"));
  ("Core_dConv.v_convFuelBase", ("Vuna.Compiler.Core.Conv.convFuelBase", "Vuna/Compiler/Core/Conv.vuna:199"));
  ("Core_dConv.v_convFuelFor", ("Vuna.Compiler.Core.Conv.convFuelFor", "Vuna/Compiler/Core/Conv.vuna:227"));
  ("Core_dConv.v_convFuelMax", ("Vuna.Compiler.Core.Conv.convFuelMax", "Vuna/Compiler/Core/Conv.vuna:234"));
  ("Core_dConv.v_convNatApplied", ("Vuna.Compiler.Core.Conv.convNatApplied", "Vuna/Compiler/Core/Conv.vuna:265"));
  ("Core_dConv.v_convNatChains", ("Vuna.Compiler.Core.Conv.convNatChains", "Vuna/Compiler/Core/Conv.vuna:245"));
  ("Core_dConv.v_convNatFuel", ("Vuna.Compiler.Core.Conv.convNatFuel", "Vuna/Compiler/Core/Conv.vuna:237"));
  ("Core_dConv.v_convNatNear", ("Vuna.Compiler.Core.Conv.convNatNear", "Vuna/Compiler/Core/Conv.vuna:205"));
  ("Core_dConv.v_convNatNeutral", ("Vuna.Compiler.Core.Conv.convNatNeutral", "Vuna/Compiler/Core/Conv.vuna:255"));
  ("Core_dConv.v_convNeutral", ("Vuna.Compiler.Core.Conv.convNeutral", "Vuna/Compiler/Core/Conv.vuna:846"));
  ("Core_dConv.v_convNeutralFuel", ("Vuna.Compiler.Core.Conv.convNeutralFuel", "Vuna/Compiler/Core/Conv.vuna:452"));
  ("Core_dConv.v_convOneAlt", ("Vuna.Compiler.Core.Conv.convOneAlt", "Vuna/Compiler/Core/Conv.vuna:840"));
  ("Core_dConv.v_convOneAltFuel", ("Vuna.Compiler.Core.Conv.convOneAltFuel", "Vuna/Compiler/Core/Conv.vuna:509"));
  ("Core_dConv.v_convSpines", ("Vuna.Compiler.Core.Conv.convSpines", "Vuna/Compiler/Core/Conv.vuna:849"));
  ("Core_dConv.v_convSpinesFuel", ("Vuna.Compiler.Core.Conv.convSpinesFuel", "Vuna/Compiler/Core/Conv.vuna:467"));
  ("Core_dConv.v_convValueLists", ("Vuna.Compiler.Core.Conv.convValueLists", "Vuna/Compiler/Core/Conv.vuna:843"));
  ("Core_dConv.v_convValueListsFuel", ("Vuna.Compiler.Core.Conv.convValueListsFuel", "Vuna/Compiler/Core/Conv.vuna:479"));
  ("Core_dConv.v_etaLeft", ("Vuna.Compiler.Core.Conv.etaLeft", "Vuna/Compiler/Core/Conv.vuna:852"));
  ("Core_dConv.v_etaLeftFuel", ("Vuna.Compiler.Core.Conv.etaLeftFuel", "Vuna/Compiler/Core/Conv.vuna:434"));
  ("Core_dConv.v_etaRight", ("Vuna.Compiler.Core.Conv.etaRight", "Vuna/Compiler/Core/Conv.vuna:855"));
  ("Core_dConv.v_etaRightFuel", ("Vuna.Compiler.Core.Conv.etaRightFuel", "Vuna/Compiler/Core/Conv.vuna:443"));
  ("Core_dConv.v_fastSame", ("Vuna.Compiler.Core.Conv.fastSame", "Vuna/Compiler/Core/Conv.vuna:26"));
  ("Core_dConv.v_fastSameSols", ("Vuna.Compiler.Core.Conv.fastSameSols", "Vuna/Compiler/Core/Conv.vuna:313"));
  ("Core_dConv.v_isNatCtorName", ("Vuna.Compiler.Core.Conv.isNatCtorName", "Vuna/Compiler/Core/Conv.vuna:79"));
  ("Core_dConv.v_isNatLikeHead", ("Vuna.Compiler.Core.Conv.isNatLikeHead", "Vuna/Compiler/Core/Conv.vuna:154"));
  ("Core_dConv.v_isNatLikeValue", ("Vuna.Compiler.Core.Conv.isNatLikeValue", "Vuna/Compiler/Core/Conv.vuna:145"));
  ("Core_dConv.v_isNilList", ("Vuna.Compiler.Core.Conv.isNilList", "Vuna/Compiler/Core/Conv.vuna:280"));
  ("Core_dConv.v_isNilSpine", ("Vuna.Compiler.Core.Conv.isNilSpine", "Vuna/Compiler/Core/Conv.vuna:624"));
  ("Core_dConv.v_levelPos", ("Vuna.Compiler.Core.Conv.levelPos", "Vuna/Compiler/Core/Conv.vuna:632"));
  ("Core_dConv.v_levelPosGo", ("Vuna.Compiler.Core.Conv.levelPosGo", "Vuna/Compiler/Core/Conv.vuna:635"));
  ("Core_dConv.v_memLevel", ("Vuna.Compiler.Core.Conv.memLevel", "Vuna/Compiler/Core/Conv.vuna:628"));
  ("Core_dConv.v_metaCreatedDepth", ("Vuna.Compiler.Core.Conv.metaCreatedDepth", "Vuna/Compiler/Core/Conv.vuna:542"));
  ("Core_dConv.v_mismatchAt", ("Vuna.Compiler.Core.Conv.mismatchAt", "Vuna/Compiler/Core/Conv.vuna:520"));
  ("Core_dConv.v_natChainMaxValue", ("Vuna.Compiler.Core.Conv.natChainMaxValue", "Vuna/Compiler/Core/Conv.vuna:83"));
  ("Core_dConv.v_natChainNextValue", ("Vuna.Compiler.Core.Conv.natChainNextValue", "Vuna/Compiler/Core/Conv.vuna:86"));
  ("Core_dConv.v_natFoldApplied", ("Vuna.Compiler.Core.Conv.natFoldApplied", "Vuna/Compiler/Core/Conv.vuna:121"));
  ("Core_dConv.v_natFoldArgs", ("Vuna.Compiler.Core.Conv.natFoldArgs", "Vuna/Compiler/Core/Conv.vuna:108"));
  ("Core_dConv.v_natFoldGo", ("Vuna.Compiler.Core.Conv.natFoldGo", "Vuna/Compiler/Core/Conv.vuna:94"));
  ("Core_dConv.v_natFoldSucc", ("Vuna.Compiler.Core.Conv.natFoldSucc", "Vuna/Compiler/Core/Conv.vuna:129"));
  ("Core_dConv.v_natFoldValue", ("Vuna.Compiler.Core.Conv.natFoldValue", "Vuna/Compiler/Core/Conv.vuna:91"));
  ("Core_dConv.v_natPrefixDepth", ("Vuna.Compiler.Core.Conv.natPrefixDepth", "Vuna/Compiler/Core/Conv.vuna:163"));
  ("Core_dConv.v_natPrefixGo", ("Vuna.Compiler.Core.Conv.natPrefixGo", "Vuna/Compiler/Core/Conv.vuna:166"));
  ("Core_dConv.v_natPrefixMax", ("Vuna.Compiler.Core.Conv.natPrefixMax", "Vuna/Compiler/Core/Conv.vuna:219"));
  ("Core_dConv.v_patternEnv", ("Vuna.Compiler.Core.Conv.patternEnv", "Vuna/Compiler/Core/Conv.vuna:708"));
  ("Core_dConv.v_patternSolution", ("Vuna.Compiler.Core.Conv.patternSolution", "Vuna/Compiler/Core/Conv.vuna:720"));
  ("Core_dConv.v_patternSpineOf", ("Vuna.Compiler.Core.Conv.patternSpineOf", "Vuna/Compiler/Core/Conv.vuna:608"));
  ("Core_dConv.v_sameNatValue", ("Vuna.Compiler.Core.Conv.sameNatValue", "Vuna/Compiler/Core/Conv.vuna:135"));
  ("Core_dConv.v_sameNeutralAtom", ("Vuna.Compiler.Core.Conv.sameNeutralAtom", "Vuna/Compiler/Core/Conv.vuna:284"));
  ("Core_dConv.v_sameSpineFast", ("Vuna.Compiler.Core.Conv.sameSpineFast", "Vuna/Compiler/Core/Conv.vuna:306"));
  ("Core_dConv.v_solveMeta", ("Vuna.Compiler.Core.Conv.solveMeta", "Vuna/Compiler/Core/Conv.vuna:858"));
  ("Core_dConv.v_solveMetaEmpty", ("Vuna.Compiler.Core.Conv.solveMetaEmpty", "Vuna/Compiler/Core/Conv.vuna:727"));
  ("Core_dConv.v_solveMetaEmptyStore", ("Vuna.Compiler.Core.Conv.solveMetaEmptyStore", "Vuna/Compiler/Core/Conv.vuna:732"));
  ("Core_dConv.v_solveMetaFuel", ("Vuna.Compiler.Core.Conv.solveMetaFuel", "Vuna/Compiler/Core/Conv.vuna:799"));
  ("Core_dConv.v_solveMetaHeadLegacyFuel", ("Vuna.Compiler.Core.Conv.solveMetaHeadLegacyFuel", "Vuna/Compiler/Core/Conv.vuna:772"));
  ("Core_dConv.v_solveMetaHoLegacyFuel", ("Vuna.Compiler.Core.Conv.solveMetaHoLegacyFuel", "Vuna/Compiler/Core/Conv.vuna:755"));
  ("Core_dConv.v_solveMetaNew", ("Vuna.Compiler.Core.Conv.solveMetaNew", "Vuna/Compiler/Core/Conv.vuna:821"));
  ("Core_dConv.v_solveMetaPattern", ("Vuna.Compiler.Core.Conv.solveMetaPattern", "Vuna/Compiler/Core/Conv.vuna:784"));
  ("Core_dConv.v_spineLevels", ("Vuna.Compiler.Core.Conv.spineLevels", "Vuna/Compiler/Core/Conv.vuna:639"));
  ("Core_dConv.v_splitAtVals", ("Vuna.Compiler.Core.Conv.splitAtVals", "Vuna/Compiler/Core/Conv.vuna:748"));
  ("Core_dConv.v_termScopedTo", ("Vuna.Compiler.Core.Conv.termScopedTo", "Vuna/Compiler/Core/Conv.vuna:550"));
  ("Core_dConv.v_wrapPatternLams", ("Vuna.Compiler.Core.Conv.wrapPatternLams", "Vuna/Compiler/Core/Conv.vuna:700"));
  ("Core_dConv.v_zonkMetaValue", ("Vuna.Compiler.Core.Conv.zonkMetaValue", "Vuna/Compiler/Core/Conv.vuna:295"));
  ("Core_dEval.v_appendReduce", ("Vuna.Compiler.Core.Eval.appendReduce", "Vuna/Compiler/Core/Eval.vuna:668"));
  ("Core_dEval.v_applyCaseAlt", ("Vuna.Compiler.Core.Eval.applyCaseAlt", "Vuna/Compiler/Core/Eval.vuna:103"));
  ("Core_dEval.v_applyCaseAltFuel", ("Vuna.Compiler.Core.Eval.applyCaseAltFuel", "Vuna/Compiler/Core/Eval.vuna:106"));
  ("Core_dEval.v_applyClosure", ("Vuna.Compiler.Core.Eval.applyClosure", "Vuna/Compiler/Core/Eval.vuna:157"));
  ("Core_dEval.v_applyClosureBinder", ("Vuna.Compiler.Core.Eval.applyClosureBinder", "Vuna/Compiler/Core/Eval.vuna:1063"));
  ("Core_dEval.v_applySpine", ("Vuna.Compiler.Core.Eval.applySpine", "Vuna/Compiler/Core/Eval.vuna:160"));
  ("Core_dEval.v_applyTermSpine", ("Vuna.Compiler.Core.Eval.applyTermSpine", "Vuna/Compiler/Core/Eval.vuna:1094"));
  ("Core_dEval.v_applyValue", ("Vuna.Compiler.Core.Eval.applyValue", "Vuna/Compiler/Core/Eval.vuna:139"));
  ("Core_dEval.v_applyValueFuel", ("Vuna.Compiler.Core.Eval.applyValueFuel", "Vuna/Compiler/Core/Eval.vuna:142"));
  ("Core_dEval.v_argAt", ("Vuna.Compiler.Core.Eval.argAt", "Vuna/Compiler/Core/Eval.vuna:900"));
  ("Core_dEval.v_argValsAt", ("Vuna.Compiler.Core.Eval.argValsAt", "Vuna/Compiler/Core/Eval.vuna:1057"));
  ("Core_dEval.v_asBool", ("Vuna.Compiler.Core.Eval.asBool", "Vuna/Compiler/Core/Eval.vuna:426"));
  ("Core_dEval.v_asFloat", ("Vuna.Compiler.Core.Eval.asFloat", "Vuna/Compiler/Core/Eval.vuna:391"));
  ("Core_dEval.v_asInt", ("Vuna.Compiler.Core.Eval.asInt", "Vuna/Compiler/Core/Eval.vuna:221"));
  ("Core_dEval.v_asNat", ("Vuna.Compiler.Core.Eval.asNat", "Vuna/Compiler/Core/Eval.vuna:279"));
  ("Core_dEval.v_asStr", ("Vuna.Compiler.Core.Eval.asStr", "Vuna/Compiler/Core/Eval.vuna:422"));
  ("Core_dEval.v_atPrim", ("Vuna.Compiler.Core.Eval.atPrim", "Vuna/Compiler/Core/Eval.vuna:833"));
  ("Core_dEval.v_boolPrim2", ("Vuna.Compiler.Core.Eval.boolPrim2", "Vuna/Compiler/Core/Eval.vuna:453"));
  ("Core_dEval.v_catchAllEnv", ("Vuna.Compiler.Core.Eval.catchAllEnv", "Vuna/Compiler/Core/Eval.vuna:125"));
  ("Core_dEval.v_charsAre", ("Vuna.Compiler.Core.Eval.charsAre", "Vuna/Compiler/Core/Eval.vuna:368"));
  ("Core_dEval.v_cmpInt", ("Vuna.Compiler.Core.Eval.cmpInt", "Vuna/Compiler/Core/Eval.vuna:538"));
  ("Core_dEval.v_digitsOfChars", ("Vuna.Compiler.Core.Eval.digitsOfChars", "Vuna/Compiler/Core/Eval.vuna:373"));
  ("Core_dEval.v_dropBytes", ("Vuna.Compiler.Core.Eval.dropBytes", "Vuna/Compiler/Core/Eval.vuna:882"));
  ("Core_dEval.v_eval", ("Vuna.Compiler.Core.Eval.eval", "Vuna/Compiler/Core/Eval.vuna:25"));
  ("Core_dEval.v_evalAlt", ("Vuna.Compiler.Core.Eval.evalAlt", "Vuna/Compiler/Core/Eval.vuna:68"));
  ("Core_dEval.v_evalAlts", ("Vuna.Compiler.Core.Eval.evalAlts", "Vuna/Compiler/Core/Eval.vuna:71"));
  ("Core_dEval.v_evalArgTerms", ("Vuna.Compiler.Core.Eval.evalArgTerms", "Vuna/Compiler/Core/Eval.vuna:77"));
  ("Core_dEval.v_evalArgTermsFuel", ("Vuna.Compiler.Core.Eval.evalArgTermsFuel", "Vuna/Compiler/Core/Eval.vuna:80"));
  ("Core_dEval.v_evalCase", ("Vuna.Compiler.Core.Eval.evalCase", "Vuna/Compiler/Core/Eval.vuna:91"));
  ("Core_dEval.v_evalCaseFuel", ("Vuna.Compiler.Core.Eval.evalCaseFuel", "Vuna/Compiler/Core/Eval.vuna:94"));
  ("Core_dEval.v_evalFuel", ("Vuna.Compiler.Core.Eval.evalFuel", "Vuna/Compiler/Core/Eval.vuna:37"));
  ("Core_dEval.v_evalFuelMax", ("Vuna.Compiler.Core.Eval.evalFuelMax", "Vuna/Compiler/Core/Eval.vuna:34"));
  ("Core_dEval.v_evalIf", ("Vuna.Compiler.Core.Eval.evalIf", "Vuna/Compiler/Core/Eval.vuna:131"));
  ("Core_dEval.v_evalProjFuel", ("Vuna.Compiler.Core.Eval.evalProjFuel", "Vuna/Compiler/Core/Eval.vuna:905"));
  ("Core_dEval.v_expOfChars", ("Vuna.Compiler.Core.Eval.expOfChars", "Vuna/Compiler/Core/Eval.vuna:323"));
  ("Core_dEval.v_floatBool2", ("Vuna.Compiler.Core.Eval.floatBool2", "Vuna/Compiler/Core/Eval.vuna:412"));
  ("Core_dEval.v_floatMagOfChars", ("Vuna.Compiler.Core.Eval.floatMagOfChars", "Vuna/Compiler/Core/Eval.vuna:299"));
  ("Core_dEval.v_floatMantissaGo", ("Vuna.Compiler.Core.Eval.floatMantissaGo", "Vuna/Compiler/Core/Eval.vuna:334"));
  ("Core_dEval.v_floatMantissaOf", ("Vuna.Compiler.Core.Eval.floatMantissaOf", "Vuna/Compiler/Core/Eval.vuna:331"));
  ("Core_dEval.v_floatOfRaw", ("Vuna.Compiler.Core.Eval.floatOfRaw", "Vuna/Compiler/Core/Eval.vuna:291"));
  ("Core_dEval.v_floatPrim1", ("Vuna.Compiler.Core.Eval.floatPrim1", "Vuna/Compiler/Core/Eval.vuna:395"));
  ("Core_dEval.v_floatPrim2", ("Vuna.Compiler.Core.Eval.floatPrim2", "Vuna/Compiler/Core/Eval.vuna:402"));
  ("Core_dEval.v_floatSplitExp", ("Vuna.Compiler.Core.Eval.floatSplitExp", "Vuna/Compiler/Core/Eval.vuna:315"));
  ("Core_dEval.v_floatSplitExpGo", ("Vuna.Compiler.Core.Eval.floatSplitExpGo", "Vuna/Compiler/Core/Eval.vuna:318"));
  ("Core_dEval.v_force", ("Vuna.Compiler.Core.Eval.force", "Vuna/Compiler/Core/Eval.vuna:169"));
  ("Core_dEval.v_forceLabelArgs", ("Vuna.Compiler.Core.Eval.forceLabelArgs", "Vuna/Compiler/Core/Eval.vuna:627"));
  ("Core_dEval.v_freshVar", ("Vuna.Compiler.Core.Eval.freshVar", "Vuna/Compiler/Core/Eval.vuna:1066"));
  ("Core_dEval.v_genericCmp", ("Vuna.Compiler.Core.Eval.genericCmp", "Vuna/Compiler/Core/Eval.vuna:523"));
  ("Core_dEval.v_genericPrim2", ("Vuna.Compiler.Core.Eval.genericPrim2", "Vuna/Compiler/Core/Eval.vuna:541"));
  ("Core_dEval.v_intPrim1", ("Vuna.Compiler.Core.Eval.intPrim1", "Vuna/Compiler/Core/Eval.vuna:478"));
  ("Core_dEval.v_intPrim2", ("Vuna.Compiler.Core.Eval.intPrim2", "Vuna/Compiler/Core/Eval.vuna:430"));
  ("Core_dEval.v_intPrim2Div", ("Vuna.Compiler.Core.Eval.intPrim2Div", "Vuna/Compiler/Core/Eval.vuna:443"));
  ("Core_dEval.v_isHostLabel", ("Vuna.Compiler.Core.Eval.isHostLabel", "Vuna/Compiler/Core/Eval.vuna:636"));
  ("Core_dEval.v_isNilList", ("Vuna.Compiler.Core.Eval.isNilList", "Vuna/Compiler/Core/Eval.vuna:1206"));
  ("Core_dEval.v_lookupEnv", ("Vuna.Compiler.Core.Eval.lookupEnv", "Vuna/Compiler/Core/Eval.vuna:21"));
  ("Core_dEval.v_natChainLimit", ("Vuna.Compiler.Core.Eval.natChainLimit", "Vuna/Compiler/Core/Eval.vuna:251"));
  ("Core_dEval.v_natClamp", ("Vuna.Compiler.Core.Eval.natClamp", "Vuna/Compiler/Core/Eval.vuna:230"));
  ("Core_dEval.v_natCtorInt", ("Vuna.Compiler.Core.Eval.natCtorInt", "Vuna/Compiler/Core/Eval.vuna:263"));
  ("Core_dEval.v_natMax", ("Vuna.Compiler.Core.Eval.natMax", "Vuna/Compiler/Core/Eval.vuna:227"));
  ("Core_dEval.v_natPrim1", ("Vuna.Compiler.Core.Eval.natPrim1", "Vuna/Compiler/Core/Eval.vuna:485"));
  ("Core_dEval.v_natPrim2", ("Vuna.Compiler.Core.Eval.natPrim2", "Vuna/Compiler/Core/Eval.vuna:492"));
  ("Core_dEval.v_natPrim2Div", ("Vuna.Compiler.Core.Eval.natPrim2Div", "Vuna/Compiler/Core/Eval.vuna:502"));
  ("Core_dEval.v_natSatAdd", ("Vuna.Compiler.Core.Eval.natSatAdd", "Vuna/Compiler/Core/Eval.vuna:233"));
  ("Core_dEval.v_natSatMul", ("Vuna.Compiler.Core.Eval.natSatMul", "Vuna/Compiler/Core/Eval.vuna:236"));
  ("Core_dEval.v_natTruncSub", ("Vuna.Compiler.Core.Eval.natTruncSub", "Vuna/Compiler/Core/Eval.vuna:239"));
  ("Core_dEval.v_natValue", ("Vuna.Compiler.Core.Eval.natValue", "Vuna/Compiler/Core/Eval.vuna:245"));
  ("Core_dEval.v_natValueGo", ("Vuna.Compiler.Core.Eval.natValueGo", "Vuna/Compiler/Core/Eval.vuna:242"));
  ("Core_dEval.v_natValueMaybe", ("Vuna.Compiler.Core.Eval.natValueMaybe", "Vuna/Compiler/Core/Eval.vuna:255"));
  ("Core_dEval.v_natValueToInt", ("Vuna.Compiler.Core.Eval.natValueToInt", "Vuna/Compiler/Core/Eval.vuna:258"));
  ("Core_dEval.v_neutralEqFuel", ("Vuna.Compiler.Core.Eval.neutralEqFuel", "Vuna/Compiler/Core/Eval.vuna:601"));
  ("Core_dEval.v_normalize", ("Vuna.Compiler.Core.Eval.normalize", "Vuna/Compiler/Core/Eval.vuna:1239"));
  ("Core_dEval.v_normalizeCase", ("Vuna.Compiler.Core.Eval.normalizeCase", "Vuna/Compiler/Core/Eval.vuna:1242"));
  ("Core_dEval.v_normalizeCaseFuel", ("Vuna.Compiler.Core.Eval.normalizeCaseFuel", "Vuna/Compiler/Core/Eval.vuna:937"));
  ("Core_dEval.v_normalizeFuel", ("Vuna.Compiler.Core.Eval.normalizeFuel", "Vuna/Compiler/Core/Eval.vuna:917"));
  ("Core_dEval.v_normalizeFuelBound", ("Vuna.Compiler.Core.Eval.normalizeFuelBound", "Vuna/Compiler/Core/Eval.vuna:1236"));
  ("Core_dEval.v_normalizeIf", ("Vuna.Compiler.Core.Eval.normalizeIf", "Vuna/Compiler/Core/Eval.vuna:1248"));
  ("Core_dEval.v_normalizeIfFuel", ("Vuna.Compiler.Core.Eval.normalizeIfFuel", "Vuna/Compiler/Core/Eval.vuna:982"));
  ("Core_dEval.v_normalizeNeutral", ("Vuna.Compiler.Core.Eval.normalizeNeutral", "Vuna/Compiler/Core/Eval.vuna:1245"));
  ("Core_dEval.v_normalizeNeutralFuel", ("Vuna.Compiler.Core.Eval.normalizeNeutralFuel", "Vuna/Compiler/Core/Eval.vuna:963"));
  ("Core_dEval.v_normalizeProjFuel", ("Vuna.Compiler.Core.Eval.normalizeProjFuel", "Vuna/Compiler/Core/Eval.vuna:949"));
  ("Core_dEval.v_nthByte", ("Vuna.Compiler.Core.Eval.nthByte", "Vuna/Compiler/Core/Eval.vuna:846"));
  ("Core_dEval.v_obsReduce", ("Vuna.Compiler.Core.Eval.obsReduce", "Vuna/Compiler/Core/Eval.vuna:797"));
  ("Core_dEval.v_pow10Float", ("Vuna.Compiler.Core.Eval.pow10Float", "Vuna/Compiler/Core/Eval.vuna:358"));
  ("Core_dEval.v_pow10Of", ("Vuna.Compiler.Core.Eval.pow10Of", "Vuna/Compiler/Core/Eval.vuna:380"));
  ("Core_dEval.v_primConst", ("Vuna.Compiler.Core.Eval.primConst", "Vuna/Compiler/Core/Eval.vuna:464"));
  ("Core_dEval.v_primReduce", ("Vuna.Compiler.Core.Eval.primReduce", "Vuna/Compiler/Core/Eval.vuna:694"));
  ("Core_dEval.v_quote", ("Vuna.Compiler.Core.Eval.quote", "Vuna/Compiler/Core/Eval.vuna:1004"));
  ("Core_dEval.v_quoteArgValues", ("Vuna.Compiler.Core.Eval.quoteArgValues", "Vuna/Compiler/Core/Eval.vuna:1045"));
  ("Core_dEval.v_quoteArgValuesFuel", ("Vuna.Compiler.Core.Eval.quoteArgValuesFuel", "Vuna/Compiler/Core/Eval.vuna:1048"));
  ("Core_dEval.v_quoteCaseAlt", ("Vuna.Compiler.Core.Eval.quoteCaseAlt", "Vuna/Compiler/Core/Eval.vuna:1029"));
  ("Core_dEval.v_quoteCaseAltFuel", ("Vuna.Compiler.Core.Eval.quoteCaseAltFuel", "Vuna/Compiler/Core/Eval.vuna:1032"));
  ("Core_dEval.v_quoteFuel", ("Vuna.Compiler.Core.Eval.quoteFuel", "Vuna/Compiler/Core/Eval.vuna:1007"));
  ("Core_dEval.v_quoteFuelBound", ("Vuna.Compiler.Core.Eval.quoteFuelBound", "Vuna/Compiler/Core/Eval.vuna:1001"));
  ("Core_dEval.v_quoteNeutral", ("Vuna.Compiler.Core.Eval.quoteNeutral", "Vuna/Compiler/Core/Eval.vuna:1069"));
  ("Core_dEval.v_quoteNeutralFuel", ("Vuna.Compiler.Core.Eval.quoteNeutralFuel", "Vuna/Compiler/Core/Eval.vuna:1072"));
  ("Core_dEval.v_rowRemReduce", ("Vuna.Compiler.Core.Eval.rowRemReduce", "Vuna/Compiler/Core/Eval.vuna:643"));
  ("Core_dEval.v_scaleFloatPow10", ("Vuna.Compiler.Core.Eval.scaleFloatPow10", "Vuna/Compiler/Core/Eval.vuna:364"));
  ("Core_dEval.v_showFloatOf", ("Vuna.Compiler.Core.Eval.showFloatOf", "Vuna/Compiler/Core/Eval.vuna:384"));
  ("Core_dEval.v_showFloatRaw", ("Vuna.Compiler.Core.Eval.showFloatRaw", "Vuna/Compiler/Core/Eval.vuna:388"));
  ("Core_dEval.v_showValue", ("Vuna.Compiler.Core.Eval.showValue", "Vuna/Compiler/Core/Eval.vuna:1230"));
  ("Core_dEval.v_showValueAt", ("Vuna.Compiler.Core.Eval.showValueAt", "Vuna/Compiler/Core/Eval.vuna:1212"));
  ("Core_dEval.v_spineAppend", ("Vuna.Compiler.Core.Eval.spineAppend", "Vuna/Compiler/Core/Eval.vuna:135"));
  ("Core_dEval.v_strAtBytes", ("Vuna.Compiler.Core.Eval.strAtBytes", "Vuna/Compiler/Core/Eval.vuna:843"));
  ("Core_dEval.v_strEq", ("Vuna.Compiler.Core.Eval.strEq", "Vuna/Compiler/Core/Eval.vuna:520"));
  ("Core_dEval.v_strHashChars", ("Vuna.Compiler.Core.Eval.strHashChars", "Vuna/Compiler/Core/Eval.vuna:828"));
  ("Core_dEval.v_strHashOf", ("Vuna.Compiler.Core.Eval.strHashOf", "Vuna/Compiler/Core/Eval.vuna:825"));
  ("Core_dEval.v_strPrim1", ("Vuna.Compiler.Core.Eval.strPrim1", "Vuna/Compiler/Core/Eval.vuna:512"));
  ("Core_dEval.v_strPrim2", ("Vuna.Compiler.Core.Eval.strPrim2", "Vuna/Compiler/Core/Eval.vuna:468"));
  ("Core_dEval.v_strPrim3", ("Vuna.Compiler.Core.Eval.strPrim3", "Vuna/Compiler/Core/Eval.vuna:548"));
  ("Core_dEval.v_substFuelFor", ("Vuna.Compiler.Core.Eval.substFuelFor", "Vuna/Compiler/Core/Eval.vuna:1263"));
  ("Core_dEval.v_substFuelMax", ("Vuna.Compiler.Core.Eval.substFuelMax", "Vuna/Compiler/Core/Eval.vuna:1269"));
  ("Core_dEval.v_substSolvedAlt", ("Vuna.Compiler.Core.Eval.substSolvedAlt", "Vuna/Compiler/Core/Eval.vuna:1145"));
  ("Core_dEval.v_substSolvedAltAt", ("Vuna.Compiler.Core.Eval.substSolvedAltAt", "Vuna/Compiler/Core/Eval.vuna:1203"));
  ("Core_dEval.v_substSolvedAltAtTbl", ("Vuna.Compiler.Core.Eval.substSolvedAltAtTbl", "Vuna/Compiler/Core/Eval.vuna:1310"));
  ("Core_dEval.v_substSolvedMetas", ("Vuna.Compiler.Core.Eval.substSolvedMetas", "Vuna/Compiler/Core/Eval.vuna:1102"));
  ("Core_dEval.v_substSolvedMetasAt", ("Vuna.Compiler.Core.Eval.substSolvedMetasAt", "Vuna/Compiler/Core/Eval.vuna:1154"));
  ("Core_dEval.v_substSolvedMetasAtGo", ("Vuna.Compiler.Core.Eval.substSolvedMetasAtGo", "Vuna/Compiler/Core/Eval.vuna:1158"));
  ("Core_dEval.v_substSolvedMetasAtTbl", ("Vuna.Compiler.Core.Eval.substSolvedMetasAtTbl", "Vuna/Compiler/Core/Eval.vuna:1258"));
  ("Core_dEval.v_substSolvedMetasAtTblFuel", ("Vuna.Compiler.Core.Eval.substSolvedMetasAtTblFuel", "Vuna/Compiler/Core/Eval.vuna:1272"));
  ("Core_dEval.v_substringBytes", ("Vuna.Compiler.Core.Eval.substringBytes", "Vuna/Compiler/Core/Eval.vuna:865"));
  ("Core_dEval.v_substringPrim", ("Vuna.Compiler.Core.Eval.substringPrim", "Vuna/Compiler/Core/Eval.vuna:852"));
  ("Core_dEval.v_takeBytes", ("Vuna.Compiler.Core.Eval.takeBytes", "Vuna/Compiler/Core/Eval.vuna:873"));
  ("Core_dEval.v_valueEqFuel", ("Vuna.Compiler.Core.Eval.valueEqFuel", "Vuna/Compiler/Core/Eval.vuna:565"));
  ("Core_dEval.v_valueListEqFuel", ("Vuna.Compiler.Core.Eval.valueListEqFuel", "Vuna/Compiler/Core/Eval.vuna:612"));
  ("Core_dEval.v_varIndexM", ("Vuna.Compiler.Core.Eval.varIndexM", "Vuna/Compiler/Core/Eval.vuna:1091"));
  ("Core_dTerm.v_anyAltFree", ("Vuna.Compiler.Core.Term.anyAltFree", "Vuna/Compiler/Core/Term.vuna:906"));
  ("Core_dTerm.v_anyAltUsesFloat", ("Vuna.Compiler.Core.Term.anyAltUsesFloat", "Vuna/Compiler/Core/Term.vuna:494"));
  ("Core_dTerm.v_anyArgUsesFloat", ("Vuna.Compiler.Core.Term.anyArgUsesFloat", "Vuna/Compiler/Core/Term.vuna:489"));
  ("Core_dTerm.v_anyNegativeVarAlts", ("Vuna.Compiler.Core.Term.anyNegativeVarAlts", "Vuna/Compiler/Core/Term.vuna:942"));
  ("Core_dTerm.v_anyNegativeVarArgs", ("Vuna.Compiler.Core.Term.anyNegativeVarArgs", "Vuna/Compiler/Core/Term.vuna:938"));
  ("Core_dTerm.v_anyPairFree", ("Vuna.Compiler.Core.Term.anyPairFree", "Vuna/Compiler/Core/Term.vuna:902"));
  ("Core_dTerm.v_binderNameOf", ("Vuna.Compiler.Core.Term.binderNameOf", "Vuna/Compiler/Core/Term.vuna:166"));
  ("Core_dTerm.v_binderOfPair", ("Vuna.Compiler.Core.Term.binderOfPair", "Vuna/Compiler/Core/Term.vuna:183"));
  ("Core_dTerm.v_binderPair", ("Vuna.Compiler.Core.Term.binderPair", "Vuna/Compiler/Core/Term.vuna:176"));
  ("Core_dTerm.v_binderPairs", ("Vuna.Compiler.Core.Term.binderPairs", "Vuna/Compiler/Core/Term.vuna:179"));
  ("Core_dTerm.v_binderRigOf", ("Vuna.Compiler.Core.Term.binderRigOf", "Vuna/Compiler/Core/Term.vuna:169"));
  ("Core_dTerm.v_binderSpanOf", ("Vuna.Compiler.Core.Term.binderSpanOf", "Vuna/Compiler/Core/Term.vuna:172"));
  ("Core_dTerm.v_bindersOfPairs", ("Vuna.Compiler.Core.Term.bindersOfPairs", "Vuna/Compiler/Core/Term.vuna:186"));
  ("Core_dTerm.v_caseAltBinders", ("Vuna.Compiler.Core.Term.caseAltBinders", "Vuna/Compiler/Core/Term.vuna:198"));
  ("Core_dTerm.v_caseAltBody", ("Vuna.Compiler.Core.Term.caseAltBody", "Vuna/Compiler/Core/Term.vuna:201"));
  ("Core_dTerm.v_caseAltName", ("Vuna.Compiler.Core.Term.caseAltName", "Vuna/Compiler/Core/Term.vuna:195"));
  ("Core_dTerm.v_countLams", ("Vuna.Compiler.Core.Term.countLams", "Vuna/Compiler/Core/Term.vuna:870"));
  ("Core_dTerm.v_countPis", ("Vuna.Compiler.Core.Term.countPis", "Vuna/Compiler/Core/Term.vuna:850"));
  ("Core_dTerm.v_cutoffOf", ("Vuna.Compiler.Core.Term.cutoffOf", "Vuna/Compiler/Core/Term.vuna:847"));
  ("Core_dTerm.v_defLookup", ("Vuna.Compiler.Core.Term.defLookup", "Vuna/Compiler/Core/Term.vuna:523"));
  ("Core_dTerm.v_defaultExplicitRig", ("Vuna.Compiler.Core.Term.defaultExplicitRig", "Vuna/Compiler/Core/Term.vuna:55"));
  ("Core_dTerm.v_defaultFuel", ("Vuna.Compiler.Core.Term.defaultFuel", "Vuna/Compiler/Core/Term.vuna:239"));
  ("Core_dTerm.v_flattenTermApp", ("Vuna.Compiler.Core.Term.flattenTermApp", "Vuna/Compiler/Core/Term.vuna:296"));
  ("Core_dTerm.v_flattenTermAppGo", ("Vuna.Compiler.Core.Term.flattenTermAppGo", "Vuna/Compiler/Core/Term.vuna:299"));
  ("Core_dTerm.v_hasFreeTermVar", ("Vuna.Compiler.Core.Term.hasFreeTermVar", "Vuna/Compiler/Core/Term.vuna:875"));
  ("Core_dTerm.v_hasFreeTermVarMaybe", ("Vuna.Compiler.Core.Term.hasFreeTermVarMaybe", "Vuna/Compiler/Core/Term.vuna:898"));
  ("Core_dTerm.v_hasFreeVar", ("Vuna.Compiler.Core.Term.hasFreeVar", "Vuna/Compiler/Core/Term.vuna:527"));
  ("Core_dTerm.v_hasFreeVarAlts", ("Vuna.Compiler.Core.Term.hasFreeVarAlts", "Vuna/Compiler/Core/Term.vuna:563"));
  ("Core_dTerm.v_hasFreeVarArgs", ("Vuna.Compiler.Core.Term.hasFreeVarArgs", "Vuna/Compiler/Core/Term.vuna:559"));
  ("Core_dTerm.v_hasFreeVarMaybe", ("Vuna.Compiler.Core.Term.hasFreeVarMaybe", "Vuna/Compiler/Core/Term.vuna:555"));
  ("Core_dTerm.v_hasMeta", ("Vuna.Compiler.Core.Term.hasMeta", "Vuna/Compiler/Core/Term.vuna:568"));
  ("Core_dTerm.v_hasMetaAlts", ("Vuna.Compiler.Core.Term.hasMetaAlts", "Vuna/Compiler/Core/Term.vuna:603"));
  ("Core_dTerm.v_hasMetaArgs", ("Vuna.Compiler.Core.Term.hasMetaArgs", "Vuna/Compiler/Core/Term.vuna:599"));
  ("Core_dTerm.v_hasMetaMaybe", ("Vuna.Compiler.Core.Term.hasMetaMaybe", "Vuna/Compiler/Core/Term.vuna:595"));
  ("Core_dTerm.v_hasNegativeVar", ("Vuna.Compiler.Core.Term.hasNegativeVar", "Vuna/Compiler/Core/Term.vuna:914"));
  ("Core_dTerm.v_hasNegativeVarMaybe", ("Vuna.Compiler.Core.Term.hasNegativeVarMaybe", "Vuna/Compiler/Core/Term.vuna:934"));
  ("Core_dTerm.v_hasUnsolvedMetaClo", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaClo", "Vuna/Compiler/Core/Term.vuna:989"));
  ("Core_dTerm.v_hasUnsolvedMetaCloFuel", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaCloFuel", "Vuna/Compiler/Core/Term.vuna:992"));
  ("Core_dTerm.v_hasUnsolvedMetaList", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaList", "Vuna/Compiler/Core/Term.vuna:977"));
  ("Core_dTerm.v_hasUnsolvedMetaListFuel", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaListFuel", "Vuna/Compiler/Core/Term.vuna:980"));
  ("Core_dTerm.v_hasUnsolvedMetaValue", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaValue", "Vuna/Compiler/Core/Term.vuna:951"));
  ("Core_dTerm.v_hasUnsolvedMetaValueFuel", ("Vuna.Compiler.Core.Term.hasUnsolvedMetaValueFuel", "Vuna/Compiler/Core/Term.vuna:954"));
  ("Core_dTerm.v_insertDictBinder", ("Vuna.Compiler.Core.Term.insertDictBinder", "Vuna/Compiler/Core/Term.vuna:820"));
  ("Core_dTerm.v_insertDictBinderGo", ("Vuna.Compiler.Core.Term.insertDictBinderGo", "Vuna/Compiler/Core/Term.vuna:826"));
  ("Core_dTerm.v_insertImplicitBinder", ("Vuna.Compiler.Core.Term.insertImplicitBinder", "Vuna/Compiler/Core/Term.vuna:835"));
  ("Core_dTerm.v_insertImplicitBinderGo", ("Vuna.Compiler.Core.Term.insertImplicitBinderGo", "Vuna/Compiler/Core/Term.vuna:838"));
  ("Core_dTerm.v_insertLamBinder", ("Vuna.Compiler.Core.Term.insertLamBinder", "Vuna/Compiler/Core/Term.vuna:859"));
  ("Core_dTerm.v_insertLamBinderGo", ("Vuna.Compiler.Core.Term.insertLamBinderGo", "Vuna/Compiler/Core/Term.vuna:862"));
  ("Core_dTerm.v_isTypeValue", ("Vuna.Compiler.Core.Term.isTypeValue", "Vuna/Compiler/Core/Term.vuna:1003"));
  ("Core_dTerm.v_lamBinderTyOf", ("Vuna.Compiler.Core.Term.lamBinderTyOf", "Vuna/Compiler/Core/Term.vuna:631"));
  ("Core_dTerm.v_lamMarkOf", ("Vuna.Compiler.Core.Term.lamMarkOf", "Vuna/Compiler/Core/Term.vuna:623"));
  ("Core_dTerm.v_lamResultTyOf", ("Vuna.Compiler.Core.Term.lamResultTyOf", "Vuna/Compiler/Core/Term.vuna:637"));
  ("Core_dTerm.v_lamSlotTys", ("Vuna.Compiler.Core.Term.lamSlotTys", "Vuna/Compiler/Core/Term.vuna:627"));
  ("Core_dTerm.v_lamTyOf", ("Vuna.Compiler.Core.Term.lamTyOf", "Vuna/Compiler/Core/Term.vuna:643"));
  ("Core_dTerm.v_lamTyWithBinder", ("Vuna.Compiler.Core.Term.lamTyWithBinder", "Vuna/Compiler/Core/Term.vuna:656"));
  ("Core_dTerm.v_lamTyWithResult", ("Vuna.Compiler.Core.Term.lamTyWithResult", "Vuna/Compiler/Core/Term.vuna:659"));
  ("Core_dTerm.v_levelEq", ("Vuna.Compiler.Core.Term.levelEq", "Vuna/Compiler/Core/Term.vuna:116"));
  ("Core_dTerm.v_levelEscapes", ("Vuna.Compiler.Core.Term.levelEscapes", "Vuna/Compiler/Core/Term.vuna:1015"));
  ("Core_dTerm.v_levelEscapesClo", ("Vuna.Compiler.Core.Term.levelEscapesClo", "Vuna/Compiler/Core/Term.vuna:1040"));
  ("Core_dTerm.v_levelEscapesList", ("Vuna.Compiler.Core.Term.levelEscapesList", "Vuna/Compiler/Core/Term.vuna:1036"));
  ("Core_dTerm.v_levelLt", ("Vuna.Compiler.Core.Term.levelLt", "Vuna/Compiler/Core/Term.vuna:119"));
  ("Core_dTerm.v_levelMax", ("Vuna.Compiler.Core.Term.levelMax", "Vuna/Compiler/Core/Term.vuna:106"));
  ("Core_dTerm.v_levelOfInt", ("Vuna.Compiler.Core.Term.levelOfInt", "Vuna/Compiler/Core/Term.vuna:113"));
  ("Core_dTerm.v_levelSucc", ("Vuna.Compiler.Core.Term.levelSucc", "Vuna/Compiler/Core/Term.vuna:103"));
  ("Core_dTerm.v_levelToInt", ("Vuna.Compiler.Core.Term.levelToInt", "Vuna/Compiler/Core/Term.vuna:109"));
  ("Core_dTerm.v_levelZero", ("Vuna.Compiler.Core.Term.levelZero", "Vuna/Compiler/Core/Term.vuna:100"));
  ("Core_dTerm.v_mapTermMaybe", ("Vuna.Compiler.Core.Term.mapTermMaybe", "Vuna/Compiler/Core/Term.vuna:609"));
  ("Core_dTerm.v_markLamLinear", ("Vuna.Compiler.Core.Term.markLamLinear", "Vuna/Compiler/Core/Term.vuna:647"));
  ("Core_dTerm.v_metaLookup", ("Vuna.Compiler.Core.Term.metaLookup", "Vuna/Compiler/Core/Term.vuna:367"));
  ("Core_dTerm.v_metaLookupList", ("Vuna.Compiler.Core.Term.metaLookupList", "Vuna/Compiler/Core/Term.vuna:371"));
  ("Core_dTerm.v_metaScanBound", ("Vuna.Compiler.Core.Term.metaScanBound", "Vuna/Compiler/Core/Term.vuna:948"));
  ("Core_dTerm.v_natChainArgs", ("Vuna.Compiler.Core.Term.natChainArgs", "Vuna/Compiler/Core/Term.vuna:275"));
  ("Core_dTerm.v_natChainGo", ("Vuna.Compiler.Core.Term.natChainGo", "Vuna/Compiler/Core/Term.vuna:263"));
  ("Core_dTerm.v_natChainMax", ("Vuna.Compiler.Core.Term.natChainMax", "Vuna/Compiler/Core/Term.vuna:253"));
  ("Core_dTerm.v_natChainNext", ("Vuna.Compiler.Core.Term.natChainNext", "Vuna/Compiler/Core/Term.vuna:292"));
  ("Core_dTerm.v_natChainValue", ("Vuna.Compiler.Core.Term.natChainValue", "Vuna/Compiler/Core/Term.vuna:260"));
  ("Core_dTerm.v_recordAppShow", ("Vuna.Compiler.Core.Term.recordAppShow", "Vuna/Compiler/Core/Term.vuna:1105"));
  ("Core_dTerm.v_rigAdd", ("Vuna.Compiler.Core.Term.rigAdd", "Vuna/Compiler/Core/Term.vuna:62"));
  ("Core_dTerm.v_rigExact", ("Vuna.Compiler.Core.Term.rigExact", "Vuna/Compiler/Core/Term.vuna:82"));
  ("Core_dTerm.v_rigIsErased", ("Vuna.Compiler.Core.Term.rigIsErased", "Vuna/Compiler/Core/Term.vuna:35"));
  ("Core_dTerm.v_rigIsLinear", ("Vuna.Compiler.Core.Term.rigIsLinear", "Vuna/Compiler/Core/Term.vuna:40"));
  ("Core_dTerm.v_rigIsOmega", ("Vuna.Compiler.Core.Term.rigIsOmega", "Vuna/Compiler/Core/Term.vuna:44"));
  ("Core_dTerm.v_rigJoin", ("Vuna.Compiler.Core.Term.rigJoin", "Vuna/Compiler/Core/Term.vuna:74"));
  ("Core_dTerm.v_rigOfBinder", ("Vuna.Compiler.Core.Term.rigOfBinder", "Vuna/Compiler/Core/Term.vuna:50"));
  ("Core_dTerm.v_rigScale", ("Vuna.Compiler.Core.Term.rigScale", "Vuna/Compiler/Core/Term.vuna:68"));
  ("Core_dTerm.v_shift", ("Vuna.Compiler.Core.Term.shift", "Vuna/Compiler/Core/Term.vuna:666"));
  ("Core_dTerm.v_shiftAlt", ("Vuna.Compiler.Core.Term.shiftAlt", "Vuna/Compiler/Core/Term.vuna:715"));
  ("Core_dTerm.v_shiftAlts", ("Vuna.Compiler.Core.Term.shiftAlts", "Vuna/Compiler/Core/Term.vuna:711"));
  ("Core_dTerm.v_shiftArgs", ("Vuna.Compiler.Core.Term.shiftArgs", "Vuna/Compiler/Core/Term.vuna:706"));
  ("Core_dTerm.v_showArgTerms", ("Vuna.Compiler.Core.Term.showArgTerms", "Vuna/Compiler/Core/Term.vuna:1100"));
  ("Core_dTerm.v_showBinders", ("Vuna.Compiler.Core.Term.showBinders", "Vuna/Compiler/Core/Term.vuna:1120"));
  ("Core_dTerm.v_showCoreAlts", ("Vuna.Compiler.Core.Term.showCoreAlts", "Vuna/Compiler/Core/Term.vuna:1115"));
  ("Core_dTerm.v_showCoreChars", ("Vuna.Compiler.Core.Term.showCoreChars", "Vuna/Compiler/Core/Term.vuna:1127"));
  ("Core_dTerm.v_showCoreString", ("Vuna.Compiler.Core.Term.showCoreString", "Vuna/Compiler/Core/Term.vuna:1124"));
  ("Core_dTerm.v_showPiSig", ("Vuna.Compiler.Core.Term.showPiSig", "Vuna/Compiler/Core/Term.vuna:1075"));
  ("Core_dTerm.v_showRig", ("Vuna.Compiler.Core.Term.showRig", "Vuna/Compiler/Core/Term.vuna:89"));
  ("Core_dTerm.v_showSigAppText", ("Vuna.Compiler.Core.Term.showSigAppText", "Vuna/Compiler/Core/Term.vuna:1110"));
  ("Core_dTerm.v_showSigArgs", ("Vuna.Compiler.Core.Term.showSigArgs", "Vuna/Compiler/Core/Term.vuna:1096"));
  ("Core_dTerm.v_showSigParenIfPi", ("Vuna.Compiler.Core.Term.showSigParenIfPi", "Vuna/Compiler/Core/Term.vuna:1092"));
  ("Core_dTerm.v_showTerm", ("Vuna.Compiler.Core.Term.showTerm", "Vuna/Compiler/Core/Term.vuna:1043"));
  ("Core_dTerm.v_showTypeSig", ("Vuna.Compiler.Core.Term.showTypeSig", "Vuna/Compiler/Core/Term.vuna:1084"));
  ("Core_dTerm.v_solsCons", ("Vuna.Compiler.Core.Term.solsCons", "Vuna/Compiler/Core/Term.vuna:412"));
  ("Core_dTerm.v_solsDepth", ("Vuna.Compiler.Core.Term.solsDepth", "Vuna/Compiler/Core/Term.vuna:404"));
  ("Core_dTerm.v_solsEmpty", ("Vuna.Compiler.Core.Term.solsEmpty", "Vuna/Compiler/Core/Term.vuna:390"));
  ("Core_dTerm.v_solsFromList", ("Vuna.Compiler.Core.Term.solsFromList", "Vuna/Compiler/Core/Term.vuna:393"));
  ("Core_dTerm.v_solsList", ("Vuna.Compiler.Core.Term.solsList", "Vuna/Compiler/Core/Term.vuna:400"));
  ("Core_dTerm.v_solsLookup", ("Vuna.Compiler.Core.Term.solsLookup", "Vuna/Compiler/Core/Term.vuna:409"));
  ("Core_dTerm.v_solsOf", ("Vuna.Compiler.Core.Term.solsOf", "Vuna/Compiler/Core/Term.vuna:397"));
  ("Core_dTerm.v_substAltAt", ("Vuna.Compiler.Core.Term.substAltAt", "Vuna/Compiler/Core/Term.vuna:763"));
  ("Core_dTerm.v_substMetaVar", ("Vuna.Compiler.Core.Term.substMetaVar", "Vuna/Compiler/Core/Term.vuna:770"));
  ("Core_dTerm.v_substMetaVarAlt", ("Vuna.Compiler.Core.Term.substMetaVarAlt", "Vuna/Compiler/Core/Term.vuna:814"));
  ("Core_dTerm.v_substMetaVarGo", ("Vuna.Compiler.Core.Term.substMetaVarGo", "Vuna/Compiler/Core/Term.vuna:773"));
  ("Core_dTerm.v_substVarAt", ("Vuna.Compiler.Core.Term.substVarAt", "Vuna/Compiler/Core/Term.vuna:720"));
  ("Core_dTerm.v_termGlobalNames", ("Vuna.Compiler.Core.Term.termGlobalNames", "Vuna/Compiler/Core/Term.vuna:500"));
  ("Core_dTerm.v_termHasUnsolvedMeta", ("Vuna.Compiler.Core.Term.termHasUnsolvedMeta", "Vuna/Compiler/Core/Term.vuna:417"));
  ("Core_dTerm.v_termHasUnsolvedMetaAlts", ("Vuna.Compiler.Core.Term.termHasUnsolvedMetaAlts", "Vuna/Compiler/Core/Term.vuna:459"));
  ("Core_dTerm.v_termHasUnsolvedMetaArgs", ("Vuna.Compiler.Core.Term.termHasUnsolvedMetaArgs", "Vuna/Compiler/Core/Term.vuna:454"));
  ("Core_dTerm.v_termHasUnsolvedMetaMaybe", ("Vuna.Compiler.Core.Term.termHasUnsolvedMetaMaybe", "Vuna/Compiler/Core/Term.vuna:450"));
  ("Core_dTerm.v_termSize", ("Vuna.Compiler.Core.Term.termSize", "Vuna/Compiler/Core/Term.vuna:311"));
  ("Core_dTerm.v_termSizeAltTerms", ("Vuna.Compiler.Core.Term.termSizeAltTerms", "Vuna/Compiler/Core/Term.vuna:350"));
  ("Core_dTerm.v_termSizeArgTerms", ("Vuna.Compiler.Core.Term.termSizeArgTerms", "Vuna/Compiler/Core/Term.vuna:346"));
  ("Core_dTerm.v_termSizeCap", ("Vuna.Compiler.Core.Term.termSizeCap", "Vuna/Compiler/Core/Term.vuna:316"));
  ("Core_dTerm.v_termSizeGo", ("Vuna.Compiler.Core.Term.termSizeGo", "Vuna/Compiler/Core/Term.vuna:320"));
  ("Core_dTerm.v_termSizeMaybeTerms", ("Vuna.Compiler.Core.Term.termSizeMaybeTerms", "Vuna/Compiler/Core/Term.vuna:359"));
  ("Core_dTerm.v_termSizeSlotTerms", ("Vuna.Compiler.Core.Term.termSizeSlotTerms", "Vuna/Compiler/Core/Term.vuna:354"));
  ("Core_dTerm.v_termSizeWork", ("Vuna.Compiler.Core.Term.termSizeWork", "Vuna/Compiler/Core/Term.vuna:326"));
  ("Core_dTerm.v_termUsesFloat", ("Vuna.Compiler.Core.Term.termUsesFloat", "Vuna/Compiler/Core/Term.vuna:466"));
  ("Core_dTerm.v_typeLevelOf", ("Vuna.Compiler.Core.Term.typeLevelOf", "Vuna/Compiler/Core/Term.vuna:1007"));
  ("Driver_dCache.v_bodyIssueAt", ("Vuna.Compiler.Driver.Cache.bodyIssueAt", "Vuna/Compiler/Driver/Cache.vuna:250"));
  ("Driver_dCache.v_bodyValid", ("Vuna.Compiler.Driver.Cache.bodyValid", "Vuna/Compiler/Driver/Cache.vuna:170"));
  ("Driver_dCache.v_cachedClasses", ("Vuna.Compiler.Driver.Cache.cachedClasses", "Vuna/Compiler/Driver/Cache.vuna:49"));
  ("Driver_dCache.v_cachedDatas", ("Vuna.Compiler.Driver.Cache.cachedDatas", "Vuna/Compiler/Driver/Cache.vuna:37"));
  ("Driver_dCache.v_cachedDefs", ("Vuna.Compiler.Driver.Cache.cachedDefs", "Vuna/Compiler/Driver/Cache.vuna:40"));
  ("Driver_dCache.v_cachedGlobals", ("Vuna.Compiler.Driver.Cache.cachedGlobals", "Vuna/Compiler/Driver/Cache.vuna:43"));
  ("Driver_dCache.v_cachedInsts", ("Vuna.Compiler.Driver.Cache.cachedInsts", "Vuna/Compiler/Driver/Cache.vuna:46"));
  ("Driver_dCache.v_cachedOfProgram", ("Vuna.Compiler.Driver.Cache.cachedOfProgram", "Vuna/Compiler/Driver/Cache.vuna:120"));
  ("Driver_dCache.v_cachedOfProgramWith", ("Vuna.Compiler.Driver.Cache.cachedOfProgramWith", "Vuna/Compiler/Driver/Cache.vuna:126"));
  ("Driver_dCache.v_cachedOpaqueOf", ("Vuna.Compiler.Driver.Cache.cachedOpaqueOf", "Vuna/Compiler/Driver/Cache.vuna:52"));
  ("Driver_dCache.v_cachedProgramIssue", ("Vuna.Compiler.Driver.Cache.cachedProgramIssue", "Vuna/Compiler/Driver/Cache.vuna:345"));
  ("Driver_dCache.v_cachedProgramValid", ("Vuna.Compiler.Driver.Cache.cachedProgramValid", "Vuna/Compiler/Driver/Cache.vuna:202"));
  ("Driver_dCache.v_classIssue", ("Vuna.Compiler.Driver.Cache.classIssue", "Vuna/Compiler/Driver/Cache.vuna:322"));
  ("Driver_dCache.v_classesIssue", ("Vuna.Compiler.Driver.Cache.classesIssue", "Vuna/Compiler/Driver/Cache.vuna:338"));
  ("Driver_dCache.v_classesValid", ("Vuna.Compiler.Driver.Cache.classesValid", "Vuna/Compiler/Driver/Cache.vuna:193"));
  ("Driver_dCache.v_ctorIssues", ("Vuna.Compiler.Driver.Cache.ctorIssues", "Vuna/Compiler/Driver/Cache.vuna:229"));
  ("Driver_dCache.v_ctorsValid", ("Vuna.Compiler.Driver.Cache.ctorsValid", "Vuna/Compiler/Driver/Cache.vuna:145"));
  ("Driver_dCache.v_ctxIssues", ("Vuna.Compiler.Driver.Cache.ctxIssues", "Vuna/Compiler/Driver/Cache.vuna:308"));
  ("Driver_dCache.v_dataIssue", ("Vuna.Compiler.Driver.Cache.dataIssue", "Vuna/Compiler/Driver/Cache.vuna:218"));
  ("Driver_dCache.v_datasIssue", ("Vuna.Compiler.Driver.Cache.datasIssue", "Vuna/Compiler/Driver/Cache.vuna:243"));
  ("Driver_dCache.v_datasValid", ("Vuna.Compiler.Driver.Cache.datasValid", "Vuna/Compiler/Driver/Cache.vuna:154"));
  ("Driver_dCache.v_decCachedProgram", ("Vuna.Compiler.Driver.Cache.decCachedProgram", "Vuna/Compiler/Driver/Cache.vuna:520"));
  ("Driver_dCache.v_decCachedProgramComplete", ("Vuna.Compiler.Driver.Cache.decCachedProgramComplete", "Vuna/Compiler/Driver/Cache.vuna:514"));
  ("Driver_dCache.v_decGlobalPair", ("Vuna.Compiler.Driver.Cache.decGlobalPair", "Vuna/Compiler/Driver/Cache.vuna:526"));
  ("Driver_dCache.v_defIssue", ("Vuna.Compiler.Driver.Cache.defIssue", "Vuna/Compiler/Driver/Cache.vuna:256"));
  ("Driver_dCache.v_defsIssue", ("Vuna.Compiler.Driver.Cache.defsIssue", "Vuna/Compiler/Driver/Cache.vuna:270"));
  ("Driver_dCache.v_defsValid", ("Vuna.Compiler.Driver.Cache.defsValid", "Vuna/Compiler/Driver/Cache.vuna:161"));
  ("Driver_dCache.v_encCachedProgram", ("Vuna.Compiler.Driver.Cache.encCachedProgram", "Vuna/Compiler/Driver/Cache.vuna:503"));
  ("Driver_dCache.v_encGlobalPair", ("Vuna.Compiler.Driver.Cache.encGlobalPair", "Vuna/Compiler/Driver/Cache.vuna:510"));
  ("Driver_dCache.v_fieldIssues", ("Vuna.Compiler.Driver.Cache.fieldIssues", "Vuna/Compiler/Driver/Cache.vuna:236"));
  ("Driver_dCache.v_fieldsValid", ("Vuna.Compiler.Driver.Cache.fieldsValid", "Vuna/Compiler/Driver/Cache.vuna:150"));
  ("Driver_dCache.v_fixClass", ("Vuna.Compiler.Driver.Cache.fixClass", "Vuna/Compiler/Driver/Cache.vuna:92"));
  ("Driver_dCache.v_fixCtor", ("Vuna.Compiler.Driver.Cache.fixCtor", "Vuna/Compiler/Driver/Cache.vuna:70"));
  ("Driver_dCache.v_fixData", ("Vuna.Compiler.Driver.Cache.fixData", "Vuna/Compiler/Driver/Cache.vuna:76"));
  ("Driver_dCache.v_fixDef", ("Vuna.Compiler.Driver.Cache.fixDef", "Vuna/Compiler/Driver/Cache.vuna:65"));
  ("Driver_dCache.v_fixFieldMeta", ("Vuna.Compiler.Driver.Cache.fixFieldMeta", "Vuna/Compiler/Driver/Cache.vuna:73"));
  ("Driver_dCache.v_fixInst", ("Vuna.Compiler.Driver.Cache.fixInst", "Vuna/Compiler/Driver/Cache.vuna:107"));
  ("Driver_dCache.v_fixTele", ("Vuna.Compiler.Driver.Cache.fixTele", "Vuna/Compiler/Driver/Cache.vuna:103"));
  ("Driver_dCache.v_fixTerm", ("Vuna.Compiler.Driver.Cache.fixTerm", "Vuna/Compiler/Driver/Cache.vuna:62"));
  ("Driver_dCache.v_globalsIssue", ("Vuna.Compiler.Driver.Cache.globalsIssue", "Vuna/Compiler/Driver/Cache.vuna:277"));
  ("Driver_dCache.v_globalsValid", ("Vuna.Compiler.Driver.Cache.globalsValid", "Vuna/Compiler/Driver/Cache.vuna:173"));
  ("Driver_dCache.v_instIssue", ("Vuna.Compiler.Driver.Cache.instIssue", "Vuna/Compiler/Driver/Cache.vuna:284"));
  ("Driver_dCache.v_instsIssue", ("Vuna.Compiler.Driver.Cache.instsIssue", "Vuna/Compiler/Driver/Cache.vuna:315"));
  ("Driver_dCache.v_instsValid", ("Vuna.Compiler.Driver.Cache.instsValid", "Vuna/Compiler/Driver/Cache.vuna:185"));
  ("Driver_dCache.v_shiftAlts", ("Vuna.Compiler.Driver.Cache.shiftAlts", "Vuna/Compiler/Driver/Cache.vuna:434"));
  ("Driver_dCache.v_shiftArgs", ("Vuna.Compiler.Driver.Cache.shiftArgs", "Vuna/Compiler/Driver/Cache.vuna:427"));
  ("Driver_dCache.v_shiftCachedProgram", ("Vuna.Compiler.Driver.Cache.shiftCachedProgram", "Vuna/Compiler/Driver/Cache.vuna:487"));
  ("Driver_dCache.v_shiftClass", ("Vuna.Compiler.Driver.Cache.shiftClass", "Vuna/Compiler/Driver/Cache.vuna:472"));
  ("Driver_dCache.v_shiftCtor", ("Vuna.Compiler.Driver.Cache.shiftCtor", "Vuna/Compiler/Driver/Cache.vuna:451"));
  ("Driver_dCache.v_shiftData", ("Vuna.Compiler.Driver.Cache.shiftData", "Vuna/Compiler/Driver/Cache.vuna:459"));
  ("Driver_dCache.v_shiftDef", ("Vuna.Compiler.Driver.Cache.shiftDef", "Vuna/Compiler/Driver/Cache.vuna:441"));
  ("Driver_dCache.v_shiftFieldMeta", ("Vuna.Compiler.Driver.Cache.shiftFieldMeta", "Vuna/Compiler/Driver/Cache.vuna:455"));
  ("Driver_dCache.v_shiftGlobal", ("Vuna.Compiler.Driver.Cache.shiftGlobal", "Vuna/Compiler/Driver/Cache.vuna:484"));
  ("Driver_dCache.v_shiftInst", ("Vuna.Compiler.Driver.Cache.shiftInst", "Vuna/Compiler/Driver/Cache.vuna:478"));
  ("Driver_dCache.v_shiftLamTyFuel", ("Vuna.Compiler.Driver.Cache.shiftLamTyFuel", "Vuna/Compiler/Driver/Cache.vuna:411"));
  ("Driver_dCache.v_shiftTele", ("Vuna.Compiler.Driver.Cache.shiftTele", "Vuna/Compiler/Driver/Cache.vuna:465"));
  ("Driver_dCache.v_shiftTerm", ("Vuna.Compiler.Driver.Cache.shiftTerm", "Vuna/Compiler/Driver/Cache.vuna:382"));
  ("Driver_dCache.v_shiftTermFuel", ("Vuna.Compiler.Driver.Cache.shiftTermFuel", "Vuna/Compiler/Driver/Cache.vuna:385"));
  ("Driver_dCache.v_shiftTermMaybeFuel", ("Vuna.Compiler.Driver.Cache.shiftTermMaybeFuel", "Vuna/Compiler/Driver/Cache.vuna:421"));
  ("Driver_dCache.v_summaryMetaSegment", ("Vuna.Compiler.Driver.Cache.summaryMetaSegment", "Vuna/Compiler/Driver/Cache.vuna:371"));
  ("Driver_dCache.v_teleIssueGo", ("Vuna.Compiler.Driver.Cache.teleIssueGo", "Vuna/Compiler/Driver/Cache.vuna:301"));
  ("Driver_dCache.v_teleValid", ("Vuna.Compiler.Driver.Cache.teleValid", "Vuna/Compiler/Driver/Cache.vuna:177"));
  ("Driver_dCache.v_termIssueAt", ("Vuna.Compiler.Driver.Cache.termIssueAt", "Vuna/Compiler/Driver/Cache.vuna:210"));
  ("Driver_dCache.v_termValidAt", ("Vuna.Compiler.Driver.Cache.termValidAt", "Vuna/Compiler/Driver/Cache.vuna:141"));
  ("Driver_dCache.v_termsValidAt", ("Vuna.Compiler.Driver.Cache.termsValidAt", "Vuna/Compiler/Driver/Cache.vuna:181"));
  ("Driver_dCache.v_withCachedOpaque", ("Vuna.Compiler.Driver.Cache.withCachedOpaque", "Vuna/Compiler/Driver/Cache.vuna:55"));
  ("Driver_dCompile.v_absoluteSpanLabel", ("Vuna.Compiler.Driver.Compile.absoluteSpanLabel", "Vuna/Compiler/Driver/Compile.vuna:1686"));
  ("Driver_dCompile.v_allNamesIn", ("Vuna.Compiler.Driver.Compile.allNamesIn", "Vuna/Compiler/Driver/Compile.vuna:796"));
  ("Driver_dCompile.v_allStableDiags", ("Vuna.Compiler.Driver.Compile.allStableDiags", "Vuna/Compiler/Driver/Compile.vuna:1710"));
  ("Driver_dCompile.v_anyAbsoluteChild", ("Vuna.Compiler.Driver.Compile.anyAbsoluteChild", "Vuna/Compiler/Driver/Compile.vuna:1696"));
  ("Driver_dCompile.v_anyExportFrom", ("Vuna.Compiler.Driver.Compile.anyExportFrom", "Vuna/Compiler/Driver/Compile.vuna:2065"));
  ("Driver_dCompile.v_appendPrelude", ("Vuna.Compiler.Driver.Compile.appendPrelude", "Vuna/Compiler/Driver/Compile.vuna:912"));
  ("Driver_dCompile.v_auditCheckExe", ("Vuna.Compiler.Driver.Compile.auditCheckExe", "Vuna/Compiler/Driver/Compile.vuna:1931"));
  ("Driver_dCompile.v_auditCheckLib", ("Vuna.Compiler.Driver.Compile.auditCheckLib", "Vuna/Compiler/Driver/Compile.vuna:2458"));
  ("Driver_dCompile.v_auditCompare", ("Vuna.Compiler.Driver.Compile.auditCompare", "Vuna/Compiler/Driver/Compile.vuna:1979"));
  ("Driver_dCompile.v_auditCompile", ("Vuna.Compiler.Driver.Compile.auditCompile", "Vuna/Compiler/Driver/Compile.vuna:304"));
  ("Driver_dCompile.v_baseDepIfacesOf", ("Vuna.Compiler.Driver.Compile.baseDepIfacesOf", "Vuna/Compiler/Driver/Compile.vuna:1393"));
  ("Driver_dCompile.v_buildIdForEff", ("Vuna.Compiler.Driver.Compile.buildIdForEff", "Vuna/Compiler/Driver/Compile.vuna:551"));
  ("Driver_dCompile.v_buildMetaText", ("Vuna.Compiler.Driver.Compile.buildMetaText", "Vuna/Compiler/Driver/Compile.vuna:653"));
  ("Driver_dCompile.v_buildSplit", ("Vuna.Compiler.Driver.Compile.buildSplit", "Vuna/Compiler/Driver/Compile.vuna:419"));
  ("Driver_dCompile.v_buildViewAddrOf", ("Vuna.Compiler.Driver.Compile.buildViewAddrOf", "Vuna/Compiler/Driver/Compile.vuna:2636"));
  ("Driver_dCompile.v_cacheBase", ("Vuna.Compiler.Driver.Compile.cacheBase", "Vuna/Compiler/Driver/Compile.vuna:460"));
  ("Driver_dCompile.v_canonicalDir", ("Vuna.Compiler.Driver.Compile.canonicalDir", "Vuna/Compiler/Driver/Compile.vuna:1663"));
  ("Driver_dCompile.v_canonicalPath", ("Vuna.Compiler.Driver.Compile.canonicalPath", "Vuna/Compiler/Driver/Compile.vuna:1667"));
  ("Driver_dCompile.v_checkAndShadow", ("Vuna.Compiler.Driver.Compile.checkAndShadow", "Vuna/Compiler/Driver/Compile.vuna:2377"));
  ("Driver_dCompile.v_checkAndShadowWith", ("Vuna.Compiler.Driver.Compile.checkAndShadowWith", "Vuna/Compiler/Driver/Compile.vuna:2380"));
  ("Driver_dCompile.v_checkCachedExe", ("Vuna.Compiler.Driver.Compile.checkCachedExe", "Vuna/Compiler/Driver/Compile.vuna:1858"));
  ("Driver_dCompile.v_checkCachedLib", ("Vuna.Compiler.Driver.Compile.checkCachedLib", "Vuna/Compiler/Driver/Compile.vuna:2393"));
  ("Driver_dCompile.v_checkInOf", ("Vuna.Compiler.Driver.Compile.checkInOf", "Vuna/Compiler/Driver/Compile.vuna:2643"));
  ("Driver_dCompile.v_checkModsExe", ("Vuna.Compiler.Driver.Compile.checkModsExe", "Vuna/Compiler/Driver/Compile.vuna:749"));
  ("Driver_dCompile.v_checkModsLib", ("Vuna.Compiler.Driver.Compile.checkModsLib", "Vuna/Compiler/Driver/Compile.vuna:762"));
  ("Driver_dCompile.v_checkModsOf", ("Vuna.Compiler.Driver.Compile.checkModsOf", "Vuna/Compiler/Driver/Compile.vuna:1751"));
  ("Driver_dCompile.v_checkNodeSchema", ("Vuna.Compiler.Driver.Compile.checkNodeSchema", "Vuna/Compiler/Driver/Compile.vuna:704"));
  ("Driver_dCompile.v_checkPackage", ("Vuna.Compiler.Driver.Compile.checkPackage", "Vuna/Compiler/Driver/Compile.vuna:93"));
  ("Driver_dCompile.v_checkSignatureOf", ("Vuna.Compiler.Driver.Compile.checkSignatureOf", "Vuna/Compiler/Driver/Compile.vuna:1963"));
  ("Driver_dCompile.v_checkUncachedExe", ("Vuna.Compiler.Driver.Compile.checkUncachedExe", "Vuna/Compiler/Driver/Compile.vuna:1870"));
  ("Driver_dCompile.v_checkUncachedLib", ("Vuna.Compiler.Driver.Compile.checkUncachedLib", "Vuna/Compiler/Driver/Compile.vuna:2402"));
  ("Driver_dCompile.v_checkViaGraph", ("Vuna.Compiler.Driver.Compile.checkViaGraph", "Vuna/Compiler/Driver/Compile.vuna:1779"));
  ("Driver_dCompile.v_cleanFixpoint", ("Vuna.Compiler.Driver.Compile.cleanFixpoint", "Vuna/Compiler/Driver/Compile.vuna:1583"));
  ("Driver_dCompile.v_cleanHashOf", ("Vuna.Compiler.Driver.Compile.cleanHashOf", "Vuna/Compiler/Driver/Compile.vuna:2137"));
  ("Driver_dCompile.v_cleanIfacesOrEmpty", ("Vuna.Compiler.Driver.Compile.cleanIfacesOrEmpty", "Vuna/Compiler/Driver/Compile.vuna:2105"));
  ("Driver_dCompile.v_cleanPass", ("Vuna.Compiler.Driver.Compile.cleanPass", "Vuna/Compiler/Driver/Compile.vuna:1598"));
  ("Driver_dCompile.v_cleanSelfOk", ("Vuna.Compiler.Driver.Compile.cleanSelfOk", "Vuna/Compiler/Driver/Compile.vuna:1561"));
  ("Driver_dCompile.v_closureEdges", ("Vuna.Compiler.Driver.Compile.closureEdges", "Vuna/Compiler/Driver/Compile.vuna:1351"));
  ("Driver_dCompile.v_closureFuel", ("Vuna.Compiler.Driver.Compile.closureFuel", "Vuna/Compiler/Driver/Compile.vuna:1348"));
  ("Driver_dCompile.v_closureHashOf", ("Vuna.Compiler.Driver.Compile.closureHashOf", "Vuna/Compiler/Driver/Compile.vuna:505"));
  ("Driver_dCompile.v_closureModOf", ("Vuna.Compiler.Driver.Compile.closureModOf", "Vuna/Compiler/Driver/Compile.vuna:898"));
  ("Driver_dCompile.v_closureModsEff", ("Vuna.Compiler.Driver.Compile.closureModsEff", "Vuna/Compiler/Driver/Compile.vuna:878"));
  ("Driver_dCompile.v_collectClean", ("Vuna.Compiler.Driver.Compile.collectClean", "Vuna/Compiler/Driver/Compile.vuna:2086"));
  ("Driver_dCompile.v_collectDepPackages", ("Vuna.Compiler.Driver.Compile.collectDepPackages", "Vuna/Compiler/Driver/Compile.vuna:778"));
  ("Driver_dCompile.v_collectVunaMeta", ("Vuna.Compiler.Driver.Compile.collectVunaMeta", "Vuna/Compiler/Driver/Compile.vuna:465"));
  ("Driver_dCompile.v_compileToDir", ("Vuna.Compiler.Driver.Compile.compileToDir", "Vuna/Compiler/Driver/Compile.vuna:165"));
  ("Driver_dCompile.v_compileToDirGiven", ("Vuna.Compiler.Driver.Compile.compileToDirGiven", "Vuna/Compiler/Driver/Compile.vuna:173"));
  ("Driver_dCompile.v_compileToDirNormal", ("Vuna.Compiler.Driver.Compile.compileToDirNormal", "Vuna/Compiler/Driver/Compile.vuna:213"));
  ("Driver_dCompile.v_compilerClosureModule", ("Vuna.Compiler.Driver.Compile.compilerClosureModule", "Vuna/Compiler/Driver/Compile.vuna:547"));
  ("Driver_dCompile.v_compilerFingerprint", ("Vuna.Compiler.Driver.Compile.compilerFingerprint", "Vuna/Compiler/Driver/Compile.vuna:455"));
  ("Driver_dCompile.v_concatMapEff", ("Vuna.Compiler.Driver.Compile.concatMapEff", "Vuna/Compiler/Driver/Compile.vuna:68"));
  ("Driver_dCompile.v_contextSources", ("Vuna.Compiler.Driver.Compile.contextSources", "Vuna/Compiler/Driver/Compile.vuna:520"));
  ("Driver_dCompile.v_copyFfiFiles", ("Vuna.Compiler.Driver.Compile.copyFfiFiles", "Vuna/Compiler/Driver/Compile.vuna:392"));
  ("Driver_dCompile.v_decOrderNamesComplete", ("Vuna.Compiler.Driver.Compile.decOrderNamesComplete", "Vuna/Compiler/Driver/Compile.vuna:1163"));
  ("Driver_dCompile.v_defLocLine", ("Vuna.Compiler.Driver.Compile.defLocLine", "Vuna/Compiler/Driver/Compile.vuna:2582"));
  ("Driver_dCompile.v_depIdentitiesEff", ("Vuna.Compiler.Driver.Compile.depIdentitiesEff", "Vuna/Compiler/Driver/Compile.vuna:610"));
  ("Driver_dCompile.v_depIdentitiesHash", ("Vuna.Compiler.Driver.Compile.depIdentitiesHash", "Vuna/Compiler/Driver/Compile.vuna:616"));
  ("Driver_dCompile.v_depIfaceHashTable", ("Vuna.Compiler.Driver.Compile.depIfaceHashTable", "Vuna/Compiler/Driver/Compile.vuna:1989"));
  ("Driver_dCompile.v_depIfacesForCheck", ("Vuna.Compiler.Driver.Compile.depIfacesForCheck", "Vuna/Compiler/Driver/Compile.vuna:1285"));
  ("Driver_dCompile.v_depIfacesForTool", ("Vuna.Compiler.Driver.Compile.depIfacesForTool", "Vuna/Compiler/Driver/Compile.vuna:1383"));
  ("Driver_dCompile.v_depIfacesForToolProgram", ("Vuna.Compiler.Driver.Compile.depIfacesForToolProgram", "Vuna/Compiler/Driver/Compile.vuna:1380"));
  ("Driver_dCompile.v_depIfacesForToolSource", ("Vuna.Compiler.Driver.Compile.depIfacesForToolSource", "Vuna/Compiler/Driver/Compile.vuna:1362"));
  ("Driver_dCompile.v_depIfacesForToolSourceDetailed", ("Vuna.Compiler.Driver.Compile.depIfacesForToolSourceDetailed", "Vuna/Compiler/Driver/Compile.vuna:1485"));
  ("Driver_dCompile.v_depIfacesOf", ("Vuna.Compiler.Driver.Compile.depIfacesOf", "Vuna/Compiler/Driver/Compile.vuna:1122"));
  ("Driver_dCompile.v_depIfacesOfWith", ("Vuna.Compiler.Driver.Compile.depIfacesOfWith", "Vuna/Compiler/Driver/Compile.vuna:1130"));
  ("Driver_dCompile.v_depModsByOrderEff", ("Vuna.Compiler.Driver.Compile.depModsByOrderEff", "Vuna/Compiler/Driver/Compile.vuna:1267"));
  ("Driver_dCompile.v_depModsOf", ("Vuna.Compiler.Driver.Compile.depModsOf", "Vuna/Compiler/Driver/Compile.vuna:1116"));
  ("Driver_dCompile.v_depPackageCount", ("Vuna.Compiler.Driver.Compile.depPackageCount", "Vuna/Compiler/Driver/Compile.vuna:813"));
  ("Driver_dCompile.v_depPackageList", ("Vuna.Compiler.Driver.Compile.depPackageList", "Vuna/Compiler/Driver/Compile.vuna:807"));
  ("Driver_dCompile.v_depPackagesOf", ("Vuna.Compiler.Driver.Compile.depPackagesOf", "Vuna/Compiler/Driver/Compile.vuna:790"));
  ("Driver_dCompile.v_depRootIdentityEff", ("Vuna.Compiler.Driver.Compile.depRootIdentityEff", "Vuna/Compiler/Driver/Compile.vuna:584"));
  ("Driver_dCompile.v_depSemanticText", ("Vuna.Compiler.Driver.Compile.depSemanticText", "Vuna/Compiler/Driver/Compile.vuna:727"));
  ("Driver_dCompile.v_depSourceText", ("Vuna.Compiler.Driver.Compile.depSourceText", "Vuna/Compiler/Driver/Compile.vuna:722"));
  ("Driver_dCompile.v_depSrcOf", ("Vuna.Compiler.Driver.Compile.depSrcOf", "Vuna/Compiler/Driver/Compile.vuna:951"));
  ("Driver_dCompile.v_dependencyHashes", ("Vuna.Compiler.Driver.Compile.dependencyHashes", "Vuna/Compiler/Driver/Compile.vuna:528"));
  ("Driver_dCompile.v_diagHasAbsolutePath", ("Vuna.Compiler.Driver.Compile.diagHasAbsolutePath", "Vuna/Compiler/Driver/Compile.vuna:1700"));
  ("Driver_dCompile.v_dirtyFix", ("Vuna.Compiler.Driver.Compile.dirtyFix", "Vuna/Compiler/Driver/Compile.vuna:2077"));
  ("Driver_dCompile.v_distinctPkgs", ("Vuna.Compiler.Driver.Compile.distinctPkgs", "Vuna/Compiler/Driver/Compile.vuna:1228"));
  ("Driver_dCompile.v_dropPrefixMeta", ("Vuna.Compiler.Driver.Compile.dropPrefixMeta", "Vuna/Compiler/Driver/Compile.vuna:468"));
  ("Driver_dCompile.v_elabFullRequested", ("Vuna.Compiler.Driver.Compile.elabFullRequested", "Vuna/Compiler/Driver/Compile.vuna:1945"));
  ("Driver_dCompile.v_encOrderNames", ("Vuna.Compiler.Driver.Compile.encOrderNames", "Vuna/Compiler/Driver/Compile.vuna:1160"));
  ("Driver_dCompile.v_ensureDirPath", ("Vuna.Compiler.Driver.Compile.ensureDirPath", "Vuna/Compiler/Driver/Compile.vuna:141"));
  ("Driver_dCompile.v_ensureDirPathFuel", ("Vuna.Compiler.Driver.Compile.ensureDirPathFuel", "Vuna/Compiler/Driver/Compile.vuna:144"));
  ("Driver_dCompile.v_entrySource", ("Vuna.Compiler.Driver.Compile.entrySource", "Vuna/Compiler/Driver/Compile.vuna:510"));
  ("Driver_dCompile.v_exportedDepModsOf", ("Vuna.Compiler.Driver.Compile.exportedDepModsOf", "Vuna/Compiler/Driver/Compile.vuna:1253"));
  ("Driver_dCompile.v_exportedOwnOf", ("Vuna.Compiler.Driver.Compile.exportedOwnOf", "Vuna/Compiler/Driver/Compile.vuna:2199"));
  ("Driver_dCompile.v_exportsFromDirty", ("Vuna.Compiler.Driver.Compile.exportsFromDirty", "Vuna/Compiler/Driver/Compile.vuna:2062"));
  ("Driver_dCompile.v_findClosureMod", ("Vuna.Compiler.Driver.Compile.findClosureMod", "Vuna/Compiler/Driver/Compile.vuna:872"));
  ("Driver_dCompile.v_findPkgEntry", ("Vuna.Compiler.Driver.Compile.findPkgEntry", "Vuna/Compiler/Driver/Compile.vuna:868"));
  ("Driver_dCompile.v_fromDirty", ("Vuna.Compiler.Driver.Compile.fromDirty", "Vuna/Compiler/Driver/Compile.vuna:2070"));
  ("Driver_dCompile.v_fullCheckExe", ("Vuna.Compiler.Driver.Compile.fullCheckExe", "Vuna/Compiler/Driver/Compile.vuna:1921"));
  ("Driver_dCompile.v_fullCheckLib", ("Vuna.Compiler.Driver.Compile.fullCheckLib", "Vuna/Compiler/Driver/Compile.vuna:2450"));
  ("Driver_dCompile.v_goPkgs", ("Vuna.Compiler.Driver.Compile.goPkgs", "Vuna/Compiler/Driver/Compile.vuna:1233"));
  ("Driver_dCompile.v_hasAbsoluteLabels", ("Vuna.Compiler.Driver.Compile.hasAbsoluteLabels", "Vuna/Compiler/Driver/Compile.vuna:1692"));
  ("Driver_dCompile.v_hashText", ("Vuna.Compiler.Driver.Compile.hashText", "Vuna/Compiler/Driver/Compile.vuna:707"));
  ("Driver_dCompile.v_ifaceAddrOf", ("Vuna.Compiler.Driver.Compile.ifaceAddrOf", "Vuna/Compiler/Driver/Compile.vuna:965"));
  ("Driver_dCompile.v_ifaceAuditRequested", ("Vuna.Compiler.Driver.Compile.ifaceAuditRequested", "Vuna/Compiler/Driver/Compile.vuna:1953"));
  ("Driver_dCompile.v_ifaceCompilerTag", ("Vuna.Compiler.Driver.Compile.ifaceCompilerTag", "Vuna/Compiler/Driver/Compile.vuna:2146"));
  ("Driver_dCompile.v_ifaceModsEff", ("Vuna.Compiler.Driver.Compile.ifaceModsEff", "Vuna/Compiler/Driver/Compile.vuna:983"));
  ("Driver_dCompile.v_ifaceModsWithEff", ("Vuna.Compiler.Driver.Compile.ifaceModsWithEff", "Vuna/Compiler/Driver/Compile.vuna:989"));
  ("Driver_dCompile.v_ifaceObjectCodec", ("Vuna.Compiler.Driver.Compile.ifaceObjectCodec", "Vuna/Compiler/Driver/Compile.vuna:825"));
  ("Driver_dCompile.v_ifaceSelfCheckEff", ("Vuna.Compiler.Driver.Compile.ifaceSelfCheckEff", "Vuna/Compiler/Driver/Compile.vuna:2330"));
  ("Driver_dCompile.v_ifaceSelfCheckGo", ("Vuna.Compiler.Driver.Compile.ifaceSelfCheckGo", "Vuna/Compiler/Driver/Compile.vuna:2336"));
  ("Driver_dCompile.v_ifaceSelfTestRequested", ("Vuna.Compiler.Driver.Compile.ifaceSelfTestRequested", "Vuna/Compiler/Driver/Compile.vuna:2370"));
  ("Driver_dCompile.v_ifaceWriteEnabled", ("Vuna.Compiler.Driver.Compile.ifaceWriteEnabled", "Vuna/Compiler/Driver/Compile.vuna:2213"));
  ("Driver_dCompile.v_ifacesForContextEff", ("Vuna.Compiler.Driver.Compile.ifacesForContextEff", "Vuna/Compiler/Driver/Compile.vuna:1049"));
  ("Driver_dCompile.v_ifacesForRootsEff", ("Vuna.Compiler.Driver.Compile.ifacesForRootsEff", "Vuna/Compiler/Driver/Compile.vuna:1056"));
  ("Driver_dCompile.v_importClosureGo", ("Vuna.Compiler.Driver.Compile.importClosureGo", "Vuna/Compiler/Driver/Compile.vuna:1330"));
  ("Driver_dCompile.v_importClosureOf", ("Vuna.Compiler.Driver.Compile.importClosureOf", "Vuna/Compiler/Driver/Compile.vuna:1345"));
  ("Driver_dCompile.v_importNameStr", ("Vuna.Compiler.Driver.Compile.importNameStr", "Vuna/Compiler/Driver/Compile.vuna:1291"));
  ("Driver_dCompile.v_isDepModOf", ("Vuna.Compiler.Driver.Compile.isDepModOf", "Vuna/Compiler/Driver/Compile.vuna:933"));
  ("Driver_dCompile.v_isNeededMod", ("Vuna.Compiler.Driver.Compile.isNeededMod", "Vuna/Compiler/Driver/Compile.vuna:1355"));
  ("Driver_dCompile.v_isSelfModOf", ("Vuna.Compiler.Driver.Compile.isSelfModOf", "Vuna/Compiler/Driver/Compile.vuna:936"));
  ("Driver_dCompile.v_isStableDiag", ("Vuna.Compiler.Driver.Compile.isStableDiag", "Vuna/Compiler/Driver/Compile.vuna:1704"));
  ("Driver_dCompile.v_joinJsonList", ("Vuna.Compiler.Driver.Compile.joinJsonList", "Vuna/Compiler/Driver/Compile.vuna:639"));
  ("Driver_dCompile.v_joinLines", ("Vuna.Compiler.Driver.Compile.joinLines", "Vuna/Compiler/Driver/Compile.vuna:1973"));
  ("Driver_dCompile.v_lastSegment", ("Vuna.Compiler.Driver.Compile.lastSegment", "Vuna/Compiler/Driver/Compile.vuna:650"));
  ("Driver_dCompile.v_lastSegmentRev", ("Vuna.Compiler.Driver.Compile.lastSegmentRev", "Vuna/Compiler/Driver/Compile.vuna:646"));
  ("Driver_dCompile.v_layoutDigestOf", ("Vuna.Compiler.Driver.Compile.layoutDigestOf", "Vuna/Compiler/Driver/Compile.vuna:2588"));
  ("Driver_dCompile.v_manifestSemanticText", ("Vuna.Compiler.Driver.Compile.manifestSemanticText", "Vuna/Compiler/Driver/Compile.vuna:731"));
  ("Driver_dCompile.v_mapEff", ("Vuna.Compiler.Driver.Compile.mapEff", "Vuna/Compiler/Driver/Compile.vuna:60"));
  ("Driver_dCompile.v_mapMaybeEff", ("Vuna.Compiler.Driver.Compile.mapMaybeEff", "Vuna/Compiler/Driver/Compile.vuna:76"));
  ("Driver_dCompile.v_maybeSemanticText", ("Vuna.Compiler.Driver.Compile.maybeSemanticText", "Vuna/Compiler/Driver/Compile.vuna:718"));
  ("Driver_dCompile.v_metaFileName", ("Vuna.Compiler.Driver.Compile.metaFileName", "Vuna/Compiler/Driver/Compile.vuna:445"));
  ("Driver_dCompile.v_metaPairText", ("Vuna.Compiler.Driver.Compile.metaPairText", "Vuna/Compiler/Driver/Compile.vuna:636"));
  ("Driver_dCompile.v_metaPathOf", ("Vuna.Compiler.Driver.Compile.metaPathOf", "Vuna/Compiler/Driver/Compile.vuna:665"));
  ("Driver_dCompile.v_metaSchema", ("Vuna.Compiler.Driver.Compile.metaSchema", "Vuna/Compiler/Driver/Compile.vuna:442"));
  ("Driver_dCompile.v_metaUpToDate", ("Vuna.Compiler.Driver.Compile.metaUpToDate", "Vuna/Compiler/Driver/Compile.vuna:676"));
  ("Driver_dCompile.v_missingNamesOf", ("Vuna.Compiler.Driver.Compile.missingNamesOf", "Vuna/Compiler/Driver/Compile.vuna:2319"));
  ("Driver_dCompile.v_modGraphEntry", ("Vuna.Compiler.Driver.Compile.modGraphEntry", "Vuna/Compiler/Driver/Compile.vuna:927"));
  ("Driver_dCompile.v_modHashPair", ("Vuna.Compiler.Driver.Compile.modHashPair", "Vuna/Compiler/Driver/Compile.vuna:183"));
  ("Driver_dCompile.v_modNameOf", ("Vuna.Compiler.Driver.Compile.modNameOf", "Vuna/Compiler/Driver/Compile.vuna:930"));
  ("Driver_dCompile.v_moduleDepsOk", ("Vuna.Compiler.Driver.Compile.moduleDepsOk", "Vuna/Compiler/Driver/Compile.vuna:2124"));
  ("Driver_dCompile.v_moduleGraphOf", ("Vuna.Compiler.Driver.Compile.moduleGraphOf", "Vuna/Compiler/Driver/Compile.vuna:939"));
  ("Driver_dCompile.v_moduleNameOfPath", ("Vuna.Compiler.Driver.Compile.moduleNameOfPath", "Vuna/Compiler/Driver/Compile.vuna:481"));
  ("Driver_dCompile.v_mtimeSafetyWindowSec", ("Vuna.Compiler.Driver.Compile.mtimeSafetyWindowSec", "Vuna/Compiler/Driver/Compile.vuna:1443"));
  ("Driver_dCompile.v_nameExportedBy", ("Vuna.Compiler.Driver.Compile.nameExportedBy", "Vuna/Compiler/Driver/Compile.vuna:2190"));
  ("Driver_dCompile.v_orderCodec", ("Vuna.Compiler.Driver.Compile.orderCodec", "Vuna/Compiler/Driver/Compile.vuna:1157"));
  ("Driver_dCompile.v_orderCoversEff", ("Vuna.Compiler.Driver.Compile.orderCoversEff", "Vuna/Compiler/Driver/Compile.vuna:1208"));
  ("Driver_dCompile.v_orderKeyOfEff", ("Vuna.Compiler.Driver.Compile.orderKeyOfEff", "Vuna/Compiler/Driver/Compile.vuna:1175"));
  ("Driver_dCompile.v_orderKind", ("Vuna.Compiler.Driver.Compile.orderKind", "Vuna/Compiler/Driver/Compile.vuna:1154"));
  ("Driver_dCompile.v_ownCleanInfo", ("Vuna.Compiler.Driver.Compile.ownCleanInfo", "Vuna/Compiler/Driver/Compile.vuna:2032"));
  ("Driver_dCompile.v_ownCleanInfoWith", ("Vuna.Compiler.Driver.Compile.ownCleanInfoWith", "Vuna/Compiler/Driver/Compile.vuna:2039"));
  ("Driver_dCompile.v_ownCleanModules", ("Vuna.Compiler.Driver.Compile.ownCleanModules", "Vuna/Compiler/Driver/Compile.vuna:2092"));
  ("Driver_dCompile.v_ownCleanModulesWith", ("Vuna.Compiler.Driver.Compile.ownCleanModulesWith", "Vuna/Compiler/Driver/Compile.vuna:2099"));
  ("Driver_dCompile.v_ownCleanWanted", ("Vuna.Compiler.Driver.Compile.ownCleanWanted", "Vuna/Compiler/Driver/Compile.vuna:1542"));
  ("Driver_dCompile.v_ownInfoOf", ("Vuna.Compiler.Driver.Compile.ownInfoOf", "Vuna/Compiler/Driver/Compile.vuna:2157"));
  ("Driver_dCompile.v_ownRootsOf", ("Vuna.Compiler.Driver.Compile.ownRootsOf", "Vuna/Compiler/Driver/Compile.vuna:517"));
  ("Driver_dCompile.v_ownSourceInfos", ("Vuna.Compiler.Driver.Compile.ownSourceInfos", "Vuna/Compiler/Driver/Compile.vuna:2154"));
  ("Driver_dCompile.v_packageEnvHash", ("Vuna.Compiler.Driver.Compile.packageEnvHash", "Vuna/Compiler/Driver/Compile.vuna:2000"));
  ("Driver_dCompile.v_pairText", ("Vuna.Compiler.Driver.Compile.pairText", "Vuna/Compiler/Driver/Compile.vuna:619"));
  ("Driver_dCompile.v_payloadSelfOk", ("Vuna.Compiler.Driver.Compile.payloadSelfOk", "Vuna/Compiler/Driver/Compile.vuna:2118"));
  ("Driver_dCompile.v_pickByOrder", ("Vuna.Compiler.Driver.Compile.pickByOrder", "Vuna/Compiler/Driver/Compile.vuna:1218"));
  ("Driver_dCompile.v_pickDepMods", ("Vuna.Compiler.Driver.Compile.pickDepMods", "Vuna/Compiler/Driver/Compile.vuna:1273"));
  ("Driver_dCompile.v_pkgEq", ("Vuna.Compiler.Driver.Compile.pkgEq", "Vuna/Compiler/Driver/Compile.vuna:1225"));
  ("Driver_dCompile.v_pkgIfaceSummaryCodec", ("Vuna.Compiler.Driver.Compile.pkgIfaceSummaryCodec", "Vuna/Compiler/Driver/Compile.vuna:577"));
  ("Driver_dCompile.v_pkgIfaceSummaryKeyOf", ("Vuna.Compiler.Driver.Compile.pkgIfaceSummaryKeyOf", "Vuna/Compiler/Driver/Compile.vuna:580"));
  ("Driver_dCompile.v_pkgIfaceSummaryKind", ("Vuna.Compiler.Driver.Compile.pkgIfaceSummaryKind", "Vuna/Compiler/Driver/Compile.vuna:574"));
  ("Driver_dCompile.v_pkgKeyOf", ("Vuna.Compiler.Driver.Compile.pkgKeyOf", "Vuna/Compiler/Driver/Compile.vuna:849"));
  ("Driver_dCompile.v_pkgTableEff", ("Vuna.Compiler.Driver.Compile.pkgTableEff", "Vuna/Compiler/Driver/Compile.vuna:852"));
  ("Driver_dCompile.v_prepareForStore", ("Vuna.Compiler.Driver.Compile.prepareForStore", "Vuna/Compiler/Driver/Compile.vuna:1714"));
  ("Driver_dCompile.v_projectIdOf", ("Vuna.Compiler.Driver.Compile.projectIdOf", "Vuna/Compiler/Driver/Compile.vuna:1758"));
  ("Driver_dCompile.v_readIfaceAtEff", ("Vuna.Compiler.Driver.Compile.readIfaceAtEff", "Vuna/Compiler/Driver/Compile.vuna:1064"));
  ("Driver_dCompile.v_readIfaceListEff", ("Vuna.Compiler.Driver.Compile.readIfaceListEff", "Vuna/Compiler/Driver/Compile.vuna:1092"));
  ("Driver_dCompile.v_readIfaceListPartialEff", ("Vuna.Compiler.Driver.Compile.readIfaceListPartialEff", "Vuna/Compiler/Driver/Compile.vuna:1080"));
  ("Driver_dCompile.v_readIfaces", ("Vuna.Compiler.Driver.Compile.readIfaces", "Vuna/Compiler/Driver/Compile.vuna:2052"));
  ("Driver_dCompile.v_readOneModIface", ("Vuna.Compiler.Driver.Compile.readOneModIface", "Vuna/Compiler/Driver/Compile.vuna:2026"));
  ("Driver_dCompile.v_readOrderEff", ("Vuna.Compiler.Driver.Compile.readOrderEff", "Vuna/Compiler/Driver/Compile.vuna:1193"));
  ("Driver_dCompile.v_readSplitBlob", ("Vuna.Compiler.Driver.Compile.readSplitBlob", "Vuna/Compiler/Driver/Compile.vuna:2671"));
  ("Driver_dCompile.v_readSplitPointer", ("Vuna.Compiler.Driver.Compile.readSplitPointer", "Vuna/Compiler/Driver/Compile.vuna:2569"));
  ("Driver_dCompile.v_rebuildSplit", ("Vuna.Compiler.Driver.Compile.rebuildSplit", "Vuna/Compiler/Driver/Compile.vuna:241"));
  ("Driver_dCompile.v_releaseFlagOf", ("Vuna.Compiler.Driver.Compile.releaseFlagOf", "Vuna/Compiler/Driver/Compile.vuna:745"));
  ("Driver_dCompile.v_replayFailure", ("Vuna.Compiler.Driver.Compile.replayFailure", "Vuna/Compiler/Driver/Compile.vuna:1725"));
  ("Driver_dCompile.v_resolveStoredDiag", ("Vuna.Compiler.Driver.Compile.resolveStoredDiag", "Vuna/Compiler/Driver/Compile.vuna:1722"));
  ("Driver_dCompile.v_resolveStoredPath", ("Vuna.Compiler.Driver.Compile.resolveStoredPath", "Vuna/Compiler/Driver/Compile.vuna:1678"));
  ("Driver_dCompile.v_resyncCleanSources", ("Vuna.Compiler.Driver.Compile.resyncCleanSources", "Vuna/Compiler/Driver/Compile.vuna:2167"));
  ("Driver_dCompile.v_rootEnvHashOf", ("Vuna.Compiler.Driver.Compile.rootEnvHashOf", "Vuna/Compiler/Driver/Compile.vuna:1030"));
  ("Driver_dCompile.v_rootExportsOf", ("Vuna.Compiler.Driver.Compile.rootExportsOf", "Vuna/Compiler/Driver/Compile.vuna:1262"));
  ("Driver_dCompile.v_rootHash", ("Vuna.Compiler.Driver.Compile.rootHash", "Vuna/Compiler/Driver/Compile.vuna:499"));
  ("Driver_dCompile.v_rootKeepEff", ("Vuna.Compiler.Driver.Compile.rootKeepEff", "Vuna/Compiler/Driver/Compile.vuna:1767"));
  ("Driver_dCompile.v_rootOfName", ("Vuna.Compiler.Driver.Compile.rootOfName", "Vuna/Compiler/Driver/Compile.vuna:1169"));
  ("Driver_dCompile.v_rootPkgTableEff", ("Vuna.Compiler.Driver.Compile.rootPkgTableEff", "Vuna/Compiler/Driver/Compile.vuna:1039"));
  ("Driver_dCompile.v_rootSources", ("Vuna.Compiler.Driver.Compile.rootSources", "Vuna/Compiler/Driver/Compile.vuna:488"));
  ("Driver_dCompile.v_runAndStore", ("Vuna.Compiler.Driver.Compile.runAndStore", "Vuna/Compiler/Driver/Compile.vuna:1814"));
  ("Driver_dCompile.v_runBuildScript", ("Vuna.Compiler.Driver.Compile.runBuildScript", "Vuna/Compiler/Driver/Compile.vuna:694"));
  ("Driver_dCompile.v_sameNameSet", ("Vuna.Compiler.Driver.Compile.sameNameSet", "Vuna/Compiler/Driver/Compile.vuna:793"));
  ("Driver_dCompile.v_selfModsOf", ("Vuna.Compiler.Driver.Compile.selfModsOf", "Vuna/Compiler/Driver/Compile.vuna:1119"));
  ("Driver_dCompile.v_shadowAllowed", ("Vuna.Compiler.Driver.Compile.shadowAllowed", "Vuna/Compiler/Driver/Compile.vuna:2183"));
  ("Driver_dCompile.v_shadowClosureMods", ("Vuna.Compiler.Driver.Compile.shadowClosureMods", "Vuna/Compiler/Driver/Compile.vuna:1017"));
  ("Driver_dCompile.v_slashToDot", ("Vuna.Compiler.Driver.Compile.slashToDot", "Vuna/Compiler/Driver/Compile.vuna:478"));
  ("Driver_dCompile.v_slashesToDots", ("Vuna.Compiler.Driver.Compile.slashesToDots", "Vuna/Compiler/Driver/Compile.vuna:475"));
  ("Driver_dCompile.v_sourceFresh", ("Vuna.Compiler.Driver.Compile.sourceFresh", "Vuna/Compiler/Driver/Compile.vuna:1448"));
  ("Driver_dCompile.v_sourceInfoForPath", ("Vuna.Compiler.Driver.Compile.sourceInfoForPath", "Vuna/Compiler/Driver/Compile.vuna:1427"));
  ("Driver_dCompile.v_splitBlobPath", ("Vuna.Compiler.Driver.Compile.splitBlobPath", "Vuna/Compiler/Driver/Compile.vuna:2528"));
  ("Driver_dCompile.v_splitBlobTag", ("Vuna.Compiler.Driver.Compile.splitBlobTag", "Vuna/Compiler/Driver/Compile.vuna:2489"));
  ("Driver_dCompile.v_splitCacheCodec", ("Vuna.Compiler.Driver.Compile.splitCacheCodec", "Vuna/Compiler/Driver/Compile.vuna:2485"));
  ("Driver_dCompile.v_splitIdentityOf", ("Vuna.Compiler.Driver.Compile.splitIdentityOf", "Vuna/Compiler/Driver/Compile.vuna:2599"));
  ("Driver_dCompile.v_splitInOf", ("Vuna.Compiler.Driver.Compile.splitInOf", "Vuna/Compiler/Driver/Compile.vuna:2551"));
  ("Driver_dCompile.v_splitInputsOf", ("Vuna.Compiler.Driver.Compile.splitInputsOf", "Vuna/Compiler/Driver/Compile.vuna:2505"));
  ("Driver_dCompile.v_splitNodeSchema", ("Vuna.Compiler.Driver.Compile.splitNodeSchema", "Vuna/Compiler/Driver/Compile.vuna:2479"));
  ("Driver_dCompile.v_splitPtrCodec", ("Vuna.Compiler.Driver.Compile.splitPtrCodec", "Vuna/Compiler/Driver/Compile.vuna:2566"));
  ("Driver_dCompile.v_splitPtrKind", ("Vuna.Compiler.Driver.Compile.splitPtrKind", "Vuna/Compiler/Driver/Compile.vuna:2563"));
  ("Driver_dCompile.v_splitSignatureOf", ("Vuna.Compiler.Driver.Compile.splitSignatureOf", "Vuna/Compiler/Driver/Compile.vuna:1969"));
  ("Driver_dCompile.v_srcPairOf", ("Vuna.Compiler.Driver.Compile.srcPairOf", "Vuna/Compiler/Driver/Compile.vuna:961"));
  ("Driver_dCompile.v_srcTblOf", ("Vuna.Compiler.Driver.Compile.srcTblOf", "Vuna/Compiler/Driver/Compile.vuna:958"));
  ("Driver_dCompile.v_statOfClosureMod", ("Vuna.Compiler.Driver.Compile.statOfClosureMod", "Vuna/Compiler/Driver/Compile.vuna:1517"));
  ("Driver_dCompile.v_storeCheckPayload", ("Vuna.Compiler.Driver.Compile.storeCheckPayload", "Vuna/Compiler/Driver/Compile.vuna:1730"));
  ("Driver_dCompile.v_summaryCheckExeParts", ("Vuna.Compiler.Driver.Compile.summaryCheckExeParts", "Vuna/Compiler/Driver/Compile.vuna:1889"));
  ("Driver_dCompile.v_summaryCheckLibParts", ("Vuna.Compiler.Driver.Compile.summaryCheckLibParts", "Vuna/Compiler/Driver/Compile.vuna:2419"));
  ("Driver_dCompile.v_summaryClosureMods", ("Vuna.Compiler.Driver.Compile.summaryClosureMods", "Vuna/Compiler/Driver/Compile.vuna:1010"));
  ("Driver_dCompile.v_summarySplitParts", ("Vuna.Compiler.Driver.Compile.summarySplitParts", "Vuna/Compiler/Driver/Compile.vuna:197"));
  ("Driver_dCompile.v_textHash", ("Vuna.Compiler.Driver.Compile.textHash", "Vuna/Compiler/Driver/Compile.vuna:449"));
  ("Driver_dCompile.v_toolCleanGo", ("Vuna.Compiler.Driver.Compile.toolCleanGo", "Vuna/Compiler/Driver/Compile.vuna:1555"));
  ("Driver_dCompile.v_toolCleanOwnModules", ("Vuna.Compiler.Driver.Compile.toolCleanOwnModules", "Vuna/Compiler/Driver/Compile.vuna:1527"));
  ("Driver_dCompile.v_toolCompilerFingerprint", ("Vuna.Compiler.Driver.Compile.toolCompilerFingerprint", "Vuna/Compiler/Driver/Compile.vuna:1652"));
  ("Driver_dCompile.v_toolDepModsOf", ("Vuna.Compiler.Driver.Compile.toolDepModsOf", "Vuna/Compiler/Driver/Compile.vuna:1359"));
  ("Driver_dCompile.v_toolEnabled", ("Vuna.Compiler.Driver.Compile.toolEnabled", "Vuna/Compiler/Driver/Compile.vuna:1324"));
  ("Driver_dCompile.v_toolImportNamesOf", ("Vuna.Compiler.Driver.Compile.toolImportNamesOf", "Vuna/Compiler/Driver/Compile.vuna:1309"));
  ("Driver_dCompile.v_toolImportsOfSource", ("Vuna.Compiler.Driver.Compile.toolImportsOfSource", "Vuna/Compiler/Driver/Compile.vuna:1294"));
  ("Driver_dCompile.v_toolNeededOfImports", ("Vuna.Compiler.Driver.Compile.toolNeededOfImports", "Vuna/Compiler/Driver/Compile.vuna:1476"));
  ("Driver_dCompile.v_toolNowSec", ("Vuna.Compiler.Driver.Compile.toolNowSec", "Vuna/Compiler/Driver/Compile.vuna:1435"));
  ("Driver_dCompile.v_toolSessionFresh", ("Vuna.Compiler.Driver.Compile.toolSessionFresh", "Vuna/Compiler/Driver/Compile.vuna:1468"));
  ("Driver_dCompile.v_toolTextHash", ("Vuna.Compiler.Driver.Compile.toolTextHash", "Vuna/Compiler/Driver/Compile.vuna:1424"));
  ("Driver_dCompile.v_toolWriteModuleIface", ("Vuna.Compiler.Driver.Compile.toolWriteModuleIface", "Vuna/Compiler/Driver/Compile.vuna:1610"));
  ("Driver_dCompile.v_toolWriteModuleIfaceCold", ("Vuna.Compiler.Driver.Compile.toolWriteModuleIfaceCold", "Vuna/Compiler/Driver/Compile.vuna:1637"));
  ("Driver_dCompile.v_toolchainIdEff", ("Vuna.Compiler.Driver.Compile.toolchainIdEff", "Vuna/Compiler/Driver/Compile.vuna:2612"));
  ("Driver_dCompile.v_withAddr", ("Vuna.Compiler.Driver.Compile.withAddr", "Vuna/Compiler/Driver/Compile.vuna:970"));
  ("Driver_dCompile.v_writeBuildMeta", ("Vuna.Compiler.Driver.Compile.writeBuildMeta", "Vuna/Compiler/Driver/Compile.vuna:668"));
  ("Driver_dCompile.v_writeCompiledNormalized", ("Vuna.Compiler.Driver.Compile.writeCompiledNormalized", "Vuna/Compiler/Driver/Compile.vuna:364"));
  ("Driver_dCompile.v_writeFileIfChanged", ("Vuna.Compiler.Driver.Compile.writeFileIfChanged", "Vuna/Compiler/Driver/Compile.vuna:349"));
  ("Driver_dCompile.v_writeIfaceObjects", ("Vuna.Compiler.Driver.Compile.writeIfaceObjects", "Vuna/Compiler/Driver/Compile.vuna:2353"));
  ("Driver_dCompile.v_writeIfaceShadow", ("Vuna.Compiler.Driver.Compile.writeIfaceShadow", "Vuna/Compiler/Driver/Compile.vuna:2208"));
  ("Driver_dCompile.v_writeIfaceShadowGo", ("Vuna.Compiler.Driver.Compile.writeIfaceShadowGo", "Vuna/Compiler/Driver/Compile.vuna:2231"));
  ("Driver_dCompile.v_writeIfaceShadowWith", ("Vuna.Compiler.Driver.Compile.writeIfaceShadowWith", "Vuna/Compiler/Driver/Compile.vuna:2221"));
  ("Driver_dCompile.v_writeIfaceShadowWithClean", ("Vuna.Compiler.Driver.Compile.writeIfaceShadowWithClean", "Vuna/Compiler/Driver/Compile.vuna:2225"));
  ("Driver_dCompile.v_writeModuleIfaceGuarded", ("Vuna.Compiler.Driver.Compile.writeModuleIfaceGuarded", "Vuna/Compiler/Driver/Compile.vuna:1624"));
  ("Driver_dCompile.v_writeOrderEff", ("Vuna.Compiler.Driver.Compile.writeOrderEff", "Vuna/Compiler/Driver/Compile.vuna:1183"));
  ("Driver_dCompile.v_writePkgIfaceSummaryEff", ("Vuna.Compiler.Driver.Compile.writePkgIfaceSummaryEff", "Vuna/Compiler/Driver/Compile.vuna:623"));
  ("Driver_dCompile.v_writeSplitBlob", ("Vuna.Compiler.Driver.Compile.writeSplitBlob", "Vuna/Compiler/Driver/Compile.vuna:2650"));
  ("Driver_dCompile.v_writeSplitBlobAt", ("Vuna.Compiler.Driver.Compile.writeSplitBlobAt", "Vuna/Compiler/Driver/Compile.vuna:2536"));
  ("Driver_dCompile.v_writeSplitPointer", ("Vuna.Compiler.Driver.Compile.writeSplitPointer", "Vuna/Compiler/Driver/Compile.vuna:2579"));
  ("Driver_dCompilerCli.v_anyHelp", ("Vuna.Compiler.Driver.CompilerCli.anyHelp", "Vuna/Compiler/Driver/CompilerCli.vuna:598"));
  ("Driver_dCompilerCli.v_applyDiagConfig", ("Vuna.Compiler.Driver.CompilerCli.applyDiagConfig", "Vuna/Compiler/Driver/CompilerCli.vuna:204"));
  ("Driver_dCompilerCli.v_applyManifestOpts", ("Vuna.Compiler.Driver.CompilerCli.applyManifestOpts", "Vuna/Compiler/Driver/CompilerCli.vuna:207"));
  ("Driver_dCompilerCli.v_buildArgs", ("Vuna.Compiler.Driver.CompilerCli.buildArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:1158"));
  ("Driver_dCompilerCli.v_buildDefaultView", ("Vuna.Compiler.Driver.CompilerCli.buildDefaultView", "Vuna/Compiler/Driver/CompilerCli.vuna:1444"));
  ("Driver_dCompilerCli.v_buildExplicit", ("Vuna.Compiler.Driver.CompilerCli.buildExplicit", "Vuna/Compiler/Driver/CompilerCli.vuna:1423"));
  ("Driver_dCompilerCli.v_buildLinked", ("Vuna.Compiler.Driver.CompilerCli.buildLinked", "Vuna/Compiler/Driver/CompilerCli.vuna:1548"));
  ("Driver_dCompilerCli.v_buildNativeOne", ("Vuna.Compiler.Driver.CompilerCli.buildNativeOne", "Vuna/Compiler/Driver/CompilerCli.vuna:1271"));
  ("Driver_dCompilerCli.v_buildOne", ("Vuna.Compiler.Driver.CompilerCli.buildOne", "Vuna/Compiler/Driver/CompilerCli.vuna:1385"));
  ("Driver_dCompilerCli.v_buildParse", ("Vuna.Compiler.Driver.CompilerCli.buildParse", "Vuna/Compiler/Driver/CompilerCli.vuna:1161"));
  ("Driver_dCompilerCli.v_buildRun", ("Vuna.Compiler.Driver.CompilerCli.buildRun", "Vuna/Compiler/Driver/CompilerCli.vuna:1210"));
  ("Driver_dCompilerCli.v_buildTargets", ("Vuna.Compiler.Driver.CompilerCli.buildTargets", "Vuna/Compiler/Driver/CompilerCli.vuna:1260"));
  ("Driver_dCompilerCli.v_buildWasmOne", ("Vuna.Compiler.Driver.CompilerCli.buildWasmOne", "Vuna/Compiler/Driver/CompilerCli.vuna:1326"));
  ("Driver_dCompilerCli.v_checkArgs", ("Vuna.Compiler.Driver.CompilerCli.checkArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:881"));
  ("Driver_dCompilerCli.v_checkEmit", ("Vuna.Compiler.Driver.CompilerCli.checkEmit", "Vuna/Compiler/Driver/CompilerCli.vuna:893"));
  ("Driver_dCompilerCli.v_checkEntryFile", ("Vuna.Compiler.Driver.CompilerCli.checkEntryFile", "Vuna/Compiler/Driver/CompilerCli.vuna:1123"));
  ("Driver_dCompilerCli.v_checkFileEntry", ("Vuna.Compiler.Driver.CompilerCli.checkFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:1075"));
  ("Driver_dCompilerCli.v_checkMembersByLevel", ("Vuna.Compiler.Driver.CompilerCli.checkMembersByLevel", "Vuna/Compiler/Driver/CompilerCli.vuna:979"));
  ("Driver_dCompilerCli.v_checkMembersParallel", ("Vuna.Compiler.Driver.CompilerCli.checkMembersParallel", "Vuna/Compiler/Driver/CompilerCli.vuna:1009"));
  ("Driver_dCompilerCli.v_checkModuleFileEntry", ("Vuna.Compiler.Driver.CompilerCli.checkModuleFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:1108"));
  ("Driver_dCompilerCli.v_checkPackageCode", ("Vuna.Compiler.Driver.CompilerCli.checkPackageCode", "Vuna/Compiler/Driver/CompilerCli.vuna:1056"));
  ("Driver_dCompilerCli.v_checkPackageErr", ("Vuna.Compiler.Driver.CompilerCli.checkPackageErr", "Vuna/Compiler/Driver/CompilerCli.vuna:1642"));
  ("Driver_dCompilerCli.v_checkPackageSeq", ("Vuna.Compiler.Driver.CompilerCli.checkPackageSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:1045"));
  ("Driver_dCompilerCli.v_checkPackages", ("Vuna.Compiler.Driver.CompilerCli.checkPackages", "Vuna/Compiler/Driver/CompilerCli.vuna:944"));
  ("Driver_dCompilerCli.v_checkPackagesSpawn", ("Vuna.Compiler.Driver.CompilerCli.checkPackagesSpawn", "Vuna/Compiler/Driver/CompilerCli.vuna:964"));
  ("Driver_dCompilerCli.v_checkPkgDir", ("Vuna.Compiler.Driver.CompilerCli.checkPkgDir", "Vuna/Compiler/Driver/CompilerCli.vuna:904"));
  ("Driver_dCompilerCli.v_checkPkgsInProcess", ("Vuna.Compiler.Driver.CompilerCli.checkPkgsInProcess", "Vuna/Compiler/Driver/CompilerCli.vuna:1024"));
  ("Driver_dCompilerCli.v_checkRootsSeq", ("Vuna.Compiler.Driver.CompilerCli.checkRootsSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:1036"));
  ("Driver_dCompilerCli.v_checkSpawnArgs", ("Vuna.Compiler.Driver.CompilerCli.checkSpawnArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:919"));
  ("Driver_dCompilerCli.v_collectLabelFiles", ("Vuna.Compiler.Driver.CompilerCli.collectLabelFiles", "Vuna/Compiler/Driver/CompilerCli.vuna:323"));
  ("Driver_dCompilerCli.v_collectSarifIn", ("Vuna.Compiler.Driver.CompilerCli.collectSarifIn", "Vuna/Compiler/Driver/CompilerCli.vuna:705"));
  ("Driver_dCompilerCli.v_compileArgs", ("Vuna.Compiler.Driver.CompilerCli.compileArgs", "Vuna/Compiler/Driver/CompilerCli.vuna:785"));
  ("Driver_dCompilerCli.v_compileCodegen", ("Vuna.Compiler.Driver.CompilerCli.compileCodegen", "Vuna/Compiler/Driver/CompilerCli.vuna:1538"));
  ("Driver_dCompilerCli.v_compileFileEntry", ("Vuna.Compiler.Driver.CompilerCli.compileFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:846"));
  ("Driver_dCompilerCli.v_compileFinish", ("Vuna.Compiler.Driver.CompilerCli.compileFinish", "Vuna/Compiler/Driver/CompilerCli.vuna:814"));
  ("Driver_dCompilerCli.v_compileParse", ("Vuna.Compiler.Driver.CompilerCli.compileParse", "Vuna/Compiler/Driver/CompilerCli.vuna:788"));
  ("Driver_dCompilerCli.v_compilePkgDir", ("Vuna.Compiler.Driver.CompilerCli.compilePkgDir", "Vuna/Compiler/Driver/CompilerCli.vuna:862"));
  ("Driver_dCompilerCli.v_compileRun", ("Vuna.Compiler.Driver.CompilerCli.compileRun", "Vuna/Compiler/Driver/CompilerCli.vuna:821"));
  ("Driver_dCompilerCli.v_compileToTarget", ("Vuna.Compiler.Driver.CompilerCli.compileToTarget", "Vuna/Compiler/Driver/CompilerCli.vuna:833"));
  ("Driver_dCompilerCli.v_compilerUsage", ("Vuna.Compiler.Driver.CompilerCli.compilerUsage", "Vuna/Compiler/Driver/CompilerCli.vuna:54"));
  ("Driver_dCompilerCli.v_compilerUsageLines", ("Vuna.Compiler.Driver.CompilerCli.compilerUsageLines", "Vuna/Compiler/Driver/CompilerCli.vuna:41"));
  ("Driver_dCompilerCli.v_countFailures", ("Vuna.Compiler.Driver.CompilerCli.countFailures", "Vuna/Compiler/Driver/CompilerCli.vuna:1071"));
  ("Driver_dCompilerCli.v_dashFlag", ("Vuna.Compiler.Driver.CompilerCli.dashFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:631"));
  ("Driver_dCompilerCli.v_defaultCliOpts", ("Vuna.Compiler.Driver.CompilerCli.defaultCliOpts", "Vuna/Compiler/Driver/CompilerCli.vuna:90"));
  ("Driver_dCompilerCli.v_defaultDir", ("Vuna.Compiler.Driver.CompilerCli.defaultDir", "Vuna/Compiler/Driver/CompilerCli.vuna:747"));
  ("Driver_dCompilerCli.v_depsReady", ("Vuna.Compiler.Driver.CompilerCli.depsReady", "Vuna/Compiler/Driver/CompilerCli.vuna:997"));
  ("Driver_dCompilerCli.v_depsReadyList", ("Vuna.Compiler.Driver.CompilerCli.depsReadyList", "Vuna/Compiler/Driver/CompilerCli.vuna:1000"));
  ("Driver_dCompilerCli.v_diagExitFor", ("Vuna.Compiler.Driver.CompilerCli.diagExitFor", "Vuna/Compiler/Driver/CompilerCli.vuna:171"));
  ("Driver_dCompilerCli.v_dirOf", ("Vuna.Compiler.Driver.CompilerCli.dirOf", "Vuna/Compiler/Driver/CompilerCli.vuna:348"));
  ("Driver_dCompilerCli.v_dtPathErr", ("Vuna.Compiler.Driver.CompilerCli.dtPathErr", "Vuna/Compiler/Driver/CompilerCli.vuna:754"));
  ("Driver_dCompilerCli.v_emitDiag", ("Vuna.Compiler.Driver.CompilerCli.emitDiag", "Vuna/Compiler/Driver/CompilerCli.vuna:681"));
  ("Driver_dCompilerCli.v_emitDiagRevSeq", ("Vuna.Compiler.Driver.CompilerCli.emitDiagRevSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:709"));
  ("Driver_dCompilerCli.v_emitDiagSeq", ("Vuna.Compiler.Driver.CompilerCli.emitDiagSeq", "Vuna/Compiler/Driver/CompilerCli.vuna:712"));
  ("Driver_dCompilerCli.v_executablePackage", ("Vuna.Compiler.Driver.CompilerCli.executablePackage", "Vuna/Compiler/Driver/CompilerCli.vuna:758"));
  ("Driver_dCompilerCli.v_executablePackageAt", ("Vuna.Compiler.Driver.CompilerCli.executablePackageAt", "Vuna/Compiler/Driver/CompilerCli.vuna:769"));
  ("Driver_dCompilerCli.v_findPackageByName", ("Vuna.Compiler.Driver.CompilerCli.findPackageByName", "Vuna/Compiler/Driver/CompilerCli.vuna:1254"));
  ("Driver_dCompilerCli.v_findPkgRootGo", ("Vuna.Compiler.Driver.CompilerCli.findPkgRootGo", "Vuna/Compiler/Driver/CompilerCli.vuna:389"));
  ("Driver_dCompilerCli.v_finishWarnings", ("Vuna.Compiler.Driver.CompilerCli.finishWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:1585"));
  ("Driver_dCompilerCli.v_finishWarningsDir", ("Vuna.Compiler.Driver.CompilerCli.finishWarningsDir", "Vuna/Compiler/Driver/CompilerCli.vuna:1596"));
  ("Driver_dCompilerCli.v_flushSarif", ("Vuna.Compiler.Driver.CompilerCli.flushSarif", "Vuna/Compiler/Driver/CompilerCli.vuna:181"));
  ("Driver_dCompilerCli.v_hasDenyWarnings", ("Vuna.Compiler.Driver.CompilerCli.hasDenyWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:290"));
  ("Driver_dCompilerCli.v_hasFailFast", ("Vuna.Compiler.Driver.CompilerCli.hasFailFast", "Vuna/Compiler/Driver/CompilerCli.vuna:308"));
  ("Driver_dCompilerCli.v_hasFormatFlag", ("Vuna.Compiler.Driver.CompilerCli.hasFormatFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:465"));
  ("Driver_dCompilerCli.v_hasLangFlag", ("Vuna.Compiler.Driver.CompilerCli.hasLangFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:1629"));
  ("Driver_dCompilerCli.v_hasShowCascade", ("Vuna.Compiler.Driver.CompilerCli.hasShowCascade", "Vuna/Compiler/Driver/CompilerCli.vuna:295"));
  ("Driver_dCompilerCli.v_hasShowWarnings", ("Vuna.Compiler.Driver.CompilerCli.hasShowWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:459"));
  ("Driver_dCompilerCli.v_hasWithSources", ("Vuna.Compiler.Driver.CompilerCli.hasWithSources", "Vuna/Compiler/Driver/CompilerCli.vuna:304"));
  ("Driver_dCompilerCli.v_helpFor", ("Vuna.Compiler.Driver.CompilerCli.helpFor", "Vuna/Compiler/Driver/CompilerCli.vuna:603"));
  ("Driver_dCompilerCli.v_isCascadeDiag", ("Vuna.Compiler.Driver.CompilerCli.isCascadeDiag", "Vuna/Compiler/Driver/CompilerCli.vuna:439"));
  ("Driver_dCompilerCli.v_isKnownTarget", ("Vuna.Compiler.Driver.CompilerCli.isKnownTarget", "Vuna/Compiler/Driver/CompilerCli.vuna:811"));
  ("Driver_dCompilerCli.v_isMachineFormat", ("Vuna.Compiler.Driver.CompilerCli.isMachineFormat", "Vuna/Compiler/Driver/CompilerCli.vuna:941"));
  ("Driver_dCompilerCli.v_isModuleFileEntry", ("Vuna.Compiler.Driver.CompilerCli.isModuleFileEntry", "Vuna/Compiler/Driver/CompilerCli.vuna:1091"));
  ("Driver_dCompilerCli.v_isPackageEntryPath", ("Vuna.Compiler.Driver.CompilerCli.isPackageEntryPath", "Vuna/Compiler/Driver/CompilerCli.vuna:1097"));
  ("Driver_dCompilerCli.v_isSingleLibraryPackage", ("Vuna.Compiler.Driver.CompilerCli.isSingleLibraryPackage", "Vuna/Compiler/Driver/CompilerCli.vuna:1235"));
  ("Driver_dCompilerCli.v_isTextDiagFormat", ("Vuna.Compiler.Driver.CompilerCli.isTextDiagFormat", "Vuna/Compiler/Driver/CompilerCli.vuna:446"));
  ("Driver_dCompilerCli.v_isWorkspaceRoot", ("Vuna.Compiler.Driver.CompilerCli.isWorkspaceRoot", "Vuna/Compiler/Driver/CompilerCli.vuna:1033"));
  ("Driver_dCompilerCli.v_labelFiles", ("Vuna.Compiler.Driver.CompilerCli.labelFiles", "Vuna/Compiler/Driver/CompilerCli.vuna:327"));
  ("Driver_dCompilerCli.v_lastSlashGo", ("Vuna.Compiler.Driver.CompilerCli.lastSlashGo", "Vuna/Compiler/Driver/CompilerCli.vuna:341"));
  ("Driver_dCompilerCli.v_lastSlashIndexOf", ("Vuna.Compiler.Driver.CompilerCli.lastSlashIndexOf", "Vuna/Compiler/Driver/CompilerCli.vuna:345"));
  ("Driver_dCompilerCli.v_libraryOnlyMessage", ("Vuna.Compiler.Driver.CompilerCli.libraryOnlyMessage", "Vuna/Compiler/Driver/CompilerCli.vuna:1242"));
  ("Driver_dCompilerCli.v_linkDefaultOutput", ("Vuna.Compiler.Driver.CompilerCli.linkDefaultOutput", "Vuna/Compiler/Driver/CompilerCli.vuna:1528"));
  ("Driver_dCompilerCli.v_mapEff", ("Vuna.Compiler.Driver.CompilerCli.mapEff", "Vuna/Compiler/Driver/CompilerCli.vuna:58"));
  ("Driver_dCompilerCli.v_markFormatExplicit", ("Vuna.Compiler.Driver.CompilerCli.markFormatExplicit", "Vuna/Compiler/Driver/CompilerCli.vuna:143"));
  ("Driver_dCompilerCli.v_markRelease", ("Vuna.Compiler.Driver.CompilerCli.markRelease", "Vuna/Compiler/Driver/CompilerCli.vuna:112"));
  ("Driver_dCompilerCli.v_markTarget", ("Vuna.Compiler.Driver.CompilerCli.markTarget", "Vuna/Compiler/Driver/CompilerCli.vuna:120"));
  ("Driver_dCompilerCli.v_markViewComplete", ("Vuna.Compiler.Driver.CompilerCli.markViewComplete", "Vuna/Compiler/Driver/CompilerCli.vuna:1522"));
  ("Driver_dCompilerCli.v_markWasmOpt", ("Vuna.Compiler.Driver.CompilerCli.markWasmOpt", "Vuna/Compiler/Driver/CompilerCli.vuna:116"));
  ("Driver_dCompilerCli.v_maxErrorsOf", ("Vuna.Compiler.Driver.CompilerCli.maxErrorsOf", "Vuna/Compiler/Driver/CompilerCli.vuna:268"));
  ("Driver_dCompilerCli.v_memStr", ("Vuna.Compiler.Driver.CompilerCli.memStr", "Vuna/Compiler/Driver/CompilerCli.vuna:336"));
  ("Driver_dCompilerCli.v_moduleOfRel", ("Vuna.Compiler.Driver.CompilerCli.moduleOfRel", "Vuna/Compiler/Driver/CompilerCli.vuna:375"));
  ("Driver_dCompilerCli.v_nativeBuildScript", ("Vuna.Compiler.Driver.CompilerCli.nativeBuildScript", "Vuna/Compiler/Driver/CompilerCli.vuna:1316"));
  ("Driver_dCompilerCli.v_ownedByFile", ("Vuna.Compiler.Driver.CompilerCli.ownedByFile", "Vuna/Compiler/Driver/CompilerCli.vuna:1570"));
  ("Driver_dCompilerCli.v_ownedByPackage", ("Vuna.Compiler.Driver.CompilerCli.ownedByPackage", "Vuna/Compiler/Driver/CompilerCli.vuna:1574"));
  ("Driver_dCompilerCli.v_packageRecover", ("Vuna.Compiler.Driver.CompilerCli.packageRecover", "Vuna/Compiler/Driver/CompilerCli.vuna:1651"));
  ("Driver_dCompilerCli.v_packageRecoverExe", ("Vuna.Compiler.Driver.CompilerCli.packageRecoverExe", "Vuna/Compiler/Driver/CompilerCli.vuna:1658"));
  ("Driver_dCompilerCli.v_packageRecoverLib", ("Vuna.Compiler.Driver.CompilerCli.packageRecoverLib", "Vuna/Compiler/Driver/CompilerCli.vuna:1668"));
  ("Driver_dCompilerCli.v_parseIntChars", ("Vuna.Compiler.Driver.CompilerCli.parseIntChars", "Vuna/Compiler/Driver/CompilerCli.vuna:536"));
  ("Driver_dCompilerCli.v_parseIntOr", ("Vuna.Compiler.Driver.CompilerCli.parseIntOr", "Vuna/Compiler/Driver/CompilerCli.vuna:532"));
  ("Driver_dCompilerCli.v_parseWasmOptLevel", ("Vuna.Compiler.Driver.CompilerCli.parseWasmOptLevel", "Vuna/Compiler/Driver/CompilerCli.vuna:544"));
  ("Driver_dCompilerCli.v_printDiag", ("Vuna.Compiler.Driver.CompilerCli.printDiag", "Vuna/Compiler/Driver/CompilerCli.vuna:731"));
  ("Driver_dCompilerCli.v_printDiagList", ("Vuna.Compiler.Driver.CompilerCli.printDiagList", "Vuna/Compiler/Driver/CompilerCli.vuna:739"));
  ("Driver_dCompilerCli.v_printDiagWithPrefix", ("Vuna.Compiler.Driver.CompilerCli.printDiagWithPrefix", "Vuna/Compiler/Driver/CompilerCli.vuna:719"));
  ("Driver_dCompilerCli.v_printErr", ("Vuna.Compiler.Driver.CompilerCli.printErr", "Vuna/Compiler/Driver/CompilerCli.vuna:735"));
  ("Driver_dCompilerCli.v_printErrText", ("Vuna.Compiler.Driver.CompilerCli.printErrText", "Vuna/Compiler/Driver/CompilerCli.vuna:665"));
  ("Driver_dCompilerCli.v_printRecovered", ("Vuna.Compiler.Driver.CompilerCli.printRecovered", "Vuna/Compiler/Driver/CompilerCli.vuna:1681"));
  ("Driver_dCompilerCli.v_printVersion", ("Vuna.Compiler.Driver.CompilerCli.printVersion", "Vuna/Compiler/Driver/CompilerCli.vuna:591"));
  ("Driver_dCompilerCli.v_removedCommand", ("Vuna.Compiler.Driver.CompilerCli.removedCommand", "Vuna/Compiler/Driver/CompilerCli.vuna:623"));
  ("Driver_dCompilerCli.v_removedFlag", ("Vuna.Compiler.Driver.CompilerCli.removedFlag", "Vuna/Compiler/Driver/CompilerCli.vuna:653"));
  ("Driver_dCompilerCli.v_removedFlagHint", ("Vuna.Compiler.Driver.CompilerCli.removedFlagHint", "Vuna/Compiler/Driver/CompilerCli.vuna:634"));
  ("Driver_dCompilerCli.v_runCompilerCli", ("Vuna.Compiler.Driver.CompilerCli.runCompilerCli", "Vuna/Compiler/Driver/CompilerCli.vuna:67"));
  ("Driver_dCompilerCli.v_runCompilerCliFor", ("Vuna.Compiler.Driver.CompilerCli.runCompilerCliFor", "Vuna/Compiler/Driver/CompilerCli.vuna:505"));
  ("Driver_dCompilerCli.v_runCompilerCliFor1", ("Vuna.Compiler.Driver.CompilerCli.runCompilerCliFor1", "Vuna/Compiler/Driver/CompilerCli.vuna:571"));
  ("Driver_dCompilerCli.v_selectBuildTargets", ("Vuna.Compiler.Driver.CompilerCli.selectBuildTargets", "Vuna/Compiler/Driver/CompilerCli.vuna:1247"));
  ("Driver_dCompilerCli.v_severityLabelOf", ("Vuna.Compiler.Driver.CompilerCli.severityLabelOf", "Vuna/Compiler/Driver/CompilerCli.vuna:672"));
  ("Driver_dCompilerCli.v_sourcePairsEff", ("Vuna.Compiler.Driver.CompilerCli.sourcePairsEff", "Vuna/Compiler/Driver/CompilerCli.vuna:431"));
  ("Driver_dCompilerCli.v_sourceRefEff", ("Vuna.Compiler.Driver.CompilerCli.sourceRefEff", "Vuna/Compiler/Driver/CompilerCli.vuna:412"));
  ("Driver_dCompilerCli.v_splitSlash", ("Vuna.Compiler.Driver.CompilerCli.splitSlash", "Vuna/Compiler/Driver/CompilerCli.vuna:364"));
  ("Driver_dCompilerCli.v_splitSlashGo", ("Vuna.Compiler.Driver.CompilerCli.splitSlashGo", "Vuna/Compiler/Driver/CompilerCli.vuna:367"));
  ("Driver_dCompilerCli.v_stdoutIsTty", ("Vuna.Compiler.Driver.CompilerCli.stdoutIsTty", "Vuna/Compiler/Driver/CompilerCli.vuna:501"));
  ("Driver_dCompilerCli.v_stripContinueGo", ("Vuna.Compiler.Driver.CompilerCli.stripContinueGo", "Vuna/Compiler/Driver/CompilerCli.vuna:1637"));
  ("Driver_dCompilerCli.v_stripContinueOnError", ("Vuna.Compiler.Driver.CompilerCli.stripContinueOnError", "Vuna/Compiler/Driver/CompilerCli.vuna:1634"));
  ("Driver_dCompilerCli.v_stripDenyWarnings", ("Vuna.Compiler.Driver.CompilerCli.stripDenyWarnings", "Vuna/Compiler/Driver/CompilerCli.vuna:281"));
  ("Driver_dCompilerCli.v_stripDiagFormat", ("Vuna.Compiler.Driver.CompilerCli.stripDiagFormat", "Vuna/Compiler/Driver/CompilerCli.vuna:474"));
  ("Driver_dCompilerCli.v_stripDiagFormatGo", ("Vuna.Compiler.Driver.CompilerCli.stripDiagFormatGo", "Vuna/Compiler/Driver/CompilerCli.vuna:478"));
  ("Driver_dCompilerCli.v_stripDotSlash", ("Vuna.Compiler.Driver.CompilerCli.stripDotSlash", "Vuna/Compiler/Driver/CompilerCli.vuna:1565"));
  ("Driver_dCompilerCli.v_stripFailFast", ("Vuna.Compiler.Driver.CompilerCli.stripFailFast", "Vuna/Compiler/Driver/CompilerCli.vuna:312"));
  ("Driver_dCompilerCli.v_stripLang", ("Vuna.Compiler.Driver.CompilerCli.stripLang", "Vuna/Compiler/Driver/CompilerCli.vuna:1612"));
  ("Driver_dCompilerCli.v_stripLangGo", ("Vuna.Compiler.Driver.CompilerCli.stripLangGo", "Vuna/Compiler/Driver/CompilerCli.vuna:1616"));
  ("Driver_dCompilerCli.v_stripMaxErrors", ("Vuna.Compiler.Driver.CompilerCli.stripMaxErrors", "Vuna/Compiler/Driver/CompilerCli.vuna:551"));
  ("Driver_dCompilerCli.v_stripMaxErrorsGo", ("Vuna.Compiler.Driver.CompilerCli.stripMaxErrorsGo", "Vuna/Compiler/Driver/CompilerCli.vuna:555"));
  ("Driver_dCompilerCli.v_stripPathPrefix", ("Vuna.Compiler.Driver.CompilerCli.stripPathPrefix", "Vuna/Compiler/Driver/CompilerCli.vuna:354"));
  ("Driver_dCompilerCli.v_stripShowCascade", ("Vuna.Compiler.Driver.CompilerCli.stripShowCascade", "Vuna/Compiler/Driver/CompilerCli.vuna:299"));
  ("Driver_dCompilerCli.v_stripWithSources", ("Vuna.Compiler.Driver.CompilerCli.stripWithSources", "Vuna/Compiler/Driver/CompilerCli.vuna:317"));
  ("Driver_dCompilerCli.v_takeDiags", ("Vuna.Compiler.Driver.CompilerCli.takeDiags", "Vuna/Compiler/Driver/CompilerCli.vuna:272"));
  ("Driver_dCompilerCli.v_takeDiagsGo", ("Vuna.Compiler.Driver.CompilerCli.takeDiagsGo", "Vuna/Compiler/Driver/CompilerCli.vuna:276"));
  ("Driver_dCompilerCli.v_unknownCommand", ("Vuna.Compiler.Driver.CompilerCli.unknownCommand", "Vuna/Compiler/Driver/CompilerCli.vuna:617"));
  ("Driver_dCompilerCli.v_usageErr", ("Vuna.Compiler.Driver.CompilerCli.usageErr", "Vuna/Compiler/Driver/CompilerCli.vuna:610"));
  ("Driver_dCompilerCli.v_visibleDiags", ("Vuna.Compiler.Driver.CompilerCli.visibleDiags", "Vuna/Compiler/Driver/CompilerCli.vuna:449"));
  ("Driver_dCompilerCli.v_waitView", ("Vuna.Compiler.Driver.CompilerCli.waitView", "Vuna/Compiler/Driver/CompilerCli.vuna:1504"));
  ("Driver_dCompilerCli.v_wasmBuildScript", ("Vuna.Compiler.Driver.CompilerCli.wasmBuildScript", "Vuna/Compiler/Driver/CompilerCli.vuna:1372"));
  ("Driver_dCompilerCli.v_withOpts", ("Vuna.Compiler.Driver.CompilerCli.withOpts", "Vuna/Compiler/Driver/CompilerCli.vuna:165"));
  ("Driver_dCompilerCli.v_workspaceMultiOut", ("Vuna.Compiler.Driver.CompilerCli.workspaceMultiOut", "Vuna/Compiler/Driver/CompilerCli.vuna:1227"));
  ("Driver_dDt.v_allocMetas", ("Vuna.Compiler.Driver.Dt.allocMetas", "Vuna/Compiler/Driver/Dt.vuna:645"));
  ("Driver_dDt.v_allocTelescopes", ("Vuna.Compiler.Driver.Dt.allocTelescopes", "Vuna/Compiler/Driver/Dt.vuna:632"));
  ("Driver_dDt.v_applyArity", ("Vuna.Compiler.Driver.Dt.applyArity", "Vuna/Compiler/Driver/Dt.vuna:817"));
  ("Driver_dDt.v_aritiesOf", ("Vuna.Compiler.Driver.Dt.aritiesOf", "Vuna/Compiler/Driver/Dt.vuna:616"));
  ("Driver_dDt.v_auxKeyOne", ("Vuna.Compiler.Driver.Dt.auxKeyOne", "Vuna/Compiler/Driver/Dt.vuna:1294"));
  ("Driver_dDt.v_bodyPairs", ("Vuna.Compiler.Driver.Dt.bodyPairs", "Vuna/Compiler/Driver/Dt.vuna:1138"));
  ("Driver_dDt.v_buildGenMetas", ("Vuna.Compiler.Driver.Dt.buildGenMetas", "Vuna/Compiler/Driver/Dt.vuna:719"));
  ("Driver_dDt.v_buildPi", ("Vuna.Compiler.Driver.Dt.buildPi", "Vuna/Compiler/Driver/Dt.vuna:653"));
  ("Driver_dDt.v_cachedNamesOf", ("Vuna.Compiler.Driver.Dt.cachedNamesOf", "Vuna/Compiler/Driver/Dt.vuna:1019"));
  ("Driver_dDt.v_cachedNamesOne", ("Vuna.Compiler.Driver.Dt.cachedNamesOne", "Vuna/Compiler/Driver/Dt.vuna:1022"));
  ("Driver_dDt.v_checkDeclsWithWarns", ("Vuna.Compiler.Driver.Dt.checkDeclsWithWarns", "Vuna/Compiler/Driver/Dt.vuna:143"));
  ("Driver_dDt.v_checkDtProgramOf", ("Vuna.Compiler.Driver.Dt.checkDtProgramOf", "Vuna/Compiler/Driver/Dt.vuna:2157"));
  ("Driver_dDt.v_cleanStartNext", ("Vuna.Compiler.Driver.Dt.cleanStartNext", "Vuna/Compiler/Driver/Dt.vuna:1107"));
  ("Driver_dDt.v_closureFuel", ("Vuna.Compiler.Driver.Dt.closureFuel", "Vuna/Compiler/Driver/Dt.vuna:1843"));
  ("Driver_dDt.v_closureGo", ("Vuna.Compiler.Driver.Dt.closureGo", "Vuna/Compiler/Driver/Dt.vuna:1850"));
  ("Driver_dDt.v_concatKeys", ("Vuna.Compiler.Driver.Dt.concatKeys", "Vuna/Compiler/Driver/Dt.vuna:1686"));
  ("Driver_dDt.v_dedupClasses", ("Vuna.Compiler.Driver.Dt.dedupClasses", "Vuna/Compiler/Driver/Dt.vuna:1151"));
  ("Driver_dDt.v_dedupDatas", ("Vuna.Compiler.Driver.Dt.dedupDatas", "Vuna/Compiler/Driver/Dt.vuna:1145"));
  ("Driver_dDt.v_dedupDefBodies", ("Vuna.Compiler.Driver.Dt.dedupDefBodies", "Vuna/Compiler/Driver/Dt.vuna:1132"));
  ("Driver_dDt.v_dedupDefs", ("Vuna.Compiler.Driver.Dt.dedupDefs", "Vuna/Compiler/Driver/Dt.vuna:1135"));
  ("Driver_dDt.v_dedupGlobals", ("Vuna.Compiler.Driver.Dt.dedupGlobals", "Vuna/Compiler/Driver/Dt.vuna:1154"));
  ("Driver_dDt.v_dedupInsts", ("Vuna.Compiler.Driver.Dt.dedupInsts", "Vuna/Compiler/Driver/Dt.vuna:1148"));
  ("Driver_dDt.v_dedupInts", ("Vuna.Compiler.Driver.Dt.dedupInts", "Vuna/Compiler/Driver/Dt.vuna:783"));
  ("Driver_dDt.v_dedupKeepLast", ("Vuna.Compiler.Driver.Dt.dedupKeepLast", "Vuna/Compiler/Driver/Dt.vuna:1117"));
  ("Driver_dDt.v_dedupKeepLastGo", ("Vuna.Compiler.Driver.Dt.dedupKeepLastGo", "Vuna/Compiler/Driver/Dt.vuna:1120"));
  ("Driver_dDt.v_dedupSortedGo", ("Vuna.Compiler.Driver.Dt.dedupSortedGo", "Vuna/Compiler/Driver/Dt.vuna:1192"));
  ("Driver_dDt.v_dedupSortedNames", ("Vuna.Compiler.Driver.Dt.dedupSortedNames", "Vuna/Compiler/Driver/Dt.vuna:1189"));
  ("Driver_dDt.v_defTableOf", ("Vuna.Compiler.Driver.Dt.defTableOf", "Vuna/Compiler/Driver/Dt.vuna:1002"));
  ("Driver_dDt.v_depStartOf", ("Vuna.Compiler.Driver.Dt.depStartOf", "Vuna/Compiler/Driver/Dt.vuna:1087"));
  ("Driver_dDt.v_depStartOfAt", ("Vuna.Compiler.Driver.Dt.depStartOfAt", "Vuna/Compiler/Driver/Dt.vuna:1062"));
  ("Driver_dDt.v_dtAuxForTermination", ("Vuna.Compiler.Driver.Dt.dtAuxForTermination", "Vuna/Compiler/Driver/Dt.vuna:1259"));
  ("Driver_dDt.v_dtAuxKey", ("Vuna.Compiler.Driver.Dt.dtAuxKey", "Vuna/Compiler/Driver/Dt.vuna:1297"));
  ("Driver_dDt.v_dtAuxOfCache", ("Vuna.Compiler.Driver.Dt.dtAuxOfCache", "Vuna/Compiler/Driver/Dt.vuna:1302"));
  ("Driver_dDt.v_dtBindingTypes", ("Vuna.Compiler.Driver.Dt.dtBindingTypes", "Vuna/Compiler/Driver/Dt.vuna:686"));
  ("Driver_dDt.v_dtCheck", ("Vuna.Compiler.Driver.Dt.dtCheck", "Vuna/Compiler/Driver/Dt.vuna:249"));
  ("Driver_dDt.v_dtCheckDecls", ("Vuna.Compiler.Driver.Dt.dtCheckDecls", "Vuna/Compiler/Driver/Dt.vuna:133"));
  ("Driver_dDt.v_dtCheckLibraryPackageIncrementalParts", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryPackageIncrementalParts", "Vuna/Compiler/Driver/Dt.vuna:1946"));
  ("Driver_dDt.v_dtCheckLibraryPackageWithIfacesParts", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryPackageWithIfacesParts", "Vuna/Compiler/Driver/Dt.vuna:1959"));
  ("Driver_dDt.v_dtCheckLibraryRecovering", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryRecovering", "Vuna/Compiler/Driver/Dt.vuna:2145"));
  ("Driver_dDt.v_dtCheckLibraryWithProgramParts", ("Vuna.Compiler.Driver.Dt.dtCheckLibraryWithProgramParts", "Vuna/Compiler/Driver/Dt.vuna:169"));
  ("Driver_dDt.v_dtCheckModuleFile", ("Vuna.Compiler.Driver.Dt.dtCheckModuleFile", "Vuna/Compiler/Driver/Dt.vuna:285"));
  ("Driver_dDt.v_dtCheckOursParts", ("Vuna.Compiler.Driver.Dt.dtCheckOursParts", "Vuna/Compiler/Driver/Dt.vuna:1028"));
  ("Driver_dDt.v_dtCheckPackageIncrementalParts", ("Vuna.Compiler.Driver.Dt.dtCheckPackageIncrementalParts", "Vuna/Compiler/Driver/Dt.vuna:1590"));
  ("Driver_dDt.v_dtCheckPackageWithIfacesParts", ("Vuna.Compiler.Driver.Dt.dtCheckPackageWithIfacesParts", "Vuna/Compiler/Driver/Dt.vuna:1916"));
  ("Driver_dDt.v_dtCheckPartsWithProgram", ("Vuna.Compiler.Driver.Dt.dtCheckPartsWithProgram", "Vuna/Compiler/Driver/Dt.vuna:173"));
  ("Driver_dDt.v_dtCheckRecovering", ("Vuna.Compiler.Driver.Dt.dtCheckRecovering", "Vuna/Compiler/Driver/Dt.vuna:2134"));
  ("Driver_dDt.v_dtCheckScoped", ("Vuna.Compiler.Driver.Dt.dtCheckScoped", "Vuna/Compiler/Driver/Dt.vuna:1483"));
  ("Driver_dDt.v_dtCheckSource", ("Vuna.Compiler.Driver.Dt.dtCheckSource", "Vuna/Compiler/Driver/Dt.vuna:365"));
  ("Driver_dDt.v_dtCheckSourceChecked", ("Vuna.Compiler.Driver.Dt.dtCheckSourceChecked", "Vuna/Compiler/Driver/Dt.vuna:1579"));
  ("Driver_dDt.v_dtCheckSourceIncremental", ("Vuna.Compiler.Driver.Dt.dtCheckSourceIncremental", "Vuna/Compiler/Driver/Dt.vuna:1496"));
  ("Driver_dDt.v_dtCheckSourceWithIfaces", ("Vuna.Compiler.Driver.Dt.dtCheckSourceWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:394"));
  ("Driver_dDt.v_dtCheckWithProgramParts", ("Vuna.Compiler.Driver.Dt.dtCheckWithProgramParts", "Vuna/Compiler/Driver/Dt.vuna:165"));
  ("Driver_dDt.v_dtDefGlobalNames", ("Vuna.Compiler.Driver.Dt.dtDefGlobalNames", "Vuna/Compiler/Driver/Dt.vuna:2099"));
  ("Driver_dDt.v_dtElabFullWithPrepared", ("Vuna.Compiler.Driver.Dt.dtElabFullWithPrepared", "Vuna/Compiler/Driver/Dt.vuna:1272"));
  ("Driver_dDt.v_dtEvalExpr", ("Vuna.Compiler.Driver.Dt.dtEvalExpr", "Vuna/Compiler/Driver/Dt.vuna:340"));
  ("Driver_dDt.v_dtEvalExprInfo", ("Vuna.Compiler.Driver.Dt.dtEvalExprInfo", "Vuna/Compiler/Driver/Dt.vuna:353"));
  ("Driver_dDt.v_dtEvalExprInfoWithAuxCache", ("Vuna.Compiler.Driver.Dt.dtEvalExprInfoWithAuxCache", "Vuna/Compiler/Driver/Dt.vuna:520"));
  ("Driver_dDt.v_dtEvalExprInfoWithIfaces", ("Vuna.Compiler.Driver.Dt.dtEvalExprInfoWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:546"));
  ("Driver_dDt.v_dtEvalExprWithAuxCache", ("Vuna.Compiler.Driver.Dt.dtEvalExprWithAuxCache", "Vuna/Compiler/Driver/Dt.vuna:533"));
  ("Driver_dDt.v_dtEvalExprWithIfaces", ("Vuna.Compiler.Driver.Dt.dtEvalExprWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:556"));
  ("Driver_dDt.v_dtEvalFile", ("Vuna.Compiler.Driver.Dt.dtEvalFile", "Vuna/Compiler/Driver/Dt.vuna:297"));
  ("Driver_dDt.v_dtEvalSourceIncremental", ("Vuna.Compiler.Driver.Dt.dtEvalSourceIncremental", "Vuna/Compiler/Driver/Dt.vuna:1559"));
  ("Driver_dDt.v_dtFileHasModuleHeader", ("Vuna.Compiler.Driver.Dt.dtFileHasModuleHeader", "Vuna/Compiler/Driver/Dt.vuna:270"));
  ("Driver_dDt.v_dtFinishPackage", ("Vuna.Compiler.Driver.Dt.dtFinishPackage", "Vuna/Compiler/Driver/Dt.vuna:1410"));
  ("Driver_dDt.v_dtFinishPackageScoped", ("Vuna.Compiler.Driver.Dt.dtFinishPackageScoped", "Vuna/Compiler/Driver/Dt.vuna:1438"));
  ("Driver_dDt.v_dtFinishScoped", ("Vuna.Compiler.Driver.Dt.dtFinishScoped", "Vuna/Compiler/Driver/Dt.vuna:1464"));
  ("Driver_dDt.v_dtGenerateIncremental", ("Vuna.Compiler.Driver.Dt.dtGenerateIncremental", "Vuna/Compiler/Driver/Dt.vuna:1776"));
  ("Driver_dDt.v_dtGoalsIncrementalCore", ("Vuna.Compiler.Driver.Dt.dtGoalsIncrementalCore", "Vuna/Compiler/Driver/Dt.vuna:1403"));
  ("Driver_dDt.v_dtGoalsSource", ("Vuna.Compiler.Driver.Dt.dtGoalsSource", "Vuna/Compiler/Driver/Dt.vuna:837"));
  ("Driver_dDt.v_dtGoalsSourceIncremental", ("Vuna.Compiler.Driver.Dt.dtGoalsSourceIncremental", "Vuna/Compiler/Driver/Dt.vuna:1527"));
  ("Driver_dDt.v_dtGoalsSourceTolerant", ("Vuna.Compiler.Driver.Dt.dtGoalsSourceTolerant", "Vuna/Compiler/Driver/Dt.vuna:851"));
  ("Driver_dDt.v_dtIncrementalChecked", ("Vuna.Compiler.Driver.Dt.dtIncrementalChecked", "Vuna/Compiler/Driver/Dt.vuna:1306"));
  ("Driver_dDt.v_dtIncrementalCheckedCore", ("Vuna.Compiler.Driver.Dt.dtIncrementalCheckedCore", "Vuna/Compiler/Driver/Dt.vuna:1390"));
  ("Driver_dDt.v_dtIncrementalSetup", ("Vuna.Compiler.Driver.Dt.dtIncrementalSetup", "Vuna/Compiler/Driver/Dt.vuna:1335"));
  ("Driver_dDt.v_dtInferDefTypes", ("Vuna.Compiler.Driver.Dt.dtInferDefTypes", "Vuna/Compiler/Driver/Dt.vuna:583"));
  ("Driver_dDt.v_dtLoad", ("Vuna.Compiler.Driver.Dt.dtLoad", "Vuna/Compiler/Driver/Dt.vuna:82"));
  ("Driver_dDt.v_dtLoadModulesParts", ("Vuna.Compiler.Driver.Dt.dtLoadModulesParts", "Vuna/Compiler/Driver/Dt.vuna:119"));
  ("Driver_dDt.v_dtLoadModulesPartsIncremental", ("Vuna.Compiler.Driver.Dt.dtLoadModulesPartsIncremental", "Vuna/Compiler/Driver/Dt.vuna:1929"));
  ("Driver_dDt.v_dtLoadModulesPartsWithIfaces", ("Vuna.Compiler.Driver.Dt.dtLoadModulesPartsWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:1902"));
  ("Driver_dDt.v_dtLoadParts", ("Vuna.Compiler.Driver.Dt.dtLoadParts", "Vuna/Compiler/Driver/Dt.vuna:1013"));
  ("Driver_dDt.v_dtLoadPartsForCheck", ("Vuna.Compiler.Driver.Dt.dtLoadPartsForCheck", "Vuna/Compiler/Driver/Dt.vuna:107"));
  ("Driver_dDt.v_dtLoadPartsIncremental", ("Vuna.Compiler.Driver.Dt.dtLoadPartsIncremental", "Vuna/Compiler/Driver/Dt.vuna:1223"));
  ("Driver_dDt.v_dtLoadPartsWithIfaces", ("Vuna.Compiler.Driver.Dt.dtLoadPartsWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:1888"));
  ("Driver_dDt.v_dtMainKind", ("Vuna.Compiler.Driver.Dt.dtMainKind", "Vuna/Compiler/Driver/Dt.vuna:870"));
  ("Driver_dDt.v_dtPrepareTermAux", ("Vuna.Compiler.Driver.Dt.dtPrepareTermAux", "Vuna/Compiler/Driver/Dt.vuna:1248"));
  ("Driver_dDt.v_dtProjectDecls", ("Vuna.Compiler.Driver.Dt.dtProjectDecls", "Vuna/Compiler/Driver/Dt.vuna:78"));
  ("Driver_dDt.v_dtSplitPartsOurs", ("Vuna.Compiler.Driver.Dt.dtSplitPartsOurs", "Vuna/Compiler/Driver/Dt.vuna:1998"));
  ("Driver_dDt.v_dtSplitPartsOursWith", ("Vuna.Compiler.Driver.Dt.dtSplitPartsOursWith", "Vuna/Compiler/Driver/Dt.vuna:2002"));
  ("Driver_dDt.v_dtSplitProjectIncremental", ("Vuna.Compiler.Driver.Dt.dtSplitProjectIncremental", "Vuna/Compiler/Driver/Dt.vuna:1799"));
  ("Driver_dDt.v_dtSplitProjectParts", ("Vuna.Compiler.Driver.Dt.dtSplitProjectParts", "Vuna/Compiler/Driver/Dt.vuna:2056"));
  ("Driver_dDt.v_dtSplitProjectWithIfaces", ("Vuna.Compiler.Driver.Dt.dtSplitProjectWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:1975"));
  ("Driver_dDt.v_evalDtMain", ("Vuna.Compiler.Driver.Dt.evalDtMain", "Vuna/Compiler/Driver/Dt.vuna:930"));
  ("Driver_dDt.v_evalDtMainCore", ("Vuna.Compiler.Driver.Dt.evalDtMainCore", "Vuna/Compiler/Driver/Dt.vuna:941"));
  ("Driver_dDt.v_filterProjectToImports", ("Vuna.Compiler.Driver.Dt.filterProjectToImports", "Vuna/Compiler/Driver/Dt.vuna:1862"));
  ("Driver_dDt.v_findArity", ("Vuna.Compiler.Driver.Dt.findArity", "Vuna/Compiler/Driver/Dt.vuna:624"));
  ("Driver_dDt.v_findDtDef", ("Vuna.Compiler.Driver.Dt.findDtDef", "Vuna/Compiler/Driver/Dt.vuna:667"));
  ("Driver_dDt.v_findMainDef", ("Vuna.Compiler.Driver.Dt.findMainDef", "Vuna/Compiler/Driver/Dt.vuna:997"));
  ("Driver_dDt.v_findModuleNameField", ("Vuna.Compiler.Driver.Dt.findModuleNameField", "Vuna/Compiler/Driver/Dt.vuna:1606"));
  ("Driver_dDt.v_findModuleNamed", ("Vuna.Compiler.Driver.Dt.findModuleNamed", "Vuna/Compiler/Driver/Dt.vuna:1609"));
  ("Driver_dDt.v_freshMetaName", ("Vuna.Compiler.Driver.Dt.freshMetaName", "Vuna/Compiler/Driver/Dt.vuna:727"));
  ("Driver_dDt.v_generalizeSignature", ("Vuna.Compiler.Driver.Dt.generalizeSignature", "Vuna/Compiler/Driver/Dt.vuna:703"));
  ("Driver_dDt.v_headIsMeta", ("Vuna.Compiler.Driver.Dt.headIsMeta", "Vuna/Compiler/Driver/Dt.vuna:820"));
  ("Driver_dDt.v_imax", ("Vuna.Compiler.Driver.Dt.imax", "Vuna/Compiler/Driver/Dt.vuna:829"));
  ("Driver_dDt.v_importsEdgeCount", ("Vuna.Compiler.Driver.Dt.importsEdgeCount", "Vuna/Compiler/Driver/Dt.vuna:1846"));
  ("Driver_dDt.v_importsOfModuleNames", ("Vuna.Compiler.Driver.Dt.importsOfModuleNames", "Vuna/Compiler/Driver/Dt.vuna:1837"));
  ("Driver_dDt.v_inferEachType", ("Vuna.Compiler.Driver.Dt.inferEachType", "Vuna/Compiler/Driver/Dt.vuna:657"));
  ("Driver_dDt.v_interpMainShow", ("Vuna.Compiler.Driver.Dt.interpMainShow", "Vuna/Compiler/Driver/Dt.vuna:968"));
  ("Driver_dDt.v_isNilRowTermDt", ("Vuna.Compiler.Driver.Dt.isNilRowTermDt", "Vuna/Compiler/Driver/Dt.vuna:992"));
  ("Driver_dDt.v_kindArrows", ("Vuna.Compiler.Driver.Dt.kindArrows", "Vuna/Compiler/Driver/Dt.vuna:751"));
  ("Driver_dDt.v_kindOfArity", ("Vuna.Compiler.Driver.Dt.kindOfArity", "Vuna/Compiler/Driver/Dt.vuna:748"));
  ("Driver_dDt.v_listLen", ("Vuna.Compiler.Driver.Dt.listLen", "Vuna/Compiler/Driver/Dt.vuna:832"));
  ("Driver_dDt.v_loadReplDecls", ("Vuna.Compiler.Driver.Dt.loadReplDecls", "Vuna/Compiler/Driver/Dt.vuna:672"));
  ("Driver_dDt.v_lookupMainKind", ("Vuna.Compiler.Driver.Dt.lookupMainKind", "Vuna/Compiler/Driver/Dt.vuna:909"));
  ("Driver_dDt.v_mainActionKind", ("Vuna.Compiler.Driver.Dt.mainActionKind", "Vuna/Compiler/Driver/Dt.vuna:984"));
  ("Driver_dDt.v_mainKindForName", ("Vuna.Compiler.Driver.Dt.mainKindForName", "Vuna/Compiler/Driver/Dt.vuna:903"));
  ("Driver_dDt.v_mainKindNames", ("Vuna.Compiler.Driver.Dt.mainKindNames", "Vuna/Compiler/Driver/Dt.vuna:899"));
  ("Driver_dDt.v_materializedDeps", ("Vuna.Compiler.Driver.Dt.materializedDeps", "Vuna/Compiler/Driver/Dt.vuna:1876"));
  ("Driver_dDt.v_materializedOwn", ("Vuna.Compiler.Driver.Dt.materializedOwn", "Vuna/Compiler/Driver/Dt.vuna:1882"));
  ("Driver_dDt.v_maxMetaArity", ("Vuna.Compiler.Driver.Dt.maxMetaArity", "Vuna/Compiler/Driver/Dt.vuna:788"));
  ("Driver_dDt.v_maxMetaArityAlts", ("Vuna.Compiler.Driver.Dt.maxMetaArityAlts", "Vuna/Compiler/Driver/Dt.vuna:813"));
  ("Driver_dDt.v_maxMetaArityArgs", ("Vuna.Compiler.Driver.Dt.maxMetaArityArgs", "Vuna/Compiler/Driver/Dt.vuna:809"));
  ("Driver_dDt.v_maxMetaArityMaybe", ("Vuna.Compiler.Driver.Dt.maxMetaArityMaybe", "Vuna/Compiler/Driver/Dt.vuna:805"));
  ("Driver_dDt.v_maxMetaCached", ("Vuna.Compiler.Driver.Dt.maxMetaCached", "Vuna/Compiler/Driver/Dt.vuna:1101"));
  ("Driver_dDt.v_maxMetaCps", ("Vuna.Compiler.Driver.Dt.maxMetaCps", "Vuna/Compiler/Driver/Dt.vuna:1104"));
  ("Driver_dDt.v_maxMetaDef", ("Vuna.Compiler.Driver.Dt.maxMetaDef", "Vuna/Compiler/Driver/Dt.vuna:1095"));
  ("Driver_dDt.v_maxMetaList", ("Vuna.Compiler.Driver.Dt.maxMetaList", "Vuna/Compiler/Driver/Dt.vuna:1091"));
  ("Driver_dDt.v_maybeTermGlobals", ("Vuna.Compiler.Driver.Dt.maybeTermGlobals", "Vuna/Compiler/Driver/Dt.vuna:2103"));
  ("Driver_dDt.v_metaIdsOf", ("Vuna.Compiler.Driver.Dt.metaIdsOf", "Vuna/Compiler/Driver/Dt.vuna:756"));
  ("Driver_dDt.v_metaIdsOfAlt", ("Vuna.Compiler.Driver.Dt.metaIdsOfAlt", "Vuna/Compiler/Driver/Dt.vuna:780"));
  ("Driver_dDt.v_metaIdsOfArgs", ("Vuna.Compiler.Driver.Dt.metaIdsOfArgs", "Vuna/Compiler/Driver/Dt.vuna:776"));
  ("Driver_dDt.v_metaIdsOfMaybe", ("Vuna.Compiler.Driver.Dt.metaIdsOfMaybe", "Vuna/Compiler/Driver/Dt.vuna:772"));
  ("Driver_dDt.v_missingDepModules", ("Vuna.Compiler.Driver.Dt.missingDepModules", "Vuna/Compiler/Driver/Dt.vuna:386"));
  ("Driver_dDt.v_moduleOfIface", ("Vuna.Compiler.Driver.Dt.moduleOfIface", "Vuna/Compiler/Driver/Dt.vuna:1817"));
  ("Driver_dDt.v_moduleOrderLess", ("Vuna.Compiler.Driver.Dt.moduleOrderLess", "Vuna/Compiler/Driver/Dt.vuna:1649"));
  ("Driver_dDt.v_modulesOfIfaces", ("Vuna.Compiler.Driver.Dt.modulesOfIfaces", "Vuna/Compiler/Driver/Dt.vuna:1213"));
  ("Driver_dDt.v_nameSlotTbl", ("Vuna.Compiler.Driver.Dt.nameSlotTbl", "Vuna/Compiler/Driver/Dt.vuna:1199"));
  ("Driver_dDt.v_opaqueSigType", ("Vuna.Compiler.Driver.Dt.opaqueSigType", "Vuna/Compiler/Driver/Dt.vuna:241"));
  ("Driver_dDt.v_pairKeyValue", ("Vuna.Compiler.Driver.Dt.pairKeyValue", "Vuna/Compiler/Driver/Dt.vuna:1680"));
  ("Driver_dDt.v_pickFreshName", ("Vuna.Compiler.Driver.Dt.pickFreshName", "Vuna/Compiler/Driver/Dt.vuna:730"));
  ("Driver_dDt.v_preloadKeepOf", ("Vuna.Compiler.Driver.Dt.preloadKeepOf", "Vuna/Compiler/Driver/Dt.vuna:1872"));
  ("Driver_dDt.v_replCheckParts", ("Vuna.Compiler.Driver.Dt.replCheckParts", "Vuna/Compiler/Driver/Dt.vuna:431"));
  ("Driver_dDt.v_replCheckPartsAux", ("Vuna.Compiler.Driver.Dt.replCheckPartsAux", "Vuna/Compiler/Driver/Dt.vuna:438"));
  ("Driver_dDt.v_replExprName", ("Vuna.Compiler.Driver.Dt.replExprName", "Vuna/Compiler/Driver/Dt.vuna:914"));
  ("Driver_dDt.v_replProgramFull", ("Vuna.Compiler.Driver.Dt.replProgramFull", "Vuna/Compiler/Driver/Dt.vuna:321"));
  ("Driver_dDt.v_replProgramWithIfaces", ("Vuna.Compiler.Driver.Dt.replProgramWithIfaces", "Vuna/Compiler/Driver/Dt.vuna:472"));
  ("Driver_dDt.v_replProgramWithIfacesAux", ("Vuna.Compiler.Driver.Dt.replProgramWithIfacesAux", "Vuna/Compiler/Driver/Dt.vuna:483"));
  ("Driver_dDt.v_sealAbstractAfter", ("Vuna.Compiler.Driver.Dt.sealAbstractAfter", "Vuna/Compiler/Driver/Dt.vuna:218"));
  ("Driver_dDt.v_sealDeclOf", ("Vuna.Compiler.Driver.Dt.sealDeclOf", "Vuna/Compiler/Driver/Dt.vuna:229"));
  ("Driver_dDt.v_sealModule", ("Vuna.Compiler.Driver.Dt.sealModule", "Vuna/Compiler/Driver/Dt.vuna:208"));
  ("Driver_dDt.v_sealOpaqueDecls", ("Vuna.Compiler.Driver.Dt.sealOpaqueDecls", "Vuna/Compiler/Driver/Dt.vuna:205"));
  ("Driver_dDt.v_sealSpan", ("Vuna.Compiler.Driver.Dt.sealSpan", "Vuna/Compiler/Driver/Dt.vuna:238"));
  ("Driver_dDt.v_shiftedDepPrograms", ("Vuna.Compiler.Driver.Dt.shiftedDepPrograms", "Vuna/Compiler/Driver/Dt.vuna:1173"));
  ("Driver_dDt.v_shiftedDepProgramsGo", ("Vuna.Compiler.Driver.Dt.shiftedDepProgramsGo", "Vuna/Compiler/Driver/Dt.vuna:1203"));
  ("Driver_dDt.v_sortNames", ("Vuna.Compiler.Driver.Dt.sortNames", "Vuna/Compiler/Driver/Dt.vuna:1184"));
  ("Driver_dDt.v_spineLen", ("Vuna.Compiler.Driver.Dt.spineLen", "Vuna/Compiler/Driver/Dt.vuna:825"));
  ("Driver_dDt.v_splitGenerateCached", ("Vuna.Compiler.Driver.Dt.splitGenerateCached", "Vuna/Compiler/Driver/Dt.vuna:1750"));
  ("Driver_dDt.v_splitReplExpr", ("Vuna.Compiler.Driver.Dt.splitReplExpr", "Vuna/Compiler/Driver/Dt.vuna:918"));
  ("Driver_dDt.v_stuckText", ("Vuna.Compiler.Driver.Dt.stuckText", "Vuna/Compiler/Driver/Dt.vuna:977"));
  ("Driver_dDt.v_substGenMetas", ("Vuna.Compiler.Driver.Dt.substGenMetas", "Vuna/Compiler/Driver/Dt.vuna:739"));
  ("Driver_dDt.v_topoDepsOf", ("Vuna.Compiler.Driver.Dt.topoDepsOf", "Vuna/Compiler/Driver/Dt.vuna:1614"));
  ("Driver_dDt.v_topoModules", ("Vuna.Compiler.Driver.Dt.topoModules", "Vuna/Compiler/Driver/Dt.vuna:1656"));
  ("Driver_dDt.v_topoVisit", ("Vuna.Compiler.Driver.Dt.topoVisit", "Vuna/Compiler/Driver/Dt.vuna:1624"));
  ("Driver_dDt.v_topoVisitAll", ("Vuna.Compiler.Driver.Dt.topoVisitAll", "Vuna/Compiler/Driver/Dt.vuna:1638"));
  ("Driver_dDt.v_unitCacheEnabled", ("Vuna.Compiler.Driver.Dt.unitCacheEnabled", "Vuna/Compiler/Driver/Dt.vuna:1744"));
  ("Driver_dDt.v_unitCacheLookup", ("Vuna.Compiler.Driver.Dt.unitCacheLookup", "Vuna/Compiler/Driver/Dt.vuna:1719"));
  ("Driver_dDt.v_unitCacheStore", ("Vuna.Compiler.Driver.Dt.unitCacheStore", "Vuna/Compiler/Driver/Dt.vuna:1735"));
  ("Driver_dDt.v_unitDeclsHash", ("Vuna.Compiler.Driver.Dt.unitDeclsHash", "Vuna/Compiler/Driver/Dt.vuna:1668"));
  ("Driver_dDt.v_unitImportKey", ("Vuna.Compiler.Driver.Dt.unitImportKey", "Vuna/Compiler/Driver/Dt.vuna:1690"));
  ("Driver_dDt.v_unitImportsOf", ("Vuna.Compiler.Driver.Dt.unitImportsOf", "Vuna/Compiler/Driver/Dt.vuna:1683"));
  ("Driver_dDt.v_unitKeyOne", ("Vuna.Compiler.Driver.Dt.unitKeyOne", "Vuna/Compiler/Driver/Dt.vuna:1696"));
  ("Driver_dDt.v_unitKeysGo", ("Vuna.Compiler.Driver.Dt.unitKeysGo", "Vuna/Compiler/Driver/Dt.vuna:1702"));
  ("Driver_dDt.v_unitKeysOf", ("Vuna.Compiler.Driver.Dt.unitKeysOf", "Vuna/Compiler/Driver/Dt.vuna:1707"));
  ("Driver_dDt.v_unitModuleId", ("Vuna.Compiler.Driver.Dt.unitModuleId", "Vuna/Compiler/Driver/Dt.vuna:1674"));
  ("Driver_dDt.v_warnUnusedDefsGo", ("Vuna.Compiler.Driver.Dt.warnUnusedDefsGo", "Vuna/Compiler/Driver/Dt.vuna:2112"));
  ("Driver_dDt.v_warnUnusedDefsIn", ("Vuna.Compiler.Driver.Dt.warnUnusedDefsIn", "Vuna/Compiler/Driver/Dt.vuna:2091"));
  ("Driver_dDt.v_warnUnusedDefsTbl", ("Vuna.Compiler.Driver.Dt.warnUnusedDefsTbl", "Vuna/Compiler/Driver/Dt.vuna:2115"));
  ("Driver_dDt.v_wrapGenMetas", ("Vuna.Compiler.Driver.Dt.wrapGenMetas", "Vuna/Compiler/Driver/Dt.vuna:744"));
  ("Driver_dIface.v_allOwnedPresent", ("Vuna.Compiler.Driver.Iface.allOwnedPresent", "Vuna/Compiler/Driver/Iface.vuna:828"));
  ("Driver_dIface.v_artifactNamesOf", ("Vuna.Compiler.Driver.Iface.artifactNamesOf", "Vuna/Compiler/Driver/Iface.vuna:741"));
  ("Driver_dIface.v_bucketOf", ("Vuna.Compiler.Driver.Iface.bucketOf", "Vuna/Compiler/Driver/Iface.vuna:568"));
  ("Driver_dIface.v_canonAlts", ("Vuna.Compiler.Driver.Iface.canonAlts", "Vuna/Compiler/Driver/Iface.vuna:327"));
  ("Driver_dIface.v_canonArgs", ("Vuna.Compiler.Driver.Iface.canonArgs", "Vuna/Compiler/Driver/Iface.vuna:319"));
  ("Driver_dIface.v_canonMaybe", ("Vuna.Compiler.Driver.Iface.canonMaybe", "Vuna/Compiler/Driver/Iface.vuna:338"));
  ("Driver_dIface.v_canonStateEmpty", ("Vuna.Compiler.Driver.Iface.canonStateEmpty", "Vuna/Compiler/Driver/Iface.vuna:272"));
  ("Driver_dIface.v_canonTerm", ("Vuna.Compiler.Driver.Iface.canonTerm", "Vuna/Compiler/Driver/Iface.vuna:275"));
  ("Driver_dIface.v_canonTermTop", ("Vuna.Compiler.Driver.Iface.canonTermTop", "Vuna/Compiler/Driver/Iface.vuna:335"));
  ("Driver_dIface.v_cleanIfaceOf", ("Vuna.Compiler.Driver.Iface.cleanIfaceOf", "Vuna/Compiler/Driver/Iface.vuna:628"));
  ("Driver_dIface.v_coverageIssueGo", ("Vuna.Compiler.Driver.Iface.coverageIssueGo", "Vuna/Compiler/Driver/Iface.vuna:731"));
  ("Driver_dIface.v_coverageIssueOf", ("Vuna.Compiler.Driver.Iface.coverageIssueOf", "Vuna/Compiler/Driver/Iface.vuna:720"));
  ("Driver_dIface.v_coverageResult", ("Vuna.Compiler.Driver.Iface.coverageResult", "Vuna/Compiler/Driver/Iface.vuna:781"));
  ("Driver_dIface.v_cpOfModule", ("Vuna.Compiler.Driver.Iface.cpOfModule", "Vuna/Compiler/Driver/Iface.vuna:592"));
  ("Driver_dIface.v_ctorFamilyPairs", ("Vuna.Compiler.Driver.Iface.ctorFamilyPairs", "Vuna/Compiler/Driver/Iface.vuna:507"));
  ("Driver_dIface.v_ctorNamesOf", ("Vuna.Compiler.Driver.Iface.ctorNamesOf", "Vuna/Compiler/Driver/Iface.vuna:751"));
  ("Driver_dIface.v_ctorOwnerOf", ("Vuna.Compiler.Driver.Iface.ctorOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:512"));
  ("Driver_dIface.v_dataNamesOf", ("Vuna.Compiler.Driver.Iface.dataNamesOf", "Vuna/Compiler/Driver/Iface.vuna:748"));
  ("Driver_dIface.v_dataOwnerOf", ("Vuna.Compiler.Driver.Iface.dataOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:500"));
  ("Driver_dIface.v_decDefLoc", ("Vuna.Compiler.Driver.Iface.decDefLoc", "Vuna/Compiler/Driver/Iface.vuna:890"));
  ("Driver_dIface.v_decDepPair", ("Vuna.Compiler.Driver.Iface.decDepPair", "Vuna/Compiler/Driver/Iface.vuna:880"));
  ("Driver_dIface.v_decModuleIfaceAt", ("Vuna.Compiler.Driver.Iface.decModuleIfaceAt", "Vuna/Compiler/Driver/Iface.vuna:910"));
  ("Driver_dIface.v_decModuleIfaceComplete", ("Vuna.Compiler.Driver.Iface.decModuleIfaceComplete", "Vuna/Compiler/Driver/Iface.vuna:934"));
  ("Driver_dIface.v_decModuleIfacePayload", ("Vuna.Compiler.Driver.Iface.decModuleIfacePayload", "Vuna/Compiler/Driver/Iface.vuna:913"));
  ("Driver_dIface.v_decSourceInfo", ("Vuna.Compiler.Driver.Iface.decSourceInfo", "Vuna/Compiler/Driver/Iface.vuna:871"));
  ("Driver_dIface.v_defLocOf", ("Vuna.Compiler.Driver.Iface.defLocOf", "Vuna/Compiler/Driver/Iface.vuna:161"));
  ("Driver_dIface.v_defLocsOfDefs", ("Vuna.Compiler.Driver.Iface.defLocsOfDefs", "Vuna/Compiler/Driver/Iface.vuna:170"));
  ("Driver_dIface.v_defOwnerOf", ("Vuna.Compiler.Driver.Iface.defOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:494"));
  ("Driver_dIface.v_defView", ("Vuna.Compiler.Driver.Iface.defView", "Vuna/Compiler/Driver/Iface.vuna:344"));
  ("Driver_dIface.v_depHashesOf", ("Vuna.Compiler.Driver.Iface.depHashesOf", "Vuna/Compiler/Driver/Iface.vuna:625"));
  ("Driver_dIface.v_depMissingHash", ("Vuna.Compiler.Driver.Iface.depMissingHash", "Vuna/Compiler/Driver/Iface.vuna:252"));
  ("Driver_dIface.v_digestParts", ("Vuna.Compiler.Driver.Iface.digestParts", "Vuna/Compiler/Driver/Iface.vuna:244"));
  ("Driver_dIface.v_encDefLoc", ("Vuna.Compiler.Driver.Iface.encDefLoc", "Vuna/Compiler/Driver/Iface.vuna:887"));
  ("Driver_dIface.v_encDefView", ("Vuna.Compiler.Driver.Iface.encDefView", "Vuna/Compiler/Driver/Iface.vuna:352"));
  ("Driver_dIface.v_encDepPair", ("Vuna.Compiler.Driver.Iface.encDepPair", "Vuna/Compiler/Driver/Iface.vuna:877"));
  ("Driver_dIface.v_encGlobal", ("Vuna.Compiler.Driver.Iface.encGlobal", "Vuna/Compiler/Driver/Iface.vuna:382"));
  ("Driver_dIface.v_encModuleIface", ("Vuna.Compiler.Driver.Iface.encModuleIface", "Vuna/Compiler/Driver/Iface.vuna:907"));
  ("Driver_dIface.v_encModuleIfaceAt", ("Vuna.Compiler.Driver.Iface.encModuleIfaceAt", "Vuna/Compiler/Driver/Iface.vuna:904"));
  ("Driver_dIface.v_encModuleIfacePayload", ("Vuna.Compiler.Driver.Iface.encModuleIfacePayload", "Vuna/Compiler/Driver/Iface.vuna:897"));
  ("Driver_dIface.v_encSourceInfo", ("Vuna.Compiler.Driver.Iface.encSourceInfo", "Vuna/Compiler/Driver/Iface.vuna:868"));
  ("Driver_dIface.v_exportKeyOf", ("Vuna.Compiler.Driver.Iface.exportKeyOf", "Vuna/Compiler/Driver/Iface.vuna:389"));
  ("Driver_dIface.v_findNamedModule", ("Vuna.Compiler.Driver.Iface.findNamedModule", "Vuna/Compiler/Driver/Iface.vuna:808"));
  ("Driver_dIface.v_finishIface", ("Vuna.Compiler.Driver.Iface.finishIface", "Vuna/Compiler/Driver/Iface.vuna:676"));
  ("Driver_dIface.v_firstCoverageIssue", ("Vuna.Compiler.Driver.Iface.firstCoverageIssue", "Vuna/Compiler/Driver/Iface.vuna:765"));
  ("Driver_dIface.v_flatParts", ("Vuna.Compiler.Driver.Iface.flatParts", "Vuna/Compiler/Driver/Iface.vuna:247"));
  ("Driver_dIface.v_globalOwnerOf", ("Vuna.Compiler.Driver.Iface.globalOwnerOf", "Vuna/Compiler/Driver/Iface.vuna:525"));
  ("Driver_dIface.v_hasMissingDep", ("Vuna.Compiler.Driver.Iface.hasMissingDep", "Vuna/Compiler/Driver/Iface.vuna:615"));
  ("Driver_dIface.v_hashClasses", ("Vuna.Compiler.Driver.Iface.hashClasses", "Vuna/Compiler/Driver/Iface.vuna:377"));
  ("Driver_dIface.v_hashDatas", ("Vuna.Compiler.Driver.Iface.hashDatas", "Vuna/Compiler/Driver/Iface.vuna:371"));
  ("Driver_dIface.v_hashDecls", ("Vuna.Compiler.Driver.Iface.hashDecls", "Vuna/Compiler/Driver/Iface.vuna:410"));
  ("Driver_dIface.v_hashDeclsForIface", ("Vuna.Compiler.Driver.Iface.hashDeclsForIface", "Vuna/Compiler/Driver/Iface.vuna:423"));
  ("Driver_dIface.v_hashDefView", ("Vuna.Compiler.Driver.Iface.hashDefView", "Vuna/Compiler/Driver/Iface.vuna:355"));
  ("Driver_dIface.v_hashDefs", ("Vuna.Compiler.Driver.Iface.hashDefs", "Vuna/Compiler/Driver/Iface.vuna:362"));
  ("Driver_dIface.v_hashExports", ("Vuna.Compiler.Driver.Iface.hashExports", "Vuna/Compiler/Driver/Iface.vuna:392"));
  ("Driver_dIface.v_hashFixities", ("Vuna.Compiler.Driver.Iface.hashFixities", "Vuna/Compiler/Driver/Iface.vuna:396"));
  ("Driver_dIface.v_hashGlobals", ("Vuna.Compiler.Driver.Iface.hashGlobals", "Vuna/Compiler/Driver/Iface.vuna:385"));
  ("Driver_dIface.v_hashImports", ("Vuna.Compiler.Driver.Iface.hashImports", "Vuna/Compiler/Driver/Iface.vuna:404"));
  ("Driver_dIface.v_hashInsts", ("Vuna.Compiler.Driver.Iface.hashInsts", "Vuna/Compiler/Driver/Iface.vuna:374"));
  ("Driver_dIface.v_hashOfIface", ("Vuna.Compiler.Driver.Iface.hashOfIface", "Vuna/Compiler/Driver/Iface.vuna:455"));
  ("Driver_dIface.v_hashOfImportName", ("Vuna.Compiler.Driver.Iface.hashOfImportName", "Vuna/Compiler/Driver/Iface.vuna:619"));
  ("Driver_dIface.v_hashOpaque", ("Vuna.Compiler.Driver.Iface.hashOpaque", "Vuna/Compiler/Driver/Iface.vuna:367"));
  ("Driver_dIface.v_hashRecords", ("Vuna.Compiler.Driver.Iface.hashRecords", "Vuna/Compiler/Driver/Iface.vuna:400"));
  ("Driver_dIface.v_hashTextStrong", ("Vuna.Compiler.Driver.Iface.hashTextStrong", "Vuna/Compiler/Driver/Iface.vuna:227"));
  ("Driver_dIface.v_ifaceArtifactNames", ("Vuna.Compiler.Driver.Iface.ifaceArtifactNames", "Vuna/Compiler/Driver/Iface.vuna:762"));
  ("Driver_dIface.v_ifaceHashVersion", ("Vuna.Compiler.Driver.Iface.ifaceHashVersion", "Vuna/Compiler/Driver/Iface.vuna:217"));
  ("Driver_dIface.v_ifaceNamesOf", ("Vuna.Compiler.Driver.Iface.ifaceNamesOf", "Vuna/Compiler/Driver/Iface.vuna:754"));
  ("Driver_dIface.v_ifaceOfModule", ("Vuna.Compiler.Driver.Iface.ifaceOfModule", "Vuna/Compiler/Driver/Iface.vuna:838"));
  ("Driver_dIface.v_ifaceOfPackage", ("Vuna.Compiler.Driver.Iface.ifaceOfPackage", "Vuna/Compiler/Driver/Iface.vuna:787"));
  ("Driver_dIface.v_ifacePreludeNames", ("Vuna.Compiler.Driver.Iface.ifacePreludeNames", "Vuna/Compiler/Driver/Iface.vuna:520"));
  ("Driver_dIface.v_ifaceSchema", ("Vuna.Compiler.Driver.Iface.ifaceSchema", "Vuna/Compiler/Driver/Iface.vuna:212"));
  ("Driver_dIface.v_ifacesGo", ("Vuna.Compiler.Driver.Iface.ifacesGo", "Vuna/Compiler/Driver/Iface.vuna:698"));
  ("Driver_dIface.v_importNameOf", ("Vuna.Compiler.Driver.Iface.importNameOf", "Vuna/Compiler/Driver/Iface.vuna:607"));
  ("Driver_dIface.v_importNamesOfModule", ("Vuna.Compiler.Driver.Iface.importNamesOfModule", "Vuna/Compiler/Driver/Iface.vuna:610"));
  ("Driver_dIface.v_isSealName", ("Vuna.Compiler.Driver.Iface.isSealName", "Vuna/Compiler/Driver/Iface.vuna:738"));
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
  ("Driver_dIface.v_mkIfaceBase", ("Vuna.Compiler.Driver.Iface.mkIfaceBase", "Vuna/Compiler/Driver/Iface.vuna:637"));
  ("Driver_dIface.v_moduleCoverageOk", ("Vuna.Compiler.Driver.Iface.moduleCoverageOk", "Vuna/Compiler/Driver/Iface.vuna:822"));
  ("Driver_dIface.v_moduleHashes", ("Vuna.Compiler.Driver.Iface.moduleHashes", "Vuna/Compiler/Driver/Iface.vuna:429"));
  ("Driver_dIface.v_moduleNamesOf", ("Vuna.Compiler.Driver.Iface.moduleNamesOf", "Vuna/Compiler/Driver/Iface.vuna:863"));
  ("Driver_dIface.v_ownedByModule", ("Vuna.Compiler.Driver.Iface.ownedByModule", "Vuna/Compiler/Driver/Iface.vuna:819"));
  ("Driver_dIface.v_ownerIndexOf", ("Vuna.Compiler.Driver.Iface.ownerIndexOf", "Vuna/Compiler/Driver/Iface.vuna:537"));
  ("Driver_dIface.v_ownerOfAny", ("Vuna.Compiler.Driver.Iface.ownerOfAny", "Vuna/Compiler/Driver/Iface.vuna:711"));
  ("Driver_dIface.v_partOf", ("Vuna.Compiler.Driver.Iface.partOf", "Vuna/Compiler/Driver/Iface.vuna:240"));
  ("Driver_dIface.v_partitionByOwner", ("Vuna.Compiler.Driver.Iface.partitionByOwner", "Vuna/Compiler/Driver/Iface.vuna:558"));
  ("Driver_dIface.v_partitionByOwnerGo", ("Vuna.Compiler.Driver.Iface.partitionByOwnerGo", "Vuna/Compiler/Driver/Iface.vuna:561"));
  ("Driver_dIface.v_payloadDigest", ("Vuna.Compiler.Driver.Iface.payloadDigest", "Vuna/Compiler/Driver/Iface.vuna:236"));
  ("Driver_dIface.v_pkgIfaceHashOfModules", ("Vuna.Compiler.Driver.Iface.pkgIfaceHashOfModules", "Vuna/Compiler/Driver/Iface.vuna:462"));
  ("Driver_dIface.v_pkgImplHashOfModules", ("Vuna.Compiler.Driver.Iface.pkgImplHashOfModules", "Vuna/Compiler/Driver/Iface.vuna:466"));
  ("Driver_dIface.v_prefixOwner", ("Vuna.Compiler.Driver.Iface.prefixOwner", "Vuna/Compiler/Driver/Iface.vuna:488"));
  ("Driver_dIface.v_preparedForModule", ("Vuna.Compiler.Driver.Iface.preparedForModule", "Vuna/Compiler/Driver/Iface.vuna:176"));
  ("Driver_dIface.v_progPartsOf", ("Vuna.Compiler.Driver.Iface.progPartsOf", "Vuna/Compiler/Driver/Iface.vuna:580"));
  ("Driver_dIface.v_reverseBucket", ("Vuna.Compiler.Driver.Iface.reverseBucket", "Vuna/Compiler/Driver/Iface.vuna:577"));
  ("Driver_dIface.v_reverseBuckets", ("Vuna.Compiler.Driver.Iface.reverseBuckets", "Vuna/Compiler/Driver/Iface.vuna:574"));
  ("Driver_dIface.v_sameOwner", ("Vuna.Compiler.Driver.Iface.sameOwner", "Vuna/Compiler/Driver/Iface.vuna:815"));
  ("Driver_dIface.v_setPrepared", ("Vuna.Compiler.Driver.Iface.setPrepared", "Vuna/Compiler/Driver/Iface.vuna:192"));
  ("Driver_dIface.v_shaText", ("Vuna.Compiler.Driver.Iface.shaText", "Vuna/Compiler/Driver/Iface.vuna:231"));
  ("Driver_dIface.v_siHashOf", ("Vuna.Compiler.Driver.Iface.siHashOf", "Vuna/Compiler/Driver/Iface.vuna:104"));
  ("Driver_dIface.v_siMtimeOf", ("Vuna.Compiler.Driver.Iface.siMtimeOf", "Vuna/Compiler/Driver/Iface.vuna:107"));
  ("Driver_dIface.v_siPathOf", ("Vuna.Compiler.Driver.Iface.siPathOf", "Vuna/Compiler/Driver/Iface.vuna:101"));
  ("Driver_dIface.v_siSizeOf", ("Vuna.Compiler.Driver.Iface.siSizeOf", "Vuna/Compiler/Driver/Iface.vuna:110"));
  ("Driver_dIface.v_sortByText", ("Vuna.Compiler.Driver.Iface.sortByText", "Vuna/Compiler/Driver/Iface.vuna:262"));
  ("Driver_dIface.v_sortModuleIfaces", ("Vuna.Compiler.Driver.Iface.sortModuleIfaces", "Vuna/Compiler/Driver/Iface.vuna:471"));
  ("Driver_dIface.v_sortTextPairs", ("Vuna.Compiler.Driver.Iface.sortTextPairs", "Vuna/Compiler/Driver/Iface.vuna:259"));
  ("Driver_dIface.v_sourceOf", ("Vuna.Compiler.Driver.Iface.sourceOf", "Vuna/Compiler/Driver/Iface.vuna:603"));
  ("Driver_dIface.v_stripOpaqueDeclBodies", ("Vuna.Compiler.Driver.Iface.stripOpaqueDeclBodies", "Vuna/Compiler/Driver/Iface.vuna:415"));
  ("Driver_dIface.v_tblOwner", ("Vuna.Compiler.Driver.Iface.tblOwner", "Vuna/Compiler/Driver/Iface.vuna:485"));
  ("Driver_dOwner.v_entryOwner", ("Vuna.Compiler.Driver.Owner.entryOwner", "Vuna/Compiler/Driver/Owner.vuna:29"));
  ("Driver_dOwner.v_hasFieldOwnerOf", ("Vuna.Compiler.Driver.Owner.hasFieldOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:90"));
  ("Driver_dOwner.v_hasFieldRecordTypeExpr", ("Vuna.Compiler.Driver.Owner.hasFieldRecordTypeExpr", "Vuna/Compiler/Driver/Owner.vuna:82"));
  ("Driver_dOwner.v_headClassName", ("Vuna.Compiler.Driver.Owner.headClassName", "Vuna/Compiler/Driver/Owner.vuna:59"));
  ("Driver_dOwner.v_isSyntheticInternalName", ("Vuna.Compiler.Driver.Owner.isSyntheticInternalName", "Vuna/Compiler/Driver/Owner.vuna:208"));
  ("Driver_dOwner.v_knownModuleOrErr", ("Vuna.Compiler.Driver.Owner.knownModuleOrErr", "Vuna/Compiler/Driver/Owner.vuna:186"));
  ("Driver_dOwner.v_lookupModuleOf", ("Vuna.Compiler.Driver.Owner.lookupModuleOf", "Vuna/Compiler/Driver/Owner.vuna:183"));
  ("Driver_dOwner.v_modulePrefixOfName", ("Vuna.Compiler.Driver.Owner.modulePrefixOfName", "Vuna/Compiler/Driver/Owner.vuna:33"));
  ("Driver_dOwner.v_nameOwnerPairsOfDatas", ("Vuna.Compiler.Driver.Owner.nameOwnerPairsOfDatas", "Vuna/Compiler/Driver/Owner.vuna:230"));
  ("Driver_dOwner.v_nameOwnerPairsOfDefs", ("Vuna.Compiler.Driver.Owner.nameOwnerPairsOfDefs", "Vuna/Compiler/Driver/Owner.vuna:223"));
  ("Driver_dOwner.v_splitDataNames", ("Vuna.Compiler.Driver.Owner.splitDataNames", "Vuna/Compiler/Driver/Owner.vuna:51"));
  ("Driver_dOwner.v_splitDataOwnerEntriesOf", ("Vuna.Compiler.Driver.Owner.splitDataOwnerEntriesOf", "Vuna/Compiler/Driver/Owner.vuna:140"));
  ("Driver_dOwner.v_splitDataOwnerEntriesOfModules", ("Vuna.Compiler.Driver.Owner.splitDataOwnerEntriesOfModules", "Vuna/Compiler/Driver/Owner.vuna:151"));
  ("Driver_dOwner.v_splitDataOwnerOf", ("Vuna.Compiler.Driver.Owner.splitDataOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:195"));
  ("Driver_dOwner.v_splitDeclNames", ("Vuna.Compiler.Driver.Owner.splitDeclNames", "Vuna/Compiler/Driver/Owner.vuna:39"));
  ("Driver_dOwner.v_splitDefOwnerOf", ("Vuna.Compiler.Driver.Owner.splitDefOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:211"));
  ("Driver_dOwner.v_splitDerivedOwners", ("Vuna.Compiler.Driver.Owner.splitDerivedOwners", "Vuna/Compiler/Driver/Owner.vuna:112"));
  ("Driver_dOwner.v_splitHasFieldOwners", ("Vuna.Compiler.Driver.Owner.splitHasFieldOwners", "Vuna/Compiler/Driver/Owner.vuna:107"));
  ("Driver_dOwner.v_splitInstanceOwnerOf", ("Vuna.Compiler.Driver.Owner.splitInstanceOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:69"));
  ("Driver_dOwner.v_splitInstanceOwnersGo", ("Vuna.Compiler.Driver.Owner.splitInstanceOwnersGo", "Vuna/Compiler/Driver/Owner.vuna:129"));
  ("Driver_dOwner.v_splitMetaOf", ("Vuna.Compiler.Driver.Owner.splitMetaOf", "Vuna/Compiler/Driver/Owner.vuna:166"));
  ("Driver_dOwner.v_splitNoSpan", ("Vuna.Compiler.Driver.Owner.splitNoSpan", "Vuna/Compiler/Driver/Owner.vuna:25"));
  ("Driver_dOwner.v_splitOwnerEntriesOf", ("Vuna.Compiler.Driver.Owner.splitOwnerEntriesOf", "Vuna/Compiler/Driver/Owner.vuna:134"));
  ("Driver_dOwner.v_splitOwnerEntriesOfModules", ("Vuna.Compiler.Driver.Owner.splitOwnerEntriesOfModules", "Vuna/Compiler/Driver/Owner.vuna:146"));
  ("Driver_dOwner.v_splitTraitDataOwnerOf", ("Vuna.Compiler.Driver.Owner.splitTraitDataOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:125"));
  ("Driver_dOwner.v_splitTraitDefOwnerOf", ("Vuna.Compiler.Driver.Owner.splitTraitDefOwnerOf", "Vuna/Compiler/Driver/Owner.vuna:120"));
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
  ("Driver_dSplit.v_decSplitFile", ("Vuna.Compiler.Driver.Split.decSplitFile", "Vuna/Compiler/Driver/Split.vuna:398"));
  ("Driver_dSplit.v_decSplitFileComplete", ("Vuna.Compiler.Driver.Split.decSplitFileComplete", "Vuna/Compiler/Driver/Split.vuna:418"));
  ("Driver_dSplit.v_decSplitFilesComplete", ("Vuna.Compiler.Driver.Split.decSplitFilesComplete", "Vuna/Compiler/Driver/Split.vuna:411"));
  ("Driver_dSplit.v_depsSuffix", ("Vuna.Compiler.Driver.Split.depsSuffix", "Vuna/Compiler/Driver/Split.vuna:258"));
  ("Driver_dSplit.v_depthEntryLess", ("Vuna.Compiler.Driver.Split.depthEntryLess", "Vuna/Compiler/Driver/Split.vuna:348"));
  ("Driver_dSplit.v_depthOfDeps", ("Vuna.Compiler.Driver.Split.depthOfDeps", "Vuna/Compiler/Driver/Split.vuna:114"));
  ("Driver_dSplit.v_depthOfUnit", ("Vuna.Compiler.Driver.Split.depthOfUnit", "Vuna/Compiler/Driver/Split.vuna:118"));
  ("Driver_dSplit.v_encSplitFile", ("Vuna.Compiler.Driver.Split.encSplitFile", "Vuna/Compiler/Driver/Split.vuna:395"));
  ("Driver_dSplit.v_encSplitFiles", ("Vuna.Compiler.Driver.Split.encSplitFiles", "Vuna/Compiler/Driver/Split.vuna:407"));
  ("Driver_dSplit.v_filesOfDepthEntries", ("Vuna.Compiler.Driver.Split.filesOfDepthEntries", "Vuna/Compiler/Driver/Split.vuna:359"));
  ("Driver_dSplit.v_fixDepths", ("Vuna.Compiler.Driver.Split.fixDepths", "Vuna/Compiler/Driver/Split.vuna:338"));
  ("Driver_dSplit.v_graphMaxDepth", ("Vuna.Compiler.Driver.Split.graphMaxDepth", "Vuna/Compiler/Driver/Split.vuna:124"));
  ("Driver_dSplit.v_markNames", ("Vuna.Compiler.Driver.Split.markNames", "Vuna/Compiler/Driver/Split.vuna:300"));
  ("Driver_dSplit.v_maxDepth", ("Vuna.Compiler.Driver.Split.maxDepth", "Vuna/Compiler/Driver/Split.vuna:317"));
  ("Driver_dSplit.v_maxInt", ("Vuna.Compiler.Driver.Split.maxInt", "Vuna/Compiler/Driver/Split.vuna:129"));
  ("Driver_dSplit.v_nameSetOf", ("Vuna.Compiler.Driver.Split.nameSetOf", "Vuna/Compiler/Driver/Split.vuna:295"));
  ("Driver_dSplit.v_normalizeFileDeps", ("Vuna.Compiler.Driver.Split.normalizeFileDeps", "Vuna/Compiler/Driver/Split.vuna:384"));
  ("Driver_dSplit.v_sameDepthTable", ("Vuna.Compiler.Driver.Split.sameDepthTable", "Vuna/Compiler/Driver/Split.vuna:333"));
  ("Driver_dSplit.v_sortDepEntries", ("Vuna.Compiler.Driver.Split.sortDepEntries", "Vuna/Compiler/Driver/Split.vuna:381"));
  ("Driver_dSplit.v_sortDepsByTie", ("Vuna.Compiler.Driver.Split.sortDepsByTie", "Vuna/Compiler/Driver/Split.vuna:378"));
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
  ("Driver_dSplitGen.v_cachedUnitOk", ("Vuna.Compiler.Driver.SplitGen.cachedUnitOk", "Vuna/Compiler/Driver/SplitGen.vuna:152"));
  ("Driver_dSplitGen.v_checkDataOwners", ("Vuna.Compiler.Driver.SplitGen.checkDataOwners", "Vuna/Compiler/Driver/SplitGen.vuna:299"));
  ("Driver_dSplitGen.v_checkDefOwners", ("Vuna.Compiler.Driver.SplitGen.checkDefOwners", "Vuna/Compiler/Driver/SplitGen.vuna:292"));
  ("Driver_dSplitGen.v_checkDepsKnown", ("Vuna.Compiler.Driver.SplitGen.checkDepsKnown", "Vuna/Compiler/Driver/SplitGen.vuna:126"));
  ("Driver_dSplitGen.v_checkEntryDeclName", ("Vuna.Compiler.Driver.SplitGen.checkEntryDeclName", "Vuna/Compiler/Driver/SplitGen.vuna:268"));
  ("Driver_dSplitGen.v_checkEntryDecls", ("Vuna.Compiler.Driver.SplitGen.checkEntryDecls", "Vuna/Compiler/Driver/SplitGen.vuna:287"));
  ("Driver_dSplitGen.v_checkEntryDeclsGo", ("Vuna.Compiler.Driver.SplitGen.checkEntryDeclsGo", "Vuna/Compiler/Driver/SplitGen.vuna:280"));
  ("Driver_dSplitGen.v_checkModuleDeclName", ("Vuna.Compiler.Driver.SplitGen.checkModuleDeclName", "Vuna/Compiler/Driver/SplitGen.vuna:221"));
  ("Driver_dSplitGen.v_checkModuleDeclNames", ("Vuna.Compiler.Driver.SplitGen.checkModuleDeclNames", "Vuna/Compiler/Driver/SplitGen.vuna:233"));
  ("Driver_dSplitGen.v_checkModuleDecls", ("Vuna.Compiler.Driver.SplitGen.checkModuleDecls", "Vuna/Compiler/Driver/SplitGen.vuna:240"));
  ("Driver_dSplitGen.v_checkResolvedModules", ("Vuna.Compiler.Driver.SplitGen.checkResolvedModules", "Vuna/Compiler/Driver/SplitGen.vuna:304"));
  ("Driver_dSplitGen.v_checkSplitAcyclic", ("Vuna.Compiler.Driver.SplitGen.checkSplitAcyclic", "Vuna/Compiler/Driver/SplitGen.vuna:180"));
  ("Driver_dSplitGen.v_checkSplitNames", ("Vuna.Compiler.Driver.SplitGen.checkSplitNames", "Vuna/Compiler/Driver/SplitGen.vuna:170"));
  ("Driver_dSplitGen.v_compilerPkgPrefix", ("Vuna.Compiler.Driver.SplitGen.compilerPkgPrefix", "Vuna/Compiler/Driver/SplitGen.vuna:40"));
  ("Driver_dSplitGen.v_dataBucketsGo", ("Vuna.Compiler.Driver.SplitGen.dataBucketsGo", "Vuna/Compiler/Driver/SplitGen.vuna:99"));
  ("Driver_dSplitGen.v_dataBucketsOf", ("Vuna.Compiler.Driver.SplitGen.dataBucketsOf", "Vuna/Compiler/Driver/SplitGen.vuna:96"));
  ("Driver_dSplitGen.v_datasOfUnit", ("Vuna.Compiler.Driver.SplitGen.datasOfUnit", "Vuna/Compiler/Driver/SplitGen.vuna:209"));
  ("Driver_dSplitGen.v_defBucketsGo", ("Vuna.Compiler.Driver.SplitGen.defBucketsGo", "Vuna/Compiler/Driver/SplitGen.vuna:82"));
  ("Driver_dSplitGen.v_defBucketsOf", ("Vuna.Compiler.Driver.SplitGen.defBucketsOf", "Vuna/Compiler/Driver/SplitGen.vuna:79"));
  ("Driver_dSplitGen.v_defsOfUnit", ("Vuna.Compiler.Driver.SplitGen.defsOfUnit", "Vuna/Compiler/Driver/SplitGen.vuna:203"));
  ("Driver_dSplitGen.v_depsInOrder", ("Vuna.Compiler.Driver.SplitGen.depsInOrder", "Vuna/Compiler/Driver/SplitGen.vuna:137"));
  ("Driver_dSplitGen.v_depsKnown", ("Vuna.Compiler.Driver.SplitGen.depsKnown", "Vuna/Compiler/Driver/SplitGen.vuna:155"));
  ("Driver_dSplitGen.v_entryDeclIdentities", ("Vuna.Compiler.Driver.SplitGen.entryDeclIdentities", "Vuna/Compiler/Driver/SplitGen.vuna:251"));
  ("Driver_dSplitGen.v_entryDeclKey", ("Vuna.Compiler.Driver.SplitGen.entryDeclKey", "Vuna/Compiler/Driver/SplitGen.vuna:264"));
  ("Driver_dSplitGen.v_generateDtSplitProgram", ("Vuna.Compiler.Driver.SplitGen.generateDtSplitProgram", "Vuna/Compiler/Driver/SplitGen.vuna:348"));
  ("Driver_dSplitGen.v_generateDtSplitProgramWith", ("Vuna.Compiler.Driver.SplitGen.generateDtSplitProgramWith", "Vuna/Compiler/Driver/SplitGen.vuna:363"));
  ("Driver_dSplitGen.v_keepCached", ("Vuna.Compiler.Driver.SplitGen.keepCached", "Vuna/Compiler/Driver/SplitGen.vuna:160"));
  ("Driver_dSplitGen.v_knownUnit", ("Vuna.Compiler.Driver.SplitGen.knownUnit", "Vuna/Compiler/Driver/SplitGen.vuna:123"));
  ("Driver_dSplitGen.v_mainInitPrologue", ("Vuna.Compiler.Driver.SplitGen.mainInitPrologue", "Vuna/Compiler/Driver/SplitGen.vuna:65"));
  ("Driver_dSplitGen.v_mapToUnit", ("Vuna.Compiler.Driver.SplitGen.mapToUnit", "Vuna/Compiler/Driver/SplitGen.vuna:215"));
  ("Driver_dSplitGen.v_noUnitLookup", ("Vuna.Compiler.Driver.SplitGen.noUnitLookup", "Vuna/Compiler/Driver/SplitGen.vuna:340"));
  ("Driver_dSplitGen.v_noUnitStore", ("Vuna.Compiler.Driver.SplitGen.noUnitStore", "Vuna/Compiler/Driver/SplitGen.vuna:343"));
  ("Driver_dSplitGen.v_ownerTblOf", ("Vuna.Compiler.Driver.SplitGen.ownerTblOf", "Vuna/Compiler/Driver/SplitGen.vuna:73"));
  ("Driver_dSplitGen.v_splitLocPath", ("Vuna.Compiler.Driver.SplitGen.splitLocPath", "Vuna/Compiler/Driver/SplitGen.vuna:334"));
  ("Driver_dSplitGen.v_splitMainFileWith", ("Vuna.Compiler.Driver.SplitGen.splitMainFileWith", "Vuna/Compiler/Driver/SplitGen.vuna:540"));
  ("Driver_dSplitGen.v_splitModuleFilesWith", ("Vuna.Compiler.Driver.SplitGen.splitModuleFilesWith", "Vuna/Compiler/Driver/SplitGen.vuna:495"));
  ("Driver_dSplitGen.v_splitProgramCheckedWith", ("Vuna.Compiler.Driver.SplitGen.splitProgramCheckedWith", "Vuna/Compiler/Driver/SplitGen.vuna:426"));
  ("Driver_dSplitGen.v_splitProgramFilesWith", ("Vuna.Compiler.Driver.SplitGen.splitProgramFilesWith", "Vuna/Compiler/Driver/SplitGen.vuna:408"));
  ("Driver_dSplitGen.v_splitStripDotSlash", ("Vuna.Compiler.Driver.SplitGen.splitStripDotSlash", "Vuna/Compiler/Driver/SplitGen.vuna:330"));
  ("Driver_dSplitGen.v_splitStripPrefix", ("Vuna.Compiler.Driver.SplitGen.splitStripPrefix", "Vuna/Compiler/Driver/SplitGen.vuna:316"));
  ("Driver_dSplitGen.v_splitStripRoots", ("Vuna.Compiler.Driver.SplitGen.splitStripRoots", "Vuna/Compiler/Driver/SplitGen.vuna:325"));
  ("Driver_dSplitGen.v_splitUnitOfModule", ("Vuna.Compiler.Driver.SplitGen.splitUnitOfModule", "Vuna/Compiler/Driver/SplitGen.vuna:37"));
  ("Driver_dSplitGen.v_splitWithOwnersWith", ("Vuna.Compiler.Driver.SplitGen.splitWithOwnersWith", "Vuna/Compiler/Driver/SplitGen.vuna:450"));
  ("Driver_dSplitGen.v_uniqueSplitNames", ("Vuna.Compiler.Driver.SplitGen.uniqueSplitNames", "Vuna/Compiler/Driver/SplitGen.vuna:165"));
  ("Driver_dSplitGen.v_unitDepsOf", ("Vuna.Compiler.Driver.SplitGen.unitDepsOf", "Vuna/Compiler/Driver/SplitGen.vuna:140"));
  ("Driver_dSplitGen.v_unitOfLocName", ("Vuna.Compiler.Driver.SplitGen.unitOfLocName", "Vuna/Compiler/Driver/SplitGen.vuna:57"));
  ("Driver_dSplitGen.v_unitPathOf", ("Vuna.Compiler.Driver.SplitGen.unitPathOf", "Vuna/Compiler/Driver/SplitGen.vuna:46"));
  ("Driver_dTarget.v_backendBinaryName", ("Vuna.Compiler.Driver.Target.backendBinaryName", "Vuna/Compiler/Driver/Target.vuna:33"));
  ("Driver_dTarget.v_backendPath", ("Vuna.Compiler.Driver.Target.backendPath", "Vuna/Compiler/Driver/Target.vuna:172"));
  ("Driver_dTarget.v_compileBackend", ("Vuna.Compiler.Driver.Target.compileBackend", "Vuna/Compiler/Driver/Target.vuna:73"));
  ("Driver_dTarget.v_decodedDiags", ("Vuna.Compiler.Driver.Target.decodedDiags", "Vuna/Compiler/Driver/Target.vuna:143"));
  ("Driver_dTarget.v_diagPathOf", ("Vuna.Compiler.Driver.Target.diagPathOf", "Vuna/Compiler/Driver/Target.vuna:178"));
  ("Driver_dTarget.v_dirOf", ("Vuna.Compiler.Driver.Target.dirOf", "Vuna/Compiler/Driver/Target.vuna:37"));
  ("Driver_dTarget.v_dispatch", ("Vuna.Compiler.Driver.Target.dispatch", "Vuna/Compiler/Driver/Target.vuna:87"));
  ("Driver_dTarget.v_dispatchWith", ("Vuna.Compiler.Driver.Target.dispatchWith", "Vuna/Compiler/Driver/Target.vuna:96"));
  ("Driver_dTarget.v_dropLast", ("Vuna.Compiler.Driver.Target.dropLast", "Vuna/Compiler/Driver/Target.vuna:43"));
  ("Driver_dTarget.v_execDirs", ("Vuna.Compiler.Driver.Target.execDirs", "Vuna/Compiler/Driver/Target.vuna:59"));
  ("Driver_dTarget.v_filesPathOf", ("Vuna.Compiler.Driver.Target.filesPathOf", "Vuna/Compiler/Driver/Target.vuna:181"));
  ("Driver_dTarget.v_findBackend", ("Vuna.Compiler.Driver.Target.findBackend", "Vuna/Compiler/Driver/Target.vuna:52"));
  ("Driver_dTarget.v_firstDiagOr", ("Vuna.Compiler.Driver.Target.firstDiagOr", "Vuna/Compiler/Driver/Target.vuna:149"));
  ("Driver_dTarget.v_irPathOf", ("Vuna.Compiler.Driver.Target.irPathOf", "Vuna/Compiler/Driver/Target.vuna:175"));
  ("Driver_dTarget.v_joinPathSlash", ("Vuna.Compiler.Driver.Target.joinPathSlash", "Vuna/Compiler/Driver/Target.vuna:47"));
  ("Driver_dTarget.v_missingBackendDiag", ("Vuna.Compiler.Driver.Target.missingBackendDiag", "Vuna/Compiler/Driver/Target.vuna:159"));
  ("Driver_dTarget.v_runBackend", ("Vuna.Compiler.Driver.Target.runBackend", "Vuna/Compiler/Driver/Target.vuna:116"));
  ("Driver_dTarget.v_searchBackend", ("Vuna.Compiler.Driver.Target.searchBackend", "Vuna/Compiler/Driver/Target.vuna:62"));
  ("Driver_dTarget.v_splitNames", ("Vuna.Compiler.Driver.Target.splitNames", "Vuna/Compiler/Driver/Target.vuna:169"));
  ("Driver_dTargetCache.v_backendVersionEff", ("Vuna.Compiler.Driver.TargetCache.backendVersionEff", "Vuna/Compiler/Driver/TargetCache.vuna:51"));
  ("Driver_dTargetCache.v_bindRaw", ("Vuna.Compiler.Driver.TargetCache.bindRaw", "Vuna/Compiler/Driver/TargetCache.vuna:80"));
  ("Driver_dTargetCache.v_decodeOutputs", ("Vuna.Compiler.Driver.TargetCache.decodeOutputs", "Vuna/Compiler/Driver/TargetCache.vuna:96"));
  ("Driver_dTargetCache.v_decodedDiags", ("Vuna.Compiler.Driver.TargetCache.decodedDiags", "Vuna/Compiler/Driver/TargetCache.vuna:105"));
  ("Driver_dTargetCache.v_dropLast", ("Vuna.Compiler.Driver.TargetCache.dropLast", "Vuna/Compiler/Driver/TargetCache.vuna:132"));
  ("Driver_dTargetCache.v_encodeOutputs", ("Vuna.Compiler.Driver.TargetCache.encodeOutputs", "Vuna/Compiler/Driver/TargetCache.vuna:90"));
  ("Driver_dTargetCache.v_irHashOf", ("Vuna.Compiler.Driver.TargetCache.irHashOf", "Vuna/Compiler/Driver/TargetCache.vuna:42"));
  ("Driver_dTargetCache.v_materializeEff", ("Vuna.Compiler.Driver.TargetCache.materializeEff", "Vuna/Compiler/Driver/TargetCache.vuna:112"));
  ("Driver_dTargetCache.v_outputsKeyOf", ("Vuna.Compiler.Driver.TargetCache.outputsKeyOf", "Vuna/Compiler/Driver/TargetCache.vuna:68"));
  ("Driver_dTargetCache.v_parentDirOf", ("Vuna.Compiler.Driver.TargetCache.parentDirOf", "Vuna/Compiler/Driver/TargetCache.vuna:126"));
  ("Driver_dTargetCache.v_readOutputsEff", ("Vuna.Compiler.Driver.TargetCache.readOutputsEff", "Vuna/Compiler/Driver/TargetCache.vuna:74"));
  ("Driver_dTargetCache.v_readProduced", ("Vuna.Compiler.Driver.TargetCache.readProduced", "Vuna/Compiler/Driver/TargetCache.vuna:146"));
  ("Driver_dTargetCache.v_readProducedEff", ("Vuna.Compiler.Driver.TargetCache.readProducedEff", "Vuna/Compiler/Driver/TargetCache.vuna:138"));
  ("Driver_dTargetCache.v_targetOutCodec", ("Vuna.Compiler.Driver.TargetCache.targetOutCodec", "Vuna/Compiler/Driver/TargetCache.vuna:34"));
  ("Driver_dTargetCache.v_targetOutKind", ("Vuna.Compiler.Driver.TargetCache.targetOutKind", "Vuna/Compiler/Driver/TargetCache.vuna:38"));
  ("Driver_dTargetCache.v_writeFiles", ("Vuna.Compiler.Driver.TargetCache.writeFiles", "Vuna/Compiler/Driver/TargetCache.vuna:118"));
  ("Driver_dTargetCache.v_writeOutputsEff", ("Vuna.Compiler.Driver.TargetCache.writeOutputsEff", "Vuna/Compiler/Driver/TargetCache.vuna:85"));
  ("Driver_dToolPayload.v_decToolContextComplete", ("Vuna.Compiler.Driver.ToolPayload.decToolContextComplete", "Vuna/Compiler/Driver/ToolPayload.vuna:48"));
  ("Driver_dToolPayload.v_decToolContextPayload", ("Vuna.Compiler.Driver.ToolPayload.decToolContextPayload", "Vuna/Compiler/Driver/ToolPayload.vuna:54"));
  ("Driver_dToolPayload.v_encToolContext", ("Vuna.Compiler.Driver.ToolPayload.encToolContext", "Vuna/Compiler/Driver/ToolPayload.vuna:44"));
  ("Driver_dToolPayload.v_encToolContextPayload", ("Vuna.Compiler.Driver.ToolPayload.encToolContextPayload", "Vuna/Compiler/Driver/ToolPayload.vuna:34"));
  ("Driver_dToolPayload.v_toolContextCodec", ("Vuna.Compiler.Driver.ToolPayload.toolContextCodec", "Vuna/Compiler/Driver/ToolPayload.vuna:31"));
  ("Driver_dToolPayload.v_toolContextSchema", ("Vuna.Compiler.Driver.ToolPayload.toolContextSchema", "Vuna/Compiler/Driver/ToolPayload.vuna:27"));
  ("Elab_dCanonical.v_decBinder", ("Vuna.Compiler.Elab.Canonical.decBinder", "Vuna/Compiler/Elab/Canonical.vuna:173"));
  ("Elab_dCanonical.v_decDtClass", ("Vuna.Compiler.Elab.Canonical.decDtClass", "Vuna/Compiler/Elab/Canonical.vuna:252"));
  ("Elab_dCanonical.v_decDtCtor", ("Vuna.Compiler.Elab.Canonical.decDtCtor", "Vuna/Compiler/Elab/Canonical.vuna:205"));
  ("Elab_dCanonical.v_decDtData", ("Vuna.Compiler.Elab.Canonical.decDtData", "Vuna/Compiler/Elab/Canonical.vuna:219"));
  ("Elab_dCanonical.v_decDtDef", ("Vuna.Compiler.Elab.Canonical.decDtDef", "Vuna/Compiler/Elab/Canonical.vuna:226"));
  ("Elab_dCanonical.v_decDtDefs", ("Vuna.Compiler.Elab.Canonical.decDtDefs", "Vuna/Compiler/Elab/Canonical.vuna:241"));
  ("Elab_dCanonical.v_decDtDefsComplete", ("Vuna.Compiler.Elab.Canonical.decDtDefsComplete", "Vuna/Compiler/Elab/Canonical.vuna:310"));
  ("Elab_dCanonical.v_decDtFieldMeta", ("Vuna.Compiler.Elab.Canonical.decDtFieldMeta", "Vuna/Compiler/Elab/Canonical.vuna:212"));
  ("Elab_dCanonical.v_decDtInst", ("Vuna.Compiler.Elab.Canonical.decDtInst", "Vuna/Compiler/Elab/Canonical.vuna:245"));
  ("Elab_dCanonical.v_decExportEntries", ("Vuna.Compiler.Elab.Canonical.decExportEntries", "Vuna/Compiler/Elab/Canonical.vuna:266"));
  ("Elab_dCanonical.v_decExportEntry", ("Vuna.Compiler.Elab.Canonical.decExportEntry", "Vuna/Compiler/Elab/Canonical.vuna:259"));
  ("Elab_dCanonical.v_decFixities", ("Vuna.Compiler.Elab.Canonical.decFixities", "Vuna/Compiler/Elab/Canonical.vuna:277"));
  ("Elab_dCanonical.v_decFixity", ("Vuna.Compiler.Elab.Canonical.decFixity", "Vuna/Compiler/Elab/Canonical.vuna:270"));
  ("Elab_dCanonical.v_decImport", ("Vuna.Compiler.Elab.Canonical.decImport", "Vuna/Compiler/Elab/Canonical.vuna:281"));
  ("Elab_dCanonical.v_decImports", ("Vuna.Compiler.Elab.Canonical.decImports", "Vuna/Compiler/Elab/Canonical.vuna:288"));
  ("Elab_dCanonical.v_decRecordFieldMeta", ("Vuna.Compiler.Elab.Canonical.decRecordFieldMeta", "Vuna/Compiler/Elab/Canonical.vuna:292"));
  ("Elab_dCanonical.v_decRecordMeta", ("Vuna.Compiler.Elab.Canonical.decRecordMeta", "Vuna/Compiler/Elab/Canonical.vuna:299"));
  ("Elab_dCanonical.v_decRecordMetas", ("Vuna.Compiler.Elab.Canonical.decRecordMetas", "Vuna/Compiler/Elab/Canonical.vuna:306"));
  ("Elab_dCanonical.v_decReprTier", ("Vuna.Compiler.Elab.Canonical.decReprTier", "Vuna/Compiler/Elab/Canonical.vuna:190"));
  ("Elab_dCanonical.v_decSpan", ("Vuna.Compiler.Elab.Canonical.decSpan", "Vuna/Compiler/Elab/Canonical.vuna:70"));
  ("Elab_dCanonical.v_decTelePair", ("Vuna.Compiler.Elab.Canonical.decTelePair", "Vuna/Compiler/Elab/Canonical.vuna:183"));
  ("Elab_dCanonical.v_encBinder", ("Vuna.Compiler.Elab.Canonical.encBinder", "Vuna/Compiler/Elab/Canonical.vuna:112"));
  ("Elab_dCanonical.v_encDtClass", ("Vuna.Compiler.Elab.Canonical.encDtClass", "Vuna/Compiler/Elab/Canonical.vuna:101"));
  ("Elab_dCanonical.v_encDtClassSem", ("Vuna.Compiler.Elab.Canonical.encDtClassSem", "Vuna/Compiler/Elab/Canonical.vuna:94"));
  ("Elab_dCanonical.v_encDtCtor", ("Vuna.Compiler.Elab.Canonical.encDtCtor", "Vuna/Compiler/Elab/Canonical.vuna:38"));
  ("Elab_dCanonical.v_encDtData", ("Vuna.Compiler.Elab.Canonical.encDtData", "Vuna/Compiler/Elab/Canonical.vuna:47"));
  ("Elab_dCanonical.v_encDtDef", ("Vuna.Compiler.Elab.Canonical.encDtDef", "Vuna/Compiler/Elab/Canonical.vuna:54"));
  ("Elab_dCanonical.v_encDtDefs", ("Vuna.Compiler.Elab.Canonical.encDtDefs", "Vuna/Compiler/Elab/Canonical.vuna:60"));
  ("Elab_dCanonical.v_encDtFieldMeta", ("Vuna.Compiler.Elab.Canonical.encDtFieldMeta", "Vuna/Compiler/Elab/Canonical.vuna:43"));
  ("Elab_dCanonical.v_encDtInst", ("Vuna.Compiler.Elab.Canonical.encDtInst", "Vuna/Compiler/Elab/Canonical.vuna:87"));
  ("Elab_dCanonical.v_encDtInstSem", ("Vuna.Compiler.Elab.Canonical.encDtInstSem", "Vuna/Compiler/Elab/Canonical.vuna:80"));
  ("Elab_dCanonical.v_encExportEntries", ("Vuna.Compiler.Elab.Canonical.encExportEntries", "Vuna/Compiler/Elab/Canonical.vuna:133"));
  ("Elab_dCanonical.v_encExportEntry", ("Vuna.Compiler.Elab.Canonical.encExportEntry", "Vuna/Compiler/Elab/Canonical.vuna:129"));
  ("Elab_dCanonical.v_encFixities", ("Vuna.Compiler.Elab.Canonical.encFixities", "Vuna/Compiler/Elab/Canonical.vuna:141"));
  ("Elab_dCanonical.v_encFixity", ("Vuna.Compiler.Elab.Canonical.encFixity", "Vuna/Compiler/Elab/Canonical.vuna:137"));
  ("Elab_dCanonical.v_encImport", ("Vuna.Compiler.Elab.Canonical.encImport", "Vuna/Compiler/Elab/Canonical.vuna:145"));
  ("Elab_dCanonical.v_encImports", ("Vuna.Compiler.Elab.Canonical.encImports", "Vuna/Compiler/Elab/Canonical.vuna:150"));
  ("Elab_dCanonical.v_encMaybeSpan", ("Vuna.Compiler.Elab.Canonical.encMaybeSpan", "Vuna/Compiler/Elab/Canonical.vuna:76"));
  ("Elab_dCanonical.v_encMaybeTerm", ("Vuna.Compiler.Elab.Canonical.encMaybeTerm", "Vuna/Compiler/Elab/Canonical.vuna:116"));
  ("Elab_dCanonical.v_encRecordFieldMeta", ("Vuna.Compiler.Elab.Canonical.encRecordFieldMeta", "Vuna/Compiler/Elab/Canonical.vuna:154"));
  ("Elab_dCanonical.v_encRecordMeta", ("Vuna.Compiler.Elab.Canonical.encRecordMeta", "Vuna/Compiler/Elab/Canonical.vuna:159"));
  ("Elab_dCanonical.v_encRecordMetas", ("Vuna.Compiler.Elab.Canonical.encRecordMetas", "Vuna/Compiler/Elab/Canonical.vuna:166"));
  ("Elab_dCanonical.v_encReprTier", ("Vuna.Compiler.Elab.Canonical.encReprTier", "Vuna/Compiler/Elab/Canonical.vuna:120"));
  ("Elab_dCanonical.v_encSpan", ("Vuna.Compiler.Elab.Canonical.encSpan", "Vuna/Compiler/Elab/Canonical.vuna:64"));
  ("Elab_dCanonical.v_encTelePair", ("Vuna.Compiler.Elab.Canonical.encTelePair", "Vuna/Compiler/Elab/Canonical.vuna:108"));
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
  ("Elab_dCoverage.v_allSameLen", ("Vuna.Compiler.Elab.Coverage.allSameLen", "Vuna/Compiler/Elab/Coverage.vuna:314"));
  ("Elab_dCoverage.v_anyShortCtor", ("Vuna.Compiler.Elab.Coverage.anyShortCtor", "Vuna/Compiler/Elab/Coverage.vuna:118"));
  ("Elab_dCoverage.v_clauseCover", ("Vuna.Compiler.Elab.Coverage.clauseCover", "Vuna/Compiler/Elab/Coverage.vuna:230"));
  ("Elab_dCoverage.v_clauseCoverCtorsGo", ("Vuna.Compiler.Elab.Coverage.clauseCoverCtorsGo", "Vuna/Compiler/Elab/Coverage.vuna:270"));
  ("Elab_dCoverage.v_concatMapRow", ("Vuna.Compiler.Elab.Coverage.concatMapRow", "Vuna/Compiler/Elab/Coverage.vuna:77"));
  ("Elab_dCoverage.v_coverageFuelFor", ("Vuna.Compiler.Elab.Coverage.coverageFuelFor", "Vuna/Compiler/Elab/Coverage.vuna:300"));
  ("Elab_dCoverage.v_coverageFuelMax", ("Vuna.Compiler.Elab.Coverage.coverageFuelMax", "Vuna/Compiler/Elab/Coverage.vuna:306"));
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
  ("Elab_dCoverage.v_improveDiag", ("Vuna.Compiler.Elab.Coverage.improveDiag", "Vuna/Compiler/Elab/Coverage.vuna:334"));
  ("Elab_dCoverage.v_improveExhaustive", ("Vuna.Compiler.Elab.Coverage.improveExhaustive", "Vuna/Compiler/Elab/Coverage.vuna:330"));
  ("Elab_dCoverage.v_isWildHead", ("Vuna.Compiler.Elab.Coverage.isWildHead", "Vuna/Compiler/Elab/Coverage.vuna:58"));
  ("Elab_dCoverage.v_lookupEntry", ("Vuna.Compiler.Elab.Coverage.lookupEntry", "Vuna/Compiler/Elab/Coverage.vuna:97"));
  ("Elab_dCoverage.v_matrixArity", ("Vuna.Compiler.Elab.Coverage.matrixArity", "Vuna/Compiler/Elab/Coverage.vuna:318"));
  ("Elab_dCoverage.v_matrixNodes", ("Vuna.Compiler.Elab.Coverage.matrixNodes", "Vuna/Compiler/Elab/Coverage.vuna:295"));
  ("Elab_dCoverage.v_matrixWitness", ("Vuna.Compiler.Elab.Coverage.matrixWitness", "Vuna/Compiler/Elab/Coverage.vuna:207"));
  ("Elab_dCoverage.v_orderedCtors", ("Vuna.Compiler.Elab.Coverage.orderedCtors", "Vuna/Compiler/Elab/Coverage.vuna:139"));
  ("Elab_dCoverage.v_patHead", ("Vuna.Compiler.Elab.Coverage.patHead", "Vuna/Compiler/Elab/Coverage.vuna:42"));
  ("Elab_dCoverage.v_patNodes", ("Vuna.Compiler.Elab.Coverage.patNodes", "Vuna/Compiler/Elab/Coverage.vuna:281"));
  ("Elab_dCoverage.v_patNodesFields", ("Vuna.Compiler.Elab.Coverage.patNodesFields", "Vuna/Compiler/Elab/Coverage.vuna:291"));
  ("Elab_dCoverage.v_patNodesList", ("Vuna.Compiler.Elab.Coverage.patNodesList", "Vuna/Compiler/Elab/Coverage.vuna:287"));
  ("Elab_dCoverage.v_renderPat", ("Vuna.Compiler.Elab.Coverage.renderPat", "Vuna/Compiler/Elab/Coverage.vuna:360"));
  ("Elab_dCoverage.v_renderPatIn", ("Vuna.Compiler.Elab.Coverage.renderPatIn", "Vuna/Compiler/Elab/Coverage.vuna:363"));
  ("Elab_dCoverage.v_renderWitness", ("Vuna.Compiler.Elab.Coverage.renderWitness", "Vuna/Compiler/Elab/Coverage.vuna:383"));
  ("Elab_dCoverage.v_sentinelCtorIn", ("Vuna.Compiler.Elab.Coverage.sentinelCtorIn", "Vuna/Compiler/Elab/Coverage.vuna:127"));
  ("Elab_dCoverage.v_specializeCtor", ("Vuna.Compiler.Elab.Coverage.specializeCtor", "Vuna/Compiler/Elab/Coverage.vuna:74"));
  ("Elab_dCoverage.v_specializeRow", ("Vuna.Compiler.Elab.Coverage.specializeRow", "Vuna/Compiler/Elab/Coverage.vuna:81"));
  ("Elab_dCoverage.v_takePats", ("Vuna.Compiler.Elab.Coverage.takePats", "Vuna/Compiler/Elab/Coverage.vuna:145"));
  ("Elab_dCoverage.v_uniformArity", ("Vuna.Compiler.Elab.Coverage.uniformArity", "Vuna/Compiler/Elab/Coverage.vuna:310"));
  ("Elab_dCoverage.v_wilds", ("Vuna.Compiler.Elab.Coverage.wilds", "Vuna/Compiler/Elab/Coverage.vuna:38"));
  ("Elab_dCoverage.v_witnessNamesCtor", ("Vuna.Compiler.Elab.Coverage.witnessNamesCtor", "Vuna/Compiler/Elab/Coverage.vuna:351"));
  ("Elab_dData.v_checkCtorFieldSorts", ("Vuna.Compiler.Elab.Data.checkCtorFieldSorts", "Vuna/Compiler/Elab/Data.vuna:79"));
  ("Elab_dData.v_checkViaDataDecls", ("Vuna.Compiler.Elab.Data.checkViaDataDecls", "Vuna/Compiler/Elab/Data.vuna:318"));
  ("Elab_dData.v_checkViaDataDeclsGo", ("Vuna.Compiler.Elab.Data.checkViaDataDeclsGo", "Vuna/Compiler/Elab/Data.vuna:322"));
  ("Elab_dData.v_countSurfacePis", ("Vuna.Compiler.Elab.Data.countSurfacePis", "Vuna/Compiler/Elab/Data.vuna:93"));
  ("Elab_dData.v_countTelePis", ("Vuna.Compiler.Elab.Data.countTelePis", "Vuna/Compiler/Elab/Data.vuna:99"));
  ("Elab_dData.v_ctorFieldSortsBinder", ("Vuna.Compiler.Elab.Data.ctorFieldSortsBinder", "Vuna/Compiler/Elab/Data.vuna:110"));
  ("Elab_dData.v_ctorFieldSortsGo", ("Vuna.Compiler.Elab.Data.ctorFieldSortsGo", "Vuna/Compiler/Elab/Data.vuna:103"));
  ("Elab_dData.v_dtFieldsOfRecord", ("Vuna.Compiler.Elab.Data.dtFieldsOfRecord", "Vuna/Compiler/Elab/Data.vuna:204"));
  ("Elab_dData.v_dtFieldsOfRecordGo", ("Vuna.Compiler.Elab.Data.dtFieldsOfRecordGo", "Vuna/Compiler/Elab/Data.vuna:222"));
  ("Elab_dData.v_elabCtor", ("Vuna.Compiler.Elab.Data.elabCtor", "Vuna/Compiler/Elab/Data.vuna:25"));
  ("Elab_dData.v_elabCtors", ("Vuna.Compiler.Elab.Data.elabCtors", "Vuna/Compiler/Elab/Data.vuna:50"));
  ("Elab_dData.v_elabDataBodies", ("Vuna.Compiler.Elab.Data.elabDataBodies", "Vuna/Compiler/Elab/Data.vuna:236"));
  ("Elab_dData.v_elabDataHead", ("Vuna.Compiler.Elab.Data.elabDataHead", "Vuna/Compiler/Elab/Data.vuna:133"));
  ("Elab_dData.v_elabDataHeads", ("Vuna.Compiler.Elab.Data.elabDataHeads", "Vuna/Compiler/Elab/Data.vuna:175"));
  ("Elab_dData.v_elabDataHeadsFuel", ("Vuna.Compiler.Elab.Data.elabDataHeadsFuel", "Vuna/Compiler/Elab/Data.vuna:178"));
  ("Elab_dData.v_elabDataHeadsNoProgress", ("Vuna.Compiler.Elab.Data.elabDataHeadsNoProgress", "Vuna/Compiler/Elab/Data.vuna:193"));
  ("Elab_dData.v_elabDataHeadsRound", ("Vuna.Compiler.Elab.Data.elabDataHeadsRound", "Vuna/Compiler/Elab/Data.vuna:167"));
  ("Elab_dData.v_elabDatas", ("Vuna.Compiler.Elab.Data.elabDatas", "Vuna/Compiler/Elab/Data.vuna:379"));
  ("Elab_dData.v_kindResultLevel", ("Vuna.Compiler.Elab.Data.kindResultLevel", "Vuna/Compiler/Elab/Data.vuna:68"));
  ("Elab_dData.v_recordFieldIndependent", ("Vuna.Compiler.Elab.Data.recordFieldIndependent", "Vuna/Compiler/Elab/Data.vuna:219"));
  ("Elab_dData.v_reprIsAlias", ("Vuna.Compiler.Elab.Data.reprIsAlias", "Vuna/Compiler/Elab/Data.vuna:355"));
  ("Elab_dData.v_sameCtorSet", ("Vuna.Compiler.Elab.Data.sameCtorSet", "Vuna/Compiler/Elab/Data.vuna:308"));
  ("Elab_dData.v_skipParamPis", ("Vuna.Compiler.Elab.Data.skipParamPis", "Vuna/Compiler/Elab/Data.vuna:213"));
  ("Elab_dData.v_viaFieldOk", ("Vuna.Compiler.Elab.Data.viaFieldOk", "Vuna/Compiler/Elab/Data.vuna:349"));
  ("Elab_dData.v_viaShapeOk", ("Vuna.Compiler.Elab.Data.viaShapeOk", "Vuna/Compiler/Elab/Data.vuna:362"));
  ("Elab_dData.v_viaShapeOkWith", ("Vuna.Compiler.Elab.Data.viaShapeOkWith", "Vuna/Compiler/Elab/Data.vuna:365"));
  ("Elab_dDerive.v_anyCtorMentions", ("Vuna.Compiler.Elab.Derive.anyCtorMentions", "Vuna/Compiler/Elab/Derive.vuna:141"));
  ("Elab_dDerive.v_anyExprMentions", ("Vuna.Compiler.Elab.Derive.anyExprMentions", "Vuna/Compiler/Elab/Derive.vuna:152"));
  ("Elab_dDerive.v_anyTraitHasMethod", ("Vuna.Compiler.Elab.Derive.anyTraitHasMethod", "Vuna/Compiler/Elab/Derive.vuna:72"));
  ("Elab_dDerive.v_applyTypeParams", ("Vuna.Compiler.Elab.Derive.applyTypeParams", "Vuna/Compiler/Elab/Derive.vuna:253"));
  ("Elab_dDerive.v_boolFalse", ("Vuna.Compiler.Elab.Derive.boolFalse", "Vuna/Compiler/Elab/Derive.vuna:454"));
  ("Elab_dDerive.v_boolTrue", ("Vuna.Compiler.Elab.Derive.boolTrue", "Vuna/Compiler/Elab/Derive.vuna:451"));
  ("Elab_dDerive.v_collectDerivings", ("Vuna.Compiler.Elab.Derive.collectDerivings", "Vuna/Compiler/Elab/Derive.vuna:83"));
  ("Elab_dDerive.v_conjFields", ("Vuna.Compiler.Elab.Derive.conjFields", "Vuna/Compiler/Elab/Derive.vuna:347"));
  ("Elab_dDerive.v_deriveCtxParams", ("Vuna.Compiler.Elab.Derive.deriveCtxParams", "Vuna/Compiler/Elab/Derive.vuna:133"));
  ("Elab_dDerive.v_deriveFieldTypeName", ("Vuna.Compiler.Elab.Derive.deriveFieldTypeName", "Vuna/Compiler/Elab/Derive.vuna:242"));
  ("Elab_dDerive.v_deriveFieldTypes", ("Vuna.Compiler.Elab.Derive.deriveFieldTypes", "Vuna/Compiler/Elab/Derive.vuna:236"));
  ("Elab_dDerive.v_deriveInstance", ("Vuna.Compiler.Elab.Derive.deriveInstance", "Vuna/Compiler/Elab/Derive.vuna:159"));
  ("Elab_dDerive.v_deriveWrapper", ("Vuna.Compiler.Elab.Derive.deriveWrapper", "Vuna/Compiler/Elab/Derive.vuna:213"));
  ("Elab_dDerive.v_deriveWrapperCtor", ("Vuna.Compiler.Elab.Derive.deriveWrapperCtor", "Vuna/Compiler/Elab/Derive.vuna:223"));
  ("Elab_dDerive.v_derivingsFor", ("Vuna.Compiler.Elab.Derive.derivingsFor", "Vuna/Compiler/Elab/Derive.vuna:118"));
  ("Elab_dDerive.v_derivingsForGo", ("Vuna.Compiler.Elab.Derive.derivingsForGo", "Vuna/Compiler/Elab/Derive.vuna:122"));
  ("Elab_dDerive.v_eqAlt", ("Vuna.Compiler.Elab.Derive.eqAlt", "Vuna/Compiler/Elab/Derive.vuna:330"));
  ("Elab_dDerive.v_eqBody", ("Vuna.Compiler.Elab.Derive.eqBody", "Vuna/Compiler/Elab/Derive.vuna:327"));
  ("Elab_dDerive.v_eqInner", ("Vuna.Compiler.Elab.Derive.eqInner", "Vuna/Compiler/Elab/Derive.vuna:338"));
  ("Elab_dDerive.v_expandDerivings", ("Vuna.Compiler.Elab.Derive.expandDerivings", "Vuna/Compiler/Elab/Derive.vuna:58"));
  ("Elab_dDerive.v_exprMentionsName", ("Vuna.Compiler.Elab.Derive.exprMentionsName", "Vuna/Compiler/Elab/Derive.vuna:145"));
  ("Elab_dDerive.v_geBody", ("Vuna.Compiler.Elab.Derive.geBody", "Vuna/Compiler/Elab/Derive.vuna:441"));
  ("Elab_dDerive.v_gtBody", ("Vuna.Compiler.Elab.Derive.gtBody", "Vuna/Compiler/Elab/Derive.vuna:437"));
  ("Elab_dDerive.v_hashAlts", ("Vuna.Compiler.Elab.Derive.hashAlts", "Vuna/Compiler/Elab/Derive.vuna:303"));
  ("Elab_dDerive.v_hashBody", ("Vuna.Compiler.Elab.Derive.hashBody", "Vuna/Compiler/Elab/Derive.vuna:298"));
  ("Elab_dDerive.v_hashFields", ("Vuna.Compiler.Elab.Derive.hashFields", "Vuna/Compiler/Elab/Derive.vuna:313"));
  ("Elab_dDerive.v_instHead", ("Vuna.Compiler.Elab.Derive.instHead", "Vuna/Compiler/Elab/Derive.vuna:248"));
  ("Elab_dDerive.v_leBody", ("Vuna.Compiler.Elab.Derive.leBody", "Vuna/Compiler/Elab/Derive.vuna:416"));
  ("Elab_dDerive.v_ltFields", ("Vuna.Compiler.Elab.Derive.ltFields", "Vuna/Compiler/Elab/Derive.vuna:401"));
  ("Elab_dDerive.v_neqBody", ("Vuna.Compiler.Elab.Derive.neqBody", "Vuna/Compiler/Elab/Derive.vuna:360"));
  ("Elab_dDerive.v_ordAlts", ("Vuna.Compiler.Elab.Derive.ordAlts", "Vuna/Compiler/Elab/Derive.vuna:374"));
  ("Elab_dDerive.v_ordBody", ("Vuna.Compiler.Elab.Derive.ordBody", "Vuna/Compiler/Elab/Derive.vuna:371"));
  ("Elab_dDerive.v_ordInner", ("Vuna.Compiler.Elab.Derive.ordInner", "Vuna/Compiler/Elab/Derive.vuna:384"));
  ("Elab_dDerive.v_ordInnerGo", ("Vuna.Compiler.Elab.Derive.ordInnerGo", "Vuna/Compiler/Elab/Derive.vuna:387"));
  ("Elab_dDerive.v_recordCtorOf", ("Vuna.Compiler.Elab.Derive.recordCtorOf", "Vuna/Compiler/Elab/Derive.vuna:109"));
  ("Elab_dDerive.v_recordDerivingsFor", ("Vuna.Compiler.Elab.Derive.recordDerivingsFor", "Vuna/Compiler/Elab/Derive.vuna:114"));
  ("Elab_dDerive.v_showAlts", ("Vuna.Compiler.Elab.Derive.showAlts", "Vuna/Compiler/Elab/Derive.vuna:263"));
  ("Elab_dDerive.v_showBody", ("Vuna.Compiler.Elab.Derive.showBody", "Vuna/Compiler/Elab/Derive.vuna:260"));
  ("Elab_dDerive.v_showCtor", ("Vuna.Compiler.Elab.Derive.showCtor", "Vuna/Compiler/Elab/Derive.vuna:273"));
  ("Elab_dDerive.v_showEqClassName", ("Vuna.Compiler.Elab.Derive.showEqClassName", "Vuna/Compiler/Elab/Derive.vuna:35"));
  ("Elab_dDerive.v_showFields", ("Vuna.Compiler.Elab.Derive.showFields", "Vuna/Compiler/Elab/Derive.vuna:278"));
  ("Elab_dDerive.v_showOne", ("Vuna.Compiler.Elab.Derive.showOne", "Vuna/Compiler/Elab/Derive.vuna:289"));
  ("Elab_dDerive.v_showOrdClassName", ("Vuna.Compiler.Elab.Derive.showOrdClassName", "Vuna/Compiler/Elab/Derive.vuna:38"));
  ("Elab_dDerive.v_traitMethodGlobal", ("Vuna.Compiler.Elab.Derive.traitMethodGlobal", "Vuna/Compiler/Elab/Derive.vuna:43"));
  ("Elab_dDerive.v_traitMethodOf", ("Vuna.Compiler.Elab.Derive.traitMethodOf", "Vuna/Compiler/Elab/Derive.vuna:66"));
  ("Elab_dDerive.v_traitShortName", ("Vuna.Compiler.Elab.Derive.traitShortName", "Vuna/Compiler/Elab/Derive.vuna:31"));
  ("Elab_dDerive.v_varNames", ("Vuna.Compiler.Elab.Derive.varNames", "Vuna/Compiler/Elab/Derive.vuna:423"));
  ("Elab_dDerive.v_varNamesAt", ("Vuna.Compiler.Elab.Derive.varNamesAt", "Vuna/Compiler/Elab/Derive.vuna:426"));
  ("Elab_dDerive.v_varNamesAtGo", ("Vuna.Compiler.Elab.Derive.varNamesAtGo", "Vuna/Compiler/Elab/Derive.vuna:429"));
  ("Elab_dDict.v_allInstancesMono", ("Vuna.Compiler.Elab.Dict.allInstancesMono", "Vuna/Compiler/Elab/Dict.vuna:360"));
  ("Elab_dDict.v_allocMetaAt", ("Vuna.Compiler.Elab.Dict.allocMetaAt", "Vuna/Compiler/Elab/Dict.vuna:410"));
  ("Elab_dDict.v_allocTeleMetas", ("Vuna.Compiler.Elab.Dict.allocTeleMetas", "Vuna/Compiler/Elab/Dict.vuna:402"));
  ("Elab_dDict.v_anyRigidClassArg", ("Vuna.Compiler.Elab.Dict.anyRigidClassArg", "Vuna/Compiler/Elab/Dict.vuna:1006"));
  ("Elab_dDict.v_anyUnsolvedMetaArg", ("Vuna.Compiler.Elab.Dict.anyUnsolvedMetaArg", "Vuna/Compiler/Elab/Dict.vuna:1245"));
  ("Elab_dDict.v_anyValueHasRigidNVar", ("Vuna.Compiler.Elab.Dict.anyValueHasRigidNVar", "Vuna/Compiler/Elab/Dict.vuna:1030"));
  ("Elab_dDict.v_anyViaClassFam", ("Vuna.Compiler.Elab.Dict.anyViaClassFam", "Vuna/Compiler/Elab/Dict.vuna:107"));
  ("Elab_dDict.v_anyViaWrapper", ("Vuna.Compiler.Elab.Dict.anyViaWrapper", "Vuna/Compiler/Elab/Dict.vuna:169"));
  ("Elab_dDict.v_applyDataPis", ("Vuna.Compiler.Elab.Dict.applyDataPis", "Vuna/Compiler/Elab/Dict.vuna:119"));
  ("Elab_dDict.v_argHeadMatchesKind", ("Vuna.Compiler.Elab.Dict.argHeadMatchesKind", "Vuna/Compiler/Elab/Dict.vuna:968"));
  ("Elab_dDict.v_blanketInstances", ("Vuna.Compiler.Elab.Dict.blanketInstances", "Vuna/Compiler/Elab/Dict.vuna:227"));
  ("Elab_dDict.v_boolShortCircuit", ("Vuna.Compiler.Elab.Dict.boolShortCircuit", "Vuna/Compiler/Elab/Dict.vuna:1283"));
  ("Elab_dDict.v_builtinOpName", ("Vuna.Compiler.Elab.Dict.builtinOpName", "Vuna/Compiler/Elab/Dict.vuna:1086"));
  ("Elab_dDict.v_builtinOpOf", ("Vuna.Compiler.Elab.Dict.builtinOpOf", "Vuna/Compiler/Elab/Dict.vuna:1116"));
  ("Elab_dDict.v_builtinOpRuntime", ("Vuna.Compiler.Elab.Dict.builtinOpRuntime", "Vuna/Compiler/Elab/Dict.vuna:1089"));
  ("Elab_dDict.v_builtinOpShort", ("Vuna.Compiler.Elab.Dict.builtinOpShort", "Vuna/Compiler/Elab/Dict.vuna:1083"));
  ("Elab_dDict.v_classHasProjection", ("Vuna.Compiler.Elab.Dict.classHasProjection", "Vuna/Compiler/Elab/Dict.vuna:1048"));
  ("Elab_dDict.v_cmpRuntimeName", ("Vuna.Compiler.Elab.Dict.cmpRuntimeName", "Vuna/Compiler/Elab/Dict.vuna:1226"));
  ("Elab_dDict.v_cmpTypeTag", ("Vuna.Compiler.Elab.Dict.cmpTypeTag", "Vuna/Compiler/Elab/Dict.vuna:1219"));
  ("Elab_dDict.v_ctorParamKinds", ("Vuna.Compiler.Elab.Dict.ctorParamKinds", "Vuna/Compiler/Elab/Dict.vuna:941"));
  ("Elab_dDict.v_ctorParamKindsFuel", ("Vuna.Compiler.Elab.Dict.ctorParamKindsFuel", "Vuna/Compiler/Elab/Dict.vuna:944"));
  ("Elab_dDict.v_ctorValue", ("Vuna.Compiler.Elab.Dict.ctorValue", "Vuna/Compiler/Elab/Dict.vuna:499"));
  ("Elab_dDict.v_ctxMemberProofUnify", ("Vuna.Compiler.Elab.Dict.ctxMemberProofUnify", "Vuna/Compiler/Elab/Dict.vuna:612"));
  ("Elab_dDict.v_ctxMemberProofUnifyGo", ("Vuna.Compiler.Elab.Dict.ctxMemberProofUnifyGo", "Vuna/Compiler/Elab/Dict.vuna:615"));
  ("Elab_dDict.v_ctxMemberWeaken", ("Vuna.Compiler.Elab.Dict.ctxMemberWeaken", "Vuna/Compiler/Elab/Dict.vuna:1413"));
  ("Elab_dDict.v_ctxMemberWeakenGo", ("Vuna.Compiler.Elab.Dict.ctxMemberWeakenGo", "Vuna/Compiler/Elab/Dict.vuna:1416"));
  ("Elab_dDict.v_deferEqDict", ("Vuna.Compiler.Elab.Dict.deferEqDict", "Vuna/Compiler/Elab/Dict.vuna:1200"));
  ("Elab_dDict.v_dictArgKind", ("Vuna.Compiler.Elab.Dict.dictArgKind", "Vuna/Compiler/Elab/Dict.vuna:954"));
  ("Elab_dDict.v_dictArgKinds", ("Vuna.Compiler.Elab.Dict.dictArgKinds", "Vuna/Compiler/Elab/Dict.vuna:928"));
  ("Elab_dDict.v_dictArgUnsolvedMeta", ("Vuna.Compiler.Elab.Dict.dictArgUnsolvedMeta", "Vuna/Compiler/Elab/Dict.vuna:1239"));
  ("Elab_dDict.v_dictClassArg", ("Vuna.Compiler.Elab.Dict.dictClassArg", "Vuna/Compiler/Elab/Dict.vuna:993"));
  ("Elab_dDict.v_dictClassArgs", ("Vuna.Compiler.Elab.Dict.dictClassArgs", "Vuna/Compiler/Elab/Dict.vuna:987"));
  ("Elab_dDict.v_dictFamilyNameOf", ("Vuna.Compiler.Elab.Dict.dictFamilyNameOf", "Vuna/Compiler/Elab/Dict.vuna:960"));
  ("Elab_dDict.v_dictTermOfValueAt", ("Vuna.Compiler.Elab.Dict.dictTermOfValueAt", "Vuna/Compiler/Elab/Dict.vuna:852"));
  ("Elab_dDict.v_eqClassName", ("Vuna.Compiler.Elab.Dict.eqClassName", "Vuna/Compiler/Elab/Dict.vuna:1036"));
  ("Elab_dDict.v_eqMethodOps", ("Vuna.Compiler.Elab.Dict.eqMethodOps", "Vuna/Compiler/Elab/Dict.vuna:1092"));
  ("Elab_dDict.v_famOfClass", ("Vuna.Compiler.Elab.Dict.famOfClass", "Vuna/Compiler/Elab/Dict.vuna:100"));
  ("Elab_dDict.v_findClass", ("Vuna.Compiler.Elab.Dict.findClass", "Vuna/Compiler/Elab/Dict.vuna:95"));
  ("Elab_dDict.v_findEqClass", ("Vuna.Compiler.Elab.Dict.findEqClass", "Vuna/Compiler/Elab/Dict.vuna:1056"));
  ("Elab_dDict.v_findOrdClass", ("Vuna.Compiler.Elab.Dict.findOrdClass", "Vuna/Compiler/Elab/Dict.vuna:1062"));
  ("Elab_dDict.v_finishInstanceSearch", ("Vuna.Compiler.Elab.Dict.finishInstanceSearch", "Vuna/Compiler/Elab/Dict.vuna:232"));
  ("Elab_dDict.v_firstUnsolvedDictGoal", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoal", "Vuna/Compiler/Elab/Dict.vuna:1304"));
  ("Elab_dDict.v_firstUnsolvedDictGoalGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalGo", "Vuna/Compiler/Elab/Dict.vuna:1307"));
  ("Elab_dDict.v_firstUnsolvedDictGoalMeta", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalMeta", "Vuna/Compiler/Elab/Dict.vuna:1384"));
  ("Elab_dDict.v_firstUnsolvedDictGoalMetaGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalMetaGo", "Vuna/Compiler/Elab/Dict.vuna:1388"));
  ("Elab_dDict.v_firstUnsolvedDictGoalSpan", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictGoalSpan", "Vuna/Compiler/Elab/Dict.vuna:1363"));
  ("Elab_dDict.v_firstUnsolvedDictSpanGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedDictSpanGo", "Vuna/Compiler/Elab/Dict.vuna:1367"));
  ("Elab_dDict.v_firstUnsolvedInterpGoal", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpGoal", "Vuna/Compiler/Elab/Dict.vuna:267"));
  ("Elab_dDict.v_firstUnsolvedInterpGoalGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpGoalGo", "Vuna/Compiler/Elab/Dict.vuna:270"));
  ("Elab_dDict.v_firstUnsolvedInterpGoalSpan", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpGoalSpan", "Vuna/Compiler/Elab/Dict.vuna:1330"));
  ("Elab_dDict.v_firstUnsolvedInterpSpanGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedInterpSpanGo", "Vuna/Compiler/Elab/Dict.vuna:1334"));
  ("Elab_dDict.v_firstUnsolvedMemberGoal", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberGoal", "Vuna/Compiler/Elab/Dict.vuna:1287"));
  ("Elab_dDict.v_firstUnsolvedMemberGoalGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberGoalGo", "Vuna/Compiler/Elab/Dict.vuna:1290"));
  ("Elab_dDict.v_firstUnsolvedMemberGoalSpan", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberGoalSpan", "Vuna/Compiler/Elab/Dict.vuna:1348"));
  ("Elab_dDict.v_firstUnsolvedMemberSpanGo", ("Vuna.Compiler.Elab.Dict.firstUnsolvedMemberSpanGo", "Vuna/Compiler/Elab/Dict.vuna:1352"));
  ("Elab_dDict.v_hasSpecificInterpInstance", ("Vuna.Compiler.Elab.Dict.hasSpecificInterpInstance", "Vuna/Compiler/Elab/Dict.vuna:328"));
  ("Elab_dDict.v_hasSpecificInterpInstanceGo", ("Vuna.Compiler.Elab.Dict.hasSpecificInterpInstanceGo", "Vuna/Compiler/Elab/Dict.vuna:332"));
  ("Elab_dDict.v_hereCtorName", ("Vuna.Compiler.Elab.Dict.hereCtorName", "Vuna/Compiler/Elab/Dict.vuna:462"));
  ("Elab_dDict.v_instHeadArgTypeName", ("Vuna.Compiler.Elab.Dict.instHeadArgTypeName", "Vuna/Compiler/Elab/Dict.vuna:340"));
  ("Elab_dDict.v_instMatchInst", ("Vuna.Compiler.Elab.Dict.instMatchInst", "Vuna/Compiler/Elab/Dict.vuna:55"));
  ("Elab_dDict.v_isCmpMethod", ("Vuna.Compiler.Elab.Dict.isCmpMethod", "Vuna/Compiler/Elab/Dict.vuna:1143"));
  ("Elab_dDict.v_isDictDomain", ("Vuna.Compiler.Elab.Dict.isDictDomain", "Vuna/Compiler/Elab/Dict.vuna:25"));
  ("Elab_dDict.v_isDictFamily", ("Vuna.Compiler.Elab.Dict.isDictFamily", "Vuna/Compiler/Elab/Dict.vuna:35"));
  ("Elab_dDict.v_isDictValue", ("Vuna.Compiler.Elab.Dict.isDictValue", "Vuna/Compiler/Elab/Dict.vuna:28"));
  ("Elab_dDict.v_isEqMethod", ("Vuna.Compiler.Elab.Dict.isEqMethod", "Vuna/Compiler/Elab/Dict.vuna:1137"));
  ("Elab_dDict.v_isMemberDomain", ("Vuna.Compiler.Elab.Dict.isMemberDomain", "Vuna/Compiler/Elab/Dict.vuna:479"));
  ("Elab_dDict.v_isMonoInst", ("Vuna.Compiler.Elab.Dict.isMonoInst", "Vuna/Compiler/Elab/Dict.vuna:350"));
  ("Elab_dDict.v_isRigidClassArg", ("Vuna.Compiler.Elab.Dict.isRigidClassArg", "Vuna/Compiler/Elab/Dict.vuna:1011"));
  ("Elab_dDict.v_isRigidDictArg", ("Vuna.Compiler.Elab.Dict.isRigidDictArg", "Vuna/Compiler/Elab/Dict.vuna:1003"));
  ("Elab_dDict.v_joinInstNames", ("Vuna.Compiler.Elab.Dict.joinInstNames", "Vuna/Compiler/Elab/Dict.vuna:918"));
  ("Elab_dDict.v_joinRestInstNames", ("Vuna.Compiler.Elab.Dict.joinRestInstNames", "Vuna/Compiler/Elab/Dict.vuna:922"));
  ("Elab_dDict.v_labelCandIdx", ("Vuna.Compiler.Elab.Dict.labelCandIdx", "Vuna/Compiler/Elab/Dict.vuna:535"));
  ("Elab_dDict.v_labelCandName", ("Vuna.Compiler.Elab.Dict.labelCandName", "Vuna/Compiler/Elab/Dict.vuna:532"));
  ("Elab_dDict.v_labelCandText", ("Vuna.Compiler.Elab.Dict.labelCandText", "Vuna/Compiler/Elab/Dict.vuna:539"));
  ("Elab_dDict.v_labelScan", ("Vuna.Compiler.Elab.Dict.labelScan", "Vuna/Compiler/Elab/Dict.vuna:551"));
  ("Elab_dDict.v_localDictLookup", ("Vuna.Compiler.Elab.Dict.localDictLookup", "Vuna/Compiler/Elab/Dict.vuna:288"));
  ("Elab_dDict.v_localDictLookupExact", ("Vuna.Compiler.Elab.Dict.localDictLookupExact", "Vuna/Compiler/Elab/Dict.vuna:291"));
  ("Elab_dDict.v_localDictLookupGo", ("Vuna.Compiler.Elab.Dict.localDictLookupGo", "Vuna/Compiler/Elab/Dict.vuna:297"));
  ("Elab_dDict.v_lookupBuiltinOpProjection", ("Vuna.Compiler.Elab.Dict.lookupBuiltinOpProjection", "Vuna/Compiler/Elab/Dict.vuna:1127"));
  ("Elab_dDict.v_lookupBuiltinOpShort", ("Vuna.Compiler.Elab.Dict.lookupBuiltinOpShort", "Vuna/Compiler/Elab/Dict.vuna:1122"));
  ("Elab_dDict.v_matchInstances", ("Vuna.Compiler.Elab.Dict.matchInstances", "Vuna/Compiler/Elab/Dict.vuna:364"));
  ("Elab_dDict.v_memberDomName", ("Vuna.Compiler.Elab.Dict.memberDomName", "Vuna/Compiler/Elab/Dict.vuna:458"));
  ("Elab_dDict.v_memberLookup", ("Vuna.Compiler.Elab.Dict.memberLookup", "Vuna/Compiler/Elab/Dict.vuna:505"));
  ("Elab_dDict.v_memberLookupRowLabel", ("Vuna.Compiler.Elab.Dict.memberLookupRowLabel", "Vuna/Compiler/Elab/Dict.vuna:591"));
  ("Elab_dDict.v_memberNameText", ("Vuna.Compiler.Elab.Dict.memberNameText", "Vuna/Compiler/Elab/Dict.vuna:522"));
  ("Elab_dDict.v_memberProbe", ("Vuna.Compiler.Elab.Dict.memberProbe", "Vuna/Compiler/Elab/Dict.vuna:515"));
  ("Elab_dDict.v_memberProofAtLabel", ("Vuna.Compiler.Elab.Dict.memberProofAtLabel", "Vuna/Compiler/Elab/Dict.vuna:576"));
  ("Elab_dDict.v_memberSpine", ("Vuna.Compiler.Elab.Dict.memberSpine", "Vuna/Compiler/Elab/Dict.vuna:489"));
  ("Elab_dDict.v_memberWeakenProof", ("Vuna.Compiler.Elab.Dict.memberWeakenProof", "Vuna/Compiler/Elab/Dict.vuna:1437"));
  ("Elab_dDict.v_methodShortOf", ("Vuna.Compiler.Elab.Dict.methodShortOf", "Vuna/Compiler/Elab/Dict.vuna:1069"));
  ("Elab_dDict.v_missingInstance", ("Vuna.Compiler.Elab.Dict.missingInstance", "Vuna/Compiler/Elab/Dict.vuna:245"));
  ("Elab_dDict.v_neutralHeadOrSelf", ("Vuna.Compiler.Elab.Dict.neutralHeadOrSelf", "Vuna/Compiler/Elab/Dict.vuna:981"));
  ("Elab_dDict.v_numClassName", ("Vuna.Compiler.Elab.Dict.numClassName", "Vuna/Compiler/Elab/Dict.vuna:1042"));
  ("Elab_dDict.v_numMethodOpName", ("Vuna.Compiler.Elab.Dict.numMethodOpName", "Vuna/Compiler/Elab/Dict.vuna:1150"));
  ("Elab_dDict.v_numMethodOps", ("Vuna.Compiler.Elab.Dict.numMethodOps", "Vuna/Compiler/Elab/Dict.vuna:1104"));
  ("Elab_dDict.v_ordClassName", ("Vuna.Compiler.Elab.Dict.ordClassName", "Vuna/Compiler/Elab/Dict.vuna:1039"));
  ("Elab_dDict.v_ordMethodOps", ("Vuna.Compiler.Elab.Dict.ordMethodOps", "Vuna/Compiler/Elab/Dict.vuna:1095"));
  ("Elab_dDict.v_pendingBucket", ("Vuna.Compiler.Elab.Dict.pendingBucket", "Vuna/Compiler/Elab/Dict.vuna:698"));
  ("Elab_dDict.v_piRigs", ("Vuna.Compiler.Elab.Dict.piRigs", "Vuna/Compiler/Elab/Dict.vuna:914"));
  ("Elab_dDict.v_piRigsOfGlobal", ("Vuna.Compiler.Elab.Dict.piRigsOfGlobal", "Vuna/Compiler/Elab/Dict.vuna:905"));
  ("Elab_dDict.v_piRigsOfInst", ("Vuna.Compiler.Elab.Dict.piRigsOfInst", "Vuna/Compiler/Elab/Dict.vuna:894"));
  ("Elab_dDict.v_piRigsOfInstGo", ("Vuna.Compiler.Elab.Dict.piRigsOfInstGo", "Vuna/Compiler/Elab/Dict.vuna:897"));
  ("Elab_dDict.v_projectionFor", ("Vuna.Compiler.Elab.Dict.projectionFor", "Vuna/Compiler/Elab/Dict.vuna:1157"));
  ("Elab_dDict.v_renderDictTermAt", ("Vuna.Compiler.Elab.Dict.renderDictTermAt", "Vuna/Compiler/Elab/Dict.vuna:855"));
  ("Elab_dDict.v_replaceAt", ("Vuna.Compiler.Elab.Dict.replaceAt", "Vuna/Compiler/Elab/Dict.vuna:184"));
  ("Elab_dDict.v_resolveDictGoals", ("Vuna.Compiler.Elab.Dict.resolveDictGoals", "Vuna/Compiler/Elab/Dict.vuna:686"));
  ("Elab_dDict.v_resolveDictGoalsFuel", ("Vuna.Compiler.Elab.Dict.resolveDictGoalsFuel", "Vuna/Compiler/Elab/Dict.vuna:707"));
  ("Elab_dDict.v_resolveRowGoalsCtx", ("Vuna.Compiler.Elab.Dict.resolveRowGoalsCtx", "Vuna/Compiler/Elab/Dict.vuna:634"));
  ("Elab_dDict.v_resolveRowGoalsCtxGo", ("Vuna.Compiler.Elab.Dict.resolveRowGoalsCtxGo", "Vuna/Compiler/Elab/Dict.vuna:637"));
  ("Elab_dDict.v_rigidSearchFast", ("Vuna.Compiler.Elab.Dict.rigidSearchFast", "Vuna/Compiler/Elab/Dict.vuna:313"));
  ("Elab_dDict.v_rowMemDomName", ("Vuna.Compiler.Elab.Dict.rowMemDomName", "Vuna/Compiler/Elab/Dict.vuna:442"));
  ("Elab_dDict.v_rowNoDomName", ("Vuna.Compiler.Elab.Dict.rowNoDomName", "Vuna/Compiler/Elab/Dict.vuna:448"));
  ("Elab_dDict.v_rowYesCtorName", ("Vuna.Compiler.Elab.Dict.rowYesCtorName", "Vuna/Compiler/Elab/Dict.vuna:452"));
  ("Elab_dDict.v_rowYesDomName", ("Vuna.Compiler.Elab.Dict.rowYesDomName", "Vuna/Compiler/Elab/Dict.vuna:445"));
  ("Elab_dDict.v_searchCandidates", ("Vuna.Compiler.Elab.Dict.searchCandidates", "Vuna/Compiler/Elab/Dict.vuna:216"));
  ("Elab_dDict.v_searchInstFuel", ("Vuna.Compiler.Elab.Dict.searchInstFuel", "Vuna/Compiler/Elab/Dict.vuna:64"));
  ("Elab_dDict.v_searchInstance", ("Vuna.Compiler.Elab.Dict.searchInstance", "Vuna/Compiler/Elab/Dict.vuna:48"));
  ("Elab_dDict.v_searchInstanceIn", ("Vuna.Compiler.Elab.Dict.searchInstanceIn", "Vuna/Compiler/Elab/Dict.vuna:44"));
  ("Elab_dDict.v_showResolvedValue", ("Vuna.Compiler.Elab.Dict.showResolvedValue", "Vuna/Compiler/Elab/Dict.vuna:262"));
  ("Elab_dDict.v_solveDictCtxs", ("Vuna.Compiler.Elab.Dict.solveDictCtxs", "Vuna/Compiler/Elab/Dict.vuna:428"));
  ("Elab_dDict.v_solveRowMeta", ("Vuna.Compiler.Elab.Dict.solveRowMeta", "Vuna/Compiler/Elab/Dict.vuna:628"));
  ("Elab_dDict.v_solveTeleMetas", ("Vuna.Compiler.Elab.Dict.solveTeleMetas", "Vuna/Compiler/Elab/Dict.vuna:418"));
  ("Elab_dDict.v_specializeCmpTy", ("Vuna.Compiler.Elab.Dict.specializeCmpTy", "Vuna/Compiler/Elab/Dict.vuna:1254"));
  ("Elab_dDict.v_specializeEqTy", ("Vuna.Compiler.Elab.Dict.specializeEqTy", "Vuna/Compiler/Elab/Dict.vuna:1170"));
  ("Elab_dDict.v_specificInstances", ("Vuna.Compiler.Elab.Dict.specificInstances", "Vuna/Compiler/Elab/Dict.vuna:222"));
  ("Elab_dDict.v_substDictTerm", ("Vuna.Compiler.Elab.Dict.substDictTerm", "Vuna/Compiler/Elab/Dict.vuna:791"));
  ("Elab_dDict.v_substDictTermAlt", ("Vuna.Compiler.Elab.Dict.substDictTermAlt", "Vuna/Compiler/Elab/Dict.vuna:839"));
  ("Elab_dDict.v_substDictTermGo", ("Vuna.Compiler.Elab.Dict.substDictTermGo", "Vuna/Compiler/Elab/Dict.vuna:794"));
  ("Elab_dDict.v_termMetaId", ("Vuna.Compiler.Elab.Dict.termMetaId", "Vuna/Compiler/Elab/Dict.vuna:414"));
  ("Elab_dDict.v_termTypeNameOf", ("Vuna.Compiler.Elab.Dict.termTypeNameOf", "Vuna/Compiler/Elab/Dict.vuna:346"));
  ("Elab_dDict.v_thereCtorName", ("Vuna.Compiler.Elab.Dict.thereCtorName", "Vuna/Compiler/Elab/Dict.vuna:466"));
  ("Elab_dDict.v_tryMatchInst", ("Vuna.Compiler.Elab.Dict.tryMatchInst", "Vuna/Compiler/Elab/Dict.vuna:373"));
  ("Elab_dDict.v_tryResolveDictGoal", ("Vuna.Compiler.Elab.Dict.tryResolveDictGoal", "Vuna/Compiler/Elab/Dict.vuna:756"));
  ("Elab_dDict.v_tryViaArgs", ("Vuna.Compiler.Elab.Dict.tryViaArgs", "Vuna/Compiler/Elab/Dict.vuna:199"));
  ("Elab_dDict.v_tryViaDict", ("Vuna.Compiler.Elab.Dict.tryViaDict", "Vuna/Compiler/Elab/Dict.vuna:189"));
  ("Elab_dDict.v_valueDictFamily", ("Vuna.Compiler.Elab.Dict.valueDictFamily", "Vuna/Compiler/Elab/Dict.vuna:317"));
  ("Elab_dDict.v_valueHasRigidNVar", ("Vuna.Compiler.Elab.Dict.valueHasRigidNVar", "Vuna/Compiler/Elab/Dict.vuna:1014"));
  ("Elab_dDict.v_viaAllowsFam", ("Vuna.Compiler.Elab.Dict.viaAllowsFam", "Vuna/Compiler/Elab/Dict.vuna:115"));
  ("Elab_dDict.v_viaCandidateExists", ("Vuna.Compiler.Elab.Dict.viaCandidateExists", "Vuna/Compiler/Elab/Dict.vuna:177"));
  ("Elab_dDict.v_viaFieldType", ("Vuna.Compiler.Elab.Dict.viaFieldType", "Vuna/Compiler/Elab/Dict.vuna:132"));
  ("Elab_dDict.v_viaWrapperData", ("Vuna.Compiler.Elab.Dict.viaWrapperData", "Vuna/Compiler/Elab/Dict.vuna:152"));
  ("Elab_dDict.v_viaWrapperOf", ("Vuna.Compiler.Elab.Dict.viaWrapperOf", "Vuna/Compiler/Elab/Dict.vuna:145"));
  ("Elab_dDict.v_viaWrapperShape", ("Vuna.Compiler.Elab.Dict.viaWrapperShape", "Vuna/Compiler/Elab/Dict.vuna:159"));
  ("Elab_dDriver.v_addClassesEc", ("Vuna.Compiler.Elab.Driver.addClassesEc", "Vuna/Compiler/Elab/Driver.vuna:1594"));
  ("Elab_dDriver.v_addDatasEc", ("Vuna.Compiler.Elab.Driver.addDatasEc", "Vuna/Compiler/Elab/Driver.vuna:1586"));
  ("Elab_dDriver.v_addInstsEc", ("Vuna.Compiler.Elab.Driver.addInstsEc", "Vuna/Compiler/Elab/Driver.vuna:1590"));
  ("Elab_dDriver.v_allReplCtors", ("Vuna.Compiler.Elab.Driver.allReplCtors", "Vuna/Compiler/Elab/Driver.vuna:596"));
  ("Elab_dDriver.v_anyAltHasAnyMeta", ("Vuna.Compiler.Elab.Driver.anyAltHasAnyMeta", "Vuna/Compiler/Elab/Driver.vuna:1487"));
  ("Elab_dDriver.v_anyAltHasMeta", ("Vuna.Compiler.Elab.Driver.anyAltHasMeta", "Vuna/Compiler/Elab/Driver.vuna:1447"));
  ("Elab_dDriver.v_anyArgHasAnyMeta", ("Vuna.Compiler.Elab.Driver.anyArgHasAnyMeta", "Vuna/Compiler/Elab/Driver.vuna:1483"));
  ("Elab_dDriver.v_anyArgHasMeta", ("Vuna.Compiler.Elab.Driver.anyArgHasMeta", "Vuna/Compiler/Elab/Driver.vuna:1443"));
  ("Elab_dDriver.v_appendLastTerm", ("Vuna.Compiler.Elab.Driver.appendLastTerm", "Vuna/Compiler/Elab/Driver.vuna:635"));
  ("Elab_dDriver.v_applyDeclaredDictSubsts", ("Vuna.Compiler.Elab.Driver.applyDeclaredDictSubsts", "Vuna/Compiler/Elab/Driver.vuna:323"));
  ("Elab_dDriver.v_axiomSpanOf", ("Vuna.Compiler.Elab.Driver.axiomSpanOf", "Vuna/Compiler/Elab/Driver.vuna:529"));
  ("Elab_dDriver.v_axiomSpanPairs", ("Vuna.Compiler.Elab.Driver.axiomSpanPairs", "Vuna/Compiler/Elab/Driver.vuna:513"));
  ("Elab_dDriver.v_axiomSpansTbl", ("Vuna.Compiler.Elab.Driver.axiomSpansTbl", "Vuna/Compiler/Elab/Driver.vuna:510"));
  ("Elab_dDriver.v_builtinHostLabelOf", ("Vuna.Compiler.Elab.Driver.builtinHostLabelOf", "Vuna/Compiler/Elab/Driver.vuna:1123"));
  ("Elab_dDriver.v_candidateLe", ("Vuna.Compiler.Elab.Driver.candidateLe", "Vuna/Compiler/Elab/Driver.vuna:1612"));
  ("Elab_dDriver.v_checkAllDefined", ("Vuna.Compiler.Elab.Driver.checkAllDefined", "Vuna/Compiler/Elab/Driver.vuna:478"));
  ("Elab_dDriver.v_checkAllDefinedGo", ("Vuna.Compiler.Elab.Driver.checkAllDefinedGo", "Vuna/Compiler/Elab/Driver.vuna:486"));
  ("Elab_dDriver.v_checkExternArrayElem", ("Vuna.Compiler.Elab.Driver.checkExternArrayElem", "Vuna/Compiler/Elab/Driver.vuna:572"));
  ("Elab_dDriver.v_checkExternDomain", ("Vuna.Compiler.Elab.Driver.checkExternDomain", "Vuna/Compiler/Elab/Driver.vuna:559"));
  ("Elab_dDriver.v_checkExternTy", ("Vuna.Compiler.Elab.Driver.checkExternTy", "Vuna/Compiler/Elab/Driver.vuna:540"));
  ("Elab_dDriver.v_checkExternValue", ("Vuna.Compiler.Elab.Driver.checkExternValue", "Vuna/Compiler/Elab/Driver.vuna:543"));
  ("Elab_dDriver.v_clausesOfTbl", ("Vuna.Compiler.Elab.Driver.clausesOfTbl", "Vuna/Compiler/Elab/Driver.vuna:346"));
  ("Elab_dDriver.v_clausesTblGo", ("Vuna.Compiler.Elab.Driver.clausesTblGo", "Vuna/Compiler/Elab/Driver.vuna:333"));
  ("Elab_dDriver.v_clausesTblOf", ("Vuna.Compiler.Elab.Driver.clausesTblOf", "Vuna/Compiler/Elab/Driver.vuna:330"));
  ("Elab_dDriver.v_countNames", ("Vuna.Compiler.Elab.Driver.countNames", "Vuna/Compiler/Elab/Driver.vuna:42"));
  ("Elab_dDriver.v_ctxDepthOf", ("Vuna.Compiler.Elab.Driver.ctxDepthOf", "Vuna/Compiler/Elab/Driver.vuna:1496"));
  ("Elab_dDriver.v_ctxEntriesAt", ("Vuna.Compiler.Elab.Driver.ctxEntriesAt", "Vuna/Compiler/Elab/Driver.vuna:1527"));
  ("Elab_dDriver.v_ctxEntriesOf", ("Vuna.Compiler.Elab.Driver.ctxEntriesOf", "Vuna/Compiler/Elab/Driver.vuna:1524"));
  ("Elab_dDriver.v_declFunNames", ("Vuna.Compiler.Elab.Driver.declFunNames", "Vuna/Compiler/Elab/Driver.vuna:369"));
  ("Elab_dDriver.v_declaredDictBinders", ("Vuna.Compiler.Elab.Driver.declaredDictBinders", "Vuna/Compiler/Elab/Driver.vuna:256"));
  ("Elab_dDriver.v_declaredDictBindersGo", ("Vuna.Compiler.Elab.Driver.declaredDictBindersGo", "Vuna/Compiler/Elab/Driver.vuna:259"));
  ("Elab_dDriver.v_defAlreadyDone", ("Vuna.Compiler.Elab.Driver.defAlreadyDone", "Vuna/Compiler/Elab/Driver.vuna:352"));
  ("Elab_dDriver.v_defBodyPair", ("Vuna.Compiler.Elab.Driver.defBodyPair", "Vuna/Compiler/Elab/Driver.vuna:362"));
  ("Elab_dDriver.v_defBodyPairs", ("Vuna.Compiler.Elab.Driver.defBodyPairs", "Vuna/Compiler/Elab/Driver.vuna:359"));
  ("Elab_dDriver.v_dictCandidatesOf", ("Vuna.Compiler.Elab.Driver.dictCandidatesOf", "Vuna/Compiler/Elab/Driver.vuna:1600"));
  ("Elab_dDriver.v_dictDomMatches", ("Vuna.Compiler.Elab.Driver.dictDomMatches", "Vuna/Compiler/Elab/Driver.vuna:317"));
  ("Elab_dDriver.v_dictFamilyOfShown", ("Vuna.Compiler.Elab.Driver.dictFamilyOfShown", "Vuna/Compiler/Elab/Driver.vuna:1624"));
  ("Elab_dDriver.v_dtEvalExprIn", ("Vuna.Compiler.Elab.Driver.dtEvalExprIn", "Vuna/Compiler/Elab/Driver.vuna:804"));
  ("Elab_dDriver.v_dtEvalExprInInfo", ("Vuna.Compiler.Elab.Driver.dtEvalExprInInfo", "Vuna/Compiler/Elab/Driver.vuna:810"));
  ("Elab_dDriver.v_dtEvalExprInInfoCore", ("Vuna.Compiler.Elab.Driver.dtEvalExprInInfoCore", "Vuna/Compiler/Elab/Driver.vuna:815"));
  ("Elab_dDriver.v_ecOfProgram", ("Vuna.Compiler.Elab.Driver.ecOfProgram", "Vuna/Compiler/Elab/Driver.vuna:1573"));
  ("Elab_dDriver.v_elabBodies", ("Vuna.Compiler.Elab.Driver.elabBodies", "Vuna/Compiler/Elab/Driver.vuna:422"));
  ("Elab_dDriver.v_elabGoalsWithPrepared", ("Vuna.Compiler.Elab.Driver.elabGoalsWithPrepared", "Vuna/Compiler/Elab/Driver.vuna:1553"));
  ("Elab_dDriver.v_elabMemberConstraintDoms", ("Vuna.Compiler.Elab.Driver.elabMemberConstraintDoms", "Vuna/Compiler/Elab/Driver.vuna:178"));
  ("Elab_dDriver.v_elabOneDef", ("Vuna.Compiler.Elab.Driver.elabOneDef", "Vuna/Compiler/Elab/Driver.vuna:378"));
  ("Elab_dDriver.v_elabProgram", ("Vuna.Compiler.Elab.Driver.elabProgram", "Vuna/Compiler/Elab/Driver.vuna:1563"));
  ("Elab_dDriver.v_elabProgramCoreWithAux", ("Vuna.Compiler.Elab.Driver.elabProgramCoreWithAux", "Vuna/Compiler/Elab/Driver.vuna:1007"));
  ("Elab_dDriver.v_elabProgramErrors", ("Vuna.Compiler.Elab.Driver.elabProgramErrors", "Vuna/Compiler/Elab/Driver.vuna:935"));
  ("Elab_dDriver.v_elabProgramFull", ("Vuna.Compiler.Elab.Driver.elabProgramFull", "Vuna/Compiler/Elab/Driver.vuna:921"));
  ("Elab_dDriver.v_elabProgramFullWith", ("Vuna.Compiler.Elab.Driver.elabProgramFullWith", "Vuna/Compiler/Elab/Driver.vuna:965"));
  ("Elab_dDriver.v_elabProgramFullWithAux", ("Vuna.Compiler.Elab.Driver.elabProgramFullWithAux", "Vuna/Compiler/Elab/Driver.vuna:971"));
  ("Elab_dDriver.v_elabProgramGo", ("Vuna.Compiler.Elab.Driver.elabProgramGo", "Vuna/Compiler/Elab/Driver.vuna:960"));
  ("Elab_dDriver.v_elabProgramGoWith", ("Vuna.Compiler.Elab.Driver.elabProgramGoWith", "Vuna/Compiler/Elab/Driver.vuna:993"));
  ("Elab_dDriver.v_elabProgramGoWithAux", ("Vuna.Compiler.Elab.Driver.elabProgramGoWithAux", "Vuna/Compiler/Elab/Driver.vuna:1346"));
  ("Elab_dDriver.v_elabSigDictBinders", ("Vuna.Compiler.Elab.Driver.elabSigDictBinders", "Vuna/Compiler/Elab/Driver.vuna:131"));
  ("Elab_dDriver.v_elabSigs", ("Vuna.Compiler.Elab.Driver.elabSigs", "Vuna/Compiler/Elab/Driver.vuna:78"));
  ("Elab_dDriver.v_elabSigsGo", ("Vuna.Compiler.Elab.Driver.elabSigsGo", "Vuna/Compiler/Elab/Driver.vuna:89"));
  ("Elab_dDriver.v_findDefByName", ("Vuna.Compiler.Elab.Driver.findDefByName", "Vuna/Compiler/Elab/Driver.vuna:1096"));
  ("Elab_dDriver.v_findDefWithMeta", ("Vuna.Compiler.Elab.Driver.findDefWithMeta", "Vuna/Compiler/Elab/Driver.vuna:1412"));
  ("Elab_dDriver.v_findGoal", ("Vuna.Compiler.Elab.Driver.findGoal", "Vuna/Compiler/Elab/Driver.vuna:1499"));
  ("Elab_dDriver.v_finishCore", ("Vuna.Compiler.Elab.Driver.finishCore", "Vuna/Compiler/Elab/Driver.vuna:1268"));
  ("Elab_dDriver.v_firstMatchDictBinder", ("Vuna.Compiler.Elab.Driver.firstMatchDictBinder", "Vuna/Compiler/Elab/Driver.vuna:312"));
  ("Elab_dDriver.v_funNamesTbl", ("Vuna.Compiler.Elab.Driver.funNamesTbl", "Vuna/Compiler/Elab/Driver.vuna:505"));
  ("Elab_dDriver.v_goalInfoOf", ("Vuna.Compiler.Elab.Driver.goalInfoOf", "Vuna/Compiler/Elab/Driver.vuna:1511"));
  ("Elab_dDriver.v_goalsOfProgram", ("Vuna.Compiler.Elab.Driver.goalsOfProgram", "Vuna/Compiler/Elab/Driver.vuna:1533"));
  ("Elab_dDriver.v_goalsOfProgramTolerant", ("Vuna.Compiler.Elab.Driver.goalsOfProgramTolerant", "Vuna/Compiler/Elab/Driver.vuna:1542"));
  ("Elab_dDriver.v_hasExplicitHasFieldInstance", ("Vuna.Compiler.Elab.Driver.hasExplicitHasFieldInstance", "Vuna/Compiler/Elab/Driver.vuna:896"));
  ("Elab_dDriver.v_hasFieldInstancesOfDecls", ("Vuna.Compiler.Elab.Driver.hasFieldInstancesOfDecls", "Vuna/Compiler/Elab/Driver.vuna:892"));
  ("Elab_dDriver.v_hasFunClause", ("Vuna.Compiler.Elab.Driver.hasFunClause", "Vuna/Compiler/Elab/Driver.vuna:521"));
  ("Elab_dDriver.v_hasHasFieldDecls", ("Vuna.Compiler.Elab.Driver.hasHasFieldDecls", "Vuna/Compiler/Elab/Driver.vuna:875"));
  ("Elab_dDriver.v_insertSigDicts", ("Vuna.Compiler.Elab.Driver.insertSigDicts", "Vuna/Compiler/Elab/Driver.vuna:223"));
  ("Elab_dDriver.v_insertSigDictsRev", ("Vuna.Compiler.Elab.Driver.insertSigDictsRev", "Vuna/Compiler/Elab/Driver.vuna:236"));
  ("Elab_dDriver.v_insertSigMembers", ("Vuna.Compiler.Elab.Driver.insertSigMembers", "Vuna/Compiler/Elab/Driver.vuna:192"));
  ("Elab_dDriver.v_insertSigMembersRev", ("Vuna.Compiler.Elab.Driver.insertSigMembersRev", "Vuna/Compiler/Elab/Driver.vuna:205"));
  ("Elab_dDriver.v_instCandidate", ("Vuna.Compiler.Elab.Driver.instCandidate", "Vuna/Compiler/Elab/Driver.vuna:1616"));
  ("Elab_dDriver.v_isBuiltinHostLabel", ("Vuna.Compiler.Elab.Driver.isBuiltinHostLabel", "Vuna/Compiler/Elab/Driver.vuna:1118"));
  ("Elab_dDriver.v_isBuiltinHostRowValue", ("Vuna.Compiler.Elab.Driver.isBuiltinHostRowValue", "Vuna/Compiler/Elab/Driver.vuna:1133"));
  ("Elab_dDriver.v_isMemberConstraintExpr", ("Vuna.Compiler.Elab.Driver.isMemberConstraintExpr", "Vuna/Compiler/Elab/Driver.vuna:164"));
  ("Elab_dDriver.v_isNilRowTerm", ("Vuna.Compiler.Elab.Driver.isNilRowTerm", "Vuna/Compiler/Elab/Driver.vuna:1111"));
  ("Elab_dDriver.v_isReplAtom", ("Vuna.Compiler.Elab.Driver.isReplAtom", "Vuna/Compiler/Elab/Driver.vuna:756"));
  ("Elab_dDriver.v_keptCtorArgs", ("Vuna.Compiler.Elab.Driver.keptCtorArgs", "Vuna/Compiler/Elab/Driver.vuna:773"));
  ("Elab_dDriver.v_leadingImplicitCtx", ("Vuna.Compiler.Elab.Driver.leadingImplicitCtx", "Vuna/Compiler/Elab/Driver.vuna:114"));
  ("Elab_dDriver.v_leadingImplicitCtxGo", ("Vuna.Compiler.Elab.Driver.leadingImplicitCtxGo", "Vuna/Compiler/Elab/Driver.vuna:117"));
  ("Elab_dDriver.v_mainActionOf", ("Vuna.Compiler.Elab.Driver.mainActionOf", "Vuna/Compiler/Elab/Driver.vuna:1103"));
  ("Elab_dDriver.v_mainArityErr", ("Vuna.Compiler.Elab.Driver.mainArityErr", "Vuna/Compiler/Elab/Driver.vuna:1190"));
  ("Elab_dDriver.v_mainEntryRowCheck", ("Vuna.Compiler.Elab.Driver.mainEntryRowCheck", "Vuna/Compiler/Elab/Driver.vuna:1149"));
  ("Elab_dDriver.v_mainHasParams", ("Vuna.Compiler.Elab.Driver.mainHasParams", "Vuna/Compiler/Elab/Driver.vuna:1184"));
  ("Elab_dDriver.v_mainShowBuiltinTy", ("Vuna.Compiler.Elab.Driver.mainShowBuiltinTy", "Vuna/Compiler/Elab/Driver.vuna:1175"));
  ("Elab_dDriver.v_mainShowMissing", ("Vuna.Compiler.Elab.Driver.mainShowMissing", "Vuna/Compiler/Elab/Driver.vuna:1261"));
  ("Elab_dDriver.v_matchedBodies", ("Vuna.Compiler.Elab.Driver.matchedBodies", "Vuna/Compiler/Elab/Driver.vuna:1221"));
  ("Elab_dDriver.v_maybeAddHasFieldInstances", ("Vuna.Compiler.Elab.Driver.maybeAddHasFieldInstances", "Vuna/Compiler/Elab/Driver.vuna:910"));
  ("Elab_dDriver.v_memberSugarExpr", ("Vuna.Compiler.Elab.Driver.memberSugarExpr", "Vuna/Compiler/Elab/Driver.vuna:170"));
  ("Elab_dDriver.v_metaOwnerHint", ("Vuna.Compiler.Elab.Driver.metaOwnerHint", "Vuna/Compiler/Elab/Driver.vuna:1406"));
  ("Elab_dDriver.v_mutWrapSig", ("Vuna.Compiler.Elab.Driver.mutWrapSig", "Vuna/Compiler/Elab/Driver.vuna:107"));
  ("Elab_dDriver.v_prependSigDicts", ("Vuna.Compiler.Elab.Driver.prependSigDicts", "Vuna/Compiler/Elab/Driver.vuna:231"));
  ("Elab_dDriver.v_prependSigMembers", ("Vuna.Compiler.Elab.Driver.prependSigMembers", "Vuna/Compiler/Elab/Driver.vuna:200"));
  ("Elab_dDriver.v_renderReplApp", ("Vuna.Compiler.Elab.Driver.renderReplApp", "Vuna/Compiler/Elab/Driver.vuna:614"));
  ("Elab_dDriver.v_renderReplArg", ("Vuna.Compiler.Elab.Driver.renderReplArg", "Vuna/Compiler/Elab/Driver.vuna:747"));
  ("Elab_dDriver.v_renderReplArgs", ("Vuna.Compiler.Elab.Driver.renderReplArgs", "Vuna/Compiler/Elab/Driver.vuna:739"));
  ("Elab_dDriver.v_renderReplCtor", ("Vuna.Compiler.Elab.Driver.renderReplCtor", "Vuna/Compiler/Elab/Driver.vuna:666"));
  ("Elab_dDriver.v_renderReplGeneric", ("Vuna.Compiler.Elab.Driver.renderReplGeneric", "Vuna/Compiler/Elab/Driver.vuna:735"));
  ("Elab_dDriver.v_renderReplList", ("Vuna.Compiler.Elab.Driver.renderReplList", "Vuna/Compiler/Elab/Driver.vuna:684"));
  ("Elab_dDriver.v_renderReplListTail", ("Vuna.Compiler.Elab.Driver.renderReplListTail", "Vuna/Compiler/Elab/Driver.vuna:697"));
  ("Elab_dDriver.v_renderReplPair", ("Vuna.Compiler.Elab.Driver.renderReplPair", "Vuna/Compiler/Elab/Driver.vuna:717"));
  ("Elab_dDriver.v_renderReplTerm", ("Vuna.Compiler.Elab.Driver.renderReplTerm", "Vuna/Compiler/Elab/Driver.vuna:600"));
  ("Elab_dDriver.v_renderReplUnary", ("Vuna.Compiler.Elab.Driver.renderReplUnary", "Vuna/Compiler/Elab/Driver.vuna:726"));
  ("Elab_dDriver.v_replJustName", ("Vuna.Compiler.Elab.Driver.replJustName", "Vuna/Compiler/Elab/Driver.vuna:797"));
  ("Elab_dDriver.v_replListConsName", ("Vuna.Compiler.Elab.Driver.replListConsName", "Vuna/Compiler/Elab/Driver.vuna:790"));
  ("Elab_dDriver.v_replListNilName", ("Vuna.Compiler.Elab.Driver.replListNilName", "Vuna/Compiler/Elab/Driver.vuna:786"));
  ("Elab_dDriver.v_replNatSuccName", ("Vuna.Compiler.Elab.Driver.replNatSuccName", "Vuna/Compiler/Elab/Driver.vuna:643"));
  ("Elab_dDriver.v_replNatValue", ("Vuna.Compiler.Elab.Driver.replNatValue", "Vuna/Compiler/Elab/Driver.vuna:646"));
  ("Elab_dDriver.v_replNatZeroName", ("Vuna.Compiler.Elab.Driver.replNatZeroName", "Vuna/Compiler/Elab/Driver.vuna:639"));
  ("Elab_dDriver.v_replNothingName", ("Vuna.Compiler.Elab.Driver.replNothingName", "Vuna/Compiler/Elab/Driver.vuna:801"));
  ("Elab_dDriver.v_replPairName", ("Vuna.Compiler.Elab.Driver.replPairName", "Vuna/Compiler/Elab/Driver.vuna:793"));
  ("Elab_dDriver.v_replShortName", ("Vuna.Compiler.Elab.Driver.replShortName", "Vuna/Compiler/Elab/Driver.vuna:625"));
  ("Elab_dDriver.v_resolveDictGoalsFix", ("Vuna.Compiler.Elab.Driver.resolveDictGoalsFix", "Vuna/Compiler/Elab/Driver.vuna:1364"));
  ("Elab_dDriver.v_resolveDictGoalsFixGo", ("Vuna.Compiler.Elab.Driver.resolveDictGoalsFixGo", "Vuna/Compiler/Elab/Driver.vuna:1370"));
  ("Elab_dDriver.v_resumeBodies", ("Vuna.Compiler.Elab.Driver.resumeBodies", "Vuna/Compiler/Elab/Driver.vuna:415"));
  ("Elab_dDriver.v_rezonkDefs", ("Vuna.Compiler.Elab.Driver.rezonkDefs", "Vuna/Compiler/Elab/Driver.vuna:1353"));
  ("Elab_dDriver.v_shortRecordMetas", ("Vuna.Compiler.Elab.Driver.shortRecordMetas", "Vuna/Compiler/Elab/Driver.vuna:883"));
  ("Elab_dDriver.v_showCounters", ("Vuna.Compiler.Elab.Driver.showCounters", "Vuna/Compiler/Elab/Driver.vuna:36"));
  ("Elab_dDriver.v_showValueRepl", ("Vuna.Compiler.Elab.Driver.showValueRepl", "Vuna/Compiler/Elab/Driver.vuna:593"));
  ("Elab_dDriver.v_sigDictName", ("Vuna.Compiler.Elab.Driver.sigDictName", "Vuna/Compiler/Elab/Driver.vuna:241"));
  ("Elab_dDriver.v_sigMemberName", ("Vuna.Compiler.Elab.Driver.sigMemberName", "Vuna/Compiler/Elab/Driver.vuna:214"));
  ("Elab_dDriver.v_solveDeclaredDictGoals", ("Vuna.Compiler.Elab.Driver.solveDeclaredDictGoals", "Vuna/Compiler/Elab/Driver.vuna:270"));
  ("Elab_dDriver.v_solveDeclaredDictGoalsGo", ("Vuna.Compiler.Elab.Driver.solveDeclaredDictGoalsGo", "Vuna/Compiler/Elab/Driver.vuna:287"));
  ("Elab_dDriver.v_sortCandidates", ("Vuna.Compiler.Elab.Driver.sortCandidates", "Vuna/Compiler/Elab/Driver.vuna:1609"));
  ("Elab_dDriver.v_spineOf", ("Vuna.Compiler.Elab.Driver.spineOf", "Vuna/Compiler/Elab/Driver.vuna:628"));
  ("Elab_dDriver.v_splitMemberCtx", ("Vuna.Compiler.Elab.Driver.splitMemberCtx", "Vuna/Compiler/Elab/Driver.vuna:157"));
  ("Elab_dDriver.v_synthMainShow", ("Vuna.Compiler.Elab.Driver.synthMainShow", "Vuna/Compiler/Elab/Driver.vuna:1198"));
  ("Elab_dDriver.v_synthMainShowGo", ("Vuna.Compiler.Elab.Driver.synthMainShowGo", "Vuna/Compiler/Elab/Driver.vuna:1237"));
  ("Elab_dDriver.v_synthMainShowInner", ("Vuna.Compiler.Elab.Driver.synthMainShowInner", "Vuna/Compiler/Elab/Driver.vuna:1230"));
  ("Elab_dDriver.v_takeWhileDictChar", ("Vuna.Compiler.Elab.Driver.takeWhileDictChar", "Vuna/Compiler/Elab/Driver.vuna:1635"));
  ("Elab_dDriver.v_termHasAnyMeta", ("Vuna.Compiler.Elab.Driver.termHasAnyMeta", "Vuna/Compiler/Elab/Driver.vuna:1457"));
  ("Elab_dDriver.v_termHasAnyMetaMaybe", ("Vuna.Compiler.Elab.Driver.termHasAnyMetaMaybe", "Vuna/Compiler/Elab/Driver.vuna:1491"));
  ("Elab_dDriver.v_termHasMeta", ("Vuna.Compiler.Elab.Driver.termHasMeta", "Vuna/Compiler/Elab/Driver.vuna:1417"));
  ("Elab_dDriver.v_termHasMetaMaybe", ("Vuna.Compiler.Elab.Driver.termHasMetaMaybe", "Vuna/Compiler/Elab/Driver.vuna:1451"));
  ("Elab_dDriver.v_unsolvedFromRelevant", ("Vuna.Compiler.Elab.Driver.unsolvedFromRelevant", "Vuna/Compiler/Elab/Driver.vuna:59"));
  ("Elab_dDriver.v_unsolvedFromRelevantGo", ("Vuna.Compiler.Elab.Driver.unsolvedFromRelevantGo", "Vuna/Compiler/Elab/Driver.vuna:63"));
  ("Elab_dDriver.v_unsolvedMessage", ("Vuna.Compiler.Elab.Driver.unsolvedMessage", "Vuna/Compiler/Elab/Driver.vuna:1382"));
  ("Elab_dDriver.v_unsolvedMeta", ("Vuna.Compiler.Elab.Driver.unsolvedMeta", "Vuna/Compiler/Elab/Driver.vuna:52"));
  ("Elab_dDriver.v_withMetaCreated", ("Vuna.Compiler.Elab.Driver.withMetaCreated", "Vuna/Compiler/Elab/Driver.vuna:1641"));
  ("Elab_dDriver.v_zipKeptArgs", ("Vuna.Compiler.Elab.Driver.zipKeptArgs", "Vuna/Compiler/Elab/Driver.vuna:779"));
  ("Elab_dDriver.v_zonkGoal", ("Vuna.Compiler.Elab.Driver.zonkGoal", "Vuna/Compiler/Elab/Driver.vuna:1520"));
  ("Elab_dInstCoherence.v_anyInstanceExact", ("Vuna.Compiler.Elab.InstCoherence.anyInstanceExact", "Vuna/Compiler/Elab/InstCoherence.vuna:51"));
  ("Elab_dInstCoherence.v_anyInstanceOverlap", ("Vuna.Compiler.Elab.InstCoherence.anyInstanceOverlap", "Vuna/Compiler/Elab/InstCoherence.vuna:61"));
  ("Elab_dInstCoherence.v_findInstanceClash", ("Vuna.Compiler.Elab.InstCoherence.findInstanceClash", "Vuna/Compiler/Elab/InstCoherence.vuna:40"));
  ("Elab_dInstCoherence.v_headsAlphaEqual", ("Vuna.Compiler.Elab.InstCoherence.headsAlphaEqual", "Vuna/Compiler/Elab/InstCoherence.vuna:79"));
  ("Elab_dInstCoherence.v_headsOverlap", ("Vuna.Compiler.Elab.InstCoherence.headsOverlap", "Vuna/Compiler/Elab/InstCoherence.vuna:110"));
  ("Elab_dInstCoherence.v_headsOverlapOne", ("Vuna.Compiler.Elab.InstCoherence.headsOverlapOne", "Vuna/Compiler/Elab/InstCoherence.vuna:120"));
  ("Elab_dInstCoherence.v_instanceExactQuiet", ("Vuna.Compiler.Elab.InstCoherence.instanceExactQuiet", "Vuna/Compiler/Elab/InstCoherence.vuna:74"));
  ("Elab_dInstCoherence.v_instanceKey", ("Vuna.Compiler.Elab.InstCoherence.instanceKey", "Vuna/Compiler/Elab/InstCoherence.vuna:90"));
  ("Elab_dInstCoherence.v_teleAlphaEnv", ("Vuna.Compiler.Elab.InstCoherence.teleAlphaEnv", "Vuna/Compiler/Elab/InstCoherence.vuna:98"));
  ("Elab_dInstCoherence.v_teleAlphaEnvGo", ("Vuna.Compiler.Elab.InstCoherence.teleAlphaEnvGo", "Vuna/Compiler/Elab/InstCoherence.vuna:101"));
  ("Elab_dInstCoherence.v_teleGlobalEnv", ("Vuna.Compiler.Elab.InstCoherence.teleGlobalEnv", "Vuna/Compiler/Elab/InstCoherence.vuna:131"));
  ("Elab_dInstCoherence.v_teleGlobalEnvGo", ("Vuna.Compiler.Elab.InstCoherence.teleGlobalEnvGo", "Vuna/Compiler/Elab/InstCoherence.vuna:134"));
  ("Elab_dInstName.v_argSuffix", ("Vuna.Compiler.Elab.InstName.argSuffix", "Vuna/Compiler/Elab/InstName.vuna:73"));
  ("Elab_dInstName.v_argSuffixTail", ("Vuna.Compiler.Elab.InstName.argSuffixTail", "Vuna/Compiler/Elab/InstName.vuna:68"));
  ("Elab_dInstName.v_classDigest", ("Vuna.Compiler.Elab.InstName.classDigest", "Vuna/Compiler/Elab/InstName.vuna:40"));
  ("Elab_dInstName.v_derivedInstName", ("Vuna.Compiler.Elab.InstName.derivedInstName", "Vuna/Compiler/Elab/InstName.vuna:63"));
  ("Elab_dInstName.v_exprNameFor", ("Vuna.Compiler.Elab.InstName.exprNameFor", "Vuna/Compiler/Elab/InstName.vuna:88"));
  ("Elab_dInstName.v_instNameChar", ("Vuna.Compiler.Elab.InstName.instNameChar", "Vuna/Compiler/Elab/InstName.vuna:51"));
  ("Elab_dInstName.v_instanceName", ("Vuna.Compiler.Elab.InstName.instanceName", "Vuna/Compiler/Elab/InstName.vuna:29"));
  ("Elab_dInstName.v_instanceSymbol", ("Vuna.Compiler.Elab.InstName.instanceSymbol", "Vuna/Compiler/Elab/InstName.vuna:36"));
  ("Elab_dInstName.v_isAsciiAlphaNum", ("Vuna.Compiler.Elab.InstName.isAsciiAlphaNum", "Vuna/Compiler/Elab/InstName.vuna:58"));
  ("Elab_dInstName.v_piName", ("Vuna.Compiler.Elab.InstName.piName", "Vuna/Compiler/Elab/InstName.vuna:80"));
  ("Elab_dInstName.v_sanitizeInstName", ("Vuna.Compiler.Elab.InstName.sanitizeInstName", "Vuna/Compiler/Elab/InstName.vuna:48"));
  ("Elab_dMatch.v_addNameDistinct", ("Vuna.Compiler.Elab.Match.addNameDistinct", "Vuna/Compiler/Elab/Match.vuna:568"));
  ("Elab_dMatch.v_allCtorHeads", ("Vuna.Compiler.Elab.Match.allCtorHeads", "Vuna/Compiler/Elab/Match.vuna:332"));
  ("Elab_dMatch.v_allEmptyPats", ("Vuna.Compiler.Elab.Match.allEmptyPats", "Vuna/Compiler/Elab/Match.vuna:371"));
  ("Elab_dMatch.v_allIrrefutablePats", ("Vuna.Compiler.Elab.Match.allIrrefutablePats", "Vuna/Compiler/Elab/Match.vuna:362"));
  ("Elab_dMatch.v_allVarHeads", ("Vuna.Compiler.Elab.Match.allVarHeads", "Vuna/Compiler/Elab/Match.vuna:387"));
  ("Elab_dMatch.v_allVarPats", ("Vuna.Compiler.Elab.Match.allVarPats", "Vuna/Compiler/Elab/Match.vuna:28"));
  ("Elab_dMatch.v_allWildPats", ("Vuna.Compiler.Elab.Match.allWildPats", "Vuna/Compiler/Elab/Match.vuna:343"));
  ("Elab_dMatch.v_arityOf", ("Vuna.Compiler.Elab.Match.arityOf", "Vuna/Compiler/Elab/Match.vuna:112"));
  ("Elab_dMatch.v_asColumn", ("Vuna.Compiler.Elab.Match.asColumn", "Vuna/Compiler/Elab/Match.vuna:230"));
  ("Elab_dMatch.v_asInnerClause", ("Vuna.Compiler.Elab.Match.asInnerClause", "Vuna/Compiler/Elab/Match.vuna:239"));
  ("Elab_dMatch.v_bindNames", ("Vuna.Compiler.Elab.Match.bindNames", "Vuna/Compiler/Elab/Match.vuna:484"));
  ("Elab_dMatch.v_bodyOfFirst", ("Vuna.Compiler.Elab.Match.bodyOfFirst", "Vuna/Compiler/Elab/Match.vuna:378"));
  ("Elab_dMatch.v_buildColumnExpr", ("Vuna.Compiler.Elab.Match.buildColumnExpr", "Vuna/Compiler/Elab/Match.vuna:197"));
  ("Elab_dMatch.v_buildColumnExprPruned", ("Vuna.Compiler.Elab.Match.buildColumnExprPruned", "Vuna/Compiler/Elab/Match.vuna:204"));
  ("Elab_dMatch.v_canonHeads", ("Vuna.Compiler.Elab.Match.canonHeads", "Vuna/Compiler/Elab/Match.vuna:294"));
  ("Elab_dMatch.v_checkReachable", ("Vuna.Compiler.Elab.Match.checkReachable", "Vuna/Compiler/Elab/Match.vuna:64"));
  ("Elab_dMatch.v_clauseArityTooMany", ("Vuna.Compiler.Elab.Match.clauseArityTooMany", "Vuna/Compiler/Elab/Match.vuna:40"));
  ("Elab_dMatch.v_clauseHeadSpan", ("Vuna.Compiler.Elab.Match.clauseHeadSpan", "Vuna/Compiler/Elab/Match.vuna:82"));
  ("Elab_dMatch.v_clausesForCtor", ("Vuna.Compiler.Elab.Match.clausesForCtor", "Vuna/Compiler/Elab/Match.vuna:576"));
  ("Elab_dMatch.v_ctorAltList", ("Vuna.Compiler.Elab.Match.ctorAltList", "Vuna/Compiler/Elab/Match.vuna:508"));
  ("Elab_dMatch.v_ctorAltListGo", ("Vuna.Compiler.Elab.Match.ctorAltListGo", "Vuna/Compiler/Elab/Match.vuna:515"));
  ("Elab_dMatch.v_ctorColumn", ("Vuna.Compiler.Elab.Match.ctorColumn", "Vuna/Compiler/Elab/Match.vuna:263"));
  ("Elab_dMatch.v_ctorHeads", ("Vuna.Compiler.Elab.Match.ctorHeads", "Vuna/Compiler/Elab/Match.vuna:558"));
  ("Elab_dMatch.v_ctorSubPatCount", ("Vuna.Compiler.Elab.Match.ctorSubPatCount", "Vuna/Compiler/Elab/Match.vuna:531"));
  ("Elab_dMatch.v_fallbackAltList", ("Vuna.Compiler.Elab.Match.fallbackAltList", "Vuna/Compiler/Elab/Match.vuna:603"));
  ("Elab_dMatch.v_familyCovered", ("Vuna.Compiler.Elab.Match.familyCovered", "Vuna/Compiler/Elab/Match.vuna:307"));
  ("Elab_dMatch.v_familyOfCtor", ("Vuna.Compiler.Elab.Match.familyOfCtor", "Vuna/Compiler/Elab/Match.vuna:276"));
  ("Elab_dMatch.v_familyOfHead", ("Vuna.Compiler.Elab.Match.familyOfHead", "Vuna/Compiler/Elab/Match.vuna:284"));
  ("Elab_dMatch.v_filterFallback", ("Vuna.Compiler.Elab.Match.filterFallback", "Vuna/Compiler/Elab/Match.vuna:593"));
  ("Elab_dMatch.v_filterLitBranch", ("Vuna.Compiler.Elab.Match.filterLitBranch", "Vuna/Compiler/Elab/Match.vuna:161"));
  ("Elab_dMatch.v_firstPatSpan", ("Vuna.Compiler.Elab.Match.firstPatSpan", "Vuna/Compiler/Elab/Match.vuna:254"));
  ("Elab_dMatch.v_firstPats", ("Vuna.Compiler.Elab.Match.firstPats", "Vuna/Compiler/Elab/Match.vuna:351"));
  ("Elab_dMatch.v_hasAsHead", ("Vuna.Compiler.Elab.Match.hasAsHead", "Vuna/Compiler/Elab/Match.vuna:223"));
  ("Elab_dMatch.v_hasCtorHead", ("Vuna.Compiler.Elab.Match.hasCtorHead", "Vuna/Compiler/Elab/Match.vuna:321"));
  ("Elab_dMatch.v_innerOfHead", ("Vuna.Compiler.Elab.Match.innerOfHead", "Vuna/Compiler/Elab/Match.vuna:243"));
  ("Elab_dMatch.v_irrefutablePat", ("Vuna.Compiler.Elab.Match.irrefutablePat", "Vuna/Compiler/Elab/Match.vuna:356"));
  ("Elab_dMatch.v_isVarPatD", ("Vuna.Compiler.Elab.Match.isVarPatD", "Vuna/Compiler/Elab/Match.vuna:382"));
  ("Elab_dMatch.v_isWildPat", ("Vuna.Compiler.Elab.Match.isWildPat", "Vuna/Compiler/Elab/Match.vuna:347"));
  ("Elab_dMatch.v_litAltExpr", ("Vuna.Compiler.Elab.Match.litAltExpr", "Vuna/Compiler/Elab/Match.vuna:133"));
  ("Elab_dMatch.v_litAltExprGo", ("Vuna.Compiler.Elab.Match.litAltExprGo", "Vuna/Compiler/Elab/Match.vuna:137"));
  ("Elab_dMatch.v_litBranchClauses", ("Vuna.Compiler.Elab.Match.litBranchClauses", "Vuna/Compiler/Elab/Match.vuna:158"));
  ("Elab_dMatch.v_litPatExpr", ("Vuna.Compiler.Elab.Match.litPatExpr", "Vuna/Compiler/Elab/Match.vuna:191"));
  ("Elab_dMatch.v_litPatMatches", ("Vuna.Compiler.Elab.Match.litPatMatches", "Vuna/Compiler/Elab/Match.vuna:175"));
  ("Elab_dMatch.v_literalBranchBody", ("Vuna.Compiler.Elab.Match.literalBranchBody", "Vuna/Compiler/Elab/Match.vuna:171"));
  ("Elab_dMatch.v_matrixOf", ("Vuna.Compiler.Elab.Match.matrixOf", "Vuna/Compiler/Elab/Match.vuna:105"));
  ("Elab_dMatch.v_multiToCaseExpr", ("Vuna.Compiler.Elab.Match.multiToCaseExpr", "Vuna/Compiler/Elab/Match.vuna:89"));
  ("Elab_dMatch.v_multiToExpr", ("Vuna.Compiler.Elab.Match.multiToExpr", "Vuna/Compiler/Elab/Match.vuna:44"));
  ("Elab_dMatch.v_paramNames", ("Vuna.Compiler.Elab.Match.paramNames", "Vuna/Compiler/Elab/Match.vuna:116"));
  ("Elab_dMatch.v_paramNamesGo", ("Vuna.Compiler.Elab.Match.paramNamesGo", "Vuna/Compiler/Elab/Match.vuna:119"));
  ("Elab_dMatch.v_patNamesOf", ("Vuna.Compiler.Elab.Match.patNamesOf", "Vuna/Compiler/Elab/Match.vuna:488"));
  ("Elab_dMatch.v_prepFallbacks", ("Vuna.Compiler.Elab.Match.prepFallbacks", "Vuna/Compiler/Elab/Match.vuna:612"));
  ("Elab_dMatch.v_prepVarColumn", ("Vuna.Compiler.Elab.Match.prepVarColumn", "Vuna/Compiler/Elab/Match.vuna:404"));
  ("Elab_dMatch.v_pruneRows", ("Vuna.Compiler.Elab.Match.pruneRows", "Vuna/Compiler/Elab/Match.vuna:367"));
  ("Elab_dMatch.v_reachableGo", ("Vuna.Compiler.Elab.Match.reachableGo", "Vuna/Compiler/Elab/Match.vuna:73"));
  ("Elab_dMatch.v_renameAlt", ("Vuna.Compiler.Elab.Match.renameAlt", "Vuna/Compiler/Elab/Match.vuna:497"));
  ("Elab_dMatch.v_renameAsHead", ("Vuna.Compiler.Elab.Match.renameAsHead", "Vuna/Compiler/Elab/Match.vuna:247"));
  ("Elab_dMatch.v_renameBind", ("Vuna.Compiler.Elab.Match.renameBind", "Vuna/Compiler/Elab/Match.vuna:471"));
  ("Elab_dMatch.v_renameExpr", ("Vuna.Compiler.Elab.Match.renameExpr", "Vuna/Compiler/Elab/Match.vuna:415"));
  ("Elab_dMatch.v_renameExprUnless", ("Vuna.Compiler.Elab.Match.renameExprUnless", "Vuna/Compiler/Elab/Match.vuna:467"));
  ("Elab_dMatch.v_renameFieldValue", ("Vuna.Compiler.Elab.Match.renameFieldValue", "Vuna/Compiler/Elab/Match.vuna:474"));
  ("Elab_dMatch.v_renameInterpParts", ("Vuna.Compiler.Elab.Match.renameInterpParts", "Vuna/Compiler/Elab/Match.vuna:460"));
  ("Elab_dMatch.v_renameLocalClause", ("Vuna.Compiler.Elab.Match.renameLocalClause", "Vuna/Compiler/Elab/Match.vuna:479"));
  ("Elab_dMatch.v_stripAsPat", ("Vuna.Compiler.Elab.Match.stripAsPat", "Vuna/Compiler/Elab/Match.vuna:108"));
  ("Elab_dMatch.v_stripFirstCol", ("Vuna.Compiler.Elab.Match.stripFirstCol", "Vuna/Compiler/Elab/Match.vuna:394"));
  ("Elab_dMatch.v_subNamesFor", ("Vuna.Compiler.Elab.Match.subNamesFor", "Vuna/Compiler/Elab/Match.vuna:545"));
  ("Elab_dMatch.v_subNamesForGo", ("Vuna.Compiler.Elab.Match.subNamesForGo", "Vuna/Compiler/Elab/Match.vuna:548"));
  ("Elab_dMatch.v_subNamesForGoGo", ("Vuna.Compiler.Elab.Match.subNamesForGoGo", "Vuna/Compiler/Elab/Match.vuna:551"));
  ("Elab_dMatch.v_wrapLambdas", ("Vuna.Compiler.Elab.Match.wrapLambdas", "Vuna/Compiler/Elab/Match.vuna:126"));
  ("Elab_dMeta.v_allTeleArgs", ("Vuna.Compiler.Elab.Meta.allTeleArgs", "Vuna/Compiler/Elab/Meta.vuna:777"));
  ("Elab_dMeta.v_anyCtorIndexed", ("Vuna.Compiler.Elab.Meta.anyCtorIndexed", "Vuna/Compiler/Elab/Meta.vuna:1450"));
  ("Elab_dMeta.v_anyLinearVals", ("Vuna.Compiler.Elab.Meta.anyLinearVals", "Vuna/Compiler/Elab/Meta.vuna:1160"));
  ("Elab_dMeta.v_anyNonVarArg", ("Vuna.Compiler.Elab.Meta.anyNonVarArg", "Vuna/Compiler/Elab/Meta.vuna:1463"));
  ("Elab_dMeta.v_baseNameOf", ("Vuna.Compiler.Elab.Meta.baseNameOf", "Vuna/Compiler/Elab/Meta.vuna:1424"));
  ("Elab_dMeta.v_binderRig", ("Vuna.Compiler.Elab.Meta.binderRig", "Vuna/Compiler/Elab/Meta.vuna:941"));
  ("Elab_dMeta.v_boolCtorTerm", ("Vuna.Compiler.Elab.Meta.boolCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:88"));
  ("Elab_dMeta.v_boolCtorValue", ("Vuna.Compiler.Elab.Meta.boolCtorValue", "Vuna/Compiler/Elab/Meta.vuna:84"));
  ("Elab_dMeta.v_candidatesInFamily", ("Vuna.Compiler.Elab.Meta.candidatesInFamily", "Vuna/Compiler/Elab/Meta.vuna:473"));
  ("Elab_dMeta.v_castErased", ("Vuna.Compiler.Elab.Meta.castErased", "Vuna/Compiler/Elab/Meta.vuna:1080"));
  ("Elab_dMeta.v_collectDataDecls", ("Vuna.Compiler.Elab.Meta.collectDataDecls", "Vuna/Compiler/Elab/Meta.vuna:307"));
  ("Elab_dMeta.v_collectInstDecls", ("Vuna.Compiler.Elab.Meta.collectInstDecls", "Vuna/Compiler/Elab/Meta.vuna:707"));
  ("Elab_dMeta.v_collectSigOne", ("Vuna.Compiler.Elab.Meta.collectSigOne", "Vuna/Compiler/Elab/Meta.vuna:290"));
  ("Elab_dMeta.v_collectSigs", ("Vuna.Compiler.Elab.Meta.collectSigs", "Vuna/Compiler/Elab/Meta.vuna:257"));
  ("Elab_dMeta.v_collectSigsInto", ("Vuna.Compiler.Elab.Meta.collectSigsInto", "Vuna/Compiler/Elab/Meta.vuna:271"));
  ("Elab_dMeta.v_collectTraitDecls", ("Vuna.Compiler.Elab.Meta.collectTraitDecls", "Vuna/Compiler/Elab/Meta.vuna:700"));
  ("Elab_dMeta.v_convEc", ("Vuna.Compiler.Elab.Meta.convEc", "Vuna/Compiler/Elab/Meta.vuna:126"));
  ("Elab_dMeta.v_ctorAppTerm", ("Vuna.Compiler.Elab.Meta.ctorAppTerm", "Vuna/Compiler/Elab/Meta.vuna:1332"));
  ("Elab_dMeta.v_ctorAppTermEc", ("Vuna.Compiler.Elab.Meta.ctorAppTermEc", "Vuna/Compiler/Elab/Meta.vuna:1319"));
  ("Elab_dMeta.v_ctorFamilyIs", ("Vuna.Compiler.Elab.Meta.ctorFamilyIs", "Vuna/Compiler/Elab/Meta.vuna:466"));
  ("Elab_dMeta.v_ctorFamilyNameOf", ("Vuna.Compiler.Elab.Meta.ctorFamilyNameOf", "Vuna/Compiler/Elab/Meta.vuna:428"));
  ("Elab_dMeta.v_ctorFamilyTable", ("Vuna.Compiler.Elab.Meta.ctorFamilyTable", "Vuna/Compiler/Elab/Meta.vuna:1438"));
  ("Elab_dMeta.v_ctorGlobals", ("Vuna.Compiler.Elab.Meta.ctorGlobals", "Vuna/Compiler/Elab/Meta.vuna:667"));
  ("Elab_dMeta.v_ctorLinearName", ("Vuna.Compiler.Elab.Meta.ctorLinearName", "Vuna/Compiler/Elab/Meta.vuna:1170"));
  ("Elab_dMeta.v_ctorRefTerm", ("Vuna.Compiler.Elab.Meta.ctorRefTerm", "Vuna/Compiler/Elab/Meta.vuna:1305"));
  ("Elab_dMeta.v_ctorRefTermEc", ("Vuna.Compiler.Elab.Meta.ctorRefTermEc", "Vuna/Compiler/Elab/Meta.vuna:1296"));
  ("Elab_dMeta.v_ctorResultIndexed", ("Vuna.Compiler.Elab.Meta.ctorResultIndexed", "Vuna/Compiler/Elab/Meta.vuna:1454"));
  ("Elab_dMeta.v_ctxHasLinear", ("Vuna.Compiler.Elab.Meta.ctxHasLinear", "Vuna/Compiler/Elab/Meta.vuna:1195"));
  ("Elab_dMeta.v_ctxHasLinearItems", ("Vuna.Compiler.Elab.Meta.ctxHasLinearItems", "Vuna/Compiler/Elab/Meta.vuna:1198"));
  ("Elab_dMeta.v_ctxItemAt", ("Vuna.Compiler.Elab.Meta.ctxItemAt", "Vuna/Compiler/Elab/Meta.vuna:919"));
  ("Elab_dMeta.v_dataLinearName", ("Vuna.Compiler.Elab.Meta.dataLinearName", "Vuna/Compiler/Elab/Meta.vuna:1164"));
  ("Elab_dMeta.v_dataNamesOf", ("Vuna.Compiler.Elab.Meta.dataNamesOf", "Vuna/Compiler/Elab/Meta.vuna:319"));
  ("Elab_dMeta.v_dataShortNameOf", ("Vuna.Compiler.Elab.Meta.dataShortNameOf", "Vuna/Compiler/Elab/Meta.vuna:411"));
  ("Elab_dMeta.v_defaultOrOver", ("Vuna.Compiler.Elab.Meta.defaultOrOver", "Vuna/Compiler/Elab/Meta.vuna:505"));
  ("Elab_dMeta.v_dictCtorName", ("Vuna.Compiler.Elab.Meta.dictCtorName", "Vuna/Compiler/Elab/Meta.vuna:696"));
  ("Elab_dMeta.v_dictTypeName", ("Vuna.Compiler.Elab.Meta.dictTypeName", "Vuna/Compiler/Elab/Meta.vuna:693"));
  ("Elab_dMeta.v_dropCount", ("Vuna.Compiler.Elab.Meta.dropCount", "Vuna/Compiler/Elab/Meta.vuna:1393"));
  ("Elab_dMeta.v_dropParams", ("Vuna.Compiler.Elab.Meta.dropParams", "Vuna/Compiler/Elab/Meta.vuna:663"));
  ("Elab_dMeta.v_dropPis", ("Vuna.Compiler.Elab.Meta.dropPis", "Vuna/Compiler/Elab/Meta.vuna:1459"));
  ("Elab_dMeta.v_dtCtorLookup", ("Vuna.Compiler.Elab.Meta.dtCtorLookup", "Vuna/Compiler/Elab/Meta.vuna:363"));
  ("Elab_dMeta.v_dtCtorLookupEc", ("Vuna.Compiler.Elab.Meta.dtCtorLookupEc", "Vuna/Compiler/Elab/Meta.vuna:373"));
  ("Elab_dMeta.v_dtDataLookup", ("Vuna.Compiler.Elab.Meta.dtDataLookup", "Vuna/Compiler/Elab/Meta.vuna:355"));
  ("Elab_dMeta.v_dualFamilyOf", ("Vuna.Compiler.Elab.Meta.dualFamilyOf", "Vuna/Compiler/Elab/Meta.vuna:454"));
  ("Elab_dMeta.v_etaCtorLa", ("Vuna.Compiler.Elab.Meta.etaCtorLa", "Vuna/Compiler/Elab/Meta.vuna:1380"));
  ("Elab_dMeta.v_etaCtorTerm", ("Vuna.Compiler.Elab.Meta.etaCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:1363"));
  ("Elab_dMeta.v_expectedFamilyOf", ("Vuna.Compiler.Elab.Meta.expectedFamilyOf", "Vuna/Compiler/Elab/Meta.vuna:435"));
  ("Elab_dMeta.v_expectedFamilyOfFuel", ("Vuna.Compiler.Elab.Meta.expectedFamilyOfFuel", "Vuna/Compiler/Elab/Meta.vuna:439"));
  ("Elab_dMeta.v_explicitPiArity", ("Vuna.Compiler.Elab.Meta.explicitPiArity", "Vuna/Compiler/Elab/Meta.vuna:1431"));
  ("Elab_dMeta.v_familyIndexed", ("Vuna.Compiler.Elab.Meta.familyIndexed", "Vuna/Compiler/Elab/Meta.vuna:1447"));
  ("Elab_dMeta.v_fieldBinderGo", ("Vuna.Compiler.Elab.Meta.fieldBinderGo", "Vuna/Compiler/Elab/Meta.vuna:744"));
  ("Elab_dMeta.v_fieldBinderGoGo", ("Vuna.Compiler.Elab.Meta.fieldBinderGoGo", "Vuna/Compiler/Elab/Meta.vuna:747"));
  ("Elab_dMeta.v_fieldBinderNames", ("Vuna.Compiler.Elab.Meta.fieldBinderNames", "Vuna/Compiler/Elab/Meta.vuna:741"));
  ("Elab_dMeta.v_fieldVarName", ("Vuna.Compiler.Elab.Meta.fieldVarName", "Vuna/Compiler/Elab/Meta.vuna:738"));
  ("Elab_dMeta.v_findCatchAllBody", ("Vuna.Compiler.Elab.Meta.findCatchAllBody", "Vuna/Compiler/Elab/Meta.vuna:1471"));
  ("Elab_dMeta.v_findClassByMethod", ("Vuna.Compiler.Elab.Meta.findClassByMethod", "Vuna/Compiler/Elab/Meta.vuna:756"));
  ("Elab_dMeta.v_findCtorIn", ("Vuna.Compiler.Elab.Meta.findCtorIn", "Vuna/Compiler/Elab/Meta.vuna:359"));
  ("Elab_dMeta.v_foldAppTerms", ("Vuna.Compiler.Elab.Meta.foldAppTerms", "Vuna/Compiler/Elab/Meta.vuna:1402"));
  ("Elab_dMeta.v_freshVarValue", ("Vuna.Compiler.Elab.Meta.freshVarValue", "Vuna/Compiler/Elab/Meta.vuna:1263"));
  ("Elab_dMeta.v_globalLookup", ("Vuna.Compiler.Elab.Meta.globalLookup", "Vuna/Compiler/Elab/Meta.vuna:226"));
  ("Elab_dMeta.v_globalsLookup", ("Vuna.Compiler.Elab.Meta.globalsLookup", "Vuna/Compiler/Elab/Meta.vuna:233"));
  ("Elab_dMeta.v_globalsTableOf", ("Vuna.Compiler.Elab.Meta.globalsTableOf", "Vuna/Compiler/Elab/Meta.vuna:245"));
  ("Elab_dMeta.v_hasFamParams", ("Vuna.Compiler.Elab.Meta.hasFamParams", "Vuna/Compiler/Elab/Meta.vuna:1413"));
  ("Elab_dMeta.v_hasNoExplicitPi", ("Vuna.Compiler.Elab.Meta.hasNoExplicitPi", "Vuna/Compiler/Elab/Meta.vuna:29"));
  ("Elab_dMeta.v_hasNoExplicitPiFuel", ("Vuna.Compiler.Elab.Meta.hasNoExplicitPiFuel", "Vuna/Compiler/Elab/Meta.vuna:32"));
  ("Elab_dMeta.v_hasOutOfScopeVar", ("Vuna.Compiler.Elab.Meta.hasOutOfScopeVar", "Vuna/Compiler/Elab/Meta.vuna:640"));
  ("Elab_dMeta.v_hasOutOfScopeVarAlts", ("Vuna.Compiler.Elab.Meta.hasOutOfScopeVarAlts", "Vuna/Compiler/Elab/Meta.vuna:646"));
  ("Elab_dMeta.v_hasOutOfScopeVarArgs", ("Vuna.Compiler.Elab.Meta.hasOutOfScopeVarArgs", "Vuna/Compiler/Elab/Meta.vuna:643"));
  ("Elab_dMeta.v_implicitBinderRig", ("Vuna.Compiler.Elab.Meta.implicitBinderRig", "Vuna/Compiler/Elab/Meta.vuna:853"));
  ("Elab_dMeta.v_inferCtorRef", ("Vuna.Compiler.Elab.Meta.inferCtorRef", "Vuna/Compiler/Elab/Meta.vuna:97"));
  ("Elab_dMeta.v_instantiateNullaryCtor", ("Vuna.Compiler.Elab.Meta.instantiateNullaryCtor", "Vuna/Compiler/Elab/Meta.vuna:46"));
  ("Elab_dMeta.v_instantiateNullaryCtorFuel", ("Vuna.Compiler.Elab.Meta.instantiateNullaryCtorFuel", "Vuna/Compiler/Elab/Meta.vuna:49"));
  ("Elab_dMeta.v_isBlanketInst", ("Vuna.Compiler.Elab.Meta.isBlanketInst", "Vuna/Compiler/Elab/Meta.vuna:784"));
  ("Elab_dMeta.v_isBlanketInstHead", ("Vuna.Compiler.Elab.Meta.isBlanketInstHead", "Vuna/Compiler/Elab/Meta.vuna:768"));
  ("Elab_dMeta.v_isBoolGlobal", ("Vuna.Compiler.Elab.Meta.isBoolGlobal", "Vuna/Compiler/Elab/Meta.vuna:1278"));
  ("Elab_dMeta.v_isBoolType", ("Vuna.Compiler.Elab.Meta.isBoolType", "Vuna/Compiler/Elab/Meta.vuna:1270"));
  ("Elab_dMeta.v_isDataFamilyName", ("Vuna.Compiler.Elab.Meta.isDataFamilyName", "Vuna/Compiler/Elab/Meta.vuna:391"));
  ("Elab_dMeta.v_isDataHead", ("Vuna.Compiler.Elab.Meta.isDataHead", "Vuna/Compiler/Elab/Meta.vuna:1253"));
  ("Elab_dMeta.v_isFamilyKindFuel", ("Vuna.Compiler.Elab.Meta.isFamilyKindFuel", "Vuna/Compiler/Elab/Meta.vuna:975"));
  ("Elab_dMeta.v_isFamilyKindValue", ("Vuna.Compiler.Elab.Meta.isFamilyKindValue", "Vuna/Compiler/Elab/Meta.vuna:972"));
  ("Elab_dMeta.v_isHandleDomain", ("Vuna.Compiler.Elab.Meta.isHandleDomain", "Vuna/Compiler/Elab/Meta.vuna:846"));
  ("Elab_dMeta.v_isImplicitDomain", ("Vuna.Compiler.Elab.Meta.isImplicitDomain", "Vuna/Compiler/Elab/Meta.vuna:815"));
  ("Elab_dMeta.v_isIndexDomain", ("Vuna.Compiler.Elab.Meta.isIndexDomain", "Vuna/Compiler/Elab/Meta.vuna:800"));
  ("Elab_dMeta.v_isKindWithCtx", ("Vuna.Compiler.Elab.Meta.isKindWithCtx", "Vuna/Compiler/Elab/Meta.vuna:884"));
  ("Elab_dMeta.v_isKindWithCtxFuel", ("Vuna.Compiler.Elab.Meta.isKindWithCtxFuel", "Vuna/Compiler/Elab/Meta.vuna:887"));
  ("Elab_dMeta.v_isLinearType", ("Vuna.Compiler.Elab.Meta.isLinearType", "Vuna/Compiler/Elab/Meta.vuna:1144"));
  ("Elab_dMeta.v_isLinearTypeFuel", ("Vuna.Compiler.Elab.Meta.isLinearTypeFuel", "Vuna/Compiler/Elab/Meta.vuna:1147"));
  ("Elab_dMeta.v_isOpaqueRuntimeTyIn", ("Vuna.Compiler.Elab.Meta.isOpaqueRuntimeTyIn", "Vuna/Compiler/Elab/Meta.vuna:1071"));
  ("Elab_dMeta.v_isSortExpr", ("Vuna.Compiler.Elab.Meta.isSortExpr", "Vuna/Compiler/Elab/Meta.vuna:1418"));
  ("Elab_dMeta.v_isSortVal", ("Vuna.Compiler.Elab.Meta.isSortVal", "Vuna/Compiler/Elab/Meta.vuna:1283"));
  ("Elab_dMeta.v_isStringImplicitDomain", ("Vuna.Compiler.Elab.Meta.isStringImplicitDomain", "Vuna/Compiler/Elab/Meta.vuna:838"));
  ("Elab_dMeta.v_isTypeDomain", ("Vuna.Compiler.Elab.Meta.isTypeDomain", "Vuna/Compiler/Elab/Meta.vuna:938"));
  ("Elab_dMeta.v_isTypeHeadOpaqueEc", ("Vuna.Compiler.Elab.Meta.isTypeHeadOpaqueEc", "Vuna/Compiler/Elab/Meta.vuna:968"));
  ("Elab_dMeta.v_isTypeLayerValue", ("Vuna.Compiler.Elab.Meta.isTypeLayerValue", "Vuna/Compiler/Elab/Meta.vuna:1240"));
  ("Elab_dMeta.v_isTypeLayerValueFuel", ("Vuna.Compiler.Elab.Meta.isTypeLayerValueFuel", "Vuna/Compiler/Elab/Meta.vuna:1243"));
  ("Elab_dMeta.v_isTypeLevelGlobal", ("Vuna.Compiler.Elab.Meta.isTypeLevelGlobal", "Vuna/Compiler/Elab/Meta.vuna:398"));
  ("Elab_dMeta.v_isTypeLikeWithCtx", ("Vuna.Compiler.Elab.Meta.isTypeLikeWithCtx", "Vuna/Compiler/Elab/Meta.vuna:900"));
  ("Elab_dMeta.v_isTypeName", ("Vuna.Compiler.Elab.Meta.isTypeName", "Vuna/Compiler/Elab/Meta.vuna:404"));
  ("Elab_dMeta.v_isTypeishValue", ("Vuna.Compiler.Elab.Meta.isTypeishValue", "Vuna/Compiler/Elab/Meta.vuna:1043"));
  ("Elab_dMeta.v_isUniverseValue", ("Vuna.Compiler.Elab.Meta.isUniverseValue", "Vuna/Compiler/Elab/Meta.vuna:984"));
  ("Elab_dMeta.v_kindDomainWellFormed", ("Vuna.Compiler.Elab.Meta.kindDomainWellFormed", "Vuna/Compiler/Elab/Meta.vuna:345"));
  ("Elab_dMeta.v_kindWellFormed", ("Vuna.Compiler.Elab.Meta.kindWellFormed", "Vuna/Compiler/Elab/Meta.vuna:338"));
  ("Elab_dMeta.v_litEqName", ("Vuna.Compiler.Elab.Meta.litEqName", "Vuna/Compiler/Elab/Meta.vuna:794"));
  ("Elab_dMeta.v_lookupDataHead", ("Vuna.Compiler.Elab.Meta.lookupDataHead", "Vuna/Compiler/Elab/Meta.vuna:677"));
  ("Elab_dMeta.v_lookupSpanPair", ("Vuna.Compiler.Elab.Meta.lookupSpanPair", "Vuna/Compiler/Elab/Meta.vuna:122"));
  ("Elab_dMeta.v_maxInt", ("Vuna.Compiler.Elab.Meta.maxInt", "Vuna/Compiler/Elab/Meta.vuna:223"));
  ("Elab_dMeta.v_memDefName", ("Vuna.Compiler.Elab.Meta.memDefName", "Vuna/Compiler/Elab/Meta.vuna:253"));
  ("Elab_dMeta.v_memLevel", ("Vuna.Compiler.Elab.Meta.memLevel", "Vuna/Compiler/Elab/Meta.vuna:1050"));
  ("Elab_dMeta.v_memMetaId", ("Vuna.Compiler.Elab.Meta.memMetaId", "Vuna/Compiler/Elab/Meta.vuna:153"));
  ("Elab_dMeta.v_memSig", ("Vuna.Compiler.Elab.Meta.memSig", "Vuna/Compiler/Elab/Meta.vuna:249"));
  ("Elab_dMeta.v_metaSpanOf", ("Vuna.Compiler.Elab.Meta.metaSpanOf", "Vuna/Compiler/Elab/Meta.vuna:117"));
  ("Elab_dMeta.v_methodArgLams", ("Vuna.Compiler.Elab.Meta.methodArgLams", "Vuna/Compiler/Elab/Meta.vuna:730"));
  ("Elab_dMeta.v_methodArgTerms", ("Vuna.Compiler.Elab.Meta.methodArgTerms", "Vuna/Compiler/Elab/Meta.vuna:720"));
  ("Elab_dMeta.v_methodArgTermsGo", ("Vuna.Compiler.Elab.Meta.methodArgTermsGo", "Vuna/Compiler/Elab/Meta.vuna:723"));
  ("Elab_dMeta.v_mkCtorTerm", ("Vuna.Compiler.Elab.Meta.mkCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:1348"));
  ("Elab_dMeta.v_neutralBinderIndexDomain", ("Vuna.Compiler.Elab.Meta.neutralBinderIndexDomain", "Vuna/Compiler/Elab/Meta.vuna:861"));
  ("Elab_dMeta.v_neutralBinderType", ("Vuna.Compiler.Elab.Meta.neutralBinderType", "Vuna/Compiler/Elab/Meta.vuna:868"));
  ("Elab_dMeta.v_neutralHeadName", ("Vuna.Compiler.Elab.Meta.neutralHeadName", "Vuna/Compiler/Elab/Meta.vuna:1274"));
  ("Elab_dMeta.v_nonEmpty", ("Vuna.Compiler.Elab.Meta.nonEmpty", "Vuna/Compiler/Elab/Meta.vuna:327"));
  ("Elab_dMeta.v_nullaryCtorTerm", ("Vuna.Compiler.Elab.Meta.nullaryCtorTerm", "Vuna/Compiler/Elab/Meta.vuna:70"));
  ("Elab_dMeta.v_nvarOpaqueCtx", ("Vuna.Compiler.Elab.Meta.nvarOpaqueCtx", "Vuna/Compiler/Elab/Meta.vuna:1055"));
  ("Elab_dMeta.v_outerScan", ("Vuna.Compiler.Elab.Meta.outerScan", "Vuna/Compiler/Elab/Meta.vuna:1208"));
  ("Elab_dMeta.v_outerScanAlts", ("Vuna.Compiler.Elab.Meta.outerScanAlts", "Vuna/Compiler/Elab/Meta.vuna:1235"));
  ("Elab_dMeta.v_outerScanArgs", ("Vuna.Compiler.Elab.Meta.outerScanArgs", "Vuna/Compiler/Elab/Meta.vuna:1230"));
  ("Elab_dMeta.v_overCandidatesText", ("Vuna.Compiler.Elab.Meta.overCandidatesText", "Vuna/Compiler/Elab/Meta.vuna:450"));
  ("Elab_dMeta.v_paramNameOf", ("Vuna.Compiler.Elab.Meta.paramNameOf", "Vuna/Compiler/Elab/Meta.vuna:715"));
  ("Elab_dMeta.v_prependFamParams", ("Vuna.Compiler.Elab.Meta.prependFamParams", "Vuna/Compiler/Elab/Meta.vuna:654"));
  ("Elab_dMeta.v_relevantMetas", ("Vuna.Compiler.Elab.Meta.relevantMetas", "Vuna/Compiler/Elab/Meta.vuna:157"));
  ("Elab_dMeta.v_resolveOverCtor", ("Vuna.Compiler.Elab.Meta.resolveOverCtor", "Vuna/Compiler/Elab/Meta.vuna:478"));
  ("Elab_dMeta.v_resolveOverCtorGo", ("Vuna.Compiler.Elab.Meta.resolveOverCtorGo", "Vuna/Compiler/Elab/Meta.vuna:489"));
  ("Elab_dMeta.v_resultSpine", ("Vuna.Compiler.Elab.Meta.resultSpine", "Vuna/Compiler/Elab/Meta.vuna:561"));
  ("Elab_dMeta.v_rigCaseField", ("Vuna.Compiler.Elab.Meta.rigCaseField", "Vuna/Compiler/Elab/Meta.vuna:1187"));
  ("Elab_dMeta.v_rigForLinearDomain", ("Vuna.Compiler.Elab.Meta.rigForLinearDomain", "Vuna/Compiler/Elab/Meta.vuna:1177"));
  ("Elab_dMeta.v_rigOfLinearValue", ("Vuna.Compiler.Elab.Meta.rigOfLinearValue", "Vuna/Compiler/Elab/Meta.vuna:1191"));
  ("Elab_dMeta.v_rigOfQty", ("Vuna.Compiler.Elab.Meta.rigOfQty", "Vuna/Compiler/Elab/Meta.vuna:945"));
  ("Elab_dMeta.v_shiftCtorArgs", ("Vuna.Compiler.Elab.Meta.shiftCtorArgs", "Vuna/Compiler/Elab/Meta.vuna:1371"));
  ("Elab_dMeta.v_spineOfType", ("Vuna.Compiler.Elab.Meta.spineOfType", "Vuna/Compiler/Elab/Meta.vuna:553"));
  ("Elab_dMeta.v_splitKind", ("Vuna.Compiler.Elab.Meta.splitKind", "Vuna/Compiler/Elab/Meta.vuna:351"));
  ("Elab_dMeta.v_substClassParam", ("Vuna.Compiler.Elab.Meta.substClassParam", "Vuna/Compiler/Elab/Meta.vuna:790"));
  ("Elab_dMeta.v_teleOf", ("Vuna.Compiler.Elab.Meta.teleOf", "Vuna/Compiler/Elab/Meta.vuna:545"));
  ("Elab_dMeta.v_teleOfType", ("Vuna.Compiler.Elab.Meta.teleOfType", "Vuna/Compiler/Elab/Meta.vuna:542"));
  ("Elab_dMeta.v_termHasOuterLinear", ("Vuna.Compiler.Elab.Meta.termHasOuterLinear", "Vuna/Compiler/Elab/Meta.vuna:1205"));
  ("Elab_dMeta.v_termMetasAll", ("Vuna.Compiler.Elab.Meta.termMetasAll", "Vuna/Compiler/Elab/Meta.vuna:192"));
  ("Elab_dMeta.v_termMetasAllMaybe", ("Vuna.Compiler.Elab.Meta.termMetasAllMaybe", "Vuna/Compiler/Elab/Meta.vuna:219"));
  ("Elab_dMeta.v_termMetasRuntime", ("Vuna.Compiler.Elab.Meta.termMetasRuntime", "Vuna/Compiler/Elab/Meta.vuna:164"));
  ("Elab_dMeta.v_typeHeadLookup", ("Vuna.Compiler.Elab.Meta.typeHeadLookup", "Vuna/Compiler/Elab/Meta.vuna:514"));
  ("Elab_dMeta.v_typeLookup", ("Vuna.Compiler.Elab.Meta.typeLookup", "Vuna/Compiler/Elab/Meta.vuna:521"));
  ("Elab_dMeta.v_typeNameOfDualCtor", ("Vuna.Compiler.Elab.Meta.typeNameOfDualCtor", "Vuna/Compiler/Elab/Meta.vuna:415"));
  ("Elab_dMeta.v_unsolvedFrom", ("Vuna.Compiler.Elab.Meta.unsolvedFrom", "Vuna/Compiler/Elab/Meta.vuna:139"));
  ("Elab_dMeta.v_unsolvedFromGo", ("Vuna.Compiler.Elab.Meta.unsolvedFromGo", "Vuna/Compiler/Elab/Meta.vuna:142"));
  ("Elab_dMeta.v_valueHasImplicitPi", ("Vuna.Compiler.Elab.Meta.valueHasImplicitPi", "Vuna/Compiler/Elab/Meta.vuna:998"));
  ("Elab_dMeta.v_valueHasImplicitPiFuel", ("Vuna.Compiler.Elab.Meta.valueHasImplicitPiFuel", "Vuna/Compiler/Elab/Meta.vuna:1001"));
  ("Elab_dMeta.v_valueLookup", ("Vuna.Compiler.Elab.Meta.valueLookup", "Vuna/Compiler/Elab/Meta.vuna:531"));
  ("Elab_dMeta.v_valueOpaqueGo", ("Vuna.Compiler.Elab.Meta.valueOpaqueGo", "Vuna/Compiler/Elab/Meta.vuna:1010"));
  ("Elab_dMeta.v_valueOpaqueScoped", ("Vuna.Compiler.Elab.Meta.valueOpaqueScoped", "Vuna/Compiler/Elab/Meta.vuna:992"));
  ("Elab_dMeta.v_valueOpaqueTypeSpine", ("Vuna.Compiler.Elab.Meta.valueOpaqueTypeSpine", "Vuna/Compiler/Elab/Meta.vuna:1032"));
  ("Elab_dMeta.v_wrapOpaqueAltFuel", ("Vuna.Compiler.Elab.Meta.wrapOpaqueAltFuel", "Vuna/Compiler/Elab/Meta.vuna:1139"));
  ("Elab_dMeta.v_wrapOpaqueUses", ("Vuna.Compiler.Elab.Meta.wrapOpaqueUses", "Vuna/Compiler/Elab/Meta.vuna:1086"));
  ("Elab_dMeta.v_wrapOpaqueUsesFuel", ("Vuna.Compiler.Elab.Meta.wrapOpaqueUsesFuel", "Vuna/Compiler/Elab/Meta.vuna:1089"));
  ("Elab_dMeta.v_wrapOpaqueVar", ("Vuna.Compiler.Elab.Meta.wrapOpaqueVar", "Vuna/Compiler/Elab/Meta.vuna:1130"));
  ("Elab_dMeta.v_zipTeleRigs", ("Vuna.Compiler.Elab.Meta.zipTeleRigs", "Vuna/Compiler/Elab/Meta.vuna:77"));
  ("Elab_dMeta.v_zonkAltFuel", ("Vuna.Compiler.Elab.Meta.zonkAltFuel", "Vuna/Compiler/Elab/Meta.vuna:629"));
  ("Elab_dMeta.v_zonkFuelMax", ("Vuna.Compiler.Elab.Meta.zonkFuelMax", "Vuna/Compiler/Elab/Meta.vuna:586"));
  ("Elab_dMeta.v_zonkTerm", ("Vuna.Compiler.Elab.Meta.zonkTerm", "Vuna/Compiler/Elab/Meta.vuna:578"));
  ("Elab_dMeta.v_zonkTermFuel", ("Vuna.Compiler.Elab.Meta.zonkTermFuel", "Vuna/Compiler/Elab/Meta.vuna:589"));
  ("Elab_dMeta.v_zonkValueOnly", ("Vuna.Compiler.Elab.Meta.zonkValueOnly", "Vuna/Compiler/Elab/Meta.vuna:1068"));
  ("Elab_dMetaSpans.v_lookupMeta", ("Vuna.Compiler.Elab.MetaSpans.lookupMeta", "Vuna/Compiler/Elab/MetaSpans.vuna:29"));
  ("Elab_dMetaSpans.v_metaSpanOf", ("Vuna.Compiler.Elab.MetaSpans.metaSpanOf", "Vuna/Compiler/Elab/MetaSpans.vuna:25"));
  ("Elab_dMetaSpans.v_newHoleMeta", ("Vuna.Compiler.Elab.MetaSpans.newHoleMeta", "Vuna/Compiler/Elab/MetaSpans.vuna:42"));
  ("Elab_dMetaSpans.v_newMetaAt", ("Vuna.Compiler.Elab.MetaSpans.newMetaAt", "Vuna/Compiler/Elab/MetaSpans.vuna:34"));
  ("Elab_dMetaSpans.v_recordMetaSpan", ("Vuna.Compiler.Elab.MetaSpans.recordMetaSpan", "Vuna/Compiler/Elab/MetaSpans.vuna:21"));
  ("Elab_dMut.v_duplicateKeysGo", ("Vuna.Compiler.Elab.Mut.duplicateKeysGo", "Vuna/Compiler/Elab/Mut.vuna:395"));
  ("Elab_dMut.v_memKey", ("Vuna.Compiler.Elab.Mut.memKey", "Vuna/Compiler/Elab/Mut.vuna:400"));
  ("Elab_dMut.v_mutAddHandleParams", ("Vuna.Compiler.Elab.Mut.mutAddHandleParams", "Vuna/Compiler/Elab/Mut.vuna:357"));
  ("Elab_dMut.v_mutAddHandleParamsTyped", ("Vuna.Compiler.Elab.Mut.mutAddHandleParamsTyped", "Vuna/Compiler/Elab/Mut.vuna:373"));
  ("Elab_dMut.v_mutBinderName", ("Vuna.Compiler.Elab.Mut.mutBinderName", "Vuna/Compiler/Elab/Mut.vuna:168"));
  ("Elab_dMut.v_mutBinderOf", ("Vuna.Compiler.Elab.Mut.mutBinderOf", "Vuna/Compiler/Elab/Mut.vuna:172"));
  ("Elab_dMut.v_mutBinderOfGo", ("Vuna.Compiler.Elab.Mut.mutBinderOfGo", "Vuna/Compiler/Elab/Mut.vuna:175"));
  ("Elab_dMut.v_mutDuplicateRowKeys", ("Vuna.Compiler.Elab.Mut.mutDuplicateRowKeys", "Vuna/Compiler/Elab/Mut.vuna:388"));
  ("Elab_dMut.v_mutEntryOf", ("Vuna.Compiler.Elab.Mut.mutEntryOf", "Vuna/Compiler/Elab/Mut.vuna:249"));
  ("Elab_dMut.v_mutFamilies", ("Vuna.Compiler.Elab.Mut.mutFamilies", "Vuna/Compiler/Elab/Mut.vuna:54"));
  ("Elab_dMut.v_mutFamilyOfOpFamily", ("Vuna.Compiler.Elab.Mut.mutFamilyOfOpFamily", "Vuna/Compiler/Elab/Mut.vuna:156"));
  ("Elab_dMut.v_mutFamilyOfOpFamilyGo", ("Vuna.Compiler.Elab.Mut.mutFamilyOfOpFamilyGo", "Vuna/Compiler/Elab/Mut.vuna:159"));
  ("Elab_dMut.v_mutHandleParamsDedupe", ("Vuna.Compiler.Elab.Mut.mutHandleParamsDedupe", "Vuna/Compiler/Elab/Mut.vuna:325"));
  ("Elab_dMut.v_mutHandleParamsGo", ("Vuna.Compiler.Elab.Mut.mutHandleParamsGo", "Vuna/Compiler/Elab/Mut.vuna:274"));
  ("Elab_dMut.v_mutHandleParamsOf", ("Vuna.Compiler.Elab.Mut.mutHandleParamsOf", "Vuna/Compiler/Elab/Mut.vuna:268"));
  ("Elab_dMut.v_mutHasHandleBinder", ("Vuna.Compiler.Elab.Mut.mutHasHandleBinder", "Vuna/Compiler/Elab/Mut.vuna:333"));
  ("Elab_dMut.v_mutHeadArgs", ("Vuna.Compiler.Elab.Mut.mutHeadArgs", "Vuna/Compiler/Elab/Mut.vuna:199"));
  ("Elab_dMut.v_mutHeadArgsGo", ("Vuna.Compiler.Elab.Mut.mutHeadArgsGo", "Vuna/Compiler/Elab/Mut.vuna:202"));
  ("Elab_dMut.v_mutIntroExpr", ("Vuna.Compiler.Elab.Mut.mutIntroExpr", "Vuna/Compiler/Elab/Mut.vuna:417"));
  ("Elab_dMut.v_mutIntroOf", ("Vuna.Compiler.Elab.Mut.mutIntroOf", "Vuna/Compiler/Elab/Mut.vuna:145"));
  ("Elab_dMut.v_mutIntroOfFamilies", ("Vuna.Compiler.Elab.Mut.mutIntroOfFamilies", "Vuna/Compiler/Elab/Mut.vuna:148"));
  ("Elab_dMut.v_mutMemberHandleParamOf", ("Vuna.Compiler.Elab.Mut.mutMemberHandleParamOf", "Vuna/Compiler/Elab/Mut.vuna:307"));
  ("Elab_dMut.v_mutMemberHandleParams", ("Vuna.Compiler.Elab.Mut.mutMemberHandleParams", "Vuna/Compiler/Elab/Mut.vuna:298"));
  ("Elab_dMut.v_mutOpExpr", ("Vuna.Compiler.Elab.Mut.mutOpExpr", "Vuna/Compiler/Elab/Mut.vuna:408"));
  ("Elab_dMut.v_mutOpInFamOf", ("Vuna.Compiler.Elab.Mut.mutOpInFamOf", "Vuna/Compiler/Elab/Mut.vuna:140"));
  ("Elab_dMut.v_mutOpOf", ("Vuna.Compiler.Elab.Mut.mutOpOf", "Vuna/Compiler/Elab/Mut.vuna:130"));
  ("Elab_dMut.v_mutOpOfFamilies", ("Vuna.Compiler.Elab.Mut.mutOpOfFamilies", "Vuna/Compiler/Elab/Mut.vuna:133"));
  ("Elab_dMut.v_mutPiCount", ("Vuna.Compiler.Elab.Mut.mutPiCount", "Vuna/Compiler/Elab/Mut.vuna:369"));
  ("Elab_dMut.v_mutRowEntriesGo", ("Vuna.Compiler.Elab.Mut.mutRowEntriesGo", "Vuna/Compiler/Elab/Mut.vuna:231"));
  ("Elab_dMut.v_mutRowEntriesOfTy", ("Vuna.Compiler.Elab.Mut.mutRowEntriesOfTy", "Vuna/Compiler/Elab/Mut.vuna:210"));
  ("Elab_dMut.v_mutRowEntriesOfTyGo", ("Vuna.Compiler.Elab.Mut.mutRowEntriesOfTyGo", "Vuna/Compiler/Elab/Mut.vuna:213"));
  ("Elab_dMut.v_mutRowEntryHandle", ("Vuna.Compiler.Elab.Mut.mutRowEntryHandle", "Vuna/Compiler/Elab/Mut.vuna:282"));
  ("Elab_dMut.v_mutSuffixBinderCount", ("Vuna.Compiler.Elab.Mut.mutSuffixBinderCount", "Vuna/Compiler/Elab/Mut.vuna:365"));
  ("Elab_dMut.v_mutWrapHandleParams", ("Vuna.Compiler.Elab.Mut.mutWrapHandleParams", "Vuna/Compiler/Elab/Mut.vuna:379"));
  ("Elab_dMut.v_nthTerm", ("Vuna.Compiler.Elab.Mut.nthTerm", "Vuna/Compiler/Elab/Mut.vuna:338"));
  ("Elab_dMut.v_rowKeys", ("Vuna.Compiler.Elab.Mut.rowKeys", "Vuna/Compiler/Elab/Mut.vuna:391"));
  ("Elab_dMut.v_stringLitOf", ("Vuna.Compiler.Elab.Mut.stringLitOf", "Vuna/Compiler/Elab/Mut.vuna:435"));
  ("Elab_dMut.v_stripPrefixString", ("Vuna.Compiler.Elab.Mut.stripPrefixString", "Vuna/Compiler/Elab/Mut.vuna:182"));
  ("Elab_dPrelude.v_baseNameOf", ("Vuna.Compiler.Elab.Prelude.baseNameOf", "Vuna/Compiler/Elab/Prelude.vuna:185"));
  ("Elab_dPrelude.v_boolTy", ("Vuna.Compiler.Elab.Prelude.boolTy", "Vuna/Compiler/Elab/Prelude.vuna:33"));
  ("Elab_dPrelude.v_boolTyValue", ("Vuna.Compiler.Elab.Prelude.boolTyValue", "Vuna/Compiler/Elab/Prelude.vuna:37"));
  ("Elab_dPrelude.v_builtinEqTyName", ("Vuna.Compiler.Elab.Prelude.builtinEqTyName", "Vuna/Compiler/Elab/Prelude.vuna:156"));
  ("Elab_dPrelude.v_builtinTyName", ("Vuna.Compiler.Elab.Prelude.builtinTyName", "Vuna/Compiler/Elab/Prelude.vuna:50"));
  ("Elab_dPrelude.v_classMethodProjection", ("Vuna.Compiler.Elab.Prelude.classMethodProjection", "Vuna/Compiler/Elab/Prelude.vuna:189"));
  ("Elab_dPrelude.v_classMethodProjectionGo", ("Vuna.Compiler.Elab.Prelude.classMethodProjectionGo", "Vuna/Compiler/Elab/Prelude.vuna:192"));
  ("Elab_dPrelude.v_cmpBuiltinTyName", ("Vuna.Compiler.Elab.Prelude.cmpBuiltinTyName", "Vuna/Compiler/Elab/Prelude.vuna:169"));
  ("Elab_dPrelude.v_eqRuntimeName", ("Vuna.Compiler.Elab.Prelude.eqRuntimeName", "Vuna/Compiler/Elab/Prelude.vuna:65"));
  ("Elab_dPrelude.v_floatTy", ("Vuna.Compiler.Elab.Prelude.floatTy", "Vuna/Compiler/Elab/Prelude.vuna:29"));
  ("Elab_dPrelude.v_fun2", ("Vuna.Compiler.Elab.Prelude.fun2", "Vuna/Compiler/Elab/Prelude.vuna:41"));
  ("Elab_dPrelude.v_indexOfName", ("Vuna.Compiler.Elab.Prelude.indexOfName", "Vuna/Compiler/Elab/Prelude.vuna:80"));
  ("Elab_dPrelude.v_indexOfNameGo", ("Vuna.Compiler.Elab.Prelude.indexOfNameGo", "Vuna/Compiler/Elab/Prelude.vuna:76"));
  ("Elab_dPrelude.v_intTy", ("Vuna.Compiler.Elab.Prelude.intTy", "Vuna/Compiler/Elab/Prelude.vuna:22"));
  ("Elab_dPrelude.v_internalValueGlobals", ("Vuna.Compiler.Elab.Prelude.internalValueGlobals", "Vuna/Compiler/Elab/Prelude.vuna:143"));
  ("Elab_dPrelude.v_isEqShort", ("Vuna.Compiler.Elab.Prelude.isEqShort", "Vuna/Compiler/Elab/Prelude.vuna:60"));
  ("Elab_dPrelude.v_ityToTerm", ("Vuna.Compiler.Elab.Prelude.ityToTerm", "Vuna/Compiler/Elab/Prelude.vuna:83"));
  ("Elab_dPrelude.v_ityToTermEnv", ("Vuna.Compiler.Elab.Prelude.ityToTermEnv", "Vuna/Compiler/Elab/Prelude.vuna:86"));
  ("Elab_dPrelude.v_preludeGlobals", ("Vuna.Compiler.Elab.Prelude.preludeGlobals", "Vuna/Compiler/Elab/Prelude.vuna:147"));
  ("Elab_dPrelude.v_preludeNames", ("Vuna.Compiler.Elab.Prelude.preludeNames", "Vuna/Compiler/Elab/Prelude.vuna:152"));
  ("Elab_dPrelude.v_preludeTypeGlobals", ("Vuna.Compiler.Elab.Prelude.preludeTypeGlobals", "Vuna/Compiler/Elab/Prelude.vuna:132"));
  ("Elab_dPrelude.v_preludeValueGlobals", ("Vuna.Compiler.Elab.Prelude.preludeValueGlobals", "Vuna/Compiler/Elab/Prelude.vuna:138"));
  ("Elab_dPrelude.v_prependParams", ("Vuna.Compiler.Elab.Prelude.prependParams", "Vuna/Compiler/Elab/Prelude.vuna:177"));
  ("Elab_dPrelude.v_strTy", ("Vuna.Compiler.Elab.Prelude.strTy", "Vuna/Compiler/Elab/Prelude.vuna:25"));
  ("Elab_dPrelude.v_typeCtorKindTerm", ("Vuna.Compiler.Elab.Prelude.typeCtorKindTerm", "Vuna/Compiler/Elab/Prelude.vuna:124"));
  ("Elab_dRecords.v_ctorName", ("Vuna.Compiler.Elab.Records.ctorName", "Vuna/Compiler/Elab/Records.vuna:359"));
  ("Elab_dRecords.v_desugarAltFuel", ("Vuna.Compiler.Elab.Records.desugarAltFuel", "Vuna/Compiler/Elab/Records.vuna:270"));
  ("Elab_dRecords.v_desugarBindFuel", ("Vuna.Compiler.Elab.Records.desugarBindFuel", "Vuna/Compiler/Elab/Records.vuna:251"));
  ("Elab_dRecords.v_desugarDoStmtFuel", ("Vuna.Compiler.Elab.Records.desugarDoStmtFuel", "Vuna/Compiler/Elab/Records.vuna:223"));
  ("Elab_dRecords.v_desugarExpr", ("Vuna.Compiler.Elab.Records.desugarExpr", "Vuna/Compiler/Elab/Records.vuna:362"));
  ("Elab_dRecords.v_desugarExprFuel", ("Vuna.Compiler.Elab.Records.desugarExprFuel", "Vuna/Compiler/Elab/Records.vuna:192"));
  ("Elab_dRecords.v_desugarFieldValueFuel", ("Vuna.Compiler.Elab.Records.desugarFieldValueFuel", "Vuna/Compiler/Elab/Records.vuna:244"));
  ("Elab_dRecords.v_desugarLocalClauseFuel", ("Vuna.Compiler.Elab.Records.desugarLocalClauseFuel", "Vuna/Compiler/Elab/Records.vuna:261"));
  ("Elab_dRecords.v_desugarPattern", ("Vuna.Compiler.Elab.Records.desugarPattern", "Vuna/Compiler/Elab/Records.vuna:160"));
  ("Elab_dRecords.v_desugarPatternFuel", ("Vuna.Compiler.Elab.Records.desugarPatternFuel", "Vuna/Compiler/Elab/Records.vuna:163"));
  ("Elab_dRecords.v_desugarRecordDecl", ("Vuna.Compiler.Elab.Records.desugarRecordDecl", "Vuna/Compiler/Elab/Records.vuna:140"));
  ("Elab_dRecords.v_desugarRecordPatternFieldsFuel", ("Vuna.Compiler.Elab.Records.desugarRecordPatternFieldsFuel", "Vuna/Compiler/Elab/Records.vuna:180"));
  ("Elab_dRecords.v_desugarRecordValuesFuel", ("Vuna.Compiler.Elab.Records.desugarRecordValuesFuel", "Vuna/Compiler/Elab/Records.vuna:233"));
  ("Elab_dRecords.v_desugarRecords", ("Vuna.Compiler.Elab.Records.desugarRecords", "Vuna/Compiler/Elab/Records.vuna:137"));
  ("Elab_dRecords.v_duplicateFieldMsg", ("Vuna.Compiler.Elab.Records.duplicateFieldMsg", "Vuna/Compiler/Elab/Records.vuna:76"));
  ("Elab_dRecords.v_expandCaseAs", ("Vuna.Compiler.Elab.Records.expandCaseAs", "Vuna/Compiler/Elab/Records.vuna:367"));
  ("Elab_dRecords.v_expandCaseAsGo", ("Vuna.Compiler.Elab.Records.expandCaseAsGo", "Vuna/Compiler/Elab/Records.vuna:370"));
  ("Elab_dRecords.v_fieldNamesOf", ("Vuna.Compiler.Elab.Records.fieldNamesOf", "Vuna/Compiler/Elab/Records.vuna:55"));
  ("Elab_dRecords.v_firstUnknownFieldMsg", ("Vuna.Compiler.Elab.Records.firstUnknownFieldMsg", "Vuna/Compiler/Elab/Records.vuna:84"));
  ("Elab_dRecords.v_hasDuplicateFieldNames", ("Vuna.Compiler.Elab.Records.hasDuplicateFieldNames", "Vuna/Compiler/Elab/Records.vuna:63"));
  ("Elab_dRecords.v_hasFieldInstanceDecl", ("Vuna.Compiler.Elab.Records.hasFieldInstanceDecl", "Vuna/Compiler/Elab/Records.vuna:321"));
  ("Elab_dRecords.v_hasUnknownFields", ("Vuna.Compiler.Elab.Records.hasUnknownFields", "Vuna/Compiler/Elab/Records.vuna:79"));
  ("Elab_dRecords.v_lookupProvided", ("Vuna.Compiler.Elab.Records.lookupProvided", "Vuna/Compiler/Elab/Records.vuna:59"));
  ("Elab_dRecords.v_lookupRecord", ("Vuna.Compiler.Elab.Records.lookupRecord", "Vuna/Compiler/Elab/Records.vuna:51"));
  ("Elab_dRecords.v_missingFieldMsg", ("Vuna.Compiler.Elab.Records.missingFieldMsg", "Vuna/Compiler/Elab/Records.vuna:70"));
  ("Elab_dRecords.v_prepareDecls", ("Vuna.Compiler.Elab.Records.prepareDecls", "Vuna/Compiler/Elab/Records.vuna:344"));
  ("Elab_dRecords.v_prepareDeclsWith", ("Vuna.Compiler.Elab.Records.prepareDeclsWith", "Vuna/Compiler/Elab/Records.vuna:349"));
  ("Elab_dRecords.v_recordArrowType", ("Vuna.Compiler.Elab.Records.recordArrowType", "Vuna/Compiler/Elab/Records.vuna:117"));
  ("Elab_dRecords.v_recordArrowTypeGo", ("Vuna.Compiler.Elab.Records.recordArrowTypeGo", "Vuna/Compiler/Elab/Records.vuna:120"));
  ("Elab_dRecords.v_recordCtorType", ("Vuna.Compiler.Elab.Records.recordCtorType", "Vuna/Compiler/Elab/Records.vuna:133"));
  ("Elab_dRecords.v_recordFieldNames", ("Vuna.Compiler.Elab.Records.recordFieldNames", "Vuna/Compiler/Elab/Records.vuna:46"));
  ("Elab_dRecords.v_recordFieldPairs", ("Vuna.Compiler.Elab.Records.recordFieldPairs", "Vuna/Compiler/Elab/Records.vuna:41"));
  ("Elab_dRecords.v_recordFieldsOf", ("Vuna.Compiler.Elab.Records.recordFieldsOf", "Vuna/Compiler/Elab/Records.vuna:100"));
  ("Elab_dRecords.v_recordHasFieldInstances", ("Vuna.Compiler.Elab.Records.recordHasFieldInstances", "Vuna/Compiler/Elab/Records.vuna:281"));
  ("Elab_dRecords.v_recordHasFieldInstancesGo", ("Vuna.Compiler.Elab.Records.recordHasFieldInstancesGo", "Vuna/Compiler/Elab/Records.vuna:298"));
  ("Elab_dRecords.v_recordHasFieldInstancesOf", ("Vuna.Compiler.Elab.Records.recordHasFieldInstancesOf", "Vuna/Compiler/Elab/Records.vuna:287"));
  ("Elab_dRecords.v_recordInstancePats", ("Vuna.Compiler.Elab.Records.recordInstancePats", "Vuna/Compiler/Elab/Records.vuna:309"));
  ("Elab_dRecords.v_recordInstancePatsFrom", ("Vuna.Compiler.Elab.Records.recordInstancePatsFrom", "Vuna/Compiler/Elab/Records.vuna:313"));
  ("Elab_dRecords.v_recordInstanceVar", ("Vuna.Compiler.Elab.Records.recordInstanceVar", "Vuna/Compiler/Elab/Records.vuna:305"));
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
  ("Elab_dSig.v_argParamKinds", ("Vuna.Compiler.Elab.Sig.argParamKinds", "Vuna/Compiler/Elab/Sig.vuna:227"));
  ("Elab_dSig.v_argParamKindsIn", ("Vuna.Compiler.Elab.Sig.argParamKindsIn", "Vuna/Compiler/Elab/Sig.vuna:224"));
  ("Elab_dSig.v_arityFun", ("Vuna.Compiler.Elab.Sig.arityFun", "Vuna/Compiler/Elab/Sig.vuna:26"));
  ("Elab_dSig.v_bannedForModule", ("Vuna.Compiler.Elab.Sig.bannedForModule", "Vuna/Compiler/Elab/Sig.vuna:269"));
  ("Elab_dSig.v_classParamKind", ("Vuna.Compiler.Elab.Sig.classParamKind", "Vuna/Compiler/Elab/Sig.vuna:23"));
  ("Elab_dSig.v_classParamKindOf", ("Vuna.Compiler.Elab.Sig.classParamKindOf", "Vuna/Compiler/Elab/Sig.vuna:20"));
  ("Elab_dSig.v_dataParamKindTbl", ("Vuna.Compiler.Elab.Sig.dataParamKindTbl", "Vuna/Compiler/Elab/Sig.vuna:199"));
  ("Elab_dSig.v_definedNames", ("Vuna.Compiler.Elab.Sig.definedNames", "Vuna/Compiler/Elab/Sig.vuna:371"));
  ("Elab_dSig.v_dropName", ("Vuna.Compiler.Elab.Sig.dropName", "Vuna/Compiler/Elab/Sig.vuna:186"));
  ("Elab_dSig.v_dropPiBound", ("Vuna.Compiler.Elab.Sig.dropPiBound", "Vuna/Compiler/Elab/Sig.vuna:182"));
  ("Elab_dSig.v_exprLowerVars", ("Vuna.Compiler.Elab.Sig.exprLowerVars", "Vuna/Compiler/Elab/Sig.vuna:161"));
  ("Elab_dSig.v_exprMaxAppArity", ("Vuna.Compiler.Elab.Sig.exprMaxAppArity", "Vuna/Compiler/Elab/Sig.vuna:41"));
  ("Elab_dSig.v_exprMaxAppArityIn", ("Vuna.Compiler.Elab.Sig.exprMaxAppArityIn", "Vuna/Compiler/Elab/Sig.vuna:38"));
  ("Elab_dSig.v_filterNamesInModule", ("Vuna.Compiler.Elab.Sig.filterNamesInModule", "Vuna/Compiler/Elab/Sig.vuna:272"));
  ("Elab_dSig.v_freeNames", ("Vuna.Compiler.Elab.Sig.freeNames", "Vuna/Compiler/Elab/Sig.vuna:86"));
  ("Elab_dSig.v_isLowerIdent", ("Vuna.Compiler.Elab.Sig.isLowerIdent", "Vuna/Compiler/Elab/Sig.vuna:176"));
  ("Elab_dSig.v_keepOut", ("Vuna.Compiler.Elab.Sig.keepOut", "Vuna/Compiler/Elab/Sig.vuna:89"));
  ("Elab_dSig.v_keepOutQualified", ("Vuna.Compiler.Elab.Sig.keepOutQualified", "Vuna/Compiler/Elab/Sig.vuna:352"));
  ("Elab_dSig.v_keepOutTbl", ("Vuna.Compiler.Elab.Sig.keepOutTbl", "Vuna/Compiler/Elab/Sig.vuna:362"));
  ("Elab_dSig.v_kindArrowExpr", ("Vuna.Compiler.Elab.Sig.kindArrowExpr", "Vuna/Compiler/Elab/Sig.vuna:147"));
  ("Elab_dSig.v_kindDomains", ("Vuna.Compiler.Elab.Sig.kindDomains", "Vuna/Compiler/Elab/Sig.vuna:209"));
  ("Elab_dSig.v_kindOverrideOf", ("Vuna.Compiler.Elab.Sig.kindOverrideOf", "Vuna/Compiler/Elab/Sig.vuna:342"));
  ("Elab_dSig.v_lookupParamKinds", ("Vuna.Compiler.Elab.Sig.lookupParamKinds", "Vuna/Compiler/Elab/Sig.vuna:246"));
  ("Elab_dSig.v_lowerVarNames", ("Vuna.Compiler.Elab.Sig.lowerVarNames", "Vuna/Compiler/Elab/Sig.vuna:158"));
  ("Elab_dSig.v_maxIntList", ("Vuna.Compiler.Elab.Sig.maxIntList", "Vuna/Compiler/Elab/Sig.vuna:33"));
  ("Elab_dSig.v_memberDomainOf", ("Vuna.Compiler.Elab.Sig.memberDomainOf", "Vuna/Compiler/Elab/Sig.vuna:143"));
  ("Elab_dSig.v_memberDomainOverrides", ("Vuna.Compiler.Elab.Sig.memberDomainOverrides", "Vuna/Compiler/Elab/Sig.vuna:122"));
  ("Elab_dSig.v_memberDomainOverridesOne", ("Vuna.Compiler.Elab.Sig.memberDomainOverridesOne", "Vuna/Compiler/Elab/Sig.vuna:126"));
  ("Elab_dSig.v_methodArgRigsOf", ("Vuna.Compiler.Elab.Sig.methodArgRigsOf", "Vuna/Compiler/Elab/Sig.vuna:66"));
  ("Elab_dSig.v_methodArgRigsOfGo", ("Vuna.Compiler.Elab.Sig.methodArgRigsOfGo", "Vuna/Compiler/Elab/Sig.vuna:69"));
  ("Elab_dSig.v_methodMaxAppArity", ("Vuna.Compiler.Elab.Sig.methodMaxAppArity", "Vuna/Compiler/Elab/Sig.vuna:29"));
  ("Elab_dSig.v_modulePrefixOf", ("Vuna.Compiler.Elab.Sig.modulePrefixOf", "Vuna/Compiler/Elab/Sig.vuna:281"));
  ("Elab_dSig.v_paramKindOf", ("Vuna.Compiler.Elab.Sig.paramKindOf", "Vuna/Compiler/Elab/Sig.vuna:348"));
  ("Elab_dSig.v_piBoundNames", ("Vuna.Compiler.Elab.Sig.piBoundNames", "Vuna/Compiler/Elab/Sig.vuna:154"));
  ("Elab_dSig.v_qualifiedBannedTbl", ("Vuna.Compiler.Elab.Sig.qualifiedBannedTbl", "Vuna/Compiler/Elab/Sig.vuna:295"));
  ("Elab_dSig.v_qualifiedKey", ("Vuna.Compiler.Elab.Sig.qualifiedKey", "Vuna/Compiler/Elab/Sig.vuna:301"));
  ("Elab_dSig.v_quantify", ("Vuna.Compiler.Elab.Sig.quantify", "Vuna/Compiler/Elab/Sig.vuna:93"));
  ("Elab_dSig.v_quantifyTopKinds", ("Vuna.Compiler.Elab.Sig.quantifyTopKinds", "Vuna/Compiler/Elab/Sig.vuna:102"));
  ("Elab_dSig.v_quantifyTopKindsWith", ("Vuna.Compiler.Elab.Sig.quantifyTopKindsWith", "Vuna/Compiler/Elab/Sig.vuna:110"));
  ("Elab_dSig.v_quantifyTopSig", ("Vuna.Compiler.Elab.Sig.quantifyTopSig", "Vuna/Compiler/Elab/Sig.vuna:192"));
  ("Elab_dSig.v_quantifyTopSigCached", ("Vuna.Compiler.Elab.Sig.quantifyTopSigCached", "Vuna/Compiler/Elab/Sig.vuna:305"));
  ("Elab_dSig.v_quantifyTopSigCtxCached", ("Vuna.Compiler.Elab.Sig.quantifyTopSigCtxCached", "Vuna/Compiler/Elab/Sig.vuna:316"));
  ("Elab_dSig.v_quantifyTopSigCtxCachedKinds", ("Vuna.Compiler.Elab.Sig.quantifyTopSigCtxCachedKinds", "Vuna/Compiler/Elab/Sig.vuna:331"));
  ("Elab_dSig.v_quantifyTraitSig", ("Vuna.Compiler.Elab.Sig.quantifyTraitSig", "Vuna/Compiler/Elab/Sig.vuna:83"));
  ("Elab_dSig.v_topPreludeNames", ("Vuna.Compiler.Elab.Sig.topPreludeNames", "Vuna/Compiler/Elab/Sig.vuna:367"));
  ("Elab_dSig.v_topQuantBanned", ("Vuna.Compiler.Elab.Sig.topQuantBanned", "Vuna/Compiler/Elab/Sig.vuna:263"));
  ("Elab_dSig.v_zipArgKinds", ("Vuna.Compiler.Elab.Sig.zipArgKinds", "Vuna/Compiler/Elab/Sig.vuna:250"));
  ("Elab_dSig.v_zipArgKindsGo", ("Vuna.Compiler.Elab.Sig.zipArgKindsGo", "Vuna/Compiler/Elab/Sig.vuna:254"));
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
  ("Elab_dTerm_dImpl.v_anyFieldHasOverCtor", ("Vuna.Compiler.Elab.Term.Impl.anyFieldHasOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:2334"));
  ("Elab_dTerm_dImpl.v_anyPatHasOverCtor", ("Vuna.Compiler.Elab.Term.Impl.anyPatHasOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:2329"));
  ("Elab_dTerm_dImpl.v_appAtCallExpr", ("Vuna.Compiler.Elab.Term.Impl.appAtCallExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:553"));
  ("Elab_dTerm_dImpl.v_appAtOperand", ("Vuna.Compiler.Elab.Term.Impl.appAtOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:547"));
  ("Elab_dTerm_dImpl.v_appAtParts", ("Vuna.Compiler.Elab.Term.Impl.appAtParts", "Vuna/Compiler/Elab/Term/Impl.vuna:1481"));
  ("Elab_dTerm_dImpl.v_applyExtra", ("Vuna.Compiler.Elab.Term.Impl.applyExtra", "Vuna/Compiler/Elab/Term/Impl.vuna:1497"));
  ("Elab_dTerm_dImpl.v_arithFloatName", ("Vuna.Compiler.Elab.Term.Impl.arithFloatName", "Vuna/Compiler/Elab/Term/Impl.vuna:1900"));
  ("Elab_dTerm_dImpl.v_arithNatName", ("Vuna.Compiler.Elab.Term.Impl.arithNatName", "Vuna/Compiler/Elab/Term/Impl.vuna:1882"));
  ("Elab_dTerm_dImpl.v_arithOpNameOf", ("Vuna.Compiler.Elab.Term.Impl.arithOpNameOf", "Vuna/Compiler/Elab/Term/Impl.vuna:1875"));
  ("Elab_dTerm_dImpl.v_bindShapeOf", ("Vuna.Compiler.Elab.Term.Impl.bindShapeOf", "Vuna/Compiler/Elab/Term/Impl.vuna:3747"));
  ("Elab_dTerm_dImpl.v_boolAltFuel", ("Vuna.Compiler.Elab.Term.Impl.boolAltFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:235"));
  ("Elab_dTerm_dImpl.v_boolAltGoFuel", ("Vuna.Compiler.Elab.Term.Impl.boolAltGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:242"));
  ("Elab_dTerm_dImpl.v_branchBinderOpaque", ("Vuna.Compiler.Elab.Term.Impl.branchBinderOpaque", "Vuna/Compiler/Elab/Term/Impl.vuna:45"));
  ("Elab_dTerm_dImpl.v_checkAppByValueFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppByValueFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3085"));
  ("Elab_dTerm_dImpl.v_checkAppCtorFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppCtorFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3597"));
  ("Elab_dTerm_dImpl.v_checkAppFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3052"));
  ("Elab_dTerm_dImpl.v_checkAppGeneralFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppGeneralFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3314"));
  ("Elab_dTerm_dImpl.v_checkAppUnderTypeFuel", ("Vuna.Compiler.Elab.Term.Impl.checkAppUnderTypeFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3098"));
  ("Elab_dTerm_dImpl.v_checkBoolCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkBoolCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:215"));
  ("Elab_dTerm_dImpl.v_checkByInferFuel", ("Vuna.Compiler.Elab.Term.Impl.checkByInferFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2891"));
  ("Elab_dTerm_dImpl.v_checkCaseFamFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseFamFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:198"));
  ("Elab_dTerm_dImpl.v_checkCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:153"));
  ("Elab_dTerm_dImpl.v_checkCaseMatrixFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseMatrixFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:187"));
  ("Elab_dTerm_dImpl.v_checkCaseOfFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCaseOfFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:448"));
  ("Elab_dTerm_dImpl.v_checkCondBoolFuel", ("Vuna.Compiler.Elab.Term.Impl.checkCondBoolFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:484"));
  ("Elab_dTerm_dImpl.v_checkDoBlockFuel", ("Vuna.Compiler.Elab.Term.Impl.checkDoBlockFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3910"));
  ("Elab_dTerm_dImpl.v_checkEFuel", ("Vuna.Compiler.Elab.Term.Impl.checkEFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2019"));
  ("Elab_dTerm_dImpl.v_checkEFuelNoRow", ("Vuna.Compiler.Elab.Term.Impl.checkEFuelNoRow", "Vuna/Compiler/Elab/Term/Impl.vuna:2100"));
  ("Elab_dTerm_dImpl.v_checkEFuelNoRowPlain", ("Vuna.Compiler.Elab.Term.Impl.checkEFuelNoRowPlain", "Vuna/Compiler/Elab/Term/Impl.vuna:2181"));
  ("Elab_dTerm_dImpl.v_checkEFuelNoRowPlainGo", ("Vuna.Compiler.Elab.Term.Impl.checkEFuelNoRowPlainGo", "Vuna/Compiler/Elab/Term/Impl.vuna:2190"));
  ("Elab_dTerm_dImpl.v_checkLamFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLamFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2912"));
  ("Elab_dTerm_dImpl.v_checkLetFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLetFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2307"));
  ("Elab_dTerm_dImpl.v_checkLetGoFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLetGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2419"));
  ("Elab_dTerm_dImpl.v_checkLetOneFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLetOneFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2428"));
  ("Elab_dTerm_dImpl.v_checkLitAltsFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLitAltsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:296"));
  ("Elab_dTerm_dImpl.v_checkLitBoundVarFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLitBoundVarFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:340"));
  ("Elab_dTerm_dImpl.v_checkLitCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkLitCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:282"));
  ("Elab_dTerm_dImpl.v_checkNatLitAltsFuel", ("Vuna.Compiler.Elab.Term.Impl.checkNatLitAltsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:393"));
  ("Elab_dTerm_dImpl.v_checkNatLitBoundVarFuel", ("Vuna.Compiler.Elab.Term.Impl.checkNatLitBoundVarFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:434"));
  ("Elab_dTerm_dImpl.v_checkNatLitCaseFuel", ("Vuna.Compiler.Elab.Term.Impl.checkNatLitCaseFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:381"));
  ("Elab_dTerm_dImpl.v_checkTypeAtKind", ("Vuna.Compiler.Elab.Term.Impl.checkTypeAtKind", "Vuna/Compiler/Elab/Term/Impl.vuna:3133"));
  ("Elab_dTerm_dImpl.v_checkTypeFuel", ("Vuna.Compiler.Elab.Term.Impl.checkTypeFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3001"));
  ("Elab_dTerm_dImpl.v_checkTypeInferFuel", ("Vuna.Compiler.Elab.Term.Impl.checkTypeInferFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3034"));
  ("Elab_dTerm_dImpl.v_clausesHaveOverCtor", ("Vuna.Compiler.Elab.Term.Impl.clausesHaveOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:2339"));
  ("Elab_dTerm_dImpl.v_coerceNatOperands", ("Vuna.Compiler.Elab.Term.Impl.coerceNatOperands", "Vuna/Compiler/Elab/Term/Impl.vuna:1857"));
  ("Elab_dTerm_dImpl.v_coerceTerm", ("Vuna.Compiler.Elab.Term.Impl.coerceTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1852"));
  ("Elab_dTerm_dImpl.v_constrainDictDomFuel", ("Vuna.Compiler.Elab.Term.Impl.constrainDictDomFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1753"));
  ("Elab_dTerm_dImpl.v_constrainDictDomGoKFuel", ("Vuna.Compiler.Elab.Term.Impl.constrainDictDomGoKFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1781"));
  ("Elab_dTerm_dImpl.v_countOpArrows", ("Vuna.Compiler.Elab.Term.Impl.countOpArrows", "Vuna/Compiler/Elab/Term/Impl.vuna:745"));
  ("Elab_dTerm_dImpl.v_ctorFamilyArgs", ("Vuna.Compiler.Elab.Term.Impl.ctorFamilyArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:3405"));
  ("Elab_dTerm_dImpl.v_ctorFamilyArgsGo", ("Vuna.Compiler.Elab.Term.Impl.ctorFamilyArgsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:3419"));
  ("Elab_dTerm_dImpl.v_ctorIdentitySpine", ("Vuna.Compiler.Elab.Term.Impl.ctorIdentitySpine", "Vuna/Compiler/Elab/Term/Impl.vuna:3385"));
  ("Elab_dTerm_dImpl.v_ctorResultArgs", ("Vuna.Compiler.Elab.Term.Impl.ctorResultArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:3359"));
  ("Elab_dTerm_dImpl.v_ctorSpineOfType", ("Vuna.Compiler.Elab.Term.Impl.ctorSpineOfType", "Vuna/Compiler/Elab/Term/Impl.vuna:3363"));
  ("Elab_dTerm_dImpl.v_ctxHasFieldDict", ("Vuna.Compiler.Elab.Term.Impl.ctxHasFieldDict", "Vuna/Compiler/Elab/Term/Impl.vuna:1138"));
  ("Elab_dTerm_dImpl.v_ctxHasFieldDictGo", ("Vuna.Compiler.Elab.Term.Impl.ctxHasFieldDictGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1142"));
  ("Elab_dTerm_dImpl.v_decodeDoBlock", ("Vuna.Compiler.Elab.Term.Impl.decodeDoBlock", "Vuna/Compiler/Elab/Term/Impl.vuna:3693"));
  ("Elab_dTerm_dImpl.v_decodeDoChain", ("Vuna.Compiler.Elab.Term.Impl.decodeDoChain", "Vuna/Compiler/Elab/Term/Impl.vuna:3674"));
  ("Elab_dTerm_dImpl.v_deferDictBinderFuel", ("Vuna.Compiler.Elab.Term.Impl.deferDictBinderFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1735"));
  ("Elab_dTerm_dImpl.v_doBindAppTerm", ("Vuna.Compiler.Elab.Term.Impl.doBindAppTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:3849"));
  ("Elab_dTerm_dImpl.v_doBindHeadOf", ("Vuna.Compiler.Elab.Term.Impl.doBindHeadOf", "Vuna/Compiler/Elab/Term/Impl.vuna:3762"));
  ("Elab_dTerm_dImpl.v_doBlockShapeOf", ("Vuna.Compiler.Elab.Term.Impl.doBlockShapeOf", "Vuna/Compiler/Elab/Term/Impl.vuna:3773"));
  ("Elab_dTerm_dImpl.v_doChainBuild", ("Vuna.Compiler.Elab.Term.Impl.doChainBuild", "Vuna/Compiler/Elab/Term/Impl.vuna:3705"));
  ("Elab_dTerm_dImpl.v_doChainFallback", ("Vuna.Compiler.Elab.Term.Impl.doChainFallback", "Vuna/Compiler/Elab/Term/Impl.vuna:3714"));
  ("Elab_dTerm_dImpl.v_doDictDefer", ("Vuna.Compiler.Elab.Term.Impl.doDictDefer", "Vuna/Compiler/Elab/Term/Impl.vuna:3785"));
  ("Elab_dTerm_dImpl.v_doDictStep", ("Vuna.Compiler.Elab.Term.Impl.doDictStep", "Vuna/Compiler/Elab/Term/Impl.vuna:3794"));
  ("Elab_dTerm_dImpl.v_doMarkerHead", ("Vuna.Compiler.Elab.Term.Impl.doMarkerHead", "Vuna/Compiler/Elab/Term/Impl.vuna:3651"));
  ("Elab_dTerm_dImpl.v_dropPis", ("Vuna.Compiler.Elab.Term.Impl.dropPis", "Vuna/Compiler/Elab/Term/Impl.vuna:3371"));
  ("Elab_dTerm_dImpl.v_effRowAndResult", ("Vuna.Compiler.Elab.Term.Impl.effRowAndResult", "Vuna/Compiler/Elab/Term/Impl.vuna:2632"));
  ("Elab_dTerm_dImpl.v_effRowOfValue", ("Vuna.Compiler.Elab.Term.Impl.effRowOfValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2638"));
  ("Elab_dTerm_dImpl.v_elabCaseAltsFuel", ("Vuna.Compiler.Elab.Term.Impl.elabCaseAltsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:99"));
  ("Elab_dTerm_dImpl.v_elabCatchAllFuel", ("Vuna.Compiler.Elab.Term.Impl.elabCatchAllFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:123"));
  ("Elab_dTerm_dImpl.v_elabConAltFuel", ("Vuna.Compiler.Elab.Term.Impl.elabConAltFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:58"));
  ("Elab_dTerm_dImpl.v_elabDoChain", ("Vuna.Compiler.Elab.Term.Impl.elabDoChain", "Vuna/Compiler/Elab/Term/Impl.vuna:3876"));
  ("Elab_dTerm_dImpl.v_elabEFieldFuel", ("Vuna.Compiler.Elab.Term.Impl.elabEFieldFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1192"));
  ("Elab_dTerm_dImpl.v_elabERecUpdateFuel", ("Vuna.Compiler.Elab.Term.Impl.elabERecUpdateFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1218"));
  ("Elab_dTerm_dImpl.v_expandArgListLit", ("Vuna.Compiler.Elab.Term.Impl.expandArgListLit", "Vuna/Compiler/Elab/Term/Impl.vuna:1579"));
  ("Elab_dTerm_dImpl.v_expandBind", ("Vuna.Compiler.Elab.Term.Impl.expandBind", "Vuna/Compiler/Elab/Term/Impl.vuna:2394"));
  ("Elab_dTerm_dImpl.v_expandDoStmt", ("Vuna.Compiler.Elab.Term.Impl.expandDoStmt", "Vuna/Compiler/Elab/Term/Impl.vuna:2398"));
  ("Elab_dTerm_dImpl.v_expandListLit", ("Vuna.Compiler.Elab.Term.Impl.expandListLit", "Vuna/Compiler/Elab/Term/Impl.vuna:1554"));
  ("Elab_dTerm_dImpl.v_expandListLitGo", ("Vuna.Compiler.Elab.Term.Impl.expandListLitGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1464"));
  ("Elab_dTerm_dImpl.v_expandLocalFuns", ("Vuna.Compiler.Elab.Term.Impl.expandLocalFuns", "Vuna/Compiler/Elab/Term/Impl.vuna:2344"));
  ("Elab_dTerm_dImpl.v_expandRowListLitGo", ("Vuna.Compiler.Elab.Term.Impl.expandRowListLitGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1520"));
  ("Elab_dTerm_dImpl.v_exprFormName", ("Vuna.Compiler.Elab.Term.Impl.exprFormName", "Vuna/Compiler/Elab/Term/Impl.vuna:2081"));
  ("Elab_dTerm_dImpl.v_findCtorByShort", ("Vuna.Compiler.Elab.Term.Impl.findCtorByShort", "Vuna/Compiler/Elab/Term/Impl.vuna:1451"));
  ("Elab_dTerm_dImpl.v_firstCtorOf", ("Vuna.Compiler.Elab.Term.Impl.firstCtorOf", "Vuna/Compiler/Elab/Term/Impl.vuna:1546"));
  ("Elab_dTerm_dImpl.v_floatApp2", ("Vuna.Compiler.Elab.Term.Impl.floatApp2", "Vuna/Compiler/Elab/Term/Impl.vuna:1896"));
  ("Elab_dTerm_dImpl.v_floatTyValue", ("Vuna.Compiler.Elab.Term.Impl.floatTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1829"));
  ("Elab_dTerm_dImpl.v_handleCall", ("Vuna.Compiler.Elab.Term.Impl.handleCall", "Vuna/Compiler/Elab/Term/Impl.vuna:791"));
  ("Elab_dTerm_dImpl.v_handleCallExpr", ("Vuna.Compiler.Elab.Term.Impl.handleCallExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:850"));
  ("Elab_dTerm_dImpl.v_handleCallExprAt", ("Vuna.Compiler.Elab.Term.Impl.handleCallExprAt", "Vuna/Compiler/Elab/Term/Impl.vuna:855"));
  ("Elab_dTerm_dImpl.v_handleCallExprAtHole", ("Vuna.Compiler.Elab.Term.Impl.handleCallExprAtHole", "Vuna/Compiler/Elab/Term/Impl.vuna:860"));
  ("Elab_dTerm_dImpl.v_handleCallExprWith", ("Vuna.Compiler.Elab.Term.Impl.handleCallExprWith", "Vuna/Compiler/Elab/Term/Impl.vuna:834"));
  ("Elab_dTerm_dImpl.v_handleCheckFamilies", ("Vuna.Compiler.Elab.Term.Impl.handleCheckFamilies", "Vuna/Compiler/Elab/Term/Impl.vuna:715"));
  ("Elab_dTerm_dImpl.v_handleClauseFamilies", ("Vuna.Compiler.Elab.Term.Impl.handleClauseFamilies", "Vuna/Compiler/Elab/Term/Impl.vuna:727"));
  ("Elab_dTerm_dImpl.v_handleClauseFamily", ("Vuna.Compiler.Elab.Term.Impl.handleClauseFamily", "Vuna/Compiler/Elab/Term/Impl.vuna:693"));
  ("Elab_dTerm_dImpl.v_handleClauseFamilyOfPat", ("Vuna.Compiler.Elab.Term.Impl.handleClauseFamilyOfPat", "Vuna/Compiler/Elab/Term/Impl.vuna:710"));
  ("Elab_dTerm_dImpl.v_handleDefaultRetBinder", ("Vuna.Compiler.Elab.Term.Impl.handleDefaultRetBinder", "Vuna/Compiler/Elab/Term/Impl.vuna:808"));
  ("Elab_dTerm_dImpl.v_handleFamilyOfCtor", ("Vuna.Compiler.Elab.Term.Impl.handleFamilyOfCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:703"));
  ("Elab_dTerm_dImpl.v_handleHoleArgs", ("Vuna.Compiler.Elab.Term.Impl.handleHoleArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:764"));
  ("Elab_dTerm_dImpl.v_handleOpArg", ("Vuna.Compiler.Elab.Term.Impl.handleOpArg", "Vuna/Compiler/Elab/Term/Impl.vuna:769"));
  ("Elab_dTerm_dImpl.v_handleOpArity", ("Vuna.Compiler.Elab.Term.Impl.handleOpArity", "Vuna/Compiler/Elab/Term/Impl.vuna:739"));
  ("Elab_dTerm_dImpl.v_handleOpKind", ("Vuna.Compiler.Elab.Term.Impl.handleOpKind", "Vuna/Compiler/Elab/Term/Impl.vuna:801"));
  ("Elab_dTerm_dImpl.v_handleOperand", ("Vuna.Compiler.Elab.Term.Impl.handleOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:687"));
  ("Elab_dTerm_dImpl.v_handleRetArg", ("Vuna.Compiler.Elab.Term.Impl.handleRetArg", "Vuna/Compiler/Elab/Term/Impl.vuna:812"));
  ("Elab_dTerm_dImpl.v_handleSigArg", ("Vuna.Compiler.Elab.Term.Impl.handleSigArg", "Vuna/Compiler/Elab/Term/Impl.vuna:782"));
  ("Elab_dTerm_dImpl.v_handleSigBinder", ("Vuna.Compiler.Elab.Term.Impl.handleSigBinder", "Vuna/Compiler/Elab/Term/Impl.vuna:777"));
  ("Elab_dTerm_dImpl.v_hasFieldAccessFuel", ("Vuna.Compiler.Elab.Term.Impl.hasFieldAccessFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1170"));
  ("Elab_dTerm_dImpl.v_hasFieldDictName", ("Vuna.Compiler.Elab.Term.Impl.hasFieldDictName", "Vuna/Compiler/Elab/Term/Impl.vuna:1132"));
  ("Elab_dTerm_dImpl.v_identityArgs", ("Vuna.Compiler.Elab.Term.Impl.identityArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:3375"));
  ("Elab_dTerm_dImpl.v_inferAnnFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAnnFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1247"));
  ("Elab_dTerm_dImpl.v_inferAppFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1329"));
  ("Elab_dTerm_dImpl.v_inferAppGeneralFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppGeneralFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1399"));
  ("Elab_dTerm_dImpl.v_inferAppGeneralGoFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppGeneralGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1414"));
  ("Elab_dTerm_dImpl.v_inferAppUnderTypeFuel", ("Vuna.Compiler.Elab.Term.Impl.inferAppUnderTypeFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3109"));
  ("Elab_dTerm_dImpl.v_inferArgsFuel", ("Vuna.Compiler.Elab.Term.Impl.inferArgsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1430"));
  ("Elab_dTerm_dImpl.v_inferArgsGo", ("Vuna.Compiler.Elab.Term.Impl.inferArgsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1585"));
  ("Elab_dTerm_dImpl.v_inferCaseEFuel", ("Vuna.Compiler.Elab.Term.Impl.inferCaseEFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:464"));
  ("Elab_dTerm_dImpl.v_inferDoBlockFuel", ("Vuna.Compiler.Elab.Term.Impl.inferDoBlockFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3953"));
  ("Elab_dTerm_dImpl.v_inferEFuel", ("Vuna.Compiler.Elab.Term.Impl.inferEFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:864"));
  ("Elab_dTerm_dImpl.v_inferEFuelCore", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelCore", "Vuna/Compiler/Elab/Term/Impl.vuna:906"));
  ("Elab_dTerm_dImpl.v_inferEFuelCorePlain", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelCorePlain", "Vuna/Compiler/Elab/Term/Impl.vuna:924"));
  ("Elab_dTerm_dImpl.v_inferEFuelCorePlainGo", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelCorePlainGo", "Vuna/Compiler/Elab/Term/Impl.vuna:933"));
  ("Elab_dTerm_dImpl.v_inferEFuelHint", ("Vuna.Compiler.Elab.Term.Impl.inferEFuelHint", "Vuna/Compiler/Elab/Term/Impl.vuna:2605"));
  ("Elab_dTerm_dImpl.v_inferLetBoundFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetBoundFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2490"));
  ("Elab_dTerm_dImpl.v_inferLetFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2409"));
  ("Elab_dTerm_dImpl.v_inferLetGoFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetGoFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2476"));
  ("Elab_dTerm_dImpl.v_inferLetIgnoredFuel", ("Vuna.Compiler.Elab.Term.Impl.inferLetIgnoredFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2512"));
  ("Elab_dTerm_dImpl.v_inferPiFuel", ("Vuna.Compiler.Elab.Term.Impl.inferPiFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1265"));
  ("Elab_dTerm_dImpl.v_instArgOperand", ("Vuna.Compiler.Elab.Term.Impl.instArgOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:541"));
  ("Elab_dTerm_dImpl.v_intApp2", ("Vuna.Compiler.Elab.Term.Impl.intApp2", "Vuna/Compiler/Elab/Term/Impl.vuna:1888"));
  ("Elab_dTerm_dImpl.v_intTyValue", ("Vuna.Compiler.Elab.Term.Impl.intTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1822"));
  ("Elab_dTerm_dImpl.v_isEIntExpr", ("Vuna.Compiler.Elab.Term.Impl.isEIntExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:1906"));
  ("Elab_dTerm_dImpl.v_isFloatTy", ("Vuna.Compiler.Elab.Term.Impl.isFloatTy", "Vuna/Compiler/Elab/Term/Impl.vuna:1845"));
  ("Elab_dTerm_dImpl.v_isIntTy", ("Vuna.Compiler.Elab.Term.Impl.isIntTy", "Vuna/Compiler/Elab/Term/Impl.vuna:1832"));
  ("Elab_dTerm_dImpl.v_isMetaHeadedValue", ("Vuna.Compiler.Elab.Term.Impl.isMetaHeadedValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2549"));
  ("Elab_dTerm_dImpl.v_isNatTy", ("Vuna.Compiler.Elab.Term.Impl.isNatTy", "Vuna/Compiler/Elab/Term/Impl.vuna:1838"));
  ("Elab_dTerm_dImpl.v_isNilRowValue", ("Vuna.Compiler.Elab.Term.Impl.isNilRowValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2645"));
  ("Elab_dTerm_dImpl.v_isRigidHeadValue", ("Vuna.Compiler.Elab.Term.Impl.isRigidHeadValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2556"));
  ("Elab_dTerm_dImpl.v_isSimpleComp", ("Vuna.Compiler.Elab.Term.Impl.isSimpleComp", "Vuna/Compiler/Elab/Term/Impl.vuna:2015"));
  ("Elab_dTerm_dImpl.v_isStringTyValue", ("Vuna.Compiler.Elab.Term.Impl.isStringTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:3281"));
  ("Elab_dTerm_dImpl.v_isUniverseTerm", ("Vuna.Compiler.Elab.Term.Impl.isUniverseTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:759"));
  ("Elab_dTerm_dImpl.v_joinEffectLabels", ("Vuna.Compiler.Elab.Term.Impl.joinEffectLabels", "Vuna/Compiler/Elab/Term/Impl.vuna:2764"));
  ("Elab_dTerm_dImpl.v_labelHeadArgs", ("Vuna.Compiler.Elab.Term.Impl.labelHeadArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:2673"));
  ("Elab_dTerm_dImpl.v_listLitConsTail", ("Vuna.Compiler.Elab.Term.Impl.listLitConsTail", "Vuna/Compiler/Elab/Term/Impl.vuna:1444"));
  ("Elab_dTerm_dImpl.v_listLitElems", ("Vuna.Compiler.Elab.Term.Impl.listLitElems", "Vuna/Compiler/Elab/Term/Impl.vuna:1437"));
  ("Elab_dTerm_dImpl.v_listLitFamily", ("Vuna.Compiler.Elab.Term.Impl.listLitFamily", "Vuna/Compiler/Elab/Term/Impl.vuna:1572"));
  ("Elab_dTerm_dImpl.v_litAltStepFuel", ("Vuna.Compiler.Elab.Term.Impl.litAltStepFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:323"));
  ("Elab_dTerm_dImpl.v_litFamilyCons", ("Vuna.Compiler.Elab.Term.Impl.litFamilyCons", "Vuna/Compiler/Elab/Term/Impl.vuna:1543"));
  ("Elab_dTerm_dImpl.v_litFamilyCtor", ("Vuna.Compiler.Elab.Term.Impl.litFamilyCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:1457"));
  ("Elab_dTerm_dImpl.v_literalTraitLower", ("Vuna.Compiler.Elab.Term.Impl.literalTraitLower", "Vuna/Compiler/Elab/Term/Impl.vuna:2072"));
  ("Elab_dTerm_dImpl.v_mutCallParts", ("Vuna.Compiler.Elab.Term.Impl.mutCallParts", "Vuna/Compiler/Elab/Term/Impl.vuna:593"));
  ("Elab_dTerm_dImpl.v_mutHandleNames", ("Vuna.Compiler.Elab.Term.Impl.mutHandleNames", "Vuna/Compiler/Elab/Term/Impl.vuna:562"));
  ("Elab_dTerm_dImpl.v_mutHandleNamesGo", ("Vuna.Compiler.Elab.Term.Impl.mutHandleNamesGo", "Vuna/Compiler/Elab/Term/Impl.vuna:565"));
  ("Elab_dTerm_dImpl.v_mutResolveHandle", ("Vuna.Compiler.Elab.Term.Impl.mutResolveHandle", "Vuna/Compiler/Elab/Term/Impl.vuna:577"));
  ("Elab_dTerm_dImpl.v_mutRewriteExpr", ("Vuna.Compiler.Elab.Term.Impl.mutRewriteExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:613"));
  ("Elab_dTerm_dImpl.v_mutRewriteIntro", ("Vuna.Compiler.Elab.Term.Impl.mutRewriteIntro", "Vuna/Compiler/Elab/Term/Impl.vuna:646"));
  ("Elab_dTerm_dImpl.v_mutRewriteOp", ("Vuna.Compiler.Elab.Term.Impl.mutRewriteOp", "Vuna/Compiler/Elab/Term/Impl.vuna:633"));
  ("Elab_dTerm_dImpl.v_namedLabelParts", ("Vuna.Compiler.Elab.Term.Impl.namedLabelParts", "Vuna/Compiler/Elab/Term/Impl.vuna:2693"));
  ("Elab_dTerm_dImpl.v_natApp2", ("Vuna.Compiler.Elab.Term.Impl.natApp2", "Vuna/Compiler/Elab/Term/Impl.vuna:1891"));
  ("Elab_dTerm_dImpl.v_natLitAltStepFuel", ("Vuna.Compiler.Elab.Term.Impl.natLitAltStepFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:418"));
  ("Elab_dTerm_dImpl.v_natLitCaseAlts", ("Vuna.Compiler.Elab.Term.Impl.natLitCaseAlts", "Vuna/Compiler/Elab/Term/Impl.vuna:364"));
  ("Elab_dTerm_dImpl.v_natLitCaseFast", ("Vuna.Compiler.Elab.Term.Impl.natLitCaseFast", "Vuna/Compiler/Elab/Term/Impl.vuna:360"));
  ("Elab_dTerm_dImpl.v_natLitCaseHasCatchAll", ("Vuna.Compiler.Elab.Term.Impl.natLitCaseHasCatchAll", "Vuna/Compiler/Elab/Term/Impl.vuna:373"));
  ("Elab_dTerm_dImpl.v_natLitResult", ("Vuna.Compiler.Elab.Term.Impl.natLitResult", "Vuna/Compiler/Elab/Term/Impl.vuna:1816"));
  ("Elab_dTerm_dImpl.v_natLitTerm", ("Vuna.Compiler.Elab.Term.Impl.natLitTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1811"));
  ("Elab_dTerm_dImpl.v_natLitTermGo", ("Vuna.Compiler.Elab.Term.Impl.natLitTermGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1808"));
  ("Elab_dTerm_dImpl.v_natPatGo", ("Vuna.Compiler.Elab.Term.Impl.natPatGo", "Vuna/Compiler/Elab/Term/Impl.vuna:3441"));
  ("Elab_dTerm_dImpl.v_natPatOf", ("Vuna.Compiler.Elab.Term.Impl.natPatOf", "Vuna/Compiler/Elab/Term/Impl.vuna:3437"));
  ("Elab_dTerm_dImpl.v_natToIntTerm", ("Vuna.Compiler.Elab.Term.Impl.natToIntTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:1819"));
  ("Elab_dTerm_dImpl.v_natTyValue", ("Vuna.Compiler.Elab.Term.Impl.natTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:1825"));
  ("Elab_dTerm_dImpl.v_needsMatrixCase", ("Vuna.Compiler.Elab.Term.Impl.needsMatrixCase", "Vuna/Compiler/Elab/Term/Impl.vuna:179"));
  ("Elab_dTerm_dImpl.v_opFamilyArityOf", ("Vuna.Compiler.Elab.Term.Impl.opFamilyArityOf", "Vuna/Compiler/Elab/Term/Impl.vuna:823"));
  ("Elab_dTerm_dImpl.v_opaqueBranchIndices", ("Vuna.Compiler.Elab.Term.Impl.opaqueBranchIndices", "Vuna/Compiler/Elab/Term/Impl.vuna:34"));
  ("Elab_dTerm_dImpl.v_opaqueBranchIndicesGo", ("Vuna.Compiler.Elab.Term.Impl.opaqueBranchIndicesGo", "Vuna/Compiler/Elab/Term/Impl.vuna:37"));
  ("Elab_dTerm_dImpl.v_overValueAppCandidateMatches", ("Vuna.Compiler.Elab.Term.Impl.overValueAppCandidateMatches", "Vuna/Compiler/Elab/Term/Impl.vuna:2136"));
  ("Elab_dTerm_dImpl.v_overValueAppResultMatches", ("Vuna.Compiler.Elab.Term.Impl.overValueAppResultMatches", "Vuna/Compiler/Elab/Term/Impl.vuna:2144"));
  ("Elab_dTerm_dImpl.v_overValueCandidateMatches", ("Vuna.Compiler.Elab.Term.Impl.overValueCandidateMatches", "Vuna/Compiler/Elab/Term/Impl.vuna:2119"));
  ("Elab_dTerm_dImpl.v_patHasOverCtor", ("Vuna.Compiler.Elab.Term.Impl.patHasOverCtor", "Vuna/Compiler/Elab/Term/Impl.vuna:2321"));
  ("Elab_dTerm_dImpl.v_perfFamilyOfCanonical", ("Vuna.Compiler.Elab.Term.Impl.perfFamilyOfCanonical", "Vuna/Compiler/Elab/Term/Impl.vuna:520"));
  ("Elab_dTerm_dImpl.v_perfFamilyOfValue", ("Vuna.Compiler.Elab.Term.Impl.perfFamilyOfValue", "Vuna/Compiler/Elab/Term/Impl.vuna:528"));
  ("Elab_dTerm_dImpl.v_perfShortOf", ("Vuna.Compiler.Elab.Term.Impl.perfShortOf", "Vuna/Compiler/Elab/Term/Impl.vuna:511"));
  ("Elab_dTerm_dImpl.v_performCallExpr", ("Vuna.Compiler.Elab.Term.Impl.performCallExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:668"));
  ("Elab_dTerm_dImpl.v_performOperand", ("Vuna.Compiler.Elab.Term.Impl.performOperand", "Vuna/Compiler/Elab/Term/Impl.vuna:535"));
  ("Elab_dTerm_dImpl.v_planDoBlock", ("Vuna.Compiler.Elab.Term.Impl.planDoBlock", "Vuna/Compiler/Elab/Term/Impl.vuna:3822"));
  ("Elab_dTerm_dImpl.v_recordFieldLookup", ("Vuna.Compiler.Elab.Term.Impl.recordFieldLookup", "Vuna/Compiler/Elab/Term/Impl.vuna:1031"));
  ("Elab_dTerm_dImpl.v_recordFieldLookupGo", ("Vuna.Compiler.Elab.Term.Impl.recordFieldLookupGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1034"));
  ("Elab_dTerm_dImpl.v_recordFieldPats", ("Vuna.Compiler.Elab.Term.Impl.recordFieldPats", "Vuna/Compiler/Elab/Term/Impl.vuna:1019"));
  ("Elab_dTerm_dImpl.v_recordFieldPatsFrom", ("Vuna.Compiler.Elab.Term.Impl.recordFieldPatsFrom", "Vuna/Compiler/Elab/Term/Impl.vuna:1023"));
  ("Elab_dTerm_dImpl.v_recordFieldPlan", ("Vuna.Compiler.Elab.Term.Impl.recordFieldPlan", "Vuna/Compiler/Elab/Term/Impl.vuna:1106"));
  ("Elab_dTerm_dImpl.v_recordFieldVarName", ("Vuna.Compiler.Elab.Term.Impl.recordFieldVarName", "Vuna/Compiler/Elab/Term/Impl.vuna:1015"));
  ("Elab_dTerm_dImpl.v_recordTypeOf", ("Vuna.Compiler.Elab.Term.Impl.recordTypeOf", "Vuna/Compiler/Elab/Term/Impl.vuna:999"));
  ("Elab_dTerm_dImpl.v_recordUpdateArg", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateArg", "Vuna/Compiler/Elab/Term/Impl.vuna:1061"));
  ("Elab_dTerm_dImpl.v_recordUpdateArgs", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:1068"));
  ("Elab_dTerm_dImpl.v_recordUpdatePlan", ("Vuna.Compiler.Elab.Term.Impl.recordUpdatePlan", "Vuna/Compiler/Elab/Term/Impl.vuna:1117"));
  ("Elab_dTerm_dImpl.v_recordUpdateUnknown", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateUnknown", "Vuna/Compiler/Elab/Term/Impl.vuna:1051"));
  ("Elab_dTerm_dImpl.v_recordUpdateUnknownGo", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateUnknownGo", "Vuna/Compiler/Elab/Term/Impl.vuna:1043"));
  ("Elab_dTerm_dImpl.v_recordUpdateValueFor", ("Vuna.Compiler.Elab.Term.Impl.recordUpdateValueFor", "Vuna/Compiler/Elab/Term/Impl.vuna:1055"));
  ("Elab_dTerm_dImpl.v_recordUpdatedIndices", ("Vuna.Compiler.Elab.Term.Impl.recordUpdatedIndices", "Vuna/Compiler/Elab/Term/Impl.vuna:1074"));
  ("Elab_dTerm_dImpl.v_remainingExplicitPis", ("Vuna.Compiler.Elab.Term.Impl.remainingExplicitPis", "Vuna/Compiler/Elab/Term/Impl.vuna:2567"));
  ("Elab_dTerm_dImpl.v_resolveClausePatsFuel", ("Vuna.Compiler.Elab.Term.Impl.resolveClausePatsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3570"));
  ("Elab_dTerm_dImpl.v_resolveCtorPatFuel", ("Vuna.Compiler.Elab.Term.Impl.resolveCtorPatFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3480"));
  ("Elab_dTerm_dImpl.v_resolveOverAlts", ("Vuna.Compiler.Elab.Term.Impl.resolveOverAlts", "Vuna/Compiler/Elab/Term/Impl.vuna:3524"));
  ("Elab_dTerm_dImpl.v_resolveOverAltsGo", ("Vuna.Compiler.Elab.Term.Impl.resolveOverAltsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:3528"));
  ("Elab_dTerm_dImpl.v_resolveOverFunPats", ("Vuna.Compiler.Elab.Term.Impl.resolveOverFunPats", "Vuna/Compiler/Elab/Term/Impl.vuna:3547"));
  ("Elab_dTerm_dImpl.v_resolveOverFunPatsGo", ("Vuna.Compiler.Elab.Term.Impl.resolveOverFunPatsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:3552"));
  ("Elab_dTerm_dImpl.v_resolveOverPatFuel", ("Vuna.Compiler.Elab.Term.Impl.resolveOverPatFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3449"));
  ("Elab_dTerm_dImpl.v_resolveOverValueAppTarget", ("Vuna.Compiler.Elab.Term.Impl.resolveOverValueAppTarget", "Vuna/Compiler/Elab/Term/Impl.vuna:2169"));
  ("Elab_dTerm_dImpl.v_resolveOverValueTarget", ("Vuna.Compiler.Elab.Term.Impl.resolveOverValueTarget", "Vuna/Compiler/Elab/Term/Impl.vuna:2175"));
  ("Elab_dTerm_dImpl.v_resolvePatArgsFuel", ("Vuna.Compiler.Elab.Term.Impl.resolvePatArgsFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3496"));
  ("Elab_dTerm_dImpl.v_rowAtParts", ("Vuna.Compiler.Elab.Term.Impl.rowAtParts", "Vuna/Compiler/Elab/Term/Impl.vuna:1476"));
  ("Elab_dTerm_dImpl.v_rowConsArgs", ("Vuna.Compiler.Elab.Term.Impl.rowConsArgs", "Vuna/Compiler/Elab/Term/Impl.vuna:1530"));
  ("Elab_dTerm_dImpl.v_rowConsEntry", ("Vuna.Compiler.Elab.Term.Impl.rowConsEntry", "Vuna/Compiler/Elab/Term/Impl.vuna:1533"));
  ("Elab_dTerm_dImpl.v_rowContainsValue", ("Vuna.Compiler.Elab.Term.Impl.rowContainsValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2805"));
  ("Elab_dTerm_dImpl.v_rowEffectLabels", ("Vuna.Compiler.Elab.Term.Impl.rowEffectLabels", "Vuna/Compiler/Elab/Term/Impl.vuna:2712"));
  ("Elab_dTerm_dImpl.v_rowEntryLabelTail", ("Vuna.Compiler.Elab.Term.Impl.rowEntryLabelTail", "Vuna/Compiler/Elab/Term/Impl.vuna:2652"));
  ("Elab_dTerm_dImpl.v_rowEntryParts", ("Vuna.Compiler.Elab.Term.Impl.rowEntryParts", "Vuna/Compiler/Elab/Term/Impl.vuna:1488"));
  ("Elab_dTerm_dImpl.v_rowEntryText", ("Vuna.Compiler.Elab.Term.Impl.rowEntryText", "Vuna/Compiler/Elab/Term/Impl.vuna:2685"));
  ("Elab_dTerm_dImpl.v_rowEntryTextOf", ("Vuna.Compiler.Elab.Term.Impl.rowEntryTextOf", "Vuna/Compiler/Elab/Term/Impl.vuna:2705"));
  ("Elab_dTerm_dImpl.v_rowLabelText", ("Vuna.Compiler.Elab.Term.Impl.rowLabelText", "Vuna/Compiler/Elab/Term/Impl.vuna:2667"));
  ("Elab_dTerm_dImpl.v_rowLitLabel", ("Vuna.Compiler.Elab.Term.Impl.rowLitLabel", "Vuna/Compiler/Elab/Term/Impl.vuna:1502"));
  ("Elab_dTerm_dImpl.v_rowLitNameArg", ("Vuna.Compiler.Elab.Term.Impl.rowLitNameArg", "Vuna/Compiler/Elab/Term/Impl.vuna:1508"));
  ("Elab_dTerm_dImpl.v_rowLitNameExpr", ("Vuna.Compiler.Elab.Term.Impl.rowLitNameExpr", "Vuna/Compiler/Elab/Term/Impl.vuna:1514"));
  ("Elab_dTerm_dImpl.v_rowNameText", ("Vuna.Compiler.Elab.Term.Impl.rowNameText", "Vuna/Compiler/Elab/Term/Impl.vuna:2678"));
  ("Elab_dTerm_dImpl.v_rowNonDefaultHostEntries", ("Vuna.Compiler.Elab.Term.Impl.rowNonDefaultHostEntries", "Vuna/Compiler/Elab/Term/Impl.vuna:2738"));
  ("Elab_dTerm_dImpl.v_rowSubValue", ("Vuna.Compiler.Elab.Term.Impl.rowSubValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2820"));
  ("Elab_dTerm_dImpl.v_sameLabelValue", ("Vuna.Compiler.Elab.Term.Impl.sameLabelValue", "Vuna/Compiler/Elab/Term/Impl.vuna:2794"));
  ("Elab_dTerm_dImpl.v_shortGlobalName", ("Vuna.Compiler.Elab.Term.Impl.shortGlobalName", "Vuna/Compiler/Elab/Term/Impl.vuna:2663"));
  ("Elab_dTerm_dImpl.v_skipArithSpecForExpected", ("Vuna.Compiler.Elab.Term.Impl.skipArithSpecForExpected", "Vuna/Compiler/Elab/Term/Impl.vuna:1307"));
  ("Elab_dTerm_dImpl.v_skipArithSpecForHint", ("Vuna.Compiler.Elab.Term.Impl.skipArithSpecForHint", "Vuna/Compiler/Elab/Term/Impl.vuna:1324"));
  ("Elab_dTerm_dImpl.v_specializeArithAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1969"));
  ("Elab_dTerm_dImpl.v_specializeArithAppOpFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithAppOpFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1979"));
  ("Elab_dTerm_dImpl.v_specializeArithCheckFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithCheckFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1913"));
  ("Elab_dTerm_dImpl.v_specializeArithCheckOpFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeArithCheckOpFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:1923"));
  ("Elab_dTerm_dImpl.v_specializeBoolAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeBoolAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3293"));
  ("Elab_dTerm_dImpl.v_specializeCmpAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeCmpAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3194"));
  ("Elab_dTerm_dImpl.v_specializeEqAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeEqAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3170"));
  ("Elab_dTerm_dImpl.v_specializeInterpPrimApp", ("Vuna.Compiler.Elab.Term.Impl.specializeInterpPrimApp", "Vuna/Compiler/Elab/Term/Impl.vuna:3253"));
  ("Elab_dTerm_dImpl.v_specializeOpAppFuel", ("Vuna.Compiler.Elab.Term.Impl.specializeOpAppFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:3220"));
  ("Elab_dTerm_dImpl.v_splitDoExpected", ("Vuna.Compiler.Elab.Term.Impl.splitDoExpected", "Vuna/Compiler/Elab/Term/Impl.vuna:3729"));
  ("Elab_dTerm_dImpl.v_splitDoSpine", ("Vuna.Compiler.Elab.Term.Impl.splitDoSpine", "Vuna/Compiler/Elab/Term/Impl.vuna:3721"));
  ("Elab_dTerm_dImpl.v_strFromFloatTerm", ("Vuna.Compiler.Elab.Term.Impl.strFromFloatTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:3275"));
  ("Elab_dTerm_dImpl.v_strFromIntTerm", ("Vuna.Compiler.Elab.Term.Impl.strFromIntTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:3271"));
  ("Elab_dTerm_dImpl.v_strTyValue", ("Vuna.Compiler.Elab.Term.Impl.strTyValue", "Vuna/Compiler/Elab/Term/Impl.vuna:3278"));
  ("Elab_dTerm_dImpl.v_stripPiWithMetas", ("Vuna.Compiler.Elab.Term.Impl.stripPiWithMetas", "Vuna/Compiler/Elab/Term/Impl.vuna:2152"));
  ("Elab_dTerm_dImpl.v_stripPiWithMetasFuel", ("Vuna.Compiler.Elab.Term.Impl.stripPiWithMetasFuel", "Vuna/Compiler/Elab/Term/Impl.vuna:2155"));
  ("Elab_dTerm_dImpl.v_stripPisWithMetas", ("Vuna.Compiler.Elab.Term.Impl.stripPisWithMetas", "Vuna/Compiler/Elab/Term/Impl.vuna:2534"));
  ("Elab_dTerm_dImpl.v_takeRigs", ("Vuna.Compiler.Elab.Term.Impl.takeRigs", "Vuna/Compiler/Elab/Term/Impl.vuna:3398"));
  ("Elab_dTerm_dImpl.v_takeRigsGo", ("Vuna.Compiler.Elab.Term.Impl.takeRigsGo", "Vuna/Compiler/Elab/Term/Impl.vuna:3401"));
  ("Elab_dTerm_dImpl.v_tryEffLift", ("Vuna.Compiler.Elab.Term.Impl.tryEffLift", "Vuna/Compiler/Elab/Term/Impl.vuna:2840"));
  ("Elab_dTerm_dImpl.v_tryUseHint", ("Vuna.Compiler.Elab.Term.Impl.tryUseHint", "Vuna/Compiler/Elab/Term/Impl.vuna:2585"));
  ("Elab_dTerm_dImpl.v_typeAppTerm", ("Vuna.Compiler.Elab.Term.Impl.typeAppTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2995"));
  ("Elab_dTerm_dImpl.v_typeHeadTerm", ("Vuna.Compiler.Elab.Term.Impl.typeHeadTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2988"));
  ("Elab_dTerm_dImpl.v_unhandledEffectLabel", ("Vuna.Compiler.Elab.Term.Impl.unhandledEffectLabel", "Vuna/Compiler/Elab/Term/Impl.vuna:2772"));
  ("Elab_dTerm_dImpl.v_weakenLabelTerm", ("Vuna.Compiler.Elab.Term.Impl.weakenLabelTerm", "Vuna/Compiler/Elab/Term/Impl.vuna:2884"));
  ("Elab_dTerm_dImpl.v_wrapRowEntry", ("Vuna.Compiler.Elab.Term.Impl.wrapRowEntry", "Vuna/Compiler/Elab/Term/Impl.vuna:1538"));
  ("Elab_dTerm_dSupport.v_allImplicitPrefix", ("Vuna.Compiler.Elab.Term.Support.allImplicitPrefix", "Vuna/Compiler/Elab/Term/Support.vuna:41"));
  ("Elab_dTerm_dSupport.v_checkBindingSigs", ("Vuna.Compiler.Elab.Term.Support.checkBindingSigs", "Vuna/Compiler/Elab/Term/Support.vuna:68"));
  ("Elab_dTerm_dSupport.v_checkWhereSigs", ("Vuna.Compiler.Elab.Term.Support.checkWhereSigs", "Vuna/Compiler/Elab/Term/Support.vuna:72"));
  ("Elab_dTerm_dSupport.v_inferVarRef", ("Vuna.Compiler.Elab.Term.Support.inferVarRef", "Vuna/Compiler/Elab/Term/Support.vuna:21"));
  ("Elab_dTerm_dSupport.v_instantiateAllImplicit", ("Vuna.Compiler.Elab.Term.Support.instantiateAllImplicit", "Vuna/Compiler/Elab/Term/Support.vuna:46"));
  ("Elab_dTerm_dSupport.v_instantiateAllImplicitFuel", ("Vuna.Compiler.Elab.Term.Support.instantiateAllImplicitFuel", "Vuna/Compiler/Elab/Term/Support.vuna:49"));
  ("Elab_dTerm_dSupport.v_whereBindingName", ("Vuna.Compiler.Elab.Term.Support.whereBindingName", "Vuna/Compiler/Elab/Term/Support.vuna:82"));
  ("Elab_dTerm_dSupport.v_withEffectLabels", ("Vuna.Compiler.Elab.Term.Support.withEffectLabels", "Vuna/Compiler/Elab/Term/Support.vuna:87"));
  ("Elab_dTermination.v_addEdge", ("Vuna.Compiler.Elab.Termination.addEdge", "Vuna/Compiler/Elab/Termination.vuna:112"));
  ("Elab_dTermination.v_addEdges", ("Vuna.Compiler.Elab.Termination.addEdges", "Vuna/Compiler/Elab/Termination.vuna:118"));
  ("Elab_dTermination.v_addSrcs", ("Vuna.Compiler.Elab.Termination.addSrcs", "Vuna/Compiler/Elab/Termination.vuna:95"));
  ("Elab_dTermination.v_adjOf", ("Vuna.Compiler.Elab.Termination.adjOf", "Vuna/Compiler/Elab/Termination.vuna:81"));
  ("Elab_dTermination.v_adjTblOf", ("Vuna.Compiler.Elab.Termination.adjTblOf", "Vuna/Compiler/Elab/Termination.vuna:87"));
  ("Elab_dTermination.v_anyOwnTbl", ("Vuna.Compiler.Elab.Termination.anyOwnTbl", "Vuna/Compiler/Elab/Termination.vuna:600"));
  ("Elab_dTermination.v_applyCallFields", ("Vuna.Compiler.Elab.Termination.applyCallFields", "Vuna/Compiler/Elab/Termination.vuna:436"));
  ("Elab_dTermination.v_betterFail", ("Vuna.Compiler.Elab.Termination.betterFail", "Vuna/Compiler/Elab/Termination.vuna:489"));
  ("Elab_dTermination.v_callGraph", ("Vuna.Compiler.Elab.Termination.callGraph", "Vuna/Compiler/Elab/Termination.vuna:78"));
  ("Elab_dTermination.v_callMode", ("Vuna.Compiler.Elab.Termination.callMode", "Vuna/Compiler/Elab/Termination.vuna:615"));
  ("Elab_dTermination.v_cannotProveMsgEdges", ("Vuna.Compiler.Elab.Termination.cannotProveMsgEdges", "Vuna/Compiler/Elab/Termination.vuna:424"));
  ("Elab_dTermination.v_checkComp", ("Vuna.Compiler.Elab.Termination.checkComp", "Vuna/Compiler/Elab/Termination.vuna:528"));
  ("Elab_dTermination.v_checkSccsWith", ("Vuna.Compiler.Elab.Termination.checkSccsWith", "Vuna/Compiler/Elab/Termination.vuna:604"));
  ("Elab_dTermination.v_checkStrictGroup", ("Vuna.Compiler.Elab.Termination.checkStrictGroup", "Vuna/Compiler/Elab/Termination.vuna:517"));
  ("Elab_dTermination.v_checkTerminationDecls", ("Vuna.Compiler.Elab.Termination.checkTerminationDecls", "Vuna/Compiler/Elab/Termination.vuna:554"));
  ("Elab_dTermination.v_checkTerminationDeclsWith", ("Vuna.Compiler.Elab.Termination.checkTerminationDeclsWith", "Vuna/Compiler/Elab/Termination.vuna:565"));
  ("Elab_dTermination.v_checkTerminationGroups", ("Vuna.Compiler.Elab.Termination.checkTerminationGroups", "Vuna/Compiler/Elab/Termination.vuna:571"));
  ("Elab_dTermination.v_collectClauses", ("Vuna.Compiler.Elab.Termination.collectClauses", "Vuna/Compiler/Elab/Termination.vuna:444"));
  ("Elab_dTermination.v_collectComp", ("Vuna.Compiler.Elab.Termination.collectComp", "Vuna/Compiler/Elab/Termination.vuna:170"));
  ("Elab_dTermination.v_collectMeasure", ("Vuna.Compiler.Elab.Termination.collectMeasure", "Vuna/Compiler/Elab/Termination.vuna:455"));
  ("Elab_dTermination.v_computePosFactsWork", ("Vuna.Compiler.Elab.Termination.computePosFactsWork", "Vuna/Compiler/Elab/Termination.vuna:536"));
  ("Elab_dTermination.v_dedupTransposed", ("Vuna.Compiler.Elab.Termination.dedupTransposed", "Vuna/Compiler/Elab/Termination.vuna:129"));
  ("Elab_dTermination.v_dfsAll", ("Vuna.Compiler.Elab.Termination.dfsAll", "Vuna/Compiler/Elab/Termination.vuna:151"));
  ("Elab_dTermination.v_dfsPost", ("Vuna.Compiler.Elab.Termination.dfsPost", "Vuna/Compiler/Elab/Termination.vuna:141"));
  ("Elab_dTermination.v_dfunNames", ("Vuna.Compiler.Elab.Termination.dfunNames", "Vuna/Compiler/Elab/Termination.vuna:557"));
  ("Elab_dTermination.v_edgeCount", ("Vuna.Compiler.Elab.Termination.edgeCount", "Vuna/Compiler/Elab/Termination.vuna:133"));
  ("Elab_dTermination.v_edgeRankOf", ("Vuna.Compiler.Elab.Termination.edgeRankOf", "Vuna/Compiler/Elab/Termination.vuna:482"));
  ("Elab_dTermination.v_edgesRankOf", ("Vuna.Compiler.Elab.Termination.edgesRankOf", "Vuna/Compiler/Elab/Termination.vuna:485"));
  ("Elab_dTermination.v_emptyFail", ("Vuna.Compiler.Elab.Termination.emptyFail", "Vuna/Compiler/Elab/Termination.vuna:468"));
  ("Elab_dTermination.v_exprRefsB", ("Vuna.Compiler.Elab.Termination.exprRefsB", "Vuna/Compiler/Elab/Termination.vuna:41"));
  ("Elab_dTermination.v_graphFuel", ("Vuna.Compiler.Elab.Termination.graphFuel", "Vuna/Compiler/Elab/Termination.vuna:137"));
  ("Elab_dTermination.v_groupMessage", ("Vuna.Compiler.Elab.Termination.groupMessage", "Vuna/Compiler/Elab/Termination.vuna:418"));
  ("Elab_dTermination.v_hintEdge", ("Vuna.Compiler.Elab.Termination.hintEdge", "Vuna/Compiler/Elab/Termination.vuna:232"));
  ("Elab_dTermination.v_hintRankOf", ("Vuna.Compiler.Elab.Termination.hintRankOf", "Vuna/Compiler/Elab/Termination.vuna:472"));
  ("Elab_dTermination.v_mapEdges", ("Vuna.Compiler.Elab.Termination.mapEdges", "Vuna/Compiler/Elab/Termination.vuna:73"));
  ("Elab_dTermination.v_patNames", ("Vuna.Compiler.Elab.Termination.patNames", "Vuna/Compiler/Elab/Termination.vuna:15"));
  ("Elab_dTermination.v_patsNames", ("Vuna.Compiler.Elab.Termination.patsNames", "Vuna/Compiler/Elab/Termination.vuna:23"));
  ("Elab_dTermination.v_postOrder", ("Vuna.Compiler.Elab.Termination.postOrder", "Vuna/Compiler/Elab/Termination.vuna:163"));
  ("Elab_dTermination.v_refsOfDef", ("Vuna.Compiler.Elab.Termination.refsOfDef", "Vuna/Compiler/Elab/Termination.vuna:70"));
  ("Elab_dTermination.v_refsOfStmt", ("Vuna.Compiler.Elab.Termination.refsOfStmt", "Vuna/Compiler/Elab/Termination.vuna:26"));
  ("Elab_dTermination.v_refsOfStmts", ("Vuna.Compiler.Elab.Termination.refsOfStmts", "Vuna/Compiler/Elab/Termination.vuna:33"));
  ("Elab_dTermination.v_replacePair", ("Vuna.Compiler.Elab.Termination.replacePair", "Vuna/Compiler/Elab/Termination.vuna:105"));
  ("Elab_dTermination.v_reverseAdjOf", ("Vuna.Compiler.Elab.Termination.reverseAdjOf", "Vuna/Compiler/Elab/Termination.vuna:91"));
  ("Elab_dTermination.v_sccOf", ("Vuna.Compiler.Elab.Termination.sccOf", "Vuna/Compiler/Elab/Termination.vuna:186"));
  ("Elab_dTermination.v_strClause", ("Vuna.Compiler.Elab.Termination.strClause", "Vuna/Compiler/Elab/Termination.vuna:401"));
  ("Elab_dTermination.v_strWalk", ("Vuna.Compiler.Elab.Termination.strWalk", "Vuna/Compiler/Elab/Termination.vuna:200"));
  ("Elab_dTermination.v_strWalkAlts", ("Vuna.Compiler.Elab.Termination.strWalkAlts", "Vuna/Compiler/Elab/Termination.vuna:328"));
  ("Elab_dTermination.v_strWalkApp", ("Vuna.Compiler.Elab.Termination.strWalkApp", "Vuna/Compiler/Elab/Termination.vuna:290"));
  ("Elab_dTermination.v_strWalkArgs", ("Vuna.Compiler.Elab.Termination.strWalkArgs", "Vuna/Compiler/Elab/Termination.vuna:308"));
  ("Elab_dTermination.v_strWalkBinds", ("Vuna.Compiler.Elab.Termination.strWalkBinds", "Vuna/Compiler/Elab/Termination.vuna:349"));
  ("Elab_dTermination.v_strWalkEApp", ("Vuna.Compiler.Elab.Termination.strWalkEApp", "Vuna/Compiler/Elab/Termination.vuna:238"));
  ("Elab_dTermination.v_strWalkEAppMap", ("Vuna.Compiler.Elab.Termination.strWalkEAppMap", "Vuna/Compiler/Elab/Termination.vuna:263"));
  ("Elab_dTermination.v_strWalkFields", ("Vuna.Compiler.Elab.Termination.strWalkFields", "Vuna/Compiler/Elab/Termination.vuna:369"));
  ("Elab_dTermination.v_strWalkMapPartialInline", ("Vuna.Compiler.Elab.Termination.strWalkMapPartialInline", "Vuna/Compiler/Elab/Termination.vuna:276"));
  ("Elab_dTermination.v_strWalkStmts", ("Vuna.Compiler.Elab.Termination.strWalkStmts", "Vuna/Compiler/Elab/Termination.vuna:389"));
  ("Elab_dTermination.v_transpose", ("Vuna.Compiler.Elab.Termination.transpose", "Vuna/Compiler/Elab/Termination.vuna:126"));
  ("Elab_dTermination.v_transposeGo", ("Vuna.Compiler.Elab.Termination.transposeGo", "Vuna/Compiler/Elab/Termination.vuna:122"));
  ("Elab_dTermination.v_tryMeasure", ("Vuna.Compiler.Elab.Termination.tryMeasure", "Vuna/Compiler/Elab/Termination.vuna:496"));
  ("Elab_dTermination.v_tryMeasureGo", ("Vuna.Compiler.Elab.Termination.tryMeasureGo", "Vuna/Compiler/Elab/Termination.vuna:500"));
  ("Elab_dTermination_dElabInput.v_altPattern", ("Vuna.Compiler.Elab.Termination.ElabInput.altPattern", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:314"));
  ("Elab_dTermination_dElabInput.v_appGlobal", ("Vuna.Compiler.Elab.Termination.ElabInput.appGlobal", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:332"));
  ("Elab_dTermination_dElabInput.v_appHeadVar", ("Vuna.Compiler.Elab.Termination.ElabInput.appHeadVar", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:473"));
  ("Elab_dTermination_dElabInput.v_applyAcc", ("Vuna.Compiler.Elab.Termination.ElabInput.applyAcc", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:325"));
  ("Elab_dTermination_dElabInput.v_applyNamed", ("Vuna.Compiler.Elab.Termination.ElabInput.applyNamed", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:359"));
  ("Elab_dTermination_dElabInput.v_convAlts", ("Vuna.Compiler.Elab.Termination.ElabInput.convAlts", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:309"));
  ("Elab_dTermination_dElabInput.v_convArgs", ("Vuna.Compiler.Elab.Termination.ElabInput.convArgs", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:304"));
  ("Elab_dTermination_dElabInput.v_convBinders", ("Vuna.Compiler.Elab.Termination.ElabInput.convBinders", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:320"));
  ("Elab_dTermination_dElabInput.v_convExpr", ("Vuna.Compiler.Elab.Termination.ElabInput.convExpr", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:254"));
  ("Elab_dTermination_dElabInput.v_convGo", ("Vuna.Compiler.Elab.Termination.ElabInput.convGo", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:257"));
  ("Elab_dTermination_dElabInput.v_convLeaf", ("Vuna.Compiler.Elab.Termination.ElabInput.convLeaf", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:279"));
  ("Elab_dTermination_dElabInput.v_defShape", ("Vuna.Compiler.Elab.Termination.ElabInput.defShape", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:207"));
  ("Elab_dTermination_dElabInput.v_dictFieldGroups", ("Vuna.Compiler.Elab.Termination.ElabInput.dictFieldGroups", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:136"));
  ("Elab_dTermination_dElabInput.v_dictFieldGroupsGo", ("Vuna.Compiler.Elab.Termination.ElabInput.dictFieldGroupsGo", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:139"));
  ("Elab_dTermination_dElabInput.v_dictFieldsOf", ("Vuna.Compiler.Elab.Termination.ElabInput.dictFieldsOf", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:127"));
  ("Elab_dTermination_dElabInput.v_dictGroupKey", ("Vuna.Compiler.Elab.Termination.ElabInput.dictGroupKey", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:38"));
  ("Elab_dTermination_dElabInput.v_dictSymbolOf", ("Vuna.Compiler.Elab.Termination.ElabInput.dictSymbolOf", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:169"));
  ("Elab_dTermination_dElabInput.v_dictSymbolsOf", ("Vuna.Compiler.Elab.Termination.ElabInput.dictSymbolsOf", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:166"));
  ("Elab_dTermination_dElabInput.v_dropCount", ("Vuna.Compiler.Elab.Termination.ElabInput.dropCount", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:438"));
  ("Elab_dTermination_dElabInput.v_dropGo", ("Vuna.Compiler.Elab.Termination.ElabInput.dropGo", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:441"));
  ("Elab_dTermination_dElabInput.v_elabTermInput", ("Vuna.Compiler.Elab.Termination.ElabInput.elabTermInput", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:90"));
  ("Elab_dTermination_dElabInput.v_fieldIndexOfVar", ("Vuna.Compiler.Elab.Termination.ElabInput.fieldIndexOfVar", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:479"));
  ("Elab_dTermination_dElabInput.v_fieldMetaName", ("Vuna.Compiler.Elab.Termination.ElabInput.fieldMetaName", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:383"));
  ("Elab_dTermination_dElabInput.v_fieldNameAt", ("Vuna.Compiler.Elab.Termination.ElabInput.fieldNameAt", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:400"));
  ("Elab_dTermination_dElabInput.v_fieldVarPrefix", ("Vuna.Compiler.Elab.Termination.ElabInput.fieldVarPrefix", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:486"));
  ("Elab_dTermination_dElabInput.v_grNameOf", ("Vuna.Compiler.Elab.Termination.ElabInput.grNameOf", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:86"));
  ("Elab_dTermination_dElabInput.v_groupToDecl", ("Vuna.Compiler.Elab.Termination.ElabInput.groupToDecl", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:100"));
  ("Elab_dTermination_dElabInput.v_groupsOfDef", ("Vuna.Compiler.Elab.Termination.ElabInput.groupsOfDef", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:103"));
  ("Elab_dTermination_dElabInput.v_groupsOfDefGo", ("Vuna.Compiler.Elab.Termination.ElabInput.groupsOfDefGo", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:110"));
  ("Elab_dTermination_dElabInput.v_lookupClassByName", ("Vuna.Compiler.Elab.Termination.ElabInput.lookupClassByName", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:195"));
  ("Elab_dTermination_dElabInput.v_lookupCtorClass", ("Vuna.Compiler.Elab.Termination.ElabInput.lookupCtorClass", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:186"));
  ("Elab_dTermination_dElabInput.v_lookupDictClass", ("Vuna.Compiler.Elab.Termination.ElabInput.lookupDictClass", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:189"));
  ("Elab_dTermination_dElabInput.v_lookupDictCtor", ("Vuna.Compiler.Elab.Termination.ElabInput.lookupDictCtor", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:181"));
  ("Elab_dTermination_dElabInput.v_lookupFieldNames", ("Vuna.Compiler.Elab.Termination.ElabInput.lookupFieldNames", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:409"));
  ("Elab_dTermination_dElabInput.v_lookupProjEntry", ("Vuna.Compiler.Elab.Termination.ElabInput.lookupProjEntry", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:200"));
  ("Elab_dTermination_dElabInput.v_lookupShape", ("Vuna.Compiler.Elab.Termination.ElabInput.lookupShape", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:227"));
  ("Elab_dTermination_dElabInput.v_nestApp", ("Vuna.Compiler.Elab.Termination.ElabInput.nestApp", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:375"));
  ("Elab_dTermination_dElabInput.v_nthAt", ("Vuna.Compiler.Elab.Termination.ElabInput.nthAt", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:427"));
  ("Elab_dTermination_dElabInput.v_parseNat", ("Vuna.Compiler.Elab.Termination.ElabInput.parseNat", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:489"));
  ("Elab_dTermination_dElabInput.v_parseNatGo", ("Vuna.Compiler.Elab.Termination.ElabInput.parseNatGo", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:492"));
  ("Elab_dTermination_dElabInput.v_peNameOf", ("Vuna.Compiler.Elab.Termination.ElabInput.peNameOf", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:52"));
  ("Elab_dTermination_dElabInput.v_peelLams", ("Vuna.Compiler.Elab.Termination.ElabInput.peelLams", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:423"));
  ("Elab_dTermination_dElabInput.v_peelToCase", ("Vuna.Compiler.Elab.Termination.ElabInput.peelToCase", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:468"));
  ("Elab_dTermination_dElabInput.v_projectionShape", ("Vuna.Compiler.Elab.Termination.ElabInput.projectionShape", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:455"));
  ("Elab_dTermination_dElabInput.v_projectionTable", ("Vuna.Compiler.Elab.Termination.ElabInput.projectionTable", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:448"));
  ("Elab_dTermination_dElabInput.v_recordFieldTable", ("Vuna.Compiler.Elab.Termination.ElabInput.recordFieldTable", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:389"));
  ("Elab_dTermination_dElabInput.v_shapeGo", ("Vuna.Compiler.Elab.Termination.ElabInput.shapeGo", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:219"));
  ("Elab_dTermination_dElabInput.v_shapeOfTy", ("Vuna.Compiler.Elab.Termination.ElabInput.shapeOfTy", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:216"));
  ("Elab_dTermination_dElabInput.v_stripGo", ("Vuna.Compiler.Elab.Termination.ElabInput.stripGo", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:237"));
  ("Elab_dTermination_dElabInput.v_stripLeading", ("Vuna.Compiler.Elab.Termination.ElabInput.stripLeading", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:234"));
  ("Elab_dTermination_dElabInput.v_tagApply", ("Vuna.Compiler.Elab.Termination.ElabInput.tagApply", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:329"));
  ("Elab_dTermination_dElabInput.v_takeCount", ("Vuna.Compiler.Elab.Termination.ElabInput.takeCount", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:431"));
  ("Elab_dTermination_dElabInput.v_takeGo", ("Vuna.Compiler.Elab.Termination.ElabInput.takeGo", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:434"));
  ("Elab_dTermination_dElabInput.v_teleName", ("Vuna.Compiler.Elab.Termination.ElabInput.teleName", "Vuna/Compiler/Elab/Termination/ElabInput.vuna:414"));
  ("Elab_dTermination_dMeasure.v_addEdgeMode", ("Vuna.Compiler.Elab.Termination.Measure.addEdgeMode", "Vuna/Compiler/Elab/Termination/Measure.vuna:1271"));
  ("Elab_dTermination_dMeasure.v_allEqTo", ("Vuna.Compiler.Elab.Termination.Measure.allEqTo", "Vuna/Compiler/Elab/Termination/Measure.vuna:19"));
  ("Elab_dTermination_dMeasure.v_allSame", ("Vuna.Compiler.Elab.Termination.Measure.allSame", "Vuna/Compiler/Elab/Termination/Measure.vuna:23"));
  ("Elab_dTermination_dMeasure.v_argParamIndices", ("Vuna.Compiler.Elab.Termination.Measure.argParamIndices", "Vuna/Compiler/Elab/Termination/Measure.vuna:174"));
  ("Elab_dTermination_dMeasure.v_argPositive", ("Vuna.Compiler.Elab.Termination.Measure.argPositive", "Vuna/Compiler/Elab/Termination/Measure.vuna:626"));
  ("Elab_dTermination_dMeasure.v_argRel", ("Vuna.Compiler.Elab.Termination.Measure.argRel", "Vuna/Compiler/Elab/Termination/Measure.vuna:1224"));
  ("Elab_dTermination_dMeasure.v_argRelHint", ("Vuna.Compiler.Elab.Termination.Measure.argRelHint", "Vuna/Compiler/Elab/Termination/Measure.vuna:1232"));
  ("Elab_dTermination_dMeasure.v_argsAt", ("Vuna.Compiler.Elab.Termination.Measure.argsAt", "Vuna/Compiler/Elab/Termination/Measure.vuna:240"));
  ("Elab_dTermination_dMeasure.v_arithMinus", ("Vuna.Compiler.Elab.Termination.Measure.arithMinus", "Vuna/Compiler/Elab/Termination/Measure.vuna:1137"));
  ("Elab_dTermination_dMeasure.v_arithMinusBase", ("Vuna.Compiler.Elab.Termination.Measure.arithMinusBase", "Vuna/Compiler/Elab/Termination/Measure.vuna:1164"));
  ("Elab_dTermination_dMeasure.v_arithRel", ("Vuna.Compiler.Elab.Termination.Measure.arithRel", "Vuna/Compiler/Elab/Termination/Measure.vuna:1121"));
  ("Elab_dTermination_dMeasure.v_clausesOfDef", ("Vuna.Compiler.Elab.Termination.Measure.clausesOfDef", "Vuna/Compiler/Elab/Termination/Measure.vuna:328"));
  ("Elab_dTermination_dMeasure.v_clausesOfDefTbl", ("Vuna.Compiler.Elab.Termination.Measure.clausesOfDefTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:333"));
  ("Elab_dTermination_dMeasure.v_cmpOpOf", ("Vuna.Compiler.Elab.Termination.Measure.cmpOpOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:445"));
  ("Elab_dTermination_dMeasure.v_computePosFacts", ("Vuna.Compiler.Elab.Termination.Measure.computePosFacts", "Vuna/Compiler/Elab/Termination/Measure.vuna:906"));
  ("Elab_dTermination_dMeasure.v_computePosFactsStep", ("Vuna.Compiler.Elab.Termination.Measure.computePosFactsStep", "Vuna/Compiler/Elab/Termination/Measure.vuna:909"));
  ("Elab_dTermination_dMeasure.v_ctorNameOf", ("Vuna.Compiler.Elab.Termination.Measure.ctorNameOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:357"));
  ("Elab_dTermination_dMeasure.v_ctorNamesOf", ("Vuna.Compiler.Elab.Termination.Measure.ctorNamesOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:348"));
  ("Elab_dTermination_dMeasure.v_dedup", ("Vuna.Compiler.Elab.Termination.Measure.dedup", "Vuna/Compiler/Elab/Termination/Measure.vuna:28"));
  ("Elab_dTermination_dMeasure.v_dedupInts", ("Vuna.Compiler.Elab.Termination.Measure.dedupInts", "Vuna/Compiler/Elab/Termination/Measure.vuna:664"));
  ("Elab_dTermination_dMeasure.v_defArity", ("Vuna.Compiler.Elab.Termination.Measure.defArity", "Vuna/Compiler/Elab/Termination/Measure.vuna:339"));
  ("Elab_dTermination_dMeasure.v_defNames", ("Vuna.Compiler.Elab.Termination.Measure.defNames", "Vuna/Compiler/Elab/Termination/Measure.vuna:144"));
  ("Elab_dTermination_dMeasure.v_edgeStrict", ("Vuna.Compiler.Elab.Termination.Measure.edgeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:1367"));
  ("Elab_dTermination_dMeasure.v_edgeStrictGo", ("Vuna.Compiler.Elab.Termination.Measure.edgeStrictGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:1370"));
  ("Elab_dTermination_dMeasure.v_edgeTargets", ("Vuna.Compiler.Elab.Termination.Measure.edgeTargets", "Vuna/Compiler/Elab/Termination/Measure.vuna:1381"));
  ("Elab_dTermination_dMeasure.v_edgeTargetsGo", ("Vuna.Compiler.Elab.Termination.Measure.edgeTargetsGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:1384"));
  ("Elab_dTermination_dMeasure.v_expandForwarders", ("Vuna.Compiler.Elab.Termination.Measure.expandForwarders", "Vuna/Compiler/Elab/Termination/Measure.vuna:322"));
  ("Elab_dTermination_dMeasure.v_extendByBinds", ("Vuna.Compiler.Elab.Termination.Measure.extendByBinds", "Vuna/Compiler/Elab/Termination/Measure.vuna:415"));
  ("Elab_dTermination_dMeasure.v_extendElemSizes", ("Vuna.Compiler.Elab.Termination.Measure.extendElemSizes", "Vuna/Compiler/Elab/Termination/Measure.vuna:1358"));
  ("Elab_dTermination_dMeasure.v_extendSizesStrict", ("Vuna.Compiler.Elab.Termination.Measure.extendSizesStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:399"));
  ("Elab_dTermination_dMeasure.v_extendSizesVarOnly", ("Vuna.Compiler.Elab.Termination.Measure.extendSizesVarOnly", "Vuna/Compiler/Elab/Termination/Measure.vuna:707"));
  ("Elab_dTermination_dMeasure.v_fieldEntryIndex", ("Vuna.Compiler.Elab.Termination.Measure.fieldEntryIndex", "Vuna/Compiler/Elab/Termination/Measure.vuna:986"));
  ("Elab_dTermination_dMeasure.v_fieldEntryName", ("Vuna.Compiler.Elab.Termination.Measure.fieldEntryName", "Vuna/Compiler/Elab/Termination/Measure.vuna:983"));
  ("Elab_dTermination_dMeasure.v_fieldIndexOf", ("Vuna.Compiler.Elab.Termination.Measure.fieldIndexOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:1038"));
  ("Elab_dTermination_dMeasure.v_fieldIndexOfEntries", ("Vuna.Compiler.Elab.Termination.Measure.fieldIndexOfEntries", "Vuna/Compiler/Elab/Termination/Measure.vuna:1013"));
  ("Elab_dTermination_dMeasure.v_fieldNameOfField", ("Vuna.Compiler.Elab.Termination.Measure.fieldNameOfField", "Vuna/Compiler/Elab/Termination/Measure.vuna:989"));
  ("Elab_dTermination_dMeasure.v_fieldProjPath", ("Vuna.Compiler.Elab.Termination.Measure.fieldProjPath", "Vuna/Compiler/Elab/Termination/Measure.vuna:1047"));
  ("Elab_dTermination_dMeasure.v_fieldProjPrefix", ("Vuna.Compiler.Elab.Termination.Measure.fieldProjPrefix", "Vuna/Compiler/Elab/Termination/Measure.vuna:980"));
  ("Elab_dTermination_dMeasure.v_fieldProjectionsGo", ("Vuna.Compiler.Elab.Termination.Measure.fieldProjectionsGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:1027"));
  ("Elab_dTermination_dMeasure.v_fieldProjectionsOf", ("Vuna.Compiler.Elab.Termination.Measure.fieldProjectionsOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:1019"));
  ("Elab_dTermination_dMeasure.v_fieldsSizeStrict", ("Vuna.Compiler.Elab.Termination.Measure.fieldsSizeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:374"));
  ("Elab_dTermination_dMeasure.v_filterModes", ("Vuna.Compiler.Elab.Termination.Measure.filterModes", "Vuna/Compiler/Elab/Termination/Measure.vuna:1468"));
  ("Elab_dTermination_dMeasure.v_findWrapField", ("Vuna.Compiler.Elab.Termination.Measure.findWrapField", "Vuna/Compiler/Elab/Termination/Measure.vuna:1087"));
  ("Elab_dTermination_dMeasure.v_foldLHofSpec", ("Vuna.Compiler.Elab.Termination.Measure.foldLHofSpec", "Vuna/Compiler/Elab/Termination/Measure.vuna:1301"));
  ("Elab_dTermination_dMeasure.v_foldRHofSpec", ("Vuna.Compiler.Elab.Termination.Measure.foldRHofSpec", "Vuna/Compiler/Elab/Termination/Measure.vuna:1304"));
  ("Elab_dTermination_dMeasure.v_forwarderOfClause", ("Vuna.Compiler.Elab.Termination.Measure.forwarderOfClause", "Vuna/Compiler/Elab/Termination/Measure.vuna:187"));
  ("Elab_dTermination_dMeasure.v_forwarderOfGroup", ("Vuna.Compiler.Elab.Termination.Measure.forwarderOfGroup", "Vuna/Compiler/Elab/Termination/Measure.vuna:219"));
  ("Elab_dTermination_dMeasure.v_forwardersOf", ("Vuna.Compiler.Elab.Termination.Measure.forwardersOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:233"));
  ("Elab_dTermination_dMeasure.v_forwardersOfDefs", ("Vuna.Compiler.Elab.Termination.Measure.forwardersOfDefs", "Vuna/Compiler/Elab/Termination/Measure.vuna:226"));
  ("Elab_dTermination_dMeasure.v_funDeclsOf", ("Vuna.Compiler.Elab.Termination.Measure.funDeclsOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:101"));
  ("Elab_dTermination_dMeasure.v_fwAlts", ("Vuna.Compiler.Elab.Termination.Measure.fwAlts", "Vuna/Compiler/Elab/Termination/Measure.vuna:262"));
  ("Elab_dTermination_dMeasure.v_fwArgs", ("Vuna.Compiler.Elab.Termination.Measure.fwArgs", "Vuna/Compiler/Elab/Termination/Measure.vuna:250"));
  ("Elab_dTermination_dMeasure.v_fwBinds", ("Vuna.Compiler.Elab.Termination.Measure.fwBinds", "Vuna/Compiler/Elab/Termination/Measure.vuna:258"));
  ("Elab_dTermination_dMeasure.v_fwClauses", ("Vuna.Compiler.Elab.Termination.Measure.fwClauses", "Vuna/Compiler/Elab/Termination/Measure.vuna:266"));
  ("Elab_dTermination_dMeasure.v_fwDecl", ("Vuna.Compiler.Elab.Termination.Measure.fwDecl", "Vuna/Compiler/Elab/Termination/Measure.vuna:316"));
  ("Elab_dTermination_dMeasure.v_fwExpr", ("Vuna.Compiler.Elab.Termination.Measure.fwExpr", "Vuna/Compiler/Elab/Termination/Measure.vuna:285"));
  ("Elab_dTermination_dMeasure.v_fwFields", ("Vuna.Compiler.Elab.Termination.Measure.fwFields", "Vuna/Compiler/Elab/Termination/Measure.vuna:254"));
  ("Elab_dTermination_dMeasure.v_fwParts", ("Vuna.Compiler.Elab.Termination.Measure.fwParts", "Vuna/Compiler/Elab/Termination/Measure.vuna:278"));
  ("Elab_dTermination_dMeasure.v_fwStmts", ("Vuna.Compiler.Elab.Termination.Measure.fwStmts", "Vuna/Compiler/Elab/Termination/Measure.vuna:270"));
  ("Elab_dTermination_dMeasure.v_groupDefs", ("Vuna.Compiler.Elab.Termination.Measure.groupDefs", "Vuna/Compiler/Elab/Termination/Measure.vuna:120"));
  ("Elab_dTermination_dMeasure.v_groupDefsGo", ("Vuna.Compiler.Elab.Termination.Measure.groupDefsGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:137"));
  ("Elab_dTermination_dMeasure.v_groupHead", ("Vuna.Compiler.Elab.Termination.Measure.groupHead", "Vuna/Compiler/Elab/Termination/Measure.vuna:1274"));
  ("Elab_dTermination_dMeasure.v_guardElsePosAtom", ("Vuna.Compiler.Elab.Termination.Measure.guardElsePosAtom", "Vuna/Compiler/Elab/Termination/Measure.vuna:547"));
  ("Elab_dTermination_dMeasure.v_guardElsePosVars", ("Vuna.Compiler.Elab.Termination.Measure.guardElsePosVars", "Vuna/Compiler/Elab/Termination/Measure.vuna:597"));
  ("Elab_dTermination_dMeasure.v_guardGE", ("Vuna.Compiler.Elab.Termination.Measure.guardGE", "Vuna/Compiler/Elab/Termination/Measure.vuna:475"));
  ("Elab_dTermination_dMeasure.v_guardInter", ("Vuna.Compiler.Elab.Termination.Measure.guardInter", "Vuna/Compiler/Elab/Termination/Measure.vuna:516"));
  ("Elab_dTermination_dMeasure.v_guardLE", ("Vuna.Compiler.Elab.Termination.Measure.guardLE", "Vuna/Compiler/Elab/Termination/Measure.vuna:466"));
  ("Elab_dTermination_dMeasure.v_guardLT", ("Vuna.Compiler.Elab.Termination.Measure.guardLT", "Vuna/Compiler/Elab/Termination/Measure.vuna:484"));
  ("Elab_dTermination_dMeasure.v_guardPosVar", ("Vuna.Compiler.Elab.Termination.Measure.guardPosVar", "Vuna/Compiler/Elab/Termination/Measure.vuna:427"));
  ("Elab_dTermination_dMeasure.v_guardThenPosAtom", ("Vuna.Compiler.Elab.Termination.Measure.guardThenPosAtom", "Vuna/Compiler/Elab/Termination/Measure.vuna:521"));
  ("Elab_dTermination_dMeasure.v_guardThenPosVars", ("Vuna.Compiler.Elab.Termination.Measure.guardThenPosVars", "Vuna/Compiler/Elab/Termination/Measure.vuna:574"));
  ("Elab_dTermination_dMeasure.v_guardUnion", ("Vuna.Compiler.Elab.Termination.Measure.guardUnion", "Vuna/Compiler/Elab/Termination/Measure.vuna:513"));
  ("Elab_dTermination_dMeasure.v_hasWeakCycle", ("Vuna.Compiler.Elab.Termination.Measure.hasWeakCycle", "Vuna/Compiler/Elab/Termination/Measure.vuna:1411"));
  ("Elab_dTermination_dMeasure.v_hasWeakCycleGo", ("Vuna.Compiler.Elab.Termination.Measure.hasWeakCycleGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:1414"));
  ("Elab_dTermination_dMeasure.v_hintArith", ("Vuna.Compiler.Elab.Termination.Measure.hintArith", "Vuna/Compiler/Elab/Termination/Measure.vuna:1256"));
  ("Elab_dTermination_dMeasure.v_hofLambdaCall", ("Vuna.Compiler.Elab.Termination.Measure.hofLambdaCall", "Vuna/Compiler/Elab/Termination/Measure.vuna:1342"));
  ("Elab_dTermination_dMeasure.v_hofSpecOf", ("Vuna.Compiler.Elab.Termination.Measure.hofSpecOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:1307"));
  ("Elab_dTermination_dMeasure.v_isAddOpName", ("Vuna.Compiler.Elab.Termination.Measure.isAddOpName", "Vuna/Compiler/Elab/Termination/Measure.vuna:1134"));
  ("Elab_dTermination_dMeasure.v_isDescent", ("Vuna.Compiler.Elab.Termination.Measure.isDescent", "Vuna/Compiler/Elab/Termination/Measure.vuna:1465"));
  ("Elab_dTermination_dMeasure.v_isFalseLit", ("Vuna.Compiler.Elab.Termination.Measure.isFalseLit", "Vuna/Compiler/Elab/Termination/Measure.vuna:621"));
  ("Elab_dTermination_dMeasure.v_isNatCoerceName", ("Vuna.Compiler.Elab.Termination.Measure.isNatCoerceName", "Vuna/Compiler/Elab/Termination/Measure.vuna:499"));
  ("Elab_dTermination_dMeasure.v_isSubOpName", ("Vuna.Compiler.Elab.Termination.Measure.isSubOpName", "Vuna/Compiler/Elab/Termination/Measure.vuna:1129"));
  ("Elab_dTermination_dMeasure.v_isTrueLit", ("Vuna.Compiler.Elab.Termination.Measure.isTrueLit", "Vuna/Compiler/Elab/Termination/Measure.vuna:617"));
  ("Elab_dTermination_dMeasure.v_joinComma", ("Vuna.Compiler.Elab.Termination.Measure.joinComma", "Vuna/Compiler/Elab/Termination/Measure.vuna:31"));
  ("Elab_dTermination_dMeasure.v_lastOf", ("Vuna.Compiler.Elab.Termination.Measure.lastOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:1195"));
  ("Elab_dTermination_dMeasure.v_lastTwo", ("Vuna.Compiler.Elab.Termination.Measure.lastTwo", "Vuna/Compiler/Elab/Termination/Measure.vuna:458"));
  ("Elab_dTermination_dMeasure.v_lastTwoGo", ("Vuna.Compiler.Elab.Termination.Measure.lastTwoGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:462"));
  ("Elab_dTermination_dMeasure.v_localClauseBinds", ("Vuna.Compiler.Elab.Termination.Measure.localClauseBinds", "Vuna/Compiler/Elab/Termination/Measure.vuna:507"));
  ("Elab_dTermination_dMeasure.v_lookupForwarder", ("Vuna.Compiler.Elab.Termination.Measure.lookupForwarder", "Vuna/Compiler/Elab/Termination/Measure.vuna:236"));
  ("Elab_dTermination_dMeasure.v_lookupGroup", ("Vuna.Compiler.Elab.Termination.Measure.lookupGroup", "Vuna/Compiler/Elab/Termination/Measure.vuna:111"));
  ("Elab_dTermination_dMeasure.v_markInvalid", ("Vuna.Compiler.Elab.Termination.Measure.markInvalid", "Vuna/Compiler/Elab/Termination/Measure.vuna:1268"));
  ("Elab_dTermination_dMeasure.v_matchForwarders", ("Vuna.Compiler.Elab.Termination.Measure.matchForwarders", "Vuna/Compiler/Elab/Termination/Measure.vuna:212"));
  ("Elab_dTermination_dMeasure.v_maxArityOf", ("Vuna.Compiler.Elab.Termination.Measure.maxArityOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:343"));
  ("Elab_dTermination_dMeasure.v_maxInt", ("Vuna.Compiler.Elab.Termination.Measure.maxInt", "Vuna/Compiler/Elab/Termination/Measure.vuna:12"));
  ("Elab_dTermination_dMeasure.v_memInt", ("Vuna.Compiler.Elab.Termination.Measure.memInt", "Vuna/Compiler/Elab/Termination/Measure.vuna:60"));
  ("Elab_dTermination_dMeasure.v_natLitOf", ("Vuna.Compiler.Elab.Termination.Measure.natLitOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:1147"));
  ("Elab_dTermination_dMeasure.v_notEmpty", ("Vuna.Compiler.Elab.Termination.Measure.notEmpty", "Vuna/Compiler/Elab/Termination/Measure.vuna:15"));
  ("Elab_dTermination_dMeasure.v_nthExpr", ("Vuna.Compiler.Elab.Termination.Measure.nthExpr", "Vuna/Compiler/Elab/Termination/Measure.vuna:1278"));
  ("Elab_dTermination_dMeasure.v_nthName", ("Vuna.Compiler.Elab.Termination.Measure.nthName", "Vuna/Compiler/Elab/Termination/Measure.vuna:1320"));
  ("Elab_dTermination_dMeasure.v_numberedFieldNames", ("Vuna.Compiler.Elab.Termination.Measure.numberedFieldNames", "Vuna/Compiler/Elab/Termination/Measure.vuna:992"));
  ("Elab_dTermination_dMeasure.v_opBaseName", ("Vuna.Compiler.Elab.Termination.Measure.opBaseName", "Vuna/Compiler/Elab/Termination/Measure.vuna:453"));
  ("Elab_dTermination_dMeasure.v_paramPositionOf", ("Vuna.Compiler.Elab.Termination.Measure.paramPositionOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:164"));
  ("Elab_dTermination_dMeasure.v_patSizeStrict", ("Vuna.Compiler.Elab.Termination.Measure.patSizeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:360"));
  ("Elab_dTermination_dMeasure.v_pathInFields", ("Vuna.Compiler.Elab.Termination.Measure.pathInFields", "Vuna/Compiler/Elab/Termination/Measure.vuna:926"));
  ("Elab_dTermination_dMeasure.v_pathInPat", ("Vuna.Compiler.Elab.Termination.Measure.pathInPat", "Vuna/Compiler/Elab/Termination/Measure.vuna:933"));
  ("Elab_dTermination_dMeasure.v_pathInPats", ("Vuna.Compiler.Elab.Termination.Measure.pathInPats", "Vuna/Compiler/Elab/Termination/Measure.vuna:919"));
  ("Elab_dTermination_dMeasure.v_patsSizeStrict", ("Vuna.Compiler.Elab.Termination.Measure.patsSizeStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:369"));
  ("Elab_dTermination_dMeasure.v_peelLam", ("Vuna.Compiler.Elab.Termination.Measure.peelLam", "Vuna/Compiler/Elab/Termination/Measure.vuna:1325"));
  ("Elab_dTermination_dMeasure.v_posAdd", ("Vuna.Compiler.Elab.Termination.Measure.posAdd", "Vuna/Compiler/Elab/Termination/Measure.vuna:64"));
  ("Elab_dTermination_dMeasure.v_posEntryPairs", ("Vuna.Compiler.Elab.Termination.Measure.posEntryPairs", "Vuna/Compiler/Elab/Termination/Measure.vuna:661"));
  ("Elab_dTermination_dMeasure.v_posFilter", ("Vuna.Compiler.Elab.Termination.Measure.posFilter", "Vuna/Compiler/Elab/Termination/Measure.vuna:74"));
  ("Elab_dTermination_dMeasure.v_posFilterTbl", ("Vuna.Compiler.Elab.Termination.Measure.posFilterTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:85"));
  ("Elab_dTermination_dMeasure.v_posHas", ("Vuna.Compiler.Elab.Termination.Measure.posHas", "Vuna/Compiler/Elab/Termination/Measure.vuna:37"));
  ("Elab_dTermination_dMeasure.v_posHasTbl", ("Vuna.Compiler.Elab.Termination.Measure.posHasTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:54"));
  ("Elab_dTermination_dMeasure.v_posMarkNeg", ("Vuna.Compiler.Elab.Termination.Measure.posMarkNeg", "Vuna/Compiler/Elab/Termination/Measure.vuna:651"));
  ("Elab_dTermination_dMeasure.v_posMarkPos", ("Vuna.Compiler.Elab.Termination.Measure.posMarkPos", "Vuna/Compiler/Elab/Termination/Measure.vuna:648"));
  ("Elab_dTermination_dMeasure.v_posNormalize", ("Vuna.Compiler.Elab.Termination.Measure.posNormalize", "Vuna/Compiler/Elab/Termination/Measure.vuna:655"));
  ("Elab_dTermination_dMeasure.v_posScanClauses", ("Vuna.Compiler.Elab.Termination.Measure.posScanClauses", "Vuna/Compiler/Elab/Termination/Measure.vuna:870"));
  ("Elab_dTermination_dMeasure.v_posScanDefs", ("Vuna.Compiler.Elab.Termination.Measure.posScanDefs", "Vuna/Compiler/Elab/Termination/Measure.vuna:878"));
  ("Elab_dTermination_dMeasure.v_posScanNames", ("Vuna.Compiler.Elab.Termination.Measure.posScanNames", "Vuna/Compiler/Elab/Termination/Measure.vuna:889"));
  ("Elab_dTermination_dMeasure.v_posScanNamesGo", ("Vuna.Compiler.Elab.Termination.Measure.posScanNamesGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:895"));
  ("Elab_dTermination_dMeasure.v_posSetEq", ("Vuna.Compiler.Elab.Termination.Measure.posSetEq", "Vuna/Compiler/Elab/Termination/Measure.vuna:71"));
  ("Elab_dTermination_dMeasure.v_posSetEqTbl", ("Vuna.Compiler.Elab.Termination.Measure.posSetEqTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:94"));
  ("Elab_dTermination_dMeasure.v_posSubset", ("Vuna.Compiler.Elab.Termination.Measure.posSubset", "Vuna/Compiler/Elab/Termination/Measure.vuna:67"));
  ("Elab_dTermination_dMeasure.v_posSubsetTbl", ("Vuna.Compiler.Elab.Termination.Measure.posSubsetTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:90"));
  ("Elab_dTermination_dMeasure.v_posTblOf", ("Vuna.Compiler.Elab.Termination.Measure.posTblOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:44"));
  ("Elab_dTermination_dMeasure.v_posTblOfGo", ("Vuna.Compiler.Elab.Termination.Measure.posTblOfGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:47"));
  ("Elab_dTermination_dMeasure.v_posTblPairs", ("Vuna.Compiler.Elab.Termination.Measure.posTblPairs", "Vuna/Compiler/Elab/Termination/Measure.vuna:658"));
  ("Elab_dTermination_dMeasure.v_posUnion", ("Vuna.Compiler.Elab.Termination.Measure.posUnion", "Vuna/Compiler/Elab/Termination/Measure.vuna:79"));
  ("Elab_dTermination_dMeasure.v_posUnionTbl", ("Vuna.Compiler.Elab.Termination.Measure.posUnionTbl", "Vuna/Compiler/Elab/Termination/Measure.vuna:98"));
  ("Elab_dTermination_dMeasure.v_posVarIn", ("Vuna.Compiler.Elab.Termination.Measure.posVarIn", "Vuna/Compiler/Elab/Termination/Measure.vuna:1118"));
  ("Elab_dTermination_dMeasure.v_posWalk", ("Vuna.Compiler.Elab.Termination.Measure.posWalk", "Vuna/Compiler/Elab/Termination/Measure.vuna:768"));
  ("Elab_dTermination_dMeasure.v_posWalkAlts", ("Vuna.Compiler.Elab.Termination.Measure.posWalkAlts", "Vuna/Compiler/Elab/Termination/Measure.vuna:692"));
  ("Elab_dTermination_dMeasure.v_posWalkArgs", ("Vuna.Compiler.Elab.Termination.Measure.posWalkArgs", "Vuna/Compiler/Elab/Termination/Measure.vuna:668"));
  ("Elab_dTermination_dMeasure.v_posWalkBinds", ("Vuna.Compiler.Elab.Termination.Measure.posWalkBinds", "Vuna/Compiler/Elab/Termination/Measure.vuna:724"));
  ("Elab_dTermination_dMeasure.v_posWalkCallee", ("Vuna.Compiler.Elab.Termination.Measure.posWalkCallee", "Vuna/Compiler/Elab/Termination/Measure.vuna:856"));
  ("Elab_dTermination_dMeasure.v_posWalkCalleeGo", ("Vuna.Compiler.Elab.Termination.Measure.posWalkCalleeGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:860"));
  ("Elab_dTermination_dMeasure.v_posWalkClauses", ("Vuna.Compiler.Elab.Termination.Measure.posWalkClauses", "Vuna/Compiler/Elab/Termination/Measure.vuna:712"));
  ("Elab_dTermination_dMeasure.v_posWalkFields", ("Vuna.Compiler.Elab.Termination.Measure.posWalkFields", "Vuna/Compiler/Elab/Termination/Measure.vuna:680"));
  ("Elab_dTermination_dMeasure.v_posWalkStmts", ("Vuna.Compiler.Elab.Termination.Measure.posWalkStmts", "Vuna/Compiler/Elab/Termination/Measure.vuna:736"));
  ("Elab_dTermination_dMeasure.v_projHas", ("Vuna.Compiler.Elab.Termination.Measure.projHas", "Vuna/Compiler/Elab/Termination/Measure.vuna:1051"));
  ("Elab_dTermination_dMeasure.v_projRel", ("Vuna.Compiler.Elab.Termination.Measure.projRel", "Vuna/Compiler/Elab/Termination/Measure.vuna:1181"));
  ("Elab_dTermination_dMeasure.v_projectionOfDef", ("Vuna.Compiler.Elab.Termination.Measure.projectionOfDef", "Vuna/Compiler/Elab/Termination/Measure.vuna:940"));
  ("Elab_dTermination_dMeasure.v_projectionsOf", ("Vuna.Compiler.Elab.Termination.Measure.projectionsOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:968"));
  ("Elab_dTermination_dMeasure.v_pvarParamsOf", ("Vuna.Compiler.Elab.Termination.Measure.pvarParamsOf", "Vuna/Compiler/Elab/Termination/Measure.vuna:157"));
  ("Elab_dTermination_dMeasure.v_recordFieldEntries", ("Vuna.Compiler.Elab.Termination.Measure.recordFieldEntries", "Vuna/Compiler/Elab/Termination/Measure.vuna:996"));
  ("Elab_dTermination_dMeasure.v_relAscending", ("Vuna.Compiler.Elab.Termination.Measure.relAscending", "Vuna/Compiler/Elab/Termination/Measure.vuna:1442"));
  ("Elab_dTermination_dMeasure.v_relEqual", ("Vuna.Compiler.Elab.Termination.Measure.relEqual", "Vuna/Compiler/Elab/Termination/Measure.vuna:1421"));
  ("Elab_dTermination_dMeasure.v_relMissingGuard", ("Vuna.Compiler.Elab.Termination.Measure.relMissingGuard", "Vuna/Compiler/Elab/Termination/Measure.vuna:1433"));
  ("Elab_dTermination_dMeasure.v_relNoRelation", ("Vuna.Compiler.Elab.Termination.Measure.relNoRelation", "Vuna/Compiler/Elab/Termination/Measure.vuna:1436"));
  ("Elab_dTermination_dMeasure.v_relOfArg", ("Vuna.Compiler.Elab.Termination.Measure.relOfArg", "Vuna/Compiler/Elab/Termination/Measure.vuna:1202"));
  ("Elab_dTermination_dMeasure.v_relOtherPosition", ("Vuna.Compiler.Elab.Termination.Measure.relOtherPosition", "Vuna/Compiler/Elab/Termination/Measure.vuna:1439"));
  ("Elab_dTermination_dMeasure.v_relStrictMinus", ("Vuna.Compiler.Elab.Termination.Measure.relStrictMinus", "Vuna/Compiler/Elab/Termination/Measure.vuna:1427"));
  ("Elab_dTermination_dMeasure.v_relStrictSub", ("Vuna.Compiler.Elab.Termination.Measure.relStrictSub", "Vuna/Compiler/Elab/Termination/Measure.vuna:1424"));
  ("Elab_dTermination_dMeasure.v_relText", ("Vuna.Compiler.Elab.Termination.Measure.relText", "Vuna/Compiler/Elab/Termination/Measure.vuna:1446"));
  ("Elab_dTermination_dMeasure.v_relUnknownSize", ("Vuna.Compiler.Elab.Termination.Measure.relUnknownSize", "Vuna/Compiler/Elab/Termination/Measure.vuna:1430"));
  ("Elab_dTermination_dMeasure.v_replaceGroup", ("Vuna.Compiler.Elab.Termination.Measure.replaceGroup", "Vuna/Compiler/Elab/Termination/Measure.vuna:115"));
  ("Elab_dTermination_dMeasure.v_reprAlias", ("Vuna.Compiler.Elab.Termination.Measure.reprAlias", "Vuna/Compiler/Elab/Termination/Measure.vuna:1009"));
  ("Elab_dTermination_dMeasure.v_sameCtorApp", ("Vuna.Compiler.Elab.Termination.Measure.sameCtorApp", "Vuna/Compiler/Elab/Termination/Measure.vuna:1057"));
  ("Elab_dTermination_dMeasure.v_sameCtorField", ("Vuna.Compiler.Elab.Termination.Measure.sameCtorField", "Vuna/Compiler/Elab/Termination/Measure.vuna:1072"));
  ("Elab_dTermination_dMeasure.v_sameCtorGo", ("Vuna.Compiler.Elab.Termination.Measure.sameCtorGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:1060"));
  ("Elab_dTermination_dMeasure.v_sameForwarder", ("Vuna.Compiler.Elab.Termination.Measure.sameForwarder", "Vuna/Compiler/Elab/Termination/Measure.vuna:209"));
  ("Elab_dTermination_dMeasure.v_sameIntLists", ("Vuna.Compiler.Elab.Termination.Measure.sameIntLists", "Vuna/Compiler/Elab/Termination/Measure.vuna:204"));
  ("Elab_dTermination_dMeasure.v_sizeOfExpr", ("Vuna.Compiler.Elab.Termination.Measure.sizeOfExpr", "Vuna/Compiler/Elab/Termination/Measure.vuna:388"));
  ("Elab_dTermination_dMeasure.v_sizeOfVarStrict", ("Vuna.Compiler.Elab.Termination.Measure.sizeOfVarStrict", "Vuna/Compiler/Elab/Termination/Measure.vuna:420"));
  ("Elab_dTermination_dMeasure.v_strSizeEntries", ("Vuna.Compiler.Elab.Termination.Measure.strSizeEntries", "Vuna/Compiler/Elab/Termination/Measure.vuna:379"));
  ("Elab_dTermination_dMeasure.v_strSizeEntriesGo", ("Vuna.Compiler.Elab.Termination.Measure.strSizeEntriesGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:382"));
  ("Elab_dTermination_dMeasure.v_unaryHofSpec", ("Vuna.Compiler.Elab.Termination.Measure.unaryHofSpec", "Vuna/Compiler/Elab/Termination/Measure.vuna:1298"));
  ("Elab_dTermination_dMeasure.v_varOfExpr", ("Vuna.Compiler.Elab.Termination.Measure.varOfExpr", "Vuna/Compiler/Elab/Termination/Measure.vuna:493"));
  ("Elab_dTermination_dMeasure.v_weakAdj", ("Vuna.Compiler.Elab.Termination.Measure.weakAdj", "Vuna/Compiler/Elab/Termination/Measure.vuna:1390"));
  ("Elab_dTermination_dMeasure.v_weakAdjGo", ("Vuna.Compiler.Elab.Termination.Measure.weakAdjGo", "Vuna/Compiler/Elab/Termination/Measure.vuna:1393"));
  ("Elab_dTermination_dMeasure.v_weakReach", ("Vuna.Compiler.Elab.Termination.Measure.weakReach", "Vuna/Compiler/Elab/Termination/Measure.vuna:1398"));
  ("Elab_dTermination_dMeasure.v_weakReachFuel", ("Vuna.Compiler.Elab.Termination.Measure.weakReachFuel", "Vuna/Compiler/Elab/Termination/Measure.vuna:1401"));
  ("Elab_dTermination_dMeasure.v_wrapCheck", ("Vuna.Compiler.Elab.Termination.Measure.wrapCheck", "Vuna/Compiler/Elab/Termination/Measure.vuna:1105"));
  ("Elab_dTermination_dScc.v_aliasNameOf", ("Vuna.Compiler.Elab.Termination.Scc.aliasNameOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:200"));
  ("Elab_dTermination_dScc.v_aliasOf", ("Vuna.Compiler.Elab.Termination.Scc.aliasOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:211"));
  ("Elab_dTermination_dScc.v_allWeakEdges", ("Vuna.Compiler.Elab.Termination.Scc.allWeakEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:954"));
  ("Elab_dTermination_dScc.v_anyAltFuelGuard", ("Vuna.Compiler.Elab.Termination.Scc.anyAltFuelGuard", "Vuna/Compiler/Elab/Termination/Scc.vuna:835"));
  ("Elab_dTermination_dScc.v_anyBindFuelGuard", ("Vuna.Compiler.Elab.Termination.Scc.anyBindFuelGuard", "Vuna/Compiler/Elab/Termination/Scc.vuna:840"));
  ("Elab_dTermination_dScc.v_argBases", ("Vuna.Compiler.Elab.Termination.Scc.argBases", "Vuna/Compiler/Elab/Termination/Scc.vuna:522"));
  ("Elab_dTermination_dScc.v_argBasesAlts", ("Vuna.Compiler.Elab.Termination.Scc.argBasesAlts", "Vuna/Compiler/Elab/Termination/Scc.vuna:606"));
  ("Elab_dTermination_dScc.v_argBasesArgs", ("Vuna.Compiler.Elab.Termination.Scc.argBasesArgs", "Vuna/Compiler/Elab/Termination/Scc.vuna:591"));
  ("Elab_dTermination_dScc.v_argBasesBinds", ("Vuna.Compiler.Elab.Termination.Scc.argBasesBinds", "Vuna/Compiler/Elab/Termination/Scc.vuna:601"));
  ("Elab_dTermination_dScc.v_argBasesClauses", ("Vuna.Compiler.Elab.Termination.Scc.argBasesClauses", "Vuna/Compiler/Elab/Termination/Scc.vuna:611"));
  ("Elab_dTermination_dScc.v_argBasesFields", ("Vuna.Compiler.Elab.Termination.Scc.argBasesFields", "Vuna/Compiler/Elab/Termination/Scc.vuna:596"));
  ("Elab_dTermination_dScc.v_argBasesGo", ("Vuna.Compiler.Elab.Termination.Scc.argBasesGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:558"));
  ("Elab_dTermination_dScc.v_argBasesParts", ("Vuna.Compiler.Elab.Termination.Scc.argBasesParts", "Vuna/Compiler/Elab/Termination/Scc.vuna:630"));
  ("Elab_dTermination_dScc.v_argBasesStmts", ("Vuna.Compiler.Elab.Termination.Scc.argBasesStmts", "Vuna/Compiler/Elab/Termination/Scc.vuna:618"));
  ("Elab_dTermination_dScc.v_badGraphText", ("Vuna.Compiler.Elab.Termination.Scc.badGraphText", "Vuna/Compiler/Elab/Termination/Scc.vuna:742"));
  ("Elab_dTermination_dScc.v_basesUpTo", ("Vuna.Compiler.Elab.Termination.Scc.basesUpTo", "Vuna/Compiler/Elab/Termination/Scc.vuna:528"));
  ("Elab_dTermination_dScc.v_basesUpToGo", ("Vuna.Compiler.Elab.Termination.Scc.basesUpToGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:525"));
  ("Elab_dTermination_dScc.v_blindEdges", ("Vuna.Compiler.Elab.Termination.Scc.blindEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:649"));
  ("Elab_dTermination_dScc.v_blindEdgesI", ("Vuna.Compiler.Elab.Termination.Scc.blindEdgesI", "Vuna/Compiler/Elab/Termination/Scc.vuna:642"));
  ("Elab_dTermination_dScc.v_blindEdgesJ", ("Vuna.Compiler.Elab.Termination.Scc.blindEdgesJ", "Vuna/Compiler/Elab/Termination/Scc.vuna:638"));
  ("Elab_dTermination_dScc.v_blindPairText", ("Vuna.Compiler.Elab.Termination.Scc.blindPairText", "Vuna/Compiler/Elab/Termination/Scc.vuna:760"));
  ("Elab_dTermination_dScc.v_blindSitesOf", ("Vuna.Compiler.Elab.Termination.Scc.blindSitesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:25"));
  ("Elab_dTermination_dScc.v_callerFuelName", ("Vuna.Compiler.Elab.Termination.Scc.callerFuelName", "Vuna/Compiler/Elab/Termination/Scc.vuna:872"));
  ("Elab_dTermination_dScc.v_canonEdges", ("Vuna.Compiler.Elab.Termination.Scc.canonEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:364"));
  ("Elab_dTermination_dScc.v_closureLoop", ("Vuna.Compiler.Elab.Termination.Scc.closureLoop", "Vuna/Compiler/Elab/Termination/Scc.vuna:507"));
  ("Elab_dTermination_dScc.v_closureStep", ("Vuna.Compiler.Elab.Termination.Scc.closureStep", "Vuna/Compiler/Elab/Termination/Scc.vuna:494"));
  ("Elab_dTermination_dScc.v_closureStepGo", ("Vuna.Compiler.Elab.Termination.Scc.closureStepGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:487"));
  ("Elab_dTermination_dScc.v_closureStepGraphs", ("Vuna.Compiler.Elab.Termination.Scc.closureStepGraphs", "Vuna/Compiler/Elab/Termination/Scc.vuna:480"));
  ("Elab_dTermination_dScc.v_closureStepHs", ("Vuna.Compiler.Elab.Termination.Scc.closureStepHs", "Vuna/Compiler/Elab/Termination/Scc.vuna:460"));
  ("Elab_dTermination_dScc.v_closureStepOne", ("Vuna.Compiler.Elab.Termination.Scc.closureStepOne", "Vuna/Compiler/Elab/Termination/Scc.vuna:467"));
  ("Elab_dTermination_dScc.v_closureStepOneGo", ("Vuna.Compiler.Elab.Termination.Scc.closureStepOneGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:470"));
  ("Elab_dTermination_dScc.v_combineWith", ("Vuna.Compiler.Elab.Termination.Scc.combineWith", "Vuna/Compiler/Elab/Termination/Scc.vuna:383"));
  ("Elab_dTermination_dScc.v_compactEdges", ("Vuna.Compiler.Elab.Termination.Scc.compactEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:353"));
  ("Elab_dTermination_dScc.v_composeEdges", ("Vuna.Compiler.Elab.Termination.Scc.composeEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:396"));
  ("Elab_dTermination_dScc.v_composeGo", ("Vuna.Compiler.Elab.Termination.Scc.composeGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:392"));
  ("Elab_dTermination_dScc.v_countGraphs", ("Vuna.Compiler.Elab.Termination.Scc.countGraphs", "Vuna/Compiler/Elab/Termination/Scc.vuna:775"));
  ("Elab_dTermination_dScc.v_dedupBases", ("Vuna.Compiler.Elab.Termination.Scc.dedupBases", "Vuna/Compiler/Elab/Termination/Scc.vuna:535"));
  ("Elab_dTermination_dScc.v_dropAliases", ("Vuna.Compiler.Elab.Termination.Scc.dropAliases", "Vuna/Compiler/Elab/Termination/Scc.vuna:207"));
  ("Elab_dTermination_dScc.v_edgeModeOf", ("Vuna.Compiler.Elab.Termination.Scc.edgeModeOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:995"));
  ("Elab_dTermination_dScc.v_edgeText", ("Vuna.Compiler.Elab.Termination.Scc.edgeText", "Vuna/Compiler/Elab/Termination/Scc.vuna:728"));
  ("Elab_dTermination_dScc.v_edgesEq", ("Vuna.Compiler.Elab.Termination.Scc.edgesEq", "Vuna/Compiler/Elab/Termination/Scc.vuna:380"));
  ("Elab_dTermination_dScc.v_edgesEqCanon", ("Vuna.Compiler.Elab.Termination.Scc.edgesEqCanon", "Vuna/Compiler/Elab/Termination/Scc.vuna:367"));
  ("Elab_dTermination_dScc.v_edgesText", ("Vuna.Compiler.Elab.Termination.Scc.edgesText", "Vuna/Compiler/Elab/Termination/Scc.vuna:737"));
  ("Elab_dTermination_dScc.v_fuelAcceptable", ("Vuna.Compiler.Elab.Termination.Scc.fuelAcceptable", "Vuna/Compiler/Elab/Termination/Scc.vuna:977"));
  ("Elab_dTermination_dScc.v_fuelEdgesGo", ("Vuna.Compiler.Elab.Termination.Scc.fuelEdgesGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:927"));
  ("Elab_dTermination_dScc.v_fuelEdgesOf", ("Vuna.Compiler.Elab.Termination.Scc.fuelEdgesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:922"));
  ("Elab_dTermination_dScc.v_fuelParamIndexOf", ("Vuna.Compiler.Elab.Termination.Scc.fuelParamIndexOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:858"));
  ("Elab_dTermination_dScc.v_fuelParamNameOf", ("Vuna.Compiler.Elab.Termination.Scc.fuelParamNameOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:850"));
  ("Elab_dTermination_dScc.v_graphIdempotent", ("Vuna.Compiler.Elab.Termination.Scc.graphIdempotent", "Vuna/Compiler/Elab/Termination/Scc.vuna:403"));
  ("Elab_dTermination_dScc.v_graphListHas", ("Vuna.Compiler.Elab.Termination.Scc.graphListHas", "Vuna/Compiler/Elab/Termination/Scc.vuna:429"));
  ("Elab_dTermination_dScc.v_graphListSubset", ("Vuna.Compiler.Elab.Termination.Scc.graphListSubset", "Vuna/Compiler/Elab/Termination/Scc.vuna:433"));
  ("Elab_dTermination_dScc.v_graphOK", ("Vuna.Compiler.Elab.Termination.Scc.graphOK", "Vuna/Compiler/Elab/Termination/Scc.vuna:408"));
  ("Elab_dTermination_dScc.v_graphsOK", ("Vuna.Compiler.Elab.Termination.Scc.graphsOK", "Vuna/Compiler/Elab/Termination/Scc.vuna:411"));
  ("Elab_dTermination_dScc.v_guardParamGo", ("Vuna.Compiler.Elab.Termination.Scc.guardParamGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:845"));
  ("Elab_dTermination_dScc.v_hasBase", ("Vuna.Compiler.Elab.Termination.Scc.hasBase", "Vuna/Compiler/Elab/Termination/Scc.vuna:531"));
  ("Elab_dTermination_dScc.v_hasFuelGuard", ("Vuna.Compiler.Elab.Termination.Scc.hasFuelGuard", "Vuna/Compiler/Elab/Termination/Scc.vuna:825"));
  ("Elab_dTermination_dScc.v_hasStrict", ("Vuna.Compiler.Elab.Termination.Scc.hasStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:399"));
  ("Elab_dTermination_dScc.v_initialTable", ("Vuna.Compiler.Elab.Termination.Scc.initialTable", "Vuna/Compiler/Elab/Termination/Scc.vuna:694"));
  ("Elab_dTermination_dScc.v_initialTableGo", ("Vuna.Compiler.Elab.Termination.Scc.initialTableGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:697"));
  ("Elab_dTermination_dScc.v_inlAlts", ("Vuna.Compiler.Elab.Termination.Scc.inlAlts", "Vuna/Compiler/Elab/Termination/Scc.vuna:250"));
  ("Elab_dTermination_dScc.v_inlArgs", ("Vuna.Compiler.Elab.Termination.Scc.inlArgs", "Vuna/Compiler/Elab/Termination/Scc.vuna:218"));
  ("Elab_dTermination_dScc.v_inlBinds", ("Vuna.Compiler.Elab.Termination.Scc.inlBinds", "Vuna/Compiler/Elab/Termination/Scc.vuna:233"));
  ("Elab_dTermination_dScc.v_inlClauses", ("Vuna.Compiler.Elab.Termination.Scc.inlClauses", "Vuna/Compiler/Elab/Termination/Scc.vuna:255"));
  ("Elab_dTermination_dScc.v_inlFields", ("Vuna.Compiler.Elab.Termination.Scc.inlFields", "Vuna/Compiler/Elab/Termination/Scc.vuna:222"));
  ("Elab_dTermination_dScc.v_inlGo", ("Vuna.Compiler.Elab.Termination.Scc.inlGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:272"));
  ("Elab_dTermination_dScc.v_inlParts", ("Vuna.Compiler.Elab.Termination.Scc.inlParts", "Vuna/Compiler/Elab/Termination/Scc.vuna:226"));
  ("Elab_dTermination_dScc.v_inlStmts", ("Vuna.Compiler.Elab.Termination.Scc.inlStmts", "Vuna/Compiler/Elab/Termination/Scc.vuna:260"));
  ("Elab_dTermination_dScc.v_inlineAliases", ("Vuna.Compiler.Elab.Termination.Scc.inlineAliases", "Vuna/Compiler/Elab/Termination/Scc.vuna:297"));
  ("Elab_dTermination_dScc.v_insertEdge", ("Vuna.Compiler.Elab.Termination.Scc.insertEdge", "Vuna/Compiler/Elab/Termination/Scc.vuna:336"));
  ("Elab_dTermination_dScc.v_isBlindSite", ("Vuna.Compiler.Elab.Termination.Scc.isBlindSite", "Vuna/Compiler/Elab/Termination/Scc.vuna:757"));
  ("Elab_dTermination_dScc.v_lookupAlias", ("Vuna.Compiler.Elab.Termination.Scc.lookupAlias", "Vuna/Compiler/Elab/Termination/Scc.vuna:203"));
  ("Elab_dTermination_dScc.v_maxBaseOf", ("Vuna.Compiler.Elab.Termination.Scc.maxBaseOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:332"));
  ("Elab_dTermination_dScc.v_memberGuarded", ("Vuna.Compiler.Elab.Termination.Scc.memberGuarded", "Vuna/Compiler/Elab/Termination/Scc.vuna:942"));
  ("Elab_dTermination_dScc.v_mergeStrict", ("Vuna.Compiler.Elab.Termination.Scc.mergeStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:350"));
  ("Elab_dTermination_dScc.v_nthDeps", ("Vuna.Compiler.Elab.Termination.Scc.nthDeps", "Vuna/Compiler/Elab/Termination/Scc.vuna:665"));
  ("Elab_dTermination_dScc.v_onlyUnguarded", ("Vuna.Compiler.Elab.Termination.Scc.onlyUnguarded", "Vuna/Compiler/Elab/Termination/Scc.vuna:958"));
  ("Elab_dTermination_dScc.v_paramIndexGo", ("Vuna.Compiler.Elab.Termination.Scc.paramIndexGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:814"));
  ("Elab_dTermination_dScc.v_paramNamesOf", ("Vuna.Compiler.Elab.Termination.Scc.paramNamesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:807"));
  ("Elab_dTermination_dScc.v_paramsOf", ("Vuna.Compiler.Elab.Termination.Scc.paramsOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:884"));
  ("Elab_dTermination_dScc.v_patNamesOf", ("Vuna.Compiler.Elab.Termination.Scc.patNamesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:539"));
  ("Elab_dTermination_dScc.v_patNamesOfBinds", ("Vuna.Compiler.Elab.Termination.Scc.patNamesOfBinds", "Vuna/Compiler/Elab/Termination/Scc.vuna:554"));
  ("Elab_dTermination_dScc.v_patNamesOfFields", ("Vuna.Compiler.Elab.Termination.Scc.patNamesOfFields", "Vuna/Compiler/Elab/Termination/Scc.vuna:550"));
  ("Elab_dTermination_dScc.v_patNamesOfPats", ("Vuna.Compiler.Elab.Termination.Scc.patNamesOfPats", "Vuna/Compiler/Elab/Termination/Scc.vuna:546"));
  ("Elab_dTermination_dScc.v_scIsStrict", ("Vuna.Compiler.Elab.Termination.Scc.scIsStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:329"));
  ("Elab_dTermination_dScc.v_sctBadGraphs", ("Vuna.Compiler.Elab.Termination.Scc.sctBadGraphs", "Vuna/Compiler/Elab/Termination/Scc.vuna:719"));
  ("Elab_dTermination_dScc.v_sctBadPairs", ("Vuna.Compiler.Elab.Termination.Scc.sctBadPairs", "Vuna/Compiler/Elab/Termination/Scc.vuna:723"));
  ("Elab_dTermination_dScc.v_sctBadText", ("Vuna.Compiler.Elab.Termination.Scc.sctBadText", "Vuna/Compiler/Elab/Termination/Scc.vuna:747"));
  ("Elab_dTermination_dScc.v_sctBlindNote", ("Vuna.Compiler.Elab.Termination.Scc.sctBlindNote", "Vuna/Compiler/Elab/Termination/Scc.vuna:763"));
  ("Elab_dTermination_dScc.v_sctCheck", ("Vuna.Compiler.Elab.Termination.Scc.sctCheck", "Vuna/Compiler/Elab/Termination/Scc.vuna:770"));
  ("Elab_dTermination_dScc.v_sctCheckGo", ("Vuna.Compiler.Elab.Termination.Scc.sctCheckGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:779"));
  ("Elab_dTermination_dScc.v_sctCheckTable", ("Vuna.Compiler.Elab.Termination.Scc.sctCheckTable", "Vuna/Compiler/Elab/Termination/Scc.vuna:714"));
  ("Elab_dTermination_dScc.v_sctClosureFuel", ("Vuna.Compiler.Elab.Termination.Scc.sctClosureFuel", "Vuna/Compiler/Elab/Termination/Scc.vuna:710"));
  ("Elab_dTermination_dScc.v_sctDiag", ("Vuna.Compiler.Elab.Termination.Scc.sctDiag", "Vuna/Compiler/Elab/Termination/Scc.vuna:752"));
  ("Elab_dTermination_dScc.v_siteCollect", ("Vuna.Compiler.Elab.Termination.Scc.siteCollect", "Vuna/Compiler/Elab/Termination/Scc.vuna:314"));
  ("Elab_dTermination_dScc.v_siteCollectAlts", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectAlts", "Vuna/Compiler/Elab/Termination/Scc.vuna:71"));
  ("Elab_dTermination_dScc.v_siteCollectBinds", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectBinds", "Vuna/Compiler/Elab/Termination/Scc.vuna:91"));
  ("Elab_dTermination_dScc.v_siteCollectClauses", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectClauses", "Vuna/Compiler/Elab/Termination/Scc.vuna:300"));
  ("Elab_dTermination_dScc.v_siteCollectFields", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectFields", "Vuna/Compiler/Elab/Termination/Scc.vuna:52"));
  ("Elab_dTermination_dScc.v_siteCollectGo", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectGo", "Vuna/Compiler/Elab/Termination/Scc.vuna:317"));
  ("Elab_dTermination_dScc.v_siteCollectList", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectList", "Vuna/Compiler/Elab/Termination/Scc.vuna:33"));
  ("Elab_dTermination_dScc.v_siteCollectStmts", ("Vuna.Compiler.Elab.Termination.Scc.siteCollectStmts", "Vuna/Compiler/Elab/Termination/Scc.vuna:110"));
  ("Elab_dTermination_dScc.v_siteEdgeAt", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgeAt", "Vuna/Compiler/Elab/Termination/Scc.vuna:655"));
  ("Elab_dTermination_dScc.v_siteEdgesI", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgesI", "Vuna/Compiler/Elab/Termination/Scc.vuna:678"));
  ("Elab_dTermination_dScc.v_siteEdgesJ", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgesJ", "Vuna/Compiler/Elab/Termination/Scc.vuna:669"));
  ("Elab_dTermination_dScc.v_siteEdgesOf", ("Vuna.Compiler.Elab.Termination.Scc.siteEdgesOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:687"));
  ("Elab_dTermination_dScc.v_siteFuelStrict", ("Vuna.Compiler.Elab.Termination.Scc.siteFuelStrict", "Vuna/Compiler/Elab/Termination/Scc.vuna:893"));
  ("Elab_dTermination_dScc.v_siteWalkC", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkC", "Vuna/Compiler/Elab/Termination/Scc.vuna:122"));
  ("Elab_dTermination_dScc.v_siteWalkEApp", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkEApp", "Vuna/Compiler/Elab/Termination/Scc.vuna:149"));
  ("Elab_dTermination_dScc.v_siteWalkEAppMap", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkEAppMap", "Vuna/Compiler/Elab/Termination/Scc.vuna:171"));
  ("Elab_dTermination_dScc.v_siteWalkMapPartialInline", ("Vuna.Compiler.Elab.Termination.Scc.siteWalkMapPartialInline", "Vuna/Compiler/Elab/Termination/Scc.vuna:184"));
  ("Elab_dTermination_dScc.v_sortEdges", ("Vuna.Compiler.Elab.Termination.Scc.sortEdges", "Vuna/Compiler/Elab/Termination/Scc.vuna:346"));
  ("Elab_dTermination_dScc.v_strictEdgeText", ("Vuna.Compiler.Elab.Termination.Scc.strictEdgeText", "Vuna/Compiler/Elab/Termination/Scc.vuna:731"));
  ("Elab_dTermination_dScc.v_tableAdd", ("Vuna.Compiler.Elab.Termination.Scc.tableAdd", "Vuna/Compiler/Elab/Termination/Scc.vuna:445"));
  ("Elab_dTermination_dScc.v_tableAddPair", ("Vuna.Compiler.Elab.Termination.Scc.tableAddPair", "Vuna/Compiler/Elab/Termination/Scc.vuna:437"));
  ("Elab_dTermination_dScc.v_tableGraphCap", ("Vuna.Compiler.Elab.Termination.Scc.tableGraphCap", "Vuna/Compiler/Elab/Termination/Scc.vuna:418"));
  ("Elab_dTermination_dScc.v_tableLookup", ("Vuna.Compiler.Elab.Termination.Scc.tableLookup", "Vuna/Compiler/Elab/Termination/Scc.vuna:421"));
  ("Elab_dTermination_dScc.v_tableSame", ("Vuna.Compiler.Elab.Termination.Scc.tableSame", "Vuna/Compiler/Elab/Termination/Scc.vuna:497"));
  ("Elab_dTermination_dScc.v_tableSubset", ("Vuna.Compiler.Elab.Termination.Scc.tableSubset", "Vuna/Compiler/Elab/Termination/Scc.vuna:500"));
  ("Elab_dTermination_dScc.v_tryFuelThread", ("Vuna.Compiler.Elab.Termination.Scc.tryFuelThread", "Vuna/Compiler/Elab/Termination/Scc.vuna:983"));
  ("Elab_dTermination_dScc.v_unguardedCycle", ("Vuna.Compiler.Elab.Termination.Scc.unguardedCycle", "Vuna/Compiler/Elab/Termination/Scc.vuna:970"));
  ("Elab_dTermination_dScc.v_unguardedOf", ("Vuna.Compiler.Elab.Termination.Scc.unguardedOf", "Vuna/Compiler/Elab/Termination/Scc.vuna:948"));
  ("Elab_dTermination_dScc.v_weakEdgeText", ("Vuna.Compiler.Elab.Termination.Scc.weakEdgeText", "Vuna/Compiler/Elab/Termination/Scc.vuna:734"));
  ("Elab_dTrait.v_addDictGoalGroup", ("Vuna.Compiler.Elab.Trait.addDictGoalGroup", "Vuna/Compiler/Elab/Trait.vuna:1179"));
  ("Elab_dTrait.v_altBudgetFor", ("Vuna.Compiler.Elab.Trait.altBudgetFor", "Vuna/Compiler/Elab/Trait.vuna:1354"));
  ("Elab_dTrait.v_anyDeclInFile", ("Vuna.Compiler.Elab.Trait.anyDeclInFile", "Vuna/Compiler/Elab/Trait.vuna:318"));
  ("Elab_dTrait.v_anyGlobalHead", ("Vuna.Compiler.Elab.Trait.anyGlobalHead", "Vuna/Compiler/Elab/Trait.vuna:323"));
  ("Elab_dTrait.v_anySameMethod", ("Vuna.Compiler.Elab.Trait.anySameMethod", "Vuna/Compiler/Elab/Trait.vuna:796"));
  ("Elab_dTrait.v_applyCtxSubstsTo", ("Vuna.Compiler.Elab.Trait.applyCtxSubstsTo", "Vuna/Compiler/Elab/Trait.vuna:1047"));
  ("Elab_dTrait.v_applyTermSubstsTo", ("Vuna.Compiler.Elab.Trait.applyTermSubstsTo", "Vuna/Compiler/Elab/Trait.vuna:1079"));
  ("Elab_dTrait.v_bareTeleSeeds", ("Vuna.Compiler.Elab.Trait.bareTeleSeeds", "Vuna/Compiler/Elab/Trait.vuna:630"));
  ("Elab_dTrait.v_bindClassParams", ("Vuna.Compiler.Elab.Trait.bindClassParams", "Vuna/Compiler/Elab/Trait.vuna:30"));
  ("Elab_dTrait.v_bindDictBinderFuel", ("Vuna.Compiler.Elab.Trait.bindDictBinderFuel", "Vuna/Compiler/Elab/Trait.vuna:1590"));
  ("Elab_dTrait.v_bindIndexBinder", ("Vuna.Compiler.Elab.Trait.bindIndexBinder", "Vuna/Compiler/Elab/Trait.vuna:1729"));
  ("Elab_dTrait.v_bindIndexBinderFuel", ("Vuna.Compiler.Elab.Trait.bindIndexBinderFuel", "Vuna/Compiler/Elab/Trait.vuna:1607"));
  ("Elab_dTrait.v_bindOnePattern", ("Vuna.Compiler.Elab.Trait.bindOnePattern", "Vuna/Compiler/Elab/Trait.vuna:1733"));
  ("Elab_dTrait.v_bindOnePatternFuel", ("Vuna.Compiler.Elab.Trait.bindOnePatternFuel", "Vuna/Compiler/Elab/Trait.vuna:1663"));
  ("Elab_dTrait.v_canonicalMethodShort", ("Vuna.Compiler.Elab.Trait.canonicalMethodShort", "Vuna/Compiler/Elab/Trait.vuna:777"));
  ("Elab_dTrait.v_checkArgsAtKinds", ("Vuna.Compiler.Elab.Trait.checkArgsAtKinds", "Vuna/Compiler/Elab/Trait.vuna:538"));
  ("Elab_dTrait.v_checkBinders", ("Vuna.Compiler.Elab.Trait.checkBinders", "Vuna/Compiler/Elab/Trait.vuna:1726"));
  ("Elab_dTrait.v_checkBindersFuel", ("Vuna.Compiler.Elab.Trait.checkBindersFuel", "Vuna/Compiler/Elab/Trait.vuna:1636"));
  ("Elab_dTrait.v_checkBodyAtEndFuel", ("Vuna.Compiler.Elab.Trait.checkBodyAtEndFuel", "Vuna/Compiler/Elab/Trait.vuna:1627"));
  ("Elab_dTrait.v_checkDef", ("Vuna.Compiler.Elab.Trait.checkDef", "Vuna/Compiler/Elab/Trait.vuna:1586"));
  ("Elab_dTrait.v_checkDefIn", ("Vuna.Compiler.Elab.Trait.checkDefIn", "Vuna/Compiler/Elab/Trait.vuna:1582"));
  ("Elab_dTrait.v_checkInstanceHeads", ("Vuna.Compiler.Elab.Trait.checkInstanceHeads", "Vuna/Compiler/Elab/Trait.vuna:1439"));
  ("Elab_dTrait.v_checkInstanceHeadsGo", ("Vuna.Compiler.Elab.Trait.checkInstanceHeadsGo", "Vuna/Compiler/Elab/Trait.vuna:1442"));
  ("Elab_dTrait.v_checkSuperClasses", ("Vuna.Compiler.Elab.Trait.checkSuperClasses", "Vuna/Compiler/Elab/Trait.vuna:337"));
  ("Elab_dTrait.v_classFieldTys", ("Vuna.Compiler.Elab.Trait.classFieldTys", "Vuna/Compiler/Elab/Trait.vuna:35"));
  ("Elab_dTrait.v_classFieldTysGo", ("Vuna.Compiler.Elab.Trait.classFieldTysGo", "Vuna/Compiler/Elab/Trait.vuna:39"));
  ("Elab_dTrait.v_classParamKinds", ("Vuna.Compiler.Elab.Trait.classParamKinds", "Vuna/Compiler/Elab/Trait.vuna:128"));
  ("Elab_dTrait.v_clauseSpanOf", ("Vuna.Compiler.Elab.Trait.clauseSpanOf", "Vuna/Compiler/Elab/Trait.vuna:1129"));
  ("Elab_dTrait.v_closedTypeArgs", ("Vuna.Compiler.Elab.Trait.closedTypeArgs", "Vuna/Compiler/Elab/Trait.vuna:577"));
  ("Elab_dTrait.v_closedTypeTerm", ("Vuna.Compiler.Elab.Trait.closedTypeTerm", "Vuna/Compiler/Elab/Trait.vuna:566"));
  ("Elab_dTrait.v_closedTypeTerms", ("Vuna.Compiler.Elab.Trait.closedTypeTerms", "Vuna/Compiler/Elab/Trait.vuna:556"));
  ("Elab_dTrait.v_constraintPartsOf", ("Vuna.Compiler.Elab.Trait.constraintPartsOf", "Vuna/Compiler/Elab/Trait.vuna:428"));
  ("Elab_dTrait.v_ctorResultType", ("Vuna.Compiler.Elab.Trait.ctorResultType", "Vuna/Compiler/Elab/Trait.vuna:880"));
  ("Elab_dTrait.v_ctxBareTeleSeeds", ("Vuna.Compiler.Elab.Trait.ctxBareTeleSeeds", "Vuna/Compiler/Elab/Trait.vuna:642"));
  ("Elab_dTrait.v_ctxDictDomEqual", ("Vuna.Compiler.Elab.Trait.ctxDictDomEqual", "Vuna/Compiler/Elab/Trait.vuna:1038"));
  ("Elab_dTrait.v_ctxDictName", ("Vuna.Compiler.Elab.Trait.ctxDictName", "Vuna/Compiler/Elab/Trait.vuna:732"));
  ("Elab_dTrait.v_declNamedInFile", ("Vuna.Compiler.Elab.Trait.declNamedInFile", "Vuna/Compiler/Elab/Trait.vuna:288"));
  ("Elab_dTrait.v_declTopName", ("Vuna.Compiler.Elab.Trait.declTopName", "Vuna/Compiler/Elab/Trait.vuna:282"));
  ("Elab_dTrait.v_defBodyOf", ("Vuna.Compiler.Elab.Trait.defBodyOf", "Vuna/Compiler/Elab/Trait.vuna:1518"));
  ("Elab_dTrait.v_defTypeOfTbl", ("Vuna.Compiler.Elab.Trait.defTypeOfTbl", "Vuna/Compiler/Elab/Trait.vuna:1573"));
  ("Elab_dTrait.v_dictAnchor", ("Vuna.Compiler.Elab.Trait.dictAnchor", "Vuna/Compiler/Elab/Trait.vuna:1230"));
  ("Elab_dTrait.v_dictAppTermOf", ("Vuna.Compiler.Elab.Trait.dictAppTermOf", "Vuna/Compiler/Elab/Trait.vuna:171"));
  ("Elab_dTrait.v_dictParamArgs", ("Vuna.Compiler.Elab.Trait.dictParamArgs", "Vuna/Compiler/Elab/Trait.vuna:174"));
  ("Elab_dTrait.v_dictPlanName", ("Vuna.Compiler.Elab.Trait.dictPlanName", "Vuna/Compiler/Elab/Trait.vuna:1263"));
  ("Elab_dTrait.v_dictPlanPi", ("Vuna.Compiler.Elab.Trait.dictPlanPi", "Vuna/Compiler/Elab/Trait.vuna:1260"));
  ("Elab_dTrait.v_domainsEqual", ("Vuna.Compiler.Elab.Trait.domainsEqual", "Vuna/Compiler/Elab/Trait.vuna:1187"));
  ("Elab_dTrait.v_elabConstraintDomains", ("Vuna.Compiler.Elab.Trait.elabConstraintDomains", "Vuna/Compiler/Elab/Trait.vuna:695"));
  ("Elab_dTrait.v_elabFunDef", ("Vuna.Compiler.Elab.Trait.elabFunDef", "Vuna/Compiler/Elab/Trait.vuna:1723"));
  ("Elab_dTrait.v_elabFunDefIn", ("Vuna.Compiler.Elab.Trait.elabFunDefIn", "Vuna/Compiler/Elab/Trait.vuna:1691"));
  ("Elab_dTrait.v_elabFunDefMulti", ("Vuna.Compiler.Elab.Trait.elabFunDefMulti", "Vuna/Compiler/Elab/Trait.vuna:1702"));
  ("Elab_dTrait.v_elabInstance", ("Vuna.Compiler.Elab.Trait.elabInstance", "Vuna/Compiler/Elab/Trait.vuna:404"));
  ("Elab_dTrait.v_elabInstanceBodies", ("Vuna.Compiler.Elab.Trait.elabInstanceBodies", "Vuna/Compiler/Elab/Trait.vuna:1470"));
  ("Elab_dTrait.v_elabInstanceBodiesGo", ("Vuna.Compiler.Elab.Trait.elabInstanceBodiesGo", "Vuna/Compiler/Elab/Trait.vuna:1482"));
  ("Elab_dTrait.v_elabInstanceConstrained", ("Vuna.Compiler.Elab.Trait.elabInstanceConstrained", "Vuna/Compiler/Elab/Trait.vuna:503"));
  ("Elab_dTrait.v_elabInstanceMethod", ("Vuna.Compiler.Elab.Trait.elabInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:998"));
  ("Elab_dTrait.v_elabInstanceMethodIn", ("Vuna.Compiler.Elab.Trait.elabInstanceMethodIn", "Vuna/Compiler/Elab/Trait.vuna:994"));
  ("Elab_dTrait.v_elabInstanceMethodsCtx", ("Vuna.Compiler.Elab.Trait.elabInstanceMethodsCtx", "Vuna/Compiler/Elab/Trait.vuna:888"));
  ("Elab_dTrait.v_elabInstanceMethodsGo", ("Vuna.Compiler.Elab.Trait.elabInstanceMethodsGo", "Vuna/Compiler/Elab/Trait.vuna:958"));
  ("Elab_dTrait.v_elabInstanceSig", ("Vuna.Compiler.Elab.Trait.elabInstanceSig", "Vuna/Compiler/Elab/Trait.vuna:472"));
  ("Elab_dTrait.v_elabInstanceWithClass", ("Vuna.Compiler.Elab.Trait.elabInstanceWithClass", "Vuna/Compiler/Elab/Trait.vuna:347"));
  ("Elab_dTrait.v_elabInstanceWithClassGo", ("Vuna.Compiler.Elab.Trait.elabInstanceWithClassGo", "Vuna/Compiler/Elab/Trait.vuna:353"));
  ("Elab_dTrait.v_elabInstances", ("Vuna.Compiler.Elab.Trait.elabInstances", "Vuna/Compiler/Elab/Trait.vuna:1538"));
  ("Elab_dTrait.v_elabInstancesGo", ("Vuna.Compiler.Elab.Trait.elabInstancesGo", "Vuna/Compiler/Elab/Trait.vuna:1541"));
  ("Elab_dTrait.v_elabTrait", ("Vuna.Compiler.Elab.Trait.elabTrait", "Vuna/Compiler/Elab/Trait.vuna:73"));
  ("Elab_dTrait.v_elabTraitFinal", ("Vuna.Compiler.Elab.Trait.elabTraitFinal", "Vuna/Compiler/Elab/Trait.vuna:96"));
  ("Elab_dTrait.v_elabTraitKinds", ("Vuna.Compiler.Elab.Trait.elabTraitKinds", "Vuna/Compiler/Elab/Trait.vuna:87"));
  ("Elab_dTrait.v_elabTraits", ("Vuna.Compiler.Elab.Trait.elabTraits", "Vuna/Compiler/Elab/Trait.vuna:1525"));
  ("Elab_dTrait.v_elabTraitsGo", ("Vuna.Compiler.Elab.Trait.elabTraitsGo", "Vuna/Compiler/Elab/Trait.vuna:1528"));
  ("Elab_dTrait.v_exprFreeLower", ("Vuna.Compiler.Elab.Trait.exprFreeLower", "Vuna/Compiler/Elab/Trait.vuna:673"));
  ("Elab_dTrait.v_extraDefsGo", ("Vuna.Compiler.Elab.Trait.extraDefsGo", "Vuna/Compiler/Elab/Trait.vuna:1559"));
  ("Elab_dTrait.v_extraDefsOf", ("Vuna.Compiler.Elab.Trait.extraDefsOf", "Vuna/Compiler/Elab/Trait.vuna:1555"));
  ("Elab_dTrait.v_fallbackTeleKind", ("Vuna.Compiler.Elab.Trait.fallbackTeleKind", "Vuna/Compiler/Elab/Trait.vuna:670"));
  ("Elab_dTrait.v_findTraitDecl", ("Vuna.Compiler.Elab.Trait.findTraitDecl", "Vuna/Compiler/Elab/Trait.vuna:860"));
  ("Elab_dTrait.v_findTraitMethodSpan", ("Vuna.Compiler.Elab.Trait.findTraitMethodSpan", "Vuna/Compiler/Elab/Trait.vuna:868"));
  ("Elab_dTrait.v_firstDuplicateInstanceMethod", ("Vuna.Compiler.Elab.Trait.firstDuplicateInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:815"));
  ("Elab_dTrait.v_firstDuplicateInstanceMethodGo", ("Vuna.Compiler.Elab.Trait.firstDuplicateInstanceMethodGo", "Vuna/Compiler/Elab/Trait.vuna:819"));
  ("Elab_dTrait.v_firstMissingInstanceMethod", ("Vuna.Compiler.Elab.Trait.firstMissingInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:838"));
  ("Elab_dTrait.v_firstMissingInstanceMethodGo", ("Vuna.Compiler.Elab.Trait.firstMissingInstanceMethodGo", "Vuna/Compiler/Elab/Trait.vuna:841"));
  ("Elab_dTrait.v_firstUnknownInstanceMethod", ("Vuna.Compiler.Elab.Trait.firstUnknownInstanceMethod", "Vuna/Compiler/Elab/Trait.vuna:800"));
  ("Elab_dTrait.v_firstUnknownInstanceMethodGo", ("Vuna.Compiler.Elab.Trait.firstUnknownInstanceMethodGo", "Vuna/Compiler/Elab/Trait.vuna:804"));
  ("Elab_dTrait.v_flagAt", ("Vuna.Compiler.Elab.Trait.flagAt", "Vuna/Compiler/Elab/Trait.vuna:268"));
  ("Elab_dTrait.v_foldParamPis", ("Vuna.Compiler.Elab.Trait.foldParamPis", "Vuna/Compiler/Elab/Trait.vuna:166"));
  ("Elab_dTrait.v_foldPiFieldTys", ("Vuna.Compiler.Elab.Trait.foldPiFieldTys", "Vuna/Compiler/Elab/Trait.vuna:62"));
  ("Elab_dTrait.v_foldPiFieldTysGo", ("Vuna.Compiler.Elab.Trait.foldPiFieldTysGo", "Vuna/Compiler/Elab/Trait.vuna:65"));
  ("Elab_dTrait.v_foldlAddDef", ("Vuna.Compiler.Elab.Trait.foldlAddDef", "Vuna/Compiler/Elab/Trait.vuna:54"));
  ("Elab_dTrait.v_foldlAddInst", ("Vuna.Compiler.Elab.Trait.foldlAddInst", "Vuna/Compiler/Elab/Trait.vuna:1431"));
  ("Elab_dTrait.v_freeDictGoals", ("Vuna.Compiler.Elab.Trait.freeDictGoals", "Vuna/Compiler/Elab/Trait.vuna:1147"));
  ("Elab_dTrait.v_freeDictGoalsGo", ("Vuna.Compiler.Elab.Trait.freeDictGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:1164"));
  ("Elab_dTrait.v_hasMethodClauses", ("Vuna.Compiler.Elab.Trait.hasMethodClauses", "Vuna/Compiler/Elab/Trait.vuna:849"));
  ("Elab_dTrait.v_headTypeNameOf", ("Vuna.Compiler.Elab.Trait.headTypeNameOf", "Vuna/Compiler/Elab/Trait.vuna:295"));
  ("Elab_dTrait.v_headTypeNamesOf", ("Vuna.Compiler.Elab.Trait.headTypeNamesOf", "Vuna/Compiler/Elab/Trait.vuna:300"));
  ("Elab_dTrait.v_injectAltGo", ("Vuna.Compiler.Elab.Trait.injectAltGo", "Vuna/Compiler/Elab/Trait.vuna:1392"));
  ("Elab_dTrait.v_injectAltGoFuel", ("Vuna.Compiler.Elab.Trait.injectAltGoFuel", "Vuna/Compiler/Elab/Trait.vuna:1396"));
  ("Elab_dTrait.v_injectBudgetFor", ("Vuna.Compiler.Elab.Trait.injectBudgetFor", "Vuna/Compiler/Elab/Trait.vuna:1351"));
  ("Elab_dTrait.v_injectDictGo", ("Vuna.Compiler.Elab.Trait.injectDictGo", "Vuna/Compiler/Elab/Trait.vuna:1345"));
  ("Elab_dTrait.v_injectDictGoFuel", ("Vuna.Compiler.Elab.Trait.injectDictGoFuel", "Vuna/Compiler/Elab/Trait.vuna:1357"));
  ("Elab_dTrait.v_insertArgAt", ("Vuna.Compiler.Elab.Trait.insertArgAt", "Vuna/Compiler/Elab/Trait.vuna:1421"));
  ("Elab_dTrait.v_insertDictCalls", ("Vuna.Compiler.Elab.Trait.insertDictCalls", "Vuna/Compiler/Elab/Trait.vuna:1342"));
  ("Elab_dTrait.v_insertDictLams", ("Vuna.Compiler.Elab.Trait.insertDictLams", "Vuna/Compiler/Elab/Trait.vuna:1285"));
  ("Elab_dTrait.v_insertDictPis", ("Vuna.Compiler.Elab.Trait.insertDictPis", "Vuna/Compiler/Elab/Trait.vuna:1257"));
  ("Elab_dTrait.v_insertLamsAfter", ("Vuna.Compiler.Elab.Trait.insertLamsAfter", "Vuna/Compiler/Elab/Trait.vuna:1288"));
  ("Elab_dTrait.v_insertPisAfter", ("Vuna.Compiler.Elab.Trait.insertPisAfter", "Vuna/Compiler/Elab/Trait.vuna:1266"));
  ("Elab_dTrait.v_insertPlannedCalls", ("Vuna.Compiler.Elab.Trait.insertPlannedCalls", "Vuna/Compiler/Elab/Trait.vuna:1316"));
  ("Elab_dTrait.v_instArgAt", ("Vuna.Compiler.Elab.Trait.instArgAt", "Vuna/Compiler/Elab/Trait.vuna:954"));
  ("Elab_dTrait.v_instBodyCtx", ("Vuna.Compiler.Elab.Trait.instBodyCtx", "Vuna/Compiler/Elab/Trait.vuna:724"));
  ("Elab_dTrait.v_instBodyCtxGo", ("Vuna.Compiler.Elab.Trait.instBodyCtxGo", "Vuna/Compiler/Elab/Trait.vuna:727"));
  ("Elab_dTrait.v_instCtxLam", ("Vuna.Compiler.Elab.Trait.instCtxLam", "Vuna/Compiler/Elab/Trait.vuna:746"));
  ("Elab_dTrait.v_instCtxLamGo", ("Vuna.Compiler.Elab.Trait.instCtxLamGo", "Vuna/Compiler/Elab/Trait.vuna:749"));
  ("Elab_dTrait.v_instSigArgs", ("Vuna.Compiler.Elab.Trait.instSigArgs", "Vuna/Compiler/Elab/Trait.vuna:461"));
  ("Elab_dTrait.v_instSigClass", ("Vuna.Compiler.Elab.Trait.instSigClass", "Vuna/Compiler/Elab/Trait.vuna:452"));
  ("Elab_dTrait.v_instSigCtx", ("Vuna.Compiler.Elab.Trait.instSigCtx", "Vuna/Compiler/Elab/Trait.vuna:458"));
  ("Elab_dTrait.v_instSigHead", ("Vuna.Compiler.Elab.Trait.instSigHead", "Vuna/Compiler/Elab/Trait.vuna:464"));
  ("Elab_dTrait.v_instSigTele", ("Vuna.Compiler.Elab.Trait.instSigTele", "Vuna/Compiler/Elab/Trait.vuna:455"));
  ("Elab_dTrait.v_instTeleLam", ("Vuna.Compiler.Elab.Trait.instTeleLam", "Vuna/Compiler/Elab/Trait.vuna:742"));
  ("Elab_dTrait.v_instTypeCtx", ("Vuna.Compiler.Elab.Trait.instTypeCtx", "Vuna/Compiler/Elab/Trait.vuna:765"));
  ("Elab_dTrait.v_instTypeOf", ("Vuna.Compiler.Elab.Trait.instTypeOf", "Vuna/Compiler/Elab/Trait.vuna:757"));
  ("Elab_dTrait.v_instTypeTele", ("Vuna.Compiler.Elab.Trait.instTypeTele", "Vuna/Compiler/Elab/Trait.vuna:770"));
  ("Elab_dTrait.v_instValueOf", ("Vuna.Compiler.Elab.Trait.instValueOf", "Vuna/Compiler/Elab/Trait.vuna:736"));
  ("Elab_dTrait.v_instanceConstraintParts", ("Vuna.Compiler.Elab.Trait.instanceConstraintParts", "Vuna/Compiler/Elab/Trait.vuna:436"));
  ("Elab_dTrait.v_instanceDefsGo", ("Vuna.Compiler.Elab.Trait.instanceDefsGo", "Vuna/Compiler/Elab/Trait.vuna:1511"));
  ("Elab_dTrait.v_instanceDefsOf", ("Vuna.Compiler.Elab.Trait.instanceDefsOf", "Vuna/Compiler/Elab/Trait.vuna:1507"));
  ("Elab_dTrait.v_instanceHeadParts", ("Vuna.Compiler.Elab.Trait.instanceHeadParts", "Vuna/Compiler/Elab/Trait.vuna:420"));
  ("Elab_dTrait.v_instanceHeadTypeNames", ("Vuna.Compiler.Elab.Trait.instanceHeadTypeNames", "Vuna/Compiler/Elab/Trait.vuna:312"));
  ("Elab_dTrait.v_instanceLandingOk", ("Vuna.Compiler.Elab.Trait.instanceLandingOk", "Vuna/Compiler/Elab/Trait.vuna:327"));
  ("Elab_dTrait.v_instanceMono", ("Vuna.Compiler.Elab.Trait.instanceMono", "Vuna/Compiler/Elab/Trait.vuna:588"));
  ("Elab_dTrait.v_instanceTeleCtx", ("Vuna.Compiler.Elab.Trait.instanceTeleCtx", "Vuna/Compiler/Elab/Trait.vuna:686"));
  ("Elab_dTrait.v_instanceTeleCtxGo", ("Vuna.Compiler.Elab.Trait.instanceTeleCtxGo", "Vuna/Compiler/Elab/Trait.vuna:689"));
  ("Elab_dTrait.v_instanceTeleMetas", ("Vuna.Compiler.Elab.Trait.instanceTeleMetas", "Vuna/Compiler/Elab/Trait.vuna:602"));
  ("Elab_dTrait.v_isGlobalHeadType", ("Vuna.Compiler.Elab.Trait.isGlobalHeadType", "Vuna/Compiler/Elab/Trait.vuna:309"));
  ("Elab_dTrait.v_isLowerStart", ("Vuna.Compiler.Elab.Trait.isLowerStart", "Vuna/Compiler/Elab/Trait.vuna:594"));
  ("Elab_dTrait.v_keepOutBanned", ("Vuna.Compiler.Elab.Trait.keepOutBanned", "Vuna/Compiler/Elab/Trait.vuna:680"));
  ("Elab_dTrait.v_leadingImplicitCount", ("Vuna.Compiler.Elab.Trait.leadingImplicitCount", "Vuna/Compiler/Elab/Trait.vuna:1194"));
  ("Elab_dTrait.v_liftFreeDictGoals", ("Vuna.Compiler.Elab.Trait.liftFreeDictGoals", "Vuna/Compiler/Elab/Trait.vuna:1322"));
  ("Elab_dTrait.v_liftableDictDomain", ("Vuna.Compiler.Elab.Trait.liftableDictDomain", "Vuna/Compiler/Elab/Trait.vuna:1159"));
  ("Elab_dTrait.v_literalClassArg", ("Vuna.Compiler.Elab.Trait.literalClassArg", "Vuna/Compiler/Elab/Trait.vuna:1152"));
  ("Elab_dTrait.v_matchCtxDictIdx", ("Vuna.Compiler.Elab.Trait.matchCtxDictIdx", "Vuna/Compiler/Elab/Trait.vuna:1026"));
  ("Elab_dTrait.v_matchCtxDictIdxGo", ("Vuna.Compiler.Elab.Trait.matchCtxDictIdxGo", "Vuna/Compiler/Elab/Trait.vuna:1029"));
  ("Elab_dTrait.v_methodClausesGo", ("Vuna.Compiler.Elab.Trait.methodClausesGo", "Vuna/Compiler/Elab/Trait.vuna:979"));
  ("Elab_dTrait.v_methodClausesNamed", ("Vuna.Compiler.Elab.Trait.methodClausesNamed", "Vuna/Compiler/Elab/Trait.vuna:976"));
  ("Elab_dTrait.v_methodProjType", ("Vuna.Compiler.Elab.Trait.methodProjType", "Vuna/Compiler/Elab/Trait.vuna:202"));
  ("Elab_dTrait.v_methodProjZip", ("Vuna.Compiler.Elab.Trait.methodProjZip", "Vuna/Compiler/Elab/Trait.vuna:194"));
  ("Elab_dTrait.v_methodProjections", ("Vuna.Compiler.Elab.Trait.methodProjections", "Vuna/Compiler/Elab/Trait.vuna:190"));
  ("Elab_dTrait.v_planDictBinders", ("Vuna.Compiler.Elab.Trait.planDictBinders", "Vuna/Compiler/Elab/Trait.vuna:1236"));
  ("Elab_dTrait.v_planDictBindersGo", ("Vuna.Compiler.Elab.Trait.planDictBindersGo", "Vuna/Compiler/Elab/Trait.vuna:1239"));
  ("Elab_dTrait.v_projectionBody", ("Vuna.Compiler.Elab.Trait.projectionBody", "Vuna/Compiler/Elab/Trait.vuna:215"));
  ("Elab_dTrait.v_projectionBodyOpaque", ("Vuna.Compiler.Elab.Trait.projectionBodyOpaque", "Vuna/Compiler/Elab/Trait.vuna:223"));
  ("Elab_dTrait.v_projectionDefs", ("Vuna.Compiler.Elab.Trait.projectionDefs", "Vuna/Compiler/Elab/Trait.vuna:251"));
  ("Elab_dTrait.v_projectionDefsGo", ("Vuna.Compiler.Elab.Trait.projectionDefsGo", "Vuna/Compiler/Elab/Trait.vuna:272"));
  ("Elab_dTrait.v_projectionDefsOpaque", ("Vuna.Compiler.Elab.Trait.projectionDefsOpaque", "Vuna/Compiler/Elab/Trait.vuna:256"));
  ("Elab_dTrait.v_projectionDefsOpaqueGo", ("Vuna.Compiler.Elab.Trait.projectionDefsOpaqueGo", "Vuna/Compiler/Elab/Trait.vuna:260"));
  ("Elab_dTrait.v_projectionParamLams", ("Vuna.Compiler.Elab.Trait.projectionParamLams", "Vuna/Compiler/Elab/Trait.vuna:242"));
  ("Elab_dTrait.v_projectionParamNames", ("Vuna.Compiler.Elab.Trait.projectionParamNames", "Vuna/Compiler/Elab/Trait.vuna:247"));
  ("Elab_dTrait.v_replaceGlobalType", ("Vuna.Compiler.Elab.Trait.replaceGlobalType", "Vuna/Compiler/Elab/Trait.vuna:1425"));
  ("Elab_dTrait.v_resolveRigidGoals", ("Vuna.Compiler.Elab.Trait.resolveRigidGoals", "Vuna/Compiler/Elab/Trait.vuna:1054"));
  ("Elab_dTrait.v_resolveRigidGoalsGo", ("Vuna.Compiler.Elab.Trait.resolveRigidGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:1058"));
  ("Elab_dTrait.v_resolveTeleKind", ("Vuna.Compiler.Elab.Trait.resolveTeleKind", "Vuna/Compiler/Elab/Trait.vuna:658"));
  ("Elab_dTrait.v_resolveTeleKinds", ("Vuna.Compiler.Elab.Trait.resolveTeleKinds", "Vuna/Compiler/Elab/Trait.vuna:653"));
  ("Elab_dTrait.v_rewriteTaggedSpine", ("Vuna.Compiler.Elab.Trait.rewriteTaggedSpine", "Vuna/Compiler/Elab/Trait.vuna:1404"));
  ("Elab_dTrait.v_rewriteTaggedSpineFuel", ("Vuna.Compiler.Elab.Trait.rewriteTaggedSpineFuel", "Vuna/Compiler/Elab/Trait.vuna:1412"));
  ("Elab_dTrait.v_sameMethodShort", ("Vuna.Compiler.Elab.Trait.sameMethodShort", "Vuna/Compiler/Elab/Trait.vuna:793"));
  ("Elab_dTrait.v_seedKindOf", ("Vuna.Compiler.Elab.Trait.seedKindOf", "Vuna/Compiler/Elab/Trait.vuna:624"));
  ("Elab_dTrait.v_solveCtxGoals", ("Vuna.Compiler.Elab.Trait.solveCtxGoals", "Vuna/Compiler/Elab/Trait.vuna:1007"));
  ("Elab_dTrait.v_solveCtxGoalsGo", ("Vuna.Compiler.Elab.Trait.solveCtxGoalsGo", "Vuna/Compiler/Elab/Trait.vuna:1010"));
  ("Elab_dTrait.v_solveLiftedMeta", ("Vuna.Compiler.Elab.Trait.solveLiftedMeta", "Vuna/Compiler/Elab/Trait.vuna:1201"));
  ("Elab_dTrait.v_solveLiftedMetas", ("Vuna.Compiler.Elab.Trait.solveLiftedMetas", "Vuna/Compiler/Elab/Trait.vuna:1208"));
  ("Elab_dTrait.v_spanOfName", ("Vuna.Compiler.Elab.Trait.spanOfName", "Vuna/Compiler/Elab/Trait.vuna:1569"));
  ("Elab_dTrait.v_spineSize", ("Vuna.Compiler.Elab.Trait.spineSize", "Vuna/Compiler/Elab/Trait.vuna:1408"));
  ("Elab_dTrait.v_substInstParams", ("Vuna.Compiler.Elab.Trait.substInstParams", "Vuna/Compiler/Elab/Trait.vuna:905"));
  ("Elab_dTrait.v_substInstParamsAlt", ("Vuna.Compiler.Elab.Trait.substInstParamsAlt", "Vuna/Compiler/Elab/Trait.vuna:950"));
  ("Elab_dTrait.v_substInstParamsGo", ("Vuna.Compiler.Elab.Trait.substInstParamsGo", "Vuna/Compiler/Elab/Trait.vuna:908"));
  ("Elab_dTrait.v_substMetaTerm", ("Vuna.Compiler.Elab.Trait.substMetaTerm", "Vuna/Compiler/Elab/Trait.vuna:1084"));
  ("Elab_dTrait.v_substMetaTermAlt", ("Vuna.Compiler.Elab.Trait.substMetaTermAlt", "Vuna/Compiler/Elab/Trait.vuna:1125"));
  ("Elab_dTrait.v_substMetaTermGo", ("Vuna.Compiler.Elab.Trait.substMetaTermGo", "Vuna/Compiler/Elab/Trait.vuna:1087"));
  ("Elab_dTrait.v_substMetaVarList", ("Vuna.Compiler.Elab.Trait.substMetaVarList", "Vuna/Compiler/Elab/Trait.vuna:1310"));
  ("Elab_dTrait.v_substPlannedMetas", ("Vuna.Compiler.Elab.Trait.substPlannedMetas", "Vuna/Compiler/Elab/Trait.vuna:1305"));
  ("Elab_dTrait.v_teleMetasInit", ("Vuna.Compiler.Elab.Trait.teleMetasInit", "Vuna/Compiler/Elab/Trait.vuna:606"));
  ("Elab_dTrait.v_traitKindExplicit", ("Vuna.Compiler.Elab.Trait.traitKindExplicit", "Vuna/Compiler/Elab/Trait.vuna:144"));
  ("Elab_dTrait.v_traitKindInfer", ("Vuna.Compiler.Elab.Trait.traitKindInfer", "Vuna/Compiler/Elab/Trait.vuna:157"));
  ("Elab_dTrait.v_traitMethodPairs", ("Vuna.Compiler.Elab.Trait.traitMethodPairs", "Vuna/Compiler/Elab/Trait.vuna:179"));
  ("Elab_dTrait.v_traitMethodSpanOf", ("Vuna.Compiler.Elab.Trait.traitMethodSpanOf", "Vuna/Compiler/Elab/Trait.vuna:873"));
  ("Elab_dTrait.v_traitParamKinds", ("Vuna.Compiler.Elab.Trait.traitParamKinds", "Vuna/Compiler/Elab/Trait.vuna:137"));
  ("Elab_dTrait.v_traitParamNames", ("Vuna.Compiler.Elab.Trait.traitParamNames", "Vuna/Compiler/Elab/Trait.vuna:133"));
  ("Elab_dTrait.v_wrapDictLams", ("Vuna.Compiler.Elab.Trait.wrapDictLams", "Vuna/Compiler/Elab/Trait.vuna:1297"));
  ("Elab_dTrait.v_wrapDictLamsGo", ("Vuna.Compiler.Elab.Trait.wrapDictLamsGo", "Vuna/Compiler/Elab/Trait.vuna:1300"));
  ("Elab_dTrait.v_wrapDictPis", ("Vuna.Compiler.Elab.Trait.wrapDictPis", "Vuna/Compiler/Elab/Trait.vuna:1277"));
  ("Elab_dTrait.v_wrapDictPisGo", ("Vuna.Compiler.Elab.Trait.wrapDictPisGo", "Vuna/Compiler/Elab/Trait.vuna:1280"));
  ("Elab_dTrait.v_zipClassFields", ("Vuna.Compiler.Elab.Trait.zipClassFields", "Vuna/Compiler/Elab/Trait.vuna:893"));
  ("Elab_dTrait.v_zipMethodFields", ("Vuna.Compiler.Elab.Trait.zipMethodFields", "Vuna/Compiler/Elab/Trait.vuna:896"));
  ("Elab_dTypes.v_allBucketsMatch", ("Vuna.Compiler.Elab.Types.allBucketsMatch", "Vuna/Compiler/Elab/Types.vuna:499"));
  ("Elab_dTypes.v_bucketCount", ("Vuna.Compiler.Elab.Types.bucketCount", "Vuna/Compiler/Elab/Types.vuna:494"));
  ("Elab_dTypes.v_csEmpty", ("Vuna.Compiler.Elab.Types.csEmpty", "Vuna/Compiler/Elab/Types.vuna:288"));
  ("Elab_dTypes.v_ctorTblOfDatas", ("Vuna.Compiler.Elab.Types.ctorTblOfDatas", "Vuna/Compiler/Elab/Types.vuna:922"));
  ("Elab_dTypes.v_ctxBind", ("Vuna.Compiler.Elab.Types.ctxBind", "Vuna/Compiler/Elab/Types.vuna:1130"));
  ("Elab_dTypes.v_ctxBindValue", ("Vuna.Compiler.Elab.Types.ctxBindValue", "Vuna/Compiler/Elab/Types.vuna:1137"));
  ("Elab_dTypes.v_ctxDepth", ("Vuna.Compiler.Elab.Types.ctxDepth", "Vuna/Compiler/Elab/Types.vuna:1127"));
  ("Elab_dTypes.v_ctxEnv", ("Vuna.Compiler.Elab.Types.ctxEnv", "Vuna/Compiler/Elab/Types.vuna:1171"));
  ("Elab_dTypes.v_ctxEnvAt", ("Vuna.Compiler.Elab.Types.ctxEnvAt", "Vuna/Compiler/Elab/Types.vuna:1164"));
  ("Elab_dTypes.v_ctxEnvRefined", ("Vuna.Compiler.Elab.Types.ctxEnvRefined", "Vuna/Compiler/Elab/Types.vuna:1175"));
  ("Elab_dTypes.v_ctxLookup", ("Vuna.Compiler.Elab.Types.ctxLookup", "Vuna/Compiler/Elab/Types.vuna:1155"));
  ("Elab_dTypes.v_ctxLookupAt", ("Vuna.Compiler.Elab.Types.ctxLookupAt", "Vuna/Compiler/Elab/Types.vuna:1150"));
  ("Elab_dTypes.v_ctxRefine", ("Vuna.Compiler.Elab.Types.ctxRefine", "Vuna/Compiler/Elab/Types.vuna:1144"));
  ("Elab_dTypes.v_dataCtorPairs", ("Vuna.Compiler.Elab.Types.dataCtorPairs", "Vuna/Compiler/Elab/Types.vuna:925"));
  ("Elab_dTypes.v_datasHaveLinear", ("Vuna.Compiler.Elab.Types.datasHaveLinear", "Vuna/Compiler/Elab/Types.vuna:1103"));
  ("Elab_dTypes.v_dtClassName", ("Vuna.Compiler.Elab.Types.dtClassName", "Vuna/Compiler/Elab/Types.vuna:159"));
  ("Elab_dTypes.v_dtCtorFamily", ("Vuna.Compiler.Elab.Types.dtCtorFamily", "Vuna/Compiler/Elab/Types.vuna:75"));
  ("Elab_dTypes.v_dtCtorName", ("Vuna.Compiler.Elab.Types.dtCtorName", "Vuna/Compiler/Elab/Types.vuna:72"));
  ("Elab_dTypes.v_dtCtorTelescope", ("Vuna.Compiler.Elab.Types.dtCtorTelescope", "Vuna/Compiler/Elab/Types.vuna:78"));
  ("Elab_dTypes.v_dtCtorType", ("Vuna.Compiler.Elab.Types.dtCtorType", "Vuna/Compiler/Elab/Types.vuna:81"));
  ("Elab_dTypes.v_dtDataCtors", ("Vuna.Compiler.Elab.Types.dtDataCtors", "Vuna/Compiler/Elab/Types.vuna:114"));
  ("Elab_dTypes.v_dtDataFields", ("Vuna.Compiler.Elab.Types.dtDataFields", "Vuna/Compiler/Elab/Types.vuna:129"));
  ("Elab_dTypes.v_dtDataIsRecord", ("Vuna.Compiler.Elab.Types.dtDataIsRecord", "Vuna/Compiler/Elab/Types.vuna:133"));
  ("Elab_dTypes.v_dtDataKind", ("Vuna.Compiler.Elab.Types.dtDataKind", "Vuna/Compiler/Elab/Types.vuna:117"));
  ("Elab_dTypes.v_dtDataLinear", ("Vuna.Compiler.Elab.Types.dtDataLinear", "Vuna/Compiler/Elab/Types.vuna:136"));
  ("Elab_dTypes.v_dtDataName", ("Vuna.Compiler.Elab.Types.dtDataName", "Vuna/Compiler/Elab/Types.vuna:111"));
  ("Elab_dTypes.v_dtDataRepr", ("Vuna.Compiler.Elab.Types.dtDataRepr", "Vuna/Compiler/Elab/Types.vuna:125"));
  ("Elab_dTypes.v_dtDataViaClasses", ("Vuna.Compiler.Elab.Types.dtDataViaClasses", "Vuna/Compiler/Elab/Types.vuna:121"));
  ("Elab_dTypes.v_dtDefBody", ("Vuna.Compiler.Elab.Types.dtDefBody", "Vuna/Compiler/Elab/Types.vuna:41"));
  ("Elab_dTypes.v_dtDefExtern", ("Vuna.Compiler.Elab.Types.dtDefExtern", "Vuna/Compiler/Elab/Types.vuna:53"));
  ("Elab_dTypes.v_dtDefHasBody", ("Vuna.Compiler.Elab.Types.dtDefHasBody", "Vuna/Compiler/Elab/Types.vuna:47"));
  ("Elab_dTypes.v_dtDefName", ("Vuna.Compiler.Elab.Types.dtDefName", "Vuna/Compiler/Elab/Types.vuna:31"));
  ("Elab_dTypes.v_dtDefSpan", ("Vuna.Compiler.Elab.Types.dtDefSpan", "Vuna/Compiler/Elab/Types.vuna:58"));
  ("Elab_dTypes.v_dtDefType", ("Vuna.Compiler.Elab.Types.dtDefType", "Vuna/Compiler/Elab/Types.vuna:36"));
  ("Elab_dTypes.v_dtInstKey", ("Vuna.Compiler.Elab.Types.dtInstKey", "Vuna/Compiler/Elab/Types.vuna:184"));
  ("Elab_dTypes.v_dtInstName", ("Vuna.Compiler.Elab.Types.dtInstName", "Vuna/Compiler/Elab/Types.vuna:178"));
  ("Elab_dTypes.v_dtInstSym", ("Vuna.Compiler.Elab.Types.dtInstSym", "Vuna/Compiler/Elab/Types.vuna:181"));
  ("Elab_dTypes.v_dtProgClasses", ("Vuna.Compiler.Elab.Types.dtProgClasses", "Vuna/Compiler/Elab/Types.vuna:1291"));
  ("Elab_dTypes.v_dtProgDatas", ("Vuna.Compiler.Elab.Types.dtProgDatas", "Vuna/Compiler/Elab/Types.vuna:1273"));
  ("Elab_dTypes.v_dtProgDefs", ("Vuna.Compiler.Elab.Types.dtProgDefs", "Vuna/Compiler/Elab/Types.vuna:1276"));
  ("Elab_dTypes.v_dtProgGlobals", ("Vuna.Compiler.Elab.Types.dtProgGlobals", "Vuna/Compiler/Elab/Types.vuna:1285"));
  ("Elab_dTypes.v_dtProgGoals", ("Vuna.Compiler.Elab.Types.dtProgGoals", "Vuna/Compiler/Elab/Types.vuna:1279"));
  ("Elab_dTypes.v_dtProgInsts", ("Vuna.Compiler.Elab.Types.dtProgInsts", "Vuna/Compiler/Elab/Types.vuna:1288"));
  ("Elab_dTypes.v_dtProgSols", ("Vuna.Compiler.Elab.Types.dtProgSols", "Vuna/Compiler/Elab/Types.vuna:1282"));
  ("Elab_dTypes.v_dtProgWarnings", ("Vuna.Compiler.Elab.Types.dtProgWarnings", "Vuna/Compiler/Elab/Types.vuna:1295"));
  ("Elab_dTypes.v_ecAddClass", ("Vuna.Compiler.Elab.Types.ecAddClass", "Vuna/Compiler/Elab/Types.vuna:580"));
  ("Elab_dTypes.v_ecAddConstraint", ("Vuna.Compiler.Elab.Types.ecAddConstraint", "Vuna/Compiler/Elab/Types.vuna:686"));
  ("Elab_dTypes.v_ecAddData", ("Vuna.Compiler.Elab.Types.ecAddData", "Vuna/Compiler/Elab/Types.vuna:895"));
  ("Elab_dTypes.v_ecAddDef", ("Vuna.Compiler.Elab.Types.ecAddDef", "Vuna/Compiler/Elab/Types.vuna:837"));
  ("Elab_dTypes.v_ecAddError", ("Vuna.Compiler.Elab.Types.ecAddError", "Vuna/Compiler/Elab/Types.vuna:1077"));
  ("Elab_dTypes.v_ecAddGoal", ("Vuna.Compiler.Elab.Types.ecAddGoal", "Vuna/Compiler/Elab/Types.vuna:516"));
  ("Elab_dTypes.v_ecAddInst", ("Vuna.Compiler.Elab.Types.ecAddInst", "Vuna/Compiler/Elab/Types.vuna:542"));
  ("Elab_dTypes.v_ecAddInstRaw", ("Vuna.Compiler.Elab.Types.ecAddInstRaw", "Vuna/Compiler/Elab/Types.vuna:554"));
  ("Elab_dTypes.v_ecAddWarning", ("Vuna.Compiler.Elab.Types.ecAddWarning", "Vuna/Compiler/Elab/Types.vuna:1039"));
  ("Elab_dTypes.v_ecBump", ("Vuna.Compiler.Elab.Types.ecBump", "Vuna/Compiler/Elab/Types.vuna:1046"));
  ("Elab_dTypes.v_ecClasses", ("Vuna.Compiler.Elab.Types.ecClasses", "Vuna/Compiler/Elab/Types.vuna:512"));
  ("Elab_dTypes.v_ecConstraints", ("Vuna.Compiler.Elab.Types.ecConstraints", "Vuna/Compiler/Elab/Types.vuna:608"));
  ("Elab_dTypes.v_ecCounters", ("Vuna.Compiler.Elab.Types.ecCounters", "Vuna/Compiler/Elab/Types.vuna:1043"));
  ("Elab_dTypes.v_ecCtorIndexComplete", ("Vuna.Compiler.Elab.Types.ecCtorIndexComplete", "Vuna/Compiler/Elab/Types.vuna:801"));
  ("Elab_dTypes.v_ecDatas", ("Vuna.Compiler.Elab.Types.ecDatas", "Vuna/Compiler/Elab/Types.vuna:429"));
  ("Elab_dTypes.v_ecDefTbl", ("Vuna.Compiler.Elab.Types.ecDefTbl", "Vuna/Compiler/Elab/Types.vuna:393"));
  ("Elab_dTypes.v_ecDefs", ("Vuna.Compiler.Elab.Types.ecDefs", "Vuna/Compiler/Elab/Types.vuna:388"));
  ("Elab_dTypes.v_ecDepthTbl", ("Vuna.Compiler.Elab.Types.ecDepthTbl", "Vuna/Compiler/Elab/Types.vuna:433"));
  ("Elab_dTypes.v_ecDictPassIdle", ("Vuna.Compiler.Elab.Types.ecDictPassIdle", "Vuna/Compiler/Elab/Types.vuna:813"));
  ("Elab_dTypes.v_ecEmpty", ("Vuna.Compiler.Elab.Types.ecEmpty", "Vuna/Compiler/Elab/Types.vuna:710"));
  ("Elab_dTypes.v_ecErrors", ("Vuna.Compiler.Elab.Types.ecErrors", "Vuna/Compiler/Elab/Types.vuna:1073"));
  ("Elab_dTypes.v_ecGlobalsTbl", ("Vuna.Compiler.Elab.Types.ecGlobalsTbl", "Vuna/Compiler/Elab/Types.vuna:399"));
  ("Elab_dTypes.v_ecGoals", ("Vuna.Compiler.Elab.Types.ecGoals", "Vuna/Compiler/Elab/Types.vuna:466"));
  ("Elab_dTypes.v_ecHasLinear", ("Vuna.Compiler.Elab.Types.ecHasLinear", "Vuna/Compiler/Elab/Types.vuna:936"));
  ("Elab_dTypes.v_ecInsts", ("Vuna.Compiler.Elab.Types.ecInsts", "Vuna/Compiler/Elab/Types.vuna:470"));
  ("Elab_dTypes.v_ecInstsAudit", ("Vuna.Compiler.Elab.Types.ecInstsAudit", "Vuna/Compiler/Elab/Types.vuna:486"));
  ("Elab_dTypes.v_ecInstsFamily", ("Vuna.Compiler.Elab.Types.ecInstsFamily", "Vuna/Compiler/Elab/Types.vuna:476"));
  ("Elab_dTypes.v_ecMetaSpans", ("Vuna.Compiler.Elab.Types.ecMetaSpans", "Vuna/Compiler/Elab/Types.vuna:942"));
  ("Elab_dTypes.v_ecNext", ("Vuna.Compiler.Elab.Types.ecNext", "Vuna/Compiler/Elab/Types.vuna:379"));
  ("Elab_dTypes.v_ecNextConstraintId", ("Vuna.Compiler.Elab.Types.ecNextConstraintId", "Vuna/Compiler/Elab/Types.vuna:652"));
  ("Elab_dTypes.v_ecPendingCount", ("Vuna.Compiler.Elab.Types.ecPendingCount", "Vuna/Compiler/Elab/Types.vuna:646"));
  ("Elab_dTypes.v_ecPendingList", ("Vuna.Compiler.Elab.Types.ecPendingList", "Vuna/Compiler/Elab/Types.vuna:640"));
  ("Elab_dTypes.v_ecPopPending", ("Vuna.Compiler.Elab.Types.ecPopPending", "Vuna/Compiler/Elab/Types.vuna:658"));
  ("Elab_dTypes.v_ecPushPending", ("Vuna.Compiler.Elab.Types.ecPushPending", "Vuna/Compiler/Elab/Types.vuna:668"));
  ("Elab_dTypes.v_ecPutClausesTbl", ("Vuna.Compiler.Elab.Types.ecPutClausesTbl", "Vuna/Compiler/Elab/Types.vuna:353"));
  ("Elab_dTypes.v_ecPutConstraints", ("Vuna.Compiler.Elab.Types.ecPutConstraints", "Vuna/Compiler/Elab/Types.vuna:613"));
  ("Elab_dTypes.v_ecPutCtorIndexComplete", ("Vuna.Compiler.Elab.Types.ecPutCtorIndexComplete", "Vuna/Compiler/Elab/Types.vuna:806"));
  ("Elab_dTypes.v_ecPutCtorTbl", ("Vuna.Compiler.Elab.Types.ecPutCtorTbl", "Vuna/Compiler/Elab/Types.vuna:928"));
  ("Elab_dTypes.v_ecPutDefTbl", ("Vuna.Compiler.Elab.Types.ecPutDefTbl", "Vuna/Compiler/Elab/Types.vuna:1303"));
  ("Elab_dTypes.v_ecPutGlobalsTbl", ("Vuna.Compiler.Elab.Types.ecPutGlobalsTbl", "Vuna/Compiler/Elab/Types.vuna:403"));
  ("Elab_dTypes.v_ecPutMetaSpans", ("Vuna.Compiler.Elab.Types.ecPutMetaSpans", "Vuna/Compiler/Elab/Types.vuna:947"));
  ("Elab_dTypes.v_ecPutNext", ("Vuna.Compiler.Elab.Types.ecPutNext", "Vuna/Compiler/Elab/Types.vuna:327"));
  ("Elab_dTypes.v_ecPutPassMarker", ("Vuna.Compiler.Elab.Types.ecPutPassMarker", "Vuna/Compiler/Elab/Types.vuna:794"));
  ("Elab_dTypes.v_ecPutPending", ("Vuna.Compiler.Elab.Types.ecPutPending", "Vuna/Compiler/Elab/Types.vuna:677"));
  ("Elab_dTypes.v_ecPutSols", ("Vuna.Compiler.Elab.Types.ecPutSols", "Vuna/Compiler/Elab/Types.vuna:747"));
  ("Elab_dTypes.v_ecPutSolsCount", ("Vuna.Compiler.Elab.Types.ecPutSolsCount", "Vuna/Compiler/Elab/Types.vuna:761"));
  ("Elab_dTypes.v_ecPutSolsRaw", ("Vuna.Compiler.Elab.Types.ecPutSolsRaw", "Vuna/Compiler/Elab/Types.vuna:767"));
  ("Elab_dTypes.v_ecPutUseSpans", ("Vuna.Compiler.Elab.Types.ecPutUseSpans", "Vuna/Compiler/Elab/Types.vuna:979"));
  ("Elab_dTypes.v_ecPutWarnings", ("Vuna.Compiler.Elab.Types.ecPutWarnings", "Vuna/Compiler/Elab/Types.vuna:1012"));
  ("Elab_dTypes.v_ecRecordTried", ("Vuna.Compiler.Elab.Types.ecRecordTried", "Vuna/Compiler/Elab/Types.vuna:702"));
  ("Elab_dTypes.v_ecRemoveDefTbl", ("Vuna.Compiler.Elab.Types.ecRemoveDefTbl", "Vuna/Compiler/Elab/Types.vuna:869"));
  ("Elab_dTypes.v_ecSetGlobalsComplete", ("Vuna.Compiler.Elab.Types.ecSetGlobalsComplete", "Vuna/Compiler/Elab/Types.vuna:440"));
  ("Elab_dTypes.v_ecSolTbl", ("Vuna.Compiler.Elab.Types.ecSolTbl", "Vuna/Compiler/Elab/Types.vuna:738"));
  ("Elab_dTypes.v_ecSols", ("Vuna.Compiler.Elab.Types.ecSols", "Vuna/Compiler/Elab/Types.vuna:383"));
  ("Elab_dTypes.v_ecSolsCountOf", ("Vuna.Compiler.Elab.Types.ecSolsCountOf", "Vuna/Compiler/Elab/Types.vuna:756"));
  ("Elab_dTypes.v_ecSolsP", ("Vuna.Compiler.Elab.Types.ecSolsP", "Vuna/Compiler/Elab/Types.vuna:744"));
  ("Elab_dTypes.v_ecTriedAt", ("Vuna.Compiler.Elab.Types.ecTriedAt", "Vuna/Compiler/Elab/Types.vuna:696"));
  ("Elab_dTypes.v_ecUseSpans", ("Vuna.Compiler.Elab.Types.ecUseSpans", "Vuna/Compiler/Elab/Types.vuna:974"));
  ("Elab_dTypes.v_ecWarnings", ("Vuna.Compiler.Elab.Types.ecWarnings", "Vuna/Compiler/Elab/Types.vuna:1007"));
  ("Elab_dTypes.v_emptyCtx", ("Vuna.Compiler.Elab.Types.emptyCtx", "Vuna/Compiler/Elab/Types.vuna:1216"));
  ("Elab_dTypes.v_errAt", ("Vuna.Compiler.Elab.Types.errAt", "Vuna/Compiler/Elab/Types.vuna:1222"));
  ("Elab_dTypes.v_evalCtx", ("Vuna.Compiler.Elab.Types.evalCtx", "Vuna/Compiler/Elab/Types.vuna:1208"));
  ("Elab_dTypes.v_flattenTaggedApp", ("Vuna.Compiler.Elab.Types.flattenTaggedApp", "Vuna/Compiler/Elab/Types.vuna:190"));
  ("Elab_dTypes.v_forceVal", ("Vuna.Compiler.Elab.Types.forceVal", "Vuna/Compiler/Elab/Types.vuna:1253"));
  ("Elab_dTypes.v_hasInstKey", ("Vuna.Compiler.Elab.Types.hasInstKey", "Vuna/Compiler/Elab/Types.vuna:545"));
  ("Elab_dTypes.v_hasInstSym", ("Vuna.Compiler.Elab.Types.hasInstSym", "Vuna/Compiler/Elab/Types.vuna:550"));
  ("Elab_dTypes.v_instFamilyOf", ("Vuna.Compiler.Elab.Types.instFamilyOf", "Vuna/Compiler/Elab/Types.vuna:212"));
  ("Elab_dTypes.v_instNamesEq", ("Vuna.Compiler.Elab.Types.instNamesEq", "Vuna/Compiler/Elab/Types.vuna:506"));
  ("Elab_dTypes.v_instStoreEmpty", ("Vuna.Compiler.Elab.Types.instStoreEmpty", "Vuna/Compiler/Elab/Types.vuna:219"));
  ("Elab_dTypes.v_instStoreFamily", ("Vuna.Compiler.Elab.Types.instStoreFamily", "Vuna/Compiler/Elab/Types.vuna:243"));
  ("Elab_dTypes.v_instStoreOf", ("Vuna.Compiler.Elab.Types.instStoreOf", "Vuna/Compiler/Elab/Types.vuna:224"));
  ("Elab_dTypes.v_instStorePush", ("Vuna.Compiler.Elab.Types.instStorePush", "Vuna/Compiler/Elab/Types.vuna:229"));
  ("Elab_dTypes.v_memDataNameIn", ("Vuna.Compiler.Elab.Types.memDataNameIn", "Vuna/Compiler/Elab/Types.vuna:830"));
  ("Elab_dTypes.v_newMeta", ("Vuna.Compiler.Elab.Types.newMeta", "Vuna/Compiler/Elab/Types.vuna:1226"));
  ("Elab_dTypes.v_prefixUntilId", ("Vuna.Compiler.Elab.Types.prefixUntilId", "Vuna/Compiler/Elab/Types.vuna:824"));
  ("Elab_dTypes.v_refineLookup", ("Vuna.Compiler.Elab.Types.refineLookup", "Vuna/Compiler/Elab/Types.vuna:1203"));
  ("Elab_dTypes.v_refineValue", ("Vuna.Compiler.Elab.Types.refineValue", "Vuna/Compiler/Elab/Types.vuna:1180"));
  ("Elab_dTypes.v_refinedEnv", ("Vuna.Compiler.Elab.Types.refinedEnv", "Vuna/Compiler/Elab/Types.vuna:1159"));
  ("Elab_dTypes.v_solsDelta", ("Vuna.Compiler.Elab.Types.solsDelta", "Vuna/Compiler/Elab/Types.vuna:820"));
  ("Elab_dTypes.v_solsToTbl", ("Vuna.Compiler.Elab.Types.solsToTbl", "Vuna/Compiler/Elab/Types.vuna:1300"));
  ("Elab_dTypes.v_varTypeValue", ("Vuna.Compiler.Elab.Types.varTypeValue", "Vuna/Compiler/Elab/Types.vuna:1213"));
  ("Elab_dUsage.v_binderEditSpan", ("Vuna.Compiler.Elab.Usage.binderEditSpan", "Vuna/Compiler/Elab/Usage.vuna:106"));
  ("Elab_dUsage.v_capAltsFuel", ("Vuna.Compiler.Elab.Usage.capAltsFuel", "Vuna/Compiler/Elab/Usage.vuna:352"));
  ("Elab_dUsage.v_capArgsFuel", ("Vuna.Compiler.Elab.Usage.capArgsFuel", "Vuna/Compiler/Elab/Usage.vuna:340"));
  ("Elab_dUsage.v_capArgsGo", ("Vuna.Compiler.Elab.Usage.capArgsGo", "Vuna/Compiler/Elab/Usage.vuna:343"));
  ("Elab_dUsage.v_capCheck", ("Vuna.Compiler.Elab.Usage.capCheck", "Vuna/Compiler/Elab/Usage.vuna:296"));
  ("Elab_dUsage.v_capCheckFuel", ("Vuna.Compiler.Elab.Usage.capCheckFuel", "Vuna/Compiler/Elab/Usage.vuna:311"));
  ("Elab_dUsage.v_capCheckFuelFor", ("Vuna.Compiler.Elab.Usage.capCheckFuelFor", "Vuna/Compiler/Elab/Usage.vuna:302"));
  ("Elab_dUsage.v_capCheckFuelMax", ("Vuna.Compiler.Elab.Usage.capCheckFuelMax", "Vuna/Compiler/Elab/Usage.vuna:308"));
  ("Elab_dUsage.v_checkAltBinders", ("Vuna.Compiler.Elab.Usage.checkAltBinders", "Vuna/Compiler/Elab/Usage.vuna:140"));
  ("Elab_dUsage.v_checkAltBindersGo", ("Vuna.Compiler.Elab.Usage.checkAltBindersGo", "Vuna/Compiler/Elab/Usage.vuna:143"));
  ("Elab_dUsage.v_checkAlts", ("Vuna.Compiler.Elab.Usage.checkAlts", "Vuna/Compiler/Elab/Usage.vuna:238"));
  ("Elab_dUsage.v_checkAltsGo", ("Vuna.Compiler.Elab.Usage.checkAltsGo", "Vuna/Compiler/Elab/Usage.vuna:241"));
  ("Elab_dUsage.v_checkArgs", ("Vuna.Compiler.Elab.Usage.checkArgs", "Vuna/Compiler/Elab/Usage.vuna:225"));
  ("Elab_dUsage.v_checkArgsGo", ("Vuna.Compiler.Elab.Usage.checkArgsGo", "Vuna/Compiler/Elab/Usage.vuna:228"));
  ("Elab_dUsage.v_checkBinderRig", ("Vuna.Compiler.Elab.Usage.checkBinderRig", "Vuna/Compiler/Elab/Usage.vuna:79"));
  ("Elab_dUsage.v_checkDefCapture", ("Vuna.Compiler.Elab.Usage.checkDefCapture", "Vuna/Compiler/Elab/Usage.vuna:370"));
  ("Elab_dUsage.v_checkDefUsage", ("Vuna.Compiler.Elab.Usage.checkDefUsage", "Vuna/Compiler/Elab/Usage.vuna:273"));
  ("Elab_dUsage.v_checkLamBinder", ("Vuna.Compiler.Elab.Usage.checkLamBinder", "Vuna/Compiler/Elab/Usage.vuna:114"));
  ("Elab_dUsage.v_checkProgramUsage", ("Vuna.Compiler.Elab.Usage.checkProgramUsage", "Vuna/Compiler/Elab/Usage.vuna:379"));
  ("Elab_dUsage.v_checkProgramUsageGo", ("Vuna.Compiler.Elab.Usage.checkProgramUsageGo", "Vuna/Compiler/Elab/Usage.vuna:382"));
  ("Elab_dUsage.v_checkTerm", ("Vuna.Compiler.Elab.Usage.checkTerm", "Vuna/Compiler/Elab/Usage.vuna:175"));
  ("Elab_dUsage.v_ctorFamilyLinear", ("Vuna.Compiler.Elab.Usage.ctorFamilyLinear", "Vuna/Compiler/Elab/Usage.vuna:360"));
  ("Elab_dUsage.v_defSpanOf", ("Vuna.Compiler.Elab.Usage.defSpanOf", "Vuna/Compiler/Elab/Usage.vuna:399"));
  ("Elab_dUsage.v_isRigZero", ("Vuna.Compiler.Elab.Usage.isRigZero", "Vuna/Compiler/Elab/Usage.vuna:267"));
  ("Elab_dUsage.v_isTypeForming", ("Vuna.Compiler.Elab.Usage.isTypeForming", "Vuna/Compiler/Elab/Usage.vuna:28"));
  ("Elab_dUsage.v_isTypeFormingFuel", ("Vuna.Compiler.Elab.Usage.isTypeFormingFuel", "Vuna/Compiler/Elab/Usage.vuna:31"));
  ("Elab_dUsage.v_isTypeLevelDef", ("Vuna.Compiler.Elab.Usage.isTypeLevelDef", "Vuna/Compiler/Elab/Usage.vuna:373"));
  ("Elab_dUsage.v_recordUseSpan", ("Vuna.Compiler.Elab.Usage.recordUseSpan", "Vuna/Compiler/Elab/Usage.vuna:427"));
  ("Elab_dUsage.v_renameSuggestion", ("Vuna.Compiler.Elab.Usage.renameSuggestion", "Vuna/Compiler/Elab/Usage.vuna:411"));
  ("Elab_dUsage.v_resetUseSpans", ("Vuna.Compiler.Elab.Usage.resetUseSpans", "Vuna/Compiler/Elab/Usage.vuna:423"));
  ("Elab_dUsage.v_resolvedBinderSpan", ("Vuna.Compiler.Elab.Usage.resolvedBinderSpan", "Vuna/Compiler/Elab/Usage.vuna:101"));
  ("Elab_dUsage.v_shadowedByRuntime", ("Vuna.Compiler.Elab.Usage.shadowedByRuntime", "Vuna/Compiler/Elab/Usage.vuna:133"));
  ("Elab_dUsage.v_uAdd", ("Vuna.Compiler.Elab.Usage.uAdd", "Vuna/Compiler/Elab/Usage.vuna:55"));
  ("Elab_dUsage.v_uDrop", ("Vuna.Compiler.Elab.Usage.uDrop", "Vuna/Compiler/Elab/Usage.vuna:68"));
  ("Elab_dUsage.v_uJoin", ("Vuna.Compiler.Elab.Usage.uJoin", "Vuna/Compiler/Elab/Usage.vuna:63"));
  ("Elab_dUsage.v_uScale", ("Vuna.Compiler.Elab.Usage.uScale", "Vuna/Compiler/Elab/Usage.vuna:60"));
  ("Elab_dUsage.v_uVarAt", ("Vuna.Compiler.Elab.Usage.uVarAt", "Vuna/Compiler/Elab/Usage.vuna:48"));
  ("Elab_dUsage.v_uVarAtGo", ("Vuna.Compiler.Elab.Usage.uVarAtGo", "Vuna/Compiler/Elab/Usage.vuna:51"));
  ("Elab_dUsage.v_uZeroOf", ("Vuna.Compiler.Elab.Usage.uZeroOf", "Vuna/Compiler/Elab/Usage.vuna:45"));
  ("Elab_dUsage.v_usesOf", ("Vuna.Compiler.Elab.Usage.usesOf", "Vuna/Compiler/Elab/Usage.vuna:431"));
  ("Elab_dUsage.v_warnAt", ("Vuna.Compiler.Elab.Usage.warnAt", "Vuna/Compiler/Elab/Usage.vuna:449"));
  ("Elab_dUsage.v_warnAt0", ("Vuna.Compiler.Elab.Usage.warnAt0", "Vuna/Compiler/Elab/Usage.vuna:453"));
  ("Elab_dUsage.v_warnAt0Mod", ("Vuna.Compiler.Elab.Usage.warnAt0Mod", "Vuna/Compiler/Elab/Usage.vuna:465"));
  ("Elab_dUsage.v_warnAt1", ("Vuna.Compiler.Elab.Usage.warnAt1", "Vuna/Compiler/Elab/Usage.vuna:457"));
  ("Elab_dUsage.v_warnAt1Mod", ("Vuna.Compiler.Elab.Usage.warnAt1Mod", "Vuna/Compiler/Elab/Usage.vuna:461"));
  ("Elab_dUsage.v_warnUnusedBinder", ("Vuna.Compiler.Elab.Usage.warnUnusedBinder", "Vuna/Compiler/Elab/Usage.vuna:407"));
  ("Elab_dUsage.v_withUseFields", ("Vuna.Compiler.Elab.Usage.withUseFields", "Vuna/Compiler/Elab/Usage.vuna:435"));
  ("Elab_dUsage.v_withUseSpans", ("Vuna.Compiler.Elab.Usage.withUseSpans", "Vuna/Compiler/Elab/Usage.vuna:439"));
  ("Frontend_dAst.v__udeclCtors", ("Vuna.Compiler.Frontend.Ast._declCtors", "Vuna/Compiler/Frontend/Ast.vuna:563"));
  ("Frontend_dAst.v_clauseSubsumedBy", ("Vuna.Compiler.Frontend.Ast.clauseSubsumedBy", "Vuna/Compiler/Frontend/Ast.vuna:364"));
  ("Frontend_dAst.v_clausesFor", ("Vuna.Compiler.Frontend.Ast.clausesFor", "Vuna/Compiler/Frontend/Ast.vuna:486"));
  ("Frontend_dAst.v_collectClauses", ("Vuna.Compiler.Frontend.Ast.collectClauses", "Vuna/Compiler/Frontend/Ast.vuna:478"));
  ("Frontend_dAst.v_ctorArity", ("Vuna.Compiler.Frontend.Ast.ctorArity", "Vuna/Compiler/Frontend/Ast.vuna:528"));
  ("Frontend_dAst.v_ctorDisplayName", ("Vuna.Compiler.Frontend.Ast.ctorDisplayName", "Vuna/Compiler/Frontend/Ast.vuna:507"));
  ("Frontend_dAst.v_ctorName", ("Vuna.Compiler.Frontend.Ast.ctorName", "Vuna/Compiler/Frontend/Ast.vuna:495"));
  ("Frontend_dAst.v_ctorShortName", ("Vuna.Compiler.Frontend.Ast.ctorShortName", "Vuna/Compiler/Frontend/Ast.vuna:501"));
  ("Frontend_dAst.v_ctorSpan", ("Vuna.Compiler.Frontend.Ast.ctorSpan", "Vuna/Compiler/Frontend/Ast.vuna:192"));
  ("Frontend_dAst.v_ctorType", ("Vuna.Compiler.Frontend.Ast.ctorType", "Vuna/Compiler/Frontend/Ast.vuna:516"));
  ("Frontend_dAst.v_ctorsOf", ("Vuna.Compiler.Frontend.Ast.ctorsOf", "Vuna/Compiler/Frontend/Ast.vuna:569"));
  ("Frontend_dAst.v_declAllNames", ("Vuna.Compiler.Frontend.Ast.declAllNames", "Vuna/Compiler/Frontend/Ast.vuna:556"));
  ("Frontend_dAst.v_declDerivings", ("Vuna.Compiler.Frontend.Ast.declDerivings", "Vuna/Compiler/Frontend/Ast.vuna:581"));
  ("Frontend_dAst.v_declNames", ("Vuna.Compiler.Frontend.Ast.declNames", "Vuna/Compiler/Frontend/Ast.vuna:540"));
  ("Frontend_dAst.v_declRef", ("Vuna.Compiler.Frontend.Ast.declRef", "Vuna/Compiler/Frontend/Ast.vuna:427"));
  ("Frontend_dAst.v_declSpan", ("Vuna.Compiler.Frontend.Ast.declSpan", "Vuna/Compiler/Frontend/Ast.vuna:437"));
  ("Frontend_dAst.v_declTypeNames", ("Vuna.Compiler.Frontend.Ast.declTypeNames", "Vuna/Compiler/Frontend/Ast.vuna:572"));
  ("Frontend_dAst.v_detachedNodeRef", ("Vuna.Compiler.Frontend.Ast.detachedNodeRef", "Vuna/Compiler/Frontend/Ast.vuna:31"));
  ("Frontend_dAst.v_doStmtRef", ("Vuna.Compiler.Frontend.Ast.doStmtRef", "Vuna/Compiler/Frontend/Ast.vuna:421"));
  ("Frontend_dAst.v_doStmtSpan", ("Vuna.Compiler.Frontend.Ast.doStmtSpan", "Vuna/Compiler/Frontend/Ast.vuna:415"));
  ("Frontend_dAst.v_exportItemRef", ("Vuna.Compiler.Frontend.Ast.exportItemRef", "Vuna/Compiler/Frontend/Ast.vuna:459"));
  ("Frontend_dAst.v_exportItemSpan", ("Vuna.Compiler.Frontend.Ast.exportItemSpan", "Vuna/Compiler/Frontend/Ast.vuna:475"));
  ("Frontend_dAst.v_exportSpecName", ("Vuna.Compiler.Frontend.Ast.exportSpecName", "Vuna/Compiler/Frontend/Ast.vuna:242"));
  ("Frontend_dAst.v_exportSpecSpan", ("Vuna.Compiler.Frontend.Ast.exportSpecSpan", "Vuna/Compiler/Frontend/Ast.vuna:246"));
  ("Frontend_dAst.v_exprRef", ("Vuna.Compiler.Frontend.Ast.exprRef", "Vuna/Compiler/Frontend/Ast.vuna:398"));
  ("Frontend_dAst.v_exprSpan", ("Vuna.Compiler.Frontend.Ast.exprSpan", "Vuna/Compiler/Frontend/Ast.vuna:368"));
  ("Frontend_dAst.v_fieldName", ("Vuna.Compiler.Frontend.Ast.fieldName", "Vuna/Compiler/Frontend/Ast.vuna:440"));
  ("Frontend_dAst.v_fieldPatOf", ("Vuna.Compiler.Frontend.Ast.fieldPatOf", "Vuna/Compiler/Frontend/Ast.vuna:358"));
  ("Frontend_dAst.v_fieldSpan", ("Vuna.Compiler.Frontend.Ast.fieldSpan", "Vuna/Compiler/Frontend/Ast.vuna:40"));
  ("Frontend_dAst.v_fieldType", ("Vuna.Compiler.Frontend.Ast.fieldType", "Vuna/Compiler/Frontend/Ast.vuna:443"));
  ("Frontend_dAst.v_fixitySpan", ("Vuna.Compiler.Frontend.Ast.fixitySpan", "Vuna/Compiler/Frontend/Ast.vuna:176"));
  ("Frontend_dAst.v_funArity", ("Vuna.Compiler.Frontend.Ast.funArity", "Vuna/Compiler/Frontend/Ast.vuna:489"));
  ("Frontend_dAst.v_importSpan", ("Vuna.Compiler.Frontend.Ast.importSpan", "Vuna/Compiler/Frontend/Ast.vuna:455"));
  ("Frontend_dAst.v_lookupCtorArity", ("Vuna.Compiler.Frontend.Ast.lookupCtorArity", "Vuna/Compiler/Frontend/Ast.vuna:523"));
  ("Frontend_dAst.v_modDeclSpan", ("Vuna.Compiler.Frontend.Ast.modDeclSpan", "Vuna/Compiler/Frontend/Ast.vuna:278"));
  ("Frontend_dAst.v_noNodeRef", ("Vuna.Compiler.Frontend.Ast.noNodeRef", "Vuna/Compiler/Frontend/Ast.vuna:27"));
  ("Frontend_dAst.v_nodeRefId", ("Vuna.Compiler.Frontend.Ast.nodeRefId", "Vuna/Compiler/Frontend/Ast.vuna:20"));
  ("Frontend_dAst.v_nodeRefSpan", ("Vuna.Compiler.Frontend.Ast.nodeRefSpan", "Vuna/Compiler/Frontend/Ast.vuna:23"));
  ("Frontend_dAst.v_opacitySpecName", ("Vuna.Compiler.Frontend.Ast.opacitySpecName", "Vuna/Compiler/Frontend/Ast.vuna:261"));
  ("Frontend_dAst.v_opacitySpecSpan", ("Vuna.Compiler.Frontend.Ast.opacitySpecSpan", "Vuna/Compiler/Frontend/Ast.vuna:264"));
  ("Frontend_dAst.v_patRef", ("Vuna.Compiler.Frontend.Ast.patRef", "Vuna/Compiler/Frontend/Ast.vuna:318"));
  ("Frontend_dAst.v_patSpan", ("Vuna.Compiler.Frontend.Ast.patSpan", "Vuna/Compiler/Frontend/Ast.vuna:293"));
  ("Frontend_dAst.v_patSubsumes", ("Vuna.Compiler.Frontend.Ast.patSubsumes", "Vuna/Compiler/Frontend/Ast.vuna:331"));
  ("Frontend_dAst.v_qtyIsZero", ("Vuna.Compiler.Frontend.Ast.qtyIsZero", "Vuna/Compiler/Frontend/Ast.vuna:78"));
  ("Frontend_dAst.v_reprPrefix", ("Vuna.Compiler.Frontend.Ast.reprPrefix", "Vuna/Compiler/Frontend/Ast.vuna:92"));
  ("Frontend_dAst.v_subsumePatFields", ("Vuna.Compiler.Frontend.Ast.subsumePatFields", "Vuna/Compiler/Frontend/Ast.vuna:351"));
  ("Frontend_dAst.v_subsumePatList", ("Vuna.Compiler.Frontend.Ast.subsumePatList", "Vuna/Compiler/Frontend/Ast.vuna:345"));
  ("Frontend_dAst.v_topNames", ("Vuna.Compiler.Frontend.Ast.topNames", "Vuna/Compiler/Frontend/Ast.vuna:553"));
  ("Frontend_dAst.v_traitMethodName", ("Vuna.Compiler.Frontend.Ast.traitMethodName", "Vuna/Compiler/Frontend/Ast.vuna:446"));
  ("Frontend_dAst.v_traitMethodSpan", ("Vuna.Compiler.Frontend.Ast.traitMethodSpan", "Vuna/Compiler/Frontend/Ast.vuna:50"));
  ("Frontend_dAst.v_typeArity", ("Vuna.Compiler.Frontend.Ast.typeArity", "Vuna/Compiler/Frontend/Ast.vuna:519"));
  ("Frontend_dAst.v_typeNamesOf", ("Vuna.Compiler.Frontend.Ast.typeNamesOf", "Vuna/Compiler/Frontend/Ast.vuna:578"));
  ("Frontend_dAst.v_withExportItemRef", ("Vuna.Compiler.Frontend.Ast.withExportItemRef", "Vuna/Compiler/Frontend/Ast.vuna:468"));
  ("Frontend_dAst.v_withExprId", ("Vuna.Compiler.Frontend.Ast.withExprId", "Vuna/Compiler/Frontend/Ast.vuna:376"));
  ("Frontend_dAst.v_withExprRef", ("Vuna.Compiler.Frontend.Ast.withExprRef", "Vuna/Compiler/Frontend/Ast.vuna:380"));
  ("Frontend_dAst.v_withPatId", ("Vuna.Compiler.Frontend.Ast.withPatId", "Vuna/Compiler/Frontend/Ast.vuna:304"));
  ("Frontend_dAst.v_withPatRef", ("Vuna.Compiler.Frontend.Ast.withPatRef", "Vuna/Compiler/Frontend/Ast.vuna:308"));
  ("Frontend_dCanonical_dAst.v_decAlt", ("Vuna.Compiler.Frontend.Canonical.Ast.decAlt", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:796"));
  ("Frontend_dCanonical_dAst.v_decBinding", ("Vuna.Compiler.Frontend.Canonical.Ast.decBinding", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:750"));
  ("Frontend_dCanonical_dAst.v_decBindingValue", ("Vuna.Compiler.Frontend.Canonical.Ast.decBindingValue", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:776"));
  ("Frontend_dCanonical_dAst.v_decClause", ("Vuna.Compiler.Frontend.Canonical.Ast.decClause", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:809"));
  ("Frontend_dCanonical_dAst.v_decCtor", ("Vuna.Compiler.Frontend.Canonical.Ast.decCtor", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:552"));
  ("Frontend_dCanonical_dAst.v_decCtorComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decCtorComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:989"));
  ("Frontend_dCanonical_dAst.v_decDecl", ("Vuna.Compiler.Frontend.Canonical.Ast.decDecl", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:631"));
  ("Frontend_dCanonical_dAst.v_decDeclComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decDeclComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:954"));
  ("Frontend_dCanonical_dAst.v_decDecls", ("Vuna.Compiler.Frontend.Canonical.Ast.decDecls", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:918"));
  ("Frontend_dCanonical_dAst.v_decDeclsComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decDeclsComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1017"));
  ("Frontend_dCanonical_dAst.v_decDeclsItems", ("Vuna.Compiler.Frontend.Canonical.Ast.decDeclsItems", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:928"));
  ("Frontend_dCanonical_dAst.v_decDoStmt", ("Vuna.Compiler.Frontend.Canonical.Ast.decDoStmt", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:411"));
  ("Frontend_dCanonical_dAst.v_decDoStmtComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decDoStmtComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:982"));
  ("Frontend_dCanonical_dAst.v_decExportItem", ("Vuna.Compiler.Frontend.Canonical.Ast.decExportItem", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1081"));
  ("Frontend_dCanonical_dAst.v_decExportMembers", ("Vuna.Compiler.Frontend.Canonical.Ast.decExportMembers", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1097"));
  ("Frontend_dCanonical_dAst.v_decExportSpec", ("Vuna.Compiler.Frontend.Canonical.Ast.decExportSpec", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1111"));
  ("Frontend_dCanonical_dAst.v_decExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.decExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:438"));
  ("Frontend_dCanonical_dAst.v_decExprComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decExprComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:947"));
  ("Frontend_dCanonical_dAst.v_decExprList", ("Vuna.Compiler.Frontend.Canonical.Ast.decExprList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:874"));
  ("Frontend_dCanonical_dAst.v_decExprListItems", ("Vuna.Compiler.Frontend.Canonical.Ast.decExprListItems", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:884"));
  ("Frontend_dCanonical_dAst.v_decField", ("Vuna.Compiler.Frontend.Canonical.Ast.decField", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:574"));
  ("Frontend_dCanonical_dAst.v_decFieldComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decFieldComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:996"));
  ("Frontend_dCanonical_dAst.v_decFixityLike", ("Vuna.Compiler.Frontend.Canonical.Ast.decFixityLike", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1157"));
  ("Frontend_dCanonical_dAst.v_decImportLike", ("Vuna.Compiler.Frontend.Canonical.Ast.decImportLike", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1151"));
  ("Frontend_dCanonical_dAst.v_decInterpPart", ("Vuna.Compiler.Frontend.Canonical.Ast.decInterpPart", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:345"));
  ("Frontend_dCanonical_dAst.v_decInterpPartComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decInterpPartComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:975"));
  ("Frontend_dCanonical_dAst.v_decListDigits", ("Vuna.Compiler.Frontend.Canonical.Ast.decListDigits", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:859"));
  ("Frontend_dCanonical_dAst.v_decListHead", ("Vuna.Compiler.Frontend.Canonical.Ast.decListHead", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:849"));
  ("Frontend_dCanonical_dAst.v_decMaybeExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.decMaybeExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:341"));
  ("Frontend_dCanonical_dAst.v_decMaybeQty", ("Vuna.Compiler.Frontend.Canonical.Ast.decMaybeQty", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:337"));
  ("Frontend_dCanonical_dAst.v_decModDecl", ("Vuna.Compiler.Frontend.Canonical.Ast.decModDecl", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1145"));
  ("Frontend_dCanonical_dAst.v_decOpacity", ("Vuna.Compiler.Frontend.Canonical.Ast.decOpacity", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1124"));
  ("Frontend_dCanonical_dAst.v_decOpacitySpec", ("Vuna.Compiler.Frontend.Canonical.Ast.decOpacitySpec", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1138"));
  ("Frontend_dCanonical_dAst.v_decPat", ("Vuna.Compiler.Frontend.Canonical.Ast.decPat", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:365"));
  ("Frontend_dCanonical_dAst.v_decPatComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decPatComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:940"));
  ("Frontend_dCanonical_dAst.v_decPatList", ("Vuna.Compiler.Frontend.Canonical.Ast.decPatList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:896"));
  ("Frontend_dCanonical_dAst.v_decPatListItems", ("Vuna.Compiler.Frontend.Canonical.Ast.decPatListItems", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:906"));
  ("Frontend_dCanonical_dAst.v_decQty", ("Vuna.Compiler.Frontend.Canonical.Ast.decQty", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:308"));
  ("Frontend_dCanonical_dAst.v_decQtyComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decQtyComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:961"));
  ("Frontend_dCanonical_dAst.v_decReprTier", ("Vuna.Compiler.Frontend.Canonical.Ast.decReprTier", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:322"));
  ("Frontend_dCanonical_dAst.v_decReprTierComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decReprTierComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:968"));
  ("Frontend_dCanonical_dAst.v_decSourceFileComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decSourceFileComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1164"));
  ("Frontend_dCanonical_dAst.v_decSourceFileGo", ("Vuna.Compiler.Frontend.Canonical.Ast.decSourceFileGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1170"));
  ("Frontend_dCanonical_dAst.v_decStrExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.decStrExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:822"));
  ("Frontend_dCanonical_dAst.v_decStrPat", ("Vuna.Compiler.Frontend.Canonical.Ast.decStrPat", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:835"));
  ("Frontend_dCanonical_dAst.v_decTraitMethod", ("Vuna.Compiler.Frontend.Canonical.Ast.decTraitMethod", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:612"));
  ("Frontend_dCanonical_dAst.v_decTraitMethodComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decTraitMethodComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1010"));
  ("Frontend_dCanonical_dAst.v_decTraitParam", ("Vuna.Compiler.Frontend.Canonical.Ast.decTraitParam", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:593"));
  ("Frontend_dCanonical_dAst.v_decTraitParamComplete", ("Vuna.Compiler.Frontend.Canonical.Ast.decTraitParamComplete", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1003"));
  ("Frontend_dCanonical_dAst.v_encAltList", ("Vuna.Compiler.Frontend.Canonical.Ast.encAltList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:128"));
  ("Frontend_dCanonical_dAst.v_encAltListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encAltListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:131"));
  ("Frontend_dCanonical_dAst.v_encBindingSig", ("Vuna.Compiler.Frontend.Canonical.Ast.encBindingSig", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:116"));
  ("Frontend_dCanonical_dAst.v_encBindingValue", ("Vuna.Compiler.Frontend.Canonical.Ast.encBindingValue", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:123"));
  ("Frontend_dCanonical_dAst.v_encClauses", ("Vuna.Compiler.Frontend.Canonical.Ast.encClauses", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:136"));
  ("Frontend_dCanonical_dAst.v_encClausesGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encClausesGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:140"));
  ("Frontend_dCanonical_dAst.v_encCtor", ("Vuna.Compiler.Frontend.Canonical.Ast.encCtor", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:268"));
  ("Frontend_dCanonical_dAst.v_encCtorList", ("Vuna.Compiler.Frontend.Canonical.Ast.encCtorList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:182"));
  ("Frontend_dCanonical_dAst.v_encCtorListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encCtorListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:186"));
  ("Frontend_dCanonical_dAst.v_encDecl", ("Vuna.Compiler.Frontend.Canonical.Ast.encDecl", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:284"));
  ("Frontend_dCanonical_dAst.v_encDecls", ("Vuna.Compiler.Frontend.Canonical.Ast.encDecls", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:218"));
  ("Frontend_dCanonical_dAst.v_encDeclsGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encDeclsGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:222"));
  ("Frontend_dCanonical_dAst.v_encDoStmt", ("Vuna.Compiler.Frontend.Canonical.Ast.encDoStmt", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:242"));
  ("Frontend_dCanonical_dAst.v_encExportItem", ("Vuna.Compiler.Frontend.Canonical.Ast.encExportItem", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1031"));
  ("Frontend_dCanonical_dAst.v_encExportMembers", ("Vuna.Compiler.Frontend.Canonical.Ast.encExportMembers", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1038"));
  ("Frontend_dCanonical_dAst.v_encExportSpec", ("Vuna.Compiler.Frontend.Canonical.Ast.encExportSpec", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1043"));
  ("Frontend_dCanonical_dAst.v_encExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.encExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:248"));
  ("Frontend_dCanonical_dAst.v_encExprList", ("Vuna.Compiler.Frontend.Canonical.Ast.encExprList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:88"));
  ("Frontend_dCanonical_dAst.v_encExprListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encExprListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:92"));
  ("Frontend_dCanonical_dAst.v_encField", ("Vuna.Compiler.Frontend.Canonical.Ast.encField", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:272"));
  ("Frontend_dCanonical_dAst.v_encFieldList", ("Vuna.Compiler.Frontend.Canonical.Ast.encFieldList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:191"));
  ("Frontend_dCanonical_dAst.v_encFieldListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encFieldListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:195"));
  ("Frontend_dCanonical_dAst.v_encFixityLike", ("Vuna.Compiler.Frontend.Canonical.Ast.encFixityLike", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1077"));
  ("Frontend_dCanonical_dAst.v_encImportLike", ("Vuna.Compiler.Frontend.Canonical.Ast.encImportLike", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1073"));
  ("Frontend_dCanonical_dAst.v_encInterpPart", ("Vuna.Compiler.Frontend.Canonical.Ast.encInterpPart", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:227"));
  ("Frontend_dCanonical_dAst.v_encMaybeExpr", ("Vuna.Compiler.Frontend.Canonical.Ast.encMaybeExpr", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:69"));
  ("Frontend_dCanonical_dAst.v_encMaybeQty", ("Vuna.Compiler.Frontend.Canonical.Ast.encMaybeQty", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:64"));
  ("Frontend_dCanonical_dAst.v_encModDecl", ("Vuna.Compiler.Frontend.Canonical.Ast.encModDecl", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1056"));
  ("Frontend_dCanonical_dAst.v_encOpacity", ("Vuna.Compiler.Frontend.Canonical.Ast.encOpacity", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1047"));
  ("Frontend_dCanonical_dAst.v_encOpacitySpec", ("Vuna.Compiler.Frontend.Canonical.Ast.encOpacitySpec", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1052"));
  ("Frontend_dCanonical_dAst.v_encPartList", ("Vuna.Compiler.Frontend.Canonical.Ast.encPartList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:155"));
  ("Frontend_dCanonical_dAst.v_encPartListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encPartListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:159"));
  ("Frontend_dCanonical_dAst.v_encPat", ("Vuna.Compiler.Frontend.Canonical.Ast.encPat", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:232"));
  ("Frontend_dCanonical_dAst.v_encPatExprList", ("Vuna.Compiler.Frontend.Canonical.Ast.encPatExprList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:106"));
  ("Frontend_dCanonical_dAst.v_encPatExprListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encPatExprListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:110"));
  ("Frontend_dCanonical_dAst.v_encPatList", ("Vuna.Compiler.Frontend.Canonical.Ast.encPatList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:97"));
  ("Frontend_dCanonical_dAst.v_encPatListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encPatListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:101"));
  ("Frontend_dCanonical_dAst.v_encQty", ("Vuna.Compiler.Frontend.Canonical.Ast.encQty", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:53"));
  ("Frontend_dCanonical_dAst.v_encReprTier", ("Vuna.Compiler.Frontend.Canonical.Ast.encReprTier", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:58"));
  ("Frontend_dCanonical_dAst.v_encSourceFile", ("Vuna.Compiler.Frontend.Canonical.Ast.encSourceFile", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:1063"));
  ("Frontend_dCanonical_dAst.v_encStmtList", ("Vuna.Compiler.Frontend.Canonical.Ast.encStmtList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:146"));
  ("Frontend_dCanonical_dAst.v_encStmtListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encStmtListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:150"));
  ("Frontend_dCanonical_dAst.v_encStrExprList", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrExprList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:164"));
  ("Frontend_dCanonical_dAst.v_encStrExprListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrExprListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:168"));
  ("Frontend_dCanonical_dAst.v_encStrList", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:79"));
  ("Frontend_dCanonical_dAst.v_encStrListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:83"));
  ("Frontend_dCanonical_dAst.v_encStrPatList", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrPatList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:173"));
  ("Frontend_dCanonical_dAst.v_encStrPatListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encStrPatListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:177"));
  ("Frontend_dCanonical_dAst.v_encTraitMethod", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitMethod", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:280"));
  ("Frontend_dCanonical_dAst.v_encTraitMethodList", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitMethodList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:209"));
  ("Frontend_dCanonical_dAst.v_encTraitMethodListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitMethodListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:213"));
  ("Frontend_dCanonical_dAst.v_encTraitParam", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitParam", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:276"));
  ("Frontend_dCanonical_dAst.v_encTraitParamList", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitParamList", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:200"));
  ("Frontend_dCanonical_dAst.v_encTraitParamListGo", ("Vuna.Compiler.Frontend.Canonical.Ast.encTraitParamListGo", "Vuna/Compiler/Frontend/Canonical/Ast.vuna:204"));
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
  ("Frontend_dCst.v_addKid", ("Vuna.Compiler.Frontend.Cst.addKid", "Vuna/Compiler/Frontend/Cst.vuna:924"));
  ("Frontend_dCst.v_adjacentParenDepth", ("Vuna.Compiler.Frontend.Cst.adjacentParenDepth", "Vuna/Compiler/Frontend/Cst.vuna:957"));
  ("Frontend_dCst.v_advanceBy", ("Vuna.Compiler.Frontend.Cst.advanceBy", "Vuna/Compiler/Frontend/Cst.vuna:114"));
  ("Frontend_dCst.v_advanceTo", ("Vuna.Compiler.Frontend.Cst.advanceTo", "Vuna/Compiler/Frontend/Cst.vuna:105"));
  ("Frontend_dCst.v_anchorRefsOfTree", ("Vuna.Compiler.Frontend.Cst.anchorRefsOfTree", "Vuna/Compiler/Frontend/Cst.vuna:873"));
  ("Frontend_dCst.v_applySurfaceTree", ("Vuna.Compiler.Frontend.Cst.applySurfaceTree", "Vuna/Compiler/Frontend/Cst.vuna:634"));
  ("Frontend_dCst.v_backtickOfFacts", ("Vuna.Compiler.Frontend.Cst.backtickOfFacts", "Vuna/Compiler/Frontend/Cst.vuna:700"));
  ("Frontend_dCst.v_backtickOfIndex", ("Vuna.Compiler.Frontend.Cst.backtickOfIndex", "Vuna/Compiler/Frontend/Cst.vuna:831"));
  ("Frontend_dCst.v_buildTokens", ("Vuna.Compiler.Frontend.Cst.buildTokens", "Vuna/Compiler/Frontend/Cst.vuna:290"));
  ("Frontend_dCst.v_closeAllFrames", ("Vuna.Compiler.Frontend.Cst.closeAllFrames", "Vuna/Compiler/Frontend/Cst.vuna:558"));
  ("Frontend_dCst.v_closeTopFrame", ("Vuna.Compiler.Frontend.Cst.closeTopFrame", "Vuna/Compiler/Frontend/Cst.vuna:547"));
  ("Frontend_dCst.v_collectLeaves", ("Vuna.Compiler.Frontend.Cst.collectLeaves", "Vuna/Compiler/Frontend/Cst.vuna:751"));
  ("Frontend_dCst.v_commentEndPos", ("Vuna.Compiler.Frontend.Cst.commentEndPos", "Vuna/Compiler/Frontend/Cst.vuna:233"));
  ("Frontend_dCst.v_commentStartsAtOrAfter", ("Vuna.Compiler.Frontend.Cst.commentStartsAtOrAfter", "Vuna/Compiler/Frontend/Cst.vuna:261"));
  ("Frontend_dCst.v_commentTrivia", ("Vuna.Compiler.Frontend.Cst.commentTrivia", "Vuna/Compiler/Frontend/Cst.vuna:226"));
  ("Frontend_dCst.v_commentTriviaKind", ("Vuna.Compiler.Frontend.Cst.commentTriviaKind", "Vuna/Compiler/Frontend/Cst.vuna:220"));
  ("Frontend_dCst.v_consumeParen", ("Vuna.Compiler.Frontend.Cst.consumeParen", "Vuna/Compiler/Frontend/Cst.vuna:962"));
  ("Frontend_dCst.v_cstIndexOf", ("Vuna.Compiler.Frontend.Cst.cstIndexOf", "Vuna/Compiler/Frontend/Cst.vuna:781"));
  ("Frontend_dCst.v_cstKindTag", ("Vuna.Compiler.Frontend.Cst.cstKindTag", "Vuna/Compiler/Frontend/Cst.vuna:454"));
  ("Frontend_dCst.v_curPos", ("Vuna.Compiler.Frontend.Cst.curPos", "Vuna/Compiler/Frontend/Cst.vuna:92"));
  ("Frontend_dCst.v_degenerateSpan", ("Vuna.Compiler.Frontend.Cst.degenerateSpan", "Vuna/Compiler/Frontend/Cst.vuna:506"));
  ("Frontend_dCst.v_emptyCstIndex", ("Vuna.Compiler.Frontend.Cst.emptyCstIndex", "Vuna/Compiler/Frontend/Cst.vuna:809"));
  ("Frontend_dCst.v_emptyCstSurface", ("Vuna.Compiler.Frontend.Cst.emptyCstSurface", "Vuna/Compiler/Frontend/Cst.vuna:404"));
  ("Frontend_dCst.v_emptyFactEntries", ("Vuna.Compiler.Frontend.Cst.emptyFactEntries", "Vuna/Compiler/Frontend/Cst.vuna:726"));
  ("Frontend_dCst.v_emptyFixityFacts", ("Vuna.Compiler.Frontend.Cst.emptyFixityFacts", "Vuna/Compiler/Frontend/Cst.vuna:682"));
  ("Frontend_dCst.v_emptyIndexAcc", ("Vuna.Compiler.Frontend.Cst.emptyIndexAcc", "Vuna/Compiler/Frontend/Cst.vuna:778"));
  ("Frontend_dCst.v_emptyKey", ("Vuna.Compiler.Frontend.Cst.emptyKey", "Vuna/Compiler/Frontend/Cst.vuna:679"));
  ("Frontend_dCst.v_emptyNodeTable", ("Vuna.Compiler.Frontend.Cst.emptyNodeTable", "Vuna/Compiler/Frontend/Cst.vuna:814"));
  ("Frontend_dCst.v_emptyParenTable", ("Vuna.Compiler.Frontend.Cst.emptyParenTable", "Vuna/Compiler/Frontend/Cst.vuna:676"));
  ("Frontend_dCst.v_eventIndex", ("Vuna.Compiler.Frontend.Cst.eventIndex", "Vuna/Compiler/Frontend/Cst.vuna:568"));
  ("Frontend_dCst.v_factsGo", ("Vuna.Compiler.Frontend.Cst.factsGo", "Vuna/Compiler/Frontend/Cst.vuna:729"));
  ("Frontend_dCst.v_factsGoList", ("Vuna.Compiler.Frontend.Cst.factsGoList", "Vuna/Compiler/Frontend/Cst.vuna:746"));
  ("Frontend_dCst.v_finishFrame", ("Vuna.Compiler.Frontend.Cst.finishFrame", "Vuna/Compiler/Frontend/Cst.vuna:524"));
  ("Frontend_dCst.v_finishRoot", ("Vuna.Compiler.Frontend.Cst.finishRoot", "Vuna/Compiler/Frontend/Cst.vuna:592"));
  ("Frontend_dCst.v_fixityFactsOf", ("Vuna.Compiler.Frontend.Cst.fixityFactsOf", "Vuna/Compiler/Frontend/Cst.vuna:686"));
  ("Frontend_dCst.v_gapTrivia", ("Vuna.Compiler.Frontend.Cst.gapTrivia", "Vuna/Compiler/Frontend/Cst.vuna:240"));
  ("Frontend_dCst.v_headSpan", ("Vuna.Compiler.Frontend.Cst.headSpan", "Vuna/Compiler/Frontend/Cst.vuna:519"));
  ("Frontend_dCst.v_headTokOf", ("Vuna.Compiler.Frontend.Cst.headTokOf", "Vuna/Compiler/Frontend/Cst.vuna:971"));
  ("Frontend_dCst.v_holeRootOf", ("Vuna.Compiler.Frontend.Cst.holeRootOf", "Vuna/Compiler/Frontend/Cst.vuna:619"));
  ("Frontend_dCst.v_indexGo", ("Vuna.Compiler.Frontend.Cst.indexGo", "Vuna/Compiler/Frontend/Cst.vuna:787"));
  ("Frontend_dCst.v_indexGoList", ("Vuna.Compiler.Frontend.Cst.indexGoList", "Vuna/Compiler/Frontend/Cst.vuna:804"));
  ("Frontend_dCst.v_interpMultiOfIndex", ("Vuna.Compiler.Frontend.Cst.interpMultiOfIndex", "Vuna/Compiler/Frontend/Cst.vuna:851"));
  ("Frontend_dCst.v_isCloseParen", ("Vuna.Compiler.Frontend.Cst.isCloseParen", "Vuna/Compiler/Frontend/Cst.vuna:948"));
  ("Frontend_dCst.v_isExprFrame", ("Vuna.Compiler.Frontend.Cst.isExprFrame", "Vuna/Compiler/Frontend/Cst.vuna:952"));
  ("Frontend_dCst.v_isOpenParen", ("Vuna.Compiler.Frontend.Cst.isOpenParen", "Vuna/Compiler/Frontend/Cst.vuna:944"));
  ("Frontend_dCst.v_isParenFrame", ("Vuna.Compiler.Frontend.Cst.isParenFrame", "Vuna/Compiler/Frontend/Cst.vuna:930"));
  ("Frontend_dCst.v_lastSpanOf", ("Vuna.Compiler.Frontend.Cst.lastSpanOf", "Vuna/Compiler/Frontend/Cst.vuna:515"));
  ("Frontend_dCst.v_lastSpanOfList", ("Vuna.Compiler.Frontend.Cst.lastSpanOfList", "Vuna/Compiler/Frontend/Cst.vuna:510"));
  ("Frontend_dCst.v_lexCst", ("Vuna.Compiler.Frontend.Cst.lexCst", "Vuna/Compiler/Frontend/Cst.vuna:325"));
  ("Frontend_dCst.v_lexTokensOf", ("Vuna.Compiler.Frontend.Cst.lexTokensOf", "Vuna/Compiler/Frontend/Cst.vuna:306"));
  ("Frontend_dCst.v_lexTokensOfFrom", ("Vuna.Compiler.Frontend.Cst.lexTokensOfFrom", "Vuna/Compiler/Frontend/Cst.vuna:315"));
  ("Frontend_dCst.v_lineCurAt", ("Vuna.Compiler.Frontend.Cst.lineCurAt", "Vuna/Compiler/Frontend/Cst.vuna:320"));
  ("Frontend_dCst.v_lineCurStart", ("Vuna.Compiler.Frontend.Cst.lineCurStart", "Vuna/Compiler/Frontend/Cst.vuna:89"));
  ("Frontend_dCst.v_lookupBacktick", ("Vuna.Compiler.Frontend.Cst.lookupBacktick", "Vuna/Compiler/Frontend/Cst.vuna:703"));
  ("Frontend_dCst.v_lookupHoleTrees", ("Vuna.Compiler.Frontend.Cst.lookupHoleTrees", "Vuna/Compiler/Frontend/Cst.vuna:660"));
  ("Frontend_dCst.v_lookupInterp", ("Vuna.Compiler.Frontend.Cst.lookupInterp", "Vuna/Compiler/Frontend/Cst.vuna:717"));
  ("Frontend_dCst.v_lookupSection", ("Vuna.Compiler.Frontend.Cst.lookupSection", "Vuna/Compiler/Frontend/Cst.vuna:711"));
  ("Frontend_dCst.v_nestEvents", ("Vuna.Compiler.Frontend.Cst.nestEvents", "Vuna/Compiler/Frontend/Cst.vuna:577"));
  ("Frontend_dCst.v_nestFrameCount", ("Vuna.Compiler.Frontend.Cst.nestFrameCount", "Vuna/Compiler/Frontend/Cst.vuna:553"));
  ("Frontend_dCst.v_nestToTree", ("Vuna.Compiler.Frontend.Cst.nestToTree", "Vuna/Compiler/Frontend/Cst.vuna:609"));
  ("Frontend_dCst.v_nestToTreeWithSurface", ("Vuna.Compiler.Frontend.Cst.nestToTreeWithSurface", "Vuna/Compiler/Frontend/Cst.vuna:628"));
  ("Frontend_dCst.v_nodeChildren", ("Vuna.Compiler.Frontend.Cst.nodeChildren", "Vuna/Compiler/Frontend/Cst.vuna:439"));
  ("Frontend_dCst.v_nodeId", ("Vuna.Compiler.Frontend.Cst.nodeId", "Vuna/Compiler/Frontend/Cst.vuna:429"));
  ("Frontend_dCst.v_nodeIndex", ("Vuna.Compiler.Frontend.Cst.nodeIndex", "Vuna/Compiler/Frontend/Cst.vuna:762"));
  ("Frontend_dCst.v_nodeKind", ("Vuna.Compiler.Frontend.Cst.nodeKind", "Vuna/Compiler/Frontend/Cst.vuna:434"));
  ("Frontend_dCst.v_nodeKindTag", ("Vuna.Compiler.Frontend.Cst.nodeKindTag", "Vuna/Compiler/Frontend/Cst.vuna:450"));
  ("Frontend_dCst.v_nodeSpan", ("Vuna.Compiler.Frontend.Cst.nodeSpan", "Vuna/Compiler/Frontend/Cst.vuna:419"));
  ("Frontend_dCst.v_nodeSurface", ("Vuna.Compiler.Frontend.Cst.nodeSurface", "Vuna/Compiler/Frontend/Cst.vuna:424"));
  ("Frontend_dCst.v_nodeTable", ("Vuna.Compiler.Frontend.Cst.nodeTable", "Vuna/Compiler/Frontend/Cst.vuna:756"));
  ("Frontend_dCst.v_nodeToken", ("Vuna.Compiler.Frontend.Cst.nodeToken", "Vuna/Compiler/Frontend/Cst.vuna:444"));
  ("Frontend_dCst.v_openFrame", ("Vuna.Compiler.Frontend.Cst.openFrame", "Vuna/Compiler/Frontend/Cst.vuna:920"));
  ("Frontend_dCst.v_parenDepthOfFacts", ("Vuna.Compiler.Frontend.Cst.parenDepthOfFacts", "Vuna/Compiler/Frontend/Cst.vuna:693"));
  ("Frontend_dCst.v_parenDepthOfIndex", ("Vuna.Compiler.Frontend.Cst.parenDepthOfIndex", "Vuna/Compiler/Frontend/Cst.vuna:821"));
  ("Frontend_dCst.v_parenEntriesOf", ("Vuna.Compiler.Frontend.Cst.parenEntriesOf", "Vuna/Compiler/Frontend/Cst.vuna:1003"));
  ("Frontend_dCst.v_parenWalk", ("Vuna.Compiler.Frontend.Cst.parenWalk", "Vuna/Compiler/Frontend/Cst.vuna:976"));
  ("Frontend_dCst.v_pushInto", ("Vuna.Compiler.Frontend.Cst.pushInto", "Vuna/Compiler/Frontend/Cst.vuna:538"));
  ("Frontend_dCst.v_pushLeaves", ("Vuna.Compiler.Frontend.Cst.pushLeaves", "Vuna/Compiler/Frontend/Cst.vuna:532"));
  ("Frontend_dCst.v_pushNode", ("Vuna.Compiler.Frontend.Cst.pushNode", "Vuna/Compiler/Frontend/Cst.vuna:542"));
  ("Frontend_dCst.v_renderCst", ("Vuna.Compiler.Frontend.Cst.renderCst", "Vuna/Compiler/Frontend/Cst.vuna:341"));
  ("Frontend_dCst.v_renderCstTree", ("Vuna.Compiler.Frontend.Cst.renderCstTree", "Vuna/Compiler/Frontend/Cst.vuna:863"));
  ("Frontend_dCst.v_renderParts", ("Vuna.Compiler.Frontend.Cst.renderParts", "Vuna/Compiler/Frontend/Cst.vuna:337"));
  ("Frontend_dCst.v_roundtripOk", ("Vuna.Compiler.Frontend.Cst.roundtripOk", "Vuna/Compiler/Frontend/Cst.vuna:345"));
  ("Frontend_dCst.v_scanDigitsEnd", ("Vuna.Compiler.Frontend.Cst.scanDigitsEnd", "Vuna/Compiler/Frontend/Cst.vuna:130"));
  ("Frontend_dCst.v_scanStringEnd", ("Vuna.Compiler.Frontend.Cst.scanStringEnd", "Vuna/Compiler/Frontend/Cst.vuna:136"));
  ("Frontend_dCst.v_sectionOfFacts", ("Vuna.Compiler.Frontend.Cst.sectionOfFacts", "Vuna/Compiler/Frontend/Cst.vuna:708"));
  ("Frontend_dCst.v_sectionOfIndex", ("Vuna.Compiler.Frontend.Cst.sectionOfIndex", "Vuna/Compiler/Frontend/Cst.vuna:841"));
  ("Frontend_dCst.v_sectionOpOf", ("Vuna.Compiler.Frontend.Cst.sectionOpOf", "Vuna/Compiler/Frontend/Cst.vuna:889"));
  ("Frontend_dCst.v_sliceText", ("Vuna.Compiler.Frontend.Cst.sliceText", "Vuna/Compiler/Frontend/Cst.vuna:123"));
  ("Frontend_dCst.v_spaceTrivia", ("Vuna.Compiler.Frontend.Cst.spaceTrivia", "Vuna/Compiler/Frontend/Cst.vuna:206"));
  ("Frontend_dCst.v_spanEndOf", ("Vuna.Compiler.Frontend.Cst.spanEndOf", "Vuna/Compiler/Frontend/Cst.vuna:202"));
  ("Frontend_dCst.v_spanFrom", ("Vuna.Compiler.Frontend.Cst.spanFrom", "Vuna/Compiler/Frontend/Cst.vuna:494"));
  ("Frontend_dCst.v_spanStartOf", ("Vuna.Compiler.Frontend.Cst.spanStartOf", "Vuna/Compiler/Frontend/Cst.vuna:199"));
  ("Frontend_dCst.v_stepCur", ("Vuna.Compiler.Frontend.Cst.stepCur", "Vuna/Compiler/Frontend/Cst.vuna:96"));
  ("Frontend_dCst.v_takeCommentsBefore", ("Vuna.Compiler.Frontend.Cst.takeCommentsBefore", "Vuna/Compiler/Frontend/Cst.vuna:250"));
  ("Frontend_dCst.v_toTrivComments", ("Vuna.Compiler.Frontend.Cst.toTrivComments", "Vuna/Compiler/Frontend/Cst.vuna:188"));
  ("Frontend_dCst.v_tokTag", ("Vuna.Compiler.Frontend.Cst.tokTag", "Vuna/Compiler/Frontend/Cst.vuna:145"));
  ("Frontend_dCst.v_tokText", ("Vuna.Compiler.Frontend.Cst.tokText", "Vuna/Compiler/Frontend/Cst.vuna:157"));
  ("Frontend_dCst.v_tokenNode", ("Vuna.Compiler.Frontend.Cst.tokenNode", "Vuna/Compiler/Frontend/Cst.vuna:269"));
  ("Frontend_dCst.v_tokenSpanOf", ("Vuna.Compiler.Frontend.Cst.tokenSpanOf", "Vuna/Compiler/Frontend/Cst.vuna:597"));
  ("Frontend_dCst.v_tokensSpan", ("Vuna.Compiler.Frontend.Cst.tokensSpan", "Vuna/Compiler/Frontend/Cst.vuna:601"));
  ("Frontend_dCst.v_triviaTextOf", ("Vuna.Compiler.Frontend.Cst.triviaTextOf", "Vuna/Compiler/Frontend/Cst.vuna:333"));
  ("Frontend_dLexer.v_advanceChar", ("Vuna.Compiler.Frontend.Lexer.advanceChar", "Vuna/Compiler/Frontend/Lexer.vuna:99"));
  ("Frontend_dLexer.v_allOpChars", ("Vuna.Compiler.Frontend.Lexer.allOpChars", "Vuna/Compiler/Frontend/Lexer.vuna:155"));
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
  ("Frontend_dLexer.v_classifyIdent", ("Vuna.Compiler.Frontend.Lexer.classifyIdent", "Vuna/Compiler/Frontend/Lexer.vuna:215"));
  ("Frontend_dLexer.v_collectBlockBody", ("Vuna.Compiler.Frontend.Lexer.collectBlockBody", "Vuna/Compiler/Frontend/Lexer.vuna:254"));
  ("Frontend_dLexer.v_collectFloat", ("Vuna.Compiler.Frontend.Lexer.collectFloat", "Vuna/Compiler/Frontend/Lexer.vuna:448"));
  ("Frontend_dLexer.v_collectFrac", ("Vuna.Compiler.Frontend.Lexer.collectFrac", "Vuna/Compiler/Frontend/Lexer.vuna:460"));
  ("Frontend_dLexer.v_collectIdent", ("Vuna.Compiler.Frontend.Lexer.collectIdent", "Vuna/Compiler/Frontend/Lexer.vuna:395"));
  ("Frontend_dLexer.v_collectInt", ("Vuna.Compiler.Frontend.Lexer.collectInt", "Vuna/Compiler/Frontend/Lexer.vuna:413"));
  ("Frontend_dLexer.v_collectInternalIdent", ("Vuna.Compiler.Frontend.Lexer.collectInternalIdent", "Vuna/Compiler/Frontend/Lexer.vuna:384"));
  ("Frontend_dLexer.v_collectLineBody", ("Vuna.Compiler.Frontend.Lexer.collectLineBody", "Vuna/Compiler/Frontend/Lexer.vuna:242"));
  ("Frontend_dLexer.v_collectOp", ("Vuna.Compiler.Frontend.Lexer.collectOp", "Vuna/Compiler/Frontend/Lexer.vuna:471"));
  ("Frontend_dLexer.v_commentSpan", ("Vuna.Compiler.Frontend.Lexer.commentSpan", "Vuna/Compiler/Frontend/Lexer.vuna:230"));
  ("Frontend_dLexer.v_commentSpanOf", ("Vuna.Compiler.Frontend.Lexer.commentSpanOf", "Vuna/Compiler/Frontend/Lexer.vuna:291"));
  ("Frontend_dLexer.v_decodeEscape", ("Vuna.Compiler.Frontend.Lexer.decodeEscape", "Vuna/Compiler/Frontend/Lexer.vuna:494"));
  ("Frontend_dLexer.v_depthAfter", ("Vuna.Compiler.Frontend.Lexer.depthAfter", "Vuna/Compiler/Frontend/Lexer.vuna:579"));
  ("Frontend_dLexer.v_digitRunIsFloat", ("Vuna.Compiler.Frontend.Lexer.digitRunIsFloat", "Vuna/Compiler/Frontend/Lexer.vuna:435"));
  ("Frontend_dLexer.v_dropOpeningNewline", ("Vuna.Compiler.Frontend.Lexer.dropOpeningNewline", "Vuna/Compiler/Frontend/Lexer.vuna:504"));
  ("Frontend_dLexer.v_dropTrailingSpace", ("Vuna.Compiler.Frontend.Lexer.dropTrailingSpace", "Vuna/Compiler/Frontend/Lexer.vuna:236"));
  ("Frontend_dLexer.v_flushText", ("Vuna.Compiler.Frontend.Lexer.flushText", "Vuna/Compiler/Frontend/Lexer.vuna:513"));
  ("Frontend_dLexer.v_isDigit", ("Vuna.Compiler.Frontend.Lexer.isDigit", "Vuna/Compiler/Frontend/Lexer.vuna:115"));
  ("Frontend_dLexer.v_isIdentChar", ("Vuna.Compiler.Frontend.Lexer.isIdentChar", "Vuna/Compiler/Frontend/Lexer.vuna:112"));
  ("Frontend_dLexer.v_isIdentStart", ("Vuna.Compiler.Frontend.Lexer.isIdentStart", "Vuna/Compiler/Frontend/Lexer.vuna:109"));
  ("Frontend_dLexer.v_isKeyword", ("Vuna.Compiler.Frontend.Lexer.isKeyword", "Vuna/Compiler/Frontend/Lexer.vuna:164"));
  ("Frontend_dLexer.v_isLowerChar", ("Vuna.Compiler.Frontend.Lexer.isLowerChar", "Vuna/Compiler/Frontend/Lexer.vuna:106"));
  ("Frontend_dLexer.v_isOpChar", ("Vuna.Compiler.Frontend.Lexer.isOpChar", "Vuna/Compiler/Frontend/Lexer.vuna:121"));
  ("Frontend_dLexer.v_isSpace", ("Vuna.Compiler.Frontend.Lexer.isSpace", "Vuna/Compiler/Frontend/Lexer.vuna:118"));
  ("Frontend_dLexer.v_isSymbolName", ("Vuna.Compiler.Frontend.Lexer.isSymbolName", "Vuna/Compiler/Frontend/Lexer.vuna:149"));
  ("Frontend_dLexer.v_isUpperChar", ("Vuna.Compiler.Frontend.Lexer.isUpperChar", "Vuna/Compiler/Frontend/Lexer.vuna:103"));
  ("Frontend_dLexer.v_lexChars", ("Vuna.Compiler.Frontend.Lexer.lexChars", "Vuna/Compiler/Frontend/Lexer.vuna:686"));
  ("Frontend_dLexer.v_lexCharsRev", ("Vuna.Compiler.Frontend.Lexer.lexCharsRev", "Vuna/Compiler/Frontend/Lexer.vuna:692"));
  ("Frontend_dLexer.v_lexCharsWith", ("Vuna.Compiler.Frontend.Lexer.lexCharsWith", "Vuna/Compiler/Frontend/Lexer.vuna:663"));
  ("Frontend_dLexer.v_lexCharsWithRev", ("Vuna.Compiler.Frontend.Lexer.lexCharsWithRev", "Vuna/Compiler/Frontend/Lexer.vuna:669"));
  ("Frontend_dLexer.v_lexComments", ("Vuna.Compiler.Frontend.Lexer.lexComments", "Vuna/Compiler/Frontend/Lexer.vuna:715"));
  ("Frontend_dLexer.v_lexHoleTokens", ("Vuna.Compiler.Frontend.Lexer.lexHoleTokens", "Vuna/Compiler/Frontend/Lexer.vuna:560"));
  ("Frontend_dLexer.v_lexOneToken", ("Vuna.Compiler.Frontend.Lexer.lexOneToken", "Vuna/Compiler/Frontend/Lexer.vuna:585"));
  ("Frontend_dLexer.v_lexSingleStringToken", ("Vuna.Compiler.Frontend.Lexer.lexSingleStringToken", "Vuna/Compiler/Frontend/Lexer.vuna:643"));
  ("Frontend_dLexer.v_lexSource", ("Vuna.Compiler.Frontend.Lexer.lexSource", "Vuna/Compiler/Frontend/Lexer.vuna:712"));
  ("Frontend_dLexer.v_lexSourceWithComments", ("Vuna.Compiler.Frontend.Lexer.lexSourceWithComments", "Vuna/Compiler/Frontend/Lexer.vuna:709"));
  ("Frontend_dLexer.v_lexSpanAt", ("Vuna.Compiler.Frontend.Lexer.lexSpanAt", "Vuna/Compiler/Frontend/Lexer.vuna:96"));
  ("Frontend_dLexer.v_lexStringToken", ("Vuna.Compiler.Frontend.Lexer.lexStringToken", "Vuna/Compiler/Frontend/Lexer.vuna:632"));
  ("Frontend_dLexer.v_maxIntLiteral", ("Vuna.Compiler.Frontend.Lexer.maxIntLiteral", "Vuna/Compiler/Frontend/Lexer.vuna:408"));
  ("Frontend_dLexer.v_posWithEnd", ("Vuna.Compiler.Frontend.Lexer.posWithEnd", "Vuna/Compiler/Frontend/Lexer.vuna:93"));
  ("Frontend_dLexer.v_scanTemplateText", ("Vuna.Compiler.Frontend.Lexer.scanTemplateText", "Vuna/Compiler/Frontend/Lexer.vuna:520"));
  ("Frontend_dLexer.v_setTokEnd", ("Vuna.Compiler.Frontend.Lexer.setTokEnd", "Vuna/Compiler/Frontend/Lexer.vuna:89"));
  ("Frontend_dLexer.v_skipBlockComment", ("Vuna.Compiler.Frontend.Lexer.skipBlockComment", "Vuna/Compiler/Frontend/Lexer.vuna:279"));
  ("Frontend_dLexer.v_skipLineComment", ("Vuna.Compiler.Frontend.Lexer.skipLineComment", "Vuna/Compiler/Frontend/Lexer.vuna:267"));
  ("Frontend_dLexer.v_skipTrivia", ("Vuna.Compiler.Frontend.Lexer.skipTrivia", "Vuna/Compiler/Frontend/Lexer.vuna:317"));
  ("Frontend_dLexer.v_skipTriviaComments", ("Vuna.Compiler.Frontend.Lexer.skipTriviaComments", "Vuna/Compiler/Frontend/Lexer.vuna:343"));
  ("Frontend_dLexer.v_skipTriviaCommentsGo", ("Vuna.Compiler.Frontend.Lexer.skipTriviaCommentsGo", "Vuna/Compiler/Frontend/Lexer.vuna:346"));
  ("Frontend_dLexer.v_sourceFuel", ("Vuna.Compiler.Frontend.Lexer.sourceFuel", "Vuna/Compiler/Frontend/Lexer.vuna:727"));
  ("Frontend_dLexer.v_startsWithVunaAt", ("Vuna.Compiler.Frontend.Lexer.startsWithVunaAt", "Vuna/Compiler/Frontend/Lexer.vuna:377"));
  ("Frontend_dLexer.v_trimTrailingSpace", ("Vuna.Compiler.Frontend.Lexer.trimTrailingSpace", "Vuna/Compiler/Frontend/Lexer.vuna:233"));
  ("Frontend_dManifest.v_allHex", ("Vuna.Compiler.Frontend.Manifest.allHex", "Vuna/Compiler/Frontend/Manifest.vuna:437"));
  ("Frontend_dManifest.v_applyDepEntry", ("Vuna.Compiler.Frontend.Manifest.applyDepEntry", "Vuna/Compiler/Frontend/Manifest.vuna:325"));
  ("Frontend_dManifest.v_atLine", ("Vuna.Compiler.Frontend.Manifest.atLine", "Vuna/Compiler/Frontend/Manifest.vuna:102"));
  ("Frontend_dManifest.v_boolField", ("Vuna.Compiler.Frontend.Manifest.boolField", "Vuna/Compiler/Frontend/Manifest.vuna:150"));
  ("Frontend_dManifest.v_buildDependency", ("Vuna.Compiler.Frontend.Manifest.buildDependency", "Vuna/Compiler/Frontend/Manifest.vuna:377"));
  ("Frontend_dManifest.v_buildManifest", ("Vuna.Compiler.Frontend.Manifest.buildManifest", "Vuna/Compiler/Frontend/Manifest.vuna:534"));
  ("Frontend_dManifest.v_buildTables", ("Vuna.Compiler.Frontend.Manifest.buildTables", "Vuna/Compiler/Frontend/Manifest.vuna:412"));
  ("Frontend_dManifest.v_checkEntries", ("Vuna.Compiler.Frontend.Manifest.checkEntries", "Vuna/Compiler/Frontend/Manifest.vuna:281"));
  ("Frontend_dManifest.v_checkHashForm", ("Vuna.Compiler.Frontend.Manifest.checkHashForm", "Vuna/Compiler/Frontend/Manifest.vuna:449"));
  ("Frontend_dManifest.v_checkIdentityForm", ("Vuna.Compiler.Frontend.Manifest.checkIdentityForm", "Vuna/Compiler/Frontend/Manifest.vuna:454"));
  ("Frontend_dManifest.v_checkOneEntry", ("Vuna.Compiler.Frontend.Manifest.checkOneEntry", "Vuna/Compiler/Frontend/Manifest.vuna:263"));
  ("Frontend_dManifest.v_checkRootSections", ("Vuna.Compiler.Frontend.Manifest.checkRootSections", "Vuna/Compiler/Frontend/Manifest.vuna:526"));
  ("Frontend_dManifest.v_collectDependencies", ("Vuna.Compiler.Frontend.Manifest.collectDependencies", "Vuna/Compiler/Frontend/Manifest.vuna:419"));
  ("Frontend_dManifest.v_collectLayers", ("Vuna.Compiler.Frontend.Manifest.collectLayers", "Vuna/Compiler/Frontend/Manifest.vuna:172"));
  ("Frontend_dManifest.v_collectStrings", ("Vuna.Compiler.Frontend.Manifest.collectStrings", "Vuna/Compiler/Frontend/Manifest.vuna:366"));
  ("Frontend_dManifest.v_collectTables", ("Vuna.Compiler.Frontend.Manifest.collectTables", "Vuna/Compiler/Frontend/Manifest.vuna:355"));
  ("Frontend_dManifest.v_depAliasOf", ("Vuna.Compiler.Frontend.Manifest.depAliasOf", "Vuna/Compiler/Frontend/Manifest.vuna:42"));
  ("Frontend_dManifest.v_depAliasOfSection", ("Vuna.Compiler.Frontend.Manifest.depAliasOfSection", "Vuna/Compiler/Frontend/Manifest.vuna:253"));
  ("Frontend_dManifest.v_depHashOf", ("Vuna.Compiler.Frontend.Manifest.depHashOf", "Vuna/Compiler/Frontend/Manifest.vuna:48"));
  ("Frontend_dManifest.v_depIdentityOf", ("Vuna.Compiler.Frontend.Manifest.depIdentityOf", "Vuna/Compiler/Frontend/Manifest.vuna:51"));
  ("Frontend_dManifest.v_depSourceOf", ("Vuna.Compiler.Frontend.Manifest.depSourceOf", "Vuna/Compiler/Frontend/Manifest.vuna:45"));
  ("Frontend_dManifest.v_dirFromRev", ("Vuna.Compiler.Frontend.Manifest.dirFromRev", "Vuna/Compiler/Frontend/Manifest.vuna:632"));
  ("Frontend_dManifest.v_dirResult", ("Vuna.Compiler.Frontend.Manifest.dirResult", "Vuna/Compiler/Frontend/Manifest.vuna:636"));
  ("Frontend_dManifest.v_emptyDepAcc", ("Vuna.Compiler.Frontend.Manifest.emptyDepAcc", "Vuna/Compiler/Frontend/Manifest.vuna:89"));
  ("Frontend_dManifest.v_ensureAcc", ("Vuna.Compiler.Frontend.Manifest.ensureAcc", "Vuna/Compiler/Frontend/Manifest.vuna:294"));
  ("Frontend_dManifest.v_fieldLine", ("Vuna.Compiler.Frontend.Manifest.fieldLine", "Vuna/Compiler/Frontend/Manifest.vuna:113"));
  ("Frontend_dManifest.v_fieldLoc", ("Vuna.Compiler.Frontend.Manifest.fieldLoc", "Vuna/Compiler/Frontend/Manifest.vuna:119"));
  ("Frontend_dManifest.v_hasAcc", ("Vuna.Compiler.Frontend.Manifest.hasAcc", "Vuna/Compiler/Frontend/Manifest.vuna:290"));
  ("Frontend_dManifest.v_intField", ("Vuna.Compiler.Frontend.Manifest.intField", "Vuna/Compiler/Frontend/Manifest.vuna:143"));
  ("Frontend_dManifest.v_isDepSourceKey", ("Vuna.Compiler.Frontend.Manifest.isDepSourceKey", "Vuna/Compiler/Frontend/Manifest.vuna:257"));
  ("Frontend_dManifest.v_isDepTableSection", ("Vuna.Compiler.Frontend.Manifest.isDepTableSection", "Vuna/Compiler/Frontend/Manifest.vuna:243"));
  ("Frontend_dManifest.v_isDigitChar", ("Vuna.Compiler.Frontend.Manifest.isDigitChar", "Vuna/Compiler/Frontend/Manifest.vuna:93"));
  ("Frontend_dManifest.v_isHexChar", ("Vuna.Compiler.Frontend.Manifest.isHexChar", "Vuna/Compiler/Frontend/Manifest.vuna:434"));
  ("Frontend_dManifest.v_isLayersSection", ("Vuna.Compiler.Frontend.Manifest.isLayersSection", "Vuna/Compiler/Frontend/Manifest.vuna:164"));
  ("Frontend_dManifest.v_isLintSection", ("Vuna.Compiler.Frontend.Manifest.isLintSection", "Vuna/Compiler/Frontend/Manifest.vuna:249"));
  ("Frontend_dManifest.v_isLowerAlphaChar", ("Vuna.Compiler.Frontend.Manifest.isLowerAlphaChar", "Vuna/Compiler/Frontend/Manifest.vuna:99"));
  ("Frontend_dManifest.v_isUpperAlphaChar", ("Vuna.Compiler.Frontend.Manifest.isUpperAlphaChar", "Vuna/Compiler/Frontend/Manifest.vuna:96"));
  ("Frontend_dManifest.v_layerHasCycle", ("Vuna.Compiler.Frontend.Manifest.layerHasCycle", "Vuna/Compiler/Frontend/Manifest.vuna:210"));
  ("Frontend_dManifest.v_layerSeen", ("Vuna.Compiler.Frontend.Manifest.layerSeen", "Vuna/Compiler/Frontend/Manifest.vuna:168"));
  ("Frontend_dManifest.v_layerUsesOf", ("Vuna.Compiler.Frontend.Manifest.layerUsesOf", "Vuna/Compiler/Frontend/Manifest.vuna:188"));
  ("Frontend_dManifest.v_layerUsesTotal", ("Vuna.Compiler.Frontend.Manifest.layerUsesTotal", "Vuna/Compiler/Frontend/Manifest.vuna:206"));
  ("Frontend_dManifest.v_layerVisitBound", ("Vuna.Compiler.Frontend.Manifest.layerVisitBound", "Vuna/Compiler/Frontend/Manifest.vuna:203"));
  ("Frontend_dManifest.v_manifestDir", ("Vuna.Compiler.Frontend.Manifest.manifestDir", "Vuna/Compiler/Frontend/Manifest.vuna:629"));
  ("Frontend_dManifest.v_manifestErr", ("Vuna.Compiler.Frontend.Manifest.manifestErr", "Vuna/Compiler/Frontend/Manifest.vuna:105"));
  ("Frontend_dManifest.v_mapAcc", ("Vuna.Compiler.Frontend.Manifest.mapAcc", "Vuna/Compiler/Frontend/Manifest.vuna:297"));
  ("Frontend_dManifest.v_orEmptyList", ("Vuna.Compiler.Frontend.Manifest.orEmptyList", "Vuna/Compiler/Frontend/Manifest.vuna:157"));
  ("Frontend_dManifest.v_orFalse", ("Vuna.Compiler.Frontend.Manifest.orFalse", "Vuna/Compiler/Frontend/Manifest.vuna:238"));
  ("Frontend_dManifest.v_parseManifest", ("Vuna.Compiler.Frontend.Manifest.parseManifest", "Vuna/Compiler/Frontend/Manifest.vuna:556"));
  ("Frontend_dManifest.v_reachesFrom", ("Vuna.Compiler.Frontend.Manifest.reachesFrom", "Vuna/Compiler/Frontend/Manifest.vuna:192"));
  ("Frontend_dManifest.v_resolveManifestPath", ("Vuna.Compiler.Frontend.Manifest.resolveManifestPath", "Vuna/Compiler/Frontend/Manifest.vuna:640"));
  ("Frontend_dManifest.v_sameSection", ("Vuna.Compiler.Frontend.Manifest.sameSection", "Vuna/Compiler/Frontend/Manifest.vuna:108"));
  ("Frontend_dManifest.v_sectionPresent", ("Vuna.Compiler.Frontend.Manifest.sectionPresent", "Vuna/Compiler/Frontend/Manifest.vuna:506"));
  ("Frontend_dManifest.v_setAccGit", ("Vuna.Compiler.Frontend.Manifest.setAccGit", "Vuna/Compiler/Frontend/Manifest.vuna:305"));
  ("Frontend_dManifest.v_setAccHash", ("Vuna.Compiler.Frontend.Manifest.setAccHash", "Vuna/Compiler/Frontend/Manifest.vuna:314"));
  ("Frontend_dManifest.v_setAccIdentity", ("Vuna.Compiler.Frontend.Manifest.setAccIdentity", "Vuna/Compiler/Frontend/Manifest.vuna:317"));
  ("Frontend_dManifest.v_setAccPath", ("Vuna.Compiler.Frontend.Manifest.setAccPath", "Vuna/Compiler/Frontend/Manifest.vuna:302"));
  ("Frontend_dManifest.v_setAccRev", ("Vuna.Compiler.Frontend.Manifest.setAccRev", "Vuna/Compiler/Frontend/Manifest.vuna:308"));
  ("Frontend_dManifest.v_setAccUrl", ("Vuna.Compiler.Frontend.Manifest.setAccUrl", "Vuna/Compiler/Frontend/Manifest.vuna:311"));
  ("Frontend_dManifest.v_startsWithSection", ("Vuna.Compiler.Frontend.Manifest.startsWithSection", "Vuna/Compiler/Frontend/Manifest.vuna:511"));
  ("Frontend_dManifest.v_stringField", ("Vuna.Compiler.Frontend.Manifest.stringField", "Vuna/Compiler/Frontend/Manifest.vuna:125"));
  ("Frontend_dManifest.v_stringListField", ("Vuna.Compiler.Frontend.Manifest.stringListField", "Vuna/Compiler/Frontend/Manifest.vuna:132"));
  ("Frontend_dManifest.v_stringValueOf", ("Vuna.Compiler.Frontend.Manifest.stringValueOf", "Vuna/Compiler/Frontend/Manifest.vuna:320"));
  ("Frontend_dManifest.v_validHashText", ("Vuna.Compiler.Frontend.Manifest.validHashText", "Vuna/Compiler/Frontend/Manifest.vuna:442"));
  ("Frontend_dManifest.v_validModuleName", ("Vuna.Compiler.Frontend.Manifest.validModuleName", "Vuna/Compiler/Frontend/Manifest.vuna:571"));
  ("Frontend_dManifest.v_validModuleSegment", ("Vuna.Compiler.Frontend.Manifest.validModuleSegment", "Vuna/Compiler/Frontend/Manifest.vuna:578"));
  ("Frontend_dManifest.v_validModuleSegmentChars", ("Vuna.Compiler.Frontend.Manifest.validModuleSegmentChars", "Vuna/Compiler/Frontend/Manifest.vuna:581"));
  ("Frontend_dManifest.v_validModuleSegments", ("Vuna.Compiler.Frontend.Manifest.validModuleSegments", "Vuna/Compiler/Frontend/Manifest.vuna:574"));
  ("Frontend_dManifest.v_validModuleTail", ("Vuna.Compiler.Frontend.Manifest.validModuleTail", "Vuna/Compiler/Frontend/Manifest.vuna:585"));
  ("Frontend_dManifest.v_validPackageChars", ("Vuna.Compiler.Frontend.Manifest.validPackageChars", "Vuna/Compiler/Frontend/Manifest.vuna:566"));
  ("Frontend_dManifest.v_validPackageName", ("Vuna.Compiler.Frontend.Manifest.validPackageName", "Vuna/Compiler/Frontend/Manifest.vuna:563"));
  ("Frontend_dManifest.v_validateDependencies", ("Vuna.Compiler.Frontend.Manifest.validateDependencies", "Vuna/Compiler/Frontend/Manifest.vuna:488"));
  ("Frontend_dManifest.v_validateDependency", ("Vuna.Compiler.Frontend.Manifest.validateDependency", "Vuna/Compiler/Frontend/Manifest.vuna:459"));
  ("Frontend_dManifest.v_validateDepsSeen", ("Vuna.Compiler.Frontend.Manifest.validateDepsSeen", "Vuna/Compiler/Frontend/Manifest.vuna:478"));
  ("Frontend_dManifest.v_validateDiagFormat", ("Vuna.Compiler.Frontend.Manifest.validateDiagFormat", "Vuna/Compiler/Frontend/Manifest.vuna:492"));
  ("Frontend_dManifest.v_validateDiagLang", ("Vuna.Compiler.Frontend.Manifest.validateDiagLang", "Vuna/Compiler/Frontend/Manifest.vuna:647"));
  ("Frontend_dManifest.v_validateDiagMax", ("Vuna.Compiler.Frontend.Manifest.validateDiagMax", "Vuna/Compiler/Frontend/Manifest.vuna:500"));
  ("Frontend_dManifest.v_validateExports", ("Vuna.Compiler.Frontend.Manifest.validateExports", "Vuna/Compiler/Frontend/Manifest.vuna:613"));
  ("Frontend_dManifest.v_validateLayerTargets", ("Vuna.Compiler.Frontend.Manifest.validateLayerTargets", "Vuna/Compiler/Frontend/Manifest.vuna:229"));
  ("Frontend_dManifest.v_validateLayers", ("Vuna.Compiler.Frontend.Manifest.validateLayers", "Vuna/Compiler/Frontend/Manifest.vuna:219"));
  ("Frontend_dManifest.v_validateManifest", ("Vuna.Compiler.Frontend.Manifest.validateManifest", "Vuna/Compiler/Frontend/Manifest.vuna:617"));
  ("Frontend_dManifest.v_validateMembers", ("Vuna.Compiler.Frontend.Manifest.validateMembers", "Vuna/Compiler/Frontend/Manifest.vuna:603"));
  ("Frontend_dManifest.v_validateModules", ("Vuna.Compiler.Frontend.Manifest.validateModules", "Vuna/Compiler/Frontend/Manifest.vuna:608"));
  ("Frontend_dManifest.v_validateName", ("Vuna.Compiler.Frontend.Manifest.validateName", "Vuna/Compiler/Frontend/Manifest.vuna:595"));
  ("Frontend_dManifest.v_validateRootShape", ("Vuna.Compiler.Frontend.Manifest.validateRootShape", "Vuna/Compiler/Frontend/Manifest.vuna:516"));
  ("Frontend_dPackages_dPkg.v_absolutePath", ("Vuna.Compiler.Frontend.Packages.Pkg.absolutePath", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:159"));
  ("Frontend_dPackages_dPkg.v_baseCandidates", ("Vuna.Compiler.Frontend.Packages.Pkg.baseCandidates", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:643"));
  ("Frontend_dPackages_dPkg.v_baseNotFound", ("Vuna.Compiler.Frontend.Packages.Pkg.baseNotFound", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:652"));
  ("Frontend_dPackages_dPkg.v_baseOnlyContext", ("Vuna.Compiler.Frontend.Packages.Pkg.baseOnlyContext", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:685"));
  ("Frontend_dPackages_dPkg.v_checkUniqueNamesGo", ("Vuna.Compiler.Frontend.Packages.Pkg.checkUniqueNamesGo", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:409"));
  ("Frontend_dPackages_dPkg.v_checkUniquePackageNames", ("Vuna.Compiler.Frontend.Packages.Pkg.checkUniquePackageNames", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:420"));
  ("Frontend_dPackages_dPkg.v_collectDependencyIds", ("Vuna.Compiler.Frontend.Packages.Pkg.collectDependencyIds", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:399"));
  ("Frontend_dPackages_dPkg.v_collectPackageIds", ("Vuna.Compiler.Frontend.Packages.Pkg.collectPackageIds", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:395"));
  ("Frontend_dPackages_dPkg.v_contextAt", ("Vuna.Compiler.Frontend.Packages.Pkg.contextAt", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:698"));
  ("Frontend_dPackages_dPkg.v_contextDir", ("Vuna.Compiler.Frontend.Packages.Pkg.contextDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:77"));
  ("Frontend_dPackages_dPkg.v_contextForDir", ("Vuna.Compiler.Frontend.Packages.Pkg.contextForDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:743"));
  ("Frontend_dPackages_dPkg.v_contextForFile", ("Vuna.Compiler.Frontend.Packages.Pkg.contextForFile", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:734"));
  ("Frontend_dPackages_dPkg.v_contextPackageName", ("Vuna.Compiler.Frontend.Packages.Pkg.contextPackageName", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:87"));
  ("Frontend_dPackages_dPkg.v_contextPackageOf", ("Vuna.Compiler.Frontend.Packages.Pkg.contextPackageOf", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:84"));
  ("Frontend_dPackages_dPkg.v_contextRelease", ("Vuna.Compiler.Frontend.Packages.Pkg.contextRelease", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:91"));
  ("Frontend_dPackages_dPkg.v_contextRoots", ("Vuna.Compiler.Frontend.Packages.Pkg.contextRoots", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:80"));
  ("Frontend_dPackages_dPkg.v_contextWithRelease", ("Vuna.Compiler.Frontend.Packages.Pkg.contextWithRelease", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:95"));
  ("Frontend_dPackages_dPkg.v_cycleMessage", ("Vuna.Compiler.Frontend.Packages.Pkg.cycleMessage", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:219"));
  ("Frontend_dPackages_dPkg.v_cyclePrefix", ("Vuna.Compiler.Frontend.Packages.Pkg.cyclePrefix", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:209"));
  ("Frontend_dPackages_dPkg.v_dependencyNameOk", ("Vuna.Compiler.Frontend.Packages.Pkg.dependencyNameOk", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:227"));
  ("Frontend_dPackages_dPkg.v_dependencyRootOf", ("Vuna.Compiler.Frontend.Packages.Pkg.dependencyRootOf", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:550"));
  ("Frontend_dPackages_dPkg.v_dependencyRoots", ("Vuna.Compiler.Frontend.Packages.Pkg.dependencyRoots", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:562"));
  ("Frontend_dPackages_dPkg.v_findManifestDir", ("Vuna.Compiler.Frontend.Packages.Pkg.findManifestDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:626"));
  ("Frontend_dPackages_dPkg.v_findManifestDirMaybe", ("Vuna.Compiler.Frontend.Packages.Pkg.findManifestDirMaybe", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:618"));
  ("Frontend_dPackages_dPkg.v_findManifestUpMaybe", ("Vuna.Compiler.Frontend.Packages.Pkg.findManifestUpMaybe", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:598"));
  ("Frontend_dPackages_dPkg.v_findManifestUpMaybeStep", ("Vuna.Compiler.Frontend.Packages.Pkg.findManifestUpMaybeStep", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:607"));
  ("Frontend_dPackages_dPkg.v_firstExistingBase", ("Vuna.Compiler.Frontend.Packages.Pkg.firstExistingBase", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:655"));
  ("Frontend_dPackages_dPkg.v_hasManifest", ("Vuna.Compiler.Frontend.Packages.Pkg.hasManifest", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:640"));
  ("Frontend_dPackages_dPkg.v_joinPath", ("Vuna.Compiler.Frontend.Packages.Pkg.joinPath", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:169"));
  ("Frontend_dPackages_dPkg.v_joinPathsText", ("Vuna.Compiler.Frontend.Packages.Pkg.joinPathsText", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:172"));
  ("Frontend_dPackages_dPkg.v_loadDependencyList", ("Vuna.Compiler.Frontend.Packages.Pkg.loadDependencyList", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:311"));
  ("Frontend_dPackages_dPkg.v_loadManifestAt", ("Vuna.Compiler.Frontend.Packages.Pkg.loadManifestAt", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:179"));
  ("Frontend_dPackages_dPkg.v_loadMembers", ("Vuna.Compiler.Frontend.Packages.Pkg.loadMembers", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:449"));
  ("Frontend_dPackages_dPkg.v_loadOneDependency", ("Vuna.Compiler.Frontend.Packages.Pkg.loadOneDependency", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:333"));
  ("Frontend_dPackages_dPkg.v_loadPackage", ("Vuna.Compiler.Frontend.Packages.Pkg.loadPackage", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:435"));
  ("Frontend_dPackages_dPkg.v_loadPackageWalk", ("Vuna.Compiler.Frontend.Packages.Pkg.loadPackageWalk", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:358"));
  ("Frontend_dPackages_dPkg.v_loadStoreDependency", ("Vuna.Compiler.Frontend.Packages.Pkg.loadStoreDependency", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:238"));
  ("Frontend_dPackages_dPkg.v_loadWorkspace", ("Vuna.Compiler.Frontend.Packages.Pkg.loadWorkspace", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:489"));
  ("Frontend_dPackages_dPkg.v_locateBase", ("Vuna.Compiler.Frontend.Packages.Pkg.locateBase", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:664"));
  ("Frontend_dPackages_dPkg.v_lookupPackageDir", ("Vuna.Compiler.Frontend.Packages.Pkg.lookupPackageDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:404"));
  ("Frontend_dPackages_dPkg.v_manifestNameString", ("Vuna.Compiler.Frontend.Packages.Pkg.manifestNameString", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:197"));
  ("Frontend_dPackages_dPkg.v_memStackDir", ("Vuna.Compiler.Frontend.Packages.Pkg.memStackDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:205"));
  ("Frontend_dPackages_dPkg.v_mismatchMessage", ("Vuna.Compiler.Frontend.Packages.Pkg.mismatchMessage", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:231"));
  ("Frontend_dPackages_dPkg.v_normalizeAcc", ("Vuna.Compiler.Frontend.Packages.Pkg.normalizeAcc", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:128"));
  ("Frontend_dPackages_dPkg.v_normalizeDir", ("Vuna.Compiler.Frontend.Packages.Pkg.normalizeDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:146"));
  ("Frontend_dPackages_dPkg.v_packageContext", ("Vuna.Compiler.Frontend.Packages.Pkg.packageContext", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:588"));
  ("Frontend_dPackages_dPkg.v_packageDependencies", ("Vuna.Compiler.Frontend.Packages.Pkg.packageDependencies", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:46"));
  ("Frontend_dPackages_dPkg.v_packageDir", ("Vuna.Compiler.Frontend.Packages.Pkg.packageDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:98"));
  ("Frontend_dPackages_dPkg.v_packageEntry", ("Vuna.Compiler.Frontend.Packages.Pkg.packageEntry", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:584"));
  ("Frontend_dPackages_dPkg.v_packageExports", ("Vuna.Compiler.Frontend.Packages.Pkg.packageExports", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:107"));
  ("Frontend_dPackages_dPkg.v_packageLayers", ("Vuna.Compiler.Frontend.Packages.Pkg.packageLayers", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:110"));
  ("Frontend_dPackages_dPkg.v_packageName", ("Vuna.Compiler.Frontend.Packages.Pkg.packageName", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:101"));
  ("Frontend_dPackages_dPkg.v_packageRoots", ("Vuna.Compiler.Frontend.Packages.Pkg.packageRoots", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:575"));
  ("Frontend_dPackages_dPkg.v_pkgFuelBound", ("Vuna.Compiler.Frontend.Packages.Pkg.pkgFuelBound", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:431"));
  ("Frontend_dPackages_dPkg.v_rootDir", ("Vuna.Compiler.Frontend.Packages.Pkg.rootDir", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:64"));
  ("Frontend_dPackages_dPkg.v_rootLayers", ("Vuna.Compiler.Frontend.Packages.Pkg.rootLayers", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:70"));
  ("Frontend_dPackages_dPkg.v_rootName", ("Vuna.Compiler.Frontend.Packages.Pkg.rootName", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:67"));
  ("Frontend_dPackages_dPkg.v_rootPackage", ("Vuna.Compiler.Frontend.Packages.Pkg.rootPackage", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:74"));
  ("Frontend_dPackages_dPkg.v_splitOnSlash", ("Vuna.Compiler.Frontend.Packages.Pkg.splitOnSlash", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:122"));
  ("Frontend_dPackages_dPkg.v_splitSlashChars", ("Vuna.Compiler.Frontend.Packages.Pkg.splitSlashChars", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:114"));
  ("Frontend_dPackages_dPkg.v_verifyIdentityEff", ("Vuna.Compiler.Frontend.Packages.Pkg.verifyIdentityEff", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:270"));
  ("Frontend_dPackages_dPkg.v_verifyPathHashEff", ("Vuna.Compiler.Frontend.Packages.Pkg.verifyPathHashEff", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:291"));
  ("Frontend_dPackages_dPkg.v_workspaceAllPackages", ("Vuna.Compiler.Frontend.Packages.Pkg.workspaceAllPackages", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:481"));
  ("Frontend_dPackages_dPkg.v_workspaceContext", ("Vuna.Compiler.Frontend.Packages.Pkg.workspaceContext", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:540"));
  ("Frontend_dPackages_dPkg.v_workspaceMembersOf", ("Vuna.Compiler.Frontend.Packages.Pkg.workspaceMembersOf", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:477"));
  ("Frontend_dPackages_dPkg.v_workspacePackages", ("Vuna.Compiler.Frontend.Packages.Pkg.workspacePackages", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:527"));
  ("Frontend_dPackages_dPkg.v_workspaceRootOf", ("Vuna.Compiler.Frontend.Packages.Pkg.workspaceRootOf", "Vuna/Compiler/Frontend/Packages/Pkg.vuna:474"));
  ("Frontend_dPackages_dSource.v_collectDirFiles", ("Vuna.Compiler.Frontend.Packages.Source.collectDirFiles", "Vuna/Compiler/Frontend/Packages/Source.vuna:88"));
  ("Frontend_dPackages_dSource.v_collectNames", ("Vuna.Compiler.Frontend.Packages.Source.collectNames", "Vuna/Compiler/Frontend/Packages/Source.vuna:106"));
  ("Frontend_dPackages_dSource.v_contentHashOf", ("Vuna.Compiler.Frontend.Packages.Source.contentHashOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:194"));
  ("Frontend_dPackages_dSource.v_depKeyOf", ("Vuna.Compiler.Frontend.Packages.Source.depKeyOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:181"));
  ("Frontend_dPackages_dSource.v_exportsOf", ("Vuna.Compiler.Frontend.Packages.Source.exportsOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:173"));
  ("Frontend_dPackages_dSource.v_filePathLe", ("Vuna.Compiler.Frontend.Packages.Source.filePathLe", "Vuna/Compiler/Frontend/Packages/Source.vuna:152"));
  ("Frontend_dPackages_dSource.v_identityHashOf", ("Vuna.Compiler.Frontend.Packages.Source.identityHashOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:198"));
  ("Frontend_dPackages_dSource.v_normalizeHash", ("Vuna.Compiler.Frontend.Packages.Source.normalizeHash", "Vuna/Compiler/Frontend/Packages/Source.vuna:40"));
  ("Frontend_dPackages_dSource.v_packageFilesEff", ("Vuna.Compiler.Frontend.Packages.Source.packageFilesEff", "Vuna/Compiler/Frontend/Packages/Source.vuna:50"));
  ("Frontend_dPackages_dSource.v_packageNameOf", ("Vuna.Compiler.Frontend.Packages.Source.packageNameOf", "Vuna/Compiler/Frontend/Packages/Source.vuna:167"));
  ("Frontend_dPackages_dSource.v_packageSourceEff", ("Vuna.Compiler.Frontend.Packages.Source.packageSourceEff", "Vuna/Compiler/Frontend/Packages/Source.vuna:159"));
  ("Frontend_dPackages_dSource.v_pkgSourceDepth", ("Vuna.Compiler.Frontend.Packages.Source.pkgSourceDepth", "Vuna/Compiler/Frontend/Packages/Source.vuna:74"));
  ("Frontend_dPackages_dSource.v_readManifestFile", ("Vuna.Compiler.Frontend.Packages.Source.readManifestFile", "Vuna/Compiler/Frontend/Packages/Source.vuna:77"));
  ("Frontend_dPackages_dSource.v_skipSourceDir", ("Vuna.Compiler.Frontend.Packages.Source.skipSourceDir", "Vuna/Compiler/Frontend/Packages/Source.vuna:25"));
  ("Frontend_dPackages_dSource.v_sortByPath", ("Vuna.Compiler.Frontend.Packages.Source.sortByPath", "Vuna/Compiler/Frontend/Packages/Source.vuna:155"));
  ("Frontend_dPackages_dSource.v_verifyHash", ("Vuna.Compiler.Frontend.Packages.Source.verifyHash", "Vuna/Compiler/Frontend/Packages/Source.vuna:44"));
  ("Frontend_dPackages_dSource.v_walkName", ("Vuna.Compiler.Frontend.Packages.Source.walkName", "Vuna/Compiler/Frontend/Packages/Source.vuna:123"));
  ("Frontend_dParser.v_addParsedDecl", ("Vuna.Compiler.Frontend.Parser.addParsedDecl", "Vuna/Compiler/Frontend/Parser.vuna:480"));
  ("Frontend_dParser.v_anyDottedName", ("Vuna.Compiler.Frontend.Parser.anyDottedName", "Vuna/Compiler/Frontend/Parser.vuna:2060"));
  ("Frontend_dParser.v_anyNullary", ("Vuna.Compiler.Frontend.Parser.anyNullary", "Vuna/Compiler/Frontend/Parser.vuna:367"));
  ("Frontend_dParser.v_atIdentName", ("Vuna.Compiler.Frontend.Parser.atIdentName", "Vuna/Compiler/Frontend/Parser.vuna:1422"));
  ("Frontend_dParser.v_bindingBindsGo", ("Vuna.Compiler.Frontend.Parser.bindingBindsGo", "Vuna/Compiler/Frontend/Parser.vuna:1213"));
  ("Frontend_dParser.v_bindingItemsToBinds", ("Vuna.Compiler.Frontend.Parser.bindingItemsToBinds", "Vuna/Compiler/Frontend/Parser.vuna:1210"));
  ("Frontend_dParser.v_bindingSigOf", ("Vuna.Compiler.Frontend.Parser.bindingSigOf", "Vuna/Compiler/Frontend/Parser.vuna:1273"));
  ("Frontend_dParser.v_blockFun", ("Vuna.Compiler.Frontend.Parser.blockFun", "Vuna/Compiler/Frontend/Parser.vuna:407"));
  ("Frontend_dParser.v_blockSig", ("Vuna.Compiler.Frontend.Parser.blockSig", "Vuna/Compiler/Frontend/Parser.vuna:417"));
  ("Frontend_dParser.v_blockStep", ("Vuna.Compiler.Frontend.Parser.blockStep", "Vuna/Compiler/Frontend/Parser.vuna:424"));
  ("Frontend_dParser.v_checkBindersAt", ("Vuna.Compiler.Frontend.Parser.checkBindersAt", "Vuna/Compiler/Frontend/Parser.vuna:2589"));
  ("Frontend_dParser.v_checkNoRepeatedBinders", ("Vuna.Compiler.Frontend.Parser.checkNoRepeatedBinders", "Vuna/Compiler/Frontend/Parser.vuna:2595"));
  ("Frontend_dParser.v_clauseVerdict", ("Vuna.Compiler.Frontend.Parser.clauseVerdict", "Vuna/Compiler/Frontend/Parser.vuna:378"));
  ("Frontend_dParser.v_consumeQty", ("Vuna.Compiler.Frontend.Parser.consumeQty", "Vuna/Compiler/Frontend/Parser.vuna:2065"));
  ("Frontend_dParser.v_ctxThenSplit", ("Vuna.Compiler.Frontend.Parser.ctxThenSplit", "Vuna/Compiler/Frontend/Parser.vuna:1547"));
  ("Frontend_dParser.v_dbAddClause", ("Vuna.Compiler.Frontend.Parser.dbAddClause", "Vuna/Compiler/Frontend/Parser.vuna:364"));
  ("Frontend_dParser.v_dbClose", ("Vuna.Compiler.Frontend.Parser.dbClose", "Vuna/Compiler/Frontend/Parser.vuna:354"));
  ("Frontend_dParser.v_dbOpenAt", ("Vuna.Compiler.Frontend.Parser.dbOpenAt", "Vuna/Compiler/Frontend/Parser.vuna:358"));
  ("Frontend_dParser.v_declRefAt", ("Vuna.Compiler.Frontend.Parser.declRefAt", "Vuna/Compiler/Frontend/Parser.vuna:119"));
  ("Frontend_dParser.v_doLetOrExpr", ("Vuna.Compiler.Frontend.Parser.doLetOrExpr", "Vuna/Compiler/Frontend/Parser.vuna:2535"));
  ("Frontend_dParser.v_emptyDeclAcc", ("Vuna.Compiler.Frontend.Parser.emptyDeclAcc", "Vuna/Compiler/Frontend/Parser.vuna:101"));
  ("Frontend_dParser.v_emptyDeclBlock", ("Vuna.Compiler.Frontend.Parser.emptyDeclBlock", "Vuna/Compiler/Frontend/Parser.vuna:351"));
  ("Frontend_dParser.v_emptyParsedDecl", ("Vuna.Compiler.Frontend.Parser.emptyParsedDecl", "Vuna/Compiler/Frontend/Parser.vuna:110"));
  ("Frontend_dParser.v_expectDeclName", ("Vuna.Compiler.Frontend.Parser.expectDeclName", "Vuna/Compiler/Frontend/Parser.vuna:952"));
  ("Frontend_dParser.v_expectFixityLevel", ("Vuna.Compiler.Frontend.Parser.expectFixityLevel", "Vuna/Compiler/Frontend/Parser.vuna:973"));
  ("Frontend_dParser.v_expectOpName", ("Vuna.Compiler.Frontend.Parser.expectOpName", "Vuna/Compiler/Frontend/Parser.vuna:981"));
  ("Frontend_dParser.v_exportItemOf", ("Vuna.Compiler.Frontend.Parser.exportItemOf", "Vuna/Compiler/Frontend/Parser.vuna:228"));
  ("Frontend_dParser.v_exportMarkerFollows", ("Vuna.Compiler.Frontend.Parser.exportMarkerFollows", "Vuna/Compiler/Frontend/Parser.vuna:555"));
  ("Frontend_dParser.v_exportStart", ("Vuna.Compiler.Frontend.Parser.exportStart", "Vuna/Compiler/Frontend/Parser.vuna:549"));
  ("Frontend_dParser.v_findShadow", ("Vuna.Compiler.Frontend.Parser.findShadow", "Vuna/Compiler/Frontend/Parser.vuna:374"));
  ("Frontend_dParser.v_finishAsPattern", ("Vuna.Compiler.Frontend.Parser.finishAsPattern", "Vuna/Compiler/Frontend/Parser.vuna:2701"));
  ("Frontend_dParser.v_firstDanglingSig", ("Vuna.Compiler.Frontend.Parser.firstDanglingSig", "Vuna/Compiler/Frontend/Parser.vuna:1283"));
  ("Frontend_dParser.v_firstOtherKName", ("Vuna.Compiler.Frontend.Parser.firstOtherKName", "Vuna/Compiler/Frontend/Parser.vuna:2424"));
  ("Frontend_dParser.v_firstRepeatedBinding", ("Vuna.Compiler.Frontend.Parser.firstRepeatedBinding", "Vuna/Compiler/Frontend/Parser.vuna:2576"));
  ("Frontend_dParser.v_firstRepeatedBindingGo", ("Vuna.Compiler.Frontend.Parser.firstRepeatedBindingGo", "Vuna/Compiler/Frontend/Parser.vuna:2580"));
  ("Frontend_dParser.v_foldCons", ("Vuna.Compiler.Frontend.Parser.foldCons", "Vuna/Compiler/Frontend/Parser.vuna:2126"));
  ("Frontend_dParser.v_foldPCon", ("Vuna.Compiler.Frontend.Parser.foldPCon", "Vuna/Compiler/Frontend/Parser.vuna:2770"));
  ("Frontend_dParser.v_foldPairExprs", ("Vuna.Compiler.Frontend.Parser.foldPairExprs", "Vuna/Compiler/Frontend/Parser.vuna:1971"));
  ("Frontend_dParser.v_foldPairPats", ("Vuna.Compiler.Frontend.Parser.foldPairPats", "Vuna/Compiler/Frontend/Parser.vuna:2785"));
  ("Frontend_dParser.v_foldPiNames", ("Vuna.Compiler.Frontend.Parser.foldPiNames", "Vuna/Compiler/Frontend/Parser.vuna:2055"));
  ("Frontend_dParser.v_handleAlt", ("Vuna.Compiler.Frontend.Parser.handleAlt", "Vuna/Compiler/Frontend/Parser.vuna:2432"));
  ("Frontend_dParser.v_handleExpr", ("Vuna.Compiler.Frontend.Parser.handleExpr", "Vuna/Compiler/Frontend/Parser.vuna:2449"));
  ("Frontend_dParser.v_handleOpBinder", ("Vuna.Compiler.Frontend.Parser.handleOpBinder", "Vuna/Compiler/Frontend/Parser.vuna:2269"));
  ("Frontend_dParser.v_handleOpIndexBinder", ("Vuna.Compiler.Frontend.Parser.handleOpIndexBinder", "Vuna/Compiler/Frontend/Parser.vuna:2273"));
  ("Frontend_dParser.v_handleOpKName", ("Vuna.Compiler.Frontend.Parser.handleOpKName", "Vuna/Compiler/Frontend/Parser.vuna:2420"));
  ("Frontend_dParser.v_handleOpLam", ("Vuna.Compiler.Frontend.Parser.handleOpLam", "Vuna/Compiler/Frontend/Parser.vuna:2441"));
  ("Frontend_dParser.v_handleOpTail", ("Vuna.Compiler.Frontend.Parser.handleOpTail", "Vuna/Compiler/Frontend/Parser.vuna:2410"));
  ("Frontend_dParser.v_handleRetExpr", ("Vuna.Compiler.Frontend.Parser.handleRetExpr", "Vuna/Compiler/Frontend/Parser.vuna:2436"));
  ("Frontend_dParser.v_hasBindingSig", ("Vuna.Compiler.Frontend.Parser.hasBindingSig", "Vuna/Compiler/Frontend/Parser.vuna:1277"));
  ("Frontend_dParser.v_holeSpan", ("Vuna.Compiler.Frontend.Parser.holeSpan", "Vuna/Compiler/Frontend/Parser.vuna:1928"));
  ("Frontend_dParser.v_innermostPiCod", ("Vuna.Compiler.Frontend.Parser.innermostPiCod", "Vuna/Compiler/Frontend/Parser.vuna:1552"));
  ("Frontend_dParser.v_instanceMethodStart", ("Vuna.Compiler.Frontend.Parser.instanceMethodStart", "Vuna/Compiler/Frontend/Parser.vuna:1612"));
  ("Frontend_dParser.v_isReturnClauseHead", ("Vuna.Compiler.Frontend.Parser.isReturnClauseHead", "Vuna/Compiler/Frontend/Parser.vuna:2331"));
  ("Frontend_dParser.v_localFunMerge", ("Vuna.Compiler.Frontend.Parser.localFunMerge", "Vuna/Compiler/Frontend/Parser.vuna:1252"));
  ("Frontend_dParser.v_macroAtom", ("Vuna.Compiler.Frontend.Parser.macroAtom", "Vuna/Compiler/Frontend/Parser.vuna:1831"));
  ("Frontend_dParser.v_macroBangAt", ("Vuna.Compiler.Frontend.Parser.macroBangAt", "Vuna/Compiler/Frontend/Parser.vuna:1824"));
  ("Frontend_dParser.v_notAdjacentDiag", ("Vuna.Compiler.Frontend.Parser.notAdjacentDiag", "Vuna/Compiler/Frontend/Parser.vuna:401"));
  ("Frontend_dParser.v_opacityGiven", ("Vuna.Compiler.Frontend.Parser.opacityGiven", "Vuna/Compiler/Frontend/Parser.vuna:649"));
  ("Frontend_dParser.v_opacitySpecOf", ("Vuna.Compiler.Frontend.Parser.opacitySpecOf", "Vuna/Compiler/Frontend/Parser.vuna:653"));
  ("Frontend_dParser.v_opacityStart", ("Vuna.Compiler.Frontend.Parser.opacityStart", "Vuna/Compiler/Frontend/Parser.vuna:580"));
  ("Frontend_dParser.v_parenIsMemberList", ("Vuna.Compiler.Frontend.Parser.parenIsMemberList", "Vuna/Compiler/Frontend/Parser.vuna:923"));
  ("Frontend_dParser.v_parseAlt", ("Vuna.Compiler.Frontend.Parser.parseAlt", "Vuna/Compiler/Frontend/Parser.vuna:2220"));
  ("Frontend_dParser.v_parseAltBody", ("Vuna.Compiler.Frontend.Parser.parseAltBody", "Vuna/Compiler/Frontend/Parser.vuna:2227"));
  ("Frontend_dParser.v_parseAltList", ("Vuna.Compiler.Frontend.Parser.parseAltList", "Vuna/Compiler/Frontend/Parser.vuna:2209"));
  ("Frontend_dParser.v_parseApplication", ("Vuna.Compiler.Frontend.Parser.parseApplication", "Vuna/Compiler/Frontend/Parser.vuna:1742"));
  ("Frontend_dParser.v_parseArgs", ("Vuna.Compiler.Frontend.Parser.parseArgs", "Vuna/Compiler/Frontend/Parser.vuna:1789"));
  ("Frontend_dParser.v_parseAsName", ("Vuna.Compiler.Frontend.Parser.parseAsName", "Vuna/Compiler/Frontend/Parser.vuna:2713"));
  ("Frontend_dParser.v_parseAtPayload", ("Vuna.Compiler.Frontend.Parser.parseAtPayload", "Vuna/Compiler/Frontend/Parser.vuna:1766"));
  ("Frontend_dParser.v_parseAtom", ("Vuna.Compiler.Frontend.Parser.parseAtom", "Vuna/Compiler/Frontend/Parser.vuna:1800"));
  ("Frontend_dParser.v_parseAtomBase", ("Vuna.Compiler.Frontend.Parser.parseAtomBase", "Vuna/Compiler/Frontend/Parser.vuna:1836"));
  ("Frontend_dParser.v_parseAxiom", ("Vuna.Compiler.Frontend.Parser.parseAxiom", "Vuna/Compiler/Frontend/Parser.vuna:1044"));
  ("Frontend_dParser.v_parseAxiomExport", ("Vuna.Compiler.Frontend.Parser.parseAxiomExport", "Vuna/Compiler/Frontend/Parser.vuna:686"));
  ("Frontend_dParser.v_parseBindingDef", ("Vuna.Compiler.Frontend.Parser.parseBindingDef", "Vuna/Compiler/Frontend/Parser.vuna:1190"));
  ("Frontend_dParser.v_parseBindingItem", ("Vuna.Compiler.Frontend.Parser.parseBindingItem", "Vuna/Compiler/Frontend/Parser.vuna:1157"));
  ("Frontend_dParser.v_parseBindingItemBody", ("Vuna.Compiler.Frontend.Parser.parseBindingItemBody", "Vuna/Compiler/Frontend/Parser.vuna:1164"));
  ("Frontend_dParser.v_parseBindingItemsAt", ("Vuna.Compiler.Frontend.Parser.parseBindingItemsAt", "Vuna/Compiler/Frontend/Parser.vuna:1145"));
  ("Frontend_dParser.v_parseBindingPattern", ("Vuna.Compiler.Frontend.Parser.parseBindingPattern", "Vuna/Compiler/Frontend/Parser.vuna:1183"));
  ("Frontend_dParser.v_parseBindingValue", ("Vuna.Compiler.Frontend.Parser.parseBindingValue", "Vuna/Compiler/Frontend/Parser.vuna:1199"));
  ("Frontend_dParser.v_parseCase", ("Vuna.Compiler.Frontend.Parser.parseCase", "Vuna/Compiler/Frontend/Parser.vuna:2178"));
  ("Frontend_dParser.v_parseCaseAlts", ("Vuna.Compiler.Frontend.Parser.parseCaseAlts", "Vuna/Compiler/Frontend/Parser.vuna:2187"));
  ("Frontend_dParser.v_parseClause", ("Vuna.Compiler.Frontend.Parser.parseClause", "Vuna/Compiler/Frontend/Parser.vuna:1086"));
  ("Frontend_dParser.v_parseClausePatterns", ("Vuna.Compiler.Frontend.Parser.parseClausePatterns", "Vuna/Compiler/Frontend/Parser.vuna:1289"));
  ("Frontend_dParser.v_parseCtor", ("Vuna.Compiler.Frontend.Parser.parseCtor", "Vuna/Compiler/Frontend/Parser.vuna:1654"));
  ("Frontend_dParser.v_parseCtorBody", ("Vuna.Compiler.Frontend.Parser.parseCtorBody", "Vuna/Compiler/Frontend/Parser.vuna:1657"));
  ("Frontend_dParser.v_parseCtorList", ("Vuna.Compiler.Frontend.Parser.parseCtorList", "Vuna/Compiler/Frontend/Parser.vuna:1643"));
  ("Frontend_dParser.v_parseCtors", ("Vuna.Compiler.Frontend.Parser.parseCtors", "Vuna/Compiler/Frontend/Parser.vuna:1635"));
  ("Frontend_dParser.v_parseCtxRest", ("Vuna.Compiler.Frontend.Parser.parseCtxRest", "Vuna/Compiler/Frontend/Parser.vuna:1561"));
  ("Frontend_dParser.v_parseCtxThenExpr", ("Vuna.Compiler.Frontend.Parser.parseCtxThenExpr", "Vuna/Compiler/Frontend/Parser.vuna:1535"));
  ("Frontend_dParser.v_parseData", ("Vuna.Compiler.Frontend.Parser.parseData", "Vuna/Compiler/Frontend/Parser.vuna:1337"));
  ("Frontend_dParser.v_parseDataExport", ("Vuna.Compiler.Frontend.Parser.parseDataExport", "Vuna/Compiler/Frontend/Parser.vuna:779"));
  ("Frontend_dParser.v_parseDecl", ("Vuna.Compiler.Frontend.Parser.parseDecl", "Vuna/Compiler/Frontend/Parser.vuna:997"));
  ("Frontend_dParser.v_parseDeclBody", ("Vuna.Compiler.Frontend.Parser.parseDeclBody", "Vuna/Compiler/Frontend/Parser.vuna:1004"));
  ("Frontend_dParser.v_parseDecls", ("Vuna.Compiler.Frontend.Parser.parseDecls", "Vuna/Compiler/Frontend/Parser.vuna:438"));
  ("Frontend_dParser.v_parseDeriving", ("Vuna.Compiler.Frontend.Parser.parseDeriving", "Vuna/Compiler/Frontend/Parser.vuna:1430"));
  ("Frontend_dParser.v_parseDerivingNames", ("Vuna.Compiler.Frontend.Parser.parseDerivingNames", "Vuna/Compiler/Frontend/Parser.vuna:1446"));
  ("Frontend_dParser.v_parseDerivingParens", ("Vuna.Compiler.Frontend.Parser.parseDerivingParens", "Vuna/Compiler/Frontend/Parser.vuna:1440"));
  ("Frontend_dParser.v_parseDo", ("Vuna.Compiler.Frontend.Parser.parseDo", "Vuna/Compiler/Frontend/Parser.vuna:2473"));
  ("Frontend_dParser.v_parseDoExprStmt", ("Vuna.Compiler.Frontend.Parser.parseDoExprStmt", "Vuna/Compiler/Frontend/Parser.vuna:2547"));
  ("Frontend_dParser.v_parseDoStmt", ("Vuna.Compiler.Frontend.Parser.parseDoStmt", "Vuna/Compiler/Frontend/Parser.vuna:2517"));
  ("Frontend_dParser.v_parseDoStmtBody", ("Vuna.Compiler.Frontend.Parser.parseDoStmtBody", "Vuna/Compiler/Frontend/Parser.vuna:2521"));
  ("Frontend_dParser.v_parseDoStmts", ("Vuna.Compiler.Frontend.Parser.parseDoStmts", "Vuna/Compiler/Frontend/Parser.vuna:2496"));
  ("Frontend_dParser.v_parseExportDecl", ("Vuna.Compiler.Frontend.Parser.parseExportDecl", "Vuna/Compiler/Frontend/Parser.vuna:590"));
  ("Frontend_dParser.v_parseExportDeclBody", ("Vuna.Compiler.Frontend.Parser.parseExportDeclBody", "Vuna/Compiler/Frontend/Parser.vuna:597"));
  ("Frontend_dParser.v_parseExportImport", ("Vuna.Compiler.Frontend.Parser.parseExportImport", "Vuna/Compiler/Frontend/Parser.vuna:235"));
  ("Frontend_dParser.v_parseExportImportBody", ("Vuna.Compiler.Frontend.Parser.parseExportImportBody", "Vuna/Compiler/Frontend/Parser.vuna:238"));
  ("Frontend_dParser.v_parseExportItem", ("Vuna.Compiler.Frontend.Parser.parseExportItem", "Vuna/Compiler/Frontend/Parser.vuna:188"));
  ("Frontend_dParser.v_parseExportItemAt", ("Vuna.Compiler.Frontend.Parser.parseExportItemAt", "Vuna/Compiler/Frontend/Parser.vuna:180"));
  ("Frontend_dParser.v_parseExportItems", ("Vuna.Compiler.Frontend.Parser.parseExportItems", "Vuna/Compiler/Frontend/Parser.vuna:165"));
  ("Frontend_dParser.v_parseExportItemsFrom", ("Vuna.Compiler.Frontend.Parser.parseExportItemsFrom", "Vuna/Compiler/Frontend/Parser.vuna:171"));
  ("Frontend_dParser.v_parseExportMembers", ("Vuna.Compiler.Frontend.Parser.parseExportMembers", "Vuna/Compiler/Frontend/Parser.vuna:213"));
  ("Frontend_dParser.v_parseExportNamespace", ("Vuna.Compiler.Frontend.Parser.parseExportNamespace", "Vuna/Compiler/Frontend/Parser.vuna:246"));
  ("Frontend_dParser.v_parseExportNamespaceBody", ("Vuna.Compiler.Frontend.Parser.parseExportNamespaceBody", "Vuna/Compiler/Frontend/Parser.vuna:249"));
  ("Frontend_dParser.v_parseExportedPlain", ("Vuna.Compiler.Frontend.Parser.parseExportedPlain", "Vuna/Compiler/Frontend/Parser.vuna:603"));
  ("Frontend_dParser.v_parseExportedValue", ("Vuna.Compiler.Frontend.Parser.parseExportedValue", "Vuna/Compiler/Frontend/Parser.vuna:658"));
  ("Frontend_dParser.v_parseExpr", ("Vuna.Compiler.Frontend.Parser.parseExpr", "Vuna/Compiler/Frontend/Parser.vuna:1664"));
  ("Frontend_dParser.v_parseExprBody", ("Vuna.Compiler.Frontend.Parser.parseExprBody", "Vuna/Compiler/Frontend/Parser.vuna:1671"));
  ("Frontend_dParser.v_parseExpressionSource", ("Vuna.Compiler.Frontend.Parser.parseExpressionSource", "Vuna/Compiler/Frontend/Parser.vuna:88"));
  ("Frontend_dParser.v_parseExtern", ("Vuna.Compiler.Frontend.Parser.parseExtern", "Vuna/Compiler/Frontend/Parser.vuna:1052"));
  ("Frontend_dParser.v_parseExternExport", ("Vuna.Compiler.Frontend.Parser.parseExternExport", "Vuna/Compiler/Frontend/Parser.vuna:698"));
  ("Frontend_dParser.v_parseField", ("Vuna.Compiler.Frontend.Parser.parseField", "Vuna/Compiler/Frontend/Parser.vuna:1410"));
  ("Frontend_dParser.v_parseFieldBody", ("Vuna.Compiler.Frontend.Parser.parseFieldBody", "Vuna/Compiler/Frontend/Parser.vuna:1414"));
  ("Frontend_dParser.v_parseFieldList", ("Vuna.Compiler.Frontend.Parser.parseFieldList", "Vuna/Compiler/Frontend/Parser.vuna:1399"));
  ("Frontend_dParser.v_parseFieldSuffix", ("Vuna.Compiler.Frontend.Parser.parseFieldSuffix", "Vuna/Compiler/Frontend/Parser.vuna:1810"));
  ("Frontend_dParser.v_parseFields", ("Vuna.Compiler.Frontend.Parser.parseFields", "Vuna/Compiler/Frontend/Parser.vuna:1391"));
  ("Frontend_dParser.v_parseFixityDecl", ("Vuna.Compiler.Frontend.Parser.parseFixityDecl", "Vuna/Compiler/Frontend/Parser.vuna:940"));
  ("Frontend_dParser.v_parseFixityDeclBody", ("Vuna.Compiler.Frontend.Parser.parseFixityDeclBody", "Vuna/Compiler/Frontend/Parser.vuna:944"));
  ("Frontend_dParser.v_parseFixityOrDecl", ("Vuna.Compiler.Frontend.Parser.parseFixityOrDecl", "Vuna/Compiler/Frontend/Parser.vuna:523"));
  ("Frontend_dParser.v_parseHandle", ("Vuna.Compiler.Frontend.Parser.parseHandle", "Vuna/Compiler/Frontend/Parser.vuna:2277"));
  ("Frontend_dParser.v_parseHandleBody", ("Vuna.Compiler.Frontend.Parser.parseHandleBody", "Vuna/Compiler/Frontend/Parser.vuna:2312"));
  ("Frontend_dParser.v_parseHandleClauses", ("Vuna.Compiler.Frontend.Parser.parseHandleClauses", "Vuna/Compiler/Frontend/Parser.vuna:2338"));
  ("Frontend_dParser.v_parseHandleComp", ("Vuna.Compiler.Frontend.Parser.parseHandleComp", "Vuna/Compiler/Frontend/Parser.vuna:2299"));
  ("Frontend_dParser.v_parseHandleOpClause", ("Vuna.Compiler.Frontend.Parser.parseHandleOpClause", "Vuna/Compiler/Frontend/Parser.vuna:2379"));
  ("Frontend_dParser.v_parseHandleOpClauseBody", ("Vuna.Compiler.Frontend.Parser.parseHandleOpClauseBody", "Vuna/Compiler/Frontend/Parser.vuna:2387"));
  ("Frontend_dParser.v_parseHandleRetClause", ("Vuna.Compiler.Frontend.Parser.parseHandleRetClause", "Vuna/Compiler/Frontend/Parser.vuna:2368"));
  ("Frontend_dParser.v_parseIf", ("Vuna.Compiler.Frontend.Parser.parseIf", "Vuna/Compiler/Frontend/Parser.vuna:2462"));
  ("Frontend_dParser.v_parseImportAfterKeyword", ("Vuna.Compiler.Frontend.Parser.parseImportAfterKeyword", "Vuna/Compiler/Frontend/Parser.vuna:257"));
  ("Frontend_dParser.v_parseImportAlias", ("Vuna.Compiler.Frontend.Parser.parseImportAlias", "Vuna/Compiler/Frontend/Parser.vuna:298"));
  ("Frontend_dParser.v_parseImportSpec", ("Vuna.Compiler.Frontend.Parser.parseImportSpec", "Vuna/Compiler/Frontend/Parser.vuna:289"));
  ("Frontend_dParser.v_parseImportSpecBody", ("Vuna.Compiler.Frontend.Parser.parseImportSpecBody", "Vuna/Compiler/Frontend/Parser.vuna:292"));
  ("Frontend_dParser.v_parseImports", ("Vuna.Compiler.Frontend.Parser.parseImports", "Vuna/Compiler/Frontend/Parser.vuna:305"));
  ("Frontend_dParser.v_parseInfix", ("Vuna.Compiler.Frontend.Parser.parseInfix", "Vuna/Compiler/Frontend/Parser.vuna:1687"));
  ("Frontend_dParser.v_parseInstance", ("Vuna.Compiler.Frontend.Parser.parseInstance", "Vuna/Compiler/Frontend/Parser.vuna:1518"));
  ("Frontend_dParser.v_parseInstanceBody", ("Vuna.Compiler.Frontend.Parser.parseInstanceBody", "Vuna/Compiler/Frontend/Parser.vuna:1574"));
  ("Frontend_dParser.v_parseInstanceDecl", ("Vuna.Compiler.Frontend.Parser.parseInstanceDecl", "Vuna/Compiler/Frontend/Parser.vuna:1592"));
  ("Frontend_dParser.v_parseInstanceDeclBody", ("Vuna.Compiler.Frontend.Parser.parseInstanceDeclBody", "Vuna/Compiler/Frontend/Parser.vuna:1602"));
  ("Frontend_dParser.v_parseInstanceDeclList", ("Vuna.Compiler.Frontend.Parser.parseInstanceDeclList", "Vuna/Compiler/Frontend/Parser.vuna:1582"));
  ("Frontend_dParser.v_parseInstanceTail", ("Vuna.Compiler.Frontend.Parser.parseInstanceTail", "Vuna/Compiler/Frontend/Parser.vuna:1529"));
  ("Frontend_dParser.v_parseLambda", ("Vuna.Compiler.Frontend.Parser.parseLambda", "Vuna/Compiler/Frontend/Parser.vuna:2130"));
  ("Frontend_dParser.v_parseLambdaParam", ("Vuna.Compiler.Frontend.Parser.parseLambdaParam", "Vuna/Compiler/Frontend/Parser.vuna:2140"));
  ("Frontend_dParser.v_parseLambdaParams", ("Vuna.Compiler.Frontend.Parser.parseLambdaParams", "Vuna/Compiler/Frontend/Parser.vuna:2144"));
  ("Frontend_dParser.v_parseLet", ("Vuna.Compiler.Frontend.Parser.parseLet", "Vuna/Compiler/Frontend/Parser.vuna:2155"));
  ("Frontend_dParser.v_parseLetBindings", ("Vuna.Compiler.Frontend.Parser.parseLetBindings", "Vuna/Compiler/Frontend/Parser.vuna:2166"));
  ("Frontend_dParser.v_parseLhs", ("Vuna.Compiler.Frontend.Parser.parseLhs", "Vuna/Compiler/Frontend/Parser.vuna:1714"));
  ("Frontend_dParser.v_parseLinearDecl", ("Vuna.Compiler.Frontend.Parser.parseLinearDecl", "Vuna/Compiler/Frontend/Parser.vuna:1301"));
  ("Frontend_dParser.v_parseLinearExport", ("Vuna.Compiler.Frontend.Parser.parseLinearExport", "Vuna/Compiler/Frontend/Parser.vuna:711"));
  ("Frontend_dParser.v_parseListElemAt", ("Vuna.Compiler.Frontend.Parser.parseListElemAt", "Vuna/Compiler/Frontend/Parser.vuna:2114"));
  ("Frontend_dParser.v_parseListExpr", ("Vuna.Compiler.Frontend.Parser.parseListExpr", "Vuna/Compiler/Frontend/Parser.vuna:2094"));
  ("Frontend_dParser.v_parseListExprElems", ("Vuna.Compiler.Frontend.Parser.parseListExprElems", "Vuna/Compiler/Frontend/Parser.vuna:2103"));
  ("Frontend_dParser.v_parseListPattern", ("Vuna.Compiler.Frontend.Parser.parseListPattern", "Vuna/Compiler/Frontend/Parser.vuna:2751"));
  ("Frontend_dParser.v_parseListPatternElems", ("Vuna.Compiler.Frontend.Parser.parseListPatternElems", "Vuna/Compiler/Frontend/Parser.vuna:2760"));
  ("Frontend_dParser.v_parseMemberNames", ("Vuna.Compiler.Frontend.Parser.parseMemberNames", "Vuna/Compiler/Frontend/Parser.vuna:219"));
  ("Frontend_dParser.v_parseMethodSig", ("Vuna.Compiler.Frontend.Parser.parseMethodSig", "Vuna/Compiler/Frontend/Parser.vuna:1505"));
  ("Frontend_dParser.v_parseMethodSigBody", ("Vuna.Compiler.Frontend.Parser.parseMethodSigBody", "Vuna/Compiler/Frontend/Parser.vuna:1509"));
  ("Frontend_dParser.v_parseMethodSigList", ("Vuna.Compiler.Frontend.Parser.parseMethodSigList", "Vuna/Compiler/Frontend/Parser.vuna:1494"));
  ("Frontend_dParser.v_parseMethodSigs", ("Vuna.Compiler.Frontend.Parser.parseMethodSigs", "Vuna/Compiler/Frontend/Parser.vuna:1486"));
  ("Frontend_dParser.v_parseModDecl", ("Vuna.Compiler.Frontend.Parser.parseModDecl", "Vuna/Compiler/Frontend/Parser.vuna:147"));
  ("Frontend_dParser.v_parseModDeclBody", ("Vuna.Compiler.Frontend.Parser.parseModDeclBody", "Vuna/Compiler/Frontend/Parser.vuna:154"));
  ("Frontend_dParser.v_parseNegation", ("Vuna.Compiler.Frontend.Parser.parseNegation", "Vuna/Compiler/Frontend/Parser.vuna:1732"));
  ("Frontend_dParser.v_parseOpacityDecl", ("Vuna.Compiler.Frontend.Parser.parseOpacityDecl", "Vuna/Compiler/Frontend/Parser.vuna:722"));
  ("Frontend_dParser.v_parseOpacityDeclBody", ("Vuna.Compiler.Frontend.Parser.parseOpacityDeclBody", "Vuna/Compiler/Frontend/Parser.vuna:729"));
  ("Frontend_dParser.v_parseOpacityValue", ("Vuna.Compiler.Frontend.Parser.parseOpacityValue", "Vuna/Compiler/Frontend/Parser.vuna:746"));
  ("Frontend_dParser.v_parseOptionalMembers", ("Vuna.Compiler.Frontend.Parser.parseOptionalMembers", "Vuna/Compiler/Frontend/Parser.vuna:935"));
  ("Frontend_dParser.v_parseParams", ("Vuna.Compiler.Frontend.Parser.parseParams", "Vuna/Compiler/Frontend/Parser.vuna:1626"));
  ("Frontend_dParser.v_parseParenAtom", ("Vuna.Compiler.Frontend.Parser.parseParenAtom", "Vuna/Compiler/Frontend/Parser.vuna:1945"));
  ("Frontend_dParser.v_parseParenTupleRest", ("Vuna.Compiler.Frontend.Parser.parseParenTupleRest", "Vuna/Compiler/Frontend/Parser.vuna:1961"));
  ("Frontend_dParser.v_parsePatternAtom", ("Vuna.Compiler.Frontend.Parser.parsePatternAtom", "Vuna/Compiler/Frontend/Parser.vuna:2691"));
  ("Frontend_dParser.v_parsePatternAtomBase", ("Vuna.Compiler.Frontend.Parser.parsePatternAtomBase", "Vuna/Compiler/Frontend/Parser.vuna:2722"));
  ("Frontend_dParser.v_parsePatternAtoms", ("Vuna.Compiler.Frontend.Parser.parsePatternAtoms", "Vuna/Compiler/Frontend/Parser.vuna:2680"));
  ("Frontend_dParser.v_parsePatternCons", ("Vuna.Compiler.Frontend.Parser.parsePatternCons", "Vuna/Compiler/Frontend/Parser.vuna:2616"));
  ("Frontend_dParser.v_parsePatternHead", ("Vuna.Compiler.Frontend.Parser.parsePatternHead", "Vuna/Compiler/Frontend/Parser.vuna:2625"));
  ("Frontend_dParser.v_parsePatternSingle", ("Vuna.Compiler.Frontend.Parser.parsePatternSingle", "Vuna/Compiler/Frontend/Parser.vuna:2604"));
  ("Frontend_dParser.v_parsePatternSingleBody", ("Vuna.Compiler.Frontend.Parser.parsePatternSingleBody", "Vuna/Compiler/Frontend/Parser.vuna:2611"));
  ("Frontend_dParser.v_parsePatternTupleRest", ("Vuna.Compiler.Frontend.Parser.parsePatternTupleRest", "Vuna/Compiler/Frontend/Parser.vuna:2775"));
  ("Frontend_dParser.v_parsePerform", ("Vuna.Compiler.Frontend.Parser.parsePerform", "Vuna/Compiler/Frontend/Parser.vuna:2240"));
  ("Frontend_dParser.v_parsePiBinder", ("Vuna.Compiler.Frontend.Parser.parsePiBinder", "Vuna/Compiler/Frontend/Parser.vuna:2024"));
  ("Frontend_dParser.v_parsePiNames", ("Vuna.Compiler.Frontend.Parser.parsePiNames", "Vuna/Compiler/Frontend/Parser.vuna:2036"));
  ("Frontend_dParser.v_parsePiNamesRest", ("Vuna.Compiler.Frontend.Parser.parsePiNamesRest", "Vuna/Compiler/Frontend/Parser.vuna:2045"));
  ("Frontend_dParser.v_parseRecord", ("Vuna.Compiler.Frontend.Parser.parseRecord", "Vuna/Compiler/Frontend/Parser.vuna:1368"));
  ("Frontend_dParser.v_parseRecordAssignList", ("Vuna.Compiler.Frontend.Parser.parseRecordAssignList", "Vuna/Compiler/Frontend/Parser.vuna:2085"));
  ("Frontend_dParser.v_parseRecordAssignments", ("Vuna.Compiler.Frontend.Parser.parseRecordAssignments", "Vuna/Compiler/Frontend/Parser.vuna:2074"));
  ("Frontend_dParser.v_parseRecordExport", ("Vuna.Compiler.Frontend.Parser.parseRecordExport", "Vuna/Compiler/Frontend/Parser.vuna:814"));
  ("Frontend_dParser.v_parseRecordPatternField", ("Vuna.Compiler.Frontend.Parser.parseRecordPatternField", "Vuna/Compiler/Frontend/Parser.vuna:2668"));
  ("Frontend_dParser.v_parseRecordPatternFields", ("Vuna.Compiler.Frontend.Parser.parseRecordPatternFields", "Vuna/Compiler/Frontend/Parser.vuna:2648"));
  ("Frontend_dParser.v_parseRecordPatternList", ("Vuna.Compiler.Frontend.Parser.parseRecordPatternList", "Vuna/Compiler/Frontend/Parser.vuna:2657"));
  ("Frontend_dParser.v_parseReexportTail", ("Vuna.Compiler.Frontend.Parser.parseReexportTail", "Vuna/Compiler/Frontend/Parser.vuna:266"));
  ("Frontend_dParser.v_parseSectionAtom", ("Vuna.Compiler.Frontend.Parser.parseSectionAtom", "Vuna/Compiler/Frontend/Parser.vuna:1979"));
  ("Frontend_dParser.v_parseSignature", ("Vuna.Compiler.Frontend.Parser.parseSignature", "Vuna/Compiler/Frontend/Parser.vuna:1072"));
  ("Frontend_dParser.v_parseSource", ("Vuna.Compiler.Frontend.Parser.parseSource", "Vuna/Compiler/Frontend/Parser.vuna:81"));
  ("Frontend_dParser.v_parseSourceDetailed", ("Vuna.Compiler.Frontend.Parser.parseSourceDetailed", "Vuna/Compiler/Frontend/Parser.vuna:50"));
  ("Frontend_dParser.v_parseSourceFile", ("Vuna.Compiler.Frontend.Parser.parseSourceFile", "Vuna/Compiler/Frontend/Parser.vuna:124"));
  ("Frontend_dParser.v_parseSourceRecovering", ("Vuna.Compiler.Frontend.Parser.parseSourceRecovering", "Vuna/Compiler/Frontend/Parser.vuna:2793"));
  ("Frontend_dParser.v_parseSourceRecoveringTokens", ("Vuna.Compiler.Frontend.Parser.parseSourceRecoveringTokens", "Vuna/Compiler/Frontend/Parser.vuna:2805"));
  ("Frontend_dParser.v_parseSourceWithComments", ("Vuna.Compiler.Frontend.Parser.parseSourceWithComments", "Vuna/Compiler/Frontend/Parser.vuna:75"));
  ("Frontend_dParser.v_parseTemplateAtom", ("Vuna.Compiler.Frontend.Parser.parseTemplateAtom", "Vuna/Compiler/Frontend/Parser.vuna:1875"));
  ("Frontend_dParser.v_parseTemplateHole", ("Vuna.Compiler.Frontend.Parser.parseTemplateHole", "Vuna/Compiler/Frontend/Parser.vuna:1904"));
  ("Frontend_dParser.v_parseTemplateParts", ("Vuna.Compiler.Frontend.Parser.parseTemplateParts", "Vuna/Compiler/Frontend/Parser.vuna:1891"));
  ("Frontend_dParser.v_parseTieredDecl", ("Vuna.Compiler.Frontend.Parser.parseTieredDecl", "Vuna/Compiler/Frontend/Parser.vuna:1325"));
  ("Frontend_dParser.v_parseTieredExport", ("Vuna.Compiler.Frontend.Parser.parseTieredExport", "Vuna/Compiler/Frontend/Parser.vuna:768"));
  ("Frontend_dParser.v_parseTrait", ("Vuna.Compiler.Frontend.Parser.parseTrait", "Vuna/Compiler/Frontend/Parser.vuna:1457"));
  ("Frontend_dParser.v_parseTraitExport", ("Vuna.Compiler.Frontend.Parser.parseTraitExport", "Vuna/Compiler/Frontend/Parser.vuna:843"));
  ("Frontend_dParser.v_parseTraitExportMembers", ("Vuna.Compiler.Frontend.Parser.parseTraitExportMembers", "Vuna/Compiler/Frontend/Parser.vuna:918"));
  ("Frontend_dParser.v_parseTraitHead", ("Vuna.Compiler.Frontend.Parser.parseTraitHead", "Vuna/Compiler/Frontend/Parser.vuna:871"));
  ("Frontend_dParser.v_parseTraitParams", ("Vuna.Compiler.Frontend.Parser.parseTraitParams", "Vuna/Compiler/Frontend/Parser.vuna:1476"));
  ("Frontend_dParser.v_parseTraitSupers", ("Vuna.Compiler.Frontend.Parser.parseTraitSupers", "Vuna/Compiler/Frontend/Parser.vuna:897"));
  ("Frontend_dParser.v_parseTraitSupersRest", ("Vuna.Compiler.Frontend.Parser.parseTraitSupersRest", "Vuna/Compiler/Frontend/Parser.vuna:906"));
  ("Frontend_dParser.v_parseWhere", ("Vuna.Compiler.Frontend.Parser.parseWhere", "Vuna/Compiler/Frontend/Parser.vuna:1120"));
  ("Frontend_dParser.v_parseWhereBindings", ("Vuna.Compiler.Frontend.Parser.parseWhereBindings", "Vuna/Compiler/Frontend/Parser.vuna:1132"));
  ("Frontend_dParser.v_patBinderBindings", ("Vuna.Compiler.Frontend.Parser.patBinderBindings", "Vuna/Compiler/Frontend/Parser.vuna:2566"));
  ("Frontend_dParser.v_patBoundName", ("Vuna.Compiler.Frontend.Parser.patBoundName", "Vuna/Compiler/Frontend/Parser.vuna:1269"));
  ("Frontend_dParser.v_ps0", ("Vuna.Compiler.Frontend.Parser.ps0", "Vuna/Compiler/Frontend/Parser.vuna:19"));
  ("Frontend_dParser.v_ps1", ("Vuna.Compiler.Frontend.Parser.ps1", "Vuna/Compiler/Frontend/Parser.vuna:22"));
  ("Frontend_dParser.v_psAt", ("Vuna.Compiler.Frontend.Parser.psAt", "Vuna/Compiler/Frontend/Parser.vuna:25"));
  ("Frontend_dParser.v_qualifyExportItem", ("Vuna.Compiler.Frontend.Parser.qualifyExportItem", "Vuna/Compiler/Frontend/Parser.vuna:282"));
  ("Frontend_dParser.v_recoverDecl", ("Vuna.Compiler.Frontend.Parser.recoverDecl", "Vuna/Compiler/Frontend/Parser.vuna:506"));
  ("Frontend_dParser.v_reexportPrefix", ("Vuna.Compiler.Frontend.Parser.reexportPrefix", "Vuna/Compiler/Frontend/Parser.vuna:276"));
  ("Frontend_dParser.v_rejectCtxSuffix", ("Vuna.Compiler.Frontend.Parser.rejectCtxSuffix", "Vuna/Compiler/Frontend/Parser.vuna:1067"));
  ("Frontend_dParser.v_reopenDiag", ("Vuna.Compiler.Frontend.Parser.reopenDiag", "Vuna/Compiler/Frontend/Parser.vuna:395"));
  ("Frontend_dParser.v_replacePiCod", ("Vuna.Compiler.Frontend.Parser.replacePiCod", "Vuna/Compiler/Frontend/Parser.vuna:1556"));
  ("Frontend_dParser.v_reverseDeclAcc", ("Vuna.Compiler.Frontend.Parser.reverseDeclAcc", "Vuna/Compiler/Frontend/Parser.vuna:501"));
  ("Frontend_dParser.v_rowAtNameExpr", ("Vuna.Compiler.Frontend.Parser.rowAtNameExpr", "Vuna/Compiler/Frontend/Parser.vuna:2234"));
  ("Frontend_dParser.v_sectionLeftExpr", ("Vuna.Compiler.Frontend.Parser.sectionLeftExpr", "Vuna/Compiler/Frontend/Parser.vuna:2007"));
  ("Frontend_dParser.v_sectionRightExpr", ("Vuna.Compiler.Frontend.Parser.sectionRightExpr", "Vuna/Compiler/Frontend/Parser.vuna:2014"));
  ("Frontend_dParser.v_shadowDiag", ("Vuna.Compiler.Frontend.Parser.shadowDiag", "Vuna/Compiler/Frontend/Parser.vuna:389"));
  ("Frontend_dParser.v_skipFrom", ("Vuna.Compiler.Frontend.Parser.skipFrom", "Vuna/Compiler/Frontend/Parser.vuna:517"));
  ("Frontend_dParser.v_skipToDeclLine", ("Vuna.Compiler.Frontend.Parser.skipToDeclLine", "Vuna/Compiler/Frontend/Parser.vuna:513"));
  ("Frontend_dParser.v_spanFromExpr", ("Vuna.Compiler.Frontend.Parser.spanFromExpr", "Vuna/Compiler/Frontend/Parser.vuna:1775"));
  ("Frontend_dParser.v_textPartsOf", ("Vuna.Compiler.Frontend.Parser.textPartsOf", "Vuna/Compiler/Frontend/Parser.vuna:1936"));
  ("Frontend_dParser.v_tierFollows", ("Vuna.Compiler.Frontend.Parser.tierFollows", "Vuna/Compiler/Frontend/Parser.vuna:1313"));
  ("Frontend_dParser.v_toksFuel", ("Vuna.Compiler.Frontend.Parser.toksFuel", "Vuna/Compiler/Frontend/Parser.vuna:1932"));
  ("Frontend_dParser.v_traitSupersFollow", ("Vuna.Compiler.Frontend.Parser.traitSupersFollow", "Vuna/Compiler/Frontend/Parser.vuna:884"));
  ("Frontend_dParser.v_traitSupersFollowGo", ("Vuna.Compiler.Frontend.Parser.traitSupersFollowGo", "Vuna/Compiler/Frontend/Parser.vuna:887"));
  ("Frontend_dParser_dSupport.v_addBacktickShape", ("Vuna.Compiler.Frontend.Parser.Support.addBacktickShape", "Vuna/Compiler/Frontend/Parser/Support.vuna:107"));
  ("Frontend_dParser_dSupport.v_addInterpMulti", ("Vuna.Compiler.Frontend.Parser.Support.addInterpMulti", "Vuna/Compiler/Frontend/Parser/Support.vuna:115"));
  ("Frontend_dParser_dSupport.v_addSectionShape", ("Vuna.Compiler.Frontend.Parser.Support.addSectionShape", "Vuna/Compiler/Frontend/Parser/Support.vuna:111"));
  ("Frontend_dParser_dSupport.v_addTemplateHoles", ("Vuna.Compiler.Frontend.Parser.Support.addTemplateHoles", "Vuna/Compiler/Frontend/Parser/Support.vuna:119"));
  ("Frontend_dParser_dSupport.v_advance", ("Vuna.Compiler.Frontend.Parser.Support.advance", "Vuna/Compiler/Frontend/Parser/Support.vuna:220"));
  ("Frontend_dParser_dSupport.v_arrowAt", ("Vuna.Compiler.Frontend.Parser.Support.arrowAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:336"));
  ("Frontend_dParser_dSupport.v_atKw", ("Vuna.Compiler.Frontend.Parser.Support.atKw", "Vuna/Compiler/Frontend/Parser/Support.vuna:340"));
  ("Frontend_dParser_dSupport.v_atSym", ("Vuna.Compiler.Frontend.Parser.Support.atSym", "Vuna/Compiler/Frontend/Parser/Support.vuna:272"));
  ("Frontend_dParser_dSupport.v_badCaseIndent", ("Vuna.Compiler.Frontend.Parser.Support.badCaseIndent", "Vuna/Compiler/Frontend/Parser/Support.vuna:536"));
  ("Frontend_dParser_dSupport.v_binderHead", ("Vuna.Compiler.Frontend.Parser.Support.binderHead", "Vuna/Compiler/Frontend/Parser/Support.vuna:289"));
  ("Frontend_dParser_dSupport.v_binderNameTail", ("Vuna.Compiler.Frontend.Parser.Support.binderNameTail", "Vuna/Compiler/Frontend/Parser/Support.vuna:306"));
  ("Frontend_dParser_dSupport.v_canContinue", ("Vuna.Compiler.Frontend.Parser.Support.canContinue", "Vuna/Compiler/Frontend/Parser/Support.vuna:346"));
  ("Frontend_dParser_dSupport.v_closeParenNext", ("Vuna.Compiler.Frontend.Parser.Support.closeParenNext", "Vuna/Compiler/Frontend/Parser/Support.vuna:493"));
  ("Frontend_dParser_dSupport.v_closedAt", ("Vuna.Compiler.Frontend.Parser.Support.closedAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:137"));
  ("Frontend_dParser_dSupport.v_countArrows", ("Vuna.Compiler.Frontend.Parser.Support.countArrows", "Vuna/Compiler/Frontend/Parser/Support.vuna:523"));
  ("Frontend_dParser_dSupport.v_ctorPatternStart", ("Vuna.Compiler.Frontend.Parser.Support.ctorPatternStart", "Vuna/Compiler/Frontend/Parser/Support.vuna:411"));
  ("Frontend_dParser_dSupport.v_eventsOf", ("Vuna.Compiler.Frontend.Parser.Support.eventsOf", "Vuna/Compiler/Frontend/Parser/Support.vuna:85"));
  ("Frontend_dParser_dSupport.v_expectIdent", ("Vuna.Compiler.Frontend.Parser.Support.expectIdent", "Vuna/Compiler/Frontend/Parser/Support.vuna:368"));
  ("Frontend_dParser_dSupport.v_expectKw", ("Vuna.Compiler.Frontend.Parser.Support.expectKw", "Vuna/Compiler/Frontend/Parser/Support.vuna:362"));
  ("Frontend_dParser_dSupport.v_expectSym", ("Vuna.Compiler.Frontend.Parser.Support.expectSym", "Vuna/Compiler/Frontend/Parser/Support.vuna:355"));
  ("Frontend_dParser_dSupport.v_expectValueName", ("Vuna.Compiler.Frontend.Parser.Support.expectValueName", "Vuna/Compiler/Frontend/Parser/Support.vuna:376"));
  ("Frontend_dParser_dSupport.v_fileOf", ("Vuna.Compiler.Frontend.Parser.Support.fileOf", "Vuna/Compiler/Frontend/Parser/Support.vuna:65"));
  ("Frontend_dParser_dSupport.v_holeAtomAt", ("Vuna.Compiler.Frontend.Parser.Support.holeAtomAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:434"));
  ("Frontend_dParser_dSupport.v_isEof", ("Vuna.Compiler.Frontend.Parser.Support.isEof", "Vuna/Compiler/Frontend/Parser/Support.vuna:235"));
  ("Frontend_dParser_dSupport.v_isReservedValueName", ("Vuna.Compiler.Frontend.Parser.Support.isReservedValueName", "Vuna/Compiler/Frontend/Parser/Support.vuna:488"));
  ("Frontend_dParser_dSupport.v_isSyntaxSym", ("Vuna.Compiler.Frontend.Parser.Support.isSyntaxSym", "Vuna/Compiler/Frontend/Parser/Support.vuna:461"));
  ("Frontend_dParser_dSupport.v_lastEndCol", ("Vuna.Compiler.Frontend.Parser.Support.lastEndCol", "Vuna/Compiler/Frontend/Parser/Support.vuna:147"));
  ("Frontend_dParser_dSupport.v_lastPos", ("Vuna.Compiler.Frontend.Parser.Support.lastPos", "Vuna/Compiler/Frontend/Parser/Support.vuna:217"));
  ("Frontend_dParser_dSupport.v_minusLiteralAt", ("Vuna.Compiler.Frontend.Parser.Support.minusLiteralAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:516"));
  ("Frontend_dParser_dSupport.v_mkState", ("Vuna.Compiler.Frontend.Parser.Support.mkState", "Vuna/Compiler/Frontend/Parser/Support.vuna:73"));
  ("Frontend_dParser_dSupport.v_mkStateAt", ("Vuna.Compiler.Frontend.Parser.Support.mkStateAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:80"));
  ("Frontend_dParser_dSupport.v_nthTok", ("Vuna.Compiler.Frontend.Parser.Support.nthTok", "Vuna/Compiler/Frontend/Parser/Support.vuna:279"));
  ("Frontend_dParser_dSupport.v_peekPos", ("Vuna.Compiler.Frontend.Parser.Support.peekPos", "Vuna/Compiler/Frontend/Parser/Support.vuna:202"));
  ("Frontend_dParser_dSupport.v_peekTok", ("Vuna.Compiler.Frontend.Parser.Support.peekTok", "Vuna/Compiler/Frontend/Parser/Support.vuna:196"));
  ("Frontend_dParser_dSupport.v_peekTokAt", ("Vuna.Compiler.Frontend.Parser.Support.peekTokAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:283"));
  ("Frontend_dParser_dSupport.v_piArrowAhead", ("Vuna.Compiler.Frontend.Parser.Support.piArrowAhead", "Vuna/Compiler/Frontend/Parser/Support.vuna:326"));
  ("Frontend_dParser_dSupport.v_piArrowAheadGo", ("Vuna.Compiler.Frontend.Parser.Support.piArrowAheadGo", "Vuna/Compiler/Frontend/Parser/Support.vuna:329"));
  ("Frontend_dParser_dSupport.v_pmodeOf", ("Vuna.Compiler.Frontend.Parser.Support.pmodeOf", "Vuna/Compiler/Frontend/Parser/Support.vuna:69"));
  ("Frontend_dParser_dSupport.v_quantifiedHead", ("Vuna.Compiler.Frontend.Parser.Support.quantifiedHead", "Vuna/Compiler/Frontend/Parser/Support.vuna:314"));
  ("Frontend_dParser_dSupport.v_rekeyInfix", ("Vuna.Compiler.Frontend.Parser.Support.rekeyInfix", "Vuna/Compiler/Frontend/Parser/Support.vuna:124"));
  ("Frontend_dParser_dSupport.v_rekeyInfixGo", ("Vuna.Compiler.Frontend.Parser.Support.rekeyInfixGo", "Vuna/Compiler/Frontend/Parser/Support.vuna:131"));
  ("Frontend_dParser_dSupport.v_sameLineState", ("Vuna.Compiler.Frontend.Parser.Support.sameLineState", "Vuna/Compiler/Frontend/Parser/Support.vuna:267"));
  ("Frontend_dParser_dSupport.v_sectionOpAt", ("Vuna.Compiler.Frontend.Parser.Support.sectionOpAt", "Vuna/Compiler/Frontend/Parser/Support.vuna:502"));
  ("Frontend_dParser_dSupport.v_spanFromStart", ("Vuna.Compiler.Frontend.Parser.Support.spanFromStart", "Vuna/Compiler/Frontend/Parser/Support.vuna:167"));
  ("Frontend_dParser_dSupport.v_spanOf", ("Vuna.Compiler.Frontend.Parser.Support.spanOf", "Vuna/Compiler/Frontend/Parser/Support.vuna:153"));
  ("Frontend_dParser_dSupport.v_startsAtom", ("Vuna.Compiler.Frontend.Parser.Support.startsAtom", "Vuna/Compiler/Frontend/Parser/Support.vuna:414"));
  ("Frontend_dParser_dSupport.v_startsPatternAtom", ("Vuna.Compiler.Frontend.Parser.Support.startsPatternAtom", "Vuna/Compiler/Frontend/Parser/Support.vuna:448"));
  ("Frontend_dParser_dSupport.v_stateFuel", ("Vuna.Compiler.Frontend.Parser.Support.stateFuel", "Vuna/Compiler/Frontend/Parser/Support.vuna:264"));
  ("Frontend_dParser_dSupport.v_terminatesExpression", ("Vuna.Compiler.Frontend.Parser.Support.terminatesExpression", "Vuna/Compiler/Frontend/Parser/Support.vuna:527"));
  ("Frontend_dParser_dSupport.v_tokSpan", ("Vuna.Compiler.Frontend.Parser.Support.tokSpan", "Vuna/Compiler/Frontend/Parser/Support.vuna:207"));
  ("Frontend_dParser_dSupport.v_tokTail", ("Vuna.Compiler.Frontend.Parser.Support.tokTail", "Vuna/Compiler/Frontend/Parser/Support.vuna:301"));
  ("Frontend_dParser_dSupport.v_tokenSpan", ("Vuna.Compiler.Frontend.Parser.Support.tokenSpan", "Vuna/Compiler/Frontend/Parser/Support.vuna:182"));
  ("Frontend_dParser_dSupport.v_underscoreCtorName", ("Vuna.Compiler.Frontend.Parser.Support.underscoreCtorName", "Vuna/Compiler/Frontend/Parser/Support.vuna:399"));
  ("Frontend_dParser_dSupport.v_upperFirst", ("Vuna.Compiler.Frontend.Parser.Support.upperFirst", "Vuna/Compiler/Frontend/Parser/Support.vuna:391"));
  ("Frontend_dParser_dSupport.v_withExtent", ("Vuna.Compiler.Frontend.Parser.Support.withExtent", "Vuna/Compiler/Frontend/Parser/Support.vuna:93"));
  ("Frontend_dParser_dSupport.v_withLastPos", ("Vuna.Compiler.Frontend.Parser.Support.withLastPos", "Vuna/Compiler/Frontend/Parser/Support.vuna:142"));
  ("Frontend_dRast.v__udeclCtors", ("Vuna.Compiler.Frontend.Rast._declCtors", "Vuna/Compiler/Frontend/Rast.vuna:367"));
  ("Frontend_dRast.v_astTraitParamName", ("Vuna.Compiler.Frontend.Rast.astTraitParamName", "Vuna/Compiler/Frontend/Rast.vuna:582"));
  ("Frontend_dRast.v_bindersOfPats", ("Vuna.Compiler.Frontend.Rast.bindersOfPats", "Vuna/Compiler/Frontend/Rast.vuna:485"));
  ("Frontend_dRast.v_bindingBinders", ("Vuna.Compiler.Frontend.Rast.bindingBinders", "Vuna/Compiler/Frontend/Rast.vuna:579"));
  ("Frontend_dRast.v_clauseWeight", ("Vuna.Compiler.Frontend.Rast.clauseWeight", "Vuna/Compiler/Frontend/Rast.vuna:213"));
  ("Frontend_dRast.v_clausesFor", ("Vuna.Compiler.Frontend.Rast.clausesFor", "Vuna/Compiler/Frontend/Rast.vuna:290"));
  ("Frontend_dRast.v_collectClauses", ("Vuna.Compiler.Frontend.Rast.collectClauses", "Vuna/Compiler/Frontend/Rast.vuna:282"));
  ("Frontend_dRast.v_ctorArity", ("Vuna.Compiler.Frontend.Rast.ctorArity", "Vuna/Compiler/Frontend/Rast.vuna:332"));
  ("Frontend_dRast.v_ctorDisplayName", ("Vuna.Compiler.Frontend.Rast.ctorDisplayName", "Vuna/Compiler/Frontend/Rast.vuna:311"));
  ("Frontend_dRast.v_ctorName", ("Vuna.Compiler.Frontend.Rast.ctorName", "Vuna/Compiler/Frontend/Rast.vuna:299"));
  ("Frontend_dRast.v_ctorShortName", ("Vuna.Compiler.Frontend.Rast.ctorShortName", "Vuna/Compiler/Frontend/Rast.vuna:305"));
  ("Frontend_dRast.v_ctorSpan", ("Vuna.Compiler.Frontend.Rast.ctorSpan", "Vuna/Compiler/Frontend/Rast.vuna:261"));
  ("Frontend_dRast.v_ctorType", ("Vuna.Compiler.Frontend.Rast.ctorType", "Vuna/Compiler/Frontend/Rast.vuna:320"));
  ("Frontend_dRast.v_ctorsOf", ("Vuna.Compiler.Frontend.Rast.ctorsOf", "Vuna/Compiler/Frontend/Rast.vuna:373"));
  ("Frontend_dRast.v_declAllNames", ("Vuna.Compiler.Frontend.Rast.declAllNames", "Vuna/Compiler/Frontend/Rast.vuna:360"));
  ("Frontend_dRast.v_declDerivings", ("Vuna.Compiler.Frontend.Rast.declDerivings", "Vuna/Compiler/Frontend/Rast.vuna:385"));
  ("Frontend_dRast.v_declNames", ("Vuna.Compiler.Frontend.Rast.declNames", "Vuna/Compiler/Frontend/Rast.vuna:344"));
  ("Frontend_dRast.v_declSpan", ("Vuna.Compiler.Frontend.Rast.declSpan", "Vuna/Compiler/Frontend/Rast.vuna:251"));
  ("Frontend_dRast.v_declTypeNames", ("Vuna.Compiler.Frontend.Rast.declTypeNames", "Vuna/Compiler/Frontend/Rast.vuna:376"));
  ("Frontend_dRast.v_doStmtSpan", ("Vuna.Compiler.Frontend.Rast.doStmtSpan", "Vuna/Compiler/Frontend/Rast.vuna:246"));
  ("Frontend_dRast.v_doStmtWeight", ("Vuna.Compiler.Frontend.Rast.doStmtWeight", "Vuna/Compiler/Frontend/Rast.vuna:221"));
  ("Frontend_dRast.v_exportItemSpan", ("Vuna.Compiler.Frontend.Rast.exportItemSpan", "Vuna/Compiler/Frontend/Rast.vuna:279"));
  ("Frontend_dRast.v_exprBudget", ("Vuna.Compiler.Frontend.Rast.exprBudget", "Vuna/Compiler/Frontend/Rast.vuna:239"));
  ("Frontend_dRast.v_exprSpan", ("Vuna.Compiler.Frontend.Rast.exprSpan", "Vuna/Compiler/Frontend/Rast.vuna:143"));
  ("Frontend_dRast.v_exprWeight", ("Vuna.Compiler.Frontend.Rast.exprWeight", "Vuna/Compiler/Frontend/Rast.vuna:186"));
  ("Frontend_dRast.v_exprWeightFields", ("Vuna.Compiler.Frontend.Rast.exprWeightFields", "Vuna/Compiler/Frontend/Rast.vuna:217"));
  ("Frontend_dRast.v_exprWeightList", ("Vuna.Compiler.Frontend.Rast.exprWeightList", "Vuna/Compiler/Frontend/Rast.vuna:205"));
  ("Frontend_dRast.v_fieldName", ("Vuna.Compiler.Frontend.Rast.fieldName", "Vuna/Compiler/Frontend/Rast.vuna:267"));
  ("Frontend_dRast.v_fieldSpan", ("Vuna.Compiler.Frontend.Rast.fieldSpan", "Vuna/Compiler/Frontend/Rast.vuna:264"));
  ("Frontend_dRast.v_fieldType", ("Vuna.Compiler.Frontend.Rast.fieldType", "Vuna/Compiler/Frontend/Rast.vuna:270"));
  ("Frontend_dRast.v_funArity", ("Vuna.Compiler.Frontend.Rast.funArity", "Vuna/Compiler/Frontend/Rast.vuna:293"));
  ("Frontend_dRast.v_interpWeight", ("Vuna.Compiler.Frontend.Rast.interpWeight", "Vuna/Compiler/Frontend/Rast.vuna:230"));
  ("Frontend_dRast.v_lookupCtorArity", ("Vuna.Compiler.Frontend.Rast.lookupCtorArity", "Vuna/Compiler/Frontend/Rast.vuna:327"));
  ("Frontend_dRast.v_nameOf", ("Vuna.Compiler.Frontend.Rast.nameOf", "Vuna/Compiler/Frontend/Rast.vuna:397"));
  ("Frontend_dRast.v_ofAlt", ("Vuna.Compiler.Frontend.Rast.ofAlt", "Vuna/Compiler/Frontend/Rast.vuna:550"));
  ("Frontend_dRast.v_ofBinding", ("Vuna.Compiler.Frontend.Rast.ofBinding", "Vuna/Compiler/Frontend/Rast.vuna:527"));
  ("Frontend_dRast.v_ofCtor", ("Vuna.Compiler.Frontend.Rast.ofCtor", "Vuna/Compiler/Frontend/Rast.vuna:451"));
  ("Frontend_dRast.v_ofDecl", ("Vuna.Compiler.Frontend.Rast.ofDecl", "Vuna/Compiler/Frontend/Rast.vuna:405"));
  ("Frontend_dRast.v_ofDecls", ("Vuna.Compiler.Frontend.Rast.ofDecls", "Vuna/Compiler/Frontend/Rast.vuna:401"));
  ("Frontend_dRast.v_ofExpr", ("Vuna.Compiler.Frontend.Rast.ofExpr", "Vuna/Compiler/Frontend/Rast.vuna:489"));
  ("Frontend_dRast.v_ofField", ("Vuna.Compiler.Frontend.Rast.ofField", "Vuna/Compiler/Frontend/Rast.vuna:454"));
  ("Frontend_dRast.v_ofFieldValue", ("Vuna.Compiler.Frontend.Rast.ofFieldValue", "Vuna/Compiler/Frontend/Rast.vuna:556"));
  ("Frontend_dRast.v_ofInterpPart", ("Vuna.Compiler.Frontend.Rast.ofInterpPart", "Vuna/Compiler/Frontend/Rast.vuna:559"));
  ("Frontend_dRast.v_ofLocalClause", ("Vuna.Compiler.Frontend.Rast.ofLocalClause", "Vuna/Compiler/Frontend/Rast.vuna:544"));
  ("Frontend_dRast.v_ofMaybeExpr", ("Vuna.Compiler.Frontend.Rast.ofMaybeExpr", "Vuna/Compiler/Frontend/Rast.vuna:588"));
  ("Frontend_dRast.v_ofPat", ("Vuna.Compiler.Frontend.Rast.ofPat", "Vuna/Compiler/Frontend/Rast.vuna:461"));
  ("Frontend_dRast.v_ofPatField", ("Vuna.Compiler.Frontend.Rast.ofPatField", "Vuna/Compiler/Frontend/Rast.vuna:472"));
  ("Frontend_dRast.v_ofStmts", ("Vuna.Compiler.Frontend.Rast.ofStmts", "Vuna/Compiler/Frontend/Rast.vuna:563"));
  ("Frontend_dRast.v_ofTraitMethod", ("Vuna.Compiler.Frontend.Rast.ofTraitMethod", "Vuna/Compiler/Frontend/Rast.vuna:457"));
  ("Frontend_dRast.v_ofTraitParam", ("Vuna.Compiler.Frontend.Rast.ofTraitParam", "Vuna/Compiler/Frontend/Rast.vuna:585"));
  ("Frontend_dRast.v_oneDoStmtWeight", ("Vuna.Compiler.Frontend.Rast.oneDoStmtWeight", "Vuna/Compiler/Frontend/Rast.vuna:225"));
  ("Frontend_dRast.v_oneInterpWeight", ("Vuna.Compiler.Frontend.Rast.oneInterpWeight", "Vuna/Compiler/Frontend/Rast.vuna:234"));
  ("Frontend_dRast.v_patBinders", ("Vuna.Compiler.Frontend.Rast.patBinders", "Vuna/Compiler/Frontend/Rast.vuna:476"));
  ("Frontend_dRast.v_patBudget", ("Vuna.Compiler.Frontend.Rast.patBudget", "Vuna/Compiler/Frontend/Rast.vuna:243"));
  ("Frontend_dRast.v_patExprWeight", ("Vuna.Compiler.Frontend.Rast.patExprWeight", "Vuna/Compiler/Frontend/Rast.vuna:209"));
  ("Frontend_dRast.v_patFieldBinders", ("Vuna.Compiler.Frontend.Rast.patFieldBinders", "Vuna/Compiler/Frontend/Rast.vuna:576"));
  ("Frontend_dRast.v_patSpan", ("Vuna.Compiler.Frontend.Rast.patSpan", "Vuna/Compiler/Frontend/Rast.vuna:134"));
  ("Frontend_dRast.v_patWeight", ("Vuna.Compiler.Frontend.Rast.patWeight", "Vuna/Compiler/Frontend/Rast.vuna:167"));
  ("Frontend_dRast.v_patWeightFields", ("Vuna.Compiler.Frontend.Rast.patWeightFields", "Vuna/Compiler/Frontend/Rast.vuna:180"));
  ("Frontend_dRast.v_patWeightList", ("Vuna.Compiler.Frontend.Rast.patWeightList", "Vuna/Compiler/Frontend/Rast.vuna:176"));
  ("Frontend_dRast.v_topNames", ("Vuna.Compiler.Frontend.Rast.topNames", "Vuna/Compiler/Frontend/Rast.vuna:357"));
  ("Frontend_dRast.v_traitMethodName", ("Vuna.Compiler.Frontend.Rast.traitMethodName", "Vuna/Compiler/Frontend/Rast.vuna:273"));
  ("Frontend_dRast.v_traitMethodSpan", ("Vuna.Compiler.Frontend.Rast.traitMethodSpan", "Vuna/Compiler/Frontend/Rast.vuna:276"));
  ("Frontend_dRast.v_typeArity", ("Vuna.Compiler.Frontend.Rast.typeArity", "Vuna/Compiler/Frontend/Rast.vuna:323"));
  ("Frontend_dRast.v_typeNamesOf", ("Vuna.Compiler.Frontend.Rast.typeNamesOf", "Vuna/Compiler/Frontend/Rast.vuna:382"));
  ("Frontend_dRast_dBridge.v_maybeMap", ("Vuna.Compiler.Frontend.Rast.Bridge.maybeMap", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:148"));
  ("Frontend_dRast_dBridge.v_toAstAlt", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstAlt", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:62"));
  ("Frontend_dRast_dBridge.v_toAstBinding", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstBinding", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:51"));
  ("Frontend_dRast_dBridge.v_toAstCtor", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstCtor", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:135"));
  ("Frontend_dRast_dBridge.v_toAstDecl", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstDecl", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:104"));
  ("Frontend_dRast_dBridge.v_toAstDecls", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstDecls", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:101"));
  ("Frontend_dRast_dBridge.v_toAstExpr", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstExpr", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:14"));
  ("Frontend_dRast_dBridge.v_toAstField", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstField", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:138"));
  ("Frontend_dRast_dBridge.v_toAstFieldValue", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstFieldValue", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:65"));
  ("Frontend_dRast_dBridge.v_toAstInterpPart", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstInterpPart", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:46"));
  ("Frontend_dRast_dBridge.v_toAstLocalClause", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstLocalClause", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:58"));
  ("Frontend_dRast_dBridge.v_toAstPat", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstPat", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:74"));
  ("Frontend_dRast_dBridge.v_toAstPatField", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstPatField", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:85"));
  ("Frontend_dRast_dBridge.v_toAstStmt", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstStmt", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:68"));
  ("Frontend_dRast_dBridge.v_toAstTraitMethod", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstTraitMethod", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:144"));
  ("Frontend_dRast_dBridge.v_toAstTraitParam", ("Vuna.Compiler.Frontend.Rast.Bridge.toAstTraitParam", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:141"));
  ("Frontend_dRast_dBridge.v_toRastDecl", ("Vuna.Compiler.Frontend.Rast.Bridge.toRastDecl", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:97"));
  ("Frontend_dRast_dBridge.v_toRastDecls", ("Vuna.Compiler.Frontend.Rast.Bridge.toRastDecls", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:93"));
  ("Frontend_dRast_dBridge.v_toRastExpr", ("Vuna.Compiler.Frontend.Rast.Bridge.toRastExpr", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:89"));
  ("Frontend_dRast_dBridge.v_toRastPat", ("Vuna.Compiler.Frontend.Rast.Bridge.toRastPat", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:153"));
  ("Frontend_dRast_dBridge.v_toRastPatField", ("Vuna.Compiler.Frontend.Rast.Bridge.toRastPatField", "Vuna/Compiler/Frontend/Rast/Bridge.vuna:164"));
  ("Frontend_dRast_dName.v_classifyName", ("Vuna.Compiler.Frontend.Rast.Name.classifyName", "Vuna/Compiler/Frontend/Rast/Name.vuna:70"));
  ("Frontend_dRast_dName.v_hasIntrinsic", ("Vuna.Compiler.Frontend.Rast.Name.hasIntrinsic", "Vuna/Compiler/Frontend/Rast/Name.vuna:88"));
  ("Frontend_dRast_dName.v_isCompilerModulePrefix", ("Vuna.Compiler.Frontend.Rast.Name.isCompilerModulePrefix", "Vuna/Compiler/Frontend/Rast/Name.vuna:64"));
  ("Frontend_dRast_dName.v_isPreludeName", ("Vuna.Compiler.Frontend.Rast.Name.isPreludeName", "Vuna/Compiler/Frontend/Rast/Name.vuna:108"));
  ("Frontend_dRast_dName.v_lastDotAt", ("Vuna.Compiler.Frontend.Rast.Name.lastDotAt", "Vuna/Compiler/Frontend/Rast/Name.vuna:103"));
  ("Frontend_dRast_dName.v_rnameBase", ("Vuna.Compiler.Frontend.Rast.Name.rnameBase", "Vuna/Compiler/Frontend/Rast/Name.vuna:57"));
  ("Frontend_dRast_dName.v_rnameIsGlobal", ("Vuna.Compiler.Frontend.Rast.Name.rnameIsGlobal", "Vuna/Compiler/Frontend/Rast/Name.vuna:32"));
  ("Frontend_dRast_dName.v_rnameIsHole", ("Vuna.Compiler.Frontend.Rast.Name.rnameIsHole", "Vuna/Compiler/Frontend/Rast/Name.vuna:47"));
  ("Frontend_dRast_dName.v_rnameIsIntrinsic", ("Vuna.Compiler.Frontend.Rast.Name.rnameIsIntrinsic", "Vuna/Compiler/Frontend/Rast/Name.vuna:37"));
  ("Frontend_dRast_dName.v_rnameIsMacro", ("Vuna.Compiler.Frontend.Rast.Name.rnameIsMacro", "Vuna/Compiler/Frontend/Rast/Name.vuna:42"));
  ("Frontend_dRast_dName.v_rnameKey", ("Vuna.Compiler.Frontend.Rast.Name.rnameKey", "Vuna/Compiler/Frontend/Rast/Name.vuna:24"));
  ("Frontend_dRast_dName.v_rnameModule", ("Vuna.Compiler.Frontend.Rast.Name.rnameModule", "Vuna/Compiler/Frontend/Rast/Name.vuna:52"));
  ("Frontend_dRast_dName.v_splitGlobalKey", ("Vuna.Compiler.Frontend.Rast.Name.splitGlobalKey", "Vuna/Compiler/Frontend/Rast/Name.vuna:95"));
  ("Frontend_dReserved.v_appAtSyntax", ("Vuna.Compiler.Frontend.Reserved.appAtSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:230"));
  ("Frontend_dReserved.v_ascribeSyntax", ("Vuna.Compiler.Frontend.Reserved.ascribeSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:158"));
  ("Frontend_dReserved.v_dictBinderName", ("Vuna.Compiler.Frontend.Reserved.dictBinderName", "Vuna/Compiler/Frontend/Reserved.vuna:334"));
  ("Frontend_dReserved.v_doBindSyntaxName", ("Vuna.Compiler.Frontend.Reserved.doBindSyntaxName", "Vuna/Compiler/Frontend/Reserved.vuna:280"));
  ("Frontend_dReserved.v_doBindSyntaxPrefix", ("Vuna.Compiler.Frontend.Reserved.doBindSyntaxPrefix", "Vuna/Compiler/Frontend/Reserved.vuna:272"));
  ("Frontend_dReserved.v_doIgnoreSyntaxName", ("Vuna.Compiler.Frontend.Reserved.doIgnoreSyntaxName", "Vuna/Compiler/Frontend/Reserved.vuna:284"));
  ("Frontend_dReserved.v_doIgnoreSyntaxPrefix", ("Vuna.Compiler.Frontend.Reserved.doIgnoreSyntaxPrefix", "Vuna/Compiler/Frontend/Reserved.vuna:276"));
  ("Frontend_dReserved.v_doPatternBinderName", ("Vuna.Compiler.Frontend.Reserved.doPatternBinderName", "Vuna/Compiler/Frontend/Reserved.vuna:310"));
  ("Frontend_dReserved.v_doSyntaxCanonical", ("Vuna.Compiler.Frontend.Reserved.doSyntaxCanonical", "Vuna/Compiler/Frontend/Reserved.vuna:297"));
  ("Frontend_dReserved.v_dropNChars", ("Vuna.Compiler.Frontend.Reserved.dropNChars", "Vuna/Compiler/Frontend/Reserved.vuna:54"));
  ("Frontend_dReserved.v_dropNamePrefix", ("Vuna.Compiler.Frontend.Reserved.dropNamePrefix", "Vuna/Compiler/Frontend/Reserved.vuna:64"));
  ("Frontend_dReserved.v_etaBinderName", ("Vuna.Compiler.Frontend.Reserved.etaBinderName", "Vuna/Compiler/Frontend/Reserved.vuna:338"));
  ("Frontend_dReserved.v_handleNoRetSyntax", ("Vuna.Compiler.Frontend.Reserved.handleNoRetSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:209"));
  ("Frontend_dReserved.v_handleSyntax", ("Vuna.Compiler.Frontend.Reserved.handleSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:201"));
  ("Frontend_dReserved.v_holeNameOf", ("Vuna.Compiler.Frontend.Reserved.holeNameOf", "Vuna/Compiler/Frontend/Reserved.vuna:26"));
  ("Frontend_dReserved.v_holeNamed", ("Vuna.Compiler.Frontend.Reserved.holeNamed", "Vuna/Compiler/Frontend/Reserved.vuna:19"));
  ("Frontend_dReserved.v_instArgSyntax", ("Vuna.Compiler.Frontend.Reserved.instArgSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:239"));
  ("Frontend_dReserved.v_internalNamePrefix", ("Vuna.Compiler.Frontend.Reserved.internalNamePrefix", "Vuna/Compiler/Frontend/Reserved.vuna:42"));
  ("Frontend_dReserved.v_isAppAtSyntax", ("Vuna.Compiler.Frontend.Reserved.isAppAtSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:234"));
  ("Frontend_dReserved.v_isAscribeSyntax", ("Vuna.Compiler.Frontend.Reserved.isAscribeSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:162"));
  ("Frontend_dReserved.v_isDoBindSyntaxName", ("Vuna.Compiler.Frontend.Reserved.isDoBindSyntaxName", "Vuna/Compiler/Frontend/Reserved.vuna:288"));
  ("Frontend_dReserved.v_isDoIgnoreSyntaxName", ("Vuna.Compiler.Frontend.Reserved.isDoIgnoreSyntaxName", "Vuna/Compiler/Frontend/Reserved.vuna:292"));
  ("Frontend_dReserved.v_isHandleNoRetSyntax", ("Vuna.Compiler.Frontend.Reserved.isHandleNoRetSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:213"));
  ("Frontend_dReserved.v_isHandleSyntax", ("Vuna.Compiler.Frontend.Reserved.isHandleSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:205"));
  ("Frontend_dReserved.v_isHoleName", ("Vuna.Compiler.Frontend.Reserved.isHoleName", "Vuna/Compiler/Frontend/Reserved.vuna:16"));
  ("Frontend_dReserved.v_isInstArgSyntax", ("Vuna.Compiler.Frontend.Reserved.isInstArgSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:243"));
  ("Frontend_dReserved.v_isInternalSyntaxName", ("Vuna.Compiler.Frontend.Reserved.isInternalSyntaxName", "Vuna/Compiler/Frontend/Reserved.vuna:50"));
  ("Frontend_dReserved.v_isListConsSyntax", ("Vuna.Compiler.Frontend.Reserved.isListConsSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:133"));
  ("Frontend_dReserved.v_isListNilSyntax", ("Vuna.Compiler.Frontend.Reserved.isListNilSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:129"));
  ("Frontend_dReserved.v_isMacroSyntaxName", ("Vuna.Compiler.Frontend.Reserved.isMacroSyntaxName", "Vuna/Compiler/Frontend/Reserved.vuna:263"));
  ("Frontend_dReserved.v_isOverCtorName", ("Vuna.Compiler.Frontend.Reserved.isOverCtorName", "Vuna/Compiler/Frontend/Reserved.vuna:93"));
  ("Frontend_dReserved.v_isOverValueName", ("Vuna.Compiler.Frontend.Reserved.isOverValueName", "Vuna/Compiler/Frontend/Reserved.vuna:115"));
  ("Frontend_dReserved.v_isPerformSyntax", ("Vuna.Compiler.Frontend.Reserved.isPerformSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:188"));
  ("Frontend_dReserved.v_isRowAtSyntax", ("Vuna.Compiler.Frontend.Reserved.isRowAtSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:223"));
  ("Frontend_dReserved.v_isSynthName", ("Vuna.Compiler.Frontend.Reserved.isSynthName", "Vuna/Compiler/Frontend/Reserved.vuna:326"));
  ("Frontend_dReserved.v_isTuplePairSyntax", ("Vuna.Compiler.Frontend.Reserved.isTuplePairSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:143"));
  ("Frontend_dReserved.v_isTupleUnitSyntax", ("Vuna.Compiler.Frontend.Reserved.isTupleUnitSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:151"));
  ("Frontend_dReserved.v_joinWithAt", ("Vuna.Compiler.Frontend.Reserved.joinWithAt", "Vuna/Compiler/Frontend/Reserved.vuna:69"));
  ("Frontend_dReserved.v_listConsSyntax", ("Vuna.Compiler.Frontend.Reserved.listConsSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:125"));
  ("Frontend_dReserved.v_listNilSyntax", ("Vuna.Compiler.Frontend.Reserved.listNilSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:121"));
  ("Frontend_dReserved.v_macroNameOf", ("Vuna.Compiler.Frontend.Reserved.macroNameOf", "Vuna/Compiler/Frontend/Reserved.vuna:267"));
  ("Frontend_dReserved.v_macroSyntaxName", ("Vuna.Compiler.Frontend.Reserved.macroSyntaxName", "Vuna/Compiler/Frontend/Reserved.vuna:259"));
  ("Frontend_dReserved.v_macroSyntaxPrefix", ("Vuna.Compiler.Frontend.Reserved.macroSyntaxPrefix", "Vuna/Compiler/Frontend/Reserved.vuna:255"));
  ("Frontend_dReserved.v_ovProbeName", ("Vuna.Compiler.Frontend.Reserved.ovProbeName", "Vuna/Compiler/Frontend/Reserved.vuna:346"));
  ("Frontend_dReserved.v_overCtorName", ("Vuna.Compiler.Frontend.Reserved.overCtorName", "Vuna/Compiler/Frontend/Reserved.vuna:75"));
  ("Frontend_dReserved.v_overCtorPrefix", ("Vuna.Compiler.Frontend.Reserved.overCtorPrefix", "Vuna/Compiler/Frontend/Reserved.vuna:46"));
  ("Frontend_dReserved.v_overCtorShort", ("Vuna.Compiler.Frontend.Reserved.overCtorShort", "Vuna/Compiler/Frontend/Reserved.vuna:79"));
  ("Frontend_dReserved.v_overCtorTargets", ("Vuna.Compiler.Frontend.Reserved.overCtorTargets", "Vuna/Compiler/Frontend/Reserved.vuna:86"));
  ("Frontend_dReserved.v_overValueName", ("Vuna.Compiler.Frontend.Reserved.overValueName", "Vuna/Compiler/Frontend/Reserved.vuna:100"));
  ("Frontend_dReserved.v_overValuePrefix", ("Vuna.Compiler.Frontend.Reserved.overValuePrefix", "Vuna/Compiler/Frontend/Reserved.vuna:97"));
  ("Frontend_dReserved.v_overValueShort", ("Vuna.Compiler.Frontend.Reserved.overValueShort", "Vuna/Compiler/Frontend/Reserved.vuna:103"));
  ("Frontend_dReserved.v_overValueTargets", ("Vuna.Compiler.Frontend.Reserved.overValueTargets", "Vuna/Compiler/Frontend/Reserved.vuna:109"));
  ("Frontend_dReserved.v_performSyntax", ("Vuna.Compiler.Frontend.Reserved.performSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:184"));
  ("Frontend_dReserved.v_rowAtSyntax", ("Vuna.Compiler.Frontend.Reserved.rowAtSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:219"));
  ("Frontend_dReserved.v_sectionBinderName", ("Vuna.Compiler.Frontend.Reserved.sectionBinderName", "Vuna/Compiler/Frontend/Reserved.vuna:330"));
  ("Frontend_dReserved.v_synthNamePrefix", ("Vuna.Compiler.Frontend.Reserved.synthNamePrefix", "Vuna/Compiler/Frontend/Reserved.vuna:322"));
  ("Frontend_dReserved.v_teleProbeBinderName", ("Vuna.Compiler.Frontend.Reserved.teleProbeBinderName", "Vuna/Compiler/Frontend/Reserved.vuna:342"));
  ("Frontend_dReserved.v_tuplePairSyntax", ("Vuna.Compiler.Frontend.Reserved.tuplePairSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:139"));
  ("Frontend_dReserved.v_tupleUnitSyntax", ("Vuna.Compiler.Frontend.Reserved.tupleUnitSyntax", "Vuna/Compiler/Frontend/Reserved.vuna:147"));
  ("Frontend_dToml.v_TomlDoc", ("Vuna.Compiler.Frontend.Toml.TomlDoc", "Vuna/Compiler/Frontend/Toml.vuna:47"));
  ("Frontend_dToml.v_advanceChars", ("Vuna.Compiler.Frontend.Toml.advanceChars", "Vuna/Compiler/Frontend/Toml.vuna:142"));
  ("Frontend_dToml.v_advanceCursor", ("Vuna.Compiler.Frontend.Toml.advanceCursor", "Vuna/Compiler/Frontend/Toml.vuna:101"));
  ("Frontend_dToml.v_afterDoubleBracket", ("Vuna.Compiler.Frontend.Toml.afterDoubleBracket", "Vuna/Compiler/Frontend/Toml.vuna:907"));
  ("Frontend_dToml.v_afterSingleBracket", ("Vuna.Compiler.Frontend.Toml.afterSingleBracket", "Vuna/Compiler/Frontend/Toml.vuna:880"));
  ("Frontend_dToml.v_appendPath", ("Vuna.Compiler.Frontend.Toml.appendPath", "Vuna/Compiler/Frontend/Toml.vuna:158"));
  ("Frontend_dToml.v_appendTableArray", ("Vuna.Compiler.Frontend.Toml.appendTableArray", "Vuna/Compiler/Frontend/Toml.vuna:236"));
  ("Frontend_dToml.v_arrayStrings", ("Vuna.Compiler.Frontend.Toml.arrayStrings", "Vuna/Compiler/Frontend/Toml.vuna:1007"));
  ("Frontend_dToml.v_childSectionOf", ("Vuna.Compiler.Frontend.Toml.childSectionOf", "Vuna/Compiler/Frontend/Toml.vuna:1043"));
  ("Frontend_dToml.v_collectBareKey", ("Vuna.Compiler.Frontend.Toml.collectBareKey", "Vuna/Compiler/Frontend/Toml.vuna:582"));
  ("Frontend_dToml.v_countLines", ("Vuna.Compiler.Frontend.Toml.countLines", "Vuna/Compiler/Frontend/Toml.vuna:89"));
  ("Frontend_dToml.v_cursorFuel", ("Vuna.Compiler.Frontend.Toml.cursorFuel", "Vuna/Compiler/Frontend/Toml.vuna:82"));
  ("Frontend_dToml.v_dropChars", ("Vuna.Compiler.Frontend.Toml.dropChars", "Vuna/Compiler/Frontend/Toml.vuna:132"));
  ("Frontend_dToml.v_dropFirstNewline", ("Vuna.Compiler.Frontend.Toml.dropFirstNewline", "Vuna/Compiler/Frontend/Toml.vuna:517"));
  ("Frontend_dToml.v_duplicateKeyMsg", ("Vuna.Compiler.Frontend.Toml.duplicateKeyMsg", "Vuna/Compiler/Frontend/Toml.vuna:279"));
  ("Frontend_dToml.v_ensureTable", ("Vuna.Compiler.Frontend.Toml.ensureTable", "Vuna/Compiler/Frontend/Toml.vuna:200"));
  ("Frontend_dToml.v_expectEol", ("Vuna.Compiler.Frontend.Toml.expectEol", "Vuna/Compiler/Frontend/Toml.vuna:841"));
  ("Frontend_dToml.v_expectEolAfterComment", ("Vuna.Compiler.Frontend.Toml.expectEolAfterComment", "Vuna/Compiler/Frontend/Toml.vuna:853"));
  ("Frontend_dToml.v_failAt", ("Vuna.Compiler.Frontend.Toml.failAt", "Vuna/Compiler/Frontend/Toml.vuna:155"));
  ("Frontend_dToml.v_fieldValues", ("Vuna.Compiler.Frontend.Toml.fieldValues", "Vuna/Compiler/Frontend/Toml.vuna:365"));
  ("Frontend_dToml.v_finishInteger", ("Vuna.Compiler.Frontend.Toml.finishInteger", "Vuna/Compiler/Frontend/Toml.vuna:805"));
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
  ("Frontend_dToml.v_lookupEntry", ("Vuna.Compiler.Frontend.Toml.lookupEntry", "Vuna/Compiler/Frontend/Toml.vuna:1015"));
  ("Frontend_dToml.v_lookupEntryLine", ("Vuna.Compiler.Frontend.Toml.lookupEntryLine", "Vuna/Compiler/Frontend/Toml.vuna:1020"));
  ("Frontend_dToml.v_lookupField", ("Vuna.Compiler.Frontend.Toml.lookupField", "Vuna/Compiler/Frontend/Toml.vuna:170"));
  ("Frontend_dToml.v_makeInteger", ("Vuna.Compiler.Frontend.Toml.makeInteger", "Vuna/Compiler/Frontend/Toml.vuna:814"));
  ("Frontend_dToml.v_matchChars", ("Vuna.Compiler.Frontend.Toml.matchChars", "Vuna/Compiler/Frontend/Toml.vuna:825"));
  ("Frontend_dToml.v_matchWord", ("Vuna.Compiler.Frontend.Toml.matchWord", "Vuna/Compiler/Frontend/Toml.vuna:831"));
  ("Frontend_dToml.v_nodeValue", ("Vuna.Compiler.Frontend.Toml.nodeValue", "Vuna/Compiler/Frontend/Toml.vuna:360"));
  ("Frontend_dToml.v_parseArrayItems", ("Vuna.Compiler.Frontend.Toml.parseArrayItems", "Vuna/Compiler/Frontend/Toml.vuna:705"));
  ("Frontend_dToml.v_parseArrayValue", ("Vuna.Compiler.Frontend.Toml.parseArrayValue", "Vuna/Compiler/Frontend/Toml.vuna:696"));
  ("Frontend_dToml.v_parseBareKey", ("Vuna.Compiler.Frontend.Toml.parseBareKey", "Vuna/Compiler/Frontend/Toml.vuna:590"));
  ("Frontend_dToml.v_parseBasicChars", ("Vuna.Compiler.Frontend.Toml.parseBasicChars", "Vuna/Compiler/Frontend/Toml.vuna:434"));
  ("Frontend_dToml.v_parseBasicEscape", ("Vuna.Compiler.Frontend.Toml.parseBasicEscape", "Vuna/Compiler/Frontend/Toml.vuna:448"));
  ("Frontend_dToml.v_parseBasicString", ("Vuna.Compiler.Frontend.Toml.parseBasicString", "Vuna/Compiler/Frontend/Toml.vuna:428"));
  ("Frontend_dToml.v_parseBracketLine", ("Vuna.Compiler.Frontend.Toml.parseBracketLine", "Vuna/Compiler/Frontend/Toml.vuna:973"));
  ("Frontend_dToml.v_parseEntryValue", ("Vuna.Compiler.Frontend.Toml.parseEntryValue", "Vuna/Compiler/Frontend/Toml.vuna:925"));
  ("Frontend_dToml.v_parseHexCode", ("Vuna.Compiler.Frontend.Toml.parseHexCode", "Vuna/Compiler/Frontend/Toml.vuna:478"));
  ("Frontend_dToml.v_parseInlineFields", ("Vuna.Compiler.Frontend.Toml.parseInlineFields", "Vuna/Compiler/Frontend/Toml.vuna:739"));
  ("Frontend_dToml.v_parseInlineTable", ("Vuna.Compiler.Frontend.Toml.parseInlineTable", "Vuna/Compiler/Frontend/Toml.vuna:730"));
  ("Frontend_dToml.v_parseIntValue", ("Vuna.Compiler.Frontend.Toml.parseIntValue", "Vuna/Compiler/Frontend/Toml.vuna:818"));
  ("Frontend_dToml.v_parseInteger", ("Vuna.Compiler.Frontend.Toml.parseInteger", "Vuna/Compiler/Frontend/Toml.vuna:778"));
  ("Frontend_dToml.v_parseIntegerDigits", ("Vuna.Compiler.Frontend.Toml.parseIntegerDigits", "Vuna/Compiler/Frontend/Toml.vuna:790"));
  ("Frontend_dToml.v_parseKeyLine", ("Vuna.Compiler.Frontend.Toml.parseKeyLine", "Vuna/Compiler/Frontend/Toml.vuna:942"));
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
  ("Frontend_dToml.v_parseSectionLine", ("Vuna.Compiler.Frontend.Toml.parseSectionLine", "Vuna/Compiler/Frontend/Toml.vuna:866"));
  ("Frontend_dToml.v_parseSingleStringValue", ("Vuna.Compiler.Frontend.Toml.parseSingleStringValue", "Vuna/Compiler/Frontend/Toml.vuna:667"));
  ("Frontend_dToml.v_parseTableArrayLine", ("Vuna.Compiler.Frontend.Toml.parseTableArrayLine", "Vuna/Compiler/Frontend/Toml.vuna:893"));
  ("Frontend_dToml.v_parseToml", ("Vuna.Compiler.Frontend.Toml.parseToml", "Vuna/Compiler/Frontend/Toml.vuna:986"));
  ("Frontend_dToml.v_parseTomlAt", ("Vuna.Compiler.Frontend.Toml.parseTomlAt", "Vuna/Compiler/Frontend/Toml.vuna:989"));
  ("Frontend_dToml.v_parseTomlDoc", ("Vuna.Compiler.Frontend.Toml.parseTomlDoc", "Vuna/Compiler/Frontend/Toml.vuna:998"));
  ("Frontend_dToml.v_parseTomlLoop", ("Vuna.Compiler.Frontend.Toml.parseTomlLoop", "Vuna/Compiler/Frontend/Toml.vuna:956"));
  ("Frontend_dToml.v_parseTomlLoopAt", ("Vuna.Compiler.Frontend.Toml.parseTomlLoopAt", "Vuna/Compiler/Frontend/Toml.vuna:963"));
  ("Frontend_dToml.v_parseUnicodeEscape", ("Vuna.Compiler.Frontend.Toml.parseUnicodeEscape", "Vuna/Compiler/Frontend/Toml.vuna:468"));
  ("Frontend_dToml.v_parseValue", ("Vuna.Compiler.Frontend.Toml.parseValue", "Vuna/Compiler/Frontend/Toml.vuna:638"));
  ("Frontend_dToml.v_pathFuel", ("Vuna.Compiler.Frontend.Toml.pathFuel", "Vuna/Compiler/Frontend/Toml.vuna:94"));
  ("Frontend_dToml.v_replaceField", ("Vuna.Compiler.Frontend.Toml.replaceField", "Vuna/Compiler/Frontend/Toml.vuna:174"));
  ("Frontend_dToml.v_replaceLastFields", ("Vuna.Compiler.Frontend.Toml.replaceLastFields", "Vuna/Compiler/Frontend/Toml.vuna:185"));
  ("Frontend_dToml.v_rootValue", ("Vuna.Compiler.Frontend.Toml.rootValue", "Vuna/Compiler/Frontend/Toml.vuna:374"));
  ("Frontend_dToml.v_samePath", ("Vuna.Compiler.Frontend.Toml.samePath", "Vuna/Compiler/Frontend/Toml.vuna:1067"));
  ("Frontend_dToml.v_sectionOfPath", ("Vuna.Compiler.Frontend.Toml.sectionOfPath", "Vuna/Compiler/Frontend/Toml.vuna:273"));
  ("Frontend_dToml.v_sectionsUnder", ("Vuna.Compiler.Frontend.Toml.sectionsUnder", "Vuna/Compiler/Frontend/Toml.vuna:1026"));
  ("Frontend_dToml.v_sectionsUnderGo", ("Vuna.Compiler.Frontend.Toml.sectionsUnderGo", "Vuna/Compiler/Frontend/Toml.vuna:1029"));
  ("Frontend_dToml.v_skipBlank", ("Vuna.Compiler.Frontend.Toml.skipBlank", "Vuna/Compiler/Frontend/Toml.vuna:379"));
  ("Frontend_dToml.v_skipComment", ("Vuna.Compiler.Frontend.Toml.skipComment", "Vuna/Compiler/Frontend/Toml.vuna:388"));
  ("Frontend_dToml.v_skipContinuation", ("Vuna.Compiler.Frontend.Toml.skipContinuation", "Vuna/Compiler/Frontend/Toml.vuna:551"));
  ("Frontend_dToml.v_skipGap", ("Vuna.Compiler.Frontend.Toml.skipGap", "Vuna/Compiler/Frontend/Toml.vuna:394"));
  ("Frontend_dToml.v_skipGapGo", ("Vuna.Compiler.Frontend.Toml.skipGapGo", "Vuna/Compiler/Frontend/Toml.vuna:397"));
  ("Frontend_dToml.v_splitAtList", ("Vuna.Compiler.Frontend.Toml.splitAtList", "Vuna/Compiler/Frontend/Toml.vuna:1055"));
  ("Frontend_dToml.v_splitLast", ("Vuna.Compiler.Frontend.Toml.splitLast", "Vuna/Compiler/Frontend/Toml.vuna:161"));
  ("Frontend_dToml.v_startsWithTripleOf", ("Vuna.Compiler.Frontend.Toml.startsWithTripleOf", "Vuna/Compiler/Frontend/Toml.vuna:146"));
  ("Frontend_dToml.v_stripCR", ("Vuna.Compiler.Frontend.Toml.stripCR", "Vuna/Compiler/Frontend/Toml.vuna:151"));
  ("Frontend_dToml.v_tableFields", ("Vuna.Compiler.Frontend.Toml.tableFields", "Vuna/Compiler/Frontend/Toml.vuna:370"));
  ("Frontend_dToml.v_utf8OfCode", ("Vuna.Compiler.Frontend.Toml.utf8OfCode", "Vuna/Compiler/Frontend/Toml.vuna:412"));
  ("Loader_dAddr.v_addrOf", ("Vuna.Compiler.Loader.Addr.addrOf", "Vuna/Compiler/Loader/Addr.vuna:32"));
  ("Loader_dAddr.v_addrSchema", ("Vuna.Compiler.Loader.Addr.addrSchema", "Vuna/Compiler/Loader/Addr.vuna:24"));
  ("Loader_dAddr.v_dedupNames", ("Vuna.Compiler.Loader.Addr.dedupNames", "Vuna/Compiler/Loader/Addr.vuna:78"));
  ("Loader_dAddr.v_exportItemDep", ("Vuna.Compiler.Loader.Addr.exportItemDep", "Vuna/Compiler/Loader/Addr.vuna:73"));
  ("Loader_dAddr.v_fixRowOf", ("Vuna.Compiler.Loader.Addr.fixRowOf", "Vuna/Compiler/Loader/Addr.vuna:64"));
  ("Loader_dAddr.v_hashHex", ("Vuna.Compiler.Loader.Addr.hashHex", "Vuna/Compiler/Loader/Addr.vuna:28"));
  ("Loader_dAddr.v_headerOfSource", ("Vuna.Compiler.Loader.Addr.headerOfSource", "Vuna/Compiler/Loader/Addr.vuna:84"));
  ("Loader_dAddr.v_importNameOf", ("Vuna.Compiler.Loader.Addr.importNameOf", "Vuna/Compiler/Loader/Addr.vuna:67"));
  ("Loader_dAddr.v_projectIdAddrOf", ("Vuna.Compiler.Loader.Addr.projectIdAddrOf", "Vuna/Compiler/Loader/Addr.vuna:37"));
  ("Loader_dExpand.v_expandAlts", ("Vuna.Compiler.Loader.Expand.expandAlts", "Vuna/Compiler/Loader/Expand.vuna:165"));
  ("Loader_dExpand.v_expandBindingSig", ("Vuna.Compiler.Loader.Expand.expandBindingSig", "Vuna/Compiler/Loader/Expand.vuna:157"));
  ("Loader_dExpand.v_expandBindingValue", ("Vuna.Compiler.Loader.Expand.expandBindingValue", "Vuna/Compiler/Loader/Expand.vuna:184"));
  ("Loader_dExpand.v_expandClauses", ("Vuna.Compiler.Loader.Expand.expandClauses", "Vuna/Compiler/Loader/Expand.vuna:174"));
  ("Loader_dExpand.v_expandCtor", ("Vuna.Compiler.Loader.Expand.expandCtor", "Vuna/Compiler/Loader/Expand.vuna:72"));
  ("Loader_dExpand.v_expandCtors", ("Vuna.Compiler.Loader.Expand.expandCtors", "Vuna/Compiler/Loader/Expand.vuna:63"));
  ("Loader_dExpand.v_expandDecl", ("Vuna.Compiler.Loader.Expand.expandDecl", "Vuna/Compiler/Loader/Expand.vuna:48"));
  ("Loader_dExpand.v_expandDecls", ("Vuna.Compiler.Loader.Expand.expandDecls", "Vuna/Compiler/Loader/Expand.vuna:36"));
  ("Loader_dExpand.v_expandDeclsGo", ("Vuna.Compiler.Loader.Expand.expandDeclsGo", "Vuna/Compiler/Loader/Expand.vuna:39"));
  ("Loader_dExpand.v_expandDoStmts", ("Vuna.Compiler.Loader.Expand.expandDoStmts", "Vuna/Compiler/Loader/Expand.vuna:199"));
  ("Loader_dExpand.v_expandExpr", ("Vuna.Compiler.Loader.Expand.expandExpr", "Vuna/Compiler/Loader/Expand.vuna:115"));
  ("Loader_dExpand.v_expandExprs", ("Vuna.Compiler.Loader.Expand.expandExprs", "Vuna/Compiler/Loader/Expand.vuna:106"));
  ("Loader_dExpand.v_expandField", ("Vuna.Compiler.Loader.Expand.expandField", "Vuna/Compiler/Loader/Expand.vuna:87"));
  ("Loader_dExpand.v_expandFieldExprs", ("Vuna.Compiler.Loader.Expand.expandFieldExprs", "Vuna/Compiler/Loader/Expand.vuna:190"));
  ("Loader_dExpand.v_expandFields", ("Vuna.Compiler.Loader.Expand.expandFields", "Vuna/Compiler/Loader/Expand.vuna:78"));
  ("Loader_dExpand.v_expandFuelBound", ("Vuna.Compiler.Loader.Expand.expandFuelBound", "Vuna/Compiler/Loader/Expand.vuna:31"));
  ("Loader_dExpand.v_expandInterpParts", ("Vuna.Compiler.Loader.Expand.expandInterpParts", "Vuna/Compiler/Loader/Expand.vuna:212"));
  ("Loader_dExpand.v_expandMacro", ("Vuna.Compiler.Loader.Expand.expandMacro", "Vuna/Compiler/Loader/Expand.vuna:264"));
  ("Loader_dExpand.v_expandPatExprs", ("Vuna.Compiler.Loader.Expand.expandPatExprs", "Vuna/Compiler/Loader/Expand.vuna:147"));
  ("Loader_dExpand.v_expandTraitMethod", ("Vuna.Compiler.Loader.Expand.expandTraitMethod", "Vuna/Compiler/Loader/Expand.vuna:100"));
  ("Loader_dExpand.v_expandTraitMethods", ("Vuna.Compiler.Loader.Expand.expandTraitMethods", "Vuna/Compiler/Loader/Expand.vuna:91"));
  ("Loader_dExpand.v_internalRef", ("Vuna.Compiler.Loader.Expand.internalRef", "Vuna/Compiler/Loader/Expand.vuna:230"));
  ("Loader_dExpand.v_logExpand", ("Vuna.Compiler.Loader.Expand.logExpand", "Vuna/Compiler/Loader/Expand.vuna:243"));
  ("Loader_dExpand.v_logLevelOf", ("Vuna.Compiler.Loader.Expand.logLevelOf", "Vuna/Compiler/Loader/Expand.vuna:234"));
  ("Loader_dExpand.v_logOnRef", ("Vuna.Compiler.Loader.Expand.logOnRef", "Vuna/Compiler/Loader/Expand.vuna:238"));
  ("Loader_dExpand.v_macroArityMismatch", ("Vuna.Compiler.Loader.Expand.macroArityMismatch", "Vuna/Compiler/Loader/Expand.vuna:251"));
  ("Loader_dFingerprint.v_buildIdFileName", ("Vuna.Compiler.Loader.Fingerprint.buildIdFileName", "Vuna/Compiler/Loader/Fingerprint.vuna:38"));
  ("Loader_dFingerprint.v_buildIdSchema", ("Vuna.Compiler.Loader.Fingerprint.buildIdSchema", "Vuna/Compiler/Loader/Fingerprint.vuna:42"));
  ("Loader_dFingerprint.v_cacheTagEff", ("Vuna.Compiler.Loader.Fingerprint.cacheTagEff", "Vuna/Compiler/Loader/Fingerprint.vuna:89"));
  ("Loader_dFingerprint.v_cacheTagFileName", ("Vuna.Compiler.Loader.Fingerprint.cacheTagFileName", "Vuna/Compiler/Loader/Fingerprint.vuna:104"));
  ("Loader_dFingerprint.v_compilerFingerprintEff", ("Vuna.Compiler.Loader.Fingerprint.compilerFingerprintEff", "Vuna/Compiler/Loader/Fingerprint.vuna:133"));
  ("Loader_dFingerprint.v_compilerIdOf", ("Vuna.Compiler.Loader.Fingerprint.compilerIdOf", "Vuna/Compiler/Loader/Fingerprint.vuna:48"));
  ("Loader_dFingerprint.v_compilerTagEff", ("Vuna.Compiler.Loader.Fingerprint.compilerTagEff", "Vuna/Compiler/Loader/Fingerprint.vuna:64"));
  ("Loader_dFingerprint.v_fingerprintOfStat", ("Vuna.Compiler.Loader.Fingerprint.fingerprintOfStat", "Vuna/Compiler/Loader/Fingerprint.vuna:57"));
  ("Loader_dFingerprint.v_readBuildIdNear", ("Vuna.Compiler.Loader.Fingerprint.readBuildIdNear", "Vuna/Compiler/Loader/Fingerprint.vuna:109"));
  ("Loader_dFingerprint.v_readFirstBuildId", ("Vuna.Compiler.Loader.Fingerprint.readFirstBuildId", "Vuna/Compiler/Loader/Fingerprint.vuna:120"));
  ("Loader_dFingerprint.v_readNamedNear", ("Vuna.Compiler.Loader.Fingerprint.readNamedNear", "Vuna/Compiler/Loader/Fingerprint.vuna:113"));
  ("Loader_dFingerprint.v_sourceFrag", ("Vuna.Compiler.Loader.Fingerprint.sourceFrag", "Vuna/Compiler/Loader/Fingerprint.vuna:53"));
  ("Loader_dFingerprint.v_textHashOf", ("Vuna.Compiler.Loader.Fingerprint.textHashOf", "Vuna/Compiler/Loader/Fingerprint.vuna:60"));
  ("Loader_dFixity.v_applySectionLeft", ("Vuna.Compiler.Loader.Fixity.applySectionLeft", "Vuna/Compiler/Loader/Fixity.vuna:301"));
  ("Loader_dFixity.v_applySectionRight", ("Vuna.Compiler.Loader.Fixity.applySectionRight", "Vuna/Compiler/Loader/Fixity.vuna:308"));
  ("Loader_dFixity.v_builtinFixityDecls", ("Vuna.Compiler.Loader.Fixity.builtinFixityDecls", "Vuna/Compiler/Loader/Fixity.vuna:53"));
  ("Loader_dFixity.v_builtinFixityOps", ("Vuna.Compiler.Loader.Fixity.builtinFixityOps", "Vuna/Compiler/Loader/Fixity.vuna:57"));
  ("Loader_dFixity.v_chainBacktick", ("Vuna.Compiler.Loader.Fixity.chainBacktick", "Vuna/Compiler/Loader/Fixity.vuna:147"));
  ("Loader_dFixity.v_chainOperand", ("Vuna.Compiler.Loader.Fixity.chainOperand", "Vuna/Compiler/Loader/Fixity.vuna:164"));
  ("Loader_dFixity.v_checkUniqueFixities", ("Vuna.Compiler.Loader.Fixity.checkUniqueFixities", "Vuna/Compiler/Loader/Fixity.vuna:65"));
  ("Loader_dFixity.v_checkUniqueFixitiesGo", ("Vuna.Compiler.Loader.Fixity.checkUniqueFixitiesGo", "Vuna/Compiler/Loader/Fixity.vuna:68"));
  ("Loader_dFixity.v_climb", ("Vuna.Compiler.Loader.Fixity.climb", "Vuna/Compiler/Loader/Fixity.vuna:174"));
  ("Loader_dFixity.v_collectChain", ("Vuna.Compiler.Loader.Fixity.collectChain", "Vuna/Compiler/Loader/Fixity.vuna:152"));
  ("Loader_dFixity.v_fixityOf", ("Vuna.Compiler.Loader.Fixity.fixityOf", "Vuna/Compiler/Loader/Fixity.vuna:115"));
  ("Loader_dFixity.v_fixityOpOf", ("Vuna.Compiler.Loader.Fixity.fixityOpOf", "Vuna/Compiler/Loader/Fixity.vuna:60"));
  ("Loader_dFixity.v_foldApps", ("Vuna.Compiler.Loader.Fixity.foldApps", "Vuna/Compiler/Loader/Fixity.vuna:215"));
  ("Loader_dFixity.v_infixTerm", ("Vuna.Compiler.Loader.Fixity.infixTerm", "Vuna/Compiler/Loader/Fixity.vuna:127"));
  ("Loader_dFixity.v_isChainNode", ("Vuna.Compiler.Loader.Fixity.isChainNode", "Vuna/Compiler/Loader/Fixity.vuna:136"));
  ("Loader_dFixity.v_lookupDecl", ("Vuna.Compiler.Loader.Fixity.lookupDecl", "Vuna/Compiler/Loader/Fixity.vuna:85"));
  ("Loader_dFixity.v_lookupFixity", ("Vuna.Compiler.Loader.Fixity.lookupFixity", "Vuna/Compiler/Loader/Fixity.vuna:96"));
  ("Loader_dFixity.v_lookupFixityDecl", ("Vuna.Compiler.Loader.Fixity.lookupFixityDecl", "Vuna/Compiler/Loader/Fixity.vuna:90"));
  ("Loader_dFixity.v_renameMode", ("Vuna.Compiler.Loader.Fixity.renameMode", "Vuna/Compiler/Loader/Fixity.vuna:48"));
  ("Loader_dFixity.v_reorderAlt", ("Vuna.Compiler.Loader.Fixity.reorderAlt", "Vuna/Compiler/Loader/Fixity.vuna:371"));
  ("Loader_dFixity.v_reorderAlts", ("Vuna.Compiler.Loader.Fixity.reorderAlts", "Vuna/Compiler/Loader/Fixity.vuna:368"));
  ("Loader_dFixity.v_reorderApp", ("Vuna.Compiler.Loader.Fixity.reorderApp", "Vuna/Compiler/Loader/Fixity.vuna:281"));
  ("Loader_dFixity.v_reorderBind", ("Vuna.Compiler.Loader.Fixity.reorderBind", "Vuna/Compiler/Loader/Fixity.vuna:336"));
  ("Loader_dFixity.v_reorderBindingSig", ("Vuna.Compiler.Loader.Fixity.reorderBindingSig", "Vuna/Compiler/Loader/Fixity.vuna:350"));
  ("Loader_dFixity.v_reorderBindingValue", ("Vuna.Compiler.Loader.Fixity.reorderBindingValue", "Vuna/Compiler/Loader/Fixity.vuna:343"));
  ("Loader_dFixity.v_reorderBinds", ("Vuna.Compiler.Loader.Fixity.reorderBinds", "Vuna/Compiler/Loader/Fixity.vuna:333"));
  ("Loader_dFixity.v_reorderChain", ("Vuna.Compiler.Loader.Fixity.reorderChain", "Vuna/Compiler/Loader/Fixity.vuna:200"));
  ("Loader_dFixity.v_reorderClause", ("Vuna.Compiler.Loader.Fixity.reorderClause", "Vuna/Compiler/Loader/Fixity.vuna:377"));
  ("Loader_dFixity.v_reorderClauses", ("Vuna.Compiler.Loader.Fixity.reorderClauses", "Vuna/Compiler/Loader/Fixity.vuna:364"));
  ("Loader_dFixity.v_reorderCtor", ("Vuna.Compiler.Loader.Fixity.reorderCtor", "Vuna/Compiler/Loader/Fixity.vuna:457"));
  ("Loader_dFixity.v_reorderDecl", ("Vuna.Compiler.Loader.Fixity.reorderDecl", "Vuna/Compiler/Loader/Fixity.vuna:417"));
  ("Loader_dFixity.v_reorderDoStmt", ("Vuna.Compiler.Loader.Fixity.reorderDoStmt", "Vuna/Compiler/Loader/Fixity.vuna:383"));
  ("Loader_dFixity.v_reorderExpr", ("Vuna.Compiler.Loader.Fixity.reorderExpr", "Vuna/Compiler/Loader/Fixity.vuna:316"));
  ("Loader_dFixity.v_reorderField", ("Vuna.Compiler.Loader.Fixity.reorderField", "Vuna/Compiler/Loader/Fixity.vuna:360"));
  ("Loader_dFixity.v_reorderFields", ("Vuna.Compiler.Loader.Fixity.reorderFields", "Vuna/Compiler/Loader/Fixity.vuna:357"));
  ("Loader_dFixity.v_reorderInstanceMethodDecl", ("Vuna.Compiler.Loader.Fixity.reorderInstanceMethodDecl", "Vuna/Compiler/Loader/Fixity.vuna:469"));
  ("Loader_dFixity.v_reorderInterpParts", ("Vuna.Compiler.Loader.Fixity.reorderInterpParts", "Vuna/Compiler/Loader/Fixity.vuna:322"));
  ("Loader_dFixity.v_reorderNonChain", ("Vuna.Compiler.Loader.Fixity.reorderNonChain", "Vuna/Compiler/Loader/Fixity.vuna:220"));
  ("Loader_dFixity.v_reorderPattern", ("Vuna.Compiler.Loader.Fixity.reorderPattern", "Vuna/Compiler/Loader/Fixity.vuna:393"));
  ("Loader_dFixity.v_reorderProgram", ("Vuna.Compiler.Loader.Fixity.reorderProgram", "Vuna/Compiler/Loader/Fixity.vuna:480"));
  ("Loader_dFixity.v_reorderRecPatField", ("Vuna.Compiler.Loader.Fixity.reorderRecPatField", "Vuna/Compiler/Loader/Fixity.vuna:412"));
  ("Loader_dFixity.v_reorderRecordField", ("Vuna.Compiler.Loader.Fixity.reorderRecordField", "Vuna/Compiler/Loader/Fixity.vuna:461"));
  ("Loader_dFixity.v_reorderSectionApply", ("Vuna.Compiler.Loader.Fixity.reorderSectionApply", "Vuna/Compiler/Loader/Fixity.vuna:287"));
  ("Loader_dFixity.v_reorderTraitMethod", ("Vuna.Compiler.Loader.Fixity.reorderTraitMethod", "Vuna/Compiler/Loader/Fixity.vuna:465"));
  ("Loader_dFixity.v_reorderTraitParam", ("Vuna.Compiler.Loader.Fixity.reorderTraitParam", "Vuna/Compiler/Loader/Fixity.vuna:448"));
  ("Loader_dFixity.v_tableOf", ("Vuna.Compiler.Loader.Fixity.tableOf", "Vuna/Compiler/Loader/Fixity.vuna:34"));
  ("Loader_dFixity.v_tableOfCst", ("Vuna.Compiler.Loader.Fixity.tableOfCst", "Vuna/Compiler/Loader/Fixity.vuna:42"));
  ("Loader_dFixity.v_tableOfKeepOps", ("Vuna.Compiler.Loader.Fixity.tableOfKeepOps", "Vuna/Compiler/Loader/Fixity.vuna:38"));
  ("Loader_dFixity.v_tableOfKeepOpsCst", ("Vuna.Compiler.Loader.Fixity.tableOfKeepOpsCst", "Vuna/Compiler/Loader/Fixity.vuna:45"));
  ("Loader_dFixity.v_unknownFixityMsg", ("Vuna.Compiler.Loader.Fixity.unknownFixityMsg", "Vuna/Compiler/Loader/Fixity.vuna:110"));
  ("Loader_dFixity.v_withFixitySpan", ("Vuna.Compiler.Loader.Fixity.withFixitySpan", "Vuna/Compiler/Loader/Fixity.vuna:81"));
  ("Loader_dFlatten.v_abstractOpaquePrefix", ("Vuna.Compiler.Loader.Flatten.abstractOpaquePrefix", "Vuna/Compiler/Loader/Flatten.vuna:523"));
  ("Loader_dFlatten.v_altRefNamesGo", ("Vuna.Compiler.Loader.Flatten.altRefNamesGo", "Vuna/Compiler/Loader/Flatten.vuna:1338"));
  ("Loader_dFlatten.v_altRefNamesListGo", ("Vuna.Compiler.Loader.Flatten.altRefNamesListGo", "Vuna/Compiler/Loader/Flatten.vuna:1341"));
  ("Loader_dFlatten.v_anyDeclOnLine", ("Vuna.Compiler.Loader.Flatten.anyDeclOnLine", "Vuna/Compiler/Loader/Flatten.vuna:1193"));
  ("Loader_dFlatten.v_anyImportOnLine", ("Vuna.Compiler.Loader.Flatten.anyImportOnLine", "Vuna/Compiler/Loader/Flatten.vuna:1183"));
  ("Loader_dFlatten.v_anyInstanceDecl", ("Vuna.Compiler.Loader.Flatten.anyInstanceDecl", "Vuna/Compiler/Loader/Flatten.vuna:1159"));
  ("Loader_dFlatten.v_anyNameIn", ("Vuna.Compiler.Loader.Flatten.anyNameIn", "Vuna/Compiler/Loader/Flatten.vuna:1147"));
  ("Loader_dFlatten.v_anyNameSuffixIn", ("Vuna.Compiler.Loader.Flatten.anyNameSuffixIn", "Vuna/Compiler/Loader/Flatten.vuna:1123"));
  ("Loader_dFlatten.v_anyOpDeclared", ("Vuna.Compiler.Loader.Flatten.anyOpDeclared", "Vuna/Compiler/Loader/Flatten.vuna:1118"));
  ("Loader_dFlatten.v_anyTargetIn", ("Vuna.Compiler.Loader.Flatten.anyTargetIn", "Vuna/Compiler/Loader/Flatten.vuna:1233"));
  ("Loader_dFlatten.v_bindRefNamesGo", ("Vuna.Compiler.Loader.Flatten.bindRefNamesGo", "Vuna/Compiler/Loader/Flatten.vuna:1319"));
  ("Loader_dFlatten.v_bindRefNamesListGo", ("Vuna.Compiler.Loader.Flatten.bindRefNamesListGo", "Vuna/Compiler/Loader/Flatten.vuna:1333"));
  ("Loader_dFlatten.v_bindingSigRefNames", ("Vuna.Compiler.Loader.Flatten.bindingSigRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1329"));
  ("Loader_dFlatten.v_bindingValueRefNames", ("Vuna.Compiler.Loader.Flatten.bindingValueRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1324"));
  ("Loader_dFlatten.v_clauseRefNamesGo", ("Vuna.Compiler.Loader.Flatten.clauseRefNamesGo", "Vuna/Compiler/Loader/Flatten.vuna:1346"));
  ("Loader_dFlatten.v_clauseRefNamesListGo", ("Vuna.Compiler.Loader.Flatten.clauseRefNamesListGo", "Vuna/Compiler/Loader/Flatten.vuna:1349"));
  ("Loader_dFlatten.v_computeExports", ("Vuna.Compiler.Loader.Flatten.computeExports", "Vuna/Compiler/Loader/Flatten.vuna:539"));
  ("Loader_dFlatten.v_ctorEntriesOfType", ("Vuna.Compiler.Loader.Flatten.ctorEntriesOfType", "Vuna/Compiler/Loader/Flatten.vuna:219"));
  ("Loader_dFlatten.v_ctorRefNames", ("Vuna.Compiler.Loader.Flatten.ctorRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1254"));
  ("Loader_dFlatten.v_declGlobalNames", ("Vuna.Compiler.Loader.Flatten.declGlobalNames", "Vuna/Compiler/Loader/Flatten.vuna:1212"));
  ("Loader_dFlatten.v_declRefNames", ("Vuna.Compiler.Loader.Flatten.declRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1239"));
  ("Loader_dFlatten.v_dedupeByFullKey", ("Vuna.Compiler.Loader.Flatten.dedupeByFullKey", "Vuna/Compiler/Loader/Flatten.vuna:482"));
  ("Loader_dFlatten.v_dedupeExportEntries", ("Vuna.Compiler.Loader.Flatten.dedupeExportEntries", "Vuna/Compiler/Loader/Flatten.vuna:476"));
  ("Loader_dFlatten.v_dedupeFixitiesGo", ("Vuna.Compiler.Loader.Flatten.dedupeFixitiesGo", "Vuna/Compiler/Loader/Flatten.vuna:88"));
  ("Loader_dFlatten.v_dedupeFixitiesOf", ("Vuna.Compiler.Loader.Flatten.dedupeFixitiesOf", "Vuna/Compiler/Loader/Flatten.vuna:81"));
  ("Loader_dFlatten.v_definedNamesOf", ("Vuna.Compiler.Loader.Flatten.definedNamesOf", "Vuna/Compiler/Loader/Flatten.vuna:1129"));
  ("Loader_dFlatten.v_definedNamesOfDecl", ("Vuna.Compiler.Loader.Flatten.definedNamesOfDecl", "Vuna/Compiler/Loader/Flatten.vuna:1133"));
  ("Loader_dFlatten.v_doStmtRefNamesGo", ("Vuna.Compiler.Loader.Flatten.doStmtRefNamesGo", "Vuna/Compiler/Loader/Flatten.vuna:1354"));
  ("Loader_dFlatten.v_doStmtRefNamesListGo", ("Vuna.Compiler.Loader.Flatten.doStmtRefNamesListGo", "Vuna/Compiler/Loader/Flatten.vuna:1359"));
  ("Loader_dFlatten.v_entryScopeOf", ("Vuna.Compiler.Loader.Flatten.entryScopeOf", "Vuna/Compiler/Loader/Flatten.vuna:734"));
  ("Loader_dFlatten.v_expandGlobalName", ("Vuna.Compiler.Loader.Flatten.expandGlobalName", "Vuna/Compiler/Loader/Flatten.vuna:1219"));
  ("Loader_dFlatten.v_explicitExports", ("Vuna.Compiler.Loader.Flatten.explicitExports", "Vuna/Compiler/Loader/Flatten.vuna:491"));
  ("Loader_dFlatten.v_exportBare", ("Vuna.Compiler.Loader.Flatten.exportBare", "Vuna/Compiler/Loader/Flatten.vuna:325"));
  ("Loader_dFlatten.v_exportEntryKey", ("Vuna.Compiler.Loader.Flatten.exportEntryKey", "Vuna/Compiler/Loader/Flatten.vuna:479"));
  ("Loader_dFlatten.v_exportItemEntries", ("Vuna.Compiler.Loader.Flatten.exportItemEntries", "Vuna/Compiler/Loader/Flatten.vuna:444"));
  ("Loader_dFlatten.v_exportItemsAll", ("Vuna.Compiler.Loader.Flatten.exportItemsAll", "Vuna/Compiler/Loader/Flatten.vuna:500"));
  ("Loader_dFlatten.v_exportSelective", ("Vuna.Compiler.Loader.Flatten.exportSelective", "Vuna/Compiler/Loader/Flatten.vuna:362"));
  ("Loader_dFlatten.v_exportSpecToItem", ("Vuna.Compiler.Loader.Flatten.exportSpecToItem", "Vuna/Compiler/Loader/Flatten.vuna:557"));
  ("Loader_dFlatten.v_exportTargetOf", ("Vuna.Compiler.Loader.Flatten.exportTargetOf", "Vuna/Compiler/Loader/Flatten.vuna:1229"));
  ("Loader_dFlatten.v_exportTypeAll", ("Vuna.Compiler.Loader.Flatten.exportTypeAll", "Vuna/Compiler/Loader/Flatten.vuna:377"));
  ("Loader_dFlatten.v_exprRefNames", ("Vuna.Compiler.Loader.Flatten.exprRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1290"));
  ("Loader_dFlatten.v_exprRefNamesGo", ("Vuna.Compiler.Loader.Flatten.exprRefNamesGo", "Vuna/Compiler/Loader/Flatten.vuna:1293"));
  ("Loader_dFlatten.v_exprRefNamesListGo", ("Vuna.Compiler.Loader.Flatten.exprRefNamesListGo", "Vuna/Compiler/Loader/Flatten.vuna:1310"));
  ("Loader_dFlatten.v_fieldExprsGo", ("Vuna.Compiler.Loader.Flatten.fieldExprsGo", "Vuna/Compiler/Loader/Flatten.vuna:1314"));
  ("Loader_dFlatten.v_fieldPatsGo", ("Vuna.Compiler.Loader.Flatten.fieldPatsGo", "Vuna/Compiler/Loader/Flatten.vuna:1282"));
  ("Loader_dFlatten.v_fieldRefNames", ("Vuna.Compiler.Loader.Flatten.fieldRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1258"));
  ("Loader_dFlatten.v_filterExportMembers", ("Vuna.Compiler.Loader.Flatten.filterExportMembers", "Vuna/Compiler/Loader/Flatten.vuna:468"));
  ("Loader_dFlatten.v_findCtorNamed", ("Vuna.Compiler.Loader.Flatten.findCtorNamed", "Vuna/Compiler/Loader/Flatten.vuna:144"));
  ("Loader_dFlatten.v_findMethodNamed", ("Vuna.Compiler.Loader.Flatten.findMethodNamed", "Vuna/Compiler/Loader/Flatten.vuna:150"));
  ("Loader_dFlatten.v_findOwnCtorNames", ("Vuna.Compiler.Loader.Flatten.findOwnCtorNames", "Vuna/Compiler/Loader/Flatten.vuna:156"));
  ("Loader_dFlatten.v_findOwnData", ("Vuna.Compiler.Loader.Flatten.findOwnData", "Vuna/Compiler/Loader/Flatten.vuna:122"));
  ("Loader_dFlatten.v_findOwnFn", ("Vuna.Compiler.Loader.Flatten.findOwnFn", "Vuna/Compiler/Loader/Flatten.vuna:134"));
  ("Loader_dFlatten.v_fixitiesForSource", ("Vuna.Compiler.Loader.Flatten.fixitiesForSource", "Vuna/Compiler/Loader/Flatten.vuna:977"));
  ("Loader_dFlatten.v_fixitiesForSourceIn", ("Vuna.Compiler.Loader.Flatten.fixitiesForSourceIn", "Vuna/Compiler/Loader/Flatten.vuna:924"));
  ("Loader_dFlatten.v_fixitiesFromParsed", ("Vuna.Compiler.Loader.Flatten.fixitiesFromParsed", "Vuna/Compiler/Loader/Flatten.vuna:936"));
  ("Loader_dFlatten.v_fixityDeclKey", ("Vuna.Compiler.Loader.Flatten.fixityDeclKey", "Vuna/Compiler/Loader/Flatten.vuna:98"));
  ("Loader_dFlatten.v_fixityOpsOf", ("Vuna.Compiler.Loader.Flatten.fixityOpsOf", "Vuna/Compiler/Loader/Flatten.vuna:1106"));
  ("Loader_dFlatten.v_hasImportOf", ("Vuna.Compiler.Loader.Flatten.hasImportOf", "Vuna/Compiler/Loader/Flatten.vuna:427"));
  ("Loader_dFlatten.v_implicitPrelude", ("Vuna.Compiler.Loader.Flatten.implicitPrelude", "Vuna/Compiler/Loader/Flatten.vuna:571"));
  ("Loader_dFlatten.v_implicitPreludeDeps", ("Vuna.Compiler.Loader.Flatten.implicitPreludeDeps", "Vuna/Compiler/Loader/Flatten.vuna:588"));
  ("Loader_dFlatten.v_implicitPreludeFrom", ("Vuna.Compiler.Loader.Flatten.implicitPreludeFrom", "Vuna/Compiler/Loader/Flatten.vuna:580"));
  ("Loader_dFlatten.v_importOwnsLine", ("Vuna.Compiler.Loader.Flatten.importOwnsLine", "Vuna/Compiler/Loader/Flatten.vuna:1174"));
  ("Loader_dFlatten.v_importProvidesDeclaredFixity", ("Vuna.Compiler.Loader.Flatten.importProvidesDeclaredFixity", "Vuna/Compiler/Loader/Flatten.vuna:1112"));
  ("Loader_dFlatten.v_importProvidesUsedFixity", ("Vuna.Compiler.Loader.Flatten.importProvidesUsedFixity", "Vuna/Compiler/Loader/Flatten.vuna:1100"));
  ("Loader_dFlatten.v_importRemovalEdits", ("Vuna.Compiler.Loader.Flatten.importRemovalEdits", "Vuna/Compiler/Loader/Flatten.vuna:1166"));
  ("Loader_dFlatten.v_importRemovalSpan", ("Vuna.Compiler.Loader.Flatten.importRemovalSpan", "Vuna/Compiler/Loader/Flatten.vuna:1199"));
  ("Loader_dFlatten.v_importStartsLine", ("Vuna.Compiler.Loader.Flatten.importStartsLine", "Vuna/Compiler/Loader/Flatten.vuna:1180"));
  ("Loader_dFlatten.v_interpPartRefNamesGo", ("Vuna.Compiler.Loader.Flatten.interpPartRefNamesGo", "Vuna/Compiler/Loader/Flatten.vuna:1364"));
  ("Loader_dFlatten.v_interpPartRefNamesListGo", ("Vuna.Compiler.Loader.Flatten.interpPartRefNamesListGo", "Vuna/Compiler/Loader/Flatten.vuna:1368"));
  ("Loader_dFlatten.v_isAbstractOpaqueName", ("Vuna.Compiler.Loader.Flatten.isAbstractOpaqueName", "Vuna/Compiler/Loader/Flatten.vuna:536"));
  ("Loader_dFlatten.v_isEmptyEntries", ("Vuna.Compiler.Loader.Flatten.isEmptyEntries", "Vuna/Compiler/Loader/Flatten.vuna:373"));
  ("Loader_dFlatten.v_isPrivateName", ("Vuna.Compiler.Loader.Flatten.isPrivateName", "Vuna/Compiler/Loader/Flatten.vuna:107"));
  ("Loader_dFlatten.v_isRecordDecl", ("Vuna.Compiler.Loader.Flatten.isRecordDecl", "Vuna/Compiler/Loader/Flatten.vuna:254"));
  ("Loader_dFlatten.v_isRecordTarget", ("Vuna.Compiler.Loader.Flatten.isRecordTarget", "Vuna/Compiler/Loader/Flatten.vuna:241"));
  ("Loader_dFlatten.v_joinCommaNames", ("Vuna.Compiler.Loader.Flatten.joinCommaNames", "Vuna/Compiler/Loader/Flatten.vuna:439"));
  ("Loader_dFlatten.v_loadAll", ("Vuna.Compiler.Loader.Flatten.loadAll", "Vuna/Compiler/Loader/Flatten.vuna:606"));
  ("Loader_dFlatten.v_loadModule", ("Vuna.Compiler.Loader.Flatten.loadModule", "Vuna/Compiler/Loader/Flatten.vuna:637"));
  ("Loader_dFlatten.v_loadModuleSource", ("Vuna.Compiler.Loader.Flatten.loadModuleSource", "Vuna/Compiler/Loader/Flatten.vuna:864"));
  ("Loader_dFlatten.v_loadModuleSourceWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadModuleSourceWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:868"));
  ("Loader_dFlatten.v_loadProject", ("Vuna.Compiler.Loader.Flatten.loadProject", "Vuna/Compiler/Loader/Flatten.vuna:729"));
  ("Loader_dFlatten.v_loadProjectModules", ("Vuna.Compiler.Loader.Flatten.loadProjectModules", "Vuna/Compiler/Loader/Flatten.vuna:795"));
  ("Loader_dFlatten.v_loadProjectModulesWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadProjectModulesWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:798"));
  ("Loader_dFlatten.v_loadProjectSource", ("Vuna.Compiler.Loader.Flatten.loadProjectSource", "Vuna/Compiler/Loader/Flatten.vuna:813"));
  ("Loader_dFlatten.v_loadProjectSourceWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadProjectSourceWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:817"));
  ("Loader_dFlatten.v_loadProjectWithPreloaded", ("Vuna.Compiler.Loader.Flatten.loadProjectWithPreloaded", "Vuna/Compiler/Loader/Flatten.vuna:746"));
  ("Loader_dFlatten.v_moduleDeclaresInstance", ("Vuna.Compiler.Loader.Flatten.moduleDeclaresInstance", "Vuna/Compiler/Loader/Flatten.vuna:1153"));
  ("Loader_dFlatten.v_namespaceEntry", ("Vuna.Compiler.Loader.Flatten.namespaceEntry", "Vuna/Compiler/Loader/Flatten.vuna:464"));
  ("Loader_dFlatten.v_namespaceImportsGo", ("Vuna.Compiler.Loader.Flatten.namespaceImportsGo", "Vuna/Compiler/Loader/Flatten.vuna:418"));
  ("Loader_dFlatten.v_namespaceImportsOf", ("Vuna.Compiler.Loader.Flatten.namespaceImportsOf", "Vuna/Compiler/Loader/Flatten.vuna:415"));
  ("Loader_dFlatten.v_notEmpty", ("Vuna.Compiler.Loader.Flatten.notEmpty", "Vuna/Compiler/Loader/Flatten.vuna:553"));
  ("Loader_dFlatten.v_nsDropLocal", ("Vuna.Compiler.Loader.Flatten.nsDropLocal", "Vuna/Compiler/Loader/Flatten.vuna:633"));
  ("Loader_dFlatten.v_nsTakeLocal", ("Vuna.Compiler.Loader.Flatten.nsTakeLocal", "Vuna/Compiler/Loader/Flatten.vuna:629"));
  ("Loader_dFlatten.v_opaqueBaseName", ("Vuna.Compiler.Loader.Flatten.opaqueBaseName", "Vuna/Compiler/Loader/Flatten.vuna:526"));
  ("Loader_dFlatten.v_opaqueNamesOf", ("Vuna.Compiler.Loader.Flatten.opaqueNamesOf", "Vuna/Compiler/Loader/Flatten.vuna:515"));
  ("Loader_dFlatten.v_ownCtorEntries", ("Vuna.Compiler.Loader.Flatten.ownCtorEntries", "Vuna/Compiler/Loader/Flatten.vuna:176"));
  ("Loader_dFlatten.v_ownCtorEntriesNamed", ("Vuna.Compiler.Loader.Flatten.ownCtorEntriesNamed", "Vuna/Compiler/Loader/Flatten.vuna:306"));
  ("Loader_dFlatten.v_ownDataCtorEntries", ("Vuna.Compiler.Loader.Flatten.ownDataCtorEntries", "Vuna/Compiler/Loader/Flatten.vuna:185"));
  ("Loader_dFlatten.v_ownOrImportedTypeRef", ("Vuna.Compiler.Loader.Flatten.ownOrImportedTypeRef", "Vuna/Compiler/Loader/Flatten.vuna:267"));
  ("Loader_dFlatten.v_ownOrImportedValueRef", ("Vuna.Compiler.Loader.Flatten.ownOrImportedValueRef", "Vuna/Compiler/Loader/Flatten.vuna:279"));
  ("Loader_dFlatten.v_ownOrImportedValueRef2", ("Vuna.Compiler.Loader.Flatten.ownOrImportedValueRef2", "Vuna/Compiler/Loader/Flatten.vuna:286"));
  ("Loader_dFlatten.v_ownTypeEntries", ("Vuna.Compiler.Loader.Flatten.ownTypeEntries", "Vuna/Compiler/Loader/Flatten.vuna:193"));
  ("Loader_dFlatten.v_parseFileWithPath", ("Vuna.Compiler.Loader.Flatten.parseFileWithPath", "Vuna/Compiler/Loader/Flatten.vuna:51"));
  ("Loader_dFlatten.v_parseFileWithPathMode", ("Vuna.Compiler.Loader.Flatten.parseFileWithPathMode", "Vuna/Compiler/Loader/Flatten.vuna:54"));
  ("Loader_dFlatten.v_parseWith", ("Vuna.Compiler.Loader.Flatten.parseWith", "Vuna/Compiler/Loader/Flatten.vuna:63"));
  ("Loader_dFlatten.v_patRefNames", ("Vuna.Compiler.Loader.Flatten.patRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1266"));
  ("Loader_dFlatten.v_patRefNamesGo", ("Vuna.Compiler.Loader.Flatten.patRefNamesGo", "Vuna/Compiler/Loader/Flatten.vuna:1269"));
  ("Loader_dFlatten.v_patRefNamesListGo", ("Vuna.Compiler.Loader.Flatten.patRefNamesListGo", "Vuna/Compiler/Loader/Flatten.vuna:1278"));
  ("Loader_dFlatten.v_pathPrefixOf", ("Vuna.Compiler.Loader.Flatten.pathPrefixOf", "Vuna/Compiler/Loader/Flatten.vuna:620"));
  ("Loader_dFlatten.v_privateExportMsg", ("Vuna.Compiler.Loader.Flatten.privateExportMsg", "Vuna/Compiler/Loader/Flatten.vuna:110"));
  ("Loader_dFlatten.v_refEntryList", ("Vuna.Compiler.Loader.Flatten.refEntryList", "Vuna/Compiler/Loader/Flatten.vuna:262"));
  ("Loader_dFlatten.v_renameExportEntry", ("Vuna.Compiler.Loader.Flatten.renameExportEntry", "Vuna/Compiler/Loader/Flatten.vuna:353"));
  ("Loader_dFlatten.v_renameTypeEntry", ("Vuna.Compiler.Loader.Flatten.renameTypeEntry", "Vuna/Compiler/Loader/Flatten.vuna:357"));
  ("Loader_dFlatten.v_resolveImportPrefix", ("Vuna.Compiler.Loader.Flatten.resolveImportPrefix", "Vuna/Compiler/Loader/Flatten.vuna:432"));
  ("Loader_dFlatten.v_resolveModuleGo", ("Vuna.Compiler.Loader.Flatten.resolveModuleGo", "Vuna/Compiler/Loader/Flatten.vuna:1023"));
  ("Loader_dFlatten.v_resolveModulesKeep", ("Vuna.Compiler.Loader.Flatten.resolveModulesKeep", "Vuna/Compiler/Loader/Flatten.vuna:1009"));
  ("Loader_dFlatten.v_resolveProject", ("Vuna.Compiler.Loader.Flatten.resolveProject", "Vuna/Compiler/Loader/Flatten.vuna:989"));
  ("Loader_dFlatten.v_resolveProjectKeeping", ("Vuna.Compiler.Loader.Flatten.resolveProjectKeeping", "Vuna/Compiler/Loader/Flatten.vuna:1001"));
  ("Loader_dFlatten.v_resolveProjectWith", ("Vuna.Compiler.Loader.Flatten.resolveProjectWith", "Vuna/Compiler/Loader/Flatten.vuna:993"));
  ("Loader_dFlatten.v_showCycle", ("Vuna.Compiler.Loader.Flatten.showCycle", "Vuna/Compiler/Loader/Flatten.vuna:563"));
  ("Loader_dFlatten.v_traitMethodNames", ("Vuna.Compiler.Loader.Flatten.traitMethodNames", "Vuna/Compiler/Loader/Flatten.vuna:1143"));
  ("Loader_dFlatten.v_traitMethodRefNames", ("Vuna.Compiler.Loader.Flatten.traitMethodRefNames", "Vuna/Compiler/Loader/Flatten.vuna:1262"));
  ("Loader_dFlatten.v_typeRefDominates", ("Vuna.Compiler.Loader.Flatten.typeRefDominates", "Vuna/Compiler/Loader/Flatten.vuna:230"));
  ("Loader_dFlatten.v_unusedImportDiag", ("Vuna.Compiler.Loader.Flatten.unusedImportDiag", "Vuna/Compiler/Loader/Flatten.vuna:1087"));
  ("Loader_dFlatten.v_unusedImportWarnings", ("Vuna.Compiler.Loader.Flatten.unusedImportWarnings", "Vuna/Compiler/Loader/Flatten.vuna:1037"));
  ("Loader_dFlatten.v_unusedImportWarningsGo", ("Vuna.Compiler.Loader.Flatten.unusedImportWarningsGo", "Vuna/Compiler/Loader/Flatten.vuna:1075"));
  ("Loader_dFlatten.v_validateModuleHeader", ("Vuna.Compiler.Loader.Flatten.validateModuleHeader", "Vuna/Compiler/Loader/Flatten.vuna:507"));
  ("Loader_dFlatten.v_visibleFixityOps", ("Vuna.Compiler.Loader.Flatten.visibleFixityOps", "Vuna/Compiler/Loader/Flatten.vuna:1066"));
  ("Loader_dFlatten.v_withImportSpan", ("Vuna.Compiler.Loader.Flatten.withImportSpan", "Vuna/Compiler/Loader/Flatten.vuna:602"));
  ("Loader_dFlatten.v_withLayerCheck", ("Vuna.Compiler.Loader.Flatten.withLayerCheck", "Vuna/Compiler/Loader/Flatten.vuna:598"));
  ("Loader_dHeader.v_decImports", ("Vuna.Compiler.Loader.Header.decImports", "Vuna/Compiler/Loader/Header.vuna:41"));
  ("Loader_dHeader.v_encImports", ("Vuna.Compiler.Loader.Header.encImports", "Vuna/Compiler/Loader/Header.vuna:38"));
  ("Loader_dHeader.v_headerCodec", ("Vuna.Compiler.Loader.Header.headerCodec", "Vuna/Compiler/Loader/Header.vuna:31"));
  ("Loader_dHeader.v_headerImportsEff", ("Vuna.Compiler.Loader.Header.headerImportsEff", "Vuna/Compiler/Loader/Header.vuna:51"));
  ("Loader_dHeader.v_headerKind", ("Vuna.Compiler.Loader.Header.headerKind", "Vuna/Compiler/Loader/Header.vuna:27"));
  ("Loader_dHeader.v_headerObjKey", ("Vuna.Compiler.Loader.Header.headerObjKey", "Vuna/Compiler/Loader/Header.vuna:35"));
  ("Loader_dHeader.v_parseAndStore", ("Vuna.Compiler.Loader.Header.parseAndStore", "Vuna/Compiler/Loader/Header.vuna:62"));
  ("Loader_dLayers.v_allowedByRow", ("Vuna.Compiler.Loader.Layers.allowedByRow", "Vuna/Compiler/Loader/Layers.vuna:54"));
  ("Loader_dLayers.v_checkImports", ("Vuna.Compiler.Loader.Layers.checkImports", "Vuna/Compiler/Loader/Layers.vuna:94"));
  ("Loader_dLayers.v_checkModules", ("Vuna.Compiler.Loader.Layers.checkModules", "Vuna/Compiler/Loader/Layers.vuna:117"));
  ("Loader_dLayers.v_checkProjectLayers", ("Vuna.Compiler.Loader.Layers.checkProjectLayers", "Vuna/Compiler/Loader/Layers.vuna:131"));
  ("Loader_dLayers.v_closureBound", ("Vuna.Compiler.Loader.Layers.closureBound", "Vuna/Compiler/Loader/Layers.vuna:46"));
  ("Loader_dLayers.v_closureGo", ("Vuna.Compiler.Loader.Layers.closureGo", "Vuna/Compiler/Loader/Layers.vuna:35"));
  ("Loader_dLayers.v_covered", ("Vuna.Compiler.Loader.Layers.covered", "Vuna/Compiler/Loader/Layers.vuna:58"));
  ("Loader_dLayers.v_importAllowed", ("Vuna.Compiler.Loader.Layers.importAllowed", "Vuna/Compiler/Loader/Layers.vuna:63"));
  ("Loader_dLayers.v_isLayerPrefix", ("Vuna.Compiler.Loader.Layers.isLayerPrefix", "Vuna/Compiler/Loader/Layers.vuna:28"));
  ("Loader_dLayers.v_labelBest", ("Vuna.Compiler.Loader.Layers.labelBest", "Vuna/Compiler/Loader/Layers.vuna:81"));
  ("Loader_dLayers.v_labelOf", ("Vuna.Compiler.Loader.Layers.labelOf", "Vuna/Compiler/Loader/Layers.vuna:75"));
  ("Loader_dLayers.v_layerMatches", ("Vuna.Compiler.Loader.Layers.layerMatches", "Vuna/Compiler/Loader/Layers.vuna:68"));
  ("Loader_dLayers.v_layersOfRoot", ("Vuna.Compiler.Loader.Layers.layersOfRoot", "Vuna/Compiler/Loader/Layers.vuna:86"));
  ("Loader_dLayers.v_matchingLayers", ("Vuna.Compiler.Loader.Layers.matchingLayers", "Vuna/Compiler/Loader/Layers.vuna:71"));
  ("Loader_dLayers.v_usesOfLayer", ("Vuna.Compiler.Loader.Layers.usesOfLayer", "Vuna/Compiler/Loader/Layers.vuna:31"));
  ("Loader_dLayers.v_usesTotal", ("Vuna.Compiler.Loader.Layers.usesTotal", "Vuna/Compiler/Loader/Layers.vuna:49"));
  ("Loader_dLayers.v_withImportSpan", ("Vuna.Compiler.Loader.Layers.withImportSpan", "Vuna/Compiler/Loader/Layers.vuna:90"));
  ("Loader_dModules.v__ujoinNames", ("Vuna.Compiler.Loader.Modules._joinNames", "Vuna/Compiler/Loader/Modules.vuna:321"));
  ("Loader_dModules.v__ujoinRootDirs", ("Vuna.Compiler.Loader.Modules._joinRootDirs", "Vuna/Compiler/Loader/Modules.vuna:643"));
  ("Loader_dModules.v_aliasIs", ("Vuna.Compiler.Loader.Modules.aliasIs", "Vuna/Compiler/Loader/Modules.vuna:210"));
  ("Loader_dModules.v_allIdentChars", ("Vuna.Compiler.Loader.Modules.allIdentChars", "Vuna/Compiler/Loader/Modules.vuna:127"));
  ("Loader_dModules.v_allSegmentsValid", ("Vuna.Compiler.Loader.Modules.allSegmentsValid", "Vuna/Compiler/Loader/Modules.vuna:137"));
  ("Loader_dModules.v_anyCtorNamed", ("Vuna.Compiler.Loader.Modules.anyCtorNamed", "Vuna/Compiler/Loader/Modules.vuna:753"));
  ("Loader_dModules.v_anyCtorTarget", ("Vuna.Compiler.Loader.Modules.anyCtorTarget", "Vuna/Compiler/Loader/Modules.vuna:758"));
  ("Loader_dModules.v_anyModuleCtorTarget", ("Vuna.Compiler.Loader.Modules.anyModuleCtorTarget", "Vuna/Compiler/Loader/Modules.vuna:728"));
  ("Loader_dModules.v_candidateDir", ("Vuna.Compiler.Loader.Modules.candidateDir", "Vuna/Compiler/Loader/Modules.vuna:646"));
  ("Loader_dModules.v_checkImportAliasSyntax", ("Vuna.Compiler.Loader.Modules.checkImportAliasSyntax", "Vuna/Compiler/Loader/Modules.vuna:230"));
  ("Loader_dModules.v_collectModuleFiles", ("Vuna.Compiler.Loader.Modules.collectModuleFiles", "Vuna/Compiler/Loader/Modules.vuna:628"));
  ("Loader_dModules.v_ctorCanonical", ("Vuna.Compiler.Loader.Modules.ctorCanonical", "Vuna/Compiler/Loader/Modules.vuna:184"));
  ("Loader_dModules.v_dropFirst", ("Vuna.Compiler.Loader.Modules.dropFirst", "Vuna/Compiler/Loader/Modules.vuna:706"));
  ("Loader_dModules.v_entriesByName", ("Vuna.Compiler.Loader.Modules.entriesByName", "Vuna/Compiler/Loader/Modules.vuna:432"));
  ("Loader_dModules.v_exportIndexOf", ("Vuna.Compiler.Loader.Modules.exportIndexOf", "Vuna/Compiler/Loader/Modules.vuna:421"));
  ("Loader_dModules.v_exportIndexOfGo", ("Vuna.Compiler.Loader.Modules.exportIndexOfGo", "Vuna/Compiler/Loader/Modules.vuna:424"));
  ("Loader_dModules.v_exportIndexOfModule", ("Vuna.Compiler.Loader.Modules.exportIndexOfModule", "Vuna/Compiler/Loader/Modules.vuna:438"));
  ("Loader_dModules.v_exportIndexOfModuleIn", ("Vuna.Compiler.Loader.Modules.exportIndexOfModuleIn", "Vuna/Compiler/Loader/Modules.vuna:445"));
  ("Loader_dModules.v_exportsOf", ("Vuna.Compiler.Loader.Modules.exportsOf", "Vuna/Compiler/Loader/Modules.vuna:394"));
  ("Loader_dModules.v_filterCtors", ("Vuna.Compiler.Loader.Modules.filterCtors", "Vuna/Compiler/Loader/Modules.vuna:492"));
  ("Loader_dModules.v_filterKinds", ("Vuna.Compiler.Loader.Modules.filterKinds", "Vuna/Compiler/Loader/Modules.vuna:476"));
  ("Loader_dModules.v_findExportCtor", ("Vuna.Compiler.Loader.Modules.findExportCtor", "Vuna/Compiler/Loader/Modules.vuna:484"));
  ("Loader_dModules.v_findExportCtorIn", ("Vuna.Compiler.Loader.Modules.findExportCtorIn", "Vuna/Compiler/Loader/Modules.vuna:519"));
  ("Loader_dModules.v_findExportCtors", ("Vuna.Compiler.Loader.Modules.findExportCtors", "Vuna/Compiler/Loader/Modules.vuna:488"));
  ("Loader_dModules.v_findExportCtorsIn", ("Vuna.Compiler.Loader.Modules.findExportCtorsIn", "Vuna/Compiler/Loader/Modules.vuna:522"));
  ("Loader_dModules.v_findExportModule", ("Vuna.Compiler.Loader.Modules.findExportModule", "Vuna/Compiler/Loader/Modules.vuna:504"));
  ("Loader_dModules.v_findExportModuleIn", ("Vuna.Compiler.Loader.Modules.findExportModuleIn", "Vuna/Compiler/Loader/Modules.vuna:507"));
  ("Loader_dModules.v_findExportModules", ("Vuna.Compiler.Loader.Modules.findExportModules", "Vuna/Compiler/Loader/Modules.vuna:473"));
  ("Loader_dModules.v_findExportType", ("Vuna.Compiler.Loader.Modules.findExportType", "Vuna/Compiler/Loader/Modules.vuna:500"));
  ("Loader_dModules.v_findExportTypeIn", ("Vuna.Compiler.Loader.Modules.findExportTypeIn", "Vuna/Compiler/Loader/Modules.vuna:525"));
  ("Loader_dModules.v_findExportTypes", ("Vuna.Compiler.Loader.Modules.findExportTypes", "Vuna/Compiler/Loader/Modules.vuna:470"));
  ("Loader_dModules.v_findExportTypesIn", ("Vuna.Compiler.Loader.Modules.findExportTypesIn", "Vuna/Compiler/Loader/Modules.vuna:516"));
  ("Loader_dModules.v_findExportValue", ("Vuna.Compiler.Loader.Modules.findExportValue", "Vuna/Compiler/Loader/Modules.vuna:463"));
  ("Loader_dModules.v_findExportValueIn", ("Vuna.Compiler.Loader.Modules.findExportValueIn", "Vuna/Compiler/Loader/Modules.vuna:510"));
  ("Loader_dModules.v_findExportValues", ("Vuna.Compiler.Loader.Modules.findExportValues", "Vuna/Compiler/Loader/Modules.vuna:467"));
  ("Loader_dModules.v_findExportValuesIn", ("Vuna.Compiler.Loader.Modules.findExportValuesIn", "Vuna/Compiler/Loader/Modules.vuna:513"));
  ("Loader_dModules.v_findImportModule", ("Vuna.Compiler.Loader.Modules.findImportModule", "Vuna/Compiler/Loader/Modules.vuna:254"));
  ("Loader_dModules.v_findModule", ("Vuna.Compiler.Loader.Modules.findModule", "Vuna/Compiler/Loader/Modules.vuna:710"));
  ("Loader_dModules.v_findModuleFile", ("Vuna.Compiler.Loader.Modules.findModuleFile", "Vuna/Compiler/Loader/Modules.vuna:653"));
  ("Loader_dModules.v_importByPrefix", ("Vuna.Compiler.Loader.Modules.importByPrefix", "Vuna/Compiler/Loader/Modules.vuna:305"));
  ("Loader_dModules.v_importModuleNames", ("Vuna.Compiler.Loader.Modules.importModuleNames", "Vuna/Compiler/Loader/Modules.vuna:190"));
  ("Loader_dModules.v_importName", ("Vuna.Compiler.Loader.Modules.importName", "Vuna/Compiler/Loader/Modules.vuna:187"));
  ("Loader_dModules.v_isCtorCanonical", ("Vuna.Compiler.Loader.Modules.isCtorCanonical", "Vuna/Compiler/Loader/Modules.vuna:764"));
  ("Loader_dModules.v_isCtorTargetInDecls", ("Vuna.Compiler.Loader.Modules.isCtorTargetInDecls", "Vuna/Compiler/Loader/Modules.vuna:742"));
  ("Loader_dModules.v_isDataOrRecordCtorTarget", ("Vuna.Compiler.Loader.Modules.isDataOrRecordCtorTarget", "Vuna/Compiler/Loader/Modules.vuna:721"));
  ("Loader_dModules.v_isMangled", ("Vuna.Compiler.Loader.Modules.isMangled", "Vuna/Compiler/Loader/Modules.vuna:157"));
  ("Loader_dModules.v_lastSegment", ("Vuna.Compiler.Loader.Modules.lastSegment", "Vuna/Compiler/Loader/Modules.vuna:216"));
  ("Loader_dModules.v_longestIndexPrefix", ("Vuna.Compiler.Loader.Modules.longestIndexPrefix", "Vuna/Compiler/Loader/Modules.vuna:693"));
  ("Loader_dModules.v_lookupExport", ("Vuna.Compiler.Loader.Modules.lookupExport", "Vuna/Compiler/Loader/Modules.vuna:458"));
  ("Loader_dModules.v_mangle", ("Vuna.Compiler.Loader.Modules.mangle", "Vuna/Compiler/Loader/Modules.vuna:153"));
  ("Loader_dModules.v_missingModule", ("Vuna.Compiler.Loader.Modules.missingModule", "Vuna/Compiler/Loader/Modules.vuna:330"));
  ("Loader_dModules.v_moduleAllImportsOf", ("Vuna.Compiler.Loader.Modules.moduleAllImportsOf", "Vuna/Compiler/Loader/Modules.vuna:69"));
  ("Loader_dModules.v_moduleCtors", ("Vuna.Compiler.Loader.Modules.moduleCtors", "Vuna/Compiler/Loader/Modules.vuna:340"));
  ("Loader_dModules.v_moduleDecls", ("Vuna.Compiler.Loader.Modules.moduleDecls", "Vuna/Compiler/Loader/Modules.vuna:334"));
  ("Loader_dModules.v_moduleDeclsOf", ("Vuna.Compiler.Loader.Modules.moduleDeclsOf", "Vuna/Compiler/Loader/Modules.vuna:72"));
  ("Loader_dModules.v_moduleExportIndexOfOf", ("Vuna.Compiler.Loader.Modules.moduleExportIndexOfOf", "Vuna/Compiler/Loader/Modules.vuna:675"));
  ("Loader_dModules.v_moduleFixitiesOf", ("Vuna.Compiler.Loader.Modules.moduleFixitiesOf", "Vuna/Compiler/Loader/Modules.vuna:75"));
  ("Loader_dModules.v_moduleNameOf", ("Vuna.Compiler.Loader.Modules.moduleNameOf", "Vuna/Compiler/Loader/Modules.vuna:63"));
  ("Loader_dModules.v_moduleOpaqueOf", ("Vuna.Compiler.Loader.Modules.moduleOpaqueOf", "Vuna/Compiler/Loader/Modules.vuna:82"));
  ("Loader_dModules.v_modulePackageOf", ("Vuna.Compiler.Loader.Modules.modulePackageOf", "Vuna/Compiler/Loader/Modules.vuna:66"));
  ("Loader_dModules.v_modulePath", ("Vuna.Compiler.Loader.Modules.modulePath", "Vuna/Compiler/Loader/Modules.vuna:603"));
  ("Loader_dModules.v_moduleReexportsOf", ("Vuna.Compiler.Loader.Modules.moduleReexportsOf", "Vuna/Compiler/Loader/Modules.vuna:79"));
  ("Loader_dModules.v_moduleTblOf", ("Vuna.Compiler.Loader.Modules.moduleTblOf", "Vuna/Compiler/Loader/Modules.vuna:357"));
  ("Loader_dModules.v_moduleVisibleTo", ("Vuna.Compiler.Loader.Modules.moduleVisibleTo", "Vuna/Compiler/Loader/Modules.vuna:620"));
  ("Loader_dModules.v_modulesExportingCtor", ("Vuna.Compiler.Loader.Modules.modulesExportingCtor", "Vuna/Compiler/Loader/Modules.vuna:558"));
  ("Loader_dModules.v_modulesExportingCtorFrom", ("Vuna.Compiler.Loader.Modules.modulesExportingCtorFrom", "Vuna/Compiler/Loader/Modules.vuna:548"));
  ("Loader_dModules.v_modulesExportingCtorIn", ("Vuna.Compiler.Loader.Modules.modulesExportingCtorIn", "Vuna/Compiler/Loader/Modules.vuna:563"));
  ("Loader_dModules.v_modulesExportingType", ("Vuna.Compiler.Loader.Modules.modulesExportingType", "Vuna/Compiler/Loader/Modules.vuna:582"));
  ("Loader_dModules.v_modulesExportingTypeFrom", ("Vuna.Compiler.Loader.Modules.modulesExportingTypeFrom", "Vuna/Compiler/Loader/Modules.vuna:567"));
  ("Loader_dModules.v_modulesExportingTypeIn", ("Vuna.Compiler.Loader.Modules.modulesExportingTypeIn", "Vuna/Compiler/Loader/Modules.vuna:578"));
  ("Loader_dModules.v_modulesExportingValue", ("Vuna.Compiler.Loader.Modules.modulesExportingValue", "Vuna/Compiler/Loader/Modules.vuna:538"));
  ("Loader_dModules.v_modulesExportingValueFrom", ("Vuna.Compiler.Loader.Modules.modulesExportingValueFrom", "Vuna/Compiler/Loader/Modules.vuna:528"));
  ("Loader_dModules.v_modulesExportingValueIn", ("Vuna.Compiler.Loader.Modules.modulesExportingValueIn", "Vuna/Compiler/Loader/Modules.vuna:543"));
  ("Loader_dModules.v_normalizeImports", ("Vuna.Compiler.Loader.Modules.normalizeImports", "Vuna/Compiler/Loader/Modules.vuna:409"));
  ("Loader_dModules.v_notEmptyList", ("Vuna.Compiler.Loader.Modules.notEmptyList", "Vuna/Compiler/Loader/Modules.vuna:221"));
  ("Loader_dModules.v_openModuleNames", ("Vuna.Compiler.Loader.Modules.openModuleNames", "Vuna/Compiler/Loader/Modules.vuna:241"));
  ("Loader_dModules.v_openModuleNamesAll", ("Vuna.Compiler.Loader.Modules.openModuleNamesAll", "Vuna/Compiler/Loader/Modules.vuna:245"));
  ("Loader_dModules.v_projectEntryAllImports", ("Vuna.Compiler.Loader.Modules.projectEntryAllImports", "Vuna/Compiler/Loader/Modules.vuna:85"));
  ("Loader_dModules.v_qualifiedItemImport", ("Vuna.Compiler.Loader.Modules.qualifiedItemImport", "Vuna/Compiler/Loader/Modules.vuna:299"));
  ("Loader_dModules.v_qualifierCandidates", ("Vuna.Compiler.Loader.Modules.qualifierCandidates", "Vuna/Compiler/Loader/Modules.vuna:199"));
  ("Loader_dModules.v_reexportedImportNames", ("Vuna.Compiler.Loader.Modules.reexportedImportNames", "Vuna/Compiler/Loader/Modules.vuna:266"));
  ("Loader_dModules.v_reexportedImportNamesGo", ("Vuna.Compiler.Loader.Modules.reexportedImportNamesGo", "Vuna/Compiler/Loader/Modules.vuna:269"));
  ("Loader_dModules.v_reexportedImportNamesOfHeader", ("Vuna.Compiler.Loader.Modules.reexportedImportNamesOfHeader", "Vuna/Compiler/Loader/Modules.vuna:316"));
  ("Loader_dModules.v_resolveModuleName", ("Vuna.Compiler.Loader.Modules.resolveModuleName", "Vuna/Compiler/Loader/Modules.vuna:346"));
  ("Loader_dModules.v_resolveModuleNameIn", ("Vuna.Compiler.Loader.Modules.resolveModuleNameIn", "Vuna/Compiler/Loader/Modules.vuna:363"));
  ("Loader_dModules.v_resolvePathModule", ("Vuna.Compiler.Loader.Modules.resolvePathModule", "Vuna/Compiler/Loader/Modules.vuna:383"));
  ("Loader_dModules.v_resolvePathModuleIn", ("Vuna.Compiler.Loader.Modules.resolvePathModuleIn", "Vuna/Compiler/Loader/Modules.vuna:372"));
  ("Loader_dModules.v_resolvedName", ("Vuna.Compiler.Loader.Modules.resolvedName", "Vuna/Compiler/Loader/Modules.vuna:400"));
  ("Loader_dModules.v_resolvedNameIn", ("Vuna.Compiler.Loader.Modules.resolvedNameIn", "Vuna/Compiler/Loader/Modules.vuna:451"));
  ("Loader_dModules.v_rootAllows", ("Vuna.Compiler.Loader.Modules.rootAllows", "Vuna/Compiler/Loader/Modules.vuna:607"));
  ("Loader_dModules.v_rootOfName", ("Vuna.Compiler.Loader.Modules.rootOfName", "Vuna/Compiler/Loader/Modules.vuna:613"));
  ("Loader_dModules.v_sameTargetRest", ("Vuna.Compiler.Loader.Modules.sameTargetRest", "Vuna/Compiler/Loader/Modules.vuna:587"));
  ("Loader_dModules.v_sliceEq", ("Vuna.Compiler.Loader.Modules.sliceEq", "Vuna/Compiler/Loader/Modules.vuna:168"));
  ("Loader_dModules.v_sliceEqGo", ("Vuna.Compiler.Loader.Modules.sliceEqGo", "Vuna/Compiler/Loader/Modules.vuna:171"));
  ("Loader_dModules.v_takeSegsLocal", ("Vuna.Compiler.Loader.Modules.takeSegsLocal", "Vuna/Compiler/Loader/Modules.vuna:702"));
  ("Loader_dModules.v_unifyEntryPairs", ("Vuna.Compiler.Loader.Modules.unifyEntryPairs", "Vuna/Compiler/Loader/Modules.vuna:591"));
  ("Loader_dModules.v_validModuleName", ("Vuna.Compiler.Loader.Modules.validModuleName", "Vuna/Compiler/Loader/Modules.vuna:147"));
  ("Loader_dModules.v_validSegment", ("Vuna.Compiler.Loader.Modules.validSegment", "Vuna/Compiler/Loader/Modules.vuna:131"));
  ("Loader_dModules.v_validateImports", ("Vuna.Compiler.Loader.Modules.validateImports", "Vuna/Compiler/Loader/Modules.vuna:227"));
  ("Loader_dModules.v_walkNamespaceIndex", ("Vuna.Compiler.Loader.Modules.walkNamespaceIndex", "Vuna/Compiler/Loader/Modules.vuna:672"));
  ("Loader_dModules.v_walkNamespaceIndexFuel", ("Vuna.Compiler.Loader.Modules.walkNamespaceIndexFuel", "Vuna/Compiler/Loader/Modules.vuna:678"));
  ("Loader_dModules.v_withImportSite", ("Vuna.Compiler.Loader.Modules.withImportSite", "Vuna/Compiler/Loader/Modules.vuna:194"));
  ("Loader_dModules.v_withImporterSpan", ("Vuna.Compiler.Loader.Modules.withImporterSpan", "Vuna/Compiler/Loader/Modules.vuna:650"));
  ("Loader_dResolve.v_allEmptyTails", ("Vuna.Compiler.Loader.Resolve.allEmptyTails", "Vuna/Compiler/Loader/Resolve.vuna:623"));
  ("Loader_dResolve.v_allEq", ("Vuna.Compiler.Loader.Resolve.allEq", "Vuna/Compiler/Loader/Resolve.vuna:464"));
  ("Loader_dResolve.v_allSameTarget", ("Vuna.Compiler.Loader.Resolve.allSameTarget", "Vuna/Compiler/Loader/Resolve.vuna:459"));
  ("Loader_dResolve.v_anyCtorNamed", ("Vuna.Compiler.Loader.Resolve.anyCtorNamed", "Vuna/Compiler/Loader/Resolve.vuna:366"));
  ("Loader_dResolve.v_builtinArity", ("Vuna.Compiler.Loader.Resolve.builtinArity", "Vuna/Compiler/Loader/Resolve.vuna:44"));
  ("Loader_dResolve.v_checkBinder", ("Vuna.Compiler.Loader.Resolve.checkBinder", "Vuna/Compiler/Loader/Resolve.vuna:745"));
  ("Loader_dResolve.v_checkDebugConstruct", ("Vuna.Compiler.Loader.Resolve.checkDebugConstruct", "Vuna/Compiler/Loader/Resolve.vuna:949"));
  ("Loader_dResolve.v_checkTopName", ("Vuna.Compiler.Loader.Resolve.checkTopName", "Vuna/Compiler/Loader/Resolve.vuna:749"));
  ("Loader_dResolve.v_collectRecBinds", ("Vuna.Compiler.Loader.Resolve.collectRecBinds", "Vuna/Compiler/Loader/Resolve.vuna:891"));
  ("Loader_dResolve.v_commaJoin", ("Vuna.Compiler.Loader.Resolve.commaJoin", "Vuna/Compiler/Loader/Resolve.vuna:274"));
  ("Loader_dResolve.v_concatLeft", ("Vuna.Compiler.Loader.Resolve.concatLeft", "Vuna/Compiler/Loader/Resolve.vuna:941"));
  ("Loader_dResolve.v_constraintHeadOf", ("Vuna.Compiler.Loader.Resolve.constraintHeadOf", "Vuna/Compiler/Loader/Resolve.vuna:1303"));
  ("Loader_dResolve.v_ctorCandidates", ("Vuna.Compiler.Loader.Resolve.ctorCandidates", "Vuna/Compiler/Loader/Resolve.vuna:180"));
  ("Loader_dResolve.v_ctorCandsOf", ("Vuna.Compiler.Loader.Resolve.ctorCandsOf", "Vuna/Compiler/Loader/Resolve.vuna:115"));
  ("Loader_dResolve.v_ctorEntryHits", ("Vuna.Compiler.Loader.Resolve.ctorEntryHits", "Vuna/Compiler/Loader/Resolve.vuna:470"));
  ("Loader_dResolve.v_ctorFamilyEntryOf", ("Vuna.Compiler.Loader.Resolve.ctorFamilyEntryOf", "Vuna/Compiler/Loader/Resolve.vuna:487"));
  ("Loader_dResolve.v_ctorFamilyHits", ("Vuna.Compiler.Loader.Resolve.ctorFamilyHits", "Vuna/Compiler/Loader/Resolve.vuna:490"));
  ("Loader_dResolve.v_ctorPairTargets", ("Vuna.Compiler.Loader.Resolve.ctorPairTargets", "Vuna/Compiler/Loader/Resolve.vuna:1506"));
  ("Loader_dResolve.v_ctorRelFamily", ("Vuna.Compiler.Loader.Resolve.ctorRelFamily", "Vuna/Compiler/Loader/Resolve.vuna:379"));
  ("Loader_dResolve.v_ctorTargetInDecls", ("Vuna.Compiler.Loader.Resolve.ctorTargetInDecls", "Vuna/Compiler/Loader/Resolve.vuna:349"));
  ("Loader_dResolve.v_ctorTargetInFamily", ("Vuna.Compiler.Loader.Resolve.ctorTargetInFamily", "Vuna/Compiler/Loader/Resolve.vuna:385"));
  ("Loader_dResolve.v_declValueNames", ("Vuna.Compiler.Loader.Resolve.declValueNames", "Vuna/Compiler/Loader/Resolve.vuna:95"));
  ("Loader_dResolve.v_dropSegs", ("Vuna.Compiler.Loader.Resolve.dropSegs", "Vuna/Compiler/Loader/Resolve.vuna:571"));
  ("Loader_dResolve.v_dtPreludeNames", ("Vuna.Compiler.Loader.Resolve.dtPreludeNames", "Vuna/Compiler/Loader/Resolve.vuna:66"));
  ("Loader_dResolve.v_entryHits", ("Vuna.Compiler.Loader.Resolve.entryHits", "Vuna/Compiler/Loader/Resolve.vuna:297"));
  ("Loader_dResolve.v_exportTarget", ("Vuna.Compiler.Loader.Resolve.exportTarget", "Vuna/Compiler/Loader/Resolve.vuna:446"));
  ("Loader_dResolve.v_exprLowerNames", ("Vuna.Compiler.Loader.Resolve.exprLowerNames", "Vuna/Compiler/Loader/Resolve.vuna:1455"));
  ("Loader_dResolve.v_findFamilyCtorInModules", ("Vuna.Compiler.Loader.Resolve.findFamilyCtorInModules", "Vuna/Compiler/Loader/Resolve.vuna:371"));
  ("Loader_dResolve.v_firstModuleOf", ("Vuna.Compiler.Loader.Resolve.firstModuleOf", "Vuna/Compiler/Loader/Resolve.vuna:292"));
  ("Loader_dResolve.v_foldFieldChain", ("Vuna.Compiler.Loader.Resolve.foldFieldChain", "Vuna/Compiler/Loader/Resolve.vuna:563"));
  ("Loader_dResolve.v_hiddenRef", ("Vuna.Compiler.Loader.Resolve.hiddenRef", "Vuna/Compiler/Loader/Resolve.vuna:985"));
  ("Loader_dResolve.v_implicitScopeTable", ("Vuna.Compiler.Loader.Resolve.implicitScopeTable", "Vuna/Compiler/Loader/Resolve.vuna:1433"));
  ("Loader_dResolve.v_importedCtorTargets", ("Vuna.Compiler.Loader.Resolve.importedCtorTargets", "Vuna/Compiler/Loader/Resolve.vuna:171"));
  ("Loader_dResolve.v_isBuiltinName", ("Vuna.Compiler.Loader.Resolve.isBuiltinName", "Vuna/Compiler/Loader/Resolve.vuna:50"));
  ("Loader_dResolve.v_isDtPreludeName", ("Vuna.Compiler.Loader.Resolve.isDtPreludeName", "Vuna/Compiler/Loader/Resolve.vuna:63"));
  ("Loader_dResolve.v_isEmptyPaths", ("Vuna.Compiler.Loader.Resolve.isEmptyPaths", "Vuna/Compiler/Loader/Resolve.vuna:630"));
  ("Loader_dResolve.v_isLowerIdent", ("Vuna.Compiler.Loader.Resolve.isLowerIdent", "Vuna/Compiler/Loader/Resolve.vuna:1460"));
  ("Loader_dResolve.v_isLowerTypeName", ("Vuna.Compiler.Loader.Resolve.isLowerTypeName", "Vuna/Compiler/Loader/Resolve.vuna:1168"));
  ("Loader_dResolve.v_isParserSyntaxName", ("Vuna.Compiler.Loader.Resolve.isParserSyntaxName", "Vuna/Compiler/Loader/Resolve.vuna:964"));
  ("Loader_dResolve.v_isRowDomainExpr", ("Vuna.Compiler.Loader.Resolve.isRowDomainExpr", "Vuna/Compiler/Loader/Resolve.vuna:1524"));
  ("Loader_dResolve.v_isStringDomainExpr", ("Vuna.Compiler.Loader.Resolve.isStringDomainExpr", "Vuna/Compiler/Loader/Resolve.vuna:1513"));
  ("Loader_dResolve.v_isTypeDomainExpr", ("Vuna.Compiler.Loader.Resolve.isTypeDomainExpr", "Vuna/Compiler/Loader/Resolve.vuna:1520"));
  ("Loader_dResolve.v_lastSegmentOf", ("Vuna.Compiler.Loader.Resolve.lastSegmentOf", "Vuna/Compiler/Loader/Resolve.vuna:279"));
  ("Loader_dResolve.v_leadingImplicitNames", ("Vuna.Compiler.Loader.Resolve.leadingImplicitNames", "Vuna/Compiler/Loader/Resolve.vuna:1445"));
  ("Loader_dResolve.v_localCtorResult", ("Vuna.Compiler.Loader.Resolve.localCtorResult", "Vuna/Compiler/Loader/Resolve.vuna:1208"));
  ("Loader_dResolve.v_localCtorTarget", ("Vuna.Compiler.Loader.Resolve.localCtorTarget", "Vuna/Compiler/Loader/Resolve.vuna:152"));
  ("Loader_dResolve.v_localCtorTargets", ("Vuna.Compiler.Loader.Resolve.localCtorTargets", "Vuna/Compiler/Loader/Resolve.vuna:147"));
  ("Loader_dResolve.v_longestNamespaceEntry", ("Vuna.Compiler.Loader.Resolve.longestNamespaceEntry", "Vuna/Compiler/Loader/Resolve.vuna:214"));
  ("Loader_dResolve.v_longestNamespaceEntryGo", ("Vuna.Compiler.Loader.Resolve.longestNamespaceEntryGo", "Vuna/Compiler/Loader/Resolve.vuna:217"));
  ("Loader_dResolve.v_lowerTemplate", ("Vuna.Compiler.Loader.Resolve.lowerTemplate", "Vuna/Compiler/Loader/Resolve.vuna:928"));
  ("Loader_dResolve.v_memPathKey", ("Vuna.Compiler.Loader.Resolve.memPathKey", "Vuna/Compiler/Loader/Resolve.vuna:270"));
  ("Loader_dResolve.v_memberLabel", ("Vuna.Compiler.Loader.Resolve.memberLabel", "Vuna/Compiler/Loader/Resolve.vuna:285"));
  ("Loader_dResolve.v_namespacesOfWith", ("Vuna.Compiler.Loader.Resolve.namespacesOfWith", "Vuna/Compiler/Loader/Resolve.vuna:126"));
  ("Loader_dResolve.v_normalizeSyntaxNames", ("Vuna.Compiler.Loader.Resolve.normalizeSyntaxNames", "Vuna/Compiler/Loader/Resolve.vuna:996"));
  ("Loader_dResolve.v_normalizeTypeSyntaxNames", ("Vuna.Compiler.Loader.Resolve.normalizeTypeSyntaxNames", "Vuna/Compiler/Loader/Resolve.vuna:1315"));
  ("Loader_dResolve.v_notEmptyList", ("Vuna.Compiler.Loader.Resolve.notEmptyList", "Vuna/Compiler/Loader/Resolve.vuna:190"));
  ("Loader_dResolve.v_pairExportTarget", ("Vuna.Compiler.Loader.Resolve.pairExportTarget", "Vuna/Compiler/Loader/Resolve.vuna:163"));
  ("Loader_dResolve.v_pairIsDataCtor", ("Vuna.Compiler.Loader.Resolve.pairIsDataCtor", "Vuna/Compiler/Loader/Resolve.vuna:167"));
  ("Loader_dResolve.v_pathEntryHits", ("Vuna.Compiler.Loader.Resolve.pathEntryHits", "Vuna/Compiler/Loader/Resolve.vuna:575"));
  ("Loader_dResolve.v_pathKey", ("Vuna.Compiler.Loader.Resolve.pathKey", "Vuna/Compiler/Loader/Resolve.vuna:267"));
  ("Loader_dResolve.v_pickCtorOrOver", ("Vuna.Compiler.Loader.Resolve.pickCtorOrOver", "Vuna/Compiler/Loader/Resolve.vuna:714"));
  ("Loader_dResolve.v_pickTypeEntries", ("Vuna.Compiler.Loader.Resolve.pickTypeEntries", "Vuna/Compiler/Loader/Resolve.vuna:325"));
  ("Loader_dResolve.v_pickValueEntries", ("Vuna.Compiler.Loader.Resolve.pickValueEntries", "Vuna/Compiler/Loader/Resolve.vuna:319"));
  ("Loader_dResolve.v_pickValueEntry", ("Vuna.Compiler.Loader.Resolve.pickValueEntry", "Vuna/Compiler/Loader/Resolve.vuna:313"));
  ("Loader_dResolve.v_pickValueOrOver", ("Vuna.Compiler.Loader.Resolve.pickValueOrOver", "Vuna/Compiler/Loader/Resolve.vuna:706"));
  ("Loader_dResolve.v_realModuleName", ("Vuna.Compiler.Loader.Resolve.realModuleName", "Vuna/Compiler/Loader/Resolve.vuna:234"));
  ("Loader_dResolve.v_resolveAlt", ("Vuna.Compiler.Loader.Resolve.resolveAlt", "Vuna/Compiler/Loader/Resolve.vuna:784"));
  ("Loader_dResolve.v_resolveBindingSig", ("Vuna.Compiler.Loader.Resolve.resolveBindingSig", "Vuna/Compiler/Loader/Resolve.vuna:796"));
  ("Loader_dResolve.v_resolveBindingValue", ("Vuna.Compiler.Loader.Resolve.resolveBindingValue", "Vuna/Compiler/Loader/Resolve.vuna:804"));
  ("Loader_dResolve.v_resolveConstraintExpr", ("Vuna.Compiler.Loader.Resolve.resolveConstraintExpr", "Vuna/Compiler/Loader/Resolve.vuna:1294"));
  ("Loader_dResolve.v_resolveCtor", ("Vuna.Compiler.Loader.Resolve.resolveCtor", "Vuna/Compiler/Loader/Resolve.vuna:722"));
  ("Loader_dResolve.v_resolveCtorDecl", ("Vuna.Compiler.Loader.Resolve.resolveCtorDecl", "Vuna/Compiler/Loader/Resolve.vuna:1162"));
  ("Loader_dResolve.v_resolveCtorDotted", ("Vuna.Compiler.Loader.Resolve.resolveCtorDotted", "Vuna/Compiler/Loader/Resolve.vuna:515"));
  ("Loader_dResolve.v_resolveCtorSpec", ("Vuna.Compiler.Loader.Resolve.resolveCtorSpec", "Vuna/Compiler/Loader/Resolve.vuna:1354"));
  ("Loader_dResolve.v_resolveDecl", ("Vuna.Compiler.Loader.Resolve.resolveDecl", "Vuna/Compiler/Loader/Resolve.vuna:1360"));
  ("Loader_dResolve.v_resolveDeclWithImplicitScopes", ("Vuna.Compiler.Loader.Resolve.resolveDeclWithImplicitScopes", "Vuna/Compiler/Loader/Resolve.vuna:1470"));
  ("Loader_dResolve.v_resolveDo", ("Vuna.Compiler.Loader.Resolve.resolveDo", "Vuna/Compiler/Loader/Resolve.vuna:1069"));
  ("Loader_dResolve.v_resolveDoBind", ("Vuna.Compiler.Loader.Resolve.resolveDoBind", "Vuna/Compiler/Loader/Resolve.vuna:1082"));
  ("Loader_dResolve.v_resolveDoChain", ("Vuna.Compiler.Loader.Resolve.resolveDoChain", "Vuna/Compiler/Loader/Resolve.vuna:1098"));
  ("Loader_dResolve.v_resolveDoLet", ("Vuna.Compiler.Loader.Resolve.resolveDoLet", "Vuna/Compiler/Loader/Resolve.vuna:1127"));
  ("Loader_dResolve.v_resolveDottedExpr", ("Vuna.Compiler.Loader.Resolve.resolveDottedExpr", "Vuna/Compiler/Loader/Resolve.vuna:538"));
  ("Loader_dResolve.v_resolveDottedTypeName", ("Vuna.Compiler.Loader.Resolve.resolveDottedTypeName", "Vuna/Compiler/Loader/Resolve.vuna:1272"));
  ("Loader_dResolve.v_resolveDottedTypeTargetOnly", ("Vuna.Compiler.Loader.Resolve.resolveDottedTypeTargetOnly", "Vuna/Compiler/Loader/Resolve.vuna:413"));
  ("Loader_dResolve.v_resolveEntry", ("Vuna.Compiler.Loader.Resolve.resolveEntry", "Vuna/Compiler/Loader/Resolve.vuna:1479"));
  ("Loader_dResolve.v_resolveExpr", ("Vuna.Compiler.Loader.Resolve.resolveExpr", "Vuna/Compiler/Loader/Resolve.vuna:1003"));
  ("Loader_dResolve.v_resolveExprRaw", ("Vuna.Compiler.Loader.Resolve.resolveExprRaw", "Vuna/Compiler/Loader/Resolve.vuna:1012"));
  ("Loader_dResolve.v_resolveFamilyQualifiedCtor", ("Vuna.Compiler.Loader.Resolve.resolveFamilyQualifiedCtor", "Vuna/Compiler/Loader/Resolve.vuna:429"));
  ("Loader_dResolve.v_resolveFieldValue", ("Vuna.Compiler.Loader.Resolve.resolveFieldValue", "Vuna/Compiler/Loader/Resolve.vuna:1152"));
  ("Loader_dResolve.v_resolveFuelBound", ("Vuna.Compiler.Loader.Resolve.resolveFuelBound", "Vuna/Compiler/Loader/Resolve.vuna:40"));
  ("Loader_dResolve.v_resolveGlobal", ("Vuna.Compiler.Loader.Resolve.resolveGlobal", "Vuna/Compiler/Loader/Resolve.vuna:641"));
  ("Loader_dResolve.v_resolveInstanceMethod", ("Vuna.Compiler.Loader.Resolve.resolveInstanceMethod", "Vuna/Compiler/Loader/Resolve.vuna:1409"));
  ("Loader_dResolve.v_resolveInterpParts", ("Vuna.Compiler.Loader.Resolve.resolveInterpParts", "Vuna/Compiler/Loader/Resolve.vuna:1050"));
  ("Loader_dResolve.v_resolveLet", ("Vuna.Compiler.Loader.Resolve.resolveLet", "Vuna/Compiler/Loader/Resolve.vuna:844"));
  ("Loader_dResolve.v_resolveLetSeq", ("Vuna.Compiler.Loader.Resolve.resolveLetSeq", "Vuna/Compiler/Loader/Resolve.vuna:853"));
  ("Loader_dResolve.v_resolveLocalClause", ("Vuna.Compiler.Loader.Resolve.resolveLocalClause", "Vuna/Compiler/Loader/Resolve.vuna:815"));
  ("Loader_dResolve.v_resolveLocalPats", ("Vuna.Compiler.Loader.Resolve.resolveLocalPats", "Vuna/Compiler/Loader/Resolve.vuna:826"));
  ("Loader_dResolve.v_resolveLowerTypeName", ("Vuna.Compiler.Loader.Resolve.resolveLowerTypeName", "Vuna/Compiler/Loader/Resolve.vuna:1216"));
  ("Loader_dResolve.v_resolveModules", ("Vuna.Compiler.Loader.Resolve.resolveModules", "Vuna/Compiler/Loader/Resolve.vuna:1483"));
  ("Loader_dResolve.v_resolveNonLowerTypeName", ("Vuna.Compiler.Loader.Resolve.resolveNonLowerTypeName", "Vuna/Compiler/Loader/Resolve.vuna:1247"));
  ("Loader_dResolve.v_resolvePathPrefixes", ("Vuna.Compiler.Loader.Resolve.resolvePathPrefixes", "Vuna/Compiler/Loader/Resolve.vuna:228"));
  ("Loader_dResolve.v_resolvePathPrefixesTry", ("Vuna.Compiler.Loader.Resolve.resolvePathPrefixesTry", "Vuna/Compiler/Loader/Resolve.vuna:240"));
  ("Loader_dResolve.v_resolvePattern", ("Vuna.Compiler.Loader.Resolve.resolvePattern", "Vuna/Compiler/Loader/Resolve.vuna:759"));
  ("Loader_dResolve.v_resolveProgram", ("Vuna.Compiler.Loader.Resolve.resolveProgram", "Vuna/Compiler/Loader/Resolve.vuna:1421"));
  ("Loader_dResolve.v_resolveQualified", ("Vuna.Compiler.Loader.Resolve.resolveQualified", "Vuna/Compiler/Loader/Resolve.vuna:331"));
  ("Loader_dResolve.v_resolveQualifiedPath", ("Vuna.Compiler.Loader.Resolve.resolveQualifiedPath", "Vuna/Compiler/Loader/Resolve.vuna:606"));
  ("Loader_dResolve.v_resolveRecLet", ("Vuna.Compiler.Loader.Resolve.resolveRecLet", "Vuna/Compiler/Loader/Resolve.vuna:879"));
  ("Loader_dResolve.v_resolveRecValues", ("Vuna.Compiler.Loader.Resolve.resolveRecValues", "Vuna/Compiler/Loader/Resolve.vuna:907"));
  ("Loader_dResolve.v_resolveRecordField", ("Vuna.Compiler.Loader.Resolve.resolveRecordField", "Vuna/Compiler/Loader/Resolve.vuna:1397"));
  ("Loader_dResolve.v_resolveRecordPatternField", ("Vuna.Compiler.Loader.Resolve.resolveRecordPatternField", "Vuna/Compiler/Loader/Resolve.vuna:773"));
  ("Loader_dResolve.v_resolveTopName", ("Vuna.Compiler.Loader.Resolve.resolveTopName", "Vuna/Compiler/Loader/Resolve.vuna:755"));
  ("Loader_dResolve.v_resolveTraitMethod", ("Vuna.Compiler.Loader.Resolve.resolveTraitMethod", "Vuna/Compiler/Loader/Resolve.vuna:1403"));
  ("Loader_dResolve.v_resolveTypeExpr", ("Vuna.Compiler.Loader.Resolve.resolveTypeExpr", "Vuna/Compiler/Loader/Resolve.vuna:1308"));
  ("Loader_dResolve.v_resolveTypeExprScoped", ("Vuna.Compiler.Loader.Resolve.resolveTypeExprScoped", "Vuna/Compiler/Loader/Resolve.vuna:1322"));
  ("Loader_dResolve.v_resolveTypeExprScopedRaw", ("Vuna.Compiler.Loader.Resolve.resolveTypeExprScopedRaw", "Vuna/Compiler/Loader/Resolve.vuna:1331"));
  ("Loader_dResolve.v_resolveTypeName", ("Vuna.Compiler.Loader.Resolve.resolveTypeName", "Vuna/Compiler/Loader/Resolve.vuna:1193"));
  ("Loader_dResolve.v_resolveTypeTarget", ("Vuna.Compiler.Loader.Resolve.resolveTypeTarget", "Vuna/Compiler/Loader/Resolve.vuna:394"));
  ("Loader_dResolve.v_resolveTypeTopName", ("Vuna.Compiler.Loader.Resolve.resolveTypeTopName", "Vuna/Compiler/Loader/Resolve.vuna:1349"));
  ("Loader_dResolve.v_scopeNamesOf", ("Vuna.Compiler.Loader.Resolve.scopeNamesOf", "Vuna/Compiler/Loader/Resolve.vuna:1466"));
  ("Loader_dResolve.v_startsUpperName", ("Vuna.Compiler.Loader.Resolve.startsUpperName", "Vuna/Compiler/Loader/Resolve.vuna:1174"));
  ("Loader_dResolve.v_takeSegs", ("Vuna.Compiler.Loader.Resolve.takeSegs", "Vuna/Compiler/Loader/Resolve.vuna:567"));
  ("Loader_dResolve.v_templateChunks", ("Vuna.Compiler.Loader.Resolve.templateChunks", "Vuna/Compiler/Loader/Resolve.vuna:934"));
  ("Loader_dResolve.v_traitImportHint", ("Vuna.Compiler.Loader.Resolve.traitImportHint", "Vuna/Compiler/Loader/Resolve.vuna:73"));
  ("Loader_dResolve.v_tyShape", ("Vuna.Compiler.Loader.Resolve.tyShape", "Vuna/Compiler/Loader/Resolve.vuna:1490"));
  ("Loader_dResolve.v_uniqPathResults", ("Vuna.Compiler.Loader.Resolve.uniqPathResults", "Vuna/Compiler/Loader/Resolve.vuna:262"));
  ("Loader_dResolve.v_uniqPathTargets", ("Vuna.Compiler.Loader.Resolve.uniqPathTargets", "Vuna/Compiler/Loader/Resolve.vuna:601"));
  ("Loader_dResolve.v_uniqueCtorTarget", ("Vuna.Compiler.Loader.Resolve.uniqueCtorTarget", "Vuna/Compiler/Loader/Resolve.vuna:450"));
  ("Loader_dResolve.v_valueNamesOf", ("Vuna.Compiler.Loader.Resolve.valueNamesOf", "Vuna/Compiler/Loader/Resolve.vuna:107"));
  ("Loader_dResolve.v_valuePairTargets", ("Vuna.Compiler.Loader.Resolve.valuePairTargets", "Vuna/Compiler/Loader/Resolve.vuna:698"));
  ("Loader_dResolve.v_walkNamespaceCandidates", ("Vuna.Compiler.Loader.Resolve.walkNamespaceCandidates", "Vuna/Compiler/Loader/Resolve.vuna:255"));
  ("Loader_dResolve.v_walkNamespacePaths", ("Vuna.Compiler.Loader.Resolve.walkNamespacePaths", "Vuna/Compiler/Loader/Resolve.vuna:196"));
  ("Loader_dResolve.v_walkNamespacePathsFuel", ("Vuna.Compiler.Loader.Resolve.walkNamespacePathsFuel", "Vuna/Compiler/Loader/Resolve.vuna:199"));
  ("Lowering_dChecks.v_addName", ("Vuna.Compiler.Lowering.Checks.addName", "Vuna/Compiler/Lowering/Checks.vuna:256"));
  ("Lowering_dChecks.v_addRuntimeDep", ("Vuna.Compiler.Lowering.Checks.addRuntimeDep", "Vuna/Compiler/Lowering/Checks.vuna:297"));
  ("Lowering_dChecks.v_axiomNamesOf", ("Vuna.Compiler.Lowering.Checks.axiomNamesOf", "Vuna/Compiler/Lowering/Checks.vuna:70"));
  ("Lowering_dChecks.v_binderAt", ("Vuna.Compiler.Lowering.Checks.binderAt", "Vuna/Compiler/Lowering/Checks.vuna:200"));
  ("Lowering_dChecks.v_checkAllDefScopes", ("Vuna.Compiler.Lowering.Checks.checkAllDefScopes", "Vuna/Compiler/Lowering/Checks.vuna:430"));
  ("Lowering_dChecks.v_checkAllErasure", ("Vuna.Compiler.Lowering.Checks.checkAllErasure", "Vuna/Compiler/Lowering/Checks.vuna:116"));
  ("Lowering_dChecks.v_checkAltErasure", ("Vuna.Compiler.Lowering.Checks.checkAltErasure", "Vuna/Compiler/Lowering/Checks.vuna:488"));
  ("Lowering_dChecks.v_checkAltErasureFuel", ("Vuna.Compiler.Lowering.Checks.checkAltErasureFuel", "Vuna/Compiler/Lowering/Checks.vuna:189"));
  ("Lowering_dChecks.v_checkAltScopes", ("Vuna.Compiler.Lowering.Checks.checkAltScopes", "Vuna/Compiler/Lowering/Checks.vuna:423"));
  ("Lowering_dChecks.v_checkConArgsErasure", ("Vuna.Compiler.Lowering.Checks.checkConArgsErasure", "Vuna/Compiler/Lowering/Checks.vuna:484"));
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
  ("Lowering_dChecks.v_erasureFuelForAlts", ("Vuna.Compiler.Lowering.Checks.erasureFuelForAlts", "Vuna/Compiler/Lowering/Checks.vuna:491"));
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
  ("Lowering_dEntry.v_filterMapErrorRunHost", ("Vuna.Compiler.Lowering.Entry.filterMapErrorRunHost", "Vuna/Compiler/Lowering/Entry.vuna:126"));
  ("Lowering_dEntry.v_filterMapRunHost", ("Vuna.Compiler.Lowering.Entry.filterMapRunHost", "Vuna/Compiler/Lowering/Entry.vuna:117"));
  ("Lowering_dEntry.v_lowerEntryOf", ("Vuna.Compiler.Lowering.Entry.lowerEntryOf", "Vuna/Compiler/Lowering/Entry.vuna:91"));
  ("Lowering_dEntry.v_mainRowTags", ("Vuna.Compiler.Lowering.Entry.mainRowTags", "Vuna/Compiler/Lowering/Entry.vuna:53"));
  ("Lowering_dEntry.v_mainRunNameOf", ("Vuna.Compiler.Lowering.Entry.mainRunNameOf", "Vuna/Compiler/Lowering/Entry.vuna:112"));
  ("Lowering_dEntry.v_mainShowForNameIr", ("Vuna.Compiler.Lowering.Entry.mainShowForNameIr", "Vuna/Compiler/Lowering/Entry.vuna:72"));
  ("Lowering_dEntry.v_mainShowIr", ("Vuna.Compiler.Lowering.Entry.mainShowIr", "Vuna/Compiler/Lowering/Entry.vuna:63"));
  ("Lowering_dEntry.v_mainShowRtIr", ("Vuna.Compiler.Lowering.Entry.mainShowRtIr", "Vuna/Compiler/Lowering/Entry.vuna:78"));
  ("Lowering_dEntry.v_tagOf", ("Vuna.Compiler.Lowering.Entry.tagOf", "Vuna/Compiler/Lowering/Entry.vuna:47"));
  ("Lowering_dEntry.v_unwrapNamedTerm", ("Vuna.Compiler.Lowering.Entry.unwrapNamedTerm", "Vuna/Compiler/Lowering/Entry.vuna:33"));
  ("Lowering_dEnv.v_anyDefFlag", ("Vuna.Compiler.Lowering.Env.anyDefFlag", "Vuna/Compiler/Lowering/Env.vuna:418"));
  ("Lowering_dEnv.v_collectFamilyArgs", ("Vuna.Compiler.Lowering.Env.collectFamilyArgs", "Vuna/Compiler/Lowering/Env.vuna:285"));
  ("Lowering_dEnv.v_collectFamilyArgsFuel", ("Vuna.Compiler.Lowering.Env.collectFamilyArgsFuel", "Vuna/Compiler/Lowering/Env.vuna:289"));
  ("Lowering_dEnv.v_collectUsedLevels", ("Vuna.Compiler.Lowering.Env.collectUsedLevels", "Vuna/Compiler/Lowering/Env.vuna:256"));
  ("Lowering_dEnv.v_collectUsedLevelsFuel", ("Vuna.Compiler.Lowering.Env.collectUsedLevelsFuel", "Vuna/Compiler/Lowering/Env.vuna:259"));
  ("Lowering_dEnv.v_collectUsedSpineFuel", ("Vuna.Compiler.Lowering.Env.collectUsedSpineFuel", "Vuna/Compiler/Lowering/Env.vuna:275"));
  ("Lowering_dEnv.v_ctorOpaqueFlagsOf", ("Vuna.Compiler.Lowering.Env.ctorOpaqueFlagsOf", "Vuna/Compiler/Lowering/Env.vuna:181"));
  ("Lowering_dEnv.v_ctorOpaqueGo", ("Vuna.Compiler.Lowering.Env.ctorOpaqueGo", "Vuna/Compiler/Lowering/Env.vuna:184"));
  ("Lowering_dEnv.v_ctorOpaqueTableOf", ("Vuna.Compiler.Lowering.Env.ctorOpaqueTableOf", "Vuna/Compiler/Lowering/Env.vuna:460"));
  ("Lowering_dEnv.v_ctorTableOf", ("Vuna.Compiler.Lowering.Env.ctorTableOf", "Vuna/Compiler/Lowering/Env.vuna:454"));
  ("Lowering_dEnv.v_ctorUsedLevels", ("Vuna.Compiler.Lowering.Env.ctorUsedLevels", "Vuna/Compiler/Lowering/Env.vuna:301"));
  ("Lowering_dEnv.v_dataTblOf", ("Vuna.Compiler.Lowering.Env.dataTblOf", "Vuna/Compiler/Lowering/Env.vuna:556"));
  ("Lowering_dEnv.v_dataUsedLevels", ("Vuna.Compiler.Lowering.Env.dataUsedLevels", "Vuna/Compiler/Lowering/Env.vuna:328"));
  ("Lowering_dEnv.v_defFactsOf", ("Vuna.Compiler.Lowering.Env.defFactsOf", "Vuna/Compiler/Lowering/Env.vuna:527"));
  ("Lowering_dEnv.v_defFactsTblOf", ("Vuna.Compiler.Lowering.Env.defFactsTblOf", "Vuna/Compiler/Lowering/Env.vuna:519"));
  ("Lowering_dEnv.v_defTblOf", ("Vuna.Compiler.Lowering.Env.defTblOf", "Vuna/Compiler/Lowering/Env.vuna:547"));
  ("Lowering_dEnv.v_eraseDefs", ("Vuna.Compiler.Lowering.Env.eraseDefs", "Vuna/Compiler/Lowering/Env.vuna:473"));
  ("Lowering_dEnv.v_eraseDefsGo", ("Vuna.Compiler.Lowering.Env.eraseDefsGo", "Vuna/Compiler/Lowering/Env.vuna:480"));
  ("Lowering_dEnv.v_factsDepsOf", ("Vuna.Compiler.Lowering.Env.factsDepsOf", "Vuna/Compiler/Lowering/Env.vuna:388"));
  ("Lowering_dEnv.v_factsOf", ("Vuna.Compiler.Lowering.Env.factsOf", "Vuna/Compiler/Lowering/Env.vuna:392"));
  ("Lowering_dEnv.v_findFamilyCtor", ("Vuna.Compiler.Lowering.Env.findFamilyCtor", "Vuna/Compiler/Lowering/Env.vuna:441"));
  ("Lowering_dEnv.v_findListFamilyData", ("Vuna.Compiler.Lowering.Env.findListFamilyData", "Vuna/Compiler/Lowering/Env.vuna:449"));
  ("Lowering_dEnv.v_floatRenderRefName", ("Vuna.Compiler.Lowering.Env.floatRenderRefName", "Vuna/Compiler/Lowering/Env.vuna:384"));
  ("Lowering_dEnv.v_hasDataNamed", ("Vuna.Compiler.Lowering.Env.hasDataNamed", "Vuna/Compiler/Lowering/Env.vuna:560"));
  ("Lowering_dEnv.v_hasRecordRepr", ("Vuna.Compiler.Lowering.Env.hasRecordRepr", "Vuna/Compiler/Lowering/Env.vuna:166"));
  ("Lowering_dEnv.v_intrinsicUseFlagsTbl", ("Vuna.Compiler.Lowering.Env.intrinsicUseFlagsTbl", "Vuna/Compiler/Lowering/Env.vuna:534"));
  ("Lowering_dEnv.v_isRecordData", ("Vuna.Compiler.Lowering.Env.isRecordData", "Vuna/Compiler/Lowering/Env.vuna:137"));
  ("Lowering_dEnv.v_isTypeHeadOpaqueDatas", ("Vuna.Compiler.Lowering.Env.isTypeHeadOpaqueDatas", "Vuna/Compiler/Lowering/Env.vuna:116"));
  ("Lowering_dEnv.v_levelListEq", ("Vuna.Compiler.Lowering.Env.levelListEq", "Vuna/Compiler/Lowering/Env.vuna:337"));
  ("Lowering_dEnv.v_levelSlotGoIn", ("Vuna.Compiler.Lowering.Env.levelSlotGoIn", "Vuna/Compiler/Lowering/Env.vuna:237"));
  ("Lowering_dEnv.v_levelSlotIn", ("Vuna.Compiler.Lowering.Env.levelSlotIn", "Vuna/Compiler/Lowering/Env.vuna:234"));
  ("Lowering_dEnv.v_listFamOf", ("Vuna.Compiler.Lowering.Env.listFamOf", "Vuna/Compiler/Lowering/Env.vuna:429"));
  ("Lowering_dEnv.v_listLength", ("Vuna.Compiler.Lowering.Env.listLength", "Vuna/Compiler/Lowering/Env.vuna:98"));
  ("Lowering_dEnv.v_locRowPair", ("Vuna.Compiler.Lowering.Env.locRowPair", "Vuna/Compiler/Lowering/Env.vuna:206"));
  ("Lowering_dEnv.v_lookupFacts", ("Vuna.Compiler.Lowering.Env.lookupFacts", "Vuna/Compiler/Lowering/Env.vuna:423"));
  ("Lowering_dEnv.v_lookupTyParamsIn", ("Vuna.Compiler.Lowering.Env.lookupTyParamsIn", "Vuna/Compiler/Lowering/Env.vuna:250"));
  ("Lowering_dEnv.v_lookupUsedIn", ("Vuna.Compiler.Lowering.Env.lookupUsedIn", "Vuna/Compiler/Lowering/Env.vuna:245"));
  ("Lowering_dEnv.v_lowerSharedOf", ("Vuna.Compiler.Lowering.Env.lowerSharedOf", "Vuna/Compiler/Lowering/Env.vuna:398"));
  ("Lowering_dEnv.v_lwEnvShared", ("Vuna.Compiler.Lowering.Env.lwEnvShared", "Vuna/Compiler/Lowering/Env.vuna:72"));
  ("Lowering_dEnv.v_lwEnvWithUnit", ("Vuna.Compiler.Lowering.Env.lwEnvWithUnit", "Vuna/Compiler/Lowering/Env.vuna:76"));
  ("Lowering_dEnv.v_mapSome", ("Vuna.Compiler.Lowering.Env.mapSome", "Vuna/Compiler/Lowering/Env.vuna:107"));
  ("Lowering_dEnv.v_memIntIn", ("Vuna.Compiler.Lowering.Env.memIntIn", "Vuna/Compiler/Lowering/Env.vuna:230"));
  ("Lowering_dEnv.v_memOpaqueLevel", ("Vuna.Compiler.Lowering.Env.memOpaqueLevel", "Vuna/Compiler/Lowering/Env.vuna:125"));
  ("Lowering_dEnv.v_mkLwEnv", ("Vuna.Compiler.Lowering.Env.mkLwEnv", "Vuna/Compiler/Lowering/Env.vuna:465"));
  ("Lowering_dEnv.v_mkLwEnvFromErased", ("Vuna.Compiler.Lowering.Env.mkLwEnvFromErased", "Vuna/Compiler/Lowering/Env.vuna:494"));
  ("Lowering_dEnv.v_nameSetOf", ("Vuna.Compiler.Lowering.Env.nameSetOf", "Vuna/Compiler/Lowering/Env.vuna:564"));
  ("Lowering_dEnv.v_nthValueIn", ("Vuna.Compiler.Lowering.Env.nthValueIn", "Vuna/Compiler/Lowering/Env.vuna:241"));
  ("Lowering_dEnv.v_pushDep", ("Vuna.Compiler.Lowering.Env.pushDep", "Vuna/Compiler/Lowering/Env.vuna:103"));
  ("Lowering_dEnv.v_recordFieldsOf", ("Vuna.Compiler.Lowering.Env.recordFieldsOf", "Vuna/Compiler/Lowering/Env.vuna:376"));
  ("Lowering_dEnv.v_recordRtFields", ("Vuna.Compiler.Lowering.Env.recordRtFields", "Vuna/Compiler/Lowering/Env.vuna:147"));
  ("Lowering_dEnv.v_recordRtFieldsGo", ("Vuna.Compiler.Lowering.Env.recordRtFieldsGo", "Vuna/Compiler/Lowering/Env.vuna:156"));
  ("Lowering_dEnv.v_rtDatasOf", ("Vuna.Compiler.Lowering.Env.rtDatasOf", "Vuna/Compiler/Lowering/Env.vuna:176"));
  ("Lowering_dEnv.v_sameLevelTable", ("Vuna.Compiler.Lowering.Env.sameLevelTable", "Vuna/Compiler/Lowering/Env.vuna:342"));
  ("Lowering_dEnv.v_strTblOf", ("Vuna.Compiler.Lowering.Env.strTblOf", "Vuna/Compiler/Lowering/Env.vuna:552"));
  ("Lowering_dEnv.v_tyParamsOf", ("Vuna.Compiler.Lowering.Env.tyParamsOf", "Vuna/Compiler/Lowering/Env.vuna:373"));
  ("Lowering_dEnv.v_typeParamLevels", ("Vuna.Compiler.Lowering.Env.typeParamLevels", "Vuna/Compiler/Lowering/Env.vuna:219"));
  ("Lowering_dEnv.v_typeParamLevelsGo", ("Vuna.Compiler.Lowering.Env.typeParamLevelsGo", "Vuna/Compiler/Lowering/Env.vuna:222"));
  ("Lowering_dEnv.v_unboxedRowOf", ("Vuna.Compiler.Lowering.Env.unboxedRowOf", "Vuna/Compiler/Lowering/Env.vuna:414"));
  ("Lowering_dEnv.v_useFlagsOfName", ("Vuna.Compiler.Lowering.Env.useFlagsOfName", "Vuna/Compiler/Lowering/Env.vuna:540"));
  ("Lowering_dEnv.v_usedFixRounds", ("Vuna.Compiler.Lowering.Env.usedFixRounds", "Vuna/Compiler/Lowering/Env.vuna:353"));
  ("Lowering_dEnv.v_usedSlotCount", ("Vuna.Compiler.Lowering.Env.usedSlotCount", "Vuna/Compiler/Lowering/Env.vuna:356"));
  ("Lowering_dEnv.v_usedTableFix", ("Vuna.Compiler.Lowering.Env.usedTableFix", "Vuna/Compiler/Lowering/Env.vuna:360"));
  ("Lowering_dEnv.v_usedTableFixFuel", ("Vuna.Compiler.Lowering.Env.usedTableFixFuel", "Vuna/Compiler/Lowering/Env.vuna:363"));
  ("Lowering_dErased.v_binderKept", ("Vuna.Compiler.Lowering.Erased.binderKept", "Vuna/Compiler/Lowering/Erased.vuna:44"));
  ("Lowering_dErased.v_countKept", ("Vuna.Compiler.Lowering.Erased.countKept", "Vuna/Compiler/Lowering/Erased.vuna:40"));
  ("Lowering_dErased.v_eraseAlts", ("Vuna.Compiler.Lowering.Erased.eraseAlts", "Vuna/Compiler/Lowering/Erased.vuna:112"));
  ("Lowering_dErased.v_eraseArgs", ("Vuna.Compiler.Lowering.Erased.eraseArgs", "Vuna/Compiler/Lowering/Erased.vuna:128"));
  ("Lowering_dErased.v_eraseCtorArgs", ("Vuna.Compiler.Lowering.Erased.eraseCtorArgs", "Vuna/Compiler/Lowering/Erased.vuna:121"));
  ("Lowering_dErased.v_eraseTerm", ("Vuna.Compiler.Lowering.Erased.eraseTerm", "Vuna/Compiler/Lowering/Erased.vuna:51"));
  ("Lowering_dErased.v_eraseTermIn", ("Vuna.Compiler.Lowering.Erased.eraseTermIn", "Vuna/Compiler/Lowering/Erased.vuna:57"));
  ("Lowering_dErased.v_runtimeIndexAt", ("Vuna.Compiler.Lowering.Erased.runtimeIndexAt", "Vuna/Compiler/Lowering/Erased.vuna:29"));
  ("Lowering_dErased.v_runtimeIndexGo", ("Vuna.Compiler.Lowering.Erased.runtimeIndexGo", "Vuna/Compiler/Lowering/Erased.vuna:32"));
  ("Lowering_dErased.v_validateErased", ("Vuna.Compiler.Lowering.Erased.validateErased", "Vuna/Compiler/Lowering/Erased.vuna:144"));
  ("Lowering_dErased.v_validateErasedAlts", ("Vuna.Compiler.Lowering.Erased.validateErasedAlts", "Vuna/Compiler/Lowering/Erased.vuna:193"));
  ("Lowering_dErased.v_validateErasedArgs", ("Vuna.Compiler.Lowering.Erased.validateErasedArgs", "Vuna/Compiler/Lowering/Erased.vuna:183"));
  ("Lowering_dErased.v_validateErasedIn", ("Vuna.Compiler.Lowering.Erased.validateErasedIn", "Vuna/Compiler/Lowering/Erased.vuna:147"));
  ("Lowering_dProgram.v_adjOfDef", ("Vuna.Compiler.Lowering.Program.adjOfDef", "Vuna/Compiler/Lowering/Program.vuna:1512"));
  ("Lowering_dProgram.v_aeEnvOf", ("Vuna.Compiler.Lowering.Program.aeEnvOf", "Vuna/Compiler/Lowering/Program.vuna:692"));
  ("Lowering_dProgram.v_aePatsOf", ("Vuna.Compiler.Lowering.Program.aePatsOf", "Vuna/Compiler/Lowering/Program.vuna:695"));
  ("Lowering_dProgram.v_aeStOf", ("Vuna.Compiler.Lowering.Program.aeStOf", "Vuna/Compiler/Lowering/Program.vuna:698"));
  ("Lowering_dProgram.v_alignCtorArgs", ("Vuna.Compiler.Lowering.Program.alignCtorArgs", "Vuna/Compiler/Lowering/Program.vuna:551"));
  ("Lowering_dProgram.v_allCatchAll", ("Vuna.Compiler.Lowering.Program.allCatchAll", "Vuna/Compiler/Lowering/Program.vuna:823"));
  ("Lowering_dProgram.v_allRuntimeArgs", ("Vuna.Compiler.Lowering.Program.allRuntimeArgs", "Vuna/Compiler/Lowering/Program.vuna:538"));
  ("Lowering_dProgram.v_altEnvCheckedIn", ("Vuna.Compiler.Lowering.Program.altEnvCheckedIn", "Vuna/Compiler/Lowering/Program.vuna:722"));
  ("Lowering_dProgram.v_altEnvFullIn", ("Vuna.Compiler.Lowering.Program.altEnvFullIn", "Vuna/Compiler/Lowering/Program.vuna:732"));
  ("Lowering_dProgram.v_altEnvGo", ("Vuna.Compiler.Lowering.Program.altEnvGo", "Vuna/Compiler/Lowering/Program.vuna:705"));
  ("Lowering_dProgram.v_altEnvIn", ("Vuna.Compiler.Lowering.Program.altEnvIn", "Vuna/Compiler/Lowering/Program.vuna:717"));
  ("Lowering_dProgram.v_altEnvKeptIn", ("Vuna.Compiler.Lowering.Program.altEnvKeptIn", "Vuna/Compiler/Lowering/Program.vuna:753"));
  ("Lowering_dProgram.v_appTyFrom", ("Vuna.Compiler.Lowering.Program.appTyFrom", "Vuna/Compiler/Lowering/Program.vuna:441"));
  ("Lowering_dProgram.v_appTyOf", ("Vuna.Compiler.Lowering.Program.appTyOf", "Vuna/Compiler/Lowering/Program.vuna:424"));
  ("Lowering_dProgram.v_appTyOfIr", ("Vuna.Compiler.Lowering.Program.appTyOfIr", "Vuna/Compiler/Lowering/Program.vuna:431"));
  ("Lowering_dProgram.v_appendGroups", ("Vuna.Compiler.Lowering.Program.appendGroups", "Vuna/Compiler/Lowering/Program.vuna:1361"));
  ("Lowering_dProgram.v_armResultTyOf", ("Vuna.Compiler.Lowering.Program.armResultTyOf", "Vuna/Compiler/Lowering/Program.vuna:876"));
  ("Lowering_dProgram.v_armTyTblOf", ("Vuna.Compiler.Lowering.Program.armTyTblOf", "Vuna/Compiler/Lowering/Program.vuna:783"));
  ("Lowering_dProgram.v_binderAtIn", ("Vuna.Compiler.Lowering.Program.binderAtIn", "Vuna/Compiler/Lowering/Program.vuna:154"));
  ("Lowering_dProgram.v_binderErasedOf", ("Vuna.Compiler.Lowering.Program.binderErasedOf", "Vuna/Compiler/Lowering/Program.vuna:57"));
  ("Lowering_dProgram.v_binderOfParam", ("Vuna.Compiler.Lowering.Program.binderOfParam", "Vuna/Compiler/Lowering/Program.vuna:343"));
  ("Lowering_dProgram.v_binderWithTy", ("Vuna.Compiler.Lowering.Program.binderWithTy", "Vuna/Compiler/Lowering/Program.vuna:766"));
  ("Lowering_dProgram.v_bindersOfParamsHint", ("Vuna.Compiler.Lowering.Program.bindersOfParamsHint", "Vuna/Compiler/Lowering/Program.vuna:355"));
  ("Lowering_dProgram.v_checkNoDupOcamlNames", ("Vuna.Compiler.Lowering.Program.checkNoDupOcamlNames", "Vuna/Compiler/Lowering/Program.vuna:1271"));
  ("Lowering_dProgram.v_checkNoDupOcamlNamesGo", ("Vuna.Compiler.Lowering.Program.checkNoDupOcamlNamesGo", "Vuna/Compiler/Lowering/Program.vuna:1274"));
  ("Lowering_dProgram.v_checkProgramOf", ("Vuna.Compiler.Lowering.Program.checkProgramOf", "Vuna/Compiler/Lowering/Program.vuna:1395"));
  ("Lowering_dProgram.v_checkRuntimeContract", ("Vuna.Compiler.Lowering.Program.checkRuntimeContract", "Vuna/Compiler/Lowering/Program.vuna:1431"));
  ("Lowering_dProgram.v_collectLamChainIn", ("Vuna.Compiler.Lowering.Program.collectLamChainIn", "Vuna/Compiler/Lowering/Program.vuna:234"));
  ("Lowering_dProgram.v_concatLeavesGo", ("Vuna.Compiler.Lowering.Program.concatLeavesGo", "Vuna/Compiler/Lowering/Program.vuna:513"));
  ("Lowering_dProgram.v_concatLeavesIn", ("Vuna.Compiler.Lowering.Program.concatLeavesIn", "Vuna/Compiler/Lowering/Program.vuna:510"));
  ("Lowering_dProgram.v_countKept", ("Vuna.Compiler.Lowering.Program.countKept", "Vuna/Compiler/Lowering/Program.vuna:701"));
  ("Lowering_dProgram.v_countRuntimeParams", ("Vuna.Compiler.Lowering.Program.countRuntimeParams", "Vuna/Compiler/Lowering/Program.vuna:312"));
  ("Lowering_dProgram.v_ctorArgIr", ("Vuna.Compiler.Lowering.Program.ctorArgIr", "Vuna/Compiler/Lowering/Program.vuna:593"));
  ("Lowering_dProgram.v_ctorOpaqueKeptFlags", ("Vuna.Compiler.Lowering.Program.ctorOpaqueKeptFlags", "Vuna/Compiler/Lowering/Program.vuna:598"));
  ("Lowering_dProgram.v_effResultTyOf", ("Vuna.Compiler.Lowering.Program.effResultTyOf", "Vuna/Compiler/Lowering/Program.vuna:330"));
  ("Lowering_dProgram.v_effUnitTyIn", ("Vuna.Compiler.Lowering.Program.effUnitTyIn", "Vuna/Compiler/Lowering/Program.vuna:218"));
  ("Lowering_dProgram.v_ensureUniqueOcamlNamesIn", ("Vuna.Compiler.Lowering.Program.ensureUniqueOcamlNamesIn", "Vuna/Compiler/Lowering/Program.vuna:1284"));
  ("Lowering_dProgram.v_eraseTele", ("Vuna.Compiler.Lowering.Program.eraseTele", "Vuna/Compiler/Lowering/Program.vuna:1102"));
  ("Lowering_dProgram.v_externBasicIr", ("Vuna.Compiler.Lowering.Program.externBasicIr", "Vuna/Compiler/Lowering/Program.vuna:1238"));
  ("Lowering_dProgram.v_externDomIr", ("Vuna.Compiler.Lowering.Program.externDomIr", "Vuna/Compiler/Lowering/Program.vuna:1232"));
  ("Lowering_dProgram.v_externTyIr", ("Vuna.Compiler.Lowering.Program.externTyIr", "Vuna/Compiler/Lowering/Program.vuna:1220"));
  ("Lowering_dProgram.v_findAltBy", ("Vuna.Compiler.Lowering.Program.findAltBy", "Vuna/Compiler/Lowering/Program.vuna:971"));
  ("Lowering_dProgram.v_findCatchAllAlt", ("Vuna.Compiler.Lowering.Program.findCatchAllAlt", "Vuna/Compiler/Lowering/Program.vuna:975"));
  ("Lowering_dProgram.v_firstOfList", ("Vuna.Compiler.Lowering.Program.firstOfList", "Vuna/Compiler/Lowering/Program.vuna:1458"));
  ("Lowering_dProgram.v_flattenConcatChainIn", ("Vuna.Compiler.Lowering.Program.flattenConcatChainIn", "Vuna/Compiler/Lowering/Program.vuna:500"));
  ("Lowering_dProgram.v_flattenIntrinsicAppIn", ("Vuna.Compiler.Lowering.Program.flattenIntrinsicAppIn", "Vuna/Compiler/Lowering/Program.vuna:527"));
  ("Lowering_dProgram.v_groupDefs", ("Vuna.Compiler.Lowering.Program.groupDefs", "Vuna/Compiler/Lowering/Program.vuna:1324"));
  ("Lowering_dProgram.v_groupOfPair", ("Vuna.Compiler.Lowering.Program.groupOfPair", "Vuna/Compiler/Lowering/Program.vuna:1515"));
  ("Lowering_dProgram.v_hasFallbackAlt", ("Vuna.Compiler.Lowering.Program.hasFallbackAlt", "Vuna/Compiler/Lowering/Program.vuna:819"));
  ("Lowering_dProgram.v_headGlobalOf", ("Vuna.Compiler.Lowering.Program.headGlobalOf", "Vuna/Compiler/Lowering/Program.vuna:336"));
  ("Lowering_dProgram.v_initGuardOf", ("Vuna.Compiler.Lowering.Program.initGuardOf", "Vuna/Compiler/Lowering/Program.vuna:1185"));
  ("Lowering_dProgram.v_inlineArityMatchesIn", ("Vuna.Compiler.Lowering.Program.inlineArityMatchesIn", "Vuna/Compiler/Lowering/Program.vuna:542"));
  ("Lowering_dProgram.v_intrinsicWithUnboundIvar", ("Vuna.Compiler.Lowering.Program.intrinsicWithUnboundIvar", "Vuna/Compiler/Lowering/Program.vuna:1424"));
  ("Lowering_dProgram.v_isNatCtorName", ("Vuna.Compiler.Lowering.Program.isNatCtorName", "Vuna/Compiler/Lowering/Program.vuna:950"));
  ("Lowering_dProgram.v_ivarBound", ("Vuna.Compiler.Lowering.Program.ivarBound", "Vuna/Compiler/Lowering/Program.vuna:1403"));
  ("Lowering_dProgram.v_justAppTy", ("Vuna.Compiler.Lowering.Program.justAppTy", "Vuna/Compiler/Lowering/Program.vuna:437"));
  ("Lowering_dProgram.v_justTy", ("Vuna.Compiler.Lowering.Program.justTy", "Vuna/Compiler/Lowering/Program.vuna:150"));
  ("Lowering_dProgram.v_lookupArmTy", ("Vuna.Compiler.Lowering.Program.lookupArmTy", "Vuna/Compiler/Lowering/Program.vuna:804"));
  ("Lowering_dProgram.v_lookupRtLabelIn", ("Vuna.Compiler.Lowering.Program.lookupRtLabelIn", "Vuna/Compiler/Lowering/Program.vuna:1074"));
  ("Lowering_dProgram.v_lookupRtPosIn", ("Vuna.Compiler.Lowering.Program.lookupRtPosIn", "Vuna/Compiler/Lowering/Program.vuna:1078"));
  ("Lowering_dProgram.v_lookupRtPositionsIn", ("Vuna.Compiler.Lowering.Program.lookupRtPositionsIn", "Vuna/Compiler/Lowering/Program.vuna:1082"));
  ("Lowering_dProgram.v_lowerAppFallbackFuel", ("Vuna.Compiler.Lowering.Program.lowerAppFallbackFuel", "Vuna/Compiler/Lowering/Program.vuna:447"));
  ("Lowering_dProgram.v_lowerAppFuel", ("Vuna.Compiler.Lowering.Program.lowerAppFuel", "Vuna/Compiler/Lowering/Program.vuna:382"));
  ("Lowering_dProgram.v_lowerArmBodyFuel", ("Vuna.Compiler.Lowering.Program.lowerArmBodyFuel", "Vuna/Compiler/Lowering/Program.vuna:816"));
  ("Lowering_dProgram.v_lowerArmFuel", ("Vuna.Compiler.Lowering.Program.lowerArmFuel", "Vuna/Compiler/Lowering/Program.vuna:889"));
  ("Lowering_dProgram.v_lowerArmsFuel", ("Vuna.Compiler.Lowering.Program.lowerArmsFuel", "Vuna/Compiler/Lowering/Program.vuna:923"));
  ("Lowering_dProgram.v_lowerBridgeGuard", ("Vuna.Compiler.Lowering.Program.lowerBridgeGuard", "Vuna/Compiler/Lowering/Program.vuna:211"));
  ("Lowering_dProgram.v_lowerBudgetFor", ("Vuna.Compiler.Lowering.Program.lowerBudgetFor", "Vuna/Compiler/Lowering/Program.vuna:74"));
  ("Lowering_dProgram.v_lowerCaseFuel", ("Vuna.Compiler.Lowering.Program.lowerCaseFuel", "Vuna/Compiler/Lowering/Program.vuna:1031"));
  ("Lowering_dProgram.v_lowerConAppFinish", ("Vuna.Compiler.Lowering.Program.lowerConAppFinish", "Vuna/Compiler/Lowering/Program.vuna:657"));
  ("Lowering_dProgram.v_lowerConAppFuel", ("Vuna.Compiler.Lowering.Program.lowerConAppFuel", "Vuna/Compiler/Lowering/Program.vuna:604"));
  ("Lowering_dProgram.v_lowerConAppNonChainFuel", ("Vuna.Compiler.Lowering.Program.lowerConAppNonChainFuel", "Vuna/Compiler/Lowering/Program.vuna:613"));
  ("Lowering_dProgram.v_lowerConArgsFuel", ("Vuna.Compiler.Lowering.Program.lowerConArgsFuel", "Vuna/Compiler/Lowering/Program.vuna:573"));
  ("Lowering_dProgram.v_lowerDef", ("Vuna.Compiler.Lowering.Program.lowerDef", "Vuna/Compiler/Lowering/Program.vuna:1194"));
  ("Lowering_dProgram.v_lowerDefBodyTerm", ("Vuna.Compiler.Lowering.Program.lowerDefBodyTerm", "Vuna/Compiler/Lowering/Program.vuna:288"));
  ("Lowering_dProgram.v_lowerDefs", ("Vuna.Compiler.Lowering.Program.lowerDefs", "Vuna/Compiler/Lowering/Program.vuna:1249"));
  ("Lowering_dProgram.v_lowerExternTy", ("Vuna.Compiler.Lowering.Program.lowerExternTy", "Vuna/Compiler/Lowering/Program.vuna:1217"));
  ("Lowering_dProgram.v_lowerGlobalRef", ("Vuna.Compiler.Lowering.Program.lowerGlobalRef", "Vuna/Compiler/Lowering/Program.vuna:192"));
  ("Lowering_dProgram.v_lowerInlineArgsFuel", ("Vuna.Compiler.Lowering.Program.lowerInlineArgsFuel", "Vuna/Compiler/Lowering/Program.vuna:463"));
  ("Lowering_dProgram.v_lowerLamChainFuel", ("Vuna.Compiler.Lowering.Program.lowerLamChainFuel", "Vuna/Compiler/Lowering/Program.vuna:255"));
  ("Lowering_dProgram.v_lowerLamFuel", ("Vuna.Compiler.Lowering.Program.lowerLamFuel", "Vuna/Compiler/Lowering/Program.vuna:245"));
  ("Lowering_dProgram.v_lowerNatAltFuel", ("Vuna.Compiler.Lowering.Program.lowerNatAltFuel", "Vuna/Compiler/Lowering/Program.vuna:980"));
  ("Lowering_dProgram.v_lowerNatCaseFuel", ("Vuna.Compiler.Lowering.Program.lowerNatCaseFuel", "Vuna/Compiler/Lowering/Program.vuna:996"));
  ("Lowering_dProgram.v_lowerPlainAppFuel", ("Vuna.Compiler.Lowering.Program.lowerPlainAppFuel", "Vuna/Compiler/Lowering/Program.vuna:404"));
  ("Lowering_dProgram.v_lowerProgramCheckedOf", ("Vuna.Compiler.Lowering.Program.lowerProgramCheckedOf", "Vuna/Compiler/Lowering/Program.vuna:1530"));
  ("Lowering_dProgram.v_lowerProgramOf", ("Vuna.Compiler.Lowering.Program.lowerProgramOf", "Vuna/Compiler/Lowering/Program.vuna:1523"));
  ("Lowering_dProgram.v_lowerProjAsCaseFuel", ("Vuna.Compiler.Lowering.Program.lowerProjAsCaseFuel", "Vuna/Compiler/Lowering/Program.vuna:1052"));
  ("Lowering_dProgram.v_lowerRecordUpdateArgsFuel", ("Vuna.Compiler.Lowering.Program.lowerRecordUpdateArgsFuel", "Vuna/Compiler/Lowering/Program.vuna:1122"));
  ("Lowering_dProgram.v_lowerRecordUpdateFuel", ("Vuna.Compiler.Lowering.Program.lowerRecordUpdateFuel", "Vuna/Compiler/Lowering/Program.vuna:1105"));
  ("Lowering_dProgram.v_lowerTerm", ("Vuna.Compiler.Lowering.Program.lowerTerm", "Vuna/Compiler/Lowering/Program.vuna:77"));
  ("Lowering_dProgram.v_lowerTermFuel", ("Vuna.Compiler.Lowering.Program.lowerTermFuel", "Vuna/Compiler/Lowering/Program.vuna:80"));
  ("Lowering_dProgram.v_lowerTermsFuel", ("Vuna.Compiler.Lowering.Program.lowerTermsFuel", "Vuna/Compiler/Lowering/Program.vuna:482"));
  ("Lowering_dProgram.v_lowerUnboxedCaseAlt", ("Vuna.Compiler.Lowering.Program.lowerUnboxedCaseAlt", "Vuna/Compiler/Lowering/Program.vuna:828"));
  ("Lowering_dProgram.v_lowerUnboxedCaseFuel", ("Vuna.Compiler.Lowering.Program.lowerUnboxedCaseFuel", "Vuna/Compiler/Lowering/Program.vuna:842"));
  ("Lowering_dProgram.v_lowerUnitAfterChecks", ("Vuna.Compiler.Lowering.Program.lowerUnitAfterChecks", "Vuna/Compiler/Lowering/Program.vuna:1485"));
  ("Lowering_dProgram.v_lowerUnitCheckedFrom", ("Vuna.Compiler.Lowering.Program.lowerUnitCheckedFrom", "Vuna/Compiler/Lowering/Program.vuna:1473"));
  ("Lowering_dProgram.v_lowerUnitOf", ("Vuna.Compiler.Lowering.Program.lowerUnitOf", "Vuna/Compiler/Lowering/Program.vuna:1465"));
  ("Lowering_dProgram.v_lowerUnitPrepared", ("Vuna.Compiler.Lowering.Program.lowerUnitPrepared", "Vuna/Compiler/Lowering/Program.vuna:1496"));
  ("Lowering_dProgram.v_lowerUpdFieldsFuel", ("Vuna.Compiler.Lowering.Program.lowerUpdFieldsFuel", "Vuna/Compiler/Lowering/Program.vuna:1145"));
  ("Lowering_dProgram.v_mapMaybeDef", ("Vuna.Compiler.Lowering.Program.mapMaybeDef", "Vuna/Compiler/Lowering/Program.vuna:1384"));
  ("Lowering_dProgram.v_nameKey", ("Vuna.Compiler.Lowering.Program.nameKey", "Vuna/Compiler/Lowering/Program.vuna:1268"));
  ("Lowering_dProgram.v_natCaseAllCtors", ("Vuna.Compiler.Lowering.Program.natCaseAllCtors", "Vuna/Compiler/Lowering/Program.vuna:957"));
  ("Lowering_dProgram.v_natCaseApplies", ("Vuna.Compiler.Lowering.Program.natCaseApplies", "Vuna/Compiler/Lowering/Program.vuna:953"));
  ("Lowering_dProgram.v_natCaseHasCtor", ("Vuna.Compiler.Lowering.Program.natCaseHasCtor", "Vuna/Compiler/Lowering/Program.vuna:964"));
  ("Lowering_dProgram.v_nthOpqArgIn", ("Vuna.Compiler.Lowering.Program.nthOpqArgIn", "Vuna/Compiler/Lowering/Program.vuna:1091"));
  ("Lowering_dProgram.v_partitionRuntimeDefs", ("Vuna.Compiler.Lowering.Program.partitionRuntimeDefs", "Vuna/Compiler/Lowering/Program.vuna:1538"));
  ("Lowering_dProgram.v_prepareProgram", ("Vuna.Compiler.Lowering.Program.prepareProgram", "Vuna/Compiler/Lowering/Program.vuna:1301"));
  ("Lowering_dProgram.v_projBindersIn", ("Vuna.Compiler.Lowering.Program.projBindersIn", "Vuna/Compiler/Lowering/Program.vuna:1067"));
  ("Lowering_dProgram.v_recOkOfTbl", ("Vuna.Compiler.Lowering.Program.recOkOfTbl", "Vuna/Compiler/Lowering/Program.vuna:1346"));
  ("Lowering_dProgram.v_recordAltBindersIn", ("Vuna.Compiler.Lowering.Program.recordAltBindersIn", "Vuna/Compiler/Lowering/Program.vuna:1099"));
  ("Lowering_dProgram.v_recordFieldNameAt", ("Vuna.Compiler.Lowering.Program.recordFieldNameAt", "Vuna/Compiler/Lowering/Program.vuna:180"));
  ("Lowering_dProgram.v_recordProjVarIn", ("Vuna.Compiler.Lowering.Program.recordProjVarIn", "Vuna/Compiler/Lowering/Program.vuna:1064"));
  ("Lowering_dProgram.v_recordTermAsAppIn", ("Vuna.Compiler.Lowering.Program.recordTermAsAppIn", "Vuna/Compiler/Lowering/Program.vuna:185"));
  ("Lowering_dProgram.v_recursiveValueAllowedIn", ("Vuna.Compiler.Lowering.Program.recursiveValueAllowedIn", "Vuna/Compiler/Lowering/Program.vuna:1178"));
  ("Lowering_dProgram.v_retagAltEnv", ("Vuna.Compiler.Lowering.Program.retagAltEnv", "Vuna/Compiler/Lowering/Program.vuna:812"));
  ("Lowering_dProgram.v_retagArmBinder", ("Vuna.Compiler.Lowering.Program.retagArmBinder", "Vuna/Compiler/Lowering/Program.vuna:795"));
  ("Lowering_dProgram.v_retagArmEnv", ("Vuna.Compiler.Lowering.Program.retagArmEnv", "Vuna/Compiler/Lowering/Program.vuna:808"));
  ("Lowering_dProgram.v_runtimeArityIn", ("Vuna.Compiler.Lowering.Program.runtimeArityIn", "Vuna/Compiler/Lowering/Program.vuna:1173"));
  ("Lowering_dProgram.v_runtimeBinderAt", ("Vuna.Compiler.Lowering.Program.runtimeBinderAt", "Vuna/Compiler/Lowering/Program.vuna:159"));
  ("Lowering_dProgram.v_runtimeIndexInPairs", ("Vuna.Compiler.Lowering.Program.runtimeIndexInPairs", "Vuna/Compiler/Lowering/Program.vuna:167"));
  ("Lowering_dProgram.v_runtimePairGo", ("Vuna.Compiler.Lowering.Program.runtimePairGo", "Vuna/Compiler/Lowering/Program.vuna:170"));
  ("Lowering_dProgram.v_sigArrowTys", ("Vuna.Compiler.Lowering.Program.sigArrowTys", "Vuna/Compiler/Lowering/Program.vuna:317"));
  ("Lowering_dProgram.v_spanOfTbl", ("Vuna.Compiler.Lowering.Program.spanOfTbl", "Vuna/Compiler/Lowering/Program.vuna:1355"));
  ("Lowering_dProgram.v_tblLookup", ("Vuna.Compiler.Lowering.Program.tblLookup", "Vuna/Compiler/Lowering/Program.vuna:1343"));
  ("Lowering_dProgram.v_typedPats", ("Vuna.Compiler.Lowering.Program.typedPats", "Vuna/Compiler/Lowering/Program.vuna:773"));
  ("Lowering_dProgram.v_typedPatsAll", ("Vuna.Compiler.Lowering.Program.typedPatsAll", "Vuna/Compiler/Lowering/Program.vuna:778"));
  ("Lowering_dProgram.v_zipFieldNames", ("Vuna.Compiler.Lowering.Program.zipFieldNames", "Vuna/Compiler/Lowering/Program.vuna:673"));
  ("Lowering_dTy.v_annotCalleeTy", ("Vuna.Compiler.Lowering.Ty.annotCalleeTy", "Vuna/Compiler/Lowering/Ty.vuna:387"));
  ("Lowering_dTy.v_annotConTy", ("Vuna.Compiler.Lowering.Ty.annotConTy", "Vuna/Compiler/Lowering/Ty.vuna:273"));
  ("Lowering_dTy.v_annotFamilyArgs", ("Vuna.Compiler.Lowering.Ty.annotFamilyArgs", "Vuna/Compiler/Lowering/Ty.vuna:464"));
  ("Lowering_dTy.v_annotGlobalTy", ("Vuna.Compiler.Lowering.Ty.annotGlobalTy", "Vuna/Compiler/Lowering/Ty.vuna:410"));
  ("Lowering_dTy.v_annotHeadTy", ("Vuna.Compiler.Lowering.Ty.annotHeadTy", "Vuna/Compiler/Lowering/Ty.vuna:304"));
  ("Lowering_dTy.v_annotRunCalleeTy", ("Vuna.Compiler.Lowering.Ty.annotRunCalleeTy", "Vuna/Compiler/Lowering/Ty.vuna:373"));
  ("Lowering_dTy.v_annotRunTyOf", ("Vuna.Compiler.Lowering.Ty.annotRunTyOf", "Vuna/Compiler/Lowering/Ty.vuna:359"));
  ("Lowering_dTy.v_annotRunTyOfTotal", ("Vuna.Compiler.Lowering.Ty.annotRunTyOfTotal", "Vuna/Compiler/Lowering/Ty.vuna:381"));
  ("Lowering_dTy.v_annotTyOf", ("Vuna.Compiler.Lowering.Ty.annotTyOf", "Vuna/Compiler/Lowering/Ty.vuna:221"));
  ("Lowering_dTy.v_annotTyOfFuel", ("Vuna.Compiler.Lowering.Ty.annotTyOfFuel", "Vuna/Compiler/Lowering/Ty.vuna:236"));
  ("Lowering_dTy.v_annotTyOfTotal", ("Vuna.Compiler.Lowering.Ty.annotTyOfTotal", "Vuna/Compiler/Lowering/Ty.vuna:228"));
  ("Lowering_dTy.v_binderTyAtIn", ("Vuna.Compiler.Lowering.Ty.binderTyAtIn", "Vuna/Compiler/Lowering/Ty.vuna:290"));
  ("Lowering_dTy.v_binderTyAtRuntime", ("Vuna.Compiler.Lowering.Ty.binderTyAtRuntime", "Vuna/Compiler/Lowering/Ty.vuna:365"));
  ("Lowering_dTy.v_countRuntimeArgs", ("Vuna.Compiler.Lowering.Ty.countRuntimeArgs", "Vuna/Compiler/Lowering/Ty.vuna:428"));
  ("Lowering_dTy.v_ctorArityNeed", ("Vuna.Compiler.Lowering.Ty.ctorArityNeed", "Vuna/Compiler/Lowering/Ty.vuna:193"));
  ("Lowering_dTy.v_ctorFieldTys", ("Vuna.Compiler.Lowering.Ty.ctorFieldTys", "Vuna/Compiler/Lowering/Ty.vuna:154"));
  ("Lowering_dTy.v_ctorKeptFieldTys", ("Vuna.Compiler.Lowering.Ty.ctorKeptFieldTys", "Vuna/Compiler/Lowering/Ty.vuna:509"));
  ("Lowering_dTy.v_ctorTypeArgsOf", ("Vuna.Compiler.Lowering.Ty.ctorTypeArgsOf", "Vuna/Compiler/Lowering/Ty.vuna:487"));
  ("Lowering_dTy.v_dataArityNeed", ("Vuna.Compiler.Lowering.Ty.dataArityNeed", "Vuna/Compiler/Lowering/Ty.vuna:199"));
  ("Lowering_dTy.v_findCtorInLocal", ("Vuna.Compiler.Lowering.Ty.findCtorInLocal", "Vuna/Compiler/Lowering/Ty.vuna:503"));
  ("Lowering_dTy.v_flagMatchesRigIn", ("Vuna.Compiler.Lowering.Ty.flagMatchesRigIn", "Vuna/Compiler/Lowering/Ty.vuna:149"));
  ("Lowering_dTy.v_flattenAnnotApp", ("Vuna.Compiler.Lowering.Ty.flattenAnnotApp", "Vuna/Compiler/Lowering/Ty.vuna:296"));
  ("Lowering_dTy.v_flattenAnnotAppGo", ("Vuna.Compiler.Lowering.Ty.flattenAnnotAppGo", "Vuna/Compiler/Lowering/Ty.vuna:299"));
  ("Lowering_dTy.v_flattenAnnotAppRig", ("Vuna.Compiler.Lowering.Ty.flattenAnnotAppRig", "Vuna/Compiler/Lowering/Ty.vuna:420"));
  ("Lowering_dTy.v_flattenAnnotAppRigGo", ("Vuna.Compiler.Lowering.Ty.flattenAnnotAppRigGo", "Vuna/Compiler/Lowering/Ty.vuna:423"));
  ("Lowering_dTy.v_foldlTyNames", ("Vuna.Compiler.Lowering.Ty.foldlTyNames", "Vuna/Compiler/Lowering/Ty.vuna:586"));
  ("Lowering_dTy.v_globalTyTermOf", ("Vuna.Compiler.Lowering.Ty.globalTyTermOf", "Vuna/Compiler/Lowering/Ty.vuna:403"));
  ("Lowering_dTy.v_maxIntListIn", ("Vuna.Compiler.Lowering.Ty.maxIntListIn", "Vuna/Compiler/Lowering/Ty.vuna:205"));
  ("Lowering_dTy.v_nthTermIn", ("Vuna.Compiler.Lowering.Ty.nthTermIn", "Vuna/Compiler/Lowering/Ty.vuna:482"));
  ("Lowering_dTy.v_peelIrFuns", ("Vuna.Compiler.Lowering.Ty.peelIrFuns", "Vuna/Compiler/Lowering/Ty.vuna:433"));
  ("Lowering_dTy.v_peelPiArgsTy", ("Vuna.Compiler.Lowering.Ty.peelPiArgsTy", "Vuna/Compiler/Lowering/Ty.vuna:445"));
  ("Lowering_dTy.v_renderFamilyArgs", ("Vuna.Compiler.Lowering.Ty.renderFamilyArgs", "Vuna/Compiler/Lowering/Ty.vuna:86"));
  ("Lowering_dTy.v_renderFieldTy", ("Vuna.Compiler.Lowering.Ty.renderFieldTy", "Vuna/Compiler/Lowering/Ty.vuna:120"));
  ("Lowering_dTy.v_renderPiTy", ("Vuna.Compiler.Lowering.Ty.renderPiTy", "Vuna/Compiler/Lowering/Ty.vuna:102"));
  ("Lowering_dTy.v_renderPiTyFuel", ("Vuna.Compiler.Lowering.Ty.renderPiTyFuel", "Vuna/Compiler/Lowering/Ty.vuna:105"));
  ("Lowering_dTy.v_renderTyFuel", ("Vuna.Compiler.Lowering.Ty.renderTyFuel", "Vuna/Compiler/Lowering/Ty.vuna:29"));
  ("Lowering_dTy.v_renderTyGlobal", ("Vuna.Compiler.Lowering.Ty.renderTyGlobal", "Vuna/Compiler/Lowering/Ty.vuna:60"));
  ("Lowering_dTy.v_renderTyIntrinsicWith", ("Vuna.Compiler.Lowering.Ty.renderTyIntrinsicWith", "Vuna/Compiler/Lowering/Ty.vuna:78"));
  ("Lowering_dTy.v_renderTyOf", ("Vuna.Compiler.Lowering.Ty.renderTyOf", "Vuna/Compiler/Lowering/Ty.vuna:26"));
  ("Lowering_dTy.v_reprTyIr", ("Vuna.Compiler.Lowering.Ty.reprTyIr", "Vuna/Compiler/Lowering/Ty.vuna:46"));
  ("Lowering_dTy.v_tempAnnotBinderId", ("Vuna.Compiler.Lowering.Ty.tempAnnotBinderId", "Vuna/Compiler/Lowering/Ty.vuna:225"));
  ("Lowering_dTy.v_tyDeclOf", ("Vuna.Compiler.Lowering.Ty.tyDeclOf", "Vuna/Compiler/Lowering/Ty.vuna:543"));
  ("Lowering_dTy.v_tyDeclRefs", ("Vuna.Compiler.Lowering.Ty.tyDeclRefs", "Vuna/Compiler/Lowering/Ty.vuna:574"));
  ("Lowering_dTy.v_tyDeclRefsGo", ("Vuna.Compiler.Lowering.Ty.tyDeclRefsGo", "Vuna/Compiler/Lowering/Ty.vuna:582"));
  ("Lowering_dTy.v_tyDeclTys", ("Vuna.Compiler.Lowering.Ty.tyDeclTys", "Vuna/Compiler/Lowering/Ty.vuna:577"));
  ("Lowering_dTy.v_tyDeclsGo", ("Vuna.Compiler.Lowering.Ty.tyDeclsGo", "Vuna/Compiler/Lowering/Ty.vuna:536"));
  ("Lowering_dTy.v_tyDeclsOf", ("Vuna.Compiler.Lowering.Ty.tyDeclsOf", "Vuna/Compiler/Lowering/Ty.vuna:532"));
  ("Lowering_dTy.v_tyNamesInto", ("Vuna.Compiler.Lowering.Ty.tyNamesInto", "Vuna/Compiler/Lowering/Ty.vuna:590"));
  ("Main.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List", ("Applicative_19070277251d295b_Base$46$Data$46$List$46$List", "Base/Data/List.vuna:179"));
  ("Main.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe", ("Applicative_19070277251d295b_Base$46$Data$46$Maybe$46$Maybe", "Base/Data/Maybe.vuna:55"));
  ("Main.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result", ("Applicative_19070277251d295b_Base$46$Data$46$Result$46$Result", "Base/Data/Result.vuna:32"));
  ("Main.v_Applicative_u19070277251d295b_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur", ("Applicative_19070277251d295b_Base$46$Effect$46$Core$46$Eff_r", "Base/Effect/Core.vuna:89"));
  ("Main.v_Applicative_u19070277251d295b_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck", ("Applicative_19070277251d295b_Vuna$46$Compiler$46$Base$46$Common$46$EffCheck", "Vuna/Compiler/Base/Common.vuna:41"));
  ("Main.v_Applicative_u19070277251d295b_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check", ("Applicative_19070277251d295b_Vuna$46$Compiler$46$Base$46$Diag$46$Check", "Vuna/Compiler/Base/Diag.vuna:531"));
  ("Main.v_ConvertMaybe_ud297f329ba596d0d_uInt_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat", ("ConvertMaybe_d297f329ba596d0d_Int_Base$46$Data$46$Nat$46$Nat", "Base/Data/Nat.vuna:88"));
  ("Main.v_Convert_ue2bc7263cfa9794d_uBase_x36_46_x36_Data_x36_46_x36_Fin_x36_46_x36_Fin_un_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat", ("Convert_e2bc7263cfa9794d_Base$46$Data$46$Fin$46$Fin_n_Base$46$Data$46$Nat$46$Nat", "Base/Data/Fin.vuna:44"));
  ("Main.v_Convert_ue2bc7263cfa9794d_uBase_x36_46_x36_Data_x36_46_x36_Fin_x36_46_x36_Fin_un_uInt", ("Convert_e2bc7263cfa9794d_Base$46$Data$46$Fin$46$Fin_n_Int", "Base/Data/Fin.vuna:47"));
  ("Main.v_Convert_ue2bc7263cfa9794d_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat_uInt", ("Convert_e2bc7263cfa9794d_Base$46$Data$46$Nat$46$Nat_Int", "Base/Data/Nat.vuna:85"));
  ("Main.v_DebugShow_ub9614133c0738231_ua", ("DebugShow_b9614133c0738231_a", "Base/Trait/Show.vuna:24"));
  ("Main.v_Eq_u018fc178ff3df1b4_uArray_ua", ("Eq_018fc178ff3df1b4_Array_a", "Base/Container/Array.vuna:35"));
  ("Main.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool", ("Eq_018fc178ff3df1b4_Base$46$Data$46$Bool$46$Bool", "Base/Trait/Eq.vuna:17"));
  ("Main.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua", ("Eq_018fc178ff3df1b4_Base$46$Data$46$List$46$List_a", "Base/Data/List.vuna:200"));
  ("Main.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua", ("Eq_018fc178ff3df1b4_Base$46$Data$46$Maybe$46$Maybe_a", "Base/Data/Maybe.vuna:82"));
  ("Main.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat", ("Eq_018fc178ff3df1b4_Base$46$Data$46$Nat$46$Nat", "Base/Data/Nat.vuna:55"));
  ("Main.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub", ("Eq_018fc178ff3df1b4_Base$46$Data$46$Pair$46$Pair_a_b", "Base/Data/Pair.vuna:34"));
  ("Main.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_ua", ("Eq_018fc178ff3df1b4_Base$46$Data$46$Result$46$Result_a", "Base/Data/Result.vuna:81"));
  ("Main.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Data_x36_46_x36_Unit_x36_46_x36_Unit", ("Eq_018fc178ff3df1b4_Base$46$Data$46$Unit$46$Unit", "Base/Data/Unit.vuna:16"));
  ("Main.v_Eq_u018fc178ff3df1b4_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering", ("Eq_018fc178ff3df1b4_Base$46$Trait$46$Ord$46$Ordering", "Base/Trait/Ord.vuna:45"));
  ("Main.v_Eq_u018fc178ff3df1b4_uFloat", ("Eq_018fc178ff3df1b4_Float", "Base/Data/Float.vuna:26"));
  ("Main.v_Eq_u018fc178ff3df1b4_uInt", ("Eq_018fc178ff3df1b4_Int", "Base/Data/Int.vuna:13"));
  ("Main.v_Eq_u018fc178ff3df1b4_uString", ("Eq_018fc178ff3df1b4_String", "Base/Data/String.vuna:212"));
  ("Main.v_Eq_u018fc178ff3df1b4_uVuna_x36_46_x36_Compiler_x36_46_x36_Loader_x36_46_x36_Modules_x36_46_x36_ExportEntry", ("Eq_018fc178ff3df1b4_Vuna$46$Compiler$46$Loader$46$Modules$46$ExportEntry", "Vuna/Compiler/Loader/Modules.vuna:114"));
  ("Main.v_Foldable_u2c890964dd357757_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List", ("Foldable_2c890964dd357757_Base$46$Data$46$List$46$List", "Base/Data/List.vuna:231"));
  ("Main.v_Foldable_u2c890964dd357757_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe", ("Foldable_2c890964dd357757_Base$46$Data$46$Maybe$46$Maybe", "Base/Data/Maybe.vuna:116"));
  ("Main.v_Foldable_u2c890964dd357757_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result", ("Foldable_2c890964dd357757_Base$46$Data$46$Result$46$Result", "Base/Data/Result.vuna:93"));
  ("Main.v_FromFloat_u70c61bb9501ecaf2_uFloat", ("FromFloat_70c61bb9501ecaf2_Float", "Base/Data/Float.vuna:23"));
  ("Main.v_FromInt_uff907517db6283c3_uInt", ("FromInt_ff907517db6283c3_Int", "Base/Trait/FromInt.vuna:14"));
  ("Main.v_FromString_u11e06e551e33c59c_uString", ("FromString_11e06e551e33c59c_String", "Base/Trait/FromString.vuna:14"));
  ("Main.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List", ("Functor_a5312def40ac3976_Base$46$Data$46$List$46$List", "Base/Data/List.vuna:173"));
  ("Main.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe", ("Functor_a5312def40ac3976_Base$46$Data$46$Maybe$46$Maybe", "Base/Data/Maybe.vuna:43"));
  ("Main.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result", ("Functor_a5312def40ac3976_Base$46$Data$46$Result$46$Result", "Base/Data/Result.vuna:24"));
  ("Main.v_Functor_ua5312def40ac3976_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur", ("Functor_a5312def40ac3976_Base$46$Effect$46$Core$46$Eff_r", "Base/Effect/Core.vuna:71"));
  ("Main.v_Functor_ua5312def40ac3976_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck", ("Functor_a5312def40ac3976_Vuna$46$Compiler$46$Base$46$Common$46$EffCheck", "Vuna/Compiler/Base/Common.vuna:38"));
  ("Main.v_Functor_ua5312def40ac3976_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check", ("Functor_a5312def40ac3976_Vuna$46$Compiler$46$Base$46$Diag$46$Check", "Vuna/Compiler/Base/Diag.vuna:523"));
  ("Main.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool", ("Hashable_e4b0f10b020a5e82_Base$46$Data$46$Bool$46$Bool", "Base/Data/Bool.vuna:47"));
  ("Main.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua", ("Hashable_e4b0f10b020a5e82_Base$46$Data$46$List$46$List_a", "Base/Data/List.vuna:217"));
  ("Main.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua", ("Hashable_e4b0f10b020a5e82_Base$46$Data$46$Maybe$46$Maybe_a", "Base/Data/Maybe.vuna:98"));
  ("Main.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat", ("Hashable_e4b0f10b020a5e82_Base$46$Data$46$Nat$46$Nat", "Base/Data/Nat.vuna:75"));
  ("Main.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub", ("Hashable_e4b0f10b020a5e82_Base$46$Data$46$Pair$46$Pair_a_b", "Base/Data/Pair.vuna:44"));
  ("Main.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_ua", ("Hashable_e4b0f10b020a5e82_Base$46$Data$46$Result$46$Result_a", "Base/Data/Result.vuna:87"));
  ("Main.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Data_x36_46_x36_Unit_x36_46_x36_Unit", ("Hashable_e4b0f10b020a5e82_Base$46$Data$46$Unit$46$Unit", "Base/Data/Unit.vuna:29"));
  ("Main.v_Hashable_ue4b0f10b020a5e82_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering", ("Hashable_e4b0f10b020a5e82_Base$46$Trait$46$Ord$46$Ordering", "Base/Trait/Ord.vuna:93"));
  ("Main.v_Hashable_ue4b0f10b020a5e82_uInt", ("Hashable_e4b0f10b020a5e82_Int", "Base/Data/Int.vuna:38"));
  ("Main.v_Hashable_ue4b0f10b020a5e82_uString", ("Hashable_e4b0f10b020a5e82_String", "Base/Data/String.vuna:223"));
  ("Main.v_Interp_uc9feaa570847b590_uString", ("Interp_c9feaa570847b590_String", "Base/Trait/Interp.vuna:22"));
  ("Main.v_Interp_uc9feaa570847b590_ua", ("Interp_c9feaa570847b590_a", "Base/Trait/Interp.vuna:18"));
  ("Main.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List", ("Monad_cc99eea03f4e7df1_Base$46$Data$46$List$46$List", "Base/Data/List.vuna:176"));
  ("Main.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe", ("Monad_cc99eea03f4e7df1_Base$46$Data$46$Maybe$46$Maybe", "Base/Data/Maybe.vuna:49"));
  ("Main.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result", ("Monad_cc99eea03f4e7df1_Base$46$Data$46$Result$46$Result", "Base/Data/Result.vuna:28"));
  ("Main.v_Monad_ucc99eea03f4e7df1_uBase_x36_46_x36_Effect_x36_46_x36_Core_x36_46_x36_Eff_ur", ("Monad_cc99eea03f4e7df1_Base$46$Effect$46$Core$46$Eff_r", "Base/Effect/Core.vuna:79"));
  ("Main.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Common_x36_46_x36_EffCheck", ("Monad_cc99eea03f4e7df1_Vuna$46$Compiler$46$Base$46$Common$46$EffCheck", "Vuna/Compiler/Base/Common.vuna:46"));
  ("Main.v_Monad_ucc99eea03f4e7df1_uVuna_x36_46_x36_Compiler_x36_46_x36_Base_x36_46_x36_Diag_x36_46_x36_Check", ("Monad_cc99eea03f4e7df1_Vuna$46$Compiler$46$Base$46$Diag$46$Check", "Vuna/Compiler/Base/Diag.vuna:527"));
  ("Main.v_Monoid_u4f2563914c7fbae1_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua", ("Monoid_4f2563914c7fbae1_Base$46$Data$46$List$46$List_a", "Base/Data/List.vuna:227"));
  ("Main.v_Monoid_u4f2563914c7fbae1_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua", ("Monoid_4f2563914c7fbae1_Base$46$Data$46$Maybe$46$Maybe_a", "Base/Data/Maybe.vuna:113"));
  ("Main.v_Monoid_u4f2563914c7fbae1_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat", ("Monoid_4f2563914c7fbae1_Base$46$Data$46$Nat$46$Nat", "Base/Data/Nat.vuna:81"));
  ("Main.v_Monoid_u4f2563914c7fbae1_uBase_x36_46_x36_Data_x36_46_x36_Unit_x36_46_x36_Unit", ("Monoid_4f2563914c7fbae1_Base$46$Data$46$Unit$46$Unit", "Base/Data/Unit.vuna:35"));
  ("Main.v_Monoid_u4f2563914c7fbae1_uString", ("Monoid_4f2563914c7fbae1_String", "Base/Data/String.vuna:229"));
  ("Main.v_Neg_uc22890dadc3767a7_uFloat", ("Neg_c22890dadc3767a7_Float", "Base/Data/Float.vuna:44"));
  ("Main.v_Neg_uc22890dadc3767a7_uInt", ("Neg_c22890dadc3767a7_Int", "Base/Data/Int.vuna:31"));
  ("Main.v_Num_ub27c21f837ed69cc_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat", ("Num_b27c21f837ed69cc_Base$46$Data$46$Nat$46$Nat", "Base/Data/Nat.vuna:66"));
  ("Main.v_Num_ub27c21f837ed69cc_uFloat", ("Num_b27c21f837ed69cc_Float", "Base/Data/Float.vuna:37"));
  ("Main.v_Num_ub27c21f837ed69cc_uInt", ("Num_b27c21f837ed69cc_Int", "Base/Data/Int.vuna:24"));
  ("Main.v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool", ("Ord_5afb3bbeddafcb50_Base$46$Data$46$Bool$46$Bool", "Base/Trait/Ord.vuna:26"));
  ("Main.v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua", ("Ord_5afb3bbeddafcb50_Base$46$Data$46$List$46$List_a", "Base/Data/List.vuna:207"));
  ("Main.v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua", ("Ord_5afb3bbeddafcb50_Base$46$Data$46$Maybe$46$Maybe_a", "Base/Data/Maybe.vuna:89"));
  ("Main.v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat", ("Ord_5afb3bbeddafcb50_Base$46$Data$46$Nat$46$Nat", "Base/Data/Nat.vuna:59"));
  ("Main.v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub", ("Ord_5afb3bbeddafcb50_Base$46$Data$46$Pair$46$Pair_a_b", "Base/Data/Pair.vuna:38"));
  ("Main.v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Data_x36_46_x36_Unit_x36_46_x36_Unit", ("Ord_5afb3bbeddafcb50_Base$46$Data$46$Unit$46$Unit", "Base/Data/Unit.vuna:20"));
  ("Main.v_Ord_u5afb3bbeddafcb50_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering", ("Ord_5afb3bbeddafcb50_Base$46$Trait$46$Ord$46$Ordering", "Base/Trait/Ord.vuna:52"));
  ("Main.v_Ord_u5afb3bbeddafcb50_uFloat", ("Ord_5afb3bbeddafcb50_Float", "Base/Data/Float.vuna:30"));
  ("Main.v_Ord_u5afb3bbeddafcb50_uInt", ("Ord_5afb3bbeddafcb50_Int", "Base/Data/Int.vuna:17"));
  ("Main.v_Ord_u5afb3bbeddafcb50_uString", ("Ord_5afb3bbeddafcb50_String", "Base/Data/String.vuna:216"));
  ("Main.v_Semigroup_ueb264836545b3665_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua", ("Semigroup_eb264836545b3665_Base$46$Data$46$List$46$List_a", "Base/Data/List.vuna:224"));
  ("Main.v_Semigroup_ueb264836545b3665_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua", ("Semigroup_eb264836545b3665_Base$46$Data$46$Maybe$46$Maybe_a", "Base/Data/Maybe.vuna:104"));
  ("Main.v_Semigroup_ueb264836545b3665_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat", ("Semigroup_eb264836545b3665_Base$46$Data$46$Nat$46$Nat", "Base/Data/Nat.vuna:78"));
  ("Main.v_Semigroup_ueb264836545b3665_uBase_x36_46_x36_Data_x36_46_x36_Unit_x36_46_x36_Unit", ("Semigroup_eb264836545b3665_Base$46$Data$46$Unit$46$Unit", "Base/Data/Unit.vuna:32"));
  ("Main.v_Semigroup_ueb264836545b3665_uString", ("Semigroup_eb264836545b3665_String", "Base/Data/String.vuna:226"));
  ("Main.v_Show_u0077d73cf424e521_uArray_ua", ("Show_0077d73cf424e521_Array_a", "Base/Container/Array.vuna:40"));
  ("Main.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Container_x36_46_x36_HashMap_x36_46_x36_HashMap_uk_uv", ("Show_0077d73cf424e521_Base$46$Container$46$HashMap$46$HashMap_k_v", "Base/Container/HashMap.vuna:143"));
  ("Main.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Container_x36_46_x36_Queue_x36_46_x36_Queue_ua", ("Show_0077d73cf424e521_Base$46$Container$46$Queue$46$Queue_a", "Base/Container/Queue.vuna:90"));
  ("Main.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Bool_x36_46_x36_Bool", ("Show_0077d73cf424e521_Base$46$Data$46$Bool$46$Bool", "Base/Data/Bool.vuna:43"));
  ("Main.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_ua", ("Show_0077d73cf424e521_Base$46$Data$46$List$46$List_a", "Base/Data/List.vuna:196"));
  ("Main.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_ua", ("Show_0077d73cf424e521_Base$46$Data$46$Maybe$46$Maybe_a", "Base/Data/Maybe.vuna:75"));
  ("Main.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Nat_x36_46_x36_Nat", ("Show_0077d73cf424e521_Base$46$Data$46$Nat$46$Nat", "Base/Data/Nat.vuna:72"));
  ("Main.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Pair_x36_46_x36_Pair_ua_ub", ("Show_0077d73cf424e521_Base$46$Data$46$Pair$46$Pair_a_b", "Base/Data/Pair.vuna:28"));
  ("Main.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_ua", ("Show_0077d73cf424e521_Base$46$Data$46$Result$46$Result_a", "Base/Data/Result.vuna:74"));
  ("Main.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Data_x36_46_x36_Unit_x36_46_x36_Unit", ("Show_0077d73cf424e521_Base$46$Data$46$Unit$46$Unit", "Base/Data/Unit.vuna:26"));
  ("Main.v_Show_u0077d73cf424e521_uBase_x36_46_x36_Trait_x36_46_x36_Ord_x36_46_x36_Ordering", ("Show_0077d73cf424e521_Base$46$Trait$46$Ord$46$Ordering", "Base/Trait/Ord.vuna:70"));
  ("Main.v_Show_u0077d73cf424e521_uFloat", ("Show_0077d73cf424e521_Float", "Base/Data/Float.vuna:47"));
  ("Main.v_Show_u0077d73cf424e521_uInt", ("Show_0077d73cf424e521_Int", "Base/Data/Int.vuna:34"));
  ("Main.v_Show_u0077d73cf424e521_uString", ("Show_0077d73cf424e521_String", "Base/Trait/Show.vuna:14"));
  ("Main.v_Traversable_u3e5fb3267308d1c3_uBase_x36_46_x36_Data_x36_46_x36_List_x36_46_x36_List_uf", ("Traversable_3e5fb3267308d1c3_Base$46$Data$46$List$46$List_f", "Base/Data/List.vuna:234"));
  ("Main.v_Traversable_u3e5fb3267308d1c3_uBase_x36_46_x36_Data_x36_46_x36_Maybe_x36_46_x36_Maybe_uf", ("Traversable_3e5fb3267308d1c3_Base$46$Data$46$Maybe$46$Maybe_f", "Base/Data/Maybe.vuna:122"));
  ("Main.v_Traversable_u3e5fb3267308d1c3_uBase_x36_46_x36_Data_x36_46_x36_Result_x36_46_x36_Result_uf", ("Traversable_3e5fb3267308d1c3_Base$46$Data$46$Result$46$Result_f", "Base/Data/Result.vuna:99"));
  ("Main.v_describeText", ("describeText", "app/Main.vuna:76"));
  ("Main.v_main", ("main", "app/Main.vuna:43"));
  ("Main.v_runMain", ("runMain", "app/Main.vuna:54"));
  ("Main.v_sampleWanted", ("sampleWanted", "app/Main.vuna:68"));
  ("Vuna_dIr_dAnalysis.v_addAllNames", ("Vuna.Ir.Analysis.addAllNames", "Vuna/Ir/Analysis.vuna:130"));
  ("Vuna_dIr_dAnalysis.v_addDependents", ("Vuna.Ir.Analysis.addDependents", "Vuna/Ir/Analysis.vuna:31"));
  ("Vuna_dIr_dAnalysis.v_addReverseEdges", ("Vuna.Ir.Analysis.addReverseEdges", "Vuna/Ir/Analysis.vuna:219"));
  ("Vuna_dIr_dAnalysis.v_adjTblOf", ("Vuna.Ir.Analysis.adjTblOf", "Vuna/Ir/Analysis.vuna:28"));
  ("Vuna_dIr_dAnalysis.v_allCovered", ("Vuna.Ir.Analysis.allCovered", "Vuna/Ir/Analysis.vuna:295"));
  ("Vuna_dIr_dAnalysis.v_anyMentions", ("Vuna.Ir.Analysis.anyMentions", "Vuna/Ir/Analysis.vuna:626"));
  ("Vuna_dIr_dAnalysis.v_anyMentionsAltM", ("Vuna.Ir.Analysis.anyMentionsAltM", "Vuna/Ir/Analysis.vuna:639"));
  ("Vuna_dIr_dAnalysis.v_anyMentionsAlts", ("Vuna.Ir.Analysis.anyMentionsAlts", "Vuna/Ir/Analysis.vuna:634"));
  ("Vuna_dIr_dAnalysis.v_anyMentionsFields", ("Vuna.Ir.Analysis.anyMentionsFields", "Vuna/Ir/Analysis.vuna:630"));
  ("Vuna_dIr_dAnalysis.v_assembleGo", ("Vuna.Ir.Analysis.assembleGo", "Vuna/Ir/Analysis.vuna:580"));
  ("Vuna_dIr_dAnalysis.v_assembleGroupNames", ("Vuna.Ir.Analysis.assembleGroupNames", "Vuna/Ir/Analysis.vuna:572"));
  ("Vuna_dIr_dAnalysis.v_assembleGroups", ("Vuna.Ir.Analysis.assembleGroups", "Vuna/Ir/Analysis.vuna:328"));
  ("Vuna_dIr_dAnalysis.v_bodyRefCount", ("Vuna.Ir.Analysis.bodyRefCount", "Vuna/Ir/Analysis.vuna:515"));
  ("Vuna_dIr_dAnalysis.v_checkGroupsCover", ("Vuna.Ir.Analysis.checkGroupsCover", "Vuna/Ir/Analysis.vuna:286"));
  ("Vuna_dIr_dAnalysis.v_checkUniqueDefNames", ("Vuna.Ir.Analysis.checkUniqueDefNames", "Vuna/Ir/Analysis.vuna:556"));
  ("Vuna_dIr_dAnalysis.v_checkUniqueDefNamesGo", ("Vuna.Ir.Analysis.checkUniqueDefNamesGo", "Vuna/Ir/Analysis.vuna:559"));
  ("Vuna_dIr_dAnalysis.v_closeRefsByRefs", ("Vuna.Ir.Analysis.closeRefsByRefs", "Vuna/Ir/Analysis.vuna:525"));
  ("Vuna_dIr_dAnalysis.v_collectComps", ("Vuna.Ir.Analysis.collectComps", "Vuna/Ir/Analysis.vuna:116"));
  ("Vuna_dIr_dAnalysis.v_componentTblOf", ("Vuna.Ir.Analysis.componentTblOf", "Vuna/Ir/Analysis.vuna:126"));
  ("Vuna_dIr_dAnalysis.v_countList", ("Vuna.Ir.Analysis.countList", "Vuna/Ir/Analysis.vuna:365"));
  ("Vuna_dIr_dAnalysis.v_depEdgeCount", ("Vuna.Ir.Analysis.depEdgeCount", "Vuna/Ir/Analysis.vuna:362"));
  ("Vuna_dIr_dAnalysis.v_dfsCollect", ("Vuna.Ir.Analysis.dfsCollect", "Vuna/Ir/Analysis.vuna:105"));
  ("Vuna_dIr_dAnalysis.v_dfsCollectFuel", ("Vuna.Ir.Analysis.dfsCollectFuel", "Vuna/Ir/Analysis.vuna:108"));
  ("Vuna_dIr_dAnalysis.v_dfsPost", ("Vuna.Ir.Analysis.dfsPost", "Vuna/Ir/Analysis.vuna:65"));
  ("Vuna_dIr_dAnalysis.v_dfsPostFuel", ("Vuna.Ir.Analysis.dfsPostFuel", "Vuna/Ir/Analysis.vuna:68"));
  ("Vuna_dIr_dAnalysis.v_filterNames", ("Vuna.Ir.Analysis.filterNames", "Vuna/Ir/Analysis.vuna:157"));
  ("Vuna_dIr_dAnalysis.v_findDefByName", ("Vuna.Ir.Analysis.findDefByName", "Vuna/Ir/Analysis.vuna:315"));
  ("Vuna_dIr_dAnalysis.v_firstBadRecName", ("Vuna.Ir.Analysis.firstBadRecName", "Vuna/Ir/Analysis.vuna:596"));
  ("Vuna_dIr_dAnalysis.v_firstBadRecursiveValue", ("Vuna.Ir.Analysis.firstBadRecursiveValue", "Vuna/Ir/Analysis.vuna:307"));
  ("Vuna_dIr_dAnalysis.v_flattenApp", ("Vuna.Ir.Analysis.flattenApp", "Vuna/Ir/Analysis.vuna:460"));
  ("Vuna_dIr_dAnalysis.v_floatsOfAlt", ("Vuna.Ir.Analysis.floatsOfAlt", "Vuna/Ir/Analysis.vuna:452"));
  ("Vuna_dIr_dAnalysis.v_floatsOfAltMaybe", ("Vuna.Ir.Analysis.floatsOfAltMaybe", "Vuna/Ir/Analysis.vuna:455"));
  ("Vuna_dIr_dAnalysis.v_floatsOfField", ("Vuna.Ir.Analysis.floatsOfField", "Vuna/Ir/Analysis.vuna:449"));
  ("Vuna_dIr_dAnalysis.v_foldNeighborsCollect", ("Vuna.Ir.Analysis.foldNeighborsCollect", "Vuna/Ir/Analysis.vuna:88"));
  ("Vuna_dIr_dAnalysis.v_foldNeighborsCollectFuel", ("Vuna.Ir.Analysis.foldNeighborsCollectFuel", "Vuna/Ir/Analysis.vuna:91"));
  ("Vuna_dIr_dAnalysis.v_foldNeighborsPost", ("Vuna.Ir.Analysis.foldNeighborsPost", "Vuna/Ir/Analysis.vuna:48"));
  ("Vuna_dIr_dAnalysis.v_foldNeighborsPostFuel", ("Vuna.Ir.Analysis.foldNeighborsPostFuel", "Vuna/Ir/Analysis.vuna:51"));
  ("Vuna_dIr_dAnalysis.v_globalsOfAlt", ("Vuna.Ir.Analysis.globalsOfAlt", "Vuna/Ir/Analysis.vuna:493"));
  ("Vuna_dIr_dAnalysis.v_globalsOfAltMaybe", ("Vuna.Ir.Analysis.globalsOfAltMaybe", "Vuna/Ir/Analysis.vuna:496"));
  ("Vuna_dIr_dAnalysis.v_globalsOfField", ("Vuna.Ir.Analysis.globalsOfField", "Vuna/Ir/Analysis.vuna:490"));
  ("Vuna_dIr_dAnalysis.v_groupDefsOf", ("Vuna.Ir.Analysis.groupDefsOf", "Vuna/Ir/Analysis.vuna:319"));
  ("Vuna_dIr_dAnalysis.v_groupDepIdx", ("Vuna.Ir.Analysis.groupDepIdx", "Vuna/Ir/Analysis.vuna:200"));
  ("Vuna_dIr_dAnalysis.v_groupDepIdxGo", ("Vuna.Ir.Analysis.groupDepIdxGo", "Vuna/Ir/Analysis.vuna:204"));
  ("Vuna_dIr_dAnalysis.v_groupIndexTbl", ("Vuna.Ir.Analysis.groupIndexTbl", "Vuna/Ir/Analysis.vuna:192"));
  ("Vuna_dIr_dAnalysis.v_groupNames", ("Vuna.Ir.Analysis.groupNames", "Vuna/Ir/Analysis.vuna:268"));
  ("Vuna_dIr_dAnalysis.v_groupNamesGo", ("Vuna.Ir.Analysis.groupNamesGo", "Vuna/Ir/Analysis.vuna:576"));
  ("Vuna_dIr_dAnalysis.v_groupNeedsRec", ("Vuna.Ir.Analysis.groupNeedsRec", "Vuna/Ir/Analysis.vuna:300"));
  ("Vuna_dIr_dAnalysis.v_groupOf", ("Vuna.Ir.Analysis.groupOf", "Vuna/Ir/Analysis.vuna:150"));
  ("Vuna_dIr_dAnalysis.v_groupsFromComps", ("Vuna.Ir.Analysis.groupsFromComps", "Vuna/Ir/Analysis.vuna:135"));
  ("Vuna_dIr_dAnalysis.v_groupsFromCompsGo", ("Vuna.Ir.Analysis.groupsFromCompsGo", "Vuna/Ir/Analysis.vuna:139"));
  ("Vuna_dIr_dAnalysis.v_indexGroups", ("Vuna.Ir.Analysis.indexGroups", "Vuna/Ir/Analysis.vuna:188"));
  ("Vuna_dIr_dAnalysis.v_insertReady", ("Vuna.Ir.Analysis.insertReady", "Vuna/Ir/Analysis.vuna:242"));
  ("Vuna_dIr_dAnalysis.v_irFloatLitsOf", ("Vuna.Ir.Analysis.irFloatLitsOf", "Vuna/Ir/Analysis.vuna:426"));
  ("Vuna_dIr_dAnalysis.v_irFloatLitsOfDef", ("Vuna.Ir.Analysis.irFloatLitsOfDef", "Vuna/Ir/Analysis.vuna:548"));
  ("Vuna_dIr_dAnalysis.v_irGlobalsOf", ("Vuna.Ir.Analysis.irGlobalsOf", "Vuna/Ir/Analysis.vuna:468"));
  ("Vuna_dIr_dAnalysis.v_irMentionsGlobal", ("Vuna.Ir.Analysis.irMentionsGlobal", "Vuna/Ir/Analysis.vuna:602"));
  ("Vuna_dIr_dAnalysis.v_irStringsOf", ("Vuna.Ir.Analysis.irStringsOf", "Vuna/Ir/Analysis.vuna:391"));
  ("Vuna_dIr_dAnalysis.v_irStringsOfAlt", ("Vuna.Ir.Analysis.irStringsOfAlt", "Vuna/Ir/Analysis.vuna:417"));
  ("Vuna_dIr_dAnalysis.v_irStringsOfAltMaybe", ("Vuna.Ir.Analysis.irStringsOfAltMaybe", "Vuna/Ir/Analysis.vuna:420"));
  ("Vuna_dIr_dAnalysis.v_irStringsOfDef", ("Vuna.Ir.Analysis.irStringsOfDef", "Vuna/Ir/Analysis.vuna:541"));
  ("Vuna_dIr_dAnalysis.v_irStringsOfField", ("Vuna.Ir.Analysis.irStringsOfField", "Vuna/Ir/Analysis.vuna:414"));
  ("Vuna_dIr_dAnalysis.v_lookupDeps", ("Vuna.Ir.Analysis.lookupDeps", "Vuna/Ir/Analysis.vuna:235"));
  ("Vuna_dIr_dAnalysis.v_lookupInt", ("Vuna.Ir.Analysis.lookupInt", "Vuna/Ir/Analysis.vuna:223"));
  ("Vuna_dIr_dAnalysis.v_lookupNames", ("Vuna.Ir.Analysis.lookupNames", "Vuna/Ir/Analysis.vuna:229"));
  ("Vuna_dIr_dAnalysis.v_neighborsOf", ("Vuna.Ir.Analysis.neighborsOf", "Vuna/Ir/Analysis.vuna:22"));
  ("Vuna_dIr_dAnalysis.v_notIn", ("Vuna.Ir.Analysis.notIn", "Vuna/Ir/Analysis.vuna:162"));
  ("Vuna_dIr_dAnalysis.v_orderGroups", ("Vuna.Ir.Analysis.orderGroups", "Vuna/Ir/Analysis.vuna:172"));
  ("Vuna_dIr_dAnalysis.v_orderGroupsGo", ("Vuna.Ir.Analysis.orderGroupsGo", "Vuna/Ir/Analysis.vuna:246"));
  ("Vuna_dIr_dAnalysis.v_postOrder", ("Vuna.Ir.Analysis.postOrder", "Vuna/Ir/Analysis.vuna:76"));
  ("Vuna_dIr_dAnalysis.v_reachableDefs", ("Vuna.Ir.Analysis.reachableDefs", "Vuna/Ir/Analysis.vuna:354"));
  ("Vuna_dIr_dAnalysis.v_reachableDefsByRefs", ("Vuna.Ir.Analysis.reachableDefsByRefs", "Vuna/Ir/Analysis.vuna:503"));
  ("Vuna_dIr_dAnalysis.v_reachableNames", ("Vuna.Ir.Analysis.reachableNames", "Vuna/Ir/Analysis.vuna:369"));
  ("Vuna_dIr_dAnalysis.v_refEdgeCount", ("Vuna.Ir.Analysis.refEdgeCount", "Vuna/Ir/Analysis.vuna:511"));
  ("Vuna_dIr_dAnalysis.v_refsOfDef", ("Vuna.Ir.Analysis.refsOfDef", "Vuna/Ir/Analysis.vuna:519"));
  ("Vuna_dIr_dAnalysis.v_reverseAdjTbl", ("Vuna.Ir.Analysis.reverseAdjTbl", "Vuna/Ir/Analysis.vuna:41"));
  ("Vuna_dIr_dAnalysis.v_reverseDepTbl", ("Vuna.Ir.Analysis.reverseDepTbl", "Vuna/Ir/Analysis.vuna:215"));
  ("Vuna_dIr_dCodec.v_decAlt", ("Vuna.Ir.Codec.decAlt", "Vuna/Ir/Codec.vuna:250"));
  ("Vuna_dIr_dCodec.v_decAlt1", ("Vuna.Ir.Codec.decAlt1", "Vuna/Ir/Codec.vuna:254"));
  ("Vuna_dIr_dCodec.v_decAlt2", ("Vuna.Ir.Codec.decAlt2", "Vuna/Ir/Codec.vuna:257"));
  ("Vuna_dIr_dCodec.v_decAltM", ("Vuna.Ir.Codec.decAltM", "Vuna/Ir/Codec.vuna:299"));
  ("Vuna_dIr_dCodec.v_decAlts", ("Vuna.Ir.Codec.decAlts", "Vuna/Ir/Codec.vuna:272"));
  ("Vuna_dIr_dCodec.v_decAltsGo", ("Vuna.Ir.Codec.decAltsGo", "Vuna/Ir/Codec.vuna:281"));
  ("Vuna_dIr_dCodec.v_decBName", ("Vuna.Ir.Codec.decBName", "Vuna/Ir/Codec.vuna:191"));
  ("Vuna_dIr_dCodec.v_decBNameTag", ("Vuna.Ir.Codec.decBNameTag", "Vuna/Ir/Codec.vuna:198"));
  ("Vuna_dIr_dCodec.v_decBinder", ("Vuna.Ir.Codec.decBinder", "Vuna/Ir/Codec.vuna:211"));
  ("Vuna_dIr_dCodec.v_decBinder0", ("Vuna.Ir.Codec.decBinder0", "Vuna/Ir/Codec.vuna:214"));
  ("Vuna_dIr_dCodec.v_decBinder1", ("Vuna.Ir.Codec.decBinder1", "Vuna/Ir/Codec.vuna:217"));
  ("Vuna_dIr_dCodec.v_decBinder2", ("Vuna.Ir.Codec.decBinder2", "Vuna/Ir/Codec.vuna:221"));
  ("Vuna_dIr_dCodec.v_decBinders", ("Vuna.Ir.Codec.decBinders", "Vuna/Ir/Codec.vuna:237"));
  ("Vuna_dIr_dCodec.v_decBools", ("Vuna.Ir.Codec.decBools", "Vuna/Ir/Codec.vuna:43"));
  ("Vuna_dIr_dCodec.v_decCtorShapes", ("Vuna.Ir.Codec.decCtorShapes", "Vuna/Ir/Codec.vuna:877"));
  ("Vuna_dIr_dCodec.v_decDef", ("Vuna.Ir.Codec.decDef", "Vuna/Ir/Codec.vuna:744"));
  ("Vuna_dIr_dCodec.v_decDefExtern", ("Vuna.Ir.Codec.decDefExtern", "Vuna/Ir/Codec.vuna:790"));
  ("Vuna_dIr_dCodec.v_decDefExtern1", ("Vuna.Ir.Codec.decDefExtern1", "Vuna/Ir/Codec.vuna:793"));
  ("Vuna_dIr_dCodec.v_decDefExtern2", ("Vuna.Ir.Codec.decDefExtern2", "Vuna/Ir/Codec.vuna:796"));
  ("Vuna_dIr_dCodec.v_decDefExtern3", ("Vuna.Ir.Codec.decDefExtern3", "Vuna/Ir/Codec.vuna:800"));
  ("Vuna_dIr_dCodec.v_decDefRec", ("Vuna.Ir.Codec.decDefRec", "Vuna/Ir/Codec.vuna:756"));
  ("Vuna_dIr_dCodec.v_decDefRec1", ("Vuna.Ir.Codec.decDefRec1", "Vuna/Ir/Codec.vuna:759"));
  ("Vuna_dIr_dCodec.v_decDefRec2", ("Vuna.Ir.Codec.decDefRec2", "Vuna/Ir/Codec.vuna:762"));
  ("Vuna_dIr_dCodec.v_decDefRec3", ("Vuna.Ir.Codec.decDefRec3", "Vuna/Ir/Codec.vuna:766"));
  ("Vuna_dIr_dCodec.v_decDefRec4", ("Vuna.Ir.Codec.decDefRec4", "Vuna/Ir/Codec.vuna:770"));
  ("Vuna_dIr_dCodec.v_decDefRec5", ("Vuna.Ir.Codec.decDefRec5", "Vuna/Ir/Codec.vuna:774"));
  ("Vuna_dIr_dCodec.v_decDefRec6", ("Vuna.Ir.Codec.decDefRec6", "Vuna/Ir/Codec.vuna:778"));
  ("Vuna_dIr_dCodec.v_decDefRec7", ("Vuna.Ir.Codec.decDefRec7", "Vuna/Ir/Codec.vuna:784"));
  ("Vuna_dIr_dCodec.v_decDefTag", ("Vuna.Ir.Codec.decDefTag", "Vuna/Ir/Codec.vuna:751"));
  ("Vuna_dIr_dCodec.v_decEntry", ("Vuna.Ir.Codec.decEntry", "Vuna/Ir/Codec.vuna:824"));
  ("Vuna_dIr_dCodec.v_decEntry1", ("Vuna.Ir.Codec.decEntry1", "Vuna/Ir/Codec.vuna:827"));
  ("Vuna_dIr_dCodec.v_decEntry2", ("Vuna.Ir.Codec.decEntry2", "Vuna/Ir/Codec.vuna:830"));
  ("Vuna_dIr_dCodec.v_decEntry3", ("Vuna.Ir.Codec.decEntry3", "Vuna/Ir/Codec.vuna:834"));
  ("Vuna_dIr_dCodec.v_decEntry4", ("Vuna.Ir.Codec.decEntry4", "Vuna/Ir/Codec.vuna:840"));
  ("Vuna_dIr_dCodec.v_decEntry5", ("Vuna.Ir.Codec.decEntry5", "Vuna/Ir/Codec.vuna:846"));
  ("Vuna_dIr_dCodec.v_decField", ("Vuna.Ir.Codec.decField", "Vuna/Ir/Codec.vuna:342"));
  ("Vuna_dIr_dCodec.v_decFieldOrder", ("Vuna.Ir.Codec.decFieldOrder", "Vuna/Ir/Codec.vuna:869"));
  ("Vuna_dIr_dCodec.v_decFields", ("Vuna.Ir.Codec.decFields", "Vuna/Ir/Codec.vuna:324"));
  ("Vuna_dIr_dCodec.v_decFieldsGo", ("Vuna.Ir.Codec.decFieldsGo", "Vuna/Ir/Codec.vuna:333"));
  ("Vuna_dIr_dCodec.v_decGroup", ("Vuna.Ir.Codec.decGroup", "Vuna/Ir/Codec.vuna:807"));
  ("Vuna_dIr_dCodec.v_decGroup1", ("Vuna.Ir.Codec.decGroup1", "Vuna/Ir/Codec.vuna:810"));
  ("Vuna_dIr_dCodec.v_decIr", ("Vuna.Ir.Codec.decIr", "Vuna/Ir/Codec.vuna:416"));
  ("Vuna_dIr_dCodec.v_decIrApp", ("Vuna.Ir.Codec.decIrApp", "Vuna/Ir/Codec.vuna:558"));
  ("Vuna_dIr_dCodec.v_decIrApp1", ("Vuna.Ir.Codec.decIrApp1", "Vuna/Ir/Codec.vuna:562"));
  ("Vuna_dIr_dCodec.v_decIrApp2", ("Vuna.Ir.Codec.decIrApp2", "Vuna/Ir/Codec.vuna:565"));
  ("Vuna_dIr_dCodec.v_decIrBool", ("Vuna.Ir.Codec.decIrBool", "Vuna/Ir/Codec.vuna:533"));
  ("Vuna_dIr_dCodec.v_decIrCase", ("Vuna.Ir.Codec.decIrCase", "Vuna/Ir/Codec.vuna:580"));
  ("Vuna_dIr_dCodec.v_decIrCase1", ("Vuna.Ir.Codec.decIrCase1", "Vuna/Ir/Codec.vuna:583"));
  ("Vuna_dIr_dCodec.v_decIrCase2", ("Vuna.Ir.Codec.decIrCase2", "Vuna/Ir/Codec.vuna:587"));
  ("Vuna_dIr_dCodec.v_decIrCase3", ("Vuna.Ir.Codec.decIrCase3", "Vuna/Ir/Codec.vuna:591"));
  ("Vuna_dIr_dCodec.v_decIrCast", ("Vuna.Ir.Codec.decIrCast", "Vuna/Ir/Codec.vuna:517"));
  ("Vuna_dIr_dCodec.v_decIrCast1", ("Vuna.Ir.Codec.decIrCast1", "Vuna/Ir/Codec.vuna:520"));
  ("Vuna_dIr_dCodec.v_decIrCast2", ("Vuna.Ir.Codec.decIrCast2", "Vuna/Ir/Codec.vuna:523"));
  ("Vuna_dIr_dCodec.v_decIrConcat", ("Vuna.Ir.Codec.decIrConcat", "Vuna/Ir/Codec.vuna:614"));
  ("Vuna_dIr_dCodec.v_decIrCtor", ("Vuna.Ir.Codec.decIrCtor", "Vuna/Ir/Codec.vuna:455"));
  ("Vuna_dIr_dCodec.v_decIrCtor1", ("Vuna.Ir.Codec.decIrCtor1", "Vuna/Ir/Codec.vuna:458"));
  ("Vuna_dIr_dCodec.v_decIrCtor2", ("Vuna.Ir.Codec.decIrCtor2", "Vuna/Ir/Codec.vuna:461"));
  ("Vuna_dIr_dCodec.v_decIrCtor3", ("Vuna.Ir.Codec.decIrCtor3", "Vuna/Ir/Codec.vuna:465"));
  ("Vuna_dIr_dCodec.v_decIrEffBind", ("Vuna.Ir.Codec.decIrEffBind", "Vuna/Ir/Codec.vuna:636"));
  ("Vuna_dIr_dCodec.v_decIrEffBind1", ("Vuna.Ir.Codec.decIrEffBind1", "Vuna/Ir/Codec.vuna:639"));
  ("Vuna_dIr_dCodec.v_decIrEffBind2", ("Vuna.Ir.Codec.decIrEffBind2", "Vuna/Ir/Codec.vuna:643"));
  ("Vuna_dIr_dCodec.v_decIrEffThunk", ("Vuna.Ir.Codec.decIrEffThunk", "Vuna/Ir/Codec.vuna:617"));
  ("Vuna_dIr_dCodec.v_decIrEffThunk1", ("Vuna.Ir.Codec.decIrEffThunk1", "Vuna/Ir/Codec.vuna:620"));
  ("Vuna_dIr_dCodec.v_decIrEffThunk2", ("Vuna.Ir.Codec.decIrEffThunk2", "Vuna/Ir/Codec.vuna:624"));
  ("Vuna_dIr_dCodec.v_decIrEffThunk3", ("Vuna.Ir.Codec.decIrEffThunk3", "Vuna/Ir/Codec.vuna:628"));
  ("Vuna_dIr_dCodec.v_decIrEffThunk4", ("Vuna.Ir.Codec.decIrEffThunk4", "Vuna/Ir/Codec.vuna:632"));
  ("Vuna_dIr_dCodec.v_decIrFloat", ("Vuna.Ir.Codec.decIrFloat", "Vuna/Ir/Codec.vuna:536"));
  ("Vuna_dIr_dCodec.v_decIrGlobal", ("Vuna.Ir.Codec.decIrGlobal", "Vuna/Ir/Codec.vuna:452"));
  ("Vuna_dIr_dCodec.v_decIrIf", ("Vuna.Ir.Codec.decIrIf", "Vuna/Ir/Codec.vuna:571"));
  ("Vuna_dIr_dCodec.v_decIrIf1", ("Vuna.Ir.Codec.decIrIf1", "Vuna/Ir/Codec.vuna:574"));
  ("Vuna_dIr_dCodec.v_decIrIf2", ("Vuna.Ir.Codec.decIrIf2", "Vuna/Ir/Codec.vuna:577"));
  ("Vuna_dIr_dCodec.v_decIrInt", ("Vuna.Ir.Codec.decIrInt", "Vuna/Ir/Codec.vuna:527"));
  ("Vuna_dIr_dCodec.v_decIrLam", ("Vuna.Ir.Codec.decIrLam", "Vuna/Ir/Codec.vuna:548"));
  ("Vuna_dIr_dCodec.v_decIrLam1", ("Vuna.Ir.Codec.decIrLam1", "Vuna/Ir/Codec.vuna:551"));
  ("Vuna_dIr_dCodec.v_decIrLam2", ("Vuna.Ir.Codec.decIrLam2", "Vuna/Ir/Codec.vuna:554"));
  ("Vuna_dIr_dCodec.v_decIrLet", ("Vuna.Ir.Codec.decIrLet", "Vuna/Ir/Codec.vuna:539"));
  ("Vuna_dIr_dCodec.v_decIrLet1", ("Vuna.Ir.Codec.decIrLet1", "Vuna/Ir/Codec.vuna:542"));
  ("Vuna_dIr_dCodec.v_decIrLet2", ("Vuna.Ir.Codec.decIrLet2", "Vuna/Ir/Codec.vuna:545"));
  ("Vuna_dIr_dCodec.v_decIrNatCase", ("Vuna.Ir.Codec.decIrNatCase", "Vuna/Ir/Codec.vuna:595"));
  ("Vuna_dIr_dCodec.v_decIrNatCase1", ("Vuna.Ir.Codec.decIrNatCase1", "Vuna/Ir/Codec.vuna:598"));
  ("Vuna_dIr_dCodec.v_decIrNatCase2", ("Vuna.Ir.Codec.decIrNatCase2", "Vuna/Ir/Codec.vuna:602"));
  ("Vuna_dIr_dCodec.v_decIrNatCase3", ("Vuna.Ir.Codec.decIrNatCase3", "Vuna/Ir/Codec.vuna:606"));
  ("Vuna_dIr_dCodec.v_decIrNatCase4", ("Vuna.Ir.Codec.decIrNatCase4", "Vuna/Ir/Codec.vuna:610"));
  ("Vuna_dIr_dCodec.v_decIrProj", ("Vuna.Ir.Codec.decIrProj", "Vuna/Ir/Codec.vuna:480"));
  ("Vuna_dIr_dCodec.v_decIrProj1", ("Vuna.Ir.Codec.decIrProj1", "Vuna/Ir/Codec.vuna:483"));
  ("Vuna_dIr_dCodec.v_decIrProj2", ("Vuna.Ir.Codec.decIrProj2", "Vuna/Ir/Codec.vuna:486"));
  ("Vuna_dIr_dCodec.v_decIrProj3", ("Vuna.Ir.Codec.decIrProj3", "Vuna/Ir/Codec.vuna:490"));
  ("Vuna_dIr_dCodec.v_decIrRecUpd", ("Vuna.Ir.Codec.decIrRecUpd", "Vuna/Ir/Codec.vuna:494"));
  ("Vuna_dIr_dCodec.v_decIrRecUpd1", ("Vuna.Ir.Codec.decIrRecUpd1", "Vuna/Ir/Codec.vuna:497"));
  ("Vuna_dIr_dCodec.v_decIrRecUpd2", ("Vuna.Ir.Codec.decIrRecUpd2", "Vuna/Ir/Codec.vuna:500"));
  ("Vuna_dIr_dCodec.v_decIrRecUpd3", ("Vuna.Ir.Codec.decIrRecUpd3", "Vuna/Ir/Codec.vuna:504"));
  ("Vuna_dIr_dCodec.v_decIrRecord", ("Vuna.Ir.Codec.decIrRecord", "Vuna/Ir/Codec.vuna:469"));
  ("Vuna_dIr_dCodec.v_decIrRecord1", ("Vuna.Ir.Codec.decIrRecord1", "Vuna/Ir/Codec.vuna:472"));
  ("Vuna_dIr_dCodec.v_decIrRecord2", ("Vuna.Ir.Codec.decIrRecord2", "Vuna/Ir/Codec.vuna:476"));
  ("Vuna_dIr_dCodec.v_decIrRt", ("Vuna.Ir.Codec.decIrRt", "Vuna/Ir/Codec.vuna:508"));
  ("Vuna_dIr_dCodec.v_decIrRtApp", ("Vuna.Ir.Codec.decIrRtApp", "Vuna/Ir/Codec.vuna:511"));
  ("Vuna_dIr_dCodec.v_decIrRtApp1", ("Vuna.Ir.Codec.decIrRtApp1", "Vuna/Ir/Codec.vuna:514"));
  ("Vuna_dIr_dCodec.v_decIrStr", ("Vuna.Ir.Codec.decIrStr", "Vuna/Ir/Codec.vuna:530"));
  ("Vuna_dIr_dCodec.v_decIrTag", ("Vuna.Ir.Codec.decIrTag", "Vuna/Ir/Codec.vuna:423"));
  ("Vuna_dIr_dCodec.v_decIrTail", ("Vuna.Ir.Codec.decIrTail", "Vuna/Ir/Codec.vuna:568"));
  ("Vuna_dIr_dCodec.v_decIrTy", ("Vuna.Ir.Codec.decIrTy", "Vuna/Ir/Codec.vuna:144"));
  ("Vuna_dIr_dCodec.v_decIrTyData", ("Vuna.Ir.Codec.decIrTyData", "Vuna/Ir/Codec.vuna:167"));
  ("Vuna_dIr_dCodec.v_decIrTyData1", ("Vuna.Ir.Codec.decIrTyData1", "Vuna/Ir/Codec.vuna:170"));
  ("Vuna_dIr_dCodec.v_decIrTyFun", ("Vuna.Ir.Codec.decIrTyFun", "Vuna/Ir/Codec.vuna:173"));
  ("Vuna_dIr_dCodec.v_decIrTyFun1", ("Vuna.Ir.Codec.decIrTyFun1", "Vuna/Ir/Codec.vuna:176"));
  ("Vuna_dIr_dCodec.v_decIrTyM", ("Vuna.Ir.Codec.decIrTyM", "Vuna/Ir/Codec.vuna:179"));
  ("Vuna_dIr_dCodec.v_decIrTyTag", ("Vuna.Ir.Codec.decIrTyTag", "Vuna/Ir/Codec.vuna:151"));
  ("Vuna_dIr_dCodec.v_decIrTyWrap", ("Vuna.Ir.Codec.decIrTyWrap", "Vuna/Ir/Codec.vuna:164"));
  ("Vuna_dIr_dCodec.v_decIrTys", ("Vuna.Ir.Codec.decIrTys", "Vuna/Ir/Codec.vuna:126"));
  ("Vuna_dIr_dCodec.v_decIrTysGo", ("Vuna.Ir.Codec.decIrTysGo", "Vuna/Ir/Codec.vuna:135"));
  ("Vuna_dIr_dCodec.v_decIrVar", ("Vuna.Ir.Codec.decIrVar", "Vuna/Ir/Codec.vuna:449"));
  ("Vuna_dIr_dCodec.v_decIrs", ("Vuna.Ir.Codec.decIrs", "Vuna/Ir/Codec.vuna:647"));
  ("Vuna_dIr_dCodec.v_decIrsGo", ("Vuna.Ir.Codec.decIrsGo", "Vuna/Ir/Codec.vuna:656"));
  ("Vuna_dIr_dCodec.v_decListFam", ("Vuna.Ir.Codec.decListFam", "Vuna/Ir/Codec.vuna:858"));
  ("Vuna_dIr_dCodec.v_decListFam1", ("Vuna.Ir.Codec.decListFam1", "Vuna/Ir/Codec.vuna:861"));
  ("Vuna_dIr_dCodec.v_decListFam2", ("Vuna.Ir.Codec.decListFam2", "Vuna/Ir/Codec.vuna:864"));
  ("Vuna_dIr_dCodec.v_decNamedInt", ("Vuna.Ir.Codec.decNamedInt", "Vuna/Ir/Codec.vuna:873"));
  ("Vuna_dIr_dCodec.v_decShared", ("Vuna.Ir.Codec.decShared", "Vuna/Ir/Codec.vuna:887"));
  ("Vuna_dIr_dCodec.v_decShared1", ("Vuna.Ir.Codec.decShared1", "Vuna/Ir/Codec.vuna:893"));
  ("Vuna_dIr_dCodec.v_decShared2", ("Vuna.Ir.Codec.decShared2", "Vuna/Ir/Codec.vuna:897"));
  ("Vuna_dIr_dCodec.v_decShared3", ("Vuna.Ir.Codec.decShared3", "Vuna/Ir/Codec.vuna:901"));
  ("Vuna_dIr_dCodec.v_decShared4", ("Vuna.Ir.Codec.decShared4", "Vuna/Ir/Codec.vuna:907"));
  ("Vuna_dIr_dCodec.v_decShared5", ("Vuna.Ir.Codec.decShared5", "Vuna/Ir/Codec.vuna:913"));
  ("Vuna_dIr_dCodec.v_decShared6", ("Vuna.Ir.Codec.decShared6", "Vuna/Ir/Codec.vuna:919"));
  ("Vuna_dIr_dCodec.v_decShared7", ("Vuna.Ir.Codec.decShared7", "Vuna/Ir/Codec.vuna:925"));
  ("Vuna_dIr_dCodec.v_decSpan", ("Vuna.Ir.Codec.decSpan", "Vuna/Ir/Codec.vuna:58"));
  ("Vuna_dIr_dCodec.v_decSpan1", ("Vuna.Ir.Codec.decSpan1", "Vuna/Ir/Codec.vuna:61"));
  ("Vuna_dIr_dCodec.v_decSpan2", ("Vuna.Ir.Codec.decSpan2", "Vuna/Ir/Codec.vuna:64"));
  ("Vuna_dIr_dCodec.v_decSpan3", ("Vuna.Ir.Codec.decSpan3", "Vuna/Ir/Codec.vuna:67"));
  ("Vuna_dIr_dCodec.v_decSpan4", ("Vuna.Ir.Codec.decSpan4", "Vuna/Ir/Codec.vuna:70"));
  ("Vuna_dIr_dCodec.v_decSpan5", ("Vuna.Ir.Codec.decSpan5", "Vuna/Ir/Codec.vuna:74"));
  ("Vuna_dIr_dCodec.v_decSpan6", ("Vuna.Ir.Codec.decSpan6", "Vuna/Ir/Codec.vuna:78"));
  ("Vuna_dIr_dCodec.v_decSpanM", ("Vuna.Ir.Codec.decSpanM", "Vuna/Ir/Codec.vuna:82"));
  ("Vuna_dIr_dCodec.v_decStrs", ("Vuna.Ir.Codec.decStrs", "Vuna/Ir/Codec.vuna:39"));
  ("Vuna_dIr_dCodec.v_decTyDecl", ("Vuna.Ir.Codec.decTyDecl", "Vuna/Ir/Codec.vuna:678"));
  ("Vuna_dIr_dCodec.v_decTyDeclRecord", ("Vuna.Ir.Codec.decTyDeclRecord", "Vuna/Ir/Codec.vuna:704"));
  ("Vuna_dIr_dCodec.v_decTyDeclRecord1", ("Vuna.Ir.Codec.decTyDeclRecord1", "Vuna/Ir/Codec.vuna:707"));
  ("Vuna_dIr_dCodec.v_decTyDeclRecord2", ("Vuna.Ir.Codec.decTyDeclRecord2", "Vuna/Ir/Codec.vuna:711"));
  ("Vuna_dIr_dCodec.v_decTyDeclRecord3", ("Vuna.Ir.Codec.decTyDeclRecord3", "Vuna/Ir/Codec.vuna:717"));
  ("Vuna_dIr_dCodec.v_decTyDeclTag", ("Vuna.Ir.Codec.decTyDeclTag", "Vuna/Ir/Codec.vuna:685"));
  ("Vuna_dIr_dCodec.v_decTyDeclUnboxed", ("Vuna.Ir.Codec.decTyDeclUnboxed", "Vuna/Ir/Codec.vuna:721"));
  ("Vuna_dIr_dCodec.v_decTyDeclUnboxed1", ("Vuna.Ir.Codec.decTyDeclUnboxed1", "Vuna/Ir/Codec.vuna:724"));
  ("Vuna_dIr_dCodec.v_decTyDeclUnboxed2", ("Vuna.Ir.Codec.decTyDeclUnboxed2", "Vuna/Ir/Codec.vuna:728"));
  ("Vuna_dIr_dCodec.v_decTyDeclVariant", ("Vuna.Ir.Codec.decTyDeclVariant", "Vuna/Ir/Codec.vuna:691"));
  ("Vuna_dIr_dCodec.v_decTyDeclVariant1", ("Vuna.Ir.Codec.decTyDeclVariant1", "Vuna/Ir/Codec.vuna:694"));
  ("Vuna_dIr_dCodec.v_decTyDeclVariant2", ("Vuna.Ir.Codec.decTyDeclVariant2", "Vuna/Ir/Codec.vuna:698"));
  ("Vuna_dIr_dCodec.v_decUnit", ("Vuna.Ir.Codec.decUnit", "Vuna/Ir/Codec.vuna:944"));
  ("Vuna_dIr_dCodec.v_decUnit1", ("Vuna.Ir.Codec.decUnit1", "Vuna/Ir/Codec.vuna:947"));
  ("Vuna_dIr_dCodec.v_decUnit2", ("Vuna.Ir.Codec.decUnit2", "Vuna/Ir/Codec.vuna:951"));
  ("Vuna_dIr_dCodec.v_decUnit3", ("Vuna.Ir.Codec.decUnit3", "Vuna/Ir/Codec.vuna:957"));
  ("Vuna_dIr_dCodec.v_decUnit4", ("Vuna.Ir.Codec.decUnit4", "Vuna/Ir/Codec.vuna:963"));
  ("Vuna_dIr_dCodec.v_decodeProgram", ("Vuna.Ir.Codec.decodeProgram", "Vuna/Ir/Codec.vuna:979"));
  ("Vuna_dIr_dCodec.v_decodeUnit", ("Vuna.Ir.Codec.decodeUnit", "Vuna/Ir/Codec.vuna:995"));
  ("Vuna_dIr_dCodec.v_encAlt", ("Vuna.Ir.Codec.encAlt", "Vuna/Ir/Codec.vuna:243"));
  ("Vuna_dIr_dCodec.v_encAltM", ("Vuna.Ir.Codec.encAltM", "Vuna/Ir/Codec.vuna:290"));
  ("Vuna_dIr_dCodec.v_encAlts", ("Vuna.Ir.Codec.encAlts", "Vuna/Ir/Codec.vuna:260"));
  ("Vuna_dIr_dCodec.v_encAltsGo", ("Vuna.Ir.Codec.encAltsGo", "Vuna/Ir/Codec.vuna:263"));
  ("Vuna_dIr_dCodec.v_encAppTy", ("Vuna.Ir.Codec.encAppTy", "Vuna/Ir/Codec.vuna:409"));
  ("Vuna_dIr_dCodec.v_encBName", ("Vuna.Ir.Codec.encBName", "Vuna/Ir/Codec.vuna:185"));
  ("Vuna_dIr_dCodec.v_encBinder", ("Vuna.Ir.Codec.encBinder", "Vuna/Ir/Codec.vuna:205"));
  ("Vuna_dIr_dCodec.v_encBinders", ("Vuna.Ir.Codec.encBinders", "Vuna/Ir/Codec.vuna:225"));
  ("Vuna_dIr_dCodec.v_encBindersGo", ("Vuna.Ir.Codec.encBindersGo", "Vuna/Ir/Codec.vuna:228"));
  ("Vuna_dIr_dCodec.v_encBools", ("Vuna.Ir.Codec.encBools", "Vuna/Ir/Codec.vuna:35"));
  ("Vuna_dIr_dCodec.v_encDef", ("Vuna.Ir.Codec.encDef", "Vuna/Ir/Codec.vuna:735"));
  ("Vuna_dIr_dCodec.v_encEntry", ("Vuna.Ir.Codec.encEntry", "Vuna/Ir/Codec.vuna:817"));
  ("Vuna_dIr_dCodec.v_encFields", ("Vuna.Ir.Codec.encFields", "Vuna/Ir/Codec.vuna:312"));
  ("Vuna_dIr_dCodec.v_encFieldsGo", ("Vuna.Ir.Codec.encFieldsGo", "Vuna/Ir/Codec.vuna:315"));
  ("Vuna_dIr_dCodec.v_encGroup", ("Vuna.Ir.Codec.encGroup", "Vuna/Ir/Codec.vuna:804"));
  ("Vuna_dIr_dCodec.v_encIr", ("Vuna.Ir.Codec.encIr", "Vuna/Ir/Codec.vuna:346"));
  ("Vuna_dIr_dCodec.v_encIrCases", ("Vuna.Ir.Codec.encIrCases", "Vuna/Ir/Codec.vuna:349"));
  ("Vuna_dIr_dCodec.v_encIrTy", ("Vuna.Ir.Codec.encIrTy", "Vuna/Ir/Codec.vuna:88"));
  ("Vuna_dIr_dCodec.v_encIrTyM", ("Vuna.Ir.Codec.encIrTyM", "Vuna/Ir/Codec.vuna:117"));
  ("Vuna_dIr_dCodec.v_encIrTys", ("Vuna.Ir.Codec.encIrTys", "Vuna/Ir/Codec.vuna:105"));
  ("Vuna_dIr_dCodec.v_encIrTysGo", ("Vuna.Ir.Codec.encIrTysGo", "Vuna/Ir/Codec.vuna:108"));
  ("Vuna_dIr_dCodec.v_encIrs", ("Vuna.Ir.Codec.encIrs", "Vuna/Ir/Codec.vuna:397"));
  ("Vuna_dIr_dCodec.v_encIrsGo", ("Vuna.Ir.Codec.encIrsGo", "Vuna/Ir/Codec.vuna:400"));
  ("Vuna_dIr_dCodec.v_encListFam", ("Vuna.Ir.Codec.encListFam", "Vuna/Ir/Codec.vuna:855"));
  ("Vuna_dIr_dCodec.v_encShared", ("Vuna.Ir.Codec.encShared", "Vuna/Ir/Codec.vuna:880"));
  ("Vuna_dIr_dCodec.v_encSpan", ("Vuna.Ir.Codec.encSpan", "Vuna/Ir/Codec.vuna:49"));
  ("Vuna_dIr_dCodec.v_encSpanM", ("Vuna.Ir.Codec.encSpanM", "Vuna/Ir/Codec.vuna:55"));
  ("Vuna_dIr_dCodec.v_encStrs", ("Vuna.Ir.Codec.encStrs", "Vuna/Ir/Codec.vuna:31"));
  ("Vuna_dIr_dCodec.v_encTyDecl", ("Vuna.Ir.Codec.encTyDecl", "Vuna/Ir/Codec.vuna:668"));
  ("Vuna_dIr_dCodec.v_encUnit", ("Vuna.Ir.Codec.encUnit", "Vuna/Ir/Codec.vuna:934"));
  ("Vuna_dIr_dCodec.v_encodeProgram", ("Vuna.Ir.Codec.encodeProgram", "Vuna/Ir/Codec.vuna:974"));
  ("Vuna_dIr_dCodec.v_encodeUnit", ("Vuna.Ir.Codec.encodeUnit", "Vuna/Ir/Codec.vuna:991"));
  ("Vuna_dIr_dCodec.v_irEncoderFuel", ("Vuna.Ir.Codec.irEncoderFuel", "Vuna/Ir/Codec.vuna:970"));
  ("Vuna_dIr_dDispatch.v_argCount", ("Vuna.Ir.Dispatch.argCount", "Vuna/Ir/Dispatch.vuna:53"));
  ("Vuna_dIr_dDispatch.v_buildSpine", ("Vuna.Ir.Dispatch.buildSpine", "Vuna/Ir/Dispatch.vuna:49"));
  ("Vuna_dIr_dDispatch.v_dispatch", ("Vuna.Ir.Dispatch.dispatch", "Vuna/Ir/Dispatch.vuna:87"));
  ("Vuna_dIr_dDispatch.v_dispatchAlt", ("Vuna.Ir.Dispatch.dispatchAlt", "Vuna/Ir/Dispatch.vuna:146"));
  ("Vuna_dIr_dDispatch.v_dispatchAltM", ("Vuna.Ir.Dispatch.dispatchAltM", "Vuna/Ir/Dispatch.vuna:150"));
  ("Vuna_dIr_dDispatch.v_dispatchAlts", ("Vuna.Ir.Dispatch.dispatchAlts", "Vuna/Ir/Dispatch.vuna:159"));
  ("Vuna_dIr_dDispatch.v_dispatchDef", ("Vuna.Ir.Dispatch.dispatchDef", "Vuna/Ir/Dispatch.vuna:168"));
  ("Vuna_dIr_dDispatch.v_dispatchEntry", ("Vuna.Ir.Dispatch.dispatchEntry", "Vuna/Ir/Dispatch.vuna:176"));
  ("Vuna_dIr_dDispatch.v_dispatchEntryM", ("Vuna.Ir.Dispatch.dispatchEntryM", "Vuna/Ir/Dispatch.vuna:186"));
  ("Vuna_dIr_dDispatch.v_dispatchFields", ("Vuna.Ir.Dispatch.dispatchFields", "Vuna/Ir/Dispatch.vuna:137"));
  ("Vuna_dIr_dDispatch.v_dispatchFuelBase", ("Vuna.Ir.Dispatch.dispatchFuelBase", "Vuna/Ir/Dispatch.vuna:200"));
  ("Vuna_dIr_dDispatch.v_dispatchFuelOfBody", ("Vuna.Ir.Dispatch.dispatchFuelOfBody", "Vuna/Ir/Dispatch.vuna:203"));
  ("Vuna_dIr_dDispatch.v_dispatchGroup", ("Vuna.Ir.Dispatch.dispatchGroup", "Vuna/Ir/Dispatch.vuna:173"));
  ("Vuna_dIr_dDispatch.v_dispatchIdArg", ("Vuna.Ir.Dispatch.dispatchIdArg", "Vuna/Ir/Dispatch.vuna:58"));
  ("Vuna_dIr_dDispatch.v_dispatchIdNameOf", ("Vuna.Ir.Dispatch.dispatchIdNameOf", "Vuna/Ir/Dispatch.vuna:23"));
  ("Vuna_dIr_dDispatch.v_dispatchIdsUnit", ("Vuna.Ir.Dispatch.dispatchIdsUnit", "Vuna/Ir/Dispatch.vuna:191"));
  ("Vuna_dIr_dDispatch.v_dispatchList", ("Vuna.Ir.Dispatch.dispatchList", "Vuna/Ir/Dispatch.vuna:128"));
  ("Vuna_dIr_dDispatch.v_dispatchSpine", ("Vuna.Ir.Dispatch.dispatchSpine", "Vuna/Ir/Dispatch.vuna:64"));
  ("Vuna_dIr_dDispatch.v_dispatchSpineArgs", ("Vuna.Ir.Dispatch.dispatchSpineArgs", "Vuna/Ir/Dispatch.vuna:77"));
  ("Vuna_dIr_dDispatch.v_flattenSpine", ("Vuna.Ir.Dispatch.flattenSpine", "Vuna/Ir/Dispatch.vuna:42"));
  ("Vuna_dIr_dModel.v_allAnnotatableIrTys", ("Vuna.Ir.Model.allAnnotatableIrTys", "Vuna/Ir/Model.vuna:97"));
  ("Vuna_dIr_dModel.v_irAltBindersOf", ("Vuna.Ir.Model.irAltBindersOf", "Vuna/Ir/Model.vuna:533"));
  ("Vuna_dIr_dModel.v_irAltBodyOf", ("Vuna.Ir.Model.irAltBodyOf", "Vuna/Ir/Model.vuna:537"));
  ("Vuna_dIr_dModel.v_irAltCtorOf", ("Vuna.Ir.Model.irAltCtorOf", "Vuna/Ir/Model.vuna:529"));
  ("Vuna_dIr_dModel.v_irDefArity", ("Vuna.Ir.Model.irDefArity", "Vuna/Ir/Model.vuna:328"));
  ("Vuna_dIr_dModel.v_irDefBody", ("Vuna.Ir.Model.irDefBody", "Vuna/Ir/Model.vuna:340"));
  ("Vuna_dIr_dModel.v_irDefDeps", ("Vuna.Ir.Model.irDefDeps", "Vuna/Ir/Model.vuna:332"));
  ("Vuna_dIr_dModel.v_irDefExtern", ("Vuna.Ir.Model.irDefExtern", "Vuna/Ir/Model.vuna:344"));
  ("Vuna_dIr_dModel.v_irDefInitGuard", ("Vuna.Ir.Model.irDefInitGuard", "Vuna/Ir/Model.vuna:354"));
  ("Vuna_dIr_dModel.v_irDefName", ("Vuna.Ir.Model.irDefName", "Vuna/Ir/Model.vuna:324"));
  ("Vuna_dIr_dModel.v_irDefRecValueOk", ("Vuna.Ir.Model.irDefRecValueOk", "Vuna/Ir/Model.vuna:349"));
  ("Vuna_dIr_dModel.v_irDefSpan", ("Vuna.Ir.Model.irDefSpan", "Vuna/Ir/Model.vuna:358"));
  ("Vuna_dIr_dModel.v_irDefTy", ("Vuna.Ir.Model.irDefTy", "Vuna/Ir/Model.vuna:336"));
  ("Vuna_dIr_dModel.v_irEffMkCtor", ("Vuna.Ir.Model.irEffMkCtor", "Vuna/Ir/Model.vuna:294"));
  ("Vuna_dIr_dModel.v_irEffTypeName", ("Vuna.Ir.Model.irEffTypeName", "Vuna/Ir/Model.vuna:291"));
  ("Vuna_dIr_dModel.v_irEntryHandlersOf", ("Vuna.Ir.Model.irEntryHandlersOf", "Vuna/Ir/Model.vuna:557"));
  ("Vuna_dIr_dModel.v_irEntryIsActionOf", ("Vuna.Ir.Model.irEntryIsActionOf", "Vuna/Ir/Model.vuna:549"));
  ("Vuna_dIr_dModel.v_irEntryMainOf", ("Vuna.Ir.Model.irEntryMainOf", "Vuna/Ir/Model.vuna:545"));
  ("Vuna_dIr_dModel.v_irEntryRowTagsOf", ("Vuna.Ir.Model.irEntryRowTagsOf", "Vuna/Ir/Model.vuna:561"));
  ("Vuna_dIr_dModel.v_irEntryRunMainOf", ("Vuna.Ir.Model.irEntryRunMainOf", "Vuna/Ir/Model.vuna:553"));
  ("Vuna_dIr_dModel.v_irEntryShowOf", ("Vuna.Ir.Model.irEntryShowOf", "Vuna/Ir/Model.vuna:541"));
  ("Vuna_dIr_dModel.v_irGroupDefs", ("Vuna.Ir.Model.irGroupDefs", "Vuna/Ir/Model.vuna:370"));
  ("Vuna_dIr_dModel.v_irGroupIsRec", ("Vuna.Ir.Model.irGroupIsRec", "Vuna/Ir/Model.vuna:367"));
  ("Vuna_dIr_dModel.v_irInlineArity", ("Vuna.Ir.Model.irInlineArity", "Vuna/Ir/Model.vuna:466"));
  ("Vuna_dIr_dModel.v_irLamTyFuel", ("Vuna.Ir.Model.irLamTyFuel", "Vuna/Ir/Model.vuna:272"));
  ("Vuna_dIr_dModel.v_irListConsOf", ("Vuna.Ir.Model.irListConsOf", "Vuna/Ir/Model.vuna:525"));
  ("Vuna_dIr_dModel.v_irListFamilyOf", ("Vuna.Ir.Model.irListFamilyOf", "Vuna/Ir/Model.vuna:517"));
  ("Vuna_dIr_dModel.v_irListNilOf", ("Vuna.Ir.Model.irListNilOf", "Vuna/Ir/Model.vuna:521"));
  ("Vuna_dIr_dModel.v_irProgSharedOf", ("Vuna.Ir.Model.irProgSharedOf", "Vuna/Ir/Model.vuna:565"));
  ("Vuna_dIr_dModel.v_irProgUnitOf", ("Vuna.Ir.Model.irProgUnitOf", "Vuna/Ir/Model.vuna:569"));
  ("Vuna_dIr_dModel.v_irResultTyFuel", ("Vuna.Ir.Model.irResultTyFuel", "Vuna/Ir/Model.vuna:240"));
  ("Vuna_dIr_dModel.v_irResultTyOf", ("Vuna.Ir.Model.irResultTyOf", "Vuna/Ir/Model.vuna:237"));
  ("Vuna_dIr_dModel.v_irSharedCtorShapeOf", ("Vuna.Ir.Model.irSharedCtorShapeOf", "Vuna/Ir/Model.vuna:434"));
  ("Vuna_dIr_dModel.v_irSharedRecordFieldsOf", ("Vuna.Ir.Model.irSharedRecordFieldsOf", "Vuna/Ir/Model.vuna:439"));
  ("Vuna_dIr_dModel.v_irSharedUnboxedOf", ("Vuna.Ir.Model.irSharedUnboxedOf", "Vuna/Ir/Model.vuna:429"));
  ("Vuna_dIr_dModel.v_irSize", ("Vuna.Ir.Model.irSize", "Vuna/Ir/Model.vuna:576"));
  ("Vuna_dIr_dModel.v_irSizeAlt", ("Vuna.Ir.Model.irSizeAlt", "Vuna/Ir/Model.vuna:611"));
  ("Vuna_dIr_dModel.v_irSizeAlts", ("Vuna.Ir.Model.irSizeAlts", "Vuna/Ir/Model.vuna:607"));
  ("Vuna_dIr_dModel.v_irSizeChildren", ("Vuna.Ir.Model.irSizeChildren", "Vuna/Ir/Model.vuna:580"));
  ("Vuna_dIr_dModel.v_irSizeFields", ("Vuna.Ir.Model.irSizeFields", "Vuna/Ir/Model.vuna:603"));
  ("Vuna_dIr_dModel.v_irSizeList", ("Vuna.Ir.Model.irSizeList", "Vuna/Ir/Model.vuna:599"));
  ("Vuna_dIr_dModel.v_irTyAnnotatable", ("Vuna.Ir.Model.irTyAnnotatable", "Vuna/Ir/Model.vuna:85"));
  ("Vuna_dIr_dModel.v_irTyAt", ("Vuna.Ir.Model.irTyAt", "Vuna/Ir/Model.vuna:78"));
  ("Vuna_dIr_dModel.v_irTyDataArgsOf", ("Vuna.Ir.Model.irTyDataArgsOf", "Vuna/Ir/Model.vuna:73"));
  ("Vuna_dIr_dModel.v_irTySubstVars", ("Vuna.Ir.Model.irTySubstVars", "Vuna/Ir/Model.vuna:56"));
  ("Vuna_dIr_dModel.v_irTyVarAt", ("Vuna.Ir.Model.irTyVarAt", "Vuna/Ir/Model.vuna:68"));
  ("Vuna_dIr_dModel.v_mkIrBinder", ("Vuna.Ir.Model.mkIrBinder", "Vuna/Ir/Model.vuna:134"));
  ("Vuna_dIr_dModel.v_mkIrBinderArm", ("Vuna.Ir.Model.mkIrBinderArm", "Vuna/Ir/Model.vuna:150"));
  ("Vuna_dIr_dModel.v_mkIrBinderErased", ("Vuna.Ir.Model.mkIrBinderErased", "Vuna/Ir/Model.vuna:146"));
  ("Vuna_dIr_dModel.v_mkIrBinderNat", ("Vuna.Ir.Model.mkIrBinderNat", "Vuna/Ir/Model.vuna:154"));
  ("Vuna_dIr_dModel.v_mkIrBinderOpaque", ("Vuna.Ir.Model.mkIrBinderOpaque", "Vuna/Ir/Model.vuna:142"));
  ("Vuna_dIr_dModel.v_mkIrBinderTyped", ("Vuna.Ir.Model.mkIrBinderTyped", "Vuna/Ir/Model.vuna:138"));
  ("Vuna_dIr_dModel.v_mkIrBinderWild", ("Vuna.Ir.Model.mkIrBinderWild", "Vuna/Ir/Model.vuna:158"));
  ("Vuna_dIr_dModel.v_sameBinderId", ("Vuna.Ir.Model.sameBinderId", "Vuna/Ir/Model.vuna:130"));
  ("Vuna_dIr_dRepresent.v_allCatchAll", ("Vuna.Ir.Represent.allCatchAll", "Vuna/Ir/Represent.vuna:94"));
  ("Vuna_dIr_dRepresent.v_representAlt", ("Vuna.Ir.Represent.representAlt", "Vuna/Ir/Represent.vuna:101"));
  ("Vuna_dIr_dRepresent.v_representAltIr", ("Vuna.Ir.Represent.representAltIr", "Vuna/Ir/Represent.vuna:105"));
  ("Vuna_dIr_dRepresent.v_representCase", ("Vuna.Ir.Represent.representCase", "Vuna/Ir/Represent.vuna:76"));
  ("Vuna_dIr_dRepresent.v_representDef", ("Vuna.Ir.Represent.representDef", "Vuna/Ir/Represent.vuna:27"));
  ("Vuna_dIr_dRepresent.v_representGroup", ("Vuna.Ir.Represent.representGroup", "Vuna/Ir/Represent.vuna:24"));
  ("Vuna_dIr_dRepresent.v_representIr", ("Vuna.Ir.Represent.representIr", "Vuna/Ir/Represent.vuna:32"));
  ("Vuna_dIr_dRepresent.v_representUnit", ("Vuna.Ir.Represent.representUnit", "Vuna/Ir/Represent.vuna:15"));
  ("Vuna_dIr_dRuntime.v_irListLength", ("Vuna.Ir.Runtime.irListLength", "Vuna/Ir/Runtime.vuna:301"));
  ("Vuna_dIr_dRuntime.v_irRtBridgedNames", ("Vuna.Ir.Runtime.irRtBridgedNames", "Vuna/Ir/Runtime.vuna:242"));
  ("Vuna_dIr_dRuntime.v_irRtBridgesList", ("Vuna.Ir.Runtime.irRtBridgesList", "Vuna/Ir/Runtime.vuna:288"));
  ("Vuna_dIr_dRuntime.v_irRtContract", ("Vuna.Ir.Runtime.irRtContract", "Vuna/Ir/Runtime.vuna:266"));
  ("Vuna_dIr_dRuntime.v_irRtIsKnown", ("Vuna.Ir.Runtime.irRtIsKnown", "Vuna/Ir/Runtime.vuna:281"));
  ("Vuna_dIr_dRuntime.v_irRtLookup", ("Vuna.Ir.Runtime.irRtLookup", "Vuna/Ir/Runtime.vuna:277"));
  ("Vuna_dIr_dRuntime.v_irRtLookupGo", ("Vuna.Ir.Runtime.irRtLookupGo", "Vuna/Ir/Runtime.vuna:272"));
  ("Vuna_dIr_dRuntime.v_irRtNames", ("Vuna.Ir.Runtime.irRtNames", "Vuna/Ir/Runtime.vuna:262"));
  ("Vuna_dIr_dRuntime.v_irRtNatSucc", ("Vuna.Ir.Runtime.irRtNatSucc", "Vuna/Ir/Runtime.vuna:49"));
  ("Vuna_dIr_dRuntime.v_irRtPlainNames", ("Vuna.Ir.Runtime.irRtPlainNames", "Vuna/Ir/Runtime.vuna:73"));
  ("Vuna_dIr_dRuntime.v_irRtShowBool", ("Vuna.Ir.Runtime.irRtShowBool", "Vuna/Ir/Runtime.vuna:64"));
  ("Vuna_dIr_dRuntime.v_irRtShowFloat", ("Vuna.Ir.Runtime.irRtShowFloat", "Vuna/Ir/Runtime.vuna:61"));
  ("Vuna_dIr_dRuntime.v_irRtShowInt", ("Vuna.Ir.Runtime.irRtShowInt", "Vuna/Ir/Runtime.vuna:52"));
  ("Vuna_dIr_dRuntime.v_irRtShowNat", ("Vuna.Ir.Runtime.irRtShowNat", "Vuna/Ir/Runtime.vuna:55"));
  ("Vuna_dIr_dRuntime.v_irRtShowStr", ("Vuna.Ir.Runtime.irRtShowStr", "Vuna/Ir/Runtime.vuna:58"));
  ("Vuna_dIr_dRuntime.v_irRtSymBridgesOf", ("Vuna.Ir.Runtime.irRtSymBridgesOf", "Vuna/Ir/Runtime.vuna:44"));
  ("Vuna_dIr_dRuntime.v_irRtSymNameOf", ("Vuna.Ir.Runtime.irRtSymNameOf", "Vuna/Ir/Runtime.vuna:40"));
  ("Vuna_dIr_dRuntime.v_irRtSyntheticNames", ("Vuna.Ir.Runtime.irRtSyntheticNames", "Vuna/Ir/Runtime.vuna:68"));
  ("Vuna_dIr_dRuntime.v_irSymbolsOf", ("Vuna.Ir.Runtime.irSymbolsOf", "Vuna/Ir/Runtime.vuna:306"));
  ("Vuna_dIr_dRuntime.v_irSymbolsOfAlt", ("Vuna.Ir.Runtime.irSymbolsOfAlt", "Vuna/Ir/Runtime.vuna:339"));
  ("Vuna_dIr_dRuntime.v_irSymbolsOfAltMaybe", ("Vuna.Ir.Runtime.irSymbolsOfAltMaybe", "Vuna/Ir/Runtime.vuna:342"));
  ("Vuna_dIr_dRuntime.v_irSymbolsOfDef", ("Vuna.Ir.Runtime.irSymbolsOfDef", "Vuna/Ir/Runtime.vuna:346"));
  ("Vuna_dIr_dRuntime.v_irSymbolsOfEntry", ("Vuna.Ir.Runtime.irSymbolsOfEntry", "Vuna/Ir/Runtime.vuna:359"));
  ("Vuna_dIr_dRuntime.v_irSymbolsOfField", ("Vuna.Ir.Runtime.irSymbolsOfField", "Vuna/Ir/Runtime.vuna:336"));
  ("Vuna_dIr_dRuntime.v_irSymbolsOfUnit", ("Vuna.Ir.Runtime.irSymbolsOfUnit", "Vuna/Ir/Runtime.vuna:353"));
  ("Vuna_dIr_dValidate.v_altBodies", ("Vuna.Ir.Validate.altBodies", "Vuna/Ir/Validate.vuna:460"));
  ("Vuna_dIr_dValidate.v_altWork", ("Vuna.Ir.Validate.altWork", "Vuna/Ir/Validate.vuna:432"));
  ("Vuna_dIr_dValidate.v_anyErasedBinder", ("Vuna.Ir.Validate.anyErasedBinder", "Vuna/Ir/Validate.vuna:242"));
  ("Vuna_dIr_dValidate.v_checkAltBinderTys", ("Vuna.Ir.Validate.checkAltBinderTys", "Vuna/Ir/Validate.vuna:280"));
  ("Vuna_dIr_dValidate.v_checkAltBinderTysM", ("Vuna.Ir.Validate.checkAltBinderTysM", "Vuna/Ir/Validate.vuna:287"));
  ("Vuna_dIr_dValidate.v_checkAppTy", ("Vuna.Ir.Validate.checkAppTy", "Vuna/Ir/Validate.vuna:188"));
  ("Vuna_dIr_dValidate.v_checkBinderIds", ("Vuna.Ir.Validate.checkBinderIds", "Vuna/Ir/Validate.vuna:251"));
  ("Vuna_dIr_dValidate.v_checkBinderTys", ("Vuna.Ir.Validate.checkBinderTys", "Vuna/Ir/Validate.vuna:106"));
  ("Vuna_dIr_dValidate.v_checkBinderTysList", ("Vuna.Ir.Validate.checkBinderTysList", "Vuna/Ir/Validate.vuna:268"));
  ("Vuna_dIr_dValidate.v_checkBinderTysOf", ("Vuna.Ir.Validate.checkBinderTysOf", "Vuna/Ir/Validate.vuna:246"));
  ("Vuna_dIr_dValidate.v_checkBinderTysWork", ("Vuna.Ir.Validate.checkBinderTysWork", "Vuna/Ir/Validate.vuna:151"));
  ("Vuna_dIr_dValidate.v_checkCtorArity", ("Vuna.Ir.Validate.checkCtorArity", "Vuna/Ir/Validate.vuna:216"));
  ("Vuna_dIr_dValidate.v_checkCtorTys", ("Vuna.Ir.Validate.checkCtorTys", "Vuna/Ir/Validate.vuna:195"));
  ("Vuna_dIr_dValidate.v_checkDeclCtorSlots", ("Vuna.Ir.Validate.checkDeclCtorSlots", "Vuna/Ir/Validate.vuna:348"));
  ("Vuna_dIr_dValidate.v_checkDeclSlots", ("Vuna.Ir.Validate.checkDeclSlots", "Vuna/Ir/Validate.vuna:343"));
  ("Vuna_dIr_dValidate.v_checkDefArityVsSig", ("Vuna.Ir.Validate.checkDefArityVsSig", "Vuna/Ir/Validate.vuna:122"));
  ("Vuna_dIr_dValidate.v_checkDefTy", ("Vuna.Ir.Validate.checkDefTy", "Vuna/Ir/Validate.vuna:144"));
  ("Vuna_dIr_dValidate.v_checkGroupOrder", ("Vuna.Ir.Validate.checkGroupOrder", "Vuna/Ir/Validate.vuna:33"));
  ("Vuna_dIr_dValidate.v_checkGroupOrderGo", ("Vuna.Ir.Validate.checkGroupOrderGo", "Vuna/Ir/Validate.vuna:36"));
  ("Vuna_dIr_dValidate.v_checkIrTyM", ("Vuna.Ir.Validate.checkIrTyM", "Vuna/Ir/Validate.vuna:232"));
  ("Vuna_dIr_dValidate.v_checkNodeBinderTys", ("Vuna.Ir.Validate.checkNodeBinderTys", "Vuna/Ir/Validate.vuna:160"));
  ("Vuna_dIr_dValidate.v_checkNodeTy", ("Vuna.Ir.Validate.checkNodeTy", "Vuna/Ir/Validate.vuna:238"));
  ("Vuna_dIr_dValidate.v_checkScopedDefs", ("Vuna.Ir.Validate.checkScopedDefs", "Vuna/Ir/Validate.vuna:380"));
  ("Vuna_dIr_dValidate.v_checkScopedUnit", ("Vuna.Ir.Validate.checkScopedUnit", "Vuna/Ir/Validate.vuna:377"));
  ("Vuna_dIr_dValidate.v_checkScopedWork", ("Vuna.Ir.Validate.checkScopedWork", "Vuna/Ir/Validate.vuna:393"));
  ("Vuna_dIr_dValidate.v_checkSymbolRefs", ("Vuna.Ir.Validate.checkSymbolRefs", "Vuna/Ir/Validate.vuna:71"));
  ("Vuna_dIr_dValidate.v_checkTyArity", ("Vuna.Ir.Validate.checkTyArity", "Vuna/Ir/Validate.vuna:291"));
  ("Vuna_dIr_dValidate.v_checkTyArityIn", ("Vuna.Ir.Validate.checkTyArityIn", "Vuna/Ir/Validate.vuna:296"));
  ("Vuna_dIr_dValidate.v_checkTyArityList", ("Vuna.Ir.Validate.checkTyArityList", "Vuna/Ir/Validate.vuna:323"));
  ("Vuna_dIr_dValidate.v_checkTyArityListIn", ("Vuna.Ir.Validate.checkTyArityListIn", "Vuna/Ir/Validate.vuna:326"));
  ("Vuna_dIr_dValidate.v_checkTyArityListM", ("Vuna.Ir.Validate.checkTyArityListM", "Vuna/Ir/Validate.vuna:210"));
  ("Vuna_dIr_dValidate.v_countKeptFlags", ("Vuna.Ir.Validate.countKeptFlags", "Vuna/Ir/Validate.vuna:228"));
  ("Vuna_dIr_dValidate.v_firstMissingDep", ("Vuna.Ir.Validate.firstMissingDep", "Vuna/Ir/Validate.vuna:58"));
  ("Vuna_dIr_dValidate.v_firstUnorderedDep", ("Vuna.Ir.Validate.firstUnorderedDep", "Vuna/Ir/Validate.vuna:48"));
  ("Vuna_dIr_dValidate.v_firstUnorderedDepGo", ("Vuna.Ir.Validate.firstUnorderedDepGo", "Vuna/Ir/Validate.vuna:51"));
  ("Vuna_dIr_dValidate.v_irChildren", ("Vuna.Ir.Validate.irChildren", "Vuna/Ir/Validate.vuna:439"));
  ("Vuna_dIr_dValidate.v_irTyArrowArity", ("Vuna.Ir.Validate.irTyArrowArity", "Vuna/Ir/Validate.vuna:140"));
  ("Vuna_dIr_dValidate.v_listLength", ("Vuna.Ir.Validate.listLength", "Vuna/Ir/Validate.vuna:364"));
  ("Vuna_dIr_dValidate.v_maybeAltBodies", ("Vuna.Ir.Validate.maybeAltBodies", "Vuna/Ir/Validate.vuna:464"));
  ("Vuna_dIr_dValidate.v_maybeAlts", ("Vuna.Ir.Validate.maybeAlts", "Vuna/Ir/Validate.vuna:428"));
  ("Vuna_dIr_dValidate.v_memBinder", ("Vuna.Ir.Validate.memBinder", "Vuna/Ir/Validate.vuna:468"));
  ("Vuna_dIr_dValidate.v_memBinderId", ("Vuna.Ir.Validate.memBinderId", "Vuna/Ir/Validate.vuna:263"));
  ("Vuna_dIr_dValidate.v_sameBinder", ("Vuna.Ir.Validate.sameBinder", "Vuna/Ir/Validate.vuna:472"));
  ("Vuna_dIr_dValidate.v_scopedChildren", ("Vuna.Ir.Validate.scopedChildren", "Vuna/Ir/Validate.vuna:406"));
  ("Vuna_dIr_dValidate.v_scopedFuelOf", ("Vuna.Ir.Validate.scopedFuelOf", "Vuna/Ir/Validate.vuna:390"));
  ("Vuna_dIr_dValidate.v_tyDeclArityOf", ("Vuna.Ir.Validate.tyDeclArityOf", "Vuna/Ir/Validate.vuna:355"));
  ("Vuna_dIr_dValidate.v_validateProgram", ("Vuna.Ir.Validate.validateProgram", "Vuna/Ir/Validate.vuna:87"));
  ("Vuna_dIr_dValidate.v_validateTyDecls", ("Vuna.Ir.Validate.validateTyDecls", "Vuna/Ir/Validate.vuna:335"));
  ("Vuna_dIr_dValidate.v_validateTyDeclsGo", ("Vuna.Ir.Validate.validateTyDeclsGo", "Vuna/Ir/Validate.vuna:338"));
  ("Vuna_dIr_dValidate.v_validateUnit", ("Vuna.Ir.Validate.validateUnit", "Vuna/Ir/Validate.vuna:23"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_addDep", ("Vuna.Target.Ocaml.Assembly.addDep", "Vuna/Target/Ocaml/Assembly.vuna:95"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_checkDefsForBuild", ("Vuna.Target.Ocaml.Assembly.checkDefsForBuild", "Vuna/Target/Ocaml/Assembly.vuna:79"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_checkGroupsForBuild", ("Vuna.Target.Ocaml.Assembly.checkGroupsForBuild", "Vuna/Target/Ocaml/Assembly.vuna:72"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_checkUnitParts", ("Vuna.Target.Ocaml.Assembly.checkUnitParts", "Vuna/Target/Ocaml/Assembly.vuna:69"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_genTypePart", ("Vuna.Target.Ocaml.Assembly.genTypePart", "Vuna/Target/Ocaml/Assembly.vuna:91"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_genUnitParts", ("Vuna.Target.Ocaml.Assembly.genUnitParts", "Vuna/Target/Ocaml/Assembly.vuna:46"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_genUnitPartsWith", ("Vuna.Target.Ocaml.Assembly.genUnitPartsWith", "Vuna/Target/Ocaml/Assembly.vuna:49"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_genUnitText", ("Vuna.Target.Ocaml.Assembly.genUnitText", "Vuna/Target/Ocaml/Assembly.vuna:103"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_listBridgeFor", ("Vuna.Target.Ocaml.Assembly.listBridgeFor", "Vuna/Target/Ocaml/Assembly.vuna:114"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_openHeader", ("Vuna.Target.Ocaml.Assembly.openHeader", "Vuna/Target/Ocaml/Assembly.vuna:110"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_runtimeUnit", ("Vuna.Target.Ocaml.Assembly.runtimeUnit", "Vuna/Target/Ocaml/Assembly.vuna:24"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_typeRefDeps", ("Vuna.Target.Ocaml.Assembly.typeRefDeps", "Vuna/Target/Ocaml/Assembly.vuna:120"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_uniqueDeps", ("Vuna.Target.Ocaml.Assembly.uniqueDeps", "Vuna/Target/Ocaml/Assembly.vuna:98"));
  ("Vuna_dTarget_dOcaml_dAssembly.v_unitPartsDeps", ("Vuna.Target.Ocaml.Assembly.unitPartsDeps", "Vuna/Target/Ocaml/Assembly.vuna:36"));
  ("Vuna_dTarget_dOcaml_dDecl.v_boolText", ("Vuna.Target.Ocaml.Decl.boolText", "Vuna/Target/Ocaml/Decl.vuna:77"));
  ("Vuna_dTarget_dOcaml_dDecl.v_ctorOcamlName", ("Vuna.Target.Ocaml.Decl.ctorOcamlName", "Vuna/Target/Ocaml/Decl.vuna:86"));
  ("Vuna_dTarget_dOcaml_dDecl.v_ctorShortName", ("Vuna.Target.Ocaml.Decl.ctorShortName", "Vuna/Target/Ocaml/Decl.vuna:24"));
  ("Vuna_dTarget_dOcaml_dDecl.v_irBinderText", ("Vuna.Target.Ocaml.Decl.irBinderText", "Vuna/Target/Ocaml/Decl.vuna:221"));
  ("Vuna_dTarget_dOcaml_dDecl.v_irTyDeclDeps", ("Vuna.Target.Ocaml.Decl.irTyDeclDeps", "Vuna/Target/Ocaml/Decl.vuna:267"));
  ("Vuna_dTarget_dOcaml_dDecl.v_irTyDepsGo", ("Vuna.Target.Ocaml.Decl.irTyDepsGo", "Vuna/Target/Ocaml/Decl.vuna:282"));
  ("Vuna_dTarget_dOcaml_dDecl.v_irTyGlobalNames", ("Vuna.Target.Ocaml.Decl.irTyGlobalNames", "Vuna/Target/Ocaml/Decl.vuna:270"));
  ("Vuna_dTarget_dOcaml_dDecl.v_irTyText", ("Vuna.Target.Ocaml.Decl.irTyText", "Vuna/Target/Ocaml/Decl.vuna:227"));
  ("Vuna_dTarget_dOcaml_dDecl.v_irTypeDeclsText", ("Vuna.Target.Ocaml.Decl.irTypeDeclsText", "Vuna/Target/Ocaml/Decl.vuna:263"));
  ("Vuna_dTarget_dOcaml_dDecl.v_isAsciiAlphaNum", ("Vuna.Target.Ocaml.Decl.isAsciiAlphaNum", "Vuna/Target/Ocaml/Decl.vuna:34"));
  ("Vuna_dTarget_dOcaml_dDecl.v_localName", ("Vuna.Target.Ocaml.Decl.localName", "Vuna/Target/Ocaml/Decl.vuna:69"));
  ("Vuna_dTarget_dOcaml_dDecl.v_noQual", ("Vuna.Target.Ocaml.Decl.noQual", "Vuna/Target/Ocaml/Decl.vuna:113"));
  ("Vuna_dTarget_dOcaml_dDecl.v_ocamlBinderName", ("Vuna.Target.Ocaml.Decl.ocamlBinderName", "Vuna/Target/Ocaml/Decl.vuna:208"));
  ("Vuna_dTarget_dOcaml_dDecl.v_ocamlEscapeChar", ("Vuna.Target.Ocaml.Decl.ocamlEscapeChar", "Vuna/Target/Ocaml/Decl.vuna:51"));
  ("Vuna_dTarget_dOcaml_dDecl.v_ocamlPad3", ("Vuna.Target.Ocaml.Decl.ocamlPad3", "Vuna/Target/Ocaml/Decl.vuna:48"));
  ("Vuna_dTarget_dOcaml_dDecl.v_ocamlReservedWords", ("Vuna.Target.Ocaml.Decl.ocamlReservedWords", "Vuna/Target/Ocaml/Decl.vuna:147"));
  ("Vuna_dTarget_dOcaml_dDecl.v_ocamlString", ("Vuna.Target.Ocaml.Decl.ocamlString", "Vuna/Target/Ocaml/Decl.vuna:59"));
  ("Vuna_dTarget_dOcaml_dDecl.v_qualCtorText", ("Vuna.Target.Ocaml.Decl.qualCtorText", "Vuna/Target/Ocaml/Decl.vuna:137"));
  ("Vuna_dTarget_dOcaml_dDecl.v_qualFamOf", ("Vuna.Target.Ocaml.Decl.qualFamOf", "Vuna/Target/Ocaml/Decl.vuna:231"));
  ("Vuna_dTarget_dOcaml_dDecl.v_qualOf", ("Vuna.Target.Ocaml.Decl.qualOf", "Vuna/Target/Ocaml/Decl.vuna:125"));
  ("Vuna_dTarget_dOcaml_dDecl.v_qualPrefix", ("Vuna.Target.Ocaml.Decl.qualPrefix", "Vuna/Target/Ocaml/Decl.vuna:129"));
  ("Vuna_dTarget_dOcaml_dDecl.v_qualTypeText", ("Vuna.Target.Ocaml.Decl.qualTypeText", "Vuna/Target/Ocaml/Decl.vuna:141"));
  ("Vuna_dTarget_dOcaml_dDecl.v_qualValueText", ("Vuna.Target.Ocaml.Decl.qualValueText", "Vuna/Target/Ocaml/Decl.vuna:134"));
  ("Vuna_dTarget_dOcaml_dDecl.v_recordFieldLabel", ("Vuna.Target.Ocaml.Decl.recordFieldLabel", "Vuna/Target/Ocaml/Decl.vuna:91"));
  ("Vuna_dTarget_dOcaml_dDecl.v_recordFieldsOf", ("Vuna.Target.Ocaml.Decl.recordFieldsOf", "Vuna/Target/Ocaml/Decl.vuna:255"));
  ("Vuna_dTarget_dOcaml_dDecl.v_sanitizeChar", ("Vuna.Target.Ocaml.Decl.sanitizeChar", "Vuna/Target/Ocaml/Decl.vuna:38"));
  ("Vuna_dTarget_dOcaml_dDecl.v_sanitizeName", ("Vuna.Target.Ocaml.Decl.sanitizeName", "Vuna/Target/Ocaml/Decl.vuna:45"));
  ("Vuna_dTarget_dOcaml_dDecl.v_toOCtor", ("Vuna.Target.Ocaml.Decl.toOCtor", "Vuna/Target/Ocaml/Decl.vuna:252"));
  ("Vuna_dTarget_dOcaml_dDecl.v_toODecl", ("Vuna.Target.Ocaml.Decl.toODecl", "Vuna/Target/Ocaml/Decl.vuna:246"));
  ("Vuna_dTarget_dOcaml_dDecl.v_toOTy", ("Vuna.Target.Ocaml.Decl.toOTy", "Vuna/Target/Ocaml/Decl.vuna:234"));
  ("Vuna_dTarget_dOcaml_dDecl.v_typeName", ("Vuna.Target.Ocaml.Decl.typeName", "Vuna/Target/Ocaml/Decl.vuna:82"));
  ("Vuna_dTarget_dOcaml_dDecl.v_unitOfTbl", ("Vuna.Target.Ocaml.Decl.unitOfTbl", "Vuna/Target/Ocaml/Decl.vuna:119"));
  ("Vuna_dTarget_dOcaml_dDecl.v_unitTblOf", ("Vuna.Target.Ocaml.Decl.unitTblOf", "Vuna/Target/Ocaml/Decl.vuna:116"));
  ("Vuna_dTarget_dOcaml_dDecl.v_valueName", ("Vuna.Target.Ocaml.Decl.valueName", "Vuna/Target/Ocaml/Decl.vuna:72"));
  ("Vuna_dTarget_dOcaml_dRender.v_binderText", ("Vuna.Target.Ocaml.Render.binderText", "Vuna/Target/Ocaml/Render.vuna:88"));
  ("Vuna_dTarget_dOcaml_dRender.v_ctorDecl", ("Vuna.Target.Ocaml.Render.ctorDecl", "Vuna/Target/Ocaml/Render.vuna:49"));
  ("Vuna_dTarget_dOcaml_dRender.v_familyTy", ("Vuna.Target.Ocaml.Render.familyTy", "Vuna/Target/Ocaml/Render.vuna:31"));
  ("Vuna_dTarget_dOcaml_dRender.v_fieldAssign", ("Vuna.Target.Ocaml.Render.fieldAssign", "Vuna/Target/Ocaml/Render.vuna:85"));
  ("Vuna_dTarget_dOcaml_dRender.v_fieldDecl", ("Vuna.Target.Ocaml.Render.fieldDecl", "Vuna/Target/Ocaml/Render.vuna:65"));
  ("Vuna_dTarget_dOcaml_dRender.v_interpose", ("Vuna.Target.Ocaml.Render.interpose", "Vuna/Target/Ocaml/Render.vuna:16"));
  ("Vuna_dTarget_dOcaml_dRender.v_joinWith", ("Vuna.Target.Ocaml.Render.joinWith", "Vuna/Target/Ocaml/Render.vuna:13"));
  ("Vuna_dTarget_dOcaml_dRender.v_recordField", ("Vuna.Target.Ocaml.Render.recordField", "Vuna/Target/Ocaml/Render.vuna:120"));
  ("Vuna_dTarget_dOcaml_dRender.v_recordFields", ("Vuna.Target.Ocaml.Render.recordFields", "Vuna/Target/Ocaml/Render.vuna:123"));
  ("Vuna_dTarget_dOcaml_dRender.v_renderArm", ("Vuna.Target.Ocaml.Render.renderArm", "Vuna/Target/Ocaml/Render.vuna:117"));
  ("Vuna_dTarget_dOcaml_dRender.v_renderDecl", ("Vuna.Target.Ocaml.Render.renderDecl", "Vuna/Target/Ocaml/Render.vuna:57"));
  ("Vuna_dTarget_dOcaml_dRender.v_renderDecls", ("Vuna.Target.Ocaml.Render.renderDecls", "Vuna/Target/Ocaml/Render.vuna:69"));
  ("Vuna_dTarget_dOcaml_dRender.v_renderPat", ("Vuna.Target.Ocaml.Render.renderPat", "Vuna/Target/Ocaml/Render.vuna:78"));
  ("Vuna_dTarget_dOcaml_dRender.v_renderTerm", ("Vuna.Target.Ocaml.Render.renderTerm", "Vuna/Target/Ocaml/Render.vuna:92"));
  ("Vuna_dTarget_dOcaml_dRender.v_renderTy", ("Vuna.Target.Ocaml.Render.renderTy", "Vuna/Target/Ocaml/Render.vuna:37"));
  ("Vuna_dTarget_dOcaml_dRender.v_typeParamDecl", ("Vuna.Target.Ocaml.Render.typeParamDecl", "Vuna/Target/Ocaml/Render.vuna:24"));
  ("Vuna_dTarget_dOcaml_dRender.v_typeParamName", ("Vuna.Target.Ocaml.Render.typeParamName", "Vuna/Target/Ocaml/Render.vuna:21"));
  ("Vuna_dTarget_dOcaml_dRuntime.v_ocamlRtHelperNames", ("Vuna.Target.Ocaml.Runtime.ocamlRtHelperNames", "Vuna/Target/Ocaml/Runtime.vuna:221"));
  ("Vuna_dTarget_dOcaml_dRuntime.v_ocamlRtText", ("Vuna.Target.Ocaml.Runtime.ocamlRtText", "Vuna/Target/Ocaml/Runtime.vuna:217"));
  ("Vuna_dTarget_dOcaml_dRuntime.v_ocamlRtTextTable", ("Vuna.Target.Ocaml.Runtime.ocamlRtTextTable", "Vuna/Target/Ocaml/Runtime.vuna:26"));
  ("Vuna_dTarget_dOcaml_dRuntime.v_rtTextExtra", ("Vuna.Target.Ocaml.Runtime.rtTextExtra", "Vuna/Target/Ocaml/Runtime.vuna:235"));
  ("Vuna_dTarget_dOcaml_dRuntime.v_rtTextExtras", ("Vuna.Target.Ocaml.Runtime.rtTextExtras", "Vuna/Target/Ocaml/Runtime.vuna:242"));
  ("Vuna_dTarget_dOcaml_dRuntime.v_rtTextGaps", ("Vuna.Target.Ocaml.Runtime.rtTextGaps", "Vuna/Target/Ocaml/Runtime.vuna:232"));
  ("Vuna_dTarget_dOcaml_dRuntime.v_rtTextMissing", ("Vuna.Target.Ocaml.Runtime.rtTextMissing", "Vuna/Target/Ocaml/Runtime.vuna:225"));
  ("Vuna_dTarget_dOcaml_dTerm.v_bindAndOf", ("Vuna.Target.Ocaml.Term.bindAndOf", "Vuna/Target/Ocaml/Term.vuna:2501"));
  ("Vuna_dTarget_dOcaml_dTerm.v_bindFirstOf", ("Vuna.Target.Ocaml.Term.bindFirstOf", "Vuna/Target/Ocaml/Term.vuna:2498"));
  ("Vuna_dTarget_dOcaml_dTerm.v_bindGroupOf", ("Vuna.Target.Ocaml.Term.bindGroupOf", "Vuna/Target/Ocaml/Term.vuna:2493"));
  ("Vuna_dTarget_dOcaml_dTerm.v_bindKeywordOf", ("Vuna.Target.Ocaml.Term.bindKeywordOf", "Vuna/Target/Ocaml/Term.vuna:2504"));
  ("Vuna_dTarget_dOcaml_dTerm.v_bridgeUnitOf", ("Vuna.Target.Ocaml.Term.bridgeUnitOf", "Vuna/Target/Ocaml/Term.vuna:1997"));
  ("Vuna_dTarget_dOcaml_dTerm.v_dtDefLocTable", ("Vuna.Target.Ocaml.Term.dtDefLocTable", "Vuna/Target/Ocaml/Term.vuna:1921"));
  ("Vuna_dTarget_dOcaml_dTerm.v_dtFloatRuntime", ("Vuna.Target.Ocaml.Term.dtFloatRuntime", "Vuna/Target/Ocaml/Term.vuna:1165"));
  ("Vuna_dTarget_dOcaml_dTerm.v_dtListBridge", ("Vuna.Target.Ocaml.Term.dtListBridge", "Vuna/Target/Ocaml/Term.vuna:1868"));
  ("Vuna_dTarget_dOcaml_dTerm.v_dtLogRuntime", ("Vuna.Target.Ocaml.Term.dtLogRuntime", "Vuna/Target/Ocaml/Term.vuna:1185"));
  ("Vuna_dTarget_dOcaml_dTerm.v_dtObsRuntime", ("Vuna.Target.Ocaml.Term.dtObsRuntime", "Vuna/Target/Ocaml/Term.vuna:1365"));
  ("Vuna_dTarget_dOcaml_dTerm.v_dtPrimRuntime", ("Vuna.Target.Ocaml.Term.dtPrimRuntime", "Vuna/Target/Ocaml/Term.vuna:108"));
  ("Vuna_dTarget_dOcaml_dTerm.v_dtReporterRuntime", ("Vuna.Target.Ocaml.Term.dtReporterRuntime", "Vuna/Target/Ocaml/Term.vuna:1124"));
  ("Vuna_dTarget_dOcaml_dTerm.v_dtRuntime", ("Vuna.Target.Ocaml.Term.dtRuntime", "Vuna/Target/Ocaml/Term.vuna:32"));
  ("Vuna_dTarget_dOcaml_dTerm.v_dtRuntimeWith", ("Vuna.Target.Ocaml.Term.dtRuntimeWith", "Vuna/Target/Ocaml/Term.vuna:1856"));
  ("Vuna_dTarget_dOcaml_dTerm.v_dtSchedRuntime", ("Vuna.Target.Ocaml.Term.dtSchedRuntime", "Vuna/Target/Ocaml/Term.vuna:662"));
  ("Vuna_dTarget_dOcaml_dTerm.v_effThunkText", ("Vuna.Target.Ocaml.Term.effThunkText", "Vuna/Target/Ocaml/Term.vuna:2243"));
  ("Vuna_dTarget_dOcaml_dTerm.v_effUnitTyPair", ("Vuna.Target.Ocaml.Term.effUnitTyPair", "Vuna/Target/Ocaml/Term.vuna:2022"));
  ("Vuna_dTarget_dOcaml_dTerm.v_effUnitTypeNameIr", ("Vuna.Target.Ocaml.Term.effUnitTypeNameIr", "Vuna/Target/Ocaml/Term.vuna:2028"));
  ("Vuna_dTarget_dOcaml_dTerm.v_foldHandlers", ("Vuna.Target.Ocaml.Term.foldHandlers", "Vuna/Target/Ocaml/Term.vuna:2597"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genAppNode", ("Vuna.Target.Ocaml.Term.genAppNode", "Vuna/Target/Ocaml/Term.vuna:2038"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genArm", ("Vuna.Target.Ocaml.Term.genArm", "Vuna/Target/Ocaml/Term.vuna:2360"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genArms", ("Vuna.Target.Ocaml.Term.genArms", "Vuna/Target/Ocaml/Term.vuna:2346"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genAssignedFields", ("Vuna.Target.Ocaml.Term.genAssignedFields", "Vuna/Target/Ocaml/Term.vuna:2281"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genBridgeRef", ("Vuna.Target.Ocaml.Term.genBridgeRef", "Vuna/Target/Ocaml/Term.vuna:2015"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genCtorRef", ("Vuna.Target.Ocaml.Term.genCtorRef", "Vuna/Target/Ocaml/Term.vuna:1976"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genDef", ("Vuna.Target.Ocaml.Term.genDef", "Vuna/Target/Ocaml/Term.vuna:2537"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genEntryHook", ("Vuna.Target.Ocaml.Term.genEntryHook", "Vuna/Target/Ocaml/Term.vuna:2569"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genGroup", ("Vuna.Target.Ocaml.Term.genGroup", "Vuna/Target/Ocaml/Term.vuna:2476"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genGroupDefs", ("Vuna.Target.Ocaml.Term.genGroupDefs", "Vuna/Target/Ocaml/Term.vuna:2523"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genGroups", ("Vuna.Target.Ocaml.Term.genGroups", "Vuna/Target/Ocaml/Term.vuna:2462"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genIr", ("Vuna.Target.Ocaml.Term.genIr", "Vuna/Target/Ocaml/Term.vuna:2034"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genIrArgs", ("Vuna.Target.Ocaml.Term.genIrArgs", "Vuna/Target/Ocaml/Term.vuna:2266"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genIrNode", ("Vuna.Target.Ocaml.Term.genIrNode", "Vuna/Target/Ocaml/Term.vuna:2055"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genLamParams", ("Vuna.Target.Ocaml.Term.genLamParams", "Vuna/Target/Ocaml/Term.vuna:2306"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genLamParamsUnannotated", ("Vuna.Target.Ocaml.Term.genLamParamsUnannotated", "Vuna/Target/Ocaml/Term.vuna:2327"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genNatAlt", ("Vuna.Target.Ocaml.Term.genNatAlt", "Vuna/Target/Ocaml/Term.vuna:2440"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genNatBranches", ("Vuna.Target.Ocaml.Term.genNatBranches", "Vuna/Target/Ocaml/Term.vuna:2398"));
  ("Vuna_dTarget_dOcaml_dTerm.v_genValueRef", ("Vuna.Target.Ocaml.Term.genValueRef", "Vuna/Target/Ocaml/Term.vuna:1969"));
  ("Vuna_dTarget_dOcaml_dTerm.v_gsAddDep", ("Vuna.Target.Ocaml.Term.gsAddDep", "Vuna/Target/Ocaml/Term.vuna:1961"));
  ("Vuna_dTarget_dOcaml_dTerm.v_gsDepOfFamily", ("Vuna.Target.Ocaml.Term.gsDepOfFamily", "Vuna/Target/Ocaml/Term.vuna:1983"));
  ("Vuna_dTarget_dOcaml_dTerm.v_gsWithTyDeps", ("Vuna.Target.Ocaml.Term.gsWithTyDeps", "Vuna/Target/Ocaml/Term.vuna:2336"));
  ("Vuna_dTarget_dOcaml_dTerm.v_hasCatchAll", ("Vuna.Target.Ocaml.Term.hasCatchAll", "Vuna/Target/Ocaml/Term.vuna:2339"));
  ("Vuna_dTarget_dOcaml_dTerm.v_hookText", ("Vuna.Target.Ocaml.Term.hookText", "Vuna/Target/Ocaml/Term.vuna:2604"));
  ("Vuna_dTarget_dOcaml_dTerm.v_inlineText", ("Vuna.Target.Ocaml.Term.inlineText", "Vuna/Target/Ocaml/Term.vuna:1798"));
  ("Vuna_dTarget_dOcaml_dTerm.v_ioParamNames", ("Vuna.Target.Ocaml.Term.ioParamNames", "Vuna/Target/Ocaml/Term.vuna:2254"));
  ("Vuna_dTarget_dOcaml_dTerm.v_lineDirectiveOf", ("Vuna.Target.Ocaml.Term.lineDirectiveOf", "Vuna/Target/Ocaml/Term.vuna:2514"));
  ("Vuna_dTarget_dOcaml_dTerm.v_locRowOf", ("Vuna.Target.Ocaml.Term.locRowOf", "Vuna/Target/Ocaml/Term.vuna:1927"));
  ("Vuna_dTarget_dOcaml_dTerm.v_mkGenSt", ("Vuna.Target.Ocaml.Term.mkGenSt", "Vuna/Target/Ocaml/Term.vuna:1954"));
  ("Vuna_dTarget_dOcaml_dTerm.v_mkGenStWith", ("Vuna.Target.Ocaml.Term.mkGenStWith", "Vuna/Target/Ocaml/Term.vuna:1957"));
  ("Vuna_dTarget_dOcaml_dTerm.v_nonErasedBinderText", ("Vuna.Target.Ocaml.Term.nonErasedBinderText", "Vuna/Target/Ocaml/Term.vuna:2299"));
  ("Vuna_dTarget_dOcaml_dTerm.v_ocamlLitText", ("Vuna.Target.Ocaml.Term.ocamlLitText", "Vuna/Target/Ocaml/Term.vuna:2052"));
  ("Vuna_dTarget_dOcaml_dTerm.v_qualifyBridgeNames", ("Vuna.Target.Ocaml.Term.qualifyBridgeNames", "Vuna/Target/Ocaml/Term.vuna:2006"));
  ("Vuna_dTarget_dOcaml_dTerm.v_qualifyBridgeText", ("Vuna.Target.Ocaml.Term.qualifyBridgeText", "Vuna/Target/Ocaml/Term.vuna:2011"));
  ("Vuna_dTarget_dOcaml_dTerm.v_recordLabelOf", ("Vuna.Target.Ocaml.Term.recordLabelOf", "Vuna/Target/Ocaml/Term.vuna:1989"));
  ("Vuna_dTarget_dOcaml_dTerm.v_recordPatFields", ("Vuna.Target.Ocaml.Term.recordPatFields", "Vuna/Target/Ocaml/Term.vuna:2386"));
  ("Vuna_dTarget_dOcaml_dTerm.v_renderDefOf", ("Vuna.Target.Ocaml.Term.renderDefOf", "Vuna/Target/Ocaml/Term.vuna:2557"));
  ("Vuna_dTarget_dOcaml_dTerm.v_replaceAll", ("Vuna.Target.Ocaml.Term.replaceAll", "Vuna/Target/Ocaml/Term.vuna:2003"));
  ("Vuna_dTarget_dOcaml_dTerm.v_sortLocRows", ("Vuna.Target.Ocaml.Term.sortLocRows", "Vuna/Target/Ocaml/Term.vuna:1924"));
  ("Vuna_dTarget_dOcaml_dTerm.v_takeNames", ("Vuna.Target.Ocaml.Term.takeNames", "Vuna/Target/Ocaml/Term.vuna:2257"));
  ("Vuna_dTarget_dOcaml_dTerm.v_termOrImpossible", ("Vuna.Target.Ocaml.Term.termOrImpossible", "Vuna/Target/Ocaml/Term.vuna:2436"));
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
(* vuna text log runtime (generated; see docs/reference/logging.md). *)
let dtp_log_qc = Char.chr 34
let dtp_log_bs = Char.chr 92
let dtp_log_nl = Char.chr 10
let dtp_log_lb = Char.chr 123
let dtp_log_rb = Char.chr 125
let dtp_log_ls = Char.chr 91
let dtp_log_rs = Char.chr 93
let dtp_log_colon = Char.chr 58
let dtp_log_comma = Char.chr 44

let dtp_log_level_lazy = lazy (
  let env = String.lowercase_ascii (try Sys.getenv "VUNA_LOG" with Not_found -> "") in
  if env = "" then 1
  else match env with
    | "off" | "none" -> -1
    | "error" -> 0
    | "warn" -> 1
    | "info" -> 2
    | "debug" -> 3
    | "trace" -> 4
    | s -> (match int_of_string_opt s with Some n -> n | None -> 1))

let dtp_log_threshold () = Lazy.force dtp_log_level_lazy

let dtp_log_name (lvl : int) =
  if lvl <= 0 then "ERROR"
  else if lvl = 1 then "WARN"
  else if lvl = 2 then "INFO"
  else if lvl = 3 then "DEBUG"
  else "TRACE"

let dtp_log_scopes_lazy = lazy (
  let raw = try Sys.getenv "VUNA_LOG_SCOPE" with Not_found -> "" in
  if raw = "" then []
  else List.filter (fun s -> s <> "") (List.map String.trim (String.split_on_char ',' raw)))

let dtp_log_scope_cache : (string, bool) Hashtbl.t = Hashtbl.create 16

let dtp_log_glob (pat : string) (s : string) =
  let np = String.length pat and ns = String.length s in
  let rec go i j =
    if i = np then j = ns
    else match pat.[i] with
      | '*' -> go (i + 1) j || (j < ns && go i (j + 1))
      | '?' -> j < ns && go (i + 1) (j + 1)
      | c -> j < ns && c = s.[j] && go (i + 1) (j + 1)
  in go 0 0

let dtp_log_scope_match (pat : string) (scope : string) =
  if String.contains pat '*' || String.contains pat '?' then dtp_log_glob pat scope
  else if String.contains pat '.' then
    (* 带点的模式按点边界前缀匹配：`Vuna.Compiler` 命中 `Vuna.Compiler.*`，不命中 `Vuna.CompilerBase`。 *)
    scope = pat
    || (String.length scope > String.length pat
        && String.sub scope 0 (String.length pat) = pat
        && scope.[String.length pat] = '.')
  else
    String.length scope >= String.length pat
    && String.sub scope 0 (String.length pat) = pat

let dtp_log_scope_eval (scope : string) (pats : string list) =
  let inc = List.filter (fun p -> p <> "" && p.[0] <> '!') pats in
  let exc = List.filter (fun p -> p <> "" && p.[0] = '!') pats in
  let strip p = if p <> "" && p.[0] = '!' then String.sub p 1 (String.length p - 1) else p in
  let base = if inc = [] then true else List.exists (fun p -> dtp_log_scope_match p scope) inc in
  base && not (List.exists (fun p -> dtp_log_scope_match (strip p) scope) exc)

let dtp_log_scope_on (scope : string) =
  match Lazy.force dtp_log_scopes_lazy with
  | [] -> true
  | pats ->
    (match Hashtbl.find_opt dtp_log_scope_cache scope with
     | Some b -> b
     | None ->
       let b = dtp_log_scope_eval scope pats in
       Hashtbl.replace dtp_log_scope_cache scope b;
       b)

let dtp_log_on (lvl : int) (scope : string) : bool =
  lvl <= dtp_log_threshold () && dtp_log_scope_on scope

let dtp_log_pid_lazy = lazy (Unix.getpid ())
let dtp_log_pid () = Lazy.force dtp_log_pid_lazy

let dtp_log_format_lazy = lazy (
  String.lowercase_ascii (try Sys.getenv "VUNA_LOG_FORMAT" with Not_found -> ""))
let dtp_log_json_mode () = Lazy.force dtp_log_format_lazy = "jsonl"

let dtp_log_out = ref None
let dtp_log_opened = ref false

let dtp_log_channel () =
  if not !dtp_log_opened then begin
    dtp_log_opened := true;
    dtp_log_out := (try Some (open_out (Sys.getenv "VUNA_LOG_FILE")) with _ -> None)
  end;
  !dtp_log_out

let () = at_exit (fun () -> match !dtp_log_out with Some oc -> close_out_noerr oc | None -> ())

let dtp_log_write (s : string) =
  match dtp_log_channel () with
  | Some oc -> output_string oc s; flush oc
  | None -> output_string stderr s; flush stderr

let dtp_log_json_str b (s : string) =
  Buffer.add_char b dtp_log_qc;
  String.iter
    (fun c ->
      if Char.code c = 34 then begin Buffer.add_char b dtp_log_bs; Buffer.add_char b dtp_log_qc end
      else if Char.code c = 92 then begin Buffer.add_char b dtp_log_bs; Buffer.add_char b dtp_log_bs end
      else if Char.code c = 10 then begin Buffer.add_char b dtp_log_bs; Buffer.add_char b (Char.chr 110) end
      else if Char.code c = 13 then begin Buffer.add_char b dtp_log_bs; Buffer.add_char b (Char.chr 114) end
      else if Char.code c = 9 then begin Buffer.add_char b dtp_log_bs; Buffer.add_char b (Char.chr 116) end
      else if Char.code c < 32 then begin
        Buffer.add_char b dtp_log_bs;
        Buffer.add_char b (Char.chr 117);
        Buffer.add_string b (Printf.sprintf "%04x" (Char.code c))
      end
      else Buffer.add_char b c)
    s;
  Buffer.add_char b dtp_log_qc

let dtp_log_json_line (ts : int) (lvl : int) (scope : string) (text : string) =
  let b = Buffer.create 128 in
  Buffer.add_char b dtp_log_lb;
  dtp_log_json_str b "ts"; Buffer.add_char b dtp_log_colon;
  Buffer.add_string b (string_of_int ts);
  Buffer.add_char b dtp_log_comma;
  dtp_log_json_str b "pid"; Buffer.add_char b dtp_log_colon;
  Buffer.add_string b (string_of_int (dtp_log_pid ()));
  Buffer.add_char b dtp_log_comma;
  dtp_log_json_str b "level"; Buffer.add_char b dtp_log_colon;
  dtp_log_json_str b (String.lowercase_ascii (dtp_log_name lvl));
  Buffer.add_char b dtp_log_comma;
  dtp_log_json_str b "scope"; Buffer.add_char b dtp_log_colon;
  dtp_log_json_str b scope;
  Buffer.add_char b dtp_log_comma;
  dtp_log_json_str b "text"; Buffer.add_char b dtp_log_colon;
  dtp_log_json_str b text;
  Buffer.add_char b dtp_log_rb;
  Buffer.add_char b dtp_log_nl;
  dtp_log_write (Buffer.contents b)

let dtp_log_text_line (ts : int) (lvl : int) (scope : string) (text : string) =
  let b = Buffer.create 96 in
  Buffer.add_string b (string_of_int ts);
  Buffer.add_char b ' ';
  Buffer.add_string b (dtp_log_name lvl);
  Buffer.add_char b ' ';
  Buffer.add_string b scope;
  Buffer.add_char b ' ';
  Buffer.add_string b text;
  Buffer.add_char b dtp_log_nl;
  dtp_log_write (Buffer.contents b)

let dtp_log_emit (lvl : int) (scope : string) (text : string) : int =
  if not (dtp_log_on lvl scope) then 0
  else begin
    let ts = dtp_timeUs () in
    if dtp_log_json_mode () then dtp_log_json_line ts lvl scope text
    else dtp_log_text_line ts lvl scope text;
    0
  end
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
    (t0 : int) (s0 : Gc.stat) (a0 : float) (ok : bool) =
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
       ((Gc.allocated_bytes () -. a0) /. (float_of_int Sys.word_size /. 8.)));
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
    let a0 = Gc.allocated_bytes () in
    let v = try f 0 with e -> dtp_obs_span_emit name cat None t0 s0 a0 false; raise e in
    dtp_obs_span_emit name cat None t0 s0 a0 true;
    v
  end

let dtp_obs_span_lab (name : string) (cat : string) (label : string) (f : int -> 'a) : 'a =
  if not (dtp_obs_on ()) then f 0
  else begin
    let t0 = dtp_timeUs () in
    let s0 = Gc.quick_stat () in
    let a0 = Gc.allocated_bytes () in
    let v = try f 0 with e -> dtp_obs_span_emit name cat (Some label) t0 s0 a0 false; raise e in
    dtp_obs_span_emit name cat (Some label) t0 s0 a0 true;
    v
  end

let dtp_obs_open_spans : (int, string * string * int * Gc.stat * float) Hashtbl.t =
  Hashtbl.create 64

let dtp_obs_span_seq = ref 0

let dtp_obs_span_begin (name : string) (cat : string) : int =
  if not (dtp_obs_on ()) then 0
  else begin
    incr dtp_obs_span_seq;
    let id = !dtp_obs_span_seq in
    Hashtbl.replace dtp_obs_open_spans id
      (name, cat, dtp_timeUs (), Gc.quick_stat (), Gc.allocated_bytes ());
    id
  end

let dtp_obs_span_end (id : int) : int =
  if id = 0 then 0
  else match Hashtbl.find_opt dtp_obs_open_spans id with
    | None -> 0
    | Some (name, cat, t0, s0, a0) ->
      Hashtbl.remove dtp_obs_open_spans id;
      dtp_obs_span_emit name cat None t0 s0 a0 true;
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
