```
loadkeys us
setfont ter-120n
iwctl
device list
station <name> scan
station <name> get-networks
station <name> connect <SSID>
```
For formatting drives, use type 23 for root system and type 142 for extended boot.
```
mkfs.ext4 /dev/<root partition>
mkfs.vfat -F 32 /dev/<extended boot partition>
mount /dev/<root partition> /mnt
mount --mkdir /dev/<efi partition> /mnt/efi
mount --mkdir /dev/<extended boot partition> /mnt/boot
```
Copy mirrorlist
```
ln -sf /usr/share/zoneinfo/US/Eastern /etc/localtime
locale-gen
nano /etc/locale.gen
nano /etc/locale.conf
nano /etc/vconsole.conf
nano /etc/hostname
```

