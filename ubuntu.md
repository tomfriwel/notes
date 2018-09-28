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
```