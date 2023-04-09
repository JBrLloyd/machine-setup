# zsh-setup

Required pkgs:

- zsh
- starship
- antigen

## Install zsh and replace bash

```sh
sudo pacman -Sy starship zsh zsh-completions zoxide fzf
yay -Sy autojump antigen
chsh -s $(which zsh)
sh -c "$(curl -SL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/zsh/.zshrc -o ~/.zshrc
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/zsh/.zshenv -o ~/.zshenv
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/bash/.bashrc -o ~/.bashrc

starship preset nerd-font-symbols > ~/.config/starship.toml
```
