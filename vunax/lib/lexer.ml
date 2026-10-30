open Token

exception Error of pos * string

let keywords =
  [
    "data";
    "case";
    "of";
    "let";
    "in";
    "if";
    "then";
    "else";
    "where";
    "Type";
    "import";
  ]

let is_keyword s = List.mem s keywords

let is_ident_start c =
  (c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || c = '_'

let is_ident_char c = is_ident_start c || (c >= '0' && c <= '9') || c = '\''
let is_digit c = c >= '0' && c <= '9'

let is_op_char = function
  | '!' | '$' | '%' | '&' | '*' | '+' | '-' | '/' | '<' | '=' | '>' | '?' | '@'
  | '\\' | '^' | '|' | '~' | ':' ->
      true
  | _ -> false

let lex (source : string) : located array =
  let n = String.length source in
  let i = ref 0 in
  let line = ref 1 in
  let col = ref 1 in
  let tokens = ref [] in
  let pos () = { line = !line; col = !col } in
  let advance () =
    incr i;
    incr col
  in
  let newline () =
    incr i;
    incr line;
    col := 1
  in
  let error at message = raise (Error (at, message)) in
  let peek_char offset =
    if !i + offset < n then Some source.[!i + offset] else None
  in
  let skip_line_comment () =
    while !i < n && source.[!i] <> '\n' do
      advance ()
    done
  in
  let skip_block_comment start =
    advance ();
    advance ();
    let depth = ref 1 in
    while !depth > 0 do
      if !i >= n then error start "unterminated block comment"
      else
        match (source.[!i], peek_char 1) with
        | '{', Some '-' ->
            advance ();
            advance ();
            incr depth
        | '-', Some '}' ->
            advance ();
            advance ();
            decr depth
        | '\n', _ -> newline ()
        | _ -> advance ()
    done
  in
  let rec skip_trivia () =
    if !i < n then
      match source.[!i] with
      | ' ' | '\t' | '\r' ->
          advance ();
          skip_trivia ()
      | '\n' ->
          newline ();
          skip_trivia ()
      | '-' when peek_char 1 = Some '-' ->
          skip_line_comment ();
          skip_trivia ()
      | '{' when peek_char 1 = Some '-' ->
          skip_block_comment (pos ());
          skip_trivia ()
      | _ -> ()
  in
  while !i < n do
    skip_trivia ();
    if !i < n then begin
      let start = pos () in
      let c = source.[!i] in
      if is_ident_start c then begin
        let begin_at = !i in
        advance ();
        let rec scan_ident () =
          if !i < n then
            let ch = source.[!i] in
            if is_ident_char ch then begin
              advance ();
              scan_ident ()
            end
            else if ch = '.' then
              match peek_char 1 with
              | Some next when is_ident_start next ->
                  advance ();
                  advance ();
                  scan_ident ()
              | _ -> ()
        in
        scan_ident ();
        let text = String.sub source begin_at (!i - begin_at) in
        let tok = if is_keyword text then Kw text else Ident text in
        tokens := { tok; pos = start } :: !tokens
      end
      else if is_digit c then begin
        let begin_at = !i in
        while !i < n && is_digit source.[!i] do
          advance ()
        done;
        (match peek_char 0 with
        | Some next when is_ident_char next ->
            error (pos ()) "invalid integer literal"
        | _ -> ());
        let text = String.sub source begin_at (!i - begin_at) in
        tokens := { tok = Int (int_of_string text); pos = start } :: !tokens
      end
      else if c = '"' then begin
        advance ();
        let buffer = Buffer.create 16 in
        let rec loop () =
          if !i >= n then error start "unterminated string literal"
          else
            match source.[!i] with
            | '"' -> advance ()
            | '\n' -> error start "unterminated string literal"
            | '\\' ->
                advance ();
                if !i >= n then error start "unterminated string literal";
                (match source.[!i] with
                | 'n' -> Buffer.add_char buffer '\n'
                | 't' -> Buffer.add_char buffer '\t'
                | 'r' -> Buffer.add_char buffer '\r'
                | '\\' -> Buffer.add_char buffer '\\'
                | '"' -> Buffer.add_char buffer '"'
                | '\'' -> Buffer.add_char buffer '\''
                | other ->
                    error (pos ())
                      (Printf.sprintf "unknown escape sequence \\%c" other));
                advance ();
                loop ()
            | ch ->
                Buffer.add_char buffer ch;
                advance ();
                loop ()
        in
        loop ();
        tokens := { tok = Str (Buffer.contents buffer); pos = start } :: !tokens
      end
      else if c = '(' || c = ')' || c = '[' || c = ']' || c = ',' then begin
        advance ();
        tokens := { tok = Sym (String.make 1 c); pos = start } :: !tokens
      end
      else if is_op_char c then begin
        let begin_at = !i in
        while !i < n && is_op_char source.[!i] do
          advance ()
        done;
        tokens :=
          {
            tok = Sym (String.sub source begin_at (!i - begin_at));
            pos = start;
          }
          :: !tokens
      end
      else error start (Printf.sprintf "unexpected character %C" c)
    end
  done;
  Array.of_list (List.rev ({ tok = Eof; pos = pos () } :: !tokens))
