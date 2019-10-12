#!/usr/bin/env sh

set -e

# only if allowed to use sudo
if groups | grep -wq wheel; then

    sudo pacman -Sy --noconfirm --needed `cat depends/arch`

    # gpg keys for cower
    gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53

    # use fallback installer to install aur helper
    ./packages/arch/.local/bin/aur-install cower pacaur

fi
