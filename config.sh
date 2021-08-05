#!/usr/bin/env bash

set -euo pipefail

sudo rsync -avb --no-owner --no-group --suffix=.pacnew ./rootfs/ /

sudo ufw enable
sudo ufw default deny
sudo ufw allow ssh
sudo ufw allow mdns
sudo ufw allow llmnr

sudo systemctl enable atd.service

sudo systemctl enable pkgfile-update.timer
sudo pkgfile -u

sudo gpasswd -a "$USER" locate
updatedb

if which Xorg &>/dev/null; then
    sudo ln -sfv /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
    sudo ln -sfv /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

    sudo systemctl enable xdg-user-dirs-update.service
fi
