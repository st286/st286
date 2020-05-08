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
  
  
#### base-install-archlinux






### install zsh

  `pacman -S zsh`
  
  `chsh -s $(which zsh)`

### install oh-my-zsh

`sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
