
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
  
  
  ## Linux 中如何启用和禁用网卡？
  
  你可能会根据你的需要执行以下命令。我会在这里列举一些你会用到这些命令的例子。

当你添加一个网卡或者从一个物理网卡创建出一个虚拟网卡的时候，你可能需要使用这些命令将新网卡启用起来。另外，如果你对网卡做了某些修改或者网卡本身没有启用，那么你也需要使用以下的某个命令将网卡启用起来。

启用、禁用网卡有很多种方法。在这篇文章里，我们会介绍我们使用过的最好的 5 种方法。

启用禁用网卡可以使用以下 5 个方法来完成：

   1.  ifconfig 命令：用于配置网卡。它可以提供网卡的很多信息.
   
   2.  ifdown/up 命令：ifdown 命令用于禁用网卡，ifup 命令用于启用网卡。
   
   3.  ip 命令：用于管理网卡，用于替代老旧的、不推荐使用的 ifconfig 命令。它和 ifconfig命令很相似，但是提供了很多 ifconfig 命令所不具有的强大的特性.
   
   4.  nmcli 命令：是一个控制 NetworkManager 并报告网络状态的命令行工具。
   
   5.  nmtui 命令：是一个与 NetworkManager 交互的、基于 curses 图形库的终端 UI 应用。

[Linux 中如何启用和禁用网卡](https://zhuanlan.zhihu.com/p/65480107)

