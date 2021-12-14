# tornado development environment setup

```sh
cat /etc/*elease
CentOS Linux release 7.6.1810 (Core) 
NAME="CentOS Linux"
VERSION="7 (Core)"
ID="centos"
ID_LIKE="rhel fedora"
VERSION_ID="7"
PRETTY_NAME="CentOS Linux 7 (Core)"
ANSI_COLOR="0;31"
CPE_NAME="cpe:/o:centos:centos:7"
HOME_URL="https://www.centos.org/"
BUG_REPORT_URL="https://bugs.centos.org/"

CENTOS_MANTISBT_PROJECT="CentOS-7"
CENTOS_MANTISBT_PROJECT_VERSION="7"
REDHAT_SUPPORT_PRODUCT="centos"
REDHAT_SUPPORT_PRODUCT_VERSION="7"

CentOS Linux release 7.6.1810 (Core) 
CentOS Linux release 7.6.1810 (Core) 
```


(root)
```sh
# development environment
pip3 install virtualenv
virtualenv <name>
cd <name>
source bin/activate
mkdir <business code folder>
pip install tornado
pip install sqlalchemy
pip install aiomysql
# mongodb for logging
# pip install motor

# database
yum install mariadb-server
systemctl start mariadb.service
systemctl enable mariadb
# setup password ...
mysql_secure_installation

# nginx
yum install nginx
systemctl start nginx
# enable Nginx to start when your system boots
systemctl enable nginx
```

nginx: `/etc/nginx/conf.d/`
```
mkdir <name>.conf
```

<!-- 

cmd for myself
```sh
pip install sqlacodegen
./importDatabase.sh test ./library/dao.py
``` 

`importDatabase.sh`:
```sh
sqlacodegen --noclasses mysql+pymysql://root:@localhost/$1 > $2
```
-->

```sh
#  -y, --assumeyes       answer yes for all questions
yum install supervisor -y

# mkdir /etc/supervisor
# echo_supervisord_conf > /etc/supervisor/supervisord.conf
# mkdir /etc/supervisor/conf.d
systemctl start supervisord
systemctl enable supervisord
```

Add this to `/etc/supervisor.conf`
```conf
[include]
# files = supervisord.d/*.ini
files = supervisord.d/*.conf
```

and add your configuration file under the folder `/etc/supervisord.d`, eg: `/etc/supervisord.d/common.conf`
```conf
[program:helloworld]
directory=/project/helloworld/code
command=/project/helloworld/bin/python run.py
# autostart=true
# below fix: Supervisor FATAl Exited too quickly (process log may have details)
startsecs=0
autorestart=true
stdout_logfile=/var/log/someplace/helloworld.log
stderr_logfile=/var/log/someplace/helloworld.log
stopasgroup=true
```

and load config:
```sh
supervisorctl reread
supervisorctl update
```

- [mongodb setup](./2020-01-10-mongodb.md)

### Refs

- [How to install MariaDB on CentOS 7 / RHEL 7](https://mariadb.com/resources/blog/installing-mariadb-10-on-centos-7-rhel-7/)
- [How To Install Nginx on CentOS 7](https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-centos-7)
- [Install and Configure Supervisor on Centos 7](https://fitdevops.in/install-and-configure-supervisor-on-centos-7/)