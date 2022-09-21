


# Zero: Trojan github and site:


[Trojan Site 网站](https://trojan-gfw.github.io/trojan/)

[Trojan Github](https://github.com/trojan-gfw/trojan)

[Trojan-go ](https://github.com/p4gefau1t/trojan-go)

[Trojan For Linux 教程](https://xbsj6143.xyz/pagesv2/download-linux.html)

----------

## [Trojan Panel-install-script](https://github.com/trojanpanel/install-script)

----------
#  One: Trojan-go版


Trojan-Go使用Go实现的完整Trojan代理，与Trojan协议以及Trojan版本的配置文件格式兼容。安全，高效，轻巧，易用。

支持使用多路复用提升并发性能，使用路由模块实现国内直连。

[ 安装配置 trojan-go ](./install-trojan-go.md)

[Trojan-go 版 release 发布](https://github.com/p4gefau1t/trojan-go/releases)
 
 
[ p4gefau1t /trojan-go ](https://github.com/p4gefau1t/trojan-go)


[Trojan-Go文档](https://p4gefau1t.github.io/trojan-go/)

 
[安装trojan-installer](https://github.com/Jrohy/trojan)
 

[手动搭建Trojan-go+Nginx+Tls](https://jeanniestudio.top/2020/07/17/手动搭建Trojan-go+Nginx+Tls%20-%20副本/)
 



----------
#  Two: Trojan 原版

**注意：Trojan只用socks5代理**

[Trojan 原版 released 最新发布版本](https://github.com/trojan-gfw/trojan/releases/)

[Trojan-gfw](https://github.com/trojan-gfw/trojan)


在 Debian 10 (ubuntu 18,19, 20）安装成功
```shell
    wget https://raw.githubusercontent.com/st286/st286.github.io/master/Trojan/trojan-first-install-debain.sh
    
    bash trojan-first-install-debain.sh
    
    # 按提示操作
```
### 详细安装参考[这里](./install.md)
    
    
 [自建梯子教程 --Trojan版本](https://trojan-tutor.github.io/2019/04/10/p41.html)
 
 [Trojan安装配置教程](https://qoant.com/2019/04/vps-with-trojan/)

**配置文件和证书、密钥文件在目录： /usr/local/etc/trojan/**


**运行启动Trojan**

    systemctl start trojan

**设置开机启动**

    systemctl enable trojan

**查看运行状态**

    systemctl status trojan
    
 **更新Trojan**
 
    用update.sh脚本

### client side 客户端

scp 配置和证书, client.json、ca-cert.pem（在服务器端目录/usr/local/etc/trojan/中）， 修改客户端配置文件 client.json ( 密码和证书、密钥 )

 
 
 ------------------
 
 
