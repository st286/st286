

## Ubuntu16.04 使用小米WiFi 变无线网卡

>sudo add-apt-repository ppa:thopiekar/mt7601
sudo apt-get update
sudo apt-get install mt7601-sta-dkms

---

## 0x4C4A/install_mt7601.sh

```shell
#!/bin/sh
sudo add-apt-repository ppa:thopiekar/mt7601
sudo apt-get update
sudo apt-get install build-essential # Without build-essential failed to compile on fresh Linux Mint installation
sudo apt-get install mt7601-sta-dkms
```

---

## Problem with WiFi (MT7601U) NanoPiNeo ( ARMBIAN 5.38 3.4.113-sun8i)

ARMBIAN 5.38 stable Ubuntu 16.04.3 LTS 3.4.113-sun8i
Shows:
Bus 004 Device 002: ID 148f:7601 Ralink Technology, Corp. MT7601U Wireless Adapter
But ifconfig -a show only eth0 adapter. No ra0 link :(

I've tried
```shell
sudo apt-add-repository ppa:thopiekar/mt7601
sudo apt-get update
sudo apt-get install mt7601-sta-dkms
```

But still no results.



On a NanoPi Neo2 I got the mainline kernel
ARMBIAN 5.38.180128 nightly Debian GNU/Linux 9 (stretch) 4.14.15-sunxi64

and there the mt7601 is available without a special repository:


```shell
root@nanopineo2:~# find / -name mt7601*
/lib/modules/4.14.15-sunxi64/kernel/drivers/net/wireless/mediatek/mt7601u
/lib/modules/4.14.15-sunxi64/kernel/drivers/net/wireless/mediatek/mt7601u/mt7601u.ko
/lib/firmware/mt7601u.bin
/lib/firmware/mt7601.bin
```

Did you try to
```shell
modprobe mt7601
```

and then

```shell
ifconfig wlan0 up
```

or create a WiFi connection inside of nmtui?


I've installed system with 4x kernel and now it works.

Thank you!
