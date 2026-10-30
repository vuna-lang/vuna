let test_banner () =
  Alcotest.(check string)
    "banner" "vunax: external vuna compiler (written in OCaml)" Vunax.banner

let test_version () = Alcotest.(check string) "version" "0.1.0" Vunax.version

let () =
  Alcotest.run "vunax"
    [
      ( "core",
        [
          Alcotest.test_case "banner" `Quick test_banner;
          Alcotest.test_case "version" `Quick test_version;
        ] );
    ]
