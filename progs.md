# Programs Included In Entire System

## Important

- git

## Setup

- make the following directories in home
  - Pictures
  - Documents
  - Videos
  - Applications
  - Downloads
  - Projects

- sway
  - pactl
  - brightnessctl 
    - need to run `sudo usermod -aG video ${USER}` then reboot for non sudo perms
  - playerctl
  - grimshot
  - swayidle
  - swaylock
  - wl-clipboard
  - pipewire, pipewire-pulse
  - wlogout
  - dunst
- tofi 
- waybar
- kitty
- hyfetch

## Utils

- wallust
    - https://codeberg.org/explosion-mental/wallust
- gnu stow 
- citrix workspace
- samba-client
- localsend
- firefox
- obs studio
  - add ppa instead of system package
  - install xdg-desktop-portal-wlr (I think)
- tree
- htop
- ncdu
- manpages-dev
- manpages-posix-dev

## Extras

- vlc
- yt-dlp
- cifs-utils
- ffmpeg
- lm-sensors
- network-manager
- valgrind
- gdb
- vesktop

## pwogwamming

- neovim
  - ripgrep
  - fd-find
- make
- cmake
- rust/cargo 
- nerdfonts  

## flathub

- obsidian

## configuration

- waybar
  - make networkmanager executable
  - compile and move waybar-module-pomodoro into ~/.local/bin
-obs-studio

## NEEDS BY HAND CONFIG

- automatic server mounting
  - samba credentials file
    - <https://www.reddit.com/r/linux/comments/cogxiv/my_way_to_automount_a_samba_share/>
    - steps: 
        - create file in /etc/smbcredentials
        - sudo chmod 600 /etc/smbcredentials
        - add following to fstab
            - ```ip/shareName /mnt/desiredFolder cifs credentials=/etc/smbcredentials,noperm,file_mode=0777,dir_mode=0777,iocharset=utf8,noauto,nofail 0 0``` 
        - make mount dir
        - now good to go 
        - mount with sudo mount -a
- firefox
  - enable custom css
    - <https://github.com/Aris-t2/CustomCSSforFx>
- neovim (lsp and linters)
  - install the following linters/formatters
    - pylint
    - cspell
    - clang-format
    - lua-language-server
    - black
    - clangd
    - cpplint
    - isort
    - markdownlint
    - marksman
    - selene
    - stylua

- move bg to ~/Pictures/wallpaper.png
- setup qmk
