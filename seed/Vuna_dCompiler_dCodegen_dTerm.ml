open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dOrd
open Prelude
open Vuna_dCompiler_dCommon
open Vuna_dCompiler_dFrontend_dToml
open Vuna_dCompiler_dFrontend_dManifest
open Base_dIO
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
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
open Vuna_dCompiler_dLoader_dModules
open Vuna_dCompiler_dIntrinsics
open Vuna_dCompiler_dLoader_dResolve
open Vuna_dCompiler_dLoader_dFlatten
open Vuna_dCompiler_dLoader
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

let v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime = ((bi_concat "let dtp_print s = print_string s; flush stdout; String.length s\n") ((bi_concat "let dtp_readFile path =\n  try\n    let ch = open_in_bin path in\n    Fun.protect ~finally:(fun () -> close_in_noerr ch)\n      (fun () -> really_input_string ch (in_channel_length ch))\n  with Sys_error msg -> failwith (\"readFile: \" ^ msg)\n") ((bi_concat "let dtp_writeFile path contents =\n  try\n    let ch = open_out_bin path in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch)\n      (fun () -> output_string ch contents);\n    String.length contents\n  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)\n") ((bi_concat "let dtp_getArgs () =\n  let argv = Sys.argv in\n  let n = Array.length argv in\n  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))\n") ((bi_concat "let dtp_readLine () = try input_line stdin with End_of_file -> \"\"\n") ((bi_concat "let dtp_readBytes n =\n  if n <= 0 then \"\"\n  else\n    let b = Bytes.create n in\n    let k = try input stdin b 0 n with _ -> 0 in\n    if k <= 0 then \"\" else Bytes.sub_string b 0 k\n") ((bi_concat "let dtp_readDir path =\n  try List.sort compare (Array.to_list (Sys.readdir path))\n  with Sys_error msg -> failwith (\"readDir: \" ^ msg)\n") ((bi_concat "let dtp_isDirectory path =\n  try Sys.is_directory path with Sys_error msg -> failwith (\"isDirectory: \" ^ msg)\n") ((bi_concat "let dtp_makeDir path =\n  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))\n  with Sys_error msg -> failwith (\"makeDir: \" ^ msg)\n") ((bi_concat "let dtp_removeFile path =\n  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)\n  with Sys_error msg -> failwith (\"removeFile: \" ^ msg)\n") ((bi_concat "let dtp_fileExists path = Sys.file_exists path\n") ((bi_concat "let dtp_fileMtime path =\n  try int_of_float (Unix.stat path).Unix.st_mtime with _ -> 0\n") ((bi_concat "let dtp_fileSize path =\n  try (Unix.stat path).Unix.st_size with _ -> 0\n") ((bi_concat "let dtp_timeUs () = int_of_float (Unix.gettimeofday () *. 1000000.0)\n") ((bi_concat "let dtp_getenv k = try Sys.getenv k with Not_found -> \"\"\n") ((bi_concat "let dtp_getcwd () = try Sys.getcwd () with _ -> \".\"\n") ((bi_concat "let dtp_execPath () = try Unix.readlink \"/proc/self/exe\" with _ -> Sys.executable_name\n") ((bi_concat "let dtp_strHash (s : string) =\n  let h = ref 0 in\n  String.iter (fun c -> h := ((!h * 33) + Char.code c) land 1023) s;\n  !h\n") ((bi_concat "let dtp_strAt (s : string) (i : int) = if i < 0 || i >= String.length s then -1 else Char.code s.[i]\n") ((bi_concat "let dtp_exit n = exit n\n") "let dtp_runIn dir args =\n  let quote s = Filename.quote s in\n  let cmd = String.concat \" \" (List.map quote args) in\n  let old = Sys.getcwd () in\n  Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)\n"))))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime = ((bi_concat "let () =\n") ((bi_concat "  let c = Gc.get () in\n") ((bi_concat "  Gc.set { c with minor_heap_size = 16 * 1024 * 1024; space_overhead = 200 }\n") ((bi_concat "let bi_add a b = a + b\n") ((bi_concat "let bi_sub a b = a - b\n") ((bi_concat "let bi_mul a b = a * b\n") ((bi_concat "let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\n") ((bi_concat "let bi_eq_int (a : int) (b : int) = a = b\n") ((bi_concat "let bi_neq_int (a : int) (b : int) = a <> b\n") ((bi_concat "let bi_eq_str (a : string) (b : string) = a = b\n") ((bi_concat "let bi_neq_str (a : string) (b : string) = a <> b\n") ((bi_concat "let bi_strFromInt (n : int) = string_of_int n\n") ((bi_concat "let bi_strLength (s : string) = String.length s\n") ((bi_concat "let bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])\n") ((bi_concat "let bi_strPack (cs : int list) = String.init (List.length cs) (fun i -> Char.chr (List.nth cs i))\n") ((bi_concat "let bi_lt_int (a : int) (b : int) = a < b\n") ((bi_concat "let bi_le_int (a : int) (b : int) = a <= b\n") ((bi_concat "let bi_gt_int (a : int) (b : int) = a > b\n") ((bi_concat "let bi_ge_int (a : int) (b : int) = a >= b\n") ((bi_concat "let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0\n") ((bi_concat "let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0\n") ((bi_concat "let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0\n") ((bi_concat "let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0\n") ((bi_concat "let bi_concat a b = a ^ b\n") ((bi_concat "let bi_and a b = a && b\n") ((bi_concat "let bi_or a b = a || b\n") ((bi_concat "let dt_show_bool b = if b then \"True\" else \"False\"\n") ((bi_concat "let dt_show_string s =\n") ((bi_concat "  let buf = Buffer.create 16 in\n") ((bi_concat "  Buffer.add_char buf (Char.chr 34);\n") ((bi_concat "  String.iter (fun c ->\n") ((bi_concat "    let n = Char.code c in\n") ((bi_concat "    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))\n") ((bi_concat "    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))\n") ((bi_concat "    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"n\")\n") ((bi_concat "    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"t\")\n") ((bi_concat "    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"r\")\n") ((bi_concat "    else Buffer.add_char buf c) s;\n") ((bi_concat "  Buffer.add_char buf (Char.chr 34);\n") ((bi_concat "  Buffer.contents buf\n") v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime))))))))))))))))))))))))))))))))))))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__0, dtb__1) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__0)) mc1) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0)) else ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor dtb__1) mc1))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__2, dtb__3) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__2)) v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__2)) else (v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData dtb__3))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge = (fun datas -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__4) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__4)) v_Vuna_dCompiler_dIntrinsics_dlistNilCtor) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__5) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__4)) v_Vuna_dCompiler_dIntrinsics_dlistConsCtor) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6) -> ((fun famName -> ((fun nilMl -> ((fun consMl -> ((bi_concat "\nlet dtp_unpack (s : string) =\n") ((bi_concat "  let cs = List.init (String.length s) (fun i -> Char.code s.[i]) in\n") ((bi_concat "  List.fold_right (fun x acc -> ") ((bi_concat consMl) ((bi_concat " (x, acc)) cs ") ((bi_concat nilMl) ((bi_concat "\n") ((bi_concat "let dtp_pack xs =\n") ((bi_concat "  let rec to_list xs = match xs with ") ((bi_concat nilMl) ((bi_concat " -> [] | ") ((bi_concat consMl) ((bi_concat " (x, rest) -> x :: to_list rest in\n") ((bi_concat "  let cs = to_list xs in\n") ((bi_concat "  String.init (List.length cs) (fun i -> Char.chr (List.nth cs i))\n") ((bi_concat "\nlet dtp_listOf xs = List.fold_right (fun x acc -> ") ((bi_concat consMl) ((bi_concat " (x, acc)) xs ") ((bi_concat nilMl) ((bi_concat "\n") ((bi_concat "let dtp_ocamlOf xs =\n") ((bi_concat "  let rec go l = match l with ") ((bi_concat nilMl) ((bi_concat " -> [] | ") ((bi_concat consMl) ((bi_concat " (x, rest) -> x :: go rest in\n") ((bi_concat "  go xs\n") ((bi_concat "\nlet dtp_concatMany xs = String.concat \"\" (dtp_ocamlOf xs)\n") ((bi_concat "\nlet dtp_substTemplate tmpl xs =\n") ((bi_concat "  let args = Array.of_list (dtp_ocamlOf xs) in\n") ((bi_concat "  let n = String.length tmpl and na = Array.length args in\n") ((bi_concat "  let buf = Buffer.create (n + 32) in\n") ((bi_concat "  let rec go i =\n") ((bi_concat "    if i >= n then ()\n") ((bi_concat "    else if tmpl.[i] = '<' then begin\n") ((bi_concat "      let j = ref (i + 1) and k = ref 0 in\n") ((bi_concat "      while !j < n && tmpl.[!j] >= '0' && tmpl.[!j] <= '9' do\n") ((bi_concat "        k := !k * 10 + (Char.code tmpl.[!j] - 48); incr j\n") ((bi_concat "      done;\n") ((bi_concat "      if !j < n && tmpl.[!j] = '>' && !j > i + 1 then begin\n") ((bi_concat "        (if !k < na then Buffer.add_string buf args.(!k)\n") ((bi_concat "         else Buffer.add_string buf (String.sub tmpl i (!j - i + 1)));\n") ((bi_concat "        go (!j + 1)\n") ((bi_concat "      end else (Buffer.add_char buf '<'; go (i + 1))\n") ((bi_concat "    end else (Buffer.add_char buf tmpl.[i]; go (i + 1))\n") "  in go 0; Buffer.contents buf\n")))))))))))))))))))))))))))))))))))))))))))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName famName) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__6)))) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName famName) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__5)))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dglobalRef = (fun name -> (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__7) -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dIntrinsics_dintrinsicRuntime dtb__7)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name)))
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__8, dtb__9, dtb__10, dtb__11) -> dtb__9
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsCtorShapes = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__12, dtb__13, dtb__14, dtb__15) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsFamilies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__16, dtb__17, dtb__18, dtb__19) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef = (fun st -> (fun name -> (match ((v_Base_dList_dlookupPair name) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__20) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__20) name), st))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__21) -> (if (v_Vuna_dCompiler_dIntrinsics_dneedsListBridge dtb__21) then (if ((v_Base_dList_dmemName v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) (v_Vuna_dCompiler_dCodegen_dTerm_dgsFamilies st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dIntrinsics_dintrinsicRuntime dtb__21), st)))) else ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dListBridgeRequired (name))) name)) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dIntrinsics_dintrinsicRuntime dtb__21), st)))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name), st))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__22, dtb__23, dtb__24, dtb__25) -> dtb__25
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__26, dtb__27, dtb__28, dtb__29) -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__26, dtb__27, dtb__28, mc1))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData = (fun d -> ((v_Base_dList_dmap (fun c -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c))))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__30, dtb__31) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData dtb__30)) (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf dtb__31))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt = (fun datas -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas), (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf datas), (v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf datas), 0)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__32, dtb__33, dtb__34) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__33) then (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__34) else ((bi_add 1) (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__34)))
  | _ -> 0
))

let v_Vuna_dCompiler_dCodegen_dTerm_daeEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__35, dtb__36, dtb__37) -> dtb__35
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daePats = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__38, dtb__39, dtb__40) -> dtb__39
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daeSt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__41, dtb__42, dtb__43) -> dtb__43
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__44, dtb__45) -> (match dtb__44 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__46, dtb__47) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__47) then ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo mc0) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), mc1))) dtb__45) mc3) else ((fun fresh -> ((fun nm -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) ((bi_add fresh) 1))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc1))) dtb__45) (C_Base_dList_dList_Base_dList_dCons (nm, mc3)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc1, (v_Base_dList_dreverse mc3), mc0))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnv = (fun st -> (fun outer -> (fun tele -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo st) outer) tele) C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dcountKept = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__48, dtb__49) -> (if dtb__48 then ((bi_add 1) (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__49)) else (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__49))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (match dtb__50 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53) -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc1) ": case branch has more binders than its shape"))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__54) dtb__53) then (if dtb__54 then ((fun fresh -> ((fun nm -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) ((bi_add fresh) 1))) mc1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc2))) dtb__51) dtb__55) (C_Base_dList_dList_Base_dList_dCons (nm, mc5)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)) else ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull mc0) mc1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), mc2))) dtb__51) dtb__55) mc5)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc1) ": case branch binder rig disagrees with its shape")))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc2, (v_Base_dList_dreverse mc5), mc0))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__56, dtb__57) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc1) ": case branch has fewer binders than its shape"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__58, dtb__59) -> (match dtb__58 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__60, dtb__61) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__61) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc1) ": kept-field branch has an erased binder")))) else ((fun fresh -> ((fun nm -> (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) ((bi_add fresh) 1))) mc1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc2))) dtb__59) (C_Base_dList_dList_Base_dList_dCons (nm, mc4)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc2, (v_Base_dList_dreverse mc4), mc0))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked = (fun st -> (fun label -> (fun outer -> (fun binders -> (fun flags -> (if ((bi_eq_int (v_Base_dList_dlength binders)) (v_Base_dList_dlength flags)) then ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull st) label) outer) binders) flags) C_Base_dList_dList_Base_dList_dNil) else (if ((bi_eq_int (v_Base_dList_dlength binders)) (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept flags)) then (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept st) label) outer) binders) C_Base_dList_dList_Base_dList_dNil) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch binder count matches neither full telescope nor kept fields")))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dconAppText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__62, dtb__63) -> (match dtb__63 with
  | C_Base_dList_dList_Base_dList_dNil -> ((bi_concat "(") ((bi_concat mc0) ((bi_concat " (") ((bi_concat dtb__62) "))"))))
  | _ -> ((bi_concat "(") ((bi_concat mc0) ((bi_concat " (") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1)) "))"))))
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__65) -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__66, dtb__67) -> (match dtb__66 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69) -> (if dtb__64 then (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__69) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": runtime field marked erased")))) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__65) dtb__67)) (fun ts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69)), ts))))))) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__69) then (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__65) dtb__67) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__65) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69)), dtb__67)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if dtb__64 then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": application has fewer arguments than its shape")))) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__65) C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__70, dtb__71) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": application has more arguments than its shape"))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__72, dtb__73) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__72)) "") then true else (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt dtb__73))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> ((bi_concat mc0) ((bi_concat " (") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1)) ")")))
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel = (fun fuel -> (fun st -> (fun binders -> (fun t -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__74, dtb__75) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unbound runtime variable"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__76) -> (match dtb__76 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__78) then ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelBindingRuntime (dtb__74))) dtb__74) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, st)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__75) binders))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__79) -> ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef st) dtb__79)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__80) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__80), st))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__81) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__81), st))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__82) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dboolText dtb__82), st))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__83, dtb__84, dtb__85) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) binders) dtb__83)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__86, dtb__87) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) dtb__87) binders) dtb__84)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__88, dtb__89) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) dtb__89) binders) dtb__85)) (fun pe -> (match pe with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__90, dtb__91) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(if ") ((bi_concat dtb__86) ((bi_concat " then ") ((bi_concat dtb__88) ((bi_concat " else ") ((bi_concat dtb__90) ")")))))), dtb__91))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__92, dtb__93, dtb__94) -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel ((bi_sub fuel) 1)) st) binders) dtb__92) dtb__93) dtb__94)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__95, dtb__96, dtb__97) -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel ((bi_sub fuel) 1)) st) binders) dtb__95) dtb__96) dtb__97)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__98, dtb__99) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel ((bi_sub fuel) 1)) st) binders) dtb__98) dtb__99)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__100, dtb__101) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel ((bi_sub fuel) 1)) st) binders) dtb__100) dtb__101)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__102, dtb__103, dtb__104, dtb__105, dtb__106) -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__107) -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__108) -> ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dUnsolvedMetavarRuntime ((v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__108)))) (v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__108))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel = (fun fuel -> (fun st -> (fun binders -> (fun name -> (fun rig -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), binders))) body)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110))))
  | _ -> failwith "DT: impossible branch"
))) else ((fun ocName -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (ocName, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), binders))) body)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, dtb__112) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(fun ") ((bi_concat ocName) ((bi_concat " -> ") ((bi_concat dtb__111) ")")))), dtb__112))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName name))))))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel = (fun fuel -> (fun st -> (fun binders -> (fun f -> (fun a -> (fun rig -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) binders) f) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) binders) f)) (fun pf -> (match pf with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__113, dtb__114) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) dtb__114) binders) a)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(") ((bi_concat dtb__113) ((bi_concat " ") ((bi_concat dtb__115) ")")))), dtb__116))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__117) -> (match dtb__117 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__118, dtb__119) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel ((bi_sub fuel) 1)) st) binders) dtb__118) dtb__119)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (f, a, rig))))))))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__120, dtb__121) -> (match dtb__120 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__122, dtb__123) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__122)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel ((bi_sub mc0) 1)) dtb__125) mc2) dtb__121)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__126, dtb__127) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__124, dtb__126)), dtb__127))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc1)))))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel = (fun fuel -> (fun st -> (fun binders -> (fun c -> (fun args -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match ((v_Base_dList_dlookupPair c) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unknown constructor ") c)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__128) -> (match ((v_Base_dList_dlookupPair c) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtorShapes st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: no shape for constructor ") c)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__129) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs c) dtb__129) args)) (fun runtimeArgs -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel ((bi_sub fuel) 1)) st) binders) runtimeArgs)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, dtb__131) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dTerm_dconAppText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__128) c)) dtb__130), dtb__131))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel = (fun fuel -> (fun st -> (fun outer -> (fun alt -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) "") then ((fun bound -> ((fun patText -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__132, dtb__133) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "  | ") ((bi_concat patText) ((bi_concat " -> ") ((bi_concat dtb__132) "\n")))), dtb__133))))
  | _ -> failwith "DT: impossible branch"
)))) (match (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound) with
  | C_Base_dList_dList_Base_dList_dNil -> "_"
  | C_Base_dList_dList_Base_dList_dCons (dtb__134, dtb__135) -> dtb__134
  | _ -> failwith "DT: impossible branch"
))) (((v_Vuna_dCompiler_dCodegen_dTerm_daltEnv st) outer) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) else (match ((v_Base_dList_dlookupPair (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unknown constructor ") (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__136) -> (match ((v_Base_dList_dlookupPair (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtorShapes st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: no shape for constructor ") (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__137) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked st) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__137)) (fun bound -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__138, dtb__139) -> ((fun cname -> ((fun patText -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "  | ") ((bi_concat patText) ((bi_concat " -> ") ((bi_concat dtb__138) "\n")))), dtb__139))))) ((v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText cname) (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound)))) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__136) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__140, dtb__141) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__140)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, dtb__143) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel ((bi_sub mc0) 1)) dtb__143) mc2) dtb__141)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__144, dtb__145) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat dtb__142) dtb__144), dtb__145))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("", mc1)))))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel = (fun fuel -> (fun st -> (fun binders -> (fun scrut -> (fun alts -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) binders) scrut)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__146, dtb__147) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel ((bi_sub fuel) 1)) dtb__147) binders) alts)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__148, dtb__149) -> ((fun fallback -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(match ") ((bi_concat dtb__146) ((bi_concat " with\n") ((bi_concat dtb__148) ((bi_concat fallback) ")"))))), dtb__149))))) (if (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt alts) then "" else "  | _ -> failwith \"DT: impossible branch\"\n"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__150, dtb__151) -> (match dtb__151 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__150)) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf mc0) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__150)))
  | _ -> true
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__152, dtb__153) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__154, dtb__155, dtb__156) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__155) then (v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed dtb__156) else true)
  | _ -> false
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__157, dtb__158) -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__157) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__159) -> (if ((bi_eq_int (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__159)) 0) then (if (v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed dtb__159) then (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue dtb__158) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__157)))) else (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue dtb__158))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dioResultTy = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__160, dtb__161, dtb__162) -> (match dtb__160 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__163) -> (if ((bi_eq_str dtb__163) v_Vuna_dCompiler_dIntrinsics_dioFamilyName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__161)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCodegen_dTerm_dfirstCtorOf = (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d) with
  | C_Base_dList_dList_Base_dList_dCons (dtb__164, dtb__165) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__164)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__166, dtb__167) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__166)) v_Vuna_dCompiler_dIntrinsics_dioFamilyName) then (v_Vuna_dCompiler_dCodegen_dTerm_dfirstCtorOf dtb__166) else (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf dtb__167))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr = (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainReturnType)

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName = (fun g -> (if ((bi_eq_str g) v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("string_of_int", "int")))) else (if ((bi_eq_str g) v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_string", "string")))) else (if ((bi_eq_str g) v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_bool", "bool")))) else v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr))))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShow = (fun table -> (fun tyTerm -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dCommon_dtblFromList table)) v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) tyTerm)) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__168) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__169, dtb__170) -> (match dtb__170 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName dtb__169)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)) dtb__168)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook = (fun bodyText -> (fun table -> (fun tyTerm -> (fun mainExpr -> (fun printResult -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dmainShow table) tyTerm)) (fun showPair -> (match showPair with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__171, dtb__172) -> ((fun hook -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat bodyText) ((bi_concat "\n") hook))))) (if printResult then ((bi_concat "let () = print_endline (") ((bi_concat dtb__171) ((bi_concat " (") ((bi_concat mainExpr) "))\n")))) else ((bi_concat "let () = ignore (") ((bi_concat mainExpr) ")\n"))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dioRunText = (fun program -> (fun mainRef -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mainRef
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__173) -> (match dtb__173 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> ((bi_concat "match ") ((bi_concat mainRef) ((bi_concat " with ") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__174) dtb__175)) " f -> f 0"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf (v_Base_dPair_dfirstOf program)))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef = (fun st -> (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__176) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__177) -> (match dtb__177 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__178, dtb__179) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))) ((bi_concat " = ") dtb__178)), dtb__179))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__180) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))) dtb__180)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) C_Base_dList_dList_Base_dList_dNil) dtb__176))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))) "DT: internal: axiom reached runtime code generation (partition must erase it)")))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__181, dtb__182) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef mc0) dtb__181)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__183, dtb__184) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies dtb__184) dtb__182)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__185, dtb__186) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__183, dtb__185)), dtb__186))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc0))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet = (fun st -> (fun group -> (fun isRec -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies st) group)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__187, dtb__188) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (if isRec then "let rec " else "let ")) ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__187)), dtb__188))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup = (fun adj -> (fun st -> (fun group -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec adj) group) then (match (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue group) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__189) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef dtb__189) group) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__190) -> ((((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__190)) dtb__189) (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (dtb__189))) (C_Base_dVec_dVec_Base_dVec_dVCons (dtb__189, C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (dtb__189))) dtb__189)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet st) group) true)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet st) group) false)))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__191, dtb__192) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup mc0) mc1) dtb__191)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__193, dtb__194) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups mc0) dtb__194) dtb__192)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__195, dtb__196) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__193, dtb__195)), dtb__196))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc1))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLam = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel 512) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenApp = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel 512) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenConApp = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel 512) a1) a2) a3) a4)))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgs = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenArm = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenArms = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenCase = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel 512) a1) a2) a3) a4)))))
