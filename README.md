# Reinstall Magisk on Lineageos

This little bash script is used to reinstall magisk, which gets uninstalled after each LineageOS update.

Before I had to patch once more the boot using the Magisk app doing all the steps manually, making some mistakes along the way. Now it takes less than 3 minutes to reinstall magisk (virtually all the time is taken by the download), and without any intervention on my part.

So now I can update my LineageOS phone every week without any hassle.

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

1. Download an update of LineageOS on your phone.
2. Install the update on your phone. The device should reboot automatically. After this step Magisk is no more installed on your phone.
4. Connect your phone to your computer.
5. Run `bash reinstall-magisk-on-lineageos` in the root of this project.

## How it works

The script should be pretty readable and self-explanatory, without any bash knowledge.
To sum it up, it downloads the right LineageOS build on your pc (the same one that you have just installed), extracts the `boot.img` image from the archive, transfers it on your phone, uses the Magisk app installed on your phone to patch the `boot.img` image, reboots the phone in fastboot mode, then flashes the patched boot image and restarts the device.

## Limitations

See the current issues in the issue tracker of this repo.
