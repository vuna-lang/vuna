open Vuna_runtime
type t_Vuna_dCompiler_dCodegen_dTerm_dGenSt = C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt of (string Base_dList.t_Base_dList_dList) * ((string, string) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * ((string, bool Base_dList.t_Base_dList_dList) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (int) * (Vuna_dCompiler_dCodegen_dDecl.t_Vuna_dCompiler_dCodegen_dDecl_dQualCtx) * (string Base_dList.t_Base_dList_dList)
and t_Vuna_dCompiler_dCodegen_dTerm_dAltEnv = C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv of ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (string Base_dList.t_Base_dList_dList) * (t_Vuna_dCompiler_dCodegen_dTerm_dGenSt)
and t_Vuna_dCompiler_dCodegen_dTerm_dLamChain = C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain of ((string, Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dRig) Base_dPair.t_Base_dPair_dPair Base_dList.t_Base_dList_dList) * (Vuna_dCompiler_dCore_dTerm.t_Vuna_dCompiler_dCore_dTerm_dTerm)

let v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime = (String.concat "" ["let dtp_print s = print_string s; flush stdout; String.length s\n"; "let dtp_readFile path =\n  try\n    let ch = open_in_bin path in\n    Fun.protect ~finally:(fun () -> close_in_noerr ch)\n      (fun () -> really_input_string ch (in_channel_length ch))\n  with Sys_error msg -> failwith (\"readFile: \" ^ msg)\n"; "let dtp_writeFile path contents =\n  try\n    let ch = open_out_bin path in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch)\n      (fun () -> output_string ch contents);\n    String.length contents\n  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)\n"; "let dtp_writeFileAtomic path contents =\n  let tmp = path ^ \".\" ^ string_of_int (Unix.getpid ()) ^ \".tmp\" in\n  let write () =\n    let ch = open_out_bin tmp in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch) (fun () -> output_string ch contents) in\n  (try write (); Sys.rename tmp path; String.length contents\n   with e -> (try Sys.remove tmp with _ -> ()); raise e)\n"; "let dtp_getArgs () =\n  let argv = Sys.argv in\n  let n = Array.length argv in\n  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))\n"; "let dtp_readLine () = try input_line stdin with End_of_file -> \"\"\n"; "let dtp_readBytes n =\n  if n <= 0 then \"\"\n  else\n    let b = Bytes.create n in\n    let k = try input stdin b 0 n with _ -> 0 in\n    if k <= 0 then \"\" else Bytes.sub_string b 0 k\n"; "let dtp_readDir path =\n  try List.sort compare (Array.to_list (Sys.readdir path))\n  with Sys_error msg -> failwith (\"readDir: \" ^ msg)\n"; "let dtp_isDirectory path =\n  try Sys.is_directory path with Sys_error msg -> failwith (\"isDirectory: \" ^ msg)\n"; "let dtp_makeDir path =\n  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))\n  with Sys_error msg -> failwith (\"makeDir: \" ^ msg)\n"; "let dtp_removeFile path =\n  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)\n  with Sys_error msg -> failwith (\"removeFile: \" ^ msg)\n"; "let dtp_fileExists path = Sys.file_exists path\n"; "let dtp_fileMtime path =\n  try int_of_float (Unix.stat path).Unix.st_mtime with _ -> 0\n"; "let dtp_fileSize path =\n  try (Unix.stat path).Unix.st_size with _ -> 0\n"; "let dtp_timeUs () = int_of_float (Unix.gettimeofday () *. 1000000.0)\n"; "let dtp_getenv k = try Sys.getenv k with Not_found -> \"\"\n"; "let dtp_getcwd () = try Sys.getcwd () with _ -> \".\"\n"; "let dtp_execPath () = try Unix.readlink \"/proc/self/exe\" with _ -> Sys.executable_name\n"; "let dtp_arraySet (a : 'a array) (i : int) (v : 'a) =\n  let b = Array.copy a in\n  Array.set b i v; b\n"; "let dtp_strHash (s : string) =\n  let h = ref 0 in\n  String.iter (fun c -> h := ((!h * 33) + Char.code c) land 1023) s;\n  !h\n"; "let dtp_strAt (s : string) (i : int) = if i < 0 || i >= String.length s then -1 else Char.code s.[i]\n"; "let dtp_substring start len s =\n  let n = String.length s in\n  let st = if start < 0 then 0 else if start > n then n else start in\n  let ln = if len < 0 then 0 else if st + len > n then n - st else len in\n  String.sub s st ln\n"; "let dtp_marshal (v : 'a) : string = Marshal.to_string v []\n"; "let dtp_unmarshal (s : string) : 'a = Marshal.from_string s 0\n"; "let dtp_exit n = exit n\n"; "let dtp_runIn dir args =\n  let quote s = Filename.quote s in\n  let cmd = String.concat \" \" (List.map quote args) in\n  let old = Sys.getcwd () in\n  Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)\n"; "let dtp_spawn (args : string list) : int =\n  let prog = Sys.executable_name in\n  Unix.create_process prog (Array.of_list (prog :: args)) Unix.stdin Unix.stdout Unix.stderr\n"; "let dtp_wait (pid : int) : int =\n  let (_, st) = Unix.waitpid [] pid in\n  match st with Unix.WEXITED c -> c | _ -> 1\n"])

let v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime = (String.concat "" ["let () =\n"; "  let c = Gc.get () in\n"; "  Gc.set { c with minor_heap_size = 16 * 1024 * 1024; space_overhead = 200 }\n"; "let () =\n"; "  if (try Sys.getenv \"VN_PERF_STATS\" with Not_found -> \"\") <> \"\" then\n"; "    at_exit (fun () ->\n"; "      let s = Gc.quick_stat () in\n"; "      Printf.eprintf \"VN_PERF minor_words=%.0f major_words=%.0f minor_collections=%d major_collections=%d top_heap_words=%d\\n\"\n"; "        s.Gc.minor_words s.Gc.major_words s.Gc.minor_collections s.Gc.major_collections s.Gc.top_heap_words)\n"; "let bi_add a b = a + b\n"; "let bi_sub a b = a - b\n"; "let bi_mul a b = a * b\n"; "let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\n"; "let bi_eq_int (a : int) (b : int) = a = b\n"; "let bi_neq_int (a : int) (b : int) = a <> b\n"; "let bi_eq_str (a : string) (b : string) = a = b\n"; "let bi_neq_str (a : string) (b : string) = a <> b\n"; "let bi_strFromInt (n : int) = string_of_int n\n"; "let bi_strLength (s : string) = String.length s\n"; "let bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])\n"; "let bi_strPack (cs : int list) =\n  let a = Array.of_list cs in\n  String.init (Array.length a) (fun i -> Char.chr a.(i))\n"; "let bi_lt_int (a : int) (b : int) = a < b\n"; "let bi_le_int (a : int) (b : int) = a <= b\n"; "let bi_gt_int (a : int) (b : int) = a > b\n"; "let bi_ge_int (a : int) (b : int) = a >= b\n"; "let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0\n"; "let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0\n"; "let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0\n"; "let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0\n"; "let bi_concat a b = a ^ b\n"; "let bi_and a b = a && b\n"; "let bi_or a b = a || b\n"; "let bi_natSucc (n : int) = if n >= max_int then max_int else n + 1\n"; "let bi_natAdd (a : int) (b : int) = if a > max_int - b then max_int else a + b\n"; "let bi_natSub (a : int) (b : int) = if a <= b then 0 else a - b\n"; "let bi_natMul (a : int) (b : int) =\n  if a <= 0 || b <= 0 then 0 else if a > max_int / b then max_int else a * b\n"; "let bi_natDiv (a : int) (b : int) = if b = 0 then failwith \"division by zero\" else a / b\n"; "let bi_natToInt (n : int) = n\n"; "let bi_natFromInt (n : int) = if n <= 0 then 0 else n\n"; "let dt_show_bool b = if b then \"True\" else \"False\"\n"; "let dt_show_string s =\n"; "  let buf = Buffer.create 16 in\n"; "  Buffer.add_char buf (Char.chr 34);\n"; "  String.iter (fun c ->\n"; "    let n = Char.code c in\n"; "    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))\n"; "    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))\n"; "    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"n\")\n"; "    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"t\")\n"; "    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"r\")\n"; "    else Buffer.add_char buf c) s;\n"; "  Buffer.add_char buf (Char.chr 34);\n"; "  Buffer.contents buf\n"; v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime])

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor = (fun mc0 mc1 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__0) = mc1) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0)) else ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor dtb__1) mc1))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__2) = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__2)) else (v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData dtb__3))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge = (fun datas -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData datas) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__4) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__4)) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistNilCtor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__5) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__4)) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistConsCtor) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6) -> ((fun famName -> ((fun nilMl -> ((fun consMl -> (String.concat "" ["\nlet dtp_unpack (s : string) =\n"; "  let cs = List.init (String.length s) (fun i -> Char.code s.[i]) in\n"; "  List.fold_right (fun x acc -> "; consMl; " (x, acc)) cs "; nilMl; "\n"; "let dtp_pack xs =\n"; "  let rec to_list xs = match xs with "; nilMl; " -> [] | "; consMl; " (x, rest) -> x :: to_list rest in\n"; "  let cs = Array.of_list (to_list xs) in\n"; "  String.init (Array.length cs) (fun i -> Char.chr cs.(i))\n"; "\nlet dtp_listOf xs = List.fold_right (fun x acc -> "; consMl; " (x, acc)) xs "; nilMl; "\n"; "let dtp_ocamlOf xs =\n"; "  let rec go l = match l with "; nilMl; " -> [] | "; consMl; " (x, rest) -> x :: go rest in\n"; "  go xs\n"; "\nlet dtp_concatMany xs = String.concat \"\" (dtp_ocamlOf xs)\n"; "\nlet dtp_substTemplate tmpl xs =\n"; "  let args = Array.of_list (dtp_ocamlOf xs) in\n"; "  let n = String.length tmpl and na = Array.length args in\n"; "  let buf = Buffer.create (n + 32) in\n"; "  let rec go i =\n"; "    if i >= n then ()\n"; "    else if tmpl.[i] = '<' then begin\n"; "      let j = ref (i + 1) and k = ref 0 in\n"; "      while !j < n && tmpl.[!j] >= '0' && tmpl.[!j] <= '9' do\n"; "        k := !k * 10 + (Char.code tmpl.[!j] - 48); incr j\n"; "      done;\n"; "      if !j < n && tmpl.[!j] = '>' && !j > i + 1 then begin\n"; "        (if !k < na then Buffer.add_string buf args.(!k)\n"; "         else Buffer.add_string buf (String.sub tmpl i (!j - i + 1)));\n"; "        go (!j + 1)\n"; "      end else (Buffer.add_char buf '<'; go (i + 1))\n"; "    end else (Buffer.add_char buf tmpl.[i]; go (i + 1))\n"; "  in go 0; Buffer.contents buf\n"])) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName famName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__6)))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName famName) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__5)))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameGo = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> (match dtb__7 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__9, dtb__10) -> (if (dtb__10 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dioFamilyName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__10, dtb__9)))) else (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameGo dtb__8))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameOf = (fun st -> (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameGo (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__11, dtb__12, dtb__13, dtb__14, dtb__15, dtb__16) -> dtb__12
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames = (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtio_0", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtio_1", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtio_2", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtio_3", Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames = (fun n names -> (if (n <= 0) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (match names with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__17, dtb__18) -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__17, ((v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames (n - 1)) dtb__18)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dioPrimLam = (fun ctor rt arity -> (if (arity = 0) then (String.concat "" ["("; ctor; " (fun _ -> "; rt; "))"]) else ((fun argText -> (String.concat "" ["(fun "; argText; " -> "; ctor; " (fun _ -> "; rt; " "; argText; "))"])) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " ") ((v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames arity) v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames)))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23, dtb__24) -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__25, dtb__26, dtb__27, dtb__28, dtb__29, dtb__30) -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__25, dtb__26, dtb__27, mc1, dtb__29, dtb__30))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData = (fun d -> ((Base_dList.v_Base_dList_dmap (fun c -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c))))) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__31, dtb__32) -> ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData dtb__31)) (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf dtb__32))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dList.C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt = (fun qc datas -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (((Base_dList.v_Base_dList_dmap Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas), (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf datas), (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf datas), 0, qc, Base_dList.C_Base_dList_dList_Base_dList_dNil)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep = (fun st unit -> (if (if (unit = "") then true else ((Base_dList.v_Base_dList_dmemName unit) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__33, dtb__34, dtb__35, dtb__36, dtb__37, dtb__38) -> dtb__38
  | _ -> failwith "DT: impossible branch"
))) then st else (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt ((match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__39, dtb__40, dtb__41, dtb__42, dtb__43, dtb__44) -> dtb__39
  | _ -> failwith "DT: impossible branch"
), (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__45, dtb__46, dtb__47, dtb__48, dtb__49, dtb__50) -> dtb__46
  | _ -> failwith "DT: impossible branch"
), (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__51, dtb__52, dtb__53, dtb__54, dtb__55, dtb__56) -> dtb__53
  | _ -> failwith "DT: impossible branch"
), (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__57, dtb__58, dtb__59, dtb__60, dtb__61, dtb__62) -> dtb__60
  | _ -> failwith "DT: impossible branch"
), (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__63, dtb__64, dtb__65, dtb__66, dtb__67, dtb__68) -> dtb__67
  | _ -> failwith "DT: impossible branch"
), (Base_dList.C_Base_dList_dList_Base_dList_dCons (unit, (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__69, dtb__70, dtb__71, dtb__72, dtb__73, dtb__74) -> dtb__74
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef = (fun st name -> ((fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) (Base_dPair.v_Base_dPair_dsecondOf p))))) ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dqualValueText (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__75, dtb__76, dtb__77, dtb__78, dtb__79, dtb__80) -> dtb__79
  | _ -> failwith "DT: impossible branch"
)) name)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef = (fun st family ctor -> ((fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) (Base_dPair.v_Base_dPair_dsecondOf p))))) (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__81, dtb__82, dtb__83, dtb__84, dtb__85, dtb__86) -> dtb__85
  | _ -> failwith "DT: impossible branch"
)) family) ctor)))

let v_Vuna_dCompiler_dCodegen_dTerm_dbridgeHelperNames = (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtp_unpack", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtp_pack", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtp_listOf", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtp_ocamlOf", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtp_concatMany", (Base_dList.C_Base_dList_dList_Base_dList_dCons ("dtp_substTemplate", Base_dList.C_Base_dList_dList_Base_dList_dNil))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dbridgeUnitOf = (fun st -> ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dunitOfTbl (match (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__87, dtb__88, dtb__89, dtb__90, dtb__91, dtb__92) -> dtb__91
  | _ -> failwith "DT: impossible branch"
) with
  | Vuna_dCompiler_dCodegen_dDecl.C_Vuna_dCompiler_dCodegen_dDecl_dQualCtx_Vuna_dCompiler_dCodegen_dDecl_dQualCtx (dtb__93, dtb__94, dtb__95) -> dtb__95
  | _ -> failwith "DT: impossible branch"
)) Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName))

let v_Vuna_dCompiler_dCodegen_dTerm_dreplaceAll = (fun old new_ text -> ((Base_dString.v_Base_dString_djoin new_) ((Base_dString.v_Base_dString_dsplit old) text)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__96, dtb__97) -> (((v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames mc0) dtb__97) (((v_Vuna_dCompiler_dCodegen_dTerm_dreplaceAll dtb__96) (String.concat "" [mc0; "."; dtb__96])) mc2))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc2
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeText = (fun unit text -> (if (unit = "") then text else (((v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeNames unit) v_Vuna_dCompiler_dCodegen_dTerm_dbridgeHelperNames) text)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenBridgeRef = (fun st text -> ((fun unit -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dTerm_dqualifyBridgeText unit) text), ((v_Vuna_dCompiler_dCodegen_dTerm_dgsAddDep st) unit)))) (v_Vuna_dCompiler_dCodegen_dTerm_dbridgeUnitOf st)))

let v_Vuna_dCompiler_dCodegen_dTerm_dioPrimText = (fun st name i -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__98) -> (match dtb__98 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__99, dtb__100) -> ((fun p -> ((fun rt -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((((v_Vuna_dCompiler_dCodegen_dTerm_dioPrimLam (Base_dPair.v_Base_dPair_dfirstOf p)) (Base_dPair.v_Base_dPair_dfirstOf rt)) (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicArity i)), (Base_dPair.v_Base_dPair_dsecondOf rt)))))) (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dneedsListBridge i) then ((v_Vuna_dCompiler_dCodegen_dTerm_dgenBridgeRef (Base_dPair.v_Base_dPair_dsecondOf p)) (match i with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Vuna_dCompiler_dIntrinsics_dIntrinsic (dtb__101, dtb__102, dtb__103, dtb__104, dtb__105, dtb__106) -> dtb__105
  | _ -> failwith "DT: impossible branch"
)) else (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((match i with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Vuna_dCompiler_dIntrinsics_dIntrinsic (dtb__107, dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> dtb__111
  | _ -> failwith "DT: impossible branch"
), (Base_dPair.v_Base_dPair_dsecondOf p)))))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef st) dtb__99) dtb__100))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dEffectPrimRequiresIO (name))) name)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameOf st)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef = (fun st name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("0", st)))) else (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("bi_natSucc", st)))) else (match ((Base_dList.v_Base_dList_dlookupPair name) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__113, dtb__114, dtb__115, dtb__116, dtb__117, dtb__118) -> dtb__114
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__119) -> ((fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dPair.v_Base_dPair_dsecondOf p)))))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef st) dtb__119) name))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__120) -> (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintrinsicReturnsIO dtb__120) then (((v_Vuna_dCompiler_dCodegen_dTerm_dioPrimText st) name) dtb__120) else (if (Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dneedsListBridge dtb__120) then (if ((Base_dList.v_Base_dList_dmemName Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__121, dtb__122, dtb__123, dtb__124, dtb__125, dtb__126) -> dtb__121
  | _ -> failwith "DT: impossible branch"
)) then ((fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dPair.v_Base_dPair_dsecondOf p)))))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenBridgeRef st) (match dtb__120 with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Vuna_dCompiler_dIntrinsics_dIntrinsic (dtb__127, dtb__128, dtb__129, dtb__130, dtb__131, dtb__132) -> dtb__131
  | _ -> failwith "DT: impossible branch"
))) else ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dListBridgeRequired (name))) name)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((match dtb__120 with
  | Vuna_dCompiler_dIntrinsics.C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Vuna_dCompiler_dIntrinsics_dIntrinsic (dtb__133, dtb__134, dtb__135, dtb__136, dtb__137, dtb__138) -> dtb__137
  | _ -> failwith "DT: impossible branch"
), st))))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((fun p -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dPair.v_Base_dPair_dfirstOf p), (Base_dPair.v_Base_dPair_dsecondOf p)))))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgenValueRef st) name))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__139, dtb__140, dtb__141) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__140) then (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__141) else (1 + (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__141)))
  | _ -> 0
))

let v_Vuna_dCompiler_dCodegen_dTerm_daeEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__142, dtb__143, dtb__144) -> dtb__142
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daePats = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__145, dtb__146, dtb__147) -> dtb__146
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daeSt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__148, dtb__149, dtb__150) -> dtb__150
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__151, dtb__152) -> (match dtb__151 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__153, dtb__154) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__154) then ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo mc0) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), mc1))) dtb__152) mc3) else ((fun fresh -> ((fun nm -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) (fresh + 1))) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (nm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc1))) dtb__152) (Base_dList.C_Base_dList_dList_Base_dList_dCons (nm, mc3)))) ("dtb__" ^ (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc1, (Base_dList.v_Base_dList_dreverse mc3), mc0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnv = (fun st outer tele -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo st) outer) tele) Base_dList.C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dcountKept = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__155, dtb__156) -> (if dtb__155 then (1 + (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__156)) else (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__156))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__157, dtb__158) -> (match dtb__157 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__159, dtb__160) -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc1; ": case branch has more binders than its shape"])))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__161, dtb__162) -> (if ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__161) dtb__160) then (if dtb__161 then ((fun fresh -> ((fun nm -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) (fresh + 1))) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (nm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc2))) dtb__158) dtb__162) (Base_dList.C_Base_dList_dList_Base_dList_dCons (nm, mc5)))) ("dtb__" ^ (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)) else ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull mc0) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), mc2))) dtb__158) dtb__162) mc5)) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc1; ": case branch binder rig disagrees with its shape"]))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc4 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc2, (Base_dList.v_Base_dList_dreverse mc5), mc0))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__163, dtb__164) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc1; ": case branch has fewer binders than its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__165, dtb__166) -> (match dtb__165 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__167, dtb__168) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__168) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc1; ": kept-field branch has an erased binder"]))) else ((fun fresh -> ((fun nm -> (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) (fresh + 1))) mc1) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (nm, Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc2))) dtb__166) (Base_dList.C_Base_dList_dList_Base_dList_dCons (nm, mc4)))) ("dtb__" ^ (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc2, (Base_dList.v_Base_dList_dreverse mc4), mc0))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked = (fun st label outer binders flags -> (if ((Base_dList.v_Base_dList_dlength binders) = (Base_dList.v_Base_dList_dlength flags)) then ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull st) label) outer) binders) flags) Base_dList.C_Base_dList_dList_Base_dList_dNil) else (if ((Base_dList.v_Base_dList_dlength binders) = (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept flags)) then (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept st) label) outer) binders) Base_dList.C_Base_dList_dList_Base_dList_dNil) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"]))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dcollectLamChain = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__169, dtb__170, dtb__171) -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dcollectLamChain dtb__171) with
  | C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain (dtb__172, dtb__173) -> (C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__169, dtb__170)), dtb__172)), dtb__173))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc0))
))

let v_Vuna_dCompiler_dCodegen_dTerm_dlamParamPair = (fun mc0 -> (match mc0 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__175) then (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)) else (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName dtb__174), Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dlamParamName = (fun mc0 -> (match mc0 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__176, dtb__177) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__177) then Base_dList.C_Base_dList_dList_Base_dList_dNil else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName dtb__176), Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity = (fun mc0 -> (if (mc0 = "+") then 2 else (if (mc0 = "-") then 2 else (if (mc0 = "*") then 2 else (if (mc0 = "/") then 2 else (if (mc0 = "&&") then 2 else (if (mc0 = "||") then 2 else (if (mc0 = "++") then 2 else (if (mc0 = "bi_eq_int") then 2 else (if (mc0 = "bi_neq_int") then 2 else (if (mc0 = "bi_eq_str") then 2 else (if (mc0 = "bi_neq_str") then 2 else (if (mc0 = "bi_lt_int") then 2 else (if (mc0 = "bi_le_int") then 2 else (if (mc0 = "bi_gt_int") then 2 else (if (mc0 = "bi_ge_int") then 2 else (if (mc0 = "bi_lt_generic") then 2 else (if (mc0 = "bi_le_generic") then 2 else (if (mc0 = "bi_gt_generic") then 2 else (if (mc0 = "bi_ge_generic") then 2 else (if (mc0 = "natToInt") then 1 else (if (mc0 = "natFromInt") then 1 else (if (mc0 = "natAdd") then 2 else (if (mc0 = "natSub") then 2 else (if (mc0 = "natMul") then 2 else (if (mc0 = "natDiv") then 2 else 0))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dinlineText = (fun mc0 mc1 -> (if (mc0 = "+") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__178, dtb__179) -> (match dtb__179 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__180, dtb__181) -> (match dtb__181 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__178; " + "; dtb__180; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "-") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__182, dtb__183) -> (match dtb__183 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__184, dtb__185) -> (match dtb__185 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__182; " - "; dtb__184; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "*") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__186, dtb__187) -> (match dtb__187 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__188, dtb__189) -> (match dtb__189 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__186; " * "; dtb__188; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "/") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__190, dtb__191) -> (match dtb__191 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__192, dtb__193) -> (match dtb__193 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(if "; dtb__192; " = 0 then failwith \"division by zero\" else "; dtb__190; " / "; dtb__192; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "&&") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__194, dtb__195) -> (match dtb__195 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__196, dtb__197) -> (match dtb__197 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__194; " && "; dtb__196; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "||") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__198, dtb__199) -> (match dtb__199 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__200, dtb__201) -> (match dtb__201 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__198; " || "; dtb__200; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "++") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__202, dtb__203) -> (match dtb__203 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__204, dtb__205) -> (match dtb__205 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__202; " ^ "; dtb__204; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_eq_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__206, dtb__207) -> (match dtb__207 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__208, dtb__209) -> (match dtb__209 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__206; " = "; dtb__208; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_neq_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__210, dtb__211) -> (match dtb__211 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__212, dtb__213) -> (match dtb__213 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__210; " <> "; dtb__212; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_eq_str") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__214, dtb__215) -> (match dtb__215 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__216, dtb__217) -> (match dtb__217 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__214; " = "; dtb__216; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_neq_str") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__218, dtb__219) -> (match dtb__219 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__220, dtb__221) -> (match dtb__221 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__218; " <> "; dtb__220; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_lt_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__222, dtb__223) -> (match dtb__223 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__224, dtb__225) -> (match dtb__225 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__222; " < "; dtb__224; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_le_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__226, dtb__227) -> (match dtb__227 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__228, dtb__229) -> (match dtb__229 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__226; " <= "; dtb__228; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_gt_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__230, dtb__231) -> (match dtb__231 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__232, dtb__233) -> (match dtb__233 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__230; " > "; dtb__232; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_ge_int") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__234, dtb__235) -> (match dtb__235 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__236, dtb__237) -> (match dtb__237 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__234; " >= "; dtb__236; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_lt_generic") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__238, dtb__239) -> (match dtb__239 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__240, dtb__241) -> (match dtb__241 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__238; " < "; dtb__240; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_le_generic") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__242, dtb__243) -> (match dtb__243 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__244, dtb__245) -> (match dtb__245 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__242; " <= "; dtb__244; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_gt_generic") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__246, dtb__247) -> (match dtb__247 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__248, dtb__249) -> (match dtb__249 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__246; " > "; dtb__248; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_ge_generic") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__250, dtb__251) -> (match dtb__251 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__252, dtb__253) -> (match dtb__253 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__250; " >= "; dtb__252; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natToInt") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__254, dtb__255) -> (match dtb__255 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__254))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natFromInt") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__256, dtb__257) -> (match dtb__257 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natFromInt "; dtb__256; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natAdd") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__258, dtb__259) -> (match dtb__259 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__260, dtb__261) -> (match dtb__261 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natAdd "; dtb__258; " "; dtb__260; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natSub") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__262, dtb__263) -> (match dtb__263 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__264, dtb__265) -> (match dtb__265 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natSub "; dtb__262; " "; dtb__264; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natMul") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__266, dtb__267) -> (match dtb__267 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__268, dtb__269) -> (match dtb__269 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natMul "; dtb__266; " "; dtb__268; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natDiv") then (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__270, dtb__271) -> (match dtb__271 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__272, dtb__273) -> (match dtb__273 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natDiv "; dtb__270; " "; dtb__272; ")"])))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dinlineArityMatches = (fun name args -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity name) <= 0) then false else ((Base_dList.v_Base_dList_dlength args) = (v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity name))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dflattenIntrinsicApp = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__274, dtb__275, dtb__276) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__276) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match dtb__274 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__277) -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity dtb__277) > 0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__277, (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__275, dtb__276)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__278) -> (match dtb__278 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__279, dtb__280) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__279, ((Base_dList.v_Base_dList_dappend dtb__280) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__275, dtb__276)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dTerm_dflattenIntrinsicApp dtb__274))
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__281, dtb__282, dtb__283) -> (match dtb__281 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__284, dtb__285, dtb__286) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__286) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__283)) then (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__284, dtb__285, dtb__286)), dtb__282, dtb__283)), Base_dList.C_Base_dList_dList_Base_dList_dNil)) else (match dtb__284 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__287) -> (if (dtb__287 = "++") then ((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves dtb__285)) (v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves dtb__282)) else (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__284, dtb__285, dtb__286)), dtb__282, dtb__283)), Base_dList.C_Base_dList_dList_Base_dList_dNil)))
  | _ -> (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__284, dtb__285, dtb__286)), dtb__282, dtb__283)), Base_dList.C_Base_dList_dList_Base_dList_dNil))
))
  | _ -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, Base_dList.C_Base_dList_dList_Base_dList_dNil))
)
  | _ -> (Base_dList.C_Base_dList_dList_Base_dList_dCons (mc0, Base_dList.C_Base_dList_dList_Base_dList_dNil))
))

let v_Vuna_dCompiler_dCodegen_dTerm_dflattenConcatChain = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__288, dtb__289, dtb__290) -> (match dtb__288 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__291, dtb__292, dtb__293) -> (if (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__293) then true else (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__290)) then Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match dtb__291 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__294) -> (if (dtb__294 = "++") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((Base_dList.v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves dtb__292)) (v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves dtb__289)))) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCodegen_dTerm_dconAppText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__295, dtb__296) -> (match dtb__296 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (String.concat "" ["("; mc0; " ("; dtb__295; "))"])
  | _ -> (String.concat "" ["("; mc0; " ("; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1); "))"])
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs = (fun mc0 mc1 mc2 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__297, dtb__298) -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__299, dtb__300) -> (match dtb__299 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__301, dtb__302) -> (if dtb__297 then (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__302) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc0; ": runtime field marked erased"]))) else ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__298) dtb__300)) (fun ts -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__301, dtb__302)), ts))))))) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__302) then (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__298) dtb__300) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__298) (Base_dList.C_Base_dList_dList_Base_dList_dCons ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__301, dtb__302)), dtb__300)))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if dtb__297 then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc0; ": application has fewer arguments than its shape"]))) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__298) Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__303, dtb__304) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc0; ": application has more arguments than its shape"])))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (Base_dList.C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dnatChainNext = (fun n -> (if (n >= 4611686018427387903) then 4611686018427387903 else (n + 1)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dnatChainValue = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__305, dtb__306) -> (if (dtb__305 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match dtb__306 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (dtb__305 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__307, dtb__308) -> (match dtb__307 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__309, dtb__310) -> (match dtb__308 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dnatChainValue dtb__309) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__311) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dCodegen_dTerm_dnatChainNext dtb__311)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) dtb__306) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__312, dtb__313) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__312) = "") then true else (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt dtb__313))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> (String.concat "" [mc0; " ("; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1); ")"])
))

let v_Vuna_dCompiler_dCodegen_dTerm_disNatCtorName = (fun name -> (if (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then true else (name = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__314, dtb__315) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__314) = "") then (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors dtb__315) else ((fun name -> (if (v_Vuna_dCompiler_dCodegen_dTerm_disNatCtorName name) then (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors dtb__315) else false)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__314)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseHasCtor = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__316, dtb__317) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__316) = "") then (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseHasCtor dtb__317) else true)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseApplies = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> (if (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors mc0) then (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseHasCtor mc0) else false)
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__318, dtb__319) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__318) = mc0) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__318)) else ((v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy mc0) dtb__319))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindCatchAllAlt = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__320, dtb__321) -> (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__320) = "") then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__320)) else (v_Vuna_dCompiler_dCodegen_dTerm_dfindCatchAllAlt dtb__321))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel = (fun fuel st binders t -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__322, dtb__323) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unbound runtime variable"))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__324) -> (match dtb__324 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__325, dtb__326) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__326) then ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelBindingRuntime (dtb__322))) dtb__322) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__325, st)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__323) binders))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__327) -> ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef st) dtb__327)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__328) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__328), st))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__329) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__329), st))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__330) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dboolText dtb__330), st))))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__331, dtb__332, dtb__333) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) dtb__331)) (fun pc -> (match pc with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__334, dtb__335) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) dtb__335) binders) dtb__332)) (fun pt -> (match pt with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__336, dtb__337) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) dtb__337) binders) dtb__333)) (fun pe -> (match pe with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__338, dtb__339) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(if "; dtb__334; " then "; dtb__336; " else "; dtb__338; ")"]), dtb__339))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__340, dtb__341, dtb__342) -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel (fuel - 1)) st) binders) dtb__340) dtb__341) dtb__342)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__343, dtb__344, dtb__345) -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel (fuel - 1)) st) binders) dtb__343) dtb__344) dtb__345)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__346, dtb__347) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel (fuel - 1)) st) binders) dtb__346) dtb__347)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__348, dtb__349) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel (fuel - 1)) st) binders) dtb__348) dtb__349)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__350, dtb__351, dtb__352, dtb__353, dtb__354) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__355) -> (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__356) -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dUnsolvedMetavarRuntime ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__356)))) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__356))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel = (fun fuel st binders name rig body -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match (v_Vuna_dCompiler_dCodegen_dTerm_dcollectLamChain (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, body))) with
  | C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain (dtb__357, dtb__358) -> ((fun env -> ((fun names -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) env) dtb__358)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__359, dtb__360) -> (match names with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__359, dtb__360))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(fun "; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " ") names); " -> "; dtb__359; ")"]), dtb__360))))
)
  | _ -> failwith "DT: impossible branch"
)))) ((Base_dList.v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dTerm_dlamParamName) dtb__357))) ((Base_dList.v_Base_dList_dappend (Base_dList.v_Base_dList_dreverse ((Base_dList.v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dTerm_dlamParamPair) dtb__357))) binders))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel = (fun fuel st binders f a rig -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) f) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenAppOptimizedFuel (fuel - 1)) st) binders) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (f, a, rig)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__361) -> (match dtb__361 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__362, dtb__363) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel (fuel - 1)) st) binders) dtb__362) dtb__363)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (f, a, rig)))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenAppOptimizedFuel = (fun fuel st binders t -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match (v_Vuna_dCompiler_dCodegen_dTerm_dflattenConcatChain t) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__364) -> (if ((Base_dList.v_Base_dList_dlength dtb__364) >= 3) then ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartsFuel (fuel - 1)) st) binders) dtb__364) else ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFuel fuel) st) binders) t))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFuel fuel) st) binders) t)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFuel = (fun fuel st binders t -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match t with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__365, dtb__366, dtb__367) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFallback (fuel - 1)) st) binders) dtb__365) dtb__366) dtb__367)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__368) -> (match dtb__368 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__369, dtb__370) -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineArityMatches dtb__369) dtb__370) then (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineAppFuel (fuel - 1)) st) binders) dtb__369) dtb__370) else ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFallback (fuel - 1)) st) binders) dtb__365) dtb__366) dtb__367))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dTerm_dflattenIntrinsicApp t))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: genPlainAppFuel expects an application"))
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFallback = (fun fuel st binders f a rig -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) f)) (fun pf -> (match pf with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__371, dtb__372) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) dtb__372) binders) a)) (fun pa -> (match pa with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__373, dtb__374) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["("; dtb__371; " "; dtb__373; ")"]), dtb__374))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineAppFuel = (fun fuel st binders name args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineArgsFuel (fuel - 1)) st) binders) args)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__375, dtb__376) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineText name) dtb__375) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__377) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__377, dtb__376))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: no inline text for builtin `"; name; "`"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineArgsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__378, dtb__379) -> (match dtb__378 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__380, dtb__381) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__381) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erased argument in inlined builtin application")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (mc0 - 1)) mc1) mc2) dtb__380)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__382, dtb__383) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineArgsFuel (mc0 - 1)) dtb__383) mc2) dtb__379)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__384, dtb__385) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__382, dtb__384)), dtb__385))))
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
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__386, dtb__387) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(String.concat \"\" ["; ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "; ") dtb__386); "])"]), dtb__387))))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartTexts = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__388, dtb__389) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (mc0 - 1)) mc1) mc2) dtb__388)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__390, dtb__391) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartTexts (mc0 - 1)) dtb__391) mc2) dtb__389)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__392, dtb__393) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__390, dtb__392)), dtb__393))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc1)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__394, dtb__395) -> (match dtb__394 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__396, dtb__397) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (mc0 - 1)) mc1) mc2) dtb__396)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__398, dtb__399) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel (mc0 - 1)) dtb__399) mc2) dtb__395)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__400, dtb__401) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__398, dtb__400)), dtb__401))))
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
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__402) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__402), st))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppNonChainFuel fuel) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppNonChainFuel = (fun fuel st binders c args -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs c) Base_dList.C_Base_dList_dList_Base_dList_dNil) args) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__403) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__403))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__404) -> (match dtb__404 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("0", st))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat Zero applied to arguments"))
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then (match (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs c) (Base_dList.C_Base_dList_dList_Base_dList_dCons (true, Base_dList.C_Base_dList_dList_Base_dList_dNil))) args) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__405) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__405))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__406) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel (fuel - 1)) st) binders) dtb__406)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__407, dtb__408) -> (match dtb__407 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__409, dtb__410) -> (match dtb__410 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(bi_natSucc "; dtb__409; ")"]), dtb__408))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat Succ must have exactly one runtime argument"))
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat Succ must have exactly one runtime argument"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (match ((Base_dList.v_Base_dList_dlookupPair c) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__411, dtb__412, dtb__413, dtb__414, dtb__415, dtb__416) -> dtb__412
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: unknown constructor " ^ c)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__417) -> (match ((Base_dList.v_Base_dList_dlookupPair c) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__418, dtb__419, dtb__420, dtb__421, dtb__422, dtb__423) -> dtb__420
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: no shape for constructor " ^ c)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__424) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs c) dtb__424) args)) (fun runtimeArgs -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel (fuel - 1)) st) binders) runtimeArgs)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__425, dtb__426) -> ((fun r -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dTerm_dconAppText (Base_dPair.v_Base_dPair_dfirstOf r)) dtb__425), (Base_dPair.v_Base_dPair_dsecondOf r)))))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef dtb__426) dtb__417) c))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel = (fun fuel st outer alt -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if ((Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then ((fun bound -> ((fun patText -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__427, dtb__428) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["  | "; patText; " -> "; dtb__427; "\n"]), dtb__428))))
  | _ -> failwith "DT: impossible branch"
)))) (match (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> "_"
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__429, dtb__430) -> dtb__429
  | _ -> failwith "DT: impossible branch"
))) (((v_Vuna_dCompiler_dCodegen_dTerm_daltEnv st) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) else (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__431, dtb__432, dtb__433, dtb__434, dtb__435, dtb__436) -> dtb__432
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: unknown constructor " ^ (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__437) -> (match ((Base_dList.v_Base_dList_dlookupPair (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__438, dtb__439, dtb__440, dtb__441, dtb__442, dtb__443) -> dtb__440
  | _ -> failwith "DT: impossible branch"
)) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: no shape for constructor " ^ (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__444) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked st) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__444)) (fun bound -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__445, dtb__446) -> ((fun r -> ((fun patText -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["  | "; patText; " -> "; dtb__445; "\n"]), (Base_dPair.v_Base_dPair_dsecondOf r)))))) ((v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText (Base_dPair.v_Base_dPair_dfirstOf r)) (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound)))) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenCtorRef dtb__446) dtb__437) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__447, dtb__448) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel (mc0 - 1)) mc1) mc2) dtb__447)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__449, dtb__450) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel (mc0 - 1)) dtb__450) mc2) dtb__448)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__451, dtb__452) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((dtb__449 ^ dtb__451), dtb__452))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", mc1)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAltBodyFuel = (fun fuel st outer alt bindExpr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((fun bound -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__453, dtb__454) -> (match (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound) with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__453, dtb__454))))
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__455, dtb__456) -> (match dtb__456 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match bindExpr with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__457) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(let "; dtb__455; " = "; dtb__457; " in "; dtb__453; ")"]), dtb__454))))
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
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__458, dtb__459) -> ((fun fresh -> ((fun sc -> ((fun st2 -> ((fun zeroAlt -> ((fun succAlt -> ((fun catchAlt -> ((fun predExpr -> (((((((((v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseBranchesFuel (fuel - 1)) st2) binders) zeroAlt) succAlt) catchAlt) sc) dtb__458) predExpr)) (String.concat "" ["("; sc; " - 1)"]))) (v_Vuna_dCompiler_dCodegen_dTerm_dfindCatchAllAlt alts))) ((v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) alts))) ((v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) alts))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext dtb__459) (fresh + 1)))) ("dtnat__" ^ (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext dtb__459))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseBranchesFuel = (fun fuel st binders zeroAlt succAlt catchAlt sc scrutText predExpr -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((fun impossible -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_dnatAltTextFuel (fuel - 1)) st) binders) zeroAlt) Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) (fun pz -> (match pz with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__460, dtb__461) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_dnatAltTextFuel (fuel - 1)) dtb__461) binders) succAlt) (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (predExpr)))) (fun ps -> (match ps with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__462, dtb__463) -> ((Base_dResult.v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_dnatAltTextFuel (fuel - 1)) dtb__463) binders) catchAlt) (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (sc)))) (fun pc -> (match pc with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__464, dtb__465) -> ((fun trueText -> ((fun falseText -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(let "; sc; " = "; scrutText; " in (if "; sc; " = 0 then "; trueText; " else "; falseText; "))"]), dtb__465))))) (match succAlt with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__466) -> dtb__462
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match catchAlt with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__467) -> dtb__464
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> impossible
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) (match zeroAlt with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__468) -> dtb__460
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match catchAlt with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__469) -> dtb__464
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
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__470) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAltBodyFuel mc0) mc1) mc2) dtb__470) mc4)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("", mc1))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel = (fun fuel st binders scrut alts -> (if (fuel <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseApplies alts) then (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatCaseFuel (fuel - 1)) st) binders) scrut) alts) else ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) scrut)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__471, dtb__472) -> ((Base_dResult.v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel (fuel - 1)) dtb__472) binders) alts)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__473, dtb__474) -> ((fun fallback -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(match "; dtb__471; " with\n"; dtb__473; fallback; ")"]), dtb__474))))) (if (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt alts) then "" else "  | _ -> failwith \"DT: impossible branch\"\n"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__475) -> (match dtb__475 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__476, dtb__477) -> (if (dtb__476 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("int")) else (if (dtb__476 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("string")) else (if (dtb__476 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ("bool")) else (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: extern type is not basic: " ^ dtb__476))))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern type is not a global type"))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern type is not basic"))
))

let v_Vuna_dCompiler_dCodegen_dTerm_dexternDomText = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__478) -> (match dtb__478 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__479, dtb__480) -> (if (dtb__479 = "Array") then (match dtb__480 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__481, dtb__482) -> (match dtb__482 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText dtb__481)) (fun e -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" ["("; e; " array)"])))))
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern Array needs one type argument"))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern Array needs one type argument"))
) else (if (dtb__479 = "Array") then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern Array needs one type argument")) else (v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText mc0)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText mc0)
)
  | _ -> (v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText mc0)
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dexternTyText = (fun mc0 mc1 mc2 -> (match mc2 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__483, dtb__484, dtb__485, dtb__486, dtb__487) -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern type is too deep")) else (if dtb__484 then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern has an implicit parameter")) else ((Base_dResult.v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dTerm_dexternDomText dtb__486)) (fun domText -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dexternTyText (mc0 - 1)) (mc1 + 1)) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__487) (Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__483, mc1, Base_dList.C_Base_dList_dList_Base_dList_dNil))))))) (fun resText -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" ["("; domText; ") -> "; resText])))))))))
  | _ -> (if (mc0 <= 0) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern type is too deep")) else (v_Vuna_dCompiler_dCodegen_dTerm_dexternDomText mc2))
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenExternTy = (fun ty -> (((v_Vuna_dCompiler_dCodegen_dTerm_dexternTyText 64) 0) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) ty)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__488, dtb__489) -> (match dtb__489 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> ((Base_dList.v_Base_dList_dmemName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__488)) ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf mc0) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__488)))
  | _ -> true
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__490, dtb__491) -> true
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__492, dtb__493, dtb__494) -> (if (Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__493) then (v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed dtb__494) else true)
  | _ -> false
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__495, dtb__496) -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__495) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__497) -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__497) = 0) then (if (v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed dtb__497) then (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue dtb__496) else (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__495)))) else (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue dtb__496))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dioResultTy = (fun mc0 -> (match mc0 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__498, dtb__499, dtb__500) -> (match dtb__498 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__501) -> (if (dtb__501 = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dioFamilyName) then (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__499)) else Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCodegen_dTerm_dfirstCtorOf = (fun d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d) with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__502, dtb__503) -> (Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__502)))))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf = (fun mc0 -> (match mc0 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__504, dtb__505) -> (if ((Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__504) = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dioFamilyName) then (v_Vuna_dCompiler_dCodegen_dTerm_dfirstCtorOf dtb__504) else (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf dtb__505))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr = (Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainReturnType)

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName = (fun g -> (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("string_of_int", "int")))) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("string_of_int", "int")))) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_string", "string")))) else (if (g = Vuna_dCompiler_dIntrinsics.v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_bool", "bool")))) else v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr)))))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShow = (fun table tyTerm -> (match ((((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_dforce (Base_dHashMap.v_Base_dHashMap_dfromList table)) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) Vuna_dCompiler_dCore_dTerm.v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((Vuna_dCompiler_dCore_dEval.v_Vuna_dCompiler_dCore_dEval_deval Base_dList.C_Base_dList_dList_Base_dList_dNil) tyTerm)) with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__506) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Vuna_dCompiler_dCore_dTerm.C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__507, dtb__508) -> (match dtb__508 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName dtb__507)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)) dtb__506)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook = (fun bodyText table tyTerm mainExpr printResult -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dmainShow table) tyTerm)) (fun showPair -> (match showPair with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__509, dtb__510) -> ((fun hook -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" [bodyText; "\n"; hook])))) (if printResult then (String.concat "" ["let () = print_endline ("; dtb__509; " ("; mainExpr; "))\n"]) else (String.concat "" ["let () = ignore ("; mainExpr; ")\n"])))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dTerm_dioRunText = (fun qc program mainRef -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (mainRef, ""))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__511) -> (match dtb__511 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__512, dtb__513) -> ((fun p -> (Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["match "; mainRef; " with "; (Base_dPair.v_Base_dPair_dfirstOf p); " f -> f 0"]), (Base_dPair.v_Base_dPair_dsecondOf p)))) (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dqualCtorText qc) dtb__512) dtb__513))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf (Base_dPair.v_Base_dPair_dfirstOf program))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef = (fun st d -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__514) -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dgenExternTy (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)) with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__515) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) ^ dtb__515)))
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__516) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["external "; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)); " : "; dtb__516; " = "; (Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__514)]), st))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__517) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk (dtb__518) -> (match dtb__518 with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__519, dtb__520) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" [(Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)); " = "; dtb__519]), dtb__520))))
  | _ -> failwith "DT: impossible branch"
)
  | Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr (dtb__521) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) ^ dtb__521)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) Base_dList.C_Base_dList_dList_Base_dList_dNil) dtb__517))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dErr ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) ^ "DT: internal: axiom reached runtime code generation (partition must erase it)")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies = (fun mc0 mc1 -> (match mc1 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__522, dtb__523) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef mc0) dtb__522)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__524, dtb__525) -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies dtb__525) dtb__523)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__526, dtb__527) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__524, dtb__526)), dtb__527))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (Base_dList.C_Base_dList_dList_Base_dList_dNil, mc0))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet = (fun st group isRec -> ((Base_dResult.v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies st) group)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__528, dtb__529) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__530, dtb__531) -> (match dtb__531 with
  | Base_dList.C_Base_dList_dList_Base_dList_dNil -> (match (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern dtb__530) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__532) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\n") dtb__528), dtb__529))))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((if isRec then "let rec " else "let ") ^ ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__528)), dtb__529))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((if isRec then "let rec " else "let ") ^ ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__528)), dtb__529))))
)
  | _ -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (((if isRec then "let rec " else "let ") ^ ((Vuna_dCompiler_dCodegen_dDecl.v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__528)), dtb__529))))
)) group)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup = (fun adj st group -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec adj) group) then (match (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue group) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__533) -> (match ((Vuna_dCompiler_dCodegen_dErase.v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef dtb__533) group) with
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__534) -> ((((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt (Vuna_dCompiler_dElab_dTypes.v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__534)) dtb__533) (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (dtb__533))) (Base_dVec.C_Base_dVec_dVec_Base_dVec_dVCons (dtb__533, Base_dVec.C_Base_dVec_dVec_Base_dVec_dVNil)))
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((Vuna_dCompiler_dDiagnostics_dCg.v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (Vuna_dCompiler_dDiagnostics_dCg.C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (dtb__533))) dtb__533)
  | _ -> failwith "DT: impossible branch"
)
  | Base_dMaybe.C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet st) group) true)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet st) group) false)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups = (fun mc0 mc1 mc2 -> (match mc2 with
  | Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__535, dtb__536) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup mc0) mc1) dtb__535)) (fun p -> (match p with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__537, dtb__538) -> ((Base_dResult.v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups mc0) dtb__538) dtb__536)) (fun q -> (match q with
  | Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair (dtb__539, dtb__540) -> (Base_dResult.C_Base_dResult_dResult_Base_dResult_dOk ((Base_dPair.C_Base_dPair_dPair_Base_dPair_dPair ((Base_dList.C_Base_dList_dList_Base_dList_dCons (dtb__537, dtb__539)), dtb__540))))
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
