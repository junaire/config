#! /bin/bash
set -euo pipefail

# Where we put our config.
CONF_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p "${HOME}/.ssh" "${HOME}/.config"

# tmux
ln -sfn "${CONF_DIR}/tmux/tmux.conf" "${HOME}/.tmux.conf"

# gdb
ln -sfn "${CONF_DIR}/gdb/gdbinit" "${HOME}/.gdbinit"

# git
ln -sfn "${CONF_DIR}/git/gitconfig" "${HOME}/.gitconfig"
mkdir -p "${HOME}/.config/git"
ln -sfn "${CONF_DIR}/git/gitignore_global" "${HOME}/.config/git/ignore"

# zsh (append the source line only if not already wired up)
grep -q "config/zsh/zshrc" "${HOME}/.zshrc" 2>/dev/null || \
    echo "source ${CONF_DIR}/zsh/zshrc" >> "${HOME}/.zshrc"

# ssh config
ln -sfn "${CONF_DIR}/ssh/config" "${HOME}/.ssh/config"

# vim
ln -sfn "${CONF_DIR}/vim/vimrc" "${HOME}/.vimrc"

# ghostty
ln -sfn "${CONF_DIR}/ghostty" "${HOME}/.config/ghostty"

# pip
ln -sfn "${CONF_DIR}/pip" "${HOME}/.config/pip"
