# How to configure proxy server in linux

posted on april 4, 2017 by barkeep
https://www.lostsaloon.com/technology/how-to-configure-proxy-server-in-linux/

**Proxy server** is an interface that allows you to connect or use a service (usually a remote resource) that is usually resource intensive. It is also used by large area network to manage network traffic and as a security measure within the network.

When configuring a linux system for networking, you will also need to configure your proxy server, ie. if you use a proxy server in order to have a working network (or internet) connection. Most desktop environments such as KDE or Gnome provide you with an user interface that allow you to easily configure your proxy server.

Although that will work in most cases with application that need an internet connection, it is not always guaranteed that you will have a desktop environment. You might also need to some command line utilities that require internet connection such as **wget, curl or links.**

In Linux, you can configure or set environment variables, such as that all of the applications and utilities can read and use it. There are several different variables that you can set, to use the appropriate server for each protocol: **http_proxy, https_proxy, ftp_proxy, socks_proxy, rsync_proxy, all_proxy and no_proxy.**

Many times these variable names are specified in all caps, you can use either and most systems should pick up either of them.

Depending on your distro and application, some of the above mentioned variables may not be used. The variables follows the general pattern of **‘protocol_proxy‘**…

  - **http_proxy:** This variable value is used for all http traffic. The value of the variable is usually in the format http://<username>:<password>@<server>:<port>. An example would be http://tom:secret@10.23.42.11:8080/. You can safely omit the password or username, in which case the applications will prompt you at the time of use.
  - **https_proxy:** This is for https or ssl traffic. The format is just the same as the http_proxy.
  - **ftp_proxy:** This variable value is used for ftp protocol and traffic. Again the variable value follows the same pattern as the http_proxy above.
  - **socks_proxy:** This is used for TCP and UDP traffic in most cases. The value of this is usually in the format socks://address:port.
  - **rsync_proxy:** This is used for rsync traffic, especially in distributions such as Gentoo and Arch.
  - **all_proxy:** The useful variable that can be used to set a single proxy for all protocols. It may not be supported by all applications. Again in the same format as before.
  - **no_proxy:** A comma separated list of domains that should bypass the proxy. The localhost is a good example of this. An example for this would be localhost, 127.0.0.1.

  These variables are set (and unset) just as any other environment variables in the system. Again, this can be set for every session, each user or set system wide (globally). The general usage would look something like this:
```shell
  export socks_proxy="http://proxy.us.server.com:1080"
  export http_proxy="http://proxy.us.server.com:80"
  export https_proxy="http://proxy.us.server.com:80"
  export ftp_proxy="http://proxy.us.server.com:80"
  export no_proxy="localhost,127.0.0.1,localaddress"
```
You can set this in the .bashrc or .bash_profile file in the home directory for the user. In order to set this system wide you can modify the /etc/profile file, include these in there. In a Gentoo environment, you can set global environment values in a file inside the /etc/env.d/ folder. There are several different profile files in the /etc/ folder, such profile, profile.csh, profile.env etc etc. Also, there are configuration files inside the /etc/profile.d/ folder, all of which can be used.

If you use Ubuntu or an Ubuntu based distro, then the global variables are set in the /etc/environment file. You can also look inside the /etc/profile.d/ folder, which can several files including .sh file that are executed. The same format is used in other distros as well such CentOS. In Suse based systems, also look for a file called /etc/profile.local.

---

Sample:
--

wget下载http/https代理设置
--
如果你的Linux机器是在内网的，需要下载一个文件，在没办法直接访问外网的情况下就需要使用代理了。如果你需要搭建HTTP代理服务器，那么参考Squid搭建正向代理。

使用wget命令可以设置http代理

> wget http://www.baidu.com/ -e use_proxy=yes -e http_proxy=yourproxy.com:port

下载https的文件就要其他的额外参数了

> wget --no-check-certificate https://www.google.com/   \
  -e use_proxy=yes -e https_proxy=yourproxy.com:port   ##使用https_proxy才可以哟

参数--no-check-certificate可以不检查服务器的证书。

如果你觉得麻烦，可以对shell进行http proxy的代理设置：

> export http_porxy=yourproxy.com:port
  export https_proxy=yourproxy.com:port

这样其他的程序就可以通过这个代理进行网络访问了。

如果wget不需要代理可以使用参数--no-proxy取消代理。
