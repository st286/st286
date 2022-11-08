
# [TUIC](https://github.com/EAimTY/tuic)

[基于 QUIC 的代理软件：TUIC](https://www.eaimty.com/2022/03/tuic.html)

[配置TUIC代理+V2Ray分流](https://lala.im/8424.html)

# 配置TUIC代理

tuic是一个基于quic协议的高性能代理，更多介绍：https://github.com/EAimTY/tuic

## 安装服务端：
```
apt -y update

apt -y install wget certbot

mkdir /opt/tuic && cd /opt/tuic

wget https://github.com/EAimTY/tuic/releases/download/0.8.1/tuic-server-0.8.1-x86_64-linux-gnu

chmod +x tuic-server-0.8.1-x86_64-linux-gnu
```

 新建tuic配置文件：

`vim config.json`

写入如下配置：
```
{
    "port": 443,
    "token": ["YOURPASSWD"],
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
ExecStart=/opt/tuic/tuic-server-0.8.1-x86_64-linux-gnu -c config.json
Restart=on-failure
RestartPreventExitStatus=1
RestartSec=5

[Install]
WantedBy=multi-user.target
```

申请证书：
```
certbot certonly --standalone --agree-tos --no-eff-email --email YOUR@EMAIL.com -d YOUR.DONAIN.com
```

将证书保存到tuic配置文件内配置的位置：

```
cat /etc/letsencrypt/live/YOUR.DONAIN.com/fullchain.pem > /opt/tuic/fullchain.pem
cat /etc/letsencrypt/live/YOUR.DONAIN.com/privkey.pem > /opt/tuic/privkey.pem
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
cat /etc/letsencrypt/live/YOUR.DONAIN.com/fullchain.pem > /opt/tuic/fullchain.pem
cat /etc/letsencrypt/live/YOUR.DONAIN.com/privkey.pem > /opt/tuic/privkey.pem
systemctl restart tuic.service
```

给脚本执行权限：
```
chmod +x tuic.sh
```

测试续期的情况以及脚本能否正常运行：
```
certbot renew --cert-name tuic.example.com --dry-run
```

服务端到这里就全部配置完成了，接下来在这个页面下载客户端：
