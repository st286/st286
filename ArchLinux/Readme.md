### ready: archlinx install key(usb)

### IMPORTANCE: First, make the disk parted ready for install. 


	Parted the disks.     (fdisk)
  
	Format the partitions.(mkfs)
  
	Mount the file systems.(mount)
  

	Mount poit	    Partition		Partition type			     Suggested size

	/mnt/boot	    /dev/sdX1	      	Boot flag:YES(BIOS with MBR)	     512MB
  
				                EFI system (UEFI with GPT)
                                  
	/mnt		    /dev/sdX2	      	linux 				      more than 15G
  
	[SWAP]		    /dev/sdX3	     	linux swap			      more than 512MiB
  
	/mnt/home	    /dev/sdX4	     	linux or fat			      more than 20G
  
	/mnt/other	    /dev/sdX5	    	linux or fat		


#### Format partition:

	mkfs.fat -F32 /dev/sdX1
  
	mkfs.ext4 /dev/sdXn
  
	mkswap /dev/sdX3
  
	swapon /dev/sdX3
  
#### Mount file systems:

	mount /dev/sdX2 /mnt
  
	mkdir -p /mnt/boot
  
	mount /dev/sdX1 /mnt/boot
  
	mkdir -p /mnt/home
  
	mount /dev/sdX4 /mnt/home
  
	mkdir -p /mnt/other
  
	mount /dev/sdX1 /mnt/other
  
  
### base-install-archlinux

	wget https://raw.githubusercontent.com/st286/st286.github.io/master/ArchLinux/base-install-archlinux.sh
	
	sh base-install-archlinux.sh

### install Grub (BIOS)

	systemctl enable dhckcd iwd connman"

	pacman -S grub (BIOS)
	
#### For usb key:
	
	grub-install --boot-directory=/mnt/boot  /dev/sdX\
	
	grub-mkconfig -o /mnt/boot/grub/grub.cfg
	

#### For hard disk:
	
	grub-install /dev/sdX
	
	grub-mkconfig -o /boot/grub/grub.cfg
	
#### exit and reboot


### install zsh

	pacman -S zsh
  
  	chsh -s $(which zsh)

### install oh-my-zsh

	sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
