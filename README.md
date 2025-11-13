# Jun's own config

This repo contains jun's own config files.

## Usage

Pick up your favorite [nerd font](https://github.com/ryanoasis/nerd-fonts/releases)

Install the latest neovim stable release [here](https://github.com/neovim/neovim/releases/tag/stable)

Install the latest nodejs release [here](https://nodejs.org/en/download)

Install the latest Golang release [here](https://go.dev/doc/install)

Install the latest cmake releast [here](https://cmake.org/download/)

```bash
git clone https://github.com/junaire/config.git
cd ~/config

sudo apt install zsh fzf ccache tmux gnome-tweaks

chsh -s $(which zsh)

./deploy.sh
```
## Credits

* [junnplus](https://github.com/junnplus/dotfiles)

```bash
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"\n\n
# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```
