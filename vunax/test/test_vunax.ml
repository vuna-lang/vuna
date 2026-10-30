let read_file path =
  let ic = open_in_bin path in
  Fun.protect
    ~finally:(fun () -> close_in_noerr ic)
    (fun () -> really_input_string ic (in_channel_length ic))

let sorted_files dir suffix =
  Sys.readdir dir |> Array.to_list
  |> List.filter (fun name -> Filename.check_suffix name suffix)
  |> List.sort String.compare

let parse_error_text file =
  let path = Filename.concat "corpus/err" file in
  try
    ignore (Vunax.Parser.parse_file path);
    "no error"
  with Vunax.Lexer.Error (pos, message) | Vunax.Parser.Error (pos, message) ->
    Vunax.Token.pos_to_string pos ^ ": " ^ message

let run_output file =
  let path = Filename.concat "corpus/run" file in
  Vunax.Eval.show (Vunax.Eval.run (Vunax.Parser.parse_file path))

let run_error_text file =
  let path = Filename.concat "corpus/run_err" file in
  try
    ignore (Vunax.Eval.run (Vunax.Parser.parse_file path));
    "no error"
  with Vunax.Eval.Error message -> message

let ok_tests =
  sorted_files "corpus/ok" ".vuna"
  |> List.map (fun file ->
      Alcotest.test_case file `Quick (fun () ->
          let path = Filename.concat "corpus/ok" file in
          let actual =
            String.trim
              (Vunax.Ast.sexp_of_program (Vunax.Parser.parse_file path))
          in
          let expected_path =
            Filename.concat "corpus/ok"
              (Filename.remove_extension file ^ ".sexp")
          in
          Alcotest.(check string)
            file
            (String.trim (read_file expected_path))
            actual))

let error_tests =
  sorted_files "corpus/err" ".vuna"
  |> List.map (fun file ->
      Alcotest.test_case file `Quick (fun () ->
          let expected_path =
            Filename.concat "corpus/err"
              (Filename.remove_extension file ^ ".err")
          in
          Alcotest.(check string)
            file
            (String.trim (read_file expected_path))
            (String.trim (parse_error_text file))))

let run_tests =
  sorted_files "corpus/run" ".vuna"
  |> List.map (fun file ->
      Alcotest.test_case file `Quick (fun () ->
          let expected_path =
            Filename.concat "corpus/run"
              (Filename.remove_extension file ^ ".out")
          in
          Alcotest.(check string)
            file
            (String.trim (read_file expected_path))
            (String.trim (run_output file))))

let run_error_tests =
  sorted_files "corpus/run_err" ".vuna"
  |> List.map (fun file ->
      Alcotest.test_case file `Quick (fun () ->
          let expected_path =
            Filename.concat "corpus/run_err"
              (Filename.remove_extension file ^ ".err")
          in
          Alcotest.(check string)
            file
            (String.trim (read_file expected_path))
            (String.trim (run_error_text file))))

let version_tests =
  [
    Alcotest.test_case "banner" `Quick (fun () ->
        Alcotest.(check string)
          "banner" "vunax: external vuna compiler (written in OCaml)"
          Vunax.Version.banner);
    Alcotest.test_case "version" `Quick (fun () ->
        Alcotest.(check string) "version" "0.1.0" Vunax.Version.version);
  ]

(* Self-interpreter: app/interp.vuna is a vuna program that lexes, parses and
   evaluates vuna source. Tests build a driver program in memory: all
   interpreter declarations except its demo [main], followed by
   [main = interpret <source text>]. *)

let rec find_repo_root dir =
  let has_interp = Sys.file_exists (Filename.concat dir "app/interp.vuna") in
  let has_workspace = Sys.file_exists (Filename.concat dir "dune-workspace") in
  if has_interp && has_workspace then Some dir
  else
    let parent = Filename.dirname dir in
    if parent = dir then None else find_repo_root parent

let repo_root =
  match find_repo_root (Sys.getcwd ()) with
  | Some root -> root
  | None -> failwith "cannot locate repository root (app/interp.vuna)"

let interp_path = Filename.concat repo_root "app/interp.vuna"
let interp_source = lazy (read_file interp_path)
let interp_program = lazy (Vunax.Parser.parse_file interp_path)

let interp_decls =
  lazy
    (List.filter
       (function Vunax.Ast.DFun ("main", _, _) -> false | _ -> true)
       (Lazy.force interp_program))

let run_self source =
  let driver =
    Lazy.force interp_decls
    @ [
        Vunax.Ast.DFun
          ( "main",
            [],
            Vunax.Ast.EApp
              (Vunax.Ast.EVar "interpret", [ Vunax.Ast.EStr source ]) );
      ]
  in
  Vunax.Eval.run_string driver

let selfhost_tests =
  sorted_files "corpus/run" ".vuna"
  |> List.map (fun file ->
      Alcotest.test_case file `Quick (fun () ->
          let path = Filename.concat "corpus/run" file in
          let program = Vunax.Parser.parse_file path in
          let expected = Vunax.Eval.show (Vunax.Eval.run program) in
          let actual = run_self (read_file path) in
          Alcotest.(check string) file expected actual))

let self_application_test =
  Alcotest.test_case "interprets its own source" `Quick (fun () ->
      let program = Lazy.force interp_program in
      let expected = Vunax.Eval.show (Vunax.Eval.run program) in
      let actual = run_self (Lazy.force interp_source) in
      Alcotest.(check string) "self" expected actual)

let () =
  Alcotest.run "vunax"
    [
      ("version", version_tests);
      ("parse", ok_tests);
      ("parse error", error_tests);
      ("run", run_tests);
      ("run error", run_error_tests);
      ("selfhost", selfhost_tests);
      ("self application", [ self_application_test ]);
    ]
