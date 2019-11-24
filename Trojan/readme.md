# Trojan
-----

An unidentifiable mechanism that helps you bypass GFW. 
Trojan features multiple protocols over TLS to avoid both active/passive detections and ISP QoS limitations.

[Trojan Github ](https://trojan-gfw.github.io/trojan/)

## Documentations

An online documentation can be found [here](https://trojan-gfw.github.io/trojan/).

Installation guide on various platforms can be found in the [wiki](https://github.com/trojan-gfw/trojan/wiki/Binary-&-Package-Distributions).

----

## 教程 --Trojan

**下面教程主要参考：**

[Trojan 的安装与配置](https://www.oixxu.com/anti-gfw-tool-trojan-install-configuration/)

[自建-Trojan](https://trojan-tutor.github.io/2019/04/10/p41.html)

[Trojan搭建教程适用于Debian9](https://vave.men/trojan.html)

### Installation

**Quickstart Script**

```shell
sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/trojan-gfw/trojan-quickstart/master/trojan-quickstart.sh)"
# or 
sudo bash -c "$(wget -O- https://raw.githubusercontent.com/trojan-gfw/trojan-quickstart/master/trojan-quickstart.sh)"
```

安装后，配置文件和service文件在：

    /usr/local/etc/trojan/config.json

    /etc/systemd/system/trojan.service
    
### 创建 CA 证书

先安装所需的工具：

```shell
apt install gnutls-bin gnutls-doc 
```

创建 CA 模板 ca.tmpl，内容为（cn 与 organization 可以随便写，但是为了避免可能发生的问题，服务器证书的 cn 填 VPS 的 IP 或域名）：

```shell
cn = "ff"
organization = "ff"
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

```shell
certtool --generate-self-signed --load-privkey ca-key.pem --template ca.tmpl --outfile ca-cert.pem
```

创建服务器证书模板 ：

创建文件 server.tmpl，内容为：

```shell
cn = "xxx.xxx.xxx.xxx"
organization = "ff"
expiration_days = 3650
signing_key
encryption_key
tls_www_server
```

生成服务器证书密钥：

```shell
certtool --generate-privkey --outfile server-key.pem
```

生成服务器证书：

```shell
certtool --generate-certificate --load-privkey server-key.pem --load-ca-certificate ca-cert.pem --load-ca-privkey ca-key.pem --template server.tmpl --outfile server-cert.pem
```

