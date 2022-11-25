#!/bin/bash

WEZTERM_NIGHTLY="https://github.com/wez/wezterm/releases/download/nightly/wezterm-nightly.Ubuntu22.04.deb"
NEOVIM_NIGHTLY="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb"

WEZTERM_LOC="/tmp/wezterm-nightly.deb"
NEOVIM_LOC="/tmp/neovim-nightly.deb"

# I love Jetbrains Mono!
install_font() {
    # Ref: https://github.com/JetBrains/JetBrainsMono
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
}

if [[ "$1" == "--install-font" ]]; then
    install_font
fi

wget ${WEZTERM_NIGHTLY} -O ${WEZTERM_LOC}
wget ${NEOVIM_NIGHTLY}  -O ${NEOVIM_LOC}
sudo dpkg -i ${WEZTERM_LOC}
sudo dpkg -i ${NEOVIM_LOC}
rm -rf WEZTERM_LOC
rm -rf NEOVIM_LOC
