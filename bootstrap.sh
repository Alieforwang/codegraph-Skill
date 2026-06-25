#!/usr/bin/env bash
set -euo pipefail

repo_url="${REPO_URL:-https://github.com/Alieforwang/codegraph-Skill.git}"
branch="${BRANCH:-main}"
target="${TARGET:-both}"
codex_dir="${CODEX_HOME:-$HOME/.codex}/skills/codegraph"
claude_dir="${CLAUDE_HOME:-$HOME/.claude}/skills/codegraph"

ensure_codegraph() {
  if command -v codegraph >/dev/null 2>&1; then
    return
  fi

  if command -v curl >/dev/null 2>&1; then
    curl -fsSL https://raw.githubusercontent.com/colbymchenry/codegraph/main/install.sh | sh
    return
  fi

  echo "codegraph is missing and curl is unavailable; install CodeGraph first." >&2
  exit 1
}

install_repo() {
  local dest="$1"
  mkdir -p "$(dirname "$dest")"

  if [[ -d "$dest/.git" ]]; then
    git -C "$dest" pull --ff-only origin "$branch"
    return
  fi

  if [[ -e "$dest" ]]; then
    echo "Refusing to overwrite existing non-git path: $dest" >&2
    exit 1
  fi

  git clone --depth 1 --branch "$branch" "$repo_url" "$dest"
}

ensure_codegraph

case "$target" in
  codex)
    install_repo "$codex_dir"
    ;;
  claude)
    install_repo "$claude_dir"
    ;;
  both)
    install_repo "$codex_dir"
    install_repo "$claude_dir"
    ;;
  *)
    echo "Unknown target: $target" >&2
    exit 1
    ;;
esac

echo "CodeGraph bootstrap complete for: $target"
