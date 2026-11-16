#!/usr/bin/env node
// 校验 Vuna 的 TextMate 语法（零依赖）：
//
//   node scripts/check-grammar.mjs syntaxes/vuna.tmLanguage.json \
//     [--keywords FILE] [--soft-keywords FILE]
//
// 1. JSON 结构与顶层断言（scopeName / patterns / repository）；
// 2. 收集 repository 与 patterns 里所有 match / begin / end，逐个 new RegExp 编译；
// 3. --keywords FILE：每行一个硬关键字，要求有 pattern 把它匹配成
//    keyword.* / storage.* / support.* 作用域（不含 variable.*）；
// 4. --soft-keywords FILE：同上，但只接受 keyword.* / support.*；
//    软关键字按上下文识别，因此测试时除裸关键字外还给几个声明位样例
//    （`export`、`alias record`、`deriving via field`、`return x -> y` 等），
//    只要其中一种上下文能被带对应作用域的 pattern 匹配即通过。
//
// 成功打印一行 `grammar check: OK (N patterns, K keywords)`；任何问题退出 1。
import { readFileSync } from 'node:fs';

const KEYWORD_SCOPE = /keyword\./;
const STORAGE_SCOPE = /storage\./;
const SUPPORT_SCOPE = /support\./;
const VARIABLE_SCOPE = /variable\./;

function fail(message) {
  console.error(message);
  process.exit(1);
}

function parseArgs(argv) {
  const options = { grammar: undefined, keywords: undefined, softKeywords: undefined };
  for (let index = 0; index < argv.length; index += 1) {
    const arg = argv[index];
    if (arg === '--keywords') {
      options.keywords = argv[index + 1];
      index += 1;
    } else if (arg === '--soft-keywords') {
      options.softKeywords = argv[index + 1];
      index += 1;
    } else if (arg.startsWith('-')) {
      fail(`grammar check: unknown option ${arg}`);
    } else if (options.grammar === undefined) {
      options.grammar = arg;
    } else {
      fail(`grammar check: unexpected argument ${arg}`);
    }
  }
  if (!options.grammar) {
    fail('usage: node scripts/check-grammar.mjs GRAMMAR [--keywords FILE] [--soft-keywords FILE]');
  }
  return options;
}

function readJson(file) {
  let text;
  try {
    text = readFileSync(file, 'utf8');
  } catch (error) {
    fail(`grammar check: cannot read ${file}: ${error.message}`);
  }
  try {
    return JSON.parse(text);
  } catch (error) {
    fail(`grammar check: ${file}: invalid JSON (${error.message})`);
  }
}

// 深度遍历：收集带 match / begin / end 的规则对象（包含 capture 对象，但那些没有正则字段）。
function collectRules(node, trail, out) {
  if (!node || typeof node !== 'object') return;
  if (Array.isArray(node)) {
    node.forEach((child, index) => collectRules(child, `${trail}[${index}]`, out));
    return;
  }
  if (['match', 'begin', 'end'].some((field) => typeof node[field] === 'string')) {
    out.push({ rule: node, trail });
  }
  for (const [key, value] of Object.entries(node)) {
    if (key === 'match' || key === 'begin' || key === 'end') continue;
    if (value && typeof value === 'object') collectRules(value, `${trail}.${key}`, out);
  }
}

function isKeywordishScope(scope, allowStorage) {
  if (typeof scope !== 'string' || VARIABLE_SCOPE.test(scope)) return false;
  if (KEYWORD_SCOPE.test(scope) || SUPPORT_SCOPE.test(scope)) return true;
  return allowStorage && STORAGE_SCOPE.test(scope);
}

// pattern 是否能把 candidate 里的 keyword 着色成关键字类作用域。
// 有 captures 时要求覆盖 keyword 出现的那个 capture 带关键字作用域；
// 没有 captures 时看 pattern 级 name 是否覆盖整个匹配。
function ruleCovers(rule, field, candidate, keyword, allowStorage) {
  let regex;
  try {
    regex = new RegExp(rule[field], 'd');
  } catch (error) {
    return false;
  }
  const match = regex.exec(candidate);
  if (!match) return false;
  const keywordAt = candidate.indexOf(keyword);
  if (keywordAt < 0) return false;
  const captures = rule.captures || rule.beginCaptures || {};
  const named = Object.entries(captures).filter(
    ([, capture]) => capture && typeof capture.name === 'string',
  );
  if (named.length === 0) {
    if (!isKeywordishScope(rule.name, allowStorage)) return false;
    return match.index <= keywordAt && keywordAt < match.index + match[0].length;
  }
  for (const [group, capture] of named) {
    const index = Number(group);
    if (!Number.isInteger(index) || index <= 0) continue;
    const spans = match.indices && match.indices[index];
    if (!spans) continue;
    if (spans[0] <= keywordAt && keywordAt < spans[1]) {
      return isKeywordishScope(capture.name, allowStorage);
    }
  }
  return false;
}

function readKeywordFile(file) {
  let text;
  try {
    text = readFileSync(file, 'utf8');
  } catch (error) {
    fail(`grammar check: cannot read keyword file ${file}: ${error.message}`);
  }
  return text
    .split(/\r?\n/)
    .map((line) => line.trim())
    .filter((line) => line.length > 0 && !line.startsWith('#'));
}

// 软关键字只在上下文里出现：多给几个声明位样例，任一命中即可。
function softCandidates(keyword) {
  return [
    keyword,
    `${keyword} `,
    `${keyword} record`,
    `${keyword} x`,
    `${keyword} x -> y`,
    `deriving ${keyword} field`,
    `deriving via ${keyword}`,
    `export ${keyword}`,
    `handle c { ${keyword} x -> y }`,
  ];
}

function main() {
  const options = parseArgs(process.argv.slice(2));
  const grammar = readJson(options.grammar);

  if (grammar.scopeName !== 'source.vuna') {
    fail(`grammar check: scopeName must be "source.vuna" (got ${JSON.stringify(grammar.scopeName)})`);
  }
  if (!Array.isArray(grammar.patterns) || grammar.patterns.length === 0) {
    fail('grammar check: "patterns" must be a non-empty array');
  }
  if (!grammar.repository || typeof grammar.repository !== 'object') {
    fail('grammar check: "repository" is missing');
  }

  const collected = [];
  collectRules(grammar.patterns, 'patterns', collected);
  collectRules(grammar.repository, 'repository', collected);

  const problems = [];
  for (const { rule, trail } of collected) {
    for (const field of ['match', 'begin', 'end']) {
      const source = rule[field];
      if (typeof source !== 'string') continue;
      try {
        new RegExp(source);
      } catch (error) {
        problems.push(`${trail}.${field}: ${error.message} (${source})`);
      }
    }
  }
  if (problems.length > 0) {
    for (const problem of problems) console.error(`grammar check: ${problem}`);
    process.exit(1);
  }

  const hardKeywords = options.keywords ? readKeywordFile(options.keywords) : [];
  const softKeywords = options.softKeywords ? readKeywordFile(options.softKeywords) : [];
  const missing = [];

  for (const keyword of hardKeywords) {
    const covered = collected.some(({ rule }) =>
      ['match', 'begin'].some((field) =>
        typeof rule[field] === 'string'
          ? ruleCovers(rule, field, keyword, keyword, true)
          : false,
      ),
    );
    if (!covered) missing.push(`missing keyword: ${keyword}`);
  }
  for (const keyword of softKeywords) {
    const covered = collected.some(({ rule }) =>
      ['match', 'begin'].some((field) =>
        typeof rule[field] === 'string'
          ? softCandidates(keyword).some((candidate) =>
              ruleCovers(rule, field, candidate, keyword, false),
            )
          : false,
      ),
    );
    if (!covered) missing.push(`missing soft keyword: ${keyword}`);
  }
  if (missing.length > 0) {
    for (const line of missing) console.error(`grammar check: ${line}`);
    process.exit(1);
  }

  const keywordCount = hardKeywords.length + softKeywords.length;
  console.log(`grammar check: OK (${collected.length} patterns, ${keywordCount} keywords)`);
}

main();