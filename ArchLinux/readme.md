# Arch linux

[Install Arch linux on a USB key](https://wiki.archlinux.org/index.php/Install_Arch_Linux_on_a_USB_key_(简体中文))

[Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)


## (One) Pre-installation

### (01) Verify signature

On a system with GnuPG installed, do this by downloading the PGP signature (under Checksums) to the ISO directory, and verifying it with: 

gpg --keyserver-options auto-key-retrieve --verify archlinux-version-x86_64.iso.sig

Alternatively, from an existing Arch Linux installation run: 

pacman-key -v archlinux-version-x86_64.iso.sig

### (02) Boot the live environment

### (03) Verify the boot mode

 ls /sys/firmware/efi/efivars   or    efivar -l    ##enables dhcpcd

### (04) Connect to the internet

ip link   or   ip add    or   ip route

The connection may be verified with ping:

ping archlinux.org    or   ping www.sina.com  ......

iw dev # for wireless

ip link set interface up|down

ip link show dev eth0

ip address show

ip address add address/prefix_len broadcast + dev interface

ip address del address/prefix_len dev interface

ip route show     or   ip -6 route

networking

Network configuration/Ethernet#Device driver 

Wireless network configuration#Getting some useful


### (05) Update the system clock

timedatectl set-ntp true

timedatectl status

hwclock --systohc --utc (or --localtime) 


### (06) Partition the disks

    Use fdisk(msdos), parted(msdos gpt), or cfdisk to modify partition tables, for example fdisk /dev/sdX.
    
Swap space can be set on a swap file for file systems supporting it.

fdisk -l

lsblk



The following partitions are required for a chosen device:
    One partition for the root directory /.
If UEFI is enabled, an EFI system partition.
Example layouts
BIOS with MBR 
Mount point 	Partition 	Partition type 	Suggested size 	
/mnt/boot	/dev/sdX1 	Boot flag
YES	260–512 MiB 	
/mnt 	/dev/sdX2 	Linux 	15-20GB	
[SWAP] 	/dev/sdX3 	Linux swap 	More than 512 MiB 	
/mnt/home	/dev/sdx4	Linux, or vfat	Remainder of the device 	
UEFI with GPT 
Mount point 	Partition 	Partition type 	Suggested size 	
/mnt/boot or /mnt/efi 	/dev/sdX1 	EFI system partition 	260–512 MiB 	
/mnt 	/dev/sdX2 	Linux x86-64 root (/) 	15-20GB	
[SWAP] 	/dev/sdX3 	Linux swap 	More than 512 MiB 	
/mnt/home	/dev/sdx4	Linux, or vfat	Remainder of the device 	


See also Partitioning#Example layouts. 

### (07) Format the partitions

```shell
# mkfs.vfat -F32 /dev/sdX1
# mkfs.ext4 /dev/sdX2
# mkfs.ext4 /dev/sdX4

# mkswap /dev/sdX3
# swapon /dev/sdX3
```

### (08) Mount the file systems

```shell
# mount /dev/sdX2  /mnt
# mkdir -p /mnt/boot
# mount /dev/sdX1  /mnt/boot
# mkdir -p /mnt/home
# mount /dev/sdX4  /mnt/home

# lsblk
```

genfstab will later detect mounted file systems and swap space.

## (TWO) Installation

### (01) Select the mirrors

 nano   /etc/pacman.d/mirrorlist

Server = http://mirrors.163.com/archlinux/$repo/os/$arch

Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch

### (02) Install essential packages

Use the pacstrap script to install the base package, Linux kernel and firmware for common hardware: 

 pacstrap  /mnt  base  base-devel 

 pacstrap  /mnt  linux  linux-firmware  
 
 pacstrap /mnt dhcpcd iw iwd connman
 
 pacstrap /mnt  nano  man-db  man-pages  texinfo


## (THREE) Configure the system

Fstab

 genfstab -U /mnt >> /mnt/etc/fstab

Chroot

 arch-chroot /mnt
Change root into the new system

Time zone

 ln -sf /usr/share/zoneinfo/Region/City /etc/localtime

Localization

Edit /etc/locale.gen and uncomment en_US.UTF-8 UTF-8 and other needed locales. Generate the locales by running:

 locale-gen

Create the locale.conf(5) file, and set the LANG variable accordingly:

/etc/locale.conf

LANG=en_US.UTF-8

Network configuration

Create the hostname file:

/etc/hostname

myhostname

Add matching entries to hosts(5):

/etc/hosts

127.0.0.1	localhost
::1		    localhost
127.0.1.1	myhostname.localdomain	myhostname

If the system has a permanent IP address, it should be used instead of 127.0.1.1. 

Root password

Set the root password:

   passwd

## (FOUR) Boot loader (grub)

Install grub

   pacman -S  grub
 
   pacman -S  grub  efibootmgr  os-prober (UEFI)

Write into the disk

   grub-install --recheck /dev/sda
 
   grub-mkconfig -o /boot/grub/grub.cfg

 OR (if use USB disk) GRUB/Tips and tricks (简体中文)#其它安装

BIOS

Assume your USB stick's first partition is FAT32 and its partition is /dev/sdy1

   mkdir -p /mnt/usb
 
   mount /dev/sdy1 /mnt/usb
 
   grub-install --target=i386-pc --debug --boot-directory=/mnt/usb/boot /dev/sdy
 
   grub-mkconfig -o /mnt/usb/boot/grub/grub.cfg

Follow above:

   grub-install --target=i386-pc --debug --boot-directory=/mnt//boot /dev/sdX
 
   grub-mkconfig -o /mnt/boot/grub/grub.cfg

Setup network

   systemctl enable dhcpcd
   
   systemctl enable iwd
   
   systemctl enable connman
 
 


 exit

 reboot


## Post-installation
