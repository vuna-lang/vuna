open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dTerm_dGenSt = C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt of (string Base_dList.t_Base_dList_dList) * ((string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * ((string, bool Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int) * (Vuna_dCompiler_dCodegen_dDecl.t_Vuna_dCompiler_dCodegen_dDecl_dQualCtx) * (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dCodegen_dTerm_dAltEnv = C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv of ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dCodegen_dTerm_dGenSt)
and t_Vuna_dCompiler_dCodegen_dTerm_dLamChain = C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain of ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)

let v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime = (String.concat "" ["let dtp_print s = print_string s; flush stdout; String.length s\n"; "let dtp_readFile path =\n  try\n    let ch = open_in_bin path in\n    Fun.protect ~finally:(fun () -> close_in_noerr ch)\n      (fun () -> really_input_string ch (in_channel_length ch))\n  with Sys_error msg -> failwith (\"readFile: \" ^ msg)\n"; "let dtp_writeFile path contents =\n  try\n    let ch = open_out_bin path in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch)\n      (fun () -> output_string ch contents);\n    String.length contents\n  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)\n"; "let dtp_writeFileAtomic path contents =\n  let tmp = path ^ \".\" ^ string_of_int (Unix.getpid ()) ^ \".tmp\" in\n  let write () =\n    let ch = open_out_bin tmp in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch) (fun () -> output_string ch contents) in\n  (try write (); Sys.rename tmp path; String.length contents\n   with e -> (try Sys.remove tmp with _ -> ()); raise e)\n"; "let dtp_getArgs () =\n  let argv = Sys.argv in\n  let n = Array.length argv in\n  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))\n"; "let dtp_readLine () = try input_line stdin with End_of_file -> \"\"\n"; "let dtp_readBytes n =\n  if n <= 0 then \"\"\n  else\n    let b = Bytes.create n in\n    let k = try input stdin b 0 n with _ -> 0 in\n    if k <= 0 then \"\" else Bytes.sub_string b 0 k\n"; "let dtp_readDir path =\n  try List.sort compare (Array.to_list (Sys.readdir path))\n  with Sys_error msg -> failwith (\"readDir: \" ^ msg)\n"; "let dtp_isDirectory path =\n  try Sys.is_directory path with Sys_error msg -> failwith (\"isDirectory: \" ^ msg)\n"; "let dtp_makeDir path =\n  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))\n  with Sys_error msg -> failwith (\"makeDir: \" ^ msg)\n"; "let dtp_removeFile path =\n  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)\n  with Sys_error msg -> failwith (\"removeFile: \" ^ msg)\n"; "let dtp_fileExists path = Sys.file_exists path\n"; "let dtp_fileMtime path =\n  try int_of_float (Unix.stat path).Unix.st_mtime with _ -> 0\n"; "let dtp_fileSize path =\n  try (Unix.stat path).Unix.st_size with _ -> 0\n"; "let dtp_timeUs () = int_of_float (Unix.gettimeofday () *. 1000000.0)\n"; "let dtp_getenv k = try Sys.getenv k with Not_found -> \"\"\n"; "let dtp_getcwd () = try Sys.getcwd () with _ -> \".\"\n"; "let dtp_execPath () = try Unix.readlink \"/proc/self/exe\" with _ -> Sys.executable_name\n"; "let dtp_arraySet (a : 'a array) (i : int) (v : 'a) =\n  let b = Array.copy a in\n  Array.set b i v; b\n"; "let dtp_strHash (s : string) =\n  let h = ref 0 in\n  String.iter (fun c -> h := ((!h * 33) + Char.code c) land 1023) s;\n  !h\n"; "let dtp_strAt (s : string) (i : int) = if i < 0 || i >= String.length s then -1 else Char.code s.[i]\n"; "let dtp_substring start len s =\n  let n = String.length s in\n  let st = if start < 0 then 0 else if start > n then n else start in\n  let ln = if len < 0 then 0 else if st + len > n then n - st else len in\n  String.sub s st ln\n"; "let dtp_marshal (v : 'a) : string = Marshal.to_string v []\n"; "let dtp_unmarshal (s : string) : 'a = Marshal.from_string s 0\n"; "let dtp_exit n = exit n\n"; "let dtp_runIn dir args =\n  let quote s = Filename.quote s in\n  let cmd = String.concat \" \" (List.map quote args) in\n  let old = Sys.getcwd () in\n  Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)\n"; "let dtp_spawn (args : string list) : int =\n  let prog = Sys.executable_name in\n  Unix.create_process prog (Array.of_list (prog :: args)) Unix.stdin Unix.stdout Unix.stderr\n"; "let dtp_wait (pid : int) : int =\n  let (_, st) = Unix.waitpid [] pid in\n  match st with Unix.WEXITED c -> c | _ -> 1\n"])

let v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime = (String.concat "" ["let () =\n"; "  let c = Gc.get () in\n"; "  Gc.set { c with minor_heap_size = 16 * 1024 * 1024; space_overhead = 200 }\n"; "let () =\n"; "  if (try Sys.getenv \"VN_PERF_STATS\" with Not_found -> \"\") <> \"\" then\n"; "    at_exit (fun () ->\n"; "      let s = Gc.quick_stat () in\n"; "      Printf.eprintf \"VN_PERF minor_words=%.0f major_words=%.0f minor_collections=%d major_collections=%d top_heap_words=%d\\n\"\n"; "        s.Gc.minor_words s.Gc.major_words s.Gc.minor_collections s.Gc.major_collections s.Gc.top_heap_words)\n"; "let bi_add a b = a + b\n"; "let bi_sub a b = a - b\n"; "let bi_mul a b = a * b\n"; "let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\n"; "let bi_eq_int (a : int) (b : int) = a = b\n"; "let bi_neq_int (a : int) (b : int) = a <> b\n"; "let bi_eq_str (a : string) (b : string) = a = b\n"; "let bi_neq_str (a : string) (b : string) = a <> b\n"; "let bi_strFromInt (n : int) = string_of_int n\n"; "let bi_strLength (s : string) = String.length s\n"; "let bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])\n"; "let bi_strPack (cs : int list) =\n  let a = Array.of_list cs in\n  String.init (Array.length a) (fun i -> Char.chr a.(i))\n"; "let bi_lt_int (a : int) (b : int) = a < b\n"; "let bi_le_int (a : int) (b : int) = a <= b\n"; "let bi_gt_int (a : int) (b : int) = a > b\n"; "let bi_ge_int (a : int) (b : int) = a >= b\n"; "let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0\n"; "let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0\n"; "let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0\n"; "let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0\n"; "let bi_concat a b = a ^ b\n"; "let bi_and a b = a && b\n"; "let bi_or a b = a || b\n"; "let bi_natSucc (n : int) = if n >= max_int then max_int else n + 1\n"; "let bi_natAdd (a : int) (b : int) = if a > max_int - b then max_int else a + b\n"; "let bi_natSub (a : int) (b : int) = if a <= b then 0 else a - b\n"; "let bi_natMul (a : int) (b : int) =\n  if a <= 0 || b <= 0 then 0 else if a > max_int / b then max_int else a * b\n"; "let bi_natDiv (a : int) (b : int) = if b = 0 then failwith \"division by zero\" else a / b\n"; "let bi_natToInt (n : int) = n\n"; "let bi_natFromInt (n : int) = if n <= 0 then 0 else n\n"; "let dt_show_bool b = if b then \"True\" else \"False\"\n"; "let dt_show_string s =\n"; "  let buf = Buffer.create 16 in\n"; "  Buffer.add_char buf (Char.chr 34);\n"; "  String.iter (fun c ->\n"; "    let n = Char.code c in\n"; "    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))\n"; "    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))\n"; "    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"n\")\n"; "    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"t\")\n"; "    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"r\")\n"; "    else Buffer.add_char buf c) s;\n"; "  Buffer.add_char buf (Char.chr 34);\n"; "  Buffer.contents buf\n"; v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime])

let v_Vuna_dCompiler_dCodegen_dTerm_ddtReporterRuntime = (String.concat "" ["let rec dt_frame_key parts =\n"; "  match parts with\n"; "  | [] -> None\n"; "  | part :: rest -> if part = \"(fun)\" then dt_frame_key rest else Some part\n"; "let dt_frame_label slot =\n"; "  match Printexc.Slot.name slot with\n"; "  | None -> None\n"; "  | Some nm ->\n"; "    match dt_frame_key (List.rev (String.split_on_char '.' nm)) with\n"; "    | None -> None\n"; "    | Some key ->\n"; "      (match List.assoc_opt key dt_def_locs with\n"; "       | Some (display, loc) -> Some (display ^ \" (\" ^ loc ^ \")\")\n"; "       | None -> None)\n"; "let dt_report_exn e bt =\n"; "  let msg = match e with Failure m -> m | _ -> Printexc.to_string e in\n"; "  Printf.eprintf \"vuna: runtime error: %s\\n%!\" msg;\n"; "  match Printexc.backtrace_slots bt with\n"; "  | None -> ()\n"; "  | Some slots ->\n"; "    let rec go rest shown =\n"; "      if shown >= 12 then ()\n"; "      else match rest with\n"; "      | [] -> ()\n"; "      | slot :: tl ->\n"; "        (match dt_frame_label slot with\n"; "         | Some s -> Printf.eprintf \"  at %s\\n%!\" s; go tl (shown + 1)\n"; "         | None -> go tl shown)\n"; "    in go (Array.to_list slots) 0\n"])

let v_Vuna_dCompiler_dCodegen_dTerm_ddtDefLocRow = (fun norm d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0) -> (String.concat "" ["  ("; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))); ", ("; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)); ", "; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString (String.concat "" [(norm (match dtb__0 with
  | Vuna_dCompiler_dCommon.C_Vuna_dCompiler_dCommon_dSpan_Vuna_dCompiler_dCommon_dSpan (dtb__1, dtb__2, dtb__3, dtb__4, dtb__5) -> dtb__1
  | _ -> failwith "DT: impossible branch"
)); ":"; (bi_strFromInt (Vuna_dCompiler_dCommon.v_Vuna_dCompiler_dCommon_dspanStartLine dtb__0))])); "));\n"])
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtDefLocTable = (fun norm defs -> (Base_dList.dtp_concatMany ((Base_dList.v_Base_dList_dmap (v_Vuna_dCompiler_dCodegen_dTerm_ddtDefLocRow norm)) defs)))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntimeWith = (fun locs -> (String.concat "" [v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime; (if (locs = "") then "let dt_def_locs = []\n" else (String.concat "" ["let dt_def_locs = [\n"; locs; "]\n"])); v_Vuna_dCompiler_dCodegen_dTerm_ddtReporterRuntime]))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__6, dtb__7) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__6) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6)) else ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor dtb__7) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__8, dtb__9) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__8) = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__8)) else (v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData dtb__9))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge = (fun datas -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__10) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__10)) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistNilCtor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__11) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__10)) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistConsCtor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__12) -> ((fun famName -> ((fun nilMl -> ((fun consMl -> (String.concat "" ["\nlet dtp_unpack (s : string) =\n"; "  let cs = List.init (String.length s) (fun i -> Char.code s.[i]) in\n"; "  List.fold_right (fun x acc -> "; consMl; " (x, acc)) cs "; nilMl; "\n"; "let dtp_pack xs =\n"; "  let rec to_list xs = match xs with "; nilMl; " -> [] | "; consMl; " (x, rest) -> x :: to_list rest in\n"; "  let cs = Array.of_list (to_list xs) in\n"; "  String.init (Array.length cs) (fun i -> Char.chr cs.(i))\n"; "\nlet dtp_listOf xs = List.fold_right (fun x acc -> "; consMl; " (x, acc)) xs "; nilMl; "\n"; "let dtp_ocamlOf xs =\n"; "  let rec go l = match l with "; nilMl; " -> [] | "; consMl; " (x, rest) -> x :: go rest in\n"; "  go xs\n"; "\nlet dtp_concatMany xs = String.concat \"\" (dtp_ocamlOf xs)\n"; "\nlet dtp_substTemplate tmpl xs =\n"; "  let args = Array.of_list (dtp_ocamlOf xs) in\n"; "  let n = String.length tmpl and na = Array.length args in\n"; "  let buf = Buffer.create (n + 32) in\n"; "  let rec go i =\n"; "    if i >= n then ()\n"; "    else if tmpl.[i] = '<' then begin\n"; "      let j = ref (i + 1) and k = ref 0 in\n"; "      while !j < n && tmpl.[!j] >= '0' && tmpl.[!j] <= '9' do\n"; "        k := !k * 10 + (Char.code tmpl.[!j] - 48); incr j\n"; "      done;\n"; "      if !j < n && tmpl.[!j] = '>' && !j > i + 1 then begin\n"; "        (if !k < na then Buffer.add_string buf args.(!k)\n"; "         else Buffer.add_string buf (String.sub tmpl i (!j - i + 1)));\n"; "        go (!j + 1)\n"; "      end else (Buffer.add_char buf '<'; go (i + 1))\n"; "    end else (Buffer.add_char buf tmpl.[i]; go (i + 1))\n"; "  in go 0; Buffer.contents buf\n"])) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName famName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__12)))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName famName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__11)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__10))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dioAlgebraIntrinsicText = (fun name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimPureIOName) then "(fun x -> fun (_ : int) -> x)" else (if (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimBindIOName) then true else (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dprimBindIO1Name)) then "(fun io k -> fun (w : int) -> k (io w) w)" else "(fun io -> io 0)")))

let v_Vuna_dCompiler_dCodegen_dTerm_dioAlgebraText = (fun st name -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dTerm_dioAlgebraIntrinsicText name), st)))))

let v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames = (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtio_0", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtio_1", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtio_2", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtio_3", Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames = (fun n names -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (match names with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__13, dtb__14) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__13, ((v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames (n - 1)) dtb__14)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dioPrimThunkText = (fun rt arity -> ((fun argText -> (if (arity = 0) then (String.concat "" ["(fun (_ : int) -> "; rt; ")"]) else (String.concat "" ["(fun "; argText; " -> fun (_ : int) -> "; rt; " "; argText; ")"]))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " ") ((v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames arity) v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__15, dtb__16, dtb__17, dtb__18, dtb__19, dtb__20) -> dtb__18
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__21, dtb__22, dtb__23, dtb__24, dtb__25, dtb__26) -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__21, dtb__22, dtb__23, mc1, dtb__25, dtb__26))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData = (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__27, dtb__28) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData dtb__27)) (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf dtb__28))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt = (fun qc datas -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas), (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf datas), (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf datas), 0, qc, Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep = (fun st unit -> (if (if (unit = "") then true else ((Base_dList.v_Base_dList_dmemName unit) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33, dtb__34) -> dtb__34
  | _ -> failwith "DT: impossible branch"
))) then st else (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt ((match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39, dtb__40) -> dtb__35
  | _ -> failwith "DT: impossible branch"
), (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__41, dtb__42, dtb__43, dtb__44, dtb__45, dtb__46) -> dtb__42
  | _ -> failwith "DT: impossible branch"
), (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__47, dtb__48, dtb__49, dtb__50, dtb__51, dtb__52) -> dtb__49
  | _ -> failwith "DT: impossible branch"
), (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__53, dtb__54, dtb__55, dtb__56, dtb__57, dtb__58) -> dtb__56
  | _ -> failwith "DT: impossible branch"
), (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__59, dtb__60, dtb__61, dtb__62, dtb__63, dtb__64) -> dtb__63
  | _ -> failwith "DT: impossible branch"
), (Base_dList.C_Base_dList_dList_Base_dList_dCons (unit, (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__65, dtb__66, dtb__67, dtb__68, dtb__69, dtb__70) -> dtb__70
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef = (fun st name -> ((fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) (Base_dPair.v_Base_dPair_dsecondOf p))))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dqualValueText (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__71, dtb__72, dtb__73, dtb__74, dtb__75, dtb__76) -> dtb__75
  | _ -> failwith "DT: impossible branch"
)) name)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef = (fun st family ctor -> ((fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) (Base_dPair.v_Base_dPair_dsecondOf p))))) (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__77, dtb__78, dtb__79, dtb__80, dtb__81, dtb__82) -> dtb__81
  | _ -> failwith "DT: impossible branch"
)) family) ctor)))

let v_Vuna_dCompiler_dCodegen_dTerm_dbridgeHelperNames = (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtp_unpack", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtp_pack", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtp_listOf", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtp_ocamlOf", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtp_concatMany", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtp_substTemplate", Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dbridgeUnitOf = (fun st -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (match (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__83, dtb__84, dtb__85, dtb__86, dtb__87, dtb__88) -> dtb__87
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dCodegen_dDecl.C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (dtb__89, dtb__90, dtb__91) -> dtb__91
  | _ -> failwith "DT: impossible branch"
)) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName))

let v_Vuna_dCompiler_dCodegen_dTerm_dreplaceAll = (fun old new_ text -> ((Base_dString.v_Base_dString_djoin new_) ((Base_dString.v_Base_dString_dsplit old) text)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__92, dtb__93) -> (((v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames mc0) dtb__93) (((v_Vuna_dCompiler_dCodegen_dTerm_dreplaceAll dtb__92) (String.concat "" [mc0; "."; dtb__92])) mc2))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeText = (fun unit text -> (if (unit = "") then text else (((v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames unit) v_Vuna_dCompiler_dCodegen_dTerm_dbridgeHelperNames) text)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenBridgeRef = (fun st text -> ((fun unit -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeText unit) text), ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) unit)))) (v_Vuna_dCompiler_dCodegen_dTerm_dbridgeUnitOf st)))

let v_Vuna_dCompiler_dCodegen_dTerm_dioPrimText = (fun st name i -> (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dneedsListBridge i) then ((fun rt -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dTerm_dioPrimThunkText (Base_dPair.v_Base_dPair_dfirstOf rt)) (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicArity i)), (Base_dPair.v_Base_dPair_dsecondOf rt)))))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenBridgeRef st) (match i with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Vuna_dCompiler_dIntrinsics_dIntrinsic (dtb__94, dtb__95, dtb__96, dtb__97, dtb__98, dtb__99) -> dtb__98
  | _ -> failwith "DT: impossible branch"
))) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dTerm_dioPrimThunkText (match i with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Vuna_dCompiler_dIntrinsics_dIntrinsic (dtb__100, dtb__101, dtb__102, dtb__103, dtb__104, dtb__105) -> dtb__104
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicArity i)), st))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef = (fun st name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("0", st)))) else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("bi_natSucc", st)))) else (match ((Base_dList.v_Base_dList_dlookupPair name) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__106, dtb__107, dtb__108, dtb__109, dtb__110, dtb__111) -> dtb__107
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__112) -> ((fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dPair.v_Base_dPair_dsecondOf p)))))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef st) dtb__112) name))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__113) -> (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_disIOAlgebraName name) then ((v_Vuna_dCompiler_dCodegen_dTerm_dioAlgebraText st) name) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicReturnsIO dtb__113) then (((v_Vuna_dCompiler_dCodegen_dTerm_dioPrimText st) name) dtb__113) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dneedsListBridge dtb__113) then (if ((Base_dList.v_Base_dList_dmemName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__114, dtb__115, dtb__116, dtb__117, dtb__118, dtb__119) -> dtb__114
  | _ -> failwith "DT: impossible branch"
)) then ((fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dPair.v_Base_dPair_dsecondOf p)))))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenBridgeRef st) (match dtb__113 with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Vuna_dCompiler_dIntrinsics_dIntrinsic (dtb__120, dtb__121, dtb__122, dtb__123, dtb__124, dtb__125) -> dtb__124
  | _ -> failwith "DT: impossible branch"
))) else ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dListBridgeRequired (name))) name)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((match dtb__113 with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Vuna_dCompiler_dIntrinsics_dIntrinsic (dtb__126, dtb__127, dtb__128, dtb__129, dtb__130, dtb__131) -> dtb__130
  | _ -> failwith "DT: impossible branch"
), st)))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dPair.v_Base_dPair_dsecondOf p)))))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef st) name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__132, dtb__133, dtb__134) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__133) then (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__134) else (1 + (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__134)))
  | _ -> 0
))

let v_Vuna_dCompiler_dCodegen_dTerm_daeEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__135, dtb__136, dtb__137) -> dtb__135
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daePats = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__138, dtb__139, dtb__140) -> dtb__139
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daeSt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__141, dtb__142, dtb__143) -> dtb__143
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__144, dtb__145) -> (match dtb__144 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__147) then ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo mc0) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), mc1))) dtb__145) mc3) else ((fun fresh -> ((fun nm -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) (fresh + 1))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (nm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc1))) dtb__145) (Base_dList.C_Base_dList_dList_Base_dList_dCons (nm, mc3)))) ("dtb__" ^ (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc1, (Base_dList.v_Base_dList_dreverse mc3), mc0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnv = (fun st outer tele -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo st) outer) tele) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dcountKept = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__148, dtb__149) -> (if dtb__148 then (1 + (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__149)) else (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__149))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> (match dtb__150 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc1; ": case branch has more binders than its shape"])))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__154, dtb__155) -> (if ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__154) dtb__153) then (if dtb__154 then ((fun fresh -> ((fun nm -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) (fresh + 1))) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (nm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc2))) dtb__151) dtb__155) (Base_dList.C_Base_dList_dList_Base_dList_dCons (nm, mc5)))) ("dtb__" ^ (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)) else ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull mc0) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), mc2))) dtb__151) dtb__155) mc5)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc1; ": case branch binder rig disagrees with its shape"]))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc2, (Base_dList.v_Base_dList_dreverse mc5), mc0))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__156, dtb__157) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc1; ": case branch has fewer binders than its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__158, dtb__159) -> (match dtb__158 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__160, dtb__161) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__161) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc1; ": kept-field branch has an erased binder"]))) else ((fun fresh -> ((fun nm -> (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) (fresh + 1))) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (nm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc2))) dtb__159) (Base_dList.C_Base_dList_dList_Base_dList_dCons (nm, mc4)))) ("dtb__" ^ (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc2, (Base_dList.v_Base_dList_dreverse mc4), mc0))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked = (fun st label outer binders flags -> (if ((Base_dList.v_Base_dList_dlength binders) = (Base_dList.v_Base_dList_dlength flags)) then ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull st) label) outer) binders) flags) Base_dList.C_Base_dList_dList_Base_dList_dNil) else (if ((Base_dList.v_Base_dList_dlength binders) = (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept flags)) then (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept st) label) outer) binders) Base_dList.C_Base_dList_dList_Base_dList_dNil) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"]))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dcollectLamChain = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__162, dtb__163, dtb__164) -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dcollectLamChain dtb__164) with
  | C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain (dtb__165, dtb__166) -> (C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__162, dtb__163)), dtb__165)), dtb__166))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc0))
))

let v_Vuna_dCompiler_dCodegen_dTerm_dlamParamPair = (fun mc0 -> (match mc0 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__167, dtb__168) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__168) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)) else (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName dtb__167), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dlamParamName = (fun mc0 -> (match mc0 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__169, dtb__170) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__170) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName dtb__169), Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity = (fun mc0 -> (if (mc0 = "+") then 2 else (if (mc0 = "-") then 2 else (if (mc0 = "*") then 2 else (if (mc0 = "/") then 2 else (if (mc0 = "&&") then 2 else (if (mc0 = "||") then 2 else (if (mc0 = "++") then 2 else (if (mc0 = "bi_eq_int") then 2 else (if (mc0 = "bi_neq_int") then 2 else (if (mc0 = "bi_eq_str") then 2 else (if (mc0 = "bi_neq_str") then 2 else (if (mc0 = "bi_lt_int") then 2 else (if (mc0 = "bi_le_int") then 2 else (if (mc0 = "bi_gt_int") then 2 else (if (mc0 = "bi_ge_int") then 2 else (if (mc0 = "bi_lt_generic") then 2 else (if (mc0 = "bi_le_generic") then 2 else (if (mc0 = "bi_gt_generic") then 2 else (if (mc0 = "bi_ge_generic") then 2 else (if (mc0 = "natToInt") then 1 else (if (mc0 = "natFromInt") then 1 else (if (mc0 = "natAdd") then 2 else (if (mc0 = "natSub") then 2 else (if (mc0 = "natMul") then 2 else (if (mc0 = "natDiv") then 2 else 0))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dinlineText = (fun mc0 mc1 -> (if (mc0 = "+") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__171, dtb__172) -> (match dtb__172 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (match dtb__174 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__171; " + "; dtb__173; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "-") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__175, dtb__176) -> (match dtb__176 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__177, dtb__178) -> (match dtb__178 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__175; " - "; dtb__177; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "*") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__179, dtb__180) -> (match dtb__180 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__181, dtb__182) -> (match dtb__182 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__179; " * "; dtb__181; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "/") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__183, dtb__184) -> (match dtb__184 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__185, dtb__186) -> (match dtb__186 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(if "; dtb__185; " = 0 then failwith \"division by zero\" else "; dtb__183; " / "; dtb__185; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "&&") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__187, dtb__188) -> (match dtb__188 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__189, dtb__190) -> (match dtb__190 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__187; " && "; dtb__189; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "||") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__191, dtb__192) -> (match dtb__192 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__193, dtb__194) -> (match dtb__194 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__191; " || "; dtb__193; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "++") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__195, dtb__196) -> (match dtb__196 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__197, dtb__198) -> (match dtb__198 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__195; " ^ "; dtb__197; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_eq_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__199, dtb__200) -> (match dtb__200 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__201, dtb__202) -> (match dtb__202 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__199; " = "; dtb__201; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_neq_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__203, dtb__204) -> (match dtb__204 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__205, dtb__206) -> (match dtb__206 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__203; " <> "; dtb__205; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_eq_str") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__207, dtb__208) -> (match dtb__208 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__209, dtb__210) -> (match dtb__210 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__207; " = "; dtb__209; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_neq_str") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__211, dtb__212) -> (match dtb__212 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__213, dtb__214) -> (match dtb__214 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__211; " <> "; dtb__213; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_lt_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__215, dtb__216) -> (match dtb__216 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__217, dtb__218) -> (match dtb__218 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__215; " < "; dtb__217; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_le_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__219, dtb__220) -> (match dtb__220 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__221, dtb__222) -> (match dtb__222 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__219; " <= "; dtb__221; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_gt_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__223, dtb__224) -> (match dtb__224 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__225, dtb__226) -> (match dtb__226 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__223; " > "; dtb__225; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_ge_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__227, dtb__228) -> (match dtb__228 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__229, dtb__230) -> (match dtb__230 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__227; " >= "; dtb__229; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_lt_generic") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__231, dtb__232) -> (match dtb__232 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__233, dtb__234) -> (match dtb__234 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__231; " < "; dtb__233; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_le_generic") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__235, dtb__236) -> (match dtb__236 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__237, dtb__238) -> (match dtb__238 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__235; " <= "; dtb__237; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_gt_generic") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__239, dtb__240) -> (match dtb__240 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__241, dtb__242) -> (match dtb__242 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__239; " > "; dtb__241; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_ge_generic") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__243, dtb__244) -> (match dtb__244 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__245, dtb__246) -> (match dtb__246 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__243; " >= "; dtb__245; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natToInt") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__247, dtb__248) -> (match dtb__248 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__247))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natFromInt") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__249, dtb__250) -> (match dtb__250 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natFromInt "; dtb__249; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natAdd") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__251, dtb__252) -> (match dtb__252 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__253, dtb__254) -> (match dtb__254 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natAdd "; dtb__251; " "; dtb__253; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natSub") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__255, dtb__256) -> (match dtb__256 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__257, dtb__258) -> (match dtb__258 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natSub "; dtb__255; " "; dtb__257; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natMul") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__259, dtb__260) -> (match dtb__260 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__261, dtb__262) -> (match dtb__262 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natMul "; dtb__259; " "; dtb__261; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natDiv") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__263, dtb__264) -> (match dtb__264 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__265, dtb__266) -> (match dtb__266 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natDiv "; dtb__263; " "; dtb__265; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dinlineArityMatches = (fun name args -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity name) <= 0) then false else ((Base_dList.v_Base_dList_dlength args) = (v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity name))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dflattenIntrinsicApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__267, dtb__268, dtb__269) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__269) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match dtb__267 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__270) -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity dtb__270) > 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__270, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__268, dtb__269)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__271) -> (match dtb__271 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__272, dtb__273) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__272, ((Base_dList.v_Base_dList_dappend dtb__273) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__268, dtb__269)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dTerm_dflattenIntrinsicApp dtb__267))
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__274, dtb__275, dtb__276) -> (match dtb__274 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__277, dtb__278, dtb__279) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__279) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__276)) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__277, dtb__278, dtb__279)), dtb__275, dtb__276)), Base_dList.C_Base_dList_dList_Base_dList_dNil)) else (match dtb__277 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__280) -> (if (dtb__280 = "++") then ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves dtb__278)) (v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves dtb__275)) else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__277, dtb__278, dtb__279)), dtb__275, dtb__276)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__277, dtb__278, dtb__279)), dtb__275, dtb__276)), Base_dList.C_Base_dList_dList_Base_dList_dNil))
))
  | _ -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, Base_dList.C_Base_dList_dList_Base_dList_dNil))
)
  | _ -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, Base_dList.C_Base_dList_dList_Base_dList_dNil))
))

let v_Vuna_dCompiler_dCodegen_dTerm_dflattenConcatChain = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__281, dtb__282, dtb__283) -> (match dtb__281 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__284, dtb__285, dtb__286) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__286) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__283)) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match dtb__284 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__287) -> (if (dtb__287 = "++") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves dtb__285)) (v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves dtb__282)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCodegen_dTerm_dconAppText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__288, dtb__289) -> (match dtb__289 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (String.concat "" ["("; mc0; " ("; dtb__288; "))"])
  | _ -> (String.concat "" ["("; mc0; " ("; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1); "))"])
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__290, dtb__291) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__292, dtb__293) -> (match dtb__292 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__294, dtb__295) -> (if dtb__290 then (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__295) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc0; ": runtime field marked erased"]))) else ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__291) dtb__293)) (fun ts -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__294, dtb__295)), ts))))))) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__295) then (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__291) dtb__293) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__291) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__294, dtb__295)), dtb__293)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if dtb__290 then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc0; ": application has fewer arguments than its shape"]))) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__291) Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__296, dtb__297) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc0; ": application has more arguments than its shape"])))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dnatChainNext = (fun n -> (if (n >= 4611686018427387903) then 4611686018427387903 else (n + 1)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dnatChainValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__298, dtb__299) -> (if (dtb__298 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match dtb__299 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (dtb__298 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__300, dtb__301) -> (match dtb__300 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__302, dtb__303) -> (match dtb__301 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dnatChainValue dtb__302) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__304) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dCodegen_dTerm_dnatChainNext dtb__304)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) dtb__299) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__305, dtb__306) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__305) = "") then true else (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt dtb__306))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> (String.concat "" [mc0; " ("; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1); ")"])
))

let v_Vuna_dCompiler_dCodegen_dTerm_disNatCtorName = (fun name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then true else (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__307, dtb__308) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__307) = "") then (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors dtb__308) else ((fun name -> (if (v_Vuna_dCompiler_dCodegen_dTerm_disNatCtorName name) then (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors dtb__308) else false)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__307)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseHasCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__309, dtb__310) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__309) = "") then (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseHasCtor dtb__310) else true)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseApplies = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> (if (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors mc0) then (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseHasCtor mc0) else false)
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__311, dtb__312) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__311) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__311)) else ((v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy mc0) dtb__312))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindCatchAllAlt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__313, dtb__314) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__313) = "") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__313)) else (v_Vuna_dCompiler_dCodegen_dTerm_dfindCatchAllAlt dtb__314))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel = (fun fuel st binders t -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__315, dtb__316) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unbound runtime variable"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__317) -> (match dtb__317 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__318, dtb__319) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__319) then ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelBindingRuntime (dtb__315))) dtb__315) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__318, st)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__316) binders))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__320) -> ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef st) dtb__320)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__321) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__321), st))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__322) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__322), st))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__323) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dboolText dtb__323), st))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__324, dtb__325, dtb__326) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) dtb__324)) (fun pc -> (match pc with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__327, dtb__328) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) dtb__328) binders) dtb__325)) (fun pt -> (match pt with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__329, dtb__330) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) dtb__330) binders) dtb__326)) (fun pe -> (match pe with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__331, dtb__332) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(if "; dtb__327; " then "; dtb__329; " else "; dtb__331; ")"]), dtb__332))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__333, dtb__334, dtb__335) -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel (fuel - 1)) st) binders) dtb__333) dtb__334) dtb__335)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__336, dtb__337, dtb__338) -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel (fuel - 1)) st) binders) dtb__336) dtb__337) dtb__338)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__339, dtb__340) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel (fuel - 1)) st) binders) dtb__339) dtb__340)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__341, dtb__342) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel (fuel - 1)) st) binders) dtb__341) dtb__342)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__343, dtb__344, dtb__345, dtb__346, dtb__347) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__348) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__349) -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dUnsolvedMetavarRuntime ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__349)))) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__349))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel = (fun fuel st binders name rig body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match (v_Vuna_dCompiler_dCodegen_dTerm_dcollectLamChain (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, body))) with
  | C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain (dtb__350, dtb__351) -> ((fun env -> ((fun names -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) env) dtb__351)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__352, dtb__353) -> (match names with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__352, dtb__353))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(fun "; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " ") names); " -> "; dtb__352; ")"]), dtb__353))))
)
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dTerm_dlamParamName) dtb__350))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dTerm_dlamParamPair) dtb__350))) binders))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel = (fun fuel st binders f a rig -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) f) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenAppOptimizedFuel (fuel - 1)) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (f, a, rig)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__354) -> (match dtb__354 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__355, dtb__356) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel (fuel - 1)) st) binders) dtb__355) dtb__356)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (f, a, rig)))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenAppOptimizedFuel = (fun fuel st binders t -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match (v_Vuna_dCompiler_dCodegen_dTerm_dflattenConcatChain t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__357) -> (if ((Base_dList.v_Base_dList_dlength dtb__357) >= 3) then ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartsFuel (fuel - 1)) st) binders) dtb__357) else ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFuel fuel) st) binders) t))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFuel fuel) st) binders) t)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFuel = (fun fuel st binders t -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__358, dtb__359, dtb__360) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFallback (fuel - 1)) st) binders) dtb__358) dtb__359) dtb__360)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__361) -> (match dtb__361 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__362, dtb__363) -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineArityMatches dtb__362) dtb__363) then (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineAppFuel (fuel - 1)) st) binders) dtb__362) dtb__363) else ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFallback (fuel - 1)) st) binders) dtb__358) dtb__359) dtb__360))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dTerm_dflattenIntrinsicApp t))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: genPlainAppFuel expects an application"))
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFallback = (fun fuel st binders f a rig -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) f)) (fun pf -> (match pf with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__364, dtb__365) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) dtb__365) binders) a)) (fun pa -> (match pa with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__366, dtb__367) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["("; dtb__364; " "; dtb__366; ")"]), dtb__367))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineAppFuel = (fun fuel st binders name args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineArgsFuel (fuel - 1)) st) binders) args)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__368, dtb__369) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineText name) dtb__368) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__370) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__370, dtb__369))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: no inline text for builtin `"; name; "`"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineArgsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__371, dtb__372) -> (match dtb__371 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__373, dtb__374) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__374) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erased argument in inlined builtin application")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (mc0 - 1)) mc1) mc2) dtb__373)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__375, dtb__376) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineArgsFuel (mc0 - 1)) dtb__376) mc2) dtb__372)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__377, dtb__378) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__375, dtb__377)), dtb__378))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc1)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartsFuel = (fun fuel st binders parts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartTexts (fuel - 1)) st) binders) parts)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__379, dtb__380) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(String.concat \"\" ["; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "; ") dtb__379); "])"]), dtb__380))))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartTexts = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__381, dtb__382) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (mc0 - 1)) mc1) mc2) dtb__381)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__383, dtb__384) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartTexts (mc0 - 1)) dtb__384) mc2) dtb__382)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__385, dtb__386) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__383, dtb__385)), dtb__386))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc1)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__387, dtb__388) -> (match dtb__387 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__389, dtb__390) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (mc0 - 1)) mc1) mc2) dtb__389)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__391, dtb__392) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel (mc0 - 1)) dtb__392) mc2) dtb__388)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__393, dtb__394) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__391, dtb__393)), dtb__394))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc1)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel = (fun fuel st binders c args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match (v_Vuna_dCompiler_dCodegen_dTerm_dnatChainValue (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (c, args))) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__395) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__395), st))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppNonChainFuel fuel) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppNonChainFuel = (fun fuel st binders c args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs c) Base_dList.C_Base_dList_dList_Base_dList_dNil) args) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__396) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__396))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__397) -> (match dtb__397 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("0", st))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat Zero applied to arguments"))
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then (match (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs c) (Base_dList.C_Base_dList_dList_Base_dList_dCons (true, Base_dList.C_Base_dList_dList_Base_dList_dNil))) args) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__398) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__398))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__399) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel (fuel - 1)) st) binders) dtb__399)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__400, dtb__401) -> (match dtb__400 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__402, dtb__403) -> (match dtb__403 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(bi_natSucc "; dtb__402; ")"]), dtb__401))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat Succ must have exactly one runtime argument"))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat Succ must have exactly one runtime argument"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (match ((Base_dList.v_Base_dList_dlookupPair c) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__404, dtb__405, dtb__406, dtb__407, dtb__408, dtb__409) -> dtb__405
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: unknown constructor " ^ c)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__410) -> (match ((Base_dList.v_Base_dList_dlookupPair c) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__411, dtb__412, dtb__413, dtb__414, dtb__415, dtb__416) -> dtb__413
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: no shape for constructor " ^ c)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__417) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs c) dtb__417) args)) (fun runtimeArgs -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel (fuel - 1)) st) binders) runtimeArgs)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__418, dtb__419) -> ((fun r -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dTerm_dconAppText (Base_dPair.v_Base_dPair_dfirstOf r)) dtb__418), (Base_dPair.v_Base_dPair_dsecondOf r)))))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef dtb__419) dtb__410) c))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel = (fun fuel st outer alt -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then ((fun bound -> ((fun patText -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__420, dtb__421) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["  | "; patText; " -> "; dtb__420; "\n"]), dtb__421))))
  | _ -> failwith "DT: impossible branch"
)))) (match (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> "_"
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__422, dtb__423) -> dtb__422
  | _ -> failwith "DT: impossible branch"
))) (((v_Vuna_dCompiler_dCodegen_dTerm_daltEnv st) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) else (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__424, dtb__425, dtb__426, dtb__427, dtb__428, dtb__429) -> dtb__425
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: unknown constructor " ^ (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__430) -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436) -> dtb__433
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: no shape for constructor " ^ (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__437) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked st) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__437)) (fun bound -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__438, dtb__439) -> ((fun r -> ((fun patText -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["  | "; patText; " -> "; dtb__438; "\n"]), (Base_dPair.v_Base_dPair_dsecondOf r)))))) ((v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText (Base_dPair.v_Base_dPair_dfirstOf r)) (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound)))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef dtb__439) dtb__430) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__440, dtb__441) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel (mc0 - 1)) mc1) mc2) dtb__440)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__442, dtb__443) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel (mc0 - 1)) dtb__443) mc2) dtb__441)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__444, dtb__445) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((dtb__442 ^ dtb__444), dtb__445))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", mc1)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAltBodyFuel = (fun fuel st outer alt bindExpr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((fun bound -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__446, dtb__447) -> (match (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__446, dtb__447))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__448, dtb__449) -> (match dtb__449 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match bindExpr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__450) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(let "; dtb__448; " = "; dtb__450; " in "; dtb__446; ")"]), dtb__447))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat case arm has a binder but no runtime binding"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat case arm has more than one runtime binder"))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCodegen_dTerm_daltEnv st) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenNatCaseFuel = (fun fuel st binders scrut alts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) scrut)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__451, dtb__452) -> ((fun fresh -> ((fun sc -> ((fun st2 -> ((fun zeroAlt -> ((fun succAlt -> ((fun catchAlt -> ((fun predExpr -> (((((((((v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseBranchesFuel (fuel - 1)) st2) binders) zeroAlt) succAlt) catchAlt) sc) dtb__451) predExpr)) (String.concat "" ["("; sc; " - 1)"]))) (v_Vuna_dCompiler_dCodegen_dTerm_dfindCatchAllAlt alts))) ((v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) alts))) ((v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) alts))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext dtb__452) (fresh + 1)))) ("dtnat__" ^ (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext dtb__452))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseBranchesFuel = (fun fuel st binders zeroAlt succAlt catchAlt sc scrutText predExpr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((fun impossible -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_dnatAltTextFuel (fuel - 1)) st) binders) zeroAlt) Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) (fun pz -> (match pz with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__453, dtb__454) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_dnatAltTextFuel (fuel - 1)) dtb__454) binders) succAlt) (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (predExpr)))) (fun ps -> (match ps with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__455, dtb__456) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_dnatAltTextFuel (fuel - 1)) dtb__456) binders) catchAlt) (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (sc)))) (fun pc -> (match pc with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__457, dtb__458) -> ((fun trueText -> ((fun falseText -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(let "; sc; " = "; scrutText; " in (if "; sc; " = 0 then "; trueText; " else "; falseText; "))"]), dtb__458))))) (match succAlt with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__459) -> dtb__455
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match catchAlt with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__460) -> dtb__457
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> impossible
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) (match zeroAlt with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__461) -> dtb__453
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match catchAlt with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__462) -> dtb__457
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> impossible
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))) "(failwith \"DT: impossible branch\")")))
and v_Vuna_dCompiler_dCodegen_dTerm_dnatAltTextFuel = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__463) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAltBodyFuel mc0) mc1) mc2) dtb__463) mc4)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", mc1))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel = (fun fuel st binders scrut alts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseApplies alts) then (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatCaseFuel (fuel - 1)) st) binders) scrut) alts) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) scrut)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__464, dtb__465) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel (fuel - 1)) dtb__465) binders) alts)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__466, dtb__467) -> ((fun fallback -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(match "; dtb__464; " with\n"; dtb__466; fallback; ")"]), dtb__467))))) (if (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt alts) then "" else "  | _ -> failwith \"DT: impossible branch\"\n"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainUnitName = "Main"

let v_Vuna_dCompiler_dCodegen_dTerm_dmainInitWrap = (fun st isRec name body -> (if isRec then false else (if (if (if ((match (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__468, dtb__469, dtb__470, dtb__471, dtb__472, dtb__473) -> dtb__472
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dCodegen_dDecl.C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (dtb__474, dtb__475, dtb__476) -> dtb__474
  | _ -> failwith "DT: impossible branch"
) = v_Vuna_dCompiler_dCodegen_dTerm_dmainUnitName) then (name = "main") else false) then ((v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity body) = 0) else false) then true else false)))

let v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__477) -> (match dtb__477 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__478, dtb__479) -> (if (dtb__478 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("int")) else (if (dtb__478 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("string")) else (if (dtb__478 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("bool")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: extern type is not basic: " ^ dtb__478))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern type is not a global type"))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern type is not basic"))
))

let v_Vuna_dCompiler_dCodegen_dTerm_dexternDomText = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__480) -> (match dtb__480 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__481, dtb__482) -> (if (dtb__481 = "Array") then (match dtb__482 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__483, dtb__484) -> (match dtb__484 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText dtb__483)) (fun e -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" ["("; e; " array)"])))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern Array needs one type argument"))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern Array needs one type argument"))
) else (if (dtb__481 = "Array") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern Array needs one type argument")) else (v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText mc0)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText mc0)
)
  | _ -> (v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText mc0)
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dexternTyText = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__485, dtb__486, dtb__487, dtb__488, dtb__489) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern type is too deep")) else (if dtb__486 then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern has an implicit parameter")) else ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dTerm_dexternDomText dtb__488)) (fun domText -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dexternTyText (mc0 - 1)) (mc1 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__489) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__485, mc1, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))) (fun resText -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" ["("; domText; ") -> "; resText])))))))))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern type is too deep")) else (v_Vuna_dCompiler_dCodegen_dTerm_dexternDomText mc2))
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenExternTy = (fun ty -> (((v_Vuna_dCompiler_dCodegen_dTerm_dexternTyText 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) ty)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__490, dtb__491) -> (match dtb__491 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__490)) ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__490)))
  | _ -> true
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__492, dtb__493) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__494, dtb__495, dtb__496) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__495) then (v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed dtb__496) else true)
  | _ -> false
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__497, dtb__498) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__497) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__499) -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__499) = 0) then (if (v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed dtb__499) then (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue dtb__498) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__497)))) else (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue dtb__498))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dioResultTy = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__500, dtb__501, dtb__502) -> (match dtb__500 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__503) -> (if (dtb__503 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dioFamilyName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__501)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr = (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainReturnType)

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName = (fun g -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("string_of_int", "int")))) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("string_of_int", "int")))) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_string", "string")))) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_bool", "bool")))) else v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr)))))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShow = (fun table tyTerm -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Base_dHashMap.v_Base_dHashMap_dfromList table)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) tyTerm)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__504) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__505, dtb__506) -> (match dtb__506 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName dtb__505)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)) dtb__504)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook = (fun bodyText table tyTerm mainExpr printResult -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dmainShow table) tyTerm)) (fun showPair -> (match showPair with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__507, dtb__508) -> ((fun action -> ((fun hook -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" [bodyText; "\n"; hook])))) (String.concat "" ["let () =\n"; "  Printexc.record_backtrace true;\n"; "  try "; action; "\n"; "  with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2\n"]))) (if printResult then (String.concat "" ["print_endline ("; dtb__507; " ("; mainExpr; "))"]) else (String.concat "" ["ignore ("; mainExpr; ")"])))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dTerm_dioRunText = (fun qc program mainRef -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((mainRef ^ " 0"), "")))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef = (fun st isRec d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__509) -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dgenExternTy (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__510) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) ^ dtb__510)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__511) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["external "; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)); " : "; dtb__511; " = "; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__509)]), st))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__512) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__513) -> (match dtb__513 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__514, dtb__515) -> ((fun finalText -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" [(Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)); " = "; finalText]), dtb__515))))) (if ((((v_Vuna_dCompiler_dCodegen_dTerm_dmainInitWrap st) isRec) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) dtb__512) then (String.concat "" ["(try "; dtb__514; " with e -> dt_report_exn e (Printexc.get_raw_backtrace ()); exit 2)"]) else dtb__514))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__516) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) ^ dtb__516)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__512))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) ^ "DT: internal: axiom reached runtime code generation (partition must erase it)")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__517, dtb__518) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef mc0) mc1) dtb__517)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__519, dtb__520) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies dtb__520) mc1) dtb__518)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__521, dtb__522) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__519, dtb__521)), dtb__522))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc0))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet = (fun st group isRec -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies st) isRec) group)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__523, dtb__524) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__525, dtb__526) -> (match dtb__526 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern dtb__525) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__527) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\n") dtb__523), dtb__524))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((if isRec then "let rec " else "let ") ^ ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__523)), dtb__524))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((if isRec then "let rec " else "let ") ^ ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__523)), dtb__524))))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((if isRec then "let rec " else "let ") ^ ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__523)), dtb__524))))
)) group)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup = (fun adj st group -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec adj) group) then (match (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue group) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__528) -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef dtb__528) group) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__529) -> ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__529)) dtb__528) (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (dtb__528))) (Base_dVec.C_Base_dVec_dVec_Base_dVec_dVCons (dtb__528, Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (dtb__528))) dtb__528)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet st) group) true)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet st) group) false)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__530, dtb__531) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup mc0) mc1) dtb__530)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__532, dtb__533) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups mc0) dtb__533) dtb__531)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__534, dtb__535) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__532, dtb__534)), dtb__535))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc1))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLam = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel 512) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenApp = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel 512) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenConApp = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel 512) a1) a2) a3) a4))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgs = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenArm = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenArms = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenCase = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel 512) a1) a2) a3) a4))
