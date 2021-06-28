#!/usr/bin/env sh

# Ensure that the /etc/skel files don't interfere.
rm -f ~/.bashrc ~/.bash_profile ~/.bash_logout

stow ${VERBOSE:+--verbose} --no-folding -d . -t ~ -R stow
