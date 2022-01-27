# dotfiles-arch

My configuration files and scripts for Arch Linux.

## Installation

Clone this repository:

```sh
git clone git@gitlab.com:jmcantrell/dotfiles-arch.git ~/.dotfiles-arch
cd ~/.dotfiles-arch
```

Install packages, symlink files, and configure system:

```sh
./scripts/install
./scripts/stow
./scripts/config
```

Update repository with the latest changes:

```sh
./scripts/update
```

Remove files from home directory:

```sh
./scripts/unstow
```
