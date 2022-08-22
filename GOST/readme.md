# GOST

GO Simple Tunnel. GO语言实现的安全隧道


[项目地址](https://github.com/ginuerzh/gost)

[Wiki站点](https://docs.ginuerzh.xyz/gost/)

---
[搭建基于Gost的HTTPS代理 ](https://1kb.day/posts/gost_https_proxy.html)

注册system服务

vi /etc/systemd/system/gost.service 填入下面内容：

```
[Unit]
Description=gost
[Service]
ExecStart=/usr/bin/gost -L=https://uname:password@:443?cert=/etc/letsencrypt/live/xxxx.com/fullchain.pem&key=/etc/letsencrypt/live/xxxx.com/privkey.pem

#下面是probe_resistance防嗅探，通过代理访问 http://login.localhost 唯一地址触发407验证，而避免其它代理页返回407验证而暴露了自己是一个转发代理。
#此功能默认关闭，把上面一行#号注释掉，再把下面一行前面#号去掉即可开启，注意证书路径。
#ExecStart=/usr/bin/gost -L=https://uname:password@:443?probe_resist=code:400&knock=login.localhost&cert=/etc/letsencrypt/live/xxxx.com/fullchain.pem&key=/etc/letsencrypt/live/xxxx.com/privkey.pem

Restart=always
User=root
[Install]
WantedBy=multi-user.target
```

重载system服务 systemctl daemon-reload

下面就可以启动gost了：

```
systemctl start gost #启动gost

systemctl restart gost #重启gost

systemctl enable gost #开机自启

systemctl status gost #查看状态
```

