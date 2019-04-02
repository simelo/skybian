# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

<!--
Use this tags to keep track of the changes:

- Added: for new features.
- Changed: for changes in existing functionality.
- Deprecated: for soon-to-be removed features.
- Removed: for now removed features.
- Fixed: for any bug fixes.
- Security: in case of vulnerabilities.

Dates must be YEAR-MONTH-DAY
-->

## Unreleased (0.0.4) - TBD

### Added

- Added latest Skywire mainnet developer code
- Added new systemd units and scripts

### Changed

- OS upgraded to Armbian 5.75 with kernel 4.19.20
- Armbian changed the layout of the filesystem and the boot firmware, so we changed to adapt to that.
- Config offset is now at block #32768 (of 512 bytes) higher than in previous versions
- Armbian changed/turned-off the debug output in the serial console, be patient it will came with a prompt in about 1 minute
- Upgraded go to version 1.12.1

## Deprecated

- Skyflash at this point needs to be modified to work with this because of the change on the filesystem layout of armbian


## Testing pre-release (0.0.3) - 2019-02-02

### Added

- First working version of Skybian
- Explanatory document about the build process: [Build_Skybian.md](Build_Skybian.md)
- This CHANGELOG file

### Changed

- Renamed the environment.txt file to build.conf to better represent that it is a configuration file.
- Travis yml build and deploy instructions update to match git flow logic.
- Updated README.md with a comment on the build process on the [Build_Skybian.md](Build_Skybian.md) file.
- Versioning of skybian will match the skywire ones, starting with 0.0.3
