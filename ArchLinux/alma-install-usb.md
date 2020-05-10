## ALMA - Arch Linux Mobile Appliance

## Installation alma

You can either build the project using cargo build or install the alma package from AUR.

[AUR archlinux user respository ](https://aur.archlinux.org/)

    git clone https://aur.archlinux.org/alma.git
    
alma Dependencies

    sudo pacman -S arch-install-scripts coreutils dosfstools gptfdisk parted util-linux rust cryptsetup

[Arch User Repository](https://wiki.archlinux.org/index.php/Arch_User_Repository)

    cd alma
    sudo makepkg -si
    
(above, run as no-root user in sudo)

## alma Usage

    sudo alma help
    
    # Image creation on removable device
    sudo alma create /dev/disk/by-id/usb-Generic_USB_Flash_Disk-0:0
    
    # Disk encryption
    sudo alma create -e  /dev/disk/by-id/usb-Generic_USB_Flash_Disk-0:0 
    
    # chroot
    sudo alma chroot /dev/disk/by-id/usb-Generic_USB_Flash_Disk-0:0
    
    pacman -S base-devel linux-firmware
    
    # networking
    pacman -S dhcpcd iw iwd connman
    
    # nano ect...
    pacman -S nano man-db man-pages git wget 
    
    # console font
    pacman -S terminus-font   vlock
    echo FONT="ter-c18n" > /etc/vconsole.conf
    
    # enable 
    systemctl enable dhcpcd
    systemctl enable iwd
    systemctl enable connman
    
    sync
    
    exit
    
    sync
    
    
    
    
