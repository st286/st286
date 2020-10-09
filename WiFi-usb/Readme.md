
## 水星mercury无线网卡UD6、UD6H Linux (pop!_os, ubuntu20.04)驱动安装


#### [Linux系统下安装USB无线网卡驱动方法](https://www.jianshu.com/p/a9f768d37ada)


方法1：有可能系统内核已经集成好了你需要的驱动模块，只需要手工加载以下验证是否有效，如果无效再选择方法2.

方法2：github 搜索型号的驱动源码，手动编译安装 。

方法3:  google



        lsusb
        
        Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
        Bus 001 Device 006: ID 8087:07dc Intel Corp. 
        Bus 001 Device 009: ID 0bda:c811 Realtek Semiconductor Corp. 802.11ac NIC
        
        
  Wireless USB Adapter is 0bda:c811 Realtek Semiconductor Corp, On Github, find "realtek 811".  found ....
    
  [SOLVED WiFi USB adapter RTL8811 (0bda:c811) was not working](https://forum.mxlinux.org/viewtopic.php?f=107&t=50579)
    
  download ...   
  
  [ Realtek RTL8811CU/RTL8821CU USB wifi adapter driver version 5.4.1 for Linux 4.4.x up to 5.2.x](https://github.com/smp79/rtl8821CU)
    
  also see:  
                
  [ whitebatman2/rtl8821CU ](https://github.com/whitebatman2/rtl8821CU)
    
    copy as root to /usr/src/
    
    cd   /usr/src/rtl8821CU-5.8.1
    
        sudo su
        make
        make install
        modprobe 8821cu
        
        ## notice :  maybe  first  install -p -m 644 8821cu   /lib/modules/5.4.0-7642-generic
        
        ## maybe   modinfo 8821cu
        
      
---------------------------------------------

## 华硕asus usb-AC57 无线网卡驱动 linux install

also see: [Ubuntu 16.04 can't install driver for ASUS USB-AC57](https://askubuntu.com/questions/1063402/ubuntu-16-04-cant-install-driver-for-asus-usb-ac57)

        lsubs 
        
        Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
        Bus 001 Device 005: ID 0b05:1841 ASUSTek Computer, Inc. 802.11ac NIC


From what I can find your wifi is rtl8822bu, so I made a small change to some github source code that you can try, in terminal-

        sudo apt install git build-essential dkms
        git clone https://github.com/jeremyb31/rtl8822bu.git
        cd rtl8822bu
        make
        sudo make install

Please check mokutil --sb-state if it says Secure Boot is enabled you will need to enter UEFI/BIOS to disable secure boot when rebooting. If the driver works you can enable dkms support with

        sudo dkms add ./rtl8822bu

Then the module will be compiled when a new kernel is installed

The Linux driver download from https://www.asus.com/Networking/USB-AC57/HelpDesk_Download/ should work on 16.04 with the 4.4 kernel but not if you are using 4.15

------

**find rtl8822 on Github, found ...**


[ morrownr/88x2bu ](https://github.com/morrownr/88x2bu)


**following and doing .....   done!**


#### DKMS:

This driver can be installed using DKMS. DKMS is a system utility which will automatically recompile and install a kernel module when a new kernel is installed. To make use of DKMS, install the dkms package. On Debian (based) systems, such as Ubuntu and Mint, installation is accomplished like this:

        $ sudo apt-get install dkms


#### Installation of the Driver:


Note: The installation instructions I am providing are for the novice user. Experienced users are welcome to alter the installation to meet their needs.


Go to https://github.com/morrownr/88x2bu for the latest version of the driver.


Download the driver by clicking on the green Code button.


Click on Download ZIP and save 88x2bu-master.zip in your Downloads folder.


Upzip 88x2bu-master.zip. A folder called 88x2bu-master should be created.


Open a terminal and enter the folder called 88x2bu-master:


        $ cd ~/Downloads/88x2bu-master


Execute the following command:


        $ sudo ./dkms-install.sh

        $ sudo reboot


#### Removal of the Driver:


Open a terminal in the directory with the source code and execute the following command:

        $ sudo ./dkms-remove.sh

        $ sudo reboot

        
    
    


