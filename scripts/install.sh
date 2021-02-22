#!/usr/bin/env sh

set -e

# only if allowed to use sudo
if groups | grep -wq wheel; then

	# use fallback installer to install aur helper
	./packages/arch/.local/bin/aur-install yay

fi
