#!/usr/bin/env bash
# The checks CI runs. Run them before you push: scripts/check.sh
set -euo pipefail
cd "$(dirname "$0")/.."

echo "== plugin manifest and skill"
claude plugin validate .

echo "== no em dashes in tracked markdown"
if git grep -n $'—' -- '*.md'; then
  echo "error: em dash found, use a comma or a period" >&2
  exit 1
fi
echo "ok"
