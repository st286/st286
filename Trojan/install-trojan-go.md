
#  Trojan-Go 安装配置教程


## 简介

[Trojan-Go](https://github.com/p4gefau1t/trojan-go)使用Go实现的完整Trojan代理，与Trojan协议以及Trojan版本的配置文件格式兼容。安全，高效，轻巧，易用。

支持使用多路复用提升并发性能，使用路由模块实现国内直连。

支持CDN流量中转(基于WebSocket over TLS/SSL)。

支持使用AEAD对Trojan流量二次加密(基于Shadowsocks AEAD)。

支持可插拔的传输层插件，允许替换TLS，使用其他加密隧道传输Trojan协议流量。

完整配置教程和配置介绍参见[Trojan-Go文档](https://p4gefau1t.github.io/trojan-go)。


## 安装并配置 trojan-go

### server side 安装

[Trojan-go releases](https://github.com/p4gefau1t/trojan-go/releases)

以 trojan-go v0.8.2 为例：

      wget https://github.com/p4gefau1t/trojan-go/releases/download/v0.8.2/trojan-go-linux-amd64.zip
      unzip -o trojan-go-linux-amd64.zip -d /home/trojan-go
      rm trojan-go-linux-amd64.zip
      



***安装及配置Nginx及安装证书**

      apt update && apt upgrade -y
      apt install nginx


      
      
      
###  client side 配置

编辑配置文件，注意替换其中的password及example.com内容：


