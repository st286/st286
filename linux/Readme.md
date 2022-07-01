## [setup Printer (Debian SystemPrinting)](https://wiki.debian.org/SystemPrinting)

A basic view of the CUPS Printing system. Aimed at Debian 11 (bullseye) but it should fit most of what is provided by Debian 10 (buster). 

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
## linux mans pages

#### [Ubuntu manpages](https://manpages.ubuntu.com/)

#### [Debian manpages](https://manpages.debian.org/)

#### [The UNIX and Linux Forums](https://www.unix.com/) include OS X (freeBSD), linux (debian,ubuntu)
##### [Linux & Unix Commands - Man Page Repository](https://www.unix.com/man-page-repository.php)

        package 管理
        
        debconf  debconf-show  dpkg  dpkg-reconfigure  dpkg-preconfigure
        
        package: tzdata  locales  deconf console-setup

## Linux kernel compile

安装编译工具以及其它一下依赖的软件包，在Ubuntu 18.04环境下执行如下命令
```
sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison
```
---
## [Unix & Linux Stack Exchange](https://unix.stackexchange.com)

Unix & Linux Stack Exchange is a question and answer site for users of Linux, FreeBSD and other Un*x-like operating systems. It only takes a minute to sign up.

[What should/shouldn't go in .zshenv, .zshrc, .zlogin, .zprofile, .zlogout?](https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout)

## Linux Learning


 1.  [The linux command line 中文版](https://www.kancloud.cn/thinkphp/linux-command-line/39431)
 
 2.  [IBM----Windows 到 Linux 之旅系列文章](https://www.ibm.com/developerworks/cn/linux/l-roadmap/index.html)
 
 3.  [IBM -- 学习 Linux -- LPIC-1 路线图](https://www.ibm.com/developerworks/cn/linux/l-lpic1-v3-map/)
 
 4.  [Go语言入门教程，Golang入门教程（非常详细)](http://c.biancheng.net/golang/)
 
 ####  5.  linux command
         
   [tar](https://www.jianshu.com/p/b91d7491381b)
   
