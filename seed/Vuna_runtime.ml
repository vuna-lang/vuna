type dt_gc_stat = {
  dt_gs_minor_words : float;
  dt_gs_promoted_words : float;
  dt_gs_major_words : float;
  dt_gs_minor_collections : int;
  dt_gs_major_collections : int;
  dt_gs_heap_words : int;
  dt_gs_heap_chunks : int;
  dt_gs_live_words : int;
  dt_gs_live_blocks : int;
  dt_gs_free_words : int;
  dt_gs_free_blocks : int;
  dt_gs_largest_free : int;
  dt_gs_fragments : int;
  dt_gs_compactions : int;
  dt_gs_top_heap_words : int;
  dt_gs_stack_size : int;
}
external dt_gc_quick_stat : unit -> dt_gc_stat = "caml_gc_quick_stat"
(* GC 参数走 `caml_gc_get` / `caml_gc_set`（与 stdlib `Gc.get/set` 同一组 C 原语），
   不引用 `Gc` 模块——`Gc` 会把 Printexc / Printf / Buffer 整串拖进每个产物。
   字段顺序与 `Gc.control` 一致（版本升级时这里要跟着 mli 走）。 *)
type dt_gc_control = {
  dt_gc_minor_heap_size : int;
  dt_gc_major_heap_increment : int;
  dt_gc_space_overhead : int;
  dt_gc_verbose : int;
  dt_gc_max_overhead : int;
  dt_gc_stack_limit : int;
  dt_gc_allocation_policy : int;
  dt_gc_window_size : int;
  dt_gc_custom_major_ratio : int;
  dt_gc_custom_minor_ratio : int;
  dt_gc_custom_minor_max_size : int;
}
external dt_gc_get : unit -> dt_gc_control = "caml_gc_get"
external dt_gc_set : dt_gc_control -> unit = "caml_gc_set"
(* 8 MB minor heap（1048576 words）+ space_overhead 200。
   minor heap 是「分配密集型短程序 vs 深栈程序」之间的单一旋钮：
   - 2 MB（OCaml 默认）对短命分配最省（micro_concat 14ms vs 18ms），但每次 minor GC
     要扫栈，400k 层 handler 的深度夹具因此从 2.2x 涨到 3.4x 增长（checks.vuna-effect-machine-growth）；
   - 16 MB 对深栈最友好（同夹具 2.2x），但分配密集程序慢 40%；
   - 8 MB 落在两者之间：深度夹具 2.6x（门禁 3.0x），micro_concat 约 +3ms。
   读数见 docs/reference/performance-hotspots.md 的 GC 段。 *)
let () =
  let c = dt_gc_get () in
  dt_gc_set { c with dt_gc_minor_heap_size = 1048576; dt_gc_space_overhead = 200 }
let () =
  if (try Sys.getenv "VN_PERF_STATS" with Not_found -> "") <> "" then
    at_exit (fun () ->
      let s = dt_gc_quick_stat () in
      let w = float_of_int Sys.word_size /. 8. in
      let allocated = (s.dt_gs_minor_words +. s.dt_gs_major_words -. s.dt_gs_promoted_words) *. w in
      prerr_string
        ("VN_PERF minor_words=" ^ string_of_int (int_of_float s.dt_gs_minor_words)
         ^ " major_words=" ^ string_of_int (int_of_float s.dt_gs_major_words)
         ^ " minor_collections=" ^ string_of_int s.dt_gs_minor_collections
         ^ " major_collections=" ^ string_of_int s.dt_gs_major_collections
         ^ " top_heap_words=" ^ string_of_int s.dt_gs_top_heap_words
         ^ " allocated_words=" ^ string_of_int (int_of_float allocated) ^ "\n"))
let bi_add a b = a + b
let bi_sub a b = a - b
let bi_mul a b = a * b
let bi_div a b = if b = 0 then failwith "division by zero" else a / b
let bi_eq_int (a : int) (b : int) = a = b
let bi_neq_int (a : int) (b : int) = a <> b
let bi_eq_str (a : string) (b : string) = a = b
let bi_neq_str (a : string) (b : string) = a <> b
let bi_strFromInt (n : int) = string_of_int n
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
let dtp_exit n = exit n
let bi_strLength (s : string) = String.length s
let bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])
let bi_strPack (cs : int list) =
  let a = Array.of_list cs in
  String.init (Array.length a) (fun i -> Char.chr a.(i))
let dt_show_string s =
  let n = String.length s in
  let b = Bytes.create (2 * n + 2) in
  Bytes.set b 0 (Char.chr 34);
  let o = ref 1 in
  String.iter (fun c ->
    let k = Char.code c in
    if k = 34 then (Bytes.set b !o (Char.chr 92); Bytes.set b (!o + 1) (Char.chr 34); o := !o + 2)
    else if k = 92 then (Bytes.set b !o (Char.chr 92); Bytes.set b (!o + 1) (Char.chr 92); o := !o + 2)
    else if k = 10 then (Bytes.set b !o (Char.chr 92); Bytes.set b (!o + 1) (Char.chr 110); o := !o + 2)
    else if k = 9 then (Bytes.set b !o (Char.chr 92); Bytes.set b (!o + 1) (Char.chr 116); o := !o + 2)
    else if k = 13 then (Bytes.set b !o (Char.chr 92); Bytes.set b (!o + 1) (Char.chr 114); o := !o + 2)
    else (Bytes.set b !o c; incr o)) s;
  Bytes.set b !o (Char.chr 34);
  Bytes.sub_string b 0 (!o + 1)
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
let dtp_arraySet (a : 'a array) (i : int) (v : 'a) =
  let b = Array.copy a in
  Array.set b i v; b
let dtp_dynNew cap =
  ref (Obj.repr (Array.make (if cap < 1 then 1 else cap) (Obj.repr 0), 0))
let dtp_dynLen (r : Obj.t ref) = snd (Obj.obj !r : Obj.t array * int)
let dtp_dynGet (r : Obj.t ref) i =
  let (a, n) = (Obj.obj !r : Obj.t array * int) in
  if i < 0 || i >= n then invalid_arg "index out of bounds" else Obj.obj a.(i)
let dtp_dynSet (r : Obj.t ref) i v =
  let (a, n) = (Obj.obj !r : Obj.t array * int) in
  if i < 0 || i >= n then invalid_arg "index out of bounds"
  else begin a.(i) <- Obj.repr v; 0 end
let dtp_dynPush (r : Obj.t ref) v =
  let (a, n) = (Obj.obj !r : Obj.t array * int) in
  if n < Array.length a then begin
    a.(n) <- Obj.repr v;
    r := Obj.repr (a, n + 1)
  end else begin
    let cap = Array.length a in
    let ncap = if cap * 2 < 8 then 8 else cap * 2 in
    let b = Array.make ncap (Obj.repr 0) in
    Array.blit a 0 b 0 n;
    b.(n) <- Obj.repr v;
    r := Obj.repr (b, n + 1)
  end;
  0
let dtp_dynClear (r : Obj.t ref) =
  let (a, _) = (Obj.obj !r : Obj.t array * int) in
  r := Obj.repr (a, 0); 0
let dtp_mbufNew cap =
  ref (Obj.repr (Bytes.create (if cap < 1 then 16 else cap), 0))
let dtp_mbufEnsure (r : Obj.t ref) need =
  let (b, n) = (Obj.obj !r : bytes * int) in
  if need <= Bytes.length b then (b, n)
  else
    let cap = ref (Bytes.length b * 2) in
    (while !cap < need do cap := !cap * 2 done;
     let nb = Bytes.create !cap in
     Bytes.blit b 0 nb 0 n;
     (nb, n))
let dtp_mbufAppend (r : Obj.t ref) s =
  let (_, n) = (Obj.obj !r : bytes * int) in
  let k = String.length s in
  let (b2, n2) = dtp_mbufEnsure r (n + k) in
  Bytes.blit_string s 0 b2 n2 k;
  r := Obj.repr (b2, n2 + k); 0
let dtp_mbufAppendChar (r : Obj.t ref) c =
  let (_, n) = (Obj.obj !r : bytes * int) in
  let (b2, n2) = dtp_mbufEnsure r (n + 1) in
  Bytes.set b2 n2 (Char.chr c);
  r := Obj.repr (b2, n2 + 1); 0
let dtp_mbufLen (r : Obj.t ref) = snd (Obj.obj !r : bytes * int)
let dtp_mbufClear (r : Obj.t ref) =
  let (b, _) = (Obj.obj !r : bytes * int) in
  r := Obj.repr (b, 0); 0
let dtp_mbufToString (r : Obj.t ref) =
  let (b, n) = (Obj.obj !r : bytes * int) in
  Bytes.sub_string b 0 n
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
   正是被丢弃的续延里打开的 bracket。纤程用当前纤程 id 区分（调度器在运行某个
   任务时设置它）；非调度器上下文（-1）有一份独立栈。状态放在 `Domain.DLS` 里：
   每个 domain（线程）有自己的 cleanup 栈，domain 之间互不干扰。
   注意：cleanup 在 handler 退出点执行，只能访问**外层** handler（当前 handler
   的效应在该点不可用）；执行期异常被吞掉，避免污染 abort 结果。
   表示是「数组 + 深度」：push / pop / mark 都是 O(1)，pop 时清槽释放闭包。 *)
type dtp_cleanup_stack = {
  mutable dtp_cs_items : (int -> int) array;
  mutable dtp_cs_len : int;
}
type dtp_cleanup_state = {
  mutable dtp_cs_fiber : int;
  mutable dtp_cs_stacks : (int * dtp_cleanup_stack) list;
}
let dtp_cleanup_stateK =
  Domain.DLS.new_key (fun () -> { dtp_cs_fiber = -1; dtp_cs_stacks = [] })
let dtp_cleanup_state () = Domain.DLS.get dtp_cleanup_stateK
let dtp_cleanup_fiber_get () = (dtp_cleanup_state ()).dtp_cs_fiber
let dtp_cleanup_fiber_set (fid : int) = (dtp_cleanup_state ()).dtp_cs_fiber <- fid
(* 每 domain 的活纤程数很小（通常 1–2 条），关联表比 Hashtbl 更轻；Hashtbl 会
   把 Random / Printexc / Printf / Buffer 整串拖进产物，纯程序的启动成本明显变高。 *)
let rec dtp_cs_lookup fid = function
  | [] -> None
  | (k, r) :: rest -> if k = fid then Some r else dtp_cs_lookup fid rest
let dtp_cleanup_stack_of (fid : int) =
  let s = dtp_cleanup_state () in
  match dtp_cs_lookup fid s.dtp_cs_stacks with
  | Some r -> r
  | None ->
    let r = { dtp_cs_items = Array.make 8 (fun _ -> 0); dtp_cs_len = 0 } in
    s.dtp_cs_stacks <- (fid, r) :: s.dtp_cs_stacks;
    r
let dtp_cleanup_current () = dtp_cleanup_stack_of (dtp_cleanup_fiber_get ())
let dtp_cleanup_mark () = (dtp_cleanup_current ()).dtp_cs_len
let dtp_cleanup_drain_to (s : dtp_cleanup_stack) (mark : int) =
  while s.dtp_cs_len > mark do
    let i = s.dtp_cs_len - 1 in
    let f = s.dtp_cs_items.(i) in
    s.dtp_cs_items.(i) <- (fun _ -> 0);
    s.dtp_cs_len <- i;
    (try ignore (f 0) with _ -> ())
  done
let dtp_cleanup_run_to (mark : int) = dtp_cleanup_drain_to (dtp_cleanup_current ()) mark
let dtp_cleanup_run_all_for (fid : int) =
  dtp_cleanup_drain_to (dtp_cleanup_stack_of fid) 0
let dtp_cleanup_forget (fid : int) =
  let s = dtp_cleanup_state () in
  s.dtp_cs_stacks <- List.filter (fun (k, _) -> k <> fid) s.dtp_cs_stacks
let dtp_cleanup_reset () =
  let s = dtp_cleanup_state () in
  s.dtp_cs_stacks <- [];
  s.dtp_cs_fiber <- -1
(* 当前 handler 的 self 栈（每个 Domain 一份）：opH 执行期间压入
   (keyId,nameId,key,name,ret,h)，`prim_effectSelf` 用它把子计算重新装进同一个 handler。
   帧在一次安装内不变，只分配一次；每次 perform 只做一次 cons。 *)
let dtp_selfK = Domain.DLS.new_key (fun () -> ref ([] : Obj.t list))
let dtp_effect_run key name kid nid ret h th =
  let mark = dtp_cleanup_mark () in
  let st = Domain.DLS.get dtp_selfK in
  (* 帧在一次安装内不变：只分配一次，resumption 闭包捕获它（1 个字段），
     每次 perform 只 cons 一次。 *)
  let frame = Obj.repr (kid, nid, key, name, Obj.repr ret, Obj.repr h) in
  (* 外层 Obj.magic 与 continuation 的 Obj.t 表示一致：effc 的 continue 返回 Obj.t，
     去掉它会让 handler 的 answer 类型被钉成 Obj.t。 *)
  try
    let r =
      Obj.magic
        (match Effect.Deep.match_with th ()
          { retc = (fun x -> (Obj.magic ret) x);
            exnc = (fun e -> raise e);
            effc = (fun (type a) (eff : a Effect.t) -> match eff with
              | Perform (k, n, _, _, payload) when k = kid && n = nid ->
                Some (fun (cont : (a, Obj.t) Effect.Deep.continuation) ->
                  let saved = !st in
                  st := frame :: saved;
                  (try
                     let r = (Obj.magic h) payload (fun v -> Effect.Deep.continue cont (Obj.repr v)) in
                     st := saved; r
                   with e -> st := saved; raise e))
              | _ -> None) }
        with
        | r -> r
        | exception e -> raise e)
    in
    dtp_cleanup_run_to mark; r
  with e -> dtp_cleanup_run_to mark; raise e
let dtp_effect_handle_id key name kid nid ret h th =
  fun u -> dtp_effect_run key name kid nid ret h (fun () -> (Obj.magic th) u)
let dtp_effect_self th =
  match !(Domain.DLS.get dtp_selfK) with
  | top :: _ ->
    let (kid, nid, key, name, ret, h) = Obj.obj top in
    dtp_effect_run key name kid nid ret h (fun () -> (Obj.magic th) 0)
  | [] -> failwith "self outside handler"
let dtp_cleanup_push (f : int -> int) : int =
  let s = dtp_cleanup_current () in
  if s.dtp_cs_len = Array.length s.dtp_cs_items then begin
    let b = Array.make (2 * s.dtp_cs_len + 8) (fun _ -> 0) in
    Array.blit s.dtp_cs_items 0 b 0 s.dtp_cs_len;
    s.dtp_cs_items <- b
  end;
  s.dtp_cs_items.(s.dtp_cs_len) <- f;
  s.dtp_cs_len <- s.dtp_cs_len + 1;
  0
let dtp_cleanup_pop (_ : int) : int =
  let s = dtp_cleanup_current () in
  if s.dtp_cs_len > 0 then begin
    let i = s.dtp_cs_len - 1 in
    s.dtp_cs_items.(i) <- (fun _ -> 0);
    s.dtp_cs_len <- i
  end;
  0
let dtp_output_mutex = Mutex.create ()
let dtp_with_output_lock (f : unit -> int) : int =
  Mutex.lock dtp_output_mutex;
  (try
     let r = f () in
     Mutex.unlock dtp_output_mutex; r
   with e -> Mutex.unlock dtp_output_mutex; raise e)
let dtp_print s =
  (* 写失败（典型 EPIPE：`vuna … | head`）不再是宿主崩溃；输出到此为止。
     锁保证多 domain 并发打印时每次调用整体输出、不交错。 *)
  dtp_with_output_lock (fun () -> try print_string s; flush stdout; String.length s with _ -> 0)
let dtp_eprint s =
  dtp_with_output_lock (fun () -> try prerr_string s; flush stderr; String.length s with _ -> 0)
(* 宿主失败通道：try 变体不抛宿主异常，而是把失败码写进**当前 Domain** 的状态槽，
   返回默认值；base 的宿主 handler 随后读 status 转成 typed error。0 = 成功。
   用 Domain.DLS 而不是全局 ref：异步任务会在别的 Domain 上跑。 *)
let dtp_hostStatusK = Domain.DLS.new_key (fun () -> ref 0)
let dtp_hostSetStatus c = (Domain.DLS.get dtp_hostStatusK) := c
let dtp_hostStatus () = !(Domain.DLS.get dtp_hostStatusK)
let dtp_hostFail code = dtp_hostSetStatus (if code = 0 then 9 else code)
let dtp_hostReset () = dtp_hostSetStatus 0
let dtp_hostMark code e =
  ignore e;
  dtp_hostSetStatus (if code = 0 then 9 else code)
let dtp_readFile path =
  try
    let ch = open_in_bin path in
    (try
       let r = really_input_string ch (in_channel_length ch) in
       close_in_noerr ch; r
     with e -> close_in_noerr ch; raise e)
  with Sys_error msg -> failwith ("readFile: " ^ msg)
let dtp_readFileRange path offset length =
  try
    if offset < 0 || length <= 0 then ""
    else
      let ch = open_in_bin path in
      (try
         let r =
           let size = in_channel_length ch in
           if offset >= size then ""
           else (seek_in ch offset; really_input_string ch (min length (size - offset))) in
         close_in_noerr ch; r
       with e -> close_in_noerr ch; raise e)
  with Sys_error msg -> failwith ("readFileRange: " ^ msg)
let dtp_writeFile path contents =
  try
    let ch = open_out_bin path in
    (try output_string ch contents; close_out_noerr ch
     with e -> close_out_noerr ch; raise e);
    String.length contents
  with Sys_error msg -> failwith ("writeFile: " ^ msg)
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
let dtp_getenv k = try Sys.getenv k with Not_found -> ""
let dtp_getcwd () = try Sys.getcwd () with _ -> "."
(* POSIX shell 单引号转义（与 Filename.quote 同形：结束单引号 → 反斜杠转义引号 → 重开
   单引号）。不引用 Filename 模块——它会把 Printexc / Printf / Buffer 拖进每个产物。 *)
let dtp_shell_quote s =
  let q = String.make 1 (Char.chr 39) in
  let bslash = String.make 1 (Char.chr 92) in
  let esc = q ^ bslash ^ q ^ q in
  q ^ String.concat esc (String.split_on_char (Char.chr 39) s) ^ q
let dtp_net_next = ref 1
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
let dt_def_locs_raw_ref : string ref = ref ""
let dt_set_locs_raw (raw : string) : unit =
  dt_def_locs_raw_ref := raw
type dt_raw_backtrace = int array
type dt_backtrace_slot =
  | Known_location of {
      is_raise : bool;
      filename : string;
      start_lnum : int;
      start_char : int;
      end_offset : int;
      end_lnum : int;
      end_char : int;
      is_inline : bool;
      defname : string;
    }
  | Unknown_location of { is_raise : bool }
external dt_record_backtrace : bool -> unit = "caml_record_backtrace"
external dt_get_raw_backtrace_prim : unit -> dt_raw_backtrace = "caml_get_exception_raw_backtrace"
external dt_convert_raw_backtrace : dt_raw_backtrace -> dt_backtrace_slot array = "caml_convert_raw_backtrace"
(* 回溯 / 位置表路径只用字符与字节原语：引用 `List` / `Array` / `String` / `Bytes`
   会把整串 stdlib 模块拖进每个产物的启动路径（纯 `main = 42` 的 text 有一半来自这里）。 *)
external dt_str_len : string -> int = "%string_length"
external dt_str_get : string -> int -> char = "%string_safe_get"
external dt_arr_len : 'a array -> int = "%array_length"
external dt_arr_get : 'a array -> int -> 'a = "%array_safe_get"
external dt_bytes_create : int -> bytes = "caml_create_bytes"
external dt_blit_string : string -> int -> bytes -> int -> int -> unit = "caml_blit_string" [@@noalloc]
external dt_bytes_set : bytes -> int -> char -> unit = "%bytes_safe_set"
external dt_bytes_to_string : bytes -> string = "%bytes_to_string"
let dt_sub s ofs len =
  let b = dt_bytes_create len in
  dt_blit_string s ofs b 0 len;
  dt_bytes_to_string b
let dt_quote_char = dt_bytes_create 1
let () = dt_bytes_set dt_quote_char 0 '"'
let dt_quote () = dt_bytes_to_string dt_quote_char
let dt_eq_sub s ofs len (t : string) =
  if dt_str_len t <> len then false
  else begin
    let ok = ref true in
    let i = ref 0 in
    while !ok && !i < len do
      if dt_str_get s (ofs + !i) <> dt_str_get t !i then ok := false;
      incr i
    done;
    !ok
  end
let dt_is_fun s a b =
  b - a = 5 && dt_str_get s a = '(' && dt_str_get s (a + 1) = 'f'
  && dt_str_get s (a + 2) = 'u' && dt_str_get s (a + 3) = 'n' && dt_str_get s (a + 4) = ')'
(* 帧名 `Unit.value`：取最后两段（跳过 `(fun)`），不建中间列表。 *)
let dt_frame_key nm =
  let n = dt_str_len nm in
  let name = ref (0, 0) and prev = ref (0, 0) and have = ref 0 in
  let start = ref 0 in
  let i = ref 0 in
  while !i <= n do
    (if !i = n || dt_str_get nm !i = '.' then begin
      if not (dt_is_fun nm !start !i) then begin
        prev := !name;
        name := (!start, !i);
        incr have
      end;
      start := !i + 1
    end);
    incr i
  done;
  if !have < 2 then None
  else
    let (a, b) = !name and (c, d) = !prev in
    Some (dt_sub nm c (d - c) ^ "." ^ dt_sub nm a (b - a))
(* 位置表是压平的 `key\ndisplay\nloc\n` 字符串：按行扫描，不建中间列表。 *)
let dt_scan_nl s pos =
  let n = dt_str_len s in
  let i = ref pos in
  while !i < n && dt_str_get s !i <> '\n' do incr i done;
  !i
let dt_def_loc_find key =
  let raw = !dt_def_locs_raw_ref in
  let n = dt_str_len raw in
  let rec go pos =
    if pos >= n then None
    else
      let k_end = dt_scan_nl raw pos in
      if k_end >= n then None
      else
        let d_start = k_end + 1 in
        let d_end = dt_scan_nl raw d_start in
        if d_end >= n then None
        else
          let l_start = d_end + 1 in
          let l_end = dt_scan_nl raw l_start in
          if dt_eq_sub raw pos (k_end - pos) key then
            Some (dt_sub raw d_start (d_end - d_start), dt_sub raw l_start (l_end - l_start))
          else go (l_end + 1)
  in go 0
let dt_get_raw_backtrace () = try dt_get_raw_backtrace_prim () with _ -> [||]
let dt_backtrace_slots bt = (try Some (dt_convert_raw_backtrace bt) with Failure _ -> None)
let dt_slot_defname slot =
  match slot with
  | Unknown_location _ -> None
  | Known_location l -> if l.defname = "" then None else Some l.defname
let dt_frame_label slot =
  match dt_slot_defname slot with
  | None -> None
  | Some nm ->
    match dt_frame_key nm with
    | None -> None
    | Some key ->
      (match dt_def_loc_find key with
       | Some (display, loc) -> Some (display ^ " (" ^ loc ^ ")")
       | None -> None)
let dt_exn_quote m = dt_quote () ^ m ^ dt_quote ()
let dt_exn_msg e =
  match e with
  | Effect.Unhandled (Perform (_, _, key, name, _)) -> "unhandled effect " ^ key ^ " (instance " ^ name ^ ")"
  | Failure m -> m
  | Invalid_argument m -> "Invalid_argument(" ^ dt_exn_quote m ^ ")"
  | Sys_error m -> "Sys_error(" ^ dt_exn_quote m ^ ")"
  | Not_found -> "Not_found"
  | End_of_file -> "End_of_file"
  | Division_by_zero -> "Division_by_zero"
  | Stack_overflow -> "Stack_overflow"
  | Out_of_memory -> "Out_of_memory"
  | Sys.Break -> "Sys.Break"
  | _ -> "<exception>"
let dt_report_exn e bt =
  prerr_string ("vuna: runtime error: " ^ dt_exn_msg e ^ "\n");
  match dt_backtrace_slots bt with
  | None -> ()
  | Some slots ->
    let shown = ref 0 and last = ref "" and i = ref 0 in
    let n = dt_arr_len slots in
    while !i < n && !shown < 12 do
      (match dt_frame_label (dt_arr_get slots !i) with
       | Some s -> if s <> !last then begin prerr_string ("  at " ^ s ^ "\n"); incr shown; last := s end
       | None -> ());
      incr i
    done
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
    dtp_cleanup_fiber_set t.sched_tid;
    (match dtp_sched_step t with
     | Some st -> dtp_sched_apply t st
     | None -> ());
    dtp_cleanup_fiber_set (-1);
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
(* net 句柄的属主路径表（只有宿主网络原语用到）。 *)
let dtp_net_owned : (int, string * int) Hashtbl.t = Hashtbl.create 4
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
let dtp_writeFileAtomic path contents =
  let tmp = path ^ "." ^ string_of_int (Unix.getpid ()) ^ ".tmp" in
  let write () =
    let ch = open_out_bin tmp in
    Fun.protect ~finally:(fun () -> close_out_noerr ch) (fun () -> output_string ch contents) in
  (try write (); Sys.rename tmp path; String.length contents
   with e -> (try Sys.remove tmp with _ -> ()); raise e)
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
(* 在跑的子进程 pid 槽（64 个）：`dtp_runIn` / `dtp_tryRunIn` / `dtp_spawn` 登记，
   回收时摘掉；父进程收到终止类信号时逐个收掉，路由层被 kill 也不会把插件子进程留成孤儿。

   读者是信号处理器：它可能正好打断写者，所以槽用 `Atomic` 发布、不拿锁。只有并发子进程
   超过 64 个时，后来的子进程才会不被跟踪。 *)
let dtp_child_slots = 64
let dtp_child_pids : int Atomic.t array =
  Array.init dtp_child_slots (fun _ -> Atomic.make 0)
let dtp_child_add (pid : int) =
  let rec go i =
    if i < dtp_child_slots then
      if Atomic.compare_and_set dtp_child_pids.(i) 0 pid then () else go (i + 1) in
  go 0
let dtp_child_drop (pid : int) =
  let rec go i =
    if i < dtp_child_slots then
      if Atomic.compare_and_set dtp_child_pids.(i) pid 0 then () else go (i + 1) in
  go 0
let dtp_child_kill (sig_ : int) =
  for i = 0 to dtp_child_slots - 1 do
    let pid = Atomic.get dtp_child_pids.(i) in
    if pid <> 0 then (try Unix.kill pid sig_ with _ -> ())
  done
(* 收掉已退出的子进程（`WNOHANG`）：信号处理器等宽限时用，避免把僵尸当成还活着。 *)
let dtp_child_reap () =
  for i = 0 to dtp_child_slots - 1 do
    let pid = Atomic.get dtp_child_pids.(i) in
    if pid <> 0 then
      match Unix.waitpid [Unix.WNOHANG] pid with
      | (0, _) -> ()
      | _ -> dtp_child_drop pid
      | exception _ -> dtp_child_drop pid
  done
(* 是否还有被跟踪的子进程（含未被回收的僵尸）。 *)
let dtp_child_any () =
  let any = ref false in
  for i = 0 to dtp_child_slots - 1 do
    if Atomic.get dtp_child_pids.(i) <> 0 then any := true
  done;
  !any
(* 终止类信号的统一出口：先 TERM，宽限内仍在就 KILL，最后恢复默认处理器重发同一个信号——
   退出状态保持「被信号终止」，而不是一个普通退出码。 *)
let dtp_kill_children_and_die (sig_ : int) =
  dtp_child_kill Sys.sigterm;
  let rec grace n =
    if n > 0 && dtp_child_any () then begin
      Unix.sleepf 0.02;
      dtp_child_reap ();
      grace (n - 1)
    end in
  grace 25;
  if dtp_child_any () then dtp_child_kill Sys.sigkill;
  Sys.set_signal sig_ Sys.Signal_default;
  (try Unix.kill (Unix.getpid ()) sig_ with _ -> exit (128 + sig_))
(* 首次起子进程时装上转发器：没有子进程的程序行为不变。SIGINT 只转发、自己不退
   （插件如何处理 Ctrl-C 由插件决定）；TERM / HUP / QUIT 转发后跟随退出。 *)
let dtp_children_armed = ref false
let dtp_handle_term sig_ _ =
  (try dtp_kill_children_and_die sig_ with _ -> exit (128 + sig_))
let dtp_handle_int _ = dtp_child_kill Sys.sigint
let dtp_arm_children () =
  if not !dtp_children_armed then begin
    dtp_children_armed := true;
    Sys.set_signal Sys.sigterm (Sys.Signal_handle (dtp_handle_term Sys.sigterm));
    Sys.set_signal Sys.sighup (Sys.Signal_handle (dtp_handle_term Sys.sighup));
    Sys.set_signal Sys.sigquit (Sys.Signal_handle (dtp_handle_term Sys.sigquit));
    Sys.set_signal Sys.sigint (Sys.Signal_handle dtp_handle_int);
    at_exit (fun () -> dtp_child_kill Sys.sigterm)
  end
(* fork + exec `prog`（argv 首项由调用方给全），父进程登记子进程 pid 并返回。
   用 `Unix.create_process` 而不是 `Unix.fork`：OCaml 5 的 `Unix.fork` 在进程里有过 domain
   之后直接失败（REPL 的索引构建会用 domain 并行），而 `create_process` 没有这个限制；它
   内部是 `execvp`，与旧路径一样按 PATH 查找（`Sys.executable_name` 可能不带目录）。 *)
let dtp_spawn_prog (prog : string) (argv : string array) : int =
  dtp_arm_children ();
  let pid = Unix.create_process prog argv Unix.stdin Unix.stdout Unix.stderr in
  dtp_child_add pid;
  pid
(* 起 `/bin/sh -c cmd` 并等它，返回退出码；被信号终止时给 255（与 `Sys.command` 同口径，
   下游 `processRunIn` 的调用点行为不变）。子进程留在前台进程组：交互子进程读终端、
   收 Ctrl-C 的行为不变。 *)
let dtp_sh (cmd : string) : int =
  (* 子进程继承 stdout/stderr：先落盘本进程的缓冲，否则缓冲内容会被两份进程各写一遍。 *)
  flush_all ();
  let pid = dtp_spawn_prog "/bin/sh" [| "/bin/sh"; "-c"; cmd |] in
  let rec go () =
    match Unix.waitpid [] pid with
    | (_, Unix.WEXITED c) -> c
    | (_, _) -> 255
    | exception Unix.Unix_error (Unix.EINTR, _, _) -> go ()
    (* 已被信号处理器回收（进程正要按信号退出）：仍按「被信号终止」报告。 *)
    | exception Unix.Unix_error (Unix.ECHILD, _, _) -> 255 in
  let code = go () in
  dtp_child_drop pid;
  code
(* 目录存在且确实是目录；任何异常按「不存在」处理（与 `Sys.chdir` 失败的映射一致）。 *)
let dtp_dirExists path =
  (try Sys.file_exists path && Sys.is_directory path with _ -> false)
(* 当前进程能否进入这个目录（`X_OK` 在目录上就是「可搜索 / 穿过」）；异常按不可用处理。 *)
let dtp_dirUsable path =
  (try Unix.access path [Unix.X_OK]; true with _ -> false)
let dtp_runIn dir args =
  dtp_hostReset ();
  let quote s = dtp_shell_quote s in
  let cmd = String.concat " " (List.map quote args) in
  (* 宿主侧先判目录：不存在 / 不是目录给状态 1，存在但进不去（权限）给状态 2；两者都
     不 spawn 也不打印（`sh` 的 `cd` 失败会把错误写到 stderr，污染调用方捕获的输出；
     旧实现在 OCaml 里 `Sys.chdir` 失败同样没有输出，并按 errno 区分这两类）。 *)
  if not (dtp_dirExists dir) then (dtp_hostSetStatus 1; -1)
  else if not (dtp_dirUsable dir) then (dtp_hostSetStatus 2; -1)
  else
    (* `cd` 仍在 shell 里做：进程级 cwd 不动（多 domain 下不能改进程 cwd）。判目录与
       spawn 之间目录可能被删（TOCTOU），`cd` 的 stderr 屏蔽掉，失败仍旧走 125 哨兵
       （与命令自己的退出码区分）→ 状态 1。 *)
    let code = dtp_sh ("cd " ^ quote dir ^ " 2>/dev/null || exit 125; " ^ cmd) in
    if code = 125 then (dtp_hostSetStatus 1; -1) else code
let dtp_tryRunIn dir args =
  (* cwd 由 `dtp_runIn` 在 shell 里切：不改进程 cwd（多 domain 下 chdir 是进程级的），
     目录进不去同样走 125 哨兵 → 状态槽 1。 *)
  (try dtp_runIn dir args with e -> dtp_hostFail (dtp_hostCodeAt dir e); -1)
let dtp_timeUs () = int_of_float (Unix.gettimeofday () *. 1000000.0)
let dtp_sleep us =
  (if us > 0 then Unix.sleepf (float_of_int us /. 1000000.0));
  0
let dtp_execPath () = try Unix.readlink "/proc/self/exe" with _ -> Sys.executable_name
let dtp_spawn (args : string list) : int =
  let prog = Sys.executable_name in
  dtp_spawn_prog prog (Array.of_list (prog :: args))
let dtp_wait (pid : int) : int =
  let rec go () =
    match Unix.waitpid [] pid with
    | (_, Unix.WEXITED c) -> c
    | (_, _) -> 1
    | exception Unix.Unix_error (Unix.EINTR, _, _) -> go ()
    | exception Unix.Unix_error (Unix.ECHILD, _, _) -> 1 in
  let code = go () in
  dtp_child_drop pid;
  code
let dtp_net_tbl : (int, Unix.file_descr) Hashtbl.t = Hashtbl.create 16
(* 监听句柄绑定的 unix socket 路径与当时的 inode：关闭句柄时只删仍然指向自己的那份文件。
   没有这条记录（tcp 句柄 / 已被替换的路径）就不删，免得删掉同一路径上后继进程的 socket。 *)
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
(* Threads and synchronization primitives (OCaml 5 domains).           *)
(* ------------------------------------------------------------------ *)

type dtp_thread_handle = {
  mutable dtp_th_done : bool;
  mutable dtp_th_value : Obj.t;
  dtp_th_domain : Obj.t Domain.t;
}

let dtp_thread_spawn (th : int -> 'a) : Obj.t =
  let d = Domain.spawn (fun () -> Obj.repr (th 0)) in
  Obj.repr { dtp_th_done = false; dtp_th_value = Obj.repr (); dtp_th_domain = d }

let dtp_thread_join (t : Obj.t) : 'a =
  let h : dtp_thread_handle = Obj.obj t in
  if h.dtp_th_done then Obj.obj h.dtp_th_value
  else if Domain.get_id h.dtp_th_domain = Domain.self () then failwith "thread: join self"
  else begin
    let v = Domain.join h.dtp_th_domain in
    h.dtp_th_value <- v;
    h.dtp_th_done <- true;
    Obj.obj v
  end

let dtp_thread_yield () : int =
  (try Unix.sleepf 0.0 with _ -> ());
  0

let dtp_thread_id () : int = (Domain.self () :> int)

let dtp_thread_parallelism () : int = Domain.recommended_domain_count ()

let dtp_mutex_new () : Obj.t = Obj.repr (Mutex.create ())
let dtp_mutex_lock (m : Obj.t) : int = Mutex.lock (Obj.obj m); 0
let dtp_mutex_try_lock (m : Obj.t) : bool = Mutex.try_lock (Obj.obj m)
let dtp_mutex_unlock (m : Obj.t) : int = Mutex.unlock (Obj.obj m); 0

let dtp_condvar_new () : Obj.t = Obj.repr (Condition.create ())
let dtp_condvar_wait (c : Obj.t) (m : Obj.t) : int =
  Condition.wait (Obj.obj c) (Obj.obj m);
  0
let dtp_condvar_signal (c : Obj.t) : int = Condition.signal (Obj.obj c); 0
let dtp_condvar_broadcast (c : Obj.t) : int = Condition.broadcast (Obj.obj c); 0

let dtp_atomic_new (v : int) : Obj.t = Obj.repr (Atomic.make v)
let dtp_atomic_load (a : Obj.t) : int = Atomic.get (Obj.obj a)
let dtp_atomic_store (a : Obj.t) (v : int) : int =
  Atomic.set (Obj.obj a) v;
  0
let dtp_atomic_fetch_add (a : Obj.t) (v : int) : int =
  Atomic.fetch_and_add (Obj.obj a) v
let dtp_atomic_exchange (a : Obj.t) (v : int) : int = Atomic.exchange (Obj.obj a) v
let dtp_atomic_compare_exchange (a : Obj.t) (expected : int) (desired : int) : int =
  let cell : int Atomic.t = Obj.obj a in
  let rec loop () =
    let prev = Atomic.get cell in
    if prev <> expected then prev
    else if Atomic.compare_and_set cell expected desired then prev
    else loop ()
  in
  loop ()
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

let dtp_log_level_value = (
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

let dtp_log_threshold () = dtp_log_level_value

let dtp_log_name (lvl : int) =
  if lvl <= 0 then "ERROR"
  else if lvl = 1 then "WARN"
  else if lvl = 2 then "INFO"
  else if lvl = 3 then "DEBUG"
  else "TRACE"

let dtp_log_scopes_value = (
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
  match dtp_log_scopes_value with
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

let dtp_log_pid_value = Unix.getpid ()
let dtp_log_pid () = dtp_log_pid_value

let dtp_log_format_value = (
  String.lowercase_ascii (try Sys.getenv "VUNA_LOG_FORMAT" with Not_found -> ""))
let dtp_log_json_mode () = dtp_log_format_value = "jsonl"

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
(* observability.md). Off by default: probe reads one int at init.    *)
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

let dtp_obs_level_value = (
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

let dtp_obs_level (_ : int) = dtp_obs_level_value
let dtp_obs_on () = dtp_obs_level_value > 0
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

(* Reservoir (Algorithm R): keep a uniform sample of the whole run instead of
   its first 8192 samples. Integer-only and allocation-free, so it is safe in
   memprof callbacks and signal handlers. *)
let dtp_obs_rand_state = ref 0x2545F4914F6CDD1D

let dtp_obs_rand () =
  let x = !dtp_obs_rand_state in
  let x = (x lxor (x lsl 13)) land max_int in
  let x = (x lxor (x lsr 7)) land max_int in
  let x = (x lxor (x lsl 17)) land max_int in
  dtp_obs_rand_state := x;
  x

type dtp_obs_ring = {
  dtp_ring_slots : Printexc.raw_backtrace option array;
  mutable dtp_ring_n : int;
  mutable dtp_ring_seen : int;
}

let dtp_obs_ring_make () =
  { dtp_ring_slots = Array.make dtp_obs_cap None; dtp_ring_n = 0; dtp_ring_seen = 0 }

let dtp_obs_ring_add (r : dtp_obs_ring) (bt : Printexc.raw_backtrace) =
  r.dtp_ring_seen <- r.dtp_ring_seen + 1;
  if r.dtp_ring_n < dtp_obs_cap then begin
    r.dtp_ring_slots.(r.dtp_ring_n) <- Some bt;
    r.dtp_ring_n <- r.dtp_ring_n + 1
  end else begin
    let j = dtp_obs_rand () mod r.dtp_ring_seen in
    if j < dtp_obs_cap then r.dtp_ring_slots.(j) <- Some bt
  end

let dtp_obs_ring_reset (r : dtp_obs_ring) =
  for i = 0 to r.dtp_ring_n - 1 do r.dtp_ring_slots.(i) <- None done;
  r.dtp_ring_n <- 0;
  r.dtp_ring_seen <- 0

let dtp_obs_cpu_ring = dtp_obs_ring_make ()
let dtp_obs_cpu_on = ref false

let dtp_obs_cpu_tick (_ : int) =
  if !dtp_obs_cpu_on then
    dtp_obs_ring_add dtp_obs_cpu_ring (Printexc.get_callstack 32)

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

let dtp_obs_mem_ring = dtp_obs_ring_make ()
let dtp_obs_mem_run : Gc.Memprof.t option ref = ref None

let dtp_obs_mem_add (bt : Printexc.raw_backtrace) =
  dtp_obs_ring_add dtp_obs_mem_ring bt

let dtp_obs_tracker : (unit, unit) Gc.Memprof.tracker =
  { alloc_minor =
      (fun (i : Gc.Memprof.allocation) -> dtp_obs_mem_add i.callstack; (None : unit option));
    alloc_major =
      (fun (i : Gc.Memprof.allocation) -> dtp_obs_mem_add i.callstack; (None : unit option));
    promote = (fun () -> None);
    dealloc_minor = (fun () -> ());
    dealloc_major = (fun () -> ()) }

let dtp_obs_emit_samples (name : string) (ring : dtp_obs_ring) =
  for i = 0 to ring.dtp_ring_n - 1 do
    match ring.dtp_ring_slots.(i) with
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
    dtp_obs_ring_reset dtp_obs_cpu_ring;
    dtp_obs_ring_reset dtp_obs_mem_ring;
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
    dtp_obs_emit_samples "vuna.sample.cpu" dtp_obs_cpu_ring;
    dtp_obs_emit_samples "vuna.sample.mem" dtp_obs_mem_ring;
    ignore (dtp_obs_counter "vuna.counter.sample.cpu" dtp_obs_cpu_ring.dtp_ring_seen);
    ignore (dtp_obs_counter "vuna.counter.sample.mem" dtp_obs_mem_ring.dtp_ring_seen);
    dtp_obs_flush ()
  end
