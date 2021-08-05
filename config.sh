#!/usr/bin/env bash

set -euo pipefail

sudo rsync -avb --no-owner --no-group --suffix=.pacnew ./rootfs/ /

sudo systemctl enable atd.service

sudo systemctl enable pkgfile-update.timer
sudo pkgfile -u

if which Xorg &>/dev/null; then
    sudo ln -sfv /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
    sudo ln -sfv /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

    sudo systemctl enable xdg-user-dirs-update.service
fi
