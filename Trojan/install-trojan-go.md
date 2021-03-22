
#  Trojan-Go 安装配置教程


## 简介

[Trojan-Go](https://github.com/p4gefau1t/trojan-go)使用Go实现的完整Trojan代理，与Trojan协议以及Trojan版本的配置文件格式兼容。安全，高效，轻巧，易用。

支持使用多路复用提升并发性能，使用路由模块实现国内直连。

支持CDN流量中转(基于WebSocket over TLS/SSL)。

支持使用AEAD对Trojan流量二次加密(基于Shadowsocks AEAD)。

支持可插拔的传输层插件，允许替换TLS，使用其他加密隧道传输Trojan协议流量。

完整配置教程和配置介绍参见[Trojan-Go文档](https://p4gefau1t.github.io/trojan-go)。

------
## 安装并配置 trojan-go

### server side 安装

[Trojan-go releases](https://github.com/p4gefau1t/trojan-go/releases)

以 trojan-go v0.8.2 为例：

      wget https://github.com/p4gefau1t/trojan-go/releases/download/v0.8.2/trojan-go-linux-amd64.zip
      unzip -o trojan-go-linux-amd64.zip -d /home/trojan-go
      rm trojan-go-linux-amd64.zip
      

**安装及配置Nginx及安装证书**

      apt update && apt upgrade -y
      apt install nginx

生成证书: 用上面cert.sh脚本, 修改其中的cn, organization.

      wget https://raw.githubusercontent.com/st286/st286.github.io/master/Trojan/cert.sh
      
      bash cert.sh
            
**server.json**

```shell
{
    "run_type": "server",
    "local_addr": "0.0.0.0",
    "local_port": 443,
    "remote_addr": "127.0.0.1",
    "remote_port": 80,
    "password": [
        "your-password"
    ],
    "ssl": {
        "cert": "/home/trojan-go/server-cert.pem",
        "key": "/home/trojan-go/server-key.pem",
        "sni": "202010.xxxxx.xxxxx"
    },
    "router": {
        "enabled": true,
        "block": [
            "geoip:private"
        ],
        "geoip": "/home/trojan-go/geoip.dat",
        "geosite": "/home/trojan-go/geosite.dat"
    }
}
```

**server.yaml**

```shell
run-type: server
local-addr: 0.0.0.0
local-port: 443
remote-addr: 127.0.0.1
remote-port: 80
password:
  - your_password
ssl:
  cert: /home/trojan-go/server-cert.pem
  key: /home/trojan-go/server-key.pem
  sni: 202010.xxxxx.xxxxx
router:
  enabled: true
  block:
    - 'geoip:private'
  geoip: /home/trojan-go/geoip.dat
  geosite: /home/trojan-go/geosite.dat
```

**简易的方法:启动服务器. 用tmux, ctl-b & d (deattach), tmux attach -t 0 (attach)**

      ./trojan-go -config config.json
      
      # or
      
      ./trojan-go -config config.yaml

**systemctl的方法:启动服务器.**

配置 trojan-go.service  ( /etc/systemd/system/trojan-go.service )

```shell
[Unit]
Description=Trojan-Go - An unidentifiable mechanism that helps you bypass GFW
Documentation=https://p4gefau1t.github.io/trojan-go/
After=network.target network-online.target nss-lookup.target mysql.service mariadb.service mysqld.service

[Service]
Type=simple
StandardError=journal
ExecStart=/home/trojan-go/trojan-go -config /home/trojan-go/server.yaml
ExecReload=/bin/kill -HUP \$MAINPID
ExecStop=/home/trojan-go/trojan-go
LimitNOFILE=51200
Restart=on-failure
RestartSec=1s

[Install]
WantedBy=multi-user.target

```

启用, 启动 trojan-go:

      ##加载服务文件
      systemctl daemon-reload

      systemctl enable | disable  trojan-go
      
      systemctl start trojan-go
      
      systemctl restart | stop | disable  trojan-go
      
      
------
##  client side 配置

**编辑配置文件，注意替换其中的password, remote_addr, sni, geoip, geosite内容：**


**客户端配置文件**

**client.json**

```shell
{
    "run_type": "client",
    "local_addr": "127.0.0.1",
    "local_port": 1080,
    "remote_addr": "your-site.com",
    "remote_port": 443,
    "password": [
        "your-password"
    ],
    "ssl": {
        "verify": false,
        "verify_hostname": false,
	  "sni": "202010.xxxxx.xxxxx"
    },
    "mux": {
        "enabled": true
    },
    "router": {
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
        "default_policy": "proxy",
        "geoip": "/Users/trojan-go/geoip.dat",
        "geosite": "/Users/trojan-go/geosite.dat"
    }
}

```
**client.yaml**
```shell
run-type: client
local-addr: 127.0.0.1
local-port: 1080
remote-addr: xxx.xxx.xxx.xxx
remote-port: 443
password:
    - your-password
ssl:
    verify: false
    verify_hostname: false
    sni: 202010.xxxxx.xxxxx
mux:
    enabled: true
router:
    enabled: true
    bypass: ['geoip:cn', 'geoip:private', 'geosite:cn', 'geosite:geolocation-cn']
    block: ['geosite:category-ads']
    proxy: ['geosite:geolocation-!cn']
    default_policy: proxy
    geoip: /Users/trojan-go/geoip.dat
    geosite: /Users/trojan-go/geosite.dat
```

**使用配置文件启动客户端/服务端/透明代理/中继（一般模式）**

	./trojan-go -config config.json
	
	# or 
	
	./trojan-go -config config.yaml
	
