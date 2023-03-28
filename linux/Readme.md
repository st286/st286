---
## Driver

[Realtek 802.11ac USB Wi-Fi Linux Driver Installation](https://blog.abysm.org/2020/03/realtek-802-11ac-usb-wi-fi-linux-driver-installation/)
---
## Visudo & Sudoer

[Linux visudo command](https://www.computerhope.com/unix/visudo.htm)

[Why and How to Edit Your Sudoers File in Linux](https://www.maketecheasier.com/edit-sudoers-file-linux/)

---
## 配置kali的apt国内源

```
#中科大
deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib

#阿里云
deb http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
deb-src http://mirrors.aliyun.com/kali kali-rolling main non-free contrib

#清华大学
deb http://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free
deb-src https://mirrors.tuna.tsinghua.edu.cn/kali kali-rolling main contrib non-free

#浙大
deb http://mirrors.zju.edu.cn/kali kali-rolling main contrib non-free
deb-src http://mirrors.zju.edu.cn/kali kali-rolling main contrib non-free

#东软大学
deb http://mirrors.neusoft.edu.cn/kali kali-rolling/main non-free contrib
deb-src http://mirrors.neusoft.edu.cn/kali kali-rolling/main non-free contrib

#官方源
deb http://http.kali.org/kali kali-rolling main non-free contrib
deb-src http://http.kali.org/kali kali-rolling main non-free contrib
```

原文链接：https://blog.csdn.net/qq_44710419/article/details/120470170

---
## Torrent

[Top 15 Best Torrent Clients for Linux System in 2022](https://www.ubuntupit.com/best-torrent-client-for-linux/)

[Transmissionbt](https://transmissionbt.com/)

---
## [Foliate: A simple and modern eBook viewer for Linux desktops](https://johnfactotum.github.io/foliate/)

[Foliate – 适用于 Linux 桌面的简单、现代的电子书阅读器](https://www.appinn.com/foliate-for-linux/)

支持的格式：

    EPUB（.epub，.epub3）
    Kindle（.azw，.azw3）和Mobipocket（.mobi）
    FictionBook（.fb2，.fb2.zip）
    漫画书档案（.cbr，.cbz，.cbt，.cb7）
    纯文本（.txt）

---
## [Setup Printer (Debian SystemPrinting)](https://wiki.debian.org/SystemPrinting)

A basic view of the CUPS Printing system. Aimed at Debian 11 (bullseye) but it should fit most of what is provided by Debian 10 (buster). 

### CUPS

CUPS (formerly an acronym for Common UNIX Printing System) is a modular printing system for Unix-like computer operating systems which allows a computer to act as a print server. A computer running CUPS is a host that can accept print jobs from client computers, process them, and send them to the appropriate printer. 

[Apple CUPS](https://github.com/apple/cups)


#### Software Installation

CUPS and cups-filters are central to the printing system and both are installed with
```
apt install cups
systemctl enable cups
systemctl status cups
```
#### Print Utilities
```
lpstat -a       \\Print Queue Setup Utilities
lpstat -t       \\Printer Status and Control
lpstat -r       \\查看有打印机运行
lpstat -d       \\默认的打印机
lpq             \\打印机队列 

lpinfo -v       \\ list the available backends and printers
lpinfo -m       \\ist all of the available drivers ("models") on your system

```
#### Creating a Print Queue with the CUPS Web Interface
```
http://localhost:631 
```
#### Print to a PDF
```
 apt install printer-driver-cups-pdf
```

---
## KALI Linux 中文输入法

```
## 安装fcitx5软件包
## fcitx5: 输入法基础框架主程序
## fcitx5-config-qt：输入法配置程序
## fcitx5-qt: QT5程序的支持 
##  fcitx5-gtk: GTK程序的支持 
## fcitx5-chinese-addons: 简体中文输入的支持，拼音.(五笔,内置）

sudo apt install fcitx5 fcitx5-config-qt fcitx5-chinese-addons

## 修改环境变量
sudo vim /etc/profile

## 加入下面四行，并注销，重登录

# fcitx5
export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS=@im=fcitx5
```

---
## Linux mans pages

#### [Ubuntu manpages](https://manpages.ubuntu.com/)

#### [Debian manpages](https://manpages.debian.org/)

#### [The UNIX and Linux Forums](https://www.unix.com/) include OS X (freeBSD), linux (debian,ubuntu)
##### [Linux & Unix Commands - Man Page Repository](https://www.unix.com/man-page-repository.php)

        package 管理
        
        debconf  debconf-show  dpkg  dpkg-reconfigure  dpkg-preconfigure
        
        package: tzdata  locales  deconf console-setup

---
## Linux kernel compile

安装编译工具以及其它一下依赖的软件包，在Ubuntu 18.04环境下执行如下命令
```
sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison
```
---
## [Unix & Linux Stack Exchange](https://unix.stackexchange.com)

Unix & Linux Stack Exchange is a question and answer site for users of Linux, FreeBSD and other Un*x-like operating systems. It only takes a minute to sign up.

[What should/shouldn't go in .zshenv, .zshrc, .zlogin, .zprofile, .zlogout?](https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout)

---
## Linux Learning

 1.  [The linux command line 中文版](https://www.kancloud.cn/thinkphp/linux-command-line/39431)
 
 2.  [IBM----Windows 到 Linux 之旅系列文章](https://www.ibm.com/developerworks/cn/linux/l-roadmap/index.html)
 
 3.  [IBM -- 学习 Linux -- LPIC-1 路线图](https://www.ibm.com/developerworks/cn/linux/l-lpic1-v3-map/)
 
 4.  [Go语言入门教程，Golang入门教程（非常详细)](http://c.biancheng.net/golang/)
 
 ####  5.  linux command
         
   [tar](https://www.jianshu.com/p/b91d7491381b)
   
### GoldedDict

[安装使用 GoldenDict 查词神器 (Windows/Mac/Linux)](https://www.jianshu.com/p/b6b2c1d78d7c)

`sudo apt install goldendict -y`
