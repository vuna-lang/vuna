# PR 增量 suite 切片：area → 用例选择器。
#
# 用例侧的影响面由各 suite 的 `[family.<name>] areas` 与 `*.steps` 的 `# areas:` 声明，
# 这里只把 area 组合成一个独立的 check（独立 store path，PR 计划器只构建命中的那几个）。
# 语义是**风险定向**：每个用例声明「哪一类改动最可能被它抓到」，不是严格依赖图——
# 严格依赖会得出「前端改动 → 所有用例」（所有夹具都要解析），等于没切。
# 漏检由 nightly 的完整 `suite` 组（gate + e2e）兜底。
#
# `minCases` 是该切片过滤后（area + tier）的 case 数下限：area 名打错、family 从切片里
# 掉出去都会在这里失败。新增夹具只会让计数变大，不需要跟改。
{
  frontend = {
    areas = [ "compiler-frontend" ];
    tiers = [
      "fast"
      "integration"
    ];
    unitTests = [ "packages/compiler" ];
    minCases = 690;
  };

  core = {
    areas = [ "compiler-core" ];
    tiers = [
      "fast"
      "integration"
    ];
    unitTests = [ "packages/compiler" ];
    minCases = 889;
  };

  ir = {
    areas = [ "ir" ];
    tiers = [
      "fast"
      "integration"
    ];
    unitTests = [ "packages/ir" ];
    minCases = 414;
  };

  ocaml = {
    areas = [ "codegen-ocaml" ];
    tiers = [
      "fast"
      "integration"
    ];
    unitTests = [ ];
    minCases = 615;
  };

  runtime = {
    areas = [ "runtime" ];
    tiers = [
      "fast"
      "integration"
    ];
    unitTests = [
      "packages/base"
      "packages/http"
      "packages/web"
    ];
    minCases = 104;
  };

  base = {
    areas = [ "base" ];
    tiers = [
      "fast"
      "integration"
    ];
    unitTests = [ "packages/base" ];
    minCases = 109;
  };

  # cli steps（LSP / REPL / 包管理）在 `tests` area 的 e2e 全量里跑；PR 切片只跑夹具，
  # 保持与改动面匹配的反馈时间。
  toolchain = {
    areas = [ "toolchain" ];
    tiers = [
      "fast"
      "integration"
    ];
    unitTests = [ "packages/plugin-kit" ];
    minCases = 93;
  };
}
