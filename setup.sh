#!/bin/sh
echo "Copying dotfiles..."
# If .config dir already exists
[ -d "~/.config" ] && cp -r .config/* ~/.config/
# Else
[ ! -d "~/.config" ] && cp -r .config ~/

cp usr/.* ~/

echo "Installing pacman dependencies..."
sudo pacman -S base-devel alacritty nvim zsh picom git go btop feh

if ! type "yay" > /dev/null; then
    echo "Installing yay..."
    cd /opt
    sudo git clone https://aur.archlinux.org/yay-git.git
    sudo chown -R $USER:$USER ./yay-git && cd yay-git
    makepkg -si
fi

echo "Installing yay dependencies..."
yay -S brave-beta glava visual-studio-code-bin starship

if [ ! -d "/usr/src/dwm" ]; then
    echo "Installing dwm..."
    cd /usr/src
    sudo git clone https://github.com/Trey2k/dwm
    sudo chown -R $USER:$USER ./dwm && cd dwm
    sudo make clean install
fi

echo "Installation complete!"