# Contributing

Thanks for your interest in contributing to this project.

## Development Workflow

1. Work on `test`, or on a feature branch off it (see Branches).
2. Make focused, well-described commits.
3. Describe your changes in a new release entry at the top of `CHANGELOG.md` (see Versioning below).
4. Open a pull request from `test` into `main` (see Branches).

## Code Style

- Keep the org profile's **Our Projects** table (`profile/README.md`) in step with the org's repos: add a row when a repo
  or site is created, remove it when one is retired. Use each project's full name ("Stux.Music Status", not "Status").
  Link public repos to the repo, and private ones to their live site (or leave them unlinked if they have none).
- Logos and icons use the light/dark `<picture>` style with the brand's `-light`/`-dark` files from its `global.media`
  host, never a local copy.

## Branches

- Work on `test`, or on a feature branch off it. Never push to `main`
- Changes reach `main` only through a pull request from `test` into `main`, which needs CI to pass and is reviewed and merged by Leo
- Merging into `main` updates the org profile at github.com/StuxMusic; release commits and tags are made on `test` (`git push origin test --tags`) and go live when the pull request is merged

## Versioning

This project uses [Date Versioning](https://datevers.ing). To release:

1. Add a `## vYY.MM.DD` entry at the top of `CHANGELOG.md`, with its sections in this order: Added, Changed, Fixed, Removed, Security, Deprecated.
2. Set `VERSION.md` to the same bare version (no `v`): today's **UTC** date as `YY.MM.DD`, or `YY.MM.DD-1`, `-2`… for later releases the same UTC day. Never a future date. Use UTC, not local time: just after midnight in the UK it is still the previous day in UTC.
3. Run `bash tests/version.sh`.
4. Run `./commit.sh` (or `commit.bat` on Windows). It checks the version, commits and tags `vYY.MM.DD`, and never pushes.
