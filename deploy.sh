#! /bin/bash

# Remove everything
rm -rf ${HOME}/.gitconfig
rm -rf ${HOME}/.tmux.conf
rm -rf ${HOME}/.gdbinit
rm -rf ${HOME}/.ssh/config
rm -rf ${HOME}/.config/nvim
rm -rf ${HOME}/.config/pip
rm -rf ${HOME}/.config/kitty

# Where we put our config.
CONF_DIR="$( cd "$( dirname "$0" )" && pwd )"

# git
# FIXME?
cp ${CONF_DIR}/git/gitconfig ${HOME}/.gitconfig
if [[ $(grep -i Microsoft /proc/version) ]]; then
    HOST=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
    sed -i -e "s/127.0.0.1/${HOST}/g" ${HOME}/.gitconfig
fi

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

if [ ! -d "${HOME}/.config/kitty" ]; then
    mkdir ${HOME}/.config
fi

# neovim
ln -s ${CONF_DIR}/nvim ${HOME}/.config/nvim
# pip
ln -s ${CONF_DIR}/pip ${HOME}/.config/pip
# kitty
ln -s ${CONF_DIR}/kitty/kitty.conf ${HOME}/.config/kitty/kitty.conf
