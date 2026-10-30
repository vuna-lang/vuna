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

(* Self-interpreter: lib/Vuna/Interp.vuna is a vuna program that lexes, parses and
   evaluates vuna source. Tests build a driver program in memory: all
   interpreter declarations except its demo [main], followed by
   [main = interpret <source text>]. *)

let rec find_repo_root dir =
  let has_interp =
    Sys.file_exists (Filename.concat dir "lib/Vuna/Interp.vuna")
  in
  let has_workspace = Sys.file_exists (Filename.concat dir "dune-workspace") in
  if has_interp && has_workspace then Some dir
  else
    let parent = Filename.dirname dir in
    if parent = dir then None else find_repo_root parent

let repo_root =
  match find_repo_root (Sys.getcwd ()) with
  | Some root -> root
  | None -> failwith "cannot locate repository root (lib/Vuna/Interp.vuna)"

let interp_path = Filename.concat repo_root "lib/Vuna/Interp.vuna"
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

let run_interpreter_file root entry =
  let driver =
    Lazy.force interp_decls
    @ [
        Vunax.Ast.DFun
          ( "main",
            [],
            Vunax.Ast.EApp
              ( Vunax.Ast.EVar "interpretFile",
                [ Vunax.Ast.EStr root; Vunax.Ast.EStr entry ] ) );
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

(* M6: drive the vuna-written compiler (Vuna.Interp.compileFile) under the
   interpreter, write the generated OCaml, then build and run it. *)

let ocaml_string_literal s = Printf.sprintf "%S" s

let vuna_compile ~print_result ~root ~entry ~tag =
  if Sys.command ("mkdir -p " ^ codegen_dir) <> 0 then
    failwith ("cannot create " ^ codegen_dir);
  let out = Filename.concat codegen_dir (tag ^ ".vuna.ml") in
  let driver = Filename.concat codegen_dir (tag ^ ".driver.vuna") in
  let source =
    Printf.sprintf
      "import Vuna.Interp\n\n\
       main =\n\
      \  case Vuna.Interp.compileFile %s %s %s of\n\
      \    Vuna.Interp.Ok code => writeFile %s code\n\
      \    Vuna.Interp.Err e => writeFile %s e\n"
      (ocaml_string_literal root)
      (ocaml_string_literal entry)
      (if print_result then "True" else "False")
      (ocaml_string_literal out)
      (ocaml_string_literal (out ^ ".err"))
  in
  let channel = open_out driver in
  output_string channel source;
  close_out channel;
  let module_root = Filename.concat repo_root "lib" in
  let program = Vunax.Loader.load ~root:module_root driver in
  ignore (Vunax.Eval.run program);
  let err = out ^ ".err" in
  if Sys.file_exists err then
    failwith ("vuna compile failed: " ^ String.trim (read_file err));
  read_file out

let build_ocaml_source ~tag source =
  let base = Filename.concat codegen_dir tag in
  let ml = base ^ ".ml" and exe = base ^ ".exe" in
  let channel = open_out ml in
  output_string channel source;
  close_out channel;
  if Sys.command (Printf.sprintf "ocamlopt -w -a -o %s %s" exe ml) <> 0 then
    failwith ("ocamlopt failed for " ^ tag);
  exe

let run_ocaml_source ~tag source = run_binary (build_ocaml_source ~tag source)

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

(* M5 / M4b: app/interp.vuna (entry) imports Vuna.Interp; vunax loads lib/ and
   compiles the flattened program. With [print_result:false] the binary prints
   the interpreted result itself, like `vunax run`. *)

let module_case_dirs = [ "01_functions"; "02_data"; "03_nested" ]

let module_case_dir name =
  Filename.concat (Filename.concat repo_root "vunax/test/corpus/modules") name

let run_vuna_run exe args = run_binary ~args exe

let compiled_interpreter_test =
  Alcotest.test_case "compiled vuna-interp runs programs and modules" `Quick
    (fun () ->
      let root = Filename.concat repo_root "lib" in
      let entry = Filename.concat repo_root "app/interp.vuna" in
      let program = Vunax.Loader.load ~root entry in
      let exe =
        build_binary ~print_result:false ~tag:"compiled_interpreter" program
      in
      sorted_files "corpus/run" ".vuna"
      |> List.iter (fun file ->
          let path = Filename.concat "corpus/run" file in
          let target = Vunax.Parser.parse_file path in
          let expected = Vunax.Eval.show (Vunax.Eval.run target) in
          let actual = run_vuna_run exe [ "--root"; root; path ] in
          Alcotest.(check string) file expected actual);
      List.iter
        (fun name ->
          let dir = module_case_dir name in
          let expected =
            String.trim (read_file (Filename.concat dir "expected.out"))
          in
          let actual =
            run_vuna_run exe
              [
                "--root";
                Filename.concat dir "lib";
                Filename.concat dir "app/Main.vuna";
              ]
          in
          Alcotest.(check string) name expected actual)
        module_case_dirs;
      Alcotest.(check string)
        "usage" "usage: vuna-interp [--root DIR] <file.vuna>" (run_binary exe))

let module_selfhost_tests =
  module_case_dirs
  |> List.map (fun name ->
      Alcotest.test_case name `Quick (fun () ->
          let dir = module_case_dir name in
          let root = Filename.concat dir "lib" in
          let entry = Filename.concat dir "app/Main.vuna" in
          let program = Vunax.Loader.load ~root entry in
          let expected = Vunax.Eval.show (Vunax.Eval.run program) in
          let actual = run_interpreter_file root entry in
          Alcotest.(check string) name expected actual))

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

(* Modules: lib/ root, file = module, fully qualified imports. *)

let load_module_case name =
  let dir = module_case_dir name in
  Vunax.Loader.load
    ~root:(Filename.concat dir "lib")
    (Filename.concat dir "app/Main.vuna")

let module_positive_names = [ "01_functions"; "02_data"; "03_nested" ]

let module_tests =
  module_positive_names
  |> List.map (fun name ->
      Alcotest.test_case name `Quick (fun () ->
          let program = load_module_case name in
          let expected =
            String.trim
              (read_file
                 (Filename.concat (module_case_dir name) "expected.out"))
          in
          let actual = Vunax.Eval.show (Vunax.Eval.run program) in
          Alcotest.(check string) "eval" expected actual;
          let compiled = compile_and_run ~tag:("mod_" ^ name) program in
          Alcotest.(check string) "codegen" expected compiled))

let module_error_cases =
  [
    ("90_missing", "Missing.vuna");
    ("91_cycle", "import cycle");
    ("92_unqualified", "unbound variable three");
    ("93_not_imported", "module B is not imported");
    ("94_unknown", "not exported by Vuna.Math");
    ("95_name", "invalid module name");
  ]

let module_error_tests =
  module_error_cases
  |> List.map (fun (name, fragment) ->
      Alcotest.test_case name `Quick (fun () ->
          match
            try
              ignore (load_module_case name);
              None
            with Vunax.Loader.Error message -> Some message
          with
          | Some message ->
              Alcotest.(check bool) "message" true (contains message fragment)
          | None -> Alcotest.fail ("expected a loader error: " ^ name)))

(* M6: the vuna-written codegen compiles corpus programs and module fixtures;
   the generated OCaml must build and behave like the interpreter. *)

let vuna_codegen_corpus_test =
  Alcotest.test_case "vuna codegen runs corpus programs" `Quick (fun () ->
      let root = Filename.concat repo_root "lib" in
      sorted_files "corpus/run" ".vuna"
      |> List.iter (fun file ->
          let path = Filename.concat "corpus/run" file in
          let program = Vunax.Parser.parse_file path in
          let expected = Vunax.Eval.show (Vunax.Eval.run program) in
          let entry =
            Filename.concat repo_root (Filename.concat "vunax/test" path)
          in
          let base = Filename.remove_extension file in
          let code =
            vuna_compile ~print_result:true ~root ~entry ~tag:("m6_" ^ base)
          in
          let actual = run_ocaml_source ~tag:("m6_run_" ^ base) code in
          Alcotest.(check string) file expected actual))

let vuna_codegen_module_test =
  Alcotest.test_case "vuna codegen runs module fixture" `Quick (fun () ->
      let dir = module_case_dir "02_data" in
      let root = Filename.concat dir "lib" in
      let entry = Filename.concat dir "app/Main.vuna" in
      let expected =
        String.trim (read_file (Filename.concat dir "expected.out"))
      in
      let code =
        vuna_compile ~print_result:true ~root ~entry ~tag:"m6_module"
      in
      Alcotest.(check string)
        "module" expected
        (run_ocaml_source ~tag:"m6_module_run" code))

let vuna_runtime_sync_test =
  Alcotest.test_case "vuna runtimeCode matches vunax runtime" `Quick (fun () ->
      let driver =
        Lazy.force interp_decls
        @ [ Vunax.Ast.DFun ("main", [], Vunax.Ast.EVar "runtimeCode") ]
      in
      Alcotest.(check string)
        "runtime" Vunax.Codegen.runtime
        (Vunax.Eval.run_string driver))

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
      ("modules", module_tests);
      ("module errors", module_error_tests);
      ("modules selfhost", module_selfhost_tests);
      ( "m6 codegen",
        [
          vuna_codegen_corpus_test;
          vuna_codegen_module_test;
          vuna_runtime_sync_test;
        ] );
    ]
