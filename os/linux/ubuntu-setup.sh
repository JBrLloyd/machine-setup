# Ubuntu

sudo add-apt-repository ppa:daniel-milde/gdu
sudo apt update
sudo apt -y install \
  curl \
  git-all \
  subversion \
  zsh \
  zsh-antigen \
  tmux \
  fzf \
  build-essential \
  neovim \
  ripgrep \
  gdu \
  dotnet-sdk-6.0

chsh -s $(which zsh)

LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -rf lazygit*

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

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

mkdir ~/.config
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/zsh/.zshrc -o ~/.zshrc
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/zsh/.zshenv -o ~/.zshenv
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/bash/.bashrc -o ~/.bashrc
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/starship/starship.toml -o ~/.config/starship.toml

export PATH="~/.cargo/bin:$PATH"

/usr/bin/zsh

cargo install bottom --locked
cargo install tree-sitter-cli
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone https://github.com/jbrlloyd/astronvim_config.git ~/.config/nvim/lua/user


curl -L https://aka.ms/gcm/linux-install-source.sh | sh
git-credential-manager configure
