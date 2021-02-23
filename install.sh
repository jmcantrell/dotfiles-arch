#!/usr/bin/env bash

set -e

# use fallback installer to install aur helper
which pikaur &>/dev/null || ~/.local/bin/aur-install pikaur

readarray -t pacman_packages <./packages/pacman
sudo pacman -Sy --noconfirm --needed "${pacman_packages[@]}"

readarray -t aur_packages <./packages/aur
pikaur -Sy --noconfirm --needed "${aur_packages[@]}"

sudo systemctl --now enable ufw.service
sudo ufw logging off
sudo ufw default deny
sudo ufw enable

sudo systemctl --now enable docker.service
sudo gpasswd -a "$USER" docker

# font display tweaks
sudo ln -sfv /etc/fonts/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -sfv /etc/fonts/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

sudo systemctl --now enable cups.socket

sudo gpasswd -a "$USER" scanner

sudo gpasswd -a "$USER" vboxusers

ipfs init
systemctl --user --now enable ipfs.service

systemctl --user --now enable clipmenud.service
