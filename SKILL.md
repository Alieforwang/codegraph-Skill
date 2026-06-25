---
name: codegraph
description: Use CodeGraph to inspect indexed repositories with symbol lookup, call paths, and project-aware exploration. Use when a repo has a `.codegraph/` index, when the user asks to use CodeGraph, or when they need to locate symbols, follow callers/callees, trace paths, or understand code relationships.
---

# Codegraph

## Quick Use

- Prefer CodeGraph before `grep`, `find`, or broad file reads when `.codegraph/` exists in the repo root.
- Use the MCP tools `codegraph_explore`, `codegraph_node`, `codegraph_query`, and `codegraph_files` when available.
- If MCP tools are unavailable, use the CLI equivalents: `codegraph explore`, `codegraph node`, `codegraph query`, and `codegraph files`.
- If the project is not indexed yet, run `codegraph init` first, then confirm with `codegraph status`.

## What To Ask

- "Where is `X` defined?"
- "Who calls `Y`?"
- "Trace the path from `A` to `B`."
- "What files are related to this feature?"
- "Summarize the code around symbol `Z`."

## Guidance

- Keep questions tight and repository-specific. CodeGraph is best for structure, ownership, and call chains, not for editing code.
- If a repository has no `.codegraph/` index, do not force this skill; index first or fall back to normal file search.
