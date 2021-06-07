---
## Linux 支持显示中文


修改远程主机的bash显示编码 

	    nano    ~/.bashrc

添加如下内容：
```
export LANG='UTC-8' 
export LC_ALL='en_US.UTF-8'
```

生效：

	source ~/.bashrc
        
---
## let  VPS ipv6-only  connect to  ipv4


**1. In Ubuntu 21.04 (vultr)**

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

**5. source .bashrc**

	source .bashrc

**免费的 DNS64+NAT64 提供者有**

    http://www.trex.fi/2011/dns64.html
      2001:67c:2b0::4
      2001:67c:2b0::6
    https://go6lab.si/current-IPv6-tests/nat64dns64-public-test/
      2001:67c:27e4:15::6411
      2001:67c:27e4::64
      
    NAT64公益列表
    2a01:4f9:c010:3f02::1
    2001:67c:2b0::4
    2001:67c:2b0::6
    2a09:11c0:f1:bbf0::70
    2a01:4f8:c2c:123f::1
    2001:67c:27e4:15::6411
    2001:67c:27e4::64
    2001:67c:27e4:15::64
    2001:67c:27e4::60
    2a00:1098:2b::1
    2a03:7900:2:0:31:3:104:161
    2a00:1098:2c::1
    2a09:11c0:100::53
      
**重启VPS后，失效。需ssh，again**
      
---
## interest something 
 
 **bash Shell Startup/Shutdown Files**
 
 	.bash_profile -> .bashrc -> bash_logout
	
 **zsh Shell Startup/Shutdown Files**
 
 	.zprofile (login shell)
	.zshenv (environment variables)
	.zshrc (interactive shell)
	.zlogin (login shell)
	.zlogout (when the shell exits)
	
	
	

      
