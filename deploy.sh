#! /bin/bash

function deploy_dotfiles() {

	ln -s ~/config/zsh/zshrc ~/.zshrc
	ln -s ~/config/zsh/p10k.zsh ~/.p10k.zsh

	ln -s ~/config/git/gitconfig ~/.gitconfig

	ln -s ~/config/tmux/tmux.conf ~/.tmux.conf

	ln -s ~/config/gdb/gdbinit ~/.gdbinit

}

deploy_dotfiles
