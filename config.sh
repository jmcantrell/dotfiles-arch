#!/usr/bin/env bash

set -euo pipefail

sudo rsync -v -a --no-owner --no-group -b --suffix=.pacnew ./rootfs/ /

sudo systemctl enable atd.service

sudo systemctl enable pkgfile-update.timer
sudo pkgfile -u

sudo systemctl enable ufw.service

if which Xorg &>/dev/null; then
    sudo ln -sfv /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
    sudo ln -sfv /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

    systemctl --user enable --now pipewire.service pipewire-{pulse,media-session}.service
fi
