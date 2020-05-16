## Install to usb

GRUB:  BIOS + GPT,   UEFI + GPT

**live image**

    dd bs=4M if=/path/archlinux.iso of=/dev/sdX status=progress && sync
 
**wired vs wifi**

    ip ,  iw
 
 **BIOS vs UEFI**
 
 **secure boot**
 
    disable secure boot 

**partitioning notes**


### Connect to the Internet

**system time**

    timedatectl set-ntp true


### Prepare USB Stick
  

**partition**

    lsblk
  
    fdisk -l /dev/sdX 
  
     fdisk /dev/sdX
  
     Number         Size        Name    
         1           1 M        BIOS boot partition 
         2           260 M      EFI System           
         3           other      Linux filesystem    
         4           swap       8G

**format**

     mkfs.vfat -F32 /dev/sdX2  
  
     mkfs.ext4 -O "^has_journal" /dev/sdX3
     
     mkswap /dev/sdX4
  
**mount**

     mount /dev/sdX3 /mnt
  
     mkdir /mnt/boot
  
     mount /dev/sdX2 /mnt/boot
  
     swapon
  
###  Install Base Package Set


**pacstrap**  

     ## add pacman source  aliyun , 163  in /etc/pacman.d/mirrorlist
     
     pacstrap /mnt/usb linux linux-firmware base base-devel nano
     
     pacstrap /mnt dhcpcd iw iwd connman openssh git wget man-db man-pages 
  
 **fstab**
  
        genfstab -U /mnt > /mnt/etc/fstab  
  
### Configure New System

        arch-chroot /mnt
        
        echo hostname > /etc/hostname 
        
        nano /etc/hosts
        
        +------------------------------------------------+
        | 127.0.0.1    localhost                         |
        | ::1          localhost                         |
        | 127.0.1.1    hostname.localdomain    hostname  |
        +------------------------------------------------+
        
**RAM disk image (FOR USB)**

        nano /etc/mkinitcpio.conf 
        
         HOOKS=(base udev block filesystems keyboard fsck)
         
         #(FOR USB)Ensure the block hook comes before the filesystems hook and directly after the udev hook like the following
         
         mkinitcpio -p linux
         
         
 **journal config (FOR USB)**
 
        nano /etc/systemd/journald.conf 
        
        Storage=volatile 
        
        SystemMaxUse=30M 
        
  **mount options (FOR USB)**
  
        nano /etc/fstab
        
        Change the mount options from relatime to noatime.
        
**bootloader (GRUB: BIOS/UEFI) (FOR USB and HD)**

        pacman -S grub efibootmgr 
        
        ##Setup GRUB for BIOS booting mode:
        
        grub-install --target=i386-pc --boot-directory=/boot. --recheck /dev/sdX
        
        ##Setup GRUB for UEFI booting mode:
        
        grub-install --target=x86_64-efi --efi-directory=/boot --boot-directory=/boot --removable.  ## or

        grub-install --target=x86_64-efi --efi-directory=esp --bootloader-id=GRUB   --recheck --removable
        
        grub-mkconfig -o /boot/grub/grub.cfg
        
**networking**

        systemctl enable dhcpcd
        
        systemctl enable iwd
        
        systemctl enable  connman
        
**video drivers**

        pacman -S xf86-video-amdgpu xf86-video-ati xf86-video-intel xf86-video-nouveau xf86-video-vesa
        
        To support most common GPUs, install all five basic open source video drivers
        
**root password**

        root password
      
**user account**
    
        user account
        
        passwd user
        
        visudo add:
        
        user ALL=(ALL) ALL
        
**logout**

        sync 
        
        exit 
        
        umount /mnt/boot /mnt && sync 
        
        or umount -R /mnt
        
        reboot
        
**installation complete**    

-----------------------

### cryptsetup

        cryptsetup --verbose --verify-passphrase luksFormat /dev/sdb3
        
        cryptsetup luksOpen /dev/sdb3 my_usb
        
        mkfs.ext3 /dev/mapper/my_usb
        
        e2label /dev/mapper/my_usb persistence
        
        mkdir -p /mnt/my_usb
        
        mount /dev/mapper/my_usb /mnt/my_usb
        
        echo "/ union" > /mnt/my_usb/persistence.conf
        
        umount /dev/mapper/my_usb

        cryptsetup luksClose /dev/mapper/my_usb
        
        


        
        


        
        
