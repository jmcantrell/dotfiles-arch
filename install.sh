#!/usr/bin/env bash

set -e

# use fallback installer to install aur helper
./packages/arch/.local/bin/aur-install pikaur

readarray -t pacman_packages <./packages/pacman
sudo pacman -Sy --noconfirm --needed "${pacman_packages[@]}"

readarray -t aur_packages <./packages/aur
pikaur -Sy --noconfirm --needed "${aur_packages[@]}"

sudo systemctl --now enable ufw.service
sudo ufw logging off
sudo ufw default deny
sudo ufw enable

# font display tweaks
sudo ln -sfv /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -sfv /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

sudo systemctl --now enable org.cups.cupsd.service

sudo gpasswd -a "$USER" scanner

sudo gpasswd -a "$USER" vboxusers

vmsdir="$HOME/VirtualBox VMs"
mkdir -p "$vmsdir"
# disable btrfs copy-on-write for vms folder
fstype=$(mount | grep " $(dirname "$HOME") " | cut -d' ' -f5)
[[ "$fstype" = btrfs ]] && chattr +C "$vmsdir"

systemctl --user --now enable clipmenud.service

# friendlier access to udiskie removable disks
ln -svfT "/run/media/$USER" "$HOME/.local/media"
