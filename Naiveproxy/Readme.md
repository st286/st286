# NaiveProxy

NaïveProxy是一个基于谷歌浏览器的网络组建，进行数据包转发的套件，具体的用途，你们懂的呦，它最大的优势是TLS的流量指纹，是谷歌浏览器Chrome的，那个叫啥“泯然众人”，是的，流量就是特征就跟普通浏览器的一模一样了。

naive的原理和trojan很像，消除了服务器tls指纹和隐藏了所有翻墙服务以及伪装成正常网站，naive协议更上一层，消除了客户端的tls指纹和tls-in-tls特征，并且naive协议基于http2，自带多路复用，对比ws需要频繁握手来讲延迟更低，前面也说过naive客户端使用chrome浏览器内核作为网络协议栈，从防火墙的角度来看，就像是你在正常的使用正常的谷歌浏览器访问正常的网站.

## Architecture

[Browser → Naïve client] ⟶ Censor ⟶ [Frontend → Naïve server] ⟶ Internet

NaïveProxy uses Chromium's network stack to parrot traffic between regular Chrome browsers and standard frontend servers.

The frontend server can be any well-known reverse proxy that is able to route HTTP/2 traffic based on HTTP authorization headers, preventing active probing of proxy existence. Known ones include Caddy with its forwardproxy plugin and HAProxy.

The Naïve server here works as a forward proxy and a packet length padding layer. Caddy forwardproxy is also a forward proxy but it lacks a padding layer. A fork adds the NaïveProxy padding layer to forwardproxy, combining both in one.

## Naive server 配置




---
## Reference:

### [NaïveProxy and Cronet ](https://github.com/klzgrad/naiveproxy)

### [naive节点搭建(tls指纹问题)](https://bulianglin.com/archives/naive.html)

### [naive节点新手搭建教程video](https://www.youtube.com/watch?v=F2VsjS6fybs)

### [NaïveProxy 搭建部署安装教程 2022-4-8](https://dasmz.com/?p=1908)
