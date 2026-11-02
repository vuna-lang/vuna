# 仓库探索指南（指针）

本文只需要一句话：**探索仓库时按场景选工具，规则见技能
[`.agents/skills/repo-navigation/SKILL.md`](../../.agents/skills/repo-navigation/SKILL.md)。**

## 为什么放在技能里

探索指南是**给 agent 的操作规程**，不是给人类的参考文档。放在 `.agents/skills/` 后：

- agent 在开始探查时能直接加载它（技能目录会自动发现 `.agents/skills/<name>/SKILL.md`）；
- 只有一份事实来源，不会出现「技能与文档各说一套」的漂移。

## 要点速记

详细规则看技能文件，这里只留最容易记错的三条：

1. **要改的模块 → 整篇 `read`**；不需要改的才用查询工具。分界线是「是否会出现在
   `git diff` 里」，不是「是否熟悉」。
2. **不改、只引用 → `vuna map` / `vuna api`，不要 grep**。grep 拿多（家族名噪音）、
   拿少（多 clause 函数）、拿不到签名。`--find` 用**完全限定名**（短名只取第一个匹配）。
3. **探索完必须落盘**：把数据流 / 不变量 / 边界写进 `docs/`，并接进 `AGENTS.md` 与
   `README.md` 的导航。

## 相关阅读

- 入口纪律与不变量：[AGENTS.md](../../AGENTS.md)
- 子系统地图与链路入口符号：[architecture.md](../architecture.md)
- 已知边界汇总：[reference/limits.md](limits.md)
- DT 阶段状态与当前阻碍：[docs/roadmap.md](../roadmap.md)（「阶段状态总览」）
