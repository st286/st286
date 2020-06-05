## Install to usb or HD, double boot (UEFI or BIOS with gpt)

-----------------
### prepare


GRUB:  BIOS + GPT,   UEFI + GPT

**live image**

    dd bs=4M if=/path/archlinux.iso of=/dev/sdX status=progress && sync
 
**wired vs wifi**

    ip ,  iw
 
 **BIOS vs UEFI**
 
 **secure boot**
 
    disable secure boot 


----------

[Installation guide](https://wiki.archlinux.org/index.php/Installation_guide)

[install to removable](https://wiki.archlinux.org/index.php/Install_Arch_Linux_on_a_removable_medium)

[Arch USB](https://magyar.urown.cloud/arch-usb.html)

[ALMA](https://github.com/r-darwish/alma)



### Connect to the Internet

**system time**

    timedatectl set-ntp true


### Prepare USB Stick or HD
  

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
     
     mkfs.ext4  /dev/sdX3 
  
     mkfs.ext4 -O "^has_journal" /dev/sdX3 (FOR USB)
     
     mkswap /dev/sdX4
  
**mount**

     mount /dev/sdX3 /mnt
  
     mkdir /mnt/boot
  
     mount /dev/sdX2 /mnt/boot
  
     swapon
     
**encrypt**

	### Preparing non-boot partitions:

	 cryptsetup -y -v luksFormat /dev/sda3
	 
	 cryptsetup open /dev/sda3 cryptroot
	 
	 mkfs.ext4 /dev/mapper/cryptroot
	 
	 mount /dev/mapper/cryptroot /mnt

	## Check the mapping works as intended: 检查测绘工作是否符合预期:

	 umount /mnt
	 
	 cryptsetup close cryptroot
	 
	 cryptsetup open /dev/sda3 cryptroot
	 
	 mount /dev/mapper/cryptroot /mnt

  
###  Install Base Package Set


**pacstrap**  

     ## add pacman source  aliyun , 163  in /etc/pacman.d/mirrorlist
     
     pacstrap /mnt linux linux-firmware base base-devel nano
     
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

  [RAM disk image](https://magyar.urown.cloud/#RAM_disk)

         mkinitcpio --help
        
         nano /etc/mkinitcpio.conf 
        
         HOOKS=(base udev block encrypt filesystems keyboard fsck)
         
         #(FOR USB)Ensure the block hook comes before the filesystems hook and directly after the udev hook like the following. 
	 ### Cryptsetup: encrypt: Encrypting an entire system
         
         mkinitcpio -p linux
   
 #### Minimizing disk access
         
 **journal config (FOR USB)**
 
        nano /etc/systemd/journald.conf 
        
        Storage=volatile 
        
        SystemMaxUse=30M 
        
  **mount options (FOR USB)**
  
        nano /etc/fstab
        
        Change the mount options from relatime to noatime.
   
   **To disable fsync and related system calls in web browsers and other applications that do not write essential data, use the eatmydata command from libeatmydata to avoid such system calls:**

         pacman -S libeatmydata
	
	 eatmydata firefox


**bootloader (GRUB: BIOS/UEFI) (FOR USB and HD)**

  [GRUB](https://wiki.archlinux.org/index.php/GRUB)

        pacman -S grub efibootmgr 
        
	## 添加以下内核参数以便在系统启动期间解锁LUKS加密的根分区：/etc/default/grub
	
	GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda3:cryptroot"
	
	     ## cryptdevice=UUID=device-UUID:cryptroot root=/dev/mapper/cryptroot
	
	
        
        ##Setup GRUB for BIOS booting mode:
        
        grub-install --target=i386-pc --boot-directory=/boot --recheck /dev/sdX (FOR BIOS and UEFI; USB or HD)
        
        grub-install --target=i386-pc --recheck  /dev/sdX  (FOR BIOS HD)

        
        ##Setup GRUB for UEFI booting mode:
        
        grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub-efi   --recheck
       
        grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub-efi   --recheck --removable (FOR USB)
        
        
        ##Generated grub.cfg:
        
        grub-mkconfig -o /boot/grub/grub.cfg
        
**networking**

        systemctl enable dhcpcd
        
        systemctl enable iwd
        
        systemctl enable  connman
        
  [connman](https://wiki.archlinux.org/index.php/ConnMan#Connecting_to_a_protected_access_point)
  [iwd](https://wiki.archlinux.org/index.php/Iwd#Usage)
        
**video drivers (FOR USB)**

        pacman -S xf86-video-amdgpu xf86-video-ati xf86-video-intel xf86-video-nouveau xf86-video-vesa
        
        To support most common GPUs, install all five basic open source video drivers
        
**root password**

        ##change root password
	
	passwd
      
**user account**
    
        ##user account
	
	useradd -m someuser
        
        passwd someuser
        
        EDITOR=nano visudo add:
        
        user ALL=(ALL) ALL
	
	Defaults editor=$(which nano)
        
**logout**

        sync 
        
        exit 
        
        umount /mnt/boot /mnt && sync 
        
        or umount -R /mnt
        
        reboot
	
**encrypt: 从chroot退出，卸载分区，关闭设备并重新启动（卸下安装介质）：**

	exit
	
	umount -R /mnt/boot
	
	umount -R /mnt
	
	cryptsetup close cryptroot
	
	sync && reboot	


        
**base installation complete**    

-----------------------

### Deshtop environment install

        pacman -s xorg
        
        pacman -S lxqt

  [LXQt](https://wiki.archlinux.org/index.php/LXQt)
  
  [Desktop environment](https://wiki.archlinux.org/index.php/Desktop_environment)
  
   ** display manage **
   
    ## run as no root

    git clone https://github.com/cylgom/ly.git
    
    make github (fetch submodules)
    
    make
    
    sudo make run  (test)
    
    sudo make install
    
    sudo systemctl enable ly.service
    
  [Ly - a TUI display manager](https://github.com/cylgom/ly)

### Internet

      pacman -S chromium  firefox
      

### Chinese Input


 **localization**

      nano /etc/locale.gen , uncomment en_US.UTF-8 UTF-8
   
      locale-gen
   
      nano /etc/locale.conf
   
      LANG=en_US.UTF-8


 **time zone**

    ln -sf /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
    
    
 **font and input**

    pacman -S ttf-dejavu  wqy-microhei  (install chinese font)

    pacman -S fcitx fcitx-rime fcitx-configtool  (chinese input)
    
  add these into .bashrc, .profile, .xinitrc, .xprofile on HOME directory.
  
      export LC_ALL="en_US.UTF-8"  
      export LANG=zh_CN.UTF-8
      export LANGUAGE=zh_CN:en_US
      export LC_CTYPE=en_US.UTF-8
   
      reboot
      
### sound audio

      pacman -S pulseaudio
      
      pacman -S pulseaudio-bluetooth
      

  [PulseAudio](https://wiki.archlinux.org/index.php/PulseAudio)
  
  
###  LXQt Connman applet — LXQt system-tray applet for ConnMan. 

      ## run as no root

      git clone https://aur.archlinux.org/lxqt-connman-applet.git
      
      less PKGBUILD
      
      makepkg -si
      

   [AUR---Arch User Repository](https://wiki.archlinux.org/index.php/Arch_User_Repository#Installing_packages)
   
   [LXQt Connman applet](https://github.com/lxqt/lxqt-connman-applet)
    
   [lxqt-connman-appletAUR](https://aur.archlinux.org/packages/lxqt-connman-applet/)

------------------------
### install garbage

    pacman -S gvfs

###  touchpad support

Install support for standard notebook touchpads:

      pacman -S xf86-input-synaptics 

### install battery

     pacman -S acpi

### console font sizes

      pacman -S terminus-font
      
      echo FONT="ter-c18n" > /etc/vconsole.conf

      echo KEYMAP="us" >> /etc/vconsole.conf
-----------------------

### Printer CUPS

[cups](https://wiki.archlinux.org/index.php/CUPS)

[cups chinese](https://wiki.archlinux.org/index.php/CUPS_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))

	## install samsung printer M2876HN: example:
	
	 pacman -S  cups  cups-pdf  splix 
	
	# Enable and start org.cups.cupsd.service.
      
         systemctl  enable  org.cups.cupsd.service
      
         systemctl  start  org.cups.cupsd.service

	## splix: samsung driver; cups-pdf: virtual printer (PDF)
	
**如果打印机需要的PPD文件不在CUPS中, 那么:**

   去 [AUR](https://wiki.archlinux.org/index.php/AUR) 寻找为打印机/制造商提供的包。
   
   去这个网站 [OpenPrinting database](http://www.openprinting.org/printers) 选择你需要的制造商和型号。
   
   浏览制造商的网站寻找GNU/Linux驱动程序。

      ## install Fuji Xerox DocuPrint CM215 fw:
      
       pacman -S  cups
      
      # Enable and start org.cups.cupsd.service.
      
       systemctl  enable  org.cups.cupsd.service
      
       systemctl  start  org.cups.cupsd.service
      
   [Go to this site:foo2hbpl](http://foo2hbpl.rkkda.com/)
   
      ## Download and Install

      ## Click the link, or cut and paste the whole command line below to download the driver.

            $ wget -O foo2zjs.tar.gz http://foo2zjs.rkkda.com/foo2zjs.tar.gz

      ## Now unpack it:

        ## Unpack:
	
            $ tar zxf foo2zjs.tar.gz
	    
            $ cd foo2zjs

      ## Now compile and install it. The INSTALL file contains more detailed instructions; please read it now.

        ## Compile:
	
            $ make


        ## Install driver, foomatic XML files, and extra files:
          
	  $ su; make install     OR	$ sudo make install
          

        ##(Optional) If you use CUPS, restart the spooler:
	
            # make cups		OR	$ sudo make cups




----------------------
### zsh and oh-my-zsh

#### install zsh

	  pacman -S zsh
  
  	  chsh -s $(which zsh)

#### install oh-my-zsh

	  sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


------------------------
### cryptsetup (partition)

        cryptsetup --verbose --verify-passphrase luksFormat /dev/sdb3
        
        cryptsetup luksOpen /dev/sdb3 my_usb
        
        mkfs.ext3 /dev/mapper/my_usb
        
        e2label /dev/mapper/my_usb persistence
        
        mkdir -p /mnt/my_usb
        
        mount /dev/mapper/my_usb /mnt/my_usb
        
        echo "/ union" > /mnt/my_usb/persistence.conf
        
        umount /dev/mapper/my_usb

        cryptsetup luksClose /dev/mapper/my_usb
        
        


        
        


        
        
