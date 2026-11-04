// Bundle the extension into a single CommonJS file for the VS Code extension host.
//
// The committed `dist/extension.js` is what VS Code loads (see package.json#main),
// so this script must stay dependency-free beyond esbuild. `vscode` is provided by
// the extension host at runtime and must stay external.

import { build } from 'esbuild';
import { mkdirSync } from 'node:fs';
import { dirname, resolve } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = resolve(dirname(fileURLToPath(import.meta.url)), '..');
const outfile = resolve(root, 'dist/extension.js');
const inlineSourceMap = process.argv.includes('--sourcemap');

mkdirSync(dirname(outfile), { recursive: true });

await build({
  absWorkingDir: root,
  entryPoints: ['src/extension.ts'],
  outfile,
  bundle: true,
  platform: 'node',
  format: 'cjs',
  target: 'node18',
  external: ['vscode'],
  sourcemap: inlineSourceMap ? 'inline' : false,
  minify: false,
  legalComments: 'none',
  logLevel: 'info',
  banner: {
    js: '/* vuna VS Code extension - built from src/extension.ts by scripts/build.mjs */',
  },
});

console.log(`built ${outfile}${inlineSourceMap ? ' (inline sourcemap)' : ''}`);