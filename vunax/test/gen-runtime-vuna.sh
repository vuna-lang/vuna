#!/bin/sh
# 从 vunax/lib/codegen.ml 的 {vuna_runtime|...|vuna_runtime} 生成 vuna 字符串常量。
# 输出形如 `runtimeCode = "..."`，用于插入 lib/Vuna/Interp.vuna。
set -eu
perl -0777 -ne '
  if (/\{vuna_runtime\|\n(.*?)\|vuna_runtime\}/s) {
    my $t=$1;
    $t =~ s/\\/\\\\/g;
    $t =~ s/"/\\"/g;
    $t =~ s/\n/\\n/g;
    $t =~ s/\t/\\t/g;
    $t =~ s/\r/\\r/g;
    print "-- 由 vunax/lib/codegen.ml 的 runtime 生成，勿手改（见 vunax/test/gen-runtime-vuna.sh）\n";
    print "runtimeCode = \"\\n$t\"\n";
  } else { die "runtime not found" }
' "$1"
