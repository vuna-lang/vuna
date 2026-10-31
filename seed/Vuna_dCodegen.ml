open Vuna_runtime
open Vuna_dPair
open Vuna_dBool
open Vuna_dMonad
open Vuna_dMaybe
open Vuna_dList
open Vuna_dResult
open Vuna_dString
open Vuna_dBase
open Vuna_dToml
open Vuna_dManifest
open Vuna_dPkg
open Vuna_dAst
open Vuna_dLexer
open Vuna_dParser
open Vuna_dBuiltins
open Vuna_dLoader
type   t_Vuna_dCodegen_dBuiltinInfo =
    C_Vuna_dCodegen_dBuiltinInfo of (string) * (string) * (int) * (string)
let show_Vuna_dCodegen_dBuiltinInfo v =
  match v with
  | C_Vuna_dCodegen_dBuiltinInfo (f0, f1, f2, f3) -> show_ctor "BuiltinInfo" [(show_vstring) f0; (show_vstring) f1; (string_of_int) f2; (show_vstring) f3]
let rec v_Vuna_dCodegen_djoinWith = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (sep) in (let vuna_cat2' = (v_Vuna_dCodegen_djoinWith sep rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 8 1 ("no matching clause for Vuna.Codegen.joinWith")

let v_Vuna_dCodegen_druntimeCode = "
type value =
  | VInt of int
  | VStr of string
  | VCon of string * value list
  | VFun of string * (value -> value)

let fail (msg : string) : 'a = failwith msg

let apply (fn : value) (arg : value) : value =
  match fn with
  | VFun (_, f) -> f arg
  | _ -> fail \"cannot apply a non-function\"

let expect_int (name : string) (v : value) : int =
  match v with VInt n -> n | _ -> fail (name ^ \": expected an Int argument\")

let expect_str (name : string) (v : value) : string =
  match v with VStr s -> s | _ -> fail (name ^ \": expected a String argument\")

let vbool (b : bool) : value = VCon ((if b then \"True\" else \"False\"), [])

let expect_bool (name : string) (v : value) : bool =
  match v with
  | VCon (\"True\", []) -> true
  | VCon (\"False\", []) -> false
  | _ -> fail (name ^ \": expected a Bool argument\")

let string_to_value (s : string) : value =
  let n = String.length s in
  let rec go i acc =
    if i < 0 then acc
    else go (i - 1) (VCon (\"Cons\", [ VInt (Char.code s.[i]); acc ]))
  in
  go (n - 1) (VCon (\"Nil\", []))

let value_to_string (v : value) : string =
  let buf = Buffer.create 16 in
  let rec go (v : value) =
    match v with
    | VCon (\"Nil\", []) -> ()
    | VCon (\"Cons\", [ VInt c; rest ]) ->
        if c < 0 || c > 255 then fail \"strPack: character code out of range\";
        Buffer.add_char buf (Char.chr c);
        go rest
    | _ -> fail \"strPack expects a List Int\"
  in
  go v;
  Buffer.contents buf

let list_of_strings (strings : string list) : value =
  List.fold_right
    (fun s acc -> VCon (\"Cons\", [ VStr s; acc ]))
    strings (VCon (\"Nil\", []))

let read_file (path : string) : string =
  try
    let channel = open_in_bin path in
    Fun.protect
      ~finally:(fun () -> close_in_noerr channel)
      (fun () -> really_input_string channel (in_channel_length channel))
  with Sys_error message -> fail (\"readFile: \" ^ message)

let write_file (path : string) (contents : string) : int =
  try
    let channel = open_out_bin path in
    Fun.protect
      ~finally:(fun () -> close_out_noerr channel)
      (fun () -> output_string channel contents);
    String.length contents
  with Sys_error message -> fail (\"writeFile: \" ^ message)

let print_stdout (text : string) : int =
  print_string text;
  flush stdout;
  String.length text

let get_args () : value =
  let argv = Sys.argv in
  let count = Array.length argv in
  let args =
    if count <= 1 then [] else Array.to_list (Array.sub argv 1 (count - 1))
  in
  list_of_strings args

let read_line () = (try input_line stdin with End_of_file -> \"\")

let read_dir (path : string) : string list =
  try List.sort compare (Array.to_list (Sys.readdir path))
  with Sys_error message -> fail (\"readDir: \" ^ message)

let is_directory (path : string) : bool =
  try Sys.is_directory path with Sys_error message -> fail (\"isDirectory: \" ^ message)

let make_dir (path : string) : int =
  try (if Sys.file_exists path then 0 else (Sys.mkdir path 0o755; 0))
  with Sys_error message -> fail (\"makeDir: \" ^ message)

let remove_file (path : string) : int =
  try (if Sys.file_exists path then (Sys.remove path; 0) else 0)
  with Sys_error message -> fail (\"removeFile: \" ^ message)

let bi_add =
  fun a -> VFun (\"+\", fun b -> VInt (expect_int \"+\" a + expect_int \"+\" b))

let bi_sub =
  fun a -> VFun (\"-\", fun b -> VInt (expect_int \"-\" a - expect_int \"-\" b))

let bi_mul =
  fun a -> VFun (\"*\", fun b -> VInt (expect_int \"*\" a * expect_int \"*\" b))

let bi_div =
  fun a ->
    VFun
      ( \"/\",
        fun b ->
          let x = expect_int \"/\" a in
          let y = expect_int \"/\" b in
          if y = 0 then fail \"division by zero\" else VInt (x / y) )

let bi_eq =
  fun a ->
    VFun
      ( \"==\",
        fun b ->
          match (a, b) with
          | VInt x, VInt y -> vbool (x = y)
          | VStr x, VStr y -> vbool (x = y)
          | _ -> fail \"bad arguments for ==\" )

let bi_neq =
  fun a ->
    VFun
      ( \"/=\",
        fun b ->
          match (a, b) with
          | VInt x, VInt y -> vbool (x <> y)
          | VStr x, VStr y -> vbool (x <> y)
          | _ -> fail \"bad arguments for /=\" )

let bi_lt =
  fun a -> VFun (\"<\", fun b -> vbool (expect_int \"<\" a < expect_int \"<\" b))

let bi_le =
  fun a -> VFun (\"<=\", fun b -> vbool (expect_int \"<=\" a <= expect_int \"<=\" b))

let bi_gt =
  fun a -> VFun (\">\", fun b -> vbool (expect_int \">\" a > expect_int \">\" b))

let bi_ge =
  fun a -> VFun (\">=\", fun b -> vbool (expect_int \">=\" a >= expect_int \">=\" b))

let bi_and =
  fun a ->
    VFun
      (\"&&\", fun b -> vbool (expect_bool \"&&\" a && expect_bool \"&&\" b))

let bi_or =
  fun a ->
    VFun (\"||\", fun b -> vbool (expect_bool \"||\" a || expect_bool \"||\" b))

let bi_concat =
  fun a -> VFun (\"++\", fun b -> VStr (expect_str \"++\" a ^ expect_str \"++\" b))

let bi_str_length = fun a -> VInt (String.length (expect_str \"strLength\" a))

let bi_str_unpack =
  fun a -> string_to_value (expect_str \"strUnpack\" a)

let bi_str_pack = fun a -> VStr (value_to_string a)

let bi_str_from_int =
  fun a -> VStr (string_of_int (expect_int \"strFromInt\" a))"

let v_Vuna_dCodegen_dshowPrelude = "
let vuna_short (name : string) : string =
  match String.rindex_opt name '.' with
  | Some index -> String.sub name (index + 1) (String.length name - index - 1)
  | None -> name

let vuna_quote = String.make 1 (Char.chr 34)

let vuna_escape (s : string) : string =
  let buf = Buffer.create (String.length s + 2) in
  let backslash = String.make 1 (Char.chr 92) in
  String.iter
    (fun c ->
      let code = Char.code c in
      if code = 34 then (Buffer.add_string buf backslash; Buffer.add_char buf c)
      else if code = 92 then (Buffer.add_string buf backslash; Buffer.add_char buf c)
      else if code = 10 then (Buffer.add_string buf backslash; Buffer.add_char buf (Char.chr 110))
      else if code = 9 then (Buffer.add_string buf backslash; Buffer.add_char buf (Char.chr 116))
      else if code = 13 then (Buffer.add_string buf backslash; Buffer.add_char buf (Char.chr 114))
      else if code = 8 then (Buffer.add_string buf backslash; Buffer.add_char buf (Char.chr 98))
      else if code >= 32 && code <= 126 then Buffer.add_char buf c
      else (Buffer.add_string buf backslash; Buffer.add_string buf (Printf.sprintf \"%03d\" code)))
    s;
  Buffer.contents buf
"

let v_Vuna_dCodegen_dlastSegment = fun name -> (match v_Vuna_dBase_dsplitLastDot (v_Vuna_dBase_dsplitOnDot name) with
  | C_Vuna_dPair_dPair (before, after) -> after
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 22 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_dsplitCtorFields = fun ty -> (match ty with
  | C_Vuna_dAst_dEApp (C_Vuna_dAst_dEVar ("->", _), (a) :: ((rest) :: ([])), _) -> (a) :: (v_Vuna_dCodegen_dsplitCtorFields rest)
  | _ -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 27 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_dfieldShowFn = fun ty -> (match ty with
  | C_Vuna_dAst_dEVar (name, _) -> if v_vuna_ueq_ustr (v_Vuna_dCodegen_dlastSegment name) "Int" then "vuna_show_int" else if v_vuna_ueq_ustr (v_Vuna_dCodegen_dlastSegment name) "String" then "vuna_show_str" else if v_vuna_ueq_ustr (v_Vuna_dCodegen_dlastSegment name) "Bool" then "vuna_show_bool" else "vuna_show"
  | C_Vuna_dAst_dEApp (fn, args, _) -> (match fn with
  | C_Vuna_dAst_dEVar (name, _) -> (match args with
  | (a) :: ([]) -> if v_vuna_ueq_ustr (v_Vuna_dCodegen_dlastSegment name) "List" then (let vuna_cat0' = ("(vuna_show_list ") in (let vuna_cat1' = (v_Vuna_dCodegen_dfieldShowFn a) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) else "vuna_show"
  | _ -> "vuna_show"
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 44 11 ("case pattern match failure"))
  | _ -> "vuna_show"
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 42 7 ("case pattern match failure"))
  | _ -> "vuna_show"
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 35 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_dgenFieldShows = fun a0 a1 -> match (a0, a1) with
  | ([], []) -> []
  | ((f) :: (fs), (v) :: (vs)) -> ((let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCodegen_dfieldShowFn f) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) :: (v_Vuna_dCodegen_dgenFieldShows fs vs)
  | (_, _) -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 52 1 ("no matching clause for Vuna.Codegen.genFieldShows")

let v_Vuna_dCodegen_dctorShort = fun c -> v_Vuna_dCodegen_dlastSegment (v_Vuna_dAst_dctorName c)

let rec v_Vuna_dCodegen_dallDataCtors = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, derivings, sp) -> v_Vuna_dList_dappend ctors (v_Vuna_dCodegen_dallDataCtors rest)
  | _ -> v_Vuna_dCodegen_dallDataCtors rest
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 86 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 84 1 ("no matching clause for Vuna.Codegen.allDataCtors")

let v_Vuna_dCodegen_druntimeCompareCode = "
let rec value_compare (a : value) (b : value) : int =
  match a with
  | VInt x -> (match b with VInt y -> if x < y then -1 else if x = y then 0 else 1 | _ -> -1)
  | VStr x -> (match b with VStr y -> compare x y | VInt _ -> 1 | _ -> -1)
  | VCon (n, xs) -> (match b with VCon (m, ys) -> con_compare n xs m ys | _ -> 1)
  | _ -> 0

and con_compare n xs m ys =
  let r = compare n m in
  if r = 0 then list_compare xs ys else r

and list_compare xs ys =
  match xs, ys with
  | [], [] -> 0
  | [], _ :: _ -> -1
  | _ :: _, [] -> 1
  | x :: xr, y :: yr ->
      let r = value_compare x y in
      if r = 0 then list_compare xr yr else r
"

let v_Vuna_dCodegen_dbuiltinInfos = (C_Vuna_dCodegen_dBuiltinInfo ("+", "bi_add", 2, "VInt (expect_int \"+\" a + expect_int \"+\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("-", "bi_sub", 2, "VInt (expect_int \"-\" a - expect_int \"-\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("*", "bi_mul", 2, "VInt (expect_int \"*\" a * expect_int \"*\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("/", "bi_div", 2, "let x = expect_int \"/\" a in let y = expect_int \"/\" b in if y = 0 then fail \"division by zero\" else VInt (x / y)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("==", "bi_eq", 2, "match (a, b) with VInt x, VInt y -> vbool (x = y) | VStr x, VStr y -> vbool (x = y) | _ -> fail \"bad arguments for ==\"")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("/=", "bi_neq", 2, "match (a, b) with VInt x, VInt y -> vbool (x <> y) | VStr x, VStr y -> vbool (x <> y) | _ -> fail \"bad arguments for /=\"")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("<", "bi_lt", 2, "vbool (expect_int \"<\" a < expect_int \"<\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("<=", "bi_le", 2, "vbool (expect_int \"<=\" a <= expect_int \"<=\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo (">", "bi_gt", 2, "vbool (expect_int \">\" a > expect_int \">\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo (">=", "bi_ge", 2, "vbool (expect_int \">=\" a >= expect_int \">=\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_show_string", "bi_show_string", 1, "VStr (vuna_quote ^ vuna_escape (expect_str \"bi_show_string\" a) ^ vuna_quote)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_eq_generic", "bi_eq_generic", 2, "vbool (value_compare a b = 0)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_neq_generic", "bi_neq_generic", 2, "vbool (value_compare a b <> 0)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_lt_generic", "bi_lt_generic", 2, "vbool (value_compare a b < 0)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_le_generic", "bi_le_generic", 2, "vbool (value_compare a b <= 0)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_gt_generic", "bi_gt_generic", 2, "vbool (value_compare a b > 0)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_ge_generic", "bi_ge_generic", 2, "vbool (value_compare a b >= 0)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_eq_int", "bi_eq_int", 2, "vbool (expect_int \"==\" a = expect_int \"==\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_neq_int", "bi_neq_int", 2, "vbool (expect_int \"/=\" a <> expect_int \"/=\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_lt_int", "bi_lt_int", 2, "vbool (expect_int \"<\" a < expect_int \"<\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_le_int", "bi_le_int", 2, "vbool (expect_int \"<=\" a <= expect_int \"<=\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_gt_int", "bi_gt_int", 2, "vbool (expect_int \">\" a > expect_int \">\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_ge_int", "bi_ge_int", 2, "vbool (expect_int \">=\" a >= expect_int \">=\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_eq_str", "bi_eq_str", 2, "vbool (expect_str \"==\" a = expect_str \"==\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_neq_str", "bi_neq_str", 2, "vbool (expect_str \"/=\" a <> expect_str \"/=\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_eq_bool", "bi_eq_bool", 2, "vbool (expect_bool \"==\" a = expect_bool \"==\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("bi_neq_bool", "bi_neq_bool", 2, "vbool (expect_bool \"/=\" a <> expect_bool \"/=\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("&&", "bi_and", 2, "vbool (expect_bool \"&&\" a && expect_bool \"&&\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("||", "bi_or", 2, "vbool (expect_bool \"||\" a || expect_bool \"||\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("++", "bi_concat", 2, "VStr (expect_str \"++\" a ^ expect_str \"++\" b)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("strLength", "bi_str_length", 1, "VInt (String.length (expect_str \"strLength\" a))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("strUnpack", "bi_str_unpack", 1, "string_to_value (expect_str \"strUnpack\" a)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("strPack", "bi_str_pack", 1, "VStr (value_to_string a)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("strFromInt", "bi_str_from_int", 1, "VStr (string_of_int (expect_int \"strFromInt\" a))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("readFile", "bi_read_file", 1, "VStr (read_file (expect_str \"readFile\" a))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("writeFile", "bi_write_file", 2, "VInt (write_file (expect_str \"writeFile\" a) (expect_str \"writeFile\" b))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("print", "bi_print", 1, "let text = expect_str \"print\" a in VInt (print_stdout text)")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("getArgs", "bi_get_args", 0, "get_args ()")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("readLine", "bi_read_line", 0, "VStr (read_line ())")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("readDir", "bi_read_dir", 1, "list_of_strings (read_dir (expect_str \"readDir\" a))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("isDirectory", "bi_is_directory", 1, "vbool (is_directory (expect_str \"isDirectory\" a))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("makeDir", "bi_make_dir", 1, "VInt (make_dir (expect_str \"makeDir\" a))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("removeFile", "bi_remove_file", 1, "VInt (remove_file (expect_str \"removeFile\" a))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("fileExists", "bi_file_exists", 1, "vbool (Sys.file_exists (expect_str \"fileExists\" a))")) :: ((C_Vuna_dCodegen_dBuiltinInfo ("exit", "bi_exit", 1, "exit (expect_int \"exit\" a)")) :: ([])))))))))))))))))))))))))))))))))))))))))))))

let rec v_Vuna_dCodegen_dfindBuiltin = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dMaybe_dNothing
  | (name, (C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body)) :: (rest)) -> if v_vuna_ueq_ustr vname name then C_Vuna_dMaybe_dJust (C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body)) else v_Vuna_dCodegen_dfindBuiltin name rest
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 163 1 ("no matching clause for Vuna.Codegen.findBuiltin")

let rec v_Vuna_dCodegen_djoinList = fun a0 a1 -> match (a0, a1) with
  | (sep, []) -> ""
  | (sep, (x) :: ([])) -> x
  | (sep, (x) :: (rest)) -> (let vuna_cat0' = (x) in (let vuna_cat1' = (sep) in (let vuna_cat2' = (v_Vuna_dCodegen_djoinList sep rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 167 1 ("no matching clause for Vuna.Codegen.joinList")

let v_Vuna_dCodegen_dheadOf = fun a0 -> match a0 with
  | ([]) -> ""
  | ((x) :: (rest)) -> x
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 171 1 ("no matching clause for Vuna.Codegen.headOf")

let rec v_Vuna_dCodegen_dnthList = fun a0 a1 -> match (a0, a1) with
  | (n, []) -> ""
  | (n, (x) :: (rest)) -> if v_vuna_ueq_uint n 0 then x else v_Vuna_dCodegen_dnthList (bi_sub n 1) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 174 1 ("no matching clause for Vuna.Codegen.nthList")

let v_Vuna_dCodegen_dsanitizeChar = fun c -> if v_vuna_ueq_uint c 46 then (95) :: ((100) :: ([])) else if v_vuna_ueq_uint c 95 then (95) :: ((117) :: ([])) else if v_vuna_ueq_uint c 39 then (95) :: ((112) :: ([])) else (c) :: ([])

let v_Vuna_dCodegen_dsanitizeName = fun name -> bi_str_pack (v_Vuna_dList_dconcatMap v_Vuna_dCodegen_dsanitizeChar (bi_str_unpack name))

let v_Vuna_dCodegen_dpad3 = fun s -> if v_vuna_ueq_uint (bi_str_length s) 1 then (("00") ^ (s)) else if v_vuna_ueq_uint (bi_str_length s) 2 then (("0") ^ (s)) else s

let v_Vuna_dCodegen_descapeChar = fun c -> if v_vuna_ueq_uint c 34 then (92) :: ((34) :: ([])) else if v_vuna_ueq_uint c 92 then (92) :: ((92) :: ([])) else if v_vuna_ueq_uint c 10 then (92) :: ((110) :: ([])) else if v_vuna_ueq_uint c 9 then (92) :: ((116) :: ([])) else if v_vuna_ueq_uint c 13 then (92) :: ((114) :: ([])) else if (if (v_vuna_uge_uint c 32) then (v_vuna_ule_uint c 126) else false) then (c) :: ([]) else bi_str_unpack ((("\\") ^ (v_Vuna_dCodegen_dpad3 (bi_str_from_int c))))

let v_Vuna_dCodegen_docamlString = fun s -> (let vuna_cat0' = ("\"") in (let vuna_cat1' = (bi_str_pack (v_Vuna_dList_dconcatMap v_Vuna_dCodegen_descapeChar (bi_str_unpack s))) in (let vuna_cat2' = ("\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))

let v_Vuna_dCodegen_dctorShowBody = fun a0 a1 -> match (a0, a1) with
  | (short, []) -> v_Vuna_dCodegen_docamlString short
  | (short, shows) -> (let vuna_cat0' = ("\"(\" ^ ") in (let vuna_cat1' = (v_Vuna_dCodegen_docamlString short) in (let vuna_cat2' = (" ^ \" \" ^ ") in (let vuna_cat3' = (v_Vuna_dCodegen_djoinList " ^ \" \" ^ " shows) in (let vuna_cat4' = (" ^ \")\"") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 59 1 ("no matching clause for Vuna.Codegen.ctorShowBody")

let rec v_Vuna_dCodegen_dgenCtorArms = fun a0 -> match a0 with
  | ([]) -> ""
  | ((c) :: (rest)) -> (let vuna_cat0' = ("  | ") in (let vuna_cat1' = (v_Vuna_dCodegen_docamlString (v_Vuna_dCodegen_dctorShort c)) in (let vuna_cat2' = (" -> vuna_show_ctor_") in (let vuna_cat3' = (v_Vuna_dCodegen_dsanitizeName (v_Vuna_dCodegen_dctorShort c)) in (let vuna_cat4' = (" args\n") in (let vuna_cat5' = (v_Vuna_dCodegen_dgenCtorArms rest) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 76 1 ("no matching clause for Vuna.Codegen.genCtorArms")

let v_Vuna_dCodegen_dgenVar = fun decls scope name -> if v_Vuna_dList_dmemName name scope then C_Vuna_dResult_dOk ((("x_") ^ (v_Vuna_dCodegen_dsanitizeName name))) else (match v_Vuna_dAst_dfunArity name decls with
  | C_Vuna_dMaybe_dJust (0) -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("v_") in (let vuna_cat1' = (v_Vuna_dCodegen_dsanitizeName name) in (let vuna_cat2' = (" ()") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dMaybe_dJust (arity) -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("VFun (") in (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in (let vuna_cat2' = (", v_") in (let vuna_cat3' = (v_Vuna_dCodegen_dsanitizeName name) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dMaybe_dJust (0) -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("VCon (") in (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in (let vuna_cat2' = (", [])") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dMaybe_dJust (arity) -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("VFun (") in (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in (let vuna_cat2' = (", mk_") in (let vuna_cat3' = (v_Vuna_dCodegen_dsanitizeName name) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Vuna_dMaybe_dNothing -> (match v_Vuna_dCodegen_dfindBuiltin name v_Vuna_dCodegen_dbuiltinInfos with
  | C_Vuna_dMaybe_dJust (C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body)) -> if v_vuna_ueq_uint arity 0 then C_Vuna_dResult_dOk (((ocname) ^ (" ()"))) else C_Vuna_dResult_dOk ((let vuna_cat0' = ("VFun (") in (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in (let vuna_cat2' = (", ") in (let vuna_cat3' = (ocname) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ((("unbound variable: ") ^ (name)))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 216 13 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 209 9 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 204 5 ("case pattern match failure"))

let v_Vuna_dCodegen_dpconPattern = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> (let vuna_cat0' = ("VCon (") in (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in (let vuna_cat2' = (", [])") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'])))
  | (name, pats) -> (let vuna_cat0' = ("VCon (") in (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in (let vuna_cat2' = (", [") in (let vuna_cat3' = (v_Vuna_dCodegen_djoinList "; " pats) in (let vuna_cat4' = ("])") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 222 1 ("no matching clause for Vuna.Codegen.pconPattern")

let rec v_Vuna_dCodegen_dgenPattern = fun pat -> (match pat with
  | C_Vuna_dAst_dPWild (_) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ("_", []))
  | C_Vuna_dAst_dPVar (name, _) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ((("x_") ^ (v_Vuna_dCodegen_dsanitizeName name)), (name) :: ([])))
  | C_Vuna_dAst_dPInt (n, _) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ((let vuna_cat0' = ("VInt (") in (let vuna_cat1' = (bi_str_from_int n) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))), []))
  | C_Vuna_dAst_dPStr (s, _) -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair ((("VStr ") ^ (v_Vuna_dCodegen_docamlString s)), []))
  | C_Vuna_dAst_dPCon (name, pats, _) -> v_Vuna_dResult_dandThen (v_Vuna_dResult_dtraverse v_Vuna_dCodegen_dgenPattern pats) (fun parts -> C_Vuna_dResult_dOk (C_Vuna_dPair_dPair (v_Vuna_dCodegen_dpconPattern name (v_Vuna_dList_dmap v_Vuna_dPair_dfirstOf parts), v_Vuna_dList_dconcatMap v_Vuna_dPair_dsecondOf parts)))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 227 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_drecBindNames = fun a0 -> match a0 with
  | ([]) -> []
  | ((C_Vuna_dPair_dPair (C_Vuna_dAst_dPVar (name, _), _)) :: (rest)) -> (name) :: (v_Vuna_dCodegen_drecBindNames rest)
  | ((C_Vuna_dPair_dPair (_, _)) :: (_)) -> []
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 283 1 ("no matching clause for Vuna.Codegen.recBindNames")

let rec v_Vuna_dCodegen_dcgApplyFold = fun a0 a1 -> match (a0, a1) with
  | (acc, []) -> acc
  | (acc, (a) :: (rest)) -> v_Vuna_dCodegen_dcgApplyFold ((let vuna_cat0' = ("(apply (") in (let vuna_cat1' = (acc) in (let vuna_cat2' = (") (") in (let vuna_cat3' = (a) in (let vuna_cat4' = ("))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 294 1 ("no matching clause for Vuna.Codegen.cgApplyFold")

let rec v_Vuna_dCodegen_dgenLambda = fun decls scope params body -> (match params with
  | [] -> v_Vuna_dCodegen_dgenExpr decls scope body
  | (p) :: (rest) -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenLambda decls ((p) :: (scope)) rest body) (fun inner -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("VFun (\"\", fun x_") in (let vuna_cat1' = (v_Vuna_dCodegen_dsanitizeName p) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (inner) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'])))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 239 3 ("case pattern match failure"))
and v_Vuna_dCodegen_dgenAlt = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, scope, C_Vuna_dPair_dPair (pat, body)) -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenPattern pat) (fun p -> (match p with
  | C_Vuna_dPair_dPair (patCode, bound) -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls (v_Vuna_dList_dappend bound scope) body) (fun bodyCode -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("| ") in (let vuna_cat1' = (patCode) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (bodyCode) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 247 5 ("case pattern match failure")))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 245 1 ("no matching clause for Vuna.Codegen.genAlt")
and v_Vuna_dCodegen_dgenCase = fun decls scope scrut alts -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls scope scrut) (fun scrutCode -> v_Vuna_dResult_dandThen (v_Vuna_dResult_dtraverse (v_Vuna_dCodegen_dgenAlt decls scope) alts) (fun branches -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(match (") in (let vuna_cat1' = (scrutCode) in (let vuna_cat2' = (") with\n    ") in (let vuna_cat3' = (v_Vuna_dCodegen_djoinList "\n    " branches) in (let vuna_cat4' = ("\n    | _ -> fail \"case pattern match failure\")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
and v_Vuna_dCodegen_dgenLet = fun decls scope rec_u binds body -> if rec_u then v_Vuna_dCodegen_dgenRecLet decls scope binds body else v_Vuna_dCodegen_dgenLetSeq decls scope binds body
and v_Vuna_dCodegen_dgenLetSeq = fun decls scope binds body -> (match binds with
  | [] -> v_Vuna_dCodegen_dgenExpr decls scope body
  | (C_Vuna_dPair_dPair (pat, value)) :: (rest) -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls scope value) (fun valueCode -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenPattern pat) (fun p -> (match p with
  | C_Vuna_dPair_dPair (patCode, bound) -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenLetSeq decls (v_Vuna_dList_dappend bound scope) rest body) (fun bodyCode -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(let ") in (let vuna_cat1' = (patCode) in (let vuna_cat2' = (" = (") in (let vuna_cat3' = (valueCode) in (let vuna_cat4' = (") in ") in (let vuna_cat5' = (bodyCode) in (let vuna_cat6' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 270 11 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 265 3 ("case pattern match failure"))
and v_Vuna_dCodegen_dgenRecLet = fun decls scope binds body -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenRecDefs decls (v_Vuna_dList_dappend (v_Vuna_dCodegen_drecBindNames binds) scope) binds) (fun defs -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls (v_Vuna_dList_dappend (v_Vuna_dCodegen_drecBindNames binds) scope) body) (fun b -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(let rec ") in (let vuna_cat1' = (v_Vuna_dCodegen_djoinWith " and " defs) in (let vuna_cat2' = (" in ") in (let vuna_cat3' = (b) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
and v_Vuna_dCodegen_dgenRecDefs = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, scope, []) -> C_Vuna_dResult_dOk ([])
  | (decls, scope, (C_Vuna_dPair_dPair (C_Vuna_dAst_dPVar (name, _), value)) :: (rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls scope value) (fun v -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenRecDefs decls scope rest) (fun tail -> C_Vuna_dResult_dOk (((let vuna_cat0' = ("x_") in (let vuna_cat1' = (v_Vuna_dCodegen_dsanitizeName name) in (let vuna_cat2' = (" = ") in (let vuna_cat3' = (v) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (tail))))
  | (decls, scope, (C_Vuna_dPair_dPair (_, _)) :: (_)) -> C_Vuna_dResult_dErr ("recursive let bindings must be simple names")
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 287 1 ("no matching clause for Vuna.Codegen.genRecDefs")
and v_Vuna_dCodegen_dgenApply = fun decls scope fn args -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls scope fn) (fun fnCode -> v_Vuna_dResult_dandThen (v_Vuna_dResult_dtraverse (fun a -> v_Vuna_dCodegen_dgenExpr decls scope a) args) (fun argCodes -> C_Vuna_dResult_dOk (v_Vuna_dCodegen_dcgApplyFold fnCode argCodes)))
and v_Vuna_dCodegen_dgenAndShort = fun decls scope a b -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls scope a) (fun ac -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls scope b) (fun bc -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(let vuna_and' = (") in (let vuna_cat1' = (ac) in (let vuna_cat2' = (") in (match vuna_and' with VCon (\"True\", []) -> (match (") in (let vuna_cat3' = (bc) in (let vuna_cat4' = (") with VCon (\"True\", []) -> VCon (\"True\", []) | VCon (\"False\", []) -> VCon (\"False\", []) | _ -> fail \"expected a Bool\") | VCon (\"False\", []) -> VCon (\"False\", []) | _ -> fail \"expected a Bool\"))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
and v_Vuna_dCodegen_dgenOrShort = fun decls scope a b -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls scope a) (fun ac -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls scope b) (fun bc -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(let vuna_or' = (") in (let vuna_cat1' = (ac) in (let vuna_cat2' = (") in (match vuna_or' with VCon (\"True\", []) -> VCon (\"True\", []) | VCon (\"False\", []) -> (match (") in (let vuna_cat3' = (bc) in (let vuna_cat4' = (") with VCon (\"True\", []) -> VCon (\"True\", []) | VCon (\"False\", []) -> VCon (\"False\", []) | _ -> fail \"expected a Bool\") | _ -> fail \"expected a Bool\"))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
and v_Vuna_dCodegen_dgenEApp = fun decls scope fn args -> (match fn with
  | C_Vuna_dAst_dEVar ("&&", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dCodegen_dgenAndShort decls scope a b
  | _ -> v_Vuna_dCodegen_dgenApply decls scope fn args
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 332 7 ("case pattern match failure"))
  | C_Vuna_dAst_dEVar ("||", _) -> (match args with
  | (a) :: ((b) :: ([])) -> v_Vuna_dCodegen_dgenOrShort decls scope a b
  | _ -> v_Vuna_dCodegen_dgenApply decls scope fn args
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 336 7 ("case pattern match failure"))
  | _ -> v_Vuna_dCodegen_dgenApply decls scope fn args
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 330 3 ("case pattern match failure"))
and v_Vuna_dCodegen_dgenExpr = fun decls scope expr -> (match expr with
  | C_Vuna_dAst_dEVar (name, _) -> v_Vuna_dCodegen_dgenVar decls scope name
  | C_Vuna_dAst_dEInt (n, _) -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("VInt (") in (let vuna_cat1' = (bi_str_from_int n) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | C_Vuna_dAst_dEStr (s, _) -> C_Vuna_dResult_dOk ((("VStr ") ^ (v_Vuna_dCodegen_docamlString s)))
  | C_Vuna_dAst_dELam (params, body, _) -> v_Vuna_dCodegen_dgenLambda decls scope params body
  | C_Vuna_dAst_dEApp (fn, args, _) -> v_Vuna_dCodegen_dgenEApp decls scope fn args
  | C_Vuna_dAst_dELet (binds, body, rec_u, _) -> v_Vuna_dCodegen_dgenLet decls scope rec_u binds body
  | C_Vuna_dAst_dECase (scrut, alts, _) -> v_Vuna_dCodegen_dgenCase decls scope scrut alts
  | C_Vuna_dAst_dEIf (c, t, e, _) -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls scope c) (fun cc -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls scope t) (fun tc -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls scope e) (fun ec -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(match (") in (let vuna_cat1' = (cc) in (let vuna_cat2' = (") with VCon (\"True\", []) -> ") in (let vuna_cat3' = (tc) in (let vuna_cat4' = (" | VCon (\"False\", []) -> ") in (let vuna_cat5' = (ec) in (let vuna_cat6' = (" | _ -> fail \"if condition is not a Bool\")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 342 3 ("case pattern match failure"))

let rec v_Vuna_dCodegen_daddClause = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, clause, []) -> (C_Vuna_dPair_dPair (name, (clause) :: ([]))) :: ([])
  | (name, clause, (C_Vuna_dPair_dPair (gname, clauses)) :: (rest)) -> if v_vuna_ueq_ustr gname name then (C_Vuna_dPair_dPair (gname, v_Vuna_dList_dappend clauses ((clause) :: ([])))) :: (rest) else (C_Vuna_dPair_dPair (gname, clauses)) :: (v_Vuna_dCodegen_daddClause name clause rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 369 1 ("no matching clause for Vuna.Codegen.addClause")

let rec v_Vuna_dCodegen_dgroupFunctionsLoop = fun a0 a1 -> match (a0, a1) with
  | ([], groups) -> groups
  | ((d) :: (rest), groups) -> (match d with
  | C_Vuna_dAst_dDFun (name, pats, body, _) -> v_Vuna_dCodegen_dgroupFunctionsLoop rest (v_Vuna_dCodegen_daddClause name (C_Vuna_dPair_dPair (pats, body)) groups)
  | _ -> v_Vuna_dCodegen_dgroupFunctionsLoop rest groups
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 364 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 362 1 ("no matching clause for Vuna.Codegen.groupFunctionsLoop")

let v_Vuna_dCodegen_dgroupFunctions = fun decls -> v_Vuna_dCodegen_dgroupFunctionsLoop decls []

let rec v_Vuna_dCodegen_dcheckArities = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (name, expected, []) -> C_Vuna_dResult_dOk (expected)
  | (name, expected, (C_Vuna_dPair_dPair (pats, body)) :: (rest)) -> if v_vuna_ueq_uint (v_Vuna_dList_dlength pats) expected then v_Vuna_dCodegen_dcheckArities name expected rest else C_Vuna_dResult_dErr ((let vuna_cat0' = ("clauses for ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" have different arities") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 378 1 ("no matching clause for Vuna.Codegen.checkArities")

let v_Vuna_dCodegen_darityOf = fun a0 a1 -> match (a0, a1) with
  | (name, []) -> C_Vuna_dResult_dErr ((let vuna_cat0' = ("function ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" has no clauses") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (name, (C_Vuna_dPair_dPair (pats, body)) :: (rest)) -> v_Vuna_dCodegen_dcheckArities name (v_Vuna_dList_dlength pats) rest
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 375 1 ("no matching clause for Vuna.Codegen.arityOf")

let rec v_Vuna_dCodegen_dctorPairs = fun a0 -> match a0 with
  | ([]) -> []
  | ((c) :: (rest)) -> (C_Vuna_dPair_dPair (v_Vuna_dAst_dctorName c, v_Vuna_dAst_dctorArityOf c)) :: (v_Vuna_dCodegen_dctorPairs rest)
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 383 1 ("no matching clause for Vuna.Codegen.ctorPairs")

let rec v_Vuna_dCodegen_dallCtors = fun a0 -> match a0 with
  | ([]) -> []
  | ((d) :: (rest)) -> (match d with
  | C_Vuna_dAst_dDData (dname, params, ctors, _, _) -> v_Vuna_dList_dappend (v_Vuna_dCodegen_dctorPairs ctors) (v_Vuna_dCodegen_dallCtors rest)
  | _ -> v_Vuna_dCodegen_dallCtors rest
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 389 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 387 1 ("no matching clause for Vuna.Codegen.allCtors")

let rec v_Vuna_dCodegen_dvalidateCtors = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dResult_dOk ([])
  | ((C_Vuna_dPair_dPair (name, arity)) :: (rest)) -> if v_Vuna_dList_dmemName name (v_Vuna_dList_dmap v_Vuna_dPair_dfirstOf rest) then C_Vuna_dResult_dErr ((("duplicate constructor: ") ^ (name))) else v_Vuna_dCodegen_dvalidateCtors rest
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 393 1 ("no matching clause for Vuna.Codegen.validateCtors")

let rec v_Vuna_dCodegen_dcheckNoCtorFun = fun a0 a1 -> match (a0, a1) with
  | ([], decls) -> C_Vuna_dResult_dOk ([])
  | ((C_Vuna_dPair_dPair (name, clauses)) :: (rest), decls) -> (match v_Vuna_dAst_dctorArity name decls with
  | C_Vuna_dMaybe_dJust (arity) -> C_Vuna_dResult_dErr ((("name is both a constructor and a function: ") ^ (name)))
  | C_Vuna_dMaybe_dNothing -> v_Vuna_dCodegen_dcheckNoCtorFun rest decls
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 401 3 ("case pattern match failure"))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 399 1 ("no matching clause for Vuna.Codegen.checkNoCtorFun")

let rec v_Vuna_dCodegen_dmakeParamsFrom = fun i n -> if v_vuna_ugt_uint i n then [] else ((("a") ^ (bi_str_from_int i))) :: (v_Vuna_dCodegen_dmakeParamsFrom (bi_add i 1) n)

let v_Vuna_dCodegen_dmakeParams = fun n -> v_Vuna_dCodegen_dmakeParamsFrom 1 n

let rec v_Vuna_dCodegen_dmakeCtorParamsFrom = fun i n -> if v_vuna_ugt_uint i n then [] else ((("c") ^ (bi_str_from_int i))) :: (v_Vuna_dCodegen_dmakeCtorParamsFrom (bi_add i 1) n)

let v_Vuna_dCodegen_dmakeCtorParams = fun n -> v_Vuna_dCodegen_dmakeCtorParamsFrom 1 n

let v_Vuna_dCodegen_dgenCtorShow = fun c -> (let short = v_Vuna_dCodegen_dctorShort c in (let fields = v_Vuna_dCodegen_dsplitCtorFields (v_Vuna_dAst_dctorType c) in (let vars = v_Vuna_dCodegen_dmakeCtorParams (v_Vuna_dList_dlength fields) in (let shows = v_Vuna_dCodegen_dgenFieldShows fields vars in (let vuna_cat0' = ("and vuna_show_ctor_") in (let vuna_cat1' = (v_Vuna_dCodegen_dsanitizeName short) in (let vuna_cat2' = (" (args : value list) : string =\n  match args with\n  | [") in (let vuna_cat3' = (v_Vuna_dCodegen_djoinList "; " vars) in (let vuna_cat4' = ("] -> ") in (let vuna_cat5' = (v_Vuna_dCodegen_dctorShowBody short shows) in (let vuna_cat6' = ("\n  | _ -> vuna_show_con_generic ") in (let vuna_cat7' = (v_Vuna_dCodegen_docamlString short) in (let vuna_cat8' = (" args\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'])))))))))))))

let rec v_Vuna_dCodegen_dgenCtorShows = fun a0 -> match a0 with
  | ([]) -> ""
  | ((c) :: (rest)) -> ((v_Vuna_dCodegen_dgenCtorShow c) ^ (v_Vuna_dCodegen_dgenCtorShows rest))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 81 1 ("no matching clause for Vuna.Codegen.genCtorShows")

let v_Vuna_dCodegen_dgenShowDefs = fun decls -> (let ctors = v_Vuna_dCodegen_dallDataCtors decls in (let vuna_cat0' = (v_Vuna_dCodegen_dshowPrelude) in (let vuna_cat1' = ("
let rec vuna_show (v : value) : string =
  match v with
  | VInt n -> string_of_int n
  | VStr s -> vuna_quote ^ vuna_escape s ^ vuna_quote
  | VFun (\"\", _) -> \"<lambda>\"
  | VFun (name, _) -> \"<function \" ^ vuna_short name ^ \">\"
  | VCon (name, args) -> vuna_show_con (vuna_short name) args

and vuna_show_con (name : string) (args : value list) : string =
  match name with
") in (let vuna_cat2' = (v_Vuna_dCodegen_dgenCtorArms ctors) in (let vuna_cat3' = ("  | _ -> vuna_show_con_generic name args

and vuna_show_con_generic (name : string) (args : value list) : string =
  match args with
  | [] -> name
  | _ -> \"(\" ^ name ^ \" \" ^ String.concat \" \" (List.map vuna_show args) ^ \")\"

and vuna_show_int (v : value) : string =
  match v with VInt n -> string_of_int n | _ -> vuna_show v

and vuna_show_str (v : value) : string =
  match v with VStr s -> vuna_quote ^ vuna_escape s ^ vuna_quote | _ -> vuna_show v

and vuna_show_bool (v : value) : string =
  match v with
  | VCon (\"True\", []) -> \"True\"
  | VCon (\"False\", []) -> \"False\"
  | _ -> vuna_show v

and vuna_show_list (sh : value -> string) (v : value) : string =
  match v with
  | VCon (\"Nil\", []) -> \"Nil\"
  | VCon (\"Cons\", [ x; xs ]) -> \"(Cons \" ^ sh x ^ \" \" ^ vuna_show_list sh xs ^ \")\"
  | _ -> vuna_show v
") in (let vuna_cat4' = (v_Vuna_dCodegen_dgenCtorShows ctors) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))

let rec v_Vuna_dCodegen_dgenBranches = fun a0 a1 a2 -> match (a0, a1, a2) with
  | (decls, arity, []) -> C_Vuna_dResult_dOk ([])
  | (decls, arity, (C_Vuna_dPair_dPair (pats, body)) :: (rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dResult_dtraverse v_Vuna_dCodegen_dgenPattern pats) (fun parts -> (let patternCode = if v_vuna_ueq_uint arity 1 then v_Vuna_dCodegen_dheadOf (v_Vuna_dList_dmap v_Vuna_dPair_dfirstOf parts) else (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCodegen_djoinList ", " (v_Vuna_dList_dmap v_Vuna_dPair_dfirstOf parts)) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls (v_Vuna_dList_dconcatMap v_Vuna_dPair_dsecondOf parts) body) (fun b -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenBranches decls arity rest) (fun restBranches -> C_Vuna_dResult_dOk (((let vuna_cat0' = ("| ") in (let vuna_cat1' = (patternCode) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (b) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3']))))) :: (restBranches))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 418 1 ("no matching clause for Vuna.Codegen.genBranches")

let rec v_Vuna_dCodegen_dwrapFun = fun name params matchCode k -> if v_vuna_ueq_uint k (bi_sub (v_Vuna_dList_dlength params) 1) then (let vuna_cat0' = ("(fun ") in (let vuna_cat1' = (v_Vuna_dCodegen_dnthList k params) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (matchCode) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) else (let vuna_cat0' = ("(fun ") in (let vuna_cat1' = (v_Vuna_dCodegen_dnthList k params) in (let vuna_cat2' = (" -> VFun (") in (let vuna_cat3' = (v_Vuna_dCodegen_docamlString name) in (let vuna_cat4' = (", ") in (let vuna_cat5' = (v_Vuna_dCodegen_dwrapFun name params matchCode (bi_add k 1)) in (let vuna_cat6' = ("))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))

let v_Vuna_dCodegen_dgenFunction = fun decls name clauses -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_darityOf name clauses) (fun arity -> (match clauses with
  | [] -> C_Vuna_dResult_dErr ((let vuna_cat0' = ("function ") in (let vuna_cat1' = (name) in (let vuna_cat2' = (" has no clauses") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))
  | (C_Vuna_dPair_dPair (pats, body)) :: (_) -> if v_vuna_ueq_uint arity 0 then v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenExpr decls [] body) (fun b -> C_Vuna_dResult_dOk ((let vuna_cat0' = ("(fun () -> ") in (let vuna_cat1' = (b) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))))) else (let params = v_Vuna_dCodegen_dmakeParams arity in (let scrutinee = if v_vuna_ueq_uint arity 1 then v_Vuna_dCodegen_dheadOf params else (let vuna_cat0' = ("(") in (let vuna_cat1' = (v_Vuna_dCodegen_djoinList ", " params) in (let vuna_cat2' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2']))) in v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenBranches decls arity clauses) (fun branches -> (let matchCode = (let vuna_cat0' = ("(match (") in (let vuna_cat1' = (scrutinee) in (let vuna_cat2' = (") with\n    ") in (let vuna_cat3' = (v_Vuna_dCodegen_djoinList "\n    " branches) in (let vuna_cat4' = ("\n    | _ -> fail \"no matching clause for ") in (let vuna_cat5' = (name) in (let vuna_cat6' = ("\")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))) in C_Vuna_dResult_dOk (v_Vuna_dCodegen_dwrapFun name params matchCode 0)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 428 5 ("case pattern match failure")))

let rec v_Vuna_dCodegen_dwrapCtor = fun name params body k -> if v_vuna_ueq_uint k (bi_sub (v_Vuna_dList_dlength params) 1) then (let vuna_cat0' = ("(fun ") in (let vuna_cat1' = (v_Vuna_dCodegen_dnthList k params) in (let vuna_cat2' = (" -> ") in (let vuna_cat3' = (body) in (let vuna_cat4' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) else (let vuna_cat0' = ("(fun ") in (let vuna_cat1' = (v_Vuna_dCodegen_dnthList k params) in (let vuna_cat2' = (" -> VFun (") in (let vuna_cat3' = (v_Vuna_dCodegen_docamlString name) in (let vuna_cat4' = (", ") in (let vuna_cat5' = (v_Vuna_dCodegen_dwrapCtor name params body (bi_add k 1)) in (let vuna_cat6' = ("))") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'])))))))

let v_Vuna_dCodegen_dgenCtor = fun a0 -> match a0 with
  | (C_Vuna_dPair_dPair (name, arity)) -> if v_vuna_ueq_uint arity 0 then C_Vuna_dResult_dOk ("") else (let params = v_Vuna_dCodegen_dmakeCtorParams arity in (let body = (let vuna_cat0' = ("VCon (") in (let vuna_cat1' = (v_Vuna_dCodegen_docamlString name) in (let vuna_cat2' = (", [") in (let vuna_cat3' = (v_Vuna_dCodegen_djoinList "; " params) in (let vuna_cat4' = ("])") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) in C_Vuna_dResult_dOk ((let vuna_cat0' = ("let mk_") in (let vuna_cat1' = (v_Vuna_dCodegen_dsanitizeName name) in (let vuna_cat2' = (" = ") in (let vuna_cat3' = (v_Vuna_dCodegen_dwrapCtor name params body 0) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 448 1 ("no matching clause for Vuna.Codegen.genCtor")

let rec v_Vuna_dCodegen_dgenCtorDefs = fun a0 -> match a0 with
  | ([]) -> C_Vuna_dResult_dOk ("")
  | ((c) :: (rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenCtor c) (fun def -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenCtorDefs rest) (fun restDefs -> C_Vuna_dResult_dOk (((def) ^ (restDefs)))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 464 1 ("no matching clause for Vuna.Codegen.genCtorDefs")

let rec v_Vuna_dCodegen_dgenBuiltinDef = fun a0 -> match a0 with
  | ([]) -> ""
  | ((C_Vuna_dCodegen_dBuiltinInfo (vname, ocname, arity, body)) :: (rest)) -> (let def = if v_vuna_ueq_uint arity 0 then (let vuna_cat0' = ("let ") in (let vuna_cat1' = (ocname) in (let vuna_cat2' = (" = fun () -> ") in (let vuna_cat3' = (body) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) else if v_vuna_ueq_uint arity 1 then (let vuna_cat0' = ("let ") in (let vuna_cat1' = (ocname) in (let vuna_cat2' = (" = fun a -> ") in (let vuna_cat3' = (body) in (let vuna_cat4' = ("\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4']))))) else (let vuna_cat0' = ("let ") in (let vuna_cat1' = (ocname) in (let vuna_cat2' = (" = fun a -> VFun (") in (let vuna_cat3' = (v_Vuna_dCodegen_docamlString vname) in (let vuna_cat4' = (", fun b -> ") in (let vuna_cat5' = (body) in (let vuna_cat6' = (")\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))) in ((def) ^ (v_Vuna_dCodegen_dgenBuiltinDef rest)))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 469 1 ("no matching clause for Vuna.Codegen.genBuiltinDef")

let rec v_Vuna_dCodegen_dgenFunctions = fun a0 a1 -> match (a0, a1) with
  | (decls, []) -> C_Vuna_dResult_dOk ([])
  | (decls, (C_Vuna_dPair_dPair (name, clauses)) :: (rest)) -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenFunction decls name clauses) (fun def -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenFunctions decls rest) (fun defs -> C_Vuna_dResult_dOk ((C_Vuna_dPair_dPair (name, def)) :: (defs))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 474 1 ("no matching clause for Vuna.Codegen.genFunctions")

let rec v_Vuna_dCodegen_drenderRecsFrom = fun a0 a1 -> match (a0, a1) with
  | ([], index) -> ""
  | ((f) :: (rest), index) -> (let prefix = if v_vuna_ueq_uint index 0 then "let rec " else "and " in (let vuna_cat0' = (prefix) in (let vuna_cat1' = ("v_") in (let vuna_cat2' = (v_Vuna_dCodegen_dsanitizeName (v_Vuna_dPair_dfirstOf f)) in (let vuna_cat3' = (" = ") in (let vuna_cat4' = (v_Vuna_dPair_dsecondOf f) in (let vuna_cat5' = ("\n") in (let vuna_cat6' = (v_Vuna_dCodegen_drenderRecsFrom rest (bi_add index 1)) in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 480 1 ("no matching clause for Vuna.Codegen.renderRecsFrom")

let v_Vuna_dCodegen_dgenerateProgram = fun decls printResult -> (match v_Vuna_dCodegen_dallCtors decls with
  | ctors -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dvalidateCtors ctors) (fun _u -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dcheckNoCtorFun (v_Vuna_dCodegen_dgroupFunctions decls) decls) (fun _u -> (match v_Vuna_dAst_dfunArity "main" decls with
  | C_Vuna_dMaybe_dJust (0) -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenFunctions decls (v_Vuna_dCodegen_dgroupFunctions decls)) (fun defs -> v_Vuna_dResult_dandThen (v_Vuna_dCodegen_dgenCtorDefs ctors) (fun ctorDefs -> C_Vuna_dResult_dOk ((let vuna_cat0' = (v_Vuna_dCodegen_druntimeCode) in (let vuna_cat1' = (v_Vuna_dCodegen_druntimeCompareCode) in (let vuna_cat2' = (v_Vuna_dCodegen_dgenShowDefs decls) in (let vuna_cat3' = (ctorDefs) in (let vuna_cat4' = (v_Vuna_dCodegen_dgenBuiltinDef v_Vuna_dCodegen_dbuiltinInfos) in (let vuna_cat5' = (v_Vuna_dCodegen_drenderRecsFrom defs 0) in (let vuna_cat6' = (if printResult then "let () = print_endline (vuna_show (v_main ()))\n" else "let () = ignore (v_main ())\n") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6']))))))))))
  | C_Vuna_dMaybe_dJust (arity) -> C_Vuna_dResult_dErr ("`main` must be a nullary definition")
  | C_Vuna_dMaybe_dNothing -> C_Vuna_dResult_dErr ("no `main` definition")
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 491 11 ("case pattern match failure"))))
  | _ -> vuna_fail "compiler/lib/Vuna/Codegen.vuna" 487 3 ("case pattern match failure"))

let v_vuna_ushow_uVuna_uCodegen_uBuiltinInfo = fun x -> (match x with
  | C_Vuna_dCodegen_dBuiltinInfo (v0, v1, v2, v3) -> (let vuna_cat0' = ("(BuiltinInfo ") in (let vuna_cat1' = (v_vuna_ushow_ustring v0) in (let vuna_cat2' = (" ") in (let vuna_cat3' = (v_vuna_ushow_ustring v1) in (let vuna_cat4' = (" ") in (let vuna_cat5' = (v_vuna_ushow_uint v2) in (let vuna_cat6' = (" ") in (let vuna_cat7' = (v_vuna_ushow_ustring v3) in (let vuna_cat8' = (")") in String.concat "" [vuna_cat0'; vuna_cat1'; vuna_cat2'; vuna_cat3'; vuna_cat4'; vuna_cat5'; vuna_cat6'; vuna_cat7'; vuna_cat8'])))))))))
  | _ -> vuna_fail "<generated>" 142 40 ("case pattern match failure"))

let v_vuna_ueq_uVuna_uCodegen_uBuiltinInfo = fun x y -> (match x with
  | C_Vuna_dCodegen_dBuiltinInfo (v0, v1, v2, v3) -> (match y with
  | C_Vuna_dCodegen_dBuiltinInfo (w0, w1, w2, w3) -> (if ((if ((if (v_vuna_ueq_ustr v0 w0) then (v_vuna_ueq_ustr v1 w1) else false)) then (v_vuna_ueq_uint v2 w2) else false)) then (v_vuna_ueq_ustr v3 w3) else false)
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 147 43 ("case pattern match failure"))
  | _ -> v_vuna_ueq_uint 0 1
  | _ -> vuna_fail "<generated>" 146 40 ("case pattern match failure"))

let v_vuna_uneq_uVuna_uCodegen_uBuiltinInfo = fun x y -> if v_vuna_ueq_uVuna_uCodegen_uBuiltinInfo x y then v_vuna_ueq_uint 0 1 else v_vuna_ueq_uint 0 0
