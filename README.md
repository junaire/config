# Jun's own config

This repo contains jun's own config files.

## Usage

Pick up your favorite [nerd font](https://github.com/ryanoasis/nerd-fonts/releases)


```bash
# Use zsh if needed.
chsh -s $(which zsh)
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"\n\n
# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

```bash
# Dump all packages
brew bundle dump --all --describe --file=Brewfile

# Install all packages
brew bundle --file=Brewfile
```


## Credits

* [junnplus](https://github.com/junnplus/dotfiles)