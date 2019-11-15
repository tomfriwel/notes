#### virtualenv

```shell
virtualenv alpha
cd alpha/
source bin/activate
pip install sqlalchemy pymysql
mkdir code
```

#### inner outter network

```
sudo vim /etc/resolv.conf
find / -name hosts
sudo find / -name hosts
sudo vim /etc/hosts
ping address
```

#### all read

`$ sudo chmod a+r file`


#### DNS hosts解析

DNS将域名解析成IP地址，但如果域名被劫持或者别人没有域名想要借用别人的，这是后可以在hosts添加相应的记录，强制域名解析到指定IP地址。

#### Create SFTP account with folder access limit.
```
useradd -s /sbin/nologin -M sftpUserXXX
passwd sftpUserXXX
mkdir /xxx/xxx
chown root:root /xxx/xxx
chmod 755 /xxx/xxx

# set access folder

vim /etc/ssh/sshd_config
```

Edit sshd_config:
```
# override default of no subsystems
# Subsystem     sftp    /usr/libexec/openssh/sftp-server
Subsystem sftp internal-sftp

# Example of overriding settings on a per-user basis
#Match User anoncvs
#       X11Forwarding no
#       AllowTcpForwarding no
#       PermitTTY no
#       ForceCommand cvs server
Match User xxx
    X11Forwarding no
    AllowTcpForwarding no
    ChrootDirectory /xxx
    ForceCommand internal-sftp


Match User xxxx
    X11Forwarding no
    AllowTcpForwarding no
    ChrootDirectory /xxxx
    ForceCommand internal-sftp
```

`Match User` match which user, `ChrootDirectory` limit matched user accessing folder.

Addition:
```
# View accounts
more /etc/passwd
```