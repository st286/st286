
# [TUIC](https://github.com/EAimTY/tuic)

[基于 QUIC 的代理软件：TUIC](https://www.eaimty.com/2022/03/tuic.html)

[配置TUIC代理+V2Ray分流](https://lala.im/8424.html)

[Let's Encrypt 使用教程--Certbot](https://diamondfsd.com/lets-encrytp-hand-https/)

[Crontab的使用](https://wayou.github.io/2020/08/28/Crontab-%E7%9A%84%E4%BD%BF%E7%94%A8/)

[A Comprehensive Guide To HTTP/3 And QUIC](https://www.debugbear.com/blog/http3-quic-protocol-guide)

# 配置TUIC代理

tuic是一个基于quic协议的高性能代理，更多介绍：https://github.com/EAimTY/tuic

## 一、安装服务端：
```
apt -y update

apt -y install wget certbot

mkdir /opt/tuic && cd /opt/tuic

wget https://github.com/EAimTY/tuic/releases/download/0.8.5/tuic-server-0.8.5-x86_64-linux-gnu

chmod +x tuic-server-0.8.5-x86_64-linux-gnu
```

 新建tuic配置文件：

`vim config.json`

写入如下配置：
```
{
    "port": 443,
    "token": ["PASSWD"],
    "certificate": "/opt/tuic/fullchain.pem",
    "private_key": "/opt/tuic/privkey.pem",
    "ip": "0.0.0.0",
    "congestion_controller": "bbr",
    "alpn": ["h3"]
}
```

新建systemd配置文件：

`vim /lib/systemd/system/tuic.service`

写入如下配置：

```
[Unit]
Description=Delicately-TUICed high-performance proxy built on top of the QUIC protocol
Documentation=https://github.com/EAimTY/tuic
After=network.target

[Service]
User=root
WorkingDirectory=/opt/tuic
ExecStart=/opt/tuic/tuic-server-0.8.5-x86_64-linux-gnu -c config.json
Restart=on-failure
RestartPreventExitStatus=1
RestartSec=5

[Install]
WantedBy=multi-user.target
```
---
申请证书(自动)：

```
certbot certonly --standalone --agree-tos --no-eff-email --email EMAIL.com -d DONAIN.com
```

将证书保存到tuic配置文件内配置的位置：

```
cat /etc/letsencrypt/live/DOMAIN.com/fullchain.pem > /opt/tuic/fullchain.pem
cat /etc/letsencrypt/live/DOMAIN.com/privkey.pem > /opt/tuic/privkey.pem
```

启动tuic服务并设置开机自启：
```
systemctl enable --now tuic.service
```

新建一个certbot的hook脚本文件，用于让tuic重新加载续期后的新证书：
```
vim /etc/letsencrypt/renewal-hooks/post/tuic.sh
```

写入如下内容：
```
#!/bin/bash
cat /etc/letsencrypt/live/DOMAIN.com/fullchain.pem > /opt/tuic/fullchain.pem
cat /etc/letsencrypt/live/DOMAIN.com/privkey.pem > /opt/tuic/privkey.pem
systemctl restart tuic.service
```

给脚本执行权限：
```
chmod +x /etc/letsencrypt/renewal-hooks/post/tuic.sh
```

测试续期的情况以及脚本能否正常运行：
```
certbot renew --cert-name DOMAIN.com --dry-run
```

服务端到这里就全部配置完成了，接下配置客户端。

---
申请证书(手动)：

```
certbot certonly --standalone --agree-tos --no-eff-email --email YOUR_EMAIL -d YOUR_DONAIN
```

将证书保存到tuic配置文件内配置的位置：

```
cat /etc/letsencrypt/live/YOUR_DONAIN/fullchain.pem > /opt/tuic/fullchain.pem
cat /etc/letsencrypt/live/YOUR_DONAIN/privkey.pem > /opt/tuic/privkey.pem
```

启动tuic服务并设置开机自启：
```
systemctl enable --now tuic.service
```

测试续期的情况以及脚本能否正常运行：
```
certbot renew --cert-name DOMAIN --dry-run
```

服务端到这里就全部配置完成了，接下来在这个页面下载客户端。

更新证书(手动)：
```
# certbot renew 过程中， 用到 80/443 端口。 需要开放 80/443. 

certbot renew --cert-name $YOUR_DOMAIN 

cat /etc/letsencrypt/live/DONAIN/fullchain.pem > /opt/tuic/fullchain.pem
cat /etc/letsencrypt/live/DONAIN/privkey.pem > /opt/tuic/privkey.pem

systemctl restart tuic.service
```
接下配置客户端。

---
## 二、客户端，PC端：

下载页面：
https://github.com/EAimTY/tuic/releases

```
wget https://github.com/EAimTY/tuic/releases/download/0.8.5/tuic-client-0.8.5-x86_64-linux-gnu

wget https://github.com/EAimTY/tuic/releases/download/0.8.5/tuic-client-0.8.5-x86_64-macos
```

新建客户端的config.json配置文件，在文件内写入如下配置：
```
{
    "relay": {
        "server": "DOMAIN.com",
        "port": 443,
        "token": "PASSWD",
        "udp_relay_mode": "quic",
        "congestion_controller": "bbr",
        "alpn": ["h3"],
        "disable_sni": false,
        "reduce_rtt": true
    },
    "local": {
        "port": 1080,
        "ip": "127.0.0.1"
    },
    "log_level": "info"
}
```

打开PC终端，运行tuic客户端：
```
./tuic-client-0.8.5-x86_64-linux-gnu -c config.json

./tuic-client-0.8.5-x86_64-macos -c config.json
```

设置PC的Socks5代理，则可。

### Stash

Stash 是一款iOS/macOS平台基于规则的多协议代理客户端

https://stash.wiki/

[深入理解Clash配置文件](https://v2xtls.org/%E6%B7%B1%E5%85%A5%E7%90%86%E8%A7%A3clash%E9%85%8D%E7%BD%AE%E6%96%87%E4%BB%B6/)





