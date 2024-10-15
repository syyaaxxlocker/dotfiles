#!/bin/bash


if [ "$(id -u)" == "0" ]; then
   echo "This script must not be run as root | Скрипт не может быть запущен от root'а"
   exit 1
fi 
if [[ "$(uname -n)" != "archlinux" ]]; then
    echo "Installer only for arch. I use arch BTW"
    exit 1
fi

echo -en "Installing Requirements and Packages\n\n"
cd $HOME
sleep 1
sudo pacman -S lib32-pipewire lib32-nvidia-libgl ttf-liberation ttf-jetbrains-mono ttf-hack ttf-font-awesome xorg xorg-xinit wireplumber\
    pipewire-alsa pipewire-pulse pavucontrol python python3 python-pip python-requests python-pywal python-beautifulsoup4\
    flameshot steam discord obs-studio kate dmenu firefox wine-staging fastfetch ranger dolphin cmus\
    telegram-desktop clang libreoffice vlc mpv kdenlive obsidian feh qemu-full qbittorrent unzip unrar p7zip ark\
    zoxide openss fd 

echo -en "Install config files\n\n"
cd $HOME/dotfiles/
cp -r config/* $HOME/.config/
cp .vimrc $HOME/
echo -en "Write: PlugInstall \n"
sleep 2
vim $HOME/.vimrc

echo -en "Install dwm with my config\n\n"
mkdir $HOME/gits && cd gits/
git clone https://git.suckless.org/dwm dwmSource/ && cd dwmSource/
cp $HOME/dotfiles/dwm/* $HOME/gits/dwmSource/
patch < dwm-noborder-6.2.diff 
sudo make clean install

echo -en "Create .xinitrc file"
mkdir -p $HOME/Pictures/wall/
cp $HOME/dotfiles/wallpaper.jpeg $HOME/Pictures/wall/

echo "xrandr --output HDMI-0 --mode 2560x1440 --rate 144 &
feh --bg-fill ~/Pictures/wall/wallpaper.jpeg &
setxkbmap us,ru -variant , -option grp:caps_toggle &
$HOME/.config/Scripts/./sbar.sh &
dwm" >> $HOME/.xinitrc

