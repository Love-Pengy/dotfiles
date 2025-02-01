## NEEDS BY HAND CONFIG

# NOTE: this needs to be done later after server setup
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

# NOTE: this cannot easily be done using cmd line so I won't do it for the time being
- firefox
  - figure out what custom css I want and how to implement it automatically 
  - enable custom css
    - <https://github.com/Aris-t2/CustomCSSforFx>

