# Programs Included In Entire System

## Important

- git
- THE TEST FILE 

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
  - light
  - playerctl
  - grimshot
  - swayidle
  - swaylock
  - wl-clipboard
  - pipewire, pipewire-pulse
  - wlogout
- tofi 
- waybar
- kitty
- hyfetch

## Utils

- samba-client
- localsend
- firefox
- obs studio
  - build from source so you actually get the whole thing
  - install xdg-desktop-portal-wlr (I think)
- dolphin
- tree
- htop
- ncdu
- manpages-dev
- manpages-posix-dev

## Extras

- typeocia
  - need go for this
- vlc
- yt-dlp
- cifs-utils
- ffmpeg
- kdenlive
- lm-sensors
- network-manager
- valgrind
  - (I think included)
- gdb
- vesktop

## pwogwamming

- neovim
  - ripgrep
  - fd
- make
- cmake
- rust/cargo or whatever
- nerdfonts  

## flathub

- blanket
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
- add league lofi sounds to blanket
- setup qmk
