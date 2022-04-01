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

### Config when write os image to SD card

- [How To Configure WiFi on Raspberry Pi: Step By Step Tutorial](https://www.seeedstudio.com/blog/2021/01/25/three-methods-to-configure-raspberry-pi-wifi/)

### Terminal(not success)

When login:
```sh
Wi-Fi is currently blocked by rfkill.
Use raspi-config to set the country before use.
# WLAN Country > [your country (China for me)]

# lang setting
# Localisation Options > Locale > (press space) zh_CN.GB2312, zh_CN.GB18030, zh_CN.GBK, zh_CN.UTF-8 > zh_CN.UTF-8
# Timezone

# after setting
reboot

# scan wifi (in a mess)
sudo iwlist wlan0 scan
```

add name and password of wifi to `/etc/wpa_supplicant/wpa_supplicant.conf`:
```sh
# ...
network={
    ssid="[wifi name]"
    psk="[wifi password]"
    key_mgmt=WPA-PSK
}
```

```sh
# add 
sudo wpa_cli -i wlan0 reconfigure

# [Failed to connect to non-global ctrl_ifname: wlan0 error: No such file or directory](https://raspberrypi.stackexchange.com/questions/84277/failed-to-connect-to-non-global-ctrl-ifname-wlan0-error-no-such-file-or-direct)
sudo ifconfig wlan0 up
pi@raspberrypi:~ $ sudo killall wpa_supplicant
pi@raspberrypi:~ $ sudo wpa_supplicant -i wlan0 -D wext -c/etc/wpa_supplicant/wpa_supplicant.conf -B

sudo wpa_cli -i wlan0 reconfigure
```

`$ arp -a | grep rasp` find raspberry ip address.

- [Connect to wifi from terminal raspberry pi](https://bytesofgigabytes.com/raspberrypi/connect-to-wifi-from-terminal-raspberry-pi/#:~:text=%20Connect%20to%20WiFi%20from%20terminal%20raspberry%20pi,make%20sure%20your%20WiFi%20is%20ON%20More%20)
- [Set up WiFi through the command line terminal on Raspberry Pi](https://ericplayground.com/2017/11/06/set-up-wifi-through-the-command-line-terminal-on-raspberry-pi/#:~:text=1%20Getting%20WiFi%20network%20details.%20To%20scan%20for,to%20set%20up%20multiple%20configurations%20for%20wireless%20networking.)


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

## bluetooth

`rfkill`: Tool for enabling and disabling wireless devices.

```sh
bluetoothctl
list
scan on
# Failed to start discovery: org.bluez.Error.NotReady
# view wireless devices status
rfkill list
# 0: phy0: Wireless LAN
#         Soft blocked: no
#         Hard blocked: no
# 1: hci0: Bluetooth
#         Soft blocked: yes <<<
#         Hard blocked: no
# enter
rfkill unblock all
rfkill list
# 0: phy0: Wireless LAN
#         Soft blocked: no
#         Hard blocked: no
# 1: hci0: Bluetooth
#         Soft blocked: no
#         Hard blocked: no
bluetoothctl
scan on

# recommend 升级安装蓝牙相关软件包
# -y say yes
sudo apt-get update
sudo apt-get upgrade -y
# if:
# The following package was automatically installed and is no longer required:
#   libfuse2
# then: sudo apt autoremove -y
sudo apt-get dist-upgrade -y
sudo apt-get install pi-bluetooth bluez bluez-firmware blueman
```

- [用蓝牙实现两个树莓派之间的通信](https://blog.csdn.net/qq_50866711/article/details/115328832?utm_medium=distribute.pc_aggpage_search_result.none-task-blog-2~aggregatepage~first_rank_ecpm_v1~rank_v31_ecpm-1-115328832.pc_agg_new_rank&utm_term=两个树莓派之间通信&spm=1000.2123.3001.4430)
- [bluetooth.service running, but bluetoothctl says "org.bluez.Error.NotReady"](https://unix.stackexchange.com/questions/508221/bluetooth-service-running-but-bluetoothctl-says-org-bluez-error-notready)

### Git setup

```sh
sudo nano /etc/apt/sources.list

# ---- add to file:
deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main contrib non-free rpi
#deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main contrib non-free rpi
# ---- add end

sudo nano /etc/apt/sources.list.d/raspi.list
# ---- add
deb http://mirrors.ustc.edu.cn/archive.raspberrypi.org/debian/ buster main ui
# ---- add end

sudo apt-get update
sudo apt-get upgrade

# git
sudo apt-get install git
```

### LCD hardware drive
```sh
git clone https://github.com/lcddiy/LCD-show.git
```

- [树莓派4B安装Git](https://www.jianshu.com/p/333183731bd1)