#!/usr/bin/env bash

set -e

readarray -t pacman_packages <./packages/pacman
sudo pacman -Sy --noconfirm --needed "${pacman_packages[@]}"

readarray -t aur_packages <./packages/aur
./stow/.local/bin/aur-install "${aur_packages[@]}"
