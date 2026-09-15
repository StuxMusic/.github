#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

if [ ! -f VERSION.md ]; then
  echo "error: VERSION.md not found" >&2
  exit 1
fi

VERSION=$(tr -d '[:space:]' < VERSION.md)
TAG="v${VERSION}"

if [ -z "${1:-}" ]; then
  echo "usage: ./commit.sh \"commit message\"" >&2
  exit 1
fi

git add -A
git commit -m "$1"

if git rev-parse "$TAG" >/dev/null 2>&1; then
  echo "warning: tag $TAG already exists, skipping tag creation" >&2
else
  git tag -a "$TAG" -m "Release $TAG"
  echo "Tagged $TAG"
fi

echo "Done. Push with: git push && git push origin $TAG"
