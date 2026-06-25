#!/usr/bin/env bash
set -euo pipefail

repo_url="${REPO_URL:-https://github.com/Alieforwang/codegraph-Skill.git}"
branch="${BRANCH:-main}"
target="${TARGET:-both}"
codex_dir="${CODEX_HOME:-$HOME/.codex}/skills/codegraph"
claude_dir="${CLAUDE_HOME:-$HOME/.claude}/skills/codegraph"

usage() {
  cat <<'EOF'
Usage: install.sh [--target codex|claude|both] [--repo URL] [--branch NAME]

Installs the CodeGraph skill into Codex and/or Claude skill directories.
Defaults to installing for both.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --target)
      target="${2:-}"
      shift 2
      ;;
    --repo)
      repo_url="${2:-}"
      shift 2
      ;;
    --branch)
      branch="${2:-}"
      shift 2
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown argument: $1" >&2
      usage >&2
      exit 1
      ;;
  esac
done

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
    usage >&2
    exit 1
    ;;
esac

echo "Installed CodeGraph skill for: $target"
