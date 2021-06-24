#!/usr/bin/env bash

set -e

readarray -t pacman_packages <./packages/pacman
sudo pacman -Sy --noconfirm --needed "${pacman_packages[@]}"

./stow/.local/bin/aur-install pikaur
readarray -t aur_packages <./packages/aur
pikaur -Sy --noconfirm --needed "${aur_packages[@]}"
