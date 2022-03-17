# raspberry

## SSH

```sh
sudo raspi-config

# Interface Options > SSH > YES
# change default password
passwd pi

# check status
systemctl status ssh
```

## WIFI

When login:
```sh
Wi-Fi is currently blocked by rfkill.
Use raspi-config to set the country before use.

# Localisation Options > Locale > (press space) zh_CN.GB2312, zh_CN.GB18030, zh_CN.GBK, zh_CN.UTF-8 > zh_CN.UTF-8
# Timezone
# WLAN Country > <your country (China for me)>
reboot

# scan wifi
sudo iwlist wlan0 scan
```


## reset password

add `init=/bin/sh` at the end of `cmdline.txt`

```sh
mount -o remount, rw /

passwd pi

sync

exec /sbin/init
```

- [【树莓派】忘记用户pi密码，如何重置密码](https://www.cnblogs.com/YaoYing/p/12842577.html)

## keyborad related
show `@` fro `"`:
```sh
sudo raspi-config
Localisation Options > Keyboard >Generic 104-key PC > Other >English (US) > The default for the keyboard layout > no compose key
```



You’re going to be using a utility on Raspbian called `wpa_cli`. This handles wireless configuration and writes its configuration into `/etc/wpa_supplicant/wpa_supplicant.conf`.

```sh

wpa_cli status

# Selected interface '<name>'

```

## disk

```sh
df -h   #查看当前磁盘大小
cat /sys/block/mmcblk0/mmcblk0p2/start   # 查看第二分区的起始地址，后面会用到
```

- [玩玩树莓派之扩展SD卡剩余空间](https://www.jianshu.com/p/6588f935d41c)