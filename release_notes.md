Bug fix and improvement release.


### Fixed

- **Dashboard `/login` now accepts `multipart/form-data` in addition to `application/x-www-form-urlencoded`.** Scripted callers using `curl -F password=...` were silently rejected by the login form because the handler only parsed urlencoded bodies and treated multipart bodies as a single un-decoded blob, so `formPassword` ended up empty and the page re-rendered with "Invalid password". Both content types now produce the same field extraction and session cookie. The browser form behavior is unchanged (still urlencoded). (#108)


## Install / Upgrade

Download `WindrosePlus.zip`, extract into your Windrose Dedicated Server folder, run `install.ps1`. Reinstalling is safe — your configs and custom mods are preserved. See [the installation guide](https://github.com/HumanGenome/WindrosePlus#installation) for details.

## Official Hosting

[SurvivalServers.com](https://www.survivalservers.com/services/game_servers/windrose/?utm_source=github&utm_medium=release_notes&utm_campaign=windrose_plus) sponsors Windrose+ development and offers Windrose servers with Windrose+ pre-installed.
