#!/usr/bin/env bash

set -euo pipefail

sudo rsync ./rootfs/ /

sudo ln -sfv /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
sudo ln -sfv /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

# Ensure that the /etc/skel files don't interfere.
rm -f ~/.bashrc ~/.bash_profile ~/.bash_logout
