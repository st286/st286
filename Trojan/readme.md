# Trojan

An unidentifiable mechanism that helps you bypass GFW. 
Trojan features multiple protocols over TLS to avoid both active/passive detections and ISP QoS limitations.

[Trojan Github ](https://trojan-gfw.github.io/trojan/)

[Trojan released 发布版本](https://github.com/trojan-gfw/trojan/releases/)

## Documentations

An online documentation can be found [here](https://trojan-gfw.github.io/trojan/).

Installation guide on various platforms can be found in the [wiki](https://github.com/trojan-gfw/trojan/wiki/Binary-&-Package-Distributions).

----

## 教程 --Trojan

### 1.安装

**Quickstart Script**

`sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/trojan-gfw/trojan-quickstart/master/trojan-quickstart.sh)"`

 or 

`sudo bash -c "$(wget -O- https://raw.githubusercontent.com/trojan-gfw/trojan-quickstart/master/trojan-quickstart.sh)"`

**OR on Debian 10**

`apt install trojan`

用法：
```shell
usage: ./trojan [-htv] [-l LOG] [-k KEYLOG] [[-c] CONFIG]
options:
  -c [ --config ] CONFIG specify config file
  -h [ --help ]          print help message
  -k [ --keylog ] KEYLOG specify keylog file location (OpenSSL >= 1.1.1)
  -l [ --log ] LOG       specify log file location
  -t [ --test ]          test config file
  -v [ --version ]       print version and build info
```

安装后，配置文件和service文件在：

    /usr/local/etc/trojan/config.json
    /etc/systemd/system/trojan.service
    
    # on debian 10 install by apt:
    /etc/trojan/config.json
    
### 2.创建 CA 证书

**注意!!!生成证书、密钥文件后，要修改权限为 600 即：**

```shell
# 进入所在目录
chmod 600 *
# 如下
-rw------- 1 root root 1484 Nov 24 03:01 ca-cert.pem
-rw------- 1 root root 8167 Nov 24 02:58 ca-key.pem
-rw------- 1 root root  132 Nov 24 02:54 ca.tmpl
-rw------- 1 root root 1273 Nov 24 03:30 config.json
-rw------- 1 root root 1586 Nov 24 03:02 server-cert.pem
-rw------- 1 root root 8177 Nov 24 03:02 server-key.pem
-rw------- 1 root root  121 Nov 24 02:56 server.tmpl
```

**先安装所需的工具：**

`apt install gnutls-bin gnutls-doc`


创建 CA 模板 ca.tmpl，内容为（cn 与 organization 可以随便写，但是为了避免可能发生的问题，服务器证书的 cn 填 VPS 的 IP 或域名）：

```shell
cn = "ff" (这里，修改)
organization = "ff" (这里，修改)
serial = 1
expiration_days = 3650
ca
signing_key
cert_signing_key
crl_signing_key
```

生成 CA 密钥：

`certtool --generate-privkey --outfile ca-key.pem`

生成 CA 证书：

`certtool --generate-self-signed --load-privkey ca-key.pem --template ca.tmpl --outfile ca-cert.pem`

创建服务器证书模板 ：

创建文件 server.tmpl，内容为：

```shell
cn = "xxx.xxx.xxx.xxx" (这里，修改)
organization = "ff" (这里，修改)
expiration_days = 3650
signing_key
encryption_key
tls_www_server
```

生成服务器证书密钥：

`certtool --generate-privkey --outfile server-key.pem`

生成服务器证书：

`certtool --generate-certificate --load-privkey server-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template server.tmpl --outfile server-cert.pem`


### 3.配置文件

#### 服务端配置文件

**注意!!! 配置文件中的证书、密钥文件，其路径要用绝对地址**

`nano /usr/local/etc/trojan/config.json`

```shell
 ......
 ......
     "password": [
        "Password1", (这里，修改为自己的密码)
        "Password2"。(这里，修改为自己的密码)
    ],
    "log_level": 1,
"ssl": {
        "cert": "/.../server-cert.pem", （这里，修改为自己的证书；注意：文件路径用绝对地址）
        "key": "/.../server-key.pem",   （这里，修改为自己的密钥；注意：文件路径用绝对地址）
        "key_password": "",
        "cipher": "ECDHE-ECDSA-CHACHA20-
        ......
        ......
```

#### 客户端配置文件

客户端配置文件里的config.json

```shell
{
    "run_type": "client",
    "local_addr": "127.0.0.1",
    "local_port": 1080,
    "remote_addr": "你的 VPS 的 IP",(这里，修改)
    "remote_port": 443,
    "password": ["Password1"],(这里，修改为自己的密码)
    "append_payload": true,
    "log_level": 1,
    "ssl": {
        "verify": true,
        "verify_hostname": true,
        "cert": "ca-cert.pem",  （这里，修改为自己的证书)
        "cipher": "ECDHE-ECDSA-AES128-GCM-SHA256:......",
        "sni": "",
        "alpn": [
        ......
        ......
```
        
### 4.运行Trojan

**试运行，运行成功后，Ctrl+C关闭**

`./trojan -c /usr/local/etc/trojan/config.json`

**把命令运行为server.(下面的trojan.service,安装trojan时，可能已存在。如存在，应该不用修改)**

因为命令`./trojan -c /usr/local/etc/trojan/config.json`是运行在前台的，我们需要利用systemd来把该命令运行为service，运行以下命令进行修改。

`nano /etc/systemd/system/trojan.service`

填写以下内容：
```shell
[Unit]
After=network.target 
 
[Service]
ExecStart=/usr/bin/trojan -c /etc/trojan/config.json (这里，修改为自己的；注意：路径用绝对地址)
Restart=always
 
[Install]
WantedBy=multi-user.target
```

OR 

```shell
[Unit]
Description=trojan
Documentation=https://trojan-gfw.github.io/trojan/config https://trojan-gfw.github.io/trojan/
After=network.target network-online.target nss-lookup.target mysql.service mariadb.service mysqld.service

[Service]
Type=simple
StandardError=journal
ExecStart="/usr/local/bin/trojan" "/usr/local/etc/trojan/config.json"  (这里，修改为自己的；注意：路径用绝对地址)
ExecReload=/bin/kill -HUP $MAINPID

[Install]
WantedBy=multi-user.target
```


**运行启动Trojan**

`systemctl start trojan`

设置开机启动

`systemctl enable trojan`

查看运行状态

`systemctl status trojan`


**上面教程主要参考：**

[Trojan 的安装与配置](https://www.oixxu.com/anti-gfw-tool-trojan-install-configuration/)

[自建-Trojan](https://trojan-tutor.github.io/2019/04/10/p41.html)

[Trojan搭建教程适用于Debian9](https://vave.men/trojan.html)


**Here, we will present a list of things you should do before you start a trojan server:**

  1. setup an HTTP server and make it useful in some sense (to deceive GFW).
  2. register a domain name for your server.
  3. Apply for or self-sign (NOT RECOMMENDED) an SSL certificate.
  4. Correctly write the config file.

---

## 安装Nginx

**Why does install nginx**

For Setup an HTTP server and make it useful in some sense (to deceive GFW).

## Client客户端使用

[根据自己系统下载Trojan版本](https://github.com/trojan-gfw/trojan/releases/)

根据 里面的根据exmaple设置。

## Mobile Platforms

### IOS

`Pharos Pro` and `Shadowrocket` have implemented trojan protocol.





