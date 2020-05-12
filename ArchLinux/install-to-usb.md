## Install to usb

GRUB:  BIOS + GPT,   UEFI + GPT

**live image**

    dd bs=4M if=/path/archlinux.iso of=/dev/sdX status=progress && sync
 
**wired vs wifi**

    ip  iw
 
 **BIOS vs UEFI**
 
 **secure boot**
 
    disable secure boot 
  
**disable secure boot **

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

**format**

     mkfs.vfat -F32 /dev/sdX2  
  
     mkfs.ext4 -O "^has_journal" /dev/sdX3
  
**mount**

     mount /dev/sdX3 /mnt
  
     mkdir /mnt/boot
  
     mount /dev/sdX2 /mnt/boot
  
###  Install Base Package Set


**pacstrap**  

     pacstrap /mnt/usb linux linux-firmware base base-devel nano
  
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
        
**RAM disk image**

        nano /etc/mkinitcpio.conf 
        
         HOOKS=(base udev block filesystems keyboard fsck)
         
         #Ensure the block hook comes before the filesystems hook and directly after the udev hook like the following
         
         mkinitcpio -p linux
         
         
 **journal config**
 
        nano /etc/systemd/journald.conf 
        
        Storage=volatile 
        
        ystemMaxUse=30M 
        
        
        
        
