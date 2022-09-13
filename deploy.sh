#! /bin/bash

rm -rf ${HOME}/.gitconfig
rm -rf ${HOME}/.tmux.conf
rm -rf ${HOME}/.gdbinit
rm -rf ${HOME}/.ssh/config
rm -rf ${HOME}/.config/nvim
rm -rf ${HOME}/.config/pip
rm -rf ${HOME}/.config/wezterm

# git
ln -s ~/config/git/gitconfig  ${HOME}/.gitconfig
# tmux
ln -s ~/config/tmux/tmux.conf ${HOME}/.tmux.conf
# gdb
ln -s ~/config/gdb/gdbinit    ${HOME}/.gdbinit

# zsh
echo "source ~/config/zsh/zshrc" > ${HOME}/.zshrc

# ssh config
if [ ! -d "${HOME}/.ssh" ]; then
    mkdir ${HOME}/.ssh
fi
ln -s ~/config/ssh/config ${HOME}/.ssh/config

if [ ! -d "${HOME}/.config" ]; then
    mkdir ${HOME}/.config
fi

# neovim
ln -s ~/config/nvim ${HOME}/.config/nvim
# pip
ln -s ~/config/pip ${HOME}/.config/pip
# wezterm
ln -s ~/config/wezterm ${HOME}/.config/wezterm
