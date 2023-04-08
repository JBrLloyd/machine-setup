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
echo "exec startkde" >> ~/.xinitrc

## Install git
sudo pacman -S --needed base-devel git curl
curl -SL https://raw.githubusercontent.com/JBrLloyd/machine-setup/main/app_configs/git/.gitconfig -o ~/.gitconfig
mkdir -p ~/dev/repos/temp && cd $_
git config --list --show-origin

## Grub2 Theme
cd ~/dev/repos/temp
git clone https://github.com/vinceliuice/grub2-themes.git
cd grub2-themes/
sudo ./install.sh -t whitesur -s 2k
sudo update-grub

## Install Yay
git clone https://aur.archlinux.org/yay-git.git yay
cd yay
makepkg -si
yay -Syu

## Install Programming Langs
sudo pacman -Sy dotnet-sdk jdk17-openjdk maven python-pip rustup
yay -Sy python2 python2-pip dotnet-sdk-bin jetbrains-toolbox nvm dotnet-sdk-6.0-bin dotnet-sdk-5.0-bin dotnet-sdk-3.1-bin
export DOTNET_CLI_TELEMETRY_OPTOUT=1
dotnet tool install --global PowerShell
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
source ~/.bashrc
nvm install 18
rustup default stable
rustup update
rustup set auto-self-update check-only
cat /root/.rustup/settings.toml
rustc --version
cargo --version
python --version
dotnet --list-sdks
archlinux-java status

## Install Font & Basic Apps
yay -Sy azure-cli google-chrome visual-studio-code-bin astronvim perf
sudo pacman -Sy ttf-fira-code htop grub-customizer

## AstroNVim Addons
cargo install tree-sitter-cli
sudo pacman -Sy ripgrep lazygit gdu bottom

## Minikube
sudo pacman -Sy docker k9s kubectl helm containerd libvirt qemu-desktop dnsmasq iptables-nft minikube
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