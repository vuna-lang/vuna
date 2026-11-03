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
open Vuna_dCompiler_dPackages_dPkg
open Vuna_dCompiler_dDebug
open Base_dNat
open Base_dVec
open Vuna_dCompiler_dDiagnostics
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dDiagnostics
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser_dSupport
open Vuna_dCompiler_dFrontend_dParser
open Vuna_dCompiler_dLoader_dDiagnostics
open Vuna_dCompiler_dLoader_dModules
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

let v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime = ((bi_concat "let dtp_print s = print_string s; flush stdout; String.length s\n") ((bi_concat "let dtp_readFile path =\n  try\n    let ch = open_in_bin path in\n    Fun.protect ~finally:(fun () -> close_in_noerr ch)\n      (fun () -> really_input_string ch (in_channel_length ch))\n  with Sys_error msg -> failwith (\"readFile: \" ^ msg)\n") ((bi_concat "let dtp_writeFile path contents =\n  try\n    let ch = open_out_bin path in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch)\n      (fun () -> output_string ch contents);\n    String.length contents\n  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)\n") ((bi_concat "let dtp_getArgs () =\n  let argv = Sys.argv in\n  let n = Array.length argv in\n  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))\n") ((bi_concat "let dtp_readLine () = try input_line stdin with End_of_file -> \"\"\n") ((bi_concat "let dtp_readDir path =\n  try List.sort compare (Array.to_list (Sys.readdir path))\n  with Sys_error msg -> failwith (\"readDir: \" ^ msg)\n") ((bi_concat "let dtp_isDirectory path =\n  try Sys.is_directory path with Sys_error msg -> failwith (\"isDirectory: \" ^ msg)\n") ((bi_concat "let dtp_makeDir path =\n  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))\n  with Sys_error msg -> failwith (\"makeDir: \" ^ msg)\n") ((bi_concat "let dtp_removeFile path =\n  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)\n  with Sys_error msg -> failwith (\"removeFile: \" ^ msg)\n") ((bi_concat "let dtp_fileExists path = Sys.file_exists path\n") ((bi_concat "let dtp_fileMtime path =\n  try int_of_float (Unix.stat path).Unix.st_mtime with _ -> 0\n") ((bi_concat "let dtp_fileSize path =\n  try (Unix.stat path).Unix.st_size with _ -> 0\n") ((bi_concat "let dtp_timeUs () = int_of_float (Unix.gettimeofday () *. 1000000.0)\n") ((bi_concat "let dtp_getenv k = try Sys.getenv k with Not_found -> \"\"\n") ((bi_concat "let dtp_getcwd () = try Sys.getcwd () with _ -> \".\"\n") ((bi_concat "let dtp_execPath () = try Unix.readlink \"/proc/self/exe\" with _ -> Sys.executable_name\n") ((bi_concat "let dtp_strHash (s : string) =\n  let h = ref 0 in\n  String.iter (fun c -> h := ((!h * 33) + Char.code c) land 1023) s;\n  !h\n") ((bi_concat "let dtp_strAt (s : string) (i : int) = if i < 0 || i >= String.length s then -1 else Char.code s.[i]\n") ((bi_concat "let dtp_exit n = exit n\n") "let dtp_runIn dir args =\n  let quote s = Filename.quote s in\n  let cmd = String.concat \" \" (List.map quote args) in\n  let old = Sys.getcwd () in\n  Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)\n")))))))))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime = ((bi_concat "let () =\n") ((bi_concat "  let c = Gc.get () in\n") ((bi_concat "  Gc.set { c with minor_heap_size = 16 * 1024 * 1024; space_overhead = 200 }\n") ((bi_concat "let bi_add a b = a + b\n") ((bi_concat "let bi_sub a b = a - b\n") ((bi_concat "let bi_mul a b = a * b\n") ((bi_concat "let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\n") ((bi_concat "let bi_eq_int (a : int) (b : int) = a = b\n") ((bi_concat "let bi_neq_int (a : int) (b : int) = a <> b\n") ((bi_concat "let bi_eq_str (a : string) (b : string) = a = b\n") ((bi_concat "let bi_neq_str (a : string) (b : string) = a <> b\n") ((bi_concat "let bi_eq_generic (a : 'a) (b : 'a) = a = b\n") ((bi_concat "let bi_neq_generic (a : 'a) (b : 'a) = a <> b\n") ((bi_concat "let bi_strFromInt (n : int) = string_of_int n\n") ((bi_concat "let bi_strLength (s : string) = String.length s\n") ((bi_concat "let bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])\n") ((bi_concat "let bi_strPack (cs : int list) = String.init (List.length cs) (fun i -> Char.chr (List.nth cs i))\n") ((bi_concat "let bi_lt_int (a : int) (b : int) = a < b\n") ((bi_concat "let bi_le_int (a : int) (b : int) = a <= b\n") ((bi_concat "let bi_gt_int (a : int) (b : int) = a > b\n") ((bi_concat "let bi_ge_int (a : int) (b : int) = a >= b\n") ((bi_concat "let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0\n") ((bi_concat "let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0\n") ((bi_concat "let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0\n") ((bi_concat "let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0\n") ((bi_concat "let bi_concat a b = a ^ b\n") ((bi_concat "let bi_and a b = a && b\n") ((bi_concat "let bi_or a b = a || b\n") ((bi_concat "let dt_show_bool b = if b then \"True\" else \"False\"\n") ((bi_concat "let dt_show_string s =\n") ((bi_concat "  let buf = Buffer.create 16 in\n") ((bi_concat "  Buffer.add_char buf (Char.chr 34);\n") ((bi_concat "  String.iter (fun c ->\n") ((bi_concat "    let n = Char.code c in\n") ((bi_concat "    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))\n") ((bi_concat "    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))\n") ((bi_concat "    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"n\")\n") ((bi_concat "    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"t\")\n") ((bi_concat "    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"r\")\n") ((bi_concat "    else Buffer.add_char buf c) s;\n") ((bi_concat "  Buffer.add_char buf (Char.chr 34);\n") ((bi_concat "  Buffer.contents buf\n") v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime))))))))))))))))))))))))))))))))))))))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__0, dtb__1) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__0))) mc0) then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__0)) else ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor mc0) dtb__1))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__2, dtb__3) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__2))) "List") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__2)) else (v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData dtb__3))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtListBridge = (fun datas -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dfindListFamilyData datas) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__4) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor "Nil") (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__4)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__5) -> (match ((v_Vuna_dCompiler_dCodegen_dTerm_dfindFamilyCtor "Cons") (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors dtb__4)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ""
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6) -> ((fun famName -> ((fun nilMl -> ((fun consMl -> ((bi_concat "\nlet dtp_unpack (s : string) =\n") ((bi_concat "  let cs = List.init (String.length s) (fun i -> Char.code s.[i]) in\n") ((bi_concat "  List.fold_right (fun x acc -> ") ((bi_concat consMl) ((bi_concat " (x, acc)) cs ") ((bi_concat nilMl) ((bi_concat "\n") ((bi_concat "let dtp_pack xs =\n") ((bi_concat "  let rec to_list xs = match xs with ") ((bi_concat nilMl) ((bi_concat " -> [] | ") ((bi_concat consMl) ((bi_concat " (x, rest) -> x :: to_list rest in\n") ((bi_concat "  let cs = to_list xs in\n") ((bi_concat "  String.init (List.length cs) (fun i -> Char.chr (List.nth cs i))\n") ((bi_concat "\nlet dtp_listOf xs = List.fold_right (fun x acc -> ") ((bi_concat consMl) ((bi_concat " (x, acc)) xs ") ((bi_concat nilMl) ((bi_concat "\n") ((bi_concat "let dtp_ocamlOf xs =\n") ((bi_concat "  let rec go l = match l with ") ((bi_concat nilMl) ((bi_concat " -> [] | ") ((bi_concat consMl) ((bi_concat " (x, rest) -> x :: go rest in\n") ((bi_concat "  go xs\n") ((bi_concat "\nlet dtp_concatMany xs = String.concat \"\" (dtp_ocamlOf xs)\n") ((bi_concat "\nlet dtp_substTemplate tmpl xs =\n") ((bi_concat "  let args = Array.of_list (dtp_ocamlOf xs) in\n") ((bi_concat "  let n = String.length tmpl and na = Array.length args in\n") ((bi_concat "  let buf = Buffer.create (n + 32) in\n") ((bi_concat "  let rec go i =\n") ((bi_concat "    if i >= n then ()\n") ((bi_concat "    else if tmpl.[i] = '<' then begin\n") ((bi_concat "      let j = ref (i + 1) and k = ref 0 in\n") ((bi_concat "      while !j < n && tmpl.[!j] >= '0' && tmpl.[!j] <= '9' do\n") ((bi_concat "        k := !k * 10 + (Char.code tmpl.[!j] - 48); incr j\n") ((bi_concat "      done;\n") ((bi_concat "      if !j < n && tmpl.[!j] = '>' && !j > i + 1 then begin\n") ((bi_concat "        (if !k < na then Buffer.add_string buf args.(!k)\n") ((bi_concat "         else Buffer.add_string buf (String.sub tmpl i (!j - i + 1)));\n") ((bi_concat "        go (!j + 1)\n") ((bi_concat "      end else (Buffer.add_char buf '<'; go (i + 1))\n") ((bi_concat "    end else (Buffer.add_char buf tmpl.[i]; go (i + 1))\n") "  in go 0; Buffer.contents buf\n")))))))))))))))))))))))))))))))))))))))))))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName famName) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__6)))) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName famName) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__5)))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dglobalRef = (fun name -> (if ((bi_eq_str name) "True") then (C_Base_dResult_dResult_Base_dResult_dOk ("true")) else (if ((bi_eq_str name) "False") then (C_Base_dResult_dResult_Base_dResult_dOk ("false")) else (if ((bi_eq_str name) "+") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_add")) else (if ((bi_eq_str name) "-") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_sub")) else (if ((bi_eq_str name) "*") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_mul")) else (if ((bi_eq_str name) "/") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_div")) else (if ((bi_eq_str name) "==") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_int")) else (if ((bi_eq_str name) "/=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_int")) else (if ((bi_eq_str name) "<") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if ((bi_eq_str name) "<=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if ((bi_eq_str name) ">") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (if ((bi_eq_str name) ">=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int")) else (if ((bi_eq_str name) "++") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_concat")) else (if ((bi_eq_str name) "&&") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_and")) else (if ((bi_eq_str name) "||") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_or")) else (if ((bi_eq_str name) "bi_eq_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_int")) else (if ((bi_eq_str name) "bi_neq_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_int")) else (if ((bi_eq_str name) "bi_eq_str") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_str")) else (if ((bi_eq_str name) "bi_neq_str") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_str")) else (if ((bi_eq_str name) "bi_eq_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_generic")) else (if ((bi_eq_str name) "bi_neq_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_generic")) else (if ((bi_eq_str name) "bi_lt_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if ((bi_eq_str name) "bi_le_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if ((bi_eq_str name) "bi_gt_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (if ((bi_eq_str name) "bi_ge_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int")) else (if ((bi_eq_str name) "bi_lt_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_generic")) else (if ((bi_eq_str name) "bi_le_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_generic")) else (if ((bi_eq_str name) "bi_gt_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_generic")) else (if ((bi_eq_str name) "bi_ge_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_generic")) else (if ((bi_eq_str name) "strFromInt") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_strFromInt")) else (if ((bi_eq_str name) "strUnpack") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_unpack")) else (if ((bi_eq_str name) "strPack") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_pack")) else (if ((bi_eq_str name) "strLength") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_strLength")) else (if ((bi_eq_str name) "strConcatMany") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_concatMany")) else (if ((bi_eq_str name) "strSubstTemplate") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_substTemplate")) else (if ((bi_eq_str name) "timeUs") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_timeUs ())")) else (if ((bi_eq_str name) "strHash") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_strHash")) else (if ((bi_eq_str name) "strAt") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_strAt")) else (if ((bi_eq_str name) "print") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_print")) else (if ((bi_eq_str name) "readFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_readFile")) else (if ((bi_eq_str name) "writeFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_writeFile")) else (if ((bi_eq_str name) "readDir") then (C_Base_dResult_dResult_Base_dResult_dOk ("(fun p -> dtp_listOf (dtp_readDir p))")) else (if ((bi_eq_str name) "isDirectory") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_isDirectory")) else (if ((bi_eq_str name) "makeDir") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_makeDir")) else (if ((bi_eq_str name) "removeFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_removeFile")) else (if ((bi_eq_str name) "fileExists") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileExists")) else (if ((bi_eq_str name) "fileMtime") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileMtime")) else (if ((bi_eq_str name) "fileSize") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileSize")) else (if ((bi_eq_str name) "exit") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_exit")) else (if ((bi_eq_str name) "getArgs") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_listOf (dtp_getArgs ()))")) else (if ((bi_eq_str name) "readLine") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_readLine ())")) else (if ((bi_eq_str name) "prim_print") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_print")) else (if ((bi_eq_str name) "prim_readFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_readFile")) else (if ((bi_eq_str name) "prim_writeFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_writeFile")) else (if ((bi_eq_str name) "prim_readDir") then (C_Base_dResult_dResult_Base_dResult_dOk ("(fun p -> dtp_listOf (dtp_readDir p))")) else (if ((bi_eq_str name) "prim_isDirectory") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_isDirectory")) else (if ((bi_eq_str name) "prim_makeDir") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_makeDir")) else (if ((bi_eq_str name) "prim_removeFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_removeFile")) else (if ((bi_eq_str name) "prim_fileExists") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileExists")) else (if ((bi_eq_str name) "prim_fileMtime") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileMtime")) else (if ((bi_eq_str name) "prim_fileSize") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileSize")) else (if ((bi_eq_str name) "prim_exit") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_exit")) else (if ((bi_eq_str name) "prim_runIn") then (C_Base_dResult_dResult_Base_dResult_dOk ("(fun dir args -> dtp_runIn dir (dtp_ocamlOf args))")) else (if ((bi_eq_str name) "prim_getArgs") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_listOf (dtp_getArgs ()))")) else (if ((bi_eq_str name) "prim_readLine") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_readLine ())")) else (if ((bi_eq_str name) "prim_getenv") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_getenv")) else (if ((bi_eq_str name) "prim_getcwd") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_getcwd ())")) else (if ((bi_eq_str name) "prim_execPath") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_execPath ())")) else (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dhasListFamily = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName dtb__7)) "List") then true else (v_Vuna_dCompiler_dCodegen_dTerm_dhasListFamily dtb__8))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__9, dtb__10, dtb__11, dtb__12) -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsCtorShapes = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__13, dtb__14, dtb__15, dtb__16) -> dtb__15
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsFamilies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__17, dtb__18, dtb__19, dtb__20) -> dtb__17
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef = (fun st -> (fun name -> (match ((v_Base_dList_dlookupPair name) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__21) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__21) name), st))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((bi_eq_str name) "strUnpack") then (if (v_Vuna_dCompiler_dCodegen_dTerm_dhasListFamily (v_Vuna_dCompiler_dCodegen_dTerm_dgsFamilies st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dtp_unpack", st)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_strUnpack", st))))) else (if ((bi_eq_str name) "strPack") then (if (v_Vuna_dCompiler_dCodegen_dTerm_dhasListFamily (v_Vuna_dCompiler_dCodegen_dTerm_dgsFamilies st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dtp_pack", st)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_strPack", st))))) else ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dTerm_dglobalRef name)) (fun r -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (r, st))))))))
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
  | C_Base_dList_dList_Cons (dtb__30, dtb__31) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData dtb__30)) (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf dtb__31))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt = (fun datas -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas), (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf datas), (v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf datas), 0)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity = (fun t -> (match t with
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
  | C_Base_dList_dList_Cons (dtb__44, dtb__45) -> (match dtb__44 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__46, dtb__47) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__47) then ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo mc0) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), mc1))) dtb__45) mc3) else ((fun fresh -> ((fun nm -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) ((bi_add fresh) 1))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc1))) dtb__45) (C_Base_dList_dList_Cons (nm, mc3)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc1, (v_Base_dList_dreverse mc3), mc0))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnv = (fun st -> (fun outer -> (fun tele -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo st) outer) tele) C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dcountKept = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__48, dtb__49) -> (if dtb__48 then ((bi_add 1) (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__49)) else (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__49))
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull = (fun st -> (fun label -> (fun outer -> (fun binders -> (fun flags -> (fun pats -> (match binders with
  | C_Base_dList_dList_Nil -> (match flags with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (outer, (v_Base_dList_dreverse pats), st))))
  | C_Base_dList_dList_Cons (dtb__50, dtb__51) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch has fewer binders than its shape"))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Cons (dtb__52, dtb__53) -> (match dtb__52 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__54, dtb__55) -> (match flags with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch has more binders than its shape"))))
  | C_Base_dList_dList_Cons (dtb__56, dtb__57) -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__56) dtb__55) then (if dtb__56 then ((fun fresh -> ((fun nm -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext st) ((bi_add fresh) 1))) label) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), outer))) dtb__53) dtb__57) (C_Base_dList_dList_Cons (nm, pats)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext st)) else ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull st) label) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), outer))) dtb__53) dtb__57) pats)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch binder rig disagrees with its shape")))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (match dtb__58 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__60, dtb__61) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__61) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc1) ": kept-field branch has an erased binder")))) else ((fun fresh -> ((fun nm -> (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) ((bi_add fresh) 1))) mc1) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc2))) dtb__59) (C_Base_dList_dList_Cons (nm, mc4)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc2, (v_Base_dList_dreverse mc4), mc0))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked = (fun st -> (fun label -> (fun outer -> (fun binders -> (fun flags -> (if ((bi_eq_int (v_Base_dList_dlength binders)) (v_Base_dList_dlength flags)) then ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull st) label) outer) binders) flags) C_Base_dList_dList_Nil) else (if ((bi_eq_int (v_Base_dList_dlength binders)) (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept flags)) then (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept st) label) outer) binders) C_Base_dList_dList_Nil) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch binder count matches neither full telescope nor kept fields")))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dconAppText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (match dtb__63 with
  | C_Base_dList_dList_Nil -> ((bi_concat "(") ((bi_concat mc0) ((bi_concat " (") ((bi_concat dtb__62) "))"))))
  | _ -> ((bi_concat "(") ((bi_concat mc0) ((bi_concat " (") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1)) "))"))))
)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__64, dtb__65) -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (match dtb__66 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69) -> (if dtb__64 then (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__69) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": runtime field marked erased")))) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__65) dtb__67)) (fun ts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69)), ts))))))) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__69) then (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__65) dtb__67) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__65) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__68, dtb__69)), dtb__67)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (if dtb__64 then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": application has fewer arguments than its shape")))) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__65) C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__70, dtb__71) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": application has more arguments than its shape"))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__72)) "") then true else (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt dtb__73))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Nil -> mc0
  | _ -> ((bi_concat mc0) ((bi_concat " (") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1)) ")")))
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel = (fun fuel -> (fun st -> (fun binders -> (fun t -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__74, dtb__75) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__75) binders) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__76) -> (match dtb__76 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, dtb__78) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__78) then ((v_Vuna_dCompiler_dDiagnostics_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dTypeLevelBindingRuntime (dtb__74))) dtb__74) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__77, st)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unbound runtime variable"))
  | _ -> failwith "DT: impossible branch"
)
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
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__102, dtb__103, dtb__104, dtb__105, dtb__106) -> (v_Vuna_dCompiler_dDiagnostics_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dTypeUsedAtRuntime)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__107) -> (v_Vuna_dCompiler_dDiagnostics_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dTypeUsedAtRuntime)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__108) -> ((v_Vuna_dCompiler_dDiagnostics_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dUnsolvedMetavarRuntime ((v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__108)))) (v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__108))
  | _ -> failwith "DT: impossible branch"
))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel = (fun fuel -> (fun st -> (fun binders -> (fun name -> (fun rig -> (fun body -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), binders))) body)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__109, dtb__110))))
  | _ -> failwith "DT: impossible branch"
))) else ((fun ocName -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (ocName, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), binders))) body)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__111, dtb__112) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(fun ") ((bi_concat ocName) ((bi_concat " -> ") ((bi_concat dtb__111) ")")))), dtb__112))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName name))))))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel = (fun fuel -> (fun st -> (fun binders -> (fun f -> (fun a -> (fun rig -> (if ((bi_le_int fuel) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) binders) f) else (match (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (f, a, rig))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__113) -> (match dtb__113 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__114, dtb__115) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel ((bi_sub fuel) 1)) st) binders) dtb__114) dtb__115)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) st) binders) f)) (fun pf -> (match pf with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__116, dtb__117) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub fuel) 1)) dtb__117) binders) a)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__118, dtb__119) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(") ((bi_concat dtb__116) ((bi_concat " ") ((bi_concat dtb__118) ")")))), dtb__119))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__120, dtb__121) -> (match dtb__120 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__122, dtb__123) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__122)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel ((bi_sub mc0) 1)) dtb__125) mc2) dtb__121)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__126, dtb__127) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__124, dtb__126)), dtb__127))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc1)))))
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
  | C_Base_dList_dList_Nil -> "_"
  | C_Base_dList_dList_Cons (dtb__134, dtb__135) -> dtb__134
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
  | C_Base_dList_dList_Cons (dtb__140, dtb__141) -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel ((bi_sub mc0) 1)) mc1) mc2) dtb__140)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, dtb__143) -> ((v_Base_dResult_dandThen ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel ((bi_sub mc0) 1)) dtb__143) mc2) dtb__141)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__144, dtb__145) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat dtb__142) dtb__144), dtb__145))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
))))
  | C_Base_dList_dList_Nil -> (if ((bi_le_int mc0) 0) then (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: codegen fuel exhausted")) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("", mc1)))))
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
  | C_Base_dList_dList_Cons (dtb__150, dtb__151) -> (match dtb__151 with
  | C_Base_dList_dList_Nil -> ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__150)) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf mc0) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__150)))
  | _ -> true
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__152, dtb__153, dtb__154) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__153) then (v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed dtb__154) else true)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__155, dtb__156) -> true
  | _ -> false
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__157, dtb__158) -> (if ((bi_eq_int (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__157))) 0) then (if (v_Vuna_dCompiler_dCodegen_dTerm_drecursiveValueAllowed (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody dtb__157)) then (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue dtb__158) else (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__157)))) else (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue dtb__158))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dioResultTy = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__159, dtb__160, dtb__161) -> (match dtb__159 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__162) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName dtb__162)) "IO") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__160)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCodegen_dTerm_dfirstCtorOf = (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d) with
  | C_Base_dList_dList_Cons (dtb__163, dtb__164) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__163)))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__165, dtb__166) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__165))) "IO") then (v_Vuna_dCompiler_dCodegen_dTerm_dfirstCtorOf dtb__165) else (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf dtb__166))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr = (v_Vuna_dCompiler_dDiagnostics_dcgErr0 C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dMainReturnType)

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName = (fun g -> (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName g)) "Int") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("string_of_int", "int")))) else (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName g)) "String") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_string", "string")))) else (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName g)) "Bool") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_bool", "bool")))) else v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr))))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShow = (fun table -> (fun tyTerm -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce (v_Vuna_dCompiler_dCommon_dtblFromList table)) v_Vuna_dCompiler_dCore_dTerm_dsolsEmpty) v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) tyTerm)) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__167) -> (match dtb__167 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__168, dtb__169) -> (match dtb__169 with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName dtb__168)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)
  | _ -> v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook = (fun bodyText -> (fun table -> (fun tyTerm -> (fun mainExpr -> (fun printResult -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dmainShow table) tyTerm)) (fun showPair -> (match showPair with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171) -> ((fun hook -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat bodyText) ((bi_concat "\n") hook))))) (if printResult then ((bi_concat "let () = print_endline (") ((bi_concat dtb__170) ((bi_concat " (") ((bi_concat mainExpr) "))\n")))) else ((bi_concat "let () = ignore (") ((bi_concat mainExpr) ")\n"))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dioRunText = (fun program -> (fun mainRef -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf (v_Base_dPair_dfirstOf program)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__172) -> (match dtb__172 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__173, dtb__174) -> ((bi_concat "match ") ((bi_concat mainRef) ((bi_concat " with ") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__173) dtb__174)) " f -> f 0"))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> mainRef
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef = (fun st -> (fun d -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__175, dtb__176) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))) ((bi_concat " = ") dtb__175)), dtb__176))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__177, dtb__178) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef mc0) dtb__177)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__179, dtb__180) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies dtb__180) dtb__178)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__181, dtb__182) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__179, dtb__181)), dtb__182))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc0))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet = (fun st -> (fun group -> (fun isRec -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies st) group)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__183, dtb__184) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (if isRec then "let rec " else "let ")) ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__183)), dtb__184))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup = (fun adj -> (fun st -> (fun group -> (if ((v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec adj) group) then (match (v_Vuna_dCompiler_dCodegen_dTerm_dfirstBadRecursiveValue group) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__185) -> ((v_Vuna_dCompiler_dDiagnostics_dcgErr1 (C_Vuna_dCompiler_dDiagnostics_dCgErr_Vuna_dCompiler_dDiagnostics_dRecursiveValueDefinition (dtb__185))) dtb__185)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet st) group) true)
  | _ -> failwith "DT: impossible branch"
) else (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupLet st) group) false)))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__186, dtb__187) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup mc0) mc1) dtb__186)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__188, dtb__189) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups mc0) dtb__189) dtb__187)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__190, dtb__191) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__188, dtb__190)), dtb__191))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc1))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLam = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLamFuel 512) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenApp = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (fun a5 -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_dgenAppFuel 512) a1) a2) a3) a4) a5))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenConApp = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConAppFuel 512) a1) a2) a3) a4)))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgs = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgsFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenArm = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenArms = (fun a1 -> (fun a2 -> (fun a3 -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenArmsFuel 512) a1) a2) a3))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenCase = (fun a1 -> (fun a2 -> (fun a3 -> (fun a4 -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenCaseFuel 512) a1) a2) a3) a4)))))
