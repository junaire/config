#! /bin/bash

# Remove everything
rm -rf ${HOME}/.gitconfig
rm -rf ${HOME}/.tmux.conf
rm -rf ${HOME}/.gdbinit
rm -rf ${HOME}/.ssh/config
rm -rf ${HOME}/.config/pip

# Where we put our config.
CONF_DIR="$( cd "$( dirname "$0" )" && pwd )"

# tmux
ln -s ${CONF_DIR}/tmux/tmux.conf ${HOME}/.tmux.conf

# gdb
ln -s ${CONF_DIR}/gdb/gdbinit ${HOME}/.gdbinit

# zsh
echo "source ${CONF_DIR}/zsh/zshrc" > ${HOME}/.zshrc

# ssh config
if [ ! -d "${HOME}/.ssh" ]; then
    mkdir ${HOME}/.ssh
fi
ln -s ${CONF_DIR}/ssh/config ${HOME}/.ssh/config

if [ ! -d "${HOME}/.config" ]; then
    mkdir ${HOME}/.config
fi

# vim (keep an existing vimrc as a backup)
if ! [ "${HOME}/.vimrc" -ef "${CONF_DIR}/vim/vimrc" ]; then
    if [ -e "${HOME}/.vimrc" ] || [ -L "${HOME}/.vimrc" ]; then
        mv "${HOME}/.vimrc" "${HOME}/.vimrc.bak-$(date +%Y%m%d-%H%M%S)"
    fi
    ln -s "${CONF_DIR}/vim/vimrc" "${HOME}/.vimrc"
fi

ln -s ${CONF_DIR}/wezterm ${HOME}/.config/wezterm

# pip
ln -s ${CONF_DIR}/pip ${HOME}/.config/pip

