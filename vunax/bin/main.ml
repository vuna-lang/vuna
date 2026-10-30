let report_error file pos message =
  Printf.eprintf "%s:%s: %s\n" file (Vunax.Token.pos_to_string pos) message

let parse file =
  let program = Vunax.Parser.parse_file file in
  print_endline (Vunax.Ast.sexp_of_program program)

let () =
  match Array.to_list Sys.argv with
  | [ _; "--version" ] ->
      Printf.printf "%s %s\n" Vunax.Version.banner Vunax.Version.version
  | [ _; "parse"; file ] -> (
      try parse file with
      | Vunax.Lexer.Error (pos, message) ->
          report_error file pos message;
          exit 1
      | Vunax.Parser.Error (pos, message) ->
          report_error file pos message;
          exit 1
      | Sys_error message ->
          Printf.eprintf "vunax: %s\n" message;
          exit 1)
  | _ ->
      Printf.printf "%s %s\n" Vunax.Version.banner Vunax.Version.version;
      print_endline "usage: vunax parse <file.vuna>";
      exit 2
