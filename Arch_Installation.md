# Boot from the USB
Before Starting installation, read all notes of this file first.
Good Luck!

### Connect to the internet
##### iwctl
```bash
($) iwctl
[iwd] device list # show avaliable devices
[iwd] station _device_ scan
[iwd] station <device> connect-hidden <ssid> # connect to a hidden wifi
[iwd] station <device> connect <ssid> # connect to wifi
[iwd] exit

($) ping 8.8.8.8 # make sure that the internet is working
```
#### [SSH](https://wiki.archlinux.org/title/Install_Arch_Linux_via_SSH)
###### On the remote (target) machine
```bash
($) passwd # make a password
($) ip a # to get the device ip
```
##### On the local machine
```bash
($) ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null root@_ip.of.target
```

### Partitioning

#### List all partitions
```bash
($) lsblk
NAME        MAJ:MIN RM   SIZE RO TYPE MOUNTPOINTS
sda           8:0    0 223.6G  0 disk 
├─sda1        8:1    0   529M  0 part 
├─sda2        8:2    0   100M  0 part 
├─sda3        8:3    0    16M  0 part 
├─sda4        8:4    0 222.4G  0 part 
└─sda5        8:5    0   515M  0 part 
sdb           8:16   0 465.8G  0 disk 
└─sdb1        8:17   0 465.8G  0 part
sdc           8:32   0   1.8T  0 disk 
└─sdc1        8:33   0   1.8T  0 part
```
#### Start partitioning by cfdisk 
```bash
($) cfdesk /dev/sda # the name of the wanted hard drive
```

> Note: select gpt always

In the cfdisk menu
For the EFI partition, 512 MB is enough.
** If you want to install the boot loader on the Windows EFI partition, don't make an EFI partition, just mount the existed EFI partition.**
For the swap, it's not mandatory but if wanted, 2-8 GB will be good.
And the rest is for the root partition.
 
#### Mounting
##### Identify the partition types if you didn't do it in cfdisk

```bash
($) mkfs.ext4 /dev/sdXY # for the root parition
($) mkfs.fat -F 32 /dev/sdXY # for the EFI parition
# skip if you already have an EFI parition
($) mkswap /dev/sdXY # for the swap parition
```

##### Mounting the file system
```bash
($) mkdir -p /mnt
($) mount /dev/sdXY /mnt # the root parition
($) mkdir -p /mnt/boot
($) mkdir -p /mnt/boot/efi
($) mount /dev/sdXY /mnt/boot/efi # for the EFI partition
($) swapon /dev/sdXY # turn on the swap partition
```

> Note: run lsblk after every step to make sure everything is ok.

#### Installing the system

```bash
($) pacstrap /mnt base linux linux-firmware sof-firmware base-devel grub efibootmgr vim networkmanager os-prober
```

After running the previous command, it will download the system packages and will install it, if you found a problem with PKG you got this error  [sudo pacman -Syu fails with "error: failed to commit transaction (invalid or corrupted package)"](https://unix.stackexchange.com/questions/574493/sudo-pacman-syu-fails-with-error-failed-to-commit-transaction-invalid-or-cor),
run the following commands: 
```bash
($) pacman -Sy archlinux-keyring
($) pacman -Syu
```

#### Fstab
This step allows us to mount the partition automatically and for ever
```bash
($) genfstab /mnt # to see the content
($) genfstab /mnt > /mnt/etc/fstab
($) cat /mnt/etc/fstab # to make sure that the content is the same
```

#### Enter the system

```bash
($) arch-chroot /mnt
```

#### Timezone
```bash
($) ln -sf /usr/share/zoneinfo/Africa/Cairo /etc/localtime
($) date # make sure the time and date is right
($) hwclock --sysohc
```

#### Localization
```bash
($) vim /etc/locale.gen # Uncomment any Locale you want
($) locale-gen
($) echo "LANG=en_US.UTF-8" > /etc/locale.conf
```
#### Hostname
```bash
($) echo "your_host_name" > /etc/hostname # your device name
```

#### Root password
```bash
($) passwd # enter a good password and NEVER NEVER forget it
```
#### Add a user
```bash
($) useradd -m -G wheel -s /bin/bash my_name
($) passwd my_name # make your user password, make it different from the root is recommended
```

##### sudo Setup
```bash
($) EDITOR=vim visudo
# uncomment the "%wheel ALL=(ALL) ALL" line
# you will find it in the end
# if you want to use the command sudo without passowrd,
# uncomment the next line after the previous one
($) su my_name # swtich to the user
```

#### Enable some services
```bash
($) su # swtich to root
($) systemctl enable NetworkManager
```

#### GRUB

```bash
# install GRUB 
($) grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub

# Generate/Update GRUB config
($) grub-mkconfig -o /boot/grub/grub.cfg
```

If the second OS, like windows does not appear,
```bash
($) os-prober
($) vim /etc/default/grub
# uncomment/add GRUB_DISABLE_OS_PROBER=false line, you will find it at the end
($) os-prober
($) grub-mkconfig -o /boot/grub/grub.cfg
```

>Note: make sure that the Secure Boot is off in the Bios

If grub did not detect the other OS, just reboot your system, in the following step, and re do the `grub-mkconfig` step and `os-prober`.

#### DONE
```bash
($) umount -a # unmount everything
($) reboot # then remove the USBk
```

### Next steps after installation

##### Make sure the internet is working
```bash
($) ping 8.8.8.8
```

If the [WiFi is not working after rebooting](https://unix.stackexchange.com/questions/283722/how-to-connect-to-wifi-from-command-line)
Reconnect again by
```bash
($) ip link show # to get the interface name
# example: wlp6s0
($) nmcli d wifi connect Your_SSID password Your_Psswd_here ifname Your_interface
```
#### Install the Desktop environment
I highly recommend KDE Plasma but you can choose any thing

```bash
($) sudo pacman -S plasma sddm # it gonna take a long time to download and to intsll
```

After installation, we need to install some programs before we run the DM
```bash
($) sudo pacman -S konsole kate firefox neofetch
```

#### Start the DM
```bash
($) sudo systemctl enable --now sddm
```


# Congratulation!
