// Vuna VS Code extension: language registration, TextMate grammar wiring, LSP client
// (`vuna lsp` over stdio) and CLI commands (lint/check/format/build).
//
// Design notes:
// - All language features (diagnostics, hover, formatting, document symbols,
//   definitions, references, completion) are provided by the `vuna lsp` server.
//   This extension deliberately does NOT implement its own providers: it forwards
//   whatever capabilities the server advertises during `initialize`.
// - The server executable is resolved lazily: `vuna.server.path`, then `vuna` on
//   PATH, then `<workspace>/result/bin/vuna`, then `<workspace>/../result/bin/vuna`.
//   Every candidate is probed with `vuna --version` (falling back to `vuna version`)
//   before it is used.
// - `VUNA_BASE` is set for every child process (`vuna.basePath`, else the
//   workspace's `base/` directory when present).

import { execFile } from 'node:child_process';
import * as fs from 'node:fs';
import * as os from 'node:os';
import * as path from 'node:path';
import { promisify } from 'node:util';

import * as vscode from 'vscode';
import {
  LanguageClient,
  type LanguageClientOptions,
  type ServerOptions,
  TransportKind,
} from 'vscode-languageclient/node';

const execFileAsync = promisify(execFile) as (
  file: string,
  args: readonly string[],
  options: {
    cwd?: string;
    env?: NodeJS.ProcessEnv;
    timeout?: number;
    maxBuffer?: number;
    windowsHide?: boolean;
    encoding: 'utf8';
  },
) => Promise<{ stdout: string; stderr: string }>;

const LANGUAGE_ID = 'vuna';
const FILE_GLOB = '**/*.vuna';
const SERVER_ID = 'vuna';
const SERVER_NAME = 'Vuna Language Server';
const LSP_ARGS: readonly string[] = ['lsp'];
/** Human readable form of the command the client starts (also greppable in dist/). */
const LSP_COMMAND_LABEL = 'vuna lsp';
const OUTPUT_CHANNEL_NAME = 'Vuna';
const TRACE_CHANNEL_NAME = 'Vuna Language Server Trace';
const LINT_SOURCE = 'vuna lint';
const BUILD_TERMINAL_NAME = 'vuna build';
const RUN_TERMINAL_NAME = 'vuna run';
const TEST_TERMINAL_NAME = 'vuna test';
const DEFAULT_TIMEOUT_MS = 120_000;

let client: LanguageClient | undefined;
let outputChannel: vscode.OutputChannel | undefined;
let traceChannel: vscode.OutputChannel | undefined;
let statusBar: vscode.StatusBarItem | undefined;
let lintDiagnostics: vscode.DiagnosticCollection | undefined;
let fileWatcher: vscode.FileSystemWatcher | undefined;
let buildTerminal: vscode.Terminal | undefined;
let runTerminal: vscode.Terminal | undefined;
let testTerminal: vscode.Terminal | undefined;
let resolvedServer: ServerResolution | undefined;
const lintInFlight = new Set<string>();

type StatusState = 'starting' | 'running' | 'error';

interface ServerResolution {
  command: string;
  origin: 'setting' | 'path' | 'workspace' | 'parent';
  version?: string;
  probeDetail?: string;
}

interface ProbeResult {
  exists: boolean;
  version?: string;
  detail?: string;
}

interface ExecResult {
  code: number;
  stdout: string;
  stderr: string;
}

interface RunOptions {
  timeoutMs?: number;
  showOutput?: boolean;
  quiet?: boolean;
}

interface LintFinding {
  file: string;
  line: number;
  column: number;
  message: string;
  code?: string;
}

// ---------------------------------------------------------------------------
// Activation
// ---------------------------------------------------------------------------

export function activate(context: vscode.ExtensionContext): void {
  outputChannel = vscode.window.createOutputChannel(OUTPUT_CHANNEL_NAME);
  traceChannel = vscode.window.createOutputChannel(TRACE_CHANNEL_NAME);
  lintDiagnostics = vscode.languages.createDiagnosticCollection('vuna-lint');
  statusBar = vscode.window.createStatusBarItem(vscode.StatusBarAlignment.Left, 100);
  statusBar.command = 'vuna.showVersion';
  statusBar.name = 'Vuna';
  statusBar.show();
  setStatus('starting');

  fileWatcher = vscode.workspace.createFileSystemWatcher(FILE_GLOB);

  context.subscriptions.push(
    outputChannel,
    traceChannel,
    lintDiagnostics,
    statusBar,
    fileWatcher,
    vscode.workspace.onDidSaveTextDocument((document) => {
      void handleDidSave(document);
    }),
    vscode.workspace.onDidChangeConfiguration((event) => {
      handleConfigurationChange(event);
    }),
    vscode.window.onDidCloseTerminal((terminal) => {
      if (terminal === buildTerminal) buildTerminal = undefined;
      if (terminal === runTerminal) runTerminal = undefined;
      if (terminal === testTerminal) testTerminal = undefined;
    }),
  );

  registerCommands(context);

  log(`[vuna] extension activated (VS Code ${vscode.version})`);
  void startClient();
}

export async function deactivate(): Promise<void> {
  const current = client;
  client = undefined;
  if (!current) return;
  try {
    await current.stop();
  } catch (error) {
    log(`[vuna] stopping the language server failed: ${errorMessage(error)}`);
  }
  await current.dispose().catch(() => undefined);
}

function registerCommands(context: vscode.ExtensionContext): void {
  context.subscriptions.push(
    vscode.commands.registerCommand('vuna.restartServer', () => restartServer()),
    vscode.commands.registerCommand('vuna.formatDocument', () => formatDocument()),
    vscode.commands.registerCommand('vuna.lintFile', () => lintActiveFile()),
    vscode.commands.registerCommand('vuna.checkFile', () => checkActiveFile()),
    vscode.commands.registerCommand('vuna.buildPackage', (resource?: vscode.Uri) =>
      buildPackage(resource),
    ),
    vscode.commands.registerCommand('vuna.runPackage', (resource?: vscode.Uri) =>
      runPackage(resource),
    ),
    vscode.commands.registerCommand('vuna.runTests', (resource?: vscode.Uri) =>
      runTests(resource),
    ),
    vscode.commands.registerCommand('vuna.showVersion', () => showVersion()),
  );
}

// ---------------------------------------------------------------------------
// Language client lifecycle
// ---------------------------------------------------------------------------

async function startClient(): Promise<void> {
  if (client) return;
  setStatus('starting');

  let resolution: ServerResolution;
  try {
    resolution = await resolveServer();
  } catch (error) {
    resolvedServer = undefined;
    setStatus('error');
    log(`[vuna] ${errorMessage(error)}`);
    const action = await vscode.window.showErrorMessage(
      `Vuna: ${errorMessage(error)}`,
      'Open Settings',
      'Show Output',
    );
    if (action === 'Open Settings') {
      await vscode.commands.executeCommand('workbench.action.openSettings', 'vuna.server.path');
    } else if (action === 'Show Output') {
      outputChannel?.show(true);
    }
    return;
  }

  resolvedServer = resolution;
  setStatus('starting');
  log(
    `[vuna] starting ${LSP_COMMAND_LABEL}: ${resolution.command} ${LSP_ARGS.join(' ')} ` +
      `(${describeOrigin(resolution)})`,
  );
  if (resolution.version) {
    log(`[vuna] server version: ${resolution.version}`);
  } else {
    log(
      '[vuna] warning: `vuna --version` / `vuna version` did not report a version; starting anyway',
    );
  }
  const basePath = resolveBasePath();
  if (basePath) log(`[vuna] VUNA_BASE=${basePath}`);
  else log('[vuna] VUNA_BASE is not set (no vuna.basePath and no workspace base/ directory)');

  const workspaceRoot = primaryWorkspaceFolder()?.uri.fsPath;
  const serverOptions: ServerOptions = {
    command: resolution.command,
    args: [...LSP_ARGS],
    options: { cwd: workspaceRoot, env: buildServerEnvironment() },
    transport: TransportKind.stdio,
  };
  const clientOptions: LanguageClientOptions = {
    documentSelector: [{ scheme: 'file', language: LANGUAGE_ID }],
    outputChannel,
    traceOutputChannel: traceChannel,
    // v9 moved file watching from `LanguageClientOptions.fileEvents` to
    // `synchronize.fileEvents`; the client only forwards events when the server
    // registers `workspace/didChangeWatchedFiles`.
    synchronize: { fileEvents: fileWatcher },
  };

  const candidate = new LanguageClient(SERVER_ID, SERVER_NAME, serverOptions, clientOptions);
  try {
    await candidate.start();
    client = candidate;
    setStatus('running');
    log('[vuna] language server running');
  } catch (error) {
    await candidate.stop().catch(() => undefined);
    await candidate.dispose().catch(() => undefined);
    setStatus('error');
    log(`[vuna] failed to start the language server: ${errorMessage(error)}`);
    const action = await vscode.window.showErrorMessage(
      `Vuna: failed to start "${LSP_COMMAND_LABEL}": ${errorMessage(error)}`,
      'Show Output',
    );
    if (action === 'Show Output') outputChannel?.show(true);
  }
}

async function restartServer(): Promise<void> {
  const current = client;
  client = undefined;
  setStatus('starting');
  log('[vuna] restarting the language server');
  if (current) {
    try {
      await current.stop();
    } catch (error) {
      log(`[vuna] stopping the previous language server failed: ${errorMessage(error)}`);
    }
    await current.dispose().catch(() => undefined);
  }
  // Rebuild the client from the current settings: resolvedServer is refreshed by
  // the configuration-change handler, so this also picks up a new server path.
  await startClient();
}

function handleConfigurationChange(event: vscode.ConfigurationChangeEvent): void {
  if (
    event.affectsConfiguration('vuna.server.path') ||
    event.affectsConfiguration('vuna.basePath')
  ) {
    resolvedServer = undefined;
    void vscode.window
      .showInformationMessage(
        'Vuna: server settings changed. Restart the language server to apply them.',
        'Restart Server',
      )
      .then((action) => {
        if (action === 'Restart Server') void restartServer();
      });
  }
  if (event.affectsConfiguration('vuna.diagnostics.onSave')) {
    const enabled = vscode.workspace
      .getConfiguration('vuna')
      .get<boolean>('diagnostics.onSave', true);
    if (!enabled) lintDiagnostics?.clear();
  }
}

/** The language client itself refreshes `vuna.trace.server` on configuration changes. */

// ---------------------------------------------------------------------------
// Server resolution
// ---------------------------------------------------------------------------

async function resolveServer(): Promise<ServerResolution> {
  const configured = vscode.workspace
    .getConfiguration('vuna')
    .get<string>('server.path', '')
    .trim();
  if (configured) {
    const command = expandPath(configured);
    const probe = await probeServer(command);
    if (!probe.exists) {
      throw new Error(`vuna.server.path is not an executable: ${command}`);
    }
    if (!probe.version) {
      log(`[vuna] warning: could not read a version from ${command}; starting anyway`);
    }
    return {
      command,
      origin: 'setting',
      version: probe.version,
      probeDetail: probe.detail,
    };
  }

  log('[vuna] auto-detecting the vuna executable (vuna.server.path is empty)');
  const fromPath = await probeServer(binaryName());
  if (fromPath.exists) {
    log(`[vuna] using vuna from PATH (${fromPath.version ?? 'version unknown'})`);
    return {
      command: binaryName(),
      origin: 'path',
      version: fromPath.version,
      probeDetail: fromPath.detail,
    };
  }

  let fallback: ServerResolution | undefined;
  for (const candidate of workspaceCandidates()) {
    if (!isExecutable(candidate.command)) continue;
    const probe = await probeServer(candidate.command);
    const resolution: ServerResolution = {
      command: candidate.command,
      origin: candidate.origin,
      version: probe.version,
      probeDetail: probe.detail,
    };
    if (probe.version) return resolution;
    fallback ??= resolution;
  }
  if (fallback) {
    log(
      `[vuna] warning: version probe failed for ${fallback.command}; ` +
        'using it anyway (a vuna build without `--version` support still runs `lsp`)',
    );
    return fallback;
  }

  throw new Error(
    'could not find the vuna executable. Set "vuna.server.path" or run ' +
      '`nix build .#vuna --out-link result` from the workspace root.',
  );
}

async function getServerResolution(): Promise<ServerResolution> {
  if (resolvedServer) return resolvedServer;
  resolvedServer = await resolveServer();
  return resolvedServer;
}

function binaryName(): string {
  return process.platform === 'win32' ? 'vuna.exe' : 'vuna';
}

function workspaceCandidates(): Array<{ command: string; origin: 'workspace' | 'parent' }> {
  const workspace = primaryWorkspaceFolder();
  if (!workspace) return [];
  const root = workspace.uri.fsPath;
  const candidates: Array<{ command: string; origin: 'workspace' | 'parent' }> = [
    { command: path.join(root, 'result', 'bin', binaryName()), origin: 'workspace' },
    { command: path.join(root, '..', 'result', 'bin', binaryName()), origin: 'parent' },
  ];
  const seen = new Set<string>();
  return candidates.filter((candidate) => {
    const resolved = path.resolve(candidate.command);
    if (seen.has(resolved)) return false;
    seen.add(resolved);
    candidate.command = resolved;
    return true;
  });
}

async function probeServer(command: string): Promise<ProbeResult> {
  let exists = false;
  let detail = '';
  // Newer vuna builds expose `vuna version`; some builds only accept `--version`;
  // very early builds accept neither. Try both spellings before giving up on the
  // version string (the probe itself is also an executable check).
  for (const flag of ['--version', 'version']) {
    try {
      const { stdout, stderr } = await execFileAsync(command, [flag], {
        timeout: 10_000,
        windowsHide: true,
        env: buildServerEnvironment(),
        encoding: 'utf8',
      });
      exists = true;
      detail = `${stdout}${stderr}`.trim();
      const version = extractVersion(detail);
      if (version) return { exists, version, detail };
    } catch (error) {
      const failure = error as {
        code?: number | string;
        stdout?: string;
        stderr?: string;
        message?: string;
      };
      if (failure.code === 'ENOENT') return { exists: false, detail: 'ENOENT' };
      if (failure.code === 'EACCES') return { exists: false, detail: 'EACCES' };
      exists = true;
      detail =
        `${failure.stdout ?? ''}${failure.stderr ?? ''}`.trim() ||
        failure.message ||
        String(error);
    }
  }
  return { exists, detail };
}

function extractVersion(text: string): string | undefined {
  const match = /\b(?:v)?(\d+\.\d+\.\d+)\b/.exec(text);
  return match?.[1];
}

function describeOrigin(resolution: ServerResolution): string {
  switch (resolution.origin) {
    case 'setting':
      return 'vuna.server.path';
    case 'path':
      return 'PATH';
    case 'workspace':
      return '<workspace>/result/bin';
    case 'parent':
      return '<workspace>/../result/bin';
  }
}

function isExecutable(file: string): boolean {
  try {
    const stat = fs.statSync(file);
    if (!stat.isFile()) return false;
    if (process.platform !== 'win32') fs.accessSync(file, fs.constants.X_OK);
    return true;
  } catch {
    return false;
  }
}

function isDirectory(file: string): boolean {
  try {
    return fs.statSync(file).isDirectory();
  } catch {
    return false;
  }
}

function expandPath(value: string): string {
  let expanded = value;
  if (expanded === '~' || expanded.startsWith('~/') || expanded.startsWith('~\\')) {
    expanded = path.join(os.homedir(), expanded.slice(1));
  }
  if (path.isAbsolute(expanded)) return expanded;
  const workspace = primaryWorkspaceFolder();
  return path.resolve(workspace ? workspace.uri.fsPath : process.cwd(), expanded);
}

function primaryWorkspaceFolder(): vscode.WorkspaceFolder | undefined {
  const folders = vscode.workspace.workspaceFolders;
  if (!folders || folders.length === 0) return undefined;
  const activeUri = vscode.window.activeTextEditor?.document.uri;
  if (activeUri) {
    const folder = vscode.workspace.getWorkspaceFolder(activeUri);
    if (folder) return folder;
  }
  return folders[0];
}

function resolveBasePath(): string | undefined {
  const configured = vscode.workspace
    .getConfiguration('vuna')
    .get<string>('basePath', '')
    .trim();
  if (configured) {
    const resolved = expandPath(configured);
    if (isDirectory(resolved)) return resolved;
    log(`[vuna] warning: vuna.basePath is not a directory: ${resolved}`);
    return undefined;
  }
  const workspace = primaryWorkspaceFolder();
  if (!workspace) return undefined;
  const base = path.join(workspace.uri.fsPath, 'base');
  return isDirectory(base) ? base : undefined;
}

function buildServerEnvironment(): NodeJS.ProcessEnv {
  const env: NodeJS.ProcessEnv = { ...process.env };
  const basePath = resolveBasePath();
  if (basePath) env.VUNA_BASE = basePath;
  return env;
}

// ---------------------------------------------------------------------------
// Status bar
// ---------------------------------------------------------------------------

function setStatus(state: StatusState): void {
  if (!statusBar) return;
  const version = resolvedServer?.version;
  let text: string;
  let tooltip: string;
  switch (state) {
    case 'starting':
      text = '$(sync~spin) Vuna';
      tooltip = 'Vuna: starting the language server';
      break;
    case 'running':
      text = version ? `$(code) Vuna ${version}` : '$(code) Vuna';
      tooltip = `Vuna: language server running${version ? ` (${version})` : ''}`;
      break;
    case 'error':
      text = '$(warning) Vuna';
      tooltip = 'Vuna: language server is not running (see the Vuna output channel)';
      break;
  }
  if (resolvedServer) tooltip += `\n${resolvedServer.command} (${describeOrigin(resolvedServer)})`;
  statusBar.text = text;
  statusBar.tooltip = tooltip;
  statusBar.backgroundColor =
    state === 'error' ? new vscode.ThemeColor('statusBarItem.warningBackground') : undefined;
}

// ---------------------------------------------------------------------------
// CLI commands
// ---------------------------------------------------------------------------

async function lintActiveFile(): Promise<void> {
  const editor = activeVunaEditor();
  if (!editor) return;
  await lintDocument(editor.document, false);
}

async function checkActiveFile(): Promise<void> {
  const editor = activeVunaEditor();
  if (!editor) return;
  const result = await runVunaSafe(['check', editor.document.uri.fsPath], {
    timeoutMs: DEFAULT_TIMEOUT_MS,
    showOutput: true,
  });
  if (!result) return;
  if (result.code === 0) {
    void vscode.window.showInformationMessage('Vuna: check passed.');
  } else {
    void vscode.window.showWarningMessage(
      `Vuna: check failed (exit code ${result.code}); see the "Vuna" output channel.`,
    );
  }
}

async function lintDocument(document: vscode.TextDocument, quiet: boolean): Promise<void> {
  const key = document.uri.toString();
  if (lintInFlight.has(key)) return;
  lintInFlight.add(key);
  try {
    const result = await runVuna(['lint', document.uri.fsPath], { timeoutMs: DEFAULT_TIMEOUT_MS });
    publishLintDiagnostics(document, result);
    if (!quiet) {
      outputChannel?.show(true);
      if (result.code === 0) {
        void vscode.window.showInformationMessage('Vuna: lint found no problems.');
      } else {
        void vscode.window.showWarningMessage(
          `Vuna: lint reported problems (exit code ${result.code}); see the "Vuna" output channel.`,
        );
      }
    }
  } catch (error) {
    log(`[vuna] could not run "vuna lint": ${errorMessage(error)}`);
    if (!quiet) showRunError('vuna lint', error);
  } finally {
    lintInFlight.delete(key);
  }
}

async function handleDidSave(document: vscode.TextDocument): Promise<void> {
  if (document.languageId !== LANGUAGE_ID) return;
  const enabled = vscode.workspace
    .getConfiguration('vuna')
    .get<boolean>('diagnostics.onSave', true);
  if (!enabled) {
    lintDiagnostics?.delete(document.uri);
    return;
  }
  await lintDocument(document, true);
}

function publishLintDiagnostics(document: vscode.TextDocument, result: ExecResult): void {
  const findings = parseLintOutput(`${result.stdout}\n${result.stderr}`);
  const workspaceRoot = primaryWorkspaceFolder()?.uri.fsPath ?? process.cwd();
  const target = path.resolve(document.uri.fsPath);
  const diagnostics: vscode.Diagnostic[] = [];
  for (const finding of findings) {
    const findingPath = path.isAbsolute(finding.file)
      ? path.resolve(finding.file)
      : path.resolve(workspaceRoot, finding.file);
    if (findingPath !== target) continue;
    diagnostics.push(toDiagnostic(document, finding));
  }
  lintDiagnostics?.set(document.uri, diagnostics);
}

function parseLintOutput(text: string): LintFinding[] {
  const findings: LintFinding[] = [];
  for (const rawLine of text.split(/\r?\n/)) {
    const line = rawLine.trimEnd();
    if (!line) continue;
    const match = /^(.+?):(\d+):(\d+):\s*(.*)$/.exec(line);
    if (!match) continue;
    let message = match[4];
    let code: string | undefined;
    const codeMatch = /^\[([A-Za-z][A-Za-z0-9_]*)\]\s*(.*)$/.exec(message);
    if (codeMatch) {
      code = codeMatch[1];
      message = codeMatch[2];
    }
    findings.push({
      file: match[1],
      line: Number(match[2]),
      column: Number(match[3]),
      message,
      code,
    });
  }
  return findings;
}

function toDiagnostic(document: vscode.TextDocument, finding: LintFinding): vscode.Diagnostic {
  const lineIndex = Math.max(0, Math.min(document.lineCount - 1, finding.line - 1));
  const line = document.lineAt(lineIndex);
  const startCharacter = Math.max(0, Math.min(line.text.length, finding.column - 1));
  const range = new vscode.Range(
    lineIndex,
    startCharacter,
    lineIndex,
    Math.max(startCharacter, line.text.length),
  );
  const diagnostic = new vscode.Diagnostic(
    range,
    finding.message,
    vscode.DiagnosticSeverity.Warning,
  );
  diagnostic.source = LINT_SOURCE;
  if (finding.code) diagnostic.code = finding.code;
  return diagnostic;
}

async function formatDocument(): Promise<void> {
  const editor = activeVunaEditor();
  if (!editor) return;
  const document = editor.document;
  const versionBefore = document.version;

  if (serverSupportsFormatting()) {
    try {
      await vscode.commands.executeCommand('editor.action.formatDocument');
      if (document.version !== versionBefore) {
        log('[vuna] formatted with the language server');
        return;
      }
      log('[vuna] the language server returned no formatting edits; falling back to `vuna fmt`');
    } catch (error) {
      log(`[vuna] language server formatting failed: ${errorMessage(error)}; using \`vuna fmt\``);
    }
  } else {
    log('[vuna] the language server does not advertise formatting; using `vuna fmt`');
  }

  // CLI fallback: `vuna fmt` rewrites the file on disk, so unsaved buffers would
  // be lost. Ask the user to save first instead of silently clobbering them.
  if (document.isDirty) {
    void vscode.window.showWarningMessage(
      'Vuna: save the file before formatting with `vuna fmt` (the CLI formats files on disk).',
    );
    return;
  }

  const result = await runVunaSafe(['fmt', document.uri.fsPath], {
    timeoutMs: 60_000,
    showOutput: true,
  });
  if (!result) return;
  if (result.code !== 0) {
    void vscode.window.showWarningMessage(
      `Vuna: \`vuna fmt\` failed (exit code ${result.code}); see the "Vuna" output channel.`,
    );
    return;
  }

  let formatted: string;
  try {
    formatted = fs.readFileSync(document.uri.fsPath, 'utf8');
  } catch (error) {
    log(`[vuna] cannot read the formatted file: ${errorMessage(error)}`);
    return;
  }
  const current = document.getText();
  if (formatted === current) {
    log('[vuna] document is already formatted');
    return;
  }
  const edit = new vscode.WorkspaceEdit();
  edit.replace(
    document.uri,
    new vscode.Range(document.positionAt(0), document.positionAt(current.length)),
    formatted,
  );
  if (await vscode.workspace.applyEdit(edit)) {
    await document.save();
    log('[vuna] formatted with `vuna fmt`');
  } else {
    void vscode.window.showWarningMessage('Vuna: could not apply the formatting edits.');
  }
}

function serverSupportsFormatting(): boolean {
  const capabilities = client?.initializeResult?.capabilities;
  if (!capabilities) return false;
  const provider = capabilities.documentFormattingProvider;
  return provider === true || (typeof provider === 'object' && provider !== null);
}

async function buildPackage(resource?: vscode.Uri): Promise<void> {
  let resolution: ServerResolution;
  try {
    resolution = await getServerResolution();
  } catch (error) {
    await showRunError('vuna build', error);
    return;
  }
  const packageDir = findPackageDir(resource);
  if (!packageDir) {
    void vscode.window.showWarningMessage(
      'Vuna: no vuna.toml found for this file (searched upwards from the file and the workspace).',
    );
    return;
  }
  const terminal = getBuildTerminal(packageDir);
  terminal.show(false);
  const commandLine = [quoteShell(resolution.command), 'build', quoteShell(packageDir)].join(' ');
  log(`[vuna] terminal: ${commandLine}`);
  terminal.sendText(commandLine, true);
}

function getBuildTerminal(cwd: string): vscode.Terminal {
  if (buildTerminal) return buildTerminal;
  buildTerminal = vscode.window.createTerminal({ name: BUILD_TERMINAL_NAME, cwd });
  return buildTerminal;
}

// `vuna run`：增量 build + 执行包内可执行入口（没有可执行入口的库包由 CLI 报错）。
async function runPackage(resource?: vscode.Uri): Promise<void> {
  const resolution = await cliResolution('vuna run');
  if (!resolution) return;
  const packageDir = findPackageDir(resource);
  if (!packageDir) {
    void vscode.window.showWarningMessage(
      'Vuna: no vuna.toml found for this file (searched upwards from the file and the workspace).',
    );
    return;
  }
  const terminal = getRunTerminal(packageDir);
  terminal.show(false);
  const commandLine = [quoteShell(resolution.command), 'run', quoteShell(packageDir)].join(' ');
  log(`[vuna] terminal: ${commandLine}`);
  terminal.sendText(commandLine, true);
}

function getRunTerminal(cwd: string): vscode.Terminal {
  if (runTerminal) return runTerminal;
  runTerminal = vscode.window.createTerminal({ name: RUN_TERMINAL_NAME, cwd });
  return runTerminal;
}

// `vuna test`：当前文件在包的 `test/` 下时按文件名过滤，否则跑整包（workspace 根则整 workspace）。
async function runTests(resource?: vscode.Uri): Promise<void> {
  const resolution = await cliResolution('vuna test');
  if (!resolution) return;
  const packageDir = findPackageDir(resource) ?? primaryWorkspaceFolder()?.uri.fsPath;
  if (!packageDir) {
    void vscode.window.showWarningMessage(
      'Vuna: open a .vuna file or a workspace folder first (no package root found).',
    );
    return;
  }
  const parts = [quoteShell(resolution.command), 'test', quoteShell(packageDir)];
  const editor = vscode.window.activeTextEditor;
  if (editor && editor.document.languageId === LANGUAGE_ID) {
    const file = editor.document.uri.fsPath;
    const base = path.basename(file, '.vuna');
    if (base && isInside(path.join(packageDir, 'test'), file)) {
      parts.push('--filter', quoteShell(base));
    }
  }
  const terminal = getTestTerminal(packageDir);
  terminal.show(false);
  const commandLine = parts.join(' ');
  log(`[vuna] terminal: ${commandLine}`);
  terminal.sendText(commandLine, true);
}

function getTestTerminal(cwd: string): vscode.Terminal {
  if (testTerminal) return testTerminal;
  testTerminal = vscode.window.createTerminal({ name: TEST_TERMINAL_NAME, cwd });
  return testTerminal;
}

function isInside(dir: string, file: string): boolean {
  const resolvedDir = path.resolve(dir) + path.sep;
  return path.resolve(file).startsWith(resolvedDir);
}

async function cliResolution(label: string): Promise<ServerResolution | undefined> {
  try {
    return await getServerResolution();
  } catch (error) {
    await showRunError(label, error);
    return undefined;
  }
}

function findPackageDir(resource?: vscode.Uri): string | undefined {
  let start = resource?.fsPath;
  if (!start) start = vscode.window.activeTextEditor?.document.uri.fsPath;
  if (!start) start = primaryWorkspaceFolder()?.uri.fsPath;
  if (!start) return undefined;
  try {
    if (!fs.statSync(start).isDirectory()) start = path.dirname(start);
  } catch {
    start = path.dirname(start);
  }
  let dir = start;
  for (;;) {
    if (fs.existsSync(path.join(dir, 'vuna.toml'))) return dir;
    const parent = path.dirname(dir);
    if (parent === dir) return undefined;
    dir = parent;
  }
}

async function showVersion(): Promise<void> {
  let resolution: ServerResolution;
  try {
    resolution = await getServerResolution();
  } catch (error) {
    await showRunError('vuna', error);
    return;
  }
  const probe = await probeServer(resolution.command);
  const version = probe.version ?? resolution.version;
  const basePath = resolveBasePath();
  const trace = vscode.workspace.getConfiguration('vuna').get<string>('trace.server', 'off');
  log(
    [
      '[vuna] version information:',
      `  server: ${resolution.command} (${describeOrigin(resolution)})`,
      `  version: ${version ?? 'unknown (this vuna build supports neither `--version` nor `version`)'}`,
      `  VUNA_BASE: ${basePath ?? '(not set)'}`,
      `  trace.server: ${trace}`,
      `  VS Code: ${vscode.version}`,
    ].join('\n'),
  );
  const action = await vscode.window.showInformationMessage(
    `Vuna ${version ?? '(unknown version)'} - ${resolution.command}`,
    'Show Output',
    'Open Settings',
  );
  if (action === 'Show Output') {
    outputChannel?.show(true);
  } else if (action === 'Open Settings') {
    await vscode.commands.executeCommand('workbench.action.openSettings', 'vuna');
  }
}

async function runVunaSafe(args: string[], options: RunOptions = {}): Promise<ExecResult | undefined> {
  try {
    return await runVuna(args, options);
  } catch (error) {
    log(`[vuna] ${errorMessage(error)}`);
    if (!options.quiet) await showRunError(`vuna ${args[0]}`, error);
    return undefined;
  }
}

async function runVuna(args: string[], options: RunOptions = {}): Promise<ExecResult> {
  const resolution = await getServerResolution();
  const cwd = primaryWorkspaceFolder()?.uri.fsPath ?? process.cwd();
  const env = buildServerEnvironment();
  log(`[vuna] $ vuna ${args.join(' ')}`);
  try {
    const { stdout, stderr } = await execFileAsync(resolution.command, args, {
      cwd,
      env,
      timeout: options.timeoutMs ?? DEFAULT_TIMEOUT_MS,
      maxBuffer: 64 * 1024 * 1024,
      windowsHide: true,
      encoding: 'utf8',
    });
    appendOutput(stdout, stderr);
    if (options.showOutput) outputChannel?.show(true);
    return { code: 0, stdout, stderr };
  } catch (error) {
    const failure = error as {
      code?: number | string;
      stdout?: string;
      stderr?: string;
      message?: string;
      killed?: boolean;
    };
    if (failure.code === 'ENOENT') {
      throw new Error(`cannot execute ${resolution.command}: no such file`);
    }
    if (failure.code === 'EACCES') {
      throw new Error(`cannot execute ${resolution.command}: permission denied`);
    }
    const stdout = typeof failure.stdout === 'string' ? failure.stdout : '';
    const stderr = typeof failure.stderr === 'string' ? failure.stderr : '';
    appendOutput(stdout, stderr);
    if (typeof failure.code === 'number') {
      if (options.showOutput) outputChannel?.show(true);
      return { code: failure.code, stdout, stderr };
    }
    log(`[vuna] vuna ${args.join(' ')} failed: ${failure.message ?? String(error)}`);
    return { code: 1, stdout, stderr: stderr || failure.message || String(error) };
  }
}

async function showRunError(label: string, error: unknown): Promise<void> {
  const message = `Vuna: ${label} could not run: ${errorMessage(error)}`;
  log(`[vuna] ${message}`);
  const action = await vscode.window.showErrorMessage(message, 'Open Settings', 'Show Output');
  if (action === 'Open Settings') {
    await vscode.commands.executeCommand('workbench.action.openSettings', 'vuna.server.path');
  } else if (action === 'Show Output') {
    outputChannel?.show(true);
  }
}

// ---------------------------------------------------------------------------
// Helpers
// ---------------------------------------------------------------------------

function activeVunaEditor(): vscode.TextEditor | undefined {
  const editor = vscode.window.activeTextEditor;
  if (!editor) {
    void vscode.window.showWarningMessage('Vuna: open a .vuna file first.');
    return undefined;
  }
  if (editor.document.languageId !== LANGUAGE_ID) {
    void vscode.window.showWarningMessage(
      `Vuna: the active editor is not a Vuna file (language id "${editor.document.languageId}").`,
    );
    return undefined;
  }
  return editor;
}

function appendOutput(stdout: string, stderr: string): void {
  if (!outputChannel) return;
  if (stdout) outputChannel.append(stdout.endsWith('\n') ? stdout : `${stdout}\n`);
  if (stderr) outputChannel.append(stderr.endsWith('\n') ? stderr : `${stderr}\n`);
}

function quoteShell(value: string): string {
  if (process.platform === 'win32') return `"${value}"`;
  if (/^[A-Za-z0-9_./:@%+=,-]+$/.test(value)) return value;
  return `'${value.replace(/'/g, `'\\''`)}'`;
}

function errorMessage(error: unknown): string {
  if (error instanceof Error) return error.message;
  return String(error);
}

function log(message: string): void {
  outputChannel?.appendLine(message);
}