#!/bin/bash

NEOVIM_NIGHTLY="https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.deb"

NEOVIM_LOC="/tmp/neovim-nightly.deb"

# I love Jetbrains Mono!
install_font() {
    # Ref: https://github.com/JetBrains/JetBrainsMono
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
}

if [[ "$1" == "--install-font" ]]; then
    install_font
fi

wget ${NEOVIM_NIGHTLY}  -O ${NEOVIM_LOC}
sudo dpkg -i ${NEOVIM_LOC}
rm -rf NEOVIM_LOC
