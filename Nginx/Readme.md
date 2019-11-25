# Nginx 教程

[Official Site](http://nginx.org/)

[Nginx Documentation](http://nginx.org/en/docs/)

## 安装 Nginx - Installing Nginx

nginx can be installed differently, depending on the operating system. 

### Installation on Linux

Debian 10

 To install nginx, run the following commands:

    sudo apt update
    sudo apt install nginx


### Building from Sources

[Building nginx from Sources](http://nginx.org/en/docs/configure.html)


## 指南 Beginner’s Guide

[Beginner’s Guide](http://nginx.org/en/docs/beginners_guide.html)

 nginx has one master process and several worker processes. The main purpose of the master process is to read and evaluate configuration, and maintain worker processes. Worker processes do actual processing of requests. nginx employs event-based model and OS-dependent mechanisms to efficiently distribute requests among worker processes. The number of worker processes is defined in the configuration file and may be fixed for a given configuration or automatically adjusted to the number of available CPU cores.

The way nginx and its modules work is determined in the configuration file. By default, the configuration file is named nginx.conf and placed in the directory /usr/local/nginx/conf, /etc/nginx, or /usr/local/etc/nginx. 

On debian 10 installaton by `apt install nginx`, the configuration file is `/etc/nginx/nginx.conf, /etc/nginx/sites-available/default`, the home page is `/var/www/html/index.nginx-debian.html`. 

### Starting, Stopping, and Reloading Configuration

 To start nginx, run the executable file. Once nginx is started, it can be controlled by invoking the executable with the -s parameter. Use the following syntax:

    nginx -s signal

Where signal may be one of the following:

    stop — fast shutdown
    quit — graceful shutdown
    reload — reloading the configuration file
    reopen — reopening the log files

For example, to stop nginx processes with waiting for the worker processes to finish serving current requests, the following command can be executed:

    nginx -s quit

#### Serving Static Content

the configuration file `default`:

```shell
server {
        listen 80 default_server;
        listen [::]:80 default_server;

        # SSL configuration
        #
        # listen 443 ssl default_server;
        # listen [::]:443 ssl default_server;

        root /var/www/html;

        # Add index.php to the list if you are using PHP
        index index.html index.htm index.nginx-debian.html;

        server_name _;
        ...
```


