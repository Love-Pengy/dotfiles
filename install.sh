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

# ####################### #
# Important Starting Deps # 
# ####################### #

$updateString
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
mkdir -p ~/pictures ~/documents ~/videos ~/applications ~/downloads ~/projects ~/windowsServer ~/usbMount

# Sway 
$installHeader sway pactl light playerctl grimshot swayidle swaylock wl-clipboard

# Wofi
$installHeader wofi

# Waybar 
$installHeader waybar

# Kitty
$installHeader kitty

# gtkgreet
$installHeader greetd meson ninja
git clone  https://git.sr.ht/~kennylevinsen/gtkgreet ~/applications/gtkgreet
cd applications/gtkgreet
meson build
ninja -C build

echo "# `-l` activates layer-shell mode. Notice that `swaymsg exit` will run after gtkgreet.
exec "gtkgreet -l; swaymsg exit"

bindsym Mod4+shift+e exec swaynag \
	-t warning \
	-m 'What do you want to do?' \
	-b 'Poweroff' 'systemctl poweroff' \
	-b 'Reboot' 'systemctl reboot'

include /etc/sway/config.d/*" > /etc/greetd/sway-config

echo '[terminal]
vt = 1

[default_session]
command = "sway --config /etc/greetd/sway-config"
user = "greeter"' > /etc/greetd/config.toml
cd 

# hyfetch 
$installHeader python3 python3-pip
pip install -U hyfetch


# ##### #
# Utils # 
# ##### #

# firefox
$installHeader firefox

# obs
if [ $installHeader == "apt-get install" ] 
then 
    
$installHeader v4l2loopback-dkms
$installHeader cmake ninja-build pkg-config clang clang-format build-essential curl ccache git zsh
$installHeader libavcodec-dev libavdevice-dev libavfilter-dev libavformat-dev libavutil-dev libswresample-dev libswscale-dev libx264-dev libcurl4-openssl-dev libmbedtls-dev libgl1-mesa-dev libjansson-dev libluajit-5.1-dev python3-dev libx11-dev libxcb-randr0-dev libxcb-shm0-dev libxcb-xinerama0-dev libxcb-composite0-dev libxcomposite-dev libxinerama-dev libxcb1-dev libx11-xcb-dev libxcb-xfixes0-dev swig libcmocka-dev libxss-dev libglvnd-dev libgles2-mesa libgles2-mesa-dev libwayland-dev librist-dev libsrt-openssl-dev libpci-dev libpipewire-0.3-dev libqrcodegencpp-dev uthash-dev
$installHeader \
       qt6-base-dev \
       qt6-base-private-dev \
       libqt6svg6-dev \
       qt6-wayland \
       qt6-image-formats-plugins
$installHeader \
       libasound2-dev \
       libfdk-aac-dev \
       libfontconfig-dev \
       libfreetype6-dev \
       libjack-jackd2-dev \
       libpulse-dev libsndio-dev \
       libspeexdsp-dev \
       libudev-dev \
       libv4l-dev \
       libva-dev \
       libvlc-dev \
       libvpl-dev \
       libdrm-dev \
       nlohmann-json3-dev \
       libwebsocketpp-dev \
       libasio-dev

cmake -S . -B ~/applications -G Ninja \
	-DCEF_ROOT_DIR="../obs-build-dependencies/cef_binary_5060_linux_x86_64" \
	-DENABLE_PIPEWIRE=ON \
	-DENABLE_AJA=0 \
        -DENABLE_WEBRTC=0 \
	-DQT_VERSION=6

cmake --build ~/applications
cmake --build ~/applications -t libobs
cmake --build ~/applications -t clean

cmake --build ~/applications --target package

sudo apt-mark hold obs-studio

$installHeader ./obs-studio-*-*-Linux.deb

$installHeader xdg-desktop-portal-wlr
else
    $installHeader obs-studio
    $installHeader xdg-desktop-portal-wlr
    $installHeader v4l2loopback-dkms
fi

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

# cifs-utils (for auto connecting to server)
$installHeader cifs-utils

# ffmpeg 
$installHeader ffmpeg

# kdenlive
$installHeader kdenlive

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

### UNDER THE ASSUMPTION THAT YOU'RE RUNNING THE SCRIPT WITHIN THE DOTFILES DIR AND ITS IN THE HOME DIR
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

# keystroke display
git clone git@github.com:Beaux44/Keystroke-Display.git ~/applications/keystroke-display
cd ~/applications/keystroke-display 
cargo build --release
mkdir /usr/bin/obs-plugins
cp ~/target/release/keystroke_overlay.so /usr/bin/obs-plugins 




