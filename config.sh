#!/usr/bin/env bash

set -e

sudo rsync -a ./rootfs/ /

sudo ln -sfv /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -sfv /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

sudo systemctl enable --now bluetooth.service

sudo systemctl enable --now cups.socket
sudo gpasswd -a "$USER" lp

sudo gpasswd -a "$USER" scanner
