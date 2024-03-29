# Key Signs

* Command ⌘
* Shift ⇧
* Option ⌥
* Control ⌃
* Caps Lock ⇪

### Change screenshot location

`$ defaults write com.apple.screencapture location /path/of/screenshot/`

`$ killall SystemUIServer`

[How to Change Screenshot Save Location](https://discussions.apple.com/docs/DOC-9081)


### Calendar Subscribe

[Calendar Help](https://support.apple.com/zh-cn/guide/calendar/subscribe-to-calendars-icl1022/mac)

[Calendar**labs**.com](https://www.calendarlabs.com/ical-calendar/)

### [How to take a screenshot on your Mac](https://support.apple.com/en-gb/HT201361)

- Whole Screen: `Shift + Command + 3`
- Select Area: `Shit + Command + 4`
- A Window: `Shift + Command + 4` then press `Space`


### [Easily Open A Second Finder Window From The Same Folder [OS X Tips]](https://www.cultofmac.com/228451/easily-open-a-second-finder-window-from-the-same-folder-os-x-tips/)


### [修改mac默认python版本 为python3](https://www.jianshu.com/p/ee8dd8d78232)


### Restart SSH on Mac Terminal (High Sierra)

```sh
sudo launchctl stop com.openssh.sshd
sudo launchctl start com.openssh.sshd
```

[gravefolk/restart-ssh](https://gist.github.com/gravefolk/96b79c321f7e6e52457f8a6fef603eac)

[Command Line SSH restart Mac OSX Mountain Lion](https://superuser.com/questions/478035/command-line-ssh-restart-mac-osx-mountain-lion)

### hosts file path

`/private/etc/hosts`

### Forbid Apps From Launching at Startup

- [How to Stop Mac Apps From Launching at Startup](https://www.pcmag.com/how-to/stop-mac-apps-from-launching-at-startup)
- [How do I stop the Adobe Creative Cloud app from auto-launching on login?](https://apple.stackexchange.com/a/138945/237294)

```shell
launchctl unload -w /Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist
launchctl load -w /Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist

sudo rm /Library/LaunchAgents/com.adobe.AdobeCreativeCloud.plist
```

### [Fix “Cannot install in Homebrew on ARM processor in Intel default prefix (/usr/local)!”](https://database.guide/fix-cannot-install-in-homebrew-on-arm-processor-in-intel-default-prefix-usr-local/)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### [https://blog.csdn.net/LIUXIAOXIAOBO/article/details/127024186](LibreSSL SSL_read: error:02FFF03C:system library:func(4095):Operation timed out, errno 60)

use `https://github.com.ipaddress.com/www.github.com` check ip, copy value in ***IP Address***.

use `sudo vi /etc/hosts`, add `[ip address] github.com`.


### [MacBook使用笔记：安装Homebrew（M1）](https://zhuanlan.zhihu.com/p/372576355)

```sh
/bin/zsh -c "$(curl -fsSL https://gitee.com/cunkai/HomebrewCN/raw/master/Homebrew.sh)"
```

配置命令行路径：

```sh
# HomeBrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
# HomeBrew END
```

if apple silicon:
```sh
# HomeBrew
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
# HomeBrew END
```

### Error: No such file or directory @ rb_sysopen - ...

```sh
==> Installing php dependency: apr-util
==> Pouring apr-util-1.6.1_4.arm64_ventura.bottle.tar.gz
Error: No such file or directory @ rb_sysopen - 
```

单独安装`$ brew install apr-util`