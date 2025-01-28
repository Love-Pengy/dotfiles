#!/bin/bash

# dotfilesLoc=$PWD
# UHOME=$(getent passwd $SUDO_USER | cut -d: -f6)
install ="apt-get install -y"

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
mkdir -p $UHOME/Applications $UHOME/Projects $UHOME/Documents $UHOME/Videos \
         $UHOME/Downloads 


# ################ #
# Package Download #
# ################ #

for package in ${programs[@]}; do 
  $install $package
done 

# Install Local Send
curl -s https://api.github.com/repos/localsend/localsend/releases/latest | grep "browser_download_url.*linux-x86-64.deb" | cut -d : -f 2,3 | tr -d \" | wget -qi -
$install ./LocalSend-*-linux-x86-64.deb
rm LocalSend-*-linux-x86-64.deb

# Install OBS
add-apt-repository ppa:obsproject/obs-studio
apt update
$install obs-studio


## Install Rust |  requires user input
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install cargo 
$install cargo 

# Install Wallust 
cargo install wallust

# nerdfonts
curl https://api.github.com/repos/ryanoasis/nerd-fonts/tags | grep "tarball_url" | grep -Eo 'https://[^\"]*' | sed  -n '1p' | xargs wget -O - | tar -xz
mkdir -p $UHOME/.local/share/fonts
find ./ryanoasis-nerd-fonts-* -name '*.ttf' -exec cp {} $UHOME/.local/share/fonts \;
rm -rf ./ryanoasis-nerd-fonts-*

# obsidian
flatpak install md.obsidian.Obsidian/x86_64/stable

# vesktop
curl -s https://api.github.com/repos/Vencord/Vesktop/releases/latest | grep "browser_download_url.*amd64.deb" | cut -d : -f 2,3 | tr -d \" | wget -qi -
$install ./vesktop_*_amd64.deb
rm vesktop_*_amd64.deb


# TODO: COMPLETE THIS PART
#
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



