let report_error file pos message =
  Printf.eprintf "%s:%s: %s\n" file (Vunax.Token.pos_to_string pos) message

let parse file =
  let program = Vunax.Parser.parse_file file in
  print_endline (Vunax.Ast.sexp_of_program program)

let run args file =
  let program = Vunax.Parser.parse_file file in
  print_endline (Vunax.Eval.show (Vunax.Eval.run_with_args args program))

let compile file =
  let program = Vunax.Parser.parse_file file in
  print_string (Vunax.Codegen.generate program)

let handle file action =
  try action () with
  | Vunax.Lexer.Error (pos, message) ->
      report_error file pos message;
      exit 1
  | Vunax.Parser.Error (pos, message) ->
      report_error file pos message;
      exit 1
  | Vunax.Eval.Error message ->
      Printf.eprintf "%s: runtime error: %s\n" file message;
      exit 1
  | Vunax.Codegen.Error message ->
      Printf.eprintf "%s: codegen error: %s\n" file message;
      exit 1
  | Sys_error message ->
      Printf.eprintf "vunax: %s\n" message;
      exit 1

let usage () =
  Printf.printf "%s %s\n" Vunax.Version.banner Vunax.Version.version;
  print_endline "usage: vunax (parse|run|compile) <file.vuna> [args...]";
  exit 2

let () =
  match Array.to_list Sys.argv with
  | [ _; "--version" ] ->
      Printf.printf "%s %s\n" Vunax.Version.banner Vunax.Version.version
  | _ :: "parse" :: [ file ] -> handle file (fun () -> parse file)
  | _ :: "run" :: file :: args -> handle file (fun () -> run args file)
  | _ :: "compile" :: [ file ] -> handle file (fun () -> compile file)
  | _ -> usage ()
