@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

if not exist VERSION.md (
  echo error: VERSION.md not found
  exit /b 1
)

set /p VERSION=<VERSION.md

REM Date Versioning (https://datevers.ing): the UTC release date as YY.MM.DD, plus -1, -2... for later releases that day
powershell -NoProfile -Command "$v = '%VERSION%'.Trim(); if ($v -notmatch '^\d{2}\.(0[1-9]|1[0-2])\.(0[1-9]|[12]\d|3[01])(-[1-9]\d*)?$') { exit 1 }; $d = $v.Split('-')[0]; $p = [DateTime]::MinValue; if (-not [DateTime]::TryParseExact($d, 'yy.MM.dd', [Globalization.CultureInfo]::InvariantCulture, 'None', [ref]$p)) { exit 1 }; $t = [DateTime]::UtcNow.ToString('yy.MM.dd'); if ($d -gt $t) { exit 2 }; if ($d -lt $t) { exit 3 }; exit 0"
if errorlevel 3 (
    echo Warning: VERSION.md is dated before today ^(UTC^). Releasing today? Use today's date.
) else if errorlevel 2 (
    echo VERSION.md holds %VERSION%, which is dated in the future ^(UTC^). Date Versions can't be.
    exit /b 1
) else if errorlevel 1 (
    echo VERSION.md holds %VERSION%, which isn't a Date Version ^(YY.MM.DD or YY.MM.DD-N, see https://datevers.ing^).
    exit /b 1
)
set TAG=v%VERSION%

if "%~1"=="" (
  echo usage: commit.bat "commit message"
  exit /b 1
)

git add -A
git commit -m "%~1"
if errorlevel 1 exit /b 1

git rev-parse "%TAG%" >nul 2>&1
if errorlevel 1 (
  git tag -a "%TAG%" -m "Release %TAG%"
  echo Tagged %TAG%
) else (
  echo warning: tag %TAG% already exists, skipping tag creation
)

echo Done. Push with: git push ^&^& git push origin %TAG%
