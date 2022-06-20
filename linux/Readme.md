## linux 终端 中文乱码 设置utf8字符集
```
locale -a

locale: Cannot set LC_CTYPE to default locale: No such file or directory
locale: Cannot set LC_MESSAGES to default locale: No such file or directory
locale: Cannot set LC_COLLATE to default locale: No such file or directory
C
C.UTF-8
POSIX
zh_CN.utf8
```

Generate missing locales and select your desired default with:

    sudo dpkg-reconfigure locales
    
```
locale -a
C
C.UTF-8
en_GB.utf8
en_HK.utf8
en_SG.utf8
en_US.utf8
POSIX
zh_CN.utf8
zh_HK.utf8
zh_SG.utf8
zh_TW.utf8
```

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
   
