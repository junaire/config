#!/bin/bash

WEZTERM_NIGHTLY="https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly.Ubuntu22.04.deb"
NEOVIM_NIGHTLY="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb"

WEZTERM_LOC="/tmp/wezterm-nightly.deb"
NEOVIM_LOC="/tmp/neovim-nightly.deb"

# update the packages every month.
is_need_update() {
    day=$(date "+%d")
    # If today is the first day of the month, let's try to do a update.
    if [ ${day} -eq 1 ]
    then
	true
    else
	false
    fi
}


# I love Jetbrains Mono!
install_font() {
    # Ref: https://github.com/JetBrains/JetBrainsMono
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
}

install_packages() {
    if is_need_update; then
	install_font
	wget ${WEZTERM_NIGHTLY} -O ${WEZTERM_LOC}
	wget ${NEOVIM_NIGHTLY}  -O ${NEOVIM_LOC}
	sudo dpkg -i ${WEZTERM_LOC}
	sudo dpkg -i ${NEOVIM_LOC}
    fi
}

install_packages
