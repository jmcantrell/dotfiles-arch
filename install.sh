#!/usr/bin/env bash

set -e

name=$1

export PATH=$PWD/stow/.local/bin:$PATH

pacman_list=$PWD/packages/pacman${name:+-$name}
aur_list=$PWD/packages/aur${name:+-$name}

if [[ -f $pacman_list ]]; then
    readarray -t pacman_packages <"$pacman_list"
    sudo pacman -Sy --noconfirm --needed "${pacman_packages[@]}"
fi

if [[ -f $aur_list ]]; then
    which pikaur &>/dev/null || aur-install pikaur
    readarray -t aur_packages <"$aur_list"
    pikaur -Sy --noconfirm --needed "${aur_packages[@]}"
fi
