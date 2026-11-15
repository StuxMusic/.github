#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

# Releases are made on test (or a branch off it). staging and main only change through
# pull requests: test -> staging -> main.
BRANCH="$(git -C "$(dirname "${BASH_SOURCE[0]}")" rev-parse --abbrev-ref HEAD)"
if [ "$BRANCH" = "main" ] || [ "$BRANCH" = "staging" ]; then
    echo "You're on $BRANCH. Releases are made on test, then go test -> staging -> main through pull requests: git switch test" >&2
    exit 1
fi

if [ ! -f VERSION.md ]; then
  echo "error: VERSION.md not found" >&2
  exit 1
fi

VERSION=$(tr -d '[:space:]' < VERSION.md)

# Date Versioning (https://datevers.ing): the UTC release date as YY.MM.DD, plus -1, -2... for later releases that day
DATE="${VERSION%%-*}"
if ! [[ "$VERSION" =~ ^[0-9]{2}\.(0[1-9]|1[0-2])\.(0[1-9]|[12][0-9]|3[01])(-[1-9][0-9]*)?$ ]] \
    || ! date -u -d "20${DATE//./-}" >/dev/null 2>&1; then
    echo "VERSION.md holds '$VERSION', which isn't a Date Version (YY.MM.DD or YY.MM.DD-N, see https://datevers.ing)." >&2
    exit 1
fi
TODAY="$(date -u +%y.%m.%d)"
if [[ "$DATE" > "$TODAY" ]]; then
    echo "VERSION.md is dated $DATE, after today ($TODAY UTC). Date Versions can't be in the future." >&2
    exit 1
elif [[ "$DATE" < "$TODAY" ]]; then
    echo "Warning: VERSION.md is dated $DATE, but today is $TODAY (UTC). Releasing today? Use $TODAY." >&2
fi
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

echo "Push with: git push origin $BRANCH --tags"
echo "Then open a pull request into staging: gh pr create --base staging --head $BRANCH"
echo "Once staging is checked, open one from staging into main: gh pr create --base main --head staging"
