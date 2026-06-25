param(
  [string]$Target,
  [string]$RepoUrl,
  [string]$Branch
)

$ErrorActionPreference = 'Stop'

$RepoUrl = if ($PSBoundParameters.ContainsKey('RepoUrl')) { $RepoUrl } elseif ($env:REPO_URL) { $env:REPO_URL } else { 'https://github.com/Alieforwang/codegraph-Skill.git' }
$Branch = if ($PSBoundParameters.ContainsKey('Branch')) { $Branch } elseif ($env:BRANCH) { $env:BRANCH } else { 'main' }
$Target = if ($PSBoundParameters.ContainsKey('Target')) { $Target } elseif ($env:TARGET) { $env:TARGET } else { 'both' }
$CodexDir = if ($env:CODEX_HOME) { Join-Path $env:CODEX_HOME 'skills\codegraph' } else { Join-Path $env:USERPROFILE '.codex\skills\codegraph' }
$ClaudeDir = if ($env:CLAUDE_HOME) { Join-Path $env:CLAUDE_HOME 'skills\codegraph' } else { Join-Path $env:USERPROFILE '.claude\skills\codegraph' }

function Write-Usage {
  @'
Usage: install.ps1 [-Target codex|claude|both] [-RepoUrl URL] [-Branch NAME]

Installs the CodeGraph skill into Codex and/or Claude skill directories.
Defaults to installing for both.
'@ | Write-Host
}

function Install-Repo {
  param(
    [Parameter(Mandatory = $true)][string]$Dest
  )

  $parent = Split-Path -Parent $Dest
  New-Item -ItemType Directory -Force -Path $parent | Out-Null

  if (Test-Path (Join-Path $Dest '.git')) {
    git -C $Dest pull --ff-only origin $Branch
    return
  }

  if (Test-Path $Dest) {
    throw "Refusing to overwrite existing non-git path: $Dest"
  }

  git clone --depth 1 --branch $Branch $RepoUrl $Dest
}

switch ($Target) {
  'codex' { Install-Repo -Dest $CodexDir }
  'claude' { Install-Repo -Dest $ClaudeDir }
  'both' {
    Install-Repo -Dest $CodexDir
    Install-Repo -Dest $ClaudeDir
  }
  default {
    Write-Usage
    throw "Unknown target: $Target"
  }
}

Write-Host "Installed CodeGraph skill for: $Target"
