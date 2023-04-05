## 2. Setup Timer for shutdown

```
┌──(root㉿kali)-[/usr/lib/systemd/system]
└─# cat hyh-shutdown.timer     
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
┌──(root㉿kali)-[/usr/lib/systemd/system]
└─# cat hyh-shutdown.service 
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
OnActiveSec=10s

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
