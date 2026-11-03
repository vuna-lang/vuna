open Vuna_runtime
open Vuna_builtins
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
open Vuna_dCompiler_dFrontend_dAst
open Vuna_dCompiler_dFrontend_dLexer
open Vuna_dCompiler_dFrontend_dParser
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
open Vuna_dCompiler_dElab_dTerm
open Vuna_dCompiler_dElab_dData
open Vuna_dCompiler_dElab_dTrait
open Vuna_dCompiler_dElab_dDerive
open Vuna_dCompiler_dElab_dRecords
open Vuna_dCompiler_dElab_dTermination
open Vuna_dCompiler_dElab_dDriver
open Vuna_dCompiler_dElab
open Vuna_dCompiler_dCodegen_dDecl
open Vuna_dCompiler_dCodegen_dErase
type t_Vuna_dCompiler_dCodegen_dTerm_dGenSt = C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt of (string t_Base_dList_dList) * ((string, string) t_Base_dPair_dPair t_Base_dList_dList) * ((string, bool t_Base_dList_dList) t_Base_dPair_dPair t_Base_dList_dList) * (int) * (string t_Base_dList_dList)
and t_Vuna_dCompiler_dCodegen_dTerm_dAltEnv = C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv of ((string, t_Vuna_dCompiler_dCore_dTerm_dRig) t_Base_dPair_dPair t_Base_dList_dList) * (string t_Base_dList_dList) * (t_Vuna_dCompiler_dCodegen_dTerm_dGenSt)

let v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime = fun () -> ((bi_concat "let dtp_print s = print_string s; flush stdout; String.length s\n") ((bi_concat "let dtp_readFile path =\n  try\n    let ch = open_in_bin path in\n    Fun.protect ~finally:(fun () -> close_in_noerr ch)\n      (fun () -> really_input_string ch (in_channel_length ch))\n  with Sys_error msg -> failwith (\"readFile: \" ^ msg)\n") ((bi_concat "let dtp_writeFile path contents =\n  try\n    let ch = open_out_bin path in\n    Fun.protect ~finally:(fun () -> close_out_noerr ch)\n      (fun () -> output_string ch contents);\n    String.length contents\n  with Sys_error msg -> failwith (\"writeFile: \" ^ msg)\n") ((bi_concat "let dtp_getArgs () =\n  let argv = Sys.argv in\n  let n = Array.length argv in\n  if n <= 1 then [] else Array.to_list (Array.sub argv 1 (n - 1))\n") ((bi_concat "let dtp_readLine () = try input_line stdin with End_of_file -> \"\"\n") ((bi_concat "let dtp_readDir path =\n  try List.sort compare (Array.to_list (Sys.readdir path))\n  with Sys_error msg -> failwith (\"readDir: \" ^ msg)\n") ((bi_concat "let dtp_isDirectory path =\n  try Sys.is_directory path with Sys_error msg -> failwith (\"isDirectory: \" ^ msg)\n") ((bi_concat "let dtp_makeDir path =\n  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))\n  with Sys_error msg -> failwith (\"makeDir: \" ^ msg)\n") ((bi_concat "let dtp_removeFile path =\n  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)\n  with Sys_error msg -> failwith (\"removeFile: \" ^ msg)\n") ((bi_concat "let dtp_fileExists path = Sys.file_exists path\n") ((bi_concat "let dtp_fileMtime path =\n  try int_of_float (Unix.stat path).Unix.st_mtime with _ -> 0\n") ((bi_concat "let dtp_fileSize path =\n  try (Unix.stat path).Unix.st_size with _ -> 0\n") ((bi_concat "let dtp_exit n = exit n\n") "let dtp_runIn dir args =\n  let quote s = Filename.quote s in\n  let cmd = String.concat \" \" (List.map quote args) in\n  let old = Sys.getcwd () in\n  Fun.protect ~finally:(fun () -> Sys.chdir old) (fun () -> Sys.chdir dir; Sys.command cmd)\n")))))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_ddtRuntime = fun () -> ((bi_concat "let bi_add a b = a + b\n") ((bi_concat "let bi_sub a b = a - b\n") ((bi_concat "let bi_mul a b = a * b\n") ((bi_concat "let bi_div a b = if b = 0 then failwith \"division by zero\" else a / b\n") ((bi_concat "let bi_eq_int (a : int) (b : int) = a = b\n") ((bi_concat "let bi_neq_int (a : int) (b : int) = a <> b\n") ((bi_concat "let bi_eq_str (a : string) (b : string) = a = b\n") ((bi_concat "let bi_neq_str (a : string) (b : string) = a <> b\n") ((bi_concat "let bi_eq_generic (a : 'a) (b : 'a) = a = b\n") ((bi_concat "let bi_neq_generic (a : 'a) (b : 'a) = a <> b\n") ((bi_concat "let bi_strFromInt (n : int) = string_of_int n\n") ((bi_concat "let bi_strLength (s : string) = String.length s\n") ((bi_concat "let bi_strUnpack (s : string) = List.init (String.length s) (fun i -> Char.code s.[i])\n") ((bi_concat "let bi_strPack (cs : int list) = String.init (List.length cs) (fun i -> Char.chr (List.nth cs i))\n") ((bi_concat "let bi_lt_int (a : int) (b : int) = a < b\n") ((bi_concat "let bi_le_int (a : int) (b : int) = a <= b\n") ((bi_concat "let bi_gt_int (a : int) (b : int) = a > b\n") ((bi_concat "let bi_ge_int (a : int) (b : int) = a >= b\n") ((bi_concat "let bi_lt_generic (a : 'a) (b : 'a) = compare a b < 0\n") ((bi_concat "let bi_le_generic (a : 'a) (b : 'a) = compare a b <= 0\n") ((bi_concat "let bi_gt_generic (a : 'a) (b : 'a) = compare a b > 0\n") ((bi_concat "let bi_ge_generic (a : 'a) (b : 'a) = compare a b >= 0\n") ((bi_concat "let bi_concat a b = a ^ b\n") ((bi_concat "let bi_and a b = a && b\n") ((bi_concat "let bi_or a b = a || b\n") ((bi_concat "let dt_show_bool b = if b then \"True\" else \"False\"\n") ((bi_concat "let dt_show_string s =\n") ((bi_concat "  let buf = Buffer.create 16 in\n") ((bi_concat "  Buffer.add_char buf (Char.chr 34);\n") ((bi_concat "  String.iter (fun c ->\n") ((bi_concat "    let n = Char.code c in\n") ((bi_concat "    if n = 34 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 34))\n") ((bi_concat "    else if n = 92 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ String.make 1 (Char.chr 92))\n") ((bi_concat "    else if n = 10 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"n\")\n") ((bi_concat "    else if n = 9 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"t\")\n") ((bi_concat "    else if n = 13 then Buffer.add_string buf (String.make 1 (Char.chr 92) ^ \"r\")\n") ((bi_concat "    else Buffer.add_char buf c) s;\n") ((bi_concat "  Buffer.add_char buf (Char.chr 34);\n") ((bi_concat "  Buffer.contents buf\n") (v_Vuna_dCompiler_dCodegen_dTerm_ddtPrimRuntime ()))))))))))))))))))))))))))))))))))))))))

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
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__6) -> ((fun famName -> ((fun nilMl -> ((fun consMl -> ((bi_concat "\nlet dtp_unpack (s : string) =\n") ((bi_concat "  let cs = List.init (String.length s) (fun i -> Char.code s.[i]) in\n") ((bi_concat "  List.fold_right (fun x acc -> ") ((bi_concat consMl) ((bi_concat " (x, acc)) cs ") ((bi_concat nilMl) ((bi_concat "\n") ((bi_concat "let dtp_pack xs =\n") ((bi_concat "  let rec to_list xs = match xs with ") ((bi_concat nilMl) ((bi_concat " -> [] | ") ((bi_concat consMl) ((bi_concat " (x, rest) -> x :: to_list rest in\n") ((bi_concat "  let cs = to_list xs in\n") ((bi_concat "  String.init (List.length cs) (fun i -> Char.chr (List.nth cs i))\n") ((bi_concat "\nlet dtp_listOf xs = List.fold_right (fun x acc -> ") ((bi_concat consMl) ((bi_concat " (x, acc)) xs ") ((bi_concat nilMl) ((bi_concat "\n") ((bi_concat "let dtp_ocamlOf xs =\n") ((bi_concat "  let rec go l = match l with ") ((bi_concat nilMl) ((bi_concat " -> [] | ") ((bi_concat consMl) ((bi_concat " (x, rest) -> x :: go rest in\n") "  go xs\n"))))))))))))))))))))))))))) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName famName) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__6)))) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName famName) (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__5)))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__4))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dglobalRef = (fun name -> (if ((bi_eq_str name) "True") then (C_Base_dResult_dResult_Base_dResult_dOk ("true")) else (if ((bi_eq_str name) "False") then (C_Base_dResult_dResult_Base_dResult_dOk ("false")) else (if ((bi_eq_str name) "+") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_add")) else (if ((bi_eq_str name) "-") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_sub")) else (if ((bi_eq_str name) "*") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_mul")) else (if ((bi_eq_str name) "/") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_div")) else (if ((bi_eq_str name) "==") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_int")) else (if ((bi_eq_str name) "/=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_int")) else (if ((bi_eq_str name) "<") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if ((bi_eq_str name) "<=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if ((bi_eq_str name) ">") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (if ((bi_eq_str name) ">=") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int")) else (if ((bi_eq_str name) "++") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_concat")) else (if ((bi_eq_str name) "&&") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_and")) else (if ((bi_eq_str name) "||") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_or")) else (if ((bi_eq_str name) "bi_eq_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_int")) else (if ((bi_eq_str name) "bi_neq_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_int")) else (if ((bi_eq_str name) "bi_eq_str") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_str")) else (if ((bi_eq_str name) "bi_neq_str") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_str")) else (if ((bi_eq_str name) "bi_eq_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_eq_generic")) else (if ((bi_eq_str name) "bi_neq_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_neq_generic")) else (if ((bi_eq_str name) "bi_lt_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_int")) else (if ((bi_eq_str name) "bi_le_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_int")) else (if ((bi_eq_str name) "bi_gt_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_int")) else (if ((bi_eq_str name) "bi_ge_int") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_int")) else (if ((bi_eq_str name) "bi_lt_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_lt_generic")) else (if ((bi_eq_str name) "bi_le_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_le_generic")) else (if ((bi_eq_str name) "bi_gt_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_gt_generic")) else (if ((bi_eq_str name) "bi_ge_generic") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_ge_generic")) else (if ((bi_eq_str name) "strFromInt") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_strFromInt")) else (if ((bi_eq_str name) "strUnpack") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_unpack")) else (if ((bi_eq_str name) "strPack") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_pack")) else (if ((bi_eq_str name) "strLength") then (C_Base_dResult_dResult_Base_dResult_dOk ("bi_strLength")) else (if ((bi_eq_str name) "print") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_print")) else (if ((bi_eq_str name) "readFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_readFile")) else (if ((bi_eq_str name) "writeFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_writeFile")) else (if ((bi_eq_str name) "readDir") then (C_Base_dResult_dResult_Base_dResult_dOk ("(fun p -> dtp_listOf (dtp_readDir p))")) else (if ((bi_eq_str name) "isDirectory") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_isDirectory")) else (if ((bi_eq_str name) "makeDir") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_makeDir")) else (if ((bi_eq_str name) "removeFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_removeFile")) else (if ((bi_eq_str name) "fileExists") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileExists")) else (if ((bi_eq_str name) "fileMtime") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileMtime")) else (if ((bi_eq_str name) "fileSize") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileSize")) else (if ((bi_eq_str name) "exit") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_exit")) else (if ((bi_eq_str name) "getArgs") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_listOf (dtp_getArgs ()))")) else (if ((bi_eq_str name) "readLine") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_readLine ())")) else (if ((bi_eq_str name) "prim_print") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_print")) else (if ((bi_eq_str name) "prim_readFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_readFile")) else (if ((bi_eq_str name) "prim_writeFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_writeFile")) else (if ((bi_eq_str name) "prim_readDir") then (C_Base_dResult_dResult_Base_dResult_dOk ("(fun p -> dtp_listOf (dtp_readDir p))")) else (if ((bi_eq_str name) "prim_isDirectory") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_isDirectory")) else (if ((bi_eq_str name) "prim_makeDir") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_makeDir")) else (if ((bi_eq_str name) "prim_removeFile") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_removeFile")) else (if ((bi_eq_str name) "prim_fileExists") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileExists")) else (if ((bi_eq_str name) "prim_fileMtime") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileMtime")) else (if ((bi_eq_str name) "prim_fileSize") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_fileSize")) else (if ((bi_eq_str name) "prim_exit") then (C_Base_dResult_dResult_Base_dResult_dOk ("dtp_exit")) else (if ((bi_eq_str name) "prim_runIn") then (C_Base_dResult_dResult_Base_dResult_dOk ("(fun dir args -> dtp_runIn dir (dtp_ocamlOf args))")) else (if ((bi_eq_str name) "prim_getArgs") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_listOf (dtp_getArgs ()))")) else (if ((bi_eq_str name) "prim_readLine") then (C_Base_dResult_dResult_Base_dResult_dOk ("(dtp_readLine ())")) else (C_Base_dResult_dResult_Base_dResult_dOk ((v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dhasListFamily = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__7, dtb__8) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName dtb__7)) "List") then true else (v_Vuna_dCompiler_dCodegen_dTerm_dhasListFamily dtb__8))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__9, dtb__10, dtb__11, dtb__12, dtb__13) -> dtb__10
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsCtorShapes = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__14, dtb__15, dtb__16, dtb__17, dtb__18) -> dtb__16
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsFamilies = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__19, dtb__20, dtb__21, dtb__22, dtb__23) -> dtb__19
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsNext = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__24, dtb__25, dtb__26, dtb__27, dtb__28) -> dtb__27
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsThunks = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__29, dtb__30, dtb__31, dtb__32, dtb__33) -> dtb__33
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef = (fun st -> (fun name -> (match ((v_Base_dList_dlookupPair name) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__34) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__34) name), st))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (if ((v_Base_dList_dmemName name) (v_Vuna_dCompiler_dCodegen_dTerm_dgsThunks st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(") ((bi_concat (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName name)) " ())")), st)))) else (if ((bi_eq_str name) "strUnpack") then (if (v_Vuna_dCompiler_dCodegen_dTerm_dhasListFamily (v_Vuna_dCompiler_dCodegen_dTerm_dgsFamilies st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dtp_unpack", st)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_strUnpack", st))))) else (if ((bi_eq_str name) "strPack") then (if (v_Vuna_dCompiler_dCodegen_dTerm_dhasListFamily (v_Vuna_dCompiler_dCodegen_dTerm_dgsFamilies st)) then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dtp_pack", st)))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("bi_strPack", st))))) else ((v_Base_dResult_dandThen (v_Vuna_dCompiler_dCodegen_dTerm_dglobalRef name)) (fun r -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (r, st)))))))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext = (fun mc0 -> (fun mc1 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__35, dtb__36, dtb__37, dtb__38, dtb__39) -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (dtb__35, dtb__36, dtb__37, mc1, dtb__39))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData = (fun d -> ((v_Base_dList_dmap (fun c -> (C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtCtorName c), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorFamily c))))) (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__40, dtb__41) -> ((v_Base_dList_dappend (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOfData dtb__40)) (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf dtb__41))
  | C_Base_dList_dList_Nil -> C_Base_dList_dList_Nil
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__42, dtb__43, dtb__44) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__43) then (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__44) else ((bi_add 1) (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity dtb__44)))
  | _ -> 0
))

let v_Vuna_dCompiler_dCodegen_dTerm_dthunkable = (fun d -> (if ((bi_eq_str (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) "main") then false else ((bi_eq_int (v_Vuna_dCompiler_dCodegen_dTerm_druntimeArity (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d))) 0)))

let v_Vuna_dCompiler_dCodegen_dTerm_dthunkNames = (fun defs -> ((v_Base_dList_dmap (fun d -> (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))) ((v_Base_dList_dfilter v_Vuna_dCompiler_dCodegen_dTerm_dthunkable) defs)))

let v_Vuna_dCompiler_dCodegen_dTerm_dmkGenSt = (fun datas -> (fun defs -> (C_Vuna_dCompiler_dCodegen_dTerm_dGenSt_Vuna_dCompiler_dCodegen_dTerm_dGenSt (((v_Base_dList_dmap v_Vuna_dCompiler_dElab_dTypes_ddtDataName) datas), (v_Vuna_dCompiler_dCodegen_dTerm_dctorTableOf datas), (v_Vuna_dCompiler_dCodegen_dDecl_dctorShapeOf datas), 0, (v_Vuna_dCompiler_dCodegen_dTerm_dthunkNames defs)))))

let v_Vuna_dCompiler_dCodegen_dTerm_daeEnv = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__45, dtb__46, dtb__47) -> dtb__45
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daePats = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__48, dtb__49, dtb__50) -> dtb__49
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_daeSt = (fun mc0 -> (match mc0 with
  | C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (dtb__51, dtb__52, dtb__53) -> dtb__53
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__54, dtb__55) -> (match dtb__54 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__56, dtb__57) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__57) then ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo mc0) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), mc1))) dtb__55) mc3) else ((fun fresh -> ((fun nm -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) ((bi_add fresh) 1))) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc1))) dtb__55) (C_Base_dList_dList_Cons (nm, mc3)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc1, (v_Base_dList_dreverse mc3), mc0))
  | _ -> failwith "DT: impossible branch"
)))))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnv = (fun st -> (fun outer -> (fun tele -> ((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvGo st) outer) tele) C_Base_dList_dList_Nil))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dcountKept = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__58, dtb__59) -> (if dtb__58 then ((bi_add 1) (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__59)) else (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept dtb__59))
  | C_Base_dList_dList_Nil -> 0
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull = (fun st -> (fun label -> (fun outer -> (fun binders -> (fun flags -> (fun pats -> (match binders with
  | C_Base_dList_dList_Nil -> (match flags with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (outer, (v_Base_dList_dreverse pats), st))))
  | C_Base_dList_dList_Cons (dtb__60, dtb__61) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch has fewer binders than its shape"))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Cons (dtb__62, dtb__63) -> (match dtb__62 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__64, dtb__65) -> (match flags with
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch has more binders than its shape"))))
  | C_Base_dList_dList_Cons (dtb__66, dtb__67) -> (if ((v_Vuna_dCompiler_dCodegen_dDecl_dflagMatchesRig dtb__66) dtb__65) then (if dtb__66 then ((fun fresh -> ((fun nm -> ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext st) ((bi_add fresh) 1))) label) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), outer))) dtb__63) dtb__67) (C_Base_dList_dList_Cons (nm, pats)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext st)) else ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull st) label) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), outer))) dtb__63) dtb__67) pats)) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch binder rig disagrees with its shape")))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept = (fun mc0 -> (fun mc1 -> (fun mc2 -> (fun mc3 -> (fun mc4 -> (match mc3 with
  | C_Base_dList_dList_Cons (dtb__68, dtb__69) -> (match dtb__68 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__70, dtb__71) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__71) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc1) ": kept-field branch has an erased binder")))) else ((fun fresh -> ((fun nm -> (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept ((v_Vuna_dCompiler_dCodegen_dTerm_dgsPutNext mc0) ((bi_add fresh) 1))) mc1) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (nm, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), mc2))) dtb__69) (C_Base_dList_dList_Cons (nm, mc4)))) ((bi_concat "dtb__") (bi_strFromInt fresh)))) (v_Vuna_dCompiler_dCodegen_dTerm_dgsNext mc0)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Vuna_dCompiler_dCodegen_dTerm_dAltEnv_Vuna_dCompiler_dCodegen_dTerm_dAltEnv (mc2, (v_Base_dList_dreverse mc4), mc0))))
  | _ -> failwith "DT: impossible branch"
))))))

let v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked = (fun st -> (fun label -> (fun outer -> (fun binders -> (fun flags -> (if ((bi_eq_int (v_Base_dList_dlength binders)) (v_Base_dList_dlength flags)) then ((((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvFull st) label) outer) binders) flags) C_Base_dList_dList_Nil) else (if ((bi_eq_int (v_Base_dList_dlength binders)) (v_Vuna_dCompiler_dCodegen_dTerm_dcountKept flags)) then (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvKept st) label) outer) binders) C_Base_dList_dList_Nil) else (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat label) ": case branch binder count matches neither full telescope nor kept fields")))))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dconAppText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__72, dtb__73) -> (match dtb__73 with
  | C_Base_dList_dList_Nil -> ((bi_concat "(") ((bi_concat mc0) ((bi_concat " (") ((bi_concat dtb__72) "))"))))
  | _ -> ((bi_concat "(") ((bi_concat mc0) ((bi_concat " (") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1)) "))"))))
)
  | C_Base_dList_dList_Nil -> mc0
  | _ -> failwith "DT: impossible branch"
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__74, dtb__75) -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__76, dtb__77) -> (match dtb__76 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, dtb__79) -> (if dtb__74 then (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__79) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": runtime field marked erased")))) else ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__75) dtb__77)) (fun ts -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, dtb__79)), ts))))))) else (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__79) then (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__75) dtb__77) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__75) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__78, dtb__79)), dtb__77)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (if dtb__74 then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": application has fewer arguments than its shape")))) else (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs mc0) dtb__75) C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__80, dtb__81) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: constructor ") ((bi_concat mc0) ": application has more arguments than its shape"))))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk (C_Base_dList_dList_Nil))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__82, dtb__83) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName dtb__82)) "") then true else (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt dtb__83))
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Nil -> mc0
  | _ -> ((bi_concat mc0) ((bi_concat " (") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith ", ") mc1)) ")")))
)))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm = (fun st -> (fun binders -> (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTVar (dtb__84, dtb__85) -> (match ((v_Vuna_dCompiler_dCodegen_dErase_dbinderAt dtb__85) binders) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__86) -> (match dtb__86 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__87, dtb__88) -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased dtb__88) then (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: type-level binding `") ((bi_concat dtb__84) "` is used at runtime (M13 limitation)")))) else (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__87, st)))))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: internal: unbound runtime variable"))
  | _ -> failwith "DT: impossible branch"
)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__89) -> ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGlobalRef st) dtb__89)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTInt (dtb__90) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((bi_strFromInt dtb__90), st))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTStr (dtb__91) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_docamlString dtb__91), st))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTBool (dtb__92) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dCodegen_dDecl_dboolText dtb__92), st))))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTIf (dtb__93, dtb__94, dtb__95) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) binders) dtb__93)) (fun pc -> (match pc with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__96, dtb__97) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm dtb__97) binders) dtb__94)) (fun pt -> (match pt with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__98, dtb__99) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm dtb__99) binders) dtb__95)) (fun pe -> (match pe with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__100, dtb__101) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(if ") ((bi_concat dtb__96) ((bi_concat " then ") ((bi_concat dtb__98) ((bi_concat " else ") ((bi_concat dtb__100) ")")))))), dtb__101))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTLam (dtb__102, dtb__103, dtb__104) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLam st) binders) dtb__102) dtb__103) dtb__104)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__105, dtb__106, dtb__107) -> (((((v_Vuna_dCompiler_dCodegen_dTerm_dgenApp st) binders) dtb__105) dtb__106) dtb__107)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCon (dtb__108, dtb__109) -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConApp st) binders) dtb__108) dtb__109)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTCase (dtb__110, dtb__111) -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenCase st) binders) dtb__110) dtb__111)
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTPi (dtb__112, dtb__113, dtb__114, dtb__115, dtb__116) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)"))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTType (dtb__117) -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: a type is used at runtime (M13 limitation)"))
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTMeta (dtb__118) -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: unsolved metavariable in runtime code") (v_Vuna_dCompiler_dCodegen_dErase_dshowMetaHint dtb__118))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenTermLam = (fun st -> (fun binders -> (fun name -> (fun rig -> (fun body -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair ("", C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig0)), binders))) body)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (dtb__119, dtb__120))))
  | _ -> failwith "DT: impossible branch"
))) else ((fun ocName -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) (C_Base_dList_dList_Cons ((C_Base_dPair_dPair_Base_dPair_dPair (ocName, C_Vuna_dCompiler_dCore_dTerm_dRig_Vuna_dCompiler_dCore_dTerm_dRig1)), binders))) body)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__121, dtb__122) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(fun ") ((bi_concat ocName) ((bi_concat " -> ") ((bi_concat dtb__121) ")")))), dtb__122))))
  | _ -> failwith "DT: impossible branch"
)))) (v_Vuna_dCompiler_dCodegen_dDecl_docamlBinderName name))))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenApp = (fun st -> (fun binders -> (fun f -> (fun a -> (fun rig -> (if (v_Vuna_dCompiler_dCore_dTerm_drigIsErased rig) then (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) binders) f) else (match (v_Vuna_dCompiler_dCodegen_dErase_dflattenConApp (C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (f, a, rig))) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__123) -> (match dtb__123 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__124, dtb__125) -> ((((v_Vuna_dCompiler_dCodegen_dTerm_dgenConApp st) binders) dtb__124) dtb__125)
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) binders) f)) (fun pf -> (match pf with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__126, dtb__127) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm dtb__127) binders) a)) (fun pa -> (match pa with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__128, dtb__129) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(") ((bi_concat dtb__126) ((bi_concat " ") ((bi_concat dtb__128) ")")))), dtb__129))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgs = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__130, dtb__131) -> (match dtb__130 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__132, dtb__133) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm mc0) mc1) dtb__132)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__134, dtb__135) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgs dtb__135) mc1) dtb__131)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__136, dtb__137) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__134, dtb__136)), dtb__137))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc0))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenConApp = (fun st -> (fun binders -> (fun c -> (fun args -> (match ((v_Base_dList_dlookupPair c) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unknown constructor ") c)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__138) -> (match ((v_Base_dList_dlookupPair c) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtorShapes st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: no shape for constructor ") c)))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__139) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dalignCtorArgs c) dtb__139) args)) (fun runtimeArgs -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenConArgs st) binders) runtimeArgs)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__140, dtb__141) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((v_Vuna_dCompiler_dCodegen_dTerm_dconAppText ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__138) c)) dtb__140), dtb__141))))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArm = (fun st -> (fun outer -> (fun alt -> (if ((bi_eq_str (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) "") then ((fun bound -> ((fun patText -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__142, dtb__143) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "  | ") ((bi_concat patText) ((bi_concat " -> ") ((bi_concat dtb__142) "\n")))), dtb__143))))
  | _ -> failwith "DT: impossible branch"
)))) (match (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound) with
  | C_Base_dList_dList_Nil -> "_"
  | C_Base_dList_dList_Cons (dtb__144, dtb__145) -> dtb__144
  | _ -> failwith "DT: impossible branch"
))) (((v_Vuna_dCompiler_dCodegen_dTerm_daltEnv st) outer) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt))) else (match ((v_Base_dList_dlookupPair (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtors st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: unknown constructor ") (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__146) -> (match ((v_Base_dList_dlookupPair (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) (v_Vuna_dCompiler_dCodegen_dTerm_dgsCtorShapes st)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing -> (C_Base_dResult_dResult_Base_dResult_dErr (((bi_concat "DT: internal: no shape for constructor ") (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt))))
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__147) -> ((v_Base_dResult_dandThen (((((v_Vuna_dCompiler_dCodegen_dTerm_daltEnvChecked st) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)) outer) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBinders alt)) dtb__147)) (fun bound -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm (v_Vuna_dCompiler_dCodegen_dTerm_daeSt bound)) (v_Vuna_dCompiler_dCodegen_dTerm_daeEnv bound)) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltBody alt))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__148, dtb__149) -> ((fun cname -> ((fun patText -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "  | ") ((bi_concat patText) ((bi_concat " -> ") ((bi_concat dtb__148) "\n")))), dtb__149))))) ((v_Vuna_dCompiler_dCodegen_dTerm_darmPatternText cname) (v_Vuna_dCompiler_dCodegen_dTerm_daePats bound)))) ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__146) (v_Vuna_dCompiler_dCore_dTerm_dcaseAltName alt)))
  | _ -> failwith "DT: impossible branch"
)))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenArms = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__150, dtb__151) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenArm mc0) mc1) dtb__150)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__152, dtb__153) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenArms dtb__153) mc1) dtb__151)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__154, dtb__155) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat dtb__152) dtb__154), dtb__155))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("", mc0))))
  | _ -> failwith "DT: impossible branch"
))))
and v_Vuna_dCompiler_dCodegen_dTerm_dgenCase = (fun st -> (fun binders -> (fun scrut -> (fun alts -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) binders) scrut)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__156, dtb__157) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenArms dtb__157) binders) alts)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__158, dtb__159) -> ((fun fallback -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat "(match ") ((bi_concat dtb__156) ((bi_concat " with\n") ((bi_concat dtb__158) ((bi_concat fallback) ")"))))), dtb__159))))) (if (v_Vuna_dCompiler_dCodegen_dTerm_dhasFallbackAlt alts) then "" else "  | _ -> failwith \"DT: impossible branch\"\n"))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef = (fun st -> (fun d -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenTerm st) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dElab_dTypes_ddtDefBody d))) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__160, dtb__161) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (v_Vuna_dCompiler_dCodegen_dDecl_dvalueName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d))) ((bi_concat " = ") ((bi_concat (if ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName d)) (v_Vuna_dCompiler_dCodegen_dTerm_dgsThunks st)) then "fun () -> " else "")) dtb__160))), dtb__161))))
  | _ -> failwith "DT: impossible branch"
)))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__162, dtb__163) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupDef mc0) dtb__162)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__164, dtb__165) -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies dtb__165) dtb__163)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__166, dtb__167) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__164, dtb__166)), dtb__167))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc0))))
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec = (fun mc0 -> (fun mc1 -> (match mc1 with
  | C_Base_dList_dList_Cons (dtb__168, dtb__169) -> (match dtb__169 with
  | C_Base_dList_dList_Nil -> ((v_Base_dList_dmemName (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__168)) ((v_Vuna_dCompiler_dCodegen_dErase_dneighborsOf mc0) (v_Vuna_dCompiler_dElab_dTypes_ddtDefName dtb__168)))
  | _ -> true
)
  | C_Base_dList_dList_Nil -> false
  | _ -> failwith "DT: impossible branch"
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup = (fun adj -> (fun st -> (fun group -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroupBodies st) group)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__170, dtb__171) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (((bi_concat (if ((v_Vuna_dCompiler_dCodegen_dTerm_dgroupNeedsRec adj) group) then "let rec " else "let ")) ((v_Vuna_dCompiler_dCodegen_dDecl_djoinWith "\nand ") dtb__170)), dtb__171))))
  | _ -> failwith "DT: impossible branch"
))))))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups = (fun mc0 -> (fun mc1 -> (fun mc2 -> (match mc2 with
  | C_Base_dList_dList_Cons (dtb__172, dtb__173) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroup mc0) mc1) dtb__172)) (fun p -> (match p with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__174, dtb__175) -> ((v_Base_dResult_dandThen (((v_Vuna_dCompiler_dCodegen_dTerm_dgenGroups mc0) dtb__175) dtb__173)) (fun q -> (match q with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__176, dtb__177) -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ((C_Base_dList_dList_Cons (dtb__174, dtb__176)), dtb__177))))
  | _ -> failwith "DT: impossible branch"
)))
  | _ -> failwith "DT: impossible branch"
)))
  | C_Base_dList_dList_Nil -> (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair (C_Base_dList_dList_Nil, mc1))))
  | _ -> failwith "DT: impossible branch"
))))

let v_Vuna_dCompiler_dCodegen_dTerm_dioResultTy = (fun t -> (match t with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTApp (dtb__178, dtb__179, dtb__180) -> (match dtb__178 with
  | C_Vuna_dCompiler_dCore_dTerm_dTerm_Vuna_dCompiler_dCore_dTerm_dTGlobal (dtb__181) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName dtb__181)) "IO") then (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__179)) else C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
)
  | _ -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
))

let v_Vuna_dCompiler_dCodegen_dTerm_dfirstCtorOf = (fun d -> (match (v_Vuna_dCompiler_dElab_dTypes_ddtDataCtors d) with
  | C_Base_dList_dList_Cons (dtb__182, dtb__183) -> (C_Base_dMaybe_dMaybe_Base_dMaybe_dJust ((C_Base_dPair_dPair_Base_dPair_dPair ((v_Vuna_dCompiler_dElab_dTypes_ddtDataName d), (v_Vuna_dCompiler_dElab_dTypes_ddtCtorName dtb__182)))))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let rec v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf = (fun mc0 -> (match mc0 with
  | C_Base_dList_dList_Cons (dtb__184, dtb__185) -> (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName (v_Vuna_dCompiler_dElab_dTypes_ddtDataName dtb__184))) "IO") then (v_Vuna_dCompiler_dCodegen_dTerm_dfirstCtorOf dtb__184) else (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf dtb__185))
  | C_Base_dList_dList_Nil -> C_Base_dMaybe_dMaybe_Base_dMaybe_dNothing
  | _ -> failwith "DT: impossible branch"
))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr = fun () -> (C_Base_dResult_dResult_Base_dResult_dErr ("DT: main must return Int, String or Bool (M13 limitation)"))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName = (fun g -> (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName g)) "Int") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("string_of_int", "int")))) else (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName g)) "String") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_string", "string")))) else (if ((bi_eq_str (v_Vuna_dCompiler_dCodegen_dDecl_dlastName g)) "Bool") then (C_Base_dResult_dResult_Base_dResult_dOk ((C_Base_dPair_dPair_Base_dPair_dPair ("dt_show_bool", "bool")))) else (v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr ())))))

let v_Vuna_dCompiler_dCodegen_dTerm_dmainShow = (fun table -> (fun tyTerm -> (match ((((v_Vuna_dCompiler_dCore_dEval_dforce table) C_Base_dList_dList_Nil) (v_Vuna_dCompiler_dCore_dTerm_ddefaultFuel ())) ((v_Vuna_dCompiler_dCore_dEval_deval C_Base_dList_dList_Nil) tyTerm)) with
  | C_Vuna_dCompiler_dCore_dTerm_dValue_Vuna_dCompiler_dCore_dTerm_dVNeutral (dtb__186) -> (match dtb__186 with
  | C_Vuna_dCompiler_dCore_dTerm_dNeutral_Vuna_dCompiler_dCore_dTerm_dNGlobal (dtb__187, dtb__188) -> (match dtb__188 with
  | C_Base_dList_dList_Nil -> (v_Vuna_dCompiler_dCodegen_dTerm_dmainShowForName dtb__187)
  | _ -> (v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr ())
)
  | _ -> (v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr ())
)
  | _ -> (v_Vuna_dCompiler_dCodegen_dTerm_dmainShowErr ())
)))

let v_Vuna_dCompiler_dCodegen_dTerm_dgenDtHook = (fun bodyText -> (fun table -> (fun tyTerm -> (fun mainExpr -> (fun printResult -> ((v_Base_dResult_dandThen ((v_Vuna_dCompiler_dCodegen_dTerm_dmainShow table) tyTerm)) (fun showPair -> (match showPair with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__189, dtb__190) -> ((fun hook -> (C_Base_dResult_dResult_Base_dResult_dOk (((bi_concat bodyText) ((bi_concat "\n") hook))))) (if printResult then ((bi_concat "let () = print_endline (") ((bi_concat dtb__189) ((bi_concat " (") ((bi_concat mainExpr) "))\n")))) else ((bi_concat "let () = ignore (") ((bi_concat mainExpr) ")\n"))))
  | _ -> failwith "DT: impossible branch"
))))))))

let v_Vuna_dCompiler_dCodegen_dTerm_dioRunText = (fun program -> (fun mainRef -> (match (v_Vuna_dCompiler_dCodegen_dTerm_dioCtorOf (v_Base_dPair_dfirstOf program)) with
  | C_Base_dMaybe_dMaybe_Base_dMaybe_dJust (dtb__191) -> (match dtb__191 with
  | C_Base_dPair_dPair_Base_dPair_dPair (dtb__192, dtb__193) -> ((bi_concat "match ") ((bi_concat mainRef) ((bi_concat " with ") ((bi_concat ((v_Vuna_dCompiler_dCodegen_dDecl_dctorOcamlName dtb__192) dtb__193)) " f -> f 0"))))
  | _ -> failwith "DT: impossible branch"
)
  | _ -> failwith "DT: impossible branch"
)))
