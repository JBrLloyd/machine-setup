# Arch Intial Setup
pacman -Sy vim
ln -sf /usr/share/zoneinfo/Australia/Melbourne /etc/localtime
hwclock --systohc
vim /etc/locale.gen
locale-gen
echo "LANG=en_AU.UTF-8" > /etc/locale.config
echo jbrlloyd-d-arch > /etc/hostname
echo "127.0.1.1 jbrlloyd-d-arch" >> /etc/hosts


## GRUB setup
pacman -Sy grub efibootmgr os-prober dosfstools mtools
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
vim /boot/grub/grub.cfg
grub-mkconfig -o /boot/grub/grub.cfg


## Network
pacman -Sy dhcpcd wpa_supplicant ifplugd netctl
ip link
ip addr
cp /etc/netctl/examples/ethernet-dhcp /etc/netctl/custom-dhcp-profile
vim /etc/netctl/custom-dhcp-profile
netctl enable custom-dhcp-profile
systemctl enable dhcpcd.service
systemctl enable NetworkManager.service
ip link
ping 8.8.8.8 -c 4


## Sudoers
useradd -G wheel -m jbrlloyd
passwd jbrlloyd
passwd
pacman -Sy sudo
vim /etc/sudoers


## Reboot
umount -lR /mnt
reboot


## Enable Plasma
sudo pacman -S xorg xorg-xinit xterm plasma plasma-desktop plasma-wayland-session kde-applications kdeplasma-addons sddm
systemctl enable sddm.service

reboot


# Post OS Setup
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "exec startkde" >> ~/.xinitrc

## Install git
sudo pacman -S --needed base-devel git curl
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/git/.gitconfig -o ~/.gitconfig
mkdir -p ~/dev/repos/temp && cd $_
git config --list --show-origin


## Install Yay
git clone https://aur.archlinux.org/yay-git.git yay
cd yay
makepkg -si
yay -Syu


## Bluetooth
sudo pacman -Sy bluez bluez-utils
modprobe btusb
sudo systemctl enable bluetooth.service

## Fonts
cd ~/dev/repos/temp && cd $_
sudo mkdir -p /usr/share/fonts/FiraCode
svn checkout https://github.com/ryanoasis/nerd-fonts/trunk/patched-fonts/FiraCode
find ~+ -type f -name "*Complete.ttf" -exec cp {} /usr/share/fonts/FiraCode \;
sudo pacman -Sy noto-color-emoji-fontconfig # ttf-firacode-nerd ttf-nerd-fonts-symbols-2048-em
cd ~


## Install zsh and replace bash
sudo pacman -Sy starship zsh zsh-completions zoxide fzf tmux
yay -Sy autojump antigen
# autoload -Uz zsh-newuser-install
# zsh-newuser-install -f
chsh -s $(which zsh)
# pacman -Ql antigen
sh -c "$(curl -SL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

mkdir ~/.config
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/zsh/.zshrc -o ~/.zshrc
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/zsh/.zshenv -o ~/.zshenv
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/bash/.bashrc -o ~/.bashrc
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/starship/starship.toml -o ~/.config/starship.toml

# tmux new-session -d
# tmux split-window -h 'htop'
# tmux split-window -v "sudo tcpdump 'dst port 443 || 80' -i enp6s0 -v -nn -X -l"
# tmux new-window 'start'
# tmux -2 attach-session -d

## Weekly auto updates
sudo pacman -Sy cronie
sudo systemctl enable cronie.service

## Remap keyboard IO key press events
mkdir -p ~/dev/repos/temp && cd $_
git clone https://github.com/rvaiya/keyd
cd keyd
make && sudo make install
sudo curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/keyd/default.conf -o /etc/keyd/default.conf
sudo systemctl enable keyd && sudo systemctl start keyd

## Grub2 Theme
cd ~/dev/repos/temp
git clone https://github.com/vinceliuice/grub2-themes.git
cd grub2-themes/ && cd $_
sudo ./install.sh -t whitesur -s 2k
sudo update-grub



## Install Programming Langs
sudo pacman -Sy dotnet-sdk jdk17-openjdk maven python-pip rustup
yay -Sy python2 python2-pip dotnet-sdk-bin jetbrains-toolbox nvm dotnet-sdk-6.0-bin dotnet-sdk-5.0-bin dotnet-sdk-3.1-bin
export DOTNET_CLI_TELEMETRY_OPTOUT=1
dotnet tool install --global PowerShell
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
source ~/.bashrc

source /usr/share/nvm/init-nvm.sh
nvm install 18
npm install --global yarn pnpm

rustup default stable
rustup update
rustup set auto-self-update check-only
cat /root/.rustup/settings.toml
rustc --version
cargo --version
python --version
dotnet --list-sdks
archlinux-java status


## Install Basic Apps
yay -Sy perf tcpdump htop
yay -Sy azure-cli google-chrome visual-studio-code-bin
sudo pacman -Sy grub-customizer


## AstroNVim
cargo install tree-sitter-cli
sudo pacman -Sy ripgrep lazygit gdu bottom
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
git clone https://github.com/jbrlloyd/astronvim_config.git ~/.config/nvim/lua/user
nvim --headless -c 'quitall'


## Minikube
sudo pacman -Sy docker k9s kubectl helm containerd libvirt qemu-desktop dnsmasq iptables-nft minikube virt-manager virt-viewer
sudo usermod -aG libvirt $(whoami)
sudo systemctl enable docker.service
sudo systemctl enable libvirtd.service \
    && sudo systemctl start libvirtd.service
minikube config set driver kvm2
minikube start


# Optional Installations
sudo pacman -Sy \
    discord
yay -Sy \
    slack-desktop
