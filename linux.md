### virtualenv

```shell
virtualenv alpha
cd alpha/
source bin/activate
pip install sqlalchemy pymysql
mkdir code
```

### inner outter network

```
sudo vim /etc/resolv.conf
find / -name hosts
sudo find / -name hosts
sudo vim /etc/hosts
ping address
```

### all read

`$ sudo chmod a+r file`


### DNS hosts解析

DNS将域名解析成IP地址，但如果域名被劫持或者别人没有域名想要借用别人的，这是后可以在hosts添加相应的记录，强制域名解析到指定IP地址。

### Create SFTP account with folder access limit.
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


### View Intranet and extranet IP addresses

Intranet: `$ ifconfig -a`

Extranet: `$ curl ifconfig.me`

[linux 查看内网IP和外网IP](https://www.cnblogs.com/gyrgyr/p/11607904.html)

### `lstat`

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

[What algorithm does git use to detect changes on your working tree?](https://stackoverflow.com/questions/4075528/what-algorithm-does-git-use-to-detect-changes-on-your-working-tree/4075667)


### View file's ctime, mtime

`$ stat [filepath]`

[Linux如何查看文件的创建、修改时间？](https://www.cnblogs.com/yizhipanghu/p/9634325.html)


### [How to gzip and keep original file on Unix or Linux command line](https://www.cyberciti.biz/faq/how-to-gzip-and-keep-original-file-on-unix-or-linux-command-line/)

`$ gzip -c Friday-Comic.jpg > Friday-Comic-1.jpg.gz`

### humanize file size

`$ ls -lh` or `$ ll -h`

[[Linux技巧] 让ls -l和df命令显示的文件大小可读性增强](https://www.cnblogs.com/unimous/archive/2011/05/17/2049459.html)

### view linux info

```
$ cat /proc/version
$ uname -a
$ lsb_release -a
```

[查看Linux系统版本信息](https://www.linuxidc.com/Linux/2016-05/131749.htm)


### File recovery

[linux误删文件怎么恢复](https://jingyan.baidu.com/article/2d5afd69bc7dfec4a2e28e89.html)


### view port and kill

```
lsof -i:3000
kill [PID]
```

[How to kill a process listening on a port in linux](https://codippa.com/how-to-kill-a-process-listening-on-a-port-in-linux/)

### View process run time

```bash
$ ps -p [PID] -o etime
    ELAPSED
   01:41:02
```

### Improve readability

```bash
ls [PATH] -lh

# or
ll [PATH] -h
```

### Copy all files in folder to another

`$ cp -R /folderA/. /folderB/`

`-R`参数，表示递归处理，将指定目录下的所有文件与子目录一并处理

[linux中复制文件夹的所有文件到指定目录](https://www.cnblogs.com/alonely/p/9382736.html)

### Create/Delete soft link

```bash
# file(absolute path)
`ln -s {source-filename} {symbolic-filename}`

# folder(absolute path)
`ln -s {source-dir-name}/ {symbolic-dir-name}/`

# delete
`rm linkname`
`unlink linkname`
```


- [How to: Linux / UNIX create soft link with ln command](https://www.cyberciti.biz/faq/creating-soft-link-or-symbolic-link/#:~:text=Getting%20help%20about%20the%20ln%20command%20%20,existing%20destination%20files%20%2012%20more%20rows%20)
[Linux Delete Symbolic Link ( Softlink )](https://www.cyberciti.biz/faq/linux-remove-delete-symbolic-softlink-command/#:~:text=%20Linux%20Delete%20Symbolic%20Link%20%28%20Softlink%20%29,Remove%20Symbolic%20Link%20Command%20Options.%20%20More%20)

### View a file's line number

`wc -l filename` 就是查看文件里有多少行

`wc -w filename` 看文件里有多少个word。

`wc -L filename` 文件里最长的那一行是多少个字。

[linux查看文件有多少行(WC)](https://www.cnblogs.com/yanyujie/archive/2018/03/03/8495921.html)

### location

`$ ps -ef|grep python`

### chown

`$ chown root:root /xxx/xxx`

- [chown -R命令的使用](https://www.cnblogs.com/fengli9998/p/6112808.html)


### Compress

```shell
# compress
tar czf name_of_archive_file.tar.gz name_of_directory_to_tar

# decompress
tar zxvf name_of_archive_file.tar.gz

# decompress to other directory
tar -xvf name_of_archive_file.tar.gz -C /path/to/directory
```

- [Compress a folder with tar?](https://unix.stackexchange.com/a/46971/238250)
- [How to Extract Tar Files to Specific or Different Directory in Linux](https://www.tecmint.com/extract-tar-files-to-specific-or-different-directory-in-linux/)


### CentOS Apache Nginx

```sh
# port
netstat -tlnp
```

- [How to configure Nginx as a reverse proxy for Apache on CentOS](https://www.hugeserver.com/kb/configure-nginx-reverse-proxy-apache-centos/)

