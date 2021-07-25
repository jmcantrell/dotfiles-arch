#!/usr/bin/env bash

set -euo pipefail

name=${1:-""}

pacman_list=$PWD/packages/pacman${name:+-$name}
aur_list=$PWD/packages/aur${name:+-$name}

if [[ -f $pacman_list ]]; then
    sudo cat "$pacman_list" | sudo pacman -Sy --noconfirm --needed -
fi

if [[ -f $aur_list ]]; then
    which pikaur &>/dev/null || ./stow/.local/bin/aur-install pikaur
    pikaur -Sy --noconfirm --needed - <"$aur_list"
fi
