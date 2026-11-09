#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 61) F3 P2：特权边界。
#   - 非特权包不能 import 宿主层模块 Base.IO.Host（LD_HostModulePrivileged）；
#   - 非特权包不能声明 [capabilities]/[trust]（manifest 校验）；
#   - 特权包（[package] privileged = true）可以 import/宿主调用。
section_begin

p61="$tmp/p2-privileged"
rm -rf "$p61"
mkdir -p "$p61/np-host/app" "$p61/np-caps/app" "$p61/priv-host/app"

printf '[package]\nname = "np-host"\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$p61/np-host/vuna.toml"
printf 'import Base.IO.Host\n\nmain : IO Int\nmain = exit 0\n' >"$p61/np-host/app/Main.vuna"
np_host=$(VUNA_BASE="$VUNA_BASE" "$VUNA" check "$p61/np-host/app/Main.vuna" 2>&1)
np_host_code=$?
check_eq "p2 non-privileged host import exit" "1" "$np_host_code"
check_contains "p2 non-privileged host import diagnostic" "$np_host" "LD_HostModulePrivileged"

printf '[package]\nname = "np-caps"\n\n[capabilities]\neffects = ["console"]\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$p61/np-caps/vuna.toml"
printf 'main : Int\nmain = 1\n' >"$p61/np-caps/app/Main.vuna"
np_caps=$(VUNA_BASE="$VUNA_BASE" "$VUNA" check "$p61/np-caps/app/Main.vuna" 2>&1)
np_caps_code=$?
check_eq "p2 non-privileged capabilities exit" "1" "$np_caps_code"
check_contains "p2 non-privileged capabilities diagnostic" "$np_caps" "non-privileged package declares"

printf '[package]\nname = "priv-host"\nprivileged = true\n\n[capabilities]\neffects = ["console", "unsafe"]\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$p61/priv-host/vuna.toml"
printf 'import Base.IO.Host\n\nmain : IO Int\nmain = exit 0\n' >"$p61/priv-host/app/Main.vuna"
priv_host=$(VUNA_BASE="$VUNA_BASE" "$VUNA" check "$p61/priv-host/app/Main.vuna" 2>&1)
priv_host_code=$?
check_eq "p2 privileged host import exit" "0" "$priv_host_code"

printf 'import Base.IO.Host\n\nmain : Int\nmain = 1\n' >"$p61/adhoc.vuna"
np_adhoc=$(VUNA_BASE="$VUNA_BASE" "$VUNA" check "$p61/adhoc.vuna" 2>&1)
np_adhoc_code=$?
check_eq "p2 ad-hoc host import exit" "1" "$np_adhoc_code"
check_contains "p2 ad-hoc host import diagnostic" "$np_adhoc" "LD_HostModulePrivileged"


# REPL：默认非特权（import Host 被拒），--privileged 显式放行。
repl_np=$(cd "$p61" && printf 'import Base.IO.Host\nprint "hi"\n:q\n' | VUNA_BASE="$VUNA_BASE" "$VUNA" repl 2>&1)
check_contains "p2 repl non-privileged host import" "$repl_np" "LD_HostModulePrivileged"
repl_p=$(cd "$p61" && printf 'import Base.IO.Host\nprint "hi"\n:q\n' | VUNA_BASE="$VUNA_BASE" "$VUNA" repl --privileged 2>&1)
case "$repl_p" in
  *LD_HostModulePrivileged*) bad "p2 repl privileged host import" "no LD_HostModulePrivileged" "$repl_p" ;;
  *) ok ;;
esac


# 非特权包声明 [privileged] modules 也报错。
printf '[package]\nname = "np-decl"\n\n[privileged]\nmodules = ["Base.IO.Host"]\n\n[dependencies]\nvuna-base = "%s"\n' "$VUNA_BASE" >"$p61/np-decl.toml.tmp"
mkdir -p "$p61/np-decl/app"
mv "$p61/np-decl.toml.tmp" "$p61/np-decl/vuna.toml"
printf 'main : Int\nmain = 1\n' >"$p61/np-decl/app/Main.vuna"
np_decl=$(VUNA_BASE="$VUNA_BASE" "$VUNA" check "$p61/np-decl/app/Main.vuna" 2>&1)
np_decl_code=$?
check_eq "p2 non-privileged [privileged] exit" "1" "$np_decl_code"
check_contains "p2 non-privileged [privileged] diagnostic" "$np_decl" "non-privileged package declares"

finish
