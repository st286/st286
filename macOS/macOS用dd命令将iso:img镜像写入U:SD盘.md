# macOS用dd命令将iso/img镜像写入U/SD盘

## Mac下将ISO/img写入u/sd盘可使用命令行工具dd，操作如下：

1. 找出U盘挂载的路径，使用如下命令：
  >      df -h

2. 将U盘unmount（将mpoit替换为挂载路径）：
>      diskutil unmount /Volumes/mpoit

3. 写入U盘：
>     sudo dd if=iso路径 of=/dev/rdisk[N] bs=1m  

sudo dd if=源路径 of=/dev/r卷标 bs=1m ［‘r’ 会让命令执行加快一点］ ［‘bs’为一次填充的容量］
rdisk 中加入r可以让写入速度加快

---
## Other
**将iso转换成dmg 转iso, UDRW 替换为 UDTO**
>      sudo hdiutil convert -format UDRW -o /linux.dmg kali.iso

**查看u盘盘符**
>      diskutil list

**查看磁盘进度，可以用iostat命令查看磁盘写入状态**
>      iostat -w 2

**操作完毕后将U盘弹出**
>      diskutil eject /dev/disk2

---

## How To Create Disk Image on Mac OS X With dd Command

**List disks and  Unmount the disk:**
>      diskutil list
>      diskutil unmountDisk /dev/disk2

**Create the disk image with dd**
>      sudo dd if=/dev/disk2 of=foo.bar.img.dd bs=1m

---
