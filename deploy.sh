#! /bin/bash

function deploy_dotfiles() {

	mkdir -p ~/.config/nvim
	mkdir -p ~/.local/share/nvim/site/autoload

	ln -s ${PWD}/zsh/zshrc ~/.zshrc

	ln -s ${PWD}/nvim/init.vim ~/.config/nvim/init.vim

	ln -s ${PWD}/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

	ln -s ${PWD}/git/gitconfig ~/.gitconfig

	ln -s ${PWD}/tmux/tmux.conf ~/.tmux.conf

	ln -s ${PWD}/gdb/gdbinit ~/.gdbinit

	ln -s ${PWD}/nvim/vim-plug/plug.vim ~/.local/share/nvim/site/autoload/plug.vim

	echo "[+] Install neovim plugins..."
	nvim -c 'PlugInstall|qa'
	nvim -c 'CocInstall|qa'

	echo "[+] Switch to zsh..."
	sudo chsh -s /usr/bin/zsh

}

deploy_dotfiles
