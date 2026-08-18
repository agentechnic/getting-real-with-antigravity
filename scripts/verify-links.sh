#!/usr/bin/env bash
# verify-links.sh — sanity check that every viewer.html?file=... link points to
# a markdown file that actually exists on disk, across index.html and every
# markdown page (the beats and resources cross-link to each other).
#
# Usage: bash scripts/verify-links.sh
# Exit:  0 if all good, 1 if any link is broken.

set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"

if [[ ! -f index.html ]]; then
  echo "error: index.html not found at $ROOT" >&2
  exit 2
fi

missing=0
checked=0

while IFS= read -r path; do
  [[ -z "$path" ]] && continue
  checked=$((checked + 1))
  if [[ -f "$path" ]]; then
    printf '  ok  %s\n' "$path"
  else
    printf '  MISS %s\n' "$path"
    missing=$((missing + 1))
  fi
done < <(grep -rhoE 'viewer\.html\?file=[^"'"'"' )]+' index.html beats resources \
         | sed 's|viewer\.html?file=||' | sort -u)

echo
echo "checked: $checked link(s)"
echo "missing: $missing"

# The download link on several pages points at a built artifact rather than a
# markdown file, so check it separately.
if grep -rqE '\(nussaa\.zip\)|"nussaa\.zip"' index.html beats resources; then
  if [[ -f nussaa.zip ]]; then
    echo "ok: nussaa.zip present"
  else
    echo "MISS nussaa.zip — run bash scripts/build-download.sh" >&2
    missing=$((missing + 1))
  fi
fi

if [[ $missing -gt 0 ]]; then
  echo "FAIL: some links are broken." >&2
  exit 1
fi

echo "OK: all links resolve."
