#!/bin/sh
# Self-check for the bundled Vuna VS Code extension.
#
# Usable standalone and from a Nix check:
#     sh vscode/check.sh
#
# Root discovery: `VUNA_VSCODE_ROOT` if set, otherwise the directory of this
# script, the current directory, or `<cwd>/vscode` - whichever looks like the
# extension root. This makes the script work both in-tree and from a Nix store
# copy (where `$0` is a bare file but the cwd holds the copied `vscode/` tree).
#
# Requirements: POSIX sh + `node` on PATH (used for JSON parsing and
# `node --check`). Exits non-zero if any check fails.
set -u

ROOT=
if [ -n "${VUNA_VSCODE_ROOT:-}" ]; then
  ROOT=$VUNA_VSCODE_ROOT
else
  SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd) || exit 1
  PWD_NOW=$(pwd)
  for candidate in "$SCRIPT_DIR" "$PWD_NOW" "$PWD_NOW/vscode"; do
    if [ -f "$candidate/package.json" ] && [ -f "$candidate/src/extension.ts" ]; then
      ROOT=$candidate
      break
    fi
  done
fi
if [ -z "$ROOT" ]; then
  printf 'FAIL: cannot locate the vscode extension root (set VUNA_VSCODE_ROOT)\n' >&2
  exit 1
fi
cd "$ROOT" || exit 1

FAILED=0
fail() {
  printf 'FAIL: %s\n' "$1" >&2
  FAILED=1
}

if ! command -v node >/dev/null 2>&1; then
  printf 'FAIL: node not found on PATH (needed for JSON checks and `node --check`)\n' >&2
  exit 1
fi

# --- plain files -----------------------------------------------------------
for file in \
  package.json \
  tsconfig.json \
  src/extension.ts \
  scripts/build.mjs \
  dist/extension.js \
  syntaxes/vuna.tmLanguage.json \
  language-configuration.json \
  snippets/vuna.json \
  README.md \
  .vscodeignore
do
  [ -f "$file" ] || fail "missing file: $file"
done

# --- manifest / grammar / language config / snippets (JSON semantics) ------
if node - <<'NODE'
const fs = require('fs');
const path = require('path');

const problems = [];
const fail = (message) => problems.push(message);

function readJson(file) {
  try {
    return JSON.parse(fs.readFileSync(file, 'utf8'));
  } catch (error) {
    fail(`${file}: invalid JSON (${error.message})`);
    return undefined;
  }
}

const pkg = readJson('package.json');
if (!pkg) {
  console.log(problems.join('\n'));
  process.exit(1);
}

if (!pkg.engines || typeof pkg.engines.vscode !== 'string') {
  fail('package.json: engines.vscode is missing');
}
if (pkg.main !== './dist/extension.js') {
  fail(`package.json: main must be "./dist/extension.js" (got ${JSON.stringify(pkg.main)})`);
}
if (!fs.existsSync(path.join('.', pkg.main || ''))) {
  fail(`package.json: main entry ${JSON.stringify(pkg.main)} does not exist`);
}
if (!Array.isArray(pkg.activationEvents) || !pkg.activationEvents.includes('onLanguage:vuna')) {
  fail('package.json: activationEvents must contain "onLanguage:vuna"');
}

const dependency = pkg.dependencies && pkg.dependencies['vscode-languageclient'];
if (typeof dependency !== 'string' || !/^\^?9\./.test(dependency)) {
  fail(`package.json: dependencies.vscode-languageclient must be ^9 (got ${JSON.stringify(dependency)})`);
}

const scripts = pkg.scripts || {};
for (const name of ['build', 'typecheck', 'package']) {
  if (typeof scripts[name] !== 'string' || !scripts[name]) fail(`package.json: scripts.${name} is missing`);
}

const contributes = pkg.contributes || {};

const language = (contributes.languages || []).find((entry) => entry && entry.id === 'vuna');
if (!language) {
  fail('package.json: contributes.languages is missing the "vuna" language');
} else {
  if (!Array.isArray(language.extensions) || !language.extensions.includes('.vuna')) {
    fail('package.json: the "vuna" language must declare the .vuna extension');
  }
  const configurationPath = language.configuration;
  if (typeof configurationPath !== 'string') {
    fail('package.json: the "vuna" language must point at a configuration file');
  } else if (!fs.existsSync(configurationPath)) {
    fail(`language configuration does not exist: ${configurationPath}`);
  }
}

const grammar = (contributes.grammars || []).find(
  (entry) => entry && entry.language === 'vuna',
);
if (!grammar) {
  fail('package.json: contributes.grammars is missing the vuna grammar');
} else {
  if (grammar.scopeName !== 'source.vuna') {
    fail(`grammar scopeName must be "source.vuna" (got ${JSON.stringify(grammar.scopeName)})`);
  }
  if (typeof grammar.path !== 'string' || !fs.existsSync(grammar.path)) {
    fail(`grammar file does not exist: ${JSON.stringify(grammar.path)}`);
  } else {
    const parsedGrammar = readJson(grammar.path);
    if (parsedGrammar) {
      if (parsedGrammar.scopeName !== 'source.vuna') {
        fail(`${grammar.path}: scopeName must be "source.vuna" (got ${JSON.stringify(parsedGrammar.scopeName)})`);
      }
      if (!Array.isArray(parsedGrammar.patterns) || parsedGrammar.patterns.length === 0) {
        fail(`${grammar.path}: "patterns" must be a non-empty array`);
      }
      if (!parsedGrammar.repository || typeof parsedGrammar.repository !== 'object') {
        fail(`${grammar.path}: "repository" is missing`);
      }
    }
  }
}

const snippets = contributes.snippets || [];
for (const entry of snippets) {
  if (!entry || typeof entry.path !== 'string') {
    fail('package.json: invalid contributes.snippets entry');
    continue;
  }
  if (!fs.existsSync(entry.path)) {
    fail(`snippets file does not exist: ${entry.path}`);
  } else {
    readJson(entry.path);
  }
}
if (!snippets.some((entry) => entry && entry.language === 'vuna')) {
  fail('package.json: contributes.snippets is missing a vuna entry');
}
const snippetPath = (snippets.find((entry) => entry && entry.language === 'vuna') || {}).path;
if (typeof snippetPath === 'string' && fs.existsSync(snippetPath)) {
  const parsedSnippets = readJson(snippetPath) || {};
  for (const prefix of ['data', 'record', 'trait', 'instance', 'fn', 'case', 'do', 'where']) {
    const found = Object.values(parsedSnippets).some(
      (snippet) => snippet && snippet.prefix === prefix,
    );
    if (!found) fail(`snippets: no snippet with prefix ${JSON.stringify(prefix)}`);
  }
}

const expectedCommands = [
  'vuna.restartServer',
  'vuna.formatDocument',
  'vuna.lintFile',
  'vuna.checkFile',
  'vuna.buildPackage',
  'vuna.showVersion',
];
const commandIds = (contributes.commands || []).map((entry) => entry && entry.command);
for (const id of expectedCommands) {
  if (!commandIds.includes(id)) fail(`package.json: command ${id} is not contributed`);
}

const properties = (contributes.configuration && contributes.configuration.properties) || {};
for (const key of [
  'vuna.server.path',
  'vuna.basePath',
  'vuna.trace.server',
  'vuna.diagnostics.onSave',
]) {
  if (!properties[key]) fail(`package.json: configuration property ${key} is missing`);
}

if (problems.length > 0) {
  for (const problem of problems) console.error(`FAIL: ${problem}`);
  process.exit(1);
}
NODE
then
  :
else
  FAILED=1
fi

# --- dist bundle -----------------------------------------------------------
if [ -f dist/extension.js ]; then
  if ! node --check dist/extension.js >/dev/null 2>&1; then
    fail 'node --check dist/extension.js failed'
  fi
  if ! grep -Fq 'vuna lsp' dist/extension.js; then
    fail 'dist/extension.js does not contain the "vuna lsp" command label'
  fi
  if ! grep -Fq 'vscode-languageclient' dist/extension.js; then
    fail 'dist/extension.js does not look like a bundled vscode-languageclient extension'
  fi
fi

if [ "$FAILED" -ne 0 ]; then
  printf 'vscode check: FAILED\n' >&2
  exit 1
fi

printf 'vscode check: OK\n'