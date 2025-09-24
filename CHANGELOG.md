# Changelog

All notable changes to **Theom** will be documented in this file.

> This project follows a loose [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) format and uses [GitHub releases](https://github.com/axos-project/theom/releases) as the primary source.

---

## [4.0.2] - 2025-09-24

### Changed

- Install script to install the `theom.desktop` file to `_theom.desktop`.

### Removed

- Few wallpapers which didn't match Theom well.

## [4.1.1] - 2025-09-24

### Added

- `i3status` to dependencies.

## [4.1.0] - 2025-09-22

### Added

- glone-polkit (#28)
- autotiling support
- bluetooth applet autostart (#29)
- `theom-kblayout-switch` binary for switching kblayout (#40)
- `theom-brightness-mgr` binary with brightnessctl and ddcutil support.

### Changed

- `use_eww` under `[bar]` to `use_bar` which can take either "ewwii" or "polybar" in `config.toml`.
- New default wallpaper (`natures-mountain-waters.jpg`).
- New default theme (`light`).

## [4.0.1] - 2025-08-20

### Added

- `rule:` merging in `tcomp-gen` to have easy support for modern picom config.

### Fixed

- The bug where inactive dim didn't trigger on fancy animation mode.

## [4.0.0] - 2025-07-22

### Added

- Default configuration for **rofi**, **alacritty**, and **dunst**.
- `update-theom-appconfs` binary which would set the default configuration of **rofi**, **alacritty**, and **dunst**.
- Fancier animation to fancy animation mode.
- `gammastep` to theom to provide night light filter support.
- `gammastep-tapplet` binary to autolaunch gammastep and also provide an easy UI to manage gammastep.
- `enable_nightlight` key in theom config (~/.config/theom/config.toml) to enable/disable nightlight filter (disabled by default).
- Theom configuration templates. They can be found in `/usr/share/theom/templates/config.toml.d/` directory.

### Fixed

- eww launch script to prevent eww glitches that has been bothering us since `v0.5.6`.
- eww bar volume control glitches.
- `tscdScript` which created incorrect directory.

### Changed

- `tcomp-gen` to consider perfromance mode as the default mode.
- `tosd` launch scripts to have better UI (User Interface).
- `tcomp-gen` to merge picom configs to create one full config instead of merging .jsons to create one full picom config.
- `flameshot` configuration to be hidden tray application by default.
- Wallpapers compression to decrease size.
- Default wallpaper to `mountains.jpg` (resolution decreased).
- Default polybar layout. New layout is "float".
- `exec_always` theom autostart to offload the process of setting wallpaper.

### Removed

- `i3-wm` from dependencies.

### Notes and Information

- With this update, `tosd` is not deprecated anymore.
- The default configuration added to **rofi**, **alacritty**, and **dunst** will help them find a configuration file. Previously, theom used directories named **light** and **dark**. Due to this, only theom could assign the applications to those configuration instead of the applications finding it themselves. The new `update-theom-appconfs` binary will people set their default configuration which the applications can find by themselves.
- The new picom configuration architecture introduced in `v3.0.0` has been changed to decrease the number of errors, complexity and also to improve flexibility.

## [3.0.1] - 2025-07-13

### Fixed

- Invisible eww bar bug.

### Removed

- migrate_file which checked if we had to migrate or not.

## [3.0.0] - 2025-07-13

### Added

- `--list-logs` flag to `theom` command.
- New wallpapers.
- `tcomp-gen` - a tool that generates compositor configuration files.
- Multiple animation support (none, basic, fancy).
- **--migrate** flag to `theom-setup`
- Outdated version popup warning which provides the user an option to migrate.
- **migrate_config** file in `/usr/share/theom/` that would define whether user should migrate to a newer configuration.

### Changed

- Default wallpaper. `aesthetic_deer` changed to `mountains.jpg`.
- `theom` binary to include `tcomp-gen` as a new core binary.
- Logout popup to say **theom** instead of **i3**.

### Fixed

- `tscdScript` to create `~/.local/state/theom` correctly.
- `tscdctl` printing unnecessary information in stdout.
- `theom-setup` which copied exec_always autostart to the wrong directory.

### Reworked

- Theom compositor (picom) structure to be flexible.

### Notes and Information

> This is a new major release of theom.
> This major version reconfigures the structure of theom's compositor (picom) configuration, and provides a better user experience with the compositor.
> Theom now relys on `tcomp-gen` binary which would generate the static configuration file based on multiple smaller snippets of .json files.

> Theom now also has a popup warning that users can use to easily migrate their configuration to the latest without even losing their customization!
> Theom automatically inserts the new changes that doesn't exist on your current configuration during the migration without touching any other modifications. To migrate via the terminal, users can run `theom-config --migrate` instead of having to reboot to get the popup warning that asks to migrate.

## [2.3.0] - 2025-07-09

### Added

- `i3status` to optional dependencies.
- Basic lock screen.

### Changed

- eww launch script to launch eww without creating any zombie process.
- eww open systray script to work with new version of `xfsrtray`.

## [2.2.0] - 2025-07-06

### Added

- New check in `theom --dry-run` to see if x11 detects the monitors.

### Changed

- Replaced `theom-systray`.

## [2.1.0] - 2025-06-30

### Added

- `extra_config.conf` where users can add extra WM configuration. Path to `extra_config.conf` is `~/.config/theom/.win/extra_config.conf`.
- Logging support for `theom-setup` for better error debugging. `theom-setup` logs are stored at `~/.local/state/theom/logs/setup.logs`.
- Logging support for `start-picom.sh` for debugging the compositor. Log path: `~/.local/state/theom/logs/compositor.logs`
- Logging support for `show-widgets.sh` for debugging conky widgets. Log path: `~/.local/state/theom/logs/show-widgets.sh`

### Changed

- Path to osd snippets. (~/.config/theom/osd-snippets -> ~/.config/theom/.osd-snippets).
- `THEOM_SYSTEM` path. (~/.config/THEOM_SYSTEM/ -> ~/.local/state/theom/).

### Fixed

- Fixed `osd-snippet` wrapper which used the previous theom configuration path (~/.config/.theom/).
- Fixed outdated osd scripts.

### Removed

- `tscdctl` support from `theom-packages`. `tscdctl` will be now found at `/usr/share/theom/scripts/tscdctl`.

## [2.0.0] - 2025-06-26

### Added

- `--checkup`, `-c` argument for theom-config.
- More wallpapers to theom.
- `tcheatsheet` application so that users can use it to see default `theom keybindings`.
- New default keybinding for `tcheatsheet` (Super+f1).
- Added `/usr/share/theom/version` file to store theom version (Useful to migrate from future breaks).

### Changed

- `theom-setup` so that it wont output the logs of `tscdScript`.
- Changed wallpaper path (`/usr/share/backgrounds/` -> `/usr/share/backgrounds/theom`).
- `theom-welcome` so that it relies on `theom-config` for getting/setting values in theom configuration.
- Path to theom widgets (`~/.config/widgets/` -> `~/.config/theom/twidgets/`)

### Fixed

- `show-widgets.sh` script which is responsible for showing widgets on the screen.
- Config directory path in `theom` script (dry run).
- Window manager to use new path.

### Removed

- `Enable on screen display effects` option from theom greeter.
- All reference to previous config path (`~/.config/.theom/`) in all `theom-packages`.

### Credits

- Thank's to [@ardox](https://github.com/levraiardox) for giving me the permission to use wallpapers from [axos wallpaper collection](https://github.com/AxOS-project/wallpapers) which helped me by a ton.

### Reasons and Pledges

> With T2 (Theom 2.0), I pledge to:
>
> - Follow [Semantic Versioning v2](https://semver.org/) precisely.
> - Ensure that major breaking changes only occur in major versions (e.g., 3.x, 4.x).
> - Test every release for usability and configuration stability before public rollout.
> - Handle all future breaking configuration or widget path changes via automated migration tools.

---

## [1.2.1] - 2025-06-22

### Changed

- Default wallpaper (dunes-sun -> aesthetic_deer)

### Fixed

- Broken scripts (scripts broken by 1.2.0 `theom-config` change)

---

## [1.2.0] - 2025-06-22

### Added

- Better starship theme for terminal.

### Changed

- Theom packages (settings & dashboard) to be sleek, modern and fast.
- Theom config directory path.

### Fixed

- Theom packages so that they can rely on `theom-config` for setting/getting values.

> [!CAUTION]
> This version of theom is broken due to the core scripts not being upto date with `theom-config`
> It is recommended to install the 1.2.1 version as it addressed the broken scripts.

---

> ⚠️ Note on Package Compatibility:
> Earlier versions of Theom (prior to 1.2.0) followed a bad configuration path.
> Previously, the configuration directory had a leading `.` in the `~/.config` directory.
> Directories with leading `.` are not supposed to be used in `~/.config`, as stated by XDG.
> So, starting from version 1.2.0, theom packages will now follow the new path (`~/.config/theom`) to function.
> If you use a version prior to 1.2.0, theom packages such as the settings, dashboard etc. will stop functioning as intended.
> If you are fine with that, then the core desktop environment will still work fine but at the cost of losing the official GUI applications of theom.
> This wont happen again since all theom packages have updated and they now rely on `theom-config` directly to set/get values.

---

## [1.1.0] - 2025-06-18

### Added

- Autostarts (`~/.config/.theom-autostarts/exec_once.sh` & `~/.config/.theom-autostarts/exec_always.sh`) to make theom more customisable.
- Scripts oriented to improving user experience (`~/.config/.theom/user_scripts/`).
- Theom control (Currently only used to add/list autostarts).

### Fixed

- gvfs not installed on system.

### Removed

- Alacritty (default terminal) dark theme transparency.

## [1.0.1] - 2025-06-16

### Fixed

- Eww calendar not opening

---

## [1.0.0] - 2025-06-16

🎉 **First Stable Release**

Theom has matured into a reliable, customizable desktop experience. Version 1.0.0 marks a major milestone in stability, feature completeness, and usability. This release introduces polish-focused improvements, better documentation, and greater robustness across the board.

### Added

- **Manual Pages**: `man theom`, `man theom-setup`, `man theom-config`
- **Command-line improvements** for `theom` binary:
  - `--help`: shows usage
  - `--version`: shows current version
  - `--dry-run`: starts Theom without committing system changes
- **New documentation files**:
  - `CHANGELOG.md` for structured release notes
  - `TODO.md` for roadmap visibility
  - `PERFORMANCE.report` for performance insights
- **Proper credits** for wallpaper and asset authors in the README

### Changed

- **Eww bar**: Fixed font-size scaling bug in widgets
- **Systray visuals**: Polished integration with `theom-systray`
- **Default theme**: Changed the default theme from light to dark

### Meta

- **Marked as stable (1.0.0)** after extensive internal testing
- **Compatibility mode** (e.g. VM, low-end hardware) confirmed working reliably
- No known bugs at time of release

### Semver & Future Commitments

> Theom now follows [Semantic Versioning 2.0.0](https://semver.org/).  
> Breaking changes will increment the major version.  
> Backward-compatible improvements will be in minor and patch updates.

> This changelog is maintained in [Keep a Changelog](https://keepachangelog.com/en/1.0.0/) style  
> and will reflect all future GitHub release content.

---

This release is for users and contributors who want a solid, predictable starting point. Expect future updates to refine and build upon this foundation, without breaking what works.

## [0.9.0] - 2025-06-14

### Added

- Systray support to the eww bar (`theom-systray` package)

### Fixed

- `theom-welcome` now starts correctly

---

## [0.8.0] - 2025-06-08

### Added

- Improved time widget placement

### Removed

- Network icon from the eww bar

### Fixed

- Eww not launching
- Music play icon bug in eww

---

## [0.7.0] - 2025-06-06

### Added

- Widget support using Conky
- A few default Theom widgets
- Two modes in picom (performance and compatibility)
- Improved VM compatibility - now works without 3D Accel

### Fixed

- Dunst foreground bug
- Picom theme bug

---

## [0.6.1] - 2025-06-06

### Added

- New wallpapers (Axos wallpaper collection)
- Default wallpaper
- Tnotifications (notification GUI)
- Capitaine cursor as new default
- Improved eww bar

### Fixed

- MPD playback bug

---

## [0.6.0] - 2025-05-31

> ⚠️ This version is incomplete and intended to fix stability issues from 0.5.9.

### Added

- Eww static systray items
- `tscdctl` (Theom Scary Config Demon Control)
- Welcome notification on first login
- Config fallback for missing `keybindings.conf`

### Fixed

- Potential DE black screen and broken keybindings from 0.5.9

---

> ⚠️ Note on Version History:
> Earlier versions of Theom (prior to 0.6.0) followed an informal versioning scheme.
> Releases were made when significant updates were ready, not necessarily in sequence.
> As such, some version numbers (e.g., 0.2, 0.3) were skipped or never publicly released.
> Starting from version 0.6.0, versioning has become more consistent.

---

## [0.5.9] - 2025-05-30

> ❌ Deprecated due to major bug.

### Added

- Better eww integration
- Switched config from `.json` to `.toml`
- Customizable keybindings

### Fixed

- Several eww and polybar bugs

### Upcoming (Preview)

- Dark theme
- Light GTK theme
- Basic systray functionality
- Better theming support

---

## [0.5.6] - 2025-05-26

### Changed

- Major overhaul of Theom packages
- Beginning transition from Polybar to Eww

---

## [0.5.5] - 2025-05-24

### Changed

- New default wallpaper set

---

## [0.5.4] - 2025-05-24

### Fixed

- General bug fixes and minor improvements to packages

---

## [0.5.0] - 2025-05-20

### Major Changes

- New UI design
- MPD integration for music
- Dashboard added
- Improved all core applications

> Many other changes — some undocumented.

---

## [0.4.0] - 2025-05-16

### Added

- Light mode
- Welcome screen
- Theom settings app
- Better default compositing
- Improved stability

---

## [0.1.0] - 2025-05-09

### Initial release

- Theom goes public 🎉

---
