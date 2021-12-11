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
	apt install -y curl
	apt update -y
	curl -sL https://deb.nodesource.com/setup_16.x | bash -
}

function install_tools() {
	apt install -y build-essential
	apt install -y wget
	apt install -y python3
	apt install -y python3-dev
	apt install -y python3-pip

	apt install -y tmux
	apt install -y neovim
	apt install -y zsh

	apt install -y cmake
	apt install -y ninja-build
	apt install -y ccache
	apt install -y gcc-11
	apt install -y gdb
	apt install -y lld

	apt install -y fzf
	apt install -y git

	apt install -y nodejs
}

setup_apt_mirror
setup_additional_source
install_tools
