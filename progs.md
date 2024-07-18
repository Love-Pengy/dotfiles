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
  - Windows_Server
  - USBMount

- sway
  - pactl
  - light
  - playerctl
  - grimshot
  - swayidle
  - swaylock
  - wl-clipboard
  - pipewire, pipewire-pulse
- wofi
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
- use dolphin instead of thunar
- tree
- htop
- ncdu

## Extras

- typeocia
  - need go for this
- vlc
- yt-dlp
- bc
- cifs-utils
- ffmpeg
- kdenlive
- lm-sensors
- network-manager
- valgrind
  - (I think included)

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

- sway
  - make scripts executable
    - kill.sh
    - dmenu.sh
    - all switchWS scripts
    - all moveWS scripts
- waybar
  - make networkmanager executable
  - compile and move waybar-module-pomodoro into ~/.local/bin
-obs-studio
    - setup keystroke-display

## NEEDS BY HAND CONFIG

- automatic server mounting
     - samba credentials file 
        - https://www.reddit.com/r/linux/comments/cogxiv/my_way_to_automount_a_samba_share/

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
