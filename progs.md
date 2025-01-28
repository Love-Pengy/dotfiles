

## Setup
- brightnessctl 
    - need to run `sudo usermod -aG video ${USER}` then reboot for non sudo perms

## Utils

- wallust
    - https://codeberg.org/explosion-mental/wallust
- obs studio
  - add ppa instead of system package
- localsend

## Extras

- vesktop

## pwogwamming

- rust/cargo 
- nerdfonts  

## flathub

- obsidian

## configuration

- waybar
  - make networkmanager executable

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
