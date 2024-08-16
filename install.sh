#!/bin/sh

dotfilesLoc=$PWD
installHeader="apt-get install -y"

# ####################### #
# Important Starting Deps # 
# ####################### #

$installHeader git 

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
mkdir -p ~/pictures ~/documents ~/videos ~/applications ~/downloads ~/projects ~/server 

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

# local send
$installHeader localsend

# firefox
$installHeader firefox

# obs
add-apt-repository ppa:obsproject/obs-studio
apt update
$installHeader obs-studio
$installHeader xdg-desktop-portal-wlr
$installHeader v4l2loopback-dkms

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

# bc
$installHeader bc

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
mkdir -p ~/.local/share/fonts
find ./ryanoasis-nerd-fonts-* -name '*.ttf' -exec cp {} ~/.local/share/fonts \;
rm -rf ./ryanoasis-nerd-fonts-*

# ####### #
# Flathub # 
# ####### #

$installHeader flatpak

# obsidian
flatpak install md.obsidian.Obsidian/x86_64/stable

# blanket
flatpak install com.rafaelmardojai.Blanket/x86_64/stable

# discord 
#flatpak install com.discordapp.Discord/x86_64/stable
# vesktop
curl -s https://api.github.com/repos/Vencord/Vesktop/releases/latest | grep "browser_download_url.*amd64.deb" | cut -d : -f 2,3 | tr -d \" | wget -qi -
$installHeader ./vesktop-*.amd64.deb
rm vesktop-*.amd64.deb


# ############# #
# Configuration # 
# ############# #

# sway 
cd $runningDir 
mkdir ~/.config
mv $dotfilesLoc/sway ~/.config/

# waybar
chmod +x $dotfilesLoc/waybar/network-manager.sh 
git clone git@github.com:Andeskjerf/waybar-module-pomodoro.git ~/applications/waybar-module-pomodoro
cd ~/applications/waybar-module-pomodoro
cargo build --release
cp ./target/release/waybar-module-pomodoro ~/.local/bin
cd $dotfilesLoc
mv $dotfilesLoc/waybar ~/.config/

# nvim
mv $dotfilesLoc/BeeConfig $dotfilesLoc/nvim

# everything else
rm -rf $dotfilesLoc/.git
rm $dotfilesLoc/.gitmodules 
find $dotfilesLoc -maxdepth 1 -mindepth 1 -not -name install.sh -exec mv '{}' ~/.config/ \;





