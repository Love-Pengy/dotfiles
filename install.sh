#!/bin/sh

#set -x 
# use cat example.list | xargs sudo apt-get -y install next time
dotfilesLoc=$PWD
UHOME=$(getent passwd $SUDO_USER | cut -d: -f6)
installHeader="apt-get install -y"

# ####################### #
# Important Starting Deps # 
# ####################### #

echo "Please Set Up SSH For Github Now Before Moving On"
input="init"
while [ "$input" != "Done" ] 
do 
    read -p "Please Set Up SSH For Github Now Before Moving On (Type Done To Continue): " input
done

# ##### #
# Setup # 
# ##### #

# My Preferred Folders
mkdir $UHOME/Applications $UHOME/Projects  

# Sway 
$installHeader sway pulseaudio-utils light playerctl grimshot swayidle swaylock wl-clipboard pipewire pipewire-pulse

# Tofi
$installHeader tofi

# Waybar 
$installHeader waybar

# Kitty
$installHeader kitty

# hyfetch 
$installHeader python3 python3-pip
# NOTE: not yet on debian but works on ubuntu base
$installHeader hyfetch
# if on debian use this 
# pip install -U hyfetch

# wlogout 
$installHeader wlogout


# ##### #
# Utils # 
# ##### #

# gnu stow 
$installHeader stow

# C man pages
$installHeader manpages-dev manpages-posix-dev
# local send
# $installHeader localsend
curl -s https://api.github.com/repos/localsend/localsend/releases/latest | grep "browser_download_url.*linux-x86-64.deb" | cut -d : -f 2,3 | tr -d \" | wget -qi -
$installHeader ./LocalSend-*-linux-x86-64.deb
rm LocalSend-*-linux-x86-64.deb

# firefox
$installHeader firefox

# obs
add-apt-repository ppa:obsproject/obs-studio
apt update
$installHeader obs-studio
$installHeader xdg-desktop-portal-wlr
$installHeader v4l2loopback-dkms

#ncdu 
$installHeader ncdu

# dolphin
$installHeader dolphin

# tree
$installHeader tree

# htop
$installHeader htop


# ###### #
# Extras # 
# ###### #

# typioca
$installHeader golang
go install github.com/bloznelis/typioca@latest


# vlc
$installHeader vlc

# yt-dlp
$installHeader yt-dlp

# samba stoofs (for auto connecting to server)
$installHeader cifs-utils samba-client

# ffmpeg 
$installHeader ffmpeg

# lm-sensors 
$installHeader lm-sensors

# network-manager
$installHeader network-manager

# valgrind
$installHeader valgrind

# gdb 
$installHeader gdb

# ########### #
# Pwogwamming # 
# ########### #

# neovim
$installHeader neovim ripgrep fd-find

# buildtools
$installHeader make cmake 

## rustup |  requires user input
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# cargo 
$installHeader cargo 

# nerdfonts
curl https://api.github.com/repos/ryanoasis/nerd-fonts/tags | grep "tarball_url" | grep -Eo 'https://[^\"]*' | sed  -n '1p' | xargs wget -O - | tar -xz
mkdir -p $UHOME/.local/share/fonts
find ./ryanoasis-nerd-fonts-* -name '*.ttf' -exec cp {} $UHOME/.local/share/fonts \;
rm -rf ./ryanoasis-nerd-fonts-*

# ####### #
# Flathub # 
# ####### #

$installHeader flatpak

# obsidian
flatpak install md.obsidian.Obsidian/x86_64/stable

# blanket
flatpak install com.rafaelmardojai.Blanket/x86_64/stable

# vesktop
curl -s https://api.github.com/repos/Vencord/Vesktop/releases/latest | grep "browser_download_url.*amd64.deb" | cut -d : -f 2,3 | tr -d \" | wget -qi -
$installHeader ./vesktop_*_amd64.deb
rm vesktop_*_amd64.deb


# ############# #
# Configuration # 
# ############# #

# .profile (firefox force wayland) 
cp $dotfilesLoc/.profile $UHOME

# bashrc
mv $dotfilesLoc/.bashrc $UHOME

# sway 
cd $dotfilesLoc
mkdir $UHOME/.config
mv $dotfilesLoc/sway $UHOME/.config/

# waybar
chmod +x $dotfilesLoc/waybar/networkmanager.sh 
git clone git@github.com:Andeskjerf/waybar-module-pomodoro.git $UHOME/applications/waybar-module-pomodoro
cd $UHOME/applications/waybar-module-pomodoro
cargo build --release
cp ./target/release/waybar-module-pomodoro $UHOME/.local/bin
cd $dotfilesLoc
mv $dotfilesLoc/waybar $UHOME/.config/
cargo install wallust 

# nvim
mv $dotfilesLoc/BeeConfig $dotfilesLoc/nvim

# everything else
rm -rf $dotfilesLoc/.git
rm $dotfilesLoc/README.md
rm $dotfilesLoc/progs.md
rm $dotfilesLoc/.gitmodules 
find $dotfilesLoc -maxdepth 1 -mindepth 1 -not -name install.sh -not -name firefox -exec mv '{}' $UHOME/.config/ \;

# THE TEST FILE OF ALL TIME
touch $UHOME/test.c



