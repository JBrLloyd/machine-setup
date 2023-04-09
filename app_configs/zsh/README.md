# zsh-setup

Required pkgs:

- zsh
- starship
- antigen

## Install zsh and replace bash

```sh
sudo pacman -Sy starship zsh zsh-completions zoxide fzf
yay -Sy autojump antigen
zsh
autoload -Uz zsh-newuser-install
zsh-newuser-install -f
# chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# TODO: download shell settings and save
zsh
# pacman -Ql antigen
starship preset nerd-font-symbols > ~/.config/starship.toml
```
