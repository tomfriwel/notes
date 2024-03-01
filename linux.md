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
```sh
sudo useradd -s /sbin/nologin -M sftpUserXXX
sudo passwd sftpUserXXX
sudo mkdir /xxx/xxx
sudo chown root:root /xxx/xxx
sudo chmod 755 /xxx/xxx
# sudo chown -R webUser.webUser images

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

tar czf name.tar.gz name_of_directory_to_tar

# multiple directories
tar -zcvf test3.tar.gz  test1 test2

# decompress
tar zxvf name_of_archive_file.tar.gz

# decompress to other directory
tar -xvf name_of_archive_file.tar.gz -C /path/to/directory
```

- [Compress a folder with tar?](https://unix.stackexchange.com/a/46971/238250)
- [How to Extract Tar Files to Specific or Different Directory in Linux](https://www.tecmint.com/extract-tar-files-to-specific-or-different-directory-in-linux/)
- [LINUX下想要直接压缩多个文件夹为tar.gz格式](https://blog.csdn.net/qiufeng_xinqing/article/details/44342731)


### CentOS Apache Nginx

```sh
# port
netstat -tlnp
```

- [How to configure Nginx as a reverse proxy for Apache on CentOS](https://www.hugeserver.com/kb/configure-nginx-reverse-proxy-apache-centos/)


### command: systemctl

```sh
# list enabled list
systemctl list-unit-files | grep enabled
```

- [How to list all enabled services from systemctl?](https://askubuntu.com/questions/795226/how-to-list-all-enabled-services-from-systemctl)


### [Failed to download metadata for repo‘AppStream’「CentOS」](https://baijiahao.baidu.com/s?id=1726476962079244840&wfr=spider&for=pc)

```sh
# problem
$ yum update
Repository epel is listed more than once in the configuration
CentOS Linux 8 - AppStream                                                                              74  B/s |  38  B     00:00    
Error: Failed to download metadata for repo 'appstream': Cannot prepare internal mirrorlist: No URLs in mirrorlist

# solution
$ cd /etc/yum.repos.d/
$ sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
$ sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

$ yum update -y
```

### find file contain specify text
```sh
grep -r "text to search" /search/path/* --exclude [file to exclude]
```

### give excute permission 赋予文件可执行权限

To use chmod to set permissions, we need to tell it:

- Who: Who we are setting permissions for.
- What: What change are we making? Are we adding or removing the permission?
- Which: Which of the permissions are we setting?

We use indicators to represent these values, and form short “permissions statements” such as u+x, where “u” means ” user” (who), “+” means add (what), and “x” means the execute permission (which).

```sh
chmod a+x <file>
chmod +x <file>
```

- [How to Use the chmod Command on Linux](https://www.howtogeek.com/437958/how-to-use-the-chmod-command-on-linux/)


### 1 后台执行命令 run background task

在Linux中，您可以通过在命令后添加`&`符号来让命令在后台执行。这样，您可以在不中断命令执行的情况下继续使用终端。例如，如果您想让`sleep 10`命令在后台运行，您可以这样做：

```sh
sleep 10 &
```

这将使`sleep 10`命令在后台运行，您可以立即在同一终端中执行其他命令。要查看后台进程的状态，您可以使用`jobs`命令。如果您想要将后台进程带到前台，可以使用`fg`命令，后面跟上进程的编号。例如：

```sh
fg %1
```

这将把编号为1的后台进程带到前台。


#### 1.1 kill task

要停止后台执行的命令，您可以使用`kill`命令。首先，您需要找到该进程的进程ID（PID）。可以使用`ps`命令或`pgrep`命令查找进程的PID。例如，如果您想要找到名为"sleep"的进程的PID，可以执行以下命令：

```sh
pgrep sleep
```

这将返回一个或多个与"sleep"相关的进程的PID。假设返回的PID为12345，要停止该进程，您可以执行以下命令：

```sh
kill 12345
```

这将发送一个默认的信号（SIGTERM）给进程，通常会导致进程终止。如果进程没有立即终止，您可以尝试发送一个更强烈的信号，如SIGKILL：

```sh
kill -9 12345
```

请注意，强制终止进程可能会导致数据丢失或其他副作用。在使用`kill -9`之前，请确保尝试使用默认信号（SIGTERM）终止进程。

#### 1.2 time

要查看特定PID的进程运行了多长时间，您可以使用`ps`命令的`-p`选项来显示指定PID的信息。例如，如果您想要查看PID为12345的进程运行了多长时间，可以执行以下命令：

```sh
ps -p 12345 -o pid,etime,cmd
```

这将返回类似以下内容的输出：

```sh
  PID     ELAPSED COMMAND
12345  12:34:56 sleep 10
```

在这个例子中，进程运行了12天34小时56分钟。请注意，这个时间是从进程启动到现在的时间，可能会随着时间的推移而增加。


#### 1.3 continue run

`nohup`（no hang up）是一个Unix命令，用于在退出终端会话后继续运行进程。当您在终端中执行一个命令时，该命令通常会在终端会话结束时终止。但是，有时您可能希望在会话结束后仍然继续运行某个命令。在这种情况下，您可以使用`nohup`命令。

`nohup`命令的基本语法如下：

```sh
nohup command [arguments] [> output-file] [2>&1] &
```

- `command`：要执行的命令。
- `[arguments]`：命令的可选参数。
- `[> output-file]`：将命令的输出重定向到指定的文件。如果省略此部分，输出将被重定向到名为`nohup.out`的文件。
- `[2>&1]`：将错误输出（文件描述符2）重定向到标准输出（文件描述符1）。这样，错误输出和标准输出都会被重定向到指定的输出文件或`nohup.out`文件。
- `&`：将命令放入后台执行。

以下是一个使用`nohup`命令的示例：

```sh
nohup sleep 10 > output.log 2>&1 &

# 追加
nohup sleep 10 > output.log 2>>&1 &
```

这将在后台运行`sleep 10`命令，并将输出重定向到`output.log`文件。即使您关闭终端窗口或断开SSH连接，`sleep 10`命令也将继续运行。

要查看使用`nohup`命令执行的进程，您可以使用`ps`命令或`pgrep`命令。例如，要查找与`nohup`相关的进程，可以执行以下命令：

```sh
ps aux | grep 'nohup'
```

或者：

```sh
pgrep -a -f 'nohup'
```


（以上回答来自腾讯混元助手）


```sh
# 后台执行，并追加输出到nohup.out
nohup sleep 10 > nohup.out 2>>&1 &

# 根据PID查看运行时间
ps -p 12345 -o pid,etime,cmd

# 查找相关命令
pgrep -a -f 'sleep 10'

# 查看后台任务（同一个会话）
jobs

# 调到前台执行
fg %1
```

整理成`sh`脚本`run_nohup.sh`：


```sh
#!/bin/bash

# 检查参数数量
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 \"<command>\""
    exit 1
fi

# 获取要执行的命令
command="$1"

# 将命令输出到 nohup.out 文件
echo "Running command: $command" >> nohup.out

# 使用 nohup 运行命令，并将输出追加到 nohup.out 文件
nohup $command >> nohup.out 2>&1 &
```