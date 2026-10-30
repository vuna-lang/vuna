open Token

exception Error of pos * string

type state = { toks : located array; mutable i : int; mutable last : pos }
(** Parser state: a token array plus the position of the last consumed token.
    Layout (offside) rules are parser-driven: a token starts a new item in the
    current block only if its column equals the block column, and expressions
    may continue across lines only while indented past the block column. *)

let start_state toks = { toks; i = 0; last = { line = 1; col = 0 } }
let peek st = st.toks.(st.i)
let peek_tok st = (peek st).tok
let peek_pos st = (peek st).pos
let is_eof st = peek_tok st = Eof

let advance st =
  let located = peek st in
  st.last <- located.pos;
  if located.tok <> Eof then st.i <- st.i + 1

let error st message = raise (Error ((peek st).pos, message))

let expect_sym st sym =
  match peek_tok st with
  | Sym s when s = sym -> advance st
  | tok ->
      error st
        (Printf.sprintf "expected %S, found %s" sym (Token.to_string tok))

let expect_kw st kw =
  match peek_tok st with
  | Kw s when s = kw -> advance st
  | tok ->
      error st
        (Printf.sprintf "expected keyword %S, found %s" kw (Token.to_string tok))

let expect_ident st =
  match peek_tok st with
  | Ident s ->
      advance st;
      s
  | tok ->
      error st
        (Printf.sprintf "expected identifier, found %s" (Token.to_string tok))

let at_kw st kw = match peek_tok st with Kw s -> s = kw | _ -> false
let at_sym st sym = match peek_tok st with Sym s -> s = sym | _ -> false
let upper_first s = String.length s > 0 && s.[0] >= 'A' && s.[0] <= 'Z'

let can_continue st block_col =
  let p = peek_pos st in
  p.line = st.last.line || p.col > block_col

let starts_atom st =
  match peek_tok st with
  | Ident _ | Int _ | Str _ -> true
  | Kw "Type" -> true
  | Sym "(" | Sym "[" -> true
  | _ -> false

let starts_pattern_atom st =
  match peek_tok st with
  | Ident _ | Int _ | Str _ -> true
  | Sym "(" | Sym "[" -> true
  | _ -> false

(* Tokens that may follow the last [case] alternative without being part of
   the enclosing block, e.g. a closing paren on the same line. *)
let terminates_expression = function
  | Sym (")" | "]" | ",") -> true
  | Kw ("else" | "in" | "then") -> true
  | _ -> false

let infix_info = function
  | "->" -> Some (1, `Right)
  | "||" -> Some (2, `Left)
  | "&&" -> Some (3, `Left)
  | "==" | "/=" | "<" | "<=" | ">" | ">=" -> Some (4, `Left)
  | "++" -> Some (5, `Right)
  | "+" | "-" -> Some (6, `Left)
  | "*" | "/" -> Some (7, `Left)
  | "::" -> Some (8, `Right)
  | _ -> None

let op_expr op = if op = "::" then Ast.EVar "Cons" else Ast.EVar op

let rec count_arrows = function
  | Ast.EApp (Ast.EVar "->", [ _; rest ]) -> 1 + count_arrows rest
  | _ -> 0

let rec parse_decl st ~block_col =
  match peek_tok st with
  | Kw "data" -> parse_data st ~block_col
  | Ident name ->
      advance st;
      if at_sym st ":" then parse_signature st ~block_col name
      else parse_clause st ~block_col name
  | tok ->
      error st
        (Printf.sprintf "expected a top-level declaration, found %s"
           (Token.to_string tok))

and parse_signature st ~block_col name =
  expect_sym st ":";
  let ty = parse_expr st ~block_col ~min_prec:0 in
  Ast.DSig (name, ty)

and parse_clause st ~block_col name =
  let patterns = parse_clause_patterns st ~block_col in
  expect_sym st "=";
  let body = parse_expr st ~block_col ~min_prec:0 in
  Ast.DFun (name, patterns, body)

and parse_clause_patterns st ~block_col =
  let rec loop acc =
    if starts_pattern_atom st && can_continue st block_col then
      loop (parse_pattern_atom st ~block_col :: acc)
    else List.rev acc
  in
  loop []

and parse_data st ~block_col =
  advance st;
  let name = expect_ident st in
  let params = ref [] in
  while match peek_tok st with Ident _ -> true | _ -> false do
    params := expect_ident st :: !params
  done;
  expect_sym st ":";
  let _annotation = parse_expr st ~block_col ~min_prec:0 in
  expect_kw st "where";
  let ctors = ref [] in
  if (not (is_eof st)) && (peek_pos st).col > block_col then begin
    let ctor_col = (peek_pos st).col in
    while (not (is_eof st)) && (peek_pos st).col = ctor_col do
      let ctor_name = expect_ident st in
      expect_sym st ":";
      let ctor_type = parse_expr st ~block_col:ctor_col ~min_prec:0 in
      ctors := (ctor_name, count_arrows ctor_type) :: !ctors
    done;
    if (not (is_eof st)) && (peek_pos st).col > ctor_col then
      error st "unexpected indentation in data block"
  end;
  Ast.DData { name; params = List.rev !params; ctors = List.rev !ctors }

and parse_expr st ~block_col ~min_prec =
  let p = peek_pos st in
  if p.line <> st.last.line && p.col <= block_col then
    error st "expression is not indented enough";
  let lhs = parse_lhs st ~block_col in
  parse_infix st ~block_col ~min_prec lhs

and parse_infix st ~block_col ~min_prec lhs =
  match peek_tok st with
  | Sym op -> (
      match infix_info op with
      | Some (prec, assoc) when prec >= min_prec && can_continue st block_col ->
          advance st;
          let rhs_prec =
            match assoc with `Left -> prec + 1 | `Right -> prec
          in
          let rhs = parse_expr st ~block_col ~min_prec:rhs_prec in
          let combined = Ast.EApp (op_expr op, [ lhs; rhs ]) in
          parse_infix st ~block_col ~min_prec combined
      | _ -> lhs)
  | _ -> lhs

and parse_lhs st ~block_col =
  match peek_tok st with
  | Sym "\\" -> parse_lambda st ~block_col
  | Kw "let" -> parse_let st ~block_col
  | Kw "case" -> parse_case st ~block_col
  | Kw "if" -> parse_if st ~block_col
  | _ -> parse_application st ~block_col

and parse_application st ~block_col =
  let first = parse_atom st ~block_col in
  let rec loop acc =
    if starts_atom st && can_continue st block_col then
      loop (parse_atom st ~block_col :: acc)
    else List.rev acc
  in
  match loop [] with [] -> first | args -> Ast.EApp (first, args)

and parse_atom st ~block_col =
  match peek_tok st with
  | Ident name ->
      advance st;
      Ast.EVar name
  | Int n ->
      advance st;
      Ast.EInt n
  | Str s ->
      advance st;
      Ast.EStr s
  | Kw "Type" ->
      advance st;
      Ast.EVar "Type"
  | Sym "(" ->
      advance st;
      let inner = parse_expr st ~block_col ~min_prec:0 in
      expect_sym st ")";
      inner
  | Sym "[" -> parse_list_expr st ~block_col
  | tok ->
      error st
        (Printf.sprintf "expected expression, found %s" (Token.to_string tok))

and parse_lambda st ~block_col =
  advance st;
  let first = expect_ident st in
  let rec more acc =
    if at_sym st "," then begin
      advance st;
      let name = expect_ident st in
      more (name :: acc)
    end
    else List.rev acc
  in
  let params = more [ first ] in
  expect_sym st "=>";
  let body = parse_expr st ~block_col ~min_prec:0 in
  Ast.ELam (params, body)

and parse_let st ~block_col =
  advance st;
  let decl_col = (peek_pos st).col in
  if is_eof st then error st "expected a let binding"
  else if decl_col <= block_col then
    error st "let binding is not indented enough"
  else begin
    let bindings = ref [] in
    while
      (not (is_eof st)) && (peek_pos st).col = decl_col && not (at_kw st "in")
    do
      let pat = parse_pattern_single st ~block_col:decl_col in
      expect_sym st "=";
      let value = parse_expr st ~block_col:decl_col ~min_prec:0 in
      bindings := (pat, value) :: !bindings
    done;
    expect_kw st "in";
    let body = parse_expr st ~block_col ~min_prec:0 in
    Ast.ELet (List.rev !bindings, body)
  end

and parse_case st ~block_col =
  advance st;
  let scrutinee = parse_expr st ~block_col ~min_prec:0 in
  expect_kw st "of";
  if is_eof st then error st "case expression needs an alternative";
  let alt_col = (peek_pos st).col in
  if alt_col <= block_col then
    error st "case alternative is not indented enough";
  let alts = ref [] in
  while (not (is_eof st)) && (peek_pos st).col = alt_col do
    let pat = parse_pattern_single st ~block_col:alt_col in
    expect_sym st "=>";
    let body = parse_expr st ~block_col:alt_col ~min_prec:0 in
    alts := (pat, body) :: !alts
  done;
  if
    (not (is_eof st))
    && (peek_pos st).col > alt_col
    && not (terminates_expression (peek_tok st))
  then error st "unexpected indentation after case alternative";
  if !alts = [] then error st "case expression needs an alternative";
  Ast.ECase (scrutinee, List.rev !alts)

and parse_if st ~block_col =
  advance st;
  let cond = parse_expr st ~block_col ~min_prec:0 in
  expect_kw st "then";
  let yes = parse_expr st ~block_col ~min_prec:0 in
  expect_kw st "else";
  let no = parse_expr st ~block_col ~min_prec:0 in
  Ast.EIf (cond, yes, no)

and parse_pattern_single st ~block_col = parse_pattern_cons st ~block_col

and parse_pattern_cons st ~block_col =
  let lhs = parse_pattern_head st ~block_col in
  if at_sym st "::" && can_continue st block_col then begin
    advance st;
    let rhs = parse_pattern_cons st ~block_col in
    Ast.PCon ("Cons", [ lhs; rhs ])
  end
  else lhs

and parse_pattern_head st ~block_col =
  match peek_tok st with
  | Ident name when upper_first name ->
      advance st;
      let args = parse_pattern_atoms st ~block_col in
      Ast.PCon (name, args)
  | _ -> parse_pattern_atom st ~block_col

and parse_pattern_atoms st ~block_col =
  let rec loop acc =
    if starts_pattern_atom st && can_continue st block_col then
      loop (parse_pattern_atom st ~block_col :: acc)
    else List.rev acc
  in
  loop []

and parse_pattern_atom st ~block_col =
  match peek_tok st with
  | Ident "_" ->
      advance st;
      Ast.PWild
  | Ident name when upper_first name ->
      advance st;
      Ast.PCon (name, [])
  | Ident name ->
      advance st;
      Ast.PVar name
  | Int n ->
      advance st;
      Ast.PInt n
  | Str s ->
      advance st;
      Ast.PStr s
  | Sym "(" ->
      advance st;
      let inner = parse_pattern_single st ~block_col in
      expect_sym st ")";
      inner
  | Sym "[" -> parse_list_pattern st ~block_col
  | tok ->
      error st
        (Printf.sprintf "expected pattern, found %s" (Token.to_string tok))

and parse_list_pattern st ~block_col =
  expect_sym st "[";
  if at_sym st "]" then begin
    advance st;
    Ast.PCon ("Nil", [])
  end
  else begin
    let rec elems acc =
      let pattern = parse_pattern_single st ~block_col in
      if at_sym st "," then begin
        advance st;
        elems (pattern :: acc)
      end
      else begin
        expect_sym st "]";
        List.rev (pattern :: acc)
      end
    in
    let patterns = elems [] in
    List.fold_right
      (fun pattern acc -> Ast.PCon ("Cons", [ pattern; acc ]))
      patterns
      (Ast.PCon ("Nil", []))
  end

and parse_list_expr st ~block_col =
  expect_sym st "[";
  if at_sym st "]" then begin
    advance st;
    Ast.EVar "Nil"
  end
  else begin
    let rec elems acc =
      let expr = parse_expr st ~block_col ~min_prec:0 in
      if at_sym st "," then begin
        advance st;
        elems (expr :: acc)
      end
      else begin
        expect_sym st "]";
        List.rev (expr :: acc)
      end
    in
    let exprs = elems [] in
    List.fold_right
      (fun expr acc -> Ast.EApp (Ast.EVar "Cons", [ expr; acc ]))
      exprs (Ast.EVar "Nil")
  end

let parse_imports st =
  let rec loop acc =
    if at_kw st "import" then begin
      advance st;
      let name = expect_ident st in
      loop (name :: acc)
    end
    else List.rev acc
  in
  loop []

let parse_program_with_imports (source : string) : string list * Ast.program =
  let st = start_state (Lexer.lex source) in
  let imports = parse_imports st in
  if is_eof st then (imports, [])
  else begin
    let block_col = (peek_pos st).col in
    let decls = ref [] in
    while not (is_eof st) do
      if (peek_pos st).col <> block_col then
        error st
          (Printf.sprintf "expected a declaration at column %d" block_col);
      decls := parse_decl st ~block_col :: !decls
    done;
    (imports, List.rev !decls)
  end

let parse_program (source : string) : Ast.program =
  snd (parse_program_with_imports source)

let read_file path =
  let ic = open_in_bin path in
  Fun.protect
    ~finally:(fun () -> close_in_noerr ic)
    (fun () -> really_input_string ic (in_channel_length ic))

let parse_file path = parse_program (read_file path)
let parse_file_with_imports path = parse_program_with_imports (read_file path)
