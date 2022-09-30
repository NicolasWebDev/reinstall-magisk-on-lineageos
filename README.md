# Reinstall Magisk on Lineageos

This little bash script is used to reinstall magisk, which gets uninstalled after each LineageOS update.

Before I had to patch once more the boot using the Magisk app doing all the steps manually, making some mistakes along the way. Now it takes less than 3 minutes to reinstall magisk (virtually all the time is taken by the download), and without any intervention on my part.

So now I can update my LineageOS phone every week without any hassle.

My solution is based on the official [installation guide of Magisk](https://topjohnwu.github.io/Magisk/install.html).

## Warning

This script is written in bash, so as any bash script it is run with the same permissions than your current user.
Moreover it needs root privileges on your phone to run.

So it may screw up both your computer and your phone, so I invite you to check its source code before running it and using it at your own risks!

## Bash

Bash is one of the standard shells on Linux and MacOS systems.

If on Windows, you can use the [Windows Subsystem for Linux](https://en.wikipedia.org/wiki/Windows_Subsystem_for_Linux) to run it. See [this guide](https://docs.microsoft.com/en-us/windows/wsl/install) to install it.

## Installation

1. Clone this repo somewhere on your computer (ex: `git clone https://github.com/NicolasWebDev/reinstall-magisk-on-lineageos`)
2. Edit the script to set both variables at the beginning of the program.

## Usage

1. Download the latest LineageOS update on your phone.
2. Install the LineageOS update on your phone. The device should reboot automatically. After this step Magisk is no more installed on your phone.
4. Connect your phone to your computer.
5. Run `bash reinstall-magisk-on-lineageos` in the root of this project.

## How it works

The script should be pretty readable and self-explanatory, without any bash knowledge.
To sum it up, it downloads the latest LineageOS build on your pc, extracts the `boot` image from the archive, transfers it on your phone, uses the Magisk app installed on your phone to patch the `boot` image, reboots the phone in fastboot mode, then flashes the patched boot image and restarts the device.

## Different methods of extracting the `boot.img` file

There are 3 different methods to extract the `boot.img` file, depending on your particular device. In this [LineageOS wiki article](https://wiki.lineageos.org/extracting_blobs_from_zips) you can find more details on these methods.

This script currently supports extracting from block-based OTAs and from payload-based OTAs. File-based OTAs are not yet supported.

## Limitations

See the current issues in the issue tracker of this repo.
