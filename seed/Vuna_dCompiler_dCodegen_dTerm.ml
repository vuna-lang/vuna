open Vuna_runtime
open Base_dPair
open Base_dBool
open Base_dMonad
open Base_dMaybe
open Base_dEq
open Base_dOrd
open Base_dList
open Base_dResult
open Base_dString
open Base_dShow
open Base_dInt
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
open Vuna_dCompiler_dLoader_dFixity
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

let rec v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameGo = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__7, dtb__8) -> (match dtb__7 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__9, dtb__10) -> (if ((bi_eq_str dtb__10) v_Vuna_dCompiler_dIntrinsics_dioFamilyName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__10) dtb__9))) else (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameGo dtb__8))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames = (C_Base_dList_dList_Base_dList_dCons ("dtio_0", (C_Base_dList_dList_Base_dList_dCons ("dtio_1", (C_Base_dList_dList_Base_dList_dCons ("dtio_2", (C_Base_dList_dList_Base_dList_dCons ("dtio_3", C_Base_dList_dList_Base_dList_dNil))))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames = (fun n -> (fun names -> (if ((bi_le_int n) 0) then C_Base_dList_dList_Base_dList_dNil else (match names with
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | C_Base_dList_dList_Base_dList_dCons (dtb__11, dtb__12) -> (C_Base_dList_dList_Base_dList_dCons (dtb__11, ((v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames ((bi_sub n) 1)) dtb__12)))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dTerm_dioPrimLam = (fun ctor -> (fun rt -> (fun arity -> (if ((bi_eq_int arity) 0) then ((bi_concat "(") ((bi_concat ctor) ((bi_concat " (fun _ -> ") ((bi_concat rt) "))")))) else ((fun argText -> ((bi_concat "(fun ") ((bi_concat argText) ((bi_concat " -> ") ((bi_concat ctor) ((bi_concat " (fun _ -> ") ((bi_concat rt) ((bi_concat " ") ((bi_concat argText) "))"))))))))) ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith " ") ((v_Vuna_dCompiler_dCodegen_dTerm_dtakeNames arity) v_Vuna_dCompiler_dCodegen_dTerm_dioParamNames)))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__13, dtb__14, dtb__15, dtb__16) -> dtb__14
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameOf = (fun st -> (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameGo (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors st)))

let v_Vuna_dCompiler_dCodegen_dTerm_dioPrimText = (fun st -> (fun name -> (fun i -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorNameOf st) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dEffectPrimRequiresIO (name))) name)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__17) -> (C_Base_dResult_dResult_Base_dResult_dOk ((((v_Vuna_dCompiler_dCodegen_dTerm_dioPrimLam dtb__17) (v_Vuna_dCompiler_dIntrinsics_dintrinsicRuntime i)) (v_Vuna_dCompiler_dIntrinsics_dintrinsicArity i))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsCtorShapes = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__18, dtb__19, dtb__20, dtb__21) -> dtb__20
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsFamilies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__22, dtb__23, dtb__24, dtb__25) -> dtb__22
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef = (fun st -> (fun name -> (match ((v_Base_dList_dlookupPair name) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__26) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__26) name), st))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (match (v_Vuna_dCompiler_dIntrinsics_dfindIntrinsic name) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__27) -> (if (v_Vuna_dCompiler_dIntrinsics_dintrinsicReturnsIO dtb__27) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dioPrimText st) name) dtb__27)) (fun text -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (text, st)))))) else (if (v_Vuna_dCompiler_dIntrinsics_dneedsListBridge dtb__27) then (if ((v_Base_dList_dmemName v_Vuna_dCompiler_dIntrinsics_dlistFamilyName) (v_Vuna_dCompiler_dCodegen_dTerm_dgsFamilies st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dIntrinsics_dintrinsicRuntime dtb__27), st)))) else ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dListBridgeRequired (name))) name)) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dIntrinsics_dintrinsicRuntime dtb__27), st))))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name), st))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__28, dtb__29, dtb__30, dtb__31) -> dtb__31
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__32, dtb__33, dtb__34, dtb__35) -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__32, dtb__33, dtb__34, mc1))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData = (fun d -> ((v_Base_dList_dmap (fun c -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c))))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__36, dtb__37) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData dtb__36)) (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf dtb__37))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dList_dList_Base_dList_dNil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt = (fun datas -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas), (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf datas), (v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf datas), 0)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__38, dtb__39, dtb__40) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__39) then (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__40) else ((bi_add 1) (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__40)))
  | _ -> 0
))

let v_Vuna_dCompiler_dCodegen_dTerm_daeEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__41, dtb__42, dtb__43) -> dtb__41
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daePats = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__44, dtb__45, dtb__46) -> dtb__45
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daeSt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__47, dtb__48, dtb__49) -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__50, dtb__51) -> (match dtb__50 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__52, dtb__53) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__53) then ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo mc0) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), mc1))) dtb__51) mc3) else ((fun fresh -> ((fun nm -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) ((bi_add fresh) 1))) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc1))) dtb__51) (C_Base_dList_dList_Base_dList_dCons (nm, mc3)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc1, (v_Base_dList_dreverse mc3), mc0))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnv = (fun st -> (fun outer -> (fun tele -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo st) outer) tele) C_Base_dList_dList_Base_dList_dNil))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dcountKept = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__54, dtb__55) -> (if dtb__54 then ((bi_add 1) (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__55)) else (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__55))
  | C_Base_dList_dList_Base_dList_dNil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (fun mc5 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__56, dtb__57) -> (match dtb__56 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__58, dtb__59) -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc1) ": case branch has more binders than its shape"))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__60, dtb__61) -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__60) dtb__59) then (if dtb__60 then ((fun fresh -> ((fun nm -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) ((bi_add fresh) 1))) mc1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc2))) dtb__57) dtb__61) (C_Base_dList_dList_Base_dList_dCons (nm, mc5)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)) else ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull mc0) mc1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), mc2))) dtb__57) dtb__61) mc5)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc1) ": case branch binder rig disagrees with its shape")))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc4 with
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc2, (v_Base_dList_dreverse mc5), mc0))))
  | C_Base_dList_dList_Base_dList_dCons (dtb__62, dtb__63) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc1) ": case branch has fewer binders than its shape"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__64, dtb__65) -> (match dtb__64 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__66, dtb__67) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__67) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc1) ": kept-field branch has an erased binder")))) else ((fun fresh -> ((fun nm -> (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) ((bi_add fresh) 1))) mc1) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc2))) dtb__65) (C_Base_dList_dList_Base_dList_dCons (nm, mc4)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc2, (v_Base_dList_dreverse mc4), mc0))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked = (fun st -> (fun label -> (fun outer -> (fun binders -> (fun flags -> (if ((bi_eq_int (v_Base_dList_dlength binders)) (v_Base_dList_dlength flags)) then ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull st) label) outer) binders) flags) C_Base_dList_dList_Base_dList_dNil) else (if ((bi_eq_int (v_Base_dList_dlength binders)) (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept flags)) then (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept st) label) outer) binders) C_Base_dList_dList_Base_dList_dNil) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch binder count matches neither full telescope nor kept fields")))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dconAppText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__68, dtb__69) -> (match dtb__69 with
  | C_Base_dList_dList_Base_dList_dNil -> ((bi_concat "(") ((bi_concat mc0) ((bi_concat " (") ((bi_concat dtb__68) "))"))))
  | _ -> ((bi_concat "(") ((bi_concat mc0) ((bi_concat " (") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1)) "))"))))
)
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__70, dtb__71) -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__72, dtb__73) -> (match dtb__72 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__74, dtb__75) -> (if dtb__70 then (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__75) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": runtime field marked erased")))) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__71) dtb__73)) (fun ts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__74, dtb__75)), ts))))))) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__75) then (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__71) dtb__73) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__71) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__74, dtb__75)), dtb__73)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (if dtb__70 then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": application has fewer arguments than its shape")))) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__71) C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__76, dtb__77) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": application has more arguments than its shape"))))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Base_dList_dNil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__78, dtb__79) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__78)) "") then true else (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt dtb__79))
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dNil -> mc0
  | _ -> ((bi_concat mc0) ((bi_concat " (") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1)) ")")))
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel = (fun fuel -> (fun st -> (fun binders -> (fun t -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__80, dtb__81) -> ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unbound runtime variable"))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__82) -> (match dtb__82 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__83, dtb__84) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__84) then ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeLevelBindingRuntime (dtb__80))) dtb__80) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__83, st)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__81) binders))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__85) -> ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef st) dtb__85)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__86) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__86), st))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__87) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__87), st))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__88) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dboolText dtb__88), st))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__89, dtb__90, dtb__91) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) binders) dtb__89)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__92, dtb__93) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) dtb__93) binders) dtb__90)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__94, dtb__95) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) dtb__95) binders) dtb__91)) (fun pe -> (match pe with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__96, dtb__97) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(if ") ((bi_concat dtb__92) ((bi_concat " then ") ((bi_concat dtb__94) ((bi_concat " else ") ((bi_concat dtb__96) ")")))))), dtb__97))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__98, dtb__99, dtb__100) -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel ((bi_sub fuel) 1)) st) binders) dtb__98) dtb__99) dtb__100)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__101, dtb__102, dtb__103) -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel ((bi_sub fuel) 1)) st) binders) dtb__101) dtb__102) dtb__103)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__104, dtb__105) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel ((bi_sub fuel) 1)) st) binders) dtb__104) dtb__105)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__106, dtb__107) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel ((bi_sub fuel) 1)) st) binders) dtb__106) dtb__107)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__108, dtb__109, dtb__110, dtb__111, dtb__112) -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__113) -> (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dTypeUsedAtRuntime)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__114) -> ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dUnsolvedMetavarRuntime ((v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__114)))) (v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__114))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel = (fun fuel -> (fun st -> (fun binders -> (fun name -> (fun rig -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), binders))) body)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__115, dtb__116))))
  | _ -> failwith "DT: impossible branch"
))) else ((fun ocName -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) (C_Base_dList_dList_Base_dList_dCons ((C_Base_dPair_dPair_Base_dPair_dPair (ocName, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), binders))) body)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__117, dtb__118) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(fun ") ((bi_concat ocName) ((bi_concat " -> ") ((bi_concat dtb__117) ")")))), dtb__118))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName name))))))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel = (fun fuel -> (fun st -> (fun binders -> (fun f -> (fun a -> (fun rig -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) binders) f) else ((fun nd_uscrut6 -> (match nd_uscrut6 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) binders) f)) (fun pf -> (match pf with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) dtb__120) binders) a)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, dtb__122) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(") ((bi_concat dtb__119) ((bi_concat " ") ((bi_concat dtb__121) ")")))), dtb__122))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__123) -> (match dtb__123 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel ((bi_sub fuel) 1)) st) binders) dtb__124) dtb__125)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (f, a, rig))))))))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__126, dtb__127) -> (match dtb__126 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__128, dtb__129) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__128)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__130, dtb__131) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel ((bi_sub mc0) 1)) dtb__131) mc2) dtb__127)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__132, dtb__133) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__130, dtb__132)), dtb__133))))
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
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__134) -> (match ((v_Base_dList_dlookupPair c) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtorShapes st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: no shape for constructor ") c)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__135) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs c) dtb__135) args)) (fun runtimeArgs -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel ((bi_sub fuel) 1)) st) binders) runtimeArgs)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, dtb__137) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dTerm_dconAppText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__134) c)) dtb__136), dtb__137))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel = (fun fuel -> (fun st -> (fun outer -> (fun alt -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) "") then ((fun bound -> ((fun patText -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__138, dtb__139) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "  | ") ((bi_concat patText) ((bi_concat " -> ") ((bi_concat dtb__138) "\n")))), dtb__139))))
  | _ -> failwith "DT: impossible branch"
)))) (match (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound) with
  | C_Base_dList_dList_Base_dList_dNil -> "_"
  | C_Base_dList_dList_Base_dList_dCons (dtb__140, dtb__141) -> dtb__140
  | _ -> failwith "DT: impossible branch"
))) (((v_Vuna_dCompiler_dCodegen_dTerm_daltEnv st) outer) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) else (match ((v_Base_dList_dlookupPair (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unknown constructor ") (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__142) -> (match ((v_Base_dList_dlookupPair (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtorShapes st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: no shape for constructor ") (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__143) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked st) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__143)) (fun bound -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__144, dtb__145) -> ((fun cname -> ((fun patText -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "  | ") ((bi_concat patText) ((bi_concat " -> ") ((bi_concat dtb__144) "\n")))), dtb__145))))) ((v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText cname) (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound)))) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__142) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__146, dtb__147) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__146)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__148, dtb__149) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel ((bi_sub mc0) 1)) dtb__149) mc2) dtb__147)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__150, dtb__151) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat dtb__148) dtb__150), dtb__151))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | C_Base_dList_dList_Base_dList_dNil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("", mc1)))))
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel = (fun fuel -> (fun st -> (fun binders -> (fun scrut -> (fun alts -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) binders) scrut)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel ((bi_sub fuel) 1)) dtb__153) binders) alts)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__154, dtb__155) -> ((fun fallback -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(match ") ((bi_concat dtb__152) ((bi_concat " with\n") ((bi_concat dtb__154) ((bi_concat fallback) ")"))))), dtb__155))))) (if (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt alts) then "" else "  | _ -> failwith \"DT: impossible branch\"\n"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__156, dtb__157) -> (match dtb__157 with
  | C_Base_dList_dList_Base_dList_dNil -> ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__156)) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf mc0) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__156)))
  | _ -> true
)
  | C_Base_dList_dList_Base_dList_dNil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__158, dtb__159) -> true
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__160, dtb__161, dtb__162) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__161) then (v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed dtb__162) else true)
  | _ -> false
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__163, dtb__164) -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__163) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__165) -> (if ((bi_eq_int (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__165)) 0) then (if (v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed dtb__165) then (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue dtb__164) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__163)))) else (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue dtb__164))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dioResultTy = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__166, dtb__167, dtb__168) -> (match dtb__166 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__169) -> (if ((bi_eq_str dtb__169) v_Vuna_dCompiler_dIntrinsics_dioFamilyName) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__167)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCodegen_dTerm_dfirstCtorOf = (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d) with
  | C_Base_dList_dList_Base_dList_dCons (dtb__170, dtb__171) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__170)))))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__172, dtb__173) -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__172)) v_Vuna_dCompiler_dIntrinsics_dioFamilyName) then (v_Vuna_dCompiler_dCodegen_dTerm_dfirstCtorOf dtb__172) else (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf dtb__173))
  | C_Base_dList_dList_Base_dList_dNil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr = (v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dMainReturnType)

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName = (fun g -> (if ((bi_eq_str g) v_Vuna_dCompiler_dIntrinsics_dintTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("string_of_int", "int")))) else (if ((bi_eq_str g) v_Vuna_dCompiler_dIntrinsics_dstrTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_string", "string")))) else (if ((bi_eq_str g) v_Vuna_dCompiler_dIntrinsics_dboolTypeName) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_bool", "bool")))) else v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr))))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShow = (fun table -> (fun tyTerm -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dCommon_dtblFromList table)) v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Base_dList_dNil) tyTerm)) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__174) -> ((fun nd_uscrut3 -> (match nd_uscrut3 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__175, dtb__176) -> (match dtb__176 with
  | C_Base_dList_dList_Base_dList_dNil -> (v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName dtb__175)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)) dtb__174)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook = (fun bodyText -> (fun table -> (fun tyTerm -> (fun mainExpr -> (fun printResult -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dmainShow table) tyTerm)) (fun showPair -> (match showPair with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__177, dtb__178) -> ((fun hook -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat bodyText) ((bi_concat "\n") hook))))) (if printResult then ((bi_concat "let () = print_endline (") ((bi_concat dtb__177) ((bi_concat " (") ((bi_concat mainExpr) "))\n")))) else ((bi_concat "let () = ignore (") ((bi_concat mainExpr) ")\n"))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dioRunText = (fun program -> (fun mainRef -> ((fun nd_uscrut2 -> (match nd_uscrut2 with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mainRef
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__179) -> (match dtb__179 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__180, dtb__181) -> ((bi_concat "match ") ((bi_concat mainRef) ((bi_concat " with ") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__180) dtb__181)) " f -> f 0"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)) (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf (v_Base_dPair_dfirstOf program)))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef = (fun st -> (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__182) -> ((fun nd_uscrut4 -> (match nd_uscrut4 with
  | C_Base_dResult_dResult_Base_dResult_dOk (dtb__183) -> (match dtb__183 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__184, dtb__185) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))) ((bi_concat " = ") dtb__184)), dtb__185))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dResult_dResult_Base_dResult_dErr (dtb__186) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))) dtb__186)))
  | _ -> failwith "DT: impossible branch"
)) (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) C_Base_dList_dList_Base_dList_dNil) dtb__182))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgDefLoc (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan d)) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))) "DT: internal: axiom reached runtime code generation (partition must erase it)")))
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__187, dtb__188) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef mc0) dtb__187)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__189, dtb__190) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies dtb__190) dtb__188)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__191, dtb__192) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__189, dtb__191)), dtb__192))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Base_dList_dNil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Base_dList_dNil, mc0))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet = (fun st -> (fun group -> (fun isRec -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies st) group)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__193, dtb__194) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (if isRec then "let rec " else "let ")) ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__193)), dtb__194))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup = (fun adj -> (fun st -> (fun group -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec adj) group) then (match (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue group) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__195) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dfindDtDef dtb__195) group) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__196) -> ((((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErrDefAt (v_Vuna_dCompiler_dElab_dTypes_ddtDefSpan dtb__196)) dtb__195) (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (dtb__195))) (C_Base_dVec_dVec_Base_dVec_dVCons (dtb__195, C_Base_dVec_dVec_Base_dVec_dVNil)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Vuna_dCompiler_dDiagnostics_dCg_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCg_dCgErr_Vuna_dCompiler_dDiagnostics_dCg_dRecursiveValueDefinition (dtb__195))) dtb__195)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet st) group) true)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet st) group) false)))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Base_dList_dCons (dtb__197, dtb__198) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup mc0) mc1) dtb__197)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__199, dtb__200) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups mc0) dtb__200) dtb__198)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__201, dtb__202) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Base_dList_dCons (dtb__199, dtb__201)), dtb__202))))
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
