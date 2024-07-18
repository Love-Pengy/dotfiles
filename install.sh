: <<'END'
declare -A osInfo;
osInfo[/etc/redhat-release]=yum
osInfo[/etc/arch-release]=pacman
osInfo[/etc/gentoo-release]=emerge
osInfo[/etc/SuSE-release]=zypp
osInfo[/etc/debian_version]=apt-get
osInfo[/etc/alpine-release]=apk

for f in ${!osInfo[@]}
do
    if [[ -f $f ]];then
        if [ "${osInfo[$f]}" == "apt-get" ]
        then 
            installHeader="${osInfo[$f]} install"
            updateString="apt-get update && apt-get upgrade"
        fi
        if [ "${osInfo[$f]}" == "pacman" ]
        then 
            installHeader="${osInfo[$f]} -S"
            updateString="pacman -Syu"
        fi
        
    fi
done
END

installHeader="apt install -y"

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
$installHeader sway pactl light playerctl grimshot swayidle swaylock wl-clipboard pipewire pipewire-pulse

# Wofi
$installHeader wofi

# Waybar 
$installHeader waybar

# Kitty
$installHeader kitty

# hyfetch 
$installHeader python3 python3-pip
pip install -U hyfetch


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


# ########### #
# Pwogwamming # 
# ########### #

# neovim
$installHeader neovim ripgrep fd

# buildtools
$installHeader make cmake 
## requires user input
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# nerdfonts
curl https://api.github.com/repos/ryanoasis/nerd-fonts/tags | grep "tarball_url" | grep -Eo 'https://[^\"]*' | sed  -n '1p' | xargs wget -O - | tar -xz
find ./ryanoasis-nerd-fonts-* -name '*.ttf' -exec cp {} ~/.local/share/fonts \;
rm -rf ./ryanoasis-nerd-fonts-*

# ####### #
# Flathub # 
# ####### #

$installHeader flatpak

# obsidian
flatpak install obsidian

# blanket
flatpak install blanket

# ############# #
# Configuration # 
# ############# #

# sway 
# UNDER THE ASSUMPTION THAT THIS IS CLONED IN THE HOME DIR
cd 
chmod +x ./dotfiles/sway/scripts/dmenu.sh 
chmod +x ./dotfiles/sway/scripts/kill.sh 
chmod +x ./dotfiles/sway/scripts/workspaces/move/* 
chmod +x ./dotfiles/sway/scripts/workspaces/switch/* 
mv ./dotfiles/sway ~/.config/

# waybar
chmod +x waybar/network-manager.sh 
git clone git@github.com:Andeskjerf/waybar-module-pomodoro.git ~/applications/waybar-module-pomodoro
cd applications/waybar-module-pomodoro
cargo build --release
cp ./target/release/waybar-module-pomodoro ~/.local/bin
cd 
mv ./dotfiles/waybar ~/.config/

# nvim
mv ./dotfiles/BeeConfig ./dotfiles/nvim

# everything else
rm -rf ./dotfiles/.git
rm ./dotfiles/.gitmodules 
mv '\ls -al ~/dotfiles | grep -v install.sh' ~/.config





