#!/usr/bin/env bash

set -euo pipefail

sudo rsync -avb --no-owner --no-group --suffix=.pacnew ./rootfs/ /

sudo ln -sfv /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -sfv /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d
