# What is Skybian?

[![Build Status](https://travis-ci.org/simelo/skybian.svg?branch=develop)](https://travis-ci.org/simelo/skybian)

Skybian is an [Armbian-based](https://www.armbian.com/) Operating System that contains the Skycoin-Skywire software and it's dependencies.

Currently, only the [Orange Pi Prime](http://www.orangepi.org/OrangePiPrime/) is supported.

## Why Debian, Armbian?

[Debian](https://www.debian.org) is a stable and widely supported Linux OS.  Unfortunately, there is no straightforward way to install it on a [Single Board Computer](https://en.wikipedia.org/wiki/Single-board_computer) (SBC).

Armbian simplifies the process by providing System Images that contain the components required to run Debian on ARM and ARM64 architectures.

## building over Armbian Binary Images vs Starting from Scratch

Working over existing images has a few advantages:

* Simplified development: we avoid duplicating the work required to create/maintain filesystems, kernels, boot scripts and other standard system components.  This allows us to concentrate on customizing SBC Images tailored for target hardware
* Armbian supports a variety of SBC's.  Thanks to the work done by the Armbian team; porting the Skywire Software in the future for other Armbian-powered SBC's will be relatively easy
* Working over a system image is easier and GNU/Linux tools are familiar

## We follow a few simple guidelines to archive our goal:

* Build atop of the latest non-GUI version of Armbian
* Prepare image; install the required software and dependencies
* Build from one base root filesystem for both Master and Minion nodes
* Scripts & tests must be fully automatic; integrate with other tools to ease the dev cycle (travis 'et al')
* All non-workspace related files, binaries (beside final images) are excluded in the repository (or it will grow 'ad infinitum' with useless data)
* Client's will use Skybian releases as a base-image and may tune it to their particular environment with the [Skyflash](https://github.com/skycoin/skyflash) tool

## Development process

If you plan to build the image yourself or to contribute with the project and test it, then you must take a peek on [this document](Building_Skybian.md) that describe the whole build process and some software dependencies you need to solve in order to successfully run the `build.sh` script.

The dev process happens in a linux PC, Ubuntu 18.04 LTS is the system of choice, but any debian like version with the dependencies must work.

This repository has two main branches:

* `master` this is the latest stable and production safe branch, release files are the code & the result of run the master branch.
* `develop` this is the latest code with new features and solution to known issues, and new features. It must not be used for production.

## Releases

To do a release you must follow these steps:

0. Check if there are commits on the master branch that must be applied to develop (hot fixes or security ones), apply them and fix any merge issues.
0. On develop branch, check any pending issues in order to close them if possible on this release and close them is possible.
0. Merge the develop branch into the release one and fix any conflicts if any.
0. Update the new version number in the `build.conf` file.
0. Update the `CHANGELOG.md` file with any needed info and move the `Unreleased` part to the new release version.
0. Review & update the `README.md` file for any needed updates or changes that need attention in the front page.
0. Wait for travis to validate all the changes (can take more than 30 minutes)
0. On success, tag the code at this point with `release-X.Y.Z-rc`, then wait for travis completion and check the draft release is published on the repository with the Skybian-X.Y.Z-rc.tar.xz file.
0. Download the Skybian-X.Y.Z-rc.tar.xz file from Github and test manually that Skyflash can work with it and generate the images for the default values.
0. Test the generated images in real hardware (a manager and two nodes at least) to detect any issues.
0. Fix any issues if found (work in the release branch)
0. After all this is solved and work as expected, raise a PR against master branch and merge it, then tag it as `Skybian-X.Y.Z` that will trigger travis.
0. Wait for travis completion and check the Skybian-X.Y.Z.tar.xz file is published on the Github repository under releases.
0. Comment the release with the changes in CHANGELOG.md that match this release.
0. Merge master into develop.
0. Raise an issue on skycoin/skyflash about the new release, this is in order to update the download URL of the skyflash tool.
