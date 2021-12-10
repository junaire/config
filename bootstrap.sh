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
	add-apt-repository -y ppa:neovim-ppa/unstable
	apt update -y
}

function install_tools() {
	apt install -y software-properties-common
	apt install -y build-essential
	apt install -y manpages-dev
	apt install -y curl
	apt install -y wget
	apt install -y tree
	apt install -y python3
	apt install -y python-dev
	apt install -y python3-dev
	apt install -y python-pip
	apt install -y python3-pip
	apt install -y lldbpython-dev

	apt install -y tmux
	apt install -y neovim
	apt install -y zsh

	apt install -y cmake
	apt install -y make
	apt install -y ninja-build
	apt install -y ccache
	apt install -y gcc-11
	apt install -y clang-13
	apt install -y gdb
	apt install -y lld

	apt install -y vagrant
	apt install -y fzf
	apt install -y git

	apt install -y nodejs
	apt install -y golang
	apt install -y php
}

setup_apt_mirror
setup_additional_source
install_tools
