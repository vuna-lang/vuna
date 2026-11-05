open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dInt
open Base_dShow
open Base_dNat
open Base_dList
open Base_dResult
open Base_dString
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Base_dArray
open Base_dHashMap
open Vuna_dCompiler_dDebug
open Base_dVec
open Vuna_dCompiler_dDiagnostics_dCommon
open Vuna_dCompiler_dDiagnostics_dCg
open Vuna_dCompiler_dDiagnostics_dTc
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dFixity
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
open Base_dIntMap
open Vuna_dCompiler_dCore_dTerm
open Vuna_dCompiler_dCore_dEval
open Vuna_dCompiler_dCore_dConv
open Vuna_dCompiler_dCore
open Vuna_dCompiler_dElab_dTypes
open Vuna_dCompiler_dElab_dPrelude
open Vuna_dCompiler_dElab_dSig
open Vuna_dCompiler_dElab_dMeta
open Vuna_dCompiler_dElab_dCase
open Vuna_dCompiler_dElab_dDict
open Vuna_dCompiler_dElab_dMatch
open Vuna_dCompiler_dElab_dTerm_dSupport
open Vuna_dCompiler_dElab_dTerm_dImpl
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dInstName
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination_dMeasure
open Vuna_dCompiler_dElab_dTermination_dScc
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
open Vuna_dCompiler_dCodegen_dErase
type t_Vuna_dCompiler_dCodegen_dTerm_dGenSt = C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt of (string t_Base_dList_dList) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * ((string, bool t_Base_dList_dList) t_Base_dPair_dPair t_Base_dList_dList) * (int)
and t_Vuna_dCompiler_dCodegen_dTerm_dAltEnv = C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv of ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dCodegen_dTerm_dGenSt)
and t_Vuna_dCompiler_dCodegen_dTerm_dLamChain = C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain of ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (t_Vuna_dCompiler_dCore_dTerm_dTerm)

let v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime = (String.concat "" ["let dtp_print s = print_string s; flush stdout; String.length s\n"; "let dtp_readFile path =\n  try\n    let ch = open_in_bin path in\n    Fun.protect ~finally:(fun () -> close_in_noerr ch)\n      (fun () -> really_input_string ch (in_channel_length ch))\n  with Sys_error msg -> failwith (\"readFile: \" ^ msg)\n"; "let dtp_writeFile path contents =\n  try\n    let ch = open_out_bin path in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch)\n      (fun () -> output_string ch contents);\n    String.length contents\n  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)\n"; "let dtp_getArgs () =\n  let argv = Sys.argv in\n  let n = Array.length argv in\n  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))\n"; "let dtp_readLine () = try input_line stdin with End_of_file -> \"\"\n"; "let dtp_readBytes n =\n  if n <= 0 then \"\"\n  else\n    let b = Bytes.create n in\n    let k = try input stdin b 0 n with _ -> 0 in\n    if k <= 0 then \"\" else Bytes.sub_string b 0 k\n"; "let dtp_readDir path =\n  try List.sort compare (Array.to_list (Sys.readdir path))\n  with Sys_error msg -> failwith (\"readDir: \" ^ msg)\n"; "let dtp_isDirectory path =\n  try Sys.is_directory path with Sys_error msg -> failwith (\"isDirectory: \" ^ msg)\n"; "let dtp_makeDir path =\n  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))\n  with Sys_error msg -> failwith (\"makeDir: \" ^ msg)\n"; "let dtp_removeFile path =\n  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)\n  with Sys_error msg -> failwith (\"removeFile: \" ^ msg)\n"; "let dtp_fileExists path = Sys.file_exists path\n"; "let dtp_fileMtime path =\n  try int_of_float (Unix.stat path).Unix.st_mtime with _ -> 0\n"; "let dtp_fileSize path =\n  try (Unix.stat path).Unix.st_size with _ -> 0\n"; "let dtp_timeUs () = int_of_float (Unix.gettimeofday () *. 1000000.0)\n"; "let dtp_getenv k = try Sys.getenv k with Not_found -> \"\"\n"; "let dtp_getcwd () = try Sys.getcwd () with _ -> \".\"\n"; "let dtp_execPath () = try Unix.readlink \"/proc/self/exe\" with _ -> Sys.executable_name\n"; "let dtp_arraySet (a : 'a array) (i : int) (v : 'a) =\n  let b = Array.copy a in\n  Array.set b i v; b\n"; "let dtp_strHash (s : string) =\n  let h = ref 0 in\n  String.iter (fun c -> h := ((!h * 33) + Char.code c) land 1023) s;\n  !h\n"; "let dtp_strAt (s : string) (i : int) = if i < 0 || i >= String.length s then -1 else Char.code s.[i]\n"; "let dtp_substring start len s =\n  let n = String.length s in\n  let st = if start < 0 then 0 else if start > n then n else start in\n  let ln = if len < 0 then 0 else if st + len > n then n - st else len in\n  String.sub s st ln\n"; "let dtp_marshal (v : 'a) : string = Marshal.to_string v []\n"; "let dtp_unmarshal (s : string) : 'a = Marshal.from_string s 0\n"; "let dtp_exit n = exit n\n"; "let dtp_runIn dir args =\n  let quote s = Filename.quote s in\n  let cmd = String.concat \" \" (List.map quote args) in\n  let old = Sys.getcwd () in\n  Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)\n"; "let dtp_spawn (args : string list) : int =\n  let prog = Sys.executable_name in\n  Unix.create_process prog (Array.of_list (prog :: args)) Unix.stdin Unix.stdout Unix.stderr\n"; "let dtp_wait (pid : int) : int =\n  let (_, st) = Unix.waitpid [] pid in\n  match st with Unix.WEXITED c -> c | _ -> 1\n"])

let v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime = (String.concat "" ["let () =\n"; "  let c = Gc.get () in\n"; "  Gc.set { c with minor_heap_size = 16 * 1024 * 1024; space_overhead = 200 }\n"; "let () =\n"; "  if (try Sys.getenv \"VN_PERF_STATS\" with Not_found -> \"\") <> \"\" then\n"; "    at_exit (fun () ->\n"; "      let s = Gc.quick_stat () in\n"; "      Printf.eprintf \"VN_PERF minor_words=%.0f major_words=%.0f minor_collections=%d major_collections=%d top_heap_words=%d\\n\"\n"; "        s.Gc.minor_words s.Gc.major_words s.Gc.minor_collections s.Gc.major_collections s.Gc.top_heap_words)\n"; "let bi_add a b = a + b\n"; "let bi_sub a b = a - b\n"; "let bi_mul a b = a * b\n"; "let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\n"; "let bi_eq_int (a : int) (b : int) = a = b\n"; "let bi_neq_int (a : int) (b : int) = a <> b\n"; "let bi_eq_str (a : string) (b : string) = a = b\n"; "let bi_neq_str (a : string) (b : string) = a <> b\n"; "let bi_strFromInt (n : int) = string_of_int n\n"; "let bi_strLength (s : string) = String.length s\n"; "let bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])\n"; "let bi_strPack (cs : int list) =\n  let a = Array.of_list cs in\n  String.init (Array.length a) (fun i -> Char.chr a.(i))\n"; "let bi_lt_int (a : int) (b : int) = a < b\n"; "let bi_le_int (a : int) (b : int) = a <= b\n"; "let bi_gt_int (a : int) (b : int) = a > b\n"; "let bi_ge_int (a : int) (b : int) = a >= b\n"; "let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0\n"; "let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0\n"; "let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0\n"; "let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0\n"; "let bi_concat a b = a ^ b\n"; "let bi_and a b = a && b\n"; "let bi_or a b = a || b\n"; "let bi_natSucc (n : int) = if n >= max_int then max_int else n + 1\n"; "let bi_natAdd (a : int) (b : int) = if a > max_int - b then max_int else a + b\n"; "let bi_natSub (a : int) (b : int) = if a <= b then 0 else a - b\n"; "let bi_natMul (a : int) (b : int) =\n  if a <= 0 || b <= 0 then 0 else if a > max_int / b then max_int else a * b\n"; "let bi_natDiv (a : int) (b : int) = if b = 0 then failwith \"division by zero\" else a / b\n"; "let bi_natToInt (n : int) = n\n"; "let bi_natFromInt (n : int) = if n <= 0 then 0 else n\n"; "let dt_show_bool b = if b then \"True\" else \"False\"\n"; "let dt_show_string s =\n"; "  let buf = Buffer.create 16 in\n"; "  Buffer.add_char buf (Char.chr 34);\n"; "  String.iter (fun c ->\n"; "    let n = Char.code c in\n"; "    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))\n"; "    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))\n"; "    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"n\")\n"; "    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"t\")\n"; "    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"r\")\n"; "    else Buffer.add_char buf c) s;\n"; "  Buffer.add_char buf (Char.chr 34);\n"; "  Buffer.contents buf\n"; v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime])

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor = (fun mc0 mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__0) = mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0)) else ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor dtb__1) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__2) = v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__2)) else (v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData dtb__3))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge = (fun datas -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__4) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__4)) v_Vuna_dCompiler_dIntrinsics_dlistNilCtor) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__5) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__4)) v_Vuna_dCompiler_dIntrinsics_dlistConsCtor) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6) -> ((fun famName -> ((fun nilMl -> ((fun consMl -> (String.concat "" ["\nlet dtp_unpack (s : string) =\n"; "  let cs = List.init (String.length s) (fun i -> Char.code s.[i]) in\n"; "  List.fold_right (fun x acc -> "; consMl; " (x, acc)) cs "; nilMl; "\n"; "let dtp_pack xs =\n"; "  let rec to_list xs = match xs with "; nilMl; " -> [] | "; consMl; " (x, rest) -> x :: to_list rest in\n"; "  let cs = Array.of_list (to_list xs) in\n"; "  String.init (Array.length cs) (fun i -> Char.chr cs.(i))\n"; "\nlet dtp_listOf xs = List.fold_right (fun x acc -> "; consMl; " (x, acc)) xs "; nilMl; "\n"; "let dtp_ocamlOf xs =\n"; "  let rec go l = match l with "; nilMl; " -> [] | "; consMl; " (x, rest) -> x :: go rest in\n"; "  go xs\n"; "\nlet dtp_concatMany xs = String.concat \"\" (dtp_ocamlOf xs)\n"; "\nlet dtp_substTemplate tmpl xs =\n"; "  let args = Array.of_list (dtp_ocamlOf xs) in\n"; "  let n = String.length tmpl and na = Array.length args in\n"; "  let buf = Buffer.create (n + 32) in\n"; "  let rec go i =\n"; "    if i >= n then ()\n"; "    else if tmpl.[i] = '<' then begin\n"; "      let j = ref (i + 1) and k = ref 0 in\n"; "      while !j < n && tmpl.[!j] >= '0' && tmpl.[!j] <= '9' do\n"; "        k := !k * 10 + (Char.code tmpl.[!j] - 48); incr j\n"; "      done;\n"; "      if !j < n && tmpl.[!j] = '>' && !j > i + 1 then begin\n"; "        (if !k < na then Buffer.add_string buf args.(!k)\n"; "         else Buffer.add_string buf (String.sub tmpl i (!j - i + 1)));\n"; "        go (!j + 1)\n"; "      end else (Buffer.add_char buf '<'; go (i + 1))\n"; "    end else (Buffer.add_char buf tmpl.[i]; go (i + 1))\n"; "  in go 0; Buffer.contents buf\n"])) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName famName) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__6)))) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName famName) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__5)))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameGo = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> (match dtb__7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__9, dtb__10) -> (if (dtb__10 = v_Vuna_dCompiler_dIntrinsics_dioFamilyName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__10) dtb__9))) else (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameGo dtb__8))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameOf = (fun st -> (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameGo (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__11, dtb__12, dtb__13, dtb__14) -> dtb__12
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames = (C_Base_dList_dList_Base_dList_dCons ("dtio_0", (C_Base_dList_dList_Base_dList_dCons ("dtio_1", (C_Base_dList_dList_Base_dList_dCons ("dtio_2", (C_Base_dList_dList_Base_dList_dCons ("dtio_3", C_Base_dList_dList_Base_dList_dNil))))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames = (fun n names -> (if (n <= 0) then C_Base_dList_dList_Base_dList_dNil else (match names with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__15, dtb__16) -> (C_Base_dList_dList_Base_dList_dCons (dtb__15, ((v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames (n - 1)) dtb__16)))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dioPrimLam = (fun ctor rt arity -> (if (arity = 0) then (String.concat "" ["("; ctor; " (fun _ -> "; rt; "))"]) else ((fun argText -> (String.concat "" ["(fun "; argText; " -> "; ctor; " (fun _ -> "; rt; " "; argText; "))"])) ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " ") ((v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames arity) v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames)))))

let v_Vuna_dCompiler_dCodegen_dTerm_dioPrimText = (fun st name i -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameOf st) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dEffectPrimRequiresIO (name))) name)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__17) -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dCodegen_dTerm_dioPrimLam dtb__17) (match i with
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Vuna_dCompiler_dIntrinsics_dIntrinsic (dtb__18, dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> dtb__22
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dIntrinsics_dintrinsicArity i))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef = (fun st name -> (if (name = v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("0", st)))) else (if (name = v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_natSucc", st)))) else (match ((v_Base_dList_dlookupPair name) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__24, dtb__25, dtb__26, dtb__27) -> dtb__25
  | _ -> failwith "DT: impossible branch"
)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__28) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__28) name), st))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__29) -> (if (v_Vuna_dCompiler_dIntrinsics_dintrinsicReturnsIO dtb__29) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dioPrimText st) name) dtb__29)) (fun text -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (text, st)))))) else (if (v_Vuna_dCompiler_dIntrinsics_dneedsListBridge dtb__29) then (if ((v_Base_dList_dmemName v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__30, dtb__31, dtb__32, dtb__33) -> dtb__30
  | _ -> failwith "DT: impossible branch"
)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((match dtb__29 with
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Vuna_dCompiler_dIntrinsics_dIntrinsic (dtb__34, dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> dtb__38
  | _ -> failwith "DT: impossible branch"
), st)))) else ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dListBridgeRequired (name))) name)) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((match dtb__29 with
  | C_Vuna_dCompiler_dIntrinsics_dIntrinsic_Vuna_dCompiler_dIntrinsics_dIntrinsic (dtb__40, dtb__41, dtb__42, dtb__43, dtb__44, dtb__45) -> dtb__44
  | _ -> failwith "DT: impossible branch"
), st))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name), st))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__46, dtb__47, dtb__48, dtb__49) -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext = (fun mc0 mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__50, dtb__51, dtb__52, dtb__53) -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__50, dtb__51, dtb__52, mc1))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData = (fun d -> ((v_Base_dList_dmap (fun c -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c))))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData dtb__54)) (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf dtb__55))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt = (fun datas -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas), (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf datas), (v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf datas), 0)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__56, dtb__57, dtb__58) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__57) then (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__58) else (1 + (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__58)))
  | _ -> 0
))

let v_Vuna_dCompiler_dCodegen_dTerm_daeEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__59, dtb__60, dtb__61) -> dtb__59
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daePats = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__62, dtb__63, dtb__64) -> dtb__63
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daeSt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__65, dtb__66, dtb__67) -> dtb__67
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo = (fun mc0 mc1 mc2 mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__69) -> (match dtb__68 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__70, dtb__71) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__71) then ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo mc0) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), mc1))) dtb__69) mc3) else ((fun fresh -> ((fun nm -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) (fresh + 1))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc1))) dtb__69) (C_Base_dList_dList_Base_dList_dCons (nm, mc3)))) ("dtb__" ^ (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc1, (v_Base_dList_dreverse mc3), mc0))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnv = (fun st outer tele -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo st) outer) tele) C_Base_dList_dList_Base_dList_dNil))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dcountKept = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__72, dtb__73) -> (if dtb__72 then (1 + (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__73)) else (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__73))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull = (fun mc0 mc1 mc2 mc3 mc4 mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__74, dtb__75) -> (match dtb__74 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__76, dtb__77) -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc1; ": case branch has more binders than its shape"])))
  | C_Base_dList_dList_Base_dList_dCons (dtb__78, dtb__79) -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__78) dtb__77) then (if dtb__78 then ((fun fresh -> ((fun nm -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) (fresh + 1))) mc1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc2))) dtb__75) dtb__79) (C_Base_dList_dList_Base_dList_dCons (nm, mc5)))) ("dtb__" ^ (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)) else ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull mc0) mc1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), mc2))) dtb__75) dtb__79) mc5)) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc1; ": case branch binder rig disagrees with its shape"]))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc2, (v_Base_dList_dreverse mc5), mc0))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__80, dtb__81) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc1; ": case branch has fewer binders than its shape"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept = (fun mc0 mc1 mc2 mc3 mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__82, dtb__83) -> (match dtb__82 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__84, dtb__85) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__85) then (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc1; ": kept-field branch has an erased binder"]))) else ((fun fresh -> ((fun nm -> (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) (fresh + 1))) mc1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc2))) dtb__83) (C_Base_dList_dList_Base_dList_dCons (nm, mc4)))) ("dtb__" ^ (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc2, (v_Base_dList_dreverse mc4), mc0))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked = (fun st label outer binders flags -> (if ((v_Base_dList_dlength binders) = (v_Base_dList_dlength flags)) then ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull st) label) outer) binders) flags) C_Base_dList_dList_Base_dList_dNil) else (if ((v_Base_dList_dlength binders) = (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept flags)) then (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept st) label) outer) binders) C_Base_dList_dList_Base_dList_dNil) else (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; label; ": case branch binder count matches neither full telescope nor kept fields"]))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dcollectLamChain = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__86, dtb__87, dtb__88) -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dcollectLamChain dtb__88) with
  | C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain (dtb__89, dtb__90) -> (C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__86, dtb__87)), dtb__89)), dtb__90))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain (C_Base_dList_dList_Base_dList_dNil, mc0))
))

let v_Vuna_dCompiler_dCodegen_dTerm_dlamParamPair = (fun mc0 -> (match mc0 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__91, dtb__92) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__92) then (C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)) else (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName dtb__91), C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dlamParamName = (fun mc0 -> (match mc0 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__93, dtb__94) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__94) then C_Base_dList_dList_Base_dList_dNil else (C_Base_dList_dList_Base_dList_dCons ((v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName dtb__93), C_Base_dList_dList_Base_dList_dNil)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity = (fun mc0 -> (if (mc0 = "+") then 2 else (if (mc0 = "-") then 2 else (if (mc0 = "*") then 2 else (if (mc0 = "/") then 2 else (if (mc0 = "&&") then 2 else (if (mc0 = "||") then 2 else (if (mc0 = "++") then 2 else (if (mc0 = "bi_eq_int") then 2 else (if (mc0 = "bi_neq_int") then 2 else (if (mc0 = "bi_eq_str") then 2 else (if (mc0 = "bi_neq_str") then 2 else (if (mc0 = "bi_lt_int") then 2 else (if (mc0 = "bi_le_int") then 2 else (if (mc0 = "bi_gt_int") then 2 else (if (mc0 = "bi_ge_int") then 2 else (if (mc0 = "bi_lt_generic") then 2 else (if (mc0 = "bi_le_generic") then 2 else (if (mc0 = "bi_gt_generic") then 2 else (if (mc0 = "bi_ge_generic") then 2 else (if (mc0 = "natToInt") then 1 else (if (mc0 = "natFromInt") then 1 else (if (mc0 = "natAdd") then 2 else (if (mc0 = "natSub") then 2 else (if (mc0 = "natMul") then 2 else (if (mc0 = "natDiv") then 2 else 0))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dinlineText = (fun mc0 mc1 -> (if (mc0 = "+") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__95, dtb__96) -> (match dtb__96 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__97, dtb__98) -> (match dtb__98 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__95; " + "; dtb__97; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "-") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__99, dtb__100) -> (match dtb__100 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__101, dtb__102) -> (match dtb__102 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__99; " - "; dtb__101; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "*") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__103, dtb__104) -> (match dtb__104 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__105, dtb__106) -> (match dtb__106 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__103; " * "; dtb__105; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "/") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__107, dtb__108) -> (match dtb__108 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__109, dtb__110) -> (match dtb__110 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(if "; dtb__109; " = 0 then failwith \"division by zero\" else "; dtb__107; " / "; dtb__109; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "&&") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__111, dtb__112) -> (match dtb__112 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__113, dtb__114) -> (match dtb__114 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__111; " && "; dtb__113; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "||") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__115, dtb__116) -> (match dtb__116 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__117, dtb__118) -> (match dtb__118 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__115; " || "; dtb__117; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "++") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__119, dtb__120) -> (match dtb__120 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__121, dtb__122) -> (match dtb__122 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__119; " ^ "; dtb__121; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_eq_int") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__123, dtb__124) -> (match dtb__124 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__125, dtb__126) -> (match dtb__126 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__123; " = "; dtb__125; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_neq_int") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__127, dtb__128) -> (match dtb__128 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__129, dtb__130) -> (match dtb__130 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__127; " <> "; dtb__129; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_eq_str") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__131, dtb__132) -> (match dtb__132 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__133, dtb__134) -> (match dtb__134 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__131; " = "; dtb__133; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_neq_str") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__135, dtb__136) -> (match dtb__136 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__137, dtb__138) -> (match dtb__138 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__135; " <> "; dtb__137; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_lt_int") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__139, dtb__140) -> (match dtb__140 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__141, dtb__142) -> (match dtb__142 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__139; " < "; dtb__141; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_le_int") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__143, dtb__144) -> (match dtb__144 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__145, dtb__146) -> (match dtb__146 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__143; " <= "; dtb__145; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_gt_int") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__147, dtb__148) -> (match dtb__148 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__149, dtb__150) -> (match dtb__150 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__147; " > "; dtb__149; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_ge_int") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__151, dtb__152) -> (match dtb__152 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__153, dtb__154) -> (match dtb__154 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__151; " >= "; dtb__153; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_lt_generic") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__155, dtb__156) -> (match dtb__156 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__157, dtb__158) -> (match dtb__158 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__155; " < "; dtb__157; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_le_generic") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__159, dtb__160) -> (match dtb__160 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__161, dtb__162) -> (match dtb__162 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__159; " <= "; dtb__161; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_gt_generic") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__163, dtb__164) -> (match dtb__164 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__165, dtb__166) -> (match dtb__166 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__163; " > "; dtb__165; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "bi_ge_generic") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__167, dtb__168) -> (match dtb__168 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__169, dtb__170) -> (match dtb__170 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["("; dtb__167; " >= "; dtb__169; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natToInt") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__171, dtb__172) -> (match dtb__172 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__171))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natFromInt") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__173, dtb__174) -> (match dtb__174 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natFromInt "; dtb__173; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natAdd") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__175, dtb__176) -> (match dtb__176 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__177, dtb__178) -> (match dtb__178 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natAdd "; dtb__175; " "; dtb__177; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natSub") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__179, dtb__180) -> (match dtb__180 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__181, dtb__182) -> (match dtb__182 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natSub "; dtb__179; " "; dtb__181; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natMul") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__183, dtb__184) -> (match dtb__184 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__185, dtb__186) -> (match dtb__186 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natMul "; dtb__183; " "; dtb__185; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (mc0 = "natDiv") then (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__187, dtb__188) -> (match dtb__188 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__189, dtb__190) -> (match dtb__190 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((String.concat "" ["(bi_natDiv "; dtb__187; " "; dtb__189; ")"])))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))))))))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dinlineArityMatches = (fun name args -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity name) <= 0) then false else ((v_Base_dList_dlength args) = (v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity name))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dflattenIntrinsicApp = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__191, dtb__192, dtb__193) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__193) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match dtb__191 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__194) -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineOpArity dtb__194) > 0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__194, (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__192, dtb__193)), C_Base_dList_dList_Base_dList_dNil)))))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__195) -> (match dtb__195 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__196, dtb__197) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__196, ((v_Base_dList_dappend dtb__197) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__192, dtb__193)), C_Base_dList_dList_Base_dList_dNil)))))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dTerm_dflattenIntrinsicApp dtb__191))
))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__198, dtb__199, dtb__200) -> (match dtb__198 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__201, dtb__202, dtb__203) -> (if (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__203) then true else (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__200)) then (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__201, dtb__202, dtb__203)), dtb__199, dtb__200)), C_Base_dList_dList_Base_dList_dNil)) else (match dtb__201 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__204) -> (if (dtb__204 = "++") then ((v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves dtb__202)) (v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves dtb__199)) else (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__201, dtb__202, dtb__203)), dtb__199, dtb__200)), C_Base_dList_dList_Base_dList_dNil)))
  | _ -> (C_Base_dList_dList_Base_dList_dCons ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp ((C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__201, dtb__202, dtb__203)), dtb__199, dtb__200)), C_Base_dList_dList_Base_dList_dNil))
))
  | _ -> (C_Base_dList_dList_Base_dList_dCons (mc0, C_Base_dList_dList_Base_dList_dNil))
)
  | _ -> (C_Base_dList_dList_Base_dList_dCons (mc0, C_Base_dList_dList_Base_dList_dNil))
))

let v_Vuna_dCompiler_dCodegen_dTerm_dflattenConcatChain = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__205, dtb__206, dtb__207) -> (match dtb__205 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__208, dtb__209, dtb__210) -> (if (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__210) then true else (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__207)) then C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing else (match dtb__208 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__211) -> (if (dtb__211 = "++") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves dtb__209)) (v_Vuna_dCompiler_dCodegen_dTerm_dconcatLeaves dtb__206)))) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCodegen_dTerm_dconAppText = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__212, dtb__213) -> (match dtb__213 with
  | C_Base_dList_dList_Base_dList_dNil -> (String.concat "" ["("; mc0; " ("; dtb__212; "))"])
  | _ -> (String.concat "" ["("; mc0; " ("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1); "))"])
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs = (fun mc0 mc1 mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__214, dtb__215) -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__216, dtb__217) -> (match dtb__216 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__218, dtb__219) -> (if dtb__214 then (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__219) then (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc0; ": runtime field marked erased"]))) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__215) dtb__217)) (fun ts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__218, dtb__219)), ts))))))) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__219) then (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__215) dtb__217) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__215) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__218, dtb__219)), dtb__217)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if dtb__214 then (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc0; ": application has fewer arguments than its shape"]))) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__215) C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__220, dtb__221) -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: constructor "; mc0; ": application has more arguments than its shape"])))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dnatChainNext = (fun n -> (if (n >= 4611686018427387903) then 4611686018427387903 else (n + 1)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dnatChainValue = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__222, dtb__223) -> (if (dtb__222 = v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match dtb__223 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (0))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
) else (if (dtb__222 = v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__224, dtb__225) -> (match dtb__224 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__226, dtb__227) -> (match dtb__225 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dnatChainValue dtb__226) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__228) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dCodegen_dTerm_dnatChainNext dtb__228)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)) dtb__223) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing))
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__229, dtb__230) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__229) = "") then true else (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt dtb__230))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> (String.concat "" [mc0; " ("; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1); ")"])
))

let v_Vuna_dCompiler_dCodegen_dTerm_disNatCtorName = (fun name -> (if (name = v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then true else (name = v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__231, dtb__232) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__231) = "") then (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors dtb__232) else ((fun name -> (if (v_Vuna_dCompiler_dCodegen_dTerm_disNatCtorName name) then (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors dtb__232) else false)) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__231)))
  | C_Base_dList_dList_Base_dList_dNil -> true
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseHasCtor = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__233, dtb__234) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__233) = "") then (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseHasCtor dtb__234) else true)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseApplies = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> (if (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseAllCtors mc0) then (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseHasCtor mc0) else false)
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__235, dtb__236) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__235) = mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__235)) else ((v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy mc0) dtb__236))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindCatchAllAlt = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__237, dtb__238) -> (if ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__237) = "") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__237)) else (v_Vuna_dCompiler_dCodegen_dTerm_dfindCatchAllAlt dtb__238))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel = (fun fuel st binders t -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__239, dtb__240) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unbound runtime variable"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__241) -> (match dtb__241 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__242, dtb__243) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__243) then ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelBindingRuntime (dtb__239))) dtb__239) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__242, st)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__240) binders))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__244) -> ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef st) dtb__244)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__245) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__245), st))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__246) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__246), st))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__247) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dboolText dtb__247), st))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__248, dtb__249, dtb__250) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) dtb__248)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__251, dtb__252) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) dtb__252) binders) dtb__249)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__253, dtb__254) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) dtb__254) binders) dtb__250)) (fun pe -> (match pe with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__255, dtb__256) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(if "; dtb__251; " then "; dtb__253; " else "; dtb__255; ")"]), dtb__256))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__257, dtb__258, dtb__259) -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel (fuel - 1)) st) binders) dtb__257) dtb__258) dtb__259)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__260, dtb__261, dtb__262) -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel (fuel - 1)) st) binders) dtb__260) dtb__261) dtb__262)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__263, dtb__264) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel (fuel - 1)) st) binders) dtb__263) dtb__264)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__265, dtb__266) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel (fuel - 1)) st) binders) dtb__265) dtb__266)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__267, dtb__268, dtb__269, dtb__270, dtb__271) -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__272) -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__273) -> ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dUnsolvedMetavarRuntime ((v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__273)))) (v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__273))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel = (fun fuel st binders name rig body -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match (v_Vuna_dCompiler_dCodegen_dTerm_dcollectLamChain (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (name, rig, body))) with
  | C_Vuna_dCompiler_dCodegen_dTerm_dLamChain_Vuna_dCompiler_dCodegen_dTerm_dLamChain (dtb__274, dtb__275) -> ((fun env -> ((fun names -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) env) dtb__275)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__276, dtb__277) -> (match names with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__276, dtb__277))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(fun "; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " ") names); " -> "; dtb__276; ")"]), dtb__277))))
)
  | _ -> failwith "DT: impossible branch"
)))) ((v_Base_dList_dconcatMap v_Vuna_dCompiler_dCodegen_dTerm_dlamParamName) dtb__274))) ((v_Base_dList_dappend (v_Base_dList_dreverse ((v_Base_dList_dmap v_Vuna_dCompiler_dCodegen_dTerm_dlamParamPair) dtb__274))) binders))
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel = (fun fuel st binders f a rig -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) f) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenAppOptimizedFuel (fuel - 1)) st) binders) (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (f, a, rig)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__278) -> (match dtb__278 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__279, dtb__280) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel (fuel - 1)) st) binders) dtb__279) dtb__280)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (f, a, rig)))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenAppOptimizedFuel = (fun fuel st binders t -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match (v_Vuna_dCompiler_dCodegen_dTerm_dflattenConcatChain t) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__281) -> (if ((v_Base_dList_dlength dtb__281) >= 3) then ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartsFuel (fuel - 1)) st) binders) dtb__281) else ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFuel fuel) st) binders) t))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFuel fuel) st) binders) t)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFuel = (fun fuel st binders t -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__282, dtb__283, dtb__284) -> ((fun nd_uscrut7 -> (match nd_uscrut7 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFallback (fuel - 1)) st) binders) dtb__282) dtb__283) dtb__284)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__285) -> (match dtb__285 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__286, dtb__287) -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineArityMatches dtb__286) dtb__287) then (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineAppFuel (fuel - 1)) st) binders) dtb__286) dtb__287) else ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFallback (fuel - 1)) st) binders) dtb__282) dtb__283) dtb__284))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dTerm_dflattenIntrinsicApp t))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: genPlainAppFuel expects an application"))
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenPlainAppFallback = (fun fuel st binders f a rig -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) f)) (fun pf -> (match pf with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__288, dtb__289) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) dtb__289) binders) a)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__290, dtb__291) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["("; dtb__288; " "; dtb__290; ")"]), dtb__291))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineAppFuel = (fun fuel st binders name args -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineArgsFuel (fuel - 1)) st) binders) args)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__292, dtb__293) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dinlineText name) dtb__292) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__294) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__294, dtb__293))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((String.concat "" ["DT: internal: no inline text for builtin `"; name; "`"])))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineArgsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__295, dtb__296) -> (match dtb__295 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__297, dtb__298) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__298) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: erased argument in inlined builtin application")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (mc0 - 1)) mc1) mc2) dtb__297)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__299, dtb__300) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenInlineArgsFuel (mc0 - 1)) dtb__300) mc2) dtb__296)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__301, dtb__302) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__299, dtb__301)), dtb__302))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc1)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartsFuel = (fun fuel st binders parts -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartTexts (fuel - 1)) st) binders) parts)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__303, dtb__304) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(String.concat \"\" ["; ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "; ") dtb__303); "])"]), dtb__304))))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartTexts = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__305, dtb__306) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (mc0 - 1)) mc1) mc2) dtb__305)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__307, dtb__308) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConcatPartTexts (mc0 - 1)) dtb__308) mc2) dtb__306)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__309, dtb__310) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__307, dtb__309)), dtb__310))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc1)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__311, dtb__312) -> (match dtb__311 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__313, dtb__314) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (mc0 - 1)) mc1) mc2) dtb__313)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__315, dtb__316) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel (mc0 - 1)) dtb__316) mc2) dtb__312)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__317, dtb__318) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__315, dtb__317)), dtb__318))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc1)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel = (fun fuel st binders c args -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match (v_Vuna_dCompiler_dCodegen_dTerm_dnatChainValue (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (c, args))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__319) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__319), st))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppNonChainFuel fuel) st) binders) c) args)
  | _ -> failwith "DT: impossible branch"
)))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppNonChainFuel = (fun fuel st binders c args -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (c = v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) then (match (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs c) C_Base_dList_dList_Base_dList_dNil) args) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__320) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__320))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__321) -> (match dtb__321 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("0", st))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat Zero applied to arguments"))
)
  | _ -> failwith "DT: impossible branch"
) else (if (c = v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) then (match (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs c) (C_Base_dList_dList_Base_dList_dCons (true, C_Base_dList_dList_Base_dList_dNil))) args) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__322) -> (C_Base_dResult_dResult_Base_dResult_dErr (dtb__322))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__323) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel (fuel - 1)) st) binders) dtb__323)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__324, dtb__325) -> (match dtb__324 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__326, dtb__327) -> (match dtb__327 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(bi_natSucc "; dtb__326; ")"]), dtb__325))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat Succ must have exactly one runtime argument"))
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat Succ must have exactly one runtime argument"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
) else (match ((v_Base_dList_dlookupPair c) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__328, dtb__329, dtb__330, dtb__331) -> dtb__329
  | _ -> failwith "DT: impossible branch"
)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: unknown constructor " ^ c)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__332) -> (match ((v_Base_dList_dlookupPair c) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__333, dtb__334, dtb__335, dtb__336) -> dtb__335
  | _ -> failwith "DT: impossible branch"
)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: no shape for constructor " ^ c)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__337) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs c) dtb__337) args)) (fun runtimeArgs -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel (fuel - 1)) st) binders) runtimeArgs)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__338, dtb__339) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dTerm_dconAppText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__332) c)) dtb__338), dtb__339))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel = (fun fuel st outer alt -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if ((v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt) = "") then ((fun bound -> ((fun patText -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__340, dtb__341) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["  | "; patText; " -> "; dtb__340; "\n"]), dtb__341))))
  | _ -> failwith "DT: impossible branch"
)))) (match (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound) with
  | C_Base_dList_dList_Base_dList_dNil -> "_"
  | C_Base_dList_dList_Base_dList_dCons (dtb__342, dtb__343) -> dtb__342
  | _ -> failwith "DT: impossible branch"
))) (((v_Vuna_dCompiler_dCodegen_dTerm_daltEnv st) outer) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) else (match ((v_Base_dList_dlookupPair (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__344, dtb__345, dtb__346, dtb__347) -> dtb__345
  | _ -> failwith "DT: impossible branch"
)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: unknown constructor " ^ (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__348) -> (match ((v_Base_dList_dlookupPair (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (match st with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__349, dtb__350, dtb__351, dtb__352) -> dtb__351
  | _ -> failwith "DT: impossible branch"
)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: no shape for constructor " ^ (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__353) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked st) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__353)) (fun bound -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__354, dtb__355) -> ((fun cname -> ((fun patText -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["  | "; patText; " -> "; dtb__354; "\n"]), dtb__355))))) ((v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText cname) (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound)))) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__348) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel = (fun mc0 mc1 mc2 mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__356, dtb__357) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel (mc0 - 1)) mc1) mc2) dtb__356)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__358, dtb__359) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel (mc0 - 1)) dtb__359) mc2) dtb__357)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__360, dtb__361) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((dtb__358 ^ dtb__360), dtb__361))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | C_Base_dList_dList_Base_dList_dNil -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("", mc1)))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAltBodyFuel = (fun fuel st outer alt bindExpr -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((fun bound -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__362, dtb__363) -> (match (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound) with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__362, dtb__363))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__364, dtb__365) -> (match dtb__365 with
  | C_Base_dList_dList_Base_dList_dNil -> (match bindExpr with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__366) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(let "; dtb__364; " = "; dtb__366; " in "; dtb__362; ")"]), dtb__363))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat case arm has a binder but no runtime binding"))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: Nat case arm has more than one runtime binder"))
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))) (((v_Vuna_dCompiler_dCodegen_dTerm_daltEnv st) outer) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenNatCaseFuel = (fun fuel st binders scrut alts -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) scrut)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__367, dtb__368) -> ((fun fresh -> ((fun sc -> ((fun st2 -> ((fun zeroAlt -> ((fun succAlt -> ((fun catchAlt -> ((fun predExpr -> (((((((((v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseBranchesFuel (fuel - 1)) st2) binders) zeroAlt) succAlt) catchAlt) sc) dtb__367) predExpr)) (String.concat "" ["("; sc; " - 1)"]))) (v_Vuna_dCompiler_dCodegen_dTerm_dfindCatchAllAlt alts))) ((v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy v_Vuna_dCompiler_dIntrinsics_dnatSuccCtor) alts))) ((v_Vuna_dCompiler_dCodegen_dTerm_dfindAltBy v_Vuna_dCompiler_dIntrinsics_dnatZeroCtor) alts))) ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext dtb__368) (fresh + 1)))) ("dtnat__" ^ (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext dtb__368))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseBranchesFuel = (fun fuel st binders zeroAlt succAlt catchAlt sc scrutText predExpr -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((fun impossible -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_dnatAltTextFuel (fuel - 1)) st) binders) zeroAlt) C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)) (fun pz -> (match pz with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__369, dtb__370) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_dnatAltTextFuel (fuel - 1)) dtb__370) binders) succAlt) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (predExpr)))) (fun ps -> (match ps with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__371, dtb__372) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_dnatAltTextFuel (fuel - 1)) dtb__372) binders) catchAlt) (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (sc)))) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__373, dtb__374) -> ((fun trueText -> ((fun falseText -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(let "; sc; " = "; scrutText; " in (if "; sc; " = 0 then "; trueText; " else "; falseText; "))"]), dtb__374))))) (match succAlt with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__375) -> dtb__371
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match catchAlt with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__376) -> dtb__373
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> impossible
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))) (match zeroAlt with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__377) -> dtb__369
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match catchAlt with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__378) -> dtb__373
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> impossible
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
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__379) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatAltBodyFuel mc0) mc1) mc2) dtb__379) mc4)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("", mc1))))
  | _ -> failwith "DT: impossible branch"
))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel = (fun fuel st binders scrut alts -> (if (fuel <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (v_Vuna_dCompiler_dCodegen_dTerm_dnatCaseApplies alts) then (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenNatCaseFuel (fuel - 1)) st) binders) scrut) alts) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel (fuel - 1)) st) binders) scrut)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__380, dtb__381) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel (fuel - 1)) dtb__381) binders) alts)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__382, dtb__383) -> ((fun fallback -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["(match "; dtb__380; " with\n"; dtb__382; fallback; ")"]), dtb__383))))) (if (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt alts) then "" else "  | _ -> failwith \"DT: impossible branch\"\n"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__384) -> (match dtb__384 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__385, dtb__386) -> (if (dtb__385 = v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ("int")) else (if (dtb__385 = v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ("string")) else (if (dtb__385 = v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ("bool")) else (C_Base_dResult_dResult_Base_dResult_dErr (("DT: internal: extern type is not basic: " ^ dtb__385))))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern type is not a global type"))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern type is not basic"))
))

let v_Vuna_dCompiler_dCodegen_dTerm_dexternDomText = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__387) -> (match dtb__387 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__388, dtb__389) -> (if (dtb__388 = "Array") then (match dtb__389 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__390, dtb__391) -> (match dtb__391 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText dtb__390)) (fun e -> (C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" ["("; e; " array)"])))))
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern Array needs one type argument"))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern Array needs one type argument"))
) else (if (dtb__388 = "Array") then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern Array needs one type argument")) else (v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText mc0)))
  | _ -> (v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText mc0)
)
  | _ -> (v_Vuna_dCompiler_dCodegen_dTerm_dexternBasicText mc0)
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dexternTyText = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVPi (dtb__392, dtb__393, dtb__394, dtb__395, dtb__396) -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern type is too deep")) else (if dtb__393 then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern has an implicit parameter")) else ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dTerm_dexternDomText dtb__395)) (fun domText -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dexternTyText (mc0 - 1)) (mc1 + 1)) ((v_Vuna_dCompiler_dCore_dEval_dapplyClosure dtb__396) (C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral ((C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNVar (dtb__392, mc1, C_Base_dList_dList_Base_dList_dNil))))))) (fun resText -> (C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" ["("; domText; ") -> "; resText])))))))))
  | _ -> (if (mc0 <= 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: extern type is too deep")) else (v_Vuna_dCompiler_dCodegen_dTerm_dexternDomText mc2))
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenExternTy = (fun ty -> (((v_Vuna_dCompiler_dCodegen_dTerm_dexternTyText 64) 0) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) ty)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__397, dtb__398) -> (match dtb__398 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__397)) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf mc0) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__397)))
  | _ -> true
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__399, dtb__400) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__401, dtb__402, dtb__403) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__402) then (v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed dtb__403) else true)
  | _ -> false
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__404, dtb__405) -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__404) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__406) -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__406) = 0) then (if (v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed dtb__406) then (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue dtb__405) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__404)))) else (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue dtb__405))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dioResultTy = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__407, dtb__408, dtb__409) -> (match dtb__407 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__410) -> (if (dtb__410 = v_Vuna_dCompiler_dIntrinsics_dioFamilyName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__408)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCodegen_dTerm_dfirstCtorOf = (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d) with
  | C_Base_dList_dList_Base_dList_dCons (dtb__411, dtb__412) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__411)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__413, dtb__414) -> (if ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__413) = v_Vuna_dCompiler_dIntrinsics_dioFamilyName) then (v_Vuna_dCompiler_dCodegen_dTerm_dfirstCtorOf dtb__413) else (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf dtb__414))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr = (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainReturnType)

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName = (fun g -> (if (g = v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("string_of_int", "int")))) else (if (g = v_Vuna_dCompiler_dIntrinsics_dnatTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("string_of_int", "int")))) else (if (g = v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_string", "string")))) else (if (g = v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_bool", "bool")))) else v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr)))))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShow = (fun table tyTerm -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Base_dHashMap_dfromList table)) v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) tyTerm)) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__415) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__416, dtb__417) -> (match dtb__417 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName dtb__416)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)) dtb__415)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook = (fun bodyText table tyTerm mainExpr printResult -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dmainShow table) tyTerm)) (fun showPair -> (match showPair with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__418, dtb__419) -> ((fun hook -> (C_Base_dResult_dResult_Base_dResult_dOk ((String.concat "" [bodyText; "\n"; hook])))) (if printResult then (String.concat "" ["let () = print_endline ("; dtb__418; " ("; mainExpr; "))\n"]) else (String.concat "" ["let () = ignore ("; mainExpr; ")\n"])))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dTerm_dioRunText = (fun program mainRef -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mainRef
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__420) -> (match dtb__420 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__421, dtb__422) -> (String.concat "" ["match "; mainRef; " with "; ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__421) dtb__422); " f -> f 0"])
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf (v_Base_dPair_dfirstOf program))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef = (fun st d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern d) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__423) -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dgenExternTy (v_Vuna_dCompiler_dElab_dTypes_ddtDefType d)) with
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__424) -> (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) ^ dtb__424)))
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__425) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" ["external "; (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)); " : "; dtb__425; " = "; (v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__423)]), st))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__426) -> ((fun nd_uscrut5 -> (match nd_uscrut5 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__427) -> (match dtb__427 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__428, dtb__429) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((String.concat "" [(v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)); " = "; dtb__428]), dtb__429))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__430) -> (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) ^ dtb__430)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) C_Base_dList_dList_Base_dList_dNil) dtb__426))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ((((v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) ^ "DT: internal: axiom reached runtime code generation (partition must erase it)")))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies = (fun mc0 mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__431, dtb__432) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef mc0) dtb__431)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__433, dtb__434) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies dtb__434) dtb__432)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__435, dtb__436) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__433, dtb__435)), dtb__436))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc0))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet = (fun st group isRec -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies st) group)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__437, dtb__438) -> ((fun nd_uscrut8 -> (match nd_uscrut8 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__439, dtb__440) -> (match dtb__440 with
  | C_Base_dList_dList_Base_dList_dNil -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefExtern dtb__439) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__441) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\n") dtb__437), dtb__438))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((if isRec then "let rec " else "let ") ^ ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__437)), dtb__438))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((if isRec then "let rec " else "let ") ^ ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__437)), dtb__438))))
)
  | _ -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((if isRec then "let rec " else "let ") ^ ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__437)), dtb__438))))
)) group)
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup = (fun adj st group -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec adj) group) then (match (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue group) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__442) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef dtb__442) group) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__443) -> ((((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__443)) dtb__442) (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (dtb__442))) (C_Base_dVec_dVec_Base_dVec_dVCons (dtb__442, C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (dtb__442))) dtb__442)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet st) group) true)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet st) group) false)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups = (fun mc0 mc1 mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__444, dtb__445) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup mc0) mc1) dtb__444)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__446, dtb__447) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups mc0) dtb__447) dtb__445)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__448, dtb__449) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__446, dtb__448)), dtb__449))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc1))))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLam = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel 512) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenApp = (fun a1 a2 a3 a4 a5 -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel 512) a1) a2) a3) a4) a5))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenConApp = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel 512) a1) a2) a3) a4))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgs = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenArm = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenArms = (fun a1 a2 a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel 512) a1) a2) a3))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenCase = (fun a1 a2 a3 a4 -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel 512) a1) a2) a3) a4))
