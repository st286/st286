# [Snell.sh](https://github.com/primovist/snell.sh)

Debian & Ubuntu 用户请运行
```
wget --no-check-certificate -O snell.sh https://raw.githubusercontent.com/primovist/snell.sh/master/snell.sh
chmod +x snell.sh
./snell.sh
```
安装默认端口号13254，如需修改请 在所有脚本运行结束后运行
```
nano /etc/snell/snell-server.conf
systemctl restart snell
```

查看运行状态：
```
systemctl status snell
```
卸载方法：
```
wget --no-check-certificate -O uninstall-snell.sh https://raw.githubusercontent.com/primovist/snell.sh/master/uninstall-snell.sh
chmod +x uninstall-snell.sh
./uninstall-snell.sh
```

---
# [snell](https://github.com/surge-networks/snell)

An encrypted proxy service program

### Highlights

Extreme performance.

Snell v2 supports reusing TCP connections to improve performance and reduce latency.

Single binary with zero dependency. (except glibc)

A wizard to help you start.

Traffic obfuscating is embedded. (HTTP & TLS)

Proxy server will report remote errors to client if encounters. Clients may choose countermeasures for different scenarios.

The server-side program is able to auto-negotiate cipher and version with clients.

Protocol is ready for multiple users ACL. (No implementation yet)

### Quickstart

Download the binary from the Release page.

Decompress and execute the binary. A wizard will guide you to generate a new config.

Re-execute the binary to start service.

Add a proxy line in Surge (The latest beta version is required)

Proxy = snell, [SERVER ADDRESS], [GENERATED PORT], psk=[GENERATED PSK], obfs=http

### Use systemd for autostart (Optional)

Download systemd-example and save as /lib/systemd/system/snell.service

Reload systemd daemon: sudo systemctl daemon-reload

Move snell-server to /usr/local/bin/snell-server

Move snell-server.conf to /etc/snell-server.conf

Enable service autostart: sudo systemctl enable snell.service

Start snell service: sudo systemctl start snell.service

Verify service start successfully: sudo systemctl status snell.service


