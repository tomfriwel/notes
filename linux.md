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
sudo useradd -s /sbin/nologin -M sftpUserXXX
sudo passwd sftpUserXXX
sudo mkdir /xxx/xxx
sudo chown root:root /xxx/xxx
sudo chmod 755 /xxx/xxx

# set access folder

sudo vim /etc/ssh/sshd_config
```

Editing sshd_config:
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
Match User xxx1
    X11Forwarding no
    AllowTcpForwarding no
    ChrootDirectory /xxx
    ForceCommand internal-sftp


Match User xxx2
    X11Forwarding no
    AllowTcpForwarding no
    ChrootDirectory /xxxx
    ForceCommand internal-sftp
```

`Match User` match which user, `ChrootDirectory` limit matched user accessing folder.


Restart:

`$ sudo service sshd restart`

Addition:
```
# View accounts
more /etc/passwd
```

[Linux 限制SFTP用户只能访问某个目录](https://blog.csdn.net/qin_weilong/article/details/69486104)
[Linux创建用户，SFTP只允许访问指定目录](https://www.cnblogs.com/hark0623/p/11051133.html)
[Linux - 设置SFTP服务用户目录权限](https://www.cnblogs.com/jiqing9006/p/8243161.html)


#### View Intranet and extranet IP addresses

Intranet: `$ ifconfig -a`

Extranet: `$ curl ifconfig.me`

[linux 查看内网IP和外网IP](https://www.cnblogs.com/gyrgyr/p/11607904.html)

#### `lstat`

`$ os.lstat(filepath)`

```
struct stat {
    dev_t     st_dev;     /* ID of device containing file */
    ino_t     st_ino;     /* inode number */
    mode_t    st_mode;    /* protection */
    nlink_t   st_nlink;   /* number of hard links */
    uid_t     st_uid;     /* user ID of owner */
    gid_t     st_gid;     /* group ID of owner */
    dev_t     st_rdev;    /* device ID (if special file) */
    off_t     st_size;    /* total size, in bytes */
    blksize_t st_blksize; /* blocksize for file system I/O */
    blkcnt_t  st_blocks;  /* number of 512B blocks allocated */
    time_t    st_atime;   /* time of last access */
    time_t    st_mtime;   /* time of last modification */
    time_t    st_ctime;   /* time of last status change */
};
```