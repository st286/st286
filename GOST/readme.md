# GOST

GO Simple Tunnel. GO语言实现的安全隧道


[项目地址](https://github.com/ginuerzh/gost)

[wiki](https://gost.run)

[Wiki: GOST v2 ](https://docs.ginuerzh.xyz/gost/)

[wiki: GOST v3. GOST v3尚未正式发布，文档正在完善中](https://latest.gost.run)
 
---

### Relay协议

Relay协议是GOST特有的一个协议，同时具有代理和转发功能，可同时处理TCP和UDP的数据，并支持用户认证。

**Note**

Relay协议本身不具备加密功能，如果需要对数据进行加密传输，可以配合具有加密功能的数据通道(例如tls，wss，quic等)使用。

**代理**

Relay协议可以像HTTP/SOCKS5一样用作代理协议。

**服务端**

    gost -L relay+tls://username:password@:12345

**客户端**

    gost -L :8080 -F relay+tls://username:password@:12345?nodelay=false
     
**延迟发送**

默认情况下relay协议会等待请求数据，当收到请求数据后会把协议头部信息与请求数据一起发给服务端。当此nodelay参数设为true后，协议头部信息会立即发给服务端，不再等待客户端的请求。

也可以配合端口转发支持同时转发TCP和UDP数据



---
### 加密机制

**HTTP**

对于HTTP可以使用TLS加密整个通讯过程，即HTTPS代理：

服务端:

    gost -L=https://:443

客户端:

    gost -L=:8080 -F=http+tls://server_ip:443


**SOCKS5**

gost支持标准SOCKS5协议的no-auth(0x00)和user/pass(0x02)方法，并在此基础上扩展了两个：tls(0x80)和tls-auth(0x82)，用于数据加密。

服务端:

    gost -L=socks5://:1080

客户端:

    gost -L=:8080 -F=socks5://server_ip:1080

如果两端都是gost(如上)则数据传输会被加密(协商使用tls或tls-auth方法)，否则使用标准SOCKS5进行通讯(no-auth或user/pass方法)。



**SOCKS5 Over TLS**

    gost -L socks5+tls://:1080

    gost -L=sock5+tls://user:passwd@:1080


楼主可能不知道，gost提供的socks5配合自己tls隧道，效果比trojan ray更好


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

---
## gost-server-client socks5 only
```
nohup gost -L=socks5://usr:passwd0@:port > /dev/null 2>&1 &

gost -L=:1080 -F=socks5://usr:passwd0@host:port
```
