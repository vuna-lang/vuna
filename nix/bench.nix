{ pkgs, ocamlTools }:
let
  inherit (pkgs) lib;

  tools = ocamlTools ++ [
    pkgs.bash
    pkgs.coreutils
    pkgs.diffutils
    pkgs.gawk
    pkgs.gnugrep
    pkgs.gnused
  ];
in
pkgs.writeShellScriptBin "vuna-bench" ''
  export PATH="${lib.makeBinPath tools}:$PATH"
  exec ${pkgs.bash}/bin/bash ${./bench.sh} "$@"
''
