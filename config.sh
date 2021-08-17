#!/usr/bin/env bash

set -eu

sudo rsync -v -a --no-owner --no-group ./rootfs/ /

sudo systemctl enable --now atd.service

sudo systemctl enable --now pkgfile-update.timer
sudo pkgfile -u

sudo systemctl enable --now plocate-updatedb.timer
sudo chgrp -R locate /var/lib/plocate
sudo chown -R g+w /var/lib/plocate
sudo gpasswd -a "$USER" locate

systemctl --user enable --now ssh-agent.service

if which Xorg &>/dev/null; then
    sudo ln -sfv /usr/share/fontconfig/conf.avail/10-sub-pixel-rgb.conf /etc/fonts/conf.d
    sudo ln -sfv /usr/share/fontconfig/conf.avail/11-lcdfilter-default.conf /etc/fonts/conf.d

    systemctl --user enable --now pipewire.service pipewire-{pulse,media-session}.service
fi
