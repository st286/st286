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

**system time**

  timedatectl set-ntp true
  
**partition**

  lsblk
  
  fdisk -l /dev/sdX 
  
  fdisk /dev/sdX
  
  Number        Size        Name    
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
  
**pacstrap**  

  pacstrap /mnt/usb linux linux-firmware base base-devel nano
  
  
