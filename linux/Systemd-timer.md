### setup Timer for apt auto update on startup

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

                                                                                                                                                       
┌──(root㉿kali)-[/usr/lib/systemd/system]
└─# cat hyh-apt-auto.service 

[Unit]
Description=apt update

[Service]
Type=oneshot
ExecStart=/usr/lib/hyh/hyh-apt-auto.sh

[Install]
WantedBy=multi-user.target


┌──(root㉿kali)-[/usr/lib/hyh]
└─# cat hyh-apt-auto.sh     
#!/bin/sh
#
#apt update
#
apt update && apt --fix-broken install && apt dist-upgrade -y && apt full-upgrade -y && apt autoremove
```
