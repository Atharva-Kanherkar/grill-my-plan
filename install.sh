#!/usr/bin/env bash
set -euo pipefail

target="${CODEX_HOME:-$HOME/.codex}/skills/grill-with-docs"
source_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$(dirname "$target")"
rm -rf "$target"
cp -R "$source_dir" "$target"
rm -rf "$target/.git"

printf 'Installed grill-with-docs to %s\n' "$target"
