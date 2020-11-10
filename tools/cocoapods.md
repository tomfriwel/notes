# CocoaPods

#### mirror

[清华大学开源软件镜像站 - CocoaPods 镜像使用帮助](https://mirrors.tuna.tsinghua.edu.cn/help/CocoaPods/)

#### [git clone error: RPC failed; curl 56 OpenSSL SSL_read: SSL_ERROR_SYSCALL, errno 10054](https://stackoverflow.com/a/49728862/6279975)

`$ pod install` error:
```shell
[!] Error installing Flipper
[!] /usr/local/bin/git clone https://github.com/facebook/Sonar.git /var/folders/09/1fwhd4w97ms9_r6rv6s8g96r0000gn/T/d20201109-30955-14m926y --template= --single-branch --depth 1 --branch v0.54.0

Cloning into '/xxx'...
error: RPC failed; curl 56 LibreSSL SSL_read: SSL_ERROR_SYSCALL, errno 60
fatal: the remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed

```

`$ git config http.postBuffer 524288000`