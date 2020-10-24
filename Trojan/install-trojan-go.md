
#  Trojan-Go 安装配置教程


## 简介

[Trojan-Go](https://github.com/p4gefau1t/trojan-go)使用Go实现的完整Trojan代理，与Trojan协议以及Trojan版本的配置文件格式兼容。安全，高效，轻巧，易用。

支持使用多路复用提升并发性能，使用路由模块实现国内直连。

支持CDN流量中转(基于WebSocket over TLS/SSL)。

支持使用AEAD对Trojan流量二次加密(基于Shadowsocks AEAD)。

支持可插拔的传输层插件，允许替换TLS，使用其他加密隧道传输Trojan协议流量。

完整配置教程和配置介绍参见[Trojan-Go文档](https://p4gefau1t.github.io/trojan-go)。


## 安装并配置 trojan-go

### 安装

以 trojan-go v0.8.2 为例：

      wget https://github.com/p4gefau1t/trojan-go/releases/download/v0.8.2/trojan-go-linux-amd64.zip
      unzip -o trojan-go-linux-amd64.zip -d /usr/local/bin/trojan-go
      rm trojan-go-linux-amd64.zip
      
### 设置自启

      nano  /etc/systemd/system/trojan-go.service
      
 添加如下内容：
     
      [Unit]
      Description=Trojan-Go
      After=network.target nss-lookup.target
      Wants=network-online.target
      
      [Service]
      Type=simple
      User=root
      ExecStart=/usr/local/bin/trojan-go/trojan-go -config /usr/local/etc/trojan-go/config.json
      Restart=on-failure
      RestartSec=15
      
      [Install]
      WantedBy=multi-user.target
      
### 启用服务

      systemctl enable trojan-go
      
      
## 配置

      mkdir -p /usr/local/etc/trojan-go
      nano /usr/local/etc/trojan-go/config.json
      
编辑配置文件，注意替换其中的password，以及ssl部分的内容：

```shell
{
    "run_type": "server",
    "local_addr": "0.0.0.0",
    "local_port": 443,
    "remote_addr": "127.0.0.1",
    "remote_port": 80,
    "password": [
        "fuckgfw"
    ],
    "ssl": {
        "cert": "/etc/ssl/certs/example.com.cer",
        "key": "/etc/ssl/certs/example.com.key",
        "sni": "example.com"
    },
    "router":{
        "enabled": true,
        "block": [
            "geoip:private"
        ]
    }
}
```

## 安装及配置Nginx及安装证书


### 启动服务

      systemctl restart trojan-go
      
      
## 客户端配置文件

编辑配置文件，注意替换其中的password及example.com内容：

```shell
{
    "run_type": "client",
    "local_addr": "127.0.0.1",
    "local_port": 1080,
    "remote_addr": "example.com",
    "remote_port": 443,
    "password": [
        "fuckgfw"
    ],
    "ssl": {
        "sni": "example.com"
    },
    "mux" :{
        "enabled": true
    },
    "router":{
        "enabled": true,
        "bypass": [
            "geoip:cn",
            "geoip:private",
            "geosite:cn",
            "geosite:geolocation-cn"
        ],
        "block": [
            "geosite:category-ads"
        ],
        "proxy": [
            "geosite:geolocation-!cn"
        ],
        "default_policy": "proxy"
    }
} 

```
