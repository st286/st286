
本文：使用 Cloudflare WARP 给 VPS 解锁服务器所在地的流媒体，比如Netflix。

**原理**

WARP 是 Cloud­flare 提供的一项基于 Wire­Guard 的网络流量安全及加速服务，能够让你通过连接到 Cloud­flare 的边缘节点实现隐私保护及链路优化。其连接入口为双栈 (IPv4/​IPv6)，因此单栈服务器可以连接到 WARP 来获取额外的网络连通性支持。
比如可以让仅具有 IPv6 的服务器直接访问 IPv4 网络，不再局限于 DNS64 的束缚，能自定义任意 DNS 解析服务器，对于科学上网会有很大的帮助；也能让仅具有 IPv4 的服务器获得 IPv6 网络的访问能力，可以作为 IPv6 Only VPS 的 SSH 跳板。

**翻译成人话**

让你的vps通过这种方式有了ipv6，从而解锁服务器所在地的流媒体，比如Netflix。

[免费解锁奈飞 (Netflix)！WARP 进行奈飞 (Netflix)非自制剧全解锁！](https://www.v2rayssr.com/warp-netflix.html)

[使用 Cloudflare WARP 给 VPS 服务器免费添加IPv6 网络](https://ybfl.xyz/111.html)

**以下用 ubuntu 21**

----

# Netflix 解锁检测脚本

运行以下代码，即可查询自己的 VPS 是否支持奈飞全解锁或是半解锁！

```
wget -O nf https://github.com/sjlleo/netflix-verify/releases/download/2.01/nf_2.01_linux_amd64 && chmod +x nf && clear && ./nf
```

# 安装 WireGuard
```
apt install net-tools iproute2 openresolv dnsutils -y
apt install wireguard-tools --no-install-recommends
```
先执行 uname -r 命令查看内核版本。如果是 5.6 以上内核则已经集成了 Wire­Guard ，就不需要安装了。ubuntu 21 内核为5.11，不用安装。

### 生成 WireGuard 配置文件

wgcf 是 Cloud­flare WARP 的非官方 CLI 工具，它可以模拟 WARP 客户端注册账号，并生成通用的 Wire­Guard 配置文件。

```
curl -fsSL git.io/wgcf.sh | bash    #  安装 wgcf
wgcf register                       #  注册 WARP 账户 (生成 /root/wgcf-account.toml 文件保存账户信息)
wgcf generate                       #  生成 /root/wgcf-profile.conf 配置文件
```

### 编辑 WireGuard 配置文件

编辑 /root/wgcf-profile.conf 文件，其中可以在服务器端解析 engage.cloudflareclient.com 的 ip

```
nslookup engage.cloudflareclient.com
```
解析的结果为 162.159.192.1

将配置文件中的 engage.cloudflareclient.com 替换为 162.159.192.1 ，并删除 AllowedIPs = 0.0.0.0/0 。

即配置文件中 [Peer] 部分为：
```
[Peer]
PublicKey = bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=
AllowedIPs = ::/0
Endpoint = 162.159.192.1:2408
```
**额外操作**

每个人的vps配置文件中默认的 DNS 都不一样， 1.1.1.1。由于它将替换掉系统中的 DNS 设置 (/etc/resolv.conf)，同时为了防止单 DNS 服务器故障导致无法解析，建议使用不同组织提供的公共 DNS 服务器组合。以下配置供参考，请根据实际情况来填写。

        DNS = 9.9.9.10,8.8.8.8,1.1.1.1，8.8.4.4

### 测试 WireGuard 网络接口

将 Wire­Guard 配置文件复制到 /etc/wireguard/ 并命名为 wgcf.conf。

    cp wgcf-profile.conf /etc/wireguard/wgcf.conf
    
开启网络接口（命令中的 wgcf 对应的是配置文件 wgcf.conf 的文件名前缀）。

    wg-quick up wgcf

执行以下命令检查是否连通。同时也能看到正在使用的是 Cloud­flare 的网络。

    curl -6 ip.p3terx.com
    
测试完成后关闭相关接口，因为这样配置只是临时性的

    wg-quick down wgcf

启用 Wire­Guard 网络接口
```
systemctl start wg-quick@wgcf   # 启用守护进程
systemctl enable wg-quick@wgcf  # 设置开机启动
```

------

# Xray安装


## Xray --- Project X

Project X originates from XTLS protocol, provides a set of network tools such as Xray-core and Xray-flutter.

Xray-core 是 v2ray-core 的超集，含更好的整体性能和 XTLS 等一系列增强，且完全兼容 v2ray-core 的功能及配置。

[Project X](https://xtls.github.io)

[Xray-core](https://github.com/XTLS/Xray-core)

[Xray-install-sh](https://github.com/XTLS/Xray-install)

[小小白白话文](https://xtls.github.io/documents/level-0/)

[HelloWorld--OpenWrt](https://github.com/jerrykuku/luci-app-vssr)

---

## 网站建设

```
apt update &&  apt install nginx

#修改 /var/www/html/index.nginx-debian.html 
#修改 nginx.conf 并重启 Nginx 服务

nano /etc/nginx/nginx.conf

# nginx 重新载入配置使其生效
systemctl reload nginx

# 此时如果你访问 http://xx.your.com，你看到页面则说明成功。
```
## 证书管理-申请tls证书

注意： 请不要轻易使用自签证书。它并没有让操作简单太多，但增加了无谓的风险（如中间人攻击）。
```
apt install socat
wget -O -  https://get.acme.sh | sh
. .bashrc
acme.sh --upgrade --auto-upgrade
```
maybe 

        acme.sh --register-account -m xxxx@icloud.com

测试证书申请:在正式申请证书之前，我们先用测试命令(--issue --test)来验证是否可以成功申请，这样可以避免在本地配置有误时，反复申请证书失败

        acme.sh --issue --test -d xx.your.com -w /var/www/html --keylength ec-256

如果这一步出错的话，你可以运行下面的命令，来查看详细的申请过程和具体的错误。

        acme.sh --issue --test -d xx.your.com -w /var/www/html --keylength ec-256 --debug

这一步确定成功之后，就可以申请正式的证书了。（测试证书不需要删除，它会自动被正式证书覆盖）

        acme.sh --issue -d xx.your.com -w /var/www/html --keylength ec-256 --force

说明： --force 参数的意思就是，在现有证书到期前，手动（强行）更新证书。上一步我们从“测试服”申请的证书虽然不能直接用，但是它本身是尚未过期的，所以需要用到这个参数。


## Xray server setup

### 安装Xray
```
wget https://github.com/XTLS/Xray-install/raw/main/install-release.sh
bash install-release.sh
rm install-release.sh
```

Filesystem Hierarchy Standard (FHS)

        installed: /etc/systemd/system/xray.service
        installed: /etc/systemd/system/xray@.service

        installed: /usr/local/bin/xray
        installed: /usr/local/etc/xray/*.json

        installed: /usr/local/share/xray/geoip.dat
        installed: /usr/local/share/xray/geosite.dat

        installed: /var/log/xray/access.log
        installed: /var/log/xray/error.log
        
        ##Notice: Xray will NOT log to /var/log/xray/*.log by default. Configure "log" to specify log files.

[Xray-install-sh Readme](https://github.com/XTLS/Xray-install)

### 给Xray配置TLS证书

        mkdir /home/xray_cert

使用acme.sh的--install-cert正确安装（拷贝）证书文件

        acme.sh --install-cert -d  xx.your.com --ecc --fullchain-file /home/xray_cert/xray.crt --key-file /home/xray_cert/xray.key

        chmod +r /home/xray_cert/xray.key

acme.sh 会每60天检查一次证书并自动更新临期证书。但据我所知是它并不会自动将新证书安装给 xray-core，所以我们需要新增一个系统的自动周期任务来完成这一步。

        nano /home/xray_cert/xray-cert-renew.sh

把下面的内容复制进去，记得替换你的真实域名，然后保存退出, 替换xx.your.com 

```
#!/bin/bash

/root/.acme.sh/acme.sh --install-cert -d xx.your.com --ecc --fullchain-file /home/xray_cert/xray.crt --key-file /home/xray_cert/xray.key
echo "Xray Certificates Renewed"

chmod +r /home/xray_cert/xray.key
echo "Read Permission Granted for Private Key"

sudo systemctl restart xray
echo "Xray Restarted"
```
给这个文件增加【可执行】权限

        chmod +x /home/xray_cert/xray-cert-renew.sh

运行 crontab -e，添加一个自动任务【每月自动运行一次xray-cert-renew.sh】
        
        crontab -e

把下面的内容增加在文件最后，保存退出即可。
```
# 1:00am, 1st day each month, run `xray-cert-renew.sh`
0 1 1 * *   bash /home/xray_cert/xray-cert-renew.sh
```

### 配置Xray

生成UUID

        xray uuid

配置 /usr/local/etc/xray/config.json

        wget https://raw.githubusercontent.com/st286/st286.github.io/master/Xray/xray-config.json

修改 xray-config.json， 将之前生成的UUID填入第61行 "id": "", 之中

        mv ./xray-config.json  /usr/local/etc/xray/config.json


### 启动Xray服务--systemd基本服务管理
```
systemctl enable xray
systemctl start xray
systemctl status xray

systemctl stop xray
systemctl restart xray
systemctl disable xray

systemctl daemon-reload
 
```









