## Debian Install with BTRFS+XFCE+TIMESHIFT

Original Source: JustAGuy Linux - https://youtu.be/9htEaXAXfdg?si=HyhfJDSwsBf1RrVQ

### Download Net install/burn/start install via Advanced Options>Expert Install

### Do all the normal install crap

### This starts at: Partition Disks

Choose Manual

Select your destination install disk

Create new partition table, choose 'gpt'

Select the Free Space, Create a new partition

Input 500M for the size, location Beginning

Arrow down to 'Use as:' and select EFI System Partition. Select done.

Select the remaining Free Space, create new partition

Select btrfs file system

Select Finish at the bottom.

Ignore the swap space nag. Use ZRAM after install.

Write the changes to disk

Before installing the base system do the following:

### Setup btrfs subvolumes

Ctrl-Alt-<F2> to enter the terminal

umount /target/boot/efi

umount /target

mount /dev/sda2 /mnt

cd /mnt 

mv @rootfs/ @

btrfs su cr @home

btrfs su cr @root

btrfs su cr @log

btrfs su cr @tmp

btrfs su cr @opt

mount -o noatime,compress=zstd,subvol=@ /dev/sda2 /target

mkdir -p /target/boot/efi

mkdir -p /target/home

mkdir -p /target/root

mkdir -p /target/var/log

mkdir -p /target/tmp

mkdir -p /target/opt

mount -o noatime,compress=zstd,subvol=@home /dev/sda2 /target/home

mount -o noatime,compress=zstd,subvol=@root /dev/sda2 /target/root

mount -o noatime,compress=zstd,subvol=@log /dev/sda2 /target/var/log

mount -o noatime,compress=zstd,subvol=@tmp /dev/sda2 /target/tmp

mount -o noatime,compress=zstd,subvol=@opt /dev/sda2 /target/opt

mount /dev/sda1 /target/boot/efi

nano /target/etc/fstab

Scroll down to the UUID for the '/ btrfs' entry

Edit the options. Delete defaults and put this in: 

noatime,compress=zstd,subvol=@  

Then you have to do this same deal for every subvolume entry

UUID={number} / btrfs noatime,compress=zstd,subvol=@ 0  0 
UUID={number} /home btrfs noatime,compress=zstd,subvol=@home 0  0 
UUID={number} /root btrfs noatime,compress=zstd,subvol=@root 0  0 
UUID={number} /var/log btrfs noatime,compress=zstd,subvol=@log 0  0 
UUID={number} /tmp btrfs noatime,compress=zstd,subvol=@tmp 0  0 
UUID={number} /opt btrfs noatime,compress=zstd,subvol=@opt 0  0 

Save and quit. Then go back to the installer.

Ctrl-Alt-<F1>

Then select install the base system

Choose the kernel to install: linux-image-amd64

Choose generic: include all available drivers

Carry on with the installation as per options you want

Choose XFCE for desktop environment (or whatever).

### Install & Config ZRAM as per notes

sudo systemctl restart zramswap.service

### Install Essential packages and TimeShift

Open TimeShift. Config the schedule as you want (Monthly, 1; Weekly 1; Daily 7).

Create a snapshot. Comment it as initial.

