#!/bin/sh
set -u
. "$(dirname "$0")/../lib/harness.sh"

# 62) P2c 标签：Args / Stdin / Exit（runArgs / runStdin / runExit 单效应入口）。
section_begin
d62="$tmp/p2c-labels"
rm -rf "$d62"
mk() { # name manifest source
  mkdir -p "$d62/$1/app"
  printf '%s\n' "$2" >"$d62/$1/vuna.toml"
  printf '%s\n' "$3" >"$d62/$1/app/Main.vuna"
  "$VUNA" build "$d62/$1" >"$tmp/$1-build.log" 2>&1
}
MANIFEST=$(printf '[package]\nname = "%s"\n\n[dependencies]\nvuna-base = "%s"' "$(echo p2c-args)" "$VUNA_BASE")

mk p2c-args "$(printf '[package]\nname = "p2c-args"\n\n[dependencies]\nvuna-base = "%s"' "$VUNA_BASE")" 'import Base.Eff
import Base.EffArgs
import Base.List

prog : Eff [Args "real"] Int
prog = do
  xs <- argsGetArgs "real"
  pure (natToInt (length xs))

main : IO Int
main = runArgs "real" prog'
if [ $? -eq 0 ]; then
  out=$(run_bin "$d62/p2c-args/.output/bin/p2c-args" 2>/dev/null)
  check_contains "p2c labels args" "$out" "0"
else
  bad "p2c labels args build" "exit 0" "$(tail -3 "$tmp/p2c-args-build.log")"
fi

mk p2c-stdin "$(printf '[package]\nname = "p2c-stdin"\n\n[dependencies]\nvuna-base = "%s"' "$VUNA_BASE")" 'import Base.Eff
import Base.EffStdin
import Base.String

prog : Eff [Stdin "real"] String
prog = stdinReadLine "real"

main : IO Int
main = do
  s <- runStdin "real" prog
  pure (strLength s)'
if [ $? -eq 0 ]; then
  out=$(printf '' | run_bin "$d62/p2c-stdin/.output/bin/p2c-stdin" 2>/dev/null)
  check_contains "p2c labels stdin" "$out" "0"
else
  bad "p2c labels stdin build" "exit 0" "$(tail -3 "$tmp/p2c-stdin-build.log")"
fi

mk p2c-exit "$(printf '[package]\nname = "p2c-exit"\n\n[dependencies]\nvuna-base = "%s"' "$VUNA_BASE")" 'import Base.Eff
import Base.EffExit

prog : Eff [Exit "real"] Int
prog = exitWith "real" 3

main : IO Int
main = runExit "real" prog'
if [ $? -eq 0 ]; then
  run_bin "$d62/p2c-exit/.output/bin/p2c-exit" >/dev/null 2>&1
  check_eq "p2c labels exit code" "3" "$?"
else
  bad "p2c labels exit build" "exit 0" "$(tail -3 "$tmp/p2c-exit-build.log")"
fi
finish
