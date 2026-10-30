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

let run_driver_path = Filename.concat repo_root "app/run.vuna"
let run_driver_decls = lazy (Vunax.Parser.parse_file run_driver_path)

(* The interpreter plus app/run.vuna's file-reading entry point. *)
let driver_program = lazy (Lazy.force interp_decls @ Lazy.force run_driver_decls)

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

(* Code generation: render vuna to OCaml, build it with ocamlopt, run it and
   compare its stdout with the interpreter's [show] result. *)

let ocamlopt_available =
  lazy (Sys.command "command -v ocamlopt > /dev/null 2>&1" = 0)

let codegen_dir = "_codegen_tmp"

let build_binary ?(print_result = true) ~tag program =
  if not (Lazy.force ocamlopt_available) then
    failwith "ocamlopt is required for the codegen tests but was not found";
  let source = Vunax.Codegen.generate ~print_result program in
  if Sys.command ("mkdir -p " ^ codegen_dir) <> 0 then
    failwith ("cannot create " ^ codegen_dir);
  let base = Filename.concat codegen_dir tag in
  let ml = base ^ ".ml" and exe = base ^ ".exe" in
  let channel = open_out ml in
  output_string channel source;
  close_out channel;
  if Sys.command (Printf.sprintf "ocamlopt -w -a -o %s %s" exe ml) <> 0 then
    failwith ("ocamlopt failed for " ^ tag);
  exe

let run_binary ?(args = []) exe =
  let out = exe ^ ".out" in
  let quoted_args =
    String.concat "" (List.map (fun arg -> " " ^ Filename.quote arg) args)
  in
  if Sys.command (Printf.sprintf "./%s%s > %s" exe quoted_args out) <> 0 then
    failwith ("generated program failed: " ^ exe);
  String.trim (read_file out)

let compile_and_run ?(args = []) ~tag program =
  run_binary ~args (build_binary ~tag program)

let compile_tests =
  sorted_files "corpus/run" ".vuna"
  |> List.map (fun file ->
      Alcotest.test_case file `Quick (fun () ->
          let path = Filename.concat "corpus/run" file in
          let program = Vunax.Parser.parse_file path in
          let expected = Vunax.Eval.show (Vunax.Eval.run program) in
          let actual =
            compile_and_run ~tag:(Filename.remove_extension file) program
          in
          Alcotest.(check string) file expected actual))

let compile_self_test =
  Alcotest.test_case "compiles its own interpreter" `Quick (fun () ->
      let program = Lazy.force interp_program in
      let expected = Vunax.Eval.show (Vunax.Eval.run program) in
      let actual = compile_and_run ~tag:"self_interpreter" program in
      Alcotest.(check string) "self compile" expected actual)

(* M4b: the interpreter plus app/run.vuna compiled to a native binary with
   [print_result:false]. app/run.vuna prints the interpreted result itself, so
   the binary behaves like `vunax run <file>` (raw [show], one newline). *)

let compiled_interpreter_test =
  Alcotest.test_case "compiled interpreter runs corpus files" `Quick (fun () ->
      let exe =
        build_binary ~print_result:false ~tag:"compiled_interpreter"
          (Lazy.force driver_program)
      in
      sorted_files "corpus/run" ".vuna"
      |> List.iter (fun file ->
          let path = Filename.concat "corpus/run" file in
          let program = Vunax.Parser.parse_file path in
          let expected = Vunax.Eval.show (Vunax.Eval.run program) in
          let actual = run_binary ~args:[ path ] exe in
          Alcotest.(check string) file expected actual);
      Alcotest.(check string)
        "usage" "usage: vuna-run <file.vuna>" (run_binary exe))

let expect_codegen_error name source =
  Alcotest.test_case name `Quick (fun () ->
      let program = Vunax.Parser.parse_program source in
      match
        try
          ignore (Vunax.Codegen.generate program);
          None
        with Vunax.Codegen.Error message -> Some message
      with
      | Some _ -> ()
      | None -> Alcotest.fail ("expected a codegen error: " ^ name))

let codegen_error_tests =
  [
    expect_codegen_error "missing main" "x = 1";
    expect_codegen_error "unbound variable" "main = nope 1";
    expect_codegen_error "clause arity mismatch" "f x = x\nf x y = y\nmain = 0";
  ]

(* IO builtins: files, stdout and process arguments. *)

let io_dir = "_io_tmp"

let ensure_io_dir () =
  if Sys.command ("mkdir -p " ^ io_dir) <> 0 then
    failwith ("cannot create " ^ io_dir)

let io_path name = Filename.concat io_dir name

let contains text needle =
  let needle_length = String.length needle in
  let text_length = String.length text in
  let rec go index =
    index + needle_length <= text_length
    && (String.sub text index needle_length = needle || go (index + 1))
  in
  go 0

let eval_io_tests =
  [
    Alcotest.test_case "getArgs" `Quick (fun () ->
        let program = Vunax.Parser.parse_program "main = getArgs" in
        let actual =
          Vunax.Eval.show (Vunax.Eval.run_with_args [ "alpha"; "beta" ] program)
        in
        Alcotest.(check string)
          "getArgs" "(Cons \"alpha\" (Cons \"beta\" Nil))" actual);
    Alcotest.test_case "writeFile/readFile roundtrip" `Quick (fun () ->
        ensure_io_dir ();
        let program =
          Vunax.Parser.parse_program
            "main = let n = writeFile \"_io_tmp/eval.txt\" \"hello\" in \
             readFile \"_io_tmp/eval.txt\""
        in
        Alcotest.(check string)
          "roundtrip" "\"hello\""
          (Vunax.Eval.show (Vunax.Eval.run program)));
    Alcotest.test_case "readFile failure" `Quick (fun () ->
        let program =
          Vunax.Parser.parse_program
            "main = strLength (readFile \"_io_tmp/does-not-exist.txt\")"
        in
        match
          try
            ignore (Vunax.Eval.run program);
            None
          with Vunax.Eval.Error message -> Some message
        with
        | Some message ->
            Alcotest.(check bool)
              "mentions readFile" true
              (contains message "readFile")
        | None -> Alcotest.fail "expected a readFile runtime error");
    Alcotest.test_case "print returns the written length" `Quick (fun () ->
        let program = Vunax.Parser.parse_program "main = print \"\"" in
        Alcotest.(check string)
          "print" "0"
          (Vunax.Eval.show (Vunax.Eval.run program)));
  ]

let codegen_io_tests =
  [
    Alcotest.test_case "writeFile/readFile" `Quick (fun () ->
        ensure_io_dir ();
        let program =
          Vunax.Parser.parse_program
            "main = let n = writeFile \"_io_tmp/gen.txt\" \"hi\" in strLength \
             (readFile \"_io_tmp/gen.txt\")"
        in
        let actual = compile_and_run ~tag:"io_roundtrip" program in
        Alcotest.(check string) "length" "2" actual;
        Alcotest.(check string)
          "file contents" "hi"
          (read_file (io_path "gen.txt")));
    Alcotest.test_case "getArgs" `Quick (fun () ->
        let program = Vunax.Parser.parse_program "main = getArgs" in
        let actual =
          compile_and_run ~tag:"io_args" ~args:[ "x"; "y" ] program
        in
        Alcotest.(check string) "args" "(Cons \"x\" (Cons \"y\" Nil))" actual);
  ]

let selfhost_io_tests =
  let make name source =
    Alcotest.test_case name `Quick (fun () ->
        ensure_io_dir ();
        let program = Vunax.Parser.parse_program source in
        let expected = Vunax.Eval.show (Vunax.Eval.run program) in
        let actual = run_self source in
        Alcotest.(check string) name expected actual)
  in
  [
    make "readFile" "main = readFile \"corpus/run/01_arithmetic.vuna\"";
    make "writeFile/readFile"
      "main = let n = writeFile \"_io_tmp/interp.txt\" \"abc\" in readFile \
       \"_io_tmp/interp.txt\"";
  ]

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
      ("codegen", compile_tests);
      ("codegen self", [ compile_self_test ]);
      ("m4b compiled interpreter", [ compiled_interpreter_test ]);
      ("codegen error", codegen_error_tests);
      ("io", eval_io_tests);
      ("io codegen", codegen_io_tests);
      ("io selfhost", selfhost_io_tests);
    ]
