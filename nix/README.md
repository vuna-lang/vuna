# nix/ —— 构建图、CI 门禁与仓库工具

`flake.nix` 只保留输入与委托；本目录按职责分区：

| 路径 | 职责 |
| --- | --- |
| `build/` | flake outputs 组装：`common.nix`（系统 / 工具集 / 版本）、`packages.nix`（自举链与开发 runner）、`run-tests.nix`、`outputs.nix` |
| `checks/` | CI 门禁：`default.nix` 声明 check 与源集合，`*.sh` 是入口脚本，`lib/` 是共享实现，`data/` 是基线 / 白名单 / 预算 |
| `seed/` | seed rotation 与 TCB 断言：`rotate.sh`、`tcb-check.sh`、`tcb-allowlist.sh`、`forbidden.txt`、`files.txt`、`rotation.txt` |
| `tools/` | 非门禁的开发工具：`metrics.sh`、`context-budget.sh`、`obs.sh` |
| `ci.sh` | CI 单一入口：`nix flake check`，`--bench` 额外跑软性能检查 |

## 约定

- 新增 check：入口脚本放 `checks/`，共享实现放 `checks/lib/`，并在 `checks/default.nix`
  登记；`checks.vuna-checks-inventory` 会拒绝 orphan 脚本。
- 门禁数据（allowlist / min / budget / baseline）放 `checks/data/`，由对应脚本读取。
- 独立工具只放 `tools/`，不直接作为 check；check 通过 shell 调用。
- `seed/` 的文件只能由 `seed/rotate.sh` 更新；`files.txt` 与 `rotation.txt` 是生成物。
- 改 Nix 文件后跑 `nix fmt`；`checks.vuna-nix-fmt` 在 CI 校验格式。
