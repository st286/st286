
# Kali Linux install Bluetooth, Chinese Input-Method, Printer, WPS, Disk-Utility, GoldenDict-dictionary



### One:   Fix Bluetooth (Kali Linux)

    
This is just a short note to myself and all of you who might not get their Bluetooth running in the 2018.2 edition of Kali Linux.

Bluetooth does not seem to be installed with the default configuration of Kali Linux. To make it work, try the following:

```shell
#Install Bluetooth:

sudo apt-get install bluetooth

#Enable Bluetooth permanently:

sudo systemctl enable bluetooth


#Start Bluetooth:

sudo service bluetooth start
```

Now Bluetooth should work. Try if it does after restart.





### Two:  Install Chinese input method on Kali System


(Traditional chinese input method)


#### 0. Set ibus

`sudo apt install ibus zenity -y`

`sudo im-config`  (maybe install zenity first)

#### 1. Install RIME

`sudo apt-get install ibus-rime`

https://github.com/rime/home/wiki/RimeWithIBus#ubuntu


#### 2. Select Input Language

`reboot` 

System Setting — Region&Language — input Source, then click ‘+’ button, choose Chinese


#### 3. Ready to use

Press Super + space to switch input method.

Press F4 to switch schema(simple or complex).




### Three: How does one connect a printer on Kali Linux


CUPS is the standards-based, open source printing system developed by Apple Inc. for macOS® and other UNIX®-like operating systems. CUPS uses the Internet Printing Protocol (IPP) to support printing to local and network printers.

CUPS（前為Common Unix Printing System，即UNIX通用打印系統的縮寫，但現無官方全名[來源請求]）是一個類Unix操作系統的組合式印刷系統，允許一台電腦作為打印服务器。CUPS接受一個客戶端的電腦進程，並送到相應的打印機。

CUPS是自由軟件，使用GNU通用公共许可证和GNU宽通用公共许可证的第2版。 


```shell
#Into Terminal , sudo su as root

#You have to install the required packages and the dependencies 

apt-get update
apt-get install cups cups-client "foomatic-db"

#Now to find the USB Printer type-

#netstat -ant | grep 631

#lsusb -this is used for list USB devices

systemctl enable cups
service cups start

system-config-printer

#Follow instructions to complete rest of the installation……
```



### Four: WPS-linux


[WPS](linux.wps.com)

[https://www.computerhope.com/issues/ch001752.htm]

`sudo dpkg -i XXXX.deb`



### Five: some useful app


####  gnome-disk-utility

`sudo apt install gnome-disk-utility -y`


#### GoldedDict

[安装使用 GoldenDict 查词神器 (Windows/Mac/Linux)](https://www.jianshu.com/p/b6b2c1d78d7c)

`sudo apt install goldendict -y`





