# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Date Versioning](https://datevers.ing) since v26.10.23 (`YY.MM.DD`, the UTC release date, with `-1`, `-2`… for later releases the same day); earlier releases used [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## v26.10.23

### Added

- `tests/version.sh`, which checks that `VERSION.md` is a valid Date Version, a real calendar date not in the future, and the same as the newest entry in this changelog

### Changed

- Switched from Semantic Versioning to [Date Versioning](https://datevers.ing): releases are numbered by their UTC release date as `YY.MM.DD`, with `-1`, `-2`… for later releases the same day. This release follows v1.1.5
- `commit.sh` and `commit.bat` refuse a `VERSION.md` that isn't a valid Date Version or is dated in the future (UTC), and warn when it's dated before today
- `README.md` and `CONTRIBUTING.md` describe Date Versioning and the release steps

## [Unreleased]

## [1.1.5] - 2026-09-16
### Fixed
- `profile/README.md`'s "Our Activity" widget referenced `raw.githubusercontent.com/StuxMusic/.github/metrics/stats.svg`, but this repo had no workflow generating it — added `generateMetrics.yml`, matching the one already used by Stux.Group/StuxAPIs/Stuxedo/Stux.Cloud/Stux.Dev.

## [1.1.4] - 2026-09-16
### Added
- `profile/README.md` gained the "Our Projects" table (Website, StuxSharp.com, Sharp.Stux.Music), a `legal@stux.music` contact line, and the "Our Activity" widget, matching the fuller template already used by Stux.Group's own profile.

## [1.1.3] - 2026-09-16
### Fixed
- `README.md`'s copyright line named `Stux.Group` (a brand, not a legal entity) — corrected to `Stux Group Ltd`.
- `README.md` and `profile/README.md` still used the old `global.media.stux.group` logo/icon (with a leftover `alt="Stux.Group"` on the header logo) from before Stux.Music got its own branding — corrected to `global.media.stux.music/logo.png` and `/icon.png`.

## [1.1.2] - 2026-09-16
### Added
- Bluesky and LinkedIn badges (`bsky.app/profile/stux.music`, `linkedin.com/company/stuxmusic`) in the "Connect with Us!" section, alongside the existing GitHub followers badge.

## [1.1.1] - 2026-09-15
### Fixed
- `README.md` and `profile/README.md`'s Stux.Group brand icon URL had a leftover duplicated `/global/` path segment (`global.media.stux.group/global/icon.png`) — corrected to `https://global.media.stux.group/icon.png`

## [1.1.0] - 2026-09-15
### Changed
- Rewrote the org profile and root READMEs to match the StuxAPIs `.github` pattern (welcome/mission/contact sections, shared footer block), fixed "Stux Music" to "Stux.Music", and added the "Independent Music, Done Right!" slogan.

## [1.0.1] - 2026-09-15
### Added
- `.gitignore` for OS/editor cruft.

## [1.0.0] - 2026-09-15
### Added
- Initial project scaffold.
