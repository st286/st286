
## 水星无线网卡UD6、UD6H Linux (pop!_os, ubuntu20.04)驱动安装

        lsusb
        
        Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
        Bus 001 Device 006: ID 8087:07dc Intel Corp. 
        Bus 001 Device 009: ID 0bda:c811 Realtek Semiconductor Corp. 802.11ac NIC
        
        
    Wireless USB Adapter is 0bda:c811 Realtek Semiconductor Corp, On Github, find "realtek 811".  found ....
    
     https://forum.mxlinux.org/viewtopic.php?f=107&t=50579
    
    download ...    https://github.com/smp79/rtl8821CU
    
                also see:  https://github.com/whitebatman2/rtl8821CU
    
    copy as root to /usr/src/
    
    cd   /usr/src/rtl8821CU-5.8.1
    
        sudo su
        make
        make install
        modprobe 8821cu
        
        ## notice :  maybe  first  install -p -m 644 8821cu   /lib/modules/5.4.0-7642-generic
        
        ## maybe   modinfo 8821cu
        
        
        
    
    


