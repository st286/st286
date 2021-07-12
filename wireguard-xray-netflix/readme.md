
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

## Netflix 解锁检测脚本

运行以下代码，即可查询自己的 VPS 是否支持奈飞全解锁或是半解锁！

```
wget -O nf https://github.com/sjlleo/netflix-verify/releases/download/2.01/nf_2.01_linux_amd64 && chmod +x nf && clear && ./nf
```

## 安装 WireGuard
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





