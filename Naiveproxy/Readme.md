# NaiveProxy
---
NaïveProxy是一个基于谷歌浏览器的网络组建，进行数据包转发的套件，具体的用途，你们懂的呦，它最大的优势是TLS的流量指纹，是谷歌浏览器Chrome的，那个叫啥“泯然众人”，是的，流量就是特征就跟普通浏览器的一模一样了。

naive的原理和trojan很像，消除了服务器tls指纹和隐藏了所有翻墙服务以及伪装成正常网站，naive协议更上一层，消除了客户端的tls指纹和tls-in-tls特征，并且naive协议基于http2，自带多路复用，对比ws需要频繁握手来讲延迟更低，前面也说过naive客户端使用chrome浏览器内核作为网络协议栈，从防火墙的角度来看，就像是你在正常的使用正常的谷歌浏览器访问正常的网站.

## Architecture

[Browser → Naïve client] ⟶ Censor ⟶ [Frontend → Naïve server] ⟶ Internet

NaïveProxy uses Chromium's network stack to parrot traffic between regular Chrome browsers and standard frontend servers.

The frontend server can be any well-known reverse proxy that is able to route HTTP/2 traffic based on HTTP authorization headers, preventing active probing of proxy existence. Known ones include Caddy with its forwardproxy plugin and HAProxy.

The Naïve server here works as a forward proxy and a packet length padding layer. Caddy forwardproxy is also a forward proxy but it lacks a padding layer. A fork adds the NaïveProxy padding layer to forwardproxy, combining both in one.

## Naive server 配置

### [1.Golang install](https://go.dev/doc/install)Verify that you've installed Go by opening a command prompt and typing the following command:

```
wget https://go.dev/dl/go1.19.2.linux-amd64.tar.gz

rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.2.linux-amd64.tar.gz
```
Add /usr/local/go/bin to the PATH environment variable.

You can do this by adding the following line to your $HOME/.profile, .bashrc or /etc/profile (for a system-wide installation):
```
export PATH=$PATH:/usr/local/go/bin
```
Verify that you've installed Go by opening a command prompt and typing the following command:
```
 go version
```
Confirm that the command prints the installed version of Go.

### 2.编译安装caddy+naive

```
go install github.com/caddyserver/xcaddy/cmd/xcaddy@latest
~/go/bin/xcaddy build --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive

```
### 3.Caddyfile配置

Caddyfile 与 caddy 在同目录.
```
:443, naive.buliang0.tk #你的域名
tls example@example.com #你的邮箱
route {
 forward_proxy {
   basic_auth user pass #用户名和密码
   hide_ip
   hide_via
   probe_resistance
  }
 #支持多用户
 forward_proxy {
   basic_auth user2 pass2 #用户名和密码
   hide_ip
   hide_via
   probe_resistance
  }
 reverse_proxy  https://demo.cloudreve.org  { #伪装网址
   header_up  Host  {upstream_hostport}
   header_up  X-Forwarded-Host  {host}
  }
}

```
### 4.caddy常用指令
```
前台运行caddy：./caddy run
后台运行caddy：./caddy start
停止caddy：./caddy stop
重载配置：./caddy reload
```

## Naive 客户端 Client setup

Run ./naive with the following config.json to get a SOCKS5 proxy at local port 1080.

[Naiveproxy download](https://github.com/klzgrad/naiveproxy/releases)

```
{
  "listen": "socks://127.0.0.1:1080",
  "proxy": "https://user:pass@example.com"
}
```
Or quic://user:pass@example.com, if it works better. See also [parameter usage](https://github.com/klzgrad/naiveproxy/blob/master/USAGE.txt) and [performance tuning](https://github.com/klzgrad/naiveproxy/wiki/Performance-Tuning).





---
# Reference:
---
### [(源)NaïveProxy and Cronet ](https://github.com/klzgrad/naiveproxy)

### [naive节点搭建(tls指纹问题)](https://bulianglin.com/archives/naive.html)

### [naive节点新手搭建教程video](https://www.youtube.com/watch?v=F2VsjS6fybs)

### [NaïveProxy 搭建部署安装教程 2022-4-8](https://dasmz.com/?p=1908)