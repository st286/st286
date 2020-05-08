#Installation guide

MYPC="st-pc"


echo "IMPORTANCE: First, make the disk parted ready for install. 
	====================================================
	Parted the disks.     (fdisk)
	Format the partitions.(mkfs)
	Mount the file systems.(mount)
	====================================================

	Mount poit	Partition		Partition type			Suggested size
	----------------------------------------------------------------------------------
	/mnt/boot	/dev/sdX1	Boot flag:YES(BIOS with MBR)	512MB
					EFI system (UEFI with GPT)
	/mnt		/dev/sdX2	linux 				more than 15G
	[SWAP]		/dev/sdX3	linux swap			more than 512MiB
	/mnt/home	/dev/sdX4	linux or fat			more than 20G
	/mnt/other	/dev/sdX5	linux or fat			
	----------------------------------------------------------------------------------"

echo "Format partition:
	---------------------------------------------------
	mkfs.fat -F32 /dev/sdX1
	mkfs.ext4 /dev/sdXn
	mkswap /dev/sdX3
	swapon /dev/sdX3"
echo "Mount file systems:
	---------------------------------------------------
	mount /dev/sdX2 /mnt
	mkdir -p /mnt/boot
	mount /dev/sdX1 /mnt/boot
	mkdir -p /mnt/home
	mount /dev/sdX4 /mnt/home
	mkdir -p /mnt/other
	mount /dev/sdX1 /mnt/other"


read -p "fdisk -l..."

fdisk -l

read -p "lsblk..."

lsblk

###################################################


########################

read -p "Verify the boot mode:"

ls /sys/firmware/efi/efivars

read -p "test ip:"

ip link

read -p "ping :"

ping -c 5 archlinux.org


prompt "Continue installation?"

read -p "Update the system clock:"

timedatectl set-ntp true

read -p "time status:"

timedatectl status





read -p  "add mirror servers , /etc/pacman.d/mirrorlist:"

TEMPFILE=$(mktemp) || exit 1
echo "the tempfile is $TEMPFILE"

echo "Server = http://mirrors.aliyun.com/archlinux/$repo/os/$arch" >> $TEMPFILE
echo "Server = http://mirrors.163.com/archlinux/$repo/os/$arch" >> $TEMPFILE

cat /etc/pacmacd n.d/mirrorlist >> $TEMPFILE

cat $TEMPFILE > /etc/pacmacd n.d/mirrorlist

cat /etc/pacmacd n.d/mirrorlist | less

rm -f $TEMPFILE




read -p "pacstrap base linux firmware:"

pacstrap /mnt base base-devel linux linux-firmware

pacstrap /mnt dhcpcd iw iwd connman

pacstrap /mnt nano


#Configure the system

read -p "gentstab:"

genfstab -U /mnt >> /mnt/etc/fstab

read -p "arch-chroot /mnt:"

arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

hwclock --systohc


echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen

locale-gen

echo "LANG=en_US.UTF-8" >> /etc/locale.conf




echo $MYPC > /etc/hostname

echp "127.0.0.1	localhost" >> /etc/hosts
echo "::1		localhost" >> /etc/hosts
echo "127.0.1.1	$MYPC.localdomain	$MYPC" >> /etc/hosts


read -p "change root password:"

passwd


echo "Boot loader ..... install Grub. ...."


