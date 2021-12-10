#! /bin/bash

function setup_apt_mirror() {
	# if [[ $(date +"%z") == "+0800" ]];
	if [[ 1 ]];
	then
		echo "[+]Change apt source to ftp.sjtu.cn..."
		sed -i "s/archive.ubuntu.com/ftp.sjtu.edu.cn/g" /etc/apt/sources.list
		apt update -y && apt upgrade -y
	fi
}

function setup_additional_source() {
	add-apt-repository -y ppa:ubuntu-toolchain-r/test
}

function install_tools() {
	apt install -y software-properties-common
	apt install -y build-essential
	apt install -y manpages-dev
	apt install -y curl
	apt install -y wget
	apt install -y tree

	apt install -y cmake
	apt install -y make
	apt install -y ninja-build
	apt install -y ccache
	apt install -y gcc-11
	apt install -y clang-13
	apt install -y gdb
	apt install -y lldb
	apt install -y lld

	apt install -y tmux
	apt install -y neovim
	apt install -y zsh

	apt install -y vagrant
	apt install -y fzf
	apt install -y git

	apt install -y nodejs
	apt install -y python3
	apt install -y golang
	apt install -y php
}

function install_prerequisites() {
	# install vim-plug
	curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function deploy_dotfiles() {

	mkdir -p ~/.config/nvim

	ln -s ${PWD}/zsh/zshrc ~/.zshrc

	ln -s ${PWD}/nvim/init.vim ~/.config/nvim/init.vim

	ln -s ${PWD}/nvim/coc-settings.json ~/.config/nvim/coc-settings.json

	ln -s ${PWD}/git/gitconfig ~/.gitconfig

	ln -s ${PWD}/tmux/tmux.conf ~/.tmux.conf

	ln -s ${PWD}/gdb/gdbinit ~/.gdbinit

	nvim -c 'PlugInstall|qa'
	nvim -c 'CocInstall|qa'

}

setup_apt_mirror
setup_additional_source
install_prerequisites
install_tools
deploy_dotfiles
