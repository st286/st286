
## linux下禁用网卡的启用网卡的一些方法

### 第一种方法：

这种方法主要是在不重启的情况下会一直生效，适用于服务器。

    #禁用网卡eth0
    sudo ifconfig eth0 down
    #启用网卡eth0
    sudo ifconfig eth0 up

这种方法目前主流linux都可以使用。

### 第二种方法：

由于某些时候需要长期禁用一块网卡，这时候就需要修改配置文件。

  #在redhat系linux中的网卡配置文件路径是/etc/sysconfig/network-script/ifcfg-网卡名
 
    sudo vim /etc/sysconfig/network-script/ifcfg-eth0
    #在其中添加下面代码即可
   TYPE=Ethernet  #网卡类型
   DEVICE=eth0    #网卡名称
   ONBOOT=no     #是否随系统启动该网卡
 
 
  #debian，ubuntu的网卡配置文件路径是/etc/network/interfaces文件
 
   #禁用网卡eth0：
     iface eth0 inet manual
 
    #之后重启网络服务就可以了
    
    
  [linux下禁用网卡的启用网卡的一些方法](https://www.cnblogs.com/ritte/p/9725009.html)
