// Arch Setup
pacman -Sy vim
ln -sf /usr/share/zoneinfo/Australia/Melbourne /etc/localtime
hwclock --systohc
vim /etc/locale.gen
vim /etc/locale.gen
locale-gen
echo "LANG=en_AU.UTF-8" > /etc/locale.config
echo jbrlloyd-d-arch > /etc/hostname
echo "127.0.1.1 jbrlloyd-d-arch" >> /etc/hosts

// GRUB setup
pacman -Sy grub efibootmgr os-prober dosfstools mtools
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=GRUB
vim /boot/grub/grub.cfg
grub-mkconfig -o /boot/grub/grub.cfg

// Network
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

// Sudoers
useradd -G wheel -m jbrlloyd
passwd jbrlloyd
passwd
pacman -Sy sudo
vim /etc/sudoers

// Reboot
umount -lR /mnt
reboot

// Enable Plasma
sudo pacman -S xorg xorg-xinit xterm plasma plasma-desktop plasma-wayland-session kde-applications kdeplasma-addons sddm
systemctl enable sddm.service
echo "exec startkde" >> /home/jbrlloyd/.xinitrc

reboot

// Install git
sudo pacman -S --needed base-devel git
mkdir -p ~/dev/repos/temp && cd $_

// Install Yay
git clone https://aur.archlinux.org/yay-git.git yay
cd yay
makepkg -si
yay -Syu

// Install Google Chrome
yay -Sy google-chrome

// Grub2 Theme
cd ~/dev/repos/temp
git clone https://github.com/vinceliuice/grub2-themes.git
cd grub2-themes/
sudo ./install.sh -t whitesur -s 2k
sudo update-grub

// Font & Basic Apps
sudo pacman -Sy Code ttf-fira-code htop grub-customizer

// Minikube
sudo pacman -Sy libvirt qemu-desktop dnsmasq minikube
// iptables-nft
sudo usermod -aG libvirt $(whoami)
minikube config set driver kvm2
minikube start
