let report_error file pos message =
  Printf.eprintf "%s:%s: %s\n" file (Vunax.Token.pos_to_string pos) message

let default_root = "lib"

let parse file =
  let program = Vunax.Parser.parse_file file in
  print_endline (Vunax.Ast.sexp_of_program program)

let load ~root file = Vunax.Loader.load ~root file

let run ~root args file =
  let program = load ~root file in
  print_endline (Vunax.Eval.show (Vunax.Eval.run_with_args args program))

let compile ~root ~print_result file =
  let program = load ~root file in
  print_string (Vunax.Codegen.generate ~print_result program)

let take_root args =
  match args with
  | "--root" :: dir :: rest -> (Some dir, rest)
  | _ -> (None, args)

let compile_flags args =
  let rec go print_result root = function
    | "--no-print" :: rest -> go false root rest
    | "--root" :: dir :: rest -> go print_result (Some dir) rest
    | rest -> (print_result, Option.value ~default:default_root root, rest)
  in
  go true None args

let handle file action =
  try action () with
  | Vunax.Lexer.Error (pos, message) ->
      report_error file pos message;
      exit 1
  | Vunax.Parser.Error (pos, message) ->
      report_error file pos message;
      exit 1
  | Vunax.Loader.Error message ->
      Printf.eprintf "vunax: %s\n" message;
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
  print_endline
    "usage: vunax (parse|run|compile) [--root DIR] <file.vuna> [args...]";
  exit 2

let () =
  match Array.to_list Sys.argv with
  | [ _; "--version" ] ->
      Printf.printf "%s %s\n" Vunax.Version.banner Vunax.Version.version
  | _ :: "parse" :: [ file ] -> handle file (fun () -> parse file)
  | _ :: "run" :: rest -> (
      let root, rest = take_root rest in
      let root = Option.value ~default:default_root root in
      match rest with
      | file :: args -> handle file (fun () -> run ~root args file)
      | [] -> usage ())
  | _ :: "compile" :: rest -> (
      let print_result, root, rest = compile_flags rest in
      match rest with
      | [ file ] -> handle file (fun () -> compile ~root ~print_result file)
      | _ -> usage ())
  | _ -> usage ()
