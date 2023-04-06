## 4. Setup temp timer for shutdown

    systemd-run --on-calendar '18:0' /bin/sh -c "shutdown"

## 3. Setup Timer for Caddy

```
  sudo su 
  1. add hyh-caddy.timer on /usr/lib/systemd/system/
  2. add hyh-cadyy.service on /usr/lib/systemd/system/
  3. systemctl enable hyh-caddy.timer  # and start ...
  4. systemctl status hyh-cadyy.timer  # or hyh-caddy.service
```

```
##ubuntu@instance-20221005-2324:/usr/lib/systemd/system$ cat hyh-caddy.timer 
[Unit]
Description=caddy start after bootup

[Timer]
#OnCalendar=daily
#OnCalendar=23:00
#OnActiveSec=1min
OnBootSec=30s

[Install]
WantedBy=timers.target
```

```
##ubuntu@instance-20221005-2324:/usr/lib/systemd/system$ cat hyh-caddy.service 
[Unit]
Description=caddy start after bootup

[Service]
Type=forking
ExecStart=/root/caddy start

[Install]
WantedBy=multi-user.target
```

## 2. Setup Timer for shutdown

```
  1. add hyh-shutdown.timer on /usr/lib/systemd/system/
  2. add hyh-shutdown.service on /usr/lib/systemd/system/
  3. add sd.sh on /usr/lib/hyh/
  4. chmod +x sd.sh
  5. systemctl enable hyh-shutdown.timer  # and start ...
  6. systemctl status hyh-shutdown.timer  # or hyh-shutdown.service
```

```
┌──(root㉿kali)-[/usr/lib/hyh]
└─# cat sd.sh                       
#!/bin/sh
# shutdown

apt update && apt --fix-broken install && apt dist-upgrade -y && apt full-upgrade -y && apt autoremove

```

```
#┌──(root㉿kali)-[/usr/lib/systemd/system]
#└─# cat hyh-shutdown.timer     
[Unit]
Description=shutdown system

[Timer]
#OnCalendar=daily
#OnActiveSec=1min
#OnBootSec=30s
OnCalendar=23:00

[Install]
WantedBy=timers.target
```
   
```   
#┌──(root㉿kali)-[/usr/lib/systemd/system]
#└─# cat hyh-shutdown.service 
[Unit]
Description=shutdown system

[Service]
Type=simple
ExecStart=/usr/lib/hyh/sd.sh

[Install]
WantedBy=multi-user.target

```



## 1. Setup Timer for apt auto update on startup

```
  1. add hyh-apt-auto.timer on /usr/lib/systemd/system/
  2. add hyh-apt-auto.service on /usr/lib/systemd/system/
  3. add hyh-apt-auto.sh on /usr/lib/hyh/
  4. chmod +x hyh-apt-auto.sh
  5. systemctl enable hyh-apt-auto.timer  # and start ...
  6. systemctl status hyh-apt-auto.timer  # or hyh-apt-auto.service
```
#### The three files :
```
──(root㉿kali)-[/usr/lib/systemd/system]
└─# cat hyh-apt-auto.timer 

[Unit]
Description=apt auto

[Timer]
#OnCalendar=daily
#OnActiveSec=10s
OnCalendar=*-*-* 00:15:30

[Install]
#WantedBy=multi-user.target
WantedBy=timers.target
```

```                                                                                                                                                   
┌──(root㉿kali)-[/usr/lib/systemd/system]
└─# cat hyh-apt-auto.service 

[Unit]
Description=apt update

[Service]
Type=oneshot
ExecStart=/usr/lib/hyh/hyh-apt-auto.sh

[Install]
WantedBy=multi-user.target
```

```
┌──(root㉿kali)-[/usr/lib/hyh]
└─# cat hyh-apt-auto.sh     
#!/bin/sh
#
#apt update
#
apt update && apt --fix-broken install && apt dist-upgrade -y && apt full-upgrade -y && apt autoremove
```
