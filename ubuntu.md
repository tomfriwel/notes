#### Check version

`$ lsb_release -a`

[How do I check the version of Ubuntu I am running? [duplicate]](https://askubuntu.com/questions/686239/how-do-i-check-the-version-of-ubuntu-i-am-running)

#### cpu infomation

`$ cat /proc/cpuinfo`

[Ubuntu: Find CPU Information / Speed](https://www.cyberciti.biz/faq/ubuntu-cpu-information/)


#### backup web
```
/var/www
/etc/apache2/sites-available

1.数据备份
a.文件数据打包

cd /var/www/html
tar -czvf html.tar.gz thml 网站目录(如/var/www/html) 

b.MySQL数据导出 

mysqldump -utest -p testdb > testdb.db

2.数据恢复

a.数据恢复(wget获取远程文件) 

cd /var/www
wget http://www.xxx.com/html.tar.gz(获取文件) 
tar -xzvf html.tar.gz 

b.MySQL数据导入 

*请先在phpmyadmin新建相应数据库和用户(与原数据库、用户同名) 

wget http://www.xxx.com/testdb.db
mysql -utest -p testdb <testdb.db
```
[linux下网站数据和数据库的备份与恢复](https://www.aliyun.com/jiaocheng/162757.html)

#### tar
tar -xzvf file.tar.gz //解压tar.gz


#### [Ubuntu16.04下搭建web服务器(php+MySQL+apache2)](https://blog.csdn.net/weixin_41978547/article/details/79886744)

```
apt-get install mysql-server mysql-client

apt-get install apache2

apt-get install php7.0 libapache2-mod-php7.0

sudo a2enmod rewrite

a2ensite xxx.conf

# if https
a2enmod ssl


# python apache
# compile install mod_wsgi
apt-get update
apt-get install apache2-dev
# https://modwsgi.readthedocs.io/en/develop/user-guides/quick-installation-guide.html

cp ..../mods-available.so ...../mods-available/
LoadModule wsgi_module ./mods-available/mod_wsgi.so

# if webpy
pip install web.py

# if python3
apt-get install --reinstall libpython2.7-stdlib

# if No module named 'urlparse'

add:
```
try:
    from urllib.parse import urlparse
except ImportError:
    from urlparse import urlparse
```

#---
pip install mod_wsgi
# error, update to latest,and use python 3
apt autoremove
apt-get install python3
# use python3 as default
alias python=python3
pip install virtualenv

#pip for python3
wget --no-check-certificate  https://pypi.python.org/packages/source/s/setuptools/setuptools-19.6.tar.gz#md5=c607dd118eae682c44ed146367a17e26

tar -zxvf setuptools-19.6.tar.gz

cd setuptools-19.6.tar.gz

python3 setup.py build

python3 setup.py install

pip install --upgrade setuptools

#
wget --no-check-certificate  https://pypi.python.org/packages/source/p/pip/pip-8.0.2.tar.gz#md5=3a73c4188f8dbad6a1e6f6d44d117eeb

tar -zxvf pip-8.0.2.tar.gz

cd pip-8.0.2

python3 setup.py build

python3 setup.py install
```

[How to set python 3 as default interpreter in Ubuntu 14.04 [duplicate]](https://askubuntu.com/questions/590027/how-to-set-python-3-as-default-interpreter-in-ubuntu-14-04)

[install pip3 for python 3.x](https://www.cnblogs.com/wenchengxiaopenyou/p/5709218.html)