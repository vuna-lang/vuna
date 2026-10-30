#!/usr/bin/env bash
# Regenerate the golden AST / output / error files of the test corpus.
set -euo pipefail

root="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$root"

for src in vunax/test/corpus/ok/*.vuna; do
  dune exec vunax -- parse "$src" >"${src%.vuna}.sexp"
done

for src in vunax/test/corpus/run/*.vuna; do
  dune exec vunax -- run "$src" >"${src%.vuna}.out"
done

tmp="$(mktemp)"
trap 'rm -f "$tmp"' EXIT

for src in vunax/test/corpus/err/*.vuna; do
  if dune exec vunax -- parse "$src" >/dev/null 2>"$tmp"; then
    echo "expected $src to fail to parse" >&2
    exit 1
  fi
  sed -E 's/^[^:]+:([0-9]+:[0-9]+: )/\1/' "$tmp" >"${src%.vuna}.err"
done

for src in vunax/test/corpus/run_err/*.vuna; do
  if dune exec vunax -- run "$src" >/dev/null 2>"$tmp"; then
    echo "expected $src to fail to run" >&2
    exit 1
  fi
  sed -E 's/^[^:]+: runtime error: //' "$tmp" >"${src%.vuna}.err"
done