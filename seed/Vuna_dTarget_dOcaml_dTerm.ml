open Vuna_runtime
type t_GenSt = { f_GenSt_gsShared : Vuna_dIr_dModel.t_IrShared; f_GenSt_gsQual : Vuna_dTarget_dOcaml_dDecl.t_QualCtx; f_GenSt_gsDeps : string B_dData_dList.t_List; f_GenSt_gsNormPath : (string) -> string }

# 37 "Vuna/Target/Ocaml/Term.vuna"
let v_dtRuntime = "type dt_gc_stat = {\n  dt_gs_minor_words : float;\n  dt_gs_promoted_words : float;\n  dt_gs_major_words : float;\n  dt_gs_minor_collections : int;\n  dt_gs_major_collections : int;\n  dt_gs_heap_words : int;\n  dt_gs_heap_chunks : int;\n  dt_gs_live_words : int;\n  dt_gs_live_blocks : int;\n  dt_gs_free_words : int;\n  dt_gs_free_blocks : int;\n  dt_gs_largest_free : int;\n  dt_gs_fragments : int;\n  dt_gs_compactions : int;\n  dt_gs_top_heap_words : int;\n  dt_gs_stack_size : int;\n}\nexternal dt_gc_quick_stat : unit -> dt_gc_stat = \"caml_gc_quick_stat\"\n(* GC \229\143\130\230\149\176\232\181\176 `caml_gc_get` / `caml_gc_set`\239\188\136\228\184\142 stdlib `Gc.get/set` \229\144\140\228\184\128\231\187\132 C \229\142\159\232\175\173\239\188\137\239\188\140\n   \228\184\141\229\188\149\231\148\168 `Gc` \230\168\161\229\157\151\226\128\148\226\128\148`Gc` \228\188\154\230\138\138 Printexc / Printf / Buffer \230\149\180\228\184\178\230\139\150\232\191\155\230\175\143\228\184\170\228\186\167\231\137\169\227\128\130\n   \229\173\151\230\174\181\233\161\186\229\186\143\228\184\142 `Gc.control` \228\184\128\232\135\180\239\188\136\231\137\136\230\156\172\229\141\135\231\186\167\230\151\182\232\191\153\233\135\140\232\166\129\232\183\159\231\157\128 mli \232\181\176\239\188\137\227\128\130 *)\ntype dt_gc_control = {\n  dt_gc_minor_heap_size : int;\n  dt_gc_major_heap_increment : int;\n  dt_gc_space_overhead : int;\n  dt_gc_verbose : int;\n  dt_gc_max_overhead : int;\n  dt_gc_stack_limit : int;\n  dt_gc_allocation_policy : int;\n  dt_gc_window_size : int;\n  dt_gc_custom_major_ratio : int;\n  dt_gc_custom_minor_ratio : int;\n  dt_gc_custom_minor_max_size : int;\n}\nexternal dt_gc_get : unit -> dt_gc_control = \"caml_gc_get\"\nexternal dt_gc_set : dt_gc_control -> unit = \"caml_gc_set\"\n(* 8 MB minor heap\239\188\1361048576 words\239\188\137+ space_overhead 200\227\128\130\n   minor heap \230\152\175\227\128\140\229\136\134\233\133\141\229\175\134\233\155\134\229\158\139\231\159\173\231\168\139\229\186\143 vs \230\183\177\230\160\136\231\168\139\229\186\143\227\128\141\228\185\139\233\151\180\231\154\132\229\141\149\228\184\128\230\151\139\233\146\174\239\188\154\n   - 2 MB\239\188\136OCaml \233\187\152\232\174\164\239\188\137\229\175\185\231\159\173\229\145\189\229\136\134\233\133\141\230\156\128\231\156\129\239\188\136micro_concat 14ms vs 18ms\239\188\137\239\188\140\228\189\134\230\175\143\230\172\161 minor GC\n     \232\166\129\230\137\171\230\160\136\239\188\140400k \229\177\130 handler \231\154\132\230\183\177\229\186\166\229\164\185\229\133\183\229\155\160\230\173\164\228\187\142 2.2x \230\182\168\229\136\176 3.4x \229\162\158\233\149\191\239\188\136checks.vuna-effect-machine-growth\239\188\137\239\188\155\n   - 16 MB \229\175\185\230\183\177\230\160\136\230\156\128\229\143\139\229\165\189\239\188\136\229\144\140\229\164\185\229\133\183 2.2x\239\188\137\239\188\140\228\189\134\229\136\134\233\133\141\229\175\134\233\155\134\231\168\139\229\186\143\230\133\162 40%\239\188\155\n   - 8 MB \232\144\189\229\156\168\228\184\164\232\128\133\228\185\139\233\151\180\239\188\154\230\183\177\229\186\166\229\164\185\229\133\183 2.6x\239\188\136\233\151\168\231\166\129 3.0x\239\188\137\239\188\140micro_concat \231\186\166 +3ms\227\128\130\n   \232\175\187\230\149\176\232\167\129 docs/reference/performance-hotspots.md \231\154\132 GC \230\174\181\227\128\130 *)\nlet () =\n  let c = dt_gc_get () in\n  dt_gc_set { c with dt_gc_minor_heap_size = 1048576; dt_gc_space_overhead = 200 }\nlet () =\n  if (try Sys.getenv \"VN_PERF_STATS\" with Not_found -> \"\") <> \"\" then\n    at_exit (fun () ->\n      let s = dt_gc_quick_stat () in\n      let w = float_of_int Sys.word_size /. 8. in\n      let allocated = (s.dt_gs_minor_words +. s.dt_gs_major_words -. s.dt_gs_promoted_words) *. w in\n      prerr_string\n        (\"VN_PERF minor_words=\" ^ string_of_int (int_of_float s.dt_gs_minor_words)\n         ^ \" major_words=\" ^ string_of_int (int_of_float s.dt_gs_major_words)\n         ^ \" minor_collections=\" ^ string_of_int s.dt_gs_minor_collections\n         ^ \" major_collections=\" ^ string_of_int s.dt_gs_major_collections\n         ^ \" top_heap_words=\" ^ string_of_int s.dt_gs_top_heap_words\n         ^ \" allocated_words=\" ^ string_of_int (int_of_float allocated) ^ \"\\n\"))\nlet bi_add a b = a + b\nlet bi_sub a b = a - b\nlet bi_mul a b = a * b\nlet bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\nlet bi_eq_int (a : int) (b : int) = a = b\nlet bi_neq_int (a : int) (b : int) = a <> b\nlet bi_eq_str (a : string) (b : string) = a = b\nlet bi_neq_str (a : string) (b : string) = a <> b\nlet bi_strFromInt (n : int) = string_of_int n\nlet bi_lt_int (a : int) (b : int) = a < b\nlet bi_le_int (a : int) (b : int) = a <= b\nlet bi_gt_int (a : int) (b : int) = a > b\nlet bi_ge_int (a : int) (b : int) = a >= b\nlet bi_lt_str (a : string) (b : string) = a < b\nlet bi_le_str (a : string) (b : string) = a <= b\nlet bi_gt_str (a : string) (b : string) = a > b\nlet bi_ge_str (a : string) (b : string) = a >= b\nlet bi_lt_bool (a : bool) (b : bool) = compare a b < 0\nlet bi_le_bool (a : bool) (b : bool) = compare a b <= 0\nlet bi_gt_bool (a : bool) (b : bool) = compare a b > 0\nlet bi_ge_bool (a : bool) (b : bool) = compare a b >= 0\nlet bi_concat a b = a ^ b\nlet bi_and a b = a && b\nlet bi_or a b = a || b\nlet bi_bitAnd (a : int) (b : int) = a land b\nlet bi_bitOr (a : int) (b : int) = a lor b\nlet bi_bitXor (a : int) (b : int) = a lxor b\nlet bi_bitNot (a : int) = lnot a\nlet bi_bitShl (a : int) (n : int) = if n < 0 || n >= 63 then 0 else a lsl n\nlet bi_bitShr (a : int) (n : int) = if n < 0 || n >= 63 then 0 else a lsr n\nlet bi_natSucc (n : int) = if n >= max_int then max_int else n + 1\nlet bi_natAdd (a : int) (b : int) = if a > max_int - b then max_int else a + b\nlet bi_natSub (a : int) (b : int) = if a <= b then 0 else a - b\nlet bi_natMul (a : int) (b : int) =\n  if a <= 0 || b <= 0 then 0 else if a > max_int / b then max_int else a * b\nlet bi_natDiv (a : int) (b : int) = if b = 0 then failwith \"division by zero\" else a / b\nlet bi_natToInt (n : int) = n\nlet bi_natFromInt (n : int) = if n <= 0 then 0 else n\nlet dt_show_bool b = if b then \"True\" else \"False\"\n"

# 147 "Vuna/Target/Ocaml/Term.vuna"
let v_dtEffRuntimeHead = "type _ Effect.t += Perform : int * int * string * string * Obj.t -> Obj.t Effect.t\n\n(* \230\180\190\229\143\145 id\239\188\154\228\184\142\231\188\150\232\175\145\229\153\168 dispatchIdOf \229\143\138 native / wasm runtime \229\144\140\228\184\128\229\133\172\229\188\143\n   \239\188\136FNV-1a 32 \228\189\141\239\188\140\230\156\128\229\144\142\229\143\150\228\189\142 30 \228\189\141\239\188\137\239\188\140\228\184\137\231\171\175\229\175\185\229\144\140\228\184\128\232\183\175\231\148\177\228\184\178\229\191\133\233\161\187\229\190\151\229\136\176\229\144\140\228\184\128\228\184\170\230\149\176\227\128\130 *)\nlet dtp_effectId (s : string) : int =\n  let h = ref 2166136261 in\n  for i = 0 to String.length s - 1 do\n    h := ((!h lxor Char.code (String.unsafe_get s i)) * 16777619) land 0xFFFFFFFF\n  done;\n  !h land 0x3FFFFFFF\n\n(* bracket \231\154\132 abort cleanup \231\153\187\232\174\176\232\161\168\239\188\136\230\175\143\231\186\164\231\168\139\228\184\128\228\187\189\239\188\140LIFO\239\188\137\227\128\130\n   `prim_effectHandleId` \229\156\168\229\174\137\232\163\133 handler \230\151\182\232\174\176\228\184\139\229\189\147\229\137\141\230\183\177\229\186\166 mark\239\188\155handler \230\173\163\229\184\184\232\191\148\229\155\158 /\n   \230\138\155\229\188\130\229\184\184 / \228\184\162\229\188\131\231\187\173\229\187\182\239\188\136abort\239\188\137\230\151\182\239\188\140\230\138\138 mark \228\185\139\228\184\138\228\187\141\230\156\170\229\188\185\229\135\186\231\154\132 cleanup \233\128\144\228\184\170\230\137\167\232\161\140\226\128\148\226\128\148\232\191\153\228\186\155\n   \230\173\163\230\152\175\232\162\171\228\184\162\229\188\131\231\154\132\231\187\173\229\187\182\233\135\140\230\137\147\229\188\128\231\154\132 bracket\227\128\130\231\186\164\231\168\139\231\148\168\229\189\147\229\137\141\231\186\164\231\168\139 id \229\140\186\229\136\134\239\188\136\232\176\131\229\186\166\229\153\168\229\156\168\232\191\144\232\161\140\230\159\144\228\184\170\n   \228\187\187\229\138\161\230\151\182\232\174\190\231\189\174\229\174\131\239\188\137\239\188\155\233\157\158\232\176\131\229\186\166\229\153\168\228\184\138\228\184\139\230\150\135\239\188\136-1\239\188\137\230\156\137\228\184\128\228\187\189\231\139\172\231\171\139\230\160\136\227\128\130\231\138\182\230\128\129\230\148\190\229\156\168 `Domain.DLS` \233\135\140\239\188\154\n   \230\175\143\228\184\170 domain\239\188\136\231\186\191\231\168\139\239\188\137\230\156\137\232\135\170\229\183\177\231\154\132 cleanup \230\160\136\239\188\140domain \228\185\139\233\151\180\228\186\146\228\184\141\229\185\178\230\137\176\227\128\130\n   \230\179\168\230\132\143\239\188\154cleanup \229\156\168 handler \233\128\128\229\135\186\231\130\185\230\137\167\232\161\140\239\188\140\229\143\170\232\131\189\232\174\191\233\151\174**\229\164\150\229\177\130** handler\239\188\136\229\189\147\229\137\141 handler\n   \231\154\132\230\149\136\229\186\148\229\156\168\232\175\165\231\130\185\228\184\141\229\143\175\231\148\168\239\188\137\239\188\155\230\137\167\232\161\140\230\156\159\229\188\130\229\184\184\232\162\171\229\144\158\230\142\137\239\188\140\233\129\191\229\133\141\230\177\161\230\159\147 abort \231\187\147\230\158\156\227\128\130\n   \232\161\168\231\164\186\230\152\175\227\128\140\230\149\176\231\187\132 + \230\183\177\229\186\166\227\128\141\239\188\154push / pop / mark \233\131\189\230\152\175 O(1)\239\188\140pop \230\151\182\230\184\133\230\167\189\233\135\138\230\148\190\233\151\173\229\140\133\227\128\130 *)\ntype dtp_cleanup_stack = {\n  mutable dtp_cs_items : (int -> int) array;\n  mutable dtp_cs_len : int;\n}\ntype dtp_cleanup_state = {\n  mutable dtp_cs_fiber : int;\n  mutable dtp_cs_stacks : (int * dtp_cleanup_stack) list;\n}\nlet dtp_cleanup_stateK =\n  Domain.DLS.new_key (fun () -> { dtp_cs_fiber = -1; dtp_cs_stacks = [] })\nlet dtp_cleanup_state () = Domain.DLS.get dtp_cleanup_stateK\nlet dtp_cleanup_fiber_get () = (dtp_cleanup_state ()).dtp_cs_fiber\nlet dtp_cleanup_fiber_set (fid : int) = (dtp_cleanup_state ()).dtp_cs_fiber <- fid\n(* \230\175\143 domain \231\154\132\230\180\187\231\186\164\231\168\139\230\149\176\229\190\136\229\176\143\239\188\136\233\128\154\229\184\184 1\226\128\1472 \230\157\161\239\188\137\239\188\140\229\133\179\232\129\148\232\161\168\230\175\148 Hashtbl \230\155\180\232\189\187\239\188\155Hashtbl \228\188\154\n   \230\138\138 Random / Printexc / Printf / Buffer \230\149\180\228\184\178\230\139\150\232\191\155\228\186\167\231\137\169\239\188\140\231\186\175\231\168\139\229\186\143\231\154\132\229\144\175\229\138\168\230\136\144\230\156\172\230\152\142\230\152\190\229\143\152\233\171\152\227\128\130 *)\nlet rec dtp_cs_lookup fid = function\n  | [] -> None\n  | (k, r) :: rest -> if k = fid then Some r else dtp_cs_lookup fid rest\nlet dtp_cleanup_stack_of (fid : int) =\n  let s = dtp_cleanup_state () in\n  match dtp_cs_lookup fid s.dtp_cs_stacks with\n  | Some r -> r\n  | None ->\n    let r = { dtp_cs_items = Array.make 8 (fun _ -> 0); dtp_cs_len = 0 } in\n    s.dtp_cs_stacks <- (fid, r) :: s.dtp_cs_stacks;\n    r\nlet dtp_cleanup_current () = dtp_cleanup_stack_of (dtp_cleanup_fiber_get ())\nlet dtp_cleanup_mark () = (dtp_cleanup_current ()).dtp_cs_len\nlet dtp_cleanup_drain_to (s : dtp_cleanup_stack) (mark : int) =\n  while s.dtp_cs_len > mark do\n    let i = s.dtp_cs_len - 1 in\n    let f = s.dtp_cs_items.(i) in\n    s.dtp_cs_items.(i) <- (fun _ -> 0);\n    s.dtp_cs_len <- i;\n    (try ignore (f 0) with _ -> ())\n  done\nlet dtp_cleanup_run_to (mark : int) = dtp_cleanup_drain_to (dtp_cleanup_current ()) mark\nlet dtp_cleanup_run_all_for (fid : int) =\n  dtp_cleanup_drain_to (dtp_cleanup_stack_of fid) 0\nlet dtp_cleanup_forget (fid : int) =\n  let s = dtp_cleanup_state () in\n  s.dtp_cs_stacks <- List.filter (fun (k, _) -> k <> fid) s.dtp_cs_stacks\nlet dtp_cleanup_reset () =\n  let s = dtp_cleanup_state () in\n  s.dtp_cs_stacks <- [];\n  s.dtp_cs_fiber <- -1\n"

# 220 "Vuna/Target/Ocaml/Term.vuna"
let v_dtEffRuntimeFull = "(* \229\189\147\229\137\141 handler \231\154\132 self \230\160\136\239\188\136\230\175\143\228\184\170 Domain \228\184\128\228\187\189\239\188\137\239\188\154opH \230\137\167\232\161\140\230\156\159\233\151\180\229\142\139\229\133\165\n   (keyId,nameId,key,name,ret,h)\239\188\140`prim_effectSelf` \231\148\168\229\174\131\230\138\138\229\173\144\232\174\161\231\174\151\233\135\141\230\150\176\232\163\133\232\191\155\229\144\140\228\184\128\228\184\170 handler\227\128\130\n   \229\184\167\229\156\168\228\184\128\230\172\161\229\174\137\232\163\133\229\134\133\228\184\141\229\143\152\239\188\140\229\143\170\229\136\134\233\133\141\228\184\128\230\172\161\239\188\155\230\175\143\230\172\161 perform \229\143\170\229\129\154\228\184\128\230\172\161 cons\227\128\130 *)\nlet dtp_selfK = Domain.DLS.new_key (fun () -> ref ([] : Obj.t list))\nlet dtp_effect_run key name kid nid ret h th =\n  let mark = dtp_cleanup_mark () in\n  let st = Domain.DLS.get dtp_selfK in\n  (* \229\184\167\229\156\168\228\184\128\230\172\161\229\174\137\232\163\133\229\134\133\228\184\141\229\143\152\239\188\154\229\143\170\229\136\134\233\133\141\228\184\128\230\172\161\239\188\140resumption \233\151\173\229\140\133\230\141\149\232\142\183\229\174\131\239\188\1361 \228\184\170\229\173\151\230\174\181\239\188\137\239\188\140\n     \230\175\143\230\172\161 perform \229\143\170 cons \228\184\128\230\172\161\227\128\130 *)\n  let frame = Obj.repr (kid, nid, key, name, Obj.repr ret, Obj.repr h) in\n  (* \229\164\150\229\177\130 Obj.magic \228\184\142 continuation \231\154\132 Obj.t \232\161\168\231\164\186\228\184\128\232\135\180\239\188\154effc \231\154\132 continue \232\191\148\229\155\158 Obj.t\239\188\140\n     \229\142\187\230\142\137\229\174\131\228\188\154\232\174\169 handler \231\154\132 answer \231\177\187\229\158\139\232\162\171\233\146\137\230\136\144 Obj.t\227\128\130 *)\n  try\n    let r =\n      Obj.magic\n        (match Effect.Deep.match_with th ()\n          { retc = (fun x -> (Obj.magic ret) x);\n            exnc = (fun e -> raise e);\n            effc = (fun (type a) (eff : a Effect.t) -> match eff with\n              | Perform (k, n, _, _, payload) when k = kid && n = nid ->\n                Some (fun (cont : (a, Obj.t) Effect.Deep.continuation) ->\n                  let saved = !st in\n                  st := frame :: saved;\n                  (try\n                     let r = (Obj.magic h) payload (fun v -> Effect.Deep.continue cont (Obj.repr v)) in\n                     st := saved; r\n                   with e -> st := saved; raise e))\n              | _ -> None) }\n        with\n        | r -> r\n        | exception e -> raise e)\n    in\n    dtp_cleanup_run_to mark; r\n  with e -> dtp_cleanup_run_to mark; raise e\nlet dtp_effect_handle_id key name kid nid ret h th =\n  fun u -> dtp_effect_run key name kid nid ret h (fun () -> (Obj.magic th) u)\n"

# 260 "Vuna/Target/Ocaml/Term.vuna"
let v_dtEffScopedRuntime = "let dtp_effect_self th =\n  match !(Domain.DLS.get dtp_selfK) with\n  | top :: _ ->\n    let (kid, nid, key, name, ret, h) = Obj.obj top in\n    dtp_effect_run key name kid nid ret h (fun () -> (Obj.magic th) 0)\n  | [] -> failwith \"self outside handler\"\n"

# 270 "Vuna/Target/Ocaml/Term.vuna"
let v_dtEffBracketRuntime = "let dtp_cleanup_push (f : int -> int) : int =\n  let s = dtp_cleanup_current () in\n  if s.dtp_cs_len = Array.length s.dtp_cs_items then begin\n    let b = Array.make (2 * s.dtp_cs_len + 8) (fun _ -> 0) in\n    Array.blit s.dtp_cs_items 0 b 0 s.dtp_cs_len;\n    s.dtp_cs_items <- b\n  end;\n  s.dtp_cs_items.(s.dtp_cs_len) <- f;\n  s.dtp_cs_len <- s.dtp_cs_len + 1;\n  0\nlet dtp_cleanup_pop (_ : int) : int =\n  let s = dtp_cleanup_current () in\n  if s.dtp_cs_len > 0 then begin\n    let i = s.dtp_cs_len - 1 in\n    s.dtp_cs_items.(i) <- (fun _ -> 0);\n    s.dtp_cs_len <- i\n  end;\n  0\n"

# 292 "Vuna/Target/Ocaml/Term.vuna"
let v_dtEffRuntimeTail = "let dtp_output_mutex = Mutex.create ()\nlet dtp_with_output_lock (f : unit -> int) : int =\n  Mutex.lock dtp_output_mutex;\n  (try\n     let r = f () in\n     Mutex.unlock dtp_output_mutex; r\n   with e -> Mutex.unlock dtp_output_mutex; raise e)\nlet dtp_print s =\n  (* \229\134\153\229\164\177\232\180\165\239\188\136\229\133\184\229\158\139 EPIPE\239\188\154`vuna \226\128\166 | head`\239\188\137\228\184\141\229\134\141\230\152\175\229\174\191\228\184\187\229\180\169\230\186\131\239\188\155\232\190\147\229\135\186\229\136\176\230\173\164\228\184\186\230\173\162\227\128\130\n     \233\148\129\228\191\157\232\175\129\229\164\154 domain \229\185\182\229\143\145\230\137\147\229\141\176\230\151\182\230\175\143\230\172\161\232\176\131\231\148\168\230\149\180\228\189\147\232\190\147\229\135\186\227\128\129\228\184\141\228\186\164\233\148\153\227\128\130 *)\n  dtp_with_output_lock (fun () -> try print_string s; flush stdout; String.length s with _ -> 0)\nlet dtp_eprint s =\n  dtp_with_output_lock (fun () -> try prerr_string s; flush stderr; String.length s with _ -> 0)\n(* \229\174\191\228\184\187\229\164\177\232\180\165\233\128\154\233\129\147\239\188\154try \229\143\152\228\189\147\228\184\141\230\138\155\229\174\191\228\184\187\229\188\130\229\184\184\239\188\140\232\128\140\230\152\175\230\138\138\229\164\177\232\180\165\231\160\129\229\134\153\232\191\155**\229\189\147\229\137\141 Domain** \231\154\132\231\138\182\230\128\129\230\167\189\239\188\140\n   \232\191\148\229\155\158\233\187\152\232\174\164\229\128\188\239\188\155base \231\154\132\229\174\191\228\184\187 handler \233\154\143\229\144\142\232\175\187 status \232\189\172\230\136\144 typed error\227\128\1300 = \230\136\144\229\138\159\227\128\130\n   \231\148\168 Domain.DLS \232\128\140\228\184\141\230\152\175\229\133\168\229\177\128 ref\239\188\154\229\188\130\230\173\165\228\187\187\229\138\161\228\188\154\229\156\168\229\136\171\231\154\132 Domain \228\184\138\232\183\145\227\128\130 *)\nlet dtp_hostStatusK = Domain.DLS.new_key (fun () -> ref 0)\nlet dtp_hostSetStatus c = (Domain.DLS.get dtp_hostStatusK) := c\nlet dtp_hostStatus () = !(Domain.DLS.get dtp_hostStatusK)\nlet dtp_hostFail code = dtp_hostSetStatus (if code = 0 then 9 else code)\nlet dtp_hostReset () = dtp_hostSetStatus 0\nlet dtp_hostMark code e =\n  ignore e;\n  dtp_hostSetStatus (if code = 0 then 9 else code)\nlet dtp_readFile path =\n  try\n    let ch = open_in_bin path in\n    (try\n       let r = really_input_string ch (in_channel_length ch) in\n       close_in_noerr ch; r\n     with e -> close_in_noerr ch; raise e)\n  with Sys_error msg -> failwith (\"readFile: \" ^ msg)\nlet dtp_readFileRange path offset length =\n  try\n    if offset < 0 || length <= 0 then \"\"\n    else\n      let ch = open_in_bin path in\n      (try\n         let r =\n           let size = in_channel_length ch in\n           if offset >= size then \"\"\n           else (seek_in ch offset; really_input_string ch (min length (size - offset))) in\n         close_in_noerr ch; r\n       with e -> close_in_noerr ch; raise e)\n  with Sys_error msg -> failwith (\"readFileRange: \" ^ msg)\nlet dtp_writeFile path contents =\n  try\n    let ch = open_out_bin path in\n    (try output_string ch contents; close_out_noerr ch\n     with e -> close_out_noerr ch; raise e);\n    String.length contents\n  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)\nlet dtp_getArgs () =\n  let argv = Sys.argv in\n  let n = Array.length argv in\n  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))\nlet dtp_readLine () =\n  (try dtp_hostReset (); input_line stdin\n   with End_of_file -> dtp_hostSetStatus 1; \"\")\nlet dtp_readBytes n =\n  if n <= 0 then (dtp_hostSetStatus 1; \"\")\n  else\n    let b = Bytes.create n in\n    let k = (try dtp_hostReset (); input stdin b 0 n with _ -> 0) in\n    if k <= 0 then (dtp_hostSetStatus 1; \"\") else Bytes.sub_string b 0 k\nlet dtp_readDir path =\n  try List.sort compare (Array.to_list (Sys.readdir path))\n  with Sys_error msg -> failwith (\"readDir: \" ^ msg)\nlet dtp_isDirectory path =\n  try Sys.is_directory path with Sys_error msg -> failwith (\"isDirectory: \" ^ msg)\nlet dtp_makeDir path =\n  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))\n  with Sys_error msg -> failwith (\"makeDir: \" ^ msg)\nlet dtp_removeFile path =\n  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)\n  with Sys_error msg -> failwith (\"removeFile: \" ^ msg)\nlet dtp_fileExists path = Sys.file_exists path\nlet dtp_getenv k = try Sys.getenv k with Not_found -> \"\"\nlet dtp_getcwd () = try Sys.getcwd () with _ -> \".\"\n(* POSIX shell \229\141\149\229\188\149\229\143\183\232\189\172\228\185\137\239\188\136\228\184\142 Filename.quote \229\144\140\229\189\162\239\188\137\239\188\154\229\143\170\231\187\153 Sys.command \231\148\168\227\128\130\n   \228\184\141\229\188\149\231\148\168 Filename \230\168\161\229\157\151\226\128\148\226\128\148\229\174\131\228\188\154\230\138\138 Printexc / Printf / Buffer \230\139\150\232\191\155\230\175\143\228\184\170\228\186\167\231\137\169\227\128\130 *)\nlet dtp_shell_quote s =\n  let q = String.make 1 (Char.chr 39) in\n  let esc = q ^ String.make 1 (Char.chr 92) ^ q in\n  q ^ String.concat esc (String.split_on_char (Char.chr 39) s) ^ q\nlet dtp_runIn dir args =\n  dtp_hostReset ();\n  let quote s = dtp_shell_quote s in\n  let cmd = String.concat \" \" (List.map quote args) in\n  (* `cd` \229\156\168 shell \233\135\140\229\129\154\239\188\154\232\191\155\231\168\139\231\186\167 cwd \228\184\141\229\138\168\239\188\136\229\164\154 domain \228\184\139\228\184\141\232\131\189\230\148\185\232\191\155\231\168\139 cwd\239\188\137\227\128\130\n     125 \230\152\175\227\128\140\231\155\174\229\189\149\232\191\155\228\184\141\229\142\187\227\128\141\231\154\132\228\191\157\231\149\153\229\147\168\229\133\181\239\188\136\228\184\142\229\145\189\228\187\164\232\135\170\229\183\177\231\154\132\233\128\128\229\135\186\231\160\129\229\140\186\229\136\134\239\188\137\227\128\130 *)\n  let code = Sys.command (\"cd \" ^ quote dir ^ \" || exit 125; \" ^ cmd) in\n  if code = 125 then (dtp_hostSetStatus 1; -1) else code\nlet dtp_net_next = ref 1\nlet dtp_net_parse (addr : string) =\n  let n = String.length addr in\n  if n > 5 && String.sub addr 0 5 = \"unix:\" then `Unix (String.sub addr 5 (n - 5))\n  else if n > 4 && String.sub addr 0 4 = \"tcp:\" then\n    let rest = String.sub addr 4 (n - 4) in\n    (match (try Some (String.rindex rest ':') with Not_found -> None) with\n     | None -> failwith (\"net: invalid address (want tcp:HOST:PORT or unix:PATH): \" ^ addr)\n     | Some i ->\n       let host = String.sub rest 0 i in\n       let portstr = String.sub rest (i + 1) (String.length rest - i - 1) in\n       let port = try int_of_string portstr with _ -> failwith (\"net: invalid port: \" ^ portstr) in\n       `Tcp (host, port))\n  else failwith (\"net: invalid address (want tcp:HOST:PORT or unix:PATH): \" ^ addr)\n"

# 406 "Vuna/Target/Ocaml/Term.vuna"
let v_dtPrimRuntime = "let dtp_exit n = exit n\n"

# 412 "Vuna/Target/Ocaml/Term.vuna"
let v_dtStrHelperNames = (B_dData_dList.C_List__x58__x58_ ("bi_strLength", (B_dData_dList.C_List__x58__x58_ ("bi_strUnpack", (B_dData_dList.C_List__x58__x58_ ("bi_strPack", (B_dData_dList.C_List__x58__x58_ ("dt_show_string", (B_dData_dList.C_List__x58__x58_ ("dtp_strHash", (B_dData_dList.C_List__x58__x58_ ("dtp_strAt", (B_dData_dList.C_List__x58__x58_ ("dtp_substring", B_dData_dList.C_List_Nil))))))))))))))

# 424 "Vuna/Target/Ocaml/Term.vuna"
let v_dtArrHelperNames = (B_dData_dList.C_List__x58__x58_ ("dtp_arraySet", (B_dData_dList.C_List__x58__x58_ ("dtp_dynNew", (B_dData_dList.C_List__x58__x58_ ("dtp_dynGet", (B_dData_dList.C_List__x58__x58_ ("dtp_dynSet", (B_dData_dList.C_List__x58__x58_ ("dtp_dynPush", (B_dData_dList.C_List__x58__x58_ ("dtp_dynLen", (B_dData_dList.C_List__x58__x58_ ("dtp_dynClear", B_dData_dList.C_List_Nil))))))))))))))

# 436 "Vuna/Target/Ocaml/Term.vuna"
let v_dtBufHelperNames = (B_dData_dList.C_List__x58__x58_ ("dtp_mbufNew", (B_dData_dList.C_List__x58__x58_ ("dtp_mbufAppend", (B_dData_dList.C_List__x58__x58_ ("dtp_mbufAppendChar", (B_dData_dList.C_List__x58__x58_ ("dtp_mbufLen", (B_dData_dList.C_List__x58__x58_ ("dtp_mbufClear", (B_dData_dList.C_List__x58__x58_ ("dtp_mbufToString", B_dData_dList.C_List_Nil))))))))))))

# 448 "Vuna/Target/Ocaml/Term.vuna"
let v_dtArrRuntime = "let dtp_arraySet (a : 'a array) (i : int) (v : 'a) =\n  let b = Array.copy a in\n  Array.set b i v; b\nlet dtp_dynNew cap =\n  ref (Obj.repr (Array.make (if cap < 1 then 1 else cap) (Obj.repr 0), 0))\nlet dtp_dynLen (r : Obj.t ref) = snd (Obj.obj !r : Obj.t array * int)\nlet dtp_dynGet (r : Obj.t ref) i =\n  let (a, n) = (Obj.obj !r : Obj.t array * int) in\n  if i < 0 || i >= n then invalid_arg \"index out of bounds\" else Obj.obj a.(i)\nlet dtp_dynSet (r : Obj.t ref) i v =\n  let (a, n) = (Obj.obj !r : Obj.t array * int) in\n  if i < 0 || i >= n then invalid_arg \"index out of bounds\"\n  else begin a.(i) <- Obj.repr v; 0 end\nlet dtp_dynPush (r : Obj.t ref) v =\n  let (a, n) = (Obj.obj !r : Obj.t array * int) in\n  if n < Array.length a then begin\n    a.(n) <- Obj.repr v;\n    r := Obj.repr (a, n + 1)\n  end else begin\n    let cap = Array.length a in\n    let ncap = if cap * 2 < 8 then 8 else cap * 2 in\n    let b = Array.make ncap (Obj.repr 0) in\n    Array.blit a 0 b 0 n;\n    b.(n) <- Obj.repr v;\n    r := Obj.repr (b, n + 1)\n  end;\n  0\nlet dtp_dynClear (r : Obj.t ref) =\n  let (a, _) = (Obj.obj !r : Obj.t array * int) in\n  r := Obj.repr (a, 0); 0\n"

# 482 "Vuna/Target/Ocaml/Term.vuna"
let v_dtBufRuntime = "let dtp_mbufNew cap =\n  ref (Obj.repr (Bytes.create (if cap < 1 then 16 else cap), 0))\nlet dtp_mbufEnsure (r : Obj.t ref) need =\n  let (b, n) = (Obj.obj !r : bytes * int) in\n  if need <= Bytes.length b then (b, n)\n  else\n    let cap = ref (Bytes.length b * 2) in\n    (while !cap < need do cap := !cap * 2 done;\n     let nb = Bytes.create !cap in\n     Bytes.blit b 0 nb 0 n;\n     (nb, n))\nlet dtp_mbufAppend (r : Obj.t ref) s =\n  let (_, n) = (Obj.obj !r : bytes * int) in\n  let k = String.length s in\n  let (b2, n2) = dtp_mbufEnsure r (n + k) in\n  Bytes.blit_string s 0 b2 n2 k;\n  r := Obj.repr (b2, n2 + k); 0\nlet dtp_mbufAppendChar (r : Obj.t ref) c =\n  let (_, n) = (Obj.obj !r : bytes * int) in\n  let (b2, n2) = dtp_mbufEnsure r (n + 1) in\n  Bytes.set b2 n2 (Char.chr c);\n  r := Obj.repr (b2, n2 + 1); 0\nlet dtp_mbufLen (r : Obj.t ref) = snd (Obj.obj !r : bytes * int)\nlet dtp_mbufClear (r : Obj.t ref) =\n  let (b, _) = (Obj.obj !r : bytes * int) in\n  r := Obj.repr (b, 0); 0\nlet dtp_mbufToString (r : Obj.t ref) =\n  let (b, n) = (Obj.obj !r : bytes * int) in\n  Bytes.sub_string b 0 n\n"

# 516 "Vuna/Target/Ocaml/Term.vuna"
let v_dtStrRuntime = "let bi_strLength (s : string) = String.length s\nlet bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])\nlet bi_strPack (cs : int list) =\n  let a = Array.of_list cs in\n  String.init (Array.length a) (fun i -> Char.chr a.(i))\nlet dt_show_string s =\n  let n = String.length s in\n  let b = Bytes.create (2 * n + 2) in\n  Bytes.set b 0 (Char.chr 34);\n  let o = ref 1 in\n  String.iter (fun c ->\n    let k = Char.code c in\n    if k = 34 then (Bytes.set b !o (Char.chr 92); Bytes.set b (!o + 1) (Char.chr 34); o := !o + 2)\n    else if k = 92 then (Bytes.set b !o (Char.chr 92); Bytes.set b (!o + 1) (Char.chr 92); o := !o + 2)\n    else if k = 10 then (Bytes.set b !o (Char.chr 92); Bytes.set b (!o + 1) (Char.chr 110); o := !o + 2)\n    else if k = 9 then (Bytes.set b !o (Char.chr 92); Bytes.set b (!o + 1) (Char.chr 116); o := !o + 2)\n    else if k = 13 then (Bytes.set b !o (Char.chr 92); Bytes.set b (!o + 1) (Char.chr 114); o := !o + 2)\n    else (Bytes.set b !o c; incr o)) s;\n  Bytes.set b !o (Char.chr 34);\n  Bytes.sub_string b 0 (!o + 1)\nlet dtp_strHash (s : string) =\n  let h = ref 0 in\n  String.iter (fun c -> h := ((!h * 33) + Char.code c) land 1023) s;\n  !h\nlet dtp_strAt (s : string) (i : int) = if i < 0 || i >= String.length s then -1 else Char.code s.[i]\nlet dtp_substring start len s =\n  let n = String.length s in\n  let st = if start < 0 then 0 else if start > n then n else start in\n  let ln = if len < 0 then 0 else if st + len > n then n - st else len in\n  String.sub s st ln\n"

# 553 "Vuna/Target/Ocaml/Term.vuna"
let v_dtSchedRuntime = "(* ------------------------------------------------------------------ *)\n(* Single-threaded cooperative fiber scheduler.                        *)\n(*                                                                     *)\n(* Fibers are one-shot OCaml 5 continuations captured by the root      *)\n(* Effect.Deep handler installed for every fiber. The scheduler loop   *)\n(* outside the fibers decides what runs next; suspension is requested  *)\n(* through private runtime effects (SchedYield/SchedAwait/WaitScope).  *)\n(* Tasks are `Eff Nil a` thunks: their user effects are handled       *)\n(* inside the fiber, and only the scheduler primitives cross fibers.   *)\n(* ------------------------------------------------------------------ *)\n\ntype _ Effect.t +=\n  | SchedYield : int Effect.t\n  | SchedAwait : int -> int Effect.t\n  | SchedWaitScope : int -> int Effect.t\n  | SchedWaitScopeTimeout : int * int -> int Effect.t\n\ntype dtp_sched_step =\n  | SchedStepYield of Obj.t\n  | SchedStepAwait of int * Obj.t\n  | SchedStepScope of int * Obj.t\n  | SchedStepScopeTimeout of int * int * Obj.t\n  | SchedStepDone of Obj.t\n  | SchedStepFailed of exn * Printexc.raw_backtrace\n\ntype dtp_sched_wait = SchedWaitNone | SchedWaitTask of int | SchedWaitScope of int | SchedWaitTimed\n\ntype dtp_sched_state =\n  | SchedQueued of Obj.t\n  | SchedRunning\n  | SchedSuspended\n  | SchedDone of Obj.t\n  | SchedFailed of exn * Printexc.raw_backtrace\n  | SchedCancelled\n\ntype dtp_sched_task = {\n  sched_tid : int;\n  mutable sched_state : dtp_sched_state;\n  mutable sched_start : (unit -> Obj.t) option;\n  mutable sched_cont : Obj.t option;\n  sched_scope : int;\n  mutable sched_wait : dtp_sched_wait;\n  mutable sched_waiters : int list;\n  mutable sched_cancel : bool;\n  mutable sched_grace : int;\n}\n\ntype dtp_sched_scope = {\n  sched_sid : int;\n  mutable sched_tasks : int list;\n  mutable sched_failed : string option;\n  mutable sched_waiters : int list;\n  mutable sched_timeout : bool;\n  mutable sched_completed : int;\n}\n\nlet dtp_sched_tasks : (int, dtp_sched_task) Hashtbl.t = Hashtbl.create 64\nlet dtp_sched_scopes : (int, dtp_sched_scope) Hashtbl.t = Hashtbl.create 16\nlet dtp_sched_ready : int Queue.t = Queue.create ()\nlet dtp_sched_next_task = ref 0\nlet dtp_sched_next_scope = ref 0\nlet dtp_sched_timeouts : (int * int * int) list ref = ref []\nlet dtp_sched_main_tid = ref 0\nlet dtp_sched_current = ref (-1)\nlet dtp_sched_main_result : Obj.t option ref = ref None\nlet dtp_sched_main_exn : (exn * Printexc.raw_backtrace) option ref = ref None\nlet dtp_sched_grace_steps = 64\n\nlet dtp_sched_reset () =\n  Hashtbl.reset dtp_sched_tasks;\n  Hashtbl.reset dtp_sched_scopes;\n  dtp_cleanup_reset ();\n  Queue.clear dtp_sched_ready;\n  dtp_sched_next_task := 0;\n  dtp_sched_next_scope := 0;\n  dtp_sched_timeouts := [];\n  dtp_sched_main_tid := 0;\n  dtp_sched_current := -1;\n  dtp_sched_main_result := None;\n  dtp_sched_main_exn := None\n\nlet dtp_sched_task id =\n  match Hashtbl.find_opt dtp_sched_tasks id with\n  | Some t -> t\n  | None -> failwith \"scheduler: invalid task handle\"\n\nlet dtp_sched_scope id =\n  match Hashtbl.find_opt dtp_sched_scopes id with\n  | Some s -> s\n  | None -> failwith \"scheduler: invalid scope handle\"\n\nlet dtp_sched_exn_msg e =\n  match e with\n  | Effect.Unhandled (Perform (_, _, key, name, _)) ->\n    Printf.sprintf \"unhandled effect %s (instance %s)\" key name\n  | Failure m -> m\n  | _ -> Printexc.to_string e\n\nlet dtp_sched_task_status t =\n  if t.sched_cancel then 1\n  else match t.sched_state with\n    | SchedDone _ -> 0\n    | SchedFailed _ -> 2\n    | SchedCancelled -> 1\n    | _ -> 0\n\nlet dtp_sched_enqueue t v =\n  t.sched_state <- SchedQueued v;\n  Queue.push t.sched_tid dtp_sched_ready\n\nlet dtp_sched_wake_scope s =\n  if s.sched_tasks = [] && s.sched_waiters <> [] then begin\n    let status =\n      if s.sched_timeout then 2\n      else if s.sched_failed <> None then 1\n      else 0\n    in\n    let ws = s.sched_waiters in\n    s.sched_waiters <- [];\n    dtp_sched_timeouts := List.filter (fun (w, _, _) -> not (List.mem w ws)) !dtp_sched_timeouts;\n    List.iter (fun wid ->\n      let w = dtp_sched_task wid in\n      w.sched_wait <- SchedWaitNone;\n      dtp_sched_enqueue w (Obj.repr status)) ws\n  end\n\nlet dtp_sched_finish t st =\n  t.sched_state <- st;\n  t.sched_wait <- SchedWaitNone;\n  let ws = t.sched_waiters in\n  t.sched_waiters <- [];\n  let status = dtp_sched_task_status t in\n  List.iter (fun wid ->\n    let w = dtp_sched_task wid in\n    w.sched_wait <- SchedWaitNone;\n    dtp_sched_enqueue w (Obj.repr status)) ws;\n  if t.sched_tid = !dtp_sched_main_tid then begin\n    match st with\n    | SchedDone v -> dtp_sched_main_result := Some v\n    | SchedFailed (e, bt) -> dtp_sched_main_exn := Some (e, bt)\n    | _ -> ()\n  end;\n  match Hashtbl.find_opt dtp_sched_scopes t.sched_scope with\n  | Some s ->\n    s.sched_tasks <- List.filter (fun x -> x <> t.sched_tid) s.sched_tasks;\n    s.sched_completed <- s.sched_completed + 1;\n    dtp_sched_wake_scope s\n  | None -> ()\n\nlet dtp_sched_remove_waiter t =\n  match t.sched_wait with\n  | SchedWaitTask id ->\n    let tg = dtp_sched_task id in\n    tg.sched_waiters <- List.filter (fun x -> x <> t.sched_tid) tg.sched_waiters\n  | SchedWaitScope id ->\n    let s = dtp_sched_scope id in\n    s.sched_waiters <- List.filter (fun x -> x <> t.sched_tid) s.sched_waiters\n  | SchedWaitTimed | SchedWaitNone -> ()\n\nlet dtp_sched_cancel_task t =\n  let terminal = match t.sched_state with\n    | SchedDone _ | SchedFailed _ | SchedCancelled -> true\n    | _ -> false\n  in\n  if t.sched_cancel || terminal then ()\n  else begin\n    t.sched_cancel <- true;\n    match t.sched_state with\n    | SchedQueued _ -> if t.sched_start <> None then dtp_sched_finish t SchedCancelled\n      else t.sched_state <- SchedQueued (Obj.repr 1)\n    | SchedSuspended ->\n      let code = match t.sched_wait with\n        | SchedWaitTask _ -> 1\n        | SchedWaitScope _ | SchedWaitTimed -> 3\n        | SchedWaitNone -> 1\n      in\n      dtp_sched_remove_waiter t;\n      dtp_sched_timeouts := List.filter (fun (w, _, _) -> w <> t.sched_tid) !dtp_sched_timeouts;\n      dtp_sched_enqueue t (Obj.repr code)\n    | _ -> ()\n  end\n\nlet dtp_sched_cancel_scope_tasks sid =\n  let s = dtp_sched_scope sid in\n  List.iter (fun id -> dtp_sched_cancel_task (dtp_sched_task id)) s.sched_tasks\n\nlet dtp_sched_effc (type a) (eff : a Effect.t)\n  : ((a, Obj.t) Effect.Deep.continuation -> Obj.t) option =\n  match eff with\n  | SchedYield -> Some (fun k -> Obj.repr (SchedStepYield (Obj.repr k)))\n  | SchedAwait id -> Some (fun k -> Obj.repr (SchedStepAwait (id, Obj.repr k)))\n  | SchedWaitScope id -> Some (fun k -> Obj.repr (SchedStepScope (id, Obj.repr k)))\n  | SchedWaitScopeTimeout (n, id) ->\n    Some (fun k -> Obj.repr (SchedStepScopeTimeout (n, id, Obj.repr k)))\n  | _ -> None\n\nlet dtp_sched_run_fresh t =\n  let start = match t.sched_start with\n    | Some f -> f\n    | None -> failwith \"scheduler: no start thunk\" in\n  t.sched_start <- None;\n  let r = Effect.Deep.match_with\n      (fun () -> start ())\n      ()\n      { retc = (fun x -> Obj.repr (SchedStepDone x));\n        exnc = (fun e -> Obj.repr (SchedStepFailed (e, Printexc.get_raw_backtrace ())));\n        effc = dtp_sched_effc } in\n  (Obj.obj r : dtp_sched_step)\n\nlet dtp_sched_run_resume t v =\n  let k = match t.sched_cont with\n    | Some rep -> (Obj.magic rep : (Obj.t, Obj.t) Effect.Deep.continuation)\n    | None -> failwith \"scheduler: no continuation\" in\n  let r = Effect.Deep.continue k v in\n  (Obj.obj r : dtp_sched_step)\n\nlet dtp_sched_new_task scope start =\n  let id = !dtp_sched_next_task in\n  dtp_sched_next_task := id + 1;\n  let t = {\n    sched_tid = id;\n    sched_state = SchedQueued (Obj.repr 0);\n    sched_start = Some start;\n    sched_cont = None;\n    sched_scope = scope;\n    sched_wait = SchedWaitNone;\n    sched_waiters = [];\n    sched_cancel = false;\n    sched_grace = dtp_sched_grace_steps;\n  } in\n  Hashtbl.replace dtp_sched_tasks id t;\n  (match Hashtbl.find_opt dtp_sched_scopes scope with\n   | Some s -> s.sched_tasks <- id :: s.sched_tasks\n   | None -> ());\n  Queue.push id dtp_sched_ready;\n  t\n\nlet dtp_sched_new_scope () =\n  let id = !dtp_sched_next_scope in\n  dtp_sched_next_scope := id + 1;\n  Hashtbl.replace dtp_sched_scopes id {\n    sched_sid = id;\n    sched_tasks = [];\n    sched_failed = None;\n    sched_waiters = [];\n    sched_timeout = false;\n    sched_completed = 0;\n  };\n  id\n\nlet dtp_sched_step t =\n  if t.sched_cancel then t.sched_grace <- t.sched_grace - 1;\n  if t.sched_cancel && t.sched_grace <= 0 then begin\n    (* \231\161\172\228\184\173\230\173\162\239\188\154\231\187\173\229\187\182\232\162\171\228\184\162\229\188\131\239\188\140bracket \231\154\132\229\186\147\229\177\130 finally \228\184\141\228\188\154\232\183\145\239\188\155\229\176\189\229\138\155\230\137\167\232\161\140\230\156\170\229\188\185\229\135\186\231\154\132\n       cleanup\239\188\136\229\174\131\228\187\172\229\143\170\232\131\189\229\129\154\230\151\160\230\149\136\229\186\148/\232\135\170\229\140\133\229\144\171\231\154\132\230\184\133\231\144\134\239\188\154\230\140\130\232\181\183\231\130\185\228\185\139\229\164\150\230\178\161\230\156\137 handler \230\160\136\239\188\137\227\128\130 *)\n    dtp_cleanup_run_all_for t.sched_tid;\n    dtp_cleanup_forget t.sched_tid;\n    dtp_sched_finish t SchedCancelled;\n    None\n  end\n  else Some (match t.sched_start with\n    | Some _ -> dtp_sched_run_fresh t\n    | None -> match t.sched_state with\n      | SchedQueued v -> t.sched_state <- SchedRunning; dtp_sched_run_resume t v\n      | _ -> failwith \"scheduler: bad task state\")\n\nlet dtp_sched_apply t (st : dtp_sched_step) =\n  match st with\n  | SchedStepYield krep ->\n    t.sched_cont <- Some krep;\n    t.sched_wait <- SchedWaitNone;\n    dtp_sched_enqueue t (Obj.repr (if t.sched_cancel then 1 else 0))\n  | SchedStepAwait (id, krep) ->\n    t.sched_cont <- Some krep;\n    t.sched_wait <- SchedWaitTask id;\n    t.sched_state <- SchedSuspended;\n    let tg = dtp_sched_task id in\n    tg.sched_waiters <- t.sched_tid :: tg.sched_waiters\n  | SchedStepScope (id, krep) ->\n    t.sched_cont <- Some krep;\n    t.sched_wait <- SchedWaitScope id;\n    t.sched_state <- SchedSuspended;\n    let s = dtp_sched_scope id in\n    s.sched_waiters <- t.sched_tid :: s.sched_waiters\n  | SchedStepScopeTimeout (n, id, krep) ->\n    t.sched_cont <- Some krep;\n    t.sched_wait <- SchedWaitTimed;\n    t.sched_state <- SchedSuspended;\n    let s = dtp_sched_scope id in\n    s.sched_waiters <- t.sched_tid :: s.sched_waiters;\n    (* n \230\152\175\227\128\140\229\188\128\229\167\139\231\173\137\229\190\133\228\185\139\229\144\142\227\128\141\231\154\132\232\176\131\229\186\166\230\173\165\233\162\132\231\174\151\239\188\154\230\173\166\232\163\133\232\191\153\230\172\161\231\173\137\229\190\133\231\154\132\233\130\163\228\184\128\230\173\165\228\184\141\231\174\151\227\128\130 *)\n    dtp_sched_timeouts := (t.sched_tid, id, n + 1) :: !dtp_sched_timeouts\n  | SchedStepDone v ->\n    (* \230\173\163\229\184\184\231\187\147\230\157\159\239\188\154bracket \229\183\178\232\135\170\232\161\140\229\188\185\229\135\186\239\188\155\230\174\139\231\149\153\239\188\136\229\188\130\229\184\184\232\190\185\232\167\146\239\188\137\228\185\159\228\184\128\229\185\182\230\184\133\230\142\137\227\128\130 *)\n    dtp_cleanup_run_all_for t.sched_tid;\n    dtp_cleanup_forget t.sched_tid;\n    dtp_sched_finish t (if t.sched_cancel then SchedCancelled else SchedDone v)\n  | SchedStepFailed (e, bt) ->\n    (* \229\188\130\229\184\184\231\169\191\232\191\135\231\186\164\231\168\139\230\160\185 handler\239\188\154\232\162\171\228\184\162\229\188\131\231\154\132\231\187\173\229\187\182\233\135\140\231\154\132 bracket cleanup \229\156\168\232\191\153\233\135\140\229\133\156\229\186\149\227\128\130 *)\n    dtp_cleanup_run_all_for t.sched_tid;\n    dtp_cleanup_forget t.sched_tid;\n    if t.sched_tid = !dtp_sched_main_tid then dtp_sched_finish t (SchedFailed (e, bt))\n    else begin\n      let s = dtp_sched_scope t.sched_scope in\n      if s.sched_failed = None then s.sched_failed <- Some (dtp_sched_exn_msg e);\n      dtp_sched_finish t (SchedFailed (e, bt));\n      dtp_sched_cancel_scope_tasks t.sched_scope\n    end\n\nlet dtp_sched_tick () =\n  let expired = ref [] in\n  dtp_sched_timeouts := List.map (fun (w, sc, n) -> (w, sc, n - 1)) !dtp_sched_timeouts;\n  dtp_sched_timeouts := List.filter (fun (w, sc, n) ->\n    if n > 0 then true else (expired := (w, sc) :: !expired; false)) !dtp_sched_timeouts;\n  List.iter (fun (_, sc) ->\n    let s = dtp_sched_scope sc in\n    if not s.sched_timeout then begin\n      s.sched_timeout <- true;\n      dtp_sched_cancel_scope_tasks sc\n    end) !expired\n\nlet dtp_sched_runnable t =\n  match t.sched_state with SchedQueued _ -> true | _ -> false\n\nlet dtp_sched_run_one t =\n  if dtp_sched_runnable t then begin\n    dtp_sched_current := t.sched_tid;\n    dtp_cleanup_fiber_set t.sched_tid;\n    (match dtp_sched_step t with\n     | Some st -> dtp_sched_apply t st\n     | None -> ());\n    dtp_cleanup_fiber_set (-1);\n    dtp_sched_current := -1\n  end\n\nlet dtp_sched_deadlock () = failwith \"scheduler: deadlock (no runnable task)\"\n\nlet dtp_sched_loop () =\n  let rec loop () =\n    if !dtp_sched_main_result <> None || !dtp_sched_main_exn <> None then ()\n    else if Queue.is_empty dtp_sched_ready then dtp_sched_deadlock ()\n    else begin\n      let tid = Queue.pop dtp_sched_ready in\n      dtp_sched_run_one (dtp_sched_task tid);\n      dtp_sched_tick ();\n      loop ()\n    end\n  in loop ()\n\nlet dtp_sched_drain () =\n  let rec loop () =\n    if Queue.is_empty dtp_sched_ready then ()\n    else begin\n      let tid = Queue.pop dtp_sched_ready in\n      dtp_sched_run_one (dtp_sched_task tid);\n      loop ()\n    end\n  in loop ()\n\nlet dtp_sched_cancel_leftovers () =\n  Hashtbl.iter (fun _ t -> match t.sched_state with\n    | SchedDone _ | SchedFailed _ | SchedCancelled -> ()\n    | _ -> dtp_sched_cancel_task t) dtp_sched_tasks\n\nlet dtp_sched_main (th : unit -> 'a) : 'a =\n  dtp_sched_reset ();\n  ignore (dtp_sched_new_scope ());\n  let main = dtp_sched_new_task 0 (fun () -> Obj.repr (th ())) in\n  dtp_sched_main_tid := main.sched_tid;\n  (try dtp_sched_loop ()\n   with e -> dtp_sched_cancel_leftovers (); dtp_sched_drain (); raise e);\n  dtp_sched_cancel_leftovers ();\n  dtp_sched_drain ();\n  match !dtp_sched_main_exn with\n  | Some (e, bt) -> Printexc.raise_with_backtrace e bt\n  | None -> match !dtp_sched_main_result with\n    | Some v -> (Obj.obj v : 'a)\n    | None -> failwith \"scheduler: main did not finish\"\n\n(* scheduler primitives exposed to Base.EffSched through hidden intrinsics *)\n\nlet dtp_sched_fork (scope : int) (f : int -> 'a) : int =\n  (dtp_sched_new_task scope (fun () -> Obj.repr (f 0))).sched_tid\n\nlet dtp_sched_current_task () =\n  if !dtp_sched_current < 0 then failwith \"scheduler: no current fiber\"\n  else dtp_sched_task !dtp_sched_current\n\nlet dtp_sched_yield () : int = Effect.perform SchedYield\n\nlet dtp_sched_is_cancelled () : int =\n  match Hashtbl.find_opt dtp_sched_tasks !dtp_sched_current with\n  | Some t -> if t.sched_cancel then 1 else 0\n  | None -> 0\n\nlet dtp_sched_await (id : int) : int =\n  let self = dtp_sched_current_task () in\n  if self.sched_cancel then begin ignore (Effect.perform SchedYield); 1 end\n  else begin\n    let target = dtp_sched_task id in\n    match target.sched_state with\n    | SchedDone _ | SchedFailed _ | SchedCancelled -> dtp_sched_task_status target\n    | _ -> Effect.perform (SchedAwait id)\n  end\n\nlet dtp_sched_task_result (id : int) : 'a =\n  match (dtp_sched_task id).sched_state with\n  | SchedDone v -> Obj.obj v\n  | _ -> failwith \"scheduler: task has no result\"\n\nlet dtp_sched_task_error (id : int) : string =\n  match (dtp_sched_task id).sched_state with\n  | SchedFailed (e, _) -> dtp_sched_exn_msg e\n  | _ -> \"\"\n\nlet dtp_sched_cancel_task_prim (id : int) : int =\n  dtp_sched_cancel_task (dtp_sched_task id);\n  0\n\nlet dtp_sched_cancel_scope (id : int) : int =\n  dtp_sched_cancel_scope_tasks id;\n  0\n\nlet dtp_sched_scope_status (s : dtp_sched_scope) : int =\n  if s.sched_timeout then 2\n  else if s.sched_failed <> None then 1\n  else 0\n\nlet dtp_sched_scope_wait (id : int) : int =\n  let s = dtp_sched_scope id in\n  let self = dtp_sched_current_task () in\n  if self.sched_cancel then begin ignore (Effect.perform SchedYield); 3 end\n  else if s.sched_tasks = [] then dtp_sched_scope_status s\n  else Effect.perform (SchedWaitScope id)\n\nlet dtp_sched_scope_wait_timeout (steps : int) (id : int) : int =\n  let s = dtp_sched_scope id in\n  let self = dtp_sched_current_task () in\n  if self.sched_cancel then begin ignore (Effect.perform SchedYield); 3 end\n  else if s.sched_tasks = [] then dtp_sched_scope_status s\n  else if steps <= 0 then begin\n    s.sched_timeout <- true;\n    dtp_sched_cancel_scope_tasks id;\n    Effect.perform (SchedWaitScope id)\n  end else\n    Effect.perform (SchedWaitScopeTimeout (steps, id))\n\nlet dtp_sched_scope_error (id : int) : string =\n  let s = dtp_sched_scope id in\n  match s.sched_failed with\n  | Some msg -> msg\n  | None -> \"\"\n\nlet dtp_sched_scope_count (id : int) : int =\n  (dtp_sched_scope id).sched_completed\n"

# 1014 "Vuna/Target/Ocaml/Term.vuna"
let v_dtThreadRuntime = "(* ------------------------------------------------------------------ *)\n(* Threads and synchronization primitives (OCaml 5 domains).           *)\n(* ------------------------------------------------------------------ *)\n\ntype dtp_thread_handle = {\n  mutable dtp_th_done : bool;\n  mutable dtp_th_value : Obj.t;\n  dtp_th_domain : Obj.t Domain.t;\n}\n\nlet dtp_thread_spawn (th : int -> 'a) : Obj.t =\n  let d = Domain.spawn (fun () -> Obj.repr (th 0)) in\n  Obj.repr { dtp_th_done = false; dtp_th_value = Obj.repr (); dtp_th_domain = d }\n\nlet dtp_thread_join (t : Obj.t) : 'a =\n  let h : dtp_thread_handle = Obj.obj t in\n  if h.dtp_th_done then Obj.obj h.dtp_th_value\n  else if Domain.get_id h.dtp_th_domain = Domain.self () then failwith \"thread: join self\"\n  else begin\n    let v = Domain.join h.dtp_th_domain in\n    h.dtp_th_value <- v;\n    h.dtp_th_done <- true;\n    Obj.obj v\n  end\n\nlet dtp_thread_yield () : int =\n  (try Unix.sleepf 0.0 with _ -> ());\n  0\n\nlet dtp_thread_id () : int = (Domain.self () :> int)\n\nlet dtp_thread_parallelism () : int = Domain.recommended_domain_count ()\n\nlet dtp_mutex_new () : Obj.t = Obj.repr (Mutex.create ())\nlet dtp_mutex_lock (m : Obj.t) : int = Mutex.lock (Obj.obj m); 0\nlet dtp_mutex_try_lock (m : Obj.t) : bool = Mutex.try_lock (Obj.obj m)\nlet dtp_mutex_unlock (m : Obj.t) : int = Mutex.unlock (Obj.obj m); 0\n\nlet dtp_condvar_new () : Obj.t = Obj.repr (Condition.create ())\nlet dtp_condvar_wait (c : Obj.t) (m : Obj.t) : int =\n  Condition.wait (Obj.obj c) (Obj.obj m);\n  0\nlet dtp_condvar_signal (c : Obj.t) : int = Condition.signal (Obj.obj c); 0\nlet dtp_condvar_broadcast (c : Obj.t) : int = Condition.broadcast (Obj.obj c); 0\n\nlet dtp_atomic_new (v : int) : Obj.t = Obj.repr (Atomic.make v)\nlet dtp_atomic_load (a : Obj.t) : int = Atomic.get (Obj.obj a)\nlet dtp_atomic_store (a : Obj.t) (v : int) : int =\n  Atomic.set (Obj.obj a) v;\n  0\nlet dtp_atomic_fetch_add (a : Obj.t) (v : int) : int =\n  Atomic.fetch_and_add (Obj.obj a) v\nlet dtp_atomic_exchange (a : Obj.t) (v : int) : int = Atomic.exchange (Obj.obj a) v\nlet dtp_atomic_compare_exchange (a : Obj.t) (expected : int) (desired : int) : int =\n  let cell : int Atomic.t = Obj.obj a in\n  let rec loop () =\n    let prev = Atomic.get cell in\n    if prev <> expected then prev\n    else if Atomic.compare_and_set cell expected desired then prev\n    else loop ()\n  in\n  loop ()\n"

# 1081 "Vuna/Target/Ocaml/Term.vuna"
let v_dtHostRuntime = ("(* net \229\143\165\230\159\132\231\154\132\229\177\158\228\184\187\232\183\175\229\190\132\232\161\168\239\188\136\229\143\170\230\156\137\229\174\191\228\184\187\231\189\145\231\187\156\229\142\159\232\175\173\231\148\168\229\136\176\239\188\137\227\128\130 *)\nlet dtp_net_owned : (int, string * int) Hashtbl.t = Hashtbl.create 4\nlet dtp_hostCode (e : exn) : int =\n  match e with\n  | Unix.Unix_error (Unix.ENOENT, _, _) -> 1\n  | Unix.Unix_error ((Unix.EACCES | Unix.EPERM), _, _) -> 2\n  | Unix.Unix_error (Unix.ENOSPC, _, _) -> 3\n  | Unix.Unix_error (Unix.ENOTDIR, _, _) -> 4\n  | Unix.Unix_error (Unix.EISDIR, _, _) -> 5\n  | Unix.Unix_error (Unix.EEXIST, _, _) -> 6\n  | _ -> 9\n(* `Sys_error` \228\184\141\229\184\166 errno\239\188\155\229\133\136 `Unix.stat` \228\184\128\230\172\161\230\139\191\229\136\176\229\133\183\228\189\147\229\142\159\229\155\160\239\188\140\229\134\141\233\128\128\229\155\158\233\128\154\231\148\168\231\160\129\227\128\130 *)\nlet dtp_hostCodeAt path (e : exn) : int =\n  try ignore (Unix.stat path); dtp_hostCode e\n  with e2 -> dtp_hostCode e2\nlet dtp_writeFileAtomic path contents =\n  let tmp = path ^ \".\" ^ string_of_int (Unix.getpid ()) ^ \".tmp\" in\n  let write () =\n    let ch = open_out_bin tmp in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch) (fun () -> output_string ch contents) in\n  (try write (); Sys.rename tmp path; String.length contents\n   with e -> (try Sys.remove tmp with _ -> ()); raise e)\nlet dtp_fileMtime path =\n  (try dtp_hostReset (); int_of_float (Unix.stat path).Unix.st_mtime\n   with e -> dtp_hostMark (dtp_hostCode e) e; 0)\nlet dtp_fileSize path =\n  (try dtp_hostReset (); (Unix.stat path).Unix.st_size\n   with e -> dtp_hostMark (dtp_hostCode e) e; 0)\nlet dtp_tryReadFile path =\n  (try\n     dtp_hostReset ();\n     let fd = Unix.openfile path [Unix.O_RDONLY] 0 in\n     Fun.protect ~finally:(fun () -> (try Unix.close fd with _ -> ()))\n       (fun () ->\n          let buf = Buffer.create 65536 in\n          let tmp = Bytes.create 65536 in\n          let rec go () =\n            let n = Unix.read fd tmp 0 (Bytes.length tmp) in\n            if n > 0 then (Buffer.add_subbytes buf tmp 0 n; go ()) in\n          go (); Buffer.contents buf)\n   with e -> dtp_hostMark (dtp_hostCode e) e; \"\")\nlet dtp_tryReadFileRange path offset length =\n  (try\n     dtp_hostReset ();\n     if offset < 0 || length <= 0 then \"\"\n     else\n       let fd = Unix.openfile path [Unix.O_RDONLY] 0 in\n       Fun.protect ~finally:(fun () -> (try Unix.close fd with _ -> ()))\n         (fun () ->\n            let size = (Unix.stat path).Unix.st_size in\n            if offset >= size then \"\"\n            else\n              let want = min length (size - offset) in\n              ignore (Unix.lseek fd offset Unix.SEEK_SET);\n              let b = Bytes.create want in\n              let rec go pos =\n                if pos < want then\n                  let k = Unix.read fd b pos (want - pos) in\n                  if k > 0 then go (pos + k) in\n              go 0; Bytes.sub_string b 0 want)\n   with e -> dtp_hostMark (dtp_hostCode e) e; \"\")\nlet dtp_tryWriteFile path contents =\n  (try\n     dtp_hostReset ();\n     let fd = Unix.openfile path [Unix.O_WRONLY; Unix.O_CREAT; Unix.O_TRUNC] 0o666 in\n     Fun.protect ~finally:(fun () -> (try Unix.close fd with _ -> ()))\n       (fun () ->\n          let b = Bytes.of_string contents in\n          let n = Bytes.length b in\n          let rec go off =\n            if off < n then\n              let k = Unix.write fd b off (n - off) in\n              if k > 0 then go (off + k) in\n          go 0);\n     String.length contents\n   with e -> dtp_hostMark (dtp_hostCode e) e; 0)\nlet dtp_tryWriteFileAtomic path contents =\n  let tmp = path ^ \".\" ^ string_of_int (Unix.getpid ()) ^ \".tmp\" in\n  (try\n     dtp_hostReset ();\n     (let fd = Unix.openfile tmp [Unix.O_WRONLY; Unix.O_CREAT; Unix.O_TRUNC] 0o666 in\n      Fun.protect ~finally:(fun () -> (try Unix.close fd with _ -> ()))\n        (fun () ->\n           let b = Bytes.of_string contents in\n           let n = Bytes.length b in\n           let rec go off =\n             if off < n then\n               let k = Unix.write fd b off (n - off) in\n               if k > 0 then go (off + k) in\n           go 0));\n     Unix.rename tmp path;\n     String.length contents\n   with e -> (try Unix.unlink tmp with _ -> ()); dtp_hostFail (dtp_hostCode e); 0)\nlet dtp_tryReadDir path =\n  (try dtp_hostReset (); List.sort compare (Array.to_list (Sys.readdir path))\n   with e -> dtp_hostFail (dtp_hostCodeAt path e); [])\nlet dtp_tryIsDirectory path =\n  (try dtp_hostReset (); (Unix.stat path).Unix.st_kind = Unix.S_DIR\n   with e -> dtp_hostMark (dtp_hostCode e) e; false)\nlet dtp_tryMakeDir path =\n  (try\n     dtp_hostReset ();\n     (try Unix.mkdir path 0o755 with Unix.Unix_error (Unix.EEXIST, _, _) -> ());\n     0\n   with e -> dtp_hostMark (dtp_hostCode e) e; 1)\nlet dtp_tryRemoveFile path =\n  (try\n     dtp_hostReset ();\n     (try Unix.unlink path with Unix.Unix_error (Unix.ENOENT, _, _) -> ());\n     0\n   with e -> dtp_hostMark (dtp_hostCode e) e; 1)\nlet dtp_tryRemoveTree path =\n  let rec go p =\n    try\n      let st = Unix.lstat p in\n      (match st.Unix.st_kind with\n       | Unix.S_DIR ->\n           Array.iter (fun e -> go (Filename.concat p e)) (Sys.readdir p);\n           Unix.rmdir p\n       | _ -> Unix.unlink p)\n    with Unix.Unix_error (Unix.ENOENT, _, _) -> () in\n  (try dtp_hostReset (); go path; 0\n   with e -> dtp_hostMark (dtp_hostCode e) e; 1)\nlet dtp_tryRename src dst =\n  (try dtp_hostReset (); Unix.rename src dst; 0\n   with e -> dtp_hostMark (dtp_hostCode e) e; 1)\nlet dtp_trySymlink target link =\n  (try dtp_hostReset (); Unix.symlink target link; 0\n   with e -> dtp_hostMark (dtp_hostCode e) e; 1)\nlet dtp_tryMakeDirExclusive path =\n  (try dtp_hostReset (); Unix.mkdir path 0o755; 0\n   with e -> dtp_hostMark (dtp_hostCode e) e; 1)\nlet dtp_isTty () = Unix.isatty Unix.stdout\nlet dtp_tryRunIn dir args =\n  let cmd = String.concat \" \" (List.map Filename.quote args) in\n  (try\n     dtp_hostReset ();\n     let old = Sys.getcwd () in\n     Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)\n   with e -> dtp_hostFail (dtp_hostCodeAt dir e); -1)\nlet dtp_timeUs () = int_of_float (Unix.gettimeofday () *. 1000000.0)\nlet dtp_sleep us =\n  (if us > 0 then Unix.sleepf (float_of_int us /. 1000000.0));\n  0\nlet dtp_execPath () = try Unix.readlink \"/proc/self/exe\" with _ -> Sys.executable_name\nlet dtp_spawn (args : string list) : int =\n  let prog = Sys.executable_name in\n  Unix.create_process prog (Array.of_list (prog :: args)) Unix.stdin Unix.stdout Unix.stderr\nlet dtp_wait (pid : int) : int =\n  let (_, st) = Unix.waitpid [] pid in\n  match st with Unix.WEXITED c -> c | _ -> 1\nlet dtp_net_tbl : (int, Unix.file_descr) Hashtbl.t = Hashtbl.create 16\n(* \231\155\145\229\144\172\229\143\165\230\159\132\231\187\145\229\174\154\231\154\132 unix socket \232\183\175\229\190\132\228\184\142\229\189\147\230\151\182\231\154\132 inode\239\188\154\229\133\179\233\151\173\229\143\165\230\159\132\230\151\182\229\143\170\229\136\160\228\187\141\231\132\182\230\140\135\229\144\145\232\135\170\229\183\177\231\154\132\233\130\163\228\187\189\230\150\135\228\187\182\227\128\130\n   \230\178\161\230\156\137\232\191\153\230\157\161\232\174\176\229\189\149\239\188\136tcp \229\143\165\230\159\132 / \229\183\178\232\162\171\230\155\191\230\141\162\231\154\132\232\183\175\229\190\132\239\188\137\229\176\177\228\184\141\229\136\160\239\188\140\229\133\141\229\190\151\229\136\160\230\142\137\229\144\140\228\184\128\232\183\175\229\190\132\228\184\138\229\144\142\231\187\167\232\191\155\231\168\139\231\154\132 socket\227\128\130 *)\nlet dtp_net_put (fd : Unix.file_descr) : int =\n  let k = !dtp_net_next in\n  dtp_net_next := k + 1;\n  Hashtbl.replace dtp_net_tbl k fd;\n  k\nlet dtp_net_put_owned (fd : Unix.file_descr) (path : string) : int =\n  let h = dtp_net_put fd in\n  (try Hashtbl.replace dtp_net_owned h (path, (Unix.stat path).Unix.st_ino) with _ -> ());\n  h\nlet dtp_net_get (h : int) : Unix.file_descr =\n  match Hashtbl.find_opt dtp_net_tbl h with\n  | Some fd -> fd\n  | None -> dtp_hostSetStatus 8; failwith \"net: invalid handle\"\nlet dtp_net_unlink_owned (h : int) =\n  match Hashtbl.find_opt dtp_net_owned h with\n  | Some (path, ino) ->\n    (try if (Unix.stat path).Unix.st_ino = ino then Sys.remove path with _ -> ())\n  | None -> ()\nlet dtp_net_drop (h : int) =\n  (try Hashtbl.remove dtp_net_tbl h with _ -> ());\n  (try Hashtbl.remove dtp_net_owned h with _ -> ())\nlet dtp_netCodeOf (ue : Unix.error) : int =\n  match ue with\n  | Unix.ECONNREFUSED | Unix.ENOENT -> 2\n  | Unix.ETIMEDOUT -> 3\n  | Unix.EPIPE | Unix.ECONNRESET -> 4\n  | Unix.EADDRINUSE -> 5\n  | _ -> 9\nlet dtp_net_error (what : string) (e : exn) : 'a =\n  (match e with\n   | Unix.Unix_error (ue, _, _) -> dtp_hostSetStatus (dtp_netCodeOf ue)\n   | _ -> dtp_hostSetStatus 9);\n  match e with\n  | Unix.Unix_error (ue, fn, arg) ->\n    failwith (\"net: \" ^ what ^ \": \" ^ Unix.error_message ue ^ (if arg = \"\" then \"\" else \" (\" ^ arg ^ \")\"))\n  | _ -> failwith (\"net: \" ^ what ^ \": \" ^ Printexc.to_string e)\nlet dtp_net_listen (addr : string) : int =\n  match dtp_net_parse addr with\n  | `Unix path ->\n    (try if Sys.file_exists path then Sys.remove path with _ -> ());\n    let s = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in\n    (try Unix.bind s (Unix.ADDR_UNIX path); Unix.listen s 8; dtp_net_put_owned s path\n     with e -> (try Unix.close s with _ -> ()); dtp_net_error \"listen\" e)\n  | `Tcp (host, port) ->\n    let s = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0 in\n    (try\n       Unix.setsockopt s Unix.SO_REUSEADDR true;\n       Unix.bind s (Unix.ADDR_INET (Unix.inet_addr_of_string host, port));\n       Unix.listen s 8;\n       dtp_net_put s\n     with e -> (try Unix.close s with _ -> ()); dtp_net_error \"listen\" e)\nlet dtp_net_port (h : int) : int =\n  match Unix.getsockname (dtp_net_get h) with\n  | Unix.ADDR_INET (_, p) -> p\n  | Unix.ADDR_UNIX _ -> 0\nlet dtp_net_accept (h : int) : int =\n  (try let (fd, _) = Unix.accept (dtp_net_get h) in dtp_net_put fd\n   with e -> dtp_net_error \"accept\" e)\nlet dtp_net_recv (h : int) (n : int) : string =\n  if n <= 0 then \"\"\n  else\n    let b = Bytes.create n in\n    (try\n       let k = Unix.read (dtp_net_get h) b 0 n in\n       if k <= 0 then \"\" else Bytes.sub_string b 0 k\n     with e -> dtp_net_error \"recv\" e)\nlet dtp_net_send (h : int) (s : string) : int =\n  let fd = dtp_net_get h in\n  let n = String.length s in\n  let rec go off =\n    if off >= n then ()\n    else\n      let k = (try Unix.write_substring fd s off (n - off) with e -> dtp_net_error \"send\" e) in\n      if k <= 0 then failwith \"net: send: connection closed\" else go (off + k)\n  in\n  go 0; n\nlet dtp_net_close (h : int) : int =\n  (try Unix.close (dtp_net_get h) with _ -> ());\n  dtp_net_unlink_owned h;\n  dtp_net_drop h; 0\nlet dtp_netStatus (e : exn) : int =\n  match e with\n  | Unix.Unix_error (ue, _, _) -> dtp_netCodeOf ue\n  | _ -> 6\nlet dtp_netMarkStatus (e : exn) =\n  let c = dtp_hostStatus () in\n  dtp_hostMark (if c = 0 then dtp_netStatus e else c) e\nlet dtp_try_net_listen addr =\n  (try dtp_hostReset (); dtp_net_listen addr\n   with e -> dtp_netMarkStatus e; -1)\nlet dtp_try_net_port h =\n  (try dtp_hostReset (); dtp_net_port h\n   with e -> dtp_netMarkStatus e; -1)\nlet dtp_try_net_accept h =\n  (try dtp_hostReset (); dtp_net_accept h\n   with e -> dtp_netMarkStatus e; -1)\nlet dtp_try_net_send h s =\n  (try dtp_hostReset (); dtp_net_send h s\n   with e -> dtp_netMarkStatus e; 0)\nlet dtp_try_net_recv h n =\n  if n <= 0 then (dtp_hostSetStatus 1; \"\")\n  else\n    let b = Bytes.create n in\n    (try\n       let k = Unix.read (dtp_net_get h) b 0 n in\n       if k <= 0 then (dtp_hostSetStatus 1; \"\")\n       else (dtp_hostReset (); Bytes.sub_string b 0 k)\n     with e -> dtp_netMarkStatus e; \"\")\nlet dtp_try_net_close h =\n  (try dtp_hostReset (); dtp_net_close h\n   with e -> dtp_netMarkStatus e; 0)\nlet dtp_net_connect (addr : string) : int =\n  match dtp_net_parse addr with\n  | `Unix path ->\n    let s = Unix.socket Unix.PF_UNIX Unix.SOCK_STREAM 0 in\n    (try Unix.connect s (Unix.ADDR_UNIX path); dtp_net_put s\n     with e -> (try Unix.close s with _ -> ()); dtp_net_error \"connect\" e)\n  | `Tcp (host, port) ->\n    let s = Unix.socket Unix.PF_INET Unix.SOCK_STREAM 0 in\n    (try Unix.connect s (Unix.ADDR_INET (Unix.inet_addr_of_string host, port)); dtp_net_put s\n     with e -> (try Unix.close s with _ -> ()); dtp_net_error \"connect\" e)\nlet dtp_try_net_connect addr =\n  (try dtp_hostReset (); dtp_net_connect addr\n   with e -> dtp_netMarkStatus e; -1)\nlet dtp_try_net_accept_within h micros =\n  (try\n     dtp_hostReset ();\n     let lfd = dtp_net_get h in\n     let (r, _, _) = Unix.select [lfd] [] [] (float_of_int micros /. 1000000.0) in\n     if r = [] then (dtp_hostSetStatus 7; -1)\n     else let (fd, _) = Unix.accept lfd in dtp_net_put fd\n   with e -> dtp_netMarkStatus e; -1)\nlet dtp_try_net_recv_within h n micros =\n  if n <= 0 then (dtp_hostReset (); dtp_hostSetStatus 1; \"\")\n  else\n    (try\n       dtp_hostReset ();\n       let fd = dtp_net_get h in\n       let b = Bytes.create n in\n       let (r, _, _) = Unix.select [fd] [] [] (float_of_int micros /. 1000000.0) in\n       if r = [] then (dtp_hostSetStatus 7; \"\")\n       else\n         let k = Unix.read fd b 0 n in\n         if k <= 0 then (dtp_hostSetStatus 1; \"\") else Bytes.sub_string b 0 k\n     with e -> dtp_netMarkStatus e; \"\")\nlet dtp_try_net_send_within h s micros =\n  (try\n     dtp_hostReset ();\n     let fd = dtp_net_get h in\n     let n = String.length s in\n     let secs = float_of_int micros /. 1000000.0 in\n     let rec go off =\n       if off >= n then true\n       else\n         let (_, w, _) = Unix.select [] [fd] [] secs in\n         if w = [] then false\n         else\n           let k = Unix.write_substring fd s off (n - off) in\n           if k <= 0 then false else go (off + k) in\n     if go 0 then n else (dtp_hostSetStatus 7; 0)\n   with e -> dtp_netMarkStatus e; 0)\n" ^ v_dtThreadRuntime)

# 1409 "Vuna/Target/Ocaml/Term.vuna"
let v_dtReporterRuntimeWith = (fun (dtb_u_u1 : bool) -> (String.concat "" ["type dt_raw_backtrace = int array\ntype dt_backtrace_slot =\n  | Known_location of {\n      is_raise : bool;\n      filename : string;\n      start_lnum : int;\n      start_char : int;\n      end_offset : int;\n      end_lnum : int;\n      end_char : int;\n      is_inline : bool;\n      defname : string;\n    }\n  | Unknown_location of { is_raise : bool }\nexternal dt_record_backtrace : bool -> unit = \"caml_record_backtrace\"\nexternal dt_get_raw_backtrace_prim : unit -> dt_raw_backtrace = \"caml_get_exception_raw_backtrace\"\nexternal dt_convert_raw_backtrace : dt_raw_backtrace -> dt_backtrace_slot array = \"caml_convert_raw_backtrace\"\n(* \229\155\158\230\186\175 / \228\189\141\231\189\174\232\161\168\232\183\175\229\190\132\229\143\170\231\148\168\229\173\151\231\172\166\228\184\142\229\173\151\232\138\130\229\142\159\232\175\173\239\188\154\229\188\149\231\148\168 `List` / `Array` / `String` / `Bytes`\n   \228\188\154\230\138\138\230\149\180\228\184\178 stdlib \230\168\161\229\157\151\230\139\150\232\191\155\230\175\143\228\184\170\228\186\167\231\137\169\231\154\132\229\144\175\229\138\168\232\183\175\229\190\132\239\188\136\231\186\175 `main = 42` \231\154\132 text \230\156\137\228\184\128\229\141\138\230\157\165\232\135\170\232\191\153\233\135\140\239\188\137\227\128\130 *)\nexternal dt_str_len : string -> int = \"%string_length\"\nexternal dt_str_get : string -> int -> char = \"%string_safe_get\"\nexternal dt_arr_len : 'a array -> int = \"%array_length\"\nexternal dt_arr_get : 'a array -> int -> 'a = \"%array_safe_get\"\nexternal dt_bytes_create : int -> bytes = \"caml_create_bytes\"\nexternal dt_blit_string : string -> int -> bytes -> int -> int -> unit = \"caml_blit_string\" [@@noalloc]\nexternal dt_bytes_set : bytes -> int -> char -> unit = \"%bytes_safe_set\"\nexternal dt_bytes_to_string : bytes -> string = \"%bytes_to_string\"\nlet dt_sub s ofs len =\n  let b = dt_bytes_create len in\n  dt_blit_string s ofs b 0 len;\n  dt_bytes_to_string b\nlet dt_quote_char = dt_bytes_create 1\nlet () = dt_bytes_set dt_quote_char 0 '\"'\nlet dt_quote () = dt_bytes_to_string dt_quote_char\nlet dt_eq_sub s ofs len (t : string) =\n  if dt_str_len t <> len then false\n  else begin\n    let ok = ref true in\n    let i = ref 0 in\n    while !ok && !i < len do\n      if dt_str_get s (ofs + !i) <> dt_str_get t !i then ok := false;\n      incr i\n    done;\n    !ok\n  end\nlet dt_is_fun s a b =\n  b - a = 5 && dt_str_get s a = '(' && dt_str_get s (a + 1) = 'f'\n  && dt_str_get s (a + 2) = 'u' && dt_str_get s (a + 3) = 'n' && dt_str_get s (a + 4) = ')'\n(* \229\184\167\229\144\141 `Unit.value`\239\188\154\229\143\150\230\156\128\229\144\142\228\184\164\230\174\181\239\188\136\232\183\179\232\191\135 `(fun)`\239\188\137\239\188\140\228\184\141\229\187\186\228\184\173\233\151\180\229\136\151\232\161\168\227\128\130 *)\nlet dt_frame_key nm =\n  let n = dt_str_len nm in\n  let name = ref (0, 0) and prev = ref (0, 0) and have = ref 0 in\n  let start = ref 0 in\n  let i = ref 0 in\n  while !i <= n do\n    (if !i = n || dt_str_get nm !i = '.' then begin\n      if not (dt_is_fun nm !start !i) then begin\n        prev := !name;\n        name := (!start, !i);\n        incr have\n      end;\n      start := !i + 1\n    end);\n    incr i\n  done;\n  if !have < 2 then None\n  else\n    let (a, b) = !name and (c, d) = !prev in\n    Some (dt_sub nm c (d - c) ^ \".\" ^ dt_sub nm a (b - a))\n(* \228\189\141\231\189\174\232\161\168\230\152\175\229\142\139\229\185\179\231\154\132 `key\\ndisplay\\nloc\\n` \229\173\151\231\172\166\228\184\178\239\188\154\230\140\137\232\161\140\230\137\171\230\143\143\239\188\140\228\184\141\229\187\186\228\184\173\233\151\180\229\136\151\232\161\168\227\128\130 *)\nlet dt_scan_nl s pos =\n  let n = dt_str_len s in\n  let i = ref pos in\n  while !i < n && dt_str_get s !i <> '\\n' do incr i done;\n  !i\nlet dt_def_loc_find key =\n  let raw = !dt_def_locs_raw_ref in\n  let n = dt_str_len raw in\n  let rec go pos =\n    if pos >= n then None\n    else\n      let k_end = dt_scan_nl raw pos in\n      if k_end >= n then None\n      else\n        let d_start = k_end + 1 in\n        let d_end = dt_scan_nl raw d_start in\n        if d_end >= n then None\n        else\n          let l_start = d_end + 1 in\n          let l_end = dt_scan_nl raw l_start in\n          if dt_eq_sub raw pos (k_end - pos) key then\n            Some (dt_sub raw d_start (d_end - d_start), dt_sub raw l_start (l_end - l_start))\n          else go (l_end + 1)\n  in go 0\nlet dt_get_raw_backtrace () = try dt_get_raw_backtrace_prim () with _ -> [||]\nlet dt_backtrace_slots bt = (try Some (dt_convert_raw_backtrace bt) with Failure _ -> None)\nlet dt_slot_defname slot =\n  match slot with\n  | Unknown_location _ -> None\n  | Known_location l -> if l.defname = \"\" then None else Some l.defname\nlet dt_frame_label slot =\n  match dt_slot_defname slot with\n  | None -> None\n  | Some nm ->\n    match dt_frame_key nm with\n    | None -> None\n    | Some key ->\n      (match dt_def_loc_find key with\n       | Some (display, loc) -> Some (display ^ \" (\" ^ loc ^ \")\")\n       | None -> None)\nlet dt_exn_quote m = dt_quote () ^ m ^ dt_quote ()\nlet dt_exn_msg e =\n  match e with\n"; (if dtb_u_u1 then "  | Effect.Unhandled (Perform (_, _, key, name, _)) -> \"unhandled effect \" ^ key ^ \" (instance \" ^ name ^ \")\"\n" else ""); "  | Failure m -> m\n  | Invalid_argument m -> \"Invalid_argument(\" ^ dt_exn_quote m ^ \")\"\n  | Sys_error m -> \"Sys_error(\" ^ dt_exn_quote m ^ \")\"\n  | Not_found -> \"Not_found\"\n  | End_of_file -> \"End_of_file\"\n  | Division_by_zero -> \"Division_by_zero\"\n  | Stack_overflow -> \"Stack_overflow\"\n  | Out_of_memory -> \"Out_of_memory\"\n  | Sys.Break -> \"Sys.Break\"\n  | _ -> \"<exception>\"\nlet dt_report_exn e bt =\n  prerr_string (\"vuna: runtime error: \" ^ dt_exn_msg e ^ \"\\n\");\n  match dt_backtrace_slots bt with\n  | None -> ()\n  | Some slots ->\n    let shown = ref 0 and last = ref \"\" and i = ref 0 in\n    let n = dt_arr_len slots in\n    while !i < n && !shown < 12 do\n      (match dt_frame_label (dt_arr_get slots !i) with\n       | Some s -> if s <> !last then begin prerr_string (\"  at \" ^ s ^ \"\\n\"); incr shown; last := s end\n       | None -> ());\n      incr i\n    done\n"]))

# 1550 "Vuna/Target/Ocaml/Term.vuna"
let v_dtFloatRuntime = "let bi_add_float (a : float) (b : float) = a +. b\nlet bi_sub_float (a : float) (b : float) = a -. b\nlet bi_mul_float (a : float) (b : float) = a *. b\nlet bi_div_float (a : float) (b : float) = a /. b\nlet bi_eq_float (a : float) (b : float) = a = b\nlet bi_neq_float (a : float) (b : float) = a <> b\nlet bi_lt_float (a : float) (b : float) = a < b\nlet bi_le_float (a : float) (b : float) = a <= b\nlet bi_gt_float (a : float) (b : float) = a > b\nlet bi_ge_float (a : float) (b : float) = a >= b\n"

# 1570 "Vuna/Target/Ocaml/Term.vuna"
let v_dtLogRuntime = "(* vuna text log runtime (generated; see docs/reference/logging.md). *)\nlet dtp_log_qc = Char.chr 34\nlet dtp_log_bs = Char.chr 92\nlet dtp_log_nl = Char.chr 10\nlet dtp_log_lb = Char.chr 123\nlet dtp_log_rb = Char.chr 125\nlet dtp_log_ls = Char.chr 91\nlet dtp_log_rs = Char.chr 93\nlet dtp_log_colon = Char.chr 58\nlet dtp_log_comma = Char.chr 44\n\nlet dtp_log_level_value = (\n  let env = String.lowercase_ascii (try Sys.getenv \"VUNA_LOG\" with Not_found -> \"\") in\n  if env = \"\" then 1\n  else match env with\n    | \"off\" | \"none\" -> -1\n    | \"error\" -> 0\n    | \"warn\" -> 1\n    | \"info\" -> 2\n    | \"debug\" -> 3\n    | \"trace\" -> 4\n    | s -> (match int_of_string_opt s with Some n -> n | None -> 1))\n\nlet dtp_log_threshold () = dtp_log_level_value\n\nlet dtp_log_name (lvl : int) =\n  if lvl <= 0 then \"ERROR\"\n  else if lvl = 1 then \"WARN\"\n  else if lvl = 2 then \"INFO\"\n  else if lvl = 3 then \"DEBUG\"\n  else \"TRACE\"\n\nlet dtp_log_scopes_value = (\n  let raw = try Sys.getenv \"VUNA_LOG_SCOPE\" with Not_found -> \"\" in\n  if raw = \"\" then []\n  else List.filter (fun s -> s <> \"\") (List.map String.trim (String.split_on_char ',' raw)))\n\nlet dtp_log_scope_cache : (string, bool) Hashtbl.t = Hashtbl.create 16\n\nlet dtp_log_glob (pat : string) (s : string) =\n  let np = String.length pat and ns = String.length s in\n  let rec go i j =\n    if i = np then j = ns\n    else match pat.[i] with\n      | '*' -> go (i + 1) j || (j < ns && go i (j + 1))\n      | '?' -> j < ns && go (i + 1) (j + 1)\n      | c -> j < ns && c = s.[j] && go (i + 1) (j + 1)\n  in go 0 0\n\nlet dtp_log_scope_match (pat : string) (scope : string) =\n  if String.contains pat '*' || String.contains pat '?' then dtp_log_glob pat scope\n  else if String.contains pat '.' then\n    (* \229\184\166\231\130\185\231\154\132\230\168\161\229\188\143\230\140\137\231\130\185\232\190\185\231\149\140\229\137\141\231\188\128\229\140\185\233\133\141\239\188\154`Vuna.Compiler` \229\145\189\228\184\173 `Vuna.Compiler.*`\239\188\140\228\184\141\229\145\189\228\184\173 `Vuna.CompilerBase`\227\128\130 *)\n    scope = pat\n    || (String.length scope > String.length pat\n        && String.sub scope 0 (String.length pat) = pat\n        && scope.[String.length pat] = '.')\n  else\n    String.length scope >= String.length pat\n    && String.sub scope 0 (String.length pat) = pat\n\nlet dtp_log_scope_eval (scope : string) (pats : string list) =\n  let inc = List.filter (fun p -> p <> \"\" && p.[0] <> '!') pats in\n  let exc = List.filter (fun p -> p <> \"\" && p.[0] = '!') pats in\n  let strip p = if p <> \"\" && p.[0] = '!' then String.sub p 1 (String.length p - 1) else p in\n  let base = if inc = [] then true else List.exists (fun p -> dtp_log_scope_match p scope) inc in\n  base && not (List.exists (fun p -> dtp_log_scope_match (strip p) scope) exc)\n\nlet dtp_log_scope_on (scope : string) =\n  match dtp_log_scopes_value with\n  | [] -> true\n  | pats ->\n    (match Hashtbl.find_opt dtp_log_scope_cache scope with\n     | Some b -> b\n     | None ->\n       let b = dtp_log_scope_eval scope pats in\n       Hashtbl.replace dtp_log_scope_cache scope b;\n       b)\n\nlet dtp_log_on (lvl : int) (scope : string) : bool =\n  lvl <= dtp_log_threshold () && dtp_log_scope_on scope\n\nlet dtp_log_pid_value = Unix.getpid ()\nlet dtp_log_pid () = dtp_log_pid_value\n\nlet dtp_log_format_value = (\n  String.lowercase_ascii (try Sys.getenv \"VUNA_LOG_FORMAT\" with Not_found -> \"\"))\nlet dtp_log_json_mode () = dtp_log_format_value = \"jsonl\"\n\nlet dtp_log_out = ref None\nlet dtp_log_opened = ref false\n\nlet dtp_log_channel () =\n  if not !dtp_log_opened then begin\n    dtp_log_opened := true;\n    dtp_log_out := (try Some (open_out (Sys.getenv \"VUNA_LOG_FILE\")) with _ -> None)\n  end;\n  !dtp_log_out\n\nlet () = at_exit (fun () -> match !dtp_log_out with Some oc -> close_out_noerr oc | None -> ())\n\nlet dtp_log_write (s : string) =\n  match dtp_log_channel () with\n  | Some oc -> output_string oc s; flush oc\n  | None -> output_string stderr s; flush stderr\n\nlet dtp_log_json_str b (s : string) =\n  Buffer.add_char b dtp_log_qc;\n  String.iter\n    (fun c ->\n      if Char.code c = 34 then begin Buffer.add_char b dtp_log_bs; Buffer.add_char b dtp_log_qc end\n      else if Char.code c = 92 then begin Buffer.add_char b dtp_log_bs; Buffer.add_char b dtp_log_bs end\n      else if Char.code c = 10 then begin Buffer.add_char b dtp_log_bs; Buffer.add_char b (Char.chr 110) end\n      else if Char.code c = 13 then begin Buffer.add_char b dtp_log_bs; Buffer.add_char b (Char.chr 114) end\n      else if Char.code c = 9 then begin Buffer.add_char b dtp_log_bs; Buffer.add_char b (Char.chr 116) end\n      else if Char.code c < 32 then begin\n        Buffer.add_char b dtp_log_bs;\n        Buffer.add_char b (Char.chr 117);\n        Buffer.add_string b (Printf.sprintf \"%04x\" (Char.code c))\n      end\n      else Buffer.add_char b c)\n    s;\n  Buffer.add_char b dtp_log_qc\n\nlet dtp_log_json_line (ts : int) (lvl : int) (scope : string) (text : string) =\n  let b = Buffer.create 128 in\n  Buffer.add_char b dtp_log_lb;\n  dtp_log_json_str b \"ts\"; Buffer.add_char b dtp_log_colon;\n  Buffer.add_string b (string_of_int ts);\n  Buffer.add_char b dtp_log_comma;\n  dtp_log_json_str b \"pid\"; Buffer.add_char b dtp_log_colon;\n  Buffer.add_string b (string_of_int (dtp_log_pid ()));\n  Buffer.add_char b dtp_log_comma;\n  dtp_log_json_str b \"level\"; Buffer.add_char b dtp_log_colon;\n  dtp_log_json_str b (String.lowercase_ascii (dtp_log_name lvl));\n  Buffer.add_char b dtp_log_comma;\n  dtp_log_json_str b \"scope\"; Buffer.add_char b dtp_log_colon;\n  dtp_log_json_str b scope;\n  Buffer.add_char b dtp_log_comma;\n  dtp_log_json_str b \"text\"; Buffer.add_char b dtp_log_colon;\n  dtp_log_json_str b text;\n  Buffer.add_char b dtp_log_rb;\n  Buffer.add_char b dtp_log_nl;\n  dtp_log_write (Buffer.contents b)\n\nlet dtp_log_text_line (ts : int) (lvl : int) (scope : string) (text : string) =\n  let b = Buffer.create 96 in\n  Buffer.add_string b (string_of_int ts);\n  Buffer.add_char b ' ';\n  Buffer.add_string b (dtp_log_name lvl);\n  Buffer.add_char b ' ';\n  Buffer.add_string b scope;\n  Buffer.add_char b ' ';\n  Buffer.add_string b text;\n  Buffer.add_char b dtp_log_nl;\n  dtp_log_write (Buffer.contents b)\n\nlet dtp_log_emit (lvl : int) (scope : string) (text : string) : int =\n  if not (dtp_log_on lvl scope) then 0\n  else begin\n    let ts = dtp_timeUs () in\n    if dtp_log_json_mode () then dtp_log_json_line ts lvl scope text\n    else dtp_log_text_line ts lvl scope text;\n    0\n  end\n"

# 1752 "Vuna/Target/Ocaml/Term.vuna"
let v_dtObsRuntime = "(* ------------------------------------------------------------------ *)\n(* vuna observability runtime (generated; see docs/reference/          *)\n(* observability.md). Off by default: probe reads one int at init.    *)\n(* Events are Chrome Trace Event JSONL, one object per line.           *)\n(*                                                                     *)\n(* This text is embedded verbatim in Codegen.Term.dtObsRuntime. It      *)\n(* therefore contains NO backslash characters and NO line comments:    *)\n(* every quote is built from Char.chr 34 so the surrounding vuna string *)\n(* literal stays straightforward to escape.                            *)\n(* ------------------------------------------------------------------ *)\nlet dtp_obs_qc = Char.chr 34\nlet dtp_obs_bs = Char.chr 92\nlet dtp_obs_nl = Char.chr 10\nlet dtp_obs_colon = Char.chr 58\nlet dtp_obs_comma = Char.chr 44\nlet dtp_obs_lb = Char.chr 123\nlet dtp_obs_rb = Char.chr 125\nlet dtp_obs_ls = Char.chr 91\nlet dtp_obs_rs = Char.chr 93\n\nlet dtp_obs_level_value = (\n  let env =\n    match int_of_string_opt (try Sys.getenv \"VUNA_OBS\" with Not_found -> \"\") with\n    | Some n -> n\n    | None -> 0\n  in\n  let rec scan i acc =\n    let n = Array.length Sys.argv in\n    if i >= n then acc\n    else if Sys.argv.(i) = \"--obs\" then scan (i + 1) (if acc > 2 then acc else 2)\n    else if Sys.argv.(i) = \"--obs-level\" && i + 1 < n then\n      (match int_of_string_opt Sys.argv.(i + 1) with\n       | Some v -> scan (i + 2) v\n       | None -> scan (i + 2) acc)\n    else if String.length Sys.argv.(i) > 11 && String.sub Sys.argv.(i) 0 11 = \"--obs-level\" then\n      (match int_of_string_opt (String.sub Sys.argv.(i) 12 (String.length Sys.argv.(i) - 12)) with\n       | Some v -> scan (i + 1) v\n       | None -> scan (i + 1) acc)\n    else scan (i + 1) acc\n  in\n  let l = scan 1 env in\n  if l < 0 then 0 else if l > 3 then 3 else l)\n\nlet dtp_obs_level (_ : int) = dtp_obs_level_value\nlet dtp_obs_on () = dtp_obs_level_value > 0\nlet dtp_obs_tid () = let t = !dtp_sched_current in if t < 0 then 0 else t\n\nlet dtp_obs_esc b (s : string) =\n  String.iter\n    (fun c ->\n      if Char.code c = 34 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b dtp_obs_qc end\n      else if Char.code c = 92 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b dtp_obs_bs end\n      else if Char.code c = 10 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b (Char.chr 110) end\n      else if Char.code c = 13 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b (Char.chr 114) end\n      else if Char.code c = 9 then begin Buffer.add_char b dtp_obs_bs; Buffer.add_char b (Char.chr 116) end\n      else if Char.code c < 32 then begin\n        Buffer.add_char b dtp_obs_bs;\n        Buffer.add_char b (Char.chr 117);\n        Buffer.add_string b (Printf.sprintf \"%04x\" (Char.code c))\n      end\n      else Buffer.add_char b c)\n    s\n\nlet dtp_obs_key b (k : string) =\n  Buffer.add_char b dtp_obs_qc;\n  dtp_obs_esc b k;\n  Buffer.add_char b dtp_obs_qc;\n  Buffer.add_char b dtp_obs_colon\n\nlet dtp_obs_str b (s : string) =\n  Buffer.add_char b dtp_obs_qc;\n  dtp_obs_esc b s;\n  Buffer.add_char b dtp_obs_qc\n\nlet dtp_obs_int b (n : int) = Buffer.add_string b (string_of_int n)\n\n\nlet dtp_obs_sink_path () =\n  match Sys.getenv_opt \"VUNA_OBS_FILE\" with\n  | Some p when p <> \"\" -> p\n  | _ ->\n    let d =\n      match Sys.getenv_opt \"VUNA_OBS_DIR\" with\n      | Some d when d <> \"\" -> d\n      | _ -> Filename.concat (Filename.get_temp_dir_name ()) \"vuna-obs\"\n    in\n    Filename.concat d (\"vuna-\" ^ string_of_int (Unix.getpid ()) ^ \".jsonl\")\n\nlet dtp_obs_chan : out_channel option ref = ref None\nlet dtp_obs_started = ref false\nlet dtp_obs_warned = ref false\nlet dtp_obs_count = ref 0\nlet dtp_obs_buf = Buffer.create 8192\n\nlet dtp_obs_open () =\n  match !dtp_obs_chan with\n  | Some c -> Some c\n  | None ->\n    let path = dtp_obs_sink_path () in\n    let dir = Filename.dirname path in\n    (try if not (Sys.file_exists dir) then Unix.mkdir dir 0o755 with _ -> ());\n    (match (try Some (open_out_bin path) with _ -> None) with\n     | None ->\n       if not !dtp_obs_warned then begin\n         dtp_obs_warned := true;\n         Printf.eprintf \"vuna: obs: cannot write %s, events dropped\" path;\n         output_char stderr dtp_obs_nl;\n         flush stderr\n       end;\n       None\n     | Some c ->\n       dtp_obs_chan := Some c;\n       Some c)\n\nlet dtp_obs_flush () =\n  (match !dtp_obs_chan with\n   | None -> ()\n   | Some c ->\n     if Buffer.length dtp_obs_buf > 0 then Buffer.output_buffer c dtp_obs_buf;\n     Buffer.clear dtp_obs_buf;\n     (try flush c with _ -> ()));\n  dtp_obs_count := 0;\n  0\n\nlet dtp_obs_hdr b (ph : string) (name : string) (ts : int) =\n  Buffer.add_char b dtp_obs_lb;\n  dtp_obs_key b \"ph\";\n  dtp_obs_str b ph;\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"ts\";\n  dtp_obs_int b ts;\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"pid\";\n  dtp_obs_int b (Unix.getpid ());\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"tid\";\n  dtp_obs_int b (dtp_obs_tid ());\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"name\";\n  dtp_obs_str b name\n\nlet dtp_obs_meta () =\n  let b = Buffer.create 256 in\n  Buffer.add_char b dtp_obs_lb;\n  dtp_obs_key b \"ph\";\n  dtp_obs_str b \"M\";\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"name\";\n  dtp_obs_str b \"vuna.obs.schema\";\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"pid\";\n  dtp_obs_int b (Unix.getpid ());\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"tid\";\n  dtp_obs_int b 0;\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"args\";\n  Buffer.add_char b dtp_obs_lb;\n  dtp_obs_key b \"schema\";\n  dtp_obs_str b \"vuna-obs 1\";\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"level\";\n  dtp_obs_int b (dtp_obs_level 0);\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"exec\";\n  dtp_obs_str b (try Sys.executable_name with _ -> \"\");\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"argv\";\n  Buffer.add_char b dtp_obs_ls;\n  Array.iteri\n    (fun i a ->\n      if i > 0 then Buffer.add_char b dtp_obs_comma;\n      dtp_obs_str b a)\n    Sys.argv;\n  Buffer.add_char b dtp_obs_rs;\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"t0\";\n  dtp_obs_int b (dtp_timeUs ());\n  Buffer.add_char b dtp_obs_rb;\n  Buffer.add_char b dtp_obs_rb;\n  Buffer.add_char b dtp_obs_nl;\n  Buffer.contents b\n\nlet dtp_obs_emit (ev : string) =\n  match dtp_obs_open () with\n  | None -> 0\n  | Some _ ->\n    if not !dtp_obs_started then begin\n      dtp_obs_started := true;\n      Buffer.add_string dtp_obs_buf (dtp_obs_meta ())\n    end;\n    Buffer.add_string dtp_obs_buf ev;\n    incr dtp_obs_count;\n    if !dtp_obs_count >= 256 then dtp_obs_flush () else 0\n\nlet dtp_obs_shutdown () =\n  ignore (dtp_obs_flush ());\n  (match !dtp_obs_chan with\n   | Some c -> dtp_obs_chan := None; (try close_out c with _ -> ())\n   | None -> ())\n\nlet () = at_exit dtp_obs_shutdown\n\nlet dtp_obs_span_emit (name : string) (cat : string) (label_opt : string option)\n    (t0 : int) (s0 : Gc.stat) (a0 : float) (ok : bool) =\n  let t1 = dtp_timeUs () in\n  let s1 = Gc.quick_stat () in\n  let b = Buffer.create 192 in\n  dtp_obs_hdr b \"X\" name t0;\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"cat\";\n  dtp_obs_str b cat;\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"dur\";\n  dtp_obs_int b (if t1 - t0 < 0 then 0 else t1 - t0);\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"args\";\n  Buffer.add_char b dtp_obs_lb;\n  (match label_opt with\n   | None -> ()\n   | Some label ->\n     dtp_obs_key b \"def\";\n     dtp_obs_str b label;\n     Buffer.add_char b dtp_obs_comma);\n  dtp_obs_key b \"allocWords\";\n  dtp_obs_int b\n    (int_of_float\n       ((Gc.allocated_bytes () -. a0) /. (float_of_int Sys.word_size /. 8.)));\n  if not ok then begin\n    Buffer.add_char b dtp_obs_comma;\n    dtp_obs_key b \"error\";\n    Buffer.add_string b \"true\"\n  end;\n  Buffer.add_char b dtp_obs_rb;\n  Buffer.add_char b dtp_obs_rb;\n  Buffer.add_char b dtp_obs_nl;\n  ignore (dtp_obs_emit (Buffer.contents b))\n\nlet dtp_obs_span (name : string) (cat : string) (f : int -> 'a) : 'a =\n  if not (dtp_obs_on ()) then f 0\n  else begin\n    let t0 = dtp_timeUs () in\n    let s0 = Gc.quick_stat () in\n    let a0 = Gc.allocated_bytes () in\n    let v = try f 0 with e -> dtp_obs_span_emit name cat None t0 s0 a0 false; raise e in\n    dtp_obs_span_emit name cat None t0 s0 a0 true;\n    v\n  end\n\nlet dtp_obs_span_lab (name : string) (cat : string) (label : string) (f : int -> 'a) : 'a =\n  if not (dtp_obs_on ()) then f 0\n  else begin\n    let t0 = dtp_timeUs () in\n    let s0 = Gc.quick_stat () in\n    let a0 = Gc.allocated_bytes () in\n    let v = try f 0 with e -> dtp_obs_span_emit name cat (Some label) t0 s0 a0 false; raise e in\n    dtp_obs_span_emit name cat (Some label) t0 s0 a0 true;\n    v\n  end\n\nlet dtp_obs_open_spans : (int, string * string * int * Gc.stat * float) Hashtbl.t =\n  Hashtbl.create 64\n\nlet dtp_obs_span_seq = ref 0\n\nlet dtp_obs_span_begin (name : string) (cat : string) : int =\n  if not (dtp_obs_on ()) then 0\n  else begin\n    incr dtp_obs_span_seq;\n    let id = !dtp_obs_span_seq in\n    Hashtbl.replace dtp_obs_open_spans id\n      (name, cat, dtp_timeUs (), Gc.quick_stat (), Gc.allocated_bytes ());\n    id\n  end\n\nlet dtp_obs_span_end (id : int) : int =\n  if id = 0 then 0\n  else match Hashtbl.find_opt dtp_obs_open_spans id with\n    | None -> 0\n    | Some (name, cat, t0, s0, a0) ->\n      Hashtbl.remove dtp_obs_open_spans id;\n      dtp_obs_span_emit name cat None t0 s0 a0 true;\n      0\n\nlet dtp_obs_mark_like (ph : string) (name : string) (cat : string) (kv : (Buffer.t -> unit) option) =\n  let b = Buffer.create 160 in\n  dtp_obs_hdr b ph name (dtp_timeUs ());\n  Buffer.add_char b dtp_obs_comma;\n  dtp_obs_key b \"cat\";\n  dtp_obs_str b cat;\n  (match kv with\n   | None -> ()\n   | Some put ->\n     Buffer.add_char b dtp_obs_comma;\n     dtp_obs_key b \"args\";\n     Buffer.add_char b dtp_obs_lb;\n     put b;\n     Buffer.add_char b dtp_obs_rb);\n  Buffer.add_char b dtp_obs_rb;\n  Buffer.add_char b dtp_obs_nl;\n  ignore (dtp_obs_emit (Buffer.contents b));\n  0\n\nlet dtp_obs_counter (name : string) (v : int) : int =\n  if not (dtp_obs_on ()) then 0\n  else dtp_obs_mark_like \"C\" name \"vuna.counter\"\n    (Some (fun b -> dtp_obs_key b \"value\"; dtp_obs_int b v))\n\nlet dtp_obs_mark (name : string) : int =\n  if not (dtp_obs_on ()) then 0\n  else dtp_obs_mark_like \"i\" name \"vuna.mark\" None\n\nlet dtp_obs_cap = 8192\n\n(* Reservoir (Algorithm R): keep a uniform sample of the whole run instead of\n   its first 8192 samples. Integer-only and allocation-free, so it is safe in\n   memprof callbacks and signal handlers. *)\nlet dtp_obs_rand_state = ref 0x2545F4914F6CDD1D\n\nlet dtp_obs_rand () =\n  let x = !dtp_obs_rand_state in\n  let x = (x lxor (x lsl 13)) land max_int in\n  let x = (x lxor (x lsr 7)) land max_int in\n  let x = (x lxor (x lsl 17)) land max_int in\n  dtp_obs_rand_state := x;\n  x\n\ntype dtp_obs_ring = {\n  dtp_ring_slots : Printexc.raw_backtrace option array;\n  mutable dtp_ring_n : int;\n  mutable dtp_ring_seen : int;\n}\n\nlet dtp_obs_ring_make () =\n  { dtp_ring_slots = Array.make dtp_obs_cap None; dtp_ring_n = 0; dtp_ring_seen = 0 }\n\nlet dtp_obs_ring_add (r : dtp_obs_ring) (bt : Printexc.raw_backtrace) =\n  r.dtp_ring_seen <- r.dtp_ring_seen + 1;\n  if r.dtp_ring_n < dtp_obs_cap then begin\n    r.dtp_ring_slots.(r.dtp_ring_n) <- Some bt;\n    r.dtp_ring_n <- r.dtp_ring_n + 1\n  end else begin\n    let j = dtp_obs_rand () mod r.dtp_ring_seen in\n    if j < dtp_obs_cap then r.dtp_ring_slots.(j) <- Some bt\n  end\n\nlet dtp_obs_ring_reset (r : dtp_obs_ring) =\n  for i = 0 to r.dtp_ring_n - 1 do r.dtp_ring_slots.(i) <- None done;\n  r.dtp_ring_n <- 0;\n  r.dtp_ring_seen <- 0\n\nlet dtp_obs_cpu_ring = dtp_obs_ring_make ()\nlet dtp_obs_cpu_on = ref false\n\nlet dtp_obs_cpu_tick (_ : int) =\n  if !dtp_obs_cpu_on then\n    dtp_obs_ring_add dtp_obs_cpu_ring (Printexc.get_callstack 32)\n\nlet dtp_obs_frames b (bt : Printexc.raw_backtrace) =\n  let slots = match Printexc.backtrace_slots bt with None -> [||] | Some s -> s in\n  Buffer.add_char b dtp_obs_ls;\n  let first = ref true in\n  Array.iter\n    (fun slot ->\n      let nm = match Printexc.Slot.name slot with Some n -> n | None -> \"\" in\n      let loc =\n        match Printexc.Slot.location slot with\n        | Some l -> Printf.sprintf \"%s:%d\" l.filename l.line_number\n        | None -> \"\"\n      in\n      if !first then first := false else Buffer.add_char b dtp_obs_comma;\n      dtp_obs_str b (if loc = \"\" then nm else nm ^ \"@\" ^ loc))\n    slots;\n  Buffer.add_char b dtp_obs_rs\n\nlet dtp_obs_mem_ring = dtp_obs_ring_make ()\nlet dtp_obs_mem_run : Gc.Memprof.t option ref = ref None\n\nlet dtp_obs_mem_add (bt : Printexc.raw_backtrace) =\n  dtp_obs_ring_add dtp_obs_mem_ring bt\n\nlet dtp_obs_tracker : (unit, unit) Gc.Memprof.tracker =\n  { alloc_minor =\n      (fun (i : Gc.Memprof.allocation) -> dtp_obs_mem_add i.callstack; (None : unit option));\n    alloc_major =\n      (fun (i : Gc.Memprof.allocation) -> dtp_obs_mem_add i.callstack; (None : unit option));\n    promote = (fun () -> None);\n    dealloc_minor = (fun () -> ());\n    dealloc_major = (fun () -> ()) }\n\nlet dtp_obs_emit_samples (name : string) (ring : dtp_obs_ring) =\n  for i = 0 to ring.dtp_ring_n - 1 do\n    match ring.dtp_ring_slots.(i) with\n    | None -> ()\n    | Some bt ->\n      let b = Buffer.create 256 in\n      dtp_obs_hdr b \"i\" name (dtp_timeUs ());\n      Buffer.add_char b dtp_obs_comma;\n      dtp_obs_key b \"cat\";\n      dtp_obs_str b \"vuna.sample\";\n      Buffer.add_char b dtp_obs_comma;\n      dtp_obs_key b \"args\";\n      Buffer.add_char b dtp_obs_lb;\n      dtp_obs_key b \"stack\";\n      dtp_obs_frames b bt;\n      Buffer.add_char b dtp_obs_rb;\n      Buffer.add_char b dtp_obs_rb;\n      Buffer.add_char b dtp_obs_nl;\n      ignore (dtp_obs_emit (Buffer.contents b))\n  done\n\nlet dtp_obs_sample_start (mode : string) (interval_us : int) : int =\n  if not (dtp_obs_on ()) then 0\n  else begin\n    dtp_obs_ring_reset dtp_obs_cpu_ring;\n    dtp_obs_ring_reset dtp_obs_mem_ring;\n    (* `mode` \228\184\186\231\169\186\228\184\178\230\151\182\230\140\137 `VUNA_OBS_SAMPLE`\239\188\136env\239\188\137\229\143\150\231\188\186\231\156\129\239\188\136`cpu`\239\188\137\239\188\155\232\191\153\230\160\183 `vuna dev obs run\n       --sample both` \231\154\132 env \230\179\168\229\133\165\232\131\189\231\148\159\230\149\136\239\188\140\232\128\140\229\186\147\229\177\130\232\176\131\231\148\168\230\128\187\230\152\175\230\152\190\229\188\143\231\187\153 mode\227\128\130 *)\n    let mode2 =\n      if mode <> \"\" then mode\n      else match Sys.getenv_opt \"VUNA_OBS_SAMPLE\" with\n        | Some m when m <> \"\" -> m\n        | _ -> \"cpu\"\n    in\n    let iv2 =\n      if interval_us > 0 then interval_us\n      else\n        match int_of_string_opt (match Sys.getenv_opt \"VUNA_OBS_INTERVAL\" with Some v -> v | None -> \"\") with\n        | Some v when v > 0 -> v\n        | _ -> 1000\n    in\n    let want_cpu = mode2 = \"cpu\" || mode2 = \"both\" in\n    let want_mem = mode2 = \"mem\" || mode2 = \"both\" in\n    (if want_cpu then\n       try\n         Sys.set_signal Sys.sigprof (Sys.Signal_handle dtp_obs_cpu_tick);\n         dtp_obs_cpu_on := true;\n         ignore\n           (Unix.setitimer Unix.ITIMER_PROF\n              { Unix.it_interval = float_of_int iv2 /. 1000000.0;\n                it_value = float_of_int iv2 /. 1000000.0 })\n       with _ -> ());\n    (if want_mem then\n       try\n         dtp_obs_mem_run :=\n           Some (Gc.Memprof.start ~sampling_rate:1e-4 ~callstack_size:16 dtp_obs_tracker)\n       with _ -> ());\n    0\n  end\n\nlet dtp_obs_sample_stop (_ : int) : int =\n  if not (dtp_obs_on ()) then 0\n  else begin\n    (try\n       dtp_obs_cpu_on := false;\n       ignore (Unix.setitimer Unix.ITIMER_PROF { Unix.it_interval = 0.0; it_value = 0.0 })\n     with _ -> ());\n    (try (match !dtp_obs_mem_run with Some _ -> Gc.Memprof.stop () | None -> ()) with _ -> ());\n    dtp_obs_mem_run := None;\n    dtp_obs_emit_samples \"vuna.sample.cpu\" dtp_obs_cpu_ring;\n    dtp_obs_emit_samples \"vuna.sample.mem\" dtp_obs_mem_ring;\n    ignore (dtp_obs_counter \"vuna.counter.sample.cpu\" dtp_obs_cpu_ring.dtp_ring_seen);\n    ignore (dtp_obs_counter \"vuna.counter.sample.mem\" dtp_obs_mem_ring.dtp_ring_seen);\n    dtp_obs_flush ()\n  end\n"

# 2220 "Vuna/Target/Ocaml/Term.vuna"
let v_inlineText = (fun (dtb_u_u2 : string) (dtb_u_u3 : string B_dData_dList.t_List) -> (if (dtb_u_u2 = "+") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u4, dtb_u_u5) -> (match dtb_u_u5 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u6, dtb_u_u7) -> (match dtb_u_u7 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u4; " + "; dtb_u_u6; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "-") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u8, dtb_u_u9) -> (match dtb_u_u9 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u10, dtb_u_u11) -> (match dtb_u_u11 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u8; " - "; dtb_u_u10; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "*") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u12, dtb_u_u13) -> (match dtb_u_u13 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u14, dtb_u_u15) -> (match dtb_u_u15 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u12; " * "; dtb_u_u14; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "/") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u16, dtb_u_u17) -> (match dtb_u_u17 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u18, dtb_u_u19) -> (match dtb_u_u19 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(if "; dtb_u_u18; " = 0 then failwith \"division by zero\" else "; dtb_u_u16; " / "; dtb_u_u18; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "&&") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u20, dtb_u_u21) -> (match dtb_u_u21 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u22, dtb_u_u23) -> (match dtb_u_u23 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u20; " && "; dtb_u_u22; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "||") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u24, dtb_u_u25) -> (match dtb_u_u25 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u26, dtb_u_u27) -> (match dtb_u_u27 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u24; " || "; dtb_u_u26; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bitAnd") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u28, dtb_u_u29) -> (match dtb_u_u29 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u30, dtb_u_u31) -> (match dtb_u_u31 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u28; " land "; dtb_u_u30; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bitOr") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u32, dtb_u_u33) -> (match dtb_u_u33 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u34, dtb_u_u35) -> (match dtb_u_u35 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u32; " lor "; dtb_u_u34; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bitXor") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u36, dtb_u_u37) -> (match dtb_u_u37 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u38, dtb_u_u39) -> (match dtb_u_u39 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u36; " lxor "; dtb_u_u38; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bitNot") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u40, dtb_u_u41) -> (match dtb_u_u41 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(lnot "; dtb_u_u40; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bitShl") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u42, dtb_u_u43) -> (match dtb_u_u43 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u44, dtb_u_u45) -> (match dtb_u_u45 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(if "; dtb_u_u44; " < 0 || "; dtb_u_u44; " >= 63 then 0 else "; dtb_u_u42; " lsl "; dtb_u_u44; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bitShr") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u46, dtb_u_u47) -> (match dtb_u_u47 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u48, dtb_u_u49) -> (match dtb_u_u49 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(if "; dtb_u_u48; " < 0 || "; dtb_u_u48; " >= 63 then 0 else "; dtb_u_u46; " lsr "; dtb_u_u48; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "strLength") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u50, dtb_u_u51) -> (match dtb_u_u51 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(String.length "; dtb_u_u50; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "strAt") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u52, dtb_u_u53) -> (match dtb_u_u53 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u54, dtb_u_u55) -> (match dtb_u_u55 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(let b = "; dtb_u_u52; " in let k = "; dtb_u_u54; " in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k))"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "strFromInt") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u56, dtb_u_u57) -> (match dtb_u_u57 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(string_of_int "; dtb_u_u56; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "effectId") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u58, dtb_u_u59) -> (match dtb_u_u59 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(dtp_effectId "; dtb_u_u58; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "++") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u60, dtb_u_u61) -> (match dtb_u_u61 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u62, dtb_u_u63) -> (match dtb_u_u63 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u60; " ^ "; dtb_u_u62; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_eq_int") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u64, dtb_u_u65) -> (match dtb_u_u65 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u66, dtb_u_u67) -> (match dtb_u_u67 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u64; " = "; dtb_u_u66; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_neq_int") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u68, dtb_u_u69) -> (match dtb_u_u69 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u70, dtb_u_u71) -> (match dtb_u_u71 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u68; " <> "; dtb_u_u70; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_eq_str") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u72, dtb_u_u73) -> (match dtb_u_u73 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u74, dtb_u_u75) -> (match dtb_u_u75 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u72; " = "; dtb_u_u74; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_neq_str") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u76, dtb_u_u77) -> (match dtb_u_u77 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u78, dtb_u_u79) -> (match dtb_u_u79 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u76; " <> "; dtb_u_u78; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_lt_int") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u80, dtb_u_u81) -> (match dtb_u_u81 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u82, dtb_u_u83) -> (match dtb_u_u83 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u80; " < "; dtb_u_u82; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_le_int") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u84, dtb_u_u85) -> (match dtb_u_u85 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u86, dtb_u_u87) -> (match dtb_u_u87 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u84; " <= "; dtb_u_u86; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_gt_int") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u88, dtb_u_u89) -> (match dtb_u_u89 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u90, dtb_u_u91) -> (match dtb_u_u91 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u88; " > "; dtb_u_u90; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_ge_int") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u92, dtb_u_u93) -> (match dtb_u_u93 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u94, dtb_u_u95) -> (match dtb_u_u95 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u92; " >= "; dtb_u_u94; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_lt_str") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u96, dtb_u_u97) -> (match dtb_u_u97 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u98, dtb_u_u99) -> (match dtb_u_u99 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u96; " < "; dtb_u_u98; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_le_str") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u100, dtb_u_u101) -> (match dtb_u_u101 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u102, dtb_u_u103) -> (match dtb_u_u103 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u100; " <= "; dtb_u_u102; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_gt_str") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u104, dtb_u_u105) -> (match dtb_u_u105 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u106, dtb_u_u107) -> (match dtb_u_u107 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u104; " > "; dtb_u_u106; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_ge_str") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u108, dtb_u_u109) -> (match dtb_u_u109 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u110, dtb_u_u111) -> (match dtb_u_u111 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u108; " >= "; dtb_u_u110; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_lt_bool") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u112, dtb_u_u113) -> (match dtb_u_u113 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u114, dtb_u_u115) -> (match dtb_u_u115 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(compare "; dtb_u_u112; " "; dtb_u_u114; " < 0)"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_le_bool") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u116, dtb_u_u117) -> (match dtb_u_u117 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u118, dtb_u_u119) -> (match dtb_u_u119 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(compare "; dtb_u_u116; " "; dtb_u_u118; " <= 0)"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_gt_bool") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u120, dtb_u_u121) -> (match dtb_u_u121 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u122, dtb_u_u123) -> (match dtb_u_u123 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(compare "; dtb_u_u120; " "; dtb_u_u122; " > 0)"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_ge_bool") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u124, dtb_u_u125) -> (match dtb_u_u125 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u126, dtb_u_u127) -> (match dtb_u_u127 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(compare "; dtb_u_u124; " "; dtb_u_u126; " >= 0)"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_add_float") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u128, dtb_u_u129) -> (match dtb_u_u129 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u130, dtb_u_u131) -> (match dtb_u_u131 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u128; " +. "; dtb_u_u130; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_sub_float") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u132, dtb_u_u133) -> (match dtb_u_u133 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u134, dtb_u_u135) -> (match dtb_u_u135 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u132; " -. "; dtb_u_u134; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_mul_float") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u136, dtb_u_u137) -> (match dtb_u_u137 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u138, dtb_u_u139) -> (match dtb_u_u139 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u136; " *. "; dtb_u_u138; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_div_float") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u140, dtb_u_u141) -> (match dtb_u_u141 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u142, dtb_u_u143) -> (match dtb_u_u143 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u140; " /. "; dtb_u_u142; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_eq_float") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u144, dtb_u_u145) -> (match dtb_u_u145 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u146, dtb_u_u147) -> (match dtb_u_u147 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u144; " = "; dtb_u_u146; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_neq_float") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u148, dtb_u_u149) -> (match dtb_u_u149 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u150, dtb_u_u151) -> (match dtb_u_u151 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u148; " <> "; dtb_u_u150; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_lt_float") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u152, dtb_u_u153) -> (match dtb_u_u153 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u154, dtb_u_u155) -> (match dtb_u_u155 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u152; " < "; dtb_u_u154; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_le_float") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u156, dtb_u_u157) -> (match dtb_u_u157 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u158, dtb_u_u159) -> (match dtb_u_u159 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u156; " <= "; dtb_u_u158; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_gt_float") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u160, dtb_u_u161) -> (match dtb_u_u161 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u162, dtb_u_u163) -> (match dtb_u_u163 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u160; " > "; dtb_u_u162; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "bi_ge_float") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u164, dtb_u_u165) -> (match dtb_u_u165 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u166, dtb_u_u167) -> (match dtb_u_u167 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["("; dtb_u_u164; " >= "; dtb_u_u166; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "natToInt") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u168, dtb_u_u169) -> (match dtb_u_u169 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just (dtb_u_u168))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "natFromInt") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u170, dtb_u_u171) -> (match dtb_u_u171 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(bi_natFromInt "; dtb_u_u170; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "natAdd") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u172, dtb_u_u173) -> (match dtb_u_u173 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u174, dtb_u_u175) -> (match dtb_u_u175 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(bi_natAdd "; dtb_u_u172; " "; dtb_u_u174; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "natSub") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u176, dtb_u_u177) -> (match dtb_u_u177 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u178, dtb_u_u179) -> (match dtb_u_u179 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(bi_natSub "; dtb_u_u176; " "; dtb_u_u178; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "natMul") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u180, dtb_u_u181) -> (match dtb_u_u181 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u182, dtb_u_u183) -> (match dtb_u_u183 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(bi_natMul "; dtb_u_u180; " "; dtb_u_u182; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else (if (dtb_u_u2 = "natDiv") then (match dtb_u_u3 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u184, dtb_u_u185) -> (match dtb_u_u185 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u186, dtb_u_u187) -> (match dtb_u_u187 with
  | B_dData_dList.C_List_Nil -> (B_dData_dMaybe.C_Maybe_Just ((String.concat "" ["(bi_natDiv "; dtb_u_u184; " "; dtb_u_u186; ")"])))
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
)
  | _ -> B_dData_dMaybe.C_Maybe_Nothing
) else B_dData_dMaybe.C_Maybe_Nothing))))))))))))))))))))))))))))))))))))))))))))))))))

# 2314 "Vuna/Target/Ocaml/Term.vuna"
let v_dtDefLocsRefRuntime = "let dt_def_locs_raw_ref : string ref = ref \"\"\nlet dt_set_locs_raw (raw : string) : unit =\n  dt_def_locs_raw_ref := raw\n"

# 2288 "Vuna/Target/Ocaml/Term.vuna"
let v_dtRuntimeWith = (fun (dtb_u_u188 : bool) (dtb_u_u189 : bool) (dtb_u_u190 : bool) (dtb_u_u191 : bool) (dtb_u_u192 : bool) (dtb_u_u193 : bool) (dtb_u_u194 : bool) (dtb_u_u195 : bool) (dtb_u_u196 : bool) -> (let dtb_u_u197 = (if dtb_u_u192 then true else dtb_u_u190) in (let dtb_u_u198 = (if (if dtb_u_u193 then true else dtb_u_u197) then true else dtb_u_u191) in (String.concat "" [v_dtRuntime; v_dtPrimRuntime; (if dtb_u_u194 then v_dtStrRuntime else ""); (if dtb_u_u195 then v_dtArrRuntime else ""); (if dtb_u_u196 then v_dtBufRuntime else ""); (if dtb_u_u198 then v_dtEffRuntimeHead else ""); (if dtb_u_u198 then v_dtEffRuntimeFull else ""); (if dtb_u_u198 then v_dtEffScopedRuntime else ""); (if dtb_u_u198 then v_dtEffBracketRuntime else ""); (if dtb_u_u198 then v_dtEffRuntimeTail else ""); (if dtb_u_u188 then v_dtFloatRuntime else ""); v_dtDefLocsRefRuntime; (v_dtReporterRuntimeWith dtb_u_u198); (if dtb_u_u197 then v_dtSchedRuntime else ""); (if dtb_u_u191 then v_dtHostRuntime else ""); (if dtb_u_u189 then v_dtLogRuntime else ""); (if dtb_u_u190 then v_dtObsRuntime else "")]))))

# 2323 "Vuna/Target/Ocaml/Term.vuna"
let v_dtDefLocsUnit = (fun (dtb_u_u199 : string) -> ((if (dtb_u_u199 = "") then "let dt_def_locs_raw = \"\"\n" else (String.concat "" ["let dt_def_locs_raw = "; dtb_u_u199; "\n"])) ^ "let () = Vuna_runtime.dt_set_locs_raw dt_def_locs_raw\n"))

# 2332 "Vuna/Target/Ocaml/Term.vuna"
let v_dtListBridge = (fun (dtb_u_u200 : Vuna_dIr_dModel.t_IrListFam B_dData_dMaybe.t_Maybe) -> (match dtb_u_u200 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u201) -> (let dtb_u_u202 = ((Vuna_dTarget_dOcaml_dDecl.v_ctorOcamlName (Vuna_dIr_dModel.v_irListFamilyOf dtb_u_u201)) (Vuna_dIr_dModel.v_irListNilOf dtb_u_u201)) in (let dtb_u_u203 = ((Vuna_dTarget_dOcaml_dDecl.v_ctorOcamlName (Vuna_dIr_dModel.v_irListFamilyOf dtb_u_u201)) (Vuna_dIr_dModel.v_irListConsOf dtb_u_u201)) in (String.concat "" ["\nlet dtp_unpack (s : string) =\n  let rec go i acc = if i < 0 then acc else go (i - 1) ("; dtb_u_u203; " (Char.code (String.unsafe_get s i), acc)) in\n  go (String.length s - 1) "; dtb_u_u202; "\nlet dtp_pack xs =\n  let rec len n l = match l with "; dtb_u_u202; " -> n | "; dtb_u_u203; " (_, rest) -> len (n + 1) rest in\n  let buf = Bytes.create (len 0 xs) in\n  let rec go i l = match l with\n    | "; dtb_u_u202; " -> ()\n    | "; dtb_u_u203; " (x, rest) -> Bytes.unsafe_set buf i (Char.chr x); go (i + 1) rest\n  in\n  (go 0 xs; Bytes.unsafe_to_string buf)\n\nlet dtp_listOf xs = List.fold_right (fun x acc -> "; dtb_u_u203; " (x, acc)) xs "; dtb_u_u202; "\nlet dtp_ocamlOf xs =\n  let rec go l = match l with "; dtb_u_u202; " -> [] | "; dtb_u_u203; " (x, rest) -> x :: go rest in\n  go xs\n\nlet dtp_concatMany xs =\n  let rec len acc l = match l with "; dtb_u_u202; " -> acc | "; dtb_u_u203; " (x, rest) -> len (acc + String.length x) rest in\n  let n = len 0 xs in\n  let buf = Bytes.create n in\n  let rec put off l = match l with\n    | "; dtb_u_u202; " -> ()\n    | "; dtb_u_u203; " (x, rest) ->\n      let k = String.length x in\n      Bytes.blit_string x 0 buf off k;\n      put (off + k) rest\n  in\n  (put 0 xs; Bytes.unsafe_to_string buf)\n\nlet dtp_substTemplate tmpl xs =\n  let args = Array.of_list (dtp_ocamlOf xs) in\n  let n = String.length tmpl and na = Array.length args in\n  let rec scan_len i acc =\n    if i >= n then acc\n    else if tmpl.[i] = '<' then begin\n      let j = ref (i + 1) and k = ref 0 in\n      while !j < n && tmpl.[!j] >= '0' && tmpl.[!j] <= '9' do\n        k := !k * 10 + (Char.code tmpl.[!j] - 48); incr j\n      done;\n      if !j < n && tmpl.[!j] = '>' && !j > i + 1 then\n        if !k < na then scan_len (!j + 1) (acc + String.length args.(!k))\n        else scan_len (!j + 1) (acc + (!j - i + 1))\n      else scan_len (i + 1) (acc + 1)\n    end else scan_len (i + 1) (acc + 1)\n  in\n  let out = Bytes.create (scan_len 0 0) in\n  let rec fill i o =\n    if i >= n then o\n    else if tmpl.[i] = '<' then begin\n      let j = ref (i + 1) and k = ref 0 in\n      while !j < n && tmpl.[!j] >= '0' && tmpl.[!j] <= '9' do\n        k := !k * 10 + (Char.code tmpl.[!j] - 48); incr j\n      done;\n      if !j < n && tmpl.[!j] = '>' && !j > i + 1 then\n        if !k < na then begin\n          let s = args.(!k) in\n          Bytes.blit_string s 0 out o (String.length s);\n          fill (!j + 1) (o + String.length s)\n        end else begin\n          let l = !j - i + 1 in\n          Bytes.blit_string tmpl i out o l;\n          fill (!j + 1) (o + l)\n        end\n      else (Bytes.set out o '<'; fill (i + 1) (o + 1))\n    end else (Bytes.set out o tmpl.[i]; fill (i + 1) (o + 1))\n  in\n  let m = fill 0 0 in\n  Bytes.sub_string out 0 m\n"])))
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2421 "Vuna/Target/Ocaml/Term.vuna"
let v_sortLocRows = (fun (dtb_u_u204 : string B_dData_dList.t_List) -> ((B_dData_dSort.v_sortBy (fun (dtb_u_u205 : string) (dtb_u_u206 : string) -> (((B_dTrait_dOrd.v__x60__x61_ B_dData_dString.v_Ord_u5afb3bbeddafcb50_uString) dtb_u_u205) dtb_u_u206))) dtb_u_u204))

# 2424 "Vuna/Target/Ocaml/Term.vuna"
let v_locRowOf = (fun (dtb_u_u207 : (string) -> string) (dtb_u_u208 : (string) -> string) (dtb_u_u209 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair) -> (let dtb_u_u210 = (B_dData_dPair.v_firstOf dtb_u_u209) in (let dtb_u_u211 = (B_dData_dPair.v_firstOf (B_dData_dPair.v_secondOf dtb_u_u209)) in (let dtb_u_u212 = (B_dData_dPair.v_secondOf (B_dData_dPair.v_secondOf dtb_u_u209)) in (String.concat "" [(dtb_u_u208 dtb_u_u210); "."; (Vuna_dTarget_dOcaml_dDecl.v_valueName dtb_u_u210); "\n"; dtb_u_u210; "\n"; (dtb_u_u207 dtb_u_u211); ":"; (string_of_int dtb_u_u212); "\n"])))))

# 2417 "Vuna/Target/Ocaml/Term.vuna"
let v_dtDefLocTable = (fun (dtb_u_u213 : (string) -> string) (dtb_u_u214 : (string) -> string) (dtb_u_u215 : (string, (string, int) B_dData_dPair.t_Pair) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (Vuna_dTarget_dOcaml_dDecl.v_ocamlString (B_dData_dList.dtp_concatMany (v_sortLocRows ((B_dData_dList.v_map ((v_locRowOf dtb_u_u213) dtb_u_u214)) dtb_u_u215)))))

# 2454 "Vuna/Target/Ocaml/Term.vuna"
let v_mkGenStWith = (fun (dtb_u_u216 : (string) -> string) (dtb_u_u217 : Vuna_dTarget_dOcaml_dDecl.t_QualCtx) (dtb_u_u218 : Vuna_dIr_dModel.t_IrShared) -> { f_GenSt_gsShared = dtb_u_u218; f_GenSt_gsQual = dtb_u_u217; f_GenSt_gsDeps = B_dData_dList.C_List_Nil; f_GenSt_gsNormPath = dtb_u_u216 })

# 2451 "Vuna/Target/Ocaml/Term.vuna"
let v_mkGenSt = (fun (dtb_u_u219 : Vuna_dTarget_dOcaml_dDecl.t_QualCtx) (dtb_u_u220 : Vuna_dIr_dModel.t_IrShared) -> (((v_mkGenStWith (fun (dtb_u_u221 : string) -> dtb_u_u221)) dtb_u_u219) dtb_u_u220))

# 2458 "Vuna/Target/Ocaml/Term.vuna"
let v_gsAddDep = (fun (dtb_u_u222 : t_GenSt) (dtb_u_u223 : string) -> (if (if (dtb_u_u223 = "") then true else ((B_dData_dList.v_memName dtb_u_u223) (dtb_u_u222).f_GenSt_gsDeps)) then dtb_u_u222 else { f_GenSt_gsShared = (dtb_u_u222).f_GenSt_gsShared; f_GenSt_gsQual = (dtb_u_u222).f_GenSt_gsQual; f_GenSt_gsDeps = (B_dData_dList.C_List__x58__x58_ (dtb_u_u223, (dtb_u_u222).f_GenSt_gsDeps)); f_GenSt_gsNormPath = (dtb_u_u222).f_GenSt_gsNormPath }))

# 2466 "Vuna/Target/Ocaml/Term.vuna"
let v_genValueRef = (fun (dtb_u_u224 : t_GenSt) (dtb_u_u225 : string) -> (let dtb_u_u226 = ((Vuna_dTarget_dOcaml_dDecl.v_qualValueText (dtb_u_u224).f_GenSt_gsQual) dtb_u_u225) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u226); B_dData_dPair.f_Pair_second = ((v_gsAddDep dtb_u_u224) (B_dData_dPair.v_secondOf dtb_u_u226)) }))

# 2473 "Vuna/Target/Ocaml/Term.vuna"
let v_genCtorRef = (fun (dtb_u_u227 : t_GenSt) (dtb_u_u228 : string) (dtb_u_u229 : string) -> (let dtb_u_u230 = (((Vuna_dTarget_dOcaml_dDecl.v_qualCtorText (dtb_u_u227).f_GenSt_gsQual) dtb_u_u228) dtb_u_u229) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u230); B_dData_dPair.f_Pair_second = ((v_gsAddDep dtb_u_u227) (B_dData_dPair.v_secondOf dtb_u_u230)) }))

# 2480 "Vuna/Target/Ocaml/Term.vuna"
let v_gsDepOfFamily = (fun (dtb_u_u231 : t_GenSt) (dtb_u_u232 : string) -> (let dtb_u_u233 = ((Vuna_dTarget_dOcaml_dDecl.v_unitOfTbl ((dtb_u_u231).f_GenSt_gsQual).Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas) dtb_u_u232) in (if (if (dtb_u_u233 = "") then true else (dtb_u_u233 = ((dtb_u_u231).f_GenSt_gsQual).Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit)) then dtb_u_u231 else ((v_gsAddDep dtb_u_u231) dtb_u_u233))))

# 2486 "Vuna/Target/Ocaml/Term.vuna"
let v_recordLabelOf = (fun (dtb_u_u234 : t_GenSt) (dtb_u_u235 : string) (dtb_u_u236 : string) -> (let dtb_u_u237 = ((Vuna_dTarget_dOcaml_dDecl.v_unitOfTbl ((dtb_u_u234).f_GenSt_gsQual).Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas) dtb_u_u235) in (if (if (dtb_u_u237 = "") then true else (dtb_u_u237 = ((dtb_u_u234).f_GenSt_gsQual).Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcUnit)) then dtb_u_u236 else (String.concat "" [dtb_u_u237; "."; dtb_u_u236]))))

# 2494 "Vuna/Target/Ocaml/Term.vuna"
let v_bridgeUnitOf = (fun (dtb_u_u238 : t_GenSt) -> (match ((dtb_u_u238).f_GenSt_gsShared).Vuna_dIr_dModel.f_IrShared_irSharedListFam with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u239) -> ((Vuna_dTarget_dOcaml_dDecl.v_unitOfTbl ((dtb_u_u238).f_GenSt_gsQual).Vuna_dTarget_dOcaml_dDecl.f_QualCtx_qcDatas) (Vuna_dIr_dModel.v_irListFamilyOf dtb_u_u239))
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | _ -> failwith "DT: impossible branch"
))

# 2500 "Vuna/Target/Ocaml/Term.vuna"
let v_replaceAll = (fun (dtb_u_u240 : string) (dtb_u_u241 : string) (dtb_u_u242 : string) -> ((B_dData_dString.v_join dtb_u_u241) ((B_dData_dString.v_split dtb_u_u240) dtb_u_u242)))

# 2503 "Vuna/Target/Ocaml/Term.vuna"
let rec v_qualifyBridgeNames = (fun (dtb_u_u243 : string) (dtb_u_u244 : string B_dData_dList.t_List) (dtb_u_u245 : string) -> (match dtb_u_u244 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u246, dtb_u_u247) -> (((v_qualifyBridgeNames dtb_u_u243) dtb_u_u247) (((v_replaceAll dtb_u_u246) (String.concat "" [dtb_u_u243; "."; dtb_u_u246])) dtb_u_u245))
  | B_dData_dList.C_List_Nil -> dtb_u_u245
  | _ -> failwith "DT: impossible branch"
))

# 2508 "Vuna/Target/Ocaml/Term.vuna"
let v_qualifyBridgeText = (fun (dtb_u_u248 : string) (dtb_u_u249 : string) -> (if (dtb_u_u248 = "") then dtb_u_u249 else (((v_qualifyBridgeNames dtb_u_u248) Vuna_dTarget_dOcaml_dRuntime.v_ocamlRtHelperNames) dtb_u_u249)))

# 2512 "Vuna/Target/Ocaml/Term.vuna"
let v_genBridgeRef = (fun (dtb_u_u250 : t_GenSt) (dtb_u_u251 : string) -> (let dtb_u_u252 = (v_bridgeUnitOf dtb_u_u250) in { B_dData_dPair.f_Pair_first = ((v_qualifyBridgeText dtb_u_u252) dtb_u_u251); B_dData_dPair.f_Pair_second = ((v_gsAddDep dtb_u_u250) dtb_u_u252) }))

# 2525 "Vuna/Target/Ocaml/Term.vuna"
let v_effUnitTypeNameIr = "Base.Effect.Core.EffUnit"

# 2519 "Vuna/Target/Ocaml/Term.vuna"
let v_effUnitTyPair = (fun (dtb_u_u253 : t_GenSt) -> (let dtb_u_u254 = ((Vuna_dTarget_dOcaml_dDecl.v_qualTypeText (dtb_u_u253).f_GenSt_gsQual) v_effUnitTypeNameIr) in { B_dData_dPair.f_Pair_first = (B_dData_dPair.v_firstOf dtb_u_u254); B_dData_dPair.f_Pair_second = ((v_gsAddDep dtb_u_u253) (B_dData_dPair.v_secondOf dtb_u_u254)) }))

# 2549 "Vuna/Target/Ocaml/Term.vuna"
let v_ocamlLitText = (fun (dtb_u_u255 : string) -> (if ((let b = dtb_u_u255 in let k = 0 in if k < 0 || k >= String.length b then -1 else Char.code (String.unsafe_get b k)) = 45) then (String.concat "" ["("; dtb_u_u255; ")"]) else dtb_u_u255))

# 2565 "Vuna/Target/Ocaml/Term.vuna"
let v_isEffThunkAlt = (fun (dtb_u_u256 : Vuna_dIr_dModel.t_IrAlt) -> (let dtb_u_u257 = (Vuna_dIr_dModel.v_irAltCtorOf dtb_u_u256) in (match dtb_u_u257 with
  | B_dData_dMaybe.C_Maybe_Nothing -> false
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u258) -> (match dtb_u_u258 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u259; B_dData_dPair.f_Pair_second = dtb_u_u260 } -> (if (dtb_u_u259 = Vuna_dIr_dModel.v_irEffTypeName) then (dtb_u_u260 = Vuna_dIr_dModel.v_irEffMkCtor) else false)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 2792 "Vuna/Target/Ocaml/Term.vuna"
let v_ioParamNames = (B_dData_dList.C_List__x58__x58_ ("dtio_0", (B_dData_dList.C_List__x58__x58_ ("dtio_1", (B_dData_dList.C_List__x58__x58_ ("dtio_2", (B_dData_dList.C_List__x58__x58_ ("dtio_3", B_dData_dList.C_List_Nil))))))))

# 2795 "Vuna/Target/Ocaml/Term.vuna"
let[@tail_mod_cons] rec v_takeNames = (fun (dtb_u_u261 : int) (dtb_u_u262 : string B_dData_dList.t_List) -> (if (dtb_u_u261 <= 0) then B_dData_dList.C_List_Nil else (match dtb_u_u262 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u263, dtb_u_u264) -> (B_dData_dList.C_List__x58__x58_ (dtb_u_u263, ((v_takeNames (dtb_u_u261 - 1)) dtb_u_u264)))
  | _ -> failwith "DT: impossible branch"
)))

# 2781 "Vuna/Target/Ocaml/Term.vuna"
let v_effThunkText = (fun (dtb_u_u265 : string) (dtb_u_u266 : string) (dtb_u_u267 : string) (dtb_u_u268 : int) -> (let dtb_u_u269 = ((Vuna_dTarget_dOcaml_dRender.v_joinWith " ") ((v_takeNames dtb_u_u268) v_ioParamNames)) in (if (dtb_u_u268 = 0) then (String.concat "" ["(Obj.repr (fun (_ : "; dtb_u_u266; ") -> "; dtb_u_u267; "))"]) else (String.concat "" ["(fun "; dtb_u_u269; " -> Obj.repr (fun (_ : "; dtb_u_u266; ") -> "; dtb_u_u267; " "; dtb_u_u269; "))"]))))

# 2837 "Vuna/Target/Ocaml/Term.vuna"
let v_nonErasedBinderText = (fun (dtb_u_u270 : Vuna_dIr_dModel.t_IrBinder) -> (match dtb_u_u270 with
  | { Vuna_dIr_dModel.f_IrBinder_irBinderId = dtb_u_u271; Vuna_dIr_dModel.f_IrBinder_irBinderName = dtb_u_u272; Vuna_dIr_dModel.f_IrBinder_irBinderErased = dtb_u_u273; Vuna_dIr_dModel.f_IrBinder_irBinderTy = dtb_u_u274 } -> (if dtb_u_u273 then "" else (Vuna_dTarget_dOcaml_dDecl.v_irBinderText dtb_u_u270))
  | _ -> failwith "DT: impossible branch"
))

# 2874 "Vuna/Target/Ocaml/Term.vuna"
let v_gsWithTyDeps = (fun (dtb_u_u275 : t_GenSt) (dtb_u_u276 : Vuna_dIr_dModel.t_IrTy) -> (((B_dData_dList.v_foldl (fun (dtb_u_u277 : t_GenSt) (dtb_u_u278 : string) -> ((v_gsAddDep dtb_u_u277) dtb_u_u278))) dtb_u_u275) ((Vuna_dTarget_dOcaml_dDecl.v_irTyDeclDeps (dtb_u_u275).f_GenSt_gsQual) (B_dData_dList.C_List__x58__x58_ (dtb_u_u276, B_dData_dList.C_List_Nil)))))

# 2844 "Vuna/Target/Ocaml/Term.vuna"
let rec v_genLamParams = (fun (dtb_u_u279 : t_GenSt) (dtb_u_u280 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> (match dtb_u_u280 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u281, dtb_u_u282) -> (if (dtb_u_u281).Vuna_dIr_dModel.f_IrBinder_irBinderErased then ((v_genLamParams dtb_u_u279) dtb_u_u282) else (match (dtb_u_u281).Vuna_dIr_dModel.f_IrBinder_irBinderTy with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u283) -> (if (Vuna_dIr_dModel.v_irTyAnnotatable dtb_u_u283) then (let dtb_u_u284 = ((v_gsWithTyDeps dtb_u_u279) dtb_u_u283) in (let dtb_u_u285 = (B_dData_dMaybe.C_Maybe_Just (((Vuna_dTarget_dOcaml_dDecl.v_irTyText (dtb_u_u279).f_GenSt_gsQual) dtb_u_u283))) in ((Base_dCommon.v_bind ((v_genLamParams dtb_u_u284) dtb_u_u282)) (fun (dtb_u_u286 : ((string, string B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u286 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u287; B_dData_dPair.f_Pair_second = dtb_u_u288 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dDecl.v_irBinderText dtb_u_u281); B_dData_dPair.f_Pair_second = dtb_u_u285 }, dtb_u_u287)); B_dData_dPair.f_Pair_second = dtb_u_u288 }))
  | _ -> failwith "DT: impossible branch"
))))) else (((v_genLamParamsUnannotated dtb_u_u279) dtb_u_u281) dtb_u_u282))
  | B_dData_dMaybe.C_Maybe_Nothing -> (((v_genLamParamsUnannotated dtb_u_u279) dtb_u_u281) dtb_u_u282)
  | _ -> failwith "DT: impossible branch"
))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u279 }))
  | _ -> failwith "DT: impossible branch"
))
# 2865 "Vuna/Target/Ocaml/Term.vuna"
and v_genLamParamsUnannotated = (fun (dtb_u_u289 : t_GenSt) (dtb_u_u290 : Vuna_dIr_dModel.t_IrBinder) (dtb_u_u291 : Vuna_dIr_dModel.t_IrBinder B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_genLamParams dtb_u_u289) dtb_u_u291)) (fun (dtb_u_u292 : ((string, string B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u292 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u293; B_dData_dPair.f_Pair_second = dtb_u_u294 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dDecl.v_irBinderText dtb_u_u290); B_dData_dPair.f_Pair_second = B_dData_dMaybe.C_Maybe_Nothing }, dtb_u_u293)); B_dData_dPair.f_Pair_second = dtb_u_u294 }))
  | _ -> failwith "DT: impossible branch"
))))

# 2877 "Vuna/Target/Ocaml/Term.vuna"
let rec v_hasCatchAll = (fun (dtb_u_u295 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match dtb_u_u295 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u296, dtb_u_u297) -> (match (Vuna_dIr_dModel.v_irAltCtorOf dtb_u_u296) with
  | B_dData_dMaybe.C_Maybe_Nothing -> true
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u298) -> (v_hasCatchAll dtb_u_u297)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 2924 "Vuna/Target/Ocaml/Term.vuna"
let[@tail_mod_cons] rec v_recordPatFields = (fun (dtb_u_u299 : t_GenSt) (dtb_u_u300 : string) (dtb_u_u301 : (int, string) B_dData_dPair.t_Pair B_dData_dList.t_List) (dtb_u_u302 : string B_dData_dList.t_List) -> (match dtb_u_u301 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u303, dtb_u_u304) -> (match dtb_u_u302 with
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u305, dtb_u_u306) -> (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = (((v_recordLabelOf dtb_u_u299) dtb_u_u300) ((Vuna_dTarget_dOcaml_dDecl.v_recordFieldLabel dtb_u_u300) (B_dData_dPair.v_secondOf dtb_u_u303))); B_dData_dPair.f_Pair_second = (Vuna_dTarget_dOcaml_dModel.C_OPat_OPVar (dtb_u_u305)) }, ((((v_recordPatFields dtb_u_u299) dtb_u_u300) dtb_u_u304) dtb_u_u306)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> B_dData_dList.C_List_Nil
  | _ -> failwith "DT: impossible branch"
))

# 2974 "Vuna/Target/Ocaml/Term.vuna"
let v_termOrImpossible = (fun (dtb_u_u307 : Vuna_dTarget_dOcaml_dModel.t_OTerm B_dData_dMaybe.t_Maybe) (dtb_u_u308 : Vuna_dTarget_dOcaml_dModel.t_OTerm) -> (match dtb_u_u307 with
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u308
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u309) -> dtb_u_u309
  | _ -> failwith "DT: impossible branch"
))

# 2531 "Vuna/Target/Ocaml/Term.vuna"
let rec v_genIr = (fun (dtb_u_u310 : t_GenSt) (dtb_u_u311 : Vuna_dIr_dModel.t_Ir) -> ((v_genIrNode dtb_u_u310) dtb_u_u311))
# 2535 "Vuna/Target/Ocaml/Term.vuna"
and v_genAppNode = (fun (dtb_u_u312 : t_GenSt) (dtb_u_u313 : Vuna_dIr_dModel.t_Ir) (dtb_u_u314 : Vuna_dIr_dModel.t_Ir) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u312) dtb_u_u313)) (fun (dtb_u_u315 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u315 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u316; B_dData_dPair.f_Pair_second = dtb_u_u317 } -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u317) dtb_u_u314)) (fun (dtb_u_u318 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u318 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u319; B_dData_dPair.f_Pair_second = dtb_u_u320 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OApp (dtb_u_u316, dtb_u_u319)); B_dData_dPair.f_Pair_second = dtb_u_u320 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 2552 "Vuna/Target/Ocaml/Term.vuna"
and v_genCaseDefault = (fun (dtb_u_u321 : t_GenSt) (dtb_u_u322 : Vuna_dIr_dModel.t_Ir) (dtb_u_u323 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u321) dtb_u_u322)) (fun (dtb_u_u324 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u324 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u325; B_dData_dPair.f_Pair_second = dtb_u_u326 } -> ((Base_dCommon.v_bind ((v_genArms dtb_u_u326) dtb_u_u323)) (fun (dtb_u_u327 : ((Vuna_dTarget_dOcaml_dModel.t_OPat, Vuna_dTarget_dOcaml_dModel.t_OTerm) B_dData_dPair.t_Pair B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u327 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u328; B_dData_dPair.f_Pair_second = dtb_u_u329 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OMatch (dtb_u_u325, dtb_u_u328, (v_hasCatchAll dtb_u_u323))); B_dData_dPair.f_Pair_second = dtb_u_u329 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
# 2571 "Vuna/Target/Ocaml/Term.vuna"
and v_genIrNode = (fun (dtb_u_u330 : t_GenSt) (dtb_u_u331 : Vuna_dIr_dModel.t_Ir) -> (match dtb_u_u331 with
  | Vuna_dIr_dModel.C_Ir_IrEffBind (dtb_u_u332, dtb_u_u333, dtb_u_u334) -> (let dtb_u_u335 = (((v_genCtorRef dtb_u_u330) dtb_u_u332) dtb_u_u333) in (let dtb_u_u336 = ((v_gsDepOfFamily (B_dData_dPair.v_secondOf dtb_u_u335)) dtb_u_u332) in (let dtb_u_u337 = ((Vuna_dTarget_dOcaml_dDecl.v_irTyText (dtb_u_u336).f_GenSt_gsQual) dtb_u_u334) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_ORaw ((String.concat "" ["(fun m k -> "; (B_dData_dPair.v_firstOf dtb_u_u335); " (fun (u : "; dtb_u_u337; ") -> match m with "; (B_dData_dPair.v_firstOf dtb_u_u335); " f -> (match k (f u) with "; (B_dData_dPair.v_firstOf dtb_u_u335); " g -> g u)))"]))); B_dData_dPair.f_Pair_second = dtb_u_u336 })))))
  | Vuna_dIr_dModel.C_Ir_IrEffThunk (dtb_u_u338, dtb_u_u339, dtb_u_u340, dtb_u_u341, dtb_u_u342) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u330) dtb_u_u342)) (fun (dtb_u_u343 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u343 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u344; B_dData_dPair.f_Pair_second = dtb_u_u345 } -> (let dtb_u_u346 = (((v_genCtorRef dtb_u_u345) dtb_u_u338) dtb_u_u339) in (let dtb_u_u347 = ((v_gsDepOfFamily (B_dData_dPair.v_secondOf dtb_u_u346)) dtb_u_u338) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_ORaw (((((v_effThunkText (B_dData_dPair.v_firstOf dtb_u_u346)) ((Vuna_dTarget_dOcaml_dDecl.v_irTyText (dtb_u_u347).f_GenSt_gsQual) dtb_u_u340)) (Vuna_dTarget_dOcaml_dRender.v_renderTerm dtb_u_u344)) dtb_u_u341))); B_dData_dPair.f_Pair_second = dtb_u_u347 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dIr_dModel.C_Ir_IrConcatMany (dtb_u_u348) -> ((Base_dCommon.v_bind ((v_genIrArgs dtb_u_u330) dtb_u_u348)) (fun (dtb_u_u349 : (Vuna_dTarget_dOcaml_dModel.t_OTerm B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u349 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u350; B_dData_dPair.f_Pair_second = dtb_u_u351 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OConcatStr (dtb_u_u350)); B_dData_dPair.f_Pair_second = dtb_u_u351 }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dIr_dModel.C_Ir_IrRtApp (dtb_u_u352, dtb_u_u353) -> ((Base_dCommon.v_bind ((v_genIrArgs dtb_u_u330) dtb_u_u353)) (fun (dtb_u_u354 : (Vuna_dTarget_dOcaml_dModel.t_OTerm B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u354 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u355; B_dData_dPair.f_Pair_second = dtb_u_u356 } -> (match ((v_inlineText dtb_u_u352) ((B_dData_dList.v_map Vuna_dTarget_dOcaml_dRender.v_renderTerm) dtb_u_u355)) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u357) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_ORaw (dtb_u_u357)); B_dData_dPair.f_Pair_second = dtb_u_u356 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["no inline text for builtin `"; dtb_u_u352; "`"]))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dIr_dModel.C_Ir_IrNatCase (dtb_u_u358, dtb_u_u359, dtb_u_u360, dtb_u_u361, dtb_u_u362) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u330) dtb_u_u358)) (fun (dtb_u_u363 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u363 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u364; B_dData_dPair.f_Pair_second = dtb_u_u365 } -> ((Base_dCommon.v_bind (((((v_genNatBranches dtb_u_u365) dtb_u_u359) dtb_u_u360) dtb_u_u361) dtb_u_u362)) (fun (dtb_u_u366 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u366 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u367; B_dData_dPair.f_Pair_second = dtb_u_u368 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OLet ((Vuna_dTarget_dOcaml_dModel.C_OPat_OPVar (("dtnat__" ^ (string_of_int dtb_u_u359)))), dtb_u_u364, dtb_u_u367)); B_dData_dPair.f_Pair_second = dtb_u_u368 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dIr_dModel.C_Ir_IrCase (dtb_u_u369, dtb_u_u370, dtb_u_u371, dtb_u_u372) -> (match dtb_u_u372 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u373, dtb_u_u374) -> (if (v_isEffThunkAlt dtb_u_u373) then (let dtb_u_u375 = (Vuna_dIr_dModel.v_irAltBindersOf dtb_u_u373) in (match dtb_u_u375 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u376, dtb_u_u377) -> (match dtb_u_u377 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u330) dtb_u_u371)) (fun (dtb_u_u378 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u378 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u379; B_dData_dPair.f_Pair_second = dtb_u_u380 } -> (if ((v_nonErasedBinderText dtb_u_u376) = "") then (Base_dDiag.v_icInternal "Eff case binder must be kept") else (let dtb_u_u381 = (v_nonErasedBinderText dtb_u_u376) in ((Base_dCommon.v_bind ((v_genIr dtb_u_u380) (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u373))) (fun (dtb_u_u382 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u382 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u383; B_dData_dPair.f_Pair_second = dtb_u_u384 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OLet ((Vuna_dTarget_dOcaml_dModel.C_OPat_OPVar (dtb_u_u381)), (Vuna_dTarget_dOcaml_dModel.C_OTerm_ORaw ((String.concat "" ["Obj.obj ("; (Vuna_dTarget_dOcaml_dRender.v_renderTerm dtb_u_u379); ")"]))), dtb_u_u383)); B_dData_dPair.f_Pair_second = dtb_u_u384 }))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (Base_dDiag.v_icInternal "Eff case arm must have exactly one binder")
)
  | _ -> (Base_dDiag.v_icInternal "Eff case arm must have exactly one binder")
)) else (((v_genCaseDefault dtb_u_u330) dtb_u_u371) dtb_u_u372))
  | B_dData_dList.C_List_Nil -> (((v_genCaseDefault dtb_u_u330) dtb_u_u371) dtb_u_u372)
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dIr_dModel.C_Ir_IrIf (dtb_u_u385, dtb_u_u386, dtb_u_u387) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u330) dtb_u_u385)) (fun (dtb_u_u388 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u388 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u389; B_dData_dPair.f_Pair_second = dtb_u_u390 } -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u390) dtb_u_u386)) (fun (dtb_u_u391 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u391 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u392; B_dData_dPair.f_Pair_second = dtb_u_u393 } -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u393) dtb_u_u387)) (fun (dtb_u_u394 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u394 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u395; B_dData_dPair.f_Pair_second = dtb_u_u396 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OIf (dtb_u_u389, dtb_u_u392, dtb_u_u395)); B_dData_dPair.f_Pair_second = dtb_u_u396 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dIr_dModel.C_Ir_IrApp (dtb_u_u397, dtb_u_u398, dtb_u_u399) -> (let dtb_u_u400 = dtb_u_u398 in (match dtb_u_u400 with
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u401, dtb_u_u402, dtb_u_u403) -> (match dtb_u_u401 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u404, dtb_u_u405) -> (match dtb_u_u405 with
  | B_dData_dList.C_List_Nil -> (if ((v_nonErasedBinderText dtb_u_u404) = "") then (((v_genAppNode dtb_u_u330) dtb_u_u398) dtb_u_u399) else ((Base_dCommon.v_bind ((v_genIr dtb_u_u330) dtb_u_u399)) (fun (dtb_u_u406 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u406 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u407; B_dData_dPair.f_Pair_second = dtb_u_u408 } -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u408) dtb_u_u403)) (fun (dtb_u_u409 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u409 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u410; B_dData_dPair.f_Pair_second = dtb_u_u411 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OLet ((Vuna_dTarget_dOcaml_dModel.C_OPat_OPVar ((v_nonErasedBinderText dtb_u_u404))), dtb_u_u407, dtb_u_u410)); B_dData_dPair.f_Pair_second = dtb_u_u411 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> (((v_genAppNode dtb_u_u330) dtb_u_u398) dtb_u_u399)
)
  | _ -> (((v_genAppNode dtb_u_u330) dtb_u_u398) dtb_u_u399)
)
  | _ -> (((v_genAppNode dtb_u_u330) dtb_u_u398) dtb_u_u399)
))
  | Vuna_dIr_dModel.C_Ir_IrTail (dtb_u_u412) -> ((v_genIrNode dtb_u_u330) dtb_u_u412)
  | Vuna_dIr_dModel.C_Ir_IrLam (dtb_u_u413, dtb_u_u414, dtb_u_u415) -> ((Base_dCommon.v_bind ((v_genLamParams dtb_u_u330) dtb_u_u413)) (fun (dtb_u_u416 : ((string, string B_dData_dMaybe.t_Maybe) B_dData_dPair.t_Pair B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u416 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u417; B_dData_dPair.f_Pair_second = dtb_u_u418 } -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u418) dtb_u_u415)) (fun (dtb_u_u419 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u419 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u420; B_dData_dPair.f_Pair_second = dtb_u_u421 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OLam (dtb_u_u417, dtb_u_u420)); B_dData_dPair.f_Pair_second = dtb_u_u421 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dIr_dModel.C_Ir_IrLet (dtb_u_u422, dtb_u_u423, dtb_u_u424) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u330) dtb_u_u423)) (fun (dtb_u_u425 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u425 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u426; B_dData_dPair.f_Pair_second = dtb_u_u427 } -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u427) dtb_u_u424)) (fun (dtb_u_u428 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u428 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u429; B_dData_dPair.f_Pair_second = dtb_u_u430 } -> (match ((B_dData_dList.v_filter (fun (dtb_u_u431 : string) -> (dtb_u_u431 <> ""))) ((B_dData_dList.v_map v_nonErasedBinderText) dtb_u_u422)) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OLet (Vuna_dTarget_dOcaml_dModel.C_OPat_OPWild, dtb_u_u426, dtb_u_u429)); B_dData_dPair.f_Pair_second = dtb_u_u430 }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u432, dtb_u_u433) -> (match dtb_u_u433 with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OLet ((Vuna_dTarget_dOcaml_dModel.C_OPat_OPVar (dtb_u_u432)), dtb_u_u426, dtb_u_u429)); B_dData_dPair.f_Pair_second = dtb_u_u430 }))
  | _ -> (Base_dDiag.v_icInternal "unboxed case arm has more than one runtime binder")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dIr_dModel.C_Ir_IrFloatLit (dtb_u_u434) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OName ((v_ocamlLitText dtb_u_u434))); B_dData_dPair.f_Pair_second = dtb_u_u330 }))
  | Vuna_dIr_dModel.C_Ir_IrBool (dtb_u_u435) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OName ((Vuna_dTarget_dOcaml_dDecl.v_boolText dtb_u_u435))); B_dData_dPair.f_Pair_second = dtb_u_u330 }))
  | Vuna_dIr_dModel.C_Ir_IrStr (dtb_u_u436) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OName ((Vuna_dTarget_dOcaml_dDecl.v_ocamlString dtb_u_u436))); B_dData_dPair.f_Pair_second = dtb_u_u330 }))
  | Vuna_dIr_dModel.C_Ir_IrInt (dtb_u_u437) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OName ((v_ocamlLitText (string_of_int dtb_u_u437)))); B_dData_dPair.f_Pair_second = dtb_u_u330 }))
  | Vuna_dIr_dModel.C_Ir_IrCast (dtb_u_u438, dtb_u_u439, dtb_u_u440) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u330) dtb_u_u440)) (fun (dtb_u_u441 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u441 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u442; B_dData_dPair.f_Pair_second = dtb_u_u443 } -> (match dtb_u_u439 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OCast (dtb_u_u442)); B_dData_dPair.f_Pair_second = dtb_u_u443 }))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u444) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OAnnot ((Vuna_dTarget_dOcaml_dModel.C_OTerm_OCast (dtb_u_u442)), ((Vuna_dTarget_dOcaml_dDecl.v_irTyText (dtb_u_u443).f_GenSt_gsQual) dtb_u_u444))); B_dData_dPair.f_Pair_second = dtb_u_u443 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dIr_dModel.C_Ir_IrRt (dtb_u_u445) -> (match (Vuna_dTarget_dOcaml_dRuntime.v_ocamlRtText dtb_u_u445) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal (String.concat "" ["no OCaml runtime text for IR symbol `"; dtb_u_u445; "`"]))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u446) -> (if (Vuna_dIr_dRuntime.v_irRtBridgesList dtb_u_u445) then (let dtb_u_u447 = ((v_genBridgeRef dtb_u_u330) dtb_u_u446) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_ORaw ((B_dData_dPair.v_firstOf dtb_u_u447))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u447) }))) else (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_ORaw (dtb_u_u446)); B_dData_dPair.f_Pair_second = dtb_u_u330 })))
  | _ -> failwith "DT: impossible branch"
)
  | Vuna_dIr_dModel.C_Ir_IrRecUpd (dtb_u_u448, dtb_u_u449, dtb_u_u450, dtb_u_u451) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u330) dtb_u_u448)) (fun (dtb_u_u452 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u452 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u453; B_dData_dPair.f_Pair_second = dtb_u_u454 } -> ((Base_dCommon.v_bind (((v_genAssignedFields dtb_u_u454) dtb_u_u449) dtb_u_u450)) (fun (dtb_u_u455 : ((string, Vuna_dTarget_dOcaml_dModel.t_OTerm) B_dData_dPair.t_Pair B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u455 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u456; B_dData_dPair.f_Pair_second = dtb_u_u457 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_ORecordUpd (dtb_u_u453, dtb_u_u456)); B_dData_dPair.f_Pair_second = ((v_gsDepOfFamily dtb_u_u457) dtb_u_u449) }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dIr_dModel.C_Ir_IrProj (dtb_u_u458, dtb_u_u459, dtb_u_u460, dtb_u_u461) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u330) dtb_u_u458)) (fun (dtb_u_u462 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u462 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u463; B_dData_dPair.f_Pair_second = dtb_u_u464 } -> (let dtb_u_u465 = ((v_gsDepOfFamily dtb_u_u464) dtb_u_u459) in (let dtb_u_u466 = ((Vuna_dTarget_dOcaml_dDecl.v_recordFieldLabel dtb_u_u459) dtb_u_u460) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OProj (dtb_u_u463, (((v_recordLabelOf dtb_u_u465) dtb_u_u459) dtb_u_u466))); B_dData_dPair.f_Pair_second = dtb_u_u465 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dIr_dModel.C_Ir_IrRecord (dtb_u_u467, dtb_u_u468, dtb_u_u469) -> ((Base_dCommon.v_bind (((v_genAssignedFields dtb_u_u330) dtb_u_u467) dtb_u_u469)) (fun (dtb_u_u470 : ((string, Vuna_dTarget_dOcaml_dModel.t_OTerm) B_dData_dPair.t_Pair B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u470 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u471; B_dData_dPair.f_Pair_second = dtb_u_u472 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_ORecordCon (dtb_u_u471)); B_dData_dPair.f_Pair_second = ((v_gsDepOfFamily dtb_u_u472) dtb_u_u467) }))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dIr_dModel.C_Ir_IrCtor (dtb_u_u473, dtb_u_u474, dtb_u_u475, dtb_u_u476) -> (if (if (dtb_u_u473 = Vuna_dIr_dModel.v_irEffTypeName) then (dtb_u_u474 = Vuna_dIr_dModel.v_irEffMkCtor) else false) then (let dtb_u_u477 = dtb_u_u476 in (match dtb_u_u477 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u478, dtb_u_u479) -> (match dtb_u_u479 with
  | B_dData_dList.C_List_Nil -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u330) dtb_u_u478)) (fun (dtb_u_u480 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u480 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u481; B_dData_dPair.f_Pair_second = dtb_u_u482 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_ORaw ((String.concat "" ["(Obj.repr ("; (Vuna_dTarget_dOcaml_dRender.v_renderTerm dtb_u_u481); "))"]))); B_dData_dPair.f_Pair_second = dtb_u_u482 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> (Base_dDiag.v_icInternal "Eff thunk must have exactly one argument")
)
  | _ -> (Base_dDiag.v_icInternal "Eff thunk must have exactly one argument")
)) else ((Base_dCommon.v_bind ((v_genIrArgs dtb_u_u330) dtb_u_u476)) (fun (dtb_u_u483 : (Vuna_dTarget_dOcaml_dModel.t_OTerm B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u483 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u484; B_dData_dPair.f_Pair_second = dtb_u_u485 } -> (let dtb_u_u486 = (((v_genCtorRef dtb_u_u485) dtb_u_u473) dtb_u_u474) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OCtorApp ((B_dData_dPair.v_firstOf dtb_u_u486), dtb_u_u484)); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u486) })))
  | _ -> failwith "DT: impossible branch"
))))
  | Vuna_dIr_dModel.C_Ir_IrGlobal (dtb_u_u487) -> (let dtb_u_u488 = ((v_genValueRef dtb_u_u330) dtb_u_u487) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OName ((B_dData_dPair.v_firstOf dtb_u_u488))); B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u488) })))
  | Vuna_dIr_dModel.C_Ir_IrVar (dtb_u_u489) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OName ((Vuna_dTarget_dOcaml_dDecl.v_irBinderText dtb_u_u489))); B_dData_dPair.f_Pair_second = dtb_u_u330 }))
  | _ -> failwith "DT: impossible branch"
))
# 2804 "Vuna/Target/Ocaml/Term.vuna"
and v_genIrArgs = (fun (dtb_u_u490 : t_GenSt) (dtb_u_u491 : Vuna_dIr_dModel.t_Ir B_dData_dList.t_List) -> (match dtb_u_u491 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u492, dtb_u_u493) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u490) dtb_u_u492)) (fun (dtb_u_u494 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u494 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u495; B_dData_dPair.f_Pair_second = dtb_u_u496 } -> ((Base_dCommon.v_bind ((v_genIrArgs dtb_u_u496) dtb_u_u493)) (fun (dtb_u_u497 : (Vuna_dTarget_dOcaml_dModel.t_OTerm B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u497 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u498; B_dData_dPair.f_Pair_second = dtb_u_u499 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u495, dtb_u_u498)); B_dData_dPair.f_Pair_second = dtb_u_u499 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u490 }))
  | _ -> failwith "DT: impossible branch"
))
# 2819 "Vuna/Target/Ocaml/Term.vuna"
and v_genAssignedFields = (fun (dtb_u_u500 : t_GenSt) (dtb_u_u501 : string) (dtb_u_u502 : (string, Vuna_dIr_dModel.t_Ir) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u502 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u503, dtb_u_u504) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u500) (B_dData_dPair.v_secondOf dtb_u_u503))) (fun (dtb_u_u505 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u505 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u506; B_dData_dPair.f_Pair_second = dtb_u_u507 } -> ((Base_dCommon.v_bind (((v_genAssignedFields dtb_u_u507) dtb_u_u501) dtb_u_u504)) (fun (dtb_u_u508 : ((string, Vuna_dTarget_dOcaml_dModel.t_OTerm) B_dData_dPair.t_Pair B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u508 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u509; B_dData_dPair.f_Pair_second = dtb_u_u510 } -> (let dtb_u_u511 = ((v_gsDepOfFamily dtb_u_u510) dtb_u_u501) in (let dtb_u_u512 = (((v_recordLabelOf dtb_u_u511) dtb_u_u501) ((Vuna_dTarget_dOcaml_dDecl.v_recordFieldLabel dtb_u_u501) (B_dData_dPair.v_firstOf dtb_u_u503))) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u512; B_dData_dPair.f_Pair_second = dtb_u_u506 }, dtb_u_u509)); B_dData_dPair.f_Pair_second = dtb_u_u511 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u500 }))
  | _ -> failwith "DT: impossible branch"
))
# 2884 "Vuna/Target/Ocaml/Term.vuna"
and v_genArms = (fun (dtb_u_u513 : t_GenSt) (dtb_u_u514 : Vuna_dIr_dModel.t_IrAlt B_dData_dList.t_List) -> (match dtb_u_u514 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u515, dtb_u_u516) -> ((Base_dCommon.v_bind ((v_genArm dtb_u_u513) dtb_u_u515)) (fun (dtb_u_u517 : ((Vuna_dTarget_dOcaml_dModel.t_OPat, Vuna_dTarget_dOcaml_dModel.t_OTerm) B_dData_dPair.t_Pair, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u517 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u518; B_dData_dPair.f_Pair_second = dtb_u_u519 } -> ((Base_dCommon.v_bind ((v_genArms dtb_u_u519) dtb_u_u516)) (fun (dtb_u_u520 : ((Vuna_dTarget_dOcaml_dModel.t_OPat, Vuna_dTarget_dOcaml_dModel.t_OTerm) B_dData_dPair.t_Pair B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u520 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u521; B_dData_dPair.f_Pair_second = dtb_u_u522 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u518, dtb_u_u521)); B_dData_dPair.f_Pair_second = dtb_u_u522 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u513 }))
  | _ -> failwith "DT: impossible branch"
))
# 2898 "Vuna/Target/Ocaml/Term.vuna"
and v_genArm = (fun (dtb_u_u523 : t_GenSt) (dtb_u_u524 : Vuna_dIr_dModel.t_IrAlt) -> (let dtb_u_u525 = ((B_dData_dList.v_filter (fun (dtb_u_u539 : string) -> (dtb_u_u539 <> ""))) ((B_dData_dList.v_map v_nonErasedBinderText) (Vuna_dIr_dModel.v_irAltBindersOf dtb_u_u524))) in ((Base_dCommon.v_bind ((v_genIr dtb_u_u523) (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u524))) (fun (dtb_u_u526 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u526 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u527; B_dData_dPair.f_Pair_second = dtb_u_u528 } -> (let dtb_u_u529 = (Vuna_dIr_dModel.v_irAltCtorOf dtb_u_u524) in (match dtb_u_u529 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u530) -> (match dtb_u_u530 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u531; B_dData_dPair.f_Pair_second = dtb_u_u532 } -> (match ((Vuna_dIr_dModel.v_irSharedRecordFieldsOf dtb_u_u531) ((dtb_u_u528).f_GenSt_gsShared).Vuna_dIr_dModel.f_IrShared_irSharedRecordFields) with
  | B_dData_dList.C_List_Nil -> (let dtb_u_u533 = (((v_genCtorRef dtb_u_u528) dtb_u_u531) dtb_u_u532) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OPat_OPCtorPat ((B_dData_dPair.v_firstOf dtb_u_u533), ((B_dData_dList.v_map (fun dtb_u_u534 -> (Vuna_dTarget_dOcaml_dModel.C_OPat_OPVar (dtb_u_u534)))) dtb_u_u525))); B_dData_dPair.f_Pair_second = dtb_u_u527 }; B_dData_dPair.f_Pair_second = (B_dData_dPair.v_secondOf dtb_u_u533) })))
  | dtb_u_u535 -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OPat_OPRecordPat (((((v_recordPatFields dtb_u_u528) dtb_u_u531) dtb_u_u535) dtb_u_u525))); B_dData_dPair.f_Pair_second = dtb_u_u527 }; B_dData_dPair.f_Pair_second = ((v_gsDepOfFamily dtb_u_u528) dtb_u_u531) }))
)
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Nothing -> (let dtb_u_u536 = (match dtb_u_u525 with
  | B_dData_dList.C_List_Nil -> Vuna_dTarget_dOcaml_dModel.C_OPat_OPWild
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u537, dtb_u_u538) -> (Vuna_dTarget_dOcaml_dModel.C_OPat_OPVar (dtb_u_u537))
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = { B_dData_dPair.f_Pair_first = dtb_u_u536; B_dData_dPair.f_Pair_second = dtb_u_u527 }; B_dData_dPair.f_Pair_second = dtb_u_u528 })))
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))))
# 2936 "Vuna/Target/Ocaml/Term.vuna"
and v_genNatBranches = (fun (dtb_u_u540 : t_GenSt) (dtb_u_u541 : int) (dtb_u_u542 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (dtb_u_u543 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (dtb_u_u544 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) -> (let dtb_u_u545 = ("dtnat__" ^ (string_of_int dtb_u_u541)) in (let dtb_u_u546 = (String.concat "" ["("; dtb_u_u545; " - 1)"]) in (let dtb_u_u547 = (Vuna_dTarget_dOcaml_dModel.C_OTerm_ORaw ("(failwith \"DT: impossible branch\")")) in ((Base_dCommon.v_bind (((v_genNatAlt dtb_u_u540) dtb_u_u542) B_dData_dMaybe.C_Maybe_Nothing)) (fun (dtb_u_u548 : (Vuna_dTarget_dOcaml_dModel.t_OTerm B_dData_dMaybe.t_Maybe, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u548 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u549; B_dData_dPair.f_Pair_second = dtb_u_u550 } -> ((Base_dCommon.v_bind (((v_genNatAlt dtb_u_u550) dtb_u_u543) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u546)))) (fun (dtb_u_u551 : (Vuna_dTarget_dOcaml_dModel.t_OTerm B_dData_dMaybe.t_Maybe, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u551 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u552; B_dData_dPair.f_Pair_second = dtb_u_u553 } -> ((Base_dCommon.v_bind (((v_genNatAlt dtb_u_u553) dtb_u_u544) (B_dData_dMaybe.C_Maybe_Just (dtb_u_u545)))) (fun (dtb_u_u554 : (Vuna_dTarget_dOcaml_dModel.t_OTerm B_dData_dMaybe.t_Maybe, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u554 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u555; B_dData_dPair.f_Pair_second = dtb_u_u556 } -> (let dtb_u_u557 = (match dtb_u_u542 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u561) -> ((v_termOrImpossible dtb_u_u549) dtb_u_u547)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u544 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u562) -> ((v_termOrImpossible dtb_u_u555) dtb_u_u547)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u547
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in (let dtb_u_u558 = (match dtb_u_u543 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u559) -> ((v_termOrImpossible dtb_u_u552) dtb_u_u547)
  | B_dData_dMaybe.C_Maybe_Nothing -> (match dtb_u_u544 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u560) -> ((v_termOrImpossible dtb_u_u555) dtb_u_u547)
  | B_dData_dMaybe.C_Maybe_Nothing -> dtb_u_u547
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_OTerm_OIf ((Vuna_dTarget_dOcaml_dModel.C_OTerm_ORaw ((String.concat "" ["("; dtb_u_u545; " = 0)"]))), dtb_u_u557, dtb_u_u558)); B_dData_dPair.f_Pair_second = dtb_u_u556 }))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
# 2978 "Vuna/Target/Ocaml/Term.vuna"
and v_genNatAlt = (fun (dtb_u_u563 : t_GenSt) (dtb_u_u564 : Vuna_dIr_dModel.t_IrAlt B_dData_dMaybe.t_Maybe) (dtb_u_u565 : string B_dData_dMaybe.t_Maybe) -> (match dtb_u_u564 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u566) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u563) (Vuna_dIr_dModel.v_irAltBodyOf dtb_u_u566))) (fun (dtb_u_u567 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u567 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u568; B_dData_dPair.f_Pair_second = dtb_u_u569 } -> (match ((B_dData_dList.v_filter (fun (dtb_u_u570 : string) -> (dtb_u_u570 <> ""))) ((B_dData_dList.v_map v_nonErasedBinderText) (Vuna_dIr_dModel.v_irAltBindersOf dtb_u_u566))) with
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just (dtb_u_u568)); B_dData_dPair.f_Pair_second = dtb_u_u569 }))
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u571, dtb_u_u572) -> (match dtb_u_u572 with
  | B_dData_dList.C_List_Nil -> (match dtb_u_u565 with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u573) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dMaybe.C_Maybe_Just ((Vuna_dTarget_dOcaml_dModel.C_OTerm_OLet ((Vuna_dTarget_dOcaml_dModel.C_OPat_OPVar (dtb_u_u571)), (Vuna_dTarget_dOcaml_dModel.C_OTerm_ORaw (dtb_u_u573)), dtb_u_u568)))); B_dData_dPair.f_Pair_second = dtb_u_u569 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "Nat case arm has a binder but no runtime binding")
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dDiag.v_icInternal "Nat case arm has more than one runtime binder")
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dMaybe.C_Maybe_Nothing; B_dData_dPair.f_Pair_second = dtb_u_u563 }))
  | _ -> failwith "DT: impossible branch"
))

# 3054 "Vuna/Target/Ocaml/Term.vuna"
let rec v_anyDefMentions = (fun (dtb_u_u574 : string B_dData_dList.t_List) (dtb_u_u575 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match dtb_u_u575 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u576, dtb_u_u577) -> (match (Vuna_dIr_dModel.v_irDefBody dtb_u_u576) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ((v_anyDefMentions dtb_u_u574) dtb_u_u577)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u578) -> (if ((B_dData_dList.v_anyMem (Vuna_dIr_dAnalysis.v_irGlobalsOf dtb_u_u578)) dtb_u_u574) then true else ((v_anyDefMentions dtb_u_u574) dtb_u_u577))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dList.C_List_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

# 3045 "Vuna/Target/Ocaml/Term.vuna"
let v_groupReallyRec = (fun (dtb_u_u579 : Vuna_dIr_dModel.t_IrGroup) -> (if (Vuna_dIr_dModel.v_irGroupIsRec dtb_u_u579) then (let dtb_u_u580 = ((B_dData_dList.v_map Vuna_dIr_dModel.v_irDefName) (dtb_u_u579).Vuna_dIr_dModel.f_IrGroup_irGroupDefs) in ((v_anyDefMentions dtb_u_u580) (dtb_u_u579).Vuna_dIr_dModel.f_IrGroup_irGroupDefs)) else false))

# 3064 "Vuna/Target/Ocaml/Term.vuna"
let v_bindKeywordOf = (fun (dtb_u_u581 : Vuna_dIr_dModel.t_IrGroup) (dtb_u_u582 : Vuna_dIr_dModel.t_IrDef) -> (if (v_groupReallyRec dtb_u_u581) then (if (Vuna_dIr_dTail.v_tmcCandidate dtb_u_u582) then "let[@tail_mod_cons] rec " else "let rec ") else "let "))

# 3078 "Vuna/Target/Ocaml/Term.vuna"
let v_lineDirectiveOf = (fun (dtb_u_u583 : t_GenSt) (dtb_u_u584 : Vuna_dIr_dModel.t_IrDef) -> (match (Vuna_dIr_dModel.v_irDefSpan dtb_u_u584) with
  | B_dData_dMaybe.C_Maybe_Nothing -> ""
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u585) -> (let dtb_u_u586 = ((dtb_u_u583).f_GenSt_gsNormPath (dtb_u_u585).Base_dSource.f_Span_spanFile) in (if (dtb_u_u586 = "") then "" else (String.concat "" ["# "; (string_of_int (Base_dSource.v_spanStartLine dtb_u_u585)); " "; (Vuna_dTarget_dOcaml_dDecl.v_ocamlString dtb_u_u586); "\n"])))
  | _ -> failwith "DT: impossible branch"
))

# 3101 "Vuna/Target/Ocaml/Term.vuna"
let v_genDef = (fun (dtb_u_u587 : t_GenSt) (dtb_u_u588 : Vuna_dIr_dModel.t_IrDef) -> (let dtb_u_u589 = (Vuna_dIr_dModel.v_irDefExtern dtb_u_u588) in (match dtb_u_u589 with
  | B_dData_dMaybe.C_Maybe_Nothing -> (match (Vuna_dIr_dModel.v_irDefBody dtb_u_u588) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_ErrC ((((Base_dDiag.v_withContext (Vuna_dIr_dModel.v_irDefSpan dtb_u_u588)) (Vuna_dIr_dModel.v_irDefName dtb_u_u588)) (((((Base_dDiag.v_diagNoLoc Base_dDiag.C_Severity_SevError) Base_dDiag.C_Phase_PhInternal) Base_dDiag.C_Category_CatInternal) "IC_AxiomRuntime") "axiom reached runtime code generation (partition must erase it)"))))
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u590) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u587) dtb_u_u590)) (fun (dtb_u_u591 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u591 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u592; B_dData_dPair.f_Pair_second = dtb_u_u593 } -> (let dtb_u_u594 = (if (Vuna_dIr_dModel.v_irDefInitGuard dtb_u_u588) then (Vuna_dTarget_dOcaml_dModel.C_OTerm_ORaw ((String.concat "" ["(try "; (Vuna_dTarget_dOcaml_dRender.v_renderTerm dtb_u_u592); " with e -> dt_report_exn e (dt_get_raw_backtrace ()); exit 2)"]))) else dtb_u_u592) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_ODef_ODValue ((Vuna_dTarget_dOcaml_dDecl.v_valueName (Vuna_dIr_dModel.v_irDefName dtb_u_u588)), dtb_u_u594)); B_dData_dPair.f_Pair_second = dtb_u_u593 })))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u595) -> (match dtb_u_u595 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u596; B_dData_dPair.f_Pair_second = dtb_u_u597 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (Vuna_dTarget_dOcaml_dModel.C_ODef_ODExternal ((Vuna_dTarget_dOcaml_dDecl.v_valueName (Vuna_dIr_dModel.v_irDefName dtb_u_u588)), ((Vuna_dTarget_dOcaml_dDecl.v_irTyText (dtb_u_u587).f_GenSt_gsQual) dtb_u_u596), dtb_u_u597)); B_dData_dPair.f_Pair_second = dtb_u_u587 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

# 3087 "Vuna/Target/Ocaml/Term.vuna"
let rec v_genGroupDefs = (fun (dtb_u_u598 : t_GenSt) (dtb_u_u599 : Vuna_dIr_dModel.t_IrDef B_dData_dList.t_List) -> (match dtb_u_u599 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u600, dtb_u_u601) -> ((Base_dCommon.v_bind ((v_genDef dtb_u_u598) dtb_u_u600)) (fun (dtb_u_u602 : (Vuna_dTarget_dOcaml_dModel.t_ODef, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u602 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u603; B_dData_dPair.f_Pair_second = dtb_u_u604 } -> ((Base_dCommon.v_bind ((v_genGroupDefs dtb_u_u604) dtb_u_u601)) (fun (dtb_u_u605 : ((Vuna_dIr_dModel.t_IrDef, Vuna_dTarget_dOcaml_dModel.t_ODef) B_dData_dPair.t_Pair B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u605 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u606; B_dData_dPair.f_Pair_second = dtb_u_u607 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ ({ B_dData_dPair.f_Pair_first = dtb_u_u600; B_dData_dPair.f_Pair_second = dtb_u_u603 }, dtb_u_u606)); B_dData_dPair.f_Pair_second = dtb_u_u607 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u598 }))
  | _ -> failwith "DT: impossible branch"
))

# 3121 "Vuna/Target/Ocaml/Term.vuna"
let v_renderDefOf = (fun (dtb_u_u608 : Vuna_dTarget_dOcaml_dModel.t_ODef) -> (match dtb_u_u608 with
  | Vuna_dTarget_dOcaml_dModel.C_ODef_ODExternal (dtb_u_u609, dtb_u_u610, dtb_u_u611) -> (String.concat "" ["external "; dtb_u_u609; " : "; dtb_u_u610; " = "; (Vuna_dTarget_dOcaml_dDecl.v_ocamlString dtb_u_u611)])
  | Vuna_dTarget_dOcaml_dModel.C_ODef_ODValue (dtb_u_u612, dtb_u_u613) -> (String.concat "" [dtb_u_u612; " = "; (Vuna_dTarget_dOcaml_dRender.v_renderTerm dtb_u_u613)])
  | _ -> failwith "DT: impossible branch"
))

# 3036 "Vuna/Target/Ocaml/Term.vuna"
let v_bindFirstOf = (fun (dtb_u_u614 : t_GenSt) (dtb_u_u615 : Vuna_dIr_dModel.t_IrGroup) (dtb_u_u616 : (Vuna_dIr_dModel.t_IrDef, Vuna_dTarget_dOcaml_dModel.t_ODef) B_dData_dPair.t_Pair) -> (match dtb_u_u616 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u617; B_dData_dPair.f_Pair_second = dtb_u_u618 } -> (String.concat "" [((v_lineDirectiveOf dtb_u_u614) dtb_u_u617); ((v_bindKeywordOf dtb_u_u615) dtb_u_u617); (v_renderDefOf dtb_u_u618)])
  | _ -> failwith "DT: impossible branch"
))

# 3039 "Vuna/Target/Ocaml/Term.vuna"
let v_bindAndOf = (fun (dtb_u_u619 : t_GenSt) (dtb_u_u620 : (Vuna_dIr_dModel.t_IrDef, Vuna_dTarget_dOcaml_dModel.t_ODef) B_dData_dPair.t_Pair) -> (match dtb_u_u620 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u621; B_dData_dPair.f_Pair_second = dtb_u_u622 } -> (String.concat "" [((v_lineDirectiveOf dtb_u_u619) dtb_u_u621); "and "; (v_renderDefOf dtb_u_u622)])
  | _ -> failwith "DT: impossible branch"
))

# 3031 "Vuna/Target/Ocaml/Term.vuna"
let v_bindGroupOf = (fun (dtb_u_u623 : t_GenSt) (dtb_u_u624 : Vuna_dIr_dModel.t_IrGroup) (dtb_u_u625 : (Vuna_dIr_dModel.t_IrDef, Vuna_dTarget_dOcaml_dModel.t_ODef) B_dData_dPair.t_Pair B_dData_dList.t_List) -> (match dtb_u_u625 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u626, dtb_u_u627) -> ((Vuna_dTarget_dOcaml_dRender.v_joinWith "\n") (B_dData_dList.C_List__x58__x58_ ((((v_bindFirstOf dtb_u_u623) dtb_u_u624) dtb_u_u626), ((B_dData_dList.v_map (v_bindAndOf dtb_u_u623)) dtb_u_u627))))
  | B_dData_dList.C_List_Nil -> ""
  | _ -> failwith "DT: impossible branch"
))

# 3014 "Vuna/Target/Ocaml/Term.vuna"
let v_genGroup = (fun (dtb_u_u628 : t_GenSt) (dtb_u_u629 : Vuna_dIr_dModel.t_IrGroup) -> ((Base_dCommon.v_bind ((v_genGroupDefs dtb_u_u628) (Vuna_dIr_dModel.v_irGroupDefs dtb_u_u629))) (fun (dtb_u_u630 : ((Vuna_dIr_dModel.t_IrDef, Vuna_dTarget_dOcaml_dModel.t_ODef) B_dData_dPair.t_Pair B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u630 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u631; B_dData_dPair.f_Pair_second = dtb_u_u632 } -> (let dtb_u_u633 = (Vuna_dIr_dModel.v_irGroupDefs dtb_u_u629) in (match dtb_u_u633 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u634, dtb_u_u635) -> (match dtb_u_u635 with
  | B_dData_dList.C_List_Nil -> (match (Vuna_dIr_dModel.v_irDefExtern dtb_u_u634) with
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u636) -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = ((Vuna_dTarget_dOcaml_dRender.v_joinWith "\n") ((B_dData_dList.v_map (fun (dtb_u_u637 : (Vuna_dIr_dModel.t_IrDef, Vuna_dTarget_dOcaml_dModel.t_ODef) B_dData_dPair.t_Pair) -> (v_renderDefOf (B_dData_dPair.v_secondOf dtb_u_u637)))) dtb_u_u631)); B_dData_dPair.f_Pair_second = dtb_u_u632 }))
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_bindGroupOf dtb_u_u632) dtb_u_u629) dtb_u_u631); B_dData_dPair.f_Pair_second = dtb_u_u632 }))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_bindGroupOf dtb_u_u632) dtb_u_u629) dtb_u_u631); B_dData_dPair.f_Pair_second = dtb_u_u632 }))
)
  | _ -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_bindGroupOf dtb_u_u632) dtb_u_u629) dtb_u_u631); B_dData_dPair.f_Pair_second = dtb_u_u632 }))
))
  | _ -> failwith "DT: impossible branch"
))))

# 3000 "Vuna/Target/Ocaml/Term.vuna"
let rec v_genGroups = (fun (dtb_u_u638 : t_GenSt) (dtb_u_u639 : Vuna_dIr_dModel.t_IrGroup B_dData_dList.t_List) -> (match dtb_u_u639 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u640, dtb_u_u641) -> ((Base_dCommon.v_bind ((v_genGroup dtb_u_u638) dtb_u_u640)) (fun (dtb_u_u642 : (string, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u642 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u643; B_dData_dPair.f_Pair_second = dtb_u_u644 } -> ((Base_dCommon.v_bind ((v_genGroups dtb_u_u644) dtb_u_u641)) (fun (dtb_u_u645 : (string B_dData_dList.t_List, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u645 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u646; B_dData_dPair.f_Pair_second = dtb_u_u647 } -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (B_dData_dList.C_List__x58__x58_ (dtb_u_u643, dtb_u_u646)); B_dData_dPair.f_Pair_second = dtb_u_u647 }))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | B_dData_dList.C_List_Nil -> (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = B_dData_dList.C_List_Nil; B_dData_dPair.f_Pair_second = dtb_u_u638 }))
  | _ -> failwith "DT: impossible branch"
))

# 3161 "Vuna/Target/Ocaml/Term.vuna"
let rec v_foldHandlers = (fun (dtb_u_u648 : t_GenSt) (dtb_u_u649 : string) (dtb_u_u650 : string B_dData_dList.t_List) -> (match dtb_u_u650 with
  | B_dData_dList.C_List__x58__x58_ (dtb_u_u651, dtb_u_u652) -> (let dtb_u_u653 = ((v_genValueRef dtb_u_u648) dtb_u_u651) in (((v_foldHandlers (B_dData_dPair.v_secondOf dtb_u_u653)) (String.concat "" ["("; (B_dData_dPair.v_firstOf dtb_u_u653); " "; dtb_u_u649; ")"])) dtb_u_u652))
  | B_dData_dList.C_List_Nil -> { B_dData_dPair.f_Pair_first = dtb_u_u649; B_dData_dPair.f_Pair_second = dtb_u_u648 }
  | _ -> failwith "DT: impossible branch"
))

# 3168 "Vuna/Target/Ocaml/Term.vuna"
let v_hookText = (fun (dtb_u_u654 : string) (dtb_u_u655 : string) (dtb_u_u656 : bool) -> (let dtb_u_u657 = (if dtb_u_u656 then (String.concat "" ["print_endline ("; dtb_u_u654; " ("; dtb_u_u655; "))"]) else (String.concat "" ["ignore ("; dtb_u_u655; ")"])) in (String.concat "" ["\nlet () =\n  dt_record_backtrace true;\n  try "; dtb_u_u657; "\n  with e -> dt_report_exn e (dt_get_raw_backtrace ()); exit 2\n"])))

# 3133 "Vuna/Target/Ocaml/Term.vuna"
let v_genEntryHook = (fun (dtb_u_u658 : t_GenSt) (dtb_u_u659 : Vuna_dIr_dModel.t_IrEntry) (dtb_u_u660 : bool) -> ((Base_dCommon.v_bind ((v_genIr dtb_u_u658) (Vuna_dIr_dModel.v_irEntryShowOf dtb_u_u659))) (fun (dtb_u_u661 : (Vuna_dTarget_dOcaml_dModel.t_OTerm, t_GenSt) B_dData_dPair.t_Pair) -> (match dtb_u_u661 with
  | { B_dData_dPair.f_Pair_first = dtb_u_u662; B_dData_dPair.f_Pair_second = dtb_u_u663 } -> (if (Vuna_dIr_dModel.v_irEntryIsActionOf dtb_u_u659) then (match (Vuna_dIr_dModel.v_irEntryRunMainOf dtb_u_u659) with
  | B_dData_dMaybe.C_Maybe_Nothing -> (Base_dDiag.v_icInternal "action entry has no runMain")
  | B_dData_dMaybe.C_Maybe_Just (dtb_u_u664) -> (let dtb_u_u665 = ((v_genValueRef dtb_u_u663) (Vuna_dIr_dModel.v_irEntryMainOf dtb_u_u659)) in (let dtb_u_u666 = (B_dData_dPair.v_secondOf dtb_u_u665) in (let dtb_u_u667 = ((v_genValueRef dtb_u_u666) dtb_u_u664) in (let dtb_u_u668 = (B_dData_dPair.v_secondOf dtb_u_u667) in (match (((v_foldHandlers dtb_u_u668) (B_dData_dPair.v_firstOf dtb_u_u665)) (Vuna_dIr_dModel.v_irEntryHandlersOf dtb_u_u659)) with
  | { B_dData_dPair.f_Pair_first = dtb_u_u669; B_dData_dPair.f_Pair_second = dtb_u_u670 } -> (let dtb_u_u671 = (String.concat "" ["dtp_sched_main (fun () -> "; (B_dData_dPair.v_firstOf dtb_u_u667); " "; dtb_u_u669; ")"]) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_hookText (Vuna_dTarget_dOcaml_dRender.v_renderTerm dtb_u_u662)) dtb_u_u671) dtb_u_u660); B_dData_dPair.f_Pair_second = (dtb_u_u670).f_GenSt_gsDeps })))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
) else (let dtb_u_u672 = ((v_genValueRef dtb_u_u663) (Vuna_dIr_dModel.v_irEntryMainOf dtb_u_u659)) in (Base_dDiag.C_Check_OkC ({ B_dData_dPair.f_Pair_first = (((v_hookText (Vuna_dTarget_dOcaml_dRender.v_renderTerm dtb_u_u662)) (B_dData_dPair.v_firstOf dtb_u_u672)) dtb_u_u660); B_dData_dPair.f_Pair_second = ((B_dData_dPair.v_secondOf dtb_u_u672)).f_GenSt_gsDeps }))))
  | _ -> failwith "DT: impossible branch"
))))

# 2445 "Vuna/Target/Ocaml/Term.vuna"
let v_gsShared = (fun (dtb_u_u673 : t_GenSt) -> (match dtb_u_u673 with
  | { f_GenSt_gsShared = dtb_u_u674; f_GenSt_gsQual = dtb_u_u675; f_GenSt_gsDeps = dtb_u_u676; f_GenSt_gsNormPath = dtb_u_u677 } -> dtb_u_u674
  | _ -> failwith "DT: impossible branch"
))

# 2446 "Vuna/Target/Ocaml/Term.vuna"
let v_gsQual = (fun (dtb_u_u678 : t_GenSt) -> (match dtb_u_u678 with
  | { f_GenSt_gsShared = dtb_u_u679; f_GenSt_gsQual = dtb_u_u680; f_GenSt_gsDeps = dtb_u_u681; f_GenSt_gsNormPath = dtb_u_u682 } -> dtb_u_u680
  | _ -> failwith "DT: impossible branch"
))

# 2447 "Vuna/Target/Ocaml/Term.vuna"
let v_gsDeps = (fun (dtb_u_u683 : t_GenSt) -> (match dtb_u_u683 with
  | { f_GenSt_gsShared = dtb_u_u684; f_GenSt_gsQual = dtb_u_u685; f_GenSt_gsDeps = dtb_u_u686; f_GenSt_gsNormPath = dtb_u_u687 } -> dtb_u_u686
  | _ -> failwith "DT: impossible branch"
))

# 2448 "Vuna/Target/Ocaml/Term.vuna"
let v_gsNormPath = (fun dtb_u_u688 -> (match dtb_u_u688 with
  | { f_GenSt_gsShared = dtb_u_u689; f_GenSt_gsQual = dtb_u_u690; f_GenSt_gsDeps = dtb_u_u691; f_GenSt_gsNormPath = dtb_u_u692 } -> dtb_u_u692
  | _ -> failwith "DT: impossible branch"
))
