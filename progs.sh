#!/bin/bash

# Programs needed for the entire system
programs=(
  ########
  # Core #
  ########

  "sway", 
  "pactl", 
  "brightnessctl", 
  "grimshot", 
  "swayidle",  
  "swaylock", 
  "wl-clipboard", 
  "pipewire", 
  "pipewire-pulse", 
  "wlogout", 
  "dunst", 
  "tofi", 
  "waybar", 
  "kitty", 
  "hyfetch", 

  #########
  # Utils #
  #########

  "stow", 
  "samba-client", 
  "cifs-utils", 
  "firefox", 
  "tree", 
  "btop", 
  "ncdu", 
  "manpages-dev", 
  "manpages-posix-dev", 
  "ffmpeg", 

  ##########
  # Extras #
  #########

  "vlc", 
  "yt-dlp", 
  "network-manager", 
  "xdg-desktop-portal-wlr", 
  "v4l2loopback-dkms", 
  
  ###############
  # Pwogwamming #
  ##############
  
  "cargo", 
  "valgrind", 
  "gdb", 
  "ripgrep", 
  "fd-find", 
  "neovim",  
  "make", 
  "cmake", 
  "flatpak"  
  )
