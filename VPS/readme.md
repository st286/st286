---
## Linux 支持显示中文


修改远程主机的bash显示编码 

	    nano    ~/.bashrc

添加如下内容：

        export LANG='UTC-8' 
        export LC_ALL='en_US.UTF-8'

生效：

	    source ~/.bashrc
        
---
## let  VPS ipv6-only  connect to  ipv4


**1. In Debian10 (ubuntu 20)**

    apt install resolvconf

**2.  nano nameserver in ~, add following**

    nameserver 2001:67c:2b0::4
    nameserver 2001:67c:2b0::6
    nameserver 2001:67c:27e4:15::6411
    nameserver 2001:67c:27e4::64

**3.  cp ./nameserver /etc/resolv.conf and disable update DNS**

	ping  twiter.com and github.com # ipv4
	ping  google.com，facebook.com  # ipv6

**4.  nano .bashrc  add following**

    cp ./nameserver /etc/resolv.conf
    # disable update DNS
    resolvconf --disable-updates


**免费的 DNS64+NAT64 提供者有**

    http://www.trex.fi/2011/dns64.html
      2001:67c:2b0::4
      2001:67c:2b0::6
    https://go6lab.si/current-IPv6-tests/nat64dns64-public-test/
      2001:67c:27e4:15::6411
      2001:67c:27e4::64
      
---
## interest something 
 
 **bash Shell Startup/Shutdown Files**
 
 	.bash_profile -> .bashrc -> bash_logout
	
 **zsh Shell Startup/Shutdown Files **
 
 	.zprofile (login shell)
	.zshenv (environment variables)
	.zshrc (interactive shell)
	.zlogin (login shell)
	.zlogout (when the shell exits)
	
	
	

      
