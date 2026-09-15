# Contributing

Thanks for your interest in contributing to this project.

## Development Workflow

1. Create a feature branch off `main`.
2. Make focused, well-described commits.
3. Add your changes under the `[Unreleased]` section of `CHANGELOG.md`.
4. Open a pull request against `main`.

## Release Process

Releases follow [Semantic Versioning](https://semver.org/) (MAJOR.MINOR.PATCH):

1. Move the `[Unreleased]` entries in `CHANGELOG.md` under a new version heading.
2. Bump the version number in `VERSION.md`.
3. Update `README.md` if anything user-facing changed.
4. Run the commit script to commit and tag the release:
   - macOS/Linux: `./commit.sh "Release message"`
   - Windows: `commit.bat "Release message"`
5. Push the commit and tag: `git push && git push origin <tag>`.

## Code Style

Project-specific conventions will be documented here as they're established.
