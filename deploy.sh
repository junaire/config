#! /bin/bash

function deploy_dotfiles() {

	mkdir -p ~/.docker
	mkdir -p ~/.config/nvim
	mkdir -p ~/.local/share/nvim/site/autoload

	ln -s ~/config/zsh/zshrc ~/.zshrc

	ln -s ~/config/nvim/init.vim ~/.config/nvim/init.vim

	ln -s ~/config/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

	ln -s ~/config/git/gitconfig ~/.gitconfig

	ln -s ~/config/tmux/tmux.conf ~/.tmux.conf

	ln -s ~/config/gdb/gdbinit ~/.gdbinit

	ln -s ~/config/docker/config.json ~/.docker/config.json

	ln -s ~/config/nvim/vim-plug/plug.vim ~/.local/share/nvim/site/autoload/plug.vim

}

deploy_dotfiles
