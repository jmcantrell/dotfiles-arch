#!/usr/bin/env bash

set -euo pipefail

# Ensure that the /etc/skel files don't interfere.
rm -f ~/.bashrc ~/.bash_profile ~/.bash_logout

stow --no-folding -d . -t ~ -R stow
