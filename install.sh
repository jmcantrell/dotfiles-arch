#!/usr/bin/env bash

set -e

export PATH=$PWD/stow/.local/bin:$PATH

readarray -t pacman_packages <./packages/pacman
sudo pacman -Sy --noconfirm --needed "${pacman_packages[@]}"

aur-install pikaur
readarray -t aur_packages <./packages/aur
pikaur -Sy --noconfirm --needed "${aur_packages[@]}"
