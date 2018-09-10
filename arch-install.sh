#!/bin/bash

loadkeys us

timedatectl set-ntp true
# timedatectl set-timezone 

## Partitioning!
parted --script -a optimal /dev/sda1 \
  mklabel msdos \
  mkpart primary ext4 1 500M  \
  mkpart primary 500M 100% \
  set 2 lvm on \
  quit

mkfs.ext4 /dev/sda1
pvcreate /dev/sda2
vgcreate arch /dev/sda2

# 20G min, can expand later
lvcreate -L 8G -n root arch
lvcreate -L 2G -n home arch
lvcreate -L 4G -n var arch
lvcreate -L 2G -n log arch
lvcreate -L 2G -n audit arch
lvcreate -L 2G -n swap arch

mkfs.ext4 /dev/arch/root
mkfs.ext4 /dev/arch/home
mkfs.ext4 /dev/arch/var
mkfs.ext4 /dev/arch/log
mkfs.ext4 /dev/arch/audit

mkswap /dev/arch/swap
swapon /dev/arch/swap

# mount things
mkdir -p /mnt/
mount /dev/arch/root /mnt
mkdir -p /mnt/{boot,var,home}
mount /dev/sda1 /mnt/boot
mount /dev/arch/var /mnt/var
mount /dev/arch/home /mnt/home
mkdir -p /mnt/var/log
mount /dev/arch/log /mnt/var/log
mkdir -p /mnt/var/log/audit
mount /dev/arch/audit /mnt/var/log/audit

# pacstrap
pacstrap /mnt base vim wget python2 python3 openssh sudo

genfstab -U /mnt >> /mnt/etc/fstab

# Chroot!
cat << EOS | arch-chroot /mnt
ln -sf /usr/share/zoneinfo/Universal /etc/localtime
hwclock --systohc

echo node.localdomain > /etc/hostname
cat <<EOF>/etc/hosts
127.0.0.1   localhost.localdomain localhost
::1         localhost.localdomain localhost
127.0.1.1   node.localdomain node
EOF

# set password
echo 'root:password' | chpasswd

# set up dhcp
cat <<EOF>/etc/systemd/network/20-wired.conf
[Match]
name=enp0s3

[Network]
DHCP=ipv4
EOF

# set up booting
sed -i '/^HOOKS/ s/block filesystems/block lvm2 filesystems/g' /etc/mkinitcpio.conf
mkinitcpio -p linux

# install grub
pacman -Syu grub
grub-install /dev/sda
sed -i '/^GRUB_PRELOAD_MODULES/ s/"$/ lvm"/g' /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

# start ssh
systemctl enable sshd
systemctl start sshd
useradd -m admin
echo 'admin:password' | chpasswd

# set up sudoers
echo 'admin ALL=(ALL) ALL: ALL' >> /etc/sudoers.d/admin
echo 'admin ALL=(root) NOPASSWD: /usr/bin/pacman' >> /etc/sudoers.d/admin

# exit, unmount, reboot
exit
EOS
umount -R /mnt
reboot
