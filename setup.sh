#!/bin/sh
if [[ ! $EUID -ne 0 ]]; then
    echo "This script must be run as a user" 
    exit 1
fi

echo "Copying dotfiles..."
# If .config dir already exists
[ -d "~/.config" ] && cp -r .config/* ~/.config/
# Else
[ ! -d "~/.config" ] && cp -r .config ~/

cp networkd/20-wired.network /etc/systemd/network/

cp usr/.* ~/ 2> /dev/null;
echo "Updateing repositories and system..."
sudo pacman -Syyuu
echo "Installing pacman dependencies..."
sudo pacman -S base-devel alacritty pipewire pipewire-pulse pipewire-alsa nvim zsh picom git go btop feh xorg xorg-xinit ttf-fira-code wqy-zenhei
echo "Enabling pipewire service..."
sudo systemctl enable pipwire
echo "Enabling systemd-networkd service..."
sudo systemctl enable systemd-networkd.service
echo "Enabling systemd-resolved service..."
sudo systemctl enable systemd-resolved.service

if ! type "yay" > /dev/null; then
    echo "Installing yay..."
    cd /opt
    sudo git clone https://aur.archlinux.org/yay-git.git
    sudo chown -R $USER:$USER ./yay-git && cd yay-git
    makepkg -si
fi

echo "Installing yay dependencies..."
yay -S brave-beta glava visual-studio-code-bin starship gruvbox-material-gtk ttf-symbola nerd-fonts-complete

if [ ! -d "/usr/src/dwm" ]; then
    echo "Installing dwm..."
    cd /usr/src
    sudo git clone https://github.com/Trey2k/dwm
    sudo chown -R $USER:$USER ./dwm && cd dwm
    sudo make clean install
fi

echo "Installation complete!"