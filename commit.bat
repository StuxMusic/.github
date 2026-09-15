@echo off
setlocal enabledelayedexpansion

cd /d "%~dp0"

if not exist VERSION.md (
  echo error: VERSION.md not found
  exit /b 1
)

set /p VERSION=<VERSION.md
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
