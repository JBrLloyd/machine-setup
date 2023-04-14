# Ubuntu

sudo apt update
sudo apt install \
  curl \
  git-all \
  subversion \
  zsh \
  zsh-antigen \
  tmux \
  fzf

chsh -s $(which zsh)

update-alternatives --install /usr/bin/python python /usr/bin/python3 1

## Rust
curl https://sh.rustup.rs -sSf | sh
source "$HOME/.cargo/env"
rustup default stable
rustup update
rustup set auto-self-update check-only

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -sS https://starship.rs/install.sh | sh

mkdir -p ~/dev/temp && cd $_
git clone https://github.com/wting/autojump.git && cd autojump
./install.py


mkdir ~/.config
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/zsh/.zshrc -o ~/.zshrc
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/zsh/.zshenv -o ~/.zshenv
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/bash/.bashrc -o ~/.bashrc
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/starship/starship.toml -o ~/.config/starship.toml

/usr/bin/zsh
