
type value =
  | VInt of int
  | VStr of string
  | VCon of string * value list
  | VFun of string * (value -> value)

let fail (msg : string) : 'a = failwith msg

let apply (fn : value) (arg : value) : value =
  match fn with
  | VFun (_, f) -> f arg
  | _ -> fail "cannot apply a non-function"

let expect_int (name : string) (v : value) : int =
  match v with VInt n -> n | _ -> fail (name ^ ": expected an Int argument")

let expect_str (name : string) (v : value) : string =
  match v with VStr s -> s | _ -> fail (name ^ ": expected a String argument")

let vbool (b : bool) : value = VCon ((if b then "True" else "False"), [])

let expect_bool (name : string) (v : value) : bool =
  match v with
  | VCon ("True", []) -> true
  | VCon ("False", []) -> false
  | _ -> fail (name ^ ": expected a Bool argument")

let rec string_to_value (s : string) : value =
  let n = String.length s in
  let rec go i acc =
    if i < 0 then acc
    else go (i - 1) (VCon ("Cons", [ VInt (Char.code s.[i]); acc ]))
  in
  go (n - 1) (VCon ("Nil", []))

let value_to_string (v : value) : string =
  let buf = Buffer.create 16 in
  let rec go (v : value) =
    match v with
    | VCon ("Nil", []) -> ()
    | VCon ("Cons", [ VInt c; rest ]) ->
        if c < 0 || c > 255 then fail "strPack: character code out of range";
        Buffer.add_char buf (Char.chr c);
        go rest
    | _ -> fail "strPack expects a List Int"
  in
  go v;
  Buffer.contents buf

let list_of_strings (strings : string list) : value =
  List.fold_right
    (fun s acc -> VCon ("Cons", [ VStr s; acc ]))
    strings (VCon ("Nil", []))

let read_file (path : string) : string =
  try
    let channel = open_in_bin path in
    Fun.protect
      ~finally:(fun () -> close_in_noerr channel)
      (fun () -> really_input_string channel (in_channel_length channel))
  with Sys_error message -> fail ("readFile: " ^ message)

let write_file (path : string) (contents : string) : int =
  try
    let channel = open_out_bin path in
    Fun.protect
      ~finally:(fun () -> close_out_noerr channel)
      (fun () -> output_string channel contents);
    String.length contents
  with Sys_error message -> fail ("writeFile: " ^ message)

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

let bi_add =
  fun a -> VFun ("+", fun b -> VInt (expect_int "+" a + expect_int "+" b))

let bi_sub =
  fun a -> VFun ("-", fun b -> VInt (expect_int "-" a - expect_int "-" b))

let bi_mul =
  fun a -> VFun ("*", fun b -> VInt (expect_int "*" a * expect_int "*" b))

let bi_div =
  fun a ->
    VFun
      ( "/",
        fun b ->
          let x = expect_int "/" a in
          let y = expect_int "/" b in
          if y = 0 then fail "division by zero" else VInt (x / y) )

let bi_eq =
  fun a ->
    VFun
      ( "==",
        fun b ->
          match (a, b) with
          | VInt x, VInt y -> vbool (x = y)
          | VStr x, VStr y -> vbool (x = y)
          | _ -> fail "bad arguments for ==" )

let bi_neq =
  fun a ->
    VFun
      ( "/=",
        fun b ->
          match (a, b) with
          | VInt x, VInt y -> vbool (x <> y)
          | VStr x, VStr y -> vbool (x <> y)
          | _ -> fail "bad arguments for /=" )

let bi_lt =
  fun a -> VFun ("<", fun b -> vbool (expect_int "<" a < expect_int "<" b))

let bi_le =
  fun a -> VFun ("<=", fun b -> vbool (expect_int "<=" a <= expect_int "<=" b))

let bi_gt =
  fun a -> VFun (">", fun b -> vbool (expect_int ">" a > expect_int ">" b))

let bi_ge =
  fun a -> VFun (">=", fun b -> vbool (expect_int ">=" a >= expect_int ">=" b))

let bi_and =
  fun a ->
    VFun
      ("&&", fun b -> vbool (expect_bool "&&" a && expect_bool "&&" b))

let bi_or =
  fun a ->
    VFun ("||", fun b -> vbool (expect_bool "||" a || expect_bool "||" b))

let bi_concat =
  fun a -> VFun ("++", fun b -> VStr (expect_str "++" a ^ expect_str "++" b))

let bi_str_length = fun a -> VInt (String.length (expect_str "strLength" a))

let bi_str_unpack =
  fun a -> string_to_value (expect_str "strUnpack" a)

let bi_str_pack = fun a -> VStr (value_to_string a)

let bi_str_from_int =
  fun a -> VStr (string_of_int (expect_int "strFromInt" a))

let display_name (name : string) : string =
  match String.rindex_opt name '.' with
  | Some index -> String.sub name (index + 1) (String.length name - index - 1)
  | None -> name

let rec show_value (v : value) : string =
  match v with
  | VInt n -> string_of_int n
  | VStr s -> "\"" ^ show_chars s 0 (String.length s) ^ "\""
  | VCon (name, []) -> display_name name
  | VCon (name, args) ->
      "(" ^ display_name name ^ " "
      ^ String.concat " " (List.map show_value args)
      ^ ")"
  | VFun ("", _) -> "<lambda>"
  | VFun (name, _) -> "<function " ^ display_name name ^ ">"

and show_chars (s : string) (i : int) (n : int) : string =
  if i >= n then ""
  else
    let rest = show_chars s (i + 1) n in
    match s.[i] with
    | '"' -> "\\\"" ^ rest
    | '\\' -> "\\\\" ^ rest
    | '\n' -> "\\n" ^ rest
    | '\t' -> "\\t" ^ rest
    | '\r' -> "\\r" ^ rest
    | '\b' -> "\\b" ^ rest
    | c ->
        let code = Char.code c in
        if code >= 32 && code <= 126 then String.make 1 c ^ rest
        else Printf.sprintf "\\%03d" code ^ rest
let mk_Vuna_dInterp_dOk = (fun c1 -> VCon ("Vuna.Interp.Ok", [c1]))
let mk_Vuna_dInterp_dErr = (fun c1 -> VCon ("Vuna.Interp.Err", [c1]))
let mk_Vuna_dInterp_dJust = (fun c1 -> VCon ("Vuna.Interp.Just", [c1]))
let mk_Cons = (fun c1 -> VFun ("Cons", (fun c2 -> VCon ("Cons", [c1; c2]))))
let mk_Vuna_dInterp_dPair = (fun c1 -> VFun ("Vuna.Interp.Pair", (fun c2 -> VCon ("Vuna.Interp.Pair", [c1; c2]))))
let mk_Vuna_dInterp_dPVar = (fun c1 -> VCon ("Vuna.Interp.PVar", [c1]))
let mk_Vuna_dInterp_dPCon = (fun c1 -> VFun ("Vuna.Interp.PCon", (fun c2 -> VCon ("Vuna.Interp.PCon", [c1; c2]))))
let mk_Vuna_dInterp_dPInt = (fun c1 -> VCon ("Vuna.Interp.PInt", [c1]))
let mk_Vuna_dInterp_dPStr = (fun c1 -> VCon ("Vuna.Interp.PStr", [c1]))
let mk_Vuna_dInterp_dEVar = (fun c1 -> VCon ("Vuna.Interp.EVar", [c1]))
let mk_Vuna_dInterp_dEInt = (fun c1 -> VCon ("Vuna.Interp.EInt", [c1]))
let mk_Vuna_dInterp_dEStr = (fun c1 -> VCon ("Vuna.Interp.EStr", [c1]))
let mk_Vuna_dInterp_dELam = (fun c1 -> VFun ("Vuna.Interp.ELam", (fun c2 -> VCon ("Vuna.Interp.ELam", [c1; c2]))))
let mk_Vuna_dInterp_dEApp = (fun c1 -> VFun ("Vuna.Interp.EApp", (fun c2 -> VCon ("Vuna.Interp.EApp", [c1; c2]))))
let mk_Vuna_dInterp_dELet = (fun c1 -> VFun ("Vuna.Interp.ELet", (fun c2 -> VCon ("Vuna.Interp.ELet", [c1; c2]))))
let mk_Vuna_dInterp_dECase = (fun c1 -> VFun ("Vuna.Interp.ECase", (fun c2 -> VCon ("Vuna.Interp.ECase", [c1; c2]))))
let mk_Vuna_dInterp_dEIf = (fun c1 -> VFun ("Vuna.Interp.EIf", (fun c2 -> VFun ("Vuna.Interp.EIf", (fun c3 -> VCon ("Vuna.Interp.EIf", [c1; c2; c3]))))))
let mk_Vuna_dInterp_dDData = (fun c1 -> VFun ("Vuna.Interp.DData", (fun c2 -> VFun ("Vuna.Interp.DData", (fun c3 -> VCon ("Vuna.Interp.DData", [c1; c2; c3]))))))
let mk_Vuna_dInterp_dDSig = (fun c1 -> VFun ("Vuna.Interp.DSig", (fun c2 -> VCon ("Vuna.Interp.DSig", [c1; c2]))))
let mk_Vuna_dInterp_dDFun = (fun c1 -> VFun ("Vuna.Interp.DFun", (fun c2 -> VFun ("Vuna.Interp.DFun", (fun c3 -> VCon ("Vuna.Interp.DFun", [c1; c2; c3]))))))
let mk_Vuna_dInterp_dVInt = (fun c1 -> VCon ("Vuna.Interp.VInt", [c1]))
let mk_Vuna_dInterp_dVStr = (fun c1 -> VCon ("Vuna.Interp.VStr", [c1]))
let mk_Vuna_dInterp_dVCon = (fun c1 -> VFun ("Vuna.Interp.VCon", (fun c2 -> VCon ("Vuna.Interp.VCon", [c1; c2]))))
let mk_Vuna_dInterp_dVFun = (fun c1 -> VFun ("Vuna.Interp.VFun", (fun c2 -> VCon ("Vuna.Interp.VFun", [c1; c2]))))
let mk_Vuna_dInterp_dVLam = (fun c1 -> VFun ("Vuna.Interp.VLam", (fun c2 -> VFun ("Vuna.Interp.VLam", (fun c3 -> VCon ("Vuna.Interp.VLam", [c1; c2; c3]))))))
let mk_Vuna_dInterp_dVBuiltin = (fun c1 -> VFun ("Vuna.Interp.VBuiltin", (fun c2 -> VCon ("Vuna.Interp.VBuiltin", [c1; c2]))))
let mk_Vuna_dInterp_dPos = (fun c1 -> VFun ("Vuna.Interp.Pos", (fun c2 -> VCon ("Vuna.Interp.Pos", [c1; c2]))))
let mk_Vuna_dInterp_dTIdent = (fun c1 -> VCon ("Vuna.Interp.TIdent", [c1]))
let mk_Vuna_dInterp_dTKw = (fun c1 -> VCon ("Vuna.Interp.TKw", [c1]))
let mk_Vuna_dInterp_dTInt = (fun c1 -> VCon ("Vuna.Interp.TInt", [c1]))
let mk_Vuna_dInterp_dTStr = (fun c1 -> VCon ("Vuna.Interp.TStr", [c1]))
let mk_Vuna_dInterp_dTSym = (fun c1 -> VCon ("Vuna.Interp.TSym", [c1]))
let mk_Vuna_dInterp_dPTok = (fun c1 -> VFun ("Vuna.Interp.PTok", (fun c2 -> VCon ("Vuna.Interp.PTok", [c1; c2]))))
let mk_Vuna_dInterp_dChars = (fun c1 -> VFun ("Vuna.Interp.Chars", (fun c2 -> VCon ("Vuna.Interp.Chars", [c1; c2]))))
let mk_Vuna_dInterp_dPState = (fun c1 -> VFun ("Vuna.Interp.PState", (fun c2 -> VCon ("Vuna.Interp.PState", [c1; c2]))))
let mk_Vuna_dInterp_dModule = (fun c1 -> VFun ("Vuna.Interp.Module", (fun c2 -> VFun ("Vuna.Interp.Module", (fun c3 -> VFun ("Vuna.Interp.Module", (fun c4 -> VCon ("Vuna.Interp.Module", [c1; c2; c3; c4]))))))))
let mk_Vuna_dInterp_dBuiltinInfo = (fun c1 -> VFun ("Vuna.Interp.BuiltinInfo", (fun c2 -> VFun ("Vuna.Interp.BuiltinInfo", (fun c3 -> VFun ("Vuna.Interp.BuiltinInfo", (fun c4 -> VCon ("Vuna.Interp.BuiltinInfo", [c1; c2; c3; c4]))))))))
let bi_add = fun a -> VFun ("+", fun b -> VInt (expect_int "+" a + expect_int "+" b))
let bi_sub = fun a -> VFun ("-", fun b -> VInt (expect_int "-" a - expect_int "-" b))
let bi_mul = fun a -> VFun ("*", fun b -> VInt (expect_int "*" a * expect_int "*" b))
let bi_div = fun a -> VFun ("/", fun b -> let x = expect_int "/" a in let y = expect_int "/" b in if y = 0 then fail "division by zero" else VInt (x / y))
let bi_eq = fun a -> VFun ("==", fun b -> match (a, b) with VInt x, VInt y -> vbool (x = y) | VStr x, VStr y -> vbool (x = y) | _ -> fail "bad arguments for ==")
let bi_neq = fun a -> VFun ("/=", fun b -> match (a, b) with VInt x, VInt y -> vbool (x <> y) | VStr x, VStr y -> vbool (x <> y) | _ -> fail "bad arguments for /=")
let bi_lt = fun a -> VFun ("<", fun b -> vbool (expect_int "<" a < expect_int "<" b))
let bi_le = fun a -> VFun ("<=", fun b -> vbool (expect_int "<=" a <= expect_int "<=" b))
let bi_gt = fun a -> VFun (">", fun b -> vbool (expect_int ">" a > expect_int ">" b))
let bi_ge = fun a -> VFun (">=", fun b -> vbool (expect_int ">=" a >= expect_int ">=" b))
let bi_and = fun a -> VFun ("&&", fun b -> vbool (expect_bool "&&" a && expect_bool "&&" b))
let bi_or = fun a -> VFun ("||", fun b -> vbool (expect_bool "||" a || expect_bool "||" b))
let bi_concat = fun a -> VFun ("++", fun b -> VStr (expect_str "++" a ^ expect_str "++" b))
let bi_str_length = fun a -> VInt (String.length (expect_str "strLength" a))
let bi_str_unpack = fun a -> string_to_value (expect_str "strUnpack" a)
let bi_str_pack = fun a -> VStr (value_to_string a)
let bi_str_from_int = fun a -> VStr (string_of_int (expect_int "strFromInt" a))
let bi_read_file = fun a -> VStr (read_file (expect_str "readFile" a))
let bi_write_file = fun a -> VFun ("writeFile", fun b -> VInt (write_file (expect_str "writeFile" a) (expect_str "writeFile" b)))
let bi_print = fun a -> let text = expect_str "print" a in VInt (print_stdout text)
let bi_get_args = fun () -> get_args ()
let rec v_usage = (fun () -> VStr "usage: vuna [--no-print] [--root DIR] <entry.vuna> [out.ml]")
and v_main = (fun () -> (apply ((apply ((apply (VFun ("dispatch", v_dispatch)) (VCon ("True", [])))) (VStr "lib"))) (bi_get_args ())))
and v_dispatch = (fun a1 -> VFun ("dispatch", (fun a2 -> VFun ("dispatch", (fun a3 -> (match (a1, a2, a3) with
    | (x_printResult, x_root, x_args) -> (match (x_args) with
    | VCon ("Nil", []) -> v_emitUsage ()
    | VCon ("Cons", [x_a; x_rest]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_a))) (VStr "--no-print"))) with VCon ("True", []) -> (apply ((apply ((apply (VFun ("dispatch", v_dispatch)) (VCon ("False", [])))) (x_root))) (x_rest)) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_a))) (VStr "--root"))) with VCon ("True", []) -> (match (x_rest) with
    | VCon ("Cons", [x_dir; x_rest2]) -> (apply ((apply ((apply (VFun ("dispatch", v_dispatch)) (x_printResult))) (x_dir))) (x_rest2))
    | VCon ("Nil", []) -> v_emitUsage ()
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (apply ((apply ((apply ((apply (VFun ("emit", v_emit)) (x_printResult))) (x_root))) (x_a))) (x_rest)) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for dispatch"))))))
and v_emitUsage = (fun () -> (let __let1 = ((apply (VFun ("print", bi_print)) ((apply ((apply (VFun ("++", bi_concat)) (v_usage ()))) (VStr "\n"))))) in match __let1 with _ -> VInt (1) | _ -> fail "let pattern match failure"))
and v_emit = (fun a1 -> VFun ("emit", (fun a2 -> VFun ("emit", (fun a3 -> VFun ("emit", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_printResult, x_root, x_entry, x_rest) -> (match ((apply ((apply ((apply (VFun ("Vuna.Interp.compileFile", v_Vuna_dInterp_dcompileFile)) (x_root))) (x_entry))) (x_printResult))) with
    | VCon ("Vuna.Interp.Ok", [x_code]) -> (match (x_rest) with
    | VCon ("Cons", [x_out; VCon ("Nil", [])]) -> (let __let2 = ((apply ((apply (VFun ("writeFile", bi_write_file)) (x_out))) (x_code))) in match __let2 with _ -> VInt (0) | _ -> fail "let pattern match failure")
    | _ -> (let __let3 = ((apply (VFun ("print", bi_print)) (x_code))) in match __let3 with _ -> VInt (0) | _ -> fail "let pattern match failure")
    | _ -> fail "case pattern match failure")
    | VCon ("Vuna.Interp.Err", [x_e]) -> (let __let4 = ((apply (VFun ("print", bi_print)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "error: "))) ((apply ((apply (VFun ("++", bi_concat)) (x_e))) (VStr "\n"))))))) in match __let4 with _ -> VInt (1) | _ -> fail "let pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for emit"))))))))
and v_Vuna_dInterp_dappend = (fun a1 -> VFun ("Vuna.Interp.append", (fun a2 -> (match (a1, a2) with
    | (VCon ("Nil", []), x_ys) -> x_ys
    | (VCon ("Cons", [x_x; x_xs]), x_ys) -> (apply ((apply (VFun ("Cons", mk_Cons)) (x_x))) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_xs))) (x_ys))))
    | _ -> fail "no matching clause for Vuna.Interp.append"))))
and v_Vuna_dInterp_dreverseOnto = (fun a1 -> VFun ("Vuna.Interp.reverseOnto", (fun a2 -> (match (a1, a2) with
    | (VCon ("Nil", []), x_acc) -> x_acc
    | (VCon ("Cons", [x_x; x_xs]), x_acc) -> (apply ((apply (VFun ("Vuna.Interp.reverseOnto", v_Vuna_dInterp_dreverseOnto)) (x_xs))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_x))) (x_acc))))
    | _ -> fail "no matching clause for Vuna.Interp.reverseOnto"))))
and v_Vuna_dInterp_dreverse = (fun a1 -> (match a1 with
    | x_xs -> (apply ((apply (VFun ("Vuna.Interp.reverseOnto", v_Vuna_dInterp_dreverseOnto)) (x_xs))) (VCon ("Nil", [])))
    | _ -> fail "no matching clause for Vuna.Interp.reverse"))
and v_Vuna_dInterp_dlength = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> VInt (0)
    | VCon ("Cons", [x_x; x_xs]) -> (apply ((apply (VFun ("+", bi_add)) (VInt (1)))) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_xs))))
    | _ -> fail "no matching clause for Vuna.Interp.length"))
and v_Vuna_dInterp_dmap = (fun a1 -> VFun ("Vuna.Interp.map", (fun a2 -> (match (a1, a2) with
    | (x_f, VCon ("Nil", [])) -> VCon ("Nil", [])
    | (x_f, VCon ("Cons", [x_x; x_xs])) -> (apply ((apply (VFun ("Cons", mk_Cons)) ((apply (x_f) (x_x))))) ((apply ((apply (VFun ("Vuna.Interp.map", v_Vuna_dInterp_dmap)) (x_f))) (x_xs))))
    | _ -> fail "no matching clause for Vuna.Interp.map"))))
and v_Vuna_dInterp_dtraverse = (fun a1 -> VFun ("Vuna.Interp.traverse", (fun a2 -> (match (a1, a2) with
    | (x_f, VCon ("Nil", [])) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (VCon ("Nil", [])))
    | (x_f, VCon ("Cons", [x_x; x_xs])) -> (match ((apply (x_f) (x_x))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_y]) -> (match ((apply ((apply (VFun ("Vuna.Interp.traverse", v_Vuna_dInterp_dtraverse)) (x_f))) (x_xs))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_ys]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_y))) (x_ys))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.traverse"))))
and v_Vuna_dInterp_dandThen = (fun a1 -> VFun ("Vuna.Interp.andThen", (fun a2 -> (match (a1, a2) with
    | (x_r, x_f) -> (match (x_r) with
    | VCon ("Vuna.Interp.Ok", [x_x]) -> (apply (x_f) (x_x))
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (x_e))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.andThen"))))
and v_Vuna_dInterp_dstep = (fun a1 -> VFun ("Vuna.Interp.step", (fun a2 -> (match (a1, a2) with
    | (x_r, x_k) -> (match (x_r) with
    | VCon ("Vuna.Interp.Ok", [x_p]) -> (match (x_p) with
    | VCon ("Vuna.Interp.Pair", [x_x; x_st]) -> (apply ((apply (x_k) (x_x))) (x_st))
    | _ -> fail "case pattern match failure")
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (x_e))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.step"))))
and v_Vuna_dInterp_dadvanceChar = (fun a1 -> VFun ("Vuna.Interp.advanceChar", (fun a2 -> (match (a1, a2) with
    | (x_c, VCon ("Vuna.Interp.Pos", [x_line; x_col])) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (10)))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.Pos", mk_Vuna_dInterp_dPos)) ((apply ((apply (VFun ("+", bi_add)) (x_line))) (VInt (1)))))) (VInt (1))) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.Pos", mk_Vuna_dInterp_dPos)) (x_line))) ((apply ((apply (VFun ("+", bi_add)) (x_col))) (VInt (1))))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.advanceChar"))))
and v_Vuna_dInterp_disUpperChar = (fun a1 -> (match a1 with
    | x_c -> (apply ((apply (VFun ("&&", bi_and)) ((apply ((apply (VFun (">=", bi_ge)) (x_c))) (VInt (65)))))) ((apply ((apply (VFun ("<=", bi_le)) (x_c))) (VInt (90)))))
    | _ -> fail "no matching clause for Vuna.Interp.isUpperChar"))
and v_Vuna_dInterp_disLowerChar = (fun a1 -> (match a1 with
    | x_c -> (apply ((apply (VFun ("&&", bi_and)) ((apply ((apply (VFun (">=", bi_ge)) (x_c))) (VInt (97)))))) ((apply ((apply (VFun ("<=", bi_le)) (x_c))) (VInt (122)))))
    | _ -> fail "no matching clause for Vuna.Interp.isLowerChar"))
and v_Vuna_dInterp_disIdentStart = (fun a1 -> (match a1 with
    | x_c -> (apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply (VFun ("Vuna.Interp.isUpperChar", v_Vuna_dInterp_disUpperChar)) (x_c))))) ((apply (VFun ("Vuna.Interp.isLowerChar", v_Vuna_dInterp_disLowerChar)) (x_c))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (95)))))
    | _ -> fail "no matching clause for Vuna.Interp.isIdentStart"))
and v_Vuna_dInterp_disIdentChar = (fun a1 -> (match a1 with
    | x_c -> (apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply (VFun ("Vuna.Interp.isIdentStart", v_Vuna_dInterp_disIdentStart)) (x_c))))) ((apply (VFun ("Vuna.Interp.isDigit", v_Vuna_dInterp_disDigit)) (x_c))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (39)))))
    | _ -> fail "no matching clause for Vuna.Interp.isIdentChar"))
and v_Vuna_dInterp_disOpChar = (fun a1 -> (match a1 with
    | x_c -> (apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (33)))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (36)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (37)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (38)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (42)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (43)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (45)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (47)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (60)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (61)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (62)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (63)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (64)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (92)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (94)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (124)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (126)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (58)))))
    | _ -> fail "no matching clause for Vuna.Interp.isOpChar"))
and v_Vuna_dInterp_disKeyword = (fun a1 -> (match a1 with
    | x_s -> (apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("==", bi_eq)) (x_s))) (VStr "data"))))) ((apply ((apply (VFun ("==", bi_eq)) (x_s))) (VStr "case"))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_s))) (VStr "of"))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_s))) (VStr "let"))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_s))) (VStr "in"))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_s))) (VStr "if"))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_s))) (VStr "then"))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_s))) (VStr "else"))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_s))) (VStr "where"))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_s))) (VStr "Type"))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_s))) (VStr "import"))))
    | _ -> fail "no matching clause for Vuna.Interp.isKeyword"))
and v_Vuna_dInterp_dclassifyIdent = (fun a1 -> (match a1 with
    | x_s -> (match ((apply (VFun ("Vuna.Interp.isKeyword", v_Vuna_dInterp_disKeyword)) (x_s))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.TKw", mk_Vuna_dInterp_dTKw)) (x_s)) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.TIdent", mk_Vuna_dInterp_dTIdent)) (x_s)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.classifyIdent"))
and v_Vuna_dInterp_dskipLineComment = (fun a1 -> (match a1 with
    | VCon ("Vuna.Interp.Chars", [VCon ("Nil", []); x_p]) -> (apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (VCon ("Nil", [])))) (x_p))
    | VCon ("Vuna.Interp.Chars", [VCon ("Cons", [x_c; x_rest]); x_p]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (10)))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (x_rest))))) (x_p)) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.skipLineComment", v_Vuna_dInterp_dskipLineComment)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p)))))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.skipLineComment"))
and v_Vuna_dInterp_dskipBlockComment = (fun a1 -> VFun ("Vuna.Interp.skipBlockComment", (fun a2 -> (match (a1, a2) with
    | (x_depth, x_cs) -> (match (x_cs) with
    | VCon ("Vuna.Interp.Chars", [VCon ("Nil", []); x_p]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "unterminated block comment"))
    | VCon ("Vuna.Interp.Chars", [VCon ("Cons", [x_c; x_rest]); x_p]) -> (match (x_rest) with
    | VCon ("Cons", [x_c2; x_rest2]) -> (match ((apply ((apply (VFun ("&&", bi_and)) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (123)))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c2))) (VInt (45)))))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.skipBlockComment", v_Vuna_dInterp_dskipBlockComment)) ((apply ((apply (VFun ("+", bi_add)) (x_depth))) (VInt (1)))))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest2))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c2))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p)))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("&&", bi_and)) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (45)))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c2))) (VInt (125)))))) with VCon ("True", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_depth))) (VInt (1)))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest2))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c2))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p)))))))) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.skipBlockComment", v_Vuna_dInterp_dskipBlockComment)) ((apply ((apply (VFun ("-", bi_sub)) (x_depth))) (VInt (1)))))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest2))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c2))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p)))))))) | _ -> fail "if condition is not a Bool") | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.skipBlockComment", v_Vuna_dInterp_dskipBlockComment)) (x_depth))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p)))))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | VCon ("Nil", []) -> (apply ((apply (VFun ("Vuna.Interp.skipBlockComment", v_Vuna_dInterp_dskipBlockComment)) (x_depth))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.skipBlockComment"))))
and v_Vuna_dInterp_dskipTrivia = (fun a1 -> (match a1 with
    | x_cs -> (match (x_cs) with
    | VCon ("Vuna.Interp.Chars", [VCon ("Nil", []); x_p]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_cs))
    | VCon ("Vuna.Interp.Chars", [VCon ("Cons", [x_c; x_rest]); x_p]) -> (match ((apply (VFun ("Vuna.Interp.isSpace", v_Vuna_dInterp_disSpace)) (x_c))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.skipTrivia", v_Vuna_dInterp_dskipTrivia)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p)))))) | VCon ("False", []) -> (match (x_rest) with
    | VCon ("Cons", [x_c2; x_rest2]) -> (match ((apply ((apply (VFun ("&&", bi_and)) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (45)))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c2))) (VInt (45)))))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.skipTrivia", v_Vuna_dInterp_dskipTrivia)) ((apply (VFun ("Vuna.Interp.skipLineComment", v_Vuna_dInterp_dskipLineComment)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p)))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("&&", bi_and)) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (123)))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c2))) (VInt (45)))))) with VCon ("True", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.skipBlockComment", v_Vuna_dInterp_dskipBlockComment)) (VInt (1)))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_cs2]) -> (apply (VFun ("Vuna.Interp.skipTrivia", v_Vuna_dInterp_dskipTrivia)) (x_cs2))
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_cs)) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | VCon ("Nil", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_cs))
    | _ -> fail "case pattern match failure") | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.skipTrivia"))
and v_Vuna_dInterp_dcollectIdent = (fun a1 -> VFun ("Vuna.Interp.collectIdent", (fun a2 -> (match (a1, a2) with
    | (VCon ("Vuna.Interp.Chars", [VCon ("Nil", []); x_p]), x_acc) -> (apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("strPack", bi_str_pack)) ((apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) (x_acc))))))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (VCon ("Nil", [])))) (x_p))))
    | (VCon ("Vuna.Interp.Chars", [VCon ("Cons", [x_c; x_rest]); x_p]), x_acc) -> (match ((apply (VFun ("Vuna.Interp.isIdentChar", v_Vuna_dInterp_disIdentChar)) (x_c))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.collectIdent", v_Vuna_dInterp_dcollectIdent)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (x_acc)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (46)))) with VCon ("True", []) -> (match (x_rest) with
    | VCon ("Cons", [x_c2; x_rest2]) -> (match ((apply (VFun ("Vuna.Interp.isIdentStart", v_Vuna_dInterp_disIdentStart)) (x_c2))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.collectIdent", v_Vuna_dInterp_dcollectIdent)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (x_acc)))) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("strPack", bi_str_pack)) ((apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) (x_acc))))))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (x_rest))))) (x_p)))) | _ -> fail "if condition is not a Bool")
    | VCon ("Nil", []) -> (apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("strPack", bi_str_pack)) ((apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) (x_acc))))))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (x_rest))))) (x_p))))
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("strPack", bi_str_pack)) ((apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) (x_acc))))))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (x_rest))))) (x_p)))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.collectIdent"))))
and v_Vuna_dInterp_dcollectInt = (fun a1 -> VFun ("Vuna.Interp.collectInt", (fun a2 -> (match (a1, a2) with
    | (VCon ("Vuna.Interp.Chars", [VCon ("Nil", []); x_p]), x_acc) -> (apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_acc))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (VCon ("Nil", [])))) (x_p))))
    | (VCon ("Vuna.Interp.Chars", [VCon ("Cons", [x_c; x_rest]); x_p]), x_acc) -> (match ((apply (VFun ("Vuna.Interp.isDigit", v_Vuna_dInterp_disDigit)) (x_c))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.collectInt", v_Vuna_dInterp_dcollectInt)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("+", bi_add)) ((apply ((apply (VFun ("*", bi_mul)) (x_acc))) (VInt (10)))))) ((apply ((apply (VFun ("-", bi_sub)) (x_c))) (VInt (48))))))) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_acc))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (x_rest))))) (x_p)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.collectInt"))))
and v_Vuna_dInterp_dcollectOp = (fun a1 -> VFun ("Vuna.Interp.collectOp", (fun a2 -> (match (a1, a2) with
    | (VCon ("Vuna.Interp.Chars", [VCon ("Nil", []); x_p]), x_acc) -> (apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("strPack", bi_str_pack)) ((apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) (x_acc))))))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (VCon ("Nil", [])))) (x_p))))
    | (VCon ("Vuna.Interp.Chars", [VCon ("Cons", [x_c; x_rest]); x_p]), x_acc) -> (match ((apply (VFun ("Vuna.Interp.isOpChar", v_Vuna_dInterp_disOpChar)) (x_c))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.collectOp", v_Vuna_dInterp_dcollectOp)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (x_acc)))) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("strPack", bi_str_pack)) ((apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) (x_acc))))))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (x_rest))))) (x_p)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.collectOp"))))
and v_Vuna_dInterp_dscanString = (fun a1 -> VFun ("Vuna.Interp.scanString", (fun a2 -> (match (a1, a2) with
    | (VCon ("Vuna.Interp.Chars", [VCon ("Nil", []); x_p]), x_acc) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "unterminated string literal"))
    | (VCon ("Vuna.Interp.Chars", [VCon ("Cons", [x_c; x_rest]); x_p]), x_acc) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (34)))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("strPack", bi_str_pack)) ((apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) (x_acc))))))) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p)))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (10)))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "unterminated string literal")) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (92)))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.scanEscape", v_Vuna_dInterp_dscanEscape)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) (x_acc)) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.scanString", v_Vuna_dInterp_dscanString)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (x_acc)))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.scanString"))))
and v_Vuna_dInterp_dscanEscape = (fun a1 -> VFun ("Vuna.Interp.scanEscape", (fun a2 -> (match (a1, a2) with
    | (VCon ("Vuna.Interp.Chars", [VCon ("Nil", []); x_p]), x_acc) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "unterminated string literal"))
    | (VCon ("Vuna.Interp.Chars", [VCon ("Cons", [x_c; x_rest]); x_p]), x_acc) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (110)))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.scanString", v_Vuna_dInterp_dscanString)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (10)))) (x_acc)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (116)))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.scanString", v_Vuna_dInterp_dscanString)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (9)))) (x_acc)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (114)))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.scanString", v_Vuna_dInterp_dscanString)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (13)))) (x_acc)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (34)))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.scanString", v_Vuna_dInterp_dscanString)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (34)))) (x_acc)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (92)))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.scanString", v_Vuna_dInterp_dscanString)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (92)))) (x_acc)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (39)))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.scanString", v_Vuna_dInterp_dscanString)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (39)))) (x_acc)))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "unknown escape sequence")) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.scanEscape"))))
and v_Vuna_dInterp_dlexChars = (fun a1 -> (match a1 with
    | x_cs -> (match ((apply (VFun ("Vuna.Interp.skipTrivia", v_Vuna_dInterp_dskipTrivia)) (x_cs))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_cs2]) -> (match (x_cs2) with
    | VCon ("Vuna.Interp.Chars", [VCon ("Nil", []); x_p]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.PTok", mk_Vuna_dInterp_dPTok)) (VCon ("Vuna.Interp.TEof", [])))) (x_p))))) (VCon ("Nil", [])))))
    | VCon ("Vuna.Interp.Chars", [VCon ("Cons", [x_c; x_rest]); x_p]) -> (apply ((apply ((apply (VFun ("Vuna.Interp.lexToken", v_Vuna_dInterp_dlexToken)) (x_c))) (x_rest))) (x_p))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.lexChars"))
and v_Vuna_dInterp_dlexToken = (fun a1 -> VFun ("Vuna.Interp.lexToken", (fun a2 -> VFun ("Vuna.Interp.lexToken", (fun a3 -> (match (a1, a2, a3) with
    | (x_c, x_rest, x_p) -> (match ((apply (VFun ("Vuna.Interp.isIdentStart", v_Vuna_dInterp_disIdentStart)) (x_c))) with VCon ("True", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.collectIdent", v_Vuna_dInterp_dcollectIdent)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (VCon ("Nil", [])))))) with
    | VCon ("Vuna.Interp.Pair", [x_name; x_cs2]) -> (match ((apply (VFun ("Vuna.Interp.lexChars", v_Vuna_dInterp_dlexChars)) (x_cs2))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_toks]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.PTok", mk_Vuna_dInterp_dPTok)) ((apply (VFun ("Vuna.Interp.classifyIdent", v_Vuna_dInterp_dclassifyIdent)) (x_name))))) (x_p))))) (x_toks))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.isDigit", v_Vuna_dInterp_disDigit)) (x_c))) with VCon ("True", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.collectInt", v_Vuna_dInterp_dcollectInt)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("-", bi_sub)) (x_c))) (VInt (48)))))) with
    | VCon ("Vuna.Interp.Pair", [x_n; x_cs2]) -> (match ((apply (VFun ("Vuna.Interp.lexChars", v_Vuna_dInterp_dlexChars)) (x_cs2))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_toks]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.PTok", mk_Vuna_dInterp_dPTok)) ((apply (VFun ("Vuna.Interp.TInt", mk_Vuna_dInterp_dTInt)) (x_n))))) (x_p))))) (x_toks))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (34)))) with VCon ("True", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.scanString", v_Vuna_dInterp_dscanString)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) (VCon ("Nil", [])))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_p2]) -> (match (x_p2) with
    | VCon ("Vuna.Interp.Pair", [x_s; x_cs2]) -> (match ((apply (VFun ("Vuna.Interp.lexChars", v_Vuna_dInterp_dlexChars)) (x_cs2))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_toks]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.PTok", mk_Vuna_dInterp_dPTok)) ((apply (VFun ("Vuna.Interp.TStr", mk_Vuna_dInterp_dTStr)) (x_s))))) (x_p))))) (x_toks))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (match ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (40)))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (41)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (91)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (93)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (44)))))) with VCon ("True", []) -> (match ((apply (VFun ("Vuna.Interp.lexChars", v_Vuna_dInterp_dlexChars)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_toks]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.PTok", mk_Vuna_dInterp_dPTok)) ((apply (VFun ("Vuna.Interp.TSym", mk_Vuna_dInterp_dTSym)) ((apply (VFun ("strPack", bi_str_pack)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (VCon ("Nil", [])))))))))) (x_p))))) (x_toks))))
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.isOpChar", v_Vuna_dInterp_disOpChar)) (x_c))) with VCon ("True", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.collectOp", v_Vuna_dInterp_dcollectOp)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) (x_rest))) ((apply ((apply (VFun ("Vuna.Interp.advanceChar", v_Vuna_dInterp_dadvanceChar)) (x_c))) (x_p))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (VCon ("Nil", [])))))) with
    | VCon ("Vuna.Interp.Pair", [x_op; x_cs2]) -> (match ((apply (VFun ("Vuna.Interp.lexChars", v_Vuna_dInterp_dlexChars)) (x_cs2))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_toks]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.PTok", mk_Vuna_dInterp_dPTok)) ((apply (VFun ("Vuna.Interp.TSym", mk_Vuna_dInterp_dTSym)) (x_op))))) (x_p))))) (x_toks))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "unexpected character")) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.lexToken"))))))
and v_Vuna_dInterp_dlexSource = (fun a1 -> (match a1 with
    | x_source -> (apply (VFun ("Vuna.Interp.lexChars", v_Vuna_dInterp_dlexChars)) ((apply ((apply (VFun ("Vuna.Interp.Chars", mk_Vuna_dInterp_dChars)) ((apply (VFun ("strUnpack", bi_str_unpack)) (x_source))))) ((apply ((apply (VFun ("Vuna.Interp.Pos", mk_Vuna_dInterp_dPos)) (VInt (1)))) (VInt (1)))))))
    | _ -> fail "no matching clause for Vuna.Interp.lexSource"))
and v_Vuna_dInterp_dposOf = (fun a1 -> (match a1 with
    | VCon ("Vuna.Interp.PTok", [x_t; x_p]) -> x_p
    | _ -> fail "no matching clause for Vuna.Interp.posOf"))
and v_Vuna_dInterp_dtokOf = (fun a1 -> (match a1 with
    | VCon ("Vuna.Interp.PTok", [x_t; x_p]) -> x_t
    | _ -> fail "no matching clause for Vuna.Interp.tokOf"))
and v_Vuna_dInterp_dpeekTok = (fun a1 -> (match a1 with
    | VCon ("Vuna.Interp.PState", [x_toks; x_last]) -> (match (x_toks) with
    | VCon ("Cons", [x_t; x_rest]) -> x_t
    | VCon ("Nil", []) -> (apply ((apply (VFun ("Vuna.Interp.PTok", mk_Vuna_dInterp_dPTok)) (VCon ("Vuna.Interp.TEof", [])))) ((apply ((apply (VFun ("Vuna.Interp.Pos", mk_Vuna_dInterp_dPos)) (VInt (1)))) (VInt (1)))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.peekTok"))
and v_Vuna_dInterp_dpeekPos = (fun a1 -> (match a1 with
    | x_st -> (apply (VFun ("Vuna.Interp.posOf", v_Vuna_dInterp_dposOf)) ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))))
    | _ -> fail "no matching clause for Vuna.Interp.peekPos"))
and v_Vuna_dInterp_dlastPos = (fun a1 -> (match a1 with
    | VCon ("Vuna.Interp.PState", [x_toks; x_last]) -> x_last
    | _ -> fail "no matching clause for Vuna.Interp.lastPos"))
and v_Vuna_dInterp_dadvance = (fun a1 -> (match a1 with
    | x_st -> (match (x_st) with
    | VCon ("Vuna.Interp.PState", [x_toks; x_last]) -> (match (x_toks) with
    | VCon ("Cons", [x_t; x_rest]) -> (match (x_t) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TEof", []); x_p]) -> x_st
    | _ -> (apply ((apply (VFun ("Vuna.Interp.PState", mk_Vuna_dInterp_dPState)) (x_rest))) ((apply (VFun ("Vuna.Interp.posOf", v_Vuna_dInterp_dposOf)) (x_t))))
    | _ -> fail "case pattern match failure")
    | VCon ("Nil", []) -> x_st
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.advance"))
and v_Vuna_dInterp_disEof = (fun a1 -> (match a1 with
    | x_st -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TEof", []); x_p]) -> VCon ("True", [])
    | _ -> VCon ("False", [])
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.isEof"))
and v_Vuna_dInterp_datSym = (fun a1 -> VFun ("Vuna.Interp.atSym", (fun a2 -> (match (a1, a2) with
    | (x_st, x_s) -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [x_x]); x_p]) -> (apply ((apply (VFun ("==", bi_eq)) (x_x))) (x_s))
    | _ -> VCon ("False", [])
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.atSym"))))
and v_Vuna_dInterp_datKw = (fun a1 -> VFun ("Vuna.Interp.atKw", (fun a2 -> (match (a1, a2) with
    | (x_st, x_k) -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TKw", [x_x]); x_p]) -> (apply ((apply (VFun ("==", bi_eq)) (x_x))) (x_k))
    | _ -> VCon ("False", [])
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.atKw"))))
and v_Vuna_dInterp_dcanContinue = (fun a1 -> VFun ("Vuna.Interp.canContinue", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply (VFun ("Vuna.Interp.peekPos", v_Vuna_dInterp_dpeekPos)) (x_st))) with
    | VCon ("Vuna.Interp.Pos", [x_line; x_col]) -> (match ((apply (VFun ("Vuna.Interp.lastPos", v_Vuna_dInterp_dlastPos)) (x_st))) with
    | VCon ("Vuna.Interp.Pos", [x_lastLine; x_lastCol]) -> (apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("==", bi_eq)) (x_line))) (x_lastLine))))) ((apply ((apply (VFun (">", bi_gt)) (x_col))) (x_blockCol))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.canContinue"))))
and v_Vuna_dInterp_dexpectSym = (fun a1 -> VFun ("Vuna.Interp.expectSym", (fun a2 -> (match (a1, a2) with
    | (x_st, x_s) -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [x_x]); x_p]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_x))) (x_s))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (0)))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st)))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "expected "))) (x_s)))) | _ -> fail "if condition is not a Bool")
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "expected "))) (x_s))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.expectSym"))))
and v_Vuna_dInterp_dexpectKw = (fun a1 -> VFun ("Vuna.Interp.expectKw", (fun a2 -> (match (a1, a2) with
    | (x_st, x_k) -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TKw", [x_x]); x_p]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_x))) (x_k))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (0)))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st)))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "expected "))) (x_k)))) | _ -> fail "if condition is not a Bool")
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "expected "))) (x_k))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.expectKw"))))
and v_Vuna_dInterp_dexpectIdent = (fun a1 -> (match a1 with
    | x_st -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TIdent", [x_x]); x_p]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_x))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected identifier"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.expectIdent"))
and v_Vuna_dInterp_dupperFirst = (fun a1 -> (match a1 with
    | x_s -> (match ((apply (VFun ("strUnpack", bi_str_unpack)) (x_s))) with
    | VCon ("Cons", [x_c; x_rest]) -> (apply ((apply (VFun ("&&", bi_and)) ((apply ((apply (VFun (">=", bi_ge)) (x_c))) (VInt (65)))))) ((apply ((apply (VFun ("<=", bi_le)) (x_c))) (VInt (90)))))
    | VCon ("Nil", []) -> VCon ("False", [])
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.upperFirst"))
and v_Vuna_dInterp_dstartsAtom = (fun a1 -> (match a1 with
    | x_st -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TIdent", [x_x]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TInt", [x_x]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TStr", [x_x]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TKw", [VStr "Type"]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [VStr "("]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [VStr "["]); x_p]) -> VCon ("True", [])
    | _ -> VCon ("False", [])
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.startsAtom"))
and v_Vuna_dInterp_dstartsPatternAtom = (fun a1 -> (match a1 with
    | x_st -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TIdent", [x_x]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TInt", [x_x]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TStr", [x_x]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [VStr "("]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [VStr "["]); x_p]) -> VCon ("True", [])
    | _ -> VCon ("False", [])
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.startsPatternAtom"))
and v_Vuna_dInterp_dinfixInfo = (fun a1 -> (match a1 with
    | x_op -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "->"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (1)))) (VInt (1))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "||"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (2)))) (VInt (0))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "&&"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (3)))) (VInt (0))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "=="))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (4)))) (VInt (0))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "/="))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (4)))) (VInt (0))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "<"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (4)))) (VInt (0))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "<="))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (4)))) (VInt (0))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr ">"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (4)))) (VInt (0))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr ">="))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (4)))) (VInt (0))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "++"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (5)))) (VInt (1))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "+"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (6)))) (VInt (0))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "-"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (6)))) (VInt (0))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "*"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (7)))) (VInt (0))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "/"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (7)))) (VInt (0))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "::"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VInt (8)))) (VInt (1))))) | VCon ("False", []) -> VCon ("Vuna.Interp.Nothing", []) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.infixInfo"))
and v_Vuna_dInterp_dopExpr = (fun a1 -> (match a1 with
    | x_op -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_op))) (VStr "::"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.EVar", mk_Vuna_dInterp_dEVar)) (VStr "Cons")) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.EVar", mk_Vuna_dInterp_dEVar)) (x_op)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.opExpr"))
and v_Vuna_dInterp_dcountArrows = (fun a1 -> (match a1 with
    | x_e -> (match (x_e) with
    | VCon ("Vuna.Interp.EApp", [VCon ("Vuna.Interp.EVar", [VStr "->"]); VCon ("Cons", [x_x; VCon ("Cons", [x_rest; VCon ("Nil", [])])])]) -> (apply ((apply (VFun ("+", bi_add)) (VInt (1)))) ((apply (VFun ("Vuna.Interp.countArrows", v_Vuna_dInterp_dcountArrows)) (x_rest))))
    | _ -> VInt (0)
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.countArrows"))
and v_Vuna_dInterp_dterminatesExpression = (fun a1 -> (match a1 with
    | x_tok -> (match (x_tok) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [VStr ")"]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [VStr "]"]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [VStr ","]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TKw", [VStr "else"]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TKw", [VStr "in"]); x_p]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TKw", [VStr "then"]); x_p]) -> VCon ("True", [])
    | _ -> VCon ("False", [])
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.terminatesExpression"))
and v_Vuna_dInterp_dbadCaseIndent = (fun a1 -> VFun ("Vuna.Interp.badCaseIndent", (fun a2 -> (match (a1, a2) with
    | (x_st, x_altCol) -> (match ((apply (VFun ("Vuna.Interp.isEof", v_Vuna_dInterp_disEof)) (x_st))) with VCon ("True", []) -> VCon ("False", []) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.peekPos", v_Vuna_dInterp_dpeekPos)) (x_st))) with
    | VCon ("Vuna.Interp.Pos", [x_line; x_col]) -> (match ((apply ((apply (VFun (">", bi_gt)) (x_col))) (x_altCol))) with VCon ("True", []) -> (match ((apply (VFun ("Vuna.Interp.terminatesExpression", v_Vuna_dInterp_dterminatesExpression)) ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))))) with
    | VCon ("True", []) -> VCon ("False", [])
    | VCon ("False", []) -> VCon ("True", [])
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> VCon ("False", []) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.badCaseIndent"))))
and v_Vuna_dInterp_dparseSource = (fun a1 -> (match a1 with
    | x_source -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.lexSource", v_Vuna_dInterp_dlexSource)) (x_source))))) (VFun ("", fun x_toks -> (apply (VFun ("Vuna.Interp.parseProgram", v_Vuna_dInterp_dparseProgram)) ((apply ((apply (VFun ("Vuna.Interp.PState", mk_Vuna_dInterp_dPState)) (x_toks))) ((apply ((apply (VFun ("Vuna.Interp.Pos", mk_Vuna_dInterp_dPos)) (VInt (1)))) (VInt (0))))))))))
    | _ -> fail "no matching clause for Vuna.Interp.parseSource"))
and v_Vuna_dInterp_dparseImports = (fun a1 -> (match a1 with
    | x_st -> (match ((apply ((apply (VFun ("Vuna.Interp.atKw", v_Vuna_dInterp_datKw)) (x_st))) (VStr "import"))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectKw", v_Vuna_dInterp_dexpectKw)) (x_st))) (VStr "import"))))) (VFun ("", fun x__u -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply (VFun ("Vuna.Interp.expectIdent", v_Vuna_dInterp_dexpectIdent)) (x_st1))))) (VFun ("", fun x_name -> VFun ("", fun x_st2 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply (VFun ("Vuna.Interp.parseImports", v_Vuna_dInterp_dparseImports)) (x_st2))))) (VFun ("", fun x_rest -> VFun ("", fun x_st3 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_name))) (x_rest))))) (x_st3)))))))))))))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parseImports"))
and v_Vuna_dInterp_dparseProgram = (fun a1 -> (match a1 with
    | x_st -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply (VFun ("Vuna.Interp.parseImports", v_Vuna_dInterp_dparseImports)) (x_st))))) (VFun ("", fun x_imports -> VFun ("", fun x_st1 -> (match ((apply (VFun ("Vuna.Interp.isEof", v_Vuna_dInterp_disEof)) (x_st1))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_imports))) (VCon ("Nil", []))))) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.peekPos", v_Vuna_dInterp_dpeekPos)) (x_st1))) with
    | VCon ("Vuna.Interp.Pos", [x_line; x_col]) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseDecls", v_Vuna_dInterp_dparseDecls)) (x_st1))) (x_col))))) (VFun ("", fun x_decls -> VFun ("", fun x_st2 -> (match ((apply (VFun ("Vuna.Interp.isEof", v_Vuna_dInterp_disEof)) (x_st2))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_imports))) (x_decls)))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected end of input")) | _ -> fail "if condition is not a Bool")))))
    | _ -> fail "case pattern match failure") | _ -> fail "if condition is not a Bool")))))
    | _ -> fail "no matching clause for Vuna.Interp.parseProgram"))
and v_Vuna_dInterp_dparseDecls = (fun a1 -> VFun ("Vuna.Interp.parseDecls", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply (VFun ("Vuna.Interp.isEof", v_Vuna_dInterp_disEof)) (x_st))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.peekPos", v_Vuna_dInterp_dpeekPos)) (x_st))) with
    | VCon ("Vuna.Interp.Pos", [x_line; x_col]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_col))) (x_blockCol))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseDecl", v_Vuna_dInterp_dparseDecl)) (x_st))) (x_blockCol))))) (VFun ("", fun x_decl -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseDecls", v_Vuna_dInterp_dparseDecls)) (x_st1))) (x_blockCol))))) (VFun ("", fun x_rest -> VFun ("", fun x_st2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_decl))) (x_rest))))) (x_st2)))))))))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "expected a declaration at column "))) ((apply (VFun ("strFromInt", bi_str_from_int)) (x_blockCol)))))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parseDecls"))))
and v_Vuna_dInterp_dparseDecl = (fun a1 -> VFun ("Vuna.Interp.parseDecl", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TKw", [VStr "data"]); x_p]) -> (apply ((apply (VFun ("Vuna.Interp.parseData", v_Vuna_dInterp_dparseData)) (x_st))) (x_blockCol))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TIdent", [x_name]); x_p]) -> (let x_st1 = ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))) in (match ((apply ((apply (VFun ("Vuna.Interp.atSym", v_Vuna_dInterp_datSym)) (x_st1))) (VStr ":"))) with VCon ("True", []) -> (apply ((apply ((apply (VFun ("Vuna.Interp.parseSignature", v_Vuna_dInterp_dparseSignature)) (x_st1))) (x_blockCol))) (x_name)) | VCon ("False", []) -> (apply ((apply ((apply (VFun ("Vuna.Interp.parseClause", v_Vuna_dInterp_dparseClause)) (x_st1))) (x_blockCol))) (x_name)) | _ -> fail "if condition is not a Bool"))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected a top-level declaration"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.parseDecl"))))
and v_Vuna_dInterp_dparseSignature = (fun a1 -> VFun ("Vuna.Interp.parseSignature", (fun a2 -> VFun ("Vuna.Interp.parseSignature", (fun a3 -> (match (a1, a2, a3) with
    | (x_st, x_blockCol, x_name) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectSym", v_Vuna_dInterp_dexpectSym)) (x_st))) (VStr ":"))))) (VFun ("", fun x__u -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st1))) (x_blockCol))) (VInt (0)))))) (VFun ("", fun x_ty -> VFun ("", fun x_st2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Vuna.Interp.DSig", mk_Vuna_dInterp_dDSig)) (x_name))) (x_ty))))) (x_st2))))))))))))
    | _ -> fail "no matching clause for Vuna.Interp.parseSignature"))))))
and v_Vuna_dInterp_dparseClause = (fun a1 -> VFun ("Vuna.Interp.parseClause", (fun a2 -> VFun ("Vuna.Interp.parseClause", (fun a3 -> (match (a1, a2, a3) with
    | (x_st, x_blockCol, x_name) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseClausePatterns", v_Vuna_dInterp_dparseClausePatterns)) (x_st))) (x_blockCol))))) (VFun ("", fun x_pats -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectSym", v_Vuna_dInterp_dexpectSym)) (x_st1))) (VStr "="))))) (VFun ("", fun x__u -> VFun ("", fun x_st2 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st2))) (x_blockCol))) (VInt (0)))))) (VFun ("", fun x_body -> VFun ("", fun x_st3 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply ((apply (VFun ("Vuna.Interp.DFun", mk_Vuna_dInterp_dDFun)) (x_name))) (x_pats))) (x_body))))) (x_st3))))))))))))))))
    | _ -> fail "no matching clause for Vuna.Interp.parseClause"))))))
and v_Vuna_dInterp_dparseClausePatterns = (fun a1 -> VFun ("Vuna.Interp.parseClausePatterns", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply ((apply (VFun ("&&", bi_and)) ((apply (VFun ("Vuna.Interp.startsPatternAtom", v_Vuna_dInterp_dstartsPatternAtom)) (x_st))))) ((apply ((apply (VFun ("Vuna.Interp.canContinue", v_Vuna_dInterp_dcanContinue)) (x_st))) (x_blockCol))))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parsePatternAtom", v_Vuna_dInterp_dparsePatternAtom)) (x_st))) (x_blockCol))))) (VFun ("", fun x_pat -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseClausePatterns", v_Vuna_dInterp_dparseClausePatterns)) (x_st1))) (x_blockCol))))) (VFun ("", fun x_rest -> VFun ("", fun x_st2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_pat))) (x_rest))))) (x_st2)))))))))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parseClausePatterns"))))
and v_Vuna_dInterp_dparseData = (fun a1 -> VFun ("Vuna.Interp.parseData", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectKw", v_Vuna_dInterp_dexpectKw)) (x_st))) (VStr "data"))))) (VFun ("", fun x__u -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply (VFun ("Vuna.Interp.expectIdent", v_Vuna_dInterp_dexpectIdent)) (x_st1))))) (VFun ("", fun x_name -> VFun ("", fun x_st2 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply (VFun ("Vuna.Interp.parseParams", v_Vuna_dInterp_dparseParams)) (x_st2))))) (VFun ("", fun x_params -> VFun ("", fun x_st3 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectSym", v_Vuna_dInterp_dexpectSym)) (x_st3))) (VStr ":"))))) (VFun ("", fun x__u -> VFun ("", fun x_st4 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st4))) (x_blockCol))) (VInt (0)))))) (VFun ("", fun x_ty -> VFun ("", fun x_st5 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectKw", v_Vuna_dInterp_dexpectKw)) (x_st5))) (VStr "where"))))) (VFun ("", fun x__u -> VFun ("", fun x_st6 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseCtors", v_Vuna_dInterp_dparseCtors)) (x_st6))) (x_blockCol))))) (VFun ("", fun x_ctors -> VFun ("", fun x_st7 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply ((apply (VFun ("Vuna.Interp.DData", mk_Vuna_dInterp_dDData)) (x_name))) (x_params))) (x_ctors))))) (x_st7))))))))))))))))))))))))))))))))
    | _ -> fail "no matching clause for Vuna.Interp.parseData"))))
and v_Vuna_dInterp_dparseParams = (fun a1 -> (match a1 with
    | x_st -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TIdent", [x_name]); x_p]) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply (VFun ("Vuna.Interp.parseParams", v_Vuna_dInterp_dparseParams)) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))))) (VFun ("", fun x_rest -> VFun ("", fun x_st1 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_name))) (x_rest))))) (x_st1))))))))
    | _ -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.parseParams"))
and v_Vuna_dInterp_dparseCtors = (fun a1 -> VFun ("Vuna.Interp.parseCtors", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply (VFun ("Vuna.Interp.isEof", v_Vuna_dInterp_disEof)) (x_st))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.peekPos", v_Vuna_dInterp_dpeekPos)) (x_st))) with
    | VCon ("Vuna.Interp.Pos", [x_line; x_col]) -> (match ((apply ((apply (VFun (">", bi_gt)) (x_col))) (x_blockCol))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.parseCtorList", v_Vuna_dInterp_dparseCtorList)) (x_st))) (x_col)) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parseCtors"))))
and v_Vuna_dInterp_dparseCtorList = (fun a1 -> VFun ("Vuna.Interp.parseCtorList", (fun a2 -> (match (a1, a2) with
    | (x_st, x_ctorCol) -> (match ((apply (VFun ("Vuna.Interp.isEof", v_Vuna_dInterp_disEof)) (x_st))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.peekPos", v_Vuna_dInterp_dpeekPos)) (x_st))) with
    | VCon ("Vuna.Interp.Pos", [x_line; x_col]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_col))) (x_ctorCol))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply (VFun ("Vuna.Interp.expectIdent", v_Vuna_dInterp_dexpectIdent)) (x_st))))) (VFun ("", fun x_name -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectSym", v_Vuna_dInterp_dexpectSym)) (x_st1))) (VStr ":"))))) (VFun ("", fun x__u -> VFun ("", fun x_st2 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st2))) (x_ctorCol))) (VInt (0)))))) (VFun ("", fun x_ty -> VFun ("", fun x_st3 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseCtorList", v_Vuna_dInterp_dparseCtorList)) (x_st3))) (x_ctorCol))))) (VFun ("", fun x_rest -> VFun ("", fun x_st4 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_name))) ((apply (VFun ("Vuna.Interp.countArrows", v_Vuna_dInterp_dcountArrows)) (x_ty))))))) (x_rest))))) (x_st4)))))))))))))))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun (">", bi_gt)) (x_col))) (x_ctorCol))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "unexpected indentation in data block")) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parseCtorList"))))
and v_Vuna_dInterp_dparseExpr = (fun a1 -> VFun ("Vuna.Interp.parseExpr", (fun a2 -> VFun ("Vuna.Interp.parseExpr", (fun a3 -> (match (a1, a2, a3) with
    | (x_st, x_blockCol, x_minPrec) -> (match ((apply (VFun ("Vuna.Interp.isEof", v_Vuna_dInterp_disEof)) (x_st))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "unexpected end of input")) | VCon ("False", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.canContinue", v_Vuna_dInterp_dcanContinue)) (x_st))) (x_blockCol))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseLhs", v_Vuna_dInterp_dparseLhs)) (x_st))) (x_blockCol))))) (VFun ("", fun x_lhs -> VFun ("", fun x_st1 -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.parseInfix", v_Vuna_dInterp_dparseInfix)) (x_st1))) (x_blockCol))) (x_minPrec))) (x_lhs)))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expression is not indented enough")) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parseExpr"))))))
and v_Vuna_dInterp_dparseInfix = (fun a1 -> VFun ("Vuna.Interp.parseInfix", (fun a2 -> VFun ("Vuna.Interp.parseInfix", (fun a3 -> VFun ("Vuna.Interp.parseInfix", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_st, x_blockCol, x_minPrec, x_lhs) -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [x_op]); x_p]) -> (match ((apply (VFun ("Vuna.Interp.infixInfo", v_Vuna_dInterp_dinfixInfo)) (x_op))) with
    | VCon ("Vuna.Interp.Just", [x_pr]) -> (match (x_pr) with
    | VCon ("Vuna.Interp.Pair", [x_prec; x_assoc]) -> (match ((apply ((apply (VFun ("&&", bi_and)) ((apply ((apply (VFun (">=", bi_ge)) (x_prec))) (x_minPrec))))) ((apply ((apply (VFun ("Vuna.Interp.canContinue", v_Vuna_dInterp_dcanContinue)) (x_st))) (x_blockCol))))) with VCon ("True", []) -> (let x_rhsPrec = ((match ((apply ((apply (VFun ("==", bi_eq)) (x_assoc))) (VInt (0)))) with VCon ("True", []) -> (apply ((apply (VFun ("+", bi_add)) (x_prec))) (VInt (1))) | VCon ("False", []) -> x_prec | _ -> fail "if condition is not a Bool")) in (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))) (x_blockCol))) (x_rhsPrec))))) (VFun ("", fun x_rhs -> VFun ("", fun x_st2 -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.parseInfix", v_Vuna_dInterp_dparseInfix)) (x_st2))) (x_blockCol))) (x_minPrec))) ((apply ((apply (VFun ("Vuna.Interp.EApp", mk_Vuna_dInterp_dEApp)) ((apply (VFun ("Vuna.Interp.opExpr", v_Vuna_dInterp_dopExpr)) (x_op))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_lhs))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_rhs))) (VCon ("Nil", [])))))))))))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_lhs))) (x_st)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | VCon ("Vuna.Interp.Nothing", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_lhs))) (x_st))))
    | _ -> fail "case pattern match failure")
    | _ -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_lhs))) (x_st))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.parseInfix"))))))))
and v_Vuna_dInterp_dparseLhs = (fun a1 -> VFun ("Vuna.Interp.parseLhs", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [VStr "\\"]); x_p]) -> (apply ((apply (VFun ("Vuna.Interp.parseLambda", v_Vuna_dInterp_dparseLambda)) (x_st))) (x_blockCol))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TKw", [VStr "let"]); x_p]) -> (apply ((apply (VFun ("Vuna.Interp.parseLet", v_Vuna_dInterp_dparseLet)) (x_st))) (x_blockCol))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TKw", [VStr "case"]); x_p]) -> (apply ((apply (VFun ("Vuna.Interp.parseCase", v_Vuna_dInterp_dparseCase)) (x_st))) (x_blockCol))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TKw", [VStr "if"]); x_p]) -> (apply ((apply (VFun ("Vuna.Interp.parseIf", v_Vuna_dInterp_dparseIf)) (x_st))) (x_blockCol))
    | _ -> (apply ((apply (VFun ("Vuna.Interp.parseApplication", v_Vuna_dInterp_dparseApplication)) (x_st))) (x_blockCol))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.parseLhs"))))
and v_Vuna_dInterp_dparseApplication = (fun a1 -> VFun ("Vuna.Interp.parseApplication", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseAtom", v_Vuna_dInterp_dparseAtom)) (x_st))) (x_blockCol))))) (VFun ("", fun x_first -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseArgs", v_Vuna_dInterp_dparseArgs)) (x_st1))) (x_blockCol))))) (VFun ("", fun x_args -> VFun ("", fun x_st2 -> (match (x_args) with
    | VCon ("Nil", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_first))) (x_st2))))
    | _ -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Vuna.Interp.EApp", mk_Vuna_dInterp_dEApp)) (x_first))) (x_args))))) (x_st2))))
    | _ -> fail "case pattern match failure")))))))))
    | _ -> fail "no matching clause for Vuna.Interp.parseApplication"))))
and v_Vuna_dInterp_dparseArgs = (fun a1 -> VFun ("Vuna.Interp.parseArgs", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply ((apply (VFun ("&&", bi_and)) ((apply (VFun ("Vuna.Interp.startsAtom", v_Vuna_dInterp_dstartsAtom)) (x_st))))) ((apply ((apply (VFun ("Vuna.Interp.canContinue", v_Vuna_dInterp_dcanContinue)) (x_st))) (x_blockCol))))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseAtom", v_Vuna_dInterp_dparseAtom)) (x_st))) (x_blockCol))))) (VFun ("", fun x_arg -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseArgs", v_Vuna_dInterp_dparseArgs)) (x_st1))) (x_blockCol))))) (VFun ("", fun x_rest -> VFun ("", fun x_st2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_arg))) (x_rest))))) (x_st2)))))))))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parseArgs"))))
and v_Vuna_dInterp_dparseAtom = (fun a1 -> VFun ("Vuna.Interp.parseAtom", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TIdent", [x_name]); x_p]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.EVar", mk_Vuna_dInterp_dEVar)) (x_name))))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TInt", [x_n]); x_p]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.EInt", mk_Vuna_dInterp_dEInt)) (x_n))))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TStr", [x_s]); x_p]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.EStr", mk_Vuna_dInterp_dEStr)) (x_s))))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TKw", [VStr "Type"]); x_p]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.EVar", mk_Vuna_dInterp_dEVar)) (VStr "Type"))))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [VStr "("]); x_p]) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))) (x_blockCol))) (VInt (0)))))) (VFun ("", fun x_inner -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectSym", v_Vuna_dInterp_dexpectSym)) (x_st1))) (VStr ")"))))) (VFun ("", fun x__u -> VFun ("", fun x_st2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_inner))) (x_st2))))))))))))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [VStr "["]); x_p]) -> (apply ((apply (VFun ("Vuna.Interp.parseListExpr", v_Vuna_dInterp_dparseListExpr)) (x_st))) (x_blockCol))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected expression"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.parseAtom"))))
and v_Vuna_dInterp_dparseListExpr = (fun a1 -> VFun ("Vuna.Interp.parseListExpr", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectSym", v_Vuna_dInterp_dexpectSym)) (x_st))) (VStr "["))))) (VFun ("", fun x__u -> VFun ("", fun x_st1 -> (match ((apply ((apply (VFun ("Vuna.Interp.atSym", v_Vuna_dInterp_datSym)) (x_st1))) (VStr "]"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.EVar", mk_Vuna_dInterp_dEVar)) (VStr "Nil"))))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st1)))))) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseListExprElems", v_Vuna_dInterp_dparseListExprElems)) (x_st1))) (x_blockCol))))) (VFun ("", fun x_elems -> VFun ("", fun x_st2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.foldCons", v_Vuna_dInterp_dfoldCons)) (x_elems))))) (x_st2)))))))) | _ -> fail "if condition is not a Bool")))))
    | _ -> fail "no matching clause for Vuna.Interp.parseListExpr"))))
and v_Vuna_dInterp_dparseListExprElems = (fun a1 -> VFun ("Vuna.Interp.parseListExprElems", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st))) (x_blockCol))) (VInt (0)))))) (VFun ("", fun x_e -> VFun ("", fun x_st1 -> (match ((apply ((apply (VFun ("Vuna.Interp.atSym", v_Vuna_dInterp_datSym)) (x_st1))) (VStr ","))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseListExprElems", v_Vuna_dInterp_dparseListExprElems)) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st1))))) (x_blockCol))))) (VFun ("", fun x_rest -> VFun ("", fun x_st2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_e))) (x_rest))))) (x_st2)))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.atSym", v_Vuna_dInterp_datSym)) (x_st1))) (VStr "]"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_e))) (VCon ("Nil", [])))))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st1)))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected , or ]")) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")))))
    | _ -> fail "no matching clause for Vuna.Interp.parseListExprElems"))))
and v_Vuna_dInterp_dfoldCons = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> (apply (VFun ("Vuna.Interp.EVar", mk_Vuna_dInterp_dEVar)) (VStr "Nil"))
    | VCon ("Cons", [x_e; x_rest]) -> (apply ((apply (VFun ("Vuna.Interp.EApp", mk_Vuna_dInterp_dEApp)) ((apply (VFun ("Vuna.Interp.EVar", mk_Vuna_dInterp_dEVar)) (VStr "Cons"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_e))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply (VFun ("Vuna.Interp.foldCons", v_Vuna_dInterp_dfoldCons)) (x_rest))))) (VCon ("Nil", [])))))))
    | _ -> fail "no matching clause for Vuna.Interp.foldCons"))
and v_Vuna_dInterp_dparseLambda = (fun a1 -> VFun ("Vuna.Interp.parseLambda", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectSym", v_Vuna_dInterp_dexpectSym)) (x_st))) (VStr "\\"))))) (VFun ("", fun x__u -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply (VFun ("Vuna.Interp.expectIdent", v_Vuna_dInterp_dexpectIdent)) (x_st1))))) (VFun ("", fun x_first -> VFun ("", fun x_st2 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseLambdaParams", v_Vuna_dInterp_dparseLambdaParams)) (x_st2))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_first))) (VCon ("Nil", [])))))))) (VFun ("", fun x_params -> VFun ("", fun x_st3 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectSym", v_Vuna_dInterp_dexpectSym)) (x_st3))) (VStr "=>"))))) (VFun ("", fun x__u -> VFun ("", fun x_st4 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st4))) (x_blockCol))) (VInt (0)))))) (VFun ("", fun x_body -> VFun ("", fun x_st5 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Vuna.Interp.ELam", mk_Vuna_dInterp_dELam)) (x_params))) (x_body))))) (x_st5))))))))))))))))))))))))
    | _ -> fail "no matching clause for Vuna.Interp.parseLambda"))))
and v_Vuna_dInterp_dparseLambdaParams = (fun a1 -> VFun ("Vuna.Interp.parseLambdaParams", (fun a2 -> (match (a1, a2) with
    | (x_st, x_acc) -> (match ((apply ((apply (VFun ("Vuna.Interp.atSym", v_Vuna_dInterp_datSym)) (x_st))) (VStr ","))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply (VFun ("Vuna.Interp.expectIdent", v_Vuna_dInterp_dexpectIdent)) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))))) (VFun ("", fun x_name -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.parseLambdaParams", v_Vuna_dInterp_dparseLambdaParams)) (x_st1))) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_acc))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_name))) (VCon ("Nil", []))))))))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_acc))) (x_st)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parseLambdaParams"))))
and v_Vuna_dInterp_dparseLet = (fun a1 -> VFun ("Vuna.Interp.parseLet", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectKw", v_Vuna_dInterp_dexpectKw)) (x_st))) (VStr "let"))))) (VFun ("", fun x__u -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseLetBindings", v_Vuna_dInterp_dparseLetBindings)) (x_st1))) (x_blockCol))))) (VFun ("", fun x_binds -> VFun ("", fun x_st2 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectKw", v_Vuna_dInterp_dexpectKw)) (x_st2))) (VStr "in"))))) (VFun ("", fun x__u -> VFun ("", fun x_st3 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st3))) (x_blockCol))) (VInt (0)))))) (VFun ("", fun x_body -> VFun ("", fun x_st4 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Vuna.Interp.ELet", mk_Vuna_dInterp_dELet)) (x_binds))) (x_body))))) (x_st4))))))))))))))))))))
    | _ -> fail "no matching clause for Vuna.Interp.parseLet"))))
and v_Vuna_dInterp_dparseLetBindings = (fun a1 -> VFun ("Vuna.Interp.parseLetBindings", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply (VFun ("Vuna.Interp.isEof", v_Vuna_dInterp_disEof)) (x_st))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected a let binding")) | VCon ("False", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.atKw", v_Vuna_dInterp_datKw)) (x_st))) (VStr "in"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected a let binding")) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.peekPos", v_Vuna_dInterp_dpeekPos)) (x_st))) with
    | VCon ("Vuna.Interp.Pos", [x_line; x_col]) -> (match ((apply ((apply (VFun ("<=", bi_le)) (x_col))) (x_blockCol))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "let binding is not indented enough")) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.parseLetBindingsAt", v_Vuna_dInterp_dparseLetBindingsAt)) (x_st))) (x_col)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parseLetBindings"))))
and v_Vuna_dInterp_dparseLetBindingsAt = (fun a1 -> VFun ("Vuna.Interp.parseLetBindingsAt", (fun a2 -> (match (a1, a2) with
    | (x_st, x_declCol) -> (match ((apply (VFun ("Vuna.Interp.isEof", v_Vuna_dInterp_disEof)) (x_st))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.atKw", v_Vuna_dInterp_datKw)) (x_st))) (VStr "in"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.peekPos", v_Vuna_dInterp_dpeekPos)) (x_st))) with
    | VCon ("Vuna.Interp.Pos", [x_line; x_col]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_col))) (x_declCol))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parsePatternSingle", v_Vuna_dInterp_dparsePatternSingle)) (x_st))) (x_declCol))))) (VFun ("", fun x_pat -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectSym", v_Vuna_dInterp_dexpectSym)) (x_st1))) (VStr "="))))) (VFun ("", fun x__u -> VFun ("", fun x_st2 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st2))) (x_declCol))) (VInt (0)))))) (VFun ("", fun x_value -> VFun ("", fun x_st3 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseLetBindingsAt", v_Vuna_dInterp_dparseLetBindingsAt)) (x_st3))) (x_declCol))))) (VFun ("", fun x_rest -> VFun ("", fun x_st4 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_pat))) (x_value))))) (x_rest))))) (x_st4)))))))))))))))))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parseLetBindingsAt"))))
and v_Vuna_dInterp_dparseCase = (fun a1 -> VFun ("Vuna.Interp.parseCase", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectKw", v_Vuna_dInterp_dexpectKw)) (x_st))) (VStr "case"))))) (VFun ("", fun x__u -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st1))) (x_blockCol))) (VInt (0)))))) (VFun ("", fun x_scrut -> VFun ("", fun x_st2 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectKw", v_Vuna_dInterp_dexpectKw)) (x_st2))) (VStr "of"))))) (VFun ("", fun x__u -> VFun ("", fun x_st3 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseCaseAlts", v_Vuna_dInterp_dparseCaseAlts)) (x_st3))) (x_blockCol))))) (VFun ("", fun x_alts -> VFun ("", fun x_st4 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Vuna.Interp.ECase", mk_Vuna_dInterp_dECase)) (x_scrut))) (x_alts))))) (x_st4))))))))))))))))))))
    | _ -> fail "no matching clause for Vuna.Interp.parseCase"))))
and v_Vuna_dInterp_dparseCaseAlts = (fun a1 -> VFun ("Vuna.Interp.parseCaseAlts", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply (VFun ("Vuna.Interp.isEof", v_Vuna_dInterp_disEof)) (x_st))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "case expression needs an alternative")) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.peekPos", v_Vuna_dInterp_dpeekPos)) (x_st))) with
    | VCon ("Vuna.Interp.Pos", [x_line; x_col]) -> (match ((apply ((apply (VFun ("<=", bi_le)) (x_col))) (x_blockCol))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "case alternative is not indented enough")) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseAltList", v_Vuna_dInterp_dparseAltList)) (x_st))) (x_col))))) (VFun ("", fun x_alts -> VFun ("", fun x_st2 -> (match ((apply ((apply (VFun ("Vuna.Interp.badCaseIndent", v_Vuna_dInterp_dbadCaseIndent)) (x_st2))) (x_col))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "unexpected indentation after case alternative")) | VCon ("False", []) -> (match (x_alts) with
    | VCon ("Nil", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "case expression needs an alternative"))
    | _ -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_alts))) (x_st2))))
    | _ -> fail "case pattern match failure") | _ -> fail "if condition is not a Bool"))))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parseCaseAlts"))))
and v_Vuna_dInterp_dparseAltList = (fun a1 -> VFun ("Vuna.Interp.parseAltList", (fun a2 -> (match (a1, a2) with
    | (x_st, x_altCol) -> (match ((apply (VFun ("Vuna.Interp.isEof", v_Vuna_dInterp_disEof)) (x_st))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.peekPos", v_Vuna_dInterp_dpeekPos)) (x_st))) with
    | VCon ("Vuna.Interp.Pos", [x_line; x_col]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_col))) (x_altCol))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parsePatternSingle", v_Vuna_dInterp_dparsePatternSingle)) (x_st))) (x_altCol))))) (VFun ("", fun x_pat -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectSym", v_Vuna_dInterp_dexpectSym)) (x_st1))) (VStr "=>"))))) (VFun ("", fun x__u -> VFun ("", fun x_st2 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st2))) (x_altCol))) (VInt (0)))))) (VFun ("", fun x_body -> VFun ("", fun x_st3 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseAltList", v_Vuna_dInterp_dparseAltList)) (x_st3))) (x_altCol))))) (VFun ("", fun x_rest -> VFun ("", fun x_st4 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_pat))) (x_body))))) (x_rest))))) (x_st4)))))))))))))))))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parseAltList"))))
and v_Vuna_dInterp_dparseIf = (fun a1 -> VFun ("Vuna.Interp.parseIf", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectKw", v_Vuna_dInterp_dexpectKw)) (x_st))) (VStr "if"))))) (VFun ("", fun x__u -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st1))) (x_blockCol))) (VInt (0)))))) (VFun ("", fun x_cond -> VFun ("", fun x_st2 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectKw", v_Vuna_dInterp_dexpectKw)) (x_st2))) (VStr "then"))))) (VFun ("", fun x__u -> VFun ("", fun x_st3 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st3))) (x_blockCol))) (VInt (0)))))) (VFun ("", fun x_yes -> VFun ("", fun x_st4 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectKw", v_Vuna_dInterp_dexpectKw)) (x_st4))) (VStr "else"))))) (VFun ("", fun x__u -> VFun ("", fun x_st5 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply ((apply (VFun ("Vuna.Interp.parseExpr", v_Vuna_dInterp_dparseExpr)) (x_st5))) (x_blockCol))) (VInt (0)))))) (VFun ("", fun x_no -> VFun ("", fun x_st6 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply ((apply (VFun ("Vuna.Interp.EIf", mk_Vuna_dInterp_dEIf)) (x_cond))) (x_yes))) (x_no))))) (x_st6))))))))))))))))))))))))))))
    | _ -> fail "no matching clause for Vuna.Interp.parseIf"))))
and v_Vuna_dInterp_dparsePatternSingle = (fun a1 -> VFun ("Vuna.Interp.parsePatternSingle", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (apply ((apply (VFun ("Vuna.Interp.parsePatternCons", v_Vuna_dInterp_dparsePatternCons)) (x_st))) (x_blockCol))
    | _ -> fail "no matching clause for Vuna.Interp.parsePatternSingle"))))
and v_Vuna_dInterp_dparsePatternCons = (fun a1 -> VFun ("Vuna.Interp.parsePatternCons", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parsePatternHead", v_Vuna_dInterp_dparsePatternHead)) (x_st))) (x_blockCol))))) (VFun ("", fun x_lhs -> VFun ("", fun x_st1 -> (match ((apply ((apply (VFun ("&&", bi_and)) ((apply ((apply (VFun ("Vuna.Interp.atSym", v_Vuna_dInterp_datSym)) (x_st1))) (VStr "::"))))) ((apply ((apply (VFun ("Vuna.Interp.canContinue", v_Vuna_dInterp_dcanContinue)) (x_st1))) (x_blockCol))))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parsePatternCons", v_Vuna_dInterp_dparsePatternCons)) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st1))))) (x_blockCol))))) (VFun ("", fun x_rhs -> VFun ("", fun x_st2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Vuna.Interp.PCon", mk_Vuna_dInterp_dPCon)) (VStr "Cons"))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_lhs))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_rhs))) (VCon ("Nil", [])))))))))) (x_st2)))))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_lhs))) (x_st1)))) | _ -> fail "if condition is not a Bool")))))
    | _ -> fail "no matching clause for Vuna.Interp.parsePatternCons"))))
and v_Vuna_dInterp_dparsePatternHead = (fun a1 -> VFun ("Vuna.Interp.parsePatternHead", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TIdent", [x_name]); x_p]) -> (match ((apply (VFun ("Vuna.Interp.upperFirst", v_Vuna_dInterp_dupperFirst)) (x_name))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parsePatternAtoms", v_Vuna_dInterp_dparsePatternAtoms)) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))) (x_blockCol))))) (VFun ("", fun x_args -> VFun ("", fun x_st1 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Vuna.Interp.PCon", mk_Vuna_dInterp_dPCon)) (x_name))) (x_args))))) (x_st1)))))))) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.parsePatternAtom", v_Vuna_dInterp_dparsePatternAtom)) (x_st))) (x_blockCol)) | _ -> fail "if condition is not a Bool")
    | _ -> (apply ((apply (VFun ("Vuna.Interp.parsePatternAtom", v_Vuna_dInterp_dparsePatternAtom)) (x_st))) (x_blockCol))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.parsePatternHead"))))
and v_Vuna_dInterp_dparsePatternAtoms = (fun a1 -> VFun ("Vuna.Interp.parsePatternAtoms", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply ((apply (VFun ("&&", bi_and)) ((apply (VFun ("Vuna.Interp.startsPatternAtom", v_Vuna_dInterp_dstartsPatternAtom)) (x_st))))) ((apply ((apply (VFun ("Vuna.Interp.canContinue", v_Vuna_dInterp_dcanContinue)) (x_st))) (x_blockCol))))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parsePatternAtom", v_Vuna_dInterp_dparsePatternAtom)) (x_st))) (x_blockCol))))) (VFun ("", fun x_pat -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parsePatternAtoms", v_Vuna_dInterp_dparsePatternAtoms)) (x_st1))) (x_blockCol))))) (VFun ("", fun x_rest -> VFun ("", fun x_st2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_pat))) (x_rest))))) (x_st2)))))))))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_st)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.parsePatternAtoms"))))
and v_Vuna_dInterp_dparsePatternAtom = (fun a1 -> VFun ("Vuna.Interp.parsePatternAtom", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (match ((apply (VFun ("Vuna.Interp.peekTok", v_Vuna_dInterp_dpeekTok)) (x_st))) with
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TIdent", [VStr "_"]); x_p]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Vuna.Interp.PWild", [])))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TIdent", [x_name]); x_p]) -> (match ((apply (VFun ("Vuna.Interp.upperFirst", v_Vuna_dInterp_dupperFirst)) (x_name))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Vuna.Interp.PCon", mk_Vuna_dInterp_dPCon)) (x_name))) (VCon ("Nil", [])))))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st)))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.PVar", mk_Vuna_dInterp_dPVar)) (x_name))))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st)))))) | _ -> fail "if condition is not a Bool")
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TInt", [x_n]); x_p]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.PInt", mk_Vuna_dInterp_dPInt)) (x_n))))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TStr", [x_s]); x_p]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.PStr", mk_Vuna_dInterp_dPStr)) (x_s))))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [VStr "("]); x_p]) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parsePatternSingle", v_Vuna_dInterp_dparsePatternSingle)) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st))))) (x_blockCol))))) (VFun ("", fun x_inner -> VFun ("", fun x_st1 -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectSym", v_Vuna_dInterp_dexpectSym)) (x_st1))) (VStr ")"))))) (VFun ("", fun x__u -> VFun ("", fun x_st2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_inner))) (x_st2))))))))))))
    | VCon ("Vuna.Interp.PTok", [VCon ("Vuna.Interp.TSym", [VStr "["]); x_p]) -> (apply ((apply (VFun ("Vuna.Interp.parseListPattern", v_Vuna_dInterp_dparseListPattern)) (x_st))) (x_blockCol))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected pattern"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.parsePatternAtom"))))
and v_Vuna_dInterp_dparseListPattern = (fun a1 -> VFun ("Vuna.Interp.parseListPattern", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.expectSym", v_Vuna_dInterp_dexpectSym)) (x_st))) (VStr "["))))) (VFun ("", fun x__u -> VFun ("", fun x_st1 -> (match ((apply ((apply (VFun ("Vuna.Interp.atSym", v_Vuna_dInterp_datSym)) (x_st1))) (VStr "]"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Vuna.Interp.PCon", mk_Vuna_dInterp_dPCon)) (VStr "Nil"))) (VCon ("Nil", [])))))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st1)))))) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseListPatternElems", v_Vuna_dInterp_dparseListPatternElems)) (x_st1))) (x_blockCol))))) (VFun ("", fun x_pats -> VFun ("", fun x_st2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.foldPCon", v_Vuna_dInterp_dfoldPCon)) (x_pats))))) (x_st2)))))))) | _ -> fail "if condition is not a Bool")))))
    | _ -> fail "no matching clause for Vuna.Interp.parseListPattern"))))
and v_Vuna_dInterp_dparseListPatternElems = (fun a1 -> VFun ("Vuna.Interp.parseListPatternElems", (fun a2 -> (match (a1, a2) with
    | (x_st, x_blockCol) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parsePatternSingle", v_Vuna_dInterp_dparsePatternSingle)) (x_st))) (x_blockCol))))) (VFun ("", fun x_pat -> VFun ("", fun x_st1 -> (match ((apply ((apply (VFun ("Vuna.Interp.atSym", v_Vuna_dInterp_datSym)) (x_st1))) (VStr ","))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.step", v_Vuna_dInterp_dstep)) ((apply ((apply (VFun ("Vuna.Interp.parseListPatternElems", v_Vuna_dInterp_dparseListPatternElems)) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st1))))) (x_blockCol))))) (VFun ("", fun x_rest -> VFun ("", fun x_st2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_pat))) (x_rest))))) (x_st2)))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.atSym", v_Vuna_dInterp_datSym)) (x_st1))) (VStr "]"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_pat))) (VCon ("Nil", [])))))) ((apply (VFun ("Vuna.Interp.advance", v_Vuna_dInterp_dadvance)) (x_st1)))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected , or ]")) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")))))
    | _ -> fail "no matching clause for Vuna.Interp.parseListPatternElems"))))
and v_Vuna_dInterp_dfoldPCon = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> (apply ((apply (VFun ("Vuna.Interp.PCon", mk_Vuna_dInterp_dPCon)) (VStr "Nil"))) (VCon ("Nil", [])))
    | VCon ("Cons", [x_p; x_rest]) -> (apply ((apply (VFun ("Vuna.Interp.PCon", mk_Vuna_dInterp_dPCon)) (VStr "Cons"))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_p))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply (VFun ("Vuna.Interp.foldPCon", v_Vuna_dInterp_dfoldPCon)) (x_rest))))) (VCon ("Nil", [])))))))
    | _ -> fail "no matching clause for Vuna.Interp.foldPCon"))
and v_Vuna_dInterp_disSpace = (fun a1 -> (match a1 with
    | x_c -> (apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (32)))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (9)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (10)))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (13)))))
    | _ -> fail "no matching clause for Vuna.Interp.isSpace"))
and v_Vuna_dInterp_disDigit = (fun a1 -> (match a1 with
    | x_c -> (apply ((apply (VFun ("&&", bi_and)) ((apply ((apply (VFun (">=", bi_ge)) (x_c))) (VInt (48)))))) ((apply ((apply (VFun ("<=", bi_le)) (x_c))) (VInt (57)))))
    | _ -> fail "no matching clause for Vuna.Interp.isDigit"))
and v_Vuna_dInterp_dlookupPair = (fun a1 -> VFun ("Vuna.Interp.lookupPair", (fun a2 -> (match (a1, a2) with
    | (x_name, VCon ("Nil", [])) -> VCon ("Vuna.Interp.Nothing", [])
    | (x_name, VCon ("Cons", [x_p; x_rest])) -> (match (x_p) with
    | VCon ("Vuna.Interp.Pair", [x_k; x_v]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_k))) (x_name))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (x_v)) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.lookupPair", v_Vuna_dInterp_dlookupPair)) (x_name))) (x_rest)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.lookupPair"))))
and v_Vuna_dInterp_dcollectClauses = (fun a1 -> VFun ("Vuna.Interp.collectClauses", (fun a2 -> (match (a1, a2) with
    | (VCon ("Nil", []), x_name) -> VCon ("Nil", [])
    | (VCon ("Cons", [x_d; x_rest]), x_name) -> (match (x_d) with
    | VCon ("Vuna.Interp.DFun", [x_n; x_pats; x_body]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_n))) (x_name))) with VCon ("True", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_pats))) (x_body))))) ((apply ((apply (VFun ("Vuna.Interp.collectClauses", v_Vuna_dInterp_dcollectClauses)) (x_rest))) (x_name)))) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.collectClauses", v_Vuna_dInterp_dcollectClauses)) (x_rest))) (x_name)) | _ -> fail "if condition is not a Bool")
    | _ -> (apply ((apply (VFun ("Vuna.Interp.collectClauses", v_Vuna_dInterp_dcollectClauses)) (x_rest))) (x_name))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.collectClauses"))))
and v_Vuna_dInterp_dclausesFor = (fun a1 -> VFun ("Vuna.Interp.clausesFor", (fun a2 -> (match (a1, a2) with
    | (x_decls, x_name) -> (apply ((apply (VFun ("Vuna.Interp.collectClauses", v_Vuna_dInterp_dcollectClauses)) (x_decls))) (x_name))
    | _ -> fail "no matching clause for Vuna.Interp.clausesFor"))))
and v_Vuna_dInterp_dfunArity = (fun a1 -> VFun ("Vuna.Interp.funArity", (fun a2 -> (match (a1, a2) with
    | (x_name, x_decls) -> (match ((apply ((apply (VFun ("Vuna.Interp.clausesFor", v_Vuna_dInterp_dclausesFor)) (x_decls))) (x_name))) with
    | VCon ("Nil", []) -> VCon ("Vuna.Interp.Nothing", [])
    | VCon ("Cons", [x_c; x_rest]) -> (match (x_c) with
    | VCon ("Vuna.Interp.Pair", [x_pats; x_body]) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_pats))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.funArity"))))
and v_Vuna_dInterp_dctorArity = (fun a1 -> VFun ("Vuna.Interp.ctorArity", (fun a2 -> (match (a1, a2) with
    | (x_name, x_decls) -> (match (x_decls) with
    | VCon ("Nil", []) -> VCon ("Vuna.Interp.Nothing", [])
    | VCon ("Cons", [x_d; x_rest]) -> (match (x_d) with
    | VCon ("Vuna.Interp.DData", [x_dname; x_params; x_ctors]) -> (match ((apply ((apply (VFun ("Vuna.Interp.lookupPair", v_Vuna_dInterp_dlookupPair)) (x_name))) (x_ctors))) with
    | VCon ("Vuna.Interp.Just", [x_arity]) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (x_arity))
    | VCon ("Vuna.Interp.Nothing", []) -> (apply ((apply (VFun ("Vuna.Interp.ctorArity", v_Vuna_dInterp_dctorArity)) (x_name))) (x_rest))
    | _ -> fail "case pattern match failure")
    | _ -> (apply ((apply (VFun ("Vuna.Interp.ctorArity", v_Vuna_dInterp_dctorArity)) (x_name))) (x_rest))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.ctorArity"))))
and v_Vuna_dInterp_dbuiltinArity = (fun a1 -> (match a1 with
    | x_name -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "+"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "-"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "*"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "/"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "=="))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "/="))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "<"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "<="))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr ">"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr ">="))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "&&"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "||"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "++"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "strLength"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (1))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "strUnpack"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (1))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "strPack"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (1))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "strFromInt"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (1))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "readFile"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (1))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "writeFile"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (2))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "print"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (1))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "getArgs"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VInt (0))) | VCon ("False", []) -> VCon ("Vuna.Interp.Nothing", []) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.builtinArity"))
and v_Vuna_dInterp_dforceValue = (fun a1 -> VFun ("Vuna.Interp.forceValue", (fun a2 -> (match (a1, a2) with
    | (x_decls, x_v) -> (match (x_v) with
    | VCon ("Vuna.Interp.VFun", [x_name; VCon ("Nil", [])]) -> (match ((apply ((apply (VFun ("Vuna.Interp.funArity", v_Vuna_dInterp_dfunArity)) (x_name))) (x_decls))) with
    | VCon ("Vuna.Interp.Just", [VInt (0)]) -> (apply ((apply ((apply (VFun ("Vuna.Interp.callFunction", v_Vuna_dInterp_dcallFunction)) (x_decls))) (x_name))) (VCon ("Nil", [])))
    | _ -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_v))
    | _ -> fail "case pattern match failure")
    | _ -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_v))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.forceValue"))))
and v_Vuna_dInterp_devalVar = (fun a1 -> VFun ("Vuna.Interp.evalVar", (fun a2 -> VFun ("Vuna.Interp.evalVar", (fun a3 -> (match (a1, a2, a3) with
    | (x_decls, x_env, x_name) -> (match ((apply ((apply (VFun ("Vuna.Interp.lookupPair", v_Vuna_dInterp_dlookupPair)) (x_name))) (x_env))) with
    | VCon ("Vuna.Interp.Just", [x_v]) -> (apply ((apply (VFun ("Vuna.Interp.forceValue", v_Vuna_dInterp_dforceValue)) (x_decls))) (x_v))
    | VCon ("Vuna.Interp.Nothing", []) -> (apply ((apply (VFun ("Vuna.Interp.evalGlobal", v_Vuna_dInterp_devalGlobal)) (x_decls))) (x_name))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.evalVar"))))))
and v_Vuna_dInterp_devalGlobal = (fun a1 -> VFun ("Vuna.Interp.evalGlobal", (fun a2 -> (match (a1, a2) with
    | (x_decls, x_name) -> (match ((apply ((apply (VFun ("Vuna.Interp.funArity", v_Vuna_dInterp_dfunArity)) (x_name))) (x_decls))) with
    | VCon ("Vuna.Interp.Just", [x_arity]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_arity))) (VInt (0)))) with VCon ("True", []) -> (apply ((apply ((apply (VFun ("Vuna.Interp.callFunction", v_Vuna_dInterp_dcallFunction)) (x_decls))) (x_name))) (VCon ("Nil", []))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.VFun", mk_Vuna_dInterp_dVFun)) (x_name))) (VCon ("Nil", []))))) | _ -> fail "if condition is not a Bool")
    | VCon ("Vuna.Interp.Nothing", []) -> (apply ((apply (VFun ("Vuna.Interp.evalGlobalNonFun", v_Vuna_dInterp_devalGlobalNonFun)) (x_decls))) (x_name))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.evalGlobal"))))
and v_Vuna_dInterp_devalGlobalNonFun = (fun a1 -> VFun ("Vuna.Interp.evalGlobalNonFun", (fun a2 -> (match (a1, a2) with
    | (x_decls, x_name) -> (match ((apply ((apply (VFun ("Vuna.Interp.ctorArity", v_Vuna_dInterp_dctorArity)) (x_name))) (x_decls))) with
    | VCon ("Vuna.Interp.Just", [x_arity]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.VCon", mk_Vuna_dInterp_dVCon)) (x_name))) (VCon ("Nil", [])))))
    | VCon ("Vuna.Interp.Nothing", []) -> (match ((apply (VFun ("Vuna.Interp.builtinArity", v_Vuna_dInterp_dbuiltinArity)) (x_name))) with
    | VCon ("Vuna.Interp.Just", [x_arity]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_arity))) (VInt (0)))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.callBuiltin", v_Vuna_dInterp_dcallBuiltin)) (x_name))) (VCon ("Nil", []))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.VBuiltin", mk_Vuna_dInterp_dVBuiltin)) (x_name))) (VCon ("Nil", []))))) | _ -> fail "if condition is not a Bool")
    | VCon ("Vuna.Interp.Nothing", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "unbound variable: "))) (x_name))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.evalGlobalNonFun"))))
and v_Vuna_dInterp_devalExpr = (fun a1 -> VFun ("Vuna.Interp.evalExpr", (fun a2 -> VFun ("Vuna.Interp.evalExpr", (fun a3 -> (match (a1, a2, a3) with
    | (x_decls, x_env, x_expr) -> (match (x_expr) with
    | VCon ("Vuna.Interp.EVar", [x_name]) -> (apply ((apply ((apply (VFun ("Vuna.Interp.evalVar", v_Vuna_dInterp_devalVar)) (x_decls))) (x_env))) (x_name))
    | VCon ("Vuna.Interp.EInt", [x_n]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VInt", mk_Vuna_dInterp_dVInt)) (x_n))))
    | VCon ("Vuna.Interp.EStr", [x_s]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VStr", mk_Vuna_dInterp_dVStr)) (x_s))))
    | VCon ("Vuna.Interp.ELam", [x_params; x_body]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply ((apply (VFun ("Vuna.Interp.VLam", mk_Vuna_dInterp_dVLam)) (x_params))) (x_body))) (x_env))))
    | VCon ("Vuna.Interp.EApp", [x_fn; x_args]) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.evalApp", v_Vuna_dInterp_devalApp)) (x_decls))) (x_env))) (x_fn))) (x_args))
    | VCon ("Vuna.Interp.ELet", [x_binds; x_body]) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.evalLet", v_Vuna_dInterp_devalLet)) (x_decls))) (x_env))) (x_binds))) (x_body))
    | VCon ("Vuna.Interp.ECase", [x_scrut; x_alts]) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.evalCase", v_Vuna_dInterp_devalCase)) (x_decls))) (x_env))) (x_scrut))) (x_alts))
    | VCon ("Vuna.Interp.EIf", [x_c; x_t; x_e]) -> (apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.evalIf", v_Vuna_dInterp_devalIf)) (x_decls))) (x_env))) (x_c))) (x_t))) (x_e))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.evalExpr"))))))
and v_Vuna_dInterp_devalApp = (fun a1 -> VFun ("Vuna.Interp.evalApp", (fun a2 -> VFun ("Vuna.Interp.evalApp", (fun a3 -> VFun ("Vuna.Interp.evalApp", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_decls, x_env, x_fn, x_args) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.evalExpr", v_Vuna_dInterp_devalExpr)) (x_decls))) (x_env))) (x_fn))))) (VFun ("", fun x_fv -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.foldApply", v_Vuna_dInterp_dfoldApply)) (x_decls))) (x_env))) (x_fv))) (x_args)))))
    | _ -> fail "no matching clause for Vuna.Interp.evalApp"))))))))
and v_Vuna_dInterp_dfoldApply = (fun a1 -> VFun ("Vuna.Interp.foldApply", (fun a2 -> VFun ("Vuna.Interp.foldApply", (fun a3 -> VFun ("Vuna.Interp.foldApply", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_decls, x_env, x_fv, VCon ("Nil", [])) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_fv))
    | (x_decls, x_env, x_fv, VCon ("Cons", [x_arg; x_rest])) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.evalExpr", v_Vuna_dInterp_devalExpr)) (x_decls))) (x_env))) (x_arg))))) (VFun ("", fun x_av -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.applyValue", v_Vuna_dInterp_dapplyValue)) (x_decls))) (x_fv))) (x_av))))) (VFun ("", fun x_fv2 -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.foldApply", v_Vuna_dInterp_dfoldApply)) (x_decls))) (x_env))) (x_fv2))) (x_rest))))))))
    | _ -> fail "no matching clause for Vuna.Interp.foldApply"))))))))
and v_Vuna_dInterp_devalLet = (fun a1 -> VFun ("Vuna.Interp.evalLet", (fun a2 -> VFun ("Vuna.Interp.evalLet", (fun a3 -> VFun ("Vuna.Interp.evalLet", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_decls, x_env, x_binds, x_body) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.evalBindings", v_Vuna_dInterp_devalBindings)) (x_decls))) (x_env))) (x_binds))))) (VFun ("", fun x_env2 -> (apply ((apply ((apply (VFun ("Vuna.Interp.evalExpr", v_Vuna_dInterp_devalExpr)) (x_decls))) (x_env2))) (x_body)))))
    | _ -> fail "no matching clause for Vuna.Interp.evalLet"))))))))
and v_Vuna_dInterp_devalBindings = (fun a1 -> VFun ("Vuna.Interp.evalBindings", (fun a2 -> VFun ("Vuna.Interp.evalBindings", (fun a3 -> (match (a1, a2, a3) with
    | (x_decls, x_env, VCon ("Nil", [])) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_env))
    | (x_decls, x_env, VCon ("Cons", [x_b; x_rest])) -> (match (x_b) with
    | VCon ("Vuna.Interp.Pair", [x_pat; x_valueExpr]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.evalExpr", v_Vuna_dInterp_devalExpr)) (x_decls))) (x_env))) (x_valueExpr))))) (VFun ("", fun x_v -> (match ((apply ((apply (VFun ("Vuna.Interp.matchPattern", v_Vuna_dInterp_dmatchPattern)) (x_pat))) (x_v))) with
    | VCon ("Vuna.Interp.Nothing", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "let pattern match failure"))
    | VCon ("Vuna.Interp.Just", [x_bs]) -> (apply ((apply ((apply (VFun ("Vuna.Interp.evalBindings", v_Vuna_dInterp_devalBindings)) (x_decls))) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_bs))) (x_env))))) (x_rest))
    | _ -> fail "case pattern match failure"))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.evalBindings"))))))
and v_Vuna_dInterp_devalCase = (fun a1 -> VFun ("Vuna.Interp.evalCase", (fun a2 -> VFun ("Vuna.Interp.evalCase", (fun a3 -> VFun ("Vuna.Interp.evalCase", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_decls, x_env, x_scrut, x_alts) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.evalExpr", v_Vuna_dInterp_devalExpr)) (x_decls))) (x_env))) (x_scrut))))) (VFun ("", fun x_v -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.chooseAlt", v_Vuna_dInterp_dchooseAlt)) (x_decls))) (x_env))) (x_v))) (x_alts)))))
    | _ -> fail "no matching clause for Vuna.Interp.evalCase"))))))))
and v_Vuna_dInterp_dchooseAlt = (fun a1 -> VFun ("Vuna.Interp.chooseAlt", (fun a2 -> VFun ("Vuna.Interp.chooseAlt", (fun a3 -> VFun ("Vuna.Interp.chooseAlt", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_decls, x_env, x_v, VCon ("Nil", [])) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "case pattern match failure"))
    | (x_decls, x_env, x_v, VCon ("Cons", [x_alt; x_rest])) -> (match (x_alt) with
    | VCon ("Vuna.Interp.Pair", [x_pat; x_body]) -> (match ((apply ((apply (VFun ("Vuna.Interp.matchPattern", v_Vuna_dInterp_dmatchPattern)) (x_pat))) (x_v))) with
    | VCon ("Vuna.Interp.Nothing", []) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.chooseAlt", v_Vuna_dInterp_dchooseAlt)) (x_decls))) (x_env))) (x_v))) (x_rest))
    | VCon ("Vuna.Interp.Just", [x_bs]) -> (apply ((apply ((apply (VFun ("Vuna.Interp.evalExpr", v_Vuna_dInterp_devalExpr)) (x_decls))) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_bs))) (x_env))))) (x_body))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.chooseAlt"))))))))
and v_Vuna_dInterp_devalIf = (fun a1 -> VFun ("Vuna.Interp.evalIf", (fun a2 -> VFun ("Vuna.Interp.evalIf", (fun a3 -> VFun ("Vuna.Interp.evalIf", (fun a4 -> VFun ("Vuna.Interp.evalIf", (fun a5 -> (match (a1, a2, a3, a4, a5) with
    | (x_decls, x_env, x_c, x_t, x_e) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.evalExpr", v_Vuna_dInterp_devalExpr)) (x_decls))) (x_env))) (x_c))))) (VFun ("", fun x_cv -> (match (x_cv) with
    | VCon ("Vuna.Interp.VCon", [VStr "True"; VCon ("Nil", [])]) -> (apply ((apply ((apply (VFun ("Vuna.Interp.evalExpr", v_Vuna_dInterp_devalExpr)) (x_decls))) (x_env))) (x_t))
    | VCon ("Vuna.Interp.VCon", [VStr "False"; VCon ("Nil", [])]) -> (apply ((apply ((apply (VFun ("Vuna.Interp.evalExpr", v_Vuna_dInterp_devalExpr)) (x_decls))) (x_env))) (x_e))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "if condition is not a Bool"))
    | _ -> fail "case pattern match failure"))))
    | _ -> fail "no matching clause for Vuna.Interp.evalIf"))))))))))
and v_Vuna_dInterp_dapplyValue = (fun a1 -> VFun ("Vuna.Interp.applyValue", (fun a2 -> VFun ("Vuna.Interp.applyValue", (fun a3 -> (match (a1, a2, a3) with
    | (x_decls, x_v, x_arg) -> (match (x_v) with
    | VCon ("Vuna.Interp.VFun", [x_name; x_bound]) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.applyFun", v_Vuna_dInterp_dapplyFun)) (x_decls))) (x_name))) (x_bound))) (x_arg))
    | VCon ("Vuna.Interp.VLam", [x_params; x_body; x_env]) -> (apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.applyLambda", v_Vuna_dInterp_dapplyLambda)) (x_decls))) (x_params))) (x_body))) (x_env))) (x_arg))
    | VCon ("Vuna.Interp.VCon", [x_name; x_args]) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.applyCtor", v_Vuna_dInterp_dapplyCtor)) (x_decls))) (x_name))) (x_args))) (x_arg))
    | VCon ("Vuna.Interp.VBuiltin", [x_name; x_args]) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.applyBuiltin", v_Vuna_dInterp_dapplyBuiltin)) (x_decls))) (x_name))) (x_args))) (x_arg))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "cannot apply a non-function"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.applyValue"))))))
and v_Vuna_dInterp_dapplyFun = (fun a1 -> VFun ("Vuna.Interp.applyFun", (fun a2 -> VFun ("Vuna.Interp.applyFun", (fun a3 -> VFun ("Vuna.Interp.applyFun", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_decls, x_name, x_bound, x_arg) -> (match ((apply ((apply (VFun ("Vuna.Interp.funArity", v_Vuna_dInterp_dfunArity)) (x_name))) (x_decls))) with
    | VCon ("Vuna.Interp.Nothing", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "unknown function: "))) (x_name))))
    | VCon ("Vuna.Interp.Just", [x_arity]) -> (let x_bound2 = ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_bound))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_arg))) (VCon ("Nil", [])))))) in (match ((apply ((apply (VFun ("<", bi_lt)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_bound2))))) (x_arity))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.VFun", mk_Vuna_dInterp_dVFun)) (x_name))) (x_bound2)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_bound2))))) (x_arity))) with VCon ("True", []) -> (apply ((apply ((apply (VFun ("Vuna.Interp.callFunction", v_Vuna_dInterp_dcallFunction)) (x_decls))) (x_name))) (x_bound2)) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "too many arguments for "))) (x_name)))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.applyFun"))))))))
and v_Vuna_dInterp_dapplyLambda = (fun a1 -> VFun ("Vuna.Interp.applyLambda", (fun a2 -> VFun ("Vuna.Interp.applyLambda", (fun a3 -> VFun ("Vuna.Interp.applyLambda", (fun a4 -> VFun ("Vuna.Interp.applyLambda", (fun a5 -> (match (a1, a2, a3, a4, a5) with
    | (x_decls, x_params, x_body, x_env, x_arg) -> (match (x_params) with
    | VCon ("Nil", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "lambda has no parameters"))
    | VCon ("Cons", [x_p; VCon ("Nil", [])]) -> (apply ((apply ((apply (VFun ("Vuna.Interp.evalExpr", v_Vuna_dInterp_devalExpr)) (x_decls))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_p))) (x_arg))))) (x_env))))) (x_body))
    | VCon ("Cons", [x_p; x_rest]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply ((apply (VFun ("Vuna.Interp.VLam", mk_Vuna_dInterp_dVLam)) (x_rest))) (x_body))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_p))) (x_arg))))) (x_env))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.applyLambda"))))))))))
and v_Vuna_dInterp_dapplyCtor = (fun a1 -> VFun ("Vuna.Interp.applyCtor", (fun a2 -> VFun ("Vuna.Interp.applyCtor", (fun a3 -> VFun ("Vuna.Interp.applyCtor", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_decls, x_name, x_args, x_arg) -> (match ((apply ((apply (VFun ("Vuna.Interp.ctorArity", v_Vuna_dInterp_dctorArity)) (x_name))) (x_decls))) with
    | VCon ("Vuna.Interp.Nothing", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "unknown constructor: "))) (x_name))))
    | VCon ("Vuna.Interp.Just", [x_arity]) -> (match ((apply ((apply (VFun (">=", bi_ge)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_args))))) (x_arity))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "constructor "))) ((apply ((apply (VFun ("++", bi_concat)) (x_name))) (VStr " cannot take more arguments")))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.VCon", mk_Vuna_dInterp_dVCon)) (x_name))) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_args))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_arg))) (VCon ("Nil", []))))))))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.applyCtor"))))))))
and v_Vuna_dInterp_dapplyBuiltin = (fun a1 -> VFun ("Vuna.Interp.applyBuiltin", (fun a2 -> VFun ("Vuna.Interp.applyBuiltin", (fun a3 -> VFun ("Vuna.Interp.applyBuiltin", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_decls, x_name, x_args, x_arg) -> (match ((apply (VFun ("Vuna.Interp.builtinArity", v_Vuna_dInterp_dbuiltinArity)) (x_name))) with
    | VCon ("Vuna.Interp.Nothing", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "unknown builtin: "))) (x_name))))
    | VCon ("Vuna.Interp.Just", [x_arity]) -> (let x_args2 = ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_args))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_arg))) (VCon ("Nil", [])))))) in (match ((apply ((apply (VFun ("<", bi_lt)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_args2))))) (x_arity))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.VBuiltin", mk_Vuna_dInterp_dVBuiltin)) (x_name))) (x_args2)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_args2))))) (x_arity))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.callBuiltin", v_Vuna_dInterp_dcallBuiltin)) (x_name))) (x_args2)) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "too many arguments for builtin "))) (x_name)))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.applyBuiltin"))))))))
and v_Vuna_dInterp_dcallFunction = (fun a1 -> VFun ("Vuna.Interp.callFunction", (fun a2 -> VFun ("Vuna.Interp.callFunction", (fun a3 -> (match (a1, a2, a3) with
    | (x_decls, x_name, x_args) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.tryClauses", v_Vuna_dInterp_dtryClauses)) (x_decls))) (x_name))) ((apply ((apply (VFun ("Vuna.Interp.clausesFor", v_Vuna_dInterp_dclausesFor)) (x_decls))) (x_name))))) (x_args))
    | _ -> fail "no matching clause for Vuna.Interp.callFunction"))))))
and v_Vuna_dInterp_dtryClauses = (fun a1 -> VFun ("Vuna.Interp.tryClauses", (fun a2 -> VFun ("Vuna.Interp.tryClauses", (fun a3 -> VFun ("Vuna.Interp.tryClauses", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_decls, x_name, VCon ("Nil", []), x_args) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "no matching clause for "))) (x_name))))
    | (x_decls, x_name, VCon ("Cons", [x_c; x_rest]), x_args) -> (match (x_c) with
    | VCon ("Vuna.Interp.Pair", [x_pats; x_body]) -> (match ((apply ((apply (VFun ("==", bi_eq)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_pats))))) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_args))))) with VCon ("True", []) -> (apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.tryMatch", v_Vuna_dInterp_dtryMatch)) (x_decls))) (x_name))) (x_pats))) (x_body))) (x_rest))) (x_args)) | VCon ("False", []) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.tryClauses", v_Vuna_dInterp_dtryClauses)) (x_decls))) (x_name))) (x_rest))) (x_args)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.tryClauses"))))))))
and v_Vuna_dInterp_dtryMatch = (fun a1 -> VFun ("Vuna.Interp.tryMatch", (fun a2 -> VFun ("Vuna.Interp.tryMatch", (fun a3 -> VFun ("Vuna.Interp.tryMatch", (fun a4 -> VFun ("Vuna.Interp.tryMatch", (fun a5 -> VFun ("Vuna.Interp.tryMatch", (fun a6 -> (match (a1, a2, a3, a4, a5, a6) with
    | (x_decls, x_name, x_pats, x_body, x_rest, x_args) -> (match ((apply ((apply (VFun ("Vuna.Interp.matchPatterns", v_Vuna_dInterp_dmatchPatterns)) (x_pats))) (x_args))) with
    | VCon ("Vuna.Interp.Just", [x_binds]) -> (apply ((apply ((apply (VFun ("Vuna.Interp.evalExpr", v_Vuna_dInterp_devalExpr)) (x_decls))) (x_binds))) (x_body))
    | VCon ("Vuna.Interp.Nothing", []) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.tryClauses", v_Vuna_dInterp_dtryClauses)) (x_decls))) (x_name))) (x_rest))) (x_args))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.tryMatch"))))))))))))
and v_Vuna_dInterp_dmatchPatterns = (fun a1 -> VFun ("Vuna.Interp.matchPatterns", (fun a2 -> (match (a1, a2) with
    | (VCon ("Nil", []), VCon ("Nil", [])) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VCon ("Nil", [])))
    | (VCon ("Cons", [x_p; x_ps]), VCon ("Cons", [x_v; x_vs])) -> (match ((apply ((apply (VFun ("Vuna.Interp.matchPattern", v_Vuna_dInterp_dmatchPattern)) (x_p))) (x_v))) with
    | VCon ("Vuna.Interp.Nothing", []) -> VCon ("Vuna.Interp.Nothing", [])
    | VCon ("Vuna.Interp.Just", [x_bs]) -> (match ((apply ((apply (VFun ("Vuna.Interp.matchPatterns", v_Vuna_dInterp_dmatchPatterns)) (x_ps))) (x_vs))) with
    | VCon ("Vuna.Interp.Nothing", []) -> VCon ("Vuna.Interp.Nothing", [])
    | VCon ("Vuna.Interp.Just", [x_bs2]) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_bs))) (x_bs2))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | (_, _) -> VCon ("Vuna.Interp.Nothing", [])
    | _ -> fail "no matching clause for Vuna.Interp.matchPatterns"))))
and v_Vuna_dInterp_dmatchPattern = (fun a1 -> VFun ("Vuna.Interp.matchPattern", (fun a2 -> (match (a1, a2) with
    | (x_p, x_v) -> (match (x_p) with
    | VCon ("Vuna.Interp.PWild", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VCon ("Nil", [])))
    | VCon ("Vuna.Interp.PVar", [x_name]) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_name))) (x_v))))) (VCon ("Nil", [])))))
    | VCon ("Vuna.Interp.PInt", [x_n]) -> (match (x_v) with
    | VCon ("Vuna.Interp.VInt", [x_m]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_n))) (x_m))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VCon ("Nil", []))) | VCon ("False", []) -> VCon ("Vuna.Interp.Nothing", []) | _ -> fail "if condition is not a Bool")
    | _ -> VCon ("Vuna.Interp.Nothing", [])
    | _ -> fail "case pattern match failure")
    | VCon ("Vuna.Interp.PStr", [x_s]) -> (match (x_v) with
    | VCon ("Vuna.Interp.VStr", [x_t]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_s))) (x_t))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (VCon ("Nil", []))) | VCon ("False", []) -> VCon ("Vuna.Interp.Nothing", []) | _ -> fail "if condition is not a Bool")
    | _ -> VCon ("Vuna.Interp.Nothing", [])
    | _ -> fail "case pattern match failure")
    | VCon ("Vuna.Interp.PCon", [x_name; x_pats]) -> (match (x_v) with
    | VCon ("Vuna.Interp.VCon", [x_vname; x_vargs]) -> (match ((apply ((apply (VFun ("&&", bi_and)) ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (x_vname))))) ((apply ((apply (VFun ("==", bi_eq)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_pats))))) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_vargs))))))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.matchPatterns", v_Vuna_dInterp_dmatchPatterns)) (x_pats))) (x_vargs)) | VCon ("False", []) -> VCon ("Vuna.Interp.Nothing", []) | _ -> fail "if condition is not a Bool")
    | _ -> VCon ("Vuna.Interp.Nothing", [])
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.matchPattern"))))
and v_Vuna_dInterp_dintArg = (fun a1 -> (match a1 with
    | x_v -> (match (x_v) with
    | VCon ("Vuna.Interp.VInt", [x_n]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_n))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected an Int argument"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.intArg"))
and v_Vuna_dInterp_dstringArg = (fun a1 -> (match a1 with
    | x_v -> (match (x_v) with
    | VCon ("Vuna.Interp.VStr", [x_s]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_s))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected a String argument"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.stringArg"))
and v_Vuna_dInterp_dvbool = (fun a1 -> (match a1 with
    | x_b -> (match (x_b) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.VCon", mk_Vuna_dInterp_dVCon)) (VStr "True"))) (VCon ("Nil", []))) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.VCon", mk_Vuna_dInterp_dVCon)) (VStr "False"))) (VCon ("Nil", []))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.vbool"))
and v_Vuna_dInterp_dcharsToValue = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> (apply ((apply (VFun ("Vuna.Interp.VCon", mk_Vuna_dInterp_dVCon)) (VStr "Nil"))) (VCon ("Nil", [])))
    | VCon ("Cons", [x_c; x_rest]) -> (apply ((apply (VFun ("Vuna.Interp.VCon", mk_Vuna_dInterp_dVCon)) (VStr "Cons"))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply (VFun ("Vuna.Interp.VInt", mk_Vuna_dInterp_dVInt)) (x_c))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply (VFun ("Vuna.Interp.charsToValue", v_Vuna_dInterp_dcharsToValue)) (x_rest))))) (VCon ("Nil", [])))))))
    | _ -> fail "no matching clause for Vuna.Interp.charsToValue"))
and v_Vuna_dInterp_dstringToValue = (fun a1 -> (match a1 with
    | x_s -> (apply (VFun ("Vuna.Interp.charsToValue", v_Vuna_dInterp_dcharsToValue)) ((apply (VFun ("strUnpack", bi_str_unpack)) (x_s))))
    | _ -> fail "no matching clause for Vuna.Interp.stringToValue"))
and v_Vuna_dInterp_dvalueToChars = (fun a1 -> (match a1 with
    | x_v -> (match (x_v) with
    | VCon ("Vuna.Interp.VCon", [VStr "Nil"; VCon ("Nil", [])]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (VCon ("Nil", [])))
    | VCon ("Vuna.Interp.VCon", [VStr "Cons"; VCon ("Cons", [x_head; VCon ("Cons", [x_tail; VCon ("Nil", [])])])]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.intArg", v_Vuna_dInterp_dintArg)) (x_head))))) (VFun ("", fun x_n -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.valueToChars", v_Vuna_dInterp_dvalueToChars)) (x_tail))))) (VFun ("", fun x_rest -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_n))) (x_rest))))))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "strPack expects a List Int"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.valueToChars"))
and v_Vuna_dInterp_dint2 = (fun a1 -> VFun ("Vuna.Interp.int2", (fun a2 -> (match (a1, a2) with
    | (x_args, x_f) -> (match (x_args) with
    | VCon ("Cons", [x_a; VCon ("Cons", [x_b; VCon ("Nil", [])])]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.intArg", v_Vuna_dInterp_dintArg)) (x_a))))) (VFun ("", fun x_x -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.intArg", v_Vuna_dInterp_dintArg)) (x_b))))) (VFun ("", fun x_y -> (apply ((apply (x_f) (x_x))) (x_y))))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.int2"))))
and v_Vuna_dInterp_dstr2 = (fun a1 -> VFun ("Vuna.Interp.str2", (fun a2 -> (match (a1, a2) with
    | (x_args, x_f) -> (match (x_args) with
    | VCon ("Cons", [x_a; VCon ("Cons", [x_b; VCon ("Nil", [])])]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.stringArg", v_Vuna_dInterp_dstringArg)) (x_a))))) (VFun ("", fun x_x -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.stringArg", v_Vuna_dInterp_dstringArg)) (x_b))))) (VFun ("", fun x_y -> (apply ((apply (x_f) (x_x))) (x_y))))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.str2"))))
and v_Vuna_dInterp_ddivideBuiltin = (fun a1 -> (match a1 with
    | x_args -> (match (x_args) with
    | VCon ("Cons", [x_a; VCon ("Cons", [x_b; VCon ("Nil", [])])]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.intArg", v_Vuna_dInterp_dintArg)) (x_a))))) (VFun ("", fun x_x -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.intArg", v_Vuna_dInterp_dintArg)) (x_b))))) (VFun ("", fun x_y -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_y))) (VInt (0)))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "division by zero")) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VInt", mk_Vuna_dInterp_dVInt)) ((apply ((apply (VFun ("/", bi_div)) (x_x))) (x_y)))))) | _ -> fail "if condition is not a Bool")))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments for /"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.divideBuiltin"))
and v_Vuna_dInterp_deqBuiltin = (fun a1 -> (match a1 with
    | x_args -> (match (x_args) with
    | VCon ("Cons", [VCon ("Vuna.Interp.VInt", [x_a]); VCon ("Cons", [VCon ("Vuna.Interp.VInt", [x_b]); VCon ("Nil", [])])]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.vbool", v_Vuna_dInterp_dvbool)) ((apply ((apply (VFun ("==", bi_eq)) (x_a))) (x_b))))))
    | VCon ("Cons", [VCon ("Vuna.Interp.VStr", [x_a]); VCon ("Cons", [VCon ("Vuna.Interp.VStr", [x_b]); VCon ("Nil", [])])]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.vbool", v_Vuna_dInterp_dvbool)) ((apply ((apply (VFun ("==", bi_eq)) (x_a))) (x_b))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments for =="))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.eqBuiltin"))
and v_Vuna_dInterp_dneqBuiltin = (fun a1 -> (match a1 with
    | x_args -> (match (x_args) with
    | VCon ("Cons", [VCon ("Vuna.Interp.VInt", [x_a]); VCon ("Cons", [VCon ("Vuna.Interp.VInt", [x_b]); VCon ("Nil", [])])]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.vbool", v_Vuna_dInterp_dvbool)) ((apply ((apply (VFun ("/=", bi_neq)) (x_a))) (x_b))))))
    | VCon ("Cons", [VCon ("Vuna.Interp.VStr", [x_a]); VCon ("Cons", [VCon ("Vuna.Interp.VStr", [x_b]); VCon ("Nil", [])])]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.vbool", v_Vuna_dInterp_dvbool)) ((apply ((apply (VFun ("/=", bi_neq)) (x_a))) (x_b))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments for /="))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.neqBuiltin"))
and v_Vuna_dInterp_dandBuiltin = (fun a1 -> (match a1 with
    | x_args -> (match (x_args) with
    | VCon ("Cons", [x_a; VCon ("Cons", [x_b; VCon ("Nil", [])])]) -> (match (x_a) with
    | VCon ("Vuna.Interp.VCon", [VStr "True"; VCon ("Nil", [])]) -> (match (x_b) with
    | VCon ("Vuna.Interp.VCon", [VStr "True"; VCon ("Nil", [])]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.VCon", mk_Vuna_dInterp_dVCon)) (VStr "True"))) (VCon ("Nil", [])))))
    | VCon ("Vuna.Interp.VCon", [VStr "False"; VCon ("Nil", [])]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.VCon", mk_Vuna_dInterp_dVCon)) (VStr "False"))) (VCon ("Nil", [])))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected a Bool"))
    | _ -> fail "case pattern match failure")
    | VCon ("Vuna.Interp.VCon", [VStr "False"; VCon ("Nil", [])]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.VCon", mk_Vuna_dInterp_dVCon)) (VStr "False"))) (VCon ("Nil", [])))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected a Bool"))
    | _ -> fail "case pattern match failure")
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments for &&"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.andBuiltin"))
and v_Vuna_dInterp_dorBuiltin = (fun a1 -> (match a1 with
    | x_args -> (match (x_args) with
    | VCon ("Cons", [x_a; VCon ("Cons", [x_b; VCon ("Nil", [])])]) -> (match (x_a) with
    | VCon ("Vuna.Interp.VCon", [VStr "True"; VCon ("Nil", [])]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.VCon", mk_Vuna_dInterp_dVCon)) (VStr "True"))) (VCon ("Nil", [])))))
    | VCon ("Vuna.Interp.VCon", [VStr "False"; VCon ("Nil", [])]) -> (match (x_b) with
    | VCon ("Vuna.Interp.VCon", [VStr "True"; VCon ("Nil", [])]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.VCon", mk_Vuna_dInterp_dVCon)) (VStr "True"))) (VCon ("Nil", [])))))
    | VCon ("Vuna.Interp.VCon", [VStr "False"; VCon ("Nil", [])]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.VCon", mk_Vuna_dInterp_dVCon)) (VStr "False"))) (VCon ("Nil", [])))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected a Bool"))
    | _ -> fail "case pattern match failure")
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "expected a Bool"))
    | _ -> fail "case pattern match failure")
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments for ||"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.orBuiltin"))
and v_Vuna_dInterp_dcallBuiltin = (fun a1 -> VFun ("Vuna.Interp.callBuiltin", (fun a2 -> (match (a1, a2) with
    | (x_name, x_args) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "+"))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.int2", v_Vuna_dInterp_dint2)) (x_args))) (VFun ("", fun x_x -> VFun ("", fun x_y -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VInt", mk_Vuna_dInterp_dVInt)) ((apply ((apply (VFun ("+", bi_add)) (x_x))) (x_y)))))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "-"))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.int2", v_Vuna_dInterp_dint2)) (x_args))) (VFun ("", fun x_x -> VFun ("", fun x_y -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VInt", mk_Vuna_dInterp_dVInt)) ((apply ((apply (VFun ("-", bi_sub)) (x_x))) (x_y)))))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "*"))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.int2", v_Vuna_dInterp_dint2)) (x_args))) (VFun ("", fun x_x -> VFun ("", fun x_y -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VInt", mk_Vuna_dInterp_dVInt)) ((apply ((apply (VFun ("*", bi_mul)) (x_x))) (x_y)))))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "/"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.divideBuiltin", v_Vuna_dInterp_ddivideBuiltin)) (x_args)) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "=="))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.eqBuiltin", v_Vuna_dInterp_deqBuiltin)) (x_args)) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "/="))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.neqBuiltin", v_Vuna_dInterp_dneqBuiltin)) (x_args)) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "<"))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.int2", v_Vuna_dInterp_dint2)) (x_args))) (VFun ("", fun x_x -> VFun ("", fun x_y -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.vbool", v_Vuna_dInterp_dvbool)) ((apply ((apply (VFun ("<", bi_lt)) (x_x))) (x_y)))))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "<="))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.int2", v_Vuna_dInterp_dint2)) (x_args))) (VFun ("", fun x_x -> VFun ("", fun x_y -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.vbool", v_Vuna_dInterp_dvbool)) ((apply ((apply (VFun ("<=", bi_le)) (x_x))) (x_y)))))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr ">"))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.int2", v_Vuna_dInterp_dint2)) (x_args))) (VFun ("", fun x_x -> VFun ("", fun x_y -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.vbool", v_Vuna_dInterp_dvbool)) ((apply ((apply (VFun (">", bi_gt)) (x_x))) (x_y)))))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr ">="))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.int2", v_Vuna_dInterp_dint2)) (x_args))) (VFun ("", fun x_x -> VFun ("", fun x_y -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.vbool", v_Vuna_dInterp_dvbool)) ((apply ((apply (VFun (">=", bi_ge)) (x_x))) (x_y)))))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "&&"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.andBuiltin", v_Vuna_dInterp_dandBuiltin)) (x_args)) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "||"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.orBuiltin", v_Vuna_dInterp_dorBuiltin)) (x_args)) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "++"))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.str2", v_Vuna_dInterp_dstr2)) (x_args))) (VFun ("", fun x_x -> VFun ("", fun x_y -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VStr", mk_Vuna_dInterp_dVStr)) ((apply ((apply (VFun ("++", bi_concat)) (x_x))) (x_y)))))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "strLength"))) with VCon ("True", []) -> (match (x_args) with
    | VCon ("Cons", [x_a; VCon ("Nil", [])]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.stringArg", v_Vuna_dInterp_dstringArg)) (x_a))))) (VFun ("", fun x_s -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VInt", mk_Vuna_dInterp_dVInt)) ((apply (VFun ("strLength", bi_str_length)) (x_s)))))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments for strLength"))
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "strUnpack"))) with VCon ("True", []) -> (match (x_args) with
    | VCon ("Cons", [x_a; VCon ("Nil", [])]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.stringArg", v_Vuna_dInterp_dstringArg)) (x_a))))) (VFun ("", fun x_s -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.stringToValue", v_Vuna_dInterp_dstringToValue)) (x_s)))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments for strUnpack"))
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "strPack"))) with VCon ("True", []) -> (match (x_args) with
    | VCon ("Cons", [x_a; VCon ("Nil", [])]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.valueToChars", v_Vuna_dInterp_dvalueToChars)) (x_a))))) (VFun ("", fun x_cs -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VStr", mk_Vuna_dInterp_dVStr)) ((apply (VFun ("strPack", bi_str_pack)) (x_cs)))))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments for strPack"))
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "strFromInt"))) with VCon ("True", []) -> (match (x_args) with
    | VCon ("Cons", [x_a; VCon ("Nil", [])]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.intArg", v_Vuna_dInterp_dintArg)) (x_a))))) (VFun ("", fun x_n -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VStr", mk_Vuna_dInterp_dVStr)) ((apply (VFun ("strFromInt", bi_str_from_int)) (x_n)))))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments for strFromInt"))
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "readFile"))) with VCon ("True", []) -> (match (x_args) with
    | VCon ("Cons", [x_a; VCon ("Nil", [])]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.stringArg", v_Vuna_dInterp_dstringArg)) (x_a))))) (VFun ("", fun x_s -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VStr", mk_Vuna_dInterp_dVStr)) ((apply (VFun ("readFile", bi_read_file)) (x_s)))))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments for readFile"))
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "writeFile"))) with VCon ("True", []) -> (match (x_args) with
    | VCon ("Cons", [x_a; VCon ("Cons", [x_b; VCon ("Nil", [])])]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.stringArg", v_Vuna_dInterp_dstringArg)) (x_a))))) (VFun ("", fun x_path -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.stringArg", v_Vuna_dInterp_dstringArg)) (x_b))))) (VFun ("", fun x_s -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VInt", mk_Vuna_dInterp_dVInt)) ((apply ((apply (VFun ("writeFile", bi_write_file)) (x_path))) (x_s))))))))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments for writeFile"))
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "print"))) with VCon ("True", []) -> (match (x_args) with
    | VCon ("Cons", [x_a; VCon ("Nil", [])]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.stringArg", v_Vuna_dInterp_dstringArg)) (x_a))))) (VFun ("", fun x_s -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.VInt", mk_Vuna_dInterp_dVInt)) ((apply (VFun ("print", bi_print)) (x_s)))))))))
    | _ -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "bad arguments for print"))
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "getArgs"))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.map", v_Vuna_dInterp_dmap)) (VFun ("", fun x_s -> (apply (VFun ("Vuna.Interp.VStr", mk_Vuna_dInterp_dVStr)) (x_s)))))) (bi_get_args ())))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "unknown builtin: "))) (x_name)))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.callBuiltin"))))
and v_Vuna_dInterp_ddisplayName = (fun a1 -> (match a1 with
    | x_name -> (match ((apply (VFun ("Vuna.Interp.splitLastDot", v_Vuna_dInterp_dsplitLastDot)) ((apply (VFun ("Vuna.Interp.splitOnDot", v_Vuna_dInterp_dsplitOnDot)) (x_name))))) with
    | VCon ("Vuna.Interp.Pair", [x_revPrefix; x_base]) -> x_base
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.displayName"))
and v_Vuna_dInterp_dshowValue = (fun a1 -> (match a1 with
    | x_v -> (match (x_v) with
    | VCon ("Vuna.Interp.VInt", [x_n]) -> (apply (VFun ("strFromInt", bi_str_from_int)) (x_n))
    | VCon ("Vuna.Interp.VStr", [x_s]) -> (apply (VFun ("Vuna.Interp.showString", v_Vuna_dInterp_dshowString)) (x_s))
    | VCon ("Vuna.Interp.VCon", [x_name; VCon ("Nil", [])]) -> (apply (VFun ("Vuna.Interp.displayName", v_Vuna_dInterp_ddisplayName)) (x_name))
    | VCon ("Vuna.Interp.VCon", [x_name; x_args]) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.displayName", v_Vuna_dInterp_ddisplayName)) (x_name))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " "))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.showValues", v_Vuna_dInterp_dshowValues)) (x_args))))) (VStr ")"))))))))
    | VCon ("Vuna.Interp.VFun", [x_name; x_args]) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "<function "))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.displayName", v_Vuna_dInterp_ddisplayName)) (x_name))))) (VStr ">"))))
    | VCon ("Vuna.Interp.VLam", [x_params; x_body; x_env]) -> VStr "<lambda>"
    | VCon ("Vuna.Interp.VBuiltin", [x_name; x_args]) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "<builtin "))) ((apply ((apply (VFun ("++", bi_concat)) (x_name))) (VStr ">"))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.showValue"))
and v_Vuna_dInterp_dshowValues = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> VStr ""
    | VCon ("Cons", [x_v; VCon ("Nil", [])]) -> (apply (VFun ("Vuna.Interp.showValue", v_Vuna_dInterp_dshowValue)) (x_v))
    | VCon ("Cons", [x_v; x_rest]) -> (apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.showValue", v_Vuna_dInterp_dshowValue)) (x_v))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " "))) ((apply (VFun ("Vuna.Interp.showValues", v_Vuna_dInterp_dshowValues)) (x_rest))))))
    | _ -> fail "no matching clause for Vuna.Interp.showValues"))
and v_Vuna_dInterp_dshowString = (fun a1 -> (match a1 with
    | x_s -> (apply ((apply (VFun ("++", bi_concat)) (VStr "\""))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.showStringChars", v_Vuna_dInterp_dshowStringChars)) ((apply (VFun ("strUnpack", bi_str_unpack)) (x_s))))))) (VStr "\""))))
    | _ -> fail "no matching clause for Vuna.Interp.showString"))
and v_Vuna_dInterp_dshowStringChars = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> VStr ""
    | VCon ("Cons", [x_c; x_rest]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (34)))) with VCon ("True", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "\\\""))) ((apply (VFun ("Vuna.Interp.showStringChars", v_Vuna_dInterp_dshowStringChars)) (x_rest)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (92)))) with VCon ("True", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "\\\\"))) ((apply (VFun ("Vuna.Interp.showStringChars", v_Vuna_dInterp_dshowStringChars)) (x_rest)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (10)))) with VCon ("True", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "\\n"))) ((apply (VFun ("Vuna.Interp.showStringChars", v_Vuna_dInterp_dshowStringChars)) (x_rest)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (9)))) with VCon ("True", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "\\t"))) ((apply (VFun ("Vuna.Interp.showStringChars", v_Vuna_dInterp_dshowStringChars)) (x_rest)))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (13)))) with VCon ("True", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "\\r"))) ((apply (VFun ("Vuna.Interp.showStringChars", v_Vuna_dInterp_dshowStringChars)) (x_rest)))) | VCon ("False", []) -> (apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("strPack", bi_str_pack)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (VCon ("Nil", [])))))))) ((apply (VFun ("Vuna.Interp.showStringChars", v_Vuna_dInterp_dshowStringChars)) (x_rest)))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.showStringChars"))
and v_Vuna_dInterp_dmemName = (fun a1 -> VFun ("Vuna.Interp.memName", (fun a2 -> (match (a1, a2) with
    | (x_name, x_names) -> (match (x_names) with
    | VCon ("Nil", []) -> VCon ("False", [])
    | VCon ("Cons", [x_x; x_rest]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_x))) (x_name))) with VCon ("True", []) -> VCon ("True", []) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.memName", v_Vuna_dInterp_dmemName)) (x_name))) (x_rest)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.memName"))))
and v_Vuna_dInterp_dmemChar = (fun a1 -> VFun ("Vuna.Interp.memChar", (fun a2 -> (match (a1, a2) with
    | (x_c, x_chars) -> (match (x_chars) with
    | VCon ("Nil", []) -> VCon ("False", [])
    | VCon ("Cons", [x_x; x_rest]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_x))) (x_c))) with VCon ("True", []) -> VCon ("True", []) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.memChar", v_Vuna_dInterp_dmemChar)) (x_c))) (x_rest)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.memChar"))))
and v_Vuna_dInterp_dcontainsDot = (fun a1 -> (match a1 with
    | x_s -> (apply ((apply (VFun ("Vuna.Interp.memChar", v_Vuna_dInterp_dmemChar)) (VInt (46)))) ((apply (VFun ("strUnpack", bi_str_unpack)) (x_s))))
    | _ -> fail "no matching clause for Vuna.Interp.containsDot"))
and v_Vuna_dInterp_dsplitOnDot = (fun a1 -> (match a1 with
    | x_s -> (apply ((apply ((apply (VFun ("Vuna.Interp.splitCharsOnDot", v_Vuna_dInterp_dsplitCharsOnDot)) ((apply (VFun ("strUnpack", bi_str_unpack)) (x_s))))) (VCon ("Nil", [])))) (VCon ("Nil", [])))
    | _ -> fail "no matching clause for Vuna.Interp.splitOnDot"))
and v_Vuna_dInterp_dsplitCharsOnDot = (fun a1 -> VFun ("Vuna.Interp.splitCharsOnDot", (fun a2 -> VFun ("Vuna.Interp.splitCharsOnDot", (fun a3 -> (match (a1, a2, a3) with
    | (x_chars, x_acc, x_seg) -> (match (x_chars) with
    | VCon ("Nil", []) -> (apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply (VFun ("strPack", bi_str_pack)) ((apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) (x_seg))))))) (x_acc))))
    | VCon ("Cons", [x_c; x_rest]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (46)))) with VCon ("True", []) -> (apply ((apply ((apply (VFun ("Vuna.Interp.splitCharsOnDot", v_Vuna_dInterp_dsplitCharsOnDot)) (x_rest))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply (VFun ("strPack", bi_str_pack)) ((apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) (x_seg))))))) (x_acc))))) (VCon ("Nil", []))) | VCon ("False", []) -> (apply ((apply ((apply (VFun ("Vuna.Interp.splitCharsOnDot", v_Vuna_dInterp_dsplitCharsOnDot)) (x_rest))) (x_acc))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (x_seg)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.splitCharsOnDot"))))))
and v_Vuna_dInterp_dsplitLastDot = (fun a1 -> (match a1 with
    | x_parts -> (match ((apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) (x_parts))) with
    | VCon ("Nil", []) -> (apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (VStr ""))
    | VCon ("Cons", [x_last; x_rest]) -> (apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) (x_rest))))) (x_last))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.splitLastDot"))
and v_Vuna_dInterp_djoinDots = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> VStr ""
    | VCon ("Cons", [x_x; VCon ("Nil", [])]) -> x_x
    | VCon ("Cons", [x_x; x_rest]) -> (apply ((apply (VFun ("++", bi_concat)) (x_x))) ((apply ((apply (VFun ("++", bi_concat)) (VStr "."))) ((apply (VFun ("Vuna.Interp.joinDots", v_Vuna_dInterp_djoinDots)) (x_rest))))))
    | _ -> fail "no matching clause for Vuna.Interp.joinDots"))
and v_Vuna_dInterp_djoinSlashes = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> VStr ""
    | VCon ("Cons", [x_x; VCon ("Nil", [])]) -> x_x
    | VCon ("Cons", [x_x; x_rest]) -> (apply ((apply (VFun ("++", bi_concat)) (x_x))) ((apply ((apply (VFun ("++", bi_concat)) (VStr "/"))) ((apply (VFun ("Vuna.Interp.joinSlashes", v_Vuna_dInterp_djoinSlashes)) (x_rest))))))
    | _ -> fail "no matching clause for Vuna.Interp.joinSlashes"))
and v_Vuna_dInterp_djoinArrows = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> VStr ""
    | VCon ("Cons", [x_x; VCon ("Nil", [])]) -> x_x
    | VCon ("Cons", [x_x; x_rest]) -> (apply ((apply (VFun ("++", bi_concat)) (x_x))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " -> "))) ((apply (VFun ("Vuna.Interp.joinArrows", v_Vuna_dInterp_djoinArrows)) (x_rest))))))
    | _ -> fail "no matching clause for Vuna.Interp.joinArrows"))
and v_Vuna_dInterp_dfirstOf = (fun a1 -> (match a1 with
    | x_p -> (match (x_p) with
    | VCon ("Vuna.Interp.Pair", [x_a; x_b]) -> x_a
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.firstOf"))
and v_Vuna_dInterp_dsecondOf = (fun a1 -> (match a1 with
    | x_p -> (match (x_p) with
    | VCon ("Vuna.Interp.Pair", [x_a; x_b]) -> x_b
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.secondOf"))
and v_Vuna_dInterp_dconcatMap = (fun a1 -> VFun ("Vuna.Interp.concatMap", (fun a2 -> (match (a1, a2) with
    | (x_f, VCon ("Nil", [])) -> VCon ("Nil", [])
    | (x_f, VCon ("Cons", [x_x; x_rest])) -> (apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) ((apply (x_f) (x_x))))) ((apply ((apply (VFun ("Vuna.Interp.concatMap", v_Vuna_dInterp_dconcatMap)) (x_f))) (x_rest))))
    | _ -> fail "no matching clause for Vuna.Interp.concatMap"))))
and v_Vuna_dInterp_ddeclNames = (fun a1 -> (match a1 with
    | x_d -> (match (x_d) with
    | VCon ("Vuna.Interp.DFun", [x_name; x_pats; x_body]) -> (apply ((apply (VFun ("Cons", mk_Cons)) (x_name))) (VCon ("Nil", [])))
    | VCon ("Vuna.Interp.DSig", [x_name; x_ty]) -> (apply ((apply (VFun ("Cons", mk_Cons)) (x_name))) (VCon ("Nil", [])))
    | VCon ("Vuna.Interp.DData", [x_dname; x_params; x_ctors]) -> (apply ((apply (VFun ("Vuna.Interp.map", v_Vuna_dInterp_dmap)) (VFun ("Vuna.Interp.firstOf", v_Vuna_dInterp_dfirstOf)))) (x_ctors))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.declNames"))
and v_Vuna_dInterp_dtopNames = (fun a1 -> (match a1 with
    | x_decls -> (apply ((apply (VFun ("Vuna.Interp.concatMap", v_Vuna_dInterp_dconcatMap)) (VFun ("Vuna.Interp.declNames", v_Vuna_dInterp_ddeclNames)))) (x_decls))
    | _ -> fail "no matching clause for Vuna.Interp.topNames"))
and v_Vuna_dInterp_ddeclCtors = (fun a1 -> (match a1 with
    | x_d -> (match (x_d) with
    | VCon ("Vuna.Interp.DData", [x_dname; x_params; x_ctors]) -> (apply ((apply (VFun ("Vuna.Interp.map", v_Vuna_dInterp_dmap)) (VFun ("Vuna.Interp.firstOf", v_Vuna_dInterp_dfirstOf)))) (x_ctors))
    | _ -> VCon ("Nil", [])
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.declCtors"))
and v_Vuna_dInterp_dctorsOf = (fun a1 -> (match a1 with
    | x_decls -> (apply ((apply (VFun ("Vuna.Interp.concatMap", v_Vuna_dInterp_dconcatMap)) (VFun ("Vuna.Interp.declCtors", v_Vuna_dInterp_ddeclCtors)))) (x_decls))
    | _ -> fail "no matching clause for Vuna.Interp.ctorsOf"))
and v_Vuna_dInterp_dallIdentChars = (fun a1 -> (match a1 with
    | x_chars -> (match (x_chars) with
    | VCon ("Nil", []) -> VCon ("True", [])
    | VCon ("Cons", [x_c; x_rest]) -> (match ((apply ((apply (VFun ("||", bi_or)) ((apply (VFun ("Vuna.Interp.isIdentStart", v_Vuna_dInterp_disIdentStart)) (x_c))))) ((apply (VFun ("Vuna.Interp.isDigit", v_Vuna_dInterp_disDigit)) (x_c))))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.allIdentChars", v_Vuna_dInterp_dallIdentChars)) (x_rest)) | VCon ("False", []) -> VCon ("False", []) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.allIdentChars"))
and v_Vuna_dInterp_dvalidSegment = (fun a1 -> (match a1 with
    | x_seg -> (match ((apply (VFun ("strUnpack", bi_str_unpack)) (x_seg))) with
    | VCon ("Nil", []) -> VCon ("False", [])
    | VCon ("Cons", [x_c; x_rest]) -> (apply ((apply (VFun ("&&", bi_and)) ((apply (VFun ("Vuna.Interp.isUpperChar", v_Vuna_dInterp_disUpperChar)) (x_c))))) ((apply (VFun ("Vuna.Interp.allIdentChars", v_Vuna_dInterp_dallIdentChars)) (x_rest))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.validSegment"))
and v_Vuna_dInterp_dallSegmentsValid = (fun a1 -> (match a1 with
    | x_segs -> (match (x_segs) with
    | VCon ("Nil", []) -> VCon ("False", [])
    | VCon ("Cons", [x_seg; x_rest]) -> (match ((apply (VFun ("Vuna.Interp.validSegment", v_Vuna_dInterp_dvalidSegment)) (x_seg))) with VCon ("True", []) -> (match (x_rest) with
    | VCon ("Nil", []) -> VCon ("True", [])
    | _ -> (apply (VFun ("Vuna.Interp.allSegmentsValid", v_Vuna_dInterp_dallSegmentsValid)) (x_rest))
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> VCon ("False", []) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.allSegmentsValid"))
and v_Vuna_dInterp_dvalidModuleName = (fun a1 -> (match a1 with
    | x_name -> (match ((apply (VFun ("Vuna.Interp.splitOnDot", v_Vuna_dInterp_dsplitOnDot)) (x_name))) with
    | VCon ("Nil", []) -> VCon ("False", [])
    | x_segs -> (apply (VFun ("Vuna.Interp.allSegmentsValid", v_Vuna_dInterp_dallSegmentsValid)) (x_segs))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.validModuleName"))
and v_Vuna_dInterp_disGlobalCtor = (fun a1 -> (match a1 with
    | x_name -> (apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("||", bi_or)) ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "True"))))) ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "False"))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "Cons"))))))) ((apply ((apply (VFun ("==", bi_eq)) (x_name))) (VStr "Nil"))))
    | _ -> fail "no matching clause for Vuna.Interp.isGlobalCtor"))
and v_Vuna_dInterp_dmangle = (fun a1 -> VFun ("Vuna.Interp.mangle", (fun a2 -> (match (a1, a2) with
    | (x_prefix, x_name) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_prefix))) (VStr ""))) with VCon ("True", []) -> x_name | VCon ("False", []) -> (apply ((apply (VFun ("++", bi_concat)) (x_prefix))) ((apply ((apply (VFun ("++", bi_concat)) (VStr "."))) (x_name)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.mangle"))))
and v_Vuna_dInterp_dmodulePath = (fun a1 -> VFun ("Vuna.Interp.modulePath", (fun a2 -> (match (a1, a2) with
    | (x_root, x_name) -> (apply ((apply (VFun ("++", bi_concat)) (x_root))) ((apply ((apply (VFun ("++", bi_concat)) (VStr "/"))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.joinSlashes", v_Vuna_dInterp_djoinSlashes)) ((apply (VFun ("Vuna.Interp.splitOnDot", v_Vuna_dInterp_dsplitOnDot)) (x_name))))))) (VStr ".vuna"))))))
    | _ -> fail "no matching clause for Vuna.Interp.modulePath"))))
and v_Vuna_dInterp_dfindModule = (fun a1 -> VFun ("Vuna.Interp.findModule", (fun a2 -> (match (a1, a2) with
    | (x_modules, x_name) -> (match (x_modules) with
    | VCon ("Nil", []) -> VCon ("Vuna.Interp.Nothing", [])
    | VCon ("Cons", [x_m; x_rest]) -> (match (x_m) with
    | VCon ("Vuna.Interp.Module", [x_mname; x_imports; x_decls; x_exports]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_mname))) (x_name))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (x_m)) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.findModule", v_Vuna_dInterp_dfindModule)) (x_rest))) (x_name)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.findModule"))))
and v_Vuna_dInterp_dexportsOf = (fun a1 -> VFun ("Vuna.Interp.exportsOf", (fun a2 -> (match (a1, a2) with
    | (x_modules, x_name) -> (match ((apply ((apply (VFun ("Vuna.Interp.findModule", v_Vuna_dInterp_dfindModule)) (x_modules))) (x_name))) with
    | VCon ("Vuna.Interp.Just", [x_m]) -> (match (x_m) with
    | VCon ("Vuna.Interp.Module", [x_mname; x_imports; x_decls; x_exports]) -> x_exports
    | _ -> fail "case pattern match failure")
    | VCon ("Vuna.Interp.Nothing", []) -> VCon ("Nil", [])
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.exportsOf"))))
and v_Vuna_dInterp_disBuiltinName = (fun a1 -> (match a1 with
    | x_name -> (match ((apply (VFun ("Vuna.Interp.builtinArity", v_Vuna_dInterp_dbuiltinArity)) (x_name))) with
    | VCon ("Vuna.Interp.Just", [x_arity]) -> VCon ("True", [])
    | VCon ("Vuna.Interp.Nothing", []) -> VCon ("False", [])
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.isBuiltinName"))
and v_Vuna_dInterp_dresolveQualified = (fun a1 -> VFun ("Vuna.Interp.resolveQualified", (fun a2 -> VFun ("Vuna.Interp.resolveQualified", (fun a3 -> VFun ("Vuna.Interp.resolveQualified", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_modules, x_label, x_imports, x_name) -> (match ((apply (VFun ("Vuna.Interp.splitLastDot", v_Vuna_dInterp_dsplitLastDot)) ((apply (VFun ("Vuna.Interp.splitOnDot", v_Vuna_dInterp_dsplitOnDot)) (x_name))))) with
    | VCon ("Vuna.Interp.Pair", [x_revPrefix; x_base]) -> (let x_prefix = ((apply (VFun ("Vuna.Interp.joinDots", v_Vuna_dInterp_djoinDots)) (x_revPrefix))) in (match ((apply ((apply (VFun ("Vuna.Interp.memName", v_Vuna_dInterp_dmemName)) (x_prefix))) (x_imports))) with VCon ("True", []) -> (match ((apply (VFun ("Vuna.Interp.isGlobalCtor", v_Vuna_dInterp_disGlobalCtor)) (x_base))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_base)) | VCon ("False", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.memName", v_Vuna_dInterp_dmemName)) (x_base))) ((apply ((apply (VFun ("Vuna.Interp.exportsOf", v_Vuna_dInterp_dexportsOf)) (x_modules))) (x_prefix))))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_name)) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (x_label))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ": "))) ((apply ((apply (VFun ("++", bi_concat)) (x_base))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " is not exported by "))) (x_prefix)))))))))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (x_label))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ": module "))) ((apply ((apply (VFun ("++", bi_concat)) (x_prefix))) (VStr " is not imported")))))))) | _ -> fail "if condition is not a Bool"))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.resolveQualified"))))))))
and v_Vuna_dInterp_dresolveGlobal = (fun a1 -> VFun ("Vuna.Interp.resolveGlobal", (fun a2 -> VFun ("Vuna.Interp.resolveGlobal", (fun a3 -> VFun ("Vuna.Interp.resolveGlobal", (fun a4 -> VFun ("Vuna.Interp.resolveGlobal", (fun a5 -> VFun ("Vuna.Interp.resolveGlobal", (fun a6 -> VFun ("Vuna.Interp.resolveGlobal", (fun a7 -> (match (a1, a2, a3, a4, a5, a6, a7) with
    | (x_modules, x_label, x_prefix, x_own, x_imports, x_scope, x_name) -> (match ((apply ((apply (VFun ("Vuna.Interp.memName", v_Vuna_dInterp_dmemName)) (x_name))) (x_scope))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_name)) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.isGlobalCtor", v_Vuna_dInterp_disGlobalCtor)) (x_name))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_name)) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.containsDot", v_Vuna_dInterp_dcontainsDot)) (x_name))) with VCon ("True", []) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveQualified", v_Vuna_dInterp_dresolveQualified)) (x_modules))) (x_label))) (x_imports))) (x_name)) | VCon ("False", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.memName", v_Vuna_dInterp_dmemName)) (x_name))) (x_own))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.mangle", v_Vuna_dInterp_dmangle)) (x_prefix))) (x_name)))) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.isBuiltinName", v_Vuna_dInterp_disBuiltinName)) (x_name))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_name)) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (x_label))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ": unbound variable "))) (x_name)))))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.resolveGlobal"))))))))))))))
and v_Vuna_dInterp_dresolveCtor = (fun a1 -> VFun ("Vuna.Interp.resolveCtor", (fun a2 -> VFun ("Vuna.Interp.resolveCtor", (fun a3 -> VFun ("Vuna.Interp.resolveCtor", (fun a4 -> VFun ("Vuna.Interp.resolveCtor", (fun a5 -> VFun ("Vuna.Interp.resolveCtor", (fun a6 -> (match (a1, a2, a3, a4, a5, a6) with
    | (x_modules, x_label, x_prefix, x_ownCtors, x_imports, x_name) -> (match ((apply (VFun ("Vuna.Interp.isGlobalCtor", v_Vuna_dInterp_disGlobalCtor)) (x_name))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_name)) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.containsDot", v_Vuna_dInterp_dcontainsDot)) (x_name))) with VCon ("True", []) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveQualified", v_Vuna_dInterp_dresolveQualified)) (x_modules))) (x_label))) (x_imports))) (x_name)) | VCon ("False", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.memName", v_Vuna_dInterp_dmemName)) (x_name))) (x_ownCtors))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.mangle", v_Vuna_dInterp_dmangle)) (x_prefix))) (x_name)))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (x_label))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ": unknown constructor "))) (x_name)))))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.resolveCtor"))))))))))))
and v_Vuna_dInterp_dcheckBinder = (fun a1 -> VFun ("Vuna.Interp.checkBinder", (fun a2 -> (match (a1, a2) with
    | (x_label, x_name) -> (match ((apply (VFun ("Vuna.Interp.containsDot", v_Vuna_dInterp_dcontainsDot)) (x_name))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (x_label))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ": invalid variable name "))) (x_name)))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_name)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.checkBinder"))))
and v_Vuna_dInterp_dcheckTopName = (fun a1 -> VFun ("Vuna.Interp.checkTopName", (fun a2 -> (match (a1, a2) with
    | (x_label, x_name) -> (match ((apply (VFun ("Vuna.Interp.containsDot", v_Vuna_dInterp_dcontainsDot)) (x_name))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (x_label))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ": invalid top-level name "))) (x_name)))))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_name)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.checkTopName"))))
and v_Vuna_dInterp_dresolveTopName = (fun a1 -> VFun ("Vuna.Interp.resolveTopName", (fun a2 -> VFun ("Vuna.Interp.resolveTopName", (fun a3 -> (match (a1, a2, a3) with
    | (x_label, x_prefix, x_name) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.checkTopName", v_Vuna_dInterp_dcheckTopName)) (x_label))) (x_name))))) (VFun ("", fun x__u -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.mangle", v_Vuna_dInterp_dmangle)) (x_prefix))) (x_name)))))))
    | _ -> fail "no matching clause for Vuna.Interp.resolveTopName"))))))
and v_Vuna_dInterp_dresolvePattern = (fun a1 -> VFun ("Vuna.Interp.resolvePattern", (fun a2 -> VFun ("Vuna.Interp.resolvePattern", (fun a3 -> VFun ("Vuna.Interp.resolvePattern", (fun a4 -> VFun ("Vuna.Interp.resolvePattern", (fun a5 -> VFun ("Vuna.Interp.resolvePattern", (fun a6 -> (match (a1, a2, a3, a4, a5, a6) with
    | (x_modules, x_label, x_prefix, x_ownCtors, x_imports, x_pat) -> (match (x_pat) with
    | VCon ("Vuna.Interp.PWild", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Vuna.Interp.PWild", [])))) (VCon ("Nil", [])))))
    | VCon ("Vuna.Interp.PVar", [x_name]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.checkBinder", v_Vuna_dInterp_dcheckBinder)) (x_label))) (x_name))))) (VFun ("", fun x__u -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.PVar", mk_Vuna_dInterp_dPVar)) (x_name))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_name))) (VCon ("Nil", []))))))))))
    | VCon ("Vuna.Interp.PInt", [x_n]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.PInt", mk_Vuna_dInterp_dPInt)) (x_n))))) (VCon ("Nil", [])))))
    | VCon ("Vuna.Interp.PStr", [x_s]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply (VFun ("Vuna.Interp.PStr", mk_Vuna_dInterp_dPStr)) (x_s))))) (VCon ("Nil", [])))))
    | VCon ("Vuna.Interp.PCon", [x_name; x_pats]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveCtor", v_Vuna_dInterp_dresolveCtor)) (x_modules))) (x_label))) (x_prefix))) (x_ownCtors))) (x_imports))) (x_name))))) (VFun ("", fun x_name2 -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.traverse", v_Vuna_dInterp_dtraverse)) ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolvePattern", v_Vuna_dInterp_dresolvePattern)) (x_modules))) (x_label))) (x_prefix))) (x_ownCtors))) (x_imports))))) (x_pats))))) (VFun ("", fun x_parts -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Vuna.Interp.PCon", mk_Vuna_dInterp_dPCon)) (x_name2))) ((apply ((apply (VFun ("Vuna.Interp.map", v_Vuna_dInterp_dmap)) (VFun ("Vuna.Interp.firstOf", v_Vuna_dInterp_dfirstOf)))) (x_parts))))))) ((apply ((apply (VFun ("Vuna.Interp.concatMap", v_Vuna_dInterp_dconcatMap)) (VFun ("Vuna.Interp.secondOf", v_Vuna_dInterp_dsecondOf)))) (x_parts))))))))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.resolvePattern"))))))))))))
and v_Vuna_dInterp_dresolveAlt = (fun a1 -> VFun ("Vuna.Interp.resolveAlt", (fun a2 -> VFun ("Vuna.Interp.resolveAlt", (fun a3 -> VFun ("Vuna.Interp.resolveAlt", (fun a4 -> VFun ("Vuna.Interp.resolveAlt", (fun a5 -> VFun ("Vuna.Interp.resolveAlt", (fun a6 -> VFun ("Vuna.Interp.resolveAlt", (fun a7 -> VFun ("Vuna.Interp.resolveAlt", (fun a8 -> (match (a1, a2, a3, a4, a5, a6, a7, a8) with
    | (x_modules, x_label, x_prefix, x_own, x_ownCtors, x_imports, x_scope, x_alt) -> (match (x_alt) with
    | VCon ("Vuna.Interp.Pair", [x_pat; x_body]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolvePattern", v_Vuna_dInterp_dresolvePattern)) (x_modules))) (x_label))) (x_prefix))) (x_ownCtors))) (x_imports))) (x_pat))))) (VFun ("", fun x_p -> (match (x_p) with
    | VCon ("Vuna.Interp.Pair", [x_pat2; x_bound]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveExpr", v_Vuna_dInterp_dresolveExpr)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_bound))) (x_scope))))) (x_body))))) (VFun ("", fun x_body2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_pat2))) (x_body2)))))))
    | _ -> fail "case pattern match failure"))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.resolveAlt"))))))))))))))))
and v_Vuna_dInterp_dresolveLet = (fun a1 -> VFun ("Vuna.Interp.resolveLet", (fun a2 -> VFun ("Vuna.Interp.resolveLet", (fun a3 -> VFun ("Vuna.Interp.resolveLet", (fun a4 -> VFun ("Vuna.Interp.resolveLet", (fun a5 -> VFun ("Vuna.Interp.resolveLet", (fun a6 -> VFun ("Vuna.Interp.resolveLet", (fun a7 -> VFun ("Vuna.Interp.resolveLet", (fun a8 -> VFun ("Vuna.Interp.resolveLet", (fun a9 -> (match (a1, a2, a3, a4, a5, a6, a7, a8, a9) with
    | (x_modules, x_label, x_prefix, x_own, x_ownCtors, x_imports, x_scope, x_binds, x_body) -> (match (x_binds) with
    | VCon ("Nil", []) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveExpr", v_Vuna_dInterp_dresolveExpr)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) (x_scope))) (x_body))))) (VFun ("", fun x_b -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VCon ("Nil", [])))) (x_b)))))))
    | VCon ("Cons", [x_b; x_rest]) -> (match (x_b) with
    | VCon ("Vuna.Interp.Pair", [x_pat; x_value]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveExpr", v_Vuna_dInterp_dresolveExpr)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) (x_scope))) (x_value))))) (VFun ("", fun x_value2 -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolvePattern", v_Vuna_dInterp_dresolvePattern)) (x_modules))) (x_label))) (x_prefix))) (x_ownCtors))) (x_imports))) (x_pat))))) (VFun ("", fun x_p -> (match (x_p) with
    | VCon ("Vuna.Interp.Pair", [x_pat2; x_bound]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveLet", v_Vuna_dInterp_dresolveLet)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_bound))) (x_scope))))) (x_rest))) (x_body))))) (VFun ("", fun x_r -> (match (x_r) with
    | VCon ("Vuna.Interp.Pair", [x_binds2; x_body2]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_pat2))) (x_value2))))) (x_binds2))))) (x_body2))))
    | _ -> fail "case pattern match failure"))))
    | _ -> fail "case pattern match failure")))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.resolveLet"))))))))))))))))))
and v_Vuna_dInterp_dresolveExpr = (fun a1 -> VFun ("Vuna.Interp.resolveExpr", (fun a2 -> VFun ("Vuna.Interp.resolveExpr", (fun a3 -> VFun ("Vuna.Interp.resolveExpr", (fun a4 -> VFun ("Vuna.Interp.resolveExpr", (fun a5 -> VFun ("Vuna.Interp.resolveExpr", (fun a6 -> VFun ("Vuna.Interp.resolveExpr", (fun a7 -> VFun ("Vuna.Interp.resolveExpr", (fun a8 -> (match (a1, a2, a3, a4, a5, a6, a7, a8) with
    | (x_modules, x_label, x_prefix, x_own, x_ownCtors, x_imports, x_scope, x_expr) -> (match (x_expr) with
    | VCon ("Vuna.Interp.EVar", [x_name]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveGlobal", v_Vuna_dInterp_dresolveGlobal)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_imports))) (x_scope))) (x_name))))) (VFun ("", fun x_n -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.EVar", mk_Vuna_dInterp_dEVar)) (x_n)))))))
    | VCon ("Vuna.Interp.EInt", [x_n]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.EInt", mk_Vuna_dInterp_dEInt)) (x_n))))
    | VCon ("Vuna.Interp.EStr", [x_s]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply (VFun ("Vuna.Interp.EStr", mk_Vuna_dInterp_dEStr)) (x_s))))
    | VCon ("Vuna.Interp.ELam", [x_params; x_body]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.traverse", v_Vuna_dInterp_dtraverse)) ((apply (VFun ("Vuna.Interp.checkBinder", v_Vuna_dInterp_dcheckBinder)) (x_label))))) (x_params))))) (VFun ("", fun x__u -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveExpr", v_Vuna_dInterp_dresolveExpr)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_params))) (x_scope))))) (x_body))))) (VFun ("", fun x_b -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.ELam", mk_Vuna_dInterp_dELam)) (x_params))) (x_b))))))))))
    | VCon ("Vuna.Interp.EApp", [x_fn; x_args]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveExpr", v_Vuna_dInterp_dresolveExpr)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) (x_scope))) (x_fn))))) (VFun ("", fun x_fn2 -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.traverse", v_Vuna_dInterp_dtraverse)) (VFun ("", fun x_a -> (apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveExpr", v_Vuna_dInterp_dresolveExpr)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) (x_scope))) (x_a)))))) (x_args))))) (VFun ("", fun x_args2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.EApp", mk_Vuna_dInterp_dEApp)) (x_fn2))) (x_args2))))))))))
    | VCon ("Vuna.Interp.ELet", [x_binds; x_body]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveLet", v_Vuna_dInterp_dresolveLet)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) (x_scope))) (x_binds))) (x_body))))) (VFun ("", fun x_r -> (match (x_r) with
    | VCon ("Vuna.Interp.Pair", [x_binds2; x_body2]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.ELet", mk_Vuna_dInterp_dELet)) (x_binds2))) (x_body2))))
    | _ -> fail "case pattern match failure"))))
    | VCon ("Vuna.Interp.ECase", [x_scrut; x_alts]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveExpr", v_Vuna_dInterp_dresolveExpr)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) (x_scope))) (x_scrut))))) (VFun ("", fun x_scrut2 -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.traverse", v_Vuna_dInterp_dtraverse)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveAlt", v_Vuna_dInterp_dresolveAlt)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) (x_scope))))) (x_alts))))) (VFun ("", fun x_alts2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.ECase", mk_Vuna_dInterp_dECase)) (x_scrut2))) (x_alts2))))))))))
    | VCon ("Vuna.Interp.EIf", [x_c; x_t; x_e]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveExpr", v_Vuna_dInterp_dresolveExpr)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) (x_scope))) (x_c))))) (VFun ("", fun x_c2 -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveExpr", v_Vuna_dInterp_dresolveExpr)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) (x_scope))) (x_t))))) (VFun ("", fun x_t2 -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveExpr", v_Vuna_dInterp_dresolveExpr)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) (x_scope))) (x_e))))) (VFun ("", fun x_e2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply ((apply (VFun ("Vuna.Interp.EIf", mk_Vuna_dInterp_dEIf)) (x_c2))) (x_t2))) (x_e2)))))))))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.resolveExpr"))))))))))))))))
and v_Vuna_dInterp_dresolveCtorDecl = (fun a1 -> VFun ("Vuna.Interp.resolveCtorDecl", (fun a2 -> VFun ("Vuna.Interp.resolveCtorDecl", (fun a3 -> (match (a1, a2, a3) with
    | (x_label, x_prefix, x_ctor) -> (match ((apply (VFun ("Vuna.Interp.isGlobalCtor", v_Vuna_dInterp_disGlobalCtor)) (x_ctor))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_ctor)) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.checkTopName", v_Vuna_dInterp_dcheckTopName)) (x_label))) (x_ctor))))) (VFun ("", fun x__u -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.mangle", v_Vuna_dInterp_dmangle)) (x_prefix))) (x_ctor))))))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.resolveCtorDecl"))))))
and v_Vuna_dInterp_dresolveCtorPair = (fun a1 -> VFun ("Vuna.Interp.resolveCtorPair", (fun a2 -> VFun ("Vuna.Interp.resolveCtorPair", (fun a3 -> (match (a1, a2, a3) with
    | (x_label, x_prefix, x_p) -> (match (x_p) with
    | VCon ("Vuna.Interp.Pair", [x_ctor; x_arity]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveCtorDecl", v_Vuna_dInterp_dresolveCtorDecl)) (x_label))) (x_prefix))) (x_ctor))))) (VFun ("", fun x_c -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_c))) (x_arity)))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.resolveCtorPair"))))))
and v_Vuna_dInterp_dresolveDecl = (fun a1 -> VFun ("Vuna.Interp.resolveDecl", (fun a2 -> VFun ("Vuna.Interp.resolveDecl", (fun a3 -> VFun ("Vuna.Interp.resolveDecl", (fun a4 -> VFun ("Vuna.Interp.resolveDecl", (fun a5 -> VFun ("Vuna.Interp.resolveDecl", (fun a6 -> VFun ("Vuna.Interp.resolveDecl", (fun a7 -> (match (a1, a2, a3, a4, a5, a6, a7) with
    | (x_modules, x_label, x_prefix, x_own, x_ownCtors, x_imports, x_d) -> (match (x_d) with
    | VCon ("Vuna.Interp.DData", [x_dname; x_params; x_ctors]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.traverse", v_Vuna_dInterp_dtraverse)) ((apply ((apply (VFun ("Vuna.Interp.resolveCtorPair", v_Vuna_dInterp_dresolveCtorPair)) (x_label))) (x_prefix))))) (x_ctors))))) (VFun ("", fun x_ctors2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply ((apply (VFun ("Vuna.Interp.DData", mk_Vuna_dInterp_dDData)) (x_dname))) (x_params))) (x_ctors2)))))))
    | VCon ("Vuna.Interp.DSig", [x_name; x_ty]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveTopName", v_Vuna_dInterp_dresolveTopName)) (x_label))) (x_prefix))) (x_name))))) (VFun ("", fun x_n -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.DSig", mk_Vuna_dInterp_dDSig)) (x_n))) (x_ty)))))))
    | VCon ("Vuna.Interp.DFun", [x_name; x_pats; x_body]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveTopName", v_Vuna_dInterp_dresolveTopName)) (x_label))) (x_prefix))) (x_name))))) (VFun ("", fun x_n -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.traverse", v_Vuna_dInterp_dtraverse)) ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolvePattern", v_Vuna_dInterp_dresolvePattern)) (x_modules))) (x_label))) (x_prefix))) (x_ownCtors))) (x_imports))))) (x_pats))))) (VFun ("", fun x_parts -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveExpr", v_Vuna_dInterp_dresolveExpr)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))) ((apply ((apply (VFun ("Vuna.Interp.concatMap", v_Vuna_dInterp_dconcatMap)) (VFun ("Vuna.Interp.secondOf", v_Vuna_dInterp_dsecondOf)))) (x_parts))))) (x_body))))) (VFun ("", fun x_b -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply ((apply (VFun ("Vuna.Interp.DFun", mk_Vuna_dInterp_dDFun)) (x_n))) ((apply ((apply (VFun ("Vuna.Interp.map", v_Vuna_dInterp_dmap)) (VFun ("Vuna.Interp.firstOf", v_Vuna_dInterp_dfirstOf)))) (x_parts))))) (x_b)))))))))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.resolveDecl"))))))))))))))
and v_Vuna_dInterp_dresolveProgram = (fun a1 -> VFun ("Vuna.Interp.resolveProgram", (fun a2 -> VFun ("Vuna.Interp.resolveProgram", (fun a3 -> VFun ("Vuna.Interp.resolveProgram", (fun a4 -> VFun ("Vuna.Interp.resolveProgram", (fun a5 -> VFun ("Vuna.Interp.resolveProgram", (fun a6 -> VFun ("Vuna.Interp.resolveProgram", (fun a7 -> (match (a1, a2, a3, a4, a5, a6, a7) with
    | (x_modules, x_label, x_prefix, x_own, x_ownCtors, x_imports, x_decls) -> (apply ((apply (VFun ("Vuna.Interp.traverse", v_Vuna_dInterp_dtraverse)) ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveDecl", v_Vuna_dInterp_dresolveDecl)) (x_modules))) (x_label))) (x_prefix))) (x_own))) (x_ownCtors))) (x_imports))))) (x_decls))
    | _ -> fail "no matching clause for Vuna.Interp.resolveProgram"))))))))))))))
and v_Vuna_dInterp_dresolveEntry = (fun a1 -> VFun ("Vuna.Interp.resolveEntry", (fun a2 -> VFun ("Vuna.Interp.resolveEntry", (fun a3 -> (match (a1, a2, a3) with
    | (x_modules, x_imports, x_decls) -> (apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveProgram", v_Vuna_dInterp_dresolveProgram)) (x_modules))) (VStr "<entry>"))) (VStr ""))) ((apply (VFun ("Vuna.Interp.topNames", v_Vuna_dInterp_dtopNames)) (x_decls))))) ((apply (VFun ("Vuna.Interp.ctorsOf", v_Vuna_dInterp_dctorsOf)) (x_decls))))) (x_imports))) (x_decls))
    | _ -> fail "no matching clause for Vuna.Interp.resolveEntry"))))))
and v_Vuna_dInterp_dresolveModules = (fun a1 -> (match a1 with
    | x_modules -> (match (x_modules) with
    | VCon ("Nil", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (VCon ("Nil", [])))
    | VCon ("Cons", [x_m; x_rest]) -> (match (x_m) with
    | VCon ("Vuna.Interp.Module", [x_name; x_imports; x_decls; x_exports]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveProgram", v_Vuna_dInterp_dresolveProgram)) (x_modules))) (x_name))) (x_name))) (x_exports))) ((apply (VFun ("Vuna.Interp.ctorsOf", v_Vuna_dInterp_dctorsOf)) (x_decls))))) (x_imports))) (x_decls))))) (VFun ("", fun x_d1 -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.resolveModules", v_Vuna_dInterp_dresolveModules)) (x_rest))))) (VFun ("", fun x_d2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_d1))) (x_d2))))))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.resolveModules"))
and v_Vuna_dInterp_dshowCycle = (fun a1 -> VFun ("Vuna.Interp.showCycle", (fun a2 -> (match (a1, a2) with
    | (x_name, x_stack) -> (apply (VFun ("Vuna.Interp.joinArrows", v_Vuna_dInterp_djoinArrows)) ((apply (VFun ("Vuna.Interp.reverse", v_Vuna_dInterp_dreverse)) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_name))) (x_stack))))))
    | _ -> fail "no matching clause for Vuna.Interp.showCycle"))))
and v_Vuna_dInterp_dloadAll = (fun a1 -> VFun ("Vuna.Interp.loadAll", (fun a2 -> VFun ("Vuna.Interp.loadAll", (fun a3 -> VFun ("Vuna.Interp.loadAll", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_root, x_modules, x_stack, x_imports) -> (match (x_imports) with
    | VCon ("Nil", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_modules))
    | VCon ("Cons", [x_name; x_rest]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.loadModule", v_Vuna_dInterp_dloadModule)) (x_root))) (x_modules))) (x_stack))) (x_name))))) (VFun ("", fun x_modules2 -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.loadAll", v_Vuna_dInterp_dloadAll)) (x_root))) (x_modules2))) (x_stack))) (x_rest)))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.loadAll"))))))))
and v_Vuna_dInterp_dloadModule = (fun a1 -> VFun ("Vuna.Interp.loadModule", (fun a2 -> VFun ("Vuna.Interp.loadModule", (fun a3 -> VFun ("Vuna.Interp.loadModule", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_root, x_modules, x_stack, x_name) -> (match ((apply ((apply (VFun ("Vuna.Interp.findModule", v_Vuna_dInterp_dfindModule)) (x_modules))) (x_name))) with
    | VCon ("Vuna.Interp.Just", [x_m]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_modules))
    | VCon ("Vuna.Interp.Nothing", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.memName", v_Vuna_dInterp_dmemName)) (x_name))) (x_stack))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "import cycle: "))) ((apply ((apply (VFun ("Vuna.Interp.showCycle", v_Vuna_dInterp_dshowCycle)) (x_name))) (x_stack)))))) | VCon ("False", []) -> (match ((apply (VFun ("Vuna.Interp.validModuleName", v_Vuna_dInterp_dvalidModuleName)) (x_name))) with VCon ("True", []) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.parseSource", v_Vuna_dInterp_dparseSource)) ((apply (VFun ("readFile", bi_read_file)) ((apply ((apply (VFun ("Vuna.Interp.modulePath", v_Vuna_dInterp_dmodulePath)) (x_root))) (x_name))))))))) (VFun ("", fun x_p -> (match (x_p) with
    | VCon ("Vuna.Interp.Pair", [x_imports; x_decls]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.loadAll", v_Vuna_dInterp_dloadAll)) (x_root))) (x_modules))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_name))) (x_stack))))) (x_imports))))) (VFun ("", fun x_modules2 -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.Module", mk_Vuna_dInterp_dModule)) (x_name))) (x_imports))) (x_decls))) ((apply (VFun ("Vuna.Interp.topNames", v_Vuna_dInterp_dtopNames)) (x_decls))))))) (x_modules2)))))))
    | _ -> fail "case pattern match failure")))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "invalid module name: "))) (x_name)))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.loadModule"))))))))
and v_Vuna_dInterp_dloadProgram = (fun a1 -> VFun ("Vuna.Interp.loadProgram", (fun a2 -> (match (a1, a2) with
    | (x_root, x_entry) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.parseSource", v_Vuna_dInterp_dparseSource)) ((apply (VFun ("readFile", bi_read_file)) (x_entry))))))) (VFun ("", fun x_p -> (match (x_p) with
    | VCon ("Vuna.Interp.Pair", [x_imports; x_decls]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.loadAll", v_Vuna_dInterp_dloadAll)) (x_root))) (VCon ("Nil", [])))) (VCon ("Nil", [])))) (x_imports))))) (VFun ("", fun x_modules -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.resolveEntry", v_Vuna_dInterp_dresolveEntry)) (x_modules))) (x_imports))) (x_decls))))) (VFun ("", fun x_entryDecls -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.resolveModules", v_Vuna_dInterp_dresolveModules)) (x_modules))))) (VFun ("", fun x_moduleDecls -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_entryDecls))) (x_moduleDecls)))))))))))))
    | _ -> fail "case pattern match failure"))))
    | _ -> fail "no matching clause for Vuna.Interp.loadProgram"))))
and v_Vuna_dInterp_drunDecls = (fun a1 -> (match a1 with
    | x_decls -> (match ((apply (VFun ("Vuna.Interp.interpretMain", v_Vuna_dInterp_dinterpretMain)) (x_decls))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "error: "))) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_v]) -> (apply (VFun ("Vuna.Interp.showValue", v_Vuna_dInterp_dshowValue)) (x_v))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.runDecls"))
and v_Vuna_dInterp_dinterpret = (fun a1 -> (match a1 with
    | x_source -> (match ((apply (VFun ("Vuna.Interp.parseSource", v_Vuna_dInterp_dparseSource)) (x_source))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "error: "))) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_p]) -> (match (x_p) with
    | VCon ("Vuna.Interp.Pair", [x_imports; x_decls]) -> (match (x_imports) with
    | VCon ("Nil", []) -> (apply (VFun ("Vuna.Interp.runDecls", v_Vuna_dInterp_drunDecls)) (x_decls))
    | _ -> VStr "error: imports are only supported by interpretFile"
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.interpret"))
and v_Vuna_dInterp_dinterpretFile = (fun a1 -> VFun ("Vuna.Interp.interpretFile", (fun a2 -> (match (a1, a2) with
    | (x_root, x_entry) -> (match ((apply ((apply (VFun ("Vuna.Interp.loadProgram", v_Vuna_dInterp_dloadProgram)) (x_root))) (x_entry))) with
    | VCon ("Vuna.Interp.Err", [x_e]) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "error: "))) (x_e))
    | VCon ("Vuna.Interp.Ok", [x_decls]) -> (apply (VFun ("Vuna.Interp.runDecls", v_Vuna_dInterp_drunDecls)) (x_decls))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.interpretFile"))))
and v_Vuna_dInterp_dinterpretMain = (fun a1 -> (match a1 with
    | x_decls -> (match ((apply ((apply (VFun ("Vuna.Interp.funArity", v_Vuna_dInterp_dfunArity)) (VStr "main"))) (x_decls))) with
    | VCon ("Vuna.Interp.Nothing", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "no `main` definition"))
    | VCon ("Vuna.Interp.Just", [x_arity]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_arity))) (VInt (0)))) with VCon ("True", []) -> (apply ((apply ((apply (VFun ("Vuna.Interp.callFunction", v_Vuna_dInterp_dcallFunction)) (x_decls))) (VStr "main"))) (VCon ("Nil", []))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "`main` must be a nullary definition")) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.interpretMain"))
and v_Vuna_dInterp_druntimeCode = (fun () -> VStr "\ntype value =\n  | VInt of int\n  | VStr of string\n  | VCon of string * value list\n  | VFun of string * (value -> value)\n\nlet fail (msg : string) : 'a = failwith msg\n\nlet apply (fn : value) (arg : value) : value =\n  match fn with\n  | VFun (_, f) -> f arg\n  | _ -> fail \"cannot apply a non-function\"\n\nlet expect_int (name : string) (v : value) : int =\n  match v with VInt n -> n | _ -> fail (name ^ \": expected an Int argument\")\n\nlet expect_str (name : string) (v : value) : string =\n  match v with VStr s -> s | _ -> fail (name ^ \": expected a String argument\")\n\nlet vbool (b : bool) : value = VCon ((if b then \"True\" else \"False\"), [])\n\nlet expect_bool (name : string) (v : value) : bool =\n  match v with\n  | VCon (\"True\", []) -> true\n  | VCon (\"False\", []) -> false\n  | _ -> fail (name ^ \": expected a Bool argument\")\n\nlet rec string_to_value (s : string) : value =\n  let n = String.length s in\n  let rec go i acc =\n    if i < 0 then acc\n    else go (i - 1) (VCon (\"Cons\", [ VInt (Char.code s.[i]); acc ]))\n  in\n  go (n - 1) (VCon (\"Nil\", []))\n\nlet value_to_string (v : value) : string =\n  let buf = Buffer.create 16 in\n  let rec go (v : value) =\n    match v with\n    | VCon (\"Nil\", []) -> ()\n    | VCon (\"Cons\", [ VInt c; rest ]) ->\n        if c < 0 || c > 255 then fail \"strPack: character code out of range\";\n        Buffer.add_char buf (Char.chr c);\n        go rest\n    | _ -> fail \"strPack expects a List Int\"\n  in\n  go v;\n  Buffer.contents buf\n\nlet list_of_strings (strings : string list) : value =\n  List.fold_right\n    (fun s acc -> VCon (\"Cons\", [ VStr s; acc ]))\n    strings (VCon (\"Nil\", []))\n\nlet read_file (path : string) : string =\n  try\n    let channel = open_in_bin path in\n    Fun.protect\n      ~finally:(fun () -> close_in_noerr channel)\n      (fun () -> really_input_string channel (in_channel_length channel))\n  with Sys_error message -> fail (\"readFile: \" ^ message)\n\nlet write_file (path : string) (contents : string) : int =\n  try\n    let channel = open_out_bin path in\n    Fun.protect\n      ~finally:(fun () -> close_out_noerr channel)\n      (fun () -> output_string channel contents);\n    String.length contents\n  with Sys_error message -> fail (\"writeFile: \" ^ message)\n\nlet print_stdout (text : string) : int =\n  print_string text;\n  flush stdout;\n  String.length text\n\nlet get_args () : value =\n  let argv = Sys.argv in\n  let count = Array.length argv in\n  let args =\n    if count <= 1 then [] else Array.to_list (Array.sub argv 1 (count - 1))\n  in\n  list_of_strings args\n\nlet bi_add =\n  fun a -> VFun (\"+\", fun b -> VInt (expect_int \"+\" a + expect_int \"+\" b))\n\nlet bi_sub =\n  fun a -> VFun (\"-\", fun b -> VInt (expect_int \"-\" a - expect_int \"-\" b))\n\nlet bi_mul =\n  fun a -> VFun (\"*\", fun b -> VInt (expect_int \"*\" a * expect_int \"*\" b))\n\nlet bi_div =\n  fun a ->\n    VFun\n      ( \"/\",\n        fun b ->\n          let x = expect_int \"/\" a in\n          let y = expect_int \"/\" b in\n          if y = 0 then fail \"division by zero\" else VInt (x / y) )\n\nlet bi_eq =\n  fun a ->\n    VFun\n      ( \"==\",\n        fun b ->\n          match (a, b) with\n          | VInt x, VInt y -> vbool (x = y)\n          | VStr x, VStr y -> vbool (x = y)\n          | _ -> fail \"bad arguments for ==\" )\n\nlet bi_neq =\n  fun a ->\n    VFun\n      ( \"/=\",\n        fun b ->\n          match (a, b) with\n          | VInt x, VInt y -> vbool (x <> y)\n          | VStr x, VStr y -> vbool (x <> y)\n          | _ -> fail \"bad arguments for /=\" )\n\nlet bi_lt =\n  fun a -> VFun (\"<\", fun b -> vbool (expect_int \"<\" a < expect_int \"<\" b))\n\nlet bi_le =\n  fun a -> VFun (\"<=\", fun b -> vbool (expect_int \"<=\" a <= expect_int \"<=\" b))\n\nlet bi_gt =\n  fun a -> VFun (\">\", fun b -> vbool (expect_int \">\" a > expect_int \">\" b))\n\nlet bi_ge =\n  fun a -> VFun (\">=\", fun b -> vbool (expect_int \">=\" a >= expect_int \">=\" b))\n\nlet bi_and =\n  fun a ->\n    VFun\n      (\"&&\", fun b -> vbool (expect_bool \"&&\" a && expect_bool \"&&\" b))\n\nlet bi_or =\n  fun a ->\n    VFun (\"||\", fun b -> vbool (expect_bool \"||\" a || expect_bool \"||\" b))\n\nlet bi_concat =\n  fun a -> VFun (\"++\", fun b -> VStr (expect_str \"++\" a ^ expect_str \"++\" b))\n\nlet bi_str_length = fun a -> VInt (String.length (expect_str \"strLength\" a))\n\nlet bi_str_unpack =\n  fun a -> string_to_value (expect_str \"strUnpack\" a)\n\nlet bi_str_pack = fun a -> VStr (value_to_string a)\n\nlet bi_str_from_int =\n  fun a -> VStr (string_of_int (expect_int \"strFromInt\" a))\n\nlet display_name (name : string) : string =\n  match String.rindex_opt name '.' with\n  | Some index -> String.sub name (index + 1) (String.length name - index - 1)\n  | None -> name\n\nlet rec show_value (v : value) : string =\n  match v with\n  | VInt n -> string_of_int n\n  | VStr s -> \"\\\"\" ^ show_chars s 0 (String.length s) ^ \"\\\"\"\n  | VCon (name, []) -> display_name name\n  | VCon (name, args) ->\n      \"(\" ^ display_name name ^ \" \"\n      ^ String.concat \" \" (List.map show_value args)\n      ^ \")\"\n  | VFun (\"\", _) -> \"<lambda>\"\n  | VFun (name, _) -> \"<function \" ^ display_name name ^ \">\"\n\nand show_chars (s : string) (i : int) (n : int) : string =\n  if i >= n then \"\"\n  else\n    let rest = show_chars s (i + 1) n in\n    match s.[i] with\n    | '\"' -> \"\\\\\\\"\" ^ rest\n    | '\\\\' -> \"\\\\\\\\\" ^ rest\n    | '\\n' -> \"\\\\n\" ^ rest\n    | '\\t' -> \"\\\\t\" ^ rest\n    | '\\r' -> \"\\\\r\" ^ rest\n    | '\\b' -> \"\\\\b\" ^ rest\n    | c ->\n        let code = Char.code c in\n        if code >= 32 && code <= 126 then String.make 1 c ^ rest\n        else Printf.sprintf \"\\\\%03d\" code ^ rest\n")
and v_Vuna_dInterp_dbuiltinInfos = (fun () -> (apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "+"))) (VStr "bi_add"))) (VInt (2)))) (VStr "VInt (expect_int \"+\" a + expect_int \"+\" b)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "-"))) (VStr "bi_sub"))) (VInt (2)))) (VStr "VInt (expect_int \"-\" a - expect_int \"-\" b)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "*"))) (VStr "bi_mul"))) (VInt (2)))) (VStr "VInt (expect_int \"*\" a * expect_int \"*\" b)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "/"))) (VStr "bi_div"))) (VInt (2)))) (VStr "let x = expect_int \"/\" a in let y = expect_int \"/\" b in if y = 0 then fail \"division by zero\" else VInt (x / y)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "=="))) (VStr "bi_eq"))) (VInt (2)))) (VStr "match (a, b) with VInt x, VInt y -> vbool (x = y) | VStr x, VStr y -> vbool (x = y) | _ -> fail \"bad arguments for ==\""))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "/="))) (VStr "bi_neq"))) (VInt (2)))) (VStr "match (a, b) with VInt x, VInt y -> vbool (x <> y) | VStr x, VStr y -> vbool (x <> y) | _ -> fail \"bad arguments for /=\""))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "<"))) (VStr "bi_lt"))) (VInt (2)))) (VStr "vbool (expect_int \"<\" a < expect_int \"<\" b)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "<="))) (VStr "bi_le"))) (VInt (2)))) (VStr "vbool (expect_int \"<=\" a <= expect_int \"<=\" b)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr ">"))) (VStr "bi_gt"))) (VInt (2)))) (VStr "vbool (expect_int \">\" a > expect_int \">\" b)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr ">="))) (VStr "bi_ge"))) (VInt (2)))) (VStr "vbool (expect_int \">=\" a >= expect_int \">=\" b)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "&&"))) (VStr "bi_and"))) (VInt (2)))) (VStr "vbool (expect_bool \"&&\" a && expect_bool \"&&\" b)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "||"))) (VStr "bi_or"))) (VInt (2)))) (VStr "vbool (expect_bool \"||\" a || expect_bool \"||\" b)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "++"))) (VStr "bi_concat"))) (VInt (2)))) (VStr "VStr (expect_str \"++\" a ^ expect_str \"++\" b)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "strLength"))) (VStr "bi_str_length"))) (VInt (1)))) (VStr "VInt (String.length (expect_str \"strLength\" a))"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "strUnpack"))) (VStr "bi_str_unpack"))) (VInt (1)))) (VStr "string_to_value (expect_str \"strUnpack\" a)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "strPack"))) (VStr "bi_str_pack"))) (VInt (1)))) (VStr "VStr (value_to_string a)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "strFromInt"))) (VStr "bi_str_from_int"))) (VInt (1)))) (VStr "VStr (string_of_int (expect_int \"strFromInt\" a))"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "readFile"))) (VStr "bi_read_file"))) (VInt (1)))) (VStr "VStr (read_file (expect_str \"readFile\" a))"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "writeFile"))) (VStr "bi_write_file"))) (VInt (2)))) (VStr "VInt (write_file (expect_str \"writeFile\" a) (expect_str \"writeFile\" b))"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "print"))) (VStr "bi_print"))) (VInt (1)))) (VStr "let text = expect_str \"print\" a in VInt (print_stdout text)"))))) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.BuiltinInfo", mk_Vuna_dInterp_dBuiltinInfo)) (VStr "getArgs"))) (VStr "bi_get_args"))) (VInt (0)))) (VStr "get_args ()"))))) (VCon ("Nil", []))))))))))))))))))))))))))))))))))))))))))))
and v_Vuna_dInterp_dfindBuiltin = (fun a1 -> VFun ("Vuna.Interp.findBuiltin", (fun a2 -> (match (a1, a2) with
    | (x_name, VCon ("Nil", [])) -> VCon ("Vuna.Interp.Nothing", [])
    | (x_name, VCon ("Cons", [x_b; x_rest])) -> (match (x_b) with
    | VCon ("Vuna.Interp.BuiltinInfo", [x_vname; x_ocname; x_arity; x_body]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_vname))) (x_name))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Just", mk_Vuna_dInterp_dJust)) (x_b)) | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.findBuiltin", v_Vuna_dInterp_dfindBuiltin)) (x_name))) (x_rest)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.findBuiltin"))))
and v_Vuna_dInterp_djoinList = (fun a1 -> VFun ("Vuna.Interp.joinList", (fun a2 -> (match (a1, a2) with
    | (x_sep, VCon ("Nil", [])) -> VStr ""
    | (x_sep, VCon ("Cons", [x_x; VCon ("Nil", [])])) -> x_x
    | (x_sep, VCon ("Cons", [x_x; x_rest])) -> (apply ((apply (VFun ("++", bi_concat)) (x_x))) ((apply ((apply (VFun ("++", bi_concat)) (x_sep))) ((apply ((apply (VFun ("Vuna.Interp.joinList", v_Vuna_dInterp_djoinList)) (x_sep))) (x_rest))))))
    | _ -> fail "no matching clause for Vuna.Interp.joinList"))))
and v_Vuna_dInterp_dheadOf = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> VStr ""
    | VCon ("Cons", [x_x; x_rest]) -> x_x
    | _ -> fail "no matching clause for Vuna.Interp.headOf"))
and v_Vuna_dInterp_dnthList = (fun a1 -> VFun ("Vuna.Interp.nthList", (fun a2 -> (match (a1, a2) with
    | (x_n, VCon ("Nil", [])) -> VStr ""
    | (x_n, VCon ("Cons", [x_x; x_rest])) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_n))) (VInt (0)))) with VCon ("True", []) -> x_x | VCon ("False", []) -> (apply ((apply (VFun ("Vuna.Interp.nthList", v_Vuna_dInterp_dnthList)) ((apply ((apply (VFun ("-", bi_sub)) (x_n))) (VInt (1)))))) (x_rest)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.nthList"))))
and v_Vuna_dInterp_dsanitizeChar = (fun a1 -> (match a1 with
    | x_c -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (46)))) with VCon ("True", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) (VInt (95)))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (100)))) (VCon ("Nil", []))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (95)))) with VCon ("True", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) (VInt (95)))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (117)))) (VCon ("Nil", []))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (39)))) with VCon ("True", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) (VInt (95)))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (112)))) (VCon ("Nil", []))))) | VCon ("False", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (VCon ("Nil", []))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.sanitizeChar"))
and v_Vuna_dInterp_dsanitizeName = (fun a1 -> (match a1 with
    | x_name -> (apply (VFun ("strPack", bi_str_pack)) ((apply ((apply (VFun ("Vuna.Interp.concatMap", v_Vuna_dInterp_dconcatMap)) (VFun ("Vuna.Interp.sanitizeChar", v_Vuna_dInterp_dsanitizeChar)))) ((apply (VFun ("strUnpack", bi_str_unpack)) (x_name))))))
    | _ -> fail "no matching clause for Vuna.Interp.sanitizeName"))
and v_Vuna_dInterp_dpad3 = (fun a1 -> (match a1 with
    | x_s -> (match ((apply ((apply (VFun ("==", bi_eq)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_s))))) (VInt (1)))) with VCon ("True", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "00"))) (x_s)) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_s))))) (VInt (2)))) with VCon ("True", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "0"))) (x_s)) | VCon ("False", []) -> x_s | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.pad3"))
and v_Vuna_dInterp_descapeChar = (fun a1 -> (match a1 with
    | x_c -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (34)))) with VCon ("True", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) (VInt (92)))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (34)))) (VCon ("Nil", []))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (92)))) with VCon ("True", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) (VInt (92)))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (92)))) (VCon ("Nil", []))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (10)))) with VCon ("True", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) (VInt (92)))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (110)))) (VCon ("Nil", []))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (9)))) with VCon ("True", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) (VInt (92)))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (116)))) (VCon ("Nil", []))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_c))) (VInt (13)))) with VCon ("True", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) (VInt (92)))) ((apply ((apply (VFun ("Cons", mk_Cons)) (VInt (114)))) (VCon ("Nil", []))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("&&", bi_and)) ((apply ((apply (VFun (">=", bi_ge)) (x_c))) (VInt (32)))))) ((apply ((apply (VFun ("<=", bi_le)) (x_c))) (VInt (126)))))) with VCon ("True", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) (x_c))) (VCon ("Nil", []))) | VCon ("False", []) -> (apply (VFun ("strUnpack", bi_str_unpack)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "\\"))) ((apply (VFun ("Vuna.Interp.pad3", v_Vuna_dInterp_dpad3)) ((apply (VFun ("strFromInt", bi_str_from_int)) (x_c)))))))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.escapeChar"))
and v_Vuna_dInterp_docamlString = (fun a1 -> (match a1 with
    | x_s -> (apply ((apply (VFun ("++", bi_concat)) (VStr "\""))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("strPack", bi_str_pack)) ((apply ((apply (VFun ("Vuna.Interp.concatMap", v_Vuna_dInterp_dconcatMap)) (VFun ("Vuna.Interp.escapeChar", v_Vuna_dInterp_descapeChar)))) ((apply (VFun ("strUnpack", bi_str_unpack)) (x_s))))))))) (VStr "\""))))
    | _ -> fail "no matching clause for Vuna.Interp.ocamlString"))
and v_Vuna_dInterp_dgenVar = (fun a1 -> VFun ("Vuna.Interp.genVar", (fun a2 -> VFun ("Vuna.Interp.genVar", (fun a3 -> (match (a1, a2, a3) with
    | (x_decls, x_scope, x_name) -> (match ((apply ((apply (VFun ("Vuna.Interp.memName", v_Vuna_dInterp_dmemName)) (x_name))) (x_scope))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "x_"))) ((apply (VFun ("Vuna.Interp.sanitizeName", v_Vuna_dInterp_dsanitizeName)) (x_name)))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.funArity", v_Vuna_dInterp_dfunArity)) (x_name))) (x_decls))) with
    | VCon ("Vuna.Interp.Just", [VInt (0)]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "v_"))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.sanitizeName", v_Vuna_dInterp_dsanitizeName)) (x_name))))) (VStr " ()"))))))
    | VCon ("Vuna.Interp.Just", [x_arity]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "VFun ("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.ocamlString", v_Vuna_dInterp_docamlString)) (x_name))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ", v_"))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.sanitizeName", v_Vuna_dInterp_dsanitizeName)) (x_name))))) (VStr ")"))))))))))
    | VCon ("Vuna.Interp.Nothing", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.ctorArity", v_Vuna_dInterp_dctorArity)) (x_name))) (x_decls))) with
    | VCon ("Vuna.Interp.Just", [VInt (0)]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "VCon ("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.ocamlString", v_Vuna_dInterp_docamlString)) (x_name))))) (VStr ", [])"))))))
    | VCon ("Vuna.Interp.Just", [x_arity]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "VFun ("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.ocamlString", v_Vuna_dInterp_docamlString)) (x_name))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ", mk_"))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.sanitizeName", v_Vuna_dInterp_dsanitizeName)) (x_name))))) (VStr ")"))))))))))
    | VCon ("Vuna.Interp.Nothing", []) -> (match ((apply ((apply (VFun ("Vuna.Interp.findBuiltin", v_Vuna_dInterp_dfindBuiltin)) (x_name))) (v_Vuna_dInterp_dbuiltinInfos ()))) with
    | VCon ("Vuna.Interp.Just", [x_b]) -> (match (x_b) with
    | VCon ("Vuna.Interp.BuiltinInfo", [x_vname; x_ocname; x_arity; x_body]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_arity))) (VInt (0)))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (x_ocname))) (VStr " ()")))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "VFun ("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.ocamlString", v_Vuna_dInterp_docamlString)) (x_name))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ", "))) ((apply ((apply (VFun ("++", bi_concat)) (x_ocname))) (VStr ")")))))))))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | VCon ("Vuna.Interp.Nothing", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "unbound variable: "))) (x_name))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure") | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.genVar"))))))
and v_Vuna_dInterp_dpconPattern = (fun a1 -> VFun ("Vuna.Interp.pconPattern", (fun a2 -> (match (a1, a2) with
    | (x_name, VCon ("Nil", [])) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "VCon ("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.ocamlString", v_Vuna_dInterp_docamlString)) (x_name))))) (VStr ", [])"))))
    | (x_name, x_pats) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "VCon ("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.ocamlString", v_Vuna_dInterp_docamlString)) (x_name))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ", ["))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply (VFun ("Vuna.Interp.joinList", v_Vuna_dInterp_djoinList)) (VStr "; "))) (x_pats))))) (VStr "])"))))))))
    | _ -> fail "no matching clause for Vuna.Interp.pconPattern"))))
and v_Vuna_dInterp_dgenPattern = (fun a1 -> (match a1 with
    | x_pat -> (match (x_pat) with
    | VCon ("Vuna.Interp.PWild", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (VStr "_"))) (VCon ("Nil", [])))))
    | VCon ("Vuna.Interp.PVar", [x_name]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "x_"))) ((apply (VFun ("Vuna.Interp.sanitizeName", v_Vuna_dInterp_dsanitizeName)) (x_name))))))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_name))) (VCon ("Nil", [])))))))
    | VCon ("Vuna.Interp.PInt", [x_n]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "VInt ("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("strFromInt", bi_str_from_int)) (x_n))))) (VStr ")"))))))) (VCon ("Nil", [])))))
    | VCon ("Vuna.Interp.PStr", [x_s]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "VStr "))) ((apply (VFun ("Vuna.Interp.ocamlString", v_Vuna_dInterp_docamlString)) (x_s))))))) (VCon ("Nil", [])))))
    | VCon ("Vuna.Interp.PCon", [x_name; x_pats]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.traverse", v_Vuna_dInterp_dtraverse)) (VFun ("Vuna.Interp.genPattern", v_Vuna_dInterp_dgenPattern)))) (x_pats))))) (VFun ("", fun x_parts -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) ((apply ((apply (VFun ("Vuna.Interp.pconPattern", v_Vuna_dInterp_dpconPattern)) (x_name))) ((apply ((apply (VFun ("Vuna.Interp.map", v_Vuna_dInterp_dmap)) (VFun ("Vuna.Interp.firstOf", v_Vuna_dInterp_dfirstOf)))) (x_parts))))))) ((apply ((apply (VFun ("Vuna.Interp.concatMap", v_Vuna_dInterp_dconcatMap)) (VFun ("Vuna.Interp.secondOf", v_Vuna_dInterp_dsecondOf)))) (x_parts)))))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.genPattern"))
and v_Vuna_dInterp_dgenLambda = (fun a1 -> VFun ("Vuna.Interp.genLambda", (fun a2 -> VFun ("Vuna.Interp.genLambda", (fun a3 -> VFun ("Vuna.Interp.genLambda", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_decls, x_scope, x_params, x_body) -> (match (x_params) with
    | VCon ("Nil", []) -> (apply ((apply ((apply (VFun ("Vuna.Interp.genExpr", v_Vuna_dInterp_dgenExpr)) (x_decls))) (x_scope))) (x_body))
    | VCon ("Cons", [x_p; x_rest]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.genLambda", v_Vuna_dInterp_dgenLambda)) (x_decls))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_p))) (x_scope))))) (x_rest))) (x_body))))) (VFun ("", fun x_inner -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "VFun (\"\", fun x_"))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.sanitizeName", v_Vuna_dInterp_dsanitizeName)) (x_p))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " -> "))) ((apply ((apply (VFun ("++", bi_concat)) (x_inner))) (VStr ")")))))))))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.genLambda"))))))))
and v_Vuna_dInterp_dgenAlt = (fun a1 -> VFun ("Vuna.Interp.genAlt", (fun a2 -> VFun ("Vuna.Interp.genAlt", (fun a3 -> (match (a1, a2, a3) with
    | (x_decls, x_scope, x_alt) -> (match (x_alt) with
    | VCon ("Vuna.Interp.Pair", [x_pat; x_body]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.genPattern", v_Vuna_dInterp_dgenPattern)) (x_pat))))) (VFun ("", fun x_p -> (match (x_p) with
    | VCon ("Vuna.Interp.Pair", [x_patCode; x_bound]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.genExpr", v_Vuna_dInterp_dgenExpr)) (x_decls))) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_bound))) (x_scope))))) (x_body))))) (VFun ("", fun x_bodyCode -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "| "))) ((apply ((apply (VFun ("++", bi_concat)) (x_patCode))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " -> "))) (x_bodyCode)))))))))))
    | _ -> fail "case pattern match failure"))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.genAlt"))))))
and v_Vuna_dInterp_dgenCase = (fun a1 -> VFun ("Vuna.Interp.genCase", (fun a2 -> VFun ("Vuna.Interp.genCase", (fun a3 -> VFun ("Vuna.Interp.genCase", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_decls, x_scope, x_scrut, x_alts) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.genExpr", v_Vuna_dInterp_dgenExpr)) (x_decls))) (x_scope))) (x_scrut))))) (VFun ("", fun x_scrutCode -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.traverse", v_Vuna_dInterp_dtraverse)) ((apply ((apply (VFun ("Vuna.Interp.genAlt", v_Vuna_dInterp_dgenAlt)) (x_decls))) (x_scope))))) (x_alts))))) (VFun ("", fun x_branches -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "(match ("))) ((apply ((apply (VFun ("++", bi_concat)) (x_scrutCode))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ") with\n    "))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply (VFun ("Vuna.Interp.joinList", v_Vuna_dInterp_djoinList)) (VStr "\n    "))) (x_branches))))) (VStr "\n    | _ -> fail \"case pattern match failure\")"))))))))))))))))
    | _ -> fail "no matching clause for Vuna.Interp.genCase"))))))))
and v_Vuna_dInterp_dgenLet = (fun a1 -> VFun ("Vuna.Interp.genLet", (fun a2 -> VFun ("Vuna.Interp.genLet", (fun a3 -> VFun ("Vuna.Interp.genLet", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_decls, x_scope, x_binds, x_body) -> (match (x_binds) with
    | VCon ("Nil", []) -> (apply ((apply ((apply (VFun ("Vuna.Interp.genExpr", v_Vuna_dInterp_dgenExpr)) (x_decls))) (x_scope))) (x_body))
    | VCon ("Cons", [x_b; x_rest]) -> (match (x_b) with
    | VCon ("Vuna.Interp.Pair", [x_pat; x_value]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.genExpr", v_Vuna_dInterp_dgenExpr)) (x_decls))) (x_scope))) (x_value))))) (VFun ("", fun x_valueCode -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.genPattern", v_Vuna_dInterp_dgenPattern)) (x_pat))))) (VFun ("", fun x_p -> (match (x_p) with
    | VCon ("Vuna.Interp.Pair", [x_patCode; x_bound]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.genLet", v_Vuna_dInterp_dgenLet)) (x_decls))) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_bound))) (x_scope))))) (x_rest))) (x_body))))) (VFun ("", fun x_bodyCode -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "(let "))) ((apply ((apply (VFun ("++", bi_concat)) (x_patCode))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " = ("))) ((apply ((apply (VFun ("++", bi_concat)) (x_valueCode))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ") in "))) ((apply ((apply (VFun ("++", bi_concat)) (x_bodyCode))) (VStr ")")))))))))))))))))
    | _ -> fail "case pattern match failure")))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.genLet"))))))))
and v_Vuna_dInterp_dcgApplyFold = (fun a1 -> VFun ("Vuna.Interp.cgApplyFold", (fun a2 -> (match (a1, a2) with
    | (x_acc, VCon ("Nil", [])) -> x_acc
    | (x_acc, VCon ("Cons", [x_a; x_rest])) -> (apply ((apply (VFun ("Vuna.Interp.cgApplyFold", v_Vuna_dInterp_dcgApplyFold)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "(apply ("))) ((apply ((apply (VFun ("++", bi_concat)) (x_acc))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ") ("))) ((apply ((apply (VFun ("++", bi_concat)) (x_a))) (VStr "))"))))))))))) (x_rest))
    | _ -> fail "no matching clause for Vuna.Interp.cgApplyFold"))))
and v_Vuna_dInterp_dgenExpr = (fun a1 -> VFun ("Vuna.Interp.genExpr", (fun a2 -> VFun ("Vuna.Interp.genExpr", (fun a3 -> (match (a1, a2, a3) with
    | (x_decls, x_scope, x_expr) -> (match (x_expr) with
    | VCon ("Vuna.Interp.EVar", [x_name]) -> (apply ((apply ((apply (VFun ("Vuna.Interp.genVar", v_Vuna_dInterp_dgenVar)) (x_decls))) (x_scope))) (x_name))
    | VCon ("Vuna.Interp.EInt", [x_n]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "VInt ("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("strFromInt", bi_str_from_int)) (x_n))))) (VStr ")"))))))
    | VCon ("Vuna.Interp.EStr", [x_s]) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "VStr "))) ((apply (VFun ("Vuna.Interp.ocamlString", v_Vuna_dInterp_docamlString)) (x_s))))))
    | VCon ("Vuna.Interp.ELam", [x_params; x_body]) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.genLambda", v_Vuna_dInterp_dgenLambda)) (x_decls))) (x_scope))) (x_params))) (x_body))
    | VCon ("Vuna.Interp.EApp", [x_fn; x_args]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.genExpr", v_Vuna_dInterp_dgenExpr)) (x_decls))) (x_scope))) (x_fn))))) (VFun ("", fun x_fnCode -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.traverse", v_Vuna_dInterp_dtraverse)) (VFun ("", fun x_a -> (apply ((apply ((apply (VFun ("Vuna.Interp.genExpr", v_Vuna_dInterp_dgenExpr)) (x_decls))) (x_scope))) (x_a)))))) (x_args))))) (VFun ("", fun x_argCodes -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Vuna.Interp.cgApplyFold", v_Vuna_dInterp_dcgApplyFold)) (x_fnCode))) (x_argCodes))))))))))
    | VCon ("Vuna.Interp.ELet", [x_binds; x_body]) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.genLet", v_Vuna_dInterp_dgenLet)) (x_decls))) (x_scope))) (x_binds))) (x_body))
    | VCon ("Vuna.Interp.ECase", [x_scrut; x_alts]) -> (apply ((apply ((apply ((apply (VFun ("Vuna.Interp.genCase", v_Vuna_dInterp_dgenCase)) (x_decls))) (x_scope))) (x_scrut))) (x_alts))
    | VCon ("Vuna.Interp.EIf", [x_c; x_t; x_e]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.genExpr", v_Vuna_dInterp_dgenExpr)) (x_decls))) (x_scope))) (x_c))))) (VFun ("", fun x_cc -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.genExpr", v_Vuna_dInterp_dgenExpr)) (x_decls))) (x_scope))) (x_t))))) (VFun ("", fun x_tc -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.genExpr", v_Vuna_dInterp_dgenExpr)) (x_decls))) (x_scope))) (x_e))))) (VFun ("", fun x_ec -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "(match ("))) ((apply ((apply (VFun ("++", bi_concat)) (x_cc))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ") with VCon (\"True\", []) -> "))) ((apply ((apply (VFun ("++", bi_concat)) (x_tc))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " | VCon (\"False\", []) -> "))) ((apply ((apply (VFun ("++", bi_concat)) (x_ec))) (VStr " | _ -> fail \"if condition is not a Bool\")")))))))))))))))))))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.genExpr"))))))
and v_Vuna_dInterp_dgroupFunctions = (fun a1 -> (match a1 with
    | x_decls -> (apply ((apply (VFun ("Vuna.Interp.groupFunctionsLoop", v_Vuna_dInterp_dgroupFunctionsLoop)) (x_decls))) (VCon ("Nil", [])))
    | _ -> fail "no matching clause for Vuna.Interp.groupFunctions"))
and v_Vuna_dInterp_dgroupFunctionsLoop = (fun a1 -> VFun ("Vuna.Interp.groupFunctionsLoop", (fun a2 -> (match (a1, a2) with
    | (VCon ("Nil", []), x_groups) -> x_groups
    | (VCon ("Cons", [x_d; x_rest]), x_groups) -> (match (x_d) with
    | VCon ("Vuna.Interp.DFun", [x_name; x_pats; x_body]) -> (apply ((apply (VFun ("Vuna.Interp.groupFunctionsLoop", v_Vuna_dInterp_dgroupFunctionsLoop)) (x_rest))) ((apply ((apply ((apply (VFun ("Vuna.Interp.addClause", v_Vuna_dInterp_daddClause)) (x_name))) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_pats))) (x_body))))) (x_groups))))
    | _ -> (apply ((apply (VFun ("Vuna.Interp.groupFunctionsLoop", v_Vuna_dInterp_dgroupFunctionsLoop)) (x_rest))) (x_groups))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.groupFunctionsLoop"))))
and v_Vuna_dInterp_daddClause = (fun a1 -> VFun ("Vuna.Interp.addClause", (fun a2 -> VFun ("Vuna.Interp.addClause", (fun a3 -> (match (a1, a2, a3) with
    | (x_name, x_clause, VCon ("Nil", [])) -> (apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_name))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_clause))) (VCon ("Nil", [])))))))) (VCon ("Nil", [])))
    | (x_name, x_clause, VCon ("Cons", [x_g; x_rest])) -> (match (x_g) with
    | VCon ("Vuna.Interp.Pair", [x_gname; x_clauses]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_gname))) (x_name))) with VCon ("True", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_gname))) ((apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_clauses))) ((apply ((apply (VFun ("Cons", mk_Cons)) (x_clause))) (VCon ("Nil", [])))))))))) (x_rest)) | VCon ("False", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) (x_g))) ((apply ((apply ((apply (VFun ("Vuna.Interp.addClause", v_Vuna_dInterp_daddClause)) (x_name))) (x_clause))) (x_rest)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.addClause"))))))
and v_Vuna_dInterp_darityOf = (fun a1 -> VFun ("Vuna.Interp.arityOf", (fun a2 -> (match (a1, a2) with
    | (x_name, VCon ("Nil", [])) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "function "))) ((apply ((apply (VFun ("++", bi_concat)) (x_name))) (VStr " has no clauses"))))))
    | (x_name, VCon ("Cons", [x_c; x_rest])) -> (match (x_c) with
    | VCon ("Vuna.Interp.Pair", [x_pats; x_body]) -> (apply ((apply ((apply (VFun ("Vuna.Interp.checkArities", v_Vuna_dInterp_dcheckArities)) (x_name))) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_pats))))) (x_rest))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.arityOf"))))
and v_Vuna_dInterp_dcheckArities = (fun a1 -> VFun ("Vuna.Interp.checkArities", (fun a2 -> VFun ("Vuna.Interp.checkArities", (fun a3 -> (match (a1, a2, a3) with
    | (x_name, x_expected, VCon ("Nil", [])) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (x_expected))
    | (x_name, x_expected, VCon ("Cons", [x_c; x_rest])) -> (match (x_c) with
    | VCon ("Vuna.Interp.Pair", [x_pats; x_body]) -> (match ((apply ((apply (VFun ("==", bi_eq)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_pats))))) (x_expected))) with VCon ("True", []) -> (apply ((apply ((apply (VFun ("Vuna.Interp.checkArities", v_Vuna_dInterp_dcheckArities)) (x_name))) (x_expected))) (x_rest)) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "clauses for "))) ((apply ((apply (VFun ("++", bi_concat)) (x_name))) (VStr " have different arities")))))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.checkArities"))))))
and v_Vuna_dInterp_dallCtors = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> VCon ("Nil", [])
    | VCon ("Cons", [x_d; x_rest]) -> (match (x_d) with
    | VCon ("Vuna.Interp.DData", [x_dname; x_params; x_ctors]) -> (apply ((apply (VFun ("Vuna.Interp.append", v_Vuna_dInterp_dappend)) (x_ctors))) ((apply (VFun ("Vuna.Interp.allCtors", v_Vuna_dInterp_dallCtors)) (x_rest))))
    | _ -> (apply (VFun ("Vuna.Interp.allCtors", v_Vuna_dInterp_dallCtors)) (x_rest))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.allCtors"))
and v_Vuna_dInterp_dvalidateCtors = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (VCon ("Nil", [])))
    | VCon ("Cons", [x_c; x_rest]) -> (match (x_c) with
    | VCon ("Vuna.Interp.Pair", [x_name; x_arity]) -> (match ((apply ((apply (VFun ("Vuna.Interp.memName", v_Vuna_dInterp_dmemName)) (x_name))) ((apply ((apply (VFun ("Vuna.Interp.map", v_Vuna_dInterp_dmap)) (VFun ("Vuna.Interp.firstOf", v_Vuna_dInterp_dfirstOf)))) (x_rest))))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "duplicate constructor: "))) (x_name)))) | VCon ("False", []) -> (apply (VFun ("Vuna.Interp.validateCtors", v_Vuna_dInterp_dvalidateCtors)) (x_rest)) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.validateCtors"))
and v_Vuna_dInterp_dcheckNoCtorFun = (fun a1 -> VFun ("Vuna.Interp.checkNoCtorFun", (fun a2 -> (match (a1, a2) with
    | (VCon ("Nil", []), x_decls) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (VCon ("Nil", [])))
    | (VCon ("Cons", [x_g; x_rest]), x_decls) -> (match (x_g) with
    | VCon ("Vuna.Interp.Pair", [x_name; x_clauses]) -> (match ((apply ((apply (VFun ("Vuna.Interp.ctorArity", v_Vuna_dInterp_dctorArity)) (x_name))) (x_decls))) with
    | VCon ("Vuna.Interp.Just", [x_arity]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "name is both a constructor and a function: "))) (x_name))))
    | VCon ("Vuna.Interp.Nothing", []) -> (apply ((apply (VFun ("Vuna.Interp.checkNoCtorFun", v_Vuna_dInterp_dcheckNoCtorFun)) (x_rest))) (x_decls))
    | _ -> fail "case pattern match failure")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.checkNoCtorFun"))))
and v_Vuna_dInterp_dmakeParams = (fun a1 -> (match a1 with
    | x_n -> (apply ((apply (VFun ("Vuna.Interp.makeParamsFrom", v_Vuna_dInterp_dmakeParamsFrom)) (VInt (1)))) (x_n))
    | _ -> fail "no matching clause for Vuna.Interp.makeParams"))
and v_Vuna_dInterp_dmakeParamsFrom = (fun a1 -> VFun ("Vuna.Interp.makeParamsFrom", (fun a2 -> (match (a1, a2) with
    | (x_i, x_n) -> (match ((apply ((apply (VFun (">", bi_gt)) (x_i))) (x_n))) with VCon ("True", []) -> VCon ("Nil", []) | VCon ("False", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "a"))) ((apply (VFun ("strFromInt", bi_str_from_int)) (x_i))))))) ((apply ((apply (VFun ("Vuna.Interp.makeParamsFrom", v_Vuna_dInterp_dmakeParamsFrom)) ((apply ((apply (VFun ("+", bi_add)) (x_i))) (VInt (1)))))) (x_n)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.makeParamsFrom"))))
and v_Vuna_dInterp_dmakeCtorParams = (fun a1 -> (match a1 with
    | x_n -> (apply ((apply (VFun ("Vuna.Interp.makeCtorParamsFrom", v_Vuna_dInterp_dmakeCtorParamsFrom)) (VInt (1)))) (x_n))
    | _ -> fail "no matching clause for Vuna.Interp.makeCtorParams"))
and v_Vuna_dInterp_dmakeCtorParamsFrom = (fun a1 -> VFun ("Vuna.Interp.makeCtorParamsFrom", (fun a2 -> (match (a1, a2) with
    | (x_i, x_n) -> (match ((apply ((apply (VFun (">", bi_gt)) (x_i))) (x_n))) with VCon ("True", []) -> VCon ("Nil", []) | VCon ("False", []) -> (apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "c"))) ((apply (VFun ("strFromInt", bi_str_from_int)) (x_i))))))) ((apply ((apply (VFun ("Vuna.Interp.makeCtorParamsFrom", v_Vuna_dInterp_dmakeCtorParamsFrom)) ((apply ((apply (VFun ("+", bi_add)) (x_i))) (VInt (1)))))) (x_n)))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.makeCtorParamsFrom"))))
and v_Vuna_dInterp_dgenBranches = (fun a1 -> VFun ("Vuna.Interp.genBranches", (fun a2 -> VFun ("Vuna.Interp.genBranches", (fun a3 -> (match (a1, a2, a3) with
    | (x_decls, x_arity, VCon ("Nil", [])) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (VCon ("Nil", [])))
    | (x_decls, x_arity, VCon ("Cons", [x_c; x_rest])) -> (match (x_c) with
    | VCon ("Vuna.Interp.Pair", [x_pats; x_body]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.traverse", v_Vuna_dInterp_dtraverse)) (VFun ("Vuna.Interp.genPattern", v_Vuna_dInterp_dgenPattern)))) (x_pats))))) (VFun ("", fun x_parts -> (let x_patternCode = ((match ((apply ((apply (VFun ("==", bi_eq)) (x_arity))) (VInt (1)))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.headOf", v_Vuna_dInterp_dheadOf)) ((apply ((apply (VFun ("Vuna.Interp.map", v_Vuna_dInterp_dmap)) (VFun ("Vuna.Interp.firstOf", v_Vuna_dInterp_dfirstOf)))) (x_parts)))) | VCon ("False", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply (VFun ("Vuna.Interp.joinList", v_Vuna_dInterp_djoinList)) (VStr ", "))) ((apply ((apply (VFun ("Vuna.Interp.map", v_Vuna_dInterp_dmap)) (VFun ("Vuna.Interp.firstOf", v_Vuna_dInterp_dfirstOf)))) (x_parts))))))) (VStr ")")))) | _ -> fail "if condition is not a Bool")) in (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.genExpr", v_Vuna_dInterp_dgenExpr)) (x_decls))) ((apply ((apply (VFun ("Vuna.Interp.concatMap", v_Vuna_dInterp_dconcatMap)) (VFun ("Vuna.Interp.secondOf", v_Vuna_dInterp_dsecondOf)))) (x_parts))))) (x_body))))) (VFun ("", fun x_b -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.genBranches", v_Vuna_dInterp_dgenBranches)) (x_decls))) (x_arity))) (x_rest))))) (VFun ("", fun x_restBranches -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "| "))) ((apply ((apply (VFun ("++", bi_concat)) (x_patternCode))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " -> "))) (x_b))))))))) (x_restBranches))))))))))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.genBranches"))))))
and v_Vuna_dInterp_dgenFunction = (fun a1 -> VFun ("Vuna.Interp.genFunction", (fun a2 -> VFun ("Vuna.Interp.genFunction", (fun a3 -> (match (a1, a2, a3) with
    | (x_decls, x_name, x_clauses) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.arityOf", v_Vuna_dInterp_darityOf)) (x_name))) (x_clauses))))) (VFun ("", fun x_arity -> (match (x_clauses) with
    | VCon ("Nil", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "function "))) ((apply ((apply (VFun ("++", bi_concat)) (x_name))) (VStr " has no clauses"))))))
    | VCon ("Cons", [x_first; x_rest]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_arity))) (VInt (0)))) with VCon ("True", []) -> (match (x_first) with
    | VCon ("Vuna.Interp.Pair", [x_pats; x_body]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.genExpr", v_Vuna_dInterp_dgenExpr)) (x_decls))) (VCon ("Nil", [])))) (x_body))))) (VFun ("", fun x_b -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "(fun () -> "))) ((apply ((apply (VFun ("++", bi_concat)) (x_b))) (VStr ")")))))))))
    | _ -> fail "case pattern match failure") | VCon ("False", []) -> (let x_params = ((apply (VFun ("Vuna.Interp.makeParams", v_Vuna_dInterp_dmakeParams)) (x_arity))) in (let x_scrutinee = ((match ((apply ((apply (VFun ("==", bi_eq)) (x_arity))) (VInt (1)))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.headOf", v_Vuna_dInterp_dheadOf)) (x_params)) | VCon ("False", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply (VFun ("Vuna.Interp.joinList", v_Vuna_dInterp_djoinList)) (VStr ", "))) (x_params))))) (VStr ")")))) | _ -> fail "if condition is not a Bool")) in (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.genBranches", v_Vuna_dInterp_dgenBranches)) (x_decls))) (x_arity))) (x_clauses))))) (VFun ("", fun x_branches -> (let x_matchCode = ((apply ((apply (VFun ("++", bi_concat)) (VStr "(match ("))) ((apply ((apply (VFun ("++", bi_concat)) (x_scrutinee))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ") with\n    "))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply (VFun ("Vuna.Interp.joinList", v_Vuna_dInterp_djoinList)) (VStr "\n    "))) (x_branches))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr "\n    | _ -> fail \"no matching clause for "))) ((apply ((apply (VFun ("++", bi_concat)) (x_name))) (VStr "\")"))))))))))))) in (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.wrapFun", v_Vuna_dInterp_dwrapFun)) (x_name))) (x_params))) (x_matchCode))) (VInt (0))))))))))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure"))))
    | _ -> fail "no matching clause for Vuna.Interp.genFunction"))))))
and v_Vuna_dInterp_dwrapFun = (fun a1 -> VFun ("Vuna.Interp.wrapFun", (fun a2 -> VFun ("Vuna.Interp.wrapFun", (fun a3 -> VFun ("Vuna.Interp.wrapFun", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_name, x_params, x_matchCode, x_k) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_k))) ((apply ((apply (VFun ("-", bi_sub)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_params))))) (VInt (1)))))) with VCon ("True", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "(fun "))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply (VFun ("Vuna.Interp.nthList", v_Vuna_dInterp_dnthList)) (x_k))) (x_params))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " -> "))) ((apply ((apply (VFun ("++", bi_concat)) (x_matchCode))) (VStr ")")))))))) | VCon ("False", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "(fun "))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply (VFun ("Vuna.Interp.nthList", v_Vuna_dInterp_dnthList)) (x_k))) (x_params))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " -> VFun ("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.ocamlString", v_Vuna_dInterp_docamlString)) (x_name))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ", "))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.wrapFun", v_Vuna_dInterp_dwrapFun)) (x_name))) (x_params))) (x_matchCode))) ((apply ((apply (VFun ("+", bi_add)) (x_k))) (VInt (1)))))))) (VStr "))")))))))))))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.wrapFun"))))))))
and v_Vuna_dInterp_dgenCtor = (fun a1 -> (match a1 with
    | x_c -> (match (x_c) with
    | VCon ("Vuna.Interp.Pair", [x_name; x_arity]) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_arity))) (VInt (0)))) with VCon ("True", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (VStr "")) | VCon ("False", []) -> (let x_params = ((apply (VFun ("Vuna.Interp.makeCtorParams", v_Vuna_dInterp_dmakeCtorParams)) (x_arity))) in (let x_body = ((apply ((apply (VFun ("++", bi_concat)) (VStr "VCon ("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.ocamlString", v_Vuna_dInterp_docamlString)) (x_name))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ", ["))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply (VFun ("Vuna.Interp.joinList", v_Vuna_dInterp_djoinList)) (VStr "; "))) (x_params))))) (VStr "])"))))))))) in (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (VStr "let mk_"))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.sanitizeName", v_Vuna_dInterp_dsanitizeName)) (x_name))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " = "))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.wrapCtor", v_Vuna_dInterp_dwrapCtor)) (x_name))) (x_params))) (x_body))) (VInt (0)))))) (VStr "\n")))))))))))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.genCtor"))
and v_Vuna_dInterp_dwrapCtor = (fun a1 -> VFun ("Vuna.Interp.wrapCtor", (fun a2 -> VFun ("Vuna.Interp.wrapCtor", (fun a3 -> VFun ("Vuna.Interp.wrapCtor", (fun a4 -> (match (a1, a2, a3, a4) with
    | (x_name, x_params, x_body, x_k) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_k))) ((apply ((apply (VFun ("-", bi_sub)) ((apply (VFun ("Vuna.Interp.length", v_Vuna_dInterp_dlength)) (x_params))))) (VInt (1)))))) with VCon ("True", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "(fun "))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply (VFun ("Vuna.Interp.nthList", v_Vuna_dInterp_dnthList)) (x_k))) (x_params))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " -> "))) ((apply ((apply (VFun ("++", bi_concat)) (x_body))) (VStr ")")))))))) | VCon ("False", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "(fun "))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply (VFun ("Vuna.Interp.nthList", v_Vuna_dInterp_dnthList)) (x_k))) (x_params))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " -> VFun ("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.ocamlString", v_Vuna_dInterp_docamlString)) (x_name))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ", "))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply ((apply ((apply (VFun ("Vuna.Interp.wrapCtor", v_Vuna_dInterp_dwrapCtor)) (x_name))) (x_params))) (x_body))) ((apply ((apply (VFun ("+", bi_add)) (x_k))) (VInt (1)))))))) (VStr "))")))))))))))) | _ -> fail "if condition is not a Bool")
    | _ -> fail "no matching clause for Vuna.Interp.wrapCtor"))))))))
and v_Vuna_dInterp_dgenCtorDefs = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (VStr ""))
    | VCon ("Cons", [x_c; x_rest]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.genCtor", v_Vuna_dInterp_dgenCtor)) (x_c))))) (VFun ("", fun x_def -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.genCtorDefs", v_Vuna_dInterp_dgenCtorDefs)) (x_rest))))) (VFun ("", fun x_restDefs -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (x_def))) (x_restDefs))))))))))
    | _ -> fail "no matching clause for Vuna.Interp.genCtorDefs"))
and v_Vuna_dInterp_dgenBuiltinDef = (fun a1 -> (match a1 with
    | VCon ("Nil", []) -> VStr ""
    | VCon ("Cons", [x_b; x_rest]) -> (match (x_b) with
    | VCon ("Vuna.Interp.BuiltinInfo", [x_vname; x_ocname; x_arity; x_body]) -> (let x_def = ((match ((apply ((apply (VFun ("==", bi_eq)) (x_arity))) (VInt (0)))) with VCon ("True", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "let "))) ((apply ((apply (VFun ("++", bi_concat)) (x_ocname))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " = fun () -> "))) ((apply ((apply (VFun ("++", bi_concat)) (x_body))) (VStr "\n")))))))) | VCon ("False", []) -> (match ((apply ((apply (VFun ("==", bi_eq)) (x_arity))) (VInt (1)))) with VCon ("True", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "let "))) ((apply ((apply (VFun ("++", bi_concat)) (x_ocname))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " = fun a -> "))) ((apply ((apply (VFun ("++", bi_concat)) (x_body))) (VStr "\n")))))))) | VCon ("False", []) -> (apply ((apply (VFun ("++", bi_concat)) (VStr "let "))) ((apply ((apply (VFun ("++", bi_concat)) (x_ocname))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " = fun a -> VFun ("))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.ocamlString", v_Vuna_dInterp_docamlString)) (x_vname))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr ", fun b -> "))) ((apply ((apply (VFun ("++", bi_concat)) (x_body))) (VStr ")\n")))))))))))) | _ -> fail "if condition is not a Bool") | _ -> fail "if condition is not a Bool")) in (apply ((apply (VFun ("++", bi_concat)) (x_def))) ((apply (VFun ("Vuna.Interp.genBuiltinDef", v_Vuna_dInterp_dgenBuiltinDef)) (x_rest)))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.genBuiltinDef"))
and v_Vuna_dInterp_dgenFunctions = (fun a1 -> VFun ("Vuna.Interp.genFunctions", (fun a2 -> (match (a1, a2) with
    | (x_decls, VCon ("Nil", [])) -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) (VCon ("Nil", [])))
    | (x_decls, VCon ("Cons", [x_g; x_rest])) -> (match (x_g) with
    | VCon ("Vuna.Interp.Pair", [x_name; x_clauses]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply ((apply (VFun ("Vuna.Interp.genFunction", v_Vuna_dInterp_dgenFunction)) (x_decls))) (x_name))) (x_clauses))))) (VFun ("", fun x_def -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.genFunctions", v_Vuna_dInterp_dgenFunctions)) (x_decls))) (x_rest))))) (VFun ("", fun x_defs -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("Cons", mk_Cons)) ((apply ((apply (VFun ("Vuna.Interp.Pair", mk_Vuna_dInterp_dPair)) (x_name))) (x_def))))) (x_defs))))))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.genFunctions"))))
and v_Vuna_dInterp_drenderRecsFrom = (fun a1 -> VFun ("Vuna.Interp.renderRecsFrom", (fun a2 -> (match (a1, a2) with
    | (VCon ("Nil", []), x_index) -> VStr ""
    | (VCon ("Cons", [x_f; x_rest]), x_index) -> (let x_prefix = ((match ((apply ((apply (VFun ("==", bi_eq)) (x_index))) (VInt (0)))) with VCon ("True", []) -> VStr "let rec " | VCon ("False", []) -> VStr "and " | _ -> fail "if condition is not a Bool")) in (apply ((apply (VFun ("++", bi_concat)) (x_prefix))) ((apply ((apply (VFun ("++", bi_concat)) (VStr "v_"))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.sanitizeName", v_Vuna_dInterp_dsanitizeName)) ((apply (VFun ("Vuna.Interp.firstOf", v_Vuna_dInterp_dfirstOf)) (x_f))))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr " = "))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.secondOf", v_Vuna_dInterp_dsecondOf)) (x_f))))) ((apply ((apply (VFun ("++", bi_concat)) (VStr "\n"))) ((apply ((apply (VFun ("Vuna.Interp.renderRecsFrom", v_Vuna_dInterp_drenderRecsFrom)) (x_rest))) ((apply ((apply (VFun ("+", bi_add)) (x_index))) (VInt (1))))))))))))))))))
    | _ -> fail "no matching clause for Vuna.Interp.renderRecsFrom"))))
and v_Vuna_dInterp_dgenerateProgram = (fun a1 -> VFun ("Vuna.Interp.generateProgram", (fun a2 -> (match (a1, a2) with
    | (x_decls, x_printResult) -> (match ((apply (VFun ("Vuna.Interp.allCtors", v_Vuna_dInterp_dallCtors)) (x_decls))) with
    | x_ctors -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.validateCtors", v_Vuna_dInterp_dvalidateCtors)) (x_ctors))))) (VFun ("", fun x__u -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.checkNoCtorFun", v_Vuna_dInterp_dcheckNoCtorFun)) ((apply (VFun ("Vuna.Interp.groupFunctions", v_Vuna_dInterp_dgroupFunctions)) (x_decls))))) (x_decls))))) (VFun ("", fun x__u -> (match ((apply ((apply (VFun ("Vuna.Interp.funArity", v_Vuna_dInterp_dfunArity)) (VStr "main"))) (x_decls))) with
    | VCon ("Vuna.Interp.Just", [VInt (0)]) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.genFunctions", v_Vuna_dInterp_dgenFunctions)) (x_decls))) ((apply (VFun ("Vuna.Interp.groupFunctions", v_Vuna_dInterp_dgroupFunctions)) (x_decls))))))) (VFun ("", fun x_defs -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply (VFun ("Vuna.Interp.genCtorDefs", v_Vuna_dInterp_dgenCtorDefs)) (x_ctors))))) (VFun ("", fun x_ctorDefs -> (apply (VFun ("Vuna.Interp.Ok", mk_Vuna_dInterp_dOk)) ((apply ((apply (VFun ("++", bi_concat)) (v_Vuna_dInterp_druntimeCode ()))) ((apply ((apply (VFun ("++", bi_concat)) (x_ctorDefs))) ((apply ((apply (VFun ("++", bi_concat)) ((apply (VFun ("Vuna.Interp.genBuiltinDef", v_Vuna_dInterp_dgenBuiltinDef)) (v_Vuna_dInterp_dbuiltinInfos ()))))) ((apply ((apply (VFun ("++", bi_concat)) ((apply ((apply (VFun ("Vuna.Interp.renderRecsFrom", v_Vuna_dInterp_drenderRecsFrom)) (x_defs))) (VInt (0)))))) ((match (x_printResult) with VCon ("True", []) -> VStr "let () = print_endline (show_value (v_main ()))\n" | VCon ("False", []) -> VStr "let () = ignore (v_main ())\n" | _ -> fail "if condition is not a Bool")))))))))))))))))
    | VCon ("Vuna.Interp.Just", [x_arity]) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "`main` must be a nullary definition"))
    | VCon ("Vuna.Interp.Nothing", []) -> (apply (VFun ("Vuna.Interp.Err", mk_Vuna_dInterp_dErr)) (VStr "no `main` definition"))
    | _ -> fail "case pattern match failure")))))))
    | _ -> fail "case pattern match failure")
    | _ -> fail "no matching clause for Vuna.Interp.generateProgram"))))
and v_Vuna_dInterp_dcompileFile = (fun a1 -> VFun ("Vuna.Interp.compileFile", (fun a2 -> VFun ("Vuna.Interp.compileFile", (fun a3 -> (match (a1, a2, a3) with
    | (x_root, x_entry, x_printResult) -> (apply ((apply (VFun ("Vuna.Interp.andThen", v_Vuna_dInterp_dandThen)) ((apply ((apply (VFun ("Vuna.Interp.loadProgram", v_Vuna_dInterp_dloadProgram)) (x_root))) (x_entry))))) (VFun ("", fun x_decls -> (match (x_decls) with
    | x_ds -> (apply ((apply (VFun ("Vuna.Interp.generateProgram", v_Vuna_dInterp_dgenerateProgram)) (x_ds))) (x_printResult))
    | _ -> fail "case pattern match failure"))))
    | _ -> fail "no matching clause for Vuna.Interp.compileFile"))))))
and v_Vuna_dInterp_ddemo = (fun () -> VStr "main = 40 + 2")
and v_Vuna_dInterp_dmain = (fun () -> (apply (VFun ("Vuna.Interp.interpret", v_Vuna_dInterp_dinterpret)) (v_Vuna_dInterp_ddemo ())))
let () = ignore (v_main ())
