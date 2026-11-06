<p align="center">
  <picture><source media="(prefers-color-scheme: dark)" srcset="https://global.media.stux.music/logo-light.png"><source media="(prefers-color-scheme: light)" srcset="https://global.media.stux.music/logo-dark.png"><img src="https://global.media.stux.music/logo-dark.png" height="100" alt="Stux.Music Logo"></picture>
</p>

# .github

*Independent Music, Done Right!*

The central repository for the Stux.Music GitHub organization configuration and profile settings.

## Overview

This repository contains the organization-wide configuration files for the Stux.Music GitHub profile, including community health files and the org's public profile page.

## What's Included

- **Profile**: the public org profile shown at [github.com/StuxMusic](https://github.com/StuxMusic) (`profile/README.md`), with the table of the org's projects and a link to [status.stux.music](https://status.stux.music)
- **Community Files**: contributing guidelines and other org-wide defaults
- **Metrics**: `.github/workflows/generateMetrics.yml` draws the profile's "Our Activity" image daily onto the `metrics` branch

## How It Works

GitHub automatically applies files from this `.github` repository to all public repositories in the organization (when a specific repository doesn't have its own version), and renders `profile/README.md` as the org's public profile page.

## Getting Started

```bash
git clone https://github.com/StuxMusic/.github.git
cd .github
```

## Development

See [CONTRIBUTING.md](CONTRIBUTING.md) for the development workflow and release process.

## Versioning

This project uses [Date Versioning](https://datevers.ing): each release is numbered by its UTC release date as `YY.MM.DD` (for example `26.10.23`), with `-1`, `-2`… for later releases the same day. See [CHANGELOG.md](CHANGELOG.md) for what changed in each release.

Work happens on the `test` branch: releases are committed and tagged there, and go live when Leo merges its pull request into `main`. See [CONTRIBUTING.md](CONTRIBUTING.md#branches).

## Copyright

Copyright © 2026 Stux Group Ltd. All rights reserved.

---

*Built & Maintained by <picture><source media="(prefers-color-scheme: dark)" srcset="https://global.media.stux.music/icon-light.png"><source media="(prefers-color-scheme: light)" srcset="https://global.media.stux.music/icon-dark.png"><img src="https://global.media.stux.music/icon-dark.png" height="14" valign="middle" alt="Stux.Music"></picture> [Stux.Music](https://github.com/StuxMusic), Hosted by <picture><source media="(prefers-color-scheme: dark)" srcset="https://global.media.stuxedo.com/icon-light.png"><source media="(prefers-color-scheme: light)" srcset="https://global.media.stuxedo.com/icon-dark.png"><img src="https://global.media.stuxedo.com/icon-dark.png" height="14" valign="middle" alt="Stuxedo"></picture> [Stuxedo](https://stuxedo.com).  
Stux.Music is a part of the <picture><source media="(prefers-color-scheme: dark)" srcset="https://global.media.stux.group/icon-light.png"><source media="(prefers-color-scheme: light)" srcset="https://global.media.stux.group/icon-dark.png"><img src="https://global.media.stux.group/icon-dark.png" height="14" valign="middle" alt="Stux.Group"></picture> Stux.Group brand of businesses.*
