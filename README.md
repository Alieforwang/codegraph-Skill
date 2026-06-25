# CodeGraph Skill

Language: [中文](#中文) | [English](#english)

## 中文
CodeGraph 用来帮助 Codex 和 Claude 读取已建索引的代码库，快速查符号、调用链、路径关系和相关文件。

## 安装
把这个仓库放到你的技能目录里，然后重启 Codex 或 Claude。

```bash
git clone https://github.com/Alieforwang/codegraph-Skill.git ~/.codex/skills/codegraph
```

```powershell
git clone https://github.com/Alieforwang/codegraph-Skill.git $env:USERPROFILE\.codex\skills\codegraph
```

## 一键安装
当 `codegraph` 还没安装时，先跑 bootstrap 脚本。它会先安装 CodeGraph CLI，再把这个 skill 装到 Codex、Claude，或者两边都装。

```bash
curl -fsSL https://raw.githubusercontent.com/Alieforwang/codegraph-Skill/main/bootstrap.sh | bash
```

```powershell
irm https://raw.githubusercontent.com/Alieforwang/codegraph-Skill/main/bootstrap.ps1 | iex
```

只装一个环境时：

```bash
bash bootstrap.sh --target codex
bash bootstrap.sh --target claude
```

```powershell
.\bootstrap.ps1 -Target codex
.\bootstrap.ps1 -Target claude
```

## 仅安装 skill
如果 `codegraph` 已经装好，就直接用 install 脚本。

```bash
bash install.sh --target both
```

```powershell
.\install.ps1 -Target both
```

## 使用
装完以后重启 Codex 或 Claude。

项目里已经有 `.codegraph/` 索引时，可以直接问：

- `X` 定义在哪
- `Y` 被谁调用
- `A` 到 `B` 的路径是什么
- 这个功能相关的文件有哪些

[Back to top](#codegraph-skill)

## English
CodeGraph helps Codex and Claude inspect indexed codebases with symbol lookup, call paths, related files, and project-aware exploration.

## Install
Clone this repo into your skills directory, then restart Codex or Claude.

```bash
git clone https://github.com/Alieforwang/codegraph-Skill.git ~/.codex/skills/codegraph
```

```powershell
git clone https://github.com/Alieforwang/codegraph-Skill.git $env:USERPROFILE\.codex\skills\codegraph
```

## One-command setup
Use the bootstrap scripts when `codegraph` is not installed yet. They install the CodeGraph CLI first, then install this skill for Codex, Claude, or both.

```bash
curl -fsSL https://raw.githubusercontent.com/Alieforwang/codegraph-Skill/main/bootstrap.sh | bash
```

```powershell
irm https://raw.githubusercontent.com/Alieforwang/codegraph-Skill/main/bootstrap.ps1 | iex
```

To target only one environment:

```bash
bash bootstrap.sh --target codex
bash bootstrap.sh --target claude
```

```powershell
.\bootstrap.ps1 -Target codex
.\bootstrap.ps1 -Target claude
```

## Skill install only
If `codegraph` is already installed, use the install scripts directly.

```bash
bash install.sh --target both
```

```powershell
.\install.ps1 -Target both
```

## Use
After install, restart Codex or Claude.

Once a project has a `.codegraph/` index, ask things like:

- Where is `X` defined?
- Who calls `Y`?
- What is the path from `A` to `B`?
- Which files are related to this feature?

[Back to top](#codegraph-skill)
