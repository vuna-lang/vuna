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

let version_tests =
  [
    Alcotest.test_case "banner" `Quick (fun () ->
        Alcotest.(check string)
          "banner" "vunax: external vuna compiler (written in OCaml)"
          Vunax.Version.banner);
    Alcotest.test_case "version" `Quick (fun () ->
        Alcotest.(check string) "version" "0.1.0" Vunax.Version.version);
  ]

let () =
  Alcotest.run "vunax"
    [
      ("version", version_tests);
      ("parse", ok_tests);
      ("parse error", error_tests);
    ]
